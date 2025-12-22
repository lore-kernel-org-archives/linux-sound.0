Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010029.outbound.protection.outlook.com [52.101.85.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B6632FF17D;
	Mon, 22 Dec 2025 07:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766389763; cv=fail; b=RsrblGSPviMslFOo2wFWYteOM6viE2NkQdUzKkUewxjA+u+HE2GSvfNT3YK0ah8Dt2znTk+GxsgsA2UxU44BNNOVwMO/tz/eO1hvvhi+ANG+SmnVW7KoKdDnV+SDaQlhc2RAXGCd1zaRBSK1pZCIiZOHpGm7KW1Vja7UVrMtZK4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766389763; c=relaxed/simple;
	bh=k+6NicomObttf4JRliotaIRQK3Em3rYEChNCirf2fig=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UWDpjriyMKeLqVwRn6lxgpJVBpUXIOI7lOzN8h+/IrYaIftMD5chswW8sWbZw1UemLsfGYKt7SkDdnF4X8H5xjqCVzWBpBzxuu9aIF39IpkJzGlQzWIkkv9hL3EOCLC+y3WDerwzisvMhPLA5WRKo1D50NV4yAFrHNLvcIOW4ns=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=WVnn2cqI; arc=fail smtp.client-ip=52.101.85.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="WVnn2cqI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GW9CELY6qId3Afevd4yBUM6U84CLoaff9Dg/QRgB20HSHYrW6bvrZt/pS1Mm2cxGBzUOdajAHt6LpmCGHayHiZ3NXAuVZ9dQdiQOSF+B1qEsyft/RFhnwbTiXVU4DhtHaK1ihfCexkEOwdiPPSYgmnmjxneU0vVJbG1lEP31GyfMsKRh7bU9DcpmH3Q0ByY7rGciOPYhCtSi1PCSAebyvRQMfavVFAGdxhSlFWZ9xepUy4m1c1lFz9zXDHpyz98ZcEIacmHVDNv4mHTtxLieYzPPb7Uhe7517Sa64iihqIdJju5Ms8fyP32iL2dgQkLgTN0ApVBbPZ/oKGfFcVrsCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BKSvihdhAEzVrxQLJ7rfbUVPq0d/F2SWBoUdBrhziNE=;
 b=szf6JWnXVzXjuT9fSchp1YMMLw0qFIG2SOeKtqkeN3NF+xEhLJp0hRa+6lezKjeuJFMS25fc9B7oZdui/WEsd35idQ0k9IIx2FfeFE8P9ACbKbH0BHfsre8Ou6x8sc2yKBQSRsjPa6qA3QaPmLfth7JqkECL6BH78tII+LP7o8UOpf/Sq7mSHLlDaXf4X08G0EMmoD0DSRn7N2F4MoD8rqhdQW6JFO9RfD9vSjvLu7qYCQN8OFLwDjTVYUOdCThf2TFNgXheWBj3yGtL4PygqzBzeJDXcTCEqATadiOJETRGnzk8Pw2E1I0JYbAXAKiwvZ+gVO9v47sInpxWT37VZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BKSvihdhAEzVrxQLJ7rfbUVPq0d/F2SWBoUdBrhziNE=;
 b=WVnn2cqI9ZftJXkwp1ELdEsa1pbQ0FFgH0B9Rfl1PwHX7Mnab0UfN3k56QAESRgNM7f0gvtgCZWjYnunLOtkLyeVGiDXU00r5SNTGJGruW59s6NdtzLzCcpItis6BkrQD2xhnjnMRK/4/OM4aaMAH1+SzRmbIaoRVkSrmLHxBa0=
Received: from DS7PR03CA0067.namprd03.prod.outlook.com (2603:10b6:5:3bb::12)
 by PH0PR12MB999111.namprd12.prod.outlook.com (2603:10b6:510:38d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.11; Mon, 22 Dec
 2025 07:49:17 +0000
Received: from CY4PEPF0000FCC2.namprd03.prod.outlook.com
 (2603:10b6:5:3bb:cafe::b7) by DS7PR03CA0067.outlook.office365.com
 (2603:10b6:5:3bb::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.11 via Frontend Transport; Mon,
 22 Dec 2025 07:49:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000FCC2.mail.protection.outlook.com (10.167.242.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9456.9 via Frontend Transport; Mon, 22 Dec 2025 07:49:16 +0000
Received: from vijendar-linux.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 22 Dec
 2025 01:49:10 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Sunil-kumar.Dommati@amd.com>, <Mario.Limonciello@amd.com>,
	<venkataprasad.potturu@amd.com>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH 2/2] soundwire: amd: refactor bandwidth calculaiton logic
Date: Mon, 22 Dec 2025 13:18:13 +0530
Message-ID: <20251222074847.7270-3-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20251222074847.7270-1-Vijendar.Mukunda@amd.com>
References: <20251222074847.7270-1-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC2:EE_|PH0PR12MB999111:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b89d895-0f88-4beb-b606-08de412e9b7e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ub3tuNuGhnzm5E2HGrwV4GzunsAapBgLnQAE16uXN43es2ncR2ZcD9vdC5w8?=
 =?us-ascii?Q?0Umbo4apLARCd9WpgFufpEPA87+9RI2owzUOnV58dQ5s/sMQNJ6q31apjTNt?=
 =?us-ascii?Q?+qHzvbLq7IyJF7ERBxfW6VaArtBdVtHmPyWpj/F0wcEEK0zZjh7G6IvrvjA3?=
 =?us-ascii?Q?EVDsV6O8MNtCohBZP1OWndyY+aEQTjet9P6IHnaGHmwz0xhHuAcygtFrYJ1l?=
 =?us-ascii?Q?3V7xCi/i682uOt2FY2bYpsLQAsdGhYe7BSJyXFfRPqrC9vSOszQfjDf7/ypu?=
 =?us-ascii?Q?XyveGQt5HhAjVNPRADKJMnfqaDFtz0x+9l8sLD896HwreKqZYTmjSZgAVqWD?=
 =?us-ascii?Q?B58PXlXYrC6JsM5JkAj5VIFu45qqfnpE42GPokdhQ28TylgxrRy0MzIA6EF2?=
 =?us-ascii?Q?D2Ox7FP6/FtVj0DT5YfIMM7sXaS2RvnMRODkIZ4AcyRz978p3CDvkKzemux3?=
 =?us-ascii?Q?+2U3iM6HpxSaavWC8hqxkCy7GLPkjjQ/qVZbYltU+2wxMshQY/XVibtiqXHU?=
 =?us-ascii?Q?emcc+KFuUcq/zLurKixoWk7518ANducwUYSjoWs1Gawqcc5iA8adLXj1Sq3J?=
 =?us-ascii?Q?3bR0IuMnZHlSKBwz8tTYMSzTcjBJfA3EWV7d4VQZCj0X0V+rYjc0Gh39k2gP?=
 =?us-ascii?Q?xxVRGQJ9CxbVQr2wYpQioB3XZCmlBQGE6PrpIQR5onEQsnu1YUYPE89xI6ZH?=
 =?us-ascii?Q?h5bAJSIejfL1csSuAd9KhoY1vcR6OveYmE4ZiQlO0TGFO4d291aXBbgzttRF?=
 =?us-ascii?Q?Z/Ji4VEM2XCCFvH0wSbo4ZP5Me37u58nKRL2lw2+DipLoLvZWhbOpbwp0mDH?=
 =?us-ascii?Q?x6QTkpY4/1powAXajqQhY9BZ7GGLG4aymOA5lvmwTIBqVfGLSY+jh+ih0ppR?=
 =?us-ascii?Q?svRpfzbU29Uh+AoaiFEGONDfGbIguJY2newhyqt/yHQus2ONYwt44ooXCNwH?=
 =?us-ascii?Q?YxvPpYePoI8rlY05RsEQujwLoHyLU5P4RfR+5MmDg8b0qi22GwmHywMcidBF?=
 =?us-ascii?Q?kpjUHEyWm2cMQ1mb3AbAmIMRzYmo6TfqTZDV9EKFzbaBr/lAJyK4rXQsLc11?=
 =?us-ascii?Q?NGQbB5xfIoHGekDO2MogvgHQQP6C9ng9mdi6uK6PcUrOZT8DVk0X0t6DfHAw?=
 =?us-ascii?Q?gLfkgyFU6ACl9VUah8eO3P54J/NgXHdvAuxbdBimvAQbeZwE5L+4bd2YAeEF?=
 =?us-ascii?Q?4N49jc6baJM26weNI5mlIZiDp3CJuslVsGoseNKI1W2K/833f+/IFZHLGr2D?=
 =?us-ascii?Q?zliZOUDGCYdKl8FfRwnQevNxJQJ326yFe41NROIdny8sW52Xz4QzW1iftX+f?=
 =?us-ascii?Q?NK/xUwrB31AenRDgfk+XHpOwbIzqbSkG76NJQDF+3YSOqNp/Txkb0tLHzs9m?=
 =?us-ascii?Q?VL6JpHUcMsfpZdYglHp0mPIgYcUD1auIGApiB6vUjbKKLIgNH2tlc/PLEht0?=
 =?us-ascii?Q?6YhKR1tAEqWQ96EexOuXPA4clMwYPzw+gCeekGfAW2SgTVHrFYP0PV2wLg4t?=
 =?us-ascii?Q?mGF1BTMVzi/rmkAXspEdq/ynZOX7BuAzzFCprX6smh1uNLMfe7ofN/zsKxxn?=
 =?us-ascii?Q?NWnLnFlwoXO2ODwXDGw=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2025 07:49:16.5379
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b89d895-0f88-4beb-b606-08de412e9b7e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000FCC2.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB999111

For ACP6.3/7.0/7.1/7.2 platforms, amd SoundWire manager doesn't have
banked registers concept. For bandwidth calculation, need to use static
mapping for block offset calculation based on master port request.
Refactor bandwidth calculation logic to support 6Mhz bus clock frequency
with frame size as 50 x 10, 125 x 2 and 12Mhz bus clock frequency with
frame size as 50 x 10 based on static port block offset logic.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/amd_manager.c   | 52 ++++++++++++++++++++++++++++---
 include/linux/soundwire/sdw_amd.h |  4 +++
 2 files changed, 52 insertions(+), 4 deletions(-)

diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
index ee3c37a5a48b..4e4fd4c31019 100644
--- a/drivers/soundwire/amd_manager.c
+++ b/drivers/soundwire/amd_manager.c
@@ -480,27 +480,66 @@ static u32 amd_sdw_read_ping_status(struct sdw_bus *bus)
 
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
+	static int next_offset[AMD_SDW_MAX_MANAGER_COUNT] = {0};
+	unsigned int inst_id = amd_manager->instance;
 
 	port_bo = 0;
 	hstart = 1;
 	hstop = bus->params.col - 1;
 	t_data.hstop = hstop;
 	t_data.hstart = hstart;
+	if (next_offset[inst_id] == 0)
+		next_offset[inst_id] = 1;
 
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
+			/* Static mapping logic */
+			if (!amd_manager->port_offset_map[p_rt->num]) {
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
@@ -1093,6 +1132,11 @@ static int amd_sdw_manager_probe(struct platform_device *pdev)
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

