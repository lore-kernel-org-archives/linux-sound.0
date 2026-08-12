Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E17A37C909
	for <linux-sound@vger.kernel.org>; Wed, 12 Aug 2026 10:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786529692; cv=none; b=ltTH78g0XVVwL2t+5svJalhEAg6lkaWPULjt7qSqrdeTZwTozOZ3O2xvZNoJqRgBcabsdpM+MITEDKPtkB89HRS71hcae38E8VHEbk2/HbbJZFmlAo+xQGr/BCZfxqPpjt9OJwbMSPvUOXY/zKPFrCS9bi4rYW8T22A7y5fvfak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786529692; c=relaxed/simple;
	bh=+c4KOpg885WRYyFjTjqXfoNfJYMaRRXl16T1yy+yDUQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZtiSxNhJF4T+VBFMMdZj9JjaIi3t5l8/IAibaqFvXlH/y3CnMUuIcGOWptV85Nt9zsVa0xZqPvRVZJ42cpfgsf36qYtmYdnbSEnKHagrw8A/J5E3w0IpjxaSwnvuvr58HgFp8Qy/Xr1RDuCWi9KdOeltU+CxwtvHpWZBZaEo5dI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hzrs0wjG; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hzrs0wjG"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2cc97653887so12054535ad.1
        for <linux-sound@vger.kernel.org>; Wed, 12 Aug 2026 03:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786529691; x=1787134491; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hmlgcPwHF5jOxRxD1KT11UbnHWOCjsQAdwUgZ3L+zv0=;
        b=Hzrs0wjG3KmpWwrPAhJMon6upKUn4SNrLKdq/j+AwqTksoH0oxnypWP5iOKXUuItko
         ahlJ7o0TofKUcCyZVD7sLNO06DM6rYkvqIxGyY9+Sgqd4LyGvIbQWE5FhQcZ4cqHKrsz
         PDRJufJQuoha+XWJ0++8Cvc9pIDFrtxmwk5d0Tn0JrZw6WRUvyR1QJSnE2iokpAbSSIZ
         Dy+0wDdz94Wscc6yKIhFXSTjlbeP+d/+w8qCVBhs4X2QnQgVjt04jTLLA2hPB/NgxpnZ
         XHeihrae4f1cTJKWrb1lF3++kyA1U1yyYiicJag64H4jDAr6x7gQ4ET2oj35RBllfQfE
         Jk9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786529691; x=1787134491;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hmlgcPwHF5jOxRxD1KT11UbnHWOCjsQAdwUgZ3L+zv0=;
        b=hRFyJY/TA57+wXde15IZt5JHU3SfLto8of8J90x/aaZRuOH4txUTcf7YxMkTMWIT2I
         ggFioaWGqS+DNhyPlZAsyF2fwB9cmgSkkoSGiQjNg3NkgCCMnvVT6k7sF9hWMpoduNdW
         dYWfarOZ0x3EkptabodzhYLd3PW45xoNp5fFpdEwEIL+xCzaI+Ha1xx0zIrSKqllE0Oc
         1HVX99Y0FwZm5qxrxgFhZgj4WJvCttY+TjWlN+erzI+qZqdCrMXsj5Nihw7QjZk1eVwS
         s/E9NxmeUJoovyqNKMzfu0iTMv2Yjp8g25BPYHz48mNskEexGKUjnVV+ewMPVc+Y4kEc
         Awyg==
X-Forwarded-Encrypted: i=1; AHgh+RrPzXp9ID0vKOkR7Kr1L/GdlLLh+T3NqlJfvkXIu7UQ6lphFw0j9KmuWsDU2pAr+xBRLTzBrkuzvZvGWw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw04S5+PljnCNtsyD4ute+eHC789OMGSUZsmCgvzJPPsqoROdEa
	9FbH8e1ed1K6i08PIVb49ESfdjHm8qzY1atAIQBmKr4OPrHfbdrLWPjC
X-Gm-Gg: AR+sD11wAp1OCJFcWsVISRP1Sxtih90gy2Q12Z6WoMD+Cxr+19kWTFPiE+vqYvJD94V
	yHiUMPQj5BS7PIOqsQ5d92/eXZF0+Y0OW1NVMCqTqkUgPHWMxJ0IN+w/mix5/eL7OTw3XCnraGK
	4+SxEkY8DgugD6X6VBnbndXKpqyxt1B4SWB8OJNxqSFKhZ1XkALg0WyEKbi7AwMFtTNQ6efOfJm
	FEZlA4tvpEJYfO6bH7wpj9coOZ9rlXxkaDXGLckrcC+iMFaiO+v0FkNUw7X8BZ/RFz4c1EQ/FxG
	OqGOouCMbpMkpJ7rk5bMnLrMxnjd0t9J+qeqGTA/Vx09b9HIHlTIb5ttoPhBPkN5fIPXeam+YJ4
	+9TXjpXveC3Ju80R0bIdDJRvWNNwxajHY2xH3mK1wle5tNfH0HqYt+EjrJ5PWyiOE9P3S2+FOPU
	DaYgN4OM2yePa0d3PV3HMt2n42sbC83IbclcekkljDzXCBI4eTTNhuV0wwHtwvhcSclc9Zht6zs
	9McTZocgZcAlo+xMVMOyL46KWrnRYWpA3GJ5IdI6USc+c8GIuRm47p4Jgeoi26C3bQZJwRe55nX
	RTde
X-Received: by 2002:a17:903:2383:b0:2ce:9c48:22d3 with SMTP id d9443c01a7336-2d34569b01amr47085155ad.11.1786529690806;
        Wed, 12 Aug 2026 03:14:50 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d35219d91dsm4159645ad.51.2026.08.12.03.14.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 03:14:50 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Frank Li <Frank.Li@nxp.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>,
	Michael Trimarchi <michael@amarulasolutions.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 1/3] ASoC: mxs-saif: Use dev_err_probe() for error handling
Date: Wed, 12 Aug 2026 17:14:16 +0700
Message-ID: <20260812101418.37966-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260812101418.37966-1-phucduc.bui@gmail.com>
References: <20260812101418.37966-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Replace dev_err() with dev_err_probe() to prevent log spam when probe
returns -EPROBE_DEFER.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mxs/mxs-saif.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/sound/soc/mxs/mxs-saif.c b/sound/soc/mxs/mxs-saif.c
index a01a680ad4d7..b877c978a04c 100644
--- a/sound/soc/mxs/mxs-saif.c
+++ b/sound/soc/mxs/mxs-saif.c
@@ -826,12 +826,9 @@ static int mxs_saif_probe(struct platform_device *pdev)
 	mxs_saif[saif->id] = saif;
 
 	saif->clk = devm_clk_get(&pdev->dev, NULL);
-	if (IS_ERR(saif->clk)) {
-		ret = PTR_ERR(saif->clk);
-		dev_err(&pdev->dev, "Cannot get the clock: %d\n",
-			ret);
-		return ret;
-	}
+	if (IS_ERR(saif->clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(saif->clk),
+				     "Cannot get the clock\n");
 
 	saif->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(saif->base))
-- 
2.43.0

