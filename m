Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 381DF3CCFC9
	for <linux-sound@vger.kernel.org>; Fri,  5 Jun 2026 12:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780662027; cv=none; b=g5a7kZmpbG6KbThA1Qxe6mDxWdYjyB6Wb+a/tquEXhEO0XhsHplxhvkUoUH3al5XQoz3MX0AFCbWRyrwEEaFg7ar5z86ZF6KKacO6rVvwA6U0Gzmxu6JuYPdIyk14196DlqPwzRayb2AJBbq6U+HmSL+yoYS3YaYnPt2/Bmie/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780662027; c=relaxed/simple;
	bh=fTbdpRCyfFLaOtbYVQuXBTeh5e2Blvm9k0H83//ETNE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YFdTKpk2/uE0oN87KSk4kDBHof0y10C4KASjBIgU+jxzIWvI0S82Ob4E3v1sb05n/n7+0+20BtNCkNo4H/WHZkATEjHxNelepARDPv7Vq0C1k/xSzrgmpprrFc7YZFjhVApqHHj07vRWxp/ZiF/OsqsFXIrZy+vcwnAwBzwOKko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nvaUTNug; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nvaUTNug"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8423f420455so811015b3a.3
        for <linux-sound@vger.kernel.org>; Fri, 05 Jun 2026 05:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780662024; x=1781266824; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JwW5NMDZEbB74SUEwI6Q2ihuAyLFKsCwR8MKDpGPFxY=;
        b=nvaUTNug3ZU0SWxUO3S3khfKFoXf/Dg19CWpHNsfV7eh2walln0B0rIVbXcF9irpPk
         3OkmwsOrQO1SMSi6AQk3mpk3tddDED7nxQqpdE90VvkklCyFQtbYnnZ6GbTnIEKJfeFj
         lkrI64/NCFM76th/SxL0aNtpcHUtOYulxfyj0ZP+knvKgq2rXAX2zuXq/gC0YJCrhLMn
         xmpKEiF9iyEjOxDya8xj5c4JUXXQCpDpaIEVuZ+CcaCyRLTFC5iTtgRuy5QK4V3ZREZH
         TCFivrKluxZHcVZXPpOUZ6QjzqulCS7paNSYQfruvHSHY7Tpq9NJcxLctxsp/oKoXDTY
         50GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780662024; x=1781266824;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JwW5NMDZEbB74SUEwI6Q2ihuAyLFKsCwR8MKDpGPFxY=;
        b=F38bO3SuIcZse4hAWpYSa/7+fPRTBwyWmxu2A1PimEhGsqnnQVwq8sF7QsR/10k5RM
         A6vz9qygC4do6STaV543xhlsIvDW8KuSLwZlHhnV+6sfJKJx5gc6KHepL/LJDKeXZwcU
         OkBeu/P3s3Arb2upnlryr6ZGQwkh1VZ/eLcVQVpB+60Z+Rekd2FHGPqgb86pVlXzMOZy
         u82suZGH39ksADrDggrhSRjUpLqsE7zbf/CFxRn2sgLaKI0iit0SbSEV8hJu5d4X28ea
         iqjV2NYeF25UHyZf/YMqnz7WTu8QcZfKPrbGnreNbKZEoMIC8iQo+c1Gd/ir/4q54wbv
         b6Mg==
X-Forwarded-Encrypted: i=1; AFNElJ9gX2k/t+7UW/mMRADexnKEdOes9iDCA6IzBvxfIUkKm39d9ztrEptRnd/QAmxYxh8S0g8Wb4H3SFn7cQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzTjchaQarT2v/9qmsBGL7E6/5IC/OQX+7R/z5wJcEaXIseeRrj
	CGWm1lIvYiibsywACeFlA/anpaKFLKcZFowZk+PEIstmnUKXbY036p29
X-Gm-Gg: Acq92OGxyASxr8Q4d5eLcCYCE6gC73tp1Tt4vgTR+xhAmzlPFNdclNyDURzTkvdZ+L4
	21d9n7B6E0hyMO6F3IQSktzu3zIoRMn4ruBYBgsp0UY/gv7jYhxje+haBBK30FLcCFty8pCbs6V
	CoqVfg7/0PbCaQNJ6X3SL8roicBZIbM+Sbpouf7lxR5shA7J7xIsNNeV/nPF5eWgb9vseIWlN/Z
	kfjpHDts10YRzcy4gMOSH/zmHGZJt3y2H9zV1bJXrBkarW/Ja0uaYKAenGNTBGhfoBwHBrZdHxI
	QEj0pY3qERYWEuD0KpX6+hYyvU1gtfrGNdikhjdP5eT464K2SWJETA/S6Y4B+UV1G1wmq6Fq7yP
	4KnjFakGiPcjGL1GkbiIsncalhE/B+4g1rReb3KfctEeLODxAdFx5zJ/RZrwHi62YI3gqkFDwx3
	8xS3wlxDHmmSVgr8oyDtKEcJ7Q3Bm6ScOl+awGlIYsCwhzQ/JCjfl+h0puUM9nFsKAt4WH
X-Received: by 2002:a05:6a00:4390:b0:842:6a3b:60ea with SMTP id d2e1a72fcca58-842b0fbbb03mr3362512b3a.40.1780662024485;
        Fri, 05 Jun 2026 05:20:24 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84282221059sm8594381b3a.7.2026.06.05.05.20.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 05:20:24 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Mark Brown <broonie@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v4 02/10] ARM: dts: renesas: r8a7740: Add clocks for FSI
Date: Fri,  5 Jun 2026 19:19:46 +0700
Message-ID: <20260605121955.105661-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260605121955.105661-1-phucduc.bui@gmail.com>
References: <20260605121955.105661-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Add the SPU bus clock, icka/b functional clocks, and xcka/b external
clock inputs to the FSI device node.
This prepares for subsequent driver changes that explicitly manage the
SPU clock required for FSI register access on the r8a7740.

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

