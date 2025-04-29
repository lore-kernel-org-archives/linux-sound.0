Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED9D618FDAB
	for <linux-sound@vger.kernel.org>; Tue, 29 Apr 2025 08:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745917160; cv=fail; b=RM761HbkUWhB8H6LBEElsSlsn4/HH7IBPRe9c8hucenfvoEcN+dCxqWcU2cc6Mel4wng3vHOE+2vzs0r2L6D2Y5bcV9tcJD/m0yz/c39+V0Tn0vS09p8azd9Fl/9K6wDM64tvCikUCtqXx9WrSfV4oc/kmxuYAZLBHjTrbM6V0g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745917160; c=relaxed/simple;
	bh=X6UGOid7fe/e91NKsli35t7FLyBBLR7XAOVrcVmoksc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=ANVrgF+4ieFNgmuuTcB3ZD0H91hq70zpi+ujm9cJ+XouIcaIj6/6es1X/FAry1+pobOuZ9PB18vaHszb5DQU6gkk+kPJ3uE0JoxCRgxGiEQ0vqZQ8P4v3toUpixhAQYsMzWXz23M3OAf9iAgAChcYJVLa4sLvmLpAlJ2PHtQBMA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=HXYvtN9I; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=o5TTI9CL; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="HXYvtN9I";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="o5TTI9CL"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53T4wnJw002232;
	Tue, 29 Apr 2025 03:59:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=RjGhQyCdeQKeHdrI
	0NYisSn9ePLE2dCYR9zMOQgTD+w=; b=HXYvtN9IWC4wp2BXTNLQkAHeqaDfH+E4
	7sfOnQjpwUrLvBBK+jvtKgJVTCfkbGcXCxbzH+fh+NkCTgTjR4Yy17mCYYtd7h7L
	PMfVyK7Q6kik16wRS4Pv9ViIPVKxHB5J4/w9gRHV8Xu2S2XgCkeQmJBq3rneZCNC
	4H5idIUU58M27QV6sYJPeTPP9605TEzqfSrYJ9NiEMpo5o3c5OHGN+iLaxOe2oO3
	TX1rT4XRF8nkUDrRSL3HXi6pQFU3nIKFBAy7MsM9NymyfZm5tsKyXlz3jSjRp42o
	L+3PYIPmntxdrvN2d2ripInMPMP0PQO7aaVDS5A6guPKoIBPzooQxA==
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2172.outbound.protection.outlook.com [104.47.59.172])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 468vw1bccj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Apr 2025 03:59:00 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JQnKE4/qTr2t3ODmwNMfWeU6icxdtube8V6UoYYhmK/MzwhdE1qbJthMEDGOVnKSB3u7Y1HbmeRgIkZlKlVR9IEbfe51o4KDJe39zt3Xe9OiBoJtI/Q04ablHj4De5NVMpYi4grLdf8XMUkmC+KuFBcT7Iq0Hpq9PiSxaLu7V1JljcmKiq129W10de3gLIbBWZfiMMWMQOtbgdfA8Z9Vdb+WyC5YlKD2gXBZzGosYZo1fHaZbM3jjppe7SurlaS4aGs76Ae0bX4fiXaMYIp0cUBATyyELinhSycmz4N+T7w/mXhrNsKKOCCWC9zcGOD2cFPqgiXHjzK3w4sgo+xi4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RjGhQyCdeQKeHdrI0NYisSn9ePLE2dCYR9zMOQgTD+w=;
 b=cKaGH4RBdH05tyk6cn2oOo8ipqmNDIvF89qYGBBOoG57I972cvRihANtkVhhPDptybwVRTrlmtf8/7U//kc0exUmWzjokFXjTkn08wvnYF4OXuEhRAahdXQjGLC4VjPT0cxsqfiWNPlN7A4oAV4lSg4T6uCgOSp+v/dGUM+G445dqSbTFTM20tnMYUALJfo15wNJeG/zZBlyvkuMBLeGav4r6tz6Ee++gmHfKHDFm/a2AZSENEeS7splv/QdRh9InY+y70wNATNbhouoqrKJY1MKAW5BBVdUstHND2IRS0H2iZ8XeC/lUu5mhJS9EXjXKWs8bQyrvFQCi0giR6Mr5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RjGhQyCdeQKeHdrI0NYisSn9ePLE2dCYR9zMOQgTD+w=;
 b=o5TTI9CLB/5T0/hNr2fy2WCjMnj0d+7q57MTn0a5roczTvM/mF9SJcMZYsA2N218X0fDvm8Aa9e4MtXERImYTsd88fgNZ5iKWjN4Zm2Hi8q/28VxkoLJ1r90ACSPJxmOAxyXr/k+8OtAZyyCnsh0pT8dv163M6gqH0KAYtRytYU=
Received: from BL1PR13CA0075.namprd13.prod.outlook.com (2603:10b6:208:2b8::20)
 by CO1PR19MB5127.namprd19.prod.outlook.com (2603:10b6:303:fa::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Tue, 29 Apr
 2025 08:58:55 +0000
Received: from BL6PEPF0001AB78.namprd02.prod.outlook.com
 (2603:10b6:208:2b8:cafe::b5) by BL1PR13CA0075.outlook.office365.com
 (2603:10b6:208:2b8::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.25 via Frontend Transport; Tue,
 29 Apr 2025 08:58:55 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BL6PEPF0001AB78.mail.protection.outlook.com (10.167.242.171) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8678.33
 via Frontend Transport; Tue, 29 Apr 2025 08:58:54 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 85DF3406543;
	Tue, 29 Apr 2025 08:58:53 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 70ADB820244;
	Tue, 29 Apr 2025 08:58:53 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        peter.ujfalusi@linux.intel.com, pierre-louis.bossart@linux.dev,
        linux-sound@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH v4 0/5] Add DAPM/ASoC helpers to create SDCA drivers
Date: Tue, 29 Apr 2025 09:58:48 +0100
Message-Id: <20250429085853.258038-1-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB78:EE_|CO1PR19MB5127:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: b6303fa4-4257-4e20-e09a-08dd86fc1231
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xrOUmKlNDi0Bj/3sQ+NJG6AQymFd8j4UC9Mo180AJ4cTL62L+QygGA3CcAxP?=
 =?us-ascii?Q?TTIL7YVbWtW29FbN6BfV8+TR+Fj1v8DpAfw/3+Zoy9H4A+U+20wvb/7E3ym/?=
 =?us-ascii?Q?swiW5T51wC1Ix9MlDuDHRlFN/MgmRhyK7aWthR5VVGjlLU+wvj/c15/9ZQ7k?=
 =?us-ascii?Q?5OsNwUC8Ags4I7E9akmmmrvHJjUOh9/FfVeamRaSEIbuja3Ub58AEFImnB5w?=
 =?us-ascii?Q?Nh7fT9WCsVKJRmlBZzMEIWW8m9jkBEO1geTPgEFRrOuRCBlkD1Q0FIC+TANZ?=
 =?us-ascii?Q?8x13NaI2vjIm8zPs/EA+1ue5PhdVqA7veGe3TfU9nf6mjReS6GfF+tsb6BK7?=
 =?us-ascii?Q?FLqaCtJHIDldVBb8EnrEn6hwiazhVOEzrYv1TYEwl2GWu+Ia4t5VqUrt7ikd?=
 =?us-ascii?Q?DIYvJeWEqsTuokC0q9VmvnbMCPyxl3FCl7GO5dHkJYJqYdWkODT00abVyjKy?=
 =?us-ascii?Q?3zuoNZRdyKg/OA58Bpe0Pf1WoqZdlbKdya8XzcZkYFx6kOGqrGQvE8nTgPry?=
 =?us-ascii?Q?J3GuOF7hsXUEUaNSgbh8qpik5auAyLn3kPDgkk75hUc2EVIJCkVBTyKG/me2?=
 =?us-ascii?Q?dmeHA2bNSazuKyrKqP4/kreFxgZzUT3L+K7OMGRniEgGMMOPFH8mIdvF6Ot0?=
 =?us-ascii?Q?/wabFjT2adUAC2mXCvVRT02qmXpDhoBsNonprMpr07yjgNL6BqVrO0dfw/Aw?=
 =?us-ascii?Q?EGsfbx7qiWDG0t3Sa0wgbIpgcj1gfw8AkM1A4VXHs8htliJMExFGq+ShUZEh?=
 =?us-ascii?Q?xZNHZuuTUbulTPqMurihTNvEh1DvOe/70svWnI5hG+9bU7DzQR5+JHotsiAn?=
 =?us-ascii?Q?RTTesnNuvHackx6l8CX3/JoIBCNkuHG4pe48GVO+5rhBzPTlhjfyT4xoFzmy?=
 =?us-ascii?Q?3eRYkLXdlQMdGOhRVfZj4tvvs4C7q3450MwD4BBgvVvNopKRNTkPQpZhG3dg?=
 =?us-ascii?Q?EGyvd0V6EtE8ZdtCXvCMeKf3JKHPbfIB8etSnc3xYgCE5Rq/w+0Km3lgudpF?=
 =?us-ascii?Q?Akg32AZ92VS82qU5SIaKsn9KtrGvE5wtjAgRLrq32lqxP/0rEe+tboCe9yww?=
 =?us-ascii?Q?gR0iFptO1NJNKSdxwtkvwLkpRlAeM/00BdJvwwwcN17mqp9tbCac9VoqefJW?=
 =?us-ascii?Q?b4tr0j22NhOOSD5GZkF9GpkivWME4na3raAIFSSCwTAnrApN9JLsZJGHSdOv?=
 =?us-ascii?Q?YkteRKcIowpEHN6CHfTv8R0vimRGCFUogEiT2NxvpCgTTvFXVKPoUR0jBcpv?=
 =?us-ascii?Q?sutTr4wt9Q/1lUUZAq1zOSmTeKbh/xeIeMcXty9KugD3cFTVO6q09p6TxPQK?=
 =?us-ascii?Q?+knQZo/6bTFW4tXqCHU4tsntYqrsohVVzzASzJURCriZrKZVmsYPzKDdevqq?=
 =?us-ascii?Q?uid84K5mpA8WfrEKCq4qoghVwi8+3ZH+C9etXcZ63XqZUM48sLbI4P3NNm1H?=
 =?us-ascii?Q?AZTpPvNIZJTxKa4v/PSsRHBxENjezCbkoCH2aRpiqL7QZnSJAcCF37JbslM/?=
 =?us-ascii?Q?EckuBHGY/nT7jbnwPi2imLeVshlZToniahKy?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 08:58:54.9552
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b6303fa4-4257-4e20-e09a-08dd86fc1231
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB78.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR19MB5127
X-Proofpoint-GUID: lTZNL6Bncd82WHBdO-l76lKMxb2-68Up
X-Proofpoint-ORIG-GUID: lTZNL6Bncd82WHBdO-l76lKMxb2-68Up
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDA2NiBTYWx0ZWRfX34IvtiD1xLf4 hg5H9JdIVHxgLYqOZTe5+y6bj5AWuWAiJsqN/RnDgMMidvI0NFQJ5lYj9Gs8jwFKyHUp8hTzPKQ Jur1JDsXxgfJrU+OsttRsSFAv8G3F8XleDVXs8OxXQ13lRrV6NubssXIoYm9+b62WmeL5IhIRtY
 DrySwcMWL3jI75diXn81rQ5E4+HKEhFV43drshpJJsAmys2/xQmRgpXMC4cIuQ7fgF4vYUC44OU 9r7V9S65XE2BKwMZgtxbU/UHk6H2fjt6NKgMOvmEOl60P8z2K5IpMD5VnYg4tltkY7oL++ugodK 1oPcYODdpMkmP3Oivgv9tMOlcI8gpnX4L+mOBm9nNLr1tNQEh5rB3X15pfW64DJd8O6q5ezy5+s
 7Ah+jgnkNOju/OdnH5aL7U+9cf39pi3nISbQR3VcpA4rHE/QwxTcrDmWT2YYv+nkz6EtOq0d
X-Authority-Analysis: v=2.4 cv=Dd4XqutW c=1 sm=1 tr=0 ts=681094d4 cx=c_pps a=GDxOUaUasxmcDRSC7gC2IA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=XR8D0OoHHMoA:10 a=s63m1ICgrNkA:10
 a=RWc_ulEos4gA:10 a=hulU0MfjRZACQXYr7gAA:9 a=BGLuxUZjE2igh1l4FkT-:22
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

Changes since v3:
 - Add pin switches for non-dataport terminals
 - Add a minor cleanup to one of the SDCA parsing functions

Charles Keepax (5):
  ASoC: SDCA: Move allocation of PDE delays array
  ASoC: dapm: Add component level pin switches
  ASoC: SDCA: Create DAPM widgets and routes from DisCo
  ASoC: SDCA: Create ALSA controls from DisCo
  ASoC: SDCA: Create DAI drivers from DisCo

 include/sound/sdca_asoc.h       |   42 +
 include/sound/sdca_function.h   |   69 ++
 include/sound/soc-dapm.h        |    4 +
 sound/soc/sdca/Makefile         |    2 +-
 sound/soc/sdca/sdca_asoc.c      | 1301 +++++++++++++++++++++++++++++++
 sound/soc/sdca/sdca_functions.c |   10 +-
 sound/soc/soc-dapm.c            |   84 +-
 7 files changed, 1491 insertions(+), 21 deletions(-)
 create mode 100644 include/sound/sdca_asoc.h
 create mode 100644 sound/soc/sdca/sdca_asoc.c

-- 
2.39.5

