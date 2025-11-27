Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D62C22D6E6C
	for <linux-sound@vger.kernel.org>; Thu, 27 Nov 2025 16:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764261297; cv=fail; b=PocCcFcJ56/Lz1bm3fMFWvNt+qNjC91CN+X8CWnmN4rn5rCRMculfPopXrqas1KMt8Gmk2cRfcspXG3Zs30ZwluWiAvuNWCmvFvF5a0LyHH+GzUe82BK2nd22Dl/MtIPnkKY8sextouvIfLrCsvaJQ4205n4YArkgOGQnGRseic=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764261297; c=relaxed/simple;
	bh=OvZJYuhq7w+Qh4h29WXyBMeOxP2DkLt8qIX3evYWIk4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Rgx8lx3pXlhEaoT3TygZmJyGGLeYbqQLGKo1VqEZ/phP+1k9CXvyn70ulDC8zhlAq+yUTEwLzTMCXs0g0/NGjSv/qI6Nvmag8rK/c8qRRXRTpVql5yHcbnasT7AS7/4aIO+KhhAH8Yvcrsdgilxu/KsjJZkC5JgtulFiGNvnTMs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=aUEST4rL; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=WnA53BkP; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="aUEST4rL";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="WnA53BkP"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AR60bEi181871;
	Thu, 27 Nov 2025 10:34:37 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=GenR2V44g1SaoGEXY6GL0VB2lTjJl6HBugYCfnbNucM=; b=
	aUEST4rLYeHJAvuW0phaJIW3edcvhDVnu/qxS/86D7gmLzkmHE0GLotnY1DEE8py
	w7am/uY/yyWFJUuGBNb9DZsxL84ZnZbnQHVjYGITsi5nwqgoEXwIgd0c9dckWAWy
	lSN/keJKui/5IOZpql9PKCsGUhwmce6WhM+Gf8WesTcf039PjZg/jWPAydfTEfGm
	XkcATg3FA4zd1PewnnLT3xszAhjmPMmwm3rtKG+85/aQ+KvVnFbWEkOyHGi7hPoD
	I+DqWCNnY4ysbaJQ/9wwpBb6vCEVECn5RNTCsqV1aJkaGb1THoMpPIYN1ZkgMIM4
	iqoySQBF5gu4gpI+gxzdRQ==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11023126.outbound.protection.outlook.com [40.93.201.126])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4anjw5jevc-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 27 Nov 2025 10:34:37 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eJORTUdLJbuXkKKxujyHk6CUp7LJjqRneBMvXr+X68i0FFVy96R2W3EDXLvFOAFbfuterXesO/ZUYAm6uvQmtcOT3Bla+UB2SuHkye9tcdMD6UdnTCqoGsojZoqaDBIVhnMoi0SU0/RYG5Sb/ucYggifsspp2ksjrKmUY2ZphwylDAnfg43esGnWjIe+j70oV+SmbePhXHNcAvoDZSnHULYsDOJ/7hrntmMdFjxv3Oc8iZ2b0EFU7MMP/g7R3SGZ8GlUL1YbtPMAkcd+lFhyKAReKqGbk89sNxH/8D5H7Efc/k98IFKM3b0M+gIUTMqUQh+NFmoVZg8TKowm0l4ysQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GenR2V44g1SaoGEXY6GL0VB2lTjJl6HBugYCfnbNucM=;
 b=Iqyi8qgqyoraheKBonxNdmn2rJ3fq2c3TM1Sx3yIjBA14md6el6G1GHtO8Ff4bHGpoOCrwjoKH46E+qVvYzN1OONMoiigO2djkjgKzIiDskZMY0ek0RX1hBWXNaFXT6DO3h8Lh0FZjgNVrNHNOUdxG7W6vqvOnv4Df5Igt95EsBF2dKW/9ZBAOylWpJ6+aUsYKk7ruqxQ6e7/sxEFHAkR+/LfTmKc+RWyF0dC9p3+FlQQfQwlNBuRVZGWL44eDgbUmyGhLDJIG/JbK2Rp61lSkPRTtdZ0alOLC0loGbH4uFprkW1qqDVHdPkk/SlFTIcCVuGvMhljrMfT4LTiULMbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GenR2V44g1SaoGEXY6GL0VB2lTjJl6HBugYCfnbNucM=;
 b=WnA53BkPk0JGDwbOHs64qnmy8WNmQvrt5348T2mvgBhi+7hiw0YffMxAeqn7Rj7mD4H7wIQWeNMSEEPu6bQCkGxZTPJgfCFUEb52jDoHNYFyNCJTOSX+B4vG2xcc657lxbmg3sw32ywbaXD+GFjmEmDXEqX4XmWgFE9ktyRXaYg=
Received: from CH0P223CA0027.NAMP223.PROD.OUTLOOK.COM (2603:10b6:610:116::17)
 by MW4PR19MB6578.namprd19.prod.outlook.com (2603:10b6:303:1e3::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.15; Thu, 27 Nov
 2025 16:34:32 +0000
Received: from CH2PEPF0000013E.namprd02.prod.outlook.com
 (2603:10b6:610:116:cafe::d6) by CH0P223CA0027.outlook.office365.com
 (2603:10b6:610:116::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.15 via Frontend Transport; Thu,
 27 Nov 2025 16:34:19 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH2PEPF0000013E.mail.protection.outlook.com (10.167.244.70) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.7
 via Frontend Transport; Thu, 27 Nov 2025 16:34:31 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 30B1E406544;
	Thu, 27 Nov 2025 16:34:30 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 0FC2482024D;
	Thu, 27 Nov 2025 16:34:30 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        lgirdwood@gmail.com, peter.ujfalusi@linux.intel.com,
        linux-sound@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH 2/7] ASoC: SDCA: Add terminal type into input/output widget name
Date: Thu, 27 Nov 2025 16:34:21 +0000
Message-ID: <20251127163426.2500633-3-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251127163426.2500633-1-ckeepax@opensource.cirrus.com>
References: <20251127163426.2500633-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013E:EE_|MW4PR19MB6578:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: d6816426-892c-48ec-9875-08de2dd2d7ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?nY4us6wxvIwWHDDTHO8Q6PlDWlnIocIpqBcBAR+bGfilGg5iM0moxL8vP8gn?=
 =?us-ascii?Q?papxjTmBYqE9JviM0wQ18kURfPWst6kv4uCnlTA34PBh6q68k5Wmdj3U+RwB?=
 =?us-ascii?Q?8B3Kn6Q2GgLm/W7dSr5yB5qX0Mh11S5wEBTJHaw4vbe3jTwM17CMaQ7lFETQ?=
 =?us-ascii?Q?1eNwOkzlL6XMzIsYOhgxd+Xz3++55JbXAoDKLUgo2TKuQ3kr7Fo8yfUYjZz7?=
 =?us-ascii?Q?yVCBGAlF71vQDjSWFR/TbL63i9Mt4WTyM27NAUDpQIQ8pLtRJSDk0yFMbJve?=
 =?us-ascii?Q?LxlXLIlL5sc7zAvq98exFTsZsuNV7KcFu/jhinMMtYZ85Zj6daFp8z9dHJra?=
 =?us-ascii?Q?WCKgsr93in41a8fCHgwJIH0LbQXvCRFdM8gTztvqgFZuZHxw6mB3tovpgqqb?=
 =?us-ascii?Q?HwCJx1s34JMAd+WRjpyqMwu00B+n7sxPWKo7j3ISMRqkmfkrWdQH48gG//Ix?=
 =?us-ascii?Q?KfAHFypHeYy18F9P7gUjWoTL/CVI0TXRjTOCSpVDW14ZZTRu885TsgN2Y/DU?=
 =?us-ascii?Q?20GMlqhTvOC3naQ+7R6QFgs2MoSHCkojjvGRpPWm9HwenwSJDzF3T7Prxinh?=
 =?us-ascii?Q?ywzU2keg4esKQwi5ZKEkBxNfU4uJWe8pC/D3qd0Bx3PVSld0SO0FegRKqOIW?=
 =?us-ascii?Q?jHTp1mjFX30xlIUvr9QfLTkbswRsmYnezrk+WAKnpDvITq3ewRjxYqjmz5Pe?=
 =?us-ascii?Q?T0mGIwA0V0y4SVToRyUDKGmZwhf/b6acEgtquVvvKeq4rmBzjzLKLFjHR6/D?=
 =?us-ascii?Q?SZWuuRwfM5feuj4Gw537Y8Cn/8kLlQa07P0KSsUV4q8euqPl018dlzI2LK9A?=
 =?us-ascii?Q?E7z7cIgELG3JW4ZZu8mIXgkmSsvbHd+7F2fb323CAtYk17nIrY8zzqjSdyAq?=
 =?us-ascii?Q?dt//cCu7OwY1rlF+aDe01eJ6h+CJlDqyyeqVLS7fbGaSLixGhrexeBEb9F2o?=
 =?us-ascii?Q?/ERbnMg2BAqOQ4W3xPX/q9V9Sk9yWk/29Bz0pSmXb/ieHV4q5jImfhunqzpi?=
 =?us-ascii?Q?T+2yheXGmdTaQ3GEO0YyAdZGEpWGJ81EFbZlBxTl62i3zMj8ETq1mlgzhlgc?=
 =?us-ascii?Q?dgyurdPgaq/3+Qy/GIL9PaH/gLhWyebXkR69ggAV+tTCKqWJTRxxMY+20FOJ?=
 =?us-ascii?Q?L3KbYuNbQIBCQQ+zDFXdZdnIQtgsOcpMxCCtC6Sg3CMVAiqBNSvuuz0JqIjx?=
 =?us-ascii?Q?2BJ4S40y1N/pi/buAtmfYtBmdKOVaP0Wyt5GTebLgO5+QNB/uxcn+W5m/DEf?=
 =?us-ascii?Q?y2jT9zO6KwnfHyBJzhPREvlYjTfXgV3p05M2pM2QDW1uehpLioYaMpvoXZ7e?=
 =?us-ascii?Q?dfj+RGzolf0TkhNJrccRvbpTyfHj9GIaCBBziGJ2GDWUg0jA+ErJ7i6fN0LN?=
 =?us-ascii?Q?NgAVO81gP0QSfYwztULI2Patw3TCzWwEvfqv3GkKe8kzpw3GNW4frSqXR2f3?=
 =?us-ascii?Q?RofiY4OH671admmX7JBcbB39V8Zz3AXdYex8JwBUyW8r8yD3msnRTo+8xIgs?=
 =?us-ascii?Q?tWL9wYKlUObfNzYzBBcLbBcEn2oi2I6QKc6nWTrqYxItY6AJ4f31MU8nRE2l?=
 =?us-ascii?Q?/R+1cFZsdKJXQoO/Pig=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2025 16:34:31.6367
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d6816426-892c-48ec-9875-08de2dd2d7ba
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH2PEPF0000013E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR19MB6578
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI3MDEyMyBTYWx0ZWRfX/3JBbNkI6mdq
 ffw/RqVc3B6PWQEYJgRgYLM0B80Nx1zxNO4ZE5nXCuJPenWHOd4sHdlsFKinC0n8oNihA5bb5+0
 sTea7X2BZ7L6aztKGiinSxolowBFjInAZmSNPMx5r78wdG3VXMUlASyr25wWp7I847INLsMXxcb
 HTMUMY7IYtESIwljGpZQhaWSN917uMjJV2yH/kb31PJmzc2+o0UgzOsckwj+UyDvRFK1MuQp6/U
 XeBAG9MlHQOewUfaxMr5vlYldfy5i6UkG6iU0Z+m3yAA0Frb1MMAmdlD6fal2P221tdS3Jj+P51
 FCdO+pP/whmg6wFnUY88bkPbkxAJWIxcGE8JL/dSiUgUC/Te7j6zXMcjPToRZo0PMTz5TcYf7Gq
 lwn+a8dcVkMmD1ICUcpbkyH39CHlSw==
X-Proofpoint-GUID: vidMaEe_0JWrbTdl18BMfeTjizGSUZ5D
X-Proofpoint-ORIG-GUID: vidMaEe_0JWrbTdl18BMfeTjizGSUZ5D
X-Authority-Analysis: v=2.4 cv=V4JwEOni c=1 sm=1 tr=0 ts=69287d9d cx=c_pps
 a=DIjkAsz29YVUvu3IkAIIcg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=6UeiqGixMTsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=w1d2syhTAAAA:8 a=gWklcw6WRvuabl4HOxAA:9
X-Proofpoint-Spam-Reason: safe

There have been some complaints around the UCM files for SDCA
devices that the control system is quite hard to follow. This is
definitely true without the specification handy the naming can be
a little cryptic. However, as most of the information is parsed
from DisCo there are some limits to what the driver can safely do
to improve this.

However, one area that can be improved is the non-streaming
input/output terminals. These have a field (enum sdca_terminal_type)
that describes the usage of that terminal. These types can be
appended to the entity name to give the users a better clue as
to the purpose. For example "OT 43", would now become "OT 43
Headphone". This would follow through into the jack controls which
would change from "OT 43 Jack" to "OT 43 Headphone Jack", making the
purpose much more obvious to the user.

This provides slightly more readable controls without relying on
implicit knowledge that individual parts might not conform to.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 include/sound/sdca_function.h   |  2 ++
 sound/soc/sdca/sdca_asoc.c      | 48 ++--------------------------
 sound/soc/sdca/sdca_functions.c | 56 ++++++++++++++++++++++++++++++++-
 3 files changed, 59 insertions(+), 47 deletions(-)

diff --git a/include/sound/sdca_function.h b/include/sound/sdca_function.h
index 2564fad33fd46..6e9391b3816c6 100644
--- a/include/sound/sdca_function.h
+++ b/include/sound/sdca_function.h
@@ -1456,6 +1456,8 @@ int sdca_parse_function(struct device *dev, struct sdw_slave *sdw,
 			struct sdca_function_desc *desc,
 			struct sdca_function_data *function);
 
+const char *sdca_find_terminal_name(enum sdca_terminal_type type);
+
 struct sdca_control *sdca_selector_find_control(struct device *dev,
 						struct sdca_entity *entity,
 						const int sel);
diff --git a/sound/soc/sdca/sdca_asoc.c b/sound/soc/sdca/sdca_asoc.c
index 0e21ed1091720..2d328bbb95b94 100644
--- a/sound/soc/sdca/sdca_asoc.c
+++ b/sound/soc/sdca/sdca_asoc.c
@@ -115,50 +115,6 @@ int sdca_asoc_count_component(struct device *dev, struct sdca_function_data *fun
 }
 EXPORT_SYMBOL_NS(sdca_asoc_count_component, "SND_SOC_SDCA");
 
-static const char *get_terminal_name(enum sdca_terminal_type type)
-{
-	switch (type) {
-	case SDCA_TERM_TYPE_LINEIN_STEREO:
-		return SDCA_TERM_TYPE_LINEIN_STEREO_NAME;
-	case SDCA_TERM_TYPE_LINEIN_FRONT_LR:
-		return SDCA_TERM_TYPE_LINEIN_FRONT_LR_NAME;
-	case SDCA_TERM_TYPE_LINEIN_CENTER_LFE:
-		return SDCA_TERM_TYPE_LINEIN_CENTER_LFE_NAME;
-	case SDCA_TERM_TYPE_LINEIN_SURROUND_LR:
-		return SDCA_TERM_TYPE_LINEIN_SURROUND_LR_NAME;
-	case SDCA_TERM_TYPE_LINEIN_REAR_LR:
-		return SDCA_TERM_TYPE_LINEIN_REAR_LR_NAME;
-	case SDCA_TERM_TYPE_LINEOUT_STEREO:
-		return SDCA_TERM_TYPE_LINEOUT_STEREO_NAME;
-	case SDCA_TERM_TYPE_LINEOUT_FRONT_LR:
-		return SDCA_TERM_TYPE_LINEOUT_FRONT_LR_NAME;
-	case SDCA_TERM_TYPE_LINEOUT_CENTER_LFE:
-		return SDCA_TERM_TYPE_LINEOUT_CENTER_LFE_NAME;
-	case SDCA_TERM_TYPE_LINEOUT_SURROUND_LR:
-		return SDCA_TERM_TYPE_LINEOUT_SURROUND_LR_NAME;
-	case SDCA_TERM_TYPE_LINEOUT_REAR_LR:
-		return SDCA_TERM_TYPE_LINEOUT_REAR_LR_NAME;
-	case SDCA_TERM_TYPE_MIC_JACK:
-		return SDCA_TERM_TYPE_MIC_JACK_NAME;
-	case SDCA_TERM_TYPE_STEREO_JACK:
-		return SDCA_TERM_TYPE_STEREO_JACK_NAME;
-	case SDCA_TERM_TYPE_FRONT_LR_JACK:
-		return SDCA_TERM_TYPE_FRONT_LR_JACK_NAME;
-	case SDCA_TERM_TYPE_CENTER_LFE_JACK:
-		return SDCA_TERM_TYPE_CENTER_LFE_JACK_NAME;
-	case SDCA_TERM_TYPE_SURROUND_LR_JACK:
-		return SDCA_TERM_TYPE_SURROUND_LR_JACK_NAME;
-	case SDCA_TERM_TYPE_REAR_LR_JACK:
-		return SDCA_TERM_TYPE_REAR_LR_JACK_NAME;
-	case SDCA_TERM_TYPE_HEADPHONE_JACK:
-		return SDCA_TERM_TYPE_HEADPHONE_JACK_NAME;
-	case SDCA_TERM_TYPE_HEADSET_JACK:
-		return SDCA_TERM_TYPE_HEADSET_JACK_NAME;
-	default:
-		return NULL;
-	}
-}
-
 static int entity_early_parse_ge(struct device *dev,
 				 struct sdca_function_data *function,
 				 struct sdca_entity *entity)
@@ -217,7 +173,7 @@ static int entity_early_parse_ge(struct device *dev,
 		type = sdca_range(range, SDCA_SELECTED_MODE_TERM_TYPE, i);
 
 		values[i + 3] = sdca_range(range, SDCA_SELECTED_MODE_INDEX, i);
-		texts[i + 3] = get_terminal_name(type);
+		texts[i + 3] = sdca_find_terminal_name(type);
 		if (!texts[i + 3]) {
 			dev_err(dev, "%s: unrecognised terminal type: %#x\n",
 				entity->label, type);
@@ -499,7 +455,7 @@ static int entity_parse_su_device(struct device *dev,
 				return -EINVAL;
 			}
 
-			add_route(route, entity->label, get_terminal_name(term),
+			add_route(route, entity->label, sdca_find_terminal_name(term),
 				  entity->sources[affected->val - 1]->label);
 		}
 	}
diff --git a/sound/soc/sdca/sdca_functions.c b/sound/soc/sdca/sdca_functions.c
index e4b3efeb30f0b..5a1f120487ef0 100644
--- a/sound/soc/sdca/sdca_functions.c
+++ b/sound/soc/sdca/sdca_functions.c
@@ -14,6 +14,7 @@
 #include <linux/module.h>
 #include <linux/property.h>
 #include <linux/soundwire/sdw.h>
+#include <linux/string.h>
 #include <linux/types.h>
 #include <sound/sdca.h>
 #include <sound/sdca_function.h>
@@ -1120,6 +1121,14 @@ static int find_sdca_entity_iot(struct device *dev,
 	terminal->type = tmp;
 	terminal->is_dataport = find_sdca_iot_dataport(terminal);
 
+	if (!terminal->is_dataport) {
+		const char *type_name = sdca_find_terminal_name(terminal->type);
+
+		if (type_name)
+			entity->label = devm_kasprintf(dev, GFP_KERNEL, "%s %s",
+						       entity->label, type_name);
+	}
+
 	ret = fwnode_property_read_u32(entity_node,
 				       "mipi-sdca-terminal-reference-number", &tmp);
 	if (!ret)
@@ -1565,7 +1574,7 @@ static struct sdca_entity *find_sdca_entity_by_label(struct sdca_function_data *
 	for (i = 0; i < function->num_entities; i++) {
 		struct sdca_entity *entity = &function->entities[i];
 
-		if (!strcmp(entity->label, entity_label))
+		if (!strncmp(entity->label, entity_label, strlen(entity_label)))
 			return entity;
 	}
 
@@ -2156,6 +2165,51 @@ int sdca_parse_function(struct device *dev, struct sdw_slave *sdw,
 }
 EXPORT_SYMBOL_NS(sdca_parse_function, "SND_SOC_SDCA");
 
+const char *sdca_find_terminal_name(enum sdca_terminal_type type)
+{
+	switch (type) {
+	case SDCA_TERM_TYPE_LINEIN_STEREO:
+		return SDCA_TERM_TYPE_LINEIN_STEREO_NAME;
+	case SDCA_TERM_TYPE_LINEIN_FRONT_LR:
+		return SDCA_TERM_TYPE_LINEIN_FRONT_LR_NAME;
+	case SDCA_TERM_TYPE_LINEIN_CENTER_LFE:
+		return SDCA_TERM_TYPE_LINEIN_CENTER_LFE_NAME;
+	case SDCA_TERM_TYPE_LINEIN_SURROUND_LR:
+		return SDCA_TERM_TYPE_LINEIN_SURROUND_LR_NAME;
+	case SDCA_TERM_TYPE_LINEIN_REAR_LR:
+		return SDCA_TERM_TYPE_LINEIN_REAR_LR_NAME;
+	case SDCA_TERM_TYPE_LINEOUT_STEREO:
+		return SDCA_TERM_TYPE_LINEOUT_STEREO_NAME;
+	case SDCA_TERM_TYPE_LINEOUT_FRONT_LR:
+		return SDCA_TERM_TYPE_LINEOUT_FRONT_LR_NAME;
+	case SDCA_TERM_TYPE_LINEOUT_CENTER_LFE:
+		return SDCA_TERM_TYPE_LINEOUT_CENTER_LFE_NAME;
+	case SDCA_TERM_TYPE_LINEOUT_SURROUND_LR:
+		return SDCA_TERM_TYPE_LINEOUT_SURROUND_LR_NAME;
+	case SDCA_TERM_TYPE_LINEOUT_REAR_LR:
+		return SDCA_TERM_TYPE_LINEOUT_REAR_LR_NAME;
+	case SDCA_TERM_TYPE_MIC_JACK:
+		return SDCA_TERM_TYPE_MIC_JACK_NAME;
+	case SDCA_TERM_TYPE_STEREO_JACK:
+		return SDCA_TERM_TYPE_STEREO_JACK_NAME;
+	case SDCA_TERM_TYPE_FRONT_LR_JACK:
+		return SDCA_TERM_TYPE_FRONT_LR_JACK_NAME;
+	case SDCA_TERM_TYPE_CENTER_LFE_JACK:
+		return SDCA_TERM_TYPE_CENTER_LFE_JACK_NAME;
+	case SDCA_TERM_TYPE_SURROUND_LR_JACK:
+		return SDCA_TERM_TYPE_SURROUND_LR_JACK_NAME;
+	case SDCA_TERM_TYPE_REAR_LR_JACK:
+		return SDCA_TERM_TYPE_REAR_LR_JACK_NAME;
+	case SDCA_TERM_TYPE_HEADPHONE_JACK:
+		return SDCA_TERM_TYPE_HEADPHONE_JACK_NAME;
+	case SDCA_TERM_TYPE_HEADSET_JACK:
+		return SDCA_TERM_TYPE_HEADSET_JACK_NAME;
+	default:
+		return NULL;
+	}
+}
+EXPORT_SYMBOL_NS(sdca_find_terminal_name, "SND_SOC_SDCA");
+
 struct sdca_control *sdca_selector_find_control(struct device *dev,
 						struct sdca_entity *entity,
 						const int sel)
-- 
2.47.3

