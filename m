Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.48.6
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795510311;
	b=gCvm02x2bO1ubOVxMtrvyU3kHTSApGlRQ7Th3dN1YwPjZN2ItoA//QKj13ZSvkVIh77s
	 DcBVjfn2uM+F9OsE3sPXcvf4CorS8aR+7NpAZx9DEErcvd6s6w9W71HsgH1we/a8pblvE
	 gJGhVmyIr+t4jpxRmfgBy2LUlLvVcTo1N60gdyCt1w7wk3dj6pnoNrwPHoHUQQPULulRR
	 4O7f9Cm/pStiLu2BGbih0ws1dQ+fvHHfYd2uakcuRnIX44WpspmPTubuKVbu4wKtU//Kx
	 yeztJDXUUTIHEC8+lAuv8RhnYBBq4whdjsBdWrSjjlCmd/Ip0/KhIRHmqiz/ESC0h/Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795510311;
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
	bh=gCb5h2va7SGjg6thRA1k+3PW7vPIfI0LQkXFqS+gdPo=;
	b=L1wBOznZY1t0NTxnVXs4bD7/tDCH/hVa9qErjoPv9Z/wqyG4KrG4nRBygrvNxkl3XmEJ
	 ej4wHeXk0+ecfgk/XFXrhK0JH0vjlfv6i7ZSuea3BbQ7ABQPtyTo4rIWl522TR1WHwYxv
	 kWYHKQT4ADmWhrKTwl83+jPqNRTrJrUtZi3TiYuVEAbouIo4EonzxVv/5eSL5ptL302xJ
	 d5rtfkl6a29NwNxAjDKmjcZkqRo7XCJIpTYHsiF9CRgUNMTvUsV2uoYCEM1qsMuvriZQu
	 veJUiUKx1I7m8OYxISNk9ajPs8pR+KC2ztd3P2QD6L9vH4TmJ/m/dA8nd25qy+/OJhg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=zohUdQ2w;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.48.6
Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012006.outbound.protection.outlook.com [52.101.48.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B35F6606A327;
	Tue, 24 Nov 2026 08:51:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B35F6606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=zohUdQ2w
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f0kqJyFfnGO3XJL3dhGC/QtGivaRdFPgVmOmb9jAXqb1P63J+mdoVGde2AYXBhuTZ/yh1DPahnEs0mgjIhYZuIrLaENQy5U9/grbc7UCkj7H+QBBUgqvJApA1FnnaF2uXB1kFKidHClsFQ4wuZD/piQ0ntkd2X1aLXjpAYg14Tu+MPWfU0CzN6da97f5ZMn66qOBh3G9On6X2YWenyh+zkQRE2eXDe6ayogCm0O85f2YeCCzmOrni/7liTR+BaWY8LPEPchkiv2rq0Qmr0YjjXvlr/LOo7aHB48qzjy381Aua3g4cu+y/+r/p7qVJIoudhndpwDSepW8LuyJNYa0WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gCb5h2va7SGjg6thRA1k+3PW7vPIfI0LQkXFqS+gdPo=;
 b=o8jt4jgJD+o+VXWGhI9yqqqKeevos8yu/9r9lQXWtq9wlUlxcrsf3GxTDZkEtygLvdSiNJ8j+u9Wj0H+mgzEB1/FZB7coATKm5CLcwEjgCBxc9s9QgdIUj3uscUNsB8WY4+vXZvQj2NZaO8oYMiY4y0Wf7o2JGuJF8TXT9V5xbMdiX+ktJN5OuYG+1ls0P6DYziP4psnr6ihY7M6vG5G1WGVVDXS+7osfQ2lHecKPwaQREac8W8VuMVV8ADU8bZn/MByHP15lU2TbsYY6Hss69sKo+7s+csIwLePTESMqbFclnB8rVRmt9Q4C8LHXvQq23oSkoPc+0sWgLYj0vD4Lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gCb5h2va7SGjg6thRA1k+3PW7vPIfI0LQkXFqS+gdPo=;
 b=zohUdQ2wqS7hpXhL5HhnJiZW5DxyAovNWuwYWRD29lH3fsQOqg7k2HnzgZAMBoie3fDow5tWfb5aot30vrCsfCfYOO/WLve2Fp6Mr+xFQ0+g83R+W9upECe7bCjC/PyuHg4+qJ+IF7ARNMP+6n7iNUll+QMh5lyoeFeQj/gDJWU=
Received: from PH1PEPF000132E9.NAMP220.PROD.OUTLOOK.COM (2603:10b6:518:1::30)
 by IA1PR12MB7662.namprd12.prod.outlook.com (2603:10b6:208:425::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Tue, 24 Nov
 2026 08:51:45 +0000
Received: from SJ5PEPF00000204.namprd05.prod.outlook.com
 (2a01:111:f403:c902::5) by PH1PEPF000132E9.outlook.office365.com
 (2603:1036:903:47::3) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.6 via Frontend Transport; Tue, 24
 Nov 2026 08:51:44 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF00000204.mail.protection.outlook.com (10.167.244.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Tue, 24 Nov 2026 08:51:44 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 24 Nov
 2026 02:51:43 -0600
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.57
 via Frontend Transport; Tue, 24 Nov 2026 02:51:40 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>, <Poojitha.N@amd.com>,
	<lee@kernel.org>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH v9 01/24] soundwire: amd: consolidate pad register macros into amd_init.h
Date: Tue, 24 Nov 2026 14:18:07 +0530
Message-ID: <20261124085033.682755-2-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261124085033.682755-1-Vijendar.Mukunda@amd.com>
References: <20261124085033.682755-1-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000204:EE_|IA1PR12MB7662:EE_
X-MS-Office365-Filtering-Correlation-Id: 8da6a424-2100-460b-baeb-08df4a082abf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|23010399003|36860700016|376014|18002099003|22082099003|11063799006|56012099006|261022075727099003|261026121527099003|261021135927099003|261009223027099003|261021123027099003|10067099003|261021121427099003|261102123227099003;
X-Microsoft-Antispam-Message-Info:
	iHCQbbPITiQ088QDxcLnElWNLVi+186g4oxvG0yV6oPFXxVm+VQqQmZZcuMg9AJVDTbnnmVVBRNDZbeXg68yUN5GD15Fe41CnJXovbdN7oVhoC7KS76bHhlr0hjCUIL6fh0537FH1oDbyosCbO6u2rvoho6fTog0VMeNBrqvddqVoivWgQDK35Bltthn98cYaeVIIsa4NN1UyIMbqF1uXOh0EtrpWTyirElFi2wBY9Zq2x9TQYT2QxGZUHCQSAY6NU8z4FHXv28FIqJ32CVIc5MSXTy3OQw73sPrb9y6aksG0XNPImu7hTgzeQcvjm86hV7OwQ3mhZ0+EPt+januoR3pWTlqIES1Qut8H2/ZefwDyi0dYgu2yc3Hf7kc0AqWtvZoQeYosz1+D4pCXfKrlk3+JsO8GZewN+NFVf50BBEiN/czFvA1zzui/SZsIrj3vdgStJUxypUFNn3xCZfbA8n/2MKb4mDCBtgpQ/pT43w+mW0y5nSahBdLV5CTo5VscdFmRwSOX5c7W5uknBSVUs1RBaKe+kzI5gCknls9f6Z4jzrg0DkJrk7t/DuV2YbrSd6HnR8lKDZXtf6gTn9U/ziWXqsbHyqjhB9tUgBbydrUH5ZJGyCtsBc9uFDRD3nneU2aSRSbAXiJ2Rwz2G9KdBVN5BLpFqcR9utZpNB3uz6QROQtpYQ2iUgn8CygnV4XAdKubqg8pkebMrs3JmeuUQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(23010399003)(36860700016)(376014)(18002099003)(22082099003)(11063799006)(56012099006)(261022075727099003)(261026121527099003)(261021135927099003)(261009223027099003)(261021123027099003)(10067099003)(261021121427099003)(261102123227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	v78ffMXLOCbPD2ol9QBd9qLMIcloEUdRBEGE1cfe4w/LzJs4WAvc4Yu90nAV4qYV+SwkQb7gHpVe/vN1WIBQzdievVObHkkCCuFnlfJNL0sNlf5+zMRxVI9Q49VM5gXt8JvLzasAKO741h0YDko81MjD0gX1r1R642U494WkvO0syjQqlKevrdjrJ2WUqUzPE66J5GC1fRsgdcAiUZYnTlYJZT8WnykvRwfPouqv6O/DIRVa3WGLUlGwzHqGoNDwIRr/ZrRPfULZkzheDdbY5/nPPU88LHhGVo9mZhiV1L6jp+Ujkkom5d7hgqtluVDKAKxHxibnc0Nt676ptFl3fJM9XD3EdrZPy1gLO/HvNex0fviJcZMYhvTxJhPvdC1R7aUH8EzPKgTEcXJd1XSQu+jB3vzK7/wl5oteEadteNOZrBqr4IL7yY7ZjrvffnNB
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 08:51:44.6049
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8da6a424-2100-460b-baeb-08df4a082abf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF00000204.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7662

Move ACP_PAD_PULLDOWN_CTRL and ACP_SW_PAD_KEEPER_EN from their duplicate
definitions in amd_init.c and amd_manager.h into amd_init.h, so a single
canonical definition is shared by both translation units.

Drop the eight stale AMD_SDW{0,1}_PAD_*_{ENABLE,DISABLE}_MASK definitions
from amd_manager.h; they are no longer referenced anywhere.

No functional change.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/amd_init.c    |  2 --
 drivers/soundwire/amd_init.h    |  3 +++
 drivers/soundwire/amd_manager.h | 10 ----------
 3 files changed, 3 insertions(+), 12 deletions(-)

diff --git a/drivers/soundwire/amd_init.c b/drivers/soundwire/amd_init.c
index 8e419ddfa516..b4f45bdf3c17 100644
--- a/drivers/soundwire/amd_init.c
+++ b/drivers/soundwire/amd_init.c
@@ -16,8 +16,6 @@
 
 #include "amd_init.h"
 
-#define ACP_PAD_PULLDOWN_CTRL				0x0001448
-#define ACP_SW_PAD_KEEPER_EN				0x0001454
 #define AMD_SDW0_PAD_CTRL_MASK				0x60
 #define AMD_SDW1_PAD_CTRL_MASK				5
 #define AMD_SDW_PAD_CTRL_MASK		(AMD_SDW0_PAD_CTRL_MASK | AMD_SDW1_PAD_CTRL_MASK)
diff --git a/drivers/soundwire/amd_init.h b/drivers/soundwire/amd_init.h
index 5e7b43836a37..106852464dc7 100644
--- a/drivers/soundwire/amd_init.h
+++ b/drivers/soundwire/amd_init.h
@@ -8,6 +8,9 @@
 
 #include <linux/soundwire/sdw_amd.h>
 
+#define ACP_PAD_PULLDOWN_CTRL				0x0001448
+#define ACP_SW_PAD_KEEPER_EN				0x0001454
+
 int amd_sdw_manager_start(struct amd_sdw_manager *amd_manager);
 
 static inline void amd_updatel(void __iomem *mmio, int offset, u32 mask, u32 val)
diff --git a/drivers/soundwire/amd_manager.h b/drivers/soundwire/amd_manager.h
index 88cf8a426a0c..98c814d5d7cd 100644
--- a/drivers/soundwire/amd_manager.h
+++ b/drivers/soundwire/amd_manager.h
@@ -11,8 +11,6 @@
 #define SDW_MANAGER_REG_OFFSET				0xc00
 #define AMD_SDW_DEFAULT_ROWS				50
 #define AMD_SDW_DEFAULT_COLUMNS				10
-#define ACP_PAD_PULLDOWN_CTRL				0x0001448
-#define ACP_SW_PAD_KEEPER_EN				0x0001454
 #define ACP_SW0_WAKE_EN					0x0001458
 #define ACP_EXTERNAL_INTR_CNTL0				0x0001a04
 #define ACP_EXTERNAL_INTR_STAT0				0x0001a0c
@@ -180,14 +178,6 @@
 #define AMD_DPN_CH_EN_LCTRL				GENMASK(2, 0)
 #define AMD_DPN_CH_EN_CHMASK				GENMASK(10, 3)
 #define AMD_SDW_STAT_MAX_RETRY_COUNT			100
-#define AMD_SDW0_PAD_PULLDOWN_CTRL_ENABLE_MASK		0x7f9f
-#define AMD_SDW1_PAD_PULLDOWN_CTRL_ENABLE_MASK		0x7ffa
-#define AMD_SDW0_PAD_PULLDOWN_CTRL_DISABLE_MASK		0x60
-#define AMD_SDW1_PAD_PULLDOWN_CTRL_DISABLE_MASK		5
-#define AMD_SDW0_PAD_KEEPER_EN_MASK			1
-#define AMD_SDW1_PAD_KEEPER_EN_MASK			0x10
-#define AMD_SDW0_PAD_KEEPER_DISABLE_MASK		0x1e
-#define AMD_SDW1_PAD_KEEPER_DISABLE_MASK		0xf
 #define AMD_SDW_PREQ_INTR_STAT				BIT(19)
 #define AMD_SDW_CLK_STOP_DONE				1
 #define AMD_SDW_CLK_RESUME_REQ				2
-- 
2.53.0

