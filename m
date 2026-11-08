Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794182154;
	b=Xgsfb8e4nfPPHfoR6ZxtDEtWRcAE1FkGj5DL7JzXexjRYS6CcHAaX4JhbcUcyn8Vf29Z
	 OLzXbQdr4aqXasRtYzBGPBpNTDmNKGa11d5+TpIAgMWA4KNLqcxuLrJ9gcL+NG3JGu7W+
	 tnnobgCYnjopfdLgRd6Qk2/am1agfNW+2rWAFPlZcqRrngXbBOdWCf0AqWd+TidZYlEK5
	 YCV/7CSUenin1j/RlB+vwU8Ilq9099jZRANLk+CCO5e9gpdwOiyWJRkofSm2oOey5cY/c
	 gA6eUTWZzfwheuSkjg+LGsHclXKZPrsjLlopZ6KeF+p9ESCraIodJVybcRAaCmkfpZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794182154;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=XF2VmCDJnpXIgiFaGUBtPdUTCN/KhchAk0nVPRL7Ydc=;
	b=GbXizMxiP0B0zLQro1tSJILcPSf6tatqQJQqilskkJ/mjJN/JgQKJyhLLmT8fjwOCM7W
	 vbg8eXyvTtUta9az3jAWrTDxQIcIfNzqIwvge0bnfgykFZVAgA23/0kH9lBoMzJ6U40/G
	 N5s71FKLoYR/2BUXdSlfVU5hjbK5FLBgKO4Fi97Dg2P/RWodkE9aDD2OaMU7mRjEcCL6I
	 DevBO0OGbXASZnYEE00jYqtxGjac0CT5tpYGMTqqZRL2d9kZKxaQudaAOONV8jYIGVj5u
	 LTrItTqWtFjqTh3ic1uu4xLRKT0jc7tTdiT8F/g/x8r+J348zr0w69pSByjzIt/gQsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w2p80ylO;
	arc=none smtp.remote-ip=209.85.214.173
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 087CC606A331
	for <linux-sound@vger.kernel.org>; Sun,  8 Nov 2026 23:55:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 087CC606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w2p80ylO
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2eb0f1b592bso976505ad.1
        for <linux-sound@vger.kernel.org>; Sun, 08 Nov 2026 15:55:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794182153; x=1794786953; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XF2VmCDJnpXIgiFaGUBtPdUTCN/KhchAk0nVPRL7Ydc=;
        b=w2p80ylOEaBMw434BJFvCPDMg98dd4/DQ5426B3pgyCPzrvJCZZq5XfDM4D1EYm3AO
         Yo8ypKw1nDDQVYS/0mzyr9P3iBtcowSaFo0ph/NssdcIsf0Q2+bsDEuqpaJrTPkU75L3
         u0eYIy2k/xzAxbpXtLfUqj3nO8pxOtWGlJDcuY95UaqyMMJPlQx4mQW4qqJWKOs0t5q7
         fQl/1BlWN/Ek3tEAp+TQA1trWYOyU1UAyjQZbeZpw6DZDJcRwCn2dPayTdp2tYpZOoTR
         lg6Ptt1F8lQWS2GOonuYyQMPKAOpYexpjuNn6o9Zd66pOXaM9Zr8PYIW/0EvbpOpjruN
         aNuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794182153; x=1794786953;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XF2VmCDJnpXIgiFaGUBtPdUTCN/KhchAk0nVPRL7Ydc=;
        b=JgpNWhAXLI24R304mbB/l5qwsZxoJ4fe1DPQsIibNQSyW2EvbYOGSM19ap6ZmXkc7a
         4pCcmhSZ8TI0wRymsJJlXfBbrD1sn6vq/eMCxjXd2uKh8OLq+tsvDRy8U5iPJjXk6Y/q
         t1S+KN0nUqATv86PaZ+ujEAWQF23brXtKxVunM6KrnlJq7Xu0UkIP7X9IkMTMr0hrV3j
         pE6zxjX2LVLQk+q3rx5h0VpdFBN32FWhb6Ku9pSmvWORnW1+c5ZMwpgr2dFsC0MOnT73
         JLqb2krOaXSAU13t+7s1X/nMg8E9hZBpv6QUulJAWdcj7TCpW0EyyR6SfB2PmCQXDwXv
         8McA==
X-Gm-Message-State: APuU4Z+5elwIjBerGBPAw/X7NxInBFpZ/yjennyHfMp79pAKcO+C0eTv
	q1tujzMl+6F4EJ3vmkkwmRzBHCLT+xleYEldgd6EDFfXggFNAvmAEhmGn3pprg==
X-Gm-Gg: AYBFou0KzO+VimBPsXy49m19IEtG+zR9ztxpBlYTG6Ue3qLjYDAZ8nzCtTacuQIO9m8
	QCzWCVRjLxuPSKgpguCeVtRv1LrTITGrrk6rDg6k/J03bwHbT47d5CAmzB49enJ6h9qXASUjeKa
	aT5v//RwFTrzbq2bcT/G097wKkAbCfHbDXoCFFva6h89WfND2KT4zX7gc/ccfPMn7Wu1pucRHwu
	izqQyYoW/AiGa+xYci+GDlgAKDwIVqxkM1kyk/saRwD8Y+mVrla0+pBAk4Dx2WcSMGeHpwqAVqN
	nXeutKC/Z8sfnoVYB7+L7s6XiE4+fUhk+IyQV3Y+HGMFIalQ0qjbd+9N7l7aIqTPUlLMITYmPCK
	9y2wEf/WshJwramfG1/eiXUsi+pnIJqj9sy9MHRj9+Wrf3VvJLYMmwa/BIxPTKnHRKF6+jkxaKP
	d5mnvDFZKq4R4vu8iHEMUjWImb/SzRiSe4dH3TfzJAvP96Rk+gnFDzgUlrkep2jJtemm8S6693K
	jK3ZcXr73v4ANAuhvNoiU3zofNkmInmwjQ7X9aRej9OBaflRaiOlc5kKyDvUo7i6haLtetxxvY4
	2vq6xHcsz7w4k68jWFgueDGsHSoztAR+Wv76oCk9bqyirbRlLoBZ8aqd2lwvKfMgI847gQtttOK
	FpTSbV9J4ICAx1cN7XQaDZcQRZ0Ve/r29S+I5MCWJDB4B0Xw=
X-Received: by 2002:a17:903:1b07:b0:2e9:79db:449c with SMTP id d9443c01a7336-2ed83784c99mr24187015ad.47.1794182153315;
        Sun, 08 Nov 2026 15:55:53 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed81722edesm6095215ad.55.2026.11.08.15.55.49
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 08 Nov 2026 15:55:52 -0800 (PST)
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
Subject: [PATCH v21 09/12] ALSA: virtio: wait through signals for PCM teardown
Date: Mon,  9 Nov 2026 08:54:54 +0900
Message-ID: <20261108235457.12688-10-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261108235457.12688-1-mynameisjune111@gmail.com>
References: <20261108235457.12688-1-mynameisjune111@gmail.com>
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

Keep timeout and wait results in the types returned by the kernel wait APIs.
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
sound/virtio/virtio_ctl_msg.c |   19 ++++++++++++++++---
 sound/virtio/virtio_ctl_msg.h |    3 +++
 2 files changed, 19 insertions(+), 3 deletions(-)

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
