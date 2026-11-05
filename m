Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793837395;
	b=0nXaYtH9xj7Wb4scj5GMp7t7d1ajGjpU31kowVo85222OuwVeqX8MIsEVIGoG+1PoB1d
	 fsxFMZ6E2A5evVRAMf4NOgXnZd4zxPyolow5Gfitb7ZPMCiJoa4ulCcnhaF66tcZsgqrP
	 ryfQ29TY2ZD/dBS4RZYNLNCv6bPsSGcv8f/0zSWAT1JgUjavOCztc9HxZ+ZUFH47621TF
	 S+MlIXRUFFUdR81U4YXcfx/8mnrn0TwvJSWGmc2vmgMxg9NhnzSjJwg44k/67qTQXp84h
	 bLa1SS13mjo6mfCa22ILdZaFkQyUKa7AO8YX56NTKGzyC7gOV4+pv6/XYeI739xVT3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793837395;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Hy/84DnLRHSkLYr0y43NMukCMjMkWuzO7+IZ4PjZ4VU=;
	b=oa1PkxLPlVts6H/dgdo7kAlZaQHS3xrDF2V3hvHZMm+bSMh34W6x4nte7sgFgEM+KS7m
	 U5rBDmA+mMh9Nhfn3Sjh3M4WcU7HyBui3iK0YFO+JaNF9OWT1nf8bnoVBuySYi3WuEPr5
	 YYPbX53Ueu/ssjAV9sc4ogANtymhtRcIRWBomVKihFSIrZn3fePO7vvWu6FtBZRUM1TBg
	 GkRbBMmM2H88hFjJ0GKI4nVyogomB1hI2PncP4ro59/zPSTCI2/i/CNSDXHIquZn+MZZV
	 NEYNaYRecOJQrpljLUs5J1wA4fvk39dIl588UV7OVMsuTXGMY7Q0NrzZMSJifabddyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jn+RAC2a;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F5166082BDF
	for <linux-sound@vger.kernel.org>; Thu,  5 Nov 2026 00:09:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F5166082BDF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jn+RAC2a
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3ace1f3897cso764994a91.0
        for <linux-sound@vger.kernel.org>; Wed, 04 Nov 2026 16:09:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793837394; x=1794442194; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hy/84DnLRHSkLYr0y43NMukCMjMkWuzO7+IZ4PjZ4VU=;
        b=jn+RAC2aFvaKWv/CHLd563ZuPUG4ifSHfCIbLG6CaNO18w+mIJYstP/byGNTNPK5Pt
         quRyHYVH1nz7kuvW0f9knNpy2IF52H8qvdrIqetP3wGlRnH3Y9UlAee68jLY30ALXGxw
         isik8PZy48NnXlMyu2JyYlNvFXBj+OMQqb4aci8kNh2hxryKMdkyhwXiBnelVBUEmVmN
         cYEhyRsAM0nPoT/aOVMeRRnXsNvJ/Aled0Bj7UeAM7Lj2lN97lNZsGAH6pc2vkHYAwJt
         xAQy1PUbluKm4bmBCuXttpT2DcFVRTuRI1k8buTqq2NNR1rkGVL3Fp4Rp49t1ghaeXr9
         3EPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793837394; x=1794442194;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Hy/84DnLRHSkLYr0y43NMukCMjMkWuzO7+IZ4PjZ4VU=;
        b=1ztkWziFfGFLSU/JjngwP4VkaT1yrYfc+ZAHJGFUKk+K4NCGbk8W+yERn1YwLVADSJ
         O8zjClBtaA9fWS6uGuEZyMdFglJBNfi8iNnHRrMBh9jltxpdOcArkLbOf7OyFbtbIVVK
         FiGsw4TVmsQ4UhC9+TUf1+LD3M5vnV/30DP9TQFujSTPyfD6FaK45vzrckVBHk2m4RVU
         b/U/Cjibk4kET9sX/sVm4q5k4QPdWIdlNrr+/tCTfFQVuOq3Hsw8xpedRhBbN6k9BHd5
         6eyFuhXNWjSfAsyMlO/+neslIyK1An8nTVA9TeSXToINReh6goUoNaNwFnUYFUKtEKoR
         eP6Q==
X-Gm-Message-State: APuU4Z+6WvT/lYddvcCq3XrkPVb/Pz0vPC8y6TGDSVafQfNzGyYFZoUS
	W5u0M6PgGqfXZQ6k8+S+UvWvWgtztGw5stq5CUjMMpF4/O5naNWTZaKen/dzYg==
X-Gm-Gg: AYBFou3iN73d5N0ZfyL+eTlnXG4NMian7Cj9JeqMzuKAWp6jt+5NIGF9N4tf0Qh5UbD
	VvDofoRSw4rlNSHX10VHpJo0CD1hF9Naxztz7Xfyn2TkJ+CQ9nJ9l+xv2EKixyTl7cnsy6rXP5E
	HmU8r4fuSa8hn0chI2CFPnA+uTMSPZXnEtfeegWj5b7Vz9QGG1JHxDUDqNFS4P0aRg591J74ISZ
	DLm3JRLiGtN2xszGoy6goXQnhwJQKAHj6g0/u5HaEOakHiljKr2MVPaFpWddOtvf/S4HsFQxhbc
	umjqeGzCJ6RKPfkG9nowJVHPPYy2xfiir78lJx1+lhIibU4fQ00LrRCL+40K/JyG+Lcwtj/7auG
	BtYoyAcG9bU7Cc64MZWRZgt5S1C88/m4KZDwjqxQ6Rq3dtsit8ndugrWRMFumIBxKKfe9uCVISq
	7SYxLsZTRyFQlA/xuxBzEz+9ENbbepM06j9+yjCB/L9VUIZS2rdc/rBHBnYpgifUBxEw+aglnV3
	ImElAlmfVYM3lLyvdKS8Z902H1gDMgieQJaz82xdHZrIsh6syJHZbTzm1ioE8KQ4fx5MlAVWccs
	2m2XH8OJC1PBWFYttL53qSpst5N8Jvw/Gjz2O5exTXGF05U0FATq4sk1ntQm5bNSjHUHMLGTwkQ
	D4SX0USATXVIYpdNyZYtdDBTJ26P2WYGCTlfKiMWUdKibDpdxyh7zSA806l4wNvlovdg4
X-Received: by 2002:a17:90b:2751:b0:3a4:b3ac:904c with SMTP id 98e67ed59e1d1-3ae8984ec60mr14592568a91.51.1793837394483;
        Wed, 04 Nov 2026 16:09:54 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b323c18fsm897208a91.4.2026.11.04.16.09.50
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 04 Nov 2026 16:09:53 -0800 (PST)
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
Subject: [PATCH v15 09/12] ALSA: virtio: wait through signals for PCM teardown
Date: Thu,  5 Nov 2026 09:09:12 +0900
Message-ID: <20261105000915.15177-10-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261105000915.15177-1-mynameisjune111@gmail.com>
References: <20261105000915.15177-1-mynameisjune111@gmail.com>
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
