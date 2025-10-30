Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022124.outbound.protection.outlook.com [52.101.126.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 915D5355035;
	Thu, 30 Oct 2025 11:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761822663; cv=fail; b=MzREa0EW18OlEnWOsa4MQkdDQfVefH/TMQFCE6NBXeX5l73XdecBsdkGoyimfAqD8PVnqv8zJ2czRZLhtu/9/dn71E1quw+kJPAxtJZLMwjVMcHAxKhb+XZjd12Ixa3z064SGSVmVKHqvR5sSolBdMStAOdU8zrlOxKw7o4y4A8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761822663; c=relaxed/simple;
	bh=JcuqLt2vQLkLetu1MXBKBhxUWEe0QHujLjMAG6x5SJA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HkaD9DbJB1CYWRyJ8rKXidvU3cW356hLgj+y4vtEySTBwHwro1oIiuW8G/yYC3TF9iaXKFqCdbgWdpBNHZUbN96l9mLPZDDbCL2ROtSyS1VUeLpbn1UscEZKLOSc6ks6rrAeXXwFm6UcMUMKKE0kqmDl4jZWaU/9wemyXi77xag=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=52.101.126.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KbRXhpv9TEl9A6GAiJOfqjWLFEA4rIxqK1vC9jWF5q2nQWR5IbfXMBlqBBGjxqm2cmlc/aucanPpbQDKcaLM8TXLhiikCVIkVcqiiTeSmN3tQb9vxS0rpyQbvYMF8rx7ziKgpfNJdDp5RvGr8zu7qfTfHMe2lzrGz9WJPuNiDUVY+PSK6KzlQBkaX72eJ0HHsbGcYpzIboQlvSZusMrQ19IDA3xqXRjZQ6DWTOCUt/+tMYvyD/32l4lyRyCXW94irPvv0BHLb2yultLBJE6VrcB7baAii1h6pHiNvmhMp9Z979YsOp8gUtQedx98aRFEMEyPqBEZt5yNoNQmtQ1s9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KUyCy87i4WaiYndCs3I6ITaej46CPbGfK5WmjscDmc8=;
 b=IDuOFHFvFAJwyktUa1VrpGKwfieSjh47dsVupKkO5RKsirDgP4dMSHc9Do/ROul5/ssTVwjvLNgTvCCkENwsi32hO0nHu/RA2k9/kePFQWiP4rcRNsi2gvAcxmorEua60iymX8spe/yWrbfTHckFbKRiIZDagoPcGQJphukmLitcgglP/cSwef+oSqJ0HtxkdRVo/OSfQ1r7x1JOCK0/BKKOokIfxLoulBLWP7iD7OqJmDoWHCkezZF2BPhMuVY9fCExmIKAo7fwSbt9PXyZjcSf87MedMpMy/y/aawfttCJu8BHFnu//p50dQMkPZjNkiOZABqNnCpBC3yVOKE0Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from PUZP153CA0002.APCP153.PROD.OUTLOOK.COM (2603:1096:301:c2::12)
 by TYZPR06MB6953.apcprd06.prod.outlook.com (2603:1096:405:3f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Thu, 30 Oct
 2025 11:10:57 +0000
Received: from OSA0EPF000000C9.apcprd02.prod.outlook.com
 (2603:1096:301:c2:cafe::f1) by PUZP153CA0002.outlook.office365.com
 (2603:1096:301:c2::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.5 via Frontend Transport; Thu,
 30 Oct 2025 11:11:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000C9.mail.protection.outlook.com (10.167.240.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Thu, 30 Oct 2025 11:10:56 +0000
Received: from localhost.localdomain (unknown [172.18.64.15])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 8B07641C017E;
	Thu, 30 Oct 2025 19:10:54 +0800 (CST)
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
Subject: [PATCH V1 2/3] ALSA: hda: add bus callback for address translation
Date: Thu, 30 Oct 2025 19:09:27 +0800
Message-ID: <20251030110928.1572703-3-joakim.zhang@cixtech.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251030110928.1572703-1-joakim.zhang@cixtech.com>
References: <20251030110928.1572703-1-joakim.zhang@cixtech.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSA0EPF000000C9:EE_|TYZPR06MB6953:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 50a09e61-8b08-498a-f756-08de17a4ff99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?vA7+HnkgwmeF2P4WMyPfVfe4YG5UWujDG/q1Fz2oH2lxEgYgog4pz6awKP6d?=
 =?us-ascii?Q?BRA3zHuj4wG6e24zaEcVMhlB5qdqLMT4YV+ijqdYHNejpvyWSInipovBQO3j?=
 =?us-ascii?Q?eltistb5K8CGhZv1KXbYHOk2mec6yYcuDLoBycnmo9TttrfXCXT/0hAhUz2m?=
 =?us-ascii?Q?isKrk9ENHrp26rotqLA0ue1QneoF8qHdkt+VoLhF0eEon9euEZEK8cG+n5AL?=
 =?us-ascii?Q?LQkFwmu//KE2V/1lGwdcFsS7v+grkfa18cE5PI28Tk6up9KAOXBcEpcp3mab?=
 =?us-ascii?Q?612mjRB7bnK4VyBFkeSrciuefOpJUpKw1hCTiki6h/Ya/8zDDC3OthVZlpUf?=
 =?us-ascii?Q?8TrXISVtiCqSq75IgkYs1sBypO3Lh+b6d2kGdWX86UcoDd7ZqyZGG7E4YQjH?=
 =?us-ascii?Q?1cQVsXmmJ3tBfnZuu/LnnDVIKKV8uFigog3KACtRR/5ZWliBw7vR968dZYpd?=
 =?us-ascii?Q?WX0mROsw4zVkbRc7EhaGFv88NEMZaHbx3qVGgo7O9v05O9l9lc4olDkpOkS8?=
 =?us-ascii?Q?3PKCFbGNYJIvzE0+DnTGuawpBLrc7CCLhOabicJ34CjRWjF4NtSKyq0WC7ck?=
 =?us-ascii?Q?g6zFW7QYAzYCYHioH+JImez/XYNI5+d9lMnlPmTsNvpr0BjXMQN7yA1YyecY?=
 =?us-ascii?Q?QaHCGQ7jMFyRHSWietu6NSdsnY5I9jcbR7zaq3Y17YzD3Mae5MJ3Y8oAywwf?=
 =?us-ascii?Q?sUKqxdQ3ivWOSZdaEeZL7Q/TbEcpONYIDmUvzUzNb/RrJXd48WA5oBA2iJ/q?=
 =?us-ascii?Q?VCuo5msqFYCauUfYrIR5F5694V0+dQa1FQFR8rpKUr4d+19ioXqVIbrThwOU?=
 =?us-ascii?Q?clKeBAYwvsKREb99JifMpboh+gr9g5++O2S5Pt+IqFbsYZiTZZA0UcoiMiNs?=
 =?us-ascii?Q?LtWLH67hYKnvabYiUolyYKwTexv95i3mMsL/wNFilatet46T1xixgB967R9o?=
 =?us-ascii?Q?ShGcIKYqRiGN0hk8d7B2K5kF/57vfj7RE4xYIX3PxMVxwMGi40QBdWT7+6a0?=
 =?us-ascii?Q?s7uN3J8g2hWCpqRsT9J2YFLB9rIv691tKM6o7cv7bqCWk94K6DXjW55qg0VX?=
 =?us-ascii?Q?4D3PQ/ieKJkVXPCWcT6CcTqOZk+RIJOMSdd2/mraA9ytCOAqHKy5HSqbUuQZ?=
 =?us-ascii?Q?QYusp3wHMmg/7Yyr2um4xdGKdbHwfYvZCL16eVrXXHP/mzyEWgN+psJh+6FI?=
 =?us-ascii?Q?PNZou5x8sAQ3dSL/gwsooGOg0408yRN2e0rGbXXkpLo/IXr5YGI1hSpi2WGv?=
 =?us-ascii?Q?Hw2ANIdU8GbPxgTLuQBxVmDaB1h9aoeUbkWGteSGcYRGcmumcRpdCmHdAMG5?=
 =?us-ascii?Q?Fboyuwx6VBVtP+Hbw9jpXqTE7TdNrtsef09lXpKnVWFur192EG2923YkS9Ur?=
 =?us-ascii?Q?innx7XnSP8+rRVC1K8o+sRTnNm2zA8APg06gOmi3IEaI+YOZLm52G9uiFHCi?=
 =?us-ascii?Q?+gzwvwJ+nR0rHGx8yvTMcgR83I76NLn4wylSSqNi2HilNSksTEwbx1rnRbvT?=
 =?us-ascii?Q?/4OpvUBX2bQU+zpoubAWyp9xkgkKv9RwnbhjLZ7IJ20lUnYhIKxBbX/cxLLO?=
 =?us-ascii?Q?27lRP8FvSdX9k5XMW9g=3D?=
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 11:10:56.0453
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 50a09e61-8b08-498a-f756-08de17a4ff99
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	OSA0EPF000000C9.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB6953

From: Joakim Zhang <joakim.zhang@cixtech.com>

This patch adds bus callback for address translation, for some
SoCs such as CIX SKY1 which is ARM64, HOST and HDAC has different
memory view, so need to do address translation between HOST and HDAC.

Signed-off-by: Joakim Zhang <joakim.zhang@cixtech.com>
---
 include/sound/hdaudio.h     |  3 +++
 sound/hda/core/controller.c | 25 +++++++++++++++++++------
 sound/hda/core/stream.c     | 17 ++++++++++++++---
 3 files changed, 36 insertions(+), 9 deletions(-)

diff --git a/include/sound/hdaudio.h b/include/sound/hdaudio.h
index 4e0c1d8af09f..61b41a014f4a 100644
--- a/include/sound/hdaudio.h
+++ b/include/sound/hdaudio.h
@@ -293,6 +293,9 @@ struct hdac_bus {
 	const struct hdac_bus_ops *ops;
 	const struct hdac_ext_bus_ops *ext_ops;
 
+	/* address translation from host to hdac */
+	dma_addr_t (*addr_host_to_hdac)(struct hdac_bus *bus, dma_addr_t addr);
+
 	/* h/w resources */
 	unsigned long addr;
 	void __iomem *remap_addr;
diff --git a/sound/hda/core/controller.c b/sound/hda/core/controller.c
index a7c00ad80117..070f05a7eafa 100644
--- a/sound/hda/core/controller.c
+++ b/sound/hda/core/controller.c
@@ -42,14 +42,19 @@ static void azx_clear_corbrp(struct hdac_bus *bus)
  */
 void snd_hdac_bus_init_cmd_io(struct hdac_bus *bus)
 {
+	dma_addr_t corb_addr, rirb_addr;
+
 	WARN_ON_ONCE(!bus->rb.area);
 
 	guard(spinlock_irq)(&bus->reg_lock);
 	/* CORB set up */
 	bus->corb.addr = bus->rb.addr;
 	bus->corb.buf = (__le32 *)bus->rb.area;
-	snd_hdac_chip_writel(bus, CORBLBASE, (u32)bus->corb.addr);
-	snd_hdac_chip_writel(bus, CORBUBASE, upper_32_bits(bus->corb.addr));
+	corb_addr = bus->corb.addr;
+	if (bus->addr_host_to_hdac)
+		corb_addr = bus->addr_host_to_hdac(bus, bus->corb.addr);
+	snd_hdac_chip_writel(bus, CORBLBASE, (u32)corb_addr);
+	snd_hdac_chip_writel(bus, CORBUBASE, upper_32_bits(corb_addr));
 
 	/* set the corb size to 256 entries (ULI requires explicitly) */
 	snd_hdac_chip_writeb(bus, CORBSIZE, 0x02);
@@ -70,8 +75,11 @@ void snd_hdac_bus_init_cmd_io(struct hdac_bus *bus)
 	bus->rirb.buf = (__le32 *)(bus->rb.area + 2048);
 	bus->rirb.wp = bus->rirb.rp = 0;
 	memset(bus->rirb.cmds, 0, sizeof(bus->rirb.cmds));
-	snd_hdac_chip_writel(bus, RIRBLBASE, (u32)bus->rirb.addr);
-	snd_hdac_chip_writel(bus, RIRBUBASE, upper_32_bits(bus->rirb.addr));
+	rirb_addr = bus->rirb.addr;
+	if (bus->addr_host_to_hdac)
+		rirb_addr = bus->addr_host_to_hdac(bus, bus->rirb.addr);
+	snd_hdac_chip_writel(bus, RIRBLBASE, (u32)rirb_addr);
+	snd_hdac_chip_writel(bus, RIRBUBASE, upper_32_bits(rirb_addr));
 
 	/* set the rirb size to 256 entries (ULI requires explicitly) */
 	snd_hdac_chip_writeb(bus, RIRBSIZE, 0x02);
@@ -608,6 +616,8 @@ static void azx_int_clear(struct hdac_bus *bus)
  */
 bool snd_hdac_bus_init_chip(struct hdac_bus *bus, bool full_reset)
 {
+	dma_addr_t posbuf_addr;
+
 	if (bus->chip_init)
 		return false;
 
@@ -625,8 +635,11 @@ bool snd_hdac_bus_init_chip(struct hdac_bus *bus, bool full_reset)
 
 	/* program the position buffer */
 	if (bus->use_posbuf && bus->posbuf.addr) {
-		snd_hdac_chip_writel(bus, DPLBASE, (u32)bus->posbuf.addr);
-		snd_hdac_chip_writel(bus, DPUBASE, upper_32_bits(bus->posbuf.addr));
+		posbuf_addr = bus->posbuf.addr;
+		if (bus->addr_host_to_hdac)
+			posbuf_addr = bus->addr_host_to_hdac(bus, bus->posbuf.addr);
+		snd_hdac_chip_writel(bus, DPLBASE, (u32)posbuf_addr);
+		snd_hdac_chip_writel(bus, DPUBASE, upper_32_bits(posbuf_addr));
 	}
 
 	bus->chip_init = true;
diff --git a/sound/hda/core/stream.c b/sound/hda/core/stream.c
index 579ec544ef4a..0bf181f83b6e 100644
--- a/sound/hda/core/stream.c
+++ b/sound/hda/core/stream.c
@@ -258,6 +258,7 @@ int snd_hdac_stream_setup(struct hdac_stream *azx_dev, bool code_loading)
 {
 	struct hdac_bus *bus = azx_dev->bus;
 	struct snd_pcm_runtime *runtime;
+	dma_addr_t bdl_addr, posbuf_addr;
 	unsigned int val;
 	u16 reg;
 	int ret;
@@ -287,17 +288,24 @@ int snd_hdac_stream_setup(struct hdac_stream *azx_dev, bool code_loading)
 	snd_hdac_stream_writew(azx_dev, SD_LVI, azx_dev->frags - 1);
 
 	/* program the BDL address */
+	bdl_addr = azx_dev->bdl.addr;
+	if (bus->addr_host_to_hdac)
+		bdl_addr = bus->addr_host_to_hdac(bus, azx_dev->bdl.addr);
 	/* lower BDL address */
-	snd_hdac_stream_writel(azx_dev, SD_BDLPL, (u32)azx_dev->bdl.addr);
+	snd_hdac_stream_writel(azx_dev, SD_BDLPL, (u32)bdl_addr);
 	/* upper BDL address */
 	snd_hdac_stream_writel(azx_dev, SD_BDLPU,
-			       upper_32_bits(azx_dev->bdl.addr));
+			       upper_32_bits(bdl_addr));
 
 	/* enable the position buffer */
 	if (bus->use_posbuf && bus->posbuf.addr) {
+		posbuf_addr = bus->posbuf.addr;
+		if (bus->addr_host_to_hdac)
+			posbuf_addr = bus->addr_host_to_hdac(bus, bus->posbuf.addr);
+
 		if (!(snd_hdac_chip_readl(bus, DPLBASE) & AZX_DPLBASE_ENABLE))
 			snd_hdac_chip_writel(bus, DPLBASE,
-				(u32)bus->posbuf.addr | AZX_DPLBASE_ENABLE);
+				(u32)posbuf_addr | AZX_DPLBASE_ENABLE);
 	}
 
 	/* set the interrupt enable bits in the descriptor control register */
@@ -463,6 +471,9 @@ static int setup_bdle(struct hdac_bus *bus,
 			return -EINVAL;
 
 		addr = snd_sgbuf_get_addr(dmab, ofs);
+		if (bus->addr_host_to_hdac)
+			addr = bus->addr_host_to_hdac(bus, addr);
+
 		/* program the address field of the BDL entry */
 		bdl[0] = cpu_to_le32((u32)addr);
 		bdl[1] = cpu_to_le32(upper_32_bits(addr));
-- 
2.49.0

