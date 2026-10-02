Received: from mail-pj2-f14.google.com (mail-pj2-f14.google.com [74.125.227.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D3CF36826B
	for <linux-sound@vger.kernel.org>; Fri,  2 Oct 2026 04:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790915980; cv=none; b=NAmX6FhCPZ0KUkdRjWdic5VHVMinqQelGE0oVLSlhCj9wS336oh6tBnjK1PsYSL0LEqU3UsKsmPwPIiGnPnJ2JPTFSj6iwWPAsbF0VoWHodUnoWP3BHV/iM/D625QoQicNO52F6F/9nwaKWK8Qw7j71ViPQfy7hUJAREkYNXJp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790915980; c=relaxed/simple;
	bh=sHTb4JE8cIH2Q0cATefrZPIo6U7t2jgutMNmqVUqelI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GnDOunHt6lRIa+QAIYb6XvP6/KrvHWXQa7QoqcBALhIWmWASTYvCKACRafW2gJ+FSJCO3p+8XkK8+Nzwn+xoQH6Runf+u7S+MlStHd17WY4Faw4rSJYGFxBkvup5qWCJsy9zkd3ze5Fd/hRZ0z53vxKfvM6QX/T7yAiz/UesBwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mSImcZ0q; arc=none smtp.client-ip=74.125.227.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mSImcZ0q"
Received: by mail-pj2-f14.google.com with SMTP id d9443c01a7336-2dd58e1e2c7so35675295ad.0
        for <linux-sound@vger.kernel.org>; Thu, 01 Oct 2026 21:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790915978; x=1791520778; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QDkTuoIx7co8Z+KTX/+/iuusl+fatSzZsp7l8WaBTtc=;
        b=mSImcZ0qTx3oh4CAgwfKY00io8GL5/hZ0e9aR7g7tXVvid+Cya56V8NGWKrc9TzwYz
         FIZqkaCg0kzwPuF4343jUh3GCoqdCmbEMg+A716yoA0wvsYCAogxRA68Oh6MHVYtHJzP
         MEjI6+xzr3XjpUvni+ShKGFikD540xZWE9whcUMFpT5fZIs+8EvfU3KUb+DFJhdM74A7
         yR4IBAvGs+meSh8R0ZENzp4NSOVfW4lar8p2uwVdVFGM34pJ7dNo+YNhp3s+zC3Jncdh
         WXYk9YkdCZtqRhhgrQjNm/8wGDKKLXKTL8oGBw5ZI2mjCbUxhLUcdgQoHl0efIa8tuc6
         vhwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790915978; x=1791520778;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QDkTuoIx7co8Z+KTX/+/iuusl+fatSzZsp7l8WaBTtc=;
        b=aAMrU0ANJ/c0FkxbMXyOu3FJLdJGkHAKsTDaVJCvSASQUt6SFMkHqDj4w1axLuzufL
         rKhpr4Z+3dDL5LXmNCoSdfYQBQniMtWmbBgEJBWE/rCMHSKhBulXKu14E7pMV70p+P/7
         rRPlBVDf9AeqMBG6E825ww6FHchI9U7u+zVidmrgLUphVRDj+lRQk7rtLqLFYvwEyKsy
         0+XZlFZ7PeynGOUvUzdUdCUcjgrNh1PYex5PfXz/BfYMO0ZqPvEbW/HmPh+880BvSxp6
         g+MN9VRfi0PLi1+wGeOL+gJ9gJ7AuwVJtvnqdECvM8fk6JYCm83VBPMP1fntgab3ED7L
         sx+g==
X-Forwarded-Encrypted: i=1; AKwUvBx6AkpB+E9lUvCVztheNLHtM/gPEnUyutKMKYTH4EgKBKkdwdP7Eh7XhraemKV9MKEgW/BNC9m86x2tqg==@vger.kernel.org
X-Gm-Message-State: AFq9FYKUVXP8A+sSliAqb74JYjPjxm9rFuQYsTEeYAEN2Yq7OOh1ReAq
	zECHccPMW/mEmnRIUrOS+gdLYEU8y2uMcGAG2q9Zv7xcT/WgNO+mSsHX
X-Gm-Gg: AYBFou2W4HM01FQ+StKZPdv1zMLZr9+k1QBK7gdpL0G90yIs3dIBmsimsGsSiv3zeI+
	eKxyrJP5bnS6YX3W9RtVlj9i4s+fpay2OJNqH6eAnVnsl/LqhOVyns4+yrktBwxBXCiTc/lEzOq
	xWNWtm4uydZHbzYmlh+PJTO7+dz/lLJI7CJPeSfrUDkuRfyAA1bBafy7NIyh112KWGQUQeSgkqm
	JGaKauv9dta++ZpztJZYQ6ABoebnjqlNXEl8jpCj98nEasVT+BSdyr4l8XzMdkZlZx/Mq8ZyXrh
	X2Rzht6mkRtqJR/udQEi9ek6pOKdLub2HnvXY2gwPRhsfcMKymsE/GgifyoBgaw6QTROQrGbPz/
	UPAM7rWDCvhBQYD/4hf99crYOGOBEInX12ULh9CwGkO+SXHJMxDWzJwvfQDxdrRuP81zS66wvJV
	ssuC/ZEaGviR9HQOteTNchetZKmtpzF+mC3ytPlHNurcpFpIAX0AEElrjYJ8dh4h/UQTBG0kg/U
	a5NFzGrR8BiRM5EaA1W81Z2+kQ9+kfzHbe+lJw1QPTT1Nq9JIyHp0hK2cP6NXm6syo6PQf4nlz1
	z9JCwveVVd96rA==
X-Received: by 2002:a17:902:e892:b0:2e2:f2f9:b1f9 with SMTP id d9443c01a7336-2e49b7f3714mr12668385ad.44.1790915978480;
        Thu, 01 Oct 2026 21:39:38 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e49f67c413sm3713985ad.20.2026.10.01.21.39.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 21:39:38 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Andrei Simion <andrei.simion@microchip.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
	Cyrille Pitchen <cyrille.pitchen@atmel.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 4/5] ASoC: atmel-i2s: use dev_err_probe() for pclk errors
Date: Fri,  2 Oct 2026 11:38:55 +0700
Message-ID: <20261002043856.97295-5-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261002043856.97295-1-phucduc.bui@gmail.com>
References: <20261002043856.97295-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Use dev_err_probe() when obtaining clocks to avoid redundant error
messages, particularly for probe deferral.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/atmel/atmel-i2s.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/sound/soc/atmel/atmel-i2s.c b/sound/soc/atmel/atmel-i2s.c
index 6ca230f8adc8..9b651eb4f0a4 100644
--- a/sound/soc/atmel/atmel-i2s.c
+++ b/sound/soc/atmel/atmel-i2s.c
@@ -662,12 +662,9 @@ static int atmel_i2s_probe(struct platform_device *pdev)
 
 	/* Get the peripheral clock. */
 	dev->pclk = devm_clk_get(&pdev->dev, "pclk");
-	if (IS_ERR(dev->pclk)) {
-		err = PTR_ERR(dev->pclk);
-		dev_err(&pdev->dev,
-			"failed to get the peripheral clock: %d\n", err);
-		return err;
-	}
+	if (IS_ERR(dev->pclk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(dev->pclk),
+				     "failed to get the peripheral clock\n");
 
 	/* Get audio clock to generate the I2S Master Clock (I2S_MCK) */
 	dev->gclk = devm_clk_get_optional(&pdev->dev, "gclk");
-- 
2.43.0

