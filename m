Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8AE2174EE1
	for <linux-sound@vger.kernel.org>; Wed, 10 Apr 2024 14:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712760946; cv=none; b=dSqP6ednyHHDt/LrqZZWs1l8AhUvPSufKPvrJzQOfGj8X3yZCXTr35HW7vC/eXouW0tPJSmLFrnj3FTCLk/bejAmqipSbdhd1TUnZ8rVSugfnBGdaTTJI44HFtZxID39AiwY2mmuZtLC2Q/ksNbMl4a3FHlJ19NrwNDHObW7wuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712760946; c=relaxed/simple;
	bh=UKOOA8/7HQj4e+/LtfW4BZ4tyj66iZmzmBjEbudutfI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gAUOHyCd15iFQB4952Ft6rXNZIPSBAqzWxq2sFm045D1JbdjwFwq8cqaBoanWjJnGZ9i6LHNc9eO7vgg3sskqQ8GL1Cul0m6gfofS7ZtbbajKhOdqGLqdw+70TTBGcppdzdtbvRkFIbICVFgJC+GGY8Xw6oZ46Wh2maSVugz0e0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=1DX2RzVs; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="1DX2RzVs"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-417c5763d3fso1828805e9.1
        for <linux-sound@vger.kernel.org>; Wed, 10 Apr 2024 07:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1712760943; x=1713365743; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qkM79gW6w0NVDaaTQoSffcdoou57mwLCTgADK37diJ0=;
        b=1DX2RzVshblQ96T0M9228b6U7oj5m0wslbjMdhsS8VzclEzlK/XXI1LSvnFv5BjESF
         cB7CRok4aFWDyB23YFA61iZIzTx8lA2TecHfZzCIMpi+vvIy/FFW7AHXetURShSodPp6
         lVV6WoLof2QYVNFAU4VqjWRxXv0MdRfGrHlEEDUi1vFyLCsOVXNsxR6dx9xpWntz+dnv
         /tRhezyeFWQBmK3irrjPWxuM9o1TPQcN6vBK+K4StsfZPAiCWpHZ5173A5E9pKAift4S
         pOac36TY7FtrdBIpRVBfy7Rb344t5t4bHgNcW8lIUCZmjonesbQPOn8mPw+ZtoB8vr3J
         78Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712760943; x=1713365743;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qkM79gW6w0NVDaaTQoSffcdoou57mwLCTgADK37diJ0=;
        b=sJewwBoQ4M5efBsmZTzGjcbzcvVo6kSgis9oCQXJpQ1O2ra7dxzhjGF0il8YQ1UieK
         2GtktWZ54ehwgnXhf3e1KPm+8jeGSUk0b0LUcv0V4kPAet0EqKSVpjT62FAdAB+t0YJP
         xgoKcZE4YweuUgJW+TV+t/z5oPIMNb9h1clJM7zzIcdsyXLTuii6zCjEcSY/BNqYV4Q8
         xkeN5YpWFvPWXCCzduC/ViXusp2HXHaxY7JRe6XjxCAQg+DTliqV3OAvqJ113xWoSHY5
         pK1FcmH0ZR4XcbHmqFz1cSALViB9y9kyFMsc4BdIB0oqolrmWqPETxE5E1F6myErnHtq
         7YKg==
X-Forwarded-Encrypted: i=1; AJvYcCVEKEmYvqcYTwsgYU7UgmP5BNfUm80ME1gjX8yTYYxkRh/u3Sqxxn3OY+KSdQjWYW0j85++B5hOi/0FjRymlpQO9YthGwahJtlXBD4=
X-Gm-Message-State: AOJu0YxZJMDmgPDrdmZN7Y56okkXXAkXU4Z9B+wDsPrBiw6MH4arqLRA
	ZL5WY7yHJ8DbTdDI3MoNmbI2JwBfYDyxKJc4pOteIcxB5wKZJ8KWal91ToQG0Hw=
X-Google-Smtp-Source: AGHT+IGNeLxOaiscREzifrbAz46PPEQrwOJh5pOyr0RZ/5W5R5nlpeialGLWcsM4T9o9oxKaQqjncg==
X-Received: by 2002:a05:600c:4511:b0:415:8651:9b8e with SMTP id t17-20020a05600c451100b0041586519b8emr2356050wmo.39.1712760943089;
        Wed, 10 Apr 2024 07:55:43 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
        by smtp.gmail.com with ESMTPSA id bg25-20020a05600c3c9900b004162d06768bsm2523860wmb.21.2024.04.10.07.55.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Apr 2024 07:55:42 -0700 (PDT)
Message-ID: <c86fb571-fc66-4549-9592-9ea984f3e49b@baylibre.com>
Date: Wed, 10 Apr 2024 16:55:40 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 09/18] ASoC: mediatek: mt8192: Migrate to the common
 mtk_soundcard_startup
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
 <20240409113310.303261-10-angelogioacchino.delregno@collabora.com>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20240409113310.303261-10-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

On 09/04/2024 13:33, AngeloGioacchino Del Regno wrote:
> Add a const mtk_pcm_constraints_data struct array with all of the
> (again, constant) constraints for all of the supported usecases,
> remove the duplicated functions and call mtk_soundcard_startup()
> instead in all of the .startup() callbacks.

-- 
Regards,
Alexandre
