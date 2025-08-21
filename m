Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4B6A2EA75D
	for <linux-sound@vger.kernel.org>; Thu, 21 Aug 2025 08:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755764657; cv=fail; b=KfAyX6STs81CPir8JYonw1tIp7CJJr+ZocZ5vk84D8euFoU06MIZqxTy7VuVqqfHwbJnSQwusxKdaPRxWtFC1o5mCq4wn1DSuMApI/Ps1pTJWPZArY9KqV+XW3btTM43IO0YDPi06DWLtvNbFnAWTVOA51cFZrdyfN49rMYzH4Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755764657; c=relaxed/simple;
	bh=TcLdYI8Cu3TB1mN8oYLmJWWLBHhqHFfr3iSdKoMtQko=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PrYJL5tHwhM00CddQmR07kj0IubtGUmxC4QZK27A7STHj2ZKkLgovlafoktKHx4wwXfo5Og5TBPfw1/BqgxR7k+Z+nTXPpa2mHd+wyoXU/eF/0fifng7wS0MuPewfP7DP34dOVngB3BqHd0lZMeW2tSso1u7Rd20+brQb9ub+4c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=Mp4xGBfi; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=yuKBW2By; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="Mp4xGBfi";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="yuKBW2By"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 57KEZ8JE368910;
	Thu, 21 Aug 2025 03:24:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=Pgnx5jibH2pC6bDQz/GCC1QdogBX04tTVF74mgXFo7A=; b=
	Mp4xGBfiysiEQBZsSMZZNIGyyMxRk0NDYx+wV9+U8SzWeGYyQmCYw83kPHLnX69m
	NnALUpdYHD0f5HbyaOQiYj5a/UAuL+Nmj7kJLMV39WCgyngyfWyRp+m/hJF+dmHn
	NaIk3tkJYxrAj8BLyhlkUzQmpSYUOTD1ptTmbhURl/YyrjOMW4xV6zW4wCPl4z2w
	h6Takles/1Vi6BoMsC1z3Pdubv89jpe/rg76uN2jpVxsrPRccrl7cbLvDfa88hiV
	vO4e93hQ3zxuEyTAvCNMeUNSg1bDSvi0cFMywNEY9x8Hsrk+zyyb+8Eef6ftjTOj
	ROEeWJyWHEJu0D06LEftbg==
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11on2094.outbound.protection.outlook.com [40.107.236.94])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 48myd9ajdy-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 21 Aug 2025 03:24:07 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lT5L1lwGZrFIJ0pM/8Auhp79DQF/Sx+9KHJ5L5xH/qEo+/Jask0szqMYixd8XpYcdOy366/3gz6a2RjJzMi/rw41pkUsHg6nmV7oB4P1aJzrenwhnoQPq9yOCWB+xfoAYD2FRUubDPsVD+rDLTVzoaCp8E7qbb0UgovUEznPxfgsGGdo24E3Olly3nuDA7hm532aHo03L3GTX6jTqGYYoQCPN7kEV5H5BvIYjbfrWZnlDee9LBIkOvwL4/cKggPK27Wif7dsDl/z2Ugs4+NUyhYR3xcjlS8knSuFWziGRA/35hBYzh78h3BK9KEJeUFE3ctfAjx6SG+/gw+ur5I/WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pgnx5jibH2pC6bDQz/GCC1QdogBX04tTVF74mgXFo7A=;
 b=wne1cVPz4C1Q+6TBUUt7rRs5EXarGF14+Xj1mzB/D9ycAamLYhFJj7nXlqI/mJ+JK65YXFZxCpv9Swweeh7paoxmmgiC/yKFczWUtqkjlp4DKIERp838mjNDR28hcMmwb5FfCD07yJ2CtdUTHxfdcEAaYhRYt8CPeNwmm8KcxBFI0baWExP04alq0E/c2hklfUgft3MCECFyyjdNnyFkoLnygdBnqGWADh67+BU8nwoxmi7zZRGtjoPmWDHV3aG51HXD6XDjTlYKgG1+qq7x9peY6hBO3OHbsLQikqu67YEnUbOb4ELUMNjADMsT9UsNJ1hAxD27T/pNrzqdTn7SBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pgnx5jibH2pC6bDQz/GCC1QdogBX04tTVF74mgXFo7A=;
 b=yuKBW2ByQowQSofENisFBRuIAxw+H6cOOmtEbZws+G2dmSnwSc1ou61h7H7zeWipDXDmtzqdiEYDCTyWM5QGnHL0QUgoLEM3cOhc3y9Hz9WPe8bCF9JPoss8V0Q3/QwO2zU0fWsNub1UKQltHdRpQjz1EYcyYCmsGOZMS+y3B6U=
Received: from SN7PR04CA0056.namprd04.prod.outlook.com (2603:10b6:806:120::31)
 by DS4PR19MB9076.namprd19.prod.outlook.com (2603:10b6:8:29f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.13; Thu, 21 Aug
 2025 08:24:03 +0000
Received: from SA2PEPF00003F67.namprd04.prod.outlook.com
 (2603:10b6:806:120:cafe::d5) by SN7PR04CA0056.outlook.office365.com
 (2603:10b6:806:120::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.15 via Frontend Transport; Thu,
 21 Aug 2025 08:24:03 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SA2PEPF00003F67.mail.protection.outlook.com (10.167.248.42) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.8
 via Frontend Transport; Thu, 21 Aug 2025 08:24:01 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id E513B40654B;
	Thu, 21 Aug 2025 08:23:59 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id CC5AA82024D;
	Thu, 21 Aug 2025 08:23:59 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, lukma@denx.de, mans@mansr.com,
        linux-sound@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH 2/3] ASoC: wm8940: Correct typo in control name
Date: Thu, 21 Aug 2025 09:23:55 +0100
Message-ID: <20250821082356.1301202-3-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F67:EE_|DS4PR19MB9076:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: fec8a62c-0dc8-4fbb-f736-08dde08c1586
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?YVDiXv6Y3+8gefnv5kEvQ9CwqmLD7IUzYmYDcIHq5zDuw8rc1UyJk3adtXG0?=
 =?us-ascii?Q?b9L9ypssmSNqVblZipG1Ft4qYB3Kw9PpkrS9vGVZ7U89XxwCYuW1tYJOfOIl?=
 =?us-ascii?Q?kRCNSaXQg2OEmxEogC0PGGgDYYUvBuJ8SqYwY9UDLOxyodc9s9NmdYgt0TVP?=
 =?us-ascii?Q?FNXe3NS0vwSJUvEzrrIpgA/LpOBzgPynpI8eZZ++xw+cUwa1L8RwaupOGBEx?=
 =?us-ascii?Q?gd5+68JlCha6b/n9LRMdvo1l8bkqEZd8n4XKPRZ4NsH2j8HqZ3rrSGmM167e?=
 =?us-ascii?Q?D7Dnv3iGo6Rdbm3W7emfjANxJe3vDOePUG4q1A7lK4zxDHPuiTzwaOz7VgGH?=
 =?us-ascii?Q?/CWb4GWTwyA3gLZl73yTy0raej8Qq9IAfvvcLvMoO7CKRIja7AQMJPStj9Ch?=
 =?us-ascii?Q?DX/9S6u7QBZximPRDNBYuNX9ZeJkR2/gUOcy84mgGHjae2h8lsrNZOX2YtoD?=
 =?us-ascii?Q?Pj26Q8jCUCARcguAkK2pvT9dnwVqNOIyvIB2xafUbfqCxRBdwRs5UvMlf35r?=
 =?us-ascii?Q?CrRqW+7JRekW6+xmiltAHONKwnzYusEt6a/Fkd+kD0suCEtGSu4jnmt8doKN?=
 =?us-ascii?Q?6f3vRP/saPvbuhAQe0ZzT/z+Ntq/AClFaEeUHvaI4P9cvPXlcoJx7zrm66Q8?=
 =?us-ascii?Q?wsIVuazvVP0HoAnWJnHBlStH0RQOFOD4sVJSB14yOYxL21zk2sG3VoUw7gAs?=
 =?us-ascii?Q?vaaNM0n2qYJ+E5JgElFXqoc5HOXfUlwwyEYc/nlPZT/kIGeYt69bjYoOWYQ+?=
 =?us-ascii?Q?ObJRrRMAZvmWrYpCNB7HbtMIgbA/yst6gYWuX2RI1vsdZjz/3G9nmKnf10Nr?=
 =?us-ascii?Q?CbLEyrw+UVmiOyzgOdeDzLK2mtJ5zzcmBOdU8fZ5yk2xmEe6GCWK8lf85MPl?=
 =?us-ascii?Q?6JENcKAgLsQBul4aULG7Bm+ABGpJyC15O2d4gO3+9lr+v18ZiF/X5bw/wxWT?=
 =?us-ascii?Q?kquIDUwQMbWXQUNjHUzbZPeudCKuwTQQiELHP0tsYxE2Aqw2zPiy0c0o2KSG?=
 =?us-ascii?Q?v4xtLRlq51kkT815ia+GeyqfU6dYzG+jH0LLCBDBP59Xzthu4ZKyaQbDoSE0?=
 =?us-ascii?Q?yhH9vjX6To46gOgeDy15QcPq1S+mCIHuMVoFehjvFH6fjPNt2QVADkPSYDz7?=
 =?us-ascii?Q?gflVOUKqrj7IqfP1PUbWl9Azw1wFLr3+NB650L1ggLggs9ZWa8LJdEE7gOBw?=
 =?us-ascii?Q?V8r5N+jQPQ+u3YoMj43rumrw1i1LxfLzfrYhPNnlhHPtfkWmAnPlEtGx26Qk?=
 =?us-ascii?Q?rC+IonFoZzbqzcj+IaiBHiMo25NqJgY4F0V3uyIzZmubEmSiIASAsOIRz+90?=
 =?us-ascii?Q?WO7zySSALYgO6C41Zs5zg5voDjKwW3KUa3enTXrPSU7TwKBIFu60PzTNWpC4?=
 =?us-ascii?Q?cerDcFqWXAJt04hW5WqbWu80SqWxlfvScgvj6w5RT95rI5rFXQyfvkwom2J2?=
 =?us-ascii?Q?4jhPiZLMlQhDXISU49RrqObKTnhNraU8HqPYp5uinhlWzqSTJ0VrbX222tFq?=
 =?us-ascii?Q?8binDwYsu94M3iNJJDjzG2KZ8U02SQXsZ1PS?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2025 08:24:01.4812
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fec8a62c-0dc8-4fbb-f736-08dde08c1586
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003F67.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR19MB9076
X-Proofpoint-ORIG-GUID: 7Mq8d6nRW4-rUpji_bOgUalZijOJZEJw
X-Proofpoint-GUID: 7Mq8d6nRW4-rUpji_bOgUalZijOJZEJw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIxMDA2NSBTYWx0ZWRfXyVDLU1FLfAzD
 vTQUlk3/x+7Gqtm7Eg/PwuTiHUz0pJhY7mhgF7gk36x8+wiNTULnE6weDgc+jKkYst1zVWEVslH
 MqB0+U5cUCkkbcyIhiZXe4F39AriSnSqNiahbHVwmLX89/egzHtghvdTBlTR7i3JhZKk9Xb4Sbk
 1OfHbu2YtI0hxJRzA6jCEF6hGMlPhZ3oSThdg1PRJnb5asNTvyYAs8Qn27iFyc+DnHJzV30UIIb
 rTph+aJc2cSGFQ2ai1Mnt71iuu6Fsq/D9jP5rYI3vhQZmQlkSDHh5YjMj/8g1HwOFxCPjWL5aZT
 qPy7VG8th4MJ4SiwiBCl/wFV3aouPdVlKWhNVVxx7PxrpltNwQTJ6L7nz6ITU98nDw0ayIbGboA
 gNYyDYB8P+mvxmsknN7czoyIbwq3Cg==
X-Authority-Analysis: v=2.4 cv=WIwmnnsR c=1 sm=1 tr=0 ts=68a6d7a7 cx=c_pps
 a=rOiq0FLXpFKAjvyqCzttlQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=2OwXVqhp2XgA:10 a=s63m1ICgrNkA:10
 a=RWc_ulEos4gA:10 a=pGLkceISAAAA:8 a=w1d2syhTAAAA:8 a=aOC138GHNtJUrrzWcgIA:9
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Spam-Reason: safe

Fixes: 0b5e92c5e020 ("ASoC WM8940 Driver")
Reported-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/wm8940.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm8940.c b/sound/soc/codecs/wm8940.c
index 46c16c9bc17a8..94873ea630146 100644
--- a/sound/soc/codecs/wm8940.c
+++ b/sound/soc/codecs/wm8940.c
@@ -220,7 +220,7 @@ static const struct snd_kcontrol_new wm8940_snd_controls[] = {
 	SOC_SINGLE_TLV("Digital Capture Volume", WM8940_ADCVOL,
 		       0, 255, 0, wm8940_adc_tlv),
 	SOC_ENUM("Mic Bias Level", wm8940_mic_bias_level_enum),
-	SOC_SINGLE_TLV("Capture Boost Volue", WM8940_ADCBOOST,
+	SOC_SINGLE_TLV("Capture Boost Volume", WM8940_ADCBOOST,
 		       8, 1, 0, wm8940_capture_boost_vol_tlv),
 	SOC_SINGLE_TLV("Speaker Playback Volume", WM8940_SPKVOL,
 		       0, 63, 0, wm8940_spk_vol_tlv),
-- 
2.47.2

