Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2059.outbound.protection.outlook.com [40.107.223.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F1D633DF;
	Wed, 25 Dec 2024 07:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735111467; cv=fail; b=BhbXlzsVf7Gq1PK/Qo645O0J3tNT1b5jWDWEPylSeBiLsIjWz9Oj784bzyXY9wZB9lJZ0yTN5Tn8l1ful4k5wP+EitQSjxvd6Bk9/vq2shnFUWBknPjK4uV8BhJApXrhEmUACrRnEssj7YOb9nk41Q0JzrSf5e2PgSb0aY4MDEo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735111467; c=relaxed/simple;
	bh=UxLNd6x08GTVB1/29RzpCIuzZwoKGFAr9FoPhD7pFjk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=mPwtdYVWngypVelflUPUtkGAh94E8BUfi9uJYQqYDTwNVB/d4ZKpGCjFIUqTZK/9GKIKFkLYlWG/eu4gkYRm2q82VyM0F8jUylTpV+DvQNqXecCOU9Z/VP9Qvdb8Q9l6rXjaV5Q4Grrx2NMkcZLDWg+4T07jTMZhO3b8LDNuDTQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=gBiy3h5H; arc=fail smtp.client-ip=40.107.223.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="gBiy3h5H"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t3l+st+dwfdNnSmlBsv5Pmd3sxLvoa743aQnd4FLNKcnPB/4E2Z/IZ5FHc1oElnwt3iL70rbTEL72sr+UpQLjEOjMugItm1OQ/oM31UBNvnh6YCQWFeiJyl+jI4978Xj6CyRqwvVyqNPqr97h+B2MJ+a0gUqFZcY7IxNPegyn+yOOTlPJ3kQbvYD5ImPzGqc17dPuZURtKNHxYuIyO+w8K6o3MSL14iwy+WUMu+tbJvYN5pFdcaJVyjbVWHooRQqQqMlVoWwEDgoZ+15DYDxyXjV7DLaB9yn1Aezkle80dX71lbpnasrOtJbkT81vcCu0NtP4n2YyaMfYamVYtsubQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H3UsA+gHpbTsBrQWVEWY81QN0F1ZiDHsfVkFIxMwuyE=;
 b=dV77mOZGZ4qbOv0Eh8G0P6w4WWteCSfAm4sWv72F3V4TlggR14gDKZuDaIo1WrG0d2zuN7vvDtKdCaJyfBWBanvOeAgUKcD4fHSr36qTg9T+ykw/OEORUtujTP/C8Sa7YqxRWa+1+LgBEiluz08rseOGJYk3c/swdcZ5wWgTacIBN5zkaD1r/FnmBZCWR6926Gamq6/u8NwEO7VgpHoIG+ndUJdyLLGEoWc5avfAMzOmOBCR6GhHg7CBrq660crmbTf1xOSTZhKGpX1PrspMGdDmnd9o6/tdH02JO/gFBtjAFzQ3gaSzupsdBOl+sDpMxqGpiP2X+ZzxAd5Gv1V1Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H3UsA+gHpbTsBrQWVEWY81QN0F1ZiDHsfVkFIxMwuyE=;
 b=gBiy3h5HW3l6LOc+tRQ4qLy7LUG4v/sIAPnMFlGX+uj4NL5El5gA26OGdTM/yddSv0/pEpnF+yXXVwKsnFT0PBldA4nhjWkJNHdSwbKZAnUdzYjgcrGS3YY8yXiMQ9D44ggnF4UZuMeenNRfauF4Y1gsV046BQH/UAPRE1AZlRw=
Received: from PH7PR17CA0013.namprd17.prod.outlook.com (2603:10b6:510:324::6)
 by DS0PR12MB8786.namprd12.prod.outlook.com (2603:10b6:8:149::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.14; Wed, 25 Dec
 2024 07:24:17 +0000
Received: from MWH0EPF000A672F.namprd04.prod.outlook.com
 (2603:10b6:510:324:cafe::55) by PH7PR17CA0013.outlook.office365.com
 (2603:10b6:510:324::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8293.13 via Frontend Transport; Wed,
 25 Dec 2024 07:24:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000A672F.mail.protection.outlook.com (10.167.249.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8293.12 via Frontend Transport; Wed, 25 Dec 2024 07:24:16 +0000
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 25 Dec 2024 01:24:12 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<sanyog.r.kale@intel.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>,
	<Mario.Limonciello@amd.com>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <alsa-devel@alsa-project.org>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>
Subject: [PATCH 0/5] soundwire: amd: code improvements and new platform
Date: Wed, 25 Dec 2024 12:53:55 +0530
Message-ID: <20241225072400.912445-1-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A672F:EE_|DS0PR12MB8786:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f488bc8-b4ff-4a2c-5b95-08dd24b5240c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?jFDulF5L1Rub+arkakn/CVkhOdRwFnj0U3m5V/Csc+mT0oB5ehAmzXQ7Do0j?=
 =?us-ascii?Q?lfbzZz/nGVsh+Ejw8qamORCZEfF+lnbsNncgnJEcyGeQ728IWkklRDzRgkqE?=
 =?us-ascii?Q?jyEoUGJMGNFcIByG7F+hLULelqV4R1ezQCI4fLKootzNzKla5+mpZJRfYzKC?=
 =?us-ascii?Q?KQDny1MIfn6UEXzI/Xsw28tiCb0E5/wAEG2606FPUck5IbBWdvBFhzaFCgWH?=
 =?us-ascii?Q?RlgLP62sM9eaERe7hZ44whA6RtNCU/NFW9vAJFWPAXaol5yfr9c68fR+ch4Y?=
 =?us-ascii?Q?I38bz3r/6qmI/ikKwHRlnSeLm+a5v9YsU2uD0egwxMjxje2TGaG3gWrofkJ+?=
 =?us-ascii?Q?KqtXrIKnw9Z/4AXMGlHoXyRhWyGfgP9NZGmS8YBx1BIxRmvHpVH0edqSnG5/?=
 =?us-ascii?Q?YEypjcbApU23bxI5EChMrlEbcw8mFzJnn8LM8U99bSTHvSyDf8BcJwLKoKvV?=
 =?us-ascii?Q?rcCg8nwyAo0C4dYtTfvagjhJTqGfN7zohb7P4BGxAqKyFDnACLalFItNXtiJ?=
 =?us-ascii?Q?n9IvC2SEXb+wm6H2/eQ3i34Ls5VNkae4pIDkz1XVJC9hADak0+XBHH5ktwq+?=
 =?us-ascii?Q?s0cCTyVplXYSj+ol06h2PQIZnNjInV3CfmKO3gNriJ5fz69IdXAkiv9Gyxj1?=
 =?us-ascii?Q?M9eiBEIxVHylS1DZDXEebLC3tn+kNHzWmtoTYfqRVWmL5Befj4pd1p4U9/4B?=
 =?us-ascii?Q?wDLSl7t8knH95oi0L0ZcCx6y4uX7Z/ysbmSIZKZv+/28rOjAsqUywe0whc9j?=
 =?us-ascii?Q?f6oRBm9iSEYLYevivVcnFzXKTcBjpAhch5jhmycYMCQcpHxXkqt1ty7wFk7W?=
 =?us-ascii?Q?Q8SzD3tyHh/d4/oCSiYRdMB/jUdeS9eZocelOUar/n9pqQ4tAOAq7K5q2X3O?=
 =?us-ascii?Q?nazYy7YfOdAWEVLSIw8mUW+DM+31YokQEZvdMZvLpI0fDcxVQ4eE0B5pqHHB?=
 =?us-ascii?Q?C7sahAm6YFcq0SMUMRJF19yu8qMo8RQM3hav63Mf/H+Cwo/n4iN/XJURZW6D?=
 =?us-ascii?Q?0OFQ5G5KfJIxXq4I+lBIF2ztfDsruGV4ZJTTShg8EftjdKsRxXCEifr7+EJ3?=
 =?us-ascii?Q?0Uu51Mx9TWcDsymBPQqYuE4dTZsLSvU74BfBDFkgVwdShwO/wmQxqLbb0aoY?=
 =?us-ascii?Q?pFDAadbxLgdMlEDuXE6OFCoQe6vl5uwj2/6d8EWoqwilKtf7CH/P1xhhMoR9?=
 =?us-ascii?Q?M30PVeOQyo5R3mksiRM6sdiX4n5K7gS3+3O92SLkeOzfO/6uzBd5ldZlJJ86?=
 =?us-ascii?Q?VxikIIxI/zF3User7Oq1foC7Tlm+U6PcSi3Jq56VkfcSuUSe0WzzeQxMtj3V?=
 =?us-ascii?Q?t0oRhW99KsYfjUApD21mzOL/P9cdgOKdUN0zlMs27qEEnA5ypVE2hMtljNrC?=
 =?us-ascii?Q?3YqKgEf0r6CBC01HVthpnx+wNIjU0NhbAup4h2s5Chne+4YJVKlSNs8FrTRY?=
 =?us-ascii?Q?hB/h9putoB1FFlLbySNJ1T+Ku17viHHgTREzWilXdLrumfG3Aw33nKLBHy5E?=
 =?us-ascii?Q?dBQSBUxVavK3JIg=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Dec 2024 07:24:16.7386
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f488bc8-b4ff-4a2c-5b95-08dd24b5240c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000A672F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8786

This patch series consists of code improvements and new platform support
for ACP7.0 & ACP7.1 platforms.

Vijendar Mukunda (5):
  soundwire: amd: change the soundwire wake enable/disable sequence
  soundwire: amd: add debug log for soundwire wake event
  soundwire: amd: add support for ACP7.0 & ACP7.1 platforms
  soundwire: amd: add soundwire host wake interrupt enable/disable
    sequence
  soundwire: amd: clear soundwire pme wake status

 drivers/soundwire/amd_manager.c   | 102 ++++++++++++++++++++++++++++++
 drivers/soundwire/amd_manager.h   |  27 ++++++++
 include/linux/soundwire/sdw_amd.h |   2 +
 3 files changed, 131 insertions(+)

-- 
2.34.1

