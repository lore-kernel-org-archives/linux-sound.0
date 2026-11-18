Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.61.71
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794998737;
	b=QwBzBTm6MtAwAoA6LQ5J/heqJtC3SVpOd2EBTQQRx0utZ1iJbHnVVmHxKXNTOn+foX8/
	 b3F84VRGO0zpl11HQ2TCAAcLDwbBP9e6FIH3T95mfbe9rDzqpuFqIE38/aco0ZEKLbl/3
	 TLlES5sX3N3NbIJBF27vJOD4ly7UvHAfKqd3Y+SCHImYAFdXIKadB0gJq6epCBGzqKYeU
	 tudSreeyRnvBvjjeqlwfd7z5tv6D6fFB1o/13GwKZzgLQGSFCr/DMH1jybdLw77LZo0nz
	 FhR+SEv44vHxeByDHM0896ayulEkClYPN2ZAkqHq1/vZSWTBKrYUNSoDU+Ml7u/fIgg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794998737;
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
	bh=ZQlfosryg5VU/RHcsVrcFyJNWu5CuzaiP+LCPgAAqjw=;
	b=ChpWe6iakaWjWXRout4ClqY0WSbpAfvMsD9aIph+F9x+T8aQe3m9y/ViUGga8No6PCgf
	 Ndgv2jPHCE/oq3CW9dzKx5I3f4HlYOPmx2gCQfb5J4cSWm2MGPuqDha9K3gSYITJkFndF
	 P/QUKhsr1bJpVwW15qbXpwcq5IUhlc9hMGYWAbXCVzu2Jr21DIjlktLi4UMti5EWALWwH
	 HNE4ji6rrPQZdXcq1dnmGbotH4bU3HhUxTLxgoIyJ134AsEWY+S/j5+HLsuWYnfmOsfKE
	 IWoyQHoN9n8TtorZvtQxcv8XTE6d6nuk90JooPl3FpU7YvNQIwIMOu6mfbIUZbbyATQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=jFVp0Vof;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.61.71
Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010071.outbound.protection.outlook.com [52.101.61.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD24B606A31C;
	Wed, 18 Nov 2026 10:45:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD24B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=jFVp0Vof
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L1+xn6nCylz6TxL0s3aQmcKdkvyY7+wZNpFHY6rS2c7LHG/3VhEMy44Etdu7GiHZeWdxWaHHxritdvDcrMab4X9tAABvBDHgktsrKHlIS7aF1y1n8ZiomTb020MKkAsxUJDcf9L8g2CAcUc6+GpxBP8KtFwXEVFnVU33pwYdRDuL2ZPVVtJZWivT0b6ARJbd/BCciDV9fVD6zsBPpxuX9grl4jVwPgaljUQoPIH2T/7g19scav1bm4Reiy9v/gPFFxH5PushBXxjFMBcZyMQsvYS1pJfdPvPljCd78uaCmfRTSlMR9MBozQE8xFh/K9t2K68wJXZV3yR65A2ENKGZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZQlfosryg5VU/RHcsVrcFyJNWu5CuzaiP+LCPgAAqjw=;
 b=jhwLKyp9DVcQmtf6APkgxNgo/96bB3hM3NWB2mQaPFzkkGD6ZQXOSrNGbP9gnZHKYpyyIfrqY1Y7ZCPydy7JjzOKxGWfdxdnyE5WjwLcrJKYoHCaeKXiA7hivZrO3HfqEOKnTqW5FYQ8n0MokQMTmKf/hyMfHlOEr22u0qH9LTxCXBDrID+v0e7Q2lG46cm/xAakY7zlupq6L3/Y+bkJ0NCCDGfNTQSbkjvhRmXpF3300KdxgxwE6gm46Qj5QoUO9udeSzjPnjbPELXKfUgeWC1CJ5prNyTkAdHVAdCv/NBJ3+VX2TGCU63hsV9tgHSUGMTlh7NXNjssqhaz527WjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZQlfosryg5VU/RHcsVrcFyJNWu5CuzaiP+LCPgAAqjw=;
 b=jFVp0VofxA9pRAPFf6Dh4THkjuUyWrqf37ceFlE4HVmkhXPeOQtY+DExuS5R/5TTApZtCHp42yZWd4CjDnWBf7JmfPuIyt1c5iD0LWhmsr+j12QOwmuldBbsxxltWMsB7Ak0ZqpFl3cD002R4V9U80jYOV7DP9206mLZA90v61o=
Received: from CH0P221CA0039.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:11d::21)
 by CH8PR12MB9743.namprd12.prod.outlook.com (2603:10b6:610:27a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 10:45:26 +0000
Received: from CH2PEPF00016D4A.namprd02.prod.outlook.com
 (2603:10b6:610:11d:cafe::46) by CH0P221CA0039.outlook.office365.com
 (2603:10b6:610:11d::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.10 via Frontend Transport; Wed,
 18 Nov 2026 10:45:26 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH2PEPF00016D4A.mail.protection.outlook.com (10.167.244.119) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 18 Nov 2026 10:45:26 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 18 Nov
 2026 04:45:23 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 18 Nov
 2026 04:45:23 -0600
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.57
 via Frontend Transport; Wed, 18 Nov 2026 04:45:20 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>, <Poojitha.N@amd.com>,
	<lee@kernel.org>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH v7 02/23] soundwire: amd: program pad SCHMEN and OE control for ACP 7.0/7.1/7.2
Date: Wed, 18 Nov 2026 16:12:21 +0530
Message-ID: <20261118104353.331556-3-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF00016D4A:EE_|CH8PR12MB9743:EE_
X-MS-Office365-Filtering-Correlation-Id: d5151575-3991-4606-c401-08df45610e40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|1800799024|376014|23010399003|22082099003|18002099003|261009223027099003|3023799007|261021123027099003|261021121427099003|261026121527099003|261102123227099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	2kjDn61keqqm2DpZuAV8ficpPEdmnn7hgXZWnjLaE7ZnAsBaOKegQfsyihIfmy89+aD37IPd/9GIZW6Tp/vbFxZMpiaC6OXtmLLeZLF5KoLo1FrdtnOZ/gYC6NabUcyCSjZlvJTPMAl0Y1FnLiCim48XpoXmLFR0T83yqVZ9YVWgOTUnZ+N+7t2iw4e+2PC1c82VbU1iL+VGLoHcipaHEVDiKtX084cl2A8TVQzqUXxFcnZwUp9wB2AJl5XVsDhuPlqChlw+Y/1KWZ9Ai6sfBwfAcVts+PArmWOEw8bimkovc2b+Hlvpy8xVpT5gQ5SovAOBigWbEacE11LfLp1IX5icJM0Qfs86r2pWpEY4cxzQxKWAKRnV2wYwnHM9EuhssVx1pcwx38Ib/PsrIBT8me/kpgcTOenOvpLgt9FdKQeGckMrM3g2gvpSP0+gWLNYEGIXFH4IDumbiBvLej6KbCD+TUFamkfCyS2r3XRiXVQayrZqRD2NCezEQ2rWb7bmDW6jhJ5dgT5LyYpX2cWx9/4jlcisUrRo+Pi74TwR27LnIuP26ht37dvbMnE7h5CpQqFh9EvkEc4U7FaZIRMhf1I0AB8RznwQmwXRbmAcLyYMc/WFv0rB+XjNOF0oeiiTs1VuwPSaVCK5tBA5hRWIU5wbNg1a+0+9CTZ+ad02Og93MbCrZhlPLNL4b2I7IejZixM06Ei2RLtE1iclZ4/TdQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(1800799024)(376014)(23010399003)(22082099003)(18002099003)(261009223027099003)(3023799007)(261021123027099003)(261021121427099003)(261026121527099003)(261102123227099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	hh92SFp9gFAJ9+HPJ2xSvaGApAz+4KIcUHGP0x8h54G2V1KP65dlLgT8UzQwI/3UdAjV/KC7Uj7ihLPfAjfi6uVb6ItQlLm/O9TmEvRjRSYtesmaVuLUhTRL2yJiTg/cSyoiQEpzYM/0q/W1omlF7r3BdN0x84RUc0e42vna0shXeH2m8cxZlSprBqzpn9QOqy07PMIZDzqswjHPGaT5rAFPaqwtQUE0s4f4Nnarld5PDnO0krfxpEeCIb7zzhIiEE97w1lFApfx52t6FhQ4DsS4Tf8KdACXPi3gdX6gxGIueBpLqA6e36TNxstY1Y7pdpupBhUPo5iQxU6fVd5zx6cHFdMbvSIqFAzcAqFmzqz8fM8Dh5kINoLHRQsm7HbYbpY0pKX1HRVOq+FKHJx+/Ft6FrV9OHydJii+4qcUgEcoXb5u9rsfrYo5YMh9sLVJ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 10:45:26.2822
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d5151575-3991-4606-c401-08df45610e40
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00016D4A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR12MB9743

ACP 7.0/7.1/7.2 hardware requires SCHMEN control and
output-enable (OE) registers to be programmed as part of the pad enable
sequence, in addition to the existing keeper and pulldown writes.

Update amd_enable_sdw_pads() to program ACP_PAD_SCHMEN_CTRL and
ACP_PAD_DISABLE_OE_CTRL for active pads. Pass acp_rev to
amd_enable_sdw_pads() and restrict these writes to ACP 7.0/7.1/7.2;
ACP 6.3 is unaffected.

Define per-register masks in amd_init.h replacing generic local defines
in amd_init.c.

amd_enable_sdw_pads() targets ACP6.3/7.0/7.1/7.2 only. The default
-EINVAL prevents applying this pad sequence to unsupported ACP revisions.

Fixes: 2c0ae8ef1e5e ("soundwire: amd: add support for ACP7.0 & ACP7.1 platforms")
Fixes: 34b1cb4ec286 ("soundwire: amd: Add support for acp7.2 platform")
Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/amd_init.c | 54 ++++++++++++++++++++++++------------
 drivers/soundwire/amd_init.h | 15 ++++++++++
 2 files changed, 51 insertions(+), 18 deletions(-)

diff --git a/drivers/soundwire/amd_init.c b/drivers/soundwire/amd_init.c
index b4f45bdf3c17..8019a4faeae5 100644
--- a/drivers/soundwire/amd_init.c
+++ b/drivers/soundwire/amd_init.c
@@ -16,37 +16,55 @@
 
 #include "amd_init.h"
 
-#define AMD_SDW0_PAD_CTRL_MASK				0x60
-#define AMD_SDW1_PAD_CTRL_MASK				5
-#define AMD_SDW_PAD_CTRL_MASK		(AMD_SDW0_PAD_CTRL_MASK | AMD_SDW1_PAD_CTRL_MASK)
-#define AMD_SDW0_PAD_EN					1
-#define AMD_SDW1_PAD_EN					0x10
-#define AMD_SDW_PAD_EN			(AMD_SDW0_PAD_EN | AMD_SDW1_PAD_EN)
-
-static int amd_enable_sdw_pads(void __iomem *mmio, u32 link_mask, struct device *dev)
+static int amd_enable_sdw_pads(void __iomem *mmio, u32 link_mask, u32 acp_rev, struct device *dev)
 {
-	u32 pad_keeper_en, pad_pulldown_ctrl_mask;
+	u32 pad_keeper_mask, pad_pulldown_mask, pad_schmen_mask, pad_oe_mask;
+	bool needs_schmen_oe;
+
+	switch (acp_rev) {
+	case ACP70_PCI_REV_ID:
+	case ACP71_PCI_REV_ID:
+	case ACP72_PCI_REV_ID:
+		needs_schmen_oe = true;
+		break;
+	case ACP63_PCI_REV_ID:
+		needs_schmen_oe = false;
+		break;
+	default:
+		dev_err(dev, "unsupported ACP revision 0x%x\n", acp_rev);
+		return -EINVAL;
+	}
 
 	switch (link_mask) {
 	case 1:
-		pad_keeper_en = AMD_SDW0_PAD_EN;
-		pad_pulldown_ctrl_mask = AMD_SDW0_PAD_CTRL_MASK;
+		pad_keeper_mask = AMD_SDW0_PAD_KEEPER_EN_MASK;
+		pad_pulldown_mask = AMD_SDW0_PAD_PULLDOWN_MASK;
+		pad_schmen_mask = AMD_SDW0_PAD_SCHMEN_MASK;
+		pad_oe_mask = AMD_SDW0_PAD_OE_CTRL_MASK;
 		break;
 	case 2:
-		pad_keeper_en = AMD_SDW1_PAD_EN;
-		pad_pulldown_ctrl_mask = AMD_SDW1_PAD_CTRL_MASK;
+		pad_keeper_mask = AMD_SDW1_PAD_KEEPER_EN_MASK;
+		pad_pulldown_mask = AMD_SDW1_PAD_PULLDOWN_MASK;
+		pad_schmen_mask = AMD_SDW1_PAD_SCHMEN_MASK;
+		pad_oe_mask = AMD_SDW1_PAD_OE_CTRL_MASK;
 		break;
 	case 3:
-		pad_keeper_en = AMD_SDW_PAD_EN;
-		pad_pulldown_ctrl_mask = AMD_SDW_PAD_CTRL_MASK;
+		pad_keeper_mask = AMD_SDW_PAD_KEEPER_EN_MASK;
+		pad_pulldown_mask = AMD_SDW_PAD_PULLDOWN_MASK;
+		pad_schmen_mask = AMD_SDW_PAD_SCHMEN_MASK;
+		pad_oe_mask = AMD_SDW_PAD_OE_CTRL_MASK;
 		break;
 	default:
 		dev_err(dev, "No SDW Links are enabled\n");
 		return -ENODEV;
 	}
 
-	amd_updatel(mmio, ACP_SW_PAD_KEEPER_EN, pad_keeper_en, pad_keeper_en);
-	amd_updatel(mmio, ACP_PAD_PULLDOWN_CTRL, pad_pulldown_ctrl_mask, 0);
+	amd_updatel(mmio, ACP_SW_PAD_KEEPER_EN, pad_keeper_mask, pad_keeper_mask);
+	amd_updatel(mmio, ACP_PAD_PULLDOWN_CTRL, pad_pulldown_mask, 0);
+	if (needs_schmen_oe) {
+		amd_updatel(mmio, ACP_PAD_SCHMEN_CTRL, pad_schmen_mask, pad_schmen_mask);
+		amd_updatel(mmio, ACP_PAD_DISABLE_OE_CTRL, pad_oe_mask, 0);
+	}
 
 	return 0;
 }
@@ -86,7 +104,7 @@ static struct sdw_amd_ctx *sdw_amd_probe_controller(struct sdw_amd_res *res)
 
 	count = res->count;
 	dev_dbg(&adev->dev, "Creating %d SDW Link devices\n", count);
-	ret = amd_enable_sdw_pads(res->mmio_base, res->link_mask, res->parent);
+	ret = amd_enable_sdw_pads(res->mmio_base, res->link_mask, res->acp_rev, res->parent);
 	if (ret)
 		return NULL;
 
diff --git a/drivers/soundwire/amd_init.h b/drivers/soundwire/amd_init.h
index 106852464dc7..8324bc7a147f 100644
--- a/drivers/soundwire/amd_init.h
+++ b/drivers/soundwire/amd_init.h
@@ -9,7 +9,22 @@
 #include <linux/soundwire/sdw_amd.h>
 
 #define ACP_PAD_PULLDOWN_CTRL				0x0001448
+#define ACP_PAD_SCHMEN_CTRL				0x0001450
 #define ACP_SW_PAD_KEEPER_EN				0x0001454
+#define ACP_PAD_DISABLE_OE_CTRL				0x0001468
+
+#define AMD_SDW0_PAD_PULLDOWN_MASK			(BIT(5) | BIT(6))
+#define AMD_SDW1_PAD_PULLDOWN_MASK			(BIT(0) | BIT(2))
+#define AMD_SDW_PAD_PULLDOWN_MASK	(AMD_SDW0_PAD_PULLDOWN_MASK | AMD_SDW1_PAD_PULLDOWN_MASK)
+#define AMD_SDW0_PAD_KEEPER_EN_MASK			BIT(0)
+#define AMD_SDW1_PAD_KEEPER_EN_MASK			BIT(4)
+#define AMD_SDW_PAD_KEEPER_EN_MASK	(AMD_SDW0_PAD_KEEPER_EN_MASK | AMD_SDW1_PAD_KEEPER_EN_MASK)
+#define AMD_SDW0_PAD_OE_CTRL_MASK			(BIT(5) | BIT(6))
+#define AMD_SDW1_PAD_OE_CTRL_MASK			(BIT(0) | BIT(2))
+#define AMD_SDW_PAD_OE_CTRL_MASK	(AMD_SDW0_PAD_OE_CTRL_MASK | AMD_SDW1_PAD_OE_CTRL_MASK)
+#define AMD_SDW0_PAD_SCHMEN_MASK			(BIT(5) | BIT(6))
+#define AMD_SDW1_PAD_SCHMEN_MASK			(BIT(0) | BIT(2))
+#define AMD_SDW_PAD_SCHMEN_MASK		(AMD_SDW0_PAD_SCHMEN_MASK | AMD_SDW1_PAD_SCHMEN_MASK)
 
 int amd_sdw_manager_start(struct amd_sdw_manager *amd_manager);
 
-- 
2.53.0

