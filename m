Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793300261;
	b=mXgp6i5MAw35iMC+oCHAtmyVjga9c9tt2sTHKI8Q+goAfTQ258I/TiOig096+UhBxmaC
	 4TTUGg5gfiOblSfCmv6xXxusvylG3DmE8KJsI/3NbLgvE0SAGnhLnn+yOu2/6lhvScOb1
	 utbT0AnIhWn+oQJ3e6Naga5acuEr+srQA947cgAU5Fl5xLeWZVa/vKb0gzfZ4Yir6T7GQ
	 krFZZ0hgfZ++D7DXOE75MWj8dgE3UmAUdTACoENQZqquARGbBdGC9oweeCyRRRlZzBnQ1
	 BP8S/+0hWRLXqEon1S/z/3BWMVB8PdjTRRC4l4WJDr03HxTOPmzOdcPZ0nHsI1CJZKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793300261;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=rj06Pfv59WRvPrDkKSd3+HtzoEa5gL9yGOUZbKlZbT0=;
	b=DEmj6EBw2UwJTyiVZh4wLtWDkWVNEpLiwTmZjZdeb4yvb2JhJfDFDUmnwvaIEh5QtKGw
	 BhgzmWoJpCiOmlK25WOMp0HhmwtG36j60+L+hEPez9zeiDeQL1RsrPnrJYAx2GIJhF3B+
	 T6F7++tw9vKjD7MBb3ehFT1eDbIzp+5A4KaDtGvB3a7OQx18V1M7zksByxlynyW3XUNjF
	 3pCOwD3mZQbO/MrZlv4Zy5SrPTEYDfys0gsh6eIZEk5L4p4FBxABaXN9owihr/AhP8TFy
	 UJtL3JpOJwuFCla/S7xXsHKx2LoRcj4fKOOcDK/YO3MQtDbM72glAyql0j0nw1RGDMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XOaa4xou;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00B07606A31A
	for <linux-sound@vger.kernel.org>; Thu, 29 Oct 2026 18:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XOaa4xou
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4FA81F01816;
	Thu, 29 Oct 2026 18:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793300260;
	bh=rj06Pfv59WRvPrDkKSd3+HtzoEa5gL9yGOUZbKlZbT0=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=XOaa4xoui96A1xWsG8OLS+dJy6uDNyHM8cdOhOPfS0EeGk+rbxvkJqGYsstf8XVCT
	 nu+qjA/5iBZ+lx+qVTH53plfuostrWii2xbxfwK4OA4xgyCLMztWKN/cWbrIplYenM
	 WkIGOJAaJQO9Wh3vom3J+rRGVYXp7uc9BEnlwd9k82vqLAI9j8y+e1HgVW9kj6/0BE
	 eKUxEB4srvG1VY1aPaj9MeSx1rlqh2jVOAS+muQhXsGxPUPnZdPUnSMf/wABRPbm4p
	 kLdaMTJ86QPYWsykEONQaYoiZ2Rk3RbUT1MCOzYrcultiipj7nUGp7fvyNVUvmx27T
	 jvk4XzGK4AFfw==
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
Subject: Re: [PATCH] ASoC: codecs: ES8389: Fix the issue of hpf_freq keep
 increasing
From: Mark Brown <broonie@kernel.org>
To: Zhang Yi <zhangyi@everest-semi.com>
Cc: linux-sound@vger.kernel.org, broonie@kernel.org, tiwai@suse.com
In-Reply-To: <20261023023012.30352-1-zhangyi@everest-semi.com>
References: <20261023023012.30352-1-zhangyi@everest-semi.com>
Date: Thu, 29 Oct 2026 18:57:36 +0000
Message-Id: <179330025628.62540.5715888103847414987.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=550; i=broonie@kernel.org;
 h=from:subject:message-id; bh=VOXeDqjdL10Jb+eqs7gZo/90SYGR0rBlkxPOAZXKHa8=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLIeT1dUNXti7Ds5VvD5jg2MMldO+s8N2vYu7cWrq6l7/
 odqtB7s7ChlYRDjYpAVU2SJy+J+WV/yeg3fwYVtMHNYmUCGMHBxCsBEdt1jZPh2df3pZb5FT7hq
 VUuue5rNPNe6QqftwoSrZgsPKj+8yKjG8D/ujE6Q5zF+HpeotGMpTJeSmr99EU35Y3Lfw5LLu0r
 flRMA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

> The problem is that on repeated stream runs the value of hpf_freq will keep on
> getting updated and drift away from the original setting.
> Until hpf_freq increases to a value higher than 1020, find_best_hpf_freq will return false.

> @@ -147,27 +146,25 @@ static int es8389_hpf_set(struct snd_kcontrol *kcontrol,
>  	u32 freq;
>  	bool hpf;
>  
> +	if ((ucontrol->value.integer.value[0] > 1020) || (ucontrol->value.integer.value[0] < 0))
> +		return -EBUSY;

This should be -EINVAL not -EBUSY.

-- 
Mark Brown <broonie@kernel.org>
