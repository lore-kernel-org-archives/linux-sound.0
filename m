Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794444453;
	b=n4G2RVFW7OpqZCTt6LstDjarJrkAJfiJatxkjCd8MDvNEg24gOqrXRnEJaqPIiQucY3j
	 qcxJCMVeh+UWUlz4sf2ksAB/6Ny69tCpHgZYL0Ejj8TJ9XzHV6iaRHmYy7Tv0v6Rhi60Y
	 y2Ti8OuwLWFADZZ6iVT204hhBaHl6IMDegQToRwQI1yqF1F3ba6MHYMoHQMi6ye0HYg6P
	 BXCtruTI00yjWacNs1KzGcRyeWQHvtXzqg+KLjyDDwy5uBCvbOdYbEoxB2Pocdemq052g
	 Y4R7W4hr+3KNUX47Gfdal4hBsdSHbOgPDUDKKTO/Xsnnfn7ca0vRgGUb3UTQlzCAw8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794444453;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=+F52bmHA0YPZtsmxGOVRSP0y4qFlAaBYlea7RyACx8E=;
	b=LEO2o6YpXo4wYXiE5mlzdPljYfzGvdCL0uCafhmpCxdMJK9jbnCdeyawCVkjqBO+wykF
	 /nQ+BASLviHRu4Ydck+he4iF/xOo8C7TRfYQqA7O7i35/+amhwvdCU7T+kV93T27IS3QT
	 YTEQQzYtpu/SEIMx7uMgLvKw+PSYmgevXEdda6jfCa5gsVS1+1bea5rBrgCYO+/bwu3Wp
	 NEuOJhD9rve+NAe7khj5xMMfMz6WeHWhKxxP7ff/2+lOYc+34o/1nnLEDrgMfh39nXLid
	 mB5HZMjbwpLMBI2r3ODfz7ZTRnrXnMhiN41Zj3+cwMDf5++5umZbwDSqHUmIhM3RKug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="cU/xp6la";
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 552D460A6F57
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 00:47:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 552D460A6F57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cU/xp6la
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1b3beeaf6f9so1734463c88.0
        for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 16:47:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794444451; x=1795049251; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+F52bmHA0YPZtsmxGOVRSP0y4qFlAaBYlea7RyACx8E=;
        b=cU/xp6lau0RaSv81Xcnx7KfSX//7KDEuhkAK4+B3EptNP0pzw5VOS9efdoz3OrFibY
         0A0jVDiOTGlagFSCXyA+NCKUDeIYjnYAe/Nj2rQo8IUJ9DUiZkyFZ1VXjbirQcV62aMa
         1NZhnVRjduBgAgLcua7GUXIsILRcRdcWhBdP/pBUnQcLFfEmIpgFe23K+KeE4N5copWP
         Nbcd4l79kMJtwyfVNxjwBh5FDXztnCRxoq0LgVsNCB/q4dfNINXOz5w+oBGhNqJhGEpF
         WSP2bOzHjLeHiSny3ZHDFP2IBawg0/ts7tJL2e/FpfycfNBG3EM/aIWcP4Bzv9DfKaTq
         Hl2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794444451; x=1795049251;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+F52bmHA0YPZtsmxGOVRSP0y4qFlAaBYlea7RyACx8E=;
        b=TDiCcJxequFFBMqvJPdjo92heAU/CxBHQrpziquMrAbBTePjlQx0x0P3JjAewcQwGY
         FGZnxH59NlD9cYCoRvU44kCfROTbJ2+hJEumzImn+JgsNZ0rGC/jalVCs0/Avquh3z0T
         fsnw+d2sm64jeEXO6wOGlEEaQsWA6BNks3HVvw1edMAF6gEItwtiOiegfhhXOmB2tRF3
         Lw+zT4ioeQnsR+X+Ii7V6ix+TcgE8aHCpbISoK5TJloWaxPz3paSBGlgjiGMCoeJCj7F
         wVDceR9uDWrbpu9RiWsKTP+1Dkkst3rITeEDNUkXwNSzU5TzLbGFhWQVsulTK4rcbVU6
         E3jA==
X-Gm-Message-State: APuU4Z/WOCnuhrn3hVffLT6iPw42VHRPrt8OTSNGjzDeINSOGbgfsLzz
	js/ZOsCrsrx4+/e9d60X3aomA9s7/KPAz7z0oWsDsPJAWPCHhIz+bDpaEHlhrw==
X-Gm-Gg: AYBFou0c5n6k2G9W0FoYEo6atVJpQetBD2F096UDHpHJUziGVDCjQZf3HopER9rTY6P
	Er583rot6aV9oGW4RooYyZ8b2VMEGbPsy1VuxlzD4e6BqdxzGsGBZCV5/kRchhI71l8oIBYLM5e
	Im9ytwADG7UWL8jRFzPgq14HBs00xI/4AMFW77ajZ/FNBfwFdtXBlqUnRlpN4j8X+XtnnBov+e/
	YNZ1VWCUWUQZNwGkAkrgs+KCvhNbpkvAD4DwTTh/zQdUIqZJWJMjHwdxgroiufkHn8qXTnCSHqX
	N6sJmMENzxOqTP0GD0llF8oj4OlFb7xqsYdbj3osCioHzNEqAtBrx+tg/xVuq4zkCaAur/tNb9h
	m4CNQC/iRdL4z33CglnO3AX+CzRhik2R+NvhJg0A0tpwLWv3r1ioyfgKAC/imVbm+s0/ouTW/v0
	dEF5j3yAV5iJAD7S/gcM+4BtyggphtukRLM6UID+OpLPmFtECoPHw3EUBpdeg7rS1d/Qnmb3xWC
	N5qL+/5eiVLdppur6LKIYsLl5b2pm4sRifnAPvZ7XmYn8ibiAGvJ3h6L4DDo8S7tC2GgpOQ+Zml
	+BRSX6EOKSaGDhjy6a5CX4U8Nsq7WPqvYt89eXvKSHYNrRcuEjHNOMy52Ik17HEEZ99GbS/u6IA
	MPz0ZfSFgNI8un35zmjpSoJv4ckDfOXNa8Vl1eRtjmq5IxBA=
X-Received: by 2002:a05:7022:3b84:b0:147:8a40:cdf3 with SMTP id a92af1059eb24-1b3c031b07bmr3964690c88.24.1794444451218;
        Wed, 11 Nov 2026 16:47:31 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b2eeffsm20672163c88.9.2026.11.11.16.47.28
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 16:47:30 -0800 (PST)
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
Subject: [PATCH v27 06/17] ALSA: virtio: propagate playback send failures through ACK
Date: Thu, 12 Nov 2026 09:46:53 +0900
Message-ID: <20261112004704.49758-7-mynameisjune111@gmail.com>
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
