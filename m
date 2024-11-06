Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33DD31DA0F5
	for <linux-sound@vger.kernel.org>; Wed,  6 Nov 2024 08:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730881174; cv=none; b=Z1UwASXnILjo+ASk+AAfRlICvejxSBDHYrC0GTUIKP8Ph6HcN1ZvJ/MwqntCl0BBrTpMhFbSB+zDMvFzqXctPD1chstWpxtEMGwxqtv6/q6wWAx/w6kSQmG00di44g6fv4fdcxJvmvOxQ4ppH9hoiJQBs+MKcZm7uoqHJqf3mfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730881174; c=relaxed/simple;
	bh=/6aTrJTZ4Jidw/36xgtKQTOiFQ2EPWFG5aJ/0JSGVBs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QLGr2vTfE0jH9Xy9Ewls485vhtjv9d8cN6sfkMZl2WzrJ4Y0ZF6zil2/AvVNOJTP+/aCdi6Z3pMDzrn4uBA6/l1pIGsLUkJeFVwawVHK+fLKWRoKGiY3tgwV5kL6nEj47LBFTtcOJlkLUU1RiY/hR/+OPopSoBRl4+FDpKaZhrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=SW0ERnKs; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="SW0ERnKs"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2fb4af0b6beso97974011fa.3
        for <linux-sound@vger.kernel.org>; Wed, 06 Nov 2024 00:19:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1730881170; x=1731485970; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qs8Ss9deUl5XVYufQusJH2c5geYUc//oteJUW4gxtzA=;
        b=SW0ERnKsIXRWN5mDna/7qX6rZugzUGRRWN/UXG6E9BphUW37mwjhoUxsGiSvQGK78V
         MMCw2fxFxI79yQzDPqTGlOEVWfqaaVnmjFXsVsKJ6UGNNM61rX3RNtMaZEdIYFITGaCs
         LShVwBjwOlKVjIzdXS+n5nvdvi1R4Z4yKA83EthQsDOnaVJS5YdI5nGlhhU0xfkR6GXg
         e4cZ3dlMFLUncHeMpInNEpwVQQB1dXG/t4XfN1j5yFUACRYduGMnVIk/9hql3snS46L+
         0+KWSPsvg0b/45rM3FAdwFdqSO3nyZlvdwISYzBZWGxNV+yfHCOXuOy8p93lqlCxUSP/
         pRpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730881170; x=1731485970;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qs8Ss9deUl5XVYufQusJH2c5geYUc//oteJUW4gxtzA=;
        b=tqpnB+ZKaVnDztjoJBu+TYVgHxGGJWbYgMK9SVXgai6F9/bcEM20lBPYlnWq3IzNVX
         xA8ZAUyr9vj22Ylqhqd2klhDS98mVprMM7jfc6yojmywgWyqYrtUu3pn22v3XoH6bYeO
         r99pg9vqG+EuVNlNXcPp2+3YuYsZ6/53nALpsF1sHD37q1cdV2swdlYn1+xVn5ZOHP+d
         1GzmnDWe3GE/vV8LRdCsA7y8hmXuavt9wSdISKVyhdOqO0BUhciDnlMCZChxs7r5P2SP
         g/WE8/b8e4an6M45yMVfvcX1kH2N8i50YRkWWQM4yZud+R7py9FEuh2EIGMR/3dgg+U3
         B04A==
X-Forwarded-Encrypted: i=1; AJvYcCWS+p1MSonD/FPxgpWRt1jLTffCi7HByJ40cujI8J9ZHemumobhPX4UyPnx1+mKsq6KB8qaV3UMu62hzg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzIQdNrOuqeOcMT/qj0HEFbSwB57OgZqCQn4YCYnhd6SfkXmDSK
	qTFrU5S8wIl9HPA86cOn4PwhafFg0EwmgXkciHLH7j7w7GdYR8jEI+q8PcmWbkk=
X-Google-Smtp-Source: AGHT+IE6bm+5nSovHMVfHCwPuTVdYgbqN3XXTW2qPIGl/kWKDFvfvED0CYNKOeuBjIaEcKEOrQ/zIw==
X-Received: by 2002:a2e:a98b:0:b0:2f0:27da:6864 with SMTP id 38308e7fff4ca-2fedb7a2d44mr143308401fa.17.1730881170289;
        Wed, 06 Nov 2024 00:19:30 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.28])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9eb16a2dbcsm241369766b.40.2024.11.06.00.19.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 00:19:29 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	magnus.damm@gmail.com,
	linus.walleij@linaro.org,
	support.opensource@diasemi.com,
	perex@perex.cz,
	tiwai@suse.com,
	p.zabel@pengutronix.de,
	Adam.Thomson.Opensource@diasemi.com
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 07/31] ASoC: sh: rz-ssi: Use only the proper amount of dividers
Date: Wed,  6 Nov 2024 10:18:02 +0200
Message-Id: <20241106081826.1211088-8-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241106081826.1211088-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241106081826.1211088-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

There is no need to populate the ckdv[] with invalid dividers as that
part will not be indexed anyway. The ssi->audio_mck/bclk_rate should
always be >= 0.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 sound/soc/renesas/rz-ssi.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/renesas/rz-ssi.c b/sound/soc/renesas/rz-ssi.c
index 2d8721156099..b4439505929f 100644
--- a/sound/soc/renesas/rz-ssi.c
+++ b/sound/soc/renesas/rz-ssi.c
@@ -258,8 +258,7 @@ static void rz_ssi_stream_quit(struct rz_ssi_priv *ssi,
 static int rz_ssi_clk_setup(struct rz_ssi_priv *ssi, unsigned int rate,
 			    unsigned int channels)
 {
-	static s8 ckdv[16] = { 1,  2,  4,  8, 16, 32, 64, 128,
-			       6, 12, 24, 48, 96, -1, -1, -1 };
+	static s8 ckdv[] = { 1,  2,  4,  8, 16, 32, 64, 128, 6, 12, 24, 48, 96 };
 	unsigned int channel_bits = 32;	/* System Word Length */
 	unsigned long bclk_rate = rate * channels * channel_bits;
 	unsigned int div;
-- 
2.39.2

