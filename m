Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793758715;
	b=fO3li5A2LzIzzgTNDQBsRGK7CCI6rFGm/XdlK4vfVm4BPGhFj+t3SVhC5S3Xck6zh74P
	 p7Fx8Lk1MXm8aXLacXbjYXB90CTuURJBP5sfJYOMRXLiL+uTv7VMfp4XWrJidwXo01Oem
	 HGKt7rRKSKaYD2lkuMN8N0lMwk0FWdL1HciPGD3uo4Ejo0njtyFS1o3FfIoAunDxdx6d4
	 dw7Kb/DNpedU/LXiS6hckzsxzXQpJM8YCd6mU7S7FJVwfma9qWL417sNXVaml0IsFBljv
	 0TQ0UtGvhlWfYs3IidlkroFOcaaMfhQMWTCgzXgus1w397c7c5mjQ+YuAcrrGqGe9LA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793758715;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=I+E1FT7j2TPwT2i0hneBh3LNGnIyRwhqUFoGV1aFaFs=;
	b=xm653+Da/qktXt1O1EK6T8ZgaQR1Lp9S/MtHIsva+/xUEwe9DyQZOW9agI8RIJWJJYxi
	 kkSrbGBr0HDuVE3M3JhI4nHTg3emCz8Mn/xwL+idFbkiKnUwXLVwtZZOe17L+jNLxXeTs
	 Rm5dmpPRj14N7UnK+cpcw/VBiO+Lw6GnSkxEzB6/efpmfeH7bpRi4eMywBeiayyKOq6sf
	 9lfZXiMSiqSirhmkDQtRAN2vAtY3PI2sxvkDqD92PNmS6p5FqT2LJs7ct37a6ykT4yprD
	 K7YkbiOrZRYiSohVBhdBV/k7QmHz0fx3EBqw79SPOoQdCrQJj9ZYmcICJEl4crtSdgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yKwJHKFU;
	arc=none smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FD9F606D819
	for <linux-sound@vger.kernel.org>; Wed,  4 Nov 2026 02:18:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FD9F606D819
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yKwJHKFU
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3ab2cb8d577so238011a91.1
        for <linux-sound@vger.kernel.org>; Tue, 03 Nov 2026 18:18:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793758715; x=1794363515; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I+E1FT7j2TPwT2i0hneBh3LNGnIyRwhqUFoGV1aFaFs=;
        b=yKwJHKFU2D2DhPMYMCgCzYmIt4/34+y+HODW5waB91q+93S3cWU9u7MBfBFVa0PteX
         6urz8fIXfBJ21XmZArDNWZrvvcph1C/Vp+4/3JU67wwKWpThQrH1qz/iArCXcUSsU59o
         dGi02BuGhVfROnsDKgtQOOlw10MyjPD3xM702XttGNZeEklm1/+TwH4hUvh8Xsy49Nna
         lJmHkFpWT34THeTt+trsVvf8twhyKktNGlP7cWVE933LCqxALK+65nuY7eF6jQOlqjl6
         RmctE8Cz7xVEOqiwExJULFeFVAtxJb8CpE7ocLyFsWf392b+27z+sS6Z6hjFBEksz6AM
         toFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793758715; x=1794363515;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=I+E1FT7j2TPwT2i0hneBh3LNGnIyRwhqUFoGV1aFaFs=;
        b=rjcrjLddzW6gZEDkzQaVP/klFggr+ymDib6YEVCM4gNJC9SqWg78sVhuDej2C66gdP
         420EyROst5GCeiWSMprCCVLszgc+Qq4TUUvsixy7snVvCfk6Eb94wMee5L6tvej1q6BM
         SJDC9P24tVA775oRtFasxToKhSYvrq8q9T/7r8ZPgA7PE/7ykWX8R/gwmpj1RQ0ALcyY
         kwLFop+eg4lJG/hA+PLBLbjmBds0zO9Jg2no6p0smtqUPTbaXj7OrAiKOrG+JM6ka42I
         9lp+xb0P9ERC0V+/Agh46GnUdBgWaOdx2Yt7Ipd30qJ3Io/EExDOqzXLffpXckvc4cVI
         yRrg==
X-Gm-Message-State: APuU4Z9uKlZgTQH5JDJKYKAWimmrRUYqkf6DH/TxWgSYTrmSupIOhKTR
	aGfK4AoUJjidrW/RAOppLCFl99FEib4Yk+i5l0HzBpePr5cPuHbFCZT4/wj7Ug==
X-Gm-Gg: AYBFou0iOL4ryOzfU2Em4l8EZ2m8pD8cijCFPyKSU6/70Nzm+gc4UgS9VE5g/N8nF2I
	2sADtuCyt7sz3wgLaejAOAfC68ZR+RbfJzdOqcMos6835+ah0gGnAmeJoZ6fyWGGH0pfregbZpi
	wvuzs3Wd8U26iV+FQpR8+j+LvyOzCX9IhGlwii99APQztfrJWsjUO6Q1HU8povyVA2eg9Sh8fZT
	XQe3PYupNdobyOR5PxFLWJQHJ4yVfTy91GQesgXp0TlKBrDNIt0h/GmLMzvNj2x1LYB67pMAQ9T
	tjemGe8oJeOCN3sZ1yoPahH3ZiZyM+x2AFGZdNwI/OrrmNO3M00oh1GVuDOHRrZBox8Hdm+yYyY
	aLAAANgyKlUVri4Ckb4zwT1LxzJ/NwVg26kcJltr0247feDz+w/zCjijFaScz1T3189YIBxVZCF
	LuLQViiwQCUvzsZ0d6w8D+bE28/pzn36VNCjryTBfcwkZysWXEaJAPSJ/RgaJSTgL7NkrL4DuNh
	/2C5jBrfwyvQ8kEwfJNNuoPw7K50/y5sA8PqlRUWMr9SkukAhHL4YxnQirOauGFEhBqTEJpIfvW
	1CnaWLikPGP5zS6GiH/Zsd/9vDoFW4Cnkf5BWX13NT5sVawFqEN+kbevi3icL/0lwZfYs5uJOKf
	JorKcYR28lQK8nHU3XH/4RweaqnxtVCT010W41R4A2vTnmkmWJmECkXctYwtsyRhywBfp
X-Received: by 2002:a17:90b:4b8c:b0:3a8:9d0d:ca50 with SMTP id 98e67ed59e1d1-3ae897c853cmr12970769a91.10.1793758714583;
        Tue, 03 Nov 2026 18:18:34 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb46326f8bsm346131a12.0.2026.11.03.18.18.31
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 03 Nov 2026 18:18:34 -0800 (PST)
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
Subject: [PATCH v14 12/12] docs: describe virtio-sound capture options
Date: Wed,  4 Nov 2026 11:17:45 +0900
Message-ID: <20261104021745.57733-13-mynameisjune111@gmail.com>
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

Document the five opt-in virtio_snd capture module parameters. State that
capture_allow_empty, capture_allow_short, capture_packed_status and
capture_pause_restart require capture_staging, and use the ALSA kernel
parameter restriction tag for each entry.

Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
Documentation/admin-guide/kernel-parameters.txt |   29 +++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -8344,6 +8344,35 @@
 
 			Can be used multiple times for multiple devices.
 
+	virtio_snd.capture_allow_empty= [HW,ALSA]
+			Retry a bounded number of empty startup capture replies
+			when virtio_snd.capture_staging=1.
+			Format: <bool>
+			Default: false. Validate with the target device.
+
+	virtio_snd.capture_allow_short= [HW,ALSA]
+			Accept non-empty, frame-aligned short capture replies
+			when virtio_snd.capture_staging=1.
+			Format: <bool>
+			Default: false. Validate with the target device.
+
+	virtio_snd.capture_packed_status= [HW,ALSA]
+			Read status immediately after the returned capture data
+			when virtio_snd.capture_staging=1.
+			Format: <bool>
+			Default: false. Validate with the target device.
+
+	virtio_snd.capture_pause_restart= [HW,ALSA]
+			Release and reprepare capture streams across pause when
+			virtio_snd.capture_staging=1.
+			Format: <bool>
+			Default: false. Validate with the target device.
+
+	virtio_snd.capture_staging= [HW,ALSA]
+			Enable staged capture using request-owned buffers.
+			Format: <bool>
+			Default: false. Validate with the target device.
+
 	vga=		[BOOT,X86-32] Select a particular video mode
 			See Documentation/arch/x86/boot.rst and
 			Documentation/admin-guide/svga.rst.
