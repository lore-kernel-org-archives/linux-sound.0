Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794998735;
	b=WAIIR9ypLtctc62sdqowZgYDokleLGg0Tm2szOpGcAJcQCpV6vXPRFnRI1fmRxWqjosB
	 v7IuMjDabkypLLSNQBCifnA+LfEYTbAdX9Z/1blskaEmu62recAK2U2rj+Dd+dbbbQzi0
	 cjSEcKXA2ZTHPWngR4IaT2m0I1cThDeiONWaDEpHc9fLOxflaanEYeeuqtSrJvC/6h7nC
	 3w0UcVljRF21xV3dfbq0kv1Gikwbh6uaixo0JbQPLL4pj+OhiREFhKLoTSjCs39OMIHce
	 sSHNa6cgTh3yQPffuxYhASCwfYcPNCGvw+rhaMMCj6dqVMZ8P07ve8WX0WzgJ7LAcsA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794998735;
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
	bh=gCb5h2va7SGjg6thRA1k+3PW7vPIfI0LQkXFqS+gdPo=;
	b=2ImhzkDe4I6oW6IzEAQtuc2ENWRYI4RDfjlaW08FsVf7xjPlQtdI9JpqG38eIQ5xP/EJ
	 xjkNdG9Dz1Cs8UT76bIItWgAL39J3UXKh7/jijOR3DHmhxsIzihmZhU014L1ktkzav/eO
	 ZejB5aiGWIIbemf94+xu6Srvnh6txcnDz2btFHcxeHtH65B+6t6s596KC0hrw7wytJ/N2
	 FJCjacajoq0xPczWN7GcSi+94cp1R1PDbCpci1VRhjYQRhZa1641kBvDKmatQ5hshQppt
	 FOH3P+TF+OxqlUrLJvGUuPo5JxRMJ8uqNVQhnASQaYm5cqEGdak2D7dNW/2tNilGnAw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=kWSgkL3Y;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.48
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010048.outbound.protection.outlook.com [52.101.201.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67CF1606A333;
	Wed, 18 Nov 2026 10:45:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67CF1606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=kWSgkL3Y
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N3UCaRlYQ5KTlvGY12pbMPLK6IjA3674PazHBwnCVqzIP8QCKrmCOzzrISS8/QKhYou8sunk3Fawq55o994br/t2Nveqp8LlrX6+Jy96+Uhtujf95aM80qkhDN8t29CDUmQazG5hU3VU9yljQrnFcFP+G/KdLPQ/UOPU+SVpUTpqelrjl8zGu1fV3Za3twGRVWs7Zb7Q3LvimHeM/BJZZOdXpUuhTIOglZ3lU3F4my+Wyi0J9ATiTyPeyV0YSzf8erxJQLfYrHPXoBFs7b7U3XjGxbGRwXwApWiy3GDh8KpciyQjEfaPDWTEnGB0FUDo6QJ3efM0agESTgepQrReBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gCb5h2va7SGjg6thRA1k+3PW7vPIfI0LQkXFqS+gdPo=;
 b=tVVaP0txBPi0/5Ccipk5/kwg433GiG9jfGE7C2Tk+lNci7Dh6FdIVoZq4LxEcCS1J31htADKMXCHyKAoxR1DSb2+5nK0Z2nzVVUDE41Dr1sch9hAVvgWY1nB2SuVoPuvnjV+0cElWBW4gyRn1zHI5hpieOCwVAidIMMwDDKIOoy11psjqu456UPcuch1nH/h1TUWDqNvmCFvsaiwHxdUAWYwQUfRQdUt63L1+uUR6mx2Z7SGatKFPrK/dlndC0KespRt8IFSVEvq0IoftdtLKAcG4JxIG0DNp9gHpYsLppdRcaK9pNIPYMJ4BJSnQtnIivVCrIgrzpM0khgsIoxf6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gCb5h2va7SGjg6thRA1k+3PW7vPIfI0LQkXFqS+gdPo=;
 b=kWSgkL3YoZSEFNk53Sb0Q2kDorI2QGLZuOwvWhREzY3nLJ7MYSp9Aqg67prAMuCzhjh4NxQ+yJLDgFTSvXIJuGbDysxV3NptqCYvOZ1dGZlgD2TTyZpe3aRX3h/4IQ3FkOGhdndb4q6tF6BBMOnmCwDqBi65RdNtVsSKHyhg5zE=
Received: from PH1PEPF00013304.namprd07.prod.outlook.com (2603:10b6:518:1::16)
 by DS0PR12MB8070.namprd12.prod.outlook.com (2603:10b6:8:dc::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Wed, 18 Nov
 2026 10:45:32 +0000
Received: from PH7PEPF0000000A.namprd04.prod.outlook.com
 (2a01:111:f403:c95d::5) by PH1PEPF00013304.outlook.office365.com
 (2603:1036:903:47::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Wed,
 18 Nov 2026 10:45:31 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 PH7PEPF0000000A.mail.protection.outlook.com (10.167.243.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 18 Nov 2026 10:45:31 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 18 Nov
 2026 04:45:19 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 18 Nov
 2026 04:45:19 -0600
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.57
 via Frontend Transport; Wed, 18 Nov 2026 04:45:15 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>, <Poojitha.N@amd.com>,
	<lee@kernel.org>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH v7 01/23] soundwire: amd: consolidate pad register macros into amd_init.h
Date: Wed, 18 Nov 2026 16:12:20 +0530
Message-ID: <20261118104353.331556-2-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261118104353.331556-1-Vijendar.Mukunda@amd.com>
References: <20261118104353.331556-1-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: PH7PEPF0000000A:EE_|DS0PR12MB8070:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a4e3990-8539-4d1e-8b48-08df4561117b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700016|23010399003|22082099003|261009223027099003|18002099003|261022075727099003|261021121427099003|261021135927099003|261021123027099003|261026121527099003|56012099006|11063799006|10067099003|261102123227099003;
X-Microsoft-Antispam-Message-Info:
	30nAOC2HLLa9PM5TLLZJQS7omu978ngrbs4Yevkq2y93S0u54d9pKMXgdl6Ku7G1NNjTkhCPocAy+vGGqQclR3Mi6NacYYUL5lvpdyyGy7uXa9ZQSNsUEOyqNpuSEIyxB3fftqqcOuPlGW6GUsX6OYyWNQc3z3Jq7vypVqK7rEfUoNTtSUIaFsMtrdA+BtqxIz0iRqOAEgP5i6SaSZNiXAtlsJee4e+zztLmT9amekYUwnJ1xzf87xoZj1n7w7IR94TaeLllrQG15DJcgptFBjtWkl0RCqPmlAnNkEVAdYhG1j2ATF5k+sfnBqN2PLF20Mn56MBWEz4UEvGS1rlzsNdXCUua+VbhsxFJ5UCp6MRA+NPCu8+qAyaXp/OvRsczgiKoIVAhFvp7h/XKSc2696a2tlkr33jkYsXAT/TSRNxef2PHq+gD0NRP7SQd7Ren+aP85TLhlfvXTwizHltaWn/TrpSNWrXpIMjkN/TcEsaduVp7wtMuQBzy4V18M367ZPehvw5PD7nGxFSBd6tZVluTljwUC0gPGmnW1HNnp3CUvcLpZJzPzTQHCVVv4p0fQm0ImY/btougdX8PaL0T+o3X/MBzyl4qb5n88CFcNrmFJPuWsAHqro1LKE5jL/OsXbKg8fhQPckE0yWW0z3p+OXcQn7t/59MIdyJJkDweaufR0WIjC/G2kA7bzGPxsNNvQA2aDOf11Z2Vvi8uYVkmg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700016)(23010399003)(22082099003)(261009223027099003)(18002099003)(261022075727099003)(261021121427099003)(261021135927099003)(261021123027099003)(261026121527099003)(56012099006)(11063799006)(10067099003)(261102123227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	5zd0L0UbcauMQQMABvE0Gj58d7Oz8r+q62VWz5ffMC7HyH8eGmUG+D4tb4DG6rXjr1JallCGaz1im8oFtK8OXtkhrGcGA0rZJfdqce2ffKVfZjU+4li/Kc2lQvIKoWLTXhBZD1OalGVhX6RBVKq/+8PTIWsfvr1bRITeRGm7/CDGv1PQEtZ+fx8OkgUxsCqSpnA/4Id/PSkdHa0lD3Uoo8mpYEbK5+9q+cqG+PKEi+dAuXXzLiJ/ZcLAxsuJW5IAKmyqK81oWZUbSBQvD8zsyBsonxkOeZ4HzpPsf5G2oUF62q32g5cusyg3w/MzKvWsF4II/xcgpX07mwpkBoXGdPAI3czb9oc7wRiS20UpD5wWtTPxpEEO6sy2KgshED0BQYRa890gVDE6o6ukcCrkQ1Nh0jh5wouKO1BHZhLuthbBuaesYCvlaFUu7LU3ZqRd
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 10:45:31.6565
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a4e3990-8539-4d1e-8b48-08df4561117b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	PH7PEPF0000000A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8070

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

