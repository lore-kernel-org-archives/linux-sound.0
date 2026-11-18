Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.195.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794998789;
	b=r1B6N3BoTxI0zulLu0Z/wUpAt2ySK08MWEYPyogexyjbfIgXYGgq9lBgFfdogR8JABWx
	 lw7ZvoGrqRe54YwVHRGjYAP0uF48GGdMtwJp6T9yeA8MOlRWuZ2U17sWs28yg7Fo35X/t
	 qz71RlWFZ48nva5DeHmf0cQqeVr97OwpD8Y9k/9igWlz3BFMsHrvwFdX9QF8lmix0HJO7
	 VMc68mh8YToxSyXO4/sr8YwYhoxGgRhsUjHvkQTT3b2yT6sD7kMOH821Wcffnioz8afL1
	 7rtU7Ekt7qmwItUxwu9Me/Qb7N+NaVfaLf2sWn7TFDt7Tpb/I9gEgE/aQ23onDoZr7w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794998789;
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
	bh=M664JNpn091wVoCawh2yBjnL1zlaHNI0KK+9Io34pEs=;
	b=OsTGRoNQ7Dbi2AqZA+8be9kK8xUhRgW6qzLO88UYrzJu2IoOm/wCJ8gQGDBkBqW5bQpj
	 y4K0bh37iOirYc5EEja9Ki8hEPM4tIVWlkc3GwmKuF2+4h4aZ30UKvv0IFFv9iWTvvzB2
	 63RxiQObGH9zCI25kwS5/kt1VZ3SkBqAADjNcJ/xdeuZ0fnA9Y5vCtknUm4IgpyAspMia
	 lMLtHvoR7AIfU78LKFdpdL9N7rgysDRlFhfpaE57r3sLxFmqfTPQ2r55neoqSD550kpSv
	 4DVTtndbAJV694r58zN3L9yGPKmKa7KRaGMkOhZJu8UOfgSkHArw1eUKMRluIOKiqZA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=e2GEZwkb;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.195.51
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012051.outbound.protection.outlook.com [40.93.195.51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F52D606A337;
	Wed, 18 Nov 2026 10:46:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F52D606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=e2GEZwkb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BuA6Vv+19Do5m5Sf58t4b/c4BTFedlUapKvHcj98IsF5OXcOf2Sq2ySoYeqG6APHeidATgRnf6dUF0ZtY7hoohrbcqE1fEfSs//yDc5a5EosqLO3uZ59Nf+Zphlmv1HXLcR/CKg4AwMXdzSheFZ1Wqeo/urHRXvV/4ffJ8PCUOcYWRiC3XiWnI/bGYqBXRRO+EbBqOzvAkPH7kzAJKw8Dl9Q8IMsaspS7fd1f/yC/5Gxn4dOAzsQWrFPyHY0JszWeBlqIeL6m5OaPfioesJiIqPVr0upDK6gyqoBf7VH55DzecviG+Aos8WqvrrgeuZ1XEJKAhFZtoVDb/TtwPTImw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M664JNpn091wVoCawh2yBjnL1zlaHNI0KK+9Io34pEs=;
 b=oF2OyoMXiGreGMiS06q3fSRzdnK4hVwQwQKDg6+gMKFivaheqbsfarp4k65yivYXUCVmsTJLE/4ew60hhQJ9gHWxFvl/s1mO2Al2RYTKe0G+poNB5qLzQLhhCnLkBDpAjI/rzV6wsJPfH6AyIGVfabTv66h6eYcZx5G2m7u9k6XcNQU0zIoI2zzSHGVDtXLNy9AZZhgFNjNclYydLbrDcNIN34LrcjeambjLzEpoXpS2dS+7fI4lgoaT0vM8GgAo0zHAMDy2p+Hd/du6C6BbTT2hNYnyNxz8vzlBFHSXKueTiRU6GRLFQd6ZoIghmAJdQMfVapyMYseoda36C0icxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M664JNpn091wVoCawh2yBjnL1zlaHNI0KK+9Io34pEs=;
 b=e2GEZwkbiBc9++f6MPCB8geFCu7+aBv5EjwWbiM/DwDeuViIBlYxUnZOWKB5KCHOrHtmi7JQpF+d/+cqWfroC+Kd45jsxtr+mVDJohN+ab9InL1He4Dpi6BuuLX/TlEvpoWGa3mYuSRMmjWo7mOkYr0/3t9Uyyief4FTcRmfgH8=
Received: from SJ0PR05CA0203.namprd05.prod.outlook.com (2603:10b6:a03:330::28)
 by LV3PR12MB9260.namprd12.prod.outlook.com (2603:10b6:408:1b4::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Wed, 18 Nov
 2026 10:46:23 +0000
Received: from PH7PEPF00000009.namprd04.prod.outlook.com
 (2603:10b6:a03:330:cafe::50) by SJ0PR05CA0203.outlook.office365.com
 (2603:10b6:a03:330::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Wed, 18
 Nov 2026 10:46:23 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 PH7PEPF00000009.mail.protection.outlook.com (10.167.243.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 18 Nov 2026 10:46:23 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 18 Nov
 2026 04:46:16 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 18 Nov
 2026 04:46:16 -0600
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.57
 via Frontend Transport; Wed, 18 Nov 2026 04:46:12 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>, <Poojitha.N@amd.com>,
	<lee@kernel.org>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH v7 15/23] soundwire: amd: use interrupt_enabled flag to guard IRQ work scheduling
Date: Wed, 18 Nov 2026 16:12:34 +0530
Message-ID: <20261118104353.331556-16-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: PH7PEPF00000009:EE_|LV3PR12MB9260:EE_
X-MS-Office365-Filtering-Correlation-Id: 42989ef4-e5d5-4a21-a60a-08df45613021
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|1800799024|36860700016|376014|22082099003|18002099003|13003099007|11063799006|56012099006|261022075727099003|261026140227099003|261028144727099003|10067099003|261021123027099003|261102123227099003|261021121427099003|261009223027099003|261026121527099003|261022105027099003;
X-Microsoft-Antispam-Message-Info:
	uBIP9avOKbb1Igr46FnSgR8lM9kkv3q8c0vHIVJQpm80EYTJ6V0MxGVDphNegrsPknNTIrlt/eCSMKcvt+qqELswJNAaC/crqTw5u19XNNkVKgXuTcOGXN0fYBAdh9kN9LiDT/22nMhfRewmM6FKa5NPlk0Te+FykSnTgRUcZsA60ifFzNeCVMGkjiWWCKn18+dr0Ub+yUNfqNMM8rdKfr8kkzBjbIjbDWkgMmuhxritvTMY1lrZBHJSGCFeeyjWWpECN6jYchlsBYS8X8K78hZzRUcjMfDJ4r5HN+NE6WI/JW8yXzhc9XtxmDlb7Bw0hkMM7Ug0rpPqc1jH8USbFXX8XeQUQng0UiARnXZoRY1rHN7YBZhfP6JBRhYUOmTl+mPc+fVmyDPt9YWY0b6aBTa0hzYuLJDBlk+G1ficHQaBNFhk0rR6BDwDUU7QKPXQwXEAY4gFIkO+H+CZNEHY4FA1A7u+uCterX1gcG17KznCgT9WgMXYwiJG2KtIpuQ7H33ELE/7fQFped7PmvtXJLRA+BXbjpGSDYCEb0MMMK3L2unIJkawbEaqmf/QVBIWMTJ77yCXpeHKVh/ttaG1kiJ2KdwxJIsvItbEr2HeTL/AQ1Yg1zQYMGIiM00D6b9GcBMdZh8Z+HMESzkTNPGjwQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(1800799024)(36860700016)(376014)(22082099003)(18002099003)(13003099007)(11063799006)(56012099006)(261022075727099003)(261026140227099003)(261028144727099003)(10067099003)(261021123027099003)(261102123227099003)(261021121427099003)(261009223027099003)(261026121527099003)(261022105027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	hatgJOimuiUKn1VdQpqXurQ3KP+ZvmkchQfFomfYAa0Cw+fUizkds71Ntf1L0WzV7xEKAnUsDz/eL2PvL1OdI0ni1MkU2LJn30AwJKzd1qRIOgI76o4KXsGNqbAbdUsdZN1FU5K1ggLZRYn7T3anOP7QHRKJpJSzBky525jpcWP+LhPWjwyGSh/RyNrmwxT4G0fxOKuaCCL5RPV0QFAmfAV5WJv6AtR/0rITCg4e2yH2aZ/+L24bG31aAVUgDIm0LeklmWYy5LIYyKil/dE68deZcDs9AAb9NRyhDptmvoAshTigzAor7syTBAxtSDVI8wYHyN11Sdd3pIoi8WPq8QXS7R7F99fZk6GUiexBU7g5sNBcIEvX/YURdBqAX23XSrZ7f5BbxCzOF2fzcVFr9jldZeYJjcarWtt23o0oSeaPSgIynEoqxL41OG1eDFuE
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 10:46:23.0364
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 42989ef4-e5d5-4a21-a60a-08df45613021
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	PH7PEPF00000009.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9260

Add an interrupt_enabled boolean to struct amd_sdw_manager to prevent
already-queued work from executing during the window between starting to
disable interrupts and the hardware masks taking effect.

- Add interrupt_enabled to struct amd_sdw_manager.
- Set it to true at the start of amd_enable_sdw_interrupts(), before
  unmasking any hardware registers, so no IRQ can fire with the flag false.
- Clear it to false at the start of amd_disable_sdw_interrupts(), before
  touching any hardware registers, so that queued work items that start
  executing after the flag is cleared will return early.
- Guard execution of amd_sdw_irq_thread() with an early-return flag check.
- Restore interrupt_enabled inside the ACP6.3-specific wake-re-enable
  block in amd_suspend_runtime() POWER_OFF_MODE, so that wake events are
  processed after hardware wake delivery is re-armed.
- Use WRITE_ONCE() for all stores to interrupt_enabled and READ_ONCE()
  for the load in amd_sdw_irq_thread() to annotate the intended
  single-writer/single-reader cross-context access and prevent compiler
  caching under LKMM.

Reported-by: Lee Jones <lee@kernel.org>
Closes: https://sashiko.dev/#/bug/linux-ab458b2e-f505-4a41-8238-a93ceb5d9c77
Fixes: 65f93e4096a0 ("soundwire: amd: add SoundWire manager interrupt handling")
Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/amd_manager.c   | 17 +++++++++++++++++
 include/linux/soundwire/sdw_amd.h |  4 ++++
 2 files changed, 21 insertions(+)

diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
index 93c96613b5d8..1a3d3af4e0a4 100644
--- a/drivers/soundwire/amd_manager.c
+++ b/drivers/soundwire/amd_manager.c
@@ -119,6 +119,7 @@ static void amd_enable_sdw_interrupts(struct amd_sdw_manager *amd_manager)
 {
 	u32 val;
 
+	WRITE_ONCE(amd_manager->interrupt_enabled, true);
 	mutex_lock(amd_manager->acp_sdw_lock);
 	val = sdw_manager_reg_mask_array[amd_manager->instance];
 	amd_updatel(amd_manager->acp_mmio, ACP_EXTERNAL_INTR_CNTL(amd_manager->instance), val, val);
@@ -135,6 +136,18 @@ static void amd_disable_sdw_interrupts(struct amd_sdw_manager *amd_manager)
 {
 	u32 irq_mask;
 
+	/*
+	 * Clear the flag before updating hardware masks. Work items already
+	 * queued but not yet started will see the flag false at entry and
+	 * return early; work items already running will complete their current
+	 * invocation. Callers that need to ensure no instance of
+	 * amd_sdw_irq_thread() is executing on return must follow this call
+	 * with cancel_work_sync(&amd_manager->amd_sdw_irq_thread). Once the
+	 * mask registers are written, the ACP hardware will not assert any new
+	 * SDW interrupt.
+	 */
+	WRITE_ONCE(amd_manager->interrupt_enabled, false);
+
 	mutex_lock(amd_manager->acp_sdw_lock);
 	irq_mask = sdw_manager_reg_mask_array[amd_manager->instance];
 	amd_updatel(amd_manager->acp_mmio, ACP_EXTERNAL_INTR_CNTL(amd_manager->instance),
@@ -1112,6 +1125,9 @@ static void amd_sdw_irq_thread(struct work_struct *work)
 	u32 status_change_8to11;
 	u32 status_change_0to7;
 
+	if (!READ_ONCE(amd_manager->interrupt_enabled))
+		return;
+
 	status_change_8to11 = readl(amd_manager->mmio + ACP_SW_STATE_CHANGE_STATUS_8TO11);
 	status_change_0to7 = readl(amd_manager->mmio + ACP_SW_STATE_CHANGE_STATUS_0TO7);
 	if (!status_change_0to7 && !status_change_8to11)
@@ -1482,6 +1498,7 @@ static int __maybe_unused amd_suspend_runtime(struct device *dev)
 				return ret;
 		} else if ((amd_manager->acp_rev == ACP63_PCI_REV_ID) &&
 			   amd_manager->wake_en_mask) {
+			WRITE_ONCE(amd_manager->interrupt_enabled, true);
 			mutex_lock(amd_manager->acp_sdw_lock);
 			val = sdw_manager_reg_mask_array[amd_manager->instance];
 			amd_updatel(amd_manager->acp_mmio,
diff --git a/include/linux/soundwire/sdw_amd.h b/include/linux/soundwire/sdw_amd.h
index bf97c790c669..2213eea4afe1 100644
--- a/include/linux/soundwire/sdw_amd.h
+++ b/include/linux/soundwire/sdw_amd.h
@@ -85,6 +85,9 @@ struct sdw_amd_dai_runtime {
  * @ping_slave_stat: cached slave status from the last ping
  *		     transaction that returned a response;
  *		     initialised to U32_MAX ("no valid reading yet")
+ * @interrupt_enabled: set when hardware interrupts are enabled; cleared
+ *		     before disabling to prevent queued work from executing
+ *		     interrupt events during teardown
  * @dai_runtime_array: dai runtime array
  */
 struct amd_sdw_manager {
@@ -117,6 +120,7 @@ struct amd_sdw_manager {
 	u32 ping_slave_stat;
 	bool clk_stopped;
 	bool pad_fully_torn_down;
+	bool interrupt_enabled;
 
 	struct sdw_amd_dai_runtime **dai_runtime_array;
 };
-- 
2.53.0

