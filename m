Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FF7B26039F;
	Tue, 11 Mar 2025 16:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741710868; cv=none; b=nZ+jk1feujE1Jjep88FWpD0GbK2TQxf77Acb8vNvAOWTsgqdffp7jmrs4D+adlAzqEpNF0MtIZTGGTtd48OEKcwc8t20AZnE85tqbRk5oCmNTjwZQjBoc4Lg1Ux9wMr7UaBUxaS1XhJBgHDlaJXVk3O3NV0y9c3T3Lz/ChKqCy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741710868; c=relaxed/simple;
	bh=RT2VY9JqMuEddn2VQTKWzBs4dZez2Gw5N7kDC4CqOVo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bzEZRSZHJgwIr5m/z/pvyQjEobFrBGdPIDs/dwtgrw3AzxOZiExgZ8h+Zd3nsRlYbOS4WzifqkUWNu3GbLTthTmFJB3psHbK//QkIDgSS6QdHXskAcr15yCEWuHi8UDUgiUGhP3ysZ7tZiXKmZZmt5bIMuD7dgY1THSzkt3dIPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yqg5IR1n; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yqg5IR1n"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43cf848528aso21362285e9.2;
        Tue, 11 Mar 2025 09:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741710864; x=1742315664; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WmIEpE/8tfCzc9/UJAcbQGjEHM9lYmWTxU+CF4VeXxA=;
        b=Yqg5IR1nqNk5gsWu1rkvOnCHOM6fyvkkv7JtkwcRaI0X2aSGy2qhqMGMJNTKvhymmY
         2RViJuq/U6lzmSEYCNB+moCxTMO7s+NyJTUJhe8caNWdkMiurr8SQxQsLSln1DfDcrDj
         SkoBnmh2ZjvfDkGI9eRcwAKqiFD25XRb/yDEaDF4PUOVPi5Obp/IRSIs+nh4am+g7MOt
         RIdfrDLtPTJwne2zrJCrXYbYnMEerildv+MOv3DgCcbRsu58H7sSdW9/9t23zeP20r6T
         stf4d32nnqA5kMf/6WDgLaaGRRukyJHVWnHorNmca9FtYw+5HWIF6mFaDQg6jmybcfbZ
         6bTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741710864; x=1742315664;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WmIEpE/8tfCzc9/UJAcbQGjEHM9lYmWTxU+CF4VeXxA=;
        b=eH4VNPqHu99QbjrdhjY9ecqnGJ/A9m8L9IcOzLLzAMGDRo7gJzck2m8U1HPLn4sv1p
         fzjZHV+eeCngD3z6C6GfN5h13luukbXEAVOy5kcFZTlNY9ktngA5SZVbsxWt3BJHN+zT
         PxBUvxqJJWUyjiqyj9t+5cv2sNtS2ZDog/7LWQtvHVRyHP8u1B9H2hMF8Da75qHN2kdQ
         q6PbknGKJ/0dLIPwtheuAm5aPhg6hkP5eGq5FCkkIl5M1C9OvJ8g7kntziizYgq0qypa
         D5/7nqjus0lR1D98fxqGE4yNhvzBkBj3DUKmZcOyJHa75jrCvV8Go9eYV3zDG77X9upM
         OoMA==
X-Forwarded-Encrypted: i=1; AJvYcCU/YLhpHbgFO9ebXHmIdVIBVC40TmyhR46ejxTY533mUMVw/DQ1/IRQh4ncHbMH0RMrxlegea7OqpGf@vger.kernel.org, AJvYcCXIGbPA5zalL0xAwhLS55Ap0niGc1GUWFI3rqkICZ4/uOhrf5ryvIvAL8on307QXgIpgWUNc3g3hMmNREI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7OFaRYIaWMiPih6VdK9cZ6upR/ok5wClJ07ruFtvKUQQ00sVY
	7HcgylrkjiVvSybbIgxeCt7pP5LOUoNHoD59FCKOIUyNUZw27eNb
X-Gm-Gg: ASbGnct7VqbbVEVE9rOKvYdaTvMZ/8MQwDevHlRPhNZ2Agu0YM2amlpbVpUD4lLv1la
	gWVknFLeq+jAsicosByvzdKksSJHxJsKDS0feGSLyNBENtJe55XtBMVCa3ywlc+sTtd3ux7epbu
	X7+BVip9W5u5sWQa/UBt5KpHkeYliI4fz7O2ZyLc3OCZwQKyEmPiRdMoIAKbydj3gjfMBZbvD90
	SZrqvBo5bhnAWM/PGkvhJMtzoGUEYt8e9IMpX84EmK0AyXX2CrPUfkNTo5j1R6FRo7yrK97cZ4N
	Zd4Xyc6CCry/4kGbNhnnvspdFwFz4LM0JiGqw+hhxcQ0QV/5VjAi33NPdMssMtKeEgfpgoRAgru
	ESi+5/iU=
X-Google-Smtp-Source: AGHT+IFEWyfiuJdnyqtyoZYKg9bklwY80ObfuMi86YATpJPQGXZVWeSfXdJIo6hDrYC4S2OTrqZGsg==
X-Received: by 2002:a05:600c:198e:b0:43b:ce08:c382 with SMTP id 5b1f17b1804b1-43d01be6dfbmr66002135e9.16.1741710864569;
        Tue, 11 Mar 2025 09:34:24 -0700 (PDT)
Received: from playground.localdomain ([82.79.237.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d07fd046esm13398935e9.19.2025.03.11.09.34.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Mar 2025 09:34:24 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Frank Li <Frank.li@nxp.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Iuliana Prodan <iuliana.prodan@nxp.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 3/3] arm64: dts: imx: add imx95 dts for sof
Date: Tue, 11 Mar 2025 12:32:55 -0400
Message-Id: <20250311163255.2664-4-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250311163255.2664-1-laurentiumihalcea111@gmail.com>
References: <20250311163255.2664-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Add imx95 DTS for SOF usage.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
Reviewed-by: Iuliana Prodan <iuliana.prodan@nxp.com>
---
 arch/arm64/boot/dts/freescale/Makefile        |  1 +
 .../dts/freescale/imx95-19x19-evk-sof.dts     | 84 +++++++++++++++++++
 2 files changed, 85 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-19x19-evk-sof.dts

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index be6ef4c56fbf..fa19250b6676 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -299,6 +299,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx93-tqma9352-mba93xxca.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-tqma9352-mba93xxla.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-var-som-symphony.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk-sof.dtb
 
 imx8mm-kontron-dl-dtbs			:= imx8mm-kontron-bl.dtb imx8mm-kontron-dl.dtbo
 
diff --git a/arch/arm64/boot/dts/freescale/imx95-19x19-evk-sof.dts b/arch/arm64/boot/dts/freescale/imx95-19x19-evk-sof.dts
new file mode 100644
index 000000000000..808a9fe3ebb2
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx95-19x19-evk-sof.dts
@@ -0,0 +1,84 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2025 NXP
+ */
+
+/dts-v1/;
+
+#include "imx95-19x19-evk.dts"
+
+/ {
+	sof_cpu: cm7-cpu@80000000 {
+		compatible = "fsl,imx95-cm7-sof";
+		reg = <0x0 0x80000000 0x0 0x6100000>;
+		reg-names = "sram";
+		memory-region = <&adma_res>;
+		memory-region-names = "dma";
+		mboxes = <&mu7 2 0>, <&mu7 2 1>, <&mu7 3 0>, <&mu7 3 1>;
+		mbox-names = "txdb0", "txdb1", "rxdb0", "rxdb1";
+
+		sai3_cpu: port {
+			sai3_cpu_ep: endpoint {
+				remote-endpoint = <&wm8962_ep>;
+			};
+		};
+	};
+
+	reserved-memory {
+		adma_res: memory@86100000 {
+			compatible = "shared-dma-pool";
+			reg = <0x0 0x86100000 0x0 0x100000>;
+			no-map;
+		};
+	};
+
+	sof-sound {
+		compatible = "audio-graph-card2";
+		links = <&sai3_cpu>;
+		label = "audio";
+		hp-det-gpios = <&gpio2 11 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_hp>;
+		widgets = "Headphone", "Headphones",
+			  "Microphone", "Headset Mic";
+		routing = "Headphones", "HPOUTL",
+			  "Headphones", "HPOUTR",
+			  "Headset Mic", "MICBIAS",
+			  "IN3R", "Headset Mic",
+			  "IN1R", "Headset Mic";
+	};
+
+	sound-wm8962 {
+		status = "disabled";
+	};
+
+};
+
+&edma2 {
+	/* channels 30 and 31 reserved for FW usage */
+	dma-channel-mask = <0xc0000000>, <0x0>;
+};
+
+&sai3 {
+	status = "disabled";
+};
+
+&wm8962 {
+	assigned-clocks = <&scmi_clk IMX95_CLK_AUDIOPLL1_VCO>,
+			  <&scmi_clk IMX95_CLK_AUDIOPLL2_VCO>,
+			  <&scmi_clk IMX95_CLK_AUDIOPLL1>,
+			  <&scmi_clk IMX95_CLK_AUDIOPLL2>,
+			  <&scmi_clk IMX95_CLK_SAI3>;
+	assigned-clock-parents = <0>, <0>, <0>, <0>, <&scmi_clk IMX95_CLK_AUDIOPLL1>;
+	assigned-clock-rates = <3932160000>, <3612672000>,
+			       <393216000>, <361267200>,
+			       <12288000>;
+
+	port {
+		wm8962_ep: endpoint {
+			bitclock-master;
+			frame-master;
+			remote-endpoint = <&sai3_cpu_ep>;
+		};
+	};
+};
-- 
2.34.1

