Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794355605;
	b=IxQ8b4Pl6Z3Uo8ge95qHUQ/FNZ2Ka9uo7ka5PNd5elOnfM7Nab3fiG9wGAufZYCmetGj
	 fnXh2IyAd01KvFIdrO3Hs0RZJDH8zI1WyVq9xsFoezPyDp5vC4QkLhtTPQaGsIt54mAyx
	 0H0KrDyMp5384a8OcSILlBKFjas/V0fhvNKKnl5UPQwWXRopM9boUiEJR1PuU1mZAht2O
	 hMHHYar+EizPr3AloTx0y+/I+m9lC4PRf0By7zLOH7ZZBhjY3MgWHk6zDM3MR5yg8+f/A
	 MjwAb6eyFNtz3QCsDi4/Z8d8srGYTkIMYaDsYTQvyQ907JQj3oskqFRTX5EawK6JC0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794355605;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=QVooZCmJPrWWhT96Ks8ytGn0KExMeex3eOhOngE0EKo=;
	b=s2IK9FgyU29TAjVSAE2QRkdPc1ZSlsZI/oT36N+BrvFf/32omnL7Wf+aqVQ0bsMSNFvm
	 nYfJ1vYG0vPRshZzCiC5PsQoOs+Q8M2CM+ZgTiWxns/YJ7bPmoEac8rZg199ctOoXvFzQ
	 ueFpqqLD2zPyc7GrSbkgxTnjsJ3HFjbZq0uC2uRmW1siRt/FPpWMIaJ75ClKL9jjynJjv
	 MvjmKd/5821mCxZwtYwgq1mD7JZSOjk6xs9ohyj32l2l0k+xv7ZHKmplKsyLlLryyXLjw
	 Eoj8QiboFyytyE7WqGC9VXan9P3jfBrbsmhKwMNJiU4OAsF+FrG/6E+8ElD5FUE7DtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l8W675bL;
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B809606A332
	for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 00:06:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B809606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l8W675bL
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3ad41b47541so1634936a91.1
        for <linux-sound@vger.kernel.org>; Tue, 10 Nov 2026 16:06:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794355605; x=1794960405; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QVooZCmJPrWWhT96Ks8ytGn0KExMeex3eOhOngE0EKo=;
        b=l8W675bLrsWjbpK2F3mrBFkG6K78C5ZAp2zxEV7PhWqS5rklWYa6R2AmU4AdBIj8Ft
         X7ZcJs80TDEQ4mdX4B/U5hTNWCtcsta+46BIhrQcfjdtcLhzuWDq+Ny58zpvZqv9O6Vg
         4dkCaqOnILNMn3hH/Imle3E99TOodgLFhuBCghJJoYMzMhixDe4bgbgTy15509g6A8xf
         Beujegev4eaFnh0lhDbJAGbJsodFeoPoORy9FvVVWP0clh5ZYEz+Xb5LHaDfkjSV73IJ
         0m9UPchgMnPHpI1Q17NmJgU7/QC0d9Ry7sz9dyQjtVHy8TEPrP+azTjjc86Q2fSYAmh9
         eOXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794355605; x=1794960405;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QVooZCmJPrWWhT96Ks8ytGn0KExMeex3eOhOngE0EKo=;
        b=muHo2EjNUqTQEho4/g/04pStRDJS9mjW2qa/p+WuuKYLBKXmiY8sLb7kMnQ9OXv5+X
         OwAjWdnDzvsg7ZSweyKqm5m5hhu2ULfjDO/FlWwImdW2jD2dg2c2nYE93OpyZ3BsdMFC
         wOdZvYRevK6YhTCJ2tVXVwXpSr1OOQFql6gdEH44dWQr/qwkeyuFGgpvTPqhwa62bFem
         sMsrJISmec9wyxAlzflVxts6basceaeeT4r1lPZIlT4CXLxD3xKZVJAawqhtOlZB/4RC
         kGfRnIFmilzN3LodVZbZvHyHcZQ0JYhafd6uO2aiDPO9QWrAzhnsYzxfMiOtEizaw3Kw
         r/PQ==
X-Gm-Message-State: APuU4Z/Jd4FvOry9161bT1aYWAxB5sAx51qKwhOdEjRhpSe+U5ExWjJO
	awOk0K/yMNpogMyH5gSHDuzW+o+EBHOnbEvzDwn/1JYIiJU60qhiJE9XTi3ing==
X-Gm-Gg: AYBFou3BBpn8QaZLNyfyHeqiC+eV2gqQ0fuWjQ2zenofpkuDxbqTNP8IBRPqXDPujAm
	ALt/b2sVOP64ezQvZJ1FFDjX2iObnusAh1vQJ65RF8WRDap/S3tcszJK7I6mzqhz2AM/Qkao8AY
	iHDjmRCDer9LPWhwLSzjVPCRH+3Y4lw+dtVbmh3Rh/WlivBRKyEbjEIBW/kwdXuY9R6fMUiGMZm
	DHtLTvvw2LPtYEeT5l2/AdFAk3VoF9WcbiAbtDLXagz8J1z7LNdhLd+XsTTI9xdusOrJXOIGeGO
	HQ9+fWACMYEQwrNnhetEcGFzqBH947CS5ZKUu8bd7/u/A6/1toIJQnzkPZPmJKFlI7QsomkvnvC
	8NBcuPyx1MvoV/z5XnkxRTslraAteq+C8SDZmOxBim4PBZjb4G7hB5Att0UE51X++nAXv9QOh55
	vctLj5FXTEN5LhuiPLV1FOM+mSMlQpG5qjWJSW3ky4KeO0yKbdqA2ZAvMWtlMBDFcznjDnXANMQ
	M7gl/4RX9e0fMGdbTQGoECPXwU1zFICXHHsbKSS1CePgek4F2d83ZSLfClD9SIjx5/DHwdqZ+RJ
	Y8K4yS6WWcYySlG0gHljgz+hy6cDzcZLfAvpB3/IGc/VevIw89YaCQRBe2Toa99fiz5+P+nA56j
	NHSu3bs96tShjhyCIaFZXz6uF5J6sBfJaloM1ezq2nUBomfc=
X-Received: by 2002:a17:90b:224e:b0:3a4:f75d:d194 with SMTP id 98e67ed59e1d1-3b182ec22a1mr635276a91.36.1794355604794;
        Tue, 10 Nov 2026 16:06:44 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1838e616dsm474361a91.4.2026.11.10.16.06.39
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 10 Nov 2026 16:06:43 -0800 (PST)
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
Subject: [PATCH v24 14/16] docs: describe virtio-sound capture options
Date: Wed, 11 Nov 2026 09:05:41 +0900
Message-ID: <20261111000543.28550-15-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261111000543.28550-1-mynameisjune111@gmail.com>
References: <20261111000543.28550-1-mynameisjune111@gmail.com>
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

Document the request-owned default capture path, its temporary memory
and copy cost, and the two remaining default-off compatibility
parameters. Remove the earlier opt-in staging and short/empty-response
descriptions.

Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
Documentation/admin-guide/kernel-parameters.txt |   23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -8344,6 +8344,29 @@
 
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
+			resume, send SET_PARAMS, PREPARE, and START. With this
+			option disabled, pause uses STOP and START while retaining
+			the prepared stream.
+			Format: <bool>
+			Default: false.
+
+			Capture always receives into request-owned buffers, then
+			appends validated, frame-aligned audio to the ALSA ring in
+			request order. A valid short response is retained. Empty
+			responses are tolerated only during bounded startup or for
+			requests already in flight at STOP or PAUSE. This uses up
+			to one PCM buffer of temporary memory and copies returned
+			audio into the ALSA ring.
+
 	vga=		[BOOT,X86-32] Select a particular video mode
 			See Documentation/arch/x86/boot.rst and
 			Documentation/admin-guide/svga.rst.
