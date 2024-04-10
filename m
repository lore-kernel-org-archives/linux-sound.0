Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B59016EBEF
	for <linux-sound@vger.kernel.org>; Wed, 10 Apr 2024 15:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712763534; cv=none; b=fjO/v2W0D6kKW+BF9i23saYKe1Bzo6q1J4ALCOg1lODxw41GpBzuUYHyxSIrRsETOzSPWW+zoRaqpERwHD7z9VosYP5dTnk3W9d8TD5rmpDajhDgod8X/uE+ol5pU1+T81ytGaDkaQt5WkOGcq3l8BGptK/NXBY/xr0MDFeb9Ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712763534; c=relaxed/simple;
	bh=GGGXqb/dRvAmsbMVacoTodVUEkGNMLSBqd77vagY4mQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IlwYd6WzCemRKVZIKbJTo81Z5AXYpi/ZbiPsqjqXVddkEGiRqJ+C/8ko1dUnapi5Bv8a9RJa6PsspvhFXcg7Ja14mx85MR78abxRB4sH8IaQW2kqI/rD/EX8Vksj203QSOdk37b2023QRwM0kyL4KZgs9LNQu6xyBcHD3YVjgr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Dy2Hy/Uj; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Dy2Hy/Uj"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2d700beb6beso74742871fa.2
        for <linux-sound@vger.kernel.org>; Wed, 10 Apr 2024 08:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1712763531; x=1713368331; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ziNLBEavMFMG0GfbRRHA8010gbB3jZaJU46gRxSDrTY=;
        b=Dy2Hy/Ujea2R04iIFyIwia0nK0gPMal06imVzZwZrjlDxhjjJG0HwCpnLmGHp6/PO6
         rw7Lhq79YhZATzPEHAdVkrtW96iTGcATxfvOQAmomAb2pa1xnRKQXBD02n9WmpmVBaBy
         JqsYSlQ+QVR4PY6B8sW/B/4HVv3UlD+EhboIMD+aDkq32sfsxhjgazaaa8RLwzsIx1oS
         PIMCUCnzQm3TCDUXAIFZIG8AS2ctvtmn+hoJSynxNgXXkuQkYN/NIt0uIwTSx8AQIhVr
         H6UtHgYewYrCgDqJ85DALlD6aH7ElIC3gDrXo2PVpJy6wKKrFEgcv+e6YbUvLFPFFQfH
         gjxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712763531; x=1713368331;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ziNLBEavMFMG0GfbRRHA8010gbB3jZaJU46gRxSDrTY=;
        b=YKtESkcJms0UTfYFEbCb9/OjVuB956S5wblxx8DS3Qgyp1o3MaDafpuKEkmiASQzS/
         gpNtIT+u0TRHEa53c663Tw/qpCnjzAk2uAa6Qavh0Ss/1dhG7Bxulsh/jkdaSBzxIsto
         XviWPfqkUCKy+1OFVKWDI6XYYq9Ouib9fX1dtY/Qnr1zc2T3gbdL8mQrAkew2Yk1AZ5O
         KhJhRa6N0EF2lAXMU/CarcVARm4BJCqLTRfT5Vw+BIb/sT1Dd2gbpP6RouCZy7mz6z9y
         FnaFlznnL3RBvpdoupVW7XnzTE43Nv4wmXVO+7qyRbfn+jP+KMZXVYjEsF8bltKGwfGv
         UhMg==
X-Forwarded-Encrypted: i=1; AJvYcCV8gmzkEf+cCjBUsvjJRWQb76UtJKlb9JCtHmBTaUDO4XJZBSIroJ7PeCk4owEYNzPZ9t6kpwF6RylzqIpsszuBLXosze/xAOmvbPg=
X-Gm-Message-State: AOJu0YxPzZmJ0mt/5PACMOaTeZ5oDHt1n8Ie6gnluUwoGn/HMo6Ux9Mn
	Z17VYyRw4KbUSyAHxiLMDCwK/ki/P6EIMJElO3j0Y7T5TjqE/RMULF5zG/9l/BY=
X-Google-Smtp-Source: AGHT+IG2wwHYacJLlQJ1p8tbRHpThfXnZhkjy+riyIarl5DIopRdALbX2un4cz4Xr1qBJqWWBM+Yfw==
X-Received: by 2002:a05:651c:1a28:b0:2d8:34ad:7f4e with SMTP id by40-20020a05651c1a2800b002d834ad7f4emr2818446ljb.4.1712763530670;
        Wed, 10 Apr 2024 08:38:50 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
        by smtp.gmail.com with ESMTPSA id v7-20020a05600c470700b00416b2cbad06sm2591936wmo.41.2024.04.10.08.38.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Apr 2024 08:38:50 -0700 (PDT)
Message-ID: <757b554b-add9-4d0e-89cf-0a5569187f18@baylibre.com>
Date: Wed, 10 Apr 2024 17:38:48 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 13/18] ASoC: mediatek: mt8186: Unify mt8186-mt6366
 machine drivers
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 broonie@kernel.org
Cc: wenst@chromium.org, lgirdwood@gmail.com, robh@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, perex@perex.cz, tiwai@suse.com,
 trevor.wu@mediatek.com, maso.huang@mediatek.com,
 xiazhengqiao@huaqin.corp-partner.google.com, arnd@arndb.de,
 kuninori.morimoto.gx@renesas.com, shraash@google.com,
 nicolas.ferre@microchip.com, u.kleine-koenig@pengutronix.de,
 dianders@chromium.org, frank.li@vivo.com, allen-kh.cheng@mediatek.com,
 eugen.hristev@collabora.com, claudiu.beznea@tuxon.dev,
 jarkko.nikula@bitmer.com, jiaxin.yu@mediatek.com, alpernebiyasak@gmail.com,
 ckeepax@opensource.cirrus.com, zhourui@huaqin.corp-partner.google.com,
 nfraprado@collabora.com, alsa-devel@alsa-project.org,
 shane.chien@mediatek.com, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel@collabora.com
References: <20240409113310.303261-1-angelogioacchino.delregno@collabora.com>
 <20240409113310.303261-14-angelogioacchino.delregno@collabora.com>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20240409113310.303261-14-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 09/04/2024 13:33, AngeloGioacchino Del Regno wrote:
> @@ -318,16 +409,24 @@ static int mt8186_it6505_i2s_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
>   static int mt8186_sof_dai_link_fixup(struct snd_soc_pcm_runtime *rtd,
>   				     struct snd_pcm_hw_params *params)
>   {
> +	struct mtk_soc_card_data *soc_card_data = snd_soc_card_get_drvdata(rtd->card);
>   	int ret;
>   
>   	ret = mtk_sof_dai_link_fixup(rtd, params);
>   
>   	if (!strcmp(rtd->dai_link->name, "I2S0") ||
>   	    !strcmp(rtd->dai_link->name, "I2S1") ||
> -	    !strcmp(rtd->dai_link->name, "I2S2"))
> -		mt8186_i2s_hw_params_fixup(rtd, params);
> -	else if (!strcmp(rtd->dai_link->name, "I2S3"))
> -		mt8186_it6505_i2s_hw_params_fixup(rtd, params);
> +	    !strcmp(rtd->dai_link->name, "I2S2")) {
> +		if (soc_card_data->card_data->flags & DA7219_CODEC_PRESENT)

Is the flag missing like you did for mt8195-mt6359.c ?
			if (!(codec_init & MT6359_CODEC_INIT)) {
				dai_link->init = mt8195_mt6359_init;
				codec_init |= MT6359_CODEC_INIT;


> +			mt8186_i2s_hw_params_32le_fixup(rtd, params);
> +		else
> +			mt8186_i2s_hw_params_24le_fixup(rtd, params);
> +	} else if (!strcmp(rtd->dai_link->name, "I2S3")) {
> +		if (soc_card_data->card_data->flags & DA7219_CODEC_PRESENT)
> +			mt8186_i2s_hw_params_24le_fixup(rtd, params);
> +		else
> +			mt8186_i2s_hw_params_32le_fixup(rtd, params);
> +	}
>   
>   	return ret;
>   }

-- 
Regards,
Alexandre
