Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794062086;
	b=ntudaGthzUbxvZPnpM9G3lnOxJwTRT9koha7mIWX8+gCllAHyKDk3lVRgHMgJGnGm9Oj
	 N5muMPBJiXePxPNvLnVWjKKRu4EJYBIPi+RpJetuQl4ElxJYvCONMt48Q8x+QuKTtlvD3
	 ctlUKmFsjS/C5YgygO/gmbd5h1CxYN9eXKSBpISrtoCX0bKyHPV48DWoC1LIYTSjjBPpL
	 9yEGGaMpBqCrDNkAyzgrO5P5XqKg6NdcIABZAi29U8fejFhBsF6X9qsoYtBMuj1uqm0O4
	 8E6mFl/ZS834q5okcZ+8Qgw8T1R6SWrc9uhTNPGHPrIe/aDjzo1UD9fydIDZu0BPoew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794062086;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=p2HQn0uK6b7S8WnZVO6RYFKBvJhyKWdKHL77ptFOkeg=;
	b=DK8dKxxX2n1xWCbC2GTCQ2ny1In1S7lnFje6ASkKniymTSYVDzjXB72bYef88uG/kq7G
	 KgiUT5CgDWHaTF2GOnSMzigmjs9wgBd8ON6h5cPoz+YSYgcYFnjSgUYoR/KcwLoxwQ2Vx
	 mLPrQxp6/2M5OAM06afZU4zeQZ31yuY2qcJVw89/Vp6y9O6iYQkO684EAMa7aIylSxlyI
	 1ta1vjwBOsr+M796imd/nYKC8ZIk9mPvyF1RrApDqu+4TrsW8nUfb/aNtm9g6T2wKTFY1
	 psAY9B3Q1iJrFPTB9ClI8erSgasDBh/FfM6AAy++h92y4vnLEjS68/GnV/BROwGU12Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NA0P30VQ;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A841E6082BE8
	for <linux-sound@vger.kernel.org>; Sat,  7 Nov 2026 14:34:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A841E6082BE8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NA0P30VQ
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-36dbde64409so2160073eec.0
        for <linux-sound@vger.kernel.org>; Sat, 07 Nov 2026 06:34:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794062085; x=1794666885; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p2HQn0uK6b7S8WnZVO6RYFKBvJhyKWdKHL77ptFOkeg=;
        b=NA0P30VQ9n090XJ4TqVf7sJKhlaP/N+vgWf34jWuPYckEF4znBT26tNc6UGbLly9GO
         uwsnqszUOBGwiiZoZjHXkod6G3VxJ+zeVGspje5QLuBQrukexdCbdAtl+oKe+8o7p/v6
         s/pY8SHahToDJWY9FPbsTkl50OoRhyqgmXXMP5RPBXQaQOycv6K0qZ/OaqlnEkHhIQtJ
         iXQ9dqciOtjt98mBiq623GYREJ3IhmNDa4rEUWsHzCwVE4v1JX4yRED1LQsItVJ8VE7L
         OM8slzcfV9WYcm4V7XvakpoBBYqAmxtOsAMsX1/j898ELm4PmFWXRZ5EUfyhvCsHWh2K
         ReBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794062085; x=1794666885;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=p2HQn0uK6b7S8WnZVO6RYFKBvJhyKWdKHL77ptFOkeg=;
        b=1jTFr879iPPXwoEEVXrsSjxelMO3Ooyeb4cRBejwoxIG7hVTASztGzlYJgvQC3ZRkl
         9U6G3GUKVWlI12thgoiS/L2Yrf9qPqWKIZToSq8s9bYrh4yxpUvKLzeNlncvzS6/9sLg
         Gx7yeVK9aWJ0Sy/jGBw278noShif2Od3Q27Gk1GYyXbMvpnJYaZdyR8JVYfvh0t1pyoZ
         i9n4ghSqjOHQ8rPly/mYmcRuwDP9VS9BmqPItOvTEdv76lzL0zao69tyBh/yQ7LFLIsq
         wQyVdTAMk+Dkaia04DtFoSXydFbcPxinWRuqlLeXwQa6pJcUEDAYE9mrKxQO2KBBlznS
         8Y0g==
X-Gm-Message-State: APuU4Z9eB3E16p7InB9GN43OIz9QjXvPFO38CIAWakdIcNYU+4wx1kS9
	UcpZaauVhUBe57j97ko9QaKmYtkIFgJTIj+ofGX5aXTMrloHORhI3boPGPxaSfaj
X-Gm-Gg: AYBFou1LZ8wMWn+DTrgU6sPoGTwDWUxTDchMxLQfdqcHAH4QQQ+5YWv8X5TxEItWMM4
	Yt1dqor4KeCJwH3K/SiQoXzpreU7ZTBUzzuad1KlZhn8g/NCoEZ0xN/BMAUPqrMqxVafuJ5H9af
	Rvi7SFviNw2vvWQpWSfeVKktapcOvvpZhuLFz97OeXkEcst94id4WsQ/0SaG8E+nFpXSEyOGOYX
	I927RIiNGYGj97uxJQxpzfEw84BNpmbco5shNUIc/1nXBsQ3OQrWa/c5XSGQlqnE9VfQA19UYgk
	88tR5WR02zUQzNMo1nzDmV4sD8ArdU7z49G5Se2zrYdrHDOZvYU1z6O9xsIeuK0ldbPFQrgsge8
	72yzSFwXoHRWCuA/fmGSsEPFq9PSzuyOwSC1SfaiVQlVExzWEEzMTpkTDiCU7tP7l77hR4//lSw
	1QB+Q7WEBWK6/GDPV6O3NEmFBNLdDmbQOJWtJ/x4vCaBZSKRjM4UfGk7fiuB9Lklj6Xs130W4vD
	b3EhmPVWQpkoryMm/tKO41w6EaDmj+Kqs3B8lezIUgok1gjbMNDMOv+MZjmhh7XG6K+yF3aDxzh
	mPA0LbYOJ04Eq5M/WwM9KZQghAOJvdwsluDbCvcSdrErVr8FVwxNpV5z0ldaRZn+OaLEJIhjYrW
	uPrN/SaRs9zMuervFKiMKV13AqHoQFCLLps7ZfhogCmKWRQ==
X-Received: by 2002:a05:7301:a07:b0:36e:76bc:7556 with SMTP id 5a478bee46e88-36f75b2198amr7629489eec.16.1794062084456;
        Sat, 07 Nov 2026 06:34:44 -0800 (PST)
Received: from localhost.localdomain ([180.182.24.11])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa9aea75fsm27881873eec.15.2026.11.07.06.34.41
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 07 Nov 2026 06:34:43 -0800 (PST)
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
Subject: [PATCH v20 05/12] ALSA: virtio: Recover PCM state after a failed start
Date: Sat,  7 Nov 2026 23:34:15 +0900
Message-ID: <20261107143422.29319-6-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261107143422.29319-1-mynameisjune111@gmail.com>
References: <20261107143422.29319-1-mynameisjune111@gmail.com>
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
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
sound/virtio/virtio_pcm.h     |    6 ++
 sound/virtio/virtio_pcm_ops.c |  107 +++++++++++++++++++++++++++++++----------
 2 files changed, 85 insertions(+), 28 deletions(-)

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
@@ -116,6 +116,15 @@
 	}
 }
 
+static void virtsnd_pcm_start_failed(struct virtio_pcm_substream *vss)
+{
+	scoped_guard(spinlock_irqsave, &vss->lock) {
+		vss->xfer_enabled = false;
+		vss->stopped = true;
+	}
+	vss->substream->runtime->stop_operating = true;
+}
+
 /* Keep completed RX data valid while RELEASE drains the device queue. */
 static void virtsnd_pcm_block_ack(struct snd_pcm_substream *substream)
 {
@@ -148,7 +157,7 @@
 				      SNDRV_PCM_HW_PARAM_PERIODS);
 
 	scoped_guard(spinlock_irqsave, &vss->lock)
-		vss->stopped = !!vss->msg_count;
+		vss->stopped |= !!vss->msg_count;
 	vss->suspended = false;
 
 	/*
@@ -250,13 +259,26 @@
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
 
@@ -310,7 +332,18 @@
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
@@ -353,6 +386,7 @@
 
 	scoped_guard(spinlock_irqsave, &vss->lock) {
 		vss->xfer_xrun = false;
+		vss->release_required = true;
 	}
 	return 0;
 }
@@ -395,33 +429,40 @@
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
+			if (rc) {
+				vss->stopped = true;
+				substream->runtime->stop_operating = true;
 				return rc;
+			}
 			vss->xfer_enabled = true;
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
 
@@ -452,26 +493,38 @@
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
@@ -485,6 +538,8 @@
 	if (rc <= 0) {
 		dev_warn(&snd->vdev->dev, "SID %u: failed to flush I/O queue\n",
 			 vss->sid);
+		scoped_guard(pcm_stream_lock_irqsave, substream)
+			substream->runtime->stop_operating = true;
 
 		return !rc ? -ETIMEDOUT : rc;
 	}
