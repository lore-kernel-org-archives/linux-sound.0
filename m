Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2F5A3FC5A4
	for <linux-sound@vger.kernel.org>; Tue,  9 Jun 2026 11:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781005868; cv=none; b=qFSL+7SHu4EEtlRo7K52zyLyapK8TMZegFmbOVV/Lqv7xMWclxsgeKG7vB3LXD4cR6h0PViehvoG5/Gg8F16ZGowndwaUeAhhR6IkfxT/hxLBZjoQ3vluNIKgByI1bTAfzpxiaDfLznAiW9hDSmbx7T4HePqH9YnaZNBNsHxQrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781005868; c=relaxed/simple;
	bh=F58HwHUI5HruBz0hZAHmKXAPTGejwEi3GYC6P1XftGE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QM/oScAk2U3/fm0obzzVeJzp8smbn6SrQ1nAEAdWnO+4FTIZdNGrvEFucmZ156OvbdllAMFuV5GvmyMqWp4Fv0h7QrQcZLMpsrNWU//3y10AP47mFHp3tzh6Z/o0jY7S4Cv97l46pNbdi1PhW/oyW1ajzcP3C+GfylNlUm1bvCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=aBNRRBWu; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=HMC4yl82; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=aBNRRBWu; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=HMC4yl82; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="aBNRRBWu";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="HMC4yl82";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="aBNRRBWu";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="HMC4yl82"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id F39A16AA23;
	Tue,  9 Jun 2026 11:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1781005865; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=b0VuPTHUhXYEVZr35hc9Y54rengRzVgHFDnsn2kxAmY=;
	b=aBNRRBWuZU2KcCLCg3q6xe/PsHqyFw0pzZ+o5UkNIWGnzaSWJ8lhxx8yMFt5uPQNJb0l0w
	tTAU94WFdUKleom06kwnjkaG/tPKC+vXwL9wtXdxuNs29NltwMWEgSlVCh4V2D5RF/5QpA
	IgQHg45kLYQU3jzxi9Q3cAHaP0Eya3Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1781005865;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=b0VuPTHUhXYEVZr35hc9Y54rengRzVgHFDnsn2kxAmY=;
	b=HMC4yl82nfv4Pr7fq8jxpNp1HkK6mhs6H6C2A55ZaMTw1z8foUB8hvYFp5BeF5msdBskKs
	Z/A6R4we8Gn56oDw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=aBNRRBWu;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=HMC4yl82
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1781005865; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=b0VuPTHUhXYEVZr35hc9Y54rengRzVgHFDnsn2kxAmY=;
	b=aBNRRBWuZU2KcCLCg3q6xe/PsHqyFw0pzZ+o5UkNIWGnzaSWJ8lhxx8yMFt5uPQNJb0l0w
	tTAU94WFdUKleom06kwnjkaG/tPKC+vXwL9wtXdxuNs29NltwMWEgSlVCh4V2D5RF/5QpA
	IgQHg45kLYQU3jzxi9Q3cAHaP0Eya3Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1781005865;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=b0VuPTHUhXYEVZr35hc9Y54rengRzVgHFDnsn2kxAmY=;
	b=HMC4yl82nfv4Pr7fq8jxpNp1HkK6mhs6H6C2A55ZaMTw1z8foUB8hvYFp5BeF5msdBskKs
	Z/A6R4we8Gn56oDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D8AC5779A9;
	Tue,  9 Jun 2026 11:51:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id AIJTNCj+J2rvMQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 09 Jun 2026 11:51:04 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Kyle Zeng <kylebot@openai.com>
Subject: [PATCH 1/3] ALSA: timer: Manage timer object with kref
Date: Tue,  9 Jun 2026 13:50:53 +0200
Message-ID: <20260609115100.806869-2-tiwai@suse.de>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260609115100.806869-1-tiwai@suse.de>
References: <20260609115100.806869-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: F39A16AA23
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Spam-Level: 
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	URIBL_BLOCKED(0.00)[suse.de:dkim,suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_THREE(0.00)[3];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org

So far we've tried to address UAFs in ALSA timer code by applying the
locks at various places, but the fundamental problem is that the timer
object may be released while the belonging timer instance objects are
still present and accessing to it.  This patch is a more proper fix to
address that issue, namely, by refcounting and keeping the timer
object.

The basic implementation is to use kref for the refcount of the timer
object, and take/release the reference at assigning/releasing the
instance, as well as at referring from ioctls or ALSA sequencer code.
The reference from ioctl or ALSA sequencer is abstracted with
snd_timeri_timer auto-cleanup.

Note that this change assumes that the code already took the fix
commit da3039e91d1f ("ALSA: timer: Forcibly close timer instances at
closing"); otherwise the refcount may be unbalanced when the timer is
freed while slave instances are still present.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/timer.h      |   6 +++
 sound/core/seq/seq_timer.c |  11 ++--
 sound/core/timer.c         | 104 +++++++++++++++++++++++++++----------
 sound/core/timer_compat.c  |   5 +-
 4 files changed, 95 insertions(+), 31 deletions(-)

diff --git a/include/sound/timer.h b/include/sound/timer.h
index 83bafe70cf33..e549eab7145b 100644
--- a/include/sound/timer.h
+++ b/include/sound/timer.h
@@ -75,6 +75,7 @@ struct snd_timer {
 	struct list_head ack_list_head;
 	struct list_head sack_list_head; /* slow ack list head */
 	struct work_struct task_work;
+	struct kref kref;
 	int max_instances;	/* upper limit of timer instances */
 	int num_instances;	/* current number of timer instances */
 };
@@ -131,4 +132,9 @@ int snd_timer_pause(struct snd_timer_instance *timeri);
 
 void snd_timer_interrupt(struct snd_timer *timer, unsigned long ticks_left);
 
+struct snd_timer *snd_timeri_timer_get(struct snd_timer_instance *timeri);
+void snd_timeri_timer_put(struct snd_timer *timer);
+
+DEFINE_FREE(snd_timeri_timer, struct snd_timer *, if (_T) snd_timeri_timer_put(_T))
+
 #endif /* __SOUND_TIMER_H */
diff --git a/sound/core/seq/seq_timer.c b/sound/core/seq/seq_timer.c
index 9bef2f792498..4cd7211ccf48 100644
--- a/sound/core/seq/seq_timer.c
+++ b/sound/core/seq/seq_timer.c
@@ -333,10 +333,10 @@ int snd_seq_timer_stop(struct snd_seq_timer *tmr)
 
 static int initialize_timer(struct snd_seq_timer *tmr)
 {
-	struct snd_timer *t;
 	unsigned long freq;
 
-	t = tmr->timeri->timer;
+	struct snd_timer *t __free(snd_timeri_timer) =
+		snd_timeri_timer_get(tmr->timeri);
 	if (!t)
 		return -EINVAL;
 
@@ -456,7 +456,12 @@ void snd_seq_info_timer_read(struct snd_info_entry *entry,
 			ti = tmr->timeri;
 			if (!ti)
 				break;
-			snd_iprintf(buffer, "Timer for queue %i : %s\n", q->queue, ti->timer->name);
+
+			struct snd_timer *t __free(snd_timeri_timer) =
+				snd_timeri_timer_get(ti);
+			snd_iprintf(buffer, "Timer for queue %i : %s\n",
+				    q->queue,
+				    t ? t->name : "DEAD");
 			resolution = snd_timer_resolution(ti) * tmr->ticks;
 			snd_iprintf(buffer, "  Period time : %lu.%09lu\n", resolution / 1000000000, resolution % 1000000000);
 			snd_iprintf(buffer, "  Skew : %u / %u\n", tmr->skew, tmr->skew_base);
diff --git a/sound/core/timer.c b/sound/core/timer.c
index 3d72379e57a8..6d8fc1ee29f5 100644
--- a/sound/core/timer.c
+++ b/sound/core/timer.c
@@ -229,6 +229,44 @@ static void snd_timer_request(struct snd_timer_id *tid)
 
 #endif
 
+/*
+ * refcount management of timer object
+ */
+static void snd_timer_kref_release(struct kref *kref);
+
+static inline void snd_timer_ref_get(struct snd_timer *timer)
+{
+	kref_get(&timer->kref);
+}
+
+static inline void snd_timer_ref_put(struct snd_timer *timer)
+{
+	kref_put(&timer->kref, snd_timer_kref_release);
+}
+
+/*
+ * Return the assigned timer for the instance, NULL if not present;
+ * the caller is responsible to call snd_timeri_timer_put(), or use auto-cleanup
+ */
+struct snd_timer *snd_timeri_timer_get(struct snd_timer_instance *timeri)
+{
+	struct snd_timer *t;
+
+	guard(spinlock_irqsave)(&slave_active_lock);
+	t = timeri->timer;
+	if (!t)
+		return NULL;
+	snd_timer_ref_get(t);
+	return t;
+}
+EXPORT_SYMBOL_GPL(snd_timeri_timer_get);
+
+void snd_timeri_timer_put(struct snd_timer *timer)
+{
+	snd_timer_ref_put(timer);
+}
+EXPORT_SYMBOL_GPL(snd_timeri_timer_put);
+
 /* move the slave if it belongs to the master; return 1 if match */
 static int check_matching_master_slave(struct snd_timer_instance *master,
 				       struct snd_timer_instance *slave)
@@ -240,6 +278,7 @@ static int check_matching_master_slave(struct snd_timer_instance *master,
 		return -EBUSY;
 	list_move_tail(&slave->open_list, &master->slave_list_head);
 	master->timer->num_instances++;
+	snd_timer_ref_get(master->timer);
 	guard(spinlock_irq)(&slave_active_lock);
 	guard(spinlock)(&master->timer->lock);
 	slave->master = master;
@@ -386,6 +425,7 @@ int snd_timer_open(struct snd_timer_instance *timeri,
 	if (snd_timer_has_slave_key(timeri))
 		list_add_tail(&timeri->master_list, &snd_timer_master_list);
 	timer->num_instances++;
+	snd_timer_ref_get(timer);
 	err = snd_timer_check_master(timeri);
 list_added:
 	if (err < 0)
@@ -412,6 +452,7 @@ static void remove_slave_links(struct snd_timer_instance *timeri,
 	list_for_each_entry_safe(slave, tmp, &timeri->slave_list_head, open_list) {
 		list_move_tail(&slave->open_list, &snd_timer_slave_list);
 		timer->num_instances--;
+		snd_timer_ref_put(timer);
 		slave->master = NULL;
 		slave->timer = NULL;
 		list_del_init(&slave->ack_list);
@@ -461,17 +502,16 @@ static void snd_timer_close_locked(struct snd_timer_instance *timeri,
 		remove_slave_links(timeri, timer);
 
 		/* slave doesn't need to release timer resources below */
-		if (timeri->flags & SNDRV_TIMER_IFLG_SLAVE)
-			timer = NULL;
-	}
+		if (!(timeri->flags & SNDRV_TIMER_IFLG_SLAVE)) {
+			if (list_empty(&timer->open_list_head) && timer->hw.close)
+				timer->hw.close(timer);
+			/* release a card refcount for safe disconnection */
+			if (timer->card)
+				*card_devp_to_put = &timer->card->card_dev;
+			module_put(timer->module);
+		}
 
-	if (timer) {
-		if (list_empty(&timer->open_list_head) && timer->hw.close)
-			timer->hw.close(timer);
-		/* release a card refcount for safe disconnection */
-		if (timer->card)
-			*card_devp_to_put = &timer->card->card_dev;
-		module_put(timer->module);
+		snd_timer_ref_put(timer);
 	}
 }
 
@@ -503,12 +543,13 @@ static unsigned long snd_timer_hw_resolution(struct snd_timer *timer)
 
 unsigned long snd_timer_resolution(struct snd_timer_instance *timeri)
 {
-	struct snd_timer * timer;
 	unsigned long ret = 0;
 
 	if (timeri == NULL)
 		return 0;
-	timer = timeri->timer;
+
+	struct snd_timer *timer __free(snd_timeri_timer)
+		= snd_timeri_timer_get(timeri);
 	if (timer) {
 		guard(spinlock_irqsave)(&timer->lock);
 		ret = snd_timer_hw_resolution(timer);
@@ -961,6 +1002,7 @@ int snd_timer_new(struct snd_card *card, char *id, struct snd_timer_id *tid,
 	spin_lock_init(&timer->lock);
 	INIT_WORK(&timer->task_work, snd_timer_work);
 	timer->max_instances = 1000; /* default limit per timer */
+	kref_init(&timer->kref);
 	if (card != NULL) {
 		timer->module = card->module;
 		err = snd_device_new(card, SNDRV_DEV_TIMER, timer, &ops);
@@ -975,6 +1017,15 @@ int snd_timer_new(struct snd_card *card, char *id, struct snd_timer_id *tid,
 }
 EXPORT_SYMBOL(snd_timer_new);
 
+static void snd_timer_kref_release(struct kref *kref)
+{
+	struct snd_timer *timer = container_of(kref, struct snd_timer, kref);
+
+	if (timer->private_free)
+		timer->private_free(timer);
+	kfree(timer);
+}
+
 static int snd_timer_free(struct snd_timer *timer)
 {
 	struct snd_timer_instance *ti, *n;
@@ -982,20 +1033,19 @@ static int snd_timer_free(struct snd_timer *timer)
 	if (!timer)
 		return 0;
 
-	guard(mutex)(&register_mutex);
-	if (! list_empty(&timer->open_list_head)) {
-		list_for_each_entry_safe(ti, n, &timer->open_list_head, open_list) {
-			struct device *card_dev_to_put = NULL;
+	scoped_guard(mutex, &register_mutex) {
+		if (!list_empty(&timer->open_list_head)) {
+			list_for_each_entry_safe(ti, n, &timer->open_list_head, open_list) {
+				struct device *card_dev_to_put = NULL;
 
-			snd_timer_close_locked(ti, &card_dev_to_put);
-			put_device(card_dev_to_put);
+				snd_timer_close_locked(ti, &card_dev_to_put);
+				put_device(card_dev_to_put);
+			}
 		}
+		list_del(&timer->device_list);
 	}
-	list_del(&timer->device_list);
 
-	if (timer->private_free)
-		timer->private_free(timer);
-	kfree(timer);
+	snd_timer_ref_put(timer);
 	return 0;
 }
 
@@ -1778,12 +1828,13 @@ static int snd_timer_user_info(struct file *file,
 			       struct snd_timer_info __user *_info)
 {
 	struct snd_timer_user *tu;
-	struct snd_timer *t;
 
 	tu = file->private_data;
 	if (!tu->timeri)
 		return -EBADFD;
-	t = tu->timeri->timer;
+
+	struct snd_timer *t __free(snd_timeri_timer) =
+		snd_timeri_timer_get(tu->timeri);
 	if (!t)
 		return -EBADFD;
 
@@ -1808,14 +1859,15 @@ static int snd_timer_user_params(struct file *file,
 {
 	struct snd_timer_user *tu;
 	struct snd_timer_params params;
-	struct snd_timer *t;
 	int err;
 
 	guard(mutex)(&register_mutex);
 	tu = file->private_data;
 	if (!tu->timeri)
 		return -EBADFD;
-	t = tu->timeri->timer;
+
+	struct snd_timer *t __free(snd_timeri_timer) =
+		snd_timeri_timer_get(tu->timeri);
 	if (!t)
 		return -EBADFD;
 	if (copy_from_user(&params, _params, sizeof(params)))
diff --git a/sound/core/timer_compat.c b/sound/core/timer_compat.c
index 4ae9eaeb5afb..25ee81c1668b 100644
--- a/sound/core/timer_compat.c
+++ b/sound/core/timer_compat.c
@@ -49,12 +49,13 @@ static int snd_timer_user_info_compat(struct file *file,
 {
 	struct snd_timer_user *tu;
 	struct snd_timer_info32 info;
-	struct snd_timer *t;
 
 	tu = file->private_data;
 	if (!tu->timeri)
 		return -EBADFD;
-	t = tu->timeri->timer;
+
+	struct snd_timer *t __free(snd_timeri_timer) =
+		snd_timeri_timer_get(tu->timeri);
 	if (!t)
 		return -EBADFD;
 	memset(&info, 0, sizeof(info));
-- 
2.54.0

