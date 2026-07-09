Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59566394783
	for <linux-sound@vger.kernel.org>; Thu,  9 Jul 2026 04:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783571912; cv=none; b=d2XXG43BS+4fUH4ZlGDVRVeZFVcbSaQoyotzVTBFNpncG/ThcrHbwq4iwR+s0eLbYfYU8Qrdj+1dqy8Ba1ThhpOTHZ8yMdVpxtxLq96UInQ63m9XTLxaTdx08RpJrGZaVWptK8mD0ok8tXeDPyxE4SM6S1ufpV6aE8a1ZtrZ3Lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783571912; c=relaxed/simple;
	bh=R3OYSqMEnbeucxsybCNB089VCe8vIWs+6pC86MXQits=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ESOJOn+/2cIaC818Z6QE9GizlL/Gu5LZ53j1/cnqaiXKYHLQV/qkUEYjG44Mg5/CYtpYxT+VWytC8gPNrNxv9LUuQRPZOoEgm0m8jcWqv/msuuqZvhWjs57zTlKmMRC7+vJZ6AM0wz1a5xUy3Jv3x5Qll5jaeraE2W89MfJlDH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KW4Y5Q7Z; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KW4Y5Q7Z"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2cc97653887so16136205ad.1
        for <linux-sound@vger.kernel.org>; Wed, 08 Jul 2026 21:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783571911; x=1784176711; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Qi0KD4VU/u6N1TW91fgVF43rWN+CrXef747lf/eDsU8=;
        b=KW4Y5Q7ZP7ayUQobatHbHABYw0Q4akmxXLV6VMHijWyAfYbymetmP4zAcrnoek4gPw
         DbVYQHp+AUa4qI36RK7Koblss9/9gLxz43ohs/PWo/rPyO/8r2EgVqhv7lUNgPna1oPz
         eii90LeWQqY+ItAtlwbmKK9R5LoQKsUj5niW20dKVAEnTihbbChVe6VBMmZHREnRKqsg
         gLdpoTqvRuKYvrK2TgU4apnyPG9Wo+V4w52MzYfVMPks5v3E7eH9YmqduUlX7VF8Df6z
         2ulDicfhDWbSmzld/0m6ZbbBpk1waOvJgXSQzbVOAkr5AaVUiku0czE8ibvvIVHPLtGL
         siIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783571911; x=1784176711;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qi0KD4VU/u6N1TW91fgVF43rWN+CrXef747lf/eDsU8=;
        b=CIesNzEFIQYuFdFQVOcux2eFzAFqDqMuzAfMK5NN+VFoB3ugSZYFQGtWUfOXvBqXyD
         uid4p+uZ/ZDSQSwpAjNCrS7J2CupfPQlx1LhW0QFIXAlD74isibx3UnPrSC0NADqeG0z
         lHyQm95CFeXecHcYD84H5pmD+4Hw0mSavhfCwOkH8ObKbOlw+8f3RMXxhYv8wL0PIS+b
         YzphNRm7xWempvbszGYFS5DCJiAteRd8OMtXf/zr+0MJeaGxhKBY8sFib27ew2DVjHPz
         txQqlkaEJCyqJABXRnQp20iegpVUkIwc4lFYUT7BlTwA/EZpuqRosVrg1uo738DaQ/mT
         cT+g==
X-Gm-Message-State: AOJu0Yy18x8LKU52wP6tLfmBq5j8n3ssofYbfsfgUsWfu0IMq7Zbt86K
	3M+uUtT9MeArX5lyTGp3oojkXhDaFQJeij8aAAY39kQzIL0elrBu2ogG
X-Gm-Gg: AfdE7ckohvQP0uJS//spU0K/zt+AR4ImjeCCn1UzO4+5oQRRrSxw+otjR0YLuTe68pH
	pbMYzv47Tqykwmuwg7mEw7MrdtTAixnG4a3l/JsbKxAkvM0PQEP0fDOazrx3hfv/lPGATEfGnoA
	J16W44DwTGjJcDPQnNkRUy7b0a1wBsegKXmI//3l2JjMJ7jMFQBRNu8N7kU65bE4V68Ksf4F2Q9
	aPRPtqgmWDJ50KgxjJScvu4GtWcNJocC6Yvadirm+6Rq47Ka2mOzft3ll3NoE54uW7LcdDYHLQM
	WCS+SJ9YP1O5Lao16VSeFCg1amrmb2itlNNJYqMaOnKTgEWvN7j/On2HOWLSBfXVBCiAsEOvow+
	j7kqjF/+Sobi1QStmusGIckcmoFQ9wVg8wdOrw64pRcSXtHIZ8ueDqv4LWmGCpqf0q4shInyGFD
	bSJaZY4DBa2vVzOZ2UQx+gDDZhC0c3KO+rARYLWwIVl5FbI3w=
X-Received: by 2002:a17:903:2447:b0:2c9:97a8:afe7 with SMTP id d9443c01a7336-2ccea3cb09amr60107985ad.42.1783571910714;
        Wed, 08 Jul 2026 21:38:30 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d3c99fsm37033815ad.68.2026.07.08.21.38.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 21:38:30 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Max Filippov <jcmvbkbc@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2] ASoC: xtensa: Use dev_err_probe() and drop redundant error handling
Date: Thu,  9 Jul 2026 11:37:40 +0700
Message-ID: <20260709043740.329504-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Convert error paths with messages to dev_err_probe(), which combines
dev_err() and the return statement while also handling -EPROBE_DEFER
for the clock path.
Remove the redundant "err:" label and return errors directly. Paths such
as platform_get_irq() already log failures in the callee, so they simply
return the error code without printing an additional message. Inline the
pm_runtime_disable() cleanup at its only call site.

No functional change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/xtensa/xtfpga-i2s.c | 60 +++++++++++++----------------------
 1 file changed, 22 insertions(+), 38 deletions(-)

diff --git a/sound/soc/xtensa/xtfpga-i2s.c b/sound/soc/xtensa/xtfpga-i2s.c
index 9ad86c54e3ea..fd0990201b40 100644
--- a/sound/soc/xtensa/xtfpga-i2s.c
+++ b/sound/soc/xtensa/xtfpga-i2s.c
@@ -533,34 +533,25 @@ static int xtfpga_i2s_probe(struct platform_device *pdev)
 	int err, irq;
 
 	i2s = devm_kzalloc(&pdev->dev, sizeof(*i2s), GFP_KERNEL);
-	if (!i2s) {
-		err = -ENOMEM;
-		goto err;
-	}
+	if (!i2s)
+		return -ENOMEM;
+
 	platform_set_drvdata(pdev, i2s);
 	i2s->dev = &pdev->dev;
 	dev_dbg(&pdev->dev, "dev: %p, i2s: %p\n", &pdev->dev, i2s);
 
 	i2s->regs = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(i2s->regs)) {
-		err = PTR_ERR(i2s->regs);
-		goto err;
-	}
+	if (IS_ERR(i2s->regs))
+		return PTR_ERR(i2s->regs);
 
 	i2s->regmap = devm_regmap_init_mmio(&pdev->dev, i2s->regs,
 					    &xtfpga_i2s_regmap_config);
-	if (IS_ERR(i2s->regmap)) {
-		dev_err(&pdev->dev, "regmap init failed\n");
-		err = PTR_ERR(i2s->regmap);
-		goto err;
-	}
+	if (IS_ERR(i2s->regmap))
+		return dev_err_probe(&pdev->dev, PTR_ERR(i2s->regmap), "regmap init failed\n");
 
 	i2s->clk = devm_clk_get(&pdev->dev, NULL);
-	if (IS_ERR(i2s->clk)) {
-		dev_err(&pdev->dev, "couldn't get clock\n");
-		err = PTR_ERR(i2s->clk);
-		goto err;
-	}
+	if (IS_ERR(i2s->clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(i2s->clk), "couldn't get clock\n");
 
 	regmap_write(i2s->regmap, XTFPGA_I2S_CONFIG,
 		     (0x1 << XTFPGA_I2S_CONFIG_CHANNEL_BASE));
@@ -568,41 +559,34 @@ static int xtfpga_i2s_probe(struct platform_device *pdev)
 	regmap_write(i2s->regmap, XTFPGA_I2S_INT_MASK, XTFPGA_I2S_INT_UNDERRUN);
 
 	irq = platform_get_irq(pdev, 0);
-	if (irq < 0) {
-		err = irq;
-		goto err;
-	}
+	if (irq < 0)
+		return irq;
+
 	err = devm_request_threaded_irq(&pdev->dev, irq, NULL,
 					xtfpga_i2s_threaded_irq_handler,
 					IRQF_SHARED | IRQF_ONESHOT,
 					pdev->name, i2s);
-	if (err < 0) {
-		dev_err(&pdev->dev, "request_irq failed\n");
-		goto err;
-	}
+	if (err < 0)
+		return err;
 
 	err = devm_snd_soc_register_component(&pdev->dev,
 					      &xtfpga_i2s_component,
 					      xtfpga_i2s_dai,
 					      ARRAY_SIZE(xtfpga_i2s_dai));
-	if (err < 0) {
-		dev_err(&pdev->dev, "couldn't register component\n");
-		goto err;
-	}
+	if (err < 0)
+		return err;
+
 
 	pm_runtime_enable(&pdev->dev);
 	if (!pm_runtime_enabled(&pdev->dev)) {
 		err = xtfpga_i2s_runtime_resume(&pdev->dev);
-		if (err)
-			goto err_pm_disable;
+		if (err) {
+			pm_runtime_disable(&pdev->dev);
+			return err;
+		}
 	}
-	return 0;
 
-err_pm_disable:
-	pm_runtime_disable(&pdev->dev);
-err:
-	dev_err(&pdev->dev, "%s: err = %d\n", __func__, err);
-	return err;
+	return 0;
 }
 
 static void xtfpga_i2s_remove(struct platform_device *pdev)
-- 
2.43.0

