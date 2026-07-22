Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35312352026;
	Wed, 22 Jul 2026 11:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784719044; cv=none; b=BVVUpvRywHAieY17twi67cqSPFJY8Dl/YN8H3mUqFvvEYNMaVs5KmlCUYy/PKbgjZocSb1OrnwcSlUfA95xe+H+AvhXFbWoM3mSrOF54NfUslMy7wboIMLD2XfPFCOly6ZtVqKQLAYn4cTUo4A9B9utXrfMSnKsUltqWswx+o1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784719044; c=relaxed/simple;
	bh=3cPmDCx2nY6zjwBPgtYMjB3Hg9MNWJNpNvdcEW6YAlE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Ky9PMqHw5BImL2jxIRvpTQK2r/1xLUbUi6kNud8odYaHXkv8kRespNuxichZP/qps/ge5N8OG0goIGfUT3A1O8M7nhmMWpjz/Y0F7uWLvcxu5rLSurVIYp/Q6rAbJV+8SRDtnTSwPmhuNyK9SJyUdVmUltbxOIvhtCbHNI6FE8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AnkWmSg3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AnkWmSg3"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M8x76B383770;
	Wed, 22 Jul 2026 11:17:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=xU2+xruU0AuV1ex3CcxzqYTcgS+l5MjAB1K
	DvwzcXRk=; b=AnkWmSg3ctm497qwH/qkZgi2ubtuIvJYFOFyWdPmx2LFAVXp3+C
	JO+IZdtOI0aW/XALMbjW/Y6wPUHbA1WGAgOtgh/pi3ARbmAdnglN+GYXmuPxD1XM
	aYFt3BiB5jXQ7T918bO6w5E5heGzMjTC5/+8gBJ1+oSs3E91IGr12kfpTmHI+6y8
	MmjgdE67dpeggQ/jLTseVHXOgiYWS1Ug61lbZN3PWv3//kTg87UH23b1WsIx7jyt
	aCUDpFaImiFVwBd+O1/pxuZ0BlrIJMP19Nu+rOKNJ6QftingPTeOcNa66TWie6X0
	c7jgCJEOfwWp8++PDiqLr6LscmdKU/jLQ9Q==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjs929010-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Jul 2026 11:17:20 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 66MBHH1I012156;
	Wed, 22 Jul 2026 11:17:17 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4fgj54dc16-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Jul 2026 11:17:17 +0000 (GMT)
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 66MBHHwj012147;
	Wed, 22 Jul 2026 11:17:17 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-pkumpatl-hyd.qualcomm.com [10.147.245.204])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 66MBHHRX012146
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Jul 2026 11:17:17 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3914174)
	id 04F9963C; Wed, 22 Jul 2026 16:47:15 +0530 (+0530)
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Subject: [PATCH] ASoC: qcom: qdsp6: Remove unused Q6AFE_MAX_CLK_ID define
Date: Wed, 22 Jul 2026 16:46:55 +0530
Message-Id: <20260722111655.3558096-1-prasad.kumpatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDEwOSBTYWx0ZWRfXyeQNDn2u0iKr
 Fwt0h9XHGdiBpX6r9neS5zZ3XG0NVAX7vVsOFIxaqo19eBt+zXW0KAZfdL7uKM6of6RpoRfOI50
 Wqg8UDDe9SQ/V1e74S+fd6m2OQX0afk=
X-Proofpoint-ORIG-GUID: U9lRsk1VMXc05JIXppZ4U4k3rVW0lYG4
X-Proofpoint-GUID: U9lRsk1VMXc05JIXppZ4U4k3rVW0lYG4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDEwOSBTYWx0ZWRfX5hEa4rS2Tekt
 /icH2EqPRskeeKzxy7Tm2gFYkv1dxxToEJrf/1YYmsJgyGSgQU5FKwJ+mgaoLhTSO2uZCs1Tjlt
 zRHqBaWCbSRANfNC/ZkAW904pxLze1063Qv7pYofvLtmrM02swJtqoIXeNYBJZLiha/XUMNbmuu
 t3FY+sA+YZb4KAAu1oOZoPdjtdhCHsSc7WW4h7oDsdVKV7Xq7oPTSoU42Un+eiLuwQijsFpmX+Y
 1568LA6/UKuegnmStJkpaNyLH6I7yfgAmSruNfv/bCXjOIVdLY4F76S96kayvZ8CpSO4L0g0zDh
 WOIFwVgPGYrebjBhiCRQXh1jBv4k/Vz0Pr7Ex/cS/c/VAxH9ihJgoIoFI8nM1/2Momy3FafV0vd
 V7zPKjaQ76WrnLWBAP8SJNggc8m5KTXZ8jGXVX0dqiVvh1/ubZL/xIckeDoq5NaB+uqtq7aqONe
 9lvhngNBf7pM0UhNxPg==
X-Authority-Analysis: v=2.4 cv=QahWeMbv c=1 sm=1 tr=0 ts=6a60a6c0 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8 a=Lxc0AqZW09P9QT77htQA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 clxscore=1015 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607220109

Q6AFE_MAX_CLK_ID is not used anywhere. Remove the unused define.

Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
---
 include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
index 45850f2d4..7b553a73b 100644
--- a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
+++ b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
@@ -237,8 +237,6 @@
 #define LPASS_HW_MACRO_VOTE		102
 #define LPASS_HW_DCODEC_VOTE		103
 
-#define Q6AFE_MAX_CLK_ID			104
-
 #define LPASS_CLK_ATTRIBUTE_INVALID		0x0
 #define LPASS_CLK_ATTRIBUTE_COUPLE_NO		0x1
 #define LPASS_CLK_ATTRIBUTE_COUPLE_DIVIDEND	0x2
-- 
2.34.1

