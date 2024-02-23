Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5696813DBB8
	for <linux-sound@vger.kernel.org>; Fri, 23 Feb 2024 17:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708710616; cv=none; b=cxGv6IetDsZqQtcZTaCKJJUWggDnbCii/2Ugz1phYx3PBGZZD3tfMmj1f2XJ22jfI+jLkufDukqZF9qCopB/OZMot/V3i+YAPoE+2gM7a24niLimTMe0IaDQ2h8/QokiuhSRE4+e4dk64IpSOvljENZg2Y0l/h1olfBgnHdB1tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708710616; c=relaxed/simple;
	bh=tbGyeoK7+fVhd1jjUNOkEVdpOD93vHovUKv+xnfZUGs=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TveefIXq5WYvJjlzSHEpMOrEcVocg2crzKRtRk3LUYAFPbdt7cdMXf+Sbs95lf0jW2RD+N7QoBuYCJ5NGA6ajq6obMFkvvJ9rZ/lktr80s+TOvzIlRan4IyHI2c/E6x6SDzKBb2sOo1txMEvG6ws0MV5vR6Kaoc40kSfAX/Q7tU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=RUw9qUG5; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=UKNA8XYW; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=RUw9qUG5; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=UKNA8XYW; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="RUw9qUG5";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="UKNA8XYW";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="RUw9qUG5";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="UKNA8XYW"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 9905C221CD;
	Fri, 23 Feb 2024 17:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1708710612; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LZ3i5Wmg0ThAZTjaTnOLCJLI2pL63XkiPFVUkDwcsts=;
	b=RUw9qUG5I9iujMrEXP++wPXWOK9gcwOo8izgUqxZq14NjmwSO52mPSE/JJcnEnGVu3T78K
	Y4B/YGUHeZZn+Ie6Q3TDiudfwA4dlJsAHIqQ9OK4Rg/JuVENyk/QigDlUTOGO0s2LB1/Vn
	NBmDJKeIYS9r3doEe4blE4d4fEmzHvA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708710612;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LZ3i5Wmg0ThAZTjaTnOLCJLI2pL63XkiPFVUkDwcsts=;
	b=UKNA8XYWfFnl+1vUSVAQgW5uvQ710mpXLV2bB8Y4+G1tffxw4RIPGeJJZ5u2ZHtK/O7kV/
	DWft6U7opMw3vkBg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1708710612; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LZ3i5Wmg0ThAZTjaTnOLCJLI2pL63XkiPFVUkDwcsts=;
	b=RUw9qUG5I9iujMrEXP++wPXWOK9gcwOo8izgUqxZq14NjmwSO52mPSE/JJcnEnGVu3T78K
	Y4B/YGUHeZZn+Ie6Q3TDiudfwA4dlJsAHIqQ9OK4Rg/JuVENyk/QigDlUTOGO0s2LB1/Vn
	NBmDJKeIYS9r3doEe4blE4d4fEmzHvA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708710612;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LZ3i5Wmg0ThAZTjaTnOLCJLI2pL63XkiPFVUkDwcsts=;
	b=UKNA8XYWfFnl+1vUSVAQgW5uvQ710mpXLV2bB8Y4+G1tffxw4RIPGeJJZ5u2ZHtK/O7kV/
	DWft6U7opMw3vkBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 67F8B13AC7;
	Fri, 23 Feb 2024 17:50:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id aDfaF9Ta2GW6RAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 23 Feb 2024 17:50:12 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH v2 12/24] ALSA: seq: fifo: Use guard() for locking
Date: Fri, 23 Feb 2024 18:49:49 +0100
Message-Id: <20240223175001.24375-13-tiwai@suse.de>
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
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=RUw9qUG5;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=UKNA8XYW
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
X-Rspamd-Queue-Id: 9905C221CD
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

