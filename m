Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 205F71A5B8C;
	Tue,  4 Aug 2026 07:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785827013; cv=none; b=HiF7UUis4fg/SdEkt+TU0lLw8ounWBTmiLCA26dtkFRIEYjDxHF+HUvlyjydn5rEg8bkcC8aGtPHJPTCjND/i+RUFAYeje2kWgRlloaoykoZaRqvy1enizEECoumJXGm1CiFxImrJsw9nAg9nrPTD/j6sslpIYSI3YNRkyudEYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785827013; c=relaxed/simple;
	bh=tCEfHAlOOu/d8NRWC15b+nRhXEUFWpLL2/0liHlgjmM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PIwYonBrFCjlW6KhJoojoQTJKCEywGPaWSz7fHXwacT1r+q/7FT/I3LBr9YG9acL6Lc5MXEaezSvp9adNj/tApjjKlK1tYZpEzGwsHpErgdapu4Hkoo1oED5aAq52iIKAwPtJ2SwIjmgVBLPdZUA8GZYW3NgVARls+sun31IsMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pgD9+B6H; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pgD9+B6H"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67418SOD2265281;
	Tue, 4 Aug 2026 07:03:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=oErgMB7l+oF
	nQPbpmiPrS0Q6G+8X+RS+r615N6ER2HQ=; b=pgD9+B6HSiM5XuShxswTggdtsP2
	VD6FhHeK2EuZdY1Yjq6nkY+jfaRgiaGWtdcnGI7mlcUjAO59WVEhv0KiiIk/+m6a
	HWczEHDMlhUy/mR+503jcHUeulR+i8Cx/aA3tHj5+5urEaEHj2Y23g6rR+/N6P9j
	unJkZAnvKyRSX9eaVsAMjYGjwxKVy3Ohfbb6AJInJ7P/vdzTfcCYQM3uAwCfDnOG
	KzBaqwh27pzPGBo2UgcTUO0Ley5iZDbzrlIHbk83+kkPMpI+clD4+z5ZG0qasokp
	QSmdrtYjrIi3wEOZmRXFptirQsVmqkJ0xDE9ZH0kgQjJgaGmN747hxrUV4w==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fty5saxdq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Aug 2026 07:03:19 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 67473F3m031242;
	Tue, 4 Aug 2026 07:03:15 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4fs9vjhjmr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Aug 2026 07:03:15 +0000 (GMT)
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 67473FE7031220;
	Tue, 4 Aug 2026 07:03:15 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-pkumpatl-hyd.qualcomm.com [10.147.245.204])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 67473F1H031208
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Aug 2026 07:03:15 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3914174)
	id 7E5E6640; Tue,  4 Aug 2026 12:33:14 +0530 (+0530)
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v7 3/7] dt-bindings: sound: qcom,q6dsp-lpass-ports: add Audio IF clocks
Date: Tue,  4 Aug 2026 12:33:03 +0530
Message-Id: <20260804070307.117119-4-prasad.kumpatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260804070307.117119-1-prasad.kumpatla@oss.qualcomm.com>
References: <20260804070307.117119-1-prasad.kumpatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Authority-Analysis: v=2.4 cv=SPJykuvH c=1 sm=1 tr=0 ts=6a718eb7 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8 a=Z2x2jAe23Y4aVj-ete4A:9
X-Proofpoint-ORIG-GUID: Y6EvUEjMt_tFiOo1uRh9IlCImJ03f5Ae
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDA1NCBTYWx0ZWRfX+u93JruPrvy3
 aPV6XSOBjJc44IhmQQmRgxKiLrAr7IRZqKgoTn6SsXcVxEDAI6I9NVrM+Bobi/biKtFmzdMeMyN
 CZkKVo0f0IltVhNtERw4glc2ODNvJB5X132mrZunY3OT7X7By39+74y8Q853cQNwhJwMU38Ag9e
 w6gKD2niRcc93OGMze9pY89wib2+daf+rKcfpFK3GQLWXM4dlxpZCAFthSuWQizdUlEo0RDfgcl
 W0Zrd1InSlIgJR+vBg+YBuCnxBo6uXPOuJ4kp6hzx9hBTq+ZAp4BG185xy8azylTp9nwEw5fScG
 dSLMCFCA4dRjXlXgBcxuOtTKaOEfqePT0LW95BmvbXcEbNy4MpnfKYyYGXFCoK9dxQ4thWyTpsu
 /jRMwZGXBDVMVZ+9+lRe/mOsE5j7bW4g0D2xSBHZkqxVFATp1z2HxyHG+WLLO27q7IuxN7zih1+
 od6NPMv0Urw9y3waS4Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDA1NCBTYWx0ZWRfX1RLo8QDp/IDh
 HlDEZJ8+Vq81/NGToiLmXtUHIsELm88y9RUvKmRikiV3do0oi9XFDbwQ/hf/7xmMoEYPd4BWImE
 S4k3z32jjZVo+Zd3pwMraEqo9ghvxbY=
X-Proofpoint-GUID: Y6EvUEjMt_tFiOo1uRh9IlCImJ03f5Ae
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_01,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0 adultscore=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608040054

Add the LPASS Audio IF clock IDs used by newer backend interfaces.

Platforms using Audio IF module backends request the interface bit
clocks through q6prm. Add the Audio IF IBIT and EBIT IDs to the binding
header so these clocks can be referenced from device trees.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
---
 .../sound/qcom,q6dsp-lpass-ports.h            | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
index ca84952c3884..2e879a3c09ae 100644
--- a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
+++ b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
@@ -237,6 +237,35 @@
 /* Clock ID for RX CORE MCLK2 2X  MCLK */
 #define LPASS_CLK_ID_RX_CORE_MCLK2_2X_MCLK	70
 
+#define LAPSS_CLK_ID_QAIF_IF0_IBIT		71
+#define LAPSS_CLK_ID_QAIF_IF0_EBIT		72
+#define LAPSS_CLK_ID_QAIF_IF1_IBIT		73
+#define LAPSS_CLK_ID_QAIF_IF1_EBIT		74
+#define LAPSS_CLK_ID_QAIF_IF2_IBIT		75
+#define LAPSS_CLK_ID_QAIF_IF2_EBIT		76
+#define LAPSS_CLK_ID_QAIF_IF3_IBIT		77
+#define LAPSS_CLK_ID_QAIF_IF3_EBIT		78
+#define LAPSS_CLK_ID_QAIF_IF4_IBIT		79
+#define LAPSS_CLK_ID_QAIF_IF4_EBIT		80
+#define LAPSS_CLK_ID_QAIF_IF5_IBIT		81
+#define LAPSS_CLK_ID_QAIF_IF5_EBIT		82
+#define LAPSS_CLK_ID_QAIF_IF6_IBIT		83
+#define LAPSS_CLK_ID_QAIF_IF6_EBIT		84
+#define LAPSS_CLK_ID_QAIF_IF7_IBIT		85
+#define LAPSS_CLK_ID_QAIF_IF7_EBIT		86
+#define LAPSS_CLK_ID_QAIF_IF8_IBIT		87
+#define LAPSS_CLK_ID_QAIF_IF8_EBIT		88
+#define LAPSS_CLK_ID_QAIF_IF9_IBIT		89
+#define LAPSS_CLK_ID_QAIF_IF9_EBIT		90
+#define LAPSS_CLK_ID_QAIF_IF10_IBIT	91
+#define LAPSS_CLK_ID_QAIF_IF10_EBIT	92
+#define LAPSS_CLK_ID_QAIF_IF11_IBIT	93
+#define LAPSS_CLK_ID_QAIF_IF11_EBIT	94
+#define LAPSS_CLK_ID_QAIF_IF12_IBIT	95
+#define LAPSS_CLK_ID_QAIF_IF12_EBIT	96
+#define LAPSS_CLK_ID_VA_QAIF_IF0_IBIT	97
+#define LAPSS_CLK_ID_VA_QAIF_IF0_EBIT	98
+
 #define LPASS_HW_AVTIMER_VOTE		101
 #define LPASS_HW_MACRO_VOTE		102
 #define LPASS_HW_DCODEC_VOTE		103
-- 
2.34.1

