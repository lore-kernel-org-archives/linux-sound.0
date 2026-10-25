Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792910453;
	b=d9JwVSNidMihC8MT1Puuii4PVAZchjqby1UMHEgYvhSIegmnyUZ4EXD1tKyYNSuL9Ov0
	 McV4nVrFrCkNED8rdHnwQQa2I/TVo1dx7Zu2rHcXnCEdvgVasNtjsTnbdoKDzg1ZSQnOE
	 blERMHF9VdaZp5oOMgv3FGXQN6yEedLJPPNGs6xqhpANoRRnmN2XguzM23jjoH8oQrbPb
	 R0tJRIWRGbK4AC04pJyWYa3tDOoYPrXd5U3B9l0bErOeRTDF/6C/crHoSvcgW76G1VfCX
	 1OlPzO0zGeRI6m8pfJ0Vmt0rZEy5YrtGJJrE0z/0zQY3P4FyjjEhx8ssbUdmkJ6hkwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792910453;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=h6EDD+wqeFPatnIY75r59I+JXe+hDBGTfDeQYoy9Hng=;
	b=Suk66CAYuZ3U7niH5+cNLPMMNiaLeVZTAp3CI0ItCFj7oR3UK2WsLhjcCb5DtfB7A5Wt
	 I3kqCaHG/+DWf2CJyVaEOxocERkum06Y6naB13Mku8e6tALLJwoIICst3m8ze4V0Yg1Jg
	 7cSikwMV1WN69tS2WyaSdYk8PEYo0eFzJwnWqUneHOmfCEX8edkmQghns1C9VlPiMNLQG
	 hcsVSdOZOHZuBUJuZosPv2BNN9wz781cLGCyzkME99y8K2W6dKZSN91LO/ZvZab7rpVJP
	 vuyE7yxUzo2d8a6y0hyqQfRdCPOlyZ806YS7PjWsrgKNUBJPCdVfnG8lYd0XzNwsPrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=YOkHgQ8P;
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF7D8606A327
	for <linux-sound@vger.kernel.org>; Sun, 25 Oct 2026 06:40:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF7D8606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=YOkHgQ8P
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3acd21ba21aso1619525a91.1
        for <linux-sound@vger.kernel.org>; Sat, 24 Oct 2026 23:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792910452; x=1793515252; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h6EDD+wqeFPatnIY75r59I+JXe+hDBGTfDeQYoy9Hng=;
        b=YOkHgQ8PdWkvw1vMExO7DZ+uV6AoXwk3epuKY8gMUyQHC1KSxA7OjM1AB85Yul9nFn
         Mo5GcTH/fI7ZcCuGYNqslQGYrdnv3fk1jAfeI3IfjjGZLz/GcaCsxtLH0s8ZGz/Jlcek
         tp47fAA9caFYZ6Kkb4ex+cPPTA98dB+k90UREgys3XlC+fq19i2ZVStzlPf6izW8+v/S
         PxJMGEhjaGQXsmDtH2BrogfS8TVoeBmGlZpNoWz+P8ZXyaz94NscdOZSV2evsa8w1nzU
         ZNpHXdz+tJzvzbtqabGHUg1E0v/lsCsEMQIaf76M7tR0IHvr/l8zfqAJYBGxeWM+fxKc
         45Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792910452; x=1793515252;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=h6EDD+wqeFPatnIY75r59I+JXe+hDBGTfDeQYoy9Hng=;
        b=Ru7tpSxX5I8CyqxFR0WklE6Ze02RW9LjJKj3Iqdtbl5xOOrC4Km/VbJVD8tOExWSJA
         dwM6Eim6BtyFImb7sDpyTih7oA++1y9/TAtpNpx6jf7YyV6f9EwrBfVQiZVlTw7lB7Ls
         2RgT4PcXmJwDsLSsGr3mKpdJeSTJkQurp2na/zmGjzB73AqYVdo2n82AdO6/zfPrEZtr
         d09Xf9O4LALuWpTKjWltZROjCAZMerRK7hzaJC7IXaogadmwctxdHh/V61jrnrdVT3jR
         Ep7vnEpl2Tem/HCgwJgXTWO1myN6jMNG/RmIUqAgAvKTnmXOQMOAzas1NlAocFWYXJbs
         iizA==
X-Gm-Message-State: AFq9FYJxJ9blf0X3TCneuGMCyj6PziKva/LcNq8fIPvknai5JO9AKKUX
	272Lgekro68AhkHkQMIViBESRpNffbV1UlpUn/dZvfyr+4VG7RKFvTJeT5yeonYY
X-Gm-Gg: AYBFou0Y+IAXENw+YbJnX/kVebxye1MkjfoEa+vItVXmn93HKmg/sVgflkqjdXVMNBq
	6KfXasOyt68KKTWm5G0CQpkM+ienA9ualmbPO7N8UdgrnEk2TDM988k2xIeeMBBTxNJTHf1aaHm
	r6esaqbOHcVsbwgKDNMt7DdHAktYmvm9Jf6ZnT/C0/axW66X0y7P2xKews3zi3sK+7KuDNtOWMk
	jnhBjOgcHTgzMrdCA+LUf741kEUvVq5AsAF+ey8K47tGZg8LnQu1EWbRQaUkjrsl5KYq8hSKwra
	Jb5CQUhXLgfp6iymI3s74jzYttQkZ4PTvsNmwRMsfMgVP9USzHDrL0mPGJRRPgkIylDfuo6BEHJ
	5dLAoqhHciYsynCHN383ND+V2RWySR/1c328Diz99nDwjJ4SDCI4VldYflgPoyWALpl/Ym8adTF
	q6reJgoJMuQTNPPjCgVWtvG+Z8KamO6znqojdRncDRyovQWiAlYhpewvy34Feyhzd5J9i30F5j+
	oJ8D8KdH9cKSnYtqC7uwpi+nYDD/QFoeR6ORuOu1zq9idMo61xBH/QUGeA3FoK9ckGOSNHFi+XO
	3DzqhpusLB892RXMqlD0UzLJDqg090vnoAwhrUyMHgaq0vm1d8aP4PCAq27gWYFkmw1gPdeT
X-Received: by 2002:a17:90b:2cc4:b0:3ad:aa1a:312e with SMTP id 98e67ed59e1d1-3ade9b2ef56mr3328627a91.3.1792910452041;
        Sat, 24 Oct 2026 23:40:52 -0700 (PDT)
Received: from localhost.localdomain ([180.182.24.11])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebbb2fb2sm4462670a91.1.2026.10.24.23.40.48
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 24 Oct 2026 23:40:51 -0700 (PDT)
From: Joonho Lee <mynameisjune111@gmail.com>
To: linux-sound@vger.kernel.org
Cc: perex@perex.cz,
	tiwai@suse.com,
	anton.yakovlev@opensynergy.com,
	mst@redhat.com,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Joonho Lee <mynameisjune111@gmail.com>
Subject: [PATCH v4 2/2] ALSA: virtio-snd: fix dsnoop capture with staged buffers
Date: Sun, 25 Oct 2026 15:40:38 +0900
Message-ID: <20261025064038.81674-3-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261025064038.81674-1-mynameisjune111@gmail.com>
References: <20261025064038.81674-1-mynameisjune111@gmail.com>
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

dsnoop runs its hardware slave with stop_threshold == boundary and can
consume the mmap capture ring without advancing the hardware application
pointer. Staged capture currently treats every stream as a bounded
consumer: capture_ready grows until the completion capacity check fails.

With a 48 kHz mono slave, 960-frame periods and a 7680-frame buffer, the
baseline dsnoop reproduction stops after 6720 frames with -EPIPE and a
ring_capacity rejection. Direct capture continues to work.

Cache the prepared boundary and recognize the free-running policy under
the substream lock. Keep RX requests supplied in that mode, while retaining
payload, frame alignment, counter and pointer-window checks. Sample the
policy once per completion so validation, copying and refill agree.
Refresh it separately in the ACK accounting and refill critical sections.

On a return to bounded capture, reconstruct unread occupancy from the
copied and acknowledged totals. If outstanding data fills the ring, the
policy helper returns -EPIPE and preserves the cached mode and counters.
The detecting RX, pointer or ACK path reports XRUN through its existing
error path; this does not make sw_params fail synchronously.
A native pause release can also detect this overflow during queue refill.
Its trigger error leaves ALSA in PAUSED, so mark the staged capture as XRUN
and schedule the period worker before returning the error. The worker takes
the PCM stream lock after the pause action and wakes readers from XRUN.
A paused ACK can reach XRUN before that worker runs. Arm synchronous stop
before returning -EPIPE from staged ACK, and before the worker stops a
paused stream. ALSA skips trigger(STOP) for paused streams; these paths
must preserve the RELEASE and pending-RX cleanup needed by prepare.
Reset cached policy state during prepare and teardown.

Before the pause revisions, MOTU/VZ tests with one and two vCPUs failed all
32 shared-client captures. The candidate passed 48 capture cases and eight
recovery diagnostics, including 70-second CPU-saturated shared captures.
Synthetic QEMU dsnoop data matched 2160000 reference frames across 12
files. Forced policy transitions passed KASAN/KCSAN checks. Aggressive
KCSAN still triggered dsnoop client-threshold XRUNs with a 160 ms buffer.
The physical tests checked frame counts and nonzero mono input; exact
sample continuity was checked with the synthetic source.

The native-pause regression reproduces -EPIPE followed by a persistent
PAUSED state and a poll timeout with v2. With this revision, the same case
reaches XRUN, wakes poll with POLLERR and returns -EPIPE from read.
Prepare recovery and reopening also pass under ARM64 QEMU with KASAN
and lockdep.

Paused read and forward ACK errors reproduced a failing first prepare
with v3. This revision passes 16 recovery cases across native pause and
pause-restart with one and two vCPUs. Each prepare recovery and reopen
captures 48,000 frames. The existing 13-case mode suite and native-pause
regression also pass with KASAN and lockdep. No new physical-device or
KCSAN results are claimed for this revision.

Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
diff --git a/sound/virtio/virtio_pcm.c b/sound/virtio/virtio_pcm.c
--- a/sound/virtio/virtio_pcm.c
+++ b/sound/virtio/virtio_pcm.c
@@ -338,6 +338,8 @@
 			paused_xrun = runtime &&
 				      runtime->state == SNDRV_PCM_STATE_PAUSED &&
 				      vss->runtime_active && vss->xfer_xrun;
+			if (paused_xrun)
+				virtsnd_pcm_capture_arm_paused_stop(vss);
 		}
 		if (paused_xrun) {
 			/* Wake readers without sending STOP for a paused stream. */
diff --git a/sound/virtio/virtio_pcm.h b/sound/virtio/virtio_pcm.h
--- a/sound/virtio/virtio_pcm.h
+++ b/sound/virtio/virtio_pcm.h
@@ -47,7 +47,9 @@
  *        substream operators, including @stopped.
  * @buffer_bytes: Current buffer size in bytes.
  * @hw_ptr: Substream hardware pointer value in bytes [0 ... buffer_bytes).
- * @capture_ready: Captured bytes copied but not yet acknowledged by ALSA.
+ * @capture_ready: Managed-mode bytes copied but not yet acknowledged by ALSA;
+ *                 always zero in free-running mode.
+ * @capture_boundary: ALSA boundary captured for this prepared epoch.
  * @capture_copied_total: Monotonic bytes copied into the capture ring.
  * @capture_acked_total: Monotonic bytes acknowledged by the capture client.
  * @capture_pointer_seen_total: Last capture position sampled by ALSA.
@@ -58,6 +60,7 @@
  * @capture_staging: Capture uses request-owned payload buffers.
  * @capture_started: Non-empty capture data was received since prepare.
  * @capture_empty: Consecutive empty startup completions.
+ * @capture_free_running: Cached staged-capture policy, protected by @lock.
  * @xfer_enabled: Data transfer state (0 - off, 1 - on).
  * @xfer_xrun: Data underflow/overflow state (0 - no xrun, 1 - xrun).
  * @stopped: True if the substream is stopped and must be released on the device
@@ -88,6 +91,7 @@
 	size_t buffer_bytes;
 	size_t hw_ptr;
 	size_t capture_ready;
+	snd_pcm_uframes_t capture_boundary;
 	u64 capture_copied_total;
 	u64 capture_acked_total;
 	u64 capture_pointer_seen_total;
@@ -97,6 +101,7 @@
 	bool runtime_active;
 	bool capture_staging;
 	bool capture_started;
+	bool capture_free_running;
 	unsigned int capture_empty;
 	bool xfer_enabled;
 	bool xfer_xrun;
@@ -115,6 +120,22 @@
 	wait_queue_head_t msg_empty;
 };
 
+/* Caller holds the PCM stream lock and vss->lock. */
+static inline void
+virtsnd_pcm_capture_arm_paused_stop(struct virtio_pcm_substream *vss)
+{
+	struct snd_pcm_runtime *runtime = vss->substream->runtime;
+
+	lockdep_assert_held(&vss->lock);
+	if (!runtime || runtime->state != SNDRV_PCM_STATE_PAUSED)
+		return;
+
+	/* ALSA skips trigger(STOP) when moving a paused stream to XRUN. */
+	vss->xfer_enabled = false;
+	vss->stopped = true;
+	runtime->stop_operating = true;
+}
+
 /* Keep non-staged PCM notifications on schedule_work()'s normal queue. */
 static inline bool
 virtsnd_pcm_schedule_period_elapsed(struct virtio_pcm_substream *vss)
@@ -128,23 +149,29 @@
 
 /*
  * ALSA may observe a subperiod tail before its period callback. Keep actual
- * unread occupancy separate from pointer observations and notification state.
+ * unread occupancy separate from pointer observations and notification state;
+ * free-running streams account occupancy from monotonic totals instead.
  */
 static inline bool
 virtsnd_pcm_capture_counters_valid(const struct virtio_pcm_substream *vss)
 {
-	return vss->buffer_bytes &&
-	       vss->capture_copied_total >= vss->capture_acked_total &&
-	       vss->capture_copied_total - vss->capture_acked_total ==
-			(u64)vss->capture_ready &&
-	       vss->capture_ready < vss->buffer_bytes &&
-	       vss->capture_pointer_seen_total <= vss->capture_copied_total &&
-	       vss->hw_ptr == vss->capture_copied_total % vss->buffer_bytes &&
-	       (!vss->capture_callback_snapshot_active ||
-		(vss->capture_callback_snapshot >=
-			vss->capture_pointer_seen_total &&
-		 vss->capture_callback_snapshot <=
-			vss->capture_copied_total));
+	u64 outstanding;
+
+	if (!vss->buffer_bytes ||
+	    vss->capture_copied_total < vss->capture_acked_total ||
+	    vss->capture_pointer_seen_total > vss->capture_copied_total ||
+	    vss->hw_ptr != vss->capture_copied_total % vss->buffer_bytes ||
+	    (vss->capture_callback_snapshot_active &&
+	     (vss->capture_callback_snapshot < vss->capture_pointer_seen_total ||
+	      vss->capture_callback_snapshot > vss->capture_copied_total)))
+		return false;
+
+	if (vss->capture_free_running)
+		return !vss->capture_ready;
+
+	outstanding = vss->capture_copied_total - vss->capture_acked_total;
+	return outstanding == (u64)vss->capture_ready &&
+	       vss->capture_ready < vss->buffer_bytes;
 }
 
 /**
@@ -207,6 +234,9 @@
 
 int virtsnd_pcm_capture_send(struct virtio_pcm_substream *vss);
 
+int virtsnd_pcm_capture_refresh_mode_locked(struct virtio_pcm_substream *vss,
+					    bool *free_running);
+
 void virtsnd_pcm_msg_free(struct virtio_pcm_substream *vss);
 
 void virtsnd_pcm_msg_reset(struct virtio_pcm_substream *vss);
diff --git a/sound/virtio/virtio_pcm_msg.c b/sound/virtio/virtio_pcm_msg.c
--- a/sound/virtio/virtio_pcm_msg.c
+++ b/sound/virtio/virtio_pcm_msg.c
@@ -3,6 +3,7 @@
  * virtio-snd: Virtio sound device
  * Copyright (C) 2021 OpenSynergy GmbH
  */
+#include <linux/compiler.h>
 #include <linux/limits.h>
 #include <linux/mm.h>
 #include <linux/overflow.h>
@@ -384,6 +385,8 @@
 	vss->capture_notified_periods = 0;
 	vss->capture_callback_snapshot = 0;
 	vss->capture_callback_snapshot_active = false;
+	vss->capture_boundary = 0;
+	vss->capture_free_running = false;
 	vss->capture_empty = 0;
 	vss->capture_started = false;
 }
@@ -508,24 +511,54 @@
 	return 0;
 }
 
-/**
- * virtsnd_pcm_capture_send() - Queue staged capture requests.
- * @vss: VirtIO PCM substream.
- *
- * Queue full-period requests while the outstanding requests fit the remaining
- * ALSA ring capacity. The final request may exceed that capacity by less than
- * one period; completion validates the returned payload before copying it.
- *
- * Context: Expects the RX queue and substream spinlocks to be held by caller.
- * Return: 0 on success, -errno on failure.
- */
-int virtsnd_pcm_capture_send(struct virtio_pcm_substream *vss)
+/* Caller holds vss->lock. */
+int virtsnd_pcm_capture_refresh_mode_locked(struct virtio_pcm_substream *vss,
+					    bool *free_running)
+{
+	struct snd_pcm_runtime *runtime;
+	snd_pcm_uframes_t stop_threshold;
+	u64 outstanding;
+	bool new_free_running;
+
+	if (!vss->capture_staging || !vss->runtime_active || !vss->substream)
+		return -EBADFD;
+
+	runtime = vss->substream->runtime;
+	if (!runtime || !vss->buffer_bytes || !vss->capture_boundary)
+		return -EBADFD;
+
+	/* Validate the currently committed policy before observing a transition. */
+	if (!virtsnd_pcm_capture_counters_valid(vss))
+		return -EIO;
+
+	stop_threshold = READ_ONCE(runtime->stop_threshold);
+	new_free_running = stop_threshold == vss->capture_boundary;
+	if (new_free_running != vss->capture_free_running) {
+		outstanding = vss->capture_copied_total -
+			      vss->capture_acked_total;
+		if (new_free_running) {
+			vss->capture_ready = 0;
+		} else {
+			if (outstanding >= vss->buffer_bytes)
+				return -EPIPE;
+			vss->capture_ready = outstanding;
+		}
+		vss->capture_free_running = new_free_running;
+	}
+
+	*free_running = new_free_running;
+	return 0;
+}
+
+/* Caller holds the RX queue and vss locks and has sampled the policy. */
+static int virtsnd_pcm_capture_enqueue(struct virtio_pcm_substream *vss,
+				       bool free_running)
 {
 	struct virtio_snd_queue *queue = virtsnd_pcm_queue(vss);
 	struct virtqueue *vqueue = queue->vqueue;
 	unsigned long period_bytes;
 	size_t free_bytes;
-	size_t request_limit;
+	size_t request_limit = vss->nmsgs;
 	unsigned int i;
 	bool added = false;
 
@@ -535,16 +568,17 @@
 	period_bytes = snd_pcm_lib_period_bytes(vss->substream);
 	if (!period_bytes || !vss->buffer_bytes ||
 	    period_bytes >= vss->buffer_bytes ||
+	    free_running != vss->capture_free_running ||
 	    !virtsnd_pcm_capture_counters_valid(vss) ||
 	    vss->msg_count > vss->nmsgs)
 		return -EIO;
 
-	free_bytes = vss->buffer_bytes - vss->capture_ready;
-	request_limit = free_bytes / period_bytes +
-			!!(free_bytes % period_bytes);
-	request_limit = min_t(size_t, request_limit, vss->nmsgs);
-	if (vss->msg_count > request_limit)
-		return -EIO;
+	if (!free_running) {
+		free_bytes = vss->buffer_bytes - vss->capture_ready;
+		request_limit = free_bytes / period_bytes +
+				!!(free_bytes % period_bytes);
+		request_limit = min_t(size_t, request_limit, vss->nmsgs);
+	}
 
 	for (i = 0; i < vss->nmsgs && vss->msg_count < request_limit; ++i) {
 		struct virtio_pcm_msg *msg = vss->msgs[i];
@@ -585,6 +619,25 @@
 	return 0;
 }
 
+/**
+ * virtsnd_pcm_capture_send() - Refresh policy and queue staged requests.
+ * @vss: VirtIO PCM substream.
+ *
+ * Context: Expects the RX queue and substream spinlocks to be held by caller.
+ * Return: 0 on success, -errno on failure.
+ */
+int virtsnd_pcm_capture_send(struct virtio_pcm_substream *vss)
+{
+	bool free_running;
+	int rc;
+
+	rc = virtsnd_pcm_capture_refresh_mode_locked(vss, &free_running);
+	if (rc)
+		return rc;
+
+	return virtsnd_pcm_capture_enqueue(vss, free_running);
+}
+
 static int virtsnd_pcm_capture_status(const struct virtio_pcm_msg *msg,
 				      size_t written_bytes,
 				      size_t frame_bytes,
@@ -638,6 +691,7 @@
 	size_t audio_bytes = 0;
 	size_t next_ready = 0;
 	u64 next_copied_total = 0;
+	bool free_running = false;
 	bool got_audio = false;
 
 	guard(spinlock)(&vss->lock);
@@ -651,6 +705,9 @@
 		/* A full ring is modulo-ambiguous, so fail closed before copying. */
 		if (!runtime || !runtime->dma_area)
 			invalid_reason = "runtime";
+		else if (virtsnd_pcm_capture_refresh_mode_locked(vss,
+								 &free_running))
+			invalid_reason = "policy";
 		else if (!virtsnd_pcm_capture_counters_valid(vss))
 			invalid_reason = "counters";
 		else if (vss->hw_ptr !=
@@ -660,18 +717,28 @@
 						    frame_bytes, &audio_bytes,
 						    &latency_bytes))
 			invalid_reason = "status";
-		else if (audio_bytes >=
-			 vss->buffer_bytes - vss->capture_ready)
-			invalid_reason = "ring_capacity";
-		else if (check_add_overflow(vss->capture_ready, audio_bytes,
-					    &next_ready))
-			invalid_reason = "ready_overflow";
-		else if (next_ready >= vss->buffer_bytes)
-			invalid_reason = "ring_full";
 		else if (check_add_overflow(vss->capture_copied_total,
 					    (u64)audio_bytes,
 					    &next_copied_total))
 			invalid_reason = "total_overflow";
+		else if (free_running && audio_bytes >= vss->buffer_bytes)
+			invalid_reason = "payload_exceeds_ring";
+		else if (!free_running &&
+			 audio_bytes >= vss->buffer_bytes - vss->capture_ready)
+			invalid_reason = "ring_capacity";
+		else if (!free_running &&
+			 check_add_overflow(vss->capture_ready, audio_bytes,
+					    &next_ready))
+			invalid_reason = "ready_overflow";
+		else if (!free_running && next_ready >= vss->buffer_bytes)
+			invalid_reason = "ring_full";
+		else if (free_running &&
+			 (next_copied_total < vss->capture_pointer_seen_total ||
+			  next_copied_total - vss->capture_pointer_seen_total >=
+			  vss->buffer_bytes))
+			invalid_reason = "pointer_window";
+		else if (free_running)
+			next_ready = 0;
 
 		if (invalid_reason) {
 			virtsnd_pcm_capture_xrun_locked(vss);
@@ -713,7 +780,8 @@
 
 	msg->length = 0;
 	if (vss->runtime_active && vss->xfer_enabled) {
-		if (!vss->xfer_xrun && virtsnd_pcm_capture_send(vss)) {
+		if (!vss->xfer_xrun &&
+		    virtsnd_pcm_capture_enqueue(vss, free_running)) {
 			dev_warn_ratelimited(&vss->snd->vdev->dev,
 					     "SID %u: failed to refill capture queue\n",
 					     vss->sid);
diff --git a/sound/virtio/virtio_pcm_ops.c b/sound/virtio/virtio_pcm_ops.c
--- a/sound/virtio/virtio_pcm_ops.c
+++ b/sound/virtio/virtio_pcm_ops.c
@@ -543,6 +543,8 @@
 			vss->capture_notified_periods = 0;
 			vss->capture_callback_snapshot = 0;
 			vss->capture_callback_snapshot_active = false;
+			vss->capture_boundary = 0;
+			vss->capture_free_running = false;
 		}
 	}
 
@@ -565,6 +567,7 @@
 	struct virtio_pcm_substream *vss = snd_pcm_substream_chip(substream);
 	struct virtio_device *vdev = vss->snd->vdev;
 	bool pause_restart = virtsnd_pcm_pause_restart_enabled(vss);
+	bool free_running;
 	int rc;
 	bool stopped;
 
@@ -622,6 +625,15 @@
 	vss->suspended = false;
 	vss->msg_count = 0;
 	virtsnd_pcm_msg_reset(vss);
+	if (vss->capture_staging) {
+		scoped_guard(spinlock_irqsave, &vss->lock) {
+			vss->capture_boundary = substream->runtime->boundary;
+			rc = virtsnd_pcm_capture_refresh_mode_locked(vss,
+								     &free_running);
+		}
+		if (rc)
+			return rc;
+	}
 
 	memset(&vss->pcm_indirect, 0, sizeof(vss->pcm_indirect));
 	vss->pcm_indirect.sw_buffer_size =
@@ -893,6 +905,13 @@
 			if (rc) {
 				vss->stopped = true;
 				substream->runtime->stop_operating = true;
+				if (vss->capture_staging &&
+				    vss->direction == SNDRV_PCM_STREAM_CAPTURE &&
+				    command == SNDRV_PCM_TRIGGER_PAUSE_RELEASE) {
+					/* Pause undo leaves ALSA paused; wake its readers. */
+					vss->xfer_xrun = true;
+					virtsnd_pcm_schedule_period_elapsed(vss);
+				}
 				return rc;
 			}
 			vss->xfer_enabled = true;
@@ -1132,12 +1151,18 @@
 	struct virtio_pcm_substream *vss = snd_pcm_substream_chip(substream);
 	size_t hw_ptr = 0;
 	u64 total;
+	bool free_running;
 	bool xrun;
 
 	if (vss->capture_staging) {
 		scoped_guard(spinlock_irqsave, &vss->lock) {
-			xrun = vss->xfer_xrun ||
-			       !virtsnd_pcm_capture_counters_valid(vss);
+			xrun = vss->xfer_xrun;
+			if (!xrun &&
+			    virtsnd_pcm_capture_refresh_mode_locked(vss,
+								    &free_running))
+				xrun = true;
+			if (!xrun && !virtsnd_pcm_capture_counters_valid(vss))
+				xrun = true;
 			if (!xrun) {
 				total = vss->capture_callback_snapshot_active ?
 					vss->capture_callback_snapshot :
@@ -1244,14 +1269,18 @@
 		snd_pcm_uframes_t appl_ptr;
 		snd_pcm_sframes_t diff;
 		size_t bytes;
+		u64 outstanding;
 		u64 next_acked_total;
+		bool free_running;
 
 		if (!vss->runtime_active || !runtime || !runtime->control ||
 		    !runtime->dma_area)
 			return -EBADFD;
 		if (vss->xfer_xrun)
 			return -EPIPE;
-		if (!virtsnd_pcm_capture_counters_valid(vss)) {
+		rc = virtsnd_pcm_capture_refresh_mode_locked(vss,
+							     &free_running);
+		if (rc || !virtsnd_pcm_capture_counters_valid(vss)) {
 			vss->xfer_xrun = true;
 			virtsnd_pcm_schedule_period_elapsed(vss);
 			return -EPIPE;
@@ -1270,7 +1299,11 @@
 
 		/* ACK includes any subperiod tail already copied to the ring. */
 		bytes = frames_to_bytes(runtime, diff);
-		if (bytes > vss->capture_ready ||
+		outstanding = vss->capture_copied_total -
+			      vss->capture_acked_total;
+		if ((!free_running && bytes > vss->capture_ready) ||
+		    (free_running &&
+		     (bytes > vss->buffer_bytes || bytes > outstanding)) ||
 		    check_add_overflow(vss->capture_acked_total, (u64)bytes,
 				       &next_acked_total) ||
 		    next_acked_total > vss->capture_copied_total) {
@@ -1280,7 +1313,8 @@
 		}
 
 		vss->capture_acked_total = next_acked_total;
-		vss->capture_ready -= bytes;
+		if (!free_running)
+			vss->capture_ready -= bytes;
 		vss->pcm_indirect.appl_ptr = appl_ptr;
 	}
 
@@ -1314,8 +1348,14 @@
 	struct virtsnd_pcm_transfer transfer = {};
 	int rc;
 
-	if (vss->capture_staging)
-		return virtsnd_pcm_capture_staged_ack(vss, runtime);
+	if (vss->capture_staging) {
+		rc = virtsnd_pcm_capture_staged_ack(vss, runtime);
+		if (rc == -EPIPE) {
+			guard(spinlock_irqsave)(&vss->lock);
+			virtsnd_pcm_capture_arm_paused_stop(vss);
+		}
+		return rc;
+	}
 
 	scoped_guard(spinlock_irqsave, &queue->lock) {
 		guard(spinlock)(&vss->lock);
