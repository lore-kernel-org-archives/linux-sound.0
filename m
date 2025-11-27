Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022135.outbound.protection.outlook.com [40.107.75.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B756C3242DE;
	Thu, 27 Nov 2025 09:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.135
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764236599; cv=fail; b=QIaAvHR6CgPe4rOnPXtnrtKa4s2VjewnfKD8SIKMYaJuurCMVLd8BDBdKADS4uZH7znvtIKiNSfaMYSphMaW6AGg05T0Ax3WBDMQig7SWnxTj36rAo89G1CIkXZztxJd/yW73sNKswfaJAN7G05NHig61fextB6zBGTjMqIWzvk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764236599; c=relaxed/simple;
	bh=yTUYzL4Y6Wn/2OD6Yjz819iuH8OdDbh2oCKHQVMobQ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=t95XHuMXZmSNuVseTIp43uBBIrYIxVqPumzLtYz7hsdWDFmqC9Ktb+pdfuOEGaJMoOSEiuDbuhNT3ROaBz9B32S3q0DnDwOIS94479d+AVLd/j2UxFqDd1DYSV/YKPOCTvsx6sa8+pzKySf/RR6yvpr1GD1RngCqta2b2G5MLfo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=40.107.75.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eCovyP4lrOXlrQ9ZNxsuB3pjlUkFldSe+1M2adtOrCENs6K3x8Bo1K09Ir7viK9dMs/VqMouqOpJMCdVFDoWmnq5ufEBNBZE+ByjxAv3fbGvBWKwGSRvinyFLTdCOLOdRbAU+3Lhj7qWTWZ24LQVlVGOEANUX/FN6Cl8N2i9KKuToAFk196zcAGGUVL1zJ/b57VfgqdRG0SbqBjKSAFx8WHhcyuam7kOiNPumR5lS0Co85nLOdXV9zECJMQ/XvhWYTR4jHrFNJlFw36JqbHDM0QK+eUokZ2ZGX67prNcSMDySpPyVvGfQXRDUxEm6+Afk7IgsDgA4awxPSOWCxw/iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hjW2UpcKFe7YWgv8DKoMGyhrHx6zfbfW3b2JOzCDTLU=;
 b=vTZwuU4qTTzTG+85Y0d9VWy92sUMnoY8K6jZXeb7uwCI6tFbJKZShML1c+HiBrCaR0Ka6DX0Pd0L+p+tTlhDOKl/NXQ7DQQZafbvkSe6ZIHKnZWbeHMvWKx1aNlu299NRvlK97FceYY16kATF8B7WkiHlH7NdgbGDf5WAlnHTWdTxrdolYS6jrLFznNrufckbnDrYjC1GGkgi8TX+k51Pp1eluReZaF5WzmvCAVC7hNOSGrwv9/1e5Utir0X4c6nhSk5jTloRi1Bog06xsMW3IrS4vCKoNV3NBfIC1Q0iLP8iNx0WnYp2AQ1r2L3AvnrhIZuzLkLO+iVMYG3k1gDCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from PS2PR02CA0048.apcprd02.prod.outlook.com (2603:1096:300:59::36)
 by SE3PR06MB8197.apcprd06.prod.outlook.com (2603:1096:101:2ed::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.20; Thu, 27 Nov
 2025 09:43:10 +0000
Received: from OSA0EPF000000C9.apcprd02.prod.outlook.com
 (2603:1096:300:59:cafe::46) by PS2PR02CA0048.outlook.office365.com
 (2603:1096:300:59::36) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.14 via Frontend Transport; Thu,
 27 Nov 2025 09:43:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000C9.mail.protection.outlook.com (10.167.240.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.7 via Frontend Transport; Thu, 27 Nov 2025 09:43:10 +0000
Received: from localhost.localdomain (unknown [172.18.64.15])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 9404040A5BDA;
	Thu, 27 Nov 2025 17:43:09 +0800 (CST)
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
Subject: [PATCH v2 2/4] ALSA: hda: core: add bus ops for dma address translation
Date: Thu, 27 Nov 2025 17:42:59 +0800
Message-ID: <20251127094301.4107982-3-joakim.zhang@cixtech.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251127094301.4107982-1-joakim.zhang@cixtech.com>
References: <20251127094301.4107982-1-joakim.zhang@cixtech.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSA0EPF000000C9:EE_|SE3PR06MB8197:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: e94963de-a77a-4a2f-700d-08de2d99608c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ORx4g6z8T8FpuQqTK+g5OBoNmBGbKulKaxw4m3JKZzzxy8Ea1pMLDQ9xcrw5?=
 =?us-ascii?Q?JEA2Bw1AVpvA+T/yBfC5Zv7ZePanHrPvDjlFN90JLhomoCAmoJX8C6+TtsvI?=
 =?us-ascii?Q?dtq7bl0/YAEZFEmo3myOG8C0j9N/e9SJX2bDPeP4BnFNMK28BGDVQsam4wUd?=
 =?us-ascii?Q?H4a8mIP4G8eXOLzd8CQKxdZAX/Ee5lPIFi1Xeqqo/y4uI4IdGyUtwi79mylL?=
 =?us-ascii?Q?7g0IezZMQL6UAaVPRxwBqTpMhcgFjxeLpgtVLzLV5nlmOl1HLj3vT4jVpYbK?=
 =?us-ascii?Q?fh8SPbxq143wmGYvsSsJ4prqK46B5I3b0KrnUGn66Nid3wxE3stdQ2YvQlNm?=
 =?us-ascii?Q?KKCyYOxA3WXpD1yiEZBGekkh8EU0HEVATg0cPlfHjHWInRj6vWYFA+E7Ki+6?=
 =?us-ascii?Q?pkdZ+Whc1OmQMjHybFwPlqMSGEFMRlDiy54IfRsPfQ02X2nOulHXBPTd/96s?=
 =?us-ascii?Q?99Izo9JzXwlUkKC76V3K3e4XPjSL3vqSGExcbpTqrWd8uZlLP1jY/nWpqw0/?=
 =?us-ascii?Q?3K3Cvwg1uWk3bo8PDNntRI3zUM8qv9qOVE8yqZTypKvmhB06CiYl/b+GpTMl?=
 =?us-ascii?Q?Vq6OGqS8jmXij3M3i/jqozcf529aAnDjk5LNgvdkAPE+e53eyJ7ZTTRFsMtU?=
 =?us-ascii?Q?JiR3EgeQcyPvxvqYa5zoRQxwyTxcYsnP7PhbIVYI3wWyAsWfbv2YnLaVv3li?=
 =?us-ascii?Q?GApz62NxYvl4d861KkUdNoMheFqHpdlxhLQL5VsP7Eq2l5pyEolTFAt6E9T4?=
 =?us-ascii?Q?zuYI8dEkQYEa+TT7PetOIW35/d2j8eKj4SGl3z/Ldtux8GXxK2lEgb+TrXPZ?=
 =?us-ascii?Q?v4Ck1T+emn8HpX09weLVVQUZRzfxYC41Keih8S9T0UZeOAZV+NHT7LqVJcs2?=
 =?us-ascii?Q?m9FG8aSqgXOvqtrlj+k5YDLjN4IOQ3lq2BEkhMd3ClRmFEyP/42szGv31pBU?=
 =?us-ascii?Q?qtb3TM5yY6pOEWt5NEYMVTWPv/C8T7xrOYH72qVht5g+UWuPmSLXlAwxG+mm?=
 =?us-ascii?Q?KKfLfDx6HFCMXDWm+2GwkYKWQf5AsiKb+BaJT3IuoOiLamyE+mJCHHmy3bga?=
 =?us-ascii?Q?14GjuGsHFJY2FZYCxVgerY9MXj/WBcOFdsPkYhcgV51o7ggo4yv63yxmaqdo?=
 =?us-ascii?Q?bYhIcRyWXJ6PSFaFBcEjtRcbreyFxfTk0HN2u8YwaGfVUvgDCWpve82YvyK7?=
 =?us-ascii?Q?FVTQ8mqdccMd+iUnOR79R+vD3NRwOx1bTWrN59+D79AedqRf00ziPyRrua4z?=
 =?us-ascii?Q?CnyppWC3OmGrupQPep837s+RcAhO1LNA3OtrIiu12DnZkyEKpgHugmO5DIZ9?=
 =?us-ascii?Q?+CVKPXG7U8V9Kkm3i3ZJOJVmP5Bqg8z1VoHWQc3vxr03c19ZI9WzuBRPeFau?=
 =?us-ascii?Q?yXvCbFlCx8aTeFzwI+DPc5qyXVVZkHfNGV29bkxOnYVjh4ISPZdvB6p9oZEG?=
 =?us-ascii?Q?9Nrxc0AYrmKAESbSzRUtKqDhjnG1iJXq3x1COPQQ/PuRsVWJWD6qwk2evbdH?=
 =?us-ascii?Q?ZMoVnQ/4Ztqe4HqLGuQYyJ4o1SXZsrgoFggIOPd2Mu+ASmCGu4E9OqHLWkxc?=
 =?us-ascii?Q?c6SmBDLPuZ2UPNmASqA=3D?=
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2025 09:43:10.4163
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e94963de-a77a-4a2f-700d-08de2d99608c
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	OSA0EPF000000C9.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE3PR06MB8197

From: Joakim Zhang <joakim.zhang@cixtech.com>

 - add bus ops for dma address translation, for some SoCs
   such as CIX SKY1 which is ARM64 arch, HOST and HDAC has
   different memory view, so need to do dma address translation
   between HOST and HDAC.

Signed-off-by: Joakim Zhang <joakim.zhang@cixtech.com>
---
 include/sound/hdaudio.h     |  4 ++++
 sound/hda/core/bus.c        | 17 +++++++++++++++++
 sound/hda/core/controller.c | 18 ++++++++++++------
 sound/hda/core/stream.c     | 11 ++++++-----
 4 files changed, 39 insertions(+), 11 deletions(-)

diff --git a/include/sound/hdaudio.h b/include/sound/hdaudio.h
index 4e0c1d8af09f..90062dd4ed9b 100644
--- a/include/sound/hdaudio.h
+++ b/include/sound/hdaudio.h
@@ -246,6 +246,8 @@ struct hdac_bus_ops {
 	/* get a response from the last command */
 	int (*get_response)(struct hdac_bus *bus, unsigned int addr,
 			    unsigned int *res);
+	/* translate dma address from host to hdac */
+	dma_addr_t (*addr_host_to_hdac)(struct hdac_bus *bus, dma_addr_t addr);
 	/* notify of codec link power-up/down */
 	void (*link_power)(struct hdac_device *hdev, bool enable);
 };
@@ -385,6 +387,8 @@ struct hdac_bus {
 int snd_hdac_bus_init(struct hdac_bus *bus, struct device *dev,
 		      const struct hdac_bus_ops *ops);
 void snd_hdac_bus_exit(struct hdac_bus *bus);
+dma_addr_t snd_hdac_bus_addr_host_to_hdac(struct hdac_bus *bus,
+					  dma_addr_t addr);
 int snd_hdac_bus_exec_verb_unlocked(struct hdac_bus *bus, unsigned int addr,
 				    unsigned int cmd, unsigned int *res);
 
diff --git a/sound/hda/core/bus.c b/sound/hda/core/bus.c
index 9b196c915f37..419461c7fc61 100644
--- a/sound/hda/core/bus.c
+++ b/sound/hda/core/bus.c
@@ -75,6 +75,23 @@ void snd_hdac_bus_exit(struct hdac_bus *bus)
 }
 EXPORT_SYMBOL_GPL(snd_hdac_bus_exit);
 
+/**
+ * snd_hdac_bus_addr_host_to_hdac - translate dma address from host to hdac
+ * @bus: HDA core bus
+ * @addr: dma address which need translate
+ *
+ * Returns dma address which is translated or the original address
+ */
+dma_addr_t snd_hdac_bus_addr_host_to_hdac(struct hdac_bus *bus,
+					  dma_addr_t addr)
+{
+	if (bus->ops->addr_host_to_hdac)
+		return bus->ops->addr_host_to_hdac(bus, addr);
+
+	return addr;
+}
+EXPORT_SYMBOL_GPL(snd_hdac_bus_addr_host_to_hdac);
+
 /**
  * snd_hdac_bus_exec_verb - execute a HD-audio verb on the given bus
  * @bus: bus object
diff --git a/sound/hda/core/controller.c b/sound/hda/core/controller.c
index a7c00ad80117..536f03ca13aa 100644
--- a/sound/hda/core/controller.c
+++ b/sound/hda/core/controller.c
@@ -48,8 +48,10 @@ void snd_hdac_bus_init_cmd_io(struct hdac_bus *bus)
 	/* CORB set up */
 	bus->corb.addr = bus->rb.addr;
 	bus->corb.buf = (__le32 *)bus->rb.area;
-	snd_hdac_chip_writel(bus, CORBLBASE, (u32)bus->corb.addr);
-	snd_hdac_chip_writel(bus, CORBUBASE, upper_32_bits(bus->corb.addr));
+	snd_hdac_chip_writel(bus, CORBLBASE,
+			    (u32)snd_hdac_bus_addr_host_to_hdac(bus, bus->corb.addr));
+	snd_hdac_chip_writel(bus, CORBUBASE,
+			     upper_32_bits(snd_hdac_bus_addr_host_to_hdac(bus, bus->corb.addr)));
 
 	/* set the corb size to 256 entries (ULI requires explicitly) */
 	snd_hdac_chip_writeb(bus, CORBSIZE, 0x02);
@@ -70,8 +72,10 @@ void snd_hdac_bus_init_cmd_io(struct hdac_bus *bus)
 	bus->rirb.buf = (__le32 *)(bus->rb.area + 2048);
 	bus->rirb.wp = bus->rirb.rp = 0;
 	memset(bus->rirb.cmds, 0, sizeof(bus->rirb.cmds));
-	snd_hdac_chip_writel(bus, RIRBLBASE, (u32)bus->rirb.addr);
-	snd_hdac_chip_writel(bus, RIRBUBASE, upper_32_bits(bus->rirb.addr));
+	snd_hdac_chip_writel(bus, RIRBLBASE,
+			     (u32)snd_hdac_bus_addr_host_to_hdac(bus, bus->rirb.addr));
+	snd_hdac_chip_writel(bus, RIRBUBASE,
+			     upper_32_bits(snd_hdac_bus_addr_host_to_hdac(bus, bus->rirb.addr)));
 
 	/* set the rirb size to 256 entries (ULI requires explicitly) */
 	snd_hdac_chip_writeb(bus, RIRBSIZE, 0x02);
@@ -625,8 +629,10 @@ bool snd_hdac_bus_init_chip(struct hdac_bus *bus, bool full_reset)
 
 	/* program the position buffer */
 	if (bus->use_posbuf && bus->posbuf.addr) {
-		snd_hdac_chip_writel(bus, DPLBASE, (u32)bus->posbuf.addr);
-		snd_hdac_chip_writel(bus, DPUBASE, upper_32_bits(bus->posbuf.addr));
+		snd_hdac_chip_writel(bus, DPLBASE,
+				    (u32)snd_hdac_bus_addr_host_to_hdac(bus, bus->posbuf.addr));
+		snd_hdac_chip_writel(bus, DPUBASE,
+				     upper_32_bits(snd_hdac_bus_addr_host_to_hdac(bus, bus->posbuf.addr)));
 	}
 
 	bus->chip_init = true;
diff --git a/sound/hda/core/stream.c b/sound/hda/core/stream.c
index 579ec544ef4a..bf6fe7408b2c 100644
--- a/sound/hda/core/stream.c
+++ b/sound/hda/core/stream.c
@@ -288,16 +288,17 @@ int snd_hdac_stream_setup(struct hdac_stream *azx_dev, bool code_loading)
 
 	/* program the BDL address */
 	/* lower BDL address */
-	snd_hdac_stream_writel(azx_dev, SD_BDLPL, (u32)azx_dev->bdl.addr);
+	snd_hdac_stream_writel(azx_dev, SD_BDLPL,
+			       (u32)snd_hdac_bus_addr_host_to_hdac(bus, azx_dev->bdl.addr));
 	/* upper BDL address */
 	snd_hdac_stream_writel(azx_dev, SD_BDLPU,
-			       upper_32_bits(azx_dev->bdl.addr));
+			       upper_32_bits(snd_hdac_bus_addr_host_to_hdac(bus, azx_dev->bdl.addr)));
 
 	/* enable the position buffer */
 	if (bus->use_posbuf && bus->posbuf.addr) {
 		if (!(snd_hdac_chip_readl(bus, DPLBASE) & AZX_DPLBASE_ENABLE))
 			snd_hdac_chip_writel(bus, DPLBASE,
-				(u32)bus->posbuf.addr | AZX_DPLBASE_ENABLE);
+				(u32)snd_hdac_bus_addr_host_to_hdac(bus, bus->posbuf.addr) | AZX_DPLBASE_ENABLE);
 	}
 
 	/* set the interrupt enable bits in the descriptor control register */
@@ -464,8 +465,8 @@ static int setup_bdle(struct hdac_bus *bus,
 
 		addr = snd_sgbuf_get_addr(dmab, ofs);
 		/* program the address field of the BDL entry */
-		bdl[0] = cpu_to_le32((u32)addr);
-		bdl[1] = cpu_to_le32(upper_32_bits(addr));
+		bdl[0] = cpu_to_le32((u32)snd_hdac_bus_addr_host_to_hdac(bus, addr));
+		bdl[1] = cpu_to_le32(upper_32_bits(snd_hdac_bus_addr_host_to_hdac(bus, addr)));
 		/* program the size field of the BDL entry */
 		chunk = snd_sgbuf_get_chunk_size(dmab, ofs, size);
 		/* one BDLE cannot cross 4K boundary on CTHDA chips */
-- 
2.49.0

