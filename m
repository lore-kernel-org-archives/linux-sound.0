Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F8CF130E37
	for <linux-sound@vger.kernel.org>; Tue, 27 Feb 2024 08:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709024001; cv=none; b=j4aNx1XQvZHDNz+pHddTDTaq780eQBbEzYQrH7bVmDFugv6IPVKWNT8vmy0TDpdoo6HWkEvMELqokSUeoe2D3w65wDdzxtjgWaed7yTeQd97nEe78yLOs7YJCqDe3428QDQVeoxUOpg05Z70zpwmPS20oVAba1sXOWrQ3eO3wWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709024001; c=relaxed/simple;
	bh=tbGyeoK7+fVhd1jjUNOkEVdpOD93vHovUKv+xnfZUGs=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CBr+p4Bl3j9lxGUMLWOtEstlsSJH/e3ex0cgLBtHuuEgeTXyg3NlCr3zeAjOyABzN3RjApbjEvJNBq+hT8RJL/qzpI4knt3mM5Uv2/XiruIrDalOfytzy+a3bjAzkpjVKaMvsg0mOOVsb1YKW8BENUzK16D79FLdgwf8YkWFr1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=zeRvvUQJ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=y/4qWNas; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=zeRvvUQJ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=y/4qWNas; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="zeRvvUQJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="y/4qWNas";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="zeRvvUQJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="y/4qWNas"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id BCDBB1FD34;
	Tue, 27 Feb 2024 08:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1709023995; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LZ3i5Wmg0ThAZTjaTnOLCJLI2pL63XkiPFVUkDwcsts=;
	b=zeRvvUQJ2vsGBW9OOEYyqBnZR/f4pfwKRa5U8B3rQsUzyKogmfYnBwQVo6vYj64mIU+W+N
	s/DjYaFn8inkqPK13jjE8g5CSM51gHPp52nq2ZwysjhzXpc7AB8Go5E4jZBuy5P/XBY9jw
	wNyAZUZKYJ8PDydm/+FKgrz7C2lJHS4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1709023995;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LZ3i5Wmg0ThAZTjaTnOLCJLI2pL63XkiPFVUkDwcsts=;
	b=y/4qWNasbfEizb34Jt+ar9MhlI7gKbxzZH3KDvqWsQMq6Pnbdj2n0vFwaIbhj3YcOwK3u5
	3N/ionzIEXUMQbCw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1709023995; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LZ3i5Wmg0ThAZTjaTnOLCJLI2pL63XkiPFVUkDwcsts=;
	b=zeRvvUQJ2vsGBW9OOEYyqBnZR/f4pfwKRa5U8B3rQsUzyKogmfYnBwQVo6vYj64mIU+W+N
	s/DjYaFn8inkqPK13jjE8g5CSM51gHPp52nq2ZwysjhzXpc7AB8Go5E4jZBuy5P/XBY9jw
	wNyAZUZKYJ8PDydm/+FKgrz7C2lJHS4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1709023995;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LZ3i5Wmg0ThAZTjaTnOLCJLI2pL63XkiPFVUkDwcsts=;
	b=y/4qWNasbfEizb34Jt+ar9MhlI7gKbxzZH3KDvqWsQMq6Pnbdj2n0vFwaIbhj3YcOwK3u5
	3N/ionzIEXUMQbCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A3CA513A58;
	Tue, 27 Feb 2024 08:53:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id EKHSJvui3WWeaQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 27 Feb 2024 08:53:15 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH v3 12/24] ALSA: seq: fifo: Use guard() for locking
Date: Tue, 27 Feb 2024 09:52:54 +0100
Message-Id: <20240227085306.9764-13-tiwai@suse.de>
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
 sound/core/seq/seq_fifo.c | 55 +++++++++++++++++----------------------
 1 file changed, 24 insertions(+), 31 deletions(-)

diff --git a/sound/core/seq/seq_fifo.c b/sound/core/seq/seq_fifo.c
index f8e02e98709a..3a10b081f129 100644
--- a/sound/core/seq/seq_fifo.c
+++ b/sound/core/seq/seq_fifo.c
@@ -88,12 +88,11 @@ void snd_seq_fifo_clear(struct snd_seq_fifo *f)
 	atomic_set(&f->overflow, 0);
 
 	snd_use_lock_sync(&f->use_lock);
-	spin_lock_irq(&f->lock);
+	guard(spinlock_irq)(&f->lock);
 	/* drain the fifo */
 	while ((cell = fifo_cell_out(f)) != NULL) {
 		snd_seq_cell_free(cell);
 	}
-	spin_unlock_irq(&f->lock);
 }
 
 
@@ -102,7 +101,6 @@ int snd_seq_fifo_event_in(struct snd_seq_fifo *f,
 			  struct snd_seq_event *event)
 {
 	struct snd_seq_event_cell *cell;
-	unsigned long flags;
 	int err;
 
 	if (snd_BUG_ON(!f))
@@ -118,15 +116,15 @@ int snd_seq_fifo_event_in(struct snd_seq_fifo *f,
 	}
 		
 	/* append new cells to fifo */
-	spin_lock_irqsave(&f->lock, flags);
-	if (f->tail != NULL)
-		f->tail->next = cell;
-	f->tail = cell;
-	if (f->head == NULL)
-		f->head = cell;
-	cell->next = NULL;
-	f->cells++;
-	spin_unlock_irqrestore(&f->lock, flags);
+	scoped_guard(spinlock_irqsave, &f->lock) {
+		if (f->tail != NULL)
+			f->tail->next = cell;
+		f->tail = cell;
+		if (f->head == NULL)
+			f->head = cell;
+		cell->next = NULL;
+		f->cells++;
+	}
 
 	/* wakeup client */
 	if (waitqueue_active(&f->input_sleep))
@@ -199,16 +197,13 @@ int snd_seq_fifo_cell_out(struct snd_seq_fifo *f,
 void snd_seq_fifo_cell_putback(struct snd_seq_fifo *f,
 			       struct snd_seq_event_cell *cell)
 {
-	unsigned long flags;
-
 	if (cell) {
-		spin_lock_irqsave(&f->lock, flags);
+		guard(spinlock_irqsave)(&f->lock);
 		cell->next = f->head;
 		f->head = cell;
 		if (!f->tail)
 			f->tail = cell;
 		f->cells++;
-		spin_unlock_irqrestore(&f->lock, flags);
 	}
 }
 
@@ -239,17 +234,17 @@ int snd_seq_fifo_resize(struct snd_seq_fifo *f, int poolsize)
 		return -ENOMEM;
 	}
 
-	spin_lock_irq(&f->lock);
-	/* remember old pool */
-	oldpool = f->pool;
-	oldhead = f->head;
-	/* exchange pools */
-	f->pool = newpool;
-	f->head = NULL;
-	f->tail = NULL;
-	f->cells = 0;
-	/* NOTE: overflow flag is not cleared */
-	spin_unlock_irq(&f->lock);
+	scoped_guard(spinlock_irq, &f->lock) {
+		/* remember old pool */
+		oldpool = f->pool;
+		oldhead = f->head;
+		/* exchange pools */
+		f->pool = newpool;
+		f->head = NULL;
+		f->tail = NULL;
+		f->cells = 0;
+		/* NOTE: overflow flag is not cleared */
+	}
 
 	/* close the old pool and wait until all users are gone */
 	snd_seq_pool_mark_closing(oldpool);
@@ -268,16 +263,14 @@ int snd_seq_fifo_resize(struct snd_seq_fifo *f, int poolsize)
 /* get the number of unused cells safely */
 int snd_seq_fifo_unused_cells(struct snd_seq_fifo *f)
 {
-	unsigned long flags;
 	int cells;
 
 	if (!f)
 		return 0;
 
 	snd_use_lock_use(&f->use_lock);
-	spin_lock_irqsave(&f->lock, flags);
-	cells = snd_seq_unused_cells(f->pool);
-	spin_unlock_irqrestore(&f->lock, flags);
+	scoped_guard(spinlock_irqsave, &f->lock)
+		cells = snd_seq_unused_cells(f->pool);
 	snd_use_lock_free(&f->use_lock);
 	return cells;
 }
-- 
2.35.3

