Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95803200134
	for <linux-sound@vger.kernel.org>; Wed,  7 Aug 2024 13:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723037670; cv=none; b=D+NTUGiTYbZhdRHAuCRF5BbRfzoRM1waRgyHU4oegXm5sMIUzBnLAXEL2wzc/ySpNprZvvgZZrje9BbZt1qeY+Nuq+a6l53tsRe097raVmy0tmovM2zNdy6Xv8bV8AFN6XZ3LsY1lRnR2g0h/GJacfJSybGk78m64Jd4zYHyWYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723037670; c=relaxed/simple;
	bh=PHi7x7SQ3p3H0SmjJOcnLfwuMnEaOS2rom0qPpmKf/o=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Oli1UphxTpiiV6Xx7BBP8DBl62/YQaVOBa8ocdLI0mdz1MN5cu/6HLdi16DEp44+a2rtpeZwaKFszR+8pcTq5XInbFW9//8/GtCRGZpRovT6RQBRBY7oZE7swHFppUAojy4J7epiQrxx2bPrpO2qaXn8VnXXPjASqxd8Swn/VzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=raaZMDcd; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=XTWBq9Fo; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=raaZMDcd; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=XTWBq9Fo; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="raaZMDcd";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="XTWBq9Fo";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="raaZMDcd";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="XTWBq9Fo"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 525541FB9D;
	Wed,  7 Aug 2024 13:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723037661; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Xu3u9NTVeI1aXCnYziypKQIXv+0K2ti5iNZmwYrc5ws=;
	b=raaZMDcdR/ljJpTw6lE5M9yJb7N8veqjtpmNGYY6Lx2RliJ4CdQxSgtwvXZ30CBIabFf35
	UKCgFndDPZ9Rk9quX5hGp+56c5Ufzj78wmKwxuXjkweGoTy0iD1wDbkB0BlzvhHwQioxiO
	LfpMhN5lXiYe8LKgX+nnqWGbXSblO0s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723037661;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Xu3u9NTVeI1aXCnYziypKQIXv+0K2ti5iNZmwYrc5ws=;
	b=XTWBq9Fo/8EtiKj0VnfoXk8YJ1OWjwYEDyAyXlRidKRaEZSoxtPGpBomcQeZuCENjbH2NQ
	mCIyDLZkFvJD/QDA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=raaZMDcd;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=XTWBq9Fo
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723037661; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Xu3u9NTVeI1aXCnYziypKQIXv+0K2ti5iNZmwYrc5ws=;
	b=raaZMDcdR/ljJpTw6lE5M9yJb7N8veqjtpmNGYY6Lx2RliJ4CdQxSgtwvXZ30CBIabFf35
	UKCgFndDPZ9Rk9quX5hGp+56c5Ufzj78wmKwxuXjkweGoTy0iD1wDbkB0BlzvhHwQioxiO
	LfpMhN5lXiYe8LKgX+nnqWGbXSblO0s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723037661;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Xu3u9NTVeI1aXCnYziypKQIXv+0K2ti5iNZmwYrc5ws=;
	b=XTWBq9Fo/8EtiKj0VnfoXk8YJ1OWjwYEDyAyXlRidKRaEZSoxtPGpBomcQeZuCENjbH2NQ
	mCIyDLZkFvJD/QDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3B30213B03;
	Wed,  7 Aug 2024 13:34:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ADRQDd13s2ZpVgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 07 Aug 2024 13:34:21 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 34/54] ALSA: sscape: Use standard print API
Date: Wed,  7 Aug 2024 15:34:24 +0200
Message-ID: <20240807133452.9424-35-tiwai@suse.de>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:dkim];
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
X-Rspamd-Queue-Id: 525541FB9D
X-Spam-Level: 
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -0.01

Use the standard print API with dev_*() instead of the old house-baked
one.  It gives better information and allows dynamically control of
debug prints.

The device pointer is stored in struct soundscape for calling
dev_*().

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/isa/sscape.c | 96 +++++++++++++++++++++++-----------------------
 1 file changed, 48 insertions(+), 48 deletions(-)

diff --git a/sound/isa/sscape.c b/sound/isa/sscape.c
index cc56fafd27b1..09120e38f4c2 100644
--- a/sound/isa/sscape.c
+++ b/sound/isa/sscape.c
@@ -138,6 +138,7 @@ struct soundscape {
 	struct snd_wss *chip;
 
 	unsigned char midi_vol;
+	struct device *dev;
 };
 
 #define INVALID_IRQ  ((unsigned)-1)
@@ -161,9 +162,9 @@ static struct snd_dma_buffer *get_dmabuf(struct soundscape *s,
 		if (snd_dma_alloc_pages_fallback(SNDRV_DMA_TYPE_DEV,
 						 s->chip->card->dev,
 						 size, buf) < 0) {
-			snd_printk(KERN_ERR "sscape: Failed to allocate "
-					    "%lu bytes for DMA\n",
-					    size);
+			dev_err(s->dev,
+				"sscape: Failed to allocate %lu bytes for DMA\n",
+				size);
 			return NULL;
 		}
 	}
@@ -463,8 +464,7 @@ static int upload_dma_data(struct soundscape *s, const unsigned char *data,
 			 */
 			spin_unlock_irqrestore(&s->lock, flags);
 
-			snd_printk(KERN_ERR
-					"sscape: DMA upload has timed out\n");
+			dev_err(s->dev, "sscape: DMA upload has timed out\n");
 			ret = -EAGAIN;
 			goto _release_dma;
 		}
@@ -487,12 +487,11 @@ static int upload_dma_data(struct soundscape *s, const unsigned char *data,
 	 */
 	ret = 0;
 	if (!obp_startup_ack(s, 5000)) {
-		snd_printk(KERN_ERR "sscape: No response "
-				    "from on-board processor after upload\n");
+		dev_err(s->dev,
+			"sscape: No response from on-board processor after upload\n");
 		ret = -EAGAIN;
 	} else if (!host_startup_ack(s, 5000)) {
-		snd_printk(KERN_ERR
-				"sscape: SoundScape failed to initialise\n");
+		dev_err(s->dev, "sscape: SoundScape failed to initialise\n");
 		ret = -EAGAIN;
 	}
 
@@ -521,7 +520,7 @@ static int sscape_upload_bootblock(struct snd_card *card)
 
 	ret = request_firmware(&init_fw, "scope.cod", card->dev);
 	if (ret < 0) {
-		snd_printk(KERN_ERR "sscape: Error loading scope.cod");
+		dev_err(card->dev, "sscape: Error loading scope.cod");
 		return ret;
 	}
 	ret = upload_dma_data(sscape, init_fw->data, init_fw->size);
@@ -539,8 +538,8 @@ static int sscape_upload_bootblock(struct snd_card *card)
 
 	data &= 0xf;
 	if (ret == 0 && data > 7) {
-		snd_printk(KERN_ERR
-				"sscape: timeout reading firmware version\n");
+		dev_err(card->dev,
+			"sscape: timeout reading firmware version\n");
 		ret = -EAGAIN;
 	}
 
@@ -561,14 +560,14 @@ static int sscape_upload_microcode(struct snd_card *card, int version)
 
 	err = request_firmware(&init_fw, name, card->dev);
 	if (err < 0) {
-		snd_printk(KERN_ERR "sscape: Error loading sndscape.co%d",
-				version);
+		dev_err(card->dev, "sscape: Error loading sndscape.co%d",
+			version);
 		return err;
 	}
 	err = upload_dma_data(sscape, init_fw->data, init_fw->size);
 	if (err == 0)
-		snd_printk(KERN_INFO "sscape: MIDI firmware loaded %zu KBs\n",
-				init_fw->size >> 10);
+		dev_info(card->dev, "sscape: MIDI firmware loaded %zu KBs\n",
+			 init_fw->size >> 10);
 
 	release_firmware(init_fw);
 
@@ -783,8 +782,8 @@ static int detect_sscape(struct soundscape *s, long wss_io)
 static int mpu401_open(struct snd_mpu401 *mpu)
 {
 	if (!verify_mpu401(mpu)) {
-		snd_printk(KERN_ERR "sscape: MIDI disabled, "
-				    "please load firmware\n");
+		dev_err(mpu->rmidi->card->dev,
+			"sscape: MIDI disabled, please load firmware\n");
 		return -ENODEV;
 	}
 
@@ -871,22 +870,22 @@ static int create_ad1845(struct snd_card *card, unsigned port,
 
 		err = snd_wss_pcm(chip, 0);
 		if (err < 0) {
-			snd_printk(KERN_ERR "sscape: No PCM device "
-					    "for AD1845 chip\n");
+			dev_err(card->dev,
+				"sscape: No PCM device for AD1845 chip\n");
 			goto _error;
 		}
 
 		err = snd_wss_mixer(chip);
 		if (err < 0) {
-			snd_printk(KERN_ERR "sscape: No mixer device "
-					    "for AD1845 chip\n");
+			dev_err(card->dev,
+				"sscape: No mixer device for AD1845 chip\n");
 			goto _error;
 		}
 		if (chip->hardware != WSS_HW_AD1848) {
 			err = snd_wss_timer(chip, 0);
 			if (err < 0) {
-				snd_printk(KERN_ERR "sscape: No timer device "
-						    "for AD1845 chip\n");
+				dev_err(card->dev,
+					"sscape: No timer device for AD1845 chip\n");
 				goto _error;
 			}
 		}
@@ -895,8 +894,8 @@ static int create_ad1845(struct snd_card *card, unsigned port,
 			err = snd_ctl_add(card,
 					  snd_ctl_new1(&midi_mixer_ctl, chip));
 			if (err < 0) {
-				snd_printk(KERN_ERR "sscape: Could not create "
-						    "MIDI mixer control\n");
+				dev_err(card->dev,
+					"sscape: Could not create MIDI mixer control\n");
 				goto _error;
 			}
 		}
@@ -932,8 +931,8 @@ static int create_sscape(int dev, struct snd_card *card)
 	 */
 	io_res = devm_request_region(card->dev, port[dev], 8, "SoundScape");
 	if (!io_res) {
-		snd_printk(KERN_ERR
-			   "sscape: can't grab port 0x%lx\n", port[dev]);
+		dev_err(card->dev,
+			"sscape: can't grab port 0x%lx\n", port[dev]);
 		return -EBUSY;
 	}
 	wss_res = NULL;
@@ -941,8 +940,8 @@ static int create_sscape(int dev, struct snd_card *card)
 		wss_res = devm_request_region(card->dev, wss_port[dev], 4,
 					      "SoundScape");
 		if (!wss_res) {
-			snd_printk(KERN_ERR "sscape: can't grab port 0x%lx\n",
-					    wss_port[dev]);
+			dev_err(card->dev, "sscape: can't grab port 0x%lx\n",
+				wss_port[dev]);
 			return -EBUSY;
 		}
 	}
@@ -952,7 +951,7 @@ static int create_sscape(int dev, struct snd_card *card)
 	 */
 	err = snd_devm_request_dma(card->dev, dma[dev], "SoundScape");
 	if (err < 0) {
-		snd_printk(KERN_ERR "sscape: can't grab DMA %d\n", dma[dev]);
+		dev_err(card->dev, "sscape: can't grab DMA %d\n", dma[dev]);
 		return err;
 	}
 
@@ -962,7 +961,7 @@ static int create_sscape(int dev, struct snd_card *card)
 	sscape->io_base = port[dev];
 
 	if (!detect_sscape(sscape, wss_port[dev])) {
-		printk(KERN_ERR "sscape: hardware not detected at 0x%x\n",
+		dev_err(card->dev, "sscape: hardware not detected at 0x%x\n",
 			sscape->io_base);
 		return -ENODEV;
 	}
@@ -985,21 +984,21 @@ static int create_sscape(int dev, struct snd_card *card)
 		break;
 	}
 
-	printk(KERN_INFO "sscape: %s card detected at 0x%x, using IRQ %d, DMA %d\n",
-			 name, sscape->io_base, irq[dev], dma[dev]);
+	dev_info(card->dev, "sscape: %s card detected at 0x%x, using IRQ %d, DMA %d\n",
+		 name, sscape->io_base, irq[dev], dma[dev]);
 
 	/*
 	 * Check that the user didn't pass us garbage data ...
 	 */
 	irq_cfg = get_irq_config(sscape->type, irq[dev]);
 	if (irq_cfg == INVALID_IRQ) {
-		snd_printk(KERN_ERR "sscape: Invalid IRQ %d\n", irq[dev]);
+		dev_err(card->dev, "sscape: Invalid IRQ %d\n", irq[dev]);
 		return -ENXIO;
 	}
 
 	mpu_irq_cfg = get_irq_config(sscape->type, mpu_irq[dev]);
 	if (mpu_irq_cfg == INVALID_IRQ) {
-		snd_printk(KERN_ERR "sscape: Invalid IRQ %d\n", mpu_irq[dev]);
+		dev_err(card->dev, "sscape: Invalid IRQ %d\n", mpu_irq[dev]);
 		return -ENXIO;
 	}
 
@@ -1043,9 +1042,9 @@ static int create_sscape(int dev, struct snd_card *card)
 	err = create_ad1845(card, wss_port[dev], irq[dev],
 			    dma[dev], dma2[dev]);
 	if (err < 0) {
-		snd_printk(KERN_ERR
-				"sscape: No AD1845 device at 0x%lx, IRQ %d\n",
-				wss_port[dev], irq[dev]);
+		dev_err(card->dev,
+			"sscape: No AD1845 device at 0x%lx, IRQ %d\n",
+			wss_port[dev], irq[dev]);
 		return err;
 	}
 	strcpy(card->driver, "SoundScape");
@@ -1065,9 +1064,9 @@ static int create_sscape(int dev, struct snd_card *card)
 			err = create_mpu401(card, MIDI_DEVNUM, port[dev],
 					    mpu_irq[dev]);
 			if (err < 0) {
-				snd_printk(KERN_ERR "sscape: Failed to create "
-						"MPU-401 device at 0x%lx\n",
-						port[dev]);
+				dev_err(card->dev,
+					"sscape: Failed to create MPU-401 device at 0x%lx\n",
+					port[dev]);
 				return err;
 			}
 
@@ -1110,9 +1109,8 @@ static int snd_sscape_match(struct device *pdev, unsigned int i)
 	if (irq[i] == SNDRV_AUTO_IRQ ||
 	    mpu_irq[i] == SNDRV_AUTO_IRQ ||
 	    dma[i] == SNDRV_AUTO_DMA) {
-		printk(KERN_INFO
-		       "sscape: insufficient parameters, "
-		       "need IO, IRQ, MPU-IRQ and DMA\n");
+		dev_info(pdev,
+			 "sscape: insufficient parameters, need IO, IRQ, MPU-IRQ and DMA\n");
 		return 0;
 	}
 
@@ -1131,6 +1129,7 @@ static int snd_sscape_probe(struct device *pdev, unsigned int dev)
 		return ret;
 
 	sscape = get_card_soundscape(card);
+	sscape->dev = pdev;
 	sscape->type = SSCAPE;
 
 	dma[dev] &= 0x03;
@@ -1141,7 +1140,7 @@ static int snd_sscape_probe(struct device *pdev, unsigned int dev)
 
 	ret = snd_card_register(card);
 	if (ret < 0) {
-		snd_printk(KERN_ERR "sscape: Failed to register sound card\n");
+		dev_err(pdev, "sscape: Failed to register sound card\n");
 		return ret;
 	}
 	dev_set_drvdata(pdev, card);
@@ -1194,7 +1193,7 @@ static int sscape_pnp_detect(struct pnp_card_link *pcard,
 
 	if (!pnp_is_active(dev)) {
 		if (pnp_activate_dev(dev) < 0) {
-			snd_printk(KERN_INFO "sscape: device is inactive\n");
+			dev_info(&dev->dev, "sscape: device is inactive\n");
 			return -EBUSY;
 		}
 	}
@@ -1210,6 +1209,7 @@ static int sscape_pnp_detect(struct pnp_card_link *pcard,
 		return ret;
 
 	sscape = get_card_soundscape(card);
+	sscape->dev = card->dev;
 
 	/*
 	 * Identify card model ...
@@ -1240,7 +1240,7 @@ static int sscape_pnp_detect(struct pnp_card_link *pcard,
 
 	ret = snd_card_register(card);
 	if (ret < 0) {
-		snd_printk(KERN_ERR "sscape: Failed to register sound card\n");
+		dev_err(card->dev, "sscape: Failed to register sound card\n");
 		return ret;
 	}
 
-- 
2.43.0

