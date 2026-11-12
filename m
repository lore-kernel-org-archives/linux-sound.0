Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794466214;
	b=lxyoz9MPRyOVHau2ITJVTbnT9haq/n04RBD9dGrZkywS+9TK8AjHwRiueUcWKYH3128V
	 jvMeEv5Z/Rm/VaeS2/30uuB0LDAIBg5Xz6xOoZRJQaVlHkl50UAIxJ+n6VNoDZwlW6yD1
	 7uIvV7NTcXyApgWU4CCWzWtOggEUD/jPe/RjXhN07GpS7NJVC/uH22XPl2g4iu8nvxDVf
	 iZmBNDJTIJt8gtJWm8ajgYxCWQmWLF0kzWEDbRCfYgC/zYYgMhAEnq0YiWiaUWb8g0lfk
	 bCrXG9o+VufvW5Hu+reDSMtAtUcQu4FpecP6xtdO5AW4djOvJdnMUz+0Qf2bKqhz6sw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794466214;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=E1C6MwGmto0Ni/oz9boWWLYaIKykM0+fl/kiUtXd6lo=;
	b=4wZhZ9zSnCL5VlK1p0YTaOVcBoQKAtgEUrbBeJ/+Y0WGz+Yx0yKbOEazBkEN8rLUVtpP
	 iPxVC/wPC79geJWjVChwweRsUbn7XxClItp/HUEODM8BLACN8BIPnGarQzGr7CjUM7ewB
	 kV9ZIyQiub1ACkuqeGEwTTx52ByPB68Zb/+M3L7wdkcR+f59So4yE3dN7B/b23ljHFIIz
	 nQNbAovYbkzon3nyIfWm25bFHziXZT3+c+g+PC/AxS9TtqVG6Ge8vlVLQHpXwhihKS+bT
	 Oiwnr79mHiPJsnOxghHf9ZNeCz4dfGZ2W5D602KyTSr5dfzRVcFfu1CoeUhUjBqFxmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="DdqS/z+l";
	arc=none smtp.remote-ip=209.85.210.178
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A36EB606B484
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 06:50:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A36EB606B484
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DdqS/z+l
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8a60f90a924so1619194b3a.3
        for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 22:50:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794466213; x=1795071013; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E1C6MwGmto0Ni/oz9boWWLYaIKykM0+fl/kiUtXd6lo=;
        b=DdqS/z+lHTY1GMVlM6HoBoYG8rZTURayYX5vHv430a3kCd/vA1wKbU9IRp0RM4Ha4+
         8vdLMLh6LBbp3s9IKRCFxqFqr7wadE6NhMyvx8tXqsVTJnGP0WeZRSFNRRQSJTjzTOiV
         Q9kMj6Q05wJeXfogKRh+4AorbD3TVFOzzGgVvIlsNsqU86bRnKR9UF1oLyztwDE1nbtB
         uzkW2LcBYOlUkr+P9WKs/sw3sgF/kQB9gqMvND7hGJ4/aeqtd9imz0DPjqB6jRaJgpzt
         M4EgRP49vVmpWP7p2OODSXgBaATICJ16/9pdsE0Pf0y5xZmsm33+BC94KXjzUq6XNHfM
         sAOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794466213; x=1795071013;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=E1C6MwGmto0Ni/oz9boWWLYaIKykM0+fl/kiUtXd6lo=;
        b=xU6XPr/Cv6FWlYU/d2sGwo5j1oRVi04gL+DhosUh4dMC1053gIO6u4wPiqlRsi2XpX
         ypmnR4Tx/luCRPo4FQJuIV+1VoB057ZSUFuDJ9x/qzvJH/FIm99OrYV17FyPXprZlxvp
         Rf+E1Svhsngz1CQ0eYe6iSqXzrMcgwxzJo2sTWUu6SA70FNiTuuC67Qm5PQQhZda6D+k
         caniW68nZ57IsKBkvLG7JhdP2Oq/7zijMq0Zy698fY4JwVorM1W7PdChNYBxsbpR5zC+
         PK+P8sr/Ei7xlU9tkQVFZ4WnzMMNxFGPVtZsNCOJuiGJrOtIARXFtefHZcHe1HmDohYe
         v47w==
X-Gm-Message-State: APuU4Z+xJXSCkiZx+Gzv3rj75AGdHIHxN3RpP3qN02BELnZp4xZiH3g/
	B08XO/TV1I1Pu34JjIbKkf1eMTMJ0OO3GzY6OzYp01s/ChHMhP2zBRDw8lj8bg==
X-Gm-Gg: AYBFou2viJtnkzPH5wsrrdbztaQgZoHxBArEf+E/Pa40BI9Jpf1I9tpsOK3TZnNR1cQ
	ml1lpy89mOtupxaI1KBfqgg0qDGEKdb0wKvfrXQRC5p/9Eyfru3PogheuTjlE6G8ZUOZ/GfTSN+
	36j5mOj7dPSO1ncTXeE/m3aEXEH3TeREUBQqYZkmLmSQmIwEK4k6i7dmxyEPlKz5NPiw60G4pN+
	rfyfQNoqai3i4/sdlNtSFxPI4mfkR5kyENLH1L8lFNiEY2xMjh7RIT5Y8ZLV3GE3S1rxtzurYeI
	MWelrAuFonj9nH/7BAbAdBmuDX+ogelS4omsPNceykS70PNPZt0Qeds68Vy00HjDztZZfnh/k3w
	jbeEwGViNeL7i6b4orJGikoOTf8Y2W6ExYPpnD3f/+yv9bFY89iNx2CbE+pbhSr7K0IvOXFLmqm
	h79nLxcf95EPLw+liDNpFpKpbgQpuX3GX3/+Pcuegz1WSjmY8yBiuy/CuPLpkpY/Cmn8fMESRyp
	VZzhiLw6ADNpSUV/yQ1qIfqdpV68V8d/xJ4lCpkt6R913+zcQjNTjp97pf8mKijMxTvZLfzVZA5
	/588tQXexm36cZo+midC9t312IG41Cs+NcDO3te8pZUFnpmcsUAUbV1RFahf17sRmPSA9FjdX1U
	0WDtDRCn3XZ4+YeVB3cksgwUdLXRDDFS7OL7WLzSVXe0jqbgWLCm07uR1nVO33LXFIQJQ
X-Received: by 2002:a05:6a00:9087:b0:8a5:cd1a:218c with SMTP id d2e1a72fcca58-8bc1def0d6fmr4986576b3a.42.1794466212865;
        Wed, 11 Nov 2026 22:50:12 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baab1228e2sm3097511b3a.41.2026.11.11.22.50.09
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 22:50:12 -0800 (PST)
From: Joonho Lee <mynameisjune111@gmail.com>
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.com,
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
Subject: [PATCH v31 10/17] ALSA: virtio: Keep control payloads alive through DMA completion
Date: Thu, 12 Nov 2026 15:49:22 +0900
Message-ID: <20261112064929.11211-11-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261112064929.11211-1-mynameisjune111@gmail.com>
References: <20261112064929.11211-1-mynameisjune111@gmail.com>
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

Control requests can expose caller-owned payloads to the device after a
synchronous send times out. Keep request and response headers and
payloads in the reference-counted message so caller cleanup cannot
invalidate DMA.

Keep the queue reference until device completion or post-reset cleanup,
even when the caller times out or is interrupted. Consume the caller's
reference on every send path, and let response readers retain an extra
reference through copyout. Check payload sizes and allocation arithmetic
before building the scatterlists.

A control value payload is also read by the CPU as a typed structure.
DMA cacheline alignment alone does not guarantee the structure's CPU
alignment. Align regions to the greater of the DMA cacheline and
control-value type alignment, and reserve prefix slack from the buffer
base so typed accesses remain aligned while scatterlist regions stay on
cacheline boundaries.

Keep response values in a separately allocated aligned response buffer
so INTEGER64 control accesses are aligned from this patch onward.

Fixes: 9d45e514da88 ("ALSA: virtio: handling control messages")
Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
sound/virtio/virtio_ctl_msg.c |  289 +++++++++++++++++++++++++++++++----------
 sound/virtio/virtio_ctl_msg.h |   24 ++-
 sound/virtio/virtio_kctl.c    |  121 +++++++++--------
 sound/virtio/virtio_pcm_msg.c |    2 
 4 files changed, 300 insertions(+), 136 deletions(-)

diff --git a/sound/virtio/virtio_ctl_msg.c b/sound/virtio/virtio_ctl_msg.c
--- a/sound/virtio/virtio_ctl_msg.c
+++ b/sound/virtio/virtio_ctl_msg.c
@@ -3,7 +3,10 @@
  * virtio-snd: Virtio sound device
  * Copyright (C) 2021 OpenSynergy GmbH
  */
+#include <linux/dma-mapping.h>
+#include <linux/limits.h>
 #include <linux/moduleparam.h>
+#include <linux/overflow.h>
 #include <linux/virtio_config.h>
 
 #include "virtio_card.h"
@@ -11,7 +14,12 @@
 /**
  * struct virtio_snd_msg - Control message.
  * @sg_request: Scattergather list containing a device request (header).
+ * @sg_request_data: Scattergather list containing request data.
  * @sg_response: Scattergather list containing a device response (status).
+ * @sg_response_data: Scattergather list containing response data.
+ * @dma_buffer: Message-owned storage for all DMA-visible SG regions.
+ * @request_data_size: Size of the request data buffer.
+ * @response_data_size: Size of the response data buffer.
  * @list: Pending message list entry.
  * @notify: Request completed notification.
  * @ref_count: Reference count used to manage a message lifetime.
@@ -19,7 +27,12 @@
  */
 struct virtio_snd_msg {
 	struct scatterlist sg_request;
+	struct scatterlist sg_request_data;
 	struct scatterlist sg_response;
+	struct scatterlist sg_response_data;
+	void *dma_buffer;
+	size_t request_data_size;
+	size_t response_data_size;
 	struct list_head list;
 	struct completion notify;
 	refcount_t ref_count;
@@ -47,8 +60,10 @@
  */
 void virtsnd_ctl_msg_unref(struct virtio_snd_msg *msg)
 {
-	if (refcount_dec_and_test(&msg->ref_count))
+	if (refcount_dec_and_test(&msg->ref_count)) {
+		kfree(msg->dma_buffer);
 		kfree(msg);
+	}
 }
 
 /**
@@ -71,12 +86,73 @@
 void *virtsnd_ctl_msg_response(struct virtio_snd_msg *msg)
 {
 	return sg_virt(&msg->sg_response);
+}
+
+/**
+ * virtsnd_ctl_msg_request_data() - Get the request data buffer.
+ * @msg: Control message.
+ *
+ * Context: Any context.
+ */
+void *virtsnd_ctl_msg_request_data(struct virtio_snd_msg *msg)
+{
+	return msg->request_data_size ? sg_virt(&msg->sg_request_data) : NULL;
+}
+
+/**
+ * virtsnd_ctl_msg_response_data() - Get the response data buffer.
+ * @msg: Control message.
+ *
+ * Context: Any context.
+ */
+void *virtsnd_ctl_msg_response_data(struct virtio_snd_msg *msg)
+{
+	return msg->response_data_size ? sg_virt(&msg->sg_response_data) : NULL;
+}
+
+/**
+ * virtsnd_ctl_msg_sg_init() - Place one DMA region on cacheline boundaries.
+ * @sg: Scattergather entry for the region.
+ * @cursor: Current location in the message-owned DMA buffer.
+ * @size: Region length.
+ * @alignment: Alignment for DMA cachelines and typed CPU accesses.
+ *
+ * Context: Any context during message allocation.
+ * Return: 0 on success, -EOVERFLOW if the address cannot be represented.
+ */
+static int virtsnd_ctl_msg_sg_init(struct scatterlist *sg, u8 **cursor,
+				   size_t size, size_t alignment)
+{
+	uintptr_t address = (uintptr_t)*cursor;
+	uintptr_t end;
+	size_t padding;
+
+	padding = address % alignment;
+	if (padding &&
+	    check_add_overflow(address, (uintptr_t)(alignment - padding),
+			       &address))
+		return -EOVERFLOW;
+
+	if (check_add_overflow(address, (uintptr_t)size, &end))
+		return -EOVERFLOW;
+
+	padding = end % alignment;
+	if (padding &&
+	    check_add_overflow(end, (uintptr_t)(alignment - padding), &end))
+		return -EOVERFLOW;
+
+	sg_init_one(sg, (void *)address, (unsigned int)size);
+	*cursor = (u8 *)end;
+
+	return 0;
 }
 
 /**
  * virtsnd_ctl_msg_alloc() - Allocate and initialize a control message.
  * @request_size: Size of request header.
  * @response_size: Size of response header.
+ * @request_data_size: Size of request data buffer.
+ * @response_data_size: Size of response data buffer.
  * @gfp: Kernel flags for memory allocation.
  *
  * The message will be automatically freed when the ref_count value is 0.
@@ -85,20 +161,85 @@
  * Return: Allocated message on success, NULL on failure.
  */
 struct virtio_snd_msg *virtsnd_ctl_msg_alloc(size_t request_size,
-					     size_t response_size, gfp_t gfp)
+					     size_t response_size,
+					     size_t request_data_size,
+					     size_t response_data_size,
+					     gfp_t gfp)
 {
 	struct virtio_snd_msg *msg;
-
-	if (!request_size || !response_size)
+	struct scatterlist *sgs[4];
+	size_t sizes[4] = {
+		request_size,
+		response_size,
+		request_data_size,
+		response_data_size,
+	};
+	size_t alignment;
+	size_t dma_buffer_size;
+	size_t aligned_size;
+	size_t padding;
+	u8 *data;
+	unsigned int i;
+	int cache_alignment;
+	int rc;
+
+	if (!request_size || !response_size || request_size > UINT_MAX ||
+	    response_size > UINT_MAX || request_data_size > UINT_MAX ||
+	    response_data_size > UINT_MAX)
 		return NULL;
-
-	msg = kzalloc(sizeof(*msg) + request_size + response_size, gfp);
+	cache_alignment = dma_get_cache_alignment();
+	if (cache_alignment <= 0)
+		return NULL;
+	/* DMA coherence does not remove the CPU's type alignment requirement. */
+	alignment = max_t(size_t, cache_alignment,
+			  __alignof__(struct virtio_snd_ctl_value));
+
+	/* Reserve prefix alignment slack before the first DMA region. */
+	dma_buffer_size = alignment - 1;
+	for (i = 0; i < ARRAY_SIZE(sizes); ++i) {
+		if (!sizes[i])
+			continue;
+
+		padding = sizes[i] % alignment;
+		aligned_size = sizes[i];
+		if (padding &&
+		    check_add_overflow(aligned_size, alignment - padding,
+				       &aligned_size))
+			return NULL;
+
+		if (check_add_overflow(dma_buffer_size, aligned_size,
+				       &dma_buffer_size))
+			return NULL;
+	}
+
+	msg = kzalloc(sizeof(*msg), gfp);
 	if (!msg)
 		return NULL;
 
-	sg_init_one(&msg->sg_request, (u8 *)msg + sizeof(*msg), request_size);
-	sg_init_one(&msg->sg_response, (u8 *)msg + sizeof(*msg) + request_size,
-		    response_size);
+	msg->dma_buffer = kzalloc(dma_buffer_size, gfp);
+	if (!msg->dma_buffer) {
+		kfree(msg);
+		return NULL;
+	}
+	data = msg->dma_buffer;
+	sgs[0] = &msg->sg_request;
+	sgs[1] = &msg->sg_response;
+	sgs[2] = &msg->sg_request_data;
+	sgs[3] = &msg->sg_response_data;
+	for (i = 0; i < ARRAY_SIZE(sizes); ++i) {
+		if (!sizes[i])
+			continue;
+
+		rc = virtsnd_ctl_msg_sg_init(sgs[i], &data, sizes[i], alignment);
+		if (rc) {
+			kfree(msg->dma_buffer);
+			kfree(msg);
+			return NULL;
+		}
+	}
+
+	msg->request_data_size = request_data_size;
+	msg->response_data_size = response_data_size;
 
 	INIT_LIST_HEAD(&msg->list);
 	init_completion(&msg->notify);
@@ -112,17 +253,15 @@
  * virtsnd_ctl_msg_send() - Send a control message.
  * @snd: VirtIO sound device.
  * @msg: Control message.
- * @out_sgs: Additional sg-list to attach to the request header (may be NULL).
- * @in_sgs: Additional sg-list to attach to the response header (may be NULL).
  * @nowait: Flag indicating whether to wait for completion.
  *
  * Context: Any context. Takes and releases the control queue spinlock.
  *          May sleep if @nowait is false.
+ *          Consumes the caller's reference on every return path.
  * Return: 0 on success, -errno on failure.
  */
 int virtsnd_ctl_msg_send(struct virtio_snd *snd, struct virtio_snd_msg *msg,
-			 struct scatterlist *out_sgs,
-			 struct scatterlist *in_sgs, bool nowait)
+			 bool nowait)
 {
 	struct virtio_device *vdev = snd->vdev;
 	struct virtio_snd_queue *queue = virtsnd_control_queue(snd);
@@ -133,6 +272,7 @@
 	unsigned int nins = 0;
 	struct scatterlist *psgs[4];
 	bool notify = false;
+	unsigned long flags;
 	int rc;
 
 	virtsnd_ctl_msg_ref(msg);
@@ -142,27 +282,27 @@
 	response->code = cpu_to_le32(VIRTIO_SND_S_IO_ERR);
 
 	psgs[nouts++] = &msg->sg_request;
-	if (out_sgs)
-		psgs[nouts++] = out_sgs;
+	if (msg->request_data_size)
+		psgs[nouts++] = &msg->sg_request_data;
 
 	psgs[nouts + nins++] = &msg->sg_response;
-	if (in_sgs)
-		psgs[nouts + nins++] = in_sgs;
-
-	scoped_guard(spinlock_irqsave, &queue->lock) {
-		if (snd->ctl_msgs_blocked)
-			rc = -ENODEV;
-		else
-			rc = virtqueue_add_sgs(queue->vqueue, psgs, nouts, nins,
-					       msg, GFP_ATOMIC);
-		if (!rc) {
-			notify = virtqueue_kick_prepare(queue->vqueue);
-
-			list_add_tail(&msg->list, &snd->ctl_msgs);
-			if (notify)
-				virtqueue_notify(queue->vqueue);
-		}
-	}
+	if (msg->response_data_size)
+		psgs[nouts + nins++] = &msg->sg_response_data;
+
+	spin_lock_irqsave(&queue->lock, flags);
+	if (snd->ctl_msgs_blocked)
+		rc = -ENODEV;
+	else
+		rc = virtqueue_add_sgs(queue->vqueue, psgs, nouts, nins, msg,
+				       GFP_ATOMIC);
+	if (!rc) {
+		notify = virtqueue_kick_prepare(queue->vqueue);
+
+		list_add_tail(&msg->list, &snd->ctl_msgs);
+		if (notify)
+			virtqueue_notify(queue->vqueue);
+	}
+	spin_unlock_irqrestore(&queue->lock, flags);
 
 	if (rc) {
 		dev_err(&vdev->dev, "failed to send control message (0x%08x)\n",
@@ -173,46 +313,36 @@
 		 * called, it is necessary to decrement the reference count.
 		 */
 		virtsnd_ctl_msg_unref(msg);
-
-		goto on_exit;
-	}
-
-	if (nowait)
-		goto on_exit;
-
-	rc = wait_for_completion_interruptible_timeout(&msg->notify, js);
-	if (rc <= 0) {
+	} else if (!nowait) {
+		rc = wait_for_completion_interruptible_timeout(&msg->notify, js);
 		if (!rc) {
 			dev_err(&vdev->dev,
 				"control message (0x%08x) timeout\n",
 				le32_to_cpu(request->code));
 			rc = -ETIMEDOUT;
+		} else if (rc > 0) {
+			if (READ_ONCE(msg->cancelled)) {
+				rc = -ENODEV;
+			} else {
+				switch (le32_to_cpu(response->code)) {
+				case VIRTIO_SND_S_OK:
+					rc = 0;
+					break;
+				case VIRTIO_SND_S_NOT_SUPP:
+					rc = -EOPNOTSUPP;
+					break;
+				case VIRTIO_SND_S_IO_ERR:
+					rc = -EIO;
+					break;
+				default:
+					rc = -EINVAL;
+					break;
+				}
+			}
 		}
-
-		goto on_exit;
-	}
-
-	if (READ_ONCE(msg->cancelled)) {
-		rc = -ENODEV;
-		goto on_exit;
-	}
-
-	switch (le32_to_cpu(response->code)) {
-	case VIRTIO_SND_S_OK:
-		rc = 0;
-		break;
-	case VIRTIO_SND_S_NOT_SUPP:
-		rc = -EOPNOTSUPP;
-		break;
-	case VIRTIO_SND_S_IO_ERR:
-		rc = -EIO;
-		break;
-	default:
-		rc = -EINVAL;
-		break;
-	}
-
-on_exit:
+	}
+
+	/* Drop the reference consumed by this send attempt. */
 	virtsnd_ctl_msg_unref(msg);
 
 	return rc;
@@ -308,10 +438,23 @@
 {
 	struct virtio_snd_msg *msg;
 	struct virtio_snd_query_info *query;
-	struct scatterlist sg;
+	size_t info_size;
+	int rc;
+
+	if (count < 0)
+		return -EINVAL;
+
+	if (size > UINT_MAX ||
+	    check_mul_overflow((size_t)count, size, &info_size) ||
+	    info_size > UINT_MAX)
+		return -EOVERFLOW;
+
+	if (info_size && !info)
+		return -EINVAL;
 
 	msg = virtsnd_ctl_msg_alloc(sizeof(*query),
-				    sizeof(struct virtio_snd_hdr), GFP_KERNEL);
+				    sizeof(struct virtio_snd_hdr), 0, info_size,
+				    GFP_KERNEL);
 	if (!msg)
 		return -ENOMEM;
 
@@ -321,9 +464,13 @@
 	query->count = cpu_to_le32(count);
 	query->size = cpu_to_le32(size);
 
-	sg_init_one(&sg, info, count * size);
-
-	return virtsnd_ctl_msg_send(snd, msg, NULL, &sg, false);
+	virtsnd_ctl_msg_ref(msg);
+	rc = virtsnd_ctl_msg_send(snd, msg, false);
+	if (!rc && info_size)
+		memcpy(info, virtsnd_ctl_msg_response_data(msg), info_size);
+	virtsnd_ctl_msg_unref(msg);
+
+	return rc;
 }
 
 /**
diff --git a/sound/virtio/virtio_ctl_msg.h b/sound/virtio/virtio_ctl_msg.h
--- a/sound/virtio/virtio_ctl_msg.h
+++ b/sound/virtio/virtio_ctl_msg.h
@@ -21,20 +21,28 @@
 void *virtsnd_ctl_msg_response(struct virtio_snd_msg *msg);
 
 struct virtio_snd_msg *virtsnd_ctl_msg_alloc(size_t request_size,
-					     size_t response_size, gfp_t gfp);
+					     size_t response_size,
+					     size_t request_data_size,
+					     size_t response_data_size,
+					     gfp_t gfp);
+
+void *virtsnd_ctl_msg_request_data(struct virtio_snd_msg *msg);
+
+void *virtsnd_ctl_msg_response_data(struct virtio_snd_msg *msg);
 
 int virtsnd_ctl_msg_send(struct virtio_snd *snd, struct virtio_snd_msg *msg,
-			 struct scatterlist *out_sgs,
-			 struct scatterlist *in_sgs, bool nowait);
+			 bool nowait);
 
 /**
  * virtsnd_ctl_msg_send_sync() - Simplified sending of synchronous message.
  * @snd: VirtIO sound device.
  * @msg: Control message.
  *
- * After returning from this function, the message will be deleted. If message
- * content is still needed, the caller must additionally to
- * virtsnd_ctl_msg_ref/unref() it.
+ * This function consumes the caller's message reference on return. A message
+ * accepted by the control queue keeps its queue reference until completion or
+ * post-reset cleanup, including when this function returns on timeout or
+ * interruption. Callers that read the response after success must retain an
+ * additional reference through that access.
  *
  * The msg_timeout_ms module parameter defines the message completion timeout.
  * If the message is not completed within this time, the function will return an
@@ -49,7 +57,7 @@
 static inline int virtsnd_ctl_msg_send_sync(struct virtio_snd *snd,
 					    struct virtio_snd_msg *msg)
 {
-	return virtsnd_ctl_msg_send(snd, msg, NULL, NULL, false);
+	return virtsnd_ctl_msg_send(snd, msg, false);
 }
 
 /**
@@ -63,7 +71,7 @@
 static inline int virtsnd_ctl_msg_send_async(struct virtio_snd *snd,
 					     struct virtio_snd_msg *msg)
 {
-	return virtsnd_ctl_msg_send(snd, msg, NULL, NULL, true);
+	return virtsnd_ctl_msg_send(snd, msg, true);
 }
 
 void virtsnd_ctl_msg_cancel_all(struct virtio_snd *snd);
diff --git a/sound/virtio/virtio_kctl.c b/sound/virtio/virtio_kctl.c
--- a/sound/virtio/virtio_kctl.c
+++ b/sound/virtio/virtio_kctl.c
@@ -3,8 +3,10 @@
  * virtio-snd: Virtio sound device
  * Copyright (C) 2022 OpenSynergy GmbH
  */
+#include <linux/limits.h>
+#include <linux/overflow.h>
+#include <linux/virtio_config.h>
 #include <sound/control.h>
-#include <linux/virtio_config.h>
 
 #include "virtio_card.h"
 
@@ -157,14 +159,16 @@
 	struct virtio_snd_ctl_hdr *hdr;
 	struct virtio_snd_ctl_value *kvalue;
 	size_t request_size = sizeof(*hdr);
-	size_t response_size = sizeof(struct virtio_snd_hdr) + sizeof(*kvalue);
+	size_t response_size = sizeof(struct virtio_snd_hdr);
 	unsigned int i;
 	int rc;
 
-	msg = virtsnd_ctl_msg_alloc(request_size, response_size, GFP_KERNEL);
+	msg = virtsnd_ctl_msg_alloc(request_size, response_size, 0,
+				    sizeof(*kvalue), GFP_KERNEL);
 	if (!msg)
 		return -ENOMEM;
 
+	/* Response lifetime through ALSA value copyout. */
 	virtsnd_ctl_msg_ref(msg);
 
 	hdr = virtsnd_ctl_msg_request(msg);
@@ -175,8 +179,7 @@
 	if (rc)
 		goto on_failure;
 
-	kvalue = (void *)((u8 *)virtsnd_ctl_msg_response(msg) +
-			  sizeof(struct virtio_snd_hdr));
+	kvalue = virtsnd_ctl_msg_response_data(msg);
 
 	switch (type) {
 	case VIRTIO_SND_CTL_TYPE_BOOLEAN:
@@ -233,7 +236,8 @@
 	size_t response_size = sizeof(struct virtio_snd_hdr);
 	unsigned int i;
 
-	msg = virtsnd_ctl_msg_alloc(request_size, response_size, GFP_KERNEL);
+	msg = virtsnd_ctl_msg_alloc(request_size, response_size, 0, 0,
+				    GFP_KERNEL);
 	if (!msg)
 		return -ENOMEM;
 
@@ -288,22 +292,27 @@
 	struct virtio_snd *snd = snd_kcontrol_chip(kcontrol);
 	struct virtio_snd_msg *msg;
 	struct virtio_snd_ctl_hdr *hdr;
-	unsigned int *tlv;
-	struct scatterlist sg;
+	size_t request_data_size = 0;
+	size_t response_data_size = 0;
 	int rc;
 
+	switch (op_flag) {
+	case SNDRV_CTL_TLV_OP_READ:
+		response_data_size = size;
+		break;
+	case SNDRV_CTL_TLV_OP_WRITE:
+	case SNDRV_CTL_TLV_OP_CMD:
+		request_data_size = size;
+		break;
+	default:
+		return -EINVAL;
+	}
+
 	msg = virtsnd_ctl_msg_alloc(sizeof(*hdr), sizeof(struct virtio_snd_hdr),
+				    request_data_size, response_data_size,
 				    GFP_KERNEL);
 	if (!msg)
 		return -ENOMEM;
-
-	tlv = kzalloc(size, GFP_KERNEL);
-	if (!tlv) {
-		rc = -ENOMEM;
-		goto on_msg_unref;
-	}
-
-	sg_init_one(&sg, tlv, size);
 
 	hdr = virtsnd_ctl_msg_request(msg);
 	hdr->control_id = cpu_to_le32(kcontrol->private_value);
@@ -312,13 +321,16 @@
 	case SNDRV_CTL_TLV_OP_READ:
 		hdr->hdr.code = cpu_to_le32(VIRTIO_SND_R_CTL_TLV_READ);
 
-		rc = virtsnd_ctl_msg_send(snd, msg, NULL, &sg, false);
-		if (!rc) {
-			if (copy_to_user(utlv, tlv, size))
-				rc = -EFAULT;
-		}
-
-		break;
+		/* Response lifetime through user copyout. */
+		virtsnd_ctl_msg_ref(msg);
+		rc = virtsnd_ctl_msg_send(snd, msg, false);
+		if (!rc && size &&
+		    copy_to_user(utlv, virtsnd_ctl_msg_response_data(msg),
+				 size))
+			rc = -EFAULT;
+		virtsnd_ctl_msg_unref(msg);
+
+		return rc;
 	case SNDRV_CTL_TLV_OP_WRITE:
 	case SNDRV_CTL_TLV_OP_CMD:
 		if (op_flag == SNDRV_CTL_TLV_OP_WRITE)
@@ -327,28 +339,16 @@
 			hdr->hdr.code =
 				cpu_to_le32(VIRTIO_SND_R_CTL_TLV_COMMAND);
 
-		if (copy_from_user(tlv, utlv, size)) {
-			rc = -EFAULT;
-			goto on_msg_unref;
-		} else {
-			rc = virtsnd_ctl_msg_send(snd, msg, &sg, NULL, false);
+		if (size && copy_from_user(virtsnd_ctl_msg_request_data(msg), utlv,
+					   size)) {
+			virtsnd_ctl_msg_unref(msg);
+			return -EFAULT;
 		}
 
-		break;
-	default:
-		rc = -EINVAL;
-		/* We never get here - we listed all values for op_flag */
-		WARN_ON(1);
-		goto on_msg_unref;
-	}
-	kfree(tlv);
-	return rc;
-
-on_msg_unref:
-	virtsnd_ctl_msg_unref(msg);
-	kfree(tlv);
-
-	return rc;
+		return virtsnd_ctl_msg_send(snd, msg, false);
+	}
+
+	return -EINVAL;
 }
 
 /**
@@ -369,27 +369,36 @@
 	struct virtio_snd_msg *msg;
 	struct virtio_snd_ctl_hdr *hdr;
 	unsigned int n = le32_to_cpu(kinfo->value.enumerated.items);
-	struct scatterlist sg;
-
-	msg = virtsnd_ctl_msg_alloc(sizeof(*hdr),
-				    sizeof(struct virtio_snd_hdr), GFP_KERNEL);
-	if (!msg)
-		return -ENOMEM;
+	size_t items_size;
+	int rc;
+
+	if (check_mul_overflow((size_t)n, sizeof(*kctl->items), &items_size) ||
+	    items_size > UINT_MAX)
+		return -EOVERFLOW;
 
 	kctl->items = devm_kcalloc(&vdev->dev, n, sizeof(*kctl->items),
 				   GFP_KERNEL);
-	if (!kctl->items) {
-		virtsnd_ctl_msg_unref(msg);
-		return -ENOMEM;
-	}
-
-	sg_init_one(&sg, kctl->items, n * sizeof(*kctl->items));
+	if (!kctl->items)
+		return -ENOMEM;
+
+	msg = virtsnd_ctl_msg_alloc(sizeof(*hdr),
+				    sizeof(struct virtio_snd_hdr), 0, items_size,
+				    GFP_KERNEL);
+	if (!msg)
+		return -ENOMEM;
 
 	hdr = virtsnd_ctl_msg_request(msg);
 	hdr->hdr.code = cpu_to_le32(VIRTIO_SND_R_CTL_ENUM_ITEMS);
 	hdr->control_id = cpu_to_le32(cid);
 
-	return virtsnd_ctl_msg_send(snd, msg, NULL, &sg, false);
+	/* Item-buffer lifetime through the control-list copyout. */
+	virtsnd_ctl_msg_ref(msg);
+	rc = virtsnd_ctl_msg_send(snd, msg, false);
+	if (!rc && items_size)
+		memcpy(kctl->items, virtsnd_ctl_msg_response_data(msg), items_size);
+	virtsnd_ctl_msg_unref(msg);
+
+	return rc;
 }
 
 /**
diff --git a/sound/virtio/virtio_pcm_msg.c b/sound/virtio/virtio_pcm_msg.c
--- a/sound/virtio/virtio_pcm_msg.c
+++ b/sound/virtio/virtio_pcm_msg.c
@@ -688,7 +688,7 @@
 		break;
 	}
 
-	msg = virtsnd_ctl_msg_alloc(request_size, response_size, gfp);
+	msg = virtsnd_ctl_msg_alloc(request_size, response_size, 0, 0, gfp);
 	if (msg) {
 		struct virtio_snd_pcm_hdr *hdr = virtsnd_ctl_msg_request(msg);
 
