Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794355577;
	b=jMPsami+zc1a2342BZGXifJkmTnGbgObKmNyiBH7h6a9zRnZSGk7vxndFuA5PGUMbKcu
	 zA9lo0d6SxGprVUkEcb+ptwcBg8ium7xzrdmVtmXLpui4J8GO9iWVVH6MdbqsZ0++CuKc
	 KhZzjHzIV7x5EU2hvxZeFn8YhhO7J1psN5YBQjzm1lXzyRDHdazScLYeUWI+cD3VujEoC
	 3YpINkIesqEcHlaTwnQ0QelSQxjihSw66XxPikYDovm7bMgY3kUSBYuwkULCeKpuyoMeI
	 gQBOPIDTAz4LO7LdiI0XD6sJNnxYkGElndt/fGFg+tM5SVJgaIkMixVOuWjGRtzmD2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794355577;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=MsI4m0uo6XJTpD5aQtetIa3TMpTeA9EBkJp0jkGREkg=;
	b=j3oh5yM6DWsYv7L847p+wPFtf20EcHICifF7q70AUn1OvSFU+/tMUXAZ8ou8ZqzhhF7y
	 26wESQxehHNY6LewAdTVpDYTWGTN1omiyOcHGs4mKn4ZhL2wO/ZqpXw8JXaOGF8O+wbUk
	 JN732do+FMuZkgl9a3dntqLPi34Rfq/2gVedYEc81AfKaYQu1qTldSpiTLPEx8TqoqLSp
	 NTfFt4pJ1cWG3R1e+v8TfdFv1SRugtfScNtrkh7xR8vjL683W1Uy4U2opvy7GOztY6aVq
	 pWbo01WYv8wclWTtN0wu5tmEhqdY6+lCYrJJ5eWRF0H9/JViDzv61R72fYYyOUpoASg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jRDMOTsy;
	arc=none smtp.remote-ip=209.85.215.181
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C526460A3823
	for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 00:06:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C526460A3823
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jRDMOTsy
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cd6acc50b8dso1252015a12.3
        for <linux-sound@vger.kernel.org>; Tue, 10 Nov 2026 16:06:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794355576; x=1794960376; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MsI4m0uo6XJTpD5aQtetIa3TMpTeA9EBkJp0jkGREkg=;
        b=jRDMOTsyydYurB3B1li2/LKILcpOTLljUaFzN+DMJmLqCTetURCID5khud5Mfzqq6r
         CknS2xEsM2qJ5i9v8q9WdXoxP2lSp98bFSzil2ZCzshsHYilPnWil0t9j3xj6LWV/k5c
         My7swN7FYjy6oIIx2LUhykZuTkb0lyhtLJcGDbYFyXLED+i4fBykj3yVwA3uzb1hR3Yh
         gP41iegwt2enBPWUNSUsj+Nd5uOzXoYC4aha4+fxep1F/YkqdCEbYGBfJ37c5KmEqhqL
         vFvvtb06f9nc2UGUPkMwnX3cjsDqGmM/UhDKi+F/pGpniwIT9jVZh18yRqbopgMat8v/
         e+jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794355576; x=1794960376;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MsI4m0uo6XJTpD5aQtetIa3TMpTeA9EBkJp0jkGREkg=;
        b=pwvwSPspvTPMPTAznfdej77dA1RfVFAnWVodqG4HE6apgm7rV9xbqA6BrcatgIY2dL
         lD26LPtHAhGpJ4K7RsWzq1/rqmNsqIOHvVzSAf/TDQXFm6YndflrJAh+G0/HLtzQgRQv
         GXA3mYed3SawOro1XnL4hPQVEjN6cz4Azzo75ZhCmCcqVJSnQtZF3JMUt82oZ7yNpha+
         F8HL36A8gNV/Bc/Dlv2CTNIW7lmBiGnur9YJ91OHWZizQDFKQxtajQLY4oeBZiKVk4Kj
         Z09WzxFliOAMlecom37888/YwW/uQpul/jqEN6EPG2a1oY9FQNBZGgJ5CVKHZM7q16rT
         oOeA==
X-Gm-Message-State: APuU4Z/K1a8RXhxUU07nEFOd7CrfjQxpHDnTWjFsu86eSjCW79AX5Eq8
	YlBFSmIvVLbWOdo9nbbudQ6pqd1XNvSNdZw3SjtxVW9zoLbpSw2ZcCk6SBt18Q==
X-Gm-Gg: AYBFou1+LGe62kJD8BqPuixB+9iiw9vf1loQ9U9KeBdthK8YWSBa571hmTC6aX7/pqm
	QhpQ6IvhgqqGwxsWQ6Ra1PnDuEUn0q27CDUOrYob9+IB7VJjkaz6/oH6kWMYmtIZDwndjkzv609
	yxlG+BVcwJxPsUA5u02PM8dvJmpKbVAj4mdEDnqtSh3UGaeXB2RWwm5kg5TP9La+r/T4KrQswRt
	cU57G9VuS53W+u978v1mcTVQOW1XgBv3BODY6wdn1ylxKjC99UYJ2mHFe40zXWq9t6mitSvggCM
	ZDncmShylyBQgabXpqhcQuzm9SCjAPd5SWTaX1YZZZ8vqfEHf8qjT5TUmTe0+yUQyjGlzZFQL8U
	cDGHQ94dQk9zdrXULQJP2evzNWag2irGoW+4++X3kB3oFNSkTzcDPLaDvtF4qy5H7sVGkzmkeRp
	3jkY9/HfD5gPPh0lMVXtu6qrR5dkntVfnZhY/tv5ktG3azOjoOqezCapVGBTNhyKS/BX4rKb2Lw
	xMhkNvFkhgE5ZHaYtnRbsPpytZzqNubB7i7EoLl9IMbbsVnqRjw9IGF0/fyCo3rKfekGKm8khOI
	veXmvGStICHTPjI9dLgaxEB28YUTNr6nobq0m6uIkMl3MBr3DkxMe+EM5BxoQKICRwFQKWnF6um
	eKD0R9ZX5H25xDBBZVgNeGz28B6Q19hMj8A415O3s+FMkM9e65XCoUdFK0oBId8CyE34x
X-Received: by 2002:a17:90b:540b:b0:3ab:17b6:9a93 with SMTP id 98e67ed59e1d1-3b1830081ccmr580141a91.52.1794355576015;
        Tue, 10 Nov 2026 16:06:16 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1838e616dsm474361a91.4.2026.11.10.16.06.13
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 10 Nov 2026 16:06:15 -0800 (PST)
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
Subject: [PATCH v24 07/16] ALSA: virtio: Recover PCM state after a failed start
Date: Wed, 11 Nov 2026 09:05:34 +0900
Message-ID: <20261111000543.28550-8-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261111000543.28550-1-mynameisjune111@gmail.com>
References: <20261111000543.28550-1-mynameisjune111@gmail.com>
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

Capture trigger queues I/O messages before PCM_START. If the START
message cannot be allocated or sent, transfers may remain queued, and
ALSA does not invoke the action undo callback for the failed trigger.

Mark the stream stopped and disable transfers for every failed START
path. Arm runtime->stop_operating so sync_stop releases pending I/O and
prevents prepare, hw_params, or START retries until release succeeds.

Latch a transfer XRUN in both playback and capture, and schedule the
existing period worker so a running or draining core stream sees the
pointer error. This also retires a failed playback START during drain,
where drain-init can already have advanced the core state to DRAINING.

The stopped flag is shared with ACK callbacks that can run without the
ALSA stream lock. Protect every stopped access with vss->lock. Read the
pending message count under the same lock in open and hw_params. In
sync_stop, decide whether RELEASE is needed and mark the stream stopped
in one locked transition; leave it stopped when release or draining
fails.

Always cancel elapsed-period work in sync_stop, even when no RELEASE is
needed.

Record the RELEASE obligation after successful PREPARE and clear it as
soon as RELEASE succeeds. If the subsequent RX wait fails, retry that
wait without submitting RELEASE again.

Fixes: da76e9f3e43a ("ALSA: virtio: PCM substream operators")
Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
sound/virtio/virtio_pcm.h     |    6 +-
 sound/virtio/virtio_pcm_ops.c |  113 +++++++++++++++++++++++++++++++----------
 2 files changed, 89 insertions(+), 30 deletions(-)

diff --git a/sound/virtio/virtio_pcm.h b/sound/virtio/virtio_pcm.h
--- a/sound/virtio/virtio_pcm.h
+++ b/sound/virtio/virtio_pcm.h
@@ -26,13 +26,13 @@
  * @hw: Kernel ALSA substream hardware descriptor.
  * @elapsed_period: Kernel work to handle the elapsed period state.
  * @lock: Spinlock that protects fields shared by interrupt handlers and
- *        substream operators.
+ *        substream operators, including @stopped.
  * @buffer_bytes: Current buffer size in bytes.
  * @hw_ptr: Substream hardware pointer value in bytes [0 ... buffer_bytes).
  * @xfer_enabled: Data transfer state (0 - off, 1 - on).
  * @xfer_xrun: Data underflow/overflow state (0 - no xrun, 1 - xrun).
  * @stopped: True if the substream is stopped and must be released on the device
- *           side.
+ *           side; protected by @lock.
  * @prepared: True after device PREPARE and the core pointer reset succeed;
  *            protected by @lock.
  * @preparing: ACK gate through teardown and prepare's core reset;
@@ -62,6 +62,8 @@
 	bool stopped;
 	bool prepared;
 	bool preparing;
+	/* Successful PREPARE still needs RELEASE; protected by lock. */
+	bool release_required;
 	bool suspended;
 	struct virtio_pcm_msg **msgs;
 	unsigned int nmsgs;
diff --git a/sound/virtio/virtio_pcm_ops.c b/sound/virtio/virtio_pcm_ops.c
--- a/sound/virtio/virtio_pcm_ops.c
+++ b/sound/virtio/virtio_pcm_ops.c
@@ -116,6 +116,17 @@
 	}
 }
 
+static void virtsnd_pcm_start_failed(struct virtio_pcm_substream *vss)
+{
+	scoped_guard(spinlock_irqsave, &vss->lock) {
+		vss->xfer_enabled = false;
+		vss->stopped = true;
+		vss->xfer_xrun = true;
+	}
+	vss->substream->runtime->stop_operating = true;
+	schedule_work(&vss->elapsed_period);
+}
+
 /* Keep completed RX data valid while RELEASE drains the device queue. */
 static void virtsnd_pcm_block_ack(struct snd_pcm_substream *substream)
 {
@@ -148,7 +159,7 @@
 				      SNDRV_PCM_HW_PARAM_PERIODS);
 
 	scoped_guard(spinlock_irqsave, &vss->lock)
-		vss->stopped = !!vss->msg_count;
+		vss->stopped |= !!vss->msg_count;
 	vss->suspended = false;
 
 	/*
@@ -250,13 +261,26 @@
 {
 	struct virtio_pcm_substream *vss = snd_pcm_substream_chip(substream);
 	struct virtio_device *vdev = vss->snd->vdev;
+	unsigned int msg_count;
+	bool stopped;
 	int rc;
 
 	virtsnd_pcm_close_ack(substream, false);
 
-	if (virtsnd_pcm_msg_pending_num(vss)) {
+	scoped_guard(spinlock_irqsave, &vss->lock) {
+		msg_count = vss->msg_count;
+		stopped = vss->stopped;
+	}
+	if (msg_count) {
 		dev_err(&vdev->dev, "SID %u: invalid I/O queue state\n",
 			vss->sid);
+		return -EBADFD;
+	}
+	if (stopped) {
+		dev_err(&vdev->dev, "SID %u: stream release failed\n",
+			vss->sid);
+		scoped_guard(pcm_stream_lock_irqsave, substream)
+			substream->runtime->stop_operating = true;
 		return -EBADFD;
 	}
 
@@ -310,7 +334,18 @@
 	struct virtio_pcm_substream *vss = snd_pcm_substream_chip(substream);
 	struct virtio_device *vdev = vss->snd->vdev;
 	struct virtio_snd_msg *msg;
+	bool stopped;
 	int rc;
+
+	scoped_guard(spinlock_irqsave, &vss->lock)
+		stopped = vss->stopped;
+	if (stopped) {
+		dev_err(&vdev->dev, "SID %u: stream release failed\n",
+			vss->sid);
+		scoped_guard(pcm_stream_lock_irqsave, substream)
+			substream->runtime->stop_operating = true;
+		return -EBADFD;
+	}
 
 	if (!vss->suspended) {
 		if (virtsnd_pcm_msg_pending_num(vss)) {
@@ -353,6 +388,7 @@
 
 	scoped_guard(spinlock_irqsave, &vss->lock) {
 		vss->xfer_xrun = false;
+		vss->release_required = true;
 	}
 	return 0;
 }
@@ -402,33 +438,40 @@
 			guard(spinlock)(&vss->lock);
 			if (vss->preparing || !vss->prepared)
 				return -EBADFD;
+			if (vss->stopped) {
+				substream->runtime->stop_operating = true;
+				return -EBADFD;
+			}
 			if (vss->direction == SNDRV_PCM_STREAM_CAPTURE)
 				rc = virtsnd_pcm_msg_send(vss, 0, vss->buffer_bytes);
-			if (rc)
-				return rc;
-			vss->xfer_enabled = true;
+			if (!rc)
+				vss->xfer_enabled = true;
+		}
+		if (rc) {
+			virtsnd_pcm_start_failed(vss);
+			return rc;
 		}
 
 		msg = virtsnd_pcm_ctl_msg_alloc(vss, VIRTIO_SND_R_PCM_START,
 						GFP_KERNEL);
 		if (!msg) {
-			guard(spinlock_irqsave)(&vss->lock);
-			vss->xfer_enabled = false;
-
+			virtsnd_pcm_start_failed(vss);
 			return -ENOMEM;
 		}
 
-		return virtsnd_ctl_msg_send_sync(snd, msg);
+		rc = virtsnd_ctl_msg_send_sync(snd, msg);
+		if (rc)
+			virtsnd_pcm_start_failed(vss);
+
+		return rc;
 	case SNDRV_PCM_TRIGGER_SUSPEND:
-		scoped_guard(spinlock_irqsave, &vss->lock)
-			vss->suspended = true;
+		vss->suspended = true;
 		fallthrough;
 	case SNDRV_PCM_TRIGGER_STOP:
-		scoped_guard(spinlock_irqsave, &vss->lock)
-			vss->stopped = true;
-		fallthrough;
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
 		scoped_guard(spinlock_irqsave, &vss->lock) {
+			if (command != SNDRV_PCM_TRIGGER_PAUSE_PUSH)
+				vss->stopped = true;
 			vss->xfer_enabled = false;
 		}
 
@@ -459,26 +502,38 @@
 	struct virtio_snd *snd = vss->snd;
 	struct virtio_snd_msg *msg;
 	unsigned int js = msecs_to_jiffies(virtsnd_msg_timeout_ms);
-	bool stopped;
+	bool need_release;
 	int rc;
 
 	virtsnd_pcm_block_ack(substream);
 
+	scoped_guard(spinlock_irqsave, &vss->lock) {
+		vss->xfer_enabled = false;
+		need_release = vss->release_required;
+		if (need_release)
+			vss->stopped = true;
+	}
 	cancel_work_sync(&vss->elapsed_period);
 
-	scoped_guard(spinlock_irqsave, &vss->lock)
-		stopped = vss->stopped;
-	if (!stopped)
-		return 0;
-
-	msg = virtsnd_pcm_ctl_msg_alloc(vss, VIRTIO_SND_R_PCM_RELEASE,
-					GFP_KERNEL);
-	if (!msg)
-		return -ENOMEM;
-
-	rc = virtsnd_ctl_msg_send_sync(snd, msg);
-	if (rc)
-		return rc;
+	if (need_release) {
+		msg = virtsnd_pcm_ctl_msg_alloc(vss, VIRTIO_SND_R_PCM_RELEASE,
+						GFP_KERNEL);
+		if (!msg) {
+			scoped_guard(pcm_stream_lock_irqsave, substream)
+				substream->runtime->stop_operating = true;
+			return -ENOMEM;
+		}
+
+		rc = virtsnd_ctl_msg_send_sync(snd, msg);
+		if (rc) {
+			scoped_guard(pcm_stream_lock_irqsave, substream)
+				substream->runtime->stop_operating = true;
+			return rc;
+		}
+
+		scoped_guard(spinlock_irqsave, &vss->lock)
+			vss->release_required = false;
+	}
 
 	/*
 	 * The spec states that upon receipt of the RELEASE command "the device
@@ -492,6 +547,8 @@
 	if (rc <= 0) {
 		dev_warn(&snd->vdev->dev, "SID %u: failed to flush I/O queue\n",
 			 vss->sid);
+		scoped_guard(pcm_stream_lock_irqsave, substream)
+			substream->runtime->stop_operating = true;
 
 		return !rc ? -ETIMEDOUT : rc;
 	}
