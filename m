Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD9442E3706
	for <linux-sound@vger.kernel.org>; Mon, 11 Aug 2025 10:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754908397; cv=none; b=D9bnAgTbflZtmfwH/yXw7KSx976kUa15xSPvbI+5EU06fOdV73EFykxW4U9QzZtLrrhMBYgN0SBncuoIR33b8UQPif+tDQ3ADLapqw1o1NTypJuY8G5wvL6gAZYKGIGXefvMTis0LSvuZtudjLE3CEMG+auPKyFSdJBmuqb+i9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754908397; c=relaxed/simple;
	bh=Yig66t7Uc+J6VPpjxzEWcVIVHbYvDKAH0t3jDJCiNvI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LKkiBX5Vl2++WHm3jGm2VYT9LjwwM1jqXn4ngFFcQ9jxz6WvMB/nNU1r5ra6C4H0tE245lPib9XIDxl3ARnK+iaTie9xpSKiewfJ2xdfhSxX9HG2uIlSm1Hoa4I5+Ml7dqXl1yB2/Bsx+WnjHgkOtwf3oGN3V4GlWKj/REpQQrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=sv22g+0d; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=LIjQKaXr; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=sv22g+0d; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=LIjQKaXr; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="sv22g+0d";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="LIjQKaXr";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="sv22g+0d";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="LIjQKaXr"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id CBB085BE07;
	Mon, 11 Aug 2025 10:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1754908374; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LwFD7R89FEFaCyoWWorYY91aIaW1CoO21p0y0B3vdws=;
	b=sv22g+0dunikYMF7cGzMV73JxTVDmguLIWasNt4jmHluPE8c4cTvYm0mmZvQ8wxW3WIKXx
	xGT/EZ7/XQoLbVF8k9qEnW0x6dTHDGI0fChCtlFUJMvOjZ1czVb9MYyQild1snhTYH+i16
	KOK8NDXIlzd/m7SbXVq2lI4SRDb/NwQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1754908374;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LwFD7R89FEFaCyoWWorYY91aIaW1CoO21p0y0B3vdws=;
	b=LIjQKaXr5LoiQ3dq39B0buENNqCX6Kjuk0i3mzDCA1Qh9uWdz+v4gHInqUkqmjLKRkT9KX
	QAixN+IT8KmmzmCw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=sv22g+0d;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=LIjQKaXr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1754908374; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LwFD7R89FEFaCyoWWorYY91aIaW1CoO21p0y0B3vdws=;
	b=sv22g+0dunikYMF7cGzMV73JxTVDmguLIWasNt4jmHluPE8c4cTvYm0mmZvQ8wxW3WIKXx
	xGT/EZ7/XQoLbVF8k9qEnW0x6dTHDGI0fChCtlFUJMvOjZ1czVb9MYyQild1snhTYH+i16
	KOK8NDXIlzd/m7SbXVq2lI4SRDb/NwQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1754908374;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LwFD7R89FEFaCyoWWorYY91aIaW1CoO21p0y0B3vdws=;
	b=LIjQKaXr5LoiQ3dq39B0buENNqCX6Kjuk0i3mzDCA1Qh9uWdz+v4gHInqUkqmjLKRkT9KX
	QAixN+IT8KmmzmCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B0D1813479;
	Mon, 11 Aug 2025 10:32:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id iEn1KdbGmWjEDgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 11 Aug 2025 10:32:54 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 07/11] ALSA: seq: Clean up fifo locking with guard
Date: Mon, 11 Aug 2025 12:32:43 +0200
Message-ID: <20250811103249.10644-8-tiwai@suse.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250811103249.10644-1-tiwai@suse.de>
References: <20250811103249.10644-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: CBB085BE07
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid,suse.de:email];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	TO_DN_NONE(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid,suse.de:email]
X-Spam-Score: -3.01

Yet more cleanup, now for seq_fifo.c about its refcount calls; the
manual refcount calls (either snd_use_lock_*() or snd_seq_fifo_lock())
are replaced with guard(snd_seq_fifo).

Only code refactoring, and no behavior change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/seq/seq_clientmgr.c |  3 +--
 sound/core/seq/seq_fifo.c      | 15 ++++-----------
 sound/core/seq/seq_fifo.h      |  1 +
 3 files changed, 6 insertions(+), 13 deletions(-)

diff --git a/sound/core/seq/seq_clientmgr.c b/sound/core/seq/seq_clientmgr.c
index 38ad5bbd2706..f9a6e497f997 100644
--- a/sound/core/seq/seq_clientmgr.c
+++ b/sound/core/seq/seq_clientmgr.c
@@ -416,7 +416,7 @@ static ssize_t snd_seq_read(struct file *file, char __user *buf, size_t count,
 
 	cell = NULL;
 	err = 0;
-	snd_seq_fifo_lock(fifo);
+	guard(snd_seq_fifo)(fifo);
 
 	if (IS_ENABLED(CONFIG_SND_SEQ_UMP) && client->midi_version > 0)
 		aligned_size = sizeof(struct snd_seq_ump_event);
@@ -474,7 +474,6 @@ static ssize_t snd_seq_read(struct file *file, char __user *buf, size_t count,
 		if (err == -EAGAIN && result > 0)
 			err = 0;
 	}
-	snd_seq_fifo_unlock(fifo);
 
 	return (err < 0) ? err : result;
 }
diff --git a/sound/core/seq/seq_fifo.c b/sound/core/seq/seq_fifo.c
index 3a10b081f129..f23c6b7ae240 100644
--- a/sound/core/seq/seq_fifo.c
+++ b/sound/core/seq/seq_fifo.c
@@ -106,12 +106,11 @@ int snd_seq_fifo_event_in(struct snd_seq_fifo *f,
 	if (snd_BUG_ON(!f))
 		return -EINVAL;
 
-	snd_use_lock_use(&f->use_lock);
+	guard(snd_seq_fifo)(f);
 	err = snd_seq_event_dup(f->pool, event, &cell, 1, NULL, NULL); /* always non-blocking */
 	if (err < 0) {
 		if ((err == -ENOMEM) || (err == -EAGAIN))
 			atomic_inc(&f->overflow);
-		snd_use_lock_free(&f->use_lock);
 		return err;
 	}
 		
@@ -130,8 +129,6 @@ int snd_seq_fifo_event_in(struct snd_seq_fifo *f,
 	if (waitqueue_active(&f->input_sleep))
 		wake_up(&f->input_sleep);
 
-	snd_use_lock_free(&f->use_lock);
-
 	return 0; /* success */
 
 }
@@ -263,14 +260,10 @@ int snd_seq_fifo_resize(struct snd_seq_fifo *f, int poolsize)
 /* get the number of unused cells safely */
 int snd_seq_fifo_unused_cells(struct snd_seq_fifo *f)
 {
-	int cells;
-
 	if (!f)
 		return 0;
 
-	snd_use_lock_use(&f->use_lock);
-	scoped_guard(spinlock_irqsave, &f->lock)
-		cells = snd_seq_unused_cells(f->pool);
-	snd_use_lock_free(&f->use_lock);
-	return cells;
+	guard(snd_seq_fifo)(f);
+	guard(spinlock_irqsave)(&f->lock);
+	return snd_seq_unused_cells(f->pool);
 }
diff --git a/sound/core/seq/seq_fifo.h b/sound/core/seq/seq_fifo.h
index b56a7b897c9c..4c9c49127746 100644
--- a/sound/core/seq/seq_fifo.h
+++ b/sound/core/seq/seq_fifo.h
@@ -37,6 +37,7 @@ int snd_seq_fifo_event_in(struct snd_seq_fifo *f, struct snd_seq_event *event);
 /* lock fifo from release */
 #define snd_seq_fifo_lock(fifo)		snd_use_lock_use(&(fifo)->use_lock)
 #define snd_seq_fifo_unlock(fifo)	snd_use_lock_free(&(fifo)->use_lock)
+DEFINE_GUARD(snd_seq_fifo, struct snd_seq_fifo *, snd_seq_fifo_lock(_T), snd_seq_fifo_unlock(_T))
 
 /* get a cell from fifo - fifo should be locked */
 int snd_seq_fifo_cell_out(struct snd_seq_fifo *f, struct snd_seq_event_cell **cellp, int nonblock);
-- 
2.50.1

