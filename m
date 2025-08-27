Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A8E12BFC70
	for <linux-sound@vger.kernel.org>; Wed, 27 Aug 2025 09:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756286460; cv=none; b=aCFCBWMt7plnqhHPV8Bf0AON5mpOcXlM7izD+D/y31X5yx9uK/gPOftRfhbFwP3GHaVeSen5a5wJRTh5b6r47W705URza6PqhsEYdIgqVsmKDPXwzsOcfGHduNg7B0DI0jDWe8Q+F1l/Yj7fuG46A5n7BbbWPWiOrs798Jd5aZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756286460; c=relaxed/simple;
	bh=Oo77QGHRh2Il66KEg/QciNGbbiYW96p50E/Cy+At6F0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cFD0hKUYrTTMlm68q1zyY69RqtC06p+3+qNQsF1KPwk6s9cBpDWJLMl24BVCES9dptpgw8uRcE0U+HRLEOv77G4YClX9Yd7KtwwYEMuExabVBc6mSoBvoearqy8T76+A4ED1sn2czVpFlhro+O5uZgqLBejCymLIZPtP0tYLOWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=hjESXeLJ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=BYRz2B+l; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=hjESXeLJ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=BYRz2B+l; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="hjESXeLJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="BYRz2B+l";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="hjESXeLJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="BYRz2B+l"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 2980F22231;
	Wed, 27 Aug 2025 09:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756286425; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xp87e/KPtOOzfaaVwD+2SdykCAhzUKpUDs506O+aBt8=;
	b=hjESXeLJIPmrjUs32yF4S26K14pIJLPxc+A8UMYf4fn8fcJztst6AEdHdZmMR+boFMZzPt
	UkvBH/feukbmEi+/+JA9FRQHn2wnbcJh03oee+ekV+FN28OHIu3Xa5TjHLyZNZdcc2AsG+
	awAtJZdpW8gLLBgJKgCOZQhSEXj7rFg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756286425;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xp87e/KPtOOzfaaVwD+2SdykCAhzUKpUDs506O+aBt8=;
	b=BYRz2B+lEh+T1unbaJvBvIgjXCvuDEwj0HDx/9HGv6ZKxg+FEaEOk2zNQKaT5nBK0Gu49m
	KWqQ2h4eWRegU1CQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=hjESXeLJ;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=BYRz2B+l
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756286425; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xp87e/KPtOOzfaaVwD+2SdykCAhzUKpUDs506O+aBt8=;
	b=hjESXeLJIPmrjUs32yF4S26K14pIJLPxc+A8UMYf4fn8fcJztst6AEdHdZmMR+boFMZzPt
	UkvBH/feukbmEi+/+JA9FRQHn2wnbcJh03oee+ekV+FN28OHIu3Xa5TjHLyZNZdcc2AsG+
	awAtJZdpW8gLLBgJKgCOZQhSEXj7rFg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756286425;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xp87e/KPtOOzfaaVwD+2SdykCAhzUKpUDs506O+aBt8=;
	b=BYRz2B+lEh+T1unbaJvBvIgjXCvuDEwj0HDx/9HGv6ZKxg+FEaEOk2zNQKaT5nBK0Gu49m
	KWqQ2h4eWRegU1CQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1617513A6A;
	Wed, 27 Aug 2025 09:20:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id GNPTBNnNrmiFEgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 27 Aug 2025 09:20:25 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Clemens Ladisch <clemens@ladisch.de>
Subject: [PATCH 13/19] ALSA: firewire: digi00x: Use guard() for spin locks
Date: Wed, 27 Aug 2025 11:20:07 +0200
Message-ID: <20250827092017.29014-14-tiwai@suse.de>
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
X-Rspamd-Queue-Id: 2980F22231
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

