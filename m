Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793837380;
	b=1HR2UO8BQywwSaGTh+idwSdbCMjP3dBUbwlheWxXtmysUGL9n9yXeKQx0wzI05rdjbAl
	 FTAGVQnDhS5M8c4cLGUeiXW4v/aWumNe5I7uu8roxo6DRSQsojUaCh8h62xuV2zsuXZPh
	 ozAI6iil6TwOGMqwkxcZaNzOuu7z6cg8A9JN6zqvkAHyOe/RLjLioH3QPNs0K1mVBiUPx
	 4Rr5j5Te8YLTL/HiAyRVhCrn1+WY2V9RWl2XRRwOS8MNP+wLsKO08b9tAfqMd0OCEAMdN
	 yz3kQkA6SkVcZgRQigd1y+MU5TpekvVncRQVAX2eOKWtoHMbcwEO5AVytovutxes1YA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793837380;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=4/DGjjZzZ0GRb1AC8/DxRH3JZkBlPhNEmvZ3LAb6pIs=;
	b=VLBASbPWoYK5ztCJqaTOm3NMdLl5bM/TqM4dvqtrX1cMyIGe6vgQRqTZ+avIz97Vo4JQ
	 K+a3niyhzUDWefvrE48yEWIz1uXT+KGjsiT/PUE9w/wbH/RCp9cOcjvXB6Y4Nkj9EvZOG
	 saYW7Qc5SErPUchsWhXP5TBrAVxz9IngcqlV+x4BqykSmQIy4nkSYx08OHphvh2wAHzoO
	 sgTv9+W5CqJ1gPr/ID6k5wpkH83+Sq9779fWBpYDMOfnycTfF33U45ljodSkCgpeIY5gC
	 t5wZrEFUrTqmwCuuH6u1vvR0bL9RlYoHHjoUI7e/59gsirxivRx/VGYbN+v/fp9ckXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OKGOLNsO;
	arc=none smtp.remote-ip=209.85.215.169
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61AE8606EEAF
	for <linux-sound@vger.kernel.org>; Thu,  5 Nov 2026 00:09:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61AE8606EEAF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OKGOLNsO
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cd6acc50b8dso539744a12.3
        for <linux-sound@vger.kernel.org>; Wed, 04 Nov 2026 16:09:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793837380; x=1794442180; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4/DGjjZzZ0GRb1AC8/DxRH3JZkBlPhNEmvZ3LAb6pIs=;
        b=OKGOLNsOdZGs3aFVWOlkhdKPQxaGGelKpNSQ1l5zSUKP+JL99Srfm/or4dauJcOgbD
         UCyeKUWlvZRfeKlAwJyP6scpbHsOq2uAaaXDGITLs1Wff0Xolat8KYUGkaQcW5WHMudr
         zJRYnD8qCnYFaI7sQfCXunKaS4QQ1iP++s8dPgV0dIfBlJvgO9wf63RMWZfWLX8xmnDq
         ckMz+JxulRy8caLuqFs67ySyF+90rpKxLleox1/2kNT5djthxBy/5hZA7uTIOAvJrjpF
         m1sQ4bN6v66x+KBVCnalgPmScUWlyph0WNOhhmAvayPhc9VyBeOjkKl0PIJ0IKvnUj8N
         ilbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793837380; x=1794442180;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4/DGjjZzZ0GRb1AC8/DxRH3JZkBlPhNEmvZ3LAb6pIs=;
        b=F1Pxi2Tg0tlU1/Irt2brXxfdA75PHAGrbDL2VNLJd0eLvlg7MjhwJ3I3lRPE0EMd1X
         TM5Y4orlfubjA5PHskh7GWC8yvOeuwmUJ0LNcKY32elNaXI4GesPzg2JWs7qpexklLE/
         SMp9iXd7g3iUCichDmIoZQTbZMVOws/40BXzHtKNJwWOp5NC/+AqV1KU7wQnhaNw+zeh
         p1d1jKccu3wm46PyLvxlbUsNPA7OTm/8GEwzk4AW+6UTqtfmUJRqL8beo6R155qom7tZ
         HgarpSbsEEpdMerKjjmjJRTb3k7G7a6LwHNoqaCY0aoejxNstU80QgxKS27k/GdxzAzr
         U8nA==
X-Gm-Message-State: APuU4Z+tckCLUeFK7BTsbaU0GEIwnZsUBALeQu+aBbZn5sNEKfhUzvWK
	+2YCScSPOcJJm3U10y7olaVSlOhkdxORY/UhPV1ohxqafLEbCumGRpslFpA29Q==
X-Gm-Gg: AYBFou3KWDL1JBUgZU1Um95DB1a4zcODid3aRnLlSmO8mitQFgy85EFt/aK/XcN3XEL
	DCeOLDAkHCGT7tuELEZiTrWYQgcwIO/rYNwGoP7s/oLpZKCANE38h2qndE7VGMm/YyZbknzNK2c
	g2IL5Fe0c6aNvNLIYJheyUbDddwm1ePFAQ+mIZ8zsInD2Ucgzw/AA6ldx06wT5diK/QZZDpCQkl
	SBvUwWsVk4SUhV4UX4O4pDfn1FPDAODofyzSPYi6NKJTr48l4DQULcq2yLiWxcYeaSs26iMujHC
	5Vtj+csQyYuL0npsOxuOgf379I4Me33KEliBJaGuX1G6kGSp+nnC7j+rypVZq4Q/Fjmhi0P3jzQ
	ytKyt0uaB7t9fIFtKKnG03R0C6+pTgJ8ky667DGJfXY6bjuEvlAeSSbUMziK0oMeiJxSCufueuX
	oW9pxtVLvkXW6NaR4/PfAcFkN2TEc+At8TaWrSxkqjY2jwgIz3LN3gwPGre7pdV+2gK5XK53yS/
	VOI8o27Sny9mc4tDtjTZ7HurVoaBnP5gn5aAVObImDx1AaFUSo7GQASkdfQY48GHRgu2jAERVqh
	+hTLhfJl2K4p4Qp71aWBVhvL+1a/ErpUg5+6q3lKiBYbi5JzcupIaE6r+pLymuGjcdtV/T9QoSF
	bqS+wVyMzO89X4xbwl6fBduce6vaOwEbgDtllHYFI/YzATE4=
X-Received: by 2002:a17:90b:2246:b0:3a4:b8dd:1447 with SMTP id 98e67ed59e1d1-3ae8974bf64mr15546718a91.34.1793837379581;
        Wed, 04 Nov 2026 16:09:39 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b323c18fsm897208a91.4.2026.11.04.16.09.36
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 04 Nov 2026 16:09:39 -0800 (PST)
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
Subject: [PATCH v15 05/12] ALSA: virtio: Recover PCM state after a failed start
Date: Thu,  5 Nov 2026 09:09:08 +0900
Message-ID: <20261105000915.15177-6-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261105000915.15177-1-mynameisjune111@gmail.com>
References: <20261105000915.15177-1-mynameisjune111@gmail.com>
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
