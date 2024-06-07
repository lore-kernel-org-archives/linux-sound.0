Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2BE914E2FF;
	Fri,  7 Jun 2024 20:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.149.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717792056; cv=none; b=njZGxytwHPjGLMAzlidDob3U0ESvAjS4/wNpDDL8AZ+kIhjWQjQEHnunaXvoWs3u/DFOGws+/TkLyJFPWhnn38TpT3xWqcr7kV281TQSJi7zmi2I/nIJoffiqAQEPMKPb5CYsmt6qoL/LEDnV6mjXD+7Aa5pH6y285GUUFqrYTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717792056; c=relaxed/simple;
	bh=JpEBPDgpCGTWH1dEiFrbd976U1Hf8EOYIq6DrbCmf6U=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ePLmPhFVgLQhDAkBj0eFUgKAEcYs/ZFiG1dvRAzrmPHx7yhXVDHWVV0M64rrcOd3aEHs6ShmFioDbAaHyt7tRes3C27755P9SkKTUVbqa9R7dYhuJCY2nj4TwulvvoIj2AHxAhvWb/Nl05dxeyj98vg0YtDHSMTIN74HQetMRj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=lWuQe+u5; arc=none smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="lWuQe+u5"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 457HDVEu011571;
	Fri, 7 Jun 2024 15:27:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=JE0VDkAXzyuYXh6/MP+K3+9qzgp2TAUvCiQjoTiYal8=; b=
	lWuQe+u5ewFND88bumhB09znVaG82sdb9ipMdNfyfq7Wsco1p9r+z/GIKyaG5ea/
	LNxGuTuEzHlTS8lSTF1VRaqq3jgwYw80q4Me1fat6K79sm8DK/bO7fIap2xhShej
	atoZcDcQOA5bCkWJkFaUjMWiiSR+FtKJmAeQtLG8zr6nkqckeFRZXU3B7+RwB0ty
	WgIPvmkSn1STBpwi0VyyxFmxjy2mWwnVwdkuKZ05Sp4Kh0DvmdCa/W9yPyirkkn1
	8beIuyatHRh4pAxz0Lc3I7ng3eqWGb3DusttOjDB8TI2HeoieLY5IzxJ9d1ZLumv
	5hJ5JXRl8vsQfk17PrKm8A==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3yg11xxvcr-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Jun 2024 15:27:24 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 7 Jun 2024
 21:27:23 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Fri, 7 Jun 2024 21:27:23 +0100
Received: from paulha.crystal.cirrus.com (paulha.ad.cirrus.com [141.131.145.123])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 9AC5B82F2A1;
	Fri,  7 Jun 2024 20:27:21 +0000 (UTC)
From: Paul Handrigan <paulha@opensource.cirrus.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <linux-sound@vger.kernel.org>,
        <patches@opensource.cirrus.com>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <devicetree@vger.kernel.org>
CC: Paul Handrigan <paulha@opensource.cirrus.com>
Subject: [PATCH 1/2] ASoC: dt-bindings: cirrus,cs530x: Add initial DT binding
Date: Fri, 7 Jun 2024 15:27:07 -0500
Message-ID: <20240607202708.335752-2-paulha@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240607202708.335752-1-paulha@opensource.cirrus.com>
References: <20240607202708.335752-1-paulha@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: oXiDhI8fArYhIFJcgnrY-BrmCrqErkIB
X-Proofpoint-ORIG-GUID: oXiDhI8fArYhIFJcgnrY-BrmCrqErkIB
X-Proofpoint-Spam-Reason: safe

Add the YAML DT bindings for the cs530x high performance
audio ADCs.

Signed-off-by: Paul Handrigan <paulha@opensource.cirrus.com>
---
 .../bindings/sound/cirrus,cs530x.yaml         | 83 +++++++++++++++++++
 1 file changed, 83 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/cirrus,cs530x.yaml

diff --git a/Documentation/devicetree/bindings/sound/cirrus,cs530x.yaml b/Documentation/devicetree/bindings/sound/cirrus,cs530x.yaml
new file mode 100644
index 000000000000..a4e2493ff03e
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/cirrus,cs530x.yaml
@@ -0,0 +1,83 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/cirrus,cs530x.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Cirrus Logic cs530x family of audio ADCs
+
+maintainers:
+  - paulha@opensource.cirrus.com
+  - patches@opensource.cirrus.com
+
+description: |
+  The CS530X devices are a family of high performance audio ADCs.
+
+properties:
+  compatible:
+    enum:
+      - cirrus,cs5302
+      - cirrus,cs5304
+      - cirrus,cs5308
+  reg:
+    maxItems: 1
+
+  '#sound-dai-cells':
+    description:
+      The first cell indicating the audio interface.
+    const: 1
+
+  reset-gpios:
+    maxItems: 1
+
+  vdd-a-supply:
+    description: voltage regulator phandle for the vdd-a supply
+
+  vdd-io-supply:
+    description: voltage regulator phandle for the vdd-io supply
+
+  cirrus,in_hiz_pin12:
+    description:
+      Sets input channels one and two to high impedence.
+    type: boolean
+
+  cirrus,in_hiz_pin34:
+    description:
+      Sets input channels three and four to high impedence.
+    type: boolean
+
+  cirrus,in_hiz_pin56:
+    description:
+      Sets input channels five and six to high impedence.
+    type: boolean
+
+  cirrus,in_hiz_pin78:
+    description:
+      Sets input channels seven and eight to high impedence.
+    type: boolean
+
+required:
+  - compatible
+  - reg
+  - "#sound-dai-cells"
+
+additionalProperties: false
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
+            #sound-dai-cells = <1>;
+            compatible = "cirrus,cs5304";
+            reg = <0x48>;
+            vdd-a-supply = <&vreg>;
+            vdd-io-supply = <&vreg>;
+            reset-gpios = <&gpio 110 GPIO_ACTIVE_HIGH>;
+            cirrus,in_hiz_pin34;
+        };
+    };
-- 
2.34.1

