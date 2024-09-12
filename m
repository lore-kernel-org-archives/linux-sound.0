Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC53A18DF90
	for <linux-sound@vger.kernel.org>; Thu, 12 Sep 2024 15:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726156309; cv=none; b=c86/PeEIqAX/Um5XkGDeFN1Y5f0KjGkOme8Oa0Hhhf/rex06I0iFh4+YqPaYFm2gC2W5XoF0DNUeRbA+VxpUw8ciL82eesCJEf1idztfOCYYMfXhjraMb2lBI6PwAmhmLNzW53T05kxXfjVh/29MvH05k22YY+WtVyFZR956bKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726156309; c=relaxed/simple;
	bh=4kO5nuRr+f4IxtfiZGPLnWL0kiUrjRtlJqvqFCHJiOA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RI1OnM1zNNVbldnMtcPkdz4h8ubIb7H09CZDNi6PKRyXnamP2mFvQuAfs7zkjOeNRRx6CKGND+eBpG4w9oavvVTmQZZPxBqdB6uiWLT3lYSvUUClNkMhJk2QsaUFFXViRYLZPovbcIYXSkFlOsOI/s/r2+bixb4IwGbrnfpyjqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=DQ4z22Tg; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=qUti9++X; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=DQ4z22Tg; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=qUti9++X; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="DQ4z22Tg";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="qUti9++X";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="DQ4z22Tg";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="qUti9++X"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 102121FB7D;
	Thu, 12 Sep 2024 15:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1726156306; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OWVmZ5JcAOWdd3poOuD0gWr+wu0+YNLyQbVCIddNhnk=;
	b=DQ4z22Tg//hCSQB6wFPf+3IOQIzQsEGhFh5a0LIdWofvcvMQFPw0YG3rOjMhoMYYROGahq
	XyoDmMH/8Z5lD44RtBDx6xN/07VD8ZM1P89c6fa58CYyKtR9CqZORdJHUDXwJjIAJGynqe
	l2QTUTVrDN6NEDXYuxRlNAon5h/K/Ho=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1726156306;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OWVmZ5JcAOWdd3poOuD0gWr+wu0+YNLyQbVCIddNhnk=;
	b=qUti9++XEXQHjRJfbpnB4Ic5z0uhX25JWFD04TN9q7YT+KftrrxaJRutZO6OGQvm+8PAmH
	Hj1ER2VtalxW2RDw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=DQ4z22Tg;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=qUti9++X
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1726156306; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OWVmZ5JcAOWdd3poOuD0gWr+wu0+YNLyQbVCIddNhnk=;
	b=DQ4z22Tg//hCSQB6wFPf+3IOQIzQsEGhFh5a0LIdWofvcvMQFPw0YG3rOjMhoMYYROGahq
	XyoDmMH/8Z5lD44RtBDx6xN/07VD8ZM1P89c6fa58CYyKtR9CqZORdJHUDXwJjIAJGynqe
	l2QTUTVrDN6NEDXYuxRlNAon5h/K/Ho=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1726156306;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OWVmZ5JcAOWdd3poOuD0gWr+wu0+YNLyQbVCIddNhnk=;
	b=qUti9++XEXQHjRJfbpnB4Ic5z0uhX25JWFD04TN9q7YT+KftrrxaJRutZO6OGQvm+8PAmH
	Hj1ER2VtalxW2RDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E9FE113AE5;
	Thu, 12 Sep 2024 15:51:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id gLEFNxEO42ZTHwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 12 Sep 2024 15:51:45 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 1/2] ALSA: memalloc: Use proper DMA mapping API for x86 WC buffer allocations
Date: Thu, 12 Sep 2024 17:52:24 +0200
Message-ID: <20240912155227.4078-2-tiwai@suse.de>
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
X-Rspamd-Queue-Id: 102121FB7D
X-Spam-Level: 
X-Spamd-Result: default: False [-5.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	DWL_DNSWL_MED(-2.00)[suse.de:dkim];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim,suse.de:mid];
	TO_DN_NONE(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -5.01
X-Spam-Flag: NO

The x86 WC page allocation assumes incorrectly the DMA address
directly taken from the page.  Also it checks the DMA ops
inappropriately for switching to the own method.

This patch rewrites the stuff to use the proper DMA mapping API
instead.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/memalloc.c | 51 +++++++++++++++++++++++++++----------------
 1 file changed, 32 insertions(+), 19 deletions(-)

diff --git a/sound/core/memalloc.c b/sound/core/memalloc.c
index b21dba4b374a..39e97f6fe8ac 100644
--- a/sound/core/memalloc.c
+++ b/sound/core/memalloc.c
@@ -496,41 +496,54 @@ static const struct snd_malloc_ops snd_dma_dev_ops = {
 /*
  * Write-combined pages
  */
-/* x86-specific allocations */
 #ifdef CONFIG_SND_DMA_SGBUF
-#define x86_fallback(dmab)	(!get_dma_ops(dmab->dev.dev))
-#else
-#define x86_fallback(dmab)	false
-#endif
-
+/* x86-specific allocations */
+static void *snd_dma_wc_alloc(struct snd_dma_buffer *dmab, size_t size)
+{
+	void *p = do_alloc_pages(dmab->dev.dev, size, &dmab->addr, true);
+
+	if (!p)
+		return NULL;
+	dmab->addr = dma_map_single(dmab->dev.dev, p, size, DMA_BIDIRECTIONAL);
+	if (dmab->addr == DMA_MAPPING_ERROR) {
+		do_free_pages(dmab->area, size, true);
+		return NULL;
+	}
+	return p;
+}
+
+static void snd_dma_wc_free(struct snd_dma_buffer *dmab)
+{
+	dma_unmap_single(dmab->dev.dev, dmab->addr, dmab->bytes,
+			 DMA_BIDIRECTIONAL);
+	do_free_pages(dmab->area, dmab->bytes, true);
+}
+
+static int snd_dma_wc_mmap(struct snd_dma_buffer *dmab,
+			   struct vm_area_struct *area)
+{
+	area->vm_page_prot = pgprot_writecombine(area->vm_page_prot);
+	return dma_mmap_coherent(dmab->dev.dev, area,
+				 dmab->area, dmab->addr, dmab->bytes);
+}
+#else
 static void *snd_dma_wc_alloc(struct snd_dma_buffer *dmab, size_t size)
 {
-	if (x86_fallback(dmab))
-		return do_alloc_pages(dmab->dev.dev, size, &dmab->addr, true);
 	return dma_alloc_wc(dmab->dev.dev, size, &dmab->addr, DEFAULT_GFP);
 }
 
 static void snd_dma_wc_free(struct snd_dma_buffer *dmab)
 {
-	if (x86_fallback(dmab)) {
-		do_free_pages(dmab->area, dmab->bytes, true);
-		return;
-	}
 	dma_free_wc(dmab->dev.dev, dmab->bytes, dmab->area, dmab->addr);
 }
 
 static int snd_dma_wc_mmap(struct snd_dma_buffer *dmab,
 			   struct vm_area_struct *area)
 {
-#ifdef CONFIG_SND_DMA_SGBUF
-	if (x86_fallback(dmab)) {
-		area->vm_page_prot = pgprot_writecombine(area->vm_page_prot);
-		return snd_dma_continuous_mmap(dmab, area);
-	}
-#endif
 	return dma_mmap_wc(dmab->dev.dev, area,
 			   dmab->area, dmab->addr, dmab->bytes);
 }
+#endif
 
 static const struct snd_malloc_ops snd_dma_wc_ops = {
 	.alloc = snd_dma_wc_alloc,
@@ -804,7 +817,7 @@ static void *snd_dma_sg_alloc(struct snd_dma_buffer *dmab, size_t size)
 
 	dmab->dev.type = type; /* restore the type */
 	/* if IOMMU is present but failed, give up */
-	if (!x86_fallback(dmab))
+	if (get_dma_ops(dmab->dev.dev))
 		return NULL;
 	/* try fallback */
 	return snd_dma_sg_fallback_alloc(dmab, size);
-- 
2.43.0

