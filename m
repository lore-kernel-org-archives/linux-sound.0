Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D13BB3F23AC
	for <linux-sound@vger.kernel.org>; Wed,  4 Feb 2026 13:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770210024; cv=fail; b=pG7FJ9Eqvv1VNZSb0THQhQr4W/b0NGcA0oBLCAwJQtwbRX5YoYCQGWrOGwXW7Sd8R5G6EyD0pg0R8pT3XgdtGaIqs+B2PrXr7wayD+YQ6wGMc1VbNyEN4TPWulqLrRbr+ZuUtenDBVgJ4cDHNh/xuy09SoBLQsGP1lPuRVpV7qw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770210024; c=relaxed/simple;
	bh=4C9OedWypE3JWekLEbmEomApCIyW28qHy/iEup4y0EM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ajBuLlxKzcldJmFdnrpADySRy+gr1KRjOluo6mFM7QtsZe/uir+QHzCKRN/fS5Fvn4ynD36pCxjywU2BAuJUJl+nr7HT63IFsUYfQfEnZgJqo8n+lCeNveviCTaHpvrZVpiOsY1UL9FH1jZuxwvQjcTe49Ag/WUZATIDQnR/0ww=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=ArOVH5e4; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=ctn8LBAA; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="ArOVH5e4";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="ctn8LBAA"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6143CNYH626587;
	Wed, 4 Feb 2026 06:59:56 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=15wit/aT+78uHYMRnRRYITbZLqabe4/Gf9M26I5/ra8=; b=
	ArOVH5e4Ttlq4ANSn+cWereOxsppLUFeO4PU62Oj8XH3hcMOc5XFW+eR5TOy/d15
	jLkFXBWiftrHWpJ+g3DCAzcMWtxiH5UMOC339kUAaJhkeXfqDYpX5Pa1vkpmJK85
	gOVhpxM3sMZcm4SSwPrhYE/3OhdZln8JJ5BHJrqdJVVRTkIZPfVYUeoqNui0MKgm
	BBkgHvCAvYIayemlypF1d2s/SYyPDAopBTB43I3PXy1Z9v3VSLzARkDxB4tKf36o
	UtBlLHFzYa8206dgP7LuSdj0sf0RwGUYkFW6CPUkwrEU0ymq52QSsEtA0V6KM2M+
	Ekx2O6Knt5b3er+cKsPj7g==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11020136.outbound.protection.outlook.com [52.101.201.136])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4c1f1k4kqe-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 04 Feb 2026 06:59:56 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vlsyB1cas6jtZ9GMtV3RU9p7o0JYhiAsIrMq9S8bYqUG5vgirkRdNx5WGm/wRCuxb1jHviRoAWfn8cTBLznvtAROeb9FIukuKutewmb7hl5SqOtSLS+2T813lV1OZyQhJmj+OI1KmrZJR046wxlJp4q+iiB/71CupkBjuNz1X4JSMw/XUqknzASLCuykBB552KOQiG6/fMcRau9/7BS4zUtX4OXJPVS2xZjSR0uHm6e2GaP2D3Pi6IULsuHUH6QoupAmusF8+f9x3oDXtQ38RvKYY9ZLcxaKFHqPonDjbj30vTi1MrW2rDo3FY3XkEd8NvRdU4lFNvW49uTmvK6+eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=15wit/aT+78uHYMRnRRYITbZLqabe4/Gf9M26I5/ra8=;
 b=y+7P9fc/ZzJyt3j0B3mDpukiyfPPEqMDs8PCTMF8eOkdTIbU3t3Q6msXLCZNFa1aWEA2ELswJMzJtLH1ZpD+tII7ROsPcnsVJ8RLejBOHhtMHeWr1M6b5pp7RIooOGNco10Gf6otxfIzJECIT/LxVubiULU0NjtvjvC050X996EEouho5adngn+JBRj0eagE7XuU1SKTCcLCH45I/DEJQ3vtqZfna+jhKEeFzo5kXbn/cHZiHxh8fC7f6KLlzmJcbEkyDbIt63moKzdanALuOVjDIVLy1m7cHSsC7WRutAD4OC07S2tMJ/d2KdHF9koiDQEDKucZKM8oR5X1ShKKmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=15wit/aT+78uHYMRnRRYITbZLqabe4/Gf9M26I5/ra8=;
 b=ctn8LBAA5Ei3r7/r43EcfFmeCY/ygZ2tc3eFeVpXtJ+T+ReUuvaFlD3YWIR7Jx8lKGNqsbrh8WX2Gy6jQY5UoHm86AP578SCr5n5o5wuVlht67mw6vBz9WELBO08AGCJNcR2QflgdwjwxaU2hArGsXaKbSFuEOjgLThYb7iw0tU=
Received: from DM6PR01CA0012.prod.exchangelabs.com (2603:10b6:5:296::17) by
 LV3PR19MB8318.namprd19.prod.outlook.com (2603:10b6:408:215::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.16; Wed, 4 Feb 2026 12:59:51 +0000
Received: from DS2PEPF00003442.namprd04.prod.outlook.com
 (2603:10b6:5:296:cafe::c) by DM6PR01CA0012.outlook.office365.com
 (2603:10b6:5:296::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.16 via Frontend Transport; Wed,
 4 Feb 2026 12:59:51 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DS2PEPF00003442.mail.protection.outlook.com (10.167.17.69) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.10
 via Frontend Transport; Wed, 4 Feb 2026 12:59:51 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 2391240655D;
	Wed,  4 Feb 2026 12:59:48 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 0116A82255C;
	Wed,  4 Feb 2026 12:59:48 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 4/6] ASoC: SDCA: Rearrange FDL file messages
Date: Wed,  4 Feb 2026 12:59:41 +0000
Message-ID: <20260204125944.1134011-5-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260204125944.1134011-1-ckeepax@opensource.cirrus.com>
References: <20260204125944.1134011-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003442:EE_|LV3PR19MB8318:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: f80e392a-30a1-49ba-9147-08de63ed48ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|61400799027|376014|36860700013|54012099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?nKYhDWMYtcyNzhLR70UsriIon1MNlWAEgRKtJcN4713G3ZBXw+phIbWFEkHe?=
 =?us-ascii?Q?2+N2mLZ0LiDAis+wro+zoDZo63If7k1hURDZ4W/jLbv7jNKmEL8d7uSNWQRC?=
 =?us-ascii?Q?xQ1YZqjUVPGjB8CktTFk7ZapKU/6ZW7rVpW+ORD4uZRPxPDPxFCGeJhzIxuA?=
 =?us-ascii?Q?1X4UGSdvIOTQ18aSmGUrC52wyF97sbqyU5HMNN8P+OmD7W016T2VZIxcPIkC?=
 =?us-ascii?Q?VA9rbLiTIAnR/VctL2SUBIPnwF1bwg9tPqyn6+nD6KtpyLrRSIdKZl/6ujkU?=
 =?us-ascii?Q?W14N409krM3z2Jqiak17mOBS3ql+in0vyHxAeVCzb3OK2wPlKJMLqVx8kHM8?=
 =?us-ascii?Q?UO6S1wQPQWwHPT2rfqtdeC3lYqwRRnKjbc+ZcRDieHha1bGKefs5AOVDN8ho?=
 =?us-ascii?Q?kj+cRzqxcH6bJafhIiwbO0m3NHplBgLFaJU69aQmCLbxolkF5ftWzlgMhNhl?=
 =?us-ascii?Q?uvROFQauPQ16H2NqFWGmrw8CRLkYNoGxvuMXL+/H5GeeT0RGteoHGF7hNJoT?=
 =?us-ascii?Q?cHZ/5+1xSIEx8FOsSzMp+3EyQII2eH96oqryowaWXMxRvQqFELvf1gk+W3P8?=
 =?us-ascii?Q?OAxsWNyio3fPU3j+HNYP0fVf/SMSfseAYwDizkkn/gGVynw1r+53qPyoQ/Dn?=
 =?us-ascii?Q?PSdmKy0bY4MiVEG4dz/yz7XOfjJzLp9755fRUQHs6YKJchwVz5wpeL4a1Z2d?=
 =?us-ascii?Q?8QV1nvHd847uHTnYZGP6DCtBDeAHboQFqliOG+Ix89uy1VGAI1X7iHAo9yYT?=
 =?us-ascii?Q?Tvb3V3+NbsVAP1JUHroeO/94IaaZD9Jmn7QxMjhNfrpZA4xKTH394l7/hze6?=
 =?us-ascii?Q?kPlSX1hHt7Pae1vtxqJCrU/cvM8NSDWWG1dzF+MiN34tOxmQdcU+UI95rf2j?=
 =?us-ascii?Q?49wwt/D0jecdD00dLqdGGRA5hOshBkVieZ0vFfKJo0dStcmN9aegEIEQHH+v?=
 =?us-ascii?Q?eCzdjYjDK4Zay4qcOwxe2Eoq9o5HsJzCxkkZC8Ynd0j0eJL6JT20zOjjgE+m?=
 =?us-ascii?Q?MPaef8dOSSv4q5meW/LGw3/w4RE+OGobsoJUhJbLtWV96N09L+b7yMIteT3h?=
 =?us-ascii?Q?G7ALVpG0SGzxeelJZf8JiSim1106WTGBiyxMoNISFA6EP8F4NVcF439EvAmh?=
 =?us-ascii?Q?uxy9d58nU/EWogTrngSVsMDe5qBKkGLnH7bTM7yy94TR+OYDi8QJbZ94ZSzC?=
 =?us-ascii?Q?ub3ChoRVX8I2LEDCI3P4SozRlGX69qAkJNd5g4l6DmSpEUlmZgyCKTfTOloN?=
 =?us-ascii?Q?bx2APegKttHGNiEsaGHm5RzNdlMYE1zrJQSe1OMRjl7oQnHdNHfTdDv/PKDU?=
 =?us-ascii?Q?9fIXKm0YsVCOv5gRki6w8z6IQdxJRbn9CdTVjPR/RG5cmdY4D/aVUzHeN74c?=
 =?us-ascii?Q?mr7LKIJTE+3QFLKABOO1Z9fXuSEisOLAzTz4AOUWby/Vj5plHUQgDo12dz6w?=
 =?us-ascii?Q?W4i0rXfS2Eq0wNNDMzDICb6wAs1G4ivAwnR47rXQpUpLs4fkH7N53WIiuPsn?=
 =?us-ascii?Q?RsgwaO6GLZOEV5pRUSrq+5pvdkVCeKh4P8nGC2PEdu4eYg/K0ys1mqX3kdtm?=
 =?us-ascii?Q?seqtyDsSvI99rIVblhJj+T5E26GybWGeaU2FjPyn/z7a/0CNX26odLqa8jj9?=
 =?us-ascii?Q?LZAsaW+tKU2IJ7pWQ2u2e6GThUMUCZX+3nDHULopI1WHgvCeA6xyFuBXQ2fz?=
 =?us-ascii?Q?gLsp0g=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(61400799027)(376014)(36860700013)(54012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	mWt43vkP1/OzzwYLvTPnYpi63jkPQ31fNg82DLoAuJ1ZLyYosIfGNwXTSMow4c5LYqZ5NPezsbaQseeCnPXhw0+R97hPaodGG4OpEvxSCgQLjF2ImyTQEwtvUQdtYJFZhABAakZQkPfNz75nwItR9fuDotvxZJc1F7ORNtN+h66UvYg9jtraxwrmxuBRNlrE+uRyFZ+EaFP0THAHYWShmTfjiIIBgO/b//BYHb0erFz08D+g+itvhxAQBEp2/muIAl/ikVlOFNNnVTSKBgfH+5NLABYQcJrTwyrwCJFYS3B0m0Xj1zZNfYCqqVIUQBYNJsUyADBQD84is1kfAAE0tmVMPrvHxPbRtoHB7Wdccyj1uK8s4/Wc5oCRziz3hqwRYBbgMYeN4Cs8OKQWzL/fQEdMdBGzxNZVM+EVp2mHI3YX+J4rqS+Kg1M5nXaXXncw
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 12:59:51.2443
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f80e392a-30a1-49ba-9147-08de63ed48ed
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DS2PEPF00003442.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR19MB8318
X-Authority-Analysis: v=2.4 cv=d+j4CBjE c=1 sm=1 tr=0 ts=698342cc cx=c_pps
 a=SjKxu3n00dGHhKqS4WZ18w==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=HzLeVaNsDn8A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=w1d2syhTAAAA:8 a=zawS4MtHKXuNY26vCcQA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA0MDA5OCBTYWx0ZWRfXzIa/ddf2pkxO
 F1fdE+W/PYZ8yiHP8/3nuq9OG/byDZCPFbprp3Kk65NLIZooz5h42zOAnEKHHysc42rxUe99eyG
 FmlA7A+BVEpUduYvRZSNRd7lJiMZ+Hh7Cq8bVbPxse2clQb41uZ3UWsFfbt4uDvCDNe5Uissz8y
 fvvwQCl3OMNucMDH32YnedS8bE7gqvaD0J/sDEVEpHAGY/huMfaA6O71SAG23U1caumzh6h6Ei8
 308Lhfu02Bz9Z+6skxrnP/1iyo76RrW5uegyZKpeaaJsvF0yPwcS1mJvT20NbW4MqoPQN01mHcv
 gH5e8PpKdEWig7z1XfR4Es9ysD826yxYtTdlGVybQJp0LB5d9pYcJeEW8M3rhSoUKjrfaWDGCJw
 Cve/rFdK2TwP1bw8Kl1SaxeSPTia8MU7Fm3yosfjnLeZekAO9Tvt0Flfr1ZJHJ2sqQZvurP83ef
 MQuHI9GJ0DdTBCREXTg==
X-Proofpoint-GUID: jfVKAS8GFVzejtde0U6Wqu6zJoMDTDwq
X-Proofpoint-ORIG-GUID: jfVKAS8GFVzejtde0U6Wqu6zJoMDTDwq
X-Proofpoint-Spam-Reason: safe

It is helpful to have something in the log showing which firmware file
was loaded by the driver. Update the existing FDL disk file debug
statement to just note that a disk file rather than ACPI file was used,
and add a new info printk that prints out the details of the loaded file
regardless of where that file came from. Likewise, sometimes it is
useful to get a message if the file-sets list is missing, although this
isn't technically an error so make it a debug.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/sdca/sdca_fdl.c       | 6 ++++--
 sound/soc/sdca/sdca_functions.c | 1 +
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sdca/sdca_fdl.c b/sound/soc/sdca/sdca_fdl.c
index 8bee9f23c4739..07892bc3a44e6 100644
--- a/sound/soc/sdca/sdca_fdl.c
+++ b/sound/soc/sdca/sdca_fdl.c
@@ -256,8 +256,7 @@ static int fdl_load_file(struct sdca_interrupt *interrupt,
 		    tmp->file_length != firmware->size) {
 			dev_err(dev, "bad disk SWF size\n");
 		} else if (!swf || swf->file_version <= tmp->file_version) {
-			dev_dbg(dev, "using SWF from disk: %x-%x-%x\n",
-				tmp->vendor_id, tmp->file_id, tmp->file_version);
+			dev_dbg(dev, "using SWF from disk\n");
 			swf = tmp;
 		}
 	}
@@ -267,6 +266,9 @@ static int fdl_load_file(struct sdca_interrupt *interrupt,
 		return -ENOENT;
 	}
 
+	dev_info(dev, "loading SWF: %x-%x-%x\n",
+		 swf->vendor_id, swf->file_id, swf->file_version);
+
 	ret = sdca_ump_write_message(dev, interrupt->device_regmap,
 				     interrupt->function_regmap,
 				     interrupt->function, interrupt->entity,
diff --git a/sound/soc/sdca/sdca_functions.c b/sound/soc/sdca/sdca_functions.c
index f97dde912d590..f38791eab4f16 100644
--- a/sound/soc/sdca/sdca_functions.c
+++ b/sound/soc/sdca/sdca_functions.c
@@ -2029,6 +2029,7 @@ static int find_sdca_filesets(struct device *dev, struct sdw_slave *sdw,
 	num_sets = fwnode_property_count_u32(function_node,
 					     "mipi-sdca-file-set-id-list");
 	if (num_sets == 0 || num_sets == -EINVAL) {
+		dev_dbg(dev, "%pfwP: file set id list missing\n", function_node);
 		return 0;
 	} else if (num_sets < 0) {
 		dev_err(dev, "%pfwP: failed to read file set list: %d\n",
-- 
2.47.3

