Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E331D32C318
	for <linux-sound@vger.kernel.org>; Wed, 27 Aug 2025 09:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756286472; cv=none; b=Ulrq1PwDORQX4alLhUUAGfA5GjZ8llrwVSPuagRqtAvKJfxdom5Sk/MWUtCBDe5TiOp1rHF9XpRLpzMVHdAWtOxuMSYRoCEjE8PbI12r/bxyyMuJV4O2DPPPddn07oXtg/xro8Ccoq3y8ZZ9dPTf3ObWMRfAZJ4Pvj9rSLPyWuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756286472; c=relaxed/simple;
	bh=5J5S8AJaU5x3gl7ljPHkD4c3vpBn3f2xXN9Jy25CLRs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fi0URJl5nrvT8wDIB428jO5yHelNBEdEH/A0gbmi2z0/ZYXPYN99D9dXGK8eqhrl+ebyoB5uCu6OUfET73CE8WiqNgwj9p/hHeNN/+D7S7YsKDf/q4aRNNOfCxQtd30W1a0i25jwR6a3uBZX/KJO/3/vazzsnex2+HqK9EdawKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=JO1sI4hk; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=4NAT3OXp; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=JO1sI4hk; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=4NAT3OXp; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="JO1sI4hk";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="4NAT3OXp";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="JO1sI4hk";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="4NAT3OXp"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 027E81FFC7;
	Wed, 27 Aug 2025 09:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756286425; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v6lYccxddkk4cfpmQVkUvC+JXNtrTSLurryIAj1C5rQ=;
	b=JO1sI4hkFVav1+A/QayKAC+2o3qoIrhedU9TqL2o5s2PTxvoevSt0Z3fkaXqp73XnU1ntJ
	oOAga3KFodVv9+vJEyA1+ewsw9Sv/HS0sZfgw1D/iCC0K1/Mk/qR8jKdpXp3UrQ0n7TBTx
	Lv0RcuRxhPUEiKg6/9zSG1n1WQ0RzME=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756286425;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v6lYccxddkk4cfpmQVkUvC+JXNtrTSLurryIAj1C5rQ=;
	b=4NAT3OXpBlSA4AfCLL3V48Bqa48xRk7R9WOuVjWA5AvrwVm8og3+jq+5YF3+KrGHdUavi+
	wwoVCgvUFG5zfoDw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=JO1sI4hk;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=4NAT3OXp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756286425; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v6lYccxddkk4cfpmQVkUvC+JXNtrTSLurryIAj1C5rQ=;
	b=JO1sI4hkFVav1+A/QayKAC+2o3qoIrhedU9TqL2o5s2PTxvoevSt0Z3fkaXqp73XnU1ntJ
	oOAga3KFodVv9+vJEyA1+ewsw9Sv/HS0sZfgw1D/iCC0K1/Mk/qR8jKdpXp3UrQ0n7TBTx
	Lv0RcuRxhPUEiKg6/9zSG1n1WQ0RzME=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756286425;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v6lYccxddkk4cfpmQVkUvC+JXNtrTSLurryIAj1C5rQ=;
	b=4NAT3OXpBlSA4AfCLL3V48Bqa48xRk7R9WOuVjWA5AvrwVm8og3+jq+5YF3+KrGHdUavi+
	wwoVCgvUFG5zfoDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E63A913A31;
	Wed, 27 Aug 2025 09:20:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id qBO3N9jNrmiFEgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 27 Aug 2025 09:20:24 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Clemens Ladisch <clemens@ladisch.de>
Subject: [PATCH 11/19] ALSA: firewire: bebob: Use guard() for spin locks
Date: Wed, 27 Aug 2025 11:20:05 +0200
Message-ID: <20250827092017.29014-12-tiwai@suse.de>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,suse.de:email];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: 027E81FFC7
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01

Clean up the code using guard() for spin locks.

Merely code refactoring, and no behavior change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/firewire/bebob/bebob_hwdep.c  | 37 ++++++++---------------------
 sound/firewire/bebob/bebob_midi.c   | 10 ++------
 sound/firewire/bebob/bebob_stream.c | 21 +++++-----------
 3 files changed, 18 insertions(+), 50 deletions(-)

diff --git a/sound/firewire/bebob/bebob_hwdep.c b/sound/firewire/bebob/bebob_hwdep.c
index 5779e99a6bb2..216d1fceb6e7 100644
--- a/sound/firewire/bebob/bebob_hwdep.c
+++ b/sound/firewire/bebob/bebob_hwdep.c
@@ -53,18 +53,14 @@ static __poll_t
 hwdep_poll(struct snd_hwdep *hwdep, struct file *file, poll_table *wait)
 {
 	struct snd_bebob *bebob = hwdep->private_data;
-	__poll_t events;
 
 	poll_wait(file, &bebob->hwdep_wait, wait);
 
-	spin_lock_irq(&bebob->lock);
+	guard(spinlock_irq)(&bebob->lock);
 	if (bebob->dev_lock_changed)
-		events = EPOLLIN | EPOLLRDNORM;
+		return EPOLLIN | EPOLLRDNORM;
 	else
-		events = 0;
-	spin_unlock_irq(&bebob->lock);
-
-	return events;
+		return 0;
 }
 
 static int
@@ -90,39 +86,27 @@ hwdep_get_info(struct snd_bebob *bebob, void __user *arg)
 static int
 hwdep_lock(struct snd_bebob *bebob)
 {
-	int err;
-
-	spin_lock_irq(&bebob->lock);
+	guard(spinlock_irq)(&bebob->lock);
 
 	if (bebob->dev_lock_count == 0) {
 		bebob->dev_lock_count = -1;
-		err = 0;
+		return 0;
 	} else {
-		err = -EBUSY;
+		return -EBUSY;
 	}
-
-	spin_unlock_irq(&bebob->lock);
-
-	return err;
 }
 
 static int
 hwdep_unlock(struct snd_bebob *bebob)
 {
-	int err;
-
-	spin_lock_irq(&bebob->lock);
+	guard(spinlock_irq)(&bebob->lock);
 
 	if (bebob->dev_lock_count == -1) {
 		bebob->dev_lock_count = 0;
-		err = 0;
+		return 0;
 	} else {
-		err = -EBADFD;
+		return -EBADFD;
 	}
-
-	spin_unlock_irq(&bebob->lock);
-
-	return err;
 }
 
 static int
@@ -130,10 +114,9 @@ hwdep_release(struct snd_hwdep *hwdep, struct file *file)
 {
 	struct snd_bebob *bebob = hwdep->private_data;
 
-	spin_lock_irq(&bebob->lock);
+	guard(spinlock_irq)(&bebob->lock);
 	if (bebob->dev_lock_count == -1)
 		bebob->dev_lock_count = 0;
-	spin_unlock_irq(&bebob->lock);
 
 	return 0;
 }
diff --git a/sound/firewire/bebob/bebob_midi.c b/sound/firewire/bebob/bebob_midi.c
index 5fd2d363de52..678631f31d3c 100644
--- a/sound/firewire/bebob/bebob_midi.c
+++ b/sound/firewire/bebob/bebob_midi.c
@@ -47,9 +47,8 @@ static int midi_close(struct snd_rawmidi_substream *substream)
 static void midi_capture_trigger(struct snd_rawmidi_substream *substrm, int up)
 {
 	struct snd_bebob *bebob = substrm->rmidi->private_data;
-	unsigned long flags;
 
-	spin_lock_irqsave(&bebob->lock, flags);
+	guard(spinlock_irqsave)(&bebob->lock);
 
 	if (up)
 		amdtp_am824_midi_trigger(&bebob->tx_stream,
@@ -57,16 +56,13 @@ static void midi_capture_trigger(struct snd_rawmidi_substream *substrm, int up)
 	else
 		amdtp_am824_midi_trigger(&bebob->tx_stream,
 					 substrm->number, NULL);
-
-	spin_unlock_irqrestore(&bebob->lock, flags);
 }
 
 static void midi_playback_trigger(struct snd_rawmidi_substream *substrm, int up)
 {
 	struct snd_bebob *bebob = substrm->rmidi->private_data;
-	unsigned long flags;
 
-	spin_lock_irqsave(&bebob->lock, flags);
+	guard(spinlock_irqsave)(&bebob->lock);
 
 	if (up)
 		amdtp_am824_midi_trigger(&bebob->rx_stream,
@@ -74,8 +70,6 @@ static void midi_playback_trigger(struct snd_rawmidi_substream *substrm, int up)
 	else
 		amdtp_am824_midi_trigger(&bebob->rx_stream,
 					 substrm->number, NULL);
-
-	spin_unlock_irqrestore(&bebob->lock, flags);
 }
 
 static void set_midi_substream_names(struct snd_bebob *bebob,
diff --git a/sound/firewire/bebob/bebob_stream.c b/sound/firewire/bebob/bebob_stream.c
index 8629b14ded76..449cb17717f0 100644
--- a/sound/firewire/bebob/bebob_stream.c
+++ b/sound/firewire/bebob/bebob_stream.c
@@ -964,33 +964,24 @@ void snd_bebob_stream_lock_changed(struct snd_bebob *bebob)
 
 int snd_bebob_stream_lock_try(struct snd_bebob *bebob)
 {
-	int err;
-
-	spin_lock_irq(&bebob->lock);
+	guard(spinlock_irq)(&bebob->lock);
 
 	/* user land lock this */
-	if (bebob->dev_lock_count < 0) {
-		err = -EBUSY;
-		goto end;
-	}
+	if (bebob->dev_lock_count < 0)
+		return -EBUSY;
 
 	/* this is the first time */
 	if (bebob->dev_lock_count++ == 0)
 		snd_bebob_stream_lock_changed(bebob);
-	err = 0;
-end:
-	spin_unlock_irq(&bebob->lock);
-	return err;
+	return 0;
 }
 
 void snd_bebob_stream_lock_release(struct snd_bebob *bebob)
 {
-	spin_lock_irq(&bebob->lock);
+	guard(spinlock_irq)(&bebob->lock);
 
 	if (WARN_ON(bebob->dev_lock_count <= 0))
-		goto end;
+		return;
 	if (--bebob->dev_lock_count == 0)
 		snd_bebob_stream_lock_changed(bebob);
-end:
-	spin_unlock_irq(&bebob->lock);
 }
-- 
2.50.1

