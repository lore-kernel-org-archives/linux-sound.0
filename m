Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06CD53ACEF2;
	Sun, 12 Jul 2026 13:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783863700; cv=none; b=SPCyZG+PCaUSefR+U4rrdn702QbUC68GnyN5AKClPbV0bpzv04/KITXBbxt6d/Aq5hkcgqLcpedO7perO4W38gAe9yQwuc41vvScZMtx4MZ9lN8Lk/FnuuMPYQUT+ikvT1BfC48uK7VXh1WiBAF5QmUUwU4j4YnSpNXHioYBYZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783863700; c=relaxed/simple;
	bh=QpBY+y0b0HJjwBLCrnPAaOkn3k+z4+2hw11P851wttU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hE2+hbe9Q9NjpCs8KNPcE6jMqDZtTjvTiKp/khI+B6ftqSI/lQ3Zjl+Jn1VMWkn6/k4VfwnhL3V2rvbyWvfMuWX7bpUWyqpIZ0RVMYrdFKFlLwE2z6Tfp7HJ5AtYdqqE9LNT29m+gfCv3uMcP/deTmEi2cgffPXxYFDh0UJj13k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eqxk+vEY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eqxk+vEY"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66CDZjra2749530;
	Sun, 12 Jul 2026 13:41:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=rFFLEIDy89j
	AwffX1xzL+8ZbklcG+tzawzSU0LwgtQ0=; b=eqxk+vEYUADg+2ENMhEkdsuM3cW
	UG0bN1HSK7VUauNf8JWxtaIWqHAJ2jAHnjaltgIrfAV6G84+VI9XuIfx2jr7t88c
	/945mrhd+Ti9wZlcGwukWvWMER+88WY18A2RMaT7He5l5vAk1P4m+zGMPslK/5ya
	oFbsn1wxuk/DowzqZvjX8sm3yk4NaKcBGaR5+Ot8bJUBm7euHAboReHQlKrx5ndE
	6pCEAM9SVavKA11PfP+DTjP2frNsdps5wF9VcfRZ9JNeNpeLGs+efeBE+DSkpegu
	ZauwUhbdgLh286nSDZDbLUWsYYGpgedQsuSdp0uHnyOZ0r0wBbALFZBfDUg==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbe8vatfx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 12 Jul 2026 13:41:17 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 66CDfD0b026840;
	Sun, 12 Jul 2026 13:41:13 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4fbewhmf7a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 12 Jul 2026 13:41:13 +0000 (GMT)
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 66CDfDBc026810;
	Sun, 12 Jul 2026 13:41:13 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-pkumpatl-hyd.qualcomm.com [10.147.245.204])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 66CDfDnd026801
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 12 Jul 2026 13:41:13 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3914174)
	id 51E30640; Sun, 12 Jul 2026 19:11:12 +0530 (+0530)
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Subject: [PATCH v4 4/7] ASoC: qcom: qdsp6: q6prm: add Audio IF clock IDs
Date: Sun, 12 Jul 2026 19:11:07 +0530
Message-Id: <20260712134110.3306763-5-prasad.kumpatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260712134110.3306763-1-prasad.kumpatla@oss.qualcomm.com>
References: <20260712134110.3306763-1-prasad.kumpatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-ORIG-GUID: NNIx_pdWLXoEoE9sOJrqP3HPjG-uJOzS
X-Proofpoint-GUID: NNIx_pdWLXoEoE9sOJrqP3HPjG-uJOzS
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEyMDE0MyBTYWx0ZWRfX5zp5qkoqaa0h
 /bxm/tKWIwPZod+WGb2vXcHRmkNPkz56JZcGBmiVmaCMLDdqo+T+fVMiQ5GHtuVHafFJxx1PHuM
 01J4B/V3SsvkvLgvjM7YM2s07W/P6c4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEyMDE0MyBTYWx0ZWRfX7p7Lg9R8y1lV
 sB+q/3SkX6sm8I7Qc9UPIPN8aKHhABthFLD5zky7EuqolWuytErNjVYNGtc+OX5raHfpz4+kWEi
 oZbsd/izsZ2vefvTy4vlXg3sN+Rb+/S7g3D/1ip8d61+OcV3BbLhN78pFOvQeFuxV5jEx4AK1dI
 UUcPbYFyTGy+c3llmtP7YTfle4wgCB47RdcEOuyW2O34GMn35/IKClVRmCWQoF7KhSdXHIWJFDC
 LfFzFrCNrWtaPPXpxCAUBOFVNfQ9ZDPwPWAp3Qapi8IGrw+bpri8JzA+HjLb75zo6JCmIZYP4kH
 ANFdP91r2UOs4t5UXaazm8xMU8BUg/3rzEdToL5YGnBbucEtQaLNl/EXD1xa3LeatvA2AFbRiov
 OaD6b1RNa0A9ROWiVC2mnHSSrtPQpXiVgoWzoe5rJkq4UV8dxN0HVRTL8w4yzxaWJ6lpj0wX9h7
 w9c3sk3DADgyCvbkVEw==
X-Authority-Analysis: v=2.4 cv=WONPmHsR c=1 sm=1 tr=0 ts=6a53997e cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8 a=CMnRxhekojnJuyglMZYA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-12_05,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 phishscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607120143

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
index 4c574b48a..38354ca8b 100644
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
index bbbe6d368..1593f6bd4 100644
--- a/sound/soc/qcom/qdsp6/q6prm.h
+++ b/sound/soc/qcom/qdsp6/q6prm.h
@@ -87,6 +87,35 @@
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

