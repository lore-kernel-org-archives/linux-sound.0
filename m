Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793693322;
	b=i4NrpSPe2y2EsFTS3sud3WrDbEcyM1C0rSPrgG8IPuZW4WGk2ksCHW4d/jXZYdRPJcT5
	 Njj0dYYATMJ6QNyyQHZ6FXK/lDrM++8o4r4Hvy/tC3NPAq06nnNAzhSVnwepFl3ke6uOv
	 6ZKHY0MJGW5EiIgeghDULdNubJ7DqZZezNWwCvDFrnYkoxX18PYzo6TZBFtafB8AW5cf5
	 ghIQnIMl7Hqm2yxun94u818Jt5xBeUJw8ZyFuYFtNUO5xLbn+ymfziq7LgD6ogsXQmU+q
	 3LzPUaaMt9ty2/UdSfdz/z58QOLpQ3gfHCqY5wOoqChvaK66IQPmw1NEd0EoGCKVzLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793693322;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=zdVoBfPiLk/nFs+s+NNTSOOa5GTOK7NH1tLwAWrfGUs=;
	b=XsVzTHxO2aBt/hkT+bZzQ1/t3fbEFKVRSjDvx41pqT+He9vYMCecOkDAbRMCuui1GYlL
	 M1RimUzQ2+z45Gb/nylugLaoDil0dz6TSCvetS7LXvZ0sivpfpc6km6nNtNqMVZeyOdK8
	 LfQ3+WzIt4Iv9/4QhwnPaNYtKTVdmm4Lf1mh3fNTVwFuUEML+cmggtWCE4d74BZD1IOXT
	 1zvdeUvyoSzaY0M7k9NOSdCxqyw6k/8rlar1BQhRKo5v/U4ozt1/qIuRxx0jPmPBRoygG
	 inSa2FF4JsLXx4ZgolPnzEKRZCQq+FPxEuOrDLsfPyBMSDkDFWrr9nZg5/fx4nD6zGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kbX4lUmZ;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E749C606A33A
	for <linux-sound@vger.kernel.org>; Tue,  3 Nov 2026 08:08:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E749C606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kbX4lUmZ
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-36a18fc7a38so7351810eec.1
        for <linux-sound@vger.kernel.org>; Tue, 03 Nov 2026 00:08:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793693321; x=1794298121; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zdVoBfPiLk/nFs+s+NNTSOOa5GTOK7NH1tLwAWrfGUs=;
        b=kbX4lUmZ3P7JHDx5fSr4uQwRtKKwTThhRSvL6Ln3iy1eeNBXQM+4LPm433oe2vnkjQ
         YwKQ7cGD6tjrxxJuv7GBnS60vSbNh8b3Y5TrdTQG6CO/8/MPN7OtnnHsTP5Kc2auV67N
         Bw7XTVUiY6W+FcXnokoaH30Zjk021HJNerNW03+Dfdej2sHgMPagTDIp2w7tb37mXXaS
         WFpD043RfPrK2fYDLsKKC4+lmwND92+OP72EKU+Sodo6KHOhS5Jd1SFktcQPDZnbeqsy
         D+d2lxGfcRqR1HNEeYc9oiGugbBshOMLlxXbZgSY5B39s2ZNH+Wssj0nHA3AyOIqCaiv
         MFcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793693321; x=1794298121;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zdVoBfPiLk/nFs+s+NNTSOOa5GTOK7NH1tLwAWrfGUs=;
        b=t+9KGSM51YPaKhWGIe1xPYKgCcCsbQ5oOy9JZgI2e/fy2shbAwZjvFuPk6E6qdfNh7
         UzpkKjDgyCiwqVr73WXoN+Wkr+VgtEOpKbtSFcObbf7Is1g9qtXBqFGmI0yxtoIqE6tT
         zHePznKupJ+Bd7HDijepCdgMN32ORo1gdJZDBumCRiwpSKiaCjxcKPZJdIShpXnhAzIJ
         YHbTeRl7l7BYYUlAzp/QawMqJBtSA0Qobs+AWXxYBm8jb94AP+238+Tz4lYKRnHKuOZe
         Junwm2H/qtpWzGfSJsKSpfWJAOVRLEhZU8m424hWqe7o6KZFq+3RhzZhs0eCFplg0Wo1
         eqAw==
X-Gm-Message-State: APuU4Z9beNojy+JT/qIpOQu8yB+pSXT/QxfRM1wtRUS69VvgPE1KIY8L
	zO3OTxH6inBNcw8GxJOIGxUPiOB8pTSG3IticGR+uWh8a8Dxfe/JQN0KGWiuvg==
X-Gm-Gg: AYBFou3Fcre628Qe9O4GHbi7JmZKgxpvFfd0FhWGumLqYhRCBAtP7onhP23BG5osLtu
	wq3BKt6gXcrzNtVjp77e3dPxGtTLWccfeTdj34ckIASLJyJdCSmVyQDwe7olTsjjo5AYSqIiqbv
	kVRQcFKy/YLDeGXXIh79Zdvq5hiPi1UCYjhY/RceaRswtTdig+TD6W63EHilY89el6ER7CRHZQ7
	ZkIljG4lms5RO7H/c2qXag/h7rh/++m/UYmOFDZeDn/qGXdJwMwY8CuhzkIHLxb/XBPmoLGRrK9
	QRyCT09KWNiBuzraNJ0bjnq01C7pzojTPumztSEIsS0o71gnci7A2lVI1nehMj+DvSKbrQCxpG4
	9LXKgqASEZQkbDPKnLqEaY/LQHV46t3+Z8r2SvlgmHq/3e85xIqLVZjZCTrkATWYxKyR2IRr+SQ
	zpzUCHDvQ0KaN24VFhG+lEJvguMMzKpS6Xv6Lwn4JuYyi/1YHI1fsGywbt6Laui7iqVOCbq9jCA
	RQT9UDpEMnsAledG+4P+7eMDr70W+b773KggykrU02CW+0aez6YYDKc7mFcbIL4Lfd82eMwBaBt
	6IlksbYaK63zZjN3PSk+vIJLe/vpjMVGH1hyQMLZ0WeIUa2fSu+Rqa1pCGJx3KkXo0ImPJgT8mw
	7CP/BoX2GpSRAqZKGJP7YKd++uGWa8XNXrwPjijLq+Mm3fS8=
X-Received: by 2002:a05:7301:6404:b0:36a:79e7:2fd with SMTP id 5a478bee46e88-36a79e708c7mr3102637eec.40.1793693320906;
        Tue, 03 Nov 2026 00:08:40 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428fa380sm41468466eec.12.2026.11.03.00.08.37
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 03 Nov 2026 00:08:40 -0800 (PST)
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
Subject: [PATCH v13 04/12] ALSA: virtio: Keep PCM DMA buffers alive through device ownership
Date: Tue,  3 Nov 2026 17:08:13 +0900
Message-ID: <20261103080821.16983-5-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261103080821.16983-1-mynameisjune111@gmail.com>
References: <20261103080821.16983-1-mynameisjune111@gmail.com>
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

Seed the ordinary capture ring once per prepare. Native STOP preserves
queued requests and unread samples, so PAUSE_RELEASE must retain their
ownership. Re-enqueuing the entire ring adds another period to pending
message lengths and exposes unread DMA slots to the device. Return
consumed space through the existing indirect ACK path.

Fixes: f40a28679e0b ("ALSA: virtio: handling control and I/O messages for the PCM device")
Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
 sound/virtio/virtio_pcm.h     |   13 ++
 sound/virtio/virtio_pcm_msg.c |  262 +++++++++++++++++++++++++++++++++++++----
 sound/virtio/virtio_pcm_ops.c |   19 +++
 3 files changed, 270 insertions(+), 24 deletions(-)

diff --git a/sound/virtio/virtio_pcm.h b/sound/virtio/virtio_pcm.h
--- a/sound/virtio/virtio_pcm.h
+++ b/sound/virtio/virtio_pcm.h
@@ -13,6 +13,7 @@
 
 struct virtio_pcm;
 struct virtio_pcm_msg;
+struct page;
 
 /**
  * struct virtio_pcm_substream - VirtIO PCM substream.
@@ -29,6 +30,7 @@
  *        substream operators, including @stopped.
  * @buffer_bytes: Current buffer size in bytes.
  * @hw_ptr: Substream hardware pointer value in bytes [0 ... buffer_bytes).
+ * @capture_rx_seeded: Ordinary capture ring was queued since prepare.
  * @xfer_enabled: Data transfer state (0 - off, 1 - on).
  * @xfer_xrun: Data underflow/overflow state (0 - no xrun, 1 - xrun).
  * @stopped: True if the substream is stopped and must be released on the device
@@ -38,6 +40,10 @@
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
@@ -53,6 +59,7 @@
 	spinlock_t lock;
 	size_t buffer_bytes;
 	size_t hw_ptr;
+	bool capture_rx_seeded;
 	bool xfer_enabled;
 	bool xfer_xrun;
 	bool stopped;
@@ -62,6 +69,12 @@
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
@@ -199,6 +348,7 @@
 	guard(spinlock_irqsave)(&vss->lock);
 	for (i = 0; vss->msgs && i < vss->nmsgs; ++i)
 		vss->msgs[i]->length = 0;
+	vss->capture_rx_seeded = false;
 }
 
 /**
@@ -228,8 +378,15 @@
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
@@ -248,6 +405,33 @@
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
@@ -363,15 +547,48 @@
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
@@ -387,7 +604,6 @@
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
@@ -380,8 +393,12 @@
 				substream->runtime->stop_operating = true;
 				return -EBADFD;
 			}
-			if (vss->direction == SNDRV_PCM_STREAM_CAPTURE)
+			if (vss->direction == SNDRV_PCM_STREAM_CAPTURE &&
+			    !vss->capture_rx_seeded) {
 				rc = virtsnd_pcm_msg_send(vss, 0, vss->buffer_bytes);
+				if (!rc)
+					vss->capture_rx_seeded = true;
+			}
 			if (rc) {
 				vss->stopped = true;
 				substream->runtime->stop_operating = true;
