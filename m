Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A81A1BDC3
	for <linux-sound@vger.kernel.org>; Thu,  1 Aug 2024 06:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722494858; cv=none; b=fA1ccpLFk8+mXtwZqjDWqaX/cYd6vW3FkvjT8rH+IPWE2aVli3TAT5jYIHG7k+zuSlILDNELrqiYtwWuV5PHhV9KV/uZJdYzxlbfQLLGn8jl4pg+aF+XfW0d+woza/2A48dBd9N/ffq8bEOnck4TQxPokbBlui4QOMPMQh9yBQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722494858; c=relaxed/simple;
	bh=7mwcXDiovWq3V5Z2AvQTmis11ULpqhbZ0f0L6/60anA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VXjoySskHth6f33yS98pWRBsAGzKp3QkJLspgUxpcDFHUj9kJAdpwwaF5X2mORM0HLslSQVuHR7RLTRPQaC8DtMlN3fo+hCf2sBC+6lwH4iXt35YcL3UHbwAwfVHNV5ZbY0ZBZ7mWnaReX8NUYPUV5ohkJ7RZBZsG/X+yI3ifW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=c/XZJLfo; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=oyMPSy1f; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=c/XZJLfo; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=oyMPSy1f; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="c/XZJLfo";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="oyMPSy1f";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="c/XZJLfo";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="oyMPSy1f"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 45D5F21B14;
	Thu,  1 Aug 2024 06:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1722494855; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D6jpzC6xCGlFpmFhoVC3p/488CdIAsWgSEFoUgVWqFo=;
	b=c/XZJLfoau+2J+y4p9ol1sO+U+UxvBLHFza6/O8RZpjeRijPiQqbmlja4lc7f7+g0n9zuB
	+SA9U3Eo80OpNlPFJZxjZSxSMkKYpNtJCdRzKQ0TibKyPO5+nV3wv8/gzq+NAx6XhsSxHa
	oislYkFGyDfOK7++G8N/bAolaq5+ca8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1722494855;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D6jpzC6xCGlFpmFhoVC3p/488CdIAsWgSEFoUgVWqFo=;
	b=oyMPSy1fPtey65ss0eoKnN6UfG+Tl/vGopf49MBssvQHCY5PDn6WXQMBB9F/uPHOwi4Y0g
	EJiGlo7e+GNNJtCw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="c/XZJLfo";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=oyMPSy1f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1722494855; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D6jpzC6xCGlFpmFhoVC3p/488CdIAsWgSEFoUgVWqFo=;
	b=c/XZJLfoau+2J+y4p9ol1sO+U+UxvBLHFza6/O8RZpjeRijPiQqbmlja4lc7f7+g0n9zuB
	+SA9U3Eo80OpNlPFJZxjZSxSMkKYpNtJCdRzKQ0TibKyPO5+nV3wv8/gzq+NAx6XhsSxHa
	oislYkFGyDfOK7++G8N/bAolaq5+ca8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1722494855;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D6jpzC6xCGlFpmFhoVC3p/488CdIAsWgSEFoUgVWqFo=;
	b=oyMPSy1fPtey65ss0eoKnN6UfG+Tl/vGopf49MBssvQHCY5PDn6WXQMBB9F/uPHOwi4Y0g
	EJiGlo7e+GNNJtCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2CD2D136CF;
	Thu,  1 Aug 2024 06:47:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 0EWQCYcvq2bScgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 01 Aug 2024 06:47:35 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 2/2] ALSA: memalloc: Let IOMMU handle S/G primarily
Date: Thu,  1 Aug 2024 08:48:06 +0200
Message-ID: <20240801064808.31205-2-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240801064808.31205-1-tiwai@suse.de>
References: <20240801064808.31205-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [0.19 / 50.00];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_ONE(0.00)[1];
	TO_DN_NONE(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spamd-Bar: /
X-Rspamd-Queue-Id: 45D5F21B14
X-Spam-Level: 
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: 0.19

The recent changes in IOMMU made the non-contiguous page allocations
as default, hence we can simply use the standard DMA allocation for
the S/G pages as well.  In this patch, we simplify the code by trying
the standard DMA allocation at first, instead of
dma_alloc_noncontiguous().

For the case without IOMMU, we still need to manage the S/G pages
manually, so we keep the same fallback routines like before.

The fallback types (SNDRV_DMA_TYPE_DEV_SG_FALLBACK & co) are dropped /
folded into SNDRV_DMA_TYPE_DEV_SG and co now.  The allocation via the
standard DMA call overrides the type accordingly, hence we don't have
to have extra fallback types any longer.  OTOH, SNDRV_DMA_TYPE_DEV_SG
is no longer an alias but became its own type back again.

Note that this patch requires another prerequisite fix for memmalloc
helper to use the DMA API for WC pages on x86.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=219087
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/memalloc.h |   7 +--
 sound/core/memalloc.c    | 107 ++++++++++++---------------------------
 2 files changed, 34 insertions(+), 80 deletions(-)

diff --git a/include/sound/memalloc.h b/include/sound/memalloc.h
index 43d524580bd2..9dd475cf4e8c 100644
--- a/include/sound/memalloc.h
+++ b/include/sound/memalloc.h
@@ -42,17 +42,12 @@ struct snd_dma_device {
 #define SNDRV_DMA_TYPE_NONCONTIG	8	/* non-coherent SG buffer */
 #define SNDRV_DMA_TYPE_NONCOHERENT	9	/* non-coherent buffer */
 #ifdef CONFIG_SND_DMA_SGBUF
-#define SNDRV_DMA_TYPE_DEV_SG		SNDRV_DMA_TYPE_NONCONTIG
+#define SNDRV_DMA_TYPE_DEV_SG		3	/* S/G pages */
 #define SNDRV_DMA_TYPE_DEV_WC_SG	6	/* SG write-combined */
 #else
 #define SNDRV_DMA_TYPE_DEV_SG	SNDRV_DMA_TYPE_DEV /* no SG-buf support */
 #define SNDRV_DMA_TYPE_DEV_WC_SG	SNDRV_DMA_TYPE_DEV_WC
 #endif
-/* fallback types, don't use those directly */
-#ifdef CONFIG_SND_DMA_SGBUF
-#define SNDRV_DMA_TYPE_DEV_SG_FALLBACK		10
-#define SNDRV_DMA_TYPE_DEV_WC_SG_FALLBACK	11
-#endif
 
 /*
  * info for buffer allocation
diff --git a/sound/core/memalloc.c b/sound/core/memalloc.c
index 428652fda926..f3ad9f85adf1 100644
--- a/sound/core/memalloc.c
+++ b/sound/core/memalloc.c
@@ -26,10 +26,6 @@
 
 static const struct snd_malloc_ops *snd_dma_get_ops(struct snd_dma_buffer *dmab);
 
-#ifdef CONFIG_SND_DMA_SGBUF
-static void *snd_dma_sg_fallback_alloc(struct snd_dma_buffer *dmab, size_t size);
-#endif
-
 static void *__snd_dma_alloc_pages(struct snd_dma_buffer *dmab, size_t size)
 {
 	const struct snd_malloc_ops *ops = snd_dma_get_ops(dmab);
@@ -540,16 +536,8 @@ static void *snd_dma_noncontig_alloc(struct snd_dma_buffer *dmab, size_t size)
 	struct sg_table *sgt;
 	void *p;
 
-#ifdef CONFIG_SND_DMA_SGBUF
-	if (cpu_feature_enabled(X86_FEATURE_XENPV))
-		return snd_dma_sg_fallback_alloc(dmab, size);
-#endif
 	sgt = dma_alloc_noncontiguous(dmab->dev.dev, size, dmab->dev.dir,
 				      DEFAULT_GFP, 0);
-#ifdef CONFIG_SND_DMA_SGBUF
-	if (!sgt && x86_fallback(dmab))
-		return snd_dma_sg_fallback_alloc(dmab, size);
-#endif
 	if (!sgt)
 		return NULL;
 
@@ -666,53 +654,7 @@ static const struct snd_malloc_ops snd_dma_noncontig_ops = {
 	.get_chunk_size = snd_dma_noncontig_get_chunk_size,
 };
 
-/* x86-specific SG-buffer with WC pages */
 #ifdef CONFIG_SND_DMA_SGBUF
-#define sg_wc_address(it) ((unsigned long)page_address(sg_page_iter_page(it)))
-
-static void *snd_dma_sg_wc_alloc(struct snd_dma_buffer *dmab, size_t size)
-{
-	void *p = snd_dma_noncontig_alloc(dmab, size);
-	struct sg_table *sgt = dmab->private_data;
-	struct sg_page_iter iter;
-
-	if (!p)
-		return NULL;
-	if (dmab->dev.type != SNDRV_DMA_TYPE_DEV_WC_SG)
-		return p;
-	for_each_sgtable_page(sgt, &iter, 0)
-		set_memory_wc(sg_wc_address(&iter), 1);
-	return p;
-}
-
-static void snd_dma_sg_wc_free(struct snd_dma_buffer *dmab)
-{
-	struct sg_table *sgt = dmab->private_data;
-	struct sg_page_iter iter;
-
-	for_each_sgtable_page(sgt, &iter, 0)
-		set_memory_wb(sg_wc_address(&iter), 1);
-	snd_dma_noncontig_free(dmab);
-}
-
-static int snd_dma_sg_wc_mmap(struct snd_dma_buffer *dmab,
-			      struct vm_area_struct *area)
-{
-	area->vm_page_prot = pgprot_writecombine(area->vm_page_prot);
-	return dma_mmap_noncontiguous(dmab->dev.dev, area,
-				      dmab->bytes, dmab->private_data);
-}
-
-static const struct snd_malloc_ops snd_dma_sg_wc_ops = {
-	.alloc = snd_dma_sg_wc_alloc,
-	.free = snd_dma_sg_wc_free,
-	.mmap = snd_dma_sg_wc_mmap,
-	.sync = snd_dma_noncontig_sync,
-	.get_addr = snd_dma_noncontig_get_addr,
-	.get_page = snd_dma_noncontig_get_page,
-	.get_chunk_size = snd_dma_noncontig_get_chunk_size,
-};
-
 /* Fallback SG-buffer allocations for x86 */
 struct snd_dma_sg_fallback {
 	bool use_dma_alloc_coherent;
@@ -750,6 +692,7 @@ static void __snd_dma_sg_fallback_free(struct snd_dma_buffer *dmab,
 	kfree(sgbuf);
 }
 
+/* fallback manual S/G buffer allocations */
 static void *snd_dma_sg_fallback_alloc(struct snd_dma_buffer *dmab, size_t size)
 {
 	struct snd_dma_sg_fallback *sgbuf;
@@ -759,12 +702,6 @@ static void *snd_dma_sg_fallback_alloc(struct snd_dma_buffer *dmab, size_t size)
 	dma_addr_t addr;
 	void *p;
 
-	/* correct the type */
-	if (dmab->dev.type == SNDRV_DMA_TYPE_DEV_SG)
-		dmab->dev.type = SNDRV_DMA_TYPE_DEV_SG_FALLBACK;
-	else if (dmab->dev.type == SNDRV_DMA_TYPE_DEV_WC_SG)
-		dmab->dev.type = SNDRV_DMA_TYPE_DEV_WC_SG_FALLBACK;
-
 	sgbuf = kzalloc(sizeof(*sgbuf), GFP_KERNEL);
 	if (!sgbuf)
 		return NULL;
@@ -809,7 +746,7 @@ static void *snd_dma_sg_fallback_alloc(struct snd_dma_buffer *dmab, size_t size)
 	if (!p)
 		goto error;
 
-	if (dmab->dev.type == SNDRV_DMA_TYPE_DEV_WC_SG_FALLBACK)
+	if (dmab->dev.type == SNDRV_DMA_TYPE_DEV_WC_SG)
 		set_pages_array_wc(sgbuf->pages, sgbuf->count);
 
 	dmab->private_data = sgbuf;
@@ -826,7 +763,7 @@ static void snd_dma_sg_fallback_free(struct snd_dma_buffer *dmab)
 {
 	struct snd_dma_sg_fallback *sgbuf = dmab->private_data;
 
-	if (dmab->dev.type == SNDRV_DMA_TYPE_DEV_WC_SG_FALLBACK)
+	if (dmab->dev.type == SNDRV_DMA_TYPE_DEV_WC_SG)
 		set_pages_array_wb(sgbuf->pages, sgbuf->count);
 	vunmap(dmab->area);
 	__snd_dma_sg_fallback_free(dmab, dmab->private_data);
@@ -846,13 +783,38 @@ static int snd_dma_sg_fallback_mmap(struct snd_dma_buffer *dmab,
 {
 	struct snd_dma_sg_fallback *sgbuf = dmab->private_data;
 
-	if (dmab->dev.type == SNDRV_DMA_TYPE_DEV_WC_SG_FALLBACK)
+	if (dmab->dev.type == SNDRV_DMA_TYPE_DEV_WC_SG)
 		area->vm_page_prot = pgprot_writecombine(area->vm_page_prot);
 	return vm_map_pages(area, sgbuf->pages, sgbuf->count);
 }
 
-static const struct snd_malloc_ops snd_dma_sg_fallback_ops = {
-	.alloc = snd_dma_sg_fallback_alloc,
+static void *snd_dma_sg_alloc(struct snd_dma_buffer *dmab, size_t size)
+{
+	int type = dmab->dev.type;
+	void *p;
+
+	if (cpu_feature_enabled(X86_FEATURE_XENPV))
+		return snd_dma_sg_fallback_alloc(dmab, size);
+
+	/* try the standard DMA API allocation at first */
+	if (type == SNDRV_DMA_TYPE_DEV_WC_SG)
+		dmab->dev.type = SNDRV_DMA_TYPE_DEV_WC;
+	else
+		dmab->dev.type = SNDRV_DMA_TYPE_DEV;
+	p = __snd_dma_alloc_pages(dmab, size);
+	if (p)
+		return p;
+
+	dmab->dev.type = type; /* restore the type */
+	/* if IOMMU is present but failed, give up */
+	if (!x86_fallback(dmab))
+		return NULL;
+	/* try fallback */
+	return snd_dma_sg_fallback_alloc(dmab, size);
+}
+
+static const struct snd_malloc_ops snd_dma_sg_ops = {
+	.alloc = snd_dma_sg_alloc,
 	.free = snd_dma_sg_fallback_free,
 	.mmap = snd_dma_sg_fallback_mmap,
 	.get_addr = snd_dma_sg_fallback_get_addr,
@@ -926,15 +888,12 @@ static const struct snd_malloc_ops *snd_dma_ops[] = {
 	[SNDRV_DMA_TYPE_NONCONTIG] = &snd_dma_noncontig_ops,
 	[SNDRV_DMA_TYPE_NONCOHERENT] = &snd_dma_noncoherent_ops,
 #ifdef CONFIG_SND_DMA_SGBUF
-	[SNDRV_DMA_TYPE_DEV_WC_SG] = &snd_dma_sg_wc_ops,
+	[SNDRV_DMA_TYPE_DEV_SG] = &snd_dma_sg_ops,
+	[SNDRV_DMA_TYPE_DEV_WC_SG] = &snd_dma_sg_ops,
 #endif
 #ifdef CONFIG_GENERIC_ALLOCATOR
 	[SNDRV_DMA_TYPE_DEV_IRAM] = &snd_dma_iram_ops,
 #endif /* CONFIG_GENERIC_ALLOCATOR */
-#ifdef CONFIG_SND_DMA_SGBUF
-	[SNDRV_DMA_TYPE_DEV_SG_FALLBACK] = &snd_dma_sg_fallback_ops,
-	[SNDRV_DMA_TYPE_DEV_WC_SG_FALLBACK] = &snd_dma_sg_fallback_ops,
-#endif
 #endif /* CONFIG_HAS_DMA */
 };
 
-- 
2.43.0

