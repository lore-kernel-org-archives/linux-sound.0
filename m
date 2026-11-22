Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795372917;
	b=yEzk5t0kF0HZMsP3vWtGoLnGLg7TzwkZyjFndthiTq2hSLfqbkG87pPrGmgdjDZ0zRjh
	 0VfpotCl+tSlLjhwsnjhko/QOw443ALeHsds6pyRaCaav2WOmQOlnuWjXnzSA/+SNs2II
	 qYOBISwF6Pl5f1vKRJDgSFTJPcV5tnAIAYCJw9VIcVuvLmYB9PBM/sM2iF7ObCwl1HsJY
	 7kadqBDz+JuyGa3pYV9m5QK6/3IjteWper7F+S4aXhLaELhkNkV2K/RbfOq3avs0xWe9K
	 B3yZj1ErUqW303QEEdJHu1Feqbw3XWZ9zl3/Wd43okzXpTlg3ixLHCOid0QoyLqbP1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795372917;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=2XFWY4jdO5UuPDaIInCP72F8EFVWk3NjCq6GU4tVhPo=;
	b=SCGnnMBhARzjx/9fGwAEOK+uMspu37woH0B/ox4nMVXUhLQZZJ1zcCdU4Axmrh+OJK/K
	 zM+08RC1lDoDkwqbKRp7ZmHC1/opZ+k/+7UT5X6ec7QOc9gfMz2Ns+UMKbznQYLK1Ejuz
	 J+hjUL2znRR3tbJq5OkLq4ImWqRmKMkwAUw+jfgI9E9R79B0vyuP5vO0T/FRrPaHtTrlQ
	 wvt2ONvcSkBjVao1YxTkm4pPpfcTZ/yioVFM6MYSl1/2wT/9vkpb4dLc4lC9RkFsmaa2e
	 9S0e7vD8Jqx7+IDAjzINH15fpMadK717r9VKJvuy2VQgZLRwsfnaNmkok38lN30e2MA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fl03wzcd;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=a09W8RZY;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62A98606A332
	for <linux-sound@vger.kernel.org>; Sun, 22 Nov 2026 18:41:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62A98606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fl03wzcd;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=a09W8RZY
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AMIdf4A224868
	for <linux-sound@vger.kernel.org>; Sun, 22 Nov 2026 18:41:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2XFWY4jdO5UuPDaIInCP72F8EFVWk3NjCq6GU4tVhPo=; b=fl03wzcdsKXmSpCo
	y84g8v2TR0/Mh03bwzbnmQzowhDCRbjOWHEwzffPt7gLS99yhZPOZXqbbmnD4U//
	3N6wVbWqaisBQ54diLJ8jHAq9RImZqmAXkIPR1y7GDAkYstA/df4Pda6W6tey93i
	M22K8NooXyFo3eYRu6FXHBbaKlIFzjluNG/ygJzuMSiy8IU711CymN6u6UEFXW+l
	n23ZfI3fZcKWNjkRDlZkE5gY4wIxdiIc/DTydbVlP+mguw9ksd9r31jUkZT3X79g
	qvWvUYwwfjZ1PC0ElP/1J7KN4PlykDZpPUctNK2945ob1mmMIT233X9HrY+CKiO6
	bNd0wg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j328rv6nr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Sun, 22 Nov 2026 18:41:56 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-375bac6bd21so3022437eec.0
        for <linux-sound@vger.kernel.org>; Sun, 22 Nov 2026 10:41:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795372916; x=1795977716; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2XFWY4jdO5UuPDaIInCP72F8EFVWk3NjCq6GU4tVhPo=;
        b=a09W8RZY4OfSdY7KWaeQ1C8kHmXx6dhHhW9TVaHTH7t2L9sruFAPONPlRS4B3SclSb
         uqqHgIVVphiNB76U1M+g255gKaSi9Qpvck9nikHRirtM2Ll/AvMB3any6oQnfyc1S8Fp
         ej54cQCKNIz39aUbHULFjlqWEKGskyUO8j8Xg3X2OM4urTVJ8Phs9OKnzzk9v+aI9TEe
         Hbfz/PyfhIP7364Wz2UwD2VTCFLuQ4ysf1QK53EOGJs365Evs+4G3lG8WhBogJkN72F1
         BDX9VoDXa0zVmGF2wGI4U7mNuIwfxozK6zk9AmZTs72B9g8uMKZsDtN9u6hIxlUAb3Wm
         tX8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795372916; x=1795977716;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2XFWY4jdO5UuPDaIInCP72F8EFVWk3NjCq6GU4tVhPo=;
        b=DYrS5tVCoHd5cRgol8Jt7ySvU0kgxQexThKoiPmOcVrKAwc9A4iV+2ISs9Fy/1Lfho
         WT5UDXpWXLTOECGFmWOZhqfgpYUab3qrD96LaUemfqcMm8kJAkvV8En/BErlmvdnOLzA
         0Zi3b7MejMPlhskFGVzOyB0LFcHhNZ/bQ+kzMAO2WvuOMq0Q/xkrAS5KrOEZUV1zIl+g
         o0ddaoFYLbFokPza+Ej5XMvJXiS4Unx0+WpP7G11ZgJA88rFFwxepAeDsMu+I6qFs/Py
         MWFuX6xzYHetgZiSbp4eIaHNV8r0NYJooI5FyeTd7nBCQBis/vq3S4/DSa29NHFUArU8
         AHgQ==
X-Forwarded-Encrypted: i=1; AL+hErGD5dNj4vDRFg0b27w3gq5Qrw44N65ponzGIDuXJxT3I1s6vN7OXLcxPOkFGCOQnfQ1hIMqpVZExmA88w==@vger.kernel.org
X-Gm-Message-State: APuU4Z8nJSZEhlQcrYSti2Xvp6n/+qrFK6cavDOWFGpouVJhuzjOMLsS
	n3vKRFlAXe/5GQRVXJpue8DfYSbUcG5lRlQabzr8FANGOqS0L3zq3mhEJpWGSwQmRdhBjWXXTL3
	e8Fluxya1oSaARtwXrYS+vz6FxQE+koECPHz3DFh6tal/EtVaxgi88bWRnAMHB3NLhcgWM5bwOg
	==
X-Gm-Gg: AZFdTZcotDUIK38v6ZcezmbUQmDA4n1/OyZK9svKrKhRGExqSGsvbA/r2v+Yz83MoUj
	5xX5pKEIdGuM4jvZFQ0a/3wvYboP0GgqtQ3Aiby8RDRvbRRlMfNwXilVHrWg1mRZ1UVCUcME2GE
	iu2B/guy9sYj+RgK6g1An8V3aO1rWDGxt1XO31CPt+Plm/0ko3O4OFEpL0yMvLKMxBMfSM5IMBY
	ar19s+dCnBzZeIl1ZqvETMwn1V/2fHnOuM047d0e57AxD4d+13glgzubgst0RVSVqhSOyRBMnGj
	oO7labDo255ZwK59GhIQyRIwtPLuyDkh3AIQdFC14ulu2D2Y6reQNUMszSf5Ipf12KUxLeKICSb
	Y3S1tyAg06u3KWQZBABz8edmvfzIm8OGgTpzZk0WAPdPRAwJMWtRe+S/YOjJot4RWZYikKKcSBN
	hEad0JObPurQ==
X-Received: by 2002:a05:693c:408b:b0:377:82e:2d79 with SMTP id 5a478bee46e88-384b39896edmr11790882eec.9.1795372915948;
        Sun, 22 Nov 2026 10:41:55 -0800 (PST)
X-Received: by 2002:a05:693c:408b:b0:377:82e:2d79 with SMTP id 5a478bee46e88-384b39896edmr11790852eec.9.1795372915402;
        Sun, 22 Nov 2026 10:41:55 -0800 (PST)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm48497465eec.3.2026.11.22.10.41.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 10:41:55 -0800 (PST)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 00:11:31 +0530
Subject: [PATCH v7 1/9] ASoC: dt-bindings: qcom: Add Shikra RX and VA macro
 codecs
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
Message-Id: <20261123-add_shikra_support-v7-1-7bf3aa089fc6@oss.qualcomm.com>
References: <20261123-add_shikra_support-v7-0-7bf3aa089fc6@oss.qualcomm.com>
In-Reply-To: <20261123-add_shikra_support-v7-0-7bf3aa089fc6@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795372903; l=2759;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=4jOzxtuU5ygIp69d58T7Dv1/GR5OCYEOzG57LLRiCco=;
 b=83a/W9j+Od4snkQzvpFWFW9xErO/qyOciCt8jhSE+fjVoo6fiyNKo4ElyHYvXlPsQ4sXVai8f
 KkQoiBkhN9sAHd8OK9g4mgvZmKi7Yf4f9Pq5tdAYYpZN7cjPYNT+U1W
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDA3NCBTYWx0ZWRfX/bO5Of7lgnJA
 ebGnOIB7yhVCjAb/4Icydu3hHiLBzwCdMq11vTFaDCLxZwXXfA33Kah6Nt8B6miLlLzip+LHRBi
 etmfzkzVoM7JogDor3/i0RzRBfSIhlw=
X-Proofpoint-GUID: plHSpjaE4qeFRrlJdrqz7XNC750rX2Db
X-Proofpoint-ORIG-GUID: plHSpjaE4qeFRrlJdrqz7XNC750rX2Db
X-Authority-Analysis: v=2.4 cv=c9w+0h9l c=1 sm=1 tr=0 ts=6b033774 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=enWoqSm7ZukIuFDY9bkA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDA3NCBTYWx0ZWRfXyXeqCDryq0kv
 fS3TiGLi1ISF9nJoanpc40BHOe/f4Mo3xCv+RvyDily7MsEzRpoaVv5wBjiMqPh8UtMwj6GQMVq
 AmBKMGF9hjJkVXzJMxdafEp6En2PRltcMfDLPovdqQAVPGrUiFiz54Gg2aEHQ81DnL08rMOD0bj
 ZgWBpwkzz32e7i6LkJKZPbu/J7PiuhK1TdrZyMYnl0etI556e1TqGs2nMHNlxG98SK/vd0tQU6V
 uIcvKySNPVpSX5LrknICPOU2Ihni9fzSTfDv0W2UbvXE503aIWD9vuBY3PH3bRkDUI8S8O37QCu
 XtqTkWgdJjZHGCeQEUKO6MiXFRf1RpcQwOQK0ILYlNjFf152/MwNQ1cVKhh3yS6zvwCDdAG65Hy
 uiHj4GGcC1Ng0N/WjR6dOsR9sOyxfvDBLcxe80nDc/s3o4OjcVf+thcI8YouKC/OObHkNP55U1i
 RyGu7Hwu8gAGZpiJS4g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-22_04,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 impostorscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611220074

Document compatibles for Qualcomm shikra rx and va macro codecs.
This SoC does not provide macro and dcodec clock so reflect that in
the bindings.

Shikra integrates LPASS codec version 4.0, which is not backwards
compatible with the already described compatibles.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 .../devicetree/bindings/sound/qcom,lpass-rx-macro.yaml  | 16 ++++++++++++++++
 .../devicetree/bindings/sound/qcom,lpass-va-macro.yaml  | 17 +++++++++++++++++
 2 files changed, 33 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
index 67a4a9536d06..5ecec8d0b9db 100644
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
@@ -142,6 +143,21 @@ allOf:
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
index a5466e61b0b1..eeefe2171c57 100644
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
@@ -171,6 +172,22 @@ allOf:
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

