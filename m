Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794466217;
	b=cnV3wgFsHVIgIEAXjgq8i8DmAa9MDBZng9nioTZXJXMPh18nYvJ+NQmlslDl5iha36hB
	 XkvtaoieqAMuRudASrscdU7XAR1nvV2R+gPhZ0qsmimAcpuCaCXNGc4HhiC6qbLaxD/0W
	 z4U5jc42uFLuoiJc9+6H9bdwSCixwLZ11wNL3bi97I5S2Z13ij47Gzy9Pmi2wIPhdA5sz
	 tKKi10y+xMSgP1nQugLz+/7AGQsTt8L0+x0TB6LMVGN9nKXEgp6e0dewL4NzzoRRnno7r
	 IgCU/2gnBjB0dhbnSo5twjKKZQz5adT/70+lF01WZ5bTF55e+UjPSJdmkRbHYRfTz5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794466217;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=T+sVIbp4DoVMcIWaKe5XqLWovfYHU/r2Z29X5f79OW0=;
	b=uaTfqc8YyOic5xgnAyY231sB7ylfXWtXEsa04vqYhki0sp7ODEu+C3NdbeSOLqixbHQT
	 N+bBdooATUHpJWx/6rnB3KrUKyupRWqLxzPp31uYWRXLB+KDh0hgJ/MJA4ifUC18LphYG
	 ArU2iDNTiZNw7/3DTXfngR6L06ULXbUw4EpmW9ZxmwphJofZNl2pZMFo61fw9bRPcY/jm
	 k4hbxRTIyYGVc859id0k5xRuL+Zg0w2zQj8I42dAEMtGtDnsykfmnHUuo7Gqy5o1Hf81Y
	 FZnpzHLUhnTMgI65nz93XoawltOXgXo5JHEvJNtO+E82zXxQhjBQZSe2gvCg/HBi45w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JucUgcMc;
	arc=none smtp.remote-ip=209.85.210.178
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E8CE606B4A8
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 06:50:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E8CE606B4A8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JucUgcMc
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8a058315c79so2057175b3a.3
        for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 22:50:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794466216; x=1795071016; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T+sVIbp4DoVMcIWaKe5XqLWovfYHU/r2Z29X5f79OW0=;
        b=JucUgcMcoUozWk7Nhqy1l0vZqf4I0xcvN8SA5L7tkB1oIXkzN5FuVALShtayfrdg6M
         If+QCaBELuAClDP4vGrddPojKlhiYMX8z17F2HO7R6xHhq+5+YMUBg5n3/uIfXdnHZU8
         L/Oj869fyM76taEJ5WUH+Xq0Qj8lWe/WONm9q312EB4UjgHivhvwJDAFtPz+hbmbIWks
         bQYtJR1VCj4FZ/80kAvB9MKeqcTl+fMZR658DggBFiXzugxIzPcMZLCwx5aRev4/1Ewa
         TmvFvLh0fa0sKOKTIHUL+/h4B7xmK1RCgBBpf5lASk9IxEKgUz89pmXkYnbJf4s68690
         86VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794466217; x=1795071017;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=T+sVIbp4DoVMcIWaKe5XqLWovfYHU/r2Z29X5f79OW0=;
        b=mJVGH35LDjyvKs4M2HLxy9D9dV13nuTlxTx0HV15+lU+Xe53W7/i4mUz8HkxHVyntp
         Xqd1+rgBXlc7Li8pnqPUUz6uPoU03k6apdJtR2l2j+lBpXiyI3rJvKL4AbqDGXbNOJf+
         c3AWk+w6oIFKH7loDEiF98chTWEEjYNfakYLcmkuP1ir3pcqZITERBs5Y2+J06AOxCbz
         a/bNUVW8jRHzXiBjJPJBU715DoCI5mh7DuFTUTy7MSMBDvSUgo/6Rp9AhWMGKl2pD2px
         vK03udt4VEPqm1dPAf8NYPNFFAffBR1Fv1oEkaBvUHnwkmpieV5Rxujs/9kWJ9XenoIl
         jLwQ==
X-Gm-Message-State: APuU4Z8czgfU3KeMl25LeGaqppD8PU+Sy/rvWQJyE1pB3SgyCb/ZCKzq
	yRsDgK/cwmJCzbASySd7OKpaN4pB9xetMpPG2yM2klK4NZOKkX8GNmfCcORIdA==
X-Gm-Gg: AYBFou2Fk4l9LYNSkIA35Mv24TV1lXMhyY15tGrb+n8N9ZJ3rG+T5GvX1+SqJ4KtEJM
	jcqtS6ELsXc4Jytx30St1Q3/tYTecXpDUQylVN2KckiOvXbk9HifE73Uv6viuTFfnO9YOCvf6OY
	MS38S5X7F+KzZPiuvyH5i54OflnZzvo+PvSkHSbj26syfiCC/4tyC5EFxctXaZxgwuVCTmndHyl
	nOO4fXb9w+l0j3BQeSKauxBJqtpC3qNUeRsfDS4U1ZaDfjgZIHJCvjcD0o5nx6Lo9TGf/3MX2lA
	aYDzZx7FjLxBcwahANa44u+xdLmd627AS8xefxJCQYxjujG+hxOd95OX+MWbaRphATIPQbGuvH7
	g7HlH1R+9odZXNpfI6pFCVCAqmMedAFH4EjzjlNI30vqJkrzCZhrGIu88gfVZbiVEHJaMZoX13/
	XAI+H634os0sWqjrpPzMT3t/G4hbQmKEd0CFqLiZxBbq22dx6CfdHLzL3BJ5ItKxJYGIDI1Paj8
	QS0jmCa6YEdsqwIwRMZgJCbYKyoDqzxfWHI6TgAgOniMyzFt6SpXuaETVVNGLCCAGZ3Hgm3SGw7
	J92t1VTcpnsxtF9XjkX5t8i5tjQkax1XpoieRlcb3XcUw/t8s9SKp0UwIJ1pMawpMfDdPzMkyre
	1VLA3kY9vn+bL5rIqkTXmmoa1kSSm5d2TdmhMOVK1jI8noT8=
X-Received: by 2002:a05:6a00:4187:b0:87d:dc3c:1b5e with SMTP id d2e1a72fcca58-8bc1ca72e47mr4389657b3a.26.1794466216316;
        Wed, 11 Nov 2026 22:50:16 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baab1228e2sm3097511b3a.41.2026.11.11.22.50.13
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 22:50:15 -0800 (PST)
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
Subject: [PATCH v31 11/17] ALSA: virtio: wait through signals for PCM teardown
Date: Thu, 12 Nov 2026 15:49:23 +0900
Message-ID: <20261112064929.11211-12-mynameisjune111@gmail.com>
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

A signal can end the interruptible wait while a STOP or RELEASE request
is still pending. A later teardown may then submit another RELEASE
before the first request completes.

Keep both waits non-interruptible and use the existing message timeout.
Other control requests remain interruptible. Device reset still cancels
the pending request and wakes the waiter.

Keep timeout and wait results in the types returned by the kernel wait
APIs.

Fixes: 9d45e514da88 ("ALSA: virtio: handling control messages")
Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
sound/virtio/virtio_ctl_msg.c |   19 ++++++++++++++++---
 sound/virtio/virtio_ctl_msg.h |    3 +++
 sound/virtio/virtio_pcm_ops.c |   10 +++++-----
 3 files changed, 24 insertions(+), 8 deletions(-)

diff --git a/sound/virtio/virtio_ctl_msg.c b/sound/virtio/virtio_ctl_msg.c
--- a/sound/virtio/virtio_ctl_msg.c
+++ b/sound/virtio/virtio_ctl_msg.c
@@ -265,7 +265,7 @@
 {
 	struct virtio_device *vdev = snd->vdev;
 	struct virtio_snd_queue *queue = virtsnd_control_queue(snd);
-	unsigned int js = msecs_to_jiffies(virtsnd_msg_timeout_ms);
+	unsigned long js = msecs_to_jiffies(virtsnd_msg_timeout_ms);
 	struct virtio_snd_hdr *request = virtsnd_ctl_msg_request(msg);
 	struct virtio_snd_hdr *response = virtsnd_ctl_msg_response(msg);
 	unsigned int nouts = 0;
@@ -273,7 +273,7 @@
 	struct scatterlist *psgs[4];
 	bool notify = false;
 	unsigned long flags;
-	int rc;
+	long rc;
 
 	virtsnd_ctl_msg_ref(msg);
 	/* This reference stays with the queue until completion or teardown. */
@@ -314,7 +314,20 @@
 		 */
 		virtsnd_ctl_msg_unref(msg);
 	} else if (!nowait) {
-		rc = wait_for_completion_interruptible_timeout(&msg->notify, js);
+		/*
+		 * Teardown must observe completion even with a pending signal.
+		 * Otherwise a subsequent open can retry RELEASE while the device
+		 * is still processing the previous teardown request.
+		 */
+		switch (le32_to_cpu(request->code)) {
+		case VIRTIO_SND_R_PCM_STOP:
+		case VIRTIO_SND_R_PCM_RELEASE:
+			rc = wait_for_completion_timeout(&msg->notify, js);
+			break;
+		default:
+			rc = wait_for_completion_interruptible_timeout(&msg->notify, js);
+			break;
+		}
 		if (!rc) {
 			dev_err(&vdev->dev,
 				"control message (0x%08x) timeout\n",
diff --git a/sound/virtio/virtio_ctl_msg.h b/sound/virtio/virtio_ctl_msg.h
--- a/sound/virtio/virtio_ctl_msg.h
+++ b/sound/virtio/virtio_ctl_msg.h
@@ -47,6 +47,9 @@
  * The msg_timeout_ms module parameter defines the message completion timeout.
  * If the message is not completed within this time, the function will return an
  * error.
+ * PCM STOP and RELEASE wait through pending signals within this timeout.
+ * Other requests remain interruptible. Device reset cancels and wakes either
+ * kind of waiter.
  *
  * Context: Any context that permits to sleep.
  * Return: 0 on success, -errno on failure.
diff --git a/sound/virtio/virtio_pcm_ops.c b/sound/virtio/virtio_pcm_ops.c
--- a/sound/virtio/virtio_pcm_ops.c
+++ b/sound/virtio/virtio_pcm_ops.c
@@ -20,11 +20,11 @@
  *   (RELEASE command in the ops->sync_stop()) and the ops->hw_free() has been
  *   called.
  *
- *   When the substream stops, the ops->sync_stop() waits until the device has
- *   completed all pending messages. This wait can be interrupted either by a
- *   signal or due to a timeout. In this case, the device can still access
- *   messages even after calling ops->hw_free(). It can also issue an interrupt,
- *   and the interrupt handler will also try to access message structures.
+ *   When the substream stops, ops->sync_stop() stops and releases the device
+ *   as required, then waits for pending messages. A failed control request or
+ *   timed-out flush can leave the device able to access messages after
+ *   ops->hw_free(). It can also issue an interrupt, and the interrupt handler
+ *   will also try to access message structures.
  *   The messages retain references to the PCM buffer pages until they are
  *   freed, so late DMA does not target pages released by ALSA.
  *
