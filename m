Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D11B33260C
	for <linux-sound@vger.kernel.org>; Tue,  9 Jun 2026 01:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780968702; cv=none; b=Z6E2Oi+xxkH4JyLTCgb4Q9Ha6ybtQAFPlu/+H8ahmoFiWM9ObBZCR8LEg4oTLzqvgd+HE6Pwsn6Xa7GfM2uMVjdnh/zT9byJe8uWKlKRwkeJtoc71f4ZYS6HfTVpnjMCQTAqMw2BcvFWalrku65vuLqfws3xBdHRBr1vJxBXuJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780968702; c=relaxed/simple;
	bh=fTbdpRCyfFLaOtbYVQuXBTeh5e2Blvm9k0H83//ETNE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eJsP1Plhe4ynMBkLtazBHiLRVolhRUC9RgQw8JBit8YJlCswsSG/wS5dpWBZv7vFtMH0mRvw0xg8hBPmsvElYBpCBT7U9DXpZbBhO5Q4gv7FucboTz4O2td/pgbZSL/GS25MnZyiH94rVu5ckmkwiO3Lx4tBzoYkERbX837jwVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mXSzfxzJ; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mXSzfxzJ"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2bf1f074a12so51446965ad.0
        for <linux-sound@vger.kernel.org>; Mon, 08 Jun 2026 18:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780968695; x=1781573495; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JwW5NMDZEbB74SUEwI6Q2ihuAyLFKsCwR8MKDpGPFxY=;
        b=mXSzfxzJJUjTC+Ud3E+iBxBseQjM7nv8ALErbgpnmHbTPtAExDLGzTnrm/a5mDTdUs
         vt2VQegvXoyuVvUIW9bWaIAnxCfi3encV2vLZyOq5CspH1avxUPUppQnSP0a5dxUFSiK
         zZJpc6RKM+O6L5t/lCE3S5XJr7FRx4+Hy6JS1Y9n1Gl7Ww7lAkslYXdDZfJev93ChxyN
         SvUsabMmC0+YTzbKt+NKCIiaqlApEtw/CjDb1P/66qteQkWrmjzc3h3OUNZ7SHyn1bQW
         xXa5LKrFu0xVx93mBfZBVE6Xu9aaUZtNgDBlfjWD52H2lW9FhAivjsZ4RumUo+mWtTeQ
         w9hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780968695; x=1781573495;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JwW5NMDZEbB74SUEwI6Q2ihuAyLFKsCwR8MKDpGPFxY=;
        b=kn0xAlxvKWlVp1vDTdOpqLGUeQtxh/wd4FEmCVCMcNe+W1ysIZQtL6902Y1EBKMa+L
         2f3iZ0BlzuKMGJ+WHyDQOxAbQbYTkpLpelYnZgFmG+zZR/6ug+o0vIEr6sHgaxJ3wGs2
         qNAysqVEn/tHJC5nGN9bC4Ffzu5yYLUYJvhaR9jX78pxJlPoE9Ui3/p/SSWtRL3G38Kl
         6Sw74CTGxwi6KLY2yrmhzMXRNR30oouTsdRCVsDmhyb/2qZ9NcMRLvdV4M1ZXllcRmnu
         zSe80OyCtHWoUvmutgkIKIAVsjRIOuUUIPEH79hA2BnxL/Waf/ZWN1tfzUFTMik1asJ/
         4gTQ==
X-Forwarded-Encrypted: i=1; AFNElJ8l3j8t80HMusD/dVvDDRPJzKn3fyIFMy/mY+JvQjW55PEY+sArFBVZfDVaYT1sXJ6JbAg7prR1+tA8fQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxh50cHZZgoAXB07pDL6E0lWwED9YM8sMB2ywoZndaqVdBHYi8b
	3RYLIorC+bzHRqKnf2ZUqcB56PhZFiYlEqD2TpPyT3KYEWP+aLCh+lc6
X-Gm-Gg: Acq92OF0U8fnTtzSOc2ow62z6RSZY98yN5aB59PALOCTqk4FyQ6OpdQm8if4mc+4BJ5
	1rNhTwLDeOhKCWLhPs5d1/NDr/XZGjk6vwxYXYIQa5lSKiqJGnQsueqkvQmKbnpG1v6WdN0G+dd
	KShqXzW8SDBXIIgBN31uuENXaDRsTsA+kYtQ+9bjrvtgOV52o/P/15XoceHfq7YG8vhbIgSDOx4
	D4Wgq3B65pS2DL3kOvpfpqLP7BueduuOc7hB/TDFtEYauuzPfUo7APPuxukSJ4fHwRa4GStjDTF
	SwdSTW5ACs5L3ylk/tQiWcEWe5ZUVTpbkT7JH81E2uTRqWclCUvc8eAyCS3Z6pg6Glxk8CTVnQP
	RS5nVT+EaW4wHROOyoqbC31pDx6gXIEHUVgfkvk+J7b9kFgmpoxeqqIPRLCVN4hD0++9BU47xMU
	bpq/ZF6q4judi1ekJLg2oWhgEnqshFXin1+w0tyCUORirh+9/ZQbHkFw8bwuKwpGo5ud0r
X-Received: by 2002:a17:902:fc46:b0:2bf:2188:a90f with SMTP id d9443c01a7336-2c1e85c5ae8mr196563145ad.32.1780968695349;
        Mon, 08 Jun 2026 18:31:35 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16609e627sm198765335ad.52.2026.06.08.18.31.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 18:31:35 -0700 (PDT)
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
Subject: [PATCH v5 02/11] ARM: dts: renesas: r8a7740: Add clocks for FSI
Date: Tue,  9 Jun 2026 08:30:58 +0700
Message-ID: <20260609013107.5995-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260609013107.5995-1-phucduc.bui@gmail.com>
References: <20260609013107.5995-1-phucduc.bui@gmail.com>
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

