Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A615A13DBB6
	for <linux-sound@vger.kernel.org>; Fri, 23 Feb 2024 17:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708710620; cv=none; b=Vo0a6FYDsknx/1Qkpt6ix9I3rel86EH6BKTVsRNZuvQ53nKClC68HKG14AOhD8EJFSzBozDHgmyAWb4+ePpwTgC53aGtpYtghTJDyKBc33yEryXM6cZ0iJZP5GZxPcPGnkrqwGN6Aj1+jxuXbyw7PPbY20AKzISNZ4tdGcJ3p4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708710620; c=relaxed/simple;
	bh=nqF3MgF0quaF7Dwn8to1qdh0v7Y/0Rpa6RoQ/SDyhPs=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HFKfetk2QMZhoEzsPebn2891A8zd37Qtf8EBSgrp5DAnz2h5eLsujm3Yb1elVsuIXpP9JY3PpRG7z1VoUHCC5n5N48/f8F5ONC5Hlex7PeS98ux9n0tFA4X6v+OzQu+hdYWOZHs6G9Uy8402YK9Jhsw/vZvdIgIRuzyPIwcXAPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=sn/nj3zO; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=SKbSgRrH; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=sn/nj3zO; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=SKbSgRrH; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="sn/nj3zO";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="SKbSgRrH";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="sn/nj3zO";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="SKbSgRrH"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 3F9B0221D3;
	Fri, 23 Feb 2024 17:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1708710613; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tqI1vpoeCqxFDS7hL0dw+rup0siLyS/o3TCYvmw55W8=;
	b=sn/nj3zOOR8Eh4Q1I5+xC7zDZyGYKFYOtxKGCZtb7jgV2vxwqbjeXoNdTimKFo9T/cBBbO
	XfXYIZUUhA/93WbjArY5ucqOYkc2r3ynVsw3kJs+otEAh/bOJYfI83vuCw0vti9jQApaaU
	k6QtAJHDsQYy95IU1KdpJAlhRy2LAVI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708710613;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tqI1vpoeCqxFDS7hL0dw+rup0siLyS/o3TCYvmw55W8=;
	b=SKbSgRrH0qA5j88iqspg66VRaGK6YSAoKXs7P/Ns8HCFkDR0f7Qw+x4QES+VCte/pofGOJ
	ApzhqvXiwkFjcTDg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1708710613; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tqI1vpoeCqxFDS7hL0dw+rup0siLyS/o3TCYvmw55W8=;
	b=sn/nj3zOOR8Eh4Q1I5+xC7zDZyGYKFYOtxKGCZtb7jgV2vxwqbjeXoNdTimKFo9T/cBBbO
	XfXYIZUUhA/93WbjArY5ucqOYkc2r3ynVsw3kJs+otEAh/bOJYfI83vuCw0vti9jQApaaU
	k6QtAJHDsQYy95IU1KdpJAlhRy2LAVI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708710613;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tqI1vpoeCqxFDS7hL0dw+rup0siLyS/o3TCYvmw55W8=;
	b=SKbSgRrH0qA5j88iqspg66VRaGK6YSAoKXs7P/Ns8HCFkDR0f7Qw+x4QES+VCte/pofGOJ
	ApzhqvXiwkFjcTDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 220D913AC7;
	Fri, 23 Feb 2024 17:50:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id yHTLBtXa2GW6RAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 23 Feb 2024 17:50:13 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH v2 16/24] ALSA: seq: timer: Use guard() for locking
Date: Fri, 23 Feb 2024 18:49:53 +0100
Message-Id: <20240223175001.24375-17-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240223175001.24375-1-tiwai@suse.de>
References: <20240223175001.24375-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Bar: /
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="sn/nj3zO";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=SKbSgRrH
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [0.49 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
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
	 DKIM_TRACE(0.00)[suse.de:+];
	 MX_GOOD(-0.01)[];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-3.00)[100.00%]
X-Spam-Score: 0.49
X-Rspamd-Queue-Id: 3F9B0221D3
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

