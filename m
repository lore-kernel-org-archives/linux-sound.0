Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 650713E49D8
	for <linux-sound@vger.kernel.org>; Thu,  1 Oct 2026 09:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790847508; cv=none; b=RQpjOMR6Qg8/ZN8Ugt0ewS/D3fIAx8eq9zmUSSba53lK1JBaix0trwhPtehJsY11K2yOIuSdhrg/2CsKVmRx0f2ZnuCN/fvdLhqbxOVZsy0+z8jzzJbWpTMcAzozmhgXQnqFSaupabVJOl+LXOQGFOHV96OkDVD4oNASD9P6/58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790847508; c=relaxed/simple;
	bh=7VlpLtpjbYWqAl4eTeKy2wIA5lhKY5z4WzNabbXSzsc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u5WLXxjCY+9+1iQuuFUasPqi525Oh9Y38p2uuVe7+Lg5XDCWfUKkUvb41YlQEWwYXVrcAVN9QyeMZegdiNUt1vzsb0okPo8z1GLlNiN9OD6i/25rWdp15qHITqbYzs6ojnnZljz7kozWBiKzEfw8kJFoA628sB1cBk4OyHZw1kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MuO3QxWc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DwcIN9MJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MuO3QxWc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DwcIN9MJ"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6916xcQF962504
	for <linux-sound@vger.kernel.org>; Thu, 1 Oct 2026 09:38:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=oFTMP/R24ZD
	GiPr8D12+ouAQVW40apYrHT4rgZ5DgiI=; b=MuO3QxWcE9nOI1N8nRNBTVPoo6Q
	Rkre2666o64voCaHMZ7MiTvbZVqVHmZs4U/1zDXVcnQv5VHV3xNA+G5r0mH6qCMD
	cRhJySyaD9qPuwPv0HQ8dHzRgMKG/ZGp5Z7QbRcF4Dh984kt3iMLonXy5C01Fyn3
	x0miLczd7AbDHoAj5N9OXtpmFn5Gl8UBHreHnnpy2HNqPDNo201yrFNFgnsJ8d8a
	Q/Qhy4ctf+JL2dz4gp592q8+G/CNZApiEpi6OHr02AKTmsUUlQ/cXDXZdapXkqyD
	ao+lYmIXgXjvRt8r1bcAfST8jg1pda1Z4H4kKilBnkL3kSSqMcadrAyFeYA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h16wcucup-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 01 Oct 2026 09:38:25 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-936708f129aso1268259085a.0
        for <linux-sound@vger.kernel.org>; Thu, 01 Oct 2026 02:38:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790847504; x=1791452304; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oFTMP/R24ZDGiPr8D12+ouAQVW40apYrHT4rgZ5DgiI=;
        b=DwcIN9MJL4U0X9RjfrKwj0pY0P2F6RsqKo3xiKg7ZYB+WRiGuKHsSxiIUAVSeVOwuN
         jnqjg8kbaUv/w5wO2YFlVJx0KOBebA4YhWH7YY8gfA2MYIiEKMgzScCH4ClGB06m9Mg5
         KROQxaoxO2GBZI+q8CbOymlWF+hzlhR2P4VSO6l66EcJot9vdTvUQ/53FKhMPz0rBJKe
         K3/RL0dP+s1YoKUKS9GC7d2BldGoMpMG99m9QEnr9Z8+MXh3beGeXnlRvViQmDW0AEiV
         onY55a8PMlibQw+UrGPA4vSknrDaZTmmqttNpywkXmo1NfDxE1POjwlXh/0vdzUirFYt
         KzNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790847504; x=1791452304;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oFTMP/R24ZDGiPr8D12+ouAQVW40apYrHT4rgZ5DgiI=;
        b=A7MXAy55zkaM8HHZJECOrRSh0ZRNsajWda/TbWRF7cOozNmvIiK5AvEft7ojygQfL7
         t6/XlpWX12mzGwNmCkhBIEvUUaYCbxdl/+8XHqaeysRHEFkqUdWaG0RRWL4gw5hZM4Mw
         5UCNGxK8vvK8mlOzyDt6CBbDa2iS2pf95RnIZbc5XKdHoyf+oHtoayFnQuNogCkoe+rb
         ZMjsNtQ9WZ9cRQ6cz+ThadEP/Dg0yVrrO9xKP+EtkK53fRH5dB+tNb7Hmgz09F5ttuEN
         soHPVict/Y+01zhd/CdXCF7TJDLUjLQzmdXNJpaUTWaBFh07B5r2GCcgBz6U6+griY6d
         P9SQ==
X-Forwarded-Encrypted: i=1; AKwUvByEY8BxKNBvH1n8j5HDvfTjOPm1ojmUk+a0yWkX98eYROgy9RK7baU8/gmQy/+ELWFAPClzWz2+yPHuNQ==@vger.kernel.org
X-Gm-Message-State: AFuF++lV6HYi6MjTX4+CH9wBaJQUUIxLqvZCpg38/pkKnxBcScvxK4I9
	hl2qwJItIZB8fQ8qdKAI5UiZ3tTyyly8R2D2dwbMHQpaI/2CSdkIldP3AFR7Xj839c+bpk1zsPC
	AQ1/2mb5wHsMO83GRrwYWdvFvqj3qzsns1Di9bAobWlsvGZnYtn4BIakIaaX3JifjmA==
X-Gm-Gg: AYBFou1YIuvbtG+J+9V+gUErBpXCqiJ3VMmEf9ZBM0u98UGZAL/JOWqVp3z/A/x5IcR
	o4aDuTEXsKw+B4RVXuqq6JKRHKZu5jPBL4/P/CFI12BleqBzmakleufNDosTVhn6oWdk/bqND38
	RkqTTqeMQCOylOarz1m6wDwspcKIjpQRojS4Z6rxR+qba5g0NIZgSQtavG3//jRzdXgCJjEZEAu
	grKkagu5NzypAOqxIEKHM9xVmeI+sPVUfTRUnrL3b6dIBQtWUoEVRwdIUQ+8pDsXZCsDWQMPmxb
	Inp4W0ZBGpxZSub/stl/RRzVGavmbPuJ8uQzZ0L0tuqiTbjFdO+4NOnKbiAytBflsnEWxn6JBTd
	ZJeWuRvtV3P4BIHloW7+IB34=
X-Received: by 2002:a05:620a:6cca:b0:93b:d79a:c462 with SMTP id af79cd13be357-93cac22fba4mr719949885a.58.1790847504462;
        Thu, 01 Oct 2026 02:38:24 -0700 (PDT)
X-Received: by 2002:a05:620a:6cca:b0:93b:d79a:c462 with SMTP id af79cd13be357-93cac22fba4mr719945885a.58.1790847503909;
        Thu, 01 Oct 2026 02:38:23 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b0692b5d7sm5231750f8f.28.2026.10.01.02.38.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 02:38:22 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: robh@kernel.org, vkoul@kernel.org
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, srini@kernel.org,
        yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        prasad.kumpatla@oss.qualcomm.com, jingyi.wang@oss.qualcomm.com,
        sibi.sankar@oss.qualcomm.com, quic_srivasam@quicinc.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 1/3] dt-bindings: soundwire: qcom: describe multi-master
Date: Thu,  1 Oct 2026 10:38:03 +0100
Message-ID: <20261001093806.634862-2-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261001093806.634862-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261001093806.634862-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAzOCBTYWx0ZWRfX9OC1PL95nVgO
 4eIURCz0qf53oxlJV6ZNFWXRgUDHKJ/XO+ZjjE0bQvd2pW603m+8dqfJEeMLmCj1s6rmAhs7FaE
 yO1cVi2rAJmgX3aIIr8uvX7BfzaiWEXTECeV1InfGRiMcfnYm5YazIu0uSc2FduY44PDMoCPIIu
 CG3y80T61Coruig/4Oo3pehwrn4Pzy8OygpNJudT5E8bdCcJwyKln30sozcJs1zjQIrtWcn0NrI
 J61FsOqFfpQXF0UJbeqoRdDc5D3w12gC9/r5RfvcJXKq+gllY9fooVO8HDc6wnjGPPtyRkX4Msh
 5fAQQci0w7GG/UnUr4BBZbBJQwfX8wrm7efCtQEH0K6+ahn0LU20A6Qdj/Gkt+/xlUtUVk+1XB7
 CaWWOW2Wva9Nqcc3EMdeknvD6uBVfUFiQyj8EknpkQo2hLB4Hrf0nVhLlGpJmNl3Oc09C1p78z2
 WOhCBRQ6wEsWpFd/qYQ==
X-Proofpoint-GUID: 9iYNLMZZCPxL4q4IrR9gr6p69fNHxAGM
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAzOCBTYWx0ZWRfX6lsXTyCAnITD
 /6fSwIdZtVaOEu46VB7wGOBOEC4Xi/Iu8cFqoysLTXA4kmYecRDOfh1OhpTKNaUzkVgrA7GxBpx
 i2coGmMqxbMjyXCV9L2nCnRg5RPZLZA=
X-Authority-Analysis: v=2.4 cv=S51MU4sP c=1 sm=1 tr=0 ts=6abe2a11 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=8XpN2xwonMoseNaoR1gA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: 9iYNLMZZCPxL4q4IrR9gr6p69fNHxAGM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010038

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
index 8e6973fa229c..e627b92a3db5 100644
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
 
@@ -224,21 +254,81 @@ required:
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

