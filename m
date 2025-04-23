Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A4F5265628
	for <linux-sound@vger.kernel.org>; Wed, 23 Apr 2025 09:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745399411; cv=fail; b=O3VKxt/ZWb95qqgfmt0URRQzAF618XgbSITFFOCr/q48IeBDqndifDSYo0aRwZcaz/35w9QERt0XGjQJR74WUgcQFDkrApo+4x9kLVF4MnYwjst3JstQmnUrxnP9nHHbvcCbUTC+LiM7VGY8mMqNCxamTmFQoMtYsfIt/ELp5ng=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745399411; c=relaxed/simple;
	bh=KkKDB2CjQFvph7qOVb9HaotDttsjjFLSxT4pU5xodsI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=Yl/MjWMbTQMfAt4DZTTyCWYaMd2Iu44ekB2ObnXQ2ywUPamW5UNI2RmQrZVNnVCSGb/+AUmir/BpwygML8zW/z/U8imjA28oY5e/PB3r+RRhe/M5yXT77rR5/IRuUM0N6z4c3Sg2j5UTob67XBjlyQX5BqjrjajuJI5O1StEknA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=cuiOFc5i; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=Fbsz8MP5; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="cuiOFc5i";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="Fbsz8MP5"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53N5g9kb011213;
	Wed, 23 Apr 2025 04:09:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=KInmmXz6XBazhkRp
	UV1chTrc1nStNM0FqWlx5HT0V1I=; b=cuiOFc5i4y0AGzryA0VzHs+LRQAXXH0g
	33N9WhUaf6HNSSmmyXcJw6JkSdvtxeEtzCSFOMTb70iRaA9Xd09MuZ0kNg8FOPDS
	Ja7lfFrxRgxOPzmkxwNW1AjQnFXKbdhdEAtCGfj1fwsPTY05/5tRsGMSJFiirLaY
	dBYNTBrKX6GXgnbfD6nPFV9LH3kGKJPjadGIRlVmY8LV9Cvf/REw/o471dRiOg/z
	ZLFFwaArkbdaY0fdNZw1F96xYCrlUwtgcgyMBkZHG5criibw/5PkSnXWUFx+bzZ0
	aiEsCcRC4kBh+qVJdN2MjAMuYL17xspEegv0cZFyXQkhXMv7sJzk7Q==
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2049.outbound.protection.outlook.com [104.47.70.49])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 466jjx0n9u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Apr 2025 04:09:53 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lliLJ5t4oUBjQuqq/lx6swoZPdr977CoXu0BBIKfPZxDQc8dK6MzjHvG+VrAwYeNx/tIXhxJHiwJ2JqRR4SVEz0nf7zFzDTGmQ2Yusre+762c+BKhh5yrT/77UBeLG5ni+GZKdVQ8ACS8iYd/Yl1sSSHDYjOdJLXEGpB7AGITGtZd3xKJyl2IxUZP3cx3LG2Ww+ly2oLqWla64Af8i1pOCOhMeBEVnazgzi9c+Sauu7p6Tu6/nNVJV1PSEp+kElbopeh1MnFpE6B5Deudv7AsPCB72d1LIx/N142Il0DFb4dzvbIwH7b0WYMHOtU+zXVPpPQiakV984aBnclbh7A7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KInmmXz6XBazhkRpUV1chTrc1nStNM0FqWlx5HT0V1I=;
 b=DCF5bOA28ebkq7xmYDm0ArSYqPC26vMmnFeIcaMhA+LKrJlO06EbfisBd4r6aXR+8+K6Or6vCEtGcQiNxRbmPWR7eWCEI9TKTlTgUihuzwKDQNDxDucklzkZgQa9WOiuXaHtmRK7rAwjQdgwfAI2EcvHkD3ij6w0cTZk0+Xt73i9U9Mm6Ac1w9RKD2XU6DnCoM+6/WJ2rnyj9nLj/ZGm3/XlNJjNoaX8NlsRfMhNORvYtBdFQzXurzPNmHt6ZRvos0x+0CW5AC78znWg3oJio4UcYn78vMEaoDBSTHgdZAxtW9zs/x/6jy4/O6BucKQMIhjMJBuKwi2023lm1ZzZ5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KInmmXz6XBazhkRpUV1chTrc1nStNM0FqWlx5HT0V1I=;
 b=Fbsz8MP5LZZVE46CSJAmhCN9Jao2U0N6AdQH4i/lCHJIUrEk9SdKX55qsSCqz/I4HUof2fNzIwCDIXheBVJCUOXnIfRh7ca0bCG2Bvkgkajvin2dn0zrmzTAM3Q3Naqn7ZFb/lktFPX17Fa95L7tlGcEYBPL0GmANQ4lRl36KGo=
Received: from PH7P220CA0106.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:32d::7)
 by DM4PR19MB7953.namprd19.prod.outlook.com (2603:10b6:8:18a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.23; Wed, 23 Apr
 2025 09:09:47 +0000
Received: from SA2PEPF000015C8.namprd03.prod.outlook.com
 (2603:10b6:510:32d:cafe::f2) by PH7P220CA0106.outlook.office365.com
 (2603:10b6:510:32d::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.36 via Frontend Transport; Wed,
 23 Apr 2025 09:09:47 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SA2PEPF000015C8.mail.protection.outlook.com (10.167.241.198) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.12
 via Frontend Transport; Wed, 23 Apr 2025 09:09:46 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id EEFD8406541;
	Wed, 23 Apr 2025 09:09:44 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id D0B19820244;
	Wed, 23 Apr 2025 09:09:44 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH] ASoC: cs42l43: Disable headphone clamps during type detection
Date: Wed, 23 Apr 2025 10:09:44 +0100
Message-Id: <20250423090944.1504538-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015C8:EE_|DM4PR19MB7953:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: c1eb5f5d-3e61-4f84-1301-08dd824697f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|61400799027|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?LCVPyF4gUH5qiPOeLc8iJ2tT0elTkan0Zwhrj283fPqKnme63ae4Js4Ks4mU?=
 =?us-ascii?Q?3I1B/qfDXj+NYfBFuutTIq7PfdUtpimi3HL0xJie/f3LRCt5zPWqbz0SDFm4?=
 =?us-ascii?Q?+N92MtbuR9dunjt6odpQjXttUm4cStrmbJkVoSS6AUgxAhJZ02rhROAiYDCh?=
 =?us-ascii?Q?p3bgb8x19gSP5ECMGl5xpPh8qPuAiEMbbLIBrNiXYugmejzpvSPrvnslKypC?=
 =?us-ascii?Q?vxAD9ZYIJ8J79zGQxDOEef+5FoqWPh3hl3inqcjGAc46icnQKQa5kS4pZoNP?=
 =?us-ascii?Q?gYoYXsKPGFIaxQBJcNLiqQdiaQh3YyRjM75q/Hd1BuJkJwkdAtb/hxbXrWkf?=
 =?us-ascii?Q?KCZLWGfrw4CSk/3B6dPkX9a+LHzSja8U6OEDpWKRht6pEO/woMxRA700Q08m?=
 =?us-ascii?Q?gDrylB9JzShtAHajBDQlmt7UKqCGFH13tL9BQtK7y2YtncboZpo5oKUDaxSa?=
 =?us-ascii?Q?NDZnwgtHOOhaPxePqLva+uwJ8DdPD+J9IrpDWYfFtL4ieuFiovcmetChaZed?=
 =?us-ascii?Q?o9RVxrzz+DSdwhhtj9LldGsoQen49/s2gOdkXHturdwuj+mySG8b5LGhQF5L?=
 =?us-ascii?Q?PGrD6WApibSW5/Azf3WUYRpSVlk9y0GvQVaA54CAboxOOWcKn60kzDDeKNL3?=
 =?us-ascii?Q?0RpyCKtjn0i+iAjXq8JvECyXnmKjzpMeoxNA0DuwhZuYylsCFapvgf/TI3ud?=
 =?us-ascii?Q?GjQbUjcIAmA64T3p7vwCI0ZjOrqKO4w7uS6B7jb8D+R2RYWV4UAOC+WhMvRa?=
 =?us-ascii?Q?1shYPj5AWE1I6ehza80siRLeCYlNjus7BJBGxL4W4cV6UQsqTCs4gI2bRZOt?=
 =?us-ascii?Q?A0c0a5J4HLM4wzoGFwhsttPzDPBXmEe00N0e96qk6Y410jYOZTHgeA9w3Lhr?=
 =?us-ascii?Q?3CrpFOrJSppHkdAs2xDsJTOAYKVv/z0GrnPYqeLmVsCjCK7LXnL+zNGlayyZ?=
 =?us-ascii?Q?XxkMnwd/p8N0tHJeJWeuSfgYO+UFCCE+EsSsrXhgp3sj8XB06vZ9RJLqxDpp?=
 =?us-ascii?Q?bZtSLUtV4YSsvYlNkLali1m1TT5IuOcx5B3xQAwAabYh5lTAF1PK/8duhtJR?=
 =?us-ascii?Q?5BRBIx8C6RhWanjmG318BpgA7WRjx3NyDDQD3DVOUu5+HKK8bIj/tS5lsMr8?=
 =?us-ascii?Q?2HiWDc1z4F8FestKP/hnOl7s5DzbWa4fbZAzg8cg1brSkh2CJe4AEwa3CaNv?=
 =?us-ascii?Q?vDvY5ihVejyEcUa0GISEx7Qt3SbiezJsxulfb8Dq9IwaDuXV+gczVC9eh3fX?=
 =?us-ascii?Q?OHU/JV6qfXyxw1eGr18DgqgpIoVugFM8svA9FTpP3MwXXqdDwlWBLei2jnuz?=
 =?us-ascii?Q?tENwKhDnUidjZAXHFEoN0b48jyvRPAl5zhXpLSjQoItJeY7rGGWF67A2Dzmb?=
 =?us-ascii?Q?dAkhjV1UlI81F/QJWAeesBWA3Awtn8LNP6ogJDc5CBGH7VQihWeVjIB22lkm?=
 =?us-ascii?Q?fpVhzR2HO8vvCJoDNxnXQpKoDFjn2gGBHgvOSifkHUPFcIZue7Bc4hG506ie?=
 =?us-ascii?Q?8eV4/d+7n4N5WQpHdS5q2QhP/U1OPR0WvahF?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(61400799027)(376014)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2025 09:09:46.2499
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c1eb5f5d-3e61-4f84-1301-08dd824697f4
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015C8.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR19MB7953
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDA2MiBTYWx0ZWRfX+Bp3GVJfJ/K+ 5kttrjJXrzAi5kIS+NHOtqndX0MPzq5VekQ4e3kupztALmE9y4TYRgarnyKg4skjM61xeMUd3cD KC0FSn43fsZLrMn2VoWPZ2iPnxj74dD/dwTKX9UZJzlvGBhRuZDaSNq47rdewIW9Imfk33QM+nM
 ++NddnYHMcisr8pNgb3JwUGU0pbEn7cuNMdln0manDheSRxTOWN7X8NIo0WJBM6uN1CO/3KUfkA ehqBVSEB60DfFGepiUN7r1lIHtBwBgpANqeHeITfVVbeafYkZTgFIaFdjkpcWD89h1JVTljADLJ Rv7KQWJJVXq0tdOFT1d0l0PStMDisjLRgdLK1sjmOnCUeTclEsAhRPMyPhkkYJzLJWyiyt8jElV
 WDqglSjdPTxXD9vIOKf4AqkRupJhgfyuHhxd5ZAlQkSirpoyY4nvDeP1bWcY99UTAMnikiCZ
X-Proofpoint-ORIG-GUID: 9GCp9NJfjPvtMCnw9yUHZIpGi0X1Ylvi
X-Proofpoint-GUID: 9GCp9NJfjPvtMCnw9yUHZIpGi0X1Ylvi
X-Authority-Analysis: v=2.4 cv=ItMecK/g c=1 sm=1 tr=0 ts=6808ae61 cx=c_pps a=YkRwJB1Lcas13D3J5+BQ6w==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=XR8D0OoHHMoA:10 a=s63m1ICgrNkA:10
 a=RWc_ulEos4gA:10 a=w1d2syhTAAAA:8 a=hErnzLSzq6pn7dXkSsYA:9 a=BGLuxUZjE2igh1l4FkT-:22
X-Proofpoint-Spam-Reason: safe

The headphone clamps cause fairly loud pops during type detect
because they sink current from the detection process itself. Disable
the clamps whilst the type detect runs, to improve the detection
pop performance.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/cs42l43-jack.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/codecs/cs42l43-jack.c b/sound/soc/codecs/cs42l43-jack.c
index 20e6ab6f0d4a..6165ac16c3a9 100644
--- a/sound/soc/codecs/cs42l43-jack.c
+++ b/sound/soc/codecs/cs42l43-jack.c
@@ -654,6 +654,10 @@ static int cs42l43_run_type_detect(struct cs42l43_codec *priv)
 
 	reinit_completion(&priv->type_detect);
 
+	regmap_update_bits(cs42l43->regmap, CS42L43_STEREO_MIC_CLAMP_CTRL,
+			   CS42L43_SMIC_HPAMP_CLAMP_DIS_FRC_VAL_MASK,
+			   CS42L43_SMIC_HPAMP_CLAMP_DIS_FRC_VAL_MASK);
+
 	cs42l43_start_hs_bias(priv, true);
 	regmap_update_bits(cs42l43->regmap, CS42L43_HS2,
 			   CS42L43_HSDET_MODE_MASK, 0x3 << CS42L43_HSDET_MODE_SHIFT);
@@ -665,6 +669,9 @@ static int cs42l43_run_type_detect(struct cs42l43_codec *priv)
 			   CS42L43_HSDET_MODE_MASK, 0x2 << CS42L43_HSDET_MODE_SHIFT);
 	cs42l43_stop_hs_bias(priv);
 
+	regmap_update_bits(cs42l43->regmap, CS42L43_STEREO_MIC_CLAMP_CTRL,
+			   CS42L43_SMIC_HPAMP_CLAMP_DIS_FRC_VAL_MASK, 0);
+
 	if (!time_left)
 		return -ETIMEDOUT;
 
-- 
2.39.5

