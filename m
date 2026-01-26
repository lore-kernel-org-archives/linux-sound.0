Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FC5D2BEC23
	for <linux-sound@vger.kernel.org>; Mon, 26 Jan 2026 14:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769439397; cv=none; b=QlRr8degejUl0NSVwsoovaTAYdkxMmhydIuVoUV9AYC/CV+OagpjPaJ/gmPvEVR/RwbhJw5OkqSUCsvwD1WNty9BNVcWGYr5oFtvcOrWOpQs12/anmEbNyyODapnqCSCXgwm4JXvpbgKzsblB3tlzu6XaACoAKeAprPMDfcPrsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769439397; c=relaxed/simple;
	bh=FXRkYQxW/Oh77PruZvMs8Ux+ule7NHMljC/BkJecFvU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E/KBMEdKd1nI2wPGtQIp1ADh9xzxvHrLxcR/7ojdeUx6pmn4LBYBzOYGupymbVMGUnsbjojrOdErkM1jme2P9frkjGtfkPgIsHcB+RK7TJeksnTaB5cyblcfZ5Vxzjzpc1q2MIkab0e5VvU8Z74SS+nTHcKUpFew4wCTI/3M8dA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eVuRbGH8; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eVuRbGH8"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4801c731d0aso36514725e9.1
        for <linux-sound@vger.kernel.org>; Mon, 26 Jan 2026 06:56:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769439394; x=1770044194; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/RQKD2gj0rQ1+sFwLWUcjWNz3iCRkkjiPuUiecwAUgg=;
        b=eVuRbGH8dy0fV3SKjMM9X6maJGwZRpdu+etwYDA2rsBPTPqympwlPFHDvkWI7NnaWe
         JcBnBYjebei6OLULyGh0CMiFmFt7azb2AB5uU40XYdHcqq0ook/QROcztWxZXSCfvg+3
         h4E0TBqTk+qM65Q6+ZS2hobc6scozgac6LWcvTRfncqFgs/amAqNvfNLJOEGjwr2XV3g
         OnJS/pFeY135tzcfCfNw0cy3K3tdGq05g6YuUWfeIfn6dG0nk8CX/jnAvR1cOhxkfokV
         Eox9S95sdjxNNUcXSizMlkq9Hmjdww4Lu1GrGIlcqedfSwvaOhFQ98ZLx+4U/B+DpYzF
         19Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769439394; x=1770044194;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/RQKD2gj0rQ1+sFwLWUcjWNz3iCRkkjiPuUiecwAUgg=;
        b=BJKWFYRYvYWNngxwzqAxa9bS8xWwSS6Tf1q/AeE7i+6wxC119hfGxfzyMPrGLq/hvV
         zHK4ZDKFNUEP/psYJBY0272vHIv++IBDhtMGg7p0MpsG2ZTZSRVMQxrljDcC6p4P8Yi3
         6q4Kvsz3tSGioQHYuKa+/pEsFUMkJgyONWdHmCmDDMRh+4W1jQl7aej9uwPZH3NoVmu6
         XHN5nYphU/dyVY2fiig4ra4fHTSzGC0llr5BKC7DgP0nJhvKqkQXVQF4B/BvRCVGxCvN
         qpAowDzlclu9j9gA5FDIdhMWtCsJbxKf0KZLWGZOHKj5luZvJThwoVVf63UXd1f7so3n
         py7A==
X-Gm-Message-State: AOJu0YwUfrQZoh/UevyxLpkxnMY043GMz5iDTjLvXcyVzsSJk6rn42yz
	qg32UlJDI14AowaecpEFQb4B6qxuH/fGh19y6K4Z89uEroGo6sCoFQR4
X-Gm-Gg: AZuq6aJq+Ro/ewP2kJo+NZCfrm8Dry5QzE+AU0/3fQcWMctcuy9HPtBx+NeNart3frd
	+XDmA9s15zvFFe+5zSBcO127fEd5K2+ROlDVfG0GzDuOf+Bdr0hLK6PO2ZnaMa8Ty2ZdEm0IqD+
	fAXnY74OAfT4TDZPnwTCJ93NXwcM0kXq9CvV7HBPOKY0nKBmBAsLAK10cNVrcaCOA7zsiO51OO+
	XZxMSWfZJ6JziKQKDppv8KN+ocg7dbu5uDGIXn6CWQWmQAf3YcwDBWacmLvfnZ/5q7l5iYoH80D
	i4u58vCf6AYQ0xztMe9ib5UyqEOuwTFE1P9Ur95b2URIyjt8JsLNygpOV7NokB9hTuDRzszJ6uG
	Va215NmdmesYgxqgVkdYFJ4EFUrUli+Ep1ATYsIP4+Dy7PzwpEIbEdgC8Aswca5EqK1EJTRD7R6
	9ga69js/72jJLf6udwwmUuBSGJcv9UkqthhawfYQ==
X-Received: by 2002:a05:600c:5494:b0:47e:e78a:c833 with SMTP id 5b1f17b1804b1-4805d064297mr74645505e9.32.1769439393871;
        Mon, 26 Jan 2026 06:56:33 -0800 (PST)
Received: from SMW024614.wbi.nxp.com ([128.77.115.158])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4804d8c0aebsm278448735e9.15.2026.01.26.06.56.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 06:56:33 -0800 (PST)
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
	Chancel Liu <chancel.liu@nxp.com>,
	Frank Li <Frank.Li@nxp.com>
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH v2 2/2] arm64: dts: imx95-15x15-frdm: support AONMIX MQS
Date: Mon, 26 Jan 2026 06:55:37 -0800
Message-ID: <20260126145537.2301-3-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260126145537.2301-1-laurentiumihalcea111@gmail.com>
References: <20260126145537.2301-1-laurentiumihalcea111@gmail.com>
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
index ca1c4966c867..0f43e3be7058 100644
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
+			IMX95_PAD_SAI1_TXFS__AONMIX_TOP_MQS1_LEFT		0x31e
+			IMX95_PAD_SAI1_RXD0__AONMIX_TOP_MQS1_RIGHT		0x31e
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

