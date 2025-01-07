Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0091A1F03F5
	for <linux-sound@vger.kernel.org>; Tue,  7 Jan 2025 12:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736254749; cv=none; b=YewpMw0oF/+NkzrEkSN3bhmkqB6W/Mcq5H9scEV4bPgsQ00g2SZRDAgmusFIibCZuCNv49IS0LsZOGoxTp2KdVHbq2vTVrv+bn3zmqsTJShAB2/lJ3e6VKdrcLCLd0YenaG1OmoJN8+XWfE57VOWhaKb3UHFPlh0Ai0VYPXWSXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736254749; c=relaxed/simple;
	bh=beNjrkx0ARKE/JZov8XeDoM0HVIvAlq6b4sGglUb1n4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QzCRM1ZLKZhEvonNZdL/evlriA2WD6t05ZZEXWVFimNlFhVvWw8Rv+WJgebD6Zy7Ae4X4W7RjL7e/+FpTmPJluIq8DWnnaZkZMfHG//Ybhju7hwNPyzqmsYA0CdOmgOuhah3AyzhoZ3lRQfh0nXNq5iaHUHMhuDhuVSd/7x73rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TrO781Dg; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TrO781Dg"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-385e44a1a2dso1789818f8f.3
        for <linux-sound@vger.kernel.org>; Tue, 07 Jan 2025 04:59:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736254744; x=1736859544; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xCxsFvviMvVH8lxnn1/Z1ousFt8F3cuC/oCQYEw7eDY=;
        b=TrO781DgV98ESkwT3Y1SfjRcB1opSM8aaRtSkEED13rnu1Uefh/W5EE2Vt2bByNsqj
         OmSwEZP2hbI92aIq/z2DEaVa3qgy+/uGdkwiY4fhP4WdJt/wjYje0aQnoYaEcrz+6O90
         u+d99plQFnGnse8p7d/uv466fruBOILpEao55gfgT0Mx/AaOEh0yvNTs5e/GCnpZGRyk
         M00IBcmVgm7wGX3b+SF3QtBcKQQmi8FH6khkyJpebRyVcjq4o3UAGJ8UO7zUJb3mPYZO
         Kjl2iNqtqhbJRRhCtEVaDfDGHj9231KXQ/uO85N0XUSNr6EApO8RF7ABDFeGr7lmUYYZ
         xpUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736254744; x=1736859544;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xCxsFvviMvVH8lxnn1/Z1ousFt8F3cuC/oCQYEw7eDY=;
        b=tnnMkKjcjZND9fv+iNVf7T/0kQSlfAmbInbQKMIhHHUHwe7lQkgxpX8kAXvWdvuQIs
         o064CPrwEK7OJPGDzLN95jcVVx+P1XiobNh+SvIt96oau1Kh82/LbAAeyXaVfaj80i1n
         D4jArlHIgoj+QrbMayd+BmT9SkKGBJruFsR2klNoiQYLEiUk7ritj0YF9XfIRWoFSb1d
         CVP2yygazd+Y3M1qAKftVo+87hq8TfSkhCJE4/H8oLwDnhObwI+jy/4xQgY1jG2/0Ki/
         QslcUZLz+FAVQ2XEnDqZUBvlQd6yJAYdEqExJdrn5BuSdTclVCMevY53MV/H8CVYoosS
         r+sw==
X-Forwarded-Encrypted: i=1; AJvYcCXCSQj9PuYYltUXbFMAjNcuIXaJqRio3Djy93cRwlBWW5C/cibSVLQFF2aGbTTLrmJhtAcYL/q8nKTKJg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz107ECKDTY7XcwwQP2RHv5WgI03h0N/QwIdR1kU5sqxFIDY7hN
	OACT1xv/aPHJr3n57Aedl+rh/+KS8EpJpkoF/JijLuB+QEfFwwC7vCTbv1e0YzQ=
X-Gm-Gg: ASbGncujazK0k0aendPLtW4QNk65UOUUnYcpiZVpe32T+ZP/9+u/jOvUN1O0PeNPYMK
	SN43Vs8IefstlmWi6G6pOopb2BTbdbbZNVply6ofzOwJr/KHrdx+r98/8NmkQoBv6sz+5Z/5g6u
	JrdNfpKZkZpo4+m8/l9CYda4wBXhEvi75ZDaUtPw+MZQmLfa5NZE1fKraqD0lpaVX1PzfRB70Zk
	VGzdXuOS25eFg8WVXdRmq5xMVEqwRjVKJZzzX6BxcfCUzMnzeR7/pjs2bkP0ZEDsCV4MW4=
X-Google-Smtp-Source: AGHT+IFQYKizWpNaDvJ6KxX9AG5fXoBmQ5o4USRpGCQKdWdOEUuBBQRqgC4zamXauluRTMoLmsSnZw==
X-Received: by 2002:adf:a448:0:b0:385:fb2c:6038 with SMTP id ffacd0b85a97d-38a223fedc9mr13929024f8f.14.1736254744190;
        Tue, 07 Jan 2025 04:59:04 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c89e261sm51139335f8f.76.2025.01.07.04.59.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 04:59:03 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Lars-Peter Clausen <lars@metafoo.de>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Viorel Suman <viorel.suman@nxp.com>,
	Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
	"Paul J. Murphy" <paul.j.murphy@intel.com>,
	Igor Prusov <ivprusov@salutedevices.com>,
	Andrew Davis <afd@ti.com>,
	Shi Fu <shifu0704@thundersoft.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] ASoC: dt-bindings: Correct indentation and style in DTS example
Date: Tue,  7 Jan 2025 13:58:58 +0100
Message-ID: <20250107125901.227995-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

DTS example in the bindings should be indented with 2- or 4-spaces and
aligned with opening '- |', so correct any differences like 3-spaces or
mixtures 2- and 4-spaces in one binding.  While touching the lines do
other non-functional changes: replace raw number with proper define for
GPIO flag and use generic node name.

No functional changes here, but saves some comments during reviews of
new patches built on existing code.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/sound/adi,ssm2518.yaml           | 20 ++++++-----
 .../bindings/sound/everest,es71x4.yaml        | 10 +++---
 .../bindings/sound/everest,es7241.yaml        | 19 +++++-----
 .../devicetree/bindings/sound/fsl,easrc.yaml  | 32 ++++++++---------
 .../devicetree/bindings/sound/fsl,xcvr.yaml   | 34 +++++++++---------
 .../bindings/sound/intel,keembay-i2s.yaml     | 32 ++++++++---------
 .../bindings/sound/neofidelity,ntp8918.yaml   | 26 +++++++-------
 .../devicetree/bindings/sound/ti,pcm6240.yaml | 32 +++++++++--------
 .../devicetree/bindings/sound/ti,tas2562.yaml | 30 ++++++++--------
 .../devicetree/bindings/sound/ti,tas2770.yaml | 34 +++++++++---------
 .../devicetree/bindings/sound/ti,tas2781.yaml | 36 ++++++++++---------
 .../devicetree/bindings/sound/ti,tas27xx.yaml | 34 +++++++++---------
 .../devicetree/bindings/sound/ti,tas57xx.yaml | 34 +++++++++---------
 13 files changed, 195 insertions(+), 178 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/adi,ssm2518.yaml b/Documentation/devicetree/bindings/sound/adi,ssm2518.yaml
index f3f32540779c..f1beae84cad1 100644
--- a/Documentation/devicetree/bindings/sound/adi,ssm2518.yaml
+++ b/Documentation/devicetree/bindings/sound/adi,ssm2518.yaml
@@ -36,12 +36,14 @@ unevaluatedProperties: false
 
 examples:
   - |
-   i2c {
-     #address-cells = <1>;
-     #size-cells = <0>;
-     codec@34 {
-       compatible = "adi,ssm2518";
-       reg = <0x34>;
-       gpios = <&gpio 5 0>;
-     };
-   };
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        codec@34 {
+            compatible = "adi,ssm2518";
+            reg = <0x34>;
+            gpios = <&gpio 5 GPIO_ACTIVE_HIGH>;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/sound/everest,es71x4.yaml b/Documentation/devicetree/bindings/sound/everest,es71x4.yaml
index fd1b32812228..efe9f3fd3778 100644
--- a/Documentation/devicetree/bindings/sound/everest,es71x4.yaml
+++ b/Documentation/devicetree/bindings/sound/everest,es71x4.yaml
@@ -53,10 +53,10 @@ unevaluatedProperties: false
 
 examples:
   - |
-   codec {
-       compatible = "everest,es7134";
-       #sound-dai-cells = <0>;
-       VDD-supply = <&vdd_supply>;
-   };
+    codec {
+        compatible = "everest,es7134";
+        #sound-dai-cells = <0>;
+        VDD-supply = <&vdd_supply>;
+    };
 
 ...
diff --git a/Documentation/devicetree/bindings/sound/everest,es7241.yaml b/Documentation/devicetree/bindings/sound/everest,es7241.yaml
index f179af758730..e5cfb40f1ef2 100644
--- a/Documentation/devicetree/bindings/sound/everest,es7241.yaml
+++ b/Documentation/devicetree/bindings/sound/everest,es7241.yaml
@@ -54,14 +54,15 @@ unevaluatedProperties: false
 
 examples:
   - |
-   #include <dt-bindings/gpio/gpio.h>
-   codec {
-       compatible = "everest,es7241";
-       #sound-dai-cells = <0>;
-       reset-gpios = <&gpio1 15 GPIO_ACTIVE_HIGH>;
-       VDDP-supply = <&vddp_supply>;
-       VDDA-supply = <&vdda_supply>;
-       VDDD-supply = <&vddd_supply>;
-   };
+    #include <dt-bindings/gpio/gpio.h>
+
+    codec {
+        compatible = "everest,es7241";
+        #sound-dai-cells = <0>;
+        reset-gpios = <&gpio1 15 GPIO_ACTIVE_HIGH>;
+        VDDP-supply = <&vddp_supply>;
+        VDDA-supply = <&vdda_supply>;
+        VDDD-supply = <&vddd_supply>;
+    };
 
 ...
diff --git a/Documentation/devicetree/bindings/sound/fsl,easrc.yaml b/Documentation/devicetree/bindings/sound/fsl,easrc.yaml
index 0782f3f9947f..c454110f4281 100644
--- a/Documentation/devicetree/bindings/sound/fsl,easrc.yaml
+++ b/Documentation/devicetree/bindings/sound/fsl,easrc.yaml
@@ -87,20 +87,20 @@ examples:
     #include <dt-bindings/clock/imx8mn-clock.h>
 
     easrc: easrc@300c0000 {
-           compatible = "fsl,imx8mn-easrc";
-           reg = <0x300c0000 0x10000>;
-           interrupts = <0x0 122 0x4>;
-           clocks = <&clk IMX8MN_CLK_ASRC_ROOT>;
-           clock-names = "mem";
-           dmas = <&sdma2 16 23 0> , <&sdma2 17 23 0>,
-                  <&sdma2 18 23 0> , <&sdma2 19 23 0>,
-                  <&sdma2 20 23 0> , <&sdma2 21 23 0>,
-                  <&sdma2 22 23 0> , <&sdma2 23 23 0>;
-           dma-names = "ctx0_rx", "ctx0_tx",
-                       "ctx1_rx", "ctx1_tx",
-                       "ctx2_rx", "ctx2_tx",
-                       "ctx3_rx", "ctx3_tx";
-           firmware-name = "imx/easrc/easrc-imx8mn.bin";
-           fsl,asrc-rate  = <8000>;
-           fsl,asrc-format = <2>;
+        compatible = "fsl,imx8mn-easrc";
+        reg = <0x300c0000 0x10000>;
+        interrupts = <0x0 122 0x4>;
+        clocks = <&clk IMX8MN_CLK_ASRC_ROOT>;
+        clock-names = "mem";
+        dmas = <&sdma2 16 23 0> , <&sdma2 17 23 0>,
+               <&sdma2 18 23 0> , <&sdma2 19 23 0>,
+               <&sdma2 20 23 0> , <&sdma2 21 23 0>,
+               <&sdma2 22 23 0> , <&sdma2 23 23 0>;
+        dma-names = "ctx0_rx", "ctx0_tx",
+                    "ctx1_rx", "ctx1_tx",
+                    "ctx2_rx", "ctx2_tx",
+                    "ctx3_rx", "ctx3_tx";
+        firmware-name = "imx/easrc/easrc-imx8mn.bin";
+        fsl,asrc-rate  = <8000>;
+        fsl,asrc-format = <2>;
     };
diff --git a/Documentation/devicetree/bindings/sound/fsl,xcvr.yaml b/Documentation/devicetree/bindings/sound/fsl,xcvr.yaml
index 5e2801014221..f68d0e0ecfe5 100644
--- a/Documentation/devicetree/bindings/sound/fsl,xcvr.yaml
+++ b/Documentation/devicetree/bindings/sound/fsl,xcvr.yaml
@@ -140,21 +140,21 @@ examples:
     #include <dt-bindings/reset/imx8mp-reset.h>
 
     xcvr: xcvr@30cc0000 {
-           compatible = "fsl,imx8mp-xcvr";
-           reg = <0x30cc0000 0x800>,
-                 <0x30cc0800 0x400>,
-                 <0x30cc0c00 0x080>,
-                 <0x30cc0e00 0x080>;
-           reg-names = "ram", "regs", "rxfifo", "txfifo";
-           interrupts = <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>,
-                        <GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH>,
-                        <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>;
-           clocks = <&audiomix_clk IMX8MP_CLK_AUDIOMIX_EARC_IPG>,
-                    <&audiomix_clk IMX8MP_CLK_AUDIOMIX_EARC_PHY>,
-                    <&audiomix_clk IMX8MP_CLK_AUDIOMIX_SPBA2_ROOT>,
-                    <&audiomix_clk IMX8MP_CLK_AUDIOMIX_AUDPLL_ROOT>;
-           clock-names = "ipg", "phy", "spba", "pll_ipg";
-           dmas = <&sdma2 30 2 0>, <&sdma2 31 2 0>;
-           dma-names = "rx", "tx";
-           resets = <&audiomix_reset 0>;
+        compatible = "fsl,imx8mp-xcvr";
+        reg = <0x30cc0000 0x800>,
+              <0x30cc0800 0x400>,
+              <0x30cc0c00 0x080>,
+              <0x30cc0e00 0x080>;
+        reg-names = "ram", "regs", "rxfifo", "txfifo";
+        interrupts = <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&audiomix_clk IMX8MP_CLK_AUDIOMIX_EARC_IPG>,
+                 <&audiomix_clk IMX8MP_CLK_AUDIOMIX_EARC_PHY>,
+                 <&audiomix_clk IMX8MP_CLK_AUDIOMIX_SPBA2_ROOT>,
+                 <&audiomix_clk IMX8MP_CLK_AUDIOMIX_AUDPLL_ROOT>;
+        clock-names = "ipg", "phy", "spba", "pll_ipg";
+        dmas = <&sdma2 30 2 0>, <&sdma2 31 2 0>;
+        dma-names = "rx", "tx";
+        resets = <&audiomix_reset 0>;
     };
diff --git a/Documentation/devicetree/bindings/sound/intel,keembay-i2s.yaml b/Documentation/devicetree/bindings/sound/intel,keembay-i2s.yaml
index 76b6f2cf25df..dca617860938 100644
--- a/Documentation/devicetree/bindings/sound/intel,keembay-i2s.yaml
+++ b/Documentation/devicetree/bindings/sound/intel,keembay-i2s.yaml
@@ -72,19 +72,19 @@ unevaluatedProperties: false
 
 examples:
   - |
-     #include <dt-bindings/interrupt-controller/arm-gic.h>
-     #include <dt-bindings/interrupt-controller/irq.h>
-     #define KEEM_BAY_PSS_AUX_I2S3
-     #define KEEM_BAY_PSS_I2S3
-     i2s3: i2s@20140000 {
-         compatible = "intel,keembay-i2s";
-         #sound-dai-cells = <0>;
-         reg = <0x20140000 0x200>, /* I2S registers */
-               <0x202a00a4 0x4>; /* I2S gen configuration */
-         reg-names = "i2s-regs", "i2s_gen_cfg";
-         interrupts = <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>;
-         clock-names = "osc", "apb_clk";
-         clocks = <&scmi_clk KEEM_BAY_PSS_AUX_I2S3>, <&scmi_clk KEEM_BAY_PSS_I2S3>;
-         dmas = <&axi_dma0 29>, <&axi_dma0 33>;
-         dma-names = "tx", "rx";
-     };
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #define KEEM_BAY_PSS_AUX_I2S3
+    #define KEEM_BAY_PSS_I2S3
+    i2s@20140000 {
+        compatible = "intel,keembay-i2s";
+        #sound-dai-cells = <0>;
+        reg = <0x20140000 0x200>, /* I2S registers */
+              <0x202a00a4 0x4>; /* I2S gen configuration */
+        reg-names = "i2s-regs", "i2s_gen_cfg";
+        interrupts = <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>;
+        clock-names = "osc", "apb_clk";
+        clocks = <&scmi_clk KEEM_BAY_PSS_AUX_I2S3>, <&scmi_clk KEEM_BAY_PSS_I2S3>;
+        dmas = <&axi_dma0 29>, <&axi_dma0 33>;
+        dma-names = "tx", "rx";
+    };
diff --git a/Documentation/devicetree/bindings/sound/neofidelity,ntp8918.yaml b/Documentation/devicetree/bindings/sound/neofidelity,ntp8918.yaml
index 952768b35902..6946177e391a 100644
--- a/Documentation/devicetree/bindings/sound/neofidelity,ntp8918.yaml
+++ b/Documentation/devicetree/bindings/sound/neofidelity,ntp8918.yaml
@@ -55,16 +55,18 @@ unevaluatedProperties: false
 
 examples:
   - |
-   #include <dt-bindings/gpio/gpio.h>
-   i2c {
-     #address-cells = <1>;
-     #size-cells = <0>;
-     audio-codec@2a {
-       compatible = "neofidelity,ntp8918";
-       #sound-dai-cells = <0>;
-       reg = <0x2a>;
-       clocks = <&clkc 150>, <&clkc 151>, <&clkc 152>;
-       clock-names =  "wck", "scl", "bck";
-       reset-gpios = <&gpio 5 GPIO_ACTIVE_LOW>;
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        audio-codec@2a {
+            compatible = "neofidelity,ntp8918";
+            #sound-dai-cells = <0>;
+            reg = <0x2a>;
+            clocks = <&clkc 150>, <&clkc 151>, <&clkc 152>;
+            clock-names =  "wck", "scl", "bck";
+            reset-gpios = <&gpio 5 GPIO_ACTIVE_LOW>;
+        };
     };
-   };
diff --git a/Documentation/devicetree/bindings/sound/ti,pcm6240.yaml b/Documentation/devicetree/bindings/sound/ti,pcm6240.yaml
index dd5b08e3d7a1..d89b4255b51c 100644
--- a/Documentation/devicetree/bindings/sound/ti,pcm6240.yaml
+++ b/Documentation/devicetree/bindings/sound/ti,pcm6240.yaml
@@ -159,19 +159,21 @@ additionalProperties: false
 
 examples:
   - |
-   #include <dt-bindings/gpio/gpio.h>
-   i2c {
-     /* example for two devices with interrupt support */
-     #address-cells = <1>;
-     #size-cells = <0>;
-     pcm6240: audio-codec@48 {
-       compatible = "ti,pcm6240";
-       reg = <0x48>, /* primary-device */
-             <0x4b>; /* secondary-device */
-       #sound-dai-cells = <0>;
-       reset-gpios = <&gpio1 10 GPIO_ACTIVE_HIGH>;
-       interrupt-parent = <&gpio1>;
-       interrupts = <15>;
-     };
-   };
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        /* example for two devices with interrupt support */
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        audio-codec@48 {
+            compatible = "ti,pcm6240";
+            reg = <0x48>, /* primary-device */
+                  <0x4b>; /* secondary-device */
+            #sound-dai-cells = <0>;
+            reset-gpios = <&gpio1 10 GPIO_ACTIVE_HIGH>;
+            interrupt-parent = <&gpio1>;
+            interrupts = <15>;
+        };
+    };
 ...
diff --git a/Documentation/devicetree/bindings/sound/ti,tas2562.yaml b/Documentation/devicetree/bindings/sound/ti,tas2562.yaml
index 8bc3b0c7531e..3763ca16b91f 100644
--- a/Documentation/devicetree/bindings/sound/ti,tas2562.yaml
+++ b/Documentation/devicetree/bindings/sound/ti,tas2562.yaml
@@ -65,17 +65,19 @@ unevaluatedProperties: false
 
 examples:
   - |
-   #include <dt-bindings/gpio/gpio.h>
-   i2c {
-     #address-cells = <1>;
-     #size-cells = <0>;
-     codec: codec@4c {
-       compatible = "ti,tas2562";
-       reg = <0x4c>;
-       #sound-dai-cells = <0>;
-       interrupt-parent = <&gpio1>;
-       interrupts = <14>;
-       shutdown-gpios = <&gpio1 15 0>;
-       ti,imon-slot-no = <0>;
-     };
-   };
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        codec@4c {
+            compatible = "ti,tas2562";
+            reg = <0x4c>;
+            #sound-dai-cells = <0>;
+            interrupt-parent = <&gpio1>;
+            interrupts = <14>;
+            shutdown-gpios = <&gpio1 15 GPIO_ACTIVE_HIGH>;
+            ti,imon-slot-no = <0>;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/sound/ti,tas2770.yaml b/Documentation/devicetree/bindings/sound/ti,tas2770.yaml
index 362c2e6154f0..5e7aea43aced 100644
--- a/Documentation/devicetree/bindings/sound/ti,tas2770.yaml
+++ b/Documentation/devicetree/bindings/sound/ti,tas2770.yaml
@@ -69,19 +69,21 @@ unevaluatedProperties: false
 
 examples:
   - |
-   #include <dt-bindings/gpio/gpio.h>
-   i2c {
-     #address-cells = <1>;
-     #size-cells = <0>;
-     codec: codec@41 {
-       compatible = "ti,tas2770";
-       reg = <0x41>;
-       #sound-dai-cells = <0>;
-       interrupt-parent = <&gpio1>;
-       interrupts = <14>;
-       reset-gpio = <&gpio1 15 0>;
-       shutdown-gpios = <&gpio1 14 0>;
-       ti,imon-slot-no = <0>;
-       ti,vmon-slot-no = <2>;
-     };
-   };
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        codec@41 {
+            compatible = "ti,tas2770";
+            reg = <0x41>;
+            #sound-dai-cells = <0>;
+            interrupt-parent = <&gpio1>;
+            interrupts = <14>;
+            reset-gpio = <&gpio1 15 GPIO_ACTIVE_HIGH>;
+            shutdown-gpios = <&gpio1 14 GPIO_ACTIVE_HIGH>;
+            ti,imon-slot-no = <0>;
+            ti,vmon-slot-no = <2>;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/sound/ti,tas2781.yaml b/Documentation/devicetree/bindings/sound/ti,tas2781.yaml
index 976238689249..5ea1cdc593b5 100644
--- a/Documentation/devicetree/bindings/sound/ti,tas2781.yaml
+++ b/Documentation/devicetree/bindings/sound/ti,tas2781.yaml
@@ -101,22 +101,24 @@ additionalProperties: false
 
 examples:
   - |
-   #include <dt-bindings/gpio/gpio.h>
-   i2c {
-     /* example with quad tas2781s, such as tablet or pad device */
-     #address-cells = <1>;
-     #size-cells = <0>;
-     quad_tas2781: tas2781@38 {
-       compatible = "ti,tas2781";
-       reg = <0x38>, /* Audio slot 0 */
-             <0x3a>, /* Audio slot 1 */
-             <0x39>, /* Audio slot 2 */
-             <0x3b>; /* Audio slot 3 */
+    #include <dt-bindings/gpio/gpio.h>
 
-       #sound-dai-cells = <0>;
-       reset-gpios = <&gpio1 10 GPIO_ACTIVE_HIGH>;
-       interrupt-parent = <&gpio1>;
-       interrupts = <15>;
-     };
-   };
+    i2c {
+        /* example with quad tas2781s, such as tablet or pad device */
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        audio-codec@38 {
+            compatible = "ti,tas2781";
+            reg = <0x38>, /* Audio slot 0 */
+                  <0x3a>, /* Audio slot 1 */
+                  <0x39>, /* Audio slot 2 */
+                  <0x3b>; /* Audio slot 3 */
+
+            #sound-dai-cells = <0>;
+            reset-gpios = <&gpio1 10 GPIO_ACTIVE_HIGH>;
+            interrupt-parent = <&gpio1>;
+            interrupts = <15>;
+        };
+    };
 ...
diff --git a/Documentation/devicetree/bindings/sound/ti,tas27xx.yaml b/Documentation/devicetree/bindings/sound/ti,tas27xx.yaml
index 530bc3937847..5447482179c1 100644
--- a/Documentation/devicetree/bindings/sound/ti,tas27xx.yaml
+++ b/Documentation/devicetree/bindings/sound/ti,tas27xx.yaml
@@ -62,21 +62,23 @@ unevaluatedProperties: false
 
 examples:
   - |
-   #include <dt-bindings/gpio/gpio.h>
-   i2c {
-     #address-cells = <1>;
-     #size-cells = <0>;
-     codec: codec@38 {
-       compatible = "ti,tas2764";
-       reg = <0x38>;
-       #sound-dai-cells = <0>;
-       interrupt-parent = <&gpio1>;
-       interrupts = <14>;
-       reset-gpios = <&gpio1 15 0>;
-       shutdown-gpios = <&gpio1 15 0>;
-       ti,imon-slot-no = <0>;
-       ti,vmon-slot-no = <2>;
-     };
-   };
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        codec@38 {
+            compatible = "ti,tas2764";
+            reg = <0x38>;
+            #sound-dai-cells = <0>;
+            interrupt-parent = <&gpio1>;
+            interrupts = <14>;
+            reset-gpios = <&gpio1 15 GPIO_ACTIVE_HIGH>;
+            shutdown-gpios = <&gpio1 15 GPIO_ACTIVE_HIGH>;
+            ti,imon-slot-no = <0>;
+            ti,vmon-slot-no = <2>;
+        };
+    };
 
 ...
diff --git a/Documentation/devicetree/bindings/sound/ti,tas57xx.yaml b/Documentation/devicetree/bindings/sound/ti,tas57xx.yaml
index 2f917238db95..74f7d02b424b 100644
--- a/Documentation/devicetree/bindings/sound/ti,tas57xx.yaml
+++ b/Documentation/devicetree/bindings/sound/ti,tas57xx.yaml
@@ -112,22 +112,24 @@ unevaluatedProperties: false
 
 examples:
   - |
-   i2c {
-     #address-cells = <1>;
-     #size-cells = <0>;
+    #include <dt-bindings/gpio/gpio.h>
 
-     codec@2a {
-       compatible = "ti,tas5717";
-       reg = <0x2a>;
-       #sound-dai-cells = <0>;
-       reset-gpios = <&gpio1 15 0>;
-       pdn-gpios = <&gpio1 15 0>;
-       AVDD-supply = <&avdd_supply>;
-       DVDD-supply = <&dvdd_supply>;
-       HPVDD-supply = <&hpvdd_supply>;
-       PVDD_AB-supply = <&pvdd_ab_supply>;
-       PVDD_CD-supply = <&pvdd_cd_supply>;
-     };
-   };
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        codec@2a {
+            compatible = "ti,tas5717";
+            reg = <0x2a>;
+            #sound-dai-cells = <0>;
+            reset-gpios = <&gpio1 15 GPIO_ACTIVE_HIGH>;
+            pdn-gpios = <&gpio1 15 GPIO_ACTIVE_HIGH>;
+            AVDD-supply = <&avdd_supply>;
+            DVDD-supply = <&dvdd_supply>;
+            HPVDD-supply = <&hpvdd_supply>;
+            PVDD_AB-supply = <&pvdd_ab_supply>;
+            PVDD_CD-supply = <&pvdd_cd_supply>;
+        };
+    };
 
 ...
-- 
2.43.0

