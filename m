Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4CB02EB86C
	for <linux-sound@vger.kernel.org>; Thu, 21 Aug 2025 08:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755764658; cv=fail; b=p0dgYWzXPmvHIle4DFuJa/H2PQLLVDb+Y+NI/yRqvTvcQgjf8HuN5wfamarPIfI4oDQDjOET4LZTX53pjVEthNrN7VOfRTAXhmgcSvh5oPza8ddjkbN+b9OpRQpfWxh8HhDpBckAgBBhoWItN+IX8WrcnrnyHMMbbcX8pgT+eq0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755764658; c=relaxed/simple;
	bh=V112emq0AOXvjlEZSBuX9oXeM9L6x87T9DvYgk+uA08=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SDbNYoL7O8F6wv4js7XhU1qA0XrKVCjLIwF33GB446foKq3X8oQ+6RgIke+8KikvVChrDn5uGFjA+0v7Up/UdQ5AmRrwuP/Sb/8jMoJUM6jpY9orYnQas/CVGkzTwTbp5cTwJlj0O2zd07fhqMwc2UsQmQS97PX2FugoHlqdlow=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=DEgo1fFh; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=lFUdf3Uc; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="DEgo1fFh";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="lFUdf3Uc"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 57KEZ8JF368910;
	Thu, 21 Aug 2025 03:24:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=Q9wJMhR93UWYNJ/KLe5z+AEF0VYRsxp6xxQoDWXrRyw=; b=
	DEgo1fFhBaPjhFgcJCgvLmAL6bVkNz+c2mmKjezMAJWssPFpMq1m8Ag03RM+TGeK
	AlD0pG23ZMfe6o5K7H1uMekVPgQ1ZoRjisC4Y6g46TDf2rWWQOp0ojduyOlSgjw5
	O4MKRZ6UMqHzTjrUP589vNhpZT1VOTnL99LR0uW6arEGNQfIFhVEKBL4hnpkZKTl
	eCuB9YHdvVfih+daTuyVqEICT9MrJaI9jJTxh717ZaayntqbUxq4vM+zGh16SK5I
	pD6z8oGhEYvd9yXTo43pq9ab71VEFzpWZladFLMuJn9ZRDCUN/kWF4GMv+S+/6Rg
	bxRCWu6kFs9XFcMnh+P3mw==
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04on2122.outbound.protection.outlook.com [40.107.102.122])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 48myd9aje0-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 21 Aug 2025 03:24:07 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SJJKoFFEfO2KbRfYbMRviIClu7IbCJJRhCuh/2wPfyou9XZwXStUzfYNo5iI9ZARPwmR8m5Yabj43zq3r98hfDdEmgLe32DGZhXEyqtelom5quteDDUBmcSGQ7avuZgO1bQ4BKdf3mX8Zg3ym4F4+Yky/Trs5oteHve+qT7tvgvjCQv1OYc71JQ0FVLexIGvJmkLKF7x+a8R36wY1tY1K3eNnpPHsq9Fky5IIFnZI791ieM0JP/wM2NASNt5maiRNr3gCQ7w+aMGhvCn6gd8n3cue0JQsJr7H/1R5xMV36H8QE7toDfPi/wvfDuLK6ieLZ7c1PBc35mdFRlsAxfzTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q9wJMhR93UWYNJ/KLe5z+AEF0VYRsxp6xxQoDWXrRyw=;
 b=mqH68oeaP0mziGFHbr7S4VXvXKBMELPmJRH8jf7+u+XGU0JRolZiGekW3gA3rkT0NMHdeCLTIwUzqrnkfBf2NPdBBDhr5WOKm8E9Z3SRGlLg0c/Ij026ah94C8ZaGvgYxZN3eL1ibjVISfs4a+BhsbmB296clAEca3jg1V++n1Dhxyqx2YhvPU63RELsY57z95sZ563X/MxxIEe0yFiKbPVjiwcE/ZjXXc37qpcJNt+rtbI7dfsle9sacyzZAGfIkj5FjxZ1KZE+FTsStitmgpyrKEgB8lK1niPabZv+0TONnnOi73mdJyf8GVdQ8l7iRvuXVkY5mJmvYIOYmuAVCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q9wJMhR93UWYNJ/KLe5z+AEF0VYRsxp6xxQoDWXrRyw=;
 b=lFUdf3UcShkI/bHNYyBViWZyhdWit+mLy57ddWKk2pAAk6oXgbUToImd6rWvYXif6UhHWMOOZwO/WeGhNNoRfYnOE1tH1FmBChx2xLnW+F9+x/jYan0vyW88JhdsGyYUHZM7HYado+0O0F5OobXkAbQ4N+tGLjFYfY5iw8b4MXk=
Received: from SA0PR11CA0133.namprd11.prod.outlook.com (2603:10b6:806:131::18)
 by LV8PR19MB8517.namprd19.prod.outlook.com (2603:10b6:408:1f0::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.13; Thu, 21 Aug
 2025 08:24:03 +0000
Received: from SA2PEPF00003F63.namprd04.prod.outlook.com
 (2603:10b6:806:131:cafe::e) by SA0PR11CA0133.outlook.office365.com
 (2603:10b6:806:131::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.15 via Frontend Transport; Thu,
 21 Aug 2025 08:24:02 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SA2PEPF00003F63.mail.protection.outlook.com (10.167.248.38) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.8
 via Frontend Transport; Thu, 21 Aug 2025 08:24:01 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id E7AD1406553;
	Thu, 21 Aug 2025 08:23:59 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id CED90820257;
	Thu, 21 Aug 2025 08:23:59 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, lukma@denx.de, mans@mansr.com,
        linux-sound@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH 3/3] ASoC: wm8974: Correct PLL rate rounding
Date: Thu, 21 Aug 2025 09:23:56 +0100
Message-ID: <20250821082356.1301202-4-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250821082356.1301202-1-ckeepax@opensource.cirrus.com>
References: <20250821082356.1301202-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F63:EE_|LV8PR19MB8517:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 3d2ca6ca-745a-4c2e-d004-08dde08c1580
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?yPIDl1S7kKGG2AFmUImtSGz+Cj0QoXFWyCXrObRib8404EFlfThZQArNiLG3?=
 =?us-ascii?Q?CXjPPOA20gM0FUXKxf9dp0aBDnBqoutA1W78tmE9ih6j34IWO+7DemDtig4A?=
 =?us-ascii?Q?XJlv1K4Sv6B1Bn2qxu8rnWVDjq5O0nn+pOQkEirKexwz3tmmloy8hX11bPo1?=
 =?us-ascii?Q?1T2vrcGkuYvOE1eVnTGXMeMZJZZEQ7MpyJKGejbcbZ2l8wjE3eSuPB4JBwBB?=
 =?us-ascii?Q?110FDHbkHjR2/m1PQmf63jXjCoFWznAd/A9jyT6mN9oMcSQPPLxlthTMe/K7?=
 =?us-ascii?Q?ABIMx+aMZLkTDwBr7Sn7Ha4nUU5fY8ViFjMnSzxxJRbVQk5ZhZami1mtsZhi?=
 =?us-ascii?Q?NXH0Ooar+GuoVtffkDa3SVnbZUBqLeAIKPjOSIcwSjkDMwgpcHE2boYD13d8?=
 =?us-ascii?Q?mNNc2J0e+IZQmDWP1DetV0riq7gqcGvsYkaTL2lJ8fknfJy/nPVNcMexag6Q?=
 =?us-ascii?Q?Qx4YrZC9zTMR54nfRjlH5j1fZWpkPKgPk0mL3IaKANO3qsXz6PrfB5z2vKva?=
 =?us-ascii?Q?jDvH0nlEtvSlaVBOY67eFodbVJurXkq+fhv5RbzchYsVYjmNBHrxzvCwamKw?=
 =?us-ascii?Q?Xz07O+Sr16BOzPcg5gWlOqDZF9lzF6bEStVlkidxB/XXuGuTejVq3WmGoOJS?=
 =?us-ascii?Q?8kLV/ijPN7PLSR0oIqGtn/vFr990j2URnW6orFpRiKgugsS6xFMImp9PkknS?=
 =?us-ascii?Q?9A1Tu1/LOdIbHf47IHxQZsyCVfng3+XXsH/0g5fR6Se29vkO/WOuj3+y+i8g?=
 =?us-ascii?Q?IVHwxH2NMvRMOtP1n36Vv3AUJcNkawNZfV9VCNLNAKCBK24oEbGLnmStBMfh?=
 =?us-ascii?Q?oKAPP+mwZCOMAy/R744gh6aaOwNrUzCCCwam2B1G36oAqTUN35pPFPiRWj5r?=
 =?us-ascii?Q?cb6G/K9sgr+BdWIzFgLdBbL0x1V4A/ca9Jeygu2k/12vZv8tYhvS7v5ngtvu?=
 =?us-ascii?Q?ywzXgLFG67V8y1H1o6Vp1Vnq7k0/ho72/g+WG2HUYkbcMQb+W/gs9f+EKbqr?=
 =?us-ascii?Q?TdglFFHUwZh2C+HVvNEto2ycKa0pA8AugCCA+onoR57Y4Ukx2wH76G+fh4OZ?=
 =?us-ascii?Q?/CoII24hZx5tiwNHbEpvn7dtWg1/3FYn5gU7i0reTnaZ9v6eHlwwsN55HHFz?=
 =?us-ascii?Q?0H9RyAiH6l01f1xjtnHIKsQC1jm93LYVvX9Dcrp1KcdHACf4VQqTi0xcfBY/?=
 =?us-ascii?Q?thjtL08n4WHrwSvQzmJxmTI41A7aJwbmd8wwZO5LR58f4XHgAyK7FQRnfuW7?=
 =?us-ascii?Q?ebXpsHVqtCPD1xipi79jPXJreHQuOB9qbYxO3+6cOZcwwNxIyuXpmG+xkv0i?=
 =?us-ascii?Q?NOvX293GJ4IwVTMgQrGq4BSWk6oN4ZuNe0fSxHNmNU/1wxboISpKqATitZfB?=
 =?us-ascii?Q?hVDlbUQrAydOdkyXiL1GlcnAlSB3odroi5Vak4ICFA9Q9iyyQfWYfAda08ON?=
 =?us-ascii?Q?uxKvqEooNjCjwJ/rRvl1xQEpSJLRljrzpE1AqOMfbQEU7ryyEuygWfDLpiJo?=
 =?us-ascii?Q?FYBGg8svOcCIY0J50E0oKU7Hjt8144KeA13O?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(61400799027)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2025 08:24:01.4450
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d2ca6ca-745a-4c2e-d004-08dde08c1580
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003F63.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR19MB8517
X-Proofpoint-ORIG-GUID: dEMLxvTAFo0DjGU_xa_o6hmKz3KD4jsG
X-Proofpoint-GUID: dEMLxvTAFo0DjGU_xa_o6hmKz3KD4jsG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIxMDA2NSBTYWx0ZWRfX0Jar0mlh93ZG
 NG46d6L1lZdas8K/HumEZc3/QJu2Yrmg0bpBHqYWoKar47BPksZ4GMDcf4hsUFsbtlG2Gwxjwo3
 bH16BgBQfVsZU5x6sVsRp4DrjvLLz/EHEqfNMmg7TGC6PkDA4eXfZlSRP0sN8DyfyHEvf0k3R6p
 WR1ufCk9i5IcfBLl3gNvjF5clRFOfP3YrHpwhn6FWbsNMHdJYUsWX4JU1/h8cN7AThxYede/0G5
 WX1kP9iIs3cnYipO9cfoBAbgZPoMkCZN/ob9N+u2S3b66TCLrOiK5N/odhEMt2x3yErZx3beehn
 LyOimqfUTXqMik+p0uIlWZWtQ18RR1eS5kIf9tN0gGM/fqwQM6dXjKmAxVOGb+1CcY5IYFpOvmg
 Y2C19CkpBfy/r2XDUIuNUgkcZELkZQ==
X-Authority-Analysis: v=2.4 cv=WIwmnnsR c=1 sm=1 tr=0 ts=68a6d7a7 cx=c_pps
 a=Apma1+nZR08asJJWUEmYEA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=2OwXVqhp2XgA:10 a=RWc_ulEos4gA:10
 a=w1d2syhTAAAA:8 a=17M8HyGcdYgNtdz2D7gA:9 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Spam-Reason: safe

Using a single value of 22500000 for both 48000Hz and 44100Hz audio
will sometimes result in returning wrong dividers due to rounding.
Update the code to use the actual value for both.

Fixes: 51b2bb3f2568 ("ASoC: wm8974: configure pll and mclk divider automatically")
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/wm8974.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wm8974.c b/sound/soc/codecs/wm8974.c
index bdf437a5403fe..db16d893a2351 100644
--- a/sound/soc/codecs/wm8974.c
+++ b/sound/soc/codecs/wm8974.c
@@ -419,10 +419,14 @@ static int wm8974_update_clocks(struct snd_soc_dai *dai)
 	fs256 = 256 * priv->fs;
 
 	f = wm8974_get_mclkdiv(priv->mclk, fs256, &mclkdiv);
-
 	if (f != priv->mclk) {
 		/* The PLL performs best around 90MHz */
-		fpll = wm8974_get_mclkdiv(22500000, fs256, &mclkdiv);
+		if (fs256 % 8000)
+			f = 22579200;
+		else
+			f = 24576000;
+
+		fpll = wm8974_get_mclkdiv(f, fs256, &mclkdiv);
 	}
 
 	wm8974_set_dai_pll(dai, 0, 0, priv->mclk, fpll);
-- 
2.47.2

