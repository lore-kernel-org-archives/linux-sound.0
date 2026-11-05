Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793845953;
	b=q6OwYAoZCrQTwY2xtaaSiD+jf+UFSDYfbgGankn1N00hzxZgyW/Ga3dlVq1yx2Q+W5tb
	 dcVzsTovXel2PslXsYpMoOUoNk+CzR6cU6VEzZQw99Wd0LTk+z4FoeX4k1AVpMLclJAZD
	 MqlgEaUMGJJ/ww9NiDdjdFUcDXjWTumfU9LAfdAOB5KN5vwTLNohDjuEkv77L57cbOZf2
	 I2Zx5jFQS/L0m2bdP2ttIldluQKylRnE/gwN2EGyi+krlWhanO4xjf5eFgoGLkQJl8Heh
	 Ph+OKv45UgT/9FQewiKdWtW3nBWtxVfAjwUBx62MBW+e+T+IrDgyBsQNesSlKqkSO7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793845953;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=GCeNfDJOwvZXuY8dgM3rlag3FgqE7583M6Aa4tPPS8I=;
	b=SxJb0iGSqW932+L4AaUz6Vbg4lpQvo1SPD5DI678wSisMz8ieZ7m9Jk04JbmwIvbGKSV
	 IK8t6bYmEAEXXKrkDeXsMH5cNhRJjtqAxEpao5Isdvwr9RvRv4+fxi71zimc0pi7bBXBa
	 3UkKg//ch9Jv3rWz//O3orz4q6gtS0MrqNp8StNWhS8c5T36EBGuc539fsPvgkN0fXCBi
	 Q5S3D7VhYUEMI+KvFPpOWvVGgRxfJFNgWg1kQlYcRiN0NI+8arY5NVR+DzpBYYGQ8xieH
	 SrW0ypRQ1wGDPECn/dwQEtvS9H/hzfv0DTkuXaqc+v0cG0cD971/1A7UNW9DgobKN2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JoJAcVpJ;
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBD24606D806
	for <linux-sound@vger.kernel.org>; Thu,  5 Nov 2026 02:32:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CBD24606D806
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JoJAcVpJ
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3b09c07b3d2so801051a91.3
        for <linux-sound@vger.kernel.org>; Wed, 04 Nov 2026 18:32:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793845952; x=1794450752; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GCeNfDJOwvZXuY8dgM3rlag3FgqE7583M6Aa4tPPS8I=;
        b=JoJAcVpJOhyXee/JWB/PoQB3MtMG0HfUat9AsQ6cBMlU8S6JPeIQJbDuYbmUVLqJ9C
         lrlXSOC65FYzLGRJTdED2xImiZt4SQ4+PC++D2eKebKZO0NNd1tmGVB2wfevoGPRKO8z
         n2M557KvKztmp/W7ss4S3PlJQNcyOdq8ED15D0y4eWpswzKooypvVGtAoB52ZavJFlv1
         H7QA+ft+doBXkTPMaN8gYdY5p2uASU8royawd534q1uV3Xxg6nB+1KpMWycSyDxi/jjz
         nT7HOWloATHa6lvV1xLxJNFIkmQzINNt3NMIc5OGGm/oUEmtSUIOtjhb0Y3I5nS8peHj
         CluA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793845952; x=1794450752;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GCeNfDJOwvZXuY8dgM3rlag3FgqE7583M6Aa4tPPS8I=;
        b=JuXqKVCs53Ga2C6FIcpq4g3V9PBWTkRlwDzawtipnjBlI0opyPfbNiU6cyriJyWfgm
         ODAShGUgA5gAA9OSU4tN8CYBp6iENKCURvieyZvKPr1RyRXmqh3XJHaoYJ33efGzMSng
         lZdYlD1Fw8Ko3bVVe2FQULitigt+VRiphZFtigKmaIddmTNOv82eGMsKq5dYRyRt6ZeJ
         w+FDIjlTKhoTH3JVQpNS2bTGq1ofrwCa6rqHPOjdqbRAyKPvNBLlGPjodW1Nn94IZPKk
         PVC/myB6ATqnDWUPfyxD+Cd3Mk071tstfPZriKKBiAfWdlhiBELk+jJnLcirMNa4Z2RC
         u6gQ==
X-Gm-Message-State: APuU4Z+nVc8s4/uKPfl2K+DtpHD/UlfqgVuxLjjWSh5fSs2z1DKcL3r2
	peImCfFCGW4Dqa6gkrcqbR2cUAPlhP8p5/dErI092bgO9MlfP8M9MmJxYLTkDA==
X-Gm-Gg: AYBFou0mfIsZdOiP7MzxAOnq9DEpNTGSqFIzK+1HAj3fby6uCTHZ5rjeKdfh2mlN/FU
	FebdozmawMrPURDRFDrn04WeJVe5x5JyqJP5p4vzQDL7bR7zh/K1j2pnVXlvKShIkZwNQTNTfH6
	KRBH1SayvEpDLmqNE4bSscf7sTDYsnLUZ/4QB9fKy+dFK8/YrJKJ1MLRduaWjf03zixGLSiLbZv
	beKhJLu3upOxRYBAEngOotA/xhthNWhyeOVIi9trTMoD9UOc+Ey5nyCGTTkFfPBOEt0rjuHF51x
	j2vKwSxb7NUNYkGNX/IBK2YB2/SdgaAEU//Qi4jbVuzz6w5A04VfCYMiXrL24L0KuS1H+zkxWNp
	7hQ1gMZc9x4oN/rzAQM8iI88O9Gmp1HpH7ZHK4DXDFnsO1MvBgCN4SxMxD6BjCaXg6l6mICCcTU
	oJL62P1Lbicm6BhsIlsZz1Ns1/RkNQqC8xskGxiXP1K4Qwown0SkGCVmcIoVSuL7RVT8S+trFAJ
	NkQ3RlNnIEehKb0ALagwIHBLxfOdA3Pua9gceMegdU5PsO4B3/HpCKFCu3HiXU/YLxbDwqwww3B
	bpoZiDEiHYOSMVloEjIT9wWZUJMl6T694wdTk/J4/FY9MWqBKLXA3E8Y6h2Jfqeet5HglXEiMgm
	UbpOsLD8KMnRH+C9Ejbxb8w/rjapWVYuCB80EugYmaggjHXQvAEIi4cxjXtZcsVmirWXC
X-Received: by 2002:a17:90b:1845:b0:3ac:9d14:feb1 with SMTP id 98e67ed59e1d1-3ae8976dcfcmr14443930a91.43.1793845952031;
        Wed, 04 Nov 2026 18:32:32 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b323cd3csm1292775a91.3.2026.11.04.18.32.28
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 04 Nov 2026 18:32:31 -0800 (PST)
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
Subject: [PATCH v16 12/12] docs: describe virtio-sound capture options
Date: Thu,  5 Nov 2026 11:31:40 +0900
Message-ID: <20261105023140.18373-13-mynameisjune111@gmail.com>
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

Document the five opt-in virtio_snd capture module parameters. State
that capture_allow_empty, capture_allow_short, capture_packed_status and
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
