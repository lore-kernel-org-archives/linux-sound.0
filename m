Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.196.35
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795453725;
	b=mwyL4CoAtUc0qR9TesVDwQX+eKydss+5vllsVcWn4rOGG5mMVJQiflywwbXHdbiM5kRn
	 ZzvPmQ2FQMopudDkxXfTi7Lbu/92yv9PmNlRkFbWStnbiI7oPYiDmuAuIPwHF1RXnsDCP
	 T4xClzt+6A9n8F4svaHzZmmA3hPIhtK/+CJq3UpKB0slfRfQIh9cd8uK9itddstCkGtoq
	 VFNNWL7j9G+l6/H65q7PcsKvcpAsSIIzW/EzNlOUW/87ymBkVtE9fIV3MO/Z8wKQsFxKy
	 e/SFbmXVYznj+SC1Yv+TGE88GQ7/PVo1PxrSw4JQK5HgD2rvbb132ziP/zEZO1mM4pw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795453725;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-EOPAttributedMessage:X-MS-PublicTrafficType:
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
	bh=zpyHyHQVcfY3tNJDfAzrBXFZw/fhJuDXMPV3QfgDDhg=;
	b=e0W5iX+Qk7umYNEkGLZylGuXKxDwQL329YQbyDAtOCIvYNONd8E7Wz+YsbSxrnntP+un
	 2KyiiFd9wbMdUNgOZdqhlOXAnMli7VOXgQAEkp0M77YAPzm1w6R+/O9+OmvnHb3c535bt
	 XpZX+lfE1wX8sm5cZ5QnmJ3WN6esErjKZk6uStIe87N8EoBV+ahHY/p7Id6LWY0bIT7Mp
	 0tF0G4PbgRZa+MIWc/EerRzJthM/XoeISGmXnkETQQfoBa9DoU/emwiHk4qMoO5+7Niuq
	 IOwkAnDy42i2sWvd/egcsxcKbHNcO1+edQch3OnR2qm/eUBXnLsiA8voQAV+NAjDfhg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b="YpcO/NqX";
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.196.35
Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013035.outbound.protection.outlook.com [40.93.196.35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 547EE606A334;
	Mon, 23 Nov 2026 17:08:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 547EE606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=YpcO/NqX
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RbPALxMF3jBR68LOd8j18ClX+Apnu059guANwxuKBUq4mFXrifdPLd4nTvt/+GwnSzzcAKLuHfngw1EGNl7O1bzIlQbDw/pg0cWVYA3N7s5QXNsUcNhufIkkPxEFPtYPKBTgSEzVUCHOHevr2eux9uzLSGJCoBnl+9aBKulDWwWbzJbiQXSqAp7hVkXxBS46yFGLscZeDKlp8Iexua1nxPJj3m5fXcYu7Adzy4nRj2EULq80hj3Fyat791E+j9YigOwOVvNTFRESx6p3QwMpSnTHwbBBoGj6/Wr5OSkRbS9J69H74KsHswkfu+w5Zm5fROcbWdq+126ufiGpYgavaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zpyHyHQVcfY3tNJDfAzrBXFZw/fhJuDXMPV3QfgDDhg=;
 b=rM6lywr20obGttATiLfLDokHUXHBL0hr/o0Q7o0uGyn1ACrSujqNodDw43i9d/E3U6ADmVB+gSPV7TQpjg4a4gyoQtNOSqj0H1r7R1/v9EjBNIVG1OqSdoCAM3aE2OuYUmqFrBAxRvZsE1nN2X/4h2VwrabwlVKa3tpeeQuTHUbsB8VlXUS+jPKU3mYYyTWc+QlX6KC4QDQ6SGbkTccvMC4Sp32qM4Sbe03Ei0uo57ndmFP2+VMvTWNFGoqUwPKsAJIwlbkb1iJfZzOEi6H9g4fotPc2yDX94w03092baWuoFCFmNKYR1y3k2++/9z21FuV/RDWEGGckML+EW9/vwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zpyHyHQVcfY3tNJDfAzrBXFZw/fhJuDXMPV3QfgDDhg=;
 b=YpcO/NqXjM1JlUa+p/Z3aWEqsL6Lxj3KiexpwpHwlUNzDu2kmT0V410u0OcfDOw8fUIr5YduwQFVoVqcNWneGb73GKIRi1dSmAoaGD3Q66FhGwus0mnN5dBbje0D+WgSJso4yQca7Xh3gGDc0LEo+A79dV79kWx+cxrlCT0KMus=
Received: from DM6PR05CA0064.namprd05.prod.outlook.com (2603:10b6:5:335::33)
 by CH3PR12MB9028.namprd12.prod.outlook.com (2603:10b6:610:123::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 23 Nov
 2026 17:08:37 +0000
Received: from CH01EPF000BE944.namprd02.prod.outlook.com
 (2603:10b6:5:335:cafe::e) by DM6PR05CA0064.outlook.office365.com
 (2603:10b6:5:335::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.5 via Frontend Transport; Mon, 23
 Nov 2026 17:08:35 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH01EPF000BE944.mail.protection.outlook.com (10.167.244.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Mon, 23 Nov 2026 17:08:35 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Mon, 23 Nov
 2026 11:08:16 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Mon, 23 Nov
 2026 11:07:22 -0600
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57
 via Frontend Transport; Mon, 23 Nov 2026 11:07:18 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>, <Poojitha.N@amd.com>,
	<lee@kernel.org>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH v8 13/24] soundwire: amd: defer dev_set_drvdata() until after INIT_WORK()
Date: Mon, 23 Nov 2026 22:27:34 +0530
Message-ID: <20261123170520.1380924-14-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH01EPF000BE944:EE_|CH3PR12MB9028:EE_
X-MS-Office365-Filtering-Correlation-Id: abf5d613-6651-4631-aece-08df498468d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|376014|36860700016|1800799024|22082099003|18002099003|13003099007|11063799006|261026121527099003|56012099006|10067099003|261021123027099003|261102123227099003|261009223027099003|261021121427099003;
X-Microsoft-Antispam-Message-Info:
	mkToAy3d8vWOsLZiDmObPKvx2RLJqbwBXdjVVEjm4Bhc1sbeNGKoFL5QdPG88eYjo1O25CpC43FOZZeJHQ7DhSC0nG39Vrq25t0xnQJvpJglmY0y5nYQFO1kbxtS7Gz+uAnVx71n/OajScJOmZhtifbgK0QTtGAwM7krX87kIK9uIEwt+jVHKCL95lGn40Z84aPwEQxffvhGeUHga3AVLrRmr6IkA35lANKaUgESUQlk9qj1RCWRlDIFmXVExfXgmq/g2zQ3xF7j/DX/rdWoJjJl7gdW7buZiAPbmsvBINC0v42+BzDvmgscDpWKmz2IDCO08wWWeTOzBmS/rOWByZZ3yOJ34m/ygjOxFyihqVkbteJRbvoMQAy2ERHVzN13Pt+vuOPm1ws8L6QACw6MEW/OLBO6LqDEU1Xtms3F+mOQ9yjrzPnIJHCAZxqvotR+7qbeJLjNQoMtF+giIFUJ+95hTjpGGaiRB548zrXWZy6p9Je4M2HwkKddLinU8TYrJw5mIirRLyA82ZopHCPGKV6gJzHpkF39poCVfzHhDnILVEwAU7+JXo0bo+YDtoaOBfhP9M9FtwMh99dQpx7UToQaG/y0qxe4LT0bxOih/r5Y1g51Ij5u9FjRWivEgers6Yh6leVTp8Wvc4bOby+HJw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(376014)(36860700016)(1800799024)(22082099003)(18002099003)(13003099007)(11063799006)(261026121527099003)(56012099006)(10067099003)(261021123027099003)(261102123227099003)(261009223027099003)(261021121427099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	sD6xzw4bWMGDYeBUsYKm/anzgJmDJQNZoKEuvowc4JgS0KZU1cZ1AVB1eRJ/NfCBfVRbA4sEhldHsxMMz+hRjj5tDeTrNy/yFL86rkEMT+wkpUtFWxFYsDlFS+8E+/F3JOicwIm3f2GcwiGGBvDRieHejKqLRh2GNZhvklI8zVK5bBfbevdxCPfl6h9Y306liQ6Zqqvh2Cm0zTWxcANXlzsT6ciVyzGi1500W1bTDa4VXlnoTMg8xMKXLnfWFYn36GekhXkEmjVbp9KK9jbqYDwfJmvQfxnOH+Cpq1wEdvBmjDVkRtPvk42T8nDkGfcpxTrC49aDIrLmxGb4Eyofi4y5a/n1jvGalY4xGkeCL5eGsGidqHbHiWJEwIIc7/JIjk7uMI8cg2zvj3djfbESQxXKxANR2uBjTQiFy46mDGA2ngv4oMr/GYneUpa4q+QD
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 17:08:35.3006
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: abf5d613-6651-4631-aece-08df498468d6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH01EPF000BE944.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9028

amd_sdw_manager_probe() called dev_set_drvdata() before initialising
the amd_sdw_irq_thread and amd_sdw_work structures with INIT_WORK().
An interrupt arriving in that window could call the IRQ handler which
enqueues amd_sdw_irq_thread before the work struct is initialised,
leading to undefined behaviour.

Move dev_set_drvdata() to after both INIT_WORK() calls to close the
race window.

Fixes: 65f93e4096a0 ("soundwire: amd: add SoundWire manager interrupt handling")
Reported-by: Lee Jones <lee@kernel.org>
Closes: https://sashiko.dev/#/bug/linux-9890e8dc-4b7d-44d3-bfb0-171dc421e28c
Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/amd_manager.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
index b1a0e12819de..c412d4ff4606 100644
--- a/drivers/soundwire/amd_manager.c
+++ b/drivers/soundwire/amd_manager.c
@@ -1254,9 +1254,9 @@ static int amd_sdw_manager_probe(struct platform_device *pdev)
 		sdw_bus_master_delete(&amd_manager->bus);
 		return ret;
 	}
-	dev_set_drvdata(dev, amd_manager);
 	INIT_WORK(&amd_manager->amd_sdw_irq_thread, amd_sdw_irq_thread);
 	INIT_WORK(&amd_manager->amd_sdw_work, amd_sdw_update_slave_status_work);
+	dev_set_drvdata(dev, amd_manager);
 	return 0;
 }
 
-- 
2.53.0

