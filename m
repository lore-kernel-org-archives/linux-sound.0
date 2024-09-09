Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6085E1B86DC
	for <linux-sound@vger.kernel.org>; Mon,  9 Sep 2024 12:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725886275; cv=none; b=tSKmAGP2j6PiJZh++EY8YheDO89q9islInyucRl/LX3GzFOZNm4WGqSr3t77/umHyOXJ1fV5T+5Ei3Xca3HoHK0cxXb4+ikwx1oJstn/r6YflA2y+HBFMneoLTSG0dU2E0ml/mc4oEv/G1PahQndiMI00K2o1cjE3e7GRTgw8tI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725886275; c=relaxed/simple;
	bh=lcPgoVo3a2tHQWwBFLfuyr6TwNwy7++H7R/IbpHaKBY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o9CKNvOlXoJcbpcmMz77Gkb+dB5YpCtXPp+7AGlDLrpEEF7Y4V1pADCMzJ5Sz8UmDKUH/LgB4JgV4Da+70nrXvCPScQDbTKGGGslJLQ8GTA2Hz6dUhavSYbYnQ5ClgzcRYxdg3ZPL3HzwU/xqzMi+v1loxSuN5K6k8lFsXTRIT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=vNBYQkup; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="vNBYQkup"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-374c5bab490so3282960f8f.1
        for <linux-sound@vger.kernel.org>; Mon, 09 Sep 2024 05:51:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1725886272; x=1726491072; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Yj5yLv/ZZH1FRnKgAiHYKIRr56LuHNVkVtzMQnax5UE=;
        b=vNBYQkupGnFATCi9U/AJjAiLosV/dc5kdqJrylDpiQ6kSZGAscICKMkaSaeSNOl/ba
         c7CWXfe+Mul7p0LKqf58xmqxi2ZwS5PsJCfQ1J4GZBW96+Aode/Mq2R5PhQh60gzcAHw
         2CbXF38CAV8sbffQ6HVlxQH6vo2/OziItJLeznNeojukx31sZT6F7tnkqq/RbDhuZXE1
         lK21XkPoqCpZcBVgwd7OSj02qrN5IN9VX8rbWUZCyeLCP4lD133QYzZaDxQWUVGPELaN
         U9S6tARNfFx12aNUDJS1qSpaITFsJtRf0vW1XiG397PKM4nUP1xYW8/ySCtCokFqsiUE
         yTKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725886272; x=1726491072;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Yj5yLv/ZZH1FRnKgAiHYKIRr56LuHNVkVtzMQnax5UE=;
        b=q0WUfuI4BdxSrg2MCByZ6trwjLt5s3gTljElWTCNtB0dJonvEYjJchTJaUfX0v2oie
         jBj1Mqz6DeotfDITsscp+MqXlDrpXxWhCfYmvPoBvpkILCfN0qsFx9gckJxmrQIEx3Il
         /4RjhwwpgTFMhO0+k8Yi2KU14i6q3zVw/dhUkb5zAbNAH5dtHbjajbVQmvSLEGxEbYxC
         W6v8uwIcTZ1jNJOdg6EsjZ6VK2AOHSpBPBWmReCvT77DITouSr2F06LdVoEWw7Kkx+8B
         tVFatFKRJ33vAdcMNCY5Qx35mwf3jooRkL9bgbrUp5xzdEprkYYfQUthWEAURuzbVEyu
         wGaA==
X-Forwarded-Encrypted: i=1; AJvYcCWYOvyXK42kLU5Fdd3nQ+JZ2aZ0PSLOsZ0x1+bRMlLqxfLhMOHHLKDmu9HbYgyWfBN3hc3oXsCFGlBRLQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzcuyDd6tB4kZppqBHALScN/C555iesYexglApIef1NkIdqf/F4
	nFP0wDAo0BiWFuAWkQdfX9kyM5pXtrY7HNQQT/WGaZpAnsDZnNthxfbveqOoGYo=
X-Google-Smtp-Source: AGHT+IF7+n0ukNJJ1C8zj6VSJDueCV3USNDHumSPWy7hUUSWu75cFlU2nX0q/4jHTWZ6HrRjePiq5w==
X-Received: by 2002:a05:6000:2c5:b0:374:badf:3017 with SMTP id ffacd0b85a97d-37888b34ca8mr8233636f8f.33.1725886271596;
        Mon, 09 Sep 2024 05:51:11 -0700 (PDT)
Received: from [192.168.0.172] (88-127-185-239.subs.proxad.net. [88.127.185.239])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378956d2ec2sm5998400f8f.75.2024.09.09.05.51.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Sep 2024 05:51:11 -0700 (PDT)
Message-ID: <5db7058c-79d8-4fc8-8f37-89cdde68984a@baylibre.com>
Date: Mon, 9 Sep 2024 14:51:10 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] ASoC: mt8365: Remove spurious unsigned long casts
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Nathan Chancellor <nathan@kernel.org>, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20240907-asoc-fix-mt8365-build-v1-0-7ad0bac20161@kernel.org>
 <20240907-asoc-fix-mt8365-build-v1-2-7ad0bac20161@kernel.org>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20240907-asoc-fix-mt8365-build-v1-2-7ad0bac20161@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

On 07/09/2024 02:53, Mark Brown wrote:
> The regmap APIs take unsigned ints not unsigned longs so casting their
> arguments to unsigned longs is not a good choice, the constants being
> cast here are all unsigned ints anyway.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>   sound/soc/mediatek/mt8365/mt8365-dai-i2s.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/sound/soc/mediatek/mt8365/mt8365-dai-i2s.c b/sound/soc/mediatek/mt8365/mt8365-dai-i2s.c
> index 5003fe5e5ccf..6b4d8b7e24ca 100644
> --- a/sound/soc/mediatek/mt8365/mt8365-dai-i2s.c
> +++ b/sound/soc/mediatek/mt8365/mt8365-dai-i2s.c
> @@ -385,7 +385,7 @@ static int mt8365_afe_set_2nd_i2s_asrc(struct mtk_base_afe *afe,
>   		/* disable IIR coeff SRAM access */
>   		regmap_update_bits(afe->regmap, AFE_ASRC_2CH_CON0,
>   				   COEFF_SRAM_CTRL,
> -				   (unsigned long)~COEFF_SRAM_CTRL);
> +				   ~COEFF_SRAM_CTRL);
>   		regmap_update_bits(afe->regmap, AFE_ASRC_2CH_CON2,
>   				   CLR_IIR_HISTORY | IIR_EN | IIR_STAGE_MASK,
>   				   CLR_IIR_HISTORY | IIR_EN |
> @@ -393,7 +393,7 @@ static int mt8365_afe_set_2nd_i2s_asrc(struct mtk_base_afe *afe,
>   	} else {
>   		/* disable IIR */
>   		regmap_update_bits(afe->regmap, AFE_ASRC_2CH_CON2,
> -				   IIR_EN, (unsigned long)~IIR_EN);
> +				   IIR_EN, ~IIR_EN);
>   	}
>   
>   	/* CON3 setting (RX OFS) */
> @@ -456,7 +456,7 @@ static int mt8365_afe_set_2nd_i2s_asrc_enable(struct mtk_base_afe *afe,
>   				   ASM_ON, ASM_ON);
>   	else
>   		regmap_update_bits(afe->regmap, AFE_ASRC_2CH_CON0,
> -				   ASM_ON, (unsigned long)~ASM_ON);
> +				   ASM_ON, ~ASM_ON);
>   	return 0;
>   }
>   
> 

-- 
Regards,
Alexandre
