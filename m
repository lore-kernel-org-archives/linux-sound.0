Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794464719;
	b=SffcG25vK25xyNdaEDb7pMpyY9bvqWVmS8KwHfIBMO0pisuKa9wBxYyXTFsGC5hUqnmu
	 UTnYwyenASUvGE1oCv5oRfcxzfjuSjTvgC9+iyYVqjZVFhKL3u4JAKaJqZcqhy9WO1gsP
	 tOy4kHfqCLz4827tL2b7qZjopvrLGcvLEdwqwVAeuuTtBwPknM7v9aB3505qGQDYW3rt3
	 xIjITmq6Z1YhwNZ3dSoLp1DXjvz3zjqyzYnasOCtGS6EKJMl6YpngX7j5DOYIGGgOIfjp
	 s/8wRiv0b1PaY8/5w9ttTMh89ADs9lAVkxeXdtBiZt52a/hA6SDwu0Y4fvjQg+QQM3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794464719;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=MsI4m0uo6XJTpD5aQtetIa3TMpTeA9EBkJp0jkGREkg=;
	b=nWuQv08J5UOZQq1tsbjKa8R82sbUtiCHgMCmXuPhfYfaefr071dIJpsGqZl6774zHg4j
	 JF59IwYNWuGBoHqTguGdUKSkevW/8b6j1vCGEONo6eW2q+CPokms8ssbFWidJe5toZpS/
	 HExANHKPntOKtu6rVDXz3Y1Dhz1JiZVGKKYU85sqoxKxRcK45oMiEA3/K3dHsJ7Z5Jxp+
	 gZ4NH/uy0gnxZTuFiWsNNlzU9IsSiqzr9W0eU0WRkcI9FLokVDetSGCb4qZo+O8EmqDfv
	 trOs2SYvqkOgWEprBS7FsxBlERC7Je5HQDb+SPuYdxFN0iNcgSC2pwtqcit8yUVFjdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fWXgSUNw;
	arc=none smtp.remote-ip=209.85.215.170
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 025D5606A898
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 06:25:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 025D5606A898
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fWXgSUNw
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cdab6ae1ee9so1811931a12.1
        for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 22:25:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794464718; x=1795069518; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MsI4m0uo6XJTpD5aQtetIa3TMpTeA9EBkJp0jkGREkg=;
        b=fWXgSUNw+bXPQ3fUd2mRSr0Z9tnxCnNEBbQH1KZBGFTXRYI51tPFVZlQleO8CJJDoq
         gvuM8HNbDQn1gn0c1cXGRPq5I9RYnpiZ6HJxDd14z6UZ/JOZrgCZTShm1IcuH67+keT5
         oo+h7GY42Ee3NRihDjkbGxvPZhTX2JLPiqdwHiHWvmcHbIjyT4AMUoKvSi7zlm+Eth6s
         7PAW8z1S39nEiHUT4sMMnwO2Iio6Oo47S7VxE7sV7AUK2aUuUhyT9U7tjKs3uDbl6QxX
         0AnJLNWRN84Lq/GGNiL/+JOmrmi38tc3P943q6+1sMAXqsO24+BV60S90p5iIi0lQhoe
         mlnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794464718; x=1795069518;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MsI4m0uo6XJTpD5aQtetIa3TMpTeA9EBkJp0jkGREkg=;
        b=xOdkcNY4oDJuNHSdmToHudYD7mjD/ffJieNvjqi81/Sf8JaGfT5OWEjvOuadXTC3gw
         zY1GpOFOSDzYN3jmp0PGUfLaYM9Zd5WRVLUFehoi0nb9mWATQhHeKZTRgtlJVCpRAi19
         BODEF1M5OTGIiZXRapVn7JR9fCMF3KASDRjCwQMhQ1cr9VRkfNBUZv87BdQq+Rnk8p1d
         pFqH6WVrLCD79h89WWK98Ca/g/2veL/IznJqORjtninwE0Jl1SQRWQnK+OVQXo1XvzcS
         c/oULyDBgy8YFxN7iUJXmxt0v3gvd3M31CXz8s2YGtk6mOaDhNkd+uJyGVf3LNq7ylJd
         chEA==
X-Gm-Message-State: APuU4Z/3OE21W6riNv8ZA0ofEa4S3DuumfgPKvMLrwWZW9/6sKrirDk0
	2NkBqw6vgBwdZkgS//bUA9Tpv+cxgcHuqovl186RXfsfmnc+fSqBMQSuicZwOQ==
X-Gm-Gg: AYBFou1FORDElPpGz2X24R0wdXdDvaPeAQIWPH0wJMVA9+muXUdbT2Pb+GIDfzc4LJ/
	xuu+tOdnqStBJrpQsqtU6leDZ0z1DatWj5yPURkzlBQDymvbUNn9XYQSo+7xw1WOtPHPZcPnsmF
	qbsvvtef5/cvJkQcqws0P5Z4LIlXlWqzj/KCLTIq79buGyolzCqVivJurNgepip6thVdN/UybZm
	dUVd7/oMX+doqdBHn74TG245QDzCQl1AoVht8k7MRPqcaVDJKkWJl5EAbvRUQWpHKA2HjQycN3V
	hTYsX3m1pu4TPuiVkpYScDSeXkcNDuLLwJBbBQhDyXBFvoUgkpC59JHJKHO6rsBgNs7MGk+55NV
	lM0AtRSqli7NVNhMmeVwgUOTbNjf3ugKZNmZQBabPLFV5yHxptquuGx7KGoF65Vixw58pmnfXD4
	3UiXdl9JXtq6ha6wtkM1wU+bPK6edymK3XBC9SSmqDBAmz8EvB63+cNYXnMlpvwrRaiJshH6b8i
	F3DVw0UFxsusN+2ETX7+IXGSu1IAMzfAwoUa2mJ9GfV1E707DaeWdnGKmt0eC/36dHItmpi4YDo
	j759NcCxSBFhXoQBiVOybAOzJag0jxDjS8jLL4WgYziTENiWnw0YPua/fF+5DPezoi54B03pIwI
	QOM4MIS2pPb8sojFhD6FzOaDdzPQLa/vOxBZmNNwKoIDbpJM=
X-Received: by 2002:a17:90b:3b51:b0:3ac:adce:60ad with SMTP id 98e67ed59e1d1-3b182eec12bmr3841358a91.22.1794464718172;
        Wed, 11 Nov 2026 22:25:18 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6a3e61bsm26979965ad.11.2026.11.11.22.25.14
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 22:25:17 -0800 (PST)
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
Subject: [PATCH v30 07/17] ALSA: virtio: Recover PCM state after a failed start
Date: Thu, 12 Nov 2026 15:24:36 +0900
Message-ID: <20261112062446.159-8-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261112062446.159-1-mynameisjune111@gmail.com>
References: <20261112062446.159-1-mynameisjune111@gmail.com>
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
