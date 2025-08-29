Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EF5A31CA73
	for <linux-sound@vger.kernel.org>; Fri, 29 Aug 2025 14:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756479240; cv=none; b=HT9ttLe+K0oKFt+UHYuR0YKEPiz63Cy1bAj2fvNHfDYXtpPyB9v+Geqhwjvph1k96eAMvgpsNtyUWmLkyMvVAxtODHYZqIwB7zfzKEalqqO6tgHJnnbsbsT5o4EEiQlLStFguf1rBSpxQckRGK+jQZHggGlPLIEFOvCkKhCkeJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756479240; c=relaxed/simple;
	bh=t8KHIZe/+8GnrcvfDpllb3sN0p2hO6Sk/qCU7kSj+RU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ql+mDb4KnZSPhaDwA8l8iGgGK6HR3WldedrqafevptmzAPKq7Z5vi8w3PdNkn7mVdR7TKZPYi5T/ex+CdZ0UR7kmfpj68heRNruv9JmumONCXbVS5DZL1o+59CupuxGJm/Mon7JRV6eKakigGazi4d33AajBoTe/jZgzfaM1M3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Uk1drpWG; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=1IIwLICX; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Uk1drpWG; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=1IIwLICX; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Uk1drpWG";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1IIwLICX";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Uk1drpWG";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1IIwLICX"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 8D03C2281F;
	Fri, 29 Aug 2025 14:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756479192; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KvUbrHPBQedKbzPK8iVKYT7A1Bj5Wa19wCrSqyYguic=;
	b=Uk1drpWGMc71DVa5h6NRVyXgXXysZNtdE3sGpk+GIrSggE4upZdGzKZ9bg6seq1ZUl/KCI
	MKUGFsRHkjcP8pOh8w6fEAa9drMz+tN94qKr5F7t1yXYDqs+PKDgeihYRh+U5hXugU08tj
	eLy6HfS3ANDKEtxnT7H4mqLA+7INVkc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756479192;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KvUbrHPBQedKbzPK8iVKYT7A1Bj5Wa19wCrSqyYguic=;
	b=1IIwLICXrafcCQvpeUXvww1VXmzZlkNyAXs0hqPP3Kwo0Iv0akQZiyHKBlMdqmQCdAfT2D
	rSAoz9hMbWRDqyDg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Uk1drpWG;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=1IIwLICX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756479192; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KvUbrHPBQedKbzPK8iVKYT7A1Bj5Wa19wCrSqyYguic=;
	b=Uk1drpWGMc71DVa5h6NRVyXgXXysZNtdE3sGpk+GIrSggE4upZdGzKZ9bg6seq1ZUl/KCI
	MKUGFsRHkjcP8pOh8w6fEAa9drMz+tN94qKr5F7t1yXYDqs+PKDgeihYRh+U5hXugU08tj
	eLy6HfS3ANDKEtxnT7H4mqLA+7INVkc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756479192;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KvUbrHPBQedKbzPK8iVKYT7A1Bj5Wa19wCrSqyYguic=;
	b=1IIwLICXrafcCQvpeUXvww1VXmzZlkNyAXs0hqPP3Kwo0Iv0akQZiyHKBlMdqmQCdAfT2D
	rSAoz9hMbWRDqyDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7382D13326;
	Fri, 29 Aug 2025 14:53:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id WPD2Gti+sWhzGwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 29 Aug 2025 14:53:12 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 14/18] ALSA: emu8000: Use guard() for spin locks
Date: Fri, 29 Aug 2025 16:52:54 +0200
Message-ID: <20250829145300.5460-15-tiwai@suse.de>
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
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 8D03C2281F
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
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
X-Spam-Score: -3.01

Clean up the code using guard() for spin locks.

Merely code refactoring, and no behavior change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/isa/sb/emu8000.c     | 94 ++++++++++++++++----------------------
 sound/isa/sb/emu8000_pcm.c | 46 +++++++++----------
 2 files changed, 61 insertions(+), 79 deletions(-)

diff --git a/sound/isa/sb/emu8000.c b/sound/isa/sb/emu8000.c
index 312b217491d4..12c296ee34ec 100644
--- a/sound/isa/sb/emu8000.c
+++ b/sound/isa/sb/emu8000.c
@@ -35,60 +35,49 @@
 /* Write a word */
 void snd_emu8000_poke(struct snd_emu8000 *emu, unsigned int port, unsigned int reg, unsigned int val)
 {
-	unsigned long flags;
-	spin_lock_irqsave(&emu->reg_lock, flags);
+	guard(spinlock_irqsave)(&emu->reg_lock);
 	if (reg != emu->last_reg) {
 		outw((unsigned short)reg, EMU8000_PTR(emu)); /* Set register */
 		emu->last_reg = reg;
 	}
 	outw((unsigned short)val, port); /* Send data */
-	spin_unlock_irqrestore(&emu->reg_lock, flags);
 }
 
 /* Read a word */
 unsigned short snd_emu8000_peek(struct snd_emu8000 *emu, unsigned int port, unsigned int reg)
 {
-	unsigned short res;
-	unsigned long flags;
-	spin_lock_irqsave(&emu->reg_lock, flags);
+	guard(spinlock_irqsave)(&emu->reg_lock);
 	if (reg != emu->last_reg) {
 		outw((unsigned short)reg, EMU8000_PTR(emu)); /* Set register */
 		emu->last_reg = reg;
 	}
-	res = inw(port);	/* Read data */
-	spin_unlock_irqrestore(&emu->reg_lock, flags);
-	return res;
+	return inw(port);	/* Read data */
 }
 
 /* Write a double word */
 void snd_emu8000_poke_dw(struct snd_emu8000 *emu, unsigned int port, unsigned int reg, unsigned int val)
 {
-	unsigned long flags;
-	spin_lock_irqsave(&emu->reg_lock, flags);
+	guard(spinlock_irqsave)(&emu->reg_lock);
 	if (reg != emu->last_reg) {
 		outw((unsigned short)reg, EMU8000_PTR(emu)); /* Set register */
 		emu->last_reg = reg;
 	}
 	outw((unsigned short)val, port); /* Send low word of data */
 	outw((unsigned short)(val>>16), port+2); /* Send high word of data */
-	spin_unlock_irqrestore(&emu->reg_lock, flags);
 }
 
 /* Read a double word */
 unsigned int snd_emu8000_peek_dw(struct snd_emu8000 *emu, unsigned int port, unsigned int reg)
 {
 	unsigned short low;
-	unsigned int res;
-	unsigned long flags;
-	spin_lock_irqsave(&emu->reg_lock, flags);
+
+	guard(spinlock_irqsave)(&emu->reg_lock);
 	if (reg != emu->last_reg) {
 		outw((unsigned short)reg, EMU8000_PTR(emu)); /* Set register */
 		emu->last_reg = reg;
 	}
 	low = inw(port);	/* Read low word of data */
-	res = low + (inw(port+2) << 16);
-	spin_unlock_irqrestore(&emu->reg_lock, flags);
-	return res;
+	return low + (inw(port+2) << 16);
 }
 
 /*
@@ -456,8 +445,6 @@ size_dram(struct snd_emu8000 *emu)
 /*exported*/ void
 snd_emu8000_init_fm(struct snd_emu8000 *emu)
 {
-	unsigned long flags;
-
 	/* Initialize the last two channels for DRAM refresh and producing
 	   the reverb and chorus effects for Yamaha OPL-3 synthesizer */
 
@@ -479,12 +466,12 @@ snd_emu8000_init_fm(struct snd_emu8000 *emu)
 
 	snd_emu8000_poke((emu), EMU8000_DATA0(emu), EMU8000_CMD(1, (30)), 0);
 
-	spin_lock_irqsave(&emu->reg_lock, flags);
-	while (!(inw(EMU8000_PTR(emu)) & 0x1000))
-		;
-	while ((inw(EMU8000_PTR(emu)) & 0x1000))
-		;
-	spin_unlock_irqrestore(&emu->reg_lock, flags);
+	scoped_guard(spinlock_irqsave, &emu->reg_lock) {
+		while (!(inw(EMU8000_PTR(emu)) & 0x1000))
+			;
+		while ((inw(EMU8000_PTR(emu)) & 0x1000))
+			;
+	}
 	snd_emu8000_poke((emu), EMU8000_DATA0(emu), EMU8000_CMD(1, (30)), 0x4828);
 	/* this is really odd part.. */
 	outb(0x3C, EMU8000_PTR(emu));
@@ -838,20 +825,19 @@ static int mixer_bass_treble_get(struct snd_kcontrol *kcontrol, struct snd_ctl_e
 static int mixer_bass_treble_put(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_emu8000 *emu = snd_kcontrol_chip(kcontrol);
-	unsigned long flags;
 	int change;
 	unsigned short val1;
 	
 	val1 = ucontrol->value.integer.value[0] % 12;
-	spin_lock_irqsave(&emu->control_lock, flags);
-	if (kcontrol->private_value) {
-		change = val1 != emu->treble_level;
-		emu->treble_level = val1;
-	} else {
-		change = val1 != emu->bass_level;
-		emu->bass_level = val1;
+	scoped_guard(spinlock_irqsave, &emu->control_lock) {
+		if (kcontrol->private_value) {
+			change = val1 != emu->treble_level;
+			emu->treble_level = val1;
+		} else {
+			change = val1 != emu->bass_level;
+			emu->bass_level = val1;
+		}
 	}
-	spin_unlock_irqrestore(&emu->control_lock, flags);
 	snd_emu8000_update_equalizer(emu);
 	return change;
 }
@@ -899,21 +885,20 @@ static int mixer_chorus_reverb_get(struct snd_kcontrol *kcontrol, struct snd_ctl
 static int mixer_chorus_reverb_put(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_emu8000 *emu = snd_kcontrol_chip(kcontrol);
-	unsigned long flags;
 	int change;
 	unsigned short val1;
 	
-	spin_lock_irqsave(&emu->control_lock, flags);
-	if (kcontrol->private_value) {
-		val1 = ucontrol->value.integer.value[0] % SNDRV_EMU8000_CHORUS_NUMBERS;
-		change = val1 != emu->chorus_mode;
-		emu->chorus_mode = val1;
-	} else {
-		val1 = ucontrol->value.integer.value[0] % SNDRV_EMU8000_REVERB_NUMBERS;
-		change = val1 != emu->reverb_mode;
-		emu->reverb_mode = val1;
+	scoped_guard(spinlock_irqsave, &emu->control_lock) {
+		if (kcontrol->private_value) {
+			val1 = ucontrol->value.integer.value[0] % SNDRV_EMU8000_CHORUS_NUMBERS;
+			change = val1 != emu->chorus_mode;
+			emu->chorus_mode = val1;
+		} else {
+			val1 = ucontrol->value.integer.value[0] % SNDRV_EMU8000_REVERB_NUMBERS;
+			change = val1 != emu->reverb_mode;
+			emu->reverb_mode = val1;
+		}
 	}
-	spin_unlock_irqrestore(&emu->control_lock, flags);
 	if (change) {
 		if (kcontrol->private_value)
 			snd_emu8000_update_chorus_mode(emu);
@@ -966,20 +951,19 @@ static int mixer_fm_depth_get(struct snd_kcontrol *kcontrol, struct snd_ctl_elem
 static int mixer_fm_depth_put(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_emu8000 *emu = snd_kcontrol_chip(kcontrol);
-	unsigned long flags;
 	int change;
 	unsigned short val1;
 	
 	val1 = ucontrol->value.integer.value[0] % 256;
-	spin_lock_irqsave(&emu->control_lock, flags);
-	if (kcontrol->private_value) {
-		change = val1 != emu->fm_chorus_depth;
-		emu->fm_chorus_depth = val1;
-	} else {
-		change = val1 != emu->fm_reverb_depth;
-		emu->fm_reverb_depth = val1;
+	scoped_guard(spinlock_irqsave, &emu->control_lock) {
+		if (kcontrol->private_value) {
+			change = val1 != emu->fm_chorus_depth;
+			emu->fm_chorus_depth = val1;
+		} else {
+			change = val1 != emu->fm_reverb_depth;
+			emu->fm_reverb_depth = val1;
+		}
 	}
-	spin_unlock_irqrestore(&emu->control_lock, flags);
 	if (change)
 		snd_emu8000_init_fm(emu);
 	return change;
diff --git a/sound/isa/sb/emu8000_pcm.c b/sound/isa/sb/emu8000_pcm.c
index 215bbcd0360e..656a655d618d 100644
--- a/sound/isa/sb/emu8000_pcm.c
+++ b/sound/isa/sb/emu8000_pcm.c
@@ -184,28 +184,30 @@ static void emu8k_pcm_timer_func(struct timer_list *t)
 {
 	struct snd_emu8k_pcm *rec = timer_container_of(rec, t, timer);
 	int ptr, delta;
+	bool period_elapsed = false;
 
-	spin_lock(&rec->timer_lock);
-	/* update the current pointer */
-	ptr = emu8k_get_curpos(rec, 0);
-	if (ptr < rec->last_ptr)
-		delta = ptr + rec->buf_size - rec->last_ptr;
-	else
-		delta = ptr - rec->last_ptr;
-	rec->period_pos += delta;
-	rec->last_ptr = ptr;
+	scoped_guard(spinlock, &rec->timer_lock) {
+		/* update the current pointer */
+		ptr = emu8k_get_curpos(rec, 0);
+		if (ptr < rec->last_ptr)
+			delta = ptr + rec->buf_size - rec->last_ptr;
+		else
+			delta = ptr - rec->last_ptr;
+		rec->period_pos += delta;
+		rec->last_ptr = ptr;
 
-	/* reprogram timer */
-	mod_timer(&rec->timer, jiffies + 1);
+		/* reprogram timer */
+		mod_timer(&rec->timer, jiffies + 1);
 
-	/* update period */
-	if (rec->period_pos >= (int)rec->period_size) {
-		rec->period_pos %= rec->period_size;
-		spin_unlock(&rec->timer_lock);
-		snd_pcm_period_elapsed(rec->substream);
-		return;
+		/* update period */
+		if (rec->period_pos >= (int)rec->period_size) {
+			rec->period_pos %= rec->period_size;
+			period_elapsed = true;
+		}
 	}
-	spin_unlock(&rec->timer_lock);
+
+	if (period_elapsed)
+		snd_pcm_period_elapsed(rec->substream);
 }
 
 
@@ -321,7 +323,6 @@ static void setup_voice(struct snd_emu8k_pcm *rec, int ch)
  */
 static void start_voice(struct snd_emu8k_pcm *rec, int ch)
 {
-	unsigned long flags;
 	struct snd_emu8000 *hw = rec->emu;
 	unsigned int temp, aux;
 	int pt = calc_pitch_target(rec->pitch);
@@ -343,12 +344,11 @@ static void start_voice(struct snd_emu8k_pcm *rec, int ch)
 	EMU8000_CPF_WRITE(hw, ch, pt << 16);
 
 	/* start timer */
-	spin_lock_irqsave(&rec->timer_lock, flags);
+	guard(spinlock_irqsave)(&rec->timer_lock);
 	if (! rec->timer_running) {
 		mod_timer(&rec->timer, jiffies + 1);
 		rec->timer_running = 1;
 	}
-	spin_unlock_irqrestore(&rec->timer_lock, flags);
 }
 
 /*
@@ -356,18 +356,16 @@ static void start_voice(struct snd_emu8k_pcm *rec, int ch)
  */
 static void stop_voice(struct snd_emu8k_pcm *rec, int ch)
 {
-	unsigned long flags;
 	struct snd_emu8000 *hw = rec->emu;
 
 	EMU8000_DCYSUSV_WRITE(hw, ch, 0x807F);
 
 	/* stop timer */
-	spin_lock_irqsave(&rec->timer_lock, flags);
+	guard(spinlock_irqsave)(&rec->timer_lock);
 	if (rec->timer_running) {
 		timer_delete(&rec->timer);
 		rec->timer_running = 0;
 	}
-	spin_unlock_irqrestore(&rec->timer_lock, flags);
 }
 
 static int emu8k_pcm_trigger(struct snd_pcm_substream *subs, int cmd)
-- 
2.50.1

