Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.62.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795453656;
	b=0jCWNreTMyuTE/eWL1p+G2fZWQnLdREiBtZdHdeb2LTvJ5jJccjwB5dN8L5rjotJPkd3
	 90wDDF074lZZln2KEoyTIstdslRW+vh2DERWCJXWg8USXtbTUR194T1nWzpTod9sWdKG+
	 Lrxyr+Ses6FI7SiSSsgfSoZLXDL1tUjaKUBT7LHXXM/QnBsS9gkTmMlwV94LBKiISP6O8
	 MLWVnj66Gg4nL+Fg1rpaQHRgv7c2sbtSW/hayA4y3HezQT1iood54d6n7OAgAVyyuvx8a
	 M6A2dRLQBlQEmC1QdnH2Ypxid5dIDMsyRBi9CavNM7OilmpblMG5TP0TIjZ6Ck0+m0w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795453656;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:Content-Type:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
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
	b=bcRgU2a5dBADY58h9XWLE89uzum8PFOb204UBjxS0D/2le836/jQGrtv6yQsR81StWoW
	 DyOIZdT3KmGtEqW6qLJ3N39WMs429Ji4UOzLYrAkXHmvxlQPYbJj/LWaB+GjTiGNQUiEG
	 ShTV7/+GxZOBsM8UdDCgnO3VSCdGjo/XO1qz4RLMxjaZXyAnjjNH7rLqHyYhbGeYINcxG
	 FmzuFnXNiUe0n8vvPXVCDfO5tY6p+CEqur9397XNl2ENUJKxDaAgf/TDq9irY8YO43snD
	 iTBE98sS1AVcroXud+ID0/dwOwC2CCl0kiTSqLNVt8QCr3hNQPg4vO66kabLCdmO62Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=rlwNnwPr;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.62.47
Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011047.outbound.protection.outlook.com [52.101.62.47])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C93D606A31A;
	Mon, 23 Nov 2026 17:07:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C93D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=rlwNnwPr
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S37VKSFbqg6euh+14oF7p5GzATCNJIP+ZriTxMkMa2Fkqx2H5oR4pAbXwoqH2hsPcfKs4hozJxF44wcMgTLfvC9510OMkVkjB7Gzys54r+6h/ofOlxbFG6UlVZ1nkRQ0OQx1mOjdGzYnRKqNJPnsu0xlpzp9w7h6WiIa+QEudLd5mAzCbeortWHoxm+KMkwm5Yo9rlIEiwCHGE13HDg1an7cgJbXx6AyuY3ZsIuO4uSr1UmNDEgvFtuor1zHiRpZbcUCfDJPMVABmRx8lZgYVlieNaaYgKjgMStBmoZFxqeuB19l7UZZeYD9k0uaEtwH8CiCIg+E5KzAxhIkuY4PwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=77wm3wnkUWktXFVf1ei6R9dOW+9AtXydlkd194hbuYE=;
 b=ipyTvdYj4hHhqttEwPvNXaolPUHJgOWy8tWXcDT9z303ccjtxRPEe2sRQBWtGVKeDN+fNy/hK9xzt7wn6D9mnrvXIg3Hr56wca6fqSsgJZRAyctM5agptXucxMcq0qyQeHUzHr6Z2ZzVHI5CYnlNG1CaQoTrQKO1H48D9bM81Qc9ZZjq8chLXOMeT5Qarvx+ZZF7nURCYPc9mtXjHNqltbHjCFDQOjeFhUZQ/tSa2fteHLgIu/esLTdfI8h21j26xk3iuND4km+/a/yIbwF/+Mpt/89zy/fcqEvjhOIL7/9yzb4nWkstFQUKqgvSscJcwwCIFRXQL6+8IF1jkssa9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=77wm3wnkUWktXFVf1ei6R9dOW+9AtXydlkd194hbuYE=;
 b=rlwNnwPrQdqJog1QIO8cIQuB4AV7GRPrvFoY7kjA8H8otD+qnauB+185oAEm77pSODHzAiLj4p4yVJuvKC/77LHbtfwD5uWZab3VAQ2rkwEpfk62bPLvQoHXikuqBukfmg1pHmC/0Y8jrQkOGoJvA7I+iuN+LA46B6vbFtoLu8Q=
Received: from BL1PR13CA0374.namprd13.prod.outlook.com (2603:10b6:208:2c0::19)
 by CY5PR12MB6252.namprd12.prod.outlook.com (2603:10b6:930:20::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Mon, 23 Nov
 2026 17:07:16 +0000
Received: from BN3PEPF00022BD4.namprd03.prod.outlook.com
 (2603:10b6:208:2c0:cafe::12) by BL1PR13CA0374.outlook.office365.com
 (2603:10b6:208:2c0::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.5 via Frontend Transport; Mon, 23
 Nov 2026 17:07:16 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF00022BD4.mail.protection.outlook.com (10.167.248.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Mon, 23 Nov 2026 17:07:16 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Mon, 23 Nov
 2026 11:07:09 -0600
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57
 via Frontend Transport; Mon, 23 Nov 2026 11:07:05 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>, <Poojitha.N@amd.com>,
	<lee@kernel.org>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH v8 10/24] soundwire: amd: cache ping slave status to avoid spurious disconnect on timeout
Date: Mon, 23 Nov 2026 22:27:31 +0530
Message-ID: <20261123170520.1380924-11-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261123170520.1380924-1-Vijendar.Mukunda@amd.com>
References: <20261123170520.1380924-1-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF00022BD4:EE_|CY5PR12MB6252:EE_
X-MS-Office365-Filtering-Correlation-Id: 40ff9f5f-3861-442a-562f-08df498439c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|23010399003|36860700016|18002099003|22082099003|261009223027099003|261022075727099003|261022113327099003|261022105027099003|261022115727099003|261026121527099003|261026140227099003|261026135527099003|261026130827099003|261028144727099003|261021123027099003|261021130227099003|261021121427099003|261021135927099003|261021133027099003|261102123227099003|56012099006|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	akJsnjf+bgrEeBt0icJW6i2AVT23v5eLeKP8uM8ynsqhQV+AzuC6IJLVdMJT3VeSyHOKfC5f95GuOxVdsj5e7i4NmuW+vnjDrNqV30+ybyyK6+GlzQxaSdGeF4rlDvirKAZOgE29sQyU+QKZ88dU7R5FyK3Pkg6DiNs5kAqWOjcn/z/VXn2hslIfBPUFYqnT9XiFT29C+L6NShTa5dAykVl2e0HBiQ1iyjqqQZ+vc919OayUclrgncsCdDMFp8Victqey8v5yTuSfLn6tgZ9dzQLxS3eXfiXMCO2lK9PSWQBvlt86A3FH0MzHeF65KlpTvjjG4lzcYD6gcGYJc9TlS1UWB/ovuj8iJBzVi2ylSBY1i89bliEt2p8MR240ARKFN2Ls3M8MG1PKnfbVqOK4JNRnM6mJuIcKiZf4JfERF+YNpsLFy0NiF/rWjjXFvaHxX4P5qYCeVVH8/8mSoo+b2rNoaQNMbaGrcvfoZlqne0eVaYrZqHM01qRKXIurMlkjwCFWlgzzRMa1E4FA8a/5xaeXPX9WZ1Ovhfn2raFJp/4JfzQm2BVe93DY1Yw5jF1n75u201RVC0yjfGuuHsu8poUhg31j9DWpQL1oTpngnFo4GKc3KfRo0hOP3b5s/DJYiTqg8YOn73MX076kzCVmV4Mm0Wpli9OvrxO+lTAtq0/ODnKF26c4yJVAjOOktpl+JzUo40KmlV2C3LsxDco2g==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(23010399003)(36860700016)(18002099003)(22082099003)(261009223027099003)(261022075727099003)(261022113327099003)(261022105027099003)(261022115727099003)(261026121527099003)(261026140227099003)(261026135527099003)(261026130827099003)(261028144727099003)(261021123027099003)(261021130227099003)(261021121427099003)(261021135927099003)(261021133027099003)(261102123227099003)(56012099006)(10067099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	o5gSWUvAbowOE0K55wy5AmIcmSPjtAoRxCr0Vu+HyO2dLV7y4nuOfO6Lcb8ZUBSBjjzJi9xwdo6rDNJ+tBXtQ6uVHhgi+puWwZklgweQo/0c/UZJRCVf3ROe4F8vxV3jzE/YXer2gIphMLixEH2AK7V7yBorBNVSt4PNi7r8s3Hgvqo6g6LFFxKwOkgYq02Ak+YJPf4EHdyyOSdzPJJjUrHWNzKYDvVyMl0WBSYfRPjdlkacE6FmEBi96BEF8gHvW5G2jvHe8UKFLS66lOXa/ddv1EWbjFmxX2SjNg2rkGCSiM5KRH24QVAbrMTUozlNR0oSNBcvyeRs9MvdysIje1QeiD/47RB9Ysf4B/b2yJrKsL6fJFl83jWwygyXIOX503012eLRPwDbhcJVYHol+GLwz+Kt/hIKuG/WJt1zWwNsV4UbyplJVmmcTzL/m5CG
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 17:07:16.3302
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 40ff9f5f-3861-442a-562f-08df498439c7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF00022BD4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6252

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

