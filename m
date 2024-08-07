Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F76C201258
	for <linux-sound@vger.kernel.org>; Wed,  7 Aug 2024 13:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723037671; cv=none; b=VPoAQXKfCN8IHhw/Ziuw/NDrLO2e3Aj4i4SNHlUnBrbTDCqPHJM8yezcRGk0B6CyFRsQV3SfU6BfH6E0ZHq1LRYqr8zKy4tj7lurtX28/Fa59sEguy5UtPQSWcIhzqJ3UCLX7G6NdRRyl4gX7WTkgCUbR+u6OiFFnVsFIfOrps4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723037671; c=relaxed/simple;
	bh=UWxFCqZWNtUdV8tIs6ZD7BeqgCXWqCFzI222rwkH5kk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ohHakUEXVDtQn5eH1wAi8OywPr1cgMKslicShoFjJrs+jvZu/6+SjBIcoT+nN03o0GiHaqROhDtgs0VfFfGozaVplDHQipkHKuaJZhn+GTFflIDpXtptvVIPHOP5zpLWPocKBEgHGKFGzloSz3k9WXeS4+xeYbpWHqTGVSPqajI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=DlqXTpBm; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=yZoJGH3x; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=DlqXTpBm; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=yZoJGH3x; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="DlqXTpBm";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="yZoJGH3x";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="DlqXTpBm";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="yZoJGH3x"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 715B41FBA0;
	Wed,  7 Aug 2024 13:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723037663; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/AKzHQpM5SwpXaPQ0ZKiArZDEl00sTcYihQioTa7Un8=;
	b=DlqXTpBmDzLehLwWKvQTsrxgw5YnxFfM3a5hqr+TAA7l28xytczRO0+zu9ScQxMTLb4qzA
	h5nn5kslF7d6TCRrWIf+2GvKG7aytAQoy7Z2zseh8QNqhnxVNaWIeiiE+8YOscx49OGHV9
	zwrMXmvl6L/l8HNoR1iVxBMG8Tc61Qc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723037663;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/AKzHQpM5SwpXaPQ0ZKiArZDEl00sTcYihQioTa7Un8=;
	b=yZoJGH3xGKgdazYbYdSe3/8uGkNfOmzdjDzR8G65KLflZp5x06rwEgA2QgZIxkCj7c9wRe
	D9Bd8tSxJ0+b1dBA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=DlqXTpBm;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=yZoJGH3x
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723037663; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/AKzHQpM5SwpXaPQ0ZKiArZDEl00sTcYihQioTa7Un8=;
	b=DlqXTpBmDzLehLwWKvQTsrxgw5YnxFfM3a5hqr+TAA7l28xytczRO0+zu9ScQxMTLb4qzA
	h5nn5kslF7d6TCRrWIf+2GvKG7aytAQoy7Z2zseh8QNqhnxVNaWIeiiE+8YOscx49OGHV9
	zwrMXmvl6L/l8HNoR1iVxBMG8Tc61Qc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723037663;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/AKzHQpM5SwpXaPQ0ZKiArZDEl00sTcYihQioTa7Un8=;
	b=yZoJGH3xGKgdazYbYdSe3/8uGkNfOmzdjDzR8G65KLflZp5x06rwEgA2QgZIxkCj7c9wRe
	D9Bd8tSxJ0+b1dBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5851F13A7D;
	Wed,  7 Aug 2024 13:34:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id mLhtFN93s2ZpVgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 07 Aug 2024 13:34:23 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 51/54] ALSA: sparc: Use standard print API
Date: Wed,  7 Aug 2024 15:34:41 +0200
Message-ID: <20240807133452.9424-52-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240807133452.9424-1-tiwai@suse.de>
References: <20240807133452.9424-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-0.01 / 50.00];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spamd-Bar: /
X-Rspamd-Queue-Id: 715B41FBA0
X-Spam-Level: 
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -0.01

Use the standard print API with dev_*() instead of the old house-baked
one.  It gives better information and allows dynamically control of
debug prints.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/sparc/amd7930.c |  8 ++---
 sound/sparc/cs4231.c  | 78 +++++++++++++++++++++++++------------------
 2 files changed, 49 insertions(+), 37 deletions(-)

diff --git a/sound/sparc/amd7930.c b/sound/sparc/amd7930.c
index 0fea04acc3ea..9bdf3db51d62 100644
--- a/sound/sparc/amd7930.c
+++ b/sound/sparc/amd7930.c
@@ -935,8 +935,8 @@ static int snd_amd7930_create(struct snd_card *card,
 	amd->regs = of_ioremap(&op->resource[0], 0,
 			       resource_size(&op->resource[0]), "amd7930");
 	if (!amd->regs) {
-		snd_printk(KERN_ERR
-			   "amd7930-%d: Unable to map chip registers.\n", dev);
+		dev_err(card->dev,
+			"amd7930-%d: Unable to map chip registers.\n", dev);
 		kfree(amd);
 		return -EIO;
 	}
@@ -945,8 +945,8 @@ static int snd_amd7930_create(struct snd_card *card,
 
 	if (request_irq(irq, snd_amd7930_interrupt,
 			IRQF_SHARED, "amd7930", amd)) {
-		snd_printk(KERN_ERR "amd7930-%d: Unable to grab IRQ %d\n",
-			   dev, irq);
+		dev_err(card->dev, "amd7930-%d: Unable to grab IRQ %d\n",
+			dev, irq);
 		snd_amd7930_free(amd);
 		return -EBUSY;
 	}
diff --git a/sound/sparc/cs4231.c b/sound/sparc/cs4231.c
index c2ad3fa2f25a..5f39b7847d31 100644
--- a/sound/sparc/cs4231.c
+++ b/sound/sparc/cs4231.c
@@ -292,9 +292,9 @@ static void snd_cs4231_dout(struct snd_cs4231 *chip, unsigned char reg,
 	snd_cs4231_ready(chip);
 #ifdef CONFIG_SND_DEBUG
 	if (__cs4231_readb(chip, CS4231U(chip, REGSEL)) & CS4231_INIT)
-		snd_printdd("out: auto calibration time out - reg = 0x%x, "
-			    "value = 0x%x\n",
-			    reg, value);
+		dev_dbg(chip->card->dev,
+			"out: auto calibration time out - reg = 0x%x, value = 0x%x\n",
+			reg, value);
 #endif
 	__cs4231_writeb(chip, chip->mce_bit | reg, CS4231U(chip, REGSEL));
 	wmb();
@@ -325,8 +325,9 @@ static unsigned char snd_cs4231_in(struct snd_cs4231 *chip, unsigned char reg)
 	snd_cs4231_ready(chip);
 #ifdef CONFIG_SND_DEBUG
 	if (__cs4231_readb(chip, CS4231U(chip, REGSEL)) & CS4231_INIT)
-		snd_printdd("in: auto calibration time out - reg = 0x%x\n",
-			    reg);
+		dev_dbg(chip->card->dev,
+			"in: auto calibration time out - reg = 0x%x\n",
+			reg);
 #endif
 	__cs4231_writeb(chip, chip->mce_bit | reg, CS4231U(chip, REGSEL));
 	mb();
@@ -363,14 +364,15 @@ static void snd_cs4231_mce_up(struct snd_cs4231 *chip)
 	snd_cs4231_ready(chip);
 #ifdef CONFIG_SND_DEBUG
 	if (__cs4231_readb(chip, CS4231U(chip, REGSEL)) & CS4231_INIT)
-		snd_printdd("mce_up - auto calibration time out (0)\n");
+		dev_dbg(chip->card->dev,
+			"mce_up - auto calibration time out (0)\n");
 #endif
 	chip->mce_bit |= CS4231_MCE;
 	timeout = __cs4231_readb(chip, CS4231U(chip, REGSEL));
 	if (timeout == 0x80)
-		snd_printdd("mce_up [%p]: serious init problem - "
-			    "codec still busy\n",
-			    chip->port);
+		dev_dbg(chip->card->dev,
+			"mce_up [%p]: serious init problem - codec still busy\n",
+			chip->port);
 	if (!(timeout & CS4231_MCE))
 		__cs4231_writeb(chip, chip->mce_bit | (timeout & 0x1f),
 				CS4231U(chip, REGSEL));
@@ -386,16 +388,18 @@ static void snd_cs4231_mce_down(struct snd_cs4231 *chip)
 	spin_lock_irqsave(&chip->lock, flags);
 #ifdef CONFIG_SND_DEBUG
 	if (__cs4231_readb(chip, CS4231U(chip, REGSEL)) & CS4231_INIT)
-		snd_printdd("mce_down [%p] - auto calibration time out (0)\n",
-			    CS4231U(chip, REGSEL));
+		dev_dbg(chip->card->dev,
+			"mce_down [%p] - auto calibration time out (0)\n",
+			CS4231U(chip, REGSEL));
 #endif
 	chip->mce_bit &= ~CS4231_MCE;
 	reg = __cs4231_readb(chip, CS4231U(chip, REGSEL));
 	__cs4231_writeb(chip, chip->mce_bit | (reg & 0x1f),
 			CS4231U(chip, REGSEL));
 	if (reg == 0x80)
-		snd_printdd("mce_down [%p]: serious init problem "
-			    "- codec still busy\n", chip->port);
+		dev_dbg(chip->card->dev,
+			"mce_down [%p]: serious init problem - codec still busy\n",
+			chip->port);
 	if ((reg & CS4231_MCE) == 0) {
 		spin_unlock_irqrestore(&chip->lock, flags);
 		return;
@@ -415,8 +419,8 @@ static void snd_cs4231_mce_down(struct snd_cs4231 *chip)
 	spin_unlock_irqrestore(&chip->lock, flags);
 
 	if (reg)
-		snd_printk(KERN_ERR
-			   "mce_down - auto calibration time out (2)\n");
+		dev_err(chip->card->dev,
+			"mce_down - auto calibration time out (2)\n");
 }
 
 static void snd_cs4231_advance_dma(struct cs4231_dma_control *dma_cont,
@@ -710,7 +714,7 @@ static void snd_cs4231_init(struct snd_cs4231 *chip)
 	snd_cs4231_mce_down(chip);
 
 #ifdef SNDRV_DEBUG_MCE
-	snd_printdd("init: (1)\n");
+	pr_debug("init: (1)\n");
 #endif
 	snd_cs4231_mce_up(chip);
 	spin_lock_irqsave(&chip->lock, flags);
@@ -725,7 +729,7 @@ static void snd_cs4231_init(struct snd_cs4231 *chip)
 	snd_cs4231_mce_down(chip);
 
 #ifdef SNDRV_DEBUG_MCE
-	snd_printdd("init: (2)\n");
+	pr_debug("init: (2)\n");
 #endif
 
 	snd_cs4231_mce_up(chip);
@@ -736,8 +740,8 @@ static void snd_cs4231_init(struct snd_cs4231 *chip)
 	snd_cs4231_mce_down(chip);
 
 #ifdef SNDRV_DEBUG_MCE
-	snd_printdd("init: (3) - afei = 0x%x\n",
-		    chip->image[CS4231_ALT_FEATURE_1]);
+	pr_debug("init: (3) - afei = 0x%x\n",
+		 chip->image[CS4231_ALT_FEATURE_1]);
 #endif
 
 	spin_lock_irqsave(&chip->lock, flags);
@@ -753,7 +757,7 @@ static void snd_cs4231_init(struct snd_cs4231 *chip)
 	snd_cs4231_mce_down(chip);
 
 #ifdef SNDRV_DEBUG_MCE
-	snd_printdd("init: (4)\n");
+	pr_debug("init: (4)\n");
 #endif
 
 	snd_cs4231_mce_up(chip);
@@ -763,7 +767,7 @@ static void snd_cs4231_init(struct snd_cs4231 *chip)
 	snd_cs4231_mce_down(chip);
 
 #ifdef SNDRV_DEBUG_MCE
-	snd_printdd("init: (5)\n");
+	pr_debug("init: (5)\n");
 #endif
 }
 
@@ -1038,7 +1042,8 @@ static int snd_cs4231_probe(struct snd_cs4231 *chip)
 				break;	/* this is valid value */
 		}
 	}
-	snd_printdd("cs4231: port = %p, id = 0x%x\n", chip->port, id);
+	dev_dbg(chip->card->dev,
+		"cs4231: port = %p, id = 0x%x\n", chip->port, id);
 	if (id != 0x0a)
 		return -ENODEV;	/* no valid device found */
 
@@ -1794,7 +1799,8 @@ static int snd_cs4231_sbus_create(struct snd_card *card,
 	chip->port = of_ioremap(&op->resource[0], 0,
 				chip->regs_size, "cs4231");
 	if (!chip->port) {
-		snd_printdd("cs4231-%d: Unable to map chip registers.\n", dev);
+		dev_dbg(chip->card->dev,
+			"cs4231-%d: Unable to map chip registers.\n", dev);
 		return -EIO;
 	}
 
@@ -1815,8 +1821,9 @@ static int snd_cs4231_sbus_create(struct snd_card *card,
 
 	if (request_irq(op->archdata.irqs[0], snd_cs4231_sbus_interrupt,
 			IRQF_SHARED, "cs4231", chip)) {
-		snd_printdd("cs4231-%d: Unable to grab SBUS IRQ %d\n",
-			    dev, op->archdata.irqs[0]);
+		dev_dbg(chip->card->dev,
+			"cs4231-%d: Unable to grab SBUS IRQ %d\n",
+			dev, op->archdata.irqs[0]);
 		snd_cs4231_sbus_free(chip);
 		return -EBUSY;
 	}
@@ -1986,32 +1993,37 @@ static int snd_cs4231_ebus_create(struct snd_card *card,
 	if (!chip->port || !chip->p_dma.ebus_info.regs ||
 	    !chip->c_dma.ebus_info.regs) {
 		snd_cs4231_ebus_free(chip);
-		snd_printdd("cs4231-%d: Unable to map chip registers.\n", dev);
+		dev_dbg(chip->card->dev,
+			"cs4231-%d: Unable to map chip registers.\n", dev);
 		return -EIO;
 	}
 
 	if (ebus_dma_register(&chip->c_dma.ebus_info)) {
 		snd_cs4231_ebus_free(chip);
-		snd_printdd("cs4231-%d: Unable to register EBUS capture DMA\n",
-			    dev);
+		dev_dbg(chip->card->dev,
+			"cs4231-%d: Unable to register EBUS capture DMA\n",
+			dev);
 		return -EBUSY;
 	}
 	if (ebus_dma_irq_enable(&chip->c_dma.ebus_info, 1)) {
 		snd_cs4231_ebus_free(chip);
-		snd_printdd("cs4231-%d: Unable to enable EBUS capture IRQ\n",
-			    dev);
+		dev_dbg(chip->card->dev,
+			"cs4231-%d: Unable to enable EBUS capture IRQ\n",
+			dev);
 		return -EBUSY;
 	}
 
 	if (ebus_dma_register(&chip->p_dma.ebus_info)) {
 		snd_cs4231_ebus_free(chip);
-		snd_printdd("cs4231-%d: Unable to register EBUS play DMA\n",
-			    dev);
+		dev_dbg(chpi->card->dev,
+			"cs4231-%d: Unable to register EBUS play DMA\n",
+			dev);
 		return -EBUSY;
 	}
 	if (ebus_dma_irq_enable(&chip->p_dma.ebus_info, 1)) {
 		snd_cs4231_ebus_free(chip);
-		snd_printdd("cs4231-%d: Unable to enable EBUS play IRQ\n", dev);
+		dev_dbg(chip->card->dev,
+			"cs4231-%d: Unable to enable EBUS play IRQ\n", dev);
 		return -EBUSY;
 	}
 
-- 
2.43.0

