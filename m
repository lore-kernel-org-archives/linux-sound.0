Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793252685;
	b=vWYgJtgeoyFT0hsaMT8sdUmOhMVcB4zLOyaknAHW2pLXQi/E384vX8B8CBfmiKpAxlkz
	 hC+mYso/qbPe+8SD160GSy4P2Yz7wE+xHPrqNQYyqavJWx+mUplUlkGk5wg652Sh52J3C
	 kXLgK/B/qhopJqKQMAG08evUCeD81Q/TDUkps4y3YTEGlRzwZz0HdPGDqRvw7k7jiHy6Z
	 KdaPHWvqQNrKZJREuS56zndUAWHyFQaJf4THNm/u2XL+KY70sB7lhBGr3Wug5hNklOSIM
	 uLBsQ3S1jpm2RyjDgFXTVZCAhdH+/yYLPtxd04EUMUjzlGQgNG42a6Q3AhBZ8fPpEBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793252685;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ec4/N7zw6HP65LFOCU/La2k3iDwpzO2wT9iw6qkE45M=;
	b=e+iXWUAlXZ1NIDAzy4kgchduYP8zWD2QMcouYv29V7cUDvoIFgA88qwQCRvf9CeomSHC
	 SgOiCPlmzt1LB2FqSq/nRjXXe1S2gPBbT4yJuNQHV5pZGhmtubPkWfZDePPsmciyp1YAd
	 8ruskM8M8I31+Yb4mqS6bwNCPZ+nCQwXv6MMOKML4uX7pO7FU3rnkzGW+JzqfNG5AWqi9
	 ZEC9pOYYeqeKs8hYOhBBZE2Y/YJkxPboEfNXpqLWq72ImfHOOT5BC8L3G5ss1pszJrOSd
	 dEydLXJnOiRNNv6/27HbglH6Ffrzf/QJRf0ifk4jn2COlJhAGEz2Vtq1dwMRsrM7IOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fciZAA34;
	arc=none smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63587606A32E
	for <linux-sound@vger.kernel.org>; Thu, 29 Oct 2026 05:44:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63587606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fciZAA34
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3ac77270fbfso980388a91.2
        for <linux-sound@vger.kernel.org>; Wed, 28 Oct 2026 22:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793252684; x=1793857484; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ec4/N7zw6HP65LFOCU/La2k3iDwpzO2wT9iw6qkE45M=;
        b=fciZAA34a4I1RZJs8RsFDiIMKniW/z3FeP9xw5Hks/lF5OLVsWVGwRkRKkQzPZoALB
         huE1gh6wMHvzQfgT7HkIK7px8J2gpVWDhIqVGh8INY8jhjoRbP1k2W+YohWAew97m0rU
         TnB7ZKfq66LaeBYudl/pyf13iUQqRrW+YQnmTOq2FADZREe3fQ4HsrSV5pqqwVIU+yCM
         UNG5KOujfexHJASwOJuE/MhOMWQfB4TsYq0oFrrnUZXgstswWIkqDoOOEJA+4dgCFUQI
         HCsqLIdmhcXgH829Ov2HtBOWZLhUTmV+HYRocbOiTrtNeRWwtvsJYud+v0cSgXVWG2L0
         1fzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793252684; x=1793857484;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ec4/N7zw6HP65LFOCU/La2k3iDwpzO2wT9iw6qkE45M=;
        b=C+m6Ys+SlyAetKTyuj/ye2gRFQ3bMurBvDOk/b4MT11w69koYvMYHeRe8TbFeImKfk
         wsJqXvZTeMZwldE3vtmO2iY1P9G2c4ets8MCDVlaDzdvCf20IGy3hImFli+C1D/y8a8e
         7nXOxGy2geQ6C2ey069lgVwBOLem/b/ue33etVA/sc5ErAE6Up+lCZtvcP1b7tQqJ3ZT
         AgLbvNWCn+q4t5tUYmQfI4cEIX6CDVUjtN0G0Ijm3/FZUNtcpuz6rqBF4KCwe1oc5QMQ
         /jbC56q7CIyMQXCxYWzfwgsw4Qwi/wua1RPf3dAuwAQu1L2vBnNnDcZWZOBJGs3BcUe5
         RJ6g==
X-Gm-Message-State: AFq9FYLuyIovxMStnBrsJuVB1Yj+NI5uJOXCt/q/+gVf0+UV6/WajnUN
	tLHjLUQPdfTmr5Uwht62S825vB8hojBX6Suv98N0CfN1wDkIZ9wGEUuyM/X2KA==
X-Gm-Gg: AYBFou1P+64m2417yE0AINiyLLsabmnUV1fJhNzuNhQDPF0lZQQf8JpYWzXcoot7Iud
	O++1UuwvgbMHdReke6wpl7AGwy70Avip2xbBe80vLRMmYIT0mzKE0Kh0NsatjkSP7ZkGPE8CAhz
	U5u2HsfT5gYU0gRuU7wDgUZXTikDJaOiXJrJytzrzlCHbkt7v4oXmnF3w9MWfjbOCytnQc4yfKj
	9EQfpG7YPoFt7QUiEIB3UlBJ66dx14WgHkkL6m72ZnL4SnrCkNUUnLyXk2nAwD5FJFh0UvG06uu
	f9PpBddLwdfPLgr6czyHsupwfrOX2nTb/kLbPlhYmwzS3RBXD4CP8RaC4TlPAhCEKZoHv3YJral
	kZOwACCykxbHV5+h1TNW9wpi1ew1ByEsn8wxPEpva00ifiEQgDCKsv8hV18zao+hkoo53sFGrLd
	SMdZhTO+y91ycT61P5yByAUOh9AbUMrOOm308+jWtju0tlKM/EWS0QrZNeekfVMtT7c54zRLDt6
	8a/DJO9HRKDYwJET8TOO+Y3ryTL9DeD4xSWAxSYcFWDFogB2ZrV2tH1s/OQzBqYVGxT/HXUH20v
	E9hik1GlIcNvlMCuSccEgzxEDFonbzq92Eljb2lcF0gzzKnJcIjqQU7zm8MX26up4VDLd1Os5Jl
	vpnvgw4BfGB7KKTR7X0hrpbjWa92wuc4XtsjQF5mwP/e1P5/9DkMCIgBziE4+Wjg/N0Ho
X-Received: by 2002:a17:90a:d603:b0:3ad:818f:3da2 with SMTP id 98e67ed59e1d1-3ae5823f4eemr2777102a91.63.1793252683601;
        Wed, 28 Oct 2026 22:44:43 -0700 (PDT)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e83127csm2433520a91.10.2026.10.28.22.44.40
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 28 Oct 2026 22:44:43 -0700 (PDT)
From: Joonho Lee <mynameisjune111@gmail.com>
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.de,
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
Subject: [PATCH v8 11/14] docs: describe virtio-sound capture options
Date: Thu, 29 Oct 2026 14:43:51 +0900
Message-ID: <20261029054354.2931-12-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261029054354.2931-1-mynameisjune111@gmail.com>
References: <20261029054354.2931-1-mynameisjune111@gmail.com>
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

Document the five opt-in capture module parameters introduced by this
series. All default to false. Describe the startup-empty, short-payload,
packed-status and pause-restart compatibility behavior alongside staging,
and require validation with the target device.

Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index e75344f..6c7b1b3 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -8328,6 +8328,36 @@ Kernel parameters
 			brightness level.
 			default: 1
 
+	virtio_snd.capture_allow_empty= [HW,SOUND]
+			Retry a bounded number of empty startup capture replies.
+			Format: <bool>
+			Default: false. Compatibility option for devices that
+			require staged capture; validate with the target device.
+
+	virtio_snd.capture_allow_short= [HW,SOUND]
+			Accept non-empty, frame-aligned short capture replies.
+			Format: <bool>
+			Default: false. Compatibility option for devices that
+			require staged capture; validate with the target device.
+
+	virtio_snd.capture_packed_status= [HW,SOUND]
+			Read status immediately after the returned capture data.
+			Format: <bool>
+			Default: false. Compatibility option for devices that
+			require staged capture; validate with the target device.
+
+	virtio_snd.capture_pause_restart= [HW,SOUND]
+			Release and reprepare capture streams across pause.
+			Format: <bool>
+			Default: false. Compatibility option for devices that
+			require staged capture; validate with the target device.
+
+	virtio_snd.capture_staging= [HW,SOUND]
+			Use request-owned buffers for capture data.
+			Format: <bool>
+			Default: false. Compatibility option for devices that
+			require staged capture; validate with the target device.
+
 	virtio_mmio.device=
 			[VMMIO] Memory mapped virtio (platform) device.
 

