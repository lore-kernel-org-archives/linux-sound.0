Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 143D53B28D;
	Sat,  1 Aug 2026 05:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785563195; cv=none; b=I5jzaFTj/sH953KsydqSbEYa1u7QVII0CjgN0ER2OoAYlCVQHVT6mrPb+YBCo9uVZKcYne3SQQDiDc/E5detCw+ZCtwCi2rWE6YXtLt54pv44TKUoG6K9Kvx4PldyX2bugvWUbWfSXBAVOktwhOSwr7HirgscozHkgxadM0YMrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785563195; c=relaxed/simple;
	bh=GugT5f9b/09YY8ACVeGc7JVaMKqVdp5MPKHKqwk+/Fs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fq8L1cuTVkkqLBpcy9ZdpeXoxWHHF0xaPp3OoAK06LlXqSwuqzxAMametDGm8h99v03Gkqf2GshivVUxIVY0hGyDWVd9JduPoc3l3/23MlKwIbJ4Huhm0Va2p9rgd2aiddZZxrKuxAqVFojKiB/1Q51qI3xq9maXBW1RmIV0uEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jqnVit13; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jqnVit13"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6713LX872059798;
	Sat, 1 Aug 2026 05:46:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=vACOLwrZTYF
	c3pUkJYl4V0QW1Wv9KJg9rKTx8DTbPBM=; b=jqnVit13KKM41wBlzzncybgnOf6
	iBanYswRxb2T7XdCPbBaI9ETEtQB0B+8tkU1P0Mb+I+HP2o9d1MlXNTkl0AR+AVp
	NyCIYOVMo5lp9666h6hm+TheWffsPr3fZr+5cLfatWpWjius5j7+D5n3Fft1n2AF
	sbCAQgxuj4YbimNxeHm/ooSitdy4dLJC3rY67OZJ3w8hp7hzb4eb0cJ9j5h/D1xi
	lpFexOjjNwqhcC9xwFJYMjpXQnRvUC/det0AJvYBL+vCFAptQ6AkNb+N+P8cujno
	Ii94bJN7JLdEceRr3NKdBUD2xGVWSrhae7ngShrKPP8GfwN2LX426A/leIA==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs8tx092f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 01 Aug 2026 05:46:17 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 6715kE3T016925;
	Sat, 1 Aug 2026 05:46:14 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4fs9vh0utk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 01 Aug 2026 05:46:14 +0000 (GMT)
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 6715kEHO016899;
	Sat, 1 Aug 2026 05:46:14 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-pkumpatl-hyd.qualcomm.com [10.147.245.204])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 6715kDPO016816
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 01 Aug 2026 05:46:14 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3914174)
	id 0C879C08; Sat,  1 Aug 2026 11:16:13 +0530 (+0530)
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
Subject: [PATCH v5 3/7] dt-bindings: sound: qcom,q6dsp-lpass-ports: add Audio IF clocks
Date: Sat,  1 Aug 2026 11:16:06 +0530
Message-Id: <20260801054610.4047089-4-prasad.kumpatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAxMDAzNyBTYWx0ZWRfX+ZZPlk3CvVtB
 N7LiBbUj05n110yasC8f6ToUlEQi9vCWce5S+gVIu+7oFuO2xafY4+XAJMof933TBxyxhkWz2My
 OPW8/GtJ6bnj10Msd5l99Sd/brBV7kLaQFh9GrLY9fIWO2+dyV0NMfm3rQlsvvmgwS5hNdW2wfD
 J72TWZdugRM4qXVjGsaQzIRAr2UvN1/zw0jQKBNzOykb7EqhxPZmASnbgNATeOrZ9K6kYsFUFmt
 aO9XoG95R8Y+fF0AZPAdqaMjM/t/SA2EpJ59Ls2Qt41g6Z0BPfBw9UiEhF0XDoahu87jYmLdFZt
 elQlEYo8aH56q2BclAuG8tgEREDE07WMCWoBjCCj7AfzU0LaQWkPC0VeKzwvaGI4ktsVb62FoUo
 LIWX6+0vVHqLpkkVs0TfiojfTJImyLqwNgImfSVwIzIWh2mjQTerSDclooGn+04f3rwOZUclWJS
 ee2SysRKHyPI3n4Yt0A==
X-Proofpoint-GUID: -AQ5plJUIK-smDk4D6ZM8ckYKO84SpeR
X-Authority-Analysis: v=2.4 cv=T9C8ifKQ c=1 sm=1 tr=0 ts=6a6d882a cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8 a=HqMH4ZOH3FVCEH9kUM0A:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAxMDAzNyBTYWx0ZWRfX7B34TEesElMa
 0KCVZKM6dxKiSQv0/4y4rhsLTyYk6/6FRxb692iDq0q9jgKiZKrZ4tdFMZmClPf8k0wcxJTnfll
 ZUCHioi6cnBtL+AldjDOR4hD/bLTraQ=
X-Proofpoint-ORIG-GUID: -AQ5plJUIK-smDk4D6ZM8ckYKO84SpeR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_07,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 spamscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608010037

Add the LPASS Audio IF clock IDs used by newer backend interfaces.

Platforms using Audio IF module backends request the interface bit
clocks through q6prm. Add the Audio IF IBIT and EBIT IDs to the binding
header so these clocks can be referenced from device trees.

Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
---
 .../sound/qcom,q6dsp-lpass-ports.h            | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
index 7b553a73bc92..fbcf1ef9ce22 100644
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

