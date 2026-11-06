Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793968409;
	b=ryXea4nkocAAfh109tTKWj0DnNXRnr0AGRTal2R7mqdwzcMCPm0Afyp0Y36DNNIjUN4e
	 s9LnjV8NrWJrIonXiJNnkSEfBwGdrep2I00QKFJNhP76SOwq+DVqA6NQY3i72dlwkKtjs
	 bNVBfojS4gY5wcCNAzh4RH8ZlGPyR5BWv5x/lgQQqY7wsWSrf4KHsPLEuWvRnJ8+P75Pq
	 VugqhGJ/cMlsZipZlHGtLkejHrtFkHRL0IOgCaKMGj2NuOAz9NxdPTE8Y5UqfMBCXviXM
	 NxK3qrA1+x//EyG1WEBpxDyqsbl3O5fRviKvegAMsjT9kVjq9UthUu7i14X9O93AHPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793968409;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=wd+LMuLRpSZRXGXb/dAiAaa0M5UscL/xiRD2H7enQYI=;
	b=P6aBwCc1Si45blpKVJjlXFRrI89g+aKkB+nVQgUJJRszUFv0mR6cPsJHHs2sCMgwVTiS
	 KiksKcqywF6DB/DIHYV7wbAupL5c7sVJ5nzzjww2+wsj7oDMiOBCSiCKdRWpxDgjDE0yY
	 2sPYPVCqDCvpqWqrNI5A0vlhHZRpKLF9JBqGWA54mzdNDo2jAuBeyABL5guDO3oJpgv7a
	 kriw/HO0KztkagBSlSTEu8BDhFkDWvKdzfsFjjAfitS/awZSaW4CE24HZandrp6VAhEgr
	 GIqfWK0hV9SGdg0mct7au2rp5TXUcrqzjJBBdzw9UZi5x5oidsXHG6HlTQYAHu/DSvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Fu3AmKKc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hxCCIg2I;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F197606A32C
	for <linux-sound@vger.kernel.org>; Fri,  6 Nov 2026 12:33:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F197606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Fu3AmKKc;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hxCCIg2I
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6APIYO3646031
	for <linux-sound@vger.kernel.org>; Fri, 6 Nov 2026 12:33:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wd+LMuLRpSZRXGXb/dAiAaa0M5UscL/xiRD2H7enQYI=; b=Fu3AmKKcEYz/xx1l
	IoH2xAcg3CddEvzgqhaeRcMq7G4D2vpA3MO5xK5BU17vfbJsnOFJM/inoG9qGC55
	T+6kjTulZessePNg0CvMBDkjaCdipYQV5qq5ERh/oHbnKtLBdRpASuJ97tMzkzZt
	0uL5VdVi4liyPQN4V+qrR51Fe10ncGhoP2aDnWLQ6I+n39xMaC7rKjQ24MHPeTPD
	WXM+Euj4mA1SPbAK8lC+LC+gKXmPRahM8YkghucdpFACXx2YCqQHFr4vaCGgF1oY
	RdkssO+soMRt/AyhYgcT5YGpOO7s7p9L47FUPON+2dVcY3DsrS04pYwvIK9PESeF
	qcnUuA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pa2r67-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 06 Nov 2026 12:33:27 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36f26e6abe9so1123295eec.0
        for <linux-sound@vger.kernel.org>; Fri, 06 Nov 2026 04:33:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793968407; x=1794573207; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wd+LMuLRpSZRXGXb/dAiAaa0M5UscL/xiRD2H7enQYI=;
        b=hxCCIg2I8Hy5Pg6aUXOPc8LmjCpe3corpgQHAPiMfZ9WXXgno4Rkvc7FUmrW/10zFA
         VNLCBkFsAZK+15QhOdfq6/6L2a2GItNDeL2g3nx874IJqfEJg/MhR0AoKK00yJdbjRWM
         h8oSVr0QFn+59EYoDbU5H6R/ocybrfx1E1zRCe8YhphHQR64B4AaBymo16Cnl4igZO9q
         lCo3/WoxlaAeYj4IDg0kS9rwe7VF3bv7A1urody3yhuANzz+CTOg4blFlvVF9ttUWuRS
         OIsLTbyNCGQaGCcw9+RahbO5lVGxBEik57gFpkOyK5UOu6E0ZRbit0ps3vxDOU3WkIAl
         dyrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793968407; x=1794573207;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wd+LMuLRpSZRXGXb/dAiAaa0M5UscL/xiRD2H7enQYI=;
        b=gZIOw7IpmwYiM+jSt7YhWIBsdCA9Ksxp0lb65qaZpj5lxt8uc+NVPD8DSSYd4wPhv0
         FiyYDBh6NokWU6t7G9FLCM7g+JAK4rSIdSEIbirlnkgbfMLIRgmsAifVEn4r9XSNeZsa
         JtJ130NhCoDUT8+TaF1sr6NVqub+kB11JtcPCWKERfy2So3Zv/CaIw/xVXlR5tsRGIVv
         3LJllH/mdG6rqPuX3q3A1Z8P/C5b7Z/QhlnFPw3hZt7Y/SxNQxVB/XLQfScp9aefRIna
         VGjXo96MUefzPyevt3SxaC9mPYIkT5lx4e9Fxk9o2SSLXqk1Gy8SxWHVga76a2EBeBcL
         6PZg==
X-Forwarded-Encrypted: i=1; AL+hErHH8D53e6/1qTre3xcm2UuwTb9zUCwtDkxzL5pF4egqhAnAJ7ppv7Oxcow5sjWmMjMQ6wVzfCyXbfJGRQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z/5/cozw/c6r+mwk/P2uzrj/Tc+8Lt19y26tIkwhEqdpQatuTt3
	YJzwY/3w1j9HXasUzQvAUenjtLmxaoh3dy4EMpFe60bWSJbTaJB/Gtb3xqDjSzJiw/VQ4xIVLiG
	DmPSJKFTKP9JlgamDiRRPwM7TGyPkp61QYvSdlj4sy/DWgE64Gi5rf0p/duvz3uRcoQ==
X-Gm-Gg: AYBFou3VV6tcSA7vQr3txCMWDepGS8BZJl9DaltRQpnKqD+4WkPH1fwlmzoGnmjTMsn
	7I1oV0X4U8xGTLsK26401pk9CTfPSuLBnvNjbBZXj6MNJtGYbYXzbyqUZ6BFaFYAUIbZ/miGYuG
	uD6pp0Kyj0iN2rtS3mIxr14HiCAHdPL/CE4/fuv+6JpK4wkzhvKmYiPl+BPWmUh16UvvgTwGXAY
	cs8MHGTo1/eHuEEWuliEkIP+k4w5JvN55LhPNMSGnX1ncVKCUtr2cWDKjaHkb8ziP13gzplOWoa
	fyI6+6Wt9/PYPgYi8Q3H/dWikJBtShB57LGOQf70U5bT1g+5pGxGS005vDzVyHgTE2o7iz4d0x6
	5YkfT0zqEIDo++GvgApYR7TYP7g7R9ZgAbTemFf9PJxy31FtZI1xQy3OxHxPsXk0nqdwdhvClWZ
	vb/oZR8dLN
X-Received: by 2002:a05:7300:c7cc:b0:36a:1f8:a589 with SMTP id 5a478bee46e88-36f76c17cd0mr3148769eec.27.1793968407113;
        Fri, 06 Nov 2026 04:33:27 -0800 (PST)
X-Received: by 2002:a05:7300:c7cc:b0:36a:1f8:a589 with SMTP id 5a478bee46e88-36f76c17cd0mr3148723eec.27.1793968406370;
        Fri, 06 Nov 2026 04:33:26 -0800 (PST)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36faa4b8aacsm6514804eec.23.2026.11.06.04.33.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 04:33:25 -0800 (PST)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 18:03:00 +0530
Subject: [PATCH v6 v6 1/9] ASoC: dt-bindings: qcom: Add Shikra RX and VA
 macro codecs
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261106-add_shikra_support-v6-1-2cda302237cc@oss.qualcomm.com>
References: <20261106-add_shikra_support-v6-0-2cda302237cc@oss.qualcomm.com>
In-Reply-To: <20261106-add_shikra_support-v6-0-2cda302237cc@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793968394; l=2759;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=vsQiZmFC+ZXQTQ0lUOQFxllYT5f/JYtRbkSGpdjvRBg=;
 b=HLz9BdEh8/qiFIXkZbf4Rj8A9mKmTNbB1Veg+lgSeibcOithsRhztMi2M3t+GlrkvkExNtV38
 VDP4iSOR2CTBnRVk9uaySFlblpxYUjmG0Fsypf3vkNUzUoI186SfDwS
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Authority-Analysis: v=2.4 cv=PLeaavqC c=1 sm=1 tr=0 ts=6aedc917 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=enWoqSm7ZukIuFDY9bkA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA0OSBTYWx0ZWRfXzVw9ZeHYpoNQ
 /DOKebKEn8+p6aBhcjcMUkxmfeXePakIe11yyNLw3REWkSFb50d+2vb5Cp+RezFwzG1a7CWWD2t
 9FKbSvV3Jcp9WFqAexP7dCBDxD5/SiM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA0OSBTYWx0ZWRfX5a1CtgiXgFMW
 1n8I3CQK18xW0SkDHXDk9TW5uaCof+ajcwpYJGJ77AgRqQKYDSQv/VTBZfByYDxucujK+7R/aUF
 +EpQkTWWSCd7rYAfOD1e61a3ZzmVeMWjVUAyrlOcvdLwDLP7E8PTQJzgBx+hi0Yc926/KOSVfLO
 UL/UKLh+dtvOOo3O4Ky3Yhe9LIKUKsjDHguaG0tMMz4r9f4ljfV3UZU0IieIpe/Ie50BwVLued/
 IRatoqk43o0tPUTNhS0Kc+l3dd8jBtwrrbZd0rOKuVYlyGIYu0KwP5bkOHCcUQ4rYZaYb0gUgcb
 t4SdiNKpyRnV1ovfzMUrs0fHOOpS3sct/WF1e5qGFcuFq0HtlPDcWgZ6F/3YyKnlUgi9StXS1/M
 8dtVvwz8RjL7Qz+zxFF9FVwb6pqevNJ2+E9rHQKeLIYz1REaHSJ/c2oyR8p+mohmz9U9v4rQcrS
 IBjQgf2WccUmj+p/7jw==
X-Proofpoint-GUID: K395XjNFtrX0wffONTB15rE9uyLHqi3N
X-Proofpoint-ORIG-GUID: K395XjNFtrX0wffONTB15rE9uyLHqi3N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 spamscore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060049

Document compatibles for Qualcomm shikra rx and va macro codecs.
This SoC does not provide macro and dcodec clock so reflect that in
the bindings.

Shikra integrates LPASS codec version 4.1, which is not backwards
compatible with the already described compatibles.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 .../devicetree/bindings/sound/qcom,lpass-rx-macro.yaml  | 16 ++++++++++++++++
 .../devicetree/bindings/sound/qcom,lpass-va-macro.yaml  | 17 +++++++++++++++++
 2 files changed, 33 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
index 4988e7ed6e34..db63a75f108a 100644
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
@@ -138,6 +139,21 @@ allOf:
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
index aea31fbdad37..683ebf702ba8 100644
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

