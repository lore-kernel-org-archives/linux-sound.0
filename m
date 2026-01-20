Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 343B2477E48
	for <linux-sound@vger.kernel.org>; Tue, 20 Jan 2026 19:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768935993; cv=none; b=jW+jz2w/Z4ol0BIVGj/dsjM7Yl9MLLIBNhLLpi+nvFWzF+LYKb/5Qg/SuKQv0XGxqbgeEcSqMzRpQdj9wO8jeSjArjn8EKiYor3UMEn1aBiQOAFFEhMrxyWHOmL59jd/3RB+QSU6uw57FpkU1A0Fo+uulYIPCp6OswlNj3rIL/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768935993; c=relaxed/simple;
	bh=X+s12PRGw5dEE4UNo2e5A0PjiGovDts5oKNtEN72P90=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bjY6dyDkXqO+IjDQntmEKasEr8UaervFm3m+2DF/wjPHnS2eZP1P7XDXY8MpqiNGRK8rWmvWXo+4RLvvFC84xTQsP+j1UU+z7SGzPTJ34DtDi744AO80u3yzF3E24Rr1pGCfvX2Anxh0JdVaOm36xNVSoJufhQtwIvO9bggqwQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J/6EJjiv; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J/6EJjiv"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4801d24d91bso40738955e9.2
        for <linux-sound@vger.kernel.org>; Tue, 20 Jan 2026 11:06:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768935989; x=1769540789; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XNGQeFUv68F6qppT5//wf2zYpim+0plexrvmi4qsXjc=;
        b=J/6EJjivU9oRP2J9NUKO8YbG2JuA+13wmy80HcHmIv1qhjQ+QhcL5HXCuSTavoHdvh
         8TvlkA1IDKs71tmNfg9a9EkFiFtorq3/tDprYVEwkDGH8fl9QrnTKS+1RnAyvWcOE7Xf
         9L1kfbVnEjQ+PKT6oTEhP/ZI0JPommQsgmlfsJOYC43sLpZE4F0LIIPrODBBQdHefdby
         lWCBllLV4CaCxE8Om2nh0YXOS2TtbRsNBFmb4NcXgblroy+X3atU7biQbxNQGNaiCQZ3
         SLq2JH7i3Zmg+gtGtjFkK/eg205juKqKKmriZZ0+Z2v+pVWdBAHARUCOmNjgvhgmXR+g
         OAlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768935989; x=1769540789;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XNGQeFUv68F6qppT5//wf2zYpim+0plexrvmi4qsXjc=;
        b=Bi4Cv/skOb2TVHCWZBeNhwn5y8ArRXKTOwj6sWfo2vmj6sOnzSOUYJHOumUd6tFetA
         n+oyZdcexxl8gsD7rOIo5Q76IcksoEiCAnoj2295J960bj03sNxT4mruH5ZUdmupBF9T
         ahf7tZ2/Hd8/2SVV6YggMKDOWzbSz2UU6TUaEgdoj0D2hX3og650VoAwEvv9CTWZfj55
         TvWQxO/h3iaU37DvNffwsgJOwc+wOuxpRlgvm0iCU0LIOLORVNiMvIobxAHI7aTGlrAv
         SPMrPbjP1TPkgKr/FjpBni8A/jZZrG48rOFmdX9yHfdU7e4X0VIIWz19fPqrjFYxRagW
         U42w==
X-Gm-Message-State: AOJu0Yx0DLXa2ICGRFBwvy7yj1DES0OxjJy7+RClDglpfzLBp9pID2tc
	KIGYusZBKHHY26+tSIFw5AYd/Il8qFe5yIxNjOvrTEJX5FEAerQ5ixBc
X-Gm-Gg: AY/fxX69V+G0HUEThwrb+DUxAiXUAOveSnK85fFXDD7sS3oB8p8TaL2oI8oUmzkT9QN
	Dmr+Kv6pQ9qQjxGlY1FFrgeOQdRrppxh273BU80vydCJSCraSP7n5If+lEVAFXM8aJpAlAZKQ1A
	O83pJJ505P6E5QBviqzmFu8ZygXrHVD2+izIml16hSeuqN8XhnvXb8yYSWlILpPERDzan3hxms3
	Zd8cM4iWXm4Y0/so7KTUGF0HnGHbNMBZ3/QSoxCwbuaZ1ZZAVjD5Y04kSycQKiZkVY7vrEi2oMg
	GwnrKZdYq27EaafIOFqGGs6jIYW9xyeS1zTHPeEM4Crd76dZmovNyThU55RPBnQ6JySFLiJHlTG
	c8k1wXcYEfd+L6VWpVttKVJ+qbkrSrnYCLgX/w7JT7+QoXaqQyG1E/7b1kfKz1r820SkthgIhMC
	exlR2zE6oNyedkNfRf0a8T/sr+7ZyOUSbZDJBbMV3Ocjjn
X-Received: by 2002:a05:600c:1c13:b0:480:1dc6:269c with SMTP id 5b1f17b1804b1-4803e8046a7mr37670375e9.37.1768935989139;
        Tue, 20 Jan 2026 11:06:29 -0800 (PST)
Received: from [127.0.1.1] (bba-94-59-215-181.alshamil.net.ae. [94.59.215.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4804244c6cesm2005735e9.0.2026.01.20.11.06.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 11:06:28 -0800 (PST)
From: "Anton D. Stavinskii" <stavinsky@gmail.com>
Date: Tue, 20 Jan 2026 23:06:08 +0400
Subject: [PATCH v4 6/6] riscv: dts: sophgo: dts nodes for i2s tdm modules
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260120-cv1800b-i2s-driver-v4-6-6ef787dc6426@gmail.com>
References: <20260120-cv1800b-i2s-driver-v4-0-6ef787dc6426@gmail.com>
In-Reply-To: <20260120-cv1800b-i2s-driver-v4-0-6ef787dc6426@gmail.com>
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
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768935966; l=4275;
 i=stavinsky@gmail.com; s=20260115; h=from:subject:message-id;
 bh=X+s12PRGw5dEE4UNo2e5A0PjiGovDts5oKNtEN72P90=;
 b=Cwq4vdM8lAMNexXf49piuwk9NPj4tlC29MXQjZSSksluPp5PAggrMazkMg2b0Y8QaQtdqFUDc
 1DAE12pFXwmCl8OKZPgqfeXsmPUQBgO22kRGdD2kMXHTTkzfheVfobG
X-Developer-Key: i=stavinsky@gmail.com; a=ed25519;
 pk=2WxGZ1zd1vQwSPFCSks6zrADqUDBUdtq39lElk4ZE7Q=

Introduced I2S nodes and internal dac and adc nodes as well
The new header file provided in order to make DMA channel names
more readable.

Signed-off-by: Anton D. Stavinskii <stavinsky@gmail.com>
---
 arch/riscv/boot/dts/sophgo/cv180x-dmamux.h | 57 ++++++++++++++++++++++++++++++
 arch/riscv/boot/dts/sophgo/cv180x.dtsi     | 55 ++++++++++++++++++++++++++++
 2 files changed, 112 insertions(+)

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
index 06b0ce5a2db7..ebe5e8113939 100644
--- a/arch/riscv/boot/dts/sophgo/cv180x.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
@@ -8,6 +8,7 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 #include "cv18xx-reset.h"
+#include "cv180x-dmamux.h"
 
 / {
 	#address-cells = <1>;
@@ -448,6 +449,60 @@ usb: usb@4340000 {
 			status = "disabled";
 		};
 
+		i2s0: i2s@4100000 {
+			compatible = "sophgo,cv1800b-i2s";
+			reg = <0x04100000 0x1000>;
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
+			clocks = <&clk CLK_APB_I2S3>, <&clk CLK_SDMA_AUD3>;
+			clock-names = "i2s", "mclk";
+			dmas = <&dmamux DMA_I2S3_RX 1>, <&dmamux DMA_I2S3_TX 1>;
+			dma-names = "rx", "tx";
+			status = "disabled";
+		};
+
+		int_adc: codec@300a100 {
+			compatible = "sophgo,cv1800b-sound-adc";
+			#sound-dai-cells = <0>;
+			reg = <0x300a100 0x100>;
+			status = "disabled";
+		};
+
+		int_dac: codec@300a000 {
+			compatible = "sophgo,cv1800b-sound-dac";
+			#sound-dai-cells = <0>;
+			reg = <0x300a000 0x100>;
+			status = "disabled";
+		};
+
 		rtc@5025000 {
 			compatible = "sophgo,cv1800b-rtc", "syscon";
 			reg = <0x5025000 0x2000>;

-- 
2.43.0

