Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793923640;
	b=1mgjv42KbDh0dpF+uK3uhc7n/oCmHk6OX9oV9gENn8eq9J8/YFWOeGgLR6C73uia3o02
	 4QPnLRyMhhpqcfktWERZ7zY4r+uy1uWkNhvpV2l3Xbdwn07Mjm4Etw+7RUa1T96luBPfT
	 jlxtG3uQScKGLgGVBKjZI/FGoLidv9oy0Baqh5qJZhLru582sa0gFgkB5Ivssfhcjwe+1
	 +PMtiZhQ8YcN3m+qJCKGn3gQgaS75teQHbuv9lmTKf+c+KPTXyFL+gWAk/I8ZbVMjwGmT
	 eicEGVcd0/MfXU57vIzb1ambAez9xnqwPu9HVkAsWkRT5YMNWnzCNCLLE9PfGU4cpnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793923640;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=XF2VmCDJnpXIgiFaGUBtPdUTCN/KhchAk0nVPRL7Ydc=;
	b=rMPaIUyM0ltMNfL+gMZRih0luCOJ9HA6QeaxLV/AgFCGO51j2PDhPaXm+cGhkFRMzu3d
	 8ZBbCPcHtj+WeBSEtenW6Kg9KquZ5lCuQjXrDb2+DNdi233Q/QD7RCFGjoN+TyRP3MDld
	 sBgpKu/CQL/vOn08uvCwmOE0Xa6MkQj/AU5+riCPuk2sU3arRaQsqcAJtpmACNE2G/D4n
	 IGZqIr1L5VZuWIfGbREGOYSYVc63jXQrdLalHpBAcehH2lbUH7dmLlGXHm2wL1qOplHOu
	 N1cabWA6cJ/EFPzRQqNeq/3TFvNtAKW9uPxB7oDlI2bXrIa4FD4bcbu67SvL0QcWj2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sRK9sY3D;
	arc=none smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61115606A33A
	for <linux-sound@vger.kernel.org>; Fri,  6 Nov 2026 00:07:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61115606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sRK9sY3D
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1a2af4c8d00so282037c88.0
        for <linux-sound@vger.kernel.org>; Thu, 05 Nov 2026 16:07:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793923639; x=1794528439; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XF2VmCDJnpXIgiFaGUBtPdUTCN/KhchAk0nVPRL7Ydc=;
        b=sRK9sY3DSDgmEYhTYAcHjTmIoyRJNRfdhaKjdwt9pHcvS6j01bgZH17FFdULdq6jW5
         hg4HG0W0zcezriedl16bcdhogjI2hiO0Peh7ckuaSrORiayKlcHIV2X/0fqqE7EY3sl6
         pjB1m4wb7G82KnoDCKBuJS1mf6mdnXqho5gqT2RKVSFGpUH08mdzfE3vMM1WeEuwi8hx
         9VXCwQKFyEx7dkDGWvX9TzxH9dZbDngSpt7QEGdvV38ctMm4Yd7nMfvqakddDMesQs4G
         +w5RSNsMiVUqycUn0KF+l1QueLBsFntbUzYAtse8Ifkum7mJH4ljAzzz+eMV9/gsmOCZ
         Wo3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793923639; x=1794528439;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XF2VmCDJnpXIgiFaGUBtPdUTCN/KhchAk0nVPRL7Ydc=;
        b=zJ2giy6hTk0xoXsMb0teY1DMyzAxOO3MrMwl9UyOofSUPyD5fcm+G7RiunxyeWL+3Z
         BZ4Wq4xqH7e3/yxSbaZ0o+PYgzqesxtp0w4dOIH4TBglVzjZ7A4k8MQSx+jZhejEzMJi
         spPk6XwtJBu+pIfGGM9QpuCDoUo4oegTe6+TTjTutQ1P8DVSKIYOSECdDkF4w0iYm01O
         FVFTBjEI130o/VepUG72F7T2ShNpasrZIyiLKFP5Xijuq4t1mrKq+f5zUEgV3wX2lVRD
         wL79or4gtMm+ppKGetGi/iF8XHxlPQh+R9940w+xdswEnys2NeGu4Il19r/riZkfTWoo
         buVA==
X-Gm-Message-State: APuU4Z8nMyYvB0+oN8D+8hCjPvb7oELkTR4SJrDmmPyspQSRDRCq9SJw
	0dXHxvomOUAODGP51dhfi8wRhgYt3a0HwW/22LdvQqsnznM6KIjbLCzdrKkrVA==
X-Gm-Gg: AYBFou1jH34rBWq+R9m9ZHxiy9+Pc2d1vr3BDlQo4uF3dD2oZIH1cbFjDgxBIj7g8Wm
	LjHbq/e2uFEWc/oL8ZW6BGydd378UQjO33oMrSa47tDO1OiN+r5Td1KD0eaWNm6v31pw/FC4f2F
	xteo//j5sJkU1t4vWat2M597/UwZlL9c/Gx9gTjO3iw48svhWzQRDXt58z1nCWteUoqYfE3fcqp
	m1X9Lk9MMoTr1DEWAmFMeRE6+ZCHRUvBCflGnIgi6hMTaxoDRkxBM+B/RCHVZA4vUHGwiIwAVM9
	95iMB9hZDjzmb4DlI9m+UFXr7W2cLZCMBa7doWReT/De8WUeZB0+ED3BmbIdfoH8Xph7OyKRFXa
	LgdCKcZeTdFoOhfsUo14ciy6lxfLEbphSwNfmL9PHFgSbQajEsmMFlH80JbI4R4BMAF7bwA7Mtv
	FDoatV0KAT2XVYaRtbWJpavP3/kVLDirE0TZKZT6YG+JfGSpAPmi9m1/p0a5SgUqUzks0QJY3n/
	C4VWnKHeLvYyjKefGTJ8iCVWrB5RACO93NpkFtd1Q1bY3JcaF3dackyLGtWyqKKbYh5mzpc6pCV
	UUgWIRi55bZBgfBcWwT6ISjTTRXL8hg3T6c3OWL2rJy6UrkXmatRGQcQuYsSqkD//9AYk3sgALw
	QxtDJhwtKu+CVCM1xUjKEYQVv/9rBZiENArHHr+WjDaj1G8g=
X-Received: by 2002:a05:7022:6983:b0:14d:baf5:c415 with SMTP id a92af1059eb24-1b25d30ad8dmr1158836c88.7.1793923639260;
        Thu, 05 Nov 2026 16:07:19 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4e079esm371165c88.19.2026.11.05.16.07.16
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 05 Nov 2026 16:07:18 -0800 (PST)
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
Subject: [PATCH v18 09/12] ALSA: virtio: wait through signals for PCM teardown
Date: Fri,  6 Nov 2026 09:06:41 +0900
Message-ID: <20261106000644.20460-10-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261106000644.20460-1-mynameisjune111@gmail.com>
References: <20261106000644.20460-1-mynameisjune111@gmail.com>
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
