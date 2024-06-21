Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CE0338DE1;
	Fri, 21 Jun 2024 15:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.152.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718983116; cv=none; b=I8MjaBShDCeFBBLB4P2+J+GywHw8ufzHMB8+vc8SJhi/DJwVIqZtUAB462ofq/eLyAgW2+/HAcBM/JwnHBJZhGFKFfjIgE4EMbGNMRux+ojOrQAb6959e70ubuRVuoX8jxkv9HNJFz/JSQfG5PUBLk1aoOcEIxsDTwS+0/V+Lu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718983116; c=relaxed/simple;
	bh=rlOG0lNsyQIOr9Jz1Y0UGW1bpaJF2XdMsAsWPyak1Ro=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=b3WTcwaCAqFKzZ/TqVLilvhW/AAHiYnXuxwjeT1PH2hl55Otl4ug+dsIOKqL1vEAuPERxf+CgBwh0xIkhxVcRlXDmXFEGEE96EpUxx11ZJGop+4Ooma56O9y9HCMJ5P3cI7doTd1g8FCiIcjUAHF1+ynJ4OO0iWBtZvzAebRUdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=K3Xnwt2M; arc=none smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="K3Xnwt2M"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45L5JQxH023861;
	Fri, 21 Jun 2024 10:18:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=LMBKEKfSSmvPWqykgwDfsEWZlX9hqHxjuMWbs0tTb/A=; b=
	K3Xnwt2MFMjx9VuQBfcm4ps2HmdcETOd7vgbA+QsTN8up6PmqfehiI6lL8BHoPYe
	5taqEyc8l/pSclTsJxenP2/kKGLHCj8/qAnh3KQHJD3lDYNxkm6DHG/IhU47SXJ7
	PYdxJwWXs3/vT5v0VDpq9oXBdhd9qNZONcD0Dq4tQY28Vr5gSoDlxtNB4fTfpBAZ
	JdKG/29/UM6thHixf8Dy9X2SxP/ywA+x2Hk0vkN+CTfxfBkhF/ydNa+ha+GSnE9w
	Zi3pVQf2YLz0KiwTC7hdXDhjJRY4m3K9kweo4xHgdW5ayGcy2fQNV/z0wvTAWxy6
	mUmkL5m3j5SCmck/WFNWWA==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3yvrjk91h5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Jun 2024 10:18:03 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 21 Jun
 2024 16:18:01 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Fri, 21 Jun 2024 16:18:01 +0100
Received: from paulha.crystal.cirrus.com (paulha.ad.cirrus.com [141.131.145.123])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 4A6CA82024D;
	Fri, 21 Jun 2024 15:18:00 +0000 (UTC)
From: Paul Handrigan <paulha@opensource.cirrus.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <linux-sound@vger.kernel.org>,
        <patches@opensource.cirrus.com>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <devicetree@vger.kernel.org>
CC: Paul Handrigan <paulha@opensource.cirrus.com>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
Subject: [PATCH v6 1/2] ASoC: dt-bindings: cirrus,cs530x: Add initial DT binding
Date: Fri, 21 Jun 2024 10:17:56 -0500
Message-ID: <20240621151757.1661265-2-paulha@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240621151757.1661265-1-paulha@opensource.cirrus.com>
References: <20240621151757.1661265-1-paulha@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: w22Ulxfko1d-rQeCUs1LKMsp500KyjlK
X-Proofpoint-GUID: w22Ulxfko1d-rQeCUs1LKMsp500KyjlK
X-Proofpoint-Spam-Reason: safe

Add the YAML DT bindings for the cs530x high performance
audio ADCs.

Signed-off-by: Paul Handrigan <paulha@opensource.cirrus.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/sound/cirrus,cs530x.yaml         | 85 +++++++++++++++++++
 1 file changed, 85 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/cirrus,cs530x.yaml

diff --git a/Documentation/devicetree/bindings/sound/cirrus,cs530x.yaml b/Documentation/devicetree/bindings/sound/cirrus,cs530x.yaml
new file mode 100644
index 000000000000..9582eb8eb418
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/cirrus,cs530x.yaml
@@ -0,0 +1,85 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/cirrus,cs530x.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Cirrus Logic cs530x family of audio ADCs
+
+maintainers:
+  - Paul Handrigan <paulha@opensource.cirrus.com>
+  - patches@opensource.cirrus.com
+
+description:
+  The CS530X devices are a family of high performance audio ADCs.
+
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  compatible:
+    enum:
+      - cirrus,cs5302
+      - cirrus,cs5304
+      - cirrus,cs5308
+
+  reg:
+    maxItems: 1
+
+  '#sound-dai-cells':
+    const: 1
+
+  reset-gpios:
+    maxItems: 1
+
+  vdd-a-supply:
+    description: Analog power supply
+
+  vdd-io-supply:
+    description: Digital IO power supply
+
+  cirrus,in-hiz-pin12:
+    description:
+      Sets input channels one and two to high impedance.
+    type: boolean
+
+  cirrus,in-hiz-pin34:
+    description:
+      Sets input channels three and four to high impedance.
+    type: boolean
+
+  cirrus,in-hiz-pin56:
+    description:
+      Sets input channels five and six to high impedance.
+    type: boolean
+
+  cirrus,in-hiz-pin78:
+    description:
+      Sets input channels seven and eight to high impedance.
+    type: boolean
+
+required:
+  - compatible
+  - reg
+  - "#sound-dai-cells"
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        cs5304: adc@48 {
+            compatible = "cirrus,cs5304";
+            reg = <0x48>;
+            #sound-dai-cells = <1>;
+            reset-gpios = <&gpio 110 GPIO_ACTIVE_LOW>;
+            vdd-a-supply = <&vreg>;
+            vdd-io-supply = <&vreg>;
+            cirrus,in-hiz-pin34;
+        };
+    };
-- 
2.34.1

