Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB9132FCBFC
	for <linux-sound@vger.kernel.org>; Thu, 15 Jan 2026 19:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768504706; cv=none; b=A3fA31vPafKUJjxMivpPIPyR7y2PJARBqLlHTHanU/G9AnYyKzna597SbZOB5S+cjqpLx7ajsXBhpb+v3j8Yf2zMWltRK2JA3DtQRSwq34E1BToXbM4NZOv3xXJLce7cNjreNXbHn29d//47cU/KXAJ6Pnu7AaBbkWTnZA16MAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768504706; c=relaxed/simple;
	bh=ZvpnRa7g8hCkE7r1q64LPBBaiWff0x2lLnMd+0VKnb0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YsApEjiBgOHe6fvBGa8QD9sOMMD4xaAEfipClRsOJfEkP0GXxk+HAwUSR7CY+9UaAej3dHCqRxspSjXIAelQDys2LNetGF3V38aIIPXxD4/ZbAR7SS+YUtlrzJS09DDJ+Yc5BE6Wa9UP9HH09EznJK4Q7d6f5QWIwhg01Ci123Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZwCJdi7A; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZwCJdi7A"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-47ee76e8656so15534585e9.0
        for <linux-sound@vger.kernel.org>; Thu, 15 Jan 2026 11:18:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768504703; x=1769109503; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9bZybh6ajNmTP3emcxjHSZEZGR4b5MsX3LqH44SKh2E=;
        b=ZwCJdi7ApXOmT/0pOHuGsR4hf9tODJBPxzqRxrs0tSBoCawEjWPllrBLoGwVOHGe3Y
         AUw+UQISBOKR2PxDneoe10CjI0XkduyJlAttFlNXdsB1Hv5t+EIhZ7+UhWibRJ7GG1gW
         Yn2xf6Dxri4DEgwNadFUxWKVuoj5nkeNIpIzXEVbQ9MSVOqxocFO6av4AdD9F9Qmi2RI
         DC/spXs/ZlKhC6ST1PQe+oxiA3TJ24CtxkZXXHKdnfp0iObuPgrLmlUt5yS37iYltqvA
         uWimG4KKZXmOE+C3WOKI1fIOD1ukow/whWbQMwibR1z3YknEoGJKCjYl9MkEOm8lL3aF
         t/KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768504703; x=1769109503;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9bZybh6ajNmTP3emcxjHSZEZGR4b5MsX3LqH44SKh2E=;
        b=IZObimJUjCq3jDlNoXuLAoifJvcq+1nc1hvbC1e3JafADGdc5aHQhcLD8QV/0Xz4ee
         v9U1TRP9tJLXqrzIOalQFD3BKjm1O8F8dmDOsAgadg7hrt9CBohCXQ0LAHTYR6aCpyJz
         jba2RmIwWB81V951VzVUuGWP0J0pdABqVVaq2UsxfWYty7D78hI4e8rqunOyIglx+2nT
         /aZ7lwBVrcxOoABEwkH3NCQgNuYD65o2/+a9dLN+btgnIqmwqhhIU7zvZDtRFTKEx8kw
         NIQYAMCW0yXbTNd88mk2a+CaC2w1Q1sxP69YFJNY2j8yRpv34c3R+r1F/537tesM2q8R
         7xMA==
X-Gm-Message-State: AOJu0Yw6M+sDdhyh87jwMHSOmieqDsCIkoDPE67QU32XRnVsL1huBU74
	fhP/ZR6E5kPoSRMc4AxvB77r1CCddfZ+fbnR7qpYcA/DkGdO4E+EQcR7
X-Gm-Gg: AY/fxX67Oysokx/X4Zn6BaRW52/EPZc/WoacJPG4IryoI7E5yiDHR/NmwZI8GSjXD0a
	yfElLNoLkEmrSzA6tWhVzIXTqBhUNtXTs2Xl0zCHgCiSdRw7v+N9Zo78+jPk7ITp7WaA6D+8uLb
	OOtrVSnqEWyisnYG7lh5MohwGQdqQPCMyXwoQM6JAoVEfezBr5Oo5C60NngOAuuaVieX0rtF+vZ
	lrmR6pYfyCt7Am+SMOveQT6I2LSrMMes+lvgydNTgYWdqE1cZgV3iO+eZ2yf4H1CXf/fFEWhvnP
	YOIXF7D0lB2CjdsC2RXW84fdRhq8161XktpT+qhftfkshMlePN6QQts8z+3qpf3tEMbUrQNesdT
	0jmwzu9BYGtec0mYRnHkgwQCMfg9gsrWn9w2Om+rchO3dm43RrazPp7dQG7KvaKzjHx+EoEWpJS
	m4tqEO5FTWYm4HjXsgd3fqx0FBNcLI0HaSipNbM3Uxs20P
X-Received: by 2002:a05:6000:2209:b0:430:f7dc:7e96 with SMTP id ffacd0b85a97d-43569bc59b6mr523652f8f.48.1768504703038;
        Thu, 15 Jan 2026 11:18:23 -0800 (PST)
Received: from [127.0.1.1] (bba-94-59-215-181.alshamil.net.ae. [94.59.215.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43569921dedsm692734f8f.9.2026.01.15.11.18.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 11:18:22 -0800 (PST)
From: "Anton D. Stavinskii" <stavinsky@gmail.com>
Date: Thu, 15 Jan 2026 23:17:44 +0400
Subject: [PATCH 7/8] riscv: dts: sophgo: dts nodes for i2s tdm modules
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260115-cv1800b-i2s-driver-v1-7-e8b22b8578ab@gmail.com>
References: <20260115-cv1800b-i2s-driver-v1-0-e8b22b8578ab@gmail.com>
In-Reply-To: <20260115-cv1800b-i2s-driver-v1-0-e8b22b8578ab@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
 Inochi Amaoto <inochiama@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, 
 "Anton D. Stavinskii" <stavinsky@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768504677; l=4041;
 i=stavinsky@gmail.com; s=20260115; h=from:subject:message-id;
 bh=ZvpnRa7g8hCkE7r1q64LPBBaiWff0x2lLnMd+0VKnb0=;
 b=vwb7UYqSlXo3rPP9yGKTfWtMY3ZhNyyOZjfBpq/qKetxn106Ow7lZhWEbkNRzwEkQv1jaiQWa
 4bJ9F94rEA5BNdFZq1EVeJ1mjB3FJd8ZDKSoSUN8dkyyucDYqKQeG9n
X-Developer-Key: i=stavinsky@gmail.com; a=ed25519;
 pk=2WxGZ1zd1vQwSPFCSks6zrADqUDBUdtq39lElk4ZE7Q=

New dts nodes for TDMs and readable DMA names

Signed-off-by: Anton D. Stavinskii <stavinsky@gmail.com>
---
 arch/riscv/boot/dts/sophgo/cv180x-dmamux.h | 57 ++++++++++++++++++++++++++++++
 arch/riscv/boot/dts/sophgo/cv180x.dtsi     | 49 +++++++++++++++++++++++++
 2 files changed, 106 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/cv180x-dmamux.h b/arch/riscv/boot/dts/sophgo/cv180x-dmamux.h
new file mode 100644
index 000000000000..6314bf6e9dc8
--- /dev/null
+++ b/arch/riscv/boot/dts/sophgo/cv180x-dmamux.h
@@ -0,0 +1,57 @@
+/* SPDX-License-Identifier: (GPL-2.0 OR MIT) */
+/*
+ * Copyright (C) 2025 Inochi Amaoto <inochiama@gmail.com>
+ */
+
+#ifndef _SOPHGO_CV18XX_DMAMUX
+#define _SOPHGO_CV18XX_DMAMUX
+
+#define DMA_I2S0_RX		0
+#define DMA_I2S0_TX		1
+#define DMA_I2S1_RX		2
+#define DMA_I2S1_TX		3
+#define DMA_I2S2_RX		4
+#define DMA_I2S2_TX		5
+#define DMA_I2S3_RX		6
+#define DMA_I2S3_TX		7
+#define DMA_UART0_RX	8
+#define DMA_UART0_TX	9
+#define DMA_UART1_RX	10
+#define DMA_UART1_TX	11
+#define DMA_UART2_RX	12
+#define DMA_UART2_TX	13
+#define DMA_UART3_RX	14
+#define DMA_UART3_TX	15
+#define DMA_SPI0_RX		16
+#define DMA_SPI0_TX		17
+#define DMA_SPI1_RX		18
+#define DMA_SPI1_TX		19
+#define DMA_SPI2_RX		20
+#define DMA_SPI2_TX		21
+#define DMA_SPI3_RX		22
+#define DMA_SPI3_TX		23
+#define DMA_I2C0_RX		24
+#define DMA_I2C0_TX		25
+#define DMA_I2C1_RX		26
+#define DMA_I2C1_TX		27
+#define DMA_I2C2_RX		28
+#define DMA_I2C2_TX		29
+#define DMA_I2C3_RX		30
+#define DMA_I2C3_TX		31
+#define DMA_I2C4_RX		32
+#define DMA_I2C4_TX		33
+#define DMA_TDM0_RX		34
+#define DMA_TDM0_TX		35
+#define DMA_TDM1_RX		36
+#define DMA_AUDSRC		37
+#define DMA_SPI_NAND	38
+#define DMA_SPI_NOR		39
+#define DMA_UART4_RX	40
+#define DMA_UART4_TX	41
+#define DMA_SPI_NOR1	42
+
+#define DMA_CPU_A53		0
+#define DMA_CPU_C906_0	1
+#define DMA_CPU_C906_1	2
+
+#endif // _SOPHGO_CV18XX_DMAMUX
diff --git a/arch/riscv/boot/dts/sophgo/cv180x.dtsi b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
index 06b0ce5a2db7..9dd93e028ba9 100644
--- a/arch/riscv/boot/dts/sophgo/cv180x.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
@@ -8,6 +8,7 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 #include "cv18xx-reset.h"
+#include "cv180x-dmamux.h"
 
 / {
 	#address-cells = <1>;
@@ -448,6 +449,54 @@ usb: usb@4340000 {
 			status = "disabled";
 		};
 
+		i2s0: i2s@4100000 {
+			compatible = "sophgo,cv1800b-i2s";
+			reg = <0x04100000 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&clk CLK_APB_I2S0>, <&clk CLK_SDMA_AUD0>;
+			clock-names = "i2s", "mclk";
+			dmas = <&dmamux DMA_I2S0_RX 1>, <&dmamux DMA_I2S0_TX 1>;
+			dma-names = "rx", "tx";
+			status = "disabled";
+		};
+
+		i2s1: i2s@4110000 {
+			compatible = "sophgo,cv1800b-i2s";
+			reg = <0x04110000 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&clk CLK_APB_I2S1>, <&clk CLK_SDMA_AUD1>;
+			clock-names = "i2s", "mclk";
+			dmas = <&dmamux DMA_I2S1_RX 1>, <&dmamux DMA_I2S1_TX 1>;
+			dma-names = "rx", "tx";
+			status = "disabled";
+		};
+
+		i2s2: i2s@4120000 {
+			compatible = "sophgo,cv1800b-i2s";
+			reg = <0x04120000 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&clk CLK_APB_I2S2>, <&clk CLK_SDMA_AUD2>;
+			clock-names = "i2s", "mclk";
+			dmas = <&dmamux DMA_I2S2_RX 1>, <&dmamux DMA_I2S2_TX 1>;
+			dma-names = "rx", "tx";
+			status = "disabled";
+		};
+
+		i2s3: i2s@4130000 {
+			compatible = "sophgo,cv1800b-i2s";
+			reg = <0x04130000 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&clk CLK_APB_I2S3>, <&clk CLK_SDMA_AUD3>;
+			clock-names = "i2s", "mclk";
+			dmas = <&dmamux DMA_I2S3_RX 1>, <&dmamux DMA_I2S3_TX 1>;
+			dma-names = "rx", "tx";
+			status = "disabled";
+		};
+
 		rtc@5025000 {
 			compatible = "sophgo,cv1800b-rtc", "syscon";
 			reg = <0x5025000 0x2000>;

-- 
2.43.0

