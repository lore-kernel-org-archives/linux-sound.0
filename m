Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793144627;
	b=PEAO81XMmsJzVXmCg5ZM24JmnbvVI8JBFozO0ZwU6p5HmSGetF+WqrcTBYtEaZO+VqYP
	 ceHQWw++TKRQN3T9KHV2LaKULQSriAq1/TGIJBaBYwrCikeGCV+c7xOEZwxye45FCU68p
	 FVc/jWuUIu/wVcc//OBDSJ8y4EYk5/Q+fhYV2n1al5292GzfRZ1z+tQc36+RG0Ikm9Dqs
	 PRB+xEbSOEGWVnBRoGgh/eh1ojEjjlHfoUaP+SidqYPI/xuB7zUL2EwvEai3yio9YoTVy
	 LS7/9Oj3hS8fQd6UHqHzapqKHclZ3h+AtozxlJTNp3lN6hifgAYJ3VJ6yheBvdOM3YQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793144627;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=GcN94qJJdoXXjjKHz4VCx6KeOGW9pO5t0VvopK/sL4c=;
	b=e/JX55KDOrR8SjyScGIqAVqr5yWXyQOL5GLxajxKz5EBCSA17P80zUAWEkvOdEOsa7MU
	 u7XCrzy1Eq+Gy8dalZADAo1k3XKed3NBxG7Qlpl47qGeWlZlbKG14dAy6nUcmW2/qvxiP
	 4hXi/el75dFae/r5Y7t7q9uDWKz+9PHqjFCRb2Gsc85HXWaWtPBjotIWjtSu921lao24V
	 rqx0LBZhrMNcGI+CA5AvkJJ3b7P43dpzJEZpzT46r2q+2bEGAEWRuFz90gBga2KAuEZpl
	 ZPvEWBw5Sw6BTA/LrwtRCHK79KNECnrDzzLu50+oiOsYQo697PspdS8TqZZmTEKRIaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Lcu5OxZl;
	arc=none smtp.remote-ip=209.85.210.170
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76B5A606A31D
	for <linux-sound@vger.kernel.org>; Tue, 27 Oct 2026 23:43:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76B5A606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Lcu5OxZl
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8a06b27bf9bso223114b3a.2
        for <linux-sound@vger.kernel.org>; Tue, 27 Oct 2026 16:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793144627; x=1793749427; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GcN94qJJdoXXjjKHz4VCx6KeOGW9pO5t0VvopK/sL4c=;
        b=Lcu5OxZlrFfBSFPtKsmtCfiaKPbo7Z+zI05JQIxxcT3smUpxczJJKXLNGJIXdnNtxr
         v1jQ+fUDbFDotK/Gt/ONGr5wCMM2jX1lGHLArgNS/wPJZZOtrV9KeCLPL0B0XoedM7Lx
         LIG5I84qGnLP611NGKUAyh1RfvnwxlMmVJ2V0aHX2tWfeyZ5BmUsrY4hLXGaqKi/57py
         TZ0CiOOkcgdTGhSzLj55ysQZvgs8qrnP6XizD5DxHcwZpvrLtNslRWCia2TpXuWJBV4J
         2REhj3jom/oFedJzixk5OmkWIYzMv8ezDijE+OLFBwJhDj9fNHZnEeM7YOVLKHK3vHIB
         hETg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793144627; x=1793749427;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GcN94qJJdoXXjjKHz4VCx6KeOGW9pO5t0VvopK/sL4c=;
        b=dkY9KEa7LXNADLgx6nSJt47BIfSBr3iAMw7poRIz8nVuJgJfW9LEdeGCNbzcT6jWbB
         yebxsbU8VHANU+S5nIBMR+/XfAY7/+0iN6rUuTy7b5TpE6skJCg++i5HrFcq5RDkwjTg
         GuHK5+9kAjz7cMbo+YwrP+bPZRz2wV8G9QMmitFHkGU/A/YNBQdH3f41XL3byE3Q4Wfh
         kAVrTajfrJVCIdKi1N3JNPaLA7mPSwFTfMDKSnaM4iP8mRuTWWnHIECEbJ7lNErwWl1p
         8tyV8FwdaQNGwWlxFIBMlmsNXzVEO6QIwEo4TedDN+QNqIF/zip12A3McWQG4/WO04vx
         aT+A==
X-Gm-Message-State: AFq9FYJ+4fHcWzuelieGPMK18wQLebrdwpNrrLMEF9cf5iO1DyVj7kBa
	P/oDQBAvTlCn4KcVgthA/DweknaUsIUW0ZIK3pAwz383EDuDPrpiWdccQD5ZXw==
X-Gm-Gg: AYBFou2uRsydY7YL4NaOw/kNTCifIm5A6+qS3U3Sd6x03pjx1L6jqOcaMG/volmrXOC
	e5DvsNyaYN3GycCWHdntfcvCiaht5BBvMriWEydpTN0Gq6jC/7VyIjMyqAm799M/GN/SyF68KXo
	dPj0ZPpKHorZudzqB40GeNN6subO6LTEYqTGXDWJxOBZW/81mRfCDHaX+4ibmBB7GEUhj3OdVhG
	8TXMAzYefQRSUtGu6+r0ev+Xa9qMYY/E0ISqiXWS2y44O4Uk+Jvr6qhWWEIF5ADnXkR/OpsnwUM
	thmux7qinICJNcEZbZVFt9pdtCEwmTusC8oJVRVQGiN48IMkGhWMgRZPcslNLZsp8NFYCsjV2z/
	E9XSSijIg/rc7wNbxNPUeAJOcbCZ0H+SwtD7DNFwkXaIjrO0wRNxWZXn8G7cFpPEgPgrySvWm8B
	QT54Nyrlij7jTI4UdI7tW9XTCeBTGoTJ8xhd+h1EXM1Lw5/xuebJpiVkcaaZxqItZGLvSHgoFC3
	ftoxc5Q9xZhpLeEu9QY9FXvJ2ma6W/G0ZfjZFbub3s8xviHa5R/MVgGQMEE18jGHKCtKNU8cNd/
	W6LqacPvMCqFYlcjkmBm5W7HlED48dQyc8bWebv9vwhCaeIoX3ebYMSEGOGNhcPYMvLq0z1EtGQ
	=
X-Received: by 2002:a05:6a00:92aa:b0:893:4941:4706 with SMTP id d2e1a72fcca58-8a6e7bc7575mr511399b3a.42.1793144626754;
        Tue, 27 Oct 2026 16:43:46 -0700 (PDT)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a6a662b9f5sm542507b3a.21.2026.10.27.16.43.42
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 27 Oct 2026 16:43:45 -0700 (PDT)
From: Joonho Lee <mynameisjune111@gmail.com>
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.de,
	perex@perex.cz,
	anton.yakovlev@opensynergy.com,
	mst@redhat.com,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Joonho Lee <mynameisjune111@gmail.com>
Subject: [PATCH v5 01/11] ALSA: virtio: Propagate PCM send failures through ACK
Date: Wed, 28 Oct 2026 08:43:24 +0900
Message-ID: <20261027234334.32551-2-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261027234334.32551-1-mynameisjune111@gmail.com>
References: <20261027234334.32551-1-mynameisjune111@gmail.com>
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

