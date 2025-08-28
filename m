Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BC813126CC
	for <linux-sound@vger.kernel.org>; Thu, 28 Aug 2025 13:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756387728; cv=none; b=qhXWW9WZu3Fuc+vEgmFYrYdD4CbuxnDHjGbCB9n+w4wQQKl0iWrDuANcQc3Pul59znNNkhuH1HZzYbarysrtDE+ybAZPsT8JR/A0Djx0V7Y3qer5Mu6+olWrxDwb1gXZyzAQ0Eni6TX3CFD/uTpYROXsxRCc9Zet6jGaJ9aO9FE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756387728; c=relaxed/simple;
	bh=5J5S8AJaU5x3gl7ljPHkD4c3vpBn3f2xXN9Jy25CLRs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KluYS7VrD37xEVs0Yv2z3E7KlzLKSCd7v0vqUsQ5b6ap4N/OyT8UN5EFbY600nCZ1aHZgH3yiqtx01XnCC0o8DSfItacVD7QwEG8foYGdPF8xF8BJxOP7whb+9XK5tZPFx685uBbOViFzsJaFeS9zJr6MHawPn0S3b6J8IZ66nY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=KlN2CL2P; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=GcLpietX; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=KlN2CL2P; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=GcLpietX; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="KlN2CL2P";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="GcLpietX";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="KlN2CL2P";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="GcLpietX"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 25F4020BF1;
	Thu, 28 Aug 2025 13:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756387691; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v6lYccxddkk4cfpmQVkUvC+JXNtrTSLurryIAj1C5rQ=;
	b=KlN2CL2PzJ9K6avxlhG6KdclFEj1qeFcVcsNnnPkJ/IA7nOwHeu6OD7VkArJ4+tIHn761x
	sqcRD7/M2XcGbELi3NPsAmbvoBx4r+Qqak9tXQbMaTXSMCpxGLgDlz0cNeUcOWtWz3847i
	Puq7HhNix073IMsoNHVTEJ69M+h9GF0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756387691;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v6lYccxddkk4cfpmQVkUvC+JXNtrTSLurryIAj1C5rQ=;
	b=GcLpietXHiJEGk0qGi4S4y97/xt/zhfv6vEd3WbmBJ9S7iX12KI5TuyxJ8AwseA/lDfNP5
	hP3F7wJN8K4f03Cw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756387691; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v6lYccxddkk4cfpmQVkUvC+JXNtrTSLurryIAj1C5rQ=;
	b=KlN2CL2PzJ9K6avxlhG6KdclFEj1qeFcVcsNnnPkJ/IA7nOwHeu6OD7VkArJ4+tIHn761x
	sqcRD7/M2XcGbELi3NPsAmbvoBx4r+Qqak9tXQbMaTXSMCpxGLgDlz0cNeUcOWtWz3847i
	Puq7HhNix073IMsoNHVTEJ69M+h9GF0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756387691;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v6lYccxddkk4cfpmQVkUvC+JXNtrTSLurryIAj1C5rQ=;
	b=GcLpietXHiJEGk0qGi4S4y97/xt/zhfv6vEd3WbmBJ9S7iX12KI5TuyxJ8AwseA/lDfNP5
	hP3F7wJN8K4f03Cw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 025071368B;
	Thu, 28 Aug 2025 13:28:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id eMkFO2pZsGgmDgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 28 Aug 2025 13:28:10 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Clemens Ladisch <clemens@ladisch.de>
Subject: [PATCH v2 11/19] ALSA: firewire: bebob: Use guard() for spin locks
Date: Thu, 28 Aug 2025 15:27:15 +0200
Message-ID: <20250828132802.9032-12-tiwai@suse.de>
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

