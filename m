Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793263868;
	b=EnVYj/YFZOYMrPkc6JApbQolj0clvwHaH9bpC6rxpcx17oVJizzSSX8aROCJ47EuC/Ed
	 49l1ht74lUKlpO1Aw+KGWPDaHEM0xQ03x76ZFlYlCHkhOsgv83II/isGQ3xWumAc597xp
	 NTm5iwgHYvV/Uir6Q9iZx5krZhpX5pdjzaHJM6ws3Tc0DKGUBJYbgdNp8xtWiKjIqSz0K
	 qMIhb1/8VtNvY21oOP5Wv4fNgpMhIs2nMbOyzLeVqMI6nYyjPGOMhtRPJz1iUc9PgM3SS
	 +o515T2TBuR0j3eHdsdrv7rFGVZez/U7mLAy4IHGTOVtP1Uvs6mSebOulQOjNsPWzWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793263868;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=xyRi7XDKpXV1gU6ovNhxbTiviMkA7YCbmNrm8NAAe74=;
	b=NqJ7Jgg6zpD5lOFc2sE72sjgW4gW1wyFtXotbFOVLWbCwStc8iyUwArtz0rsRPEch2LP
	 9eDTYqxGSzfmgPsyZiUBmfN4PlWhsyvTHFh03ZmW3E+UP4WsotbaNbv+a75nWvpAv5AvP
	 Jw/x6EPbY8dL7lrYCGbFEOZ+wQSKLRKvBN72pd/BVRaRERjoFe1UnvblR4ELef8uJIjcV
	 akV3wLop02y5Laj3msOmowbawG1p7g8xyf4q0s4o+3jcHgrBUL0JE9VE/a7iWWpIWRnPF
	 9eSxhgPRe8Rlv34nUzvy/jSjv5Fo3bveydQhO95gggfu8NhrNOYbcidGVhBxCpKgk9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EoPtuCuV;
	arc=none smtp.remote-ip=209.85.214.181
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9A16606A32F
	for <linux-sound@vger.kernel.org>; Thu, 29 Oct 2026 08:51:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9A16606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EoPtuCuV
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2e9ae391a05so3608435ad.1
        for <linux-sound@vger.kernel.org>; Thu, 29 Oct 2026 01:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793263867; x=1793868667; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xyRi7XDKpXV1gU6ovNhxbTiviMkA7YCbmNrm8NAAe74=;
        b=EoPtuCuVkfVEiBcmunJ45fuIy4+1yyA1LEtvJifv2/kFEP8VQIvH3laK3v3A1m+Viw
         f/oDeJoJU3I1toYw1EmhQOHFwJkv09LhcX1hqcTvTso1fFfWIjONvGBQRgdXcLKmBKYL
         YVR8A2EZbAhSqC5WruSRkpC+o7Bp9b1uEDbV+JDCQKMiqQ9m7cRSNdfx8WJPg60zbI8f
         ZIFb1hzCj2szq0nC8QvpAEmHgqWWKVc+2BTYA7Z3qiw1n2fCIp7NzVj+wKy3uhKI69bU
         CVsY1U5x9ogqoUlH+I7eac644zJGH6jtXVNYhtF7zw+kJnPOvE8h1SbAv8VIlGqp+umh
         phpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793263867; x=1793868667;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xyRi7XDKpXV1gU6ovNhxbTiviMkA7YCbmNrm8NAAe74=;
        b=IJuU8QWYfZQMRU2P+WIRUWlfVFlMp8jWkswfvrV8W3AWUKtwnWiP6CACK2QvNRGYTI
         1ge7a1JMZIdeVn61xqoh67V/1V5uNK/Jc7hl4b4a9XKtywiAQuOxgoLd7vs7HStnZybU
         k7HEh2qc0s42dxs8G6xOqtPwItUfeiaKZuYitvRfs5UWXu0G2ESeiZbWpzPn5j4j/+f/
         qA1JBNhtjDmhJ5PJJK2sN/PhZyaZP414onjIRQesx0EJAsxZJQzAK/CcqKJnYIDAcuBE
         QLrngGloYHgkkVFm3DS/2bx3z2w2BA9JaD/Lg9k/XDxp8ahsSwKtO9pHAdOqmreBalqH
         j9dg==
X-Gm-Message-State: AFq9FYKwjfU6Foehjkr2+/SM9RggGZ3rwQKc1ZI20qK+cx19Dmzpbc5K
	KbHM00SOtqp/zDVOiTqcer4jU0CnroGIL4saxD4sTwW2WldCDrdK13ulwNzDUA==
X-Gm-Gg: AYBFou3QJl6H2G9JPc2TWk2ly8prfYDh/mDx1Bo9A9k+bUyc+1mJ623w2784lki4bgd
	0lCR52tRmzVas9De1H2GU54T82MvqQlAM4kOoQNt/6FTd55IQ4E44PLE9pOwtrM3EaXwPskBngY
	GkzhNLqLQmcBj5Z86I3O+5PkLS8LU20I+gErqLGBe05APbRbLn9ztN5htigaX+jNUbr4LSZr2N9
	eQrk1+f8TWqObJND6I20qWNBvxrAR6GtrDkYEAYE5lSGC0P4xmMGEc6qGFNmWAclER7MiJugn6R
	Y7AYIHEjTFojuL1AHt7ZxQHdSQldMSkICh1NoU44URFsmeYqCZuEULoarFK+n20JCTF4VADQJU5
	tYTpee/cp6EEYMrU6MGm1BzUbRoihdEcmWT9KRVt1Pc+2CmzFDXn+njvL9ze4Wer3VOnuKPCvzY
	1MmCgfWLTQiXtBcQMIf4BKP7GCO9QSgqkyGDfrkheS7tIbZeHS2YqHb/4NC3WxBqOiIgNk95uDa
	KFeF/aPaf1GtPWvFt2uJysWkWu3HYzCl9RDxSkRiBlfPdPuYwUwGG3wkZxQ/xmzaljQloK8Qotr
	KSgEPh70C5MMXgPlX2I1zfgcUoWUR+cHs37XEtmNADDS2fS1/UWZ/u0zrh+I4ybdlW5Esc97wdW
	EetWmIA5ouS6CQ64miFUfqKrhjri79QS8XfeVEzweAg==
X-Received: by 2002:a17:902:dac7:b0:2e8:7a31:58f3 with SMTP id d9443c01a7336-2eb1ab12bd7mr13690405ad.19.1793263866673;
        Thu, 29 Oct 2026 01:51:06 -0700 (PDT)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6bddae0sm29991205ad.35.2026.10.29.01.51.01
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 29 Oct 2026 01:51:06 -0700 (PDT)
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
Subject: [PATCH v9 06/14] ALSA: virtio: wait through signals for PCM teardown
Date: Thu, 29 Oct 2026 17:50:24 +0900
Message-ID: <20261029085032.70689-7-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261029085032.70689-1-mynameisjune111@gmail.com>
References: <20261029085032.70689-1-mynameisjune111@gmail.com>
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

A signal can end the interruptible wait while a STOP or RELEASE request is
still pending. A later teardown may then submit another RELEASE before the
first request completes.

Keep both waits non-interruptible and use the existing message timeout.
Other control requests remain interruptible. Device reset still cancels the
pending request and wakes the waiter.

Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
diff --git a/sound/virtio/virtio_ctl_msg.c b/sound/virtio/virtio_ctl_msg.c
--- a/sound/virtio/virtio_ctl_msg.c
+++ b/sound/virtio/virtio_ctl_msg.c
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
