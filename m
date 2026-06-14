Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43FE33242BC
	for <linux-sound@vger.kernel.org>; Sun, 14 Jun 2026 09:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781428039; cv=none; b=hSrTcN88xhwaHxg4YiXuIm9jiwx3gHkJqp81Akzz3Y2hgbWKWDzmhJ6Ear8/FjTc5iAN8Yv1XV2KYtS/A9Wj8ZLXkDW8YQn+/mMynsY7Rprroi6CL3om/HsRLz3KuXM9iC2nCRnUxkuY/vfgSVYrGzL4DKOUpfgtfIptqtIUqMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781428039; c=relaxed/simple;
	bh=/Da+mkgXif5Byd7YIo/6cbTw2ApGxmwJvpyahoLzWUU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HdYqrQEfz90UmrkAmQPFfKlOMx43z+6EanmAx2B+XhzK1vy3WrB6j3TJ4w0zlsoGh1No0ktmN1WSzUIa9MpUPXd5mPtcf0KlqiPQhWc457Xg3wi0Lcqcqgi64np0Sw60zSTP8kbLeEdAqtVClLhfSnR0xK5+YuhZbALaY7rb3yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=syb+rGMu; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=phk+lOOs; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=syb+rGMu; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=phk+lOOs; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="syb+rGMu";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="phk+lOOs";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="syb+rGMu";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="phk+lOOs"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 847F3759F4;
	Sun, 14 Jun 2026 09:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1781428036; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=9Nj7hizYVfmH/3S3656jNxKIf3o9PTMKl9z97+Ves5o=;
	b=syb+rGMuoZZsMhF2bdBP9cAFIjS4Xnxe20GAjzhvE1exwhAYlu4snKYuY+T7xeQghMhgMU
	lS18j3l+9rnErq3uSj3FSM2zOARyb7q/mLbBwElnA1EL+xQF74saCULYrLIKyLkrvOAPkQ
	+i/ypt71Is1BnlW6X5SZ2TyF40JJ2hY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1781428036;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=9Nj7hizYVfmH/3S3656jNxKIf3o9PTMKl9z97+Ves5o=;
	b=phk+lOOsikzYLr2HvnFbNFRYqsPkGpglM8plJEqfYAkfmi9z118fkGe3bDGwk27qUjPSBI
	T+xyZ95leMShUOCA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1781428036; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=9Nj7hizYVfmH/3S3656jNxKIf3o9PTMKl9z97+Ves5o=;
	b=syb+rGMuoZZsMhF2bdBP9cAFIjS4Xnxe20GAjzhvE1exwhAYlu4snKYuY+T7xeQghMhgMU
	lS18j3l+9rnErq3uSj3FSM2zOARyb7q/mLbBwElnA1EL+xQF74saCULYrLIKyLkrvOAPkQ
	+i/ypt71Is1BnlW6X5SZ2TyF40JJ2hY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1781428036;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=9Nj7hizYVfmH/3S3656jNxKIf3o9PTMKl9z97+Ves5o=;
	b=phk+lOOsikzYLr2HvnFbNFRYqsPkGpglM8plJEqfYAkfmi9z118fkGe3bDGwk27qUjPSBI
	T+xyZ95leMShUOCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5B4B7779A7;
	Sun, 14 Jun 2026 09:07:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id XpdcFERvLmrbawAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 14 Jun 2026 09:07:16 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Kyle Zeng <kylebot@openai.com>
Subject: [PATCH] ALSA: timer: Fix racy timeri->timer changes with rwlock
Date: Sun, 14 Jun 2026 11:07:11 +0200
Message-ID: <20260614090714.773216-1-tiwai@suse.de>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Level: 
X-Spam-Score: -2.80

Although we've covered the races around the timer object assignment
and release for timer instances, there are still races at starting or
stopping the timer instance.  They refer to timeri->timer without
lock, hence they can still trigger UAFs.

For addressing it, this patch changes the existing slave_active_lock
spinlock to timeri_lock rwlock.  It's a global rwlock applied as
read-lock when snd_timer_start() & co are called as well as
snd_timeri_timer_get() is called.  In turn, the places where
timeri->timer is assigned or released are covered by the write-lock.

The patch replaces spinlock_irqsave with spinlock in a couple of
spaces because they are now already protected by timeri_lock, too.

Reported-by: Kyle Zeng <kylebot@openai.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/timer.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/sound/core/timer.c b/sound/core/timer.c
index a3ae5416485e..51c6ac4df9f4 100644
--- a/sound/core/timer.c
+++ b/sound/core/timer.c
@@ -132,8 +132,8 @@ static LIST_HEAD(snd_timer_slave_list);
 /* list of open master instances that can accept slave links */
 static LIST_HEAD(snd_timer_master_list);
 
-/* lock for slave active lists */
-static DEFINE_SPINLOCK(slave_active_lock);
+/* rwlock for timer instance (for trigger actions) */
+static DEFINE_RWLOCK(timeri_lock);
 
 #define MAX_SLAVE_INSTANCES	1000
 static int num_slaves;
@@ -252,7 +252,7 @@ struct snd_timer *snd_timeri_timer_get(struct snd_timer_instance *timeri)
 {
 	struct snd_timer *t;
 
-	guard(spinlock_irqsave)(&slave_active_lock);
+	guard(read_lock_irqsave)(&timeri_lock);
 	t = timeri->timer;
 	if (!t)
 		return NULL;
@@ -279,7 +279,7 @@ static int check_matching_master_slave(struct snd_timer_instance *master,
 	list_move_tail(&slave->open_list, &master->slave_list_head);
 	master->timer->num_instances++;
 	snd_timer_ref_get(master->timer);
-	guard(spinlock_irq)(&slave_active_lock);
+	guard(write_lock_irq)(&timeri_lock);
 	guard(spinlock)(&master->timer->lock);
 	slave->master = master;
 	slave->timer = master->timer;
@@ -446,7 +446,7 @@ static void remove_slave_links(struct snd_timer_instance *timeri,
 {
 	struct snd_timer_instance *slave, *tmp;
 
-	guard(spinlock_irq)(&slave_active_lock);
+	guard(write_lock_irq)(&timeri_lock);
 	guard(spinlock)(&timer->lock);
 	timeri->timer = NULL;
 	list_for_each_entry_safe(slave, tmp, &timeri->slave_list_head, open_list) {
@@ -601,7 +601,7 @@ static int snd_timer_start1(struct snd_timer_instance *timeri,
 	if (!timer)
 		return -EINVAL;
 
-	guard(spinlock_irqsave)(&timer->lock);
+	guard(spinlock)(&timer->lock);
 	if (timeri->flags & SNDRV_TIMER_IFLG_DEAD)
 		return -EINVAL;
 	if (timer->card && timer->card->shutdown)
@@ -649,7 +649,6 @@ static int snd_timer_start1(struct snd_timer_instance *timeri,
 static int snd_timer_start_slave(struct snd_timer_instance *timeri,
 				 bool start)
 {
-	guard(spinlock_irqsave)(&slave_active_lock);
 	if (timeri->flags & SNDRV_TIMER_IFLG_DEAD)
 		return -EINVAL;
 	if (timeri->flags & SNDRV_TIMER_IFLG_RUNNING)
@@ -673,7 +672,7 @@ static int snd_timer_stop1(struct snd_timer_instance *timeri, bool stop)
 	timer = timeri->timer;
 	if (!timer)
 		return -EINVAL;
-	guard(spinlock_irqsave)(&timer->lock);
+	guard(spinlock)(&timer->lock);
 	list_del_init(&timeri->ack_list);
 	list_del_init(&timeri->active_list);
 	if (!(timeri->flags & (SNDRV_TIMER_IFLG_RUNNING |
@@ -712,7 +711,6 @@ static int snd_timer_stop_slave(struct snd_timer_instance *timeri, bool stop)
 {
 	bool running;
 
-	guard(spinlock_irqsave)(&slave_active_lock);
 	running = timeri->flags & SNDRV_TIMER_IFLG_RUNNING;
 	timeri->flags &= ~SNDRV_TIMER_IFLG_RUNNING;
 	if (timeri->timer) {
@@ -733,6 +731,7 @@ int snd_timer_start(struct snd_timer_instance *timeri, unsigned int ticks)
 {
 	if (timeri == NULL || ticks < 1)
 		return -EINVAL;
+	guard(read_lock_irqsave)(&timeri_lock);
 	if (timeri->flags & SNDRV_TIMER_IFLG_SLAVE)
 		return snd_timer_start_slave(timeri, true);
 	else
@@ -747,6 +746,7 @@ EXPORT_SYMBOL(snd_timer_start);
  */
 int snd_timer_stop(struct snd_timer_instance *timeri)
 {
+	guard(read_lock_irqsave)(&timeri_lock);
 	if (timeri->flags & SNDRV_TIMER_IFLG_SLAVE)
 		return snd_timer_stop_slave(timeri, true);
 	else
@@ -763,6 +763,7 @@ int snd_timer_continue(struct snd_timer_instance *timeri)
 	if (!(timeri->flags & SNDRV_TIMER_IFLG_PAUSED))
 		return -EINVAL;
 
+	guard(read_lock_irqsave)(&timeri_lock);
 	if (timeri->flags & SNDRV_TIMER_IFLG_SLAVE)
 		return snd_timer_start_slave(timeri, false);
 	else
@@ -775,6 +776,7 @@ EXPORT_SYMBOL(snd_timer_continue);
  */
 int snd_timer_pause(struct snd_timer_instance * timeri)
 {
+	guard(read_lock_irqsave)(&timeri_lock);
 	if (timeri->flags & SNDRV_TIMER_IFLG_SLAVE)
 		return snd_timer_stop_slave(timeri, false);
 	else
-- 
2.54.0

