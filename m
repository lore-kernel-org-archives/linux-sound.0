Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 083F219CD0A
	for <linux-sound@vger.kernel.org>; Tue,  9 Jul 2024 15:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720538930; cv=none; b=l7qKsT7UjOF5vebl5w56DYRchdrH64UO8cr+G8VTu2dfdtutCp3EwvyDtnK1VNBm0SwA1FLFhYpWexGjcQRVDI3WIRptjw5VjgbZQJU13L2E81p8DtLzLXWnoj/SQb31oXWFM73RFCBGt6mDoPtIHHSxDzdSbEoWisjsTYsURF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720538930; c=relaxed/simple;
	bh=Xq8uJAy88lv1uxCiheZGM9OSarqyJTMwcEDG1B96A2Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gWU+0Ea/j5pbpeoW+LhKJx4Ebrpy4VDhQzfx+agDCjoAVD/Rl3hYgBEFAPbHTCVl2kv/iLCNw/8q/y5P/n+yausOs93etxeXx23zde1NfHpQV9pOQq0LHLkC9MGrQt43zhyFxiVsFpJyqwc6HDCPAZpw+UWYshQIMSxhLUE5xcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=USC/nyOG; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="USC/nyOG"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4266b1f1b21so14159785e9.1
        for <linux-sound@vger.kernel.org>; Tue, 09 Jul 2024 08:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720538927; x=1721143727; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DNtSueuDtXsARVEbcRgGrAWRHcIqldsm424wzohUyiY=;
        b=USC/nyOGym9uD8D9PN4NldFBkE0D/SuRbr/fdEdx0zKNph4f0yOz/Imit4zsHVeLv8
         yII0uFILGQTf9xj4x4mS3v8VC2l5xY1WEI44oC7tXfhSXodz0gTfUIvVKEXLel5T2pC/
         ZsEiij8+/xe2CabCfPzLzEzyk0Rr9qPd+BZJT6222wAWV8oqCG6FSA6tlfSwuWwEvwjN
         4lzyvW/3qC4Q+CyPlMi+xBvr5+mPP1GFMrn0cQrR1haAi+060eqvi2rFRrc0Iuj+4/Li
         QXT1Tj9oLg+QfCpmlPkE0ukI8J8EyhOCFAdPxu8boqfJkFU/ArvXq76MragiV+rIKD3F
         RteA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720538927; x=1721143727;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DNtSueuDtXsARVEbcRgGrAWRHcIqldsm424wzohUyiY=;
        b=rmwXgiCxdnAJh6+NrLG5HHZPCeePR2fTl1ZYH6XBsgdeRBy2/JrxknmX1zuYWVhhGK
         it0iVl4Teld1H4vENKRtCPPLZX6QiFhLXvggP9Nh7RFqFDe5oAZz6m4T5E5DWQWiiNpd
         L1Iu98p3iZCzPXerywyhIGND/SMFNfi4xfKHB8rD5KYQMy14IWLJU1iqhaK3J5fwLiYu
         v0ie8F3dsf298/rp2NkvOX6uWebmhn17WHt+3FQNuX3jqLinVRdLazVJDf6kkCYD48CB
         zRlWnnIvogmmlKgdL6YlraIzGgBDPFYo9XOpQf59MKjggL2RGgUiXUdxkKZJzE/1lhF5
         CwCw==
X-Forwarded-Encrypted: i=1; AJvYcCW9RKoS7JQMR/ScE7FQZZ8L4TeCN9yGGcbijYbddebKL5ETadobr9nf6rLmuvT1sjFCmCwKcZwvQupWQAV8R2QNRx00/pSdZYkLmm0=
X-Gm-Message-State: AOJu0YzrSWsCJg9ybMOEfQlGJR55O5bpWPGgCj4pNJAdjJaOndkh+xsD
	Foh+k2BFzd+XRGngaUCq7FoeR9Ws+REBjw4tkgTHAHnLzKnTEn/hs4ZZcLRVmUE=
X-Google-Smtp-Source: AGHT+IEiiEdiOEJvS824Y/O3HEpYDyOdjBG53LXdLiwlz6IeDKbNx00nUjCQ8cB6GpjwQh1jLEsC5w==
X-Received: by 2002:a05:600c:4a05:b0:426:6618:146a with SMTP id 5b1f17b1804b1-426707cf1c8mr19505775e9.2.1720538927353;
        Tue, 09 Jul 2024 08:28:47 -0700 (PDT)
Received: from rayyan-pc.broadband ([2a0a:ef40:ee7:2401:197d:e048:a80f:bc44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4266f6f5a32sm45883775e9.24.2024.07.09.08.28.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jul 2024 08:28:47 -0700 (PDT)
From: Rayyan Ansari <rayyan.ansari@linaro.org>
To: devicetree@vger.kernel.org
Cc: Rayyan Ansari <rayyan.ansari@linaro.org>,
	alsa-devel@alsa-project.org,
	Banajit Goswami <bgoswami@quicinc.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH 1/2] ASoC: dt-bindings: qcom,msm8916-wcd-digital-codec: convert to dtschema
Date: Tue,  9 Jul 2024 16:24:42 +0100
Message-ID: <20240709152808.155405-2-rayyan.ansari@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240709152808.155405-1-rayyan.ansari@linaro.org>
References: <20240709152808.155405-1-rayyan.ansari@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Qualcomm MSM8916 WCD Digital Audio Codec bindings from text
to yaml dt schema format.
Make bindings complete by adding #sound-dai-cells.

Signed-off-by: Rayyan Ansari <rayyan.ansari@linaro.org>
---
 .../sound/qcom,msm8916-wcd-digital-codec.yaml | 53 +++++++++++++++++++
 .../sound/qcom,msm8916-wcd-digital.txt        | 20 -------
 2 files changed, 53 insertions(+), 20 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,msm8916-wcd-digital-codec.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/qcom,msm8916-wcd-digital.txt

diff --git a/Documentation/devicetree/bindings/sound/qcom,msm8916-wcd-digital-codec.yaml b/Documentation/devicetree/bindings/sound/qcom,msm8916-wcd-digital-codec.yaml
new file mode 100644
index 000000000000..5e7d15b61ad6
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/qcom,msm8916-wcd-digital-codec.yaml
@@ -0,0 +1,53 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/qcom,msm8916-wcd-digital-codec.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm MSM8916 WCD Digital Audio Codec
+
+maintainers:
+  - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
+
+description:
+  The digital WCD audio codec found on Qualcomm MSM8916 LPASS.
+
+properties:
+  compatible:
+    const: qcom,msm8916-wcd-digital-codec
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    minItems: 2
+    maxItems: 2
+
+  clock-names:
+    items:
+      - const: ahbix-clk
+      - const: mclk
+
+  '#sound-dai-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - '#sound-dai-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,gcc-msm8916.h>
+    audio-codec@771c000 {
+        compatible = "qcom,msm8916-wcd-digital-codec";
+        reg = <0x0771c000 0x400>;
+        clocks = <&gcc GCC_ULTAUDIO_AHBFABRIC_IXFABRIC_CLK>,
+                 <&gcc GCC_CODEC_DIGCODEC_CLK>;
+        clock-names = "ahbix-clk", "mclk";
+        #sound-dai-cells = <1>;
+    };
diff --git a/Documentation/devicetree/bindings/sound/qcom,msm8916-wcd-digital.txt b/Documentation/devicetree/bindings/sound/qcom,msm8916-wcd-digital.txt
deleted file mode 100644
index 1c8e4cb25176..000000000000
--- a/Documentation/devicetree/bindings/sound/qcom,msm8916-wcd-digital.txt
+++ /dev/null
@@ -1,20 +0,0 @@
-msm8916 digital audio CODEC
-
-## Bindings for codec core in lpass:
-
-Required properties
- - compatible = "qcom,msm8916-wcd-digital-codec";
- - reg: address space for lpass codec.
- - clocks: Handle to mclk and ahbclk
- - clock-names: should be "mclk", "ahbix-clk".
-
-Example:
-
-audio-codec@771c000{
-	compatible = "qcom,msm8916-wcd-digital-codec";
-	reg = <0x0771c000 0x400>;
-	clocks = <&gcc GCC_ULTAUDIO_AHBFABRIC_IXFABRIC_CLK>,
-		 <&gcc GCC_CODEC_DIGCODEC_CLK>;
-	clock-names = "ahbix-clk", "mclk";
-	#sound-dai-cells = <1>;
-};
-- 
2.45.2

