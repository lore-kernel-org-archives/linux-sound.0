Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F25B2427FA6
	for <linux-sound@vger.kernel.org>; Sat, 15 Aug 2026 16:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786811266; cv=none; b=ChZ8SgBs8r4TB14gyV1i4nPRFGcRg43jlmzdlp3T/Jd1BIBHOYAtizfRoeJnEFs8Hz7qMXxUbKOMAtOcugX/mgKqdm6yKV0zYA8sI5PnvxYlTad/nZbJt+6JXLP4Gh735uKWtHmz9060F0R7gECMi9knAG/aIAUfA/7DIYRCia8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786811266; c=relaxed/simple;
	bh=Btt4iLPBCTz3XYDO6c2R703syxLmssC5uJR4QwFg5VQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZuRA30QZIXZvtAZHULVKqBG4fSMhmXmN3R2TeQj1XuLsNVwzkZ3zwzjIth4cMAwSN2IsfsU7H1fqgSk040aIEvtMBNpqon1Nwzn7I1oj1RqlxW3Tt/W6YZiVZD4UY183itYN5yNycB+AM522pSdcXGSZsqdOBGO8kn0uOKRAC8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pEbWYNzx; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pEbWYNzx"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-c999f162c9aso1340621a12.3
        for <linux-sound@vger.kernel.org>; Sat, 15 Aug 2026 09:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786811264; x=1787416064; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u0aZhTYimAntKdzPJKS6oC7Sa1HRLwmKSoA78yTWTLs=;
        b=pEbWYNzxZ01J1kiRIocnsAEtlxpMyhxltXoosY3VoUd3AO9Zgj0YDj2bdC1BxYqFQG
         zDozdWrS47u7Y+Z+8uY3wZG3BuTH32oFgJdIwdVqotOOv8PsDkh4kMtMZNiKK2xIlIA2
         u8aEdp0Mp7se87wD66Qak8hdhkNKqbFtnu3pdPPz7Kb+6+eqv64PzRGv1nj2zfavGwUa
         Il22R1VXXuH3LgyVCLVwWLKenYmds9kfEjlJqI9Nr7rPMK8rCZeIYED4McEezAUi1jLl
         /li8RAGPHY+OV9Ez658ZX5+hssH1gSx5q8O2UnXzWLxPxWgauNBYg0KA1vUiS7cwx2FR
         VuQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786811264; x=1787416064;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=u0aZhTYimAntKdzPJKS6oC7Sa1HRLwmKSoA78yTWTLs=;
        b=rt07i4bDl2lINZAvqQsBu2AGl1msNTlh9OJkt2Jy/KNLjETBejTkYTMqfeOPKAw3I4
         6wU8ONWp+7ZiLVDTuiprxJlFYyl4jpBcU0mwERO+BxCZbCRT8jyrla1+5inFcIHWMLq+
         MppU4iwNqp1zzWx8ld1RKyb9G5cC3HNIWfKWK/VXLw78DbImIpdEsa4mAi0O3RY5gaGb
         LJtDdzftfacrQGNe7pGmkNVtDLc9/RVquWSCpXLzWfmf2j3vMt352qn4Z7tIHrBaX7mV
         6ocAGiTD+s3BCtQ/XfUIcnF10H6x900bcQ2XHtnzTKH8Tgg2QzK6yqjbdbjZY/rRbxM1
         gkJw==
X-Gm-Message-State: AOJu0YwVF+Zklh3D4VtMFiqPld1vIkdMN+PSYieexaVqRoDm4QTrozJV
	m7fggblP+sjk7+p0zm4xDb4BS+XCVbQSQJWYr+iQIBi6jDQXuf9/gAG0
X-Gm-Gg: AR+sD12K5TsGjDkrdW49c+uiys4/4QTM8qc8jiEgJPpC+Z3o04Sn03IOMm8rtm+y6ro
	xQh+M/ggO+Nw0HwZt90E/0i7fsEh63VlRTbpmHtbiKMSUGYb96YGfvLeNfD6c/ltTAhaGnTFwpt
	R8mtdICAA4xj07LIBJROlQ+OtVj6uOOWr5I5BcMIVlkWtAyi8BQ8FpJ+EJxTLzdM4ma1YwC88nd
	hkufWtkdHtc2yBQ6bGi0XuwSuHMfogSg6QJ+n4ta6BqBKwv0MaYHEcBs6L8e3XMuC/+rdG92I2C
	5Bj7Z7dSH0Xw+rpKPblrUnL/j6IqojeQN7zj+B1y/dxythVcKD6NW5Vckxmmtucz80ZRDyGfRKw
	HgVE4m8CMsN4+ldMglbkzZTQkG16PKXCGO/MMioZnpsT6CmhpT6ohRDjaulzKgkb70Nlo4rq9PR
	m2CgTFTIxbVNeU8owoKL/5bo2pEwzBmKx3mXXvZBWobEl8okSd72o9vePrPf0uw8kbWoOk/iNp6
	lI0VYdGpDr+6wufaP/Hd4+9zrgDGthS
X-Received: by 2002:a05:6a21:7111:b0:3b1:882a:607b with SMTP id adf61e73a8af0-3cc71d24898mr16890086637.22.1786811264197;
        Sat, 15 Aug 2026 09:27:44 -0700 (PDT)
Received: from Ubuntu.. ([49.43.242.113])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141387ed5b1sm36427232c88.8.2026.08.15.09.27.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2026 09:27:43 -0700 (PDT)
From: Manish Baing <manishbaing2789@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev
Cc: linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	manishbaing2789@gmail.com,
	Sashiko AI <sashiko-bot@kernel.org>
Subject: [PATCH 2/2] ASoC: atmel: ac97c: Fix use-after-free on driver teardown
Date: Sat, 15 Aug 2026 16:27:06 +0000
Message-ID: <20260815162707.353893-3-manishbaing2789@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260815162707.353893-1-manishbaing2789@gmail.com>
References: <20260815162707.353893-1-manishbaing2789@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In atmel_ac97c_remove() and the probe error path, the driver disables
clocks and unmaps memory before freeing the IRQ. If a stray interrupt
fires during this window, the handler will attempt to access unmapped
memory or unclocked hardware, resulting in a kernel panic.

Reorder the teardown sequence to call free_irq() first, adhering to
the standard reverse-initialization order.

Running make W=1 returns no errors. I was unable to test the patch
because I do not have the hardware. The issue was flagged by the
Sashiko AI bot.

Link: https://sashiko.dev/#/patchset/20260530052812.115994-1-manishbaing2789@gmail.com?part=1
Reported-by: Sashiko AI <sashiko-bot@kernel.org>

Signed-off-by: Manish Baing <manishbaing2789@gmail.com>
---
 sound/atmel/ac97c.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/sound/atmel/ac97c.c b/sound/atmel/ac97c.c
index 205475157e72..24a27e67f15f 100644
--- a/sound/atmel/ac97c.c
+++ b/sound/atmel/ac97c.c
@@ -789,7 +789,7 @@ static int atmel_ac97c_probe(struct platform_device *pdev)
 	retval = snd_card_register(card);
 	if (retval) {
 		dev_dbg(&pdev->dev, "could not register sound card\n");
-		goto err_ac97_bus;
+		goto err_snd_card_register;
 	}
 
 	platform_set_drvdata(pdev, card);
@@ -799,11 +799,12 @@ static int atmel_ac97c_probe(struct platform_device *pdev)
 
 	return 0;
 
+err_snd_card_register:
+	free_irq(irq, chip);
 err_ac97_bus:
+err_request_irq:
 	iounmap(chip->regs);
 err_ioremap:
-	free_irq(irq, chip);
-err_request_irq:
 	snd_card_free(card);
 err_snd_card_new:
 	clk_disable_unprepare(pclk);
@@ -841,10 +842,10 @@ static void atmel_ac97c_remove(struct platform_device *pdev)
 	ac97c_writel(chip, COMR, 0);
 	ac97c_writel(chip, MR,   0);
 
+	free_irq(chip->irq, chip);
 	clk_disable_unprepare(chip->pclk);
 	clk_put(chip->pclk);
 	iounmap(chip->regs);
-	free_irq(chip->irq, chip);
 
 	snd_card_free(card);
 }
-- 
2.43.0

