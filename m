Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E04355884;
	Fri, 28 Jun 2024 06:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719555865; cv=none; b=WCXT3kfgcmglHLenH4MiNCA8qE1WKz38hIP/y/DpALnGAuhTP8kLJhOrD51ptgLNeZdJ5C8hh05Px3GXPYq+ZnrVoEYvMpyOEsSf2VDr/X+yIn5m9NJmvNTJQLh0MoJ6+/07qZ0FqCyLJ/LWZnPobaWGaj/pj93J47fMjnPxjGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719555865; c=relaxed/simple;
	bh=CoZpPaIVx8YVW8mjXAoTrmwo9/8K5PCV+Yw5r106JqM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=stJ605lweYGlfMi3nr2wN3bwOvLEQgNBBvMl5nUMeeERj/DNj+8U+QGR2hZo0TNTIEvG40BVh26wu2YNNs+EuKOgqX+0z/7dcdN/rfB1T3RihXsRJ7QofLFUtYuG6e8UrmoTlq6WwTIzrmuyOK/lHifQyVAn8ziZGLgctwQVnco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DhHULUZd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DhHULUZd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE13BC32789;
	Fri, 28 Jun 2024 06:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719555865;
	bh=CoZpPaIVx8YVW8mjXAoTrmwo9/8K5PCV+Yw5r106JqM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DhHULUZdd6C/jTaHjWsbZUYCi8zwOJyCvNrBdJhnYOQM0neOIStILxWa1Kk0dS2WL
	 w7TuGQt4BoRTyzOhsX5SyHUZjWn7AHz45IbnIprBlcybGdSPvhyfJOsUSlzrQCC0UY
	 mSUWOVX62CViNGk4sZR4MHmkQIFB7kdRNo4fWKEBiRE+4kcUkT3aBkKhjvK2zDNcpn
	 FRmEDfP2Sy7TVOikkDbJWyNyoaT+IjDqak3+p8KmUTy/mUskgdjY8LTBFDK3u3DS5k
	 KVticidszd5oL60o31h2z8frMCjy696IrIgrfLRMKalhkl40AerupZcGZ7igYIn5Pt
	 +uz94afLLo99A==
Message-ID: <e177530a-046b-407b-8da5-85947d2d1340@kernel.org>
Date: Fri, 28 Jun 2024 08:24:18 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] ASoC: codecs: nau8824: Add master clock handling
To: Maxim Kochetkov <fido_max@inbox.ru>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, John Hsu <KCHSU0@nuvoton.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org
References: <20240628061750.11141-1-fido_max@inbox.ru>
 <20240628061750.11141-2-fido_max@inbox.ru>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20240628061750.11141-2-fido_max@inbox.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28/06/2024 08:17, Maxim Kochetkov wrote:
> Use master clock "mclk" if provided through device tree.
> 
> Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
> ---
>  sound/soc/codecs/nau8824.c | 21 +++++++++++++++++++--
>  sound/soc/codecs/nau8824.h |  1 +
>  2 files changed, 20 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/codecs/nau8824.c b/sound/soc/codecs/nau8824.c
> index f92b95b21cae..7153b746f4b1 100644
> --- a/sound/soc/codecs/nau8824.c
> +++ b/sound/soc/codecs/nau8824.c
> @@ -520,8 +520,15 @@ static int system_clock_control(struct snd_soc_dapm_widget *w,
>  		} else {
>  			nau8824_config_sysclk(nau8824, NAU8824_CLK_DIS, 0);
>  		}
> +
> +		if (!IS_ERR(nau8824->mclk))
> +			clk_disable_unprepare(nau8824->mclk);
>  	} else {
>  		dev_dbg(nau8824->dev, "system clock control : POWER ON\n");
> +
> +		if (!IS_ERR(nau8824->mclk))

Nah, clock API is not used like this. Open clk_prepare_enable() and look
how it handles NULL ptr.

> +			clk_prepare_enable(nau8824->mclk);
> +
>  		/* Check the clock source setting is proper or not
>  		 * no matter the source is from FLL or MCLK.
>  		 */
> @@ -563,16 +570,22 @@ static int dmic_clock_control(struct snd_soc_dapm_widget *w,
>  	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
>  	struct nau8824 *nau8824 = snd_soc_component_get_drvdata(component);
>  	int src;
> +	unsigned int freq;
> +
> +	if (!IS_ERR(nau8824->mclk))
> +		freq = clk_get_rate(nau8824->mclk);
> +	else
> +		freq = nau8824->fs * 256;
>  
>  	/* The DMIC clock is gotten from system clock (256fs) divided by
>  	 * DMIC_SRC (1, 2, 4, 8, 16, 32). The clock has to be equal or
>  	 * less than 3.072 MHz.
>  	 */
>  	for (src = 0; src < 5; src++) {
> -		if ((0x1 << (8 - src)) * nau8824->fs <= DMIC_CLK)
> +		if (freq / (0x1 << src) <= DMIC_CLK)
>  			break;
>  	}
> -	dev_dbg(nau8824->dev, "dmic src %d for mclk %d\n", src, nau8824->fs * 256);
> +	dev_dbg(nau8824->dev, "dmic src %d for mclk %d\n", src, freq);
>  	regmap_update_bits(nau8824->regmap, NAU8824_REG_CLK_DIVIDER,
>  		NAU8824_CLK_DMIC_SRC_MASK, (src << NAU8824_CLK_DMIC_SRC_SFT));
>  
> @@ -1871,6 +1884,10 @@ static int nau8824_read_device_properties(struct device *dev,
>  	if (ret)
>  		nau8824->jack_eject_debounce = 1;
>  
> +	nau8824->mclk = devm_clk_get(dev, "mclk");
> +	if (PTR_ERR(nau8824->mclk) == -EPROBE_DEFER)
> +		return -EPROBE_DEFER;

Aren't you open-coding getting optional clock?

Best regards,
Krzysztof

