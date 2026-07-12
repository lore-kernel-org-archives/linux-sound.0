Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DDB63A4F5B;
	Sun, 12 Jul 2026 13:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783863699; cv=none; b=UZpmoCtwh7eLczI2EJrRtKM/bGHcaOV1CLSAMRnbcEtRn/w4Mbi7kn2amwKlaW+Emdg/znb1mP1xrfoJCIafYb4vIzeDiBUa68rHWY9eok7stjamODlLf9FgCBGax8lz62Cu4HclRkUCNNMkA+BI17Q4lwZFe2HelE5BBkdCvR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783863699; c=relaxed/simple;
	bh=i/aLhILHarIsWdtVRO/80QlFRlvp3gJQWU4vgOb9Phk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CRRhwpK2wPeUTEyULHO4GmBO1RVaShdBIiqONNpGWhzMh+XVIHYBPhpU1WskYVognVCb/7ML3fdAEoKitgUv5SruHbio1IWkKOTSl5yr+gf15Fx6xK+JZzGLby5E2l62Gv02OTVzS6gOGkrFuP88iwoXsRKepIC3JpBFGNQoDvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KdwuGz4e; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KdwuGz4e"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66CDZihe2489946;
	Sun, 12 Jul 2026 13:41:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=3AgzqjWjU1l
	hyu0Oxj8ZA9LZrgwgCHD/SL9XbhePANo=; b=KdwuGz4eiwULqSruvOu2qCafBaS
	TkmF6MjBzqbPavrEXawvHNtP888TfTylO5VcWvGeKH35j68YNGy2HwfgucRtUrmy
	q/Pk0wEigX81hSSqYfYtmsl4yKPV9eYIqokvfAyYxqkGV5Ufmxq6bLJe4mm/g5Pk
	2HdWqDRpIaC5sBfd/3rV2ICb2IFYzCSifQR3mjQ2vN0GIAyesQC1V4w2N2wq4L+i
	Mq63HVxDrHXcRbCkQtLjxHvrJyW27a971Y+iAdFPlgLbDjrnPbARqOp1kBBdJHXa
	h8J5rf2rc6adTVRPTmwIoNSFJOcuMYfmHVlfsTJadpBamjJh9Qx42IaSZjw==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbf0gjs6a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 12 Jul 2026 13:41:17 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 66CDfDn0026838;
	Sun, 12 Jul 2026 13:41:13 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4fbewhmf78-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 12 Jul 2026 13:41:13 +0000 (GMT)
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 66CDfDcH026808;
	Sun, 12 Jul 2026 13:41:13 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-pkumpatl-hyd.qualcomm.com [10.147.245.204])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 66CDfDZ4026803
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 12 Jul 2026 13:41:13 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3914174)
	id 4D7A263F; Sun, 12 Jul 2026 19:11:12 +0530 (+0530)
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
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v4 3/7] ASoC: dt-bindings: qcom,q6dsp-lpass-ports: add Audio IF clocks
Date: Sun, 12 Jul 2026 19:11:06 +0530
Message-Id: <20260712134110.3306763-4-prasad.kumpatla@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=Nq3htcdJ c=1 sm=1 tr=0 ts=6a53997d cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8 a=Z2x2jAe23Y4aVj-ete4A:9
X-Proofpoint-ORIG-GUID: KbHgAF_oPqnucf38HvvFKRFj2iZxwMkc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEyMDE0MyBTYWx0ZWRfX21C53wVrYE0x
 7Vj8U1wIqkiR1OI6e0Vtlxm9GtnEutBCsiQG233UZCFu7Y4oxsaY5g/d2SQnxd7c+vsjv32dTCz
 X9/T4EB8DiXrF1SnHJtmclNjSd/36Uw2nRKMaJugIAcICh/v2V9LDGhqV9fQeFOhj30XcWtfZJP
 1NWTdo8YiVgI1xH4/x6IrLV9RXCna5DDxcqEZq6nBUrsurBUvwDQLAkyRp3qMp4D6fIdzkfIk6b
 J9Tapsc2lGL0FKmOaAuQuK7YfCkE0mUjJ5zSmS4XoLTqnr6ZIs5j80j3jil9ZemkJwHSG9H7gzd
 gBzpir5TBNKX7tfZ83IgYdonJOsfB4uMXLATyoUjS8V0Lmq8D2a4Q3q8Er28qwrfnLQCK+LyJhE
 XCfpTF70eTi1CgASF8diZhgeQwHC6SF/wFp+1PnwyvAJwuCvyoyTkQT/YMDuGfJX5JNEH0cS4jh
 82ufYqxddDidnceVk2A==
X-Proofpoint-GUID: KbHgAF_oPqnucf38HvvFKRFj2iZxwMkc
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEyMDE0MyBTYWx0ZWRfX/NjIvBzasSOZ
 LlbnouBGBLAvCLSBYbAerLiulfRiB5+lNdSKjAk2l2pVoAwTMkm3Svx5Ia3gBUDLeQHbKXCdoYZ
 +xGEkbIQ1tfxrfP1YZej2J1r039OR9Y=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-12_05,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607120143

Add the LPASS Audio IF clock IDs used by newer backend interfaces.

Platforms using Audio IF module backends request the interface bit
clocks through q6prm. Add the Audio IF IBIT and EBIT IDs to the binding
header so these clocks can be referenced from device trees.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
---
 .../sound/qcom,q6dsp-lpass-ports.h            | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
index 45850f2d4..a3aea029c 100644
--- a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
+++ b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
@@ -233,6 +233,35 @@
 /* Clock ID for RX CORE MCLK2 2X  MCLK */
 #define LPASS_CLK_ID_RX_CORE_MCLK2_2X_MCLK	70
 
+#define LPASS_CLK_ID_INTF0_IBIT		71
+#define LPASS_CLK_ID_INTF0_EBIT		72
+#define LPASS_CLK_ID_INTF1_IBIT		73
+#define LPASS_CLK_ID_INTF1_EBIT		74
+#define LPASS_CLK_ID_INTF2_IBIT		75
+#define LPASS_CLK_ID_INTF2_EBIT		76
+#define LPASS_CLK_ID_INTF3_IBIT		77
+#define LPASS_CLK_ID_INTF3_EBIT		78
+#define LPASS_CLK_ID_INTF4_IBIT		79
+#define LPASS_CLK_ID_INTF4_EBIT		80
+#define LPASS_CLK_ID_INTF5_IBIT		81
+#define LPASS_CLK_ID_INTF5_EBIT		82
+#define LPASS_CLK_ID_INTF6_IBIT		83
+#define LPASS_CLK_ID_INTF6_EBIT		84
+#define LPASS_CLK_ID_INTF7_IBIT		85
+#define LPASS_CLK_ID_INTF7_EBIT		86
+#define LPASS_CLK_ID_INTF8_IBIT		87
+#define LPASS_CLK_ID_INTF8_EBIT		88
+#define LPASS_CLK_ID_INTF9_IBIT		89
+#define LPASS_CLK_ID_INTF9_EBIT		90
+#define LPASS_CLK_ID_INTF10_IBIT	91
+#define LPASS_CLK_ID_INTF10_EBIT	92
+#define LPASS_CLK_ID_INTF11_IBIT	93
+#define LPASS_CLK_ID_INTF11_EBIT	94
+#define LPASS_CLK_ID_INTF12_IBIT	95
+#define LPASS_CLK_ID_INTF12_EBIT	96
+#define LPASS_CLK_ID_VA_INTF0_IBIT	97
+#define LPASS_CLK_ID_VA_INTF0_EBIT	98
+
 #define LPASS_HW_AVTIMER_VOTE		101
 #define LPASS_HW_MACRO_VOTE		102
 #define LPASS_HW_DCODEC_VOTE		103
-- 
2.34.1

