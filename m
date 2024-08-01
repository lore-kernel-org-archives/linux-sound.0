Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E52F21BDC3
	for <linux-sound@vger.kernel.org>; Thu,  1 Aug 2024 06:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722494856; cv=none; b=dNaxQ5Mq+Sku3DMCJiYBqF8Xv7vL/e0I6/5wQhgcv4mreFInk5HG6/VoqhNdo/zUqTkmr5AfdUTLscVrzr7PebxbsxMs5Y6UHtLSOnvqIoLS7r+eS+PtpT04bgwgO2ZkDfJp/E6OBG04H/WtS3YYxVgkts1QmQnFd1axMR+yRqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722494856; c=relaxed/simple;
	bh=18wxPiTsLA5JjTFc8jxTY6kTXDi8XS9tUO5q/5+7DjY=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=H9aSiFqDnch7vIV31BeNypXzT7d68RGoxqD503S/h442+q0qzH2BgwJ21bGSkyAEXgdeusSKZgi/3jP0z2VrraMQjSODq6lO0iNu8k0VEYm5QmZ09I27y15F95KJLUMQfUjT4eXnaAFdBm3Jie8rHkXL7J5cRW5gvm58F28SziQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=AbCNvWPM; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=YjVFAk+1; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=AbCNvWPM; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=YjVFAk+1; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="AbCNvWPM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="YjVFAk+1";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="AbCNvWPM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="YjVFAk+1"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 2962C21A72;
	Thu,  1 Aug 2024 06:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1722494853; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=YQfaI4XQ4j13NhwUllNkRc3dK4aCnnKHerPgXTrMKWE=;
	b=AbCNvWPM4NXnI7AWKpJggLOEYEhInkeq9hmIV9AmG1yKI2zpJDnmzJXswUj6R4deYET4uK
	+bJXpdvfmiAvXijnOH1dVTOh5WQBCJ2E6laJ+iy5jCSkn9YQyDNP5uJ7n6W3WFlAUMhcd0
	o8tfHXVFG6pT83QydxypFMYV8JqGlMc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1722494853;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=YQfaI4XQ4j13NhwUllNkRc3dK4aCnnKHerPgXTrMKWE=;
	b=YjVFAk+1nPYNCMoVD4cpXf+ZlUaoP1HjpHAqB+KOw26USB0lIZq/PQBlLrTc8HUwj352EO
	isGeKdC1Fev9OwBA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1722494853; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=YQfaI4XQ4j13NhwUllNkRc3dK4aCnnKHerPgXTrMKWE=;
	b=AbCNvWPM4NXnI7AWKpJggLOEYEhInkeq9hmIV9AmG1yKI2zpJDnmzJXswUj6R4deYET4uK
	+bJXpdvfmiAvXijnOH1dVTOh5WQBCJ2E6laJ+iy5jCSkn9YQyDNP5uJ7n6W3WFlAUMhcd0
	o8tfHXVFG6pT83QydxypFMYV8JqGlMc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1722494853;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=YQfaI4XQ4j13NhwUllNkRc3dK4aCnnKHerPgXTrMKWE=;
	b=YjVFAk+1nPYNCMoVD4cpXf+ZlUaoP1HjpHAqB+KOw26USB0lIZq/PQBlLrTc8HUwj352EO
	isGeKdC1Fev9OwBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0CD92136CF;
	Thu,  1 Aug 2024 06:47:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id j3hdAYUvq2bScgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 01 Aug 2024 06:47:33 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 1/2] ALSA: memalloc: Use DMA API for x86 WC page allocations, too
Date: Thu,  1 Aug 2024 08:48:05 +0200
Message-ID: <20240801064808.31205-1-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [0.40 / 50.00];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: 0.40

The memalloc helper used a house-made code for allocation of WC pages
on x86, since the standard DMA API doesn't cover it well.  Meanwhile,
the manually allocated pages won't work together with IOMMU, resulting
in faults, so we should switch to the DMA API in that case, instead.

This patch tries to switch back to DMA API for WC pages on x86, but
with some additional tweaks that are missing.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=219087
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/memalloc.c | 35 +++++++++++++++++------------------
 1 file changed, 17 insertions(+), 18 deletions(-)

diff --git a/sound/core/memalloc.c b/sound/core/memalloc.c
index f901504b5afc..428652fda926 100644
--- a/sound/core/memalloc.c
+++ b/sound/core/memalloc.c
@@ -492,40 +492,39 @@ static const struct snd_malloc_ops snd_dma_dev_ops = {
  */
 /* x86-specific allocations */
 #ifdef CONFIG_SND_DMA_SGBUF
-static void *snd_dma_wc_alloc(struct snd_dma_buffer *dmab, size_t size)
-{
-	return do_alloc_pages(dmab->dev.dev, size, &dmab->addr, true);
-}
-
-static void snd_dma_wc_free(struct snd_dma_buffer *dmab)
-{
-	do_free_pages(dmab->area, dmab->bytes, true);
-}
-
-static int snd_dma_wc_mmap(struct snd_dma_buffer *dmab,
-			   struct vm_area_struct *area)
-{
-	area->vm_page_prot = pgprot_writecombine(area->vm_page_prot);
-	return snd_dma_continuous_mmap(dmab, area);
-}
+#define x86_fallback(dmab)	(!get_dma_ops(dmab->dev.dev))
 #else
+#define x86_fallback(dmab)	false
+#endif
+
 static void *snd_dma_wc_alloc(struct snd_dma_buffer *dmab, size_t size)
 {
+	if (x86_fallback(dmab))
+		return do_alloc_pages(dmab->dev.dev, size, &dmab->addr, true);
 	return dma_alloc_wc(dmab->dev.dev, size, &dmab->addr, DEFAULT_GFP);
 }
 
 static void snd_dma_wc_free(struct snd_dma_buffer *dmab)
 {
+	if (x86_fallback(dmab)) {
+		do_free_pages(dmab->area, dmab->bytes, true);
+		return;
+	}
 	dma_free_wc(dmab->dev.dev, dmab->bytes, dmab->area, dmab->addr);
 }
 
 static int snd_dma_wc_mmap(struct snd_dma_buffer *dmab,
 			   struct vm_area_struct *area)
 {
+#ifdef CONFIG_SND_DMA_SGBUF
+	if (x86_fallback(dmab)) {
+		area->vm_page_prot = pgprot_writecombine(area->vm_page_prot);
+		return snd_dma_continuous_mmap(dmab, area);
+	}
+#endif
 	return dma_mmap_wc(dmab->dev.dev, area,
 			   dmab->area, dmab->addr, dmab->bytes);
 }
-#endif /* CONFIG_SND_DMA_SGBUF */
 
 static const struct snd_malloc_ops snd_dma_wc_ops = {
 	.alloc = snd_dma_wc_alloc,
@@ -548,7 +547,7 @@ static void *snd_dma_noncontig_alloc(struct snd_dma_buffer *dmab, size_t size)
 	sgt = dma_alloc_noncontiguous(dmab->dev.dev, size, dmab->dev.dir,
 				      DEFAULT_GFP, 0);
 #ifdef CONFIG_SND_DMA_SGBUF
-	if (!sgt && !get_dma_ops(dmab->dev.dev))
+	if (!sgt && x86_fallback(dmab))
 		return snd_dma_sg_fallback_alloc(dmab, size);
 #endif
 	if (!sgt)
-- 
2.43.0

