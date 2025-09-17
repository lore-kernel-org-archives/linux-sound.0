Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36B4672602
	for <linux-sound@vger.kernel.org>; Wed, 17 Sep 2025 13:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758114556; cv=none; b=fBQ12zhZNdITxq1Vk3Y5brlz74pbOvlZKF9jR0dA+lnxU+arl+3ggtf/Jgx0+/OQvYkbNg1oT9dK5xwKyaTs59LyTdc8QkXVrRYAGarmb4BTQX0XYGGEyTUNAPjhNUTZCqUT6FUXTVlXT5tkzykVpc+K7wcX4HrCv11KiT/NqxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758114556; c=relaxed/simple;
	bh=zBwzTcjjgCabHqygYoqXRXdGh3qy1tHa1XF1g+yEBVA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EjAV1IPAMl8BoZJZqcQoPoBRyDZsynY5eBObe4dfHm0Hod4ReHBIg+ZAzNLfoGpSfYM6Kf1DTG5OSOIXXytyISKhRd77ASYXQniZh9ecnmXTjjiONexcuIFVH5r6xgSlWTBziVxFPobAqWUe1qmwRbqYRpfRXYVWtJqMv1IZFSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=XnXHNswQ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=oXH2j9VU; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=XnXHNswQ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=oXH2j9VU; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="XnXHNswQ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="oXH2j9VU";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="XnXHNswQ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="oXH2j9VU"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 37FAA22637;
	Wed, 17 Sep 2025 13:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1758114552; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Z9j/ZpxHrKEitvjvc4XjbX+Y21i67zsZuq9+qv0pyqY=;
	b=XnXHNswQuMzHIytrJmBkAFNdFKAbaxMQzESW9jdJx6SsfWkvFwFBR81Va3A97InZtv/eB0
	l4c1bBo+6iq5q6w9ctu5PfJYRDv7uQjC7Wry+PbYA6pWaAyv3SeH1dK/vC9IAKs4gslVMX
	HqnxuU+94Rxo/n4lMDbS10MRa/TV/fk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1758114552;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Z9j/ZpxHrKEitvjvc4XjbX+Y21i67zsZuq9+qv0pyqY=;
	b=oXH2j9VUHm9NJ2h9r8vgWWC4A00Lvz4bpp4NN14GpG6PFTIh0D2ZwYqlJPvXC9mXMRPItQ
	xynGeDNKB0vKR9BQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1758114552; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Z9j/ZpxHrKEitvjvc4XjbX+Y21i67zsZuq9+qv0pyqY=;
	b=XnXHNswQuMzHIytrJmBkAFNdFKAbaxMQzESW9jdJx6SsfWkvFwFBR81Va3A97InZtv/eB0
	l4c1bBo+6iq5q6w9ctu5PfJYRDv7uQjC7Wry+PbYA6pWaAyv3SeH1dK/vC9IAKs4gslVMX
	HqnxuU+94Rxo/n4lMDbS10MRa/TV/fk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1758114552;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Z9j/ZpxHrKEitvjvc4XjbX+Y21i67zsZuq9+qv0pyqY=;
	b=oXH2j9VUHm9NJ2h9r8vgWWC4A00Lvz4bpp4NN14GpG6PFTIh0D2ZwYqlJPvXC9mXMRPItQ
	xynGeDNKB0vKR9BQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 08A9713AAF;
	Wed, 17 Sep 2025 13:09:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id KrqAAPiyymjybQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 17 Sep 2025 13:09:12 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: Luca Weiss <luca.weiss@fairphone.com>,
	Arnd Bergmann <arnd@kernel.org>
Subject: [PATCH] ALSA: usb: qcom: Fix false-positive address space check
Date: Wed, 17 Sep 2025 15:09:01 +0200
Message-ID: <20250917130909.8211-1-tiwai@suse.de>
X-Mailer: git-send-email 2.50.1
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
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -2.80

The sanity check previously added to uaudio_transfer_buffer_setup()
assumed the allocated buffer being linear-mapped.  But the buffer
allocated via usb_alloc_coherent() isn't always so, rather to be used
with (SG-)DMA API.  This leaded to a false-positive warning and the
driver failed to work.

Actually uaudio_transfer_buffer_setup() deals only with the DMA-API
addresses for MEM_XFER_BUF type, while other callers of
uaudio_iommu_map() are with pages with physical addresses for
MEM_EVENT_RING and MEM_XFER_RING types.  So this patch splits the
mapping helper function to two different ones, uaudio_iommu_map() for
the DMA pages and uaudio_iommu_map_pa() for the latter, in order to
handle mapping differently for each type.  Along with it, the
unnecessary address check that caused probe error is dropped, too.

Fixes: 3335a1bbd624 ("ALSA: qc_audio_offload: try to reduce address space confusion")
Suggested-by: Arnd Bergmann <arnd@arndb.de>
Acked-by: Arnd Bergmann <arnd@arndb.de>
Reported-and-tested-by: Luca Weiss <luca.weiss@fairphone.com>
Closes: https://lore.kernel.org/DBR2363A95M1.L9XBNC003490@fairphone.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/qcom/qc_audio_offload.c | 92 ++++++++++++++++---------------
 1 file changed, 48 insertions(+), 44 deletions(-)

diff --git a/sound/usb/qcom/qc_audio_offload.c b/sound/usb/qcom/qc_audio_offload.c
index a25c5a531690..9ad76fff741b 100644
--- a/sound/usb/qcom/qc_audio_offload.c
+++ b/sound/usb/qcom/qc_audio_offload.c
@@ -538,38 +538,33 @@ static void uaudio_iommu_unmap(enum mem_type mtype, unsigned long iova,
 			umap_size, iova, mapped_iova_size);
 }
 
+static int uaudio_iommu_map_prot(bool dma_coherent)
+{
+	int prot = IOMMU_READ | IOMMU_WRITE;
+
+	if (dma_coherent)
+		prot |= IOMMU_CACHE;
+	return prot;
+}
+
 /**
- * uaudio_iommu_map() - maps iommu memory for adsp
+ * uaudio_iommu_map_pa() - maps iommu memory for adsp
  * @mtype: ring type
  * @dma_coherent: dma coherent
  * @pa: physical address for ring/buffer
  * @size: size of memory region
- * @sgt: sg table for memory region
  *
  * Maps the XHCI related resources to a memory region that is assigned to be
  * used by the adsp.  This will be mapped to the domain, which is created by
  * the ASoC USB backend driver.
  *
  */
-static unsigned long uaudio_iommu_map(enum mem_type mtype, bool dma_coherent,
-				      phys_addr_t pa, size_t size,
-				      struct sg_table *sgt)
+static unsigned long uaudio_iommu_map_pa(enum mem_type mtype, bool dma_coherent,
+					 phys_addr_t pa, size_t size)
 {
-	struct scatterlist *sg;
 	unsigned long iova = 0;
-	size_t total_len = 0;
-	unsigned long iova_sg;
-	phys_addr_t pa_sg;
 	bool map = true;
-	size_t sg_len;
-	int prot;
-	int ret;
-	int i;
-
-	prot = IOMMU_READ | IOMMU_WRITE;
-
-	if (dma_coherent)
-		prot |= IOMMU_CACHE;
+	int prot = uaudio_iommu_map_prot(dma_coherent);
 
 	switch (mtype) {
 	case MEM_EVENT_RING:
@@ -583,20 +578,41 @@ static unsigned long uaudio_iommu_map(enum mem_type mtype, bool dma_coherent,
 				     &uaudio_qdev->xfer_ring_iova_size,
 				     &uaudio_qdev->xfer_ring_list, size);
 		break;
-	case MEM_XFER_BUF:
-		iova = uaudio_get_iova(&uaudio_qdev->curr_xfer_buf_iova,
-				     &uaudio_qdev->xfer_buf_iova_size,
-				     &uaudio_qdev->xfer_buf_list, size);
-		break;
 	default:
 		dev_err(uaudio_qdev->data->dev, "unknown mem type %d\n", mtype);
 	}
 
 	if (!iova || !map)
-		goto done;
+		return 0;
 
-	if (!sgt)
-		goto skip_sgt_map;
+	iommu_map(uaudio_qdev->data->domain, iova, pa, size, prot, GFP_KERNEL);
+
+	return iova;
+}
+
+static unsigned long uaudio_iommu_map_xfer_buf(bool dma_coherent, size_t size,
+					       struct sg_table *sgt)
+{
+	struct scatterlist *sg;
+	unsigned long iova = 0;
+	size_t total_len = 0;
+	unsigned long iova_sg;
+	phys_addr_t pa_sg;
+	size_t sg_len;
+	int prot = uaudio_iommu_map_prot(dma_coherent);
+	int ret;
+	int i;
+
+	prot = IOMMU_READ | IOMMU_WRITE;
+
+	if (dma_coherent)
+		prot |= IOMMU_CACHE;
+
+	iova = uaudio_get_iova(&uaudio_qdev->curr_xfer_buf_iova,
+			       &uaudio_qdev->xfer_buf_iova_size,
+			       &uaudio_qdev->xfer_buf_list, size);
+	if (!iova)
+		goto done;
 
 	iova_sg = iova;
 	for_each_sg(sgt->sgl, sg, sgt->nents, i) {
@@ -618,11 +634,6 @@ static unsigned long uaudio_iommu_map(enum mem_type mtype, bool dma_coherent,
 		uaudio_iommu_unmap(MEM_XFER_BUF, iova, size, total_len);
 		iova = 0;
 	}
-	return iova;
-
-skip_sgt_map:
-	iommu_map(uaudio_qdev->data->domain, iova, pa, size, prot, GFP_KERNEL);
-
 done:
 	return iova;
 }
@@ -1020,7 +1031,6 @@ static int uaudio_transfer_buffer_setup(struct snd_usb_substream *subs,
 	struct sg_table xfer_buf_sgt;
 	dma_addr_t xfer_buf_dma;
 	void *xfer_buf;
-	phys_addr_t xfer_buf_pa;
 	u32 len = xfer_buf_len;
 	bool dma_coherent;
 	dma_addr_t xfer_buf_dma_sysdev;
@@ -1051,18 +1061,12 @@ static int uaudio_transfer_buffer_setup(struct snd_usb_substream *subs,
 	if (!xfer_buf)
 		return -ENOMEM;
 
-	/* Remapping is not possible if xfer_buf is outside of linear map */
-	xfer_buf_pa = virt_to_phys(xfer_buf);
-	if (WARN_ON(!page_is_ram(PFN_DOWN(xfer_buf_pa)))) {
-		ret = -ENXIO;
-		goto unmap_sync;
-	}
 	dma_get_sgtable(subs->dev->bus->sysdev, &xfer_buf_sgt, xfer_buf,
 			xfer_buf_dma, len);
 
 	/* map the physical buffer into sysdev as well */
-	xfer_buf_dma_sysdev = uaudio_iommu_map(MEM_XFER_BUF, dma_coherent,
-					       xfer_buf_pa, len, &xfer_buf_sgt);
+	xfer_buf_dma_sysdev = uaudio_iommu_map_xfer_buf(dma_coherent,
+							len, &xfer_buf_sgt);
 	if (!xfer_buf_dma_sysdev) {
 		ret = -ENOMEM;
 		goto unmap_sync;
@@ -1143,8 +1147,8 @@ uaudio_endpoint_setup(struct snd_usb_substream *subs,
 	sg_free_table(sgt);
 
 	/* data transfer ring */
-	iova = uaudio_iommu_map(MEM_XFER_RING, dma_coherent, tr_pa,
-			      PAGE_SIZE, NULL);
+	iova = uaudio_iommu_map_pa(MEM_XFER_RING, dma_coherent, tr_pa,
+				   PAGE_SIZE);
 	if (!iova) {
 		ret = -ENOMEM;
 		goto clear_pa;
@@ -1207,8 +1211,8 @@ static int uaudio_event_ring_setup(struct snd_usb_substream *subs,
 	mem_info->dma = sg_dma_address(sgt->sgl);
 	sg_free_table(sgt);
 
-	iova = uaudio_iommu_map(MEM_EVENT_RING, dma_coherent, er_pa,
-			      PAGE_SIZE, NULL);
+	iova = uaudio_iommu_map_pa(MEM_EVENT_RING, dma_coherent, er_pa,
+				   PAGE_SIZE);
 	if (!iova) {
 		ret = -ENOMEM;
 		goto clear_pa;
-- 
2.50.1

