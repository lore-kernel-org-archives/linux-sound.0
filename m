Received: from out-188.mta1.migadu.com (out-188.mta1.migadu.com [95.215.58.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6BE13624C4
	for <linux-sound@vger.kernel.org>; Thu, 12 Mar 2026 04:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773290654; cv=none; b=eUIs9AJ5AxkfJNJ2nb2elE0up4FP83GFPx2OnzRG8YIMl1IHcXcCmN8VPFP7vuGg+6r7o0lmqHJVovvsaIRd+SD58VEaKhq4hENGbDEa1Q955FwrljYGW6LhBhHzlGtaanK8bDf3o0KlOzOuAQ372vbh2kSPTm5J7Np0xqmrZ08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773290654; c=relaxed/simple;
	bh=+Lsq6yPEH8OqMtkYCTAyhXmaxqxTKJz9qvF2JCMbgWY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UWruUY72oGcskLJerr4//yCUSjT/AmgAK7JCGVstVsP3T4lsnza8tXGtsZwu6oT8/14c87mvyz+VX10Ef0MjZMsI9P0hnNaNfEZRc1zf2MQeSkGkSDcgUvYl9yYQ+fi+gzRAS84Ikfyko/F04BjB5b/GKVQaA+Y/UjmRrU4x0kE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=tlTZM8Xc; arc=none smtp.client-ip=95.215.58.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="tlTZM8Xc"
Message-ID: <e190aa72-9e1e-45de-951e-695f99e6111a@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1773290650;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CRF8DVrb6RWm3ZMDHzbdgyOhWKGiRFgI1gHPDpCQ36U=;
	b=tlTZM8Xcykd0C6I91FAwTeRByCcHsvP964phWz3Ff5ngV63iEJJzhTM97Mxg2eeiohJbGq
	6x8vjzHnGJqBKkZgFDc5HzctGk+/iUSNpfmOCbmcgSKUDcK8xI7hMJwc7a/V5/mAxyDGHi
	ENqGILB2m1Fk7PD42U+dQH38pkAVrNc=
Date: Wed, 11 Mar 2026 20:55:13 -0700
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2 3/6] ASoC: sdw_utils: add soc_sdw_es9356
To: Zhang Yi <zhangyi@everest-semi.com>, broonie@kernel.org, tiwai@suse.com,
 linux-sound@vger.kernel.org
Cc: peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com
References: <20260226073534.3347-1-zhangyi@everest-semi.com>
 <20260226073534.3347-4-zhangyi@everest-semi.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20260226073534.3347-4-zhangyi@everest-semi.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 2/25/26 23:35, Zhang Yi wrote:
> Add a utility program for handling ES9356 in the universal machine driver
> 
> Signed-off-by: Zhang Yi <zhangyi@everest-semi.com>
> ---
>  sound/soc/sdw_utils/Makefile         |   1 +
>  sound/soc/sdw_utils/soc_sdw_es9356.c | 275 +++++++++++++++++++++++++++
>  2 files changed, 276 insertions(+)
>  create mode 100644 sound/soc/sdw_utils/soc_sdw_es9356.c
> 
> diff --git a/sound/soc/sdw_utils/Makefile b/sound/soc/sdw_utils/Makefile
> index e8bd5ffb1..f47b0cada 100644
> --- a/sound/soc/sdw_utils/Makefile
> +++ b/sound/soc/sdw_utils/Makefile
> @@ -7,6 +7,7 @@ snd-soc-sdw-utils-y := soc_sdw_utils.o soc_sdw_dmic.o soc_sdw_rt_dmic.o \
>  		       soc_sdw_cs42l42.o soc_sdw_cs42l43.o 		\
>  		       soc_sdw_cs42l45.o				\
>  		       soc_sdw_cs_amp.o					\
> +		       soc_sdw_es9356.o					\
>  		       soc_sdw_maxim.o \
>  		       soc_sdw_ti_amp.o
>  obj-$(CONFIG_SND_SOC_SDW_UTILS) += snd-soc-sdw-utils.o
> diff --git a/sound/soc/sdw_utils/soc_sdw_es9356.c b/sound/soc/sdw_utils/soc_sdw_es9356.c
> new file mode 100644
> index 000000000..d6649f0e9
> --- /dev/null
> +++ b/sound/soc/sdw_utils/soc_sdw_es9356.c
> @@ -0,0 +1,275 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +// Copyright (c) 2020 Intel Corporation

this doesn't seem right, and I mentioned it in the previous review...

> +int asoc_sdw_es9356_amp_init(struct snd_soc_card *card,
> +		       struct snd_soc_dai_link *dai_links,
> +		       struct asoc_sdw_codec_info *info,
> +		       bool playback)
> +{
> +	struct asoc_sdw_mc_private *ctx = snd_soc_card_get_drvdata(card);
> +	struct device *sdw_dev1, *sdw_dev2;
> +	int ret;
> +
> +	if (!playback)
> +		return 0;
> +
> +	info->amp_num++;
> +
> +	if (info->amp_num == 2) {
> +		sdw_dev1 = bus_find_device_by_name(&sdw_bus_type, NULL, dai_links->codecs[0].name);
> +
> +		if (!sdw_dev1)
> +			return -EPROBE_DEFER;
> +
> +		ret = es9356_add_codec_device_props(sdw_dev1, ctx->mc_quirk);
> +		if (ret < 0) {
> +			put_device(sdw_dev1);
> +			return ret;
> +		}
> +		ctx->amp_dev1 = sdw_dev1;
> +
> +		sdw_dev2 = bus_find_device_by_name(&sdw_bus_type, NULL, dai_links->codecs[1].name);
> +
> +		if (!sdw_dev2)
> +			return -EPROBE_DEFER;

that doesn't seem right, since you've already added stuff for sdw_dev1.

> +
> +		ret = es9356_add_codec_device_props(sdw_dev2, ctx->mc_quirk);
> +		if (ret < 0) {
> +			put_device(sdw_dev2);

this error handling seems weird, shouldn't you also do a put_device(sdw_dev1) here?

maybe the right thing is to check that both sdw_dev1 and sdw_dev2 can be found.
Then you can add properties for both.

I didn't find any other example of code where we deal with two sets of properties.


> +			return ret;
> +		}
> +		ctx->amp_dev2 = sdw_dev2;
> +	}
> +	return 0;
> +}
> +EXPORT_SYMBOL_NS(asoc_sdw_es9356_amp_init, "SND_SOC_SDW_UTILS");
