Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793758706;
	b=leJtXsTFrphzXvrUkfSwYh/1Qw2MmeLKWV8QwfO88q36J8Zn5XhOxHvLk0BeObL+ovtt
	 MYFBIq84s0RMwsBwGmWpe6WmlxlNDRBGM+O4luGZsrF4XmpO3Z2Xwt3zFXie7qeZxyrIl
	 F6Ngx+R7COBauNpFPHHuGK6BfzE5Z16CgCydFAMYWa5XY+adIZQbTUjj9OOowOQrWKxZy
	 fO9T6GbwjzmFVJDWw1whnYsAv8cLse+T76x6RfzS//ZVnj9BuRwxkOj2JcfhwpZAa/Zy9
	 Q4BdS0r9oQRrq7obG8W6iP8oiyhRWJqNC8YmVu2MVRcIsIwgJeO/+zXXBB3JEAGkRDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793758706;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Hy/84DnLRHSkLYr0y43NMukCMjMkWuzO7+IZ4PjZ4VU=;
	b=m6yV36PLwlpvAScweFEmJfq6YXGNdoBKtngYE6PmD9nsH1ybKZX4O5j42lkNIXCgvX38
	 gfPcr+5j16/roGEC/7duoPc+C55+RKRs113ljMw1ikVCcsT4Gk52z0RJDtME9B4e9NYGF
	 9ksmANEG5HAnjWvlIGU3z3W+7HOfUXQzrlKW/CFlMV+wbCo3q+MqhEPk9ITZXmCmJj5d3
	 zA84IP1t1t0n690d0UEzkCOScWqDqIlpztqdrvhoYkcYRMFRLLWDiVvDeh3tX/CdF5YIs
	 wS41TW4MtSSynS8uqsq/k+X+/RuvHhlqwjgL0XiFD6JdjbMgBbadA2M4bCZEWUCBIVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Y3o/CCpf";
	arc=none smtp.remote-ip=209.85.215.181
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47629606D806
	for <linux-sound@vger.kernel.org>; Wed,  4 Nov 2026 02:18:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47629606D806
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y3o/CCpf
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cc52c1b8286so53334a12.1
        for <linux-sound@vger.kernel.org>; Tue, 03 Nov 2026 18:18:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793758704; x=1794363504; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hy/84DnLRHSkLYr0y43NMukCMjMkWuzO7+IZ4PjZ4VU=;
        b=Y3o/CCpfCiBQofPKM4Ywt8dc7DFmzbyUfKOWVrdCUW5tyOO41UUzmvQ+6Esg818GI0
         IuBUALQkirdwq5/BeanIktv80xC4d+A1y38PxF71Tg8yvD8jRU5GE6nzbysHTivnh7nB
         p5Hf8GDtgS4rsEyXCzRVf5zlCDasVYfrJXuvn7bui67frp9GBND/AfjuqA6NxIwDTAsu
         nAa2n17352M4IpomjHxS1w6vRYYIZu57gZbsnmLaFWtDs8CMWf4q+dFcNJFYrV797s4O
         jcNQjId8jP0VguTH7xjBsU7ReStMAJI1yJSwFc2KnP3CHdZv8Ykvf296TRluWTqbQ1tM
         9RuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793758704; x=1794363504;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Hy/84DnLRHSkLYr0y43NMukCMjMkWuzO7+IZ4PjZ4VU=;
        b=rnb1DNV1xy4v9zAlzRyxM9kQfIWz+tj/lo81VPRQ0eZFrNhVGh2EHTaJdn/oQfwnEb
         kZfAREuNtwn0xeaQdeOxjja9809BzS9MpDYWM+5QFm0kJ/3sFGW6M/aL6+T1s7LnhvCe
         IObBKfdUXP0GJB5MrUWr2fy0Ci7pApzuu45yP8o39DkuWdzybCsEOA8i3xi2IgyLrj3i
         3tgHkvEyXDZRl3vG0b9N+aJZcgQKP9xD1Lkvu4HeFcW2o/o02Wp67H+KWEyUBC36Nc5s
         M5SJKjcP5epCmRgXP63hHoVRO8MyNdSVhjjN5gJypkb9+Fj/sK5iShpMvLN7AJiRrlkl
         cs7Q==
X-Gm-Message-State: APuU4Z8Hkd/zloF4pqR4ufHzgKCroX5uShvx4CppDagqddvfnWDbvINZ
	bJqv6tqOhIDF3li4aD1MvA1o0hcF95zf8MEglZ5lIxFUo98MR342JLDExhv2Fg==
X-Gm-Gg: AYBFou1cUxTcjyLIOYmqz3Y1DrWP0JFFoFS8/edeO7j6Tvt6eYWIIe7dxtqVacSWOd6
	A5Yirh0NITdfWCwpcHP8/IdoT+wscJR8m0m1j/i3V+9QBlChtq+6BPqXmdglDUu2x8a6mlPgo8F
	ofoTCZWkSlatnzjnYRKqZbMRZoV7LVMG/KP9ZZUNlYnOvtc/HInG/1KOGNXNuytybiol+8xAg3Z
	ztsshIwc+CVpzRWTU/T5nWHn+o01wl+H0o65YtE8mk23Ra4GTtMXx1+dp+uLK7BlCdmxPvVFVT1
	ey/M26JKNUgNTg25Pl+jPxkdd6+T0F4UDRlMncW5U0Ojhq6pwZ+QAax8ntsDo4QT6NJ2P2KjpBY
	8SxzcL/SfcFg2MF57TNrRR+JpiNduKlp5heUkFrEP+6AvP2KLsTCC3U3yXXjpLfKaikKgSZLdsp
	CcqzuhxaDQjXHMRUMzWHwLUMXzpFxQbL6mPYximbfkSojQ8emDkY+/tzTI7Sk84lz2dc3oc+WAG
	T+j9FYsjq29nWs9mapZr3SRVVYN+tBaq2sTBQ6PybG+TLOo233qHLLoJ0+r/DONUWeNcHUONphr
	DaJ/9WbopQkMoW4rJTbo+JeDzdzZA9bdjpTxcv3IxQIlBGoawZrTDSEYCO86HQ0U1GzlIKwmSod
	e8S9K51NvEFTZTSZnR1KYxODr4ZQVaiSq0iXr8qk+UipQ3B4=
X-Received: by 2002:a17:90b:3c08:b0:3a6:e159:a229 with SMTP id 98e67ed59e1d1-3ae6f0349b6mr11883081a91.49.1793758704355;
        Tue, 03 Nov 2026 18:18:24 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb46326f8bsm346131a12.0.2026.11.03.18.18.21
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 03 Nov 2026 18:18:23 -0800 (PST)
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
Subject: [PATCH v14 09/12] ALSA: virtio: wait through signals for PCM teardown
Date: Wed,  4 Nov 2026 11:17:42 +0900
Message-ID: <20261104021745.57733-10-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261104021745.57733-1-mynameisjune111@gmail.com>
References: <20261104021745.57733-1-mynameisjune111@gmail.com>
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
