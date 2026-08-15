Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E384433F5BC
	for <linux-sound@vger.kernel.org>; Sat, 15 Aug 2026 16:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786811246; cv=none; b=NAjoy0w7yrgFKnw7vo+ZcsiQ+Pyb9/DnAxUde10KXeFmFgoC4xyX7u8YG1M4KY25LCO1MW1NA6IOH6aMYx/C1bf10U2P3yEJPsgBNryyVraGPprQuJx0S2nL46SoVLkxUxB/pLP+CRT68KDIrvlt/OGfvQxD/DfW/FdBfGWyhD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786811246; c=relaxed/simple;
	bh=Ria57sgjRM6qX6xpXmPX5TAIguxFpNSG6u/CIEFECzY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=liAsz8Hz99kPaemJQcrLs/FY6URh9TYU36TcUwhuBGWXuw4HFwj83v7L0XknwT5B60uHN00EFO7xI3uQ9lqb70I5VvHFQfw5S8DVTIx20oCBjjopYfk9Z3iv4hbdNPY5DyxK4Drv2PHmdhhilDMYLK/mb+tuTiqBzF+ydqLymEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m9zEOU8/; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m9zEOU8/"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-38e3efab7e0so1357551a91.0
        for <linux-sound@vger.kernel.org>; Sat, 15 Aug 2026 09:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786811244; x=1787416044; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/7rlTdXPQx8KtQhzgq3ccigzE8IVB9jSLAgF9XPuDuY=;
        b=m9zEOU8/cJDlwbeRhJMxYBUNw5pMtryhAkR/2yY+r3P0sCwjCZnLrOsLAemxJPmcp2
         EdOcAgSyJ0gA/sQww/U83o7iVwtKA6rcD6YSAtNNuaxwEfkKsJPn83Ic36GCE2IuzcpR
         6SYGYdS75yjU9MYcx9oufJvJ+7swHfaas0YMYHTPo/k6O04JyVPjD8pJyZKQpw1bDagR
         29fJwzWds43u6Ep+CGcWIpVNjuWSCwAhL3SPO2zRMDrpP7GZn2rcUDdncrCiSQ8+Xmaq
         QVHHDffCekMw+tLVuj0LgqneisjDBzWAlwg9h8waIYzoE97NP8U0xAaJg8zBvSKKskzE
         x34g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786811244; x=1787416044;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/7rlTdXPQx8KtQhzgq3ccigzE8IVB9jSLAgF9XPuDuY=;
        b=VWnNHwRvoHX+VBCBzLk95WcinmL5dUD5LbS5I6q6Zap2YLbtHVNY5e8zy25H5kKh9g
         /iUQDP8gR4GjT3PVoXHkDA+FRyIf7SRZuBl/1pgd+KJ1GdGejv9BGKKr8V7paIbgqZol
         dI+We//bzKhT4EjXRDMwYsotS7zmnKc4QoN6w0fyZcknwolcdLvSTDwDBJiz4qlJe+MZ
         s0/WUJ6ymLvNtRUg/CRZbHWcDNwglYrXRLdulQd3/j756JFy3PwyUTQ7CV+Qurc8rB2T
         wcUz2CVGatklyVZhzigWEryQl/7G7gcLJAF3cep/T91tHpBw+mdHJUlq8QKTRJOfRtlD
         q5RQ==
X-Gm-Message-State: AOJu0YxB3hbFm8Wp/v8ZOl/yxZD/dtTDrlKbFalsxlUwfUTxef5Vuptp
	UBiiwYv3a3ndpvn58QJlnOTipEIVMrSfh/KgkR+qKzmmWJVSW7foWxT5
X-Gm-Gg: AR+sD10eaZliNXlUYiaNV7ZCG1eb4kxLqeuNVumTXEfAqlHurM8eu00WMJEVpiqO8yv
	KHwEwaPlvhistDgKRVjXl1D0qR+nkiYVQFBik4iw2vXSrwTmgEWL//OGNlxr4LWCf1W9l2lxCGA
	VTHrhT/Fet+Q7D0k448GWiIz6aUMvsXYBVfD252kqyzYZ3piPQIoD+C7xsUmL2WsZSwfCzoYlEC
	Mzv40miptK4rrH+DP6fpu3tAwfhxhBl44uMaf905AQLmmMM9GkhZ0rw5yDttLrRJeaD0H7tsIvK
	pUT5f0dHxxWYXtFDokeG8dX2/YR2jPV4KkhzJO0cU0r47N4IheHYLk5neOQGfMVkMiB+1YWc8sH
	6j7ZaGTK9erCtOrJlD5lB/9N1Gbdo1+p5ql2FwdyM3WR5JNiXkICWGKj7waoFKLiNTjefz/9H7f
	kDuuRMOMSeJzQZBPCEaPOIfouAQw14RNz+xDlaoG4a7droZyko1jvJ8n+jFCPkUdiAzV0oSg+kG
	7tyd6RuffCmnLctgdFJoDGVrRzHFm86
X-Received: by 2002:a17:90b:37c3:b0:390:84db:888e with SMTP id 98e67ed59e1d1-3933afb4ba2mr11298200a91.7.1786811244193;
        Sat, 15 Aug 2026 09:27:24 -0700 (PDT)
Received: from Ubuntu.. ([49.43.242.113])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141387ed5b1sm36427232c88.8.2026.08.15.09.27.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2026 09:27:23 -0700 (PDT)
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
Subject: [PATCH 1/2] ASoC: sound: atmel: ac97c: Fix IRQ handler null pointer dereference
Date: Sat, 15 Aug 2026 16:27:05 +0000
Message-ID: <20260815162707.353893-2-manishbaing2789@gmail.com>
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

In atmel_ac97c_probe(), request_irq() is called before ioremap().
If an interrupt fires immediately, the handler atmel_ac97c_interrupt()
will attempt to dereference chip->regs via ac97c_readl(), leading to
a null pointer dereference and kernel panic.

Move request_irq() to the end of the probe function, after memory
is mapped and clocks are enabled, ensuring the hardware is fully
ready before interrupts are serviced.

Running make W=1 returns no errors. I was unable to test the patch
because I do not have the hardware. The issue was flagged by the
Sashiko AI bot.

Link: https://sashiko.dev/#/patchset/20260530052812.115994-1-manishbaing2789@gmail.com?part=1
Reported-by: Sashiko AI <sashiko-bot@kernel.org>

Signed-off-by: Manish Baing <manishbaing2789@gmail.com>
---
 sound/atmel/ac97c.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/sound/atmel/ac97c.c b/sound/atmel/ac97c.c
index e394205f469b..205475157e72 100644
--- a/sound/atmel/ac97c.c
+++ b/sound/atmel/ac97c.c
@@ -733,11 +733,6 @@ static int atmel_ac97c_probe(struct platform_device *pdev)
 
 	chip = get_chip(card);
 
-	retval = request_irq(irq, atmel_ac97c_interrupt, 0, "AC97C", chip);
-	if (retval) {
-		dev_dbg(&pdev->dev, "unable to request irq %d\n", irq);
-		goto err_request_irq;
-	}
 	chip->irq = irq;
 
 	spin_lock_init(&chip->lock);
@@ -785,6 +780,12 @@ static int atmel_ac97c_probe(struct platform_device *pdev)
 		goto err_ac97_bus;
 	}
 
+	retval = request_irq(irq, atmel_ac97c_interrupt, 0, "AC97C", chip);
+	if (retval) {
+		dev_dbg(&pdev->dev, "unable to request irq %d\n", irq);
+		goto err_request_irq;
+	}
+
 	retval = snd_card_register(card);
 	if (retval) {
 		dev_dbg(&pdev->dev, "could not register sound card\n");
-- 
2.43.0

