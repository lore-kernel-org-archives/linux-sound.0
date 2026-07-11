Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C2A43C4B89
	for <linux-sound@vger.kernel.org>; Sat, 11 Jul 2026 12:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783774683; cv=none; b=VyNmA7o2VXAXypshIn4VmbResu6l1B2dKCLUdhEp1y1iEIIbE/jvl4BONa1AxbJ2mTV/jqfK5uNwtIMUysHuDSua4jIr0DzoGrvjlBzSoFnqi+YZQaNubDJNOUZHUwDaqw+5iPcE+Zi0x84Y2aZ/zHnfGcUfXMvM1Xn+EY0ir88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783774683; c=relaxed/simple;
	bh=vBUE09K2ZJ0I6D7b7YeWJW4uNjwNJtT1FGpBYywnV+w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=i38cKYJMXE6p6aZ6A41Jdlv7BDVq867SReeOhmreX44Nr4xCgofeZnaK0l6n5aCdJ5+aD9jsvr5pwn+otrcpDxGyY4TEYKHP1snjRWSPpJ8bTY3CLRsvj6uHuBOezjSuO6uh5docw0wCkLVQtRDvLrNXJ38REetJnHca49Q2keA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jeJRKAlk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ebNdNC+F; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jeJRKAlk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ebNdNC+F"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66BAnF363659505
	for <linux-sound@vger.kernel.org>; Sat, 11 Jul 2026 12:57:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=cp4uLzOCic1
	RRkGa7AiSR4wCQkdmgpEFJlMlPSR0hCk=; b=jeJRKAlk0IxnliHRBh6InvnuKnR
	IxlQmeA3YyRHgQuO76itsH6zBTB4ktp9S2sjtXVk+byihi/uya9p3YXAHSvh5r5R
	yzSZtvCcMP/49SaLTaY2DDNjpMRluJxEfhOLPge4UOr4cNH/PGkrN2UickXfHxmk
	gOg3iYAxxUCU3IS6Tg8izQvTz+rLcfiPBNE149zA9cc/S+Co5rlVnK9xiBvhBTgI
	2GWgVdjaRZH//eQW1FcqmSQBgwArZwoyBHWKKfaxBX2ZlfirBINZT+FWXS0rDc71
	FRY6T0LpW3sDIv+uKeKeB69jkzq3KI920jz/uwcVnBtFMX/JcSbFX/4Homg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbecggu3b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Sat, 11 Jul 2026 12:57:59 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-381abcccbf4so1678181a91.3
        for <linux-sound@vger.kernel.org>; Sat, 11 Jul 2026 05:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783774678; x=1784379478; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cp4uLzOCic1RRkGa7AiSR4wCQkdmgpEFJlMlPSR0hCk=;
        b=ebNdNC+Fer8I9rxfxKnlh/ccCQbBaoPv5OELS6YD1wzRN6789lMLGbBkGABet6dhpx
         3p2M4bV6JUk+avUDcERhtkhldnzD2srcb/wYXeXyunUlJsGxAMrEn4f4qtm8iWZ/CutH
         Xy/PAcZf/U1kGMhZa+NCJK8hHCfn5GcBJUn+nYER9CVj7JdK7fAAeE50+5OK+p1N6Ibc
         ovMncfmelWXGLmUn5M3E5NFdW0DOgq4ct2K3lgh2cJYuUdL/VUl72tx7kqXcwpQ+wj4q
         O/CveBNNg1dI0UmNpk35Xjtda4rz/hbD2+QCx+EX5WvsYK9qBGP6VbaplHXerVjKKIh7
         Q6SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783774678; x=1784379478;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cp4uLzOCic1RRkGa7AiSR4wCQkdmgpEFJlMlPSR0hCk=;
        b=izQW94tuV94YN4mvBDzaMiHP06pGLFEskMc3te5kkIr8V0/xH2mEMKSpxasX3JNFpT
         Gv65Wx3kZZyBt8kHqCQ4UhmE11wsDkLDkIpvsgUj5fCw1DObd6BRfzsmSwd8S38090v+
         OP5Z4X6DZG0Ld+3863QexZuL38ykvEd3rcd/IfmiKnEjKdh6qRib30Ou7MUhKJmElvY+
         Wr/H3SnXZyTcpCjgmRKWSe6i8peEmPD2ebidMcvoUZWpHSgZ4YrBeJ1dQIWV32X82xbp
         6QrMkFlcwHcSDsJHPn7tIfeYK7mJVCtJfiFYv+73OY6ZkviGM0smGi6uK0PeMLg56ntu
         M97A==
X-Forwarded-Encrypted: i=1; AHgh+Rrm37Kmxi8/Nk6ut3R10IJh53FI5HCxP3syNt3mUUgp7+dWj4pV7aq3T1c+/QekoBhxsDZw0nMHvfn84w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyxTXj/Xz8G3aYhfzZbP+F97p3z3kIL5mVCmmnjmgT4G/5bkYM2
	OYlAZim7CmxqwZgIuF1J2mKiPc1j/FHcmTkCmLAv9xJf8QLRq5KA4nJ+ScANOH5RYJd6r+zNRqp
	E3TzHpWni0Zo79Wukh8c9mSrsDij3znPWch/deUb+5MSXEh+f0QWYEqQ/PnClJmeZng==
X-Gm-Gg: AfdE7cmoyoyt06Tm9giS/kKam4YSWM920XQphC4UaVzUaBYkRpsFBCCzJCQauh4pftq
	gviwijeD+cNCEfOq5XSKRiNReUBeo/ERlM9nV5u0dPi37VFj1OSX8DI/zPewxmz/ZjE0NXKUR23
	BY5JB1C9RBTbikl0LT8xpo97FTdNgzBPkdccpV3GHqWN1fmpgsCTSNURDyeju/cZ/PBNc1831sa
	fBD6frmXlQsG5i0U7NDRU5dbDQMk3SZ+p36X3e4IL9y3zwvJFWOCZgnjLdwt+Onyv2iISiJeOiZ
	BkbbQDH7R5PKpAhZDnoFJ7sg7gfq03bzs1JiQsfPiQ4MnHFVB3ngFWYu1GClMN1HZHJDAUsiQX/
	FReNFNM6epuuGEDEPsNt0eQfaKdKIy0V1pcoBLqlxPykMmYs=
X-Received: by 2002:a17:90b:3d89:b0:381:2811:e8ad with SMTP id 98e67ed59e1d1-38dc7777abcmr2924094a91.23.1783774677947;
        Sat, 11 Jul 2026 05:57:57 -0700 (PDT)
X-Received: by 2002:a17:90b:3d89:b0:381:2811:e8ad with SMTP id 98e67ed59e1d1-38dc7777abcmr2924073a91.23.1783774677496;
        Sat, 11 Jul 2026 05:57:57 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-313b9ca880fsm11185634eec.23.2026.07.11.05.57.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 05:57:57 -0700 (PDT)
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
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v4 1/3] ASoC: dt-bindings: qcom,q6apm-lpass-dais: Document DAI subnode
Date: Sat, 11 Jul 2026 18:27:38 +0530
Message-Id: <20260711125740.3083236-2-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260711125740.3083236-1-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20260711125740.3083236-1-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzExMDEyOCBTYWx0ZWRfX+Fg3C2of7UT4
 H7b82RhSE3X9al5DTbJyrjTDLTsIVec/4RcsHzawykRXbHJCp1mZBjMZUJPjhPM+OLB2enZ4aGc
 bqdf6cdJR8LgdielH1soMel4f2j69Ho=
X-Proofpoint-ORIG-GUID: aih9rTp0H4DSuKkuvehQpJIdowzVZ9p7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzExMDEyOCBTYWx0ZWRfX+T85OP3ykgQq
 FKstpAhF+c17s16YfmVIHMw0FA2flcvifzrggdi0j9nvNXa6hxRYbLkhrMHl6nAZO1dUatGres7
 mg4cOwgcArOax1lSV0F94ecZZ4chu4KNw5mVlUxfB9fgr4dJLpyL0J7ZvG9vR98+OFf+O4rXR8A
 WliwdaYcXSSn75efZpGqlM70Lp3lRHH5Q3VXwfMonrCUcGL36/9fbjtDJvTQ+D3X7YDAp+ksWm+
 vGOryAbSdlZRDn3nXw2V/gvXQ0g7K36tamOHKhPTo/rTB+UxFGKiovvklefC97W/T+2dbdDm/KN
 RQTIZEimecKjj/7vnOnPFDFQEz/+La28k1PxGEdScZ6FCzOzDWZJubIiArgJQRfpeOUcfoMxrZY
 4OwBxlytcy36ODH/r9/q//QAqfANkldYLL0QrjPngI+hcr7pFdGUfeYOiix9t7wFi1TN/mIm9XS
 9cZxFapenP9xaZucQog==
X-Proofpoint-GUID: aih9rTp0H4DSuKkuvehQpJIdowzVZ9p7
X-Authority-Analysis: v=2.4 cv=KM9qylFo c=1 sm=1 tr=0 ts=6a523dd7 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=NrbrONOL4QpDeGKfLFoA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-11_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607110128

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
 .../bindings/sound/qcom,q6apm-lpass-dais.yaml | 58 +++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml b/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml
index 2fb95544db8b..f3a8b12d7fc8 100644
--- a/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml
@@ -21,6 +21,49 @@ properties:
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
+        maxItems: 3
+        items:
+          enum:
+            - mclk
+            - bclk
+            - eclk
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
@@ -29,7 +72,22 @@ unevaluatedProperties: false
 
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

