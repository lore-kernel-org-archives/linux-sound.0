Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6576513DB8E
	for <linux-sound@vger.kernel.org>; Fri, 23 Feb 2024 17:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708710619; cv=none; b=SQKxGL5LtLrZ820sOjd8pOx56/nyrfBdK0nEl5rbN5mqjira2514OmkBW9/NElTGZ1ywKUoh041d5xyeepaka4svczysG1QZMZjKsMbxI2Wq2ZkIa3ojquNjCVQptA8zFlzjZfWdzlT7OHxztweU5VW6lAp8srd9fmphMB5+Qk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708710619; c=relaxed/simple;
	bh=ehQP5n7yMq9UtGNNT4B9nvfwy1mOriAp7dStedDtIkY=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=blXkOVC+LxozskO1NlAmE781JAK79PSZ0lOCVqw6EsihOENxfhQkvc01hYKIVFp035+JyGuy6TdJcNjnO8/EsNg/O8n7ikdXDDVHg40XTtaGYo27R7xe1p/+WgH4xke7Jcikxnd/eIcP0tkw10nB2Fwr0CN1zMne0UxeDQJURMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=vdcgQKZd; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=xwL307+o; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=vdcgQKZd; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=xwL307+o; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="vdcgQKZd";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="xwL307+o";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="vdcgQKZd";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="xwL307+o"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 18C8A1FD3D;
	Fri, 23 Feb 2024 17:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1708710613; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=d6ZYxLlnH3LMa8ZKB2N0hFmPXXuhDG8YQzlA3lYJiGE=;
	b=vdcgQKZdKcok5AdSkS/Ejj9h3BMXC1YaOxyMMDlT5+tRLHeYDQdI/7gBZWpDwv5mFzhdlX
	7ZkTookETfdcjHlgB4UpRQhsK9v/QiN1kq7YSHhSwAM0j6n2sUc5sNm+Z3YtM+t1UtuT9H
	OhSWIo0peDloGEDrK/SD9tFJXGGW3GI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708710613;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=d6ZYxLlnH3LMa8ZKB2N0hFmPXXuhDG8YQzlA3lYJiGE=;
	b=xwL307+oTijV5ROBScWYrFHpYFOGzFU8SYgVAPYh9X8y4bj2JODc3b5tyCgW5wugcYUTTL
	xOv5wIErnsePZ5AA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1708710613; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=d6ZYxLlnH3LMa8ZKB2N0hFmPXXuhDG8YQzlA3lYJiGE=;
	b=vdcgQKZdKcok5AdSkS/Ejj9h3BMXC1YaOxyMMDlT5+tRLHeYDQdI/7gBZWpDwv5mFzhdlX
	7ZkTookETfdcjHlgB4UpRQhsK9v/QiN1kq7YSHhSwAM0j6n2sUc5sNm+Z3YtM+t1UtuT9H
	OhSWIo0peDloGEDrK/SD9tFJXGGW3GI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708710613;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=d6ZYxLlnH3LMa8ZKB2N0hFmPXXuhDG8YQzlA3lYJiGE=;
	b=xwL307+oTijV5ROBScWYrFHpYFOGzFU8SYgVAPYh9X8y4bj2JODc3b5tyCgW5wugcYUTTL
	xOv5wIErnsePZ5AA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EDD0013AC1;
	Fri, 23 Feb 2024 17:50:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id OBWYONTa2GW6RAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 23 Feb 2024 17:50:12 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH v2 15/24] ALSA: seq: queue: Use guard() for locking
Date: Fri, 23 Feb 2024 18:49:52 +0100
Message-Id: <20240223175001.24375-16-tiwai@suse.de>
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
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=vdcgQKZd;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=xwL307+o
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
X-Rspamd-Queue-Id: 18C8A1FD3D
X-Spam-Flag: NO

We can simplify the code gracefully with new guard() macro and co for
automatic cleanup of locks.

Only the code refactoring, and no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/seq/seq_queue.c | 78 ++++++++++++++------------------------
 1 file changed, 28 insertions(+), 50 deletions(-)

diff --git a/sound/core/seq/seq_queue.c b/sound/core/seq/seq_queue.c
index bc933104c3ee..500ee6b19c71 100644
--- a/sound/core/seq/seq_queue.c
+++ b/sound/core/seq/seq_queue.c
@@ -50,43 +50,35 @@ int snd_seq_queue_get_cur_queues(void)
 static int queue_list_add(struct snd_seq_queue *q)
 {
 	int i;
-	unsigned long flags;
 
-	spin_lock_irqsave(&queue_list_lock, flags);
+	guard(spinlock_irqsave)(&queue_list_lock);
 	for (i = 0; i < SNDRV_SEQ_MAX_QUEUES; i++) {
 		if (! queue_list[i]) {
 			queue_list[i] = q;
 			q->queue = i;
 			num_queues++;
-			spin_unlock_irqrestore(&queue_list_lock, flags);
 			return i;
 		}
 	}
-	spin_unlock_irqrestore(&queue_list_lock, flags);
 	return -1;
 }
 
 static struct snd_seq_queue *queue_list_remove(int id, int client)
 {
 	struct snd_seq_queue *q;
-	unsigned long flags;
 
-	spin_lock_irqsave(&queue_list_lock, flags);
+	guard(spinlock_irqsave)(&queue_list_lock);
 	q = queue_list[id];
 	if (q) {
-		spin_lock(&q->owner_lock);
+		guard(spinlock)(&q->owner_lock);
 		if (q->owner == client) {
 			/* found */
 			q->klocked = 1;
-			spin_unlock(&q->owner_lock);
 			queue_list[id] = NULL;
 			num_queues--;
-			spin_unlock_irqrestore(&queue_list_lock, flags);
 			return q;
 		}
-		spin_unlock(&q->owner_lock);
 	}
-	spin_unlock_irqrestore(&queue_list_lock, flags);
 	return NULL;
 }
 
@@ -203,15 +195,13 @@ int snd_seq_queue_delete(int client, int queueid)
 struct snd_seq_queue *queueptr(int queueid)
 {
 	struct snd_seq_queue *q;
-	unsigned long flags;
 
 	if (queueid < 0 || queueid >= SNDRV_SEQ_MAX_QUEUES)
 		return NULL;
-	spin_lock_irqsave(&queue_list_lock, flags);
+	guard(spinlock_irqsave)(&queue_list_lock);
 	q = queue_list[queueid];
 	if (q)
 		snd_use_lock_use(&q->use_lock);
-	spin_unlock_irqrestore(&queue_list_lock, flags);
 	return q;
 }
 
@@ -239,7 +229,6 @@ struct snd_seq_queue *snd_seq_queue_find_name(char *name)
 
 void snd_seq_check_queue(struct snd_seq_queue *q, int atomic, int hop)
 {
-	unsigned long flags;
 	struct snd_seq_event_cell *cell;
 	snd_seq_tick_time_t cur_tick;
 	snd_seq_real_time_t cur_time;
@@ -249,14 +238,13 @@ void snd_seq_check_queue(struct snd_seq_queue *q, int atomic, int hop)
 		return;
 
 	/* make this function non-reentrant */
-	spin_lock_irqsave(&q->check_lock, flags);
-	if (q->check_blocked) {
-		q->check_again = 1;
-		spin_unlock_irqrestore(&q->check_lock, flags);
-		return;		/* other thread is already checking queues */
+	scoped_guard(spinlock_irqsave, &q->check_lock) {
+		if (q->check_blocked) {
+			q->check_again = 1;
+			return;	/* other thread is already checking queues */
+		}
+		q->check_blocked = 1;
 	}
-	q->check_blocked = 1;
-	spin_unlock_irqrestore(&q->check_lock, flags);
 
       __again:
 	/* Process tick queue... */
@@ -283,16 +271,14 @@ void snd_seq_check_queue(struct snd_seq_queue *q, int atomic, int hop)
 
  out:
 	/* free lock */
-	spin_lock_irqsave(&q->check_lock, flags);
-	if (q->check_again) {
-		q->check_again = 0;
-		if (processed < MAX_CELL_PROCESSES_IN_QUEUE) {
-			spin_unlock_irqrestore(&q->check_lock, flags);
-			goto __again;
+	scoped_guard(spinlock_irqsave, &q->check_lock) {
+		if (q->check_again) {
+			q->check_again = 0;
+			if (processed < MAX_CELL_PROCESSES_IN_QUEUE)
+				goto __again;
 		}
+		q->check_blocked = 0;
 	}
-	q->check_blocked = 0;
-	spin_unlock_irqrestore(&q->check_lock, flags);
 }
 
 
@@ -361,25 +347,20 @@ static inline int check_access(struct snd_seq_queue *q, int client)
  */
 static int queue_access_lock(struct snd_seq_queue *q, int client)
 {
-	unsigned long flags;
 	int access_ok;
 	
-	spin_lock_irqsave(&q->owner_lock, flags);
+	guard(spinlock_irqsave)(&q->owner_lock);
 	access_ok = check_access(q, client);
 	if (access_ok)
 		q->klocked = 1;
-	spin_unlock_irqrestore(&q->owner_lock, flags);
 	return access_ok;
 }
 
 /* unlock the queue */
 static inline void queue_access_unlock(struct snd_seq_queue *q)
 {
-	unsigned long flags;
-
-	spin_lock_irqsave(&q->owner_lock, flags);
+	guard(spinlock_irqsave)(&q->owner_lock);
 	q->klocked = 0;
-	spin_unlock_irqrestore(&q->owner_lock, flags);
 }
 
 /* exported - only checking permission */
@@ -387,13 +368,11 @@ int snd_seq_queue_check_access(int queueid, int client)
 {
 	struct snd_seq_queue *q = queueptr(queueid);
 	int access_ok;
-	unsigned long flags;
 
 	if (! q)
 		return 0;
-	spin_lock_irqsave(&q->owner_lock, flags);
-	access_ok = check_access(q, client);
-	spin_unlock_irqrestore(&q->owner_lock, flags);
+	scoped_guard(spinlock_irqsave, &q->owner_lock)
+		access_ok = check_access(q, client);
 	queuefree(q);
 	return access_ok;
 }
@@ -406,7 +385,6 @@ int snd_seq_queue_check_access(int queueid, int client)
 int snd_seq_queue_set_owner(int queueid, int client, int locked)
 {
 	struct snd_seq_queue *q = queueptr(queueid);
-	unsigned long flags;
 
 	if (q == NULL)
 		return -EINVAL;
@@ -416,10 +394,10 @@ int snd_seq_queue_set_owner(int queueid, int client, int locked)
 		return -EPERM;
 	}
 
-	spin_lock_irqsave(&q->owner_lock, flags);
-	q->locked = locked ? 1 : 0;
-	q->owner = client;
-	spin_unlock_irqrestore(&q->owner_lock, flags);
+	scoped_guard(spinlock_irqsave, &q->owner_lock) {
+		q->locked = locked ? 1 : 0;
+		q->owner = client;
+	}
 	queue_access_unlock(q);
 	queuefree(q);
 
@@ -750,10 +728,10 @@ void snd_seq_info_queues_read(struct snd_info_entry *entry,
 		else
 			bpm = 0;
 
-		spin_lock_irq(&q->owner_lock);
-		locked = q->locked;
-		owner = q->owner;
-		spin_unlock_irq(&q->owner_lock);
+		scoped_guard(spinlock_irq, &q->owner_lock) {
+			locked = q->locked;
+			owner = q->owner;
+		}
 
 		snd_iprintf(buffer, "queue %d: [%s]\n", q->queue, q->name);
 		snd_iprintf(buffer, "owned by client    : %d\n", owner);
-- 
2.35.3

