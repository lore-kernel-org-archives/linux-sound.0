Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795453727;
	b=wOYP0csp3+sWLaYI2mBR3gZLqNbkll1QtwFIH2+oN+mJQaQItdYwmkgsR5jeGv/jtNzs
	 hd3UVD07pwrI15Sg1ilF0bzcLSMvurHVdkCI294HF4uBR25IF/yBkuC+v7vlqQW49MouE
	 /rjzUt06FnZ9XXoDyLYC1vZ9zfYL0NJ3FMwkr6NYlOfXee1r2U+EdRYizPI9E1Vf6Vk9e
	 nHMdd4XTRUb+s2R2hL6FcCQT3soiTfE8n1Q+co+WoUP9jOiRZslQVRkzrOkx4IyZBQBPP
	 xH62oXTgn7rrJEmhR6TatCnC2V5/tPVrIj112URfwxzLX3jbVdtZH4p1znClyYcH4dQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795453727;
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
	bh=u1UwXrqBlYuUx+/RauDX/WPcVLRynxMLS5+dXkaXsGM=;
	b=Oa3Z2/ICTrJ98UGVBWu3gvUdiyf34T35tZG5P3DaAAlOkvh0yw24/bVdGaT+Rp/uDcbx
	 wYEj4rfwTDu/a3yJA0+p5jnHHUAVq6u+dZucHij4z4UTaoeGTbC3tZi3GYwaYCr05kmQg
	 c0UgI0rIf8E2bXWh30fjRtOifI6YRoCWvXCzZcOjubmGWHU2qLZBupNnMqrcFfRAXRZs+
	 Bm3QyjGqnRMFsTCzf+zhgBiogWwiVchoC2kByKCDNSVZvUJIrlRqXfL3v7YviVfi3yt4m
	 gNYR3ij29wNAcqMo4N5pHdgFUpPzUmzGkD/8MPL7FfXIQlUcwVjfSXu7FLBBs+WgIzQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=iQMoGLAK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.53
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010053.outbound.protection.outlook.com [52.101.201.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 311E0606A685;
	Mon, 23 Nov 2026 17:08:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 311E0606A685
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=iQMoGLAK
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VPQcVmCa27H7pysizFtNoJQBDAzO1bfIVSh23Yyk75hJYufr7h9A9fLJOGtqRbJD9z7yeTj2ij9KBWEnYVpqeNLBtYQdD3IBr65xk7PkmJ4C/UlgVwhrElsYdgATLH/WSztF0MD3X6Xp3rQJLd4EA86UZuow+PQS1Soe1YmES/aAxxorNPk9YZ/rekl67yYPocWzoAYfK7HS7Zs77k3Ca6OhhDXBTP4yDZLCStTZxILhwMiruwqlFO/JzG322sOA8KIGM/LF3S2ca+dmGKhfnfIKwOHvimKqjE9EhuJxc6pC5vM5G6dGoaBZ/4S0NfTswaYhP3PqzX5k0F086PiRlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u1UwXrqBlYuUx+/RauDX/WPcVLRynxMLS5+dXkaXsGM=;
 b=L5zVRs2d/WQzBRLaAdcob84xnQkP8+KSnz3/5OXdaV8EBG7wTQ0gMS7WrU12pUGDP+cDsiZw1gjTeyhrienvoEwREfRBwThe1K37D8LejjZmeSgS566iIs0xKZU0KWHCw0sLQnr9IbS/XkQxuMOxB0ilG+xh5MEj2oN1WpLhdgPTyIyAyUG76A8WvwP4SItwxlzUL+NV1v8iAJob/QQfS8bvrjqf6WnxIPnV3WVz53F28zQ0Dfp7uzx2TB/baGdeudpiCtvEVxlRJny4FFN55AjpYSoOpHp5Hx9Huu41rL6ZO4HVgzjpN9h340YDoqSsmcOpUXiuYf/zwZC2nOzq+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u1UwXrqBlYuUx+/RauDX/WPcVLRynxMLS5+dXkaXsGM=;
 b=iQMoGLAKt/2lSkPe88PiH0yX32j07QLfiMEle/SyrGZjc+snPGqH7eiA3xcAhTM1Cfpn8IXoQvYhmWOyVXRYrPseiNkXsnQGueo1GhuH90Prb/yRmXRpzKvVbZVYlhuEUDNwvliDZ3lvqaAFSPjsi/9z74Ehq28VuC6z8N7K3oU=
Received: from CH5P223CA0023.NAMP223.PROD.OUTLOOK.COM (2603:10b6:610:1f3::28)
 by DSVPR12MB999191.namprd12.prod.outlook.com (2603:10b6:8:496::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Mon, 23 Nov
 2026 17:08:43 +0000
Received: from BL6PEPF0006C3DB.namprd02.prod.outlook.com
 (2603:10b6:610:1f3:cafe::2) by CH5P223CA0023.outlook.office365.com
 (2603:10b6:610:1f3::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.14 via Frontend Transport; Mon,
 23 Nov 2026 17:08:43 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF0006C3DB.mail.protection.outlook.com (10.167.249.229) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Mon, 23 Nov 2026 17:08:42 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Mon, 23 Nov
 2026 11:08:39 -0600
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57
 via Frontend Transport; Mon, 23 Nov 2026 11:08:36 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>, <Poojitha.N@amd.com>,
	<lee@kernel.org>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH v8 20/24] soundwire: amd: fix interrupt gate and work drain ordering in PM ops
Date: Mon, 23 Nov 2026 22:27:41 +0530
Message-ID: <20261123170520.1380924-21-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0006C3DB:EE_|DSVPR12MB999191:EE_
X-MS-Office365-Filtering-Correlation-Id: b148946f-f85f-4326-3d55-08df49846d6f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|376014|1800799024|23010399003|6133799003|22082099003|18002099003|11063799006|56012099006|261022075727099003|261022105027099003|261026121527099003|261028144727099003|261026140227099003|261021123027099003|261021121427099003|261102123227099003|261009223027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	v3Y//8E/lg7qvdKtw0NYgl4H/7bK3kaAttm5u1f5Oro3omw9alMaOnBOqNAeZCYjzeAHxDRRu5KsKo0UyqtzAIyPzq3Pw3RFuALRQFDKDGYSxK0ItsyaendAQQA3S0B/23zOLFDnn4DCmuiLcId1Y20X+9riGWrsJLoSe6ZWizf65TQ4WQWWFaLaYO6J2p353mPLDbBe20OiT+LLF0dSORwmk8gzQgkrZMLPXxE9J2RTQyXyOL6QqX4l4gmqBhE/TZnRLATq/QGnejiJcWqDvsKapmTOm1vyosdZe28Ny/RoUkWQkoez6CE6QeuIC5jW/P/LrINsVmoAIDky8rgKkVE6odjgQKFqxsSINk5MfYyU2Sdx+CKwx2bDYCtRhRSniNi0XG06BUCXqb7+08N5koq++239sTwcBUSsXTDBTMrkfvFiOPS66nHzcd25EdmxMi1jdR0y21k+w8WEpt3nx5hQfN/OQD3WwvVHtsuSLa+GmMuJRN1gLviRB52nFrx1CkIQBVlQJX5GKC1QIDtR0A==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(23010399003)(6133799003)(22082099003)(18002099003)(11063799006)(56012099006)(261022075727099003)(261022105027099003)(261026121527099003)(261028144727099003)(261026140227099003)(261021123027099003)(261021121427099003)(261102123227099003)(261009223027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	JnRY6G7wdjyZ750UTQbH4b3mSc3IOFIbeiGhxyUROAHQCSEXHPIdttbbbJfO/AiqYF/AoZ5kp82KUOxXToLxn06WqVm5ZO8AuuTiua/UF4oFuVKT2iyQa0F9YVqah3PM+2DGYj+V2tqXwlElD/OARmZXiFuEkzTBMVho35SzVfe6bV0IUcoBN1o5JcUjdM1a669wJr1Rf0Zqh+KjciritdZ3vvOwHIRJMIUKnX6EcrQU8o08QOibSt2VuRoKkVrgafsj75S5fHHpM9kE5y05RcfuKttbW3N8rU9e776BbG7qHLV5/BuTIinbRCSrvY3cDZENMJajCW66jfSnEK4Rf33Jtiq1jqMvsK23uh9P6zaeBBeMQ/0jeuS+KJWMEiZb5yeeScZq+jF6gXN/z2HzPTGSoOswgUwHcDgEC0sB2XqQ3uuWQ290bnektyQ5UBBj
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 17:08:42.9990
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b148946f-f85f-4326-3d55-08df49846d6f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0006C3DB.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR12MB999191

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
index f9e99c682839..9f717a9033e4 100644
--- a/drivers/soundwire/amd_manager.c
+++ b/drivers/soundwire/amd_manager.c
@@ -1450,17 +1450,20 @@ static int __maybe_unused amd_suspend(struct device *dev)
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
@@ -1471,7 +1474,6 @@ static int __maybe_unused amd_suspend(struct device *dev)
 		ret = amd_sdw_clock_stop(amd_manager);
 		if (ret)
 			return ret;
-		amd_disable_sdw_interrupts(amd_manager);
 		ret = amd_disable_sdw_manager(amd_manager);
 		if (ret)
 			return ret;
@@ -1511,18 +1513,24 @@ static int __maybe_unused amd_suspend_runtime(struct device *dev)
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

