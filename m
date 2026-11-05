Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793837384;
	b=3/f0uyBTqf0+a1aSfVkHawcTHFuM0JNrukbMTNaltudWAE/YCALwynWTiU4Mg1/N/+5Y
	 3m1Lq+umVsnORmH9rOw5y3Yl//CGU99N56luRt6cuIsowR3kZYYdUb85u/K76xa3t0jN2
	 2c9zylvbLJKK2+JSaTWQKdl8Q395semRKc94vxsm/JvHXn+ZRPnR0V6iQ/ylWk0TG653T
	 IParGx9+WCN27YvXQtevQjzX9Y0kgzW46jyyyTeolLM5QV/6PKfvfNwk2CHth0qSznRJ2
	 R8RmYQTaXcnn8zuyXuVLeFrLg/B5V+R80y0YVZxhcmtpNdbqZ/WaoSs+kG4N/HvOIMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793837384;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=shxWaq5dZNBKXljfTqIcI4ceP06AmBI4Yl4FExE9+60=;
	b=atP6yvfyKBOxdWrZAR2RIpE/xwhWxJEBADwZoea8TKmpVwg7e/MU83XKJ9SzlkBjLscs
	 M5ol76dFuoBGsgPVbMBSX/ZUlO3xP9VuuT9XPbGzTARg6okn5gsfhDuWWbIVAD/Z/8PyM
	 9BYcvDjgA8obQ9mucA0RzN+fxvR0lOFJcFwPfJ1SJ9W7UQax7XfXeWasgSPGHk1HWk3Yq
	 MTFdWGlmI/t0MewEJQWlPbzsu+a7bS3soG+BP5AtIhWa1mbzejj2tLZEKasTdi8++Ohd4
	 6k2xR/llUlJAdhz09pSOw3zdSy2aFZma/ulNcdwx2XC3wgklDOlZnT4KLyk3Xg9N1SA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HmjrOUfH;
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 755D7606EEBE
	for <linux-sound@vger.kernel.org>; Thu,  5 Nov 2026 00:09:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 755D7606EEBE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HmjrOUfH
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3b08a162d4bso961536a91.3
        for <linux-sound@vger.kernel.org>; Wed, 04 Nov 2026 16:09:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793837383; x=1794442183; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=shxWaq5dZNBKXljfTqIcI4ceP06AmBI4Yl4FExE9+60=;
        b=HmjrOUfHteyEcIiJAZfDtxlJk0Y2QDqNbmt4/UgRVj0OxjsNJIGMxVT7tP67akqdG6
         0ipI/gcNwN7uldZiePjGFnZ0Md70VWGlZUpUj+eQN6BSW38YpjXIqeiUdyVNsvfix66Y
         +5FM6Bq+MjnXFlnrHH2SNJnaNDzQGMSoXoVOaOY0rm0urNH3uoWU4GsNoIULKBYnSvGl
         JbjRrsCRWHzMDSF2JgWxRA0xkikWM3U9UZU3K3JOmB78jW4GFoAulxkQbHRjz4c5R48h
         04xl3+mAlXLke6hYTr6LQQFmitYk8YrC9qSgSPM1v+WLYLCs620IJ0d8EwkBEfMrLQJ/
         1H+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793837383; x=1794442183;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=shxWaq5dZNBKXljfTqIcI4ceP06AmBI4Yl4FExE9+60=;
        b=L0ZpzIdfsD9h1C3HSAAb2UTcktL9bxZdWpnWF5aCtAHqswALsiqzqem4nbgjWp68ub
         Whb6JChGZozpu4s9+6jQoesTL3cNHd6F7qbnG93+DdCKKXWKD+7Of/TlJJnAENvE1Ep3
         1G5hde7pXb3pHhK5hiOjWnMLI8wkJEkxoJFVmCHI8Mu6ukskc0QMSQuTQwxYydcocLj2
         iqn4XZKYQ+r8NKnV2gaA+zEh4ZT2XAgffD8LUBE1FyygPOYJbGSeLb+iBZJtNtlhTZ2w
         OWEfGUnUTpwO6HG9Q/tzFSToUJ0fjt8lFiVd/ctBxqcjclbGs9c/k6xQnWopUEiGkQ+u
         og9Q==
X-Gm-Message-State: APuU4Z9h3kv85yAH/3zaCmukBFQs7GnSiWjM/zQh9fTVqnhwm36ZZJjf
	k6a+RYlTksxDuLKqA1EFlVgiZDRO/zLQoYif8sFmgty12LBxOLwiUaW1x42+CA==
X-Gm-Gg: AYBFou2ToGmzL6DGewjWoK7Wn0CvL7Kv8F2dONkW5P+Se0ECkSPDMNd4yliCRWFYNVS
	laic6A8HS/egzQE+IND4DiESx5srOBDi6keC1Lko4Us9/wjFo4Xx0mUlYKer7bMttH63rcm6Mgq
	sQ4w4wA0QxlMCOWiRW+IfSUmtNA3+IwOX0vPFyDG2cJHwek3488KH9yyhsx8m31p5taoHqrD2Ol
	YcvBIXle87uwKJ8rGJhHTTTy0EvDi6ogl1RwTO9cg0frZ8SGOQtMTsaHYyB9kvQqx6ugFOu04Uv
	i+boTkKaz0IOOVNjSqnFRhtb+sdiIfFEHlgLaUJaBzAhrdwtmxqZ1ofSwgZLzHQ3et1gyaaCvzp
	zPXPQ4X10PKLnuo+9ybGdx3d19Ere2WoIg8kXIQIyCB145lRxZe/rx8B9vsQCZtKwNbMGS0m2K5
	rYaecZq7JjBe1kP/UW8ODa/ZlTx2kHO724R57Lx63aXZC81/RSH2xgjuKUUNwVK1vZfEQzx2FPN
	dtlR4qL+ndhUH9nAyUEaV+dXRZsLmAC4EBTZldiFun+wuTjblU+JGVjL35cAdaO5HQRoPsZ+eTZ
	Az6GNjF918/7t3XfET5aJrw/00FMGrEG2oSXwmDcmdx+pd9GF9q1vTb576QoEy+obNn02h1DdTf
	oTT7iEZcLlxolV2qi2ZVjLLUIWEnOLSe99zHMX467EO1hKxo=
X-Received: by 2002:a17:90b:1b0f:b0:3ac:9ed8:f319 with SMTP id 98e67ed59e1d1-3ae8957d4dfmr15311309a91.2.1793837382796;
        Wed, 04 Nov 2026 16:09:42 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b323c18fsm897208a91.4.2026.11.04.16.09.39
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 04 Nov 2026 16:09:42 -0800 (PST)
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
Subject: [PATCH v15 06/12] ALSA: virtio: Retain queued messages through device reset
Date: Thu,  5 Nov 2026 09:09:09 +0900
Message-ID: <20261105000915.15177-7-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261105000915.15177-1-mynameisjune111@gmail.com>
References: <20261105000915.15177-1-mynameisjune111@gmail.com>
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

Clear each queue wrapper inside the same critical section that detaches
its buffers. Check the callback's queue identity under the wrapper lock
for PCM, control and event queues. This makes queue retirement explicit
through teardown and restore. A forced callback test passed on both
versions; the proposed detached-ring IRQ failure was not reproduced on
the tested PCI transport.

Protect event callback admission with the event queue lock. Disabling
events waits for an active dispatch, and later callbacks see a closed
gate before ALSA objects are freed. Enable and pending-event draining
share the same lock.

Reclaim pending event buffers after a failed probe without dispatching
notifications into ALSA objects that have not been constructed. Record
the queue's prior enabled state under its lock before closing admission.

Fixes: 9d45e514da88 ("ALSA: virtio: handling control messages")
Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
sound/virtio/virtio_card.c    |  102 ++++++++++++++++++++++++++++++++---------
 sound/virtio/virtio_card.h    |    4 ++
 sound/virtio/virtio_ctl_msg.c |   64 +++++++++++++++++++++++---
 sound/virtio/virtio_ctl_msg.h |    4 ++
 sound/virtio/virtio_pcm.h     |    2 +
 sound/virtio/virtio_pcm_msg.c |   42 +++++++++++++++--
 6 files changed, 184 insertions(+), 34 deletions(-)

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
@@ -158,8 +168,12 @@
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
@@ -172,13 +186,19 @@
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
 
@@ -338,6 +358,40 @@
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
+	vdev->config->del_vqs(vdev);
+}
+
+/**
  * virtsnd_remove() - Remove VirtIO and ALSA devices.
  * @vdev: VirtIO parent device.
  *
@@ -349,13 +403,14 @@
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
@@ -383,8 +438,8 @@
 	virtsnd_disable_event_vq(snd);
 	virtsnd_ctl_msg_cancel_all(snd);
 
-	virtio_reset_device(vdev);
-	vdev->config->del_vqs(vdev);
+	virtsnd_reset_vqs(snd);
+	virtsnd_ctl_msg_cleanup(snd);
 
 	for (i = 0; i < snd->nsubstreams; ++i)
 		cancel_work_sync(&snd->substreams[i].elapsed_period);
@@ -412,6 +467,7 @@
 		return rc;
 
 	virtio_device_ready(vdev);
+	virtsnd_ctl_msg_enable(snd);
 
 	virtsnd_enable_event_vq(snd);
 
diff --git a/sound/virtio/virtio_card.h b/sound/virtio/virtio_card.h
--- a/sound/virtio/virtio_card.h
+++ b/sound/virtio/virtio_card.h
@@ -47,6 +47,8 @@
  * @queues: Virtqueue wrappers.
  * @card: ALSA sound card.
  * @ctl_msgs: Pending control request list.
+ * @ctl_msgs_blocked: Control requests are blocked during teardown or suspend.
+ * @event_vq_enabled: Event callbacks may dispatch, protected by the event queue lock.
  * @event_msgs: Device events.
  * @pcm_list: VirtIO PCM device list.
  * @jacks: VirtIO jacks.
@@ -64,6 +66,8 @@
 	struct virtio_snd_queue queues[VIRTIO_SND_VQ_MAX];
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
