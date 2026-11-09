Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794201404;
	b=3wT49Ps/OHWIojgEDAee0SKzgfTM5maiMR0AsqeCjaYKj91wh1Q5/8djJQw5OheoCUNt
	 plNo5mXAgXZbHknnw324U/CmcwVfHSAp1+IgUooDZxoOa5FE8JHDEgTt1z/2nscgLfQu+
	 45Wk42c9rUvYZaePDYMHWQXUoLrz/S9TGv/uqE//UEkf6VroJyEifJOFIhboeweCDc+ex
	 jt05bgUObLWemuCg2TSIIvYUUxoFZKhKIrMUDuXuXdJoqYqA1C1IpqcdhSE/YmXBArpo+
	 xekypxAc7wQla68SyzeiRKok6WPftpCoDS8eh8GYTgQulLjCeIAxA/KxaeF7YB5S2Fg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794201404;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=lkK9x2YMJpVRIYZ2L59F9hCFi+ySsC5FbKeAqK3oOu0=;
	b=5qze6CDFMfu02QtwJsYjs4DZBbeemNSmNknVc7LDOf2DeAsNz+YvRvOc4PC1D2BYfolD
	 KF7yNHAdH5/FzfdqwIG4UINRO+vUBydqgXAhAfl+RrEg5Xvii8Eb3gLkq3yerJiIxBDsG
	 cWGwPA8RTq5tK2vVheuK/dPhU14VTI0TNV4a1yjI0jzJzs9e8vlhlxM1ZLZyxyg00XGeW
	 95H0/1gpjb26luYhes8KlCBQfacRpU/3jKbXt50JqA/2TJSmeM/Od4VwXELt1rfTZZ2xj
	 bFDouVTGV5Of66B3iFUXXvU9l346fCNcU7NyCPN/4kdLT//D7lElIyB9xhWYUKGHD0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i5Ug9wA0;
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E04D9606A332
	for <linux-sound@vger.kernel.org>; Mon,  9 Nov 2026 05:16:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E04D9606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i5Ug9wA0
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-170135e43c7so665134c88.0
        for <linux-sound@vger.kernel.org>; Sun, 08 Nov 2026 21:16:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794201403; x=1794806203; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lkK9x2YMJpVRIYZ2L59F9hCFi+ySsC5FbKeAqK3oOu0=;
        b=i5Ug9wA0ZbOzkCJKP/1/skCzTVoFR47FmFY2ZqM1L5RidwzH9Ds25CLS0RsWq4bsrW
         q07qbpeRYX19v2bxgFKHagmteFnhDwaF/S3iZwcWyj7m7OfSZQLR/tsDDVEqkElP+i2d
         5qZZH6Tj0sDuuuAU69vsnr5GsM1bgLwgsEjnghHmREzdexiahqKKVgCCi7c0B5F+YdEo
         j+6e0uzsaiQV/ny7RP+s3H4zFPkDPyqteQHGjGXKvkaG/6HtDayStgGphn+AObV4KqrF
         z6y/JxuqP4eANlrP6ASI3zgZ9l6Ec6x+JZeVl0RhZMXOg8mQO3bIh2YfjVNenQZRmDQb
         Yh6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794201403; x=1794806203;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lkK9x2YMJpVRIYZ2L59F9hCFi+ySsC5FbKeAqK3oOu0=;
        b=rhlMsoeLXVXWYA598LEZF3DEyXdkb0wctezGNE/7zwu5lzw4hhcrod0eMnUnHJXbG8
         5/BXu/60Atkme/c7L/CxfoRJ94WgrbpRUqnQ8h0FDHovV0Qju2s5aDzyg3jDq3P0WRrQ
         UITsd85kmKo+1Qln0+y2VW75bV9ug8tx8cmWkmhgcGfYmKojQa7ZYwAXHneEYXJAizw7
         cYDj74toJ/pWnVI7nyXj+X85Q0jjsHpOebRov+n5qp7IaV5zp6q8ukZokaEJRyzrJvvj
         NeRigjEGTPC5/zEg8ybHHmTbcAVfUmRqdoNsd8C0c7nmgmsvjP8VqVIc3EN726mt1Cel
         p3zA==
X-Gm-Message-State: APuU4Z+fpj5MnRffhjq74i/7qNOLiWDrKZTkCPfEOFIe/wAypYZfosQw
	HhmKpWH9MH4Vwu/++XgXqhODTOe/LDg/wJTHe+QCjPalDxYDU7VY2BdTDkEkkw==
X-Gm-Gg: AYBFou37tMW0vQbFSr+JM++ze6kD0oiZWCam6Wn0mqpjjq9G+nAKhPu3rCg0b8QfM2k
	kSbX2Bh+LQOc0LwtS7EakEugt1cGB56LJMNn8z1Sg8I1xw79dHf2cz7ZEyYy9J6Ysr+TT2FaZpt
	FOj28+UK21EZGNrjleMBIdvd9oUhZF4UR3VyOQpg3muoIGb6ZWpUknTrZHRP1M8CMmP4BXp2bKu
	loMcDlE8624/0KYPxNwcq2xId0OclmvpwxlDUkQ0MGIKrxQgEaC8692j4FmeQPDOQHHBVOUzTWY
	tW+QIQ+0m+hBTtssCf7yfDWfxh0NAWo+vujWen2by5veDkomkWBTyGx2obtP61eVoTBwzwPxxaB
	tZyU/g5FX2X0n971CZhTCyt9dUprt6gShXzdB612h/yataDrDUGYx+aDMtsqimhL0/gblrM9Xcs
	m9VN3nrSNPpv8j76SjA+BmPh3DkvNKs13UGPDgOfptKxZ4BYszCWxw32oryvbVl8HRI2qhkGVA5
	MpD3QFRoI2V6vwgiIHyHCcvgVpw18mH/ZxW30OTQ4mE6JKczKkxRUkC7j6Vtf42arX6aj3jQQN8
	/Qsg9Li3uIuMGhKa2pnojDatg5l50eeTf29BkU/TElMS1slpr28oBWsKRC/1EBkxHIQhjgiKrOB
	7h8YgZF2Yz/USSzsK7KIwBddfPtE4kN0+ADw/6Xg3nbRQEDc=
X-Received: by 2002:a05:701b:2902:b0:1b2:539b:496c with SMTP id a92af1059eb24-1b39ff1388fmr4549289c88.35.1794201402935;
        Sun, 08 Nov 2026 21:16:42 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b37314826asm11395635c88.3.2026.11.08.21.16.39
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 08 Nov 2026 21:16:42 -0800 (PST)
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
Subject: [PATCH v22 06/13] ALSA: virtio: Recover PCM state after a failed start
Date: Mon,  9 Nov 2026 14:16:11 +0900
Message-ID: <20261109051618.22506-7-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261109051618.22506-1-mynameisjune111@gmail.com>
References: <20261108235457.12688-1-mynameisjune111@gmail.com>
 <20261109051618.22506-1-mynameisjune111@gmail.com>
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
@@ -402,33 +436,40 @@
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
 
@@ -459,26 +500,38 @@
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
@@ -492,6 +545,8 @@
 	if (rc <= 0) {
 		dev_warn(&snd->vdev->dev, "SID %u: failed to flush I/O queue\n",
 			 vss->sid);
+		scoped_guard(pcm_stream_lock_irqsave, substream)
+			substream->runtime->stop_operating = true;
 
 		return !rc ? -ETIMEDOUT : rc;
 	}
