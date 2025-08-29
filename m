Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EAED313E0A
	for <linux-sound@vger.kernel.org>; Fri, 29 Aug 2025 14:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756478748; cv=none; b=tiKlKEwfY9rdbU72IA3aaZrtRYCCG8zvmfycEBUXLuNZkpGCEHGcJsYDDSpAKWwGzAlyHSb1wKjoBG8mPCIOiK7Ap/ZdxsN5Ci3tWA4S68QtoKh13ENC8r2az0Qun9qUg5DcqZibJyG0rya05OM00//DvfTZXwz/axe2kOUUe3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756478748; c=relaxed/simple;
	bh=vEfKl54Dd8wqa0sC3Um2PLWOu6gqMppgl8mleR8mvbQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hjPppItwU0BmwybPZ4Dgp3+mzofiKKOJb+RKTJ5ZK4D3JH7EDfS06piCTYB+SDC0DKrfA8k9s7KWQl9iHV6Gv+FcSQjOLMEYU3khBKd9chQtgJw0ti+dOch4Qsd6ERJ+QBkFlPhvWdaj1tlAW7TpnOa/K7+4tOotuth+Xq3A3UE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=PkzXk/M2; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=T6LkuuLv; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=PkzXk/M2; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=T6LkuuLv; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="PkzXk/M2";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="T6LkuuLv";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="PkzXk/M2";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="T6LkuuLv"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D072A5C234;
	Fri, 29 Aug 2025 14:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756478640; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NHaHOzFp0yqnM11vSIIMquYgm6AJxYrAb45xwe1U+Rs=;
	b=PkzXk/M2GweRpQD1eqrv8g1zgHi6gmQN07TL5lI6Njv6SSzNZ5CKoHYl5tvfg/AwYXrnyq
	zjYOBQpXS3b84IjTi5ZVz3iXh8z1DSHUG4BBtkpKMS0Hh9jV3w26MJGgSvdPbvnMeBPOuo
	jor7qf8FY2QzN4MyY7yXmKoE+iEh8sU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756478640;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NHaHOzFp0yqnM11vSIIMquYgm6AJxYrAb45xwe1U+Rs=;
	b=T6LkuuLvauqgMtrNSoCQdqKezfnjJfZfQG030pk5C914qAESfIBgVK3CMmA/2yXC5Uy8Pg
	zBiqMfz03zGSSyCg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756478640; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NHaHOzFp0yqnM11vSIIMquYgm6AJxYrAb45xwe1U+Rs=;
	b=PkzXk/M2GweRpQD1eqrv8g1zgHi6gmQN07TL5lI6Njv6SSzNZ5CKoHYl5tvfg/AwYXrnyq
	zjYOBQpXS3b84IjTi5ZVz3iXh8z1DSHUG4BBtkpKMS0Hh9jV3w26MJGgSvdPbvnMeBPOuo
	jor7qf8FY2QzN4MyY7yXmKoE+iEh8sU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756478640;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NHaHOzFp0yqnM11vSIIMquYgm6AJxYrAb45xwe1U+Rs=;
	b=T6LkuuLvauqgMtrNSoCQdqKezfnjJfZfQG030pk5C914qAESfIBgVK3CMmA/2yXC5Uy8Pg
	zBiqMfz03zGSSyCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B855213A54;
	Fri, 29 Aug 2025 14:44:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id gKThK7C8sWi6GAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 29 Aug 2025 14:44:00 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 32/61] ALSA: es1968: Use guard() for spin locks
Date: Fri, 29 Aug 2025 16:43:07 +0200
Message-ID: <20250829144342.4290-33-tiwai@suse.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250829144342.4290-1-tiwai@suse.de>
References: <20250829144342.4290-1-tiwai@suse.de>
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
 sound/pci/es1968.c | 146 +++++++++++++++++----------------------------
 1 file changed, 54 insertions(+), 92 deletions(-)

diff --git a/sound/pci/es1968.c b/sound/pci/es1968.c
index a9344c0bcf6b..51aee2c4d461 100644
--- a/sound/pci/es1968.c
+++ b/sound/pci/es1968.c
@@ -574,10 +574,8 @@ static void __maestro_write(struct es1968 *chip, u16 reg, u16 data)
 
 static inline void maestro_write(struct es1968 *chip, u16 reg, u16 data)
 {
-	unsigned long flags;
-	spin_lock_irqsave(&chip->reg_lock, flags);
+	guard(spinlock_irqsave)(&chip->reg_lock);
 	__maestro_write(chip, reg, data);
-	spin_unlock_irqrestore(&chip->reg_lock, flags);
 }
 
 /* no spinlock */
@@ -592,12 +590,8 @@ static u16 __maestro_read(struct es1968 *chip, u16 reg)
 
 static inline u16 maestro_read(struct es1968 *chip, u16 reg)
 {
-	unsigned long flags;
-	u16 result;
-	spin_lock_irqsave(&chip->reg_lock, flags);
-	result = __maestro_read(chip, reg);
-	spin_unlock_irqrestore(&chip->reg_lock, flags);
-	return result;
+	guard(spinlock_irqsave)(&chip->reg_lock);
+	return __maestro_read(chip, reg);
 }
 
 /* Wait for the codec bus to be free */
@@ -693,10 +687,8 @@ static void __apu_set_register(struct es1968 *chip, u16 channel, u8 reg, u16 dat
 
 static void apu_set_register(struct es1968 *chip, u16 channel, u8 reg, u16 data)
 {
-	unsigned long flags;
-	spin_lock_irqsave(&chip->reg_lock, flags);
+	guard(spinlock_irqsave)(&chip->reg_lock);
 	__apu_set_register(chip, channel, reg, data);
-	spin_unlock_irqrestore(&chip->reg_lock, flags);
 }
 
 static u16 __apu_get_register(struct es1968 *chip, u16 channel, u8 reg)
@@ -710,62 +702,40 @@ static u16 __apu_get_register(struct es1968 *chip, u16 channel, u8 reg)
 
 static u16 apu_get_register(struct es1968 *chip, u16 channel, u8 reg)
 {
-	unsigned long flags;
-	u16 v;
-	spin_lock_irqsave(&chip->reg_lock, flags);
-	v = __apu_get_register(chip, channel, reg);
-	spin_unlock_irqrestore(&chip->reg_lock, flags);
-	return v;
+	guard(spinlock_irqsave)(&chip->reg_lock);
+	return __apu_get_register(chip, channel, reg);
 }
 
 #if 0 /* ASSP is not supported */
 
 static void assp_set_register(struct es1968 *chip, u32 reg, u32 value)
 {
-	unsigned long flags;
-
-	spin_lock_irqsave(&chip->reg_lock, flags);
+	guard(spinlock_irqsave),(&chip->reg_lock);
 	outl(reg, chip->io_port + ASSP_INDEX);
 	outl(value, chip->io_port + ASSP_DATA);
-	spin_unlock_irqrestore(&chip->reg_lock, flags);
 }
 
 static u32 assp_get_register(struct es1968 *chip, u32 reg)
 {
-	unsigned long flags;
-	u32 value;
-
-	spin_lock_irqsave(&chip->reg_lock, flags);
+	guard(spinlock_irqsave)(&chip->reg_lock);
 	outl(reg, chip->io_port + ASSP_INDEX);
-	value = inl(chip->io_port + ASSP_DATA);
-	spin_unlock_irqrestore(&chip->reg_lock, flags);
-
-	return value;
+	return inl(chip->io_port + ASSP_DATA);
 }
 
 #endif
 
 static void wave_set_register(struct es1968 *chip, u16 reg, u16 value)
 {
-	unsigned long flags;
-
-	spin_lock_irqsave(&chip->reg_lock, flags);
+	guard(spinlock_irqsave)(&chip->reg_lock);
 	outw(reg, chip->io_port + WC_INDEX);
 	outw(value, chip->io_port + WC_DATA);
-	spin_unlock_irqrestore(&chip->reg_lock, flags);
 }
 
 static u16 wave_get_register(struct es1968 *chip, u16 reg)
 {
-	unsigned long flags;
-	u16 value;
-
-	spin_lock_irqsave(&chip->reg_lock, flags);
+	guard(spinlock_irqsave)(&chip->reg_lock);
 	outw(reg, chip->io_port + WC_INDEX);
-	value = inw(chip->io_port + WC_DATA);
-	spin_unlock_irqrestore(&chip->reg_lock, flags);
-
-	return value;
+	return inw(chip->io_port + WC_DATA);
 }
 
 /* *******************
@@ -924,7 +894,7 @@ static inline void snd_es1968_trigger_apu(struct es1968 *esm, int apu, int mode)
 
 static void snd_es1968_pcm_start(struct es1968 *chip, struct esschan *es)
 {
-	spin_lock(&chip->reg_lock);
+	guard(spinlock)(&chip->reg_lock);
 	__apu_set_register(chip, es->apu[0], 5, es->base[0]);
 	snd_es1968_trigger_apu(chip, es->apu[0], es->apu_mode[0]);
 	if (es->mode == ESM_MODE_CAPTURE) {
@@ -939,19 +909,17 @@ static void snd_es1968_pcm_start(struct es1968 *chip, struct esschan *es)
 			snd_es1968_trigger_apu(chip, es->apu[3], es->apu_mode[3]);
 		}
 	}
-	spin_unlock(&chip->reg_lock);
 }
 
 static void snd_es1968_pcm_stop(struct es1968 *chip, struct esschan *es)
 {
-	spin_lock(&chip->reg_lock);
+	guard(spinlock)(&chip->reg_lock);
 	snd_es1968_trigger_apu(chip, es->apu[0], 0);
 	snd_es1968_trigger_apu(chip, es->apu[1], 0);
 	if (es->mode == ESM_MODE_CAPTURE) {
 		snd_es1968_trigger_apu(chip, es->apu[2], 0);
 		snd_es1968_trigger_apu(chip, es->apu[3], 0);
 	}
-	spin_unlock(&chip->reg_lock);
 }
 
 /* set the wavecache control reg */
@@ -981,7 +949,6 @@ static void snd_es1968_playback_setup(struct es1968 *chip, struct esschan *es,
 	int high_apu = 0;
 	int channel, apu;
 	int i, size;
-	unsigned long flags;
 	u32 freq;
 
 	size = es->dma_size >> es->wav_shift;
@@ -1051,12 +1018,12 @@ static void snd_es1968_playback_setup(struct es1968 *chip, struct esschan *es,
 			apu_set_register(chip, apu, 10, 0x8F08);
 	}
 
-	spin_lock_irqsave(&chip->reg_lock, flags);
-	/* clear WP interrupts */
-	outw(1, chip->io_port + 0x04);
-	/* enable WP ints */
-	outw(inw(chip->io_port + ESM_PORT_HOST_IRQ) | ESM_HIRQ_DSIE, chip->io_port + ESM_PORT_HOST_IRQ);
-	spin_unlock_irqrestore(&chip->reg_lock, flags);
+	scoped_guard(spinlock_irqsave, &chip->reg_lock) {
+		/* clear WP interrupts */
+		outw(1, chip->io_port + 0x04);
+		/* enable WP ints */
+		outw(inw(chip->io_port + ESM_PORT_HOST_IRQ) | ESM_HIRQ_DSIE, chip->io_port + ESM_PORT_HOST_IRQ);
+	}
 
 	freq = runtime->rate;
 	/* set frequency */
@@ -1127,7 +1094,6 @@ static void snd_es1968_capture_setup(struct es1968 *chip, struct esschan *es,
 {
 	int size;
 	u32 freq;
-	unsigned long flags;
 
 	size = es->dma_size >> es->wav_shift;
 
@@ -1179,12 +1145,11 @@ static void snd_es1968_capture_setup(struct es1968 *chip, struct esschan *es,
 	snd_es1968_apu_set_freq(chip, es->apu[2], freq);
 	snd_es1968_apu_set_freq(chip, es->apu[3], freq);
 
-	spin_lock_irqsave(&chip->reg_lock, flags);
+	guard(spinlock_irqsave)(&chip->reg_lock);
 	/* clear WP interrupts */
 	outw(1, chip->io_port + 0x04);
 	/* enable WP ints */
 	outw(inw(chip->io_port + ESM_PORT_HOST_IRQ) | ESM_HIRQ_DSIE, chip->io_port + ESM_PORT_HOST_IRQ);
-	spin_unlock_irqrestore(&chip->reg_lock, flags);
 }
 
 /*******************
@@ -1228,7 +1193,7 @@ static int snd_es1968_pcm_trigger(struct snd_pcm_substream *substream, int cmd)
 	struct es1968 *chip = snd_pcm_substream_chip(substream);
 	struct esschan *es = substream->runtime->private_data;
 
-	spin_lock(&chip->substream_lock);
+	guard(spinlock)(&chip->substream_lock);
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_RESUME:
@@ -1249,7 +1214,6 @@ static int snd_es1968_pcm_trigger(struct snd_pcm_substream *substream, int cmd)
 		snd_es1968_bob_dec(chip);
 		break;
 	}
-	spin_unlock(&chip->substream_lock);
 	return 0;
 }
 
@@ -1543,9 +1507,8 @@ static int snd_es1968_playback_open(struct snd_pcm_substream *substream)
 	runtime->hw.buffer_bytes_max = runtime->hw.period_bytes_max =
 		calc_available_memory_size(chip);
 
-	spin_lock_irq(&chip->substream_lock);
+	guard(spinlock_irq)(&chip->substream_lock);
 	list_add(&es->list, &chip->substream_list);
-	spin_unlock_irq(&chip->substream_lock);
 
 	return 0;
 }
@@ -1603,9 +1566,8 @@ static int snd_es1968_capture_open(struct snd_pcm_substream *substream)
 	if (err < 0)
 		return err;
 
-	spin_lock_irq(&chip->substream_lock);
+	guard(spinlock_irq)(&chip->substream_lock);
 	list_add(&es->list, &chip->substream_list);
-	spin_unlock_irq(&chip->substream_lock);
 
 	return 0;
 }
@@ -1618,9 +1580,9 @@ static int snd_es1968_playback_close(struct snd_pcm_substream *substream)
 	if (substream->runtime->private_data == NULL)
 		return 0;
 	es = substream->runtime->private_data;
-	spin_lock_irq(&chip->substream_lock);
-	list_del(&es->list);
-	spin_unlock_irq(&chip->substream_lock);
+	scoped_guard(spinlock_irq, &chip->substream_lock) {
+		list_del(&es->list);
+	}
 	snd_es1968_free_apu_pair(chip, es->apu[0]);
 	kfree(es);
 
@@ -1635,9 +1597,9 @@ static int snd_es1968_capture_close(struct snd_pcm_substream *substream)
 	if (substream->runtime->private_data == NULL)
 		return 0;
 	es = substream->runtime->private_data;
-	spin_lock_irq(&chip->substream_lock);
-	list_del(&es->list);
-	spin_unlock_irq(&chip->substream_lock);
+	scoped_guard(spinlock_irq, &chip->substream_lock) {
+		list_del(&es->list);
+	}
 	snd_es1968_free_memory(chip, es->mixbuf);
 	snd_es1968_free_apu_pair(chip, es->apu[0]);
 	snd_es1968_free_apu_pair(chip, es->apu[2]);
@@ -1718,29 +1680,29 @@ static void es1968_measure_clock(struct es1968 *chip)
 	apu_set_register(chip, apu, 9, 0xD000);
 	apu_set_register(chip, apu, 10, 0x8F08);
 	apu_set_register(chip, apu, 11, 0x0000);
-	spin_lock_irq(&chip->reg_lock);
-	outw(1, chip->io_port + 0x04); /* clear WP interrupts */
-	outw(inw(chip->io_port + ESM_PORT_HOST_IRQ) | ESM_HIRQ_DSIE, chip->io_port + ESM_PORT_HOST_IRQ); /* enable WP ints */
-	spin_unlock_irq(&chip->reg_lock);
+	scoped_guard(spinlock_irq, &chip->reg_lock) {
+		outw(1, chip->io_port + 0x04); /* clear WP interrupts */
+		outw(inw(chip->io_port + ESM_PORT_HOST_IRQ) | ESM_HIRQ_DSIE, chip->io_port + ESM_PORT_HOST_IRQ); /* enable WP ints */
+	}
 
 	snd_es1968_apu_set_freq(chip, apu, ((unsigned int)48000 << 16) / chip->clock); /* 48000 Hz */
 
 	chip->in_measurement = 1;
 	chip->measure_apu = apu;
-	spin_lock_irq(&chip->reg_lock);
-	snd_es1968_bob_inc(chip, ESM_BOB_FREQ);
-	__apu_set_register(chip, apu, 5, pa & 0xffff);
-	snd_es1968_trigger_apu(chip, apu, ESM_APU_16BITLINEAR);
-	start_time = ktime_get();
-	spin_unlock_irq(&chip->reg_lock);
+	scoped_guard(spinlock_irq, &chip->reg_lock) {
+		snd_es1968_bob_inc(chip, ESM_BOB_FREQ);
+		__apu_set_register(chip, apu, 5, pa & 0xffff);
+		snd_es1968_trigger_apu(chip, apu, ESM_APU_16BITLINEAR);
+		start_time = ktime_get();
+	}
 	msleep(50);
-	spin_lock_irq(&chip->reg_lock);
-	offset = __apu_get_register(chip, apu, 5);
-	stop_time = ktime_get();
-	snd_es1968_trigger_apu(chip, apu, 0); /* stop */
-	snd_es1968_bob_dec(chip);
-	chip->in_measurement = 0;
-	spin_unlock_irq(&chip->reg_lock);
+	scoped_guard(spinlock_irq, &chip->reg_lock) {
+		offset = __apu_get_register(chip, apu, 5);
+		stop_time = ktime_get();
+		snd_es1968_trigger_apu(chip, apu, 0); /* stop */
+		snd_es1968_bob_dec(chip);
+		chip->in_measurement = 0;
+	}
 
 	/* check the current position */
 	offset -= (pa & 0xffff);
@@ -1964,15 +1926,15 @@ static irqreturn_t snd_es1968_interrupt(int irq, void *dev_id)
 
 	if (event & ESM_SOUND_IRQ) {
 		struct esschan *es;
-		spin_lock(&chip->substream_lock);
-		list_for_each_entry(es, &chip->substream_list, list) {
-			if (es->running) {
-				snd_es1968_update_pcm(chip, es);
-				if (es->fmt & ESS_FMT_STEREO)
-					snd_es1968_suppress_jitter(chip, es);
+		scoped_guard(spinlock, &chip->substream_lock) {
+			list_for_each_entry(es, &chip->substream_list, list) {
+				if (es->running) {
+					snd_es1968_update_pcm(chip, es);
+					if (es->fmt & ESS_FMT_STEREO)
+						snd_es1968_suppress_jitter(chip, es);
+				}
 			}
 		}
-		spin_unlock(&chip->substream_lock);
 		if (chip->in_measurement) {
 			unsigned int curp = __apu_get_register(chip, chip->measure_apu, 5);
 			if (curp < chip->measure_lastpos)
-- 
2.50.1

