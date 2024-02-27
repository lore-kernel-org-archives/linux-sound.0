Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3440133419
	for <linux-sound@vger.kernel.org>; Tue, 27 Feb 2024 08:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709024007; cv=none; b=e790dmOZPQWCME+51Fwa5rDfVtMhTHnfNAQQNFyJ1RL08Ewf5CDiNQXZ0RUSaHEajHzBZg/L8d0OyOlTzJZh4d0mVWdahzkmg4XIoqNtW7BWLnIcX4UjgVE1YC7X92Nz9ag1FuYTX9hODvguqHFEk5nc8+sUiqvsWNp64XXA1kU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709024007; c=relaxed/simple;
	bh=ehQP5n7yMq9UtGNNT4B9nvfwy1mOriAp7dStedDtIkY=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DSYR2su7DDL2LeomP0/ha2cDGpnz0EntyBa9VHBN1fbIIG3h7wgGcC7LOKYfDLgNY9SVZtxA/ED755PqEm/VkqRZXBECl2k6jSymfAjArjS90YUEMRYtVBA5Rq7B1uH42VyBy1deZ9qus+8WnEvfq+Wgem1FzUJzwgBS38EUO/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=dhtbrc35; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Q9BgBN63; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=dhtbrc35; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Q9BgBN63; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="dhtbrc35";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Q9BgBN63";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="dhtbrc35";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Q9BgBN63"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 2567122780;
	Tue, 27 Feb 2024 08:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1709023996; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=d6ZYxLlnH3LMa8ZKB2N0hFmPXXuhDG8YQzlA3lYJiGE=;
	b=dhtbrc35nsXUDSFqr0aT7Y7A5KW4UPTr+0TgVfi9FT0jiNmzC2lsQ2La3VNwD7XKxVk/i2
	R8fQrDvy65TBXm5qhhG3daac9SUudn+yhYS8Ao8fqca5rG6hRqq+RGm9C6c7LfQCqLRLp9
	f1z/jrBwvrDFRU1B0zAg2WwpVvuGBQ8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1709023996;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=d6ZYxLlnH3LMa8ZKB2N0hFmPXXuhDG8YQzlA3lYJiGE=;
	b=Q9BgBN63+vGJFwHxqSnx8arUIF9gXOo/1GnGh710yJPNC+w+cXMlH/cu2oH1auXbkWNuJw
	XQ/8w7BXjyfaakDg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1709023996; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=d6ZYxLlnH3LMa8ZKB2N0hFmPXXuhDG8YQzlA3lYJiGE=;
	b=dhtbrc35nsXUDSFqr0aT7Y7A5KW4UPTr+0TgVfi9FT0jiNmzC2lsQ2La3VNwD7XKxVk/i2
	R8fQrDvy65TBXm5qhhG3daac9SUudn+yhYS8Ao8fqca5rG6hRqq+RGm9C6c7LfQCqLRLp9
	f1z/jrBwvrDFRU1B0zAg2WwpVvuGBQ8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1709023996;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=d6ZYxLlnH3LMa8ZKB2N0hFmPXXuhDG8YQzlA3lYJiGE=;
	b=Q9BgBN63+vGJFwHxqSnx8arUIF9gXOo/1GnGh710yJPNC+w+cXMlH/cu2oH1auXbkWNuJw
	XQ/8w7BXjyfaakDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0BBA813AD7;
	Tue, 27 Feb 2024 08:53:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id cHm6Afyi3WWeaQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 27 Feb 2024 08:53:16 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH v3 15/24] ALSA: seq: queue: Use guard() for locking
Date: Tue, 27 Feb 2024 09:52:57 +0100
Message-Id: <20240227085306.9764-16-tiwai@suse.de>
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
Authentication-Results: smtp-out1.suse.de;
	none
X-Spamd-Result: default: False [1.90 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 TO_DN_NONE(0.00)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 RCPT_COUNT_ONE(0.00)[1];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-3.00)[100.00%]
X-Spam-Level: *
X-Spam-Score: 1.90
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

