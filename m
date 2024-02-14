Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C70E57F
	for <linux-sound@vger.kernel.org>; Wed, 14 Feb 2024 00:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707870434; cv=none; b=jr2UxaGg+4TxErIJ9Vo3reBx8ED6k1JnBZA1kCBjDUi0Jk1hAIXmGbl49YX/SpkQyDfJoxzlnTm1hMzTk+khcftUNdT6aqKr30TjGQSmo0ySSc4EthxQjp5GtTJHy/47BDtyyPqW/C2wNakE4Uk10h4sc7A+EwqIcugbT5NHIxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707870434; c=relaxed/simple;
	bh=yDHy5RDbymgdUKbLBpcBU7q0gdC36wyOUaU6V100yVw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YTqFstdvgNOGpxW3F3NalY74cdAlr11Y3N6lKQgCLrKz3lwQPEK1s7VvzduhSsuBf0udw7pU6Du+zKlQtDkaBtIxdAghKxze2Pnilp0MUSs+BvjGdYUeZQTPeCTeWJW0Ldu9FRl3Ol9hj4etpfoKNnFxbN+pEq+dj1H9RP1IY9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qE8BYa6o; arc=none smtp.client-ip=209.85.166.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qE8BYa6o"
Received: by mail-io1-f49.google.com with SMTP id ca18e2360f4ac-7c403dbf3adso254487639f.1
        for <linux-sound@vger.kernel.org>; Tue, 13 Feb 2024 16:27:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1707870432; x=1708475232; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=p5T7AJQgyciJK6sFO1yWt0ErtUqKT+irq43WlU30JPg=;
        b=qE8BYa6oiXX5ejRLIaPeiKOGwB8YuATJIpdpvEeLRwIzMsCCsr6RFSq/RIaS4kSw6G
         f10YESh55qkxUVM4bQf0T4un8I41f79UUQoT/E6rfk5u20iEuwgKSK4tKWeN9Vk/xu3e
         4qyBnHQrDTMj+d7WwYGXzGaNGAe649S+7pXnk9tkIH8C//sHrjqVMp+ncHfTGvfExtBU
         bZHFxg9uid2R37K5lmlQzBojdmbwA2D4D4xSCEYJzodl2D03Z+dFP4KhrQPy6CR4ncf9
         B70D9RRChqwEXROCfeFUYAnhTs+nJCRI/GUTaIq7Vuc9zY5CVUPMQFCMl6dg94vjW5Mw
         +deg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707870432; x=1708475232;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p5T7AJQgyciJK6sFO1yWt0ErtUqKT+irq43WlU30JPg=;
        b=MugfDBtJxwpFC2UX43sRthcNOzOVGUyizZzzVB59bDP7LLV3SvJkFAyAyy2s0JR5T6
         z9KURpQInx7hxf4VP6mYU8iyuo60VzmrJNraUK3Tf2p5kzheVuue9sZ3a4CkycLZ7tuo
         f834JEeWb+zJPASmd+9RNe6OOijNn20zKKBLS3Du5vr5iqw4WX+hLnfaJpWOFkcXnqhl
         LB7SCznq82Yghi510fPuHbU3f1QRU6qNORUlYnFBiakK+VpCXf2awNHZYvVOeKBAeQ51
         eIugtvTCiBtCRTDmbFH8pscR0Ku1gDPNSXkz44u6rtjLhgrq5KlIHNT9bGdXSATTslKZ
         zi2g==
X-Forwarded-Encrypted: i=1; AJvYcCW7P56ERvkVur/SyXI9sfag2jW0C75gwBDAhj9fpMPSx6dKbn/ybNIJqst93QEvSpayjWZv8i8sAzXXjGkizTHns7X/fSMLbuGVjzU=
X-Gm-Message-State: AOJu0YzF3pI/JhgEXQIshoSuX6TNSAtpLeiDReMOMQwoKllo/yIwu0l4
	oFG5Ul5lQhl+VjVztsKczkURRlzlXwN//EtUPj/ne41bmt8b0z8ZvlfL9VvGtg==
X-Google-Smtp-Source: AGHT+IFlwS590K6G5HLkJzVAbnXNA3kjuDrNpfVIBkAOMMF2uKbvfvsNtgUXwFSf/vpyKj4XnjzfVA==
X-Received: by 2002:a05:6602:1c3:b0:7c4:19c7:646a with SMTP id w3-20020a05660201c300b007c419c7646amr1528777iot.19.1707870431645;
        Tue, 13 Feb 2024 16:27:11 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXKbZdIao3MuWR588UKr53QbpcAZKhB9kXOjFoOwymzV+XRimiyLDuoM9Vs57HxOeDppfShIb00Z/u6rJ/tcurfJC3aTiIHy1JRA9nuzvdJSQyVigWL++i27Tg6fIAUmRPs3pe2p+FtKb8rdbUMwpszXHSfCYQ8lYx38ofWsyV43KntDzujWzjLLSYTYoTLz3/NQjxi7/US3Au353TFVbFIwDOwxfHDJfrUod67S4qui5i1m/1IHpqXQQ8wnRjb8MTF97izsHtcc/FdPHceEDqvEzUcFd3/ar9ByItkSBO9/+ufMNWKR/VqijYcxsIvZSPceDEMFIXWklvAyj1SFYHkWcQ5tDpEWTfPAvBv2CiYeyyLsoEeJXsoz8uTOZZuo2pDMSlEFzbAPlrHbAeBfQJJPM17PdZXYkPCbH0wUEjQyBL/W9YvrBKJV/h/Xh6m+14cbyX11OSRs9vYRixUqjBQBfEct7pfYePjSPdHykil6zADzWKQp4GEBbBYxlESGl2IAPVmFP5hsrMppTcEWxjF2HY22Cx0LgkOQRCIACoGIRiPq0cj6S3iAoDhbjgIvMmD+SLjXHsNtqaZMzM=
Received: from google.com (20.10.132.34.bc.googleusercontent.com. [34.132.10.20])
        by smtp.gmail.com with ESMTPSA id cp27-20020a056638481b00b0047140ce03casm2180833jab.22.2024.02.13.16.27.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Feb 2024 16:27:11 -0800 (PST)
Date: Wed, 14 Feb 2024 00:27:08 +0000
From: Justin Stitt <justinstitt@google.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Mark Brown <broonie@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH v2 2/2] ASoC: meson: t9015: fix function pointer type
 mismatch
Message-ID: <20240214002708.bhpvpt7cv7o4os5t@google.com>
References: <20240213215807.3326688-1-jbrunet@baylibre.com>
 <20240213215807.3326688-3-jbrunet@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240213215807.3326688-3-jbrunet@baylibre.com>

Hi,

On Tue, Feb 13, 2024 at 10:58:04PM +0100, Jerome Brunet wrote:
> clang-16 warns about casting functions to incompatible types, as is done
> here to call clk_disable_unprepare:
>
> sound/soc/meson/t9015.c:274:4: error: cast from 'void (*)(struct clk *)' to 'void (*)(void *)' converts to incompatible function type [-Werror,-Wcast-function-type-strict]
>   274 |                         (void(*)(void *))clk_disable_unprepare,
>
> The pattern of getting, enabling and setting a disable callback for a
> clock can be replaced with devm_clk_get_enabled(), which also fixes
> this warning.
>
> Fixes: 33901f5b9b16 ("ASoC: meson: add t9015 internal DAC driver")
> Reported-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

Reviewed-by: Justin Stitt <justinstitt@google.com>
> ---
>  sound/soc/meson/t9015.c | 20 ++++----------------
>  1 file changed, 4 insertions(+), 16 deletions(-)
>
> diff --git a/sound/soc/meson/t9015.c b/sound/soc/meson/t9015.c
> index 9c6b4dac6893..571f65788c59 100644
> --- a/sound/soc/meson/t9015.c
> +++ b/sound/soc/meson/t9015.c
> @@ -48,7 +48,6 @@
>  #define POWER_CFG	0x10
>
>  struct t9015 {
> -	struct clk *pclk;
>  	struct regulator *avdd;
>  };
>
> @@ -249,6 +248,7 @@ static int t9015_probe(struct platform_device *pdev)
>  	struct t9015 *priv;
>  	void __iomem *regs;
>  	struct regmap *regmap;
> +	struct clk *pclk;
>  	int ret;
>
>  	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> @@ -256,26 +256,14 @@ static int t9015_probe(struct platform_device *pdev)
>  		return -ENOMEM;
>  	platform_set_drvdata(pdev, priv);
>
> -	priv->pclk = devm_clk_get(dev, "pclk");
> -	if (IS_ERR(priv->pclk))
> -		return dev_err_probe(dev, PTR_ERR(priv->pclk), "failed to get core clock\n");
> +	pclk = devm_clk_get_enabled(dev, "pclk");
> +	if (IS_ERR(pclk))
> +		return dev_err_probe(dev, PTR_ERR(pclk), "failed to get core clock\n");
>
>  	priv->avdd = devm_regulator_get(dev, "AVDD");
>  	if (IS_ERR(priv->avdd))
>  		return dev_err_probe(dev, PTR_ERR(priv->avdd), "failed to AVDD\n");
>
> -	ret = clk_prepare_enable(priv->pclk);
> -	if (ret) {
> -		dev_err(dev, "core clock enable failed\n");
> -		return ret;
> -	}
> -
> -	ret = devm_add_action_or_reset(dev,
> -			(void(*)(void *))clk_disable_unprepare,
> -			priv->pclk);
> -	if (ret)
> -		return ret;
> -
>  	ret = device_reset(dev);
>  	if (ret) {
>  		dev_err(dev, "reset failed\n");
> --
> 2.43.0
>
Thanks
Justin
