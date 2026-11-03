Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793693312;
	b=1UuB+KKRgbJ3765SrMuuI69wPr6nQRIsVGs3A6w1S/gFt8NSJhv8jTNEH4e0u4QvI6r6
	 3g3z9L0oeWr/OACDSBZUpESVsVKOvuQnRiLVm6ofzssk8Tk8jydu1QlwIgY45J/3HUY2+
	 hqUJB0rT6E9gtWetf/Rj9CnBm1nJXWl/qWk+3fHkIp96vFcxD5wrVqVsrQB7pLk2KYLS1
	 7FJsLksW3AvBYOASi9DLMdRn7bkObmZd2xik1EVYEi+JAdShF9NGGNd59mu/fNiSFdaPD
	 dYPCZgpvhD0K/S/svXpKgj+jdZ/Bpkqp4IdmmgzkXmuO8JBGhAFnuTSK4uUDeQuaYBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793693312;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=NjXyF+97NpD7QlpoyoVDNxXHmgR7PkO0NBUnxo8wzt8=;
	b=lcikaZjjrjIVhf6RoKurdj9VnzN317tdYmrpXd/TXafMLnAFkqsIXVGBTrkWtG0iuRxQ
	 isyoYoG8Q0Ysu6Gl8Tou2+LzGVsKlWUqLcL1Ox8V91DARxNP6ty/cG/HJAPTsOCOxhAuV
	 sbg+fO+7WBoICACWrIgg/v7+sVwP548Oiom+45RtG6h8+xbV8LWwLXZXPoeMbN5mfhZO2
	 yDMQTlXrE7BJUny2w1Pracq7Yy9W8P6tE7S57Sc8GsNRfIbxL1k+WRyG5Ew7T1Cefi/rY
	 HGFeSbE9erTwl5ILMaDrpFzrWyhHrXNPhgaN+D21aLniQMg1ToJoTlSGiG3Ca2KwD/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XtNNxwl7;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7A12606A33C
	for <linux-sound@vger.kernel.org>; Tue,  3 Nov 2026 08:08:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7A12606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XtNNxwl7
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-36661f953e4so5954865eec.1
        for <linux-sound@vger.kernel.org>; Tue, 03 Nov 2026 00:08:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793693311; x=1794298111; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NjXyF+97NpD7QlpoyoVDNxXHmgR7PkO0NBUnxo8wzt8=;
        b=XtNNxwl7yDKSQdV8KK6dmDiqZI0aw+fRf9vpzUVclax+52liidVsQ97DCalH2AS2us
         37SfJtaSxPrN+pEjVAn5Y0AAttJaquGVyQtNlvLOkLTH96x9wyzGhbOHtg1795I4CJgo
         SCubOcpnfpgm8MElLIwBN8fHd7ZI/gwz/hSVfPJFqk8MdFzCQmzL8yRWky341m2uqVf3
         alMey82Q3MpMTfp9rhWkyv0Jo2MH7cxT0o9C5R/5rVTqWjeR3AYsMLTgXW8VxiBA3UIL
         tjNWcv1JO5Qpr3c+L4rtOSXrHpF9emVrpCL62PQOHlX4qyQ8gkSh+DKH7Quyc5BIplsL
         UgBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793693311; x=1794298111;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NjXyF+97NpD7QlpoyoVDNxXHmgR7PkO0NBUnxo8wzt8=;
        b=gccKs9M4nwaqxWSWlIvtntn5SdFdiDaP8hHu7nXL4VGBw0z1QUxeliga196Lzzfmgw
         jza4ZQezecaPyGr41/uWamBQDYiiHl6pCrmCRUFrBZ1R8gPwCiYgPxU+6iKKDKswJPOO
         2vaB71bKpkAhJDMnsPllSSYxk1Bq3leW+qjHwFCg+5o2CJR6C8JB4Y+hfSQgEx2iM7Wl
         O4vtMqGKgcz69CmNj48Ts9f+tKpc8y12NT3MV3iONFuAvsYL3fI93WfRiFIk4Efscv1r
         gGZxSOu5RSnm7LxFV7QAD4ZgTvQAQqxHLiV80enbOGqs+UWHbnIe5TwjL3DVXl5iUiCs
         hjLA==
X-Gm-Message-State: APuU4Z8bFauvQfMAGYXuIe7ckvAE+WaGfHeNFx+OXMGx70ahrPL7VrTw
	zjaeLaVCbJSnefKRrgBupXqlDRp3JqtgPgLOnxLbh2OYbnRoWHPCnnpAbhZTwA==
X-Gm-Gg: AYBFou1ehF0//oxapeeuSni6BGLUcZ/O6OC7CKuhUIGzvi+BaHfKSl9aj0Ss2IyuLom
	KIseeDLlXlJGozbneEoK4JYPRY1S3FEnuUjxThekZjgAnmQAlMDdqIzGCb++65ognNOhe/UbcEc
	PvpbPi0IJxsqMqYOo62c5wEwPclnpifXqR0Bil1Ie0UJ4qisU1E42Ml5QdXvf9E7BynKI/0Jna0
	NExLIFXiBUnt5UTGCN9r9Bl+vrorReANoH+DSIu+Ny4Q6q/koNH0MYwt5Da8/zm4r4Eo18beWQV
	VF5G+8BpZXSWAsT6Vj+p9yhSgard6/CK26Gkgwj3xdLivXdPpEcn1XpnSzTjMiWbm/LB3FlQfg5
	x8THTWhO2Fejl69q32tlCYCUxlkfxwtwfq1h9jRCzIggInZ7OcBCRZMA2DfUF7HIaRr+hRkffjr
	J6WmKNug+FtQ4ahKGm9v7giqgBrN5bg58eXh7B8XDgEda8n5b90o+wqos0+n+vu5MBMq0MjqWb6
	rXZYU9vySpsnAmj6g248rIK1hQ/XQOsp5dH5PKWgIKWVkq+Hna8FfhjB7+k6Ny9mb3I9dnF4XUY
	VMg1ERjGQNFYyS6m9HhVHqcpNQYql90w0hQyFbFCcoobaVTOwtdI2DKFz8BOGfUT2lWGBpT8Gs5
	v0rqBKixsYg+qrqdVrKn7ZmQNGVAEqsw1LMnaeXWERDOvpts=
X-Received: by 2002:a05:7301:6189:20b0:358:ec5c:bef1 with SMTP id 5a478bee46e88-36a42425486mr17468088eec.39.1793693310608;
        Tue, 03 Nov 2026 00:08:30 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428fa380sm41468466eec.12.2026.11.03.00.08.27
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 03 Nov 2026 00:08:30 -0800 (PST)
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
Subject: [PATCH v13 01/12] ALSA: virtio: Propagate PCM send failures through ACK
Date: Tue,  3 Nov 2026 17:08:10 +0900
Message-ID: <20261103080821.16983-2-mynameisjune111@gmail.com>
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

virtsnd_pcm_msg_send() can fail while queueing a transfer. Restore the
failed message's length and notify the device about earlier messages
queued by the same call, so they do not remain stranded.

Propagate that failure through the indirect PCM transfer callback instead
of discarding it. Commit the updated indirect state only after successful
submission and stop further transfers when a send fails. Return an XRUN
error to ALSA so the stream can recover.

Keep the polling feature path unchanged.

Fixes: fe981e67568c ("ALSA: virtio: use ack callback")
Reject ACK from invalid PCM states under the stream lock before modifying
private transfer state. A concurrent DROP must keep SETUP and must not
re-arm stop_operating through the ACK error path.

Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
 sound/virtio/virtio_pcm_msg.c |   12 ++++
 sound/virtio/virtio_pcm_ops.c |  116 ++++++++++++++++++++++++++++++++++++-----
 2 files changed, 114 insertions(+), 14 deletions(-)

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
@@ -466,36 +466,124 @@
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
+		transfer.indirect = vss->pcm_indirect;
+		if (vss->stopped) {
+			rc = -EPIPE;
+		} else {
+			rc = snd_pcm_indirect_playback_transfer(substream,
+								&transfer.indirect,
+								virtsnd_pcm_trans_copy);
+		}
+		if (!rc)
+			rc = transfer.error;
+		if (rc)
+			virtsnd_pcm_transfer_failed(vss);
+		else
+			vss->pcm_indirect = transfer.indirect;
+	}
+	if (rc) {
+		dev_err(&vss->snd->vdev->dev,
+			"SID %u: playback ACK transfer failed: %d\n",
+			vss->sid, rc);
+		/* ALSA treats -EPIPE as an XRUN in ACK and pointer paths. */
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
+		transfer.indirect = vss->pcm_indirect;
+		if (vss->stopped) {
+			rc = -EPIPE;
+		} else {
+			rc = snd_pcm_indirect_capture_transfer(substream,
+							       &transfer.indirect,
+							       virtsnd_pcm_trans_copy);
+		}
+		if (!rc)
+			rc = transfer.error;
+		if (rc)
+			virtsnd_pcm_transfer_failed(vss);
+		else
+			vss->pcm_indirect = transfer.indirect;
+	}
+	if (rc) {
+		dev_err(&vss->snd->vdev->dev,
+			"SID %u: capture ACK transfer failed: %d\n",
+			vss->sid, rc);
+		/* ALSA treats -EPIPE as an XRUN in ACK and pointer paths. */
+		return -EPIPE;
+	}
+
+	return 0;
 }
 
 /* PCM substream operators map. */
