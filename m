Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022095.outbound.protection.outlook.com [52.101.126.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFBB52773CB;
	Tue,  2 Dec 2025 11:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.95
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764675101; cv=fail; b=FeNNwZb4FFpxbtnqn/1TrmuiIuaplB+2Yvl/sCAiMpD0iLLo/bA7G1dKq1butYGHLnYR0ABIohKgqIWsvw4J19N0/QXtxh4P3dFcyig4L+4CLBVvOhQ5c0HKuCFgpwikigOvL5/MaGrVVuCRJGX2NFwQMZ8RKpOxUREKRA7UN28=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764675101; c=relaxed/simple;
	bh=Mk4lhNHj0XFjbo9NhTAwyKVOw7IOk8bIfHE7S3BvY1M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=elT4KMLvurNbZViXPoQFDm7YSWYegbWxcfbS8TzdrG0tqWEDu9elYkbuZodIsdogi/FGxxCyaLXeq6EDquUkTPFOQF81F83G9RUr0MAQRfBAvCN0qwQjKN+9RS75VI5xyhKwrtDAYUtHw9O07LgF23+X6xWpsD7oVzc2iawQOyc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=52.101.126.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e1PAnAvBEM0Y6FdJJlCgCq83ogmPVrSF9qFihZwQGlUNp/jPiO+QQJyc2v1iOSxDDwBRvVP/XB/BmXtP0AAVJhl4HA02nd7js7vfjXlG/wQNkTMK/c2adEO1l00Zyw1QjxaiaR9ZjXyi76+gmuvaoBGAosXxGyJzO5icAV97AgIUklJrOH1hfrwMCfcdYTMdMBzGnP30hsbz/qAXTqA402KcRqGIJNSSGW9tge8IAHtFSFwv9oDmhvCH21Hg138gkK5p952bpzHhD8PJmYV4HWd4DFojPM5Pto2jt1YQwTvY2BYZZReMgsu8Ny9jr0q6nBOgJEOqwEieZsN29qfo6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i6VJqhJBQQbWa2nR0ulsXPacp9g8B4mWmNzPGAEZZlA=;
 b=QhwJiiJjVMH5NDR4pd0SkQ/XGGIgTah3cimjp5fjtse9P2j87PZ471D2XDZ4sRRlof37hX1XGsKISzdLWxsCdZ+HqmQyV2sxNFpwD2zvICh1hgOr/9UIcPWXsICIxaLIXMIm/GcZsecuxTh5gHEe2Ithi+Wg8uhrnTsTYYLyN21q5y4BLgHIwEGKZ5qE/59MD50xB8bgCkSHBE2w74X0r1Y9+fdDaCoOPd0YOH1rOwECSFCWclMITXoWIxrvgh1hOrfEHcGErFxZWs+4HqM8pKLX8iqN0UXJBUZo6GsA0wNRRC0HYnuVbHUHbSv7YCKypMtVXHWhGMwE3TysC+2f8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SG2PR02CA0133.apcprd02.prod.outlook.com (2603:1096:4:188::18)
 by JH0PR06MB6833.apcprd06.prod.outlook.com (2603:1096:990:42::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 11:31:35 +0000
Received: from SG2PEPF000B66C9.apcprd03.prod.outlook.com
 (2603:1096:4:188:cafe::dd) by SG2PR02CA0133.outlook.office365.com
 (2603:1096:4:188::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.17 via Frontend Transport; Tue,
 2 Dec 2025 11:31:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG2PEPF000B66C9.mail.protection.outlook.com (10.167.240.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Tue, 2 Dec 2025 11:31:35 +0000
Received: from localhost.localdomain (unknown [172.18.64.15])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 8214E40A5BFA;
	Tue,  2 Dec 2025 19:31:34 +0800 (CST)
From: joakim.zhang@cixtech.com
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: cix-kernel-upstream@cixtech.com,
	Joakim Zhang <joakim.zhang@cixtech.com>
Subject: [PATCH v4 0/3] ALSA: hda: add CIX IPBLOQ HDA controller support
Date: Tue,  2 Dec 2025 19:31:28 +0800
Message-ID: <20251202113132.1094291-1-joakim.zhang@cixtech.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66C9:EE_|JH0PR06MB6833:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 9b3ef8d8-b909-492e-b730-08de319659c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?FnmWvO/3a4+X4CcU/baPuRDKuDMWZq7Xke3BgDGSuFcVwQut1fO8jSPQrEX3?=
 =?us-ascii?Q?V9I6N4rXqi2GrTdIZtukbgUA8+Wv/Ark80lBa7NToZCWMuuqBH9g3e0d33M5?=
 =?us-ascii?Q?czhXSELbPOM07Fru/N2QnH7NIlFLCgSjRL2WFHUnE39ZBeXkaqY6Pmu961em?=
 =?us-ascii?Q?16N32SdDRaHplghHItjsiYTpB0lj5CjzOqCNn2uffsl5LHTDNV2ldeuRBLid?=
 =?us-ascii?Q?pN53Ti3qWCKa5tq9z+4V3m5dfW+8GCZzaZ+QX/LcDkUeSUt8whyCikg3PwX7?=
 =?us-ascii?Q?NyEj/VJo/23O0xHduqk3v1qeAvCAuYa9huKyoBWvW77nLuUUqpCbS7DD38YP?=
 =?us-ascii?Q?9dmm2+2f9JeN3rFgkAoc+n8Ryo7LNQtDNJ909q2dK1lnddWgWlb52fwriEV3?=
 =?us-ascii?Q?6V5ZuC5TE5JBW9WryY6t2jhY5LFOh/YIo/mue2B4eVuFmAwoBmy8D8V+zJ4N?=
 =?us-ascii?Q?kramZK3PXnNHGGJ9wdEpg5PO2kou1+r1VnGvG9Hxmn67HNAFVwhmYk46BZRT?=
 =?us-ascii?Q?LcQ+DGImKkgmLLhjRXVjxcRta/LBtDfbrIc8IKiZCIg+N9EpHxF+v4ag6CyB?=
 =?us-ascii?Q?NPZSqLVZbptEfr1Z+S3rLnv8j0yTo3RO3+LXvNj6z5B3InhrtfG8wMmmgvTo?=
 =?us-ascii?Q?p3KPu30jZFJVbShlfnD4a5Nrj7WiSw8xLDrJoD6jcA8WBuWOORCP7RxtZ9Dw?=
 =?us-ascii?Q?El3Xxs0BiGzq/8kiYZ6W/BOCgEBb2GHatcqCsfGXLsFBXwTUGXGO2Qbh1Om/?=
 =?us-ascii?Q?u426s+I0iWylCo4PTOv+oIdzneXTqQzf8IEJvZce1KjudPWxZUS+aRRYa8uq?=
 =?us-ascii?Q?LpOOmkqsN8XXOmuxdz3btVBKAMGYr78ucXA+IWyA7ShSOb1mKs3YwwXL4KQF?=
 =?us-ascii?Q?q9cM34RTOUlOtaq3KM+uQxbkPQ5bh/hXZKiBnZcKg91SrI54GmpDTLRTtSfP?=
 =?us-ascii?Q?gaIMGwBoXxlDzuLvfpWjE26x7wca1jLlTTOz4EuTAzqsIPve9LwaEbJ5vQoz?=
 =?us-ascii?Q?TQMoS82Q/x6V5TiyC+o15AhOT+E/3k52OHRv/TGMOHoQR29NDxYp0yfJNptI?=
 =?us-ascii?Q?mvQWYsCgMXCwBytcglb6ECIhaJP0eAsZXsk3ST920xXBTNtliC+n4rPxGzo8?=
 =?us-ascii?Q?06uBWRCs6b4/TUwqhJkuSL4/Iy6MD/psJAqhHN2mLjSwudQI5W9YpllPmpSK?=
 =?us-ascii?Q?KvisnZ3Tp6gu6i5saasys48N6lLOdG1V+Y/R6+IWaiy2F3AC56QD/mjGu7oO?=
 =?us-ascii?Q?aHYwySEkFWXzwLSNWGbU8T1YQGYfmsupLcmV7n50QXQj3+XDg3lPJkb6jeA4?=
 =?us-ascii?Q?m/flJh+xOG+Bg+R2mFZSENjbxTJRej3gBso9ODF64UIz1QKpBmLIxRrImBrv?=
 =?us-ascii?Q?lzFKt3SfLcnqlAUAT41D5tRyrr9HOpIu6uI3G6OCg+B3QLJVXMbN2iz2F2Pa?=
 =?us-ascii?Q?u9hc/RbHk5ttl2Yxv3bfZauKqaKtiLmHLjvQ0UFwWsCs3B2G/AN85kBfEwQ7?=
 =?us-ascii?Q?jR5Er4eXe8kh5GDCtd42xGODF03sAM9QbvnW0Bn89n2o/zWLS3piigqQII29?=
 =?us-ascii?Q?gXNgNxPoyMpXBQjcbqE=3D?=
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 11:31:35.2607
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b3ef8d8-b909-492e-b730-08de319659c7
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SG2PEPF000B66C9.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR06MB6833

From: Joakim Zhang <joakim.zhang@cixtech.com>

Add CIX IPBLOQ HDA controller support.

---
ChangeLogs:
v1->v2:
  - fix dt-binding issues
  - remove delayed work for probing
  - refine dma address traslation
v2->v3:
  - update dt-binding commit title and message
    - ASoC: dt-bindings: -> ALSA: hda: dt-bindings
    - use full sentences for commit message
  - rename cix,ipbloq-hda.yaml to cix,sky1-ipbloq-hda.yaml
  - update compatible cix,ipbloq-hda to cix,sky1-ipbloq-hda
  - "cix,model" to generic "model"
  - change the addr_host_to_hdac bus callback to addr_offset field
v3->v4:
  - describe more for both dt-binding and driver commit message
  - remove __maybe_unused for pm ops
  - fix robot compile warning for 32bit system
    - Forced type conversion for CIX_IPBLOQ_SKY1_ADDR_HOST_TO_HDAC_OFFSET

Joakim Zhang (3):
  ALSA: hda: dt-bindings: add CIX IPBLOQ HDA controller support
  ALSA: hda/core: add addr_offset field for bus address translation
  ALSA: hda: add CIX IPBLOQ HDA controller support

 .../bindings/sound/cix,sky1-ipbloq-hda.yaml   |  72 +++
 include/sound/hdaudio.h                       |   3 +
 sound/hda/controllers/Kconfig                 |  14 +
 sound/hda/controllers/Makefile                |   2 +
 sound/hda/controllers/cix-ipbloq.c            | 438 ++++++++++++++++++
 sound/hda/core/bus.c                          |   1 +
 sound/hda/core/controller.c                   |  12 +-
 sound/hda/core/stream.c                       |  10 +-
 8 files changed, 541 insertions(+), 11 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/cix,sky1-ipbloq-hda.yaml
 create mode 100644 sound/hda/controllers/cix-ipbloq.c

-- 
2.49.0

