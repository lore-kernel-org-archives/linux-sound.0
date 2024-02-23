Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3A6313F00F
	for <linux-sound@vger.kernel.org>; Fri, 23 Feb 2024 17:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708710618; cv=none; b=FISHQhZyu+4biGVRzT8qylvSxFjh/bUGHMiSk/9MasfWR0VSL3pQDqSBaM2QBb/gBuKkraHm6nRFhLJojf6d8L3KlS/u5iG6rYpq/0K3LnOrKap58slox3ZHSjHV+ZyzTFxi96XrpBNcygE5WW5pDkM3Vq1I8cmcrQQH7eWxN38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708710618; c=relaxed/simple;
	bh=cwsfvCtEdywavZB2WRDbzqvOOd8oG8Ylx4F6Gom1+z4=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TPRLBY/8a4BVgDocEg65ZMM8lQEK78LiNp1LbLc4F4ODcMpmfb11YVfKvKE6dpXaikRKJ55d2s1fkkphfp6SKvAu0gh99mwUW66XEGm0Oq5OBklCp58nfWRniHdyCWQ18wMkcmQqihQ0VjKwXNxYe7Txx2BQyKHQ/zYcTOfdKM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=if4XJkbS; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=zJ6IYZWh; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=if4XJkbS; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=zJ6IYZWh; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="if4XJkbS";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="zJ6IYZWh";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="if4XJkbS";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="zJ6IYZWh"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E1D78221D5;
	Fri, 23 Feb 2024 17:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1708710613; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oppnL8CvUq6dqNuLyHeui3UjQKunxHeertMxdEMAQbo=;
	b=if4XJkbSBkBhy4DDCqeeSA1TM7RrEr4HmhsP5mDqkIlaQu2DFf/+1IExM7Sp/XzMjUtF7e
	UZGecLJx6rMcZ7y8ZOCXyXNz4J3PkG9XJuDbNG5a3XJ2JjBtqaJO8bASPJkhEVDpFc7tiO
	BC0hfWa0VsbYZFcYpVEVY2pcqn75FWQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708710613;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oppnL8CvUq6dqNuLyHeui3UjQKunxHeertMxdEMAQbo=;
	b=zJ6IYZWhjehCosvhHTHsk7lj3vRKnyUM8YELLn9pnQ2uDwU0CLp3cVNicKScBHZg2NAcGl
	4RNvjTlGNELFvLBA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1708710613; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oppnL8CvUq6dqNuLyHeui3UjQKunxHeertMxdEMAQbo=;
	b=if4XJkbSBkBhy4DDCqeeSA1TM7RrEr4HmhsP5mDqkIlaQu2DFf/+1IExM7Sp/XzMjUtF7e
	UZGecLJx6rMcZ7y8ZOCXyXNz4J3PkG9XJuDbNG5a3XJ2JjBtqaJO8bASPJkhEVDpFc7tiO
	BC0hfWa0VsbYZFcYpVEVY2pcqn75FWQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708710613;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oppnL8CvUq6dqNuLyHeui3UjQKunxHeertMxdEMAQbo=;
	b=zJ6IYZWhjehCosvhHTHsk7lj3vRKnyUM8YELLn9pnQ2uDwU0CLp3cVNicKScBHZg2NAcGl
	4RNvjTlGNELFvLBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C20E813AC1;
	Fri, 23 Feb 2024 17:50:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id EAPsLdXa2GW6RAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 23 Feb 2024 17:50:13 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH v2 20/24] ALSA: seq: prioq: Use guard() for locking
Date: Fri, 23 Feb 2024 18:49:57 +0100
Message-Id: <20240223175001.24375-21-tiwai@suse.de>
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
 sound/core/seq/seq_prioq.c | 59 +++++++++++++++++---------------------
 1 file changed, 26 insertions(+), 33 deletions(-)

diff --git a/sound/core/seq/seq_prioq.c b/sound/core/seq/seq_prioq.c
index e062df7610e1..e649485a8772 100644
--- a/sound/core/seq/seq_prioq.c
+++ b/sound/core/seq/seq_prioq.c
@@ -132,7 +132,6 @@ int snd_seq_prioq_cell_in(struct snd_seq_prioq * f,
 			  struct snd_seq_event_cell * cell)
 {
 	struct snd_seq_event_cell *cur, *prev;
-	unsigned long flags;
 	int count;
 	int prior;
 
@@ -142,7 +141,7 @@ int snd_seq_prioq_cell_in(struct snd_seq_prioq * f,
 	/* check flags */
 	prior = (cell->event.flags & SNDRV_SEQ_PRIORITY_MASK);
 
-	spin_lock_irqsave(&f->lock, flags);
+	guard(spinlock_irqsave)(&f->lock);
 
 	/* check if this element needs to inserted at the end (ie. ordered 
 	   data is inserted) This will be very likeley if a sequencer 
@@ -154,7 +153,6 @@ int snd_seq_prioq_cell_in(struct snd_seq_prioq * f,
 			f->tail = cell;
 			cell->next = NULL;
 			f->cells++;
-			spin_unlock_irqrestore(&f->lock, flags);
 			return 0;
 		}
 	}
@@ -179,7 +177,6 @@ int snd_seq_prioq_cell_in(struct snd_seq_prioq * f,
 		prev = cur;
 		cur = cur->next;
 		if (! --count) {
-			spin_unlock_irqrestore(&f->lock, flags);
 			pr_err("ALSA: seq: cannot find a pointer.. infinite loop?\n");
 			return -EINVAL;
 		}
@@ -195,7 +192,6 @@ int snd_seq_prioq_cell_in(struct snd_seq_prioq * f,
 	if (cur == NULL) /* reached end of the list */
 		f->tail = cell;
 	f->cells++;
-	spin_unlock_irqrestore(&f->lock, flags);
 	return 0;
 }
 
@@ -213,14 +209,13 @@ struct snd_seq_event_cell *snd_seq_prioq_cell_out(struct snd_seq_prioq *f,
 						  void *current_time)
 {
 	struct snd_seq_event_cell *cell;
-	unsigned long flags;
 
 	if (f == NULL) {
 		pr_debug("ALSA: seq: snd_seq_prioq_cell_in() called with NULL prioq\n");
 		return NULL;
 	}
-	spin_lock_irqsave(&f->lock, flags);
 
+	guard(spinlock_irqsave)(&f->lock);
 	cell = f->head;
 	if (cell && current_time && !event_is_ready(&cell->event, current_time))
 		cell = NULL;
@@ -235,7 +230,6 @@ struct snd_seq_event_cell *snd_seq_prioq_cell_out(struct snd_seq_prioq *f,
 		f->cells--;
 	}
 
-	spin_unlock_irqrestore(&f->lock, flags);
 	return cell;
 }
 
@@ -256,37 +250,36 @@ static void prioq_remove_cells(struct snd_seq_prioq *f,
 			       void *arg)
 {
 	register struct snd_seq_event_cell *cell, *next;
-	unsigned long flags;
 	struct snd_seq_event_cell *prev = NULL;
 	struct snd_seq_event_cell *freefirst = NULL, *freeprev = NULL, *freenext;
 
 	/* collect all removed cells */
-	spin_lock_irqsave(&f->lock, flags);
-	for (cell = f->head; cell; cell = next) {
-		next = cell->next;
-		if (!match(cell, arg)) {
-			prev = cell;
-			continue;
+	scoped_guard(spinlock_irqsave, &f->lock) {
+		for (cell = f->head; cell; cell = next) {
+			next = cell->next;
+			if (!match(cell, arg)) {
+				prev = cell;
+				continue;
+			}
+
+			/* remove cell from prioq */
+			if (cell == f->head)
+				f->head = cell->next;
+			else
+				prev->next = cell->next;
+			if (cell == f->tail)
+				f->tail = cell->next;
+			f->cells--;
+
+			/* add cell to free list */
+			cell->next = NULL;
+			if (freefirst == NULL)
+				freefirst = cell;
+			else
+				freeprev->next = cell;
+			freeprev = cell;
 		}
-
-		/* remove cell from prioq */
-		if (cell == f->head)
-			f->head = cell->next;
-		else
-			prev->next = cell->next;
-		if (cell == f->tail)
-			f->tail = cell->next;
-		f->cells--;
-
-		/* add cell to free list */
-		cell->next = NULL;
-		if (freefirst == NULL)
-			freefirst = cell;
-		else
-			freeprev->next = cell;
-		freeprev = cell;
 	}
-	spin_unlock_irqrestore(&f->lock, flags);	
 
 	/* remove selected cells */
 	while (freefirst) {
-- 
2.35.3

