Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 784053B3BE9
	for <linux-sound@vger.kernel.org>; Tue, 13 Oct 2026 08:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791881882; cv=none; b=Y8f4+y1rvFeqnrkZN9ASrnPiWZ4TQYFE/DvekdOjDc8ofppDYAScTSElC5ThvrKbXQbhTd8s4RXgYwnYlQETC0y1/etlHQOYl3l08/FQgs/x4UEU0IOc84+INXBIv1uC/xVGcJnUCcfn87+MYs0cIwanMywEdhBtRIZiYNZ5STw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791881882; c=relaxed/simple;
	bh=opQnPFPZQ6VQRgXi04A6G5jYc/ZSjw+034MhtLu7seA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lAFx/zyD9FX5iP7mCSpN/hKSLBRQJ/JtjCWY16gzfFhZmr34TIsDh3+Bv3ZCmIgIiJCqjJSmdBgZyNAl5GNQvU7P804yX8sNW361pPLf599T1DLw1RwNDZwUD46+UuxjIgjdqJ/B0NGpmgF7iAMtcHIEg7vfYosn2D/KvHeLkSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EaARdBEI; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EaARdBEI"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cc1c9879395so843068a12.1
        for <linux-sound@vger.kernel.org>; Tue, 13 Oct 2026 01:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791881880; x=1792486680; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GcN94qJJdoXXjjKHz4VCx6KeOGW9pO5t0VvopK/sL4c=;
        b=EaARdBEIEu7PR7eoRNDWgFjvg9gXeRXjJWozGLQHseV76yS6v+d1i2A20DdxvE3sYJ
         vrMEZWBnrGjsfni65kl0zXqGqbS00sDlTBUbdclsDb9HlzdJdq2n9Q4MwuRv78dxKfXJ
         kxsIsyyWUTN/XIC+k9BkRiQR3OZl9GnoCBMPSOBOc+9T2yK5b4Aqn9Cl0GWugW52ctai
         bUjvyMfweamzHVu0tZVRiCK0NDl9grTYzJrzTe/n1zNL8C5BIHe1MEFA0QTLIo7F2uL3
         vmt4Zu9/QyuYogBGiQ8G4WEj2/nMqHpIacgrabqArL/faOirCl6QKeI3m2IwPZ74/K9r
         IAXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791881880; x=1792486680;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GcN94qJJdoXXjjKHz4VCx6KeOGW9pO5t0VvopK/sL4c=;
        b=a7yCUQKGp4yDTwDklF5UQRYwkggbO1cKKnG6EG4mmG3bUrl73ixJDV7Ozz+uVp4YBj
         RRn+gzs7+tHB+5NiOjHnEP0EclEMar2k7p8I6Jp20RFAa6qf35/cB46/reqREZ/9sRCG
         K2o+9ntojnyVvdW40rxSvZnKh3zvqbhwOhTHRB3WF6dgaf8RVV/gpACtFxWmx8VicToR
         wWaIfEK1u1iK+k4zMsZA26NIwyQ8JlSp6I2WEhDZloRUCCuaQgAe03LsmwP2mZ2AUIxE
         fB6aWizEuD/O4+3c58i5VT40xqaUTPhMyRWJg6rBtWql5enN5REH+1pX8uvn2e2lT5oP
         Gubg==
X-Forwarded-Encrypted: i=1; AKwUvBzNQZtfZYd53d0LdMt5eWhRbowu9467b/dpS3fJo3FTuLtX3eWjZ+zCKJHpixlU7Oof9hIQqLe1KhIXzQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYJOvgi2wWwt0q9hoqJY6B0gyNcFDyzRJAyBwHf3o6weQ+mVVxSg
	XfgZVky7BADIS4m6vMEqnbdcSTFGO5/6owb3lxf5w6RiPQI1QWm3EGiMx/qasg==
X-Gm-Gg: AYBFou3SnT0oUfDrBEXb0GGKaIkOTJrf6S+MCBUj8E58WliafoaEzkWo9BnXBfskveI
	IV2vKDxg2nNXsfbZ6cmEBdx1c7cfCqtgRMRgRXWsgYZ8i2Bu4/jLYQTjNnhKYGfzoihs96WGbY+
	/Q/A8OdH2kh9tf7yTRlF/8pvPTU5T9cNzhOKEucMELGwSZxFFsbbrb9PBe4wb2JL2y4SxXewfxC
	0YyXBfXtNKWT7bnbVKkR3A7Rk7BpErHdfeClR6c1yBdIOCwmtBkfnKdjDeZ1BWm6dKoaDyIJJJ+
	RYZ8qaGmKEHZNATeoMK4VhY71uDqKUogPpQ7cvDAOTyh+E+ySqes9FAkblqykjgMgWHP/Y3al4U
	m4oVkb7Oc1B8FIFYFOKfTc8qaDxW95Yda7dzguWoJNCT/hycM2LlS/S6J8khtA2dYxEyNE6WzAk
	TIlURcfnYc6uD1XaQDMaLw1H92g7OypEauGCFMMi0O6wyuMhdTFT06SWeU63yXF/wRpcnBSOVMm
	Yt6sLquTvk/NQIFaVn/Pbzw6b4TnZBxiWA6SRlmFJ6RKpSGDUhLtg/nNNdgBZWGXcVsh/HGp+Tz
	GgeF5wzyTGWLnJEl
X-Received: by 2002:a17:90b:4fcd:b0:3a1:8b70:d46b with SMTP id 98e67ed59e1d1-3ab3ad2b1damr9231104a91.42.1791881879490;
        Tue, 13 Oct 2026 01:57:59 -0700 (PDT)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd6063d31dcsm1838592a12.3.2026.10.13.01.57.57
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 13 Oct 2026 01:57:59 -0700 (PDT)
From: Joonho Lee <mynameisjune111@gmail.com>
To: Takashi Iwai <tiwai@suse.com>
Cc: "Michael S . Tsirkin" <mst@redhat.com>,
	Jaroslav Kysela <perex@perex.cz>,
	virtualization@lists.linux.dev,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Matias Ezequiel Vara Larsen <mvaralar@redhat.com>,
	Eugenio Perez <eperezma@redhat.com>
Subject: [PATCH v3 1/5] ALSA: virtio: Propagate PCM send failures through ACK
Date: Tue, 13 Oct 2026 17:57:48 +0900
Message-ID: <0a3846bb4f8742287f9c2024aec22faf0c35defa.1791881787.git.mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1791881787.git.mynameisjune111@gmail.com>
References: <cover.1791881787.git.mynameisjune111@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
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
Changes in v3:
- No code or commit-message changes from v2.

 sound/virtio/virtio_pcm_msg.c | 12 +++++
 sound/virtio/virtio_pcm_ops.c | 82 +++++++++++++++++++++++++++++++----
 2 files changed, 85 insertions(+), 9 deletions(-)

diff --git a/sound/virtio/virtio_pcm_msg.c b/sound/virtio/virtio_pcm_msg.c
index 72103f606716..5371f4985fd0 100644
--- a/sound/virtio/virtio_pcm_msg.c
+++ b/sound/virtio/virtio_pcm_msg.c
@@ -260,6 +260,18 @@ int virtsnd_pcm_msg_send(struct virtio_pcm_substream *vss, unsigned long offset,
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
index 1091100a4c98..a40ea394bf17 100644
--- a/sound/virtio/virtio_pcm_ops.c
+++ b/sound/virtio/virtio_pcm_ops.c
@@ -466,36 +466,100 @@ virtsnd_pcm_cp_pointer(struct snd_pcm_substream *substream)
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
 
-	virtsnd_pcm_msg_send(vss, rec->sw_data, bytes);
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
+	struct virtsnd_pcm_transfer transfer = {};
+	int rc;
 
-	guard(spinlock_irqsave)(&queue->lock);
-	guard(spinlock)(&vss->lock);
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
 
-	return snd_pcm_indirect_playback_transfer(substream, &vss->pcm_indirect,
-						  virtsnd_pcm_trans_copy);
+	return 0;
 }
 
 static int virtsnd_pcm_cp_ack(struct snd_pcm_substream *substream)
 {
 	struct virtio_pcm_substream *vss = snd_pcm_substream_chip(substream);
 	struct virtio_snd_queue *queue = virtsnd_pcm_queue(vss);
+	struct virtsnd_pcm_transfer transfer = {};
+	int rc;
 
-	guard(spinlock_irqsave)(&queue->lock);
-	guard(spinlock)(&vss->lock);
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
 
-	return snd_pcm_indirect_capture_transfer(substream, &vss->pcm_indirect,
-						 virtsnd_pcm_trans_copy);
+	return 0;
 }
 
 /* PCM substream operators map. */
-- 
2.54.0 (Apple Git-157)

