Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F7F63B47D3
	for <linux-sound@vger.kernel.org>; Fri,  3 Apr 2026 11:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775215660; cv=none; b=niWx09hokR6wJg9ENDyy9U3oY3v4SzkD/a4hx1EE73QQ7yMhnQPMWzGYglXyBGcI7APecKC0nm1usIP/Ij+c2I90vSXhq40qQvxqZ9+0ci1AgfQ+vLQCjSVtRcm40doZmA4TygTLrdwoKPOiAZnE/VTdOfle7epxlBC6+kkLlEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775215660; c=relaxed/simple;
	bh=8kcJtqi0VHJvhXuEuRP4SR2nVD2GvzsAbGsi4Dox6/w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SKxlU606ze2gSc3IkXyr+MqeUOxJPQwCYOhnGhqTrjF4Kzo8r/4W/3qt9shS8eHznrAsrKAy4tyQw/MzZ4XZxzPTXhXikVp8rIR5RGV9cX2F+JQ2AlVpujdHGj+C4SjY6NzsuDOfW41sTrZf1vnr2BXV0wODMKb0IxFVXuemriU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c3RjsWIJ; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c3RjsWIJ"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-82748257f5fso1806855b3a.1
        for <linux-sound@vger.kernel.org>; Fri, 03 Apr 2026 04:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775215649; x=1775820449; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cOr8dkqvyqFf6OUz7iSfGmZZS207nEioRgpDY/txeeg=;
        b=c3RjsWIJjIKLlkkMQDp+b/VbjgKVNxeaM/uUYoeFVL+auTorzu+sD2RjOPJjuLTuW/
         kSneu1kWshF6tMve4iGVeT5dUNovxowb5H7zQkbktz9fDfMgXQd46Iv8awVz87rQxIeA
         RtZpqb+yoEURwmTJgWm1Rdc0n8Fmd9ihvsGGoabcK/grQPW6fwzNcCJhnWrfUlPkTvKc
         HKoKUoUKbpvCoBwEGLv4ZodFAbfpuBfMv20JQZzn2f2tg196cEIP4o+OI5YYRijaRaaw
         xLvTS+JrLC+ie+cYbTK5eNS/Nouw5fVo7rEuQOJo+fbEfz77pkEh7SgDCJnLuOkBdRjQ
         wkrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775215649; x=1775820449;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cOr8dkqvyqFf6OUz7iSfGmZZS207nEioRgpDY/txeeg=;
        b=LrvyYcwY4l9GChF+wlzlcpybUgUzjYZdWK9gG/d79DxbP1FAWjnyvEncmUtbL8gU0H
         7cTr89NqImdgg3R4FzjYz9AMQpi+jRvL2+zSjaMj+PirpM2ccrxQ+ACUhuMRTgs3q80g
         GFh0w6yLqbdmDrmMeSoaiwgYtKZVaCJfs03YgO7SFVT15h14hJBbS2KLwvQ5kiGQXZvx
         BY76Sb0rSuEyMiqS4HxYMb2+uTSq2n7JBbh/gDslSqkszSCW0M0ZrZDvvod7QSJrVsUw
         pu0GRhwze+6sor4iXZ7V6HiGfO2q5YMT8X1/FGpPqTvLRvUFk8SvqSc03xrU8obehPwZ
         K8QQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQa4dv3lKWJE6e3EraSs/rPcfjb3Katt6q4AlIB2zkS1e/SItmLplpjEYdbpYXguo36PO4u9+ruN+7gg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7T2y54M9Q/710dXzINvt7bSPpOVD0fDsS09drQ11UeWl/GSIU
	COLzRiVJ/cmyVTGvFCM65PtYEEIKk0JLY2XFOhtCAZF7oigKAk5MH/VU
X-Gm-Gg: AeBDiesqJFXCn6UZqwH6SKafAkZRiVosqCI/E8KxSZp/L4OLdUFH2hq+PYx4wI4hBJG
	mti74YpO/vr+HTXQij51x5mGwS0XyKITHvJ3Pp1bnrS+Q53m02eh0IBAMzGlVNOgSsmLZn2ezTv
	M6FKDoVNqZXgogJHLjgacryR/BNwDb4+RBSAbu8SaYsRJh7U7MGGAjaITOU9GjVvAEWnvBvnbgb
	IleaFT6qhp2vIkQOYWw1IPAvMaTy2GvgOgQfA215M21d0H+9sjBNSbUvm9Qx0pK9IBEJPyCwNjL
	hkio12u2hAr14MnSrC2FMKyO7DMENBSrtO2qSdyfNXpzs2xpcXR7nE1CYgxOYTspPiBqu7EiRiH
	B1rGzd+94kZhJGk8tlt/4urRwy3qyZMV+C4TlcaDtVBNEDkELLtOnA8YXCwlgpMVsiIKKO+lmXU
	VmQryCcEKeMliodXgSW9VikEUD34NoCq6+kWqRHU+Tf9/DH1yk93gIs1M4pAf1Wip5vSbj
X-Received: by 2002:a05:6a00:189e:b0:82a:76ab:3279 with SMTP id d2e1a72fcca58-82d001e92e3mr5481537b3a.4.1775215649367;
        Fri, 03 Apr 2026 04:27:29 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b6113dsm5202251b3a.23.2026.04.03.04.27.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 04:27:28 -0700 (PDT)
From: phucduc.bui@gmail.com
To: kuninori.morimoto.gx@renesas.com,
	broonie@kernel.org
Cc: lgirdwood@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 1/3] dt-bindings: sound: renesas,fsi: Add support for multiple clocks
Date: Fri,  3 Apr 2026 18:26:53 +0700
Message-ID: <20260403112655.167593-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260403112655.167593-1-phucduc.bui@gmail.com>
References: <20260403112655.167593-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

The FSI on r8a7740 requires the SPU clock to be enabled
before accessing its registers.
Without this clock, register access may lead to a system
hang.
Add support for the "spu" clock so it can be managed by
the driver.
The binding is also extended to allow additional clocks,
as FSIB may require more clock inputs, while FSIA
typically uses fewer.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 .../devicetree/bindings/sound/renesas,fsi.yaml       | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/renesas,fsi.yaml b/Documentation/devicetree/bindings/sound/renesas,fsi.yaml
index df91991699a7..225cd8d369bb 100644
--- a/Documentation/devicetree/bindings/sound/renesas,fsi.yaml
+++ b/Documentation/devicetree/bindings/sound/renesas,fsi.yaml
@@ -38,7 +38,11 @@ properties:
     maxItems: 1
 
   clocks:
-    maxItems: 1
+    minItems: 1
+    maxItems: 8
+
+  clock-names:
+    description: List of necessary clock names.
 
   power-domains:
     maxItems: 1
@@ -77,7 +81,11 @@ examples:
             compatible = "renesas,fsi2-r8a7740", "renesas,sh_fsi2";
             reg = <0xfe1f0000 0x400>;
             interrupts = <GIC_SPI 9 0x4>;
-            clocks = <&mstp3_clks R8A7740_CLK_FSI>;
+            clocks = <&mstp3_clks R8A7740_CLK_FSI>, <&spu_clk>,
+                     <&fsia_clk>, <&fsib_clk>, <&fsidiva_clk>,
+                     <&fsidivb_clk>,<&fsiack_clk>,<&fsibck_clk>;
+            clock-names = "fsi", "spu", "icka", "ickb",
+                          "diva", "divb", "xcka", "xckb";
             power-domains = <&pd_a4mp>;
 
             #sound-dai-cells = <1>;
-- 
2.43.0

