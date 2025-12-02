Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023140.outbound.protection.outlook.com [52.101.127.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAD982868A9;
	Tue,  2 Dec 2025 11:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764675102; cv=fail; b=FW0MPtFJuKmB93dUrZjXOL6FMI7v9rw2tc9/xmpypMu2m28phSAvILfXZFt/swtSJpyZPC/jebgsmn6CXtzqt7NPgaXR8Gh4kwufo58PuL/89a5dkgn3Oi05qtCrRz5hJIUBcQccsmthOGjVP6ebyE+ZwO6q7Sn1nXYHn5d6y4U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764675102; c=relaxed/simple;
	bh=wMdwvgModeGJZ20CRJIWrPDfjhQU4+9InMMctbilEW4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=J5WltZ0p02lABioNCT0GJTNXQy0sRdn/r0u2guEGw1ce4ay/lLW+jFOGOCk3q4xVESMm6BGtIvnKYYgdZwFSb9/fdmieEGPuAWiEKc5s9NllenWMGeUsrAFonRmIVpMtZYk52bG4for2CuIr8mAhvCPC4Jy12yELuk+sSf0MN1M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=52.101.127.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SWj5RJIr0eQKPNDkrksNRUmq3TulLoi0r1CQ7u0zX0zc0Aopk1H7UudEIhD0kdVuzeZMYbXL/goG2q5651kC9RYjvoXBEMUMzIqybC/pF286PV29IAuh73NYExyI/bKN9R2MdS1fM2phNKg9ny2aZMvbu9EgcL8zGGVoHZ4N/yZu3Ce6zOPn6UzgNvvHz38wfTaBTJd7PVxMIWM+3GH6gWwh7qCUSc15KQs0gQJBzwkPKdINYsPIFtJXsfagI52YRadJktmpqTu6FYYvQDt60UJzKi5nzpcAP5JwQjIYqSIOjfw0GmijFjQDAwelRmsZCaD5FMXoag2wqa/8AmYxIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nMbur733VOPNUtlsvPEKFkVyvPakaepaDPG0qLBy/bM=;
 b=fDVSMt9VZIv1IggX2ydPDiFD6ajC3vGFTCiegt4IGMW4oAutmXeJGsC3TY2F9woQpFE0LWFdl7mkzU0VbvwvPTOKTCWNCAru1yjs6Q53okfAOy1QOPep4oJwOFB8oIddj8n8H5iID5/CNVNdEJZ2icchpBqz4pFcyNsJkiDzIujuL+x3O+SiWkcxz1yVs0J28AbrL1EwbT6GxPk+O0pjcpKleD5iDDRB5rIUhEn1UOo2kG9fTWI7TQ5JGAbcQr5dirFiBqk6AXL4EO2FZ6xYiZcrVmdNFWosgBOvIF9xxe1S/A6Cji3aXH09rdVrwo9X/oT/BVnvLiIBc5yMq1a+bA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from PS2PR02CA0032.apcprd02.prod.outlook.com (2603:1096:300:59::20)
 by SEZPR06MB7022.apcprd06.prod.outlook.com (2603:1096:101:1f2::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 11:31:36 +0000
Received: from TY2PEPF0000AB89.apcprd03.prod.outlook.com
 (2603:1096:300:59:cafe::74) by PS2PR02CA0032.outlook.office365.com
 (2603:1096:300:59::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.17 via Frontend Transport; Tue,
 2 Dec 2025 11:31:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB89.mail.protection.outlook.com (10.167.253.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Tue, 2 Dec 2025 11:31:35 +0000
Received: from localhost.localdomain (unknown [172.18.64.15])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id BD30E4143A8B;
	Tue,  2 Dec 2025 19:31:34 +0800 (CST)
From: joakim.zhang@cixtech.com
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: cix-kernel-upstream@cixtech.com,
	Joakim Zhang <joakim.zhang@cixtech.com>
Subject: [PATCH v4 2/3] ALSA: hda/core: add addr_offset field for bus address translation
Date: Tue,  2 Dec 2025 19:31:30 +0800
Message-ID: <20251202113132.1094291-3-joakim.zhang@cixtech.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251202113132.1094291-1-joakim.zhang@cixtech.com>
References: <20251202113132.1094291-1-joakim.zhang@cixtech.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB89:EE_|SEZPR06MB7022:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 8bac6762-b729-4220-e8cd-08de31965a39
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hiVwdFQVpusFvXhMK58Q0VVXI3/SyjjT+VUtr4YFZmaLDDZvBPcSICN/dTiv?=
 =?us-ascii?Q?KZID0SpKtkrNoNY+5ggq8dty+usDUGY72k/UYIRs3wCmI93ywUV0ri/oW2wO?=
 =?us-ascii?Q?5zw7llaEkN+Tcv0P3J22na4naXVjndBRKZ/hAeVjtT4OFK3d6PklaIHS60BB?=
 =?us-ascii?Q?290aP4f+7BhpTo1lKN3eHyYk3I+bJfRnZB4AlnHFEWs8re30jD7w0qIVzfVr?=
 =?us-ascii?Q?i2gqBgskVWyFAac1QMiZ1tXRWf1k3524M7o8su6pTLDp27rCPmileDrvExbz?=
 =?us-ascii?Q?vJowhEIvGt5C2x3XZeNxZNYbdJs7uvKL9UGnf1/mWGdKJPQBnY7Xqi7C3jHZ?=
 =?us-ascii?Q?znSVYCKD/OQr/pXXFD/fuIxRpVepclV522C4eCC69Gs/kmDYDV9jQ2q/hw+j?=
 =?us-ascii?Q?KGKqdaPsUGb9vXgv80s9B7A27MPoqKvYjPqiWzNGSMMmzcB4UFNKgWfavgwm?=
 =?us-ascii?Q?h1iwpWSq2xfKHUFeE2oORSqSEuYuemuM2WUq6wJ28h09MpdzCg4nqI+uP4gF?=
 =?us-ascii?Q?NzesuHcjhX1XtTqv2JePM9WZVPdYMq99ruTU64F+vi0kCpsY/8EKFl105Rxz?=
 =?us-ascii?Q?5+B8SwjEO+S/OtdT6nKuYV8+EO4uqg874Og5DoHxWWJ9W/yDBRX5fA+lmWpu?=
 =?us-ascii?Q?qVgAA9py/IyynvUeV28wP4SAHcbY8EDWvCcY/kfMBztaU47752qzUgdqbO6W?=
 =?us-ascii?Q?xw2IedPodurvNBZpOA+jaeLOaogkqQ9GkXlTeo4q8YuAiyUgSP6Cug6wh6hD?=
 =?us-ascii?Q?EAmBlZI94UuU/r3bEo63fP6UUUuhEyDQNHyMc2vLYvCBP/zCPbNUwpO48LZK?=
 =?us-ascii?Q?caVfrCBJdGLtNNLc0byA4UTYJU9IKSfd9LmdMnG802zErzBMAJ9DQPjUoqQC?=
 =?us-ascii?Q?nCdL2pIUAHsXa99Iq6UnGMIyfZK8r2N48YbT/38NUZfTJ5cgwCc34+SGMUrq?=
 =?us-ascii?Q?5iRk+d1rQMBcrD0LvNg1+3w3e7WcNjWxw2lZkTZYAgs3X2/C7hVVC3xZv6eK?=
 =?us-ascii?Q?JmnJ1QqJniFNdiU/5SispL6mR6hOqSMmorx+wW9aSyCkR8PcV3ZH4n7lspUQ?=
 =?us-ascii?Q?scLmT/0Pbla9npiaUBRAOywvU7cx1bU2kdHnAPH7HOsLPbQ6QbUKqpXSnUoT?=
 =?us-ascii?Q?yXFpWRn7Nj5D0BaXfYUhGHdQvYaKATxvB0EVOPXz6uDSi2A/vAF4mvMj1GuK?=
 =?us-ascii?Q?IL0LFZC+g6vZeYm8l6nFiGg0XXxDwfjpfkpfDYIe2BKxJ4WrMbPlG7OUerD+?=
 =?us-ascii?Q?uoJ4pZKuyN+yPTmVKofx/WL8U1nDHivC6fD/hH59Gh2w5mu5kLw3eYhQc9Wp?=
 =?us-ascii?Q?e2HCMu/z2h94iTYNq8aCa96Ov2JDKehhj3HizIbLZtr6CB1QRU3M2YV/nWbd?=
 =?us-ascii?Q?BF2eBCEc+tr+efhKpiTePwN2c6hVWuzPUURN54JgJOQClhQXtaEW0OvTho8l?=
 =?us-ascii?Q?+opkUeYyCEfb1FRBqM2P6fBz9gie1BqdOhxR9B1bGihCyqp6f+jv0psZhvSz?=
 =?us-ascii?Q?YS+zxjvMZUVEeLiByT/I2xmpkor5Kbo4EDADcz/lT1yJVBUo+9SnpAkNcCCC?=
 =?us-ascii?Q?dNaTsBOErRV4UErju3Q=3D?=
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 11:31:35.9275
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bac6762-b729-4220-e8cd-08de31965a39
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	TY2PEPF0000AB89.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB7022

From: Joakim Zhang <joakim.zhang@cixtech.com>

Add bus addr_offset field for dma address translation,
for some SoCs such as CIX SKY1 which is ARM64 Arch, HOST
and HDAC has different memory view, so need to do dma address
translation between HOST and HDAC.

Signed-off-by: Joakim Zhang <joakim.zhang@cixtech.com>
---
 include/sound/hdaudio.h     |  3 +++
 sound/hda/core/bus.c        |  1 +
 sound/hda/core/controller.c | 12 ++++++------
 sound/hda/core/stream.c     | 10 +++++-----
 4 files changed, 15 insertions(+), 11 deletions(-)

diff --git a/include/sound/hdaudio.h b/include/sound/hdaudio.h
index 4e0c1d8af09f..f11bfc6b9f42 100644
--- a/include/sound/hdaudio.h
+++ b/include/sound/hdaudio.h
@@ -380,6 +380,9 @@ struct hdac_bus {
 
 	/* factor used to derive STRIPE control value */
 	unsigned int sdo_limit;
+
+	/* address offset between host and hadc */
+	dma_addr_t addr_offset;
 };
 
 int snd_hdac_bus_init(struct hdac_bus *bus, struct device *dev,
diff --git a/sound/hda/core/bus.c b/sound/hda/core/bus.c
index 9b196c915f37..81498f1e413e 100644
--- a/sound/hda/core/bus.c
+++ b/sound/hda/core/bus.c
@@ -47,6 +47,7 @@ int snd_hdac_bus_init(struct hdac_bus *bus, struct device *dev,
 	INIT_LIST_HEAD(&bus->hlink_list);
 	init_waitqueue_head(&bus->rirb_wq);
 	bus->irq = -1;
+	bus->addr_offset = 0;
 
 	/*
 	 * Default value of '8' is as per the HD audio specification (Rev 1.0a).
diff --git a/sound/hda/core/controller.c b/sound/hda/core/controller.c
index a7c00ad80117..69e11d62bbfa 100644
--- a/sound/hda/core/controller.c
+++ b/sound/hda/core/controller.c
@@ -48,8 +48,8 @@ void snd_hdac_bus_init_cmd_io(struct hdac_bus *bus)
 	/* CORB set up */
 	bus->corb.addr = bus->rb.addr;
 	bus->corb.buf = (__le32 *)bus->rb.area;
-	snd_hdac_chip_writel(bus, CORBLBASE, (u32)bus->corb.addr);
-	snd_hdac_chip_writel(bus, CORBUBASE, upper_32_bits(bus->corb.addr));
+	snd_hdac_chip_writel(bus, CORBLBASE, (u32)(bus->corb.addr + bus->addr_offset));
+	snd_hdac_chip_writel(bus, CORBUBASE, upper_32_bits(bus->corb.addr + bus->addr_offset));
 
 	/* set the corb size to 256 entries (ULI requires explicitly) */
 	snd_hdac_chip_writeb(bus, CORBSIZE, 0x02);
@@ -70,8 +70,8 @@ void snd_hdac_bus_init_cmd_io(struct hdac_bus *bus)
 	bus->rirb.buf = (__le32 *)(bus->rb.area + 2048);
 	bus->rirb.wp = bus->rirb.rp = 0;
 	memset(bus->rirb.cmds, 0, sizeof(bus->rirb.cmds));
-	snd_hdac_chip_writel(bus, RIRBLBASE, (u32)bus->rirb.addr);
-	snd_hdac_chip_writel(bus, RIRBUBASE, upper_32_bits(bus->rirb.addr));
+	snd_hdac_chip_writel(bus, RIRBLBASE, (u32)(bus->rirb.addr + bus->addr_offset));
+	snd_hdac_chip_writel(bus, RIRBUBASE, upper_32_bits(bus->rirb.addr + bus->addr_offset));
 
 	/* set the rirb size to 256 entries (ULI requires explicitly) */
 	snd_hdac_chip_writeb(bus, RIRBSIZE, 0x02);
@@ -625,8 +625,8 @@ bool snd_hdac_bus_init_chip(struct hdac_bus *bus, bool full_reset)
 
 	/* program the position buffer */
 	if (bus->use_posbuf && bus->posbuf.addr) {
-		snd_hdac_chip_writel(bus, DPLBASE, (u32)bus->posbuf.addr);
-		snd_hdac_chip_writel(bus, DPUBASE, upper_32_bits(bus->posbuf.addr));
+		snd_hdac_chip_writel(bus, DPLBASE, (u32)(bus->posbuf.addr + bus->addr_offset));
+		snd_hdac_chip_writel(bus, DPUBASE, upper_32_bits(bus->posbuf.addr + bus->addr_offset));
 	}
 
 	bus->chip_init = true;
diff --git a/sound/hda/core/stream.c b/sound/hda/core/stream.c
index 579ec544ef4a..b471a038b314 100644
--- a/sound/hda/core/stream.c
+++ b/sound/hda/core/stream.c
@@ -288,16 +288,16 @@ int snd_hdac_stream_setup(struct hdac_stream *azx_dev, bool code_loading)
 
 	/* program the BDL address */
 	/* lower BDL address */
-	snd_hdac_stream_writel(azx_dev, SD_BDLPL, (u32)azx_dev->bdl.addr);
+	snd_hdac_stream_writel(azx_dev, SD_BDLPL, (u32)(azx_dev->bdl.addr + bus->addr_offset));
 	/* upper BDL address */
 	snd_hdac_stream_writel(azx_dev, SD_BDLPU,
-			       upper_32_bits(azx_dev->bdl.addr));
+			       upper_32_bits(azx_dev->bdl.addr + bus->addr_offset));
 
 	/* enable the position buffer */
 	if (bus->use_posbuf && bus->posbuf.addr) {
 		if (!(snd_hdac_chip_readl(bus, DPLBASE) & AZX_DPLBASE_ENABLE))
 			snd_hdac_chip_writel(bus, DPLBASE,
-				(u32)bus->posbuf.addr | AZX_DPLBASE_ENABLE);
+				(u32)(bus->posbuf.addr + bus->addr_offset) | AZX_DPLBASE_ENABLE);
 	}
 
 	/* set the interrupt enable bits in the descriptor control register */
@@ -464,8 +464,8 @@ static int setup_bdle(struct hdac_bus *bus,
 
 		addr = snd_sgbuf_get_addr(dmab, ofs);
 		/* program the address field of the BDL entry */
-		bdl[0] = cpu_to_le32((u32)addr);
-		bdl[1] = cpu_to_le32(upper_32_bits(addr));
+		bdl[0] = cpu_to_le32((u32)(addr + bus->addr_offset));
+		bdl[1] = cpu_to_le32(upper_32_bits(addr + bus->addr_offset));
 		/* program the size field of the BDL entry */
 		chunk = snd_sgbuf_get_chunk_size(dmab, ofs, size);
 		/* one BDLE cannot cross 4K boundary on CTHDA chips */
-- 
2.49.0

