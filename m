Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12AF53FE663
	for <linux-sound@vger.kernel.org>; Tue,  9 Jun 2026 11:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781005149; cv=none; b=uQ+4jQ8x3IfEb8ATFoUHc+dpruFxbNwqghOD/nqXPoj7oDVR16VGVFzBnO2/vCpOVLdbSE7rnV3Ncvw+DXyFYb4SxOT8rE4yzDHeF/eiMP8aMYcATPJUr/12uxPVfhuGS3TrXlnOXt7TjSiM18S2zy4UzIVni7XOl2wGtVyxZEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781005149; c=relaxed/simple;
	bh=fTbdpRCyfFLaOtbYVQuXBTeh5e2Blvm9k0H83//ETNE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uieRwTxqM6gY2vOfQz37W3ngFM64a3L81WeQFA0OUtbrm8kxPuKQ5tE8yI3q+SAEAILbUdRke+1C+EQGwnYlfK1IX8R/yyB3zdvIEIZZcMMuGn0NqYnGtz6+SpSyvtk6yC7GIW7eViAjBfVzKofuCOWmTbz88/YAWe5ZqNpyf8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f0K17pzG; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f0K17pzG"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2c132ac5ec2so53023025ad.1
        for <linux-sound@vger.kernel.org>; Tue, 09 Jun 2026 04:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781005147; x=1781609947; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JwW5NMDZEbB74SUEwI6Q2ihuAyLFKsCwR8MKDpGPFxY=;
        b=f0K17pzGok8AG6cblWdht+Y+BPqVuaLw2dmKrPaRplni+FCwgCS3j+9kVFL+gslipB
         cpQQwL+kq5+WP46TtnC55rbKiWZ2me8IfuGS0lyi8s8w6G/KzGdTXM8CCgUiV5h7GQD9
         06IkXgygPzwE5rlEBmnEU4GLRpvgQPSC67NJ5lqYaU1e6CWgHBvWLi/doZjZyH5vP/73
         Y+oeLbcXPP3qiilNBXPMxIEuLX03DKtkbh8QADw/SDI5P+SY0vEh4Zg/4gN2I4JLYjF6
         8FpZ+hEtkgjhXffD5JeDayv0aWJVEsngAb2/KQ9/5Kcm/McYQzaQ9ZEUciTTUgImF13A
         /O0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781005147; x=1781609947;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JwW5NMDZEbB74SUEwI6Q2ihuAyLFKsCwR8MKDpGPFxY=;
        b=BAzXGGpSoRPjI5nhmzNggMHGrLh5UXTmn5NNeNBmfwIFsq0dUF+cBbCOXqwHzZoUE3
         0TyPjiprKx2JXO/uQMy6oTdF3dfaAQU99M2LaClktk0D7s5xllCXDNBl4ahHG5z7FWLK
         95MNYmgAvxsphbHEdylfTM1A5kEhUdOrmHjUGRtFML146RzIJ4203WUXziLakPbbiYxm
         cLBVJTa+GpXl8cmMZv3dWSp6YUwl67ErJCgsnos5xmLiP7lLh32FXrdOmWGOqLBX2gQk
         0RESYUMfa5hNm4ykryF4JeFFIWu/saiCh2nk4YolDNKGsFrVEot8vAgm8Gq6t/tGT+og
         62iw==
X-Forwarded-Encrypted: i=1; AFNElJ/IEEf/b4lbYdxD2Je+GgBP97nB1weGZQC2bwrY5O7WQ1jmK86mvuAHosBOIi8//8s01SpAiUPpkStCwQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+N/thHlF0U7tDeyOPQM7SUa1Dw/XxxuKDF7veT98w/NbTiFa+
	8W2uvs4xQkdKIfofT1WTgrSk9hvsQdSrI3lawpnJCpJJApvB1lH9vnEC
X-Gm-Gg: Acq92OH+Y5CfovdaRQOYhrH0oHuvAxdG5EnIYFXFe0h9viLAJ/uTr+aBJ8Qpsf8A4mC
	bBagWseLqZNB9Lx/bBNUGBKzQrdrpueegTHCNtx+GQeNrHrc3GYyR4zVfT9A9noszcEaQoCzjvS
	QW/CBi714/j1FyDUkevm7KCoNZIsqcD+e6PSgN+tLmXlA6qwAB3mSPATXN9MYh5uwrV8ao19XDp
	gwdowbVY+uo5qIKAuz+TN4oH47BH1r8yERRfTE/kKorjjdJkDIJEP9n5PYi6iHhmhmsBIyYGg9n
	uljqvGW3j+wsTJDKVC0OoElJwCXzHMWSkA+RVHfTywSl9DZKT0woScT0cgmIoxutz2SRRCleo8U
	HScmRS5R4QOHmsKCWrGrYt2ppZWqK+yma2tTz1HSsOuDtmA/fqpfVrTt9JChB4EWriVfFrdAQ07
	MLfCITXa11ryMQZj9tKe05EO2MIQmK0oV0o7JAc7MjyMf2XEE2IKmbGpw+oLCnhh5zE/QugXJix
	bzDin4=
X-Received: by 2002:a17:903:3d06:b0:2bf:2114:ecbe with SMTP id d9443c01a7336-2c1e8209435mr230863995ad.23.1781005147530;
        Tue, 09 Jun 2026 04:39:07 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f70660sm210755635ad.11.2026.06.09.04.39.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 04:39:07 -0700 (PDT)
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
Subject: [PATCH v6 02/11] ARM: dts: renesas: r8a7740: Add clocks for FSI
Date: Tue,  9 Jun 2026 18:38:27 +0700
Message-ID: <20260609113836.45079-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260609113836.45079-1-phucduc.bui@gmail.com>
References: <20260609113836.45079-1-phucduc.bui@gmail.com>
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

