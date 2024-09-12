Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9162192597
	for <linux-sound@vger.kernel.org>; Thu, 12 Sep 2024 15:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726156309; cv=none; b=jicK2G130mHepyhTvBPupC6S3HKSP02368Xi25KlOlGSLPst6lU1KnOEF/bAT+ZdoJQOQh5pIK3MKsfq6RX94anXLtdazeq+0UYRC8WZzNylCK5KoS6/TUS79qzgUyo08YRinFR8h33HBEybBS44WqLsuwoAoq4yDM5YrfLOcSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726156309; c=relaxed/simple;
	bh=1r3H+c434/+wMAbGgLPZEYeQ3LKhkiuEk3BmB5P/6Fk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t0N9xTzj+434zaoqbj2gqXm8RZdjaoSaFp39FB55YFN9Rv3hUCJFG9zyKihfQxqm43h0pOo5/8L49LRwkOeKun9ZaTprlA0GBV/dzSjtvTOVGJx8in/ba+fTN0e0+UpqtZoxLqkE4gIysVJ/ZciQneywIK2ghBxlKyvqkjAVdnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=e93JUziG; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=AIMFhH0w; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=e93JUziG; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=AIMFhH0w; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="e93JUziG";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="AIMFhH0w";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="e93JUziG";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="AIMFhH0w"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 31DCA21A1F;
	Thu, 12 Sep 2024 15:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1726156306; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bfHxjJl/1vPUXbavjXeuxJX/0hTeu8kq+fmPD26cq9w=;
	b=e93JUziGSsvDOPZW19I1g2bIg+MuaKbbE0RGh0Du4BO7nakwtOdHr7N0cKU59q+PMnosW8
	zWufGn2hP4QA9Dvpe16Mkm7t0x13ikzBR7o6afHDC6Cq8LSC5HMrVHKn1psV6sb/ke3VbT
	KPy9P5TC2lNPeQ+U3Lo6Y9dSIdTSN0I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1726156306;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bfHxjJl/1vPUXbavjXeuxJX/0hTeu8kq+fmPD26cq9w=;
	b=AIMFhH0wt1tGnxqLHHDliWzxAveVshN3wvDwntQKj+hs9BXzjooCUPwETUWHN59ulT9mNN
	j5ZSm/tVo9RTxHCQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1726156306; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bfHxjJl/1vPUXbavjXeuxJX/0hTeu8kq+fmPD26cq9w=;
	b=e93JUziGSsvDOPZW19I1g2bIg+MuaKbbE0RGh0Du4BO7nakwtOdHr7N0cKU59q+PMnosW8
	zWufGn2hP4QA9Dvpe16Mkm7t0x13ikzBR7o6afHDC6Cq8LSC5HMrVHKn1psV6sb/ke3VbT
	KPy9P5TC2lNPeQ+U3Lo6Y9dSIdTSN0I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1726156306;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bfHxjJl/1vPUXbavjXeuxJX/0hTeu8kq+fmPD26cq9w=;
	b=AIMFhH0wt1tGnxqLHHDliWzxAveVshN3wvDwntQKj+hs9BXzjooCUPwETUWHN59ulT9mNN
	j5ZSm/tVo9RTxHCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 15FF213A73;
	Thu, 12 Sep 2024 15:51:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id AOUqBBIO42ZTHwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 12 Sep 2024 15:51:46 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 2/2] ALSA: memalloc: Use proper DMA mapping API for x86 S/G buffer allocations
Date: Thu, 12 Sep 2024 17:52:25 +0200
Message-ID: <20240912155227.4078-3-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240912155227.4078-1-tiwai@suse.de>
References: <20240912155227.4078-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 

The fallback S/G buffer allocation for x86 used the addresses deduced
from the page allocations blindly.  It broke the allocations on IOMMU
and made us to work around with a hackish DMA ops check.

For cleaning up those messes, this patch switches to the proper DMA
mapping API usages with the standard sg-table instead.

By introducing the sg-table, the address table isn't needed, but for
keeping the original allocation sizes for freeing, replace it with the
array keeping the number of pages.

The get_addr callback is changed to use the existing one for
non-contiguous buffers.  (Also it's the reason sg_table is put at the
beginning of struct snd_dma_sg_fallback.)

And finally, the hackish workaround that checks the DMA ops is
dropped now.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/memalloc.c | 78 ++++++++++++++++++++-----------------------
 1 file changed, 36 insertions(+), 42 deletions(-)

diff --git a/sound/core/memalloc.c b/sound/core/memalloc.c
index 39e97f6fe8ac..13b71069ae18 100644
--- a/sound/core/memalloc.c
+++ b/sound/core/memalloc.c
@@ -680,43 +680,43 @@ static const struct snd_malloc_ops snd_dma_noncontig_ops = {
 #ifdef CONFIG_SND_DMA_SGBUF
 /* Fallback SG-buffer allocations for x86 */
 struct snd_dma_sg_fallback {
+	struct sg_table sgt; /* used by get_addr - must be the first item */
 	size_t count;
 	struct page **pages;
-	/* DMA address array; the first page contains #pages in ~PAGE_MASK */
-	dma_addr_t *addrs;
+	unsigned int *npages;
 };
 
 static void __snd_dma_sg_fallback_free(struct snd_dma_buffer *dmab,
 				       struct snd_dma_sg_fallback *sgbuf)
 {
+	bool wc = dmab->dev.type == SNDRV_DMA_TYPE_DEV_WC_SG;
 	size_t i, size;
 
-	if (sgbuf->pages && sgbuf->addrs) {
+	if (sgbuf->pages && sgbuf->npages) {
 		i = 0;
 		while (i < sgbuf->count) {
-			if (!sgbuf->pages[i] || !sgbuf->addrs[i])
-				break;
-			size = sgbuf->addrs[i] & ~PAGE_MASK;
-			if (WARN_ON(!size))
+			size = sgbuf->npages[i];
+			if (!size)
 				break;
 			do_free_pages(page_address(sgbuf->pages[i]),
-				      size << PAGE_SHIFT, false);
+				      size << PAGE_SHIFT, wc);
 			i += size;
 		}
 	}
 	kvfree(sgbuf->pages);
-	kvfree(sgbuf->addrs);
+	kvfree(sgbuf->npages);
 	kfree(sgbuf);
 }
 
 /* fallback manual S/G buffer allocations */
 static void *snd_dma_sg_fallback_alloc(struct snd_dma_buffer *dmab, size_t size)
 {
+	bool wc = dmab->dev.type == SNDRV_DMA_TYPE_DEV_WC_SG;
 	struct snd_dma_sg_fallback *sgbuf;
 	struct page **pagep, *curp;
-	size_t chunk, npages;
-	dma_addr_t *addrp;
+	size_t chunk;
 	dma_addr_t addr;
+	unsigned int idx, npages;
 	void *p;
 
 	sgbuf = kzalloc(sizeof(*sgbuf), GFP_KERNEL);
@@ -725,16 +725,16 @@ static void *snd_dma_sg_fallback_alloc(struct snd_dma_buffer *dmab, size_t size)
 	size = PAGE_ALIGN(size);
 	sgbuf->count = size >> PAGE_SHIFT;
 	sgbuf->pages = kvcalloc(sgbuf->count, sizeof(*sgbuf->pages), GFP_KERNEL);
-	sgbuf->addrs = kvcalloc(sgbuf->count, sizeof(*sgbuf->addrs), GFP_KERNEL);
-	if (!sgbuf->pages || !sgbuf->addrs)
+	sgbuf->npages = kvcalloc(sgbuf->count, sizeof(*sgbuf->npages), GFP_KERNEL);
+	if (!sgbuf->pages || !sgbuf->npages)
 		goto error;
 
 	pagep = sgbuf->pages;
-	addrp = sgbuf->addrs;
-	chunk = (PAGE_SIZE - 1) << PAGE_SHIFT; /* to fit in low bits in addrs */
+	chunk = size;
+	idx = 0;
 	while (size > 0) {
 		chunk = min(size, chunk);
-		p = do_alloc_pages(dmab->dev.dev, chunk, &addr, false);
+		p = do_alloc_pages(dmab->dev.dev, chunk, &addr, wc);
 		if (!p) {
 			if (chunk <= PAGE_SIZE)
 				goto error;
@@ -746,27 +746,33 @@ static void *snd_dma_sg_fallback_alloc(struct snd_dma_buffer *dmab, size_t size)
 		size -= chunk;
 		/* fill pages */
 		npages = chunk >> PAGE_SHIFT;
-		*addrp = npages; /* store in lower bits */
+		sgbuf->npages[idx] = npages;
+		idx += npages;
 		curp = virt_to_page(p);
-		while (npages--) {
+		while (npages--)
 			*pagep++ = curp++;
-			*addrp++ |= addr;
-			addr += PAGE_SIZE;
-		}
 	}
 
+	if (sg_alloc_table_from_pages(&sgbuf->sgt, sgbuf->pages, sgbuf->count,
+				      0, sgbuf->count << PAGE_SHIFT, GFP_KERNEL))
+		goto error;
+
+	if (dma_map_sgtable(dmab->dev.dev, &sgbuf->sgt, DMA_BIDIRECTIONAL, 0))
+		goto error_dma_map;
+
 	p = vmap(sgbuf->pages, sgbuf->count, VM_MAP, PAGE_KERNEL);
 	if (!p)
-		goto error;
-
-	if (dmab->dev.type == SNDRV_DMA_TYPE_DEV_WC_SG)
-		set_pages_array_wc(sgbuf->pages, sgbuf->count);
+		goto error_vmap;
 
 	dmab->private_data = sgbuf;
 	/* store the first page address for convenience */
-	dmab->addr = sgbuf->addrs[0] & PAGE_MASK;
+	dmab->addr = snd_sgbuf_get_addr(dmab, 0);
 	return p;
 
+ error_vmap:
+	dma_unmap_sgtable(dmab->dev.dev, &sgbuf->sgt, DMA_BIDIRECTIONAL, 0);
+ error_dma_map:
+	sg_free_table(&sgbuf->sgt);
  error:
 	__snd_dma_sg_fallback_free(dmab, sgbuf);
 	return NULL;
@@ -776,21 +782,12 @@ static void snd_dma_sg_fallback_free(struct snd_dma_buffer *dmab)
 {
 	struct snd_dma_sg_fallback *sgbuf = dmab->private_data;
 
-	if (dmab->dev.type == SNDRV_DMA_TYPE_DEV_WC_SG)
-		set_pages_array_wb(sgbuf->pages, sgbuf->count);
 	vunmap(dmab->area);
+	dma_unmap_sgtable(dmab->dev.dev, &sgbuf->sgt, DMA_BIDIRECTIONAL, 0);
+	sg_free_table(&sgbuf->sgt);
 	__snd_dma_sg_fallback_free(dmab, dmab->private_data);
 }
 
-static dma_addr_t snd_dma_sg_fallback_get_addr(struct snd_dma_buffer *dmab,
-					       size_t offset)
-{
-	struct snd_dma_sg_fallback *sgbuf = dmab->private_data;
-	size_t index = offset >> PAGE_SHIFT;
-
-	return (sgbuf->addrs[index] & PAGE_MASK) | (offset & ~PAGE_MASK);
-}
-
 static int snd_dma_sg_fallback_mmap(struct snd_dma_buffer *dmab,
 				    struct vm_area_struct *area)
 {
@@ -816,10 +813,6 @@ static void *snd_dma_sg_alloc(struct snd_dma_buffer *dmab, size_t size)
 		return p;
 
 	dmab->dev.type = type; /* restore the type */
-	/* if IOMMU is present but failed, give up */
-	if (get_dma_ops(dmab->dev.dev))
-		return NULL;
-	/* try fallback */
 	return snd_dma_sg_fallback_alloc(dmab, size);
 }
 
@@ -827,7 +820,8 @@ static const struct snd_malloc_ops snd_dma_sg_ops = {
 	.alloc = snd_dma_sg_alloc,
 	.free = snd_dma_sg_fallback_free,
 	.mmap = snd_dma_sg_fallback_mmap,
-	.get_addr = snd_dma_sg_fallback_get_addr,
+	/* reuse noncontig helper */
+	.get_addr = snd_dma_noncontig_get_addr,
 	/* reuse vmalloc helpers */
 	.get_page = snd_dma_vmalloc_get_page,
 	.get_chunk_size = snd_dma_vmalloc_get_chunk_size,
-- 
2.43.0

