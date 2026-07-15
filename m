Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A8723A8732;
	Wed, 15 Jul 2026 11:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784116373; cv=none; b=a/lhGWubkvcrZ+wEMBuqlqt4Q5h1mhyaoB0LVplNVF28rL1rnp4aQgoPNBsDBpUdT9gLFmdKue3YfuKqOXe3KihVeTdeYHSJ8qJGATw2On8GeROtRVtCr6Pu111G7QF8L5fF6K2LJqrgpq+QxMbSBRKyxSPMCX+OcpbZUNZ+dYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784116373; c=relaxed/simple;
	bh=2/UA3A4dNRTai9jUMylCT6RX2WMBL8lFvZ+hHe7BAdY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=b9sVronh+DiaUn/nkTVtx1tlM7Ow6GsF3oNMw0qC+fFkIbMhO9uWwRdJ8AYj5Rud2R5IObpzRKMnp9rIe70hBsiVDlxWkvWGHzz0wnMHBl9mR2fKeABORp3a2aWGRUOc0+NlqcvHNlZFCfENsBgnn2SdvJTod9SshouTNF4Wy6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PhrIX+bl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PhrIX+bl"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66FBdXWe3697960;
	Wed, 15 Jul 2026 11:52:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Qzd/SAwvbaS
	u3/TUTHt/RkFCFvT7jgyUzlMSqLzK3+E=; b=PhrIX+blaPXkGCO+V43bcvZ7tP2
	KZhKGcCBWU8+6brjsyC1ApjQfHjlCHd868HqbgI74M7jI7QWEypPC5UZnuhQ+Rod
	vbvd1iEDyUx/7dZFWOz/ePgeAVasl6RQmpFYPb6NH2moQ9HmugkYVdOdoqq7p/O4
	g7NQPahJq66+KMBEOpsdinRrNqRvBYjlN4qjJqbhWO7R95kvvvK4qh+yiWQBlz9p
	d5lStTCaHLIW8ihJfcR73X3d8WpoV4PWOooYqccC4eNNhKFuRzyxjZm1fkanr3gL
	i5rheYWK1+/IcmqZyrj79ZmWBujLws09Km/ePos+ntRZsVopD3uxvmuWV4A==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fe03vj548-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Jul 2026 11:52:39 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 66FBqYDO021445;
	Wed, 15 Jul 2026 11:52:34 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4fbewk6ngd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Jul 2026 11:52:34 +0000 (GMT)
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 66FBqY4d021430;
	Wed, 15 Jul 2026 11:52:34 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-pkumpatl-hyd.qualcomm.com [10.147.245.204])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 66FBqYAc021421
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Jul 2026 11:52:34 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3914174)
	id 2D04F5FF; Wed, 15 Jul 2026 17:22:33 +0530 (+0530)
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Philipp Zabel <p.zabel@pengutronix.de>,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v4 1/2] ASoC: dt-bindings: qcom,wsa8855: add Qualcomm WSA8855 speaker amplifier
Date: Wed, 15 Jul 2026 17:22:19 +0530
Message-Id: <20260715115220.3093799-2-prasad.kumpatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260715115220.3093799-1-prasad.kumpatla@oss.qualcomm.com>
References: <20260715115220.3093799-1-prasad.kumpatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Authority-Analysis: v=2.4 cv=Ife3n2qa c=1 sm=1 tr=0 ts=6a577487 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8
 a=PrSW79t9vC0gYNWULBgA:9 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: G_ateYd4VnPKaZmbu07YV9rh6IQLa3z8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDExNyBTYWx0ZWRfX6oxYksGAoync
 vHbd9lq0nTk7qIfvMdE4YQoJY0LvN78mO6Ijj2J1yDYaDfIQzRPED9Of0LqTZugGxm7PhAUeD80
 XCdr/qW6nrLNFsAnbKzmkAagBK5nvYpEtJb9JgBsqytR/WLroGGX6nLiUQn3musZi97LSL2LJqb
 b7B4CTs57QngShhUnV7mxQwvVYdhAJnzWcsUFW8eJfFXx6ZocZ7XfRIQogXnxIck/EPvT27KFBe
 pyEXB7SvrrZ9zMfhWiMuIzwyssUHCjanrAUoJQ3DtErfPwkyPAWIlswArd9enV9N4OE0zK2d3K6
 JWE5qM2yQhsbwxqHqdX7BjYfspw6JT/kMzYjUhK+BBe12nxN0gP8YFUhEZvkT8ziQsCB8zVsQuA
 GKNHhALDhvIGtgOhNTHGBEP2TiYHZEbVb39Q2d6/IWRE+RzT8P07+mO7R1xBMZJ307edOHQb6VB
 zmRh1SRkVeVQRQKUIMg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDExNyBTYWx0ZWRfX7W+cfUye43qb
 /EH5hDDu8q7tJXjThje2MZfGsOgMJJTcfcYYy1UYFINX3HdQq/41E68DE5fvsDoFH/TGfRvBI13
 yothO/2HKs2Q1X3HxbjV5yZOJy2o42g=
X-Proofpoint-GUID: G_ateYd4VnPKaZmbu07YV9rh6IQLa3z8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 bulkscore=0 clxscore=1015 adultscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607150117

Add bindings for the Qualcomm WSA8855 stereo smart speaker amplifier.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
---
 .../bindings/sound/qcom,wsa8855.yaml          | 93 +++++++++++++++++++
 1 file changed, 93 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,wsa8855.yaml

diff --git a/Documentation/devicetree/bindings/sound/qcom,wsa8855.yaml b/Documentation/devicetree/bindings/sound/qcom,wsa8855.yaml
new file mode 100644
index 000000000..00a6a05e9
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/qcom,wsa8855.yaml
@@ -0,0 +1,93 @@
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
+  - Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
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
+  reset-gpios:
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
+  - interrupts
+  - vdd-1p8-supply
+  - vdd-io-supply
+
+oneOf:
+  - required:
+      - powerdown-gpios
+  - required:
+      - reset-gpios
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

