Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794466199;
	b=WmaIrEGdgGFmULEVcvs8SGuRU39rRVkG0QyjoPO2SzpczcmUlukWcn5zEYmKAe2QtLlD
	 Ms7oKdc5e325vZ0NElceNPKz98jIygTt9W8hXjjYMHrmgHH44WjF2OpsAly8UaxEIqmSU
	 kP3kSwZXG1AawH0BtxmorRBw2qOEtX/yascGkaW05gSV3tqwk1YFait/+XmHAa1yUSk+0
	 shEln2eOPB0U9skHWTY6FCCjaqICA5HidUuI2ASd7bofFcpGTEjrfEfV90ecA7BLVfNuZ
	 u5CnXiXseqawXZtlB+QjGLL5HdcYomQjBzpH9Z57haepO5DeBe7qfl+BDewjkjOnOBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794466199;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=+F52bmHA0YPZtsmxGOVRSP0y4qFlAaBYlea7RyACx8E=;
	b=nFsTBL1sAxC6W+Ubt5vt0K4kDPAiHTzSOHjHymGt20LPG6aT+rrSUv78BR5ZeKro6hB3
	 ox96mdiGqMnrgfOyhJKIz+AmlfdsTFd5jahFI7996ryIaWkhHIShvz92YpiIp8WRMX/3L
	 IDZV8WxpRFC616wjBfh3t2GEBMSllRwdblc64rKPxArjx8fGS1WT1W+TlTvjQ+itijbAq
	 U+9RttugCdD6zNuI5aUZOEcDzTlp+yl201f/IS9k9VRNRrmxoGqd7pK4iy9t8Fzv/4uo/
	 NoRkEZvTH2V/fWAT2KBgBep8bLnu5PsDqqUkTGXAGMeMqw223prVM2JLcTN6C0nIKAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HhrMj1gM;
	arc=none smtp.remote-ip=209.85.210.176
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7282160A2617
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 06:49:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7282160A2617
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HhrMj1gM
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8a4c72951b8so449975b3a.3
        for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 22:49:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794466198; x=1795070998; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+F52bmHA0YPZtsmxGOVRSP0y4qFlAaBYlea7RyACx8E=;
        b=HhrMj1gM1Dx7RyNnsbLEfL1xhogW+Zt5L/2DFDSwxKFGP0Q+cHMcGl4cwFPGxS6Nl2
         MRznm48j6WsfVRz02JYj9kbaJ8aRlkK2AarTH23gf+9y3OMViJO2uapbEg/DM4tdxKZL
         z07ZAsGAyLo+gz6yguJVB5P29K4F/xr1dm2ycG4C9GjenmTTfxhgWVoIAvigJNNnjCV3
         43kccBdXJ5mzAMm5oVtxfQgR3z/wnnPVhw4v0SpbT7qjKyvZnx1/QZhyGJ+FoMeooQq9
         vZ3MKDptp3oEMQkGZERJLTQfR7B5sMzI2eP5XvvqmOk7ZUrxLNQljmV9CUI0SsEhRhsJ
         hUlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794466198; x=1795070998;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+F52bmHA0YPZtsmxGOVRSP0y4qFlAaBYlea7RyACx8E=;
        b=XVmVu43LIXEU9bvujX1fYCyBTEd48lKK08FszKTfXrjl03fw6mrndSOf9FjcXazIOc
         XlD/SG8M76rhLyjZQN1yQi7QyQRVbJRn2+EiHnZlmL7QAzBXDYiQ2dsf+DRSVVrRaZP8
         u0OLM81QAk+5wYVNIdjsoIxRH/Xor6Bzolpa0qGQnGE+7VpOlRy4ykw7DeGEwN6PoNxA
         l9cezvFa87OQT8mT1jJ1fGIgg9Xrs+MzD2EBQapmkPijj3QlSDo4jTSaJ4ChXgZT6dlo
         ldipBiE5MjMJpMgycOIur8uv7tMOfNxFQOu1oAoxEwY9bzU0MHrYNqCbg4xtchUOxbFb
         x8eA==
X-Gm-Message-State: APuU4Z85i39h1wkklOEYSBlY579zrIPxi6LbkfJHuG2qk9VAuN2FsWnz
	enUHMV3207BIl8HrP/2Ghb55bdWqHLhW5jmWIfJutKjpd9awTBY35k7m5y1fvQ==
X-Gm-Gg: AYBFou16pequ9UKNE74/5AjvsbU8fKJzNlKcSNigY8Z6XsoTdP1ITGNSnBMKfi0fgl5
	MeR4nGPZFw9VAElM5nxDg21l5WlqZbN/wMzZ5hnULzzJaMtSMlaSeyiWIWG7KttTwTWi7NzmlT/
	aaBssQEHWuchnsTykxKDt7NKoHloqDYpLYMPwJ/JRMxYdm8zjtEPZFQL6gt1Ri4m0t8QRzu97zJ
	c95FccJZi2wBB0QLoiDnHue09P2+iYPkCoI06A6fWkPNxtqyUTq96ZcSwk5QAJPLPBn7LTfdZFH
	THS3yDvOi9talR4TTRVcxmanQE9EkLUIpA/5BUWAZH+SEezP1ZRsNQAK4nSo72rEFbjMQUz7zhH
	L48ElVuiiG6GW6uYL0WLJja95uB4PerTi1NqVGMmrVFyJQakhXIbRVLBhUJGO7hDd/1Hnph/h2g
	7ZnI/c+vaTJvPu1vIpgWTSlLd9/3XBWiZn03NM4nsDCTzHL/jHKIlftI7x9aQ9eUPkcHAgr8T2L
	SkYzwjy1YTz7DquJ5PYbgS5cuMWeTkv5ckj+SZROnR8pmJbf+HMv425NRZQ96XxwOCk92yEBvqP
	fQm17cBJq+HMNpjjQz5qs+zBaL1zWdWRRGf3zhq2SsTr8JvTPO3PO9mlbRD66qj/Pn0avnrtuUn
	JQZDeGN2OLetXce833zYMqYhpwBCSPnW7pvpq1oxiTIcPjAI=
X-Received: by 2002:a05:6a00:4b0d:b0:89f:3053:9af2 with SMTP id d2e1a72fcca58-8bc1b9f004fmr4813563b3a.12.1794466197865;
        Wed, 11 Nov 2026 22:49:57 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baab1228e2sm3097511b3a.41.2026.11.11.22.49.54
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 22:49:57 -0800 (PST)
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
Subject: [PATCH v31 06/17] ALSA: virtio: propagate playback send failures through ACK
Date: Thu, 12 Nov 2026 15:49:18 +0900
Message-ID: <20261112064929.11211-7-mynameisjune111@gmail.com>
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

Propagate playback submission failures through ACK and commit indirect
accounting only after transport submission succeeds. Keep the PCM state
and buffer-access checks synchronized with playback transfer admission.
The existing capture ACK callback and initial queue reservation behavior
remain together until the request-owned capture conversion in patch 12.
That conversion introduces RX reservation, validation and refill as one
contract.

Fixes: fe981e67568c ("ALSA: virtio: use ack callback")
Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
sound/virtio/virtio_pcm.h     |    6 +
 sound/virtio/virtio_pcm_msg.c |   12 ++
 sound/virtio/virtio_pcm_ops.c |  237 ++++++++++++++++++++++++++++++++++++-----
 3 files changed, 228 insertions(+), 27 deletions(-)

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
@@ -461,41 +537,144 @@
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
+}
+
+static int virtsnd_pcm_pb_ack(struct snd_pcm_substream *substream)
+{
+	struct virtio_pcm_substream *vss = snd_pcm_substream_chip(substream);
+	struct virtio_snd_queue *queue = virtsnd_pcm_queue(vss);
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
+}
+
+static void virtsnd_pcm_legacy_capture_copy(struct snd_pcm_substream *substream,
+				   struct snd_pcm_indirect *rec, size_t bytes)
+{
+	struct virtio_pcm_substream *vss = snd_pcm_substream_chip(substream);
 
 	virtsnd_pcm_msg_send(vss, rec->sw_data, bytes);
 }
 
-static int virtsnd_pcm_pb_ack(struct snd_pcm_substream *substream)
+static int virtsnd_pcm_cp_ack(struct snd_pcm_substream *substream)
 {
 	struct virtio_pcm_substream *vss = snd_pcm_substream_chip(substream);
 	struct virtio_snd_queue *queue = virtsnd_pcm_queue(vss);
-
+	int rc;
+
+	rc = virtsnd_pcm_ack_state(substream);
+	if (rc)
+		return rc;
 	guard(spinlock_irqsave)(&queue->lock);
 	guard(spinlock)(&vss->lock);
-
-	return snd_pcm_indirect_playback_transfer(substream, &vss->pcm_indirect,
-						  virtsnd_pcm_trans_copy);
-}
-
-static int virtsnd_pcm_cp_ack(struct snd_pcm_substream *substream)
-{
-	struct virtio_pcm_substream *vss = snd_pcm_substream_chip(substream);
-	struct virtio_snd_queue *queue = virtsnd_pcm_queue(vss);
-
-	guard(spinlock_irqsave)(&queue->lock);
-	guard(spinlock)(&vss->lock);
+	if (vss->preparing || !vss->prepared)
+		return -EBADFD;
+	if (vss->xfer_xrun)
+		return -EPIPE;
+	if (vss->stopped &&
+	    substream->runtime->state != SNDRV_PCM_STATE_DRAINING)
+		return -EBADFD;
 
 	return snd_pcm_indirect_capture_transfer(substream, &vss->pcm_indirect,
-						 virtsnd_pcm_trans_copy);
+						 virtsnd_pcm_legacy_capture_copy);
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
@@ -507,6 +686,8 @@
 		.hw_params = virtsnd_pcm_hw_params,
 		.hw_free = virtsnd_pcm_hw_free,
 		.prepare = virtsnd_pcm_prepare,
+		.prepare_complete = virtsnd_pcm_prepare_complete,
+		.reset = virtsnd_pcm_reset,
 		.trigger = virtsnd_pcm_trigger,
 		.sync_stop = virtsnd_pcm_sync_stop,
 		.pointer = virtsnd_pcm_pb_pointer,
@@ -519,6 +700,8 @@
 		.hw_params = virtsnd_pcm_hw_params,
 		.hw_free = virtsnd_pcm_hw_free,
 		.prepare = virtsnd_pcm_prepare,
+		.prepare_complete = virtsnd_pcm_prepare_complete,
+		.reset = virtsnd_pcm_reset,
 		.trigger = virtsnd_pcm_trigger,
 		.sync_stop = virtsnd_pcm_sync_stop,
 		.pointer = virtsnd_pcm_cp_pointer,
