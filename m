Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12779322773
	for <linux-sound@vger.kernel.org>; Fri, 29 Aug 2025 15:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756480480; cv=none; b=awUjzR3r3RRvQLPra8TQX+wi6d/i4cN6v8k8Oi9TOOXECUgYpgO3Csb1XtrGW3qijq/IXjt6BTiT9ksiTP8tonUi5vhvO3MZDdG9/hK2SvApcRCu1bKLkImj01U+kdRJ3w37rERJi8BIhPMe78zfDWgwNrIS8e6vFfx9Y18KpT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756480480; c=relaxed/simple;
	bh=rbW0eRzuYV8ScAVrTnGHIqGC1PaVzSZ5CKzcAkFrdwo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QYHMxe3Rtvua3xoXFxS3EGajTH0txT5vw7cdk1deXZdtfrGqfEDa65W9ORsOjZykSMaNqR4aKB9xiDQ/cnga+TwaYHcxG7dNe0YL6is4K+WjqCteL57jzyRu+JpD/+rvj6/wyDIHS6WZqLJkmjRiLnnHXX1y04yYcneq8xl3wdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=utlwzyjo; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=3WxqMyra; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=utlwzyjo; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=3WxqMyra; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="utlwzyjo";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="3WxqMyra";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="utlwzyjo";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="3WxqMyra"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id B468133F0D;
	Fri, 29 Aug 2025 15:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756480423; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=s+NTb6VOd15hqJehnjUFXJXQbx37nvy1hf/CFaYJYDE=;
	b=utlwzyjoCNIX+1VsM3ebNffuk1/VrFMQvUVzqidav1eykPDQyDHjwdB3qcDB9+ogJZJf3C
	1kWsci779TMGHjdcbi+GVNWPkge+B9zJISXAS5177xKP9iyCyqDy9gkFn0rKHYMlWHR8Hk
	vTcq7N3/22kcxgmqPaACeSvOTyNYN/o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756480423;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=s+NTb6VOd15hqJehnjUFXJXQbx37nvy1hf/CFaYJYDE=;
	b=3WxqMyraGhm2ZWTTQz0lJjmR3eIQOvDMSU7lv0LLVvF72C+2eYZRaeojHLh7HVBOFZznH4
	L76XNMzEThy111BA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756480423; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=s+NTb6VOd15hqJehnjUFXJXQbx37nvy1hf/CFaYJYDE=;
	b=utlwzyjoCNIX+1VsM3ebNffuk1/VrFMQvUVzqidav1eykPDQyDHjwdB3qcDB9+ogJZJf3C
	1kWsci779TMGHjdcbi+GVNWPkge+B9zJISXAS5177xKP9iyCyqDy9gkFn0rKHYMlWHR8Hk
	vTcq7N3/22kcxgmqPaACeSvOTyNYN/o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756480423;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=s+NTb6VOd15hqJehnjUFXJXQbx37nvy1hf/CFaYJYDE=;
	b=3WxqMyraGhm2ZWTTQz0lJjmR3eIQOvDMSU7lv0LLVvF72C+2eYZRaeojHLh7HVBOFZznH4
	L76XNMzEThy111BA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9A7D513326;
	Fri, 29 Aug 2025 15:13:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 8ARuJKfDsWiQIQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 29 Aug 2025 15:13:43 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 18/19] ALSA: virtio: Use guard() for spin locks
Date: Fri, 29 Aug 2025 17:13:32 +0200
Message-ID: <20250829151335.7342-19-tiwai@suse.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250829151335.7342-1-tiwai@suse.de>
References: <20250829151335.7342-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -2.80

Replace the manual spin lock/unlock pairs with guard() for code
simplification.

Only code refactoring, and no behavior change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/virtio/virtio_card.c    |  8 ++---
 sound/virtio/virtio_ctl_msg.c | 23 ++++++--------
 sound/virtio/virtio_pcm.c     |  8 ++---
 sound/virtio/virtio_pcm_msg.c | 17 +++--------
 sound/virtio/virtio_pcm_ops.c | 56 ++++++++++++-----------------------
 5 files changed, 38 insertions(+), 74 deletions(-)

diff --git a/sound/virtio/virtio_card.c b/sound/virtio/virtio_card.c
index 965209e1d872..52c5757585c6 100644
--- a/sound/virtio/virtio_card.c
+++ b/sound/virtio/virtio_card.c
@@ -85,9 +85,8 @@ static void virtsnd_event_notify_cb(struct virtqueue *vqueue)
 	struct virtio_snd_queue *queue = virtsnd_event_queue(snd);
 	struct virtio_snd_event *event;
 	u32 length;
-	unsigned long flags;
 
-	spin_lock_irqsave(&queue->lock, flags);
+	guard(spinlock_irqsave)(&queue->lock);
 	do {
 		virtqueue_disable_cb(vqueue);
 		while ((event = virtqueue_get_buf(vqueue, &length))) {
@@ -95,7 +94,6 @@ static void virtsnd_event_notify_cb(struct virtqueue *vqueue)
 			virtsnd_event_send(vqueue, event, true, GFP_ATOMIC);
 		}
 	} while (!virtqueue_enable_cb(vqueue));
-	spin_unlock_irqrestore(&queue->lock, flags);
 }
 
 /**
@@ -176,14 +174,12 @@ static void virtsnd_disable_event_vq(struct virtio_snd *snd)
 	struct virtio_snd_queue *queue = virtsnd_event_queue(snd);
 	struct virtio_snd_event *event;
 	u32 length;
-	unsigned long flags;
 
 	if (queue->vqueue) {
-		spin_lock_irqsave(&queue->lock, flags);
+		guard(spinlock_irqsave)(&queue->lock);
 		virtqueue_disable_cb(queue->vqueue);
 		while ((event = virtqueue_get_buf(queue->vqueue, &length)))
 			virtsnd_event_dispatch(snd, event);
-		spin_unlock_irqrestore(&queue->lock, flags);
 	}
 }
 
diff --git a/sound/virtio/virtio_ctl_msg.c b/sound/virtio/virtio_ctl_msg.c
index 9dabea01277f..6433c870f271 100644
--- a/sound/virtio/virtio_ctl_msg.c
+++ b/sound/virtio/virtio_ctl_msg.c
@@ -131,7 +131,6 @@ int virtsnd_ctl_msg_send(struct virtio_snd *snd, struct virtio_snd_msg *msg,
 	unsigned int nins = 0;
 	struct scatterlist *psgs[4];
 	bool notify = false;
-	unsigned long flags;
 	int rc;
 
 	virtsnd_ctl_msg_ref(msg);
@@ -147,15 +146,15 @@ int virtsnd_ctl_msg_send(struct virtio_snd *snd, struct virtio_snd_msg *msg,
 	if (in_sgs)
 		psgs[nouts + nins++] = in_sgs;
 
-	spin_lock_irqsave(&queue->lock, flags);
-	rc = virtqueue_add_sgs(queue->vqueue, psgs, nouts, nins, msg,
-			       GFP_ATOMIC);
-	if (!rc) {
-		notify = virtqueue_kick_prepare(queue->vqueue);
+	scoped_guard(spinlock_irqsave, &queue->lock) {
+		rc = virtqueue_add_sgs(queue->vqueue, psgs, nouts, nins, msg,
+				       GFP_ATOMIC);
+		if (!rc) {
+			notify = virtqueue_kick_prepare(queue->vqueue);
 
-		list_add_tail(&msg->list, &snd->ctl_msgs);
+			list_add_tail(&msg->list, &snd->ctl_msgs);
+		}
 	}
-	spin_unlock_irqrestore(&queue->lock, flags);
 
 	if (rc) {
 		dev_err(&vdev->dev, "failed to send control message (0x%08x)\n",
@@ -233,9 +232,8 @@ void virtsnd_ctl_msg_complete(struct virtio_snd_msg *msg)
 void virtsnd_ctl_msg_cancel_all(struct virtio_snd *snd)
 {
 	struct virtio_snd_queue *queue = virtsnd_control_queue(snd);
-	unsigned long flags;
 
-	spin_lock_irqsave(&queue->lock, flags);
+	guard(spinlock_irqsave)(&queue->lock);
 	while (!list_empty(&snd->ctl_msgs)) {
 		struct virtio_snd_msg *msg =
 			list_first_entry(&snd->ctl_msgs, struct virtio_snd_msg,
@@ -243,7 +241,6 @@ void virtsnd_ctl_msg_cancel_all(struct virtio_snd *snd)
 
 		virtsnd_ctl_msg_complete(msg);
 	}
-	spin_unlock_irqrestore(&queue->lock, flags);
 }
 
 /**
@@ -296,13 +293,11 @@ void virtsnd_ctl_notify_cb(struct virtqueue *vqueue)
 	struct virtio_snd_queue *queue = virtsnd_control_queue(snd);
 	struct virtio_snd_msg *msg;
 	u32 length;
-	unsigned long flags;
 
-	spin_lock_irqsave(&queue->lock, flags);
+	guard(spinlock_irqsave)(&queue->lock);
 	do {
 		virtqueue_disable_cb(vqueue);
 		while ((msg = virtqueue_get_buf(vqueue, &length)))
 			virtsnd_ctl_msg_complete(msg);
 	} while (!virtqueue_enable_cb(vqueue));
-	spin_unlock_irqrestore(&queue->lock, flags);
 }
diff --git a/sound/virtio/virtio_pcm.c b/sound/virtio/virtio_pcm.c
index 2f7c5e709f07..3602b6690fcd 100644
--- a/sound/virtio/virtio_pcm.c
+++ b/sound/virtio/virtio_pcm.c
@@ -515,10 +515,10 @@ void virtsnd_pcm_event(struct virtio_snd *snd, struct virtio_snd_event *event)
 		/* TODO: deal with shmem elapsed period */
 		break;
 	case VIRTIO_SND_EVT_PCM_XRUN:
-		spin_lock(&vss->lock);
-		if (vss->xfer_enabled)
-			vss->xfer_xrun = true;
-		spin_unlock(&vss->lock);
+		scoped_guard(spinlock, &vss->lock) {
+			if (vss->xfer_enabled)
+				vss->xfer_xrun = true;
+		}
 		break;
 	}
 }
diff --git a/sound/virtio/virtio_pcm_msg.c b/sound/virtio/virtio_pcm_msg.c
index 8c32efaf4c52..9778020a7ba8 100644
--- a/sound/virtio/virtio_pcm_msg.c
+++ b/sound/virtio/virtio_pcm_msg.c
@@ -272,14 +272,8 @@ int virtsnd_pcm_msg_send(struct virtio_pcm_substream *vss, unsigned long offset,
  */
 unsigned int virtsnd_pcm_msg_pending_num(struct virtio_pcm_substream *vss)
 {
-	unsigned int num;
-	unsigned long flags;
-
-	spin_lock_irqsave(&vss->lock, flags);
-	num = vss->msg_count;
-	spin_unlock_irqrestore(&vss->lock, flags);
-
-	return num;
+	guard(spinlock_irqsave)(&vss->lock);
+	return vss->msg_count;
 }
 
 /**
@@ -308,7 +302,7 @@ static void virtsnd_pcm_msg_complete(struct virtio_pcm_msg *msg,
 	 * in the virtqueue. Therefore, on each completion of an I/O message,
 	 * the hw_ptr value is unconditionally advanced.
 	 */
-	spin_lock(&vss->lock);
+	guard(spinlock)(&vss->lock);
 	/*
 	 * If the capture substream returned an incorrect status, then just
 	 * increase the hw_ptr by the message size.
@@ -338,7 +332,6 @@ static void virtsnd_pcm_msg_complete(struct virtio_pcm_msg *msg,
 	} else if (!vss->msg_count) {
 		wake_up_all(&vss->msg_empty);
 	}
-	spin_unlock(&vss->lock);
 }
 
 /**
@@ -351,15 +344,13 @@ static inline void virtsnd_pcm_notify_cb(struct virtio_snd_queue *queue)
 {
 	struct virtio_pcm_msg *msg;
 	u32 written_bytes;
-	unsigned long flags;
 
-	spin_lock_irqsave(&queue->lock, flags);
+	guard(spinlock_irqsave)(&queue->lock);
 	do {
 		virtqueue_disable_cb(queue->vqueue);
 		while ((msg = virtqueue_get_buf(queue->vqueue, &written_bytes)))
 			virtsnd_pcm_msg_complete(msg, written_bytes);
 	} while (!virtqueue_enable_cb(queue->vqueue));
-	spin_unlock_irqrestore(&queue->lock, flags);
 }
 
 /**
diff --git a/sound/virtio/virtio_pcm_ops.c b/sound/virtio/virtio_pcm_ops.c
index ad12aae52fc3..6297a9c61e70 100644
--- a/sound/virtio/virtio_pcm_ops.c
+++ b/sound/virtio/virtio_pcm_ops.c
@@ -327,7 +327,6 @@ static int virtsnd_pcm_trigger(struct snd_pcm_substream *substream, int command)
 	struct virtio_snd *snd = vss->snd;
 	struct virtio_snd_queue *queue;
 	struct virtio_snd_msg *msg;
-	unsigned long flags;
 	int rc = 0;
 
 	switch (command) {
@@ -335,23 +334,20 @@ static int virtsnd_pcm_trigger(struct snd_pcm_substream *substream, int command)
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
 		queue = virtsnd_pcm_queue(vss);
 
-		spin_lock_irqsave(&queue->lock, flags);
-		spin_lock(&vss->lock);
-		if (vss->direction == SNDRV_PCM_STREAM_CAPTURE)
-			rc = virtsnd_pcm_msg_send(vss, 0, vss->buffer_bytes);
-		if (!rc)
+		scoped_guard(spinlock_irqsave, &queue->lock) {
+			guard(spinlock)(&vss->lock);
+			if (vss->direction == SNDRV_PCM_STREAM_CAPTURE)
+				rc = virtsnd_pcm_msg_send(vss, 0, vss->buffer_bytes);
+			if (rc)
+				return rc;
 			vss->xfer_enabled = true;
-		spin_unlock(&vss->lock);
-		spin_unlock_irqrestore(&queue->lock, flags);
-		if (rc)
-			return rc;
+		}
 
 		msg = virtsnd_pcm_ctl_msg_alloc(vss, VIRTIO_SND_R_PCM_START,
 						GFP_KERNEL);
 		if (!msg) {
-			spin_lock_irqsave(&vss->lock, flags);
+			guard(spinlock_irqsave)(&vss->lock);
 			vss->xfer_enabled = false;
-			spin_unlock_irqrestore(&vss->lock, flags);
 
 			return -ENOMEM;
 		}
@@ -364,9 +360,9 @@ static int virtsnd_pcm_trigger(struct snd_pcm_substream *substream, int command)
 		vss->stopped = true;
 		fallthrough;
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
-		spin_lock_irqsave(&vss->lock, flags);
-		vss->xfer_enabled = false;
-		spin_unlock_irqrestore(&vss->lock, flags);
+		scoped_guard(spinlock_irqsave, &vss->lock) {
+			vss->xfer_enabled = false;
+		}
 
 		msg = virtsnd_pcm_ctl_msg_alloc(vss, VIRTIO_SND_R_PCM_STOP,
 						GFP_KERNEL);
@@ -480,38 +476,24 @@ static int virtsnd_pcm_pb_ack(struct snd_pcm_substream *substream)
 {
 	struct virtio_pcm_substream *vss = snd_pcm_substream_chip(substream);
 	struct virtio_snd_queue *queue = virtsnd_pcm_queue(vss);
-	unsigned long flags;
-	int rc;
 
-	spin_lock_irqsave(&queue->lock, flags);
-	spin_lock(&vss->lock);
+	guard(spinlock_irqsave)(&queue->lock);
+	guard(spinlock)(&vss->lock);
 
-	rc = snd_pcm_indirect_playback_transfer(substream, &vss->pcm_indirect,
-						virtsnd_pcm_trans_copy);
-
-	spin_unlock(&vss->lock);
-	spin_unlock_irqrestore(&queue->lock, flags);
-
-	return rc;
+	return snd_pcm_indirect_playback_transfer(substream, &vss->pcm_indirect,
+						  virtsnd_pcm_trans_copy);
 }
 
 static int virtsnd_pcm_cp_ack(struct snd_pcm_substream *substream)
 {
 	struct virtio_pcm_substream *vss = snd_pcm_substream_chip(substream);
 	struct virtio_snd_queue *queue = virtsnd_pcm_queue(vss);
-	unsigned long flags;
-	int rc;
 
-	spin_lock_irqsave(&queue->lock, flags);
-	spin_lock(&vss->lock);
+	guard(spinlock_irqsave)(&queue->lock);
+	guard(spinlock)(&vss->lock);
 
-	rc = snd_pcm_indirect_capture_transfer(substream, &vss->pcm_indirect,
-					       virtsnd_pcm_trans_copy);
-
-	spin_unlock(&vss->lock);
-	spin_unlock_irqrestore(&queue->lock, flags);
-
-	return rc;
+	return snd_pcm_indirect_capture_transfer(substream, &vss->pcm_indirect,
+						 virtsnd_pcm_trans_copy);
 }
 
 /* PCM substream operators map. */
-- 
2.50.1

