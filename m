Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793845940;
	b=mzyV5csnYWLcpB1n7H2C989KN2dYX8oqCu7GXFlkVTIbhj4e5najP1MPFpdFv6PsPCw3
	 U/uGz9qCMfn+DRp7NaNB79rTTX8ToCwimkinFkjF0/PAyxJWW3ZJ9eF1huft/B0FHC4Fw
	 4gOQ8M3riDVZBc4QOZRKcKJrb7rCYMpaMceG5QKHPiTOCmShQr6+v2nGWmXv1GPowwN5s
	 Hc5H9SCw5Yc5RiQtRmEjpJwVIGmkUBhZ2DxwmZ8wYOA0UOJZ/vCcgJpnXJYnbMFnQFt5Z
	 0k1m77SvOBrZkhcOhDDfUfkAVn97OpKockxQETwKWYXXebZHFgjQCbxuUHRAyzNN2ZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793845940;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=+MrFgURXGVOlsfMgOcHhXpqYFBlUXyLFf4QG/xpHN8w=;
	b=0GxO9bmsxcAJa/f9ulRdPvm9MGM0MX5Dd1GMmvCmhyt6HpB6YcsjJibFdX2LJgSTvR28
	 MjoYfwv8/zX3qFgOsVAZC7DDd6y8AoJJKd2+HapULKK4R7hdiUWJlc3Q+UoN0cyF5yqAd
	 Xq8oXEv8/s1B9iDQWQvwnRdJoNdj+4AFnJII1OKYcbzlgubR+GyQeP39+rfk4hwqGDBAo
	 FSclJoOhZ1CWBqSwGiRyyisEs/YMcNFQqGNK5lGwa5IekhldPz0KvNBog5kHXk0YcrZh0
	 nroc3gW1v+3pWg0lQWXVaeN0wjWLNuha1RR0gnIokNdfAhozB1J59BR2vc04S2I2ITA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Vv9lVfIq;
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71260606EE95
	for <linux-sound@vger.kernel.org>; Thu,  5 Nov 2026 02:32:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71260606EE95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Vv9lVfIq
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3ac7842c17dso956004a91.3
        for <linux-sound@vger.kernel.org>; Wed, 04 Nov 2026 18:32:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793845940; x=1794450740; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+MrFgURXGVOlsfMgOcHhXpqYFBlUXyLFf4QG/xpHN8w=;
        b=Vv9lVfIq/uGJ92iz3/mvZUy3hIePG5UElXuauRlR+iqCnP1sx89GAXQrx8D/iWJip2
         kgeN5AR6Liz5URIgTLQAdRyX1C1KnS0LuPPef9+gy28JTiTIKb1MARzID0UUJHPtOi+v
         8oJGsVAedydWXl7xRsaokKjNL0+fAxnMU6+YRgLomvXnaFvwdMlRDCYrztExIUp5fUXB
         m/yyffdRUaxVA36XvGjx/gNHck3rnE7vj8e8CU+kIvJPZnuSsuCzP3vw8PIb9FdPhjMa
         Aw3dCk5rUz8ViMTwH2xCdMS6gRGCr7VhnelEvinwourcZhIdLf280N9xO0ZSzRTt9TEd
         WnDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793845940; x=1794450740;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+MrFgURXGVOlsfMgOcHhXpqYFBlUXyLFf4QG/xpHN8w=;
        b=XTZViSrzEnUtmZnyK/odkKhIz7zeYAAvQbkCTpMIg3+FNwWpOpHW3SGWqot5kfCVjq
         pimiPfE03flUPV8OrIhJGt4S5NNnrRG6wFvN86m/UIitl+PcdOWe/I7KUZEo6tUXLzDJ
         QGiesv0yXYwUpXWV3rD/WVwwc8F6JEagjri91tegYqdedq216sFVIj0jzxtRJD72Dfn/
         QyOTtXIUEn6skL3Dgw40VK0lyorKDzSKDngsnCtuy8U8cXbb8hKMKHUa6NDdnQxJ6Xcr
         JRzsUEtLE85/gaO4UMa32Br8K6+PK7knHf0KJca+og15Vh8voutOhaiPXyijcjlTFgCL
         y7rg==
X-Gm-Message-State: APuU4Z+hV/jWSLoHzjYwaBDSnfhob/74xw3EwEbcl+WsM0f9UpxXFJZg
	4ogqI3i8lLx+yOS2Xt5K7CQc2sIdcl2NYILTVSKVQcLt5VOVbcrIB2WtSvBLfQ==
X-Gm-Gg: AYBFou2Dn172MuVPdNVXXN31vSMCAry7f/Dqq3TEYHJDkvlGeYeNNhkMafi/fMws1+r
	BMxLXBz7SJBoiDJSNGDL5/Gif35KceekSnvXhvZw/YG+lgzk7uZ31Vy+Mz6r7Jl9r6Gi2VhryOC
	/zztL9KhlUOl5yoceCY766UdJzxVTSYO/oFVuJpBiHa8Uxdrk3cOY9/xICynAoBkClYv7QzyXiS
	kUo5vb73MMJvmo/fPUJGeRQsV1bsfCsYPswuEE+mTkDXTlWpxN6MFOtO9uwfLubpf6kQB0bb0Xp
	umsyTcIwON3cCSfFjbXbDWLbosJpujq50tt/cVpG2wWP8xw/tT3PYCtgP7h1QUHeBGX4/Yt7nWi
	6DtM3CxgVjGSRVVXXs5EaozAzszIJj1b6E/KUDmrIvWw75VOO/d6Q75J1hc6dqxY1++BAO29QyZ
	zQizdzfSjNZpwtTr7EvY/wGdtIY+bQYiBFPU52LBDkSjZIRvo3ETi2rHNBtSrEZQNfDyLqiGTqr
	c0Z4YFzRTRV+gqZC/9iBVWPKCMH02QyA1kN6rDSLRKO+dpLyVveIWy6U2SVqLJi/D0R6Be5SGWq
	cR/ZYqKmnnqL85GUif8uYNETj9zT3llsOTY6Nv9J1xkCZEHRNLz1XFnZ6kAOhhQV7TVP+iaKVco
	dZPt4epZqZORh7NfVxppXsW6H22shxP2Ww7Pd/thYgdH+b4zyxFFCdhxFaJHqUN07t0lK
X-Received: by 2002:a17:90b:35c8:b0:3ac:9a5e:9ce7 with SMTP id 98e67ed59e1d1-3ae897aa7aemr15044527a91.49.1793845939762;
        Wed, 04 Nov 2026 18:32:19 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b323cd3csm1292775a91.3.2026.11.04.18.32.16
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 04 Nov 2026 18:32:19 -0800 (PST)
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
Subject: [PATCH v16 09/12] ALSA: virtio: wait through signals for PCM teardown
Date: Thu,  5 Nov 2026 11:31:37 +0900
Message-ID: <20261105023140.18373-10-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261105023140.18373-1-mynameisjune111@gmail.com>
References: <20261105023140.18373-1-mynameisjune111@gmail.com>
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
