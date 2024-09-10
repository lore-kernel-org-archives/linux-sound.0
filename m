Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E60B317CA09
	for <linux-sound@vger.kernel.org>; Tue, 10 Sep 2024 11:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725967820; cv=none; b=alHXlN9pabcR6uJ9+erqCDscOVW9XozvIeFbf4+eZ5P1z5+xIhUO3DnaoKz7w0QEMmusuAidagVLHPwlb0CoILeOMs0Z6a6sZTBYobeBFdwr+7028W6C90LjG3na7ljyIl8NUZobNVOE2xNAahPUquHqeJad+M/43MV6afc836I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725967820; c=relaxed/simple;
	bh=x08Lne+UJfzZP9oG4x8ErbQtgCpdARxBcqXUPBcjdeU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=i1hbuRygVboJQKv1I5de0y3Knuklen59t6qq4PueJ8DpVmWLwiFvLyXmKPFq8uDASiWQIpwhM/omUZpbauVWzazPrZhZDg4fxwq1yYEs1gA6m+TdSCuWW9EVpHWB6TL5KCDMwjYJFYY2zaiCF6ZHLG+o7gbnMfqmwxYcCSKLUj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Kp8BrkMH; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=jWRxb7d4; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=UQZ9MC9/; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=1LYiPhyj; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Kp8BrkMH";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="jWRxb7d4";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="UQZ9MC9/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1LYiPhyj"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E2C6421A25;
	Tue, 10 Sep 2024 11:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1725967817; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=syrewtmLeBuRW8gG/dyIpkexDbGcANf0nlLgDySHtlU=;
	b=Kp8BrkMHfKAnT0gIfjgG55DtVwF0V1BON6nPsn5+CmtZVLEsp4n0GbDfoFmZ2WUKkm36WR
	IFSm0cqNzaxpVINLesyh8Z4b72/aaBr1qmcl5ONEIyN3oh9p6E4gmZ6tuZQ+jr5xfX2A08
	Hn4cad3TniCBNa59Ub7ix2fahRy2c2o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1725967817;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=syrewtmLeBuRW8gG/dyIpkexDbGcANf0nlLgDySHtlU=;
	b=jWRxb7d4MIiEnenVaFVEIEn4BgleEtDEA9SuM/Yn604xP66IjNcY69VlBPeYGMDaqb2ePL
	InLDOJduT3kKSCAQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1725967816; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=syrewtmLeBuRW8gG/dyIpkexDbGcANf0nlLgDySHtlU=;
	b=UQZ9MC9/wb0K3Qx1dZvFpySj6Bd5gKhXRWxhG6XU8bjJ96vvZN0zDFLAgD0oPB4lCUO+Yz
	qGWSUWu+tXQy/hYeuE9OSLzpoSExL3BHsDJh8/QJ/E7LH1KJ1cWNDPqi2OOHxf0oWOHp6V
	xS7AIjgm+86a+Cn9HmdCgLPjPCEmPG4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1725967816;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=syrewtmLeBuRW8gG/dyIpkexDbGcANf0nlLgDySHtlU=;
	b=1LYiPhyj1RZTduv2BE5D2vCbk1cw3U1uaO5JE2iI4nVCVV3STQaSHWAJhZmlLuwp4K6w7P
	orTsKSkd/+W2I2Dw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CBF5913A3A;
	Tue, 10 Sep 2024 11:30:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id kx/LMMgt4GbRdAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 10 Sep 2024 11:30:16 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: Ariadne Conill <ariadne@ariadne.space>,
	xen-devel@lists.xenproject.org
Subject: [PATCH for-6.12] ALSA: memalloc: Drop Xen PV workaround again
Date: Tue, 10 Sep 2024 13:30:59 +0200
Message-ID: <20240910113100.32542-1-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo,ariadne.space:email];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -2.80
X-Spam-Flag: NO

Since recently in the commit e469e2045f1b ("ALSA: memalloc: Let IOMMU
handle S/G primarily"), the SG buffer allocation code was modified to
use the standard DMA code primarily and the fallback is applied only
limitedly.  This made the Xen PV specific workarounds we took in the
commit 53466ebdec61 ("ALSA: memalloc: Workaround for Xen PV") rather
superfluous.

It was a hackish workaround for the regression at that time, and it
seems that it's causing another issues (reportedly memory
corruptions).  So it's better to clean it up, after all.

Link: https://lore.kernel.org/20240906184209.25423-1-ariadne@ariadne.space
Cc: Ariadne Conill <ariadne@ariadne.space>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/memalloc.c | 19 +++----------------
 1 file changed, 3 insertions(+), 16 deletions(-)

diff --git a/sound/core/memalloc.c b/sound/core/memalloc.c
index f3ad9f85adf1..1d931c24fa35 100644
--- a/sound/core/memalloc.c
+++ b/sound/core/memalloc.c
@@ -657,7 +657,6 @@ static const struct snd_malloc_ops snd_dma_noncontig_ops = {
 #ifdef CONFIG_SND_DMA_SGBUF
 /* Fallback SG-buffer allocations for x86 */
 struct snd_dma_sg_fallback {
-	bool use_dma_alloc_coherent;
 	size_t count;
 	struct page **pages;
 	/* DMA address array; the first page contains #pages in ~PAGE_MASK */
@@ -677,13 +676,8 @@ static void __snd_dma_sg_fallback_free(struct snd_dma_buffer *dmab,
 			size = sgbuf->addrs[i] & ~PAGE_MASK;
 			if (WARN_ON(!size))
 				break;
-			if (sgbuf->use_dma_alloc_coherent)
-				dma_free_coherent(dmab->dev.dev, size << PAGE_SHIFT,
-						  page_address(sgbuf->pages[i]),
-						  sgbuf->addrs[i] & PAGE_MASK);
-			else
-				do_free_pages(page_address(sgbuf->pages[i]),
-					      size << PAGE_SHIFT, false);
+			do_free_pages(page_address(sgbuf->pages[i]),
+				      size << PAGE_SHIFT, false);
 			i += size;
 		}
 	}
@@ -705,7 +699,6 @@ static void *snd_dma_sg_fallback_alloc(struct snd_dma_buffer *dmab, size_t size)
 	sgbuf = kzalloc(sizeof(*sgbuf), GFP_KERNEL);
 	if (!sgbuf)
 		return NULL;
-	sgbuf->use_dma_alloc_coherent = cpu_feature_enabled(X86_FEATURE_XENPV);
 	size = PAGE_ALIGN(size);
 	sgbuf->count = size >> PAGE_SHIFT;
 	sgbuf->pages = kvcalloc(sgbuf->count, sizeof(*sgbuf->pages), GFP_KERNEL);
@@ -718,10 +711,7 @@ static void *snd_dma_sg_fallback_alloc(struct snd_dma_buffer *dmab, size_t size)
 	chunk = (PAGE_SIZE - 1) << PAGE_SHIFT; /* to fit in low bits in addrs */
 	while (size > 0) {
 		chunk = min(size, chunk);
-		if (sgbuf->use_dma_alloc_coherent)
-			p = dma_alloc_coherent(dmab->dev.dev, chunk, &addr, DEFAULT_GFP);
-		else
-			p = do_alloc_pages(dmab->dev.dev, chunk, &addr, false);
+		p = do_alloc_pages(dmab->dev.dev, chunk, &addr, false);
 		if (!p) {
 			if (chunk <= PAGE_SIZE)
 				goto error;
@@ -793,9 +783,6 @@ static void *snd_dma_sg_alloc(struct snd_dma_buffer *dmab, size_t size)
 	int type = dmab->dev.type;
 	void *p;
 
-	if (cpu_feature_enabled(X86_FEATURE_XENPV))
-		return snd_dma_sg_fallback_alloc(dmab, size);
-
 	/* try the standard DMA API allocation at first */
 	if (type == SNDRV_DMA_TYPE_DEV_WC_SG)
 		dmab->dev.type = SNDRV_DMA_TYPE_DEV_WC;

base-commit: 7e4d4b32ab9532bd1babcd5d0763d727ebb04be0
-- 
2.43.0

