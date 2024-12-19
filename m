Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2064.outbound.protection.outlook.com [40.107.220.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FFC12185A2;
	Thu, 19 Dec 2024 05:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734587509; cv=fail; b=kXB9pkVXH+YYG6HidSHkRt3LrziS1KVvPENNeZ8u+eeMsJAFzI3ndEEQHl914Y8INL9RDrKDrJVYiBLyQspf3fccx8j7nq/i8juh5Czz00Qz70uuJFaLfbojCEyxK7WkTZJk/JHwxWJpq/+MysOXwjrOPAmkfWHqeuVWob8Cvz0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734587509; c=relaxed/simple;
	bh=wzVCup4MVAPobHeJGNtLM3i76G1xDvTQJ99/cXq9le8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=j+fHkDxgtc+AU+1hlXfIvJBLRMdpxgqiHuTMurJcWU45z9ObcWKwecFkXa1D9rubkTIKWBTpx2MqEjbEzu21KbFRnpJ2cM6UgIDobcf4t96fQ4cBKjvGELY20Rm0l9qI5M/zlTg68m4xspDEtoRl+ny3o12qgBbv0j5WTDcQlHA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ZL3LDHcc; arc=fail smtp.client-ip=40.107.220.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ZL3LDHcc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JuS4dxWK2/DmdrrmuyYqG25ENm3+d/5uSU655o3ELLxUZHcBxm6getkaMkAkFbc638C76Tg+0dj8IdKRc7Hvn2RPYllMllLkILDUvkX/n0NBPeM7yVgVB7wc9Avllw/8ldXax0nig3vUD1k9jLs5EHQVVKjH6yKrWoh+YvDDSGvB0LFgaA81MXSw2eFdjrxHTgrM7Swg10DArrAh+5Nul1FANrtD6iWNwWc3u37DosQ5lfPzlWJtKih2YJAQXtd+xN9+hShGdHMiEl7xMQWPSz519IFgxawY/2X0mg+DO2/Kt8oftjNmsUadb7qxM3mnrYejO4lpIuJYAoGL/ZFTuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TjlAW49wi2tNNZoBp6lCS5APDiL4ygZwnhzoEAl2RHU=;
 b=yOP59F0jyjMUgVbG6jn1/ZM0b2RnssIBEpMztvJwgtXZzctmTVb4n6TSHX1zEH+2MnhrLfRHM0jA0Tg4d81j7YlAszJ50p5S5+oD5BpVP1TY6vln+f2Oa49m/WBgYVbL4wXhOnJcMDgOjYQIz97n+8MfpMAdyyTb4lXvpUOnnfJFZsmhf6AZx7Jw8suuE+MfI5iynNUJxnHL3IZZJUHwCYNpkbJDUZQsbRr1k+Pcxo81DRot71rjbAKl6JhbmFm7GZHcEnZcZanRrUJnuiMTz7J1UpXFIhv2TYYFuK54FTIv5XTuVVmL5Y3PxhDbtZ1/BW7KXXQnE56XUZTWggI86g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TjlAW49wi2tNNZoBp6lCS5APDiL4ygZwnhzoEAl2RHU=;
 b=ZL3LDHccrfr+GAgMzykyurkQFsw+BVqiMQ8KsW94pPBzKSPrJuxkHL/B6utWaXGElPePz5nLQSw3exWEwnm5OAsojy+DreMYy0u229nLLkXEgd/Bh49pvNcqgqxquTzff6VdiemCYE2gJcJKKhOnvpC0K1UHF6zVkortwX+VnRo=
Received: from CH5P222CA0009.NAMP222.PROD.OUTLOOK.COM (2603:10b6:610:1ee::25)
 by PH0PR12MB7471.namprd12.prod.outlook.com (2603:10b6:510:1e9::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.14; Thu, 19 Dec
 2024 05:51:43 +0000
Received: from CH1PEPF0000AD7D.namprd04.prod.outlook.com
 (2603:10b6:610:1ee:cafe::4e) by CH5P222CA0009.outlook.office365.com
 (2603:10b6:610:1ee::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.23 via Frontend Transport; Thu,
 19 Dec 2024 05:51:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000AD7D.mail.protection.outlook.com (10.167.244.86) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.15 via Frontend Transport; Thu, 19 Dec 2024 05:51:43 +0000
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 18 Dec 2024 23:51:39 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>,
	<Mario.Limonciello@amd.com>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH 16/21] ASoC: amd: acp70: enable wake capability for acp pci driver
Date: Thu, 19 Dec 2024 11:18:52 +0530
Message-ID: <20241219054857.2070420-17-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241219054857.2070420-1-Vijendar.Mukunda@amd.com>
References: <20241219054857.2070420-1-Vijendar.Mukunda@amd.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7D:EE_|PH0PR12MB7471:EE_
X-MS-Office365-Filtering-Correlation-Id: 145257b2-712c-4543-48e3-08dd1ff1378c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?bAja6xqb7UzeMti05PG97mAK1zEvGaoA++U2nnIQcWX93IiYtr7dCfWFt3RP?=
 =?us-ascii?Q?R9L+A2BY3KWBkHQAQgIpDUsSDCLVlXqs8YIbTX5Yt5tvSBn/vMmRoxAgjj9K?=
 =?us-ascii?Q?LZpE2+jdW88MylVF+LnIDDsdFg077pUqLGpctZtyDKYL+22R2NLjqAWS++BI?=
 =?us-ascii?Q?wt3KWh5UgZe2PAnS/eh20NXrCLLxodpLGxG8SJudyYdjXnJ1H+5Q3yF+pYc5?=
 =?us-ascii?Q?AdQdRyJ7TkrRLKIa5noUIZM8qSgMz+Dv0N7oPvPSeFzXl4Kxfcloz+Rzctwd?=
 =?us-ascii?Q?TmZs7WtxSa5LhkCL9zbZ//7lPak+POENKWoBo5Idduk1dbEsruNc+r64FdTK?=
 =?us-ascii?Q?PTL9aVQJWKTb36DiT42ESJ9SHbDq/A8UeYPhDGTUvCY7ArZRjYUKPcbN+4fA?=
 =?us-ascii?Q?RMvKNpwH4U+M6GA6G2CyiLop8Z97nVhW+4otw7nfZUjg1l2gKLeNmLvxmKcW?=
 =?us-ascii?Q?h1XyNC/737BBPNpfGwR1S26WLulj8wsrCZr8OIOb40LQv/1AUtqLQRSpBmmM?=
 =?us-ascii?Q?H2oiEOcvpUAG0E/JfRB1yozg0Me29Zgo7d2W9vQryoBwZb1GAwOP9b3U+3PE?=
 =?us-ascii?Q?ESX385VuF08vgAthBzZ1ENI6/CsyJ+6YYg8e7E/6AasUChDV+TwWvx5PP5qP?=
 =?us-ascii?Q?M7nrZwzJzlHBaXtKBsUIX6ABlPcOoLinE4CYdb4teXsHF8WEuNDpIQKtzmk5?=
 =?us-ascii?Q?2r79PgcfHFrCNqwoNZryVtZPyOLAtqMFNu26gzm6eYF+Goa5BN2zqgU/mI4s?=
 =?us-ascii?Q?nT+0yvq21c7ZGKW8LEUdqg5H+1mudNWv4BTDpsFx/V1HJ7B4r+Ao99m/IGUJ?=
 =?us-ascii?Q?bpwstugHgCx9fKMqEn+fULmPC2ay5l066vPkB4PSNjisE0jR7DZIqwOiuac2?=
 =?us-ascii?Q?KuzcY6CqwgFoOKNhzBZvn3JgisiV/Hea4fkmPPCXPKl0bEnuLQhITuK0d4jX?=
 =?us-ascii?Q?IztHhBsfl/uvpC1K5xq/fK2wA+WK8p1xW76GA7ezGYRKUGRwFRIiMhqDOLAr?=
 =?us-ascii?Q?HjVPxDzDsgZYPcgHFqIz+Rz6PM11UXAxu9WgJDlSSA56SblzSAT3/jec6542?=
 =?us-ascii?Q?wjtVSyq0Oz9vw3S400IsOUKOnSCBSdZl/blaRdQ/inwHIFooqVO7oc+VjVd4?=
 =?us-ascii?Q?ajLfh0pL3vNZ2g/lmqmjgX3EsCODO4Lw2ZH0hg5gZl5L1MhviQkQWusUfQb7?=
 =?us-ascii?Q?zzEBAaaE8DLm6R9vmU3SiFPz4YuUS0RhhJJ4MPdq4kh0N9kJHtlbjax1tjxj?=
 =?us-ascii?Q?f6kX+ezxe0A5iem9L8Sr2MHb0OWcQutW4C81uFMZFhADd9zRo8ArOJIVB2F8?=
 =?us-ascii?Q?9z2wayxKoQFymdLzx8+Dim5Q3n57RpxCpNwoOjxxg3nNRhFz+zo+PC73bfAU?=
 =?us-ascii?Q?ij85QOOlCnfItMMYEfDHzlkg4/+8kij6OcwRdpsGVqRl/uh+FHwM1zgD+UJY?=
 =?us-ascii?Q?EwsTt59MFGwh/rHkBJB+l76g+Nhh5ljFQx9EzCbhz2M8DS/LuT1jTO/96See?=
 =?us-ascii?Q?KOClgqUHr8RaalA=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2024 05:51:43.5060
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 145257b2-712c-4543-48e3-08dd1ff1378c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD7D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7471

Enable wake capability for acp pci driver for ACP7.0 & ACP7.1 platforms.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/acp70/pci-acp70.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/amd/acp70/pci-acp70.c b/sound/soc/amd/acp70/pci-acp70.c
index 3cca18612ef1..5e0f7bb68eb8 100644
--- a/sound/soc/amd/acp70/pci-acp70.c
+++ b/sound/soc/amd/acp70/pci-acp70.c
@@ -555,6 +555,7 @@ static int snd_acp70_probe(struct pci_dev *pci,
 		goto de_init;
 	}
 skip_pdev_creation:
+	device_set_wakeup_enable(&pci->dev, true);
 	pm_runtime_set_autosuspend_delay(&pci->dev, ACP_SUSPEND_DELAY_MS);
 	pm_runtime_use_autosuspend(&pci->dev);
 	pm_runtime_put_noidle(&pci->dev);
-- 
2.34.1

