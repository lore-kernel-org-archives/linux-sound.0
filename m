Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDB003242BC;
	Sat,  1 Aug 2026 05:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785563196; cv=none; b=TF1wJyiU6CUAGJjM+cBXzmw8aNZxSqU2zItIWev2GXPfxkz6ps+lE+RcUjUXOiBw5omVxL4jemv//hafGMCojlmbq4ZJN59r6hFKPpFe9VcZ00PmsbxuZ7HgTIrv3+GdPAxsi8Ub77Gk6xhzXMoeJzuXdbRmRzDFIk615MMC8os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785563196; c=relaxed/simple;
	bh=BtZI5lSpqlaxbat12YXRU5+94ZJKekHBETQ5SDtriGk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=p39Q2jQLPZgLdMKXeb2L06W9AjFfgkzKhMn29xCC8SrLsIznun7NnqmnEZiY63Frqs2IbYQ4N5ZHu4pNqHt7jsq/hz6Lewi96gjzawM01LXIVRzAufh/v1MzLZk08/891GBQP3n61hmdbO1gxsXmO5S0h+YpUM1MRcuj9s+LvNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K5j/IKDt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K5j/IKDt"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6713FjOm1759110;
	Sat, 1 Aug 2026 05:46:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ijfVbJ5s4vr
	44erTXMTKA1WVtxjy0xl+kivsk6s5TI0=; b=K5j/IKDt05kJ0e/j9Ub3FPlKDkE
	mnGfIZf1C+i0jC48x3J6snekpGgDoqnvHu1c8Z8BpPOLBGfUNNeTjSRBL61yi7NZ
	51ZEdb7AGrwCXFwXgjGYy/gZktYP9p4MiMjuWQAntGwmAAaWRV6vcXqksu0XtfOO
	gith5SvSLdR3qm9f31orq31Tr5MVhUG7kg+OPlwobB8zZYVouxWnihZvyuCxRdmD
	dAaS2mH5aBogQ0RIm26zKYFjHG/0DYWhAZfWG4nGA0wqSF+3SgrO51db7GC0t3vd
	8LvfcwyLsbKYXj2oZZZ4Mbr2eKITlhCQUiZvtHGCSt627FZgWXHbC6BTSkQ==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs8r6g9mu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 01 Aug 2026 05:46:17 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 6715kEDj016936;
	Sat, 1 Aug 2026 05:46:14 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4fs9vh0utn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 01 Aug 2026 05:46:14 +0000 (GMT)
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 6715kEDd016901;
	Sat, 1 Aug 2026 05:46:14 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-pkumpatl-hyd.qualcomm.com [10.147.245.204])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 6715kDHi016859
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 01 Aug 2026 05:46:14 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3914174)
	id 11070C09; Sat,  1 Aug 2026 11:16:13 +0530 (+0530)
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Subject: [PATCH v5 4/7] ASoC: qcom: q6prm: add Audio IF clock IDs
Date: Sat,  1 Aug 2026 11:16:07 +0530
Message-Id: <20260801054610.4047089-5-prasad.kumpatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260801054610.4047089-1-prasad.kumpatla@oss.qualcomm.com>
References: <20260801054610.4047089-1-prasad.kumpatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAxMDAzNyBTYWx0ZWRfX0gxIuwUFaPry
 S1wBVOutGOqJXTVxyu20HiPX3kPG4Dlusn6exb7R52ZvdGl1PgOkPz/MvrSq43pry3ogWMENILm
 tBK3KTlSZv4oCVOspj+RaqV+g39OeK4=
X-Proofpoint-GUID: g1SJwJ5I3glHiqu1rHzrtgPbKq7vdUi4
X-Proofpoint-ORIG-GUID: g1SJwJ5I3glHiqu1rHzrtgPbKq7vdUi4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAxMDAzNyBTYWx0ZWRfX2pyn28X7g6cp
 XQScPxq7Sc+F9s0Lc7/ADUV6Q7YeGQ7zaJeoiirLf8QP7EV5NkSGvM8cO7xQ4BOhSIJH2tHNqN9
 DyZ1X5Et7R57pczqXtshkW6vXhBqsWfTiJX4YzVp5goqzg+Iqb8teqPDY72+wfIOfS8qa85AUoB
 DlSgarbVnO9GqPTE/a2neUxvRSixzU7H3rzbyKtCuJLubHQ/4VB8fHKCCSYK+oAe28a6nz2KuCG
 JwwAz833eGPEAwEeuUWZJ3fRXr4p5xhi8cp+pF7XGhdq6ybsY0Z4+36eiR1Ht2F618a7ReIlpu5
 GoHiI2DW7XSpCcHMYzX0th5vx+atRXsEL+CZU0v3o7RhY/JYDSyPTFJLejXhq61m5oaAz50Alv8
 H3WRWqtchZ0c/gevTh8+KcFK01rr8ims/Xo/20qzhewQqyHKXiGSokGoGc+QD5khcbzWa+WZN8n
 cOAH+217X13Z9kvV4Iw==
X-Authority-Analysis: v=2.4 cv=Q5ziJY2a c=1 sm=1 tr=0 ts=6a6d882a cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8 a=CMnRxhekojnJuyglMZYA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_07,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 suspectscore=0 adultscore=0 bulkscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608010037

Add the q6prm clock table entries and internal DSP clock IDs for LPASS
Audio IF backend clocks.

The public binding IDs map to q6prm DSP clock IDs starting at 0x500 for
Audio IF0 IBIT/EBIT. Add the internal definitions and register all Audio
IF IBIT and EBIT clocks so machine drivers can request them through the
APM clock controller.

Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6prm-clocks.c | 28 ++++++++++++++++++++++++++++
 sound/soc/qcom/qdsp6/q6prm.h        | 29 +++++++++++++++++++++++++++++
 2 files changed, 57 insertions(+)

diff --git a/sound/soc/qcom/qdsp6/q6prm-clocks.c b/sound/soc/qcom/qdsp6/q6prm-clocks.c
index 4c574b48ab00..38354ca8b07f 100644
--- a/sound/soc/qcom/qdsp6/q6prm-clocks.c
+++ b/sound/soc/qcom/qdsp6/q6prm-clocks.c
@@ -59,6 +59,34 @@ static const struct q6dsp_clk_init q6prm_clks[] = {
 	Q6PRM_CLK(LPASS_CLK_ID_WSA2_CORE_TX_MCLK),
 	Q6PRM_CLK(LPASS_CLK_ID_WSA2_CORE_TX_2X_MCLK),
 	Q6PRM_CLK(LPASS_CLK_ID_RX_CORE_MCLK2_2X_MCLK),
+	Q6PRM_CLK(LPASS_CLK_ID_INTF0_IBIT),
+	Q6PRM_CLK(LPASS_CLK_ID_INTF0_EBIT),
+	Q6PRM_CLK(LPASS_CLK_ID_INTF1_IBIT),
+	Q6PRM_CLK(LPASS_CLK_ID_INTF1_EBIT),
+	Q6PRM_CLK(LPASS_CLK_ID_INTF2_IBIT),
+	Q6PRM_CLK(LPASS_CLK_ID_INTF2_EBIT),
+	Q6PRM_CLK(LPASS_CLK_ID_INTF3_IBIT),
+	Q6PRM_CLK(LPASS_CLK_ID_INTF3_EBIT),
+	Q6PRM_CLK(LPASS_CLK_ID_INTF4_IBIT),
+	Q6PRM_CLK(LPASS_CLK_ID_INTF4_EBIT),
+	Q6PRM_CLK(LPASS_CLK_ID_INTF5_IBIT),
+	Q6PRM_CLK(LPASS_CLK_ID_INTF5_EBIT),
+	Q6PRM_CLK(LPASS_CLK_ID_INTF6_IBIT),
+	Q6PRM_CLK(LPASS_CLK_ID_INTF6_EBIT),
+	Q6PRM_CLK(LPASS_CLK_ID_INTF7_IBIT),
+	Q6PRM_CLK(LPASS_CLK_ID_INTF7_EBIT),
+	Q6PRM_CLK(LPASS_CLK_ID_INTF8_IBIT),
+	Q6PRM_CLK(LPASS_CLK_ID_INTF8_EBIT),
+	Q6PRM_CLK(LPASS_CLK_ID_INTF9_IBIT),
+	Q6PRM_CLK(LPASS_CLK_ID_INTF9_EBIT),
+	Q6PRM_CLK(LPASS_CLK_ID_INTF10_IBIT),
+	Q6PRM_CLK(LPASS_CLK_ID_INTF10_EBIT),
+	Q6PRM_CLK(LPASS_CLK_ID_INTF11_IBIT),
+	Q6PRM_CLK(LPASS_CLK_ID_INTF11_EBIT),
+	Q6PRM_CLK(LPASS_CLK_ID_INTF12_IBIT),
+	Q6PRM_CLK(LPASS_CLK_ID_INTF12_EBIT),
+	Q6PRM_CLK(LPASS_CLK_ID_VA_INTF0_IBIT),
+	Q6PRM_CLK(LPASS_CLK_ID_VA_INTF0_EBIT),
 	Q6DSP_VOTE_CLK(LPASS_HW_MACRO_VOTE, Q6PRM_HW_CORE_ID_LPASS,
 		       "LPASS_HW_MACRO"),
 	Q6DSP_VOTE_CLK(LPASS_HW_DCODEC_VOTE, Q6PRM_HW_CORE_ID_DCODEC,
diff --git a/sound/soc/qcom/qdsp6/q6prm.h b/sound/soc/qcom/qdsp6/q6prm.h
index bc5b9fa13283..77c2e8dad474 100644
--- a/sound/soc/qcom/qdsp6/q6prm.h
+++ b/sound/soc/qcom/qdsp6/q6prm.h
@@ -86,6 +86,35 @@
 /* Clock ID for RX CORE MCLK2 2X  MCLK */
 #define Q6PRM_LPASS_CLK_ID_RX_CORE_MCLK2_2X_MCLK 0x318
 
+#define Q6PRM_LPASS_CLK_ID_INTF0_IBIT		0x500
+#define Q6PRM_LPASS_CLK_ID_INTF0_EBIT		0x501
+#define Q6PRM_LPASS_CLK_ID_INTF1_IBIT		0x502
+#define Q6PRM_LPASS_CLK_ID_INTF1_EBIT		0x503
+#define Q6PRM_LPASS_CLK_ID_INTF2_IBIT		0x504
+#define Q6PRM_LPASS_CLK_ID_INTF2_EBIT		0x505
+#define Q6PRM_LPASS_CLK_ID_INTF3_IBIT		0x506
+#define Q6PRM_LPASS_CLK_ID_INTF3_EBIT		0x507
+#define Q6PRM_LPASS_CLK_ID_INTF4_IBIT		0x508
+#define Q6PRM_LPASS_CLK_ID_INTF4_EBIT		0x509
+#define Q6PRM_LPASS_CLK_ID_INTF5_IBIT		0x50A
+#define Q6PRM_LPASS_CLK_ID_INTF5_EBIT		0x50B
+#define Q6PRM_LPASS_CLK_ID_INTF6_IBIT		0x50C
+#define Q6PRM_LPASS_CLK_ID_INTF6_EBIT		0x50D
+#define Q6PRM_LPASS_CLK_ID_INTF7_IBIT		0x50E
+#define Q6PRM_LPASS_CLK_ID_INTF7_EBIT		0x50F
+#define Q6PRM_LPASS_CLK_ID_INTF8_IBIT		0x510
+#define Q6PRM_LPASS_CLK_ID_INTF8_EBIT		0x511
+#define Q6PRM_LPASS_CLK_ID_INTF9_IBIT		0x512
+#define Q6PRM_LPASS_CLK_ID_INTF9_EBIT		0x513
+#define Q6PRM_LPASS_CLK_ID_INTF10_IBIT		0x514
+#define Q6PRM_LPASS_CLK_ID_INTF10_EBIT		0x515
+#define Q6PRM_LPASS_CLK_ID_INTF11_IBIT		0x516
+#define Q6PRM_LPASS_CLK_ID_INTF11_EBIT		0x517
+#define Q6PRM_LPASS_CLK_ID_INTF12_IBIT		0x518
+#define Q6PRM_LPASS_CLK_ID_INTF12_EBIT		0x519
+#define Q6PRM_LPASS_CLK_ID_VA_INTF0_IBIT		0x550
+#define Q6PRM_LPASS_CLK_ID_VA_INTF0_EBIT		0x551
+
 #define Q6PRM_LPASS_CLK_SRC_INTERNAL	1
 #define Q6PRM_LPASS_CLK_ROOT_DEFAULT	0
 #define Q6PRM_HW_CORE_ID_LPASS		1
-- 
2.34.1

