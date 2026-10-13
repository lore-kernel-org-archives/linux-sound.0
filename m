Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 736873AF646
	for <linux-sound@vger.kernel.org>; Tue, 13 Oct 2026 07:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791877452; cv=none; b=bSb2zwVJYdG67Ji/mqVIV+cL9UfbAhBR/3AQASoy+KFb+L6QULdCEBX4LIBbM1eVMysIWtXWK2/Zhv9KPBAnOEePX4THWWf0/b4hzP/NuhvWH+738eho9gr9ia3ToMjmF1cQFDfUjm/JpIgGC6R6AzDe6p+rbChu6VOf10UT+Ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791877452; c=relaxed/simple;
	bh=jYkqPUbVKi12IdOzbuyGG9MtQf4V3AEKm5MtondCyZE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZQAnFMz16sl39rthvd/rIuNy/sltiqYSfEgcR9/9wMrWMvJ/34LR96Wj7DC3l+DxN2b8UwghT3igxeMHkfbf90H+3SsRbpCbX2UM308AlAPu8DgDvyUeXuR9HbwQfpwFTIxQJA2VdfvucjwfOtqRz6wMaLqL0oP4A0d7cKNPgUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lq0SDTZU; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lq0SDTZU"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cd5cd8d89a7so860503a12.1
        for <linux-sound@vger.kernel.org>; Tue, 13 Oct 2026 00:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791877450; x=1792482250; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tFHFD9ofVgWJP0eEZm3oHHj3moTZUPiTlagip5ETNxY=;
        b=lq0SDTZUO4JCI0IFwb8bKbygzYM+knH4/CMuH6deBBd5T3Xa+ELxQSild1yqdEVqst
         gfgBbv9NMF2INK3qfXM8W/S+sApd7QRd4+N9q2dtbN4i7BCKs/5+Hj1JyAkIpqdlZOIP
         nf1PbIPcFiiXPoaaj95v7rRXbJE+VT/gxAf0gX11AGa6YwiDXytkgR37OaWp4iRQSVt0
         RywKwwQjoRZd31/sEFXc6awCApoV9W67lXK6144aUBW+9c13p3eh9uqD5Qfv2D+OBv4e
         QrMMDPAaJ2hCw6T29AEoRVL685ZP4tTC5P/Ryz/QxbYcFFqUNp01+uWXRiStB/7+Bzhq
         fYOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791877450; x=1792482250;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tFHFD9ofVgWJP0eEZm3oHHj3moTZUPiTlagip5ETNxY=;
        b=bLLHSiFexj1HKYpRbEausyKxQUJkBdXjqIY7AvQyISkICtxuiid/JDVmjB/xqgtNzm
         M/ydUhIquPYmz0ewjMkFAA8jLovuVxAkFRuGEDivc53L7+j4kSPkmlNPOxekcMrkgiJG
         U2fDxDOYdvf7lHCmD6E45bg+Opz8lgPvULHgWy5fqGeddL9nUHq6dv+yUKaB8zB0IzkU
         e5joQx2t5il07sr6hKoIlpTKqB2gpMvF4JBZGqEQLcEolw4TLp04TZUIyzjyQkAIL4JY
         60pRe4eoaaWHxnFGtN9IHcas3lOTAXrrXPR/T6GYvYTDIweyuQd8kzRD2s3ncl+xR9R/
         6PyA==
X-Forwarded-Encrypted: i=1; AKwUvBymbgaxoEQq64omExQfFjoSm3EkScHoMKftPqiT7mEzkuFvS52EMxGch97AJ5QTyHmEEXt3Qq+3bsF6oA==@vger.kernel.org
X-Gm-Message-State: AFq9FYLKCC+24naPgjyOW5u7CV2CNpp46RgqnwRHdGaBr9SC9QJ5NPQ9
	qIawhS11ohahbjTpXN2ThXHeRdyxsx5lECgtiZ2udqXPPoEOfmj9zufM
X-Gm-Gg: AYBFou0T+vot/aTP4aUi+S99dmQV+/zlDUiWh5Dlu3qgXiEVmQ5S0AmvdHWbtqhwv4c
	ftCM8vxGEvH4/KApw9wxDGS0RzVRfsNpFx243m1SEG79DPHmi9MxhFlEX/I8C5FvxYd8bVRPe6C
	JQAV+ux6WzsLfgjtw0Q5Yn3zcElUaKgiVWkTWBB8buF039J3TylCIOlJ4AwR4EcuepkwXiRY2jF
	vPKqsi2f6JAL3axM6a5pSNuVagMPPb4Uz8NEGZj5K+7IRMEY3RhTKTl/YzU/0TKsCRV6qjwX9ZP
	94NtFmFRHHKETgn9yLhpoG2w3wdoMDyt0H1iqTKpqtHbX53b5IEftjqDVlzWUiyjdgrqC+/S0sw
	fFlI4f2N3I3A6/0vTKX6EU1wL7QBxul+7u7KmghEd7QXv3hOE6jtKj77micNVIAOmabSEZurAsj
	IvA6lTkf3odJ0meKwbzJQbmwRK/fJ7DwDfoNlrHjmCemzXJJQlmmvuQkTsH3hEGjnSHdSx024e3
	qmPXgOe0+jspKdOgXmXBuyFhGux3wXE2j3qElyOgxPGSP60PU0R4LWQwSgQ01A8KzqRA/9EeMth
	Y5rLWL9+uKi3JXoztSrJvqsONFY=
X-Received: by 2002:a17:90b:3b90:b0:3a8:5543:5572 with SMTP id 98e67ed59e1d1-3ab3a3654admr10545075a91.1.1791877449448;
        Tue, 13 Oct 2026 00:44:09 -0700 (PDT)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab36ed053csm20552825a91.4.2026.10.13.00.44.06
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 13 Oct 2026 00:44:08 -0700 (PDT)
From: Joonho Lee <mynameisjune111@gmail.com>
To: Takashi Iwai <tiwai@suse.com>
Cc: "Michael S . Tsirkin" <mst@redhat.com>,
	Jaroslav Kysela <perex@perex.cz>,
	virtualization@lists.linux.dev,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
Subject: [PATCH v2 4/5] ALSA: virtio: Keep PCM DMA buffers alive through device ownership
Date: Tue, 13 Oct 2026 16:43:49 +0900
Message-ID: <101a1771075d6ba980f25f4ac56848a1d38d8e4a.1791877396.git.mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1791877396.git.mynameisjune111@gmail.com>
References: <cover.1791877396.git.mynameisjune111@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Retain references to the pages backing ALSA's vmalloc buffer until its
queued I/O messages are freed. On NOMMU systems, use driver-owned memory
for DMA and copy playback data before submission and capture data after
completion, so ALSA buffer release cannot invalidate an active request.

Validate the PCM buffer and each period before building scatterlists.
Clamp device-reported capture lengths to the message capacity before
advancing the hardware pointer, preventing an oversized completion from
accounting bytes beyond the buffer actually submitted.

Fixes: f40a28679e0b ("ALSA: virtio: handling control and I/O messages for the PCM device")
Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>
---
Changes in v2:
- Support NOMMU with an owned zeroed DMA buffer, copy only while the
  stream is active, and bound capture lengths by message capacity.

 sound/virtio/virtio_pcm.h     |  11 ++
 sound/virtio/virtio_pcm_msg.c | 252 +++++++++++++++++++++++++++++++---
 sound/virtio/virtio_pcm_ops.c |   2 +
 3 files changed, 243 insertions(+), 22 deletions(-)

diff --git a/sound/virtio/virtio_pcm.h b/sound/virtio/virtio_pcm.h
index 5787a300d0ee..02547899743a 100644
--- a/sound/virtio/virtio_pcm.h
+++ b/sound/virtio/virtio_pcm.h
@@ -13,6 +13,7 @@
 
 struct virtio_pcm;
 struct virtio_pcm_msg;
+struct page;
 
 /**
  * struct virtio_pcm_substream - VirtIO PCM substream.
@@ -38,6 +39,10 @@ struct virtio_pcm_msg;
  * @msgs: Allocated I/O messages.
  * @nmsgs: Number of allocated I/O messages.
  * @msg_count: Number of pending I/O messages in the virtqueue.
+ * @dma_pages: Pages backing DMA messages, retained until messages are freed.
+ * @ndma_pages: Number of retained pages.
+ * @owned_dma_area: Driver-owned PCM buffer backing asynchronous messages.
+ * @owned_dma_bytes: Size of @owned_dma_area.
  * @msg_empty: Notify when msg_count is zero.
  */
 struct virtio_pcm_substream {
@@ -60,6 +65,12 @@ struct virtio_pcm_substream {
 	struct virtio_pcm_msg **msgs;
 	unsigned int nmsgs;
 	unsigned int msg_count;
+	struct page **dma_pages;
+	unsigned int ndma_pages;
+#ifndef CONFIG_MMU
+	u8 *owned_dma_area;
+	size_t owned_dma_bytes;
+#endif
 	wait_queue_head_t msg_empty;
 };
 
diff --git a/sound/virtio/virtio_pcm_msg.c b/sound/virtio/virtio_pcm_msg.c
index 762480363b86..b7f2334bb221 100644
--- a/sound/virtio/virtio_pcm_msg.c
+++ b/sound/virtio/virtio_pcm_msg.c
@@ -3,6 +3,9 @@
  * virtio-snd: Virtio sound device
  * Copyright (C) 2021 OpenSynergy GmbH
  */
+#include <linux/limits.h>
+#include <linux/mm.h>
+#include <linux/overflow.h>
 #include <sound/pcm_params.h>
 
 #include "virtio_card.h"
@@ -13,6 +16,7 @@
  * @xfer: Request header payload.
  * @status: Response header payload.
  * @length: Data length in bytes.
+ * @data_offset: Offset in the driver-owned PCM buffer on NOMMU systems.
  * @sgs: Payload scatter-gather table.
  */
 struct virtio_pcm_msg {
@@ -20,6 +24,9 @@ struct virtio_pcm_msg {
 	struct virtio_snd_pcm_xfer xfer;
 	struct virtio_snd_pcm_status status;
 	size_t length;
+#ifndef CONFIG_MMU
+	size_t data_offset;
+#endif
 	struct scatterlist sgs[];
 };
 
@@ -37,9 +44,8 @@ enum pcm_msg_sg_index {
 };
 
 /**
- * virtsnd_pcm_sg_num() - Count the number of sg-elements required to represent
- *                        vmalloc'ed buffer.
- * @data: Pointer to vmalloc'ed buffer.
+ * virtsnd_pcm_sg_num() - Count the sg-elements for a page-backed buffer.
+ * @data: Pointer to the page-backed buffer.
  * @length: Buffer size.
  *
  * Context: Any context.
@@ -47,15 +53,19 @@ enum pcm_msg_sg_index {
  */
 static int virtsnd_pcm_sg_num(u8 *data, unsigned int length)
 {
-	phys_addr_t sg_address;
-	unsigned int sg_length;
+	phys_addr_t sg_address = 0;
+	unsigned int sg_length = 0;
 	int num = 0;
 
 	while (length) {
 		struct page *pg = vmalloc_to_page(data);
-		phys_addr_t pg_address = page_to_phys(pg);
+		phys_addr_t pg_address;
 		size_t pg_length;
 
+		if (!pg)
+			return -EINVAL;
+		pg_address = page_to_phys(pg);
+
 		pg_length = PAGE_SIZE - offset_in_page(data);
 		if (pg_length > length)
 			pg_length = length;
@@ -75,11 +85,80 @@ static int virtsnd_pcm_sg_num(u8 *data, unsigned int length)
 	return num;
 }
 
+#ifdef CONFIG_MMU
+/**
+ * virtsnd_pcm_dma_pages_put() - Release retained PCM buffer pages.
+ * @vss: VirtIO PCM substream.
+ *
+ * Context: Process context.
+ */
+static void virtsnd_pcm_dma_pages_put(struct virtio_pcm_substream *vss)
+{
+	while (vss->ndma_pages)
+		put_page(vss->dma_pages[--vss->ndma_pages]);
+	kfree(vss->dma_pages);
+	vss->dma_pages = NULL;
+}
+
 /**
- * virtsnd_pcm_sg_from() - Build sg-list from vmalloc'ed buffer.
+ * virtsnd_pcm_dma_pages_get() - Retain the pages backing the PCM buffer.
+ * @vss: VirtIO PCM substream.
+ * @data: PCM buffer address.
+ * @length: PCM buffer size.
+ *
+ * Keep the backing pages alive while virtqueue descriptors can still refer to
+ * them, even if ALSA releases the vmalloc mapping after a failed drain.
+ *
+ * Context: Process context.
+ * Return: 0 on success, -errno on failure.
+ */
+static int virtsnd_pcm_dma_pages_get(struct virtio_pcm_substream *vss,
+				     u8 *data, size_t length)
+{
+	size_t i;
+	size_t npages;
+	size_t span;
+
+	if (!data || !length || !is_vmalloc_addr(data))
+		return -EINVAL;
+	if (vss->dma_pages || vss->ndma_pages)
+		return -EBUSY;
+
+	if (check_add_overflow(length, (size_t)offset_in_page(data), &span))
+		return -EOVERFLOW;
+
+	npages = span / PAGE_SIZE + !!(span % PAGE_SIZE);
+	if (npages > UINT_MAX)
+		return -EOVERFLOW;
+
+	vss->dma_pages = kcalloc(npages, sizeof(*vss->dma_pages), GFP_KERNEL);
+	if (!vss->dma_pages)
+		return -ENOMEM;
+
+	for (i = 0; i < npages; i++) {
+		struct page *page = vmalloc_to_page(data + i * PAGE_SIZE);
+
+		if (!page)
+			goto err_put_pages;
+
+		get_page(page);
+		vss->dma_pages[vss->ndma_pages++] = page;
+	}
+
+	return 0;
+
+err_put_pages:
+	virtsnd_pcm_dma_pages_put(vss);
+
+	return -EINVAL;
+}
+#endif
+
+/**
+ * virtsnd_pcm_sg_from() - Build an sg-list from a page-backed buffer.
  * @sgs: Preallocated sg-list to populate.
  * @nsgs: The maximum number of elements in the @sgs.
- * @data: Pointer to vmalloc'ed buffer.
+ * @data: Pointer to the page-backed buffer.
  * @length: Buffer size.
  *
  * Splits the buffer into physically contiguous parts and makes an sg-list of
@@ -132,36 +211,99 @@ static void virtsnd_pcm_sg_from(struct scatterlist *sgs, int nsgs, u8 *data,
 int virtsnd_pcm_msg_alloc(struct virtio_pcm_substream *vss,
 			  unsigned int periods, unsigned int period_bytes)
 {
-	struct snd_pcm_runtime *runtime = vss->substream->runtime;
+	struct snd_pcm_runtime *runtime;
+	size_t buffer_bytes;
 	unsigned int i;
+	int rc;
 
-	vss->msgs = kzalloc_objs(*vss->msgs, periods);
-	if (!vss->msgs)
+	if (vss->msgs || vss->nmsgs || vss->dma_pages || vss->ndma_pages)
+		return -EBUSY;
+#ifndef CONFIG_MMU
+	if (vss->owned_dma_area || vss->owned_dma_bytes)
+		return -EBUSY;
+#endif
+	if (!periods || !period_bytes)
+		return -EINVAL;
+
+	if (check_mul_overflow((size_t)periods, (size_t)period_bytes,
+			       &buffer_bytes))
+		return -EOVERFLOW;
+
+	if (!vss->substream || !vss->substream->runtime)
+		return -EINVAL;
+	runtime = vss->substream->runtime;
+	if (!runtime->dma_area || buffer_bytes > runtime->dma_bytes)
+		return -EINVAL;
+
+#ifdef CONFIG_MMU
+	rc = virtsnd_pcm_dma_pages_get(vss, runtime->dma_area, buffer_bytes);
+	if (rc)
+		return rc;
+#else
+	vss->owned_dma_area = kzalloc(buffer_bytes, GFP_KERNEL);
+	if (!vss->owned_dma_area)
 		return -ENOMEM;
+	vss->owned_dma_bytes = buffer_bytes;
+#endif
+
+	vss->msgs = kzalloc_objs(*vss->msgs, periods);
+	if (!vss->msgs) {
+		rc = -ENOMEM;
+		goto err_free_pages;
+	}
 
 	vss->nmsgs = periods;
 
 	for (i = 0; i < periods; ++i) {
-		u8 *data = runtime->dma_area + period_bytes * i;
-		int sg_num = virtsnd_pcm_sg_num(data, period_bytes);
+		int sg_num;
 		struct virtio_pcm_msg *msg;
+		u8 *data;
+#ifdef CONFIG_MMU
+		data = runtime->dma_area + (size_t)period_bytes * i;
+#else
+		data = vss->owned_dma_area + (size_t)period_bytes * i;
+#endif
+		sg_num = virtsnd_pcm_sg_num(data, period_bytes);
+		if (sg_num < 0) {
+			rc = sg_num;
+			goto err_free_msgs;
+		}
 
 		msg = kzalloc_flex(*msg, sgs, sg_num + 2);
-		if (!msg)
-			return -ENOMEM;
+		if (!msg) {
+			rc = -ENOMEM;
+			goto err_free_msgs;
+		}
 
 		msg->substream = vss;
+		vss->msgs[i] = msg;
 		sg_init_one(&msg->sgs[PCM_MSG_SG_XFER], &msg->xfer,
 			    sizeof(msg->xfer));
 		sg_init_one(&msg->sgs[PCM_MSG_SG_STATUS], &msg->status,
 			    sizeof(msg->status));
+#ifndef CONFIG_MMU
+		msg->data_offset = (size_t)period_bytes * i;
+#endif
 		virtsnd_pcm_sg_from(&msg->sgs[PCM_MSG_SG_DATA], sg_num, data,
 				    period_bytes);
-
-		vss->msgs[i] = msg;
 	}
 
 	return 0;
+
+err_free_msgs:
+	virtsnd_pcm_msg_free(vss);
+	return rc;
+
+err_free_pages:
+#ifdef CONFIG_MMU
+	virtsnd_pcm_dma_pages_put(vss);
+#else
+	kfree(vss->owned_dma_area);
+	vss->owned_dma_area = NULL;
+	vss->owned_dma_bytes = 0;
+#endif
+
+	return rc;
 }
 
 /**
@@ -177,6 +319,13 @@ void virtsnd_pcm_msg_free(struct virtio_pcm_substream *vss)
 	for (i = 0; vss->msgs && i < vss->nmsgs; ++i)
 		kfree(vss->msgs[i]);
 	kfree(vss->msgs);
+#ifdef CONFIG_MMU
+	virtsnd_pcm_dma_pages_put(vss);
+#else
+	kfree(vss->owned_dma_area);
+	vss->owned_dma_area = NULL;
+	vss->owned_dma_bytes = 0;
+#endif
 
 	vss->msgs = NULL;
 	vss->nmsgs = 0;
@@ -249,6 +398,33 @@ int virtsnd_pcm_msg_send(struct virtio_pcm_substream *vss, unsigned long offset,
 			msg->xfer.stream_id = cpu_to_le32(vss->sid);
 			memset(&msg->status, 0, sizeof(msg->status));
 
+#ifndef CONFIG_MMU
+		if (vss->direction == SNDRV_PCM_STREAM_PLAYBACK) {
+			struct snd_pcm_runtime *runtime =
+				vss->substream ? vss->substream->runtime : NULL;
+			size_t data_bytes = msg->length;
+
+			if (!runtime || !runtime->dma_area || !vss->owned_dma_area ||
+			    msg->data_offset > runtime->dma_bytes ||
+			    data_bytes > runtime->dma_bytes - msg->data_offset ||
+			    msg->data_offset > vss->owned_dma_bytes ||
+			    data_bytes > vss->owned_dma_bytes - msg->data_offset) {
+				dev_err_ratelimited(&vdev->dev,
+						    "SID %u: invalid playback buffer for I/O message\n",
+					vss->sid);
+				msg->length -= n;
+				if (msg_count != vss->msg_count &&
+				    !(vss->features &
+				      (1U << VIRTIO_SND_PCM_F_MSG_POLLING)) &&
+				    virtqueue_kick_prepare(vqueue))
+					virtqueue_notify(vqueue);
+				return -EINVAL;
+			}
+			memcpy(vss->owned_dma_area + msg->data_offset,
+			       runtime->dma_area + msg->data_offset, data_bytes);
+		}
+#endif
+
 			if (vss->direction == SNDRV_PCM_STREAM_PLAYBACK)
 				rc = virtqueue_add_sgs(vqueue, psgs, 2, 1, msg,
 						       GFP_ATOMIC);
@@ -363,15 +539,48 @@ static void virtsnd_pcm_msg_complete(struct virtio_pcm_msg *msg,
 	 * the hw_ptr value is unconditionally advanced.
 	 */
 	guard(spinlock)(&vss->lock);
+#ifndef CONFIG_MMU
+	if (vss->direction == SNDRV_PCM_STREAM_CAPTURE &&
+	    vss->xfer_enabled && written_bytes > sizeof(msg->status)) {
+		struct snd_pcm_runtime *runtime =
+			vss->substream ? vss->substream->runtime : NULL;
+		size_t reported_bytes = written_bytes - sizeof(msg->status);
+		size_t data_bytes = min_t(size_t, reported_bytes, msg->length);
+
+		if (!runtime || !runtime->dma_area || !vss->owned_dma_area ||
+		    msg->data_offset > runtime->dma_bytes ||
+		    data_bytes > runtime->dma_bytes - msg->data_offset ||
+		    msg->data_offset > vss->owned_dma_bytes ||
+		    data_bytes > vss->owned_dma_bytes - msg->data_offset)
+			dev_err_ratelimited(&vss->snd->vdev->dev,
+					    "SID %u: invalid capture buffer for I/O message\n",
+				vss->sid);
+		else
+			memcpy(runtime->dma_area + msg->data_offset,
+			       vss->owned_dma_area + msg->data_offset, data_bytes);
+	}
+#endif
+	if (vss->direction == SNDRV_PCM_STREAM_CAPTURE &&
+	    written_bytes > sizeof(msg->status) &&
+	    written_bytes - sizeof(msg->status) > msg->length)
+		dev_err_ratelimited(&vss->snd->vdev->dev,
+				    "SID %u: capture length exceeds I/O message capacity\n",
+			vss->sid);
 	/*
 	 * If the capture substream returned an incorrect status, then just
-	 * increase the hw_ptr by the message size.
+	 * increase the hw_ptr by the message size. Clamp valid capture lengths to
+	 * the actual SG payload capacity before accounting them.
 	 */
 	if (vss->direction == SNDRV_PCM_STREAM_PLAYBACK ||
-	    written_bytes <= sizeof(msg->status))
+	    written_bytes <= sizeof(msg->status)) {
 		vss->hw_ptr += msg->length;
-	else
-		vss->hw_ptr += written_bytes - sizeof(msg->status);
+	} else {
+		size_t data_bytes = min_t(size_t,
+					  written_bytes - sizeof(msg->status),
+					  msg->length);
+
+		vss->hw_ptr += data_bytes;
+	}
 
 	if (vss->hw_ptr >= vss->buffer_bytes)
 		vss->hw_ptr -= vss->buffer_bytes;
@@ -387,7 +596,6 @@ static void virtsnd_pcm_msg_complete(struct virtio_pcm_msg *msg,
 		runtime->delay =
 			bytes_to_frames(runtime,
 					le32_to_cpu(msg->status.latency_bytes));
-
 		schedule_work(&vss->elapsed_period);
 	} else if (!vss->msg_count) {
 		wake_up_all(&vss->msg_empty);
diff --git a/sound/virtio/virtio_pcm_ops.c b/sound/virtio/virtio_pcm_ops.c
index fe8e0dc3eafc..ac2f28686632 100644
--- a/sound/virtio/virtio_pcm_ops.c
+++ b/sound/virtio/virtio_pcm_ops.c
@@ -25,6 +25,8 @@
  *   signal or due to a timeout. In this case, the device can still access
  *   messages even after calling ops->hw_free(). It can also issue an interrupt,
  *   and the interrupt handler will also try to access message structures.
+ *   The messages retain references to the PCM buffer pages until they are
+ *   freed, so late DMA does not target pages released by ALSA.
  *
  *   Therefore, freeing of already allocated messages occurs:
  *
-- 
2.54.0 (Apple Git-157)

