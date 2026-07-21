Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45AB1347BC6
	for <linux-sound@vger.kernel.org>; Tue, 21 Jul 2026 22:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784674455; cv=none; b=PP2oWmpxQMY3v7gfmVZSkqMEMCsPEJcl8iWi7w/AVRgIsxzPkIToqSsQoeZFuvET04Nmgi6z192KftEZ0ptLrMQ9iWuTDeRJOZTdXvh9U6M8P/G59cKiqRYjd5YPCmODPKl3EWCjlbI0//veXX5PGQsPPVMYbHE+B0MbGB7eHtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784674455; c=relaxed/simple;
	bh=MBjhWcgOvvehp0elF3oz48EUBUyyETA5XSihwakMXr8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=A7i7MFFdKD99NS9iRuj8jue2/1vC8lLxoExie8adS/bImfTFYSg9deTIjdF8Whp5L5awDyjpioXqJLTA1lodgz7tpTANnIzK5HIdZxxNvdoHX1jdFtXq1TtfpfdjClca30HAyHA2LZ72eFt6Msw4THqzDJSXm6XrtE/Mq2xfLHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K2t0PWMR; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K2t0PWMR"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cbb8b54fcf8so798499a12.0
        for <linux-sound@vger.kernel.org>; Tue, 21 Jul 2026 15:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784674453; x=1785279253; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QGYc1TdXcvIKmo54F2N01YiaD23wedJvo9tZPTjUvCE=;
        b=K2t0PWMR6L+fOu0ZuIhGdfO6mHm7GdKykI7UJhPQLWDNVDl9SDh9vEvJEgeGrx6YDm
         WWIMiCNPyBxzniZJ0WGFiWv/Fk6XY6MKvZVqyW3DEuTZdYVhsOoNupaZT6HePq+oDCSN
         /3+o6E4+g7PDtQRfggoFvXiCfSOUJjG5jD/GsmAhHhTzU0WiBIkfIpXzHkaWePK7vg6C
         0KAoPF1djIvCo9VxJSOBmNJ5kUa6QhCebvMuCLn5qROCYEZlLgzykvJebbKsidLObY4S
         GouEDeJXUxcMC6cB8751wtN2bOw8Q6aM0zSdGvCzY3lFUJ5kn8vPI9a432V8sr6okUif
         01Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784674453; x=1785279253;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QGYc1TdXcvIKmo54F2N01YiaD23wedJvo9tZPTjUvCE=;
        b=lI1tt8Nd1WYfSqPWnty2OsERXDYFnOlLUsCuGZC61jkvkvAy30Fp8kI4obmhCLO+ez
         ugLfBuaj6rwyKoczuaQW0QXOMwi7V1GjP+X3lGRwH4V/RPmnhH5bCgnESD/kr9l7Qdui
         lESgxrkcAs5ThsKefzD33SdR1uCk/Fs88z/Zsr/TLtwxWR7LR7x79hPKj/GRNRMQiKBG
         4bvD1taSonlV+6n1s9AJEC0Le5FV0wF41MKE/K2j1+8MG8+rPVKeUYDcjgTd94isXhYg
         V4OzpKYXrttFm8mlEPuJXoeCWMh2sEwCjI+/pl5QG8sEoU/AFlaUP4T0pbgWINAZnnRf
         o+OA==
X-Gm-Message-State: AOJu0YxQpm0gxqbAOGZVVhY8CtUZRE+stO0GnKdMIYuLkkjP8wbKe0Cc
	FFrLPS3/wZParU/JWwt4JE2c4EFhESxVwu1y8b4/ryEPIGvoqx7Dw1LnFFvXwQ==
X-Gm-Gg: AR+sD11iGP0BD8LZ/FfRZ62cVhSWuOdP8xssazPHoBVVKzqNd3G7Wof33TE9rSvdbI8
	caWIyuPXnQuhngbelDBX8wV62I3FsdHMtB7hYPaEFXU0aH6YX26Z7MAQLSpjceWTywHM6iL972K
	dSLXwHaMlq6CoBCY3Dih5aszhS7y2kkbhxZkC+58yOsU8kvRhRnnl3AbUVbuL4obnNOHLz3/Ia+
	yzPK8jJJ5ahc+8/c1dXnmrv1yANdyDmuRzMVdOKOy7wcoq5LSaqfJFg1yJ02dIN10GpVLFQ9OPd
	ZOxmNdLfRvhuUmBtA0TF8DNUfSwCML5BigxpPH1NlN++J5TQljOZSJUMd+aMqhe78vJh/ZhYari
	uJldNkDsmY7ZwZprsTZjX8PjOm4+ysljmUgfbiMBqQj2fNC889LaetOyvAWY0uC2iJUiLTC4gbU
	Ji978AgIYqQi1E+0QzYzV+AKQemV274KZeXP3EO5Z3QH+Ck2Kb1N04CGZC1R1aI+abmcucmixeC
	wLcBQl+VrFKAihkeQaOFDINmGSPAjtr+WtoQZpvZnn3JfusGIefhUk=
X-Received: by 2002:a05:6a21:7008:b0:3b4:8ba9:4d8e with SMTP id adf61e73a8af0-3c3ad7a3d10mr23380821637.23.1784674453530;
        Tue, 21 Jul 2026 15:54:13 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbb8f1a884esm199994a12.23.2026.07.21.15.54.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 15:54:12 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-sound@vger.kernel.org
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Microchip (AT91) SoC support),
	linux-kernel@vger.kernel.org (open list),
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:Keyword:\b(?i:clang|llvm)\b)
Subject: [PATCH] ALSA: atmel: ac97c: use platform helpers and devm cleanup
Date: Tue, 21 Jul 2026 15:54:11 -0700
Message-ID: <20260721225411.815553-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert atmel_ac97c_probe() to the managed APIs. Replace the open-coded
platform_get_resource() + ioremap() with devm_platform_ioremap_resource(),
which requests and maps the AC97C register window in one call. Switch the
clock to devm_clk_get_enabled(), the card to snd_devm_card_new(), and the
interrupt to devm_request_irq(). The now-unnecessary error-path cleanup
and the manual teardown in atmel_ac97c_remove() are dropped, since devm
handles them.

platform_get_irq() was already used; tighten its error check to irq < 0.

Both resource and IRQ lookups are equivalent for a platform-backed
device. The AC97C register window is owned solely by this driver, so the
new region request cannot conflict with another claimant, and it is
mapped exactly once (no double mapping).

No functional change; built for ARM (allmodconfig + SND_ATMEL_AC97C)
with LLVM=1 and sound/atmel/ac97c.o compiles cleanly.

Assisted-by: opencode:hy3-free
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 sound/atmel/ac97c.c | 67 ++++++++++++---------------------------------
 1 file changed, 17 insertions(+), 50 deletions(-)

diff --git a/sound/atmel/ac97c.c b/sound/atmel/ac97c.c
index e394205f469b..234549e17351 100644
--- a/sound/atmel/ac97c.c
+++ b/sound/atmel/ac97c.c
@@ -693,7 +693,7 @@ static int atmel_ac97c_probe(struct platform_device *pdev)
 	struct device			*dev = &pdev->dev;
 	struct snd_card			*card;
 	struct atmel_ac97c		*chip;
-	struct resource			*regs;
+	void __iomem			*regs;
 	struct clk			*pclk;
 	static const struct snd_ac97_bus_ops	ops = {
 		.write	= atmel_ac97c_write,
@@ -702,42 +702,34 @@ static int atmel_ac97c_probe(struct platform_device *pdev)
 	int				retval;
 	int				irq;
 
-	regs = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!regs) {
-		dev_dbg(&pdev->dev, "no memory resource\n");
-		return -ENXIO;
-	}
+	regs = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(regs))
+		return PTR_ERR(regs);
 
 	irq = platform_get_irq(pdev, 0);
-	if (irq < 0) {
-		dev_dbg(&pdev->dev, "could not get irq: %d\n", irq);
+	if (irq < 0)
 		return irq;
-	}
 
-	pclk = clk_get(&pdev->dev, "ac97_clk");
+	pclk = devm_clk_get_enabled(&pdev->dev, "ac97_clk");
 	if (IS_ERR(pclk)) {
 		dev_dbg(&pdev->dev, "no peripheral clock\n");
 		return PTR_ERR(pclk);
 	}
-	retval = clk_prepare_enable(pclk);
-	if (retval)
-		goto err_prepare_enable;
 
-	retval = snd_card_new(&pdev->dev, SNDRV_DEFAULT_IDX1,
+	retval = snd_devm_card_new(&pdev->dev, SNDRV_DEFAULT_IDX1,
 			      SNDRV_DEFAULT_STR1, THIS_MODULE,
 			      sizeof(struct atmel_ac97c), &card);
 	if (retval) {
 		dev_dbg(&pdev->dev, "could not create sound card device\n");
-		goto err_snd_card_new;
+		return retval;
 	}
 
 	chip = get_chip(card);
 
-	retval = request_irq(irq, atmel_ac97c_interrupt, 0, "AC97C", chip);
-	if (retval) {
-		dev_dbg(&pdev->dev, "unable to request irq %d\n", irq);
-		goto err_request_irq;
-	}
+	retval = devm_request_irq(&pdev->dev, irq, atmel_ac97c_interrupt, 0, "AC97C", chip);
+	if (retval)
+		return retval;
+
 	chip->irq = irq;
 
 	spin_lock_init(&chip->lock);
@@ -749,13 +741,7 @@ static int atmel_ac97c_probe(struct platform_device *pdev)
 	chip->card = card;
 	chip->pclk = pclk;
 	chip->pdev = pdev;
-	chip->regs = ioremap(regs->start, resource_size(regs));
-
-	if (!chip->regs) {
-		dev_dbg(&pdev->dev, "could not remap register memory\n");
-		retval = -ENOMEM;
-		goto err_ioremap;
-	}
+	chip->regs = regs;
 
 	chip->reset_pin = devm_gpiod_get_index(dev, "ac97", 2, GPIOD_OUT_HIGH);
 	if (IS_ERR(chip->reset_pin))
@@ -770,25 +756,25 @@ static int atmel_ac97c_probe(struct platform_device *pdev)
 	retval = snd_ac97_bus(card, 0, &ops, chip, &chip->ac97_bus);
 	if (retval) {
 		dev_dbg(&pdev->dev, "could not register on ac97 bus\n");
-		goto err_ac97_bus;
+		return retval;
 	}
 
 	retval = atmel_ac97c_mixer_new(chip);
 	if (retval) {
 		dev_dbg(&pdev->dev, "could not register ac97 mixer\n");
-		goto err_ac97_bus;
+		return retval;
 	}
 
 	retval = atmel_ac97c_pcm_new(chip);
 	if (retval) {
 		dev_dbg(&pdev->dev, "could not register ac97 pcm device\n");
-		goto err_ac97_bus;
+		return retval;
 	}
 
 	retval = snd_card_register(card);
 	if (retval) {
 		dev_dbg(&pdev->dev, "could not register sound card\n");
-		goto err_ac97_bus;
+		return retval;
 	}
 
 	platform_set_drvdata(pdev, card);
@@ -797,18 +783,6 @@ static int atmel_ac97c_probe(struct platform_device *pdev)
 			chip->regs, irq);
 
 	return 0;
-
-err_ac97_bus:
-	iounmap(chip->regs);
-err_ioremap:
-	free_irq(irq, chip);
-err_request_irq:
-	snd_card_free(card);
-err_snd_card_new:
-	clk_disable_unprepare(pclk);
-err_prepare_enable:
-	clk_put(pclk);
-	return retval;
 }
 
 static int atmel_ac97c_suspend(struct device *pdev)
@@ -839,13 +813,6 @@ static void atmel_ac97c_remove(struct platform_device *pdev)
 	ac97c_writel(chip, CAMR, 0);
 	ac97c_writel(chip, COMR, 0);
 	ac97c_writel(chip, MR,   0);
-
-	clk_disable_unprepare(chip->pclk);
-	clk_put(chip->pclk);
-	iounmap(chip->regs);
-	free_irq(chip->irq, chip);
-
-	snd_card_free(card);
 }
 
 static struct platform_driver atmel_ac97c_driver = {
-- 
2.55.0

