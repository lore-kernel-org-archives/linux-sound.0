Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793837405;
	b=mMd9Pa3BlqNQSluOorYkOOz8mqjQP05GLXmKNxe+IXvYQ1u5V2pM+Bngh44908OGP5Aw
	 mnw0htDFi8qYuNTxSSGQziXaaRgS9CBxu44J1YEsgAzDeXtaXqSrN5qved5XhQI9TNaX0
	 CG8xkFHm3vHOxc7LlTBGhdoiSw73pkkuoojZx40r903HXQD1JcNZ+W1V2LBO0cVqsU6j6
	 jhPy4tJVN+wdbHRzcneI3Qgr2WM6xr9P1Z1ffLZcU3U4QN9hmwMEfPUsiGJ53yZsM1wJ/
	 1HvAGRj0dlVe3LruIg8D+roKB1zkaM8yJ0LS/c39irrcfB0+OAgxnJKVu30YwGE6Tqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793837405;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=I+E1FT7j2TPwT2i0hneBh3LNGnIyRwhqUFoGV1aFaFs=;
	b=B1SiFW4BNNAGIVT8YprJUVnR4Ku3R7qEjlhQQGDOQnXS5EYG+q0xkZv0JGGNP7Vb9O4C
	 esx9TEekyaB6YrtXHdnraKZC/6hen2EJVEACdJjgkty8XIqCcEym4nHeM9+gFilOs3SiT
	 XckJyxE1UdKEP19mk6ElnCGSBgtILCWpzH9kk57snk2ZrznDez7MeIVFZdmfxMBPKgxrL
	 CdRif3f2ev6+Lgk4zOQB1WcIIm3QVp1By80RTg7krAfrM+TrpmRooR8QDJnouy4y0QXK/
	 CGPAAKl1/qjRqSkmDD0vE3RME6HoWRFmwY4i4e+sc8kxu1x2NqQt0idTv25bFkZSe8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BeY4IEDr;
	arc=none smtp.remote-ip=209.85.215.173
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 219876083632
	for <linux-sound@vger.kernel.org>; Thu,  5 Nov 2026 00:10:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 219876083632
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BeY4IEDr
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cc502d509c0so550139a12.2
        for <linux-sound@vger.kernel.org>; Wed, 04 Nov 2026 16:10:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793837404; x=1794442204; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I+E1FT7j2TPwT2i0hneBh3LNGnIyRwhqUFoGV1aFaFs=;
        b=BeY4IEDrAAFmLu7JjeDWwbTA9snCG+/XgoXitYbLO2l8LGehXShhKl2DkJ+0Ju/o5d
         cyZpN+Q2cV61S9maKKzEznl3+W/i728CRMluDTZyjvT0g+w3rCDhKmqRWdZlfyiydDwb
         woaUO9XYS5NMGakzeHvSwN3HkViHcjNFQLNOqXI4KAjoLy2RDbZl83gu8pqXM7OmTN/r
         dU2meVcVRPG2MwLu4FHr1TIxv2sZRTRBRN41x5aQe7H/aDxv8fWW5dfxCcPGLzy1Mvw9
         z4GhGOZfF+N5nzj3GJakRQF6ZoSkxqpKDcpryxYdzo9/oYGSQWI4QNpCPPKGcn9puNB1
         fEFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793837404; x=1794442204;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=I+E1FT7j2TPwT2i0hneBh3LNGnIyRwhqUFoGV1aFaFs=;
        b=CHRPb+lyxEXCvFTOfoD01PGE1lGb9MrK8VQsYLR3fp+XmqUlDHWmFriL36O8G9WlP2
         rqx60NseBxo4gu+TChwIB/4EbtbjPJcTH475Q+Y1H4eCjBMWQ5HakVSurwo5qcrDIyHp
         /oWZ96IJPjxBcTeMSoegYWhOqFhADtSJqApWADD8yCo2COFgd9kBjxX3OzBob0jW2wXa
         /8Jk0zM+yc6jfSdEtAeuF0hSvVitOlT2KWwL6VVP/YolvvDZARexorW1TcciN2vZuDIx
         R3kiNZIdYNl6Zb+wjisvsDRgv+leJu5UtOUAqCsSmiwjVPpFkK//giNjP5uapxRDY78K
         jhdw==
X-Gm-Message-State: APuU4Z/XVsthJfUR/YO19VBmbop9rHFLN3KtxDCAbmLshmqVhuyTkn8t
	356wI1LrGPBjOpqgUTwf79NxG6jXgxGhY51ZFBlprlIGCi/D7dYtMb63YTelbA==
X-Gm-Gg: AYBFou0mazjMBP9MMoz7ozhWNYzgVGBj8DN79Ie4AIWNM7MzHRT0nUjOmBz4/DtT5lW
	Vdje2o87RhsuRpH2ujrIN4/avt+YJRjAYqHXGBKcRATUat34eUfWvjfpJZiQfwcKPT6zHh7r6m+
	tTlakKD1ShIj/CynOfhjx0010DI+zIO97dtGhutJITi35NGVS1ZrUPrTI7DV4m5EqsF1iHgvOM5
	DJbRz/u8ed0j90LAgPjDGQACRU7H2uXAyMuaZ300PwFgZanV6T5cynRI9PUD7Di5pxkYv1cefuP
	mmH7yXX8X6v9aQDIyQfv1RxYixzvpq3Il+loSZVUw+FX7Eve/FCAyIRBHuY/r6GOTEbg9ZBcsBJ
	GzmTyiYL7Q+/IdcmkhgxhyKE8yEl4CS4IfMBD9AvSXS43VlIdVvVGcLbLwrS/fuTtLMs+snpxTb
	R7D4ZQCwtobDcH6IW29Q+Zn+2gPt5pGAWfYtGDljm30vgxFa0383w20IFe9/iHKSVI+wKIxhDeo
	HP0fcx5jXguyHlUm6zp/JW48D8Kl0xZodbUKM3HJ1UWxC2mC5hYkXZZl+o2dW4jgLXh7CEZHFtE
	Len14O46/q4oAHRJIRVducC3u+tSI1bJYxDcGNjZ55GeB8TsvyLu9nbSLpCIw4XwmYjV1fDqDXp
	BLGYka0p3yezRMidwarpA6V80mQcGA01gcv0xs16QOqQDMmc=
X-Received: by 2002:a17:90b:2e07:b0:3b0:9e2c:9b5f with SMTP id 98e67ed59e1d1-3b09e2c9e85mr2641358a91.2.1793837404449;
        Wed, 04 Nov 2026 16:10:04 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b323c18fsm897208a91.4.2026.11.04.16.10.01
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 04 Nov 2026 16:10:04 -0800 (PST)
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
Subject: [PATCH v15 12/12] docs: describe virtio-sound capture options
Date: Thu,  5 Nov 2026 09:09:15 +0900
Message-ID: <20261105000915.15177-13-mynameisjune111@gmail.com>
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
