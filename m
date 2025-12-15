Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011040.outbound.protection.outlook.com [52.101.62.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99F19336EE8
	for <linux-sound@vger.kernel.org>; Mon, 15 Dec 2025 15:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765812807; cv=fail; b=SWNG91DiSHkjIawqsNTAS1R3VGw6zG5gUb3W+SkMbmLSI7CVZ+sOmkqvo3UkULRV1WCrj+J9ZNZyk8hoe0Ss+rT8c7sf8q5LTtL672LpKRjUtQeQdL1g+3MqndBIFigddjofv75VoSyaNWfcy0YWqABZ56uXvqabx7QpJWLyGMQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765812807; c=relaxed/simple;
	bh=AkT8l/kz09a2xGlMuaYjb161y26u4p+U025vjEwB2Z4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gpW1vgFB/CaDCF4Nk3lxnsfX78sz49Dd9/u38tTjwhubk4cuMf4sKxn91aF3tJ65UTS3lMsf5TirG1oj24/uOGv/Dob2+ho9VnTeZ+A+NuB+kP8DtHBSRGh/T1sB8rNDDQK0tl5gQ3hNx/tXuGlos/0rma/8LvnO7831UGxWe1k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=Vxo5ASQC; arc=fail smtp.client-ip=52.101.62.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Vxo5ASQC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rgaGD0dKjzW1Qi4piyOCk63v2OtAH2+4EvKSM3niIXwBL4cvDgArivvEt8o6Djuw7stdRAGjXkCaLgB7Oz/L8EG3jRbivkf2k7ZQAC0KRdvjWbdWhpgABKk4vRT090+9Q8ivFfYDt9eyGyfI1g7iFBdMJ8s0/1Vwd+4eZfGLqoR+0x3pqV8mDprY3KVLTAQ7HBncd0N+UJnCUdZmp+YnCAwEODxgSzlBahmIErmLjk210RoXksVvdiOb8I5zQH7B7pE6iM43WQBCRGy/NCGjQNU0bGB4nWBqP2dfNNkonp7dv6v/dsCiQ1ei2fKURkb7dJKzSAw1WOl3xLGYbPenMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3HQa90SByzxjvQGIPmKGK89xq4JB3rbRWkHDsOasoi0=;
 b=bfxZMXR71tAvkkBFyOmbgX6FRy4/cVV5+JJdfmhw7VnGGQNL7QtvRmg3iqaOjjS1ISxZQQ9gjIoc3jkEGRc9s1eSz/L/mzQaPiOgREH7/1looEHP+YhLYzhpPCgUYI1wyTZ4OyVILd222VFE4hDxEAwrt10nzI1xnvoqNoPJY6h/da7++90ATJ/xikylhBT6bG2VgGcuWxLZUfFn8yXSO9Fzbc1yzX6xTZqkQOZnTvX6MBD3Lmz4bzSJVm+Te7rSQzBwIXl4VfXkdD42EyIUZZRfa2JBsTLVE6x/8HCDv/YfozXcPgONpLdWP1HgU0Y/eARGdFPdXLNTKgO39DEoEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=linaro.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3HQa90SByzxjvQGIPmKGK89xq4JB3rbRWkHDsOasoi0=;
 b=Vxo5ASQCpJ5jOU6bH/pumvS+EocSJEE/Bbp9N6o6MpGhn+1c40Y0ltm4ZlaIZOZE+EzQ5fA+GkA03exCxprW8npWboL6egofd0Itpdj8IxfTp/regn1zuB5JFfFy8G6uICQo5yKtReFxyRMiCSXM1QxS7KGpQhwNknJPPBBEkmg=
Received: from BL1PR13CA0087.namprd13.prod.outlook.com (2603:10b6:208:2b8::32)
 by DS7PR10MB7156.namprd10.prod.outlook.com (2603:10b6:8:e0::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.13; Mon, 15 Dec 2025 15:33:19 +0000
Received: from MN1PEPF0000F0DF.namprd04.prod.outlook.com
 (2603:10b6:208:2b8:cafe::13) by BL1PR13CA0087.outlook.office365.com
 (2603:10b6:208:2b8::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.6 via Frontend Transport; Mon,
 15 Dec 2025 15:33:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 MN1PEPF0000F0DF.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Mon, 15 Dec 2025 15:33:18 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 15 Dec
 2025 09:33:06 -0600
Received: from DLEE205.ent.ti.com (157.170.170.85) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 15 Dec
 2025 09:33:06 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 15 Dec 2025 09:33:06 -0600
Received: from LTPW0EX92E.dhcp.ti.com (ltpw0ex92e.dhcp.ti.com [10.82.30.14])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BFFWTtZ2639809;
	Mon, 15 Dec 2025 09:33:01 -0600
From: Niranjan H Y <niranjan.hy@ti.com>
To: <alsa-devel@alsa-project.org>
CC: <linux-sound@vger.kernel.org>, <broonie@kernel.org>,
	<ckeepax@opensource.cirrus.com>, <lgirdwood@gmail.com>,
	<yung-chuan.liao@linux.intel.com>, <ranjani.sridharan@linux.intel.com>,
	<perex@perex.cz>, <tiwai@suse.com>, <cezary.rojewski@intel.com>,
	<peter.ujfalusi@linux.intel.com>, <kai.vehmanen@linux.intel.com>,
	<pierre-louis.bossart@linux.dev>, <shenghao-ding@ti.com>,
	<v-hampiholi@ti.com>, <baojun.xu@ti.com>, <dan.carpenter@linaro.org>,
	<sandeepk@ti.com>, Niranjan H Y <niranjan.hy@ti.com>
Subject: [PATCH v2 6/8] ASoc: tas2783A: acpi match for 4 channel for mtl
Date: Mon, 15 Dec 2025 21:02:17 +0530
Message-ID: <20251215153219.810-6-niranjan.hy@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
In-Reply-To: <20251215153219.810-1-niranjan.hy@ti.com>
References: <20251215153219.810-1-niranjan.hy@ti.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0DF:EE_|DS7PR10MB7156:EE_
X-MS-Office365-Filtering-Correlation-Id: 40ff46ca-c743-4939-f510-08de3bef45cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|7416014|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?PAhCnJmlqzlyL7huA88XFXTpO4Z0tbcdjRR8c4jC+clAU8CR3nuxnBN5gITe?=
 =?us-ascii?Q?0CEewgpO8StuCUvE17LyHfN99ozH5xzRKzwXlHwPnzsTi3kdR32LMaxMipyS?=
 =?us-ascii?Q?S9tUV7bPMKTslxpUitMqnMRTrxjTXLVs847v4QMFhxqvBlwkz/dU4PgSFlfB?=
 =?us-ascii?Q?eyMfo+hD1asGD5WI4KRYpJjTDB7FoXvmT0UB4XK2bnaE2LIQJVOHDmoPKdR1?=
 =?us-ascii?Q?sqVJvj4rSMaHB+2iQCe0AYMr9lHsI60vv45jlcpNLVgv3KpbI2yhJDPjdPl6?=
 =?us-ascii?Q?/8HSi3ZUH4/dh5jQ6+yrm+m7bAnZgdrKcHaQkrGPfx3dM3FGcTScfyXKowvL?=
 =?us-ascii?Q?CVMU7rXeHqf9kfYf2IHins6qgj4dE3qGyhSC0KofIfoVn8rZSJvhJa80h0vh?=
 =?us-ascii?Q?eLx4VuS6H8li9YfWn0IfIxChm1PaKOvox6IyNX+tMHuPfK8LPQSEBM+imFSQ?=
 =?us-ascii?Q?BxOzorhCAStrCbSCsnAswgKJHc5APO2qHIj5exSwJ3i+6UvEAtkEGhUPetfk?=
 =?us-ascii?Q?IPg/yS7Al06BmW0JVpXp5nIM5M2rjx6kE2lOVPnFj8UvcNIgscb0EmnZ/MUD?=
 =?us-ascii?Q?7Qo6x+qcj2HQyPi5rFs/b+HeBtsW8VCYtIKtaZEfkd3iaffREDkrohPBTjx+?=
 =?us-ascii?Q?weNKFsRy6Ph0zAFxZoxFXem06wYgS1K7+CTh/j4Ul3RWbK4wW7rdV3I5RG+a?=
 =?us-ascii?Q?/r9SXNuIrEWVCIOmQzwfFaaNbBsPvO/3avq9Tz6/Du9AzuDFhBlAP097n1Io?=
 =?us-ascii?Q?qgW9p8nYUFCIp/K2IR3lS4safeADDl7QdLKJLmUasA0ig8J7xa4sXBR3vAyk?=
 =?us-ascii?Q?jfm+w1dS1ggrmc4d8svlUQeuk+DRL10wnv2kBxsX0MGMlpHMQPDwezMR9orP?=
 =?us-ascii?Q?ZJ4Q0vzgL5mGwcEjGtEFomlnM3m8y2I7TtCO96DuEXNnD80G3bPXPKZKsr1i?=
 =?us-ascii?Q?o/hX1HwZJRX/4DpvbMfZVBo111OZBWE9GMuYARi8nM44jKYFPvgCzYSgSY4h?=
 =?us-ascii?Q?bbS89xGXUymHziHS6dphUUwldNFZwZyYGoQhc6xx8vJeR1l7NDXq/poxBCdJ?=
 =?us-ascii?Q?Oo4EH5QNQIlw+QZtxAezingfuR+LML5Pn3lB3moyRm+RDEKAWhgePksUyLGr?=
 =?us-ascii?Q?JkOoRBEZYcXrEdTWOpummoFFec1m1Rr1bXpCkFq/WjU16Hhq3qe2U19EhuGl?=
 =?us-ascii?Q?BiS83BHUXGW4JNXSqNIwudn3QOVKja7VKrt4i6iPFRGwm5/nE8qvMZp8zqkS?=
 =?us-ascii?Q?leSc4Jh3QWwDqn/OOg9zlUp7L9uuVt0dCbHcigo8rsPHE0dYFMW6GNhgEQKq?=
 =?us-ascii?Q?aKDnwlns+OHiPwtUjG9/2QBIaPu4KsBhuwmzjUX7V1GODOkGawvXUsrDNjXU?=
 =?us-ascii?Q?tlCUPQq8JlW5eBusk1ruu0jiIhldX56Ji70PPYJOBQ+a8fef40ifhJbkj9ld?=
 =?us-ascii?Q?0QmgurTCh3cVvASJv7N+TlIpFU7sK99O4A5kjwjW/p5xdOjiNlSCKjKbi/wS?=
 =?us-ascii?Q?3pZgKtxjIRbSqFA3SHeITEnblmCPV4sJuj5p6fiJBatv2vxM2kiNQ1GN6Sdo?=
 =?us-ascii?Q?8918yRbzer+ZkIFiWgM=3D?=
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(7416014)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2025 15:33:18.6746
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 40ff46ca-c743-4939-f510-08de3bef45cc
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000F0DF.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB7156

  Add changes to support 4 tas2783A devices on mtl platform.
The supported unique IDs are updated to 9, a, c, d, where
c and d are configured to play left channels and 9 and a
are configured to play right channel.

Signed-off-by: Niranjan H Y <niranjan.hy@ti.com>
---
v2:
- no change
---
 sound/soc/intel/common/soc-acpi-intel-mtl-match.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/common/soc-acpi-intel-mtl-match.c b/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
index ec9fd8486..f12d42986 100644
--- a/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
@@ -950,7 +950,7 @@ static const struct snd_soc_acpi_adr_device cs42l42_0_adr[] = {
 
 static const struct snd_soc_acpi_adr_device tas2783_0_adr[] = {
 	{
-		.adr = 0x0000380102000001ull,
+		.adr = 0x00003c0102000001ull,
 		.num_endpoints = 1,
 		.endpoints = &spk_l_endpoint,
 		.name_prefix = "tas2783-1"
@@ -960,6 +960,18 @@ static const struct snd_soc_acpi_adr_device tas2783_0_adr[] = {
 		.num_endpoints = 1,
 		.endpoints = &spk_r_endpoint,
 		.name_prefix = "tas2783-2"
+	},
+	{
+		.adr = 0x00003d0102000001ull,
+		.num_endpoints = 1,
+		.endpoints = &spk_l_endpoint,
+		.name_prefix = "tas2783-3"
+	},
+	{
+		.adr = 0x00003a0102000001ull,
+		.num_endpoints = 1,
+		.endpoints = &spk_r_endpoint,
+		.name_prefix = "tas2783-4"
 	}
 };
 
-- 
2.43.0

