Received: from mx0b-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA8171EF94D;
	Mon, 21 Oct 2024 13:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729518206; cv=none; b=q31C/rY14OrI7gyb3zLcuybjxnbyUiNhPxvG2cpUqF/CpFixF0IiT2+prcEG0Mqsv7uaQi/8pbum81O9bKeaWyzCoalgiLK3hiFv5+2baBVbSIPfiAk8ibVlR4s8bIuyHv9D9tlgu3rEs8E1gQJY3SxFMxnpN0wlttDdFkMcBmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729518206; c=relaxed/simple;
	bh=K2clbhpui8Incij8sBp5YSICKBkxdYopSR8bCXqtJgE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=gkwGzO00n40YK5R2jF7TYTg5xEzwzy4nC0uyzoqAMHAjj62KD+XIbkYe65QcGUljwL2dndigoT9qL/uHyuBPexXPUWJTJ1G2sL136LfuJ8f0Ch74pLdkkQQM5Fx5OSKcP5FmQ6Jv7Um06IiumVYbwlGd1r33k7ZfZDRlT0Vl05Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=K2agTvZB; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="K2agTvZB"
Received: from pps.filterd (m0375855.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49LA68t2022150;
	Mon, 21 Oct 2024 09:42:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=OxHY/
	QtVSEZ3voaIOZX7qBVpj4NA4iMnNKP5dzM2M6U=; b=K2agTvZBDCh4xDeRKiNUW
	JHLUhSOcTeXYBWYXcl3VE3amgsIS+HZJVHNP4/gmJD+C6AYkpRYyY/1HV0qoATsM
	76fuH2FhzTCB1xm6uOgsYxe/GLUj3FxBCkYmxmJwRFN8vjZUtlxnbvM2A16TB6xY
	9tZkW1cCB46fVa0YOomkyDd2/Dnd4RdrNfwre8/GQ349vbalxJ73neV1RdiID5fQ
	YHStyENBBL1Jjuo1lMS9CpeDVrf9wJzvoX0bjF5tb8b/vXETGloG2wJNbAr037WF
	AVqvv08h73ierKo7Ld588373hEqbFbkAyShi3//ZblCCr5pwLHtNpJsVcpmhxOWO
	Q==
Received: from nwd2mta3.analog.com ([137.71.173.56])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 42dmwhgsg6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Oct 2024 09:42:47 -0400 (EDT)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 49LDge6S055732
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 21 Oct 2024 09:42:45 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by ASHBMBX9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.14; Mon, 21 Oct
 2024 09:42:44 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Mon, 21 Oct 2024 09:42:44 -0400
Received: from [127.0.0.1] ([10.44.3.60])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 49LDgU7Y017079;
	Mon, 21 Oct 2024 09:42:41 -0400
From: Nuno Sa <nuno.sa@analog.com>
Date: Mon, 21 Oct 2024 15:46:46 +0200
Subject: [PATCH 2/4] ASoC: dt-bindings: document the adau1373 Codec
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20241021-adau1373-shutdown-v1-2-bec4ff9dfa16@analog.com>
References: <20241021-adau1373-shutdown-v1-0-bec4ff9dfa16@analog.com>
In-Reply-To: <20241021-adau1373-shutdown-v1-0-bec4ff9dfa16@analog.com>
To: <linux-sound@vger.kernel.org>, <devicetree@vger.kernel.org>
CC: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Lars-Peter
 Clausen <lars@metafoo.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729518408; l=3963;
 i=nuno.sa@analog.com; s=20231116; h=from:subject:message-id;
 bh=K2clbhpui8Incij8sBp5YSICKBkxdYopSR8bCXqtJgE=;
 b=I8VBbFUQCMyEvDtX7TWRsBI37JDyCpT9RcDKzFJtyoHTJrwxywexf0EEpbNXFhZT1gcp8afda
 SXBwNfzkJi9Aw2uoTiXPWhBzrCbQZ6jz5GuwU2iFftuo7EqttlGYReH
X-Developer-Key: i=nuno.sa@analog.com; a=ed25519;
 pk=3NQwYA013OUYZsmDFBf8rmyyr5iQlxV/9H4/Df83o1E=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-ORIG-GUID: riwVDiy9ACFdmUoQGsrVt7CzFXBf1Hy2
X-Proofpoint-GUID: riwVDiy9ACFdmUoQGsrVt7CzFXBf1Hy2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 phishscore=0
 mlxlogscore=999 priorityscore=1501 lowpriorityscore=0 clxscore=1011
 adultscore=0 mlxscore=0 spamscore=0 bulkscore=0 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410210098

Describe the adau1373 Low Power Codec with Speaker and
Headphone Amplifier.

While at it, properly add a MAINTAINERS entry for ADI sound bindings.

Signed-off-by: Nuno Sa <nuno.sa@analog.com>
---
 .../devicetree/bindings/sound/adi,adau1373.yaml    | 102 +++++++++++++++++++++
 MAINTAINERS                                        |   1 +
 2 files changed, 103 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/adi,adau1373.yaml b/Documentation/devicetree/bindings/sound/adi,adau1373.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..b2b5b2226ed7b354f2fb7871c17272b347921fa5
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/adi,adau1373.yaml
@@ -0,0 +1,102 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/adi,adau1373.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+
+title: Analog Devices ADAU1373 CODEC
+
+maintainers:
+  - Nuno Sá <nuno.sa@analog.com>
+
+description: |
+  Analog Devices ADAU1373 Low power codec with speaker and headphone amplifiers.
+  https://www.analog.com/media/en/technical-documentation/data-sheets/ADAU1373.pdf
+
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  compatible:
+    enum:
+      - adi,adau1373
+
+  reg:
+    maxItems: 1
+
+  "#sound-dai-cells":
+    const: 0
+
+  powerdown-gpios:
+    description: GPIO used for hardware power-down.
+    maxItems: 1
+
+  adi,micbias1-microvolt:
+    description:
+      This property sets the microphone bias voltage for the first microphone.
+    enum: [1800000, 2200000, 2600000, 2900000]
+    default: 2900000
+
+  adi,micbias2-microvolt:
+    description:
+      This property sets the microphone bias voltage for the second microphone.
+    enum: [1800000, 2200000, 2600000, 2900000]
+    default: 2900000
+
+  adi,input1-differential:
+    description: This property sets the first analog input as differential.
+    type: boolean
+
+  adi,input2-differential:
+    description: This property sets the second analog input as differential.
+    type: boolean
+
+  adi,input3-differential:
+    description: This property sets the third analog input as differential.
+    type: boolean
+
+  adi,input4-differential:
+    description: This property sets the fourth analog input as differential.
+    type: boolean
+
+  adi,lineout-differential:
+    description: This property sets the line output as differential.
+    type: boolean
+
+  adi,lineout-gnd-sense:
+    description: This property enables the line output ground sense control.
+    type: boolean
+
+  adi,drc-settings:
+    description:
+      This setting is used to control the dynamic range of the signal. The
+      device provides a maximum of three full band DRCs with 13 entries each.
+    $ref: /schemas/types.yaml#/definitions/uint8-array
+    oneOf:
+      - minItems: 13
+      - minItems: 26
+      - minItems: 39
+
+required:
+  - "#sound-dai-cells"
+  - compatible
+  - reg
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
+        audio-codec@1a {
+                compatible = "adi,adau1373";
+                reg = <0x1a>;
+                #sound-dai-cells = <0>;
+                powerdown-gpios = <&gpio 100 GPIO_ACTIVE_LOW>;
+        };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index c1a2c296446c0724a0c6e70c845e5e5e1e693fd5..a3bf361f7b80774ae2228f2d71a3f477eb497ec5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1521,6 +1521,7 @@ L:	linux-sound@vger.kernel.org
 S:	Supported
 W:	http://wiki.analog.com/
 W:	https://ez.analog.com/linux-software-drivers
+F:	Documentation/devicetree/bindings/sound/adi,*
 F:	sound/soc/codecs/ad1*
 F:	sound/soc/codecs/ad7*
 F:	sound/soc/codecs/adau*

-- 
2.47.0

