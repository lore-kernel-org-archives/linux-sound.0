Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793412560;
	b=CtchoGi+A/eBh3pdG1CWWBQo5LEiQ5EwdiuzRwSqNWyNElmzgfkwbsJJgsagtYIAjBGW
	 5GM0vhz5lnctqb1dypu4imky1FsRI58/VIuhuqK944F/VTyC+xqlAOLdI/Fj53VDx4CVi
	 9h7AXurA21jDFORFEreHYncsXPx67hsfE6+udmXP67+L8zNCs+6R1jYxmkwcVseMtK6ku
	 cj38d8AtQvx/GQNz3GPYKlC9VfFO7oI9QuLDc6uTVQJHE/2ZA77SoDCiP2omNFpW3tQbK
	 W1TCEtCvD4JLbZsbNs8bQZRAd//tuKJpTnSfGR89s54F6xoOUPT/Gm1ZUXtHOHhgAvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793412560;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=xyRi7XDKpXV1gU6ovNhxbTiviMkA7YCbmNrm8NAAe74=;
	b=POxOzPQwvyvLAgVloDZ3gFsAi3DvXBZVtByPM5tvITDPKH1SZH5aGuDNBXPz3V+0MvFQ
	 cGzPOZh48h8pNAxASA2MqUphzbDqg4EO9XkXSjjv9ymYAKfA/eSaHAMIKkNGftNnoAXkC
	 aw20kOnlRiCyfCNr40smJkogvkeBrnzjkTrOw+6702UAbFjPLDItaWtfRAl1dLveZYIiI
	 IvpF/henkRhFjUnZXhzcE5e1qEueMBgChiY442m5W035yWhJ5MBwMajCeKlaarh+CwZuC
	 169DXQjw9VAZ1IvI8SxyPQHXY6wWkhxW2i9La1IhBCOzCWLi9KDaJuUS7zdymVE0LNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dmTwQp7a;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D55FD606A332
	for <linux-sound@vger.kernel.org>; Sat, 31 Oct 2026 02:09:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D55FD606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dmTwQp7a
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-3550c917fd3so1778108eec.0
        for <linux-sound@vger.kernel.org>; Fri, 30 Oct 2026 19:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793412559; x=1794017359; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xyRi7XDKpXV1gU6ovNhxbTiviMkA7YCbmNrm8NAAe74=;
        b=dmTwQp7aiqyVd7bNSgrF+/uwK+P1zjMYPazTAa4kJCYS3k4gI/gRFwHSuLk8hCcNcD
         wSu70bJS0p2rRCcduRnTdrF4tp2QdiPhDny/RDfjIQ9x7ZP6BJ3SEGV5qqxttLKAuquH
         GQU4Wr3+DAQPNJmkxRkp/+AFenfMsAI8A4ZNxC98oda2XCQHfjtMO9QPVmFkFFA8xJCg
         Xgwjr3JnPms38N58bzty9R/uLeZsz1S5dCwEHbS+n+sJbkKNO0d0gBcqdo7Y+5T/ZSuF
         VI7AKHdwKIqovLGZMZIncKxrypk1Vy+8yA6bCcX1oQky3/0kVGMXLDfRQElFYXwBoA9D
         9u5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793412559; x=1794017359;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xyRi7XDKpXV1gU6ovNhxbTiviMkA7YCbmNrm8NAAe74=;
        b=0YsNj2t+ry52KOujlM9XrGCYpsn/Z4UOaUIc/LJhC9mStxr+aO4REMaincQNMxTNh9
         /+l12IN080K4vc/vQOIklFptJsvLAZr/shIHLC/pvLfimaz2oCfRneKnpiQ0NEoiGivF
         fxmY0wEO0oVz9EFowaN76cweKojC/liTFYA9AtKkb+LffvoW19kYpXJoq+xjP+ErRkoR
         +mMThhReEBe+zlSvquBnNDZ5hy6dR0t2c4gFGAtlo5GMzQXwpz/mueth+yS2iV3kEvIv
         AD4yU3l9fgoxZNCjjG3qEd3fAeBlketxeAADZkwFZqzGXfuvA5gfVjBQTBBD5zQ6SnXF
         pZWw==
X-Gm-Message-State: AFq9FYLj981+aS4ohclhnJFfOFTZP1KzJU3/vlGiWj95nmAEV8LMPvQO
	VNqopwklWFKZcaRLT3wiJT3W+vxvF9S/tMdOpSKzx21rci1JC8FQHjQpZdILyMcL
X-Gm-Gg: AYBFou3FOSdjSNQXZoSrqxg+Hj6DtJeWDoxHUBgc2FcwMU+mOHFlhscP4jNN7mcjS/G
	CMSp3sm+1MsNPxxOEFEJaSDFkrgA691aLibWje8F7OJDsccyfMl/K9yi1LlSnDaN/7OGr/BTcuv
	V2n99YhOf7OTKsPX+nC2aPQqi8pobfAU6DnKBq1Ot+0e/M6nGM+uJJNYnPhpuw0A16KORZSQGNE
	fRxMIjSTSi73nCCm0cwdBwHmF1RB8YsaMVzJu2Nb0hEFaeYLzuCLCeP0idwsefs2TQLKqRwbxAa
	kRNWgRLrkCCKc6eaPxLDdFcy+H/x50/KYxnSWx5sezBdrCweUt6YJ10Ef4CFYBSSUN1ipmOy+7C
	OrZ37ITwkfKy73M4pM6Am/+Isshn92vOOz1bg15j88yJGgCdOoHWyJEyy5F00Y9bSGSz1frTQ2q
	8ThqSLIsUlPoi0gpSAGhVSGVF2mpRWkOzciiOhhp3jRnY1JFtqc83SYsGY8lStisCZ5BqtUId8s
	XXrbnaR+oaoG7Kro8qa3QdX5jaRVo0z1FdIoTBn/AmJGsfx3CGw7p73YcuYjSm8VniFEKQNu9dz
	3BisZfdXvYBNpD5bmyKSH4EVDLvFVKN1zR/qxXx2qTfwZ6cD496kKlWnnb3Q5HGRITjCCXNv8wD
	p3EsV6KYzZRmY38TiRSepzq/uywA+pZHpraAHIkBd9Ri52w==
X-Received: by 2002:a05:7300:6d22:b0:36a:13e1:c889 with SMTP id 5a478bee46e88-36a425e10f8mr8691655eec.36.1793412558707;
        Fri, 30 Oct 2026 19:09:18 -0700 (PDT)
Received: from localhost.localdomain ([180.182.24.11])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a77c0dsm13214096eec.26.2026.10.30.19.09.15
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 30 Oct 2026 19:09:18 -0700 (PDT)
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
Subject: [PATCH v11 06/14] ALSA: virtio: wait through signals for PCM teardown
Date: Sat, 31 Oct 2026 11:08:47 +0900
Message-ID: <20261031020855.2402-7-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261031020855.2402-1-mynameisjune111@gmail.com>
References: <20261031020855.2402-1-mynameisjune111@gmail.com>
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
