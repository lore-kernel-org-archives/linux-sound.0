Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C27916DEBE
	for <linux-sound@vger.kernel.org>; Wed, 10 Apr 2024 15:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712762034; cv=none; b=fkvSNnTMR4eyk+QkE8xpTDmhIJmdlUUJshQ2O9/DpT4lvfkW3+kSelMSplVx3KvKFXe3Pkd3yb2ZJn2LN95fLqhSJvW56z9hIfZeskO9hM9VuNHzhm5pHYwl9BGpAABEnufNpBGMvf+kRV7nIFztzxv8yDhBfLZ55gySM71+Ygo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712762034; c=relaxed/simple;
	bh=n4JrkSorhynZmSYFDegpGZt7tneK34MYTFY2bPGDfD0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DOCuieeLH1Q4lXb2YUK8mEcIMzTTJkOffmb/Xa96kkmHt6DhOXVy00MNStYZzUnIN3wYFk8HUgb8JFXgITqo2xBOTnbMUocdg5ZELNICwyxHkAlVEgzcjvpNnmtfwrfFz2BQkG9e5iItv8zTlaYrLCn4nBODbTeMuluGE64VO2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=cMKkbVm/; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="cMKkbVm/"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-343cfa6faf0so5070952f8f.0
        for <linux-sound@vger.kernel.org>; Wed, 10 Apr 2024 08:13:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1712762030; x=1713366830; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Xb0tDuasjSNlJsy4sDFiJMtEhz1/MxQR3B46cvvCuH4=;
        b=cMKkbVm/23Ha/TQXmdyWLBng44TIPvbuAYM8asMLC5kscwXiUZh+8oEK2bWXWCL7Gd
         KOUKBc9/qyafWryXHGLLCOwpKHz+rk2uOeoSb1hEtPnC7R50GuZ+EKulDWK8tFsrvVp0
         RA2vpBKK8kd3qNcNFoszqtIzsg64ITx+nZDwLMRETIXW89df6GprhAXeaQUFQcTon2Fp
         OfZ5EkVpRY36NYtoDQlWlJ0iVmFQwhxxqzAEXclL6S5ZcS12+aqgb3n04c2F6iom4KWV
         F1nWjE9b0d5bNc84DF+R5+GocGLNwesbNZSiwGfOWZg0QORiN3v/FoRhEiY7ign0J5P3
         icbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712762030; x=1713366830;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Xb0tDuasjSNlJsy4sDFiJMtEhz1/MxQR3B46cvvCuH4=;
        b=jmoo6WHkP8Rpo5FBkUEb0D1Nm5N32FXEQxlNFlzJxhgSzceOnGoNZV3bc+kxbjgKYS
         Eck3uhqXIOzmDMNjNXHyVVuKq1nxAWciFVvxCvyOaN7lwX9rnL8aTm+TdOEfG+8fpT4B
         bHqEyHpw0dsx2J6Hmh6GP4LYWkqQe8VCtCBoCzFqlvV4ry397iD2Ggyg8TPyEa/1fwYc
         jVl2Dz/f4n1i67TICfKvDI4TyNOhSXibi/EFtIuM6gIPRtGDu/AEkSCBsyzuA1KvvGIy
         i0H0L+Re5HaPmKAFPXsPe3DN4Kp5jL70oWxroCJ2L5GtkFG2swNsWapqQTh+zCOPMRtB
         JRZQ==
X-Forwarded-Encrypted: i=1; AJvYcCUcre4XkM79dTmdXdZM0EqVRMvAXuFMrdr0v65ZHS8vlTpk9NDklVSRquQ0K/zDhE1uuV4evLdeHZcI1R23fsaAph5wAric6owAyjI=
X-Gm-Message-State: AOJu0YywYx66hpiy10wkunC565/h743Zc1KZlvPRyRtv3QzByR66Rqxj
	djyN+swPohleqTJ9H2AQpg3TjfBKTvAebZbQY+s9srkmAOU6SdHlPR4iYMd2wCU=
X-Google-Smtp-Source: AGHT+IGoier3Sm8gMlqmjZALBvxdoG/1vWwzVX851wh99fQXUyteeMA3kD8B7Fgl7bkM9Q+1QuTWTQ==
X-Received: by 2002:a05:6000:186b:b0:343:6b76:251f with SMTP id d11-20020a056000186b00b003436b76251fmr3201804wri.42.1712762030404;
        Wed, 10 Apr 2024 08:13:50 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
        by smtp.gmail.com with ESMTPSA id n15-20020a05600c500f00b00417c0fa4b82sm1118117wmr.25.2024.04.10.08.13.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Apr 2024 08:13:50 -0700 (PDT)
Message-ID: <fd7cc1d7-f293-47f9-9ff6-98b78150d61e@baylibre.com>
Date: Wed, 10 Apr 2024 17:13:48 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 11/18] ASoC: mediatek: Add common
 mtk_afe_component_probe callback
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
 <20240409113310.303261-12-angelogioacchino.delregno@collabora.com>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20240409113310.303261-12-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

On 09/04/2024 13:33, AngeloGioacchino Del Regno wrote:
> Multiple MediaTek AFE PCM component drivers are using their own .probe()
> callback, but most of those are simply duplicated functions as they are
> doing exactly the same thing over and over.
> 
> Add a common probe callback for this component to reduce duplication.

-- 
Regards,
Alexandre
