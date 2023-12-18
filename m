Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B1AB3986F
	for <linux-sound@vger.kernel.org>; Mon, 18 Dec 2023 11:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nv1DMvUT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15092C433C8;
	Mon, 18 Dec 2023 11:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702900474;
	bh=fp5DTorAXYWn78Likwb3eIQOQYRJQykBHO9Q/QU03uQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nv1DMvUTu9fG25GRAxTLVvs/8KTP23EXFqm6R8uzblqOCRWviwxhUBOORZ3DSqUc4
	 2tgQTJzXdybC4y7wcqPLnFq16mn2+LukVNifRQrDl1ejjkwv+qaxDQqsHa4XQjWjez
	 qpzQPmb7Df0E2KlIy4H6Hz8lBa8At7bVXxpe3p6/VcDGokyw8/p9u632R4S+aILR8T
	 Q3TfC7Mfsos3SLwmiBBVslVl8LHQcFQnwNmaN3D/VCD9fzilUIJTs7v4xe/rOWiuuJ
	 FMxzQGROHDgNYJ2qDptlw6NCYKEZVkKP2ahScWCAaYKdDbxgnPaWFEgpFfYoP0xn1G
	 DQMGL8qyGy84Q==
Date: Mon, 18 Dec 2023 17:24:29 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: linux-sound@vger.kernel.org, alsa-devel@alsa-project.org, tiwai@suse.de,
	broonie@kernel.org, vinod.koul@intel.com,
	Bard liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	srinivas.kandagatla@linaro.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	vijendar.mukunda@amd.com,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Shuming Fan <shumingf@realtek.com>, Jack Yu <jack.yu@realtek.com>,
	Oder Chiou <oder_chiou@realtek.com>
Subject: Re: [RFC PATCH 07/16] soundwire: bus: add API for BPT protocol
Message-ID: <ZYAy9ZM0o3uAk2qY@matsya>
References: <20231207222944.663893-1-pierre-louis.bossart@linux.intel.com>
 <20231207222944.663893-8-pierre-louis.bossart@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231207222944.663893-8-pierre-louis.bossart@linux.intel.com>

On 07-12-23, 16:29, Pierre-Louis Bossart wrote:
> Add definitions and helpers for the BPT/BRA protocol. Peripheral
> drivers (aka ASoC codec drivers) can use this API to send bulk data
> such as firmware or tables.
> 
> The API is only available when no other audio streams have been
> allocated, and only one BTP/BRA stream is allowed per link.  To avoid
> the addition of yet another lock, the refcount tests are handled in
> the stream master_runtime alloc/free routines where the bus_lock is
> already held. Another benefit of this approach is that the same
> bus_lock is used to handle runtime and port linked lists, which
> reduces the potential for misaligned configurations.
> 
> In addition to exclusion with audio streams, BPT transfers have a lot
> of overhead, specifically registers writes are needed to enable
> transport in DP0. In addition, most DMAs don't handle too well very
> small data sets.
> 
> This patch suggests a minimum bound of 64 bytes, for smaller transfers
> codec drivers should rely on the regular read/write commands in
> Column0.
> 
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> ---
>  drivers/soundwire/bus.c       | 77 +++++++++++++++++++++++++++++++++++
>  drivers/soundwire/bus.h       | 18 ++++++++
>  drivers/soundwire/stream.c    | 30 ++++++++++++++
>  include/linux/soundwire/sdw.h | 76 ++++++++++++++++++++++++++++++++++
>  4 files changed, 201 insertions(+)
> 
> diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
> index f3fec15c3112..e5758d2ed88f 100644
> --- a/drivers/soundwire/bus.c
> +++ b/drivers/soundwire/bus.c
> @@ -2015,3 +2015,80 @@ void sdw_clear_slave_status(struct sdw_bus *bus, u32 request)
>  	}
>  }
>  EXPORT_SYMBOL(sdw_clear_slave_status);
> +
> +int sdw_bpt_close_stream(struct sdw_bus *bus,
> +			 struct sdw_slave *slave,
> +			 enum sdw_bpt_type mode,
> +			 struct sdw_bpt_msg *msg)
> +{
> +	int ret;
> +
> +	ret = bus->ops->bpt_close_stream(bus, slave, mode, msg);
> +	if (ret < 0)
> +		dev_err(bus->dev, "BPT stream close, err %d\n", ret);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL(sdw_bpt_close_stream);
> +
> +int sdw_bpt_open_stream(struct sdw_bus *bus,
> +			struct sdw_slave *slave,
> +			enum sdw_bpt_type mode,
> +			struct sdw_bpt_msg *msg)
> +{
> +	int ret;
> +
> +	/* only Bulk Register Access (BRA) is supported for now */
> +	if (mode != SDW_BRA)
> +		return -EINVAL;
> +
> +	if (msg->len < SDW_BPT_MSG_MIN_BYTES) {
> +		dev_err(bus->dev, "BPT message length %d, min supported %d\n",
> +			msg->len, SDW_BPT_MSG_MIN_BYTES);
> +		return -EINVAL;
> +	}
> +
> +	if (msg->len % SDW_BPT_MSG_BYTE_ALIGNMENT) {
> +		dev_err(bus->dev, "BPT message length %d is not a multiple of %d bytes\n",
> +			msg->len, SDW_BPT_MSG_BYTE_ALIGNMENT);
> +		return -EINVAL;
> +	}

Is this a protocol requirement?

> +
> +	/* check device is enumerated */
> +	if (slave->dev_num == SDW_ENUM_DEV_NUM ||
> +	    slave->dev_num > SDW_MAX_DEVICES)
> +		return -ENODEV;
> +
> +	/* make sure all callbacks are defined */
> +	if (!bus->ops->bpt_open_stream ||
> +	    !bus->ops->bpt_close_stream ||
> +	    !bus->ops->bpt_send_async ||
> +	    !bus->ops->bpt_wait)
> +		return -ENOTSUPP;

should this not be checked at probe time, if device declares the support

> +
> +	ret = bus->ops->bpt_open_stream(bus, slave, mode, msg);
> +	if (ret < 0)
> +		dev_err(bus->dev, "BPT stream open, err %d\n", ret);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL(sdw_bpt_open_stream);

can we open multiple times (i dont see a check preventing that), how do
we close..?

Re-iterating my comment on documentation patch, can we do with a async api
and wait api, that makes symantics a lot simpler, right..?

> +
> +int sdw_bpt_send_async(struct sdw_bus *bus,
> +		       struct sdw_slave *slave,
> +		       struct sdw_bpt_msg *msg)
> +{
> +	if (msg->len > SDW_BPT_MSG_MAX_BYTES)
> +		return -EINVAL;
> +
> +	return bus->ops->bpt_send_async(bus, slave, msg);
> +}
> +EXPORT_SYMBOL(sdw_bpt_send_async);

Can we call this multiple times after open, it is unclear to me. Can you
please add kernel-doc comments about the APIs here as well

>  struct sdw_master_ops {
>  	int (*read_prop)(struct sdw_bus *bus);
> @@ -869,6 +913,20 @@ struct sdw_master_ops {
>  	void (*new_peripheral_assigned)(struct sdw_bus *bus,
>  					struct sdw_slave *slave,
>  					int dev_num);
> +	int (*bpt_open_stream)(struct sdw_bus *bus,
> +			       struct sdw_slave *slave,
> +			       enum sdw_bpt_type mode,
> +			       struct sdw_bpt_msg *msg);
> +	int (*bpt_close_stream)(struct sdw_bus *bus,
> +				struct sdw_slave *slave,
> +				enum sdw_bpt_type mode,
> +				struct sdw_bpt_msg *msg);
> +	int (*bpt_send_async)(struct sdw_bus *bus,
> +			      struct sdw_slave *slave,
> +			      struct sdw_bpt_msg *msg);
> +	int (*bpt_wait)(struct sdw_bus *bus,
> +			struct sdw_slave *slave,
> +			struct sdw_bpt_msg *msg);

do we need both bus and slave, that was a mistake in orignal design IMO.
We should fix that for bpt_ apis

-- 
~Vinod
