Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010003.outbound.protection.outlook.com [52.101.61.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCF093783BE;
	Thu, 29 Jan 2026 06:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769667344; cv=fail; b=ZVqT8S/do8SMJHBb1bPq+ANfo8tzIjPdq52+rIrQ4GCA9NUdM+q60frt4UKQJRbxrFo3F07dBhp0cnSsN6iYdU3j5dwwFFpa656AkMjhXOkRvDt0D/ITqlYCpPamy7KOS7uY2DnAmbyvq70zVidIXSq4mXnttV4ENzi0M1lUhw0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769667344; c=relaxed/simple;
	bh=ddgLbVSZv3vu4OIu2GSoQ6ANt+YypugL8V/iBWhbVDI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PZMmXktzH2dT2XO5Oori8ynQhcDC1oimBvNNcvZshM3jtoFW6qxKU6dWILFaYBZMndUfOgFcXGhwDRvzduwtrOjEjbKA0R4pQCVGP/D8ExrLrzOdrtM2EAIoyz5QzuGqiy6cK1mVSG33+M3fvpKIFXMjeqBKzAYi9vG7uVOvf3s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=qoSQHtdm; arc=fail smtp.client-ip=52.101.61.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="qoSQHtdm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y2nP8u9Tx/QEtl1POft4iIYYAIts98bz7vEl682FroGVNG6igrD0+1Si0Dfx6Fw4sQOGEsyD+AQ1cZ6ksdSvZWOaTqq6hhmV2Bic2sqLWtIQYRtcA2d+++MXuPQ1nbqnWZ7Zh0PQhzIT1xPdkmGFNRJCX09agxR61zSjdN4XGrzWHO78hjmrScen2VkdBjOhw02vRulp5wGcwjgmeTZqYXOPC3UHqMmQjhipnqoWUAOUCVFXxlnA9P9vHsqSTrJzQEBWqZNW+nI1nDa2elf1mizh+ukY4z14sEFc11ELiErCV1SM+EXCcetrPMmAD5CkOkU6ycIsjPugArMnehEkyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1l/FKxjSRqkWYqBi3J/UFhnbfL7M+wJFMnxzn88r/0U=;
 b=r2TrPnhyOhdvTOpxwN5CZ6OsMs/ej45c8XdXixv8D8kmrOZgLZZ3VaYCwUmk++MTe/McWYrIolFOe1D2m1b+22rKkQThJBNAhl/De0vVz1HZyZNXNyWdJ9iwzvyFip9CV3806yHCyXs+BGGqKCtdTUxQbh+4Y9ZeKx9Mm6DmjiDVnxiguuKKvCXxYhqRZwJPExY5rFvwOwAnkyBI1tX/uixwKFttphcWfiGO6HMoytiYrRKsv1P9RxpIjX4sZ0pBTi/FNOy3eoHqv3WK0RvUl75mAOJtslRpabJO5tFiuR+XkY9Wmlq5BKkrg3W6yLEaIXdK3v0sNmkcBUyBjzfkjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1l/FKxjSRqkWYqBi3J/UFhnbfL7M+wJFMnxzn88r/0U=;
 b=qoSQHtdm1bWmQmx7QCqca0ji2722esISzAMY+6H90taoeCLqaabjdHI8fhYeXNB8uw6+1Wdh77KluGjc769N0WzcCtPfIsw2Msc1XPvuWnW8F3xw6eQa6IwcoKDNwNC4hfx+e+ThS6YqTDstesU0s/MSI7GRqruvPaSDZsv/OIY=
Received: from BN9PR03CA0257.namprd03.prod.outlook.com (2603:10b6:408:ff::22)
 by LV2PR12MB5845.namprd12.prod.outlook.com (2603:10b6:408:176::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.10; Thu, 29 Jan
 2026 06:15:38 +0000
Received: from BN3PEPF0000B071.namprd04.prod.outlook.com
 (2603:10b6:408:ff:cafe::67) by BN9PR03CA0257.outlook.office365.com
 (2603:10b6:408:ff::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.10 via Frontend Transport; Thu,
 29 Jan 2026 06:15:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF0000B071.mail.protection.outlook.com (10.167.243.116) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Thu, 29 Jan 2026 06:15:37 +0000
Received: from vijendar-linux.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 29 Jan
 2026 00:15:34 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Sunil-kumar.Dommati@amd.com>, <Mario.Limonciello@amd.com>,
	<venkataprasad.potturu@amd.com>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH v4 2/2] soundwire: amd: refactor bandwidth calculation logic
Date: Thu, 29 Jan 2026 11:44:12 +0530
Message-ID: <20260129061517.38985-3-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260129061517.38985-1-Vijendar.Mukunda@amd.com>
References: <20260129061517.38985-1-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B071:EE_|LV2PR12MB5845:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e2d5323-9fed-4683-665f-08de5efdd231
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4R62b9braBjarRFCw0dKOgsqhSiR8TOnRZePqoOdMCUz6IrTilBLNvcDeg/V?=
 =?us-ascii?Q?cQeeaRMpnS8TjjDZwkb239+uW7NzEsk1VfETl3WeeDPdOL1fgxgdcv35rZwc?=
 =?us-ascii?Q?F7XkmZknXfTkgqnglCvQqdKA9XwigESoBx4pgGBQVaJoEwhKJjHM179rt59g?=
 =?us-ascii?Q?qy3fnkZrdCYIF55RJN1GHLR9v73Ro3STcwVok3wjIaCIxBm17W4oBXDcVXlG?=
 =?us-ascii?Q?22uiRkmFrNk8xLbD+eXI/Gf64jOWokI2zIxzyqSgm8R4dao2/mNSJeHA6syO?=
 =?us-ascii?Q?WMEpFvgcEU64UvQBZvHyl4UZlsWz1i/CG5epXf+3E6ObDBCo4Y9+/Y/tYdnY?=
 =?us-ascii?Q?NB2LXlnqsL24Zfr4A9zprbsn1J9amQe7+E0vIoU3UPXDuAmn4u9KJULKWjuc?=
 =?us-ascii?Q?nmd2uIaUz4R3uvGmKUOcsS9BY6mGHduOTnOpAfHStD3Kf8YTsQ9zZVSCKIuH?=
 =?us-ascii?Q?zydOQbGjFyFQE9YUjljbb9PZ7pa0yDv8GQk8z7xgo9KWNUzQL9uJrVYfJSui?=
 =?us-ascii?Q?XMh7ooXQNQ6SmY4AYkAs2t6eKHc3wmB2IGCZVtnjffk3UdgPsG/SZ2UbzZbv?=
 =?us-ascii?Q?Vw/g+cL6RHsEHEpeaHW8VIT7/nHqpQqZtkb5L9J6sZduXT61S4gu4N7nU3Wr?=
 =?us-ascii?Q?ifdXAtoQLzqQcmaF1c0UaBYwNI5HMQyvTFkB5TB2YvWr4dzGbmtZruaN3ndb?=
 =?us-ascii?Q?1o+oPc5+LTtQUxloEDT8W6vnYk+ANPm8D/c5WY3p/WR4hVSvBlII6j7agWZd?=
 =?us-ascii?Q?764gNZjIdQNYBuHhgbpdZvo5aiIrf3gDxUH57HHB6y4CSMufIp7Ey10Bsb/y?=
 =?us-ascii?Q?A8OWeUumIjj8TFqhpIha0YyxZ+Z2iByXaNYZm5crR480x9Xv5Dm2jcHZkmvj?=
 =?us-ascii?Q?LuTbAEdoGLC0TkK/f/3WlisC3TP5xKqbL5JOCqfrBLsrI9Z2oWSQyFERS9ej?=
 =?us-ascii?Q?rhiJnsysSOf3RuiXwF87u1wOy24FCeXcti0Xb6cOqX4HNkMnD2q/H2xPycH2?=
 =?us-ascii?Q?PhPAkUv685tCtJpHYAi7quX+0tIT0mu2tn22XbCp4iRdrxsH/hZLwCFctRhP?=
 =?us-ascii?Q?RAoyzEibjGDRVZ63y1mdtJIKseIzy5dT9agyWNl1Mg1xBO+E79az+1XUoSkm?=
 =?us-ascii?Q?hIulauaydBCGi0lhUq3kOvr1qWCiIbf8fulzD4pZnCXsHadlhhoT52UFy71d?=
 =?us-ascii?Q?w9OCwsxAMAmMkU9sr1ae0aU67nFc61Ee/ycm5muJAf7mg4jNwJV9My1DNSup?=
 =?us-ascii?Q?3+BOqqyMmEkXlHem5X+JWtoQaOPlsVXK5GEroYFDMhC+rLvEz5UikjK8v5hW?=
 =?us-ascii?Q?tivbaKV00A8dKzG1rf7FUyaBAzM3jrNMADi2e2/NPnLs6pO7yB3F+vQuHRt4?=
 =?us-ascii?Q?jQGQPZfQazuSUKxslY7tI5jy/lnTFzdrCN/dgyZ7Mu7VQvx8qoHnPf7j9hsw?=
 =?us-ascii?Q?S14y5Exyipc5URM1Nl1zVT0dzQgViJoAhjuDcRiidqQFO11JgsDSrmdTWWq/?=
 =?us-ascii?Q?Zk67iFAsI0Gl5tkcffTgXQQReErezO/qIAAOIej0QDlUvzHhUUVgiKuEuAsm?=
 =?us-ascii?Q?uWWVAR27HfDWUei7RCSEWIXU7DmLR7q5HhTRAkBm+/v1v9aI+on7cfxJQs+Q?=
 =?us-ascii?Q?HnVWOaFWLYMtPEHGwfzkzD4CihyEZUKFRg8GAc5eAnfE92/B5R8TCYIZqLNH?=
 =?us-ascii?Q?DiaDkg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 06:15:37.8176
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e2d5323-9fed-4683-665f-08de5efdd231
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B071.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5845

For current platforms(ACP6.3/ACP7.0/ACP7.1/ACP7.2), AMD SoundWire manager
doesn't have banked registers for data port programming on Manager's side.
Need to use fixed block offsets, hstart & hstop for manager ports.
Earlier amd manager driver has support for 12MHz as a bus clock frequency
with frame size as 50 x 10 with fixed block offset mapping based on port
number. Got a requirement to support 6MHz bus clock frequency with
different frame shapes 50 x 10 and 125 x 2.
For current platforms, amd manager driver supports only two bus clock
frequencies(12MHz & 6MHz). Refactor bandwidth logic to support different
bus clock frequencies.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/amd_manager.c   | 57 ++++++++++++++++++++++++++++---
 include/linux/soundwire/sdw_amd.h |  4 +++
 2 files changed, 57 insertions(+), 4 deletions(-)

diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
index b53f781e4e74..7cd95a907f67 100644
--- a/drivers/soundwire/amd_manager.c
+++ b/drivers/soundwire/amd_manager.c
@@ -476,12 +476,16 @@ static u32 amd_sdw_read_ping_status(struct sdw_bus *bus)
 
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
+	int stream_slot_size, max_slots;
+	static int next_offset[AMD_SDW_MAX_MANAGER_COUNT] = {1};
+	unsigned int inst_id = amd_manager->instance;
 
 	port_bo = 0;
 	hstart = 1;
@@ -492,11 +496,51 @@ static int amd_sdw_compute_params(struct sdw_bus *bus, struct sdw_stream_runtime
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
@@ -1089,6 +1133,11 @@ static int amd_sdw_manager_probe(struct platform_device *pdev)
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

