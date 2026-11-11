Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794365861;
	b=wx5JcNE+xKAPSTYi2QX1Id1KZiBq8rWBvSsBOXHy2cSMEYl0Y2gfgrc0Ryo/+UPBZmCf
	 ihrSCiVIRIhH/LywBxb3R2h4hoYb0EMsbWbeKx6akf/k+I/a5dqKIxLJ+f3rIiaW6aY9u
	 P5WbhTjfUCHQUN69oBNIme20wc3iVKYjjpa9vmzU4v80UKriuWrLdnkV57s1Bgjzg1UjE
	 Bwxvo1sYm8du5tb+wfV8pHgAV2yLoRVeIqklEv/uesokAYqDAHZNqj3+iejDkG7T3UTdg
	 7oLIRa10yQlTjSGn9IcRXAt9Lhu8ljzcrMrzLK70IjOhwNwc5ImLQC5hJmh+jHrD2VQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794365861;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=T+sVIbp4DoVMcIWaKe5XqLWovfYHU/r2Z29X5f79OW0=;
	b=ysNVkR88vJBkJvhrZCk+sTUOC0ioziJuUN9uqnnd0nZVjLTDW6remz9KYQL3AZ0K6e4s
	 s+rsX4MGcbNeCCb433eADm4ew4Jllo8F202A5TtjTQnuXMGu8vculsXUgPIXTQ3aXL5+4
	 HAaVWj5t+VchOYfJoIYRQHiQ9cXBaBvyC0XTdQ807bYH0UJ4QmXHmfPchvvQLNp9a0kGQ
	 /WirsSPVAyKEN1S5bWNr+uqXmhyirOWTcPgi3SC1DtlNjms5mzMg3xnCCgWSW85XUp2N6
	 vJGFlSbOfA2RtecS51AmHzV3gOpcl0st6pONj6ZI8SZQjJFEcVVZO3Y/kpatha2y/jA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rSR1XcTo;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 395F3606A320
	for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 02:57:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 395F3606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rSR1XcTo
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-36f8cdd30beso4468306eec.1
        for <linux-sound@vger.kernel.org>; Tue, 10 Nov 2026 18:57:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794365860; x=1794970660; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T+sVIbp4DoVMcIWaKe5XqLWovfYHU/r2Z29X5f79OW0=;
        b=rSR1XcToL437aBuG6aOr7dh9Jft9GCoX3K9T+MzFFLPOEGWlJVCFmIzvBycwZw3zrU
         pvFZJmKpJdfG2jRYqhgZqsH5BN9q5oLdLNinmuup3GeE6zzL8is8G/MoQ7xlhe0y/FG3
         VQsH7UG3IB0FVxkVmK+N1D+BnXFtZDcMK0uyK6xkZjvhOvXosPZN27uTmFMPOudfwWMz
         vEq+Ea+iUOJD2hLwKwfr9xBxpz5bstApqaYQxysnBmHpy5YHquOyN/lpOVzOF8MON8Os
         4QumtFfXu0Wy2gZdQWqQOmYIVoPHgeIDvD/+nnyKJcFyEb4UaoO3numGpJLuFcG6a5pj
         du5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794365860; x=1794970660;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=T+sVIbp4DoVMcIWaKe5XqLWovfYHU/r2Z29X5f79OW0=;
        b=YdheKT7NevLgedr2UioEWLsu/Yq/PGEAq/rcT/XvbXtQ5pgj3pguN2ugLIpUyBpg/c
         YkCZfu47cznhWyiVW8sqvzCZZcztVYZA68oWzIsV2hHJNaQ+QG7P+RBxYg/A+j8k6KlN
         Fm2lBGD07sJqptYd18KZVQAWIYbzFz/+wQslV9eKPrXSVfBy+QsqR4nMkIH2hO7hxULd
         KqNO1UC1yFkRPqCb00fG0ZUeLF6+AVwymTN08ABkdFLTU2NsJNC0OYMCc45Rtqof0rDL
         tvwke+153Ey1GiN8dJ8KoAAumDLc8dcgoX7SPJ88EkkpUBc7W9rjyWkozCmJDkpqZxD0
         oAGQ==
X-Gm-Message-State: APuU4Z+nqcWouAeHuHyijN7djYvJt36IFpeC/ongojiG5jYK7KlLeGqr
	XclxMNaylVD+YpyKVHQo6S5ZDw/zDxMq9TmM5L48jLlADG+uTaXjWUTQRK9/IA==
X-Gm-Gg: AYBFou2e7/XVzRMRf8Zf1pVFRmLZSXxeeycAKEyOQN/Rr0gZRcGtksgO1a8IFMetTV0
	Pj6v3D/MsiRx4hfd/n+QpaMbFOwtKjBL4UB3JCWfnax5pI/1if1fWFASrVNrUVSxzTZWbHcNzpG
	GLBaZh0hw5Tl5OXpHbjaqsjaOZT19Ykr6H0HMLBp71ChHOB1Rp4gSJ8slf9p14ErSZnvEqUczO5
	qnmXBiFltm5xDr0Lu0udqpZjynHFZ7158WoWgjP0k9I4x1OHjZJKMsXWxCVnmNNAD41jVN9mUCs
	f/DzkTQ2j6Sd0G1nbaU6EApU6nwMLmYogNlEulByHEKSi4TZy6IV/OcTlbLqVx1KM1MCMy1+sdR
	6FLiha+tXNPvBmOVHuJ9xrWEnrFlTjQAmvNEMs90/bNmmz5Nhcs06vEdrovdQtigAKi75tOlbnH
	4Ttn7/Vvhok+vl1ia7XMh6iJkSlpvcYMogDdFm8e4OPU8Vz61soTBX+nVaxJhu5YSpch7f29VTW
	CDbmle8uKnOF8MUYz6o+TBFWrWTd9VCB0u9oGXaE2ZOosZ0jLGDnPJh5HojtoTl4YZBRnp9NNj3
	rVRl5wSHhzE1BAwVhXPYy8YLZcAz599E6W1Jz5p5v7mMNuPtwsJArp9aroJYtVbTbzuK1SCds2Z
	/+4obo5eYlhO47J5Z1nyzGt/LXdNBuEfH+m4F1J4DEDF/jOz7xxdB/f6NiFyXJHPaHZcg
X-Received: by 2002:a05:693c:8852:b0:371:ede8:3e9b with SMTP id 5a478bee46e88-3768721116amr1738057eec.36.1794365860232;
        Tue, 10 Nov 2026 18:57:40 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520cfdfc6sm12390018eec.17.2026.11.10.18.57.37
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 10 Nov 2026 18:57:39 -0800 (PST)
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
Subject: [PATCH v25 11/16] ALSA: virtio: wait through signals for PCM teardown
Date: Wed, 11 Nov 2026 11:56:50 +0900
Message-ID: <20261111025655.63951-12-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261111025655.63951-1-mynameisjune111@gmail.com>
References: <20261111025655.63951-1-mynameisjune111@gmail.com>
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

A signal can end the interruptible wait while a STOP or RELEASE request
is still pending. A later teardown may then submit another RELEASE
before the first request completes.

Keep both waits non-interruptible and use the existing message timeout.
Other control requests remain interruptible. Device reset still cancels
the pending request and wakes the waiter.

Keep timeout and wait results in the types returned by the kernel wait
APIs.

Fixes: 9d45e514da88 ("ALSA: virtio: handling control messages")
Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
sound/virtio/virtio_ctl_msg.c |   19 ++++++++++++++++---
 sound/virtio/virtio_ctl_msg.h |    3 +++
 sound/virtio/virtio_pcm_ops.c |   10 +++++-----
 3 files changed, 24 insertions(+), 8 deletions(-)

diff --git a/sound/virtio/virtio_ctl_msg.c b/sound/virtio/virtio_ctl_msg.c
--- a/sound/virtio/virtio_ctl_msg.c
+++ b/sound/virtio/virtio_ctl_msg.c
@@ -265,7 +265,7 @@
 {
 	struct virtio_device *vdev = snd->vdev;
 	struct virtio_snd_queue *queue = virtsnd_control_queue(snd);
-	unsigned int js = msecs_to_jiffies(virtsnd_msg_timeout_ms);
+	unsigned long js = msecs_to_jiffies(virtsnd_msg_timeout_ms);
 	struct virtio_snd_hdr *request = virtsnd_ctl_msg_request(msg);
 	struct virtio_snd_hdr *response = virtsnd_ctl_msg_response(msg);
 	unsigned int nouts = 0;
@@ -273,7 +273,7 @@
 	struct scatterlist *psgs[4];
 	bool notify = false;
 	unsigned long flags;
-	int rc;
+	long rc;
 
 	virtsnd_ctl_msg_ref(msg);
 	/* This reference stays with the queue until completion or teardown. */
@@ -314,7 +314,20 @@
 		 */
 		virtsnd_ctl_msg_unref(msg);
 	} else if (!nowait) {
-		rc = wait_for_completion_interruptible_timeout(&msg->notify, js);
+		/*
+		 * Teardown must observe completion even with a pending signal.
+		 * Otherwise a subsequent open can retry RELEASE while the device
+		 * is still processing the previous teardown request.
+		 */
+		switch (le32_to_cpu(request->code)) {
+		case VIRTIO_SND_R_PCM_STOP:
+		case VIRTIO_SND_R_PCM_RELEASE:
+			rc = wait_for_completion_timeout(&msg->notify, js);
+			break;
+		default:
+			rc = wait_for_completion_interruptible_timeout(&msg->notify, js);
+			break;
+		}
 		if (!rc) {
 			dev_err(&vdev->dev,
 				"control message (0x%08x) timeout\n",
diff --git a/sound/virtio/virtio_ctl_msg.h b/sound/virtio/virtio_ctl_msg.h
--- a/sound/virtio/virtio_ctl_msg.h
+++ b/sound/virtio/virtio_ctl_msg.h
@@ -47,6 +47,9 @@
  * The msg_timeout_ms module parameter defines the message completion timeout.
  * If the message is not completed within this time, the function will return an
  * error.
+ * PCM STOP and RELEASE wait through pending signals within this timeout.
+ * Other requests remain interruptible. Device reset cancels and wakes either
+ * kind of waiter.
  *
  * Context: Any context that permits to sleep.
  * Return: 0 on success, -errno on failure.
diff --git a/sound/virtio/virtio_pcm_ops.c b/sound/virtio/virtio_pcm_ops.c
--- a/sound/virtio/virtio_pcm_ops.c
+++ b/sound/virtio/virtio_pcm_ops.c
@@ -20,11 +20,11 @@
  *   (RELEASE command in the ops->sync_stop()) and the ops->hw_free() has been
  *   called.
  *
- *   When the substream stops, the ops->sync_stop() waits until the device has
- *   completed all pending messages. This wait can be interrupted either by a
- *   signal or due to a timeout. In this case, the device can still access
- *   messages even after calling ops->hw_free(). It can also issue an interrupt,
- *   and the interrupt handler will also try to access message structures.
+ *   When the substream stops, ops->sync_stop() stops and releases the device
+ *   as required, then waits for pending messages. A failed control request or
+ *   timed-out flush can leave the device able to access messages after
+ *   ops->hw_free(). It can also issue an interrupt, and the interrupt handler
+ *   will also try to access message structures.
  *   The messages retain references to the PCM buffer pages until they are
  *   freed, so late DMA does not target pages released by ALSA.
  *
