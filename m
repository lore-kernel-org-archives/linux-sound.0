Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A99A217654
	for <linux-sound@vger.kernel.org>; Fri, 29 Aug 2025 14:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756478721; cv=none; b=hGLZ+FhNNQVSgT9mXOx1Qipwp6LxIZmaGjz0u1Xdxd7u94I17xe9CBM7b8rAcN2NYyCqNDemY63t8H08FpTebQvkq0sWfY6HbOZsWgNL+F/03/Pqjw0hDVkDQYveu4fnHjBv43BHimaWRQ63zINrvbVKlt+tCPwXUljSEv29/5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756478721; c=relaxed/simple;
	bh=N4bGm3FiW3WqWiClRk72jeLAxuesB9KuZIpWO6RewYg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qU37QTjTRUMjBsT/lpYag3SSqv3bp9VUAZC/yxflebZ3HyBjTZ7U1AJQMstaXSM7hEysSza9kyP625oRA0WgG2xZ5HLNkK/9vYaA2mEWUxf3Tf5vfHV+ulK1Xudh0BB8G/bjbugrWuqwApJCpcG2KHV1VZbWQB1wj3HaPhbXBzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Su2p/N6w; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ezdaV6O1; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Su2p/N6w; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ezdaV6O1; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Su2p/N6w";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ezdaV6O1";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Su2p/N6w";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ezdaV6O1"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 76C6F33ECD;
	Fri, 29 Aug 2025 14:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756478640; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UIw/0gxf05jYk/ysj9Lh4EeBhDHytPyOeO+RLZTLcDI=;
	b=Su2p/N6wNPSyEf2EfrF/YLKTr6rHQ9F3Pie5+SW3+2TEayA8nUVQ1qBB8TiGP11Ufte+Oi
	kZJ35LeUu4Td3xFCq5IncYzcibSUPD8HDegEFtaiIau7l9hlct2n3KW7IS6p15R0CGj4Z0
	fsCCQ0dJk8k68myBvxt/P5IkACLgvAU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756478640;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UIw/0gxf05jYk/ysj9Lh4EeBhDHytPyOeO+RLZTLcDI=;
	b=ezdaV6O1m5D62bqPxQLs1KD9UANZc4Z3/+jy3KryHelPWmNodqrciZYnYP8faEsWDmO/bG
	EdbD7kS9kJ1iPnAA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="Su2p/N6w";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=ezdaV6O1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756478640; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UIw/0gxf05jYk/ysj9Lh4EeBhDHytPyOeO+RLZTLcDI=;
	b=Su2p/N6wNPSyEf2EfrF/YLKTr6rHQ9F3Pie5+SW3+2TEayA8nUVQ1qBB8TiGP11Ufte+Oi
	kZJ35LeUu4Td3xFCq5IncYzcibSUPD8HDegEFtaiIau7l9hlct2n3KW7IS6p15R0CGj4Z0
	fsCCQ0dJk8k68myBvxt/P5IkACLgvAU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756478640;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UIw/0gxf05jYk/ysj9Lh4EeBhDHytPyOeO+RLZTLcDI=;
	b=ezdaV6O1m5D62bqPxQLs1KD9UANZc4Z3/+jy3KryHelPWmNodqrciZYnYP8faEsWDmO/bG
	EdbD7kS9kJ1iPnAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5914813A3E;
	Fri, 29 Aug 2025 14:44:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id QDCUFLC8sWi6GAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 29 Aug 2025 14:44:00 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 29/61] ALSA: emu10k1x: Use guard() for spin locks
Date: Fri, 29 Aug 2025 16:43:04 +0200
Message-ID: <20250829144342.4290-30-tiwai@suse.de>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,suse.de:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
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
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: 76C6F33ECD
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01

Clean up the code using guard() for spin locks.

Merely code refactoring, and no behavior change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/emu10k1/emu10k1x.c | 221 ++++++++++++++---------------------
 1 file changed, 88 insertions(+), 133 deletions(-)

diff --git a/sound/pci/emu10k1/emu10k1x.c b/sound/pci/emu10k1/emu10k1x.c
index 8c18ad987223..9607a0f7174b 100644
--- a/sound/pci/emu10k1/emu10k1x.c
+++ b/sound/pci/emu10k1/emu10k1x.c
@@ -281,16 +281,13 @@ static unsigned int snd_emu10k1x_ptr_read(struct emu10k1x * emu,
 					  unsigned int reg, 
 					  unsigned int chn)
 {
-	unsigned long flags;
-	unsigned int regptr, val;
+	unsigned int regptr;
   
 	regptr = (reg << 16) | chn;
 
-	spin_lock_irqsave(&emu->emu_lock, flags);
+	guard(spinlock_irqsave)(&emu->emu_lock);
 	outl(regptr, emu->port + PTR);
-	val = inl(emu->port + DATA);
-	spin_unlock_irqrestore(&emu->emu_lock, flags);
-	return val;
+	return inl(emu->port + DATA);
 }
 
 static void snd_emu10k1x_ptr_write(struct emu10k1x *emu, 
@@ -299,45 +296,36 @@ static void snd_emu10k1x_ptr_write(struct emu10k1x *emu,
 				   unsigned int data)
 {
 	unsigned int regptr;
-	unsigned long flags;
 
 	regptr = (reg << 16) | chn;
 
-	spin_lock_irqsave(&emu->emu_lock, flags);
+	guard(spinlock_irqsave)(&emu->emu_lock);
 	outl(regptr, emu->port + PTR);
 	outl(data, emu->port + DATA);
-	spin_unlock_irqrestore(&emu->emu_lock, flags);
 }
 
 static void snd_emu10k1x_intr_enable(struct emu10k1x *emu, unsigned int intrenb)
 {
-	unsigned long flags;
 	unsigned int intr_enable;
 
-	spin_lock_irqsave(&emu->emu_lock, flags);
+	guard(spinlock_irqsave)(&emu->emu_lock);
 	intr_enable = inl(emu->port + INTE) | intrenb;
 	outl(intr_enable, emu->port + INTE);
-	spin_unlock_irqrestore(&emu->emu_lock, flags);
 }
 
 static void snd_emu10k1x_intr_disable(struct emu10k1x *emu, unsigned int intrenb)
 {
-	unsigned long flags;
 	unsigned int intr_enable;
 
-	spin_lock_irqsave(&emu->emu_lock, flags);
+	guard(spinlock_irqsave)(&emu->emu_lock);
 	intr_enable = inl(emu->port + INTE) & ~intrenb;
 	outl(intr_enable, emu->port + INTE);
-	spin_unlock_irqrestore(&emu->emu_lock, flags);
 }
 
 static void snd_emu10k1x_gpio_write(struct emu10k1x *emu, unsigned int value)
 {
-	unsigned long flags;
-
-	spin_lock_irqsave(&emu->emu_lock, flags);
+	guard(spinlock_irqsave)(&emu->emu_lock);
 	outl(value, emu->port + GPIO);
-	spin_unlock_irqrestore(&emu->emu_lock, flags);
 }
 
 static void snd_emu10k1x_pcm_free_substream(struct snd_pcm_runtime *runtime)
@@ -694,26 +682,20 @@ static unsigned short snd_emu10k1x_ac97_read(struct snd_ac97 *ac97,
 					     unsigned short reg)
 {
 	struct emu10k1x *emu = ac97->private_data;
-	unsigned long flags;
-	unsigned short val;
   
-	spin_lock_irqsave(&emu->emu_lock, flags);
+	guard(spinlock_irqsave)(&emu->emu_lock);
 	outb(reg, emu->port + AC97ADDRESS);
-	val = inw(emu->port + AC97DATA);
-	spin_unlock_irqrestore(&emu->emu_lock, flags);
-	return val;
+	return inw(emu->port + AC97DATA);
 }
 
 static void snd_emu10k1x_ac97_write(struct snd_ac97 *ac97,
 				    unsigned short reg, unsigned short val)
 {
 	struct emu10k1x *emu = ac97->private_data;
-	unsigned long flags;
   
-	spin_lock_irqsave(&emu->emu_lock, flags);
+	guard(spinlock_irqsave)(&emu->emu_lock);
 	outb(reg, emu->port + AC97ADDRESS);
 	outw(val, emu->port + AC97DATA);
-	spin_unlock_irqrestore(&emu->emu_lock, flags);
 }
 
 static int snd_emu10k1x_ac97(struct emu10k1x *chip)
@@ -966,14 +948,12 @@ static void snd_emu10k1x_proc_reg_read(struct snd_info_entry *entry,
 {
 	struct emu10k1x *emu = entry->private_data;
 	unsigned long value,value1,value2;
-	unsigned long flags;
 	int i;
 
 	snd_iprintf(buffer, "Registers:\n\n");
 	for(i = 0; i < 0x20; i+=4) {
-		spin_lock_irqsave(&emu->emu_lock, flags);
+		guard(spinlock_irqsave)(&emu->emu_lock);
 		value = inl(emu->port + i);
-		spin_unlock_irqrestore(&emu->emu_lock, flags);
 		snd_iprintf(buffer, "Register %02X: %08lX\n", i, value);
 	}
 	snd_iprintf(buffer, "\nRegisters\n\n");
@@ -1206,28 +1186,28 @@ static void do_emu10k1x_midi_interrupt(struct emu10k1x *emu,
 		return;
 	}
 
-	spin_lock(&midi->input_lock);
-	if ((status & midi->ipr_rx) && mpu401_input_avail(emu, midi)) {
-		if (!(midi->midi_mode & EMU10K1X_MIDI_MODE_INPUT)) {
-			mpu401_clear_rx(emu, midi);
-		} else {
-			byte = mpu401_read_data(emu, midi);
-			if (midi->substream_input)
-				snd_rawmidi_receive(midi->substream_input, &byte, 1);
+	scoped_guard(spinlock, &midi->input_lock) {
+		if ((status & midi->ipr_rx) && mpu401_input_avail(emu, midi)) {
+			if (!(midi->midi_mode & EMU10K1X_MIDI_MODE_INPUT)) {
+				mpu401_clear_rx(emu, midi);
+			} else {
+				byte = mpu401_read_data(emu, midi);
+				if (midi->substream_input)
+					snd_rawmidi_receive(midi->substream_input, &byte, 1);
+			}
 		}
 	}
-	spin_unlock(&midi->input_lock);
 
-	spin_lock(&midi->output_lock);
-	if ((status & midi->ipr_tx) && mpu401_output_ready(emu, midi)) {
-		if (midi->substream_output &&
-		    snd_rawmidi_transmit(midi->substream_output, &byte, 1) == 1) {
-			mpu401_write_data(emu, midi, byte);
-		} else {
-			snd_emu10k1x_intr_disable(emu, midi->tx_enable);
+	scoped_guard(spinlock, &midi->output_lock) {
+		if ((status & midi->ipr_tx) && mpu401_output_ready(emu, midi)) {
+			if (midi->substream_output &&
+			    snd_rawmidi_transmit(midi->substream_output, &byte, 1) == 1) {
+				mpu401_write_data(emu, midi, byte);
+			} else {
+				snd_emu10k1x_intr_disable(emu, midi->tx_enable);
+			}
 		}
 	}
-	spin_unlock(&midi->output_lock);
 }
 
 static void snd_emu10k1x_midi_interrupt(struct emu10k1x *emu, unsigned int status)
@@ -1238,29 +1218,28 @@ static void snd_emu10k1x_midi_interrupt(struct emu10k1x *emu, unsigned int statu
 static int snd_emu10k1x_midi_cmd(struct emu10k1x * emu,
 				  struct emu10k1x_midi *midi, unsigned char cmd, int ack)
 {
-	unsigned long flags;
 	int timeout, ok;
 
-	spin_lock_irqsave(&midi->input_lock, flags);
-	mpu401_write_data(emu, midi, 0x00);
-	/* mpu401_clear_rx(emu, midi); */
+	scoped_guard(spinlock_irqsave, &midi->input_lock) {
+		mpu401_write_data(emu, midi, 0x00);
+		/* mpu401_clear_rx(emu, midi); */
 
-	mpu401_write_cmd(emu, midi, cmd);
-	if (ack) {
-		ok = 0;
-		timeout = 10000;
-		while (!ok && timeout-- > 0) {
-			if (mpu401_input_avail(emu, midi)) {
-				if (mpu401_read_data(emu, midi) == MPU401_ACK)
-					ok = 1;
+		mpu401_write_cmd(emu, midi, cmd);
+		if (ack) {
+			ok = 0;
+			timeout = 10000;
+			while (!ok && timeout-- > 0) {
+				if (mpu401_input_avail(emu, midi)) {
+					if (mpu401_read_data(emu, midi) == MPU401_ACK)
+						ok = 1;
+				}
 			}
-		}
-		if (!ok && mpu401_read_data(emu, midi) == MPU401_ACK)
+			if (!ok && mpu401_read_data(emu, midi) == MPU401_ACK)
+				ok = 1;
+		} else {
 			ok = 1;
-	} else {
-		ok = 1;
+		}
 	}
-	spin_unlock_irqrestore(&midi->input_lock, flags);
 	if (!ok) {
 		dev_err(emu->card->dev,
 			"midi_cmd: 0x%x failed at 0x%lx (status = 0x%x, data = 0x%x)!!!\n",
@@ -1276,100 +1255,78 @@ static int snd_emu10k1x_midi_input_open(struct snd_rawmidi_substream *substream)
 {
 	struct emu10k1x *emu;
 	struct emu10k1x_midi *midi = substream->rmidi->private_data;
-	unsigned long flags;
 	
 	emu = midi->emu;
 	if (snd_BUG_ON(!emu))
 		return -ENXIO;
-	spin_lock_irqsave(&midi->open_lock, flags);
-	midi->midi_mode |= EMU10K1X_MIDI_MODE_INPUT;
-	midi->substream_input = substream;
-	if (!(midi->midi_mode & EMU10K1X_MIDI_MODE_OUTPUT)) {
-		spin_unlock_irqrestore(&midi->open_lock, flags);
-		if (snd_emu10k1x_midi_cmd(emu, midi, MPU401_RESET, 1))
-			goto error_out;
-		if (snd_emu10k1x_midi_cmd(emu, midi, MPU401_ENTER_UART, 1))
-			goto error_out;
-	} else {
-		spin_unlock_irqrestore(&midi->open_lock, flags);
+	scoped_guard(spinlock_irqsave, &midi->open_lock) {
+		midi->midi_mode |= EMU10K1X_MIDI_MODE_INPUT;
+		midi->substream_input = substream;
+		if (midi->midi_mode & EMU10K1X_MIDI_MODE_OUTPUT)
+			return 0;
 	}
+	if (snd_emu10k1x_midi_cmd(emu, midi, MPU401_RESET, 1))
+		return -EIO;
+	if (snd_emu10k1x_midi_cmd(emu, midi, MPU401_ENTER_UART, 1))
+		return -EIO;
 	return 0;
-
-error_out:
-	return -EIO;
 }
 
 static int snd_emu10k1x_midi_output_open(struct snd_rawmidi_substream *substream)
 {
 	struct emu10k1x *emu;
 	struct emu10k1x_midi *midi = substream->rmidi->private_data;
-	unsigned long flags;
 
 	emu = midi->emu;
 	if (snd_BUG_ON(!emu))
 		return -ENXIO;
-	spin_lock_irqsave(&midi->open_lock, flags);
-	midi->midi_mode |= EMU10K1X_MIDI_MODE_OUTPUT;
-	midi->substream_output = substream;
-	if (!(midi->midi_mode & EMU10K1X_MIDI_MODE_INPUT)) {
-		spin_unlock_irqrestore(&midi->open_lock, flags);
-		if (snd_emu10k1x_midi_cmd(emu, midi, MPU401_RESET, 1))
-			goto error_out;
-		if (snd_emu10k1x_midi_cmd(emu, midi, MPU401_ENTER_UART, 1))
-			goto error_out;
-	} else {
-		spin_unlock_irqrestore(&midi->open_lock, flags);
+	scoped_guard(spinlock_irqsave, &midi->open_lock) {
+		midi->midi_mode |= EMU10K1X_MIDI_MODE_OUTPUT;
+		midi->substream_output = substream;
+		if (midi->midi_mode & EMU10K1X_MIDI_MODE_INPUT)
+			return 0;
 	}
+	if (snd_emu10k1x_midi_cmd(emu, midi, MPU401_RESET, 1))
+		return -EIO;
+	if (snd_emu10k1x_midi_cmd(emu, midi, MPU401_ENTER_UART, 1))
+		return -EIO;
 	return 0;
-
-error_out:
-	return -EIO;
 }
 
 static int snd_emu10k1x_midi_input_close(struct snd_rawmidi_substream *substream)
 {
 	struct emu10k1x *emu;
 	struct emu10k1x_midi *midi = substream->rmidi->private_data;
-	unsigned long flags;
-	int err = 0;
 
 	emu = midi->emu;
 	if (snd_BUG_ON(!emu))
 		return -ENXIO;
-	spin_lock_irqsave(&midi->open_lock, flags);
-	snd_emu10k1x_intr_disable(emu, midi->rx_enable);
-	midi->midi_mode &= ~EMU10K1X_MIDI_MODE_INPUT;
-	midi->substream_input = NULL;
-	if (!(midi->midi_mode & EMU10K1X_MIDI_MODE_OUTPUT)) {
-		spin_unlock_irqrestore(&midi->open_lock, flags);
-		err = snd_emu10k1x_midi_cmd(emu, midi, MPU401_RESET, 0);
-	} else {
-		spin_unlock_irqrestore(&midi->open_lock, flags);
+	scoped_guard(spinlock_irqsave, &midi->open_lock) {
+		snd_emu10k1x_intr_disable(emu, midi->rx_enable);
+		midi->midi_mode &= ~EMU10K1X_MIDI_MODE_INPUT;
+		midi->substream_input = NULL;
+		if (midi->midi_mode & EMU10K1X_MIDI_MODE_OUTPUT)
+			return 0;
 	}
-	return err;
+	return snd_emu10k1x_midi_cmd(emu, midi, MPU401_RESET, 0);
 }
 
 static int snd_emu10k1x_midi_output_close(struct snd_rawmidi_substream *substream)
 {
 	struct emu10k1x *emu;
 	struct emu10k1x_midi *midi = substream->rmidi->private_data;
-	unsigned long flags;
-	int err = 0;
 
 	emu = midi->emu;
 	if (snd_BUG_ON(!emu))
 		return -ENXIO;
-	spin_lock_irqsave(&midi->open_lock, flags);
-	snd_emu10k1x_intr_disable(emu, midi->tx_enable);
-	midi->midi_mode &= ~EMU10K1X_MIDI_MODE_OUTPUT;
-	midi->substream_output = NULL;
-	if (!(midi->midi_mode & EMU10K1X_MIDI_MODE_INPUT)) {
-		spin_unlock_irqrestore(&midi->open_lock, flags);
-		err = snd_emu10k1x_midi_cmd(emu, midi, MPU401_RESET, 0);
-	} else {
-		spin_unlock_irqrestore(&midi->open_lock, flags);
+	scoped_guard(spinlock_irqsave, &midi->open_lock) {
+		snd_emu10k1x_intr_disable(emu, midi->tx_enable);
+		midi->midi_mode &= ~EMU10K1X_MIDI_MODE_OUTPUT;
+		midi->substream_output = NULL;
+		if (midi->midi_mode & EMU10K1X_MIDI_MODE_INPUT)
+			return 0;
 	}
-	return err;
+	return snd_emu10k1x_midi_cmd(emu, midi, MPU401_RESET, 0);
 }
 
 static void snd_emu10k1x_midi_input_trigger(struct snd_rawmidi_substream *substream, int up)
@@ -1390,7 +1347,6 @@ static void snd_emu10k1x_midi_output_trigger(struct snd_rawmidi_substream *subst
 {
 	struct emu10k1x *emu;
 	struct emu10k1x_midi *midi = substream->rmidi->private_data;
-	unsigned long flags;
 
 	emu = midi->emu;
 	if (snd_BUG_ON(!emu))
@@ -1401,22 +1357,21 @@ static void snd_emu10k1x_midi_output_trigger(struct snd_rawmidi_substream *subst
 		unsigned char byte;
 	
 		/* try to send some amount of bytes here before interrupts */
-		spin_lock_irqsave(&midi->output_lock, flags);
-		while (max > 0) {
-			if (mpu401_output_ready(emu, midi)) {
-				if (!(midi->midi_mode & EMU10K1X_MIDI_MODE_OUTPUT) ||
-				    snd_rawmidi_transmit(substream, &byte, 1) != 1) {
-					/* no more data */
-					spin_unlock_irqrestore(&midi->output_lock, flags);
-					return;
+		scoped_guard(spinlock_irqsave, &midi->output_lock) {
+			while (max > 0) {
+				if (mpu401_output_ready(emu, midi)) {
+					if (!(midi->midi_mode & EMU10K1X_MIDI_MODE_OUTPUT) ||
+					    snd_rawmidi_transmit(substream, &byte, 1) != 1) {
+						/* no more data */
+						return;
+					}
+					mpu401_write_data(emu, midi, byte);
+					max--;
+				} else {
+					break;
 				}
-				mpu401_write_data(emu, midi, byte);
-				max--;
-			} else {
-				break;
 			}
 		}
-		spin_unlock_irqrestore(&midi->output_lock, flags);
 		snd_emu10k1x_intr_enable(emu, midi->tx_enable);
 	} else {
 		snd_emu10k1x_intr_disable(emu, midi->tx_enable);
-- 
2.50.1

