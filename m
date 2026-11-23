Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.43.57
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795453717;
	b=aHvKJJ6y2qPzZqGeHucZRdqZW1wF9GGyu5WKLNDIxPVhrxT+kFxMrllalGbMniLJrHto
	 Aqz/fD+HGBPvH/+k/PmeBou6rINyyILx9KF7S+68SxvOPmoZQjwEZH63cP0oUdDOK2Hqc
	 H2ZgV7zqA2Tkhyg5+8B7F9pWamw6UwUL2g7T1DcjTITemdcOrswR1C7ae3QiCt1Bv3kB1
	 jvva08wAbj8ES6KLITRDjrF/EQmveTrhLJAImvzYA/oQvR7TiYMkMUKvrqf0o2lC/EQrJ
	 hZpQCMkMkQYiNtZTQe8ft5ihb8gpot4CIuE9iLcGOoxZifrEFWXS42GyRLgauy/gRbw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795453717;
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
	bh=7Yh7g6+ls0YXloQW4lcXcbUh9g1Cu6xfmR8M8g3ZcQM=;
	b=uUq7tKuxRjXRzNH21VDsy8sNCzWqreeTU3GtRhU8yucVRnfc5zkEIP7/h5R8Vfz4ySEY
	 VkSe4S9BtDx5/Vvvj8CJpWrwxje9TXRdhXZ4Gn906wMSIiVJikFDfxQpv0w9yokZRNxKw
	 XkDjNFwAqm7O1np+F6o8F1BgR/PSbv5/pd20OkbAJaPxdwpUPODxrcLDbd/Kt4ByWlmuL
	 8rDgav181he9h4r2meUxs2bUDI2SQfSoUmhAkMWM6Y0lyFUKL3m7BmcWvDQAcxLRdBskz
	 NYLGvpHHcgfFPQ/BkX+5sefZ4TY+Sgk0dtBZllxKvSJ2oM0PpAXg7czSnXvuhccx6bw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=pie7xFnT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.43.57
Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012057.outbound.protection.outlook.com [52.101.43.57])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FC79606A327;
	Mon, 23 Nov 2026 17:08:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4FC79606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=pie7xFnT
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v+0rpakXSF/jYTq+sSkLrHNaitJyKOq4idPsJomMs32o3xmTIcrhydSn4WK2IJoiXlNiRM8/csxzPN5ZLELXLrl66BewE0NUWy896bUi7lvpNG3Q/+5e6nWc2TRhVRQ18MRQliDexZstTdTFS2+Qspv+32iAk2s9hPbhfdmMMYSgGBxH+4Km5ue6n0O2BeVqVdJcq+ZhKTSvUQqlrZ6WFO9FJz0uQwEFMn4suKBb9eTTeIUXrHM9W8KIFmrsj7QjNFXo7rjs54jxRhM2tlm+Fghzt5KM/48G5whKh3zOjC88BHM4oHE2XhtZQJOcx/3TcLGlYK2DZ/5NG1LdC/DB/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Yh7g6+ls0YXloQW4lcXcbUh9g1Cu6xfmR8M8g3ZcQM=;
 b=I6RKgGHX66nmVWp/TWQ14NrBA046P4QWEqysIFIjSGJPSakU0F9E7PBKqFqfgZuNhrQ9Tz1H/aH7QnNeqc3Qbfxb3mjMO8or4JuGZGBxIENRc4fQDB0Z34sXFhiE+RfGSFdXtS38CcwE7yez00P7evKaT0WmfJQdtaz50Bl63g70XiUxKPem8AvMiBmXXYXyBtxzaYZk5X2bp0s2XACGzCQeS8PqVi2QAfRz0sYZTL9ALAy7tTYLBq6YhhyO11FdG3ihdGILrd0zfmTxpOhF+EIz3Ws0KgFuBUondGIuIOzRK4EgC7KGenYJ6kD5ZQffcMy021e1mFwCzl5+cnF2SA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Yh7g6+ls0YXloQW4lcXcbUh9g1Cu6xfmR8M8g3ZcQM=;
 b=pie7xFnTjFDyjbKpKkcBLgiET682G6931f4f1tA9jPhUwWaJi/lbpR4wUafJd82BJXz/K57Cc6mwohRuVNL1WGhg5jHCwm9jPQ5xGB1goCh/XVGFjxSMtWreVk6d1Ghz2QTmEK4ZuFbsEgRamYJJb7mNaX2oZy6FdPAYSCgx1HU=
Received: from BLAPR03CA0168.namprd03.prod.outlook.com (2603:10b6:208:32f::6)
 by DS7PR12MB9044.namprd12.prod.outlook.com (2603:10b6:8:e3::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Mon, 23 Nov
 2026 17:07:11 +0000
Received: from BN3PEPF00022BD6.namprd03.prod.outlook.com
 (2603:10b6:208:32f:cafe::1e) by BLAPR03CA0168.outlook.office365.com
 (2603:10b6:208:32f::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.14 via Frontend Transport; Mon,
 23 Nov 2026 17:07:10 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF00022BD6.mail.protection.outlook.com (10.167.248.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Mon, 23 Nov 2026 17:07:10 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Mon, 23 Nov
 2026 11:07:02 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Mon, 23 Nov
 2026 11:06:44 -0600
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57
 via Frontend Transport; Mon, 23 Nov 2026 11:06:40 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>, <Poojitha.N@amd.com>,
	<lee@kernel.org>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH v8 04/24] soundwire: amd: track full pad teardown across suspend/resume
Date: Mon, 23 Nov 2026 22:27:25 +0530
Message-ID: <20261123170520.1380924-5-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF00022BD6:EE_|DS7PR12MB9044:EE_
X-MS-Office365-Filtering-Correlation-Id: 240641db-f099-4e3c-5d60-08df49843672
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700016|23010399003|261009223027099003|22082099003|18002099003|261021123027099003|261022075727099003|261022105027099003|261021121427099003|261026140227099003|261026121527099003|261028144727099003|56012099006|10067099003|261102123227099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	pxMribwoShWjRrP++MZfSK2YtlHJ9BJicSxfAoc+KZhAdGU+kjuREbBl9k7zWmyBG/0zw5EwpgK4eBnQzlNg6xw6xQ7zlTMTSJqPLGq5cVftGDndjS0XZNDVuqPoe4ZqjR4+8aH9tC0BRTv1WI5ciI1LV0fnxesk6y0DirczjytxJFj5DsvfS21C1WhvtR44l0oGSq7dCzHzPpAte487r6xs3ldJ5QwQfQmCRIgqlDCMFbtRdbdmvw8wdzp71SOnsQSZk8qKDNaOTuBOgv9v1Sjv5FDbhoGv5ssmYdXb6agKxzbJSmgJlJZL9uMUIW75vsRhZGfD7gXVDhELrKwu/ZQrK4ij6K6gxroL2xb8/DsiuakQlFMn0lJdYsyuslcu8J+eiCKf5F91gOXvpYaLgbUDWeckgbMT3TQ5tj3TWHWpW5y7isbozvkEjZOQdN2J5qeQpEnmKt9Ii+fX+ZIBrBd66MFLMJjkfuovALlXNp7c558tJgHtGaStU5CJT2Qdw66jQ+s3vLxpjP33GYbGMy9VGtlIC/Bsc8mhRLxbxNSifX8tNxPHU+KPtYTvf5JmsOLSZy3lOAl4SjxRR1JsFC5ZCpaIRMX4qW6TNEPrAMDo7stdFj4DNq+5zhBenVPLvo3S+aPyG8IuXjUNGI8JgD5ksqS9Bnl/K+p2gY6Z/d+NufowfRS8ujHoCcgzJf5H+x6FMuwb/xAtM5K+/nK1gA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(23010399003)(261009223027099003)(22082099003)(18002099003)(261021123027099003)(261022075727099003)(261022105027099003)(261021121427099003)(261026140227099003)(261026121527099003)(261028144727099003)(56012099006)(10067099003)(261102123227099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	+H/sOPRrVYBYnwfGkO1tSCIkffFnFSPH8KD2nWRKXDpxAcdfsC6CnDupZoyL5qbqR//5HZMolIjMlVzbV12nz4PGRzuFxxDt900oqhYkdHs6+XyqoEkbvFmcp9/ym1bsX5/VU26/gTitXU9jpGA31aZSKWeOpdmD3VPNfUL4+8fhXQ/FUhCet5tonk+UvB6ws0MmNiGSlGwqDo0Z92CZBApys3bKJlDPi/Ziw/Bn7BOelCyY4MTqVmCnS1jSAG/P7OMQUmstAw5V5fuZcU51Y2QjTeo+4Gak+V8ypI3uZVwWGGKgyTAw1MqjYg12LzRaJeqnn7FQ3/agYmYz+Hz6J/3OCJ/AQ1JViXb48EAL93opHinUuC4X91r08ld4PO3WzdAxGkW1LIZFFIYpdR5m1wjXF0FbdV/vNBPxXrBZFbWtTXB4Nq3X8P+ONE35RbIM
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 17:07:10.7443
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 240641db-f099-4e3c-5d60-08df49843672
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF00022BD6.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB9044

amd_sdw_pad_ctrl() performs a full pad teardown (keeper, pulldown, schmen
and OE) for system suspend, while amd_sdw_oe_ctrl() disables only OE for
POWER_OFF_MODE runtime suspend. amd_resume_runtime() must distinguish
between these two cases to restore pads correctly: a full teardown requires
amd_sdw_pad_ctrl(true) on resume; a POWER_OFF_MODE runtime suspend in
which only OE was disabled requires only amd_sdw_oe_ctrl(true).

Introduce pad_fully_torn_down flag to track when a full pad teardown was
performed. Set the flag after amd_sdw_pad_ctrl(false) in amd_suspend()
using amd_sdw_pad_ctrl_supported() to gate the assignment to revisions
that support pad control. Clear it after the full restore in
amd_resume_runtime(). On resume, restore all pads if the flag is set,
otherwise restore OE only; both paths delegate revision gating to the
respective helpers.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/amd_manager.c   | 12 ++++++++++--
 include/linux/soundwire/sdw_amd.h |  7 +++++++
 2 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
index b21691652490..28f5dbe131dc 100644
--- a/drivers/soundwire/amd_manager.c
+++ b/drivers/soundwire/amd_manager.c
@@ -1418,7 +1418,10 @@ static int __maybe_unused amd_suspend(struct device *dev)
 		if (ret)
 			return ret;
 		/* System suspend: tear down all pads */
-		amd_sdw_pad_ctrl(amd_manager, false);
+		if (amd_sdw_pad_ctrl_supported(amd_manager)) {
+			amd_sdw_pad_ctrl(amd_manager, false);
+			amd_manager->pad_fully_torn_down = true;
+		}
 	}
 	if (amd_manager->acp_rev >= ACP70_PCI_REV_ID) {
 		ret = amd_sdw_set_device_state(amd_manager, AMD_SDW_DEVICE_STATE_D3);
@@ -1510,7 +1513,12 @@ static int __maybe_unused amd_resume_runtime(struct device *dev)
 				return ret;
 		}
 	} else if (amd_manager->power_mode_mask & AMD_SDW_POWER_OFF_MODE) {
-		amd_sdw_pad_ctrl(amd_manager, true);
+		if (amd_manager->pad_fully_torn_down) {
+			amd_sdw_pad_ctrl(amd_manager, true);
+			amd_manager->pad_fully_torn_down = false;
+		} else {
+			amd_sdw_oe_ctrl(amd_manager, true);
+		}
 		writel(0x00, amd_manager->acp_mmio + ACP_SW_WAKE_EN(amd_manager->instance));
 		if (amd_manager->acp_rev >= ACP70_PCI_REV_ID) {
 			ret = amd_sdw_host_wake_enable(amd_manager, false);
diff --git a/include/linux/soundwire/sdw_amd.h b/include/linux/soundwire/sdw_amd.h
index 470360a2723c..c8bd8e1a4771 100644
--- a/include/linux/soundwire/sdw_amd.h
+++ b/include/linux/soundwire/sdw_amd.h
@@ -75,6 +75,12 @@ struct sdw_amd_dai_runtime {
  * @wake_en_mask: wake enable mask per SoundWire manager
  * @acp_rev: acp pci device revision id
  * @clk_stopped: flag set to true when clock is stopped
+ * @pad_fully_torn_down: true when system suspend performed a full pad
+ *   teardown (keeper, schmen and OE cleared, pulldown asserted). Cleared after
+ *   all pads are restored in amd_resume_runtime(). False on initial probe
+ *   (zero-initialized) and after a POWER_OFF_MODE runtime suspend in which
+ *   only OE was disabled; in the latter case amd_resume_runtime() restores
+ *   OE only, leaving keeper and schmen untouched.
  * @power_mode_mask: flag interprets amd SoundWire manager power mode
  * @dai_runtime_array: dai runtime array
  */
@@ -106,6 +112,7 @@ struct amd_sdw_manager {
 	u32 power_mode_mask;
 	u32 acp_rev;
 	bool clk_stopped;
+	bool pad_fully_torn_down;
 
 	struct sdw_amd_dai_runtime **dai_runtime_array;
 };
-- 
2.53.0

