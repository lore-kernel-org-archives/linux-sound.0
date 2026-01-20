Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32C8446AEF3
	for <linux-sound@vger.kernel.org>; Tue, 20 Jan 2026 19:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768935978; cv=none; b=DAh2W3pN0Td5idmsZQCpKtuUlfpBUKRVDqsaO9NicR0o6caqlW5zRm/czLT9orPV1re1TTsJLeYePU9fW/rt2UWTHwn95ya4TTzu95YtdNaEBZKdKeuJ339zjy5CVd18umi+rMFn1bMFj6zq0+Q+twglAGMW7/vr1pXPy5YIYY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768935978; c=relaxed/simple;
	bh=yxnEx4BU+xefwn+EfFU7iFurmvPml9i59k/P1RLAJgs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IU0FBOI/3JPHCtmvaG/A26EljDSLGpkpbsgKquuKd06bwbJrVWwsIlbHGCeL0dNyGNq/iFLLfKDeQ2vguCo64hqyRmGhF2ZZQ06IxWk/gZkU2h/QzJ0Np7kCJgraphBg5pNxXaNFu+iEG6yc0sn/Qw9oHOKm9diHZVwIy1MQSa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YurQtt9z; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YurQtt9z"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-480142406b3so31259865e9.1
        for <linux-sound@vger.kernel.org>; Tue, 20 Jan 2026 11:06:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768935973; x=1769540773; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lfs9m2lS0OGQ6AFUB84Kj8F2HzMlL+m5vSn33xsuh6g=;
        b=YurQtt9zWvKKDjI5nYquQi4VCIBVi2GeFD6N/8GZ0huG2sCpXgVhmcTeNTTkYevJQs
         ttAWz1V/WqJHxODIHQYt8/Yu7IIRV7fXoTtERl/jJK3FWWLc92B/+uGkJ9kjvRGpTn09
         Sh/RJT6Yigo30jb2qk4cyTEl4sIn+HllfPOCOI/TZJO7cBbRV0G9HQ+juK4LPNxFohVG
         g2QRW5CtzBl/Oxygxg/PFYSmZmC6SQRoV2t9ZXpETSMsno/RCyyF77c+Z4jjEbkYlwH+
         AnldB1/n8eP/Y7PJTIYh+hrFuxOwRICIKCyAH1GDB1spnXubUktxyBgo9rwgN4KwYL15
         mzSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768935973; x=1769540773;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Lfs9m2lS0OGQ6AFUB84Kj8F2HzMlL+m5vSn33xsuh6g=;
        b=VRQPVTTJBCm8zk0Bzg+QFabrZVibOlqKBsY6x099f3S+0NBkY31N89BsanGGtMbOSh
         kYIVb+dq+zw7GoJybzTk+VsTNfuczVkOzHtN3EIjBvzM8HwFULwy1v6Dl0sMbNQYG6od
         iTyWotfCU34LlaCeJsSV3Q0jkUHJh10lUn56I6GQJv0EenTCsiZh71XGNh7f6sM9wQxd
         bblVRgUSH/BwmRxHsnZkAEIcI+mVpYH5QfpqV3hqu3SGyG/pGIQcEQMw6uWc2rik1x4u
         RGc1urk5kiJkTURqIOorSbPm/tCGyYugCjT39vFgzORCj1d8gxISf63OxuLM4EXK0+Vw
         PSFg==
X-Gm-Message-State: AOJu0YyIQc1Ylev/ijsx5JgOJJpnZMVr0yKEBP7sIHnPq8mpfyezSC6V
	H8zHaKfpzSKXLo4ZU3WY6EVBHnD3qAbfzxCsgXJMkO0d7W748rooJISq
X-Gm-Gg: AY/fxX7+V4ZPJbKpUTQN+PhI8WgcrHw+6mSg/E6F3oigvZxuPnkO2IB/P3iTypjElyD
	iGXCUk0G2DK8eE93a3jDUZ0RMyauxb3BQ/k/t92pxoEkmQLk1LQLLWsfm2N89UZmhcwBY+TOqB9
	0Qly3RAXrKiSaGVYW0DKY5p6FGp2C8Va4dywMpuobCkBW6doCsMnrpEMxVU5x2hoZueRCne8w4j
	SAy4azoC/5hMNeauyW9+WpmuCbINen3TWCPO/J8/EBRa77b4ynEY+UjKYseb53UW7BNHuUXlIok
	jESa/obTK085gaex8ddqtjAzFNOixfgAHj8QuSgXkmjPwY7pRjNr4k6uyWtb4cUpYyhHMIhkIyR
	wq7zsTzqAZTGNyE+QHoPUhW46HjaxWLXuiM0KN9v1J8c9sL8xZ14wEmrlTx8ya0K7xF3b7eCbLn
	R7Q+c3B9MRbkugL2DLCY8q6fp27VPtUNC8QuacieLqvp0Q
X-Received: by 2002:a05:600c:8b58:b0:47b:e2a9:2bd9 with SMTP id 5b1f17b1804b1-4801e345987mr230321595e9.31.1768935973027;
        Tue, 20 Jan 2026 11:06:13 -0800 (PST)
Received: from [127.0.1.1] (bba-94-59-215-181.alshamil.net.ae. [94.59.215.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4804244c6cesm2005735e9.0.2026.01.20.11.06.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 11:06:12 -0800 (PST)
From: "Anton D. Stavinskii" <stavinsky@gmail.com>
Date: Tue, 20 Jan 2026 23:06:03 +0400
Subject: [PATCH v4 1/6] ASoC: dt-bindings: sophgo,cv1800b: add I2S/TDM
 controller
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260120-cv1800b-i2s-driver-v4-1-6ef787dc6426@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768935966; l=2363;
 i=stavinsky@gmail.com; s=20260115; h=from:subject:message-id;
 bh=yxnEx4BU+xefwn+EfFU7iFurmvPml9i59k/P1RLAJgs=;
 b=4ceWN1YSmA/dnUJiaFeJ71H2kKEEf6TSCxHE16GDFpBeRQWyCoDj31tNuqPWaIX99YvDyeYG9
 RGXjBukPLo5AiTzR0C+aXc52BnXDsS/mUZse/wpVQT8d4TjzUO4zggA
X-Developer-Key: i=stavinsky@gmail.com; a=ed25519;
 pk=2WxGZ1zd1vQwSPFCSks6zrADqUDBUdtq39lElk4ZE7Q=

There are 4 TDM controllers on the SoC. Each controller can receive or
transmit data over DMA. The dma it self has 8 channels.
Each channel can be connected only to a specific i2s node. But each
of dma channel can have multiple purposes so in order to save dma
channels the configurations allows to use tx and rx, only rx, only tx
or none channels. I2S controller without channels can be useful in
configuration where I2S is used as clock source only and doesn't
produce any data.

Signed-off-by: Anton D. Stavinskii <stavinsky@gmail.com>
---
 .../bindings/sound/sophgo,cv1800b-i2s.yaml         | 67 ++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/sophgo,cv1800b-i2s.yaml b/Documentation/devicetree/bindings/sound/sophgo,cv1800b-i2s.yaml
new file mode 100644
index 000000000000..f08362b0ca5e
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/sophgo,cv1800b-i2s.yaml
@@ -0,0 +1,67 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/sophgo,cv1800b-i2s.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sophgo CV1800B I2S/TDM controller
+
+maintainers:
+  - Anton D. Stavinskii <stavinsky@gmail.com>
+
+description: I2S/TDM controller found in CV1800B / Sophgo SG2002/SG2000 SoCs.
+
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  compatible:
+    const: sophgo,cv1800b-i2s
+
+  reg:
+    maxItems: 1
+
+  "#sound-dai-cells":
+    const: 0
+
+  clocks:
+    maxItems: 2
+
+  clock-names:
+    items:
+      - const: i2s
+      - const: mclk
+
+  dmas:
+    minItems: 1
+    maxItems: 2
+
+  dma-names:
+    minItems: 1
+    items:
+      - enum: [rx, tx]
+      - const: tx
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - "#sound-dai-cells"
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/sophgo,cv1800.h>
+
+    i2s@4110000 {
+        compatible = "sophgo,cv1800b-i2s";
+        reg = <0x04110000 0x10000>;
+        clocks = <&clk CLK_APB_I2S1>,  <&clk CLK_SDMA_AUD1>;
+        clock-names = "i2s", "mclk";
+        dmas = <&dmamux 2 1>, <&dmamux 3 1>;
+        dma-names = "rx", "tx";
+        #sound-dai-cells = <0>;
+    };
+...

-- 
2.43.0

