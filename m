Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94989159571
	for <linux-sound@vger.kernel.org>; Wed, 10 Apr 2024 12:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712753187; cv=none; b=eeeLnVEQg0Qy/VUseVH/vB9rTU3zBVItVF3XsPpfx/cPoT0ka8ZUjpT4O6Yo1CYbnEojBsisksQ5hDi+ZjR+udKVBuKl/pELdK28cUs9LpkG379ZxTAHzIBXlzwu7mMmRsd+xwVtsR5/YrFNlwhJ5kuhO0zp/rqOxUX/VVYR3lQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712753187; c=relaxed/simple;
	bh=GlhTbnoCH5LqqMhlWZX4WN6cM8JR3RmYHTCTw3QDhGU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pDikG+s4/wxMZJwOHcs5VUGpX7V7rv3yMJaCrv7EMV56D2OQdieup/FJZzuYdNTyZyVlzf4kQ+yDIwSpVDnrTi8K85yOz4N9wi8BPyEsrJnvNLJPsNBI/OEJBWLkpPahGOVoTE04X1xvCkA/crFdMAW4nd+fcFEImeM2NAPom78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=V3Lqumza; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="V3Lqumza"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-416920b1a2aso17339755e9.2
        for <linux-sound@vger.kernel.org>; Wed, 10 Apr 2024 05:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1712753183; x=1713357983; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AvhmE586Q7RJLDEspXESCrmM8e1J4xn7f2FL+r1Qxs4=;
        b=V3Lqumza5HAS0F5Km1IdWdf9TYMFVMSt/pdZxDDK/AID1t7xq+BO18xtMVUvPaHWxX
         RjrYmsQI9gUS9miOltIgMj+WJxYdPdhqylKDocVJb07MpzL42HVR+sOwMTnS8tlAiUUp
         RPGkvT5NfrlpFUqM9tUIswdSz1EePrKf2XYFQF2upks2THfdS7So/j0o2w4Xhom35a4/
         Wh5YlvCimUFTUjhD/zdTGhJlOqY08CUHXAiFVHFHOpikwXJ3uLbfGenmdBqxc3tD6BRz
         cJ1x+SRapUtY2ibwOw4Qn5qIZHLAUGx1/Ky/5VKtn548iOzWQTrIOsU8oOy78cTyzoPL
         dSiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712753183; x=1713357983;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AvhmE586Q7RJLDEspXESCrmM8e1J4xn7f2FL+r1Qxs4=;
        b=nxv4VgzpzwYivJzLQAcxmbZjytxQKc7CBWovB1ll0h2GpeqsCbIVv9O0HGHLiWxAOb
         yAV2301B+vB0fn/GdUeVbHgDa0bApfR4C7HAo7oiMNf8GsDRryd6iVAhE11EixIq8U7c
         Z0CMb8YcCuN1wmAWn6rTgSN882iCjAD7hbKfAUyCvtl8p0Yvs3a3x22wyaF1/yOmeN2B
         hwghNCrqkuFkNgYkdDLl9ObNN4CtUqNveWRdUDvPQJvNELqZGQtt53ppXCJ0DHJUKLYI
         mPRt9QVZ2YVGJqos25Rp5ZTKmYtptKREEqfdfOmewMDgmXZpQdA77tDh23Z8giVPdk0O
         lOIQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4TiW4YfkVv8qZGpj5+J/aNbSDdN3mSoZkH254SUrbKAkra4J/Pmd4yb9LIidIwvM1cfuZ1bqZjI/8g+05fPGBeCRrt7EebWlP5sw=
X-Gm-Message-State: AOJu0Yx1bA+Dz0nQ2VdgYIWjoERbMy9huEEhkw1U3xk0RiAFEsPEv39M
	vOiG0Cb2viwwszdgszQkyf1q6Oi26JmJLi/7VddcOcUVL+xuP08c/CNkpFHdvwM=
X-Google-Smtp-Source: AGHT+IH/p5zp4MA87AZJY28HHV74sXRlJbaCaAhPeW3fvyn77BGC/TGc4xDQpjJDHMWC56s9vnYqaw==
X-Received: by 2002:a05:600c:198e:b0:416:a8b8:a8a7 with SMTP id t14-20020a05600c198e00b00416a8b8a8a7mr1764086wmq.40.1712753182974;
        Wed, 10 Apr 2024 05:46:22 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
        by smtp.gmail.com with ESMTPSA id v13-20020a05600c470d00b00416b06656ecsm2190983wmo.9.2024.04.10.05.46.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Apr 2024 05:46:22 -0700 (PDT)
Message-ID: <713cbf7d-8418-44a8-9b35-6503fe3df0d6@baylibre.com>
Date: Wed, 10 Apr 2024 14:46:20 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/18] ASoC: mediatek: common: Constify struct
 mtk_sof_priv
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
 <20240409113310.303261-3-angelogioacchino.delregno@collabora.com>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20240409113310.303261-3-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

On 09/04/2024 13:32, AngeloGioacchino Del Regno wrote:
> Apart from a dai_link_list variable, the mtk_sof_priv currently holds
> data that never gets modified during runtime.
> 
> Constify the mtk_sof_priv structure and move the SOF dai_link_list as
> sof_dai_link_list in struct mtk_soc_card_data, which is a structure
> that already holds the card's machine specific, runtime modified data.
> 
> This allows to safely pass the mtk_sof_priv structure as platform data
> for the commonized card probe mechanism.

-- 
Regards,
Alexandre
