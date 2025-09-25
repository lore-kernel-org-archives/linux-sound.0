Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F7691F3B96
	for <linux-sound@vger.kernel.org>; Thu, 25 Sep 2025 00:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758758495; cv=none; b=Ne0CCsjU8WF7M2PNnKyYxg5f63cU9Kd+WfBF/cBOoYmNrEYpnOoTxT+LE/dbywi+nxSCmtUwOeQynRDEZYdiY1jjf/pjIMalxesiYGv1vteD5suyRkB/4/LjwTTrQ2HDvAdUiEfPBlqoTlIMLWOp+o3i3zBXudiVor8cOGfj6hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758758495; c=relaxed/simple;
	bh=V4rfHcCU/wAXV0FGv9ipICr0cbduOyswJBX8O8lOqu8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GjueWzCUU1DmXYe1LaGEwxl+3M2Q+NHjPfAzIEsIB1oiT5mQvyG+SDahHc5131mPkb2lTk1Ys98U/jNc5sTEDM6zAlwPaz/5zSMZkkiyjqh6R6UqwkLIUS/p4z+jJTdhBFcQpYhNfMFk3IdxdG8B6Cx9DTSVgqoPvVhoNyC7WpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZqrVXsPf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZqrVXsPf"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58OCGQwm016438
	for <linux-sound@vger.kernel.org>; Thu, 25 Sep 2025 00:01:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iPSCfQa0r4/1zMxhDx3atNDe951NN06HkbNHSAELqSg=; b=ZqrVXsPfaaZMwNkZ
	UnQkZwFTLDWLdK2/4fzKa24Q6A5CPlqfRL2eYlR3S/CQBRNvx2V3fKewEt3Sq9KR
	rbgoOrf1lYgJ/uooFWzbhqLewnAIbnAg4v+H3O7oZXslhXRUmCqqb8G2KMQcy+TO
	rSuSvLM4TvcGxC4KsuZInbIvtznLmq/lHDEwbQy4LcLREeoEThIWbN5d7lO186DP
	4zZdu/wDOLykNu95rVc4LEKazWlHlL0lvPr89o0qd1E7117n+uT+cASJyigdntiO
	mbyi5gGQ2JHX7n6hWKtFNu9cSft6ffeqdTlfToL3FFX3JGmaQW3U1bZkh6h4FTlZ
	RhRN8A==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49b3nyhwxw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 25 Sep 2025 00:01:32 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b5533921eb2so244269a12.0
        for <linux-sound@vger.kernel.org>; Wed, 24 Sep 2025 17:01:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758758492; x=1759363292;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iPSCfQa0r4/1zMxhDx3atNDe951NN06HkbNHSAELqSg=;
        b=gm/ranEP18m2tfqjV3prvmu1Dxpm0rj0ZrHq7wPwEdTDzNJNQbIgl49CH4nJQiypzA
         GN28CvZqEM4bjTHyJOcMn89fQgwuZsmWBstFOUGJiyZvoxMw62fLGvfwqLDhE/D2zAJz
         FATf36yWdH52bjjic+cHpQENQ/GDpBlvn3fRc8tpbFX28TiuH+ot9QjAQ/IFLNp16RCe
         ChcmLYc1PAW5HX2FkrDb4wYmEBr5Dv2r5mCWjEs9RVnn39QYWEJSNIeGGCN/Ze70RvIT
         9ECfwv6y8aI3iwca0iszlWIMkejLHyFDytV7ZdIvyOCkOvc6/OOkVlGUXE4xQOgj/WB/
         Hd+w==
X-Forwarded-Encrypted: i=1; AJvYcCXLJxj7nJFvCJCoSSt9HzT6qxa/iR/HkWOSgq1mlvYPN4NIbkzAsxbvIfd7OiYiv2xFfHIgmL4wlP6vrA==@vger.kernel.org
X-Gm-Message-State: AOJu0YytQIzDFwxUUi7FuM+C8yG0GgQ1KWSK4DnXCBhoqM2MaZtB5/LT
	8aO+xHnnWyuJR+mgUjV0+tQ5ASZvmax74jKseZVWFpwBYs1rg8pQ6KtzCKkzQ74nwT5/tzpWpTs
	GI6G8U2sp3V6RSlU3QY94RPQryz0G4vvylyp/zoXpnbe5dKdsNyhaEeIs+fKkmG8tZA==
X-Gm-Gg: ASbGncu0t8HkNWZPbd4nUYSXfUMwShmYW0R/dX7EqW8E3sR3B/R8DSx4CWFmwT18PzQ
	K30s9x25oDaItG5iv2Q69lRVq9vf7DLd+WuXlqnN/1bCs7DbpqzMSl2pPByqJSCVrVFZ7zYT0S5
	0NRD9uozt5UVbfhzuJTK2KrnGh8HyaEZcNk7VXv64SgBPU5PFVgYjKK3iGl21iFpT8tkNLT8b6o
	XAjGipH3o5YpDrnGYq8Okh2WkmHGoa4aILbLycLS2MLpU4uF71D0zqhTdFlRGQ1BbDtiVj55DJk
	R6TVCTzSY358bhA9DF2FRDFZ2sOrsExs8HJeXXvg7wDFkH9XEdXSblUYP2zVTasKw3BazkLj3i7
	fSDogixvTMpn5zZk=
X-Received: by 2002:a05:6a20:938e:b0:2b5:b1cc:9d57 with SMTP id adf61e73a8af0-2e7d0ad1ef7mr1735950637.44.1758758491867;
        Wed, 24 Sep 2025 17:01:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGcBuhUX+zwV9XHhEnGYkxGcKW8PJ35g+7aoF8dcZvIwzlBSGtU1PclkPMxKApcmlPUiavjNw==
X-Received: by 2002:a05:6a20:938e:b0:2b5:b1cc:9d57 with SMTP id adf61e73a8af0-2e7d0ad1ef7mr1735906637.44.1758758491381;
        Wed, 24 Sep 2025 17:01:31 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b57c55a1bafsm423152a12.43.2025.09.24.17.01.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 17:01:31 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Wed, 24 Sep 2025 17:01:19 -0700
Subject: [PATCH 5/5] ASoC: dt-bindings: qcom: Add Kaanapali LPASS macro
 codecs
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250924-knp-audio-v1-5-5afa926b567c@oss.qualcomm.com>
References: <20250924-knp-audio-v1-0-5afa926b567c@oss.qualcomm.com>
In-Reply-To: <20250924-knp-audio-v1-0-5afa926b567c@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rao Mandadapu <quic_srivasam@quicinc.com>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758758482; l=3129;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=dj3g6v9BUpW7nvIbf4y6iP6vvL+STyAnXhGU9WKLRGk=;
 b=t4zFhLZc7eIjaZjRxnzqaDgTly+djP/IQcGhd6ju6V0SD4I1v8SDX0LnxRwb4kUfba9UWCss+
 YphOVCPo9yIARoKYugGp3X5iIzX8Af0/V/nXRyQEPNBrjrj6shFNedh
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Authority-Analysis: v=2.4 cv=EuPSrTcA c=1 sm=1 tr=0 ts=68d4865c cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=ehmOrWUO2zTDMYMZoEsA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: FgtRZ9dj9WlHUloZOeumADQVeLSuylKm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIyMDA5MCBTYWx0ZWRfXydHwaJkE9gVs
 0RR/HUaIwIf+x+7F/zpixO9oAVQW+tsiKqv0JNow9uRspm9gXq19jNOfufa7OJgUygEZicUg4h1
 +E/lGKsFWyIi3XXfS4CNMfGLcroKL3gXyRnEDzI2ZbngN/Csm0/lt0FzWmczwD5ykzMpE928nHI
 S48txzhwtbVkdXBdFGeSL9+TxyslA718oOQfFZqw4jf/y3VFMqoLBjMunUyg4MZRufcPVP744Hr
 22nkBDF4IcWpbShEj2DZF+/oaEUmeBIWEfme4t8vPo7h4XqbYqGVwCxueLiIPfyZ5HwGZZnDkhE
 1VKujC9SDaKQDO70kt4lOIa8OJDLDo9xDjd42NOZu1BFv0LJPOYoOcdeLV+3UKM7qFOK2dN9MOF
 2u7KGbZF
X-Proofpoint-ORIG-GUID: FgtRZ9dj9WlHUloZOeumADQVeLSuylKm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0
 clxscore=1011 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509220090

From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>

Add bindings for Qualcomm Kaanapali (LPASS) RX, TX, VA and WSA
macro codecs, which is likely compatible with earlier SM8550.

Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml  | 1 +
 Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml  | 1 +
 Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml  | 1 +
 Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml | 1 +
 4 files changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
index 92f95eb74b19..b869469a5848 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
@@ -20,6 +20,7 @@ properties:
           - qcom,sc8280xp-lpass-rx-macro
       - items:
           - enum:
+              - qcom,kaanapali-lpass-rx-macro
               - qcom,sm8650-lpass-rx-macro
               - qcom,sm8750-lpass-rx-macro
               - qcom,x1e80100-lpass-rx-macro
diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml
index 914798a89878..e5e65e226a02 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml
@@ -21,6 +21,7 @@ properties:
           - qcom,sc8280xp-lpass-tx-macro
       - items:
           - enum:
+              - qcom,kaanapali-lpass-tx-macro
               - qcom,sm8650-lpass-tx-macro
               - qcom,sm8750-lpass-tx-macro
               - qcom,x1e80100-lpass-tx-macro
diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
index 1c0d78af3c05..5b450f227b70 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
@@ -21,6 +21,7 @@ properties:
       - items:
           - enum:
               - qcom,glymur-lpass-va-macro
+              - qcom,kaanapali-lpass-va-macro
               - qcom,sm8650-lpass-va-macro
               - qcom,sm8750-lpass-va-macro
               - qcom,x1e80100-lpass-va-macro
diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml
index b6f5ba5d1320..d5f22b5cf021 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml
@@ -21,6 +21,7 @@ properties:
       - items:
           - enum:
               - qcom,glymur-lpass-wsa-macro
+              - qcom,kaanapali-lpass-wsa-macro
               - qcom,sm8650-lpass-wsa-macro
               - qcom,sm8750-lpass-wsa-macro
               - qcom,x1e80100-lpass-wsa-macro

-- 
2.25.1

