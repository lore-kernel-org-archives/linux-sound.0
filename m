Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 675763A6F1A
	for <linux-sound@vger.kernel.org>; Mon,  6 Jul 2026 13:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783344044; cv=none; b=Lk08nHZe+U/o7preLWK1QGntSw9dQoKk+hx5/Y0FWsYCiyTsIjygY43/p+XNB+8EleAjKPT/kpZPXMldH+mhSGU7grpbkde1AbW0o2zS9WsFOIpAz8b+hGA7uth+xxWQlpRyDevVZl2a9lyjOe11CnJ0nehn3ZODesFfiFNlrKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783344044; c=relaxed/simple;
	bh=RuoW/FXZwjJXKxjWtApQABvJWpziWxB5IlaGCpbDBZQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PZbwldmrshQSV6kgX1AtTbU3bSD+crHVy6oy6izGu9TFI0z2uRwf/kcQBleC6Koy5i8uK47XPdulZlfCvcUlO2/ah2YXiBVyCX6P1ht7quYzkxbzF5cLx8fd+bnWxeHR8k/UrxY+FKQ5Qbfgwxpb1oi73H3GSme0NekruPLBDWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fAAECANS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dQH4EPzC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fAAECANS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dQH4EPzC"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxLgM218452
	for <linux-sound@vger.kernel.org>; Mon, 6 Jul 2026 13:20:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=R34M5+VU1Dp
	tfjZFm4KX5IKXsV6uN0Bc//jdRhc23W8=; b=fAAECANSXAw+UojNjil/HMfomuO
	bGnEaTiI/IzYZ46yKlRDMVo063u+/emfXLGbaGWsE7qfIQkpzoEl3YfBVlwUPhLQ
	xbTOKWXCLdca5K4rQuA/+LvcGbeWlHVXNWwvj+Fh1A8vZKVjJNYUsHA00txHPjWW
	AQIORcaRAz/QlxJyR8mnLc4qysCKmC0uYEXeTz2nZxWmQHevvjLOjhCYEcsKepb9
	29TzveTi91M2YwkFgvR5NWcjnTQt/YIYhRhSHv3iPBEnidJEceashQhaBkQVCJpj
	whZp7TI12LZdcJq7OPMYCl0p/oDNUZq0j5fv/paIRvbYNC3aTAdCYz3Geig==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88hs9847-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 06 Jul 2026 13:20:36 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-381abcccbf4so2001548a91.3
        for <linux-sound@vger.kernel.org>; Mon, 06 Jul 2026 06:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783344036; x=1783948836; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R34M5+VU1DptfjZFm4KX5IKXsV6uN0Bc//jdRhc23W8=;
        b=dQH4EPzCodbv2Haik3X7HihMkcTS4WqU+J7OMvqGcm0saT2/grAVItlMGYtp7Brinv
         qWoYLUm2Jv+PSRcA+Yu4979gR7z4RZukl3jZ/hGKsWzQdp6hVnmNNmvIhACRvnmaNRE/
         1VkaMl87XAjJaT3zkWOp+TCSbBhdAi4EeksfW4QXmJixIUqWh0HLFUIcGOyDdkKmEQ19
         UTGgaLRpQV99MqVnkDgRtwOl1exHKyolVwH4dNv/THX9oWVfmx1gfDGCmtVQEqwPbSJl
         U+XUbLuZZOXtgPqYyYULNEnzQyz9ClnIzEOfV/MBWNzurcjT6qgjHVKeeqPXRfRoYtpm
         KlGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783344036; x=1783948836;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=R34M5+VU1DptfjZFm4KX5IKXsV6uN0Bc//jdRhc23W8=;
        b=sV1dLeZdWIhxEnXR75TtNXuQP7yDhpWIbPGU0oGRsy/vyol5vZyQ5yG9hiM/RHpKr9
         B2eZNbmJuXYCqwRmMSp/FQtQG2mm4GgmIXmPCtNdszwIl+JMcPRDlbxcCWzut4YjXKSi
         GCei5sQZ3/syGYPLkkXgzZLO1aWHMN/ZIEwuqWkM/pkNw95Io+6CcY7DxZgfsb57mdHF
         cok8HLPgm+uHAT21ynNYx9gCKk2m9VFPZ7Yx8ClKCFNlmm0XzTH26IcFhTDHw0hUwf21
         8x9IZjvcanb7G72IlnVbxZuP/pxu6ykOODsOUy6MhiaXfJY3nLUepb76MBS5iV3jjYD7
         9ktQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp9IFnuV8tmAPB05PWeGgEO3X6yzxPerhjarvohMpBJQ7TCMXF+SZg8UPzGtVgGy3fnoAZ6RELQmEimwQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwWfEBcerqGOGwpP49StbjTi1dPZ77fLwLWOm8ggu8gsvVF5CMX
	Qkg7U3jjFpZt5PlRbragDVRWHLQs3Wb9smvJHSejKFCrRy6Sn4RucF3tOJ1VK+6YOy1fk0vLaj9
	7n0oeroVPpaLrGMOQnD0KvwCUqmXY4iie5ExOKFMsGSmYhc9WaBwL3/lWwXAjL7ssOQ==
X-Gm-Gg: AfdE7cmwzl02ZLx515amNSa9Gfd849wKiXVjfu3jUHQpUTLMP9sOY+VWnLmSdLETRcl
	guYiw1mlbZTGxfyPn7YsLdTOVa2nC6q4vI/EtGy1m1zIHEaM1LuS0uvhLCJE5b/mvq9lzXpYhzZ
	ywSCs43hZKbjWmtQsnotRGWCr+V6J38DDN4PH49TLp5r0sjxzBzDwxxd/nYmKHJs8ikIDJjI9Nk
	jirnoRh260xPpXxH+BAefZWNfQwHoFPeckXRw3/i4CX86cUacdPrp4IR4YI7SSAEjYQOY1NH1te
	5ln/A9GqfML5lhR6yrZJhioy69QLUqahdlkkQDjseEo/pe1rBBX2MrO8xccT5VgjytXfZow15Ur
	+VqH0Cgdqjjdz5F63HK2BxBEFDEZnxJDLXhsG9/LdtIu4CEw=
X-Received: by 2002:a17:902:d2cf:b0:2ca:b4b9:4586 with SMTP id d9443c01a7336-2ccbe615002mr4817895ad.19.1783344036011;
        Mon, 06 Jul 2026 06:20:36 -0700 (PDT)
X-Received: by 2002:a17:902:d2cf:b0:2ca:b4b9:4586 with SMTP id d9443c01a7336-2ccbe615002mr4817395ad.19.1783344035455;
        Mon, 06 Jul 2026 06:20:35 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad6f260d2sm51173095ad.10.2026.07.06.06.20.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 06:20:35 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v3 1/3] ASoC: dt-bindings: qcom,q6apm-lpass-dais: Document DAI subnode
Date: Mon,  6 Jul 2026 18:50:07 +0530
Message-Id: <20260706132009.1496321-2-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260706132009.1496321-1-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20260706132009.1496321-1-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: PcmDaOEiTUlO-ULMzWp46edhGpL1qah5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEzNiBTYWx0ZWRfX5rEMdjD0ygRg
 g9vmCzZ96U+u+APYXw9twJTe17M8wo7ek5dEUrefY1Svw+Ywm7T62U+WTWz5N1aoYwO1HFJx93U
 EwHswvDbvBSgIGUOvCZ551WM5/4i/Mp0cWYwR3ATKVtjTFkfjHFtdETt9uL5Z8LzaNIpHqrLuvI
 dUVv6bsRDEP6/r1+p5Eijb9XD1L56w9PN1zlIihHZw+gOU4exDctVEvdmwXQps7R5Qk0rDZwv7/
 DCsTUjvYYjc1pQyhXaNeV06UjIV6zVdQvzEZwYXv4DaivB1gNxWvxl3gdPa7l4VidpxzNxaAcQE
 MlCHS2+s38VK4FnnAFOG6OHGgBLQkJwgVIQHZxVJNImSO6asHovkAjzr50O8wZM3562MujtnHeZ
 9gLdaFVMOCWRgaMPcnIQI852NT5L7x0PQkaTqOhtex4eBYJ+BORZ4zKsDSUmi24aod7IAoGjHOY
 CeRQLaUlRKR7FlbhKfw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEzNiBTYWx0ZWRfX7Q0l3PIcrSMr
 uy0UotaxpTU2y3CIWdi2aABWn9leBGycqyvdvhfWD0cIOc3LdY043suCKBnoYmmC48ZQlgICu21
 KiiAjP70O3qSSz2VOpxG/OyMmjyJiTI=
X-Authority-Analysis: v=2.4 cv=XIwAjwhE c=1 sm=1 tr=0 ts=6a4baba4 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=NrbrONOL4QpDeGKfLFoA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: PcmDaOEiTUlO-ULMzWp46edhGpL1qah5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060136

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
Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 .../bindings/sound/qcom,q6apm-lpass-dais.yaml | 56 +++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml b/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml
index 2fb95544db8b..42d05334bd39 100644
--- a/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml
@@ -21,6 +21,47 @@ properties:
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
+        items:
+          - description: MI2S master clock
+          - description: MI2S bit clock
+          - description: MI2S external bit clock
+
+      clock-names:
+        minItems: 1
+        items:
+          - const: mclk
+          - const: bclk
+          - const: eclk
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
@@ -29,7 +70,22 @@ unevaluatedProperties: false
 
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
+        dai@16 {
+           reg = <PRIMARY_MI2S_RX>;
+           clocks = <&q6prmcc LPASS_CLK_ID_MCLK_1
+                              LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+                    <&q6prmcc LPASS_CLK_ID_PRI_MI2S_IBIT
+                              LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+                    <&q6prmcc LPASS_CLK_ID_PRI_MI2S_EBIT
+                              LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+           clock-names = "mclk", "bclk", "eclk";
+        };
     };
-- 
2.34.1

