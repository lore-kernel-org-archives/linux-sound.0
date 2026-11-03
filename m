Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793664253;
	b=lsSyrPtc4/YpUOuhb5Fz9UMzPbMUHCcK4NLoiCeOITr9GGUeAhyEtSPQ04lEYcMpCClb
	 Cd1Cs4vFYR19mw8Ui+KEed5KqeFDVtg+FeGkuR1Z02PE/OF6ruGyEZdlcMucqOb7K9yil
	 J14XcjSJR0sS8SCfp3eKWaR1/5TsFdHNfh3JVtzCAEv6Kwh58XQ714FwaGVkWqI212xkO
	 BMwng+Kpk3MMKsDUGvmbM20oRcNrLlxKHrBUrvS9zEMPVEf6xZTshytpwFnwe0AATvzlI
	 peYWTrvncAdQPzNVJCjzko9F6sK56PkpZ47Rc0MrpBN9QZ6kTKOR7aav3UyalnAZaCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793664253;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=tOERZEIQ6bWpFjXc/IYsfYbCQo0wq413M2Hd4FsT6W0=;
	b=27ClqqkHazwo3VtNx+ZW63F2Fwxsy1rZcszX8cJlk5vh7N4Qfh1YP1w+bqvkSjlL5+QK
	 C1lryAJGUnJnorhdan/EMjbVy41CY1/gmUzuu1lSGL1D1KtcwZhD74xCmi+95vDlHfUq6
	 NEO+tVB7ZryOkHIq++Pt3hGlM9mASEXPp0mTVAPA6Xiaw7T8rVy2Q8ntJq0x0A+Tv1NU/
	 dQuCs5PX7wDx3qd3mXr3Di2hzdcFwZXwo3rdRdm40B87xXaQ0KtnyP8WN/d9p3s39YB2q
	 VlcoVF41i6oR8yemT1TL2SuilIA8klZCIX+yUFlVIH9XIphQYZbETSjxwMAQF4JL9jQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="hvLtR5j/";
	arc=none smtp.remote-ip=209.85.214.175
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 559DD606A331
	for <linux-sound@vger.kernel.org>; Tue,  3 Nov 2026 00:04:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 559DD606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hvLtR5j/
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2ea7987517aso23857535ad.0
        for <linux-sound@vger.kernel.org>; Mon, 02 Nov 2026 16:04:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793664253; x=1794269053; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tOERZEIQ6bWpFjXc/IYsfYbCQo0wq413M2Hd4FsT6W0=;
        b=hvLtR5j/7+P+cVBrxYbQPwWVmTnGoaaaH9aINayHPktqIof+EX04hpYqRJy51dqN+T
         QrQpMf3cKpJHacFg8dhDIKyiANgeg5udhBosu4w+bOAieR79yj5zIH8jWD85zarMYWz1
         C9GE5xmyLr6xYgnDZ2cvF1gWBvq7bva41e3OfeotqYviN/lmB1mAriuyA2jFDYdmYyWs
         4zBtsh0oE82UU+AtjnC0HnGtPV8UuIgMkin2Ly/Z9+i0YGBcBOqP1whmFMEq9qJgJE+B
         uRr/+/dDZ9pZ0WqKl2XjGYtgc0XAluuDAN12lzqej839D+87XPtNwUUzEZgtwoScoFco
         BQIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793664253; x=1794269053;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tOERZEIQ6bWpFjXc/IYsfYbCQo0wq413M2Hd4FsT6W0=;
        b=CZxBSwbfZWi8hDEc4scPXQfJZukkrG/0eeGUb6CA2OT0vMl06DQnzpSQvgEbKhLEni
         bQG+Kcmvq/VqC9+wsVmDD0DPqZaGCO2AaMSk3NrMXSmOG+qHRVp6hLhTqnA7i2tkQ3Jd
         ue/NQ3iXIfZosTMZkiFJFSFgLHrFhWP8lCvG6GPfLgbcA1DpSgBOnZqoZZJY0jo1ctxY
         nIP1FPAoWRVijjpDEBqW8BJf05EhnyG4W1pLw67qjPC2eDT8z0ypyLCkHxR+NbG8yNw6
         e5Q8oWxumFVl8xGpu4aO8O7uLEbQIq/oGlIiyN3FcdOBR7/nY7SxeVOZsgq8BeeVBp3u
         joyg==
X-Gm-Message-State: APuU4Z8f3cRNQPt2oXAvv4zi6NG20UDL84Ionvgub/0S8aHGKJ2108O0
	6iWhFbejWHDyUPJBsLuxpc4p6WcF5aNLXJjGa9XQQICBF1F114/PoBAHU1YOew==
X-Gm-Gg: AYBFou2svVMEitrcioxWt5vcKCGssZ7HcpM5LPLl/A7U0HXJk+lOUXx7Xk+AccvexRj
	qbXnmcTzfaRc1G9TbSp/ryHoD5AZkdbvph3wuT897vxsq61V3neZiHRJgGeDW8L4wB4Gk3iEYKl
	bT3hRA85cyEoDoe/WBD+X0QLk649S5DNvFHIn8zpNItyUaRbLdRwSxpk8ZBcDjNJ93m8p5xBlOX
	Cqe8po43RQ5MEV1cJ7GyTe8Ws6Fp7iMq4lZCpHngJlmxUEVB44R2nVoieFCjOYDKdQrBDHhJHwM
	73h6s9B/omVNGC2OCUTlnCBpHgPvku9Fak4qacjtLe6lSPsn8jmDia6ogF6LGvz5z/WNF0PT+Zf
	viGHudy+8gNJclPPaf0TpgklFfum5AVq5OxzIb+vEBwxQJZbzUWwYp4dxAvvP67AYOyfqyS+5tW
	BipD3JBgxerqAjFES5rckco9MQACCysMo6JpYW+Gg+9cckUL6V7MwAsZQxfnU9sUEHNrpS19N7r
	CXI4VvKlmCqdKRuMW4pocYTUFUGT+W+NiuW97uk6ot4Jo8rtAZ3EMS7Bg1SyMhGrj60dvPglJeC
	86/wDy7Dtgc0mgctUTEjcklgc9zl7ulO+ITsyfCXbAbIz3QP38BwWD+hEmv7m+iZNkEjtSYt8CP
	UK0dwC+wSVbPGKo8qoGlKQrXHB2fi1X4lNfNl+UtBc3wrdAA=
X-Received: by 2002:a17:90b:1b02:b0:3ac:929d:ba5c with SMTP id 98e67ed59e1d1-3ae89847b50mr8986443a91.45.1793664252625;
        Mon, 02 Nov 2026 16:04:12 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c6b3493sm1339225a91.13.2026.11.02.16.04.09
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 02 Nov 2026 16:04:12 -0800 (PST)
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
Subject: [PATCH v12 01/12] ALSA: virtio: Propagate PCM send failures through ACK
Date: Tue,  3 Nov 2026 09:03:52 +0900
Message-ID: <20261103000403.67106-2-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261103000403.67106-1-mynameisjune111@gmail.com>
References: <20261103000403.67106-1-mynameisjune111@gmail.com>
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
