Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794201401;
	b=plnFZ2Igikh/0UvknhllJTOa7qUZgL5WqfgsVCE/oa5bi8yohYkeWhHz5Bdt+zDCKRdQ
	 HcvED8gPXp7jSSHOH6vneGXX0a8OovasZ3OF0aazcH/rcCKQHLrZwgBZKvLklUO3Dbmv/
	 jzi+CSfmvr4o2chXTIqi1r5SKrvxm+2Z6vFcvR2wXnO8YUyrK5dSSrrJNwTh+RJc+wInR
	 AUmZSoxdQO1EpQNQtSiJ+FAtPwM42pWiv5IKHpDDy+MqaZcV3TYEt6ojP8+vEOLHtFmUZ
	 b1QFyTAvLAHg+FdUmPQ7sIYjGZMl6ho5+6RUGTexYSqJyF/RzFFpewkAZY1YKUCzytA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794201401;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=cLMih6kZoVOfbcGyVvRJe1SajFhwVnaZTaUyYM8p6aE=;
	b=tgIFKdTIwyg1bgBpGomExH/o3UXjlIh9gRMphmRUETWTgWwRZ8LT2VkZU2zF7AYdkTXq
	 Sac+f+MkmuzevhDHVCLp5ylLyHH/9fm1WsJkIAi0qS10Cej49MzAqxTqd0AqLvDx3Kio6
	 X5i5hzr8lFsOpN8Q0p80xSHKHIRt6XEEtTnn6Zq11KE8ah5Ije/wo5tnQHEJus6RIQCV6
	 F/L5c3QPrGWvFj5UhmL3mZiO+awNMA0UTHTGLNciGddBQnmZhDTa7AGYDCOFqJFjhEcZK
	 pHEqMbqotCQnq1lqlWVZljk64XuF0K9NyayU+nVFWoP+9oVOEdqwdK8lmWKeJe9uUuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="L/Dcoemd";
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F7CB606A336
	for <linux-sound@vger.kernel.org>; Mon,  9 Nov 2026 05:16:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F7CB606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L/Dcoemd
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1b3acec6677so463850c88.1
        for <linux-sound@vger.kernel.org>; Sun, 08 Nov 2026 21:16:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794201400; x=1794806200; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cLMih6kZoVOfbcGyVvRJe1SajFhwVnaZTaUyYM8p6aE=;
        b=L/DcoemdaFs2tGfoSFD4IU0Ddh01ufmPHT3oJdYeSRcblLZDOzN/9lfKGChKyZeARM
         PPBY9FcuDxD+wp3Iuny7WLlHPwuQPRYaRJ5m/1JGi+v6v76oIUlzQRsdkGeV6I+dBFmY
         HvP1gDA/wmT7OE19X6GxqHyZoiWwEIRDOCQe17VVdvOTQqudslfg4NI28jOtGO8UFcN7
         IVfozVmpPihVbKrmAxYJnuOp+h/m1nfhb7UpCfL0HJS4A5V0ybbznL7a5dnH6Fv6XV1s
         R8zPkC9mkstyaFtArMA2FDqx0tpQmRs3jEgspCaol7DI1KJa4l0QcyeXxv0lYCeb8O57
         0HNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794201400; x=1794806200;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cLMih6kZoVOfbcGyVvRJe1SajFhwVnaZTaUyYM8p6aE=;
        b=WQc8r9+QtFFvQdWmcOMgeVRryLcyMGPNbapn3WZBsiotV2C5NcIi6AWfk+cxX65Dps
         hx/5pU9FEmNKT7HLZguLPt82AH6yXz2pjWon9SPpmppDEYkhCZEeSE5Yrmv9K5XFPY2l
         olyXezHvAaQUcNz4vDwKblHmc/Ch7iN/ZdNK443ws4YAMyVCiUh/s7ezw9bHqTHkyRYY
         ui5LVjNx0IbL2K5kCkRjjR8kwUBDwab1dxzUSmeOranK4LDUrUWXWu6nIb4e4AYuAe7Q
         OItSxwxQ5qu/myzyeZs4d+xbItnBbN/Jbn8/PwDOh9B7XqjMiX1JuI8ZmQM74mPdvCgx
         OKVw==
X-Gm-Message-State: APuU4Z9fvJhw6QEj/16BHSmU+KeOcmy/eeSV9st5WqEX1Gn0P/SsK5Zc
	DWVbFL1K364ychpSS7Qi0anJpwVZ74XaNsRZz+IFD98uUTgoG0jYLwIfNqRwHw==
X-Gm-Gg: AYBFou2QH0SLLdlot6ZaIFQz/9n+GTafdb8Af2p47SVLLaKaa7q78VNRvmlyKAlWS+6
	msUFd4RncWkgljWEpHkPt082Oxk/m1/jgeoRzFcwl9PVY5AKK3Q+M9y850+zmkIXnic5mOnW/IK
	YWmmX1qsnwc3w/WL7PjsoDyrJVYAKdnm3QmMxL/TtE1dECt8Oq8bPogkpmigt48HWHB+uVTMPnW
	KuJmRlJ2DtysR1vShoZbdlEHDZgxSKCuX7uvroxVqDTouP5XrhlhBOvm1Nmkn82r5YVw0hgTumv
	tHlU4ofM+/4uHTf9SPTEECq/3KfBfB+GYNOCbKm/jVmQC5Co05e/smPHHxCNaDaZ5IgwRFsmPrB
	+rw7ldAQix75binNCxqqwAPB4NWe+SmU/QItd11LHF99yIN5rnC3p5WuWJnPwFZMLwtFK1QBQUk
	82XOBIw+ziQYSyQMHcejiriV8CxHwsQhtRIu5l24ov6dkZRgHdQmm4GEQlK2S5IonDWMsY6s4qo
	b/ogycpHJKqhk4STOCI6XFGp2Rl5Z1wbN2E+T5jC+nbM/LbABoqXqB1LDWv2r52sYxOe4fKEAfA
	PbKzEvHDyDm+XZIJpKwAZrKvVAWoTZJ1GO+p1gbhtjEvVf04vqz8VL64yUpOlOMuUBAiB/v4627
	fsUEGQSPidDd6xp0YWy+DJQoVOne8EV0wzod46ETjQp3jcyI=
X-Received: by 2002:a05:701b:2514:b0:185:b157:f271 with SMTP id a92af1059eb24-1b39feae9famr4599721c88.23.1794201399678;
        Sun, 08 Nov 2026 21:16:39 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b37314826asm11395635c88.3.2026.11.08.21.16.36
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 08 Nov 2026 21:16:39 -0800 (PST)
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
Subject: [PATCH v22 05/13] ALSA: virtio: propagate PCM send failures through ACK
Date: Mon,  9 Nov 2026 14:16:10 +0900
Message-ID: <20261109051618.22506-6-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261109051618.22506-1-mynameisjune111@gmail.com>
References: <20261108235457.12688-1-mynameisjune111@gmail.com>
 <20261109051618.22506-1-mynameisjune111@gmail.com>
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

A failed queue submission can strand earlier messages from the same ACK.
Restore the failed message length, notify any earlier queued messages,
and propagate the failure through the indirect transfer callback. Commit
its private cursor only after successful submission.

Keep ACK admission closed across the linked prepare action and publish
the prepared state from the new prepare-completion callback. On failure,
leave the stream unprepared and reopen admission only after the core
reports completion.

Once the PCM core has moved a member to XRUN, return -EBADFD from a
later ACK so it does not request a second linked-group XRUN. ACK during
prepare remains rejected until the completion callback.

Fixes: fe981e67568c ("ALSA: virtio: use ack callback")
Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
sound/virtio/virtio_pcm.h     |    6 +
 sound/virtio/virtio_pcm_msg.c |   12 ++
 sound/virtio/virtio_pcm_ops.c |  249 +++++++++++++++++++++++++++++++++++++----
 3 files changed, 241 insertions(+), 26 deletions(-)

diff --git a/sound/virtio/virtio_pcm.h b/sound/virtio/virtio_pcm.h
--- a/sound/virtio/virtio_pcm.h
+++ b/sound/virtio/virtio_pcm.h
@@ -33,6 +33,10 @@
  * @xfer_xrun: Data underflow/overflow state (0 - no xrun, 1 - xrun).
  * @stopped: True if the substream is stopped and must be released on the device
  *           side.
+ * @prepared: True after device PREPARE and the core pointer reset succeed;
+ *            protected by @lock.
+ * @preparing: ACK gate through teardown and prepare's core reset;
+ *             protected by @lock.
  * @suspended: True if the substream is suspended and must be reconfigured on
  *             the device side at resume.
  * @msgs: Allocated I/O messages.
@@ -56,6 +60,8 @@
 	bool xfer_enabled;
 	bool xfer_xrun;
 	bool stopped;
+	bool prepared;
+	bool preparing;
 	bool suspended;
 	struct virtio_pcm_msg **msgs;
 	unsigned int nmsgs;
diff --git a/sound/virtio/virtio_pcm_msg.c b/sound/virtio/virtio_pcm_msg.c
--- a/sound/virtio/virtio_pcm_msg.c
+++ b/sound/virtio/virtio_pcm_msg.c
@@ -260,6 +260,18 @@
 				dev_err(&vdev->dev,
 					"SID %u: failed to send I/O message\n",
 					vss->sid);
+				msg->length -= n;
+
+				/*
+				 * Do not leave earlier messages queued without notifying
+				 * the device when a later message could not be added.
+				 */
+				if (msg_count != vss->msg_count &&
+				    !(vss->features &
+				      (1U << VIRTIO_SND_PCM_F_MSG_POLLING)) &&
+				    virtqueue_kick_prepare(vqueue))
+					virtqueue_notify(vqueue);
+
 				return rc;
 			}
 
diff --git a/sound/virtio/virtio_pcm_ops.c b/sound/virtio/virtio_pcm_ops.c
--- a/sound/virtio/virtio_pcm_ops.c
+++ b/sound/virtio/virtio_pcm_ops.c
@@ -97,6 +97,38 @@
 static int virtsnd_pcm_sync_stop(struct snd_pcm_substream *substream);
 
 /**
+ * virtsnd_pcm_close_ack() - Update PCM prepare admission state.
+ * @substream: Kernel ALSA substream.
+ * @preparing: True while driver prepare and the core pointer reset are active.
+ *
+ * Context: Process context.
+ */
+static void virtsnd_pcm_close_ack(struct snd_pcm_substream *substream,
+				  bool preparing)
+{
+	struct virtio_pcm_substream *vss = snd_pcm_substream_chip(substream);
+
+	scoped_guard(pcm_stream_lock_irqsave, substream) {
+		guard(spinlock_irqsave)(&vss->lock);
+		vss->prepared = false;
+		vss->xfer_enabled = false;
+		vss->preparing = preparing;
+	}
+}
+
+/* Keep completed RX data valid while RELEASE drains the device queue. */
+static void virtsnd_pcm_block_ack(struct snd_pcm_substream *substream)
+{
+	struct virtio_pcm_substream *vss = snd_pcm_substream_chip(substream);
+
+	scoped_guard(pcm_stream_lock_irqsave, substream) {
+		guard(spinlock_irqsave)(&vss->lock);
+		vss->preparing = true;
+		vss->xfer_enabled = false;
+	}
+}
+
+/**
  * virtsnd_pcm_open() - Open the PCM substream.
  * @substream: Kernel ALSA substream.
  *
@@ -115,7 +147,8 @@
 	snd_pcm_hw_constraint_integer(substream->runtime,
 				      SNDRV_PCM_HW_PARAM_PERIODS);
 
-	vss->stopped = !!virtsnd_pcm_msg_pending_num(vss);
+	scoped_guard(spinlock_irqsave, &vss->lock)
+		vss->stopped = !!vss->msg_count;
 	vss->suspended = false;
 
 	/*
@@ -219,6 +252,8 @@
 	struct virtio_device *vdev = vss->snd->vdev;
 	int rc;
 
+	virtsnd_pcm_close_ack(substream, false);
+
 	if (virtsnd_pcm_msg_pending_num(vss)) {
 		dev_err(&vdev->dev, "SID %u: invalid I/O queue state\n",
 			vss->sid);
@@ -254,6 +289,8 @@
 {
 	struct virtio_pcm_substream *vss = snd_pcm_substream_chip(substream);
 
+	virtsnd_pcm_close_ack(substream, false);
+
 	/* If the queue is flushed, we can safely free the messages here. */
 	if (!virtsnd_pcm_msg_pending_num(vss))
 		virtsnd_pcm_msg_free(vss);
@@ -262,17 +299,18 @@
 }
 
 /**
- * virtsnd_pcm_prepare() - Prepare the PCM substream.
+ * virtsnd_pcm_prepare_device() - Prepare the PCM substream on the device.
  * @substream: Kernel ALSA substream.
  *
  * Context: Process context.
  * Return: 0 on success, -errno on failure.
  */
-static int virtsnd_pcm_prepare(struct snd_pcm_substream *substream)
+static int virtsnd_pcm_prepare_device(struct snd_pcm_substream *substream)
 {
 	struct virtio_pcm_substream *vss = snd_pcm_substream_chip(substream);
 	struct virtio_device *vdev = vss->snd->vdev;
 	struct virtio_snd_msg *msg;
+	int rc;
 
 	if (!vss->suspended) {
 		if (virtsnd_pcm_msg_pending_num(vss)) {
@@ -287,16 +325,14 @@
 		struct snd_pcm_runtime *runtime = substream->runtime;
 		unsigned int buffer_bytes = snd_pcm_lib_buffer_bytes(substream);
 		unsigned int period_bytes = snd_pcm_lib_period_bytes(substream);
-		int rc;
 
 		rc = virtsnd_pcm_dev_set_params(vss, buffer_bytes, period_bytes,
-						runtime->channels,
-						runtime->format, runtime->rate);
+						 runtime->channels,
+						 runtime->format, runtime->rate);
 		if (rc)
 			return rc;
 	}
 
-	vss->xfer_xrun = false;
 	vss->suspended = false;
 	vss->msg_count = 0;
 	virtsnd_pcm_msg_reset(vss);
@@ -311,7 +347,33 @@
 	if (!msg)
 		return -ENOMEM;
 
-	return virtsnd_ctl_msg_send_sync(vss->snd, msg);
+	rc = virtsnd_ctl_msg_send_sync(vss->snd, msg);
+	if (rc)
+		return rc;
+
+	scoped_guard(spinlock_irqsave, &vss->lock) {
+		vss->xfer_xrun = false;
+	}
+	return 0;
+}
+
+/* Keep ACK closed through the core's locked pointer reset. */
+static int virtsnd_pcm_prepare(struct snd_pcm_substream *substream)
+{
+	virtsnd_pcm_close_ack(substream, true);
+	return virtsnd_pcm_prepare_device(substream);
+}
+
+/* Complete admission only after the linked core prepare action ends. */
+static void virtsnd_pcm_prepare_complete(
+	struct snd_pcm_substream *substream, bool success)
+{
+	struct virtio_pcm_substream *vss = snd_pcm_substream_chip(substream);
+
+	scoped_guard(spinlock_irqsave, &vss->lock) {
+		vss->prepared = success;
+		vss->preparing = false;
+	}
 }
 
 /**
@@ -338,6 +400,8 @@
 
 		scoped_guard(spinlock_irqsave, &queue->lock) {
 			guard(spinlock)(&vss->lock);
+			if (vss->preparing || !vss->prepared)
+				return -EBADFD;
 			if (vss->direction == SNDRV_PCM_STREAM_CAPTURE)
 				rc = virtsnd_pcm_msg_send(vss, 0, vss->buffer_bytes);
 			if (rc)
@@ -356,10 +420,12 @@
 
 		return virtsnd_ctl_msg_send_sync(snd, msg);
 	case SNDRV_PCM_TRIGGER_SUSPEND:
-		vss->suspended = true;
+		scoped_guard(spinlock_irqsave, &vss->lock)
+			vss->suspended = true;
 		fallthrough;
 	case SNDRV_PCM_TRIGGER_STOP:
-		vss->stopped = true;
+		scoped_guard(spinlock_irqsave, &vss->lock)
+			vss->stopped = true;
 		fallthrough;
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
 		scoped_guard(spinlock_irqsave, &vss->lock) {
@@ -393,11 +459,16 @@
 	struct virtio_snd *snd = vss->snd;
 	struct virtio_snd_msg *msg;
 	unsigned int js = msecs_to_jiffies(virtsnd_msg_timeout_ms);
+	bool stopped;
 	int rc;
 
+	virtsnd_pcm_block_ack(substream);
+
 	cancel_work_sync(&vss->elapsed_period);
 
-	if (!vss->stopped)
+	scoped_guard(spinlock_irqsave, &vss->lock)
+		stopped = vss->stopped;
+	if (!stopped)
 		return 0;
 
 	msg = virtsnd_pcm_ctl_msg_alloc(vss, VIRTIO_SND_R_PCM_RELEASE,
@@ -425,7 +496,8 @@
 		return !rc ? -ETIMEDOUT : rc;
 	}
 
-	vss->stopped = false;
+	scoped_guard(spinlock_irqsave, &vss->lock)
+		vss->stopped = false;
 
 	return 0;
 }
@@ -442,6 +514,10 @@
 virtsnd_pcm_pb_pointer(struct snd_pcm_substream *substream)
 {
 	struct virtio_pcm_substream *vss = snd_pcm_substream_chip(substream);
+
+	scoped_guard(spinlock_irqsave, &vss->lock)
+		if (vss->xfer_xrun)
+			return SNDRV_PCM_POS_XRUN;
 
 	return snd_pcm_indirect_playback_pointer(substream,
 		&vss->pcm_indirect,
@@ -461,41 +537,158 @@
 {
 	struct virtio_pcm_substream *vss = snd_pcm_substream_chip(substream);
 
+	scoped_guard(spinlock_irqsave, &vss->lock)
+		if (vss->xfer_xrun)
+			return SNDRV_PCM_POS_XRUN;
+
 	return snd_pcm_indirect_capture_pointer(substream,
 		&vss->pcm_indirect,
 		vss->hw_ptr);
 }
 
+struct virtsnd_pcm_transfer {
+	struct snd_pcm_indirect indirect;
+	int error;
+};
+
 static void virtsnd_pcm_trans_copy(struct snd_pcm_substream *substream,
 				   struct snd_pcm_indirect *rec, size_t bytes)
 {
 	struct virtio_pcm_substream *vss = snd_pcm_substream_chip(substream);
-
-	virtsnd_pcm_msg_send(vss, rec->sw_data, bytes);
+	struct virtsnd_pcm_transfer *transfer =
+		container_of(rec, struct virtsnd_pcm_transfer, indirect);
+
+	if (transfer->error)
+		return;
+
+	transfer->error = virtsnd_pcm_msg_send(vss, rec->sw_data, bytes);
+}
+
+/* Caller holds vss->lock. */
+static void virtsnd_pcm_transfer_failed(struct virtio_pcm_substream *vss)
+{
+	vss->xfer_enabled = false;
+	vss->stopped = true;
+	vss->xfer_xrun = true;
+	vss->substream->runtime->stop_operating = true;
+}
+
+/* The caller holds the PCM lock, also used by DROP and state transitions. */
+static int virtsnd_pcm_ack_state(struct snd_pcm_substream *substream)
+{
+	switch (substream->runtime->state) {
+	case SNDRV_PCM_STATE_XRUN:
+		/* The member is already XRUN; avoid stopping its linked group twice. */
+		return -EBADFD;
+	case SNDRV_PCM_STATE_PREPARED:
+	case SNDRV_PCM_STATE_RUNNING:
+	case SNDRV_PCM_STATE_PAUSED:
+	case SNDRV_PCM_STATE_DRAINING:
+		if (atomic_read(&substream->runtime->buffer_accessing) < 0)
+			return -EBADFD;
+		return 0;
+	default:
+		return -EBADFD;
+	}
 }
 
 static int virtsnd_pcm_pb_ack(struct snd_pcm_substream *substream)
 {
 	struct virtio_pcm_substream *vss = snd_pcm_substream_chip(substream);
 	struct virtio_snd_queue *queue = virtsnd_pcm_queue(vss);
-
-	guard(spinlock_irqsave)(&queue->lock);
-	guard(spinlock)(&vss->lock);
-
-	return snd_pcm_indirect_playback_transfer(substream, &vss->pcm_indirect,
-						  virtsnd_pcm_trans_copy);
+	struct virtsnd_pcm_transfer transfer = {};
+	int rc;
+
+	rc = virtsnd_pcm_ack_state(substream);
+	if (rc)
+		return rc;
+
+	scoped_guard(spinlock_irqsave, &queue->lock) {
+		guard(spinlock)(&vss->lock);
+		if (vss->preparing || !vss->prepared)
+			return -EBADFD;
+		if (vss->stopped)
+			return -EBADFD;
+		if (vss->xfer_xrun) {
+			rc = -EPIPE;
+		} else {
+			transfer.indirect = vss->pcm_indirect;
+			rc = snd_pcm_indirect_playback_transfer(substream,
+							       &transfer.indirect,
+							       virtsnd_pcm_trans_copy);
+			if (!rc)
+				rc = transfer.error;
+		}
+		if (rc)
+			virtsnd_pcm_transfer_failed(vss);
+		else
+			vss->pcm_indirect = transfer.indirect;
+	}
+	if (rc) {
+		dev_err(&vss->snd->vdev->dev,
+			"SID %u: playback ACK transfer failed: %d\n",
+			vss->sid, rc);
+		return -EPIPE;
+	}
+
+	return 0;
 }
 
 static int virtsnd_pcm_cp_ack(struct snd_pcm_substream *substream)
 {
 	struct virtio_pcm_substream *vss = snd_pcm_substream_chip(substream);
 	struct virtio_snd_queue *queue = virtsnd_pcm_queue(vss);
-
-	guard(spinlock_irqsave)(&queue->lock);
-	guard(spinlock)(&vss->lock);
-
-	return snd_pcm_indirect_capture_transfer(substream, &vss->pcm_indirect,
-						 virtsnd_pcm_trans_copy);
+	struct virtsnd_pcm_transfer transfer = {};
+	int rc;
+
+	rc = virtsnd_pcm_ack_state(substream);
+	if (rc)
+		return rc;
+
+	scoped_guard(spinlock_irqsave, &queue->lock) {
+		guard(spinlock)(&vss->lock);
+		if (vss->preparing || !vss->prepared)
+			return -EBADFD;
+		/* Keep only the post-STOP capture tail available during drain. */
+		if (vss->stopped &&
+		    (vss->xfer_xrun ||
+		     substream->runtime->state != SNDRV_PCM_STATE_DRAINING))
+			return -EBADFD;
+		if (vss->xfer_xrun) {
+			rc = -EPIPE;
+		} else {
+			transfer.indirect = vss->pcm_indirect;
+			rc = snd_pcm_indirect_capture_transfer(substream,
+							       &transfer.indirect,
+							       virtsnd_pcm_trans_copy);
+			if (!rc)
+				rc = transfer.error;
+		}
+		if (rc)
+			virtsnd_pcm_transfer_failed(vss);
+		else
+			vss->pcm_indirect = transfer.indirect;
+	}
+	if (rc) {
+		dev_err(&vss->snd->vdev->dev,
+			"SID %u: capture ACK transfer failed: %d\n",
+			vss->sid, rc);
+		return -EPIPE;
+	}
+
+	return 0;
+}
+
+/**
+ * virtsnd_pcm_reset() - Reset PCM pointers.
+ * @substream: Kernel ALSA substream.
+ *
+ * Context: PCM stream lock held.
+ * Return: 0 on success, -errno on failure.
+ */
+static int virtsnd_pcm_reset(struct snd_pcm_substream *substream)
+{
+	return snd_pcm_lib_reset(substream);
 }
 
 /* PCM substream operators map. */
@@ -507,6 +700,8 @@
 		.hw_params = virtsnd_pcm_hw_params,
 		.hw_free = virtsnd_pcm_hw_free,
 		.prepare = virtsnd_pcm_prepare,
+		.prepare_complete = virtsnd_pcm_prepare_complete,
+		.reset = virtsnd_pcm_reset,
 		.trigger = virtsnd_pcm_trigger,
 		.sync_stop = virtsnd_pcm_sync_stop,
 		.pointer = virtsnd_pcm_pb_pointer,
@@ -519,6 +714,8 @@
 		.hw_params = virtsnd_pcm_hw_params,
 		.hw_free = virtsnd_pcm_hw_free,
 		.prepare = virtsnd_pcm_prepare,
+		.prepare_complete = virtsnd_pcm_prepare_complete,
+		.reset = virtsnd_pcm_reset,
 		.trigger = virtsnd_pcm_trigger,
 		.sync_stop = virtsnd_pcm_sync_stop,
 		.pointer = virtsnd_pcm_cp_pointer,
