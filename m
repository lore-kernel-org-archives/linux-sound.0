Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794201427;
	b=dIn/0DFZ+wE9+GC9UBnnDCNZkVhlaY5W+Fr9CwhZmfkwejYZaHgwQutPY0kdYDizxDOJ
	 DpFKfNjgbjAps4FHBHMnKLtR3jCtDucv624j93I1E7cwGa6hV/wCJfJ1SmSCPh8CzjfYc
	 +ZjL5XygvPxCXDkuCov8yZGTeERxnBlJEoplrkedFJmOJvJ7EsceMbLPWid8744Fxoty0
	 f1tG67zsBDCcup3HH9fryRHzd7SdLq1RZwwG/EypSQda7qIU5QXfCQALhk+pmaxYHlnlI
	 8IrfWztd/4QawdMtw6IPrDSwqiN0N4JObNVZs++YtRWH16vDokkVBnqp6dk0wfBM5BQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794201427;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=GCeNfDJOwvZXuY8dgM3rlag3FgqE7583M6Aa4tPPS8I=;
	b=ndt5DeqqwbbMkhwbHwiL7gvtOkP6goJKcsP1i0hab56BcDOhasUhYZuTUayWDQHQaIWZ
	 uQFSSLJ5XpVDUm1QdSmlkGMFKUG99wju8buxsryWGalPhqKuXMkDA2tBp05UWKv7Lscaf
	 GtCfxeLNNtnoN+UMYdz3T3NMfwYnERxA2o+bvKDfqPHrqHLtPbADEMCoqtlAv5yKUXcfU
	 8Hmg3u68ESOOOJ3V7/ADtyUMbraqnmAPyGHNMd3GVu1CbBnN8C2/OMKR2tfhON/h/wJyk
	 4qyPV3UC38rPD6O2jmIrD4EV4GDktpE/O489oNwT7tWYJmvWldibjNxpIRLjZHME5dQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q3mJ4x6C;
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3415606A321
	for <linux-sound@vger.kernel.org>; Mon,  9 Nov 2026 05:17:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3415606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q3mJ4x6C
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1b3ada81853so186584c88.0
        for <linux-sound@vger.kernel.org>; Sun, 08 Nov 2026 21:17:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794201426; x=1794806226; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GCeNfDJOwvZXuY8dgM3rlag3FgqE7583M6Aa4tPPS8I=;
        b=Q3mJ4x6CjdPXUqcwGtNivubyVSmg0gI6mNHS61Xaf+FJtWlwyOR1mF8ViLoNIn2fHG
         gI+u4EJvkIQkEKewtbLLRN4bm0TvXNVGfyeMN6KknSXPFiJLSjjxXKcsJgm3K6jD3FkW
         Q0kdtQgqdSLOZYH9L2Vm/P3oALgDvR9Nu2eBjd7J/BC4rEH/kEqngubWPvt+KP9ZaaSr
         ck3lYR9SSgO3VRTBxXBZGO4ZItghIDgI3zpwjuGb3K7TIompqNWa1thbgdduyBvFOhjO
         OOdFAVZrwUCRhtC3JrGfcIQAnB3/CaimeRfL8bbNxIhOBZFrLRKSU7TNkYxhh7mWFhTz
         sE1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794201426; x=1794806226;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GCeNfDJOwvZXuY8dgM3rlag3FgqE7583M6Aa4tPPS8I=;
        b=CCmonsrGWovH0zWPERUoJRl+g3PJsh87ONeTZlIIopgPB2VQrL6LNI5SBsoBsqc3Hm
         D/rym4aMUPrxWYwp+TLLWf1AbeykcExymLMVGL/jpemXaMWBL9jfrK8p6dYyI5SGBo/c
         Vymi4HQhjPn2mhBmjvhP0HkAn7C17lZ8M1WFw1zKkgBfONtyYb5MajW7g+RVAFJhfoWi
         2ujMkkO/IJdzL6ykphZX0EFZSdsk3N+qKW7OU7UXBiZ7Ykam1GUmNN/EmEf2EEmCsK4m
         F06NvkyT581WVz/Onx0+Qm/kKDIjBR/ALKyZoLAbs7ZZDEKoEBrERzvSzvP3WyFpCwd9
         LZfw==
X-Gm-Message-State: APuU4Z/rGiVXONojwmEqZYJORRtJ8z5WB7rGBz4kEDfOmFgxptNeduG6
	Lko6htmcjSe0UXLWMUwuqYAYwUBsCD5aNjWyMeG0PtdPGgMShqEczl0vZCifTg==
X-Gm-Gg: AYBFou3zDqe1zpF9efLtSb1GFWnQ8NLbnbvScZ9cs7u7YA9seGESoEKE6b4fTEDcLKM
	hoi7nlxiZIDoH42BUM2mKyEav4NDUUeqivlcBj8UQ50n3/lZ/+69871USlymbRX1IqoPULOGsCn
	6XWrVaOgYfaJ8wlenqNsYMiqnjTKWZ29RtiVBI3eP8nzlCkRejsEFNeL76rOkZMz+sqL0vZsfbA
	Jl2GqW3vaccnUkjp8xtP6Lm3NF1LsPxlejMyNJrNxqYRy0zjN+828x+aYjumPnqASJF/3wj8fR+
	Q8OMGI279JMbl3PM5i23bxI62JGOw4Dw7AfRk7MPvhdBIUZ7vOwyymrxGmobPeeQtxwl161vkvd
	uT7heuTJiC5EMeNNMWL8UMQHvbdL7nReW0q79cZ9PqTnrGprhWNwKee2xlEPAkf/cboTxmzvG47
	u2+1vJmE2p8p3pVfq8ZxBp/3W/8F3h0FRzzPBZm1A8CYMcFBwAkUDSDPyq+bzYw8uJ/uR9+JVog
	yEavzC8tRtBe7xu+QfIxUDg2ok6XUubibLiX+Kg1p/Z5XRZ7WcoPwJDugiCe3jDnlynSGa7tZ5w
	R69r17JUKsrbdA0yK++e3C46kaMQZ4SHZNMeP+m3S5wh4pNtENprx21BbHZXmzCVuM3drrs+67s
	8NPbPIWiIO462im6eh9r/Yf4Rlk8JaH1EhZfOZoDlNR5Kf9fh
X-Received: by 2002:a05:701b:2905:b0:192:74cf:1db2 with SMTP id a92af1059eb24-1b39fe88736mr4979051c88.11.1794201426111;
        Sun, 08 Nov 2026 21:17:06 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b37314826asm11395635c88.3.2026.11.08.21.17.03
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 08 Nov 2026 21:17:05 -0800 (PST)
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
Subject: [PATCH v22 13/13] docs: describe virtio-sound capture options
Date: Mon,  9 Nov 2026 14:16:18 +0900
Message-ID: <20261109051618.22506-14-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261109051618.22506-1-mynameisjune111@gmail.com>
References: <20261108235457.12688-1-mynameisjune111@gmail.com>
 <20261109051618.22506-1-mynameisjune111@gmail.com>
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
