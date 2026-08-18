Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E94443B3DA;
	Tue, 18 Aug 2026 08:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787042839; cv=none; b=EyFTOzIIfB0hy4Fu7L9pocGpBr4aFlNcm0UA8Lpt6ypcAurh67TsFL+bDiepnZVa0ILWoiLc8jvM6btVyAvjOT6edeaM2sXodMAmEgXwR4jh0A3QsuoFKBDcBOsURSYmk9SOePoNmLzlcnV1RhbnX37ecHA/p3urLpRFslWAt30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787042839; c=relaxed/simple;
	bh=B1pq66jA+k4qoW1jtlNc2a+Gl7+hzgiAisuBcCKeAlM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uYi+dPT7v9XRVszTnOtYLSPO9D0z07fMCgbO+H7+Aeyhgyzt5LbYjzimldcBpmhQXaOEQcF4VW9z8SQF0F6+9HCV6g3WYoOXNk4JaXDRELhiS1z/iM/qBqASfi3Yex9iea8pFLOjUIdToURCGxQyg7B7x70cuJ0tyS81VLmLGqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AldmKKsu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AldmKKsu"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67I8BId4243032;
	Tue, 18 Aug 2026 08:47:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=jksafapz5DP
	thN8TUsmb0QsRnKWTgw2x1iZOtNv5Ivg=; b=AldmKKsuAwezkQzuH9PzkG5bdxY
	Hvrw0MVKP0i2SMTfLDmATBNEN8V6LuskbM4rv/u7qSCZfiJ1hN5Pij9+7m9G+xyi
	fiIk0mTUV7Z0ZBWWK+kmXh1kiURL3TdDhlaWQNBTbR0bay5uFoxR0c99fdPdXVdD
	p2lid1W9snGqgZoRHAERhgj9arSbxiBECS1el2CweSsu1rIROZJ6CAowaZItk1be
	wkKDyqpUjgD6/+OYu/eoFbI89T04B9ZLnmpWIEz4O7GXuivCpvZ2kGdWEb3tFqfL
	53557UmAx4V6SB5gsCuGXvZV/pVuX9FSx4KmezQowBKy8njYT2bY+AjeC7Q==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4ea2hkvp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Aug 2026 08:47:03 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 67I8kxIk000889;
	Tue, 18 Aug 2026 08:46:59 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4g2h6jq1g4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Aug 2026 08:46:59 +0000 (GMT)
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 67I8kx5c000867;
	Tue, 18 Aug 2026 08:46:59 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-pkumpatl-hyd.qualcomm.com [10.147.245.204])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 67I8kwXW000858
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Aug 2026 08:46:59 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3914174)
	id 0D5765FF; Tue, 18 Aug 2026 14:16:58 +0530 (+0530)
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH v2 1/4] dt-bindings: sound: qcom,q6dsp-lpass-ports: Rename QAIF clock IDs
Date: Tue, 18 Aug 2026 14:16:52 +0530
Message-Id: <20260818084655.3240284-2-prasad.kumpatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260818084655.3240284-1-prasad.kumpatla@oss.qualcomm.com>
References: <20260818084655.3240284-1-prasad.kumpatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA2NCBTYWx0ZWRfX5dKacA3+BnBM
 YiLcZ+mI36zyKzJg4fzE7TgVx4DgEy5+B3/KebKwvW3W/ziOb1LRFzFonSID7wEYe16MQ08lOZG
 A1JEnl09oBhIfqg8BQ9WfeU9mOvK7o4xs4xio236+QDikzfQk1wEYilMLizaCdf1WpmihaBE45N
 sxQd5fhEsAL4aI4ZqIN+b30HFDvpoxOR2XgTY2oG9GfNLfehjbtnGCevXVFGlxxat/qguE66tBV
 yyzxnKz4pMhoxXymcjCrYCfdPQBQH4E++hr1Yjp89H27rYZtMkNt8Z5pUnTfGoXqv0WZRt3nhmX
 mBdWkkhEePqxUxDVorUjYNmxhY+2qGxst3soGA8mvuzg5eSPthZ7M0I1jartaAgZVZK+x9synot
 NfumgldN2UnlJXIuWC0PPa34l9FmEi8OS8OEubbO6vZf5hEZjzlvBoqm6iuY+DCccV3ugtf4iL6
 P1pDH5GWMMC2GeJPfrw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA2NCBTYWx0ZWRfX/ObGbqISfR6Z
 ehZcb7EPCrsFVxfLMkHgg/Tel3NQU4qwFTB+cTVO3SRyUuQs7iKD0U0vnybkEAn1mhgFLZk1WgX
 JuhxOlJe4Dxkn9aCS+N85/3sauLSJvM=
X-Authority-Analysis: v=2.4 cv=XtfK/1F9 c=1 sm=1 tr=0 ts=6a841c07 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=cLz8_XyP0gEqe-9K40IA:9 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-ORIG-GUID: IScqhpOGhEMq6PX-fiAabbDiQkNuIqZg
X-Proofpoint-GUID: IScqhpOGhEMq6PX-fiAabbDiQkNuIqZg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0
 phishscore=0 clxscore=1015 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180064

The QAIF clock IDs were introduced with a LAPSS prefix typo. Rename
them to use the existing LPASS naming convention and update all
corresponding in-tree users.

Since these IDs are new, rename them directly instead of keeping
backward-compatible aliases.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Link: https://sashiko.dev/#/patchset/20260804070307.117119-1-prasad.kumpatla@oss.qualcomm.com
Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
---
 .../sound/qcom,q6dsp-lpass-ports.h            | 56 +++++++++----------
 sound/soc/qcom/qdsp6/q6prm-clocks.c           | 56 +++++++++----------
 sound/soc/qcom/qdsp6/q6prm.h                  | 56 +++++++++----------
 3 files changed, 84 insertions(+), 84 deletions(-)

diff --git a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
index 2e879a3c09ae..3a99703dbc4a 100644
--- a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
+++ b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
@@ -237,34 +237,34 @@
 /* Clock ID for RX CORE MCLK2 2X  MCLK */
 #define LPASS_CLK_ID_RX_CORE_MCLK2_2X_MCLK	70
 
-#define LAPSS_CLK_ID_QAIF_IF0_IBIT		71
-#define LAPSS_CLK_ID_QAIF_IF0_EBIT		72
-#define LAPSS_CLK_ID_QAIF_IF1_IBIT		73
-#define LAPSS_CLK_ID_QAIF_IF1_EBIT		74
-#define LAPSS_CLK_ID_QAIF_IF2_IBIT		75
-#define LAPSS_CLK_ID_QAIF_IF2_EBIT		76
-#define LAPSS_CLK_ID_QAIF_IF3_IBIT		77
-#define LAPSS_CLK_ID_QAIF_IF3_EBIT		78
-#define LAPSS_CLK_ID_QAIF_IF4_IBIT		79
-#define LAPSS_CLK_ID_QAIF_IF4_EBIT		80
-#define LAPSS_CLK_ID_QAIF_IF5_IBIT		81
-#define LAPSS_CLK_ID_QAIF_IF5_EBIT		82
-#define LAPSS_CLK_ID_QAIF_IF6_IBIT		83
-#define LAPSS_CLK_ID_QAIF_IF6_EBIT		84
-#define LAPSS_CLK_ID_QAIF_IF7_IBIT		85
-#define LAPSS_CLK_ID_QAIF_IF7_EBIT		86
-#define LAPSS_CLK_ID_QAIF_IF8_IBIT		87
-#define LAPSS_CLK_ID_QAIF_IF8_EBIT		88
-#define LAPSS_CLK_ID_QAIF_IF9_IBIT		89
-#define LAPSS_CLK_ID_QAIF_IF9_EBIT		90
-#define LAPSS_CLK_ID_QAIF_IF10_IBIT	91
-#define LAPSS_CLK_ID_QAIF_IF10_EBIT	92
-#define LAPSS_CLK_ID_QAIF_IF11_IBIT	93
-#define LAPSS_CLK_ID_QAIF_IF11_EBIT	94
-#define LAPSS_CLK_ID_QAIF_IF12_IBIT	95
-#define LAPSS_CLK_ID_QAIF_IF12_EBIT	96
-#define LAPSS_CLK_ID_VA_QAIF_IF0_IBIT	97
-#define LAPSS_CLK_ID_VA_QAIF_IF0_EBIT	98
+#define LPASS_CLK_ID_QAIF_IF0_IBIT		71
+#define LPASS_CLK_ID_QAIF_IF0_EBIT		72
+#define LPASS_CLK_ID_QAIF_IF1_IBIT		73
+#define LPASS_CLK_ID_QAIF_IF1_EBIT		74
+#define LPASS_CLK_ID_QAIF_IF2_IBIT		75
+#define LPASS_CLK_ID_QAIF_IF2_EBIT		76
+#define LPASS_CLK_ID_QAIF_IF3_IBIT		77
+#define LPASS_CLK_ID_QAIF_IF3_EBIT		78
+#define LPASS_CLK_ID_QAIF_IF4_IBIT		79
+#define LPASS_CLK_ID_QAIF_IF4_EBIT		80
+#define LPASS_CLK_ID_QAIF_IF5_IBIT		81
+#define LPASS_CLK_ID_QAIF_IF5_EBIT		82
+#define LPASS_CLK_ID_QAIF_IF6_IBIT		83
+#define LPASS_CLK_ID_QAIF_IF6_EBIT		84
+#define LPASS_CLK_ID_QAIF_IF7_IBIT		85
+#define LPASS_CLK_ID_QAIF_IF7_EBIT		86
+#define LPASS_CLK_ID_QAIF_IF8_IBIT		87
+#define LPASS_CLK_ID_QAIF_IF8_EBIT		88
+#define LPASS_CLK_ID_QAIF_IF9_IBIT		89
+#define LPASS_CLK_ID_QAIF_IF9_EBIT		90
+#define LPASS_CLK_ID_QAIF_IF10_IBIT	91
+#define LPASS_CLK_ID_QAIF_IF10_EBIT	92
+#define LPASS_CLK_ID_QAIF_IF11_IBIT	93
+#define LPASS_CLK_ID_QAIF_IF11_EBIT	94
+#define LPASS_CLK_ID_QAIF_IF12_IBIT	95
+#define LPASS_CLK_ID_QAIF_IF12_EBIT	96
+#define LPASS_CLK_ID_VA_QAIF_IF0_IBIT	97
+#define LPASS_CLK_ID_VA_QAIF_IF0_EBIT	98
 
 #define LPASS_HW_AVTIMER_VOTE		101
 #define LPASS_HW_MACRO_VOTE		102
diff --git a/sound/soc/qcom/qdsp6/q6prm-clocks.c b/sound/soc/qcom/qdsp6/q6prm-clocks.c
index f613e2aee75e..b4f9abbe02cb 100644
--- a/sound/soc/qcom/qdsp6/q6prm-clocks.c
+++ b/sound/soc/qcom/qdsp6/q6prm-clocks.c
@@ -64,34 +64,34 @@ static const struct q6dsp_clk_init q6prm_clks[] = {
 	Q6PRM_CLK(LPASS_CLK_ID_WSA2_CORE_TX_MCLK),
 	Q6PRM_CLK(LPASS_CLK_ID_WSA2_CORE_TX_2X_MCLK),
 	Q6PRM_CLK(LPASS_CLK_ID_RX_CORE_MCLK2_2X_MCLK),
-	Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF0_IBIT),
-	Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF0_EBIT),
-	Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF1_IBIT),
-	Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF1_EBIT),
-	Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF2_IBIT),
-	Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF2_EBIT),
-	Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF3_IBIT),
-	Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF3_EBIT),
-	Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF4_IBIT),
-	Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF4_EBIT),
-	Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF5_IBIT),
-	Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF5_EBIT),
-	Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF6_IBIT),
-	Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF6_EBIT),
-	Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF7_IBIT),
-	Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF7_EBIT),
-	Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF8_IBIT),
-	Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF8_EBIT),
-	Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF9_IBIT),
-	Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF9_EBIT),
-	Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF10_IBIT),
-	Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF10_EBIT),
-	Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF11_IBIT),
-	Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF11_EBIT),
-	Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF12_IBIT),
-	Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF12_EBIT),
-	Q6PRM_CLK(LAPSS_CLK_ID_VA_QAIF_IF0_IBIT),
-	Q6PRM_CLK(LAPSS_CLK_ID_VA_QAIF_IF0_EBIT),
+	Q6PRM_CLK(LPASS_CLK_ID_QAIF_IF0_IBIT),
+	Q6PRM_CLK(LPASS_CLK_ID_QAIF_IF0_EBIT),
+	Q6PRM_CLK(LPASS_CLK_ID_QAIF_IF1_IBIT),
+	Q6PRM_CLK(LPASS_CLK_ID_QAIF_IF1_EBIT),
+	Q6PRM_CLK(LPASS_CLK_ID_QAIF_IF2_IBIT),
+	Q6PRM_CLK(LPASS_CLK_ID_QAIF_IF2_EBIT),
+	Q6PRM_CLK(LPASS_CLK_ID_QAIF_IF3_IBIT),
+	Q6PRM_CLK(LPASS_CLK_ID_QAIF_IF3_EBIT),
+	Q6PRM_CLK(LPASS_CLK_ID_QAIF_IF4_IBIT),
+	Q6PRM_CLK(LPASS_CLK_ID_QAIF_IF4_EBIT),
+	Q6PRM_CLK(LPASS_CLK_ID_QAIF_IF5_IBIT),
+	Q6PRM_CLK(LPASS_CLK_ID_QAIF_IF5_EBIT),
+	Q6PRM_CLK(LPASS_CLK_ID_QAIF_IF6_IBIT),
+	Q6PRM_CLK(LPASS_CLK_ID_QAIF_IF6_EBIT),
+	Q6PRM_CLK(LPASS_CLK_ID_QAIF_IF7_IBIT),
+	Q6PRM_CLK(LPASS_CLK_ID_QAIF_IF7_EBIT),
+	Q6PRM_CLK(LPASS_CLK_ID_QAIF_IF8_IBIT),
+	Q6PRM_CLK(LPASS_CLK_ID_QAIF_IF8_EBIT),
+	Q6PRM_CLK(LPASS_CLK_ID_QAIF_IF9_IBIT),
+	Q6PRM_CLK(LPASS_CLK_ID_QAIF_IF9_EBIT),
+	Q6PRM_CLK(LPASS_CLK_ID_QAIF_IF10_IBIT),
+	Q6PRM_CLK(LPASS_CLK_ID_QAIF_IF10_EBIT),
+	Q6PRM_CLK(LPASS_CLK_ID_QAIF_IF11_IBIT),
+	Q6PRM_CLK(LPASS_CLK_ID_QAIF_IF11_EBIT),
+	Q6PRM_CLK(LPASS_CLK_ID_QAIF_IF12_IBIT),
+	Q6PRM_CLK(LPASS_CLK_ID_QAIF_IF12_EBIT),
+	Q6PRM_CLK(LPASS_CLK_ID_VA_QAIF_IF0_IBIT),
+	Q6PRM_CLK(LPASS_CLK_ID_VA_QAIF_IF0_EBIT),
 	Q6DSP_VOTE_CLK(LPASS_HW_MACRO_VOTE, Q6PRM_HW_CORE_ID_LPASS,
 		       "LPASS_HW_MACRO"),
 	Q6DSP_VOTE_CLK(LPASS_HW_DCODEC_VOTE, Q6PRM_HW_CORE_ID_DCODEC,
diff --git a/sound/soc/qcom/qdsp6/q6prm.h b/sound/soc/qcom/qdsp6/q6prm.h
index cca77cd92bc1..cf619ef6561a 100644
--- a/sound/soc/qcom/qdsp6/q6prm.h
+++ b/sound/soc/qcom/qdsp6/q6prm.h
@@ -97,34 +97,34 @@
 /* Clock ID for RX CORE MCLK2 2X  MCLK */
 #define Q6PRM_LPASS_CLK_ID_RX_CORE_MCLK2_2X_MCLK 0x318
 
-#define Q6PRM_LAPSS_CLK_ID_QAIF_IF0_IBIT		0x500
-#define Q6PRM_LAPSS_CLK_ID_QAIF_IF0_EBIT		0x501
-#define Q6PRM_LAPSS_CLK_ID_QAIF_IF1_IBIT		0x502
-#define Q6PRM_LAPSS_CLK_ID_QAIF_IF1_EBIT		0x503
-#define Q6PRM_LAPSS_CLK_ID_QAIF_IF2_IBIT		0x504
-#define Q6PRM_LAPSS_CLK_ID_QAIF_IF2_EBIT		0x505
-#define Q6PRM_LAPSS_CLK_ID_QAIF_IF3_IBIT		0x506
-#define Q6PRM_LAPSS_CLK_ID_QAIF_IF3_EBIT		0x507
-#define Q6PRM_LAPSS_CLK_ID_QAIF_IF4_IBIT		0x508
-#define Q6PRM_LAPSS_CLK_ID_QAIF_IF4_EBIT		0x509
-#define Q6PRM_LAPSS_CLK_ID_QAIF_IF5_IBIT		0x50A
-#define Q6PRM_LAPSS_CLK_ID_QAIF_IF5_EBIT		0x50B
-#define Q6PRM_LAPSS_CLK_ID_QAIF_IF6_IBIT		0x50C
-#define Q6PRM_LAPSS_CLK_ID_QAIF_IF6_EBIT		0x50D
-#define Q6PRM_LAPSS_CLK_ID_QAIF_IF7_IBIT		0x50E
-#define Q6PRM_LAPSS_CLK_ID_QAIF_IF7_EBIT		0x50F
-#define Q6PRM_LAPSS_CLK_ID_QAIF_IF8_IBIT		0x510
-#define Q6PRM_LAPSS_CLK_ID_QAIF_IF8_EBIT		0x511
-#define Q6PRM_LAPSS_CLK_ID_QAIF_IF9_IBIT		0x512
-#define Q6PRM_LAPSS_CLK_ID_QAIF_IF9_EBIT		0x513
-#define Q6PRM_LAPSS_CLK_ID_QAIF_IF10_IBIT		0x514
-#define Q6PRM_LAPSS_CLK_ID_QAIF_IF10_EBIT		0x515
-#define Q6PRM_LAPSS_CLK_ID_QAIF_IF11_IBIT		0x516
-#define Q6PRM_LAPSS_CLK_ID_QAIF_IF11_EBIT		0x517
-#define Q6PRM_LAPSS_CLK_ID_QAIF_IF12_IBIT		0x518
-#define Q6PRM_LAPSS_CLK_ID_QAIF_IF12_EBIT		0x519
-#define Q6PRM_LAPSS_CLK_ID_VA_QAIF_IF0_IBIT		0x550
-#define Q6PRM_LAPSS_CLK_ID_VA_QAIF_IF0_EBIT		0x551
+#define Q6PRM_LPASS_CLK_ID_QAIF_IF0_IBIT		0x500
+#define Q6PRM_LPASS_CLK_ID_QAIF_IF0_EBIT		0x501
+#define Q6PRM_LPASS_CLK_ID_QAIF_IF1_IBIT		0x502
+#define Q6PRM_LPASS_CLK_ID_QAIF_IF1_EBIT		0x503
+#define Q6PRM_LPASS_CLK_ID_QAIF_IF2_IBIT		0x504
+#define Q6PRM_LPASS_CLK_ID_QAIF_IF2_EBIT		0x505
+#define Q6PRM_LPASS_CLK_ID_QAIF_IF3_IBIT		0x506
+#define Q6PRM_LPASS_CLK_ID_QAIF_IF3_EBIT		0x507
+#define Q6PRM_LPASS_CLK_ID_QAIF_IF4_IBIT		0x508
+#define Q6PRM_LPASS_CLK_ID_QAIF_IF4_EBIT		0x509
+#define Q6PRM_LPASS_CLK_ID_QAIF_IF5_IBIT		0x50A
+#define Q6PRM_LPASS_CLK_ID_QAIF_IF5_EBIT		0x50B
+#define Q6PRM_LPASS_CLK_ID_QAIF_IF6_IBIT		0x50C
+#define Q6PRM_LPASS_CLK_ID_QAIF_IF6_EBIT		0x50D
+#define Q6PRM_LPASS_CLK_ID_QAIF_IF7_IBIT		0x50E
+#define Q6PRM_LPASS_CLK_ID_QAIF_IF7_EBIT		0x50F
+#define Q6PRM_LPASS_CLK_ID_QAIF_IF8_IBIT		0x510
+#define Q6PRM_LPASS_CLK_ID_QAIF_IF8_EBIT		0x511
+#define Q6PRM_LPASS_CLK_ID_QAIF_IF9_IBIT		0x512
+#define Q6PRM_LPASS_CLK_ID_QAIF_IF9_EBIT		0x513
+#define Q6PRM_LPASS_CLK_ID_QAIF_IF10_IBIT		0x514
+#define Q6PRM_LPASS_CLK_ID_QAIF_IF10_EBIT		0x515
+#define Q6PRM_LPASS_CLK_ID_QAIF_IF11_IBIT		0x516
+#define Q6PRM_LPASS_CLK_ID_QAIF_IF11_EBIT		0x517
+#define Q6PRM_LPASS_CLK_ID_QAIF_IF12_IBIT		0x518
+#define Q6PRM_LPASS_CLK_ID_QAIF_IF12_EBIT		0x519
+#define Q6PRM_LPASS_CLK_ID_VA_QAIF_IF0_IBIT		0x550
+#define Q6PRM_LPASS_CLK_ID_VA_QAIF_IF0_EBIT		0x551
 
 #define Q6PRM_LPASS_CLK_SRC_INTERNAL	1
 #define Q6PRM_LPASS_CLK_ROOT_DEFAULT	0
-- 
2.34.1

