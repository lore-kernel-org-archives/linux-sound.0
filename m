Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC92131CA77
	for <linux-sound@vger.kernel.org>; Fri, 29 Aug 2025 14:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756479215; cv=none; b=ZLfOOnerZoZ8A/2EkHVICO1Lpnyytsb6owy55BQCm2y5PUtMHi2s32BxBI2265TDTUl7TkdNCXZni5W7g/91DMgzjUdghuHx4xt1a4PkQF6L4DwD9Shl2Z7s0RLfSUe4Izi88WikcmTxKsvDIThIqwfkC9QC1re3vh2m9sRRh5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756479215; c=relaxed/simple;
	bh=GEo/ue2EvoF+lh39pNNgSQgFkqwn6ZmbLNXmZAT0Scs=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dRT6XUrgrsJcejqsYzbdQffKc6diiG4TPTsHz9J5S3DO+ivizkQ6RSp4cuiKEhJJj+ObBgW1/8hNTYMyU/6Bdjx+Tjp2ANvhc3x30jVPXvqeLvyUvjactCaNo4ZuUaKj5L2cmFhf60cRvR0ZTwUJWpuR5+jNKZurKgA0Q8IrHOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=xcfmvem3; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=hSHrQw7X; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=xcfmvem3; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=hSHrQw7X; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="xcfmvem3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="hSHrQw7X";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="xcfmvem3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="hSHrQw7X"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 5960E5C243;
	Fri, 29 Aug 2025 14:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756479191; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TE16sXbeogeXClSEviGSaRVvn4WdwvoYuPMGnUSWSjQ=;
	b=xcfmvem3sRlkrPYTwcUUYJSUZeMImqMo6AGgc47z7qvGzJbDZgjC7pGmiNLqeM7duzzCNN
	5B77heAyEGR/AijCWDQljg08zoSdTVL1K2yY2ISf5sFp6pDTV7hJQn8V5Y7T/Q2r/cwdO6
	brcl9y8FYbuE/7+kLfLlPjbqExrHtg4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756479191;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TE16sXbeogeXClSEviGSaRVvn4WdwvoYuPMGnUSWSjQ=;
	b=hSHrQw7Xad7leXiwhbETz1I1TmwaE7dhlHaPy6U6UcGUubq0pZIz4xHE+7OJrwT9ETMc2f
	hH3ZHgT2zgjplYCQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756479191; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TE16sXbeogeXClSEviGSaRVvn4WdwvoYuPMGnUSWSjQ=;
	b=xcfmvem3sRlkrPYTwcUUYJSUZeMImqMo6AGgc47z7qvGzJbDZgjC7pGmiNLqeM7duzzCNN
	5B77heAyEGR/AijCWDQljg08zoSdTVL1K2yY2ISf5sFp6pDTV7hJQn8V5Y7T/Q2r/cwdO6
	brcl9y8FYbuE/7+kLfLlPjbqExrHtg4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756479191;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TE16sXbeogeXClSEviGSaRVvn4WdwvoYuPMGnUSWSjQ=;
	b=hSHrQw7Xad7leXiwhbETz1I1TmwaE7dhlHaPy6U6UcGUubq0pZIz4xHE+7OJrwT9ETMc2f
	hH3ZHgT2zgjplYCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3EEB213A54;
	Fri, 29 Aug 2025 14:53:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id KNs0Dte+sWhzGwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 29 Aug 2025 14:53:11 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 05/18] ALSA: es1688: Use guard() for spin locks
Date: Fri, 29 Aug 2025 16:52:45 +0200
Message-ID: <20250829145300.5460-6-tiwai@suse.de>
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
 sound/isa/es1688/es1688_lib.c | 276 ++++++++++++++++------------------
 1 file changed, 128 insertions(+), 148 deletions(-)

diff --git a/sound/isa/es1688/es1688_lib.c b/sound/isa/es1688/es1688_lib.c
index 2ef183f197ad..59987dbc9ae9 100644
--- a/sound/isa/es1688/es1688_lib.c
+++ b/sound/isa/es1688/es1688_lib.c
@@ -105,7 +105,6 @@ EXPORT_SYMBOL(snd_es1688_reset);
 
 static int snd_es1688_probe(struct snd_es1688 *chip)
 {
-	unsigned long flags;
 	unsigned short major, minor;
 	int i;
 
@@ -113,39 +112,36 @@ static int snd_es1688_probe(struct snd_es1688 *chip)
 	 *  initialization sequence
 	 */
 
-	spin_lock_irqsave(&chip->reg_lock, flags);	/* Some ESS1688 cards need this */
-	inb(ES1688P(chip, ENABLE1));	/* ENABLE1 */
-	inb(ES1688P(chip, ENABLE1));	/* ENABLE1 */
-	inb(ES1688P(chip, ENABLE1));	/* ENABLE1 */
-	inb(ES1688P(chip, ENABLE2));	/* ENABLE2 */
-	inb(ES1688P(chip, ENABLE1));	/* ENABLE1 */
-	inb(ES1688P(chip, ENABLE2));	/* ENABLE2 */
-	inb(ES1688P(chip, ENABLE1));	/* ENABLE1 */
-	inb(ES1688P(chip, ENABLE1));	/* ENABLE1 */
-	inb(ES1688P(chip, ENABLE2));	/* ENABLE2 */
-	inb(ES1688P(chip, ENABLE1));	/* ENABLE1 */
-	inb(ES1688P(chip, ENABLE0));	/* ENABLE0 */
+	scoped_guard(spinlock_irqsave, &chip->reg_lock) {	/* Some ESS1688 cards need this */
+		inb(ES1688P(chip, ENABLE1));	/* ENABLE1 */
+		inb(ES1688P(chip, ENABLE1));	/* ENABLE1 */
+		inb(ES1688P(chip, ENABLE1));	/* ENABLE1 */
+		inb(ES1688P(chip, ENABLE2));	/* ENABLE2 */
+		inb(ES1688P(chip, ENABLE1));	/* ENABLE1 */
+		inb(ES1688P(chip, ENABLE2));	/* ENABLE2 */
+		inb(ES1688P(chip, ENABLE1));	/* ENABLE1 */
+		inb(ES1688P(chip, ENABLE1));	/* ENABLE1 */
+		inb(ES1688P(chip, ENABLE2));	/* ENABLE2 */
+		inb(ES1688P(chip, ENABLE1));	/* ENABLE1 */
+		inb(ES1688P(chip, ENABLE0));	/* ENABLE0 */
 
-	if (snd_es1688_reset(chip) < 0) {
-		dev_dbg(chip->card->dev, "ESS: [0x%lx] reset failed... 0x%x\n",
-			chip->port, inb(ES1688P(chip, READ)));
-		spin_unlock_irqrestore(&chip->reg_lock, flags);
-		return -ENODEV;
-	}
-	snd_es1688_dsp_command(chip, 0xe7);	/* return identification */
+		if (snd_es1688_reset(chip) < 0) {
+			dev_dbg(chip->card->dev, "ESS: [0x%lx] reset failed... 0x%x\n",
+				chip->port, inb(ES1688P(chip, READ)));
+			return -ENODEV;
+		}
+		snd_es1688_dsp_command(chip, 0xe7);	/* return identification */
 
-	for (i = 1000, major = minor = 0; i; i--) {
-		if (inb(ES1688P(chip, DATA_AVAIL)) & 0x80) {
-			if (major == 0) {
-				major = inb(ES1688P(chip, READ));
-			} else {
-				minor = inb(ES1688P(chip, READ));
+		for (i = 1000, major = minor = 0; i; i--) {
+			if (inb(ES1688P(chip, DATA_AVAIL)) & 0x80) {
+				if (major == 0)
+					major = inb(ES1688P(chip, READ));
+				else
+					minor = inb(ES1688P(chip, READ));
 			}
 		}
 	}
 
-	spin_unlock_irqrestore(&chip->reg_lock, flags);
-
 	dev_dbg(chip->card->dev,
 		"ESS: [0x%lx] found.. major = 0x%x, minor = 0x%x\n",
 		chip->port, major, minor);
@@ -169,15 +165,15 @@ static int snd_es1688_probe(struct snd_es1688 *chip)
 		return -ENODEV;
 	}
 
-	spin_lock_irqsave(&chip->reg_lock, flags);
-	snd_es1688_write(chip, 0xb1, 0x10);	/* disable IRQ */
-	snd_es1688_write(chip, 0xb2, 0x00);	/* disable DMA */
-	spin_unlock_irqrestore(&chip->reg_lock, flags);
+	scoped_guard(spinlock_irqsave, &chip->reg_lock) {
+		snd_es1688_write(chip, 0xb1, 0x10);	/* disable IRQ */
+		snd_es1688_write(chip, 0xb2, 0x00);	/* disable DMA */
+	}
 
 	/* enable joystick, but disable OPL3 */
-	spin_lock_irqsave(&chip->mixer_lock, flags);
-	snd_es1688_mixer_write(chip, 0x40, 0x01);
-	spin_unlock_irqrestore(&chip->mixer_lock, flags);
+	scoped_guard(spinlock_irqsave, &chip->mixer_lock) {
+		snd_es1688_mixer_write(chip, 0x40, 0x01);
+	}
 
 	return 0;
 }
@@ -185,7 +181,6 @@ static int snd_es1688_probe(struct snd_es1688 *chip)
 static int snd_es1688_init(struct snd_es1688 * chip, int enable)
 {
 	static const int irqs[16] = {-1, -1, 0, -1, -1, 1, -1, 2, -1, 0, 3, -1, -1, -1, -1, -1};
-	unsigned long flags;
 	int cfg, irq_bits, dma, dma_bits, tmp, tmp1;
 
 	/* ok.. setup MPU-401 port and joystick and OPL3 */
@@ -214,14 +209,14 @@ static int snd_es1688_init(struct snd_es1688 * chip, int enable)
 			}
 		}
 	}
-	spin_lock_irqsave(&chip->reg_lock, flags);
-	snd_es1688_mixer_write(chip, 0x40, cfg);
-	spin_unlock_irqrestore(&chip->reg_lock, flags);
+	scoped_guard(spinlock_irqsave, &chip->reg_lock) {
+		snd_es1688_mixer_write(chip, 0x40, cfg);
+	}
 	/* --- */
-	spin_lock_irqsave(&chip->reg_lock, flags);
-	snd_es1688_read(chip, 0xb1);
-	snd_es1688_read(chip, 0xb2);
-	spin_unlock_irqrestore(&chip->reg_lock, flags);
+	scoped_guard(spinlock_irqsave, &chip->reg_lock) {
+		snd_es1688_read(chip, 0xb1);
+		snd_es1688_read(chip, 0xb2);
+	}
 	if (enable) {
 		cfg = 0xf0;	/* enable only DMA counter interrupt */
 		irq_bits = irqs[chip->irq & 0x0f];
@@ -235,9 +230,9 @@ static int snd_es1688_init(struct snd_es1688 * chip, int enable)
 #endif
 			return -EINVAL;
 		}
-		spin_lock_irqsave(&chip->reg_lock, flags);
-		snd_es1688_write(chip, 0xb1, cfg | (irq_bits << 2));
-		spin_unlock_irqrestore(&chip->reg_lock, flags);
+		scoped_guard(spinlock_irqsave, &chip->reg_lock) {
+			snd_es1688_write(chip, 0xb1, cfg | (irq_bits << 2));
+		}
 		cfg = 0xf0;	/* extended mode DMA enable */
 		dma = chip->dma8;
 		if (dma > 3 || dma == 2) {
@@ -254,20 +249,20 @@ static int snd_es1688_init(struct snd_es1688 * chip, int enable)
 			if (dma != 3)
 				dma_bits++;
 		}
-		spin_lock_irqsave(&chip->reg_lock, flags);
-		snd_es1688_write(chip, 0xb2, cfg | (dma_bits << 2));
-		spin_unlock_irqrestore(&chip->reg_lock, flags);
+		scoped_guard(spinlock_irqsave, &chip->reg_lock) {
+			snd_es1688_write(chip, 0xb2, cfg | (dma_bits << 2));
+		}
 	} else {
-		spin_lock_irqsave(&chip->reg_lock, flags);
-		snd_es1688_write(chip, 0xb1, 0x10);	/* disable IRQ */
-		snd_es1688_write(chip, 0xb2, 0x00);	/* disable DMA */
-		spin_unlock_irqrestore(&chip->reg_lock, flags);
+		scoped_guard(spinlock_irqsave, &chip->reg_lock) {
+			snd_es1688_write(chip, 0xb1, 0x10);	/* disable IRQ */
+			snd_es1688_write(chip, 0xb2, 0x00);	/* disable DMA */
+		}
+	}
+	scoped_guard(spinlock_irqsave, &chip->reg_lock) {
+		snd_es1688_read(chip, 0xb1);
+		snd_es1688_read(chip, 0xb2);
+		snd_es1688_reset(chip);
 	}
-	spin_lock_irqsave(&chip->reg_lock, flags);
-	snd_es1688_read(chip, 0xb1);
-	snd_es1688_read(chip, 0xb2);
-	snd_es1688_reset(chip);
-	spin_unlock_irqrestore(&chip->reg_lock, flags);
 	return 0;
 }
 
@@ -320,74 +315,70 @@ static int snd_es1688_trigger(struct snd_es1688 *chip, int cmd, unsigned char va
 	} else if (cmd != SNDRV_PCM_TRIGGER_START) {
 		return -EINVAL;
 	}
-	spin_lock(&chip->reg_lock);
+	guard(spinlock)(&chip->reg_lock);
 	chip->trigger_value = value;
 	val = snd_es1688_read(chip, 0xb8);
-	if ((val < 0) || (val & 0x0f) == value) {
-		spin_unlock(&chip->reg_lock);
+	if ((val < 0) || (val & 0x0f) == value)
 		return -EINVAL;	/* something is wrong */
-	}
 #if 0
 	dev_dbg(chip->card->dev, "trigger: val = 0x%x, value = 0x%x\n", val, value);
 	dev_dbg(chip->card->dev, "trigger: pointer = 0x%x\n",
 		snd_dma_pointer(chip->dma8, chip->dma_size));
 #endif
 	snd_es1688_write(chip, 0xb8, (val & 0xf0) | value);
-	spin_unlock(&chip->reg_lock);
 	return 0;
 }
 
 static int snd_es1688_playback_prepare(struct snd_pcm_substream *substream)
 {
-	unsigned long flags;
 	struct snd_es1688 *chip = snd_pcm_substream_chip(substream);
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	unsigned int size = snd_pcm_lib_buffer_bytes(substream);
 	unsigned int count = snd_pcm_lib_period_bytes(substream);
 
 	chip->dma_size = size;
-	spin_lock_irqsave(&chip->reg_lock, flags);
-	snd_es1688_reset(chip);
-	snd_es1688_set_rate(chip, substream);
-	snd_es1688_write(chip, 0xb8, 4);	/* auto init DMA mode */
-	snd_es1688_write(chip, 0xa8, (snd_es1688_read(chip, 0xa8) & ~0x03) | (3 - runtime->channels));
-	snd_es1688_write(chip, 0xb9, 2);	/* demand mode (4 bytes/request) */
-	if (runtime->channels == 1) {
-		if (snd_pcm_format_width(runtime->format) == 8) {
-			/* 8. bit mono */
-			snd_es1688_write(chip, 0xb6, 0x80);
-			snd_es1688_write(chip, 0xb7, 0x51);
-			snd_es1688_write(chip, 0xb7, 0xd0);
+	scoped_guard(spinlock_irqsave, &chip->reg_lock) {
+		snd_es1688_reset(chip);
+		snd_es1688_set_rate(chip, substream);
+		snd_es1688_write(chip, 0xb8, 4);	/* auto init DMA mode */
+		snd_es1688_write(chip, 0xa8, (snd_es1688_read(chip, 0xa8) & ~0x03) | (3 - runtime->channels));
+		snd_es1688_write(chip, 0xb9, 2);	/* demand mode (4 bytes/request) */
+		if (runtime->channels == 1) {
+			if (snd_pcm_format_width(runtime->format) == 8) {
+				/* 8. bit mono */
+				snd_es1688_write(chip, 0xb6, 0x80);
+				snd_es1688_write(chip, 0xb7, 0x51);
+				snd_es1688_write(chip, 0xb7, 0xd0);
+			} else {
+				/* 16. bit mono */
+				snd_es1688_write(chip, 0xb6, 0x00);
+				snd_es1688_write(chip, 0xb7, 0x71);
+				snd_es1688_write(chip, 0xb7, 0xf4);
+			}
 		} else {
-			/* 16. bit mono */
-			snd_es1688_write(chip, 0xb6, 0x00);
-			snd_es1688_write(chip, 0xb7, 0x71);
-			snd_es1688_write(chip, 0xb7, 0xf4);
-		}
-	} else {
-		if (snd_pcm_format_width(runtime->format) == 8) {
-			/* 8. bit stereo */
-			snd_es1688_write(chip, 0xb6, 0x80);
-			snd_es1688_write(chip, 0xb7, 0x51);
-			snd_es1688_write(chip, 0xb7, 0x98);
-		} else {
-			/* 16. bit stereo */
-			snd_es1688_write(chip, 0xb6, 0x00);
-			snd_es1688_write(chip, 0xb7, 0x71);
-			snd_es1688_write(chip, 0xb7, 0xbc);
+			if (snd_pcm_format_width(runtime->format) == 8) {
+				/* 8. bit stereo */
+				snd_es1688_write(chip, 0xb6, 0x80);
+				snd_es1688_write(chip, 0xb7, 0x51);
+				snd_es1688_write(chip, 0xb7, 0x98);
+			} else {
+				/* 16. bit stereo */
+				snd_es1688_write(chip, 0xb6, 0x00);
+				snd_es1688_write(chip, 0xb7, 0x71);
+				snd_es1688_write(chip, 0xb7, 0xbc);
+			}
 		}
+		snd_es1688_write(chip, 0xb1, (snd_es1688_read(chip, 0xb1) & 0x0f) | 0x50);
+		snd_es1688_write(chip, 0xb2, (snd_es1688_read(chip, 0xb2) & 0x0f) | 0x50);
+		snd_es1688_dsp_command(chip, ES1688_DSP_CMD_SPKON);
 	}
-	snd_es1688_write(chip, 0xb1, (snd_es1688_read(chip, 0xb1) & 0x0f) | 0x50);
-	snd_es1688_write(chip, 0xb2, (snd_es1688_read(chip, 0xb2) & 0x0f) | 0x50);
-	snd_es1688_dsp_command(chip, ES1688_DSP_CMD_SPKON);
-	spin_unlock_irqrestore(&chip->reg_lock, flags);
 	/* --- */
 	count = -count;
 	snd_dma_program(chip->dma8, runtime->dma_addr, size, DMA_MODE_WRITE | DMA_AUTOINIT);
-	spin_lock_irqsave(&chip->reg_lock, flags);
-	snd_es1688_write(chip, 0xa4, (unsigned char) count);
-	snd_es1688_write(chip, 0xa5, (unsigned char) (count >> 8));
-	spin_unlock_irqrestore(&chip->reg_lock, flags);
+	scoped_guard(spinlock_irqsave, &chip->reg_lock) {
+		snd_es1688_write(chip, 0xa4, (unsigned char) count);
+		snd_es1688_write(chip, 0xa5, (unsigned char) (count >> 8));
+	}
 	return 0;
 }
 
@@ -400,51 +391,50 @@ static int snd_es1688_playback_trigger(struct snd_pcm_substream *substream,
 
 static int snd_es1688_capture_prepare(struct snd_pcm_substream *substream)
 {
-	unsigned long flags;
 	struct snd_es1688 *chip = snd_pcm_substream_chip(substream);
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	unsigned int size = snd_pcm_lib_buffer_bytes(substream);
 	unsigned int count = snd_pcm_lib_period_bytes(substream);
 
 	chip->dma_size = size;
-	spin_lock_irqsave(&chip->reg_lock, flags);
-	snd_es1688_reset(chip);
-	snd_es1688_set_rate(chip, substream);
-	snd_es1688_dsp_command(chip, ES1688_DSP_CMD_SPKOFF);
-	snd_es1688_write(chip, 0xb8, 0x0e);	/* auto init DMA mode */
-	snd_es1688_write(chip, 0xa8, (snd_es1688_read(chip, 0xa8) & ~0x03) | (3 - runtime->channels));
-	snd_es1688_write(chip, 0xb9, 2);	/* demand mode (4 bytes/request) */
-	if (runtime->channels == 1) {
-		if (snd_pcm_format_width(runtime->format) == 8) {
-			/* 8. bit mono */
-			snd_es1688_write(chip, 0xb7, 0x51);
-			snd_es1688_write(chip, 0xb7, 0xd0);
+	scoped_guard(spinlock_irqsave, &chip->reg_lock) {
+		snd_es1688_reset(chip);
+		snd_es1688_set_rate(chip, substream);
+		snd_es1688_dsp_command(chip, ES1688_DSP_CMD_SPKOFF);
+		snd_es1688_write(chip, 0xb8, 0x0e);	/* auto init DMA mode */
+		snd_es1688_write(chip, 0xa8, (snd_es1688_read(chip, 0xa8) & ~0x03) | (3 - runtime->channels));
+		snd_es1688_write(chip, 0xb9, 2);	/* demand mode (4 bytes/request) */
+		if (runtime->channels == 1) {
+			if (snd_pcm_format_width(runtime->format) == 8) {
+				/* 8. bit mono */
+				snd_es1688_write(chip, 0xb7, 0x51);
+				snd_es1688_write(chip, 0xb7, 0xd0);
+			} else {
+				/* 16. bit mono */
+				snd_es1688_write(chip, 0xb7, 0x71);
+				snd_es1688_write(chip, 0xb7, 0xf4);
+			}
 		} else {
-			/* 16. bit mono */
-			snd_es1688_write(chip, 0xb7, 0x71);
-			snd_es1688_write(chip, 0xb7, 0xf4);
-		}
-	} else {
-		if (snd_pcm_format_width(runtime->format) == 8) {
-			/* 8. bit stereo */
-			snd_es1688_write(chip, 0xb7, 0x51);
-			snd_es1688_write(chip, 0xb7, 0x98);
-		} else {
-			/* 16. bit stereo */
-			snd_es1688_write(chip, 0xb7, 0x71);
-			snd_es1688_write(chip, 0xb7, 0xbc);
+			if (snd_pcm_format_width(runtime->format) == 8) {
+				/* 8. bit stereo */
+				snd_es1688_write(chip, 0xb7, 0x51);
+				snd_es1688_write(chip, 0xb7, 0x98);
+			} else {
+				/* 16. bit stereo */
+				snd_es1688_write(chip, 0xb7, 0x71);
+				snd_es1688_write(chip, 0xb7, 0xbc);
+			}
 		}
+		snd_es1688_write(chip, 0xb1, (snd_es1688_read(chip, 0xb1) & 0x0f) | 0x50);
+		snd_es1688_write(chip, 0xb2, (snd_es1688_read(chip, 0xb2) & 0x0f) | 0x50);
 	}
-	snd_es1688_write(chip, 0xb1, (snd_es1688_read(chip, 0xb1) & 0x0f) | 0x50);
-	snd_es1688_write(chip, 0xb2, (snd_es1688_read(chip, 0xb2) & 0x0f) | 0x50);
-	spin_unlock_irqrestore(&chip->reg_lock, flags);
 	/* --- */
 	count = -count;
 	snd_dma_program(chip->dma8, runtime->dma_addr, size, DMA_MODE_READ | DMA_AUTOINIT);
-	spin_lock_irqsave(&chip->reg_lock, flags);
-	snd_es1688_write(chip, 0xa4, (unsigned char) count);
-	snd_es1688_write(chip, 0xa5, (unsigned char) (count >> 8));
-	spin_unlock_irqrestore(&chip->reg_lock, flags);
+	scoped_guard(spinlock_irqsave, &chip->reg_lock) {
+		snd_es1688_write(chip, 0xa4, (unsigned char) count);
+		snd_es1688_write(chip, 0xa5, (unsigned char) (count >> 8));
+	}
 	return 0;
 }
 
@@ -738,19 +728,17 @@ static int snd_es1688_get_mux(struct snd_kcontrol *kcontrol, struct snd_ctl_elem
 static int snd_es1688_put_mux(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_es1688 *chip = snd_kcontrol_chip(kcontrol);
-	unsigned long flags;
 	unsigned char oval, nval;
 	int change;
 	
 	if (ucontrol->value.enumerated.item[0] > 8)
 		return -EINVAL;
-	spin_lock_irqsave(&chip->reg_lock, flags);
+	guard(spinlock_irqsave)(&chip->reg_lock);
 	oval = snd_es1688_mixer_read(chip, ES1688_REC_DEV);
 	nval = (ucontrol->value.enumerated.item[0] & 7) | (oval & ~15);
 	change = nval != oval;
 	if (change)
 		snd_es1688_mixer_write(chip, ES1688_REC_DEV, nval);
-	spin_unlock_irqrestore(&chip->reg_lock, flags);
 	return change;
 }
 
@@ -774,15 +762,13 @@ static int snd_es1688_info_single(struct snd_kcontrol *kcontrol, struct snd_ctl_
 static int snd_es1688_get_single(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_es1688 *chip = snd_kcontrol_chip(kcontrol);
-	unsigned long flags;
 	int reg = kcontrol->private_value & 0xff;
 	int shift = (kcontrol->private_value >> 8) & 0xff;
 	int mask = (kcontrol->private_value >> 16) & 0xff;
 	int invert = (kcontrol->private_value >> 24) & 0xff;
 	
-	spin_lock_irqsave(&chip->reg_lock, flags);
+	guard(spinlock_irqsave)(&chip->reg_lock);
 	ucontrol->value.integer.value[0] = (snd_es1688_mixer_read(chip, reg) >> shift) & mask;
-	spin_unlock_irqrestore(&chip->reg_lock, flags);
 	if (invert)
 		ucontrol->value.integer.value[0] = mask - ucontrol->value.integer.value[0];
 	return 0;
@@ -791,7 +777,6 @@ static int snd_es1688_get_single(struct snd_kcontrol *kcontrol, struct snd_ctl_e
 static int snd_es1688_put_single(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_es1688 *chip = snd_kcontrol_chip(kcontrol);
-	unsigned long flags;
 	int reg = kcontrol->private_value & 0xff;
 	int shift = (kcontrol->private_value >> 8) & 0xff;
 	int mask = (kcontrol->private_value >> 16) & 0xff;
@@ -803,13 +788,12 @@ static int snd_es1688_put_single(struct snd_kcontrol *kcontrol, struct snd_ctl_e
 	if (invert)
 		nval = mask - nval;
 	nval <<= shift;
-	spin_lock_irqsave(&chip->reg_lock, flags);
+	guard(spinlock_irqsave)(&chip->reg_lock);
 	oval = snd_es1688_mixer_read(chip, reg);
 	nval = (oval & ~(mask << shift)) | nval;
 	change = nval != oval;
 	if (change)
 		snd_es1688_mixer_write(chip, reg, nval);
-	spin_unlock_irqrestore(&chip->reg_lock, flags);
 	return change;
 }
 
@@ -833,7 +817,6 @@ static int snd_es1688_info_double(struct snd_kcontrol *kcontrol, struct snd_ctl_
 static int snd_es1688_get_double(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_es1688 *chip = snd_kcontrol_chip(kcontrol);
-	unsigned long flags;
 	int left_reg = kcontrol->private_value & 0xff;
 	int right_reg = (kcontrol->private_value >> 8) & 0xff;
 	int shift_left = (kcontrol->private_value >> 16) & 0x07;
@@ -842,7 +825,7 @@ static int snd_es1688_get_double(struct snd_kcontrol *kcontrol, struct snd_ctl_e
 	int invert = (kcontrol->private_value >> 22) & 1;
 	unsigned char left, right;
 	
-	spin_lock_irqsave(&chip->reg_lock, flags);
+	guard(spinlock_irqsave)(&chip->reg_lock);
 	if (left_reg < 0xa0)
 		left = snd_es1688_mixer_read(chip, left_reg);
 	else
@@ -854,7 +837,6 @@ static int snd_es1688_get_double(struct snd_kcontrol *kcontrol, struct snd_ctl_e
 			right = snd_es1688_read(chip, right_reg);
 	} else
 		right = left;
-	spin_unlock_irqrestore(&chip->reg_lock, flags);
 	ucontrol->value.integer.value[0] = (left >> shift_left) & mask;
 	ucontrol->value.integer.value[1] = (right >> shift_right) & mask;
 	if (invert) {
@@ -867,7 +849,6 @@ static int snd_es1688_get_double(struct snd_kcontrol *kcontrol, struct snd_ctl_e
 static int snd_es1688_put_double(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_es1688 *chip = snd_kcontrol_chip(kcontrol);
-	unsigned long flags;
 	int left_reg = kcontrol->private_value & 0xff;
 	int right_reg = (kcontrol->private_value >> 8) & 0xff;
 	int shift_left = (kcontrol->private_value >> 16) & 0x07;
@@ -885,7 +866,7 @@ static int snd_es1688_put_double(struct snd_kcontrol *kcontrol, struct snd_ctl_e
 	}
 	val1 <<= shift_left;
 	val2 <<= shift_right;
-	spin_lock_irqsave(&chip->reg_lock, flags);
+	guard(spinlock_irqsave)(&chip->reg_lock);
 	if (left_reg != right_reg) {
 		if (left_reg < 0xa0)
 			oval1 = snd_es1688_mixer_read(chip, left_reg);
@@ -923,7 +904,6 @@ static int snd_es1688_put_double(struct snd_kcontrol *kcontrol, struct snd_ctl_e
 		}
 			
 	}
-	spin_unlock_irqrestore(&chip->reg_lock, flags);
 	return change;
 }
 
-- 
2.50.1

