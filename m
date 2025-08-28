Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 865F9311C3B
	for <linux-sound@vger.kernel.org>; Thu, 28 Aug 2025 13:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756387731; cv=none; b=Fa3WQozflDkk4IxadQo/SkYd+Fa6K5793Vq/Gzi/P88N3DMoICsim5XxchAHXP+ddIGu031BdcKUuLZYqYzudJc3In78FHb8+YuWtES4kwMpeWhJmUY5poyI6n9R7g6CmnSprVD4OFBsWK93Lyy9Z5TaR23iigOpppGi9OmOqWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756387731; c=relaxed/simple;
	bh=Oo77QGHRh2Il66KEg/QciNGbbiYW96p50E/Cy+At6F0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lxjCO4r4FNLSUu8sstb8M5W2kmNuSNPKtH8xX/U+uc3T5wvoD4JDVyJ3/Sl4ie006aDEjJ/vyN8aHXe8duu/8/IarGkq4Ruy/t6WOUizx07O6COakqglq3cNlc/fWjOTatQVGr3GmzRygxpfoUs43Yk2CGp+9PYYeW6YnvQv5UE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=K6vGQuec; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=deMlwz8u; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=K6vGQuec; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=deMlwz8u; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="K6vGQuec";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="deMlwz8u";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="K6vGQuec";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="deMlwz8u"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 779FC22DD4;
	Thu, 28 Aug 2025 13:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756387691; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xp87e/KPtOOzfaaVwD+2SdykCAhzUKpUDs506O+aBt8=;
	b=K6vGQuecGO0HrqaDBakKc9DDv3/nPAhV35BVtm0mSd+QilxwJwrI0kvMW+fI7Wka9YqGE+
	u5zKQRug8hNsojlqUJhbageBD8PUKpcrwuqsUTFABmvBojDQLTr30dULlt3jV3RsRpBo/C
	w2A1mFftW5jW2ywXqQiletKGALrnLxU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756387691;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xp87e/KPtOOzfaaVwD+2SdykCAhzUKpUDs506O+aBt8=;
	b=deMlwz8uL6UeA+X/A8vtrzrz1DYYtQe0QGt3/q+GbLD2tLdm99MsFmRbxQ3vkMGxcFJFuT
	r1zpg7rKuPJ8CXBQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756387691; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xp87e/KPtOOzfaaVwD+2SdykCAhzUKpUDs506O+aBt8=;
	b=K6vGQuecGO0HrqaDBakKc9DDv3/nPAhV35BVtm0mSd+QilxwJwrI0kvMW+fI7Wka9YqGE+
	u5zKQRug8hNsojlqUJhbageBD8PUKpcrwuqsUTFABmvBojDQLTr30dULlt3jV3RsRpBo/C
	w2A1mFftW5jW2ywXqQiletKGALrnLxU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756387691;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xp87e/KPtOOzfaaVwD+2SdykCAhzUKpUDs506O+aBt8=;
	b=deMlwz8uL6UeA+X/A8vtrzrz1DYYtQe0QGt3/q+GbLD2tLdm99MsFmRbxQ3vkMGxcFJFuT
	r1zpg7rKuPJ8CXBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 53A4A1368B;
	Thu, 28 Aug 2025 13:28:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id QPQmE2tZsGgmDgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 28 Aug 2025 13:28:11 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Clemens Ladisch <clemens@ladisch.de>
Subject: [PATCH v2 13/19] ALSA: firewire: digi00x: Use guard() for spin locks
Date: Thu, 28 Aug 2025 15:27:17 +0200
Message-ID: <20250828132802.9032-14-tiwai@suse.de>
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
 sound/firewire/digi00x/digi00x-hwdep.c       | 37 ++++++--------------
 sound/firewire/digi00x/digi00x-midi.c        | 10 ++----
 sound/firewire/digi00x/digi00x-stream.c      | 21 ++++-------
 sound/firewire/digi00x/digi00x-transaction.c |  8 ++---
 4 files changed, 21 insertions(+), 55 deletions(-)

diff --git a/sound/firewire/digi00x/digi00x-hwdep.c b/sound/firewire/digi00x/digi00x-hwdep.c
index b150607c0a0d..435d18417cf0 100644
--- a/sound/firewire/digi00x/digi00x-hwdep.c
+++ b/sound/firewire/digi00x/digi00x-hwdep.c
@@ -63,18 +63,14 @@ static __poll_t hwdep_poll(struct snd_hwdep *hwdep, struct file *file,
 			       poll_table *wait)
 {
 	struct snd_dg00x *dg00x = hwdep->private_data;
-	__poll_t events;
 
 	poll_wait(file, &dg00x->hwdep_wait, wait);
 
-	spin_lock_irq(&dg00x->lock);
+	guard(spinlock_irq)(&dg00x->lock);
 	if (dg00x->dev_lock_changed || dg00x->msg)
-		events = EPOLLIN | EPOLLRDNORM;
+		return EPOLLIN | EPOLLRDNORM;
 	else
-		events = 0;
-	spin_unlock_irq(&dg00x->lock);
-
-	return events;
+		return 0;
 }
 
 static int hwdep_get_info(struct snd_dg00x *dg00x, void __user *arg)
@@ -98,48 +94,35 @@ static int hwdep_get_info(struct snd_dg00x *dg00x, void __user *arg)
 
 static int hwdep_lock(struct snd_dg00x *dg00x)
 {
-	int err;
-
-	spin_lock_irq(&dg00x->lock);
+	guard(spinlock_irq)(&dg00x->lock);
 
 	if (dg00x->dev_lock_count == 0) {
 		dg00x->dev_lock_count = -1;
-		err = 0;
+		return 0;
 	} else {
-		err = -EBUSY;
+		return -EBUSY;
 	}
-
-	spin_unlock_irq(&dg00x->lock);
-
-	return err;
 }
 
 static int hwdep_unlock(struct snd_dg00x *dg00x)
 {
-	int err;
-
-	spin_lock_irq(&dg00x->lock);
+	guard(spinlock_irq)(&dg00x->lock);
 
 	if (dg00x->dev_lock_count == -1) {
 		dg00x->dev_lock_count = 0;
-		err = 0;
+		return 0;
 	} else {
-		err = -EBADFD;
+		return -EBADFD;
 	}
-
-	spin_unlock_irq(&dg00x->lock);
-
-	return err;
 }
 
 static int hwdep_release(struct snd_hwdep *hwdep, struct file *file)
 {
 	struct snd_dg00x *dg00x = hwdep->private_data;
 
-	spin_lock_irq(&dg00x->lock);
+	guard(spinlock_irq)(&dg00x->lock);
 	if (dg00x->dev_lock_count == -1)
 		dg00x->dev_lock_count = 0;
-	spin_unlock_irq(&dg00x->lock);
 
 	return 0;
 }
diff --git a/sound/firewire/digi00x/digi00x-midi.c b/sound/firewire/digi00x/digi00x-midi.c
index 0f6ca58cc4a0..bcdaf003514b 100644
--- a/sound/firewire/digi00x/digi00x-midi.c
+++ b/sound/firewire/digi00x/digi00x-midi.c
@@ -49,21 +49,18 @@ static void midi_capture_trigger(struct snd_rawmidi_substream *substream,
 {
 	struct snd_dg00x *dg00x = substream->rmidi->private_data;
 	unsigned int port;
-	unsigned long flags;
 
 	if (substream->rmidi->device == 0)
 		port = substream->number;
 	else
 		port = 2;
 
-	spin_lock_irqsave(&dg00x->lock, flags);
+	guard(spinlock_irqsave)(&dg00x->lock);
 
 	if (up)
 		amdtp_dot_midi_trigger(&dg00x->tx_stream, port, substream);
 	else
 		amdtp_dot_midi_trigger(&dg00x->tx_stream, port, NULL);
-
-	spin_unlock_irqrestore(&dg00x->lock, flags);
 }
 
 static void midi_playback_trigger(struct snd_rawmidi_substream *substream,
@@ -71,21 +68,18 @@ static void midi_playback_trigger(struct snd_rawmidi_substream *substream,
 {
 	struct snd_dg00x *dg00x = substream->rmidi->private_data;
 	unsigned int port;
-	unsigned long flags;
 
 	if (substream->rmidi->device == 0)
 		port = substream->number;
 	else
 		port = 2;
 
-	spin_lock_irqsave(&dg00x->lock, flags);
+	guard(spinlock_irqsave)(&dg00x->lock);
 
 	if (up)
 		amdtp_dot_midi_trigger(&dg00x->rx_stream, port, substream);
 	else
 		amdtp_dot_midi_trigger(&dg00x->rx_stream, port, NULL);
-
-	spin_unlock_irqrestore(&dg00x->lock, flags);
 }
 
 static void set_substream_names(struct snd_dg00x *dg00x,
diff --git a/sound/firewire/digi00x/digi00x-stream.c b/sound/firewire/digi00x/digi00x-stream.c
index 295163bb8abb..250ffdb26ebd 100644
--- a/sound/firewire/digi00x/digi00x-stream.c
+++ b/sound/firewire/digi00x/digi00x-stream.c
@@ -427,33 +427,24 @@ void snd_dg00x_stream_lock_changed(struct snd_dg00x *dg00x)
 
 int snd_dg00x_stream_lock_try(struct snd_dg00x *dg00x)
 {
-	int err;
-
-	spin_lock_irq(&dg00x->lock);
+	guard(spinlock_irq)(&dg00x->lock);
 
 	/* user land lock this */
-	if (dg00x->dev_lock_count < 0) {
-		err = -EBUSY;
-		goto end;
-	}
+	if (dg00x->dev_lock_count < 0)
+		return -EBUSY;
 
 	/* this is the first time */
 	if (dg00x->dev_lock_count++ == 0)
 		snd_dg00x_stream_lock_changed(dg00x);
-	err = 0;
-end:
-	spin_unlock_irq(&dg00x->lock);
-	return err;
+	return 0;
 }
 
 void snd_dg00x_stream_lock_release(struct snd_dg00x *dg00x)
 {
-	spin_lock_irq(&dg00x->lock);
+	guard(spinlock_irq)(&dg00x->lock);
 
 	if (WARN_ON(dg00x->dev_lock_count <= 0))
-		goto end;
+		return;
 	if (--dg00x->dev_lock_count == 0)
 		snd_dg00x_stream_lock_changed(dg00x);
-end:
-	spin_unlock_irq(&dg00x->lock);
 }
diff --git a/sound/firewire/digi00x/digi00x-transaction.c b/sound/firewire/digi00x/digi00x-transaction.c
index cf0bcf1c5956..8a1667159930 100644
--- a/sound/firewire/digi00x/digi00x-transaction.c
+++ b/sound/firewire/digi00x/digi00x-transaction.c
@@ -11,11 +11,9 @@
 static void handle_unknown_message(struct snd_dg00x *dg00x,
 				   unsigned long long offset, __be32 *buf)
 {
-	unsigned long flags;
-
-	spin_lock_irqsave(&dg00x->lock, flags);
-	dg00x->msg = be32_to_cpu(*buf);
-	spin_unlock_irqrestore(&dg00x->lock, flags);
+	scoped_guard(spinlock_irqsave, &dg00x->lock) {
+		dg00x->msg = be32_to_cpu(*buf);
+	}
 
 	wake_up(&dg00x->hwdep_wait);
 }
-- 
2.50.1

