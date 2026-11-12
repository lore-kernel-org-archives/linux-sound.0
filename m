Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794444480;
	b=PfGsi3YYjbCII089ImFS6pYAA4rQxRaLc3JGtZHFso18fY0H+YQgBBPQqyo+kto8yIbg
	 q4Ur0Hg/6dAnuySGpcwcESI6Qqq0Te5Z1fu3kWDcNJAaPF4M5eq899E/hnf48svmBNH+B
	 /MWYI/vPVR6pyze93gXR+0CiTFusdK2wMmU+e/HPC7cXKolzUHLzrNeUhjBDmiFaHiWAf
	 BjpjS+jMg7AqAtV0o8Me4PU8K0JGvsS3StQ7A6HH+BHdh+xL9ZOcPJh+X2lBgUgKNuT2D
	 9LU0CTiZwVdbOPljvzlSOKv31nNeoTexKRamRVZ8URP5PwuU60x3+4OaAmmEDHpF1Eg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794444480;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=KO6ffwCtdr8RA7k8Fc5roNJODB8/sxhF5kvv5Zygm2k=;
	b=HIymV9IfBXFmMXmqanyiNG1BnAt9GkMIgvnVovUCfwgujTzHNvhoAm7O1j7XNsnrX/b8
	 48mJHq756Yi8Z9ldq6hOFlVLw1UgGd+LWbvuBElmUzSQW4IUd4Tek58tbC9ty61LNJeHh
	 nOrEh0cctPGXKZXEQk+F9V+E+NC+OUBjVkFRIZifyWH1a0/o4cIAIDROnaGH8dGK9Vlvb
	 S0NaPf3UfzDvD8Q3LlRU2ufxXJXnnO+QW/GpPPQAuQp2hnwCVttuzQrmTMipAm9zq77PP
	 tdzycB/Js0syJ/4ybUg3RQiRODy2o9Kx+FWmnou6BSItrq2WXilGGxwqpxlNjakOSvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y+VXBbty;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E2E7606C755
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 00:47:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E2E7606C755
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y+VXBbty
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1b244fb7fffso4666983c88.1
        for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 16:47:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794444479; x=1795049279; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KO6ffwCtdr8RA7k8Fc5roNJODB8/sxhF5kvv5Zygm2k=;
        b=Y+VXBbtyba/o8p17YNdkkSV9mEM1J75oGmZwRUmbkNWoxRQ7YByN/2aYFI+8jR+xQR
         IMdXfrShXu3ta3fyVguDAHQWC+9mWfmvmQvSWYTedf4cy3p5755K/2Gg8p7k16Ny7IB4
         axrZWUbiPfIGcg/wF8SHM1QkzwYapNYjLF4CQZO7d0lYZk+M474XHT0cnmXB55VTTKOb
         KRFtrUUYVRpMswA04/Mm9rAyJiVnMf7Jktl517EZNwixDFEi4frZ6sS+QK8ny77NaU+1
         YM6hK6f8zeYcvXiN95UZGd0+6QCG2ady1rkfuUdjaZGvOKbZU0CNQPV6tEPNA4gtXkiq
         obHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794444479; x=1795049279;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KO6ffwCtdr8RA7k8Fc5roNJODB8/sxhF5kvv5Zygm2k=;
        b=pyQjb6W88ZuAa/+vCzyEh6BXzfmy2H4fQjOzDRkgN/L4wNB0wu4Dwl1YSLa9FFVCMa
         12Et8iCzMmx1b0dnBe1XeMsRm1I2FwZTr4sS+hIkSt6jTWz78e6K2pi1VArthBzGpFr2
         KHy4DqFL7i+K8Zzbbt10Nre31hZN3UOhwv663LfkmWa0GqUSt94EeZSjcIc2MHlqMY/1
         a1MFXLIfClWxSb1gH2F+W9U9xhXidYnEh3Lo4ai/W9EhIeRmqxfs6WYHhGYVEHt7UHBR
         LOMYJxr1on1uqrcH4aFYS7V8VFzIAmeD2kxJlrFPNrTSGUJcHYTT3JsJDhVRGqeLqfSs
         Qrsg==
X-Gm-Message-State: APuU4Z+R9j1Ez1N4JzZ6WTN0MZWdluXAfH5R5BdKAMCAn4iWYtQQ4dxT
	vDNxnGVd0kH4pNby/x1xQd3zeWd1sdVku8+kOa2aKMYeaBJwvuiBArLFdm6PuA==
X-Gm-Gg: AYBFou1sc0Ahyea1nf4qFO245Dz61goOGbbNta0ea9sXTpCfVYM9LmSKMY/w9CoojD/
	X3svwa+Cg/qJ9nYhnpbA428dyW5H/O4RXWqFn0VrYn8cpRoIH5veh9k/g8fwCicEhV5EdkFPuWl
	Fmso4YZ4/SyhUU34eEJ56417E2pVZjKR+Zpc1NKXV3zedeEI4cN+9/PZjg7dvFtnvbMNnWla2d7
	BeXvZ3YDt3jpOzkhRMyKCdDZzBudwa0d2SJO9XhAtCLvsff4PJPuPPPOuD7D56Y1nKAws/IqmkL
	phywXvVDvCp91C+mdpb4ALxgHOj6RydsIEy6o+a68ASmx2Bampvd+unRX8zVlVq//h7jQTlxhTO
	p15SsUdMWUh9sV26k8J9fT9XomIeKXxw11PqndCnOEyCd6saJNnjOeU+o4CldDcoYXxg+pXeqhG
	vmzk1quc7WURVB4s4Epkinkh+V8oonmql1QFdlpNj2pQ4UNuV1sALfVTPSqKx281+ToIiBbQupQ
	YoqAhzQCf804mvk4K10owYGmdsIPC+vmv/qSnCqOtd74KHPt27VrpINu/3wgGCLaY4nByKeYV65
	PzfnR5JTrcp/324W83KH5JsiofW+Bou49oXnkOekU0Lg7twVBQq1zsXZ9fqqsjKW1klgm2DIzVh
	DGhCwSoRU50mqXu6OXNpVoqzVEM7aDwl1+16piM7//hB7rqI=
X-Received: by 2002:a05:701b:2906:b0:160:a80f:3ed2 with SMTP id a92af1059eb24-1b3c02f039amr3321754c88.10.1794444479106;
        Wed, 11 Nov 2026 16:47:59 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b2eeffsm20672163c88.9.2026.11.11.16.47.56
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 16:47:58 -0800 (PST)
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
Subject: [PATCH v27 14/17] docs: describe virtio-sound capture options
Date: Thu, 12 Nov 2026 09:47:01 +0900
Message-ID: <20261112004704.49758-15-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261112004704.49758-1-mynameisjune111@gmail.com>
References: <20261112004704.49758-1-mynameisjune111@gmail.com>
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
 
