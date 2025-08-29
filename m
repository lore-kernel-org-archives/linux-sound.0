Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC4EC19F115
	for <linux-sound@vger.kernel.org>; Fri, 29 Aug 2025 14:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756478823; cv=none; b=lWNCyfK45iPrSp7xw0WpVZlivA6+Yug7Fp99v6O6tGBwKZOkWIwp+ipKV3IqWjEPfi0RRMim6l8dLf85yvAD9PIFO04zNqyCz33T4aYGKsfSMTUpf+RZaC5QJqgg3Hlji6QigJZ6kiBtB9Mrj653XP/Q3tKGkXonEinmmzbbjhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756478823; c=relaxed/simple;
	bh=yEzXj910pGNJH22u/WX6wLx+3cB4wo41ij68vmQVTjI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f/uqryvV4WJb15hM+aFM6ti6ahx49wd+aVYf+DSypV1opG7N8UhQ1Ezu3YEom8ZRdQ3TLznLrgtTBPhsxQjJnXHiMUMjzXgPySYx3tQFvDkK/JCMb78MiAH2eEpotEzLj+2xJEPYpp/Jo944H1NPUcZ4Xa38ZVH0FAqm+j994tM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Qti2rrCT; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=3JBYPIv+; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=IdvSTz2R; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=yiMJPIzV; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Qti2rrCT";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="3JBYPIv+";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="IdvSTz2R";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="yiMJPIzV"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 5F3A05C238;
	Fri, 29 Aug 2025 14:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756478642; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XIdZItDHvDgXiKJt/P6Pte2IaAmbiHefDQLNZqm5sok=;
	b=Qti2rrCTXuR1w4QE9bCNIZf4JXiR1ZXoCDuArQFrH4MYD7g6wcBK/vBhTBgT7E18aj+Xn1
	2TEk6tJ5dgQwWulNQRn+JrzItbMmjf/dgq8o5OOlRfiN6MzbHMpDVOijjhvORXrI4Mr5Fb
	m1OqzSKudOIiH8y2AWgVhPMSAB+Btaw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756478642;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XIdZItDHvDgXiKJt/P6Pte2IaAmbiHefDQLNZqm5sok=;
	b=3JBYPIv+BpjfNYjiPPGcMckPWElDHk+osielImlrIQZHFeVpZIaxV5WX1hllk42Kb/jZG2
	qOyL8PyLGeHFRlCQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=IdvSTz2R;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=yiMJPIzV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756478641; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XIdZItDHvDgXiKJt/P6Pte2IaAmbiHefDQLNZqm5sok=;
	b=IdvSTz2R9KMAj8uvnqBZpAE9IqmrEIiIR+ABkT3Cy40MwSVuOvSKgPNSkPGgehPBzy1ZBn
	QfR2h7dC4PQ01/+rUTJiqAcPYozIxwv610QinQwyhHY6XxL/0NgT7lnW9g6jVJ/uwYJgdl
	q8HzcKTR8kCZW6+hBbvnEjtEoo+kYGA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756478641;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XIdZItDHvDgXiKJt/P6Pte2IaAmbiHefDQLNZqm5sok=;
	b=yiMJPIzVWWyhED1goZuQlf8ZPs1sGf6wFVw0KvzCYhNwlVIyzwVXVbqBI2ao9mvbAG0z4h
	49FRakdOfCGfrnCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 47AC313A3E;
	Fri, 29 Aug 2025 14:44:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 6LrAD7G8sWi6GAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 29 Aug 2025 14:44:01 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 36/61] ALSA: intel8x0: Use guard() for spin locks
Date: Fri, 29 Aug 2025 16:43:11 +0200
Message-ID: <20250829144342.4290-37-tiwai@suse.de>
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
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 5F3A05C238
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
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
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_ONE(0.00)[1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLe1mc1hwayk397878n5a1j337)];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -3.01

Clean up the code using guard() for spin locks.

Merely code refactoring, and no behavior change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/intel8x0.c  | 178 +++++++++++++++++++++---------------------
 sound/pci/intel8x0m.c |   8 +-
 2 files changed, 89 insertions(+), 97 deletions(-)

diff --git a/sound/pci/intel8x0.c b/sound/pci/intel8x0.c
index 9e6a5065ffbf..3b53c5e63c29 100644
--- a/sound/pci/intel8x0.c
+++ b/sound/pci/intel8x0.c
@@ -690,52 +690,51 @@ static void snd_intel8x0_setup_periods(struct intel8x0 *chip, struct ichdev *ich
 static inline void snd_intel8x0_update(struct intel8x0 *chip, struct ichdev *ichdev)
 {
 	unsigned long port = ichdev->reg_offset;
-	unsigned long flags;
 	int status, civ, i, step;
 	int ack = 0;
 
 	if (!(ichdev->prepared || chip->in_measurement) || ichdev->suspended)
 		return;
 
-	spin_lock_irqsave(&chip->reg_lock, flags);
-	status = igetbyte(chip, port + ichdev->roff_sr);
-	civ = igetbyte(chip, port + ICH_REG_OFF_CIV);
-	if (!(status & ICH_BCIS)) {
-		step = 0;
-	} else if (civ == ichdev->civ) {
-		step = 1;
-		ichdev->civ++;
-		ichdev->civ &= ICH_REG_LVI_MASK;
-	} else {
-		step = civ - ichdev->civ;
-		if (step < 0)
-			step += ICH_REG_LVI_MASK + 1;
-		ichdev->civ = civ;
-	}
+	scoped_guard(spinlock_irqsave, &chip->reg_lock) {
+		status = igetbyte(chip, port + ichdev->roff_sr);
+		civ = igetbyte(chip, port + ICH_REG_OFF_CIV);
+		if (!(status & ICH_BCIS)) {
+			step = 0;
+		} else if (civ == ichdev->civ) {
+			step = 1;
+			ichdev->civ++;
+			ichdev->civ &= ICH_REG_LVI_MASK;
+		} else {
+			step = civ - ichdev->civ;
+			if (step < 0)
+				step += ICH_REG_LVI_MASK + 1;
+			ichdev->civ = civ;
+		}
 
-	ichdev->position += step * ichdev->fragsize1;
-	if (! chip->in_measurement)
-		ichdev->position %= ichdev->size;
-	ichdev->lvi += step;
-	ichdev->lvi &= ICH_REG_LVI_MASK;
-	iputbyte(chip, port + ICH_REG_OFF_LVI, ichdev->lvi);
-	for (i = 0; i < step; i++) {
-		ichdev->lvi_frag++;
-		ichdev->lvi_frag %= ichdev->frags;
-		ichdev->bdbar[ichdev->lvi * 2] = cpu_to_le32(ichdev->physbuf + ichdev->lvi_frag * ichdev->fragsize1);
+		ichdev->position += step * ichdev->fragsize1;
+		if (! chip->in_measurement)
+			ichdev->position %= ichdev->size;
+		ichdev->lvi += step;
+		ichdev->lvi &= ICH_REG_LVI_MASK;
+		iputbyte(chip, port + ICH_REG_OFF_LVI, ichdev->lvi);
+		for (i = 0; i < step; i++) {
+			ichdev->lvi_frag++;
+			ichdev->lvi_frag %= ichdev->frags;
+			ichdev->bdbar[ichdev->lvi * 2] = cpu_to_le32(ichdev->physbuf + ichdev->lvi_frag * ichdev->fragsize1);
 #if 0
-	dev_dbg(chip->card->dev,
-		"new: bdbar[%i] = 0x%x [0x%x], prefetch = %i, all = 0x%x, 0x%x\n",
-	       ichdev->lvi * 2, ichdev->bdbar[ichdev->lvi * 2],
-	       ichdev->bdbar[ichdev->lvi * 2 + 1], inb(ICH_REG_OFF_PIV + port),
-	       inl(port + 4), inb(port + ICH_REG_OFF_CR));
+			dev_dbg(chip->card->dev,
+				"new: bdbar[%i] = 0x%x [0x%x], prefetch = %i, all = 0x%x, 0x%x\n",
+				ichdev->lvi * 2, ichdev->bdbar[ichdev->lvi * 2],
+				ichdev->bdbar[ichdev->lvi * 2 + 1], inb(ICH_REG_OFF_PIV + port),
+				inl(port + 4), inb(port + ICH_REG_OFF_CR));
 #endif
-		if (--ichdev->ack == 0) {
-			ichdev->ack = ichdev->ack_reload;
-			ack = 1;
+			if (--ichdev->ack == 0) {
+				ichdev->ack = ichdev->ack_reload;
+				ack = 1;
+			}
 		}
 	}
-	spin_unlock_irqrestore(&chip->reg_lock, flags);
 	if (ack && ichdev->substream) {
 		snd_pcm_period_elapsed(ichdev->substream);
 	}
@@ -917,7 +916,7 @@ static void snd_intel8x0_setup_pcm_out(struct intel8x0 *chip,
 	unsigned int cnt;
 	int dbl = runtime->rate > 48000;
 
-	spin_lock_irq(&chip->reg_lock);
+	guard(spinlock_irq)(&chip->reg_lock);
 	switch (chip->device_type) {
 	case DEVICE_ALI:
 		cnt = igetdword(chip, ICHREG(ALI_SCR));
@@ -963,7 +962,6 @@ static void snd_intel8x0_setup_pcm_out(struct intel8x0 *chip,
 		iputdword(chip, ICHREG(GLOB_CNT), cnt);
 		break;
 	}
-	spin_unlock_irq(&chip->reg_lock);
 }
 
 static int snd_intel8x0_pcm_prepare(struct snd_pcm_substream *substream)
@@ -993,7 +991,7 @@ static snd_pcm_uframes_t snd_intel8x0_pcm_pointer(struct snd_pcm_substream *subs
 	int civ, timeout = 10;
 	unsigned int position;
 
-	spin_lock(&chip->reg_lock);
+	guard(spinlock)(&chip->reg_lock);
 	do {
 		civ = igetbyte(chip, ichdev->reg_offset + ICH_REG_OFF_CIV);
 		ptr1 = igetword(chip, ichdev->reg_offset + ichdev->roff_picb);
@@ -1033,7 +1031,6 @@ static snd_pcm_uframes_t snd_intel8x0_pcm_pointer(struct snd_pcm_substream *subs
 		}
 	}
 	ichdev->last_pos = ptr;
-	spin_unlock(&chip->reg_lock);
 	if (ptr >= ichdev->size)
 		return 0;
 	return bytes_to_frames(substream->runtime, ptr);
@@ -1235,12 +1232,12 @@ static int snd_intel8x0_ali_ac97spdifout_open(struct snd_pcm_substream *substrea
 	struct intel8x0 *chip = snd_pcm_substream_chip(substream);
 	unsigned int val;
 
-	spin_lock_irq(&chip->reg_lock);
-	val = igetdword(chip, ICHREG(ALI_INTERFACECR));
-	val |= ICH_ALI_IF_AC97SP;
-	iputdword(chip, ICHREG(ALI_INTERFACECR), val);
-	/* also needs to set ALI_SC_CODEC_SPDF correctly */
-	spin_unlock_irq(&chip->reg_lock);
+	scoped_guard(spinlock_irq, &chip->reg_lock) {
+		val = igetdword(chip, ICHREG(ALI_INTERFACECR));
+		val |= ICH_ALI_IF_AC97SP;
+		iputdword(chip, ICHREG(ALI_INTERFACECR), val);
+		/* also needs to set ALI_SC_CODEC_SPDF correctly */
+	}
 
 	return snd_intel8x0_pcm_open(substream, &chip->ichd[ALID_AC97SPDIFOUT]);
 }
@@ -1251,11 +1248,10 @@ static int snd_intel8x0_ali_ac97spdifout_close(struct snd_pcm_substream *substre
 	unsigned int val;
 
 	chip->ichd[ALID_AC97SPDIFOUT].substream = NULL;
-	spin_lock_irq(&chip->reg_lock);
+	guard(spinlock_irq)(&chip->reg_lock);
 	val = igetdword(chip, ICHREG(ALI_INTERFACECR));
 	val &= ~ICH_ALI_IF_AC97SP;
 	iputdword(chip, ICHREG(ALI_INTERFACECR), val);
-	spin_unlock_irq(&chip->reg_lock);
 
 	return 0;
 }
@@ -2662,53 +2658,53 @@ static void intel8x0_measure_ac97_clock(struct intel8x0 *chip)
 	}
 	snd_intel8x0_setup_periods(chip, ichdev);
 	port = ichdev->reg_offset;
-	spin_lock_irq(&chip->reg_lock);
-	chip->in_measurement = 1;
-	/* trigger */
-	if (chip->device_type != DEVICE_ALI)
-		iputbyte(chip, port + ICH_REG_OFF_CR, ICH_IOCE | ICH_STARTBM);
-	else {
-		iputbyte(chip, port + ICH_REG_OFF_CR, ICH_IOCE);
-		iputdword(chip, ICHREG(ALI_DMACR), 1 << ichdev->ali_slot);
-	}
-	start_time = ktime_get();
-	spin_unlock_irq(&chip->reg_lock);
-	msleep(50);
-	spin_lock_irq(&chip->reg_lock);
-	/* check the position */
-	do {
-		civ = igetbyte(chip, ichdev->reg_offset + ICH_REG_OFF_CIV);
-		pos1 = igetword(chip, ichdev->reg_offset + ichdev->roff_picb);
-		if (pos1 == 0) {
-			udelay(10);
-			continue;
+	scoped_guard(spinlock_irq, &chip->reg_lock) {
+		chip->in_measurement = 1;
+		/* trigger */
+		if (chip->device_type != DEVICE_ALI)
+			iputbyte(chip, port + ICH_REG_OFF_CR, ICH_IOCE | ICH_STARTBM);
+		else {
+			iputbyte(chip, port + ICH_REG_OFF_CR, ICH_IOCE);
+			iputdword(chip, ICHREG(ALI_DMACR), 1 << ichdev->ali_slot);
 		}
-		if (civ == igetbyte(chip, ichdev->reg_offset + ICH_REG_OFF_CIV) &&
-		    pos1 == igetword(chip, ichdev->reg_offset + ichdev->roff_picb))
-			break;
-	} while (timeout--);
-	if (pos1 == 0) {	/* oops, this value is not reliable */
-		pos = 0;
-	} else {
-		pos = ichdev->fragsize1;
-		pos -= pos1 << ichdev->pos_shift;
-		pos += ichdev->position;
+		start_time = ktime_get();
 	}
-	chip->in_measurement = 0;
-	stop_time = ktime_get();
-	/* stop */
-	if (chip->device_type == DEVICE_ALI) {
-		iputdword(chip, ICHREG(ALI_DMACR), 1 << (ichdev->ali_slot + 16));
-		iputbyte(chip, port + ICH_REG_OFF_CR, 0);
-		while (igetbyte(chip, port + ICH_REG_OFF_CR))
-			;
-	} else {
-		iputbyte(chip, port + ICH_REG_OFF_CR, 0);
-		while (!(igetbyte(chip, port + ichdev->roff_sr) & ICH_DCH))
-			;
+	msleep(50);
+	scoped_guard(spinlock_irq, &chip->reg_lock) {
+		/* check the position */
+		do {
+			civ = igetbyte(chip, ichdev->reg_offset + ICH_REG_OFF_CIV);
+			pos1 = igetword(chip, ichdev->reg_offset + ichdev->roff_picb);
+			if (pos1 == 0) {
+				udelay(10);
+				continue;
+			}
+			if (civ == igetbyte(chip, ichdev->reg_offset + ICH_REG_OFF_CIV) &&
+			    pos1 == igetword(chip, ichdev->reg_offset + ichdev->roff_picb))
+				break;
+		} while (timeout--);
+		if (pos1 == 0) {	/* oops, this value is not reliable */
+			pos = 0;
+		} else {
+			pos = ichdev->fragsize1;
+			pos -= pos1 << ichdev->pos_shift;
+			pos += ichdev->position;
+		}
+		chip->in_measurement = 0;
+		stop_time = ktime_get();
+		/* stop */
+		if (chip->device_type == DEVICE_ALI) {
+			iputdword(chip, ICHREG(ALI_DMACR), 1 << (ichdev->ali_slot + 16));
+			iputbyte(chip, port + ICH_REG_OFF_CR, 0);
+			while (igetbyte(chip, port + ICH_REG_OFF_CR))
+				;
+		} else {
+			iputbyte(chip, port + ICH_REG_OFF_CR, 0);
+			while (!(igetbyte(chip, port + ichdev->roff_sr) & ICH_DCH))
+				;
+		}
+		iputbyte(chip, port + ICH_REG_OFF_CR, ICH_RESETREGS);
 	}
-	iputbyte(chip, port + ICH_REG_OFF_CR, ICH_RESETREGS);
-	spin_unlock_irq(&chip->reg_lock);
 
 	if (pos == 0) {
 		dev_err(chip->card->dev,
diff --git a/sound/pci/intel8x0m.c b/sound/pci/intel8x0m.c
index 9e5988583abe..84e1b7ea34e2 100644
--- a/sound/pci/intel8x0m.c
+++ b/sound/pci/intel8x0m.c
@@ -471,16 +471,13 @@ static irqreturn_t snd_intel8x0m_interrupt(int irq, void *dev_id)
 	unsigned int status;
 	unsigned int i;
 
-	spin_lock(&chip->reg_lock);
+	guard(spinlock)(&chip->reg_lock);
 	status = igetdword(chip, chip->int_sta_reg);
-	if (status == 0xffffffff) { /* we are not yet resumed */
-		spin_unlock(&chip->reg_lock);
+	if (status == 0xffffffff) /* we are not yet resumed */
 		return IRQ_NONE;
-	}
 	if ((status & chip->int_sta_mask) == 0) {
 		if (status)
 			iputdword(chip, chip->int_sta_reg, status);
-		spin_unlock(&chip->reg_lock);
 		return IRQ_NONE;
 	}
 
@@ -492,7 +489,6 @@ static irqreturn_t snd_intel8x0m_interrupt(int irq, void *dev_id)
 
 	/* ack them */
 	iputdword(chip, chip->int_sta_reg, status & chip->int_sta_mask);
-	spin_unlock(&chip->reg_lock);
 	
 	return IRQ_HANDLED;
 }
-- 
2.50.1

