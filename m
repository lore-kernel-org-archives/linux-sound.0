Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 432BE2D592D;
	Wed,  1 Jul 2026 13:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782914378; cv=none; b=EIZBc7nQ5CxrLW58Xd9egIVxGZv209gBUZ6j5uSN+jjaFGZDANf0RCUd3mejxKsxzOEEL8+EAQcO7aPA6aliL1IYLCeZXiH1PdbChhMfMMKpZ3g2FQkD5mOy5mAHz+IVDiIFqKIsm4EXnbTBudKgKXPo4Zt4H/5LHQhoyeRnF1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782914378; c=relaxed/simple;
	bh=RFFgihqB+zyW5VKSKISTISExBVQkSna6ujyj5DZRIto=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mJRYEb1izDcvEWi9lnB9HkWsfH7CiJyRGGtbVAIfCeq4beYE16Ux3KpqSkRjfurRf2nIwwI8AhlbmB13KnMQH7EwotP9sclD/eFAvZYmTe9/woerFb76vEuzSALEGyJ/Lz5WRDRUNMVqiSdr1o2sQNhRz9qGrP7qUpn1pbwO/So=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E1AqjR9F; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E1AqjR9F"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661A8d7t754643;
	Wed, 1 Jul 2026 13:59:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=A+grOTVFSOr
	cUr5FFtv9JV8llVXbBtvj362qOnpufX8=; b=E1AqjR9FDmJb3oPvDLTQ5JYOsz1
	d/mSAhsmf1N11/4nYiNvevmiXtq09gZcJpmBR+sxBg9Z2rhZojlCSU0bIxVQEPjE
	Go71/MYVFfO8oFntl5loT9PKp8F+rs5JFnHaiW06OX+vvtyzjV9tNlgmLGKBfalt
	X4HcaK4xeiA6eWSMmmOe2w/nsprckzF8IJR7XJR/xHf1glYk2Fj80UO/gSw+vioI
	JCbHS3JmqfU1PRmX6jQTY/I2qe7eeMl78GkcV7h7evLKKeQYYraUS6wTW4V7Ni0Z
	h/YQkcZ0z4T7hkhmQc21EIuw56tkld30nf1Le6ntFDbamYMofPG2EVlw4mA==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f50sqryv7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Jul 2026 13:59:23 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 661DxKCe030997;
	Wed, 1 Jul 2026 13:59:20 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4f27kk260m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Jul 2026 13:59:20 +0000 (GMT)
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 661DxK3w030981;
	Wed, 1 Jul 2026 13:59:20 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-pkumpatl-hyd.qualcomm.com [10.147.245.204])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 661DxK9d030973
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Jul 2026 13:59:20 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3914174)
	id 5AB8A57A; Wed,  1 Jul 2026 19:29:19 +0530 (+0530)
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Subject: [PATCH v2 1/2] dt-bindings: sound: add WSA8855 bindings
Date: Wed,  1 Jul 2026 19:29:12 +0530
Message-Id: <20260701135913.1641328-2-prasad.kumpatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260701135913.1641328-1-prasad.kumpatla@oss.qualcomm.com>
References: <20260701135913.1641328-1-prasad.kumpatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-GUID: _m4F9DzB3yb3jf2y6pPktHoZSfeYE5-_
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDE0NiBTYWx0ZWRfXyVRrymrIWsmq
 w6J2s5VLVIwbeNqH383y9dIKWBbE7DIjOzxzGBoLgpQ+p+hfZGpuBysDh6Bd38atTSfGUitfAho
 U3UUDmCXH60dcjZWQnZvxC1ml4m2hwU=
X-Proofpoint-ORIG-GUID: _m4F9DzB3yb3jf2y6pPktHoZSfeYE5-_
X-Authority-Analysis: v=2.4 cv=ceHiaHDM c=1 sm=1 tr=0 ts=6a451d3c cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8
 a=PrSW79t9vC0gYNWULBgA:9 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDE0NiBTYWx0ZWRfX4DyLn3bri2Nz
 a/fHh8VTJJfIyzWSk75lL4i9Dfo84o1+Cz9C1vD4ylcBNcmc5JMsNzdkp0SLoaBwiYaeQbTSYlY
 KTBB4BO+Jj9ZMb2thrYMG5PIwGy41PfEbHzpfQYHnpq5cBDIwPP9v9klCBnqQP4pAn1dpOJDC7r
 rC1q3ziBAKsOLZhM3igwX+dgl2DC8wD0CzehoQ6xod3gt8oUmgI4zC4AWNWzZ8LWpz1o42EaLwA
 v+K8z86LX5y0q9nhmBydEHLS0X5DoKI2cjUJP4xwwkaF9pctzOmC1pDt/zNuqTAh6sAHfjSMGmQ
 a8gwQop7SSKBmQSo2hPljLb23Wd0hpuzWgxugE/BqfpfkGJpMCRtERINrmDE201jtvarpGy2Lq5
 DdYlTH3NNi9yrzzfWz0trlMvr9N6loPcgOfuoLfItN2lK8iEzEvUKpiX03zbn8hhWZjUJfPiZ5f
 X6v8q7cAFJ0NdtTq5MA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 suspectscore=0 spamscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010146

Document the Qualcomm WSA8855 stereo smart speaker amplifier.

The device uses a PCM audio interface and is controlled over I2C. Add the
required supplies, powerdown GPIO, interrupt line and optional battery
topology property.

Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
---
 .../bindings/sound/qcom,wsa8855.yaml          | 83 +++++++++++++++++++
 1 file changed, 83 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,wsa8855.yaml

diff --git a/Documentation/devicetree/bindings/sound/qcom,wsa8855.yaml b/Documentation/devicetree/bindings/sound/qcom,wsa8855.yaml
new file mode 100644
index 000000000..b0a18ead3
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/qcom,wsa8855.yaml
@@ -0,0 +1,83 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/qcom,wsa8855.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm WSA8855 stereo smart speaker amplifier
+
+maintainers:
+  - Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
+
+description:
+  WSA885X is a Qualcomm Aqstic stereo smart speaker amplifier. It uses a PCM
+  audio interface, an I2C control interface, and a Class-H amplifier path for
+  high efficiency, low output noise, and low idle power consumption.
+
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  compatible:
+    const: qcom,wsa8855
+
+  reg:
+    maxItems: 1
+
+  '#sound-dai-cells':
+    const: 0
+
+  powerdown-gpios:
+    description: GPIO controlling the SD_N powerdown pin.
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  vdd-1p8-supply: true
+
+  vdd-io-supply: true
+
+  qcom,battery-config:
+    description:
+      Battery topology connected to the speaker amplifier. 1S indicates one
+      battery cell in series, while 2S indicates two battery cells in series.
+    $ref: /schemas/types.yaml#/definitions/string
+    default: 1s
+    enum:
+      - 1s
+      - 2s
+
+required:
+  - compatible
+  - reg
+  - '#sound-dai-cells'
+  - powerdown-gpios
+  - interrupts
+  - vdd-1p8-supply
+  - vdd-io-supply
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        speaker@c {
+            compatible = "qcom,wsa8855";
+            reg = <0x0c>;
+            #sound-dai-cells = <0>;
+            powerdown-gpios = <&tlmm 11 GPIO_ACTIVE_LOW>;
+            interrupt-parent = <&tlmm>;
+            interrupts = <77 IRQ_TYPE_EDGE_FALLING>;
+            vdd-1p8-supply = <&vreg_l2g_1p8>;
+            vdd-io-supply = <&vreg_l1g_1p2>;
+            qcom,battery-config = "1s";
+        };
+    };
+...
-- 
2.34.1

