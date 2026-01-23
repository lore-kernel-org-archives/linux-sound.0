Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011039.outbound.protection.outlook.com [40.107.208.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00679335BAF;
	Fri, 23 Jan 2026 11:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769166782; cv=fail; b=krzqVwvuqtK7cOcXpjQRxzmDgb51w6t0linJBhGb+2EqMwPnFvZLI6APHdSDhMb4QsFRoC/MJ/apgehBrXfGB8syhYRzuO2WbFoFzE93lHztGGZdOiv/6HMEmPq4I4bM2w7uw16K44R8YaVOFiELGlGIgDFbYoOhEEZgpXoh6SU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769166782; c=relaxed/simple;
	bh=Pzmp1C0gpi3l+H1v5f7A1YD17YpKthWuXmdQB6ppfu4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bO5nYLTmP3LlNatKDUjMYclZtpCQ/dtGc+VfnZ7rhruNBTj0x6uJePtlRK+p30DIqjA4gPux4sSt/QUhlWvbrBXkHA+HaYvgpu5p+fBvCONDBzLyqiu7TOGIGf+PESuaWijaAU/Br/yKWWte6qfalRlk12ebEHDsWAF7IkMiDfg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Y+bTEmKn; arc=fail smtp.client-ip=40.107.208.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Y+bTEmKn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g4lzK+Q2FrtdSpPKL382xd14VCOq40rPdLG2TBtwzcbKMpbIRRAdEjzDelaLQo1gBUg73mxhPxWVDCrktTjdWF31HEasKj7SP+LEmMMJO4Ak3dSKNOP60480UuUYO0FomVjRZ/0dPoawnky7RMSHpl2ngj1DhxHzDRTQN3nVpe0jsJQx4V9fRXjLPnlROyfcn6KumHO7IZG3wvi3oglx9Jydvrfkp+gILobzY05GiDiiXzLymvD3eEm9bcProu8QVwTCTlUqHJEsgFS2t0NuH6jrJVWwF6H27a1ECSbVtE3U8xz1CbXhaZiWQYcRM53/RB/oLfbYpRHi8i+BOZYMAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tv7gm4hQYSPvhFx61dskOBypKSmj62WGgCdunIs9iCM=;
 b=oWNYiJ93GOK4dZTj3krSJUPNioCFJSyeZPo6KBIGJXWMXBQN/ka7oDg1aCCAqCF+1m+DPVT2SAZUTUOofUtlIzw2/JucVGvBjKhYHNJkz4UuQK5yKxaj7dWbbgxLEyhMSyQv+/wtTOd2eYN5ZPmfbrWU90cRRE4DAQfjlJf7gJZ9oaPKU32TKFesw2dqimco/qC0/QDX6euog9SWXAosQW0PJa2fD8VtaZurdvRHej8kZQV8vEQkv6cbYMpNxbXqiLW5QOma+XwiI98BtEiymEcoWiyRv3B0CP68NtMPg8S976jyk404IC+m3tWfX5evq5T0tFDik7pEYv8uBSNY/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tv7gm4hQYSPvhFx61dskOBypKSmj62WGgCdunIs9iCM=;
 b=Y+bTEmKnXM6zZhgOYM0FGg6NdTxUwdx6PMf/Koy/UBQ06MCvPEh6iLbNgHu9DuILBXrN28am9tSOq/OsQwDXEZLDSWCONeTaPuG43Xf/2E0ulj2/zvJPM+DUEld6rd8Vr+vxFo95JCWhymbNwHW6gj8ZIAhBHwQW0P1rU+d2RJM=
Received: from BN9PR03CA0969.namprd03.prod.outlook.com (2603:10b6:408:109::14)
 by SN7PR12MB6714.namprd12.prod.outlook.com (2603:10b6:806:272::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 11:12:54 +0000
Received: from BN3PEPF0000B077.namprd04.prod.outlook.com
 (2603:10b6:408:109:cafe::cc) by BN9PR03CA0969.outlook.office365.com
 (2603:10b6:408:109::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.11 via Frontend Transport; Fri,
 23 Jan 2026 11:12:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF0000B077.mail.protection.outlook.com (10.167.243.122) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Fri, 23 Jan 2026 11:12:54 +0000
Received: from vijendar-linux.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 23 Jan
 2026 05:12:51 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Sunil-kumar.Dommati@amd.com>, <Mario.Limonciello@amd.com>,
	<venkataprasad.potturu@amd.com>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH V3 2/2] soundwire: amd: refactor bandwidth calculation logic
Date: Fri, 23 Jan 2026 16:41:32 +0530
Message-ID: <20260123111233.3649153-3-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260123111233.3649153-1-Vijendar.Mukunda@amd.com>
References: <20260123111233.3649153-1-Vijendar.Mukunda@amd.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B077:EE_|SN7PR12MB6714:EE_
X-MS-Office365-Filtering-Correlation-Id: 79f952af-9fb3-4143-c075-08de5a705b1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?0+VfvojYretra4l7Ybb7u/7+H179hgrhwZfPFKeerubMMzn7VuTmdrrWjNdE?=
 =?us-ascii?Q?hoqbmSlgdCgg/4Ls1SRSuEufh6F9qtVh3vsWVulchG5PJjXRm+vXElCwnZvS?=
 =?us-ascii?Q?0CHHk9vxdqi0TLwQD+w7rHxL42I1E+wlIj8w9TUo7Scfo5UXsDaOtZafNXrB?=
 =?us-ascii?Q?3pDB9l00vvdFwGE1xOKSHDlDBRNFWksvQKMb7RuGzrUXhiCfuyEgb+e7Q6fU?=
 =?us-ascii?Q?EfOI2EydtkzQA80rCFF4sNd2JkNJ9jGN5wya8LFdz6G4F5koiwAA+/uSRLvk?=
 =?us-ascii?Q?AvHBgSCGraADDDCUF3WC7nCYI6x69gpbSd4HHRo11Df6k2sQljO0VZBnHpQR?=
 =?us-ascii?Q?QiOGC80nWUwU9SnOHhast9rD7vK9gDbCL0OEr+jBxqwHJ3ppP0oSYHixjosS?=
 =?us-ascii?Q?qNTlBAxJldmOUiOi1/60TwuzUlQGsC79ABggwW8iO1VhSuIVk2zaJAAGfYWN?=
 =?us-ascii?Q?d5zKD27FifpknUSdhycG7aRG8zRDlL/bgjA0b1x0Jjk6kWUEMovVbP34BM4l?=
 =?us-ascii?Q?1eKRtHfanijlEiuxG7MBIz0xsf9HDjJMsHnmrCMzBYZ5EZE72lqVkgvyeDPF?=
 =?us-ascii?Q?af+unNN6vki1onUBcKn0v/SGVHhGj0usgUxId5yqyTVNtnY4/BY6jkxpJZ2e?=
 =?us-ascii?Q?xaKB5gvVCmYHBwxVnOnZt08/7Yb3KRac2Xw6aeBgP6cTV6jBmXQT7bRYgNoE?=
 =?us-ascii?Q?bilJ1rsxheMQCsa9fwkZEB5F9SXh1CFFFv3Od4FLTKM9sPnmKL9T0kOkpINU?=
 =?us-ascii?Q?FRhL2wH8SABHTebCWjkI6+5W4X0l7vWFJOPGVI+BO8cQjkhJ5bbn8RjEODSC?=
 =?us-ascii?Q?NH3yszfCnxrzHgoStk0jHyO3KEFQdqMAMDHPxosCc8pVuaik25/RDmwHNASN?=
 =?us-ascii?Q?DMDVZfc7lktXJFMnx2q/2lgPRSzgYKBQLkM0mSott1CteEaCbXeu/T/4mLim?=
 =?us-ascii?Q?sYb30LB1O89YHzI6IjtjhpujmVw7EC4VMIST0GLLZfIdZFFw3BGy1hRUJigx?=
 =?us-ascii?Q?3rZFvMJiU9/7x4plDKpyxlvdM6lu6rb7dWYyTyYgQM+R0T98be2b1+Cs0VgA?=
 =?us-ascii?Q?HLCzq+kxA3XcK3GEJqlvBMtOUgvZ6glTqGmtXXGVWAmz/DKhzIWH3Hj8GRrR?=
 =?us-ascii?Q?Ny/iww/KEd8hpof4RKgFFrxC2RmKu/KFY/MyWpJBog3IFi8db85pCBWadKtB?=
 =?us-ascii?Q?gvPXvMVj7qjbKKPL8OTX4wy6yl0KRlKJIhYib3S+jzKpjmqmSP9dcLhL1xeY?=
 =?us-ascii?Q?1wZTMjH95F/BRAAhg8lf93YBV72aq+mNhaIytyBwxzRtSqKEiO9ma2xLIeHM?=
 =?us-ascii?Q?J8/X2TN9cbqCGr6etzy5DKDFXLOzDjaOV1xzorxKK0S9/Kd7KhwKUcyGA0ix?=
 =?us-ascii?Q?7Id82MYCxeHhcwOAne2tXrYgwBIjGD4oNdvKuup4chD09Oc6W28lvCiprZFK?=
 =?us-ascii?Q?BwKlOdqOO7vHA7CikimqGGL3l5/BfV9XZR/r0J/e1kJyPruXX/t7U82Zk5A6?=
 =?us-ascii?Q?L28Od3KE2cqhszKJjBwd7k2rQUdZB6vxAFBafeItWVmig0llnjR97RhJ6qkw?=
 =?us-ascii?Q?Mvr6nHjcOztmj4bawHi2hK7LizL7Hn7T3puebNNpyL+P4UM56Drjf0CWx1GN?=
 =?us-ascii?Q?1mEq2SBB9qyUGavtUERK8FBQYMKbiSU/EyGT6qAGZmOFs9/A83Wsk0wi51o8?=
 =?us-ascii?Q?Xd3sjg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 11:12:54.4275
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 79f952af-9fb3-4143-c075-08de5a705b1d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B077.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6714

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
index ee3c37a5a48b..954e3cb3286f 100644
--- a/drivers/soundwire/amd_manager.c
+++ b/drivers/soundwire/amd_manager.c
@@ -480,12 +480,16 @@ static u32 amd_sdw_read_ping_status(struct sdw_bus *bus)
 
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
@@ -496,11 +500,51 @@ static int amd_sdw_compute_params(struct sdw_bus *bus, struct sdw_stream_runtime
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
@@ -1093,6 +1137,11 @@ static int amd_sdw_manager_probe(struct platform_device *pdev)
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

