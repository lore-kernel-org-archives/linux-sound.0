Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B685343C7CB;
	Thu, 20 Aug 2026 11:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787226737; cv=fail; b=YyQegoXDXzutb7g5EJz7CE6byVosKbmC1v6wrlwY/KmeFqdYnWdWx4ktV2KfJHGXOViJuzwQHTW7kTC1CDQ6RvkhhNMKmw9aGkoN/QTKYg8MKvNGsyL1dtpe7mc6K5/tyBXhPpIbk76TPafcsxkcH4spOjt947fmPSj6ZNuDZhc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787226737; c=relaxed/simple;
	bh=7zZUqr1KSpj6oWySGIl4LQxA66DLR2+71+/2WY+BoDQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UlyfzbhyxxUsg9OnV29PeTcxvdPECCzTZwSNtnzPemJ3G0vPb1oIt4skeCIW1NYxl/mOZsYWfW+pBDVtgs1iA3SOsb71RYiWhKcKa31yIlTgRxwNMw1pcadT/MHpWwlI3QYi3xdFlv+PFxqpJsTJwOG1zOrrBLwFz63e33PmagQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=dzgQ5Y2Z; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=OqNaG7sU; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="dzgQ5Y2Z";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="OqNaG7sU"
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 67K86LM63618797;
	Thu, 20 Aug 2026 06:51:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=Rg4UZ9EZP0YHHzYVjOjPF0N+ZVuKDgdw3fPYM6rw1
	I4=; b=dzgQ5Y2ZP/Vbu1rQp3YXpmtb6rGQaHvxI7r4kM8GZElA5RdFK+Zp+U844
	lqvlOsKlpe7wS1H6PUdL75/OsNiVVK44Lhl9J4ubG0tQ4zsxxSMY78UEeBR9PhTF
	Z3T+EbpUfDpsShrop+sQkWHrzVwoHnfp9j2rF2tF3DZXtJjOQuu3vbguw3GNdYpe
	KCxE2GooX/wtXu384Zn6w3z1Hg0FPO2uXE8XWC7Q/4r1OYYrwodpceFa75h/0GCD
	TkvqAVwygwsJIQc6jqxmirG98ZilSRnNXs+mPH5cVWsAi8QIau65yGDNwZ1RbYOx
	sDWbUHczqwwE9CioanQXlY8Y61uRw==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010052.outbound.protection.outlook.com [52.101.61.52])
	by m0384305.ppops.net (PPS) with ESMTPS id 4g5rtrtjcy-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 20 Aug 2026 06:51:53 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xuuaHzg/0McqBqbN9CfcmNTKgUp3OCeDqfGZcQxGRkdkJxZecRhfchiQOGw5tiidAF0gKjNy6FaaW/Qej20xgjtHKJYTYJ2oY2RAaQ6GvbVThlV9gUKCy4TihuKITJqEkUC7BQxdmvc4WdXoW/EZdG3t4jcQp5W5amEIl4myniydhIH9Rz9ne1V7LSS62m3lftvIK8X2HhE24DQa1xc0vm0+S4p8QeyyWz1sBs9WwK3CJui3wtJzHclVav0XrrQTYwNwL9We5/bYdsvTEsIJQJ+fWUNhFZCwA+wYUMR3D36s2i1+0n26j+tMb91SRwtwDw+ouJyLSkY7/j7ukyfR6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rg4UZ9EZP0YHHzYVjOjPF0N+ZVuKDgdw3fPYM6rw1I4=;
 b=DR3itn31R6vOj6IBObncpj8wVqS+316a2/+s3H4RFho5Whbpywqn/JTjO2H4B3UZ2gqNY32+cTFVfkSOHga3U9sviYjoV6y3IzPxT49D3zuug2ienpaY0zrPu0LhzjeRynRXWvGNP2kQW8YPGKpQRXyaGvvr53Ie0aCA/Jc9eacubbjzwGdWwus6Hzsh1FWRghUqPsvV/QgMMq6SU4yA+bqFy4jNnINpt6pdBq6V1R/R7My0fyBDNlqiR0d4g88bDK0VuoToVQQGHpCd+YxJJ48QNGHhBjoW/wRTKPpOsLMSXgbBiERTFseqVJtnwLwEJD0ch4/zOCiJ15RxZqmvPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=linux.dev smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rg4UZ9EZP0YHHzYVjOjPF0N+ZVuKDgdw3fPYM6rw1I4=;
 b=OqNaG7sUvAr0SVFb1rZiupm/mKB9UmJg+RGhVby/mF13bq5X4VCVN4x3NsXEYE1k8a+HeuU6QuSNLh/PPGSwGh4af/GaV8hBWMNw6UEsWHmpTk9NCiZ0tZlFS83nU7GKFkW/AKCbnBlzis+lIJCJxWLADWLQXqzOyOfOcZbGrto=
Received: from MN0P222CA0018.NAMP222.PROD.OUTLOOK.COM (2603:10b6:208:531::19)
 by SA1PR10MB5868.namprd10.prod.outlook.com (2603:10b6:806:231::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Thu, 20 Aug
 2026 11:51:50 +0000
Received: from MN1PEPF0000F0E5.namprd04.prod.outlook.com
 (2603:10b6:208:531:cafe::2d) by MN0P222CA0018.outlook.office365.com
 (2603:10b6:208:531::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.9 via Frontend Transport; Thu, 20
 Aug 2026 11:51:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 MN1PEPF0000F0E5.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.3 via Frontend Transport; Thu, 20 Aug 2026 11:51:48 +0000
Received: from DFLE202.ent.ti.com (10.64.6.60) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 20 Aug
 2026 06:51:47 -0500
Received: from DFLE207.ent.ti.com (10.64.6.65) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 20 Aug
 2026 06:51:47 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 20 Aug 2026 06:51:47 -0500
Received: from LTPW0EX92E.dhcp.ti.com (ltpw0ex92e.dhcp.ti.com [10.82.30.14])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67KBpNeb065128;
	Thu, 20 Aug 2026 06:51:41 -0500
From: Niranjan H Y <niranjan.hy@ti.com>
To: <linux-sound@vger.kernel.org>
CC: <linux-kernel@vger.kernel.org>, <broonie@kernel.org>,
        <ckeepax@opensource.cirrus.com>, <lgirdwood@gmail.com>,
        <perex@perex.cz>, <tiwai@suse.com>, <cezary.rojewski@intel.com>,
        <peter.ujfalusi@linux.intel.com>, <yung-chuan.liao@linux.intel.com>,
        <kai.vehmanen@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
        <baojun.xu@ti.com>, <shenghao-ding@ti.com>, <sandeepk@ti.com>,
        <v-hampiholi@ti.com>, Niranjan H Y <niranjan.hy@ti.com>
Subject: [PATCH v2 3/3] ASoC: tac5xx2-sdw: update default regmap registers
Date: Thu, 20 Aug 2026 17:21:14 +0530
Message-ID: <20260820115114.1203-3-niranjan.hy@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
In-Reply-To: <20260820115114.1203-1-niranjan.hy@ti.com>
References: <20260820115114.1203-1-niranjan.hy@ti.com>
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
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E5:EE_|SA1PR10MB5868:EE_
X-MS-Office365-Filtering-Correlation-Id: 0917d1ab-0a63-4ba0-1689-08defeb16aa1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|7416014|1800799024|376014|23010399003|82310400026|13003099007|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	7SD9+v7k6J1aABPyArawspvvUVC0DKFOlRpomDR3UHneOSguAyEWuy9lrhmJXZx7NxBRj7CFJbvi+327IOofMVfyPQ7eGeQI9zQ6PZr1IhCXYvKMP2IjHOrkTcLmrWn/1+2VL23TdhE/fB2H36fgPudDNhNCQ+fubv7MQ4Ipi4j7bFm0xw8QrZxXz7vlNyFnRAqec5MEtukCHrANSE564tL3vk5HFSxqmRQ7P/fQNpPdzdp4KwlQ8V8GqjWsGfwHW4Q4whjCDANe5edonKmUOyQHVylEdlW/H5l6dhyzQ7augxaCmtVEJ7Q9uPXPRNv+pPUn0P1eYxvjeQBBlOmDdwA5Z2DMmhyilkLKFzrB5u8Y366BfFWdtWaopGHxe9Fa0IjSuqYgYhxNGs0apPOyX1T4GkzNhYTnDJqndMiTBSnh2yssr4jrhi6yV0PdkHBAB0eo3aI9qHUsZldN+SYNPlH76Knd2Zm0dSx6gPRES6L1yKfQUwPzyvKVZAzuF/dXADwHfPQQqIVJw3Kyg2+pZy06w7LAMKF++8YL7KIxt26690i553PHkKIK1G3no1X6lff4wDAN8UIT3IEgosZKDKB9JLsH88S3AV4Po1jkcepOOGmppk17vHwiaoVXdZMSES2BCMRD9tdqDobZ9y+4IECLHSDFMbmjx+1TEfMNfivd95E5eAj00zMdrAL//9YxVhRtv5qzGJUDjgCYgA/CVA==
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(7416014)(1800799024)(376014)(23010399003)(82310400026)(13003099007)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	dSt54idqxNzot/NyHbhgh6M3inJ/hu24aqaDbtpFgcOI2D7/plngXIo6ZhkSQS7YWeid6cetT3Nr8UR1QSXuYgpZ2pWyanl5Qi2xTwzhuhPHuvJ2g/ZTmdMfbDyZ9KNnL9p3jWzlBm4qIY3tne+bpMdok48nunkGCuedqHAudX/BsQhI83IERJfX5Jw1lUFG5B6csgbFG2Qo75CcYG5HI352OCDUHdtDMHkEWY6ghQCpOVQdzvsLXOIJb3JLzuHNLvBRSHFle6WMOYthrSRyLSRxg2KWmEjnXP6KMFsP9RnTfv6jmscWkxi8yj1H2ucOiYXcKw++Lp51kX6IdSIuj9vF1JuSYHn1ql6GFaSxOm5Y3zu8Ax0wTh29sJFrKpnH01miMsJ13p1S5GsyArngsNXau7MTP9akewRe/Iw7DdfaRSUCMgs7MnRu1d1IR73D
X-Exchange-RoutingPolicyChecked:
	BJ7Epm70uZJI/BioXEM3S/KlWK9U+dPFowi/JWtjMeZ/YJ6vv/FO57/Vged34yqGgbwhyguSdSGHLDk08afMbQyOJCxu+pEz5CdfshwmrWUpI5pxC4vnqtcJH7jE3VA41dKO7s525w4PUk9mYXZsZ8XJmrlt22kRKyXypdj4+MkZ3ECPsUPsAV9LQFyIov37dbpNe3H8UxdumMgzxo+Y+tzyktH1+4kgo+CYFKBFfJdeYPwm99KR7OWVEoZvqHHs5/XDNFS7GBzOLmglxyD8NM1j35tmoyx0YJviMLMdelfG+JmWlBGKvpUgE5Ox9a3thjQV24zHih5Vcy4GC9SMeg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2026 11:51:48.3524
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0917d1ab-0a63-4ba0-1689-08defeb16aa1
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000F0E5.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB5868
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDA4OCBTYWx0ZWRfXwpGjhaq/yQMt
 lJ2fQs+7a7IInQf0UcFqF+xHOiJusAxPiIfPSb8f/OOI70b711hibhri2tAmbIrD/ap0U0gbTI1
 BwSd+WQUdd2c9IR8CNJeDVWg08xMLkQ=
X-Proofpoint-GUID: MJxiDXxG3XykXLpv1xXEJl6lvJIHtTrS
X-Authority-Analysis: v=2.4 cv=KO5qylFo c=1 sm=1 tr=0 ts=6a86ea59 cx=c_pps
 a=pHHu7wMuQGD1ykZ6zahrcA==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22
 a=VwQbUJbxAAAA:8 a=sozttTNsAAAA:8 a=Q2avRLlBGY4x7LqXtVYA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDA4OCBTYWx0ZWRfX0PqSaBq5yXvR
 tSwcbnVpP5i1XtMlwd2PnTun+T/0JkZ2AgFNZZ+aLl0hDG30/MiChHs0aB1Vcq8/3uvBh21wNCq
 sp9NcE9gzIeuYacQX+zt0byXv785VBXyfJmOXMDAFt6z8dEotV3UTMyTF0x3w0hUO5cjJ+Qt8qS
 D58H8GENMXMjl8hN+0YYVCHaRHcEf2A/xNFPx2EgsOPdw7T82yrpcHJAzJZDFS3GUj2UQUfQogC
 3SmfWonlenJsIPIV42OXrbyeD284oVbDyrMmCyR9qOEgoVeRQ5/K/SQGsR8HSsPGsFadhYtnwpd
 LQlQpasCxaWfvbM2AywtftcpqyoggIOXrPNwAOl1jxkIWxGegHqPJHSgTe5HX3ooaiv2F2+weH2
 dtFCTCNvvIE07BeYexmiqRA5KN7O+lrk13vuKrn4B6bb8rbIqEmUHyyRRiDtcWOjIP+cdHrAViK
 GBz5x3/vTYmzRvb4IqA==
X-Proofpoint-ORIG-GUID: MJxiDXxG3XykXLpv1xXEJl6lvJIHtTrS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 clxscore=1015 phishscore=0 suspectscore=0
 adultscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200088

* At boot time, when the registers are accessed by asoc
layer while trying to enable a DAPM path, while the device
is still being attached, -EBUSY error will be thown by
regmap_read and regmap_udpate_bits. Because the regmap will
be in cache only mode. Add default values for these registers
so that, the cached values are returned instead of error.
* Also remove writing default values once again for first
attach.

Signed-off-by: Niranjan H Y <niranjan.hy@ti.com>
---
Changes in V2:
- sorted the default registers
- original patch:
   https://lore.kernel.org/linux-sound/20260819053427.2277-1-niranjan.hy@ti.com/
---
 sound/soc/codecs/tac5xx2-sdw.c | 88 ++++++++++++++++++----------------
 1 file changed, 46 insertions(+), 42 deletions(-)

diff --git a/sound/soc/codecs/tac5xx2-sdw.c b/sound/soc/codecs/tac5xx2-sdw.c
index 065e7d456..a5f654cde 100644
--- a/sound/soc/codecs/tac5xx2-sdw.c
+++ b/sound/soc/codecs/tac5xx2-sdw.c
@@ -55,6 +55,12 @@
 #define TAC_XU_BYPASS_REG(func, xu)                        \
 	SDW_SDCA_CTL(TAC_FUNCTION_ID_##func, TAC_SDCA_ENT_##xu, \
 			TAC_SDCA_CTL_XU_BYPASS, 0)
+#define TAC_VOLUME_REG(func, fu, ch) \
+	SDW_SDCA_CTL(TAC_FUNCTION_ID_##func, TAC_SDCA_ENT_##fu, \
+		     TAC_SDCA_CHANNEL_VOLUME, TAC_CHANNEL_##ch)
+#define TAC_GAIN_REG(func, fu, ch) \
+	SDW_SDCA_CTL(TAC_FUNCTION_ID_##func, TAC_SDCA_ENT_##fu, \
+		     TAC_SDCA_CHANNEL_GAIN, TAC_CHANNEL_##ch)
 
 /* mute registers */
 #define FU21_L_MUTE_REG  TAC_MUTE_REG(SA, FU21, LEFT)
@@ -381,6 +387,46 @@ static const struct reg_default tac_reg_default[] = {
 	{TAC_REG_SDW(0, 1, 0x71), 0x5},
 	{TAC_REG_SDW(0, 1, 0x72), 0x6},
 	{TAC_REG_SDW(0, 1, 0x73), 0x7},
+	/* SA */
+	{TAC_MUTE_REG(SA, FU21, LEFT), 0x1},
+	{TAC_MUTE_REG(SA, FU21, RIGHT), 0x1},
+	{TAC_VOLUME_REG(SA, FU21, LEFT), 0x9c00},
+	{TAC_VOLUME_REG(SA, FU21, RIGHT), 0x9c00},
+	{TAC_MUTE_REG(SA, FU23, LEFT), 0x1},
+	{TAC_MUTE_REG(SA, FU23, RIGHT), 0x1},
+	{TAC_GAIN_REG(SA, FU23, LEFT), 0x0},
+	{TAC_GAIN_REG(SA, FU23, RIGHT), 0x0},
+	/* SM */
+	{TAC_USAGE_REG(SM, IT11), 0x0},
+	{TAC_USAGE_REG(SM, OT113), 0x0},
+	{TAC_MUTE_REG(SM, FU113, LEFT), 0x1},
+	{TAC_MUTE_REG(SM, FU113, RIGHT), 0x1},
+	{TAC_GAIN_REG(SM, FU113, LEFT), 0x0},
+	{TAC_GAIN_REG(SM, FU113, RIGHT), 0x0},
+	{TAC_MUTE_REG(SM, FU11,  LEFT), 0x1},
+	{TAC_MUTE_REG(SM, FU11,  RIGHT), 0x1},
+	{TAC_GAIN_REG(SM, FU11,  LEFT), 0x0},
+	{TAC_GAIN_REG(SM, FU11,  RIGHT), 0x0},
+	{TAC_XU_BYPASS_REG(SM, XU12), 0x1},
+	{SDW_SDCA_CTL(TAC_FUNCTION_ID_SM, TAC_SDCA_ENT_CS113,
+		      TAC_SDCA_CTL_CS_SAMP_RATE_IDX, 0), 0x0},
+	/* UAJ */
+	{TAC_USAGE_REG(UAJ, IT33), 0x0},
+	{TAC_USAGE_REG(UAJ, IT41), 0x0},
+	{TAC_USAGE_REG(UAJ, OT36), 0x0},
+	{TAC_USAGE_REG(UAJ, OT45), 0x0},
+	{TAC_MUTE_REG(UAJ, FU41, LEFT), 0x1},
+	{TAC_MUTE_REG(UAJ, FU41, RIGHT), 0x1},
+	{TAC_VOLUME_REG(UAJ, FU41, LEFT), 0x0},
+	{TAC_VOLUME_REG(UAJ, FU41, RIGHT), 0x0},
+	{TAC_MUTE_REG(UAJ, FU36, RIGHT), 0x1},
+	{SDW_SDCA_CTL(TAC_FUNCTION_ID_UAJ, TAC_SDCA_ENT_FU36,
+		      TAC_SDCA_CHANNEL_VOLUME, TAC_JACK_MONO_CS), 0x0},
+	{TAC_XU_BYPASS_REG(UAJ, XU42), 0x0},
+	{SDW_SDCA_CTL(TAC_FUNCTION_ID_UAJ, TAC_SDCA_ENT_CS36,
+		      TAC_SDCA_CTL_CS_SAMP_RATE_IDX, 0), 0x0},
+	{SDW_SDCA_CTL(TAC_FUNCTION_ID_UAJ, TAC_SDCA_ENT_CS41,
+		      TAC_SDCA_CTL_CS_SAMP_RATE_IDX, 0), 0x0},
 };
 
 static const struct reg_sequence tac_spk_seq[] = {
@@ -388,30 +434,6 @@ static const struct reg_sequence tac_spk_seq[] = {
 			      TAC_SDCA_CHANNEL_VOLUME, TAC_CHANNEL_LEFT), 0),
 	REG_SEQ0(SDW_SDCA_CTL(TAC_FUNCTION_ID_SA, TAC_SDCA_ENT_FU21,
 			      TAC_SDCA_CHANNEL_VOLUME, TAC_CHANNEL_RIGHT), 0),
-	REG_SEQ0(SDW_SDCA_CTL(TAC_FUNCTION_ID_SA, TAC_SDCA_ENT_FU23,
-			      TAC_SDCA_CHANNEL_VOLUME, TAC_CHANNEL_LEFT), 0),
-	REG_SEQ0(SDW_SDCA_CTL(TAC_FUNCTION_ID_SA, TAC_SDCA_ENT_FU23,
-			      TAC_SDCA_CHANNEL_VOLUME, TAC_CHANNEL_RIGHT), 0),
-};
-
-static const struct reg_sequence tac_sm_seq[] = {
-	REG_SEQ0(SDW_SDCA_CTL(TAC_FUNCTION_ID_SM, TAC_SDCA_ENT_FU113,
-			      TAC_SDCA_CHANNEL_VOLUME, TAC_CHANNEL_LEFT), 0),
-	REG_SEQ0(SDW_SDCA_CTL(TAC_FUNCTION_ID_SM, TAC_SDCA_ENT_FU113,
-			      TAC_SDCA_CHANNEL_VOLUME, TAC_CHANNEL_RIGHT), 0),
-	REG_SEQ0(SDW_SDCA_CTL(TAC_FUNCTION_ID_SM, TAC_SDCA_ENT_FU11,
-			      TAC_SDCA_CHANNEL_VOLUME, TAC_CHANNEL_LEFT), 0),
-	REG_SEQ0(SDW_SDCA_CTL(TAC_FUNCTION_ID_SM, TAC_SDCA_ENT_FU11,
-			      TAC_SDCA_CHANNEL_VOLUME, TAC_CHANNEL_RIGHT), 0),
-};
-
-static const struct reg_sequence tac_uaj_seq[] = {
-	REG_SEQ0(SDW_SDCA_CTL(TAC_FUNCTION_ID_UAJ, TAC_SDCA_ENT_FU41,
-			      TAC_SDCA_CHANNEL_VOLUME, TAC_CHANNEL_LEFT), 0),
-	REG_SEQ0(SDW_SDCA_CTL(TAC_FUNCTION_ID_UAJ, TAC_SDCA_ENT_FU41,
-			      TAC_SDCA_CHANNEL_VOLUME, TAC_CHANNEL_RIGHT), 0),
-	REG_SEQ0(SDW_SDCA_CTL(TAC_FUNCTION_ID_UAJ, TAC_SDCA_ENT_FU36,
-			      TAC_SDCA_CHANNEL_VOLUME, TAC_JACK_MONO_CS), 0),
 };
 
 static bool tac_volatile_reg(struct device *dev, unsigned int reg)
@@ -1761,16 +1783,6 @@ static int tac_io_init(struct device *dev, struct sdw_slave *slave, bool first)
 			goto io_init_err;
 		}
 		dev_dbg(dev, "smartmic init done\n");
-
-		if (first) {
-			ret = regmap_multi_reg_write(tac_dev->regmap, tac_sm_seq,
-						     ARRAY_SIZE(tac_sm_seq));
-			if (ret) {
-				dev_err(tac_dev->dev,
-					"init writes failed, err=%d", ret);
-				goto io_init_err;
-			}
-		}
 	}
 
 	if (tac_dev->uaj_func_data) {
@@ -1783,14 +1795,6 @@ static int tac_io_init(struct device *dev, struct sdw_slave *slave, bool first)
 		dev_dbg(dev, "uaj init done\n");
 
 		if (first) {
-			ret = regmap_multi_reg_write(tac_dev->regmap, tac_uaj_seq,
-						     ARRAY_SIZE(tac_uaj_seq));
-			if (ret) {
-				dev_err(tac_dev->dev,
-					"init writes failed, err=%d", ret);
-				goto io_init_err;
-			}
-
 			if (tac_dev->hs_jack) {
 				ret = tac5xx2_jack_init(tac_dev);
 				if (ret) {
-- 
2.53.0

