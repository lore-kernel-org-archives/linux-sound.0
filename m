Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78F4B342CBE
	for <linux-sound@vger.kernel.org>; Wed, 27 Aug 2025 09:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756286479; cv=none; b=dXgqRI+i9ZfVU9qDTssDQ3968sORZFeEieosfMTRSM6I9DkrGaNK8wbn1ZM9zDG/T22Qj4K25npIYXJzuNY71/9YjGQCWdmJcKX78xwV/qJjgtFtYjboaNVqBPPsG8I4JRtpFPZ4S2PSwoRJUcUEIacBlloE8HFpfyUCBFYQyOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756286479; c=relaxed/simple;
	bh=iIET9E/IFFYye+BhCCVwYU7rXKW+OUl8DQUmVJEhLkI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p/tbAmjFk8WQLpPBaBN/gS9Krj6e26y9euKw/0vp2SgIAxEogFqGb/03ZELtceop1wqRjCk75/ZPLRKyJ77dnuRsyoyLz7CoFbjOdxqkYsIbi0LsGjG1JtVP280kA4AgcYbHziyZvt+kikcOMvtO5acQchQNTl2D/oSd2xgxHWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=B5ePUjcS; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=vt6jK2LC; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=B5ePUjcS; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=vt6jK2LC; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="B5ePUjcS";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="vt6jK2LC";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="B5ePUjcS";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="vt6jK2LC"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 3B0D11FFC8;
	Wed, 27 Aug 2025 09:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756286425; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+dZL+l6+TfQz/z3/P/bn13cte/nQvS+6r1Z6YkDtkLw=;
	b=B5ePUjcSfNgyXMwqpFpqe3j6ujS8BVHsxzvunde65FGP8Nbjvjb5VYVm+xTOLMelxzttWk
	N0aEQFhNGTjL7BHwg7nTqza79/lBWDAoEJ1SGT7+rXg9/W51AZiS0suzlh4LVbUknnLRPE
	U2oOdUpLKgVhAc+Cs9fyZYXhC/q3PSo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756286425;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+dZL+l6+TfQz/z3/P/bn13cte/nQvS+6r1Z6YkDtkLw=;
	b=vt6jK2LCNIqE8kz68S/NtS9V9uEVhJj8PZiXU4OqCjCqYXbbxVyAv4GGHCcpxy0VQxUg1x
	3jPoSrIzg59DVABg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756286425; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+dZL+l6+TfQz/z3/P/bn13cte/nQvS+6r1Z6YkDtkLw=;
	b=B5ePUjcSfNgyXMwqpFpqe3j6ujS8BVHsxzvunde65FGP8Nbjvjb5VYVm+xTOLMelxzttWk
	N0aEQFhNGTjL7BHwg7nTqza79/lBWDAoEJ1SGT7+rXg9/W51AZiS0suzlh4LVbUknnLRPE
	U2oOdUpLKgVhAc+Cs9fyZYXhC/q3PSo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756286425;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+dZL+l6+TfQz/z3/P/bn13cte/nQvS+6r1Z6YkDtkLw=;
	b=vt6jK2LCNIqE8kz68S/NtS9V9uEVhJj8PZiXU4OqCjCqYXbbxVyAv4GGHCcpxy0VQxUg1x
	3jPoSrIzg59DVABg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 291AA13A31;
	Wed, 27 Aug 2025 09:20:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 0PiHCdnNrmiFEgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 27 Aug 2025 09:20:25 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Clemens Ladisch <clemens@ladisch.de>
Subject: [PATCH 14/19] ALSA: firewire: fireface: Use guard() for spin locks
Date: Wed, 27 Aug 2025 11:20:08 +0200
Message-ID: <20250827092017.29014-15-tiwai@suse.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250827092017.29014-1-tiwai@suse.de>
References: <20250827092017.29014-1-tiwai@suse.de>
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
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	R_RATELIMIT(0.00)[to_ip_from(RL4srdohtr7muph9mn9hundm3r)];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -2.80

Clean up the code using guard() for spin locks.

Merely code refactoring, and no behavior change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/firewire/fireface/ff-hwdep.c       | 37 +++++++-----------------
 sound/firewire/fireface/ff-midi.c        | 10 ++-----
 sound/firewire/fireface/ff-stream.c      | 21 ++++----------
 sound/firewire/fireface/ff-transaction.c |  4 +--
 4 files changed, 19 insertions(+), 53 deletions(-)

diff --git a/sound/firewire/fireface/ff-hwdep.c b/sound/firewire/fireface/ff-hwdep.c
index ca5c5dee71f2..5976abf2e1ab 100644
--- a/sound/firewire/fireface/ff-hwdep.c
+++ b/sound/firewire/fireface/ff-hwdep.c
@@ -72,18 +72,14 @@ static __poll_t hwdep_poll(struct snd_hwdep *hwdep, struct file *file,
 			       poll_table *wait)
 {
 	struct snd_ff *ff = hwdep->private_data;
-	__poll_t events;
 
 	poll_wait(file, &ff->hwdep_wait, wait);
 
-	spin_lock_irq(&ff->lock);
+	guard(spinlock_irq)(&ff->lock);
 	if (ff->dev_lock_changed || has_msg(ff))
-		events = EPOLLIN | EPOLLRDNORM;
+		return EPOLLIN | EPOLLRDNORM;
 	else
-		events = 0;
-	spin_unlock_irq(&ff->lock);
-
-	return events;
+		return 0;
 }
 
 static int hwdep_get_info(struct snd_ff *ff, void __user *arg)
@@ -107,48 +103,35 @@ static int hwdep_get_info(struct snd_ff *ff, void __user *arg)
 
 static int hwdep_lock(struct snd_ff *ff)
 {
-	int err;
-
-	spin_lock_irq(&ff->lock);
+	guard(spinlock_irq)(&ff->lock);
 
 	if (ff->dev_lock_count == 0) {
 		ff->dev_lock_count = -1;
-		err = 0;
+		return 0;
 	} else {
-		err = -EBUSY;
+		return -EBUSY;
 	}
-
-	spin_unlock_irq(&ff->lock);
-
-	return err;
 }
 
 static int hwdep_unlock(struct snd_ff *ff)
 {
-	int err;
-
-	spin_lock_irq(&ff->lock);
+	guard(spinlock_irq)(&ff->lock);
 
 	if (ff->dev_lock_count == -1) {
 		ff->dev_lock_count = 0;
-		err = 0;
+		return 0;
 	} else {
-		err = -EBADFD;
+		return -EBADFD;
 	}
-
-	spin_unlock_irq(&ff->lock);
-
-	return err;
 }
 
 static int hwdep_release(struct snd_hwdep *hwdep, struct file *file)
 {
 	struct snd_ff *ff = hwdep->private_data;
 
-	spin_lock_irq(&ff->lock);
+	guard(spinlock_irq)(&ff->lock);
 	if (ff->dev_lock_count == -1)
 		ff->dev_lock_count = 0;
-	spin_unlock_irq(&ff->lock);
 
 	return 0;
 }
diff --git a/sound/firewire/fireface/ff-midi.c b/sound/firewire/fireface/ff-midi.c
index da3054fdcc7d..9f6aa490e5bf 100644
--- a/sound/firewire/fireface/ff-midi.c
+++ b/sound/firewire/fireface/ff-midi.c
@@ -46,31 +46,25 @@ static void midi_capture_trigger(struct snd_rawmidi_substream *substream,
 				 int up)
 {
 	struct snd_ff *ff = substream->rmidi->private_data;
-	unsigned long flags;
 
-	spin_lock_irqsave(&ff->lock, flags);
+	guard(spinlock_irqsave)(&ff->lock);
 
 	if (up)
 		WRITE_ONCE(ff->tx_midi_substreams[substream->number],
 			   substream);
 	else
 		WRITE_ONCE(ff->tx_midi_substreams[substream->number], NULL);
-
-	spin_unlock_irqrestore(&ff->lock, flags);
 }
 
 static void midi_playback_trigger(struct snd_rawmidi_substream *substream,
 				  int up)
 {
 	struct snd_ff *ff = substream->rmidi->private_data;
-	unsigned long flags;
 
-	spin_lock_irqsave(&ff->lock, flags);
+	guard(spinlock_irqsave)(&ff->lock);
 
 	if (up || !ff->rx_midi_error[substream->number])
 		schedule_work(&ff->rx_midi_work[substream->number]);
-
-	spin_unlock_irqrestore(&ff->lock, flags);
 }
 
 static void set_midi_substream_names(struct snd_rawmidi_str *stream,
diff --git a/sound/firewire/fireface/ff-stream.c b/sound/firewire/fireface/ff-stream.c
index 95bf405adb3d..ba42490f2b0e 100644
--- a/sound/firewire/fireface/ff-stream.c
+++ b/sound/firewire/fireface/ff-stream.c
@@ -253,33 +253,24 @@ void snd_ff_stream_lock_changed(struct snd_ff *ff)
 
 int snd_ff_stream_lock_try(struct snd_ff *ff)
 {
-	int err;
-
-	spin_lock_irq(&ff->lock);
+	guard(spinlock_irq)(&ff->lock);
 
 	/* user land lock this */
-	if (ff->dev_lock_count < 0) {
-		err = -EBUSY;
-		goto end;
-	}
+	if (ff->dev_lock_count < 0)
+		return -EBUSY;
 
 	/* this is the first time */
 	if (ff->dev_lock_count++ == 0)
 		snd_ff_stream_lock_changed(ff);
-	err = 0;
-end:
-	spin_unlock_irq(&ff->lock);
-	return err;
+	return 0;
 }
 
 void snd_ff_stream_lock_release(struct snd_ff *ff)
 {
-	spin_lock_irq(&ff->lock);
+	guard(spinlock_irq)(&ff->lock);
 
 	if (WARN_ON(ff->dev_lock_count <= 0))
-		goto end;
+		return;
 	if (--ff->dev_lock_count == 0)
 		snd_ff_stream_lock_changed(ff);
-end:
-	spin_unlock_irq(&ff->lock);
 }
diff --git a/sound/firewire/fireface/ff-transaction.c b/sound/firewire/fireface/ff-transaction.c
index 6b89e39f4a43..436da0a3bdcc 100644
--- a/sound/firewire/fireface/ff-transaction.c
+++ b/sound/firewire/fireface/ff-transaction.c
@@ -132,15 +132,13 @@ static void handle_msg(struct fw_card *card, struct fw_request *request, int tco
 	struct snd_ff *ff = callback_data;
 	__le32 *buf = data;
 	u32 tstamp = fw_request_get_timestamp(request);
-	unsigned long flag;
 
 	fw_send_response(card, request, RCODE_COMPLETE);
 
 	offset -= ff->async_handler.offset;
 
-	spin_lock_irqsave(&ff->lock, flag);
+	guard(spinlock_irqsave)(&ff->lock);
 	ff->spec->protocol->handle_msg(ff, (unsigned int)offset, buf, length, tstamp);
-	spin_unlock_irqrestore(&ff->lock, flag);
 }
 
 static int allocate_own_address(struct snd_ff *ff, int i)
-- 
2.50.1

