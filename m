Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022127.outbound.protection.outlook.com [40.107.75.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0C7733ADB4;
	Fri,  5 Dec 2025 15:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.127
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764949598; cv=fail; b=kjWW6R9dJmszn8jTsqkkrOKv/sb/rLdWkjxPL6ACIV1tgDvH83Hm7ZuSShCSXHLPnUnWJuhHQ6SKs1a6iFnuthxPD4fR5SLPPtf2ut2O+7KPythB5V9CZgmi1WZP40rdAKUdkZWgZJCYlJepgkba4ZKBnTf4uj14dlHTOtyGLKk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764949598; c=relaxed/simple;
	bh=wMdwvgModeGJZ20CRJIWrPDfjhQU4+9InMMctbilEW4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=r+KxLRmphsGu9/6O5lnjPBqLJ8H71dZzu+NrbxsRl+lJJlHSHcTKDTakAA9b42qmSro2I9egBbyLnNFY5c+vMlmii9sHAvyPxQerBcbi4sF/tfAO2Fz0SqLZ7x/el/pQgjyFtT7QhtJ+17dJk9Ik15D+eId9EEzlA1Fi9COhrwU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=40.107.75.127
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SEWfvRuAFwOeSy9n2Uul8MO0JQfcPaxerzJVZP/X/3M3E3YhXB48V6bubaZlX4xBYro58dMEHcH0NoLQK3Yy1oJwfQSmp/73Us/5L9R1TliWpAkBlYSoqkL1TyiTfvHJp1ZLrC5FJHeIh1zppyayLTVOsd84XHiKZxiXeBppulcyNFTlw1vYCydJB8b2xxq0eltbWYyw9pFIYbqRqI1ouIIEteCT0/dOH0eA89lioHInWIGAW/tf+MyRBHMbHYMxXKVS1EKU9KxoKMFVbfmIr4YkfopAmwuKh/4mChqlpHfLOBGoDke1ml6Kd5T6ewqs+ZFCF5WhfCC1EbskhciA1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nMbur733VOPNUtlsvPEKFkVyvPakaepaDPG0qLBy/bM=;
 b=gAKMsOtJkIWbtTDDfmkpa0uDLu5wVyDxa5DF2DkhNtwLoe2SoKTtU5xF68dzY+PArxNGLsTXUggJN5n4hyriLO6T1h3UfUkh8dboFUfn+j/OJFuM1++tb/QPoTvfOEYZv1bJTuBeFie6rVCnc4Ff/3c3mivAemlUw6YTL9s8mKPWPXyBcVZtXF/izwAVKgoUPuQFMMJDmAWZU5/V3OopadofawHK02uZHWLmehxTf6qmqUiTTyG4FNW3K954j0PAqrZIC6odmi+PINnSSoSMPyc3eR+O2kb0l7BqW4RhgBifzdhbRjKi47FvKTZcAdYKHPQGs0lClR6Yfdt7dyzJhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from PS2PR02CA0073.apcprd02.prod.outlook.com (2603:1096:300:5c::13)
 by KL1PR06MB6867.apcprd06.prod.outlook.com (2603:1096:820:113::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Fri, 5 Dec
 2025 15:46:28 +0000
Received: from OSA0EPF000000CC.apcprd02.prod.outlook.com
 (2603:1096:300:5c:cafe::15) by PS2PR02CA0073.outlook.office365.com
 (2603:1096:300:5c::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.12 via Frontend Transport; Fri,
 5 Dec 2025 15:46:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000CC.mail.protection.outlook.com (10.167.240.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Fri, 5 Dec 2025 15:46:26 +0000
Received: from localhost.localdomain (unknown [172.18.64.15])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 77E7F41604EA;
	Fri,  5 Dec 2025 23:46:24 +0800 (CST)
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
Subject: [PATCH v6 2/3] ALSA: hda/core: add addr_offset field for bus address translation
Date: Fri,  5 Dec 2025 23:46:20 +0800
Message-ID: <20251205154621.3019640-3-joakim.zhang@cixtech.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251205154621.3019640-1-joakim.zhang@cixtech.com>
References: <20251205154621.3019640-1-joakim.zhang@cixtech.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSA0EPF000000CC:EE_|KL1PR06MB6867:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 221b4a5c-fef2-4e6a-c4b4-08de3415736d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?eJV3j3CsoEk3jM1DIZGvB7ybixbvqcKZ7d66pgDG/YrieJ5Alg6ShomRD9nD?=
 =?us-ascii?Q?U+dTupeLfNywXVAlytpo836b7YLGV45MhUQobBjzVXvr35JFAnVoC7i6ZLci?=
 =?us-ascii?Q?YwNoHWKjXGE9fGUm380vxJabq6heWaXq1OeVwAaa8g4mChkVkaErsGNhTa/b?=
 =?us-ascii?Q?3IgYOYQ5m2up+1kEbezdgPJl/mX7RveJu6xnPn/gcwm6Cbi/Z5LEQRBIUl1f?=
 =?us-ascii?Q?wRrMHS+JLmuQyn4JHTrGup4NOcXjUafaA3MPckfpcoXFNPnq22UtDnut93Qk?=
 =?us-ascii?Q?Pti3IRUlcfAEt3WJhgpSJR6l7sCycfRz1XOVyt3Iv+IwYXvw0Qhmk6ak+djR?=
 =?us-ascii?Q?l84s1CZlz6SKuN4zcVuRENkLHjlLwVaQ9yHJvO0y5Tghoba3nwhD7F5F6P3N?=
 =?us-ascii?Q?oRyCb5lvQdoTcDGY29zf8BG0ZKjd4miicaJ6OtxYtIkRBNjSx78BvtW0YNNc?=
 =?us-ascii?Q?CmZMSWuRPyZ8myiLRiueGegIesGl/nYJd1/sVmLh3NvtdtVDxK0+3OfKOAB4?=
 =?us-ascii?Q?GxsQex93HeKR/Vhfd2D7GHKMeP/52wAUCcv90O6g0saloyfYB8w4Quasimz8?=
 =?us-ascii?Q?CXkhYp+Mrpau7xuVhSXuWZn1y6VOB9aBPK6Av8+j6OX6Vy0pbA+F1opT6Yz6?=
 =?us-ascii?Q?3JkCilNlHB1si8AgupmVypOCxmt94889jOAGkjSKyRf9sZQxIPb3ujNV3qS0?=
 =?us-ascii?Q?91JFXXqJzk5FhRkN28Uyoz/EnIuKtC2JQ2Pp5OZEpY3Lzijlg0smVy3OcCGF?=
 =?us-ascii?Q?vbqYf+Io5S4FExMhAC0dAUOzcQnD2ii0mTLdRxyBAuoM+b5e4EVYNofvVvKj?=
 =?us-ascii?Q?AYP1YKfRco0EoNLQAY/TIUWipLB7H2/oreCuPi0yZzyg/4ILuLLdFflY2IQ5?=
 =?us-ascii?Q?zoNRAl8KwF6IbMvnMd356DRN68Sjoepe75tt0vCS8OE85VplrU+JthgCH5QQ?=
 =?us-ascii?Q?+I6rzgtQHkesvqCaTnIns7auUmB9F9COVMvJEbB4M7T1BipPxOVuf9MlLcX8?=
 =?us-ascii?Q?ZCxRYyfmNBW01qhsOXq9fWbNdusSRuwDV0HkuNAl5ygu7pVfojNeWohHqnLr?=
 =?us-ascii?Q?oarwXl2YKdmBD6mAzEUIgA4M/JQFVbjqZPn80gToAa4P0K55OgnX4CAltXKV?=
 =?us-ascii?Q?ZwJ9lfzAn6wGUaMtOEbR98lhb4qvwzx4x+RaYR1/C5k5l8VdzeQh/xUoKYBb?=
 =?us-ascii?Q?I2/Q7zjKCgm4ATOr8CrhDE1HVD7zOsDl8bPl0BKpILKUzV/pDNsPYMv4Q/N/?=
 =?us-ascii?Q?OaQE3Mhj2gIXxWtAcdaXiEsawswVaxZsc6AOuowiD3qQ3GIBx/hnkLgXVLVx?=
 =?us-ascii?Q?WizZwpCdzHe+jvcrBu7UabLY4mj+jkgde5r88iwHs74hUBP9w31FKxIpy4Ay?=
 =?us-ascii?Q?sEWWrkIAslRyWAaFGD7BLiJJsvIpaLJsi9eMxEtVMtYKrUVIYqB1iWzMWv52?=
 =?us-ascii?Q?8a5rrDWm5sbnz5Mq55JWVnucvyt9mshoDOXhJsQ1spviOK3B5Ky0ofqLqmoU?=
 =?us-ascii?Q?1zukEqsNnhI6P2/Mf0HCz5RQmINj3uZyVH6RRWIV15ZBg1L28JbscKpSSj4y?=
 =?us-ascii?Q?s+yB9XLUBmJNK5ZDW+8=3D?=
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2025 15:46:26.1347
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 221b4a5c-fef2-4e6a-c4b4-08de3415736d
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	OSA0EPF000000CC.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB6867

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

