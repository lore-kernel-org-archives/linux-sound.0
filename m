Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022096.outbound.protection.outlook.com [52.101.126.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 531EC304BD7;
	Mon,  1 Dec 2025 10:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.96
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764586633; cv=fail; b=luy+cGuQM2inCnvGbgdX9PiATr6dhSd2cjWxLm1Z5tZBIInLb/VPTbQfq1l9yvapL8OGOnojBg4HZQZryAXPI41DyvnlpskR2TzSOJuoTSPSiZFd+LgvzDFBR9MngtEpynnah56uJasdG5rJ5sRVuVnnul5PXvVgMmBoI5oZkGY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764586633; c=relaxed/simple;
	bh=wMdwvgModeGJZ20CRJIWrPDfjhQU4+9InMMctbilEW4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=d4UQo3VzK3VllOOk/xAyJ1ULeo7EPdjmjOkr1Xla5HUbmw+NwgRWaUenEa9Ix2g3FjzcxQuSS+MybbwOorMS0dhIubjIXcTKVcmVfLpJUBgE77CdHisdqEY/0Ai92cByOQz0rqC01le/ijLVq2jkaw3uUAebTA2ep2QPOIHd440=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=52.101.126.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HKUwkBd6/WOhRLcxEJLo0uz419BxNEs8bzz3wkHf4NUL+ciinzQnP0u6wmnPF5YIw/WJA8gqA83SQV/4DEIWQR4+GITEGVPFfDzV2w+rwTgauLk6TDgMsW3i+6rUgbyGD/U8R3tWdKin9+MYp9tI4t6ncCrpIK0BnjqbVjx79xra9BWvrtT+hVfNnFpYQPHekKsZsTDF8IBmovB9G87CIeGJWQpIGrTHbffvSYYtg7EIgfbYWsb9Plr8TvYjL2wcuNAcPIDtENJmBrWds1mpnn64y0QknFrWu68ptJh+lnNFE6UyC4w4btr3TuI4Ys8lubnXPryZC7g7zKOqUsCsLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nMbur733VOPNUtlsvPEKFkVyvPakaepaDPG0qLBy/bM=;
 b=gDy5xoezP6MVzx59TaaxoWLXGFiGlASCZpa7PmcgIEOysh5zAzOFmbFX5HCk6HJ8EFNgrwAQejWJ27O5zuOwBq9UJ1B2WhiM1sw0iLhP2tcdwYk4DZ41YVkAhQLbVJiwcLGCfx62bgwtwbyeOTJV5/kxfVq/seo3UWcsqCoxjvBoycDbpah6DjmhN7M6uj1N7kA2ZrTniSVh4v+fN580W1JZKJJlf+Vv3Wf42joHAu8GYSj/qEFajWjYuCTmY+5hbWNMj+rA2lxrQouP5gD+in1A5Qa00HUL/RJeuAFe5kXyPHoP743bBTq0ljev204uFtN1yDAJio6l3iigP4kF/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SG2PR01CA0139.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::19) by KUXPR06MB8055.apcprd06.prod.outlook.com
 (2603:1096:d10:51::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.16; Mon, 1 Dec
 2025 10:57:05 +0000
Received: from SG1PEPF000082E2.apcprd02.prod.outlook.com
 (2603:1096:4:8f:cafe::a2) by SG2PR01CA0139.outlook.office365.com
 (2603:1096:4:8f::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.17 via Frontend Transport; Mon,
 1 Dec 2025 10:56:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG1PEPF000082E2.mail.protection.outlook.com (10.167.240.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Mon, 1 Dec 2025 10:57:03 +0000
Received: from localhost.localdomain (unknown [172.18.64.15])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 14AB241604E5;
	Mon,  1 Dec 2025 18:57:03 +0800 (CST)
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
Subject: [PATCH v3 2/3] ALSA: hda/core: add addr_offset field for bus address translation
Date: Mon,  1 Dec 2025 18:56:59 +0800
Message-ID: <20251201105700.832715-3-joakim.zhang@cixtech.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251201105700.832715-1-joakim.zhang@cixtech.com>
References: <20251201105700.832715-1-joakim.zhang@cixtech.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E2:EE_|KUXPR06MB8055:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: c0e3a3a1-9588-4f02-3693-08de30c85cc9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?BfkLuXq2bk2Y4MkPnqdoEw5x1Rsuu+v74ofEDIsdjydVABNmZutmoKxnaqak?=
 =?us-ascii?Q?B1vJo2JWugj4deMMzhys2rRMLY5KHG8+cn6Pyg7Yf0o1NRoFuxYIfDSJBnEN?=
 =?us-ascii?Q?5Kz2wcSs/mPE9oTBpnYRSnsyarY8HZ0vq/dW8/1Keuqr7GwMVM2poE8y8tih?=
 =?us-ascii?Q?dJhUdn/SSMyOAMb0EiRXaZGu9VyRYAV65bY3ARScPP7wSS7uyro3UbfsdvH9?=
 =?us-ascii?Q?bYGj651TS6XY8LCh3vr7H2VDIcXtraMEkwnGBJIh9zDDSLI3NvjL+dEAwDMD?=
 =?us-ascii?Q?DISIrxeCXOWTVXLdYLjrAkIovFKC+H0XRVSCqsdh6pPN4SoHoDZ2D37OwkQG?=
 =?us-ascii?Q?Gd4oWX13mypJqarAjKLZpgLySgBCpu++hQCifx5cba4nz+NSeOf29dnair0y?=
 =?us-ascii?Q?4QppK4lv08ESwtmM3xRSPjjvmREfcOIbLwJwErsBddQgOmja+xQ5rkfE7j43?=
 =?us-ascii?Q?N9iwVjze6AvzI4QfeZrXxA3yJlzMt0swjkpMW/vxMpUskuVSXZnbl+I++8tV?=
 =?us-ascii?Q?w54qhpxPy3T5w6N+OVDS+XGSlFBuImY6dBF/aCjkBjEu70aODCGBDiZdDS+w?=
 =?us-ascii?Q?mr5IEXEf7hJN2p85mrGjAaNyPeUtJXUe/+6N+5V6d4QQd1eStk1V+YChSRE3?=
 =?us-ascii?Q?5D5QYcG0K1Ck6Z5y18jjoSiZnNczFo0i8LDvXEtuWYsNbc3Tbltnk+ByU2fL?=
 =?us-ascii?Q?tJbVROynD1B3Cj83tHbcKzcMC3pUn9nl5WnL81PQ7Pn5ZvKqT1sK8MhzJSZu?=
 =?us-ascii?Q?hGxLr9PTTp2GYL97+M7nN1rSohflkSgYX9rO23ZL6ACKoAdcO1UAyRXKq4VE?=
 =?us-ascii?Q?cIbU07ZVWTwSr7JpPYBT1eDv5ZCnNr0sTrqZUGfmFSWhCIhQld3zfVYyhKWo?=
 =?us-ascii?Q?hYoBdqxG2slFHtJOrDBOtOlGfa8t9fEqu5vjasR2xmCRO/IBwEGwGLyUj/ta?=
 =?us-ascii?Q?B5LubVY1qQ12AN0B6Coi16agmqLEAV/Tms1Jy5lop5ttfjx3HfrR6dmdOYsB?=
 =?us-ascii?Q?S/Ryo+NUgG70WgsKmQdmm4px+Lo7tnge3oFvMMsPfmMd6JRroIJe8WlcLCRR?=
 =?us-ascii?Q?O3ECEQoPLyU0YpN/U1AsjL9CXX4JBJTpPshU2OH8f66CJpEMQeWThIUjqS2a?=
 =?us-ascii?Q?nQWq1g8AyfJhKqIYvPV78/ArfRHT6jadTyoajD4r6fZ7G1NPeaq4TrIc8cXM?=
 =?us-ascii?Q?fCW8X08tsiidUZnTZPrwQvryCdwlb94g1cLCt8Bbxg9xwMQIhvqXePXSGAZ5?=
 =?us-ascii?Q?2dPAxfsYV7hCIAEVu/sLdbp7WUJi8sagXUpgcHwgU3g0ELnxVJWIIL+JNFMI?=
 =?us-ascii?Q?jtXRHPPXucyBodRgmPkRrUr4Ki1fTp4O3zvHW+raTGBKQwJkUB+x+UEnIXPa?=
 =?us-ascii?Q?HOIPVgV5/36JbD4EGkWZxg4CURAnR7IfKPhOGZ5VnnA8EFdpV8PalP+5/Xkg?=
 =?us-ascii?Q?KZhzIcZ+jwaAV5GKZsQDN+l5J9zYsN21Ax8enK6Hivei0Rno3DLNFgSLxTJD?=
 =?us-ascii?Q?ZCwZYSosqMA5aMvB+2hiM67OE46eEPI7VK2oeExNtH5GheoIVhkP/v7qOCik?=
 =?us-ascii?Q?bfFPNpHWiyLSrF1uR3A=3D?=
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 10:57:03.9803
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c0e3a3a1-9588-4f02-3693-08de30c85cc9
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SG1PEPF000082E2.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KUXPR06MB8055

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

