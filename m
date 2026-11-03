Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793664257;
	b=VoIgazkCWEXqAp73LRLfKfAlfnSQ41xPaU9AEcfcyEYIZZZqKGZe5WkkzBkDYNZ75SWz
	 EZbtF2xUcX1qv99JKV94qRBBwCY0bL+nCbe9y5oVJDWyBwsiTSU9SK9mXMygKrKuHlXu1
	 OWhfxVxyfh7f89HQOiqJ10DK03rfl+4NwnXXP0A6WkByt6o1RzxX7tl06jzxP7n2VFCD5
	 5tZHsXo867gLzAso8M9GUxUSX1pNtEAlbtukrs1d/cLfkHtwzs8hwUy1SDDJpXKnD1726
	 iplRii9ODqBT7H7l7DB5zb8OH4Y94E1aDsFJGk9RIKLTNnJDCfzkQr5eCo/tL/bYDdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793664257;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=pPsijI/WFroQ3WU8JWBkdFg+dO3cPuO9jwy6Y07G2CQ=;
	b=ihHFcpA596P+KuVGcymUpszwdMXvjnFgwCdZv0tqRfNgIrZp2KJJCbhy+wn4Wccmnmdg
	 L3TWD7O30ZimOXkzhnDg0W0VBOqJC6mBd/NE2gG4c7O9zeMQVwXRAXM5kq3zN3C5a4GfH
	 aFKHa/UB/q2dV4QzaK+NY2IHbfS25rNOzROhr54mh2bl7pXz4lvUwQ4Bi+Z+hRnzD4Y0Y
	 PI/3w9m1CAv9qm89xb8Ei16KXA7qyNkryfwTntywxNX1WypT5MHk6g/p95+9Bid5DpAIi
	 TmS0aQGdkzkjgluPSQLYwhx9f5bwuU24kFawgdAOdY1BrngrKgF2mZUcPlqxJtFgHZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="ZQUz/2/L";
	arc=none smtp.remote-ip=209.85.214.171
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80623606D80A
	for <linux-sound@vger.kernel.org>; Tue,  3 Nov 2026 00:04:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80623606D80A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZQUz/2/L
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2e8f2c3ad6bso22036645ad.1
        for <linux-sound@vger.kernel.org>; Mon, 02 Nov 2026 16:04:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793664256; x=1794269056; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pPsijI/WFroQ3WU8JWBkdFg+dO3cPuO9jwy6Y07G2CQ=;
        b=ZQUz/2/LkaFJ5t87SwgV+Ss4Vymu21X/tqN7cyzYh4EMON3ZlzHW6U7r1HtaORJfWt
         p3Hj2gA5HWqaoHG2l+UHLysKknIRnt29eenmi0qiAEeZOHD+MtBRFfObS8cH5rZTFvue
         knzXOfGLml9AhIlT6TAttNUL99ZpoblnzP7a9TFMi5tPDbFnmSv7Bd+AQfRDlSpgVpG1
         8PSFdByB468LzGcEapWepEyQljnXrCF521AjvFO5B07njpO20AjYK0zWGqOIhRyJCD43
         5XoYetNYtUHuWQ3gfrRjVIK4chweMlrl/LdR62XeLDgQznyBE6u/uMgi9vp9Z82S8cXe
         9Esw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793664256; x=1794269056;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pPsijI/WFroQ3WU8JWBkdFg+dO3cPuO9jwy6Y07G2CQ=;
        b=YAE2eMmpIytf6U6fddXUkGi4xxcSfFI8+dMcT7KGX1fgYM+KHNFSMC/1/RlRqQnj86
         o5ffmmEobychrh7joAwXl1NODAkNJ/AFxX4whWnVm2Zu+Kerh2NkjFSnKw218CCjMpEG
         o9NTRtAiR3vmzJ47/aZyAM+STWb0w5xTTdq5tOwtKDhSz6QLfDa14qAKOlrb/MRXKEDj
         OhsGxvrgtAxlgwJTVsA6UEnHwN+PvpvFhg1k15wbiTjr3mEbQnQ5YLIySuMOsis4dlPW
         VinfJLKm1CtofufhEGM3NyprGgrswcZh/7MfNDr4sgusQcDg4eksvhVSh7cqbCHRcAqM
         66mQ==
X-Gm-Message-State: APuU4Z9JEpTdQI7v8wYhSWrkFhNduxYvjcWPCwGss5ZVDjguqjzh9+yV
	x4fUBtWANRgqo5drr151DfJaKfvhr+3xV4vF6OzbaD6wlJGOGrafJ46vl54g5g==
X-Gm-Gg: AYBFou1/XtrppWtoPbJ8eVbFvWHNXUiWDyeizP+xEhxUjPIqHdmu1jgMhQEiiXOzURD
	4ly7c/4tGQsN43K+rBDK1nTbwJsJGuLIF0ADxa+GeZgrp+kMrsPh+PdzMT++uany3+FuPqM+HuL
	6fFZBFrNuljhdEhYLwAgL4955+t9zZ9RM8BPuZAf2TuzbsnLe0yc6YifkyRSEBsKkF0+m7Bs617
	iR4iN2BGPDQH7fEEBqR/iv4dpO6CvpGC0bkf/9QF3FQst7Fnipq+OBTCkHKkly/aAJvPeQ3GXWp
	DzxYqQFiFa/N5ZOtVpz6rpk8vbGUhWs2+C/7oBDg+WY1Zin7dinyJi8QctZgEzUXp8x13pjRMuN
	FFB1gjc0LNBKTv9dS3kLbNJYgc0dTvIHhACb2YEesX/NlKFyduxqJRrktUUYcgfMskm8qouZcWF
	9m/GkNyAWwJDKKV66+rg5sFevTmhWqdpu6CKiyJevWuaCuLa3z3jvDRrYOpIhPjNGsTZoXWKnmn
	XlY9XiAfheT7LbVEbBZcyFj7HvNvyla6pkL0mNHyJkF9ggWroIE/jtOBWrPMWuq/OzmfwTl88/n
	60WX0B5gJmym9r4FI6etlZsr++zFoj6xQ9vqDNP9KTjjx0WRHpchiflOEY/GhLgoFxzH3MZzxDN
	Az3SADWWkTrLdP3xO6zmgozNHZAgbSZ58QhBkc9miTjmOAoA=
X-Received: by 2002:a17:90b:53c7:b0:3ac:7e3a:1033 with SMTP id 98e67ed59e1d1-3ae897c5e5dmr9665911a91.59.1793664255901;
        Mon, 02 Nov 2026 16:04:15 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c6b3493sm1339225a91.13.2026.11.02.16.04.12
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 02 Nov 2026 16:04:15 -0800 (PST)
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
Subject: [PATCH v12 02/12] ALSA: virtio: Recover PCM state after a failed start
Date: Tue,  3 Nov 2026 09:03:53 +0900
Message-ID: <20261103000403.67106-3-mynameisjune111@gmail.com>
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
