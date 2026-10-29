Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793263857;
	b=bnoQ3/L8vP9+ktp8K4ut16klQ95kP31L8TwZZdvfSgzZGwVFe73gshf8RvehAerhKOYf
	 bCYCEa6yLoMkjnJPQVxnfxBKrHExv+ubvHQR0isPIZ2QnLk4sv1moxNNOzMox829y5tHc
	 JmPQEXqTTzXasqBC6agkLTGeBNthAbhNrEZUqVGi3YJ8gb/x9tcgiG8PandShnCfQV00r
	 uRI5AmIMZ2EMnwx0DwTfqPcHsw+YvIMAyJ3va3ZJ2sM33p5oJyFTPu1WoTifC/IlU0TAx
	 bBD0HliZRjJDLvoNZtb1zE7XQ5IcOQ0/t0beDvnQV9n6frdmvsTIgTz7KKKk2Hj/qew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793263857;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=9vdyM2XBkHREi9ZLEpDGlK6JdyxKbK63i++KHNm90MY=;
	b=hG0lIZ+gpoQVNBuBmKEuIDqwlPj7GGoOeR/IYMiPF9ieBdfffgrdtuQyl4FObvUSEed1
	 6s0TUHX/sYkfr5mikxxOTC6EkYBd/zFIk54M9XjCtXlRSHfTk0juefrWiH34x7uHOQ4dr
	 ZZbyWL5xiQ9f7MrHxLUGQ76O7WM4P+/FqNJCMm/aF2991fy1YbFaWbMbOWiZH96+ScOU0
	 QyjK2utuDocggZsXiGt6F381t4++zfuUrThJhyVUiws9L4weoKrJ4M25pYNs43rTfjjpu
	 7TDV9+i7dkzi/uSA8uuzPPtwmbkaFfxK5uL3Xrvvti8kLkKXLHntFoeVYjgpFuB33wA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SmIKc7nZ;
	arc=none smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77C1B606A324
	for <linux-sound@vger.kernel.org>; Thu, 29 Oct 2026 08:50:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77C1B606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SmIKc7nZ
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2e8246b13cbso15947365ad.2
        for <linux-sound@vger.kernel.org>; Thu, 29 Oct 2026 01:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793263857; x=1793868657; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9vdyM2XBkHREi9ZLEpDGlK6JdyxKbK63i++KHNm90MY=;
        b=SmIKc7nZR8u5woSSUiaj8CWvTOyMPrTe7BI//63bE4YJ+kGDOX8sEhiW7zn2uJZDCs
         GUY/GF23ksJBn18tp74Ali1JUVsOcrf0gsQuWlM1yAtTlshSlRx3tRjV6aRyYGN/DyWg
         9Isoqbu4zdRFTNHy+8dda6xl9dLTkcqfxtmbuIgtURsN9/y8RQS6bgbYHvSP01Xf9nk2
         tRGmCy9ZAZDCL6sDLRLEnLSQ/guhk9wW4idroDu9NyIeTnA4djMUt1+DhilEaOwdduMA
         lA+/LhY8BlvGuEJswpzBcsZk8cO7odzJUs6nN3mpQO9qsj9PRNvwvnFZ/C0Ypx0K7Okj
         XlXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793263857; x=1793868657;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9vdyM2XBkHREi9ZLEpDGlK6JdyxKbK63i++KHNm90MY=;
        b=hvhFW1ITrS1qkakZZCY+YKkxZOx4HEaeh7AiHau5lFJwr1/M1huy9w1D1fEXCsxme3
         WqX5ZJvqngxlAXDD8lMQiP04zDjL5X/DVvUNrWvYkPw9/hmkTqWzgwW70TlU1AOsySsB
         9OjoOeZrycguT9ClJ5IF536TtJS2XowfjBbiHhtPjb1YxuWrzDqdH3shuMLLGseyPaEH
         CZkT158Qz5pzRjz3YmBSIkwrDN2aGd4tkqBbdATZoe6UW4BzyGePRciEsE84AqlHO5Lt
         II/oTkMhCUu0CdAqkqz1B8tC9vQBfDBwd0PObe1Sx1El8TSUOlc5+7m8u9oSWWuUle3N
         ciCQ==
X-Gm-Message-State: AFq9FYKPoyr3e3jRx4uJjecxDKxiCmZ0fbE0zQ2Y5tNL2N7YYv4lPuBe
	fsfrGLjgWU96ChU0NoKzUlvoPJiO1PjlJG71c91jWh81ljZihhFRBqy7beC8Ag==
X-Gm-Gg: AYBFou1QHorUIP5RmrfNHWBDk9hQ6KP8/tscTr2JvEBC8ivQ/9I3mSagMEKdU02GGoa
	Yub99UBQrn8VUAQojUgQpbn9he1g6S8TJq0cOZwgmEKqnwMqtfK3PdA+09dsyZgRezLGzruD7yI
	AUVW7OOwzs08YFvjF9OGcB0c4iRfiZ2OQCMuxR8H4itA2fFnHLB7VUuUltTmDvvAkphnQdAX4rp
	kA6RcccsOdfbN+k8Ou5uzznCEy3hh+6vi7TbxF14Of1pnFfGFCLOeLwmxThjTJWTWX8VWUyFkmL
	zrKNfQIXiSl81BYvnVk0pGa9xQhSd6I5CZgmKMv4RC8J9Mn/hxDX+Ueu8QaIKOG7Jrldv1wR7m3
	4MbIFuvd2iUcabtPhhsmu4Z5iGRXxe9z9cWJBXWtc3UFl+/KAmWvlb7j1SkPP5WjUHepS0HnxWo
	yBsRVF4H1eY96ZMnFJfbUxgQNI2OwVAH2rPFK1Sr/ile39OFDqr9oq6MepzpUDDxf8umd3oplVE
	rMnTNEyTnUWsrECHlcg5KzDQb80GUyvFSDxNFhu2wLZTtgJnH8/cpH7qQpkK0kj/WkejJL7GT8/
	zfA4NOYcYd9B8A3imul9V8slSZf7FPORJffqKigSjdzKfEeGIYcl40xRiZv6RWUMouaVTTMbZg6
	XT1XnYIx7alUgBV75rA3uotopWoS0VzLXxkRFsNMuew==
X-Received: by 2002:a17:903:32ce:b0:2df:4876:50d9 with SMTP id d9443c01a7336-2eb0033f5c7mr43411365ad.18.1793263856778;
        Thu, 29 Oct 2026 01:50:56 -0700 (PDT)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6bddae0sm29991205ad.35.2026.10.29.01.50.53
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 29 Oct 2026 01:50:56 -0700 (PDT)
From: Joonho Lee <mynameisjune111@gmail.com>
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.de,
	perex@perex.cz,
	anton.yakovlev@opensynergy.com,
	mst@redhat.com,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	linux-doc@vger.kernel.org,
	Joonho Lee <mynameisjune111@gmail.com>
Subject: [PATCH v9 04/14] ALSA: virtio: Keep PCM DMA buffers alive through device ownership
Date: Thu, 29 Oct 2026 17:50:22 +0900
Message-ID: <20261029085032.70689-5-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261029085032.70689-1-mynameisjune111@gmail.com>
References: <20261029085032.70689-1-mynameisjune111@gmail.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
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

Require whole-byte periods whose total matches the negotiated buffer.
Check offset, length and the final message index before indexing the
message array, including empty transfers and arithmetic wraparound.

Fixes: f40a28679e0b ("ALSA: virtio: handling control and I/O messages for the PCM device")
Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
diff --git a/sound/virtio/virtio_pcm.h b/sound/virtio/virtio_pcm.h
--- a/sound/virtio/virtio_pcm.h
+++ b/sound/virtio/virtio_pcm.h
@@ -13,6 +13,7 @@
 
 struct virtio_pcm;
 struct virtio_pcm_msg;
+struct page;
 
 /**
  * struct virtio_pcm_substream - VirtIO PCM substream.
@@ -38,6 +39,10 @@
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
@@ -62,6 +67,12 @@
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
@@ -20,6 +24,9 @@
 	struct virtio_snd_pcm_xfer xfer;
 	struct virtio_snd_pcm_status status;
 	size_t length;
+#ifndef CONFIG_MMU
+	size_t data_offset;
+#endif
 	struct scatterlist sgs[];
 };
 
@@ -37,9 +44,8 @@
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
@@ -47,14 +53,18 @@
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
+
+		if (!pg)
+			return -EINVAL;
+		pg_address = page_to_phys(pg);
 
 		pg_length = PAGE_SIZE - offset_in_page(data);
 		if (pg_length > length)
@@ -75,11 +85,80 @@
 	return num;
 }
 
-/**
- * virtsnd_pcm_sg_from() - Build sg-list from vmalloc'ed buffer.
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
+/**
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
@@ -132,36 +211,99 @@
 int virtsnd_pcm_msg_alloc(struct virtio_pcm_substream *vss,
 			  unsigned int periods, unsigned int period_bytes)
 {
-	struct snd_pcm_runtime *runtime = vss->substream->runtime;
+	struct snd_pcm_runtime *runtime;
+	size_t buffer_bytes;
 	unsigned int i;
+	int rc;
+
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
+		return -ENOMEM;
+	vss->owned_dma_bytes = buffer_bytes;
+#endif
 
 	vss->msgs = kzalloc_objs(*vss->msgs, periods);
-	if (!vss->msgs)
-		return -ENOMEM;
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
@@ -177,6 +319,13 @@
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
@@ -228,8 +377,15 @@
 	bool notify = false;
 	int rc;
 
+	if (!bytes)
+		return 0;
+	if (!period_bytes || !vss->msgs || offset >= vss->buffer_bytes ||
+	    bytes > vss->buffer_bytes - offset)
+		return -EINVAL;
 	start = offset / period_bytes;
 	end = (offset + bytes - 1) / period_bytes;
+	if (end >= vss->nmsgs)
+		return -EINVAL;
 
 	for (i = start; i <= end; i++) {
 		struct virtio_pcm_msg *msg = vss->msgs[i];
@@ -248,6 +404,33 @@
 		if (msg->length == period_bytes) {
 			msg->xfer.stream_id = cpu_to_le32(vss->sid);
 			memset(&msg->status, 0, sizeof(msg->status));
+
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
 
 			if (vss->direction == SNDRV_PCM_STREAM_PLAYBACK)
 				rc = virtqueue_add_sgs(vqueue, psgs, 2, 1, msg,
@@ -363,15 +546,48 @@
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
@@ -387,7 +603,6 @@
 		runtime->delay =
 			bytes_to_frames(runtime,
 					le32_to_cpu(msg->status.latency_bytes));
-
 		schedule_work(&vss->elapsed_period);
 	} else if (!vss->msg_count) {
 		wake_up_all(&vss->msg_empty);
diff --git a/sound/virtio/virtio_pcm_ops.c b/sound/virtio/virtio_pcm_ops.c
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
@@ -228,8 +230,19 @@
 	struct virtio_pcm_substream *vss = snd_pcm_substream_chip(substream);
 	struct virtio_device *vdev = vss->snd->vdev;
 	unsigned int msg_count;
+	size_t period_buffer_bytes;
 	bool stopped;
 	int rc;
+
+	/* Fixed descriptors require whole-byte periods covering the buffer. */
+	if (check_mul_overflow((size_t)params_periods(hw_params),
+			       (size_t)params_period_bytes(hw_params),
+			       &period_buffer_bytes) ||
+	    period_buffer_bytes != params_buffer_bytes(hw_params) ||
+	    (params_period_size(hw_params) *
+	     (u64)snd_pcm_format_physical_width(params_format(hw_params)) *
+	     params_channels(hw_params)) % 8)
+		return -EINVAL;
 
 	scoped_guard(spinlock_irqsave, &vss->lock) {
 		msg_count = vss->msg_count;
