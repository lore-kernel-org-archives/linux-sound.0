Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B43DA14BF92
	for <linux-sound@vger.kernel.org>; Sat, 15 Aug 2026 02:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786762547; cv=fail; b=BfrrLFGfWpJ0+eYc33frgOqf5qEALcSfiVEhnLuhCpAl1ER3XfRSMjm4RTBivtQqYw0uW+7wa98T+OY7C+YQ3Q8+ir2lXJ0bAYHFn05/aV9qwV+hS4/BUzU7FX7SQO94O24W8OcYCwFKBVRUHaCcGA1pa1oWwztaPKUfJHHWJ7A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786762547; c=relaxed/simple;
	bh=FHuoXxTJNqLrIIyeCW+LnwC6Xf3s0J6bgd0qznQcEtY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=SjBBV1eUpXdAS6gq6/+pAv9yTeymO49G5LLBslIwU4J0TANXwcUR554MzAvJ+wUrVGEHCNnRA+BNowVMl2z3/9KY7i8nu3ggOzYw6h+aDfmcpQ5Zw3DAvDS10yAbnnDn2XiGbOL6ednLwP9ML9R/cCjrswlkWbt3EsfNObYT8ik=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=oDQU5u1T; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=St0zHR7u; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="oDQU5u1T";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="St0zHR7u"
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67F2e6QJ3240501;
	Fri, 14 Aug 2026 21:55:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=2rYZjTckCJDfq
	n+JdJ9bBYw/nJaUPcXUmtvwmmSzWgA=; b=oDQU5u1ThvHZCQoLrTq2Me/QwkSln
	GPKzdqepMAte3eraPYTYiSL8UZMuHdZZvTKO/mH/LfGdORzHWmmX5ieRyr1mqf+4
	bsja4esUp2ko/shB2fk6wLdgnTNZCgwA+cCzrdcu5fMxhlwP7JNxtBfFgodZMKCm
	JKlAbguFc4VS+AlGbCisgQJnmFAUX+X1I6C/DKI/0CuK6hYaJpABn0U6bVsnGwen
	PshOUl5BvLQY9JajTR4aWmVMW3/Ps8c8qbMgfrWGlTfYmVma91qFLJuTRBWwe/TS
	uES1M7OUSdBXNOinkKgnW/DlF7j3iFlNCBWMXv++XB8qUJRx/u7UokFYQ==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011008.outbound.protection.outlook.com [52.101.57.8])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4g207b53uf-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 14 Aug 2026 21:55:23 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cf/fgPo0++lGEhNsIvDM61uRGSBdnGqwXAyaBzFHQ+C/W4aZTWSRi3pyhKElf879G9STyDM1xb+tw/evn90fMkCFb2QNx+eM9QWLt/XEIyGvZbh6ATgFsOGWz9mgrBOYtVu+waFrhyaGGDA9LGki99sgqE9kitCTz4uuvH5FoUFSOMZVRDddVsNSQ1ok333DD1BuhMPlR2LOb9s4XebYDqU7ly1td7oWvACzOMgk/QqWj16F+s0qy8v1gVPMcEzAN3SnjSxgLHCp8Vfc/MSVO0tcJXwgY1DziYN0ZvP7WEkHGSI0ZQODz+yn4HxceT4k8sv5N2+XVoaHR4DUHmdX9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2rYZjTckCJDfqn+JdJ9bBYw/nJaUPcXUmtvwmmSzWgA=;
 b=sYdNiKtroN+YvDnBl32uyWy/VaQNZqz7Y3nxkOSFh28uy3kJmWb6jtrofLSQlw3XDrceRWY3bMKQfFxo/WLjRadPnrbZd2YBSctFETQRp8iW9/JdmzxxGJ/2ddM2zNh2Dt7UfIbnYmajRKhf4SCo7Q506XzgdoK0o35lxVpRtIICjwS89ASMQA4JgxNrLhszQNIaX3x+/xvpYvLwe1xMeVqcElPAFHj+UHxu24WNozTq0REeYMt7KX3YgGkS0aJi3N1hi10E11IpTYmCjBtx2IKgWoUUO1C7qLfxczYoSYgnfJRhdNTw6ciQUZnQ6HZBXlWSunWWiKX5u+LTTftTSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2rYZjTckCJDfqn+JdJ9bBYw/nJaUPcXUmtvwmmSzWgA=;
 b=St0zHR7unuEwitnLmXS7q4x7qBn7HlXm6Rowf1h+NHcPyr+3SW94F/9aMSmqIeuTw20yODAHfxk4cX0mr47OOMm95ulSqFUKpyR5ZMpIFSRB+nptAfI673BAK0xU7FnJnFHHQvbKAyGOpkaZuiM4UnyNgt2qqypsTIwxq/0l1iE=
Received: from SN7PR04CA0001.namprd04.prod.outlook.com (2603:10b6:806:f2::6)
 by DS7PR10MB4960.namprd10.prod.outlook.com (2603:10b6:5:38c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.16; Sat, 15 Aug
 2026 02:55:19 +0000
Received: from SN1PEPF00036F43.namprd05.prod.outlook.com
 (2603:10b6:806:f2:cafe::f) by SN7PR04CA0001.outlook.office365.com
 (2603:10b6:806:f2::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.17 via Frontend Transport; Sat,
 15 Aug 2026 02:55:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SN1PEPF00036F43.mail.protection.outlook.com (10.167.248.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.3 via Frontend Transport; Sat, 15 Aug 2026 02:55:19 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 14 Aug
 2026 21:55:18 -0500
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 14 Aug
 2026 21:55:18 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Fri, 14 Aug 2026 21:55:18 -0500
Received: from LT5CG31242FY.dhcp.ti.com ([10.250.163.82])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67F2tEMD3809350;
	Fri, 14 Aug 2026 21:55:15 -0500
From: Shenghao Ding <shenghao-ding@ti.com>
To: <broonie@kernel.org>
CC: <tiwai@suse.de>, <13916275206@139.com>, <perex@perex.cz>,
        <lgirdwood@gmail.com>, <linux-sound@vger.kernel.org>,
        <baojun.xu@ti.com>, <k-lu@ti.com>,
        Shenghao Ding <shenghao-ding@ti.com>
Subject: [PATCH v1] ASoC: tas2781: add support for TAS2573 DSP functionality
Date: Sat, 15 Aug 2026 10:55:10 +0800
Message-ID: <20260815025510.1815-1-shenghao-ding@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F43:EE_|DS7PR10MB4960:EE_
X-MS-Office365-Filtering-Correlation-Id: f6cd44c4-1d9b-4594-a746-08defa78a471
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|36860700016|1800799024|376014|56012099006|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	1A/q7J0/QV9uoGgU5ye9Tre0BLlF8EMSHwYfgu4qDWJZzoeUmMQSjECTjt6a9F/1CPuCiWuHLaDYEq0v2FIXWLpeV85aGXMQZc/V/IyoKR4w4V8YoX/vNL+fl3nZYA/fPNHBTxBMy/QiHFlM4SopQv4vSpe3YMM14feyAioWyKK7U3EMJTxHAt3AmsOpM3zkdEaXId4MZ5XrJD6iyNnWaN56yZPaQ1/oi2cLFE7z4WzgQfoqUwrPEtsdb6UQJhpK9stT0bYWsepPmbuiCC5e3QgzKnnlcsMXeth57k6C/6hWM//CalH9MrvWqSa5IZD5p5q6in+IgWteuzkIF4A3i/TddiGar1UzyCt/+fM83NqYtgoLZtxD4bRs0TfFG89KWQR7/cSIvaqAVqQQIAeowMqlj8cNv7YOW4vvo1TRakcG7XizTkRFiCTLXNxYxSbs6NFlHa/V/A4dUo21oBgLPWQTMHHcOIoQboqr+Jp5tE9EHEhtpgDNGhHdXJOQOKuCqH9XSRaLZSbfhautsUnVkq9ohhPK5RMSHjbI2fXfHXsRCuh8m84xGoSVVZZ51hxQcXWL2FzbwKsqwzVy9cANK5smvy0w1n7fV8oB7KNBsvj1CY1ACoSaFzhUxS6CfVNWhQz5UWl9hjKHKlYBLLNo6C4JuP3gd+0fBnr2amBz+jAz/NS5FbIKLhUb5M1C7kqOGJj5fX64fXbhCF49kdiDUQ==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(36860700016)(1800799024)(376014)(56012099006)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	XpNYD1ajjtJzGPwL0XeikLhhEW5AVD6loptFB+Y1ZgVQLo3WONT35B0QhFdxabJsfVBChVnHjwr89q2OJeYmwJT6pcaBN/pJaO2mlKfbxrFNuwhs0650GVGEvtbHBkapUkiowlQ+ZomrMOwEZi1SVoBTU09S3NQG5SARZ8fvEQamMuuDqIJa85JnBmgsElAqelmdIHmk/CtCs8f/af/3hXxft2jCUwasozgKYWaOMmoHMBV/vTUa0YU0fktKRZoDd1SG9atmfRHFQ4raSK/KWKxJTglVFdFIv45uF3SCnV3pWaQa9YEyLdz6IgeoI4GfBL698UqAN2gVWA4fHBzqBtg30qpvDfyfqGm/+7mKSly3kmJypMi/NLHewz3tW9JQfNTln03bOR21Il91E1hhcSmysYxrFq3CAmOSg6S4b3jBxH5As3wSnaO+bpJeWl5R
X-Exchange-RoutingPolicyChecked:
	U0D549yi17Bq/sQFDDUGhIbw8uCMWtVD7aRbnA8nfU2zb6g5ZNZpChApD4vp/hWkWVRdXrXVXQfd9C99csesbrrsmArlOgwEQSrTHeZNy9xINP56XE3xWyhNsCHHu+plcacYnxSRs9ZIrs56yTZadz+UBYhsSaHfQFQchv+JL19UT+yLf+3UsrNqt7iTtLMJ46zROZI+c4KIGzBCOdvRAofULRXJhoNqsy1vkHVOUydiSDYbxPA9DS4dAvmuZIWgLyLd9Smt4rccq/8BJ6OH5PTa2RSn/SRhHb4cpHk9lyph8RFi8tG3KuTcF1YF7/3hq3UApUBufdlmjSYJom9oWA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2026 02:55:19.4466
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f6cd44c4-1d9b-4594-a746-08defa78a471
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00036F43.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB4960
X-Authority-Analysis: v=2.4 cv=UvtT8ewB c=1 sm=1 tr=0 ts=6a7fd51b cx=c_pps
 a=zYHeo5UF1QI7fA+G+QDVSw==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=sozttTNsAAAA:8 a=gJ_vmGEaB9TpX6CrqTgA:9
X-Proofpoint-ORIG-GUID: r6OD3keU72OAIRMIM5N2TcvViMRIAElS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE1MDAxOSBTYWx0ZWRfX1EHi+Q2hx2s/
 vhg32ZnqXVJeeF3fQ/afcs2tDzpgv05NAewlJqaY9js8DZKZpCG6kH510brPmeMUuPHqONojDkL
 xKNFLomaKXLUQ7u5GZrZgaM9vi1HQzGQI+rx1j5xnEDSknPBUxckGqdlLMPzfcmJ5o3zS+xT8vJ
 tIY9xChZZiLdhxh5nnFTnd0EL5FzgwkHZPp97fTDIgBcsFZt5RXenVir470xiVdxxrhbfJ02fDJ
 7HkOrr3veiyMRuuJMiScrdxuf+m58NBn84bu4M/EOfniBYzwstDLysVYj5by6E/DKJ0Y8bHUGkU
 TZxKzNZvGI/vqkkCSNOQIrBb9mmf/b0QS8SQMwAnTm+mEfs8en/DfwU4xtV/w4cT2tz2Pz7BGPL
 5vHpqpeer/bj+5h3tPyXeU3H8sthpOTfj8cy57kEtQudz/4h5oMPszkPvPpI3dRhdcY7ymO36cO
 Mj3vxAtHYgHg0UjF/Vw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE1MDAxOSBTYWx0ZWRfXwQEwE0vfZJEF
 irXc6BVZHvpr2rXpxASv2gKOoRj1DbPBZsBeSfxxYs+J1kN1Lo7b/+HoKJwIyIgKxiQJGwBySob
 x6Z6JhwOprjQlNQttEhKWgNH7J+XHWY=
X-Proofpoint-GUID: r6OD3keU72OAIRMIM5N2TcvViMRIAElS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-15_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 adultscore=0 spamscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608150019

This patch extends the existing tas2781 codec driver to add full support
for the TAS2573 integrated DSP feature.

Signed-off-by: Shenghao Ding <shenghao-ding@ti.com>
---
 include/sound/tas2781-dsp.h       | 4 ++++
 sound/soc/codecs/tas2781-fmwlib.c | 4 +++-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/include/sound/tas2781-dsp.h b/include/sound/tas2781-dsp.h
index e845687decf9..de087f4ca13f 100644
--- a/include/sound/tas2781-dsp.h
+++ b/include/sound/tas2781-dsp.h
@@ -56,6 +56,10 @@ enum tasdevice_dsp_dev_idx {
 	TASDEVICE_DSP_TAS_2781_QUAD,
 	TASDEVICE_DSP_TAS_5825_MONO,
 	TASDEVICE_DSP_TAS_5825_DUAL,
+	TASDEVICE_DSP_TAS_2573_MONO,
+	TASDEVICE_DSP_TAS_2573_DUAL,
+	TASDEVICE_DSP_TAS_2573_21,
+	TASDEVICE_DSP_TAS_2573_QUAD,
 	TASDEVICE_DSP_TAS_MAX_DEVICE
 };
 
diff --git a/sound/soc/codecs/tas2781-fmwlib.c b/sound/soc/codecs/tas2781-fmwlib.c
index df30abfb3b6b..3a9cdfcae370 100644
--- a/sound/soc/codecs/tas2781-fmwlib.c
+++ b/sound/soc/codecs/tas2781-fmwlib.c
@@ -110,7 +110,7 @@ struct tas2781_cali_specific {
 };
 
 static const char deviceNumber[TASDEVICE_DSP_TAS_MAX_DEVICE] = {
-	1, 2, 1, 2, 1, 1, 0, 2, 4, 3, 1, 2, 3, 4, 1, 2
+	1, 2, 1, 2, 1, 1, 0, 2, 4, 3, 1, 2, 3, 4, 1, 2, 1, 2, 3, 4,
 };
 
 /* fixed m68k compiling issue: mapping table can save code field */
@@ -1949,6 +1949,8 @@ static void dspbin_type_check(struct tasdevice_priv *tas_priv,
 		else
 			tas_priv->dspbin_typ = TASDEV_ALPHA;
 	}
+	if (tas_priv->chip_id == TAS2573)
+		return;
 	if ((tas_priv->dspbin_typ != TASDEV_BASIC) &&
 		(ppcver < PPC3_VERSION_TAS5825_BASE))
 		tas_priv->fw_parse_fct_param_address =
-- 
2.43.0

