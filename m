Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.62
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794998801;
	b=4JopaJfntpox2ppp8p1trB7LbO+CNY9jXbM2wRYhcKpov7OI+/9IzMnfpomkQs8EaDCX
	 DNg1JjZw8SW0j1XIc5/t8hrB+UZtZipZdcfIZGsbGU6aCmya8vbQUH/MLCLEqHK6MrkJR
	 QrhlU7laqzQ00bj7DEhZwlsizzuS51ERriaH43lU/4+Mg0chd89sG/Nq65/xRq0F5eyAf
	 oJx/4bDUnIQfGgVcws1a0aKLruW7vX2d8wJeIRPlH8VbNIrDGNLRi9r5bfbJwW4QnwPfu
	 Gegow1lXRdM//QfBmCXxi8HZvlBQ8kds6opmCJ1fG3V9oEgsRtzSNw1CsCebCRXBa8g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794998801;
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
	bh=l2MmDXV7Z2vE6SfFhPh4eA0c8JrFZlWe5BVvfhPO9c8=;
	b=mJ1cmkwqnJIUSRBdYqVRyc6jtOFGR0FRX9dGaWTXeuAKwu+tqva3nwE+ufXLUNXgOz+3
	 qsS2RpZviV1lDUgRGaI5Po0USUNfLKdNqwmyextTomru41p19s6dLS4yI+1p0pef28Bsj
	 mNmNrRuSQKcjjPfX+Ki+oCP3CTQ7hKoEGRL4i+4VWC1Rt1TyYMTQSbAcyBgXuK9CInPdJ
	 At6NObJo4EWyxbswm4cXF87H2YQmKU/aCBqE2kxzk8bNZyIyOU3z9jG0LaX885f7S/f9I
	 bwUICKtdNI3iF2RXM4uddobja3vw2l5Mo5xcxFkOV7c0tsZCw42j6oLFG7Hyr+hxBoQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=eZUf3fHQ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.62
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011062.outbound.protection.outlook.com [40.93.194.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5670A606A335;
	Wed, 18 Nov 2026 10:46:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5670A606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=eZUf3fHQ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A79Sf/skxh380MfRGDvbTnXHm/hyEK8N/DQwLp3ymsKXoR1572OADWcjUu7FONMCKYmHUghTwNTmLxhOp2k1o0vVUmf+p1FVyl3cP6Ykg4fpJIsZVqQ54pklieSGmZCP9NCiWaq0gaCTxmFDRqKsLkkU2mry52utIv8uxMbp1Ry+uOLad4pSGEGbnAMhl1ZxbLx95vVQkTCIzn6vvltzxw/wn51UDRg5MaVL+IWL9VHHYgb0AaZl+Rdui6z3pLO+uZmg3mon5X0BT9EX4lP9WE9yQjRGvCpdJ2bAkWrPhlnUkKa/LP1bvKrU0OSSI3lhlDab5eMsTUx0AbFW6xw6Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l2MmDXV7Z2vE6SfFhPh4eA0c8JrFZlWe5BVvfhPO9c8=;
 b=R/NCK57uE2oCEgr111W8DjRFXtWK0SxSQ5e00gpg2xnqJwNx8yTW+6TeCth6C7ID1h6os+bBAEMed3jodhWOYwRbDboi4hXagIpthRWH0R69wQB6dAhQuDo47h9QgGaa+ywOb5/y9smtgCLTfs6Cj7jSSyn9BfpSB+Lasc40SYOnImNgYAvBlBHwWt9XUOmimMgdkRXzNhxGbnAqvPjvaSByNFk5huNAgnTR4jhDanDvjKpInH8i3NGgd7GhIjNB2OQiJ4h/5BtrHj0eOyj9KAjF+v+HQlJ/aUKpRU0fWNveBv6WrwVBW+vlTXNBpmbbfI6vbdbGxNXn+JjwSpDpKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l2MmDXV7Z2vE6SfFhPh4eA0c8JrFZlWe5BVvfhPO9c8=;
 b=eZUf3fHQ50HKaLbmYvPTLNbNZq0dsCey19ZH8hKMwKaphkvi4qszHV1FtiblDwB0PXMfCrVWuFmOjlqegJ+1mXhKTecYjJ9U6gDjXtkfpoxFmhQoQvCe7bDn4WUpQWuTyy8t0zzkVzBnZyGuLB09ZIMzcD3aC43OnvBRPuKiDE0=
Received: from CH2PR10CA0011.namprd10.prod.outlook.com (2603:10b6:610:4c::21)
 by CH3PR12MB8510.namprd12.prod.outlook.com (2603:10b6:610:15b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 10:46:37 +0000
Received: from CH2PEPF00016D4E.namprd02.prod.outlook.com
 (2603:10b6:610:4c:cafe::f) by CH2PR10CA0011.outlook.office365.com
 (2603:10b6:610:4c::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Wed, 18
 Nov 2026 10:46:37 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH2PEPF00016D4E.mail.protection.outlook.com (10.167.244.123) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 18 Nov 2026 10:46:37 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 18 Nov
 2026 04:46:36 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 18 Nov
 2026 04:46:36 -0600
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.57
 via Frontend Transport; Wed, 18 Nov 2026 04:46:33 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>, <Poojitha.N@amd.com>,
	<lee@kernel.org>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH v7 20/23] soundwire: amd: fix interrupt gate and work drain ordering in PM ops
Date: Wed, 18 Nov 2026 16:12:39 +0530
Message-ID: <20261118104353.331556-21-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF00016D4E:EE_|CH3PR12MB8510:EE_
X-MS-Office365-Filtering-Correlation-Id: cbbea4dc-52de-4f23-8a8f-08df45613898
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700016|23010399003|6133799003|22082099003|18002099003|261009223027099003|11063799006|56012099006|261026121527099003|261102123227099003|261028144727099003|261026140227099003|261021121427099003|261022105027099003|261022075727099003|261021123027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	MxNb6QTC3xmneEMA4HpNXmHZ5Y9AeeUAwrspeiCe2uHiqd87F6dsZwKjXhphbGbAD7xX6++l3ffwcrdfAx+/xv4yN2Tb6ozF7buGYNWvTEfe1TGq1HhnvpwZi9Flke8+1jy3IbvkwEg1/pQHHyE7Xn1t6RhAjLNOhP4IghrAmhPpEnf0Qk+h2LYVnzL0rrWaSkEzKEBcVuOOxkCoCKlb78ESb++gnnK6xGTJEajLW9ZGYkANZJUB63G3dEGn30A/8Rg8OCCtX/17L6WJNH+NwO/QX8/xvowcJS07BkYUaL3lK4JRqpmAn9pi+80wgLcJZvm3WeRISMfWO3UB7W9+eHhikfhYow7CrydVci3rtWGESruQxM9XKtt5FjWZ+8/T3ycO/FuThV5oWt7+gioBtJ4RCpGl7lX7sv1v/6bQZWcem3mZRuY9VP92qwlEBTSG+Lry95rHE2FwUmsgQehZY0QTmjo2k/8SkU5B8f3gyByPVkqNsMlU2zbZL2vjSXY8tLx+pRUuNvE80//R10DR56/1YPWlO0TMS/NW4jNSbjhsDIml2SCKuZr2YSvJ2Rh+OZIO/Du79ZfpY1sWq6Zywh1MgcZju0010wCz26HGYyQ3BEGewAJahrc9pPerIdE3oRWINubR9bHYV11Eh3M9TA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(23010399003)(6133799003)(22082099003)(18002099003)(261009223027099003)(11063799006)(56012099006)(261026121527099003)(261102123227099003)(261028144727099003)(261026140227099003)(261021121427099003)(261022105027099003)(261022075727099003)(261021123027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Y8OCPzFnuJGGhsKLNXFyWfnmh8Wu0VGANVHnKwNXAsTBLDFocUKxcdtCoA57b/pXhr0XeSbSV5qWbKhROPD+LPtpoYSXukIwc467nukkEp7IZM9Nd5PITWPFnHypJpWOd4sSAuNzXcnzk3unUGpxn8jkS9Lnxre3pSe3XsQJ+Df8J5IMP5krj+BRVsYEWxJw4Xmij2NghnE8tpJbLmMRw9PiJbCFJ/jkmafBMvRCadWuo+QprEt9RcJlgNcgE1xDJsUT217a8LJMiT0W5BBmWV+TiQ3xQSVyW7yaHT5JJF3JKMUro5o80tp7XILNf/rF62n4f+ss9Wgh7Vqa8fWv4dIPyBYSvvFPnLu6kB+CjyH3f8IRV4U4wq7K1HnAgvAygxl+2qo22qG5yxJFDUs8CelWRjaFJ1lCv7gr7TvjsBrNlwAVVK4N+/h5drHKrqUq
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 10:46:37.3007
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cbbea4dc-52de-4f23-8a8f-08df45613898
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00016D4E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8510

Fix ordering and sequencing bugs across the CLK_STOP_MODE and
POWER_OFF_MODE suspend paths:

amd_suspend():
- CLK_STOP_MODE: cancel_work_sync(&amd_sdw_work) ran without first
  closing the ACP_EXTERNAL_INTR_CNTL delivery gate or draining
  amd_sdw_irq_thread. An ISR already in flight when the drain
  completed could re-queue work after cancel_work_sync() returned,
  racing amd_sdw_clock_stop(). amd_sdw_wake_enable(false) preceding
  the work drain was also redundant: amd_disable_sdw_interrupts()
  already masks all SDW interrupt delivery including wake. The
  amd_enable_sdw_interrupts() call after clock stop restores all
  state-change, error, and delivery masks; in CLK_STOP_MODE only the
  SDW clock is gated so no state-change interrupt can be asserted after
  clock stop. The wake bit is not part of the restored masks; wake
  interrupts are only asserted when the system transitions to D3.
  If amd_sdw_host_wake_enable_by_rev() returns -EINVAL the operation
  aborts; this indicates an unrecognized acp_rev, which is an
  unsupported configuration on this driver.
- POWER_OFF_MODE: same missing gate closure and irq_thread drain
  before the work drain; a redundant amd_disable_sdw_interrupts()
  call was placed after clock stop instead of before the drains;
  amd_sdw_wake_enable(false) at the top of this branch was
  redundant because amd_disable_sdw_interrupts() (now moved first)
  already zeroes ACP_SW_STATE_CHANGE_STATUS_MASK_8TO11, which
  covers the wake bit.

amd_suspend_runtime():
- CLK_STOP_MODE: neither amd_sdw_irq_thread nor amd_sdw_work was
  drained at all before amd_sdw_clock_stop(); the interrupt delivery
  gate was not closed before the drains and not reopened after clock
  stop; amd_sdw_wake_enable(true) was placed before the drains
  instead of after clock stop. If amd_sdw_host_wake_enable_by_rev()
  returns -EINVAL the operation aborts; this indicates an unrecognized
  acp_rev, which is an unsupported configuration on this driver.
- POWER_OFF_MODE: missing gate closure, irq_thread drain, and work
  drain before clock stop; amd_disable_sdw_interrupts() was placed
  after clock stop instead of before.

Fixes: 86a4371b7697 ("soundwire: amd: fix for handling slave alerts after link is down")
Reported-by: Lee Jones <lee@kernel.org>
Closes: https://sashiko.dev/#/bug/linux-3b774ace-00cf-41e6-82eb-85cd43f5e1d6
Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/amd_manager.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
index ecef22baffc0..4f997198f5fe 100644
--- a/drivers/soundwire/amd_manager.c
+++ b/drivers/soundwire/amd_manager.c
@@ -1431,17 +1431,20 @@ static int __maybe_unused amd_suspend(struct device *dev)
 	}
 
 	if (amd_manager->power_mode_mask & AMD_SDW_CLK_STOP_MODE) {
+		amd_disable_sdw_interrupts(amd_manager);
+		cancel_work_sync(&amd_manager->amd_sdw_irq_thread);
 		cancel_work_sync(&amd_manager->amd_sdw_work);
-		amd_sdw_wake_enable(amd_manager, false);
 		ret = amd_sdw_host_wake_enable_by_rev(amd_manager, false);
 		if (ret)
 			return ret;
 		ret = amd_sdw_clock_stop(amd_manager);
 		if (ret)
 			return ret;
+		amd_enable_sdw_interrupts(amd_manager);
 	} else if (amd_manager->power_mode_mask & AMD_SDW_POWER_OFF_MODE) {
+		amd_disable_sdw_interrupts(amd_manager);
+		cancel_work_sync(&amd_manager->amd_sdw_irq_thread);
 		cancel_work_sync(&amd_manager->amd_sdw_work);
-		amd_sdw_wake_enable(amd_manager, false);
 		ret = amd_sdw_host_wake_enable_by_rev(amd_manager, false);
 		if (ret)
 			return ret;
@@ -1452,7 +1455,6 @@ static int __maybe_unused amd_suspend(struct device *dev)
 		ret = amd_sdw_clock_stop(amd_manager);
 		if (ret)
 			return ret;
-		amd_disable_sdw_interrupts(amd_manager);
 		ret = amd_disable_sdw_manager(amd_manager);
 		if (ret)
 			return ret;
@@ -1492,18 +1494,24 @@ static int __maybe_unused amd_suspend_runtime(struct device *dev)
 		return 0;
 	}
 	if (amd_manager->power_mode_mask & AMD_SDW_CLK_STOP_MODE) {
-		amd_sdw_wake_enable(amd_manager, true);
+		amd_disable_sdw_interrupts(amd_manager);
+		cancel_work_sync(&amd_manager->amd_sdw_irq_thread);
+		cancel_work_sync(&amd_manager->amd_sdw_work);
 		ret = amd_sdw_host_wake_enable_by_rev(amd_manager, true);
 		if (ret)
 			return ret;
 		ret = amd_sdw_clock_stop(amd_manager);
 		if (ret)
 			return ret;
+		amd_enable_sdw_interrupts(amd_manager);
+		amd_sdw_wake_enable(amd_manager, true);
 	} else if (amd_manager->power_mode_mask & AMD_SDW_POWER_OFF_MODE) {
+		amd_disable_sdw_interrupts(amd_manager);
+		cancel_work_sync(&amd_manager->amd_sdw_irq_thread);
+		cancel_work_sync(&amd_manager->amd_sdw_work);
 		ret = amd_sdw_clock_stop(amd_manager);
 		if (ret)
 			return ret;
-		amd_disable_sdw_interrupts(amd_manager);
 		ret = amd_disable_sdw_manager(amd_manager);
 		if (ret)
 			return ret;
-- 
2.53.0

