Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 117BB31CA76
	for <linux-sound@vger.kernel.org>; Fri, 29 Aug 2025 14:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756479221; cv=none; b=ppuxPjBSNvodkQXgY967VjjIEF2ZyJFO0vwJVtpty+Fs2rjrVMAy/niQJUX0ltcgyC7Tj+H7kjZ0YD2Awqow1jpW/kyKTiJ5hPekiFqzHZgxoY4aSiPi42aFfqv/YhXV0HP38q/wlZ6144puGE1t1TReIXOGYPKrHPYwNwZ7qmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756479221; c=relaxed/simple;
	bh=BePFn1pq5Om3fZnQdrhsR+OP067iGbTAztlU7KdYObE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kETnb6AvyIGW4/wEL0Jkd92CTe7n1ESYE5ORQW6Xfr/1hC12frJTYWLXWT/9+MvctuYZSoI6SdjX2rqekPuTjmfgFPlpteixbgsxaN6+YAnQsYIngaH4pr4JSE7I/EXrvm6c8pbuwiKrmn6dSKcsH5DMdfhZwG/Zww57SFU0S8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=T8amjuBx; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Vkw/IvVx; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=T8amjuBx; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Vkw/IvVx; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="T8amjuBx";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Vkw/IvVx";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="T8amjuBx";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Vkw/IvVx"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 9E49D5C244;
	Fri, 29 Aug 2025 14:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756479191; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0Y03CuzjxxmybvObGerUqSMPAfAocVp1EtscjMCpXGk=;
	b=T8amjuBx1oG7Z1y4dQ6pxmZEuBBl0P7qkg1FYKlcHiWDVY43QPlJ5h5liRcy3js4zQGRH1
	Yxrh4WSO5S8LNSRmhAv2jqm0zWXNaGcTFyy1hnMUqVLdwfy6Sf3U26fSGkLmtVQJmGKIzZ
	irp121D6vsadIfuPymBqMippIDP7X04=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756479191;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0Y03CuzjxxmybvObGerUqSMPAfAocVp1EtscjMCpXGk=;
	b=Vkw/IvVx6LfCpl+WYI3huv72lU/cGYIBmxgPW023Ef06FYs+SN3kBEwphvSa5goFTCGZs7
	WHZUbviZN9ayRRCw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756479191; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0Y03CuzjxxmybvObGerUqSMPAfAocVp1EtscjMCpXGk=;
	b=T8amjuBx1oG7Z1y4dQ6pxmZEuBBl0P7qkg1FYKlcHiWDVY43QPlJ5h5liRcy3js4zQGRH1
	Yxrh4WSO5S8LNSRmhAv2jqm0zWXNaGcTFyy1hnMUqVLdwfy6Sf3U26fSGkLmtVQJmGKIzZ
	irp121D6vsadIfuPymBqMippIDP7X04=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756479191;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0Y03CuzjxxmybvObGerUqSMPAfAocVp1EtscjMCpXGk=;
	b=Vkw/IvVx6LfCpl+WYI3huv72lU/cGYIBmxgPW023Ef06FYs+SN3kBEwphvSa5goFTCGZs7
	WHZUbviZN9ayRRCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 842BC13A54;
	Fri, 29 Aug 2025 14:53:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 2JYhH9e+sWhzGwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 29 Aug 2025 14:53:11 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 07/18] ALSA: gus: Use guard() for mutex locks
Date: Fri, 29 Aug 2025 16:52:47 +0200
Message-ID: <20250829145300.5460-8-tiwai@suse.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250829145300.5460-1-tiwai@suse.de>
References: <20250829145300.5460-1-tiwai@suse.de>
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

Replace the manual mutex lock/unlock pairs with guard() for code
simplification.

As replaced with the guard(mutex), no longer used snd_gf1_mem_lock()
is dropped, too.

Only code refactoring, and no behavior change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/gus.h      |  1 -
 sound/isa/gus/gus_dma.c  | 10 +++-------
 sound/isa/gus/gus_main.c |  1 -
 sound/isa/gus/gus_mem.c  | 33 ++++++---------------------------
 4 files changed, 9 insertions(+), 36 deletions(-)

diff --git a/include/sound/gus.h b/include/sound/gus.h
index 1c8fb6c93e50..321ae93625eb 100644
--- a/include/sound/gus.h
+++ b/include/sound/gus.h
@@ -515,7 +515,6 @@ struct _SND_IW_LFO_PROGRAM {
 
 /* gus_mem.c */
 
-void snd_gf1_mem_lock(struct snd_gf1_mem * alloc, int xup);
 int snd_gf1_mem_xfree(struct snd_gf1_mem * alloc, struct snd_gf1_mem_block * block);
 struct snd_gf1_mem_block *snd_gf1_mem_alloc(struct snd_gf1_mem * alloc, int owner,
 				       char *name, int size, int w_16,
diff --git a/sound/isa/gus/gus_dma.c b/sound/isa/gus/gus_dma.c
index bb5a4e2fbfb3..7b2e7878adc7 100644
--- a/sound/isa/gus/gus_dma.c
+++ b/sound/isa/gus/gus_dma.c
@@ -143,18 +143,15 @@ static void snd_gf1_dma_interrupt(struct snd_gus_card * gus)
 
 int snd_gf1_dma_init(struct snd_gus_card * gus)
 {
-	mutex_lock(&gus->dma_mutex);
+	guard(mutex)(&gus->dma_mutex);
 	gus->gf1.dma_shared++;
-	if (gus->gf1.dma_shared > 1) {
-		mutex_unlock(&gus->dma_mutex);
+	if (gus->gf1.dma_shared > 1)
 		return 0;
-	}
 	gus->gf1.interrupt_handler_dma_write = snd_gf1_dma_interrupt;
 	gus->gf1.dma_data_pcm = 
 	gus->gf1.dma_data_pcm_last =
 	gus->gf1.dma_data_synth = 
 	gus->gf1.dma_data_synth_last = NULL;
-	mutex_unlock(&gus->dma_mutex);
 	return 0;
 }
 
@@ -162,7 +159,7 @@ int snd_gf1_dma_done(struct snd_gus_card * gus)
 {
 	struct snd_gf1_dma_block *block;
 
-	mutex_lock(&gus->dma_mutex);
+	guard(mutex)(&gus->dma_mutex);
 	gus->gf1.dma_shared--;
 	if (!gus->gf1.dma_shared) {
 		snd_dma_disable(gus->gf1.dma1);
@@ -179,7 +176,6 @@ int snd_gf1_dma_done(struct snd_gus_card * gus)
 		gus->gf1.dma_data_pcm_last =
 		gus->gf1.dma_data_synth_last = NULL;
 	}
-	mutex_unlock(&gus->dma_mutex);
 	return 0;
 }
 
diff --git a/sound/isa/gus/gus_main.c b/sound/isa/gus/gus_main.c
index 873ef4046cd6..a82185c86143 100644
--- a/sound/isa/gus/gus_main.c
+++ b/sound/isa/gus/gus_main.c
@@ -447,4 +447,3 @@ EXPORT_SYMBOL(snd_gf1_translate_freq);
 EXPORT_SYMBOL(snd_gf1_mem_alloc);
 EXPORT_SYMBOL(snd_gf1_mem_xfree);
 EXPORT_SYMBOL(snd_gf1_mem_free);
-EXPORT_SYMBOL(snd_gf1_mem_lock);
diff --git a/sound/isa/gus/gus_mem.c b/sound/isa/gus/gus_mem.c
index 054058779db6..8d95d8d5abdf 100644
--- a/sound/isa/gus/gus_mem.c
+++ b/sound/isa/gus/gus_mem.c
@@ -15,15 +15,6 @@ static void snd_gf1_mem_info_read(struct snd_info_entry *entry,
 				  struct snd_info_buffer *buffer);
 #endif
 
-void snd_gf1_mem_lock(struct snd_gf1_mem * alloc, int xup)
-{
-	if (!xup) {
-		mutex_lock(&alloc->memory_mutex);
-	} else {
-		mutex_unlock(&alloc->memory_mutex);
-	}
-}
-
 static struct snd_gf1_mem_block *
 snd_gf1_mem_xalloc(struct snd_gf1_mem *alloc, struct snd_gf1_mem_block *block,
 		   const char *name)
@@ -50,7 +41,6 @@ snd_gf1_mem_xalloc(struct snd_gf1_mem *alloc, struct snd_gf1_mem_block *block,
 				alloc->first = nblock;
 			else
 				nblock->prev->next = nblock;
-			mutex_unlock(&alloc->memory_mutex);
 			return nblock;
 		}
 		pblock = pblock->next;
@@ -71,7 +61,6 @@ int snd_gf1_mem_xfree(struct snd_gf1_mem * alloc, struct snd_gf1_mem_block * blo
 {
 	if (block->share) {	/* ok.. shared block */
 		block->share--;
-		mutex_unlock(&alloc->memory_mutex);
 		return 0;
 	}
 	if (alloc->first == block) {
@@ -183,7 +172,7 @@ struct snd_gf1_mem_block *snd_gf1_mem_alloc(struct snd_gf1_mem * alloc, int owne
 {
 	struct snd_gf1_mem_block block, *nblock;
 
-	snd_gf1_mem_lock(alloc, 0);
+	guard(mutex)(&alloc->memory_mutex);
 	if (share_id != NULL) {
 		nblock = snd_gf1_mem_share(alloc, share_id);
 		if (nblock != NULL) {
@@ -193,36 +182,27 @@ struct snd_gf1_mem_block *snd_gf1_mem_alloc(struct snd_gf1_mem * alloc, int owne
 				goto __std;
 			}
 			nblock->share++;
-			snd_gf1_mem_lock(alloc, 1);
 			return NULL;
 		}
 	}
       __std:
-	if (snd_gf1_mem_find(alloc, &block, size, w_16, align) < 0) {
-		snd_gf1_mem_lock(alloc, 1);
+	if (snd_gf1_mem_find(alloc, &block, size, w_16, align) < 0)
 		return NULL;
-	}
 	if (share_id != NULL)
 		memcpy(&block.share_id, share_id, sizeof(block.share_id));
 	block.owner = owner;
 	nblock = snd_gf1_mem_xalloc(alloc, &block, name);
-	snd_gf1_mem_lock(alloc, 1);
 	return nblock;
 }
 
 int snd_gf1_mem_free(struct snd_gf1_mem * alloc, unsigned int address)
 {
-	int result;
 	struct snd_gf1_mem_block *block;
 
-	snd_gf1_mem_lock(alloc, 0);
+	guard(mutex)(&alloc->memory_mutex);
 	block = snd_gf1_mem_look(alloc, address);
-	if (block) {
-		result = snd_gf1_mem_xfree(alloc, block);
-		snd_gf1_mem_lock(alloc, 1);
-		return result;
-	}
-	snd_gf1_mem_lock(alloc, 1);
+	if (block)
+		return snd_gf1_mem_xfree(alloc, block);
 	return -EINVAL;
 }
 
@@ -282,7 +262,7 @@ static void snd_gf1_mem_info_read(struct snd_info_entry *entry,
 
 	gus = entry->private_data;
 	alloc = &gus->gf1.mem_alloc;
-	mutex_lock(&alloc->memory_mutex);
+	guard(mutex)(&alloc->memory_mutex);
 	snd_iprintf(buffer, "8-bit banks       : \n    ");
 	for (i = 0; i < 4; i++)
 		snd_iprintf(buffer, "0x%06x (%04ik)%s", alloc->banks_8[i].address, alloc->banks_8[i].size >> 10, i + 1 < 4 ? "," : "");
@@ -326,7 +306,6 @@ static void snd_gf1_mem_info_read(struct snd_info_entry *entry,
 	}
 	snd_iprintf(buffer, "  Total: memory = %i, used = %i, free = %i\n",
 		    total, used, total - used);
-	mutex_unlock(&alloc->memory_mutex);
 #if 0
 	ultra_iprintf(buffer, "  Verify: free = %i, max 8-bit block = %i, max 16-bit block = %i\n",
 		      ultra_memory_free_size(card, &card->gf1.mem_alloc),
-- 
2.50.1

