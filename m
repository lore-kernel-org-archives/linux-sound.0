Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B03D31CA73
	for <linux-sound@vger.kernel.org>; Fri, 29 Aug 2025 15:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756479642; cv=none; b=kFi3jT3whopSvVa81SYOUUAjXbNHLvVeOD3N/d1z2TOajIOEhupK75u25K2pLTpcPWTdcZT0h/YawnqBqlsl1uEfTflCiE1NwucMLSgiiRz0SdcyZ4soUzVg6FTQMlgxfPkqCnm034GpWoR4ld5LpriwWNAfdERLxdptUm5gwLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756479642; c=relaxed/simple;
	bh=5yPE1O8s5+nBfA2j6QjcTGU6BG4Mpf2SNuZ8V2pXSGw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eAX8MBzmI8lQZi97VRbPbRUA5TE0WEkq6EI2aWDdUnKiJJU642LxJHvX+pEyeifG/p2m49ptai17bzVGAq7jVYHLqbYIqMc8jLetlSwa+IfMklZvydnIa4Qmz7UdgX6ZoaNi8vT8ZGozwUj7ZEBDow7PzIfxWTmmBhW9TGl9fYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=T89JuXWN; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=wnkZ+oV7; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=T89JuXWN; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=wnkZ+oV7; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="T89JuXWN";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wnkZ+oV7";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="T89JuXWN";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wnkZ+oV7"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D3A1B5C242;
	Fri, 29 Aug 2025 15:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756479631; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sEpnrX2m+FC0LPXns5osiWZhhgql3Wp9udFL8JDkx3I=;
	b=T89JuXWNhMEI2La0Eu902hHxQKQXZpwLGmeascW+/4q21GHRzNZnCGSIeu3Mc9sONgo9cm
	C4QmXx4p/fxvCaE3BNylP9o2l6UzdadzDtBbDEbokOqTLZVKWqSNemx2IpQUsNg05uxUN6
	UIFcw6uRejv4p4R1eAY80WvMwDBLJ6Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756479631;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sEpnrX2m+FC0LPXns5osiWZhhgql3Wp9udFL8JDkx3I=;
	b=wnkZ+oV7Vf4UnYtx62cVO2B0Cv3kGdfw1DGf2FPczeTxzoSZZML+ov8ADpMpMQo/Qet/je
	xlEREjtHmV/ExaAg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756479631; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sEpnrX2m+FC0LPXns5osiWZhhgql3Wp9udFL8JDkx3I=;
	b=T89JuXWNhMEI2La0Eu902hHxQKQXZpwLGmeascW+/4q21GHRzNZnCGSIeu3Mc9sONgo9cm
	C4QmXx4p/fxvCaE3BNylP9o2l6UzdadzDtBbDEbokOqTLZVKWqSNemx2IpQUsNg05uxUN6
	UIFcw6uRejv4p4R1eAY80WvMwDBLJ6Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756479631;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sEpnrX2m+FC0LPXns5osiWZhhgql3Wp9udFL8JDkx3I=;
	b=wnkZ+oV7Vf4UnYtx62cVO2B0Cv3kGdfw1DGf2FPczeTxzoSZZML+ov8ADpMpMQo/Qet/je
	xlEREjtHmV/ExaAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BA9DC13A6A;
	Fri, 29 Aug 2025 15:00:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id sONnLI/AsWjjHQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 29 Aug 2025 15:00:31 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 04/13] ALSA: opl3: Use guard() for spin locks
Date: Fri, 29 Aug 2025 17:00:15 +0200
Message-ID: <20250829150026.6379-5-tiwai@suse.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250829150026.6379-1-tiwai@suse.de>
References: <20250829150026.6379-1-tiwai@suse.de>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email];
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
 sound/drivers/opl3/opl3_lib.c  | 26 ++++-------------
 sound/drivers/opl3/opl3_midi.c | 51 ++++++++++++----------------------
 sound/drivers/opl3/opl3_seq.c  | 11 ++++----
 3 files changed, 28 insertions(+), 60 deletions(-)

diff --git a/sound/drivers/opl3/opl3_lib.c b/sound/drivers/opl3/opl3_lib.c
index cd9642a6689b..fa8a2ccbbd51 100644
--- a/sound/drivers/opl3/opl3_lib.c
+++ b/sound/drivers/opl3/opl3_lib.c
@@ -25,7 +25,6 @@ MODULE_LICENSE("GPL");
 
 static void snd_opl2_command(struct snd_opl3 * opl3, unsigned short cmd, unsigned char val)
 {
-	unsigned long flags;
 	unsigned long port;
 
 	/*
@@ -35,20 +34,17 @@ static void snd_opl2_command(struct snd_opl3 * opl3, unsigned short cmd, unsigne
 
 	port = (cmd & OPL3_RIGHT) ? opl3->r_port : opl3->l_port;
 
-	spin_lock_irqsave(&opl3->reg_lock, flags);
+	guard(spinlock_irqsave)(&opl3->reg_lock);
 
 	outb((unsigned char) cmd, port);
 	udelay(10);
 
 	outb((unsigned char) val, port + 1);
 	udelay(30);
-
-	spin_unlock_irqrestore(&opl3->reg_lock, flags);
 }
 
 static void snd_opl3_command(struct snd_opl3 * opl3, unsigned short cmd, unsigned char val)
 {
-	unsigned long flags;
 	unsigned long port;
 
 	/*
@@ -58,7 +54,7 @@ static void snd_opl3_command(struct snd_opl3 * opl3, unsigned short cmd, unsigne
 
 	port = (cmd & OPL3_RIGHT) ? opl3->r_port : opl3->l_port;
 
-	spin_lock_irqsave(&opl3->reg_lock, flags);
+	guard(spinlock_irqsave)(&opl3->reg_lock);
 
 	outb((unsigned char) cmd, port);
 	inb(opl3->l_port);
@@ -67,8 +63,6 @@ static void snd_opl3_command(struct snd_opl3 * opl3, unsigned short cmd, unsigne
 	outb((unsigned char) val, port + 1);
 	inb(opl3->l_port);
 	inb(opl3->l_port);
-
-	spin_unlock_irqrestore(&opl3->reg_lock, flags);
 }
 
 static int snd_opl3_detect(struct snd_opl3 * opl3)
@@ -142,34 +136,30 @@ static int snd_opl3_detect(struct snd_opl3 * opl3)
 
 static int snd_opl3_timer1_start(struct snd_timer * timer)
 {
-	unsigned long flags;
 	unsigned char tmp;
 	unsigned int ticks;
 	struct snd_opl3 *opl3;
 
 	opl3 = snd_timer_chip(timer);
-	spin_lock_irqsave(&opl3->timer_lock, flags);
+	guard(spinlock_irqsave)(&opl3->timer_lock);
 	ticks = timer->sticks;
 	tmp = (opl3->timer_enable | OPL3_TIMER1_START) & ~OPL3_TIMER1_MASK;
 	opl3->timer_enable = tmp;
 	opl3->command(opl3, OPL3_LEFT | OPL3_REG_TIMER1, 256 - ticks);	/* timer 1 count */
 	opl3->command(opl3, OPL3_LEFT | OPL3_REG_TIMER_CONTROL, tmp);	/* enable timer 1 IRQ */
-	spin_unlock_irqrestore(&opl3->timer_lock, flags);
 	return 0;
 }
 
 static int snd_opl3_timer1_stop(struct snd_timer * timer)
 {
-	unsigned long flags;
 	unsigned char tmp;
 	struct snd_opl3 *opl3;
 
 	opl3 = snd_timer_chip(timer);
-	spin_lock_irqsave(&opl3->timer_lock, flags);
+	guard(spinlock_irqsave)(&opl3->timer_lock);
 	tmp = (opl3->timer_enable | OPL3_TIMER1_MASK) & ~OPL3_TIMER1_START;
 	opl3->timer_enable = tmp;
 	opl3->command(opl3, OPL3_LEFT | OPL3_REG_TIMER_CONTROL, tmp);	/* disable timer #1 */
-	spin_unlock_irqrestore(&opl3->timer_lock, flags);
 	return 0;
 }
 
@@ -179,34 +169,30 @@ static int snd_opl3_timer1_stop(struct snd_timer * timer)
 
 static int snd_opl3_timer2_start(struct snd_timer * timer)
 {
-	unsigned long flags;
 	unsigned char tmp;
 	unsigned int ticks;
 	struct snd_opl3 *opl3;
 
 	opl3 = snd_timer_chip(timer);
-	spin_lock_irqsave(&opl3->timer_lock, flags);
+	guard(spinlock_irqsave)(&opl3->timer_lock);
 	ticks = timer->sticks;
 	tmp = (opl3->timer_enable | OPL3_TIMER2_START) & ~OPL3_TIMER2_MASK;
 	opl3->timer_enable = tmp;
 	opl3->command(opl3, OPL3_LEFT | OPL3_REG_TIMER2, 256 - ticks);	/* timer 1 count */
 	opl3->command(opl3, OPL3_LEFT | OPL3_REG_TIMER_CONTROL, tmp);	/* enable timer 1 IRQ */
-	spin_unlock_irqrestore(&opl3->timer_lock, flags);
 	return 0;
 }
 
 static int snd_opl3_timer2_stop(struct snd_timer * timer)
 {
-	unsigned long flags;
 	unsigned char tmp;
 	struct snd_opl3 *opl3;
 
 	opl3 = snd_timer_chip(timer);
-	spin_lock_irqsave(&opl3->timer_lock, flags);
+	guard(spinlock_irqsave)(&opl3->timer_lock);
 	tmp = (opl3->timer_enable | OPL3_TIMER2_MASK) & ~OPL3_TIMER2_START;
 	opl3->timer_enable = tmp;
 	opl3->command(opl3, OPL3_LEFT | OPL3_REG_TIMER_CONTROL, tmp);	/* disable timer #1 */
-	spin_unlock_irqrestore(&opl3->timer_lock, flags);
 	return 0;
 }
 
diff --git a/sound/drivers/opl3/opl3_midi.c b/sound/drivers/opl3/opl3_midi.c
index de7449cb6515..6d3c5b5a35ff 100644
--- a/sound/drivers/opl3/opl3_midi.c
+++ b/sound/drivers/opl3/opl3_midi.c
@@ -234,29 +234,27 @@ void snd_opl3_timer_func(struct timer_list *t)
 {
 
 	struct snd_opl3 *opl3 = timer_container_of(opl3, t, tlist);
-	unsigned long flags;
 	int again = 0;
 	int i;
 
-	spin_lock_irqsave(&opl3->voice_lock, flags);
-	for (i = 0; i < opl3->max_voices; i++) {
-		struct snd_opl3_voice *vp = &opl3->voices[i];
-		if (vp->state > 0 && vp->note_off_check) {
-			if (vp->note_off == jiffies)
-				snd_opl3_note_off_unsafe(opl3, vp->note, 0,
-							 vp->chan);
-			else
-				again++;
+	scoped_guard(spinlock_irqsave, &opl3->voice_lock) {
+		for (i = 0; i < opl3->max_voices; i++) {
+			struct snd_opl3_voice *vp = &opl3->voices[i];
+			if (vp->state > 0 && vp->note_off_check) {
+				if (vp->note_off == jiffies)
+					snd_opl3_note_off_unsafe(opl3, vp->note, 0,
+								 vp->chan);
+				else
+					again++;
+			}
 		}
 	}
-	spin_unlock_irqrestore(&opl3->voice_lock, flags);
 
-	spin_lock_irqsave(&opl3->sys_timer_lock, flags);
+	guard(spinlock_irqsave)(&opl3->sys_timer_lock);
 	if (again)
 		mod_timer(&opl3->tlist, jiffies + 1);	/* invoke again */
 	else
 		opl3->sys_timer_status = 0;
-	spin_unlock_irqrestore(&opl3->sys_timer_lock, flags);
 }
 
 /*
@@ -264,13 +262,11 @@ void snd_opl3_timer_func(struct timer_list *t)
  */
 static void snd_opl3_start_timer(struct snd_opl3 *opl3)
 {
-	unsigned long flags;
-	spin_lock_irqsave(&opl3->sys_timer_lock, flags);
+	guard(spinlock_irqsave)(&opl3->sys_timer_lock);
 	if (! opl3->sys_timer_status) {
 		mod_timer(&opl3->tlist, jiffies + 1);
 		opl3->sys_timer_status = 1;
 	}
-	spin_unlock_irqrestore(&opl3->sys_timer_lock, flags);
 }
 
 /* ------------------------------ */
@@ -309,7 +305,6 @@ void snd_opl3_note_on(void *p, int note, int vel, struct snd_midi_channel *chan)
 
 	struct fm_patch *patch;
 	struct fm_instrument *fm;
-	unsigned long flags;
 
 	opl3 = p;
 
@@ -337,20 +332,17 @@ void snd_opl3_note_on(void *p, int note, int vel, struct snd_midi_channel *chan)
 		prg = chan->midi_program;
 	}
 
-	spin_lock_irqsave(&opl3->voice_lock, flags);
+	guard(spinlock_irqsave)(&opl3->voice_lock);
 
 	if (use_internal_drums) {
 		snd_opl3_drum_switch(opl3, note, vel, 1, chan);
-		spin_unlock_irqrestore(&opl3->voice_lock, flags);
 		return;
 	}
 
  __extra_prg:
 	patch = snd_opl3_find_patch(opl3, prg, bank, 0);
-	if (!patch) {
-		spin_unlock_irqrestore(&opl3->voice_lock, flags);
+	if (!patch)
 		return;
-	}
 
 	fm = &patch->inst;
 	switch (patch->type) {
@@ -364,7 +356,6 @@ void snd_opl3_note_on(void *p, int note, int vel, struct snd_midi_channel *chan)
 		}
 		fallthrough;
 	default:
-		spin_unlock_irqrestore(&opl3->voice_lock, flags);
 		return;
 	}
 	opl3_dbg(opl3, "  --> OPL%i instrument: %s\n",
@@ -378,10 +369,8 @@ void snd_opl3_note_on(void *p, int note, int vel, struct snd_midi_channel *chan)
 		voice = snd_opl3_oss_map[chan->number];		
 	}
 
-	if (voice < 0) {
-		spin_unlock_irqrestore(&opl3->voice_lock, flags);
+	if (voice < 0)
 		return;
-	}
 
 	if (voice < MAX_OPL2_VOICES) {
 		/* Left register block for voices 0 .. 8 */
@@ -597,7 +586,6 @@ void snd_opl3_note_on(void *p, int note, int vel, struct snd_midi_channel *chan)
 		opl3_dbg(opl3, " *** allocating extra program\n");
 		goto __extra_prg;
 	}
-	spin_unlock_irqrestore(&opl3->voice_lock, flags);
 }
 
 static void snd_opl3_kill_voice(struct snd_opl3 *opl3, int voice)
@@ -686,11 +674,9 @@ void snd_opl3_note_off(void *p, int note, int vel,
 		       struct snd_midi_channel *chan)
 {
 	struct snd_opl3 *opl3 = p;
-	unsigned long flags;
 
-	spin_lock_irqsave(&opl3->voice_lock, flags);
+	guard(spinlock_irqsave)(&opl3->voice_lock);
 	snd_opl3_note_off_unsafe(p, note, vel, chan);
-	spin_unlock_irqrestore(&opl3->voice_lock, flags);
 }
 
 /*
@@ -764,9 +750,7 @@ static void snd_opl3_pitch_ctrl(struct snd_opl3 *opl3, struct snd_midi_channel *
 	int voice;
 	struct snd_opl3_voice *vp;
 
-	unsigned long flags;
-
-	spin_lock_irqsave(&opl3->voice_lock, flags);
+	guard(spinlock_irqsave)(&opl3->voice_lock);
 
 	if (opl3->synth_mode == SNDRV_OPL3_MODE_SEQ) {
 		for (voice = 0; voice < opl3->max_voices; voice++) {
@@ -782,7 +766,6 @@ static void snd_opl3_pitch_ctrl(struct snd_opl3 *opl3, struct snd_midi_channel *
 			snd_opl3_update_pitch(opl3, voice);
 		}
 	}
-	spin_unlock_irqrestore(&opl3->voice_lock, flags);
 }
 
 /*
diff --git a/sound/drivers/opl3/opl3_seq.c b/sound/drivers/opl3/opl3_seq.c
index 8db77a81476c..d3278428d360 100644
--- a/sound/drivers/opl3/opl3_seq.c
+++ b/sound/drivers/opl3/opl3_seq.c
@@ -66,16 +66,15 @@ int snd_opl3_synth_setup(struct snd_opl3 * opl3)
 
 void snd_opl3_synth_cleanup(struct snd_opl3 * opl3)
 {
-	unsigned long flags;
 	struct snd_hwdep *hwdep;
 
 	/* Stop system timer */
-	spin_lock_irqsave(&opl3->sys_timer_lock, flags);
-	if (opl3->sys_timer_status) {
-		timer_delete(&opl3->tlist);
-		opl3->sys_timer_status = 0;
+	scoped_guard(spinlock_irq, &opl3->sys_timer_lock) {
+		if (opl3->sys_timer_status) {
+			timer_delete(&opl3->tlist);
+			opl3->sys_timer_status = 0;
+		}
 	}
-	spin_unlock_irqrestore(&opl3->sys_timer_lock, flags);
 
 	snd_opl3_reset(opl3);
 	hwdep = opl3->hwdep;
-- 
2.50.1

