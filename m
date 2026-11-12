Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794461744;
	b=T/NV+ZNm2jLLeZC7nOdFgleZCsym/+EhcSZKGJ7u7H6pRL7KyXWJlS/ZxKXCY1rz2qVq
	 /DWCo6XfdkOuudpAyU91zXzW4ShU7zqRHy2dGjEEkTtHGxU6j5w4cpiv3aVmD+Poy8H3K
	 ihrQKUUxO91bqhmbwfQ3BJQV6qlr1TkU1JJmqLS5+lorXPgG0B865h9M2Ol9IiFmQBdy3
	 lGa43TkizbVCRDMUIG6QZGxPXULw26GQXEWHv8SBfUHFfCDHRTaemEmitQZ2V9mGKifJp
	 zhY9eh2QcFEX73+3fA1QltAWh38hpMuz3L2JqYN3HpHgAy8coompylTSy2tDbkZKb+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794461744;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=KO6ffwCtdr8RA7k8Fc5roNJODB8/sxhF5kvv5Zygm2k=;
	b=t+O+N7kluZWrBVX1Jca7fk859RIYutCyIiYmGhvJPbphI1xBo3olJFIfFOJ9LMztX5QN
	 tiyaeus2SKTQAZasxmwvUn+kUTD7NIrEGnMZBq0lnOgcU1hWZXKfkpVSe2bb0scaQiXcn
	 LdfjF4c+S5OjrN2/rRVZ5knrWNjr6bjmCIn+Ng46D6p3QdgyUSd0TFy1U8ByVg98mv/Wh
	 91ADLZa1Mq3ZeKCTTJaSlr2Tr1m7aJTJ3BShItaHlN8OM5rHvD2E7l0Ef5+/ZyNdsg/WU
	 pTCtZ81cwqPPKa4oxm5ir0BzeNELoq7j00uMzxLCiEKqmG/Hugn/xEbqKV9bsag3RhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MI71k+eM;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BD4660A2606
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 05:35:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7BD4660A2606
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MI71k+eM
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1aefd1bf74aso424933c88.1
        for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 21:35:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794461744; x=1795066544; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KO6ffwCtdr8RA7k8Fc5roNJODB8/sxhF5kvv5Zygm2k=;
        b=MI71k+eM3ppResq9Xo0lTysQlbFLkiHjd0MdFs9jwrlpXvl4AMVageRhU03PWDXUbk
         KVPqQ1yb/ZQc0tZww+dJ7COBA+mH5uJDHwTBlNkQun5NJ0CjzkvwFrhBaflMJmTT67WO
         F93cLN1yoz0fbWiQ3ifCi3GxLI9dm+fewPaG0lgy4UHLPFtI6CaQwP70+5tDuEqt2lKr
         hQOPIegB0KT956+QNCOyim+cc5vN5jUwzEsJRNv02VcCF2ohqZEpG5cnFy0YDC/eGCSl
         Gy6EINR8rWjUyesEuFXesBa734+TYLrSVsBi80/4Z7vxwhqpcbqr3kASKu8VaNuWDJZl
         8k4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794461744; x=1795066544;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KO6ffwCtdr8RA7k8Fc5roNJODB8/sxhF5kvv5Zygm2k=;
        b=E45lVFgqZuQW63UQOX+MohTxEmCDVbqseiyWn8aKpD3YdFUqpLd+qQvitzTUPVvYXJ
         ybPWQsz8TQBmi6OR0Cac38siJzuPHb0krCo8huJnZRZGGbTDyAEo1W76Rn4XxrdDYMou
         l82kKhvb40METErG/YH1sosujeT2txlqL+FVoStMu/k96zNkOEOb6qR+xPQyfJbmZGW2
         dlO0bsroT+evtqoIVUZhY3AdDSkw0t7PmwdV+X3KsaLZX9i8ZKTkqxwN5BESABQaTth+
         AjeIOQ1mouIsGP5cId5+hUhn9pwx5Sq3+cvRtUmrrspnKRSjObjkfoQzyTjeqPuhX1kj
         ttIg==
X-Gm-Message-State: APuU4Z+/wEDD/ow0GCZBlKRb8SYnF44pZtR1vfX4cG0U3xGPU6Pn/xNA
	FCRe0qhP6oTDi4uBVRRwBCzSBUAU5yy0UfvtUpeF+/Lfww0C5oWVqxaJorzjbA==
X-Gm-Gg: AYBFou1wNUhOwrP2crdbCfej8gQWM3CeTeF/JCDbqH4cU1Dn2REazlStxIkjOKXmC2q
	rOC634XzvnWIp/ylLHvU5kIUdWlAzLLfpZpuKuSvCb7kO2SSXOyTHPaV/l1anIR0P7pxqlPwrvu
	a+eI8A/sVFEjpBtRIsXbzLYq7FyqQKR8uVyMppGFY1vK8R8HLz47eRSg98Xkj2QohPRP9coeE75
	MDAEGAKCy6NEftpkJFFZPdMDBUu/VuZjCRT8k2ENS1B6/Z15SkH6lOjbPE2wwELKF+PnBV6bLVK
	fpqNHfU3y6qTZ5jo8F4Rjm+VjevXnCvpbzFXQjZv+GvREs14WmWv7PDHZn5HFELxgbinC0xgZE8
	kB+94cAKhixtp04KC57iKwS0BSRgD/CL9Z2Wn9gRnIeJxKRlYxZEG1Zphz5psM6fMEZ76p5ckWn
	PSaaS2rzMN3wavfmTKgF2RjVTAcX1bHr2ABvVD+18np3R9wRuJY5SzoKgnKsVRBdnZlGcvFAeW1
	ZJ4No3ZMRZycGNFBr73tup05UmAVgPbf1SKa03XrkFw1ILgDMIiCSB+wkMKDIdrbIX9+KO3xzRN
	xBHFwKmJowstChM9FUaALqS9nxWDVqH9eazFeXrCPITg45Nq5ZmJ4x5DSuomKpSXNQXBV/cYcb3
	fMHmx/xd8s79th0T7jjAJcfpO9zAyFV+vyFmDQ4UBA9Y9k8em
X-Received: by 2002:a05:701b:4594:10b0:1ab:cbd0:1c96 with SMTP id a92af1059eb24-1b4f5f1f344mr1354843c88.4.1794461743623;
        Wed, 11 Nov 2026 21:35:43 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5890c0esm21953240c88.1.2026.11.11.21.35.40
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 21:35:43 -0800 (PST)
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
Subject: [PATCH v29 14/17] docs: describe virtio-sound capture options
Date: Thu, 12 Nov 2026 14:34:43 +0900
Message-ID: <20261112053446.73504-15-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261112053446.73504-1-mynameisjune111@gmail.com>
References: <20261112053446.73504-1-mynameisjune111@gmail.com>
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
 
