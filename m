Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BB70200127
	for <linux-sound@vger.kernel.org>; Wed,  7 Aug 2024 13:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723037671; cv=none; b=SkKqWIIINpMEH1TDf+0DjSYs/VdIueMKg1fRsLI3t7grzrvzU6iSG3S+lmU9f2ajU+UsBZ3DpiBtJwoNWmxwwAL3b0EGG+CGKDYtN4oAWVuAWXVsY7oetgR58VySHbbxRDU36oeTKPTFNWz6/zFsRDO4rCPdk0Zx3lkxZJZTD6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723037671; c=relaxed/simple;
	bh=bB8sGncZ3iGkk+dWX2bPrlYNFlICxRyJ8wvtexDeFXQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dt7HAvOXeK/O9Mc4vllI5uibPArN62yKiwI2zm6OdBOzU7QNmf/pgWN3fZcWTs0RGsbq8CKBxjh5Ui4WXEo6ngD7U1ArLj5sUWRo3HIFVzgnwd9h6dLW/qabNdw8K3XhFpurTVR8pq23jWV3OYp0noPbZBT3CBNSSOJd+qR7EHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=kU2wC29r; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=tZBiwtTx; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=kU2wC29r; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=tZBiwtTx; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="kU2wC29r";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="tZBiwtTx";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="kU2wC29r";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="tZBiwtTx"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id BD9511F891;
	Wed,  7 Aug 2024 13:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723037660; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kHxbJn/mSS0cxDA9cwUg/7Y0zCs+CbaUr6QbtQk3iwc=;
	b=kU2wC29r1ot+QAYrQ0TvBL2gnjFEwGX93llHCQoPJkJeGAfKVPpxCLINhjxknYFShCfEGg
	OEcovg6KNYSrFEWf1u5WOpvZ8d2vLRGtnqYeti22UrCptmhSgSQkh18ieKU+2is85jBetL
	Zp7hUFvqUlhqJN+/UeFfjC7Ev1P+gac=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723037660;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kHxbJn/mSS0cxDA9cwUg/7Y0zCs+CbaUr6QbtQk3iwc=;
	b=tZBiwtTxEYPrqfk4cJ5ITDcgBkUgtjIpa8NI/txdxvWFb/qfBL1SIL6FkEqVSZiGQz+cPA
	Ppx62eOYMUhu9oBw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=kU2wC29r;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=tZBiwtTx
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723037660; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kHxbJn/mSS0cxDA9cwUg/7Y0zCs+CbaUr6QbtQk3iwc=;
	b=kU2wC29r1ot+QAYrQ0TvBL2gnjFEwGX93llHCQoPJkJeGAfKVPpxCLINhjxknYFShCfEGg
	OEcovg6KNYSrFEWf1u5WOpvZ8d2vLRGtnqYeti22UrCptmhSgSQkh18ieKU+2is85jBetL
	Zp7hUFvqUlhqJN+/UeFfjC7Ev1P+gac=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723037660;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kHxbJn/mSS0cxDA9cwUg/7Y0zCs+CbaUr6QbtQk3iwc=;
	b=tZBiwtTxEYPrqfk4cJ5ITDcgBkUgtjIpa8NI/txdxvWFb/qfBL1SIL6FkEqVSZiGQz+cPA
	Ppx62eOYMUhu9oBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A62E913B03;
	Wed,  7 Aug 2024 13:34:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id aBpqJ9x3s2ZpVgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 07 Aug 2024 13:34:20 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 30/54] ALSA: sb: Use standard print API
Date: Wed,  7 Aug 2024 15:34:20 +0200
Message-ID: <20240807133452.9424-31-tiwai@suse.de>
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
X-Rspamd-Queue-Id: BD9511F891
X-Spam-Level: 
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -0.01

Use the standard print API with dev_*() instead of the old house-baked
one.  It gives better information and allows dynamically control of
debug prints.

Some functions are changed to receive snd_card pointer for referring
to the device pointer for dev_*() calls, too.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/isa/sb/emu8000.c       | 11 ++++----
 sound/isa/sb/emu8000_patch.c |  1 -
 sound/isa/sb/emu8000_synth.c |  2 +-
 sound/isa/sb/jazz16.c        | 49 ++++++++++++++++++------------------
 sound/isa/sb/sb16.c          | 42 +++++++++++++++----------------
 sound/isa/sb/sb16_csp.c      | 38 ++++++++++++++++------------
 sound/isa/sb/sb16_main.c     | 13 +++++++---
 sound/isa/sb/sb8.c           | 12 ++++-----
 sound/isa/sb/sb_common.c     | 27 ++++++++++----------
 sound/isa/sb/sb_mixer.c      |  4 +--
 10 files changed, 105 insertions(+), 94 deletions(-)

diff --git a/sound/isa/sb/emu8000.c b/sound/isa/sb/emu8000.c
index af478c36ce5b..52884e6b9193 100644
--- a/sound/isa/sb/emu8000.c
+++ b/sound/isa/sb/emu8000.c
@@ -160,8 +160,8 @@ snd_emu8000_detect(struct snd_emu8000 *emu)
 	if ((EMU8000_HWCF2_READ(emu) & 0x0003) != 0x0003)
 		return -ENODEV;
 
-	snd_printdd("EMU8000 [0x%lx]: Synth chip found\n",
-                    emu->port1);
+	dev_dbg(emu->card->dev, "EMU8000 [0x%lx]: Synth chip found\n",
+		emu->port1);
 	return 0;
 }
 
@@ -652,7 +652,7 @@ snd_emu8000_load_chorus_fx(struct snd_emu8000 *emu, int mode, const void __user
 {
 	struct soundfont_chorus_fx rec;
 	if (mode < SNDRV_EMU8000_CHORUS_PREDEFINED || mode >= SNDRV_EMU8000_CHORUS_NUMBERS) {
-		snd_printk(KERN_WARNING "invalid chorus mode %d for uploading\n", mode);
+		dev_warn(emu->card->dev, "invalid chorus mode %d for uploading\n", mode);
 		return -EINVAL;
 	}
 	if (len < (long)sizeof(rec) || copy_from_user(&rec, buf, sizeof(rec)))
@@ -780,7 +780,7 @@ snd_emu8000_load_reverb_fx(struct snd_emu8000 *emu, int mode, const void __user
 	struct soundfont_reverb_fx rec;
 
 	if (mode < SNDRV_EMU8000_REVERB_PREDEFINED || mode >= SNDRV_EMU8000_REVERB_NUMBERS) {
-		snd_printk(KERN_WARNING "invalid reverb mode %d for uploading\n", mode);
+		dev_warn(emu->card->dev, "invalid reverb mode %d for uploading\n", mode);
 		return -EINVAL;
 	}
 	if (len < (long)sizeof(rec) || copy_from_user(&rec, buf, sizeof(rec)))
@@ -1072,7 +1072,8 @@ snd_emu8000_new(struct snd_card *card, int index, long port, int seq_ports,
 	if (!devm_request_region(card->dev, hw->port1, 4, "Emu8000-1") ||
 	    !devm_request_region(card->dev, hw->port2, 4, "Emu8000-2") ||
 	    !devm_request_region(card->dev, hw->port3, 4, "Emu8000-3")) {
-		snd_printk(KERN_ERR "sbawe: can't grab ports 0x%lx, 0x%lx, 0x%lx\n", hw->port1, hw->port2, hw->port3);
+		dev_err(card->dev, "sbawe: can't grab ports 0x%lx, 0x%lx, 0x%lx\n",
+			hw->port1, hw->port2, hw->port3);
 		return -EBUSY;
 	}
 	hw->mem_size = 0;
diff --git a/sound/isa/sb/emu8000_patch.c b/sound/isa/sb/emu8000_patch.c
index ab4f988f080d..d60174ec8b39 100644
--- a/sound/isa/sb/emu8000_patch.c
+++ b/sound/isa/sb/emu8000_patch.c
@@ -157,7 +157,6 @@ snd_emu8000_sample_new(struct snd_emux *rec, struct snd_sf_sample *sp,
 
 	sp->block = snd_util_mem_alloc(hdr, truesize * 2);
 	if (sp->block == NULL) {
-		/*snd_printd("EMU8000: out of memory\n");*/
 		/* not ENOMEM (for compatibility) */
 		return -ENOSPC;
 	}
diff --git a/sound/isa/sb/emu8000_synth.c b/sound/isa/sb/emu8000_synth.c
index 0edfb6875278..9bec85ec55b4 100644
--- a/sound/isa/sb/emu8000_synth.c
+++ b/sound/isa/sb/emu8000_synth.c
@@ -45,7 +45,7 @@ static int snd_emu8000_probe(struct device *_dev)
 	emu->num_ports = hw->seq_ports;
 
 	if (hw->memhdr) {
-		snd_printk(KERN_ERR "memhdr is already initialized!?\n");
+		dev_err(hw->card->dev, "memhdr is already initialized!?\n");
 		snd_util_memhdr_free(hw->memhdr);
 	}
 	hw->memhdr = snd_util_memhdr_new(hw->mem_size);
diff --git a/sound/isa/sb/jazz16.c b/sound/isa/sb/jazz16.c
index 64936c917170..b28490973892 100644
--- a/sound/isa/sb/jazz16.c
+++ b/sound/isa/sb/jazz16.c
@@ -75,13 +75,14 @@ static irqreturn_t jazz16_interrupt(int irq, void *chip)
 	return snd_sb8dsp_interrupt(chip);
 }
 
-static int jazz16_configure_ports(unsigned long port,
+static int jazz16_configure_ports(struct snd_card *card,
+				  unsigned long port,
 				  unsigned long mpu_port, int idx)
 {
 	unsigned char val;
 
 	if (!request_region(0x201, 1, "jazz16 config")) {
-		snd_printk(KERN_ERR "config port region is already in use.\n");
+		dev_err(card->dev, "config port region is already in use.\n");
 		return -EBUSY;
 	}
 	outb(SB_JAZZ16_WAKEUP - idx, 0x201);
@@ -96,15 +97,15 @@ static int jazz16_configure_ports(unsigned long port,
 	return 0;
 }
 
-static int jazz16_detect_board(unsigned long port,
+static int jazz16_detect_board(struct snd_card *card, unsigned long port,
 			       unsigned long mpu_port)
 {
 	int err;
 	int val;
-	struct snd_sb chip;
+	struct snd_sb chip = {};
 
 	if (!request_region(port, 0x10, "jazz16")) {
-		snd_printk(KERN_ERR "I/O port region is already in use.\n");
+		dev_err(card->dev, "I/O port region is already in use.\n");
 		return -EBUSY;
 	}
 	/* just to call snd_sbdsp_command/reset/get_byte() */
@@ -113,7 +114,7 @@ static int jazz16_detect_board(unsigned long port,
 	err = snd_sbdsp_reset(&chip);
 	if (err < 0)
 		for (val = 0; val < 4; val++) {
-			err = jazz16_configure_ports(port, mpu_port, val);
+			err = jazz16_configure_ports(card, port, mpu_port, val);
 			if (err < 0)
 				break;
 
@@ -143,8 +144,8 @@ static int jazz16_detect_board(unsigned long port,
 	}
 	snd_sbdsp_get_byte(&chip);
 	err = snd_sbdsp_get_byte(&chip);
-	snd_printd("Media Vision Jazz16 board detected: rev 0x%x, model 0x%x\n",
-		   val, err);
+	dev_dbg(card->dev, "Media Vision Jazz16 board detected: rev 0x%x, model 0x%x\n",
+		val, err);
 
 	err = 0;
 
@@ -185,31 +186,31 @@ static int snd_jazz16_match(struct device *devptr, unsigned int dev)
 	if (!enable[dev])
 		return 0;
 	if (port[dev] == SNDRV_AUTO_PORT) {
-		snd_printk(KERN_ERR "please specify port\n");
+		dev_err(devptr, "please specify port\n");
 		return 0;
 	} else if (port[dev] == 0x200 || (port[dev] & ~0x270)) {
-		snd_printk(KERN_ERR "incorrect port specified\n");
+		dev_err(devptr, "incorrect port specified\n");
 		return 0;
 	}
 	if (dma8[dev] != SNDRV_AUTO_DMA &&
 	    dma8[dev] != 1 && dma8[dev] != 3) {
-		snd_printk(KERN_ERR "dma8 must be 1 or 3\n");
+		dev_err(devptr, "dma8 must be 1 or 3\n");
 		return 0;
 	}
 	if (dma16[dev] != SNDRV_AUTO_DMA &&
 	    dma16[dev] != 5 && dma16[dev] != 7) {
-		snd_printk(KERN_ERR "dma16 must be 5 or 7\n");
+		dev_err(devptr, "dma16 must be 5 or 7\n");
 		return 0;
 	}
 	if (mpu_port[dev] != SNDRV_AUTO_PORT &&
 	    (mpu_port[dev] & ~0x030) != 0x300) {
-		snd_printk(KERN_ERR "incorrect mpu_port specified\n");
+		dev_err(devptr, "incorrect mpu_port specified\n");
 		return 0;
 	}
 	if (mpu_irq[dev] != SNDRV_AUTO_DMA &&
 	    mpu_irq[dev] != 2 && mpu_irq[dev] != 3 &&
 	    mpu_irq[dev] != 5 && mpu_irq[dev] != 7) {
-		snd_printk(KERN_ERR "mpu_irq must be 2, 3, 5 or 7\n");
+		dev_err(devptr, "mpu_irq must be 2, 3, 5 or 7\n");
 		return 0;
 	}
 	return 1;
@@ -237,7 +238,7 @@ static int snd_jazz16_probe(struct device *devptr, unsigned int dev)
 	if (xirq == SNDRV_AUTO_IRQ) {
 		xirq = snd_legacy_find_free_irq(possible_irqs);
 		if (xirq < 0) {
-			snd_printk(KERN_ERR "unable to find a free IRQ\n");
+			dev_err(devptr, "unable to find a free IRQ\n");
 			return -EBUSY;
 		}
 	}
@@ -245,7 +246,7 @@ static int snd_jazz16_probe(struct device *devptr, unsigned int dev)
 	if (xdma8 == SNDRV_AUTO_DMA) {
 		xdma8 = snd_legacy_find_free_dma(possible_dmas8);
 		if (xdma8 < 0) {
-			snd_printk(KERN_ERR "unable to find a free DMA8\n");
+			dev_err(devptr, "unable to find a free DMA8\n");
 			return -EBUSY;
 		}
 	}
@@ -253,7 +254,7 @@ static int snd_jazz16_probe(struct device *devptr, unsigned int dev)
 	if (xdma16 == SNDRV_AUTO_DMA) {
 		xdma16 = snd_legacy_find_free_dma(possible_dmas16);
 		if (xdma16 < 0) {
-			snd_printk(KERN_ERR "unable to find a free DMA16\n");
+			dev_err(devptr, "unable to find a free DMA16\n");
 			return -EBUSY;
 		}
 	}
@@ -261,9 +262,9 @@ static int snd_jazz16_probe(struct device *devptr, unsigned int dev)
 	xmpu_port = mpu_port[dev];
 	if (xmpu_port == SNDRV_AUTO_PORT)
 		xmpu_port = 0;
-	err = jazz16_detect_board(port[dev], xmpu_port);
+	err = jazz16_detect_board(card, port[dev], xmpu_port);
 	if (err < 0) {
-		printk(KERN_ERR "Media Vision Jazz16 board not detected\n");
+		dev_err(devptr, "Media Vision Jazz16 board not detected\n");
 		return err;
 	}
 	err = snd_sbdsp_create(card, port[dev], irq[dev],
@@ -279,7 +280,7 @@ static int snd_jazz16_probe(struct device *devptr, unsigned int dev)
 		xmpu_irq = 0;
 	err = jazz16_configure_board(chip, xmpu_irq);
 	if (err < 0) {
-		printk(KERN_ERR "Media Vision Jazz16 configuration failed\n");
+		dev_err(devptr, "Media Vision Jazz16 configuration failed\n");
 		return err;
 	}
 
@@ -301,8 +302,8 @@ static int snd_jazz16_probe(struct device *devptr, unsigned int dev)
 	err = snd_opl3_create(card, chip->port, chip->port + 2,
 			      OPL3_HW_AUTO, 1, &opl3);
 	if (err < 0)
-		snd_printk(KERN_WARNING "no OPL device at 0x%lx-0x%lx\n",
-			   chip->port, chip->port + 2);
+		dev_warn(devptr, "no OPL device at 0x%lx-0x%lx\n",
+			 chip->port, chip->port + 2);
 	else {
 		err = snd_opl3_hwdep_new(opl3, 0, 1, NULL);
 		if (err < 0)
@@ -317,8 +318,8 @@ static int snd_jazz16_probe(struct device *devptr, unsigned int dev)
 					mpu_port[dev], 0,
 					mpu_irq[dev],
 					NULL) < 0)
-			snd_printk(KERN_ERR "no MPU-401 device at 0x%lx\n",
-					mpu_port[dev]);
+			dev_err(devptr, "no MPU-401 device at 0x%lx\n",
+				mpu_port[dev]);
 	}
 
 	err = snd_card_register(card);
diff --git a/sound/isa/sb/sb16.c b/sound/isa/sb/sb16.c
index e89b095aa282..2f7505ad855c 100644
--- a/sound/isa/sb/sb16.c
+++ b/sound/isa/sb/sb16.c
@@ -21,12 +21,6 @@
 #define SNDRV_LEGACY_FIND_FREE_DMA
 #include <sound/initval.h>
 
-#ifdef SNDRV_SBAWE
-#define PFX "sbawe: "
-#else
-#define PFX "sb16: "
-#endif
-
 MODULE_AUTHOR("Jaroslav Kysela <perex@perex.cz>");
 MODULE_LICENSE("GPL");
 #ifndef SNDRV_SBAWE
@@ -246,7 +240,7 @@ static int snd_card_sb16_pnp(int dev, struct snd_card_sb16 *acard,
 
 	err = pnp_activate_dev(pdev); 
 	if (err < 0) { 
-		snd_printk(KERN_ERR PFX "AUDIO pnp configure failure\n"); 
+		dev_err(&pdev->dev, "AUDIO pnp configure failure\n");
 		return err; 
 	} 
 	port[dev] = pnp_port_start(pdev, 0);
@@ -255,10 +249,10 @@ static int snd_card_sb16_pnp(int dev, struct snd_card_sb16 *acard,
 	dma8[dev] = pnp_dma(pdev, 0);
 	dma16[dev] = pnp_dma(pdev, 1);
 	irq[dev] = pnp_irq(pdev, 0);
-	snd_printdd("pnp SB16: port=0x%lx, mpu port=0x%lx, fm port=0x%lx\n",
-			port[dev], mpu_port[dev], fm_port[dev]);
-	snd_printdd("pnp SB16: dma1=%i, dma2=%i, irq=%i\n",
-			dma8[dev], dma16[dev], irq[dev]);
+	dev_dbg(&pdev->dev, "pnp SB16: port=0x%lx, mpu port=0x%lx, fm port=0x%lx\n",
+		port[dev], mpu_port[dev], fm_port[dev]);
+	dev_dbg(&pdev->dev, "pnp SB16: dma1=%i, dma2=%i, irq=%i\n",
+		dma8[dev], dma16[dev], irq[dev]);
 #ifdef SNDRV_SBAWE_EMU8000
 	/* WaveTable initialization */
 	pdev = acard->devwt;
@@ -268,13 +262,13 @@ static int snd_card_sb16_pnp(int dev, struct snd_card_sb16 *acard,
 			goto __wt_error; 
 		} 
 		awe_port[dev] = pnp_port_start(pdev, 0);
-		snd_printdd("pnp SB16: wavetable port=0x%llx\n",
-				(unsigned long long)pnp_port_start(pdev, 0));
+		dev_dbg(&pdev->dev, "pnp SB16: wavetable port=0x%llx\n",
+			(unsigned long long)pnp_port_start(pdev, 0));
 	} else {
 __wt_error:
 		if (pdev) {
 			pnp_release_card_device(pdev);
-			snd_printk(KERN_ERR PFX "WaveTable pnp configure failure\n");
+			dev_err(&pdev->dev, "WaveTable pnp configure failure\n");
 		}
 		acard->devwt = NULL;
 		awe_port[dev] = -1;
@@ -329,7 +323,7 @@ static int snd_sb16_probe(struct snd_card *card, int dev)
 
 	acard->chip = chip;
 	if (chip->hardware != SB_HW_16) {
-		snd_printk(KERN_ERR PFX "SB 16 chip was not detected at 0x%lx\n", port[dev]);
+		dev_err(card->dev, "SB 16 chip was not detected at 0x%lx\n", port[dev]);
 		return -ENODEV;
 	}
 	chip->mpu_port = mpu_port[dev];
@@ -379,8 +373,8 @@ static int snd_sb16_probe(struct snd_card *card, int dev)
 				    OPL3_HW_OPL3,
 				    acard->fm_res != NULL || fm_port[dev] == port[dev],
 				    &opl3) < 0) {
-			snd_printk(KERN_ERR PFX "no OPL device at 0x%lx-0x%lx\n",
-				   fm_port[dev], fm_port[dev] + 2);
+			dev_err(card->dev, "no OPL device at 0x%lx-0x%lx\n",
+				fm_port[dev], fm_port[dev] + 2);
 		} else {
 #ifdef SNDRV_SBAWE_EMU8000
 			int seqdev = awe_port[dev] > 0 ? 2 : 1;
@@ -405,7 +399,9 @@ static int snd_sb16_probe(struct snd_card *card, int dev)
 			chip->csp = xcsp->private_data;
 			chip->hardware = SB_HW_16CSP;
 		} else {
-			snd_printk(KERN_INFO PFX "warning - CSP chip not detected on soundcard #%i\n", dev + 1);
+			dev_info(card->dev,
+				 "warning - CSP chip not detected on soundcard #%i\n",
+				 dev + 1);
 		}
 	}
 #endif
@@ -414,7 +410,9 @@ static int snd_sb16_probe(struct snd_card *card, int dev)
 		err = snd_emu8000_new(card, 1, awe_port[dev],
 				      seq_ports[dev], NULL);
 		if (err < 0) {
-			snd_printk(KERN_ERR PFX "fatal error - EMU-8000 synthesizer not detected at 0x%lx\n", awe_port[dev]);
+			dev_err(card->dev,
+				"fatal error - EMU-8000 synthesizer not detected at 0x%lx\n",
+				awe_port[dev]);
 
 			return err;
 		}
@@ -502,21 +500,21 @@ static int snd_sb16_isa_probe(struct device *pdev, unsigned int dev)
 	if (irq[dev] == SNDRV_AUTO_IRQ) {
 		irq[dev] = snd_legacy_find_free_irq(possible_irqs);
 		if (irq[dev] < 0) {
-			snd_printk(KERN_ERR PFX "unable to find a free IRQ\n");
+			dev_err(pdev, "unable to find a free IRQ\n");
 			return -EBUSY;
 		}
 	}
 	if (dma8[dev] == SNDRV_AUTO_DMA) {
 		dma8[dev] = snd_legacy_find_free_dma(possible_dmas8);
 		if (dma8[dev] < 0) {
-			snd_printk(KERN_ERR PFX "unable to find a free 8-bit DMA\n");
+			dev_err(pdev, "unable to find a free 8-bit DMA\n");
 			return -EBUSY;
 		}
 	}
 	if (dma16[dev] == SNDRV_AUTO_DMA) {
 		dma16[dev] = snd_legacy_find_free_dma(possible_dmas16);
 		if (dma16[dev] < 0) {
-			snd_printk(KERN_ERR PFX "unable to find a free 16-bit DMA\n");
+			dev_err(pdev, "unable to find a free 16-bit DMA\n");
 			return -EBUSY;
 		}
 	}
diff --git a/sound/isa/sb/sb16_csp.c b/sound/isa/sb/sb16_csp.c
index fdb992733bde..071ba85f76bb 100644
--- a/sound/isa/sb/sb16_csp.c
+++ b/sound/isa/sb/sb16_csp.c
@@ -296,6 +296,7 @@ static int snd_sb_csp_riff_load(struct snd_sb_csp * p,
 				struct snd_sb_csp_microcode __user * mcode)
 {
 	struct snd_sb_csp_mc_header info;
+	struct device *dev = p->chip->card->dev;
 
 	unsigned char __user *data_ptr;
 	unsigned char __user *data_end;
@@ -316,7 +317,7 @@ static int snd_sb_csp_riff_load(struct snd_sb_csp * p,
 		return -EFAULT;
 	if ((le32_to_cpu(file_h.name) != RIFF_HEADER) ||
 	    (le32_to_cpu(file_h.len) >= SNDRV_SB_CSP_MAX_MICROCODE_FILE_SIZE - sizeof(file_h))) {
-		snd_printd("%s: Invalid RIFF header\n", __func__);
+		dev_dbg(dev, "%s: Invalid RIFF header\n", __func__);
 		return -EINVAL;
 	}
 	data_ptr += sizeof(file_h);
@@ -325,7 +326,7 @@ static int snd_sb_csp_riff_load(struct snd_sb_csp * p,
 	if (copy_from_user(&item_type, data_ptr, sizeof(item_type)))
 		return -EFAULT;
 	if (le32_to_cpu(item_type) != CSP__HEADER) {
-		snd_printd("%s: Invalid RIFF file type\n", __func__);
+		dev_dbg(dev, "%s: Invalid RIFF file type\n", __func__);
 		return -EINVAL;
 	}
 	data_ptr += sizeof (item_type);
@@ -380,7 +381,7 @@ static int snd_sb_csp_riff_load(struct snd_sb_csp * p,
 				return -EFAULT;
 
 			if (le32_to_cpu(code_h.name) != MAIN_HEADER) {
-				snd_printd("%s: Missing 'main' microcode\n", __func__);
+				dev_dbg(dev, "%s: Missing 'main' microcode\n", __func__);
 				return -EINVAL;
 			}
 			data_ptr += sizeof(code_h);
@@ -423,9 +424,9 @@ static int snd_sb_csp_riff_load(struct snd_sb_csp * p,
 			default:	/* other codecs are unsupported */
 				p->acc_format = p->acc_width = p->acc_rates = 0;
 				p->mode = 0;
-				snd_printd("%s: Unsupported CSP codec type: 0x%04x\n",
-					   __func__,
-					   le16_to_cpu(funcdesc_h.VOC_type));
+				dev_dbg(dev, "%s: Unsupported CSP codec type: 0x%04x\n",
+					__func__,
+					le16_to_cpu(funcdesc_h.VOC_type));
 				return -EINVAL;
 			}
 			p->acc_channels = le16_to_cpu(funcdesc_h.flags_stereo_mono);
@@ -443,7 +444,7 @@ static int snd_sb_csp_riff_load(struct snd_sb_csp * p,
 			return 0;
 		}
 	}
-	snd_printd("%s: Function #%d not found\n", __func__, info.func_req);
+	dev_dbg(dev, "%s: Function #%d not found\n", __func__, info.func_req);
 	return -EINVAL;
 }
 
@@ -597,7 +598,9 @@ static int get_version(struct snd_sb *chip)
 static int snd_sb_csp_check_version(struct snd_sb_csp * p)
 {
 	if (p->version < 0x10 || p->version > 0x1f) {
-		snd_printd("%s: Invalid CSP version: 0x%x\n", __func__, p->version);
+		dev_dbg(p->chip->card->dev,
+			"%s: Invalid CSP version: 0x%x\n",
+			__func__, p->version);
 		return 1;
 	}
 	return 0;
@@ -616,7 +619,7 @@ static int snd_sb_csp_load(struct snd_sb_csp * p, const unsigned char *buf, int
 	spin_lock_irqsave(&p->chip->reg_lock, flags);
 	snd_sbdsp_command(p->chip, 0x01);	/* CSP download command */
 	if (snd_sbdsp_get_byte(p->chip)) {
-		snd_printd("%s: Download command failed\n", __func__);
+		dev_dbg(p->chip->card->dev, "%s: Download command failed\n", __func__);
 		goto __fail;
 	}
 	/* Send CSP low byte (size - 1) */
@@ -643,7 +646,9 @@ static int snd_sb_csp_load(struct snd_sb_csp * p, const unsigned char *buf, int
 			udelay (10);
 		}
 		if (status != 0x55) {
-			snd_printd("%s: Microcode initialization failed\n", __func__);
+			dev_dbg(p->chip->card->dev,
+				"%s: Microcode initialization failed\n",
+				__func__);
 			goto __fail;
 		}
 	} else {
@@ -788,25 +793,26 @@ static int snd_sb_csp_autoload(struct snd_sb_csp * p, snd_pcm_format_t pcm_sfmt,
  */
 static int snd_sb_csp_start(struct snd_sb_csp * p, int sample_width, int channels)
 {
+	struct device *dev = p->chip->card->dev;
 	unsigned char s_type;	/* sample type */
 	unsigned char mixL, mixR;
 	int result = -EIO;
 	unsigned long flags;
 
 	if (!(p->running & (SNDRV_SB_CSP_ST_LOADED | SNDRV_SB_CSP_ST_AUTO))) {
-		snd_printd("%s: Microcode not loaded\n", __func__);
+		dev_dbg(dev, "%s: Microcode not loaded\n", __func__);
 		return -ENXIO;
 	}
 	if (p->running & SNDRV_SB_CSP_ST_RUNNING) {
-		snd_printd("%s: CSP already running\n", __func__);
+		dev_dbg(dev, "%s: CSP already running\n", __func__);
 		return -EBUSY;
 	}
 	if (!(sample_width & p->acc_width)) {
-		snd_printd("%s: Unsupported PCM sample width\n", __func__);
+		dev_dbg(dev, "%s: Unsupported PCM sample width\n", __func__);
 		return -EINVAL;
 	}
 	if (!(channels & p->acc_channels)) {
-		snd_printd("%s: Invalid number of channels\n", __func__);
+		dev_dbg(dev, "%s: Invalid number of channels\n", __func__);
 		return -EINVAL;
 	}
 
@@ -829,11 +835,11 @@ static int snd_sb_csp_start(struct snd_sb_csp * p, int sample_width, int channel
 		s_type |= 0x22;	/* 00dX 00dX    (d = 1 if 8 bit samples) */
 
 	if (set_codec_parameter(p->chip, 0x81, s_type)) {
-		snd_printd("%s: Set sample type command failed\n", __func__);
+		dev_dbg(dev, "%s: Set sample type command failed\n", __func__);
 		goto __fail;
 	}
 	if (set_codec_parameter(p->chip, 0x80, 0x00)) {
-		snd_printd("%s: Codec start command failed\n", __func__);
+		dev_dbg(dev, "%s: Codec start command failed\n", __func__);
 		goto __fail;
 	}
 	p->run_width = sample_width;
diff --git a/sound/isa/sb/sb16_main.c b/sound/isa/sb/sb16_main.c
index a9b87e159b2d..74db11525003 100644
--- a/sound/isa/sb/sb16_main.c
+++ b/sound/isa/sb/sb16_main.c
@@ -733,7 +733,6 @@ int snd_sb16dsp_configure(struct snd_sb * chip)
 	unsigned char realirq, realdma, realmpureg;
 	/* note: mpu register should be present only on SB16 Vibra soundcards */
 
-	// printk(KERN_DEBUG "codec->irq=%i, codec->dma8=%i, codec->dma16=%i\n", chip->irq, chip->dma8, chip->dma16);
 	spin_lock_irqsave(&chip->mixer_lock, flags);
 	mpureg = snd_sbmixer_read(chip, SB_DSP4_MPUSETUP) & ~0x06;
 	spin_unlock_irqrestore(&chip->mixer_lock, flags);
@@ -807,9 +806,15 @@ int snd_sb16dsp_configure(struct snd_sb * chip)
 
 	spin_unlock_irqrestore(&chip->mixer_lock, flags);
 	if ((~realirq) & irqreg || (~realdma) & dmareg) {
-		snd_printk(KERN_ERR "SB16 [0x%lx]: unable to set DMA & IRQ (PnP device?)\n", chip->port);
-		snd_printk(KERN_ERR "SB16 [0x%lx]: wanted: irqreg=0x%x, dmareg=0x%x, mpureg = 0x%x\n", chip->port, realirq, realdma, realmpureg);
-		snd_printk(KERN_ERR "SB16 [0x%lx]:    got: irqreg=0x%x, dmareg=0x%x, mpureg = 0x%x\n", chip->port, irqreg, dmareg, mpureg);
+		dev_err(chip->card->dev,
+			"SB16 [0x%lx]: unable to set DMA & IRQ (PnP device?)\n",
+			chip->port);
+		dev_err(chip->card->dev,
+			"SB16 [0x%lx]: wanted: irqreg=0x%x, dmareg=0x%x, mpureg = 0x%x\n",
+			chip->port, realirq, realdma, realmpureg);
+		dev_err(chip->card->dev,
+			"SB16 [0x%lx]:    got: irqreg=0x%x, dmareg=0x%x, mpureg = 0x%x\n",
+			chip->port, irqreg, dmareg, mpureg);
 		return -ENODEV;
 	}
 	return 0;
diff --git a/sound/isa/sb/sb8.c b/sound/isa/sb/sb8.c
index e5ef1777161f..8726778c815e 100644
--- a/sound/isa/sb/sb8.c
+++ b/sound/isa/sb/sb8.c
@@ -123,11 +123,11 @@ static int snd_sb8_probe(struct device *pdev, unsigned int dev)
 			
 	if (chip->hardware >= SB_HW_16) {
 		if (chip->hardware == SB_HW_ALS100)
-			snd_printk(KERN_WARNING "ALS100 chip detected at 0x%lx, try snd-als100 module\n",
-				    port[dev]);
+			dev_warn(pdev, "ALS100 chip detected at 0x%lx, try snd-als100 module\n",
+				 port[dev]);
 		else
-			snd_printk(KERN_WARNING "SB 16 chip detected at 0x%lx, try snd-sb16 module\n",
-				   port[dev]);
+			dev_warn(pdev, "SB 16 chip detected at 0x%lx, try snd-sb16 module\n",
+				 port[dev]);
 		return -ENODEV;
 	}
 
@@ -143,12 +143,12 @@ static int snd_sb8_probe(struct device *pdev, unsigned int dev)
 		err = snd_opl3_create(card, chip->port + 8, 0,
 				      OPL3_HW_AUTO, 1, &opl3);
 		if (err < 0)
-			snd_printk(KERN_WARNING "sb8: no OPL device at 0x%lx\n", chip->port + 8);
+			dev_warn(pdev, "sb8: no OPL device at 0x%lx\n", chip->port + 8);
 	} else {
 		err = snd_opl3_create(card, chip->port, chip->port + 2,
 				      OPL3_HW_AUTO, 1, &opl3);
 		if (err < 0) {
-			snd_printk(KERN_WARNING "sb8: no OPL device at 0x%lx-0x%lx\n",
+			dev_warn(pdev, "sb8: no OPL device at 0x%lx-0x%lx\n",
 				   chip->port, chip->port + 2);
 		}
 	}
diff --git a/sound/isa/sb/sb_common.c b/sound/isa/sb/sb_common.c
index c0e319d14210..a4d5bf3d145f 100644
--- a/sound/isa/sb/sb_common.c
+++ b/sound/isa/sb/sb_common.c
@@ -31,14 +31,14 @@ int snd_sbdsp_command(struct snd_sb *chip, unsigned char val)
 {
 	int i;
 #ifdef IO_DEBUG
-	snd_printk(KERN_DEBUG "command 0x%x\n", val);
+	dev_dbg(chip->card->dev, "command 0x%x\n", val);
 #endif
 	for (i = BUSY_LOOPS; i; i--)
 		if ((inb(SBP(chip, STATUS)) & 0x80) == 0) {
 			outb(val, SBP(chip, COMMAND));
 			return 1;
 		}
-	snd_printd("%s [0x%lx]: timeout (0x%x)\n", __func__, chip->port, val);
+	dev_dbg(chip->card->dev, "%s [0x%lx]: timeout (0x%x)\n", __func__, chip->port, val);
 	return 0;
 }
 
@@ -50,12 +50,12 @@ int snd_sbdsp_get_byte(struct snd_sb *chip)
 		if (inb(SBP(chip, DATA_AVAIL)) & 0x80) {
 			val = inb(SBP(chip, READ));
 #ifdef IO_DEBUG
-			snd_printk(KERN_DEBUG "get_byte 0x%x\n", val);
+			dev_dbg(chip->card->dev, "get_byte 0x%x\n", val);
 #endif
 			return val;
 		}
 	}
-	snd_printd("%s [0x%lx]: timeout\n", __func__, chip->port);
+	dev_dbg(chip->card->dev, "%s [0x%lx]: timeout\n", __func__, chip->port);
 	return -ENODEV;
 }
 
@@ -74,7 +74,8 @@ int snd_sbdsp_reset(struct snd_sb *chip)
 			else
 				break;
 		}
-	snd_printdd("%s [0x%lx] failed...\n", __func__, chip->port);
+	if (chip->card)
+		dev_dbg(chip->card->dev, "%s [0x%lx] failed...\n", __func__, chip->port);
 	return -ENODEV;
 }
 
@@ -112,8 +113,8 @@ static int snd_sbdsp_probe(struct snd_sb * chip)
 	spin_unlock_irqrestore(&chip->reg_lock, flags);
 	major = version >> 8;
 	minor = version & 0xff;
-	snd_printdd("SB [0x%lx]: DSP chip found, version = %i.%i\n",
-		    chip->port, major, minor);
+	dev_dbg(chip->card->dev, "SB [0x%lx]: DSP chip found, version = %i.%i\n",
+		chip->port, major, minor);
 
 	switch (chip->hardware) {
 	case SB_HW_AUTO:
@@ -140,8 +141,8 @@ static int snd_sbdsp_probe(struct snd_sb * chip)
 			str = "16";
 			break;
 		default:
-			snd_printk(KERN_INFO "SB [0x%lx]: unknown DSP chip version %i.%i\n",
-				   chip->port, major, minor);
+			dev_info(chip->card->dev, "SB [0x%lx]: unknown DSP chip version %i.%i\n",
+				 chip->port, major, minor);
 			return -ENODEV;
 		}
 		break;
@@ -200,7 +201,7 @@ int snd_sbdsp_create(struct snd_card *card,
 			      hardware == SB_HW_CS5530) ?
 			     IRQF_SHARED : 0,
 			     "SoundBlaster", (void *) chip)) {
-		snd_printk(KERN_ERR "sb: can't grab irq %d\n", irq);
+		dev_err(card->dev, "sb: can't grab irq %d\n", irq);
 		return -EBUSY;
 	}
 	chip->irq = irq;
@@ -212,14 +213,14 @@ int snd_sbdsp_create(struct snd_card *card,
 	chip->res_port = devm_request_region(card->dev, port, 16,
 					     "SoundBlaster");
 	if (!chip->res_port) {
-		snd_printk(KERN_ERR "sb: can't grab port 0x%lx\n", port);
+		dev_err(card->dev, "sb: can't grab port 0x%lx\n", port);
 		return -EBUSY;
 	}
 
 #ifdef CONFIG_ISA
 	if (dma8 >= 0 && snd_devm_request_dma(card->dev, dma8,
 					      "SoundBlaster - 8bit")) {
-		snd_printk(KERN_ERR "sb: can't grab DMA8 %d\n", dma8);
+		dev_err(card->dev, "sb: can't grab DMA8 %d\n", dma8);
 		return -EBUSY;
 	}
 	chip->dma8 = dma8;
@@ -229,7 +230,7 @@ int snd_sbdsp_create(struct snd_card *card,
 			dma16 = -1;
 		} else if (snd_devm_request_dma(card->dev, dma16,
 						"SoundBlaster - 16bit")) {
-			snd_printk(KERN_ERR "sb: can't grab DMA16 %d\n", dma16);
+			dev_err(card->dev, "sb: can't grab DMA16 %d\n", dma16);
 			return -EBUSY;
 		}
 	}
diff --git a/sound/isa/sb/sb_mixer.c b/sound/isa/sb/sb_mixer.c
index fffd681e5bf7..9d23b7a4570b 100644
--- a/sound/isa/sb/sb_mixer.c
+++ b/sound/isa/sb/sb_mixer.c
@@ -20,7 +20,7 @@ void snd_sbmixer_write(struct snd_sb *chip, unsigned char reg, unsigned char dat
 	outb(data, SBP(chip, MIXER_DATA));
 	udelay(10);
 #ifdef IO_DEBUG
-	snd_printk(KERN_DEBUG "mixer_write 0x%x 0x%x\n", reg, data);
+	dev_dbg(chip->card->dev, "mixer_write 0x%x 0x%x\n", reg, data);
 #endif
 }
 
@@ -33,7 +33,7 @@ unsigned char snd_sbmixer_read(struct snd_sb *chip, unsigned char reg)
 	result = inb(SBP(chip, MIXER_DATA));
 	udelay(10);
 #ifdef IO_DEBUG
-	snd_printk(KERN_DEBUG "mixer_read 0x%x 0x%x\n", reg, result);
+	dev_dbg(chip->card->dev, "mixer_read 0x%x 0x%x\n", reg, result);
 #endif
 	return result;
 }
-- 
2.43.0

