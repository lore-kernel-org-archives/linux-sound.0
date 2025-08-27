Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2186A2E1745
	for <linux-sound@vger.kernel.org>; Wed, 27 Aug 2025 08:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756281965; cv=none; b=BZ3OQl5Fg8xRAouiSOaBcrfGH4IZNTtQ01ybSy0rSBPyI1s2gstZNmmXTI88ZhZvyRHLwTRR038KU/JIBFzWH/mD6vkCvlWVQapeM2T7w85eR+X7V/2ydn3Snp4gHel7A5OKGXJudx3pE4MUIukXA404D6iC0mtiVzsgJIEhxsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756281965; c=relaxed/simple;
	bh=Yig66t7Uc+J6VPpjxzEWcVIVHbYvDKAH0t3jDJCiNvI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UHUn2cRJNcIMusF/H+gi0yNcj4nv1/HtQoqFktWFPg1gXEWxhmIJN8g083HtiKjWbuTCeEld9EUE/+EStx9s9vMdUkm+J5iwQpAsPjdcUe1G93HGtx+PBp5M9KfSKQn8LNE7VNKgFb+ymAXnoFXcMedhxpUOROr2tygML9QoEos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ihqOIR7k; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=XqIrlfb2; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ihqOIR7k; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=XqIrlfb2; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ihqOIR7k";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="XqIrlfb2";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ihqOIR7k";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="XqIrlfb2"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 25FCD1FEE7;
	Wed, 27 Aug 2025 08:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756281924; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LwFD7R89FEFaCyoWWorYY91aIaW1CoO21p0y0B3vdws=;
	b=ihqOIR7kEY2YV3SlARFy03AQr/QYN4OegjGqLuRL5FPKWWmIzZa8dh1xRUk/lH/c9dMhK8
	9ClmV0a79Jxm0QH89+KxmHomSxkOqzRxuzR3hEv0nBbv3ag4h312pgV463MyfMqY2Ms+4M
	v+OMqRNS/eqvgxQlZZt1Dh+TDWoRR0c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756281924;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LwFD7R89FEFaCyoWWorYY91aIaW1CoO21p0y0B3vdws=;
	b=XqIrlfb2YbwkhXThcJB/GALRTYzwkY/PVv0x6gkb0i1sF/SAwZM/sOHn3VoHD2Yb6DKHRL
	ApDT+gdXrxrmH1Bg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756281924; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LwFD7R89FEFaCyoWWorYY91aIaW1CoO21p0y0B3vdws=;
	b=ihqOIR7kEY2YV3SlARFy03AQr/QYN4OegjGqLuRL5FPKWWmIzZa8dh1xRUk/lH/c9dMhK8
	9ClmV0a79Jxm0QH89+KxmHomSxkOqzRxuzR3hEv0nBbv3ag4h312pgV463MyfMqY2Ms+4M
	v+OMqRNS/eqvgxQlZZt1Dh+TDWoRR0c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756281924;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LwFD7R89FEFaCyoWWorYY91aIaW1CoO21p0y0B3vdws=;
	b=XqIrlfb2YbwkhXThcJB/GALRTYzwkY/PVv0x6gkb0i1sF/SAwZM/sOHn3VoHD2Yb6DKHRL
	ApDT+gdXrxrmH1Bg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0254D13310;
	Wed, 27 Aug 2025 08:05:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id mJ8ZO0O8rmgHdwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 27 Aug 2025 08:05:23 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH v2 07/11] ALSA: seq: Clean up fifo locking with guard
Date: Wed, 27 Aug 2025 10:05:13 +0200
Message-ID: <20250827080520.7544-8-tiwai@suse.de>
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
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Score: -2.80

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

