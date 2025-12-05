Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022106.outbound.protection.outlook.com [40.107.75.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC84A1F4615;
	Fri,  5 Dec 2025 11:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764933407; cv=fail; b=htTwRkIygo99AUVJh6LpSmtIH76WQL8rV6lKQDpsZGIzy0RwhBuU364x+eT0Qd+R36AIdsSzbA1lq40YQZ8YFtFgJqmZUhGDRiu9I3PdUyAtcsm2HL8hrbSnaGwXWMNDrKNeI0rP47/RCB0IyNPEYgTwXSQ55Iu03hkFxJnqViI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764933407; c=relaxed/simple;
	bh=wMdwvgModeGJZ20CRJIWrPDfjhQU4+9InMMctbilEW4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=d3/Amb4HVZQwEv6aB8MehdLp+qrlDKIJvjjGayeQmMUTwmm9L8ZONgmwhXj/4LsoQ7xnYNw/fVMhjXyaWF8qaTKCznrI/eNxKV1E0B4HXJrTWuwF8BicvcJbQfBBe4nvcGuNE9W0suiGO1S2h1nzR4xwFey+1Y366Iq+N52qwII=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=40.107.75.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YSWl2N12UwEThOE1ynsM0iOlRiWg29OZHzsvpPefHS9hijIh0gYAo73MHTCIX4DWJDRk1ibnpuAnIldzhq3BsPs9CEmXAaFf7vYX3mVBPiOMsUx78TyqYZqrTsQR8bNISu+bUDg+iYh0TJATERniuG+mkPXJMDcgCgqRX/ANcQ/2JQcATnXc9iNPjv8jo340su0FZ55cbZLyzTg8Tpl4emiyezxxKBq/96ITPemyhvqwaZqqy85ivOTSNaLfUTvmdKTVGMuf0sIuNI18MVE/mL31gnxEejIC8LrNlUvWYZW7UvGsbTmtNdxbXDXCPWUBRcIjpkBTmENZqM9X/n9eVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nMbur733VOPNUtlsvPEKFkVyvPakaepaDPG0qLBy/bM=;
 b=Ygz3jmorFwmUPtC54nv11FRD/DV1Lger0snOzWGFd7wI+u3S9NxkP/5VnroO3kyNERQjw4QCac6ovjXtKi/N5ly0hqXdzsUleS2c/LqtIYNK/uEck/Uf0pwusbSuHltBpIknrYb73BK5WNk24vwhjRN2x4uq1iJ4Nqciw1zqGKdl0huFCrddl9THLK14l2avpXSF6oKjMQvkS15KwS1dV5FVDcJSVSBHBlJ3JTQwRRW7T2w9V6CoY/zHFRQsjHmqyUUt2EbVJCKriEeqWAQllbbgO+rUpb0bkb4Uu9vhdd9kidBwNsCT05NxdeTy8eE2sIAM9e8gEHaAO4Jh7jsFVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SG2PR02CA0017.apcprd02.prod.outlook.com (2603:1096:3:17::29) by
 SEZPR06MB7124.apcprd06.prod.outlook.com (2603:1096:101:228::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.9; Fri, 5 Dec 2025 11:16:39 +0000
Received: from SG2PEPF000B66CB.apcprd03.prod.outlook.com
 (2603:1096:3:17:cafe::32) by SG2PR02CA0017.outlook.office365.com
 (2603:1096:3:17::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.12 via Frontend Transport; Fri,
 5 Dec 2025 11:16:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG2PEPF000B66CB.mail.protection.outlook.com (10.167.240.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Fri, 5 Dec 2025 11:16:38 +0000
Received: from localhost.localdomain (unknown [172.18.64.15])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 8318741604EA;
	Fri,  5 Dec 2025 19:16:37 +0800 (CST)
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
Subject: [PATCH v5 2/3] ALSA: hda/core: add addr_offset field for bus address translation
Date: Fri,  5 Dec 2025 19:16:33 +0800
Message-ID: <20251205111634.3004576-3-joakim.zhang@cixtech.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251205111634.3004576-1-joakim.zhang@cixtech.com>
References: <20251205111634.3004576-1-joakim.zhang@cixtech.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CB:EE_|SEZPR06MB7124:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 95fb217e-59ac-4ee3-e55b-08de33efc28e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?pU/B4XGDq8TkCz1fqF8cuZW9EOKfDtOGNa+yR5f/kaekEXDuZenMoB0znj0L?=
 =?us-ascii?Q?GXn6WpnClg6NpaPIRsA6ass/HZMGEMqjAfKh6xfMW+ozZwVlzB0z860xjnzx?=
 =?us-ascii?Q?cX/7kP2YD6DjT+DUxkC3emGBPUBZnmZXwAWzymfAsOQsGAMb2cYUKLBD7osr?=
 =?us-ascii?Q?MVtAkNWXIxZRTQLtaPHEN8MfWFu9xrps3ve75gzzuxeo5n/lX/NZgCeAorK+?=
 =?us-ascii?Q?ukLplr9zXENVSe2FcA6gX4nqMkz7VN5iEB0tCFA4EmThFZOkS2l1pBqTQMIh?=
 =?us-ascii?Q?klWPQT4FrUaCXV+x5pUPGEpi7/lTQ1mHEMiceSqlwZ0RwRTy7c1+2SEqQQhW?=
 =?us-ascii?Q?psweKXopGPXmEOg9J56fgnU4eriY0MJI6lrLRiGSOpXDTdCJxIENaJXT06ch?=
 =?us-ascii?Q?twBP0ClCAbIl68yvXr8m3jDgUjerM4DeYp/lMIOBTJVGdPY+u3OcjRgb65ar?=
 =?us-ascii?Q?qZx6+sJyhCIK63aEupqhm1NrPRQUMlPMU22RR/Bq2ipmyDJ2weMxnPK4Sg2x?=
 =?us-ascii?Q?PNh/b+jwxdOkqadzgB6eOCvC3/u+qU+7yWmZJecWLroLmfxR5hwrfxH4hbZr?=
 =?us-ascii?Q?eamyhSKdcbETMUjeFLYcx/Sm97+cDVSxeWz3BP2sWRm098Bwl4nqDox6PS3U?=
 =?us-ascii?Q?IHjHJKR+BuvixkJh5lg9eKyaA1NEpIv4TdkiG0ETDHulC+UV+j5bFc9mXNF/?=
 =?us-ascii?Q?ETDouGsU8M7k9cGTeOF2GQFAJCPesrw623yap2V987Fi8Dv5l0PQfaIPS4DD?=
 =?us-ascii?Q?RDxiSjHk5941c2doOUMGZh52pxAUz6ZDh9uDRb5TWLGq66pksWh3yIVQASkd?=
 =?us-ascii?Q?PdeeY9WKZZnwVGLtHEpQsM2pG8XGU0ZNbEIm05kkD5xiz2ZHpPe7VNCvdDnf?=
 =?us-ascii?Q?OpdyZz7tRC5RTBzjoROjIH8rWCjDV/RGsUKwaj/fqVUAM8jWJMhMp3PnbMEV?=
 =?us-ascii?Q?ar3NFSRI7VQaNBV23HurJx6XHU0GX11USRKAn+AYIa0320S4h7lrOyJ3ah3b?=
 =?us-ascii?Q?ZIe7rZn+7XvouLjPwZ2dXWpQJ92akVsIH0zYYV33FSVVG8lMOkfnvnWykM5+?=
 =?us-ascii?Q?eRHNmuNdV34+W8p7Sm6Mt21FEXp0rOzj3QXXngz1IBWcLa53ZmgEA43PXrMC?=
 =?us-ascii?Q?HxYt/kU5yLeMJZ69BglmMPdWfQf3ACzBZnOAH95jlNDg44ewGVXyfSTtEpZe?=
 =?us-ascii?Q?6/HcYKPcxN8Vt+RKB7lLqdSPsUk7RwFGIAo1UaTUF1170ZAJjooVXO9LKPN3?=
 =?us-ascii?Q?6ZJC9mxP4mg4EX58sGZuJ7gMi2cJa46UMjD+17gG1RsMQHJQ1iMBQDx9ORZ/?=
 =?us-ascii?Q?UzC1maicAeZwOvCNoKYGHCsKcQsgNHXmio5rl9b7rdX00ijutW+7IzMN7xBR?=
 =?us-ascii?Q?yu+lxpSQmD+BkqFmVpuR7ukfvB3UgDpb4DYg2edvwL9kzZ9pGANnuLgYaMZZ?=
 =?us-ascii?Q?SV46rbUvDnkK9KMKpifTwfRi6hqFZH0v5kY/Da4KXH7wKWVHwWQykGILz/W+?=
 =?us-ascii?Q?Fy6NflKFBHNPWMXYziTsoYlq0bsVNQtWT4AM3krUwAA81ynkrHb8y0i9rSkk?=
 =?us-ascii?Q?jRhjz0DP4Zh/P3wmJw8=3D?=
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2025 11:16:38.5801
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 95fb217e-59ac-4ee3-e55b-08de33efc28e
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SG2PEPF000B66CB.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB7124

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

