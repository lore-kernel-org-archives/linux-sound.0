Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E8E5137750
	for <linux-sound@vger.kernel.org>; Mon, 23 Feb 2026 09:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771839391; cv=fail; b=YI6wAcIRT03zjiiqqvTmig0L++zAbeXORqY8LY07QrsZ8hAyihYS2S2ospEGHwrGO95S/RteKZRy7dLTN1eQSLf+Eh5N9ANFDWAqeQ5zEMuUlgnNHfTe/rRyFGSglxN2IfPyfEREndN3jrvpBySjF+Nt3i5jdkZyl1TtmBXxfPU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771839391; c=relaxed/simple;
	bh=NnX3Sy2DEZLQfyt3hllmBf+HAW5PB7YZP/m11E7FxsU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=txVcagY1K7vPAyvu7YRSApNf+Rpp9O3AD9gohGffz4j7V/PRjUjfxreBUOwOMvQMQDcmJFGfxwILHeK7AuB7nJgXzqiginHs55MSSfDlSJVaBjunAhLYcZ4wJzRjJbPE3exBaBPoVeu3KMEY1dg4H7Tg+2KKPwlfuFKQ0z82C1A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=oPjbWAuG; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=SejuB+gv; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="oPjbWAuG";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="SejuB+gv"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61N5gRku1077394;
	Mon, 23 Feb 2026 03:36:26 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=ibLN1x6bBXEvTKgF
	/mNeuiNnkQWHxiUD3kc6/1wBchM=; b=oPjbWAuGZnBQ942z/xO3hRNKh/Cfd29u
	q/HtLFcuHxQYmMzIWLXa0MYfxEa15C4WrvxeVA0UqFDcNBE+WzD2kDvACHf1+dB9
	hs9oM8dXO8J4iRxDCKxh1feVl8VNog4swfuXc4xvYD0qXPottdUq8Z89Y7q9HH4Z
	yicr7hXpxg1J6W+WO0MD6vKQZ8GV7Cv+lqHtS/K4W1V7Xby3B8rt8aLahu81efWw
	zkvVp96/Ng6RZ3ek5hpPhQDWv6PrhiC3H2mnsBhC+uy3Ol9psBgbPQ99Uc9nEya+
	+9fIL/PN4tQNgvWCya7zrtLnIyhrUBzp5hlUrMQpensEwPirIOSLqQ==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11023141.outbound.protection.outlook.com [40.107.201.141])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4cfb019b6j-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 23 Feb 2026 03:36:26 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AS57bm+LZOhYB2ZWukeu7IldV7uTHV5bjMwZKlzG4y76CQzuPGatEeuY5ARjzAbyNciHXnO5XvRQaPJQk/nRzZm2xTBTj/lghPEOCNbVn0XJmzF8F6A8yF+hJOdjhGJYbtBGZ4ZPe+z93tMzbjS151ZhJpnxC/leJIo2MyNaM606o02XJ5V86kjPgVY72Rb8zvotEWb850xhv94hT0+2QTQduaKFnOdIDgtSCUGG+alLf0zi0ECkht/RzXcX4gQnBMZXHQvl1Dy+bb6QxOdcLwu0N/usCF0vJJ8Ret/ccIFmJYev1JNln6Y3gXRyuyzvaxOd7e3E6kThZBR4YwRDHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ibLN1x6bBXEvTKgF/mNeuiNnkQWHxiUD3kc6/1wBchM=;
 b=OT5Al7kT5jPXqKO49/lsjBAjJzvRsXAPfjzhxTbN/X09PD/A/2Tb+ucPfoN/UCz5V4bPN2n+xCEhOk5pXEqYCOf5Xnudy7hI2+7yNR3FW4sIPiGjKttPpv9UFHgnB4uzuUEzlLaxwcy4tR+alTncQbiti1IgzHG45F3J3OwST7s3mUw7uEUiC2hVrU3SrhptYQxD41w/ZWfXjdr4EjyAq1WxtFYRB+ZRbLIrWv12nUc+J27yJDMQHnABWgRJWzXAu+2f+56Fx0QzYGuWNpzSnl7o/mgC7XAiE82E7ZP150JreSV/0WT1KjT+n9T0LDqF5BKciMrVxbx0BldGvh7PjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ibLN1x6bBXEvTKgF/mNeuiNnkQWHxiUD3kc6/1wBchM=;
 b=SejuB+gvQndadAMmtTlk1biQT5jxaFQsFX7b/Sjba+YWaefJbvuVQPanXpw+R7fuGkesjHuKahV/nEmXAg00vm3kD0mpfgeZnLsPLdZZsw2bultcsmt25CKSW28SNHwQZkbWDV9pjttD0lFTcJaRshaj3r8b0xUfsGi3s+HAkmg=
Received: from SJ0PR03CA0045.namprd03.prod.outlook.com (2603:10b6:a03:33e::20)
 by SA0PR19MB4382.namprd19.prod.outlook.com (2603:10b6:806:90::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 09:36:22 +0000
Received: from MW1PEPF0001615F.namprd21.prod.outlook.com
 (2603:10b6:a03:33e:cafe::bd) by SJ0PR03CA0045.outlook.office365.com
 (2603:10b6:a03:33e::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.21 via Frontend Transport; Mon,
 23 Feb 2026 09:36:22 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 MW1PEPF0001615F.mail.protection.outlook.com (10.167.249.90) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.0
 via Frontend Transport; Mon, 23 Feb 2026 09:36:21 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id E36DF406541;
	Mon, 23 Feb 2026 09:36:19 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id CC2A882024B;
	Mon, 23 Feb 2026 09:36:19 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH] ASoC: cs42l43: Report insert for exotic peripherals
Date: Mon, 23 Feb 2026 09:36:16 +0000
Message-ID: <20260223093616.3800350-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW1PEPF0001615F:EE_|SA0PR19MB4382:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 637fe862-a560-40e9-5afd-08de72bf0126
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|61400799027|82310400026|54012099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?WlwbmG9via4MQ/gsfUoRegFZzsbMTnkvtOYhk2USXL7e5af2Np3drN55Ow3S?=
 =?us-ascii?Q?9yR8EzlWOZ4mbED79lSOptyawKkuUvqF/siKQf1xT8dFNZUrbHv4OqLqrHJs?=
 =?us-ascii?Q?/KP480qxdDL17FbvRlwhusQQu/gKJi5IGhm2Jm1C0EUGJewHJaGwIhSdpD+b?=
 =?us-ascii?Q?DLELejV7bArKz09ybp0H7XRBgWwHaDoQwxg4nyyQ4HwkSr8ZAMgHxHuqHcr5?=
 =?us-ascii?Q?jhi8om9S/T/bzSh2Gdhsw6fWSvhzJ9L2yxQBAdE9zLs4u2btqFshCadrcgg6?=
 =?us-ascii?Q?/Gy9e2m1lbfteQ6B2jq+qLF+wCAXT/9YG5PPsJPRJKcgbC/PZit4bOWIZrw0?=
 =?us-ascii?Q?Ds+Mtv5E8QiO9b3OdSM2fpGbsM6PnJVu1uuZlscrtfDRqPWksle6X4jIyyJw?=
 =?us-ascii?Q?D63G4DpTm+FJhdfqIKJ89l0yY5/JqSfHF2xW5nJXJAPA8F8WseSnPZWYABzG?=
 =?us-ascii?Q?6KdKuyc6qEFJ/+ZFRDtFpJsR9NcisxH8pox3bgvYWnLiM8aheVpgQpQCI/Ck?=
 =?us-ascii?Q?p2as4oa2LiaYQ+geibnc0+RSjDjyJalmv5zMHhszC0kaJUJiR6gsVBWMaTUP?=
 =?us-ascii?Q?xberVicJTfcfRR0la9BSH7lcQf9GhNZoJEuiJ49bUfLAMbr5jlAhthh6iAcZ?=
 =?us-ascii?Q?LlsfzvrnJsluFGICvFtL60q0GyS6jWxrk02s6MF8qw7b0lQUcW+eXz3AlFEO?=
 =?us-ascii?Q?1DbJtduxs9AdwWY4MZOawiMGFI42wSvyXUgFUaIUqhOYunuzCeRTvD8wCTZ4?=
 =?us-ascii?Q?NPTLhqocLHu00SpnwrjJf1sdexgL+qyXVq2YX2gcyHdlX2CxNSjidseqYOH4?=
 =?us-ascii?Q?DbU9I66iG1wt87tIUEFhjp0+ozrqHESvbzldFuM3GbGr4sr+OxeS5H3xNLKv?=
 =?us-ascii?Q?Y7WkmiVP0hydYJE7k6YTB9ruBQI8aM4x4Ok5+Q4EtSPHulFZV7L7S9cIogfa?=
 =?us-ascii?Q?Ij+s3Vth/KGG0SBcVKkPkQaXXJEKAUhmOntxRxwO4Vn7sIeSTiK1Pn9BSkMB?=
 =?us-ascii?Q?0uRJIFcSkU01IZPNqu24DoXhAd/x53IicyFdr4jJcBFK3FGMqneaX5waLbDU?=
 =?us-ascii?Q?Kb5urwjbCeBMaGeaEMuSKgHlcO7Y9MLOVUZ6cO7uyaWJxmo2/v2QjxUh/3pw?=
 =?us-ascii?Q?5L9M9dv2KwH7wVZFzjGTfV7hy3Bi6cBU41QpsStcif4AIOz+CjjPdD8lCdFi?=
 =?us-ascii?Q?D1uqevlKmGalnh42TUBLz5659Lg1SkGirx+XlT1HjypoQ0UqF/R67yAZUC5d?=
 =?us-ascii?Q?C1KeET6NE6xX+OzmDpYmA0DU9E/cVfYf0ZculfQOlyJR7ZhfvZqLevRsQAbp?=
 =?us-ascii?Q?bIKe8tuS21JzyPNZ+asgTYOeECBP6I6Q79xtiQedM0Nt6lmvUoBLd0wALJeT?=
 =?us-ascii?Q?uUu0zZ4wmxGdlOIpX/4HOmIUNqsl1k62jXORweuXf0wB3KxZWkpP0J3slftA?=
 =?us-ascii?Q?GQLNEDmKeIX33x8Sxy0ojp6kbY4lDDUfvY6G82Lkk2B5HSBVN6AYkOiF4Klp?=
 =?us-ascii?Q?g/5JhrWDVdBituYm1QjFNWV/2Lz6P0Y5mNvfFnyAkgrtTuSLIDWEZZm8dMgh?=
 =?us-ascii?Q?LQC5lPVZuEKf+AZk7fMPiNyVWcP9YKZU4h+l5DrkyKc4XEuMWF3Lb4X4B0tR?=
 =?us-ascii?Q?pzWx0wY8P1L4iQDRt0a/JkcCfN1cRzhojE+JIXdYa7yTdqGQs4ERrXY0tPnf?=
 =?us-ascii?Q?AZDung=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(61400799027)(82310400026)(54012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Ht3AJYfVfpTCnPLc6hYn4l9lLahKgjpSF7QCpLEE7U/K0wNo5PiHkiU5D6bpF+e+4ATOn1tknX/1x2Jh5Jd21KZzSfrAmqMVbP0/y9ezd4h2FeYN+Dz18UQk6wag5YU1lw87TXYwjVI02uoQxlehzwJ0j8nm6b++wT3pIWsLrEK4QXGGNGkxr06dfKKw1oZ4AgH30T32807kApIoJ/eUe8osk4KUxmHyqld9isTrrc3DB2n/cdKFQmwhf8kjYNsAPU6DeG61A4P0WtlsAemykhTngzRNxqvk8UwucKHSArokw4vRcr3XCyNlLuo3pqkTV2zlKfmD2PnzTbPbIGhVScNrhXNN+Jjb9xU+W23g0Jv3HTelxlY/Gsj6iPintJq39vBDppeBJmS5NFDXQIch5gfdQDC/GIZHdJZIGHqR7gIDo1mP8Aff+wALSxDVA99l
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 09:36:21.3530
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 637fe862-a560-40e9-5afd-08de72bf0126
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-MW1PEPF0001615F.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR19MB4382
X-Proofpoint-ORIG-GUID: 78QwJkCWFq5wDts2W2TvsCtkaHAR17ha
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA4NCBTYWx0ZWRfXyYkHQwjxRa5a
 AVEr6zNIaxQDq0Vx7j/ISs5lSo0dFzOVD0VmNRZkjQYRvJb4DD2bZ+6xdu7RKS7NANdmWIaYopC
 UrK7w2K+Y5eYnynVvsocKfeWbNQfEwzOX8uiaP2J0DAYS89l+UuhTWeH1uwxOu7P0FHfvabgWgG
 FGg5Tmd3Pdydn9rwpbiLY6SljGnRmkHSGArt5q1xJAXnmIuHAot3obUmm4nMhYf5lQfVMp1/iR0
 mhHXW3KelSRdOqwfxgXcLlq5se6O4jQkIpKCCRs08n8DqDXorkykV7Z0QLgEyOPLe6uq/iwaHIW
 EcU+utAGXhicEj7oO6oPWMT/JXojGpYckJQb2skTAiI4FjfToiS5yZgPr449A7KQQ3ftwrRYaeT
 InYLdSEiswOyAoxMcQ4tIg65B1Dkijhxuaoo4vVToCCKo3TkhNVegVgfZUnjriempisMhGOmAHm
 DUmViH0xoUPfkukT6wA==
X-Authority-Analysis: v=2.4 cv=V99wEOni c=1 sm=1 tr=0 ts=699c1f9a cx=c_pps
 a=Fw0ky2jKRwgN+c0iFCliFA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=HzLeVaNsDn8A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=vZinyE3i5YaCOdzQsoIA:9
X-Proofpoint-GUID: 78QwJkCWFq5wDts2W2TvsCtkaHAR17ha
X-Proofpoint-Spam-Reason: safe

For some exotic peripherals the type detect can return a reserved value
of 0x4. This will currently return an error and not report anything to
user-space, update this to report the insert normally.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/cs42l43-jack.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/cs42l43-jack.c b/sound/soc/codecs/cs42l43-jack.c
index b83bc4de1301d..3e04e6897b142 100644
--- a/sound/soc/codecs/cs42l43-jack.c
+++ b/sound/soc/codecs/cs42l43-jack.c
@@ -699,6 +699,7 @@ static int cs42l43_run_type_detect(struct cs42l43_codec *priv)
 	switch (type & CS42L43_HSDET_TYPE_STS_MASK) {
 	case 0x0: // CTIA
 	case 0x1: // OMTP
+	case 0x4:
 		return cs42l43_run_load_detect(priv, true);
 	case 0x2: // 3-pole
 		return cs42l43_run_load_detect(priv, false);
-- 
2.47.3

