Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.53.68
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795453714;
	b=5UOSiZ254zxuJLmnLKR/81DIhAWpRs5cLxq3z6BnK/z+OPvvlsjl9n/rzcFS6AOGa53Q
	 hjz3fOi5eEvZz1upA0gPFGwl2c3d2RxuZBnCAxvN2Dlctup3EwlSVjrwzjlr+TpqWZMjN
	 mczuxR3LQAvtq1vW4ge3W0Fg9oj4htLhfhuQqA2AC31/uLpvNKxrXgdXqV4D0RqoC5/qd
	 CJuU8cQ/JADBHnIm3mF6Z54WMNNlwr7pripj4k9ENJO4+CIJrIiglQKf9tLSRWx1TLlMs
	 IZp/Rf/F7pND1AwwjjsB80S2TWEJ7NzXroLBmIWQNgrzSmNmWxZMI/iHirNVfqcCXIA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795453714;
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
	bh=N/VmJr4FYven0oTRuPnwtNtbjDe8R1A9TbWDY0M2Gmo=;
	b=G7AGdZV+SNNIJjE6mv5oVrBie7I0kY4olPhB8ijX2PO1jRmdttCkpvT160CYPMaUnOfh
	 v2Bw3SBA2O3UR2NU0YE9UzpeGAaC8ONGm03ke0/VjU7Bw9BwqCACKGy3SlNv4w818t+CE
	 Z4V+NWd/OhhDiUsSefOzKXD/wD/I0iNXBEI97D+iojA2WsWwhfUgiHFARXyhccJsjML5I
	 t+tOiXEJTnSoXXZ86SyUoLQJK1c+hMoUesnBds0Ps1/g8xkCOBmeoAARsG+gzcRVxAaNC
	 OmGsjpGf4HR50J/HCvHu+cHAfhc8OuCwi4LgKSdRCTiO+OBcIeccBUfzgCvFN1uB/mQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=JKvAvHY+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.53.68
Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012068.outbound.protection.outlook.com [52.101.53.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC9FD606A321;
	Mon, 23 Nov 2026 17:08:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC9FD606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=JKvAvHY+
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vEOuhSuu+FoWlqpBOBZsGMBLzAx3rK0+bcGWaQv8yQI8oUb2X7kt8JEYeYYmPUZWObJpTuFUgLsx7x0eMPVVSg6YJl4OA5b1ONvY/xtksLXMkgxChC2aD0eO4BQ6tl0TGkPHBrQdCbqTnmHgtwY/Z3oJ0sa0nAgOCUZdAGXSitWXUvSJSifBllPuA4MhkbqpD7rRkX3hN5gsIYIo/OOlYi7T9PGZmpAJuAZhc6Q51NXjxO3slDUMVmz/iDB8X8qPN0EmxqXNQT0Lw/YDso0A4nGQjUyQD1CeqI1YDJhaqyVv2UXktbeZ9osYeaRSckiwTMsZ9YytvX8SEO+Qe5Nbag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N/VmJr4FYven0oTRuPnwtNtbjDe8R1A9TbWDY0M2Gmo=;
 b=Mv22ArkkaJqNcCwHAJS/KKIOwKKajIpViqMdwsLNUene1dBiK2bLrnB95SEE3+J8maTX4yhh+QPLsh51H5TxnAvpxdyhEfJOZbpCBXrVHhx1w29TYjajPuvpzF6oS9tEDOJVF6U52v2/phwpGVkyDYv3e5JEk/c/RGOn8FOUnwqD8OYaEt+Bg6ucaWnQjh5lUeY7YpZxwEx5Bhn6EWDvOiZex8UQYxMhII04mIP4OSUnf3vlVYDns7m8n1aTAR91UDcHV4U+mSQz5Pk/pkR4u1BxB7XTQn4nxZF80TvA0nXtoSMWAKowGmWvRuGe6Lnqloc2rj7yKz3eGIgPi/ds/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N/VmJr4FYven0oTRuPnwtNtbjDe8R1A9TbWDY0M2Gmo=;
 b=JKvAvHY+7FG5e3jXpaw5ZUuezxKPLnkrRj2YMUwjSL+gUCsVuWD+6Gq7vAqg7SpGq7WjNdFKwuDMCYWql1wuyCA38uxk+oxj48CYwagUEie7OZdNnLHA8s6xSyQFomiZSnq/rCRKRYe6JMrctIQ+WOxDFJP3gG2CyvTHHVZttc8=
Received: from DM6PR12CA0008.namprd12.prod.outlook.com (2603:10b6:5:1c0::32)
 by LY0PR12MB639115.namprd12.prod.outlook.com (2603:10b6:404:216::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Mon, 23 Nov
 2026 17:08:29 +0000
Received: from BL6PEPF0006C3DF.namprd02.prod.outlook.com
 (2603:10b6:5:1c0:cafe::6c) by DM6PR12CA0008.outlook.office365.com
 (2603:10b6:5:1c0::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.14 via Frontend Transport; Mon,
 23 Nov 2026 17:08:28 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF0006C3DF.mail.protection.outlook.com (10.167.249.234) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Mon, 23 Nov 2026 17:08:28 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Mon, 23 Nov
 2026 11:08:23 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Mon, 23 Nov
 2026 11:08:18 -0600
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57
 via Frontend Transport; Mon, 23 Nov 2026 11:08:14 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>, <Poojitha.N@amd.com>,
	<lee@kernel.org>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH v8 15/24] soundwire: amd: guard IRQ work with interrupt_enabled and clear STATUS
Date: Mon, 23 Nov 2026 22:27:36 +0530
Message-ID: <20261123170520.1380924-16-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0006C3DF:EE_|LY0PR12MB639115:EE_
X-MS-Office365-Filtering-Correlation-Id: 23ab1792-048c-4830-1068-08df498464c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|82310400026|1800799024|376014|261102123227099003|261026121527099003|261026140227099003|261028144727099003|261021123027099003|261021121427099003|261022075727099003|261022105027099003|11063799006|56012099006|10067099003|22082099003|18002099003|261009223027099003|6133799003|13003099007;
X-Microsoft-Antispam-Message-Info:
	hSIzzMCEcb75MCHGD3N+k3UK2OQa2GhxeoXZoyV4T1Rgr8OayDcGh0Sd5aM7qrHFgqztqCdIHSPSg8XjHHr/9v8VyT/olq8teIklNODpfhehnZdyKjPVAIMzOJRKPvaTM0GpiVOC4ZtqitbfNBA1vnxvOXKl8g+e6HifHahxk0MzrsbP5mr6MI5JVqMTnDESkNfakCjLxQcvvrVtxnEjhxMcukh3m6Db6yPWltRkcZxsRsTcHtG9msozLRBHwgFGYs1TgzNfBsZ610xrQo8E7PGpGyAj6gw/yH4tkFjCgBGzUpcGLiBjgP/gCzWB5X40rpx98lqn5B+5DxbaOj/FnO+e/NmXeuTBvsSQ1ChxDliYSS7am+R7SbdEex28YyiP0VrbdBI4ZdxRKl7sHeIeWlrCqQxpLWuZT9HC6zcJGK9+Az0VQZNe7h1L+5Eh5UZ2vQ0/AWsILrxpb5A1TyTmSr1OgHmUpsJkFV3IiQsEfG3Gr6UAYzlv1S6TUmzzgQOk8dmXVTuuDrdoccZGTSq7u0qkcyuO+ARmxUam0jInNXVi6qN3pBVVpfTPgXvncbja+mqwg7T5Tup+jc9GLTwiVrM1UlAXZbr18v60lf0Ml+pKR3JwAyZuqlDjMNYxjF7W7yicDOtG5K8/jReUy6fb5w==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(82310400026)(1800799024)(376014)(261102123227099003)(261026121527099003)(261026140227099003)(261028144727099003)(261021123027099003)(261021121427099003)(261022075727099003)(261022105027099003)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003)(261009223027099003)(6133799003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	4T8xfoKn+tedsxxjl9nDB3rci4BZMJOkf6+uivmCSHXihd/krg1T/zaPjKERd2LlKeGyluLCKf7ijBeNN8fe9NV5GHtctlA/+Hg8a0gGTgq1HgjaQsjwUipHWA/cKaGhZTRURFk8srh6m0L/8fQwONCikbTCyJar7bl/erwrtyBB5SWxDz8kPfDUW4zigkfGN4xoWASVbgIL7kTTnU+Q1uq6q6jooLJusll+R7L0uS8ehKRJPrhgfQHAltZcRE/qZ4+2GjolxOlslIkB/ww1qGgeb+w25lh5MIL0Q1VDgeJI7X0GlgxxZv8MQeaCOxkqpVCQBJugu5kcWHIS6cPTmR73A/hRAZQgORPAphwzLLWdloRu/01y9zxKCA5dTzcMAyn3E3+LNS7PwnOgBnW3nbikj27ESMdYstRcsFZQ4kDyjfdc12wwSWMDus6QGqnI
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 17:08:28.4395
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 23ab1792-048c-4830-1068-08df498464c2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0006C3DF.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LY0PR12MB639115

Add an interrupt_enabled boolean to struct amd_sdw_manager to prevent
already-queued work from executing during the window between starting to
disable interrupts and the hardware masks taking effect.

- Add interrupt_enabled to struct amd_sdw_manager.
- Clear ACP_SW_STATE_CHANGE_STATUS_8TO11 and _0TO7 at the start of
  amd_enable_sdw_interrupts(), before setting interrupt_enabled, so that
  stale pre-suspend STATUS bits do not trigger spurious processing on
  POWER_OFF_MODE resume. After amd_sdw_clock_stop() completes, hardware
  cannot assert new STATUS bits, so the clear loses no real events.
- Set interrupt_enabled to true in amd_enable_sdw_interrupts(), after
  clearing stale STATUS and before unmasking any hardware registers, so
  no IRQ can fire with the flag false.
- Clear interrupt_enabled to false at the start of
  amd_disable_sdw_interrupts(), before touching any hardware registers,
  so that queued work items that start executing after the flag is cleared
  will return early.
- Guard execution of amd_sdw_irq_thread() with an early-return flag check.
- Restore interrupt_enabled inside the ACP6.3-specific wake-re-enable
  block in amd_suspend_runtime() POWER_OFF_MODE, so that wake events are
  processed after hardware wake delivery is re-armed.
- Clear STATUS registers in the ACP6.3 POWER_OFF_MODE wake-re-enable
  block before restoring interrupt_enabled, so that a wake interrupt does
  not cause amd_sdw_irq_thread() to process pre-suspend state-change or
  PREQ bits while the manager is disabled.
- Use WRITE_ONCE() for all stores to interrupt_enabled and READ_ONCE()
  for the load in amd_sdw_irq_thread() to annotate the intended
  single-writer/single-reader cross-context access and prevent compiler
  caching under LKMM.

Reported-by: Lee Jones <lee@kernel.org>
Closes: https://sashiko.dev/#/bug/linux-ab458b2e-f505-4a41-8238-a93ceb5d9c77
Fixes: 65f93e4096a0 ("soundwire: amd: add SoundWire manager interrupt handling")
Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/amd_manager.c   | 38 +++++++++++++++++++++++++++++++
 include/linux/soundwire/sdw_amd.h |  4 ++++
 2 files changed, 42 insertions(+)

diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
index 93c96613b5d8..f2b5c855bbbb 100644
--- a/drivers/soundwire/amd_manager.c
+++ b/drivers/soundwire/amd_manager.c
@@ -119,6 +119,9 @@ static void amd_enable_sdw_interrupts(struct amd_sdw_manager *amd_manager)
 {
 	u32 val;
 
+	writel(0x00, amd_manager->mmio + ACP_SW_STATE_CHANGE_STATUS_8TO11);
+	writel(0x00, amd_manager->mmio + ACP_SW_STATE_CHANGE_STATUS_0TO7);
+	WRITE_ONCE(amd_manager->interrupt_enabled, true);
 	mutex_lock(amd_manager->acp_sdw_lock);
 	val = sdw_manager_reg_mask_array[amd_manager->instance];
 	amd_updatel(amd_manager->acp_mmio, ACP_EXTERNAL_INTR_CNTL(amd_manager->instance), val, val);
@@ -135,6 +138,26 @@ static void amd_disable_sdw_interrupts(struct amd_sdw_manager *amd_manager)
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
+	 *
+	 * ACP_EXTERNAL_INTR_CNTL is the top-level gate: clearing it here
+	 * stops interrupt delivery to the CPU. An in-flight
+	 * amd_sdw_update_slave_status_work() on the SDW_SLAVE_ATTACHED path
+	 * may re-write ACP_SW_STATE_CHANGE_STATUS_MASK_0TO7 and _MASK_8TO11
+	 * after this function returns, but that work never touches
+	 * ACP_EXTERNAL_INTR_CNTL, so the gate remains closed and no interrupt
+	 * can reach the CPU.
+	 */
+	WRITE_ONCE(amd_manager->interrupt_enabled, false);
+
 	mutex_lock(amd_manager->acp_sdw_lock);
 	irq_mask = sdw_manager_reg_mask_array[amd_manager->instance];
 	amd_updatel(amd_manager->acp_mmio, ACP_EXTERNAL_INTR_CNTL(amd_manager->instance),
@@ -1112,6 +1135,18 @@ static void amd_sdw_irq_thread(struct work_struct *work)
 	u32 status_change_8to11;
 	u32 status_change_0to7;
 
+	/*
+	 * Interrupts are being disabled (PM suspend or driver remove).
+	 * Stale ACP_SW_STATE_CHANGE_STATUS_0TO7 and _8TO11 bits are
+	 * expected to be cleared before interrupt delivery is re-enabled:
+	 * amd_enable_sdw_interrupts() clears them on POWER_OFF_MODE resume,
+	 * and the ACP6.3 POWER_OFF_MODE wake-re-enable block in
+	 * amd_suspend_runtime() clears them before restoring
+	 * interrupt_enabled for wake delivery.
+	 */
+	if (!READ_ONCE(amd_manager->interrupt_enabled))
+		return;
+
 	status_change_8to11 = readl(amd_manager->mmio + ACP_SW_STATE_CHANGE_STATUS_8TO11);
 	status_change_0to7 = readl(amd_manager->mmio + ACP_SW_STATE_CHANGE_STATUS_0TO7);
 	if (!status_change_0to7 && !status_change_8to11)
@@ -1482,6 +1517,9 @@ static int __maybe_unused amd_suspend_runtime(struct device *dev)
 				return ret;
 		} else if ((amd_manager->acp_rev == ACP63_PCI_REV_ID) &&
 			   amd_manager->wake_en_mask) {
+			writel(0x00, amd_manager->mmio + ACP_SW_STATE_CHANGE_STATUS_8TO11);
+			writel(0x00, amd_manager->mmio + ACP_SW_STATE_CHANGE_STATUS_0TO7);
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

