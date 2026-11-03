Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793693315;
	b=TYfiQUdkG1a3i2gX8Q9oDO/9QD+/zZJ0YuSai5ElmLrvri09/SzUb9hFvkncklzraUSS
	 42iOrYp83iUSkQM+IQrRwmJwsX3ejXv9NWk1TLQ1E4VJc2EX4oO+B9qK6nU0jWVkH9Zr2
	 tJE0CKVKg22WEyx4UmorWYVNJ+zXt3Z8Q0X8J15p95r5TU7jWngQFBkM4oC3LMyhdrrky
	 bz43yl9Lq2jZg8pz3gNf7iHpeB0U+HkQbFd4MfXA6++KUe/fzG3gZMMSwc90c8aslfJDS
	 5JvdklSn6DQihyamvDEYwMFNwvHJxm4TgwuK9iD2e/AQ4Ha4f3G7SRcjgHKR3EXLfTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793693315;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=7ISRk/hThz0s3N0yY62fPvRzMoAMDGueG8DMaorOn1g=;
	b=Iq4g9qXQpO5pvsxyYJdG5Ud0aO7TH+e8F8lvGUnXSboXgvk56Ue4e2jnvJc8G8NazpuW
	 qHJdYdbEPp9tHHltEkdL8igwkD3gKhQCQHuMqPljDWXGyPKbOL4ZZC9TJtIBRnI6qLGhX
	 8Hb6ZT49Tejrny6iQEGEVtCbmX3fbCCT1fG2nOJwMMeZQfJcpVqCaKIkhJ9Jq84bM46q0
	 5F+Ztrlfa40LVE5csABoPmxOBoVKpKq1fGmz+n/1uzCkYLVEQVr54sHxVAnher0HuZ5aI
	 /pE9+iVrgi3HwpksS5X8bxdqXF1fmBpyMTe63li+EXT7Us9ccNgJJY2bsXfrmE19Ewg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=niiyvIXN;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F049E606A339
	for <linux-sound@vger.kernel.org>; Tue,  3 Nov 2026 08:08:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F049E606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=niiyvIXN
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso6541032eec.0
        for <linux-sound@vger.kernel.org>; Tue, 03 Nov 2026 00:08:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793693314; x=1794298114; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7ISRk/hThz0s3N0yY62fPvRzMoAMDGueG8DMaorOn1g=;
        b=niiyvIXN4PAwhNlzK/S6Yn9Bzy5e563tSmRBMUFSntSGgtzgz/5AfCYP1mR3H92V+L
         nDa0RLgNNdOgtV9GRnFogq1evhiEzlIfdmUqP0IGJYtVDl0ntlkw/nqmsPWOA5eccx1R
         QRBZalrpfvhXZTogLFnWDT7YQKfI0+DaPleVel6kWzriZ7vve8i5nT/+SRK91j/xbEBn
         jFwdZ3ldfwmD0WKTeRu8praIrDM5r0RzqvZ5KqujTSDN1F4fs6z9rcdWKWgfSXmEFTVQ
         Rk+f2H+iHHOB9oMWHIVwjzvmoZfblHEXzcMQ5qhRhIwbQlI81b4QSfjhWrrOBAQEjVKs
         HCOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793693314; x=1794298114;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7ISRk/hThz0s3N0yY62fPvRzMoAMDGueG8DMaorOn1g=;
        b=0f1/Cd8ruKueBrio8nJDBDMEP/gSk+deTp5RyOzDDdv1DTpB2Qhkcwo+ZXjmeXX6RD
         6B/EsEbPfLvCcImo7Tz+LpQBb6+EicC5QMq1dxJgm1U148GPDfL9rQOWFxUjuiw1GYn/
         TpvqO8LAethLMxjwFB2pTR63vcYatsX7V0jv65TgyUQjcG3/0W5VtY20ZEZDbQeDIzRC
         QIGl3JX6OIpCQTUd+RQ2B14h1nSTWgNl7M4diYG6dlmJv2ii/5bXvpTgfvXgjQFhHDGQ
         gpcNjv8JISjmb5eqFyX1YWZ2TQzzp918wfmyljZ7tnPc88lN3hsOWA5oIbiecFvSS+DE
         JCsA==
X-Gm-Message-State: APuU4Z+NNePYihwVJk93/rz8ZCb7GuE6UrIaNVySoZ7j5sa3zYXQz5Ty
	YTKcU2nMbYREVQCSLMyjxbgud8ikbtMf54pFY4+aBSeXoNtdzDkLWf8R7N5RhQ==
X-Gm-Gg: AYBFou1kW4HUhTvDe2tjHP69kZxzYv4QaRoEZhuUTcmg3AK4qr1nc2eV4KHv6vvcx/+
	Ia6LrH8WVfDE/25Hz/SDY7xePErv/5SeUgUU7a4lfr3FU8XZFblko6/vBQa6RSET5cm2Hcvaz4O
	iLPw45apCw1cZqOVx/ljBunwNPOpB8dBh/BqTjtoUSmsNcIQ5rlDpkVOXkOs9B/G97/gMB9cPgn
	K0JwQRilLw/dfgunw3YLL4ZLQRhKxaN+UijGdMq/DK1kF/SbmcIudeF/X+V1xXn8+CthunpHzXN
	FCvfADd88i/IndGb9OMfDgc8Rk0xyQxGmCM8cF4moglao5JYItn3yvHCOnp2A/YLru9gQdHV4nR
	ZvkFIw6YUr+bt090jdBy7eyNIL4J47jD9QboSJO1sWs9Z/AgAjbSSDHjyt0uH3bnKE6JFPHvCla
	vZcGGhH/tE/+l6qCwFLGXoHv2uRm5wyVgX9PIfyucmkZbt7Se+t9a+Vm9EsQTOH7UohXqpChxS4
	51Ytc3iOLwQuaes7fHuDQIdkPrTlb8CCjcz2LZF1KwB6/hYfeLkk0Kpo3sPu8vY5bXvZcTI1jGb
	FzwtoHLXVGbpEOgZKTGPttY4+LUnb9ydsvYXRpqZK4yMrjvYsCdSRrRXsbs7XtsNr0MAka2IjZh
	bbHVFYfwgqcr/yXwdtYJv3VERaX01hkEXtAahZaZ/OraAlaw=
X-Received: by 2002:a05:693c:2512:b0:369:fa7c:aee9 with SMTP id 5a478bee46e88-36a423f54a1mr18011806eec.19.1793693314004;
        Tue, 03 Nov 2026 00:08:34 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428fa380sm41468466eec.12.2026.11.03.00.08.30
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 03 Nov 2026 00:08:33 -0800 (PST)
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
Subject: [PATCH v13 02/12] ALSA: virtio: Recover PCM state after a failed start
Date: Tue,  3 Nov 2026 17:08:11 +0900
Message-ID: <20261103080821.16983-3-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261103080821.16983-1-mynameisjune111@gmail.com>
References: <20261103080821.16983-1-mynameisjune111@gmail.com>
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
in one locked transition; leave it stopped when release or draining fails.

Always cancel elapsed-period work in sync_stop, even when no RELEASE
is needed.

Record the RELEASE obligation after successful PREPARE and clear it as
soon as RELEASE succeeds. If the subsequent RX wait fails, retry that
wait without submitting RELEASE again.

Fixes: da76e9f3e43a ("ALSA: virtio: PCM substream operators")
Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
 sound/virtio/virtio_pcm.h     |    6 ++
 sound/virtio/virtio_pcm_ops.c |  106 ++++++++++++++++++++++++++++++++---------
 2 files changed, 88 insertions(+), 24 deletions(-)

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
  * @suspended: True if the substream is suspended and must be reconfigured on
  *             the device side at resume.
  * @msgs: Allocated I/O messages.
@@ -56,6 +56,8 @@
 	bool xfer_enabled;
 	bool xfer_xrun;
 	bool stopped;
+	/* Successful PREPARE still needs RELEASE; protected by lock. */
+	bool release_required;
 	bool suspended;
 	struct virtio_pcm_msg **msgs;
 	unsigned int nmsgs;
diff --git a/sound/virtio/virtio_pcm_ops.c b/sound/virtio/virtio_pcm_ops.c
--- a/sound/virtio/virtio_pcm_ops.c
+++ b/sound/virtio/virtio_pcm_ops.c
@@ -96,6 +96,15 @@
 
 static int virtsnd_pcm_sync_stop(struct snd_pcm_substream *substream);
 
+static void virtsnd_pcm_start_failed(struct virtio_pcm_substream *vss)
+{
+	scoped_guard(spinlock_irqsave, &vss->lock) {
+		vss->xfer_enabled = false;
+		vss->stopped = true;
+	}
+	vss->substream->runtime->stop_operating = true;
+}
+
 /**
  * virtsnd_pcm_open() - Open the PCM substream.
  * @substream: Kernel ALSA substream.
@@ -115,7 +124,8 @@
 	snd_pcm_hw_constraint_integer(substream->runtime,
 				      SNDRV_PCM_HW_PARAM_PERIODS);
 
-	vss->stopped = !!virtsnd_pcm_msg_pending_num(vss);
+	scoped_guard(spinlock_irqsave, &vss->lock)
+		vss->stopped |= !!vss->msg_count;
 	vss->suspended = false;
 
 	/*
@@ -217,11 +227,23 @@
 {
 	struct virtio_pcm_substream *vss = snd_pcm_substream_chip(substream);
 	struct virtio_device *vdev = vss->snd->vdev;
+	unsigned int msg_count;
+	bool stopped;
 	int rc;
 
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
+		substream->runtime->stop_operating = true;
 		return -EBADFD;
 	}
 
@@ -273,6 +295,17 @@
 	struct virtio_pcm_substream *vss = snd_pcm_substream_chip(substream);
 	struct virtio_device *vdev = vss->snd->vdev;
 	struct virtio_snd_msg *msg;
+	bool stopped;
+	int rc;
+
+	scoped_guard(spinlock_irqsave, &vss->lock)
+		stopped = vss->stopped;
+	if (stopped) {
+		dev_err(&vdev->dev, "SID %u: stream release failed\n",
+			vss->sid);
+		substream->runtime->stop_operating = true;
+		return -EBADFD;
+	}
 
 	if (!vss->suspended) {
 		if (virtsnd_pcm_msg_pending_num(vss)) {
@@ -311,7 +344,12 @@
 	if (!msg)
 		return -ENOMEM;
 
-	return virtsnd_ctl_msg_send_sync(vss->snd, msg);
+	rc = virtsnd_ctl_msg_send_sync(vss->snd, msg);
+	if (!rc) {
+		guard(spinlock_irqsave)(&vss->lock);
+		vss->release_required = true;
+	}
+	return rc;
 }
 
 /**
@@ -338,31 +376,40 @@
 
 		scoped_guard(spinlock_irqsave, &queue->lock) {
 			guard(spinlock)(&vss->lock);
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
 		vss->suspended = true;
 		fallthrough;
 	case SNDRV_PCM_TRIGGER_STOP:
-		vss->stopped = true;
-		fallthrough;
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
 		scoped_guard(spinlock_irqsave, &vss->lock) {
+			if (command != SNDRV_PCM_TRIGGER_PAUSE_PUSH)
+				vss->stopped = true;
 			vss->xfer_enabled = false;
 		}
 
@@ -393,21 +440,34 @@
 	struct virtio_snd *snd = vss->snd;
 	struct virtio_snd_msg *msg;
 	unsigned int js = msecs_to_jiffies(virtsnd_msg_timeout_ms);
+	bool need_release;
 	int rc;
 
+	scoped_guard(spinlock_irqsave, &vss->lock) {
+		vss->xfer_enabled = false;
+		need_release = vss->release_required;
+		if (need_release)
+			vss->stopped = true;
+	}
 	cancel_work_sync(&vss->elapsed_period);
 
-	if (!vss->stopped)
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
+			substream->runtime->stop_operating = true;
+			return -ENOMEM;
+		}
+
+		rc = virtsnd_ctl_msg_send_sync(snd, msg);
+		if (rc) {
+			substream->runtime->stop_operating = true;
+			return rc;
+		}
+
+		scoped_guard(spinlock_irqsave, &vss->lock)
+			vss->release_required = false;
+	}
 
 	/*
 	 * The spec states that upon receipt of the RELEASE command "the device
@@ -421,11 +481,13 @@
 	if (rc <= 0) {
 		dev_warn(&snd->vdev->dev, "SID %u: failed to flush I/O queue\n",
 			 vss->sid);
+		substream->runtime->stop_operating = true;
 
 		return !rc ? -ETIMEDOUT : rc;
 	}
 
-	vss->stopped = false;
+	scoped_guard(spinlock_irqsave, &vss->lock)
+		vss->stopped = false;
 
 	return 0;
 }
