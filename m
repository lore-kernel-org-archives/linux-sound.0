Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09B1D26C399
	for <linux-sound@vger.kernel.org>; Mon, 19 May 2025 08:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747643606; cv=none; b=Uv0LNHuvuWQDJX2WnG1RdKZ0Tkp6kRt3jT2nOi4yKU3odhA99wpZADY6qK4Za/00AJlrIujLoELNXI2bdHBz51Yp0gBVs3D8AgWlu86ZV+5OfPjz16MmnIFRYTJPhbMR2+6W7q9vG/lVFHQm6djlmmWkkvrAwLxCfOp+d2Ip9bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747643606; c=relaxed/simple;
	bh=WUDf5oTK59RzFC/H8RC+nKwkbd3Gr6mAZjX4xFarDhw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UAIPKrwy6tVZZEyfZS89V++F2Xm3Ax148lpnRGim71eMNOwzso5ySHwj3m4c4nBeGg+XX2eismLs2AOpWZpxZqJEEELrNI740+wCTncL+l/sLrL9DMQNegiJ/DZVKGnQjzhCG0SvQvgZk2Teo19cda3U0Y/b1SyaLod9EcD/QPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j3vyxW5P; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j3vyxW5P"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54ILLBx4021956
	for <linux-sound@vger.kernel.org>; Mon, 19 May 2025 08:33:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=lusP5vba1cH
	TmTKazSCNPRqnEYzF7hN/TG78FwTmuJE=; b=j3vyxW5PUHHR+/Ku34AVo6JFdH5
	xqHvX8WagAQs2DA4MjnQ53dwTdU5AK0QLKu2gkhmU7VcpCn0PrAt95uekykFeoJ8
	KI0TC+Up3KqTWRICq771axb7ywLE344g8qTRipmwt0YPmb4zNFJ+lA42NTkTl17m
	3lqN4OdPFuq1BR3+6gEMJx4ds4TkvvTGC2oLOUncLoj4YL24LGobF9aoium48UBH
	8QNLjoj4ecS3znih7JjOTeh+NFGi8oBi774lmQ6UkJKwc7dbn4i5Rm7xt+hNYVWQ
	RQuyFNdFjADmd7JSev8Wa+BvvSYlXXYi41gu+gCMXrg0HlQqAMz9q1pBFnQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjnykp9m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 19 May 2025 08:33:23 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-30e74ee960aso3074940a91.3
        for <linux-sound@vger.kernel.org>; Mon, 19 May 2025 01:33:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747643602; x=1748248402;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lusP5vba1cHTmTKazSCNPRqnEYzF7hN/TG78FwTmuJE=;
        b=Rs6oTqElk0i/THDQltz9Okwny7sbfrVN9embyJYW2+toCMAHu32Cd2s9VGLkRaYfkL
         CAjoGKcP1pQjhdZeYWnGY0574snbf1SSp0TQ6O6XWPusu8eXjz9UOdnyhwV49I0C8Tvs
         ELHNjRMDfj8zz9k4IXpQACXQ2yeCC/ZenQgP3icSJmfEl/r9HOxkY4Yi7vqgDtZ36wEE
         Xjh6mYbPLobeFgRJkpfi+XV2Q985DGhw3KErEYYENQqRr0ShoysK1g7PfvJ14xfEk1C4
         ZeV8l08abIbNShtYo2QQ9EkHGQtVg9CUvIkgzOTxtFN9SCx/OlUdiHuFOpQeJ/rBHRtQ
         CuWA==
X-Gm-Message-State: AOJu0Yzm3MeVoMIQA+nSus3Th7qlogJdUpbtA3FYhJYIsdHad7fxC5Eg
	B6Jf6F9u2i8rW7YTrf/yMvG++rFLPBhOHRFJT91PcAZHaVdpEYNstxC+1UBr2GcJOBn8tzCS0YR
	sly4CM/9cPrx7JxOqx+Bx67FDdIButQ+yv4d/03hqXDNUtz9Pg3BCaMpOPTGIFbaSIw==
X-Gm-Gg: ASbGncvnTYHjnvQX5NDXqLP6kgJLWaiU+EFix0NhjyfymNuvnkoUtZWyRaMpZx6UWyE
	uwzZARzaQXb/B+UKvEDSn8+dpgRqnfWMr8sjN3MULrtlg+NmDtoo7fCsChHO+hzrULXBa+ZncU8
	pcRRdgpONjklP9+Ex2Ua9kiWWZTBp7O8ZVRvGZpMoUr0V39ew+aDjeKph6exQCxdKrsaPKJSJYe
	koa92UWDOTomoieKO4oOqUutIsQ02H4C6gHIyRsdnkPNZpRL+s7ELxRbPHJCHIz23VZjspkwtDO
	5NT7eG+F71oVTOaej07xZ69GzzY7nfq00vZio4N+rSV0suIy
X-Received: by 2002:a17:90b:3a05:b0:2ff:5714:6a with SMTP id 98e67ed59e1d1-30e8319a169mr14877131a91.19.1747643602515;
        Mon, 19 May 2025 01:33:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGJgez4Ba9Dkp7xRjB49WazKLV56Vbnrwm4V+0kd/o7IW6d7+7SJKmeRpcSLYBWD3W7NX1c5A==
X-Received: by 2002:a17:90b:3a05:b0:2ff:5714:6a with SMTP id 98e67ed59e1d1-30e8319a169mr14877105a91.19.1747643602064;
        Mon, 19 May 2025 01:33:22 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30e6af9d586sm7003887a91.11.2025.05.19.01.33.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 01:33:21 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_pkumpatl@quicinc.com, kernel@oss.qualcomm.com
Subject: [PATCH v1 2/2] ASoC: qcom: sc8280xp: Add sound card support for QCS9100 and QCS9075
Date: Mon, 19 May 2025 14:02:44 +0530
Message-Id: <20250519083244.4070689-3-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250519083244.4070689-1-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20250519083244.4070689-1-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDA4MCBTYWx0ZWRfX+C1jGgVcctNY
 WYQ8KAzOcum8AA3pEytR00hAXS8j6addvteFRs9skoYjvbO8igNnehrCLGk0HTT8ztSq6njWEkZ
 tlHfWlxQN5Tyn7XgHb0Nb5RBQwEcTQyinBSGt1RciyUo7pltS5Wp9bX7mFtx7pgFVNNa1pIRSCw
 FWBHAuiulkTo12kWrLlg8pwGtAggSgSaobqVu/yWGg9UkqIXWBeP3WzbHko8C/36Z0rMcsEhTIJ
 IUXV4A54aeU61lPhLqBSvmp6g2OaT+XpsrpOpIIHXN2uXhw/hAu04iIvfVd+zdVBO7YJxNo7XiP
 HqQkJUVtO0u4d6Gsq1UIZ6l1fCyhXcxaej3NR0fy4IhvB9/BeT9jdf8EaXtfxhLgx185OHgs2fv
 OSRtE9taY3sVka4BYBYOyq+x3WnETfL7hyJdBHfovkpnCGFHvkuyeawIO6Bh/clUL+b9ElW0
X-Authority-Analysis: v=2.4 cv=Z9XsHGRA c=1 sm=1 tr=0 ts=682aecd3 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=i_bJiae3Nsw47DEeRZ4A:9 a=zgiPjhLxNE0A:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: assxOGoXwYu-BRYBqta8Pm6p6weRrB3e
X-Proofpoint-ORIG-GUID: assxOGoXwYu-BRYBqta8Pm6p6weRrB3e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_03,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 mlxlogscore=999 mlxscore=0 priorityscore=1501
 adultscore=0 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1011
 malwarescore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505190080

Add compatibles for sound card on Qualcomm QCS9100 and
QCS9075 boards.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 sound/soc/qcom/sc8280xp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
index 311377317176..99fd34728e38 100644
--- a/sound/soc/qcom/sc8280xp.c
+++ b/sound/soc/qcom/sc8280xp.c
@@ -186,6 +186,8 @@ static int sc8280xp_platform_probe(struct platform_device *pdev)
 static const struct of_device_id snd_sc8280xp_dt_match[] = {
 	{.compatible = "qcom,qcm6490-idp-sndcard", "qcm6490"},
 	{.compatible = "qcom,qcs6490-rb3gen2-sndcard", "qcs6490"},
+	{.compatible = "qcom,qcs9075-sndcard", "qcs9075"},
+	{.compatible = "qcom,qcs9100-sndcard", "qcs9100"},
 	{.compatible = "qcom,sc8280xp-sndcard", "sc8280xp"},
 	{.compatible = "qcom,sm8450-sndcard", "sm8450"},
 	{.compatible = "qcom,sm8550-sndcard", "sm8550"},
-- 
2.34.1

