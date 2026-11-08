Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794182171;
	b=Mr4IX7xx+j6cJB7cB6IsabqXPAfArrk4Cr+VwStNcCofYY139+d2UpEphnhC0DrhGaFM
	 JOItH2Se8MBvutqallp0yNLg7J1pdjm53s7wbMl3CpUuneOl1M8SuNCZJ2G7QZKYhEPoI
	 RTCq64xV/2FXqMmDPS1Wad5qPhiXuH0GhyS5bHwAnSVvfm2cEU8tAmID6+1SGklljrxnN
	 SGcDsvqgh0UE4S3Rg8OdA0mujIRq1U/Zd36dRNvzJ1v/Jyd2mQ8UdtK/HxXxwaqyQN3wH
	 EHOiWk/B08auw3dfa2pvwN9mak4eZ7MSGoseWs1wVg77w/mmXOAUY1335lpLQIXaE2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794182171;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=yx9qdA7I7keZZm8UafgJgTm1z4N4QlAmh4J6h6T4bZg=;
	b=wpBufkJi/56HpeJbCZ0G6UbO1nPfJkJEJSzqP+BRH6Aja3BJy1MMRn7z4F+h6L8CYSfa
	 hkJGJEhsq1IZ1jrI7p8k6W1JQp19ILnlSgwNMSfpkK4uSKLlKwSYEdWury61pnPbQ3zgE
	 d4KtcP66b+g7pRCSwcOMudewQ/vOeEgIcJQmFeC7OHqPs8MKkJTNnsgSZ2EZkrDdI8lzx
	 cZQqw639ek8enwOpLWrt2My+kaKFjjFX8OohDi6ut/Z+7hNR8rb3VBE97Pr1Z7CB3KPV4
	 Z+OLkOIVEY5hmOqlLCSYt6zSTesWtmGeqNRtlQCV39GixtP3L/jsucZNqOOOKklLr/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZMkHdWEu;
	arc=none smtp.remote-ip=209.85.214.173
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD42D606A320
	for <linux-sound@vger.kernel.org>; Sun,  8 Nov 2026 23:56:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD42D606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZMkHdWEu
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2e96502e447so2981495ad.1
        for <linux-sound@vger.kernel.org>; Sun, 08 Nov 2026 15:56:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794182170; x=1794786970; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yx9qdA7I7keZZm8UafgJgTm1z4N4QlAmh4J6h6T4bZg=;
        b=ZMkHdWEuaOVff3lB/WiPWnY9Rl/jGA3RO8cUj9WLl/Bix+oSHdqLM6mzP4OMh+1JGl
         janLnElRIlHsvTtY573kfxrbUhz/IN5/3+1Ph77bV10kKfkQXWGWBuxnoOsWxkIv95gy
         3eol1f/Z3YMqFOeXPhbKdGUdjj8y7EeNKLeRT17mgyPLT6cPBVidhnM83oU7W+XWMid3
         vQJmsr3+JV1DKHgz//mScLY8yPmLVdOtmu7iMlz63GT8lqR+iT6dPFFT2yUiQyrwYSlH
         Rd0oyMxs11yC7g8QprNxbemiyk9OLHl45cxKrGAkH034GzD5rYRERFWT0zcWmWmf1JwR
         LNmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794182170; x=1794786970;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yx9qdA7I7keZZm8UafgJgTm1z4N4QlAmh4J6h6T4bZg=;
        b=yfpjFHdbuulzNstkaK16ppb9CKYkchmkb3Ba49n6I5+J0LubkkMvUHD3IRWdXhLdAR
         FfegvNh0gZC3fGHyjPisNwZ9VR74swvVLKHqaOsLjozNyMGyLn38AaJJ5+5lKz29Fiwc
         MXqE7cfi4pogYN97xgbwYRRqz8ismjFEJsFecyCiNprq++SI0PQfrcTLc/SZuHlITVZd
         3QgT59XygjCfoVkN8EKWZdzh8A+etkI2WcuVRf4IVEvqk30rGpSWls/ccRkbSs15KJtE
         4f0tduuM4TADMisAjMHqjikWjXPWZoVVjz0VUYfa3KvG5kX+Yym8dm7JMwH8L9WHrECt
         PZgQ==
X-Gm-Message-State: APuU4Z+Nkpv6UGOpr+G0sOl1aV8n2sR8vjYQiIrnjcJJm0zgdOX/sfj1
	9vjwxHOQ2fWXZC4HkGrOK6ojAGpd0ZeD2wWifm19sMZJnbrgdecanswmJ09+Ng==
X-Gm-Gg: AYBFou0hS/sfyO7AWNMOFs4EpK+dFnIFZnylmy1WUK+HVPY9fJ/6msXB6ZZQMpZuv9r
	Q6caHFdSnBB+WjaQ7p2HUr1rW3GfPhern5L7uGMfrAxx5vmtJ1XMSoZJD821HAwhIv7XUMmuNxZ
	HqJRtJSIBWvtSGrqrL1iNBr/HEuRLZRgAVpjAhF6K6YTaHeZl7H2FIwUfJCf5whglt3qOaHqIlu
	unsibXYbyzGymFQVZRX/Vt8Xn72fZDKmAJR5rgXYzqyvjb7O47riq0u1DhFh/HTcYxGd37JugFt
	xzWpHz23pus/S6tpS97EtuxCtmtwrumuFpd2grHlCqinKrh0e3plfRkyshHdBB4P+HdzGFVXJ+A
	+MEvsH2HcPOQHUH+O9Ipd6w4D1WLyinW4MqO0bJJgFCcQAOenVflEF2OZa6hN3l6eyTLN2hamuC
	NfmY9XQdCEyzJ1xlAuQMyaMNi4rJ4jS7XPmT/LK6DLtxs2zeAoh9tdOokXbRSdW6GJba/yhKemt
	9C8ZNjsBVmSsL7983kys4TQL6iBpgJ/fPCCNVsmZodzZQlW47X8IlJMpQ7ar/XX++ZxYr07Z7DV
	FkkCe7ehybTb0jVTsUh/8Gi5qWNpVe54BJopUJ1/peow5fq7NSaU6xtkZTY5FEv+ARoGWmyArzD
	aI0b+va/j/yXAK2uAWxIsACaY7lUjX5CGCY8Zkle5H4Ue0vHu
X-Received: by 2002:a17:903:3810:b0:2ed:123b:97e4 with SMTP id d9443c01a7336-2ed8375be01mr25102705ad.15.1794182170303;
        Sun, 08 Nov 2026 15:56:10 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed81722edesm6095215ad.55.2026.11.08.15.56.05
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 08 Nov 2026 15:56:08 -0800 (PST)
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
Subject: [PATCH v21 12/12] docs: describe virtio-sound capture options
Date: Mon,  9 Nov 2026 08:54:57 +0900
Message-ID: <20261108235457.12688-13-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261108235457.12688-1-mynameisjune111@gmail.com>
References: <20261108235457.12688-1-mynameisjune111@gmail.com>
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
