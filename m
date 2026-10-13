Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAF87397922
	for <linux-sound@vger.kernel.org>; Tue, 13 Oct 2026 05:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791869444; cv=none; b=Uqiyf7TZtsAY9Z5NHe24byJmWuh3cmS5/TOhn9/FOhRWsZ3cPqKs+UFNby+9f0pRxBW/zYNrHPuIAGyvYR+dMWTAHu62xMcnuEkTzakspbtR3iLIg/zC84m618EPokhJ/btqnUWAP/NGozjtcv1Od1e4bDxwZ5nhzigPxJw/Kio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791869444; c=relaxed/simple;
	bh=q3nEYlWrGMesNp2ijmu5al21Kx2H94q3NPm6x8zhFDs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KMnCu8nyxGJrq5LJRqADUZ4uUs+9UDAk31wuUCqp/S7ra1F0ftbVQPnfXhZ+/Zhox9PUAIPkgpVP2Ct0vwSMttab+QEGUo3/x80swdnYz+rL8mVl1f8HkeM4odGKQayIowRmjmCcFTDcx8i3JUJIVf43DOQ4w9IpNhTaYkDC6Uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AzqAP1ZT; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AzqAP1ZT"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2e8ad5b31c7so12511965ad.3
        for <linux-sound@vger.kernel.org>; Mon, 12 Oct 2026 22:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791869440; x=1792474240; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EZ+PQK4JXB0NEmhfXifpRZfnQrbnZ5qKFhfS05wV4xM=;
        b=AzqAP1ZTQNzy+gOrt29BOq2z6h37XIT1IGMViDciznC9rF1u1y/FBz0AN2yD8XSQ+/
         xw154jTFoBVQn6VT5BDL55jtXsIN6KPBTjaEwbAA9q27EBSwaleYbJvrZw4LF9H62ZaD
         h2SmCFsZo9gzCBujVg4Xuj8iO7IPUKkuY9a1IQ7MYW3S25dGswOumCDG5TUL1fdc2q6m
         WhIGGvKbAbK3UXJQbLyNfFxYu6dS0TUQdekSMjjgzli8SG/BpscQFY/pYBNqJFyXhfJf
         DWRC0jCo4+n55YvL/8sMiqTvEY7Rz3BH86zdhA8/O7vAaIz2mBC2LGvY7hCa4AMR6nU8
         SaMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791869440; x=1792474240;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EZ+PQK4JXB0NEmhfXifpRZfnQrbnZ5qKFhfS05wV4xM=;
        b=1wDEAHNCkUuh5pgF82mvKMV4AYZm+sRMMJ6WPtV2X6vk/Kefe4t2IeevJbzOVDYH7m
         qYZVesEzrdHZo2/zFmWooq3jlY0OMloBY2Qnqs52HnCI9OzqryYbdlL6zWDm6evQI+JB
         ToyUacTXaKtIiKiR0KlOqUwnSqQ9rcTKqQemnVQC3qHqfvpVY4TDBtWI2tzZVD0ANydq
         X3KVaI0VA7ZQWcwmz1aM/wYgAE2hvqOA2YLb6bUBIPDrM8brS1oZzUou03SuigaZyYfU
         vo1NcTDqdMPeIsV5Y8e+3rwB/AbDR8vxTAbC2EYrvxPM9Kb7WdI2BuTprn5U8YhtG3QC
         pUEA==
X-Forwarded-Encrypted: i=1; AKwUvBxJ6Ef4XMiM7aJvcUsJHVkdkfttlTrq8MGgzG4Cp3Hwm8gEbNGkHxCeRafeLPANBvXBnffyFlrsWr6nKA==@vger.kernel.org
X-Gm-Message-State: AFq9FYLbLBzsFnlsPnjPYPMjzo6exA2w/0lWX9yLBkXl9zED1G8SjakD
	XcYFcW1X++bS3DRPhWjjHgk+Nqu8VLc1Ic4ZLx2WEZVJWQjCtkSBbKoj
X-Gm-Gg: AYBFou2htmFWrSrKQlon7FfuaN92TW3x5ujGp/5Z7M3FA4tCMGqCey8yBYCM3rlI5zY
	YibCpXGnhc3jLYvLUhacocgsRMEArdk/kMEDLnjkhpCUiY2fiG/FNq93scRxgINxfSnUz/DL+rU
	2UhbTulJoIvhGEoHiQYF+5EQTMtJqlnuFSprcnKMQoE6cpkYTC7nl8a0Wz+lsDDrk2y68VRYoCL
	YWf85p6kblRFaEoVZ13bI3GXn1zi2CPvdzEdnU5EEfLQjtgK6iB4//tm+03SoS3EZl2fyZum36Y
	SDkLwBUqQLANQKcPKQiPmCElJx0XGnPPsrJHEzJ+TpfuUJOX0DXxIjX+AXHahSrgOV8s34HhwPx
	ey9LJBRzBLWFQWPMhAY4ey65lbJYLD3NIuh8uO1rpgTp3mnXoP9KXh173I/UWz4APGgt2i4QxgK
	R26T9aOpigY7xXFV9GZtjhs7xvVL6d453IOk5pxjEPgKRn+hCHSmFhult93sNzjr107a+9yOZOF
	Mg/EfONrnFti/tW493R/L5uZUe0eDl5QbhbDr7U2cFi/9Z3zK+iDZYe0YDnW/286NJY25hkTNgi
	fbKAxtRMHGtc3edqvUbrKdVt4mM=
X-Received: by 2002:a17:902:f54f:b0:2dd:c100:b2c3 with SMTP id d9443c01a7336-2e842ce0ad9mr91612705ad.46.1791869440083;
        Mon, 12 Oct 2026 22:30:40 -0700 (PDT)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422b8cb6sm50820915ad.60.2026.10.12.22.30.37
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 12 Oct 2026 22:30:39 -0700 (PDT)
From: Joonho Lee <mynameisjune111@gmail.com>
To: Anton Yakovlev <anton.yakovlev@opensynergy.com>,
	Takashi Iwai <tiwai@suse.com>
Cc: Joonho Lee <mynameisjune111@gmail.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jaroslav Kysela <perex@perex.cz>,
	virtualization@lists.linux.dev,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/5] ALSA: virtio: Recover PCM state after a failed start
Date: Tue, 13 Oct 2026 14:30:23 +0900
Message-ID: <5f0fd9cf601921d24f07df051f990283e571607c.1791867377.git.mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1791867377.git.mynameisjune111@gmail.com>
References: <cover.1791867377.git.mynameisjune111@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Capture trigger queues I/O messages before sending PCM_START. If
allocation of the START control message fails, trigger returns an
error with capture I/O messages potentially pending, but without
marking the stream stopped or arming sync_stop. If sending START
fails, trigger also leaves transfers enabled. ALSA does not run the
action undo callback after this trigger failure, so the normal STOP
path cannot be relied on to drain those requests. Retrying START can
then submit the same capture messages again.

Disable transfers and mark the stream stopped after a failed start,
and arm runtime->stop_operating so ALSA invokes sync_stop. Make
sync_stop send RELEASE when the stream is stopped or has pending
I/O, and keep the stream stopped when RELEASE or queue draining
fails. Reject prepare, hw_params, and START retries until a later
sync_stop resolves the outstanding state.

Always cancel elapsed-period work in sync_stop, even when no RELEASE
is needed.

Fixes: da76e9f3e43a ("ALSA: virtio: PCM substream operators")
Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>
---
Dependency: patch 1 notifies capture messages successfully queued before
a later enqueue fails, so this error path can drain them via sync_stop.

Validation: source-extracted ASan/UBSan START allocation/send failures,
retry gating and sync_stop recovery; included in the W=1 builds through
patches 3 and 5. This commit was not separately kernel-built.

 sound/virtio/virtio_pcm_ops.c | 63 +++++++++++++++++++++++++++++------
 1 file changed, 53 insertions(+), 10 deletions(-)

diff --git a/sound/virtio/virtio_pcm_ops.c b/sound/virtio/virtio_pcm_ops.c
index 1091100a4c98..f2362f0dd80a 100644
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
@@ -115,7 +124,7 @@ static int virtsnd_pcm_open(struct snd_pcm_substream *substream)
 	snd_pcm_hw_constraint_integer(substream->runtime,
 				      SNDRV_PCM_HW_PARAM_PERIODS);
 
-	vss->stopped = !!virtsnd_pcm_msg_pending_num(vss);
+	vss->stopped |= !!virtsnd_pcm_msg_pending_num(vss);
 	vss->suspended = false;
 
 	/*
@@ -224,6 +233,12 @@ static int virtsnd_pcm_hw_params(struct snd_pcm_substream *substream,
 			vss->sid);
 		return -EBADFD;
 	}
+	if (vss->stopped) {
+		dev_err(&vdev->dev, "SID %u: stream release failed\n",
+			vss->sid);
+		substream->runtime->stop_operating = true;
+		return -EBADFD;
+	}
 
 	rc = virtsnd_pcm_dev_set_params(vss, params_buffer_bytes(hw_params),
 					params_period_bytes(hw_params),
@@ -274,6 +289,13 @@ static int virtsnd_pcm_prepare(struct snd_pcm_substream *substream)
 	struct virtio_device *vdev = vss->snd->vdev;
 	struct virtio_snd_msg *msg;
 
+	if (vss->stopped) {
+		dev_err(&vdev->dev, "SID %u: stream release failed\n",
+			vss->sid);
+		substream->runtime->stop_operating = true;
+		return -EBADFD;
+	}
+
 	if (!vss->suspended) {
 		if (virtsnd_pcm_msg_pending_num(vss)) {
 			dev_err(&vdev->dev, "SID %u: invalid I/O queue state\n",
@@ -338,23 +360,32 @@ static int virtsnd_pcm_trigger(struct snd_pcm_substream *substream, int command)
 
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
@@ -393,21 +424,32 @@ static int virtsnd_pcm_sync_stop(struct snd_pcm_substream *substream)
 	struct virtio_snd *snd = vss->snd;
 	struct virtio_snd_msg *msg;
 	unsigned int js = msecs_to_jiffies(virtsnd_msg_timeout_ms);
+	bool need_release;
 	int rc;
 
+	scoped_guard(spinlock_irqsave, &vss->lock) {
+		vss->xfer_enabled = false;
+		need_release = vss->stopped || vss->msg_count;
+	}
 	cancel_work_sync(&vss->elapsed_period);
-
-	if (!vss->stopped)
+	if (!need_release)
 		return 0;
 
+	scoped_guard(spinlock_irqsave, &vss->lock)
+		vss->stopped = true;
+
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
@@ -421,6 +463,7 @@ static int virtsnd_pcm_sync_stop(struct snd_pcm_substream *substream)
 	if (rc <= 0) {
 		dev_warn(&snd->vdev->dev, "SID %u: failed to flush I/O queue\n",
 			 vss->sid);
+		substream->runtime->stop_operating = true;
 
 		return !rc ? -ETIMEDOUT : rc;
 	}
-- 
2.54.0 (Apple Git-157)

