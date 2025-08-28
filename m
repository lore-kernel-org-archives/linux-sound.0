Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFA02311955
	for <linux-sound@vger.kernel.org>; Thu, 28 Aug 2025 13:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756387761; cv=none; b=V/stJZosFZuE/rWEZRVl8UL8dm3kuajUqN/an8+0xriIboVnGJIe9GE+fC1+gL7Y62Ua/3AmDiYt3MSLAYW5N0u9Ori98lUfkYguQ9vFboHs4k+MiUUCYJonBScig8jvYaZBUt/B41MI0Gc9L79Pbk81IyjMwRzFVl2ovuTI6Os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756387761; c=relaxed/simple;
	bh=9EFYx6qSXPPqc/DQ+lcRqH+Pt7ZZfjoMoCnXZf+m7nM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lUD3amnToRlQywL5PpwCG69P2cBAcpETzFXM4REfRDbhRyrhyr4ycq5VaIM99Dn500CAy/lqSVz4/VYIRIhkmf7y8EFU4ynOpNtfHNcC9iZNUT51G2O3Xi5uXQ+pUhjsUrdjQUI+z3y9qOngqsRvjt7xNMwt7ahTDQ2wQCJMd64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=la+UjZ4Z; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=IoRNeA7K; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=la+UjZ4Z; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=IoRNeA7K; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="la+UjZ4Z";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="IoRNeA7K";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="la+UjZ4Z";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="IoRNeA7K"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 54C6920BF6;
	Thu, 28 Aug 2025 13:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756387692; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=23gU1wva0zG8IuY5L3tBcT3lRO02Eddxty0TxJXkVno=;
	b=la+UjZ4ZMF2X0/pvySiqd6AO0a63Gm9QpC8PXZ2OOiXk6kviTSKIIlQzqPin3ohbS7G04x
	OoflC+T9AsrVHM392lTdprqM5of7H0Y3+xcJtAHIz6hsLS6qqMUTxoZKMRF4tVg56RUucF
	msyHQ9da5Xkm5NcA68WWjVb2Wk78cBg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756387692;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=23gU1wva0zG8IuY5L3tBcT3lRO02Eddxty0TxJXkVno=;
	b=IoRNeA7Kd9nyA5ZMSXfm08UCEkvN78HEYjw7uDOrLPKVl53EMoICYwkeQbRrxi/KzPDy5l
	5AcFtPF8yDhsgECw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=la+UjZ4Z;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=IoRNeA7K
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756387692; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=23gU1wva0zG8IuY5L3tBcT3lRO02Eddxty0TxJXkVno=;
	b=la+UjZ4ZMF2X0/pvySiqd6AO0a63Gm9QpC8PXZ2OOiXk6kviTSKIIlQzqPin3ohbS7G04x
	OoflC+T9AsrVHM392lTdprqM5of7H0Y3+xcJtAHIz6hsLS6qqMUTxoZKMRF4tVg56RUucF
	msyHQ9da5Xkm5NcA68WWjVb2Wk78cBg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756387692;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=23gU1wva0zG8IuY5L3tBcT3lRO02Eddxty0TxJXkVno=;
	b=IoRNeA7Kd9nyA5ZMSXfm08UCEkvN78HEYjw7uDOrLPKVl53EMoICYwkeQbRrxi/KzPDy5l
	5AcFtPF8yDhsgECw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 316DF13326;
	Thu, 28 Aug 2025 13:28:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 4ETkCmxZsGgmDgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 28 Aug 2025 13:28:12 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Clemens Ladisch <clemens@ladisch.de>
Subject: [PATCH v2 18/19] ALSA: firewire: tascam: Use guard() for spin locks
Date: Thu, 28 Aug 2025 15:27:22 +0200
Message-ID: <20250828132802.9032-19-tiwai@suse.de>
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
X-Rspamd-Queue-Id: 54C6920BF6
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
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	R_RATELIMIT(0.00)[to_ip_from(RLoh6gpjpepziq6z1gge5pcxxt)];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email]
X-Spam-Score: -3.01

Clean up the code using guard() for spin locks.

Merely code refactoring, and no behavior change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/firewire/tascam/amdtp-tascam.c  | 15 +++++------
 sound/firewire/tascam/tascam-hwdep.c  | 37 ++++++++-------------------
 sound/firewire/tascam/tascam-midi.c   | 10 ++------
 sound/firewire/tascam/tascam-stream.c | 21 +++++----------
 4 files changed, 25 insertions(+), 58 deletions(-)

diff --git a/sound/firewire/tascam/amdtp-tascam.c b/sound/firewire/tascam/amdtp-tascam.c
index 079afa4bd381..59c339d9b5fb 100644
--- a/sound/firewire/tascam/amdtp-tascam.c
+++ b/sound/firewire/tascam/amdtp-tascam.c
@@ -157,15 +157,14 @@ static void read_status_messages(struct amdtp_stream *s,
 			if ((before ^ after) & mask) {
 				struct snd_firewire_tascam_change *entry =
 						&tscm->queue[tscm->push_pos];
-				unsigned long flag;
 
-				spin_lock_irqsave(&tscm->lock, flag);
-				entry->index = index;
-				entry->before = before;
-				entry->after = after;
-				if (++tscm->push_pos >= SND_TSCM_QUEUE_COUNT)
-					tscm->push_pos = 0;
-				spin_unlock_irqrestore(&tscm->lock, flag);
+				scoped_guard(spinlock_irqsave, &tscm->lock) {
+					entry->index = index;
+					entry->before = before;
+					entry->after = after;
+					if (++tscm->push_pos >= SND_TSCM_QUEUE_COUNT)
+						tscm->push_pos = 0;
+				}
 
 				wake_up(&tscm->hwdep_wait);
 			}
diff --git a/sound/firewire/tascam/tascam-hwdep.c b/sound/firewire/tascam/tascam-hwdep.c
index 8fc30cba29d5..867b4ea1096e 100644
--- a/sound/firewire/tascam/tascam-hwdep.c
+++ b/sound/firewire/tascam/tascam-hwdep.c
@@ -130,18 +130,14 @@ static __poll_t hwdep_poll(struct snd_hwdep *hwdep, struct file *file,
 			       poll_table *wait)
 {
 	struct snd_tscm *tscm = hwdep->private_data;
-	__poll_t events;
 
 	poll_wait(file, &tscm->hwdep_wait, wait);
 
-	spin_lock_irq(&tscm->lock);
+	guard(spinlock_irq)(&tscm->lock);
 	if (tscm->dev_lock_changed || tscm->push_pos != tscm->pull_pos)
-		events = EPOLLIN | EPOLLRDNORM;
+		return EPOLLIN | EPOLLRDNORM;
 	else
-		events = 0;
-	spin_unlock_irq(&tscm->lock);
-
-	return events;
+		return 0;
 }
 
 static int hwdep_get_info(struct snd_tscm *tscm, void __user *arg)
@@ -165,38 +161,26 @@ static int hwdep_get_info(struct snd_tscm *tscm, void __user *arg)
 
 static int hwdep_lock(struct snd_tscm *tscm)
 {
-	int err;
-
-	spin_lock_irq(&tscm->lock);
+	guard(spinlock_irq)(&tscm->lock);
 
 	if (tscm->dev_lock_count == 0) {
 		tscm->dev_lock_count = -1;
-		err = 0;
+		return 0;
 	} else {
-		err = -EBUSY;
+		return -EBUSY;
 	}
-
-	spin_unlock_irq(&tscm->lock);
-
-	return err;
 }
 
 static int hwdep_unlock(struct snd_tscm *tscm)
 {
-	int err;
-
-	spin_lock_irq(&tscm->lock);
+	guard(spinlock_irq)(&tscm->lock);
 
 	if (tscm->dev_lock_count == -1) {
 		tscm->dev_lock_count = 0;
-		err = 0;
+		return 0;
 	} else {
-		err = -EBADFD;
+		return -EBADFD;
 	}
-
-	spin_unlock_irq(&tscm->lock);
-
-	return err;
 }
 
 static int tscm_hwdep_state(struct snd_tscm *tscm, void __user *arg)
@@ -211,10 +195,9 @@ static int hwdep_release(struct snd_hwdep *hwdep, struct file *file)
 {
 	struct snd_tscm *tscm = hwdep->private_data;
 
-	spin_lock_irq(&tscm->lock);
+	guard(spinlock_irq)(&tscm->lock);
 	if (tscm->dev_lock_count == -1)
 		tscm->dev_lock_count = 0;
-	spin_unlock_irq(&tscm->lock);
 
 	return 0;
 }
diff --git a/sound/firewire/tascam/tascam-midi.c b/sound/firewire/tascam/tascam-midi.c
index c57fac4f1968..1bf9d7b3da33 100644
--- a/sound/firewire/tascam/tascam-midi.c
+++ b/sound/firewire/tascam/tascam-midi.c
@@ -43,30 +43,24 @@ static void midi_playback_drain(struct snd_rawmidi_substream *substream)
 static void midi_capture_trigger(struct snd_rawmidi_substream *substrm, int up)
 {
 	struct snd_tscm *tscm = substrm->rmidi->private_data;
-	unsigned long flags;
 
-	spin_lock_irqsave(&tscm->lock, flags);
+	guard(spinlock_irqsave)(&tscm->lock);
 
 	if (up)
 		tscm->tx_midi_substreams[substrm->number] = substrm;
 	else
 		tscm->tx_midi_substreams[substrm->number] = NULL;
-
-	spin_unlock_irqrestore(&tscm->lock, flags);
 }
 
 static void midi_playback_trigger(struct snd_rawmidi_substream *substrm, int up)
 {
 	struct snd_tscm *tscm = substrm->rmidi->private_data;
-	unsigned long flags;
 
-	spin_lock_irqsave(&tscm->lock, flags);
+	guard(spinlock_irqsave)(&tscm->lock);
 
 	if (up)
 		snd_fw_async_midi_port_run(&tscm->out_ports[substrm->number],
 					   substrm);
-
-	spin_unlock_irqrestore(&tscm->lock, flags);
 }
 
 int snd_tscm_create_midi_devices(struct snd_tscm *tscm)
diff --git a/sound/firewire/tascam/tascam-stream.c b/sound/firewire/tascam/tascam-stream.c
index dfe783d01d7d..9c8fddd7dee1 100644
--- a/sound/firewire/tascam/tascam-stream.c
+++ b/sound/firewire/tascam/tascam-stream.c
@@ -527,33 +527,24 @@ void snd_tscm_stream_lock_changed(struct snd_tscm *tscm)
 
 int snd_tscm_stream_lock_try(struct snd_tscm *tscm)
 {
-	int err;
-
-	spin_lock_irq(&tscm->lock);
+	guard(spinlock_irq)(&tscm->lock);
 
 	/* user land lock this */
-	if (tscm->dev_lock_count < 0) {
-		err = -EBUSY;
-		goto end;
-	}
+	if (tscm->dev_lock_count < 0)
+		return -EBUSY;
 
 	/* this is the first time */
 	if (tscm->dev_lock_count++ == 0)
 		snd_tscm_stream_lock_changed(tscm);
-	err = 0;
-end:
-	spin_unlock_irq(&tscm->lock);
-	return err;
+	return 0;
 }
 
 void snd_tscm_stream_lock_release(struct snd_tscm *tscm)
 {
-	spin_lock_irq(&tscm->lock);
+	guard(spinlock_irq)(&tscm->lock);
 
 	if (WARN_ON(tscm->dev_lock_count <= 0))
-		goto end;
+		return;
 	if (--tscm->dev_lock_count == 0)
 		snd_tscm_stream_lock_changed(tscm);
-end:
-	spin_unlock_irq(&tscm->lock);
 }
-- 
2.50.1

