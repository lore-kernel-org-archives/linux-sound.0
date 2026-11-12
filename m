Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794444469;
	b=nDsPYq0h4ZHRbpCno5NFtjALWJ19o9NvBOVUPSi1jwGAsJh1bbThDZH/C3YmXWDsKoBH
	 jbf6KnAUlxQybor25eoDFNSARaAiUSBVuR5oHBucAbQdcH2FsztRSw/bHlmiQbfzxSv1L
	 F2Z0rrdk9NLcMXlXf34CX7DosrkpY3cpEZXHoE7Qp8mANUxEGhSJ5oWqF5Bqw4ejNS6jl
	 gHD4jlcpoteyD3fsYNAgAJt15poZMsZXHV/YCNnEjcL8eSPx+VNcVhZLibA0UHgwsaGsk
	 UmZm6c7f0edi+yvvvfe0D3gWMV2awT8eZpA9xlM+B4Kvl9FRdpr5zqT3uxuv3cVneGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794444469;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=T+sVIbp4DoVMcIWaKe5XqLWovfYHU/r2Z29X5f79OW0=;
	b=Bsg+dv2lmSwaWUKG4oNbhBqjdBITWpxfJ3PGOCFXWgMdc6Q55+DBM3TZegrOQrZDMT5s
	 GXsbxtdSbyWvUEbyJXJMVsEv+LGFqkx+QFvN2pXXLowQ6hLxYymK+q1b0UyZQGR3zu1nz
	 6FSIw0sYH4VVYoAMec1qBJZesXZutrjk8Lyui3eRvbjnH+Aed+4jvU2ah/3UDCW7RYgy9
	 AD4sZqb8jUmZ9n3mWR42m26LFG/Qw9FyyE3oKjcvF3s8GK2lvjxkl9cK+0EiFK3dUXIjn
	 PYMvEmipx7YAMeV2vUF2Xziedc2zXWVNskpQS/ACmPM1TyrHmVRuETJ0QH8jqlg3N7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="TWAmWQF/";
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81E87606EE3C
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 00:47:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81E87606EE3C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TWAmWQF/
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso7809910eec.0
        for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 16:47:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794444469; x=1795049269; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T+sVIbp4DoVMcIWaKe5XqLWovfYHU/r2Z29X5f79OW0=;
        b=TWAmWQF/8aVnX9KRr3yk9s4sS7z47XvDJLd0luE+eON527O4KHqJLTbjLFPeFZVrkK
         wQ06Pga3D2bIhgXWh1KC+iqkwcASMhJIlxSNC9wTfI5nlyKKWjodlIhMsD1LaVEthPQp
         hN4y/wKcbrXv7Sz7M6wqx5wQ+JGnJi3fmJ2/pJAd4qlJOr0/Vs0pJNi165iYk7vOpThP
         PP3cS+v276IgzDxrxXRsRDu6jkmsiMJGduLplmjcy9B0BAwa8+VEt1P/YadyaGWTkWq1
         gUIjNWKAiRMrR1MBOPNk2YT4YE0KXHB1+rs5slDgH5bzqPovcDIdOISIOd8eoD9MvKKk
         gjVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794444469; x=1795049269;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=T+sVIbp4DoVMcIWaKe5XqLWovfYHU/r2Z29X5f79OW0=;
        b=wXVTFSAeEUV67DumKWH0rWeimxkX/YKGnOzVcXhI15lYZV4Mrixy5xA1fEOeYw/g5q
         r2BQjIg9mhsCMzZ9M8/vLhrXpklK4nSxxke31rtoyohG+nNtQ7z01fHkk+mQzXNCRbeQ
         GWYZM34ATEBsPe4WD1d03Uyxu5rmKA/zL3hHwlX+X4ae1HMwh8trXh6h90P3xBkq9+Hg
         4LjJyZ4AcoXBT8B5viVLJV5uic+oH47FP4KUYpQj9935SrSPqXONAwhmvessq9sb7x4S
         IorDJw3WTU959w1N/L7Qw2iO3xeo2hK/3O6vnuDJ5T1+yZBohLwjHmuyp9kIjvmno6xA
         x2/Q==
X-Gm-Message-State: APuU4Z+8/H8+mCWUUHlHbooJGQ36XZiRFT6xdV58USB3A6EK43qSuQoE
	T7Qf4jU89hGRMbeue4Gj0iddhXLbKs/GqhBr0kPUjwG5oDgDtBq6pag0MiJvrA==
X-Gm-Gg: AYBFou0LIuIFe50mwKfj1dmvCEEYq4tf47oCX7yh8Ydw+IL7qCBBv+UJB0BmesJXCeN
	SOtf15OhUqWDperGsQTUrO1JMVpFzNtGWgvY9HoHs1Koj+8WS6Z0nY5668+v63wsK9dOVVOZpPV
	MyUAEI5dg271cBGdZqKCNjCdp3x/OFnNKQnEb9Priflf1Ul7FO+MnEKv5RzOtYB/Zac1ZODGQVH
	srF1iAUu0Ggqqo/eG5PKryQ5DNG83rJ6ros4yP6mRiJaUUG4nmkp0RoiWG0GaXBxhziazku419M
	IzCy2WMofx50ccDVoArS5rs5Bi4uZWq9DbEKa1vgGZmndUovhVGGSBtC34yHp+HJcuDjr/sqNL9
	j1Td+PgOQdPVWDmZt1uEnStN/YNrBRtYis3MlmlCxSv4/qXjwrYJA77HhKCy/QxkT9MvUN83heF
	ng2XUVs3FfvdGUW5xZiF2GX3N8+Kzz1bawjZ9O9CKKtB7SWKgeY/r9L7rqQ5FGxt+WVCqeTBsNE
	FH+3G8uTi8cZDfVa0fMhz4AtnwnyDOE6isxFr2S5SZjKqsnO31rzkXjge6Ubu4bJSnFt+eef0FY
	rmR2A4btGV+v67kOwz/cf57cP+9ZHpQU64Igpp5oHFXX0EmSaNmhWrDSEK8i2hRA9eVrbBIatlo
	peiJ/mF5fBIFeFzmfvIDUTf34D7XRpwe1R9CAo3c637Dr6vM=
X-Received: by 2002:a05:7022:b058:10b0:185:33ab:4d55 with SMTP id a92af1059eb24-1b3c137c87emr3424050c88.29.1794444468572;
        Wed, 11 Nov 2026 16:47:48 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b2eeffsm20672163c88.9.2026.11.11.16.47.45
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 16:47:48 -0800 (PST)
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
Subject: [PATCH v27 11/17] ALSA: virtio: wait through signals for PCM teardown
Date: Thu, 12 Nov 2026 09:46:58 +0900
Message-ID: <20261112004704.49758-12-mynameisjune111@gmail.com>
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

A signal can end the interruptible wait while a STOP or RELEASE request
is still pending. A later teardown may then submit another RELEASE
before the first request completes.

Keep both waits non-interruptible and use the existing message timeout.
Other control requests remain interruptible. Device reset still cancels
the pending request and wakes the waiter.

Keep timeout and wait results in the types returned by the kernel wait
APIs.

Fixes: 9d45e514da88 ("ALSA: virtio: handling control messages")
Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
sound/virtio/virtio_ctl_msg.c |   19 ++++++++++++++++---
 sound/virtio/virtio_ctl_msg.h |    3 +++
 sound/virtio/virtio_pcm_ops.c |   10 +++++-----
 3 files changed, 24 insertions(+), 8 deletions(-)

diff --git a/sound/virtio/virtio_ctl_msg.c b/sound/virtio/virtio_ctl_msg.c
--- a/sound/virtio/virtio_ctl_msg.c
+++ b/sound/virtio/virtio_ctl_msg.c
@@ -265,7 +265,7 @@
 {
 	struct virtio_device *vdev = snd->vdev;
 	struct virtio_snd_queue *queue = virtsnd_control_queue(snd);
-	unsigned int js = msecs_to_jiffies(virtsnd_msg_timeout_ms);
+	unsigned long js = msecs_to_jiffies(virtsnd_msg_timeout_ms);
 	struct virtio_snd_hdr *request = virtsnd_ctl_msg_request(msg);
 	struct virtio_snd_hdr *response = virtsnd_ctl_msg_response(msg);
 	unsigned int nouts = 0;
@@ -273,7 +273,7 @@
 	struct scatterlist *psgs[4];
 	bool notify = false;
 	unsigned long flags;
-	int rc;
+	long rc;
 
 	virtsnd_ctl_msg_ref(msg);
 	/* This reference stays with the queue until completion or teardown. */
@@ -314,7 +314,20 @@
 		 */
 		virtsnd_ctl_msg_unref(msg);
 	} else if (!nowait) {
-		rc = wait_for_completion_interruptible_timeout(&msg->notify, js);
+		/*
+		 * Teardown must observe completion even with a pending signal.
+		 * Otherwise a subsequent open can retry RELEASE while the device
+		 * is still processing the previous teardown request.
+		 */
+		switch (le32_to_cpu(request->code)) {
+		case VIRTIO_SND_R_PCM_STOP:
+		case VIRTIO_SND_R_PCM_RELEASE:
+			rc = wait_for_completion_timeout(&msg->notify, js);
+			break;
+		default:
+			rc = wait_for_completion_interruptible_timeout(&msg->notify, js);
+			break;
+		}
 		if (!rc) {
 			dev_err(&vdev->dev,
 				"control message (0x%08x) timeout\n",
diff --git a/sound/virtio/virtio_ctl_msg.h b/sound/virtio/virtio_ctl_msg.h
--- a/sound/virtio/virtio_ctl_msg.h
+++ b/sound/virtio/virtio_ctl_msg.h
@@ -47,6 +47,9 @@
  * The msg_timeout_ms module parameter defines the message completion timeout.
  * If the message is not completed within this time, the function will return an
  * error.
+ * PCM STOP and RELEASE wait through pending signals within this timeout.
+ * Other requests remain interruptible. Device reset cancels and wakes either
+ * kind of waiter.
  *
  * Context: Any context that permits to sleep.
  * Return: 0 on success, -errno on failure.
diff --git a/sound/virtio/virtio_pcm_ops.c b/sound/virtio/virtio_pcm_ops.c
--- a/sound/virtio/virtio_pcm_ops.c
+++ b/sound/virtio/virtio_pcm_ops.c
@@ -20,11 +20,11 @@
  *   (RELEASE command in the ops->sync_stop()) and the ops->hw_free() has been
  *   called.
  *
- *   When the substream stops, the ops->sync_stop() waits until the device has
- *   completed all pending messages. This wait can be interrupted either by a
- *   signal or due to a timeout. In this case, the device can still access
- *   messages even after calling ops->hw_free(). It can also issue an interrupt,
- *   and the interrupt handler will also try to access message structures.
+ *   When the substream stops, ops->sync_stop() stops and releases the device
+ *   as required, then waits for pending messages. A failed control request or
+ *   timed-out flush can leave the device able to access messages after
+ *   ops->hw_free(). It can also issue an interrupt, and the interrupt handler
+ *   will also try to access message structures.
  *   The messages retain references to the PCM buffer pages until they are
  *   freed, so late DMA does not target pages released by ALSA.
  *
