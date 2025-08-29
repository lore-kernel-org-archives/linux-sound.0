Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1B792EA170
	for <linux-sound@vger.kernel.org>; Fri, 29 Aug 2025 14:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756479246; cv=none; b=jCh2uhQBtGS251QUeZ0MFg38jTGC+DNeW/Bmo2pji4NHTGaD4K9nrcUnPmQrZBwzWvk2i9k5UiAe1taGBNfVYQPg+RczRNhfA2mr68G4eLsAxeKnCbwgDON2VYAtckEoPwZNalt09YOvNImWsUnbGfz1wNUk8MbXC+LtPRyVQ7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756479246; c=relaxed/simple;
	bh=st3YX/RHd/Fq3Nk1i5PPyFSgaRwARVBfvQExKIRGkdo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uRUtkTkk7THgCNj7PTc9WNL9uCVGahoFwOcn5mQN9uM5u2EBrcJv5Itc8VWnZrYcDRUBV1Vghux25S6Qq4sOdluUi0DvMc1cYfiVw80J2wl99bsEwIpovUqyTvH+o5FBEwqftEMUdbxK8AVQr/JH9hVBoeV1hJnZpSFFAPccRuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=r5I9LupE; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ojjjoqUe; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=r5I9LupE; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ojjjoqUe; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="r5I9LupE";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ojjjoqUe";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="r5I9LupE";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ojjjoqUe"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id B76FF2287F;
	Fri, 29 Aug 2025 14:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756479192; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mgRSCV2yRy++jfyuf/lN3ZA1qqoVSX8Z5zWCGJ6hqiQ=;
	b=r5I9LupEvt+fo/lMCn7jQa9OfOVg/p02g6vNt+ovevhQzN/VFt0sqpekZH5QXiZ3ZYCImb
	EZeI8zSyeO6qsWXOfFWen7Inc6Fx89ivgwdxGru566cgN73/AdzQMlulcR4adSruyNnWxF
	6tFJwsyzpjJXYRUx2fSco5m0WMGY8VI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756479192;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mgRSCV2yRy++jfyuf/lN3ZA1qqoVSX8Z5zWCGJ6hqiQ=;
	b=ojjjoqUeNR8D6FMEAtlKVkK8SPLW9a7mHUMxYFoHP97LthnizWcoGakcQErrMqoNGArvx7
	vpe5m6gWkugMlABw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756479192; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mgRSCV2yRy++jfyuf/lN3ZA1qqoVSX8Z5zWCGJ6hqiQ=;
	b=r5I9LupEvt+fo/lMCn7jQa9OfOVg/p02g6vNt+ovevhQzN/VFt0sqpekZH5QXiZ3ZYCImb
	EZeI8zSyeO6qsWXOfFWen7Inc6Fx89ivgwdxGru566cgN73/AdzQMlulcR4adSruyNnWxF
	6tFJwsyzpjJXYRUx2fSco5m0WMGY8VI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756479192;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mgRSCV2yRy++jfyuf/lN3ZA1qqoVSX8Z5zWCGJ6hqiQ=;
	b=ojjjoqUeNR8D6FMEAtlKVkK8SPLW9a7mHUMxYFoHP97LthnizWcoGakcQErrMqoNGArvx7
	vpe5m6gWkugMlABw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 92CE913A54;
	Fri, 29 Aug 2025 14:53:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id yCysIti+sWhzGwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 29 Aug 2025 14:53:12 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 15/18] ALSA: sscape: Use guard() for spin locks
Date: Fri, 29 Aug 2025 16:52:55 +0200
Message-ID: <20250829145300.5460-16-tiwai@suse.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250829145300.5460-1-tiwai@suse.de>
References: <20250829145300.5460-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -2.80

Clean up the code using guard() for spin locks.

Merely code refactoring, and no behavior change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/isa/sscape.c | 184 ++++++++++++++++++++-------------------------
 1 file changed, 81 insertions(+), 103 deletions(-)

diff --git a/sound/isa/sscape.c b/sound/isa/sscape.c
index 709a1659d66f..a31ca75774a6 100644
--- a/sound/isa/sscape.c
+++ b/sound/isa/sscape.c
@@ -200,11 +200,8 @@ static inline void sscape_write_unsafe(unsigned io_base, enum GA_REG reg,
 static void sscape_write(struct soundscape *s, enum GA_REG reg,
 			 unsigned char val)
 {
-	unsigned long flags;
-
-	spin_lock_irqsave(&s->lock, flags);
+	guard(spinlock_irqsave)(&s->lock);
 	sscape_write_unsafe(s->io_base, reg, val);
-	spin_unlock_irqrestore(&s->lock, flags);
 }
 
 /*
@@ -367,12 +364,11 @@ static int obp_startup_ack(struct soundscape *s, unsigned timeout)
 	unsigned long end_time = jiffies + msecs_to_jiffies(timeout);
 
 	do {
-		unsigned long flags;
 		int x;
 
-		spin_lock_irqsave(&s->lock, flags);
-		x = host_read_unsafe(s->io_base);
-		spin_unlock_irqrestore(&s->lock, flags);
+		scoped_guard(spinlock_irqsave, &s->lock) {
+			x = host_read_unsafe(s->io_base);
+		}
 		if (x == 0xfe || x == 0xff)
 			return 1;
 
@@ -394,12 +390,11 @@ static int host_startup_ack(struct soundscape *s, unsigned timeout)
 	unsigned long end_time = jiffies + msecs_to_jiffies(timeout);
 
 	do {
-		unsigned long flags;
 		int x;
 
-		spin_lock_irqsave(&s->lock, flags);
-		x = host_read_unsafe(s->io_base);
-		spin_unlock_irqrestore(&s->lock, flags);
+		scoped_guard(spinlock_irqsave, &s->lock) {
+			x = host_read_unsafe(s->io_base);
+		}
 		if (x == 0xfe)
 			return 1;
 
@@ -415,7 +410,6 @@ static int host_startup_ack(struct soundscape *s, unsigned timeout)
 static int upload_dma_data(struct soundscape *s, const unsigned char *data,
 			   size_t size)
 {
-	unsigned long flags;
 	struct snd_dma_buffer dma;
 	int ret;
 	unsigned char val;
@@ -423,62 +417,57 @@ static int upload_dma_data(struct soundscape *s, const unsigned char *data,
 	if (!get_dmabuf(s, &dma, PAGE_ALIGN(32 * 1024)))
 		return -ENOMEM;
 
-	spin_lock_irqsave(&s->lock, flags);
+	scoped_guard(spinlock_irqsave, &s->lock) {
 
-	/*
-	 * Reset the board ...
-	 */
-	val = sscape_read_unsafe(s->io_base, GA_HMCTL_REG);
-	sscape_write_unsafe(s->io_base, GA_HMCTL_REG, val & 0x3f);
+		/*
+		 * Reset the board ...
+		 */
+		val = sscape_read_unsafe(s->io_base, GA_HMCTL_REG);
+		sscape_write_unsafe(s->io_base, GA_HMCTL_REG, val & 0x3f);
 
-	/*
-	 * Enable the DMA channels and configure them ...
-	 */
-	val = (s->chip->dma1 << 4) | DMA_8BIT;
-	sscape_write_unsafe(s->io_base, GA_DMAA_REG, val);
-	sscape_write_unsafe(s->io_base, GA_DMAB_REG, 0x20);
+		/*
+		 * Enable the DMA channels and configure them ...
+		 */
+		val = (s->chip->dma1 << 4) | DMA_8BIT;
+		sscape_write_unsafe(s->io_base, GA_DMAA_REG, val);
+		sscape_write_unsafe(s->io_base, GA_DMAB_REG, 0x20);
 
-	/*
-	 * Take the board out of reset ...
-	 */
-	val = sscape_read_unsafe(s->io_base, GA_HMCTL_REG);
-	sscape_write_unsafe(s->io_base, GA_HMCTL_REG, val | 0x80);
+		/*
+		 * Take the board out of reset ...
+		 */
+		val = sscape_read_unsafe(s->io_base, GA_HMCTL_REG);
+		sscape_write_unsafe(s->io_base, GA_HMCTL_REG, val | 0x80);
 
-	/*
-	 * Upload the firmware to the SoundScape
-	 * board through the DMA channel ...
-	 */
-	while (size != 0) {
-		unsigned long len;
+		/*
+		 * Upload the firmware to the SoundScape
+		 * board through the DMA channel ...
+		 */
+		while (size != 0) {
+			unsigned long len;
 
-		len = min(size, dma.bytes);
-		memcpy(dma.area, data, len);
-		data += len;
-		size -= len;
+			len = min(size, dma.bytes);
+			memcpy(dma.area, data, len);
+			data += len;
+			size -= len;
 
-		snd_dma_program(s->chip->dma1, dma.addr, len, DMA_MODE_WRITE);
-		sscape_start_dma_unsafe(s->io_base, GA_DMAA_REG);
-		if (!sscape_wait_dma_unsafe(s->io_base, GA_DMAA_REG, 5000)) {
-			/*
-			 * Don't forget to release this spinlock we're holding
-			 */
-			spin_unlock_irqrestore(&s->lock, flags);
+			snd_dma_program(s->chip->dma1, dma.addr, len, DMA_MODE_WRITE);
+			sscape_start_dma_unsafe(s->io_base, GA_DMAA_REG);
+			if (!sscape_wait_dma_unsafe(s->io_base, GA_DMAA_REG, 5000)) {
+				dev_err(s->dev, "sscape: DMA upload has timed out\n");
+				ret = -EAGAIN;
+				goto _release_dma;
+			}
+		} /* while */
 
-			dev_err(s->dev, "sscape: DMA upload has timed out\n");
-			ret = -EAGAIN;
-			goto _release_dma;
-		}
-	} /* while */
+		set_host_mode_unsafe(s->io_base);
+		outb(0x0, s->io_base);
 
-	set_host_mode_unsafe(s->io_base);
-	outb(0x0, s->io_base);
-
-	/*
-	 * Boot the board ... (I think)
-	 */
-	val = sscape_read_unsafe(s->io_base, GA_HMCTL_REG);
-	sscape_write_unsafe(s->io_base, GA_HMCTL_REG, val | 0x40);
-	spin_unlock_irqrestore(&s->lock, flags);
+		/*
+		 * Boot the board ... (I think)
+		 */
+		val = sscape_read_unsafe(s->io_base, GA_HMCTL_REG);
+		sscape_write_unsafe(s->io_base, GA_HMCTL_REG, val | 0x40);
+	}
 
 	/*
 	 * If all has gone well, then the board should acknowledge
@@ -513,7 +502,6 @@ static int upload_dma_data(struct soundscape *s, const unsigned char *data,
 static int sscape_upload_bootblock(struct snd_card *card)
 {
 	struct soundscape *sscape = get_card_soundscape(card);
-	unsigned long flags;
 	const struct firmware *init_fw = NULL;
 	int data = 0;
 	int ret;
@@ -527,15 +515,13 @@ static int sscape_upload_bootblock(struct snd_card *card)
 
 	release_firmware(init_fw);
 
-	spin_lock_irqsave(&sscape->lock, flags);
+	guard(spinlock_irqsave)(&sscape->lock);
 	if (ret == 0)
 		data = host_read_ctrl_unsafe(sscape->io_base, 100);
 
 	if (data & 0x10)
 		sscape_write_unsafe(sscape->io_base, GA_SMCFGA_REG, 0x2f);
 
-	spin_unlock_irqrestore(&sscape->lock, flags);
-
 	data &= 0xf;
 	if (ret == 0 && data > 7) {
 		dev_err(card->dev,
@@ -593,11 +579,9 @@ static int sscape_midi_get(struct snd_kcontrol *kctl,
 	struct snd_wss *chip = snd_kcontrol_chip(kctl);
 	struct snd_card *card = chip->card;
 	register struct soundscape *s = get_card_soundscape(card);
-	unsigned long flags;
 
-	spin_lock_irqsave(&s->lock, flags);
+	guard(spinlock_irqsave)(&s->lock);
 	uctl->value.integer.value[0] = s->midi_vol;
-	spin_unlock_irqrestore(&s->lock, flags);
 	return 0;
 }
 
@@ -607,11 +591,10 @@ static int sscape_midi_put(struct snd_kcontrol *kctl,
 	struct snd_wss *chip = snd_kcontrol_chip(kctl);
 	struct snd_card *card = chip->card;
 	struct soundscape *s = get_card_soundscape(card);
-	unsigned long flags;
 	int change;
 	unsigned char new_val;
 
-	spin_lock_irqsave(&s->lock, flags);
+	guard(spinlock_irqsave)(&s->lock);
 
 	new_val = uctl->value.integer.value[0] & 127;
 	/*
@@ -642,7 +625,6 @@ static int sscape_midi_put(struct snd_kcontrol *kctl,
 	 */
 	set_midi_mode_unsafe(s->io_base);
 
-	spin_unlock_irqrestore(&s->lock, flags);
 	return change;
 }
 
@@ -852,8 +834,6 @@ static int create_ad1845(struct snd_card *card, unsigned port,
 	err = snd_wss_create(card, port, -1, irq, dma1, dma2,
 			     codec_type, WSS_HWSHARE_DMA1, &chip);
 	if (!err) {
-		unsigned long flags;
-
 		if (sscape->type != SSCAPE_VIVO) {
 			/*
 			 * The input clock frequency on the SoundScape must
@@ -861,9 +841,9 @@ static int create_ad1845(struct snd_card *card, unsigned port,
 			 * to get the playback to sound correct ...
 			 */
 			snd_wss_mce_up(chip);
-			spin_lock_irqsave(&chip->reg_lock, flags);
-			snd_wss_out(chip, AD1845_CLOCK, 0x20);
-			spin_unlock_irqrestore(&chip->reg_lock, flags);
+			scoped_guard(spinlock_irqsave, &chip->reg_lock) {
+				snd_wss_out(chip, AD1845_CLOCK, 0x20);
+			}
 			snd_wss_mce_down(chip);
 
 		}
@@ -920,7 +900,6 @@ static int create_sscape(int dev, struct snd_card *card)
 	unsigned mpu_irq_cfg;
 	struct resource *io_res;
 	struct resource *wss_res;
-	unsigned long flags;
 	int err;
 	int val;
 	const char *name;
@@ -1006,34 +985,34 @@ static int create_sscape(int dev, struct snd_card *card)
 	 * Tell the on-board devices where their resources are (I think -
 	 * I can't be sure without a datasheet ... So many magic values!)
 	 */
-	spin_lock_irqsave(&sscape->lock, flags);
+	scoped_guard(spinlock_irqsave, &sscape->lock) {
 
-	sscape_write_unsafe(sscape->io_base, GA_SMCFGA_REG, 0x2e);
-	sscape_write_unsafe(sscape->io_base, GA_SMCFGB_REG, 0x00);
+		sscape_write_unsafe(sscape->io_base, GA_SMCFGA_REG, 0x2e);
+		sscape_write_unsafe(sscape->io_base, GA_SMCFGB_REG, 0x00);
 
-	/*
-	 * Enable and configure the DMA channels ...
-	 */
-	sscape_write_unsafe(sscape->io_base, GA_DMACFG_REG, 0x50);
-	dma_cfg = (sscape->ic_type == IC_OPUS ? 0x40 : 0x70);
-	sscape_write_unsafe(sscape->io_base, GA_DMAA_REG, dma_cfg);
-	sscape_write_unsafe(sscape->io_base, GA_DMAB_REG, 0x20);
+		/*
+		 * Enable and configure the DMA channels ...
+		 */
+		sscape_write_unsafe(sscape->io_base, GA_DMACFG_REG, 0x50);
+		dma_cfg = (sscape->ic_type == IC_OPUS ? 0x40 : 0x70);
+		sscape_write_unsafe(sscape->io_base, GA_DMAA_REG, dma_cfg);
+		sscape_write_unsafe(sscape->io_base, GA_DMAB_REG, 0x20);
 
-	mpu_irq_cfg |= mpu_irq_cfg << 2;
-	val = sscape_read_unsafe(sscape->io_base, GA_HMCTL_REG) & 0xF7;
-	if (joystick[dev])
-		val |= 8;
-	sscape_write_unsafe(sscape->io_base, GA_HMCTL_REG, val | 0x10);
-	sscape_write_unsafe(sscape->io_base, GA_INTCFG_REG, 0xf0 | mpu_irq_cfg);
-	sscape_write_unsafe(sscape->io_base,
-			    GA_CDCFG_REG, 0x09 | DMA_8BIT
-			    | (dma[dev] << 4) | (irq_cfg << 1));
-	/*
-	 * Enable the master IRQ ...
-	 */
-	sscape_write_unsafe(sscape->io_base, GA_INTENA_REG, 0x80);
+		mpu_irq_cfg |= mpu_irq_cfg << 2;
+		val = sscape_read_unsafe(sscape->io_base, GA_HMCTL_REG) & 0xF7;
+		if (joystick[dev])
+			val |= 8;
+		sscape_write_unsafe(sscape->io_base, GA_HMCTL_REG, val | 0x10);
+		sscape_write_unsafe(sscape->io_base, GA_INTCFG_REG, 0xf0 | mpu_irq_cfg);
+		sscape_write_unsafe(sscape->io_base,
+				    GA_CDCFG_REG, 0x09 | DMA_8BIT
+				    | (dma[dev] << 4) | (irq_cfg << 1));
+		/*
+		 * Enable the master IRQ ...
+		 */
+		sscape_write_unsafe(sscape->io_base, GA_INTENA_REG, 0x80);
 
-	spin_unlock_irqrestore(&sscape->lock, flags);
+	}
 
 	/*
 	 * We have now enabled the codec chip, and so we should
@@ -1073,7 +1052,7 @@ static int create_sscape(int dev, struct snd_card *card)
 			/*
 			 * Initialize mixer
 			 */
-			spin_lock_irqsave(&sscape->lock, flags);
+			guard(spinlock_irqsave)(&sscape->lock);
 			sscape->midi_vol = 0;
 			host_write_ctrl_unsafe(sscape->io_base,
 						CMD_SET_MIDI_VOL, 100);
@@ -1090,7 +1069,6 @@ static int create_sscape(int dev, struct snd_card *card)
 			host_write_ctrl_unsafe(sscape->io_base, CMD_ACK, 100);
 
 			set_midi_mode_unsafe(sscape->io_base);
-			spin_unlock_irqrestore(&sscape->lock, flags);
 		}
 	}
 
-- 
2.50.1

