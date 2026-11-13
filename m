Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794551809;
	b=dNKCNT60T8jjc1aUpb+Vq8m92oNqKHSufnc+JjsxwpjW6w+SWZfGgJW1GGMnQkjiR1pl
	 IfJkw3DDhy5KaJ3THIWGxXvjC4+DJ71FstB/U/PRD96IEZTErXgZdWRLAqrP7Od6Izyoc
	 A391AJjI8FTORCXyV54ZQT+buEnViyfPtmduUGG3winfNGd+SCcIYrxI3jfcTAutgTyBr
	 tfF+KBPb+CmK37Dlq/5NjExXSOAeOO/bwYXyT0k3NuUfgzXdE2bp7sfSQSWRrU8ECAJmT
	 WjwWUeT9v0lF2iCjVFhjz0oUEF6kwbkERXIKPlJMNdEu93JRa4K3rhlv/fpvf78k1WQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794551809;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=9FjdCGKO+IXvevdDDEoeEyIunJuJigz0McwLI1lND1w=;
	b=vwnfRc/b3rFjALjrF6isWfFHDQXS8SPGSfOEKBvRDINGaR+X7ZDsE+oG3aOKzWE+9xTl
	 scgb9GfZUO47jdJVDX2yhNWxRT6jq0YXY01XRtsj+2zTsfO9QC1cviW1p6wKIwHlAnFed
	 32JkL0PxD3+QLu3i1gnPuRU52IwLkmOSKPwdiZvBwWYyeaGNaVeee7X/eZgoALVyM9a3B
	 cuO0+yuXQXYEKVt8lsIlsdOAm4MILvIlHgOjD4w8R6U7sxBZlpBDc8Q8rWn5Q6TFM+gaD
	 HqYFfrWDo+IC4oXYGCuD5MrMIkYYWJeRbVv+SInLr/5LdWLDms5Svwxo7Sc7if+jmzg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x8mPrAop;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.51
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB341606A31C
	for <linux-sound@vger.kernel.org>; Fri, 13 Nov 2026 06:36:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB341606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x8mPrAop
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3b1535be329so562315a91.3
        for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 22:36:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794551808; cv=none;
        d=google.com; s=arc-20260327;
        b=s/Ls+HWe80+OKpuSmhrRjJHyiESv0IVgF128pqCvjNzNpYiOjiPN9FkGcxtfTucmrm
         xJ992Ilhrbg2Cvdt5GkjVOdtqne3b8wXpT4jjI9GIG0EOvM3ckEZoO/9RrTImzZaw9je
         7WEEPf/0yonvWSIjw1Z3m7adPWZZ89pVRE1VllgTZYo4HDXQoahGga3Bru5zki4ocAW1
         EFJ5htoNEJl5c8BR2UvIbwaSk7maLwrtW6yJ411AGUx6s2sQ/7PXHO0nrwBHdobeSb7N
         1zVrrVwHRD+uki0gDAOGjWdVzkY9wBN65UXPaNKqlPOA6q/BdUCrsXVMk6BlI970MGe7
         Z1aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=9FjdCGKO+IXvevdDDEoeEyIunJuJigz0McwLI1lND1w=;
        fh=I3zeulq0sqvA3Pt90KS8bh8GBIpVL2l0xvRATomNOEs=;
        b=q4n56j5IcfclbYz8VlR7Mq/eVfMlUw3zIZFXEtl+x8ZirqO2CkmYPp6wOPSfYbGhPh
         eayNt4/z6sL39CAoSd5r8l6vX5k9PH1Z0GAIM+tadTA/evBAPqwfQPEezLykI7qoYa9Y
         rDK7rVEmr2ksiBcZtyA5MB/ebgEK2uixjgfgfk1Vo2ANwZeww7gSQOsdyrRy6DF3gewY
         UTUGQulVNJSzZRCXpkaUzWDxY8vMtNhQL1W3/2ridNrWnLSAyV/ct9BVkNcrhVBMiMHn
         zGNu7ISEoPx4TdIqT59Jo27wuWpINai+LIg66tOL+X5egyALkLYhTHvG1M11czctzRIO
         1aDQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794551808; x=1795156608; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9FjdCGKO+IXvevdDDEoeEyIunJuJigz0McwLI1lND1w=;
        b=x8mPrAoptl7uy2+y2OSPgbGR4k20wDu0gRif7HK9CmhgAbclBzE34Fxt7BbQgi8WQe
         ZmB3XOMANPEiK4A/CZPoWL9ObT9oDg1iZHueJDO+bwmar2FXqbnTItOE/locGcj3y5j3
         jVrLWnvZFdCFh1Fw5o0s5Yja3s8AHT5gVPK92JyqL5EDVs5+90Ue8TICmUk4uj1SW+zY
         KaDbD1KHvtyMAIXaSVW7Oug61VGI+S6aANy2vZ83JL9xj/KYH8lU/U84+39BaFkiGcU6
         sikP8hgNEWSvbsmJPRJFG9n2cR42tHWF5J1uPFWW0g+8QWjsFCKkf7c15tNpPYlCt6ev
         ybmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794551808; x=1795156608;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9FjdCGKO+IXvevdDDEoeEyIunJuJigz0McwLI1lND1w=;
        b=dludKfCYwt3CgD2SOietOmnf7DlyUYGAy26/F68zl8yy1DpBuh0Wz5XmVBpz836Qlt
         m73DnCJxL7i8Yoe7lDPyccagmmTYv+kjyi6pnC955yjV8SkBBdm9xmREXVghRAIT/Is8
         a96KuwmAxvqD6vlYu6lCuWnMu+Zu8hKg17UWj9jfupat13hU/pLfACMrUOWONIRwciIa
         SDTYrVCMOdMG5mUDNG07BH4IMUJXGzbXTzOBGS/txco0DsXR6LKWSOePw0i2w6r2LkCx
         8zY62w04kK+vfelzweMcOl1v9Dq3N3w0bEQtcbYRvRMLrsOqM1eHvWHG8pJERAsCcFRO
         rxCw==
X-Forwarded-Encrypted: i=1; AL+hErHUSbpQxbKD0VhaCbHBGgrQibUm7UCcBz0mUiYzmMnVI6uerV8lYvMV0v5zCtPN6twoqvlUq1gYTuKhqw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/iCQAujNoZpDyXRZKNsN6/GGJ3kYhn1he5LmkCxNexByXkUeCm
	qJYrkuopKoFuYOtBe6tw8U7mfG5hmjreiCyimiOuGyHYb3U/k7biGncgsnF3COhw5GSbwPn7yC8
	0D0EyqhXuOw68OaGQpE12iemheaf9sxk=
X-Gm-Gg: AYBFou06EicAwjez2SwMqbAFISmuBm4oFXsgY0oRnlBkLMXU3E31tqgkAru/c+n4UzZ
	AfgR66CgAMKpPUw6AI+zxEdmegOsYMfbC7NvL4vx0jM7qFcyuYhvPQ3unA9mzTJA76zpbEgrHE7
	4dThkQR5NZz1UipAykJ/58yMVrd+AbGivIYTbN9zruBR1LOurgi3JzBHPwvwmvrOd7jyNY40gbo
	Lag1bBJpuXRyQD9etlfKTieOc0b01fiS9v53hgNphlvCDgHiWUWXkBRfi8NdRPO7L7ibOKVnbit
	b0RNLgvwwdo2oNeld2p9XFyHsw46PZftyewOy79G9f0XHMZc7uoSD+MP4L+H7wb9zzXTQKR/SKK
	THYho43JkXq3loM85ZRtvS7pWwUQY0MdcMB3cRNPuBNSMf3eoMfZjaAzDgIR0l+/p6eG0KvytCy
	L4nN6O73XGNs3N6Upv43rPKKNcVvsKSghCNfKHLk0OGgSlY9MNPBs9bUSy/CTs9OcF9ohWhA==
X-Received: by 2002:a17:90b:1d04:b0:3ad:8ecc:5907 with SMTP id
 98e67ed59e1d1-3b1b0b53d55mr1291888a91.56.1794551808035; Thu, 12 Nov 2026
 22:36:48 -0800 (PST)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112-mt8195-dai-etdm-fix-startup-v1-1-2a9fb98b9f6e@collabora.com>
In-Reply-To: <20261112-mt8195-dai-etdm-fix-startup-v1-1-2a9fb98b9f6e@collabora.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 13 Nov 2026 13:36:35 +0700
X-Gm-Features: AclHuK9Tq39ygLippNfyQDEwgJ14gA2IrkABaa-YFSuCcV67ahZWzbVvf6oujEw
Message-ID: <CAABR9nGLAEoSU58+PCTSAjTG+Hn-fDXm6vtN6_omx-EH795LrA@mail.gmail.com>
Subject: Re: [PATCH] ASoC: mediatek: mt8195: Fix ETDM3_OUT DAI startup error
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, kernel@collabora.com, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

Hi,

Thanks for fixing this issue.

>
> Note that the issue root cause was also detected by Sashiko during its
> "ASoC: mediatek: mt8195: Fix HDMI TX startup error handling" patch
> review ([2]).
>
> [1]: https://lore.kernel.org/linux-sound/20261109102536.357134-1-ghidoliemanuele@gmail.com/
> [2]: https://sashiko.dev/#/patchset/20261014112752.683032-1-phucduc.bui%40gmail.com?part=14
> ---

I wasn't aware of the issue detected by Sashiko,
as I didn't receive any review notification for that patch.

The fix looks good to me.

Acked-by: bui duc phuc <phucduc.bui@gmail.com>
