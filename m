Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794956785;
	b=CbT3Ee8UPQJa1LjRyJK3Wd0oIsb/iKZAFwKbfHgYJNXEcYVVUcqreyRxBKvaJSRRvDJD
	 Z7e+dcnUqZm/YNXcBfbPYLUeYiFGzGiHNlwQStsVeqTPBAvfYF8qEYS/Wslxbm9UUhhJk
	 Rh8a7UIydOZdeA3Snmi+j2tvPnU9XjUaCdnnJ5vSQhBPu+dYVSCF7dXh7SlkGhcQI/bjk
	 4IFiQ+QoFc/ckjECx87n9o2ltBehCmvVWk7foGU/sedv2XGpHf5YeKeiLUGOEHcCop0qa
	 l6ofG4onIX3vx2hBsrUIPa8diaFKsfbBiYHy8FSqh2C8nfTejHYdbm+9jtoenNGfGZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794956785;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=CVXN+qwLQ/4ILSHfByjoRfxLA0JPwlmXH8qZtCGxHvY=;
	b=iGvrO7XrEEKiLGClWoqEHb1TWjh4Er2HEBhl9uBrLbHnak7pVNvWhLKK4038D3hBZYqA
	 uto/gU7SJOZG9KGYBMzQi/Ha8X3BHXu+1vgEFattPFZzE21KxS5UFTco6/vddz3biaECk
	 iNRFZzMrizoHujzxvppmJ9xVKxasjgVA4HEjK+3QP8e+iRtxQEjaFzXiIlfMQdkq530xj
	 oCw3epo+xOR896pFyEiP77kKFms7eNt2A5MJlwk4foXq7YQWjxHBTrT5G2RQHKYM5FpXx
	 TPBMv0bqL67lLoCJNz2CzH0Ghu7/UEf6bpmuwHys5PabyW1bWmyrDjetN7k4Qy9/1ig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FU4EajTC;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4C0F606A31C;
	Tue, 17 Nov 2026 23:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FU4EajTC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DFD21F000C4;
	Tue, 17 Nov 2026 23:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794956785;
	bh=CVXN+qwLQ/4ILSHfByjoRfxLA0JPwlmXH8qZtCGxHvY=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=FU4EajTClbk+UNGRJaIu1Fbqw/8Hlb9cInBWDZULvl+q5Rs0S9qyU46IjlKdFjfjg
	 tmtvhxfT5lSi689rW8I0/EySPCSr7OENtQOzvVhomrJ+Rj2nYyMnbXuyxt3a+NF/ZP
	 YXH9WEoWQ8nKDwK4zNW2pV/3psrPMMnZwY6k1NF3wHOw7za+yw2RWxU9P03w+jyj8H
	 kL6Luv5t69SO4ekKAK+JghYzzU0QRppFvexoAHYu9riMCUnxQPd3cAXg30rNdR7jgj
	 9wEzxbMscwibkuPJUILSh5tzWdbKRl9gURWzUr4IG/SpUVmQ4KJJyNjRHft/wE5aHM
	 uSfEsrTJulRPQ==
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v6 2/2] ASoC: airoha: Add support for AN7581 PCM driver
From: Mark Brown <broonie@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261117193851.235272-3-ansuelsmth@gmail.com>
References: <20261117193851.235272-1-ansuelsmth@gmail.com>
 <20261117193851.235272-3-ansuelsmth@gmail.com>
Date: Tue, 17 Nov 2026 23:06:20 +0000
Message-Id: <179495678063.2707353.15768423590934276319.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1724; i=broonie@kernel.org;
 h=from:subject:message-id; bh=qrOI7FlHanErllct5TLZyyoHEFtyXcHacENy1NTm72M=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLL+3H3btndd62z+xVemHfos+rP5RvH8fwJHfzS7S3YwL
 Ync3mAt0FHKwiDGxSArpsgSl8X9sr7k9Rq+gwvbYOawMoEMYeDiFICJnDZj+B/K5jS/z+zxHc7F
 XV3TH3e+bvrLyf9XNJ4vPO3OdQa2OasZ/jucYbteI6ny5VFTQeUjRoU9s6tmBN7i7LwdImLqZX6
 riwUA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

> The Airoha AN7581 SoC provides a PCM interface for VoIP applications,
> supporting playback and capture at sample rates of 8 kHz and 16 kHz.
> The driver configures the PCM bit clock to 2.048 KHz and supports
> 8-bit and 16-bit samples, with up to 32 channels.

> +++ b/MAINTAINERS
> @@ -796,6 +796,13 @@ F:	Documentation/devicetree/bindings/sound/airoha,an7581-afe.yaml
>  F:	Documentation/devicetree/bindings/sound/airoha,an7581-wm8960.yaml
>  F:	sound/soc/mediatek/an7581/*
>  
> +AIROHA PCM CONTROLLER DRIVER
> +M:	Christian Marangi <ansuelsmth@gmail.com>
> +L:	linux-sound@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/sound/airoha,an7581-pcm.yaml
> +F:	sound/soc/airoha/*
> +

> --- /dev/null
> +++ b/sound/soc/airoha/an7581-pcm.c
> @@ -0,0 +1,931 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Airoha ALSA SoC PCM platform driver for AN7581
> + *
> + * Copyright (C) 2026 Christian Marangi <ansuelsmth@gmail.com>
> + */

Please keep the entire comment block C++.

> +static irqreturn_t an7581_pcm_irq_handler(int irq, void *data)
> +{
> +	struct snd_pcm_substream *substream;
> +	struct an7581_pcm_priv *priv = data;
> +	unsigned long flags;
> +	u32 status, isr = 0;
> +	int ret;

This should be irqreturn_t and needs to be initialized in case we didn't
see anything we recognise.

> +static struct platform_driver an7581_pcm_driver = {
> +	.driver = {
> +		   .name = "an7581-pcm",
> +		   .of_match_table = an7581_pcm_dt_match,
> +	},
> +	.probe = an7581_pcm_probe,
> +	.remove = an7581_pcm_remove,
> +};
> +module_platform_driver(an7581_pcm_driver);

You should set snd_soc_pm_ops too.

-- 
Mark Brown <broonie@kernel.org>
