Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794182128;
	b=hYLWwDX3yQUqbnlrchMXLA//1IwqkZbceJXGWVgIBkbuvCVkqhTGxHFDktTPKnf683Ob
	 N4r2jnU9gj5xDMce/bD6To9AQceNhoMN4xPWlGbGeklo7udNjKTY5XMAFQeGISoB15z1k
	 LTSGLzK2bnQYCC4kL0Z2JOZHNM1dK0d4ARzEP8lzSxtnEbDJBUDvPAFIjoRRupcpdsqTY
	 hNuRM7Qk4Jje9N4P5zkyL3IeJHAUB7SaorNw44Rii5hVwpEOY1K0BAMjiAPukP9E+2BvF
	 ovo3jbZTZB7Le4dV2toQEa6O+rC0GLyS+2tt2QcDiQP+biQ4gZKOpUF8IUxof2HRMnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794182128;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=RBzTR6XekcqDka7VZzelkfmXzQMAZ+MkrgZWgbkdMfs=;
	b=Lu22Okgnn1HVPuWttYgj5x1Ezhac1XbFqpouDTWLxkq7vxaFB2T/FQ9frfEVqhOprloR
	 7LZoCBzSlBf9dx0CDNrHeUJlynXckwIljIn19zvtnUW8X4+NzvaMtZqMv2XFHZhYfr2e9
	 U41yLvN8z4751VTqriGB6skZUPVj0FzKsX/90tswtlAzieGGaS9D+atsjDbRbs0hYSRMc
	 gf/CpgjVkRVvLBpxNAcIEnLU2ChmBl4pVD6zwnTjNAXYteXSQkBgOQ0Gl6fYQTYw+zd5n
	 ga4DWZInZM5v4rmE1x5wNr10GkG5nRChD7ZvQJDUHlMwuu9+8RAm27jePUQifBiawvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NvZLeKsD;
	arc=none smtp.remote-ip=209.85.214.171
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8F93606A320
	for <linux-sound@vger.kernel.org>; Sun,  8 Nov 2026 23:55:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8F93606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NvZLeKsD
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2eb0f1b592bso975675ad.1
        for <linux-sound@vger.kernel.org>; Sun, 08 Nov 2026 15:55:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794182126; x=1794786926; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RBzTR6XekcqDka7VZzelkfmXzQMAZ+MkrgZWgbkdMfs=;
        b=NvZLeKsD0ZkeH6Cmq82UIe9atimFTX9Q54EOPBGhXdX49OZE5BGUMoN7UO9/hD9hmy
         Fsika3wCWasUWEXLWXRAvejbYYCXxeVb678ocHdU+fCezePheNhikqVS6z9IuixtDH6o
         sbc138yzCGLriAfwDEY8oABZNlbJdmdyUfxq1QGtCQllschzu20txxOj+8RlsrIba8YK
         Df8k49LEgBIg8t8L7pUvhrn2qPtjxkVL4j1DK/jHjFHGmIWSovewwLQ2dsUVhl26roKD
         O2vPjvnun8csEgfpe7Az79HKo+DLuKa4V5n8Broepf68EDuFp11wuMSSpLMlZmSYEqsC
         9bKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794182126; x=1794786926;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RBzTR6XekcqDka7VZzelkfmXzQMAZ+MkrgZWgbkdMfs=;
        b=gkfTIyeN1+rr2psllvFJeDUmqSfV94fwLVxGKxq51Ih3DVQIzfL16m47XS9aOnU7ob
         OhpKXzNYxD3FK0403yzdTcIy/pSdN2ySgDajIMgZu/EbVmYpX+4XJCIc943aSTpe0N6v
         enwsjSuZqRMU3ALeF5iJWd/eUjEhG3Rrc1FfywJXYhE5GlKKH8LcbiVw7snosg0T90Gv
         meFSOkvryLQ7KI7PamV8d97aW4jOihCcXRHLIRlEIKNqGHhGOo86mWhHO9IgoBGeZySW
         fwXjWaiN2MdUqSC97bwc5myCtKns3kIYD++CAdRwBavZnpvCnUDZkpkhAmdvX8KVmacJ
         3zcg==
X-Gm-Message-State: APuU4Z8olqpl976nSKTEgfAjsBqtVvWX7E1cpGZLLDsjDMNFRwmRVQSn
	WGZBTNBsZnePEv86Akk1Ynd6ZYrT3uh+qCdlGn87eDm3BAyQzuDj+m70wyZKWw==
X-Gm-Gg: AYBFou09tFLmO7nAQ/kC53eH9Zb6vdHDes5KSPZFprTnqqkVZVE5/8CNmdv7J1U55bc
	YRl2J7LF55Ute5ucga9kVZghylWwdFXKN6KjCHhkGIyMcqk65wX8xDqPhseGB69OgXQwaeuuMp5
	nzbwP1d3eh+CUZ0hN8VPDxXHGggYyctVZ9vy2jP0PN9vWzn16/lbjh9idcLaUwjj46hJgbEagri
	rztvtJgoyymwO1Opl8Nb1KhSOa2FtuMSA9KaeR69HeD7kZ+PJsPGHPJcPS+uSctzT06fVFz5QmH
	ZHtlGkw8SExlSCM1HHpW0oFaLcLUrNc45GEPj0riMi81Cxs4ZsuCkpcIwxyZOwzDrhQdIy1hPh5
	pP4BsisMj0QaeVTq45rqd15A6lUFeAruGdjr49jeyZflftOGtJmfd/7YRLn5BRMAgH63dnR2Ohm
	P7p5av2BUx1Gsi7KH5MusREU250jpuXWEmt5wGKo0DHXmz8jBXzYUDuL3o9pHV4Lids2zlxbHiQ
	564dpMwsleC+4gxy7Ao2k1HMM9XFc+Bhfa5ID/sIPUibGdE2k9Vgx3YGf2PlXODZALr3rVChlWQ
	Oc1j+hoY3pNM645fzXSZs88EvyVOL2+e8Pv7GJgwlDLBuDHeKic10O75bwC9mGNhMqF3QJ53CzK
	ocvuFyWC6WJPmDL4srAeIfkvasDnrrLz8vmjFzI2blJymRI4=
X-Received: by 2002:a17:902:e80a:b0:2e9:a090:dd69 with SMTP id d9443c01a7336-2ed83777169mr24463705ad.39.1794182126233;
        Sun, 08 Nov 2026 15:55:26 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed81722edesm6095215ad.55.2026.11.08.15.55.20
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 08 Nov 2026 15:55:24 -0800 (PST)
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
Subject: [PATCH v21 04/12] ALSA: virtio: Propagate PCM send failures through ACK
Date: Mon,  9 Nov 2026 08:54:49 +0900
Message-ID: <20261108235457.12688-5-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261108235457.12688-1-mynameisjune111@gmail.com>
References: <20261108235457.12688-1-mynameisjune111@gmail.com>
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

virtsnd_pcm_msg_send() can fail while queueing a transfer. Restore the
failed message's length and notify the device about earlier messages
queued by the same call, so they do not remain stranded.

Propagate errors through the indirect transfer callback and commit its
private cursor only after successful submission. Genuine transfer errors
arm stop_operating and return -EPIPE so ALSA can retire the stream.

Close ACK admission under the PCM stream lock before sleeping teardown.
Keep the prepared state protected by the substream lock and reject ACK
through prepare and parameter changes. Reopen admission in the reset
callback while the core holds the PCM lock for its pointer rebase. An
ACK racing with teardown returns -EBADFD and preserves stop state.

Keep the polling feature path unchanged.

Fixes: fe981e67568c ("ALSA: virtio: use ack callback")

Reject a stopped playback ACK before the XRUN path can rearm
stop_operating. For capture, allow the ordinary stopped tail only during
DRAINING and only while no transfer XRUN is latched.

Latch a transfer failure before stopping PCM work. Once core reports the member XRUN, ACK returns -EBADFD to avoid another linked XRUN. ACK during prepare remains rejected until the core state reaches PREPARED.
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
sound/virtio/virtio_pcm.h     |    6 +
 sound/virtio/virtio_pcm_msg.c |   12 ++
 sound/virtio/virtio_pcm_ops.c |  250 +++++++++++++++++++++++++++++++++++++----
 3 files changed, 242 insertions(+), 26 deletions(-)

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
@@ -311,7 +347,26 @@
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
+	int rc;
+
+	virtsnd_pcm_close_ack(substream, true);
+	rc = virtsnd_pcm_prepare_device(substream);
+	if (rc)
+		virtsnd_pcm_close_ack(substream, false);
+	return rc;
 }
 
 /**
@@ -338,6 +393,8 @@
 
 		scoped_guard(spinlock_irqsave, &queue->lock) {
 			guard(spinlock)(&vss->lock);
+			if (vss->preparing || !vss->prepared)
+				return -EBADFD;
 			if (vss->direction == SNDRV_PCM_STREAM_CAPTURE)
 				rc = virtsnd_pcm_msg_send(vss, 0, vss->buffer_bytes);
 			if (rc)
@@ -356,10 +413,12 @@
 
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
@@ -393,11 +452,16 @@
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
@@ -425,7 +489,8 @@
 		return !rc ? -ETIMEDOUT : rc;
 	}
 
-	vss->stopped = false;
+	scoped_guard(spinlock_irqsave, &vss->lock)
+		vss->stopped = false;
 
 	return 0;
 }
@@ -442,6 +507,10 @@
 virtsnd_pcm_pb_pointer(struct snd_pcm_substream *substream)
 {
 	struct virtio_pcm_substream *vss = snd_pcm_substream_chip(substream);
+
+	scoped_guard(spinlock_irqsave, &vss->lock)
+		if (vss->xfer_xrun)
+			return SNDRV_PCM_POS_XRUN;
 
 	return snd_pcm_indirect_playback_pointer(substream,
 		&vss->pcm_indirect,
@@ -461,41 +530,168 @@
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
+		return -EPIPE;
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
+ * virtsnd_pcm_reset() - Reset PCM pointers and complete prepare admission.
+ * @substream: Kernel ALSA substream.
+ *
+ * Context: PCM stream lock held.
+ * Return: 0 on success, -errno on failure.
+ */
+static int virtsnd_pcm_reset(struct snd_pcm_substream *substream)
+{
+	struct virtio_pcm_substream *vss = snd_pcm_substream_chip(substream);
+	int rc;
+
+	rc = snd_pcm_lib_reset(substream);
+	scoped_guard(spinlock_irqsave, &vss->lock) {
+		if (vss->preparing) {
+			vss->prepared = !rc;
+			vss->preparing = false;
+		}
+	}
+
+	return rc;
 }
 
 /* PCM substream operators map. */
@@ -507,6 +703,7 @@
 		.hw_params = virtsnd_pcm_hw_params,
 		.hw_free = virtsnd_pcm_hw_free,
 		.prepare = virtsnd_pcm_prepare,
+		.reset = virtsnd_pcm_reset,
 		.trigger = virtsnd_pcm_trigger,
 		.sync_stop = virtsnd_pcm_sync_stop,
 		.pointer = virtsnd_pcm_pb_pointer,
@@ -519,6 +716,7 @@
 		.hw_params = virtsnd_pcm_hw_params,
 		.hw_free = virtsnd_pcm_hw_free,
 		.prepare = virtsnd_pcm_prepare,
+		.reset = virtsnd_pcm_reset,
 		.trigger = virtsnd_pcm_trigger,
 		.sync_stop = virtsnd_pcm_sync_stop,
 		.pointer = virtsnd_pcm_cp_pointer,
