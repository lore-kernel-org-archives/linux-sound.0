Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73C64368957
	for <linux-sound@vger.kernel.org>; Fri,  2 Oct 2026 04:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790915972; cv=none; b=RECU28/gi2NyG0vUSy11yOZ33otRF/YqTmN47+dCpoT3dBf61wROhtQPhLIiv3X0Pk7cgN6Y+t5IAdHNOorbeAqIwL2DJj4TLxtdxySyEFWHYhm+UyAg/IOgnMuGDQ/vchf0CCqIx5raB6Eui6KVJeniTKCudlvc8NyC7ZJVa5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790915972; c=relaxed/simple;
	bh=x66uwvIu5ywRUNH1KcdRg8/f3THWh2VZZ16aKaZQsC8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=drZgPf1Doq8Etlr/UrdAoBdJ1Zk/xQIAmExDHYDezqnmlido/EOXB5jbn8soJeisaOcghU6vP8TkrfKOz1XzX5V+ncarFvQumVk1BnHAa+RXtlgt4qBHxErB+XXyDINgkOmhkyBo0GLz0rHhiX7V2xTD365c5UieYxBsBYHNga4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V2Y+mhMq; arc=none smtp.client-ip=74.125.227.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V2Y+mhMq"
Received: by mail-pj2-f42.google.com with SMTP id d9443c01a7336-2df4aa80a73so48102255ad.3
        for <linux-sound@vger.kernel.org>; Thu, 01 Oct 2026 21:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790915971; x=1791520771; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S1AdBqTLN1NoLcfkeqL2tMz91d07+kTAZBqSBvoPLus=;
        b=V2Y+mhMqydjl6Z6uf9Y4rBw3tk/0TRM1ff90OWhSQBeFwGy2QTAE1VWUXBl4o+oK01
         +pmbxP7rKVFIwE7yEvXtuqLGSz6QrZGivADCPkDmuk9iGs8J9xQfoj7Hb/SY/M5Kp6/x
         JAvSHPidAU06ca6cP1YYUslH40VKOXGHCJHkqAQx8RqERVen90P8RZxINUmTqpt9pmlo
         0y+rwT3oRQXOEuorWSYlKeKVMSgVT4FMox40zwf2pRbW8TvSyfI/a3PL78zqFxbbk9NI
         rR7AZxyj33csjjyKuGL8MThLPTgZjGnbtTJP8MP1Mn9RL3wTYRCZrq9a2m5GM+m8r1pT
         F81g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790915971; x=1791520771;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=S1AdBqTLN1NoLcfkeqL2tMz91d07+kTAZBqSBvoPLus=;
        b=To/odrMA0ocF2HHyCQUVxU/0FAAnacfTSGzfCYUh2xIXA2LKCwGCj7EO3ePkia2Lws
         O0/dGiIYAvWROqhS8uStwwUVYwGfwgFEcZ3Ptb+SnUNS7ZLp/JnFTMoJ1DKee8tQzw8D
         b5Dvb2TFzMcv76SiQfPdH6cNshyA7OsZf2QsVn3w6kjU2xEToORo8wVp0avTh9ktduQH
         w98MGFMTYCQJxMYiDfdldkVTZmqm7WMf1ieRBCE9zfKTYS0n84hcr67nr912WzaxBEV7
         /LB77uVtSMcPqT7EbmyyOi8XU5uMkUTgAnJD5tf8yJP6KrjJGbqyaR5rOtSj3eSASjSD
         89wg==
X-Forwarded-Encrypted: i=1; AKwUvBwZraUPVmviufv1BOBRcVPiPlNaZCHyDzhJuoZzDrGoqOLmC+BWmcI22rOdfv/qHhKCdiE6uyq9TU1irg==@vger.kernel.org
X-Gm-Message-State: AFq9FYKNYGIUOhq6QxJcelJKKBNcd0IUwkLZqgZbkDrCliQojqJAzc/T
	IyKLNmvSgL48jgjHTw+fcZGrF+KCwWiYqfIaXnRuBr3wqPpAbAJ+pmUO
X-Gm-Gg: AYBFou2gLjIgbhSQedGALYCCl7cI2lN8Jto3SWv6Xr7eMnRSMT1WOgD4KTTkyHvq5Ft
	kECA5fRKrk29+Nlp6JxmWdTqggfNMWLglZTTeOaffRjEBlOXN8xUmkt+pSC2ubJEWfydw36B1Tt
	zisTgMFmyxQPWE3n2RKlya/LxQ8c6xlJcBsj6m0OV5qDRsgXYYrxPDndnMiP7XKaGa13tXam8z9
	k53s519VBie6WA/wbK7SaHVTVM2S2wRGYqceGK9ygI9iYo/OsY5DSYJIQOlbM5MC7Itu4HwKiAT
	lHJ6tmaNoG3tKvChjFLptOJNI8q6+toNvgGmAHwhXZXGVI2voRlDCrMsOxu08aDxc2M+bygkElE
	FxQJTEjTq/rdjiAoXA7H4P+uzase2kT9qFXxzUp6LI8mffEZxdCh569OEnDB1EI+h0rjN4LPvCJ
	LQH46v9mE+uymqgv3Q//Jp1SKFVSERV54qgu7ZQWK4r8s8vf3qkd/mbysY7zT5CqQ6nVFJPR2+X
	gXbi5zuda1kgWVwreQSI283DCvyApjpEn2J7epsmcGf6EqRXXl2qbJ4Pg9aPtQSwk9D8KumV0D+
	a97E9fAI4zDLjA==
X-Received: by 2002:a17:902:e5c2:b0:2e3:d33:b27c with SMTP id d9443c01a7336-2e49b6198ebmr13023775ad.38.1790915970609;
        Thu, 01 Oct 2026 21:39:30 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e49f67c413sm3713985ad.20.2026.10.01.21.39.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 21:39:30 -0700 (PDT)
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
Subject: [PATCH 2/5] ASoC: atmel-i2s: use optional API for muxclk
Date: Fri,  2 Oct 2026 11:38:53 +0700
Message-ID: <20261002043856.97295-3-phucduc.bui@gmail.com>
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

The muxclk is an optional clock according to the device tree
binding.

Use devm_clk_get_optional() to handle the optional muxclk instead of
handling the missing clock explicitly.

When muxclk is not available, devm_clk_get_optional() returns NULL.
clk_set_parent() returns 0 when passed NULL, preserving the existing
behavior.

Unlike the existing code, errors other than -EPROBE_DEFER are now
returned instead of being silently ignored.

Fixes: b543e467d1a9 ("ASoC: atmel-i2s: add driver for the new Atmel I2S controller")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/atmel/atmel-i2s.c | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/sound/soc/atmel/atmel-i2s.c b/sound/soc/atmel/atmel-i2s.c
index f28808d980ce..c52d048449f8 100644
--- a/sound/soc/atmel/atmel-i2s.c
+++ b/sound/soc/atmel/atmel-i2s.c
@@ -589,21 +589,15 @@ static int atmel_i2s_sama5d2_mck_init(struct atmel_i2s_dev *dev,
 				      struct device_node *np)
 {
 	struct clk *muxclk;
-	int err;
 
 	if (!dev->gclk)
 		return 0;
 
-	/* muxclk is optional, so we return error for probe defer only */
-	muxclk = devm_clk_get(dev->dev, "muxclk");
-	if (IS_ERR(muxclk)) {
-		err = PTR_ERR(muxclk);
-		if (err == -EPROBE_DEFER)
-			return -EPROBE_DEFER;
-		dev_dbg(dev->dev,
-			"failed to get the I2S clock control: %d\n", err);
-		return 0;
-	}
+	/* muxclk is optional */
+	muxclk = devm_clk_get_optional(dev->dev, "muxclk");
+	if (IS_ERR(muxclk))
+		return dev_err_probe(dev->dev, PTR_ERR(muxclk),
+				     "failed to get the I2S clock control\n");
 
 	return clk_set_parent(muxclk, dev->gclk);
 }
-- 
2.43.0

