Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5633814386F
	for <linux-sound@vger.kernel.org>; Fri, 28 Jun 2024 08:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719563695; cv=none; b=V1ou2sxbUrE3z9ycrv74Psm+rapOF07bQKYYfP3EcuP9bxrVixeB3W18PwK4mCUvZavzC/mGZthOwvqMep/AHBuGjGzwhLuboWLYHbpo1JiJmt3AAQ2nclVw/UuNq8BLQKn4UHuEigC528SI83R2C3Ww+QCzghdZfEh5ubSNLBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719563695; c=relaxed/simple;
	bh=biRrQhODyDG178r6t+Dc7W8P46eie8EBFQWED+2NYyk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MQIBdV2AR8C5PFcspkdkJoMjl+Vk2Tkx5WkuLKsd2J23J6ro3ygWA1k2j+txLW4yA5fKHBmWdaK69aZhtpayIPV7MmAkbQ0o9wOp+s6NwQW+/Kd+p0KxVBtNqpCVS7/B1p0IsX/0PqIoDFg11n3U95vrn6IZ4qVyMSXT5KOkSmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kOhD1gc0; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kOhD1gc0"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-52cecba8d11so387279e87.1
        for <linux-sound@vger.kernel.org>; Fri, 28 Jun 2024 01:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719563691; x=1720168491; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=J8zLmoIKPxnK+b9kZdJkrjuWZxz5Rl0SiMo/hxM01Sk=;
        b=kOhD1gc07+kAVc+XuAOP40CvSF4bfY4MNShVg9nBZLZpGEGv71XZh+7BVzMQouU6Ue
         UY73MEkQbwIuaKpAR8T0KIDrdAi/GmB4HDh1j8LR5rfOUssy7QOG8QpgBUiRFpu7IFU3
         9C+Pw30CYc9zYeKTgbmKTMiDteaWgSa/lfER/eJIk5y34/i4GCKrkVrH0jVgs+qvWg64
         InXtwE3emGzgKAH+rWErI5D8dAM/xOcjdEWdDqCkK0Zm07dUSBK9GHEPAzv4AEPqNhIL
         u9irpkzTdFFuuBls3TlqshYzI4rttmCtZnv1C7FOOuIzuCsUPhOzkyl4evbKXtH3N+Wi
         yQnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719563691; x=1720168491;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J8zLmoIKPxnK+b9kZdJkrjuWZxz5Rl0SiMo/hxM01Sk=;
        b=gSnrE5rtEjSmS60XXYyCfjM1WCDTgjnNoXxhNAfAg6MaZx+gFgNT8unoKBHgJnxHBd
         Ei8wPy6hLFcA9V98LSCP1OfcJ67FNPMV5PUbrd9mq7SSKHiPQxeGj/Xyz1KiyH5pLc0D
         zVY1NIEJU2Mzwglxx7zMx2O/3WWkmiNaS0WXC3SYY/fQE0iGfOPTMAC+cRiM1/qKFMyW
         zgTAVkj5sC0A7BfbVBnnb8Wav3Jg0RjmvMfQ8O4r6wlptTFgts4Ha4V/bWxKUzZC0O2D
         cBZ/QJd24m6wwUNLDOOlNoy/HPaRzb6BqYS8u/i7g9MQcoeW72nTjqwsJR//GkrU85WW
         85UA==
X-Forwarded-Encrypted: i=1; AJvYcCWlNwBnemFzjqljT9Gw7enM2eRHI+3LIy+M0ToL2Ee81iaWHZZHkQOoGHMpDrRKu5YxIwpCPWEKWuiiQ51vYSBGj9Zy0EwoteCT73w=
X-Gm-Message-State: AOJu0YxDpAoa9pY/OSboT15jkKVjeW52ws/YcUSr6oX4ZsPyyZIYXFGg
	SMmihZ2izIDWpAU74HKDx6CiA1ec1R+6iV2vTtnG8oaLBNhql1YTbTmLUbIunsp8yZK0fvzoV5/
	dFVojfQ==
X-Google-Smtp-Source: AGHT+IFFgYROnO/gr2N7QSvXx1fctXVhRczM++VXS2jEv/Xjq0ZPOXaSUkxk3uPcFer4UHzQuZELGw==
X-Received: by 2002:ac2:54a8:0:b0:52c:999b:52f9 with SMTP id 2adb3069b0e04-52ce186457cmr9622295e87.57.1719563691555;
        Fri, 28 Jun 2024 01:34:51 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52e7ab101f3sm207679e87.76.2024.06.28.01.34.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 01:34:51 -0700 (PDT)
Date: Fri, 28 Jun 2024 11:34:49 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
	Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] ASoC: codecs: lpass-rx-macro: Keep static
 regmap_config as const
Message-ID: <grpb57rhum4auor3n66mqd2tpmd52gzofbdog3vlmxlamfxv5a@2mhfkigl6ek2>
References: <20240627-b4-qcom-audio-lpass-codec-cleanups-v1-0-ede31891d238@linaro.org>
 <20240627-b4-qcom-audio-lpass-codec-cleanups-v1-2-ede31891d238@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240627-b4-qcom-audio-lpass-codec-cleanups-v1-2-ede31891d238@linaro.org>

On Thu, Jun 27, 2024 at 05:23:44PM GMT, Krzysztof Kozlowski wrote:
> The driver has static 'struct regmap_config', which is then customized
> depending on device version.  This works fine, because there should not
> be two devices in a system simultaneously and even less likely that such
> two devices would have different versions, thus different regmap config.
> However code is cleaner and more obvious when static data in the driver
> is also const - it serves as a template.
> 
> Mark the 'struct regmap_config' as const and duplicate it in the probe()
> with devm_kmemdup to allow customizing per detected device variant.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  sound/soc/codecs/lpass-rx-macro.c | 17 +++++++++++++----
>  1 file changed, 13 insertions(+), 4 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> 
> diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
> index 59fe76b13cdb..3d8149665439 100644
> --- a/sound/soc/codecs/lpass-rx-macro.c
> +++ b/sound/soc/codecs/lpass-rx-macro.c
> @@ -1662,7 +1662,7 @@ static bool rx_is_readable_register(struct device *dev, unsigned int reg)
>  	return rx_is_rw_register(dev, reg);
>  }
>  
> -static struct regmap_config rx_regmap_config = {
> +static const struct regmap_config rx_regmap_config = {
>  	.name = "rx_macro",
>  	.reg_bits = 16,
>  	.val_bits = 32, /* 8 but with 32 bit read/write */
> @@ -3765,6 +3765,7 @@ static const struct snd_soc_component_driver rx_macro_component_drv = {
>  static int rx_macro_probe(struct platform_device *pdev)
>  {
>  	struct reg_default *reg_defaults;
> +	struct regmap_config *reg_config;
>  	struct device *dev = &pdev->dev;
>  	kernel_ulong_t flags;
>  	struct rx_macro *rx;
> @@ -3851,14 +3852,22 @@ static int rx_macro_probe(struct platform_device *pdev)
>  		goto err;
>  	}
>  
> -	rx_regmap_config.reg_defaults = reg_defaults;
> -	rx_regmap_config.num_reg_defaults = def_count;
> +	reg_config = devm_kmemdup(dev, &rx_regmap_config, sizeof(*reg_config),
> +				  GFP_KERNEL);
> +	if (!reg_config) {
> +		ret = -ENOMEM;
> +		goto err;
> +	}
>  
> -	rx->regmap = devm_regmap_init_mmio(dev, base, &rx_regmap_config);
> +	reg_config->reg_defaults = reg_defaults;
> +	reg_config->num_reg_defaults = def_count;
> +
> +	rx->regmap = devm_regmap_init_mmio(dev, base, reg_config);
>  	if (IS_ERR(rx->regmap)) {
>  		ret = PTR_ERR(rx->regmap);
>  		goto err;
>  	}
> +	devm_kfree(dev, reg_config);
>  	devm_kfree(dev, reg_defaults);

Seeing devm_kfree in the non-error path makes me feel strange. Maybe
it's one of the rare occasions when I can say that __free is suitable
here.

>  
>  	dev_set_drvdata(dev, rx);
> 
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry
