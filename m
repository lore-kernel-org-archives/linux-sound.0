Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D62C43BAD9C
	for <linux-sound@vger.kernel.org>; Mon, 13 Apr 2026 10:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776074873; cv=none; b=ZLAC409c9ekBk5h9chztJTxx3ZRfFb2lAnyNPZ0/7KpcCQowpkKpqSHbxkHUE2vhcUascJp4GKoopsWfSMlUSDNTl1J39eBw5D6T472kXFN/lNEKIaGKfDDw8RZOmOgjyZu081T0pL8omOypC92Cpy0KZ1VB4B6XRVu4+2kFGks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776074873; c=relaxed/simple;
	bh=gbzCR/HLA/ONbOES45gBPkfZFyPZ1gKgW0aInfcMl0o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Pd8riAdmoczKAv5ux61jUDUn8LkW8zan7T85Y7Ek6R8FTQX5BO4ven7y+L+btag4tXG2Fo44gw9rVLT+xiXroNcDiiZfNm/XwhfbVO3N7V0LodvXvOfZdmnz1DptnMiU6v2Fzym3bNYljn+kzIPTjHJHQIEDGKdsflhDAun4DDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oWZVwkjW; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oWZVwkjW"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-82ce2e2880cso2784988b3a.0
        for <linux-sound@vger.kernel.org>; Mon, 13 Apr 2026 03:07:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776074871; x=1776679671; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L+tmudkXITzJHSYr4BUq79EkgThQNBRhbQCg3njXY7s=;
        b=oWZVwkjWBjynTA7MKyL7Q1FapKZKcnjORbSmOsLe8tcYcpj443RwZysljgLXb0rCQv
         3A9hXoVHXDzhfdFOYJjSAA8YHR+DOQUtltz15gbBorh+tcYpWEAUaJlP5vwruewSK5VA
         9QiKG8AX5hlI/s1VSTFVOwmEwAB7YRhX5gEAPl4DcvPaGTwOjFNdIivLFPaPbp9TacbB
         K/nHMvzvM1nj4aHbQ8coRP2KbUbRL8P0VJpQvEqCBjMead7svh5CfrIE6Jq9c4yUTolY
         AHsTLaiShwTwPc9tDFLmUYTVvMSm/YwD3mJDk3kVSYQ90cEDRel3coYAfoyaBZyi16SB
         u1HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776074871; x=1776679671;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=L+tmudkXITzJHSYr4BUq79EkgThQNBRhbQCg3njXY7s=;
        b=fvUgUvb4+eZvhHcJrnSkbe7pmBRGdu1RDatM78L3sHujHm5nUVw7O8BHa3/ZODIABl
         lQqgM6Re8s/mfH/Wnf9XlEFowkumN5i188Tq1c5F677nWXpfxdrkneG5BI5d2HnUVdb0
         QVbFmeGZsSga0UXkoIUqVuBMbHE4XsHV8aMKD2x/oVfAU6N8bRcOOr+ZODXKW29sx7uu
         0z4LkU+p6WjbV8rhCcq6vZjKSs1XmibvbMzNsefNqUdZZYaEkEvSqTFCI1MbJODdgcX5
         zjk47pWICabdm9alQzD9v+SRw0Z2Vpp8Tl+LiaXSwmwGpBXWOrXwId6EoRuNv3dSZi/S
         IgRA==
X-Forwarded-Encrypted: i=1; AFNElJ9Sk1JtVgZY2HGcurqKAFQswy2OsmM2K496FG5CJzLP6hFK4eg2Y28rUokdlTo2wNKgw89zhVuBGjuvYw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwSFEUHujVuQzTiDQy+JjGCKHuvk7T4ZKsR7TfRiYIR6Z2347F3
	MMLovS0O7sD8I2Hkrc0ZuOQCz/0Syl/YmZEEGDIYdvjW4tMcrSbPT9UJ
X-Gm-Gg: AeBDieuMb7ePqun86l6ug5CXsyQJAb27xEhMJ64Po6zCIGCuBdzmP98xwnDHJpPbs4n
	pkDOYYL7Yq2ffS+jRZhrhNpIAqbSWqH0x+W4/LDi0DXkTDoA+fDZ8EDT7/1aI0o8O8DHqpamTds
	cG/CXafgthqzg51A01Igfmxh2bR/S0BjG7MaFt0LsKZSvrvXSkryP62gNuqvPvMJKSi0Rxsi4jx
	3w6m07GZdTXPzbrD8oSqICwLIsncqwVgMemFITWJeecFF6fBW5CBA5PHWxPer9V1DYoyKqeMK80
	2SVFu+UGARRkmhEwiyzEZUqhjCp72x2WGn9mYfVZ73wwjWnulj5WrAKJn6kR1BbrAMlkIyN2KyH
	6yRV+gj82Lgo92aLsjyXK6foj4BWUf7j+5v5tcaMlywRPoeNo3JaDHQ+B+hEmja5V0TVjeNc0x8
	YmYQB73CxFlm3kwPNbHv5j+vm9Oqh685slxDNTWJ+7TFRLbCiLIGIuBfn2vw==
X-Received: by 2002:a05:6a00:1c97:b0:82a:5ef0:210c with SMTP id d2e1a72fcca58-82f0c234924mr12333653b3a.24.1776074871294;
        Mon, 13 Apr 2026 03:07:51 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c50a8f7sm10232140b3a.56.2026.04.13.03.07.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 03:07:50 -0700 (PDT)
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
Subject: [PATCH v2 5/6] arm: dts: renesas: r8a7740: Add clocks for FSI
Date: Mon, 13 Apr 2026 17:06:59 +0700
Message-ID: <20260413100700.30995-6-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260413100700.30995-1-phucduc.bui@gmail.com>
References: <20260413100700.30995-1-phucduc.bui@gmail.com>
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
Also complete the FSI clock tree by adding:
  - CPG DIV6 clocks (icka/b) as functional parents
  - External clocks (xcka/b) from the board
Define fsib nodes to support the clock hierarchy.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v2:
 - Rename "fsi" clock to "own" to match driver implementation.
 - Add missing clock names: "icka", "ickb", "xcka", "xckb".

 arch/arm/boot/dts/renesas/r8a7740.dtsi | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/renesas/r8a7740.dtsi b/arch/arm/boot/dts/renesas/r8a7740.dtsi
index d13ab86c3ab4..b8d903b711be 100644
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
+		clock-names = "own", "spu", "icka", "ickb", "xcka",
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

