Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CDDB2571B0
	for <linux-sound@vger.kernel.org>; Mon,  9 Jun 2025 12:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749472803; cv=fail; b=XUX/4pb/RcjacYpujVWitBvE7Obheuv4eoywukDaZtobx4iJhbUQOot3n0eRojrKQtH1fXhOcsugRTJmV7FZyTg3/7Po8zOrEEalQUoieJ2HF7t8VYc3Xffmz42E2LSWe8OejOgocLfjHWKjttV+XThzC4YVQdTXhXuIVzdQWwA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749472803; c=relaxed/simple;
	bh=BDQVqdK7rJv15rsP76Dxq4oODdfUzP5CvuJty5MdiLE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=ol/wBUHY8goN9GVFAvTppEfoCWfs2fO+y+wqnyrx1nJd+bEAcxR7VtKeDp6qv5qbF2FjndJCi9KCzj4/DpT+x3mzpD7ZEpe3zfdaiqNJ7UxEk+VVnNSWSe6rou7v3NPeWaP1stCUNulur9lzaHzBZg+6hOnrs67LqDKbw/jpDjM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=OrWTUhBE; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=ET4+hdxf; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="OrWTUhBE";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="ET4+hdxf"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 559BWC19029240;
	Mon, 9 Jun 2025 07:39:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=kis7Mz4hCZzhaDi+
	LZy6eu8cZwh+3jdJ73XH23JM4uA=; b=OrWTUhBEyXy5V+CETDZZBBMUy569RVA5
	B6ETMJDTmhLUiBm/pRcBkMl5nXiMllmkA41vDgJ2wb5N5rmsbFAGhqOZZw0qNdIt
	MLvoqUx2JqVVBNQbZ72CIoCFEiNvnGohS5C/EmZTP9BCcVBEEPK4jVf5r3Xt8wrI
	9LNSLeBwXUDlnx9Q9GiEJSJ1iLbGcD7Szn46CJhnh8lyIg0KOYJ/jEHjYL6/ncLf
	PHfi86f+X1eXmVheFcrTU1hf/Cqv9YbbCGM/6OWqeNekBbfbkiZGicbKVKRtGKr/
	sDb4WPVDAEnzh/hzESEhlDGLN0StA8T2TaDsH31RiId2RmCSjbQGQg==
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12hn2229.outbound.protection.outlook.com [52.100.166.229])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 47529v1dt0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Jun 2025 07:39:46 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ouYdVzAthcZYGfn83BOoshlcpjuW+J61DldX60s850ewzF72qd76QbbKoPAaC+8m0l9U8rPKKGi5lk2MlfbPWQ/l49K7Ar6dVvHg7vR9Kr4aUr2Cett+ICj9/QM/8lmX5a+JWAJh+GD1S3YsIAb6UV4Ox6kBbe/URxD9CPrOtoZVG9z/B1KQt6Y8buHjXeHgMAq8rMRHRmr+Ut8MlQFNRhN0n79LSZe/nl/5CGqOogNX8MvxoQFltSCuBVZyjEVieNCHw2hsG1prZurzHSRh+KU/zb2xx1KOlMX4+zxqiv8ToRYPg8VX785FEhUZr8K4qg40rOvBsyysrrmjSAmGEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kis7Mz4hCZzhaDi+LZy6eu8cZwh+3jdJ73XH23JM4uA=;
 b=Qbx0voarOND6wL0r36BIu7JLD+Q7j+k8x8kEGe7Vyp6uVzw9HvoIpLZ4+dD3y/orH7pZrJKBswC2kcg1UaEsAHk7iGLiXwfXgYDhy3yNznccvmzotYBoDt5QJK4t81wWq5rsN3OxvgHE9n8z+hmt1OUfbkD9qLY7Ii8EqKS1VZ+0+ppgVFY7XwCRL2wlurY5mflBDaAeZwGBGbibdOxdHqpwVZ8AOmHz2sJkHEChlUoMk3Grtbmk3r0vFuO/rkErzCFTxMvC2K4Ib1cXbL9UG/JtQFNVbw/mlb/CgbxN4oGRT7gtGcJzBvx244JEyfH4PqQBJLZrQEr+efNJju4/dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kis7Mz4hCZzhaDi+LZy6eu8cZwh+3jdJ73XH23JM4uA=;
 b=ET4+hdxfEhcQW+ratfc++9ES4eqW8ggCr34Qli2BTUVXaIi/iP3BWVpuZW6CgOASiDmnXtLrniGG84hiha7YabIyxTi33lS8UQYa9wuXAakAtUGqdZqjsfOTJjMsNfyCgX3xLcqV8bnUglzs+2IYSByP4DAQCEfwyv+ZCl5vyVU=
Received: from BN9PR03CA0675.namprd03.prod.outlook.com (2603:10b6:408:10e::20)
 by DS2PR19MB9176.namprd19.prod.outlook.com (2603:10b6:8:2b4::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.17; Mon, 9 Jun
 2025 12:39:43 +0000
Received: from BL6PEPF0001AB57.namprd02.prod.outlook.com
 (2603:10b6:408:10e:cafe::4e) by BN9PR03CA0675.outlook.office365.com
 (2603:10b6:408:10e::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.35 via Frontend Transport; Mon,
 9 Jun 2025 12:39:43 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BL6PEPF0001AB57.mail.protection.outlook.com (10.167.241.9) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.15
 via Frontend Transport; Mon, 9 Jun 2025 12:39:42 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 8B4BE406541;
	Mon,  9 Jun 2025 12:39:41 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 6492382024A;
	Mon,  9 Jun 2025 12:39:41 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com
Subject: [PATCH 0/7] Add SDCA IRQ support and some misc fixups
Date: Mon,  9 Jun 2025 13:39:29 +0100
Message-Id: <20250609123936.292827-1-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB57:EE_|DS2PR19MB9176:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 097b053f-12ee-40c6-865f-08dda752b58a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|34020700016|376014|61400799027|12100799063;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?adNck6CIcHy6/+7ULHHwBZ+F0YaRw24YlpPlz8A0g2csCdRCqQSMxs9Ul76G?=
 =?us-ascii?Q?KadZTof6pwDMipXxfjdnihyHNp5OhbvwjVmnxyGSACov9xWKH78QfZ9y5L7I?=
 =?us-ascii?Q?aAmKnQ2pJAD8AgpFFCnNPY6P4mIAccrGcKstnJtnIQumMIiKY6w67oK5/mcJ?=
 =?us-ascii?Q?dHkUNGFhL4YlZSAHuNHSXT+QTyXTH63A1Pmkp1YyBOe0kjvIWr2zN9u8hN9Z?=
 =?us-ascii?Q?WkY9BJaZsF4iqrDucKtmXtz6+UmgWDJchoQLHNqJuIwfrxs/ZntQSIhC4TY9?=
 =?us-ascii?Q?yc/bD+IhV2SrILsGCXRV3UyezB2DiiQdk0sMjiSgYOlNsiMW2NgKSo9QI/2y?=
 =?us-ascii?Q?ykmV45s0n9xCjnCPFFAzY1nKEbhRH99tUGNhe0bGH6ZD2Lq2fOJ9u58w2koe?=
 =?us-ascii?Q?ZDuk3H5t2xbIwEH3g3FHj1lH2Upkm/8UZOzMQRBZQfPgXseZa81sjPbCslQV?=
 =?us-ascii?Q?GlvQ8TRRxCNjPelZRU23qWr+aelvQ5fkdcbVj+OM8n5k6XSew8aJDE2/3Jv7?=
 =?us-ascii?Q?ctSbgi4VJJxL5zaKs/p9L9mZGtki4SSKMKcnWcF2l7dzpl55nkL+aLlF7ocz?=
 =?us-ascii?Q?aBlP8hb2rC3fBkxXZutTJvzO/qJ1tA62r6SBG52ArmAC3DKmiwGjDIRNRMTg?=
 =?us-ascii?Q?6djj9QZjt8rXfwitn5N3G1lzWPfOOGFbHl1HkmZ2MP62UxhWMCt63ugy7IJj?=
 =?us-ascii?Q?RyZDBwx2XZylWIDNr5GnqIUgGquQE5iiI/j27g1ESntJPj34EmAdIBcEu9KT?=
 =?us-ascii?Q?SuuNY/VEgBI9gI77Xi9ADSaWErjN8SerohReZ/JSkd6dc7NlirBO3TXGBzka?=
 =?us-ascii?Q?hYd0HUk3kRnFvFUIEeign7D2kVsjZlUnopjKkeQblLU7k0ZzFoVYIY06hsNL?=
 =?us-ascii?Q?wwAQntZLI6lrQtfU3HVaEXuDg8bxe4OZ0Y0OB2n1+NUsmW219m3yC5YDXqcj?=
 =?us-ascii?Q?myS2FBjgAiXJH2I4NbKuH4uPDrPsysNPqU2y6yLjbT+LiHGcncipIR31YXpq?=
 =?us-ascii?Q?iqQEnSpJmk2S3D5RZLC6IORoj5t10eKCcgiKbWfjiOATzA0a7cgOBXsi3y9X?=
 =?us-ascii?Q?jlRhzfS7gCC66jR64GhNeTToc4mYEKJ6pN6yjtDtljRyFbfISJ0wXgVjQQvD?=
 =?us-ascii?Q?h2/omz+D3Xnb5BvBdYU0qaWzN3ZIQ6ITncS50PmJa0x4ig5PIAILiPEWy469?=
 =?us-ascii?Q?q2/EX93ujdSGw+36nMl31K6ddUVV/ydL/q39miwE2PPR350v/TRaC7ybWhVX?=
 =?us-ascii?Q?fzbhbhvkcfg0r08Mup2asUVEYvrIzrOqf7PL2JfGB1cvohNfQWu12aPD49Pz?=
 =?us-ascii?Q?DHURYFieL/CO/F0Yy18OGxBpzfa2n1y6KhdyRvD91R3wSqgN+hslbbfpTgL2?=
 =?us-ascii?Q?H3Nhmtqy3NxpxSR6UQwtg5WjQ6rRqrvxPpFl/Lxtbg3z+bg+At3I7sZHh3/I?=
 =?us-ascii?Q?we4+so0T6722Y+AtG8c2DcMDMIX305qv/O5wUebkx7/N+HF2auV6MUnAFIeF?=
 =?us-ascii?Q?DesV/rcLqAgtd6Owru2PjxHP8MDlFbU3mtBP?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(34020700016)(376014)(61400799027)(12100799063);DIR:OUT;SFP:1501;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 12:39:42.9314
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 097b053f-12ee-40c6-865f-08dda752b58a
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB57.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR19MB9176
X-Authority-Analysis: v=2.4 cv=Jfq8rVKV c=1 sm=1 tr=0 ts=6846d612 cx=c_pps a=lZIexihXIO3kCejwX7i+EQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=6IFa9wvqVegA:10
 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=MoMhrUrNNs-eAUOLZUoA:9 a=jZz-an6Pvt0H8_Yc_ROU:22 a=VlVynqX4KLlZR1Cn4-IV:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDA5NCBTYWx0ZWRfX1uz9F6dbVXCX 0DvJNUxKzqYgDLV9U+GiKE7TsxkYgad0zvse5wBXvdeCwaYZiBxEaQdp7xEYrpaWzxtfhdiswsE lCPHwco5SLBMnxMt5wBjUUSrbXMEV2OzaNxo5zd1enpgIY+9cHUcHlsqCczeMaalvvYK9VszLQw
 tQYIDB0hatECF7RVvbaKNBEh3LRNJqS1J9O3s6qSfFyjUTW5s+CWqHzLM+r+thG6qooCgGs41cl 6UA/Cl1jCas0TbMwfFSXhGHqN7sZOi1kdoRnvBrptM9c86tV8CcgwBsLwJyU4ZD5gaBGyEgkPGB CvlaCf0CFo2B7JR/gQXWtuOH811y3bwxbzCta6+VAlVIFnbvZuigm68+KlewBXIkXKyeOFF8YN/
 KEMh22/t/t+Kn/Yrj1Ui3geF8BMz9GMDksRY5/cTOSCFhx462c6BtSSYxCP8SvSFS52BxuWv
X-Proofpoint-ORIG-GUID: mhRmuRfc-_IyxveWMRkBdnVGvEOpGlh-
X-Proofpoint-GUID: mhRmuRfc-_IyxveWMRkBdnVGvEOpGlh-
X-Proofpoint-Spam-Reason: safe

Add a maintainers entry for SDCA, do a couple of small fixups for
previous chains, and then adding the beginnings of the SDCA IRQ
handling. This is based around a regmap IRQ chip and a few helper
functions that can be called from the client drivers to setup the
IRQs.

Thanks,
Charles

Charles Keepax (6):
  MAINTAINERS: Add SDCA maintainers entry
  ASoC: SDCA: Add missing default in switch in entity_pde_event()
  ASoC: SDCA: Fixup some kernel doc errors
  ASoC: SDCA: Minor selected/detected mode control fixups
  ASoC: SDCA: Add flag for unused IRQs
  ASoC: SDCA: Add some initial IRQ handlers

Maciej Strozek (1):
  ASoC: SDCA: Generic interrupt support

 MAINTAINERS                      |  11 +
 include/sound/sdca_function.h    |  11 +
 include/sound/sdca_interrupts.h  |  77 ++++++
 sound/soc/sdca/Kconfig           |   7 +
 sound/soc/sdca/Makefile          |   2 +
 sound/soc/sdca/sdca_asoc.c       |  19 +-
 sound/soc/sdca/sdca_functions.c  |   2 +
 sound/soc/sdca/sdca_interrupts.c | 437 +++++++++++++++++++++++++++++++
 8 files changed, 560 insertions(+), 6 deletions(-)
 create mode 100644 include/sound/sdca_interrupts.h
 create mode 100644 sound/soc/sdca/sdca_interrupts.c

-- 
2.39.5

