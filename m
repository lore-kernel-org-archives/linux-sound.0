Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4CE129E110
	for <linux-sound@vger.kernel.org>; Fri, 29 Aug 2025 14:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756478851; cv=none; b=tmZfLcSF8AU6Y20wH3FeCQlMOaq36KewFEX3Uqvk48iqy72DoIt2/u754+RYm5F6XWlHTYZSu7mwFeSRoOPFsroAGgqRgVQUoewEXoVDqDxHf8aHNojKOgHxzBHyrB3kSRc16pPywGM3PkUR2SMc8WxK8d+DAMHYXntUY++iD4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756478851; c=relaxed/simple;
	bh=gLyjOldM1tLoKSlODlN5JZd0Lm4LBXuJKTUfjUlKdmM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FSNAoU2/C5sFLRsiO3dUc6+q+xfoJPhpd09D5CmP7aBpze4QdNJlrSre/p7dpR4mjD79NwXriwmrmyURT2fqni8Y1H0JkQ9wKHgc9S5ydxugFza7LmQKbh9Fosq8cKkA6uQxH5YEcJ3ISGUJZIr2XoA9vKYGXXTEKELgIDi5Cns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=jCAl5uzD; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=H/8rB+yD; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=jCAl5uzD; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=H/8rB+yD; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="jCAl5uzD";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="H/8rB+yD";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="jCAl5uzD";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="H/8rB+yD"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 331145C242;
	Fri, 29 Aug 2025 14:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756478643; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PYRJJ/hnmzATCXj3750lbK985MOabnHa35JMiELAt6M=;
	b=jCAl5uzDHjIh5lkCkLsWwfXlUyLL3go93akVOb/+qkcpD/argqoclUx+VvxA/R55J1hC9+
	RXn2/y8/ZwhYYH2GR44g8wUsA4jV/jEo/7xNEGyoMPe2W7boy8d0iMsrduU4YLVCZWCSpd
	FaTn+KaGv0rQcCKvgtHCvthvcZg2Htk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756478643;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PYRJJ/hnmzATCXj3750lbK985MOabnHa35JMiELAt6M=;
	b=H/8rB+yDFV045Es80C6iEweiLYtICyUsuDugP/AoMSDDDWlMIUqt4xv/wsShlVaRNynTfB
	JLh+ugcPsfVqp/Aw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756478643; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PYRJJ/hnmzATCXj3750lbK985MOabnHa35JMiELAt6M=;
	b=jCAl5uzDHjIh5lkCkLsWwfXlUyLL3go93akVOb/+qkcpD/argqoclUx+VvxA/R55J1hC9+
	RXn2/y8/ZwhYYH2GR44g8wUsA4jV/jEo/7xNEGyoMPe2W7boy8d0iMsrduU4YLVCZWCSpd
	FaTn+KaGv0rQcCKvgtHCvthvcZg2Htk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756478643;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PYRJJ/hnmzATCXj3750lbK985MOabnHa35JMiELAt6M=;
	b=H/8rB+yDFV045Es80C6iEweiLYtICyUsuDugP/AoMSDDDWlMIUqt4xv/wsShlVaRNynTfB
	JLh+ugcPsfVqp/Aw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1A67913A3E;
	Fri, 29 Aug 2025 14:44:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id WCFeBbO8sWi6GAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 29 Aug 2025 14:44:03 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 51/61] ALSA: hdsp: Use guard() for spin locks
Date: Fri, 29 Aug 2025 16:43:26 +0200
Message-ID: <20250829144342.4290-52-tiwai@suse.de>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLsqo7dymd5dgmoaprf5rep8is)];
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
 sound/pci/rme9652/hdsp.c | 309 ++++++++++++++++-----------------------
 1 file changed, 124 insertions(+), 185 deletions(-)

diff --git a/sound/pci/rme9652/hdsp.c b/sound/pci/rme9652/hdsp.c
index 7ce73746168a..31cc2d91c8d2 100644
--- a/sound/pci/rme9652/hdsp.c
+++ b/sound/pci/rme9652/hdsp.c
@@ -691,7 +691,6 @@ static int hdsp_wait_for_iobox(struct hdsp *hdsp, unsigned int loops,
 static int snd_hdsp_load_firmware_from_cache(struct hdsp *hdsp) {
 
 	int i;
-	unsigned long flags;
 	const u32 *cache;
 
 	if (hdsp->fw_uploaded)
@@ -746,9 +745,8 @@ static int snd_hdsp_load_firmware_from_cache(struct hdsp *hdsp) {
 	if (hdsp->state & HDSP_InitializationComplete) {
 		dev_info(hdsp->card->dev,
 			 "firmware loaded from cache, restoring defaults\n");
-		spin_lock_irqsave(&hdsp->lock, flags);
+		guard(spinlock_irqsave)(&hdsp->lock);
 		snd_hdsp_set_defaults(hdsp);
-		spin_unlock_irqrestore(&hdsp->lock, flags);
 	}
 
 	hdsp->state |= HDSP_FirmwareLoaded;
@@ -939,14 +937,12 @@ static int hdsp_write_gain(struct hdsp *hdsp, unsigned int addr, unsigned short
 
 static int snd_hdsp_use_is_exclusive(struct hdsp *hdsp)
 {
-	unsigned long flags;
 	int ret = 1;
 
-	spin_lock_irqsave(&hdsp->lock, flags);
+	guard(spinlock_irqsave)(&hdsp->lock);
 	if ((hdsp->playback_pid != hdsp->capture_pid) &&
 	    (hdsp->playback_pid >= 0) && (hdsp->capture_pid >= 0))
 		ret = 0;
-	spin_unlock_irqrestore(&hdsp->lock, flags);
 	return ret;
 }
 
@@ -1063,8 +1059,6 @@ static int hdsp_set_interrupt_interval(struct hdsp *s, unsigned int frames)
 {
 	int n;
 
-	spin_lock_irq(&s->lock);
-
 	frames >>= 7;
 	n = 0;
 	while (frames) {
@@ -1079,8 +1073,6 @@ static int hdsp_set_interrupt_interval(struct hdsp *s, unsigned int frames)
 
 	hdsp_compute_period_size(s);
 
-	spin_unlock_irq(&s->lock);
-
 	return 0;
 }
 
@@ -1306,7 +1298,6 @@ static void snd_hdsp_flush_midi_input (struct hdsp *hdsp, int id)
 
 static int snd_hdsp_midi_output_write (struct hdsp_midi *hmidi)
 {
-	unsigned long flags;
 	int n_pending;
 	int to_write;
 	int i;
@@ -1314,7 +1305,7 @@ static int snd_hdsp_midi_output_write (struct hdsp_midi *hmidi)
 
 	/* Output is not interrupt driven */
 
-	spin_lock_irqsave (&hmidi->lock, flags);
+	guard(spinlock_irqsave)(&hmidi->lock);
 	if (hmidi->output) {
 		if (!snd_rawmidi_transmit_empty (hmidi->output)) {
 			n_pending = snd_hdsp_midi_output_possible(hmidi->hdsp, hmidi->id);
@@ -1330,40 +1321,38 @@ static int snd_hdsp_midi_output_write (struct hdsp_midi *hmidi)
 			}
 		}
 	}
-	spin_unlock_irqrestore (&hmidi->lock, flags);
 	return 0;
 }
 
 static int snd_hdsp_midi_input_read (struct hdsp_midi *hmidi)
 {
 	unsigned char buf[128]; /* this buffer is designed to match the MIDI input FIFO size */
-	unsigned long flags;
 	int n_pending;
 	int i;
 
-	spin_lock_irqsave (&hmidi->lock, flags);
-	n_pending = snd_hdsp_midi_input_available(hmidi->hdsp, hmidi->id);
-	if (n_pending > 0) {
-		if (hmidi->input) {
-			if (n_pending > (int)sizeof (buf))
-				n_pending = sizeof (buf);
-			for (i = 0; i < n_pending; ++i)
-				buf[i] = snd_hdsp_midi_read_byte (hmidi->hdsp, hmidi->id);
-			if (n_pending)
-				snd_rawmidi_receive (hmidi->input, buf, n_pending);
-		} else {
-			/* flush the MIDI input FIFO */
-			while (--n_pending)
-				snd_hdsp_midi_read_byte (hmidi->hdsp, hmidi->id);
+	scoped_guard(spinlock_irqsave, &hmidi->lock) {
+		n_pending = snd_hdsp_midi_input_available(hmidi->hdsp, hmidi->id);
+		if (n_pending > 0) {
+			if (hmidi->input) {
+				if (n_pending > (int)sizeof(buf))
+					n_pending = sizeof(buf);
+				for (i = 0; i < n_pending; ++i)
+					buf[i] = snd_hdsp_midi_read_byte(hmidi->hdsp, hmidi->id);
+				if (n_pending)
+					snd_rawmidi_receive(hmidi->input, buf, n_pending);
+			} else {
+				/* flush the MIDI input FIFO */
+				while (--n_pending)
+					snd_hdsp_midi_read_byte(hmidi->hdsp, hmidi->id);
+			}
 		}
+		hmidi->pending = 0;
+		if (hmidi->id)
+			hmidi->hdsp->control_register |= HDSP_Midi1InterruptEnable;
+		else
+			hmidi->hdsp->control_register |= HDSP_Midi0InterruptEnable;
+		hdsp_write(hmidi->hdsp, HDSP_controlRegister, hmidi->hdsp->control_register);
 	}
-	hmidi->pending = 0;
-	if (hmidi->id)
-		hmidi->hdsp->control_register |= HDSP_Midi1InterruptEnable;
-	else
-		hmidi->hdsp->control_register |= HDSP_Midi0InterruptEnable;
-	hdsp_write(hmidi->hdsp, HDSP_controlRegister, hmidi->hdsp->control_register);
-	spin_unlock_irqrestore (&hmidi->lock, flags);
 	return snd_hdsp_midi_output_write (hmidi);
 }
 
@@ -1371,13 +1360,12 @@ static void snd_hdsp_midi_input_trigger(struct snd_rawmidi_substream *substream,
 {
 	struct hdsp *hdsp;
 	struct hdsp_midi *hmidi;
-	unsigned long flags;
 	u32 ie;
 
 	hmidi = (struct hdsp_midi *) substream->rmidi->private_data;
 	hdsp = hmidi->hdsp;
 	ie = hmidi->id ? HDSP_Midi1InterruptEnable : HDSP_Midi0InterruptEnable;
-	spin_lock_irqsave (&hdsp->lock, flags);
+	guard(spinlock_irqsave)(&hdsp->lock);
 	if (up) {
 		if (!(hdsp->control_register & ie)) {
 			snd_hdsp_flush_midi_input (hdsp, hmidi->id);
@@ -1388,16 +1376,14 @@ static void snd_hdsp_midi_input_trigger(struct snd_rawmidi_substream *substream,
 	}
 
 	hdsp_write(hdsp, HDSP_controlRegister, hdsp->control_register);
-	spin_unlock_irqrestore (&hdsp->lock, flags);
 }
 
 static void snd_hdsp_midi_output_timer(struct timer_list *t)
 {
 	struct hdsp_midi *hmidi = timer_container_of(hmidi, t, timer);
-	unsigned long flags;
 
 	snd_hdsp_midi_output_write(hmidi);
-	spin_lock_irqsave (&hmidi->lock, flags);
+	guard(spinlock_irqsave)(&hmidi->lock);
 
 	/* this does not bump hmidi->istimer, because the
 	   kernel automatically removed the timer when it
@@ -1407,29 +1393,26 @@ static void snd_hdsp_midi_output_timer(struct timer_list *t)
 
 	if (hmidi->istimer)
 		mod_timer(&hmidi->timer, 1 + jiffies);
-
-	spin_unlock_irqrestore (&hmidi->lock, flags);
 }
 
 static void snd_hdsp_midi_output_trigger(struct snd_rawmidi_substream *substream, int up)
 {
 	struct hdsp_midi *hmidi;
-	unsigned long flags;
 
 	hmidi = (struct hdsp_midi *) substream->rmidi->private_data;
-	spin_lock_irqsave (&hmidi->lock, flags);
-	if (up) {
-		if (!hmidi->istimer) {
-			timer_setup(&hmidi->timer, snd_hdsp_midi_output_timer,
-				    0);
-			mod_timer(&hmidi->timer, 1 + jiffies);
-			hmidi->istimer++;
+	scoped_guard(spinlock_irqsave, &hmidi->lock) {
+		if (up) {
+			if (!hmidi->istimer) {
+				timer_setup(&hmidi->timer, snd_hdsp_midi_output_timer,
+					    0);
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
 		snd_hdsp_midi_output_write(hmidi);
 }
@@ -1439,10 +1422,9 @@ static int snd_hdsp_midi_input_open(struct snd_rawmidi_substream *substream)
 	struct hdsp_midi *hmidi;
 
 	hmidi = (struct hdsp_midi *) substream->rmidi->private_data;
-	spin_lock_irq (&hmidi->lock);
+	guard(spinlock_irq)(&hmidi->lock);
 	snd_hdsp_flush_midi_input (hmidi->hdsp, hmidi->id);
 	hmidi->input = substream;
-	spin_unlock_irq (&hmidi->lock);
 
 	return 0;
 }
@@ -1452,9 +1434,8 @@ static int snd_hdsp_midi_output_open(struct snd_rawmidi_substream *substream)
 	struct hdsp_midi *hmidi;
 
 	hmidi = (struct hdsp_midi *) substream->rmidi->private_data;
-	spin_lock_irq (&hmidi->lock);
+	guard(spinlock_irq)(&hmidi->lock);
 	hmidi->output = substream;
-	spin_unlock_irq (&hmidi->lock);
 
 	return 0;
 }
@@ -1466,9 +1447,8 @@ static int snd_hdsp_midi_input_close(struct snd_rawmidi_substream *substream)
 	snd_hdsp_midi_input_trigger (substream, 0);
 
 	hmidi = (struct hdsp_midi *) substream->rmidi->private_data;
-	spin_lock_irq (&hmidi->lock);
+	guard(spinlock_irq)(&hmidi->lock);
 	hmidi->input = NULL;
-	spin_unlock_irq (&hmidi->lock);
 
 	return 0;
 }
@@ -1480,9 +1460,8 @@ static int snd_hdsp_midi_output_close(struct snd_rawmidi_substream *substream)
 	snd_hdsp_midi_output_trigger (substream, 0);
 
 	hmidi = (struct hdsp_midi *) substream->rmidi->private_data;
-	spin_lock_irq (&hmidi->lock);
+	guard(spinlock_irq)(&hmidi->lock);
 	hmidi->output = NULL;
-	spin_unlock_irq (&hmidi->lock);
 
 	return 0;
 }
@@ -1579,10 +1558,9 @@ static int snd_hdsp_control_spdif_put(struct snd_kcontrol *kcontrol, struct snd_
 	u32 val;
 
 	val = snd_hdsp_convert_from_aes(&ucontrol->value.iec958);
-	spin_lock_irq(&hdsp->lock);
+	guard(spinlock_irq)(&hdsp->lock);
 	change = val != hdsp->creg_spdif;
 	hdsp->creg_spdif = val;
-	spin_unlock_irq(&hdsp->lock);
 	return change;
 }
 
@@ -1608,12 +1586,11 @@ static int snd_hdsp_control_spdif_stream_put(struct snd_kcontrol *kcontrol, stru
 	u32 val;
 
 	val = snd_hdsp_convert_from_aes(&ucontrol->value.iec958);
-	spin_lock_irq(&hdsp->lock);
+	guard(spinlock_irq)(&hdsp->lock);
 	change = val != hdsp->creg_spdif_stream;
 	hdsp->creg_spdif_stream = val;
 	hdsp->control_register &= ~(HDSP_SPDIFProfessional | HDSP_SPDIFNonAudio | HDSP_SPDIFEmphasis);
 	hdsp_write(hdsp, HDSP_controlRegister, hdsp->control_register |= val);
-	spin_unlock_irq(&hdsp->lock);
 	return change;
 }
 
@@ -1679,11 +1656,10 @@ static int snd_hdsp_put_spdif_in(struct snd_kcontrol *kcontrol, struct snd_ctl_e
 	if (!snd_hdsp_use_is_exclusive(hdsp))
 		return -EBUSY;
 	val = ucontrol->value.enumerated.item[0] % ((hdsp->io_type == H9632) ? 4 : 3);
-	spin_lock_irq(&hdsp->lock);
+	guard(spinlock_irq)(&hdsp->lock);
 	change = val != hdsp_spdif_in(hdsp);
 	if (change)
 		hdsp_set_spdif_input(hdsp, val);
-	spin_unlock_irq(&hdsp->lock);
 	return change;
 }
 
@@ -1720,9 +1696,8 @@ static int snd_hdsp_get_toggle_setting(struct snd_kcontrol *kcontrol,
 	struct hdsp *hdsp = snd_kcontrol_chip(kcontrol);
 	u32 regmask = kcontrol->private_value;
 
-	spin_lock_irq(&hdsp->lock);
+	guard(spinlock_irq)(&hdsp->lock);
 	ucontrol->value.integer.value[0] = hdsp_toggle_setting(hdsp, regmask);
-	spin_unlock_irq(&hdsp->lock);
 	return 0;
 }
 
@@ -1737,11 +1712,10 @@ static int snd_hdsp_put_toggle_setting(struct snd_kcontrol *kcontrol,
 	if (!snd_hdsp_use_is_exclusive(hdsp))
 		return -EBUSY;
 	val = ucontrol->value.integer.value[0] & 1;
-	spin_lock_irq(&hdsp->lock);
+	guard(spinlock_irq)(&hdsp->lock);
 	change = (int) val != hdsp_toggle_setting(hdsp, regmask);
 	if (change)
 		hdsp_set_toggle_setting(hdsp, regmask, val);
-	spin_unlock_irq(&hdsp->lock);
 	return change;
 }
 
@@ -2047,12 +2021,11 @@ static int snd_hdsp_put_clock_source(struct snd_kcontrol *kcontrol, struct snd_c
 		if (val > 6)
 			val = 6;
 	}
-	spin_lock_irq(&hdsp->lock);
+	guard(spinlock_irq)(&hdsp->lock);
 	if (val != hdsp_clock_source(hdsp))
 		change = (hdsp_set_clock_source(hdsp, val) == 0) ? 1 : 0;
 	else
 		change = 0;
-	spin_unlock_irq(&hdsp->lock);
 	return change;
 }
 
@@ -2147,12 +2120,11 @@ static int snd_hdsp_put_da_gain(struct snd_kcontrol *kcontrol, struct snd_ctl_el
 	val = ucontrol->value.enumerated.item[0];
 	if (val < 0) val = 0;
 	if (val > 2) val = 2;
-	spin_lock_irq(&hdsp->lock);
+	guard(spinlock_irq)(&hdsp->lock);
 	if (val != hdsp_da_gain(hdsp))
 		change = (hdsp_set_da_gain(hdsp, val) == 0) ? 1 : 0;
 	else
 		change = 0;
-	spin_unlock_irq(&hdsp->lock);
 	return change;
 }
 
@@ -2226,12 +2198,11 @@ static int snd_hdsp_put_ad_gain(struct snd_kcontrol *kcontrol, struct snd_ctl_el
 	val = ucontrol->value.enumerated.item[0];
 	if (val < 0) val = 0;
 	if (val > 2) val = 2;
-	spin_lock_irq(&hdsp->lock);
+	guard(spinlock_irq)(&hdsp->lock);
 	if (val != hdsp_ad_gain(hdsp))
 		change = (hdsp_set_ad_gain(hdsp, val) == 0) ? 1 : 0;
 	else
 		change = 0;
-	spin_unlock_irq(&hdsp->lock);
 	return change;
 }
 
@@ -2305,12 +2276,11 @@ static int snd_hdsp_put_phone_gain(struct snd_kcontrol *kcontrol, struct snd_ctl
 	val = ucontrol->value.enumerated.item[0];
 	if (val < 0) val = 0;
 	if (val > 2) val = 2;
-	spin_lock_irq(&hdsp->lock);
+	guard(spinlock_irq)(&hdsp->lock);
 	if (val != hdsp_phone_gain(hdsp))
 		change = (hdsp_set_phone_gain(hdsp, val) == 0) ? 1 : 0;
 	else
 		change = 0;
-	spin_unlock_irq(&hdsp->lock);
 	return change;
 }
 
@@ -2436,10 +2406,9 @@ static int snd_hdsp_put_pref_sync_ref(struct snd_kcontrol *kcontrol, struct snd_
 	}
 
 	val = ucontrol->value.enumerated.item[0] % max;
-	spin_lock_irq(&hdsp->lock);
+	guard(spinlock_irq)(&hdsp->lock);
 	change = (int)val != hdsp_pref_sync_ref(hdsp);
 	hdsp_set_pref_sync_ref(hdsp, val);
-	spin_unlock_irq(&hdsp->lock);
 	return change;
 }
 
@@ -2519,9 +2488,8 @@ static int snd_hdsp_get_precise_pointer(struct snd_kcontrol *kcontrol, struct sn
 {
 	struct hdsp *hdsp = snd_kcontrol_chip(kcontrol);
 
-	spin_lock_irq(&hdsp->lock);
+	guard(spinlock_irq)(&hdsp->lock);
 	ucontrol->value.integer.value[0] = hdsp->precise_ptr;
-	spin_unlock_irq(&hdsp->lock);
 	return 0;
 }
 
@@ -2534,10 +2502,9 @@ static int snd_hdsp_put_precise_pointer(struct snd_kcontrol *kcontrol, struct sn
 	if (!snd_hdsp_use_is_exclusive(hdsp))
 		return -EBUSY;
 	val = ucontrol->value.integer.value[0] & 1;
-	spin_lock_irq(&hdsp->lock);
+	guard(spinlock_irq)(&hdsp->lock);
 	change = (int)val != hdsp->precise_ptr;
 	hdsp_set_precise_pointer(hdsp, val);
-	spin_unlock_irq(&hdsp->lock);
 	return change;
 }
 
@@ -2565,9 +2532,8 @@ static int snd_hdsp_get_use_midi_work(struct snd_kcontrol *kcontrol, struct snd_
 {
 	struct hdsp *hdsp = snd_kcontrol_chip(kcontrol);
 
-	spin_lock_irq(&hdsp->lock);
+	guard(spinlock_irq)(&hdsp->lock);
 	ucontrol->value.integer.value[0] = hdsp->use_midi_work;
-	spin_unlock_irq(&hdsp->lock);
 	return 0;
 }
 
@@ -2580,10 +2546,9 @@ static int snd_hdsp_put_use_midi_work(struct snd_kcontrol *kcontrol, struct snd_
 	if (!snd_hdsp_use_is_exclusive(hdsp))
 		return -EBUSY;
 	val = ucontrol->value.integer.value[0] & 1;
-	spin_lock_irq(&hdsp->lock);
+	guard(spinlock_irq)(&hdsp->lock);
 	change = (int)val != hdsp->use_midi_work;
 	hdsp_set_use_midi_work(hdsp, val);
-	spin_unlock_irq(&hdsp->lock);
 	return change;
 }
 
@@ -2624,9 +2589,8 @@ static int snd_hdsp_get_mixer(struct snd_kcontrol *kcontrol, struct snd_ctl_elem
 	else
 		addr = hdsp_input_to_output_key(hdsp,source, destination);
 
-	spin_lock_irq(&hdsp->lock);
+	guard(spinlock_irq)(&hdsp->lock);
 	ucontrol->value.integer.value[2] = hdsp_read_gain (hdsp, addr);
-	spin_unlock_irq(&hdsp->lock);
 	return 0;
 }
 
@@ -2652,11 +2616,10 @@ static int snd_hdsp_put_mixer(struct snd_kcontrol *kcontrol, struct snd_ctl_elem
 
 	gain = ucontrol->value.integer.value[2];
 
-	spin_lock_irq(&hdsp->lock);
+	guard(spinlock_irq)(&hdsp->lock);
 	change = gain != hdsp_read_gain(hdsp, addr);
 	if (change)
 		hdsp_write_gain(hdsp, addr, gain);
-	spin_unlock_irq(&hdsp->lock);
 	return change;
 }
 
@@ -2869,12 +2832,11 @@ static int snd_hdsp_put_dds_offset(struct snd_kcontrol *kcontrol, struct snd_ctl
 	if (!snd_hdsp_use_is_exclusive(hdsp))
 		return -EBUSY;
 	val = ucontrol->value.integer.value[0];
-	spin_lock_irq(&hdsp->lock);
+	guard(spinlock_irq)(&hdsp->lock);
 	if (val != hdsp_dds_offset(hdsp))
 		change = (hdsp_set_dds_offset(hdsp, val) == 0) ? 1 : 0;
 	else
 		change = 0;
-	spin_unlock_irq(&hdsp->lock);
 	return change;
 }
 
@@ -3018,12 +2980,11 @@ static int snd_hdsp_put_rpm_input12(struct snd_kcontrol *kcontrol, struct snd_ct
 		val = 0;
 	if (val > 4)
 		val = 4;
-	spin_lock_irq(&hdsp->lock);
+	guard(spinlock_irq)(&hdsp->lock);
 	if (val != hdsp_rpm_input12(hdsp))
 		change = (hdsp_set_rpm_input12(hdsp, val) == 0) ? 1 : 0;
 	else
 		change = 0;
-	spin_unlock_irq(&hdsp->lock);
 	return change;
 }
 
@@ -3103,12 +3064,11 @@ static int snd_hdsp_put_rpm_input34(struct snd_kcontrol *kcontrol, struct snd_ct
 		val = 0;
 	if (val > 4)
 		val = 4;
-	spin_lock_irq(&hdsp->lock);
+	guard(spinlock_irq)(&hdsp->lock);
 	if (val != hdsp_rpm_input34(hdsp))
 		change = (hdsp_set_rpm_input34(hdsp, val) == 0) ? 1 : 0;
 	else
 		change = 0;
-	spin_unlock_irq(&hdsp->lock);
 	return change;
 }
 
@@ -3149,10 +3109,9 @@ static int snd_hdsp_put_rpm_bypass(struct snd_kcontrol *kcontrol, struct snd_ctl
 	if (!snd_hdsp_use_is_exclusive(hdsp))
 		return -EBUSY;
 	val = ucontrol->value.integer.value[0] & 1;
-	spin_lock_irq(&hdsp->lock);
+	guard(spinlock_irq)(&hdsp->lock);
 	change = (int)val != hdsp_rpm_bypass(hdsp);
 	hdsp_set_rpm_bypass(hdsp, val);
-	spin_unlock_irq(&hdsp->lock);
 	return change;
 }
 
@@ -3201,10 +3160,9 @@ static int snd_hdsp_put_rpm_disconnect(struct snd_kcontrol *kcontrol, struct snd
 	if (!snd_hdsp_use_is_exclusive(hdsp))
 		return -EBUSY;
 	val = ucontrol->value.integer.value[0] & 1;
-	spin_lock_irq(&hdsp->lock);
+	guard(spinlock_irq)(&hdsp->lock);
 	change = (int)val != hdsp_rpm_disconnect(hdsp);
 	hdsp_set_rpm_disconnect(hdsp, val);
-	spin_unlock_irq(&hdsp->lock);
 	return change;
 }
 
@@ -4051,7 +4009,7 @@ static int snd_hdsp_hw_params(struct snd_pcm_substream *substream,
 	if (hdsp_check_for_firmware(hdsp, 1))
 		return -EIO;
 
-	spin_lock_irq(&hdsp->lock);
+	guard(spinlock_irq)(&hdsp->lock);
 
 	if (substream->pstr->stream == SNDRV_PCM_STREAM_PLAYBACK) {
 		hdsp->control_register &= ~(HDSP_SPDIFProfessional | HDSP_SPDIFNonAudio | HDSP_SPDIFEmphasis);
@@ -4071,39 +4029,31 @@ static int snd_hdsp_hw_params(struct snd_pcm_substream *substream,
 		 */
 
 		if (params_rate(params) != hdsp->system_sample_rate) {
-			spin_unlock_irq(&hdsp->lock);
 			_snd_pcm_hw_param_setempty(params, SNDRV_PCM_HW_PARAM_RATE);
 			return -EBUSY;
 		}
 
 		if (params_period_size(params) != hdsp->period_bytes / 4) {
-			spin_unlock_irq(&hdsp->lock);
 			_snd_pcm_hw_param_setempty(params, SNDRV_PCM_HW_PARAM_PERIOD_SIZE);
 			return -EBUSY;
 		}
 
 		/* We're fine. */
 
-		spin_unlock_irq(&hdsp->lock);
  		return 0;
 
-	} else {
-		spin_unlock_irq(&hdsp->lock);
 	}
 
 	/* how to make sure that the rate matches an externally-set one ?
 	 */
 
-	spin_lock_irq(&hdsp->lock);
 	if (! hdsp->clock_source_locked) {
 		err = hdsp_set_rate(hdsp, params_rate(params), 0);
 		if (err < 0) {
-			spin_unlock_irq(&hdsp->lock);
 			_snd_pcm_hw_param_setempty(params, SNDRV_PCM_HW_PARAM_RATE);
 			return err;
 		}
 	}
-	spin_unlock_irq(&hdsp->lock);
 
 	err = hdsp_set_interrupt_interval(hdsp, params_period_size(params));
 	if (err < 0) {
@@ -4160,7 +4110,7 @@ static int snd_hdsp_trigger(struct snd_pcm_substream *substream, int cmd)
 	if (hdsp_check_for_firmware(hdsp, 0)) /* no auto-loading in trigger */
 		return -EIO;
 
-	spin_lock(&hdsp->lock);
+	guard(spinlock)(&hdsp->lock);
 	running = hdsp->running;
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
@@ -4171,7 +4121,6 @@ static int snd_hdsp_trigger(struct snd_pcm_substream *substream, int cmd)
 		break;
 	default:
 		snd_BUG();
-		spin_unlock(&hdsp->lock);
 		return -EINVAL;
 	}
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
@@ -4211,7 +4160,6 @@ static int snd_hdsp_trigger(struct snd_pcm_substream *substream, int cmd)
 	else if (hdsp->running && !running)
 		hdsp_stop_audio(hdsp);
 	hdsp->running = running;
-	spin_unlock(&hdsp->lock);
 
 	return 0;
 }
@@ -4227,10 +4175,9 @@ static int snd_hdsp_prepare(struct snd_pcm_substream *substream)
 	if (hdsp_check_for_firmware(hdsp, 1))
 		return -EIO;
 
-	spin_lock_irq(&hdsp->lock);
+	guard(spinlock_irq)(&hdsp->lock);
 	if (!hdsp->running)
 		hdsp_reset_hw_pointer(hdsp);
-	spin_unlock_irq(&hdsp->lock);
 	return result;
 }
 
@@ -4473,17 +4420,15 @@ static int snd_hdsp_playback_open(struct snd_pcm_substream *substream)
 	if (hdsp_check_for_firmware(hdsp, 1))
 		return -EIO;
 
-	spin_lock_irq(&hdsp->lock);
+	scoped_guard(spinlock_irq, &hdsp->lock) {
+		snd_pcm_set_sync(substream);
 
-	snd_pcm_set_sync(substream);
+		runtime->hw = snd_hdsp_playback_subinfo;
+		snd_pcm_set_runtime_buffer(substream, &hdsp->playback_dma_buf);
 
-        runtime->hw = snd_hdsp_playback_subinfo;
-	snd_pcm_set_runtime_buffer(substream, &hdsp->playback_dma_buf);
-
-	hdsp->playback_pid = current->pid;
-	hdsp->playback_substream = substream;
-
-	spin_unlock_irq(&hdsp->lock);
+		hdsp->playback_pid = current->pid;
+		hdsp->playback_substream = substream;
+	}
 
 	snd_pcm_hw_constraint_msbits(runtime, 0, 32, 24);
 	snd_pcm_hw_constraint_list(runtime, 0, SNDRV_PCM_HW_PARAM_PERIOD_SIZE, &hdsp_hw_constraints_period_sizes);
@@ -4523,12 +4468,10 @@ static int snd_hdsp_playback_release(struct snd_pcm_substream *substream)
 {
 	struct hdsp *hdsp = snd_pcm_substream_chip(substream);
 
-	spin_lock_irq(&hdsp->lock);
-
-	hdsp->playback_pid = -1;
-	hdsp->playback_substream = NULL;
-
-	spin_unlock_irq(&hdsp->lock);
+	scoped_guard(spinlock_irq, &hdsp->lock) {
+		hdsp->playback_pid = -1;
+		hdsp->playback_substream = NULL;
+	}
 
 	if (RPM != hdsp->io_type) {
 		hdsp->spdif_ctl->vd[0].access |= SNDRV_CTL_ELEM_ACCESS_INACTIVE;
@@ -4550,17 +4493,15 @@ static int snd_hdsp_capture_open(struct snd_pcm_substream *substream)
 	if (hdsp_check_for_firmware(hdsp, 1))
 		return -EIO;
 
-	spin_lock_irq(&hdsp->lock);
+	scoped_guard(spinlock_irq, &hdsp->lock) {
+		snd_pcm_set_sync(substream);
 
-	snd_pcm_set_sync(substream);
+		runtime->hw = snd_hdsp_capture_subinfo;
+		snd_pcm_set_runtime_buffer(substream, &hdsp->capture_dma_buf);
 
-	runtime->hw = snd_hdsp_capture_subinfo;
-	snd_pcm_set_runtime_buffer(substream, &hdsp->capture_dma_buf);
-
-	hdsp->capture_pid = current->pid;
-	hdsp->capture_substream = substream;
-
-	spin_unlock_irq(&hdsp->lock);
+		hdsp->capture_pid = current->pid;
+		hdsp->capture_substream = substream;
+	}
 
 	snd_pcm_hw_constraint_msbits(runtime, 0, 32, 24);
 	snd_pcm_hw_constraint_list(runtime, 0, SNDRV_PCM_HW_PARAM_PERIOD_SIZE, &hdsp_hw_constraints_period_sizes);
@@ -4588,12 +4529,11 @@ static int snd_hdsp_capture_release(struct snd_pcm_substream *substream)
 {
 	struct hdsp *hdsp = snd_pcm_substream_chip(substream);
 
-	spin_lock_irq(&hdsp->lock);
+	guard(spinlock_irq)(&hdsp->lock);
 
 	hdsp->capture_pid = -1;
 	hdsp->capture_substream = NULL;
 
-	spin_unlock_irq(&hdsp->lock);
 	return 0;
 }
 
@@ -4756,7 +4696,6 @@ static int snd_hdsp_hwdep_ioctl(struct snd_hwdep *hw, struct file *file, unsigne
 	}
 	case SNDRV_HDSP_IOCTL_GET_CONFIG_INFO: {
 		struct hdsp_config_info info;
-		unsigned long flags;
 		int i;
 
 		err = hdsp_check_for_iobox(hdsp);
@@ -4768,48 +4707,48 @@ static int snd_hdsp_hwdep_ioctl(struct snd_hwdep *hw, struct file *file, unsigne
 			return err;
 
 		memset(&info, 0, sizeof(info));
-		spin_lock_irqsave(&hdsp->lock, flags);
-		info.pref_sync_ref = (unsigned char)hdsp_pref_sync_ref(hdsp);
-		info.wordclock_sync_check = (unsigned char)hdsp_wc_sync_check(hdsp);
-		if (hdsp->io_type != H9632)
-		    info.adatsync_sync_check = (unsigned char)hdsp_adatsync_sync_check(hdsp);
-		info.spdif_sync_check = (unsigned char)hdsp_spdif_sync_check(hdsp);
-		for (i = 0; i < ((hdsp->io_type != Multiface && hdsp->io_type != RPM && hdsp->io_type != H9632) ? 3 : 1); ++i)
-			info.adat_sync_check[i] = (unsigned char)hdsp_adat_sync_check(hdsp, i);
-		info.spdif_in = (unsigned char)hdsp_spdif_in(hdsp);
-		info.spdif_out = (unsigned char)hdsp_toggle_setting(hdsp,
-				HDSP_SPDIFOpticalOut);
-		info.spdif_professional = (unsigned char)
-			hdsp_toggle_setting(hdsp, HDSP_SPDIFProfessional);
-		info.spdif_emphasis = (unsigned char)
-			hdsp_toggle_setting(hdsp, HDSP_SPDIFEmphasis);
-		info.spdif_nonaudio = (unsigned char)
-			hdsp_toggle_setting(hdsp, HDSP_SPDIFNonAudio);
-		info.spdif_sample_rate = hdsp_spdif_sample_rate(hdsp);
-		info.system_sample_rate = hdsp->system_sample_rate;
-		info.autosync_sample_rate = hdsp_external_sample_rate(hdsp);
-		info.system_clock_mode = (unsigned char)hdsp_system_clock_mode(hdsp);
-		info.clock_source = (unsigned char)hdsp_clock_source(hdsp);
-		info.autosync_ref = (unsigned char)hdsp_autosync_ref(hdsp);
-		info.line_out = (unsigned char)
-			hdsp_toggle_setting(hdsp, HDSP_LineOut);
-		if (hdsp->io_type == H9632) {
-			info.da_gain = (unsigned char)hdsp_da_gain(hdsp);
-			info.ad_gain = (unsigned char)hdsp_ad_gain(hdsp);
-			info.phone_gain = (unsigned char)hdsp_phone_gain(hdsp);
-			info.xlr_breakout_cable =
-				(unsigned char)hdsp_toggle_setting(hdsp,
-					HDSP_XLRBreakoutCable);
+		scoped_guard(spinlock_irqsave, &hdsp->lock) {
+			info.pref_sync_ref = (unsigned char)hdsp_pref_sync_ref(hdsp);
+			info.wordclock_sync_check = (unsigned char)hdsp_wc_sync_check(hdsp);
+			if (hdsp->io_type != H9632)
+				info.adatsync_sync_check = (unsigned char)hdsp_adatsync_sync_check(hdsp);
+			info.spdif_sync_check = (unsigned char)hdsp_spdif_sync_check(hdsp);
+			for (i = 0; i < ((hdsp->io_type != Multiface && hdsp->io_type != RPM && hdsp->io_type != H9632) ? 3 : 1); ++i)
+				info.adat_sync_check[i] = (unsigned char)hdsp_adat_sync_check(hdsp, i);
+			info.spdif_in = (unsigned char)hdsp_spdif_in(hdsp);
+			info.spdif_out = (unsigned char)hdsp_toggle_setting(hdsp,
+									    HDSP_SPDIFOpticalOut);
+			info.spdif_professional = (unsigned char)
+				hdsp_toggle_setting(hdsp, HDSP_SPDIFProfessional);
+			info.spdif_emphasis = (unsigned char)
+				hdsp_toggle_setting(hdsp, HDSP_SPDIFEmphasis);
+			info.spdif_nonaudio = (unsigned char)
+				hdsp_toggle_setting(hdsp, HDSP_SPDIFNonAudio);
+			info.spdif_sample_rate = hdsp_spdif_sample_rate(hdsp);
+			info.system_sample_rate = hdsp->system_sample_rate;
+			info.autosync_sample_rate = hdsp_external_sample_rate(hdsp);
+			info.system_clock_mode = (unsigned char)hdsp_system_clock_mode(hdsp);
+			info.clock_source = (unsigned char)hdsp_clock_source(hdsp);
+			info.autosync_ref = (unsigned char)hdsp_autosync_ref(hdsp);
+			info.line_out = (unsigned char)
+				hdsp_toggle_setting(hdsp, HDSP_LineOut);
+			if (hdsp->io_type == H9632) {
+				info.da_gain = (unsigned char)hdsp_da_gain(hdsp);
+				info.ad_gain = (unsigned char)hdsp_ad_gain(hdsp);
+				info.phone_gain = (unsigned char)hdsp_phone_gain(hdsp);
+				info.xlr_breakout_cable =
+					(unsigned char)hdsp_toggle_setting(hdsp,
+									   HDSP_XLRBreakoutCable);
 
-		} else if (hdsp->io_type == RPM) {
-			info.da_gain = (unsigned char) hdsp_rpm_input12(hdsp);
-			info.ad_gain = (unsigned char) hdsp_rpm_input34(hdsp);
+			} else if (hdsp->io_type == RPM) {
+				info.da_gain = (unsigned char) hdsp_rpm_input12(hdsp);
+				info.ad_gain = (unsigned char) hdsp_rpm_input34(hdsp);
+			}
+			if (hdsp->io_type == H9632 || hdsp->io_type == H9652)
+				info.analog_extension_board =
+					(unsigned char)hdsp_toggle_setting(hdsp,
+									   HDSP_AnalogExtensionBoard);
 		}
-		if (hdsp->io_type == H9632 || hdsp->io_type == H9652)
-			info.analog_extension_board =
-				(unsigned char)hdsp_toggle_setting(hdsp,
-					    HDSP_AnalogExtensionBoard);
-		spin_unlock_irqrestore(&hdsp->lock, flags);
 		if (copy_to_user(argp, &info, sizeof(info)))
 			return -EFAULT;
 		break;
-- 
2.50.1

