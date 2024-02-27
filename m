Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3FFA130E48
	for <linux-sound@vger.kernel.org>; Tue, 27 Feb 2024 08:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709024001; cv=none; b=UAVeGt/A0F4BYEib+rn9q40z72wmZfVuvAkd8hwgqDn3K0rUnuOA6MFvwcjh8yKgAInOxgJxYBZpsFh5igLrHkZj0HOFpHAoHWa7O+lV/HWv4GBM/8sS2SNkP8w+pM0dVSmoIZMOVcRQf7ev+OJrDU1fbeYvwF2lbHOfzlBl0V0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709024001; c=relaxed/simple;
	bh=gygIKwEkavjiWXGvaVa5Qg5Bl5QXflfS78iLi6OECrs=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IWnvM3AimcbsvcVfZGeNEmcF/fONpm77hftbIBPMbgmwZv9Y7FXVi6ksD6bkNV6Xih/HFEIRkGOrpZZ7jWnaVm2VCrCvMZMPiejpgtrQCcLCkiY5xJd3BeHvxRf8sfYWgMCaKSa2UypExgRhqaBv2IJ+pV11NOxANn6hMKmK1UE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=QShrd6At; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=SDiovcGU; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=QShrd6At; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=SDiovcGU; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="QShrd6At";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="SDiovcGU";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="QShrd6At";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="SDiovcGU"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id DB5B91F44B;
	Tue, 27 Feb 2024 08:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1709023995; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rIAwnvxEhV0TY75S5jGiOs3a+A4mAuLIQABMFXch6vw=;
	b=QShrd6AtVWVF6WhGa/Mlev0kxUjOq/6hHYfdpJm2sauYnUVm1T9zaT5JwIs15sSC1z8M9+
	OhDhDvlm4va/RpsvRqDkc7+GN9yY1hrfQU7rNUvv9lykz8HLBrO3t5adwZRnOPXpKQIIHI
	vBiPaXmivGvt9NuPNT0hVr3tdO6wAbA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1709023995;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rIAwnvxEhV0TY75S5jGiOs3a+A4mAuLIQABMFXch6vw=;
	b=SDiovcGUt6OgW+BsAZp0Y5wz5u2RXbdczGVPj+K3+8jxUQkGyJ5w04Ezlpq+96rRAU/Spe
	/8msyYvNJuWKrbDQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1709023995; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rIAwnvxEhV0TY75S5jGiOs3a+A4mAuLIQABMFXch6vw=;
	b=QShrd6AtVWVF6WhGa/Mlev0kxUjOq/6hHYfdpJm2sauYnUVm1T9zaT5JwIs15sSC1z8M9+
	OhDhDvlm4va/RpsvRqDkc7+GN9yY1hrfQU7rNUvv9lykz8HLBrO3t5adwZRnOPXpKQIIHI
	vBiPaXmivGvt9NuPNT0hVr3tdO6wAbA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1709023995;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rIAwnvxEhV0TY75S5jGiOs3a+A4mAuLIQABMFXch6vw=;
	b=SDiovcGUt6OgW+BsAZp0Y5wz5u2RXbdczGVPj+K3+8jxUQkGyJ5w04Ezlpq+96rRAU/Spe
	/8msyYvNJuWKrbDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C1EAA13AD7;
	Tue, 27 Feb 2024 08:53:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 6NYrLvui3WWeaQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 27 Feb 2024 08:53:15 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH v3 13/24] ALSA: seq: memory: Use guard() for locking
Date: Tue, 27 Feb 2024 09:52:55 +0100
Message-Id: <20240227085306.9764-14-tiwai@suse.de>
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
X-Spam-Level: 
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=QShrd6At;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=SDiovcGU
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-2.83 / 50.00];
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
	 DWL_DNSWL_HI(-3.50)[suse.de:dkim];
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
	 NEURAL_HAM_SHORT(-0.02)[-0.115];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-3.00)[100.00%]
X-Spam-Score: -2.83
X-Rspamd-Queue-Id: DB5B91F44B
X-Spam-Flag: NO

We can simplify the code gracefully with new guard() macro and co for
automatic cleanup of locks.

Only the code refactoring, and no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/seq/seq_memory.c | 28 ++++++++++------------------
 1 file changed, 10 insertions(+), 18 deletions(-)

diff --git a/sound/core/seq/seq_memory.c b/sound/core/seq/seq_memory.c
index e705e7538118..20155e3e87c6 100644
--- a/sound/core/seq/seq_memory.c
+++ b/sound/core/seq/seq_memory.c
@@ -232,7 +232,6 @@ static inline void free_cell(struct snd_seq_pool *pool,
 
 void snd_seq_cell_free(struct snd_seq_event_cell * cell)
 {
-	unsigned long flags;
 	struct snd_seq_pool *pool;
 
 	if (snd_BUG_ON(!cell))
@@ -241,7 +240,7 @@ void snd_seq_cell_free(struct snd_seq_event_cell * cell)
 	if (snd_BUG_ON(!pool))
 		return;
 
-	spin_lock_irqsave(&pool->lock, flags);
+	guard(spinlock_irqsave)(&pool->lock);
 	free_cell(pool, cell);
 	if (snd_seq_ev_is_variable(&cell->event)) {
 		if (cell->event.data.ext.len & SNDRV_SEQ_EXT_CHAINED) {
@@ -259,7 +258,6 @@ void snd_seq_cell_free(struct snd_seq_event_cell * cell)
 		if (snd_seq_output_ok(pool))
 			wake_up(&pool->output_sleep);
 	}
-	spin_unlock_irqrestore(&pool->lock, flags);
 }
 
 
@@ -449,9 +447,8 @@ int snd_seq_pool_init(struct snd_seq_pool *pool)
 		return -ENOMEM;
 
 	/* add new cells to the free cell list */
-	spin_lock_irq(&pool->lock);
+	guard(spinlock_irq)(&pool->lock);
 	if (pool->ptr) {
-		spin_unlock_irq(&pool->lock);
 		kvfree(cellptr);
 		return 0;
 	}
@@ -470,20 +467,16 @@ int snd_seq_pool_init(struct snd_seq_pool *pool)
 	/* init statistics */
 	pool->max_used = 0;
 	pool->total_elements = pool->size;
-	spin_unlock_irq(&pool->lock);
 	return 0;
 }
 
 /* refuse the further insertion to the pool */
 void snd_seq_pool_mark_closing(struct snd_seq_pool *pool)
 {
-	unsigned long flags;
-
 	if (snd_BUG_ON(!pool))
 		return;
-	spin_lock_irqsave(&pool->lock, flags);
+	guard(spinlock_irqsave)(&pool->lock);
 	pool->closing = 1;
-	spin_unlock_irqrestore(&pool->lock, flags);
 }
 
 /* remove events */
@@ -502,18 +495,17 @@ int snd_seq_pool_done(struct snd_seq_pool *pool)
 		schedule_timeout_uninterruptible(1);
 	
 	/* release all resources */
-	spin_lock_irq(&pool->lock);
-	ptr = pool->ptr;
-	pool->ptr = NULL;
-	pool->free = NULL;
-	pool->total_elements = 0;
-	spin_unlock_irq(&pool->lock);
+	scoped_guard(spinlock_irq, &pool->lock) {
+		ptr = pool->ptr;
+		pool->ptr = NULL;
+		pool->free = NULL;
+		pool->total_elements = 0;
+	}
 
 	kvfree(ptr);
 
-	spin_lock_irq(&pool->lock);
+	guard(spinlock_irq)(&pool->lock);
 	pool->closing = 0;
-	spin_unlock_irq(&pool->lock);
 
 	return 0;
 }
-- 
2.35.3

