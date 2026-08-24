Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58CC43E8354;
	Mon, 24 Aug 2026 06:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787553414; cv=none; b=siTOJhGxpLGJgGlb7kAZcelH5f30F9lo/n8KsrBdtRWT2kKtwGjiELgpRio14YCYUmmP08DKUUvwLPR4IhxbnxjnBtmgp2ywBz+vkl+mRvNuqi0yK0F99oVopwUlFfBQEIR0CLkAiC4MuZL9WPJuWIgI4hKgOSxt8eOz17j/TZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787553414; c=relaxed/simple;
	bh=xzWJu4mgQMj/puzxJ9JBqV3Aqyu6G9kbzjjHAp9NdUs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YPrRzoR20Pi4uXgXcw5VmfWXPza58q7/9yDuNOGyWC988blZpCSNBTKluiFyz+VTG521tHy9T7HSrgj2Q5IJKb8pLhpL1lGl1NMenDw8Bys9VX79Tken4Tbk9sp1USDxCYcL2kGAsM2w1afZNMcNOswb9chzzV2PpSLEXCC4Gco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fXNhuG7r; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fXNhuG7r"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O67lCX1662757;
	Mon, 24 Aug 2026 06:36:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=/3uYiAq+P4D
	XcXTgfF83G1TUWUQ0IL6MVm/SXltsFZs=; b=fXNhuG7r5hlp6q2mE6A/53om7Wx
	ClVUfMY0YPgi7RgLWyRIpaOuxXk/XW+QFHa5rwdsWDhPvzo/pCCfrjdweyXar8gV
	Oh7TPktc7oTH+et0irgGiGHO1jvFdihr9K2cOdkCvUopm6y/CdK/bGB+a1GGqkWu
	lzbyL2+qTu0/hq8ASBT6hgaHSp8PGlQDR//w5sN7EwYuTyM0IjRGGgZmWox42n0y
	A3hU8LO9I0Grpe5+RCJISMQs0YcypTP2OypNhP41NFDqirxdFD05YqUGJeXK+c+m
	/fdnxfs64NT49xXOWavbudhcNpsbHnCulrCjRjHx15M9zHrKeLVVeBNmrEg==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8gdsg30p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Aug 2026 06:36:45 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 67O6aamI015823;
	Mon, 24 Aug 2026 06:36:42 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 4g74uj2han-1;
	Mon, 24 Aug 2026 06:36:42 +0000 (GMT)
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 67O6aUCU015364;
	Mon, 24 Aug 2026 06:36:42 GMT
Received: from hu-hgautam-hyd.qualcomm.com (hu-hgautam-hyd.qualcomm.com [10.147.247.91])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 67O6aUFJ015360;
	Mon, 24 Aug 2026 06:36:42 +0000 (GMT)
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>,
        Kumar Anurag Singh <kumar.singh@oss.qualcomm.com>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Subject: [PATCH v3 9/9] MAINTAINERS: Add Qualcomm QAIF driver entry
Date: Mon, 24 Aug 2026 12:06:27 +0530
Message-Id: <20260824063627.3595610-10-harendra.gautam@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260824063627.3595610-1-harendra.gautam@oss.qualcomm.com>
References: <20260824063627.3595610-1-harendra.gautam@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-GUID: GpaYXn_WrTKxFwX2B5psrj9wrqaH5c8u
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA1NyBTYWx0ZWRfX5VDKcjhFMTDe
 ZrMlXgJFVLvulMwLRqD9SoLr1Ajal+lCT9Gg+vKl4XEXm+4gEEku1hCq3KSIzW4iAKFxEDRNoaI
 oT/l88k+mVTUmcnQjXGrWdxD+Xzi7em5ehnhuzfjC9h+iHOzEo4zRMkmJIj5eFMmc8iq+eTpDHT
 13NetC4Hqgy9m1Fb+t3i5Re/RYAlue8ybo2OG+HJjzHxAbMIpQo+LWua3TzWe0FitRGi4YtaCqR
 Qk2XHdTzd6EFQYUn9oWc8afzJqhap9PCtC8NErH7Bl10eXGw7M5hFIy+JMGe8o5NJCwY9fLrEyN
 EZ0yjzkqkufSNg6isid4yV0zCWDEPfFOOvFx8gCbcEKCJIVcsTOEH0iVLzmm4tYMz3Opui8Dxkv
 GmObp7QcD1evohl8acoexKI8+iVD7or7uFc/e7mwwrYtWqbbXWzgOc+3fTuNwlQ4rmOwaOHuQnv
 UmFuUIjYzbcmHE0tcZA==
X-Authority-Analysis: v=2.4 cv=Fqo1OWrq c=1 sm=1 tr=0 ts=6a8be67d cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=p_zNOyPMS-bnoZCD58wA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: GpaYXn_WrTKxFwX2B5psrj9wrqaH5c8u
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA1NyBTYWx0ZWRfX9Jn3VVLAZtJB
 KdOH07RcXZ+mwIWALxHjTT5zUEaefDvCbp54+Qt7k5g3IAJZ3T9ve8KaKNtO3WHBN0fP7AIDoeu
 x7a60gNgEzB7SWeU1Dyb9bGresPcEMY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_02,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240057

Signed-off-by: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
---
 MAINTAINERS | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 68cfa7f7faa0..5413153bf7b5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21900,6 +21900,16 @@ F:	sound/soc/codecs/wcd93*.*
 F:	sound/soc/codecs/wsa88*.*
 F:	sound/soc/qcom/
 
+QCOM AUDIO INTERFACE (QAIF) DRIVER
+M:	Harendra Gautam <harendra.gautam@oss.qualcomm.com>
+M:	Srinivas Kandagatla <srini@kernel.org>
+L:	linux-sound@vger.kernel.org
+L:	linux-arm-msm@vger.kernel.org
+S:	Supported
+F:	Documentation/devicetree/bindings/sound/qcom,qaif-cpu.yaml
+F:	include/dt-bindings/sound/qcom,qaif.h
+F:	sound/soc/qcom/qaif*
+
 QCOM EMBEDDED USB DEBUGGER (EUD)
 M:	Souradeep Chowdhury <quic_schowdhu@quicinc.com>
 L:	linux-arm-msm@vger.kernel.org
-- 
2.34.1

