Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793180545;
	b=q+vUawzXYru8Nr1+rG9eNiun0iGH5MBHCJRqnCF+h/ZZnv1S4ZaZHk8UqQAhoQFe5t+9
	 jUORYiWYvQQjjsci9ntZzlfXIorM8vTZEASNiR6rKRaLCoqY7ZMdEdpFi0qOkPC5BXKHa
	 e0OkM7pB/IqEqFHhCmPQSOHg1UJ5e+nKyulf2qGem3uzwqn/AYH38sVN5V/HLRRv2o7iJ
	 47iLtz2Q5XvFfcLPfi1+Qy68J8aN6LGbcGoWUDizJufEIyY+/r0pww0939JjAqHd9tSb5
	 wfp7YuQGd3kNV+RqRy/PAZOP4kl1TrkT+Y8r3IZ4bS1ZJSHSonaIrAFwaHhdx+d4xVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793180545;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=e0mMfJ0fqf1GYFnHKs3FyJvrBnGJbFvp9ONWbll9TzY=;
	b=bYFvJVDHXHiVVuvozMfmjZ+9c31ffiCFTB9TRaS1KhdE92uheI+dsOZBkcGHixDgiwke
	 0+//hNjhMt8+eP3P/o3iUoaerTux34CScDxurmiKD7BH9vELSLh3xIp4emjYfaqQGiBgM
	 ChEqlWnoqzd2pDpClH2KWLPDk9vis7httgJWSFDUubOlLEczZlk2EIQGNEky+1mRbtWH0
	 8Z7tYZIauAN1KNU/YxecFea9iskEiqBnnT8H3u9lCXO9sRbBG0xi7CjXinwh6mAsGT0iW
	 XdBtZFlTXmbvQSLmaBhyO3Vrry6XOXq2+fDJ1ahBUxe56mUwSBftqdBIEq5onaZUQww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N1Jz11Wy;
	arc=none smtp.remote-ip=209.85.215.175
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CC68606A32D
	for <linux-sound@vger.kernel.org>; Wed, 28 Oct 2026 09:42:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9CC68606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N1Jz11Wy
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cdab938dc83so380921a12.3
        for <linux-sound@vger.kernel.org>; Wed, 28 Oct 2026 02:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793180544; x=1793785344; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e0mMfJ0fqf1GYFnHKs3FyJvrBnGJbFvp9ONWbll9TzY=;
        b=N1Jz11WyhMIUeUsTUT1/DthE+KP3ZK4+iHYBmRmO3Kob4WKnDEHaxWH+tJ+vm4cLMc
         +YuacT+2F28R8OYTy9grPJKWPLg5fGO6DNzXKRYIdqId4WcwISLL7TGFZT1m24s7k90Y
         1RwUc2v8N75M4MEBDcMFZJ1lA1eg9XxmsZ1UNLWxbXjoogzHxrfZezKUINjLm4PNuXbz
         KCwFJicEYiKujmOA09ZvqOlnsy5/Xu8xrcQiXAYeng0ObcV10p0Ped2L/etfgC4rcriU
         VsTTkGiiioOhSXNmIyixnund1qvcIxOtq5iBVt9Myxfa3vvLy+lA21iN39i3nhzXJRJH
         7vQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793180544; x=1793785344;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=e0mMfJ0fqf1GYFnHKs3FyJvrBnGJbFvp9ONWbll9TzY=;
        b=B6gq6QNDK2O2JoaRmYXRoP/y5lDQpMs7c2QPO/xR4rAC7y6jEm8A9Sd4aGp8xUo8JS
         +aUVe7Lp/NC4BXVXQn+pxb2kVgAdPvC920fltUR02KRUfZKiiEWaHWuxodxef2D8XSyv
         p7f/OIUGzLNzkwjyRHV9ikvPsU96eI298r0PAnAL/7IJ3NFCGinfz01Xui3/EqC9F1jA
         NK8oIsp5CfBXUO+wsNwaf4mq5zrTYIfOfcBWm0xymS9/4PftVR2WW+/JZjhcLsc6Ir/D
         bG9pnoqEmFbz1hTg5ShqX2nRsSoz+zu1ZcF+IhLk88h4WNZnhBfZWI4J6YMF8tR/eKh8
         EELQ==
X-Gm-Message-State: AFq9FYLFgErc7AfM0djEeyaaAGnSHrjL5PZv2eP8mUvE5RhXalu8jzne
	x6M49PqqNS4DG/U09zzwFlkE2HstpnJfYXuMeLis5gXOrzn0zHIOLXD9pNLe8g==
X-Gm-Gg: AYBFou1KvLZF3EojEydyFmCpjl6OVGyL+bLyVHorJRaiaVx2V7h94+gI5ueeEQ/AUqy
	b9gNaUtOJyvMRrDrdfv5s/PNYilayznJoIDL0cCSsT3jENcRwnL5Vb2DYMf0AH0CMNNRkFV/Y42
	cp444/xb+d7chYPicwUM3ffLG8/lKBOMkjhYM5GTyX7JXUifmdaj8vvU4USOoEYaXjaALwT/zmT
	GGE9g+uU7TeS4ubiEdRVcff81wZkMN/7LGL5iasJ+2dLMtPeseP+nX4jnKyJ/x1e+bR+Zhy8UVb
	k4Ud3iTYRZjXHFu0yX+HmpAJSlXu0uiiBQsfvhavIHzj08slwM5UttMv1XJRRSOk6oH3gASBUug
	21smfEVa56CO+x9yLRDQO3gwzqTPfBNBj5tVLB/lw4BdRn4L85VlPO7QhSBJkPPWjxxW5FYtNRA
	fzok2MyXTzq4dH7ZkAho1PloSX5f4a5BH6O/leDsxn869+4WYdCispV+wxX4+9387+8rt3odkGB
	VgHin7X8YvIV37rYEJuyO8eNPNQCdk3uD4bcupw+V34O/4VQmh7h1AnrODrH/nR+urpMKmTYXgb
	LzwIEfPzo/7wRY1mztrukESINiybkd7UayXWww65R4Q3+iBYFCZBLPYXDaVvaZ6G6DJADeKDngM
	DQfJZ6pyYFnBtZ5FVS8+2SvkHKyMB+bSyF0awHAchic0okhg=
X-Received: by 2002:a17:90a:d603:b0:3ae:3f20:7056 with SMTP id 98e67ed59e1d1-3ae581d39c6mr1322287a91.31.1793180543926;
        Wed, 28 Oct 2026 02:42:23 -0700 (PDT)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae5a93b3f5sm2242377a91.5.2026.10.28.02.42.20
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 28 Oct 2026 02:42:23 -0700 (PDT)
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
Subject: [PATCH v7 12/16] ALSA: virtio: complete control transitions and preserve drain tail
Date: Wed, 28 Oct 2026 18:41:28 +0900
Message-ID: <20261028094132.20364-13-mynameisjune111@gmail.com>
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
