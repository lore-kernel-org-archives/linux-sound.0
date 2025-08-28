Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07EDE311C01
	for <linux-sound@vger.kernel.org>; Thu, 28 Aug 2025 13:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756387749; cv=none; b=hmbcCxYnBg+QBfbasdvHWGPmbMbkdqdmjUnK7kp8BxLlp1NiVLkYkQ6YkhE7kV2cj4qdU5OSJViChMc3FE4l/yk2xqBgjb4LOqxms33hvR4fZaobTJSybXWj2VwWekB3/92aoAV4fILE0J6wMHfM8gfctgq6EfxAezGbwLMxcy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756387749; c=relaxed/simple;
	bh=wAyJzhHdCnGb6UI/V6R8qZthSewZ7T326nhE9lB3CtU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZxLFUJtNkt1G8kfYNU+r6TFkNbNlQP5CmxHxdqQ/bzelJMLBmqwH+VYc3qkBEh2B2L1q0BW3vusxVOYNSliZl0vXPZa2GTu4g3dolWbkc2K4KXE8lUrvn5unScnuxK5R7UmuXRjrIcu5UeSDfKqEEKhnt/F1xeeNO8oMb/tkokA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=BRwG+iYX; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=4CqcFW8Q; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=BRwG+iYX; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=4CqcFW8Q; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="BRwG+iYX";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="4CqcFW8Q";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="BRwG+iYX";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="4CqcFW8Q"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 037B720BF4;
	Thu, 28 Aug 2025 13:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756387692; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tK5UmPhFUCEZ/5WZKyo7o/IIX/P+wrr9xUDWT7oON40=;
	b=BRwG+iYX5n6RfxN+Mm5gFZg6CyDQbKq1/u1IQJ1LNHkiS+1TNQzMzkDDvhp/SJkEIPI5Au
	GMWowP2HPhd9ZFzIQMBdZmVl4TwkfuOPDXfxzbAWHgoit6VGzqScEuH6bjyIiI8go2mSeK
	PdBfSZzlrm1VnekE0C3L3bKWFZfpFJ4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756387692;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tK5UmPhFUCEZ/5WZKyo7o/IIX/P+wrr9xUDWT7oON40=;
	b=4CqcFW8QBvRrUgo+VpuOUjhl5AbUHRTY+P/xmH99QOVnn04jwLAGdkIAtCU9lweaTNMSY+
	ZDUogtyYXDG9oGAg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756387692; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tK5UmPhFUCEZ/5WZKyo7o/IIX/P+wrr9xUDWT7oON40=;
	b=BRwG+iYX5n6RfxN+Mm5gFZg6CyDQbKq1/u1IQJ1LNHkiS+1TNQzMzkDDvhp/SJkEIPI5Au
	GMWowP2HPhd9ZFzIQMBdZmVl4TwkfuOPDXfxzbAWHgoit6VGzqScEuH6bjyIiI8go2mSeK
	PdBfSZzlrm1VnekE0C3L3bKWFZfpFJ4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756387692;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tK5UmPhFUCEZ/5WZKyo7o/IIX/P+wrr9xUDWT7oON40=;
	b=4CqcFW8QBvRrUgo+VpuOUjhl5AbUHRTY+P/xmH99QOVnn04jwLAGdkIAtCU9lweaTNMSY+
	ZDUogtyYXDG9oGAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D26B113326;
	Thu, 28 Aug 2025 13:28:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id qMImMmtZsGgmDgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 28 Aug 2025 13:28:11 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Clemens Ladisch <clemens@ladisch.de>
Subject: [PATCH v2 16/19] ALSA: firewire: motu: Use guard() for spin locks
Date: Thu, 28 Aug 2025 15:27:20 +0200
Message-ID: <20250828132802.9032-17-tiwai@suse.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250828132802.9032-1-tiwai@suse.de>
References: <20250828132802.9032-1-tiwai@suse.de>
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
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	R_RATELIMIT(0.00)[to_ip_from(RL4srdohtr7muph9mn9hundm3r)];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -2.80

Clean up the code using guard() for spin locks.

Merely code refactoring, and no behavior change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 .../motu/motu-command-dsp-message-parser.c    |  9 ++----
 sound/firewire/motu/motu-hwdep.c              | 30 +++++--------------
 sound/firewire/motu/motu-midi.c               | 10 ++-----
 .../motu/motu-register-dsp-message-parser.c   | 18 +++--------
 sound/firewire/motu/motu-stream.c             | 21 ++++---------
 sound/firewire/motu/motu-transaction.c        |  7 ++---
 6 files changed, 25 insertions(+), 70 deletions(-)

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
index 1ed60618220d..e0ce1e8703f5 100644
--- a/sound/firewire/motu/motu-hwdep.c
+++ b/sound/firewire/motu/motu-hwdep.c
@@ -104,12 +104,11 @@ static __poll_t hwdep_poll(struct snd_hwdep *hwdep, struct file *file,
 
 	poll_wait(file, &motu->hwdep_wait, wait);
 
-	spin_lock_irq(&motu->lock);
+	guard(spinlock_irq)(&motu->lock);
 	if (motu->dev_lock_changed || motu->msg || has_dsp_event(motu))
 		events = EPOLLIN | EPOLLRDNORM;
 	else
 		events = 0;
-	spin_unlock_irq(&motu->lock);
 
 	return events | EPOLLOUT;
 }
@@ -135,48 +134,35 @@ static int hwdep_get_info(struct snd_motu *motu, void __user *arg)
 
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

