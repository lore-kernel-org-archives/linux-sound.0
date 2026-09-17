Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15E9B384CD6
	for <linux-sound@vger.kernel.org>; Thu, 17 Sep 2026 02:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789611767; cv=none; b=cUYP9Ah0KN0/l7YXBRszfPcE4JV5K009gnQLsJw+NX8Ao1vzrhVkvmqoiazq5gy6tRbem4G/rEWWafgFFFwas4AVutFS0s3ItRBvaeCpKz4G5yWCmR1MMAzs2O6KJ3/i98w4THQfZAeLTq9Sd2lXwHhvkfcdwO0BX8vmaBgkDLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789611767; c=relaxed/simple;
	bh=2W5RObKszArgoD/A87TmkLDGOjvuwEXcOAx0z60Pp+k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LvKph33ryKAABc39ZaDkL1qaoFZ8xifbVfKMchkyAmE0C6M5kCBvvDdE0o/mHbp/RLbpWOR10bexHelmoCcut4V6mD1kCoCoSQ7R1r0Ee28wfK4VCRjIQLXqAlCUyKh7Yiw7ZiStrW5tJNxGyZTs9Zm3x++JBx22X/aTfy4NJUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BBuWnxio; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Uudb3q3l; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BBuWnxio";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Uudb3q3l"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68GMV00N2471486
	for <linux-sound@vger.kernel.org>; Thu, 17 Sep 2026 02:22:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U+25ut/u/ktG52cH9j/Y9VE3SglkY0dcyP6JoqO5Rao=; b=BBuWnxiotT+QOb1X
	u/orUgxKluow1+AyYeSCXRdW8zYPbgmSd/oJDkJlk6/NaNJax6PsY+hPz64e1egL
	c0OqLl9kqMEplYejF0lnn9HfUS4DKxkTsme5dxfMfYUmTxiwEwS7lNTC9y15Q5/+
	cFIUL+pzjjji4RAgHQ5G1+WSYFBq7ZiBPlROJCHr7h7JCZBrLKj6rYG+P9K/Fv9W
	T4fgNv/qfG6Lv/QhchRuADp7dAsiAoURb7lz3OiqSQD/fIdIrTRJ25wfKZAJ1chj
	rfJi0PZmWdi/tyOIqhaUmn2TPCWDhRGPIWfDWNJE6a6g6bM87to1eo8hoHdT+6TK
	HtiUtA==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqtn53a2q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 17 Sep 2026 02:22:44 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5c7d5444845so443437e0c.2
        for <linux-sound@vger.kernel.org>; Wed, 16 Sep 2026 19:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789611764; x=1790216564; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U+25ut/u/ktG52cH9j/Y9VE3SglkY0dcyP6JoqO5Rao=;
        b=Uudb3q3lBxcKMHP1pSD7K2sVrmcqqnXJY16ll8Y5JM1A1OduDtWaq1OQMhADhsUfVq
         ghV+LBS/pz/3Xhdb0ROc2bvN8/eP9HBEcGIZwd7Nm6hRrG8QQddLufyTLCWmhgHB40L8
         JPJEjxHvq9qAMoPHaZzLWU71Z3K8XsSCR9sGm7vVbE/KwtiMhO95YYfs5/BKgsqtoVZ6
         FBGcqsAbLGRSLYjfVyEhWu5PUTvsh6QTK1pXA9sf/BX0PrsShVWTEXfN1TzngRIFb8Bb
         aACV2g7MSQKD+rizfJg/X8pr4kYMuNwNb9lJyphcAC+eee48JkXF2Qd9wpAUa2ci8MtN
         OVWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789611764; x=1790216564;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U+25ut/u/ktG52cH9j/Y9VE3SglkY0dcyP6JoqO5Rao=;
        b=S5ekuR0V9mnBySWOn8m7jIThOi9ZsYDvLr0k/ZjlRKbpkUOf8AAiT7kFz7vDVqQeoA
         peOwVJDB2JKIQ/umFc/eLGAlVKb0hZ1TTmYhwtDpjsBZitVkVplcZaHe/LMXV39iL+E0
         AwtZjfrfPG8lpID5XsXCh+XV6zwn06OHWCLRRv9sMnjaaXwtRlCXdv4Br7YeWbuuU7kB
         KbNRX1ZPBBbPM92In0cwNXoyX+qqAXX/eb2B7IrG3qfGeCA93vtXEb+M4H5vWeFann/G
         6MNd6KnBhMDbWYAuaERa27X/sHY5u94bB7JQ5GWrRXhF0SCbh6b3m1kxy+LT8AvZ3hsv
         KMjQ==
X-Forwarded-Encrypted: i=1; AKwUvBzKOpwtvpZgp2pm1kgGKHOp0pPRAl1lZ6aAKLEG81zA/hLL6lBu92wMS+LqwVX255OIpfEHpEfrSynLag==@vger.kernel.org
X-Gm-Message-State: AFuF++mYWPdRuC81n+9Eyxfm60z/uhrWCD92+zMc7NugFM5MsWc8HeB0
	6hRUOFQhH+UgFh72+3N86bysE0o1i7V7RO1DKYsVV2zSpiBputomQawAgAzlutMLz67FsS9feIY
	cH6eZaNvt2mFr+P/wXqEO6mjXxqrpyE7VAuFS8uj3NmZy3VDWI8ByV7QND9pVps+TOA==
X-Gm-Gg: AYBFou2ifLZQbXKKdH93ku4pdfeyNpqIgZdETVPuHEqELjRqvnsPXfdpFwZyYGB2vFq
	bZ1gL88LW271XS4QGb8et56IpRtMDHxBGkcZBDsiLBaBiv9z9s9NJg+jX7AkAdOBJHKD85I4TnH
	9aNoL1tDo/Pq2U5b8g3fxd46ztAmEufoeHrjD7DauKs5WQBancB+8ZFTWa97mtBRZ+v1UhnB6Up
	7RxH2QRJOe8W4mNlSiO79nGA1dMrFvuFyEidc4Hwpse0IacRHiKwBs7Qmt2CYvZo3/PrMLUDDSH
	GBzLA9B0xNpMatWuzXJxMMmUqPuMKuEBCBKIhOAYi5F8ejmDBmvHM1PJcveV6rrqVya5HM29VNs
	e8HdBnTqqcWHixHyRDN3ePMgs+DWhmMXDK2I2
X-Received: by 2002:a05:6a21:4d0c:b0:3d3:b00a:6f03 with SMTP id adf61e73a8af0-3dd5f7dac4dmr13014924637.28.1789611375527;
        Wed, 16 Sep 2026 19:16:15 -0700 (PDT)
X-Received: by 2002:a05:6a21:4d0c:b0:3d3:b00a:6f03 with SMTP id adf61e73a8af0-3dd5f7dac4dmr13014876637.28.1789611375102;
        Wed, 16 Sep 2026 19:16:15 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bfb19f8cesm14372881eec.2.2026.09.16.19.16.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 19:16:14 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 07:45:32 +0530
Subject: [PATCH v3 v3 1/5] ASoC: dt-bindings: qcom: Add Shikra RX and VA
 macro codecs
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-add_shikra_support-v3-1-fc0e79c341aa@oss.qualcomm.com>
References: <20260917-add_shikra_support-v3-0-fc0e79c341aa@oss.qualcomm.com>
In-Reply-To: <20260917-add_shikra_support-v3-0-fc0e79c341aa@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789611365; l=2699;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=2W5RObKszArgoD/A87TmkLDGOjvuwEXcOAx0z60Pp+k=;
 b=wKNHIkmZJI741JO5dQr0bnQahikCmBI1jV4CAGTzQQk2lWYuHtnUCpVXmfHE6NRc6cZyyQLqs
 HL499LhxNMpCO19uK9PC8xM8oneJFmDJqplXxDfk0zTjL5Lqk4aLbCU
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDAzMCBTYWx0ZWRfX0DTg9nYpwjw6
 2KpsBKKcyJUp1LtXlYdbJdMAnvwPJYtJtSKjxNaxRrEyCjS9wSW5h7S+5w4u2P3El7ZtufAcNpe
 q7JFNewv3Mj3h/MLO8afkptBUp5+X6d3X/Pp0tfOw4AY4fymfIlgzBpac+znCewKWPhIsPXgw0y
 gZ3I7Y0bKN1YXf4zEAhznmv+A2T3iPjuZd3AzpVO75eUtMS9GpsVzQ0i7FMxlQMEpa2fqP55LGZ
 lfHwHVh4rv+AoX6+Qb5DtXEgbJQ03rk5FrWyu6i4aPOSflQUf2xloJHenxk5Bna1g+WOSpwze2m
 XkKwHWc1+LTkPEmFGYmSM3DJz2oPACRNelJTzWoV713/yJlpu4c107qMhaEXJElbadR3UZ0kwe3
 ZSVjj8tOPUQ6WbmlNU7gyUkrpo2Ceap9HW/6GzuSdImTRmE19sQD2SfaB09zvrELxKQoSE5WroQ
 pq8esHSFF8+nzLT+guw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDAzMCBTYWx0ZWRfXxIZ8Jae4QT8o
 KEqt/xNvHcFeigDjteyikb3eXRZyY692DqKJkOyxpOLN/XNvfZtJPZooUPo9G8XVARs1PiDJps3
 DuRND5GtO/U0Lk8Mi/b5/BxMKBswPuI=
X-Proofpoint-ORIG-GUID: VogEBB5LdX9HuaHCT2VTER8XYe3JOt1s
X-Authority-Analysis: v=2.4 cv=K7O3jCWI c=1 sm=1 tr=0 ts=6aab4ef4 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=cvJDH5HnDjnG4tsKpogA:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-GUID: VogEBB5LdX9HuaHCT2VTER8XYe3JOt1s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 adultscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170030

Document compatibles for Qualcomm shikra rx and va macro codecs.
This SoC does not provide macro and dcodec clock so reflect that in
the bindings.

Shikra integrates LPASS codec version 4.1, which is not backwards
compatible with the already described compatibles.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 .../devicetree/bindings/sound/qcom,lpass-rx-macro.yaml  | 17 +++++++++++++++++
 .../devicetree/bindings/sound/qcom,lpass-va-macro.yaml  | 17 +++++++++++++++++
 2 files changed, 34 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
index 4988e7ed6..69d7b7332 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
@@ -14,6 +14,7 @@ properties:
     oneOf:
       - enum:
           - qcom,sc7280-lpass-rx-macro
+          - qcom,shikra-lpass-rx-macro
           - qcom,sm6115-lpass-rx-macro
           - qcom,sm8250-lpass-rx-macro
           - qcom,sm8450-lpass-rx-macro
@@ -138,6 +139,22 @@ allOf:
             - const: dcodec
             - const: fsgen
 
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,shikra-lpass-rx-macro
+    then:
+      properties:
+        clocks:
+          minItems: 3
+          maxItems: 3
+        clock-names:
+          items:
+            - const: mclk
+            - const: npl
+            - const: fsgen
+
 unevaluatedProperties: false
 
 examples:
diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
index aea31fbda..683ebf702 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
@@ -14,6 +14,7 @@ properties:
     oneOf:
       - enum:
           - qcom,sc7280-lpass-va-macro
+          - qcom,shikra-lpass-va-macro
           - qcom,sm6115-lpass-va-macro
           - qcom,sm8250-lpass-va-macro
           - qcom,sm8450-lpass-va-macro
@@ -168,6 +169,22 @@ allOf:
             - const: macro
             - const: dcodec
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,shikra-lpass-va-macro
+    then:
+      properties:
+        clocks:
+          minItems: 2
+          maxItems: 2
+        clock-names:
+          items:
+            - const: mclk
+            - const: npl
+
 unevaluatedProperties: false
 
 examples:

-- 
2.34.1

