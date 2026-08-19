Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E75CF27A47F;
	Wed, 19 Aug 2026 05:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787117719; cv=fail; b=jNOPowJF6fB8GXuJJeWOpngFgB39CfuAGOhWgCaLjGrtCLMkdkzej8fOsa/IxJf3s89QfVtJc/HormzwYwFWQKAbF2aqExxOyr+7fDPrhn5e1zq6t34OWYruffXPkxLf+GRXidv/X0lXey7qFZ+hH/+ieFdgevC2IHyZPBq6lk4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787117719; c=relaxed/simple;
	bh=2zS7D8Xj0o50pmQAzMXaKMV0NWUUE2+f2J3sMEuCtGc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=MQQ1hgDOrsYBDwO3k/YvEYHAzH652eOzb9BB5AAXHOX/AMcfkoPE3zshAOLP3Pta2TjLfuwOUQw/fENSgLq64KrkgbWbrA2Brhksxga123hJeGihamgmunqBye1/GhamKIpFadA81YxI+XAIaH3cNfAVhLdaOjdDDqWtbsF6mvM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=Phww7xWc; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=An7D5JmT; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="Phww7xWc";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="An7D5JmT"
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 67J2ix5J1150299;
	Wed, 19 Aug 2026 00:34:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=jS2W/XKxuDalP
	ZZDupcejB7bv2v0oIWzt5bbyGa23SM=; b=Phww7xWcLvx4rAYWwQvkMLUmFso+F
	mQpAoc9HSkPnrmpHn+coYg4+TQucMmusagax7OH8/hRpuKpTFhue39NCI68QziDL
	0whLlbGQxBme8heJAU1LgUhNaq01xPEVjl1xE9WnZjJudun0zYTZWbuHqPTvNBS8
	f6iVHSVvJViILOyVJsRJzSKhFnVGoVzYPcB/9EpW7ZV2yDoxdXrYy4Sl2Hc47w6Q
	A86osKrn2eZ7ljDNGGrkd8rrE4eOScR+ZDCz18A2XTeK2Uk+ekhM3CrHOPsECtLH
	sA1koSJZTJvG/AtgM75OQ6uV+V4lUOAbh4U5Q6ULnZrwjocA3wl6M52HQ==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012049.outbound.protection.outlook.com [40.107.200.49])
	by m0380145.ppops.net (PPS) with ESMTPS id 4g4yejjbxa-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 19 Aug 2026 00:34:49 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jhtwEd4O6C3KveAJ9x8D5vEp9Y9yJ0WatkKKElpwTHMhmnfkWWZ9/aFQe6gjCtYdLKVWs8wNjPg7QExW5gq/AceHe7w66713L8mz4PYg6HaXPHaRQVtarO12R5A2FX5BQsTp/GycB8sqkwz6LaI41m+OLsVErP78RNJ9kxMvtOzULdLMiT3hbOeZiEXHGXM/hidrJ7W/mjsoPQPWdygSa1BiliA0aDEYr9HtMStoUMrYe0BW+2YmSeHSPNxxqvuS+VoP4Hw/mEq8eCR7kWjpBSEqij/lVKHJVXdU5dx/O/7hD/L7KtN25cDR/OUaZzmMEGAwPOKr0Cy7a+NXIiqNLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jS2W/XKxuDalPZZDupcejB7bv2v0oIWzt5bbyGa23SM=;
 b=qxzWj8n8njeuhCtj86DW0ZzDAU815BRrbGb2R6wsApIxSn3JukkXul2QrdzaKx8rCkro3R/1Lzz5wH/8tAVVQbDZsWqmJwLIQNE0IgVa27figon2Xt7Lg1lQK9rxAjxmuhWVwICwc2NNTfEdVOrf0tv/tlrmr7mxI+ykcE0HP+QudfdJkF2jSiL1SNE2Tn14flzYJj2tVfewExHoBnRiY26rgjp460HbxkwOCWYaOz0rApyw8Qrz8VXp8gRuSoDgD58oR5ZuNJOs/U635ImtvTKVD+0xX607u/cuGPJWHn/aTakGbjlLyY8rFXHpZXbNT7a80d+N2AdHQZhWwkDNfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=linux.dev smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jS2W/XKxuDalPZZDupcejB7bv2v0oIWzt5bbyGa23SM=;
 b=An7D5JmTXlM4pExzq7jJQ5pB/fYIvE7Jme+KcljaXMRh6o++paRp0iAqaEWA6sIEmyQoiunszn9l+qPu5gostYkdyOaBdqhTU/t0+8WF/c9XWmCBsQ2Gp1WR3h6h5iK6+RC9f+fFnOBFeYe60SrvM0nQ3+5e9In+48JbjlX51yQ=
Received: from SJ0PR13CA0236.namprd13.prod.outlook.com (2603:10b6:a03:2c1::31)
 by CH0PR10MB7437.namprd10.prod.outlook.com (2603:10b6:610:193::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Wed, 19 Aug
 2026 05:34:43 +0000
Received: from SJ1PEPF00002311.namprd03.prod.outlook.com
 (2603:10b6:a03:2c1:cafe::89) by SJ0PR13CA0236.outlook.office365.com
 (2603:10b6:a03:2c1::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.8 via Frontend Transport; Wed, 19
 Aug 2026 05:34:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ1PEPF00002311.mail.protection.outlook.com (10.167.242.165) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.3 via Frontend Transport; Wed, 19 Aug 2026 05:34:42 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 19 Aug
 2026 00:34:41 -0500
Received: from DLEE211.ent.ti.com (157.170.170.113) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 19 Aug
 2026 00:34:41 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 19 Aug 2026 00:34:41 -0500
Received: from LTPW0EX92E.dhcp.ti.com (ltpw0ex92e.dhcp.ti.com [10.82.30.14])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67J5YYn62784631;
	Wed, 19 Aug 2026 00:34:35 -0500
From: Niranjan H Y <niranjan.hy@ti.com>
To: <linux-sound@vger.kernel.org>
CC: <linux-kernel@vger.kernel.org>, <broonie@kernel.org>,
        <ckeepax@opensource.cirrus.com>, <lgirdwood@gmail.com>,
        <perex@perex.cz>, <tiwai@suse.com>, <cezary.rojewski@intel.com>,
        <peter.ujfalusi@linux.intel.com>, <yung-chuan.liao@linux.intel.com>,
        <kai.vehmanen@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
        <baojun.xu@ti.com>, <shenghao-ding@ti.com>, <sandeepk@ti.com>,
        <v-hampiholi@ti.com>, Niranjan H Y <niranjan.hy@ti.com>
Subject: [PATCH v1 1/2] ASoC: tac5xx2-sdw: update default regmap registers
Date: Wed, 19 Aug 2026 11:04:26 +0530
Message-ID: <20260819053427.2277-1-niranjan.hy@ti.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002311:EE_|CH0PR10MB7437:EE_
X-MS-Office365-Filtering-Correlation-Id: e66a3569-00db-4125-1cd9-08defdb39218
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|23010399003|82310400026|36860700016|56012099006|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	SAw6LKdjPvFMgHHc7OIbpc16vxuNWdIKrQwa/OHVnUBBBWevUji2rRwMDgR2C7jxVlxHdorz0LYRGUVL42XN3F1djfhSyROu4LU7JBKPPA/1Q5Fm0VQoo6a9K6Zs1HDAvhlDCGHIw6WIFOdQMbFlmpp6jVzq07F2sAcDJ5+kxMVO5zci6BneaZwI29HUqEV6IT1rNg5rbG+9wzZjkHOA79Cjzl9TnUbE6FOr/Od6DWCFwRl6rK2FlUmaJCZeJO10LewVJcG3OGd00Iud/LlPDJArsIc3MtYq0aqBRGtGv5yPEzTCIVqD/VsWBzL/UhzrNxWUjn5bODeY38lkKj6kN1LqJW+6TXhEFkoE8eLJ5pvi3Rk0+dD29cywrvGESKa9QrAvkN2E/SiADKfigofqXm3OFXC3+u055dDL7ri+1YDDZtSAF/wYJSz3F1Rdq3kbKCtDb8+o9ph0dlXw7qYANONFefCh9PLAzth11fHYwTVdt4/RbEnW1atgRm2XyEt2BrNnIsersZReyq+Oygcl/QUl6tqQjn9xfYHtN9lXJQpRu5Sl3BjsOVQLNpoaFIOEqS3RSgrEcb9rWyFb/x96pCejhbc8pLYzZ9Czl8gVIY56gEdauVbEbpwdukJLkJ5jhUbywQfrsilwkKRc3FTbd9Z5zaXoSKy0cBN6OI7nbQZjkOgcEjnZsv6Avy56V4dIoCL4AetvNsyXgnNYFLIgvA==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(23010399003)(82310400026)(36860700016)(56012099006)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	zB8OggZt6zgH1XNj4gKEHpqLemxBw/Z1xMEamkYt23rzGzGoFZGeTlqCv/vhwcUnzHjruhDnBgYYmVV0UGfWBXRLmU/sEJ04aLsXna9RBhyLWmF44yOQuLI5HqgMptzECY67GaXNY9qUO07hSa3VGytODezOdIAaoqMRG94ra7sQF+ZOpPgSwRwIRQyUB5E+ySaUDl3Rs2qgMfArpsvxAzE14b962L0b0cDb+bH7MvoU8w30xVZDn9mcXBb7ye2h1p5bzSfq46HepDt8wZ8Eh0F6xlGuEUtNbbdnYpSJM1Jx87GUw58d+AYgcxzXssHGt3VAxrG3tsW1zJrnFDyMcXga0CJqFpE7D70MPzgB809Wne3CV5L2uS/80gIYWvKvq9HZBrSR8uT2tYLG5ej+9Iez1PVZgpdxD/hCXag6vGB34542izGV80Y33WGoLhxB
X-Exchange-RoutingPolicyChecked:
	g7IZEL/4s3Hj7EUZzOwF4O2NDueowdqJ896XxhwDznYiAA4HhQpNA257iEbLAJ12AzixX9a8kxVFNTajeG64asSIOs6Qk92L2eUOYU00baKkKWMWrBFRSxau/os+4gGdBzsoaUMAJWxervOGqfaQN1SvhetktfPXAGnBXNaRRgiejXCuTht5z9IMOAyq5ZbbVEP5nvLZcJ4XsK1A/wOCYI5OGUwU7dk7iFTzKGXgysnxyO7dopbXj24a6uxu7EFsZecu5nCVBj25Hms9atsBO2l6SZIsddImIbOy8OOjdclQVRtIUX5NPG+ZZGmX5TjKn9IfirI0yibrz8itCZhZXQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2026 05:34:42.3848
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e66a3569-00db-4125-1cd9-08defdb39218
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002311.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB7437
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDA0MCBTYWx0ZWRfX4++LtZcCaAVd
 exH+5HHiy5YXO+aAMzyeapng4W6ydct0vCYnnu1iBM0xmWaotRG1UAHYaj2r1xO0suatunnaYsz
 FFdA1CnFuNI5X5iwNKNIp2LEFSY2rLA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDA0MCBTYWx0ZWRfXwsjzyEYl5urh
 xj05zqUgDVmrHKPYA6sRPrPp7QCDI9ybBuVGO1YLC9icFl6TlGl8IeKB9mEKYfXJ9+3V15bqVZ3
 pzBUNJbCAO84HMwd80g/S8X8vmzDu8PDFcjPtXIPlk4CfMBxRloxg51FaRrnKQVc0+N5xsd1ygs
 dSJ1hweWQmxiLe9Kdezjxkoy9uqpdDBg4PfAtH+3thLtYRRFTq3QedOABZiKNH4TdtBeqTn2TJc
 MJt9HL0VSyhkuq1awwFAr3Yw4fnBpXdJlpXnkr12yIpoVhaGyhSMByJbfOmACpNdJBUr8BKTzro
 7bxHQZ646XrO7/6ws6w35hOWI6Imhf7AWAsG/8r7szSzp+d7K4BlhVIqVSkceshcu588Dk5Urb1
 S3h+oj4eZlP232QxwSJovPoAUjOuDhGYS6yd3DAzzfIueoDa7UanCCjo/Z7RrVF/7b5EOyL3EAp
 NQHCt4H1SYuZ9AjD0+w==
X-Authority-Analysis: v=2.4 cv=PbLPQChd c=1 sm=1 tr=0 ts=6a854079 cx=c_pps
 a=cexuP6Tr12ZHfMaaS00NHg==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=sozttTNsAAAA:8 a=Q2avRLlBGY4x7LqXtVYA:9
X-Proofpoint-GUID: WhjMbBj5oteFXYbfrRBe3mIuEiMINzoo
X-Proofpoint-ORIG-GUID: WhjMbBj5oteFXYbfrRBe3mIuEiMINzoo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_01,2026-08-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608190040

 At boot time, when the registers are accessed by asoc
layer while trying to enable a DAPM path, while the device
is still being attached, -EBUSY error will be thown by
regmap_read and regmap_udpate_bits. Because the regmap will
be in cache only mode. Add default values for these registers
so that, the cached values are returned instead of error.
Also drop the unwanted register writes with default values.

Signed-off-by: Niranjan H Y <niranjan.hy@ti.com>
---
 sound/soc/codecs/tac5xx2-sdw.c | 88 ++++++++++++++++++----------------
 1 file changed, 46 insertions(+), 42 deletions(-)

diff --git a/sound/soc/codecs/tac5xx2-sdw.c b/sound/soc/codecs/tac5xx2-sdw.c
index c062065a8..6bcba22e5 100644
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
+		     TAC_SDCA_MASTER_GAIN, TAC_CHANNEL_##ch)
 
 /* mute registers */
 #define FU21_L_MUTE_REG  TAC_MUTE_REG(SA, FU21, LEFT)
@@ -381,6 +387,46 @@ static const struct reg_default tac_reg_default[] = {
 	{TAC_REG_SDW(0, 1, 0x71), 0x5},
 	{TAC_REG_SDW(0, 1, 0x72), 0x6},
 	{TAC_REG_SDW(0, 1, 0x73), 0x7},
+	/* SA */
+	{TAC_VOLUME_REG(SA, FU21, LEFT),  0x9c00},
+	{TAC_VOLUME_REG(SA, FU21, RIGHT), 0x9c00},
+	{TAC_GAIN_REG(SA, FU23, LEFT),  0x0},
+	{TAC_GAIN_REG(SA, FU23, RIGHT), 0x0},
+	{TAC_MUTE_REG(SA, FU21, LEFT),  0x1},
+	{TAC_MUTE_REG(SA, FU21, RIGHT), 0x1},
+	{TAC_MUTE_REG(SA, FU23, LEFT),  0x1},
+	{TAC_MUTE_REG(SA, FU23, RIGHT), 0x1},
+	/* SM */
+	{TAC_GAIN_REG(SM, FU11,  LEFT),  0x0},
+	{TAC_GAIN_REG(SM, FU11,  RIGHT), 0x0},
+	{TAC_GAIN_REG(SM, FU113, LEFT),  0x0},
+	{TAC_GAIN_REG(SM, FU113, RIGHT), 0x0},
+	{SDW_SDCA_CTL(TAC_FUNCTION_ID_SM, TAC_SDCA_ENT_CS113,
+		      TAC_SDCA_CTL_CS_SAMP_RATE_IDX, 0), 0x0},
+	{TAC_USAGE_REG(SM, IT11),        0x0},
+	{TAC_MUTE_REG(SM, FU11,  LEFT),  0x1},
+	{TAC_MUTE_REG(SM, FU11,  RIGHT), 0x1},
+	{TAC_XU_BYPASS_REG(SM, XU12),    0x1},
+	{TAC_MUTE_REG(SM, FU113, LEFT),  0x1},
+	{TAC_MUTE_REG(SM, FU113, RIGHT), 0x1},
+	{TAC_USAGE_REG(SM, OT113),       0x0},
+	/* UAJ */
+	{TAC_VOLUME_REG(UAJ, FU41, LEFT),  0x0},
+	{TAC_VOLUME_REG(UAJ, FU41, RIGHT), 0x0},
+	{SDW_SDCA_CTL(TAC_FUNCTION_ID_UAJ, TAC_SDCA_ENT_FU36, TAC_SDCA_CHANNEL_VOLUME,
+		      TAC_JACK_MONO_CS), 0x0},
+	{SDW_SDCA_CTL(TAC_FUNCTION_ID_UAJ, TAC_SDCA_ENT_CS41, TAC_SDCA_CTL_CS_SAMP_RATE_IDX, 0),
+		      0x0},
+	{SDW_SDCA_CTL(TAC_FUNCTION_ID_UAJ, TAC_SDCA_ENT_CS36, TAC_SDCA_CTL_CS_SAMP_RATE_IDX, 0),
+		      0x0},
+	{TAC_USAGE_REG(UAJ, IT41),       0x0},
+	{TAC_MUTE_REG(UAJ, FU41, LEFT),  0x1},
+	{TAC_MUTE_REG(UAJ, FU41, RIGHT), 0x1},
+	{TAC_XU_BYPASS_REG(UAJ, XU42),   0x0},
+	{TAC_USAGE_REG(UAJ, OT45),       0x0},
+	{TAC_USAGE_REG(UAJ, IT33),       0x0},
+	{TAC_MUTE_REG(UAJ, FU36, RIGHT), 0x1},
+	{TAC_USAGE_REG(UAJ, OT36),       0x0},
 };
 
 static const struct reg_sequence tac_spk_seq[] = {
@@ -388,30 +434,6 @@ static const struct reg_sequence tac_spk_seq[] = {
 			      TAC_SDCA_CHANNEL_GAIN, TAC_CHANNEL_LEFT), 0),
 	REG_SEQ0(SDW_SDCA_CTL(TAC_FUNCTION_ID_SA, TAC_SDCA_ENT_FU21,
 			      TAC_SDCA_CHANNEL_GAIN, TAC_CHANNEL_RIGHT), 0),
-	REG_SEQ0(SDW_SDCA_CTL(TAC_FUNCTION_ID_SA, TAC_SDCA_ENT_FU23,
-			      TAC_SDCA_CHANNEL_GAIN, TAC_CHANNEL_LEFT), 0),
-	REG_SEQ0(SDW_SDCA_CTL(TAC_FUNCTION_ID_SA, TAC_SDCA_ENT_FU23,
-			      TAC_SDCA_CHANNEL_GAIN, TAC_CHANNEL_RIGHT), 0),
-};
-
-static const struct reg_sequence tac_sm_seq[] = {
-	REG_SEQ0(SDW_SDCA_CTL(TAC_FUNCTION_ID_SM, TAC_SDCA_ENT_FU113,
-			      TAC_SDCA_CHANNEL_GAIN, TAC_CHANNEL_LEFT), 0),
-	REG_SEQ0(SDW_SDCA_CTL(TAC_FUNCTION_ID_SM, TAC_SDCA_ENT_FU113,
-			      TAC_SDCA_CHANNEL_GAIN, TAC_CHANNEL_RIGHT), 0),
-	REG_SEQ0(SDW_SDCA_CTL(TAC_FUNCTION_ID_SM, TAC_SDCA_ENT_FU11,
-			      TAC_SDCA_CHANNEL_GAIN, TAC_CHANNEL_LEFT), 0),
-	REG_SEQ0(SDW_SDCA_CTL(TAC_FUNCTION_ID_SM, TAC_SDCA_ENT_FU11,
-			      TAC_SDCA_CHANNEL_GAIN, TAC_CHANNEL_RIGHT), 0),
-};
-
-static const struct reg_sequence tac_uaj_seq[] = {
-	REG_SEQ0(SDW_SDCA_CTL(TAC_FUNCTION_ID_UAJ, TAC_SDCA_ENT_FU41,
-			      TAC_SDCA_CHANNEL_GAIN, TAC_CHANNEL_LEFT), 0),
-	REG_SEQ0(SDW_SDCA_CTL(TAC_FUNCTION_ID_UAJ, TAC_SDCA_ENT_FU41,
-			      TAC_SDCA_CHANNEL_GAIN, TAC_CHANNEL_RIGHT), 0),
-	REG_SEQ0(SDW_SDCA_CTL(TAC_FUNCTION_ID_UAJ, TAC_SDCA_ENT_FU36,
-			      TAC_SDCA_CHANNEL_GAIN, TAC_JACK_MONO_CS), 0),
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
2.34.1

