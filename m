Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795454070;
	b=xG/6fn5wr8W/hzvlmBkNHTTXR8MYpyuyFcjdCWVxLoPT6Ay1CVZKFd4lJjEKNY/usq6t
	 754vWC2jxVm5AIwbiTQsSkJIkHCARVc+mZr+8Blipw16NOwvIQEfMoZ5AWbGGIdM+JzK5
	 +mcLasfx6PGuVexKhQM1DUbDlVLZGGhTAt77JgfCV6rtMjwxjGk0Ze6CF78wae0ovnwBe
	 IdNbtr4GytNriR1szdWFnSCbx2B+ji2VwGjlhhJ9JeJCVz6Ip0CwYG+nQ/+YnAUWmS7hF
	 DMQWtX9XXV3/n8trRWyE0Z8snHmD99wx3mI4qHD4VyDfNjAYpQUoocAf3fdamIQMVlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795454070;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=YX/yv0V3P2Gf3a4ItBVIj3QZG9hetOl05jgxcWamwiU=;
	b=jLGMF9GYSWE5FCKE5VxoJtdd/3NhvfpXJ5em9mT4HUAPp5gsvGSLqVly2ANQIZNqvqBH
	 lW8y5lHhdqcfNsUzWndVZzhS4A6J0pm4Di4M99xd9lM1r/gLWvIdoO6NP2J3rVT4kim76
	 TWtvLHLfdHPuRa3pSW0NkBX8+bCIv64m4kvNjtJqvPprrXTvg/MFnU5I65cYkYZD6awiJ
	 NzNvaaOxSnEfgZKBjt1egHxt6YLdzWyTC9WCsCbHxKWEkmGU3X/th+oCfDP0jsQSQm4bK
	 57/O1d9flQzMr3Dw1h8wza6oYKIxCOcER5/7Hg84fh/eRU83T7qnElL0qwQNt4D6ylw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jh2WOpzI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KxxYSeel;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4121A606A33A
	for <linux-sound@vger.kernel.org>; Mon, 23 Nov 2026 17:14:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4121A606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jh2WOpzI;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KxxYSeel
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGGovG3730237
	for <linux-sound@vger.kernel.org>; Mon, 23 Nov 2026 17:14:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=YX/yv0V3P2G
	f3a4ItBVIj3QZG9hetOl05jgxcWamwiU=; b=jh2WOpzIVcq7s7eXe+X+7He5sue
	HxZao4BfDXPyUIYoLN7EV9o+BOAFH6WZKx66BzvJNxJAn1PI4GEwdsND/0bahUbq
	uSmM4Fp8mAitElcyZ8Nce3PdCShdDGvmnXRQL84NDtEddov3dIrSDntxnldbfNdo
	6vhyYk8N78OTxzyON3UYbUqEkCW1zHVKw3Dk815gt2VvbSICgHJtblvPO6uR57og
	vkNzHNddrZl9hgVOJXzgc7EeL7JUoiJh5ygc5/X8pni9beaZmqTNV7EvWhS4uml9
	nLdjpgjA2EJ/bT9fjPsGxiWs0FsnJeHw8dA7+QRVXxo9orL2j/Gob9Uv1kw==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4fyd2jve-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 23 Nov 2026 17:14:29 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-8b4d1e90b9eso28966207b3.3
        for <linux-sound@vger.kernel.org>; Mon, 23 Nov 2026 09:14:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795454069; x=1796058869; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YX/yv0V3P2Gf3a4ItBVIj3QZG9hetOl05jgxcWamwiU=;
        b=KxxYSeelf5VVhRFe2GAx7nk1FNzeFfWw7S9ziEQ6Pa0Jrv/MEP9rm4J1w83KLodQaH
         +5mKRhcl7i4r1dgb8BAk/5k+R4y8lHJYbtqQJpZ/JO33UsPazbau7SH38bt7ovUupQG9
         IlXf/G7OAcTrL40InMov/6QrNHEg44BWssfQv/+Is7aUN48Y95O/h5QjTr2rZ9OaMWFi
         o8hG06a/Wg/yUOZ1kHq05H9/YbQajNuDtu6WnrDXTJZHVh9OVM2J+CR/eNHnn3ZshR7F
         pxBxEO2S0i4NT6C3sihU2D3TlAh2WpdviaHLlsavMad5KLvNSxT5ivdfOZlyvvs45RPf
         PDZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795454069; x=1796058869;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YX/yv0V3P2Gf3a4ItBVIj3QZG9hetOl05jgxcWamwiU=;
        b=y5K2MHomcRTyu8FJcy/8Byq4bgdU4GmmHSYB1jwsNomn7afH/jxz6awZHUMjgzdSJm
         8087BO4JTiua29FuXm3j1NB72N9h3oCCjHODBhJ+ULrn2bd3CO/axcWJ1EE0M8L0kXEQ
         fFt4BjDi2ueSzz+jujEXZXdjzLY0f6nI5kk3JLrtNL9cxwdjzUsPWUfyhvEZ5kD8/u2f
         NspN5TQJhgNYFRPuLt2B0iYYF4csJDY86F8H2NoTAXAa+Ajea5laLe7VfSv0cSTa8uBE
         kQxLVT4dT7yI+eO2CUrPRo3aaEWqT7LL2kPAD8TElTKwg+yyxOJI0yUVUT+sxaZtZ0fM
         mG0g==
X-Forwarded-Encrypted: i=1; AL+hErErdpBXwbPTaidLqeTgo3+c6A0hR/lt4FGtvQ7g8tv95UNqdC7Hg9qB6lmrBm3KUb879/Kst3WqOysdoQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z9jIs+OpkUwsfxqBHfYBXDFe06dx94Xl9Mo7PEnC2sVSICk9AUr
	RbmQ87/J2RfJ6DyNGVkiX+lFH4YbawQ4HdAgtk6C/hbAUIY6bTWvl6KDeUNwupsI7rSazOSnphR
	twpfunT2OU2d/bz5Mpy+r6T+Km+AgYhfQRnlAyH7FwACfuwymxNF7mKe0oF+Oe26Hmw==
X-Gm-Gg: AZFdTZdByzYg3O8Yuwloekcc0FTVkJq0eY56ASZ4nNA47rOQq9xQmVREC+mm7meppxD
	ifUmbQpFNBYEI74Kzu3yR1cw5AQD26SCvDxu0WfpIzUu+ouisK+3neMyQ4k0byr05ysBwVLXist
	rwimFb+M9mD57rTDZbZfLsR8sIcauvYOMM2j3Ee28LYWrFg6BAtb2W/snLm0wHy+UqygBU0bXqT
	0982HkWNKoFHyefYCrC6vqPQ7beqBxuW+s5u5231OrGJe+Eei4H182xpBlOPnlPzoIrztVPE3ag
	O66mVfLp0p9c9OMwUmSrgkN4ERkGU2U7k+BcaEFEFuWGClbsP61TgGc2AV9ZQlLySdz0cmFr5fJ
	9hmPs5ThJR3/FAzSAK7FsXr65zOv7WB/TNM/tLCIDhqlazynqaHxiKq9LOuvSP8ep
X-Received: by 2002:a05:690c:c86:b0:8b3:4deb:7ce1 with SMTP id 00721157ae682-8b5204403c4mr62991257b3.14.1795454068528;
        Mon, 23 Nov 2026 09:14:28 -0800 (PST)
X-Received: by 2002:a05:690c:c86:b0:8b3:4deb:7ce1 with SMTP id 00721157ae682-8b5204403c4mr62990987b3.14.1795454067996;
        Mon, 23 Nov 2026 09:14:27 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6baa397asm23885443f8f.48.2026.11.23.09.14.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 09:14:27 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>, quic_srivasam@quicinc.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 1/3] dt-bindings: soundwire: qcom: describe multi-master
Date: Mon, 23 Nov 2026 17:14:09 +0000
Message-ID: <20261123171411.444381-2-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261123171411.444381-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261123171411.444381-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 6ATs2UCL-myBxTF8mt6R-KT1LaVIX1yc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA2OCBTYWx0ZWRfXwG6aQANdx7SO
 u34ar73gfVUCRE20vouNZm8DrB+G/BCFlnH45j/ZVU4ULZXAaN36gSRtZGzw+/PX7ktCrHKlVnD
 Q9DK0wBZloG5MizHK0GzV3Kn4umQJdhI2SD1BkbaZgzDyxbiGapp7tnMFyDrJLTLC/0KlYtsfKw
 dk4DyMaEz85GWRA6n31UcxmSYmw/meTHMUhvk3vZ04ItiPCppttipttb4lwQrGhGYqq9ERRUgep
 4OsSsg4uFZF3SZos03jdq4VXU5yvY3Y9U257nZnM44sD+cKZrdqeaz5C5UiCWZ71w03u3b27JnU
 I0dAyiUw4fjJbrw3YPgpVUUm47ChJBvSgD2KqAs8k3513RkhPbvs6wIlAPp63DFQ7lle6bvqetH
 9m/bw68xwmWZQSKB++bP35Yioyw5IJbdcvqw0trPGMUzxHiR06NdUpNHJOiud27UilRzacBwdkO
 MbOExHpJwfp+fpgC+uQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA2OCBTYWx0ZWRfX+3uTfjpguCr6
 lIbmGAanYl132NMG5Uhkmck1EUVNmXOCUAucONpoRtQMboLwaCxImQpIWUtJWzqiQc6uTi0iwrm
 n1n/Ol2C//N9JC8G5cpMCIBgRHgQIUI=
X-Proofpoint-GUID: 6ATs2UCL-myBxTF8mt6R-KT1LaVIX1yc
X-Authority-Analysis: v=2.4 cv=Aol7T+9P c=1 sm=1 tr=0 ts=6b047475 cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=8XpN2xwonMoseNaoR1gA:9 a=kLokIza1BN8a-hAJ3hfR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230068

v3.1.0+ Qualcomm SoundWire IPs can be paired to expose one logical
bus with more than two DATA lanes. Add three properties that describe
such a pair:

  qcom,multi-master-mode  role in the pair ("primary" or "dependent")
  qcom,multi-master-peer  <phandle, bus-port-offset> to the other IP
  num-lanes               DATA lanes each IP exposes locally

Both nodes carry qcom,multi-master-mode / qcom,multi-master-peer /
num-lanes.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 .../bindings/soundwire/qcom,soundwire.yaml    | 108 ++++++++++++++++--
 1 file changed, 99 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml b/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
index 81532cf69dd0..0ba3a979b68c 100644
--- a/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
+++ b/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
@@ -216,6 +216,36 @@ properties:
           maximum: 4
         - const: 0xff
 
+  qcom,multi-master-mode:
+    description:
+      Role in v3.1.0+ multi-master mode. Both nodes set this; the
+      primary owns SWR_CLK, the dependent contributes DATA lanes
+      only.
+    $ref: /schemas/types.yaml#/definitions/string
+    enum: [ primary, dependent ]
+
+  qcom,multi-master-peer:
+    description:
+      Peers in multi-master mode. Each entry is a
+      <peer-phandle, bus-port-offset> pair. Peer N's DPn slots
+      1, 2, 3, ... occupy bus ports (offset+1), (offset+2), ...
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      items:
+        - description: peer phandle
+        - description: bus port offset (last primary-local port)
+    minItems: 1
+
+  num-lanes:
+    description:
+      Number of DATA lanes this IP exposes locally. Required in
+      multi-master mode; on the primary it defines the boundary
+      between local bus lanes (0..num-lanes-1) and lanes contributed
+      by the dependent.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 1
+    maximum: 8
+
   label:
     maxItems: 1
 
@@ -225,21 +255,81 @@ required:
   - interrupts
   - clocks
   - clock-names
-  - '#sound-dai-cells'
   - '#address-cells'
   - '#size-cells'
-  - qcom,ports-offset1
-  - qcom,ports-offset2
-
-oneOf:
-  - required:
-      - qcom,ports-sinterval-low
-  - required:
-      - qcom,ports-sinterval
 
 allOf:
   - $ref: soundwire-controller.yaml#
 
+  # Single-master (no qcom,multi-master-mode): needs port config.
+  - if:
+      not:
+        required:
+          - qcom,multi-master-mode
+    then:
+      required:
+        - '#sound-dai-cells'
+        - qcom,ports-offset1
+        - qcom,ports-offset2
+      oneOf:
+        - required:
+            - qcom,ports-sinterval-low
+        - required:
+            - qcom,ports-sinterval
+
+  # Multi-master primary: drives the bus, needs port config + MM props.
+  - if:
+      properties:
+        qcom,multi-master-mode:
+          const: primary
+      required:
+        - qcom,multi-master-mode
+    then:
+      properties:
+        compatible:
+          contains:
+            const: qcom,soundwire-v3.1.0
+      required:
+        - '#sound-dai-cells'
+        - qcom,ports-offset1
+        - qcom,ports-offset2
+        - qcom,multi-master-peer
+        - num-lanes
+      oneOf:
+        - required:
+            - qcom,ports-sinterval-low
+        - required:
+            - qcom,ports-sinterval
+
+  # Multi-master dependent: contributes DATA lanes only, no ports.
+  - if:
+      properties:
+        qcom,multi-master-mode:
+          const: dependent
+      required:
+        - qcom,multi-master-mode
+    then:
+      properties:
+        compatible:
+          contains:
+            const: qcom,soundwire-v3.1.0
+        '#sound-dai-cells': false
+        qcom,din-ports: false
+        qcom,dout-ports: false
+        qcom,ports-word-length: false
+        qcom,ports-sinterval-low: false
+        qcom,ports-sinterval: false
+        qcom,ports-offset1: false
+        qcom,ports-offset2: false
+        qcom,ports-lane-control: false
+        qcom,ports-block-pack-mode: false
+        qcom,ports-hstart: false
+        qcom,ports-hstop: false
+        qcom,ports-block-group-count: false
+      required:
+        - qcom,multi-master-peer
+        - num-lanes
+
 unevaluatedProperties: false
 
 examples:
-- 
2.53.0

