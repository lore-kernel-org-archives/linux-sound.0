Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A48331618C
	for <linux-sound@vger.kernel.org>; Mon,  8 Jun 2026 02:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780885840; cv=none; b=UHqA22Mw/vkwEF2TC8xGFrMFjyCI8K6OGL/rLcu0m3ETgefG7JaX/+DAj+4sO/B9YwgXwSosq1ZcdJ8RrTAh57P8k+9YSKJHis15J8dlrfQWPqMN8Iw8J8xmLHOv9xC9887W1Z9VZ5S6JEmyMP6bsRTHc5q4BivZq3QsgHzugls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780885840; c=relaxed/simple;
	bh=42VpR8ugAARHyI0wmOQZp/rBCGxgBSiRrJQELIHnh8s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=q/klz9qvFFFSsflMl5HcObxcyBJTO3etKZ6Z6oBTIMoBHx3f8nOS96HqNlLIVN1tDrAbor8IIV5QAn5X2nsHIDmmQwbtkWL7F6UbzxbU9Xx3oEafITMZCobWP0vs2w3SOmAoW26JD8qLSOcAao8qx1D3qxHETZwvx9mnBXGZjjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eWBhz2m0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K5t8OE34; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eWBhz2m0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K5t8OE34"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6580EMWF1574751
	for <linux-sound@vger.kernel.org>; Mon, 8 Jun 2026 02:30:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=IKc5Obhm1v3
	/KA4MaSQ32W6Hvld9D5qR9cN80qMH2Ak=; b=eWBhz2m0o4dB3nYeHqRL9JMfo3G
	/Wq8MjhNV0VpLkdkPjX1kI04Zrf0vL4n0OM0CqINRu6ka+nOQtzQ71uG59PvZg+1
	+cZBtUkfxRllUzcKbxJCZhUwMq7OAWnGOVwAS+6ijcXhk8sHKgHGSNTgC3EjxZDY
	UfOliPtgSg34AYcWEOhBMs61iuWx5nP008FTBFFRKL6eVm5rqJaJ0YEOoqrZd1S/
	xhflQXyx6kDrGIJiaRhqhG0uRCcdmWzkDspBNjS5bqRE3C7udDdzRQxdUme8a5WR
	hFhLZIeAT3ddHuamm2Sc4ev/r5dlOkG5obBM1JBBW0wNqLguGo+hlDYWujA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4em98cwwvc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 08 Jun 2026 02:30:38 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2bf243973c2so26312685ad.1
        for <linux-sound@vger.kernel.org>; Sun, 07 Jun 2026 19:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780885838; x=1781490638; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IKc5Obhm1v3/KA4MaSQ32W6Hvld9D5qR9cN80qMH2Ak=;
        b=K5t8OE34B29tH9uCHbnM6suinHcCqyE8n62KSh70HJdEQiHBPyLa9vkn0C5finBn/r
         YB8C2n/w7doOzgmrIhDoZcDKcoIojfPdR2uEBstisNAupOsoG/XTTra6cNnw2xa763xR
         PD/arZWyZy4wfvwFRSpqVpkzOapY9JRsZi/bPJe2ChRl9nBMaz/I2RpNaGCOIqUHaO2F
         QRXlvlaLqQd4zNQp3IOXo1KcaM1SLKfNMYi/U2SO//YbMaT2m8bZzL5WB8kd63BNSxkq
         aXhT8u/rz19OmvuKdRngTL9Dw6dZ9t9MZUvvwlnDdd6//x8yagDNGbMS/7q/8ZmmE04b
         nwWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780885838; x=1781490638;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IKc5Obhm1v3/KA4MaSQ32W6Hvld9D5qR9cN80qMH2Ak=;
        b=Rpd2GIhCNpLCvGPvfP9zxLiiJ0dHbkps1MNVwe4hLQtoHe5L/KExUvws/Ghbdkqnev
         qafDoJs/2fPAQbGtuzTaRHW44r5fS3Nuh0ID4PQBiQUFiD2t+POZEIZ3yc3Yvn0oyujF
         A/oNYmt9te/Ic+r1vsN1pRr1lrFm9AM9RH2hj/+/ZAM6QD7jmMlslLnPjCQITmQVzrzH
         zNroVGmEBiFHB625q7WivMC0sU11IRqXoEIjuK2f3esKxSjrF/GinJZbJeMNUvL8eYhD
         6b4UV9sEtYhnGD9t10VBTNACaC6MS+lElwCFRnoaVWxO/+h5DukTbfD/IxzH0WLbFNyP
         9ieQ==
X-Forwarded-Encrypted: i=1; AFNElJ9CHPpf38jHf3i0mRe0URLjAE0aEJqyqwZJwuGt/tnZ0I5Bc/XtWw5O2h7oDpZk0NTysBvCS3jYcdWRXA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8qv566ejxvpFFpz+zIDdbzNdYawwXeiVeVQ2XhtYU4wvsdv9g
	q4JeT05wI7H5W/6L/nxZave4l35xe01wpUDGhDCFIXOEaU4un/d7EKX9wxZmvfiPlMfPq8CY6E5
	0iMt/HWBzOkxLgtQ7ziwwF7FC32lWR2YIndviU8n4kUY5Ymk76eyalxkdx4T9/ASGCQ==
X-Gm-Gg: Acq92OGocDuZHOiDHPVpNlT0Ua6WGp02eQGDnzLf41YxOOe73A1eT0kL1tLY96SJ0kQ
	qZTJCA6NX1aHbS+dLi3dqmiEraNwnwt9uh1+8Vo9LVl/4D9k7VUyz35k6lcfE0pjYO14EZfn6VU
	Kwp2keM/g0AVarkH7eWbwr7Q59fbKyyrHMRYavk5guOpQIwMbeUUmVt7hQA2MUp56C36gxbCknR
	w2j0/kzH2MvoaF6oWz4ry00t3bR2ftXlNVHAgF3EyO9JhrofRs6+eme+7gG9glu+7uDRv17dp5G
	4Yg5pR5xwbpcN+qLcQQQwoNEcRd2iCdFOccp1CCmfA9W/wl/UBw158cS+GbRiLLYcSIUIylIq0I
	GYpH1F1vvmCHNFSUKMvHD/84OaB2KZjPW0cBYw0qR/v1uedmP4Bl5KAOt7g2+27lBL5kZ
X-Received: by 2002:a17:903:2348:b0:2c1:ee75:56bb with SMTP id d9443c01a7336-2c1ee755854mr149411745ad.20.1780885837673;
        Sun, 07 Jun 2026 19:30:37 -0700 (PDT)
X-Received: by 2002:a17:903:2348:b0:2c1:ee75:56bb with SMTP id d9443c01a7336-2c1ee755854mr149411295ad.20.1780885837094;
        Sun, 07 Jun 2026 19:30:37 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16609e0bbsm162343585ad.50.2026.06.07.19.30.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 19:30:36 -0700 (PDT)
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
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 1/3] ASoC: dt-bindings: qcom,q6apm-lpass-dais: Document DAI subnode
Date: Mon,  8 Jun 2026 08:00:09 +0530
Message-Id: <20260608023011.942228-2-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260608023011.942228-1-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20260608023011.942228-1-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDAyMCBTYWx0ZWRfX83lEhhw59JYp
 o3HH3VxRQXojK65USso/8+N0xq8HerGsWy8ngb+WkLBCw9bGakmQWLHPZjLZDvxbrZdGVKFjO5Z
 zxjYxIf+7qgQ/kCAc3bM/Z4ZoLba5nkWJJh2so9fI/sBZyq11tcpIScHDTgsFeOR3oCIpjNGJQP
 dYCLwbJ8LgLa4JcFt9jrDZ1LwNKGoGTpwGJUTlEAnb63sbSKTu/BH1WsZcY8AKdA724fGyD/kFT
 ts/OPzAkh3mJKoiCKYdret7fwzP0CiiCtxpyO72W6LUk+YF57j2tnG8AzJ5GrqQFCN8hgdQ5jvf
 casLlw8fPXqG2bruBkmfGsDEQzrKwCYf6uKjme0bzO8NOJ0vXcmcDaa0Deaw9Z2Q3lP8GCMMfjW
 kefNtVf+EkAIa09griURJf3W8zF+YXKFAaDEycme+44WHZ1yppNkn7zaJo7ILwn1D0ME4/ZK/9R
 UX/DntEWh3vh5AJyCxA==
X-Proofpoint-ORIG-GUID: Ryc3Ow_vjGB-niZR7YZcK9NpakUNJnpK
X-Proofpoint-GUID: Ryc3Ow_vjGB-niZR7YZcK9NpakUNJnpK
X-Authority-Analysis: v=2.4 cv=A/pc+aWG c=1 sm=1 tr=0 ts=6a26294e cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=NrbrONOL4QpDeGKfLFoA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_01,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 suspectscore=0 bulkscore=0 spamscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080020

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
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 .../bindings/sound/qcom,q6apm-lpass-dais.yaml | 57 +++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml b/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml
index 2fb95544d..4c4c73778 100644
--- a/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml
@@ -21,6 +21,48 @@ properties:
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
+  '^dai@[0-9]+$':
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
+      clocks: [ clock-names ]
+      clock-names: [ clocks ]
+
+    required:
+      - reg
+
+    additionalProperties: false
+
 required:
   - compatible
   - '#sound-dai-cells'
@@ -29,7 +71,22 @@ unevaluatedProperties: false
 
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

