Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 456112550C2
	for <linux-sound@vger.kernel.org>; Mon,  9 Jun 2025 12:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749472807; cv=fail; b=CbgL3JUJcQxGCvgWbjJaYnRLBA814Gah/TaTyyHTTOtBlGKAvIw8x950SG+nl9u7LKd9HzTXQdUOfSeRxiZX3ofqDUSzSaABb7R+MxLL1BvqdSJpwzXmDvXSWWfvvSOONZUtjHVtrNhvDmNpW958jy/1H1pQJAg+6x/HEmfIlps=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749472807; c=relaxed/simple;
	bh=tg2b92XkkiQYs3vagWceK+cKHvj2nmwjRZ9a1VhTxm4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=V6OklZ+Zdyt0mCKY8ycWZS9IWRmJ2IrluMq6csBKgB/8xolQHm/dAs4JvUb3PfW5XZRKb2YNKIuXSEG9gk9iAhty+f+SR9yQtQfRyJrRMKI15vp8sSQdmUiRR4HEBSEmVbmMPTX0aYDOyuSLT12LJbs61F84cPUz6tgvx/oUMv0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=ZFszN1X9; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=rxvEMEzm; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="ZFszN1X9";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="rxvEMEzm"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5595Rw07027950;
	Mon, 9 Jun 2025 07:39:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=gh/ehETYGuT+MlRptAau+VnV31XKkiputfGD7FkWe40=; b=
	ZFszN1X9LT/KQxDs2JYvHK3eF7mmF/sgjDUz8y8RlsQfLxXNA+ckBtNjovna/oKd
	sQUOGiTISEA4EyPk2fFY6U8GJUW1Vk2+5B5eMKoD0B8vHOS5AQuHP1sWkKILuqmr
	d3mziiVw/dYEBAEy51wbnmWaWjIzPXerowqc29OWeLjUZXe3MQLhr6S8GsFCJ98U
	Gq43TLdx/zW3NY69OQWyZ0tRkOT2L63+AknBZsHoAdm1vrxu02psy1gmHAjamowS
	NT4UOExgH1SnJh8G9IDC6Sdhxpq+8G8Yggmq3VbIE0Z0ZQQSYWIEkz39+n0899DC
	BGUgqYDXH4j8Rx/NneJEjA==
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10hn2208.outbound.protection.outlook.com [52.100.157.208])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 47529v1dt8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Jun 2025 07:39:51 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J29Pe9b79cJ0GgRp5UQyL38oCPJZ+n5BuD9EEQG9PwVssKvyqDLxyvS9MEVcftO4kiqkWsTY9tJ/BW01Mv9jwZMnKWSWuMYycczR7p4/wTS5/Fs2rVcykHB9Z6+YPUZmRsTdBC09j69+MVoThaEbaq2N6KFRFIo0G2vaKbch6Lgsh2/p0aK1db8m8jVloyfisUgIt21ZZ5J62l4FBuDjhxCIXpuTSHjYsFm3uVMuDBbLkzZlRpuPUjtzH6JB4OZiWRs3aoc65m/b/BiHdfw8kWKaROXuOTuhz39GWXkVf8aUFAfj+Z4nlPUJP6cMKk8DmnIrenaKYrlbBdHL1utbrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gh/ehETYGuT+MlRptAau+VnV31XKkiputfGD7FkWe40=;
 b=jfWSw3mTtCkplh8XWWav7RbQqEQIiH3osWc9tuZM+NOKwYx6LoGJrIZSRgRYqWCUAu23kihYJgmfLyzr4bhyOpJODVbVThguA55foHjFxhsmYcVuYKZVDzaxYhw7uHaKuxQyCZEsz4OpImTJyIrvqLqaCFTxRGeUdvM9/c9JpgdwN74kJUjPp7cHpMXwLEcoVKarSwt7H1dFJ4Bg09pExIMfMMbpgiTs4D8N9irh+pLP36OWkvkgGobX1Fw0uIP7dnZuAqdyPUd6jRdXiGpzgQO0Dri9kD+2rjMKiNzZfnzzeSmad18SsJVe+GqO5ClVMM9xkDwyIK7+U6tHdqNqwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gh/ehETYGuT+MlRptAau+VnV31XKkiputfGD7FkWe40=;
 b=rxvEMEzmnj4kkcNO0Jo21902A0oXDfK97sdFQjehV+cDokvmrWQwqEJUdphK5J4tiA8QCuuMWzSlsEqrTVuvtWv7+apWALuqd9ZrMY+VBSvchATH9GDUj7Z8GJ//PUV6EizY6ZEkOY5XNzmFCdGTc9D/sXMRsiJZNSYccdgGl6Y=
Received: from BYAPR01CA0046.prod.exchangelabs.com (2603:10b6:a03:94::23) by
 DS0PR19MB7441.namprd19.prod.outlook.com (2603:10b6:8:142::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8813.22; Mon, 9 Jun 2025 12:39:45 +0000
Received: from SJ1PEPF00001CE6.namprd03.prod.outlook.com
 (2603:10b6:a03:94:cafe::9) by BYAPR01CA0046.outlook.office365.com
 (2603:10b6:a03:94::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.35 via Frontend Transport; Mon,
 9 Jun 2025 12:39:44 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF00001CE6.mail.protection.outlook.com (10.167.242.22) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.15
 via Frontend Transport; Mon, 9 Jun 2025 12:39:45 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id A742A406559;
	Mon,  9 Jun 2025 12:39:41 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 80D3B82026C;
	Mon,  9 Jun 2025 12:39:41 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com
Subject: [PATCH 5/7] ASoC: SDCA: Add flag for unused IRQs
Date: Mon,  9 Jun 2025 13:39:34 +0100
Message-Id: <20250609123936.292827-6-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250609123936.292827-1-ckeepax@opensource.cirrus.com>
References: <20250609123936.292827-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE6:EE_|DS0PR19MB7441:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: f3d42f6f-c318-4435-d222-08dda752b6f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|61400799027|34020700016|36860700013|376014|12100799063;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/E41kH9HMYjjUNx/J7IALN5LRTi15IgJQxhQLTnxPHxM3Ab6lwkdle06rBr+?=
 =?us-ascii?Q?hQcdnM+fn8MzaA652KI1wB5pw2D6UAian2pMUoUmVxTxcGgJqWvOO29WX+Jh?=
 =?us-ascii?Q?extHumtlccKUnt1b23lxTTbdi1mwuhJU6T8zClwl4WEdByo+0NzCgLVjIjJ3?=
 =?us-ascii?Q?gaVHue3baDvrIb6+3lkTPvitDjMm5aj+VIJ8r7fzKmE9quszj7P1Maw1cMdZ?=
 =?us-ascii?Q?kbxKLRO8glMubEcQ6YNxpXXQh6RkZ4hY4n3WJrpPxoiSpVNTiygYuYlWoiiH?=
 =?us-ascii?Q?UMeJCqm9ZMwI2BCeNSBuFfUSQUiPupWL69dHvCkp7IVjSowg7O2ItHZpWR2U?=
 =?us-ascii?Q?0IGFEPjWf18459lk/m/7/3pE0pxWBlrnLstzkz9wB1+YYKsPJExO23H0BOsV?=
 =?us-ascii?Q?T6PFiX3NOFNr4iW0kAofZuMf0CJkimTfT1/IYNwNDODxtw4GDeMfHSuGX6ZU?=
 =?us-ascii?Q?X/lNXYh/KgmTfFwYuWDl6Pagqjjr76LmD6BAhQbEm0YxvXPuyRKyefPm42vw?=
 =?us-ascii?Q?LU10ksTTyXVKiteDSdtzy141R0rQhEmGwmc9qNwHGuBjDYlGzqYJoq0G3ANy?=
 =?us-ascii?Q?+euHnH5dIi9AvcrJ1UqcBlHHLYLlG7yEG7j0d329eyU6dlFW+V7UEeLu3bz1?=
 =?us-ascii?Q?OiHKrSgt08R70XPFMXSBKXzBJ0K9vuJS8YChE4BaJn0Zoag3aaaCgH0mWIkp?=
 =?us-ascii?Q?3GMsByQMV3FfS6fh9afNHCy/JmXfNsx4ReiLyxAzXZNCbLtiocOBKZxG/gw/?=
 =?us-ascii?Q?1rchyPJ2XQ5w3wRmfIntulSU4024FIS67lBtUIN1wZrvLuEhLAkr3s82tq4p?=
 =?us-ascii?Q?BkG12ijLJL3qPduYR9L/8hhGASJdx6nlEd6Dl/qCYBKoLk42uKWyKMXoDvNy?=
 =?us-ascii?Q?X/gqdubs69PGgmREzayUc6lwY4W1rR+iheD7WLIGsPVM5KYXqi8S4VeGWm2j?=
 =?us-ascii?Q?PUxg2OAEzsNuHMvw4BoOJApsri1vul3ISxvovJofCdu8wole0CZBo6c68px2?=
 =?us-ascii?Q?RR7FXdJ/M3pcE1paT4kEFSG+/B720vWZRdj/+KAy1Sb3QfiIq78+bu6ID1cT?=
 =?us-ascii?Q?Js9vgNi/SeHIFRbaCbhRW5N7SFO89pbGZEHMntJW1YpF30ZV1Vbsa5IDeTRn?=
 =?us-ascii?Q?ovdTvDBuPoeXMtHF/coTuGt0ufDE+80YamxQVXvsovrqDYyfYZJapfzdCzNv?=
 =?us-ascii?Q?yM1x/G8mYbJIiB0wDqia7MBzQmb2CznXM61P53qyfeOlPEOBAQI5gYxx19hP?=
 =?us-ascii?Q?+IDQZpZel4/CQhcBmLyZpGZoV8iLadHoIZeTdiexCQfl6r7aq2r7yHx/MnhC?=
 =?us-ascii?Q?iM/wSAfg2F2azHdzJhPspIOVUnz4HsnCkA44SlNd+LuCsuidJa0sWndVICui?=
 =?us-ascii?Q?/H9jesknvAuRiDX9dO+4tRx3KoRbZHDUyQU34EvFuGdomIO3S76RA6xAdh4q?=
 =?us-ascii?Q?xiwRTMj8+/0bq/8klBjJmn+I1CaPwMw2evDDaf15yBgoc9172QUWh9BO/w/a?=
 =?us-ascii?Q?1uDbaIHQ92QoVggtBojzwEuFNlPnzP42pVsj?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(61400799027)(34020700016)(36860700013)(376014)(12100799063);DIR:OUT;SFP:1501;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 12:39:45.1580
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f3d42f6f-c318-4435-d222-08dda752b6f0
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE6.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR19MB7441
X-Authority-Analysis: v=2.4 cv=Jfq8rVKV c=1 sm=1 tr=0 ts=6846d617 cx=c_pps a=LQiv0ulBZbciw6j8JpKLog==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=6IFa9wvqVegA:10
 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=w1d2syhTAAAA:8 a=225VSVDH-TR0WkN1SIIA:9 a=jZz-an6Pvt0H8_Yc_ROU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDA5NCBTYWx0ZWRfXz7VQ/kAY69F0 4ckZhVlLqbnYBnButb52e5BPaM235OC6k6TOqNzLJ3/rqUkf2hoPplJArOjg6vJgH3b+045jaiB 0pF9ogu1nD1MCuKPwK6p2XInL/H471iXjVwmz5BoUGkvDXxKKVz35SbGv6hsklR8+wytKw2uy5A
 7P+V3WgZjEU7ejPaMgJDgZZH6Ath0s+hSlNXaAxSt/6HLt7dtV+kCsbpNYwrA1OgFjM+QJ2tLKw 0cPw1qZ4ziL4gQ0vm7lEZYFruejKHTlCDtYT515xnFhH9fQfNqr4FwTqAhJd4cnHL9WxfJ5hc7K TJb3R1oT90tNyJEuEuY2LNY59WxJPV8R2xfu0vauks4gYR2DeNPp4f/rnxwccgZPYN8npHnC45S
 5yniXRCFID1F2GvmUcEhmD1HexBtFH3iBOlhefWBn2kMKlMWrfz0T2NctmoNmDEa5ADIJa6G
X-Proofpoint-ORIG-GUID: OifekNWJ2oscG8VWSarV_IBu4oI48MiC
X-Proofpoint-GUID: OifekNWJ2oscG8VWSarV_IBu4oI48MiC
X-Proofpoint-Spam-Reason: safe

Zero is a valid SDCA IRQ interrupt position so add a special value to
indicate that the IRQ is not used.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 include/sound/sdca_function.h   | 2 ++
 sound/soc/sdca/sdca_functions.c | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/include/sound/sdca_function.h b/include/sound/sdca_function.h
index e5166583d2581..f208d8f03db4e 100644
--- a/include/sound/sdca_function.h
+++ b/include/sound/sdca_function.h
@@ -16,6 +16,8 @@ struct device;
 struct sdca_entity;
 struct sdca_function_desc;
 
+#define SDCA_NO_INTERRUPT -1
+
 /*
  * The addressing space for SDCA relies on 7 bits for Entities, so a
  * maximum of 128 Entities per function can be represented.
diff --git a/sound/soc/sdca/sdca_functions.c b/sound/soc/sdca/sdca_functions.c
index 64ac264438907..3afe9a24e4e45 100644
--- a/sound/soc/sdca/sdca_functions.c
+++ b/sound/soc/sdca/sdca_functions.c
@@ -911,6 +911,8 @@ static int find_sdca_entity_control(struct device *dev, struct sdca_entity *enti
 				       &tmp);
 	if (!ret)
 		control->interrupt_position = tmp;
+	else
+		control->interrupt_position = SDCA_NO_INTERRUPT;
 
 	control->label = find_sdca_control_label(dev, entity, control);
 	if (!control->label)
-- 
2.39.5

