Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.85.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794998771;
	b=B8yKRpl1yXS5GdEsQeVM3FyNED5xlkFz68qOnY63esuMPE3aDiy7aGRxgRTUGr6JXBDt
	 SVAvb3lLdQcmA4ZSrDSxZllrMTnGpCS55Vwamk9pTFS1zNlw8oOGVdO8gJnySfyg2ZcbD
	 x5zzi5ovCRQqRxA4ilI1bQ9dO6P5C38VjWQl+idCXLoNRA3WJnxnpYboFYjgsLkBRtwJT
	 s4IKRSVWnJg8OoM92UXMTDAo+HH0TUZa4BkNtp7cVYLUw+oaDNcyjuI9pFM6DfFZLRYzZ
	 CTltYEj5J19KjO82iRTZN1pxXj3kEbgbTUoYMUxxG1nC4IwQJNGLY9TjAs3UjaREUDQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794998771;
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
	b=Tb4HlX83wUCqHtlgAUm8PZBlpjn/4l7GLAsL0MRwfujkVMjqolXRhgIKYLHtvlfl90jP
	 dttWNiAZy0JXuOpLvk9VPt9UNZqglwCDg3OSLUR/yAmvpUvTYFdoALoIf6J9uUqtXhO3B
	 PBrlr+DzXjZhG/zsubkxXFVC/G3/SndRrTq3+xM0frcMqqMislAj4dAQ/gEx9pl0bA7W7
	 qzTbDYafHMG4Ui0atBgUc9FizIPEkAvQotVOza7z1fyEOlj/akN9yGjCQTOMa0S8eHE2F
	 5pz6QoDrSXVsiOaKHzV8i2RxcdwSv22TLlW6EgQvbbhtaNdLJj2kFojqXvJLkuimBqA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=UuxeWVyp;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.85.11
Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010011.outbound.protection.outlook.com [52.101.85.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47E16606A32A;
	Wed, 18 Nov 2026 10:46:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47E16606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=UuxeWVyp
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FBgfDwCR6NpVfDfiog0DKwjKiNftzZ21ikVVF6oOLGunCIGPc4cTHrT06mBTghFxtcqDAGgulAvsvganUeTp+/RIrAgSV4Kh91DExe6uRiSOgPhV0CHbdwfzSP17OAYevBCoXDfz+kQ5crR/Z2660WxZYtvtlHS8I9AhhlxFBKr5QWF22x1HjsOpvebs4qe700/z6WklWxqypwdbjkXekI9oJUiCOuBmozLmzXsHeX2yeQuwS2Pk29h7eeayv0I3vaw9yAmamYThmVoT5l/Pkt2PWe/J3m8BaW8Ug0DmBhdEG+W51wYVH/qtQdHfB26PLfMGT54XQtVevvPuCxAxDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=77wm3wnkUWktXFVf1ei6R9dOW+9AtXydlkd194hbuYE=;
 b=VETGlIU0us6DyIqU5fjPVXnQmY1J2EpzlAZ/7cN5ZhQGhEkayqECTraNyTi+jPO1aMMBK9Mq2m/YwVAVlc/BwfdUQaSwVdK3+4M/FHv6WO4OJAwA/wz6SaS7XeNjyweThn/Kveowcmw8MlbNHmyDt6m6B7ii5UU/jkvUc3QGn5SuZts4uli9guyaw2uZls52oOAY2VfdagA50WO873o/+5xl6MiXvBSfguhcFpxWLhrsBTH2ENdcq5+Ak31yhACc+rZcIn3SpCdZtjJZQ9k2gpvO8RUGp/xjp/ttkWK2ADkBORKDFJOYGSu18xau50qRoU607jWea56zmT3SfVwFLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=77wm3wnkUWktXFVf1ei6R9dOW+9AtXydlkd194hbuYE=;
 b=UuxeWVypVCyBo/SODNEbEhlNdahND0/8VBoYofQzmQ1Xfh1nrlqwdwe8QvO/enG6NTEuUBUpUPfjtcN3xNJOq2lw9sLzDkIt6xyRW8g7PHVPcSrS/+gIEJraZZfKlnGJ+0jdvgLhnY6w44eGrDZTdvU0FoW/RY+Fh0g1QyMddk4=
Received: from PH8PR05CA0023.namprd05.prod.outlook.com (2603:10b6:510:2cc::8)
 by DM3PR12MB9434.namprd12.prod.outlook.com (2603:10b6:0:4b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 10:46:07 +0000
Received: from PH7PEPF0000000B.namprd04.prod.outlook.com
 (2603:10b6:510:2cc:cafe::4a) by PH8PR05CA0023.outlook.office365.com
 (2603:10b6:510:2cc::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.8 via Frontend Transport; Wed, 18
 Nov 2026 10:46:07 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 PH7PEPF0000000B.mail.protection.outlook.com (10.167.243.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 18 Nov 2026 10:46:07 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 18 Nov
 2026 04:45:56 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 18 Nov
 2026 04:45:56 -0600
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.57
 via Frontend Transport; Wed, 18 Nov 2026 04:45:52 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>, <Poojitha.N@amd.com>,
	<lee@kernel.org>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH v7 10/23] soundwire: amd: cache ping slave status to avoid spurious disconnect on timeout
Date: Wed, 18 Nov 2026 16:12:29 +0530
Message-ID: <20261118104353.331556-11-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261118104353.331556-1-Vijendar.Mukunda@amd.com>
References: <20261118104353.331556-1-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: PH7PEPF0000000B:EE_|DM3PR12MB9434:EE_
X-MS-Office365-Filtering-Correlation-Id: df367c00-2378-4528-ec41-08df456126aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|82310400026|23010399003|376014|18002099003|22082099003|261009223027099003|11063799006|261026135527099003|56012099006|261026121527099003|261102123227099003|261028144727099003|261026140227099003|261022115727099003|261021133027099003|261021121427099003|261022105027099003|261026130827099003|261021130227099003|261022075727099003|261021135927099003|261021123027099003|261022113327099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	/hmAjzwH8h0ZViVlNNCpJNjW0TgsqwSjrrFb8uxdLAq3CrJKhxKuMpKGF39Erz4FHa4Tv1qGAWMNYnBTg31eldSGHASIFHF6cIwvMqOwW/PhLVQvprk6PqFKnswFxafK4cM4yxp1XlvsuJ1lh1SIw6trOTSLKyBzRF64LMSWXH6HkLOyP9BnYla5EnVJVAol0KPUTWkgIbsVLnSG5A0ay913MadYCkuhsZkGtVQ128mM0oYkCNZQtV33VGfan8/Fzyuv4YKIyIau3NDqxmwgpFjhhFWaize3YSQpbJM/iLKhOyegRrGt8yY7pHGkbhNCMTyJURXOFEIqc3K+LL3bTO48RSEG72v3u53yRZ5GZ+jK2PN/KlA3L8MrFGvT973sbIbePBcqjjJ4e8wiyAbkPc9q+6lM94AW42cWYeag0bWdWNwZadt28ntImQ0pTYP1k5+a0Jetqnh1RGDjNCF1f/pr1xZ6HKQep0/89OOR8L+TMGkYDNAjITnwkLIl66V6f95N2AdTHI/US0YoXGKk1qeT2MHM1yC9vSFy0BJOaJlKuZfQnvMuLgzOgDImIdmqzoRaYkhNJFSbjhm/Lm+NDAu718aAGjmtcjJkbEZ8Jq+wvSIYub3xeH77DjbKTGThgVSsCM1uCZ00j5HHbY8BNiJ3RB+zGE8/O71oPAuZsS1n/Z/2YcIIgOuBaX69uBQ/iILN6dNNFJwQ2EYPAJ61eQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(23010399003)(376014)(18002099003)(22082099003)(261009223027099003)(11063799006)(261026135527099003)(56012099006)(261026121527099003)(261102123227099003)(261028144727099003)(261026140227099003)(261022115727099003)(261021133027099003)(261021121427099003)(261022105027099003)(261026130827099003)(261021130227099003)(261022075727099003)(261021135927099003)(261021123027099003)(261022113327099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	9t3N072+p/XcdMjd7Zq8SrZmEbORHGnJA+Y73fA7lSClOh9kQ9nKr2thvmpemh4MLc3AIvrNzZ3aiKMNzGMp5Pw3EkgrP53pp3H7VMii/35crGue6M+u/xbSlnCexHnnXBxp0AYQIeLOXzXv+MAMc5Nw+B/WNCKH77eEEwkL33V4g1mWNTyBdrkhHW5Qcg46KJgIQKwPriFXMyH44nSY4NEtXhEu4XmJEWkumxipb2Kj/bxGpsrtDTUDRGA/Hj5UVkBb2s/Qik8LxAX8ea8G8Pb51pnUoIkfDUAVt7D+VIBF1p+Tq6Ac9IgQOk0vFrhe+zt4pi1nJJCcjFD2R0O93RD0vh3GD7NKKJOg8PzFUSVXT8txLuYiNrwZ42nvhiBfKz7ecf7ZzxpeyxEOSfNoOn8CtW+BLMaZcPVax3WYnzt8LMLj9zpB4jXcpAyFFJh5
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 10:46:07.1558
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: df367c00-2378-4528-ec41-08df456126aa
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	PH7PEPF0000000B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9434

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

