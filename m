Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.195.70
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795510358;
	b=FGzDiY7JbdlpexRFn214Ly9JIW6O/kfygDqyeQd8tklfcIG3R3L/QY8RDwjSDpdZXray
	 AVUbDw4yt66qRY/4bpzps5ZQzu8oC9dNHDHyLo09XN81Hjbbe7ZW0HuO9DLfqN+CjWaFK
	 ePjwqQyYlW+cLn5thwaE8t3oWu53SboRx2QPgI5+n3hSJRS1rpP0nJTxCmSALfsdNZgKq
	 0k2GNI3+oriTy340a713ZxRH3fZMm7g9tHw6Gj45J2e3y6vffd18eiKGDD5KmEDmlxWjX
	 NdT3d+hAd+H81eYaG9LJEK7k0nwVGA2Uin2M/GmTOcMv6s7z390y0f6VtmQ1IFEOF9w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795510358;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=77wm3wnkUWktXFVf1ei6R9dOW+9AtXydlkd194hbuYE=;
	b=U9pByOEgodt+ACQ/EnPicCnGXc4Fga1yHQ5gCzEHnNaHnaoewOKrkuHxUI59u5poAtWG
	 ZQN+wZ2Rsbh6IMe/XUl16uvDTW+kw5bx39gp22VfH7ycUGyQgWIOo2AuMId8vxw/dkMfU
	 9VN68odHi1390eIsn2L7FkxgnnJ6gbG7ZVGSbAhIAvRkwKYnPIWi1lqGLMZ5HSmUapZ5f
	 Z0tkEfvgAJwnXo2ORsag73Dzk6ItPsRdRdzu1Qkqp5/40F1XSZ5Sa6E4H5+vOqFAygMZl
	 cKFiB4ez24gPuFE15ztrMNmtUfjOtCXSqZ08Gqgjgs7z9LmtQ7adk7PdbIxYHS08m3Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=WwGAjJle;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.195.70
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012070.outbound.protection.outlook.com [40.93.195.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B50C7606A332;
	Tue, 24 Nov 2026 08:52:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B50C7606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=WwGAjJle
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mzi9J+8iU7PTtRXm4D1FLq4DKUp1ryzQne6DLTKEjfUbkTTC0ZS4KLXHt0jsJ2XuobCef0KmjhNyHbvJRNcKOUe+BittzkYtaUy8LeM9caDjgru7gtTyaq1qkD/AFoC7EwC/npDzW0wl5yGjY2Oim732dLyCoeW7IdL0qjGS80GmhiHGBnq82alf//k1sg0Rpv/f1CEtdCPq5XzxoTb8+XW/C5lATzFNJaBsSIhqN8d6Augub/uwSqov1R5sjyMYCYGEKaP3FzAG0J84ux69+OXK7fnjvt8BzVURf6ENoTsh0mjO5+gnA6nbuKgFMPAkBeFT0L2dmCoahaUhy6z2GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=77wm3wnkUWktXFVf1ei6R9dOW+9AtXydlkd194hbuYE=;
 b=r2r34bA6hAItNrg7i1sIrorSQuIMyJoQu51N/UTQd8dw/KggUWFagbsbVwlukZADuiLe0nGoD5CQRrZDUFqg7Rc1bX2CiMyljPnL1Fb7tto+suX1wv3HfPCCxVMrzoajq9OOOUl46PWzGaqQe06xBF9ope2uEzBiotJ6/PA/eiX/bMw8PSZk7zZudM+JjetUtDYLTudhdhJ1lcCg/6FYfKrbKEHg3wYBJ2fX0BqwSc8/GZYTQgwRsTvkGS8VY1yi378teRBWdwZUNJHYtHcdhRHaLVQJio/CGVLHaywy0oCe83F+yDHewxk4L97hYyuu9dkdaI46yrNkVlIBtvxL4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=77wm3wnkUWktXFVf1ei6R9dOW+9AtXydlkd194hbuYE=;
 b=WwGAjJleff0ELdqAnB0cH8kd1zxp5QKh1O1H7aRYGH+6iJp59bmQxAQB/eWKQXDHRVOiZbjuoo6zZg1a9QotoeUDVG/+zCayDpoNO/WZiGrbRZ1zPTVqrQRvtzeBWlHPJVeVB7ByO7yOY7ZGMiHAes/6RSMXgfuBz/1sO9EFGMY=
Received: from MW4PR04CA0086.namprd04.prod.outlook.com (2603:10b6:303:6b::31)
 by PH7PR12MB9222.namprd12.prod.outlook.com (2603:10b6:510:2ef::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Tue, 24 Nov
 2026 08:52:33 +0000
Received: from CO1PEPF0001885D.namprd02.prod.outlook.com
 (2603:10b6:303:6b:cafe::6c) by MW4PR04CA0086.outlook.office365.com
 (2603:10b6:303:6b::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.14 via Frontend Transport; Tue,
 24 Nov 2026 08:52:32 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CO1PEPF0001885D.mail.protection.outlook.com (10.167.249.246) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Tue, 24 Nov 2026 08:52:32 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 24 Nov
 2026 02:52:20 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 24 Nov
 2026 02:52:19 -0600
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.57
 via Frontend Transport; Tue, 24 Nov 2026 02:52:16 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>, <Poojitha.N@amd.com>,
	<lee@kernel.org>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH v9 10/24] soundwire: amd: cache ping slave status to avoid spurious disconnect on timeout
Date: Tue, 24 Nov 2026 14:18:16 +0530
Message-ID: <20261124085033.682755-11-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261124085033.682755-1-Vijendar.Mukunda@amd.com>
References: <20261124085033.682755-1-Vijendar.Mukunda@amd.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF0001885D:EE_|PH7PR12MB9222:EE_
X-MS-Office365-Filtering-Correlation-Id: 529883e3-f1d1-4840-134c-08df4a084767
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|23010399003|36860700016|18002099003|22082099003|261009223027099003|261021121427099003|261021133027099003|261021123027099003|261021130227099003|261026130827099003|261026140227099003|261022105027099003|261102123227099003|261026121527099003|261026135527099003|261022115727099003|261022113327099003|261022075727099003|261028144727099003|56012099006|261021135927099003|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	In3U4FEMrkglzxBNQ6V+c50P7KS3CH0pefWDhZq4S6lHH/41XI33KYF26lvzEgkChjMURSDqpIspt8S/pqor9u7gb/NDTlm8VXBt8Ng+IWYdhhtYdrdm+04i0SSv1KfExMUpBOm9o/rwPY/Siqu0Bbz5jkQ2wnsM19Qp2pYO4YIcEeSXOj1Q1DQMEQK18kO7dt1EHLSVJX5JIS3ztDgJm/QWIZUN35zVPntwzx8vpQwR2vF9J8Fz1yZ2p9Gp483mguX77zjh5yFrtPobblpiOT6PD0NrvuZuTPMIyR1Kx70YCHaD/X9HG/Cdppb+jAB5FpapPOiUBllfno8NgmqzKo8RaXDIQ9e5kW/0pueBVbwqw98EnyX9VTOtYrdryrB4um5LdTKOZSACMdIg1tBJWjrce7+xxqd0bOvL1GPXfXC9SL8ebWG3kMuV0nPDqrEt24/LB12fwlBD/z7IVEDFqVDAjLH9Mj9Q4s+GFl0e5pml0EB6UldQYFNomYxBz64i0XemxDzd0CCrVVLk6RzapoI4yM9WWLDbQc37KLBN8HH3oCLGNtCVpSodzvkAz9qnI9QQDRVY6Wt569qmEqoIT5nj/a+z64NYFA6yTE9fGZm0Qgo7XP1zSFgaFEuyDEH1TCrZ8kClcY/3tCca35k3yRTHDImyWi36JmeofipZNcU9wOZx410K7aEIv8vagX4JWb0bzV9c9cn2vHSu3mhgLg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(23010399003)(36860700016)(18002099003)(22082099003)(261009223027099003)(261021121427099003)(261021133027099003)(261021123027099003)(261021130227099003)(261026130827099003)(261026140227099003)(261022105027099003)(261102123227099003)(261026121527099003)(261026135527099003)(261022115727099003)(261022113327099003)(261022075727099003)(261028144727099003)(56012099006)(261021135927099003)(10067099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	p8tONS6hucXfGfBxnaG+66YItf5lZJrr/qBPba98N+OasacMk5VRvNlVf1FFqL4UWRfe2PhCXBFzew1hqUPs917hyO5GHatl9I9mCdvBASq7bgKyJqG4UyOA8DmgLlclUgo4vCHxT0zWpiFJoed3YQcoC2ZPlfpseEAJ8QTM3E8+wEzsqM8UR0n8XfnIOA6RqWp4ZoGnNi2L/EgSVRKhbxtl6GtpX+vM1YRd9+PVhbaUMN/Ym4bbMzUhiC4OwByayixNpB34MV3j6s848/kQT5mltiwz+Z986OV0ECIBg39JuO2pnmpkdZ/zrBupjdDWGCOhSag1lE4ygMFQXT1wHigOWwE9saN6Qr2NSdhHLziS2X0Jb6YkqEGf3D8cRrT3XG8IjZGesYc5fpQbzzkpyWIR5fRc3OHOQbsTUo6+p7idpuESE+YPJmojcqvkXfIt
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 08:52:32.6934
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 529883e3-f1d1-4840-134c-08df4a084767
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF0001885D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9222

amd_sdw_read_ping_status() returned 0 on a PING command timeout.
This was indistinguishable from a valid "no peripherals attached"
response, causing sdw_show_ping_status() to log a spurious disconnect
warning even when devices were actually present.

Add ping_slave_stat to struct amd_sdw_manager to cache the slave_stat
from the last successful ping response. On timeout, the cached value is
returned instead of 0, so sdw_show_ping_status() sees the last known
good state. The timeout itself is still reported via
dev_err() - the cache does not suppress the error.

ping_slave_stat is initialised to U32_MAX in probe and reset to
U32_MAX under msg_lock before any failable step in the POWER_OFF_MODE
resume path, so a partially-failed resume cannot leave stale
pre-suspend data behind for a subsequent ping timeout to report.

Fixes: d8f48fbdfd9a ("soundwire: amd: Add support for AMD Manager driver")
Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/amd_manager.c   | 18 +++++++++++++++++-
 include/linux/soundwire/sdw_amd.h |  4 ++++
 2 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
index 18ddd489ad13..7b1aa2a87a32 100644
--- a/drivers/soundwire/amd_manager.c
+++ b/drivers/soundwire/amd_manager.c
@@ -549,6 +549,9 @@ static void amd_sdw_read_and_process_ping_status(struct amd_sdw_manager *amd_man
 		mutex_unlock(&amd_manager->bus.msg_lock);
 		return;
 	}
+	amd_manager->ping_slave_stat =
+		FIELD_GET(AMD_SDW_MCP_SLAVE_STAT_0_3, response) |
+		(FIELD_GET(AMD_SDW_MCP_SLAVE_STAT_4_11, response) << 8);
 	mutex_unlock(&amd_manager->bus.msg_lock);
 	amd_sdw_process_ping_status(response, amd_manager);
 }
@@ -560,11 +563,12 @@ static u32 amd_sdw_read_ping_status(struct sdw_bus *bus)
 	u32 slave_stat;
 
 	if (amd_sdw_send_cmd_get_resp(amd_manager, 0, 0, &response))
-		return 0;
+		return amd_manager->ping_slave_stat == U32_MAX ? 0 : amd_manager->ping_slave_stat;
 	/* slave status from ping response */
 	slave_stat = FIELD_GET(AMD_SDW_MCP_SLAVE_STAT_0_3, response);
 	slave_stat |= FIELD_GET(AMD_SDW_MCP_SLAVE_STAT_4_11, response) << 8;
 	dev_dbg(amd_manager->dev, "slave_stat:0x%x\n", slave_stat);
+	amd_manager->ping_slave_stat = slave_stat;
 	return slave_stat;
 }
 
@@ -1182,6 +1186,7 @@ static int amd_sdw_manager_probe(struct platform_device *pdev)
 		dev_err(dev, "mmio not found\n");
 		return -ENOMEM;
 	}
+	amd_manager->ping_slave_stat = U32_MAX;
 	amd_manager->instance = pdata->instance;
 	amd_manager->mmio = amd_manager->acp_mmio +
 			    (amd_manager->instance * SDW_MANAGER_REG_OFFSET);
@@ -1534,6 +1539,17 @@ static int __maybe_unused amd_resume_runtime(struct device *dev)
 			amd_sdw_oe_ctrl(amd_manager, true);
 		}
 		writel(0x00, amd_manager->acp_mmio + ACP_SW_WAKE_EN(amd_manager->instance));
+		/*
+		 * POWER_OFF_MODE tears the bus down completely; invalidate the
+		 * cached ping status before any failable step so that a
+		 * partially-failed resume leaves the first post-resume ping
+		 * timeout returning 0 rather than stale pre-suspend data.
+		 * CLK_STOP_MODE leaves peripherals attached, so the cache
+		 * remains valid there.
+		 */
+		mutex_lock(&amd_manager->bus.msg_lock);
+		amd_manager->ping_slave_stat = U32_MAX;
+		mutex_unlock(&amd_manager->bus.msg_lock);
 		if (amd_manager->acp_rev >= ACP70_PCI_REV_ID) {
 			ret = amd_sdw_host_wake_enable(amd_manager, false);
 			if (ret)
diff --git a/include/linux/soundwire/sdw_amd.h b/include/linux/soundwire/sdw_amd.h
index c8bd8e1a4771..bf97c790c669 100644
--- a/include/linux/soundwire/sdw_amd.h
+++ b/include/linux/soundwire/sdw_amd.h
@@ -82,6 +82,9 @@ struct sdw_amd_dai_runtime {
  *   only OE was disabled; in the latter case amd_resume_runtime() restores
  *   OE only, leaving keeper and schmen untouched.
  * @power_mode_mask: flag interprets amd SoundWire manager power mode
+ * @ping_slave_stat: cached slave status from the last ping
+ *		     transaction that returned a response;
+ *		     initialised to U32_MAX ("no valid reading yet")
  * @dai_runtime_array: dai runtime array
  */
 struct amd_sdw_manager {
@@ -111,6 +114,7 @@ struct amd_sdw_manager {
 	u32 wake_en_mask;
 	u32 power_mode_mask;
 	u32 acp_rev;
+	u32 ping_slave_stat;
 	bool clk_stopped;
 	bool pad_fully_torn_down;
 
-- 
2.53.0

