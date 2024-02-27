Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EF4B130E3B
	for <linux-sound@vger.kernel.org>; Tue, 27 Feb 2024 08:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709024001; cv=none; b=ITFmmXv0qPihz/gU4xdxyHEibukBZHsdwYmyoS7TSyYunovxeT4Gi67fvlrFq7mcki/Ojf6gPUf6+V4orJBn/SuUE2CKl0MXTxpfGGMdVT4iaWiu0EJi4ld+4S5SJ6Thw8+PG4prR3Iuutqyi+gs4R0WvdH2wGIig3q87LKlOAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709024001; c=relaxed/simple;
	bh=nqF3MgF0quaF7Dwn8to1qdh0v7Y/0Rpa6RoQ/SDyhPs=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=J2uUIn/L2yZ5Bi+DB0TqsV5AX8zE7zih1j6Anf1HBqBP9mY+d2os92PpZwwhLHDKHM3vTCIdwUwbLWBoqqpixwHIWO9HK4Je3qvG1Ihgt0ddyJg4xL3Q5B6oMJMxONqHxiSJF36n/g4kYH4LeK8w8kerl8TS1LmkPFmysnRvXbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=SHOs3PZr; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=OQCV7ed7; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=SHOs3PZr; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=OQCV7ed7; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="SHOs3PZr";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="OQCV7ed7";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="SHOs3PZr";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="OQCV7ed7"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 46B741FD39;
	Tue, 27 Feb 2024 08:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1709023996; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tqI1vpoeCqxFDS7hL0dw+rup0siLyS/o3TCYvmw55W8=;
	b=SHOs3PZr3TyewG4+XIqMFrFalRhJAhGf8xSGoKyfnDREPXFZ9tDmJdqGIy2pDB5cIRWzol
	2MzfSzHOLbuqmVv/+SFtTl4KMAsu/4RyJnAKefbKZbVE1fN3ZChapXEWwVBi+4BUoOb8Qc
	GreXvELpTD/RP5ANxD0XE0m3QQnnWYg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1709023996;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tqI1vpoeCqxFDS7hL0dw+rup0siLyS/o3TCYvmw55W8=;
	b=OQCV7ed7YFo5xH9TUdjSB7RWYC57TKTw9vHXhtF8qHBeURm64NkyZq0dZwTnrzFzm7EIfR
	AlJXiTdinBXMnPDA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1709023996; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tqI1vpoeCqxFDS7hL0dw+rup0siLyS/o3TCYvmw55W8=;
	b=SHOs3PZr3TyewG4+XIqMFrFalRhJAhGf8xSGoKyfnDREPXFZ9tDmJdqGIy2pDB5cIRWzol
	2MzfSzHOLbuqmVv/+SFtTl4KMAsu/4RyJnAKefbKZbVE1fN3ZChapXEWwVBi+4BUoOb8Qc
	GreXvELpTD/RP5ANxD0XE0m3QQnnWYg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1709023996;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tqI1vpoeCqxFDS7hL0dw+rup0siLyS/o3TCYvmw55W8=;
	b=OQCV7ed7YFo5xH9TUdjSB7RWYC57TKTw9vHXhtF8qHBeURm64NkyZq0dZwTnrzFzm7EIfR
	AlJXiTdinBXMnPDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2D2B213A58;
	Tue, 27 Feb 2024 08:53:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id OHnRCfyi3WWeaQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 27 Feb 2024 08:53:16 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH v3 16/24] ALSA: seq: timer: Use guard() for locking
Date: Tue, 27 Feb 2024 09:52:58 +0100
Message-Id: <20240227085306.9764-17-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240227085306.9764-1-tiwai@suse.de>
References: <20240227085306.9764-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: ***
X-Spam-Score: 3.50
X-Spamd-Result: default: False [3.50 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 TO_DN_NONE(0.00)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 RCPT_COUNT_ONE(0.00)[1];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email];
	 NEURAL_SPAM_SHORT(2.60)[0.866];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-3.00)[100.00%]
X-Spam-Flag: NO

We can simplify the code gracefully with new guard() macro and co for
automatic cleanup of locks.

Only the code refactoring, and no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/seq/seq_timer.c | 163 +++++++++++++------------------------
 1 file changed, 58 insertions(+), 105 deletions(-)

diff --git a/sound/core/seq/seq_timer.c b/sound/core/seq/seq_timer.c
index 9863be6fd43e..ad2b97e2762d 100644
--- a/sound/core/seq/seq_timer.c
+++ b/sound/core/seq/seq_timer.c
@@ -75,9 +75,7 @@ void snd_seq_timer_delete(struct snd_seq_timer **tmr)
 
 void snd_seq_timer_defaults(struct snd_seq_timer * tmr)
 {
-	unsigned long flags;
-
-	spin_lock_irqsave(&tmr->lock, flags);
+	guard(spinlock_irqsave)(&tmr->lock);
 	/* setup defaults */
 	tmr->ppq = 96;		/* 96 PPQ */
 	tmr->tempo = 500000;	/* 120 BPM */
@@ -93,7 +91,6 @@ void snd_seq_timer_defaults(struct snd_seq_timer * tmr)
 	tmr->preferred_resolution = seq_default_timer_resolution;
 
 	tmr->skew = tmr->skew_base = SKEW_BASE;
-	spin_unlock_irqrestore(&tmr->lock, flags);
 }
 
 static void seq_timer_reset(struct snd_seq_timer *tmr)
@@ -108,11 +105,8 @@ static void seq_timer_reset(struct snd_seq_timer *tmr)
 
 void snd_seq_timer_reset(struct snd_seq_timer *tmr)
 {
-	unsigned long flags;
-
-	spin_lock_irqsave(&tmr->lock, flags);
+	guard(spinlock_irqsave)(&tmr->lock);
 	seq_timer_reset(tmr);
-	spin_unlock_irqrestore(&tmr->lock, flags);
 }
 
 
@@ -121,7 +115,6 @@ static void snd_seq_timer_interrupt(struct snd_timer_instance *timeri,
 				    unsigned long resolution,
 				    unsigned long ticks)
 {
-	unsigned long flags;
 	struct snd_seq_queue *q = timeri->callback_data;
 	struct snd_seq_timer *tmr;
 
@@ -130,30 +123,28 @@ static void snd_seq_timer_interrupt(struct snd_timer_instance *timeri,
 	tmr = q->timer;
 	if (tmr == NULL)
 		return;
-	spin_lock_irqsave(&tmr->lock, flags);
-	if (!tmr->running) {
-		spin_unlock_irqrestore(&tmr->lock, flags);
-		return;
+
+	scoped_guard(spinlock_irqsave, &tmr->lock) {
+		if (!tmr->running)
+			return;
+
+		resolution *= ticks;
+		if (tmr->skew != tmr->skew_base) {
+			/* FIXME: assuming skew_base = 0x10000 */
+			resolution = (resolution >> 16) * tmr->skew +
+				(((resolution & 0xffff) * tmr->skew) >> 16);
+		}
+
+		/* update timer */
+		snd_seq_inc_time_nsec(&tmr->cur_time, resolution);
+
+		/* calculate current tick */
+		snd_seq_timer_update_tick(&tmr->tick, resolution);
+
+		/* register actual time of this timer update */
+		ktime_get_ts64(&tmr->last_update);
 	}
 
-	resolution *= ticks;
-	if (tmr->skew != tmr->skew_base) {
-		/* FIXME: assuming skew_base = 0x10000 */
-		resolution = (resolution >> 16) * tmr->skew +
-			(((resolution & 0xffff) * tmr->skew) >> 16);
-	}
-
-	/* update timer */
-	snd_seq_inc_time_nsec(&tmr->cur_time, resolution);
-
-	/* calculate current tick */
-	snd_seq_timer_update_tick(&tmr->tick, resolution);
-
-	/* register actual time of this timer update */
-	ktime_get_ts64(&tmr->last_update);
-
-	spin_unlock_irqrestore(&tmr->lock, flags);
-
 	/* check queues and dispatch events */
 	snd_seq_check_queue(q, 1, 0);
 }
@@ -161,18 +152,15 @@ static void snd_seq_timer_interrupt(struct snd_timer_instance *timeri,
 /* set current tempo */
 int snd_seq_timer_set_tempo(struct snd_seq_timer * tmr, int tempo)
 {
-	unsigned long flags;
-
 	if (snd_BUG_ON(!tmr))
 		return -EINVAL;
 	if (tempo <= 0)
 		return -EINVAL;
-	spin_lock_irqsave(&tmr->lock, flags);
+	guard(spinlock_irqsave)(&tmr->lock);
 	if ((unsigned int)tempo != tmr->tempo) {
 		tmr->tempo = tempo;
 		snd_seq_timer_set_tick_resolution(tmr);
 	}
-	spin_unlock_irqrestore(&tmr->lock, flags);
 	return 0;
 }
 
@@ -180,17 +168,15 @@ int snd_seq_timer_set_tempo(struct snd_seq_timer * tmr, int tempo)
 int snd_seq_timer_set_tempo_ppq(struct snd_seq_timer *tmr, int tempo, int ppq)
 {
 	int changed;
-	unsigned long flags;
 
 	if (snd_BUG_ON(!tmr))
 		return -EINVAL;
 	if (tempo <= 0 || ppq <= 0)
 		return -EINVAL;
-	spin_lock_irqsave(&tmr->lock, flags);
+	guard(spinlock_irqsave)(&tmr->lock);
 	if (tmr->running && (ppq != tmr->ppq)) {
 		/* refuse to change ppq on running timers */
 		/* because it will upset the song position (ticks) */
-		spin_unlock_irqrestore(&tmr->lock, flags);
 		pr_debug("ALSA: seq: cannot change ppq of a running timer\n");
 		return -EBUSY;
 	}
@@ -199,7 +185,6 @@ int snd_seq_timer_set_tempo_ppq(struct snd_seq_timer *tmr, int tempo, int ppq)
 	tmr->ppq = ppq;
 	if (changed)
 		snd_seq_timer_set_tick_resolution(tmr);
-	spin_unlock_irqrestore(&tmr->lock, flags);
 	return 0;
 }
 
@@ -207,15 +192,12 @@ int snd_seq_timer_set_tempo_ppq(struct snd_seq_timer *tmr, int tempo, int ppq)
 int snd_seq_timer_set_position_tick(struct snd_seq_timer *tmr,
 				    snd_seq_tick_time_t position)
 {
-	unsigned long flags;
-
 	if (snd_BUG_ON(!tmr))
 		return -EINVAL;
 
-	spin_lock_irqsave(&tmr->lock, flags);
+	guard(spinlock_irqsave)(&tmr->lock);
 	tmr->tick.cur_tick = position;
 	tmr->tick.fraction = 0;
-	spin_unlock_irqrestore(&tmr->lock, flags);
 	return 0;
 }
 
@@ -223,15 +205,12 @@ int snd_seq_timer_set_position_tick(struct snd_seq_timer *tmr,
 int snd_seq_timer_set_position_time(struct snd_seq_timer *tmr,
 				    snd_seq_real_time_t position)
 {
-	unsigned long flags;
-
 	if (snd_BUG_ON(!tmr))
 		return -EINVAL;
 
 	snd_seq_sanity_real_time(&position);
-	spin_lock_irqsave(&tmr->lock, flags);
+	guard(spinlock_irqsave)(&tmr->lock);
 	tmr->cur_time = position;
-	spin_unlock_irqrestore(&tmr->lock, flags);
 	return 0;
 }
 
@@ -239,8 +218,6 @@ int snd_seq_timer_set_position_time(struct snd_seq_timer *tmr,
 int snd_seq_timer_set_skew(struct snd_seq_timer *tmr, unsigned int skew,
 			   unsigned int base)
 {
-	unsigned long flags;
-
 	if (snd_BUG_ON(!tmr))
 		return -EINVAL;
 
@@ -249,9 +226,8 @@ int snd_seq_timer_set_skew(struct snd_seq_timer *tmr, unsigned int skew,
 		pr_debug("ALSA: seq: invalid skew base 0x%x\n", base);
 		return -EINVAL;
 	}
-	spin_lock_irqsave(&tmr->lock, flags);
+	guard(spinlock_irqsave)(&tmr->lock);
 	tmr->skew = skew;
-	spin_unlock_irqrestore(&tmr->lock, flags);
 	return 0;
 }
 
@@ -296,12 +272,12 @@ int snd_seq_timer_open(struct snd_seq_queue *q)
 		snd_timer_instance_free(t);
 		return err;
 	}
-	spin_lock_irq(&tmr->lock);
-	if (tmr->timeri)
-		err = -EBUSY;
-	else
-		tmr->timeri = t;
-	spin_unlock_irq(&tmr->lock);
+	scoped_guard(spinlock_irq, &tmr->lock) {
+		if (tmr->timeri)
+			err = -EBUSY;
+		else
+			tmr->timeri = t;
+	}
 	if (err < 0) {
 		snd_timer_close(t);
 		snd_timer_instance_free(t);
@@ -318,10 +294,10 @@ int snd_seq_timer_close(struct snd_seq_queue *q)
 	tmr = q->timer;
 	if (snd_BUG_ON(!tmr))
 		return -EINVAL;
-	spin_lock_irq(&tmr->lock);
-	t = tmr->timeri;
-	tmr->timeri = NULL;
-	spin_unlock_irq(&tmr->lock);
+	scoped_guard(spinlock_irq, &tmr->lock) {
+		t = tmr->timeri;
+		tmr->timeri = NULL;
+	}
 	if (t) {
 		snd_timer_close(t);
 		snd_timer_instance_free(t);
@@ -342,13 +318,8 @@ static int seq_timer_stop(struct snd_seq_timer *tmr)
 
 int snd_seq_timer_stop(struct snd_seq_timer *tmr)
 {
-	unsigned long flags;
-	int err;
-
-	spin_lock_irqsave(&tmr->lock, flags);
-	err = seq_timer_stop(tmr);
-	spin_unlock_irqrestore(&tmr->lock, flags);
-	return err;
+	guard(spinlock_irqsave)(&tmr->lock);
+	return seq_timer_stop(tmr);
 }
 
 static int initialize_timer(struct snd_seq_timer *tmr)
@@ -398,13 +369,8 @@ static int seq_timer_start(struct snd_seq_timer *tmr)
 
 int snd_seq_timer_start(struct snd_seq_timer *tmr)
 {
-	unsigned long flags;
-	int err;
-
-	spin_lock_irqsave(&tmr->lock, flags);
-	err = seq_timer_start(tmr);
-	spin_unlock_irqrestore(&tmr->lock, flags);
-	return err;
+	guard(spinlock_irqsave)(&tmr->lock);
+	return seq_timer_start(tmr);
 }
 
 static int seq_timer_continue(struct snd_seq_timer *tmr)
@@ -426,13 +392,8 @@ static int seq_timer_continue(struct snd_seq_timer *tmr)
 
 int snd_seq_timer_continue(struct snd_seq_timer *tmr)
 {
-	unsigned long flags;
-	int err;
-
-	spin_lock_irqsave(&tmr->lock, flags);
-	err = seq_timer_continue(tmr);
-	spin_unlock_irqrestore(&tmr->lock, flags);
-	return err;
+	guard(spinlock_irqsave)(&tmr->lock);
+	return seq_timer_continue(tmr);
 }
 
 /* return current 'real' time. use timeofday() to get better granularity. */
@@ -440,9 +401,8 @@ snd_seq_real_time_t snd_seq_timer_get_cur_time(struct snd_seq_timer *tmr,
 					       bool adjust_ktime)
 {
 	snd_seq_real_time_t cur_time;
-	unsigned long flags;
 
-	spin_lock_irqsave(&tmr->lock, flags);
+	guard(spinlock_irqsave)(&tmr->lock);
 	cur_time = tmr->cur_time;
 	if (adjust_ktime && tmr->running) {
 		struct timespec64 tm;
@@ -453,7 +413,6 @@ snd_seq_real_time_t snd_seq_timer_get_cur_time(struct snd_seq_timer *tmr,
 		cur_time.tv_sec += tm.tv_sec;
 		snd_seq_sanity_real_time(&cur_time);
 	}
-	spin_unlock_irqrestore(&tmr->lock, flags);
 	return cur_time;	
 }
 
@@ -461,13 +420,8 @@ snd_seq_real_time_t snd_seq_timer_get_cur_time(struct snd_seq_timer *tmr,
  high PPQ values) */
 snd_seq_tick_time_t snd_seq_timer_get_cur_tick(struct snd_seq_timer *tmr)
 {
-	snd_seq_tick_time_t cur_tick;
-	unsigned long flags;
-
-	spin_lock_irqsave(&tmr->lock, flags);
-	cur_tick = tmr->tick.cur_tick;
-	spin_unlock_irqrestore(&tmr->lock, flags);
-	return cur_tick;
+	guard(spinlock_irqsave)(&tmr->lock);
+	return tmr->tick.cur_tick;
 }
 
 
@@ -486,19 +440,18 @@ void snd_seq_info_timer_read(struct snd_info_entry *entry,
 		q = queueptr(idx);
 		if (q == NULL)
 			continue;
-		mutex_lock(&q->timer_mutex);
-		tmr = q->timer;
-		if (!tmr)
-			goto unlock;
-		ti = tmr->timeri;
-		if (!ti)
-			goto unlock;
-		snd_iprintf(buffer, "Timer for queue %i : %s\n", q->queue, ti->timer->name);
-		resolution = snd_timer_resolution(ti) * tmr->ticks;
-		snd_iprintf(buffer, "  Period time : %lu.%09lu\n", resolution / 1000000000, resolution % 1000000000);
-		snd_iprintf(buffer, "  Skew : %u / %u\n", tmr->skew, tmr->skew_base);
-unlock:
-		mutex_unlock(&q->timer_mutex);
+		scoped_guard(mutex, &q->timer_mutex) {
+			tmr = q->timer;
+			if (!tmr)
+				break;
+			ti = tmr->timeri;
+			if (!ti)
+				break;
+			snd_iprintf(buffer, "Timer for queue %i : %s\n", q->queue, ti->timer->name);
+			resolution = snd_timer_resolution(ti) * tmr->ticks;
+			snd_iprintf(buffer, "  Period time : %lu.%09lu\n", resolution / 1000000000, resolution % 1000000000);
+			snd_iprintf(buffer, "  Skew : %u / %u\n", tmr->skew, tmr->skew_base);
+		}
 		queuefree(q);
  	}
 }
-- 
2.35.3

