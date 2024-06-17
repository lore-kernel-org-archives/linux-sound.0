Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E76516B381;
	Mon, 17 Jun 2024 19:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.149.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718650874; cv=none; b=HLePXtdcK6HZK385HHVsCweJhnDpUKNAYgVirGGkcAJp6LZ51F2lHGiVipYl3CRv8HCqneAFcfsR2rULGBlqpWnGpXYUAKMktEVVWebYmFeWOMEcHRT1EVXTeJq/CwkARjX3id2vRrlxnuF0pRXXx8YYVvnRAcwRZ0SUOv3O4ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718650874; c=relaxed/simple;
	bh=skpsOSZi0nbkWCyNnO0Pog+L00y79wFqx6f36YDepKg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=bz5TXPDpsFKMHTFKKGuGsioJViwy7B0IpE1anWNzF/qxfhuT0BiXSaC1B61rGuY3KGWRvVI3iu/gmqJVPdW9uYb9mehPmVIc7CSxQIQfIwOq5VBr14KxhYq2CERTvQRz13fYe16qSAbxDqj2CGV3yYJdSw6DgBEYPgTHqYdj8cM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=ULX/EEa2; arc=none smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="ULX/EEa2"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45HFY6N4018222;
	Mon, 17 Jun 2024 14:01:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=Mz04b7nV+YBls8P5
	YFg8WmdCR2Q5o0RYtbPTU845Hpk=; b=ULX/EEa2sHm2LAV17kyDECeK5qwNWiqc
	ussWEuhOHSQAnOo7uGlprdgNPdbFA5KyvFAoQib9cGZm/eSeOH7GOZzhp2uBtSmY
	NVB66TtRKyWQo65/D8O6f8uY+quWwm84IByorsTwEtMpIgij2aMuFViB5V63N3h4
	t9pcLoMjj4MreGQnMGCdJesGgqAHv0BYnoZEua6SMGDOqr62Dz7FS+DuMWs4nn0N
	YG24E89Pf+wQvLNOe7U0rNv0YIFTv7mw3FrGbkXo/RGtKSocHkhQbcJo7hvZ9GWa
	7xC2p+41fpx9ce8sDYzeyAgYiu+7Q0ZmZuy4S46R2AcHnCWx6bEk9g==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3ys8by22vc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Jun 2024 14:01:08 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 17 Jun
 2024 20:01:06 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Mon, 17 Jun 2024 20:01:06 +0100
Received: from paulha.crystal.cirrus.com (paulha.ad.cirrus.com [141.131.145.123])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id C5DF3820248;
	Mon, 17 Jun 2024 19:01:04 +0000 (UTC)
From: Paul Handrigan <paulha@opensource.cirrus.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <linux-sound@vger.kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <devicetree@vger.kernel.org>, <patches@opensource.cirrus.com>
CC: Paul Handrigan <paulha@opensource.cirrus.com>
Subject: [PATCH v3 1/2] ASoC: dt-bindings: cirrus,cs530x: Add initial DT binding
Date: Mon, 17 Jun 2024 14:01:01 -0500
Message-ID: <20240617190102.1010597-1-paulha@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: fVN0jVIBg7Sk2dr1TVwo-D6JxU8XoCrR
X-Proofpoint-GUID: fVN0jVIBg7Sk2dr1TVwo-D6JxU8XoCrR
X-Proofpoint-Spam-Reason: safe

Add the YAML DT bindings for the cs530x high performance
audio ADCs.

Signed-off-by: Paul Handrigan <paulha@opensource.cirrus.com>
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

