Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7075436089
	for <linux-sound@vger.kernel.org>; Thu, 21 Dec 2023 14:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hhQX3TdJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 051C4C433C7;
	Thu, 21 Dec 2023 14:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703170203;
	bh=FkGWRi5sZe9i5G/7+3x2Dpn2AKCY0J1cCujMB77+wP8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hhQX3TdJww9UCdvOo5jGM/GKNNSVXU+/7kWbHEZ4Or4dyyerklw+lTZgeD4/WTtlP
	 owqIqGy8hJ2EbAuZnUcYgq7tQZkVNwT7AF6QUbIhIjqVIUSUp82fYt79O45G1ie3Lm
	 HHbp7aDpmfjEfct2lR6/mv1+ow1ldcgfdM9sUwAsgD7PuYfoKtpHfVDJC9mCw74JpO
	 vqcJYpVqHVkQ+dKIblY92GZAvve3wj+5H99MU16ATI9+VA7tW0jYXsnPXFHMuQMGSC
	 VIafYR1DZBpYvz7LQ5cjdl2Zt0QlFeQPY4bIeDIdDe6CC6ZAtET65Ef+vAIuoL2tZG
	 rOvTEbyw0rXvw==
Date: Thu, 21 Dec 2023 20:19:58 +0530
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
Message-ID: <ZYRQliKCliLcLAG0@matsya>
References: <20231207222944.663893-1-pierre-louis.bossart@linux.intel.com>
 <20231207222944.663893-8-pierre-louis.bossart@linux.intel.com>
 <ZYAy9ZM0o3uAk2qY@matsya>
 <4f66f792-79c0-4221-82b5-a0d9ec5a898b@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4f66f792-79c0-4221-82b5-a0d9ec5a898b@linux.intel.com>

On 18-12-23, 14:12, Pierre-Louis Bossart wrote:
> 
> >> +int sdw_bpt_open_stream(struct sdw_bus *bus,
> >> +			struct sdw_slave *slave,
> >> +			enum sdw_bpt_type mode,
> >> +			struct sdw_bpt_msg *msg)
> >> +{
> >> +	int ret;
> >> +
> >> +	/* only Bulk Register Access (BRA) is supported for now */
> >> +	if (mode != SDW_BRA)
> >> +		return -EINVAL;
> >> +
> >> +	if (msg->len < SDW_BPT_MSG_MIN_BYTES) {
> >> +		dev_err(bus->dev, "BPT message length %d, min supported %d\n",
> >> +			msg->len, SDW_BPT_MSG_MIN_BYTES);
> >> +		return -EINVAL;
> >> +	}
> >> +
> >> +	if (msg->len % SDW_BPT_MSG_BYTE_ALIGNMENT) {
> >> +		dev_err(bus->dev, "BPT message length %d is not a multiple of %d bytes\n",
> >> +			msg->len, SDW_BPT_MSG_BYTE_ALIGNMENT);
> >> +		return -EINVAL;
> >> +	}
> > 
> > Is this a protocol requirement?
> 
> No, it's an implementation requirement.
> 
> We could move this to host-specific parts but then the codec drivers
> will have to know about alignment requirements for each host they are
> use with. IOW, it's more work for codec drivers if we don't have a
> minimum bar for alignment requirement across all platforms.
> 
> > 
> >> +
> >> +	/* check device is enumerated */
> >> +	if (slave->dev_num == SDW_ENUM_DEV_NUM ||
> >> +	    slave->dev_num > SDW_MAX_DEVICES)
> >> +		return -ENODEV;
> >> +
> >> +	/* make sure all callbacks are defined */
> >> +	if (!bus->ops->bpt_open_stream ||
> >> +	    !bus->ops->bpt_close_stream ||
> >> +	    !bus->ops->bpt_send_async ||
> >> +	    !bus->ops->bpt_wait)
> >> +		return -ENOTSUPP;
> > 
> > should this not be checked at probe time, if device declares the support
> 
> sdw_bpt_open_stream() would be called by the peripheral driver (or
> regmap as a proxy). The peripheral driver could also decide to check for
> those callback during its probe, but that's beyond the scope of this
> patchset.

I would think that it is better to have capablities registered by the
driver and those are checked at registration, so we know if bpt is
supported or not for a particular platform.

This make more sense to me as some driver, depending on the SoC may or
maynot support this, so easy way would be to turn off caps, what do you
think?

> 
> These checks are just there for paranoia, in case a peripheral driver
> uses BTP/BRA on a host where they are not supported.
> 
> It's not science-fiction, we see AMD- and INTEL-based platforms using
> the same SoundWire-based codecs.

Ofcourse, it is entrely reasonable thing to do, event across x86/arm64

> 
> >> +	ret = bus->ops->bpt_open_stream(bus, slave, mode, msg);
> >> +	if (ret < 0)
> >> +		dev_err(bus->dev, "BPT stream open, err %d\n", ret);
> >> +
> >> +	return ret;
> >> +}
> >> +EXPORT_SYMBOL(sdw_bpt_open_stream);
> > 
> > can we open multiple times (i dont see a check preventing that), how do
> > we close..?
> 
> there's a refcount preventing multiples BTP streams from being opened.
> 
> > Re-iterating my comment on documentation patch, can we do with a async api
> > and wait api, that makes symantics a lot simpler, right..?
> 
> see reply in previous email, combining open+send is weird IMHO.
> 
> >> +
> >> +int sdw_bpt_send_async(struct sdw_bus *bus,
> >> +		       struct sdw_slave *slave,
> >> +		       struct sdw_bpt_msg *msg)
> >> +{
> >> +	if (msg->len > SDW_BPT_MSG_MAX_BYTES)
> >> +		return -EINVAL;
> >> +
> >> +	return bus->ops->bpt_send_async(bus, slave, msg);
> >> +}
> >> +EXPORT_SYMBOL(sdw_bpt_send_async);
> > 
> > Can we call this multiple times after open, it is unclear to me. Can you
> > please add kernel-doc comments about the APIs here as well
> 
> This can be called multiple times but it's useless: all the buffers are
> prepared in the open() stage. This is the moral equivalent of a trigger
> step, just enable data transfers.
> 
> > 
> >>  struct sdw_master_ops {
> >>  	int (*read_prop)(struct sdw_bus *bus);
> >> @@ -869,6 +913,20 @@ struct sdw_master_ops {
> >>  	void (*new_peripheral_assigned)(struct sdw_bus *bus,
> >>  					struct sdw_slave *slave,
> >>  					int dev_num);
> >> +	int (*bpt_open_stream)(struct sdw_bus *bus,
> >> +			       struct sdw_slave *slave,
> >> +			       enum sdw_bpt_type mode,
> >> +			       struct sdw_bpt_msg *msg);
> >> +	int (*bpt_close_stream)(struct sdw_bus *bus,
> >> +				struct sdw_slave *slave,
> >> +				enum sdw_bpt_type mode,
> >> +				struct sdw_bpt_msg *msg);
> >> +	int (*bpt_send_async)(struct sdw_bus *bus,
> >> +			      struct sdw_slave *slave,
> >> +			      struct sdw_bpt_msg *msg);
> >> +	int (*bpt_wait)(struct sdw_bus *bus,
> >> +			struct sdw_slave *slave,
> >> +			struct sdw_bpt_msg *msg);
> > 
> > do we need both bus and slave, that was a mistake in orignal design IMO.
> > We should fix that for bpt_ apis
> 
> No disagreement. All the routines follow the same template, if we change
> one we should also change the others.
> 
> The main question as discussed with Charles is whether we want to pass
> the 'msg' argument in all routines.

Lets revisit when we have new API

-- 
~Vinod
