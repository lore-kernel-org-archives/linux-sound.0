Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C55DA342CBE
	for <linux-sound@vger.kernel.org>; Wed, 27 Aug 2025 09:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756286474; cv=none; b=pvU+3qf7vDqAMxVw9+2NqAjyy43SQH6bFXPoll4RS/uSjI28ZOgtPH6NWUKVCWIpgmhFbkMwRlui3GQ4P1xyUA2jDWH3N+9CQEIFFnGG7el3Dcp7pEjYbPR4zLc2i5I79dO/R5KASqIlhJmdn2SYNz1fz+3XuYklRdg5Y4LM66c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756286474; c=relaxed/simple;
	bh=KN9Fl8REajXglJ6pXTrMvw5fT4KZ8GS8RNRvdC9KraM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A2pRrplPH1GFfWz4r1UtVcmU7FI0wB8/Vck86dpHxQPJLng0noMw1LdrImxNyKvjUdAfKe8iu9WL7Se2H8RNuTQ/MckzVVJDGP7CoOJLfHocCBtp1LvOzJ0NHO4ovXjiZb1V9+G6ag5HZTYBZwH3AtHVlWUZPzAniQyuk57hQQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=O+oRRMuq; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Pz7BgWEj; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=O+oRRMuq; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Pz7BgWEj; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="O+oRRMuq";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Pz7BgWEj";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="O+oRRMuq";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Pz7BgWEj"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 73D7922233;
	Wed, 27 Aug 2025 09:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756286425; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CJd2C0dVGebw6I1gE2eWz1T9Lm2pL3dIS0AbqsZJTkI=;
	b=O+oRRMuqESU/aBiHKtG3+X07j4SC8xR37UBECl2hGholk57LIXTeZ2MR0K09Hf6PSUURPV
	FKFWPE6WszQhKIdrkCX6mTfjrZO0GdI2r2xKNQCrGmPrD7jbGrYF7Oo0RkugxdJQ0xlGd6
	FpOsU02idrdQ2dGW13PR8Mb8fJ+/hX8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756286425;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CJd2C0dVGebw6I1gE2eWz1T9Lm2pL3dIS0AbqsZJTkI=;
	b=Pz7BgWEjsymRpKaMYVtR/Qw1Z2F4CEy6CxG4+cqY6G/Ec0SRBhSzNUCx0XtephR/dpzcnJ
	TftpiE4L+E0wBhCg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=O+oRRMuq;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Pz7BgWEj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756286425; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CJd2C0dVGebw6I1gE2eWz1T9Lm2pL3dIS0AbqsZJTkI=;
	b=O+oRRMuqESU/aBiHKtG3+X07j4SC8xR37UBECl2hGholk57LIXTeZ2MR0K09Hf6PSUURPV
	FKFWPE6WszQhKIdrkCX6mTfjrZO0GdI2r2xKNQCrGmPrD7jbGrYF7Oo0RkugxdJQ0xlGd6
	FpOsU02idrdQ2dGW13PR8Mb8fJ+/hX8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756286425;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CJd2C0dVGebw6I1gE2eWz1T9Lm2pL3dIS0AbqsZJTkI=;
	b=Pz7BgWEjsymRpKaMYVtR/Qw1Z2F4CEy6CxG4+cqY6G/Ec0SRBhSzNUCx0XtephR/dpzcnJ
	TftpiE4L+E0wBhCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 60AC113A31;
	Wed, 27 Aug 2025 09:20:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id GDwSF9nNrmiFEgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 27 Aug 2025 09:20:25 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Clemens Ladisch <clemens@ladisch.de>
Subject: [PATCH 17/19] ALSA: firewire: oxfw: Use guard() for spin locks
Date: Wed, 27 Aug 2025 11:20:11 +0200
Message-ID: <20250827092017.29014-18-tiwai@suse.de>
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
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 73D7922233
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
 sound/firewire/oxfw/oxfw-hwdep.c  | 37 +++++++++----------------------
 sound/firewire/oxfw/oxfw-midi.c   | 10 ++-------
 sound/firewire/oxfw/oxfw-stream.c | 21 +++++-------------
 3 files changed, 18 insertions(+), 50 deletions(-)

diff --git a/sound/firewire/oxfw/oxfw-hwdep.c b/sound/firewire/oxfw/oxfw-hwdep.c
index 3be214d8a922..f8ac362fc73a 100644
--- a/sound/firewire/oxfw/oxfw-hwdep.c
+++ b/sound/firewire/oxfw/oxfw-hwdep.c
@@ -53,18 +53,14 @@ static __poll_t hwdep_poll(struct snd_hwdep *hwdep, struct file *file,
 			       poll_table *wait)
 {
 	struct snd_oxfw *oxfw = hwdep->private_data;
-	__poll_t events;
 
 	poll_wait(file, &oxfw->hwdep_wait, wait);
 
-	spin_lock_irq(&oxfw->lock);
+	guard(spinlock_irq)(&oxfw->lock);
 	if (oxfw->dev_lock_changed)
-		events = EPOLLIN | EPOLLRDNORM;
+		return EPOLLIN | EPOLLRDNORM;
 	else
-		events = 0;
-	spin_unlock_irq(&oxfw->lock);
-
-	return events;
+		return 0;
 }
 
 static int hwdep_get_info(struct snd_oxfw *oxfw, void __user *arg)
@@ -88,48 +84,35 @@ static int hwdep_get_info(struct snd_oxfw *oxfw, void __user *arg)
 
 static int hwdep_lock(struct snd_oxfw *oxfw)
 {
-	int err;
-
-	spin_lock_irq(&oxfw->lock);
+	guard(spinlock_irq)(&oxfw->lock);
 
 	if (oxfw->dev_lock_count == 0) {
 		oxfw->dev_lock_count = -1;
-		err = 0;
+		return 0;
 	} else {
-		err = -EBUSY;
+		return -EBUSY;
 	}
-
-	spin_unlock_irq(&oxfw->lock);
-
-	return err;
 }
 
 static int hwdep_unlock(struct snd_oxfw *oxfw)
 {
-	int err;
-
-	spin_lock_irq(&oxfw->lock);
+	guard(spinlock_irq)(&oxfw->lock);
 
 	if (oxfw->dev_lock_count == -1) {
 		oxfw->dev_lock_count = 0;
-		err = 0;
+		return 0;
 	} else {
-		err = -EBADFD;
+		return -EBADFD;
 	}
-
-	spin_unlock_irq(&oxfw->lock);
-
-	return err;
 }
 
 static int hwdep_release(struct snd_hwdep *hwdep, struct file *file)
 {
 	struct snd_oxfw *oxfw = hwdep->private_data;
 
-	spin_lock_irq(&oxfw->lock);
+	guard(spinlock_irq)(&oxfw->lock);
 	if (oxfw->dev_lock_count == -1)
 		oxfw->dev_lock_count = 0;
-	spin_unlock_irq(&oxfw->lock);
 
 	return 0;
 }
diff --git a/sound/firewire/oxfw/oxfw-midi.c b/sound/firewire/oxfw/oxfw-midi.c
index 7f757f02a877..a16bf885f918 100644
--- a/sound/firewire/oxfw/oxfw-midi.c
+++ b/sound/firewire/oxfw/oxfw-midi.c
@@ -84,9 +84,8 @@ static int midi_playback_close(struct snd_rawmidi_substream *substream)
 static void midi_capture_trigger(struct snd_rawmidi_substream *substrm, int up)
 {
 	struct snd_oxfw *oxfw = substrm->rmidi->private_data;
-	unsigned long flags;
 
-	spin_lock_irqsave(&oxfw->lock, flags);
+	guard(spinlock_irqsave)(&oxfw->lock);
 
 	if (up)
 		amdtp_am824_midi_trigger(&oxfw->tx_stream,
@@ -94,16 +93,13 @@ static void midi_capture_trigger(struct snd_rawmidi_substream *substrm, int up)
 	else
 		amdtp_am824_midi_trigger(&oxfw->tx_stream,
 					 substrm->number, NULL);
-
-	spin_unlock_irqrestore(&oxfw->lock, flags);
 }
 
 static void midi_playback_trigger(struct snd_rawmidi_substream *substrm, int up)
 {
 	struct snd_oxfw *oxfw = substrm->rmidi->private_data;
-	unsigned long flags;
 
-	spin_lock_irqsave(&oxfw->lock, flags);
+	guard(spinlock_irqsave)(&oxfw->lock);
 
 	if (up)
 		amdtp_am824_midi_trigger(&oxfw->rx_stream,
@@ -111,8 +107,6 @@ static void midi_playback_trigger(struct snd_rawmidi_substream *substrm, int up)
 	else
 		amdtp_am824_midi_trigger(&oxfw->rx_stream,
 					 substrm->number, NULL);
-
-	spin_unlock_irqrestore(&oxfw->lock, flags);
 }
 
 static void set_midi_substream_names(struct snd_oxfw *oxfw,
diff --git a/sound/firewire/oxfw/oxfw-stream.c b/sound/firewire/oxfw/oxfw-stream.c
index 00f7feb91f92..5e36d7153a7b 100644
--- a/sound/firewire/oxfw/oxfw-stream.c
+++ b/sound/firewire/oxfw/oxfw-stream.c
@@ -866,33 +866,24 @@ void snd_oxfw_stream_lock_changed(struct snd_oxfw *oxfw)
 
 int snd_oxfw_stream_lock_try(struct snd_oxfw *oxfw)
 {
-	int err;
-
-	spin_lock_irq(&oxfw->lock);
+	guard(spinlock_irq)(&oxfw->lock);
 
 	/* user land lock this */
-	if (oxfw->dev_lock_count < 0) {
-		err = -EBUSY;
-		goto end;
-	}
+	if (oxfw->dev_lock_count < 0)
+		return -EBUSY;
 
 	/* this is the first time */
 	if (oxfw->dev_lock_count++ == 0)
 		snd_oxfw_stream_lock_changed(oxfw);
-	err = 0;
-end:
-	spin_unlock_irq(&oxfw->lock);
-	return err;
+	return 0;
 }
 
 void snd_oxfw_stream_lock_release(struct snd_oxfw *oxfw)
 {
-	spin_lock_irq(&oxfw->lock);
+	guard(spinlock_irq)(&oxfw->lock);
 
 	if (WARN_ON(oxfw->dev_lock_count <= 0))
-		goto end;
+		return;
 	if (--oxfw->dev_lock_count == 0)
 		snd_oxfw_stream_lock_changed(oxfw);
-end:
-	spin_unlock_irq(&oxfw->lock);
 }
-- 
2.50.1

