Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFF2F347FF3
	for <linux-sound@vger.kernel.org>; Fri, 31 Oct 2025 12:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761912460; cv=none; b=B1/CyY3j4P2OITf8dF+MWmNm4ng05J/el+/oYgXQpwvGoZlHs0KWej93Q065OeqWkZOruZJ7OPZ0F/savLChwqW3iRPhWFob75MPBtDpC7hys9gOwpKB81W8XAhzvMbfPTa/uwvWmay3xqb3w0apdRP0OVSUVUpXbQg5VtqtDUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761912460; c=relaxed/simple;
	bh=sOQOsePjYlM2SdUmv8lUrLY2KaB8teOMMCQg12ut7nA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UPJszFTOuGDaFia3vPs+Q1xSq/P9UewKow7+VXGQtVV1vfRY+KIG9zQ/Jn+9inUnK+c0BBobjIx0LPUn9xIT1J3vtkQxqKXr8PtPwe3Lm2+WYvojs/lIpFhXu1x7tNKKj21DzU29UwSKR3xoLZJjn9Qx0MT7MIlUIomkpoonyjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K2u8DiSD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IFTGatTS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K2u8DiSD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IFTGatTS"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59V9jOq02471162
	for <linux-sound@vger.kernel.org>; Fri, 31 Oct 2025 12:07:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=j1FjvgdJcCM
	iQjsMtzDEBVWbE1HV5FnpJ02ra3ujabY=; b=K2u8DiSDcs76r14JBy2xvX4pgaf
	eePHSlAzFrlVIBlKK7g83FIcFVgmzsMCaaPpX6GNLFOLmdGuepu+fVK6dWu4PLqi
	ZvNXycHhrmYZ0SwAtJU0WVLAp/4ewC8qlYdvYJnCzMfE295fy+Xa+fVphOhmszNF
	+4Rj8G7SHptRCnWCUCPE3Ovw/OyfSbvKsb2QYZ9IcxolusZ8kMQNVQvzO1zF9u96
	ufy1x/xtW6mYeU4OGSD991PEScc9V5DMRUSda0fM0TsfwJ0gg4t3fcVWgDFLdZuc
	sXEeh87W4u7i+MxZwraKBsRhQyWyK/OS7sKMs19awDPMiyedgQR1sjAmbPQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a4trv0bqq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 31 Oct 2025 12:07:37 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ecf5d3b758so39345801cf.1
        for <linux-sound@vger.kernel.org>; Fri, 31 Oct 2025 05:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761912456; x=1762517256; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j1FjvgdJcCMiQjsMtzDEBVWbE1HV5FnpJ02ra3ujabY=;
        b=IFTGatTSZb5io4Edoq9MiBsXftmN0SDQhyf1Fk99zKjCP9VQbE1tg5zahOLvrX0jsD
         gom79HhYlMQxJAbInLOZJ2tybGA3KDrFwsLHMWI4esjHE8lBUfaVvk0o+qhIXmCkxAPz
         W3allLBxqETTYV5hbfYMHzYjJfT71tjkt+PnV1cjWAEWootmvxy0fS1fnoh1dUZI1FPU
         OPuebDur+2yEPUEYDtz2YjmEdeyDX4QO866ZVpFy4fuG3XS+qnrEnZlRguX/dlxuHv3x
         FZVJzy53gq1pI31a6P516RghafDLOcqA06Kh7S7pZ1xwSyoxnL24qNLUbcgloxLIDoKw
         v70A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761912456; x=1762517256;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j1FjvgdJcCMiQjsMtzDEBVWbE1HV5FnpJ02ra3ujabY=;
        b=vlTPc07CALbtdfQfn2DQNmWfr74HJVeoim6T+eusDGoH5uW1SKkmUos9gbkUbY6+i6
         VI/XgwCRh+w6+1J37yJWud/s2/YUx0tcGV5rSmr8VySLzK4+MrEoA6wA5noQsHh+SuRo
         W/xoy2gLdeAfQfdeqkmZVLUqMTeRNZoMTZl33E0lhafNu66BhxUKiZtpnpo4j0Ss8vFs
         FBQK5cUcKWfjbSRaYbGvmz/pPELK6CYxvWtak7s5CPln4nnUZahUiaLIC+CUBXz6ySVr
         jHf7fhEdNxRNMOEGISt1Qn3SuK0WuKu3nTTSa5su5WPefo0tpFfDOYxxpV87bbHjCbeK
         ekTg==
X-Forwarded-Encrypted: i=1; AJvYcCXRuEfvvbYZwIk9Tx3ZaNsmUrX4e2hBFPvcsWGBml1t0euVju2GxIjsGsJwsroioBpgkIWbQTg/9VxWlg==@vger.kernel.org
X-Gm-Message-State: AOJu0YywQXPfQCKHYRG5LCszlMzWAmXLJR7Fk93QLRSO6MQSwvCCjuTb
	EPaZM+hPChjJiizqx5Qw/XbQBc9YlX3ZL7LRVortft3hXDcHpJ44S/98MMvQ4ARFMKja8bSDZrn
	EqmQhL42jkJ6sC+CrRk86IZVikuvXA8L7xBbrI7c32dbp7b/ITnY6iF1KDxTVHNPkx/ynHSRhsg
	==
X-Gm-Gg: ASbGncscPgH9XczPqUoonfaBqZMhFmgzjzEXaMwI3FiFoUsyrrIcnxjME3H8Dg1pfj9
	Q3JOB5XutCQXLM1JtZ4nY/JGmoGCJrVP6ky3umBWfLmaUSP3P5SXShT6orU+Jd7YLalsLQgDlVA
	3TIyM+WbAO3FnVhuXXy//oyut/BoSupzfGLFO8wBbz2GNu8JpiufMMy0NtBIzaEEzGPSU1rVHwa
	Z2u7x3A3xpjPGHewcMtpoxqoXwhBWuaVj3b2SYquqDQl/szW9Fn0TV+bDtXXOJAVnXu6oUKZP/T
	z0qjhew9TEkG3v9zZy9u2yxiQpoWdEg5h0ez6lIXzfOg1ZJ+Uv2seB6QsArwKWHPy20kUGrJPWa
	JVQQ7C9qabvBm
X-Received: by 2002:a05:622a:480c:b0:4ec:f634:7966 with SMTP id d75a77b69052e-4ed30dccfc6mr45714871cf.23.1761912456508;
        Fri, 31 Oct 2025 05:07:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFBnzrTnYPLE2IH4J5tqf7U+h+V3pAgh1vyeu2UR/XQoXDi5qUOwPWROjLqiCxAElsaJcRN3A==
X-Received: by 2002:a05:622a:480c:b0:4ec:f634:7966 with SMTP id d75a77b69052e-4ed30dccfc6mr45714221cf.23.1761912456103;
        Fri, 31 Oct 2025 05:07:36 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4772fd280fbsm21273995e9.5.2025.10.31.05.07.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 05:07:35 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: robh@kernel.org, broonie@kernel.org
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
        perex@perex.cz, tiwai@suse.com, srini@kernel.org,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, alexey.klimov@linaro.org,
        konradybcio@kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v3 2/6] ASoC: dt-bindings: qcom,lpass-rx-macro: Add sm6115 LPASS RX
Date: Fri, 31 Oct 2025 12:06:59 +0000
Message-ID: <20251031120703.590201-3-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251031120703.590201-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20251031120703.590201-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: HGha60TTvgf0iTYE7RXdd7hz1KC5Mi93
X-Proofpoint-GUID: HGha60TTvgf0iTYE7RXdd7hz1KC5Mi93
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMxMDEwOCBTYWx0ZWRfX/bUtciRT6zF4
 15nJeyhqzwlnayagITNmzXkKxTvXO1VHcCn0sezxcw7EKQ7LGshYt79Rpmxlr5NvzN55i71a6G7
 KtOB1AcGaEhTQowuJz4KLRcWu+hQhLnCeE7pjQAP4borV49yoKA6lbbOYg5YIAekYN1jAG1r9jk
 XfBktktVsQYAExweN6RkM7k0I30SAJBl1GcCReorScTuTLq+g9urw1facr+/XxzzmkPZRyBbviQ
 kld2LvbM04rVJhWVRjyBqoqwA2N87WXNhM98nH5GFYq/v5SnhK+CNyFGJLAoJ88GAg9PXdtPBTI
 eN55gEET7g9FhvC0ETS5UTdWag0RIuClgS0HbQ8QoMBZPVwQpw/n6V7vixdmOrjAHjNwY1znb3G
 k0wTx83HPnFTA8pRu/4Acr1tz3xOFA==
X-Authority-Analysis: v=2.4 cv=XoP3+FF9 c=1 sm=1 tr=0 ts=6904a689 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=Vptr8DYYLnhAWPBg-1oA:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-31_03,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 phishscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510310108

Add bindings for Qualcomm SM6115 SoC Low Power Audio SubSystem (LPASS)
RX macro codec. This SoC does not provide macro clock so reflect that in
the bindings.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 .../bindings/sound/qcom,lpass-rx-macro.yaml    | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
index b869469a5848..2eed2277511f 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
@@ -14,6 +14,7 @@ properties:
     oneOf:
       - enum:
           - qcom,sc7280-lpass-rx-macro
+          - qcom,sm6115-lpass-rx-macro
           - qcom,sm8250-lpass-rx-macro
           - qcom,sm8450-lpass-rx-macro
           - qcom,sm8550-lpass-rx-macro
@@ -81,6 +82,23 @@ allOf:
                 - const: npl
                 - const: fsgen
 
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,sm6115-lpass-rx-macro
+    then:
+      properties:
+        clocks:
+          minItems: 4
+          maxItems: 4
+        clock-names:
+          items:
+            - const: mclk
+            - const: npl
+            - const: dcodec
+            - const: fsgen
+
   - if:
       properties:
         compatible:
-- 
2.51.0

