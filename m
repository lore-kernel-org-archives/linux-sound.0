Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99B374DD3D5
	for <linux-sound@vger.kernel.org>; Wed, 14 Oct 2026 09:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791969269; cv=none; b=QdRFgqOHg8QzGuF/kAuX81oNuadhK15qW88LShw8UG+vAYHKcWJALOYKd3ZABVuv/6Nu+faVo/QembIUyHIvos/yVC+DK1t86TxwwLG+V6gflrMi3WW8534VnRGhH/rmfm1DD4u8J1oZfhGIN+X3dwYVCWqdiwuFZQUvfSGpxCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791969269; c=relaxed/simple;
	bh=ubWfHaaUXVvf0YQc8C8dFRG/yatLpOHVQwrf/Ep+x8U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LFsSqbjkxytRMqQ64pJi3fyp1nIlEiClkHNOZ6ZDeHMI5yW4aJ+wlqHpL/VEUsTXyuhDFv8PVLfo4trG1SQk2Mf3xtgkPnH5HiA/yydqjV//p6V0gllIG4hAYsP20j5N7+EWkfKZ8n9/oTkzOnBxT4Vt/v2p4J9JHudByKri/hU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iwHQeYU7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YdAPfUie; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iwHQeYU7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YdAPfUie"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E67hoe2685286
	for <linux-sound@vger.kernel.org>; Wed, 14 Oct 2026 09:14:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1Ugfh6toL4o+phi1v622Lh/y1/Z7SzRdGvZ8lYNyq9w=; b=iwHQeYU7N86SEjO5
	rCCPaFSwY+uUNPw9w0+3QA7j2ZxBh3r8L7Mcc+C3CgQkjZahn4bWkirvbajF0tlJ
	eHVhtNHTtoFVHvZEnVRiFo4GWAaP79Vc44imFIpIDe6ErFmYefy1jRKj1Hf0M2US
	/lUqkElQTwzcgxQIEyJD1frpsaU8i7YNsuABtfg8yuvQci3AFSwq4IsEP+AYsJ8k
	KvzmQSD0Yil/QtyyV7x9crY3aEentiE5d9Cr7mdkoEioIpK+MmWU1QFB+HvhqIjB
	n1/A805JZR3KxHJhGt1ioWkwuHqF/mJ1f0MXPriVbYiU7mr3SBgzqCPRAHOiqjQ+
	a8wtHA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha46u0rm8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 14 Oct 2026 09:14:24 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2e93f67358eso4356275ad.1
        for <linux-sound@vger.kernel.org>; Wed, 14 Oct 2026 02:14:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791969264; x=1792574064; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1Ugfh6toL4o+phi1v622Lh/y1/Z7SzRdGvZ8lYNyq9w=;
        b=YdAPfUiekadDinpxUGxwIYcIuda9lTvM/5ZGExYiK3CSB3FiTucnuHtVg5FmNuebuc
         yQyz9gLYGAippwrIFnV3OlKq8Su9QktKXKbetvkP8XFOWycBnTeOWoxzQOnagPuXrQMM
         dnZf6T1bYLAGzIV1pgmsQMP3h6sgiYIfFRpPyQXPzfBT2Q76b3Fa/ZNBaw8Dg5p6/++d
         bEhyDUUcE+mLsktB5Z+Xd9/WxvjPZxs1JFejb+pDR2dacPdgyRi/bYZH7AsYBvPD/8NM
         /voXvW9TyFDQPgXkYlsb3StTDADjyS+JDmdAkNLvtV3iaMQbJib4feg2I0V9xqL/z/oR
         utFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791969264; x=1792574064;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1Ugfh6toL4o+phi1v622Lh/y1/Z7SzRdGvZ8lYNyq9w=;
        b=xfcZorsJLPdvvYz8bu19Rv6yw2xo7wziImZ9CMienprQwFdoenc6U0UCKkVs2UW7Cd
         ilsXr7gk6K0ldkdb4NZ+ks+o2vdtrd/o7D9gtl6SGryOlrKIsbqswHOY9mxeptDly6+Q
         eBnOxTiugaK6DJhuzYc7qr2cQOSvMgoFWf/LDWcV7r8J9AbNk4C6pGAC3o+GJUBmuyUX
         Hjz2W+7RHqgenpTQpuon6Q2JCQwRm/vL7ZrdKzKbIVmI3EtTOmLixf5wuACMcFJkkxJv
         Xg3Ny/+G4P7S/9FsJ8X8TO0nQzbf7XfOOBadhHtHDcZReVqxmHRiTviXC7ga1cmfLcwz
         m5cA==
X-Forwarded-Encrypted: i=1; AKwUvBy439/8MP1LghA8XMX6mG9dife+25Ail8s4yBDbKjBcBd3VKOMD4rZ33EpSoQ81tr9JSEKu5kzC/6r/VA==@vger.kernel.org
X-Gm-Message-State: AFq9FYJb34rprDG7cL7fooR/puEWIjp29sQngO4UGi0Uqr/QtQUG+Iut
	xhA0NahB55BDrnLdP/qsEU2P27tfKW39ip2OUoelN0DkIFAchkvJxaBVdEiiZC7WcPALxQo32po
	/tN8vDLbO5K0++ZumfmySSkUQTx3pqeVmqFZsasQ5oYl6c7cDFnPiU5rQDapGgR7/F6oVhZKBVg
	==
X-Gm-Gg: AYBFou2mTM4WxEvVya5X39qssUPXD//YcFbEGDH7kmPpoi3ovouSlaRz3hf1lXa13MR
	XYsQme09EwWRlG5likk9azcA2rzq4jKIfg1JQ93GZN/nFPzItup+wh+XinxTvN+0F15nUiRbiLd
	OnMHCcfk+Qfq6NNWwFmawfRUvb6rxNQ8yeBJQUXSmpq0zTyIqzs/pjGQSAIxsU4uOppQGyrNeCw
	/2BoVY75QVqXAeYCkMnK+hfgTLZcuUB9ZDYfGHXKgzZSshEhW0jtU7ppBLdu4rviOhHEINT0Fdt
	IbEs8I2tRpF0TCKXKYF4RqLUv1CQojxnt8UpzLwAc0iNSyCFoF97G4ziBJm0AsNRb8Gtbrn4hh4
	G5RrUkCKpYIuyAYsGTri8Z3kVEL+Wa06nPQA=
X-Received: by 2002:a17:902:d541:b0:2df:8f19:5db8 with SMTP id d9443c01a7336-2e842f136acmr131951075ad.59.1791969263910;
        Wed, 14 Oct 2026 02:14:23 -0700 (PDT)
X-Received: by 2002:a17:902:d541:b0:2df:8f19:5db8 with SMTP id d9443c01a7336-2e842f136acmr131950915ad.59.1791969263437;
        Wed, 14 Oct 2026 02:14:23 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8421b16b3sm67088595ad.30.2026.10.14.02.14.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 02:14:23 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 14:42:53 +0530
Subject: [PATCH v5 7/9] ASoC: dt-bindings: qcom: Add Maili LPASS macro
 codecs
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-add_shikra_support_v5-v5-7-fb9f0667e613@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791969222; l=2665;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=X172senOJGEpt1gOkSVMmtQdNj4w/1OL1At9lde7tvY=;
 b=tAdFsJA+m9R6QtFjHUn6cCSVwjy/krexQU5Al0ZEP7+fn9rbQS4WbzLQ7UbgJ77i1EydHzmcv
 ug/GHAdQYQaDPdJV+Y4MN5h9yjOccxJKpHFUGsVxzDB2z0m5BJN50eR
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAzNiBTYWx0ZWRfX0RUPGu7sc5q1
 rLE8kfjqHgoOuZvvBf1TkbahmqrzbcoMywNArtB78zCz0TYeuqUVwYE0v4LLnEaJrt2g8ZkUZuy
 bu9B8sFty9CPWKsIlU0xoSpUAT7+xZ0=
X-Proofpoint-GUID: gc-pg3vWCViV3N_H_uVKeKVu32_rZ780
X-Authority-Analysis: v=2.4 cv=Y6ttIReN c=1 sm=1 tr=0 ts=6acf47f0 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=WGZyT7xzyh4_t1xe9HgA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAzNiBTYWx0ZWRfX0WKUVH3AFKEU
 YrDp2MCYIYxnwVnHLNnLnGafWWxQxuG/2fL5tNAcgGuVlHE9uzPyBcE3TegdMDLkaGmLTNvy9jM
 pAhWHPVo8dc83lSukTEi9hPo5NHCG+euDmilfG9RUb+1nJjnwZBCl6pwI2Oc4k+BHn6VqrdU2Id
 EsHsUh12NlREDRqaRZNcV4r1UgWox2dG6WXK33o7DpnXgOtJ2wkIF5yQg7QZ75uvDIvpstxTaMP
 0tIIbD8Do/NXXBwA++2zMZpaoHe4jRc2LN6985FIT8ZoVsiwPdR06nYIOkLnD0IBmqDfZ6DD7Pz
 vmjj/MotU+ThQRI5bxeU31ENJmXFSp60A0ETrssmQiXRy4BJ8ONmzOD0dfwJp/Y4nAv9Ymah11F
 eCJwOntxOHQ/fPc2xDFxisdhzQ80Mji2x28pXc+t0/XiRP759idyqaW8PznqJLe+pF2kdiBGPXh
 yGJgpurE0vVbSvn5W7w==
X-Proofpoint-ORIG-GUID: gc-pg3vWCViV3N_H_uVKeKVu32_rZ780
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 suspectscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140036

From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>

Add compatibles for the RX, TX and VA macro codecs found in the Low
Power Audio SubSystem (LPASS) of the Qualcomm Maili SoC.

The Maili RX, TX and VA macros are identical to their Hawi counterparts,
so document them with the corresponding Hawi compatible as fallback.

Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml | 4 ++++
 Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml | 4 ++++
 Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml | 4 ++++
 3 files changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
index 142955b85..41b578f83 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
@@ -29,6 +29,10 @@ properties:
               - qcom,sm8750-lpass-rx-macro
               - qcom,x1e80100-lpass-rx-macro
           - const: qcom,sm8550-lpass-rx-macro
+      - items:
+          - enum:
+              - qcom,maili-lpass-rx-macro
+          - const: qcom,hawi-lpass-rx-macro
 
   reg:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml
index 2df72450d..900ed97dc 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml
@@ -28,6 +28,10 @@ properties:
               - qcom,sm8750-lpass-tx-macro
               - qcom,x1e80100-lpass-tx-macro
           - const: qcom,sm8550-lpass-tx-macro
+      - items:
+          - enum:
+              - qcom,maili-lpass-tx-macro
+          - const: qcom,hawi-lpass-tx-macro
 
   reg:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
index 7d56f9c36..9b8d9afd0 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
@@ -30,6 +30,10 @@ properties:
               - qcom,sm8750-lpass-va-macro
               - qcom,x1e80100-lpass-va-macro
           - const: qcom,sm8550-lpass-va-macro
+      - items:
+          - enum:
+              - qcom,maili-lpass-va-macro
+          - const: qcom,hawi-lpass-va-macro
 
   reg:
     maxItems: 1

-- 
2.34.1

