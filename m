Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59AC544D021
	for <linux-sound@vger.kernel.org>; Tue, 20 Jan 2026 15:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768921490; cv=none; b=VdDBUN/hJwCDAE1KeDc/95Ll8QaU2efjFCY/qleN7oZol8zjqbr8xxCDuayT7v3Bv8v9O6EVn7gh96k/PpiUvZDPCZx/yA3oB6LaeHxG3ycHjCILieCok5RNE+/0H7y1AnXbR6bdBHLcKccQYyzzh2DkVLyaHwjI2Ha86y2s5to=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768921490; c=relaxed/simple;
	bh=Jl3N+qCdcymJQepNuOa3YD/ijHGOuCtZx6z1DXj31tE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u8HcRXriaK6fatmeYyb4M3RhSbva3EOLSSiZmK0NU2GMOKF21Iv1LqZmn1xawklsMDAfIisRmlOr8w6VAJmbfc2bAJPj1LQqkbBuhULU1hC080xuza2pU5/EzwgAh/jnRQYrMunH9Jsu93PQ2P7Q0IDeIytunNAuUhiFj54VVt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DiQJAvU2; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DiQJAvU2"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b86f69bbe60so855419066b.1
        for <linux-sound@vger.kernel.org>; Tue, 20 Jan 2026 07:04:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768921487; x=1769526287; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GhLdh2zZK+bYAbQvWFFaUIm6SUaBfCue1vhMyALyCxw=;
        b=DiQJAvU2dLD4pbSsmdPLZV3bu7yHT6rZnR5Jk2ZJ7ydVTWEX+G+j/QqhFHhdSkVBqS
         Hag4uFSPK5Z4NPv4Lakil+ItTwntEtIvCcWooglM2XOHrbrBJwCD5XrYuIX/DSOrhlbZ
         T5CUZ7ewjQE6fnTAZx2vY4lYM0V7dcESBlta3H/sTbVLAS922fttpfoCG7m1hulS9/OA
         Jwo2oIDM97kdku5fmOq34XsfFeK8UCWEiJzmte9ORL3lnkHMkyvZOiIcua/EyoByTZh3
         gWtc1GUIv9qYOoedrQ3NJakeC3tZ1Pvjj/DGfKrETR2lr22SLt19B+8vMnYgWXPSCVMR
         VDPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768921487; x=1769526287;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GhLdh2zZK+bYAbQvWFFaUIm6SUaBfCue1vhMyALyCxw=;
        b=S6OqpeHRZpxKkbIl01ub6KbHMPAoPJsbAGPmPGlJ/QMCPjK9swRSFS59Mh31fX1Aey
         MnESOiwYExDkXfQ5JTPJ8UJc9HUSPAj5Mk51hhQTBWjlyWeLur1pbv2n7h+iFHTC/Ziv
         RqM5gfk2bHakTaGCmcuwE+QfdggQrk6H8vPMLxLkVdBtp1XRhS6raFkQxOjRxKdh5klK
         ax7J88E3BsLZwNFjaeBhlYXBWS4KZXLP6EJ7XR0Y695wVYCY8VsvzMNjagac7XKuL/0H
         A6acbMdsBAuBZ/sERqvzimx5zOXIsHXHNJhWg93EQ4GGFMVNtpFyfD/frCjS6osBSuk+
         OSIw==
X-Gm-Message-State: AOJu0Yx8Ezhjyud6wLbQ2FxGbbAkTG7ZPnLDrdxlmN2rZftk2EMLomM8
	SprOLJ2aJTD0cBa9+/c/7Mqy5iFUT+qMmiTUYnO/J0XMjBmjcDFuZdeP
X-Gm-Gg: AZuq6aJ7NbqixWnxe4LAWcPPpckZk8XM2ymmT+VCIJNwRydyYkSLgyW3C4/+gkelYy/
	JVlF83eJIPCpeUjJPPAk6LnkZVAkjq+E1RbK2zALPVEvlPmHcD6oClYsYALRz5GroXWRiJyzfzF
	Nrr3MMiTIRP4vKhZs9mZQ6xC2EziLneyn8QP04Xalu4TMcF2WDnQOvlAXglXuN4qvJF1r5X2QKF
	kwaTeO5Tp/Jgh5Q3DBAPyyKVmANP9c9FxOkqWFNeZPvYZpy7qe09f4MgUj7SZcEyAovjmImZsjq
	KtzOavCy1dYackRyPd23FqFYGG4jJceU79F146nYbcAuS9k92SeNDzkT++BWzUot8OJqvMJwBVL
	eq5pOTT1bTN+msI6wy4wS6U5qPLYfgs5dny0e3mhBTLoB3CXavDWJPTEuTGoDlFKSCzX4R+BkJn
	RvN2fMrMeqO3exm+X/H56odXG9Bkh6CK/sXUuF
X-Received: by 2002:a17:907:97c8:b0:b87:40fd:c913 with SMTP id a640c23a62f3a-b87968b6b22mr1267788266b.2.1768921486189;
        Tue, 20 Jan 2026 07:04:46 -0800 (PST)
Received: from SMW024614.wbi.nxp.com ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8795a214e8sm1427045966b.60.2026.01.20.07.04.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 07:04:45 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Chancel Liu <chancel.liu@nxp.com>
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH 2/2] arm64: dts: imx95-15x15-frdm: support AONMIX MQS
Date: Tue, 20 Jan 2026 07:03:29 -0800
Message-ID: <20260120150329.1486-3-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260120150329.1486-1-laurentiumihalcea111@gmail.com>
References: <20260120150329.1486-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Add support for AONMIX MQS (i.e. MQS1).

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 .../boot/dts/freescale/imx95-15x15-frdm.dts   | 73 +++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx95.dtsi      |  5 ++
 2 files changed, 78 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts b/arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts
index ca1c4966c867..53aae25db7e4 100644
--- a/arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts
@@ -243,6 +243,12 @@ codec {
 		};
 	};
 
+	sound-mqs {
+		compatible = "audio-graph-card2";
+		links = <&sai1_port1>;
+		label = "mqs-audio";
+	};
+
 	usdhc3_pwrseq: usdhc3-pwrseq {
 		compatible = "mmc-pwrseq-simple";
 		reset-gpios = <&pcal6524 8 GPIO_ACTIVE_LOW>;
@@ -473,6 +479,21 @@ &mu7 {
 	status = "okay";
 };
 
+&mqs1 {
+	clocks = <&scmi_clk IMX95_CLK_SAI1>;
+	clock-names = "mclk";
+	pinctrl-0 = <&pinctrl_mqs1>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	mqs1_port: port {
+		mqs1_ep: endpoint {
+			dai-format = "left_j";
+			remote-endpoint = <&sai1_port1_ep>;
+		};
+	};
+};
+
 &netc_blk_ctrl {
 	status = "okay";
 };
@@ -534,6 +555,51 @@ &pcie0 {
 	status = "okay";
 };
 
+&sai1 {
+	clocks = <&scmi_clk IMX95_CLK_BUSAON>, <&dummy>,
+		 <&scmi_clk IMX95_CLK_SAI1>, <&dummy>,
+		 <&dummy>, <&scmi_clk IMX95_CLK_AUDIOPLL1>,
+		 <&scmi_clk IMX95_CLK_AUDIOPLL2>;
+	clock-names = "bus", "mclk0", "mclk1", "mclk2", "mclk3", "pll8k", "pll11k";
+	assigned-clocks = <&scmi_clk IMX95_CLK_AUDIOPLL1_VCO>,
+			  <&scmi_clk IMX95_CLK_AUDIOPLL2_VCO>,
+			  <&scmi_clk IMX95_CLK_AUDIOPLL1>,
+			  <&scmi_clk IMX95_CLK_AUDIOPLL2>,
+			  <&scmi_clk IMX95_CLK_SAI1>;
+	assigned-clock-parents = <0>, <0>, <0>, <0>, <&scmi_clk IMX95_CLK_AUDIOPLL1>;
+	assigned-clock-rates = <3932160000>, <3612672000>,
+			       <393216000>, <361267200>,
+			       <24576000>;
+	fsl,sai-mclk-direction-output;
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		/* leave unconnected - no RX in the context of MQS */
+		port@0 {
+			reg = <0>;
+
+			endpoint {
+			};
+		};
+
+		sai1_port1: port@1 {
+			reg = <1>;
+			mclk-fs = <512>;
+
+			sai1_port1_ep: endpoint {
+				dai-format = "left_j";
+				system-clock-direction-out;
+				bitclock-master;
+				frame-master;
+				remote-endpoint = <&mqs1_ep>;
+			};
+		};
+	};
+};
+
 &scmi_iomuxc {
 	pinctrl_emdio: emdiogrp {
 		fsl,pins = <
@@ -618,6 +684,13 @@ IMX95_PAD_GPIO_IO31__LPI2C4_SCL				0x40000b9e
 		>;
 	};
 
+	pinctrl_mqs1: mqs1grp {
+		fsl,pins = <
+			IMX95_PAD_SAI1_TXFS__AONMIX_TOP_MQS1_LEFT               0x31e
+			IMX95_PAD_SAI1_RXD0__AONMIX_TOP_MQS1_RIGHT              0x31e
+		>;
+	};
+
 	pinctrl_pcal6524: pcal6524grp {
 		fsl,pins = <
 			IMX95_PAD_GPIO_IO34__GPIO5_IO_BIT14			0x31e
diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
index 55e2da094c88..0c55861d673c 100644
--- a/arch/arm64/boot/dts/freescale/imx95.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
@@ -391,6 +391,11 @@ scmi_misc: protocol@84 {
 		};
 	};
 
+	mqs1: mqs-1 {
+		compatible = "fsl,imx95-aonmix-mqs";
+		status = "disabled";
+	};
+
 	pmu {
 		compatible = "arm,cortex-a55-pmu";
 		interrupts = <GIC_PPI 7 (GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_LEVEL_HIGH)>;
-- 
2.43.0

