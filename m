Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABD421A2547;
	Fri, 14 Jun 2024 18:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.152.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718390217; cv=none; b=Y76ynjXOPcKWXqDch65bGevYm6rr4PNXl6Ml+f784jEGwvVJwCgKqFBHqso/E/wFNVy44qeSjODNdHj3ws7STMV+Wtp00+AtyakKc+CI0dw0NaE8AzMwJba6elmw4kUHXVQwBzt4DZk+gSB53JKA+5A+zu61bf5vk3EfhtXv140=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718390217; c=relaxed/simple;
	bh=+gUmHx/ZY7x3Xe0H6FUO+/M1RfSsjc2lrOfgaD81jd8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=tQDG6siXestmRB7dIh6KkcwV5y/LZMLD0u3pcT7NM35QTZNGDDyodZtrVEhnoA8qPqaC9SSyyN84guzsQfe6kFEcVMA3qdfA1chuU9rlLRd8EOTd8IuXysfPvtVqfPZy1krby9/2rsmGlExmEXFO5yuyNlfSIARl6S9ignK7UeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=YJD974pd; arc=none smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="YJD974pd"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45EBpu0o011763;
	Fri, 14 Jun 2024 13:36:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=YLbCV4xTCqcP76ij
	RvYtVoVP3uBmGuHUKxj5VPQAscg=; b=YJD974pdqhY7MdRrrCUeA4hnosGL+6hA
	MJbcwQmBaj7L1ivjppR/tWRyNfmv82vQvhFsjziMY7AAqpIspnMMMGyy7iuVrlW7
	sEvaoeT/MMjGf3Ko3p1OMPKx90sMsGnYWRmWQn6YE2Gh7v0cc/o1CSjxUDUxAaQz
	V76/VEH13fspFqTztwx9RrL3Tay0104SUBQTrYe+XxcNyQy97usLU/tGMgupnPli
	9MST1UyQOazJlF/amSzD5XIQige70tkYb352grZN9/j7iPVnlyUUZDy9dMWwWjvv
	RXT9+Yi1iWv9A2YPuxwNdoV/suYIgZyHdT4vocjpgmPo3brJxnTPbg==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3yqb8ejvqj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Jun 2024 13:36:38 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 14 Jun
 2024 19:36:36 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Fri, 14 Jun 2024 19:36:36 +0100
Received: from paulha.crystal.cirrus.com (paulha.ad.cirrus.com [141.131.145.123])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 223B4820248;
	Fri, 14 Jun 2024 18:36:35 +0000 (UTC)
From: Paul Handrigan <paulha@opensource.cirrus.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <linux-sound@vger.kernel.org>,
        <patches@opensource.cirrus.com>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <devicetree@vger.kernel.org>
CC: Paul Handrigan <paulha@opensource.cirrus.com>
Subject: [PATCH v2 1/2] ASoC: dt-bindings: cirrus,cs530x: Add initial DT binding
Date: Fri, 14 Jun 2024 13:36:31 -0500
Message-ID: <20240614183632.861575-1-paulha@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: Y6fjkybM0V7-ayRv6xUhqZ69Plc4UU3p
X-Proofpoint-GUID: Y6fjkybM0V7-ayRv6xUhqZ69Plc4UU3p
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
index 000000000000..aeecc8e95854
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
+        cs5304: cs5304@48 {
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

