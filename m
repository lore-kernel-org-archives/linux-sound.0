Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.62.28
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795510371;
	b=On9fF4T6lzPU7OYCwKjYVPt1j/5cTwmrZCwNUPg7HFPUc7gk9rbzd6LIAlASWe04/tRx
	 RdII+jNYbA2NWQHcRtI59csl/NduvUotW95Fhzco5rZNQ2Ggb7fqHmPFaNWYN7/brsXIj
	 8CtPlRtWD5Ra6yIasLSgjWgxIHf658xFqKfFiDgWt3ybkx2c/4ypdzI5ukoHfejJOz6yd
	 aH8yBhLj4FH0AGueZB6emA53nXCDVok7Q3ASl7JOR1qqJBQJ6PkwqII3Tq3j5UQePHwYt
	 hbR68pn0OE3m9+Rg9P1GfqXW1M8cAopHpmkMK3mqmPb/SKjfjkRJXw43GzgGopEsxLw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795510371;
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
	b=UctqfaCU9Un3e3OQu5WplOU7wYk6iXyjUfodgrB1kcDtl7BwTkYx1rc4QoxJvn/MyCgr
	 0AR7VE0gwE9i6/3b8S6uFyMMfFbBhTmlfnZoLXVpQjYmco78H6Ru0/A0eqZSm9MPpRExk
	 VydAkW6FG9lhssbuId4D7As3lfu/MUFz0w0Eg3QFQHzHZhzRYQwVoA/jstu95GRz1aKyE
	 U2OTjTLIrpzAnjrZWJjHyhYDH0D3o6lrdCan1y3FBJJ34wVz0dHH2Bg1L1eJQ1aWIHYMj
	 gRWEsZilJSc46qcN9dF4/zIm6e5zVYlmTgovN8okhkyskXMx/CuM/1LoJmif8x7b2nA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=BqGPtJNY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.62.28
Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011028.outbound.protection.outlook.com [52.101.62.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7C26606A32E;
	Tue, 24 Nov 2026 08:52:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7C26606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=BqGPtJNY
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yx3vu3CdNHIzgoCoh+urR+xqYc+0CeektwfVZPB+IXxySojvLRJIiU/3WyJW6NLnjnslNBRo27L60sLezlcqrPeirop84azBA2p4cT05wPJHVKXUCdgPjrNUTODL7CKeg5OZ+DdtsZuuQOqekULw4d8PDTp4D5r5NOENm+NcXgwWd4H26FTnaIfYrKUtQaJJyY8ugN4E2IadHhEm1vR/kupjG4Zax2ZKJRkWPnxU05MKxRJsFaA248qMU8MzCyguuqY5caxLHqgYopfKHaFTJyqixVwb/FleBaFLW1Za2ZIfRO6oC4/5bHpidGACUUBbybFc+0/8yVM1/K0htdRZlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N/VmJr4FYven0oTRuPnwtNtbjDe8R1A9TbWDY0M2Gmo=;
 b=JZIxXWpu5c1/iuNBVr7K5g8q6kvjHLnyNwbIxspwBKCiNrGnHYKtg0AgWd4kd4PzXZZkJKof2Jzm7hvL+Ot0gtajC5pANZSi1lsunspHnBH9mE3ViEKr5xJ5cxXUkdytY2TEjr908ZFoUXntqT2Ramq3W14kHE9k6xNdUJRO5Xvri2+3KCJ4AcltsE3XNA9DM/ox1t38qfDoVh5GCDzx3WbCr6VHV4S8DpkX0Lb12444PrxodbJ7kW8g9hfq04cnSwdClTT0T0phd8VH6HuwE67lBLUNuliIxazIvU1Bi8DorvS7ZVRPytVDKCn6MBwdR9UkoqpdtWT82jTNvQfdBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N/VmJr4FYven0oTRuPnwtNtbjDe8R1A9TbWDY0M2Gmo=;
 b=BqGPtJNYCFm1Yv/3NIv1mxJuNG+D+Ylqb8JRFKjA5XpBxn9s8rIpJoOrh7mvinQhNFkZ9BfZasyrg0fzzLzt/+ZQEbTIPJhL2tiWEJNbu9ajnaBzsWE1c5aQEv52gBRRwsK6Ge8YtdOfy0dmGjqo1Xa9cOuTffePYu+UcyscjxY=
Received: from PH8PR07CA0046.namprd07.prod.outlook.com (2603:10b6:510:2cf::24)
 by BY5PR12MB4129.namprd12.prod.outlook.com (2603:10b6:a03:213::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Tue, 24 Nov
 2026 08:52:41 +0000
Received: from SJ5PEPF00000205.namprd05.prod.outlook.com
 (2603:10b6:510:2cf:cafe::93) by PH8PR07CA0046.outlook.office365.com
 (2603:10b6:510:2cf::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.6 via Frontend Transport; Tue, 24
 Nov 2026 08:52:40 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF00000205.mail.protection.outlook.com (10.167.244.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Tue, 24 Nov 2026 08:52:40 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 24 Nov
 2026 02:52:40 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 24 Nov
 2026 02:52:39 -0600
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.57
 via Frontend Transport; Tue, 24 Nov 2026 02:52:36 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>, <Poojitha.N@amd.com>,
	<lee@kernel.org>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH v9 15/24] soundwire: amd: guard IRQ work with interrupt_enabled and clear STATUS
Date: Tue, 24 Nov 2026 14:18:21 +0530
Message-ID: <20261124085033.682755-16-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000205:EE_|BY5PR12MB4129:EE_
X-MS-Office365-Filtering-Correlation-Id: aa91d250-4885-4a77-7438-08df4a084c3d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|82310400026|23010399003|376014|261022105027099003|261026140227099003|261022075727099003|261026121527099003|10067099003|261021123027099003|261021121427099003|261102123227099003|13003099007|261028144727099003|261009223027099003|6133799003|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	570rM4O30V4bNJNcBiamiQsZcyBzczMxgdBk2LN0q3ZkPVmfHzUrW9XTRdkQ5Y2EQRCYBSI0/JrPb4YidewGaewkb4U9Q8+9kFKKj/phENDBY9DXL1GJtw0P1S4VUPzPyPgtOihzTPmC02qwPtmhIXdJO+YLzTQ6oUE7d47u5WKHlgTwnR/4NayYlvGiuz9eozCtQYW9iRskvGg7WdUZJGnF0xysaSh89umuxUh5aFlupzWBYjL2rXiH/s0GpJ9XiSwNsOiNd04JKhmnMRk2hPzGZt9MXyMSqPu2oT+aGc0e/iVqceA7LowkNZxnS0C34xcbfYKi5rfwE5fm/9en4bal8JhuAID3yNTvDF/SOQ6/woRRzcNbZuUw+b/6BuHJazqaMbTBn6f3DOErlbHpWd3YglwQWwHs9urBw/2ZaoUaNDLr3kRSZokjjix8svNCwnPad880jHwudC7ch0bMJRSFXHcHk5zSAMbCeu/G9sspqXIGxcy7B+u5Z3AOcuqikt4WcIvVJJ1UAWAEQL35MulTkP/Stgk58NafJqHfjIW9n7V10+L0XQp6dr6uIzaTKtm9qKlPT2qlNTm5C5ZsKaVL9ZVPWFEsTyiLjiKtHpMRynOiK3YE8HLb/PbBpREf3sWUCX5dl4bvTjuSLk2D3Q==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(82310400026)(23010399003)(376014)(261022105027099003)(261026140227099003)(261022075727099003)(261026121527099003)(10067099003)(261021123027099003)(261021121427099003)(261102123227099003)(13003099007)(261028144727099003)(261009223027099003)(6133799003)(22082099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	OgVLBTsTLUnR4s21eLgQYndUwocaIkFK8VJVQ9VJCG8gI/S01t0KlF4d1SxoRgiqHk2RwXCqVMLmDiDguoonAECoNfXF375ieSC11JmRK9hWcsxmE8KAuPvyB/lKWcDMs7G8Nicls+X8gv5M0eHpPzBRMC6tCpN8tAEV4Ofz+Ffrsj488texYX8iuyvHD88KtTtqBdMMDUYsB02K8B5TRdzWR4dt4BHF3x22aU+crDYAA2ued8ApU/8TOgoRDK0e1f/WzjA712AUWN0J3vixknGCHo8RiEoxQBmlBRa6FM1a2AQPZZehcCchRaOUWXLoYOFCyrvoj9btkLX+1Gce6TxmAIQMbfHZzaN2iOBBEGKgCOUEkJ5DREX3SeespNCd0P9oypWXcgAQhwSIkzstDog4eYPkReRgFG1+oWDjHXkHeLRJhFdodyWnVNl9pgoV
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 08:52:40.7933
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aa91d250-4885-4a77-7438-08df4a084c3d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF00000205.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4129

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

