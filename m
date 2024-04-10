Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E88315EFAD
	for <linux-sound@vger.kernel.org>; Wed, 10 Apr 2024 14:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712759232; cv=none; b=Yoc/PCzBnTQs1NlhXft5O6M8IH+2yKfRoSq+81ypFUZZtbLvbfQ8QxjQ25YMYmbVdFFIpS/LFMVKXHhA0Y0rREAj+hhzToSD6N9MwdLZdkkU4pKOvIq3LK9lM86JiWFvtY0kfhbG88tTRwc3RJ44+U0WnBYdpjn64VJLkc7UgKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712759232; c=relaxed/simple;
	bh=ZQv+Cv6FtAbS0T/V0OLwICdE4U3tkVtKCw2XykvAM6E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mz5MIRVPwf83eGzbChBmVHBgUMLZv1aqodn2Hn1SUPuMCrhKnUWNegf2gJ+nTAamblaU7BynzuYf78bzHPAKOGZL/Va6zwrOSHkDBnAWexELYix0i0oeK5Tpjlytgny4Y96pHyuBeG1QSzt7JHPAxHDvQ5fB6LvlTCrUa5K6ih8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=R6qshOfs; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="R6qshOfs"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4165caf9b2dso36770185e9.1
        for <linux-sound@vger.kernel.org>; Wed, 10 Apr 2024 07:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1712759228; x=1713364028; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zFeYAr3tgWzelp4Qc502/jt9QrT83vOai+OT7e3SF3I=;
        b=R6qshOfsJU7pmFY80xi8VFZwgh/Ivl7dRFAXLdXeoH97GbYFfhEgCAIOBN2XC+njzD
         H4/BFFZ/Lx/Xk4eaN50r+4MMGwYoLdzG3QuLjHRuRN4d6gRU/PeCgjc/d/U6LmWpMXq5
         UrZFHINvFfGnjNdCRi2JcyTyQiqjkZ8OSjgTG/DHdOttEGhhxR1AZY49IC1Mz6w4etow
         1mCdzlfHhT6p7lBDO2+DPZuAFfbItc6mNGnitd252x39LR5HMCqmRwFscdfhlNe9LfFl
         8D+jxh8S3L+Z4ZGX78QPU5Ijl5/Wgk0UjGmBcms4NkuN9kKTjYDsFyE8yAcaEzhaBt4X
         r1eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712759228; x=1713364028;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zFeYAr3tgWzelp4Qc502/jt9QrT83vOai+OT7e3SF3I=;
        b=GoEhekT5z7FX/9CzHxcTY4i+oLtjL3MgcVcbTK4UWbHlztLOkgtZ3JA4GiKQQyMcqX
         cYHYuYusbmzQ2hD495zKu+kZfdkmy+AZw89mKI6rFfa++9QevizuH2IC7Ncse89C2d/i
         ozpgDAN/K2t3vaBlY7lu5OrvZDHcQBdDjaLdAbWFuLnWq1EsK3WNrxQmY+iYLIwZgtCv
         JJI1KMIuEzbQmfuq7T4UKgkFt54KYfCtdHq+O2Ugl7zd87iSAGPT8YktTlhjtHMDTB0M
         abkpLip0qhAeZhW6mH9Y6Nvw+GAD9ITNOmwZbueRX/Csgan0lyasnC/56p9Lkf+UhvzL
         tCmw==
X-Forwarded-Encrypted: i=1; AJvYcCVBWYEHKcxSvmNT2BQJtBbTw69DLsKR+xtGntIO4QHXZSf6uVEl1TVTeJ7tj/dCaHmJGyPRIRX3zkgOp1+3Ss0AAZ7GnqQ20UrYrgc=
X-Gm-Message-State: AOJu0YwlQX1SSVfOSxmdQc4IIniZBNTAQPm5AfTBviSwZwJXDcuxaGCh
	Cjl6Irz5iOEWEqOLWywkbPJgN94PgGvXswasJ4AIYR2PhG0aXrME3LQqqBkM1Yg=
X-Google-Smtp-Source: AGHT+IGSvVBdvyjiYeq1pMtO732y4Er6q/giXpAXAVvEFvGgI0ZjYjMZMlOGyJUSQFXanGM+QGMBOw==
X-Received: by 2002:a05:6000:188a:b0:344:4bcc:ed28 with SMTP id a10-20020a056000188a00b003444bcced28mr3345746wri.32.1712759228609;
        Wed, 10 Apr 2024 07:27:08 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
        by smtp.gmail.com with ESMTPSA id b17-20020a5d40d1000000b00343cad2a4d3sm13846851wrq.18.2024.04.10.07.27.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Apr 2024 07:27:08 -0700 (PDT)
Message-ID: <d334ddc4-3c8e-49d7-8940-30f78bff823f@baylibre.com>
Date: Wed, 10 Apr 2024 16:27:06 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 07/18] ASoC: mediatek: Add common snd_soc_ops
 .startup() callback
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
 <20240409113310.303261-8-angelogioacchino.delregno@collabora.com>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20240409113310.303261-8-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

On 09/04/2024 13:32, AngeloGioacchino Del Regno wrote:
> MediaTek platforms are typically setting PCM rate and channels
> constraints for playback, capture and HDMI/DisplayPort playback:
> commonize the startup callback by adding the PCM constraints data
> to the mtk_platform_card_data structure and by reusing the common
> mtk_soundcard_startup() function for all of them by getting back
> the parameters from the aforementioned struct.

-- 
Regards,
Alexandre
