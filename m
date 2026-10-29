Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793252646;
	b=DRPSASqXp5PF3df+dBv9ZFzzJDG45flFkwriO6DSS60GgvR6l8JDa4SiP9EkFVzn1bv6
	 FDeH+GaZ9kB1Zl9/KLBWGJ7VWwLNzVsKlQBZH9Nf2KoQHPtkQfcE7aiV0UMDU5y9a1bgC
	 f7txRhn/a0gwCoTN4nEQI2AYX7DtM3a3B9z7S96KZ/YMHVpBqC05cV3QcU761/jwADv8p
	 ZZmXt5pdfDFQ0b2VM4jv8vEZEFTTcR52zbOV3loJdu+MgKXFSs5J0hFUeMJgz+59zCzzx
	 Zfue6Ynv2/rIEG/L1gJAVBkiqMKKsDu3shT6l+BkPsFts/xkdpVODXzoi8ab5adHrEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793252646;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Kgp/0IKbbzTkFGoA+p+0MZbAmeWaaCFVonzMq0pKQfk=;
	b=qScbo+cxNrE66X/DoSkZOd3seOMk9VWnLB8Muu9G/J65oq/Oh687meO/gH/g2bqRM60M
	 0RGCSgxheP03veKP8I7398ezNxdFGEAdaSGi6QAg4Wsjb5SkK73K2yccK+97yVNWzfHWl
	 W/47kOCtvDlxMU0QceQ6Q9QALtQpjd6APaMD1N67fblELBq8CToXXXntBwgC2ZxAfi89B
	 l8DS+egTo+pq00oR0wUSc/05WRgHg5720ZzpRWR1YrFROwEfou8G+r0pG4rDQ11NwzEhE
	 unyUIUnid7+FewxX+BcbhboyNCpE1JMw6QzEaVr7ciiCIuNdfDAuABs9KskwKFoasbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NUiAT+p3;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60A2D606A31A
	for <linux-sound@vger.kernel.org>; Thu, 29 Oct 2026 05:44:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60A2D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NUiAT+p3
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3aded3c6103so898197a91.0
        for <linux-sound@vger.kernel.org>; Wed, 28 Oct 2026 22:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793252645; x=1793857445; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Kgp/0IKbbzTkFGoA+p+0MZbAmeWaaCFVonzMq0pKQfk=;
        b=NUiAT+p3vew3dvCFUIFB3TQ9suA1ZcTgZdKitD1bCw68LxSEV4NHT1ejzYx1LzQR0H
         Ltsm7SgPqyFvmRK9/d+KWPVsL/gCY6c4xHiJAuTxE9TeXMnJYLTiav2++JK8qOsBoTYS
         zmIKAD9cOVx9pxRwC7rp+pTnL9z3C76PjhzsdZmwzflWzU6sYsrU3muuRnm0pPAck5Vj
         q5Y2jk7LShtO3A4w4BVuc7q2OKXL8r/4pBgwKiN7RgoPURpOuS9hw5BTkWyuSkyHzuu1
         gBzv8v143lgaNW2mqohG6MSOfViGY9PtTUZPNpQejWp7ah1BctRX78C+D7IsXhVpbFUP
         iX5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793252645; x=1793857445;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Kgp/0IKbbzTkFGoA+p+0MZbAmeWaaCFVonzMq0pKQfk=;
        b=AFDtrHtaOC9Lef0uXT28lwj7FM+tO8vYZLJ1iIvyLQjNTkYTNDx5Pt181f8PzadI57
         IPVNQqd4Yfuu4zqOxyFq7AqeFImkjsA3ECji55XGmM4ZDLLHn9nWBBgmQPqRwRflI0qH
         zHscMpOKp95EdBVpp7ZowITPYfw7wwhUiTp/kiJpLLjWGo411xsu3F5fHv8S8wMp9FLs
         OPwAmHKde7xC3TKixRmsyoXjGeCbb36w8cuJ4A7+oU+iqpMGcnd9cRlVSgUgqBcWBYvx
         R03IY2qGaRLqJG7gl7Y0vWYlTH+AhHS8YxSgcKSdQFM7ohYrx7864mIWJDwYueFS4Iev
         a5lA==
X-Gm-Message-State: AFq9FYJYRHKcFLxuRkEpC4zwMagc8NN19g2XEwjXhSwq3RLK3ApKazVi
	mfThjp0RYHCKb6a7XxX2e8gMX4+fJard9Qv2jUB2dSGcTAbZEhcxQzrp9nJm6w==
X-Gm-Gg: AYBFou3jm42pOZNNmCwqBvoZfb2359pOaXrUrN1J9rkajHgpwW5dffUWHgGbo09Lesd
	ICF1F7o2DwHFGvEyEL1w+T0ilNM2jcvgwvY0/EADrGyiMVNYgAFXUnSPrphBlbYPkEX/ewMINaQ
	LxlUqfv1TRptrII2v8JZKhyf/gQ91kCTqyPjshc3uczwWNryWx6HUJZ/6lzBmhmiu+AQU1g8zd5
	IB9+C8mcO+IA+JHx0nhO50aYSXo/U9CIig9m5Gk49td3dUJEhzoiJPsEDABU/OVLP+e+XqUgC2d
	mcc72x9jSQ8MlZ6LwHSc1XsqsHwiE9+OUJZlkbik9b3W0p74xK9q+HJ3e5XaSWwX68KtzGN1pGZ
	udllYLSNYgLy9/pGTn79zATXNRbfX+xqXl2PBsZLCUNk0kgOT6z8wqIM62QT8CqqFmFiBhJsfbA
	4h6hME2jKgpITvNIdQQMyP71Iced7yXTZgjoce5v4VRP098m+XEXu0f/GbDWjGQB/QGCtageCd8
	BW2OONy4wf2TGXCNpAA9yJRjIVe9lZE9ODm7XKUgZAq98d/WJTliqo5AwclZUDTZYSup/Ja1mT+
	nywU6c1SRfzBCvITvWxNF2Fa8NBVDjCGOkCw+IdyiSwOHVYige4H5jVdljdjdXlAbmp83zwxk1A
	n4IzJM+AxGKDzO6USKGN/CVqa9rJ9gDnW9QSAal/kRAOmF4I=
X-Received: by 2002:a17:90b:5242:b0:3ac:7556:8eda with SMTP id 98e67ed59e1d1-3ae58100ac6mr2908685a91.26.1793252644765;
        Wed, 28 Oct 2026 22:44:04 -0700 (PDT)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e83127csm2433520a91.10.2026.10.28.22.44.01
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 28 Oct 2026 22:44:04 -0700 (PDT)
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
Subject: [PATCH v8 01/14] ALSA: virtio: Propagate PCM send failures through ACK
Date: Thu, 29 Oct 2026 14:43:41 +0900
Message-ID: <20261029054354.2931-2-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261029054354.2931-1-mynameisjune111@gmail.com>
References: <20261029054354.2931-1-mynameisjune111@gmail.com>
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
