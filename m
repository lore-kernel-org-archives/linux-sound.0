Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793981954;
	b=CCgnUvFHtGSbUVkv/vL+hr7Z2slwZb/K58tRFqt4iWj/bkt7x87rgbVBF7MZHUgzL+og
	 0pUbKoo99CFRyUgZuJyofIVzSr5C+HgwdgKaXEwAv+k48/GXs4mRcYYXxU0sabkOh2bYe
	 SoKA0n2Fsj4KjzYOqjZdq0JXODfF2KbIdgjCumCDUKg60JoYCICbL9nSt9dJiGXZ4tJAK
	 ilLQkinJErXUN2z/4e2JpK429TZJbGiIGkjzVAgk1THoSRiDvf0obQVH/GPDfyfb3OTQU
	 CyO++G40DNKlNR7Nh0Aj7flAsUGlNyZJI+BJVuZei3hIKk+FPsUEtUCekUhF8tO3gTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793981954;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=XF2VmCDJnpXIgiFaGUBtPdUTCN/KhchAk0nVPRL7Ydc=;
	b=vlAS4pXWJF0dqHrRT5qWjrlddosvLmPTeuK4LyHLbDXG5d1OPWYSg0cHMOmar6T+FKQy
	 xeJU7U+/fm6fu2bPyWdorxfGPoMYf1gBDPfRzbPI9DV0KK2D4L4GaVvCPTXSTRrmtKKd0
	 9ueqfwrM+fYR14HXklhWa9NZBuXrt9be8zd6awP70yeXN5VBR8SlSNUefCsQnW0yullGz
	 hzSaCnd65G5OBAIAWh0FrPIBEPQHDSSokxjbgCqCWvoTVtiDIrR8xAWyfMhK+dOLk8grE
	 YOh3yzcotJThC+hWda6pOxCXM20gC1fKfK+/X3y36+XNur1kQ+hWtHIz7GGa5GkSV0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v+aig4mo;
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4FB06082BFF
	for <linux-sound@vger.kernel.org>; Fri,  6 Nov 2026 16:19:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4FB06082BFF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v+aig4mo
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-170135e43c7so1486272c88.0
        for <linux-sound@vger.kernel.org>; Fri, 06 Nov 2026 08:19:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793981953; x=1794586753; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XF2VmCDJnpXIgiFaGUBtPdUTCN/KhchAk0nVPRL7Ydc=;
        b=v+aig4moJcdIx7gDTwAhrxMwazrjkxVHCyv+1D631KGVqEJOBnq163hvsMMehOLr8G
         h+Qcgr0+CxRmVkfNxIevdEjAzrTVSco+NLyYvQC8FaRxbDQGqD8Xk14prTmoaF5USwFE
         Kj6Y0Y9sJzbx5jUYaxJ/e5KBYD0OtcGBquXkkFxup/wO7DmUVXPhEM1VltHPdTB7xKDO
         M6FpgXsP8RjWMHf2r+TpW9b96qm1qfK8xPigz+oHbb+rKmBVsCiPyhF4lkFWJU0f+g0L
         gzrrlfl5wbQcj1qCuaK+stG/35m2W4w4oSVgElZzFK2HsUmXkes2g0TWSgdmjgfowuRR
         QaQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793981953; x=1794586753;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XF2VmCDJnpXIgiFaGUBtPdUTCN/KhchAk0nVPRL7Ydc=;
        b=an/do9pct2b6ijD9Hx2BUdSsSuMqsyhY4CKsKXIZsObNEl0QeWTFiPHSnymmEjPVVe
         ruJ1SY4B4Kt4R19/WdZJLLG2S0NOSvVbqtdAZKzKeojN+rX2DxtQdN5itAof4Aob6zMP
         L7Ls1Zc7RH+Ndqfkvx5chtMZcFtRAXlsmZW7VgtajfL0GtSnwYpovFsnYG2SJgmBvlJK
         bpl8M2DLPLf0BTGTIx/U+1N6vCu6eo61CseOQcOfFpq9qonLjtr9mS683pCHgKWcq933
         t7xde0VQM+eFb9cK1cflSdNbnq3wNuPQZkEqAGxEQuBVOI2+fcHW09vjDM+/8n5bHAxa
         J2IA==
X-Gm-Message-State: APuU4Z8j24ICUmnpE8wzeMWNfcaG63LGoOrtTIBli/QV2heKc8ge4MV0
	U862a41oZCHMwxHIhcdUdSR2vYswwYHduUykj6fB/QPAyA3XXGCdltgeCX0g8+Rj
X-Gm-Gg: AYBFou3YS+mPgozpFdmfeT+8PNKEbGP/B67eK5UvgMScGWEDqFpvvsjjokmQB+lSwRW
	grkhJtSDMSkwczdqVTIlQLMRsdlqA3MrJobtyxDn9vIOKBuhNRu52iGIoPJitd9Zu2Boho7X1z7
	ABraGssplZJG85ILtVTZbj16WppE0wyvgDjWDnCuf9QxenZA1YnputaUreeLaYIOjSvG55MWgC6
	zcP5elbIwB+MdBu2C35BvX2vogEb4Wb2U+FIbBJbT8fy6yqb5It95maCGhUP9XbKRlLp63UzyWW
	LqQlBChlXHvNf2ASD+1S9dR3xvPioPooFovWrj2VkHcbS7kNb3isMYAuqy2cEKpCgPJfsQH1TyL
	LyPNaXOZA3whwtIm17MGNcEhOzUl9HrgvpNtK0Mvz//eCYXYi/tX1/r2c31gF/lU1TwBfi7ji2V
	dClmhn0jmLAz4NvI3Fdp0lzo2VEsxaW5OF2AKqDzHawLA5461s0F7IdQrLChcYEEnnrR92lUZPs
	lzY55abbp8AC561P+5kfp8Y7bAY/iA58AcOx6n+L6iQKSGusNeK94Js0ug8CxLP0lvvQqb8oAM3
	+DpAQVOKotMw2jAKshEVsZ4YgplCRLAGbPH+c7zf9Mpn1QkZjHZe/w5xJiFfaaUG8RTx76Sujyy
	YqhgaZJh67senodHfpCpdovfspdOffN+gRLdtm6uf6vJ+jQ==
X-Received: by 2002:a05:7022:ef07:b0:194:9e7a:3ba2 with SMTP id a92af1059eb24-1b25d29407bmr4211846c88.2.1793981952881;
        Fri, 06 Nov 2026 08:19:12 -0800 (PST)
Received: from localhost.localdomain ([180.182.24.11])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4840f3sm13139526c88.5.2026.11.06.08.19.10
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 06 Nov 2026 08:19:12 -0800 (PST)
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
Subject: [PATCH v19 09/12] ALSA: virtio: wait through signals for PCM teardown
Date: Sat,  7 Nov 2026 01:18:35 +0900
Message-ID: <20261106161838.94308-10-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261106161838.94308-1-mynameisjune111@gmail.com>
References: <20261106161838.94308-1-mynameisjune111@gmail.com>
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
