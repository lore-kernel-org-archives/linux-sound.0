Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDCAF31960B;
	Sat,  8 Aug 2026 18:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786213222; cv=none; b=b8aZcsHwPKfdUV5Gcasul8XCg7cCUaB6qMxpvXCoPExbqhnJCNDX4vhK/d77bho/kYoeUeYYbTFcVLJIl83DvUt8sAo1Mzxi7t/r2dpuwCyjiznBCey2282JVMDWfzy+nlxUF8EmmvfqfDpAIHOX/b2qSubQjG8lnPvJzlsN6iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786213222; c=relaxed/simple;
	bh=nVvwJ+xcw00RT6G4rVU/nEovJczWs6jQ6+pcw7EhS+A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qYp/yJ4x48t42Kgti5TV8el9mSllLptgyov0vygf89w/EMUzH5f973Z5Qqs9grudkjP3zkg2vDqclnPpGebkD0hN5oPP/DOp3h9NirxyP3fbZBZ3f+bWIqRwZhd9zYoSHWxMiWqLwHdD27vHtpv/Bhtu349wkP+m0aqGOIDBaP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SLxpMv0Z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SLxpMv0Z"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 678GmIhE073252;
	Sat, 8 Aug 2026 18:19:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=uKXqSr9rj4l
	T2Vf4BWjFSuuftS6W9uzOGORxyos78RE=; b=SLxpMv0ZeEg7EtuNDVp73gc9c6o
	nC7bnyicyLAig4+dMrFEocMINFOsABNC1YT7chPoOoMVBCMseZYYVew+cZziXidw
	KwYvVgcXgd+g6IUuFePveloqapsqO2a/E9dj4cIseJICZW7HpV/BVpih6hc0V9sH
	lRMk3mySUsO3ukBmH/ZvAK1XEcuIsgUOLkIIEguXGq1D+0+KeHh+2MWNwcSc+/iU
	VMSdfH8T0qQWjzbyDTZlCOBq7ZPmlVNczc6NQ/RnEkduNTO6wWSbeCXvkMTGxlN1
	MfkKCYuwYPyl8hxd6FtAPg0Ngvu0xIF4MK6nR86MZz+tev8MHTRIp3e3d2Q==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwvu8hejj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 08 Aug 2026 18:19:55 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 678IJqES009361;
	Sat, 8 Aug 2026 18:19:52 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4fwwhhhg11-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 08 Aug 2026 18:19:52 +0000 (GMT)
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 678IJqsu009334;
	Sat, 8 Aug 2026 18:19:52 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-pkumpatl-hyd.qualcomm.com [10.147.245.204])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 678IJqMs009331
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 08 Aug 2026 18:19:52 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3914174)
	id 2E279581; Sat,  8 Aug 2026 23:49:51 +0530 (+0530)
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
Subject: [PATCH v1 1/5] dt-bindings: sound: qcom,q6dsp-lpass-ports: Rename QAIF clock IDs
Date: Sat,  8 Aug 2026 23:49:44 +0530
Message-Id: <20260808181948.2489187-2-prasad.kumpatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260808181948.2489187-1-prasad.kumpatla@oss.qualcomm.com>
References: <20260808181948.2489187-1-prasad.kumpatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-GUID: WvUTodC-9I7fuxICNmL1bnDZlhQG1Ew6
X-Authority-Analysis: v=2.4 cv=M8p97Sws c=1 sm=1 tr=0 ts=6a77734b cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=4KQ4OcAGHkQRCoG6PToA:9 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-ORIG-GUID: WvUTodC-9I7fuxICNmL1bnDZlhQG1Ew6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA4MDE1NyBTYWx0ZWRfX831sEcEijfJx
 bOz5ifXswx5PDg+tgOWGlJ8EDfCuXk9+jqr3gc/dAUbcv4vsrMB8EgKRfACgg0wi0r8wqMKL0BI
 3NI7NWcY7ykXV94VgMR4eBwRdlYbltwtNfh+ybcJsV3cgRF14aj4QTDL3EooFpPWD2KHId9B8r6
 s0fYWqbtXF0rIDsnB6dZzksi9avTxFpuglPXxsXKFLl7h3nLg+scJpbvur6l8k1mcgo9UgDQpfe
 vk1O3AzYTA1paF2v4QWd8VsjjUQmTJIhkVmcavRz6h81EhB0Oih1Je9YVb3lkYO7dxSqjR2YkZG
 WL/2lYSpHw4rfOEB3OzCg+O0ssNDmZ54iuH0wj9viQTstFBTQYteAyJMkyvHmYDLDGHHnx8qfSz
 vvwWcT7byrWe3+lxKi54uVRmN0C6o72Cv01lWaAc33jbLex+3+xEv9vZdxh0rLlxpBwVkG7RoMT
 5XAwzrAC54r+B2zfETg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA4MDE1NyBTYWx0ZWRfX1VOnisDvwgiT
 9EotEyHq1jvtYFwrNZr4MDPv13SwQeK6rJX6/oy7BOEDlyPke912I4NV3eYewZad/x4Runw8S/i
 zZiQdT4+N3l0P1Dy4O3M905cPdcZRVE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-08_06,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1011 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 impostorscore=0 adultscore=0 bulkscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608080157

The QAIF clock IDs were added with a LAPSS prefix typo. These IDs are
new, so rename them directly to the existing LPASS naming convention
instead of keeping misspelled aliases.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Link: https://sashiko.dev/#/patchset/20260804070307.117119-1-prasad.kumpatla@oss.qualcomm.com
Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
---
 .../sound/qcom,q6dsp-lpass-ports.h            | 56 +++++++++----------
 1 file changed, 28 insertions(+), 28 deletions(-)

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
-- 
2.34.1
