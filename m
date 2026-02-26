Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010017.outbound.protection.outlook.com [52.101.85.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E745938BF8D;
	Thu, 26 Feb 2026 06:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772089025; cv=fail; b=f7T0ZQKcvW7AVYKD6uqe8dnzBwyNEjchmAPSwnd37cEWvzQs6xzirIOUd70AphoODRfdia4rNVjyORoBogoWj3pEGrleHcoaaIAMozloy6CX+51KDrHaAJ3eHj4u16GmRJ6l17oFuvSnet8yD7nar6rZyUzCje1em/4Vl/l3wIc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772089025; c=relaxed/simple;
	bh=DWwVG+U4B0GmOJx8uK9F+8YRaqjRTaGglZFm2NGOcls=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Alkdu4HEN3DIPn5GLt+N0w1JIvHoOYHn9Zpn0hrdDvsecdHxPj5OHi+Qepon73N02X8GVs3UYDA7D0LEIC7xn4oEAiyQwWgSpMpHDDwZ+RgSgvx+VcFtnjyy6TOZ/ycrIwK9+ndtyemRblf+2NmcHf78yIGTIMIDrtjTMQAnQNE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=B777kZKF; arc=fail smtp.client-ip=52.101.85.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="B777kZKF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NtZRcSNyrdkXtaV5W5Ym1lKI3l6raV3T41n0078Kb/3ur+sCD5FrNxKHaM7RYhYgU23y/i21F18oTNJFT19QGPsz5n/bzAMj965EmeRm+COdqhzmhlxseNRq2RmIJnk0W8dZ2+FeYJiK0rDy5lqy7txd7b3EFwIth5n+Om2wYuMmaFtgV0feQ9OIipgodFFF3poPQ/F1m8st6SCjDjV+II5a6tWj33fcpjPjEW/Fu81OSu8UiD3oJc1atNV9R/kzVfmhd02woBFeBRI78jetzm3GtNqZv6jbaL4fl1B7BOfJXPXYe3YM+FjcThxszlbRyfHW28IbNglJAcWYxF8JyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vAKUSnLVK3P6dI/DorrTQ8l5drBUmzdJgD2Bd771Hns=;
 b=yxPS5jeSGM7HlGxGbKijgJ99K77gy7hvQ4uGilRHwh3gGKEB9qf/TsgPI8VuPMb7kTbIJX0PTiGI0IvdW/pUYqCNdJKFfC3ctMaqdNwhxtcqFPsG5YE4REobUie9zjBrTF0DD65FfcP1YeJOAgMhODvRALmxYZYgqscv8gmxJBwyqGZ+1p63LXlrBIzwi4hUqqa5yXdsUJ1zFeBMOsIv2l4fglM4BPGrFcCLSdTCClGBP4L51c/Uf2dK5U1BBQpHDiV+9u+rx/SToylMvBv/MpU2hFtfu8vYXjPA4oZhZF3qQu5oR7XBpdATDLdstxU+h64BSXA4Qkpf+P9Xniq70w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vAKUSnLVK3P6dI/DorrTQ8l5drBUmzdJgD2Bd771Hns=;
 b=B777kZKFNp4Y7AKQ4WSx3LH6bf8FmF43w9ltb07ZYK3gwp2rVBKn6BVneQwVNv/zWli3yEchA2Z9IwD8hRNy8pBegdMf6Pp8atoSHREujj+HX91VzKtGJXUu+8vNNbpbvaudjMoFXDlXuwTRyPfenpRlnZQt+1ATICy9cO90SCc=
Received: from BN9P222CA0012.NAMP222.PROD.OUTLOOK.COM (2603:10b6:408:10c::17)
 by DS4PR12MB9660.namprd12.prod.outlook.com (2603:10b6:8:281::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Thu, 26 Feb
 2026 06:56:58 +0000
Received: from BN2PEPF000055DB.namprd21.prod.outlook.com
 (2603:10b6:408:10c:cafe::b3) by BN9P222CA0012.outlook.office365.com
 (2603:10b6:408:10c::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.25 via Frontend Transport; Thu,
 26 Feb 2026 06:56:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF000055DB.mail.protection.outlook.com (10.167.245.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.0 via Frontend Transport; Thu, 26 Feb 2026 06:56:58 +0000
Received: from vijendar-linux.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 26 Feb
 2026 00:56:55 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Sunil-kumar.Dommati@amd.com>, <Mario.Limonciello@amd.com>,
	<venkataprasad.potturu@amd.com>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH V6 2/2] soundwire: amd: refactor bandwidth calculation logic
Date: Thu, 26 Feb 2026 12:25:54 +0530
Message-ID: <20260226065638.1251771-3-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260226065638.1251771-1-Vijendar.Mukunda@amd.com>
References: <20260226065638.1251771-1-Vijendar.Mukunda@amd.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DB:EE_|DS4PR12MB9660:EE_
X-MS-Office365-Filtering-Correlation-Id: 5456e4c1-e1cb-4b31-9298-08de75043c1a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	4IpdWuRP9sBRe1iY1gB1rHsM7iZAWbRcG3/z6Ae3rJ0U8YgGxT+YpaDYX6SBQDl2YU50m16BMj5C/60NCuuN63YCCAK5h/amgOB+5haLkW4vZ+XYq34fMjIcQN/N13CVhnTHZz5qOgmSXz+IE/aqVXIIB/DddhDjkzFQzi8E2FQcS3O6ViuoWSfxNh0FANX3kJpVnGX2bYuSyw4Z7+mnTw52vnLfY16W2JZEPnRUO8xSadP7iqm5QbLQt6yVxwlwjcnbIHzSmfGW86XrMBCnjaBmcYbS+oi3NdHivxboXbmaF+xn9iuDvhriL3wjQAS3WNd4PvrUa1nTBgJeoSz9GXiWukfqJyu0wW8ghjcFbeRGzPyTcS6IDNr+rLNEfcC/pVnexD+nQWxajS338cCcdqegr1MXHEe4weQjRzejWKU/vBn7+QwN9DbqnXM0Ag50Z9gZprGTjvkjiKZbFkysvEVjpx+M+wdQexic4wRSPo/UlzUQ8CV+BTiTguG3YUZpRfZcLkUoITiMuvJv7l9MojVdRwjGbBeCTHEJ3lXHLyIEvzEYceRJuDi4PAy0YYSMmiHbTga2vWwOXpU5nMiy+eoiXPJoGhk03t2SIqIYcKwRKpb3lFWFtmWLVISw+taDvUfvZn79hXSQCqFyqH/YGB2DnPpzjQ7cJmIl0xbkCy2+RXotfZTk2oZJ7H6QWTrzDVT2Pd/Mas2fxJvUhGyhkSjQgHsxY+4fKNyDTZZ8nv7tDdZ9fcOf+CbUa3gCjz1b2zNplkCTsLP+9LIHXObb3HjS4h36Wxqy7tA9SDEnokL/4DTD825O7Cvgt47ukBzfc1YX4oJqWMmpmW7Mm6P0nQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	+byKnHw3EkE6/XLB8ClusvKkkmOxyA62CODLL8STmLuYPfMXtjfI3ZA/KUYdzN/zLiykpsApL82b+o59NhKqg40oqIMV/fXTgCou02BgtSEaMJVQ6IYlVaLuFp9Js9AwYT2Kydx8UYRyYGYJGa9EUjWhaC6+7X4ioyvMSA6iMorkAfLc3T6dVSC1B/ANM7usr9iv+QZXnhoZmbE86s5d/URZ31yEKzStLqDcHR2wBRI2u4H0ePFFLQl5/tHUvyW5yGMzKyQHhDn19F0DeO+QuXZlgCtI06YnonMA6B7nxxyJJFeBks1pm9li3mRHfvBqcXNpphQUuqD/TG+0+2eYWkIK5cKzGbXbU6YZBGQJrBnFbpdkfVIi9F1B2DaP6j5b9CD6GnKBbO+dq9vlY02UW3HGnQ8FpoAS4tZvAccc5dUjYtqhXBZ6NljqICqPOYls
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 06:56:58.1463
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5456e4c1-e1cb-4b31-9298-08de75043c1a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055DB.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9660

For current platforms(ACP6.3/ACP7.0/ACP7.1/ACP7.2), AMD SoundWire manager
doesn't have banked registers for data port programming on Manager's side.
Need to use fixed block offsets, hstart & hstop for manager ports.

Earlier amd manager driver has support for 12 MHz as a bus clock frequency
where frame rate is 48000 and number of bits is 500, frame shape as
50 x 10 with fixed block offset mapping based on port number.

Got a new requirement to support 6 MHz as a bus clock frequency.
For 6 MHz bus clock frequency amd manager driver needs to support two
different frame shapes i.e number of bits as 250 with frame rate as 48000
and frame shape as 125 x 2 and for the second combination number of bits as
500 where frame rate is 24000 and frame shape is 50 x 10.

Few SoundWire peripherals doesn't support 125 x 2 as a frame shape for
6 MHz bus clock frequency. They have explicit requirement for the frame
shape. In this scenario, amd manager driver needs to use 50 x 10 as a frame
shape where frame rate is 24000. Based on the platform and SoundWire
topology for 6Mhz support frame shape will be decided which is part of
SoundWire manager DisCo tables.

For current platforms, amd manager driver supports only two bus clock
frequencies(12 MHz & 6 MHz). Refactor bandwidth logic to support different
bus clock frequencies.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/amd_manager.c   | 57 ++++++++++++++++++++++++++++---
 include/linux/soundwire/sdw_amd.h |  4 +++
 2 files changed, 57 insertions(+), 4 deletions(-)

diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
index 447b9d1f9cc7..ecd495b3632e 100644
--- a/drivers/soundwire/amd_manager.c
+++ b/drivers/soundwire/amd_manager.c
@@ -467,12 +467,16 @@ static u32 amd_sdw_read_ping_status(struct sdw_bus *bus)
 
 static int amd_sdw_compute_params(struct sdw_bus *bus, struct sdw_stream_runtime *stream)
 {
+	struct amd_sdw_manager *amd_manager = to_amd_sdw(bus);
 	struct sdw_transport_data t_data = {0};
 	struct sdw_master_runtime *m_rt;
 	struct sdw_port_runtime *p_rt;
 	struct sdw_bus_params *b_params = &bus->params;
 	int port_bo, hstart, hstop, sample_int;
-	unsigned int rate, bps;
+	unsigned int rate, bps, channels;
+	unsigned int stream_slot_size, max_slots;
+	static unsigned int next_offset[AMD_SDW_MAX_MANAGER_COUNT] = {1};
+	unsigned int inst_id = amd_manager->instance;
 
 	port_bo = 0;
 	hstart = 1;
@@ -483,11 +487,51 @@ static int amd_sdw_compute_params(struct sdw_bus *bus, struct sdw_stream_runtime
 	list_for_each_entry(m_rt, &bus->m_rt_list, bus_node) {
 		rate = m_rt->stream->params.rate;
 		bps = m_rt->stream->params.bps;
+		channels = m_rt->stream->params.ch_count;
 		sample_int = (bus->params.curr_dr_freq / rate);
+
+		/* Compute slots required for this stream dynamically */
+		stream_slot_size = bps * channels;
+
 		list_for_each_entry(p_rt, &m_rt->port_list, port_node) {
-			port_bo = (p_rt->num * 64) + 1;
-			dev_dbg(bus->dev, "p_rt->num=%d hstart=%d hstop=%d port_bo=%d\n",
-				p_rt->num, hstart, hstop, port_bo);
+			if (p_rt->num >= amd_manager->max_ports) {
+				dev_err(bus->dev, "Port %d exceeds max ports %d\n",
+					p_rt->num, amd_manager->max_ports);
+				return -EINVAL;
+			}
+
+			if (!amd_manager->port_offset_map[p_rt->num]) {
+				/*
+				 * port block offset calculation for 6MHz bus clock frequency with
+				 * different frame sizes 50 x 10 and 125 x 2
+				 */
+				if (bus->params.curr_dr_freq == 12000000) {
+					max_slots = bus->params.row * (bus->params.col - 1);
+					if (next_offset[inst_id] + stream_slot_size <=
+					    (max_slots - 1)) {
+						amd_manager->port_offset_map[p_rt->num] =
+									next_offset[inst_id];
+						next_offset[inst_id] += stream_slot_size;
+					} else {
+						dev_err(bus->dev,
+							"No space for port %d\n", p_rt->num);
+						return -ENOMEM;
+					}
+				} else {
+					 /*
+					  * port block offset calculation for 12MHz bus clock
+					  * frequency
+					  */
+					amd_manager->port_offset_map[p_rt->num] =
+									(p_rt->num * 64) + 1;
+				}
+			}
+			port_bo = amd_manager->port_offset_map[p_rt->num];
+			dev_dbg(bus->dev,
+				"Port=%d hstart=%d hstop=%d port_bo=%d slots=%d max_ports=%d\n",
+				p_rt->num, hstart, hstop, port_bo, stream_slot_size,
+				amd_manager->max_ports);
+
 			sdw_fill_xport_params(&p_rt->transport_params, p_rt->num,
 					      false, SDW_BLK_GRP_CNT_1, sample_int,
 					      port_bo, port_bo >> 8, hstart, hstop,
@@ -1080,6 +1124,11 @@ static int amd_sdw_manager_probe(struct platform_device *pdev)
 	default:
 		return -EINVAL;
 	}
+	amd_manager->max_ports = amd_manager->num_dout_ports + amd_manager->num_din_ports;
+	amd_manager->port_offset_map = devm_kcalloc(dev, amd_manager->max_ports,
+						    sizeof(int), GFP_KERNEL);
+	if (!amd_manager->port_offset_map)
+		return -ENOMEM;
 
 	prop = &amd_manager->bus.prop;
 	prop->mclk_freq = AMD_SDW_BUS_BASE_FREQ;
diff --git a/include/linux/soundwire/sdw_amd.h b/include/linux/soundwire/sdw_amd.h
index fe31773d5210..470360a2723c 100644
--- a/include/linux/soundwire/sdw_amd.h
+++ b/include/linux/soundwire/sdw_amd.h
@@ -66,8 +66,10 @@ struct sdw_amd_dai_runtime {
  * @status: peripheral devices status array
  * @num_din_ports: number of input ports
  * @num_dout_ports: number of output ports
+ * @max_ports: total number of input ports and output ports
  * @cols_index: Column index in frame shape
  * @rows_index: Rows index in frame shape
+ * @port_offset_map: dynamic array to map port block offset
  * @instance: SoundWire manager instance
  * @quirks: SoundWire manager quirks
  * @wake_en_mask: wake enable mask per SoundWire manager
@@ -92,10 +94,12 @@ struct amd_sdw_manager {
 
 	int num_din_ports;
 	int num_dout_ports;
+	int max_ports;
 
 	int cols_index;
 	int rows_index;
 
+	int *port_offset_map;
 	u32 instance;
 	u32 quirks;
 	u32 wake_en_mask;
-- 
2.45.2

