Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0832D1EB4AB
	for <linux-sound@vger.kernel.org>; Wed,  7 Aug 2024 13:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723037665; cv=none; b=nFXN0vQUxL3Hea14UAeWVC0dVElJMWzoeSX1woAurlmtM9WIB6wvZ6EcVKK6iPtzlcMDg8EILjlzv0wIt0IeOdVUfIHImx7UQxxvaS07ESK0P2f7yBJBkJp1l9vMPOFE5OXJPa3Tiavfd06rdKsWi/WcEp73LpCwLT85jApzV5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723037665; c=relaxed/simple;
	bh=TiF8vGiolShRbqOJEv6a75sQj0hOHr6fssAyqFt/+gM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gbXvodh0xj4HgmiH53m+lgvhf4v8e962LavNvo5HoPsg4tg9JbxDLCfLAv6lD9E5ApPBrk+kAB3keC28O+ugqH0fvPc0mX3BQSCyNEezkdnDlI9yjR9kre3QuRpkn45hnRwTR3awIMkvMfRRRc6SxwO/Gdtp+WU7RRc0qAo2Tsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=GoUD29D9; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=e6lvIJxE; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=GoUD29D9; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=e6lvIJxE; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="GoUD29D9";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="e6lvIJxE";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="GoUD29D9";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="e6lvIJxE"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 82B9D21D22;
	Wed,  7 Aug 2024 13:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723037659; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hOlVCTRAjwibT5YLW9ETAaGqK/4hCmTUmo32ueyKsnk=;
	b=GoUD29D9deAaBjl+zO4EGPDNNc8S95MiS7uD4ZC8grwhz3Q+AVA2H2QeKclnf6liMmAgV8
	2XP1KFTPh+rzJbTq/0u0YXdaq3RcWdx2wx0N+0m1O3Sv3fp/Gu8XyeG0OCck5pyUYTf8M8
	UxlpqOJzRO4W3wdnZ04Uaj4cMASgC8c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723037659;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hOlVCTRAjwibT5YLW9ETAaGqK/4hCmTUmo32ueyKsnk=;
	b=e6lvIJxEYUzRehKVIJjOP4nbxlilfqrEsucyIilO1Zjy+/tzIoSr0iMdDPXPjW3k7qfztd
	QhYMN1or1tQgPoDQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=GoUD29D9;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=e6lvIJxE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723037659; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hOlVCTRAjwibT5YLW9ETAaGqK/4hCmTUmo32ueyKsnk=;
	b=GoUD29D9deAaBjl+zO4EGPDNNc8S95MiS7uD4ZC8grwhz3Q+AVA2H2QeKclnf6liMmAgV8
	2XP1KFTPh+rzJbTq/0u0YXdaq3RcWdx2wx0N+0m1O3Sv3fp/Gu8XyeG0OCck5pyUYTf8M8
	UxlpqOJzRO4W3wdnZ04Uaj4cMASgC8c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723037659;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hOlVCTRAjwibT5YLW9ETAaGqK/4hCmTUmo32ueyKsnk=;
	b=e6lvIJxEYUzRehKVIJjOP4nbxlilfqrEsucyIilO1Zjy+/tzIoSr0iMdDPXPjW3k7qfztd
	QhYMN1or1tQgPoDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 68EF913A7D;
	Wed,  7 Aug 2024 13:34:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id eMNhF9t3s2ZpVgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 07 Aug 2024 13:34:19 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 21/54] ALSA: cmi8328: Use standard print API
Date: Wed,  7 Aug 2024 15:34:11 +0200
Message-ID: <20240807133452.9424-22-tiwai@suse.de>
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
X-Spam-Level: 
X-Rspamd-Action: no action
X-Spam-Score: -3.01
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 82B9D21D22
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_NONE(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:email]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org

Use the standard print API with dev_*() instead of the old house-baked
one.  It gives better information and allows dynamically control of
debug prints.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/isa/cmi8328.c | 42 +++++++++++++++++++++---------------------
 1 file changed, 21 insertions(+), 21 deletions(-)

diff --git a/sound/isa/cmi8328.c b/sound/isa/cmi8328.c
index 8902cfb830f7..d30cce4cc7e3 100644
--- a/sound/isa/cmi8328.c
+++ b/sound/isa/cmi8328.c
@@ -159,7 +159,7 @@ static int snd_cmi8328_mixer(struct snd_wss *chip)
 	strcpy(id2.name, "CD Playback Switch");
 	err = snd_ctl_rename_id(card, &id1, &id2);
 	if (err < 0) {
-		snd_printk(KERN_ERR "error renaming control\n");
+		dev_err(card->dev, "error renaming control\n");
 		return err;
 	}
 	/* rename AUX0 volume to CD */
@@ -167,7 +167,7 @@ static int snd_cmi8328_mixer(struct snd_wss *chip)
 	strcpy(id2.name, "CD Playback Volume");
 	err = snd_ctl_rename_id(card, &id1, &id2);
 	if (err < 0) {
-		snd_printk(KERN_ERR "error renaming control\n");
+		dev_err(card->dev, "error renaming control\n");
 		return err;
 	}
 	/* rename AUX1 switch to Synth */
@@ -176,7 +176,7 @@ static int snd_cmi8328_mixer(struct snd_wss *chip)
 	strcpy(id2.name, "Synth Playback Switch");
 	err = snd_ctl_rename_id(card, &id1, &id2);
 	if (err < 0) {
-		snd_printk(KERN_ERR "error renaming control\n");
+		dev_err(card->dev, "error renaming control\n");
 		return err;
 	}
 	/* rename AUX1 volume to Synth */
@@ -185,7 +185,7 @@ static int snd_cmi8328_mixer(struct snd_wss *chip)
 	strcpy(id2.name, "Synth Playback Volume");
 	err = snd_ctl_rename_id(card, &id1, &id2);
 	if (err < 0) {
-		snd_printk(KERN_ERR "error renaming control\n");
+		dev_err(card->dev, "error renaming control\n");
 		return err;
 	}
 
@@ -251,35 +251,35 @@ static int snd_cmi8328_probe(struct device *pdev, unsigned int ndev)
 	if (irq[ndev] == SNDRV_AUTO_IRQ) {
 		irq[ndev] = snd_legacy_find_free_irq(irqs);
 		if (irq[ndev] < 0) {
-			snd_printk(KERN_ERR "unable to find a free IRQ\n");
+			dev_err(pdev, "unable to find a free IRQ\n");
 			return -EBUSY;
 		}
 	}
 	if (dma1[ndev] == SNDRV_AUTO_DMA) {
 		dma1[ndev] = snd_legacy_find_free_dma(dma1s);
 		if (dma1[ndev] < 0) {
-			snd_printk(KERN_ERR "unable to find a free DMA1\n");
+			dev_err(pdev, "unable to find a free DMA1\n");
 			return -EBUSY;
 		}
 	}
 	if (dma2[ndev] == SNDRV_AUTO_DMA) {
 		dma2[ndev] = snd_legacy_find_free_dma(dma2s[dma1[ndev] % 4]);
 		if (dma2[ndev] < 0) {
-			snd_printk(KERN_WARNING "unable to find a free DMA2, full-duplex will not work\n");
+			dev_warn(pdev, "unable to find a free DMA2, full-duplex will not work\n");
 			dma2[ndev] = -1;
 		}
 	}
 	/* configure WSS IRQ... */
 	pos = array_find(irqs, irq[ndev]);
 	if (pos < 0) {
-		snd_printk(KERN_ERR "invalid IRQ %d\n", irq[ndev]);
+		dev_err(pdev, "invalid IRQ %d\n", irq[ndev]);
 		return -EINVAL;
 	}
 	val = irq_bits[pos] << 3;
 	/* ...and DMA... */
 	pos = array_find(dma1s, dma1[ndev]);
 	if (pos < 0) {
-		snd_printk(KERN_ERR "invalid DMA1 %d\n", dma1[ndev]);
+		dev_err(pdev, "invalid DMA1 %d\n", dma1[ndev]);
 		return -EINVAL;
 	}
 	val |= dma_bits[pos];
@@ -287,7 +287,7 @@ static int snd_cmi8328_probe(struct device *pdev, unsigned int ndev)
 	if (dma2[ndev] >= 0 && dma1[ndev] != dma2[ndev]) {
 		pos = array_find(dma2s[dma1[ndev]], dma2[ndev]);
 		if (pos < 0) {
-			snd_printk(KERN_ERR "invalid DMA2 %d\n", dma2[ndev]);
+			dev_err(pdev, "invalid DMA2 %d\n", dma2[ndev]);
 			return -EINVAL;
 		}
 		val |= 0x04; /* enable separate capture DMA */
@@ -320,47 +320,47 @@ static int snd_cmi8328_probe(struct device *pdev, unsigned int ndev)
 		return err;
 
 	if (snd_wss_timer(cmi->wss, 0) < 0)
-		snd_printk(KERN_WARNING "error initializing WSS timer\n");
+		dev_warn(pdev, "error initializing WSS timer\n");
 
 	if (mpuport[ndev] == SNDRV_AUTO_PORT) {
 		mpuport[ndev] = snd_legacy_find_free_ioport(mpu_ports, 2);
 		if (mpuport[ndev] < 0)
-			snd_printk(KERN_ERR "unable to find a free MPU401 port\n");
+			dev_err(pdev, "unable to find a free MPU401 port\n");
 	}
 	if (mpuirq[ndev] == SNDRV_AUTO_IRQ) {
 		mpuirq[ndev] = snd_legacy_find_free_irq(mpu_irqs);
 		if (mpuirq[ndev] < 0)
-			snd_printk(KERN_ERR "unable to find a free MPU401 IRQ\n");
+			dev_err(pdev, "unable to find a free MPU401 IRQ\n");
 	}
 	/* enable and configure MPU401 */
 	if (mpuport[ndev] > 0 && mpuirq[ndev] > 0) {
 		val = CFG2_MPU_ENABLE;
 		pos = array_find_l(mpu_ports, mpuport[ndev]);
 		if (pos < 0)
-			snd_printk(KERN_WARNING "invalid MPU401 port 0x%lx\n",
-								mpuport[ndev]);
+			dev_warn(pdev, "invalid MPU401 port 0x%lx\n",
+				 mpuport[ndev]);
 		else {
 			val |= mpu_port_bits[pos] << 5;
 			pos = array_find(mpu_irqs, mpuirq[ndev]);
 			if (pos < 0)
-				snd_printk(KERN_WARNING "invalid MPU401 IRQ %d\n",
-								mpuirq[ndev]);
+				dev_warn(pdev, "invalid MPU401 IRQ %d\n",
+					 mpuirq[ndev]);
 			else {
 				val |= mpu_irq_bits[pos] << 3;
 				snd_cmi8328_cfg_write(port, CFG2, val);
 				if (snd_mpu401_uart_new(card, 0,
 						MPU401_HW_MPU401, mpuport[ndev],
 						0, mpuirq[ndev], NULL) < 0)
-					snd_printk(KERN_ERR "error initializing MPU401\n");
+					dev_err(pdev, "error initializing MPU401\n");
 			}
 		}
 	}
 	/* OPL3 is hardwired to 0x388 and cannot be disabled */
 	if (snd_opl3_create(card, 0x388, 0x38a, OPL3_HW_AUTO, 0, &opl3) < 0)
-		snd_printk(KERN_ERR "error initializing OPL3\n");
+		dev_err(pdev, "error initializing OPL3\n");
 	else
 		if (snd_opl3_hwdep_new(opl3, 0, 1, NULL) < 0)
-			snd_printk(KERN_WARNING "error initializing OPL3 hwdep\n");
+			dev_warn(pdev, "error initializing OPL3 hwdep\n");
 
 	strcpy(card->driver, "CMI8328");
 	strcpy(card->shortname, "C-Media CMI8328");
@@ -378,7 +378,7 @@ static int snd_cmi8328_probe(struct device *pdev, unsigned int ndev)
 	/* gameport is hardwired to 0x200 */
 	res = devm_request_region(pdev, 0x200, 8, "CMI8328 gameport");
 	if (!res)
-		snd_printk(KERN_WARNING "unable to allocate gameport I/O port\n");
+		dev_warn(pdev, "unable to allocate gameport I/O port\n");
 	else {
 		struct gameport *gp = cmi->gameport = gameport_allocate_port();
 		if (cmi->gameport) {
-- 
2.43.0

