Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E0664E56C7
	for <linux-sound@vger.kernel.org>; Wed, 14 Oct 2026 09:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791969265; cv=none; b=fEswUfusrDfqRosafr04MgXlSIGmFkIZLKPmfrJTnAihtBIlFG7BXDHJ88I4hgQQYpyHTQcM1gmK4pJX2VXYHqawwhLjECqu25PYwQNJyRTOGroqOoowJKuaBaWnRaToYMOlh/f7QW7S9OTKBybPbVJPqVzd1uQtYOM1HN2hLOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791969265; c=relaxed/simple;
	bh=XjqDCkyewrBzwac9R8b3kZcouSm9EVUp97tlLF8Ho/c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZbVTekD5xr7XEjm5w1/TWS5JfNYLEQ2Af5M/OLnP+M1g3u7bWrzhqLhufnjSpnZK47Q+C1SpSSPqt+KmtExu+YOXiOU3ez44Hogg6CzbWO0TvvuwHPxuoaR27VLcclKT2aY3qeWCWDXZBs2eqmV/aVOGQ8rg01NJRpdeKGCgXdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kzIGp/jA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TWLY7t/d; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kzIGp/jA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TWLY7t/d"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E7uotC1592397
	for <linux-sound@vger.kernel.org>; Wed, 14 Oct 2026 09:14:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fCgZ8m08GdP2r6C8RcUE81IwgkQsrBaJMa43tMr/y6U=; b=kzIGp/jAUVqkIEiB
	tgyhJLZgRNke3zmq4w0Nq0v8F99hYKMF+HdvAnb/SEE4n4NcTzF7AKaBtpR2tIyo
	wm+6AQ7K7wsCyIL/6pzrSJD+GzhzF4KdeGe/8fSqkboB+IZZqvvKJwS4MEwhm3ro
	SPwAwVoufDodnNwE/dn6a9fONX+PZSETsCY+4ylzRKDtj7pkTxCQ+igmej+hPv7X
	5f8zd499wrOVf9812f3eGUXhAfFqNekVZn3wQYIlNJGMPH5e+Iw59vLQqo5aBylT
	f0uaeYQtpLwQKL+/hlXgRefuO9hU62Il0upL0Va7lrG2v3qmz0fkCQ8T3Gt1FtQR
	8dtgQA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9s1tkenf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 14 Oct 2026 09:14:20 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2e651510a5dso34441745ad.1
        for <linux-sound@vger.kernel.org>; Wed, 14 Oct 2026 02:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791969259; x=1792574059; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fCgZ8m08GdP2r6C8RcUE81IwgkQsrBaJMa43tMr/y6U=;
        b=TWLY7t/dTigIzJZ1pOynoP5LWBLHjEXoNmE08eAtD5KXnXR1CNb0A7jFL74h4VutPS
         +GP+JkPBSrU81IXtmmjGRcV3FIzD9lqu8Ux6rWfDjETlGvfGyNKO2b/MJ13UFWeEl0WU
         IW9Bb7PB+z/+h7w7iFg2C5pqhQ/kFmDbclmK3+4r4d7SgYT1q6ksZFuExYV2xnIZ5Nwj
         hL3yR8YxUC5vCifPCzdQ1T4KYqnnx4z9zhJfgL1PvKl3ViE1py9oSvcasjzKe4r8LLr3
         cwvSNE5wPqW8x8DnB/t8ZrKZozp42G1dI3qE/s6TgmwxSqwi/9Dl/A8wWb7g5aPx2YqH
         HFww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791969259; x=1792574059;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fCgZ8m08GdP2r6C8RcUE81IwgkQsrBaJMa43tMr/y6U=;
        b=epdN9au/1adHjX1XSYDDczmriD3SFvo9VnXoe9xuCHgEmDQbtPfNg3IWg6yCDtSMVU
         NHCIo3vtp9gm23n7PAdSiJKfJNIeunaW2d4zbkWUP9YtGwHIP7vgfSOpeODqxW48nCkb
         Fuycz1kJpfRRl0Hv4DPH0ZcpX2ELWi+TWvv13DK8qcsctdWAkuq30rBSd2nvdBpxQ+B7
         acr93UGyHY1mF0+5+Zb0kNKccK3bSP/YgS9n52SATzCIqpyY1fr+JD7pIo1I26NMOwXy
         riNRKXQmexiGJa/NhLRywU8BELerC6pawMiLctXf7GuqUo94h0jLmWSEAVx3nvNg+RXM
         Ro7g==
X-Forwarded-Encrypted: i=1; AKwUvBzVWkdtQbhDaSJ98P+xg8tCwHmI28qgp5MYUi51tLxRRtkdaOXoYP13afUhVzBFWMZoWvfqF36at/0P0A==@vger.kernel.org
X-Gm-Message-State: AFq9FYJIHPgG16XKz9HG1Zxo5rIf3p7O/otAs7DL8IKD2d5FopjHEvNX
	VrGBs+FVtdPaCa92rMlFfq88DyzE1nHzwtipHH9SO505fE8NC3EsCrEh5x+K4Agbl4jLQ82LVsG
	Atla7bIBR1vqh/ryg4sXZ6nHF/lpzI/j3VQLcr5ZYl7ygMD8KNSQxNkJCcRWf2UP1M53nIsWP7A
	==
X-Gm-Gg: AYBFou3SrIjuo4TmlUXssfqjxU2SiOgNqkhTrsZbbFXCQfv/62C0Yi9y7r3PIFCVvPj
	D2APSPHY1jITYQmXD5AXseIG4htCk9aM79qK2HIDIecWMf3HddjpUnvoWLlqb0WK+wRNiZ5TiKU
	tKAP4lLZZii5ONxCRcws8miU+BRwA65mFr0lVmLQECJHihVaEh5u5KfIWY+FHfYtBMOtEFTWy0Q
	a0/k+MyRLaUL3Owc/Kg1yDC5PIGpYgpdraE95JIT3pjuZR1n1kaIuNYaW3hhCr284yakrPv3yk6
	5x1ivG3CEtMHgBtRhhk8BtFqgsu2x5AKuaZ1QjfREBkwbAaxjTeI1a4HnBL1H98Q18sF3vtISzg
	MLT9Z2s3dVlujhv3i8ikE9ZL/btgyFQbWkzo=
X-Received: by 2002:a17:902:f711:b0:2e2:c69a:bd7b with SMTP id d9443c01a7336-2e842ab6413mr120780775ad.13.1791969259173;
        Wed, 14 Oct 2026 02:14:19 -0700 (PDT)
X-Received: by 2002:a17:902:f711:b0:2e2:c69a:bd7b with SMTP id d9443c01a7336-2e842ab6413mr120780515ad.13.1791969258680;
        Wed, 14 Oct 2026 02:14:18 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8421b16b3sm67088595ad.30.2026.10.14.02.14.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 02:14:18 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 14:42:52 +0530
Subject: [PATCH v5 6/9] ASoC: dt-bindings: qcom: Add Hawi LPASS macro
 codecs
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-add_shikra_support_v5-v5-6-fb9f0667e613@oss.qualcomm.com>
References: <20261014-add_shikra_support_v5-v5-0-fb9f0667e613@oss.qualcomm.com>
In-Reply-To: <20261014-add_shikra_support_v5-v5-0-fb9f0667e613@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791969222; l=4231;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=hgnMAngpDFTBBVMIoV7sw+gHudmMoq+o7sI1Dj+SSlA=;
 b=ps9ZbmpGm1vKC239QFJ7D0hyrH5RbJxImVCmtgyR+AHT0B6K1uW4ITgeUQCX2A9YhW0fMS9oe
 dhFVlCLLTd7DHUnhmWIRYvve34Vr8auuuXWsdySfAQ0ZtAdj6ipSymV
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Authority-Analysis: v=2.4 cv=IpOL47/g c=1 sm=1 tr=0 ts=6acf47ec cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=MdR4w2dFWrRrHIxOyxQA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAzNiBTYWx0ZWRfX+5uFU+TUD6Hv
 cCNWcCGVvc5FpUmro8KIvaoj7HiYpnXQubPxbwlXpx3hSHJVK7NByJfPg3rt64mJfmMEEHKRdnn
 2D2ryGWSIigUNE7cAkqDoWlon0f6GHiDnzEjEBdUcCltaYD2hvtycKD8q+W1PYk6O9y3BLBui6T
 qp9umURPNPLQAJHxVUEY6WP7mgyBZxb6FsKrg0FCs6vrtvChDGWLYygORWGt1AMrKoRrt5aOovI
 US1A0kVjwUICM85/BvoqlHdRnj9rivaNVoJdvRKMiub6fG7XftUAEG+V+JA4AEjc4IHnjxmKtJR
 fZXIwGEeT1GrxdZj3EimCs+rP0J8VyKXiuK5V5rDC9a9uuqWTcD9FmgrCPLj3DY8VhM1wDeZm0S
 GjYbdQGf6te7vjOGxa0G9Keos7ZJOT6EJYo5ATw8BThvNQCzPpHNN37507sBYSATeOzRkM7fIiU
 VM2NGwx/tOTgYxJo0WQ==
X-Proofpoint-ORIG-GUID: PVnr6XbVBSMBnUX1rm5vbVq5IAH3soAw
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAzNiBTYWx0ZWRfX51BGyVdbqj8s
 e+gTQc1hhRQl967vt7+iFz9eT3x0WVkHjdv3v83v6eMt+wXU5B//HXVQUMXTGUn4fo2HXSuaJb/
 WHZ/ES/vW81j7TkUguuFvsPwHLi6L5o=
X-Proofpoint-GUID: PVnr6XbVBSMBnUX1rm5vbVq5IAH3soAw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 spamscore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 adultscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140036

From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>

Document compatibles for the RX, TX and VA macro codecs found in the
Low Power Audio SubSystem (LPASS) of the Qualcomm Hawi SoC.

All three macros differ from SM8550, so describe them as standalone
compatibles with their own clock constraints rather than as SM8550
fallbacks: the RX macro uses the 'lpr' clock instead of the 'macro'
clock, the TX macro is based on Bolero v4.0, and the VA macro takes an
additional "heartbeatpulse" clock sourced from the LPASS VA CSR rate
generator.

Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 .../bindings/sound/qcom,lpass-rx-macro.yaml           | 19 +++++++++++++++++++
 .../bindings/sound/qcom,lpass-tx-macro.yaml           | 19 +++++++++++++++++++
 .../bindings/sound/qcom,lpass-va-macro.yaml           | 19 +++++++++++++++++++
 3 files changed, 57 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
index db63a75f1..142955b85 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
@@ -13,6 +13,7 @@ properties:
   compatible:
     oneOf:
       - enum:
+          - qcom,hawi-lpass-rx-macro
           - qcom,sc7280-lpass-rx-macro
           - qcom,shikra-lpass-rx-macro
           - qcom,sm6115-lpass-rx-macro
@@ -139,6 +140,24 @@ allOf:
             - const: dcodec
             - const: fsgen
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,hawi-lpass-rx-macro
+    then:
+      properties:
+        clocks:
+          minItems: 4
+          maxItems: 4
+        clock-names:
+          items:
+            - const: mclk
+            - const: lpr
+            - const: dcodec
+            - const: fsgen
+
   - if:
       properties:
         compatible:
diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml
index d8682ff2e..2df72450d 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml
@@ -13,6 +13,7 @@ properties:
   compatible:
     oneOf:
       - enum:
+          - qcom,hawi-lpass-tx-macro
           - qcom,sc7280-lpass-tx-macro
           - qcom,sm6115-lpass-tx-macro
           - qcom,sm8250-lpass-tx-macro
@@ -142,6 +143,24 @@ allOf:
             - const: dcodec
             - const: fsgen
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,hawi-lpass-tx-macro
+    then:
+      properties:
+        clocks:
+          minItems: 4
+          maxItems: 4
+        clock-names:
+          items:
+            - const: mclk
+            - const: lpr
+            - const: dcodec
+            - const: fsgen
+
 unevaluatedProperties: false
 
 examples:
diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
index 683ebf702..7d56f9c36 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
@@ -13,6 +13,7 @@ properties:
   compatible:
     oneOf:
       - enum:
+          - qcom,hawi-lpass-va-macro
           - qcom,sc7280-lpass-va-macro
           - qcom,shikra-lpass-va-macro
           - qcom,sm6115-lpass-va-macro
@@ -185,6 +186,24 @@ allOf:
             - const: mclk
             - const: npl
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,hawi-lpass-va-macro
+    then:
+      properties:
+        clocks:
+          minItems: 4
+          maxItems: 4
+        clock-names:
+          items:
+            - const: mclk
+            - const: lpr
+            - const: dcodec
+            - const: heartbeatpulse
+
 unevaluatedProperties: false
 
 examples:

-- 
2.34.1

