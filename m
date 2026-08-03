Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C7A53909A6;
	Mon,  3 Aug 2026 19:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785787004; cv=none; b=oPDsT3gVOidDJQnJDHw85xqTfOZDf7VWYgDiEoeS5ThSNNN3H6zOXGIf9+SDIw/JeVIQcapkBNqzk+ntz7U++e5criZmzw1u3XHf7xqWlfPt+O7TP3BIoGPXX5bjd4cZmYrqeQpZGi932bM6IZbUbqFTZKEus6I6TMK4hJTq1Y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785787004; c=relaxed/simple;
	bh=/F43lY8V7ahblzHXT9flENG8qbWUzujxxc/TRLCc01U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DF9rSUP7ca/pC3MZovWiy/Ixz2kJA5gFRr0P8ZBO3O3sj/xAcCqVfdklqWLkGLQhMUeNdjrTK2nDA2zJhu8HyoUJ+VGa/dQl3rmRsOJ9qtbRsAoV5bXyytee1wPycsodu7TP6adgt0xntGIOA6O2J30lZNNceuAenOCZ0kCIZo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p2DiUVMm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p2DiUVMm"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 673JkgSk1750275;
	Mon, 3 Aug 2026 19:56:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=uuLGnZyxvDw
	q9Lx836BTOj6UZXBthOJa9RRdxNkAGo8=; b=p2DiUVMmKQiGgLAmKyetSKeotji
	waBtnwR4JPC+drBOXdORCXQ0z26GKiIcMou/lYHILqbQMPGnY+BRzVdeyekGGl90
	MhWw2mRp5rmZ3yI9DKTFF/ifOIYqv5I3ZNvpa82xhvQOhYZsu/QftezwrFQY/EpX
	52T6fcF+Vr1lkQGZtoQAraRTl0rOtBqKoJPnTlhJgloWpnjgN8HncOdGyFDNo5mQ
	vKkKtdaWfWjb6FAZRKCBFlBZSiWhjE9fOF8yCQmDCDZ0MDnGH7o/NPBiKzUiR9Mx
	kk5bfb/b6PyHNZUl7P/X0rLXr0azs92nYQAsW7K6hYVn1IE0IwGfdqr0cRg==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fty3r0qt0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Aug 2026 19:56:32 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 673JuS7n016737;
	Mon, 3 Aug 2026 19:56:28 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4fs9vj9wus-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Aug 2026 19:56:28 +0000 (GMT)
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 673JuSY3016710;
	Mon, 3 Aug 2026 19:56:28 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-pkumpatl-hyd.qualcomm.com [10.147.245.204])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 673JuRFC016705
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Aug 2026 19:56:28 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3914174)
	id E6E41641; Tue,  4 Aug 2026 01:26:26 +0530 (+0530)
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v6 4/7] ASoC: qcom: q6prm: add Audio IF clock IDs
Date: Tue,  4 Aug 2026 01:26:21 +0530
Message-Id: <20260803195624.3606352-5-prasad.kumpatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260803195624.3606352-1-prasad.kumpatla@oss.qualcomm.com>
References: <20260803195624.3606352-1-prasad.kumpatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Authority-Analysis: v=2.4 cv=caPiaHDM c=1 sm=1 tr=0 ts=6a70f270 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8 a=lFrHCqQP30YjRFDurIEA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDE3NiBTYWx0ZWRfX5WFSIrkAHCCa
 W0lBYiVKFC/hH7Eytul64n2uQMQknShF1k5cswyMgsahHx1ZTkpBnn3PHAgnMMMFQ4WahgZ/SW1
 hfak+aKRhyiNG2GxQ+r7bYDuqPmslXU=
X-Proofpoint-GUID: k5XGqIyJSaPmTwUqydY1TfldNggmNVD3
X-Proofpoint-ORIG-GUID: k5XGqIyJSaPmTwUqydY1TfldNggmNVD3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDE3NiBTYWx0ZWRfX7//VVdrWv8a/
 WW1gtihGzBJosBNxihQroA07kB6W262Hho3vF1CVpOZWcl4KU99CTttNabzCWe5mDDXprHkVppN
 0U96DrtYTQ9ywU2LXrgPCeGFRQeVO5LJtqs8omatO/7aKwO2xZ5GzQ6mEFlsYobwMT6FcuFdfoW
 lL9GaVY13JseJDQd2fI1YW+5F1OT5Kz6rlxUsM/nJYmV/5eAai+Mngjb4Ywq7KD9tW+oBonFcIZ
 BPTtUQ3WVGxlXdgU8di/a0VI93l9+G/uPYsUVr6wB7OogWAcFCj2HdHSonxMHQKfVT4AivYIq13
 4fsm2QxPuWyhUUxs8ddUvhECJXJuvaF++Sef4Iwc46m50FH3XAU5YlXHKpXIhnC89TtsWqAPO7F
 kglqrQ2PcNnGPu09a46qSgrErDBHbuIhzkAUG8pxcadRP92g8Mz5IDnuWKubHIrPcjhlCWFsBtU
 nazZtPFqxFkuBgVZBtQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-03_05,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 phishscore=0
 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030176

Add the q6prm clock table entries and internal DSP clock IDs for LPASS
Audio IF backend clocks.

The public binding IDs map to q6prm DSP clock IDs starting at 0x500 for
Audio IF0 IBIT/EBIT. Add the internal definitions and register all Audio
IF IBIT and EBIT clocks so machine drivers can request them through the
APM clock controller.

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6prm-clocks.c | 28 ++++++++++++++++++++++++++++
 sound/soc/qcom/qdsp6/q6prm.h        | 29 +++++++++++++++++++++++++++++
 2 files changed, 57 insertions(+)

diff --git a/sound/soc/qcom/qdsp6/q6prm-clocks.c b/sound/soc/qcom/qdsp6/q6prm-clocks.c
index 4c574b48ab00..39f608ac7a2e 100644
--- a/sound/soc/qcom/qdsp6/q6prm-clocks.c
+++ b/sound/soc/qcom/qdsp6/q6prm-clocks.c
@@ -59,6 +59,34 @@ static const struct q6dsp_clk_init q6prm_clks[] = {
 	Q6PRM_CLK(LPASS_CLK_ID_WSA2_CORE_TX_MCLK),
 	Q6PRM_CLK(LPASS_CLK_ID_WSA2_CORE_TX_2X_MCLK),
 	Q6PRM_CLK(LPASS_CLK_ID_RX_CORE_MCLK2_2X_MCLK),
+	Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF0_IBIT),
+	Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF0_EBIT),
+	Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF1_IBIT),
+	Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF1_EBIT),
+	Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF2_IBIT),
+	Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF2_EBIT),
+	Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF3_IBIT),
+	Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF3_EBIT),
+	Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF4_IBIT),
+	Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF4_EBIT),
+	Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF5_IBIT),
+	Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF5_EBIT),
+	Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF6_IBIT),
+	Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF6_EBIT),
+	Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF7_IBIT),
+	Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF7_EBIT),
+	Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF8_IBIT),
+	Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF8_EBIT),
+	Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF9_IBIT),
+	Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF9_EBIT),
+	Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF10_IBIT),
+	Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF10_EBIT),
+	Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF11_IBIT),
+	Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF11_EBIT),
+	Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF12_IBIT),
+	Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF12_EBIT),
+	Q6PRM_CLK(LAPSS_CLK_ID_VA_QAIF_IF0_IBIT),
+	Q6PRM_CLK(LAPSS_CLK_ID_VA_QAIF_IF0_EBIT),
 	Q6DSP_VOTE_CLK(LPASS_HW_MACRO_VOTE, Q6PRM_HW_CORE_ID_LPASS,
 		       "LPASS_HW_MACRO"),
 	Q6DSP_VOTE_CLK(LPASS_HW_DCODEC_VOTE, Q6PRM_HW_CORE_ID_DCODEC,
diff --git a/sound/soc/qcom/qdsp6/q6prm.h b/sound/soc/qcom/qdsp6/q6prm.h
index bc5b9fa13283..d4aa67adee11 100644
--- a/sound/soc/qcom/qdsp6/q6prm.h
+++ b/sound/soc/qcom/qdsp6/q6prm.h
@@ -86,6 +86,35 @@
 /* Clock ID for RX CORE MCLK2 2X  MCLK */
 #define Q6PRM_LPASS_CLK_ID_RX_CORE_MCLK2_2X_MCLK 0x318
 
+#define Q6PRM_LAPSS_CLK_ID_QAIF_IF0_IBIT		0x500
+#define Q6PRM_LAPSS_CLK_ID_QAIF_IF0_EBIT		0x501
+#define Q6PRM_LAPSS_CLK_ID_QAIF_IF1_IBIT		0x502
+#define Q6PRM_LAPSS_CLK_ID_QAIF_IF1_EBIT		0x503
+#define Q6PRM_LAPSS_CLK_ID_QAIF_IF2_IBIT		0x504
+#define Q6PRM_LAPSS_CLK_ID_QAIF_IF2_EBIT		0x505
+#define Q6PRM_LAPSS_CLK_ID_QAIF_IF3_IBIT		0x506
+#define Q6PRM_LAPSS_CLK_ID_QAIF_IF3_EBIT		0x507
+#define Q6PRM_LAPSS_CLK_ID_QAIF_IF4_IBIT		0x508
+#define Q6PRM_LAPSS_CLK_ID_QAIF_IF4_EBIT		0x509
+#define Q6PRM_LAPSS_CLK_ID_QAIF_IF5_IBIT		0x50A
+#define Q6PRM_LAPSS_CLK_ID_QAIF_IF5_EBIT		0x50B
+#define Q6PRM_LAPSS_CLK_ID_QAIF_IF6_IBIT		0x50C
+#define Q6PRM_LAPSS_CLK_ID_QAIF_IF6_EBIT		0x50D
+#define Q6PRM_LAPSS_CLK_ID_QAIF_IF7_IBIT		0x50E
+#define Q6PRM_LAPSS_CLK_ID_QAIF_IF7_EBIT		0x50F
+#define Q6PRM_LAPSS_CLK_ID_QAIF_IF8_IBIT		0x510
+#define Q6PRM_LAPSS_CLK_ID_QAIF_IF8_EBIT		0x511
+#define Q6PRM_LAPSS_CLK_ID_QAIF_IF9_IBIT		0x512
+#define Q6PRM_LAPSS_CLK_ID_QAIF_IF9_EBIT		0x513
+#define Q6PRM_LAPSS_CLK_ID_QAIF_IF10_IBIT		0x514
+#define Q6PRM_LAPSS_CLK_ID_QAIF_IF10_EBIT		0x515
+#define Q6PRM_LAPSS_CLK_ID_QAIF_IF11_IBIT		0x516
+#define Q6PRM_LAPSS_CLK_ID_QAIF_IF11_EBIT		0x517
+#define Q6PRM_LAPSS_CLK_ID_QAIF_IF12_IBIT		0x518
+#define Q6PRM_LAPSS_CLK_ID_QAIF_IF12_EBIT		0x519
+#define Q6PRM_LAPSS_CLK_ID_VA_QAIF_IF0_IBIT		0x550
+#define Q6PRM_LAPSS_CLK_ID_VA_QAIF_IF0_EBIT		0x551
+
 #define Q6PRM_LPASS_CLK_SRC_INTERNAL	1
 #define Q6PRM_LPASS_CLK_ROOT_DEFAULT	0
 #define Q6PRM_HW_CORE_ID_LPASS		1
-- 
2.34.1

