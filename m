Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CCF6347BDE
	for <linux-sound@vger.kernel.org>; Fri, 31 Oct 2025 11:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761911312; cv=none; b=RUUyIOZ3YVLfMYmrgiaDuBK1KMdXVtGGsh9iHey5/vnf71RMyyk9GBQ5jCko8Sivbj9I1MBulex9ljBDyTIVDG5v0k4PpMJR7ZnjYLIVQdqwfFYLAJVo5QeMXzSKxH8+VBZfGdGJEFZmHwP7HkdIrbY96fTYlTF57gL6AFoi1vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761911312; c=relaxed/simple;
	bh=exPcFwTkKob1Kvtn/KJIwEEHNtSYPJUVpMm1QHlPqwQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J/YcD46RxvKhfXATtTLH0aXVtsRD60NuMfyGJuwjLuoDAEn4mMqxNORe6p8eLzCmEu8q122yQ8I19UqVNxEFb25nDk6UABEuVr6kgKqWTFrY3uTcAhzJJswow6qLOUmOafNQzrKTUsymqVlYiiQc5JFSOni4KPU63So+eU4BDW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E1cCQ/JM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K/bkJT2I; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E1cCQ/JM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K/bkJT2I"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59V8LdcX899331
	for <linux-sound@vger.kernel.org>; Fri, 31 Oct 2025 11:48:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=MlpYleSVISD
	gz2HE7RgANuLdkU0REzZ/tp6gPxx4A68=; b=E1cCQ/JMW+9ZFzhg6+xOOMfjuBZ
	Xcgp39WXsFWlAaQ7LtY0gR6pcHy3Bd3pg6KudxYPUm5+DEX8TDINtnqSSYgKudsC
	8B68asWuc0ZczkmN59Gv2EXj9ayJd5O3+puS5D3WCAGmKNJU/gP/cO5MZVMgFhIV
	nQe/30QVXJ8oMmHQp3NZ2Sdzz4DJFzDcn+ccI846arEtuUtCuWzAb6ZiXk8cSuNC
	2MC3UCKxhHjiG0zfQc4ObJHzNFaYBE8erpUbZKpPXkTo9Wwagucu0ifEzhOUTBmQ
	eCojS2tgrPaP2Fga8EEGOZdRlX8rlhvYppKzSiSI/v8mtGyrsnDh/3/roNA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a4gb21xht-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 31 Oct 2025 11:48:30 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4e88947a773so89077331cf.2
        for <linux-sound@vger.kernel.org>; Fri, 31 Oct 2025 04:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761911310; x=1762516110; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MlpYleSVISDgz2HE7RgANuLdkU0REzZ/tp6gPxx4A68=;
        b=K/bkJT2IUKPpVgCSPZ7TBMhNAY4Bt/n7ln7mMOtJSdjSd6FlhgNW8GPNBGRStt5XEV
         ekS5b+WEXLF54piFXqlZqKUavcf4Y6bT8zMdnXkWUn+TLaq4D8WmjnEDjqEYcmnFWumX
         /NhkkQxqZaDV/Z9CMZG/toP/9ci9dNhbRxIXAMBH4AOIWaXP6GmUKA6zHOu7K4MxsOAs
         qxFBT2+dAOoobdo0kGsF5tV/gBWDUJiU3WEFQXIGxBN+AONDR5YbicYb+fDfmbpc9hQ9
         WovvziABVQVt+V40lD4yzcOweXMHC2dQtq3bD9sN+vCAJeSOe1vlNP405UBABC14VstA
         StfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761911310; x=1762516110;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MlpYleSVISDgz2HE7RgANuLdkU0REzZ/tp6gPxx4A68=;
        b=Kzp9ePeOft4NMH00kroV2uKA7KP/gaCh9ugmCzc8Ga4HfBMXAcMm+ezycDB9V70gQK
         R2PjP6QPBsJ6hhpQDNDtdNYdqhcVHcbL7St+itybyLafwWNWQ/f4Yub/XVmTszjuz4Hk
         A+cKpVEBXCclC7O0DtTHSj98UWUokjNBNFewhAiRJ61P73jj1rgxRIlE07Up0UnjUS+x
         Qjz37YKBNaJuyEa9PzmxPJ4K7oftfIcEQqWVXoKPajHcVlnTxCwLTFJFQQrnDXEUnUvd
         U66XM0RbIcP27YJBhDjoKCt4sN6nYngFWpwTC7vVIXJBn24jrQY24BBJ5LkRv8IYJLwZ
         dvfw==
X-Forwarded-Encrypted: i=1; AJvYcCUQZHZw/HJ9OUu7FVMUGV4VUf96QpPzbGvjCheiUIMxBT/KWla5q7eGj5Zr6RcX2uLHgT5Cuq5as01fxA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwdnNCm3COEVDINgXSEfBkHanScSzsK3FFdKOunrmblm6S3q+uF
	abFie2L/sEizPRNeagJmRDWgyNDHiaXGC1hJb3x+GUL0S0pnosrT2GMdXWzWHTYu+1P19pztqWg
	sSj6GwqfzzVvoSyrgE2h974Yp0mvBQV0gR5NpSAozJ/HsZGIWmUj8Mkum6TjA6JKh7w==
X-Gm-Gg: ASbGnctQZLgdRWQRraV2sqYXhrXlPbeHoTcuxlpdZY78eAkcDOX8BxoxtzJ4P5fbTCt
	yYUuRNrHgrEMB2te9pT2pRytwnx9IIUix0nyQyCUObh1IvOQnkX94lcM8AQCLBwh8wm6qK6QRXp
	Adz0Mm2aDfxcBabBGm3qXutkk2Qdus/p9r3DTw8ZEJgJtTTRn4BIiFd9RQMeb17q884VYQSxQn+
	VmszH2Tr/2m29yXNG1XORWVXCE5qXClcEmBTeUgPwIvg1Se61nh7rY1Y+kiOaM2DTViZTAcLJOG
	YlGdM6fMpKlvAUJgWQL9wa2kmzSj/v5tknqLOi+oo91oeYrMGGnpEwWlEj45I5RLtxDWXvmXmfr
	XdXft5b/21+yo
X-Received: by 2002:a05:622a:1dc4:b0:4e8:afdb:6f5e with SMTP id d75a77b69052e-4ed30df22c9mr38840611cf.24.1761911309793;
        Fri, 31 Oct 2025 04:48:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFoKpOm4SAtLAUUcr6TFmMPzErmIDM7Fd3YcuKI+BAGtXEJ88JJutOrY2elxmC5mM1g+Nkiyw==
X-Received: by 2002:a05:622a:1dc4:b0:4e8:afdb:6f5e with SMTP id d75a77b69052e-4ed30df22c9mr38840241cf.24.1761911309256;
        Fri, 31 Oct 2025 04:48:29 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47728aa915asm86831165e9.16.2025.10.31.04.48.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 04:48:28 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: robh@kernel.org, broonie@kernel.org
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
        perex@perex.cz, tiwai@suse.com, srini@kernel.org,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, alexey.klimov@linaro.org,
        konradybcio@kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 3/6] ASoC: dt-bindings: qcom,lpass-va-macro: re-arrange clock-names
Date: Fri, 31 Oct 2025 11:47:49 +0000
Message-ID: <20251031114752.572270-4-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251031114752.572270-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20251031114752.572270-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=efswvrEH c=1 sm=1 tr=0 ts=6904a20e cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=Zn4RAEFE0_yfxgg1y30A:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMxMDEwNiBTYWx0ZWRfX91+c+MEEO15F
 05PX63//eh3gXCsAHQagyh7hkbpvKPHt8peR4OcU0eCpNIagTBwuJCL0PjjT2pec8894AAVQIhM
 WcuSC0R2Jfel8dgtu4SLC6OJjDxpr408mMIYNXy/aNLmdlJPHIFspQskM7pIimzW7WfGF6QIj0V
 Gl9N9uTwTD9Q1jrtmCQ8NFD5JR2x1zGwIF32rxoBq2ro8WcLGjnBGPk4JDLDTUYYt7n3wchzC4K
 p9Wad3wo9GN67gC3HJ6es5U2dvx9Vt3HJVY+wssCqDfqgTV3j9jymJB7C2MKr4Z92RJSmXvCa6C
 fF9JZntIbeSlZgTQo2lcjtMN98geI5IBLc5QPzfGOtgsFEFE3EHlgXSOAcOGoYb/18+wwcKCjgt
 ZfG76lLC3s+XIbyYLVlSe/pb9sHO3w==
X-Proofpoint-GUID: wYM-IE4xMNZpkffIH2K2MvfsJRbPggMk
X-Proofpoint-ORIG-GUID: wYM-IE4xMNZpkffIH2K2MvfsJRbPggMk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-31_03,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510310106

re-arrange clock-names in the bindings to be more specific to the SoC
compatibles, this will give more flexibility to add new SoC's which do
not support some clocks.
Move all the clock-names under the SoC compatible rather than keeping
int on the top level, this makes it more align with other lpass codec
macros.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 .../bindings/sound/qcom,lpass-va-macro.yaml   | 35 +++++++++++--------
 1 file changed, 20 insertions(+), 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
index 5b450f227b70..d3851a67401e 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
@@ -42,11 +42,7 @@ properties:
 
   clock-names:
     minItems: 1
-    items:
-      - const: mclk
-      - const: macro
-      - const: dcodec
-      - const: npl
+    maxItems: 4
 
   clock-output-names:
     maxItems: 1
@@ -91,16 +87,18 @@ allOf:
           clocks:
             maxItems: 1
           clock-names:
-            maxItems: 1
+            items:
+              - const: mclk
       else:
         properties:
           clocks:
             minItems: 3
             maxItems: 3
           clock-names:
-            minItems: 3
-            maxItems: 3
-
+            items:
+              - const: mclk
+              - const: macro
+              - const: dcodec
   - if:
       properties:
         compatible:
@@ -112,8 +110,10 @@ allOf:
           minItems: 3
           maxItems: 3
         clock-names:
-          minItems: 3
-          maxItems: 3
+          items:
+            - const: mclk
+            - const: macro
+            - const: dcodec
 
   - if:
       properties:
@@ -128,8 +128,11 @@ allOf:
           minItems: 4
           maxItems: 4
         clock-names:
-          minItems: 4
-          maxItems: 4
+          items:
+            - const: mclk
+            - const: macro
+            - const: dcodec
+            - const: npl
 
   - if:
       properties:
@@ -143,8 +146,10 @@ allOf:
           minItems: 3
           maxItems: 3
         clock-names:
-          minItems: 3
-          maxItems: 3
+          items:
+            - const: mclk
+            - const: macro
+            - const: dcodec
 
 unevaluatedProperties: false
 
-- 
2.51.0

