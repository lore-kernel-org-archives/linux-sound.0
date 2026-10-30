Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793338000;
	b=p7clDC7m3ZmJcM1O+kyAp1YBvrhu2A96WjMEg232vltoJ6VVh/5sDteHRZYN8/il3NO1
	 9WhyUT5EV9N5ByWoJs3OBX4Ieo87fgvswdelkMNpFoxtJRlx3pybT0ufrx1HGbxtspyng
	 Ne0uiR2bTw06CgPOqoWAwxD03IB71adhICQxvyolyACRSb2k12lTBdFYbNFKhZdI8B0ar
	 j/B+6G4RoW/cL1K7QW23W+BMRWrkvyw7g/k/HBisu1peMh/cor42lztT04ZyRRirrt3hv
	 JXGte0cfwEGBIIoHBgwLrhTaD/M3mvIrkCzoBBybMfcw0f7GZ7nXU+kBP1gSEcTnXOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793338000;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=tOERZEIQ6bWpFjXc/IYsfYbCQo0wq413M2Hd4FsT6W0=;
	b=yQPwPqQ0xU1/WOcoBM0rw/QFy/ymkGI3JjPyvV2pI/b/BYmEP4QE4f0yvNcSoaRrVSeb
	 sduYc5r7ItF6U/QRDHh2O0BIXQvr/fQB2HVDaMSnZ1U8zfFm8Lwtif21yClFb9EKKy+Np
	 Pc9+uiM0mrQpiPI4y0HvSfWjhcIzfY5zY/nQoEjtu8/aHlkZMhJvfGARiBgVuElEQwoPG
	 PhSYtpvmx8N7UPOlZ0LScBmRx1QJ4LWt+8tiyLH7A1G5Un+99APP8H1u84BHkRtWHYCar
	 BxAhpYrxE/s1AqxtWF0dHhkZc/33g+NVi1BOZNWK6BQN/2z4yEo9lXlzyR871lnnTfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KX5QEHG1;
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA16C606A31E
	for <linux-sound@vger.kernel.org>; Fri, 30 Oct 2026 05:26:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA16C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KX5QEHG1
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3ae57dc1ea9so144515a91.2
        for <linux-sound@vger.kernel.org>; Thu, 29 Oct 2026 22:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793337999; x=1793942799; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tOERZEIQ6bWpFjXc/IYsfYbCQo0wq413M2Hd4FsT6W0=;
        b=KX5QEHG1Dp7kPb9yx6aJaUcw4AhAv6i81M1bW9IA44xDcJiH2eIq+jqdtL2CSKqIOL
         N2Tegl6j+6yb3agLimvdwV6wC+VmNzELBJOmzi9ilOLpZby9Zk5yATBRD9hnItpzdl75
         98uSHo3buGPuXJ0FEqTLeRMNaeJYlwKuoWpQRFmwuZ+EYh//a70pO4jOQYZ4c7BRPXo3
         qjdfjvxQHJjZz2PbfKQ7edMA9bSjhcceFkvpBXEzVxw8hxxg1KDtzTSGF28DjiuAhcD/
         hPP+YVvRarWMJeGqTy2BpC9muFqE6vXNP/XjQ0hUDl3l8T2a2gW1y7SV4eGl4WkNzkDx
         ZqEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793337999; x=1793942799;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tOERZEIQ6bWpFjXc/IYsfYbCQo0wq413M2Hd4FsT6W0=;
        b=YnVcF2YfbVjUrQBG17Tto8oOevWRuHxJSITgEH33M6PfUrb7DpuN/ySb27Av7ZTOJQ
         SEDQvYMsZpHQm0NLgM0h3pspuicK/BYsQJAkDnnnj92GxydU0EJxaMUlpiu88GUuvWtm
         KufLHYTyZl8/U+stugtmpkC3Qnm/D8vAJn5VL18VAfuKHNclViTU3lyuU3CcaxKsJ1OX
         RLCPGq6dZlAoQGMxemJhH0g+pU8rAxfPMRtnZnzzNE1tyw/yS/G2ODgRZH7OMDhi/M2v
         lo69Fnv3lXrIrhP6qwoNwH38nMiuC99dH24zN92o864QR5WLIL9oFft2d1aDmU5XKT5s
         IEnA==
X-Gm-Message-State: AFq9FYJ9aPKkMBEA6hNrfzj8kCPdg9CjA/WtXX6BY6QrbB3g8ppo5ViW
	/ynFqP0AmtE2h0nVabfK+Fw6GFJUrMWqluksC2mEd8Z59s1JeiYdd5QuCMfBAg==
X-Gm-Gg: AYBFou0Jssx/f8VgmRCkhQgd3rNx8fGBIY/WrOSWOwQM1fEt3qkwsvFdsKhgUkcnBW2
	XSt4SxrvtmOXT1dI1L4K8u4mMDC6r4IVtflEFFp5VsNofYfHft26o74yjEzbcbmGBdTgdTSRvbn
	9IZI04Y+lZT4n+n6pPOfeoElDe+Mti09rEXxLWXDpmZODPFDeJFP/px2UbvDqEQBddwZfoeK+Wj
	GhAbuQ1kC/Txgs/V5TGbz2wYkpJlJ7Ui2/ucdNCLP/l7NHfjhwjwKQciUMC03Lmu/BRlSrB//be
	Cjj0XnZ0h9A0kxTlbnSS/ECrvaLO9miz2bWZeInQOv+ydYkcWoE7xAqZuEWnDGd0m4sT/eZqinc
	mfwh4dxM/FHwW2OvdsRybc8Tt3xTJ8+pC993OXKxDVAyalNwQ/t2wXE7pzNleQSCEjAhP4Vxrjx
	2ShwpCXjt7FDsiF1gWw8hU3lY7uTKEUJLVoDkTYcJ5jJihLN7J/bU2wTuxvCYNYXnwVMSpEr/Tq
	hjvmG4TqpSx+5sqwVzCkkgIpu/FNs9mAOB2a5sPhAPddGRXDtcOCzfhbLpN5ThME4BoMQ2H6ss8
	q7PB0NJdkmsnM4NtQ/JOnntLkJUELcccjraKGDWf6IiQF+YUEWTJv1DWAqz4NoyGixjW0dvCLZA
	tTf0zw1Av5R/zY+QZr01HfBEWJgZ96ATSvFExQE9rCqxeISI=
X-Received: by 2002:a17:90b:1a88:b0:3ae:3f20:7056 with SMTP id 98e67ed59e1d1-3ae89746c9cmr1077089a91.31.1793337999008;
        Thu, 29 Oct 2026 22:26:39 -0700 (PDT)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae845429e6sm2421027a91.6.2026.10.29.22.26.35
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 29 Oct 2026 22:26:38 -0700 (PDT)
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
Subject: [PATCH v10 01/14] ALSA: virtio: Propagate PCM send failures through ACK
Date: Fri, 30 Oct 2026 14:26:16 +0900
Message-ID: <20261030052629.27742-2-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261030052629.27742-1-mynameisjune111@gmail.com>
References: <20261030052629.27742-1-mynameisjune111@gmail.com>
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
