Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794062099;
	b=bjv+X20UM/csZI5bPD6jvU+QUJIvyNscxFdIUiDdeJj1VUEv8/8j3nkKsE4e8qcsxt6D
	 d/H6uyqYHVIOc0yd1jmJb8rnxsDhPY1aHr8E/0yFkdc1pHrrJz55Lp7mBk65apsvUbFE3
	 AqOO2gHGTXiHS1Wr6lacDOxb94L2W4UQjtT22sGfRpR1hjBgfJ14oUyFsyFCj/om2jZBj
	 SYgGNkz7TdFm+/h7EOHjEOobQVqZZ/WJlhZturTim4FEZnHlYyws6OiIzmEGLNyZ4wEdj
	 Igbk4TYzH6Qare5xNdT1+I+E5urny7vV7GPZ+wKD7ZyclTw/2qz5ukf8cl817bhzYIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794062099;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=XF2VmCDJnpXIgiFaGUBtPdUTCN/KhchAk0nVPRL7Ydc=;
	b=RJQ20g5OpKeqg3smGL70F9CtFVQoUkkDNGGWRz3rfxkpkadUYHfjfidfsRlOsJW5QEHS
	 O9OdHhMEgb4h+I05SGemweFJPXv6S8m8Kfcd6VEo7xbC4nLZsss9eSLQvIViFGkm27xdu
	 ysOWWLmQmmn+Rucjmbw8pzdpMeeXlgHHigJYLdYMf7dLjTme3Jugt8aKmfnc3LC1fmVoa
	 GXUZpERnO0g34Tlr4mi3EDJmcOaLUn4GlD1mt9/zV+og3sjzjPNbuNAvsD18Nvv3j/sLd
	 l7E/XCwxoB7KZ53F0JwmxNGnX6H6SVOHbQ9sEeggnn+HvrajgEciNi3FlAszm9ECT5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="0ChFYZb/";
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 874DF60A2619
	for <linux-sound@vger.kernel.org>; Sat,  7 Nov 2026 14:34:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 874DF60A2619
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0ChFYZb/
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-37071c0f42aso2156328eec.0
        for <linux-sound@vger.kernel.org>; Sat, 07 Nov 2026 06:34:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794062099; x=1794666899; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XF2VmCDJnpXIgiFaGUBtPdUTCN/KhchAk0nVPRL7Ydc=;
        b=0ChFYZb/ar2yjXHgRksBmagp3HbaVabr2QfVW9adIQnbO39hQg1kWHUAefGnan6qsh
         F0Qt/9pNqleGjL0mNL43iM+/IQ1IBAO73gDVyCsF+awUX+yRrtM4QH4ktzRyUAdtm+Ki
         wI3jZV4J0W2Fe5udlO5T+KC6heSjlaI9c3TBa4351BhrRk6Jo2x7sGqyw+4qNY01NtII
         vXQvJ/djxAjYHISKMqthnAtg569lEscKC1DpMlsPP0EIcvAV2BfB9lQZpUKDVSwDX0W6
         mNJXRUv6Pm3ltnkL00YPGjN6F8X5NX9BhjQmLCTB1pqhKqJrIgEBaPowbwvoTJ0Fh9nS
         oAwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794062099; x=1794666899;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XF2VmCDJnpXIgiFaGUBtPdUTCN/KhchAk0nVPRL7Ydc=;
        b=tz9HJaex6TFdbhTAYwYxaxVzplulIrQAvt86T2xjM8zOADm6Oz23NQyjyowIN+MBPA
         RIE8BlW844T+hD4UCT84cdEMehigfOGrzxr/LskJ3K7SMaZ3jquCJHyylYwwlK+msZsI
         9on68YzLKIl81/0ys4qzCHmC6H3CwZg2IuNmk5oilxa4UabBVfPopnse9pfT8K6+4YOC
         oX2hvafdq3eKGcOzYybapPJNzsfuPnwPX4ITCn42tBhpGtyjU/aZhQBdIVi82zFALD0P
         HyyxsFES8seUCE/uys9NzIzU1OOgPj2sM8JcK0ij32KrSvqziQSpodGyPhSPOlxh8UUT
         /UuQ==
X-Gm-Message-State: APuU4Z+C3K65EuNavpz1m9otgseM91j8tzLEGt3/27xFWtm19HzbDTSb
	WDHzs8UZHu+WrxHg4X1WEToeCNcUX60H2v2amyvZvRTahSAKWLmHJ3Acj25PRk8c
X-Gm-Gg: AYBFou2yvZQr/oWNAmG5M/DRB12KzWcY1nxuSzdS9CwKCI0RdnokJCcf4UuhlBNTbom
	uIwEv9D7GJJU6QG2qncJcddQUSyZ0MkA53zrh22LiM5sJUqllg3k6yJJVBC7s7WK2mae8BvUHtK
	YA0YdqENtGPwCpYZN0Df6cYtZXjofBvDj78F3gc4GdeBL6zP4E5PmXcOCAUXEdBDKPWXfRvdCj6
	GuJyVFE/cEGbFSkglfRDY0RYbytOB3Kr/HHO1ECYbl60RSRQSBs/Yl5qWtj383PWLTDTMiTyVC+
	D+rR9RY6d2wem1dOl5v4ijje0FnneKtO6rOM7B9AFdfdLC5WqB4sk8X3pwQeSBt/pJVZHowbXcx
	svQgm6k9Q//e/0Y4JcfI1K8CDpPv5ZQTx/aBzYIpkQ/gjMTOMh4RMqpDR3wjrqN1cp/X3Z78qk+
	TzBHFb3QtiqJi2sJd5ghsNV5yehZ3T0l37e7RGrBlky5LqANP87wzsxYH9DbAJO5HDH3N7qjpmK
	1g+6MMEeyl5nSJWgsGnT1SRuZbNFWjw4HT91E3wO+yaZDx2nGj7aO4idZxmUpH214AYec7Lo+qb
	Lvr11dZJ5wpexHcI5TJI4BoxxhpnwJQEipDMY9vHBwM9++T+mpE5cSTVv/cbkDUXNBWO5xmU7iA
	wVG5/ToBpc4/2npL7OAXCqd6TIGgZmfJ63axkWk4pP70wLw==
X-Received: by 2002:a05:7301:d808:b0:36c:9af3:2309 with SMTP id 5a478bee46e88-36f6f2a4632mr7502669eec.0.1794062098568;
        Sat, 07 Nov 2026 06:34:58 -0800 (PST)
Received: from localhost.localdomain ([180.182.24.11])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa9aea75fsm27881873eec.15.2026.11.07.06.34.55
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 07 Nov 2026 06:34:57 -0800 (PST)
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
Subject: [PATCH v20 09/12] ALSA: virtio: wait through signals for PCM teardown
Date: Sat,  7 Nov 2026 23:34:19 +0900
Message-ID: <20261107143422.29319-10-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261107143422.29319-1-mynameisjune111@gmail.com>
References: <20261107143422.29319-1-mynameisjune111@gmail.com>
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
