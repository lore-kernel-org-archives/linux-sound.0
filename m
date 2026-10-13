Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E0FD3BFAE2
	for <linux-sound@vger.kernel.org>; Tue, 13 Oct 2026 08:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791881884; cv=none; b=YDl5R63/F+Qa+H7Zm0LBneyXEspym1x2HrA0tEAdimyzR2o5rw5wJUViXpBxJxNZPKmOoIAWQELhHBOsyRNHY8M/hKuesEDMYosTFf66hoRfpebj9LR97Di+OGbQEmNnbx8kTO0q/W/eZCeaCNG5tf6xQfYRtMFdzbdhu6/cI9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791881884; c=relaxed/simple;
	bh=OmZpX8GrfCAf7Hf0Cn4bWQVa7tp3Yul9KfM0YtvJ+gk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DU8RzdBVC/esjtjRgRzLA2HbNuWXtU8IUqDblKsFvvid95+vZeMK089Nv0/KcfRfX/EDEA1awQdBbbu5iqRY1jOoUT8krWuoqY/UERA6Nybqfy59LMn5bhA6rv5hTQKOhcjvLk1+au3/mDcofizmrfUxO3r7ZaEtO7M+AkdQDfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hHdr2Wow; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hHdr2Wow"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cc4aa18f9afso987402a12.3
        for <linux-sound@vger.kernel.org>; Tue, 13 Oct 2026 01:58:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791881882; x=1792486682; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cwJJNaSJlKm/koK5kjoFQnQ8cfxssNfTJLq5LnG8GkA=;
        b=hHdr2WowsqiAPlgifHqppulw3smFMx28BtEcKxxtaR+8aYIWAwPWHLZNiFHB4UQYaN
         vtIZuXFCMlYTwSF6RtxMl16ABvM0+Rd3KixhCRZ0HHf8enSZ0RCIGOajW/t/NMfkLixU
         UDprlwowg0FEw//SamYMXlRJxk8pKyJE5oD+wcn4qKHcFLywK4/p3A+ef2tRaBWeukb0
         lZLsI5PTQ652VO/EYNqXOMr9GFI874K73UTXVOr635rneNHvy7F7qhM9XJamY2BO8eyv
         UaUa2T+vj5tIgsCCj1543J2MHSKqGjeompqtkU1fpEcN5VL88J9IzvZMopwWWL0855ca
         b7Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791881882; x=1792486682;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cwJJNaSJlKm/koK5kjoFQnQ8cfxssNfTJLq5LnG8GkA=;
        b=Rg7z50GY5TvEvr6MiwmCte9LzHmjqKpUpI8H0g3W8XRDra/VEr03a3UakuLlClceGW
         aZPZtlQPMNDYZmnLVhw6fdDO2pQ5lJzlBZKSkqLgT8if3ZcQvJSsfChjJilVK1sG09le
         /EukkL+uDcHOJ6wc2c9+hgBrVss+cOCVcUevYcaUP3q1n5letePJhYafGejeDqcGEQHR
         +cdx6G3jp6gMgjmlBLcRR0iiXRRupJSOowezmSFMr57rYgiiZNrGx//RmI2f7rIUucvC
         vPSn4rusO9LHZdnKeEH5Va7QnJpDLl3hJbEyiPLLn7omLZtWNkIHSLDPAnjY6SPSxc7+
         RXfA==
X-Forwarded-Encrypted: i=1; AKwUvBxKLnmL+DA5mLf8Il/TkMCQ0UGUuM772aGI2al7zk7Bv8Ypu5cGA6f/8hJzDZgxEkNacmsauv809jTUxw==@vger.kernel.org
X-Gm-Message-State: AFq9FYJJfxqyjW9/7p6jjrwH2xkbG/C1AFvcdHjUT44w1ClCF7gTDwFi
	10ZzGspHAfjsWxWm/uuj98gm5l23/TD9Lv7oy/U+tK21r3rWow3hoh10DPg2Sw==
X-Gm-Gg: AYBFou1A76ZzGxYLQLcNaqi4Ei0uadCtjeA/7L5eAksPtglIjHp2c3QIqtPGpDndTJ/
	kZRoZMS6VFbaSsPenQwi3tWUL3XJm1OeQRbyxDN/jC4lBe+OzxiH+6aezgqjOzHs9tfUXiYptM7
	ZyjqhNk0nqTkLCA1xy4BkdpxevrGIKR0ZJRb5fpwpwMt1YoP1hhpQiJapwXbwnVRM6/ZTgZQgWx
	hicxTAi5jMi7o6VQbXDtLHUtEN1ZVjuPHOoyUW/gPS/ASQq7r8Vs9PEYHMKbCeqe7hooCheFRvn
	vShxKvrpYAU8dhRYMeIHwTP49HXuwgtScOBrC4idzcVbr1ykP476MrOYLhOv27dD/abPzJWfJAp
	WyeszC0WjN6SPNoR2Qf3tVE2/G3a6ix/c2YOmwNCVUXBfOmQVdrkxwBeD83NUFIevh0mMx23Dqn
	FRmPSbt4pWp9LP0J1J/4MZL/dMf1PvpyyVoYmVnDqoXJKgPSWeokPYzFXcKKgo5Z8wXPkJN0tY9
	kYhO/g6i8RRGDbDk5+hw8zK87vZnhnkDMOr1H1YL9bSMnJvLRI9u29sZqVuYgv/6s4IwKPcoN7P
	NoXBvSL15533LCk1
X-Received: by 2002:a17:90b:390a:b0:3ab:413:49a9 with SMTP id 98e67ed59e1d1-3ab3a932609mr11394399a91.50.1791881882242;
        Tue, 13 Oct 2026 01:58:02 -0700 (PDT)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd6063d31dcsm1838592a12.3.2026.10.13.01.57.59
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 13 Oct 2026 01:58:01 -0700 (PDT)
From: Joonho Lee <mynameisjune111@gmail.com>
To: Takashi Iwai <tiwai@suse.com>
Cc: "Michael S . Tsirkin" <mst@redhat.com>,
	Jaroslav Kysela <perex@perex.cz>,
	virtualization@lists.linux.dev,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Matias Ezequiel Vara Larsen <mvaralar@redhat.com>,
	Eugenio Perez <eperezma@redhat.com>
Subject: [PATCH v3 2/5] ALSA: virtio: Recover PCM state after a failed start
Date: Tue, 13 Oct 2026 17:57:49 +0900
Message-ID: <e190adbdcb15294b8146cc2f64c43bde5e6a28ff.1791881787.git.mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1791881787.git.mynameisjune111@gmail.com>
References: <cover.1791881787.git.mynameisjune111@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
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

