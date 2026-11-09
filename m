Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794201417;
	b=r1hBHAZtYVLbN2xP8sPTBdnVzUuVNA9Al1FgjpXJceN0ENoaGZqlkg+QqgfE73CCp1M9
	 St8ycs24RdEBkbKN6eaSdEg+2f3/XGc/8xOZ0ewSXYEiG5VrHiurcY07eiRebF4OmonQ3
	 GIaZZ/mboKFVsWdVwOwnGZF/k0JDUGmmMmp7bLaInkwAAYNSkq2d/P0mSJQbe1eRtsMlR
	 3DbEtKvUQqX5jWf4jNdrwNEFTW00LWMGEdMRC5r2HsvFe/XDKXBHT9Lv+QYuoMJk1SnMX
	 q4DyqN8FaAODLFvnldUU9jOKDg0CwpGU8lTVW8jlvwyXnFXwILFFKC34EE89iQsB6qQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794201417;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=wxebC5D/9DcGBbKajYZQRzTUBj4jQz6fe23p0qiGvhA=;
	b=KN3Fie9yytymUo+KrTi++cPbQoSZECr6IFad/19cGUjxYtm1G9juNcwGUls/fEd9AWkv
	 7YLaRPLOHCcQfN1yi6vyjYmwiRVp8ypd+gkKtS+6dsIXHA6puyGLC7tUQS5SGO+AqxzYA
	 WTqLFWaxh/05DnejKccStAhqfsXvOakU1smnuMdYehuRfn4Xbs7XUuQvDmK41rRmGS5h1
	 uetH+oA+MQg/LB2PG8tfi6mBKlgvqwt6fL0Gpc7mJsnkRmd7iqSLkBaB5SQ0W8IkXxUwZ
	 zDlkHjR2IbB2eK4Q+FB6mTHmq1GKMaeJyDq2EA5RfYalLy+jpU6Ym8o2xUIQy1IJgKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="QmlIWKE/";
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DA38606A321
	for <linux-sound@vger.kernel.org>; Mon,  9 Nov 2026 05:16:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1DA38606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QmlIWKE/
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-14394530ec6so543250c88.1
        for <linux-sound@vger.kernel.org>; Sun, 08 Nov 2026 21:16:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794201416; x=1794806216; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wxebC5D/9DcGBbKajYZQRzTUBj4jQz6fe23p0qiGvhA=;
        b=QmlIWKE/KiOoO4VxE6U+/XATGisTdRR/q/GHzwnMuIH5egNt5M4foLdye/4jF4e8+g
         6kB1p137nCTsnyMJSOmMO8j6YqqIGTYPBFnHhYR3q+ptLfG8yTU6xxD+Jh1gDR4Rfbqe
         pllqITACdCPYwLx4KpHUty/l4wjiWrB1i/csA+KyJDqz4NY16XtIRXMr/vb+EqEcxDzp
         O5PALlbRW7UJy6n8rKY9fIMNQ1lJ6eo7ogsDgCmt3QcdshZxa1wCvN1+YSsrmQQ9Hm6q
         FWwMwS0Ax/VPqTyCrpNBIv6ItkGwQxxB33H5N8IKOp26LxTddOwv8TsEQGou3vshrczE
         3+hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794201416; x=1794806216;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wxebC5D/9DcGBbKajYZQRzTUBj4jQz6fe23p0qiGvhA=;
        b=yT1kCIBuHiinLyFy+EpEfuo7ZBMax2CxBhMpk40m7IxXZ28nIYM8HMFqZo6AW+OVYq
         390iFJclMyfbVaj8VSlTiRRdUsY6TgSL2xbaaKN0u+BZvQSS0/6Ke3tzPP3DTNdnSo3T
         ktw6I72rtpl98knPRkvR1ddZUsVCo5Zut73XfcUpkxnYjmdJMX2vt+uaI4OalDYVyVM8
         Dag5kyi0hHB3m6cHLuc3VEEtLLVhHHLhJc5DnboKM4rHbRBc4HmR+BmZhgQMwNjA4u5r
         U2Uoosfpset0hjwqaoHIC/nuYuNAtn4qZa96znVREDXZ01SIiKLEavPdCLXCcLc8GjrJ
         Ni6g==
X-Gm-Message-State: APuU4Z+HCshr9DuVkw77/s7H1XNOGoXOB/khqmTk1WWwOBWx+uVnRnhW
	LLWsn5mX3CMSIncZgfoEFe26QzfG50Tp4mhGoBXIchFP+YYSF0EjG2YOdtyZIA==
X-Gm-Gg: AYBFou3ooKxr5NyfHq+p+onreydF6dw0+g6DaZ+cdYf8RSSBepl92gR3hhOuXDAG4xb
	KUANKPUFHgcYnEM9rQGbj9vEJi6nprcSoccago/m2w+I6QS8LVGgo6x3QIFjY8x11601Q6VCtT7
	HEC9Efv0auVeSvNY+Lrb7BTqM2LFvidlZZyQhaOwzGtB+ygUWu2n//BUbwp9CZ2RzbMduBhIVj1
	5keG7p6HXcdnk0z3g8bd4Bn/jBgsjvZBDOowJdmEKMHuIXzWvRvLcUO3Z5+rpklVBu1Cy/4tzfx
	6uGellBM6B7Iiu0cgQwCxUxwuhAlPMC7r5MIrWX3qCDS/olV3X2f5c22AsiG8AGIhpqxP2U45xZ
	BTdgUIxyn18R6QjJmdVC7aqMR6gmcSRbWTHbmqrGBZtznBszp2mfrVtb2RT5wqJd9sgIH9vbq66
	LFuB+DlCCf+UHo2G8veTqMeJvF6BJ+qQoPlq7shUeD90T13lE1oBnKcClcnXEGyzlXy0ba3XuEL
	ZR5TJXeGIUDlhMFAl5Yd3zSk4ddW1ae17BWSkl9WDwAjvFo7m4uuBB4C2l7R2YtbZu3b3PLiKEZ
	kAd7PCCfczP6O7+H+fkqnOheagjIKn7DQ1jZ8ybRYn9DvfMsJOvbXy6tVlyARkueAReUS8FStPA
	ZvsOJN/Oi4PZ7IrayNmSB4O1gLiI9MY+LCH2yKPZ7B28Eds7nQr0xqJTdFWaYVPNtjDAw
X-Received: by 2002:a05:7022:ec17:b0:19a:ace1:793b with SMTP id a92af1059eb24-1b39fed0700mr6138711c88.18.1794201416127;
        Sun, 08 Nov 2026 21:16:56 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b37314826asm11395635c88.3.2026.11.08.21.16.53
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 08 Nov 2026 21:16:55 -0800 (PST)
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
Subject: [PATCH v22 10/13] ALSA: virtio: wait through signals for PCM teardown
Date: Mon,  9 Nov 2026 14:16:15 +0900
Message-ID: <20261109051618.22506-11-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261109051618.22506-1-mynameisjune111@gmail.com>
References: <20261108235457.12688-1-mynameisjune111@gmail.com>
 <20261109051618.22506-1-mynameisjune111@gmail.com>
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

Assisted-by: LLM
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
