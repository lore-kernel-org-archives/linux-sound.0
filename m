Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93A3D41D13B
	for <linux-sound@vger.kernel.org>; Mon, 27 Jul 2026 15:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785165175; cv=none; b=QnvkbnhhuHDb6nYPBMQkhqtmYWFKcRpkS0l4VhCfWHBuOoCV/cWRQZrNbwaSB2YDODHjD8d2TvljhE9riBSMZgXBMBQcu9uZVS9IfrHpd32ABNGQ0tks4L9iloDrHqYJO8XX7/adXU4MJ6JToQOp7qR+1Tw173kGoKvLfxRPDA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785165175; c=relaxed/simple;
	bh=NmDeSIXSJ3ddhkm1MT5NYZjOHCGAuKIxGKSLxuq4vG0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=eu8ps2fXegTmM51WMutNOx8GK0cAJkKNmEriqJunWfISh3aoUNa7JrOVSp9FvRR13poIPiTx1y8NVe84ZZyj4N+t/qV8dpPmOp1pA5jyo48APLgA3FqLfj/ru//9UctGkrHVnDVuEW5Y0//EApQQRDjHlr9Qo+lNOMRxfQdYe4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mR1E03rD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jZETxvMo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mR1E03rD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jZETxvMo"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RDlYdf3895534
	for <linux-sound@vger.kernel.org>; Mon, 27 Jul 2026 15:12:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ti/Y0A80/1f
	+CUibKUSAjXf06gV9fXfJLgRMUaoCGnQ=; b=mR1E03rDS8sFQIt9kGbY+GFU48T
	7H1B+bAaodcAAAClWo2L/CWwr31Ua8f1/tLQbxBlIDRTfK2oC4VywrinR3ieo4yb
	NSIjCFKuN/rqbE0sGFiY4CXBtynJHDy57wE58dAzUS7jX7a1GVH8XmbkhusQEFWz
	2oP05W8/ORj/bmP4FT+vNKCYtjIuRdA+Vrp80fY+htWMwO9g+YYyDw/R/K1LSXgZ
	G7SljrmD7JGgwKv6k5QDFYnuCZ9ujFrJ2t8RVs7M7TpIGzm2rQxZ2bb4YdpB/I48
	bYJnggkeh7jhv1rN7nefS0PZIIwsnnAXeWeCMUiJV8gWi9KqYVdLAh0lfOQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fnsxs380r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 27 Jul 2026 15:12:52 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e667368f0so4623545a91.2
        for <linux-sound@vger.kernel.org>; Mon, 27 Jul 2026 08:12:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785165171; x=1785769971; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ti/Y0A80/1f+CUibKUSAjXf06gV9fXfJLgRMUaoCGnQ=;
        b=jZETxvMo7De+MihOjONdcpp8pnRxQFyszQkheSi1ihfYQ0B8cA2DE2tvr+VQ4LMJMn
         /Pt2ReMx3I5yW5iMcqDAvjK9FcKCihzHJzstbXCSG2k0yRX76M9Pjr7ppiRgevqZ1cky
         /7AcnwRedkYETmvCcXTu4QPZepcO0qVhe4qj5vb07HdgLPLtFdINHl3yeE1G31EGdWcc
         HovR5PTqx+ziblO+PbV9fyAbSClrRXNG1IyE/TWiCR2VnPDxHXiPheSoTZwWVwfJlm13
         b9NTeHURVV9PJkbYjQDQ+2UFuDk+MrVpYd1lHQd3OqgQETpc9x8+/z2TjjCn7p5l5zig
         8GKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785165171; x=1785769971;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ti/Y0A80/1f+CUibKUSAjXf06gV9fXfJLgRMUaoCGnQ=;
        b=sk5dhEQzU6RoM6N1B+5m0Eevbkj6MWFRuONM9O3hnqI6KfesV6Z9fDseBxkXTi0a9z
         rZU0jkrnHiOgAYl0EBhXdVWtmFv8qLtcWvN41huQs3OcKtXFwsjUxqMeH5hIPnKX114U
         ZEjHSkFdjERySJIThTCJKo/ubTT3iuSpEVkcVoRdPijyTW2hWNRSRnbewXGDKx+fhpND
         /RWLFmSiIYcmsaV59ht5GDBJVOunlGWovDBK6RobLgNP/zsLZIrORi7STCOHNyKObIq2
         uEvRCB7tyHNVeLSubWxRicpVUvV1sCkJENrYRWOlv3eTsoEu8csnpQbwISjQJXgFvcAc
         Nvlg==
X-Forwarded-Encrypted: i=1; AHgh+Rqkm8zzc7ys20SA2fakSFB0LTWNfkHVrO2KuGs7ZTqR1jVHUSJMIMzVDYueOihaovkYxFJ0xk4SvlBEtQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwKfEZb4xbh7dj4nz1MQEPA0jFXTm0Ev+5r0l9kMpAQhNbOQ3RN
	odN7P2nsg2cGtOagYP/Xyo9kQGFCZbxLeq1DdUqZHqFXGpvcJPjLvwflYHDe9t4N/D/Qw/hW0C8
	iTttTL6+y3uJvDGs+5vhqh5gQ3U+0H4ws3Rm5vkgNYIWXDZwgXcHmP80dOi1E+0c88A==
X-Gm-Gg: AR+sD13MpCp72PqG34YPJTxvaQ53pvm+ulrzwQgoIBTZARFQjH+sLv5gY6D75f2aj/H
	Am6tCUJET+Phs3V8twHiq+rnK7PbJMUAE92IC5b9x+MNr8dqBwy5sBS0aBYZcGFvI3NPbXXGFDc
	IHBTt7jOVSV9RQEte/8oebbrhpOeMIsqzF91utelfukUn21D48T6LKfVhBpy7xpipLSjUJHwMHT
	em9/jBLjr7sFhDKTXkzeyNt5q96jyAddfypXy49OKz3lnnQFCeoNPZA10CQ/rQzR4aDIY9+E57s
	xV3fi2arITU92fK/2nqVS+spZ7wv9g2a4ASrNufOEwDgw2a7Hp5XC5xDVI0QlKb61lgOpJcTJNY
	wAW3QEnnTrfoUDz10y3OZpK1A8XPCPGY8tp0p
X-Received: by 2002:a17:90b:398d:b0:38e:c0f5:7c4 with SMTP id 98e67ed59e1d1-38f29759856mr7253176a91.30.1785165171302;
        Mon, 27 Jul 2026 08:12:51 -0700 (PDT)
X-Received: by 2002:a17:90b:398d:b0:38e:c0f5:7c4 with SMTP id 98e67ed59e1d1-38f29759856mr7253140a91.30.1785165170661;
        Mon, 27 Jul 2026 08:12:50 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f1a759228sm2510133a91.1.2026.07.27.08.12.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 08:12:50 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v8 1/3] ASoC: dt-bindings: qcom,q6apm-lpass-dais: Document DAI subnode
Date: Mon, 27 Jul 2026 20:42:28 +0530
Message-Id: <20260727151230.408122-2-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260727151230.408122-1-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20260727151230.408122-1-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDE0MyBTYWx0ZWRfX0J+lKh+zj2ti
 zNC9l5UB2YSxJfSMUrjvAgMFOCtkBQLLbL/h8enaOXI16AVQRkA+eB1lbRJBCYXlEbxQ0PLFSwU
 aZxtVY39nH5Zv+Qh4dUNRwTFOKPSQzHIXdmdMjD0IQQNbPpg5i4IsuV/stdfPQLU5naH2reb7Nu
 +AUHuV4EbVMLYSbspkqkuO568+cfbOe+n7Pv8k8Y8IR4zBunvbsZtqTm9aaFfdML3OLaGnfhAH+
 IowJjKVLHruoAUSRA3TAfu4SsZgT7n/psp8ul25tBPPZxTY2lEEdoQ8KjSnUKBiErFPZZG4NELF
 C9CXlihdQVWPkcyjNz1VjrXuHw6ws3cKgjqdA79TnMvUuo2yYUWeZ+Srvi0cN0kHWIs9XXVTWsJ
 zsEgHUVoP3Fkf+luZecnJz28LWAGEmMWAKwoaUV5wrajqtjln/lyCLhmwRDMm7Hva6EqaccLE7n
 FPLUlhFEDHSua3JQbdw==
X-Authority-Analysis: v=2.4 cv=EYr4hvmC c=1 sm=1 tr=0 ts=6a677574 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=3jZq6FF4vXrVA1D6PBYA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: CeJfKEIkkK9283U5RbczDN_rNUpJBbjU
X-Proofpoint-GUID: CeJfKEIkkK9283U5RbczDN_rNUpJBbjU
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDE0MyBTYWx0ZWRfXypEPKztSKWBs
 LrTWNgpuivDJ+0bbJO6m2V3A7Sk+rV5kjP8A3EJAD5h01deuNXj0KV7p3kd9H4lWAlzIa8/1NQJ
 HwbC4CjGnZNuUQemmitla1l4ZMGRV+g=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 bulkscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270143

Extend the qcom,q6apm-lpass-dais device tree binding to explicitly
describe Digital Audio Interface (DAI) child nodes.

Add #address-cells and #size-cells to allow representation of multiple
DAI instances as child nodes, and define a dai@<id> pattern to document
per-DAI properties such as the interface ID and associated clocks.

On platforms such as Monaco and Lemans, third-party codecs are hardware
wired to the SoC and do not always have an in-tree codec driver to manage
their clocks. For these designs, clock line enablement must be driven
from the platform side, and this series provides the necessary support
for that.

On QAIF-based platforms such as Shikra and Hawi, responsibility for voting
I2S MCLK and BCLK has moved from the DSP to the kernel. This series
introduces the required device tree binding support to represent and
vote for these clocks from the kernel.

Co-developed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 .../bindings/sound/qcom,q6apm-lpass-dais.yaml | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml b/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml
index 2fb95544d..78587139f 100644
--- a/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml
@@ -21,6 +21,43 @@ properties:
   '#sound-dai-cells':
     const: 1
 
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+# Digital Audio Interfaces
+patternProperties:
+  '^dai@[0-9a-f]+$':
+    type: object
+    description:
+      Q6DSP Digital Audio Interfaces.
+
+    properties:
+      reg:
+        maxItems: 1
+        description:
+          Digital Audio Interface ID
+
+      clocks:
+        minItems: 1
+        maxItems: 2
+
+      clock-names:
+        minItems: 1
+        items:
+          - enum: [bclk, mclk]
+          - const: mclk
+
+    dependencies:
+      clocks: [clock-names]
+
+    required:
+      - reg
+
+    additionalProperties: false
+
 required:
   - compatible
   - '#sound-dai-cells'
@@ -29,7 +66,20 @@ unevaluatedProperties: false
 
 examples:
   - |
+    #include <dt-bindings/sound/qcom,q6afe.h>
+
     dais {
         compatible = "qcom,q6apm-lpass-dais";
         #sound-dai-cells = <1>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        dai@10 {
+            reg = <PRIMARY_MI2S_RX>;
+            clocks = <&q6prmcc LPASS_CLK_ID_PRI_MI2S_IBIT
+                               LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+                     <&q6prmcc LPASS_CLK_ID_MCLK_1
+                               LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+            clock-names = "bclk", "mclk";
+        };
     };
-- 
2.34.1

