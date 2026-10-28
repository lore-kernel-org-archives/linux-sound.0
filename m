Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793156042;
	b=ety2L4RobV8xtsk83g2fH9lFliMjE5lVwrwTBysG0HCsDi+iSCrBBJa6QNE++psLDFa8
	 Q6vcFav0koI4oyzDll8seXOO539vOEt86Rk+ZZ/6Hl5BMcEMyVhcZbFrUaC425K8horha
	 I+c4R3z6gZfR20eUtVg2xiDJCGUVAEr8CKgKHRfYRBzWV5jU6LDeS0Z6JhxHKQQjCJj8Q
	 WmWRdeHHw1iZ8H1/ZjhhZoKqmdlAaUIjyEIk/Iup8Gg8EQZ5w+EHahxDZzlRinHreJSjQ
	 I7Q5/UaYEzVZ1NawW73dABWxLGhuEVe4dwVozhPyQnD1HkvY0+JfcphegbwkwUnk0mw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793156042;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=e0mMfJ0fqf1GYFnHKs3FyJvrBnGJbFvp9ONWbll9TzY=;
	b=3etbgl+pHwE6G2l33cxCH2VMBdJDirVa3w1ZVwlBR6K/UGtS6pnV9s3GxhRFqjWRZug1
	 RyjA0rARgbArQ50L2Kl5elcWS9jmQJr+YzK2ShMWAoVNOzeMG0xZUOXUr2J+d7Uo345Fw
	 L1OplkzSed/CO6gFj1EDgxq4D3XdKT+vBPPKPbHDRkR102xGj0rCxyLObYj1fP2ox7bWX
	 bQqgTRA66gZxK6MaIkLKqYdaTuA0xc1QfGLOFPSzOzLnfFAPdHRcILpKURD0MFJLMM+xC
	 RHOm0UihUhRW2+uNE/8VNgSjpcPzfKqV4gLI2Xm41ZOuYbbqqVgDxbHLRgmU0RQQeGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="X7S/o9n8";
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8519C60A262F
	for <linux-sound@vger.kernel.org>; Wed, 28 Oct 2026 02:54:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8519C60A262F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X7S/o9n8
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-353804b591eso832271eec.0
        for <linux-sound@vger.kernel.org>; Tue, 27 Oct 2026 19:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793156042; x=1793760842; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e0mMfJ0fqf1GYFnHKs3FyJvrBnGJbFvp9ONWbll9TzY=;
        b=X7S/o9n8gAVloInfa/JaFsJmPjPxzdPHHK8/sxkMaafHCzEZBLeOmYYKLSpI7flHSr
         SXgWpYXaJcFBG8xqFACfW5X9AlP7rgIlWwl/T//nGrj0mIZpZ7hGQOfiNQ/Zb84xOJT+
         ed4Zt4QnUiH7Ny3vZ6CI01b+zM/TkZ5FG+ydJj/wGqjdcm/M1tlWAVRbOX5pH/Ac3lRQ
         TuDAi8+XsV+40L3JAjjtKWvEz8vnWMeA1F+2rMFUNtbm2ReS15CvmJNB9N9zPi6z0Oz4
         78pT6Ce/+Gpm83jWCKchv1K1geNtJdsGkoZ+nmV2Yd5huZOiwJSqqVK3SdqbEiJ7hIFp
         EmTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793156042; x=1793760842;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=e0mMfJ0fqf1GYFnHKs3FyJvrBnGJbFvp9ONWbll9TzY=;
        b=dM0x74nv6/2cBaOjjtOPd3oOKP2SnzjCAUMPohcDgvoUwZAI6A3U4MvMHiSCrS3wTp
         568REBxOg82ydRCOUzqIgBd7AcKk+tW33JKbevOdzL75kNz6juxBxM6cEYnR454ApWj2
         EdTNHOf4DPWNXvNiNYgL6jGtgDgtuJ2Fmqu9be0V3+7QzheBtpHm9aXlIZ834YZPGGNX
         Zyy+XuVS38CIhGszFURtbGOef8IheZcWSTzYqRw+GKM350ygMH/naiJYG+iWzGOeieBV
         9PoaLX7Vb7OljuRrmV9z1YsHQjUvd21ZqfNN5Pze91cYL4KeRxO541QQgMQwCL/mMH1h
         Knkg==
X-Gm-Message-State: AFq9FYInkEN5LfZLCiJ+rPIntvt4t++PyWlF91G3sEjM+whXOp0B/MxN
	6yObKL7uwzkW8eyNZmRYiDg2CW5djBbXjHTUsxJe9fgnp2M+szIMODTHDmggmw==
X-Gm-Gg: AYBFou2RIhMkItVD6NJYl0TntRnrHH96ipZJDLr1j7NA+D0p3k8vKYjGL5xQZV/R/ff
	3xLKx5oxOXJ3lpAYStMKqkxFVQ62VKHTZozhYDUcJf70pzj0igM7wGH6PtQCVno/2S3pmwCwB/w
	IXkgHPVrpWjk2X4ZFvg/mueXuSZ8okNNSJ9qJyKQMSzbO0+l3wzkQxo8G/QobCdYc0UCuIkCpEY
	+yr7WrfBVYJt0Jghhu79oz4x/5Mpzx5vwudbdGcBlKjFbXJuJ/lz3dG+j57bjpI53Asm9cXK6Tp
	g4ZR7yLZuxXjGO2tiWz54IzIq5FhgQ3ZT47MIKz2JtWXwUxkJVl0QPxw73eO2NTS5FAtvh0kc8R
	5oVkImZ/vEvm60OGbqWpeMNcG3mb8cABehJD9MfOh/jordBQWYU/9jvDgLVB1TUabgTtUs9hIyV
	ZhOcd1VjgcFkro1TpQAamjuHG1wfMh9/Z69JyvGKKy4MWQfZKRCK2UK4qBgjMUlgN+1rNePrUpw
	8QIhS/8PK/M0eQ7Qb4Dur5+nKIxCmWHvDMOMjMvYKizt1NvqYglP6EPtl3qdwFRNIeb7RcCz4tb
	K5oPiXOos2tLVA6vyAU1+t+jx3GlVNpP7jsMR4wRW+uCskyLqKBeCFkpsHIDlUo3QwRRsnCrBtg
	jN0oQ7gnfUHuL4B2VD1iuy19MDasQYFt0mgCr9uIgmIW//2g=
X-Received: by 2002:a05:7301:6183:20b0:36a:3ac:b15 with SMTP id 5a478bee46e88-36a203fec6bmr1743372eec.36.1793156041434;
        Tue, 27 Oct 2026 19:54:01 -0700 (PDT)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a239644efsm1711914eec.23.2026.10.27.19.53.58
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 27 Oct 2026 19:54:00 -0700 (PDT)
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
Subject: [PATCH v6 12/14] ALSA: virtio: complete control transitions and preserve drain tail
Date: Wed, 28 Oct 2026 11:53:15 +0900
Message-ID: <20261028025317.92450-13-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261028025317.92450-1-mynameisjune111@gmail.com>
References: <20261028025317.92450-1-mynameisjune111@gmail.com>
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

Pending signals can interrupt synchronous PCM state changes or the RX
teardown wait after the device has accepted the command. Recovery can then
issue a conflicting request before the previous transition has completed.
Wait for SET_PARAMS, PREPARE and START within the existing timeout, as for
STOP and RELEASE, and make the pending-RX drain wait non-interruptible.
Device reset still cancels the wait and the timeout remains bounded.

Track whether a control request was submitted. Expose that information to
the pause-restart state machine so it can distinguish a definitive failure
from a timeout or reset after submission. The next patch uses this helper.

Keep INTEGER64 control values in the aligned response-data allocation
instead of placing them immediately after the four-byte response header.

Capture DRAINING must allow consumption of the remaining tail without
queueing fresh RX requests. Permit its indirect ACK while stopped and skip
the refill in the transfer callback. A non-staged drain test returned
-EPIPE with v5; the corrected kernel returned the final frame.

These changes address Sashiko findings in patches 1, 5 and 6 of this
series. They apply after the included prerequisites.

Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>
---
 sound/virtio/virtio_ctl_msg.c | 21 ++++++++++++++++++---
 sound/virtio/virtio_ctl_msg.h |  4 +++-
 sound/virtio/virtio_kctl.c    |  9 ++++-----
 sound/virtio/virtio_pcm_ops.c |  8 +++++---
 4 files changed, 30 insertions(+), 12 deletions(-)

diff --git a/sound/virtio/virtio_ctl_msg.c b/sound/virtio/virtio_ctl_msg.c
index e50e6c7..5d77217 100644
--- a/sound/virtio/virtio_ctl_msg.c
+++ b/sound/virtio/virtio_ctl_msg.c
@@ -23,6 +23,7 @@
  * @list: Pending message list entry.
  * @notify: Request completed notification.
  * @ref_count: Reference count used to manage a message lifetime.
+ * @submitted: Request was handed to the device.
  * @cancelled: Request canceled during device teardown.
  */
 struct virtio_snd_msg {
@@ -37,8 +38,18 @@ struct virtio_snd_msg {
 	struct completion notify;
 	refcount_t ref_count;
 	bool cancelled;
+	bool submitted;
 };
 
+/* Caller retains a reference across the synchronous send. */
+bool virtsnd_ctl_msg_uncertain(struct virtio_snd_msg *msg, int rc)
+{
+	return msg->submitted &&
+	       (rc == -ETIMEDOUT || rc == -ERESTARTSYS ||
+		READ_ONCE(msg->cancelled));
+}
+
+
 /**
  * virtsnd_ctl_msg_ref() - Increment reference counter for the message.
  * @msg: Control message.
@@ -296,6 +307,7 @@ int virtsnd_ctl_msg_send(struct virtio_snd *snd, struct virtio_snd_msg *msg,
 		rc = virtqueue_add_sgs(queue->vqueue, psgs, nouts, nins, msg,
 				       GFP_ATOMIC);
 	if (!rc) {
+		msg->submitted = true;
 		notify = virtqueue_kick_prepare(queue->vqueue);
 
 		list_add_tail(&msg->list, &snd->ctl_msgs);
@@ -315,11 +327,14 @@ int virtsnd_ctl_msg_send(struct virtio_snd *snd, struct virtio_snd_msg *msg,
 		virtsnd_ctl_msg_unref(msg);
 	} else if (!nowait) {
 		/*
-		 * Teardown must observe completion even with a pending signal.
-		 * Otherwise a subsequent open can retry RELEASE while the device
-		 * is still processing the previous teardown request.
+		 * PCM state changes must observe completion with a pending signal.
+		 * Otherwise recovery can issue a conflicting command while the
+		 * device is still processing the previous transition.
 		 */
 		switch (le32_to_cpu(request->code)) {
+		case VIRTIO_SND_R_PCM_SET_PARAMS:
+		case VIRTIO_SND_R_PCM_PREPARE:
+		case VIRTIO_SND_R_PCM_START:
 		case VIRTIO_SND_R_PCM_STOP:
 		case VIRTIO_SND_R_PCM_RELEASE:
 			rc = wait_for_completion_timeout(&msg->notify, js);
diff --git a/sound/virtio/virtio_ctl_msg.h b/sound/virtio/virtio_ctl_msg.h
index d84f074..cb5b9fe 100644
--- a/sound/virtio/virtio_ctl_msg.h
+++ b/sound/virtio/virtio_ctl_msg.h
@@ -12,6 +12,8 @@
 struct virtio_snd;
 struct virtio_snd_msg;
 
+bool virtsnd_ctl_msg_uncertain(struct virtio_snd_msg *msg, int rc);
+
 void virtsnd_ctl_msg_ref(struct virtio_snd_msg *msg);
 
 void virtsnd_ctl_msg_unref(struct virtio_snd_msg *msg);
@@ -47,7 +49,7 @@ int virtsnd_ctl_msg_send(struct virtio_snd *snd, struct virtio_snd_msg *msg,
  * The msg_timeout_ms module parameter defines the message completion timeout.
  * If the message is not completed within this time, the function will return an
  * error.
- * PCM STOP and RELEASE wait through pending signals within this timeout.
+ * PCM state-changing requests wait through pending signals within this timeout.
  * Other requests remain interruptible. Device reset cancels and wakes either
  * kind of waiter.
  *
diff --git a/sound/virtio/virtio_kctl.c b/sound/virtio/virtio_kctl.c
index 4cf75de..2b6290c 100644
--- a/sound/virtio/virtio_kctl.c
+++ b/sound/virtio/virtio_kctl.c
@@ -159,12 +159,12 @@ static int virtsnd_kctl_get(struct snd_kcontrol *kcontrol,
 	struct virtio_snd_ctl_hdr *hdr;
 	struct virtio_snd_ctl_value *kvalue;
 	size_t request_size = sizeof(*hdr);
-	size_t response_size = sizeof(struct virtio_snd_hdr) + sizeof(*kvalue);
+	size_t response_size = sizeof(struct virtio_snd_hdr);
 	unsigned int i;
 	int rc;
 
-	msg = virtsnd_ctl_msg_alloc(request_size, response_size, 0, 0,
-				    GFP_KERNEL);
+	msg = virtsnd_ctl_msg_alloc(request_size, response_size, 0,
+				    sizeof(*kvalue), GFP_KERNEL);
 	if (!msg)
 		return -ENOMEM;
 
@@ -179,8 +179,7 @@ static int virtsnd_kctl_get(struct snd_kcontrol *kcontrol,
 	if (rc)
 		goto on_failure;
 
-	kvalue = (void *)((u8 *)virtsnd_ctl_msg_response(msg) +
-			  sizeof(struct virtio_snd_hdr));
+	kvalue = virtsnd_ctl_msg_response_data(msg);
 
 	switch (type) {
 	case VIRTIO_SND_CTL_TYPE_BOOLEAN:
diff --git a/sound/virtio/virtio_pcm_ops.c b/sound/virtio/virtio_pcm_ops.c
index cbf4e47..c7e85b1 100644
--- a/sound/virtio/virtio_pcm_ops.c
+++ b/sound/virtio/virtio_pcm_ops.c
@@ -1102,7 +1102,7 @@ static int virtsnd_pcm_sync_stop(struct snd_pcm_substream *substream)
 	 * Thus, we consider the absence of I/O messages in the queue as an
 	 * indication that the substream has been released.
 	 */
-	rc = wait_event_interruptible_timeout(vss->msg_empty,
+	rc = wait_event_timeout(vss->msg_empty,
 					      !virtsnd_pcm_msg_pending_num(vss),
 					      js);
 	if (rc <= 0) {
@@ -1205,7 +1205,9 @@ static void virtsnd_pcm_trans_copy(struct snd_pcm_substream *substream,
 	struct virtsnd_pcm_transfer *transfer =
 		container_of(rec, struct virtsnd_pcm_transfer, indirect);
 
-	if (transfer->error)
+	if (transfer->error ||
+	    (substream->stream == SNDRV_PCM_STREAM_CAPTURE &&
+	     substream->runtime->state == SNDRV_PCM_STATE_DRAINING))
 		return;
 
 	transfer->error = virtsnd_pcm_msg_send(vss, rec->sw_data, bytes);
@@ -1360,7 +1362,7 @@ static int virtsnd_pcm_cp_ack(struct snd_pcm_substream *substream)
 	scoped_guard(spinlock_irqsave, &queue->lock) {
 		guard(spinlock)(&vss->lock);
 		transfer.indirect = vss->pcm_indirect;
-		if (vss->stopped) {
+		if (vss->stopped && runtime->state != SNDRV_PCM_STATE_DRAINING) {
 			rc = -EPIPE;
 		} else {
 			rc = snd_pcm_indirect_capture_transfer(substream,
