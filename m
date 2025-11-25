Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1390E327790
	for <linux-sound@vger.kernel.org>; Tue, 25 Nov 2025 15:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764084188; cv=fail; b=Bvw+rr3CxNTepb3bbSKXB5CCYvPCeJnS7zIaztsDhtKsT/jGGSDk7/VgXsaEbgT+YAlzQq0VW93CiE93h2dmpNPN9bm8MOhS0hGA2+ij48ZMfDtHhY20XL4v5AXy5nexPSGe/Z6I0recN67r7+DIPJnay+OhllG90OcYKAyL7Rs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764084188; c=relaxed/simple;
	bh=jaK9mRuHZR8bDzVdGF6lkbmwOhw59vCMPN277LyZL8M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=i0ZZ0FmuZgW18THBJsp1nX+zRfhdd0RlEhzS+i6qUSJFuG/XBSGkUcDtrYvGNh0RQhSsFQgqqWR1nc9P2kLjLhhxe7JwndNAUmcUU81a1d542CT6Aire/FGTg1kSmmhULsdlQiMIQxHjIpI8SYipXu3QCHC1H2u47SdCenc97/o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=ZqFO0KW9; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=fg5PXrLf; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="ZqFO0KW9";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="fg5PXrLf"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AP4gsXq3663653;
	Tue, 25 Nov 2025 09:21:36 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=BMsrGTcGxncKvogy
	6LobffCTjt2i0BCL0sRwTMV9BRo=; b=ZqFO0KW9MEwDxj+s5pSw/rCxnzAU5yNi
	p1dHZJqUp55riyGgiHIXtcCS53L/gw+LyYOzPnVDYd8AQbJ8Ok6yWk73O2T5wKLC
	FDOeFArDSDSjcv6YmWXkB5YwB2/64xV7t8zhNZzS2T7qcop7G0wW9WgzfbdMKkcA
	KEcAoMgTxcdnkyHmOxH93ROT8a1swKPxyOF6JD4oVS7Olgth0EUIpujNV/OoFu4Z
	rJ0OI0sJoWOOZ4OuKvmQpLjjsp1jMr9lzpPFhyWwZpc+nXvwRkw2VnCZplObRZLt
	TV3jXXo8UtQNnoGhc58eTeS8qCrWBCp8Ngfw/VCELVF9a9BEXS5dZQ==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11021081.outbound.protection.outlook.com [52.101.62.81])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4akafkb7cs-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 25 Nov 2025 09:21:36 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FSgdvfB9hWAzgew+7nMRk5M9GDsOViWCdnKduuqan1LWKFVdic3S/51u51rKljIY40gExXbno0B3pu06giut2qrmbajo1NO6wd+53MfUr1uptE8AwroSLIQ8xYcblQAmVW80WkdheuJoFx+3BnneKl6ZsZIy9OmccspKLmc1mGoQt+BSuTS+nEDpNz+F5jFYHv7FgKJeQ/TpaMOiouyE73+TSE4N86T2ROZ2PrxXQ09bBH33nZFZ+/UGZuU5rnjXT2AhAcT+fsAUIIVOqT/2LAeiSfQgTmS6KJEHRMEOyqU3OSfFrqzfhVpFIisC+MkhwL1tWQ1wqAkzUpPAbjhPxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BMsrGTcGxncKvogy6LobffCTjt2i0BCL0sRwTMV9BRo=;
 b=OFYob69IuVj0ey4ZfQCNnl6r/2rL7HYxgDEMjnWzhygzOq28QwAjDiyqRSW7BfL+rWdhxpK0Q5OP6uOq2SNiPG8JinTxOJ/21gtmPfqijwfsLzVdUlDs4XxkpYkdgP+8XD9BwdeJXRLl74kTCayEGYmnxVPTkp6xXJ3x0iBOzRJ+Ycv5oKYRue+8l/lOsbdMISwrBSMOy7BaCO80/MvEyTDgxKB41Z98bvAyu74z1GKjGooK5m1pBuVwEhtS0038bzdyaCIguXlVqEY4ZhOV1ljJGDF421MmB4hYnYRDYQj1nx+RJYxPGlbR/LG+wPRLoA9FCP6BuctVri2bkFJZzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BMsrGTcGxncKvogy6LobffCTjt2i0BCL0sRwTMV9BRo=;
 b=fg5PXrLfyFE1b/18gJcGqNuczW/SRd3n4XxEr1B0REnch7dPWpWCPWlOhBTc8Af9YMIDGYE6ja5PQaiwjGT7GwT/hMBWEefnlTwxbC+uQ3WjVoFvZ+qsnzqEx+rqtW3PVEgEXhlu3UPkJITR2ZUY+3deO+pKt9XDJcaK9bRn+ZU=
Received: from BYAPR05CA0066.namprd05.prod.outlook.com (2603:10b6:a03:74::43)
 by SA6PR19MB8760.namprd19.prod.outlook.com (2603:10b6:806:43d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Tue, 25 Nov
 2025 15:21:34 +0000
Received: from SJ1PEPF00001CE2.namprd05.prod.outlook.com
 (2603:10b6:a03:74:cafe::de) by BYAPR05CA0066.outlook.office365.com
 (2603:10b6:a03:74::43) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.11 via Frontend Transport; Tue,
 25 Nov 2025 15:21:32 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF00001CE2.mail.protection.outlook.com (10.167.242.10) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.7
 via Frontend Transport; Tue, 25 Nov 2025 15:21:33 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 7067D406541;
	Tue, 25 Nov 2025 15:21:32 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 5712182026C;
	Tue, 25 Nov 2025 15:21:32 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        vkoul@kernel.org, lgirdwood@gmail.com, peter.ujfalusi@linux.intel.com,
        shumingf@realtek.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 0/7] SDCA jack and system suspend fixups
Date: Tue, 25 Nov 2025 15:21:21 +0000
Message-ID: <20251125152128.274808-1-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE2:EE_|SA6PR19MB8760:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: d2545045-99f2-4a26-773b-08de2c36518f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|61400799027;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?alyGfHo3XzKybTkg8izqkWqcw9n1JZRqOO4krUHfhCcn4AJ3g9KQFkw1d40U?=
 =?us-ascii?Q?2JyR3+X2MTgxmMQk4h3zLF52ZPp7vnWo+mlMUxcLvfR/0JmNYNuUtvQ0P7q3?=
 =?us-ascii?Q?gdnHjUmcIQlpAVyrczb8/C/+M50ZL83jczu8C6FlPoYFygQ4/MWODftSA9Ye?=
 =?us-ascii?Q?KacTxRTG+GANzbMByhvWRuxaTVOmagGUCKUkf2A4ReToJJj4Expz1aG5EbO7?=
 =?us-ascii?Q?iO+SoBosG3h6PQ4fQjLmBJ996eziOwoxCafRxVp4oDAVsZuIjm8wl5fygh/9?=
 =?us-ascii?Q?YQc771N/sXivDjcuM89fxfOWvunZbQ7MWGGD8f6GXKHZKkTpu+SlKhDiy7HK?=
 =?us-ascii?Q?bFRp5yaJUJC50G5KEopkbJQ2wPllU1bxvZffIqqHOdl/+rH++V2yRvJ/8eAs?=
 =?us-ascii?Q?GU4UY6im1eCUTwr/WH+Ev7PGUU5f0ndis4FfM+d1e1Fwc6uyFCXRNOfImPgb?=
 =?us-ascii?Q?6DGVIH90s9FAkyhQVpvYNKcO5ZPoq2S2k87vQIT2s7NCfSxJx3RrxLEpfMQA?=
 =?us-ascii?Q?9lGDhv22BRAf9SNbTKpcDxQ4laiLzUlGOoDEo0UvD6mvDAu05NidacDyJzkD?=
 =?us-ascii?Q?V8tHTV5ZisfR1ZpXJiWgmYLdyQ7kGrGjjZWcfxnsC2iRGnw1sJmBtZhyRUqZ?=
 =?us-ascii?Q?XJjk1AN+3HTNeiXjQCRYVBDVdYlfnLYdMb7TEYsPLgqKVDW5V9FbgXl9YHcB?=
 =?us-ascii?Q?nZsngxkdZejECct3Ytw0qhJ9j409SpsWWJFY5NLjWGVdqrD5g4GYyoNAGzkZ?=
 =?us-ascii?Q?TP34neUAxPOQsczRslcli9M5NMScgzmNV23nn70yRlwBAnnLm79QDqcICAlW?=
 =?us-ascii?Q?LyUdsxoya59nRe8PZNtOMIVbT36SziCtAxc1VjlBrpI73S4d8htlmpWBkiuT?=
 =?us-ascii?Q?SAXEos5ECI+3SdjWT0RtUXhjzYPoKVJVD2W+XeVCTtV6LJrZX+usED8meWvS?=
 =?us-ascii?Q?LpyW2iGDG3qbsLIO5ua4Scm9eFXuv4cKaA4gGhjT7R1YsMRQGc2Tdtmv0rQ/?=
 =?us-ascii?Q?RmIcwBvZx8JaWIgNmlQBzrpTUJ4jjaZY6y78ICxUSB6VHzc3AeXA7/Jhrys5?=
 =?us-ascii?Q?r4am1XzMB+Bbu1JeZ4MTDidZErYbac+nxqT97ZCpPafgLN1pooKHSepscFgd?=
 =?us-ascii?Q?DTemkViAIY88YbkPZnDk3m1xp9UcSoHOjf9fKNJdllzl86sPk46UvuD0OhEB?=
 =?us-ascii?Q?zjBokMIGgW7mHiFBN5uMzrFzF7es2HJiF4MvcYZHM89OVsyCnMZP6pEk7yX/?=
 =?us-ascii?Q?Br7ZMX2VlhRwpasssjIAB3isdA8LBEd4JcjtXRt6FOrlxH9F1ZoawC0AVoaA?=
 =?us-ascii?Q?w3+X6NvjirIlTCQbxjVLamP3mSCn7IOpuEMS1/2R6Gc7tOKYosDOoflvlvyD?=
 =?us-ascii?Q?ah2AHtidUUEqVnFGJDokOQ0NHYBm9beaCiG5RnZuqNKRVzH1N+jIxjN9KQ7/?=
 =?us-ascii?Q?boXwdYWcMd2TbouXjISCy/7SAYUvLtfPsl+reWXe4gpIySye71sgWjsPJhtf?=
 =?us-ascii?Q?O3YuW3nzLmAp+mi66ZEr04oCmKV8s4zFHYJRfZPA3Nx8f3lVPBfYbcal4mwW?=
 =?us-ascii?Q?9+IcQZamaqmYDE9yrtc=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(61400799027);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2025 15:21:33.8087
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d2545045-99f2-4a26-773b-08de2c36518f
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ1PEPF00001CE2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR19MB8760
X-Proofpoint-ORIG-GUID: QexI4AS8nZ729Ctcnydpc4Juq8T9Gmc5
X-Proofpoint-GUID: QexI4AS8nZ729Ctcnydpc4Juq8T9Gmc5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI1MDEyNyBTYWx0ZWRfX4SZv3tFRBRg0
 KRSVqT1yiXz88+aVVgsiEg+upxAf6flQ7lt/c7WDfnDvfthBaCGZR86vUcibQISm6f2d2tOF437
 o+Itn/I2lcdLXnkkxGXUeNyPE6o7fRhG1Ak88iHsQqIwRs6PRB28C+5ymine2eemGx/DoJbw5eM
 M9h4/GGLfLFeDeDXe4QvGMHyLlIhsFpMn793WKUZPmzXV8Tf+MnQXKu84BEUkN6Pck0K1STGHsP
 Yi4iPRppECatw9oK0awJge8QpaIr76Q165IM1vSLa2ADEiRGXvjIaZe5uxlm7Um1PZauTp0sl5A
 zL27uUBk8/4tLjj1VThCl7TWCRehvic3LtFEt3fzzrre2KKr/lvUTVwNhSeEstzj3j8xc1PbCpk
 QyhimQ6EzsCgRLdDgcU0Vx2hRLSQ6A==
X-Authority-Analysis: v=2.4 cv=Dacaa/tW c=1 sm=1 tr=0 ts=6925c980 cx=c_pps
 a=7ywGlyDdJUFJDTdbuALIzQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=6UeiqGixMTsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=effNIonYQc-jMswTYMoA:9
X-Proofpoint-Spam-Reason: safe

Make some tidy ups to the SDCA jack handling and add the necessary hooks
to connect that to the machine driver. Also add in support for system
suspend to the class driver.

Thanks,
Charles

Charles Keepax (7):
  ASoC: SDCA: Factor out jack handling into new c file
  ASoC: SDCA: Add ability to connect SDCA jacks to ASoC jacks
  ASoC: SDCA: Add ASoC jack hookup in class driver
  ASoC: SDCA: Add SDCA IRQ enable/disable helpers
  ASoC: SDCA: Add basic system suspend support
  ASoC: SDCA: Device boot into the system suspend process
  ASoC: SDCA: Add lock to serialise the Function initialisation

 include/sound/sdca_interrupts.h      |   5 +
 include/sound/sdca_jack.h            |  32 ++++
 sound/soc/sdca/Makefile              |   2 +-
 sound/soc/sdca/sdca_class.c          |  34 ++++
 sound/soc/sdca/sdca_class.h          |   2 +
 sound/soc/sdca/sdca_class_function.c | 130 +++++++++++---
 sound/soc/sdca/sdca_interrupts.c     | 155 ++++++++---------
 sound/soc/sdca/sdca_jack.c           | 244 +++++++++++++++++++++++++++
 8 files changed, 501 insertions(+), 103 deletions(-)
 create mode 100644 include/sound/sdca_jack.h
 create mode 100644 sound/soc/sdca/sdca_jack.c

-- 
2.47.3

