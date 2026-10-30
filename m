Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793377971;
	b=nrA9/9RPGaej4Di5uq0NBmNTyuvChrPuFyIo6a6lTjjm2a1cFbb5Ml5iW020kAhpPmLG
	 4DVsw1EjWs3TS/OREYDLpYTGu3K9dcSFgxPgvhwohaR6a+HF/hjUtkfS6mgXKehkE43JT
	 7r6Y+IQdPNSJe/vNxBVOu4w53FVGBzMraxql46+ZyR6gvCoZPtEK5RByc5ZOLeAhxerr+
	 KipoLOk3XwQn7ZONkngV6bncqmfyyIb4vUchREZthgW67cbhMFWiXUiDU5flVVRBIhw3D
	 NYPdoNEBbbuFCssAuXN2X0riCIT62QvdKAwKC3kqMAJguQr4H9eG/vgKuwpnyO7fItg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793377971;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=M1SoM7Xac7RXZwO+FnicXP4wRxU5w10jY+RMIW4NnkA=;
	b=Cz1aVh/fAeJAV/W02amLPoOVj1XZZhHhl8UPESGx1urLIxOHr3MbzoGeIJ1amgC1cCC9
	 B7Jfzkzx6hMRwGUnVTkKqGttiAzyrp63xctZlP4XLFA1Z/SEkKYKORwXCeQBpedv9bmNL
	 025KDWGJmEDZWFdRVeLMhi8Kb4cTkhxml+reeg+2C3jS06gwPHlMeu/b7og/EQHmBwGtG
	 AkDjv/MvKmM6DmE70j2gPSx7IRmsIpB58I6xSeTp2qVuxUlLDBSm8XXF+qw1Hl4jFf0/E
	 KEpMY6gYnUsms8Efv7121/bWw4gaERysZWMz0SNiiYbyii/GOO+Y9MvNSFxXgI3H2aA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=UhiUxfVV;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4358C606A31E
	for <linux-sound@vger.kernel.org>; Fri, 30 Oct 2026 16:32:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4358C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=UhiUxfVV
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so9946765e9.2
        for <linux-sound@vger.kernel.org>; Fri, 30 Oct 2026 09:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793377969; x=1793982769; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M1SoM7Xac7RXZwO+FnicXP4wRxU5w10jY+RMIW4NnkA=;
        b=UhiUxfVViZ5IUIzdX30bgbH7bnfmS47mtCkiS1SsXq2cwi7tAd60t4KCAbLJj0lRi3
         2is2jDU1pcSDxlYa62ovzcyE30FMNzCiKMWOh2n48i55nCFOsqpKc7OMZXXMgaxYGErS
         BmYy/tVGiXyCkc34ZmQHijwRYgRDsqp3mY0t/VSiB1ja9LEh8WJYZPg9AGCoEAVTq1zC
         uYhyUdwxKyK7cFYJd8aex9efUxAGg1aGVmk+Wju5+NBPDdYrMEqPEbbPzXGsOM3CsfnL
         uYvQg9pFRPWjZr6uWNcuLl9dndq4BLYXoJrnhOo/tkfzss6/EvQcI1FncFtRPjJj3bz/
         VxWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793377969; x=1793982769;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M1SoM7Xac7RXZwO+FnicXP4wRxU5w10jY+RMIW4NnkA=;
        b=gdPZxXHE3BIO++wWKLf221+FNbuAk0XLInodL/+zeDNNbOdaO5cHxvWYd3GgCGq3Ob
         C03eqhm9GW1HraaOsHc261nc0P/4qikbmQ+yolRREOPLLjCmUtq7SdF3w8YCE0Zu5tUw
         Oi+1Hv3WB20u2A7C5JT9hhHiQq8hAozVX2683jpmxYpN1ECJoVU2tlfGPwnAmI1LugF7
         js5Nh9mzV9k5WEgZ/F/fyI8NLPjndzHQCgM2A6t86LOzKoeif6PdpJLW5OjZOO6G3XSo
         CmwxF2wIB93kCLr7HE0Pasr0mXpnsAvo9qZ6gtEiVcddFN1HJwsIH6M8Vm0gRwUkbOYQ
         d/Dw==
X-Gm-Message-State: AFq9FYKv1BSQrvy6wvroh5r+8PjD+vh1l9KG8fcjFQHY973/Wt+9Z8US
	6vTRju23fRvq6EmULFIjyFH/wKpSNRburb8pjqha2AJX67RNddLtrmOnMUcWDGAWN34=
X-Gm-Gg: AYBFou2SVD3ibnW29vejI8T8n1yllusDgTLdZb29xMep2ipEf5QgCyi6aQTiGsb+sK4
	OxfxSQ82fr235mT5T6EwNvK91QHqRyTVWV8GUbKNjm+QTtsnzNBOtT0h5yRUwwaOg/o8d/uQ8/K
	LVbcmmssZSzCPu5l5LsXKzpOMkOyV/U70ios8OLaQ8iGhA1cT6cJCIw28mQbQtH7xEGWge/QG76
	KdXxOx4rQpbG91/P/XsWAhMN37jAl7kvENhB0+3L9FZ8Jj0KF7INQAS5xDGPyDRf9M86v+aG4+c
	wxZ/OX+elDPU3yRaC7h8pkmirAQdpAFTzg+fusOBn6qScnCjZ3D6dttyCmUnpj9aTF9Kysv6w8O
	kXZssnTuUxLzYZjN9GfQIxwYaj0wF026d5b4Bo3LPUGG+xRZJQW+wlMKzX1pNpYearHsKkeN4GU
	Nc6G3RCt9GnS21nvrJ/wM1ugjY4XBBd1NroQIdH6VAx+i66rlKjdrWcX1vr1QoSkVVn6YPSSGCx
	ilmFdaLnS6Y3xvW3Nz3EEs1mmNCjM0IVLGJx8Qyn8qiLHYhjbwZwX4dt9nWIoxn6xeNVPO5q1en
	u4cDbZzelyM3AuHEpX5fyXNTpHbPisFMcG/vJVsgpAz17YCp
X-Received: by 2002:a05:600c:46ce:b0:4a6:7d6:821f with SMTP id 5b1f17b1804b1-4ac189928e9mr64716115e9.29.1793377968735;
        Fri, 30 Oct 2026 09:32:48 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abe7706516sm45130975e9.0.2026.10.30.09.32.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 09:32:48 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Fri, 30 Oct 2026 17:29:53 +0100
Subject: [PATCH 1/2] ASoC: meson: card: leave the device drvdata to the
 ASoC card
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
Message-Id: <20261030-meson-card-register-fixup-v1-1-6474985e94f6@baylibre.com>
References: <20261030-meson-card-register-fixup-v1-0-6474985e94f6@baylibre.com>
In-Reply-To: <20261030-meson-card-register-fixup-v1-0-6474985e94f6@baylibre.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1398; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=0RFe1Fr3NaxVtejZemaL7j5wb6r/Qt9kPR04MlhQsks=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFlPjq2bcGOyzGlzq7QHs65mvjjvKLVt7V/Jc+saPA+rS
 /KVXHh/uqOUhUGMi0FWTJGlhrta/J2k1pdZ03Vuw8xhZQIZwsDFKQAT+XKckeHfCw+1YwYd73yc
 ly6uTff6EMXxOD9pR6zZ/iXVhyIet/gwMsxx9l7/94VQvvGk7R2Kpz7UKYtXr1U+sp9nDpOxd6b
 6CwYA
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

snd_soc_register_card() sets the device drvdata to the card, so
meson_card_remove() gets the card, not the meson_card it expects. The
card is not the first member of meson_card, so the links are read from
the wrong place and remove() crashes on unbind or rmmod.

Get priv from the card and drop the platform_set_drvdata() call that
the card registration overrides.

Fixes: aa9c3b7273a5 ("ASoC: meson: axg: extract sound card utils")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/meson/meson-card-utils.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/meson/meson-card-utils.c b/sound/soc/meson/meson-card-utils.c
index f2796dc84fa5..3cdc73b3fe8b 100644
--- a/sound/soc/meson/meson-card-utils.c
+++ b/sound/soc/meson/meson-card-utils.c
@@ -276,7 +276,6 @@ int meson_card_probe(struct platform_device *pdev)
 	if (!priv)
 		return -ENOMEM;
 
-	platform_set_drvdata(pdev, priv);
 	snd_soc_card_set_drvdata(&priv->card, priv);
 
 	priv->card.owner = THIS_MODULE;
@@ -324,7 +323,8 @@ EXPORT_SYMBOL_GPL(meson_card_probe);
 
 void meson_card_remove(struct platform_device *pdev)
 {
-	struct meson_card *priv = platform_get_drvdata(pdev);
+	struct snd_soc_card *card = platform_get_drvdata(pdev);
+	struct meson_card *priv = snd_soc_card_get_drvdata(card);
 
 	meson_card_clean_references(priv);
 }

-- 
2.53.0

