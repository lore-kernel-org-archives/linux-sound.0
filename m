Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013040.outbound.protection.outlook.com [40.93.201.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FA1F3939B6;
	Tue, 13 Jan 2026 14:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768313662; cv=fail; b=tpO/VsNzzx4NmvmGsQvhabE96HCAbg27E4S6+9ZENGeUXoz/OXS4Eg98JJ+Qh+7p+Ry8MuUa3pbyY/KA9KT4S8RLglPdANpcia+h1M+3TBsfqL+u6cDbyiglEF/Dvcs0QDUF6W3Qqq13n8tya/UxE41CkF+OcMwnRGCdkcwMCEM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768313662; c=relaxed/simple;
	bh=qrXHtZeC8jPYuitWyE+OsTCTSVuJ4m9qiSxDPUGRJWg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oetppHn0XiEw57S48HvAISeIbY1AhNEJ9ClxUXzyplIL/FKH2GIlCN+K2eaSwxZozsw7aEw506zE/dO6AykCiPJWKo7Ek+qbyaIiI1JMY/Bk/9n2Q2Qpsk0T1OCucovSGaWy841Zxm3th4EoHozMLfGfC2XS7qf3+JG5cjV5MJw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=GTTJ6KOC; arc=fail smtp.client-ip=40.93.201.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="GTTJ6KOC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CEpEdBZ5F2IlZMIDKNueuqJlV2OJp7N1Bbc8YEF2RHnLq2GafwuljJ6QKa2egE/HVLXpXRyOIoAScmmymXIXjr+zYCJ9dCepD0cWbzAfB90fEbuNvJUNWNSrTWRp886eT6BK4f39xHEpNhS/ZAl6iR00p0d9xzDsOQHVDRWZa7GZcRDeM4sPeitNtdf4AHiriM+pIGuq3TabWSdhdkZUuJRjhyoUDnbD9z8JNjSy9ZEzMPoQ8B4vrfWWOTz5s6rzFZnR4VFRpbZx45gsNnbDeGYnW6ennT8CB9UCe6SD2a8bCER7hlzHIWc2Ql/YCDtAtkQYONttAmBS07E3lbA2iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BnWpTh6vtnJUoFic6lyRh30JHs3HYM7BVLONe4V60Dc=;
 b=Pif9oBbEAfYuf/Oy0TYHMAxhxDsyWmPOz4GaD9/ycATnXfESvpZmpU3GE9t2e0tok9ZQRdvDycqm+hc8fxvuP0pIgZeJSUlxt8DkMzaIT/YBY5lq+9UgbmfZSdA2bMWirXyGIwxeI9zv2gP1Wh+Evt2JUc/PEYTqOUDImfXH6+VXAeUvcIokqa+93epC6cnO/Gcu0sdjSxnJRgECwkgeddKspD55lEEgEGuQUgCGWrHA5RnHqWuBzDROOe2tij8mYqomrMkz0X5r4FtMGpPtZJo9HMsxoCKYHXYV0016SakjpXR8Aa4KhZ/EF4w0H3Wm+y9xQ9AOGj2RF7v1rWyFZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BnWpTh6vtnJUoFic6lyRh30JHs3HYM7BVLONe4V60Dc=;
 b=GTTJ6KOCl7dUY/hPAkmTUqeA1x1UKl/V4p5Wfumzuc0WV3uX2rwWOgCou7W3iLNwOyhA2V37uIhXzZRbx5tTpKac/jKf5XrF/WJqbQQXzbQOj9q5PzrleJ1tP2guKqSjAvWnBVWfutdF86GlC6qC/5L/0KK0ihJUOmg5GCCi318=
Received: from PH7P220CA0031.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:32b::32)
 by MW3PR12MB4458.namprd12.prod.outlook.com (2603:10b6:303:5d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.4; Tue, 13 Jan
 2026 14:14:16 +0000
Received: from SN1PEPF000397AE.namprd05.prod.outlook.com
 (2603:10b6:510:32b:cafe::ef) by PH7P220CA0031.outlook.office365.com
 (2603:10b6:510:32b::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.7 via Frontend Transport; Tue,
 13 Jan 2026 14:14:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF000397AE.mail.protection.outlook.com (10.167.248.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Tue, 13 Jan 2026 14:14:15 +0000
Received: from vijendar-linux.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 13 Jan
 2026 08:14:11 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Sunil-kumar.Dommati@amd.com>, <mario.limonciello@amd.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>, Mario Limonciello <superm1@kernel.org>
Subject: [PATCH V2 2/2] soundwire: amd: refactor bandwidth calculation logic
Date: Tue, 13 Jan 2026 19:43:08 +0530
Message-ID: <20260113141352.1940465-3-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260113141352.1940465-1-Vijendar.Mukunda@amd.com>
References: <20260113141352.1940465-1-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF000397AE:EE_|MW3PR12MB4458:EE_
X-MS-Office365-Filtering-Correlation-Id: 9979eb6d-0d16-4603-8f8a-08de52ae08b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?RMVdkxeGybryxuQWai+HMO/qKMPSwSTfikFHp3c89+7pR8VGTJKHVXUzrD3G?=
 =?us-ascii?Q?f1HPbifnw+XAwzKmXVxCviTib0B23hX9jpk7WE1UE5Qk6zBKs9zeMfGK1tXF?=
 =?us-ascii?Q?stoJ/PvS6/txDjyc/QEMPq5y5q3uyrCdtH5cvvmf8q8hWoWqpE2vfqcGZ/Y+?=
 =?us-ascii?Q?kV25btLx6kqpWgLquJ8jtZ4e1fqaFA1kIBN+msXukzFS3qDjUEVxFn08+ron?=
 =?us-ascii?Q?a+I8nfNEEKlMdxwRlW0XB616VjhaXjBQMbHCJuuvtSMxMsiiCXmYD6AYmDQp?=
 =?us-ascii?Q?YasMlqontNDO1s2VwGrVqQ5Tc4QQVsOb2J9FZtFn4KiIICswjCjnr0Hiq5Hx?=
 =?us-ascii?Q?/G04z3OC3dKyWiOGxBzjN79SsELoqu2n1L4Dy2X2iLu7Ai3VzfDBE5KEJbR7?=
 =?us-ascii?Q?qDDBa6KTdM8ITRTD1haoCyq++U5o+awCkrogeuiucWZaboVIP7m8gcisRCnf?=
 =?us-ascii?Q?i8QVXgJHe0eh0dPTGNs34eFgVOrvfNdDf5WbafRCvMGc7pgLPi2eehN6b0L5?=
 =?us-ascii?Q?29VjbfWzcokaayZYGi391ifgzvrFjbHyRGH9096Kubki7NSr/lDtF5okzb0G?=
 =?us-ascii?Q?KJWuEZ2YES47Z0WPtWXuP6QjS5O86ww807q3MJh4F8YnbKQ0hBFWNfCeCdPz?=
 =?us-ascii?Q?7cQQASE8aipxysx8ugu1Ik57lIAFXTcxsUHS3UuB7f5+c3zIH2AY9UWOWVvA?=
 =?us-ascii?Q?aRa0nX4sJuRHQ0WxE8KYPVhAQdtNAsDHqT+18nYhvVi7bn4R3jiFn/Kuc9Jf?=
 =?us-ascii?Q?gxDEGymcjgKe46xOPhXtvfIMKd0AZ8rYD7nrndhU38l+bRZSgO49CS8H3m49?=
 =?us-ascii?Q?NVabIAdnMO6QWDNGWQMxvrI2SxJttjQ+2kvA3yONroWz1Ui924babnB98vRD?=
 =?us-ascii?Q?omfpF9zUjnGEJCQj1lVvSC1XCxJa4nXVvbkJ8+zIi7YCF1mX/zVhVJRZxHv4?=
 =?us-ascii?Q?qZrFCIl8fdhOSXXUmzT3zW++jahAIl4IxyXz3k1Q9yhaCZqLSGREZiujnT2s?=
 =?us-ascii?Q?NXtWik0jU1z8WQ/V4jyxFLh8hzQtX0N7YuCZeAr2J4HNTL3YddzE8QnHFniz?=
 =?us-ascii?Q?uLxYuQ73oXNgIgqpLY/mDUhJQiP8sAaZ/qMH1vJtwq4L6gV271uCicFdAqQB?=
 =?us-ascii?Q?BlkhZ94jdy0sp0y0khpsdPQlOm1Q52dzp0or0TrWFjZfU78dd5v78e/1zyXW?=
 =?us-ascii?Q?uSuCtj0+pR+7AxrYD8jGfkX2gHr7pQMFQynZwgSDkoS+FQNn62XeT8Jf9dNM?=
 =?us-ascii?Q?JkLoLZ4gzcmWA3tfhx2pcCna6WTA6BiPulFLV+Ev12iZ+lZ13Z578YeVArlz?=
 =?us-ascii?Q?vL5MuLgXb/9Tun2N8MIxRLWnNa8R4tjHSk7XgNinjbv7Qkp58YbrcEAmjOAC?=
 =?us-ascii?Q?uot9JpnCrQMOwEA9GIuX0U5e0R9ZzbfUlM5Bv552Q1kAg1/umgwD2wS7mxHM?=
 =?us-ascii?Q?yVXArSNJ31AWuBAXx/cVSCrMmz62pUC+JU9U+7M3/uLc0GkP33Ia9hO2T3gT?=
 =?us-ascii?Q?9jfjyinSIxlSXPOIWNalSsHPXVMvdkbH/HSAvrdGRTLpbQDPfWYbhyDs71r2?=
 =?us-ascii?Q?hM5tgAEDXFTmqafGziQ=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 14:14:15.6630
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9979eb6d-0d16-4603-8f8a-08de52ae08b4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000397AE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4458

For ACP6.3/7.0/7.1/7.2 platforms, amd SoundWire manager doesn't have
banked registers concept. For bandwidth calculation, need to use static
mapping for block offset calculation based on master port request.
Refactor bandwidth calculation logic to support 6Mhz bus clock frequency
with frame size as 50 x 10, 125 x 2 and 12Mhz bus clock frequency with
frame size as 50 x 10 based on static port block offset logic.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
---
 drivers/soundwire/amd_manager.c   | 50 ++++++++++++++++++++++++++++---
 include/linux/soundwire/sdw_amd.h |  4 +++
 2 files changed, 50 insertions(+), 4 deletions(-)

diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
index ee3c37a5a48b..fef5da7e29c5 100644
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
@@ -496,11 +500,44 @@ static int amd_sdw_compute_params(struct sdw_bus *bus, struct sdw_stream_runtime
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
@@ -1093,6 +1130,11 @@ static int amd_sdw_manager_probe(struct platform_device *pdev)
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

