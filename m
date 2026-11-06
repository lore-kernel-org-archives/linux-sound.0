Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793923650;
	b=2oSF/UMRJ9roa8qc7uKAsrqDzLmYlznIOlrgF1/+WUKHoRuzJySQOprdXGW0izc//178
	 dqRAyKmiWz6tSkVhC16zbyGs8hZWHzfrr6Lhg7A2KLbWuEPmUbpZv/8KY2AeuWow5E/4P
	 is1Zh68dIfCH0Jgu0+07astCHdI1lHFulC6ybbP4qJOUKGFbLKpiBF67AxRpNpHJsHb0b
	 NpQDc615ZWSHkugtCLsv76ri5n1pCqXOh6bwXqCx0atKCwWOGu9zy34nyOXLPUFmx8f5z
	 m/42RQYknOsqj25eP8Vxghy/nhxEXn7b0WGmzSOiyjtkiXrw4Zc6cl6EmDlUpHaZLMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793923650;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=yx9qdA7I7keZZm8UafgJgTm1z4N4QlAmh4J6h6T4bZg=;
	b=UBuQ7LDtKadN8Jf0rI3i2pOSZXvFO4dd7k27zOQnyyYykFEV3a0lKxJXWifSqOXWhdtv
	 GJonyfCyomihmiVgr88/sSF9Au3SGTlQmVQc+i/YrCHWTW4Z/zcvtIITZABFeal3+odox
	 3fynFoQysjU8Jdr8MYNmuOjMFw9UxTXm1wdPMjzJ5pWCAF75BpnYG+zj6NQc/iCiW4iB0
	 ioiniMa2zBmEPcXVD9RnuzsWdyFQvQqbtHXVrHn8+m2Kuv/MeX6lvN6nVqPxvXQwqNDyR
	 jwRu0sR9eCaknzLPf/u9+U58W5Q6UBtfEUDpNUrithFS3FDtVeCiYmn6Rack9AdB7Qw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EJ3orVT0;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27617606D816
	for <linux-sound@vger.kernel.org>; Fri,  6 Nov 2026 00:07:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27617606D816
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EJ3orVT0
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-36d6765756fso109836eec.1
        for <linux-sound@vger.kernel.org>; Thu, 05 Nov 2026 16:07:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793923649; x=1794528449; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yx9qdA7I7keZZm8UafgJgTm1z4N4QlAmh4J6h6T4bZg=;
        b=EJ3orVT0lSr5+QEqDFmgmshDZGEl5+IkiNLUmMz6fPT/aQ+d4KSwj1qZwKWMftKpAm
         +Q3R7BfT+9TbXqv47RlK+WEcrwEYwqMrNghm/xNUgWZUQDnlNfnSmPrMV0GAFQCHNbRi
         SHQpIa3V3cxRvxR0C2cYa4sSWl4dJAsoBvBrgWV6gtDbIIrGbzGO1x0Ejl75dBlQuJej
         ahaT1mdKuDVSS7JSoLX0cNSvN1s7ECCJIcv7ZQNUYFvEmCEPrhr6xQOy51Op+5KYkSEE
         glgi6ji9QUjuS4qsC5lAwWTlUwGTCMzryHTDjPw63OxSEURKC+xoy/c6xpCSJ6ztfx6s
         qKHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793923649; x=1794528449;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yx9qdA7I7keZZm8UafgJgTm1z4N4QlAmh4J6h6T4bZg=;
        b=zwTMYqbzg4OKxeIhpF+pFIz2Fu+un5lpUAhTsq8DEUrbgke+pdvtZqSnbKnzeqzsNy
         Cy1XdiOPPoqb6ycqYDAJ4DZu21wfUU++Jhu60RAS62JmMMTDO+JP2UxsVqFAdvHZzv7E
         OBSoYe6Yes2kKGU9QyZt4RQJILJVpfP0zpkO6VSnaTbLFEbaBaCIc93BBTIc6y+Uk0y2
         nvkJhiMRC9bFbktx9Nm0bDcu+Rt/WAuNyroFF1WUBq2jl3oU4Y21du4BBAjWaYOMGObh
         t3MpcJfE+dxoxcBBvf74+d0c7qHXoQXoCBi7Uv3sbPvLWrptizW4sXmqd/R4qGGKheoC
         wfhg==
X-Gm-Message-State: APuU4Z/TxyupGM0VJpNgGt7NZjZFHhpCidU8naxxA2Hd14HC7h5S/yWD
	FuJ654KMkL284hZ2EtdsWpjQfcMhWT5SQ6GIq1u1dGOa510s/lU0RnAaTb4Cbw==
X-Gm-Gg: AYBFou3x/AmxEr4C/poOtZbMI+0O/KdI8v4ZbKssD+masLpq+5FDgxfi8ZnOC6O4S7p
	tLNIr+pHBy77Bxpeqt93vD0QnucqdZuIU6YsMN6xx7Z8yXxlEHXJ4/PlCBHr1zkcqSY7uBj90lO
	bQBuo6T/SXC+yQ+RQpROtcFgLFEilGwfNTfKZJD1Wn5hrNgC7pGScjlKxtavnv2tY4ytW6C/AD2
	yWP1z66Hpn4eQ+VHU7v2jOrKGrKC/Jiik5cZm0m6DciKVV3iiG/V0AkylCGj3bP5ielr+EWwSKl
	Z5sl56iTBN09QMctt5pRWwwq3a/D+JIYqZ41agFdgWXeoawL9nUG47RYCrLIN/Z4nxfYXB4XFyS
	xxa25U0XuISReafE3nh8XART/6KG48anSOQA5zMeG8sSSAKTSa4RXbHLlAbYBEEHqF0KnAeS0Vi
	NvaSEetwO+mLENDJj0nbf9E9c1kTdjFlY6aW6//9Qt3BXFg+oOvmi4TqbV40uDZvy1zb1WWiXQ+
	/SspG5LmT32UuYe3bVb2VP2hNn48hdtLGO8RUu0cTvccWT0Yi3+QsSJl+8APGcxmdEuIr4+/ARo
	R9ndchyXhHT4Co8GhdjJ/If0ZM3G1xELUpZ4ph2IV4ujelSd0x8qOjqutwBhyVA/DsMZ0rGD2Ox
	+9MZo4nrI/abcQglaj5tvSpntiHAz2dtbajW0XHhtsPu55FE=
X-Received: by 2002:a05:7022:1306:b0:1b2:44b3:8ed2 with SMTP id a92af1059eb24-1b25d373302mr766303c88.42.1793923649075;
        Thu, 05 Nov 2026 16:07:29 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4e079esm371165c88.19.2026.11.05.16.07.26
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 05 Nov 2026 16:07:28 -0800 (PST)
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
Subject: [PATCH v18 12/12] docs: describe virtio-sound capture options
Date: Fri,  6 Nov 2026 09:06:44 +0900
Message-ID: <20261106000644.20460-13-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261106000644.20460-1-mynameisjune111@gmail.com>
References: <20261106000644.20460-1-mynameisjune111@gmail.com>
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
