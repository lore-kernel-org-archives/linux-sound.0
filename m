Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D59CE1E5B60
	for <linux-sound@vger.kernel.org>; Sun, 27 Jul 2025 08:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753605113; cv=none; b=X9CW/oyOH1fGD0ZT8boY8SqiBlpe7l6GHaBrwmOuNnckCkLO0AwqGqtsMV0cnquLSI8qpJp+rs+Kw7K/mKNYtuq2jgOFLaPMHayH+cavcnfv2FgKaXDEfZSGbIbuxBgv1zKtfY+F6dJwkLMmTPSMBDGbHn9y1EEm6QsisY4O56s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753605113; c=relaxed/simple;
	bh=NM5eUwufs9EQvxyH72fi6ouw9HbAH6xIggTFFBsajLc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AYkjqYi5bseI6cdYLPerLhfS3rd3Fzes0giWieDmywGzYPB9S003Nz7VSJniFIXiSmKu4ZabMv5IOxzoUZihkGFTH6oTmMj9oNU2FzqfLHjSva72z8942EqtDDu72xx2LZCJ2s3DhA1N4D9U9JcAuDUG46rZGTGoEVmK4wIz3Xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I13M0/0y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I13M0/0y"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56R3MtGc004838
	for <linux-sound@vger.kernel.org>; Sun, 27 Jul 2025 08:31:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=AcwNi5jqAVS
	vH8zvGbAgdOcfk3Kkt+F28Tzsi0VVD74=; b=I13M0/0yu7CcEcdijMsbuKAb+Io
	liLBfBX8mE9pIsxnm7cA0XPlRLmEtJKgEud1LHxD6v62CMdmIsjel1VMYlC+raJ/
	HhhM016Kns3opK9CfDrb+QcmdV9R/IdwmzAYiZ8rAE/dUEEwawZ9EZ+FpJK5bwLl
	Xkl1kFuG0sw6Bx0BZV94EmRRaDPdCbcvm2w1kU1NqcKIYUs7vkGyra0MdfouG4lL
	U5eXLuCM0LMZ3oX1x2isFDRP0yPvDF8x3325aCC0XBpUL3tg31ABHORIsid4nXtF
	C8imaHfccmHNLePZLJBvFLWLimbARJQMF6fngCwlzHQXh+/QGYrfnQkPxsg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484rachspg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Sun, 27 Jul 2025 08:31:51 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-23638e1605dso25008475ad.0
        for <linux-sound@vger.kernel.org>; Sun, 27 Jul 2025 01:31:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753605110; x=1754209910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AcwNi5jqAVSvH8zvGbAgdOcfk3Kkt+F28Tzsi0VVD74=;
        b=ibXFg4zk8wbMYMJdlckA/6EH3YLexvc1Mb0KFZ/aRMTb2tGpdBPEshvGr8nw6MfnJv
         6ZDa60ZRITLe2lm51CZIQcjNVci3CeIE5usP/9l5BuD295oszS6UUnDFrfKSPkr8Rbnc
         T0ptrkK6jTOgc1ybUcPmPzSt31rbQKmz2dBodQGIuhlYJAJJ7YI3Xwl/aYPE1umYgP04
         cW7OVZQAeMcU7qgRt1hbbTVuV3tMO7/0lum+sGGnI+pjXT3Q+riHfgIXMMz0KLkVuEBe
         cyAee+qM18hNKUdVTtDHYji86//y9rTtzbyi96igHwDC9DdvJt2UK1bpuUVlWZEpR4rm
         dkzg==
X-Forwarded-Encrypted: i=1; AJvYcCXynmvgiNkCJzpuOeyyQosfL68qCr9jthwxwbNrCynQwutjTdQN59a1s1j4eh0RTRtd53RdDP7C/NPHuQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxwZgyqOYkEcPD3NptjxOJgft6Fgung0onzYYO96PnMFAvazHf7
	3trUh1RTSknZQF1OKCXNOp999KArnO/9MxMdfD0tRz/ex/ntf7NIlZimYT/PHnRWzZul+MwDV4h
	tYvxD8f2mbtjbl/Mf1mTeEeI+Gkq2EeX/ine0EPVzhtqjJQxEZQMh73wic//u8ZXzAQ==
X-Gm-Gg: ASbGnct/6agxeWs4tcZz9tutrWj2n2LQD8koVvS2u76rbZaqKx4ZSAYIJEMMnLk9fBn
	Up5QpQnueLcfTjyglkQbon3KtXbbzWacidDm2cj5wfMee5PMzm0hw2UwtT3aiGOgOP2gXzrjzB/
	S6StvmVXKWgDJYGlbV9phNQYY4qLorJ9kCbVIGt8wn+8nF9TjYAE7NiEAZxqKhPzmKxO4VmpvR7
	F6weaDvja6KpPxKGcH4FWF0HC+bqojvNz9ZAhIxvso16LB8UCCF0pmr9q9gBo5ipEOSPOnDzrfi
	p/3XUGv0yE4+kvjdG+sCtWlLx6yZ3XSlAc+K3EiJ+IeuaE97e3V2T2EjVxpCSqYR++NpiBaIePb
	T
X-Received: by 2002:a17:902:c9c4:b0:240:9ff:d546 with SMTP id d9443c01a7336-24009ffd7f9mr10052595ad.6.1753605110197;
        Sun, 27 Jul 2025 01:31:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IERPCA3gFX6YamqhgdGjO1m2DVjgSysrzz5AvHQkC6e/zWEA9GvZU/sr+aJlTkVRUIhwXmMMg==
X-Received: by 2002:a17:902:c9c4:b0:240:9ff:d546 with SMTP id d9443c01a7336-24009ffd7f9mr10052185ad.6.1753605109738;
        Sun, 27 Jul 2025 01:31:49 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2401866c2c3sm2848645ad.30.2025.07.27.01.31.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jul 2025 01:31:49 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Philipp Zabel <p.zabel@pengutronix.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, quic_pkumpatl@quicinc.com,
        kernel@oss.qualcomm.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 1/3] ASoC: dt-bindings: qcom,wsa8830: Add reset-gpios for shared line
Date: Sun, 27 Jul 2025 14:01:15 +0530
Message-Id: <20250727083117.2415725-2-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250727083117.2415725-1-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20250727083117.2415725-1-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=WqsrMcfv c=1 sm=1 tr=0 ts=6885e3f7 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=Wb1JkmetP80A:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=Jjn-4_SfM33dySwp1_gA:9
 a=1OuFwYUASf3TG4hYMiVC:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: zdoL7j2843wHTe2He7x6OMMNqAzvjTus
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI3MDA3MyBTYWx0ZWRfX7r+NUDIx5793
 PCO4K8Gbn/JVlCr/8K4B0iThEKB2bVNXxx9Tr5qzwzepEN1k85KdHGtc73oai3qumMmXpaeZHAX
 xkXKn1zxYwvzIcN8dGvHlekAs0RO4klpwRlUocGq2x9kVl/81psuI8YY6Px5djD4QPBVS/TBIf7
 HikyJZ2BvQtRduTrvyk0nc0/T0G9x8rjpe6Wu4QsfK+mccFXsE0Da7fea0ykCgf9SVB0VdihOwb
 cyS98msAl+93iV6r6vaqsq445MbrKGoz/++apgVagcjfmCgEW1UegKisHOuh+w4W/aeUnKVgZpZ
 CrP62yUESZdpcj07fd508p4+zfE826QeSWRQvCEXy2NpqSFwmlR9Sp8jTrHAGg54thPytVFWjBq
 gGUtPGzdnwFD86v6nVy+F1mJyr0VXnl2gxcjOupASpF9OjUQ/1ktG57IdJcn4I8FlZQAAxLO
X-Proofpoint-ORIG-GUID: zdoL7j2843wHTe2He7x6OMMNqAzvjTus
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-27_03,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 clxscore=1015 mlxlogscore=999 impostorscore=0 mlxscore=0 malwarescore=0
 adultscore=0 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507270073

On Qualcomm platforms such as QCS6490-RB3Gen2, the WSA883x speaker
amplifiers share the SD_N GPIO line between two speakers, thus
requires coordinated control when asserting the GPIO. Linux supports
shared GPIO handling via the "reset-gpios" property, which can be
used to specify either the powerdown or reset GPIOs.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 .../devicetree/bindings/sound/qcom,wsa883x.yaml       | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,wsa883x.yaml b/Documentation/devicetree/bindings/sound/qcom,wsa883x.yaml
index 14d312f9c345..098f1df62c8c 100644
--- a/Documentation/devicetree/bindings/sound/qcom,wsa883x.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,wsa883x.yaml
@@ -29,6 +29,10 @@ properties:
     description: GPIO spec for Powerdown/Shutdown line to use (pin SD_N)
     maxItems: 1
 
+  reset-gpios:
+    description: Powerdown/Shutdown line to use (pin SD_N)
+    maxItems: 1
+
   vdd-supply:
     description: VDD Supply for the Codec
 
@@ -50,10 +54,15 @@ required:
   - compatible
   - reg
   - vdd-supply
-  - powerdown-gpios
   - "#thermal-sensor-cells"
   - "#sound-dai-cells"
 
+oneOf:
+  - required:
+      - powerdown-gpios
+  - required:
+      - reset-gpios
+
 unevaluatedProperties: false
 
 examples:
-- 
2.34.1

