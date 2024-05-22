Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6D7780623
	for <linux-sound@vger.kernel.org>; Wed, 22 May 2024 09:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716369815; cv=none; b=l3bbihbQ1+ptMrJceeynpvhhB4Be7MXuyqKmjoacrXMZo7WhLQOgzVItgcJZp0E2c834AfRY0+oph4L6/VjHNikQ9Z75l11L0hEFZI1GBoO5Ex7GPEMxyLpEvbjINho9QtJxggA/E6FXXWP4z8IH30Z7mLny1OjXT37IPPHBdTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716369815; c=relaxed/simple;
	bh=odJ0hFWlcsFxkYUX+bZg9URH7tzJA0vJ1p8L+ANWKgs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NgSKtGinW3vcn0fg9PQX6wJoU1on0vL7nNwM0rVnvqIxLZwnPTdLEkneE/gFCJHbTRHQDGqx78VweaoFTsKm/EbN23maF13cEPryIM8JON0quZGadZRdy6rP/6zifQhqBFk5DJPKepMPVoKxLKKemHfKaM1ZIPaee8+GzbT7yYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=fBNLWLEN; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="fBNLWLEN"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4200ee78f34so4814165e9.3
        for <linux-sound@vger.kernel.org>; Wed, 22 May 2024 02:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1716369812; x=1716974612; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JRjtoycu6QiYQPIcHAZ506CIemzizife0bP7oo/LEUE=;
        b=fBNLWLENnPD+OTB14sTkFC/WdeeoMsiib9nbKmGOXQFrZcAkUHDs7pxZSlodulPr4Q
         KzN/WgjC3vOAES0wQGQGJy4ukvGNu/3w2n7vF6dGafLJYynaGQ9CMOp9fFcR4wBSNGtW
         hLuPDCmvC2oE1ul/Eh1WCBU8ah7APy7s7fiiQVh8/0ikHTYS8yrW+qjwQ2V7gshQ3dMK
         f6GPgzlYQwssPYMm/0QQa82tA0w+G0SpDdVB7hqYJgtc6AS9lmajf32N8s/8z31NKmPh
         f5JFOFMkd/tfkNmEHNruKR8EzfkO175c8dEOZBRZMoBQhsDzKPLqN+Co58U5OvvF0BnT
         iXLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716369812; x=1716974612;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JRjtoycu6QiYQPIcHAZ506CIemzizife0bP7oo/LEUE=;
        b=fBgHIY1KKxGy0idjj6Cq9o5/gSz8zCawcPqVWBMJHQ76WuRik+ELCwsu4gwBKA8Dng
         ES8pRy2SdHPPrPSVXL0r13WlbflBDsmsuoBqG9TxLJfCZ99ms0dhLAVyvikfMbMljhGT
         gU416+2pt5jMJN06Grs8xjTvh2q7vn0iQvEkZIh2p5y1JUbpgoKoLqfv3vmDs8lxRXHl
         SHIyD97zv/eR+79+mQxi+4hXAAxfa8RMjAyWzY5dWVBcFHSsv3HXZi2F6t+mK8589qGh
         q1nzYhLJToNzzDoP7e0njFaIb59DUVBdqjQN5flJmixd/aY73uJOdMWC1/+LQQYS/apR
         0mCg==
X-Gm-Message-State: AOJu0YxSlQQ2Wr5BGnI0LE/3uDH8p2k5XT5dzLUjTZRJPlf0upvvaMJf
	b5XoSbA+hm5tlirnj0F9W3s4hnVhpvB1/laZQonAM09xMvE/s3NgruPdQXrWdnw=
X-Google-Smtp-Source: AGHT+IGBRKl5DCZ+kljNpjZnc9YzdCw1hs2bWkudIcHS/AaEdVRmj8bHA3gNsPb+/c/8i/lsYuEbJQ==
X-Received: by 2002:a05:600c:ac1:b0:41b:f359:2b53 with SMTP id 5b1f17b1804b1-420fd37f2f5mr9924295e9.37.1716369811860;
        Wed, 22 May 2024 02:23:31 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42011d91edfsm402874715e9.44.2024.05.22.02.23.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 May 2024 02:23:31 -0700 (PDT)
Message-ID: <e9b8a423-9ee3-4f5d-a0a2-374603762127@baylibre.com>
Date: Wed, 22 May 2024 11:23:28 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 07/16] ASoC: mediatek: mt8365: Add ADDA DAI support
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Lee Jones <lee@kernel.org>,
 Flora Fu <flora.fu@mediatek.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
References: <20240226-audio-i350-v4-0-082b22186d4c@baylibre.com>
 <20240226-audio-i350-v4-7-082b22186d4c@baylibre.com>
 <a693b696-92cf-48cf-8c9d-17aa7f182d98@collabora.com>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <a693b696-92cf-48cf-8c9d-17aa7f182d98@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 20/05/2024 12:27, AngeloGioacchino Del Regno wrote:
>> +int mt8365_dai_disable_adda_on(struct mtk_base_afe *afe)
>> +{
>> +    unsigned long flags;
>> +    struct mt8365_afe_private *afe_priv = afe->platform_priv;
>> +
>> +    spin_lock_irqsave(&afe_priv->afe_ctrl_lock, flags);
>> +
>> +    adda_afe_on_ref_cnt--;
>> +    if (adda_afe_on_ref_cnt == 0)
>> +        regmap_update_bits(afe->regmap, AFE_ADDA_UL_DL_CON0,
>> +                   AFE_ADDA_UL_DL_ADDA_AFE_ON,
>> +                   ~AFE_ADDA_UL_DL_ADDA_AFE_ON);
>> +    else if (adda_afe_on_ref_cnt < 0)
>> +        adda_afe_on_ref_cnt = 0;
> 
> Should we dev_warn() here? The refcount should never be less than zero - if it is,
> then there's some issue somewhere that must be solved.

Ok to add dev_warn, but I also want to keep "adda_afe_on_ref_cnt = 0;" for robustness, even if it 
shouldn't reach this case.

-- 
Regards,
Alexandre
