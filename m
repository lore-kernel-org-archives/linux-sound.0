Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794444460;
	b=NleQmWBpTmAl4F+3CJ3cdf9X/HVIAyg67nDDpIcUREKoT8eK1dUU5QO6uwg956/A6Urm
	 gRkO1nW6nT9BG6E6VD7+F7hh9efLfYBLJ7sy4D6vSaz70pN0kpCrO5a/GFPSbhjYoqA/c
	 RtAmceIoS4zTcyFW69hDX8EnOcKmopffLAVBFQfjqGumGhZKDzW2gWuRPpV3KSH/qf9+9
	 v8ZW5XBR0/VSOeDqC9BYJwDnS5d74v2VkvwdEA1zk49+GsHqTveVsaJLL7VADod2lh7CE
	 kbWHwIAkbO6vG133U2/BPhW3hp5OHfvAjgUKEiaP/+LMcmZ3fvIgzcIH2ONmSrZO6Uw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794444460;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=zJP1ksxof1hR+6LodwAgrvIXoMCXKKWVQGfaWA7IZwo=;
	b=hCeEbLRMVX1IXTDce/GyIZkN5mu0ECBVUebgkjXWF8wS7JDfXMhkM3k4Vr1HZU6bekZS
	 FJPVIXKWq728sB1skgjALgX11VSsgodEd5Bs6IM8NOZThpRnLiQW3OCmqYazjUUMeU6ay
	 AcJZ/4QobHrKJXj3ZUSBeJH9Vzeg8Q31tSXhJTisZZBfcMse5KLmIfGn8l0i6PIBUpmrN
	 lF2k399L+5b7dBuYR69pcivFQYcFyFKM7rXAlCVmh7rAc6pzdAMl6SjN/w8xO3tfRCmM4
	 /wuac3Z45EpXkuEYNAT0z752HNGi2ndI4/SXAqCwsnQhszO9wV2dKAockytY4Lbo09g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SOY7WQHA;
	arc=none smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A496606EE03
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 00:47:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A496606EE03
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SOY7WQHA
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-15dd124bbe7so5692392c88.1
        for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 16:47:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794444458; x=1795049258; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zJP1ksxof1hR+6LodwAgrvIXoMCXKKWVQGfaWA7IZwo=;
        b=SOY7WQHAPxjzTGnMNt8YFcjY3LfAIIFDY+uwYcvhRukiN3edaaFMT7d8/uBQF227TB
         mRyyWL6SpE28h6LeZ1p3spdt+VkkFVlb3lzsndFECGpfvWCrlu336wvYslzy0zM/GmvX
         z7G5agJr18gBvhjFEykPMlcEULyO6gQXXZRCtLgMJF8X2H4p+oXqQqta6SiOCMdFsvuQ
         VtVqqriwE2ZE97Pjgl6FFRNIr6HsZ+VAlOXGPfCwl0AjZM40CdV/ARO62dlXMvSyVyBE
         hfHnwfReelZdI7qg05Hdv1GK5o3tX+hLZWN+ap4afNfCA611ID+uMnY09dW4Ym1d0f5w
         BA/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794444458; x=1795049258;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zJP1ksxof1hR+6LodwAgrvIXoMCXKKWVQGfaWA7IZwo=;
        b=VCqeBu7UDzgqxvSgTVxayqvBgWRoMHWxXDNF2A3BpycZWdYc8RkJhP3EAPw2xtOIOo
         kEguW+ckf6TvofA1llwTDX/sIB+Jbf9kARL9MMLq0IGO5/hKwr3DKOkOzNQ8l2W8eibg
         gY3Xe1bCCZJ3aW9obzVx0vCSxO/PSz7plmCcfRDCa7RJK16CR191S+YS18wvyzNqBGjA
         NeT4UUOQk52Cbof4vM1pAUUIL6CH6IKo2uzK4oVb0W0RF+hVbN/1s4qL5AW4GpvYq2tw
         xtjzzoAniwmrqDlP5lLsI5RMvpmHSM9NeBlEfMniQRvP8HhwJWmAd+I8J3E+K+FFx46/
         t61Q==
X-Gm-Message-State: APuU4Z/h5wwAQSCuEpmmfLFr1TRfM3UqEYYa48xPSrzMWGcnEg649wG9
	JWG6VxUk5ftSK8sbem/WTt2lfVjJAfj2LPeaH5hWAckTy1F8mx8mVRcvMTS99w==
X-Gm-Gg: AYBFou1jHNwMjxuz5xygzeBrnNpNKQPBDHDebWFIem1PbLfmGfT+WJPYYMXNEhrLRgT
	NQvwsPF+/AVB6/ZmqY1IKX/6Rro7JljpNH60ePeP6LIqOxG5RVvumhI8OEm/HfeesS/qhr7hjP5
	CemN44gx9BMQ14L2PsZs/0EMdsXEQhAafB8rzq1HfkDxySU1nMEuQVL19y1vE1Cammw9rL5OSkl
	Y6/TxU1Em3Bz8Es61XsepNJpKw5VpM6n64SiTOovvznAJCiKjKWZsPwYSPK6FVp4EyQ2skGfgwq
	ixA6WrZpply8auV2CDXlW4ew+Z/kUev56py/tEp0KF9LjwdmEgtf2xPdDG5VLuu7Lcs68BNJGGK
	S3dlhhX+uzBUnE3d08dbWYBo81p1M17UT5QREb4KWAlnm6DLkF1N2bSlqhRsGs19W5b30G3bgF0
	4RBzcnBMrnKYJF9cY+/Q3Rs5dKe7SvD+pyHNkcLDQNdg5X2QJX6PmjhoOM50oNeGt6WVDn863lo
	UsQ7JDf81sGpQNUcX5MRe8tZrUr4UByZBiUqcLIN5nZXUXO9pLbj1D5qCQyS5FwO4UnyuWAUT1c
	R61chuWEDLFLOdeOn3QRhSqRVCFbpNHiIvGPvYewLzRmx8uF3SVIeNInJ1whFv0Wso1xYNElXAn
	bB7xgFnSS/3vAnxwjXlFvYIcPpW/fPYPIgoAJWz9B+A8/6gE=
X-Received: by 2002:a05:7022:1608:b0:1ab:de8b:5f0f with SMTP id a92af1059eb24-1b3c034a58dmr2846300c88.40.1794444458342;
        Wed, 11 Nov 2026 16:47:38 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b2eeffsm20672163c88.9.2026.11.11.16.47.35
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 16:47:37 -0800 (PST)
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
Subject: [PATCH v27 08/17] ALSA: virtio: Retain queued messages through device reset
Date: Thu, 12 Nov 2026 09:46:55 +0900
Message-ID: <20261112004704.49758-9-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261112004704.49758-1-mynameisjune111@gmail.com>
References: <20261112004704.49758-1-mynameisjune111@gmail.com>
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

Keep the control queue available through snd_card_free() so close-time
STOP and RELEASE commands can still be submitted. Block new control
requests and mark pending messages canceled before reset, then release
their queue references only after reset and queue deletion.

For PCM queues, detach each remaining virtqueue buffer after the device
has stopped DMA and retire its message without reporting a normal
completion. Detach all queues before deleting them so outstanding DMA
mappings are unmapped and no token remains for a late device completion.

Protect event callback admission with the event queue lock. Disabling
events waits for an active dispatch, and later callbacks see a closed
gate before ALSA objects are freed. Enable and pending-event draining
share the same lock.

Reclaim pending event buffers after a failed probe without dispatching
notifications into ALSA objects that have not been constructed. Record
the queue's prior enabled state under its lock before closing admission.

Track successful virtqueue initialization so teardown and failed restore
cleanup call del_vqs() only for an initialized queue set.

Fixes: 9d45e514da88 ("ALSA: virtio: handling control messages")
Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
sound/virtio/virtio_card.c    |  110 ++++++++++++++++++++++++++++++++---------
 sound/virtio/virtio_card.h    |    6 ++
 sound/virtio/virtio_ctl_msg.c |   64 +++++++++++++++++++++---
 sound/virtio/virtio_ctl_msg.h |    4 +
 sound/virtio/virtio_pcm.h     |    2 +
 sound/virtio/virtio_pcm_msg.c |   42 ++++++++++++++--
 6 files changed, 193 insertions(+), 35 deletions(-)

diff --git a/sound/virtio/virtio_card.c b/sound/virtio/virtio_card.c
--- a/sound/virtio/virtio_card.c
+++ b/sound/virtio/virtio_card.c
@@ -70,23 +70,13 @@
 	}
 }
 
-/**
- * virtsnd_event_notify_cb() - Dispatch all reported events from the event queue.
- * @vqueue: Underlying event virtqueue.
- *
- * This callback function is called upon a vring interrupt request from the
- * device.
- *
- * Context: Interrupt context.
- */
-static void virtsnd_event_notify_cb(struct virtqueue *vqueue)
-{
-	struct virtio_snd *snd = vqueue->vdev->priv;
-	struct virtio_snd_queue *queue = virtsnd_event_queue(snd);
+static void virtsnd_event_drain_locked(struct virtio_snd *snd,
+				       struct virtqueue *vqueue)
+{
 	struct virtio_snd_event *event;
 	u32 length;
 
-	guard(spinlock_irqsave)(&queue->lock);
+	lockdep_assert_held(&virtsnd_event_queue(snd)->lock);
 	do {
 		virtqueue_disable_cb(vqueue);
 		while ((event = virtqueue_get_buf(vqueue, &length))) {
@@ -94,6 +84,26 @@
 			virtsnd_event_send(vqueue, event, true, GFP_ATOMIC);
 		}
 	} while (!virtqueue_enable_cb(vqueue));
+}
+
+/**
+ * virtsnd_event_notify_cb() - Dispatch all reported events from the event queue.
+ * @vqueue: Underlying event virtqueue.
+ *
+ * This callback function is called upon a vring interrupt request from the
+ * device.
+ *
+ * Context: Interrupt context.
+ */
+static void virtsnd_event_notify_cb(struct virtqueue *vqueue)
+{
+	struct virtio_snd *snd = vqueue->vdev->priv;
+	struct virtio_snd_queue *queue = virtsnd_event_queue(snd);
+
+	guard(spinlock_irqsave)(&queue->lock);
+	if (queue->vqueue != vqueue || !snd->event_vq_enabled)
+		return;
+	virtsnd_event_drain_locked(snd, vqueue);
 }
 
 /**
@@ -131,6 +141,7 @@
 
 	for (i = 0; i < VIRTIO_SND_VQ_MAX; ++i)
 		snd->queues[i].vqueue = vqs[i];
+	snd->vqs_initialized = true;
 
 	/* Allocate events and populate the event queue */
 	virtqueue_disable_cb(vqs[VIRTIO_SND_VQ_EVENT]);
@@ -158,8 +169,12 @@
 {
 	struct virtio_snd_queue *queue = virtsnd_event_queue(snd);
 
+	guard(spinlock_irqsave)(&queue->lock);
+	if (!queue->vqueue)
+		return;
+	snd->event_vq_enabled = true;
 	if (!virtqueue_enable_cb(queue->vqueue))
-		virtsnd_event_notify_cb(queue->vqueue);
+		virtsnd_event_drain_locked(snd, queue->vqueue);
 }
 
 /**
@@ -172,13 +187,19 @@
 {
 	struct virtio_snd_queue *queue = virtsnd_event_queue(snd);
 	struct virtio_snd_event *event;
+	bool dispatch_events;
 	u32 length;
 
+	guard(spinlock_irqsave)(&queue->lock);
+	dispatch_events = snd->event_vq_enabled;
+	snd->event_vq_enabled = false;
 	if (queue->vqueue) {
-		guard(spinlock_irqsave)(&queue->lock);
 		virtqueue_disable_cb(queue->vqueue);
-		while ((event = virtqueue_get_buf(queue->vqueue, &length)))
-			virtsnd_event_dispatch(snd, event);
+		while ((event = virtqueue_get_buf(queue->vqueue, &length))) {
+			/* Reclaim used buffers even when failed probe cannot dispatch. */
+			if (dispatch_events)
+				virtsnd_event_dispatch(snd, event);
+		}
 	}
 }
 
@@ -338,6 +359,43 @@
 }
 
 /**
+ * virtsnd_reset_vqs() - Stop device access and unmap outstanding buffers.
+ * @snd: VirtIO sound device.
+ *
+ * Context: Any context that permits to sleep.
+ */
+static void virtsnd_reset_vqs(struct virtio_snd *snd)
+{
+	struct virtio_device *vdev = snd->vdev;
+	unsigned int i;
+
+	virtio_reset_device(vdev);
+
+	/* Deleting a virtqueue does not unmap its outstanding descriptors. */
+	for (i = 0; i < VIRTIO_SND_VQ_MAX; ++i) {
+		struct virtio_snd_queue *queue = &snd->queues[i];
+		unsigned long flags;
+		void *msg;
+
+		spin_lock_irqsave(&queue->lock, flags);
+		if (queue->vqueue)
+			while ((msg = virtqueue_detach_unused_buf(queue->vqueue)))
+				if (i == VIRTIO_SND_VQ_TX || i == VIRTIO_SND_VQ_RX)
+					virtsnd_pcm_msg_cancel(msg);
+		if (i == VIRTIO_SND_VQ_EVENT)
+			snd->event_vq_enabled = false;
+		/* IRQ callbacks must never see a detached ring as live. */
+		queue->vqueue = NULL;
+		spin_unlock_irqrestore(&queue->lock, flags);
+	}
+
+	if (snd->vqs_initialized) {
+		vdev->config->del_vqs(vdev);
+		snd->vqs_initialized = false;
+	}
+}
+
+/**
  * virtsnd_remove() - Remove VirtIO and ALSA devices.
  * @vdev: VirtIO parent device.
  *
@@ -349,13 +407,14 @@
 	unsigned int i;
 
 	virtsnd_disable_event_vq(snd);
-	virtsnd_ctl_msg_cancel_all(snd);
 
 	if (snd->card)
 		snd_card_free(snd->card);
 
-	virtio_reset_device(vdev);
-	vdev->config->del_vqs(vdev);
+	virtsnd_ctl_msg_cancel_all(snd);
+
+	virtsnd_reset_vqs(snd);
+	virtsnd_ctl_msg_cleanup(snd);
 
 	for (i = 0; snd->substreams && i < snd->nsubstreams; ++i) {
 		struct virtio_pcm_substream *vss = &snd->substreams[i];
@@ -383,8 +442,8 @@
 	virtsnd_disable_event_vq(snd);
 	virtsnd_ctl_msg_cancel_all(snd);
 
-	virtio_reset_device(vdev);
-	vdev->config->del_vqs(vdev);
+	virtsnd_reset_vqs(snd);
+	virtsnd_ctl_msg_cleanup(snd);
 
 	for (i = 0; i < snd->nsubstreams; ++i)
 		cancel_work_sync(&snd->substreams[i].elapsed_period);
@@ -408,10 +467,13 @@
 	int rc;
 
 	rc = virtsnd_find_vqs(snd);
-	if (rc)
+	if (rc) {
+		virtsnd_reset_vqs(snd);
 		return rc;
+	}
 
 	virtio_device_ready(vdev);
+	virtsnd_ctl_msg_enable(snd);
 
 	virtsnd_enable_event_vq(snd);
 
diff --git a/sound/virtio/virtio_card.h b/sound/virtio/virtio_card.h
--- a/sound/virtio/virtio_card.h
+++ b/sound/virtio/virtio_card.h
@@ -45,8 +45,11 @@
  * struct virtio_snd - VirtIO sound card device.
  * @vdev: Underlying virtio device.
  * @queues: Virtqueue wrappers.
+ * @vqs_initialized: Virtqueues allocated by virtio_find_vqs().
  * @card: ALSA sound card.
  * @ctl_msgs: Pending control request list.
+ * @ctl_msgs_blocked: Control requests are blocked during teardown or suspend.
+ * @event_vq_enabled: Event callbacks may dispatch, protected by the event queue lock.
  * @event_msgs: Device events.
  * @pcm_list: VirtIO PCM device list.
  * @jacks: VirtIO jacks.
@@ -62,8 +65,11 @@
 struct virtio_snd {
 	struct virtio_device *vdev;
 	struct virtio_snd_queue queues[VIRTIO_SND_VQ_MAX];
+	bool vqs_initialized;
 	struct snd_card *card;
 	struct list_head ctl_msgs;
+	bool ctl_msgs_blocked;
+	bool event_vq_enabled;
 	struct virtio_snd_event *event_msgs;
 	struct list_head pcm_list;
 	struct virtio_jack *jacks;
diff --git a/sound/virtio/virtio_ctl_msg.c b/sound/virtio/virtio_ctl_msg.c
--- a/sound/virtio/virtio_ctl_msg.c
+++ b/sound/virtio/virtio_ctl_msg.c
@@ -15,6 +15,7 @@
  * @list: Pending message list entry.
  * @notify: Request completed notification.
  * @ref_count: Reference count used to manage a message lifetime.
+ * @cancelled: Request canceled during device teardown.
  */
 struct virtio_snd_msg {
 	struct scatterlist sg_request;
@@ -22,6 +23,7 @@
 	struct list_head list;
 	struct completion notify;
 	refcount_t ref_count;
+	bool cancelled;
 };
 
 /**
@@ -100,7 +102,7 @@
 
 	INIT_LIST_HEAD(&msg->list);
 	init_completion(&msg->notify);
-	/* This reference is dropped in virtsnd_ctl_msg_complete(). */
+	/* The caller owns this reference; send adds a queue reference. */
 	refcount_set(&msg->ref_count, 1);
 
 	return msg;
@@ -134,6 +136,7 @@
 	int rc;
 
 	virtsnd_ctl_msg_ref(msg);
+	/* This reference stays with the queue until completion or teardown. */
 
 	/* Set the default status in case the message was canceled. */
 	response->code = cpu_to_le32(VIRTIO_SND_S_IO_ERR);
@@ -147,12 +150,17 @@
 		psgs[nouts + nins++] = in_sgs;
 
 	scoped_guard(spinlock_irqsave, &queue->lock) {
-		rc = virtqueue_add_sgs(queue->vqueue, psgs, nouts, nins, msg,
-				       GFP_ATOMIC);
+		if (snd->ctl_msgs_blocked)
+			rc = -ENODEV;
+		else
+			rc = virtqueue_add_sgs(queue->vqueue, psgs, nouts, nins,
+					       msg, GFP_ATOMIC);
 		if (!rc) {
 			notify = virtqueue_kick_prepare(queue->vqueue);
 
 			list_add_tail(&msg->list, &snd->ctl_msgs);
+			if (notify)
+				virtqueue_notify(queue->vqueue);
 		}
 	}
 
@@ -168,9 +176,6 @@
 
 		goto on_exit;
 	}
-
-	if (notify)
-		virtqueue_notify(queue->vqueue);
 
 	if (nowait)
 		goto on_exit;
@@ -184,6 +189,11 @@
 			rc = -ETIMEDOUT;
 		}
 
+		goto on_exit;
+	}
+
+	if (READ_ONCE(msg->cancelled)) {
+		rc = -ENODEV;
 		goto on_exit;
 	}
 
@@ -227,9 +237,33 @@
  * virtsnd_ctl_msg_cancel_all() - Cancel all pending control messages.
  * @snd: VirtIO sound device.
  *
- * Context: Any context.
+ * Context: Any context. Blocks new senders and marks pending requests canceled.
+ *          Existing senders are woken when their request completes or after
+ *          the device has been reset.
  */
 void virtsnd_ctl_msg_cancel_all(struct virtio_snd *snd)
+{
+	struct virtio_snd_queue *queue = virtsnd_control_queue(snd);
+	struct virtio_snd_msg *msg;
+
+	guard(spinlock_irqsave)(&queue->lock);
+	snd->ctl_msgs_blocked = true;
+	list_for_each_entry(msg, &snd->ctl_msgs, list) {
+		WRITE_ONCE(msg->cancelled, true);
+	}
+}
+
+/**
+ * virtsnd_ctl_msg_cleanup() - Release messages left after queue teardown.
+ * @snd: VirtIO sound device.
+ *
+ * This must be called after device reset, buffer detachment, and del_vqs(),
+ * when no queue callback or DMA access can still reach a message. The queue
+ * object and its lock must remain alive until this function returns.
+ *
+ * Context: Any context.
+ */
+void virtsnd_ctl_msg_cleanup(struct virtio_snd *snd)
 {
 	struct virtio_snd_queue *queue = virtsnd_control_queue(snd);
 
@@ -244,6 +278,20 @@
 }
 
 /**
+ * virtsnd_ctl_msg_enable() - Allow control requests after queue restoration.
+ * @snd: VirtIO sound device.
+ *
+ * Context: Any context.
+ */
+void virtsnd_ctl_msg_enable(struct virtio_snd *snd)
+{
+	struct virtio_snd_queue *queue = virtsnd_control_queue(snd);
+
+	guard(spinlock_irqsave)(&queue->lock);
+	snd->ctl_msgs_blocked = false;
+}
+
+/**
  * virtsnd_ctl_query_info() - Query the item configuration from the device.
  * @snd: VirtIO sound device.
  * @command: Control request code (VIRTIO_SND_R_XXX_INFO).
@@ -295,6 +343,8 @@
 	u32 length;
 
 	guard(spinlock_irqsave)(&queue->lock);
+	if (queue->vqueue != vqueue)
+		return;
 	do {
 		virtqueue_disable_cb(vqueue);
 		while ((msg = virtqueue_get_buf(vqueue, &length)))
diff --git a/sound/virtio/virtio_ctl_msg.h b/sound/virtio/virtio_ctl_msg.h
--- a/sound/virtio/virtio_ctl_msg.h
+++ b/sound/virtio/virtio_ctl_msg.h
@@ -68,6 +68,10 @@
 
 void virtsnd_ctl_msg_cancel_all(struct virtio_snd *snd);
 
+void virtsnd_ctl_msg_cleanup(struct virtio_snd *snd);
+
+void virtsnd_ctl_msg_enable(struct virtio_snd *snd);
+
 void virtsnd_ctl_msg_complete(struct virtio_snd_msg *msg);
 
 int virtsnd_ctl_query_info(struct virtio_snd *snd, int command, int start_id,
diff --git a/sound/virtio/virtio_pcm.h b/sound/virtio/virtio_pcm.h
--- a/sound/virtio/virtio_pcm.h
+++ b/sound/virtio/virtio_pcm.h
@@ -128,6 +128,8 @@
 
 void virtsnd_pcm_msg_reset(struct virtio_pcm_substream *vss);
 
+void virtsnd_pcm_msg_cancel(struct virtio_pcm_msg *msg);
+
 int virtsnd_pcm_msg_send(struct virtio_pcm_substream *vss, unsigned long offset,
 			 unsigned long bytes);
 
diff --git a/sound/virtio/virtio_pcm_msg.c b/sound/virtio/virtio_pcm_msg.c
--- a/sound/virtio/virtio_pcm_msg.c
+++ b/sound/virtio/virtio_pcm_msg.c
@@ -305,6 +305,35 @@
 {
 	guard(spinlock_irqsave)(&vss->lock);
 	return vss->msg_count;
+}
+
+/**
+ * virtsnd_pcm_msg_cancel() - Cancel a message detached during device reset.
+ * @msg: Message returned by virtqueue_detach_unused_buf().
+ *
+ * Reset cancellation retires the queue token without treating it as a device
+ * completion. In particular, it does not advance the PCM hardware pointer or
+ * schedule period work.
+ *
+ * Context: Process context with the PCM queue lock held.
+ */
+void virtsnd_pcm_msg_cancel(struct virtio_pcm_msg *msg)
+{
+	struct virtio_pcm_substream *vss = msg->substream;
+	bool wake;
+
+	{
+		guard(spinlock)(&vss->lock);
+		msg->length = 0;
+		vss->xfer_enabled = false;
+		if (WARN_ON_ONCE(!vss->msg_count))
+			return;
+		vss->msg_count--;
+		wake = !vss->msg_count;
+	}
+
+	if (wake)
+		wake_up_all(&vss->msg_empty);
 }
 
 /**
@@ -367,16 +396,21 @@
 
 /**
  * virtsnd_pcm_notify_cb() - Process all completed I/O messages.
- * @queue: Underlying tx/rx virtqueue.
+ * @queue: Underlying tx/rx queue wrapper.
+ * @vqueue: Queue that raised this callback.
  *
  * Context: Interrupt context. Takes and releases the tx/rx queue spinlock.
  */
-static inline void virtsnd_pcm_notify_cb(struct virtio_snd_queue *queue)
+static inline void
+virtsnd_pcm_notify_cb(struct virtio_snd_queue *queue, struct virtqueue *vqueue)
 {
 	struct virtio_pcm_msg *msg;
 	u32 written_bytes;
 
 	guard(spinlock_irqsave)(&queue->lock);
+	/* Reset can detach the queue before the transport drains its IRQs. */
+	if (queue->vqueue != vqueue)
+		return;
 	do {
 		virtqueue_disable_cb(queue->vqueue);
 		while ((msg = virtqueue_get_buf(queue->vqueue, &written_bytes)))
@@ -394,7 +428,7 @@
 {
 	struct virtio_snd *snd = vqueue->vdev->priv;
 
-	virtsnd_pcm_notify_cb(virtsnd_tx_queue(snd));
+	virtsnd_pcm_notify_cb(virtsnd_tx_queue(snd), vqueue);
 }
 
 /**
@@ -407,7 +441,7 @@
 {
 	struct virtio_snd *snd = vqueue->vdev->priv;
 
-	virtsnd_pcm_notify_cb(virtsnd_rx_queue(snd));
+	virtsnd_pcm_notify_cb(virtsnd_rx_queue(snd), vqueue);
 }
 
 /**
