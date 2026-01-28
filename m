Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0813836EA91
	for <linux-sound@vger.kernel.org>; Wed, 28 Jan 2026 17:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769622528; cv=none; b=mTrws1hZROKY79krd8a+mWel+nBcrQgD3HYoOKxi/+ALFNzhY0ISSH2My7ojMBAfN/tWUMoIxYPcKVNOze5SJrsgeYWM7sMcIGydh9G7Y6kGJoOIBS/R51aaDUty+oa27CEdx1CBeR47PZiNc3Q0ln+v1G0DsdRWwClP4fcDGvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769622528; c=relaxed/simple;
	bh=PKQ9ZA4OzAcviDxcmcU38wqNemRfIIokYyl6cY8TCIA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DJJI/UwtUCv8zAWua1d0jN5Pbd01LiL2Ho+qd1PXnNKEuOXGsNjKUn+fKadq5iKhu+ZsJp0zrlGMDDFAVhLAXQ7MP/tb+S+upSiE0syo/O9tsFMqJ7a8009YnncxlI3Ww1UbsdxjPZomoDbBJH3nQk7hJAImjWEmXWrHvGs1PHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jgkx5198; arc=none smtp.client-ip=209.85.160.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jgkx5198"
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-4042f55de3aso75362fac.1
        for <linux-sound@vger.kernel.org>; Wed, 28 Jan 2026 09:48:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769622524; x=1770227324; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IM1HgF8lQ5KCUPSngea1L4dZ9ovQlt8fHo3wYhN+zkM=;
        b=Jgkx5198sLQdINQYClmLaz9wiKxasV48hPwHm/V3LLK20QKedkemSa+/RWKKvB0bxD
         XRrQorN57R1xZZAqOaHr5nNcg2M+KnzurqvoYCix/qslpb492TLLd+MBhuQQ3VwA4zCM
         EpfACxfsgvKEWqvHBt+lPMD/KJZzdrTlvaCH9LbSwMex27WM//I4KJYT3LuKjrRlGgVE
         EZgxH2AIgXArPaQ+3dHifrQ1SM9ylh2OKqpFugazVgy6r9fTUn4t9sSZEgNl3zLjO9PB
         KAcaHkNGAy6OfofV9JIw8nD88yoa/krKugCpI4jgJDX86dMks+enyK3G0L8wntLCt3Vg
         3cgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769622524; x=1770227324;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IM1HgF8lQ5KCUPSngea1L4dZ9ovQlt8fHo3wYhN+zkM=;
        b=V37stGf7XAxB5r+tcx9iX1zA3TyOmnIhrfqOwHFFWQheSTxW3FMm5ILlx6+1EBs821
         4sOFM9AnFxNyMAV+pcLl5m//T2/qvnaLxvyycMCeavMkoM9SDXkOApYT1XsETPqzA8h2
         C0ZMMcr3MSIKFIg//ArrCHXrz4Og0oqNbSnM8Hi16CLPMYAnTmTnIA0N0qgC1giEHJW8
         SEUWOkjlesndi5SbnPd4LNo+FT1zWtJqXmIw1Zn5v7deKnD8f3qbX5m1gv0ci5K0SUGO
         1+8v31L/ErQR8bQfBSWlVbjEer9tkhD9fYX8nNB7pGluqWcFTXs0OMzmFfdolKRddo0W
         CsJw==
X-Gm-Message-State: AOJu0Yzq5+Ie1PKH+yYgYOA4SbXonaZqMmghAUEWUkXseHmTsrmfIOMC
	/ibgr0jaUdSQdmU0mH7+feMpnKMoI2DpFK6RLgeumxAzuc1Fjr3qOPY1je6eZw==
X-Gm-Gg: AZuq6aILILKQ0wVQeop02wi3LPFdjuLVn1+Y1rvaAR+fuzeV9w/Hov7J2WQcQse/LKp
	d1Lt38Y7VJnNufNjVQUHLAYEyIfpLcAXClwoC5+gZBLt1YX7MfyctlofEVSSEZe/sp5we8XKrs9
	aafU40hAu3aowO/e/clwXqhnr9xEwGVMrCADmlQ7vrt5wnQ/whG5pwKZ2H8WcUeocEA5ccqnfn3
	Z3aJnuLzAWQ8QDrMtYNZj98Aysxl1Uktn+yekuELuTkXryV+Q/r/BvdKFKA8JF5SFKO5fwSIvrE
	jvme5MGfC9oLxkWliF6deK+3nQFy2P0qlVo9iu+6IdvX4H6AmHRcCNc+3Js0zDbqHrLZuJw8UwD
	I83EBTsCFWTqTHEzBhM17LX7DEzYWEfcrurXijOdpToIf1sUiutv9/7CPeRC2l2B/Yo+wJFXA/b
	eLe34yaec2
X-Received: by 2002:a05:6870:c6a0:b0:409:62ce:83f6 with SMTP id 586e51a60fabf-4097fb10886mr166968fac.5.1769622524344;
        Wed, 28 Jan 2026 09:48:44 -0800 (PST)
Received: from localhost.localdomain ([2600:1700:fb0:1bc0::54])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-409575b0a89sm2187647fac.20.2026.01.28.09.48.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 09:48:43 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-sound@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	wangweidong.a@awinic.com,
	tiwai@suse.com,
	perex@perex.cz,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	broonie@kernel.org,
	lgirdwood@gmail.com,
	heiko@sntech.de,
	linux-rockchip@lists.infradead.org,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH V2 3/3] arm64: dts: rockchip: add Awinic aw87391 for Anbernic RG-DS
Date: Wed, 28 Jan 2026 11:46:08 -0600
Message-ID: <20260128174608.1498-4-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260128174608.1498-1-macroalpha82@gmail.com>
References: <20260128174608.1498-1-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

Add support for the two Awinic aw87391 audio amplifiers used in the
Anbernic RG-DS. These amplifiers require a specific init sequence to
start which is usually provided by a firmware file, but in our case
the manufacturer only provided the sequence. As a result, we hard-code
a device specific compatible.

Additionally, add support for the VDD regulator used to power both
amplifiers. Note that the amps can accept and respond to i2c commands
even without regulator power (perhaps due to a secondary power source)
but cannot play audio.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 .../dts/rockchip/rk3568-anbernic-rg-ds.dts    | 44 +++++++++++++++++--
 1 file changed, 40 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3568-anbernic-rg-ds.dts b/arch/arm64/boot/dts/rockchip/rk3568-anbernic-rg-ds.dts
index 6ac1fe0d3c98..8d906ab02c5f 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-anbernic-rg-ds.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3568-anbernic-rg-ds.dts
@@ -354,6 +354,7 @@ sound {
 		compatible = "simple-audio-card";
 		pinctrl-0 = <&hp_det>;
 		pinctrl-names = "default";
+		simple-audio-card,aux-devs = <&aw87391_pa_l>, <&aw87391_pa_r>;
 		simple-audio-card,format = "i2s";
 		simple-audio-card,hp-det-gpios = <&gpio4 RK_PC2 GPIO_ACTIVE_HIGH>;
 		simple-audio-card,mclk-fs = <256>;
@@ -363,8 +364,10 @@ sound {
 			"MICL", "Mic Jack",
 			"Headphones", "HPOL",
 			"Headphones", "HPOR",
-			"Internal Speakers", "HPOL",
-			"Internal Speakers", "HPOR";
+			"Internal Speakers", "Left Amp OUT",
+			"Internal Speakers", "Right Amp OUT",
+			"Left Amp IN", "HPOL",
+			"Right Amp IN", "HPOR";
 		simple-audio-card,widgets =
 			"Microphone", "Mic Jack",
 			"Headphone", "Headphones",
@@ -468,6 +471,18 @@ vcc_wifi: regulator-vcc-wifi {
 		regulator-max-microvolt = <3300000>;
 		regulator-name = "vcc_wifi";
 	};
+
+	vdd_amp: regulator-vcc-amp {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpio = <&gpio4 RK_PC3 GPIO_ACTIVE_HIGH>;
+		pinctrl-0 = <&vdd_amp_h>;
+		pinctrl-names = "default";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&vccio_acodec>;
+		regulator-name = "vdd_amp";
+	};
 };
 
 &cpu0 {
@@ -840,8 +855,22 @@ &i2c2 {
 	pinctrl-names = "default";
 	status = "okay";
 
-	/* awinic,aw87391 at 0x58 */
-	/* awinic,aw87391 at 0x5b */
+	aw87391_pa_l: audio-codec@58 {
+		compatible = "anbernic,rgds-amp", "awinic,aw87391";
+		reg = <0x58>;
+		vdd-supply = <&vdd_amp>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Left Amp";
+	};
+
+	aw87391_pa_r: audio-codec@5b {
+		compatible = "anbernic,rgds-amp", "awinic,aw87391";
+		reg = <0x5b>;
+		vdd-supply = <&vdd_amp>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Right Amp";
+	};
+
 	/* invensense,icm42607p at 0x68 */
 };
 
@@ -1014,6 +1043,13 @@ touch1_irq: touch1-irq {
 		};
 	};
 
+	vdd-amp {
+		vdd_amp_h: vdd-amp-h {
+			rockchip,pins =
+				<4 RK_PC3 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
 	vcc-lcd {
 		vdd_lcd0_h: vdd-lcd0-h {
 			rockchip,pins =
-- 
2.43.0

