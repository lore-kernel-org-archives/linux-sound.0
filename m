Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.209.28
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795453639;
	b=oSY6g8/HvJEPXCeWWlqu5gk+tuXKLv04ggp+Qp8O6rJHt4SaALihgUQpz/t+Cue+74nZ
	 /PdE6X4Px8X46Vohxv8xGGwJE1ZIqSFodsDI0F+y966wbQcSvNLG5Ac18lr0zj1qyO/A4
	 yBtcD6udWvAvABanX+MsccsfUbKDmeOmIYgMcAl2/0P1DUA4+Znsu6t0PWmMr2he/bnlP
	 daoeLrh/fNqkz5x0e45NWzo8hHpOhanhtS4aljhuYoKpEe0ffBlqPOl1Mfl7LqLKGxYMJ
	 H/GzDGNvErCsf+nAIjbR+mHOo+jjqLBGSO90Bvbb5SQ8QysA1vNn14VPUjOH9CMvwmw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795453639;
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
	b=QFJYGtRtR1RfetwsOKCexLCiQJaoKUBJOEMHBSePsS5+g1bNUDTp7hF572erkRmQR99R
	 utn8bGUohKqVb9bee41k8I+LrdvO+ATk1kTWe+INW2NKKyPnQqhN2kU2NmtlS4NqqswG1
	 clVVyP4CMOB86CE6LcrnjKXrP6+JWDwmmnu2GmdP02bsImp59/1niHgEDDhiealp5bnUP
	 h0GFQHBG2wXCyW0fwtVSZ0SLjCD/LeViXrUX0d92/YE+15KEMRMoX4SNOms4GmKQan6P5
	 jdptGXe/abLT0h2rZs4UZqgk3XvpkwW/s/sQOdx2r19uN4yGTHz3sLAb5DMxFT9aEPQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b="M/9p/xur";
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.209.28
Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012028.outbound.protection.outlook.com [40.107.209.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13B16606A686;
	Mon, 23 Nov 2026 17:07:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13B16606A686
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=M/9p/xur
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NE88AwRMIT+ExKUyar7jw6u3/wbxmPP3a8Xtm/C0cJNdrnLMxlN4QHIiwUj4781VPqIZ/K3wdwLFb62ahJjA2DLpTUVxgL+cDpvsDnx36w4nqV7s0su+uxYe+wpqWdSm7OMaIFNhLR47wKA6uoFqYwWXOdxHbQp3ZICqxJPXXUbHo28gYhc0L2kvf69spS7iK2TMpf1VW0sad4JmKosNMGl3lD9xXeebbp/h+aW2sZZvT2Nz4IHQsIn+OnLC+GkufzjE3/E3LEWmnwoCiwWgBOTwdLo0B4fVvjghDy2DEQAHTDtWyhVyD86M12Yz97mYjYxpwc786r6y6nfRi6kCRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZQlfosryg5VU/RHcsVrcFyJNWu5CuzaiP+LCPgAAqjw=;
 b=mbdctilqJ3IjXjCsLCP3kA4s6mWxKbVoF7ATAcFurfG7IaVBaEqOjm6Swxzh7+B2ALtzmALTVVKVYOZn4jQZX6LCs1o6p1YEHLyWKMARlhmYKfkX3js9H4njdcscKzYiT9BWyEnoPA0f6rWhYNWHs+qx9wIyusn6R8s3yhjAYlrtCUUTvgS9SL4k88u0ikg3UjRBhEXWq8TmkVBM8YAznl7hbH0BhIg5uf5MChwg5EmDBsdbzmp3aZ53LZFXzxDis2FD3iEfOdWvAjWpj2UFZSoKSqjEK94XxRMbMndMYW/9pDQplkZXAkB6UCxehrNuhTNtlSZkNYOeKpD9b6WE1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZQlfosryg5VU/RHcsVrcFyJNWu5CuzaiP+LCPgAAqjw=;
 b=M/9p/xurd20Svx/zIVpkf4mD8ZsfJx5MXq5TGvgvn5Mky4jL/lRNUvJ0g4TwqaNxj3zd3dfclI1eSyMUjWyqxEWGlm3G0pfBkBk+NdiAl5nbMIphvpBRvXHXwpUtiMbtQJq6v66iTsLYPI/E2FJdYrS0ttTel9TueVhgA9DYkEs=
Received: from MN2PR18CA0029.namprd18.prod.outlook.com (2603:10b6:208:23c::34)
 by SJ2PR12MB8651.namprd12.prod.outlook.com (2603:10b6:a03:541::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Mon, 23 Nov
 2026 17:07:09 +0000
Received: from BN3PEPF00022BD8.namprd03.prod.outlook.com
 (2603:10b6:208:23c:cafe::35) by MN2PR18CA0029.outlook.office365.com
 (2603:10b6:208:23c::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.14 via Frontend Transport; Mon,
 23 Nov 2026 17:07:09 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF00022BD8.mail.protection.outlook.com (10.167.248.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Mon, 23 Nov 2026 17:07:09 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Mon, 23 Nov
 2026 11:07:01 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Mon, 23 Nov
 2026 11:06:35 -0600
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57
 via Frontend Transport; Mon, 23 Nov 2026 11:06:31 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>, <Poojitha.N@amd.com>,
	<lee@kernel.org>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH v8 02/24] soundwire: amd: program pad SCHMEN and OE control for ACP 7.0/7.1/7.2
Date: Mon, 23 Nov 2026 22:27:23 +0530
Message-ID: <20261123170520.1380924-3-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF00022BD8:EE_|SJ2PR12MB8651:EE_
X-MS-Office365-Filtering-Correlation-Id: c51f4a58-53c5-4b24-4482-08df498435b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|82310400026|1800799024|376014|261026121527099003|261021121427099003|261021123027099003|261102123227099003|11063799006|56012099006|10067099003|261009223027099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	cNUi2LYP/nd6SE8moOaIRux0CQYefJBJwCMkLGjQLlGMbYgmgELOAuRMpNfUn4RO+2SA4snqEsn5Qp4bOv5lY7nmbNcaYEl5qNyFlqqyb1YP3qcnz31tKpPM44bbF/gTCR44gGRl1hUp3xQo43XpkWvzCiah89uWNQFy1TZ9Tt9ZwW6YQOFtyJic3IPyigVxXBk2m5R0QV0jp9eEQkXmtL+Ch24pklS+Z5EiYN5YVgBQDeraEueTc/cSEvLhlB6nqFgp6Uf+e3yzdtDXVJj+juO7DPv23rBThET2kWor1k5FSrJOhPDRP08ZjSdH0OIaJYngkvH0ivcHa4xC3h7OoLxObZSLyYLF3phfw2xtHvOGqSTjh+A0rxt4rH/+Qf9pa8laN6VU9PKXMc+6QE4CJOgMWqCj8ixpi8e+oSQ4V+E+CyP+gnbn0ZN0LX09DFkN7clUQK9+aTAHxW0l8mu8p5WgWWmnXD946qpKxeNJr/TLjdKmqCGeJK5kHi8Tcyj4QgcKtnzu2rHkvI8gKMRC8rDHFn4WkQ876rrAY3sD2p8yBw0fymnxWD9l7XehHDLjL1txa2UIr/W7LzCV4PRCqKzJbO8ZbEsglVmAYQjQcfbtGSnmPEMVu90RMqDQNP9p6b/kUdSHePjRLF/2TgcU6D6GdO091Dxz/KntzQXWrI3AFY8Cu1FYs1QUctd//8JKbqx8OcvYmHVmq5wSKXHzGQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(82310400026)(1800799024)(376014)(261026121527099003)(261021121427099003)(261021123027099003)(261102123227099003)(11063799006)(56012099006)(10067099003)(261009223027099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	laIQg+Phdo25JUESIBBF6BtWzYdFfGWtolw/qdmd2Nh/bSVVXkQf3VlozBNUaSeP2pFMax1rBwQzDmFgh57Y3CH/yKy43s236vGIQZsyX29I1COhEqn2YgMLiRG1S296mQmeFVN5Xxw0i32FSsG8o1bG6DmiHhATTeQjMj4AyDktv+MjoBl3j7KHs0LCuk9JIyKlAXElU9oCEVldHb8PT7JMuv/YpKtXhkQh3qMLt1C236vszjGIrIesYpcwRKHwSDp7TC8m9rJxlTL69Ut5gZcruwqgPJrj3HgTE+QbuN6e6rXek77vW68L+XBWjf1bIYlg4v+f70czsYHvVBpZVlUYBYQWmIEqdfcJX/7l7CI36qFzVfbSNUhhmj/4qoJBzbG0uOxBdv15hAecKYTXWbNg7/XeumYoBAXQYu8ic8LqnpwNvZbRNR0DJtgaYkm8
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 17:07:09.4856
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c51f4a58-53c5-4b24-4482-08df498435b6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF00022BD8.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8651

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

