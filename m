Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793252649;
	b=kuWIOUZrgk6sOukvvmjjuEzKlSK/2FK1UCxABaIwoHF0oaxwzsG4MOYGbv5o3JFiWHlJ
	 yeIRR+JlShk8BmKNT6zfZFGzahdXsjgFtsDPoaGGQeGPJ0VisSR3ktUA0WLQiaAqG1dCH
	 Uy4CIbNh2lFfczYKrLcjgok56Efzd1Id8avxkPE44jzeRYVMIquAWVQKCNFLwYMZaH+15
	 IzM5LHcXHdvM4K8hqByIt4TKSFPULzGeWHbz3pMfhYsn2REENF00Mjs8geb6dl/zJDeij
	 OtpC8RwcGkphNIeU/UUht18QpSVeoxFu/iWcY+yxbMG771cufSQ1v2cMop5cSYuMnGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793252649;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=OpwHiZYTLatyvvxjRUM2hdadeePr4pZBh/g5i6VGeuQ=;
	b=FSMF+rcgk+od9VrzU28/L2VFEn5ysnGu7kfFlJq7T2nIgv+u1785P9QlkKJNReIwnSF8
	 Lk0Rm3uObdKGCGackcuZfBcOIb4hPtNbwpFm4g9BzbXF8kFm+AnPUv576qWkv0TFg28HY
	 v5NxhrQmRF2a0v970RNyC5yW3ONSASFhOGie+58TsaaB2Blq8hqHtjIr//+1QSWQB5ZWg
	 X0IcAskMtRjOhf5ev/CiQWNEmsbYFvwxD0eE7L/y9vPzPIdzzDUhG4vK6DHZBKKvygwCn
	 LvJZqFfKtV+ECUyIXFy78xVBDKHB80IOHTKfj6joDxbfJbbon0Bpk8ymckS70AhSSpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bDIX1sMw;
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C5E1606A31D
	for <linux-sound@vger.kernel.org>; Thu, 29 Oct 2026 05:44:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C5E1606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bDIX1sMw
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3acb512a7a0so1086272a91.1
        for <linux-sound@vger.kernel.org>; Wed, 28 Oct 2026 22:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793252649; x=1793857449; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OpwHiZYTLatyvvxjRUM2hdadeePr4pZBh/g5i6VGeuQ=;
        b=bDIX1sMw/e3SOcdgcRnYG+dm99kKmvygroicWzCI1pbXHrNQYgAl/pTll67dDIF2Hb
         dxyzdFy6t3rlLRF4DX2yDnX4tT87mAgFvrfO1CiCqlT5gNfRpGDgD+N1vFK2Dv2XGvTU
         YhQXgB2Ybmj6M/U4uIyFa6U5gw7L4j2+OHc7azEyCFA4rhcy/V+wQO+T7tor/3ZB13ML
         u3zPZbFe7dlsQUntDd+C7Uwo7UKeosg7fO0rKRhj+ZH9EL11CGRZLmdPq9qGbRnPFmCG
         vHoUG3/QLyR6hvMUUCgPXM80D893/4cLudOMV8IjMacFVPFJJspxuCu/cA7aBzJZi4Mc
         ScKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793252649; x=1793857449;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OpwHiZYTLatyvvxjRUM2hdadeePr4pZBh/g5i6VGeuQ=;
        b=Ef26yDJahZEWRDYNzGyQo6h2/fuTwfWY3e2TKCdxXAc2nQ2kNm1i6iyW2F+E7Y5EJh
         EDRNqQSsUn0oVrIs//O2MgK3tPz7iCpNKqjEL1/MCPShEPhkjGkhcgxn/2oRIAmRYgIa
         QLJjp90FBfMPcuZCJJe25ZqBkx8mYcg98pwHyg+af49Hkt22Si+DDkdBeNuHHSGq0M2v
         8WIXYXS8BLbKQ1TZL2ehQ9686UMJyvvlbNaFxQWs87DNI79CBXi+K7VE6OrIXz2VYjKQ
         77S2uTcv3uFaxktO3Rk6Q5cQhjPgN3uFGMaPGTFX9oDPbxM9xfOEAnRcPlkD7W9cplbJ
         cMoA==
X-Gm-Message-State: AFq9FYL3jIddoUWcEmu6ekBfRCXyQIPymqnexyI7wQVhv03WFzv4mDS6
	X5hMDqm8MoWq6JMp6qK5retgwr6iBDFtN3xmfQrcn/ueBHFhiwPaZU1gNdy8qA==
X-Gm-Gg: AYBFou1KYwyGVxvtCJ2BQgBg0v82mC1FOorja+t9DK3Cvg5APKnLqQFB04My7lCuaLe
	eZlIdVohstDuaqeU5MghTXxcKX80tTXK5VJigaVhVDyi0Z7mDlqAtjLrnpyy5YhUS3a5wt24Un1
	wSbkqazMUmCgwv9M/o+26y6WygkBx2mpj6d8L7P60lh37ZywyFJDPUqF1RfzniFEoXdYYb1qpoU
	1nIn4jGdw9Y0nJB/HC0j6vAPU7a5yQR8UlJvGCLcZ3wGqs2/6Dx+sz/Mdz8e6+A8aVbGD84Bw0Q
	juBar753X6ncRPLQiD/Vq1THD30P1p8PKre6QZd98WitzCma05OnxjulJ/ikjv+7OuUIaR9967K
	1MC2Eqba/6Y7SUizAB3qe4u634aZ9Hk2LJ1gl2PQwY5nwN56Op2fbOvl6mp1J+1AQZvplZnfxlc
	xViEUxip/SIFN/pMusSJRx43jA/XsH9/mCDAOIMMMisxdR9drjDrgNXeN7s83axUUJ6jKo/tXN8
	l4K3bfW/XWKJISxk0n+hxaQJ6VmVXCQ/hg7RpxzzXC7/zBS9F3bb9OGHrC8feGVYtOKa7sFvIma
	lNVrFaksWjDL/e82Br/2Qd2v74pP8096cVrN58F6LYe6EFa1M7X3XePjRUbd/1+2sqWlZty0bnx
	PLRkk3ZPJdZw7CmeJ0881cJJKc7hN7B5NiaAXrrMGrnQN+gc=
X-Received: by 2002:a17:90b:6d0:b0:3ac:7556:8ed9 with SMTP id 98e67ed59e1d1-3ae58169cf5mr3260196a91.10.1793252648579;
        Wed, 28 Oct 2026 22:44:08 -0700 (PDT)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e83127csm2433520a91.10.2026.10.28.22.44.05
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 28 Oct 2026 22:44:08 -0700 (PDT)
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
Subject: [PATCH v8 02/14] ALSA: virtio: Recover PCM state after a failed start
Date: Thu, 29 Oct 2026 14:43:42 +0900
Message-ID: <20261029054354.2931-3-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261029054354.2931-1-mynameisjune111@gmail.com>
References: <20261029054354.2931-1-mynameisjune111@gmail.com>
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
