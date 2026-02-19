Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CFFB31AA96
	for <linux-sound@vger.kernel.org>; Thu, 19 Feb 2026 09:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771493852; cv=none; b=K5xuNfEhqkdBeB8pMMPxwC4DKVFoeFPr6vv69/KND7sAMTDflcaW9zzypp8pp6Vp7QielXbJ4bppY2RXhDEjzVE4rVwjX8QMM7NM871d9YuDFDdlJzYiiQK7dnxd3YM9dSgzKO6d3MdiV+USu68RlmQlbqlBmDlomlq1M2iG8hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771493852; c=relaxed/simple;
	bh=o082CWV39JNU/3l8uOGCb+irymzGm0EPwEIGidsgwm0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AeC9nsLBqjmykd5kgvn02w/4Bmym77NaVFL7j/jEz44iVukmYzkNhwbZpPUS0yckPzHzEuRcTudqz0XpjCCZfPopbWMteu01FVPfUC6f1jCz/E0Q75ZysktaBPShh57KYiwkKsVIDoDPKtSe7si5N+6p5WTfjagd0AfEaj5zsoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Qs7xBkjo; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Qs7xBkjo"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 1A9471A0649;
	Thu, 19 Feb 2026 09:37:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E33805FB45;
	Thu, 19 Feb 2026 09:37:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A23EF103687B9;
	Thu, 19 Feb 2026 10:37:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1771493842; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=7lDuxuhfvhyYj9DmohVZkkBnQY63QlxYeSYRoTS+Ns0=;
	b=Qs7xBkjojWvKSegG56N80vX1+QzwYAIXimUmRsF/s0TS99jdUnoogsbA5NP//I1GCAQqp3
	VSoHLgSRu2M6OIOMffopO5HwVljvbBgD8R5Ja+U5gzdvbe/rIGIGOGXZcduJVf3WUe1CbA
	AFZ82ON8jDPV18CAzchq8isc2CMcAndYTcLUBvlsVkc0ltDhNpuPLZZ9C7F91YWQWuplwH
	ttScovBRCuqDRb3yUz//S5eiqkDq61n/5PIe2L99QulQQ58VHS8a3Bik4ciBL7VxczIR8M
	0SrwDH9E80uCB0Aw6GMiiNqhe3FK3GuW9wy8FogHz1IUqCqUSuO0knB73KeKsQ==
Date: Thu, 19 Feb 2026 10:37:18 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Detlev Casanova <detlev.casanova@collabora.com>
Cc: linux-kernel@vger.kernel.org,
	Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Heiko Stuebner <heiko@sntech.de>,
	linux-rockchip@lists.infradead.org, linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH] ASoC: rockchip: i2s-tdm: Use param rate if not provided
 by set_sysclk
Message-ID: <20260219093718b7d29076@mail.local>
References: <20260218201834.924358-1-detlev.casanova@collabora.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260218201834.924358-1-detlev.casanova@collabora.com>
X-Last-TLS-Session-Version: TLSv1.3

Hello,

On 18/02/2026 15:18:34-0500, Detlev Casanova wrote:
> Drivers will not always call set_sysclk() for all clocks, especially when
> default mclk-fs can be used.
> When that is the case, use the clock rate set in the params multiplied by the
> default mclk-fs.
> 
> Fixes: 5323186e2e8d ("ASoC: rockchip: i2s_tdm: Re-add the set_sysclk callback")
> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
> ---
>  sound/soc/rockchip/rockchip_i2s_tdm.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/sound/soc/rockchip/rockchip_i2s_tdm.c b/sound/soc/rockchip/rockchip_i2s_tdm.c
> index 770b9bfbb384..fc52149ed6ae 100644
> --- a/sound/soc/rockchip/rockchip_i2s_tdm.c
> +++ b/sound/soc/rockchip/rockchip_i2s_tdm.c
> @@ -22,6 +22,7 @@
>  
>  #define DRV_NAME "rockchip-i2s-tdm"
>  
> +#define DEFAULT_MCLK_FS				256
>  #define CH_GRP_MAX				4  /* The max channel 8 / 2 */
>  #define MULTIPLEX_CH_MAX			10
>  
> @@ -665,6 +666,15 @@ static int rockchip_i2s_tdm_hw_params(struct snd_pcm_substream *substream,
>  			mclk_rate = i2s_tdm->mclk_rx_freq;
>  		}
>  
> +		/*
> +		 * When the dai/component driver doesn't need to set mclk-fs for a specific
> +		 * clock, it can skip the call to set_sysclk() for that clock.
> +		 * In that case, simply use the clock rate from the params and multiply it by
> +		 * the default mclk-fs value.
> +		 */
> +		if (!mclk_rate)
> +			mclk_rate = DEFAULT_MCLK_FS * params_rate(params);
> +

Maybe this could be set as the default value of i2s_tdm->mclk_rx_freq
and i2s_tdm->mclk_tx_freq in rockchip_i2s_tdm_probe instead of relying
on it being 0 and testing later on?

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
