Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.52.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795453650;
	b=ve426DSrwhRZfSfJIG4J7szIe/D5ok7xofsKSttPkLGQrMSJVFjlUWrucoBpCh1a7K+i
	 6DN9eAFEabqE+uDoIiIrgepQAV4DAYNI7CRprUjDGzIjwbvp6yQ4Pqkd89gk8f2WvDx5B
	 lKPdR7xTpsjnzd05m1VBNY8hiNJlAbRegVJGwEujidbfA39u11KVu/PoQyh4FuSOROy9x
	 S84d3Q1jDlPE9/2cNnYy2M0qzDzRHEqPmMc692qs9CZ8+Yu/brr2qjE9Iy6PQk7omP0eH
	 hvGh2CjArPDkZdwRdWlZjE7ZyNjoxEw0iB5rotKwkihwyTR2iSkx2Wv6KycrNkMrNPA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795453650;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:Content-Type:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=Qss38gpUnIXCvJyjifrG+UCoHE4SVMGMh4IdOuoQyY4=;
	b=agvNLV196gJSGZgz3xNL/hc3oFjP6GS1ppXWUG+wZl25Y6lMhzzdF0FnEZDuwa0p81gv
	 lqLTRyRQQI6cnrpppDg8mC0sOUmJL4xPoP25DH+PLSdDWymrU337zwYC9FfZ57brYMFM+
	 e1KnwgX1cS/Ii8owDDnnDr3Q7s3vKTn1OZkNQXPSy+uapZGdn02Pc6/z/bebM6HyIeS3a
	 0RbADd1Giv5qg6urLp4j2Fqc3PGBHvG6KyOCKLJ7ahnW4C8/HaWMZfInGNVNg7SzZ46z7
	 S3+/40U5Iq3iow+GEsFLzaaaTeU/PY4VfD5ONndXbmkLDOuX75FbzMTxTluPGbgXhIA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=cTXbcs4m;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.52.54
Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011054.outbound.protection.outlook.com [52.101.52.54])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A868606A31E;
	Mon, 23 Nov 2026 17:07:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A868606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=cTXbcs4m
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nLe5h1+CrdiMX8v+aQ/kyMzltVIBaEoa98gvUHLamrrgfeDfwhV0gvgnX5HF2uLts8BH8iq5NFX4H2HRlbLBk92LFOT8LEdeEU4XhhErw4VhFbk7UGU3XIoDvF6Pp+Say0KaBO6dC/dHdMGQAU3if7/dcd8SJJErWtNte2vrznR2Tz91ULYDdEFHdR5pparkWjwoxkUwR9MQ9BB8D8tqOM80QbDfNGQnxlbLRT9fM1BD/MwGma5t1bspBtNh98AxepIw9MkTzqRvFNNYXeECZ7j/UYSsGidnFtuhLP6vLGV2xIOIp1p2Iz1pfYJO95SATJTd+A56m+YFXt1pvjCaOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qss38gpUnIXCvJyjifrG+UCoHE4SVMGMh4IdOuoQyY4=;
 b=wlM6KkD6UEbFNR85CBw2Y0HCOBek61yOC5RBQGRChUSIqGgCt1WQP0B2cmXCBzJWk2z4z22vTwMplkrEDLw0qJ6/SKD6px2DN9g+VSuaG1s539gKiT9p81dmPeQTIxKhSgqKIXuKiw+pD7cj1xJu5d/bzJPrx8v2N7+Nr+afCxstNLOBUgRScBqA2yrQ0dRHQmzNGnSR21qlV8bKhnwp4wqmgaWkM9JCgLyVOzx0yKRMKObh3PY/imL5uMP27lMzDTgDWZP+hR1Flzl1tRU6nWd+jatMtnnBMV7Y/SYeKndueL8fSXwHfCE9affq5uCvCtx9P/2yaASsqou9ZgFmCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qss38gpUnIXCvJyjifrG+UCoHE4SVMGMh4IdOuoQyY4=;
 b=cTXbcs4mugs+25PIZXQTAh3uj/9eH1QZuKDY0Y0rLp9/jI87QxLhnjTj9HsizULRjqmbxl2HmeL2nH73RaGl6PVHf0GLFMO1zi+tws6u2lMVUQ2V1hRw2gbxERV3LCDfzIJL6uMryJYjYAYXOyXE3PHfyGCBNWvQQwDaKUoICYI=
Received: from BL1PR13CA0219.namprd13.prod.outlook.com (2603:10b6:208:2bf::14)
 by CH3PR12MB7523.namprd12.prod.outlook.com (2603:10b6:610:148::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Mon, 23 Nov
 2026 17:07:21 +0000
Received: from BN3PEPF00022BD5.namprd03.prod.outlook.com
 (2603:10b6:208:2bf:cafe::12) by BL1PR13CA0219.outlook.office365.com
 (2603:10b6:208:2bf::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.5 via Frontend Transport; Mon, 23
 Nov 2026 17:07:21 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF00022BD5.mail.protection.outlook.com (10.167.248.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Mon, 23 Nov 2026 17:07:21 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Mon, 23 Nov
 2026 11:07:17 -0600
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57
 via Frontend Transport; Mon, 23 Nov 2026 11:07:14 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>, <Poojitha.N@amd.com>,
	<lee@kernel.org>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH v8 12/24] soundwire: amd: fix work drain ordering in remove path
Date: Mon, 23 Nov 2026 22:27:33 +0530
Message-ID: <20261123170520.1380924-13-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261123170520.1380924-1-Vijendar.Mukunda@amd.com>
References: <20261123170520.1380924-1-Vijendar.Mukunda@amd.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF00022BD5:EE_|CH3PR12MB7523:EE_
X-MS-Office365-Filtering-Correlation-Id: c5e2de4d-39ee-4c81-c1ed-08df49843cf5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|36860700016|1800799024|82310400026|10067099003|261009223027099003|11063799006|56012099006|261021123027099003|261021121427099003|261022075727099003|261022105027099003|261028144727099003|261026140227099003|261102123227099003|22082099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	RhWGTPEVuIomHXu/LepMq8MmZWM6d8oczaa4bCFi8f3/Fvj4l7Bs5TZwuJhmeR9a9UABs9nrdexYyMGmDzWn8ob3SLPcR8qQlSaQmj5tEblAuK1tFremQr4gZ346vzcCcDwzcUjTEZT/fNQCyO342hosHxnJXuPlTlrFyc1KDhylmCHbIMcHPvrNlpWTE+f3An8d3IUm88R5v5cFEals/vEBBa93keOD9Q6W9b/6NzWoE5BYnYRFpkhNwdlDWPcEbvVyS2wG+wYZzHjWKS6dxpguX038zTiU7k7WuueY2iGoFrTRwFzJJ5xPI3lcb3PMzibTWrlHl8g6KHoLddEvapcLaDwKPkjAo3VGe3IkNKfH4JUN12I1zlV/XJ+EBP2fQ8slRh3vBT+jtG1DsDg4vpMGyrKTsjXxWW0nMNhRYB/Ehqt9T6sV/inzzub7eCU9Qwj3wQ2qdW0ZhU+0x9mPGhKcKJ3sPKXOds9EaeWFR4R9OTiTSxc0JVP6MuS2kB7U/EsR9EeyM0NllyYL1QEcIv98Pe00xsvtERy/Ga3Z5EcaSiowQZuWi57zAMDMDKKvOl2XEhHgOV7ueO1EvwuC1apfHXJjNypitDbXfcSM2G3vBTtgRQ383SxJdF8CXshRAu0h5gJNmyajzny0rsxp8g==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(36860700016)(1800799024)(82310400026)(10067099003)(261009223027099003)(11063799006)(56012099006)(261021123027099003)(261021121427099003)(261022075727099003)(261022105027099003)(261028144727099003)(261026140227099003)(261102123227099003)(22082099003)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	/d19wOcU6PeVqHjOJS2a7qdLeYJGTTITyZ8FTu6oMvDgWNfv5+t4jPG30DBaBeRdHd7GqgHR1P7b38iaANOEux1rYKAerzsr73FrI5yQj1L4bz2j71AMQeqsKkl2iajz7l9GgSgYQBCBSEz3O7yYJ0rKPydYrbx5kvixjx0fVAAPCHWjxdPLgOSBouCvN7NhKSszHY/F1ZxfJZFDoM16WjJCiC6rj9CF2pkGTizSyPO0gC4OB99er/MrZtH+qliGnt8nkmYlVvy1/nMco/EVBM1bkl9X06axl4zJYZmRCyeSLsCwd/6P0g0Hlr+Rsbh+vKVoerAsSqqeDn6Vg/oK6DRc/J3ylevCThhsIjXOsKgDz0liNyR3IVC9Cl61JwjIcxXeiwK5kKmjG1moRsEDawsGGbyUfkuXeclttI0ile9Bgg3crdYRqx9sdeNxPCoD
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 17:07:21.6734
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c5e2de4d-39ee-4c81-c1ed-08df49843cf5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF00022BD5.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7523

amd_sdw_manager_remove() cancelled amd_sdw_work but not
amd_sdw_irq_thread. Since amd_sdw_irq_thread() calls
schedule_work(&amd_sdw_work), an in-flight irq_thread item can
re-queue amd_sdw_work after its cancel returns, defeating the
cancellation.

Fix by calling amd_disable_sdw_interrupts() first to quiesce the
hardware IRQ source, then cancel_work_sync() for amd_sdw_irq_thread,
then cancel_work_sync() for amd_sdw_work. The existing
cancel_work_sync(amd_sdw_work) is also moved to after
amd_disable_sdw_interrupts() so that any work item queued between the
old cancel position and the interrupt disable cannot escape draining.

synchronize_irq() is deliberately not used before the
cancel_work_sync() calls. Once SoundWire interrupts are masked, no new
IRQ deliveries can occur. An IRQ handler already in flight may still
queue amd_sdw_irq_thread, so cancel_work_sync() is used to drain both
amd_sdw_irq_thread and any amd_sdw_work items it may have scheduled.
This fully quiesces the driver workqueues, making synchronize_irq()
unnecessary.

Fixes: f93b697ed98e ("soundwire: amd: cancel pending slave status handling workqueue during remove sequence")
Reported-by: Lee Jones <lee@kernel.org>
Closes: https://sashiko.dev/#/bug/linux-9890e8dc-4b7d-44d3-bfb0-171dc421e28c
Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/amd_manager.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
index 3a97c12b45e8..b1a0e12819de 100644
--- a/drivers/soundwire/amd_manager.c
+++ b/drivers/soundwire/amd_manager.c
@@ -1266,8 +1266,9 @@ static void amd_sdw_manager_remove(struct platform_device *pdev)
 	int ret;
 
 	pm_runtime_disable(&pdev->dev);
-	cancel_work_sync(&amd_manager->amd_sdw_work);
 	amd_disable_sdw_interrupts(amd_manager);
+	cancel_work_sync(&amd_manager->amd_sdw_irq_thread);
+	cancel_work_sync(&amd_manager->amd_sdw_work);
 	sdw_bus_master_delete(&amd_manager->bus);
 	ret = amd_disable_sdw_manager(amd_manager);
 	if (ret)
-- 
2.53.0

