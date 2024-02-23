Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D5FF84A39
	for <linux-sound@vger.kernel.org>; Fri, 23 Feb 2024 16:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708705708; cv=none; b=AVRB1zdmMXewEoK2sRfBDH/1cQggJwjHb7YzLNxhq9lPj/aSLKgYCA8YUlacxqxSJBUcRH449f+lwfh9wA2GifG7NbS19m71Y3XFt7fTiSHqzUKolhmV7I8oH5q3vO88bAFXC6PcZK/AntGdoov5P3HPPPFnoLmhqxrLCzkySy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708705708; c=relaxed/simple;
	bh=cwsfvCtEdywavZB2WRDbzqvOOd8oG8Ylx4F6Gom1+z4=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=th4SBprDqOj5KHxKmpp+aYPVnwElBkbi/2iu+Rc1VApBv4HU7LIteZqkII1tjLvSYA8wnol0x+1pHEIC76phV16V3TQZiuFGifGDx4iHktZBzX3eCFl1Pf1fNrLr62lHpeiuL0erwCFISoVEbiUS0zKszduLsoIHTWIpPFUlu0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=GGBPn6Dx; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=hzQKqqwP; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=GGBPn6Dx; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=hzQKqqwP; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="GGBPn6Dx";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="hzQKqqwP";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="GGBPn6Dx";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="hzQKqqwP"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 6606E1FD42;
	Fri, 23 Feb 2024 16:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1708705701; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oppnL8CvUq6dqNuLyHeui3UjQKunxHeertMxdEMAQbo=;
	b=GGBPn6DxYfAXjgn+wCFlXdd041jd7vLnuHhnmCtvVxVfdtdaCFKzHthpcB5zOKOci9QSEk
	hnjnKc1QOPR9TBYyKAtqnum+7noCgs0WttGYwGTYBLk+wX7tv3hnkrfa9G1URvLjfJgAD8
	fTdPBJPRitN9E8NOZ8YEH80j7XYCXio=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708705701;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oppnL8CvUq6dqNuLyHeui3UjQKunxHeertMxdEMAQbo=;
	b=hzQKqqwPpITAOD5J1+f840eBmGZyRz78lIaiHXZDSm0sZbcAc3FktNQalmOOQrW5Lqwt0Q
	KNfY7iG+xAIts2Dw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1708705701; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oppnL8CvUq6dqNuLyHeui3UjQKunxHeertMxdEMAQbo=;
	b=GGBPn6DxYfAXjgn+wCFlXdd041jd7vLnuHhnmCtvVxVfdtdaCFKzHthpcB5zOKOci9QSEk
	hnjnKc1QOPR9TBYyKAtqnum+7noCgs0WttGYwGTYBLk+wX7tv3hnkrfa9G1URvLjfJgAD8
	fTdPBJPRitN9E8NOZ8YEH80j7XYCXio=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708705701;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oppnL8CvUq6dqNuLyHeui3UjQKunxHeertMxdEMAQbo=;
	b=hzQKqqwPpITAOD5J1+f840eBmGZyRz78lIaiHXZDSm0sZbcAc3FktNQalmOOQrW5Lqwt0Q
	KNfY7iG+xAIts2Dw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3DDF4133DC;
	Fri, 23 Feb 2024 16:28:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id IE3BDaXH2GWaMQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 23 Feb 2024 16:28:21 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 20/24] ALSA: seq: prioq: Use guard() for locking
Date: Fri, 23 Feb 2024 17:28:06 +0100
Message-Id: <20240223162810.32302-21-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240223162810.32302-1-tiwai@suse.de>
References: <20240223162810.32302-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=GGBPn6Dx;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=hzQKqqwP
X-Spamd-Result: default: False [-0.31 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 FROM_HAS_DN(0.00)[];
	 DWL_DNSWL_MED(-2.00)[suse.de:dkim];
	 R_MISSING_CHARSET(2.50)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 TO_DN_NONE(0.00)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 RCPT_COUNT_ONE(0.00)[1];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 DKIM_TRACE(0.00)[suse.de:+];
	 MX_GOOD(-0.01)[];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-3.00)[100.00%]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: -0.31
X-Rspamd-Queue-Id: 6606E1FD42
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Bar: /

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

