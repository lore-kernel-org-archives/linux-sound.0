Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAEEC1E25F9
	for <linux-sound@vger.kernel.org>; Fri, 29 Aug 2025 15:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756480439; cv=none; b=CZQNQr0togjcf6Cz9Q5pmgMXzUU6fzE9QrrCmdxDwp7TwdhfHJoJ1oUB6w7pyABZFduf8CT9uAPBp+3AZN7wzrsXuU4aTcg294cxc+32HPKCcid0kYhm6e8CazsB4+CS4S1ib0Rm5ymhsN/uWuHPvD3hhwtSIMfsW4FBlejqj64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756480439; c=relaxed/simple;
	bh=RlVhec8oa6o4O0/lJkCX1OWoQPqVxceZjvjYBlLcIuQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Hv8nkzxdPnwuGyzVO/MKAaZDiaz7jGVeJXHH42YtbgLpMsyCAX7NycLB5eXx1rIuur6b+cc8nbySNy1IXqXdhFRmRhO6isUY6/N4MfFNWWXkpa+2MGX8wqUSVoza0ziZuzPu7NJd+C7kC34HSHhi/O1KRktt9fFZwQQmjvQaZs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=BIRTSY+2; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=unnYVjIl; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=BIRTSY+2; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=unnYVjIl; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="BIRTSY+2";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="unnYVjIl";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="BIRTSY+2";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="unnYVjIl"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id B6C5B33F07;
	Fri, 29 Aug 2025 15:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756480421; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iHuyWP8yFkjpKVMDJfDe89SWjsdl9qKXUoBqL/0D82Q=;
	b=BIRTSY+2SVcL5Tmxb9JyhQLm8z39cyiHKs/DYcYo8Ob0v87vWZRRSulOpEhq41S90CUziV
	S+Y7PJ2vhGSzVjUpI4+6oSNjEjVPhC7dgfLtQqE3ffG5zK5cT/8BBjtQIDJHHrCiJZezWe
	xLManSPVNRnpd4PvxaiB3WJMmC+9i04=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756480421;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iHuyWP8yFkjpKVMDJfDe89SWjsdl9qKXUoBqL/0D82Q=;
	b=unnYVjIlKpRPLjdbh4lSnwv5rGipyKkhRXsEFKPjFhGwmNXG2lBcYH06YtxE9mwKV7M4SY
	ayNYq01YYA9iYdBg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756480421; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iHuyWP8yFkjpKVMDJfDe89SWjsdl9qKXUoBqL/0D82Q=;
	b=BIRTSY+2SVcL5Tmxb9JyhQLm8z39cyiHKs/DYcYo8Ob0v87vWZRRSulOpEhq41S90CUziV
	S+Y7PJ2vhGSzVjUpI4+6oSNjEjVPhC7dgfLtQqE3ffG5zK5cT/8BBjtQIDJHHrCiJZezWe
	xLManSPVNRnpd4PvxaiB3WJMmC+9i04=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756480421;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iHuyWP8yFkjpKVMDJfDe89SWjsdl9qKXUoBqL/0D82Q=;
	b=unnYVjIlKpRPLjdbh4lSnwv5rGipyKkhRXsEFKPjFhGwmNXG2lBcYH06YtxE9mwKV7M4SY
	ayNYq01YYA9iYdBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9707813A54;
	Fri, 29 Aug 2025 15:13:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id yH+tI6XDsWiQIQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 29 Aug 2025 15:13:41 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 04/19] ALSA: synth: Use guard() for spin locks
Date: Fri, 29 Aug 2025 17:13:18 +0200
Message-ID: <20250829151335.7342-5-tiwai@suse.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250829151335.7342-1-tiwai@suse.de>
References: <20250829151335.7342-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -2.80

Clean up the code using guard() for spin locks.

Merely code refactoring, and no behavior change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/synth/emux/emux_effect.c | 29 ++++++++--------
 sound/synth/emux/emux_synth.c  | 54 +++++++----------------------
 sound/synth/emux/soundfont.c   | 63 ++++++++++++----------------------
 3 files changed, 49 insertions(+), 97 deletions(-)

diff --git a/sound/synth/emux/emux_effect.c b/sound/synth/emux/emux_effect.c
index 3c7314f5fb19..bfe383fa90ba 100644
--- a/sound/synth/emux/emux_effect.c
+++ b/sound/synth/emux/emux_effect.c
@@ -168,7 +168,6 @@ snd_emux_send_effect(struct snd_emux_port *port, struct snd_midi_channel *chan,
 	unsigned char *srcp, *origp;
 	struct snd_emux *emu;
 	struct snd_emux_effect_table *fx;
-	unsigned long flags;
 
 	emu = port->emu;
 	fx = chan->private;
@@ -195,22 +194,22 @@ snd_emux_send_effect(struct snd_emux_port *port, struct snd_midi_channel *chan,
 		offset++;
 #endif
 	/* modify the register values */
-	spin_lock_irqsave(&emu->voice_lock, flags);
-	for (i = 0; i < emu->max_voices; i++) {
-		struct snd_emux_voice *vp = &emu->voices[i];
-		if (!STATE_IS_PLAYING(vp->state) || vp->chan != chan)
-			continue;
-		srcp = (unsigned char*)&vp->reg.parm + offset;
-		origp = (unsigned char*)&vp->zone->v.parm + offset;
-		if (parm_defs[i].type & PARM_IS_BYTE) {
-			*srcp = *origp;
-			effect_set_byte(srcp, chan, type);
-		} else {
-			*(unsigned short*)srcp = *(unsigned short*)origp;
-			effect_set_word((unsigned short*)srcp, chan, type);
+	scoped_guard(spinlock_irqsave, &emu->voice_lock) {
+		for (i = 0; i < emu->max_voices; i++) {
+			struct snd_emux_voice *vp = &emu->voices[i];
+			if (!STATE_IS_PLAYING(vp->state) || vp->chan != chan)
+				continue;
+			srcp = (unsigned char *)&vp->reg.parm + offset;
+			origp = (unsigned char *)&vp->zone->v.parm + offset;
+			if (parm_defs[i].type & PARM_IS_BYTE) {
+				*srcp = *origp;
+				effect_set_byte(srcp, chan, type);
+			} else {
+				*(unsigned short *)srcp = *(unsigned short *)origp;
+				effect_set_word((unsigned short *)srcp, chan, type);
+			}
 		}
 	}
-	spin_unlock_irqrestore(&emu->voice_lock, flags);
 
 	/* activate them */
 	snd_emux_update_channel(port, chan, parm_defs[type].update);
diff --git a/sound/synth/emux/emux_synth.c b/sound/synth/emux/emux_synth.c
index cff6aba9bfc3..6982e1317da5 100644
--- a/sound/synth/emux/emux_synth.c
+++ b/sound/synth/emux/emux_synth.c
@@ -49,7 +49,6 @@ snd_emux_note_on(void *p, int note, int vel, struct snd_midi_channel *chan)
 	int i, key, nvoices;
 	struct snd_emux_voice *vp;
 	struct snd_sf_zone *table[SNDRV_EMUX_MAX_MULTI_VOICES];
-	unsigned long flags;
 	struct snd_emux_port *port;
 
 	port = p;
@@ -77,7 +76,7 @@ snd_emux_note_on(void *p, int note, int vel, struct snd_midi_channel *chan)
 	terminate_note1(emu, key, chan, 0);
 #endif
 
-	spin_lock_irqsave(&emu->voice_lock, flags);
+	guard(spinlock_irqsave)(&emu->voice_lock);
 	for (i = 0; i < nvoices; i++) {
 
 		/* set up each voice parameter */
@@ -124,7 +123,6 @@ snd_emux_note_on(void *p, int note, int vel, struct snd_midi_channel *chan)
 			vp->ontime = jiffies; /* remember the trigger timing */
 		}
 	}
-	spin_unlock_irqrestore(&emu->voice_lock, flags);
 
 #ifdef SNDRV_EMUX_USE_RAW_EFFECT
 	if (port->port_mode == SNDRV_EMUX_PORT_MODE_OSS_SYNTH) {
@@ -147,7 +145,6 @@ snd_emux_note_off(void *p, int note, int vel, struct snd_midi_channel *chan)
 	int ch;
 	struct snd_emux *emu;
 	struct snd_emux_voice *vp;
-	unsigned long flags;
 	struct snd_emux_port *port;
 
 	port = p;
@@ -158,7 +155,7 @@ snd_emux_note_off(void *p, int note, int vel, struct snd_midi_channel *chan)
 	if (snd_BUG_ON(!emu || !emu->ops.release))
 		return;
 
-	spin_lock_irqsave(&emu->voice_lock, flags);
+	guard(spinlock_irqsave)(&emu->voice_lock);
 	for (ch = 0; ch < emu->max_voices; ch++) {
 		vp = &emu->voices[ch];
 		if (STATE_IS_PLAYING(vp->state) &&
@@ -180,7 +177,6 @@ snd_emux_note_off(void *p, int note, int vel, struct snd_midi_channel *chan)
 				emu->ops.release(vp);
 		}
 	}
-	spin_unlock_irqrestore(&emu->voice_lock, flags);
 }
 
 /*
@@ -192,10 +188,9 @@ void snd_emux_timer_callback(struct timer_list *t)
 {
 	struct snd_emux *emu = timer_container_of(emu, t, tlist);
 	struct snd_emux_voice *vp;
-	unsigned long flags;
 	int ch, do_again = 0;
 
-	spin_lock_irqsave(&emu->voice_lock, flags);
+	guard(spinlock_irqsave)(&emu->voice_lock);
 	for (ch = 0; ch < emu->max_voices; ch++) {
 		vp = &emu->voices[ch];
 		if (vp->state == SNDRV_EMUX_ST_PENDING) {
@@ -212,7 +207,6 @@ void snd_emux_timer_callback(struct timer_list *t)
 		emu->timer_active = 1;
 	} else
 		emu->timer_active = 0;
-	spin_unlock_irqrestore(&emu->voice_lock, flags);
 }
 
 /*
@@ -224,7 +218,6 @@ snd_emux_key_press(void *p, int note, int vel, struct snd_midi_channel *chan)
 	int ch;
 	struct snd_emux *emu;
 	struct snd_emux_voice *vp;
-	unsigned long flags;
 	struct snd_emux_port *port;
 
 	port = p;
@@ -235,7 +228,7 @@ snd_emux_key_press(void *p, int note, int vel, struct snd_midi_channel *chan)
 	if (snd_BUG_ON(!emu || !emu->ops.update))
 		return;
 
-	spin_lock_irqsave(&emu->voice_lock, flags);
+	guard(spinlock_irqsave)(&emu->voice_lock);
 	for (ch = 0; ch < emu->max_voices; ch++) {
 		vp = &emu->voices[ch];
 		if (vp->state == SNDRV_EMUX_ST_ON &&
@@ -244,7 +237,6 @@ snd_emux_key_press(void *p, int note, int vel, struct snd_midi_channel *chan)
 			update_voice(emu, vp, SNDRV_EMUX_UPDATE_VOLUME);
 		}
 	}
-	spin_unlock_irqrestore(&emu->voice_lock, flags);
 }
 
 
@@ -257,7 +249,6 @@ snd_emux_update_channel(struct snd_emux_port *port, struct snd_midi_channel *cha
 	struct snd_emux *emu;
 	struct snd_emux_voice *vp;
 	int i;
-	unsigned long flags;
 
 	if (! update)
 		return;
@@ -266,13 +257,12 @@ snd_emux_update_channel(struct snd_emux_port *port, struct snd_midi_channel *cha
 	if (snd_BUG_ON(!emu || !emu->ops.update))
 		return;
 
-	spin_lock_irqsave(&emu->voice_lock, flags);
+	guard(spinlock_irqsave)(&emu->voice_lock);
 	for (i = 0; i < emu->max_voices; i++) {
 		vp = &emu->voices[i];
 		if (vp->chan == chan)
 			update_voice(emu, vp, update);
 	}
-	spin_unlock_irqrestore(&emu->voice_lock, flags);
 }
 
 /*
@@ -284,7 +274,6 @@ snd_emux_update_port(struct snd_emux_port *port, int update)
 	struct snd_emux *emu; 
 	struct snd_emux_voice *vp;
 	int i;
-	unsigned long flags;
 
 	if (! update)
 		return;
@@ -293,13 +282,12 @@ snd_emux_update_port(struct snd_emux_port *port, int update)
 	if (snd_BUG_ON(!emu || !emu->ops.update))
 		return;
 
-	spin_lock_irqsave(&emu->voice_lock, flags);
+	guard(spinlock_irqsave)(&emu->voice_lock);
 	for (i = 0; i < emu->max_voices; i++) {
 		vp = &emu->voices[i];
 		if (vp->port == port)
 			update_voice(emu, vp, update);
 	}
-	spin_unlock_irqrestore(&emu->voice_lock, flags);
 }
 
 
@@ -365,16 +353,14 @@ terminate_note1(struct snd_emux *emu, int note, struct snd_midi_channel *chan, i
 {
 	int  i;
 	struct snd_emux_voice *vp;
-	unsigned long flags;
 
-	spin_lock_irqsave(&emu->voice_lock, flags);
+	guard(spinlock_irqsave)(&emu->voice_lock);
 	for (i = 0; i < emu->max_voices; i++) {
 		vp = &emu->voices[i];
 		if (STATE_IS_PLAYING(vp->state) && vp->chan == chan &&
 		    vp->key == note)
 			terminate_voice(emu, vp, free);
 	}
-	spin_unlock_irqrestore(&emu->voice_lock, flags);
 }
 
 
@@ -407,9 +393,8 @@ snd_emux_terminate_all(struct snd_emux *emu)
 {
 	int i;
 	struct snd_emux_voice *vp;
-	unsigned long flags;
 
-	spin_lock_irqsave(&emu->voice_lock, flags);
+	guard(spinlock_irqsave)(&emu->voice_lock);
 	for (i = 0; i < emu->max_voices; i++) {
 		vp = &emu->voices[i];
 		if (STATE_IS_PLAYING(vp->state))
@@ -424,7 +409,6 @@ snd_emux_terminate_all(struct snd_emux *emu)
 	}
 	/* initialize allocation time */
 	emu->use_time = 0;
-	spin_unlock_irqrestore(&emu->voice_lock, flags);
 }
 
 EXPORT_SYMBOL(snd_emux_terminate_all);
@@ -438,7 +422,6 @@ snd_emux_sounds_off_all(struct snd_emux_port *port)
 	int i;
 	struct snd_emux *emu;
 	struct snd_emux_voice *vp;
-	unsigned long flags;
 
 	if (snd_BUG_ON(!port))
 		return;
@@ -446,7 +429,7 @@ snd_emux_sounds_off_all(struct snd_emux_port *port)
 	if (snd_BUG_ON(!emu || !emu->ops.terminate))
 		return;
 
-	spin_lock_irqsave(&emu->voice_lock, flags);
+	guard(spinlock_irqsave)(&emu->voice_lock);
 	for (i = 0; i < emu->max_voices; i++) {
 		vp = &emu->voices[i];
 		if (STATE_IS_PLAYING(vp->state) &&
@@ -459,7 +442,6 @@ snd_emux_sounds_off_all(struct snd_emux_port *port)
 				emu->ops.reset(emu, i);
 		}
 	}
-	spin_unlock_irqrestore(&emu->voice_lock, flags);
 }
 
 
@@ -472,9 +454,8 @@ exclusive_note_off(struct snd_emux *emu, struct snd_emux_port *port, int exclass
 {
 	struct snd_emux_voice *vp;
 	int  i;
-	unsigned long flags;
 
-	spin_lock_irqsave(&emu->voice_lock, flags);
+	guard(spinlock_irqsave)(&emu->voice_lock);
 	for (i = 0; i < emu->max_voices; i++) {
 		vp = &emu->voices[i];
 		if (STATE_IS_PLAYING(vp->state) && vp->port == port &&
@@ -482,7 +463,6 @@ exclusive_note_off(struct snd_emux *emu, struct snd_emux_port *port, int exclass
 			terminate_voice(emu, vp, 0);
 		}
 	}
-	spin_unlock_irqrestore(&emu->voice_lock, flags);
 }
 
 /*
@@ -916,9 +896,8 @@ snd_emux_init_voices(struct snd_emux *emu)
 {
 	struct snd_emux_voice *vp;
 	int i;
-	unsigned long flags;
 
-	spin_lock_irqsave(&emu->voice_lock, flags);
+	guard(spinlock_irqsave)(&emu->voice_lock);
 	for (i = 0; i < emu->max_voices; i++) {
 		vp = &emu->voices[i];
 		vp->ch = -1; /* not used */
@@ -929,23 +908,19 @@ snd_emux_init_voices(struct snd_emux *emu)
 		vp->emu = emu;
 		vp->hw = emu->hw;
 	}
-	spin_unlock_irqrestore(&emu->voice_lock, flags);
 }
 
 /*
  */
 void snd_emux_lock_voice(struct snd_emux *emu, int voice)
 {
-	unsigned long flags;
-
-	spin_lock_irqsave(&emu->voice_lock, flags);
+	guard(spinlock_irqsave)(&emu->voice_lock);
 	if (emu->voices[voice].state == SNDRV_EMUX_ST_OFF)
 		emu->voices[voice].state = SNDRV_EMUX_ST_LOCKED;
 	else
 		dev_warn(emu->card->dev,
 			 "invalid voice for lock %d (state = %x)\n",
 			 voice, emu->voices[voice].state);
-	spin_unlock_irqrestore(&emu->voice_lock, flags);
 }
 
 EXPORT_SYMBOL(snd_emux_lock_voice);
@@ -954,16 +929,13 @@ EXPORT_SYMBOL(snd_emux_lock_voice);
  */
 void snd_emux_unlock_voice(struct snd_emux *emu, int voice)
 {
-	unsigned long flags;
-
-	spin_lock_irqsave(&emu->voice_lock, flags);
+	guard(spinlock_irqsave)(&emu->voice_lock);
 	if (emu->voices[voice].state == SNDRV_EMUX_ST_LOCKED)
 		emu->voices[voice].state = SNDRV_EMUX_ST_OFF;
 	else
 		dev_warn(emu->card->dev,
 			 "invalid voice for unlock %d (state = %x)\n",
 			 voice, emu->voices[voice].state);
-	spin_unlock_irqrestore(&emu->voice_lock, flags);
 }
 
 EXPORT_SYMBOL(snd_emux_unlock_voice);
diff --git a/sound/synth/emux/soundfont.c b/sound/synth/emux/soundfont.c
index b38a4e231790..cbff9f7ad38c 100644
--- a/sound/synth/emux/soundfont.c
+++ b/sound/synth/emux/soundfont.c
@@ -66,11 +66,9 @@ static void snd_sf_clear(struct snd_sf_list *sflist);
 static void
 lock_preset(struct snd_sf_list *sflist)
 {
-	unsigned long flags;
 	mutex_lock(&sflist->presets_mutex);
-	spin_lock_irqsave(&sflist->lock, flags);
+	guard(spinlock_irqsave)(&sflist->lock);
 	sflist->presets_locked = 1;
-	spin_unlock_irqrestore(&sflist->lock, flags);
 }
 
 
@@ -80,10 +78,8 @@ lock_preset(struct snd_sf_list *sflist)
 static void
 unlock_preset(struct snd_sf_list *sflist)
 {
-	unsigned long flags;
-	spin_lock_irqsave(&sflist->lock, flags);
+	guard(spinlock_irqsave)(&sflist->lock);
 	sflist->presets_locked = 0;
-	spin_unlock_irqrestore(&sflist->lock, flags);
 	mutex_unlock(&sflist->presets_mutex);
 }
 
@@ -94,14 +90,11 @@ unlock_preset(struct snd_sf_list *sflist)
 int
 snd_soundfont_close_check(struct snd_sf_list *sflist, int client)
 {
-	unsigned long flags;
-	spin_lock_irqsave(&sflist->lock, flags);
-	if (sflist->open_client == client)  {
-		spin_unlock_irqrestore(&sflist->lock, flags);
-		return close_patch(sflist);
+	scoped_guard(spinlock_irqsave, &sflist->lock) {
+		if (sflist->open_client != client)
+			return 0;
 	}
-	spin_unlock_irqrestore(&sflist->lock, flags);
-	return 0;
+	return close_patch(sflist);
 }
 
 
@@ -119,7 +112,6 @@ snd_soundfont_load(struct snd_card *card,
 		   long count, int client)
 {
 	struct soundfont_patch_info patch;
-	unsigned long flags;
 	int  rc;
 
 	if (count < (long)sizeof(patch)) {
@@ -155,12 +147,10 @@ snd_soundfont_load(struct snd_card *card,
 	}
 
 	/* check if other client already opened patch */
-	spin_lock_irqsave(&sflist->lock, flags);
-	if (sflist->open_client != client) {
-		spin_unlock_irqrestore(&sflist->lock, flags);
-		return -EBUSY;
+	scoped_guard(spinlock_irqsave, &sflist->lock) {
+		if (sflist->open_client != client)
+			return -EBUSY;
 	}
-	spin_unlock_irqrestore(&sflist->lock, flags);
 
 	lock_preset(sflist);
 	rc = -EINVAL;
@@ -223,14 +213,11 @@ open_patch(struct snd_sf_list *sflist, const char __user *data,
 {
 	struct soundfont_open_parm parm;
 	struct snd_soundfont *sf;
-	unsigned long flags;
 
-	spin_lock_irqsave(&sflist->lock, flags);
-	if (sflist->open_client >= 0 || sflist->currsf) {
-		spin_unlock_irqrestore(&sflist->lock, flags);
-		return -EBUSY;
+	scoped_guard(spinlock_irqsave, &sflist->lock) {
+		if (sflist->open_client >= 0 || sflist->currsf)
+			return -EBUSY;
 	}
-	spin_unlock_irqrestore(&sflist->lock, flags);
 
 	if (copy_from_user(&parm, data, sizeof(parm)))
 		return -EFAULT;
@@ -244,10 +231,10 @@ open_patch(struct snd_sf_list *sflist, const char __user *data,
 		return -ENOMEM;
 	}
 
-	spin_lock_irqsave(&sflist->lock, flags);
-	sflist->open_client = client;
-	sflist->currsf = sf;
-	spin_unlock_irqrestore(&sflist->lock, flags);
+	scoped_guard(spinlock_irqsave, &sflist->lock) {
+		sflist->open_client = client;
+		sflist->currsf = sf;
+	}
 
 	return 0;
 }
@@ -305,12 +292,10 @@ is_identical_font(struct snd_soundfont *sf, int type, unsigned char *name)
 static int
 close_patch(struct snd_sf_list *sflist)
 {
-	unsigned long flags;
-
-	spin_lock_irqsave(&sflist->lock, flags);
-	sflist->currsf = NULL;
-	sflist->open_client = -1;
-	spin_unlock_irqrestore(&sflist->lock, flags);
+	scoped_guard(spinlock_irqsave, &sflist->lock) {
+		sflist->currsf = NULL;
+		sflist->open_client = -1;
+	}
 
 	rebuild_presets(sflist);
 
@@ -1278,17 +1263,14 @@ snd_soundfont_search_zone(struct snd_sf_list *sflist, int *notep, int vel,
 			  struct snd_sf_zone **table, int max_layers)
 {
 	int nvoices;
-	unsigned long flags;
 
 	/* this function is supposed to be called atomically,
 	 * so we check the lock.  if it's busy, just returns 0 to
 	 * tell the caller the busy state
 	 */
-	spin_lock_irqsave(&sflist->lock, flags);
-	if (sflist->presets_locked) {
-		spin_unlock_irqrestore(&sflist->lock, flags);
+	guard(spinlock_irqsave)(&sflist->lock);
+	if (sflist->presets_locked)
 		return 0;
-	}
 	nvoices = search_zones(sflist, notep, vel, preset, bank,
 			       table, max_layers, 0);
 	if (! nvoices) {
@@ -1297,7 +1279,6 @@ snd_soundfont_search_zone(struct snd_sf_list *sflist, int *notep, int vel,
 					       def_preset, def_bank,
 					       table, max_layers, 0);
 	}
-	spin_unlock_irqrestore(&sflist->lock, flags);
 	return nvoices;
 }
 
-- 
2.50.1

