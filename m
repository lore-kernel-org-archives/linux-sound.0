Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC61F1AC42A;
	Thu, 20 Jun 2024 14:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.152.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718893767; cv=none; b=Rx2RAfVl6aIhAkBEczP92eplzAfE+WjMzhveYq48rqRVc/oUfhkmiq1AWbgPP4MYudTTP9sHm4MDfwVX9wU515fHkvs3ZbmxR98Qol/Jze92FnlO4DAXZclAagfKkiPQDUXLkjP4oYH2M1kvP4e/02okAgbx/xq3IuqF/OqKrq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718893767; c=relaxed/simple;
	bh=skpsOSZi0nbkWCyNnO0Pog+L00y79wFqx6f36YDepKg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IqgbE55oxjmG/CmWeCvoCXNlDj8EBM+J6PyGtrLylR44AqKYsG+5yhsiUVCo6UjaaH1wtVKZYxXwrub+laXN8t/RmVaNB1gdOW7r+14VBm3SwtIXY0HBwjUWQNVe8RgTR9QAhl0cyIbS4H8dgTa2sh3k6iFSjGfAy2S9YCq7k2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=i3ELg7MM; arc=none smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="i3ELg7MM"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45K5kLY4016004;
	Thu, 20 Jun 2024 09:29:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=Mz04b7nV+YBls8P5YFg8WmdCR2Q5o0RYtbPTU845Hpk=; b=
	i3ELg7MMhOYLaHthtabCCEDPkDNGur5oDksZgJWVIaWHVYzjdx3Q8wevL+CAlStg
	OYvrVQroBv26VWxFOuQ3nImrGcx5pMY2S8RjKcgRSslf/nVk/riRKWs7C1nnRHIW
	I1EAkNYOVANSfR8+qjIv3yJqRdZeM9KJNNTU1B+U0LHdNxJf/Z0JhSdPj7RF04d9
	7UPekPy3UqzLjXU2RwlSXTSt7A4zXrmQL9C/1ohwit3cVnE8f/MSEBDlPPLQ6Rl/
	An2O2Y01VxOs+aDTFnNyA4/xt6DvM5IbmgZqK7PyM0lYHVdji4IkxLXOwWL9Bt/d
	Eqon8xbJ38KKhi86knakMg==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3yujb1229w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Jun 2024 09:29:05 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 20 Jun
 2024 15:29:03 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Thu, 20 Jun 2024 15:29:03 +0100
Received: from paulha.crystal.cirrus.com (paulha.ad.cirrus.com [141.131.145.123])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 31FBC820248;
	Thu, 20 Jun 2024 14:29:02 +0000 (UTC)
From: Paul Handrigan <paulha@opensource.cirrus.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <linux-sound@vger.kernel.org>,
        <patches@opensource.cirrus.com>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <devicetree@vger.kernel.org>
CC: Paul Handrigan <paulha@opensource.cirrus.com>
Subject: [PATCH v5 1/2] ASoC: dt-bindings: cirrus,cs530x: Add initial DT binding
Date: Thu, 20 Jun 2024 09:28:55 -0500
Message-ID: <20240620142856.1609250-2-paulha@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240620142856.1609250-1-paulha@opensource.cirrus.com>
References: <20240620142856.1609250-1-paulha@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: lYkboygkt91RzUXTVj1NE6mAMbBz7mMh
X-Proofpoint-GUID: lYkboygkt91RzUXTVj1NE6mAMbBz7mMh
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

