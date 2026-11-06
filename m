Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793981965;
	b=1Df3ZgRMONixV+XNq5VYBYoQ2rvYj3zRrycVh7iq2GQpwigJqgfu7d0Hmra3UVnInlDN
	 OATV+SpqMgyp94Hg2Zx+lUcpTFR4RyvAPNXvosjR+CPoqjj/Ke3wy9LUPhwF+0Kb5JrkX
	 4G2+hnBoBUmgHp12PUfS5/C3nBuQcaGm7khthAKBfN+RRZc1XkGMBBxuDNrKjebLGQSv2
	 X+i4H811EF3cHUa2r5H0b4GXtmal7jWZIVAS4lu/DR6PK+dJXWKPLpx3rWq6CvZTuVnz3
	 TXJ6askKl64+rJ3x4s4v66i1y8VMjM3VvTSaPvlEjlFo2eReazxDEJ/kLp+THgNisog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793981965;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=yx9qdA7I7keZZm8UafgJgTm1z4N4QlAmh4J6h6T4bZg=;
	b=w+PYnvVJW8ShTVejptZtbuM5LSUYURf/F0O4Bx/USTMTV3RQPsFNW2IOm1+OZPSz4snT
	 Ig6GvSKe8RlN9AT1PNctLswT3MbJSIm2qBuIFY9q6NfWqry7vfrP7o5iRGr3zKwu8iCgn
	 UGSaSopPV5027PM+moNlXBZzTjuh/mN4BHoTLtQ06XYAT5M2Cn/q6QFNNVqJqvBEaoOCa
	 cMv3mIYNezffX439ZmKUYIV/pumskIBIn8eZtgAPCNykNZjb5INsrauLdgL9OqM4UUoG+
	 FnVTYDpAHztnTWcx0P38hTGILfNM4hIHMr+1YiUgOgSL2t+MzsUaqVqOwljl0yPdolw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IfrE8Cjb;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6E2B606EE87
	for <linux-sound@vger.kernel.org>; Fri,  6 Nov 2026 16:19:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6E2B606EE87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IfrE8Cjb
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1a8cc11ac42so823447c88.0
        for <linux-sound@vger.kernel.org>; Fri, 06 Nov 2026 08:19:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793981964; x=1794586764; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yx9qdA7I7keZZm8UafgJgTm1z4N4QlAmh4J6h6T4bZg=;
        b=IfrE8CjbKfXBgHyv/oFbCQSS9viFVOpcOupJ7F4rKbJvdypopl9CKbVP9UfoP4cLfQ
         dFMpkeDRm8ELM8uVcxnFdK2nurMQQFDQy1icTEA6GEYR8hEBY2HzFifOEoBSN5+aJ6n3
         e8CeatXd9YN0OHo65HqTNv5bKxhkZIzx0U63io97uZjsusFh1tihnhKDZfByelY8lbR0
         zCfp+P/dEYD1XN7YE82wMryeh/9Yhef7+inhjdBRK4X8lvyomOrdSeR2J9sb9hUB1fk/
         JoaXY60QE/OiA8Y2Q63eazANw81ya/JNhpMpak81rx24WnLOHgVGFsaw1bBLfKgSRvmK
         5l6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793981964; x=1794586764;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yx9qdA7I7keZZm8UafgJgTm1z4N4QlAmh4J6h6T4bZg=;
        b=v3fk24Y4nNZ42Y/6kBD0VCKiBE3A3xjFRC1qLQ2+RcU9UUelLW9M4s16T8iKjuNvX8
         Z7g2cQ3aqZDupdrEydx8rvi71N5912fUB/hUaBX4J62UavpRoDKHKkbtQy1CkzLGwgpg
         H9EqgG4WGL3pX3dAdZ2bUTX4ngwM3pzkOb/Y8wVrXN0uBPVdzkjhyihxMhwYGBOsC6nH
         amGunZVokI+16osXoZAVY7U9Ev1qgAE/o80IwGlv1b1j9G0YnPcj2qVTwN3vBq9IKoVc
         83tU3NBOmr/K7hZdeVfeI7xK594qgGHnTJ5y0ItqAe6K2ARQ+0URqKy194HoZePtsC6+
         oG8Q==
X-Gm-Message-State: APuU4Z9PUUOci6sqqWE2Wl/eudakGmnZq4hXIkUcQmlV0taZKNhztbuH
	2Fi196BO82qAX7lbzeKbNTiLnXdYz7TtpcOxt6dr3x6F5G7fIoX+oOYzB1uG/R27
X-Gm-Gg: AYBFou2lbDIQ7rCJh3NOdXFzwCWgqEEzX80gS2G77QS2IYm6S6sCl5chbEP+qWpKFiO
	umEVZy4ilgLKokkJFeARX/9RUfQgIijazXloeiAzytLKPc9PyeQdxmhB55FG/Ty7K26+Nfsm9h9
	R5WaSUJdDbKC++5c0RwKu0jH+pH/QsP0XuuaX7MSC+OlEN3HmYM0WL5ZFm8wb4P2htAYe6rv3z5
	LivDrMCY7Ax763Bnw7z7RDjkL9Jr48QIwYBQahFtxKoPJMA/wF7IQ09cBNXZJUpL/FoUh6LM960
	G6oFTsYb04JV7HS/3Msq1OmP7S8o0qUj8YryKzpKPkGsTzUIsGPIXnhFZUQ8p7CboiE1ZdeN0LA
	lqunyYgu7M8rT631KTXDeo0rj2OZszYqkhywrbI1jGrTGyJJanMjaBtoFofkEEbo7JMwG393yKY
	WJM7tByahM6orbZ3m6YMGPBNorx+RUjGK3vu+cwozWqcZeShxD0+NNSmWbV7sm1tMpw3TOvYYBU
	Va7lS4u2cJnQ00AaCqHi/j8Zw7y8SIvMrowyE5PUjJXjhEnBcc2ziadKKcAIyTTVQsgDRn9HgDn
	DTZUQ5kudFsSo80+pdAmZwLPWacGWQCRyDIlaKNUN1tNEmR3z2HJXuaHWEVd/Rf9wCd5zB9pqFe
	G2aPwQgGFB1dOPozsCYA7Vh9oh/k99YihTCFVf1+X8I+qTQ==
X-Received: by 2002:a05:701b:4211:20b0:147:a685:9125 with SMTP id a92af1059eb24-1b25d28c296mr3676583c88.2.1793981963864;
        Fri, 06 Nov 2026 08:19:23 -0800 (PST)
Received: from localhost.localdomain ([180.182.24.11])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4840f3sm13139526c88.5.2026.11.06.08.19.20
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 06 Nov 2026 08:19:23 -0800 (PST)
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
Subject: [PATCH v19 12/12] docs: describe virtio-sound capture options
Date: Sat,  7 Nov 2026 01:18:38 +0900
Message-ID: <20261106161838.94308-13-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261106161838.94308-1-mynameisjune111@gmail.com>
References: <20261106161838.94308-1-mynameisjune111@gmail.com>
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
