Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50CD836A02C
	for <linux-sound@vger.kernel.org>; Sun, 10 May 2026 08:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778402633; cv=none; b=FNsrmhJUxRgKoJaKfMgQFVTVoX5PdumMs7lKIaNdhKb7K69qRGrg7wYdpViIc9/2+TX9d+iJ9LGCENImXgxreHBfs3In5HH+TniFrsh4tmentvGdvDAC5fxPOeoPavRPCjHzvEgtPl6hBT7Lc98fUthtxZZAJS8zExraaD5dzMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778402633; c=relaxed/simple;
	bh=DTF/btmt/0REEac1VNTgRyM88bPMcPEL04SwiJzjaGQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jheI/3Pt7EIsmV2dhHroubKIGSVZmFqnCCz9Vl8/O0CfaPnv93p6u0D7otD53ffYDGiOKSpadIOyzGtURF1XAi9W0pgONrY04dxElWFfK/K7AHOzBEunBiykaY4O3gVR6d73hBOk7zU2Qa/+aV8Yzrywhae+kPli324SCcR31PI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VSMlH0LC; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VSMlH0LC"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2ad9f316d68so15002285ad.2
        for <linux-sound@vger.kernel.org>; Sun, 10 May 2026 01:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778402632; x=1779007432; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RUQuLqpOBSAJcHe1LC1qE0yMZ0cjnVVQWqbr1WChTYw=;
        b=VSMlH0LChQ0K87Cs1v3Fvm5/AoklouohVNi5bndBp7bSqq6np6ERoN9kp8rgtw7Jkx
         NKePUwr0K+2SmdO+uck+EEsSAYOZYsWSyOPh+Z64SfZBIg2kq436y8hhvExT9fTOvLyq
         l1fw9Kkyzkdr9feQff+EWOnoXtdcsdyETbFA6wYN1mmiS9ZBxEJM3uWo4pt08fIlBH5f
         w7VAQeitAkbJebSjBVya+pUZjVdffbchK74cUBRhEvX7e3sxRMYZB0FQx/7aIGGAsOWo
         wNz8QYW57k6Q8y5U9wXb9tx7TkQRX7HkEl2XPkiRZ9Dr27cIPfmqzTSSTcS3rRrQXIbj
         aGDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778402632; x=1779007432;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RUQuLqpOBSAJcHe1LC1qE0yMZ0cjnVVQWqbr1WChTYw=;
        b=XvpujsVxMbIxdQ/UTEPOxbYH1ByvKrL+unHD3mbNBMkhS/qXOQsan3A1m1+n3zos5T
         dFBYJAkRd8D/HAYp/aIt4bcaZHpsB3LcThb/o6PD62sM4pnTcQqghZUhykSLyXrOgs+J
         8eNE66ON5HDppfyiwMhuqiP2ibe5Z9joqa2FhnRcmYQlTKouaPSdukdXHPOnj5yZ7pR2
         sZBDdZg7KrdPjsrgz/Zbn1TGaaOX0xRzlmNlt3AlGJIZn52HSfQvUH8gEq3PRnl/a0y8
         srHiRUHLf6FX1l0Z8WGOgpLEooBDtfynTK2uS3NxlXfyQFVPf7iQcnVNMxdc1vDcJ/od
         O8gA==
X-Forwarded-Encrypted: i=1; AFNElJ+EikAXo1vVkzEK7+7GDeErFLEM9tc7Zl7sTymEZm7/1bNAk5nLB1zCGmb2y5ZM7qT/hLHMC95PkdIzww==@vger.kernel.org
X-Gm-Message-State: AOJu0YzDoB3uhVgM7pBSImS5XLqrgZKMIfZUf3okNqr4RJRIyT0i5+Y6
	w1s0jiVJnmC7bQ6Wsqazmzf5E/7igpkO0rYshZBPfUaAzOy2qKmMSAsU
X-Gm-Gg: Acq92OFGSLjFX2kW/ZEZyWxBFZH4hAnNHdfABewGhznXrCes+IAEDSxOm9PP5uyK8OF
	0aSb/tHBgpyF+OzLw9yLanegIJnZxpfCA8UUmB4Ktorq1dz7xMqQYnfH5TJV3KXQRe/FjBG2Uo6
	YXJgTf02S54+RvtAWZjPtf7M/1AG/+zUccRyBjRiSssjhuJIeH1YDSAkaymk0UKsaVJkEvs2lgD
	3TMAojEhpbkyK5fy9UpNzCosRdMzvoyehE291ksGOJ2RC+0CWby7FFcMZalRqWr0AWcyz2oxYHO
	KZ+UMZirXRjqVu3ABne4XECOsQ07IQLSdWxijjVOwEZAqpJ7PkjxDERBYOqKAIlmKzszdA/giag
	MFfo9b4wbNnxtsV4Chs/VtQ0qKLJktXemOrK9uhFs5vNciyEGlBOrlJWpI2/3u8zoN2FYfh4lja
	PhA6ZP7cFL7k+andNhVtHcLxHx/gUIsSA7x/11IZ85kBfGBaJMkxlxXXtdfQ==
X-Received: by 2002:a17:903:38cd:b0:2ba:be5f:cab3 with SMTP id d9443c01a7336-2babe5fccc8mr136653355ad.3.1778402631615;
        Sun, 10 May 2026 01:43:51 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d3ffa0sm70471005ad.25.2026.05.10.01.43.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 01:43:51 -0700 (PDT)
From: phucduc.bui@gmail.com
To: kuninori.morimoto.gx@renesas.com
Cc: broonie@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	geert+renesas@glider.be,
	krzk+dt@kernel.org,
	lgirdwood@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-sound@vger.kernel.org,
	magnus.damm@gmail.com,
	perex@perex.cz,
	robh@kernel.org,
	tiwai@suse.com,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v3 02/10] arm: dts: renesas: r8a7740: Add clocks for FSI
Date: Sun, 10 May 2026 15:42:55 +0700
Message-ID: <20260510084303.122426-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260510084303.122426-1-phucduc.bui@gmail.com>
References: <20260510084303.122426-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Add the SPU clock to the FSI node to ensure it is enabled before register
access, preventing potential system hangs.
Add missing clocks for FSI (icka/b, xcka/b).

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 arch/arm/boot/dts/renesas/r8a7740.dtsi | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/renesas/r8a7740.dtsi b/arch/arm/boot/dts/renesas/r8a7740.dtsi
index d13ab86c3ab4..6f9d9bbfd159 100644
--- a/arch/arm/boot/dts/renesas/r8a7740.dtsi
+++ b/arch/arm/boot/dts/renesas/r8a7740.dtsi
@@ -393,7 +393,11 @@ sh_fsi2: sound@fe1f0000 {
 		compatible = "renesas,fsi2-r8a7740", "renesas,sh_fsi2";
 		reg = <0xfe1f0000 0x400>;
 		interrupts = <GIC_SPI 9 0x4>;
-		clocks = <&mstp3_clks R8A7740_CLK_FSI>;
+		clocks = <&mstp3_clks R8A7740_CLK_FSI>, <&spu_clk>,
+			<&fsia_clk>, <&fsib_clk>, <&fsiack_clk>,
+			<&fsibck_clk>;
+		clock-names = "fck", "spu", "icka", "ickb", "xcka",
+				"xckb";
 		power-domains = <&pd_a4mp>;
 		status = "disabled";
 	};
@@ -614,6 +618,12 @@ vou_clk: vou@e6150088 {
 				 <0>;
 			#clock-cells = <0>;
 		};
+		fsib_clk: fsib@e6150090 {
+			compatible = "renesas,r8a7740-div6-clock", "renesas,cpg-div6-clock";
+			reg = <0xe6150090 4>;
+			clocks = <&pllc1_div2_clk>, <&fsibck_clk>, <0>, <0>;
+			#clock-cells = <0>;
+		};
 		stpro_clk: stpro@e615009c {
 			compatible = "renesas,r8a7740-div6-clock", "renesas,cpg-div6-clock";
 			reg = <0xe615009c 4>;
-- 
2.43.0

