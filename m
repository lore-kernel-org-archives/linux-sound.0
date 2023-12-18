Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09454208D8
	for <linux-sound@vger.kernel.org>; Mon, 18 Dec 2023 11:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P5sF7QdK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B8B6C433C8;
	Mon, 18 Dec 2023 11:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702900560;
	bh=I7ksKDOitB86N7lt6ezJkH+UJhPIeJM2YzBoqBSdqrM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P5sF7QdK+FTt+mTIF691q9wiZH+mRygUC953REKGDPzYGxdwf8J3T8zYj7sBaYkoo
	 vRMYeHKyMZXJkvJWo7X5lwTbiKLgyk/+8sbrORdWtIEigAW0FnMmu+8aomGetWbDAK
	 2jCD4ACx/GEWlwAOetD27KNuoS9Iwzute3SlIp2pHAJtTeoLw0gLzaOCBVdv65sQ5W
	 JrVkg91+axBzT58A0dUx+OLsZ/+xCCxyIMseowbs37fKG0it+XjbKTW77wR1EnChOu
	 QqtUcvg2K2f2GyX/bAv1YAmF9Z6cLvLRzoRZ45KuKthvXLCPLohJcj6UJ9R3vztrvR
	 7UAynGjd5EXWA==
Date: Mon, 18 Dec 2023 17:25:55 +0530
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
Subject: Re: [RFC PATCH 08/16] soundwire: bus: add bpt_stream pointer
Message-ID: <ZYAzS3tggqQg8_PW@matsya>
References: <20231207222944.663893-1-pierre-louis.bossart@linux.intel.com>
 <20231207222944.663893-9-pierre-louis.bossart@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231207222944.663893-9-pierre-louis.bossart@linux.intel.com>

On 07-12-23, 16:29, Pierre-Louis Bossart wrote:
> Add a convenience pointer to the 'sdw_bus' structure. BPT is a
> dedicated stream which will typically not be handled by DAIs or
> dailinks. Since there's only one BPT stream per link, storing the
> pointer at the link level seems rather natural.
> 
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> ---
>  include/linux/soundwire/sdw.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
> index e54c5bbd2b91..8db0cd7d0d89 100644
> --- a/include/linux/soundwire/sdw.h
> +++ b/include/linux/soundwire/sdw.h
> @@ -965,6 +965,7 @@ struct sdw_master_ops {
>   * @stream_refcount: number of streams currently using this bus
>   * @btp_stream_refcount: number of BTP streams currently using this bus (should
>   * be zero or one, multiple streams per link is not supported).
> + * @bpt_stream: pointer stored for convenience.
>   */
>  struct sdw_bus {
>  	struct device *dev;
> @@ -996,6 +997,7 @@ struct sdw_bus {
>  	int hw_sync_min_links;
>  	int stream_refcount;
>  	int bpt_stream_refcount;
> +	struct sdw_stream_runtime *bpt_stream;

So we are limiting to single stream? Can we have multiple transfers
queued up, which I guess might imply multiple streams?

-- 
~Vinod
