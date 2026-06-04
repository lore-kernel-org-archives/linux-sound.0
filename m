Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA9A13D891B
	for <linux-sound@vger.kernel.org>; Thu,  4 Jun 2026 20:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780605421; cv=none; b=MHgtXxoqDHX9VcNxL3daI2CABX2SqQaj35PjETJux8bp7tDuRQESEIn+4MFNMa4Pm1KfBqyHak3936Tzx3dGDCsrZpb9foDo4MhjR3GW2wLyPrcMaocX+0qAVlXaM7OgIgRoubbyRk7t9Cj3CHHClh1DUtlW0QwrS7tlm+cb7Zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780605421; c=relaxed/simple;
	bh=317dd9absANjSuCrAQXv+YWq8qGvdqAv9Ef0rbkdF6Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mYl6/5puYt8NuKZtx9m00j1RNiTfkeQyeTlDl0hezaGFPrmpAuJEbQhftdy8zUGQIWoTeqromZllBA8wuZH/iOd24xezywd8ElopYzRf2pqAAbc5ZIq78ud+a7uFOD6LNoIkjtIa9LudDul+vCTyljB6dfAU8gvFN3KWfa62tTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=no4WyL+f; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="no4WyL+f"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-84232e83ca9so560757b3a.2
        for <linux-sound@vger.kernel.org>; Thu, 04 Jun 2026 13:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780605419; x=1781210219; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FSEu/KQOdhdFHwNGT0hTQLZR1iOR8ZTNFTO5ZOxwoto=;
        b=no4WyL+fjD++Jn71aW4cs1V8cFeOBzboNlknOuAhPCetl1a6fO+8Ag8fftuoou2959
         7pkdKnv5ul7J7gSviIC6HaA+D/5ETVaNFt4/j9cbBSJsR5a3Cq73YsEFa+oEuawdDKvj
         8XDebHsQsEVaDGllKHl1xHd7j3z+pMrNRBAe5pAG2M2kj4Ug2fKr5os8vzpotBBoNPgs
         z4qWcjbxQEhmBKs41j+ek9n4UPp57dcjMmIpbwrXQkm8uMaehHsE1J23ZlrlScnMf3sW
         Pc3gLI1EreNhvnpQiei7Y+n1fSck1ErjsmgwKZgANJe/2PVvgv8qy6U3hI99Lv4/zh8a
         nnlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780605419; x=1781210219;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FSEu/KQOdhdFHwNGT0hTQLZR1iOR8ZTNFTO5ZOxwoto=;
        b=mJeWgo4wSIBUUaQm1iaGRgyLr2tKzd9wmxwopKLQIMaBPsGvxNP8tarFth4BDe/Qvj
         oEo/lTIDIuW/+0qRa+3ajahE017vule9ElH1CZUbYPU1ssZGKtreiipK74agt15PATYo
         gHv6rN8bsZ8v87DeGTbri7phC6pVEYmm9DiJGiPdSBPHdd5jHzKrKrAdrzmFljBSz8Bl
         VXUztkwFvr+Q433eJgS7avlKacY6lAJAXNnNnCWw17iNTsWvyTIzBw4AEGUJIDDURhvt
         +RmvUlRo/EVkkGU+M/05Z3r2/Y8QSDXDtrbxGDMrrQXWTmtZmxHWSKuzsyI6c5e1KA0I
         EYvg==
X-Gm-Message-State: AOJu0Yxuh2aU9LIWrn2oEhQAL0pD/gNpT4cUbgC963/NjGxKXjBb5v0t
	pBiPb2QqHP9zP3P1LLJVoIsr2okZfecYBGTd3nNOhG3jco+aEbC/s0sqqBtxM3JoCdc=
X-Gm-Gg: Acq92OFksuv9PQBkAOrOH2kr8Sm0FQS/Fd0BKFg9luYdRE/l6pZnrYVui1vDD7jYKaL
	ALULoOQ6CPnedBWv0e9y4BaNqZLRlgIy+KBgS6byKH520pItCO3r0DY7gayZ9AGjYDSg93dWy4m
	7d89AM6nPQ96ghEgILDBEE0nFE7oGRijjdM4R5AfJn2UYdQD4UZrrfkAGyML1ty3trG+9ysKXfn
	oA3hS995SVmBqm968w8TeuCcd8PSBTcviO42bNulikF0A3OBUcAtFyH2NtYTzT60f7+g3Uu1OIO
	VUXRh92+4f+WbY0EtUTEApD3XodQ7dZAS/r8a8+/dyb/mAW6C+BaTh06XYWquC8OxHq42tSHdoZ
	7/v+SDlIrWfXUss+hdl/Lef31iBswd6ESAAWMWjjFAgWDZ7wrAvWBiMQclD/H3NXcAQIgU81g5n
	lYhiOE5mzW2W7PMBKyvF9PUvScyqnz9DZd+IXn9mirHonbizMqS0rHNrsNbIy9w3b5b/2Lt+cDC
	6YT
X-Received: by 2002:a05:6a00:acd:b0:82f:776f:a78d with SMTP id d2e1a72fcca58-842b0f9987amr265860b3a.19.1780605419056;
        Thu, 04 Jun 2026 13:36:59 -0700 (PDT)
Received: from Ubuntu.. ([49.37.171.82])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842828fe634sm7118257b3a.52.2026.06.04.13.36.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 13:36:58 -0700 (PDT)
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
Subject: [RFC PATCH 1/2] ASoC: sound: atmel_ac97c: Fix IRQ handler null pointer dereference
Date: Thu,  4 Jun 2026 20:36:22 +0000
Message-ID: <20260604203623.162640-2-manishbaing2789@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260604203623.162640-1-manishbaing2789@gmail.com>
References: <20260604203623.162640-1-manishbaing2789@gmail.com>
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
because I do not have the hardware.The issue was flagged by the
Sashiko AI bot.

Link: https://sashiko.dev/#/patchset/20260530052812.115994-1-manishbaing2789@gmail.com?part=1
Reported-by: Sashiko AI <sashiko-bot@kernel.org>
Signed-off-by: Manish Baing <manishbaing2789@gmail.com>
---
 sound/atmel/ac97c.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/sound/atmel/ac97c.c b/sound/atmel/ac97c.c
index df0a049192de..cd74395dd222 100644
--- a/sound/atmel/ac97c.c
+++ b/sound/atmel/ac97c.c
@@ -734,11 +734,6 @@ static int atmel_ac97c_probe(struct platform_device *pdev)
 
 	chip = get_chip(card);
 
-	retval = request_irq(irq, atmel_ac97c_interrupt, 0, "AC97C", chip);
-	if (retval) {
-		dev_dbg(&pdev->dev, "unable to request irq %d\n", irq);
-		goto err_request_irq;
-	}
 	chip->irq = irq;
 
 	spin_lock_init(&chip->lock);
@@ -786,6 +781,12 @@ static int atmel_ac97c_probe(struct platform_device *pdev)
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

