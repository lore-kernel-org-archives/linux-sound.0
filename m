Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C95F9383A5
	for <linux-sound@vger.kernel.org>; Mon, 12 May 2025 12:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747053793; cv=fail; b=O6GPRnUA2olRIRYiTt2b/eqvxoxAubb8p0Zyh8qjqdtulVjlMKR/05canvn6cZELTOLsBCU9EGqPvJdjzgf5Q4/BBdGB5nYh+tPX4WMKBIV4g40GfWy1XJU3iVVuIc9WSpj4oe9XBg+OUmhLdVEmCNLMchChM0TKbbLa1Sk4hik=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747053793; c=relaxed/simple;
	bh=/mL6r8d87Lt+g8WGQnNFam34fPFpG7augay5LMIKOUM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=aQXN78pB/KSONWFayCwL9J1P7SIWl8zqqb5TNL75xmUBXG4JazlK8vkJp4EF1n4IJVC1CRpeB3gSy15L/l6t3ezkU1oibGZ+cdCvLzXN2RSXlL9eXJfGYEIoF6WVpEGhbAGbjlQ5I8/hURhteMC+tyvbuczUzvYleXSwC9iPqpY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=jjXjlNCN; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=i8JTxX8v; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="jjXjlNCN";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="i8JTxX8v"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54C6H5TR014403;
	Mon, 12 May 2025 07:42:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=rCEWWiWrSIk0izsl
	iFk9YTa+1K4RCE4gm6isY47IuME=; b=jjXjlNCNkrh2ZFzhjFNcElFRTbvTohly
	fJKWZAlJ35tVIzuqpjh5kS4Ms2QIYDD6XbtGR6NR3PfDY6ycSJU0prhfFzDqGSxP
	eXYOxR5YOpHSJvOlg6KgEbYqFo/Zd0zawuBxVKNc4eWtDNgxIuY3sCEQ2xwH8Cjf
	E2Wk+nbcLFKpwXaUroPuVl2zcpHFZ0ZJAUhmDm3avDUAmmR+EEr+KcC5/8RjJd6o
	bKJ0UYZqrtA8bXEZexD8kG4Z8tufWJ+gxOnSdPusrwC3LnJ6Xa3Y3t/5kXui+DuN
	lgBoE7zy9+oYFGC+16tn3sJ3jjSXfbk45BjvOBVc/30ctQ2PbLuA6Q==
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2040.outbound.protection.outlook.com [104.47.74.40])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 46j37ga8n3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 May 2025 07:42:47 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gBgaJ3E1NTBhYDLbnETt9Fyk3gxivCf+sJ6hARrvhL6Ef3LbN00TXZyUugCWHTpG7dCKrjoxxZLEbu2Tj7+Xvio0qF3VDx1MIOv5JcRZMI0vK6Z7gQJVXiYbwYxJCEGZefmBHcRq/rZ3d/eEdpybOMQq2pjSRyt4vMOVrz0PfGPw3r1jtWlgqg627X2WSCMxdvrnjF67WGXvXxJXRvtkhM85zvGnREJidzB1cqzAtHDpvaKIIGDFqPC4+dFOM4t9ACR3iMxQY8VJpEEaRbsmBSH6kUGOlo5jm45Z5ab6Yg7ZZzY5OCTj+lUmgwuMYvxSRNbfu++umNdG1CdjXCMlCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rCEWWiWrSIk0izsliFk9YTa+1K4RCE4gm6isY47IuME=;
 b=ItjCDuIBOL5uoKDWeX1QhRdu/S7J6WpAfkCNVlD7QgAbzpSJmWOdr6EVgsVHnOFMJKbeatVbspfB0qz6Avgz9SP7zMXFApC/1xF8AK1PY+Sc+1EpRjm9h5IAfUCydUAIahrt61FfDKUW8q57z/OPe0pz/fObOxcyZ0vxnIbXhpBdYP/tr77r+qUK1eLuqM/gepuCM2Utu5X7fzJCSnfgzWLgy+ciQCwv4G+GEHHlY/g9+mjgBKVEE06WmkKIfenLJSJcRQDpSFMkTbb6elOjrkKLq73ykzJOoxWWSbusequkV4CHRAZojpEuWcBtsd0sSKGnBURo6iiW6MHWEj1z0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rCEWWiWrSIk0izsliFk9YTa+1K4RCE4gm6isY47IuME=;
 b=i8JTxX8vyl0Kh9ByN3YVITb1KHqKcTO2ptP6uBGVlaz4Ya5DWeg9+ibLHQJUh+AgNmGs+lohDIlZ5B0uveQleog//ItOrE1X8k1Uo+XkWI0xYSdyvnpAUApvqovdH8mW7120SQUO/zR4BHOgzOMkEphhZw+AosnjHx3nnnosmug=
Received: from MN2PR22CA0011.namprd22.prod.outlook.com (2603:10b6:208:238::16)
 by MW3PR19MB4299.namprd19.prod.outlook.com (2603:10b6:303:4a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.21; Mon, 12 May
 2025 12:42:43 +0000
Received: from MN1PEPF0000F0E1.namprd04.prod.outlook.com
 (2603:10b6:208:238:cafe::cd) by MN2PR22CA0011.outlook.office365.com
 (2603:10b6:208:238::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.31 via Frontend Transport; Mon,
 12 May 2025 12:42:42 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 MN1PEPF0000F0E1.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.18
 via Frontend Transport; Mon, 12 May 2025 12:42:41 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id E1CF3406545;
	Mon, 12 May 2025 12:42:40 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id CAA40820248;
	Mon, 12 May 2025 12:42:40 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        peter.ujfalusi@linux.intel.com, pierre-louis.bossart@linux.dev,
        linux-sound@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH v5 0/6] Add DAPM/ASoC helpers to create SDCA drivers
Date: Mon, 12 May 2025 13:42:34 +0100
Message-Id: <20250512124240.799509-1-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E1:EE_|MW3PR19MB4299:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 130734dc-5225-4010-e5b8-08dd91527c8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|61400799027|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?FW+DjCt22qOzXm39igkujhnqxXrstUzo5zJcNOZjIc28aRbre0DYcIEmkg5P?=
 =?us-ascii?Q?LAC+AgOZ11ZWKco+n73MbVHuoHO4hi+3plKU7SZL4RozT+XZhlchnhsXL1a9?=
 =?us-ascii?Q?KJAFV0Sx6OhS+6R0ry4fEl4qj175B8x9jF4HRvmN4vHTk2ejsy6fIWC3ClW1?=
 =?us-ascii?Q?DF+UfHSKwNQl3CIzTLuImfThyPPQ7Zxf2UcGxFUXgDo1CesFm2Vu+fF/hPm8?=
 =?us-ascii?Q?6RW5r0GEtqlB6ccR6GBfZebxi4Ce+ilWNUKPLmvQ3oW+TNfnQWQvHoW3lztb?=
 =?us-ascii?Q?+LEG5JVPOlXq11U6TzO7M3M2yoNuFriwM5OeBsqqmomhBpUiSaYAtOgQsB7L?=
 =?us-ascii?Q?VCfvIzLXTcbnCvOhIhfcI6cXK/RWQVwkWAC/UDvb+F8ncFQwCzwg2FM+gU5O?=
 =?us-ascii?Q?K8FL1Y3mO+LzWCMN8VgbixRDUrcykSAkWWDDg4Pj/iSVO5fCPydsVz3hNThw?=
 =?us-ascii?Q?OLgVydnYwgXaqelq2fUMLwXxO+/fDuT6PhTRSvqAVJwLEcjzRFViUsyPeI08?=
 =?us-ascii?Q?qtWuqJKztmVaIJHTW8hzMVOaOEab4Kz4UiRRbGBZGtZjnJDaaLAJicOQr+Bz?=
 =?us-ascii?Q?Bxv4PXhKxiVKspDeOirRT+dQfUnCbgo7PupxfpZfq+iU4Jt8T6JS93OARtZi?=
 =?us-ascii?Q?6qe2NmKIkyoBQmss01vuUuK94XHNVL2Phw4oE5EwIvVfLQosPs0JcUSJakel?=
 =?us-ascii?Q?SvKOIFuYxA9tVBYxHrHxl/nSgrVfht7MmsV/fa8XYB3lNF5tNguIcSIC707i?=
 =?us-ascii?Q?doLju81ddJDF0k4241qB4z9XQSBMY1UL5p3rQQSWuxwCAuUQIqEBGAOKy2XS?=
 =?us-ascii?Q?piOaZ9Cy/YNK1zNcXz91Pmu5ekuH6jB4md0ch83nxLGJPgwCSFLkonO2/AMM?=
 =?us-ascii?Q?DZAeBVOusaU2gpsq5slkDELObGGQV+HzOes3k+sK5J0jsoP6aQ7xGk5u/TWs?=
 =?us-ascii?Q?FV1LEQhtc5v1Xob31SU3OHJZFDOEySGN1rtJJ+yZsQwIRTsXdIDeHlGEa3hz?=
 =?us-ascii?Q?ojQCeLGIiQdTzhl2pdH/Ctvzj84Mc16Ikedwft4nFGlzLCnvynCMK3iZIxJx?=
 =?us-ascii?Q?a6cCUom5iH6PO6IZhWQv5heYCBrgf7GRoKUtDR8l7w+EHOSvh7vBNMznZOlQ?=
 =?us-ascii?Q?3BsL7BJIAbsFpJ6AxGttYi7rUX19ZveM4nLS5Q8AN7d1VYQaND2bCN43ldA0?=
 =?us-ascii?Q?yiwz2Mbvg7w4eellJ9vdZtLfSPVq9/fIZwlcQb1ObmmPyq8wYeaMysszQwbC?=
 =?us-ascii?Q?xt9V1kMeTLJ6fVKzKJs78X6xp6qOCffh1gFbLo6tyz8ZX/HKamw3lhfNmIWx?=
 =?us-ascii?Q?yy4mcX5PGG12Y0p2e8UwyD2KY9xy0TVzfEHEAU00YSGRucemC3uIb62IfkTx?=
 =?us-ascii?Q?kWkv9Am+T4BcWFKgq12a/6rY6kKpQ2wfdodUbn/KuMv786Cu8Gz7z+Wgaj2S?=
 =?us-ascii?Q?JvxgCh3DjDD0q2v5vso9rBfJdHOR7ItynPyXxWLcOVilc2OnhrRbZHBfDu9i?=
 =?us-ascii?Q?njqA/ZUsyGfIwAYmOklpqboxdS9fyV865JuP?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(61400799027)(82310400026)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2025 12:42:41.7421
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 130734dc-5225-4010-e5b8-08dd91527c8d
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000F0E1.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR19MB4299
X-Proofpoint-GUID: T0AnjmUhKWrjGTbCzZDUVlTT0X5wI8ML
X-Authority-Analysis: v=2.4 cv=BOazrEQG c=1 sm=1 tr=0 ts=6821ecc7 cx=c_pps a=ZeveGGZnxkNpWlA7A6AaFA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=dt9VzEwgFbYA:10 a=RWc_ulEos4gA:10
 a=j918JeiZ1VQ21_R4FBEA:9 a=BGLuxUZjE2igh1l4FkT-:22
X-Proofpoint-ORIG-GUID: T0AnjmUhKWrjGTbCzZDUVlTT0X5wI8ML
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEyMDEzMiBTYWx0ZWRfX/q/hMRcR6B/R oKA8C3+hf3u8kztBpRERduVFsT4IenEMIrvqqpd7DbdPntYDtZ7c2woonBEzSnMhGYYhq+mqTXM Un/gJnb8jnWGLKvFXZFS9/AJF96BIq2eJPA0iH/Dw+HOty1HvPea2DAJB4eLjHUL30mEmfDIQAu
 feD0FBdj5krtVccDGLSKf9W+6dyuHIJPlLK8WM7uBHPqzoO2IOdzjxY6mSPIM0QgBgTCQWNaVVZ BTRVeXXW/Qddg+nFpRVE2xMsOVqXDkbf0E7RzDVbq4pGAocXj9ln2HTGW01vPQ3xhzEBauUa8ul 56ypZ6VuoGd4AYbKxJYEdXimOvuVv9P15UIoSXurRRdhsF3Bmr/C0CEnZ3HOgZ8Od/yT0CIB3wM
 Qw8zGpp7NNfDZQuX1L0T60v6U4ZY9NFxiKRlnPtgzGpD5FAMDrokXPt/XpbeXvhoHyBtTI4y
X-Proofpoint-Spam-Reason: safe

Add helper functions to add DAPM widgets, routes, ALSA controls,
and DAI drivers, these will be used to create SDCA function device
drivers.

This series should provide most of the core functionality needed to
get a device registered and have a working DAPM graph within the
device. There are some features that still need additional work, these
are marked with FIXMEs in the code. The two main things are SDCA
Clock Muxes (not used in our devices and needs some ASoC core work),
and better support for more complex SDCA volume control definitions
(our parts have fairly simple volumes, and SDCA has a large amount of
flexibility in how the volume control is specified).

The next steps in the process are to add helpers for the DAI ops
themselves, some IRQ handling, and firmware download. And finally we
should be able to actually add the SDCA class driver itself.

Thanks,
Charles

Changes since v4:
 - Add include of soc-dai.h, this should be included directly.
 - Remove unnecessary MODULE_LICENSE() and MODULE_DESCRIPTION() macros.
 - Move the error message into selector_find_control to better match
   the other search functions.

Charles Keepax (6):
  ASoC: SDCA: Remove regmap module macros
  ASoC: SDCA: Move allocation of PDE delays array
  ASoC: dapm: Add component level pin switches
  ASoC: SDCA: Create DAPM widgets and routes from DisCo
  ASoC: SDCA: Create ALSA controls from DisCo
  ASoC: SDCA: Create DAI drivers from DisCo

 include/sound/sdca_asoc.h       |   42 +
 include/sound/sdca_function.h   |   69 ++
 include/sound/soc-dapm.h        |    4 +
 sound/soc/sdca/Makefile         |    2 +-
 sound/soc/sdca/sdca_asoc.c      | 1291 +++++++++++++++++++++++++++++++
 sound/soc/sdca/sdca_functions.c |   10 +-
 sound/soc/sdca/sdca_regmap.c    |    3 -
 sound/soc/soc-dapm.c            |   84 +-
 8 files changed, 1481 insertions(+), 24 deletions(-)
 create mode 100644 include/sound/sdca_asoc.h
 create mode 100644 sound/soc/sdca/sdca_asoc.c

-- 
2.39.5

