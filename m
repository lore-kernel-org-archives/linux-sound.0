Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793180507;
	b=AsknZ2kROfX63kKY05hd8GZRNXHprA9I4Y0F6MEgMQzzxM5nt7c/uoYaygZOCYsnwmH5
	 g0GSsYxGlYIa+jjwqNkUIejfyZkmp7QW84f1vuRBFVtIR4PZ9f6hkJxm4cMut4LqYxPuE
	 82IehZ5T15yAGwyMMhfhvj/n90Z4BGamkg6ral47F+LYRwMWY4AoD+7p1A5LjaY7UVzU9
	 uFDlGyE0/gIlikWRTW/2NlOynwJxNEXkZYoKB8bZdjHZ763h5IDk3wDMsa5EP0oZYwSa9
	 hD7+tju0WwSpQllCvd7xhRJ8XfEgOaSh+jGxH07+mStywql7osrePp1cn8iDI3yL3kA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793180507;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=cwJJNaSJlKm/koK5kjoFQnQ8cfxssNfTJLq5LnG8GkA=;
	b=Smpgw/4aDASF3mfy+KFESFzObkOJOLky7ZQSpiHVyKM1keO7n8vGq8es9hscPzvfQ2nc
	 5XnZQZry8z2pgXKh+TFkquZrCHESC+ypHJGaC4PRirHbYq9Uec87jUMTq3tNGNf0X/MsS
	 kOdNiQnXPBTnr8b8g9Z+GkGDVRVG5hYK06SX9Jx5jpYs5Zv5nLuSEW5+T0x7f2eumLq6Z
	 /TGXgrzBKOIdyksRRNLK1ejdAz6BfdeDD2sFjSva8SCY/+Kk/7zhPhYTpdhi5uQfbL7C+
	 XCZMFsLbIK8TXjL/Csgv8VmK/799Rtfroz1MpsFP7/NeKb8xhwq9ttlMDzTStzbQXhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vm1XrEKV;
	arc=none smtp.remote-ip=209.85.215.180
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70EC3606A32C
	for <linux-sound@vger.kernel.org>; Wed, 28 Oct 2026 09:41:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70EC3606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vm1XrEKV
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cc4dbda1e5dso336754a12.2
        for <linux-sound@vger.kernel.org>; Wed, 28 Oct 2026 02:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793180507; x=1793785307; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cwJJNaSJlKm/koK5kjoFQnQ8cfxssNfTJLq5LnG8GkA=;
        b=vm1XrEKVLlyO+ACYvXChwxf3UsS10+MpmZims/56Ff7NTOpWBuZzk5mZzNtyRJNq5a
         ilLmgDeRrJVGyHpHZuVThRThWKkSF+vBRT4usYJ2dviQV+SLA/Rach2rIxYNKh/glKo0
         Nvwnc9ms6TCgfUvRm1SkeD9KJ+K6iT0VW56Kj5P0CxJfudZiJ1hsuyAFrD8x4W7i8tB9
         IQEWdK5d4EYgN5jlQIvdU1ijtoUOx0z4G0imO2AOtiO84s1+/nCPMKD3XJNT4jaqAR4g
         xvQW7hwE1dp5AkfvX/1mA95Shz4nKKmpgqQP6V7eRtIuqD4YxRcIt+RUGCXEqofsbeeL
         RT8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793180507; x=1793785307;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cwJJNaSJlKm/koK5kjoFQnQ8cfxssNfTJLq5LnG8GkA=;
        b=eJMB1CZZf0NJPRvglPo7AYleP2I6qjVnxm9hEmai05pr47RgiXob9BXRS7zmLarK6d
         LfSWYu3+Gp0iUcvn+/Vy8im9hKQACr19jjE4d8kC4ZyDe1vcKMsxhgHKfto7wMHWoYo5
         iHQfMCteBKivcJ075YTGyhhLjSadd0WknVh0XM7m4zf5Zc5e2mLc43AsrF0jRsr5AdzC
         pRbigm1Y9l7pwe8rs+otiUaAtcvK+hA2mtOL/jV71MKa3JrSLf95eUw8B31QpajLqfwq
         RkQGAgPZFMzv+2vpi1NR7zeO1rk96ljfvJ9yDIpEc0N8RA7S0zSy70kMs6dCWyppJ+h0
         ZNmw==
X-Gm-Message-State: AFq9FYIGYh0hrcoqhNmfTzz8qB+ngViP8U1+8yFfDgS4vAD/ZhHptbFR
	TIhAN1xzHywibkCWT4tCZX5S+CStTyfQ62TBYeTMtOe2Kp6OOF2toV/Io01JEA==
X-Gm-Gg: AYBFou3qZb50D0EBmIJCzkhNjNaQ6QWUgAkkZlrY8YL19WRMmbpq0iGCgzZNBdIV9LG
	oh6UoUGavOUYP54fqjvn+xOFIOLkKQIQjqpwxaf8+tsqIHMBmklSttv7tFon/Qa2yBzWIcRXW5L
	nT8yOg6M841K+dxMKluE3C5PK7YSlPHY9nHBVpSWe1zqymxDrnekGBKCQqbdylJMFsqlUhCWF77
	XcqoOQalUIV6PAdmsbNAGdnd2akzrcHQUOzXPn1gXhxvkZvDAL3FoPNVGFuE1GRC+v2vBfWQppQ
	yLmRJmf43Ti4ptlormYNkff3EBY3UfLiUzxvaLyRQQjGWIHugCFrj0Ly1o3jp+21Bs4CJxrxGOQ
	D/4XNhc0Iesd/OIcifomifC/omWO3nUGoOOELgSn+62O78wV9U6pkt6C2oqMCUOrTLpZLD/XQUG
	CItBKhUzKN+qdggst+TJik3qGWa3ElJ9ozNGE3mnk0e2MOr3qpeOW0+6OV+Y+/D+O78l35mlayd
	32pXWRxtGadiEvPQYPrOYS278n9uT9MtBtlvANs3c/QAeUfy2pXk71SRN8nkVYDB4ha9auM0fjW
	9osPzu1YZOLKb7LspsvHcboqTB0PG5tNepX5acE6pa15fy8GG4xO8puApIvqd1OXuJ4QLanEUdx
	uWSrQq3De3yH8mP46HajrLZblJdgY50/Z1gF+O/A1zdC7RuE=
X-Received: by 2002:a17:90b:264d:b0:3aa:f4af:1e0f with SMTP id 98e67ed59e1d1-3ae57e07351mr1289738a91.8.1793180506752;
        Wed, 28 Oct 2026 02:41:46 -0700 (PDT)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae5a93b3f5sm2242377a91.5.2026.10.28.02.41.43
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 28 Oct 2026 02:41:46 -0700 (PDT)
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
Subject: [PATCH v7 02/16] ALSA: virtio: Recover PCM state after a failed start
Date: Wed, 28 Oct 2026 18:41:18 +0900
Message-ID: <20261028094132.20364-3-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261028094132.20364-1-mynameisjune111@gmail.com>
References: <20261028094132.20364-1-mynameisjune111@gmail.com>
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

Fixes: da76e9f3e43a ("ALSA: virtio: PCM substream operators")
Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>
---
Changes in v3:
- Protect all stopped accesses with vss->lock. Keep the RELEASE
  decision and stopped transition in the same critical section.

 sound/virtio/virtio_pcm.h     |  4 +-
 sound/virtio/virtio_pcm_ops.c | 81 +++++++++++++++++++++++++++++------
 2 files changed, 69 insertions(+), 16 deletions(-)

diff --git a/sound/virtio/virtio_pcm.h b/sound/virtio/virtio_pcm.h
index 8837dfc12828..8048b14e6c80 100644
--- a/sound/virtio/virtio_pcm.h
+++ b/sound/virtio/virtio_pcm.h
@@ -26,13 +26,13 @@ struct virtio_pcm_msg;
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
diff --git a/sound/virtio/virtio_pcm_ops.c b/sound/virtio/virtio_pcm_ops.c
index a40ea394bf17..970499fe419b 100644
--- a/sound/virtio/virtio_pcm_ops.c
+++ b/sound/virtio/virtio_pcm_ops.c
@@ -96,6 +96,15 @@ static const struct virtsnd_a2v_rate g_a2v_rate_map[] = {
 
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
@@ -115,7 +124,8 @@ static int virtsnd_pcm_open(struct snd_pcm_substream *substream)
 	snd_pcm_hw_constraint_integer(substream->runtime,
 				      SNDRV_PCM_HW_PARAM_PERIODS);
 
-	vss->stopped = !!virtsnd_pcm_msg_pending_num(vss);
+	scoped_guard(spinlock_irqsave, &vss->lock)
+		vss->stopped |= !!vss->msg_count;
 	vss->suspended = false;
 
 	/*
@@ -217,13 +227,25 @@ static int virtsnd_pcm_hw_params(struct snd_pcm_substream *substream,
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
 		return -EBADFD;
 	}
+	if (stopped) {
+		dev_err(&vdev->dev, "SID %u: stream release failed\n",
+			vss->sid);
+		substream->runtime->stop_operating = true;
+		return -EBADFD;
+	}
 
 	rc = virtsnd_pcm_dev_set_params(vss, params_buffer_bytes(hw_params),
 					params_period_bytes(hw_params),
@@ -273,6 +295,16 @@ static int virtsnd_pcm_prepare(struct snd_pcm_substream *substream)
 	struct virtio_pcm_substream *vss = snd_pcm_substream_chip(substream);
 	struct virtio_device *vdev = vss->snd->vdev;
 	struct virtio_snd_msg *msg;
+	bool stopped;
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
@@ -338,31 +370,40 @@ static int virtsnd_pcm_trigger(struct snd_pcm_substream *substream, int command)
 
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
 
@@ -393,21 +434,31 @@ static int virtsnd_pcm_sync_stop(struct snd_pcm_substream *substream)
 	struct virtio_snd *snd = vss->snd;
 	struct virtio_snd_msg *msg;
 	unsigned int js = msecs_to_jiffies(virtsnd_msg_timeout_ms);
+	bool need_release;
 	int rc;
 
+	scoped_guard(spinlock_irqsave, &vss->lock) {
+		vss->xfer_enabled = false;
+		need_release = vss->stopped || vss->msg_count;
+		if (need_release)
+			vss->stopped = true;
+	}
 	cancel_work_sync(&vss->elapsed_period);
-
-	if (!vss->stopped)
+	if (!need_release)
 		return 0;
 
 	msg = virtsnd_pcm_ctl_msg_alloc(vss, VIRTIO_SND_R_PCM_RELEASE,
 					GFP_KERNEL);
-	if (!msg)
+	if (!msg) {
+		substream->runtime->stop_operating = true;
 		return -ENOMEM;
+	}
 
 	rc = virtsnd_ctl_msg_send_sync(snd, msg);
-	if (rc)
+	if (rc) {
+		substream->runtime->stop_operating = true;
 		return rc;
+	}
 
 	/*
 	 * The spec states that upon receipt of the RELEASE command "the device
@@ -421,11 +472,13 @@ static int virtsnd_pcm_sync_stop(struct snd_pcm_substream *substream)
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
-- 
2.54.0 (Apple Git-157)

