Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E741D426431
	for <linux-sound@vger.kernel.org>; Tue, 11 Aug 2026 09:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786439873; cv=none; b=YvnAm9D3grIrFZ3H9kJUOGgaSWfK7xPBiVkLprz29LZzEcLJULjqCsIn3YOX3HSgB47oEL8sovkMjfQ/A/YK7o/yKRtsNPFh9VPj9NrD37e4TlIiFI03fbRSmPu7LDaWiINCcYJ2XcOkcYNiAIhN+RdKpqTibcbnVMfo61QK1zY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786439873; c=relaxed/simple;
	bh=InczLySXpyBrRix4jg6+8nPmD2FL0BQhNSmxXOu4iWE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mn7jvu1ARcTNmaEwEhKLLYYo4AXncDdQh47/fINlWPQXb8h7bLrIDKsispfSONZThF/k5qKZDe76hqOUTvnJTMJmSTCvoC3R/d6YXx4sAXlP5ZnLJpIl9ERNly97SGcnjzTDwWJsVtrR5BU8fyRQvT39Xm8ErKpH4xl05Uwd9Jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ka2GbQIa; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ka2GbQIa"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-472326ca506so400394f8f.2
        for <linux-sound@vger.kernel.org>; Tue, 11 Aug 2026 02:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786439868; x=1787044668; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KNt4bQq2u8qw/aarLJ9pb4tE5RTplArkdmLeC+XTR4A=;
        b=Ka2GbQIa9pZsWwGyeWU4JbW+ROvgKISn/MUfiTl/TjKLcWUEdsomu3WW16oSGn1ldA
         NUmEH9PQtG0rJedrSEiVLGDRJAqoyNbiiHdubDYeNu+SAWd3utG/kBf+OxPHUr/N7AFX
         nEPRJ3nuJIIlXyQvESQK0s+Z8NjBri8Xemir4iul2AezzmiymTqhd0JkeYYwgF0fkVH6
         v7NxO/ye9BmElGLsqWfmMVupXfTrq67dZ132qBVW0TFegnul3E+FvsjQDmb2QuGwczDr
         +ibboKF/LQ+c+KgwbeGSo1aNunsa2F+KsC24iGIbX91JacTm52LSZlhCxV2KRH92thqd
         EedA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786439868; x=1787044668;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KNt4bQq2u8qw/aarLJ9pb4tE5RTplArkdmLeC+XTR4A=;
        b=G38vNSIfk8H4qH6x8PAlzITELMLULzl+1+PEIoY/JM+tzjB4rZSSEVBB7yPGc8GsA3
         0n+Fyos+rnPoLjoApEPVl0MWduvA+2DQVDezIxCgc/ZLEzAzTcKjlofrSP1/5cehJsS7
         6ecM4No5VB78q1ZqXtIBr9bVj5irLTsO3ng04EAxy2GSVzoilUeunK92mBCZuuAGx0iZ
         PpAA9gCYj6SuQC5Z8jFC8U7JUXVtxsTzmqOlUK1Fi4nQiAG3E48U26yK2Kc0rcDh53Du
         feE8WevJXfZ5OJhwM/BLHHdVSTCYnE6u1NFgvIJg5VExp5K9wmKDyDyjNs6XnchfBHE5
         WYig==
X-Forwarded-Encrypted: i=1; AHgh+RowPR0KVwhuNqRTBHo9qxyYcM8zAC1mJphsLPoA1JpW9zfL62sYG8qygjHSGcfIMAasavQefY9SqHNm4w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+NM1Lsmgg4IFMZiI752ERzx154I068QWTxiJuyhF40uszicJb
	gfw5fRq1v9bPpeIko82+eVKFIfc+6Lora2rPXdc6YUSo5y1PS/MTj+ps
X-Gm-Gg: AR+sD13hZHUriU04Pluh4dynPnbHHIEdI5ez9faTpkeMIxWDmFDQzxfuMtdiy76ymlD
	eSONfLAwzSFtsCYL65HVm/RzBQqDhCFBG3fo2wfPUlsWBZA7KrPvNMdTNYuuCygqeLDqIB1A4CB
	EtEcfTAeSWMgUJrVCiVBQ7WH52ctonUNpGOpRFNvhcTEsg/bJIrSfP/TDev3AUYCGh5/6hSVgnK
	CcSVjlJ2Om2ApewQvSuI2GqhB2SHRDA0jUC1ADQnlb1Wps2BMjjVkkCRdWIcMNDKLL2wGtsoSE9
	ckBtkfK6J8mpFjzGW+2DdKZ7JAqeMCW01VV5CxcEq9gH4LH8QS7yNUHdnqTWEG9Gj1Rw8GaEIzF
	LIJRAulvqhFqN4M/RkjinCTn6XkiDJLzv0VquBKM3tdk8s7cy8xPyjh0O+xOJLKr0mB5zk4PAT6
	AnTn2k2PHaT7negjV5YOXsJ262GJy+fNropTM52BLC+XMehgYreOVXNSNvoWWngzP+rYSVTrRUV
	ySAfCv+HTmQSsCnX8BguffDqOHDYw==
X-Received: by 2002:a5d:5e8d:0:b0:47f:9750:26cc with SMTP id ffacd0b85a97d-4814adcac2cmr3530466f8f.23.1786439867832;
        Tue, 11 Aug 2026 02:17:47 -0700 (PDT)
Received: from localhost.localdomain ([82.137.32.40])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4814a5be8absm2714732f8f.15.2026.08.11.02.17.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 02:17:47 -0700 (PDT)
From: Eduard Bostina <egbostina@gmail.com>
To: Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Eduard Bostina <egbostina@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>
Cc: daniel.baluta@nxp.com,
	simona.toaca@nxp.com,
	goledhruva@gmail.com,
	m-chawdhry@ti.com
Subject: [PATCH] dt-bindings: sound: Convert TI DA830 EVM audio to DT schema
Date: Tue, 11 Aug 2026 09:17:03 +0000
Message-ID: <20260811091703.685487-1-egbostina@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Texas Instruments DA830 EVM audio complex bindings
to DT schema.

Signed-off-by: Eduard Bostina <egbostina@gmail.com>
---
 .../bindings/sound/davinci-evm-audio.txt      | 49 -----------
 .../bindings/sound/ti,da830-evm-audio.yaml    | 83 +++++++++++++++++++
 2 files changed, 83 insertions(+), 49 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/davinci-evm-audio.txt
 create mode 100644 Documentation/devicetree/bindings/sound/ti,da830-evm-audio.yaml

diff --git a/Documentation/devicetree/bindings/sound/davinci-evm-audio.txt b/Documentation/devicetree/bindings/sound/davinci-evm-audio.txt
deleted file mode 100644
index 963e100514c2..000000000000
--- a/Documentation/devicetree/bindings/sound/davinci-evm-audio.txt
+++ /dev/null
@@ -1,49 +0,0 @@
-* Texas Instruments SoC audio setups with TLV320AIC3X Codec
-
-Required properties:
-- compatible : "ti,da830-evm-audio" : forDM365/DA8xx/OMAPL1x/AM33xx
-- ti,model : The user-visible name of this sound complex.
-- ti,audio-codec : The phandle of the TLV320AIC3x audio codec
-- ti,mcasp-controller : The phandle of the McASP controller
-- ti,audio-routing : A list of the connections between audio components.
-  Each entry is a pair of strings, the first being the connection's sink,
-  the second being the connection's source. Valid names for sources and
-  sinks are the codec's pins, and the jacks on the board:
-
-Optional properties:
-- ti,codec-clock-rate : The Codec Clock rate (in Hz) applied to the Codec.
-- clocks : Reference to the master clock
-- clock-names : The clock should be named "mclk"
-- Either codec-clock-rate or the codec-clock reference has to be defined. If
-  the both are defined the driver attempts to set referenced clock to the
-  defined rate and takes the rate from the clock reference.
-
-  Board connectors:
-
-  * Headphone Jack
-  * Line Out
-  * Mic Jack
-  * Line In
-
-
-Example:
-
-sound {
-	compatible = "ti,da830-evm-audio";
-	ti,model = "DA830 EVM";
-	ti,audio-codec = <&tlv320aic3x>;
-	ti,mcasp-controller = <&mcasp1>;
-	ti,codec-clock-rate = <12000000>;
-	ti,audio-routing =
-		"Headphone Jack",       "HPLOUT",
-		"Headphone Jack",       "HPROUT",
-		"Line Out",             "LLOUT",
-		"Line Out",             "RLOUT",
-		"MIC3L",                "Mic Bias 2V",
-		"MIC3R",                "Mic Bias 2V",
-		"Mic Bias 2V",          "Mic Jack",
-		"LINE1L",               "Line In",
-		"LINE2L",               "Line In",
-		"LINE1R",               "Line In",
-		"LINE2R",               "Line In";
-};
diff --git a/Documentation/devicetree/bindings/sound/ti,da830-evm-audio.yaml b/Documentation/devicetree/bindings/sound/ti,da830-evm-audio.yaml
new file mode 100644
index 000000000000..b4a1cf67582b
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/ti,da830-evm-audio.yaml
@@ -0,0 +1,83 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/ti,da830-evm-audio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments SoC audio setups with TLV320AIC3X Codec
+
+maintainers:
+  - Eduard Bostina <egbostina@gmail.com>
+
+properties:
+  compatible:
+    const: ti,da830-evm-audio
+
+  ti,model:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: The user-visible name of this sound complex.
+
+  ti,audio-codec:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: The phandle of the TLV320AIC3x audio codec
+
+  ti,mcasp-controller:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: The phandle of the McASP controller
+
+  ti,audio-routing:
+    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
+    description:
+      A list of the connections between audio components. Each entry is a
+      pair of strings, the first being the connection's sink, the second
+      being the connection's source. Valid names for sources and sinks
+      are the codec's pins, and the jacks on the board (Headphone Jack,
+      Line Out, Mic Jack, Line In).
+
+  ti,codec-clock-rate:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: The Codec Clock rate (in Hz) applied to the Codec.
+
+  clocks:
+    maxItems: 1
+    description: Reference to the master clock
+
+  clock-names:
+    const: mclk
+
+required:
+  - compatible
+  - ti,model
+  - ti,audio-codec
+  - ti,mcasp-controller
+  - ti,audio-routing
+
+anyOf:
+  - required:
+      - ti,codec-clock-rate
+  - required:
+      - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    sound {
+        compatible = "ti,da830-evm-audio";
+        ti,model = "DA830 EVM";
+        ti,audio-codec = <&tlv320aic3x>;
+        ti,mcasp-controller = <&mcasp1>;
+        ti,codec-clock-rate = <12000000>;
+        ti,audio-routing =
+            "Headphone Jack",       "HPLOUT",
+            "Headphone Jack",       "HPROUT",
+            "Line Out",             "LLOUT",
+            "Line Out",             "RLOUT",
+            "MIC3L",                "Mic Bias 2V",
+            "MIC3R",                "Mic Bias 2V",
+            "Mic Bias 2V",          "Mic Jack",
+            "LINE1L",               "Line In",
+            "LINE2L",               "Line In",
+            "LINE1R",               "Line In",
+            "LINE2R",               "Line In";
+    };
-- 
2.43.0

