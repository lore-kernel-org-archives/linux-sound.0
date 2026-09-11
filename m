Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DAFB4446E6
	for <linux-sound@vger.kernel.org>; Fri, 11 Sep 2026 08:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789114896; cv=none; b=Dy+mpGrfPHNrjKEykqangDKOJ4BM+Y8+j/i7OJoKDhaJdn80HLpKdfHfq5LgNjF5tUzeJjXMmndy8xKdETuYBPSUT7a7NUKvybj0inVfGBmvnTLSuAIIeQ6Ryxac6h1ayKRvGvjHnhmcbw1UnxQqN4BY/Cm/NFujQpwxxSw9L5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789114896; c=relaxed/simple;
	bh=mwkLRTFPxbfx/aCfkpcg51GVVHCgt7ycr1rCcEhiNDo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RSCvC/IEv5jCoJJscR3MfgHYzCqQVxh8QqUmD6UcyQpkNAsq4/s6A4duTVPwHu2VMKMdry5E38DKdpMOiif0fXarcAaix2526vIO+q9rZ7F1TYIwmMMxszMd0LrC+y8l4i8vw1fnVCji5VDXlGNRQE1BQuIvip7SAMzyfbbZz1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W/XxxEJN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Btmi3y6B; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W/XxxEJN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Btmi3y6B"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B7kp9j3017232
	for <linux-sound@vger.kernel.org>; Fri, 11 Sep 2026 08:21:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Oy4TzhqSJ/D
	vWDw+eqBd+EceR40UC6PEjoMrpbwGDes=; b=W/XxxEJNoAeJNvZ337GB9TlInf8
	wA54YGHHFFC/Os0G7DNNqCb7dDQUVhOfGdm82SXtwu0vdxNOq1+BRGVamzPMkBnW
	UaRa6tAMPREMP88s3qqwatRTI6ltF54mfCjvJi8y3EgUmhZdkXqs0Dcb2Pf4wq0V
	+8h85WAUUR2l9AYdmySD1tAszdCTNz+vEjKl1gcXn6+3epbP6TKZxQabzPj6p51B
	xWfFmKs5VaS1EL5HXdf7aYrcR/17QCCwcN79kyQLp3TcbOGvTwnLHRARnEKWE+7z
	0YwkNzNGuieKkVMs242oINfp4G55WGCgFzfC9VopUpKD/Agn/p8kXAFcDJA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkwvx474w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 11 Sep 2026 08:21:34 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-939f3426a7cso35354685a.0
        for <linux-sound@vger.kernel.org>; Fri, 11 Sep 2026 01:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789114893; x=1789719693; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Oy4TzhqSJ/DvWDw+eqBd+EceR40UC6PEjoMrpbwGDes=;
        b=Btmi3y6Bpvqt8Wu84JKT14xjHCjNb5Y6+aiT9uw4egNWmsmBuv+Z8T1iD+h0hfa7s8
         1IqGzgIVysU0YID9sxrkONW+O2akj0VlyZSNxG3obEOwmxc3s1+TLJzK+CXH3iKluVSQ
         6xtA7JZqFILQM7eqLujOsouYFn4rriMqlX/zamjRncH87c/yCJxuud5XFUdqh95lyQ/k
         p5Bq7zhR9HVBJbOrj1i9v3j4ho21jpHN0Mp17B1F1RdH3q1T+/TePl3trraNza94Ep40
         Vk5O486RBT3MhOyD9nkChdbAHOzkB+Vc6clIKy8FLHGCn8aZdz9FjuHBwMuyBAs2TH5L
         /fnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789114893; x=1789719693;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Oy4TzhqSJ/DvWDw+eqBd+EceR40UC6PEjoMrpbwGDes=;
        b=hARAQSB35PssKOHDhTGdw2FXZF8rgYqIdDvFk27s+nsEx2p79dy2zti5H78TsSw179
         y/UFlcrYxlosowU/TuzKh+n8hW1s9okoCc0aDwMoGWdyTsL80iVbWVHFwsFNzJ4cm1Md
         mnaPJ3Foos8w/mRgsdYz95tK2S+Q4hCPGb5lJDxDC8YRTM+YxjDDeh0FTlCUn+vOdR+W
         9aid6h3H8n7Hl/JE1H/SEq6FGD7NR+dLdduUG1+JoCOk1aBwuJfkrFSfgNF+pmPheoaU
         qmC5A7yGBS5laibwCfg8ZiC/Zj4Ncsy0wyNCMZmp5J3PRxee+K704l/icUgXNaKuMuO1
         n/EQ==
X-Forwarded-Encrypted: i=1; AKwUvBwN0Agl5WysYKpAdbm6F4HQJFZxMA98MezTeGiJ/ETCFDtMTXDgWTog+viasjHiloZJ4/KSUB/4LAW84A==@vger.kernel.org
X-Gm-Message-State: AFuF++kiW9T4ZE5q4J8nFrNFy4vOvqqPdgyASn5rt+d+JLmq1L9D4UGH
	TXC4u8uUSNOB19yhnOPOvXJXdm6dqwhL7HYcBAOJ8+rjM+N7xdDMKoC2lekvQrithqIgPBE+eAz
	4gcgPb8szC+OTehPv8k2rHsLwsOHrjFJ1eAd6nyKH46OgIvt3vRoNr51iCbYQQp/lhA==
X-Gm-Gg: AYBFou0XlAPvogQFpl8ZqOo5CyvFDEKR+87B8kKeBahokKJNUTtm/lJDcl/IwHDS8ee
	bksPQ1qy2l8tt935+bkaMHOnPaYM2DIKpe/KODxnxRF97ncCO0SlYgJXIWEybgi27m5lXTUdxn+
	uIGSNlPyk0wQzThIkX3cNzJ26yTql5PIcOEc9Pk6kocox8fdGgVUxeHrkBPznwp7jvICDUQHMEb
	bZSPFA8D6c6TmPsKMAHbkh5BbaSqB4jUp+iFsCZlw4Jjp2mZPv34cbaffbrJQcxrnYwNjM1Xh6g
	IQD0stHSOcHcxrDnvIorQse3s3i45ndX7GMUoomEj5WvzaD+1aGd5y/jZW9gtWEA/dtmmaNXNmI
	uGHHiMGz4ubO6xg==
X-Received: by 2002:a05:620a:19a4:b0:939:d459:4810 with SMTP id af79cd13be357-939ea13c59bmr382467785a.26.1789114893509;
        Fri, 11 Sep 2026 01:21:33 -0700 (PDT)
X-Received: by 2002:a05:620a:19a4:b0:939:d459:4810 with SMTP id af79cd13be357-939ea13c59bmr382462785a.26.1789114893005;
        Fri, 11 Sep 2026 01:21:33 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb34e608sm4488880f8f.23.2026.09.11.01.21.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 01:21:32 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: robh@kernel.org, vkoul@kernel.org
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, srini@kernel.org,
        yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        prasad.kumpatla@oss.qualcomm.com, jingyi.wang@oss.qualcomm.com,
        sibi.sankar@oss.qualcomm.com, quic_srivasam@quicinc.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 1/3] dt-bindings: soundwire: qcom: describe multi-master
Date: Fri, 11 Sep 2026 09:21:09 +0100
Message-ID: <d7b3d0618f20d18f714217d9604a7c09a3539578.1789114385.git.srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1789114385.git.srinivas.kandagatla@oss.qualcomm.com>
References: <cover.1789114385.git.srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDExNiBTYWx0ZWRfX18GXb3hTD9ct
 T2qEZOj6FhArXquZgBiEfhhg6id8xRNYGq6EpwFZY6DomtYzqoDnEdn3w4lYoJBAze4qUfscni1
 X8KLZJ1Z8lz/Mq0maalNG6N4WJw61eTlZxXHZk2vBg8F91wKoM90OSLOddNftyrq2eWyebLClb8
 +7K4KqYrafTLqCVb2SgnN+hA+YuHBHAVx2tvodUYP0azdBhCcOVVVniDUckkSlcwNR513Xr/nvg
 xaPQHdh/Mf53Jue5pwSFmtqXLjfLCb9AsuZ/L5HhAen/CBRquvR2vwq9ukODROTPTcEuD4HeiYQ
 U5SwUPFBWpfeXbpUPdA1IeIA1HsvHKocQm4fpN1G94tbj9DMknCLfQblvhN2lfAUmZbW+OW//bO
 EP/G8aLF6Bbbao37czVbvDTnLdia8yZbpYq/9E6TMNeRphv2PO6ZvfQsMX09B2Jzhd8mWPVG26M
 lcSVqYG7/cqpVDcixPA==
X-Proofpoint-ORIG-GUID: Xt7dpWHNmfq4bp46XgV6t34L7rrEeyyR
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDExNiBTYWx0ZWRfXwYCvcFD2Fgqp
 008W7o9N55tRyFULlNFLpUcPr7fCswlMcf4CkYzQwzZ3Bra5a05Zc22EZ9YYhpeuh2DIhoHclyS
 VIEZeHG38nYioJgxQkhNc9/EWI4osG8=
X-Authority-Analysis: v=2.4 cv=AdkkjHXG c=1 sm=1 tr=0 ts=6aa3ba0e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=Na-TPb6K_91XsI5DB0sA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: Xt7dpWHNmfq4bp46XgV6t34L7rrEeyyR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110116

v3.1.0+ Qualcomm SoundWire IPs can be paired to expose one logical
bus with more than two DATA lanes. Add the two properties that
describe such a pair:

  qcom,multi-master-mode  role in the pair ("primary" or "dependent")
  qcom,multi-master-peer  <phandle, bus-port-offset> to the other IP

Both nodes carry both properties.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 .../bindings/soundwire/qcom,soundwire.yaml    | 109 ++++++++++++++++--
 1 file changed, 100 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml b/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
index 8e6973fa229c..6cf3285ded92 100644
--- a/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
+++ b/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
@@ -215,6 +215,36 @@ properties:
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
 
@@ -224,21 +254,82 @@ required:
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
+  # Multi-master dependent: contributes DATA lanes
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
+        qcom,ports-ch-mask: false
+      required:
+        - qcom,multi-master-peer
+        - num-lanes
+
 unevaluatedProperties: false
 
 examples:
-- 
2.53.0

