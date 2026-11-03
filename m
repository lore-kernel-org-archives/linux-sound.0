Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793693328;
	b=PJ1AiA+9VsqGDuY84fEpxKNWA13AB1tW7NeqeI/lWm75KE9zVFmKgj5GswmAyDORWN30
	 GUBQ9TZAekJuOW+d4tywC342IiLhd0kteFOLFuEPtCS9+AiWN749WJ0sarDCiIxPW+pp/
	 qp8USmZ3KGO214aeiBmrDIKGO4MIhYhGoIEBLHRLKjJ5URYoy2SGBrmJa1YjrvSxgDlII
	 5YCPf8WrDjDSNWFnVazGluGBr0p5Yz7oJVYJ0l9A2wWIg+RxBJqh5hZ7sCC49AI9TtCxt
	 wU3V8ABFZuMZ0Y8mrqSKxajsruzNYdsYxZyNgMLipfdmdsanqDzZyc3PrdulXWC7GXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793693328;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=v+nhGD2zjLwLi9y1syT+X5YMbxWrSCy0fEer5oAGFXI=;
	b=0uOLWSyXihtS7/KOX5sKr/GgebtLYojC6OGTrVgaOTeI401bVxbdaopzxskRzo5C9Llu
	 OVGR057gm78+QR8W+LcVVq2TsUG7iIFrEqQlX3Txd4qYjAA7etAuGvEwsv94H8OnF0lGl
	 D6O7qOhT4q9+6LHoAHllaetdZUfdLCNxaZNDTBH9PRuil9P6tRC9SUKKeIMKvi4ppkTS4
	 VmMq5bqmYgUtyzADScJJg0VWzwcJp3eye7dwLRFOrotDzd3pkMy4lSqVjWkNROUMt/RUm
	 kugYCbLrziYfRAFJnWN2nqv43fMjkaCxX1O4G9EWCSOXvoOZuOfV+Aan3xFZ5yODFRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fU+h7AQt;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5816E606D80E
	for <linux-sound@vger.kernel.org>; Tue,  3 Nov 2026 08:08:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5816E606D80E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fU+h7AQt
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-369f33df08eso7513474eec.0
        for <linux-sound@vger.kernel.org>; Tue, 03 Nov 2026 00:08:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793693328; x=1794298128; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v+nhGD2zjLwLi9y1syT+X5YMbxWrSCy0fEer5oAGFXI=;
        b=fU+h7AQtUyRV1ThAByL+bP/n5fuwlvQYIwDXUWYtZ6M0BetJBhhWF56TlPkk7IWmNU
         lMAPg2puy8Qlf+C5qqSrs+Ls3/8kML0KW85DtbH74QcAGL6jikXnPJMHdswQ0M2Q/Mzq
         kUpYy8GRAuVtN1EHR4sFGhKwkgDYSpiMKNjBmMuygQASLvSalTzIacJ5zb29G3OrjAIt
         nBdm6RJIwHShgZzPHJe1d3tafcryWlfKk2OJE1ZYOGsEXtV73/Z8S3ruwW9dzMbqXwZP
         VGI8xMGc+loKhZIkV7+K5xD+6UKoihNKYzYSYrre3CYKFTJ/g0wF2ym3LznnkFtC1FA7
         VbgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793693328; x=1794298128;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=v+nhGD2zjLwLi9y1syT+X5YMbxWrSCy0fEer5oAGFXI=;
        b=S53zQ7XycK+PiuUsrcbuAd4sV+zGX0ANKEmERvSZaDUUMstwSF2gLTxpqpUzzNNCuB
         lTRtpK2sPrC7c3ex71F7PUR+z73e+w7rdcCWf232mrYRgO04V7T3pkNeOA+9oFj9MUyC
         6EDB7jzbJy02Gz9BnAeAmC0GwkCR9mdlM0jWawEwNAamiynmOJNdjl+ZEfVbbittdFa6
         JvMSOkaoRr9UN6zPn7H+VFusz52Bq2U75QE91FrKz4SQUOAJHhjJ4qrruUptiJvuy/IN
         7Z6NFQZLtt27+Mfq1m7y1sCyXnH1pHahCGBf5QevaSPBOxKF3Z+Kdecm8XMkaOm7izJK
         UJ6g==
X-Gm-Message-State: APuU4Z+RxgarBCZ/rxZQiphifGvjapNvx10a63f1FQn84KGeoeEbu67x
	rA+wBtQCHC3ptjXxcbOK58D99lHNlb5Gs/3zKc/xSH2mFGRZfZk8BT4mzxfFAw==
X-Gm-Gg: AYBFou2fLZXl5WSzgorKU3od91YkoKVCVX70mNeBZzDHFyGb6KyUvP0SgpJpkIEfXW8
	0TLDxZmA/L2+4x71e/6BcDK4hVVeX8rnTsVDz4i51bjeLaD7g+IIcKUM9dwc7u+LP4rKHOv1Mw0
	KWG4o574OWC+SJmrclBYbb8Qk3qTaB4LUQVm/RZYQ9km7PQTAhBYjTxa9yg/oCkzcYaPZZmeVB4
	YigBAoXa1iFHdm2QQ1Jsa75p4Yz5/9wY4H5F9yJ0z3URy9xafYzmjEdoZsg/hoXRBuvCDBnwKJ4
	jrXsVn3m6qAoTZb8L4eWSxnypGBTL3+qL17Se9zJ0gudcw28gbJFvgW6/i3KHZqM/soUL5dog3+
	EFMoKDuPW1ipMFScHR6KWhOjopNFLv2YZ/FKyK2Xgi7UinSI4WOwSIgZSJK/Nb5Pg9yWdOuXiJt
	6sp8B40RQykY9k2Uxy3Gd6ZDPSHxdNX6GMRYYonouXqP7BzrKO2lYibozP+4OZwywzxuyRKJysl
	Uv1eUo/Rq+6tgeAzEV/BJvVMTNoZGvUc9xRf+ege6SqvMyeCpO1eQnUtptPtrcKUay/AfA/+Nfe
	IcoVbObk32b7pl/qjO3e4fCYadpyMnwcmB5uDj7KYnie83yhlrn5KTXJvpjvRBprwEfEhRick/H
	MpNDLXqS4SUotKAibqHbTyhpGVhbrbKRFbZSZ8cIcYyhSwfTTPmQddkbBvnY5YC1eHh7t
X-Received: by 2002:a05:7301:fa4:b0:36a:713:a76b with SMTP id 5a478bee46e88-36a4236a5c5mr20255970eec.6.1793693327465;
        Tue, 03 Nov 2026 00:08:47 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428fa380sm41468466eec.12.2026.11.03.00.08.44
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 03 Nov 2026 00:08:46 -0800 (PST)
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
Subject: [PATCH v13 06/12] ALSA: virtio: wait through signals for PCM teardown
Date: Tue,  3 Nov 2026 17:08:15 +0900
Message-ID: <20261103080821.16983-7-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261103080821.16983-1-mynameisjune111@gmail.com>
References: <20261103080821.16983-1-mynameisjune111@gmail.com>
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
 sound/virtio/virtio_ctl_msg.c |   15 ++++++++++++++-
 sound/virtio/virtio_ctl_msg.h |    3 +++
 2 files changed, 17 insertions(+), 1 deletion(-)

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
