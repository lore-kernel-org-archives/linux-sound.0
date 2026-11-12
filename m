Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794458160;
	b=sLGQY0Eq7vycrV7a/FA/g26Giwz62ZIpWzuGcWZojYmB9rT+nmkGhrFCnz2CzGElxEX9
	 S4jSX+XsqcZwk5ijFa84crDiYqsbY+r7W9WNBDPKXjDaIv2wZXlYOpWUHny3IEdmQ13fL
	 Os/cyMZia8HcX2vhYmwxdFpiMgaNUb9kYV0gylxFgA2IQgvptVk3dnBfJ9eHO/itVoaf6
	 ByvZ4m0V6VcFfUzX27ZXygxGYFLZysGwPn9uyNpOlduZas3WVjir1F88V4p6vGqvJNJeL
	 fBsA0695A6B3HxvnlRCEgee0sIFN8/oKzmJDho8dEQvc9TpSvuFWnc9HbvkSiJkO0PA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794458160;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=T+sVIbp4DoVMcIWaKe5XqLWovfYHU/r2Z29X5f79OW0=;
	b=nLbDs18LPdfBxKEnppe1T0Mwz2kTr+Mn2Qj93QKkBnvsLcoYpr849biGDPOltrONEvIy
	 del3xzisIaa3K6ysi3Pt4qi18Vd4arKk2+lRBVQyy8SRvrvNyIxSM5fPaAXhZjx8gbTuX
	 y7IzXYQJu4hAGn1m3c5x0pQv7H0snZ7pKIURl2tIcAIK9XNZ4mqM6NTJbQgAnD8/SRWmo
	 OhGx3oCKf0mXquFt9HvFMVa3HTKy2FDm96zyOWFkGA7Jxi6+9nI4GU+tGR3JiB7k7gG8e
	 B7cT45zoHvt7t06Kb1Q1LsgbG6vTj/PEHqpu0pSW76mw8bopiAX3xQho768iQUk9dbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JTkeMJXG;
	arc=none smtp.remote-ip=209.85.215.178
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75F64606A8B4
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 04:36:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75F64606A8B4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JTkeMJXG
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cd6028ff33fso1907606a12.0
        for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 20:36:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794458160; x=1795062960; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T+sVIbp4DoVMcIWaKe5XqLWovfYHU/r2Z29X5f79OW0=;
        b=JTkeMJXG1EUIuRAwJuZAmcCoanMWGO2nwXFIuOVhmc5stMLi9t2b4WV64aeWIOiAVH
         OcWRKOsP2mHWHViF1REm6HItaAYr4JiFE3zEzcM1EZ/yBoSmdqzwI37Wbrp5uk//V6Qm
         WuA8IuIlHYnJdu4GR4R5RsZ6TKBd89kdJIaiKos11R00a95tVzhCaNusd5CvTSacWc3F
         VhrlCvDvtvF7Ln9zaBORWuvgGeEx8/A6eoIOyu+NzvSy0WqDwi+I6Eg4+hflGYNvWF69
         G2YO0GUqFPIO96xR7vIHX2Y0Jsi0qbgRtNhCx+Rbml+UqYhjA636FWLPjhGtdqJL80Zt
         kclA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794458160; x=1795062960;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=T+sVIbp4DoVMcIWaKe5XqLWovfYHU/r2Z29X5f79OW0=;
        b=EJikQZ0wB3vC6wug4+dQ+NIBQhoM6fjdk7f72+urbckycJ4nOg30yoT7zvI87k06Br
         UokYA/6MVE7Yf4qb5WakjmMFRkrrdgXKeepPqqduKFOzdU68wRG5i2mR4O3eCHxJfUPb
         MY/kTNzY0etbmYOazgsj7cxGs5UhqzmPdjKjJI7sU/XD49ZYFvapcalE9f41GzcAxD5n
         XgCHKYqZjrP9YMaL+iOLCeO1hfFoYtTkFqJwf/ob7CMtrftt6wcbqGbOYIhx62Gl9XS/
         94XcUlKKEsvMHsO4DXItXgQA5iccuBQdv740ywmFgt4nrKlWmrnmDZ6lrzqLMHBPw2MN
         5LWw==
X-Gm-Message-State: APuU4Z+zKjNWBN5r/aRe6frkx848/TFVmMDlESxgab2mcQTnarlMbbPf
	L4yR4UjLT/IIR5n7HGrR2SDU7baWfW8vEfZv5CdfwP8YQ2jWYY0lp+3T4hseAQ==
X-Gm-Gg: AYBFou2yJFirtq1pe1H3mj3LTiY65wYCGmmx6hFFuettJFzVBvs7GuD8nDCRYNrleqH
	DRCTEuZ03iIHDEUHbNgQYLifnZcJTl49Ss+H9itHXXQqXujMyn8HMdAUQ29ObfH63oJvaVcguqr
	uSFy0SmGHbC07QOslQ0thKHn3Z/0JRF955gQcL8Lzm+bCZLYf/FcOHfsqYHjSD8icKESdSMYpC3
	Y153IviNEUJqSBHlAv+sm5E3esemveGbB/KG0uhEX2bjOeRC1fhK5Sg2c0b61l8ocmVDQWCH668
	FhKS/4bJE4495LbigvS0+jhxQU939ZbFj6CAg/kMiLPCcHurwQc1q0jkLH1FBZhf71j8Jgko+T9
	kic5LFSFHcxb5NArs/ZRCDcki4EGzkW5uTLbig9CQ5sJ8eGd+8WUxJG1K7dE3Bj+5Zq4FQZYNVM
	JrCaBksATfzKkIvxKQ449T11LAE6DSFJhAr9N6CI4R9IExpNs0RPdIAyHnlmSiBIqyioZg/534F
	Ylck7hEtuCuMMHJHOWxJppvuZDk09H76n+NMdUEBNWKQiZ1ikqfIZGbzgD4ZDjJxFJZFde1CwYG
	yZKZISgYE3ogyfb8uus+MvfB5kS13GXwGxa/BNit6vdq2w5CNEYWQDfC/mVcPx2UZdWXUW8m3Gp
	9W68hKjJqUzhCzIB5jncUY5qd2hiSniYF85fb1gvJomI9HWgl
X-Received: by 2002:a17:90b:691:b0:3b1:8300:f48f with SMTP id 98e67ed59e1d1-3b18300f503mr3347378a91.51.1794458159800;
        Wed, 11 Nov 2026 20:35:59 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197c8b287sm2470466a91.15.2026.11.11.20.35.56
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 20:35:59 -0800 (PST)
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
Subject: [PATCH v28 11/17] ALSA: virtio: wait through signals for PCM teardown
Date: Thu, 12 Nov 2026 13:35:10 +0900
Message-ID: <20261112043516.37010-12-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261112043516.37010-1-mynameisjune111@gmail.com>
References: <20261112043516.37010-1-mynameisjune111@gmail.com>
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
