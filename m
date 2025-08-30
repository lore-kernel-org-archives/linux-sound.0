Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B68EB24169D
	for <linux-sound@vger.kernel.org>; Sat, 30 Aug 2025 08:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756541038; cv=none; b=odhTmX2w/OqDfLeO4wixtQjfi18s2wJan2D3XSAfOkHJk0fCKZRXmOKI4wEmg4MYW+hKSZVeZ/KpS2brfT+sxPa0re3aoh1ukJmk096rWtiMm7UulHTC9HXlt5qnN2u1/glDvqllwwExasjTml+T6hIQ0wmc6bDb+i3UehmEQ+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756541038; c=relaxed/simple;
	bh=bJdJoKW8ZPIaos5oRWbf60tbQYEUr27mQu389D0ZGNY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DRG7D6IyZHrHLqCwvWEaEjLPcTcGsKZpOKTGYF445uUPvQ18U3aT7jBz1Rl4uOnGU3/N5NYofofxpEdBaTQelbaTegNtDBEhBcdK+ap+bDq2YGljK1BOVgRx1hv3OmJspBdj5mukZmoxsPKfZwIN8Pd+1CZTjE4n+eW3v+U+rbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=NhvhU3If; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=0cQNQRkW; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=tzOmc+GC; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Tu7coenr; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="NhvhU3If";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="0cQNQRkW";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="tzOmc+GC";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Tu7coenr"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id B7E7C336C0;
	Sat, 30 Aug 2025 08:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756541034; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=91kzAtwCrT6R4Jn8oyYieocLPqbBufAQO3BfdmXbOOo=;
	b=NhvhU3Ifhq+rveYOGr4tuN7QrhdSvCmUzOsO1jXTcYGK3Q0rH95xYkqzzFBq5tOH0bR6dV
	1NSb21FvOvsjsqKI9B2RAJM7Fi9jm76DIFsf4WpcB+BswY7Y9nd61zW3Zp8rwWY5XcjYJB
	9Wa1u5CXvVBT3+Apcb9Zd0KlkaGAlq4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756541034;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=91kzAtwCrT6R4Jn8oyYieocLPqbBufAQO3BfdmXbOOo=;
	b=0cQNQRkWrbkeoqh+IzZUiAmFGgCpdBfhPiHeit91bPHkdV9L86WH01jh6j2i1YyIyKfIpP
	NoHLEeCJZMFbPCAg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=tzOmc+GC;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Tu7coenr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756541033; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=91kzAtwCrT6R4Jn8oyYieocLPqbBufAQO3BfdmXbOOo=;
	b=tzOmc+GCyn7aURYY+CsVxCRMkKbnhnwwUm4Dr7I6HetIw6Ady+oMCvQNbg90K1VA3qRw4t
	0HT0MdVP+5caiJ4nJHc6ql352AHbA2R9VdLv+/x9ehtPG6fMMCp1g7lnZQijIi0AfEFTO5
	Vxkm/9/D7sVYpzIm9h0x7Xp3oZYnRMM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756541033;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=91kzAtwCrT6R4Jn8oyYieocLPqbBufAQO3BfdmXbOOo=;
	b=Tu7coenrXE/g0oXBB32UptirKkDxaMDGHjzX+4t9UeBQ/AdeSJF2z3fohoY/b3o0RoVtQY
	A6Jgnglpab9PxQBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 94B7313890;
	Sat, 30 Aug 2025 08:03:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id LYmPImmwsmjXIgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 30 Aug 2025 08:03:53 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: Takashi Sakamoto <o-takashi@sakamocchi.jp>
Subject: [PATCH v3] ALSA: firewire: motu: Use guard() for spin locks
Date: Sat, 30 Aug 2025 10:03:50 +0200
Message-ID: <20250830080351.25600-1-tiwai@suse.de>
X-Mailer: git-send-email 2.50.1
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
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,sakamocchi.jp:email,suse.de:mid,suse.de:dkim,suse.de:email]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: B7E7C336C0
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01

Clean up the code using guard() for spin locks.

Merely code refactoring, and no behavior change.

Reviewed-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
v2->v3: rebase on the latest code and simplify hwdep_poll() accordingly

 .../motu/motu-command-dsp-message-parser.c    |  9 +----
 sound/firewire/motu/motu-hwdep.c              | 37 +++++--------------
 sound/firewire/motu/motu-midi.c               | 10 +----
 .../motu/motu-register-dsp-message-parser.c   | 18 ++-------
 sound/firewire/motu/motu-stream.c             | 21 +++--------
 sound/firewire/motu/motu-transaction.c        |  7 ++--
 6 files changed, 27 insertions(+), 75 deletions(-)

diff --git a/sound/firewire/motu/motu-command-dsp-message-parser.c b/sound/firewire/motu/motu-command-dsp-message-parser.c
index 5d8a86a12f1f..c6440e6e360b 100644
--- a/sound/firewire/motu/motu-command-dsp-message-parser.c
+++ b/sound/firewire/motu/motu-command-dsp-message-parser.c
@@ -87,10 +87,9 @@ void snd_motu_command_dsp_message_parser_parse(const struct amdtp_stream *s,
 	unsigned int data_block_quadlets = s->data_block_quadlets;
 	struct msg_parser *parser = motu->message_parser;
 	unsigned int interval = parser->interval;
-	unsigned long flags;
 	int i;
 
-	spin_lock_irqsave(&parser->lock, flags);
+	guard(spinlock_irqsave)(&parser->lock);
 
 	for (i = 0; i < count; ++i) {
 		__be32 *buffer = desc->ctx_payload;
@@ -168,17 +167,13 @@ void snd_motu_command_dsp_message_parser_parse(const struct amdtp_stream *s,
 			}
 		}
 	}
-
-	spin_unlock_irqrestore(&parser->lock, flags);
 }
 
 void snd_motu_command_dsp_message_parser_copy_meter(struct snd_motu *motu,
 					struct snd_firewire_motu_command_dsp_meter *meter)
 {
 	struct msg_parser *parser = motu->message_parser;
-	unsigned long flags;
 
-	spin_lock_irqsave(&parser->lock, flags);
+	guard(spinlock_irqsave)(&parser->lock);
 	memcpy(meter, &parser->meter, sizeof(*meter));
-	spin_unlock_irqrestore(&parser->lock, flags);
 }
diff --git a/sound/firewire/motu/motu-hwdep.c b/sound/firewire/motu/motu-hwdep.c
index fa2685665db3..981c19430cb0 100644
--- a/sound/firewire/motu/motu-hwdep.c
+++ b/sound/firewire/motu/motu-hwdep.c
@@ -100,18 +100,14 @@ static __poll_t hwdep_poll(struct snd_hwdep *hwdep, struct file *file,
 			       poll_table *wait)
 {
 	struct snd_motu *motu = hwdep->private_data;
-	__poll_t events;
 
 	poll_wait(file, &motu->hwdep_wait, wait);
 
-	spin_lock_irq(&motu->lock);
+	guard(spinlock_irq)(&motu->lock);
 	if (motu->dev_lock_changed || motu->msg || has_dsp_event(motu))
-		events = EPOLLIN | EPOLLRDNORM;
+		return EPOLLIN | EPOLLRDNORM;
 	else
-		events = 0;
-	spin_unlock_irq(&motu->lock);
-
-	return events;
+		return 0;
 }
 
 static int hwdep_get_info(struct snd_motu *motu, void __user *arg)
@@ -135,48 +131,35 @@ static int hwdep_get_info(struct snd_motu *motu, void __user *arg)
 
 static int hwdep_lock(struct snd_motu *motu)
 {
-	int err;
-
-	spin_lock_irq(&motu->lock);
+	guard(spinlock_irq)(&motu->lock);
 
 	if (motu->dev_lock_count == 0) {
 		motu->dev_lock_count = -1;
-		err = 0;
+		return 0;
 	} else {
-		err = -EBUSY;
+		return -EBUSY;
 	}
-
-	spin_unlock_irq(&motu->lock);
-
-	return err;
 }
 
 static int hwdep_unlock(struct snd_motu *motu)
 {
-	int err;
-
-	spin_lock_irq(&motu->lock);
+	guard(spinlock_irq)(&motu->lock);
 
 	if (motu->dev_lock_count == -1) {
 		motu->dev_lock_count = 0;
-		err = 0;
+		return 0;
 	} else {
-		err = -EBADFD;
+		return -EBADFD;
 	}
-
-	spin_unlock_irq(&motu->lock);
-
-	return err;
 }
 
 static int hwdep_release(struct snd_hwdep *hwdep, struct file *file)
 {
 	struct snd_motu *motu = hwdep->private_data;
 
-	spin_lock_irq(&motu->lock);
+	guard(spinlock_irq)(&motu->lock);
 	if (motu->dev_lock_count == -1)
 		motu->dev_lock_count = 0;
-	spin_unlock_irq(&motu->lock);
 
 	return 0;
 }
diff --git a/sound/firewire/motu/motu-midi.c b/sound/firewire/motu/motu-midi.c
index 18c5734e999f..85e3260f9349 100644
--- a/sound/firewire/motu/motu-midi.c
+++ b/sound/firewire/motu/motu-midi.c
@@ -47,9 +47,8 @@ static int midi_close(struct snd_rawmidi_substream *substream)
 static void midi_capture_trigger(struct snd_rawmidi_substream *substrm, int up)
 {
 	struct snd_motu *motu = substrm->rmidi->private_data;
-	unsigned long flags;
 
-	spin_lock_irqsave(&motu->lock, flags);
+	guard(spinlock_irqsave)(&motu->lock);
 
 	if (up)
 		amdtp_motu_midi_trigger(&motu->tx_stream, substrm->number,
@@ -57,16 +56,13 @@ static void midi_capture_trigger(struct snd_rawmidi_substream *substrm, int up)
 	else
 		amdtp_motu_midi_trigger(&motu->tx_stream, substrm->number,
 					NULL);
-
-	spin_unlock_irqrestore(&motu->lock, flags);
 }
 
 static void midi_playback_trigger(struct snd_rawmidi_substream *substrm, int up)
 {
 	struct snd_motu *motu = substrm->rmidi->private_data;
-	unsigned long flags;
 
-	spin_lock_irqsave(&motu->lock, flags);
+	guard(spinlock_irqsave)(&motu->lock);
 
 	if (up)
 		amdtp_motu_midi_trigger(&motu->rx_stream, substrm->number,
@@ -74,8 +70,6 @@ static void midi_playback_trigger(struct snd_rawmidi_substream *substrm, int up)
 	else
 		amdtp_motu_midi_trigger(&motu->rx_stream, substrm->number,
 					NULL);
-
-	spin_unlock_irqrestore(&motu->lock, flags);
 }
 
 static void set_midi_substream_names(struct snd_motu *motu,
diff --git a/sound/firewire/motu/motu-register-dsp-message-parser.c b/sound/firewire/motu/motu-register-dsp-message-parser.c
index ef3b0b0f0dab..a8053e3ef065 100644
--- a/sound/firewire/motu/motu-register-dsp-message-parser.c
+++ b/sound/firewire/motu/motu-register-dsp-message-parser.c
@@ -150,10 +150,9 @@ void snd_motu_register_dsp_message_parser_parse(const struct amdtp_stream *s,
 	struct msg_parser *parser = motu->message_parser;
 	bool meter_pos_quirk = parser->meter_pos_quirk;
 	unsigned int pos = parser->push_pos;
-	unsigned long flags;
 	int i;
 
-	spin_lock_irqsave(&parser->lock, flags);
+	guard(spinlock_irqsave)(&parser->lock);
 
 	for (i = 0; i < count; ++i) {
 		__be32 *buffer = desc->ctx_payload;
@@ -363,30 +362,24 @@ void snd_motu_register_dsp_message_parser_parse(const struct amdtp_stream *s,
 
 	if (pos != parser->push_pos)
 		wake_up(&motu->hwdep_wait);
-
-	spin_unlock_irqrestore(&parser->lock, flags);
 }
 
 void snd_motu_register_dsp_message_parser_copy_meter(struct snd_motu *motu,
 						struct snd_firewire_motu_register_dsp_meter *meter)
 {
 	struct msg_parser *parser = motu->message_parser;
-	unsigned long flags;
 
-	spin_lock_irqsave(&parser->lock, flags);
+	guard(spinlock_irqsave)(&parser->lock);
 	memcpy(meter, &parser->meter, sizeof(*meter));
-	spin_unlock_irqrestore(&parser->lock, flags);
 }
 
 void snd_motu_register_dsp_message_parser_copy_parameter(struct snd_motu *motu,
 					struct snd_firewire_motu_register_dsp_parameter *param)
 {
 	struct msg_parser *parser = motu->message_parser;
-	unsigned long flags;
 
-	spin_lock_irqsave(&parser->lock, flags);
+	guard(spinlock_irqsave)(&parser->lock);
 	memcpy(param, &parser->param, sizeof(*param));
-	spin_unlock_irqrestore(&parser->lock, flags);
 }
 
 unsigned int snd_motu_register_dsp_message_parser_count_event(struct snd_motu *motu)
@@ -403,12 +396,11 @@ bool snd_motu_register_dsp_message_parser_copy_event(struct snd_motu *motu, u32
 {
 	struct msg_parser *parser = motu->message_parser;
 	unsigned int pos = parser->pull_pos;
-	unsigned long flags;
 
 	if (pos == parser->push_pos)
 		return false;
 
-	spin_lock_irqsave(&parser->lock, flags);
+	guard(spinlock_irqsave)(&parser->lock);
 
 	*event = parser->event_queue[pos];
 
@@ -417,7 +409,5 @@ bool snd_motu_register_dsp_message_parser_copy_event(struct snd_motu *motu, u32
 		pos = 0;
 	parser->pull_pos = pos;
 
-	spin_unlock_irqrestore(&parser->lock, flags);
-
 	return true;
 }
diff --git a/sound/firewire/motu/motu-stream.c b/sound/firewire/motu/motu-stream.c
index 64aec9c3eefd..e5f21360cfb7 100644
--- a/sound/firewire/motu/motu-stream.c
+++ b/sound/firewire/motu/motu-stream.c
@@ -407,32 +407,23 @@ static void motu_lock_changed(struct snd_motu *motu)
 
 int snd_motu_stream_lock_try(struct snd_motu *motu)
 {
-	int err;
+	guard(spinlock_irq)(&motu->lock);
 
-	spin_lock_irq(&motu->lock);
-
-	if (motu->dev_lock_count < 0) {
-		err = -EBUSY;
-		goto out;
-	}
+	if (motu->dev_lock_count < 0)
+		return -EBUSY;
 
 	if (motu->dev_lock_count++ == 0)
 		motu_lock_changed(motu);
-	err = 0;
-out:
-	spin_unlock_irq(&motu->lock);
-	return err;
+	return 0;
 }
 
 void snd_motu_stream_lock_release(struct snd_motu *motu)
 {
-	spin_lock_irq(&motu->lock);
+	guard(spinlock_irq)(&motu->lock);
 
 	if (WARN_ON(motu->dev_lock_count <= 0))
-		goto out;
+		return;
 
 	if (--motu->dev_lock_count == 0)
 		motu_lock_changed(motu);
-out:
-	spin_unlock_irq(&motu->lock);
 }
diff --git a/sound/firewire/motu/motu-transaction.c b/sound/firewire/motu/motu-transaction.c
index 2dc1d6e59144..804f4208cf81 100644
--- a/sound/firewire/motu/motu-transaction.c
+++ b/sound/firewire/motu/motu-transaction.c
@@ -51,7 +51,6 @@ static void handle_message(struct fw_card *card, struct fw_request *request,
 {
 	struct snd_motu *motu = callback_data;
 	__be32 *buf = (__be32 *)data;
-	unsigned long flags;
 
 	if (tcode != TCODE_WRITE_QUADLET_REQUEST) {
 		fw_send_response(card, request, RCODE_COMPLETE);
@@ -63,9 +62,9 @@ static void handle_message(struct fw_card *card, struct fw_request *request,
 		return;
 	}
 
-	spin_lock_irqsave(&motu->lock, flags);
-	motu->msg = be32_to_cpu(*buf);
-	spin_unlock_irqrestore(&motu->lock, flags);
+	scoped_guard(spinlock_irqsave, &motu->lock) {
+		motu->msg = be32_to_cpu(*buf);
+	}
 
 	fw_send_response(card, request, RCODE_COMPLETE);
 
-- 
2.50.1

