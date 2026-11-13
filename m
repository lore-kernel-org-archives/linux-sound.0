Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794595119;
	b=YzCDL4cMQfNkeSozBYRFW/15YFro2lwj6tTUeuc2DMQ70Cfw/+nTJo/N36VopvJzUfTy
	 X7BAqkTz8WrsP9Q7amznp2OY2PIavqKWOPFXPPICuBZ/bZ2YLBS4648yp643njEygbhzg
	 I/ehUWafNpJp0O8khWFNagjB8jmUcZlF1gvN3tM/fyU/JeO70aSgtdy/jYS2vt3V3a8Ms
	 ejGnlQR6OYkSzP5b4Rev1n0WtS0zkPz3CFgfHAnE6TPT4qK02sf0ClQPiLuCcYqghKqHY
	 IdLO3I1rqLsqplshT6YOXFE+3AY1wSCyMN+cta9yJqJDWwMXu/nNmzeCAtJXorr8b5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794595119;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=inWTSNXNd4ZBgMLvHZeWrXMf96s/0wr4lXRuvWEjs+o=;
	b=5NpzwDHcHXiTx7sQQtmOl1hy+lbAhmXq5YMgz2xUzGr55HIxXSGKQYLqLm8U1jVpp4Tx
	 rrbiIrTYdc4daUp8v15lWtONHJXHY506ZhlFrvlxZwwDeT6NvGhEmE9lCzfQU48/4F4SN
	 4hDLbpSEfAzVyKVfNJtrOhHDx2wlST4bPHoLhQ1+IjlieXv1wSvwq34h+UnEZYCRypWna
	 +boq5shk1828SpMeex7HsncAg5Ogt+Mqm2F4Un5Q17k7a+lEgtxKNTI5e83Vieber1Vlv
	 IpJwvybrbOh9DMnzEQmyENoeiff57pewjiQnKYzglmT+AWoVSTlkC2rvjY1NvohClOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=P0wKw9MG;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA051606A667
	for <linux-sound@vger.kernel.org>; Fri, 13 Nov 2026 18:38:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA051606A667
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=P0wKw9MG
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-4922523d1afso647124f8f.0
        for <linux-sound@vger.kernel.org>; Fri, 13 Nov 2026 10:38:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794595116; x=1795199916; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=inWTSNXNd4ZBgMLvHZeWrXMf96s/0wr4lXRuvWEjs+o=;
        b=P0wKw9MG9aHpBBHIP/oHCfHSt3CTyiW17DNDKPYLPt/c4lDxUTtKM1GECqXDm3fHUl
         l2Uilvv++mok4kS/MgnDLo1Jtwg2XbNvldjMlyeb0eyng2VcgB9VCnxJ/7lt3KVGtVkx
         BRHAkObgDiL3uXhGUGvp/gRE7GgzLCmLOwb/cRzVsLqqmwoCtOGwwqR2QftV9iQfTH1i
         T6vRiSYck5DL7xq5deFXKygj6ETKhTbPzJNlW4wlF2czhsbfRIDRS+pWY8VgES7d0RS8
         crccLHTXyaCEgKV3nH+HJtFxLlIE9jc/nt0zC+lbjGBgMVes5/9vMVODSNqWnjtNrPyv
         QANg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794595116; x=1795199916;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=inWTSNXNd4ZBgMLvHZeWrXMf96s/0wr4lXRuvWEjs+o=;
        b=1oGwV0Cv+ebronNjaIHZvodgmY1rl7aIOJ0PZH9GyqHPhhp/QIdndip3XW97hfrwVs
         mNC1pWiip5n+XldF3EfBet6LtxMeApCebrIOQbaQro1Vp+V0anCMMQ+WNxkFo22ZM3Sn
         NbNy/KEzH2pW1tm47h95B7oSFtdJCEr7iFIEF9XutZGp0byMqBYdHUCQsNBzxrrapGGj
         TS5Ex8k/I7ZvyqfP/09H/561JI1SP8q/SJF0fI9gd2NmRGfwdy45Dx2/QpToKFf2aM72
         4FQtmwK7U4veK4XlfIzt2pNCQuUN4Mc51FTNsKs8qr+eDxY1bcVRzHKsgDJEqAVeiItM
         lZ4A==
X-Forwarded-Encrypted: i=1; AL+hErFkgIbVuAfOTAwfywG78ypLHnwqLP2yWZeqLI/0nXrqVEL7f44ELrGDZZG3nYtxrYCoJFjdL7i0MaCvzg==@vger.kernel.org
X-Gm-Message-State: APuU4Z+fZwnMWozMkqRRx4Zg2aa69/gPIMOHN4JqGfEfFvzyrN5IjjW6
	nGQYQlTBOActuYuis71ea7yss79xewT8A6TNgElJcAc2uQ0/K4BcxTOLulZMvrglBic=
X-Gm-Gg: AYBFou2dzROAuPn0mrt8QU5KUQMyjOEYyfJYQEEyRBNVVaWeW0sNymmjmUWLO/1Z5wl
	PH3OgZ8tUUDYZMi4Kc9wjvQA2qFh0RzxEfSpo5izom5hKCeJBkg9fNbyNHQoa8+m6kGAvYA3+7D
	/YHKZNgUVMUDiR3INbY22T/Tb+TPt1Ss3BbbCR+y9lvZWruyXg2ndZ8SWz7SeW4qHU+VMaIKrJP
	7bBzgt/BMSyjYTuKKLsdSaEvHbHWeUusSUIU5/stDhOHv6NgTEBpv6AHegnaPUVdIUN4uclnOkV
	hPZl29E0rhmsPFSX7Ur98wR29ZJ7W5ABPT+fvrKZGh9VMkvSY1ZkYsLaNefY8gcax1IrgKRBK1l
	g8TJ5fawiTOj3S1ICjKDO7ienoKmjJp091/C5PnsdI+PPhTUjL3L8ej7LAny29VLiW8/ugN8ugl
	XmCVKtUY5IuU4S/2t4N/Hf5u85Vwt0dyhNReW563TYGGGP5+bzKAWB/OAW3swIU5nmropQ93GS3
	i0yVpGFNSXjcvrXlGrBBCBzBzg76t/dvjmtMKYtPp2AERiSlBEC7bxgJBvuwM+kKCCGmxn6mDrg
	SNMaWKgAHBpv4Ln1jIi3rdBCYXDe9hp5XD8k7ZeM4jw=
X-Received: by 2002:a5d:64e4:0:b0:487:6f2:1a4c with SMTP id ffacd0b85a97d-49c7381b46cmr8137549f8f.25.1794595116303;
        Fri, 13 Nov 2026 10:38:36 -0800 (PST)
Received: from arrakeen-2.home ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f7828a4sm6865870f8f.23.2026.11.13.10.38.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:38:35 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 13 Nov 2026 19:38:15 +0100
Subject: [PATCH RFC 01/23] dt-bindings: clock: qcom: add SM8650 LPASS core
 & audio clock controllers
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261113-topic-sm8650-el2-v1-1-5183f6aab9fc@linaro.org>
References: <20261113-topic-sm8650-el2-v1-0-5183f6aab9fc@linaro.org>
In-Reply-To: <20261113-topic-sm8650-el2-v1-0-5183f6aab9fc@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Srinivas Kandagatla <srini@kernel.org>, 
 Rohit kumar <quic_rohkumar@quicinc.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Konrad Dybcio <konradybcio@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 linux-gpio@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=9238;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=Kr7e5W8XuZJKX4WbjynWUkmjZ7uF6Nn3pPYdnjhlSAQ=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBq91kdaDCYiI9IYxw2rDMOK3+eSPHvViLs19mVy60M
 Ye4/LCOJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCavdZHQAKCRB33NvayMhJ0c4iD/
 9gwyEyXo5fd7dbnyf4aKr71pxJy1WsvvMtQGbWx0Z4cAFPlvA5qo9nG8DJ4rdEo1wfDMmUlkrFXEJ9
 XW7W2iMD2qx2IIAq0hntxXExCvDbk2lZAqWh0IHouC+VBVAdbPVcE2kCU1u0QZ1i7mQtQ5oIlayfjE
 vRN366nYIfJruTHAKrRXpVYjxywQ1rtbgUpH5lgxFhiHgXbPzzATxSmHb5Ob1Yhw9FlNJfPOre/ZT0
 HcQJLJq6dy4HBX7r+XHKYk2z2MMQ2IkYLnsOHb8noOStw14bi6klRJcHMoobu1UQlDKtLpRSClEJNC
 Ve8R4/K8fVXtKYJqBZZjgjucTLQVsBJ8WKIowoYgUV+/Kx3DDd6nWggTvugXUBEQnLRONnBfo4JQw9
 5AcjctPUDAatDt8/taHTClET3lhhZ3Yeng+2QBiLATocaVG+nwEcIgrcl+1qBJePkVNqjfMRj+50cV
 FjtQZ/H9Am6HAA3lEGtjDQ6+BE7ix7PdQyyQ9VHGLZ314DS3QnyRINQt7+Zlv2HDzVkKspOzOf9VTd
 /c7IcsQ3sNoPFKj0OXcMKKTLSmxob3yzry3fvqoN8ywgH/8SqkU6+qBrWZbkVQsXcrq0fq/JksrF9D
 LqJdjlXq13YR5yx4vIMvvwB6+IRx2K00jcVMvIKBByRV8GtxDAHWHJgXvtRQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

The SM8650 LPASS HM, core, audio and AON clock controllers need to be
described to drive audio from Linux without the ADSP firmware.

Document these clock controllers and add their clock & power domain ids.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../bindings/clock/qcom,sm8650-lpasscorecc.yaml    | 179 +++++++++++++++++++++
 .../dt-bindings/clock/qcom,lpassaudiocc-sm8650.h   |  47 ++++++
 .../dt-bindings/clock/qcom,lpasscorecc-sm8650.h    |  30 ++++
 3 files changed, 256 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8650-lpasscorecc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8650-lpasscorecc.yaml
new file mode 100644
index 000000000000..9c5207ee02f1
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8650-lpasscorecc.yaml
@@ -0,0 +1,179 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,sm8650-lpasscorecc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm LPASS Core & Audio Clock Controllers on SM8650
+
+maintainers:
+  - Neil Armstrong <neil.armstrong@linaro.org>
+
+description: |
+  Qualcomm LPASS HM, core, audio and AON clock controllers provide the clocks
+  and power domains of the Low Power Audio SubSystem (LPASS) on SM8650, used
+  when LPASS is driven by Linux instead of the ADSP firmware.
+
+  See also:
+    include/dt-bindings/clock/qcom,lpasscorecc-sm8650.h
+    include/dt-bindings/clock/qcom,lpassaudiocc-sm8650.h
+
+properties:
+  compatible:
+    enum:
+      - qcom,sm8650-lpassaoncc
+      - qcom,sm8650-lpassaudiocc
+      - qcom,sm8650-lpasscorecc
+      - qcom,sm8650-lpasshm
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    minItems: 1
+    maxItems: 2
+
+  clock-names:
+    minItems: 1
+    maxItems: 2
+
+  power-domains:
+    maxItems: 1
+
+  required-opps:
+    maxItems: 1
+
+  '#clock-cells':
+    const: 1
+
+  '#power-domain-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - '#clock-cells'
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,sm8650-lpasshm
+    then:
+      properties:
+        clocks:
+          items:
+            - description: Board XO source
+        clock-names:
+          items:
+            - const: bi_tcxo
+      required:
+        - power-domains
+        - '#power-domain-cells'
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,sm8650-lpasscorecc
+    then:
+      properties:
+        clocks:
+          items:
+            - description: Board XO source
+        clock-names:
+          items:
+            - const: bi_tcxo
+        required-opps: false
+      required:
+        - power-domains
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,sm8650-lpassaoncc
+    then:
+      properties:
+        clocks:
+          items:
+            - description: Board XO source
+            - description: LPASS_CORE_CC_CORE_CLK
+        clock-names:
+          items:
+            - const: bi_tcxo
+            - const: iface
+        power-domains: false
+        required-opps: false
+      required:
+        - '#power-domain-cells'
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,sm8650-lpassaudiocc
+    then:
+      properties:
+        clocks:
+          items:
+            - description: Board XO source
+            - description: LPASS_AON_CC_MAIN_RCG_CLK_SRC
+        clock-names:
+          items:
+            - const: bi_tcxo
+            - const: iface
+        required-opps: false
+      required:
+        - power-domains
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,lpassaudiocc-sm8650.h>
+    #include <dt-bindings/clock/qcom,lpasscorecc-sm8650.h>
+    #include <dt-bindings/clock/qcom,sm8650-gcc.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
+
+    clock-controller@6bc0000 {
+        compatible = "qcom,sm8650-lpassaudiocc";
+        reg = <0x06bc0000 0x38000>;
+        clocks = <&bi_tcxo_div2>;
+        clock-names = "bi_tcxo";
+        power-domains = <&lpass_aon LPASS_AON_CC_LPASS_AUDIO_HM_GDSC>;
+        #clock-cells = <1>;
+    };
+
+    lpass_aon: clock-controller@6e00000 {
+        compatible = "qcom,sm8650-lpassaoncc";
+        reg = <0x06e00000 0x30000>;
+        clocks = <&bi_tcxo_div2>, <&lpass_core LPASS_CORE_CC_CORE_CLK>;
+        clock-names = "bi_tcxo", "iface";
+        #clock-cells = <1>;
+        #power-domain-cells = <1>;
+    };
+
+    lpass_core: clock-controller@7b00000 {
+        compatible = "qcom,sm8650-lpasscorecc";
+        reg = <0x07b00000 0x58000>;
+        clocks = <&bi_tcxo_div2>;
+        clock-names = "bi_tcxo";
+        power-domains = <&lpass_hm LPASS_CORE_HM_GDSC>;
+        #clock-cells = <1>;
+    };
+
+    lpass_hm: clock-controller@7e00000 {
+        compatible = "qcom,sm8650-lpasshm";
+        reg = <0x07e00000 0xa000>;
+        clocks = <&bi_tcxo_div2>, <&gcc GCC_LPASS_CFG_NOC_SWAY_CLK>;
+        clock-names = "bi_tcxo", "iface";
+        power-domains = <&rpmhpd RPMHPD_LCX>;
+        required-opps = <&rpmhpd_opp_nom>;
+        #clock-cells = <1>;
+        #power-domain-cells = <1>;
+    };
+...
diff --git a/include/dt-bindings/clock/qcom,lpassaudiocc-sm8650.h b/include/dt-bindings/clock/qcom,lpassaudiocc-sm8650.h
new file mode 100644
index 000000000000..c10e2a2639f1
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,lpassaudiocc-sm8650.h
@@ -0,0 +1,47 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2021, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_LPASS_AUDIO_CC_SM8650_H
+#define _DT_BINDINGS_CLK_QCOM_LPASS_AUDIO_CC_SM8650_H
+
+/* LPASS_AUDIO_CC clocks */
+#define LPASS_AUDIO_CC_CODEC_MEM_CLK			1
+#define LPASS_AUDIO_CC_CODEC_MEM0_CLK			2
+#define LPASS_AUDIO_CC_CODEC_MEM1_CLK			3
+#define LPASS_AUDIO_CC_CODEC_MEM2_CLK			4
+#define LPASS_AUDIO_CC_CODEC_MEM3_CLK			5
+#define LPASS_AUDIO_CC_RX_MCLK_CLK			6
+#define LPASS_AUDIO_CC_RX_MCLK_CLK_SRC			7
+#define LPASS_AUDIO_CC_TX_MCLK_RX_CLK			8
+#define LPASS_AUDIO_CC_WSA_MCLK_CLK_SRC			9
+#define LPASS_AUDIO_CC_WSA_MCLK_CLK			10
+#define LPASS_AUDIO_CC_WSA2_MCLK_CLK			11
+#define LPASS_AUDIO_CC_TX_MCLK_WSA_CLK			12
+#define LPASS_AUDIO_CC_TX_MCLK_WSA2_CLK			13
+#define LPASS_AUDIO_CC_CDIV_RX_MCLK_DIV_CLK_SRC		16
+#define LPASS_AUDIO_CC_CDIV_WSA_MCLK_DIV_CLK_SRC	17
+#define LPASS_AUDIO_CC_EXT_IF1_CLK_SRC			18
+#define LPASS_AUDIO_CC_EXT_IF1_IBIT_CLK			19
+#define LPASS_AUDIO_CC_EXT_IF2_CLK_SRC			20
+#define LPASS_AUDIO_CC_EXT_IF2_IBIT_CLK			21
+#define LPASS_AUDIO_CC_EXT_IF4_CLK_SRC			22
+#define LPASS_AUDIO_CC_EXT_IF4_IBIT_CLK			23
+#define LPASS_AUDIO_CC_EXT_IF5_CLK_SRC			24
+#define LPASS_AUDIO_CC_EXT_IF5_IBIT_CLK			25
+
+/* LPASS_AON_CC clocks */
+#define LPASS_AON_CC_MAIN_RCG_CLK_SRC			1
+#define LPASS_AON_CC_AUDIO_HM_H_CLK			2
+#define LPASS_AON_CC_TX_MCLK_CLK_SRC			3
+#define LPASS_AON_CC_TX_MCLK_CLK			4
+#define LPASS_AON_CC_VA_MEM0_CLK			5
+#define LPASS_AON_CC_CDIV_TX_MCLK_DIV_CLK_SRC		6
+#define LPASS_AON_CC_EXT_IF1_CLK_SRC			7
+#define LPASS_AON_CC_EXT_IF1_IBIT_CLK			8
+
+/* LPASS_AON_CC power domains */
+#define LPASS_AON_CC_LPASS_AUDIO_HM_GDSC		0
+
+#endif
diff --git a/include/dt-bindings/clock/qcom,lpasscorecc-sm8650.h b/include/dt-bindings/clock/qcom,lpasscorecc-sm8650.h
new file mode 100644
index 000000000000..2849729a2e56
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,lpasscorecc-sm8650.h
@@ -0,0 +1,30 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2021, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_LPASS_CORE_CC_SM8650_H
+#define _DT_BINDINGS_CLK_QCOM_LPASS_CORE_CC_SM8650_H
+
+/* LPASS_CORE_CC clocks */
+#define LPASS_CORE_CC_DIG_PLL                           0
+#define LPASS_CORE_CC_DIG_PLL_OUT_MAIN_DIV_CLK_SRC      1
+#define LPASS_CORE_CC_DIG_PLL_OUT_ODD                   2
+#define LPASS_CORE_CC_CORE_CLK                          3
+#define LPASS_CORE_CC_CORE_CLK_SRC                      4
+#define LPASS_CORE_CC_EXT_IF0_CLK_SRC                   5
+#define LPASS_CORE_CC_EXT_IF0_IBIT_CLK                  6
+#define LPASS_CORE_CC_EXT_IF1_CLK_SRC                   7
+#define LPASS_CORE_CC_EXT_IF1_IBIT_CLK                  8
+#define LPASS_CORE_CC_EXT_IF2_CLK_SRC                   9
+#define LPASS_CORE_CC_EXT_IF2_IBIT_CLK                  10
+#define LPASS_CORE_CC_LPM_CORE_CLK                      11
+#define LPASS_CORE_CC_LPM_MEM0_CORE_CLK                 12
+#define LPASS_CORE_CC_SYSNOC_MPORT_CORE_CLK             13
+#define LPASS_CORE_CC_EXT_MCLK0_CLK                     14
+#define LPASS_CORE_CC_EXT_MCLK0_CLK_SRC                 15
+
+/* LPASS Core power domains */
+#define LPASS_CORE_HM_GDSC				0
+
+#endif

-- 
2.34.1

