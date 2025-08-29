Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A640029E110
	for <linux-sound@vger.kernel.org>; Fri, 29 Aug 2025 14:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756479194; cv=none; b=k7PhGtQ2Hsn58Rqedy/fLu7IvSgwFLwAwOXK3iSvu3y5l5jYffcbA+Jctj3SnVUiByJx0be0LyFCnN9OtDhhmnVO+nNubeCI7kxzgJ/BYfxx/WE78I92kQFUKKbc9+IRefbxKU00rOWZDGNPWo95n92lq/QuWYmYnaCXdC9PXxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756479194; c=relaxed/simple;
	bh=lgUi6ESa6dG82CoATIPFhRscFR3FOfDsW6UNpcgM3JA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LZCG9u2Vb6ZJ9YuVMt7qAkLh1NNjHbaBKkGiRWgCyyCoT8PlxOmfHMOFw+xeIII9Pb0HiCmQl7zto1b1bZFlww+o3eYmG0mNpXXiHPUazJhKRUjD67kEm1wDp9dJ2tWn3PUkKz5Ecwa7FTRJeJRHthOeujaN4eNv9GaEukCZMz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=LzW2SE4y; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=BqbhxFDV; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=LzW2SE4y; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=BqbhxFDV; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="LzW2SE4y";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="BqbhxFDV";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="LzW2SE4y";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="BqbhxFDV"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id CA7255C240;
	Fri, 29 Aug 2025 14:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756479190; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IdbRbQDZSVK9g529GK358sAh9hm2AM02IXbT63EnlLw=;
	b=LzW2SE4y+jtN46/SrdZM1+/jb2gITrTEuyMmCGkf9sVVRlnSAHFZXs+KlbdI+3P/JBhnIE
	XP3bN2WK2eF9gkdcCxPvIHBbSTpkLdpwqnZ/JHBtfCHVESsVc4dXBI5+MgCE1KPQ/2frQ+
	AbCNnPBx7slnGiu2sgMheQvneQPpacQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756479190;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IdbRbQDZSVK9g529GK358sAh9hm2AM02IXbT63EnlLw=;
	b=BqbhxFDVIOYz42kSsp2b5H7kKFw0DgPf0w4YMAZdCCSUaKZK6b1ipDmy9yuOBO4N9dGDn2
	ngaEY7HI5+b9u7Dg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=LzW2SE4y;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=BqbhxFDV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756479190; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IdbRbQDZSVK9g529GK358sAh9hm2AM02IXbT63EnlLw=;
	b=LzW2SE4y+jtN46/SrdZM1+/jb2gITrTEuyMmCGkf9sVVRlnSAHFZXs+KlbdI+3P/JBhnIE
	XP3bN2WK2eF9gkdcCxPvIHBbSTpkLdpwqnZ/JHBtfCHVESsVc4dXBI5+MgCE1KPQ/2frQ+
	AbCNnPBx7slnGiu2sgMheQvneQPpacQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756479190;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IdbRbQDZSVK9g529GK358sAh9hm2AM02IXbT63EnlLw=;
	b=BqbhxFDVIOYz42kSsp2b5H7kKFw0DgPf0w4YMAZdCCSUaKZK6b1ipDmy9yuOBO4N9dGDn2
	ngaEY7HI5+b9u7Dg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id ACD7F13A54;
	Fri, 29 Aug 2025 14:53:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id OPYRKda+sWhzGwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 29 Aug 2025 14:53:10 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 01/18] ALSA: ad1816a: Use guard() for spin locks
Date: Fri, 29 Aug 2025 16:52:41 +0200
Message-ID: <20250829145300.5460-2-tiwai@suse.de>
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
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:mid,suse.de:dkim,suse.de:email];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: CA7255C240
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01

Clean up the code using guard() for spin locks.

Merely code refactoring, and no behavior change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/isa/ad1816a/ad1816a_lib.c | 117 ++++++++++----------------------
 1 file changed, 37 insertions(+), 80 deletions(-)

diff --git a/sound/isa/ad1816a/ad1816a_lib.c b/sound/isa/ad1816a/ad1816a_lib.c
index 400ae547bcba..50f62304de61 100644
--- a/sound/isa/ad1816a/ad1816a_lib.c
+++ b/sound/isa/ad1816a/ad1816a_lib.c
@@ -96,14 +96,10 @@ static unsigned char snd_ad1816a_get_format(struct snd_ad1816a *chip,
 
 static int snd_ad1816a_open(struct snd_ad1816a *chip, unsigned int mode)
 {
-	unsigned long flags;
+	guard(spinlock_irqsave)(&chip->lock);
 
-	spin_lock_irqsave(&chip->lock, flags);
-
-	if (chip->mode & mode) {
-		spin_unlock_irqrestore(&chip->lock, flags);
+	if (chip->mode & mode)
 		return -EAGAIN;
-	}
 
 	switch ((mode &= AD1816A_MODE_OPEN)) {
 	case AD1816A_MODE_PLAYBACK:
@@ -126,15 +122,12 @@ static int snd_ad1816a_open(struct snd_ad1816a *chip, unsigned int mode)
 	}
 	chip->mode |= mode;
 
-	spin_unlock_irqrestore(&chip->lock, flags);
 	return 0;
 }
 
 static void snd_ad1816a_close(struct snd_ad1816a *chip, unsigned int mode)
 {
-	unsigned long flags;
-
-	spin_lock_irqsave(&chip->lock, flags);
+	guard(spinlock_irqsave)(&chip->lock);
 
 	switch ((mode &= AD1816A_MODE_OPEN)) {
 	case AD1816A_MODE_PLAYBACK:
@@ -158,8 +151,6 @@ static void snd_ad1816a_close(struct snd_ad1816a *chip, unsigned int mode)
 	chip->mode &= ~mode;
 	if (!(chip->mode & AD1816A_MODE_OPEN))
 		chip->mode = 0;
-
-	spin_unlock_irqrestore(&chip->lock, flags);
 }
 
 
@@ -171,19 +162,19 @@ static int snd_ad1816a_trigger(struct snd_ad1816a *chip, unsigned char what,
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_STOP:
-		spin_lock(&chip->lock);
-		cmd = (cmd == SNDRV_PCM_TRIGGER_START) ? 0xff: 0x00;
-		/* if (what & AD1816A_PLAYBACK_ENABLE) */
-		/* That is not valid, because playback and capture enable
-		 * are the same bit pattern, just to different addresses
-		 */
-		if (! iscapture)
-			snd_ad1816a_out_mask(chip, AD1816A_PLAYBACK_CONFIG,
-				AD1816A_PLAYBACK_ENABLE, cmd);
-		else
-			snd_ad1816a_out_mask(chip, AD1816A_CAPTURE_CONFIG,
-				AD1816A_CAPTURE_ENABLE, cmd);
-		spin_unlock(&chip->lock);
+		scoped_guard(spinlock, &chip->lock) {
+			cmd = (cmd == SNDRV_PCM_TRIGGER_START) ? 0xff: 0x00;
+			/* if (what & AD1816A_PLAYBACK_ENABLE) */
+			/* That is not valid, because playback and capture enable
+			 * are the same bit pattern, just to different addresses
+			 */
+			if (!iscapture)
+				snd_ad1816a_out_mask(chip, AD1816A_PLAYBACK_CONFIG,
+						     AD1816A_PLAYBACK_ENABLE, cmd);
+			else
+				snd_ad1816a_out_mask(chip, AD1816A_CAPTURE_CONFIG,
+						     AD1816A_CAPTURE_ENABLE, cmd);
+		}
 		break;
 	default:
 		dev_warn(chip->card->dev, "invalid trigger mode 0x%x.\n", what);
@@ -210,11 +201,10 @@ static int snd_ad1816a_capture_trigger(struct snd_pcm_substream *substream, int
 static int snd_ad1816a_playback_prepare(struct snd_pcm_substream *substream)
 {
 	struct snd_ad1816a *chip = snd_pcm_substream_chip(substream);
-	unsigned long flags;
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	unsigned int size, rate;
 
-	spin_lock_irqsave(&chip->lock, flags);
+	guard(spinlock_irqsave)(&chip->lock);
 
 	chip->p_dma_size = size = snd_pcm_lib_buffer_bytes(substream);
 	snd_ad1816a_out_mask(chip, AD1816A_PLAYBACK_CONFIG,
@@ -234,19 +224,16 @@ static int snd_ad1816a_playback_prepare(struct snd_pcm_substream *substream)
 
 	snd_ad1816a_write(chip, AD1816A_PLAYBACK_BASE_COUNT,
 		snd_pcm_lib_period_bytes(substream) / 4 - 1);
-
-	spin_unlock_irqrestore(&chip->lock, flags);
 	return 0;
 }
 
 static int snd_ad1816a_capture_prepare(struct snd_pcm_substream *substream)
 {
 	struct snd_ad1816a *chip = snd_pcm_substream_chip(substream);
-	unsigned long flags;
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	unsigned int size, rate;
 
-	spin_lock_irqsave(&chip->lock, flags);
+	guard(spinlock_irqsave)(&chip->lock);
 
 	chip->c_dma_size = size = snd_pcm_lib_buffer_bytes(substream);
 	snd_ad1816a_out_mask(chip, AD1816A_CAPTURE_CONFIG,
@@ -266,8 +253,6 @@ static int snd_ad1816a_capture_prepare(struct snd_pcm_substream *substream)
 
 	snd_ad1816a_write(chip, AD1816A_CAPTURE_BASE_COUNT,
 		snd_pcm_lib_period_bytes(substream) / 4 - 1);
-
-	spin_unlock_irqrestore(&chip->lock, flags);
 	return 0;
 }
 
@@ -298,9 +283,9 @@ static irqreturn_t snd_ad1816a_interrupt(int irq, void *dev_id)
 	struct snd_ad1816a *chip = dev_id;
 	unsigned char status;
 
-	spin_lock(&chip->lock);
-	status = snd_ad1816a_in(chip, AD1816A_INTERRUPT_STATUS);
-	spin_unlock(&chip->lock);
+	scoped_guard(spinlock, &chip->lock) {
+		status = snd_ad1816a_in(chip, AD1816A_INTERRUPT_STATUS);
+	}
 
 	if ((status & AD1816A_PLAYBACK_IRQ_PENDING) && chip->playback_substream)
 		snd_pcm_period_elapsed(chip->playback_substream);
@@ -311,9 +296,9 @@ static irqreturn_t snd_ad1816a_interrupt(int irq, void *dev_id)
 	if ((status & AD1816A_TIMER_IRQ_PENDING) && chip->timer)
 		snd_timer_interrupt(chip->timer, chip->timer->sticks);
 
-	spin_lock(&chip->lock);
-	snd_ad1816a_out(chip, AD1816A_INTERRUPT_STATUS, 0x00);
-	spin_unlock(&chip->lock);
+	scoped_guard(spinlock, &chip->lock) {
+		snd_ad1816a_out(chip, AD1816A_INTERRUPT_STATUS, 0x00);
+	}
 	return IRQ_HANDLED;
 }
 
@@ -381,9 +366,9 @@ static unsigned long snd_ad1816a_timer_resolution(struct snd_timer *timer)
 static int snd_ad1816a_timer_start(struct snd_timer *timer)
 {
 	unsigned short bits;
-	unsigned long flags;
 	struct snd_ad1816a *chip = snd_timer_chip(timer);
-	spin_lock_irqsave(&chip->lock, flags);
+
+	guard(spinlock_irqsave)(&chip->lock);
 	bits = snd_ad1816a_read(chip, AD1816A_INTERRUPT_ENABLE);
 
 	if (!(bits & AD1816A_TIMER_ENABLE)) {
@@ -393,20 +378,16 @@ static int snd_ad1816a_timer_start(struct snd_timer *timer)
 		snd_ad1816a_write_mask(chip, AD1816A_INTERRUPT_ENABLE,
 			AD1816A_TIMER_ENABLE, 0xffff);
 	}
-	spin_unlock_irqrestore(&chip->lock, flags);
 	return 0;
 }
 
 static int snd_ad1816a_timer_stop(struct snd_timer *timer)
 {
-	unsigned long flags;
 	struct snd_ad1816a *chip = snd_timer_chip(timer);
-	spin_lock_irqsave(&chip->lock, flags);
 
+	guard(spinlock_irqsave)(&chip->lock);
 	snd_ad1816a_write_mask(chip, AD1816A_INTERRUPT_ENABLE,
 		AD1816A_TIMER_ENABLE, 0x0000);
-
-	spin_unlock_irqrestore(&chip->lock, flags);
 	return 0;
 }
 
@@ -474,9 +455,7 @@ static int snd_ad1816a_capture_close(struct snd_pcm_substream *substream)
 
 static void snd_ad1816a_init(struct snd_ad1816a *chip)
 {
-	unsigned long flags;
-
-	spin_lock_irqsave(&chip->lock, flags);
+	guard(spinlock_irqsave)(&chip->lock);
 
 	snd_ad1816a_out(chip, AD1816A_INTERRUPT_STATUS, 0x00);
 	snd_ad1816a_out_mask(chip, AD1816A_PLAYBACK_CONFIG,
@@ -488,40 +467,32 @@ static void snd_ad1816a_init(struct snd_ad1816a *chip)
 		AD1816A_CAPTURE_NOT_EQUAL | AD1816A_WSS_ENABLE, 0xffff);
 	snd_ad1816a_write(chip, AD1816A_DSP_CONFIG, 0x0000);
 	snd_ad1816a_write(chip, AD1816A_POWERDOWN_CTRL, 0x0000);
-
-	spin_unlock_irqrestore(&chip->lock, flags);
 }
 
 #ifdef CONFIG_PM
 void snd_ad1816a_suspend(struct snd_ad1816a *chip)
 {
 	int reg;
-	unsigned long flags;
 
-	spin_lock_irqsave(&chip->lock, flags);
+	guard(spinlock_irqsave)(&chip->lock);
 	for (reg = 0; reg < 48; reg++)
 		chip->image[reg] = snd_ad1816a_read(chip, reg);
-	spin_unlock_irqrestore(&chip->lock, flags);
 }
 
 void snd_ad1816a_resume(struct snd_ad1816a *chip)
 {
 	int reg;
-	unsigned long flags;
 
 	snd_ad1816a_init(chip);
-	spin_lock_irqsave(&chip->lock, flags);
+	guard(spinlock_irqsave)(&chip->lock);
 	for (reg = 0; reg < 48; reg++)
 		snd_ad1816a_write(chip, reg, chip->image[reg]);
-	spin_unlock_irqrestore(&chip->lock, flags);
 }
 #endif
 
 static int snd_ad1816a_probe(struct snd_ad1816a *chip)
 {
-	unsigned long flags;
-
-	spin_lock_irqsave(&chip->lock, flags);
+	guard(spinlock_irqsave)(&chip->lock);
 
 	switch (chip->version = snd_ad1816a_read(chip, AD1816A_VERSION_ID)) {
 	case 0:
@@ -536,8 +507,6 @@ static int snd_ad1816a_probe(struct snd_ad1816a *chip)
 	default:
 		chip->hardware = AD1816A_HW_AUTO;
 	}
-
-	spin_unlock_irqrestore(&chip->lock, flags);
 	return 0;
 }
 
@@ -679,12 +648,10 @@ static int snd_ad1816a_info_mux(struct snd_kcontrol *kcontrol, struct snd_ctl_el
 static int snd_ad1816a_get_mux(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_ad1816a *chip = snd_kcontrol_chip(kcontrol);
-	unsigned long flags;
 	unsigned short val;
 	
-	spin_lock_irqsave(&chip->lock, flags);
+	guard(spinlock_irqsave)(&chip->lock);
 	val = snd_ad1816a_read(chip, AD1816A_ADC_SOURCE_SEL);
-	spin_unlock_irqrestore(&chip->lock, flags);
 	ucontrol->value.enumerated.item[0] = (val >> 12) & 7;
 	ucontrol->value.enumerated.item[1] = (val >> 4) & 7;
 	return 0;
@@ -693,7 +660,6 @@ static int snd_ad1816a_get_mux(struct snd_kcontrol *kcontrol, struct snd_ctl_ele
 static int snd_ad1816a_put_mux(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_ad1816a *chip = snd_kcontrol_chip(kcontrol);
-	unsigned long flags;
 	unsigned short val;
 	int change;
 	
@@ -702,10 +668,9 @@ static int snd_ad1816a_put_mux(struct snd_kcontrol *kcontrol, struct snd_ctl_ele
 		return -EINVAL;
 	val = (ucontrol->value.enumerated.item[0] << 12) |
 	      (ucontrol->value.enumerated.item[1] << 4);
-	spin_lock_irqsave(&chip->lock, flags);
+	guard(spinlock_irqsave)(&chip->lock);
 	change = snd_ad1816a_read(chip, AD1816A_ADC_SOURCE_SEL) != val;
 	snd_ad1816a_write(chip, AD1816A_ADC_SOURCE_SEL, val);
-	spin_unlock_irqrestore(&chip->lock, flags);
 	return change;
 }
 
@@ -735,15 +700,13 @@ static int snd_ad1816a_info_single(struct snd_kcontrol *kcontrol, struct snd_ctl
 static int snd_ad1816a_get_single(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_ad1816a *chip = snd_kcontrol_chip(kcontrol);
-	unsigned long flags;
 	int reg = kcontrol->private_value & 0xff;
 	int shift = (kcontrol->private_value >> 8) & 0xff;
 	int mask = (kcontrol->private_value >> 16) & 0xff;
 	int invert = (kcontrol->private_value >> 24) & 0xff;
 	
-	spin_lock_irqsave(&chip->lock, flags);
+	guard(spinlock_irqsave)(&chip->lock);
 	ucontrol->value.integer.value[0] = (snd_ad1816a_read(chip, reg) >> shift) & mask;
-	spin_unlock_irqrestore(&chip->lock, flags);
 	if (invert)
 		ucontrol->value.integer.value[0] = mask - ucontrol->value.integer.value[0];
 	return 0;
@@ -752,7 +715,6 @@ static int snd_ad1816a_get_single(struct snd_kcontrol *kcontrol, struct snd_ctl_
 static int snd_ad1816a_put_single(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_ad1816a *chip = snd_kcontrol_chip(kcontrol);
-	unsigned long flags;
 	int reg = kcontrol->private_value & 0xff;
 	int shift = (kcontrol->private_value >> 8) & 0xff;
 	int mask = (kcontrol->private_value >> 16) & 0xff;
@@ -764,12 +726,11 @@ static int snd_ad1816a_put_single(struct snd_kcontrol *kcontrol, struct snd_ctl_
 	if (invert)
 		val = mask - val;
 	val <<= shift;
-	spin_lock_irqsave(&chip->lock, flags);
+	guard(spinlock_irqsave)(&chip->lock);
 	old_val = snd_ad1816a_read(chip, reg);
 	val = (old_val & ~(mask << shift)) | val;
 	change = val != old_val;
 	snd_ad1816a_write(chip, reg, val);
-	spin_unlock_irqrestore(&chip->lock, flags);
 	return change;
 }
 
@@ -800,7 +761,6 @@ static int snd_ad1816a_info_double(struct snd_kcontrol *kcontrol, struct snd_ctl
 static int snd_ad1816a_get_double(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_ad1816a *chip = snd_kcontrol_chip(kcontrol);
-	unsigned long flags;
 	int reg = kcontrol->private_value & 0xff;
 	int shift_left = (kcontrol->private_value >> 8) & 0x0f;
 	int shift_right = (kcontrol->private_value >> 12) & 0x0f;
@@ -808,11 +768,10 @@ static int snd_ad1816a_get_double(struct snd_kcontrol *kcontrol, struct snd_ctl_
 	int invert = (kcontrol->private_value >> 24) & 0xff;
 	unsigned short val;
 	
-	spin_lock_irqsave(&chip->lock, flags);
+	guard(spinlock_irqsave)(&chip->lock);
 	val = snd_ad1816a_read(chip, reg);
 	ucontrol->value.integer.value[0] = (val >> shift_left) & mask;
 	ucontrol->value.integer.value[1] = (val >> shift_right) & mask;
-	spin_unlock_irqrestore(&chip->lock, flags);
 	if (invert) {
 		ucontrol->value.integer.value[0] = mask - ucontrol->value.integer.value[0];
 		ucontrol->value.integer.value[1] = mask - ucontrol->value.integer.value[1];
@@ -823,7 +782,6 @@ static int snd_ad1816a_get_double(struct snd_kcontrol *kcontrol, struct snd_ctl_
 static int snd_ad1816a_put_double(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_ad1816a *chip = snd_kcontrol_chip(kcontrol);
-	unsigned long flags;
 	int reg = kcontrol->private_value & 0xff;
 	int shift_left = (kcontrol->private_value >> 8) & 0x0f;
 	int shift_right = (kcontrol->private_value >> 12) & 0x0f;
@@ -840,12 +798,11 @@ static int snd_ad1816a_put_double(struct snd_kcontrol *kcontrol, struct snd_ctl_
 	}
 	val1 <<= shift_left;
 	val2 <<= shift_right;
-	spin_lock_irqsave(&chip->lock, flags);
+	guard(spinlock_irqsave)(&chip->lock);
 	old_val = snd_ad1816a_read(chip, reg);
 	val1 = (old_val & ~((mask << shift_left) | (mask << shift_right))) | val1 | val2;
 	change = val1 != old_val;
 	snd_ad1816a_write(chip, reg, val1);
-	spin_unlock_irqrestore(&chip->lock, flags);
 	return change;
 }
 
-- 
2.50.1

