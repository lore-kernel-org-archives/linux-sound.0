Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FE9C322757
	for <linux-sound@vger.kernel.org>; Wed, 27 Aug 2025 08:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756281941; cv=none; b=uYTZ3Z22d6p9MWmd2SgqtWpcPkho7dRfoJjfCyZnRM/6aU5Ih5mQpO5UsuK70pE0MNMnBh5Tmk2pzNcHnD1XWsPCa9RkwhUKHpAm2BDbCalqEkOlQpC8x995eImrVxD/l+XjJLBSTO9ahhSJfUaVyrjCTjQcCYZVQAWS/ImIQJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756281941; c=relaxed/simple;
	bh=gdIsJpzSDUsOnnQ7IboJHDzy5Em6kehXoJAlbqU2+PE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YcqvfPv+R5WZ4dKk/xJkQLhBEf2Bq9w/9L/SdZK6/qTbngOk43aMGSSeozfwF4/ecF3kI6THrhhNmpim87g2NVqyElAmI0tddmDtxigntqB3w5lK+Im0TCw/SrQZWb3kXaenB0Ct8SDCAXjLVla6b+atzH0lDvFGhdu+NTLwCg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Uq42u1DM; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=xN0KkiTW; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=yGISstr+; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=DF7TIDau; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Uq42u1DM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="xN0KkiTW";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="yGISstr+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="DF7TIDau"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id F0F2B21F02;
	Wed, 27 Aug 2025 08:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756281924; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TNGn3pGXzfQ1GsvEcjySwH1MQJAQ39pM9LTAAIogh8o=;
	b=Uq42u1DMPdbgqDWiVXK1dLWfUMyKYtkFjTvmvKng7NG52F2YlF8/AEjFKROSMei4MIV/2K
	UXXdEIkyfb9+St4LZ3hjnWVBiqmCyqmznGfO0z0PHtyJGUC72c9r2ps74oicJnlBLEqmyJ
	zN1QO6Rv1LSRq5mpRoR2uXnK2ZYdA4g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756281924;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TNGn3pGXzfQ1GsvEcjySwH1MQJAQ39pM9LTAAIogh8o=;
	b=xN0KkiTW3R63Fw3qxjHJk36U6Ay/3HT5tr+vtvgW1KkfyYCPl1s5foCqKyj623eUawpVzh
	OFq9pkOYVP/dhrCw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756281923; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TNGn3pGXzfQ1GsvEcjySwH1MQJAQ39pM9LTAAIogh8o=;
	b=yGISstr+/QOjnXKjDBvwda260wkDdbjhihSzoLUncgm5V0vjZ5hZPvmA8GnO4fU8Zu4m0P
	g5h750lJ25fcueiB5in/mo8rYiYQwbIY3T0nCTMJwzTL88U3VHWn8Kiq1uShMZaviA6Vyj
	rrHxX9Yk2OHrDP4ZZL2Ac4w8eyRf4Gw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756281923;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TNGn3pGXzfQ1GsvEcjySwH1MQJAQ39pM9LTAAIogh8o=;
	b=DF7TIDaubCUqUEbIMz6UguxEzkRZ8EGqJzazxZSDqDwQwX2UJ7XAIj+/zWg0JR0EYH6R2q
	lPjWs0SN8vwR2oCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D89BA13A31;
	Wed, 27 Aug 2025 08:05:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id OFbAM0O8rmgHdwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 27 Aug 2025 08:05:23 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH v2 06/11] ALSA: seq: Clean up queue locking with auto cleanup
Date: Wed, 27 Aug 2025 10:05:12 +0200
Message-ID: <20250827080520.7544-7-tiwai@suse.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250827080520.7544-1-tiwai@suse.de>
References: <20250827080520.7544-1-tiwai@suse.de>
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
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -2.80

Yet more cleanup with the auto-cleanup macro: now we replace the
queuefree() calls with the magic pointer attribute
__free(snd_seq_queue).

Only code refactoring, and no behavior change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/seq/seq_clientmgr.c | 37 ++++++-----------
 sound/core/seq/seq_queue.c     | 76 ++++++++++------------------------
 sound/core/seq/seq_queue.h     |  2 +
 sound/core/seq/seq_timer.c     |  5 +--
 4 files changed, 39 insertions(+), 81 deletions(-)

diff --git a/sound/core/seq/seq_clientmgr.c b/sound/core/seq/seq_clientmgr.c
index 18424f56251a..38ad5bbd2706 100644
--- a/sound/core/seq/seq_clientmgr.c
+++ b/sound/core/seq/seq_clientmgr.c
@@ -566,7 +566,7 @@ static int bounce_error_event(struct snd_seq_client *client,
 static int update_timestamp_of_queue(struct snd_seq_event *event,
 				     int queue, int real_time)
 {
-	struct snd_seq_queue *q;
+	struct snd_seq_queue *q __free(snd_seq_queue) = NULL;
 
 	q = queueptr(queue);
 	if (! q)
@@ -580,7 +580,6 @@ static int update_timestamp_of_queue(struct snd_seq_event *event,
 		event->time.tick = snd_seq_timer_get_cur_tick(q->timer);
 		event->flags |= SNDRV_SEQ_TIME_STAMP_TICK;
 	}
-	queuefree(q);
 	return 1;
 }
 
@@ -1520,7 +1519,7 @@ static int snd_seq_ioctl_unsubscribe_port(struct snd_seq_client *client,
 static int snd_seq_ioctl_create_queue(struct snd_seq_client *client, void *arg)
 {
 	struct snd_seq_queue_info *info = arg;
-	struct snd_seq_queue *q;
+	struct snd_seq_queue *q __free(snd_seq_queue) = NULL;
 
 	q = snd_seq_queue_alloc(client->number, info->locked, info->flags);
 	if (IS_ERR(q))
@@ -1534,7 +1533,6 @@ static int snd_seq_ioctl_create_queue(struct snd_seq_client *client, void *arg)
 	if (!info->name[0])
 		snprintf(info->name, sizeof(info->name), "Queue-%d", q->queue);
 	strscpy(q->name, info->name, sizeof(q->name));
-	snd_use_lock_free(&q->use_lock);
 
 	return 0;
 }
@@ -1552,7 +1550,7 @@ static int snd_seq_ioctl_get_queue_info(struct snd_seq_client *client,
 					void *arg)
 {
 	struct snd_seq_queue_info *info = arg;
-	struct snd_seq_queue *q;
+	struct snd_seq_queue *q __free(snd_seq_queue) = NULL;
 
 	q = queueptr(info->queue);
 	if (q == NULL)
@@ -1563,7 +1561,6 @@ static int snd_seq_ioctl_get_queue_info(struct snd_seq_client *client,
 	info->owner = q->owner;
 	info->locked = q->locked;
 	strscpy(info->name, q->name, sizeof(info->name));
-	queuefree(q);
 
 	return 0;
 }
@@ -1573,7 +1570,7 @@ static int snd_seq_ioctl_set_queue_info(struct snd_seq_client *client,
 					void *arg)
 {
 	struct snd_seq_queue_info *info = arg;
-	struct snd_seq_queue *q;
+	struct snd_seq_queue *q __free(snd_seq_queue) = NULL;
 
 	if (info->owner != client->number)
 		return -EINVAL;
@@ -1591,12 +1588,9 @@ static int snd_seq_ioctl_set_queue_info(struct snd_seq_client *client,
 	q = queueptr(info->queue);
 	if (! q)
 		return -EINVAL;
-	if (q->owner != client->number) {
-		queuefree(q);
+	if (q->owner != client->number)
 		return -EPERM;
-	}
 	strscpy(q->name, info->name, sizeof(q->name));
-	queuefree(q);
 
 	return 0;
 }
@@ -1606,7 +1600,7 @@ static int snd_seq_ioctl_get_named_queue(struct snd_seq_client *client,
 					 void *arg)
 {
 	struct snd_seq_queue_info *info = arg;
-	struct snd_seq_queue *q;
+	struct snd_seq_queue *q __free(snd_seq_queue) = NULL;
 
 	q = snd_seq_queue_find_name(info->name);
 	if (q == NULL)
@@ -1614,7 +1608,6 @@ static int snd_seq_ioctl_get_named_queue(struct snd_seq_client *client,
 	info->queue = q->queue;
 	info->owner = q->owner;
 	info->locked = q->locked;
-	queuefree(q);
 
 	return 0;
 }
@@ -1624,7 +1617,7 @@ static int snd_seq_ioctl_get_queue_status(struct snd_seq_client *client,
 					  void *arg)
 {
 	struct snd_seq_queue_status *status = arg;
-	struct snd_seq_queue *queue;
+	struct snd_seq_queue *queue __free(snd_seq_queue) = NULL;
 	struct snd_seq_timer *tmr;
 
 	queue = queueptr(status->queue);
@@ -1642,7 +1635,6 @@ static int snd_seq_ioctl_get_queue_status(struct snd_seq_client *client,
 	status->running = tmr->running;
 
 	status->flags = queue->flags;
-	queuefree(queue);
 
 	return 0;
 }
@@ -1653,7 +1645,7 @@ static int snd_seq_ioctl_get_queue_tempo(struct snd_seq_client *client,
 					 void *arg)
 {
 	struct snd_seq_queue_tempo *tempo = arg;
-	struct snd_seq_queue *queue;
+	struct snd_seq_queue *queue __free(snd_seq_queue) = NULL;
 	struct snd_seq_timer *tmr;
 
 	queue = queueptr(tempo->queue);
@@ -1670,7 +1662,6 @@ static int snd_seq_ioctl_get_queue_tempo(struct snd_seq_client *client,
 	tempo->skew_base = tmr->skew_base;
 	if (client->user_pversion >= SNDRV_PROTOCOL_VERSION(1, 0, 4))
 		tempo->tempo_base = tmr->tempo_base;
-	queuefree(queue);
 
 	return 0;
 }
@@ -1703,14 +1694,14 @@ static int snd_seq_ioctl_get_queue_timer(struct snd_seq_client *client,
 					 void *arg)
 {
 	struct snd_seq_queue_timer *timer = arg;
-	struct snd_seq_queue *queue;
+	struct snd_seq_queue *queue __free(snd_seq_queue) = NULL;
 	struct snd_seq_timer *tmr;
 
 	queue = queueptr(timer->queue);
 	if (queue == NULL)
 		return -EINVAL;
 
-	mutex_lock(&queue->timer_mutex);
+	guard(mutex)(&queue->timer_mutex);
 	tmr = queue->timer;
 	memset(timer, 0, sizeof(*timer));
 	timer->queue = queue->queue;
@@ -1720,8 +1711,6 @@ static int snd_seq_ioctl_get_queue_timer(struct snd_seq_client *client,
 		timer->u.alsa.id = tmr->alsa_id;
 		timer->u.alsa.resolution = tmr->preferred_resolution;
 	}
-	mutex_unlock(&queue->timer_mutex);
-	queuefree(queue);
 	
 	return 0;
 }
@@ -1738,13 +1727,13 @@ static int snd_seq_ioctl_set_queue_timer(struct snd_seq_client *client,
 		return -EINVAL;
 
 	if (snd_seq_queue_check_access(timer->queue, client->number)) {
-		struct snd_seq_queue *q;
+		struct snd_seq_queue *q __free(snd_seq_queue) = NULL;
 		struct snd_seq_timer *tmr;
 
 		q = queueptr(timer->queue);
 		if (q == NULL)
 			return -ENXIO;
-		mutex_lock(&q->timer_mutex);
+		guard(mutex)(&q->timer_mutex);
 		tmr = q->timer;
 		snd_seq_queue_timer_close(timer->queue);
 		tmr->type = timer->type;
@@ -1753,8 +1742,6 @@ static int snd_seq_ioctl_set_queue_timer(struct snd_seq_client *client,
 			tmr->preferred_resolution = timer->u.alsa.resolution;
 		}
 		result = snd_seq_queue_timer_open(timer->queue);
-		mutex_unlock(&q->timer_mutex);
-		queuefree(q);
 	} else {
 		return -EPERM;
 	}	
diff --git a/sound/core/seq/seq_queue.c b/sound/core/seq/seq_queue.c
index 10add922323d..f5c0e401c8ae 100644
--- a/sound/core/seq/seq_queue.c
+++ b/sound/core/seq/seq_queue.c
@@ -209,14 +209,13 @@ struct snd_seq_queue *queueptr(int queueid)
 struct snd_seq_queue *snd_seq_queue_find_name(char *name)
 {
 	int i;
-	struct snd_seq_queue *q;
 
 	for (i = 0; i < SNDRV_SEQ_MAX_QUEUES; i++) {
+		struct snd_seq_queue *q __free(snd_seq_queue) = NULL;
 		q = queueptr(i);
 		if (q) {
 			if (strncmp(q->name, name, sizeof(q->name)) == 0)
-				return q;
-			queuefree(q);
+				return no_free_ptr(q);
 		}
 	}
 	return NULL;
@@ -286,7 +285,7 @@ void snd_seq_check_queue(struct snd_seq_queue *q, int atomic, int hop)
 int snd_seq_enqueue_event(struct snd_seq_event_cell *cell, int atomic, int hop)
 {
 	int dest, err;
-	struct snd_seq_queue *q;
+	struct snd_seq_queue *q __free(snd_seq_queue) = NULL;
 
 	if (snd_BUG_ON(!cell))
 		return -EINVAL;
@@ -321,16 +320,12 @@ int snd_seq_enqueue_event(struct snd_seq_event_cell *cell, int atomic, int hop)
 		break;
 	}
 
-	if (err < 0) {
-		queuefree(q); /* unlock */
+	if (err < 0)
 		return err;
-	}
 
 	/* trigger dispatching */
 	snd_seq_check_queue(q, atomic, hop);
 
-	queuefree(q); /* unlock */
-
 	return 0;
 }
 
@@ -366,15 +361,12 @@ static inline void queue_access_unlock(struct snd_seq_queue *q)
 /* exported - only checking permission */
 int snd_seq_queue_check_access(int queueid, int client)
 {
-	struct snd_seq_queue *q = queueptr(queueid);
-	int access_ok;
+	struct snd_seq_queue *q __free(snd_seq_queue) = queueptr(queueid);
 
 	if (! q)
 		return 0;
-	scoped_guard(spinlock_irqsave, &q->owner_lock)
-		access_ok = check_access(q, client);
-	queuefree(q);
-	return access_ok;
+	guard(spinlock_irqsave)(&q->owner_lock);
+	return check_access(q, client);
 }
 
 /*----------------------------------------------------------------*/
@@ -384,22 +376,19 @@ int snd_seq_queue_check_access(int queueid, int client)
  */
 int snd_seq_queue_set_owner(int queueid, int client, int locked)
 {
-	struct snd_seq_queue *q = queueptr(queueid);
+	struct snd_seq_queue *q __free(snd_seq_queue) = queueptr(queueid);
 
 	if (q == NULL)
 		return -EINVAL;
 
-	if (! queue_access_lock(q, client)) {
-		queuefree(q);
+	if (!queue_access_lock(q, client))
 		return -EPERM;
-	}
 
 	scoped_guard(spinlock_irqsave, &q->owner_lock) {
 		q->locked = locked ? 1 : 0;
 		q->owner = client;
 	}
 	queue_access_unlock(q);
-	queuefree(q);
 
 	return 0;
 }
@@ -414,7 +403,7 @@ int snd_seq_queue_set_owner(int queueid, int client, int locked)
 int snd_seq_queue_timer_open(int queueid)
 {
 	int result = 0;
-	struct snd_seq_queue *queue;
+	struct snd_seq_queue *queue __free(snd_seq_queue) = NULL;
 	struct snd_seq_timer *tmr;
 
 	queue = queueptr(queueid);
@@ -426,7 +415,6 @@ int snd_seq_queue_timer_open(int queueid)
 		snd_seq_timer_defaults(tmr);
 		result = snd_seq_timer_open(queue);
 	}
-	queuefree(queue);
 	return result;
 }
 
@@ -435,14 +423,13 @@ int snd_seq_queue_timer_open(int queueid)
  */
 int snd_seq_queue_timer_close(int queueid)
 {
-	struct snd_seq_queue *queue;
+	struct snd_seq_queue *queue __free(snd_seq_queue) = NULL;
 	int result = 0;
 
 	queue = queueptr(queueid);
 	if (queue == NULL)
 		return -EINVAL;
 	snd_seq_timer_close(queue);
-	queuefree(queue);
 	return result;
 }
 
@@ -450,15 +437,13 @@ int snd_seq_queue_timer_close(int queueid)
 int snd_seq_queue_timer_set_tempo(int queueid, int client,
 				  struct snd_seq_queue_tempo *info)
 {
-	struct snd_seq_queue *q = queueptr(queueid);
+	struct snd_seq_queue *q __free(snd_seq_queue) = queueptr(queueid);
 	int result;
 
 	if (q == NULL)
 		return -EINVAL;
-	if (! queue_access_lock(q, client)) {
-		queuefree(q);
+	if (!queue_access_lock(q, client))
 		return -EPERM;
-	}
 
 	result = snd_seq_timer_set_tempo_ppq(q->timer, info->tempo, info->ppq,
 					     info->tempo_base);
@@ -466,7 +451,6 @@ int snd_seq_queue_timer_set_tempo(int queueid, int client,
 		result = snd_seq_timer_set_skew(q->timer, info->skew_value,
 						info->skew_base);
 	queue_access_unlock(q);
-	queuefree(q);
 	return result;
 }
 
@@ -495,15 +479,13 @@ static void queue_use(struct snd_seq_queue *queue, int client, int use)
  */
 int snd_seq_queue_use(int queueid, int client, int use)
 {
-	struct snd_seq_queue *queue;
+	struct snd_seq_queue *queue __free(snd_seq_queue) = NULL;
 
 	queue = queueptr(queueid);
 	if (queue == NULL)
 		return -EINVAL;
-	mutex_lock(&queue->timer_mutex);
+	guard(mutex)(&queue->timer_mutex);
 	queue_use(queue, client, use);
-	mutex_unlock(&queue->timer_mutex);
-	queuefree(queue);
 	return 0;
 }
 
@@ -514,15 +496,12 @@ int snd_seq_queue_use(int queueid, int client, int use)
  */
 int snd_seq_queue_is_used(int queueid, int client)
 {
-	struct snd_seq_queue *q;
-	int result;
+	struct snd_seq_queue *q __free(snd_seq_queue) = NULL;
 
 	q = queueptr(queueid);
 	if (q == NULL)
 		return -EINVAL; /* invalid queue */
-	result = test_bit(client, q->clients_bitmap) ? 1 : 0;
-	queuefree(q);
-	return result;
+	return test_bit(client, q->clients_bitmap) ? 1 : 0;
 }
 
 
@@ -535,11 +514,10 @@ int snd_seq_queue_is_used(int queueid, int client)
 void snd_seq_queue_client_leave(int client)
 {
 	int i;
-	struct snd_seq_queue *q;
 
 	/* delete own queues from queue list */
 	for (i = 0; i < SNDRV_SEQ_MAX_QUEUES; i++) {
-		q = queue_list_remove(i, client);
+		struct snd_seq_queue *q = queue_list_remove(i, client);
 		if (q)
 			queue_delete(q);
 	}
@@ -548,7 +526,7 @@ void snd_seq_queue_client_leave(int client)
 	 * they are not owned by this client
 	 */
 	for (i = 0; i < SNDRV_SEQ_MAX_QUEUES; i++) {
-		q = queueptr(i);
+		struct snd_seq_queue *q __free(snd_seq_queue) = queueptr(i);
 		if (!q)
 			continue;
 		if (test_bit(client, q->clients_bitmap)) {
@@ -556,7 +534,6 @@ void snd_seq_queue_client_leave(int client)
 			snd_seq_prioq_leave(q->timeq, client, 0);
 			snd_seq_queue_use(q->queue, client, 0);
 		}
-		queuefree(q);
 	}
 }
 
@@ -568,10 +545,9 @@ void snd_seq_queue_client_leave(int client)
 void snd_seq_queue_remove_cells(int client, struct snd_seq_remove_events *info)
 {
 	int i;
-	struct snd_seq_queue *q;
 
 	for (i = 0; i < SNDRV_SEQ_MAX_QUEUES; i++) {
-		q = queueptr(i);
+		struct snd_seq_queue *q __free(snd_seq_queue) = queueptr(i);
 		if (!q)
 			continue;
 		if (test_bit(client, q->clients_bitmap) &&
@@ -580,7 +556,6 @@ void snd_seq_queue_remove_cells(int client, struct snd_seq_remove_events *info)
 			snd_seq_prioq_remove_events(q->tickq, client, info);
 			snd_seq_prioq_remove_events(q->timeq, client, info);
 		}
-		queuefree(q);
 	}
 }
 
@@ -667,7 +642,7 @@ static void snd_seq_queue_process_event(struct snd_seq_queue *q,
  */
 int snd_seq_control_queue(struct snd_seq_event *ev, int atomic, int hop)
 {
-	struct snd_seq_queue *q;
+	struct snd_seq_queue *q __free(snd_seq_queue) = NULL;
 
 	if (snd_BUG_ON(!ev))
 		return -EINVAL;
@@ -676,15 +651,12 @@ int snd_seq_control_queue(struct snd_seq_event *ev, int atomic, int hop)
 	if (q == NULL)
 		return -EINVAL;
 
-	if (! queue_access_lock(q, ev->source.client)) {
-		queuefree(q);
+	if (!queue_access_lock(q, ev->source.client))
 		return -EPERM;
-	}
 
 	snd_seq_queue_process_event(q, ev, atomic, hop);
 
 	queue_access_unlock(q);
-	queuefree(q);
 	return 0;
 }
 
@@ -697,13 +669,12 @@ void snd_seq_info_queues_read(struct snd_info_entry *entry,
 			      struct snd_info_buffer *buffer)
 {
 	int i, bpm;
-	struct snd_seq_queue *q;
 	struct snd_seq_timer *tmr;
 	bool locked;
 	int owner;
 
 	for (i = 0; i < SNDRV_SEQ_MAX_QUEUES; i++) {
-		q = queueptr(i);
+		struct snd_seq_queue *q __free(snd_seq_queue) = queueptr(i);
 		if (!q)
 			continue;
 
@@ -731,7 +702,6 @@ void snd_seq_info_queues_read(struct snd_info_entry *entry,
 		snd_iprintf(buffer, "current time       : %d.%09d s\n", tmr->cur_time.tv_sec, tmr->cur_time.tv_nsec);
 		snd_iprintf(buffer, "current tick       : %d\n", tmr->tick.cur_tick);
 		snd_iprintf(buffer, "\n");
-		queuefree(q);
 	}
 }
 #endif /* CONFIG_SND_PROC_FS */
diff --git a/sound/core/seq/seq_queue.h b/sound/core/seq/seq_queue.h
index b81379c9af43..afcd3c5484a6 100644
--- a/sound/core/seq/seq_queue.h
+++ b/sound/core/seq/seq_queue.h
@@ -73,6 +73,8 @@ struct snd_seq_queue *queueptr(int queueid);
 /* unlock */
 #define queuefree(q) snd_use_lock_free(&(q)->use_lock)
 
+DEFINE_FREE(snd_seq_queue, struct snd_seq_queue *, if (!IS_ERR_OR_NULL(_T)) queuefree(_T))
+
 /* return the (first) queue matching with the specified name */
 struct snd_seq_queue *snd_seq_queue_find_name(char *name);
 
diff --git a/sound/core/seq/seq_timer.c b/sound/core/seq/seq_timer.c
index c9f0392ac7f1..29b018a212fc 100644
--- a/sound/core/seq/seq_timer.c
+++ b/sound/core/seq/seq_timer.c
@@ -440,13 +440,13 @@ void snd_seq_info_timer_read(struct snd_info_entry *entry,
 			     struct snd_info_buffer *buffer)
 {
 	int idx;
-	struct snd_seq_queue *q;
 	struct snd_seq_timer *tmr;
 	struct snd_timer_instance *ti;
 	unsigned long resolution;
 	
 	for (idx = 0; idx < SNDRV_SEQ_MAX_QUEUES; idx++) {
-		q = queueptr(idx);
+		struct snd_seq_queue *q __free(snd_seq_queue) = queueptr(idx);
+
 		if (q == NULL)
 			continue;
 		scoped_guard(mutex, &q->timer_mutex) {
@@ -461,7 +461,6 @@ void snd_seq_info_timer_read(struct snd_info_entry *entry,
 			snd_iprintf(buffer, "  Period time : %lu.%09lu\n", resolution / 1000000000, resolution % 1000000000);
 			snd_iprintf(buffer, "  Skew : %u / %u\n", tmr->skew, tmr->skew_base);
 		}
-		queuefree(q);
  	}
 }
 #endif /* CONFIG_SND_PROC_FS */
-- 
2.50.1

