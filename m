Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31A273128BA
	for <linux-sound@vger.kernel.org>; Thu, 28 Aug 2025 13:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756387743; cv=none; b=Tv7N6alj30TAv4JCkAiZHUL75X/Ysrd5YzitRosxEq3F+zllrolX1n4tOTVFGrhEEvN/8eDRjhtFulDi1ChDK3YM2W/5l4g5ADrspXuU8QzR3gXzTdnEfdJAWF9iLM/Zd6xbLEcfCL6vfCVONYJ4GhZ5SrUF71lRxzfqk183F4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756387743; c=relaxed/simple;
	bh=vVDxtAEKAwKXqnvu0DT1RF+f2mATCnO0s86g1v3xH44=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rglgV+sJgOUAZ+DGHjKlJWRUD0X68v3qLZzFXzpn9PEH05XRWs6su+gj64OxeBRh86fi7HwsTZZ+buEhZvSjKckhOWYwglj78xOAToIcXhVF48PlUxI9wt7L+w9ugUWKVnR+EnAOBeDtFNtyqMmpsNwivjeM9hY00p8YFhr55Dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=w0uaPND6; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=R68QI5Ir; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=w0uaPND6; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=R68QI5Ir; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="w0uaPND6";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="R68QI5Ir";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="w0uaPND6";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="R68QI5Ir"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id CC1FF20BF3;
	Thu, 28 Aug 2025 13:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756387691; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=T5wrDWzlgRPRocpZjRAmMhG/ZLvtyup+cbNEgoDdz7k=;
	b=w0uaPND6jKfkks4uyOazf2J2S0waUXVMiOE8SPcoSDW8zRSJODXMaHLGD+O9/a3LPWWdUr
	Awe4NnzHV7KOYLAI6m4nHov/IqXJA6J9e7CGsPtGPRrlPc9XjMhDdIWkVW5tezg2xo0Yii
	7gtOkA/IwoHW15+6CCYcP+AQOB16S4M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756387691;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=T5wrDWzlgRPRocpZjRAmMhG/ZLvtyup+cbNEgoDdz7k=;
	b=R68QI5IrCPvi7sbhtD+zTB2gfHyJd4p0U90Iak/cOoPhv069s+b5D24oblB8k3ldMA4NK8
	oE58rAwrsIJv+pAQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=w0uaPND6;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=R68QI5Ir
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756387691; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=T5wrDWzlgRPRocpZjRAmMhG/ZLvtyup+cbNEgoDdz7k=;
	b=w0uaPND6jKfkks4uyOazf2J2S0waUXVMiOE8SPcoSDW8zRSJODXMaHLGD+O9/a3LPWWdUr
	Awe4NnzHV7KOYLAI6m4nHov/IqXJA6J9e7CGsPtGPRrlPc9XjMhDdIWkVW5tezg2xo0Yii
	7gtOkA/IwoHW15+6CCYcP+AQOB16S4M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756387691;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=T5wrDWzlgRPRocpZjRAmMhG/ZLvtyup+cbNEgoDdz7k=;
	b=R68QI5IrCPvi7sbhtD+zTB2gfHyJd4p0U90Iak/cOoPhv069s+b5D24oblB8k3ldMA4NK8
	oE58rAwrsIJv+pAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A86CB1368B;
	Thu, 28 Aug 2025 13:28:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id wGT0J2tZsGgmDgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 28 Aug 2025 13:28:11 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Clemens Ladisch <clemens@ladisch.de>
Subject: [PATCH v2 15/19] ALSA: firewire: fireworks: Use guard() for spin locks
Date: Thu, 28 Aug 2025 15:27:19 +0200
Message-ID: <20250828132802.9032-16-tiwai@suse.de>
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
X-Spam-Flag: NO
X-Rspamd-Queue-Id: CC1FF20BF3
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -3.01

Clean up the code using guard() for spin locks.

Merely code refactoring, and no behavior change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/firewire/fireworks/fireworks_command.c  | 16 ++++----
 sound/firewire/fireworks/fireworks_hwdep.c    | 41 ++++++-------------
 sound/firewire/fireworks/fireworks_midi.c     | 10 +----
 sound/firewire/fireworks/fireworks_stream.c   | 21 +++-------
 .../fireworks/fireworks_transaction.c         | 39 +++++++-----------
 5 files changed, 42 insertions(+), 85 deletions(-)

diff --git a/sound/firewire/fireworks/fireworks_command.c b/sound/firewire/fireworks/fireworks_command.c
index 7e255fc2c6e4..2b595ee0bc35 100644
--- a/sound/firewire/fireworks/fireworks_command.c
+++ b/sound/firewire/fireworks/fireworks_command.c
@@ -119,14 +119,14 @@ efw_transaction(struct snd_efw *efw, unsigned int category,
 		return -ENOMEM;
 
 	/* to keep consistency of sequence number */
-	spin_lock(&efw->lock);
-	if ((efw->seqnum < KERNEL_SEQNUM_MIN) ||
-	    (efw->seqnum >= KERNEL_SEQNUM_MAX - 2))
-		efw->seqnum = KERNEL_SEQNUM_MIN;
-	else
-		efw->seqnum += 2;
-	seqnum = efw->seqnum;
-	spin_unlock(&efw->lock);
+	scoped_guard(spinlock, &efw->lock) {
+		if ((efw->seqnum < KERNEL_SEQNUM_MIN) ||
+		    (efw->seqnum >= KERNEL_SEQNUM_MAX - 2))
+			efw->seqnum = KERNEL_SEQNUM_MIN;
+		else
+			efw->seqnum += 2;
+		seqnum = efw->seqnum;
+	}
 
 	/* fill transaction header fields */
 	cmd_bytes = sizeof(struct snd_efw_transaction) + param_bytes;
diff --git a/sound/firewire/fireworks/fireworks_hwdep.c b/sound/firewire/fireworks/fireworks_hwdep.c
index 037833cd066e..7d6bd8ceeab3 100644
--- a/sound/firewire/fireworks/fireworks_hwdep.c
+++ b/sound/firewire/fireworks/fireworks_hwdep.c
@@ -103,12 +103,10 @@ hwdep_read_locked(struct snd_efw *efw, char __user *buf, long count,
 		.lock_status.type = SNDRV_FIREWIRE_EVENT_LOCK_STATUS,
 	};
 
-	spin_lock_irq(&efw->lock);
-
-	event.lock_status.status = (efw->dev_lock_count > 0);
-	efw->dev_lock_changed = false;
-
-	spin_unlock_irq(&efw->lock);
+	scoped_guard(spinlock_irq, &efw->lock) {
+		event.lock_status.status = (efw->dev_lock_count > 0);
+		efw->dev_lock_changed = false;
+	}
 
 	count = min_t(long, count, sizeof(event.lock_status));
 
@@ -192,13 +190,11 @@ hwdep_poll(struct snd_hwdep *hwdep, struct file *file, poll_table *wait)
 
 	poll_wait(file, &efw->hwdep_wait, wait);
 
-	spin_lock_irq(&efw->lock);
+	guard(spinlock_irq)(&efw->lock);
 	if (efw->dev_lock_changed || efw->pull_ptr != efw->push_ptr)
 		events = EPOLLIN | EPOLLRDNORM;
 	else
 		events = 0;
-	spin_unlock_irq(&efw->lock);
-
 	return events | EPOLLOUT;
 }
 
@@ -225,39 +221,27 @@ hwdep_get_info(struct snd_efw *efw, void __user *arg)
 static int
 hwdep_lock(struct snd_efw *efw)
 {
-	int err;
-
-	spin_lock_irq(&efw->lock);
+	guard(spinlock_irq)(&efw->lock);
 
 	if (efw->dev_lock_count == 0) {
 		efw->dev_lock_count = -1;
-		err = 0;
+		return 0;
 	} else {
-		err = -EBUSY;
+		return -EBUSY;
 	}
-
-	spin_unlock_irq(&efw->lock);
-
-	return err;
 }
 
 static int
 hwdep_unlock(struct snd_efw *efw)
 {
-	int err;
-
-	spin_lock_irq(&efw->lock);
+	guard(spinlock_irq)(&efw->lock);
 
 	if (efw->dev_lock_count == -1) {
 		efw->dev_lock_count = 0;
-		err = 0;
+		return 0;
 	} else {
-		err = -EBADFD;
+		return -EBADFD;
 	}
-
-	spin_unlock_irq(&efw->lock);
-
-	return err;
 }
 
 static int
@@ -265,10 +249,9 @@ hwdep_release(struct snd_hwdep *hwdep, struct file *file)
 {
 	struct snd_efw *efw = hwdep->private_data;
 
-	spin_lock_irq(&efw->lock);
+	guard(spinlock_irq)(&efw->lock);
 	if (efw->dev_lock_count == -1)
 		efw->dev_lock_count = 0;
-	spin_unlock_irq(&efw->lock);
 
 	return 0;
 }
diff --git a/sound/firewire/fireworks/fireworks_midi.c b/sound/firewire/fireworks/fireworks_midi.c
index 90fe809a26c0..405106a6aef9 100644
--- a/sound/firewire/fireworks/fireworks_midi.c
+++ b/sound/firewire/fireworks/fireworks_midi.c
@@ -46,9 +46,8 @@ static int midi_close(struct snd_rawmidi_substream *substream)
 static void midi_capture_trigger(struct snd_rawmidi_substream *substrm, int up)
 {
 	struct snd_efw *efw = substrm->rmidi->private_data;
-	unsigned long flags;
 
-	spin_lock_irqsave(&efw->lock, flags);
+	guard(spinlock_irqsave)(&efw->lock);
 
 	if (up)
 		amdtp_am824_midi_trigger(&efw->tx_stream,
@@ -56,16 +55,13 @@ static void midi_capture_trigger(struct snd_rawmidi_substream *substrm, int up)
 	else
 		amdtp_am824_midi_trigger(&efw->tx_stream,
 					  substrm->number, NULL);
-
-	spin_unlock_irqrestore(&efw->lock, flags);
 }
 
 static void midi_playback_trigger(struct snd_rawmidi_substream *substrm, int up)
 {
 	struct snd_efw *efw = substrm->rmidi->private_data;
-	unsigned long flags;
 
-	spin_lock_irqsave(&efw->lock, flags);
+	guard(spinlock_irqsave)(&efw->lock);
 
 	if (up)
 		amdtp_am824_midi_trigger(&efw->rx_stream,
@@ -73,8 +69,6 @@ static void midi_playback_trigger(struct snd_rawmidi_substream *substrm, int up)
 	else
 		amdtp_am824_midi_trigger(&efw->rx_stream,
 					 substrm->number, NULL);
-
-	spin_unlock_irqrestore(&efw->lock, flags);
 }
 
 static void set_midi_substream_names(struct snd_efw *efw,
diff --git a/sound/firewire/fireworks/fireworks_stream.c b/sound/firewire/fireworks/fireworks_stream.c
index 53dbd4d4b0d0..974084e1c083 100644
--- a/sound/firewire/fireworks/fireworks_stream.c
+++ b/sound/firewire/fireworks/fireworks_stream.c
@@ -345,33 +345,24 @@ void snd_efw_stream_lock_changed(struct snd_efw *efw)
 
 int snd_efw_stream_lock_try(struct snd_efw *efw)
 {
-	int err;
-
-	spin_lock_irq(&efw->lock);
+	guard(spinlock_irq)(&efw->lock);
 
 	/* user land lock this */
-	if (efw->dev_lock_count < 0) {
-		err = -EBUSY;
-		goto end;
-	}
+	if (efw->dev_lock_count < 0)
+		return -EBUSY;
 
 	/* this is the first time */
 	if (efw->dev_lock_count++ == 0)
 		snd_efw_stream_lock_changed(efw);
-	err = 0;
-end:
-	spin_unlock_irq(&efw->lock);
-	return err;
+	return 0;
 }
 
 void snd_efw_stream_lock_release(struct snd_efw *efw)
 {
-	spin_lock_irq(&efw->lock);
+	guard(spinlock_irq)(&efw->lock);
 
 	if (WARN_ON(efw->dev_lock_count <= 0))
-		goto end;
+		return;
 	if (--efw->dev_lock_count == 0)
 		snd_efw_stream_lock_changed(efw);
-end:
-	spin_unlock_irq(&efw->lock);
 }
diff --git a/sound/firewire/fireworks/fireworks_transaction.c b/sound/firewire/fireworks/fireworks_transaction.c
index 9f8c53b39f95..5c859773fe06 100644
--- a/sound/firewire/fireworks/fireworks_transaction.c
+++ b/sound/firewire/fireworks/fireworks_transaction.c
@@ -82,9 +82,9 @@ int snd_efw_transaction_run(struct fw_unit *unit,
 	t.state = STATE_PENDING;
 	init_waitqueue_head(&t.wait);
 
-	spin_lock_irq(&transaction_queues_lock);
-	list_add_tail(&t.list, &transaction_queues);
-	spin_unlock_irq(&transaction_queues_lock);
+	scoped_guard(spinlock_irq, &transaction_queues_lock) {
+		list_add_tail(&t.list, &transaction_queues);
+	}
 
 	tries = 0;
 	do {
@@ -107,9 +107,9 @@ int snd_efw_transaction_run(struct fw_unit *unit,
 		}
 	} while (1);
 
-	spin_lock_irq(&transaction_queues_lock);
-	list_del(&t.list);
-	spin_unlock_irq(&transaction_queues_lock);
+	scoped_guard(spinlock_irq, &transaction_queues_lock) {
+		list_del(&t.list);
+	}
 
 	return ret;
 }
@@ -123,7 +123,7 @@ copy_resp_to_buf(struct snd_efw *efw, void *data, size_t length, int *rcode)
 	t = (struct snd_efw_transaction *)data;
 	length = min_t(size_t, be32_to_cpu(t->length) * sizeof(u32), length);
 
-	spin_lock(&efw->lock);
+	guard(spinlock)(&efw->lock);
 
 	if (efw->push_ptr < efw->pull_ptr)
 		capacity = (unsigned int)(efw->pull_ptr - efw->push_ptr);
@@ -134,7 +134,7 @@ copy_resp_to_buf(struct snd_efw *efw, void *data, size_t length, int *rcode)
 	/* confirm enough space for this response */
 	if (capacity < length) {
 		*rcode = RCODE_CONFLICT_ERROR;
-		goto end;
+		return;
 	}
 
 	/* copy to ring buffer */
@@ -157,8 +157,6 @@ copy_resp_to_buf(struct snd_efw *efw, void *data, size_t length, int *rcode)
 	wake_up(&efw->hwdep_wait);
 
 	*rcode = RCODE_COMPLETE;
-end:
-	spin_unlock_irq(&efw->lock);
 }
 
 static void
@@ -169,7 +167,7 @@ handle_resp_for_user(struct fw_card *card, int generation, int source,
 	struct snd_efw *efw;
 	unsigned int i;
 
-	spin_lock_irq(&instances_lock);
+	guard(spinlock_irq)(&instances_lock);
 
 	for (i = 0; i < SNDRV_CARDS; i++) {
 		efw = instances[i];
@@ -186,11 +184,9 @@ handle_resp_for_user(struct fw_card *card, int generation, int source,
 		break;
 	}
 	if (i == SNDRV_CARDS)
-		goto end;
+		return;
 
 	copy_resp_to_buf(efw, data, length, rcode);
-end:
-	spin_unlock(&instances_lock);
 }
 
 static void
@@ -199,9 +195,8 @@ handle_resp_for_kernel(struct fw_card *card, int generation, int source,
 {
 	struct fw_device *device;
 	struct transaction_queue *t;
-	unsigned long flags;
 
-	spin_lock_irqsave(&transaction_queues_lock, flags);
+	guard(spinlock_irqsave)(&transaction_queues_lock);
 	list_for_each_entry(t, &transaction_queues, list) {
 		device = fw_parent_device(t->unit);
 		if ((device->card != card) ||
@@ -219,7 +214,6 @@ handle_resp_for_kernel(struct fw_card *card, int generation, int source,
 			*rcode = RCODE_COMPLETE;
 		}
 	}
-	spin_unlock_irqrestore(&transaction_queues_lock, flags);
 }
 
 static void
@@ -259,7 +253,7 @@ void snd_efw_transaction_add_instance(struct snd_efw *efw)
 {
 	unsigned int i;
 
-	spin_lock_irq(&instances_lock);
+	guard(spinlock_irq)(&instances_lock);
 
 	for (i = 0; i < SNDRV_CARDS; i++) {
 		if (instances[i] != NULL)
@@ -267,30 +261,26 @@ void snd_efw_transaction_add_instance(struct snd_efw *efw)
 		instances[i] = efw;
 		break;
 	}
-
-	spin_unlock_irq(&instances_lock);
 }
 
 void snd_efw_transaction_remove_instance(struct snd_efw *efw)
 {
 	unsigned int i;
 
-	spin_lock_irq(&instances_lock);
+	guard(spinlock_irq)(&instances_lock);
 
 	for (i = 0; i < SNDRV_CARDS; i++) {
 		if (instances[i] != efw)
 			continue;
 		instances[i] = NULL;
 	}
-
-	spin_unlock_irq(&instances_lock);
 }
 
 void snd_efw_transaction_bus_reset(struct fw_unit *unit)
 {
 	struct transaction_queue *t;
 
-	spin_lock_irq(&transaction_queues_lock);
+	guard(spinlock_irq)(&transaction_queues_lock);
 	list_for_each_entry(t, &transaction_queues, list) {
 		if ((t->unit == unit) &&
 		    (t->state == STATE_PENDING)) {
@@ -298,7 +288,6 @@ void snd_efw_transaction_bus_reset(struct fw_unit *unit)
 			wake_up(&t->wait);
 		}
 	}
-	spin_unlock_irq(&transaction_queues_lock);
 }
 
 static struct fw_address_handler resp_register_handler = {
-- 
2.50.1

