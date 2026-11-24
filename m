Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.209.31
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795510314;
	b=DF+n8KMIyWmZqr96fMeancUp2kwjMZw5Ikz4SjcoZd41jjdi4eTXcaENIMHd8+cpnx5A
	 OjBnHtE7hk5ZKhc3ZOd9rZTHfPArlC1oVw35y7mSycjCE9Q7jLPE8QO/R6EJrPu5FbTmi
	 2m2qUdv1E++30g3YBXDpZmulhG4JLWl3JeiF2vGbba4YAQ+QcsSzBZzB69lmXVCft2jJa
	 e6ZjHD2hvkI6IyynDN/NbVQ1Q+pkZ4e2jVf95zObzblOOQ8Bv6H2K/mol1vgvIBE/WMeY
	 M6klPJwm8Ujmb5SYSHliu8hqeKEQoaZbriTmtmKXzV3hVP+O1DYds8mSKZgch2WmrVA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795510314;
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
	b=tdpJS4r561IhR4FwMoHuKFT2IubZC/FARrprycX4Z2IugG3VGLvS00IrnIfpVtQ58kra
	 bV4JCCNgh1Ov9/nmDKd0dTOwn1PxxEakjRMwOHLTa/s20YSbR8vrOY0QBn6kyLm5otstf
	 Hkb7QhytfvyeGbu5bJjg/4E7rYR1L2R5E1NyexV10Zp+stn5gNtRyOKIjCps9PXDJdPX3
	 T6h3yENKBfwKhZYapalsZStCAiZHPrT6NIYMzfbWXmdRguFxvfzzYX1h3ou/lUYZvICLK
	 elqQeiN7EQM72NW3EziL4qYNLqaNsl/Zwx1e5Tbdauf91Js+8BVJ57/B9oqV4B5w1sA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=nhPSvE3m;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.209.31
Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012031.outbound.protection.outlook.com [40.107.209.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4870606A331;
	Tue, 24 Nov 2026 08:51:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4870606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=nhPSvE3m
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xbVHy3aO0tZ8G8JWtLY9PyGIPjnXpG9qsCVl0DERja/MG5ddaE6iLCYt8T4d00S/0zrvJPhzZJ1FcJ8RpULdLz8wXuMyYXFAfmzNpEw2ojuev6oIQdoY5gpJvAEb8TXPmMOAh1fNJtWP6jT+16FNmAB4BC2CVavN+lspmdaBl3CHmlT6CK7r5oygtQPomynuVPa4IASmH9xCg7ijRVZyq1uCNfsz5+4Vn4Df+CCRWXjmh+3nFbxlWakpbljE8D+q3v2SrvDCVL0Zweuz9RmwsAldMWF/KnnNr4as1ZbayL8qvsd/I8jmIN+8SKu/N1+jXUb/bS+CjiqG5UAv7wy/RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZQlfosryg5VU/RHcsVrcFyJNWu5CuzaiP+LCPgAAqjw=;
 b=N/mNsveu/fYd86YIfRNsmDmrYPT8Zb3xE8Kdbm9cYmlUzNYZj+G5S//Yt/DeKwAuiwinwcAClqrLh204PfHUdrl4sKkE64rqgRWoTVCbHxXnmFcf4dThMrFa/n2Zf0dkOmufSor8tq24hCgb2rGiOhuJtc5B6MUnjS4RBwa+QOY9TZglWSqcb/4+kJX7UJEggj5erYwKLaPwd6iFd2kfSO78ApxINQTdFaZ8JGOEw50n0vCwz/wbCp+UDqnN4TwR57ug6Q/tyx2Oiabb1G/EjodeF98mLxrHeTtNacCaPhmhveXxGUhMkxoAmq6bEGSjVTdXT/D0C6qimAvx63CbLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZQlfosryg5VU/RHcsVrcFyJNWu5CuzaiP+LCPgAAqjw=;
 b=nhPSvE3mmvH0fiCZyfGVkXnV4gpvJoA+A9jLpkeqQSxdmIYbCcJz2DNbnsl0bwn7MD15Z53vV+DbukSNMix3AnnQSTulsbdinb2sAnRO/ZHa7Wecv/vYDIP8feldbTqSDXu4ilw70ECCtjxOusuSGi7ufEDkS4j/vy5n6Gwfr4U=
Received: from SJ0PR05CA0035.namprd05.prod.outlook.com (2603:10b6:a03:33f::10)
 by DM6PR12MB4299.namprd12.prod.outlook.com (2603:10b6:5:223::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 24 Nov
 2026 08:51:49 +0000
Received: from CO1PEPF00018860.namprd02.prod.outlook.com
 (2603:10b6:a03:33f:cafe::48) by SJ0PR05CA0035.outlook.office365.com
 (2603:10b6:a03:33f::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.5 via Frontend Transport; Tue, 24
 Nov 2026 08:51:49 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CO1PEPF00018860.mail.protection.outlook.com (10.167.249.249) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Tue, 24 Nov 2026 08:51:48 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 24 Nov
 2026 02:51:48 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 24 Nov
 2026 02:51:47 -0600
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.57
 via Frontend Transport; Tue, 24 Nov 2026 02:51:44 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>, <Poojitha.N@amd.com>,
	<lee@kernel.org>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH v9 02/24] soundwire: amd: program pad SCHMEN and OE control for ACP 7.0/7.1/7.2
Date: Tue, 24 Nov 2026 14:18:08 +0530
Message-ID: <20261124085033.682755-3-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF00018860:EE_|DM6PR12MB4299:EE_
X-MS-Office365-Filtering-Correlation-Id: 02a920b8-6429-4d0e-222f-08df4a082d51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|1800799024|36860700016|376014|261026121527099003|18002099003|22082099003|3023799007|56012099006|261021123027099003|11063799006|261102123227099003|10067099003|261021121427099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	4ipKnuI4GMM2TWcy0DO62V3jOrwkzBOIeq7fcUlr32cGIREvg2jvCCn49TOg191Xu69CKq0xiE1Z0aLxJyYNDpJaTnk/cp7pyhL/pFQEpl2H4VGseay8MBu0PTuMZC9iBcMaEh/F6v12Zt2KDbnPnUIXo28lmS7XKZp/Qpqdv/uCVLWefDUjurS4n5Me0BiL7hRIJL4x3/cxXa9hdS5GWS+simz+61cxHbP6Y1bA496zPiVyTFyJQ4MJWtasSLajktRcY+kdJ2HQUN37SeVcHkd8FDI1QheysNu1PpsbPXYdvE8ASgSNLvcQRdv8sw97PFhUdFL/CPGUzkMVQzBcaXHdyyN6KoX69yUT/qewEyj/7WvXZ575zoEdjy4rJr3RSmAAAGayAwXd7TYGtCid8euIKHlRcm8PvAgR3tEC8u3oOag2Ef9Sl3BIo3q94DKP8EUR4TF+m6JAZny9ihnRAi9V5WfstLnIxlWQyF+ZjEk3oERlukHXI3oh5rSfmLvxbhFD6iYN4sTuMvLGD+VcoAHmo2SnornS1aiV41QM1wvMpmXpZ5Jez2yhSyC3aCCM63R6LGq0DWGVnqwqch3biI/23MvgcXLF+tWCugvU5AFarZ5F1OpbUvLHMZPageIRSOjxepSzg036LmFPaybYv4V9fber5iWf5UIOvDOltkBotc/wmgghoqV7acXg5DTMjL4/h0r2gqf3h42dKO35Jg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(1800799024)(36860700016)(376014)(261026121527099003)(18002099003)(22082099003)(3023799007)(56012099006)(261021123027099003)(11063799006)(261102123227099003)(10067099003)(261021121427099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	AS2oq5A4CyMQCriT+1dcV2afidhvFR6zlV2L/jxWspG+QDx21q67OAhDtHFeZ5L0O4Mzdctn8J92FrT1aAXH+SkLJfELkwo/d5VkWIXK3roBpJ1yOXgB1GVWh3siN/tQiRniCE7jpmWiHIzW3xYQQA1nSfULqz8vRZz6kL3GB3LUa9yn/xZSRvjf3XwmJtcy5bkuEzZEmETMzqp+QIJYl4QqIuTZACD84b+MlLafvjNjxUaMLGHD/ToJamKDxZwIuF9BDF5gzbOpdAVFjrU8zJJwe8WUhevgH9gnTwA9A1zy8C+m+TeNeGRHtpHrttEmcvJGWN/p0b1fgEL6RKChDmLzqBZCvk88EguYRSsmIi6jwmd9xRkws5HHA7vWkF5OrwkecA2TWFnETDUWk2F7vJHDImvg97KEAiJJBS4bpOf2NwSA2P2ofekSA2lEQ/qf
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 08:51:48.9023
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 02a920b8-6429-4d0e-222f-08df4a082d51
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF00018860.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4299

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

