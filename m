Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50C0F311C3F
	for <linux-sound@vger.kernel.org>; Thu, 28 Aug 2025 13:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756387736; cv=none; b=qOEhyQWZjmtZKZlSuVs2s2oetda0upSKO7phze3V0y+mW8STt95ljHGbYswwXo8yz3liYsAAlTAfU1FhgKDt5P+GWGeGoTc0GmM3qwoUmYG9O172fg1Bkv42KdSRiR5L//nukNOHgHqmvSKhMNVm9uBrrn60EDNK0WPCLqSeK0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756387736; c=relaxed/simple;
	bh=OSZSOfXPZxMdv6izv8EwGuJW7OJ8t4e/ZPt/1PqPa7U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Syq/oCN/XNWu5nyFyLdFIswRpZro10hrw8Hhk978o69zMDmb2J2OUhwmu4gszHJN3bNkQ8llGb/5K9+L7SfyuEJSRwnyhXgz4+RbPTqopTQjm55TpLKJWcVWXu60xpeNa5RLWBbICVCSfb9mF1zzuxOOWG7EBDrteOXWeCFDieM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=f7DDpom6; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=1LiWuf0/; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=f7DDpom6; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=1LiWuf0/; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="f7DDpom6";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1LiWuf0/";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="f7DDpom6";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1LiWuf0/"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 4DF8920BF2;
	Thu, 28 Aug 2025 13:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756387691; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ARn33w4vjEvrKIIDIIwEl+E9wSwdsCvZvxMaNC0T7LY=;
	b=f7DDpom6KcpYV9hl1jLFHi2zDjxBHd3cptwHKGtyZJ/zf7OWAH/6/Iqn1i39b6x3tzpPTm
	Lz2ns2ctcJHGmJzOh2dTq9LOmU9nwDmyolW+lhLMarSgovEIHxvOCbkJtzF6ffOyYm9gp5
	HBGBHFAisevabPv4E0NxL6hzfncLzVI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756387691;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ARn33w4vjEvrKIIDIIwEl+E9wSwdsCvZvxMaNC0T7LY=;
	b=1LiWuf0/rEawVNDJMXDLtUGTI/K3SGryMVcgsz2pM1zZhZMxkaa6SCEuhjjN3OvgVKRrK+
	deekbpddK+rLTxAg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756387691; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ARn33w4vjEvrKIIDIIwEl+E9wSwdsCvZvxMaNC0T7LY=;
	b=f7DDpom6KcpYV9hl1jLFHi2zDjxBHd3cptwHKGtyZJ/zf7OWAH/6/Iqn1i39b6x3tzpPTm
	Lz2ns2ctcJHGmJzOh2dTq9LOmU9nwDmyolW+lhLMarSgovEIHxvOCbkJtzF6ffOyYm9gp5
	HBGBHFAisevabPv4E0NxL6hzfncLzVI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756387691;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ARn33w4vjEvrKIIDIIwEl+E9wSwdsCvZvxMaNC0T7LY=;
	b=1LiWuf0/rEawVNDJMXDLtUGTI/K3SGryMVcgsz2pM1zZhZMxkaa6SCEuhjjN3OvgVKRrK+
	deekbpddK+rLTxAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2ADCF13326;
	Thu, 28 Aug 2025 13:28:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id YKJTCWtZsGgmDgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 28 Aug 2025 13:28:11 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Clemens Ladisch <clemens@ladisch.de>
Subject: [PATCH v2 12/19] ALSA: firewire: dice: Use guard() for spin locks
Date: Thu, 28 Aug 2025 15:27:16 +0200
Message-ID: <20250828132802.9032-13-tiwai@suse.de>
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
 sound/firewire/dice/dice-hwdep.c       | 37 +++++++-------------------
 sound/firewire/dice/dice-midi.c        | 10 ++-----
 sound/firewire/dice/dice-stream.c      | 21 +++++----------
 sound/firewire/dice/dice-transaction.c |  7 +++--
 4 files changed, 21 insertions(+), 54 deletions(-)

diff --git a/sound/firewire/dice/dice-hwdep.c b/sound/firewire/dice/dice-hwdep.c
index d165dd427bd3..747ff0952483 100644
--- a/sound/firewire/dice/dice-hwdep.c
+++ b/sound/firewire/dice/dice-hwdep.c
@@ -55,18 +55,14 @@ static __poll_t hwdep_poll(struct snd_hwdep *hwdep, struct file *file,
 			       poll_table *wait)
 {
 	struct snd_dice *dice = hwdep->private_data;
-	__poll_t events;
 
 	poll_wait(file, &dice->hwdep_wait, wait);
 
-	spin_lock_irq(&dice->lock);
+	guard(spinlock_irq)(&dice->lock);
 	if (dice->dev_lock_changed || dice->notification_bits != 0)
-		events = EPOLLIN | EPOLLRDNORM;
+		return EPOLLIN | EPOLLRDNORM;
 	else
-		events = 0;
-	spin_unlock_irq(&dice->lock);
-
-	return events;
+		return 0;
 }
 
 static int hwdep_get_info(struct snd_dice *dice, void __user *arg)
@@ -90,48 +86,35 @@ static int hwdep_get_info(struct snd_dice *dice, void __user *arg)
 
 static int hwdep_lock(struct snd_dice *dice)
 {
-	int err;
-
-	spin_lock_irq(&dice->lock);
+	guard(spinlock_irq)(&dice->lock);
 
 	if (dice->dev_lock_count == 0) {
 		dice->dev_lock_count = -1;
-		err = 0;
+		return 0;
 	} else {
-		err = -EBUSY;
+		return -EBUSY;
 	}
-
-	spin_unlock_irq(&dice->lock);
-
-	return err;
 }
 
 static int hwdep_unlock(struct snd_dice *dice)
 {
-	int err;
-
-	spin_lock_irq(&dice->lock);
+	guard(spinlock_irq)(&dice->lock);
 
 	if (dice->dev_lock_count == -1) {
 		dice->dev_lock_count = 0;
-		err = 0;
+		return 0;
 	} else {
-		err = -EBADFD;
+		return -EBADFD;
 	}
-
-	spin_unlock_irq(&dice->lock);
-
-	return err;
 }
 
 static int hwdep_release(struct snd_hwdep *hwdep, struct file *file)
 {
 	struct snd_dice *dice = hwdep->private_data;
 
-	spin_lock_irq(&dice->lock);
+	guard(spinlock_irq)(&dice->lock);
 	if (dice->dev_lock_count == -1)
 		dice->dev_lock_count = 0;
-	spin_unlock_irq(&dice->lock);
 
 	return 0;
 }
diff --git a/sound/firewire/dice/dice-midi.c b/sound/firewire/dice/dice-midi.c
index 9ca975c556ca..722bce379345 100644
--- a/sound/firewire/dice/dice-midi.c
+++ b/sound/firewire/dice/dice-midi.c
@@ -47,9 +47,8 @@ static int midi_close(struct snd_rawmidi_substream *substream)
 static void midi_capture_trigger(struct snd_rawmidi_substream *substrm, int up)
 {
 	struct snd_dice *dice = substrm->rmidi->private_data;
-	unsigned long flags;
 
-	spin_lock_irqsave(&dice->lock, flags);
+	guard(spinlock_irqsave)(&dice->lock);
 
 	if (up)
 		amdtp_am824_midi_trigger(&dice->tx_stream[0],
@@ -57,16 +56,13 @@ static void midi_capture_trigger(struct snd_rawmidi_substream *substrm, int up)
 	else
 		amdtp_am824_midi_trigger(&dice->tx_stream[0],
 					  substrm->number, NULL);
-
-	spin_unlock_irqrestore(&dice->lock, flags);
 }
 
 static void midi_playback_trigger(struct snd_rawmidi_substream *substrm, int up)
 {
 	struct snd_dice *dice = substrm->rmidi->private_data;
-	unsigned long flags;
 
-	spin_lock_irqsave(&dice->lock, flags);
+	guard(spinlock_irqsave)(&dice->lock);
 
 	if (up)
 		amdtp_am824_midi_trigger(&dice->rx_stream[0],
@@ -74,8 +70,6 @@ static void midi_playback_trigger(struct snd_rawmidi_substream *substrm, int up)
 	else
 		amdtp_am824_midi_trigger(&dice->rx_stream[0],
 					 substrm->number, NULL);
-
-	spin_unlock_irqrestore(&dice->lock, flags);
 }
 
 static void set_midi_substream_names(struct snd_dice *dice,
diff --git a/sound/firewire/dice/dice-stream.c b/sound/firewire/dice/dice-stream.c
index 4c677c8546c7..d5ffe7c82993 100644
--- a/sound/firewire/dice/dice-stream.c
+++ b/sound/firewire/dice/dice-stream.c
@@ -677,32 +677,23 @@ static void dice_lock_changed(struct snd_dice *dice)
 
 int snd_dice_stream_lock_try(struct snd_dice *dice)
 {
-	int err;
+	guard(spinlock_irq)(&dice->lock);
 
-	spin_lock_irq(&dice->lock);
-
-	if (dice->dev_lock_count < 0) {
-		err = -EBUSY;
-		goto out;
-	}
+	if (dice->dev_lock_count < 0)
+		return -EBUSY;
 
 	if (dice->dev_lock_count++ == 0)
 		dice_lock_changed(dice);
-	err = 0;
-out:
-	spin_unlock_irq(&dice->lock);
-	return err;
+	return 0;
 }
 
 void snd_dice_stream_lock_release(struct snd_dice *dice)
 {
-	spin_lock_irq(&dice->lock);
+	guard(spinlock_irq)(&dice->lock);
 
 	if (WARN_ON(dice->dev_lock_count <= 0))
-		goto out;
+		return;
 
 	if (--dice->dev_lock_count == 0)
 		dice_lock_changed(dice);
-out:
-	spin_unlock_irq(&dice->lock);
 }
diff --git a/sound/firewire/dice/dice-transaction.c b/sound/firewire/dice/dice-transaction.c
index 92941ef83cd5..a3f7dfa990a4 100644
--- a/sound/firewire/dice/dice-transaction.c
+++ b/sound/firewire/dice/dice-transaction.c
@@ -136,7 +136,6 @@ static void dice_notification(struct fw_card *card, struct fw_request *request,
 {
 	struct snd_dice *dice = callback_data;
 	u32 bits;
-	unsigned long flags;
 
 	if (tcode != TCODE_WRITE_QUADLET_REQUEST) {
 		fw_send_response(card, request, RCODE_TYPE_ERROR);
@@ -149,9 +148,9 @@ static void dice_notification(struct fw_card *card, struct fw_request *request,
 
 	bits = be32_to_cpup(data);
 
-	spin_lock_irqsave(&dice->lock, flags);
-	dice->notification_bits |= bits;
-	spin_unlock_irqrestore(&dice->lock, flags);
+	scoped_guard(spinlock_irqsave, &dice->lock) {
+		dice->notification_bits |= bits;
+	}
 
 	fw_send_response(card, request, RCODE_COMPLETE);
 
-- 
2.50.1

