Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793263844;
	b=fODNV21TjILF9zIB1Oy1y1dZ0SZC70Yn3b2tE1js1mefpcUhXmmkKXn8h3pyGkkrCcJo
	 Jf0W2/eIP4OlEEJwdqJIEnFpfBXT7tyWPN1wD0a9IOtloN4Oodvh+G92vAbfiZzo0mpOx
	 eiY+uWyF0UxK2Q6v8EV6nZwv5iyzoFpSJo7xY4M+OMs31FfF7JfT2KWoaTyN48N2PHi+H
	 ntZtS115l6vUDjziTQjNPWUnTW02jlqs1Jt64bdbqj+LMUqV7f1F4ThufSqy2zCy/4aWR
	 K5rGBbHztrHhGgkC844lhFJd4lTLV08cdttEs0+TMDSDaEz0gquHCKy71T7bkm2Tv9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793263844;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=tOERZEIQ6bWpFjXc/IYsfYbCQo0wq413M2Hd4FsT6W0=;
	b=iTVBOrcZgTfSK97sMl1mjsUfuLyXRzzpP2B1JuwHx0GRUVb+Z9qYaTQzySf1JzaX9qiG
	 ntm2TVsji5tS+qOSDr01UeJNpgItU84YtUYTDvgWBsCC2MgiwnGZ66Uvw0vafUfGvOBme
	 VjuehEMpxWtsP3RWWK/pRNCNhkukCcBJT62lyBkxY//3v5jeLahYyFNzb5F/le3+6BaYW
	 kECHFZcVBirlH8wQ96Rk7PWLK1JtiTUxZ8prkQ1OC2PxHFEHpzArKUDuvqwCYj2/MzRf1
	 MMM5MWITmQnJRfco9pukD0V2d3JssyzcQILt60h0RQr3aCUnX9PGvMqzAjlbQ9C+Fmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fDf97nYJ;
	arc=none smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CA22606A31D
	for <linux-sound@vger.kernel.org>; Thu, 29 Oct 2026 08:50:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7CA22606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fDf97nYJ
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2ea759cc9b6so7782875ad.3
        for <linux-sound@vger.kernel.org>; Thu, 29 Oct 2026 01:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793263844; x=1793868644; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tOERZEIQ6bWpFjXc/IYsfYbCQo0wq413M2Hd4FsT6W0=;
        b=fDf97nYJsM+l8W2HoLcXALuU3OhZZ18vxeZy1z42+xZqnOIYL0fyGQBj5NDqFGXbiB
         6QWFcojFGjLFzIkN7OdmvGh9/DDP9p9o2QOQGl+dghNsSQktLyaLLH0qlay2joz6hJel
         2VfyTRFE/HZnMdl7U+1HImD1aSRx1cGC3HfnuEHQapnoobNKE4g8H1pqiC5BJGoXV/pl
         cf5pxSXolNtJHH/ssCZM6Xc48LDb7kTrguYzejX0HTNopLl0Wgc0UHVy8sejosA2BFYQ
         JfkebsdgB++1judA+8jqXpiyeYl2XNLoKuBvgLXt4x0Gnz5qA70u1+a81aW/g9+qtMsu
         kTTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793263844; x=1793868644;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tOERZEIQ6bWpFjXc/IYsfYbCQo0wq413M2Hd4FsT6W0=;
        b=xk012R744D+DOZqOOszdFG4RqvjPt42YkUNtnRZLimIhomLZCH4ujgUUKKIDqu8af6
         m/dkXt7pOfA4KlRHvzpZNkfgLiLx9cMC2P43OaKeUunIOR+mVvXtSZjntAMbfOY0yTai
         G0uOUEeZOkbnTpsGFu2b5uEVF9wIWjVwzKVMk+G/l6RSZEOkwtPzCX+SzXwp1CPoH3ro
         OCKwd4sBV7tG6tRLG2ddr1Z4WuEo/IVi7SZLJ6ghQfxCY5LrPZdltlPvwFs4OlhOTf36
         vr9cSpxwkIwE6QMlQ8vVMeajLQ9tQmiu2qta3cF6fgVBB6KibAL0iTVcYPJ9axbr+RPy
         xSDA==
X-Gm-Message-State: AFq9FYJf+1CqRzWA59Q6xQnsVt2kqXZBb+Nb+BfOUbmMmhVWh1zfmEO6
	vNun/JTgbstEsIKkHzGEY91UGV9bP+v5BHlk8irY3g+Mwvcipw0/0ue/u0HjMA==
X-Gm-Gg: AYBFou2Mlfu7e/VBC/y08fX8wIlJLWgpEIqN192PNDIhfYdANwQs9HTcsYD42ycx/XX
	dKXDCOhiURNIprbKpA/DhoaG0eSUUBKaDLMcmrhsIvr1+1Mtj/x75UDGaRzxehkz1g5JoIXSdOK
	OQtB9DDYLKq5ql1qV4/pEV7gM5iTOySmFETyYK/xJoMNpzIxOKod9gtrHH8H3yDswZ543imcAeH
	wQrzWivuMsRbgrlGgUdxZMhpoCBWqWN4xxtMva0htc2v3Ycndg2j3LXIM0GfOlXm3gvU8VpaJb8
	TZB9LMxkeeAcepMT+gkVLlnNwve9xZe2XcrG9Wm731fVLEg9h7d29j+StqIe0JQWf4qQ0FS1P8P
	51/ZVb4cB12VZy1UqBVFOvapAvBLrsjfuq8iq1tQKWTmJ818DjMQUSnzI+3vRdygT3HixQ2QpBV
	/6ip89DyOt9aCC+Y6VLywCJeT7lawrJSfFXx3anruQWwvt6ByZ2H5qq1scvmBHFp4xdXUSa1nYZ
	lYah4/jnAN5VwswaAslMtqS96F8SmRqwK8/n3nQTctWDxLjmT7bKgWo/g74ma71T0NJ3K3fKf3g
	OjyqXfRK8BR3VkshYGKtIa3DWGYgWddPodERUueXLjIQbLVnCbLGgrk8kcRdaGlBrJuSZH6cpOc
	40f4DjmnRFvHXCQsQBCmzoth6+Kd2/kUk+IDWCv772aYztjgW57lZGvZPk934t44=
X-Received: by 2002:a17:902:cf4c:b0:2e5:467a:7a6b with SMTP id d9443c01a7336-2eb004f2a79mr44003435ad.10.1793263843827;
        Thu, 29 Oct 2026 01:50:43 -0700 (PDT)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6bddae0sm29991205ad.35.2026.10.29.01.50.38
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 29 Oct 2026 01:50:42 -0700 (PDT)
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
Subject: [PATCH v9 01/14] ALSA: virtio: Propagate PCM send failures through ACK
Date: Thu, 29 Oct 2026 17:50:19 +0900
Message-ID: <20261029085032.70689-2-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261029085032.70689-1-mynameisjune111@gmail.com>
References: <20261029085032.70689-1-mynameisjune111@gmail.com>
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
Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
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
@@ -466,36 +466,100 @@
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
