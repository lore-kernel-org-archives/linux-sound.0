Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012063.outbound.protection.outlook.com [52.101.43.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 716A02D877B;
	Thu,  5 Feb 2026 16:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770309968; cv=fail; b=ap32dbed18nZ7JZNrfK0HYmt4ENitCaQ1iv0bmSv0ZnW6YwTLqVlkqq1IsFyL07lOWkctoHyZwNq8izzd+VRmFXPlLASyKCiwS2/8sXYqoYqHiGCPdoJX0Ou9gGLRELnjjcWXXEYuvwgwmAQZEyEIyW2I2XyLPCrF7RJ9ooOYNs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770309968; c=relaxed/simple;
	bh=DBB0G7g57ncSCKRn6604lL26qucMwh5P6p8+YO17t8s=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IzKzri1PLkiAvWdWHPH8F1OKaPjqtWLBXmPeO0tKRNZetVusa8ghgeiIVdBWxwRfc2zBNogy4ZVJ6i0kNrRYPEeDNrQu3vcwRv455g8YpjHFVK262c6nzfIL2VfYJdzPt4238/AX1Zga0UeKKxyKNKFWbvRNPFX510I7THtko70=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=x0lSRI59; arc=fail smtp.client-ip=52.101.43.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="x0lSRI59"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sKmEB+fG1+dPG5MeK7jIZPoT2nH/BdwEb3o7zOYYuQIKn+tg46uxHdF5ekRgpVkS6oE5gWqNkoUYt16F+8/CcPyPvlthERrS+oZkhoPBU3P8lJrfypBg6B4p8E3KxO14mPGyHxvlTIHjXA20RXlZ1DLEBP2R0rV3ac1vu4uPkB739Gg4BjxKS0p8K2IFjw+sTFYzilwIgA3fmVpAOo7qYZsXrEGzZoZ0XDmArH/bZf/3whr1KbeHEOxtSel4dR1v70YC+yYYT+CqVF8BsQHAFABTcs+OZ4mSpooQsq4ZQ4V8FMNW3l/w1YzKzk0JvbCW8xHoBFxjVkBFKB1NFy3Rtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WFEGmRv3v+GMXKeNW5P3Od59Ieu305drB5Poj8UzZp4=;
 b=U493SfV01uDAVZHY62+gv+H2BMQmBMjzag3wE46dWbziU+qGfEbUD+8ry5h7lD2TdYw5rh3dO6OxLrtVcX8OX3GvALY9YCEgiW5jReqSyIkPGCdTzkN2YgaCG76WO3SGxG1p10AWZLbfULi07STeym5/obAi/wV8u37/l8K9JA2UlUpXQKASb3mDZ7mF8zV1heT40sPH7qRnm3uPd75pshBU0xcPv2gvoNcvtuov71GAY2DJMXSCuJC0wvYN0iCt5PqJdLboL3S6sgCxngPA4oMbnxLICdeWcTCIQ8tZ/Jrib3mX4s6tbPsCYOv11lx0At1EAWGWs4dmKCy1WUjwsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WFEGmRv3v+GMXKeNW5P3Od59Ieu305drB5Poj8UzZp4=;
 b=x0lSRI59vgM5e5s7aKh7n4aYC71Al/mUWFUoip63bn8r30ftuu8tQ2LR+nE/n2lZNzhoa13ZPEy2bjjQ7nUON/duvYK8SZiIntJ+q3qGVyDdShjBEfnwiwnpmluBNreWJPAP6ihm+Q1xSgOr7zrBCC/yzI9HYmzVTKUUt8ZJSgU=
Received: from DS7PR03CA0305.namprd03.prod.outlook.com (2603:10b6:8:2b::25) by
 LV8PR12MB9450.namprd12.prod.outlook.com (2603:10b6:408:202::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.13; Thu, 5 Feb
 2026 16:46:03 +0000
Received: from CH3PEPF00000012.namprd21.prod.outlook.com
 (2603:10b6:8:2b:cafe::ff) by DS7PR03CA0305.outlook.office365.com
 (2603:10b6:8:2b::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.15 via Frontend Transport; Thu,
 5 Feb 2026 16:45:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH3PEPF00000012.mail.protection.outlook.com (10.167.244.117) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.0 via Frontend Transport; Thu, 5 Feb 2026 16:46:03 +0000
Received: from vijendar-linux.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 5 Feb
 2026 10:45:58 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Sunil-kumar.Dommati@amd.com>, <Mario.Limonciello@amd.com>,
	<venkataprasad.potturu@amd.com>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH V5 2/2] soundwire: amd: refactor bandwidth calculation logic
Date: Thu, 5 Feb 2026 22:14:20 +0530
Message-ID: <20260205164539.892403-3-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260205164539.892403-1-Vijendar.Mukunda@amd.com>
References: <20260205164539.892403-1-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH3PEPF00000012:EE_|LV8PR12MB9450:EE_
X-MS-Office365-Filtering-Correlation-Id: 2419085e-9093-4c72-8d19-08de64d60cd7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?iwWEHXHOl7+ijAtDXtJ/+C3S58MEviDQo91aM2uywd8M91FmAj1f+rEVEbvZ?=
 =?us-ascii?Q?2RI98W7xg9VQGkytfkmsRlKuK/Yi09zthhB9WZoNIeSMnpITVxUWzWJrKV0b?=
 =?us-ascii?Q?o0771fsVOzDfs2xpj25oq6tG5ZkdZbqqI/Kz3raS5VFpY4xrtudCtT8Zoq9T?=
 =?us-ascii?Q?xwuVdkYa4++8Rr3jsGIsvuoqwowY9Fn2YsTFSjzMpxOaBUTXnuSOPPQXPNvb?=
 =?us-ascii?Q?eHWO0LAvO5O8cZb0B1cySXL857Mb3i3aQjbSgAJa0X3SX6TkqhjxO/bX58EH?=
 =?us-ascii?Q?CDUdKV4zCCgFMV0Wr0GkeflU3MYD+BgvC6GMDa0Tm1P0ZlTV6AoIc6Oq9+YZ?=
 =?us-ascii?Q?NpMmDurkf0V0sItIJt4rbYaTOLm4nkV/09eUI/9HOXsesaYEpqSV8INoxMUJ?=
 =?us-ascii?Q?B9d/ueyLwYRialL6LC8cKaYYceN8NZrfRKjO350QNzMd4U4cv8cFvMNNKy/M?=
 =?us-ascii?Q?lauMBTtKsFinwECzPxIQTAsXSfS36YFUbGwPRPpJLWj01OqA15DOn1ph7/O9?=
 =?us-ascii?Q?//UrB9JUtQInIJhBDC/yCBapQxleMLFDxrTv8D5DBCsm0BXVYb9qINNzs9os?=
 =?us-ascii?Q?/RRLJnlXewUOI+GcFmp2MqxmuC7W9yQjMQmUZLO4cfZN/DQQfUAG1mwXboO0?=
 =?us-ascii?Q?fY7hnR0/OvhDrX/blCzQT5e7NwX6KeZcdz2OUc2WolS1w4/c73Nyj7m/BzHs?=
 =?us-ascii?Q?S1g+e7dO3Wulp6828o0iDDZoghIlettpXTUGnApCZRAamrHrW7CZm8X9w9Nr?=
 =?us-ascii?Q?e/4eLMtNKptHfkTuJBHlpf1gGBUj6vVCOoXtn0IqVmo2SykvnRO7shOu+1/s?=
 =?us-ascii?Q?YTaOGqYGIoiTfrK9MSyKfTHh09RybEnH6bY0kpH08AaauoExQZnqzGhp8mgv?=
 =?us-ascii?Q?z5X6+E/8yxcjfKQmREwv4ALwNUk+B7rDPU9e+xw/4faTKr7R0X6CBP+w/+vE?=
 =?us-ascii?Q?pbC4RMNIECYHzVhNrOYTA/hr34ej+u0lCDtNvtVpQdsUpefhCLw/3AgUINIp?=
 =?us-ascii?Q?VBVimXk5BaQzaSFfJzMdbg4WwNYMLlRavdm8xJ38zmgLBMM21LtyYV6CoJ+3?=
 =?us-ascii?Q?H0WVwl3jWpJyO8B3tTHOVGmq7RLyEXtGqjfepIfiYDNg7CzX3CzJSfFjVYxy?=
 =?us-ascii?Q?wtccqkUtMnnXNFq8/hlU+r86uAGMl5uDNNNWNfFQeRsALLOyuHKA7+yrXpsO?=
 =?us-ascii?Q?ErJ7qSOpkbjXUtIl+GyJseM3gzXNsRUlY0XTBLnLc4O7LqJfRUWXbbqCxxvw?=
 =?us-ascii?Q?qHh622bcn+KL8WBxXaR8H7HUzzocJdiT3iln9vdyad1S97ai9lCECIK9/K7z?=
 =?us-ascii?Q?7/xXyHlnCcuB4M2GdlwD4RSr2FuOPzfu8BmhkXF7+8XxBNhjQCaYnnaIS9Fq?=
 =?us-ascii?Q?Vh2IF7oAIHKq020GLeINSP2YB2QElf9xp7gAx49pmjLEERtBzTdsWEFPVvkJ?=
 =?us-ascii?Q?jZQi6sl10M5mlaE+60JyVORHdVQnzGB2rBlN8MmXfzcbBlWgpagzLOTzShSt?=
 =?us-ascii?Q?NdctxI5UIM/2x+nAii5tiebvXg3zcop2KNPyCTaj6SPL6iyv6wqd4roM1NFP?=
 =?us-ascii?Q?nmoFxGqgkOBTnONdNE11W6fo0Ttza4KSRk/X8a3D3ETUdvCmovC4EMDT4LQX?=
 =?us-ascii?Q?bkr17Nc1BJVcDiZbba0MjV8=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	qohcWGhec8YoyUPryccro4cmat07oajX2fz1VPrw9xUOBnz2tuUY2kx1ViDfxHiZ6bJF0RN5deL+Nr1GW429uDZjOHZgQ7h5mrqUmQyKsowsgmdHWNcKNRofUT2Wzu3E5GmRqm/eLCYbqwm7yITPDNDe7V7pWKNBFioCRLhzOOpBLSIlPv0O4VisEiDY2lNQHBuuYvR24HmWi6g5ZQu4I6FA/b8EbxCFgzLymwmEr1Og/BhoXLDa+n8vlvavcrOIATfHGT4JXOr7CdAMJHmdxRdh2QEhZqmkXMFHLPaJFLIHeCQ2axv9kUeVIjHN8WJDX56I0NmMaBTBBbEFLVXWJo7pzBmMDS9cCnAC62auzPyhlSw/avyXpvrGKivomU2fa158hTu2zQLqDJeaA52H/Of+UeG4KhSyxqQeYcW3ZU5RlAkE68a1Vu4NFwRo6eud
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2026 16:46:03.3879
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2419085e-9093-4c72-8d19-08de64d60cd7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000012.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9450

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

