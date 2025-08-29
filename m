Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 938FE211A14
	for <linux-sound@vger.kernel.org>; Fri, 29 Aug 2025 14:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756478857; cv=none; b=YVJLf8oE+wIRWB5MGHlYSr6lY03YdulfYTM5XqNRSBqH5STlGV9QJbrFDpUxV/gG7DcYVYWJkunsQ9qYq8gozTibTJCmu4ugKeTvVPtibvvqta13oOp0NE/gX5idQ01e/yrLz4zydYpjhPRPHLjgoyG5Q05DzaDSvDBgbrmxWM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756478857; c=relaxed/simple;
	bh=145v4KIp++OYjMS6fLqgt6f1VB1X4uKja4aTjDMwmHE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G8mJFj7nP9LgIJygw4IQNW99U7hPXLQlqAKZdA+PvbykpBoDo3WDNE0TSZPKkl7WrFmejN5OPyAlQEKKgmfSpX82vLMIce2lIjh6piZIu3q7mxJwSNtqbHk0Bm6nzD6qoyXLu7DVMzmtzaH42kCDqPC5mmjZbeQyPv09NoqjZTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Y6QRCB0x; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=RMsRIiTE; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Y6QRCB0x; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=RMsRIiTE; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Y6QRCB0x";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="RMsRIiTE";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Y6QRCB0x";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="RMsRIiTE"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 4FAB35C244;
	Fri, 29 Aug 2025 14:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756478643; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JIGGxyvFV1zLQZ/cPL6SDul88/L+J7/WSc5BtNKF+m8=;
	b=Y6QRCB0xkyTKpARbG7TmJpn3KZ5t+GGRftPPNVLYls84ck+bdaGTT4KDoKhENnDaSV2dTP
	1/B5/RdBO4S7ucuW1wZAJIFr6EX32GT0aRsxpMyT2Pa+C6dDEj9j8E1mBhjveChP9rphUA
	l4qMWAJoNR4hk6iG8l+kpMTFsr8A0nE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756478643;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JIGGxyvFV1zLQZ/cPL6SDul88/L+J7/WSc5BtNKF+m8=;
	b=RMsRIiTE8VUZKY0ivQzQyZputTU82WMA1RYvHNSNxXQZHTNX3pMuLx7UuvhFSm5ZEffaWd
	SFX9K16uAmTnJtDg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756478643; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JIGGxyvFV1zLQZ/cPL6SDul88/L+J7/WSc5BtNKF+m8=;
	b=Y6QRCB0xkyTKpARbG7TmJpn3KZ5t+GGRftPPNVLYls84ck+bdaGTT4KDoKhENnDaSV2dTP
	1/B5/RdBO4S7ucuW1wZAJIFr6EX32GT0aRsxpMyT2Pa+C6dDEj9j8E1mBhjveChP9rphUA
	l4qMWAJoNR4hk6iG8l+kpMTFsr8A0nE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756478643;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JIGGxyvFV1zLQZ/cPL6SDul88/L+J7/WSc5BtNKF+m8=;
	b=RMsRIiTE8VUZKY0ivQzQyZputTU82WMA1RYvHNSNxXQZHTNX3pMuLx7UuvhFSm5ZEffaWd
	SFX9K16uAmTnJtDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 37F2D13A54;
	Fri, 29 Aug 2025 14:44:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id AE+QDLO8sWi6GAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 29 Aug 2025 14:44:03 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 52/61] ALSA: hdspm: Use guard() for spin locks
Date: Fri, 29 Aug 2025 16:43:27 +0200
Message-ID: <20250829144342.4290-53-tiwai@suse.de>
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
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLsqo7dymd5dgmoaprf5rep8is)];
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
 sound/pci/rme9652/hdspm.c | 303 ++++++++++++++++----------------------
 1 file changed, 128 insertions(+), 175 deletions(-)

diff --git a/sound/pci/rme9652/hdspm.c b/sound/pci/rme9652/hdspm.c
index a0976824beda..3ba5bdc96d9d 100644
--- a/sound/pci/rme9652/hdspm.c
+++ b/sound/pci/rme9652/hdspm.c
@@ -1204,16 +1204,11 @@ static inline void snd_hdspm_enable_out(struct hdspm * hdspm, int i, int v)
 /* check if same process is writing and reading */
 static int snd_hdspm_use_is_exclusive(struct hdspm *hdspm)
 {
-	unsigned long flags;
-	int ret = 1;
-
-	spin_lock_irqsave(&hdspm->lock, flags);
+	guard(spinlock_irqsave)(&hdspm->lock);
 	if ((hdspm->playback_pid != hdspm->capture_pid) &&
-	    (hdspm->playback_pid >= 0) && (hdspm->capture_pid >= 0)) {
-		ret = 0;
-	}
-	spin_unlock_irqrestore(&hdspm->lock, flags);
-	return ret;
+	    (hdspm->playback_pid >= 0) && (hdspm->capture_pid >= 0))
+		return 0;
+	return 1;
 }
 
 /* round arbitrary sample rates to commonly known rates */
@@ -1527,7 +1522,7 @@ static int hdspm_set_interrupt_interval(struct hdspm *s, unsigned int frames)
 {
 	int n;
 
-	spin_lock_irq(&s->lock);
+	guard(spinlock_irq)(&s->lock);
 
 	if (32 == frames) {
 		/* Special case for new RME cards like RayDAT/AIO which
@@ -1557,8 +1552,6 @@ static int hdspm_set_interrupt_interval(struct hdspm *s, unsigned int frames)
 
 	hdspm_compute_period_size(s);
 
-	spin_unlock_irq(&s->lock);
-
 	return 0;
 }
 
@@ -1846,7 +1839,6 @@ static void snd_hdspm_flush_midi_input(struct hdspm *hdspm, int id)
 
 static int snd_hdspm_midi_output_write (struct hdspm_midi *hmidi)
 {
-	unsigned long flags;
 	int n_pending;
 	int to_write;
 	int i;
@@ -1854,7 +1846,7 @@ static int snd_hdspm_midi_output_write (struct hdspm_midi *hmidi)
 
 	/* Output is not interrupt driven */
 
-	spin_lock_irqsave (&hmidi->lock, flags);
+	guard(spinlock_irqsave)(&hmidi->lock);
 	if (hmidi->output &&
 	    !snd_rawmidi_transmit_empty (hmidi->output)) {
 		n_pending = snd_hdspm_midi_output_possible (hmidi->hdspm,
@@ -1873,7 +1865,6 @@ static int snd_hdspm_midi_output_write (struct hdspm_midi *hmidi)
 			}
 		}
 	}
-	spin_unlock_irqrestore (&hmidi->lock, flags);
 	return 0;
 }
 
@@ -1882,37 +1873,36 @@ static int snd_hdspm_midi_input_read (struct hdspm_midi *hmidi)
 	unsigned char buf[128]; /* this buffer is designed to match the MIDI
 				 * input FIFO size
 				 */
-	unsigned long flags;
 	int n_pending;
 	int i;
 
-	spin_lock_irqsave (&hmidi->lock, flags);
-	n_pending = snd_hdspm_midi_input_available (hmidi->hdspm, hmidi->id);
-	if (n_pending > 0) {
-		if (hmidi->input) {
-			if (n_pending > (int)sizeof (buf))
-				n_pending = sizeof (buf);
-			for (i = 0; i < n_pending; ++i)
-				buf[i] = snd_hdspm_midi_read_byte (hmidi->hdspm,
-								   hmidi->id);
-			if (n_pending)
-				snd_rawmidi_receive (hmidi->input, buf,
-						     n_pending);
-		} else {
-			/* flush the MIDI input FIFO */
-			while (n_pending--)
-				snd_hdspm_midi_read_byte (hmidi->hdspm,
-							  hmidi->id);
+	scoped_guard(spinlock_irqsave, &hmidi->lock) {
+		n_pending = snd_hdspm_midi_input_available(hmidi->hdspm, hmidi->id);
+		if (n_pending > 0) {
+			if (hmidi->input) {
+				if (n_pending > (int)sizeof(buf))
+					n_pending = sizeof(buf);
+				for (i = 0; i < n_pending; ++i)
+					buf[i] = snd_hdspm_midi_read_byte(hmidi->hdspm,
+									  hmidi->id);
+				if (n_pending)
+					snd_rawmidi_receive(hmidi->input, buf,
+							    n_pending);
+			} else {
+				/* flush the MIDI input FIFO */
+				while (n_pending--)
+					snd_hdspm_midi_read_byte(hmidi->hdspm,
+								 hmidi->id);
+			}
 		}
+		hmidi->pending = 0;
 	}
-	hmidi->pending = 0;
-	spin_unlock_irqrestore(&hmidi->lock, flags);
 
-	spin_lock_irqsave(&hmidi->hdspm->lock, flags);
-	hmidi->hdspm->control_register |= hmidi->ie;
-	hdspm_write(hmidi->hdspm, HDSPM_controlRegister,
-		    hmidi->hdspm->control_register);
-	spin_unlock_irqrestore(&hmidi->hdspm->lock, flags);
+	scoped_guard(spinlock_irqsave, &hmidi->hdspm->lock) {
+		hmidi->hdspm->control_register |= hmidi->ie;
+		hdspm_write(hmidi->hdspm, HDSPM_controlRegister,
+			    hmidi->hdspm->control_register);
+	}
 
 	return snd_hdspm_midi_output_write (hmidi);
 }
@@ -1922,12 +1912,11 @@ snd_hdspm_midi_input_trigger(struct snd_rawmidi_substream *substream, int up)
 {
 	struct hdspm *hdspm;
 	struct hdspm_midi *hmidi;
-	unsigned long flags;
 
 	hmidi = substream->rmidi->private_data;
 	hdspm = hmidi->hdspm;
 
-	spin_lock_irqsave (&hdspm->lock, flags);
+	guard(spinlock_irqsave)(&hdspm->lock);
 	if (up) {
 		if (!(hdspm->control_register & hmidi->ie)) {
 			snd_hdspm_flush_midi_input (hdspm, hmidi->id);
@@ -1938,16 +1927,14 @@ snd_hdspm_midi_input_trigger(struct snd_rawmidi_substream *substream, int up)
 	}
 
 	hdspm_write(hdspm, HDSPM_controlRegister, hdspm->control_register);
-	spin_unlock_irqrestore (&hdspm->lock, flags);
 }
 
 static void snd_hdspm_midi_output_timer(struct timer_list *t)
 {
 	struct hdspm_midi *hmidi = timer_container_of(hmidi, t, timer);
-	unsigned long flags;
 
 	snd_hdspm_midi_output_write(hmidi);
-	spin_lock_irqsave (&hmidi->lock, flags);
+	guard(spinlock_irqsave)(&hmidi->lock);
 
 	/* this does not bump hmidi->istimer, because the
 	   kernel automatically removed the timer when it
@@ -1957,30 +1944,27 @@ static void snd_hdspm_midi_output_timer(struct timer_list *t)
 
 	if (hmidi->istimer)
 		mod_timer(&hmidi->timer, 1 + jiffies);
-
-	spin_unlock_irqrestore (&hmidi->lock, flags);
 }
 
 static void
 snd_hdspm_midi_output_trigger(struct snd_rawmidi_substream *substream, int up)
 {
 	struct hdspm_midi *hmidi;
-	unsigned long flags;
 
 	hmidi = substream->rmidi->private_data;
-	spin_lock_irqsave (&hmidi->lock, flags);
-	if (up) {
-		if (!hmidi->istimer) {
-			timer_setup(&hmidi->timer,
-				    snd_hdspm_midi_output_timer, 0);
-			mod_timer(&hmidi->timer, 1 + jiffies);
-			hmidi->istimer++;
+	scoped_guard(spinlock_irqsave, &hmidi->lock) {
+		if (up) {
+			if (!hmidi->istimer) {
+				timer_setup(&hmidi->timer,
+					    snd_hdspm_midi_output_timer, 0);
+				mod_timer(&hmidi->timer, 1 + jiffies);
+				hmidi->istimer++;
+			}
+		} else {
+			if (hmidi->istimer && --hmidi->istimer <= 0)
+				timer_delete(&hmidi->timer);
 		}
-	} else {
-		if (hmidi->istimer && --hmidi->istimer <= 0)
-			timer_delete(&hmidi->timer);
 	}
-	spin_unlock_irqrestore (&hmidi->lock, flags);
 	if (up)
 		snd_hdspm_midi_output_write(hmidi);
 }
@@ -1990,10 +1974,9 @@ static int snd_hdspm_midi_input_open(struct snd_rawmidi_substream *substream)
 	struct hdspm_midi *hmidi;
 
 	hmidi = substream->rmidi->private_data;
-	spin_lock_irq (&hmidi->lock);
+	guard(spinlock_irq)(&hmidi->lock);
 	snd_hdspm_flush_midi_input (hmidi->hdspm, hmidi->id);
 	hmidi->input = substream;
-	spin_unlock_irq (&hmidi->lock);
 
 	return 0;
 }
@@ -2003,9 +1986,8 @@ static int snd_hdspm_midi_output_open(struct snd_rawmidi_substream *substream)
 	struct hdspm_midi *hmidi;
 
 	hmidi = substream->rmidi->private_data;
-	spin_lock_irq (&hmidi->lock);
+	guard(spinlock_irq)(&hmidi->lock);
 	hmidi->output = substream;
-	spin_unlock_irq (&hmidi->lock);
 
 	return 0;
 }
@@ -2017,9 +1999,8 @@ static int snd_hdspm_midi_input_close(struct snd_rawmidi_substream *substream)
 	snd_hdspm_midi_input_trigger (substream, 0);
 
 	hmidi = substream->rmidi->private_data;
-	spin_lock_irq (&hmidi->lock);
+	guard(spinlock_irq)(&hmidi->lock);
 	hmidi->input = NULL;
-	spin_unlock_irq (&hmidi->lock);
 
 	return 0;
 }
@@ -2031,9 +2012,8 @@ static int snd_hdspm_midi_output_close(struct snd_rawmidi_substream *substream)
 	snd_hdspm_midi_output_trigger (substream, 0);
 
 	hmidi = substream->rmidi->private_data;
-	spin_lock_irq (&hmidi->lock);
+	guard(spinlock_irq)(&hmidi->lock);
 	hmidi->output = NULL;
-	spin_unlock_irq (&hmidi->lock);
 
 	return 0;
 }
@@ -2671,12 +2651,11 @@ static int snd_hdspm_put_clock_source(struct snd_kcontrol *kcontrol,
 		val = 0;
 	if (val > 9)
 		val = 9;
-	spin_lock_irq(&hdspm->lock);
+	guard(spinlock_irq)(&hdspm->lock);
 	if (val != hdspm_clock_source(hdspm))
 		change = (hdspm_set_clock_source(hdspm, val) == 0) ? 1 : 0;
 	else
 		change = 0;
-	spin_unlock_irq(&hdspm->lock);
 	return change;
 }
 
@@ -2999,11 +2978,10 @@ static int snd_hdspm_put_pref_sync_ref(struct snd_kcontrol *kcontrol,
 	else if (val >= hdspm->texts_autosync_items)
 		val = hdspm->texts_autosync_items-1;
 
-	spin_lock_irq(&hdspm->lock);
+	guard(spinlock_irq)(&hdspm->lock);
 	if (val != hdspm_pref_sync_ref(hdspm))
 		change = (0 == hdspm_set_pref_sync_ref(hdspm, val)) ? 1 : 0;
 
-	spin_unlock_irq(&hdspm->lock);
 	return change;
 }
 
@@ -3239,9 +3217,8 @@ static int snd_hdspm_get_toggle_setting(struct snd_kcontrol *kcontrol,
 	struct hdspm *hdspm = snd_kcontrol_chip(kcontrol);
 	u32 regmask = kcontrol->private_value;
 
-	spin_lock_irq(&hdspm->lock);
+	guard(spinlock_irq)(&hdspm->lock);
 	ucontrol->value.integer.value[0] = hdspm_toggle_setting(hdspm, regmask);
-	spin_unlock_irq(&hdspm->lock);
 	return 0;
 }
 
@@ -3256,10 +3233,9 @@ static int snd_hdspm_put_toggle_setting(struct snd_kcontrol *kcontrol,
 	if (!snd_hdspm_use_is_exclusive(hdspm))
 		return -EBUSY;
 	val = ucontrol->value.integer.value[0] & 1;
-	spin_lock_irq(&hdspm->lock);
+	guard(spinlock_irq)(&hdspm->lock);
 	change = (int) val != hdspm_toggle_setting(hdspm, regmask);
 	hdspm_set_toggle_setting(hdspm, regmask, val);
-	spin_unlock_irq(&hdspm->lock);
 	return change;
 }
 
@@ -3301,9 +3277,8 @@ static int snd_hdspm_get_input_select(struct snd_kcontrol *kcontrol,
 {
 	struct hdspm *hdspm = snd_kcontrol_chip(kcontrol);
 
-	spin_lock_irq(&hdspm->lock);
+	guard(spinlock_irq)(&hdspm->lock);
 	ucontrol->value.enumerated.item[0] = hdspm_input_select(hdspm);
-	spin_unlock_irq(&hdspm->lock);
 	return 0;
 }
 
@@ -3317,10 +3292,9 @@ static int snd_hdspm_put_input_select(struct snd_kcontrol *kcontrol,
 	if (!snd_hdspm_use_is_exclusive(hdspm))
 		return -EBUSY;
 	val = ucontrol->value.integer.value[0] & 1;
-	spin_lock_irq(&hdspm->lock);
+	guard(spinlock_irq)(&hdspm->lock);
 	change = (int) val != hdspm_input_select(hdspm);
 	hdspm_set_input_select(hdspm, val);
-	spin_unlock_irq(&hdspm->lock);
 	return change;
 }
 
@@ -3363,9 +3337,8 @@ static int snd_hdspm_get_ds_wire(struct snd_kcontrol *kcontrol,
 {
 	struct hdspm *hdspm = snd_kcontrol_chip(kcontrol);
 
-	spin_lock_irq(&hdspm->lock);
+	guard(spinlock_irq)(&hdspm->lock);
 	ucontrol->value.enumerated.item[0] = hdspm_ds_wire(hdspm);
-	spin_unlock_irq(&hdspm->lock);
 	return 0;
 }
 
@@ -3379,10 +3352,9 @@ static int snd_hdspm_put_ds_wire(struct snd_kcontrol *kcontrol,
 	if (!snd_hdspm_use_is_exclusive(hdspm))
 		return -EBUSY;
 	val = ucontrol->value.integer.value[0] & 1;
-	spin_lock_irq(&hdspm->lock);
+	guard(spinlock_irq)(&hdspm->lock);
 	change = (int) val != hdspm_ds_wire(hdspm);
 	hdspm_set_ds_wire(hdspm, val);
-	spin_unlock_irq(&hdspm->lock);
 	return change;
 }
 
@@ -3436,9 +3408,8 @@ static int snd_hdspm_get_qs_wire(struct snd_kcontrol *kcontrol,
 {
 	struct hdspm *hdspm = snd_kcontrol_chip(kcontrol);
 
-	spin_lock_irq(&hdspm->lock);
+	guard(spinlock_irq)(&hdspm->lock);
 	ucontrol->value.enumerated.item[0] = hdspm_qs_wire(hdspm);
-	spin_unlock_irq(&hdspm->lock);
 	return 0;
 }
 
@@ -3456,10 +3427,9 @@ static int snd_hdspm_put_qs_wire(struct snd_kcontrol *kcontrol,
 		val = 0;
 	if (val > 2)
 		val = 2;
-	spin_lock_irq(&hdspm->lock);
+	guard(spinlock_irq)(&hdspm->lock);
 	change = val != hdspm_qs_wire(hdspm);
 	hdspm_set_qs_wire(hdspm, val);
-	spin_unlock_irq(&hdspm->lock);
 	return change;
 }
 
@@ -3512,9 +3482,8 @@ static int snd_hdspm_get_tristate(struct snd_kcontrol *kcontrol,
 	struct hdspm *hdspm = snd_kcontrol_chip(kcontrol);
 	u32 regmask = kcontrol->private_value;
 
-	spin_lock_irq(&hdspm->lock);
+	guard(spinlock_irq)(&hdspm->lock);
 	ucontrol->value.enumerated.item[0] = hdspm_tristate(hdspm, regmask);
-	spin_unlock_irq(&hdspm->lock);
 	return 0;
 }
 
@@ -3534,10 +3503,9 @@ static int snd_hdspm_put_tristate(struct snd_kcontrol *kcontrol,
 	if (val > 2)
 		val = 2;
 
-	spin_lock_irq(&hdspm->lock);
+	guard(spinlock_irq)(&hdspm->lock);
 	change = val != hdspm_tristate(hdspm, regmask);
 	hdspm_set_tristate(hdspm, val, regmask);
-	spin_unlock_irq(&hdspm->lock);
 	return change;
 }
 
@@ -3590,9 +3558,8 @@ static int snd_hdspm_get_madi_speedmode(struct snd_kcontrol *kcontrol,
 {
 	struct hdspm *hdspm = snd_kcontrol_chip(kcontrol);
 
-	spin_lock_irq(&hdspm->lock);
+	guard(spinlock_irq)(&hdspm->lock);
 	ucontrol->value.enumerated.item[0] = hdspm_madi_speedmode(hdspm);
-	spin_unlock_irq(&hdspm->lock);
 	return 0;
 }
 
@@ -3610,10 +3577,9 @@ static int snd_hdspm_put_madi_speedmode(struct snd_kcontrol *kcontrol,
 		val = 0;
 	if (val > 2)
 		val = 2;
-	spin_lock_irq(&hdspm->lock);
+	guard(spinlock_irq)(&hdspm->lock);
 	change = val != hdspm_madi_speedmode(hdspm);
 	hdspm_set_madi_speedmode(hdspm, val);
-	spin_unlock_irq(&hdspm->lock);
 	return change;
 }
 
@@ -3659,7 +3625,7 @@ static int snd_hdspm_get_mixer(struct snd_kcontrol *kcontrol,
 	else if (destination >= HDSPM_MAX_CHANNELS)
 		destination = HDSPM_MAX_CHANNELS - 1;
 
-	spin_lock_irq(&hdspm->lock);
+	guard(spinlock_irq)(&hdspm->lock);
 	if (source >= HDSPM_MAX_CHANNELS)
 		ucontrol->value.integer.value[2] =
 		    hdspm_read_pb_gain(hdspm, destination,
@@ -3668,8 +3634,6 @@ static int snd_hdspm_get_mixer(struct snd_kcontrol *kcontrol,
 		ucontrol->value.integer.value[2] =
 		    hdspm_read_in_gain(hdspm, destination, source);
 
-	spin_unlock_irq(&hdspm->lock);
-
 	return 0;
 }
 
@@ -3695,7 +3659,7 @@ static int snd_hdspm_put_mixer(struct snd_kcontrol *kcontrol,
 
 	gain = ucontrol->value.integer.value[2];
 
-	spin_lock_irq(&hdspm->lock);
+	guard(spinlock_irq)(&hdspm->lock);
 
 	if (source >= HDSPM_MAX_CHANNELS)
 		change = gain != hdspm_read_pb_gain(hdspm, destination,
@@ -3714,7 +3678,6 @@ static int snd_hdspm_put_mixer(struct snd_kcontrol *kcontrol,
 			hdspm_write_in_gain(hdspm, destination, source,
 					    gain);
 	}
-	spin_unlock_irq(&hdspm->lock);
 
 	return change;
 }
@@ -3755,10 +3718,9 @@ static int snd_hdspm_get_playback_mixer(struct snd_kcontrol *kcontrol,
 	if (snd_BUG_ON(channel < 0 || channel >= HDSPM_MAX_CHANNELS))
 		return -EINVAL;
 
-	spin_lock_irq(&hdspm->lock);
+	guard(spinlock_irq)(&hdspm->lock);
 	ucontrol->value.integer.value[0] =
 	  (hdspm_read_pb_gain(hdspm, channel, channel)*64)/UNITY_GAIN;
-	spin_unlock_irq(&hdspm->lock);
 
 	return 0;
 }
@@ -3781,14 +3743,13 @@ static int snd_hdspm_put_playback_mixer(struct snd_kcontrol *kcontrol,
 
 	gain = ucontrol->value.integer.value[0]*UNITY_GAIN/64;
 
-	spin_lock_irq(&hdspm->lock);
+	guard(spinlock_irq)(&hdspm->lock);
 	change =
 	    gain != hdspm_read_pb_gain(hdspm, channel,
 				       channel);
 	if (change)
 		hdspm_write_pb_gain(hdspm, channel, channel,
 				    gain);
-	spin_unlock_irq(&hdspm->lock);
 	return change;
 }
 
@@ -5496,53 +5457,50 @@ static int snd_hdspm_hw_params(struct snd_pcm_substream *substream,
 	pid_t this_pid;
 	pid_t other_pid;
 
-	spin_lock_irq(&hdspm->lock);
+	scoped_guard(spinlock_irq, &hdspm->lock) {
 
-	if (substream->pstr->stream == SNDRV_PCM_STREAM_PLAYBACK) {
-		this_pid = hdspm->playback_pid;
-		other_pid = hdspm->capture_pid;
-	} else {
-		this_pid = hdspm->capture_pid;
-		other_pid = hdspm->playback_pid;
-	}
-
-	if (other_pid > 0 && this_pid != other_pid) {
-
-		/* The other stream is open, and not by the same
-		   task as this one. Make sure that the parameters
-		   that matter are the same.
-		   */
-
-		if (params_rate(params) != hdspm->system_sample_rate) {
-			spin_unlock_irq(&hdspm->lock);
-			_snd_pcm_hw_param_setempty(params,
-					SNDRV_PCM_HW_PARAM_RATE);
-			return -EBUSY;
+		if (substream->pstr->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+			this_pid = hdspm->playback_pid;
+			other_pid = hdspm->capture_pid;
+		} else {
+			this_pid = hdspm->capture_pid;
+			other_pid = hdspm->playback_pid;
 		}
 
-		if (params_period_size(params) != hdspm->period_bytes / 4) {
-			spin_unlock_irq(&hdspm->lock);
-			_snd_pcm_hw_param_setempty(params,
-					SNDRV_PCM_HW_PARAM_PERIOD_SIZE);
-			return -EBUSY;
-		}
+		if (other_pid > 0 && this_pid != other_pid) {
 
+			/* The other stream is open, and not by the same
+			   task as this one. Make sure that the parameters
+			   that matter are the same.
+			*/
+
+			if (params_rate(params) != hdspm->system_sample_rate) {
+				_snd_pcm_hw_param_setempty(params,
+							   SNDRV_PCM_HW_PARAM_RATE);
+				return -EBUSY;
+			}
+
+			if (params_period_size(params) != hdspm->period_bytes / 4) {
+				_snd_pcm_hw_param_setempty(params,
+							   SNDRV_PCM_HW_PARAM_PERIOD_SIZE);
+				return -EBUSY;
+			}
+
+		}
 	}
 	/* We're fine. */
-	spin_unlock_irq(&hdspm->lock);
 
 	/* how to make sure that the rate matches an externally-set one ?   */
 
-	spin_lock_irq(&hdspm->lock);
-	err = hdspm_set_rate(hdspm, params_rate(params), 0);
-	if (err < 0) {
-		dev_info(hdspm->card->dev, "err on hdspm_set_rate: %d\n", err);
-		spin_unlock_irq(&hdspm->lock);
-		_snd_pcm_hw_param_setempty(params,
-				SNDRV_PCM_HW_PARAM_RATE);
-		return err;
+	scoped_guard(spinlock_irq, &hdspm->lock) {
+		err = hdspm_set_rate(hdspm, params_rate(params), 0);
+		if (err < 0) {
+			dev_info(hdspm->card->dev, "err on hdspm_set_rate: %d\n", err);
+			_snd_pcm_hw_param_setempty(params,
+						   SNDRV_PCM_HW_PARAM_RATE);
+			return err;
+		}
 	}
-	spin_unlock_irq(&hdspm->lock);
 
 	err = hdspm_set_interrupt_interval(hdspm,
 			params_period_size(params));
@@ -5750,7 +5708,7 @@ static int snd_hdspm_trigger(struct snd_pcm_substream *substream, int cmd)
 	struct snd_pcm_substream *other;
 	int running;
 
-	spin_lock(&hdspm->lock);
+	guard(spinlock)(&hdspm->lock);
 	running = hdspm->running;
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
@@ -5761,7 +5719,6 @@ static int snd_hdspm_trigger(struct snd_pcm_substream *substream, int cmd)
 		break;
 	default:
 		snd_BUG();
-		spin_unlock(&hdspm->lock);
 		return -EINVAL;
 	}
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
@@ -5802,7 +5759,6 @@ static int snd_hdspm_trigger(struct snd_pcm_substream *substream, int cmd)
 	else if (hdspm->running && !running)
 		hdspm_stop_audio(hdspm);
 	hdspm->running = running;
-	spin_unlock(&hdspm->lock);
 
 	return 0;
 }
@@ -6035,27 +5991,26 @@ static int snd_hdspm_open(struct snd_pcm_substream *substream)
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	bool playback = (substream->stream == SNDRV_PCM_STREAM_PLAYBACK);
 
-	spin_lock_irq(&hdspm->lock);
-	snd_pcm_set_sync(substream);
-	runtime->hw = (playback) ? snd_hdspm_playback_subinfo :
-		snd_hdspm_capture_subinfo;
+	scoped_guard(spinlock_irq, &hdspm->lock) {
+		snd_pcm_set_sync(substream);
+		runtime->hw = (playback) ? snd_hdspm_playback_subinfo :
+			snd_hdspm_capture_subinfo;
 
-	if (playback) {
-		if (!hdspm->capture_substream)
-			hdspm_stop_audio(hdspm);
+		if (playback) {
+			if (!hdspm->capture_substream)
+				hdspm_stop_audio(hdspm);
 
-		hdspm->playback_pid = current->pid;
-		hdspm->playback_substream = substream;
-	} else {
-		if (!hdspm->playback_substream)
-			hdspm_stop_audio(hdspm);
+			hdspm->playback_pid = current->pid;
+			hdspm->playback_substream = substream;
+		} else {
+			if (!hdspm->playback_substream)
+				hdspm_stop_audio(hdspm);
 
-		hdspm->capture_pid = current->pid;
-		hdspm->capture_substream = substream;
+			hdspm->capture_pid = current->pid;
+			hdspm->capture_substream = substream;
+		}
 	}
 
-	spin_unlock_irq(&hdspm->lock);
-
 	snd_pcm_hw_constraint_msbits(runtime, 0, 32, 24);
 	snd_pcm_hw_constraint_pow2(runtime, 0, SNDRV_PCM_HW_PARAM_PERIOD_SIZE);
 
@@ -6108,7 +6063,7 @@ static int snd_hdspm_release(struct snd_pcm_substream *substream)
 	struct hdspm *hdspm = snd_pcm_substream_chip(substream);
 	bool playback = (substream->stream == SNDRV_PCM_STREAM_PLAYBACK);
 
-	spin_lock_irq(&hdspm->lock);
+	guard(spinlock_irq)(&hdspm->lock);
 
 	if (playback) {
 		hdspm->playback_pid = -1;
@@ -6118,8 +6073,6 @@ static int snd_hdspm_release(struct snd_pcm_substream *substream)
 		hdspm->capture_substream = NULL;
 	}
 
-	spin_unlock_irq(&hdspm->lock);
-
 	return 0;
 }
 
@@ -6242,19 +6195,19 @@ static int snd_hdspm_hwdep_ioctl(struct snd_hwdep *hw, struct file *file,
 	case SNDRV_HDSPM_IOCTL_GET_CONFIG:
 
 		memset(&info, 0, sizeof(info));
-		spin_lock_irq(&hdspm->lock);
-		info.pref_sync_ref = hdspm_pref_sync_ref(hdspm);
-		info.wordclock_sync_check = hdspm_wc_sync_check(hdspm);
+		scoped_guard(spinlock_irq, &hdspm->lock) {
+			info.pref_sync_ref = hdspm_pref_sync_ref(hdspm);
+			info.wordclock_sync_check = hdspm_wc_sync_check(hdspm);
 
-		info.system_sample_rate = hdspm->system_sample_rate;
-		info.autosync_sample_rate =
-			hdspm_external_sample_rate(hdspm);
-		info.system_clock_mode = hdspm_system_clock_mode(hdspm);
-		info.clock_source = hdspm_clock_source(hdspm);
-		info.autosync_ref = hdspm_autosync_ref(hdspm);
-		info.line_out = hdspm_toggle_setting(hdspm, HDSPM_LineOut);
-		info.passthru = 0;
-		spin_unlock_irq(&hdspm->lock);
+			info.system_sample_rate = hdspm->system_sample_rate;
+			info.autosync_sample_rate =
+				hdspm_external_sample_rate(hdspm);
+			info.system_clock_mode = hdspm_system_clock_mode(hdspm);
+			info.clock_source = hdspm_clock_source(hdspm);
+			info.autosync_ref = hdspm_autosync_ref(hdspm);
+			info.line_out = hdspm_toggle_setting(hdspm, HDSPM_LineOut);
+			info.passthru = 0;
+		}
 		if (copy_to_user(argp, &info, sizeof(info)))
 			return -EFAULT;
 		break;
-- 
2.50.1

