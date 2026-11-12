Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794464745;
	b=hioG3MEzgRxhWqVil98CxAmC89SlMqSdo8fWQ4Z+5x/fT/InbLivKmDU2Hw1u6irnt7U
	 mabEukq8KA5oBUkHNDcb6pM9T+l41qlnL+w2kD/iL9AYGG8R3ABoKR00ast1mOYXBiuqS
	 oQucAuQMI20Ya9e2T5ui1X4UYBX9liMnosTNhGZXadyoHhyF+aZMstrjVxTAmg9oVAgN/
	 5k1LY8X1rQ9vBwgy1df6406AgBmsKjPmyS3aOAM9o4rl57yab/pOtsfhFWtPQ25pZOR62
	 6m5d6diXq3P9cr+ncYgvu8xKlDIIONq7oZSWiz0pounrEQoR/CKBOz8CUYuA5Bze0Cw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794464745;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=KO6ffwCtdr8RA7k8Fc5roNJODB8/sxhF5kvv5Zygm2k=;
	b=XRaaN6BV8z9Ht0KMEXjGbOGtUJGYFBSTjstNoBBdKzWqFxmhNct/XuaY17pKWeg8hsM5
	 8LjFIRiJLdpS3hK/25LWHiKLzrEz9E2toiRX7Y3ZxQc+rQlduRxOiuvMs06dB/sLYKuu6
	 pihv6fCjXHgyI/i/mFhuG2Dl7WAujGpgWUwZj9cw3l7ftLjoE3EZxu2he0kqCOaTKwqcy
	 H8Ad82FSHwEuedrVmCdIIDq1Gz4anZBv/z2pmoS4R9YeTDP5kzII11LhvUexcvEtbKvly
	 /6NbLzIYCupdSwb1z9P8G0Dc57/nBcILJbb60qwlRN4OianEFCCzzzifGwgRLkvs8EA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L0i9dAnR;
	arc=none smtp.remote-ip=209.85.214.173
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37A9A606A88A
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 06:25:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37A9A606A88A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L0i9dAnR
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2e8f2c3ad6bso24734185ad.1
        for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 22:25:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794464745; x=1795069545; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KO6ffwCtdr8RA7k8Fc5roNJODB8/sxhF5kvv5Zygm2k=;
        b=L0i9dAnRgazDCgzsUw3wag7LfQajhuRXi1oSRHF6TrgV+FgKun7WTS3uleT3Mwbgk3
         vEU6aJmTrJrJFOl5jg+xoY9M2oXNlUWFV7G9t2opD539Uva3l7O3MJxHFDy378ymuwG0
         bYBEBB4lzUMwoH19l0fr/EN0pwT0v5r5p0dt9l8+Yjw2tyY4iJ7ZruJde0nKpEDa76kr
         CR9njefMrzpC2pu7w21vHt7wloPeiPtMtkJaxRYWM9LeDy8Vdteswf5ZZADm0+7ugZJG
         G1SVv0qatkf0Mj/MUZWLqcp7HsLrCqJDjUiu1wO9Ldu49rEOirx7thp5L13BJ3zc3YeA
         nxmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794464745; x=1795069545;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KO6ffwCtdr8RA7k8Fc5roNJODB8/sxhF5kvv5Zygm2k=;
        b=RPYWIWrLEFKtYvyj+qBw/jsgyz5mQEbdoEkm4L1P5D8rEBc1O8jXJJ3ltYC+JJWRms
         p0iJjnZ2HhxhwVTGPGFNWLNNkR7HpIlp60NVeAOEw0jYw0Dpp/N9Blr4fYZIIdjaydF7
         fijQRdABkcNk1fHdciHGZusCsqL4PnbRpeCzAsAnURPLumiDmsocN7Rjsoh4XeG04XEj
         F5OMOgz2OHEdJZuChiQtiRXZgpR+aW/4NLpxhnkK+LKqC7lX6lScQlX2WWF2xb9NFLFp
         3dGZCsYUen20OsZeGXU6RbLD2gJZ/dRRbIlVRzpT6on4a+xUl4bu/GhZK+soqlEA+WRL
         +SdQ==
X-Gm-Message-State: APuU4Z8Bih7euWf3TkZFKVBQITymFIu1b421GuGrRl5Y3es5kBZ7cbMQ
	Ji4/x20uVaFNgqxEH9ZS0V2kUhO0cBFWSqP4o/i6/8NZ7ylp9J6g1nyZcaKz9Q==
X-Gm-Gg: AYBFou163heUmIFB+xQPfMrXjMH0mgZRtw2tofQ3dNOCOG6q6TzcT2Tnss1JvKdkOMs
	ABL2ZkY6kGdYG8B0y8sHDArnLhZq+rMY42VdkVlNs7AFQKc5F9/UhcpEiznuD6sgBckW7q2ekZg
	p6hDQYugQcqC+yV99bm1/N0ZayG4C66QIExn/ZsyI478INukWpMwJbqoOAfHOCS6YESy7Ialz/x
	A/2RXqnBD6tMg5uLAhGZ4Zl6yUxda2tGzGFrh3wbyJk7ZTpTGKByXRu6lsRU4UqxTtdF+W7kO5T
	TG0iXELMYGhz2d+kyd5HSBd41KZVwUF3+L1RON0Iqt8NruWxc/Ss/g7gAV3Gl6+enXwkqzb4p2k
	mE/iW1x4JlUtxw7KCH/z4gXRhIp2HtnV7TL5jDUlt7vx403uGTDFEghNymR3TxgWb+59yDQnY4J
	EV9W9w8T9F2YHgrFxEzcQqT47K0F+hBkUg3ES1yhBW3fgSwD6ZS6vMUOjdpSVqpi1xzF91uBLqv
	14WuNKHhXIMxI8lE0zln69K6N+/aqGi8iiW/gPFRaT9muhBOM06tJ69dZfiRru8LiErcliaskqx
	k5jbBXL9bL/YYGRapXw/YSgELYgw3JiN18+3mhBRI69ysSsOTPaN7g2P2mpjAtH9C4bHS9hwTAo
	pO270s0GbdvBrmyqv8Z9mSboymxNmsuFjhLB4qWMds9/P1ho=
X-Received: by 2002:a17:903:acf:b0:2e9:64b9:a333 with SMTP id d9443c01a7336-2edd770a9e5mr49212615ad.19.1794464744712;
        Wed, 11 Nov 2026 22:25:44 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6a3e61bsm26979965ad.11.2026.11.11.22.25.41
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 22:25:44 -0800 (PST)
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
Subject: [PATCH v30 14/17] docs: describe virtio-sound capture options
Date: Thu, 12 Nov 2026 15:24:43 +0900
Message-ID: <20261112062446.159-15-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261112062446.159-1-mynameisjune111@gmail.com>
References: <20261112062446.159-1-mynameisjune111@gmail.com>
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

Document request-owned capture in the ALSA configuration guide. Describe
`capture_packed_status` as default-off, reading a packed trailer after
returned data while the fixed status scatterlist remains the default.
Describe default-off `capture_pause_restart`: pause uses STOP and
RELEASE, then resume uses PREPARE and START; disabled mode uses STOP and
START while retaining the prepared stream.

Note that on MMU systems request buffers are vmalloc-backed and
page-rounded individually. They remain allocated from hw_params through
hw_free, and capture data is copied into the ALSA ring.

Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
Documentation/admin-guide/kernel-parameters.txt |   14 +++++++++++++
 Documentation/sound/alsa-configuration.rst      |   25 +++++++++++++++++++++++
 2 files changed, 39 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -8344,6 +8344,20 @@
 
 			Can be used multiple times for multiple devices.
 
+	virtio_snd.capture_packed_status= [HW,ALSA]
+			Read an explicitly enabled packed status trailer after
+			the returned capture data. The fixed status scatterlist is
+			used by default.
+			Format: <bool>
+			Default: false.
+
+	virtio_snd.capture_pause_restart= [HW,ALSA]
+			Stop and release the stream when pausing capture. On
+			resume, send PREPARE and START. If disabled, pause uses
+			STOP and START while retaining the prepared stream.
+			Format: <bool>
+			Default: false.
+
 	vga=		[BOOT,X86-32] Select a particular video mode
 			See Documentation/arch/x86/boot.rst and
 			Documentation/admin-guide/svga.rst.
diff --git a/Documentation/sound/alsa-configuration.rst b/Documentation/sound/alsa-configuration.rst
--- a/Documentation/sound/alsa-configuration.rst
+++ b/Documentation/sound/alsa-configuration.rst
@@ -2537,6 +2537,31 @@
 
 This module supports multiple cards.
 
+Module virtio-snd
+-----------------
+
+Virtio-sound capture receives data into a separate request buffer for each
+PCM period. The driver validates the responses and appends frame-aligned audio
+to the ALSA ring in request order. Valid short responses are retained. Empty
+responses are accepted only during bounded startup or for requests already in
+flight at STOP or PAUSE.
+
+capture_packed_status
+    Read an explicitly enabled packed status trailer after returned capture
+    data. The fixed status scatterlist is used by default.
+    (default = false)
+
+capture_pause_restart
+    Stop and release capture on pause. Resume with PREPARE and START. When
+    disabled, pause uses STOP and START while retaining the prepared stream.
+    (default = false)
+
+On MMU systems, the request buffers are vmalloc-backed and page-rounded
+individually. Allocator rounding can make total additional memory exceed the
+ALSA ring size, especially with small periods. The request buffers remain
+allocated from hw_params until hw_free.
+Captured audio is copied from each request buffer into the ALSA ring.
+
 Module snd-virtuoso
 -------------------
 
