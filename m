Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D49625EF83
	for <linux-sound@vger.kernel.org>; Wed,  9 Apr 2025 12:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744200452; cv=fail; b=TGhtgl8vGqu4DgsUgMhQYV/OZCGbrQMtzdDwQZxbIqIrMOzorrm8QXpbjfDggup4dWVxK2fT3OiPFEOTz9YdIfeqe83zJXfMUjiPKInGs1PtE/A/MUSi2vKNopKElpaGL5HODqo6sycYKtpgcmGrC4WIVQNV/6W4xrqoGgv63bY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744200452; c=relaxed/simple;
	bh=7FNy7BpRQCvjsHgv8bAReLE2Y8iNo3zrxzAMybQNkQI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=msjJEdYQ0aY1xr3/Bw9fKw0//5d/EfxJjFOS3a7+eAyMqIwhY/uQHXBWnDWEFA5qIEHyTNzVWeR1PQ0TjXpX4j17ckqAfLeVPIoVqeWxF3Sf981DAuGuJVXmEAgHntFoZTnuUVvMi90nRsFQ059+fqAls9y5BVTpksXJKm0gGKA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=dWIzBSj9; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=U2JGArBw; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="dWIzBSj9";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="U2JGArBw"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5396PsZK006541;
	Wed, 9 Apr 2025 07:07:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=3vU0birgAR7dMfWw
	KyMVneDWC9qbCkwaLuxxxSe4tOA=; b=dWIzBSj9B6kynqTkSEt9l0tBfRJFibfJ
	LMWiW0oRZ25IJIKTwGHlVssYj4YSYZAAoPTmxW1VkkyG2pX0vvwIL6SKqd4ps5gx
	Y23ykCtLk0JDQ0CG0czfxWYdpmz9W5NssC3IjYmvdOAS9btAYIvtTBPR08Wzy97G
	wdYQahq8jrDDHlG9NrCHXNeWniDJ98BWYtF9vTu8FkQA77ZDbJPBcZbnTfAx6vTK
	2EJ8rd2Uafpdg+cnk3K2GbI0SL0xiNK4myIv1En0jMSngboPvQkhksUjMlvjDwLH
	L40uNjTM37kyAjZV8FHxLoiE/xEs9LmVGGYQHoZQhzByuWyCOGLJtA==
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2044.outbound.protection.outlook.com [104.47.73.44])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 45vemwm1s6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Apr 2025 07:07:25 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QdjRZI8LIOxmjEKu2vXGWEGbF4wG/FhSWNzieQoSZgEzEV7D9tmqmLaO+KLwtVeam96fI9zWvkRpMgc1NlQ+oa8cA6RwOPKHA89nrIJx2waUoRfO4GKVv2pNvXCh0l+a+20bKN22ILhu19A7agEZx68oUaxZEl/0KSvrvoo3io6KshPsU9XMl++EbibWsb+Mbq0/VKeGVdXpUcc0h2fEyiRDIvfdpadq6CKmcQjz7x5TI5aFvyb7bEbSrO8mEJ9uRrfiucDHiqoTzUKAH/Kq30X14eJ3Phi/ZQFE2UeE0NrgzwgIRKIKWoLFYBH8eWkDSu6+j/v32aNVoZNXj6OuwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3vU0birgAR7dMfWwKyMVneDWC9qbCkwaLuxxxSe4tOA=;
 b=hl4nIuZwWwb7PUm+xAajqi7ei6UBbNHKBNQ2SysHBY05n1xMnouJaHBNr53xF95K92wtI3pa1pXp7lQEBhtsdGJC6MNnsd2kiqtBLCbKIutnvaDdCOkDCESX11NIwXLghz1oxzFs8fEk775mwwBIjMum8CvjkUsNzrW0XrJnUmrmOL82Wl6tuwyaYOoQpV5fSn+SzzFe5ofZT7p9fIGpg/tBo+YT6jZD0SBSdruc6qIXLKPDY5uMq0SRmsUH1y89GnomTKxma7oYO/Q19u+nW85U/ya+SnIUSE0ZduCHbNnUFBxeKXNe3xCeH2xDEYZKtuEdDofoaVa2HpESllkDpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com smtp.mailfrom=cirrus.com;
 dmarc=fail (p=reject sp=reject pct=100) action=oreject
 header.from=opensource.cirrus.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3vU0birgAR7dMfWwKyMVneDWC9qbCkwaLuxxxSe4tOA=;
 b=U2JGArBw7ZccZwIElJW+rfkDo6jHgwq4LdjibzpbOZLc4L/RFRtYfYk2/S2cHO8fPGF6z6E2GNhF0zC0OeVnTAGfJxys1OSMAHoHh7f6VkZCRd5c/zenm1jdaGuycqJ14/UmqflG1IhM1T9QO0CJBoz6AzJFZtTrBtlnggoNz7A=
Received: from MW4PR04CA0312.namprd04.prod.outlook.com (2603:10b6:303:82::17)
 by DM4PR19MB8303.namprd19.prod.outlook.com (2603:10b6:8:b1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.29; Wed, 9 Apr
 2025 12:07:20 +0000
Received: from SJ5PEPF000001D7.namprd05.prod.outlook.com
 (2603:10b6:303:82:cafe::64) by MW4PR04CA0312.outlook.office365.com
 (2603:10b6:303:82::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.34 via Frontend Transport; Wed,
 9 Apr 2025 12:07:20 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of cirrus.com does not
 designate 84.19.233.75 as permitted sender) receiver=protection.outlook.com;
 client-ip=84.19.233.75; helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ5PEPF000001D7.mail.protection.outlook.com (10.167.242.59) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.13
 via Frontend Transport; Wed, 9 Apr 2025 12:07:19 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 23D57406544;
	Wed,  9 Apr 2025 12:07:17 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 18BE0820259;
	Wed,  9 Apr 2025 12:07:17 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH] ASoC: cs42l43: Reset clamp override on jack removal
Date: Wed,  9 Apr 2025 13:07:17 +0100
Message-Id: <20250409120717.1294528-1-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D7:EE_|DM4PR19MB8303:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: c3e4a92f-60f7-40c6-4210-08dd775f13d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|61400799027|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3y8pR+3pcMmXkZSNlObeM56wk5HfwztfePoIrw5jrvCyGoxDUSMYXJ3DKxwK?=
 =?us-ascii?Q?c9jvzbnNYz5yuXARr5TDRmAUclzL9ErWWeuuEvOToScOpYiB6Qh5PxzxgJfk?=
 =?us-ascii?Q?YuQpSTd2U3GHewVlpPr9hkk3hae+IvOnz8ajj4+glepIGDGPp2XQxYercrwg?=
 =?us-ascii?Q?sX1fk87X304Q897jlXGwkMtPP6WtipgTiX/5lVRwFVoJA8sCdufoHeGp6z/8?=
 =?us-ascii?Q?dhzUxysA0jA89+BERLV9SVrM+MlxUkaiFjXR/tTzZSRPiAEJBtBbnXDDYX6S?=
 =?us-ascii?Q?ckUMDRVSDpKsXAfSnlbnuzZkEuJSQbnDh36YHSfoQ+BIQ7j9DxSA+WPuMW0B?=
 =?us-ascii?Q?lORY5ppLAGqpyg9eJ++Naemhl+J03od4XCzNJ6OPtY7ME/JDmnAHPv0exEB5?=
 =?us-ascii?Q?Y/vE/+EEvsRdTpydE65SfKY8Hi53FSLVBCn7N7sjdm9DIUF2IIvBfIlMN547?=
 =?us-ascii?Q?KukjhpCpnaEntl2tKQkcus+PuPXjezYAfnzRl6ttwefTMtW+IyIl5Y66dy35?=
 =?us-ascii?Q?ez79ropbFDD4a8bsFMEcALaqMygftqCRm9O/4K6gbk5hvRah4tJpr9Zdw15C?=
 =?us-ascii?Q?aBf8VjED9igYGSVWqtV+UCu0cnQbaLaZDgIWzzTkvvcooVYenwLd4qniArUp?=
 =?us-ascii?Q?o4vhL67OqocGKHGUJ/rWm+PplABEjwkpm4MBFXtP6AfN6CQuZ0e1V754il4O?=
 =?us-ascii?Q?9vAk58ArGjP4wz8+RVXh6IPfgzM9axuuTbBbWM9J+378SuQvc0zyL26D7jHk?=
 =?us-ascii?Q?N3JlJjWH68YhA5muMEPtuFm1Wn1w2QPVTK6KDcnPrdsZ2NUihLCXhzp2x9BL?=
 =?us-ascii?Q?c1HeaweANtD5kPo1ZBMTNcsej9bfl2iXLlzN8rjknoKPmO8IM0tCGfAE5tNr?=
 =?us-ascii?Q?gWRP+M73Abbmh12grezSr4s4bSKnCxu/9sNZi4/ojtF5ouXUE76NYgpndbQK?=
 =?us-ascii?Q?oWTv+XYNbWIHv95sr5geKMbl5rAbrHAobOu7IkqYJAC57qsQWNfL807cYQaz?=
 =?us-ascii?Q?TX+/TdzuVEgWTzVyIDwaYEyt+G7tKpZHpOqI1h9ZkcFlCty2Db+16n5KJmrP?=
 =?us-ascii?Q?ziYUdU6tXwc/QRCuLr0tWTp2+opKLGT9oBrDnLaM2CNKTWWkE2l5PtOlGFjs?=
 =?us-ascii?Q?3m8e/yhjjJcePNfQ66xcFc0SzsFo3palpKhSeE88pT8PLV1Tpv/32bJuDN0Z?=
 =?us-ascii?Q?dPJ/P2o55DwnojtdkLRDkCcus3/EXthZmWBhupQqFtmgnQadDH9rcLaDgIyL?=
 =?us-ascii?Q?SSOz0plq2HqGvFfMmaefPT6Iybe67okLUCxRlONqBLkqHk2PTrA5lE1USEMR?=
 =?us-ascii?Q?DlRcfV6UMBFr9BL1ylCIpP9NHNqSBVZnmQ+7jyzSKNdb5dMCzGbZcMw8x/Ff?=
 =?us-ascii?Q?F+adz3asJ0KoBSsIFE7qaS1J4C7zp1u79ZwjoC3xFvcxeU9BZD+cGb19fW8B?=
 =?us-ascii?Q?WqYgQDNtIF47teupRAKa3QHmm/5w+IluwlFSC5X8gR9+S+dY7Ox/Y5latCeo?=
 =?us-ascii?Q?umYBvDSsUEi9gP0Lfe4C4u8DiPf9QzbkR4ZJ?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(61400799027)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2025 12:07:19.1276
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c3e4a92f-60f7-40c6-4210-08dd775f13d1
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001D7.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR19MB8303
X-Proofpoint-GUID: 0BOoot5DNL85IF5QDz2-d4K8KwWvzJ_0
X-Proofpoint-ORIG-GUID: 0BOoot5DNL85IF5QDz2-d4K8KwWvzJ_0
X-Authority-Analysis: v=2.4 cv=bYprUPPB c=1 sm=1 tr=0 ts=67f662fd cx=c_pps a=coA4Samo6CBVwaisclppwQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=XR8D0OoHHMoA:10 a=s63m1ICgrNkA:10
 a=RWc_ulEos4gA:10 a=w1d2syhTAAAA:8 a=Lk3hAswutr4zIcg6ypYA:9 a=BGLuxUZjE2igh1l4FkT-:22
X-Proofpoint-Spam-Reason: safe

Some of the manually selected jack configurations will disable the
headphone clamp override. Restore this on jack removal, such that
the state is consistent for a new insert.

Fixes: fc918cbe874e ("ASoC: cs42l43: Add support for the cs42l43")
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/cs42l43-jack.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/codecs/cs42l43-jack.c b/sound/soc/codecs/cs42l43-jack.c
index ac19a572fe70c..20e6ab6f0d4ad 100644
--- a/sound/soc/codecs/cs42l43-jack.c
+++ b/sound/soc/codecs/cs42l43-jack.c
@@ -702,6 +702,9 @@ static void cs42l43_clear_jack(struct cs42l43_codec *priv)
 			   CS42L43_PGA_WIDESWING_MODE_EN_MASK, 0);
 	regmap_update_bits(cs42l43->regmap, CS42L43_STEREO_MIC_CTRL,
 			   CS42L43_JACK_STEREO_CONFIG_MASK, 0);
+	regmap_update_bits(cs42l43->regmap, CS42L43_STEREO_MIC_CLAMP_CTRL,
+			   CS42L43_SMIC_HPAMP_CLAMP_DIS_FRC_MASK,
+			   CS42L43_SMIC_HPAMP_CLAMP_DIS_FRC_MASK);
 	regmap_update_bits(cs42l43->regmap, CS42L43_HS2,
 			   CS42L43_HSDET_MODE_MASK | CS42L43_HSDET_MANUAL_MODE_MASK,
 			   0x2 << CS42L43_HSDET_MODE_SHIFT);
-- 
2.39.5

