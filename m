Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.46.10
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795510386;
	b=Kd6HimLCvP52k3u1KMKp+IzjEB8UygSkKCr4d8SpxtnXfU83OzZ/FNbxS9M1U9P/fLQ0
	 U/hWUOFb3Y4fUHKD680piyM2qY8uX0hMZ5CLZaH9O29i9D4P4M2hSSC4bLP2KC8+lDkG7
	 ikUxIBSgdMNqS7jM/rCB17eGh1+KVnchlE2JnqhTy62qT6Mkf4BmOw/x+hUpUd7waBn0O
	 YngyICw7oXDEz9mCMzfBwpQ9obyFP4rPOIZHfxmoMJ1xjD4n/kHdWnUgbR+2/hR3EJmfL
	 i1z+qhVVsSf8Lx0A5CpvDCFULmJ16WKGLQBa7veM2fsr9wcw4jnhvWoQfCCFcVLPjgw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795510386;
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
	bh=u1UwXrqBlYuUx+/RauDX/WPcVLRynxMLS5+dXkaXsGM=;
	b=Ju88TZAtdHIL/+tYMDjiIjZirFbvdAy7MfwXTSW1hCb0AoDEO2WZZhlZba2FDgmr3grT
	 KhZ742Ks1+uun272qRpvjapnNvEAw1PBMBRAzfs+ea3WPmHaNYfneo5+vDc/CgthkZgvt
	 hNCbxnXCQ1jSiBk/3jFjodiwJ1Sj3qgv3idJdkGTRRbQqddz1lwP0MWpouPrbMhLoY0ax
	 1aX0DyUjxcovkN0EJNKeWwGjouUkJfCqwaRyJY0Z0exXrSAJCWK4i+kLE6HwEejHmbhN0
	 U93smCtlYJSpfDv2/sAqacpZrrp4ZaMPOIkuDDJAL85KOXPL0tU5YWOXEPfw1x25EkA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=4n0rnKnI;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.46.10
Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010010.outbound.protection.outlook.com [52.101.46.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF10D606A321;
	Tue, 24 Nov 2026 08:53:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF10D606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=4n0rnKnI
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z8TZo/x9OmjvLRy3XzNum5gr5HCTBIY25yCDNkqiARmW3e7Tjy/NIAMTD9CkXx+rmLKIHNge6y7p1e4vvXLP0BHq76Iym0CHKCiM9iTv65TRdvjfPdQ54t0i7B3tcWELeL1b/2d3rZJv5y+VC578Fdo7+kAy1Nk/ivbb+TmD7asEYqd75MWUQhATxfYJEJi/4gLMLVW14urBrxHg09NsyDDBgIDT7aDL7UPY/Qwy6TjcUSLsJ7vVcPK8vBwlblu4OFV31Fe0LlrHBjgxIq6P8O05NudfQGL4p+uXkCfd9POd46L/7S2XPvbAR3zxfY09uB+6ON7OivZAwDTfjAuMTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u1UwXrqBlYuUx+/RauDX/WPcVLRynxMLS5+dXkaXsGM=;
 b=O3nfxxWRqQIIEzoxvO3ktqeUYEcc1rQ6wUW/RfozOAPPigd4+NDuKI2zR9+1TCt0sHSiUMfYvNroDeAcOHjXOyduh1Bi456VIbL6nNJyPI7vx7Cizkm8NX94j8Yj7I0OwJNYMGsRAqyBDF8j2JuvffTInl6+N5ZvxUCXaJloG2oWQiCLKTtm+UG8aNWRq6fHgg5A9AsqU7NvPC55/cr+6zfj0EkBOJadQSBJ/6uxxCmlRUt8Ja81yH9fIIKoYHiEDA+Q8z+/tJ9hETFrB17U4ioe3xXQWMZ0niDeVCUTtr1ZRv9ddoD67GiwYk57me0xyrhLdLECaHK37iPumhP8CQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u1UwXrqBlYuUx+/RauDX/WPcVLRynxMLS5+dXkaXsGM=;
 b=4n0rnKnI9hB9txp2+Qd2/kNvbil0szAmZ36EJsppY21kVu1lXtGmuJ/sMDz8gpnfiOYDRv5awpidND0WFkd8Mf+ePsTNuw6dkH+UNy8Ro6kJAiEjCaHKiU6/sR6TqMJCnF4JgS3x+hTmPVKfphFIpMoZwMq4RJpKC/rrAogTqzI=
Received: from MW4PR04CA0316.namprd04.prod.outlook.com (2603:10b6:303:82::21)
 by DS0PR12MB7801.namprd12.prod.outlook.com (2603:10b6:8:140::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Tue, 24 Nov
 2026 08:53:01 +0000
Received: from CO1PEPF0001885E.namprd02.prod.outlook.com
 (2603:10b6:303:82:cafe::19) by MW4PR04CA0316.outlook.office365.com
 (2603:10b6:303:82::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.14 via Frontend Transport; Tue,
 24 Nov 2026 08:53:01 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CO1PEPF0001885E.mail.protection.outlook.com (10.167.249.247) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Tue, 24 Nov 2026 08:53:00 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 24 Nov
 2026 02:53:00 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 24 Nov
 2026 02:52:59 -0600
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.57
 via Frontend Transport; Tue, 24 Nov 2026 02:52:56 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>, <Poojitha.N@amd.com>,
	<lee@kernel.org>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH v9 20/24] soundwire: amd: fix interrupt gate and work drain ordering in PM ops
Date: Tue, 24 Nov 2026 14:18:26 +0530
Message-ID: <20261124085033.682755-21-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF0001885E:EE_|DS0PR12MB7801:EE_
X-MS-Office365-Filtering-Correlation-Id: 56d1ff6c-45d1-4b62-2ac4-08df4a085833
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|23010399003|36860700016|6133799003|18002099003|22082099003|261009223027099003|261021121427099003|261021123027099003|261102123227099003|261026121527099003|261026140227099003|261022105027099003|261022075727099003|261028144727099003|56012099006|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	MeuHpY3uQ2x+kijmYoEuuZBvPN5fFhxi4I7AfGFtexiOW/K6HzIEVVAXeIzBeMVSf0eWpXbIukOeJ1B+IKCnPn0aWueS3eBCuT+aEpuIqiUJhyG1+EziCnHWwdJkki28HbCWWwA89aADa9jjjoGgBg70WJnVLoiqJbV9lmtg2oZYj8Q1bFjEUwc93AdjE41LnVrm1HL2qSmpAG09vLXwqa2ce+TKDC0xDW9XDjpPJO6h3WnoLYbLDGZ0hMxB7chGDaBFW4j7Bcx3NBs1Thak5r3uRGbSA1ezJpzs6rOeQvC6Kb+XBNmJtbSgRE/2ZrtVhXA56OKvp4WKrMffVrYl7YGx6ab9VTKSAnTS3RW5EVk/ekn0n22IS1igVj2PPksPwHHF0zrjcAGWGQsRTM5ZuTcD/GiZtAP+6V3b9vgw3DKa4xd47IP8aCdOcKza3mDGhE0ClrhBF9832ygW3HRUn40SL3b52GseO3Ry57+dQElIzgQd/ZV2uOtY4TkompfKPnWJs3WNLgDCYqq3QB4Kt5jwBRSjpGaBnWwaWAxDgCy7rcGfGyyN8HEX4Nae4KlpRP+sPz8n3eukNEnjc0cJ7Vf+R3jzqx3CzUgpOeoxc25ceUqL/jsypxTvIPPB4Dc8/kpEPFWJv3b/RK4jKswj/Q==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(23010399003)(36860700016)(6133799003)(18002099003)(22082099003)(261009223027099003)(261021121427099003)(261021123027099003)(261102123227099003)(261026121527099003)(261026140227099003)(261022105027099003)(261022075727099003)(261028144727099003)(56012099006)(10067099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	2g/wZ9pu3Jn7P5l4S2awRu/iVvHMON+1m+dGgApVvEWwB/9XWiVp/XYqzCM8ZVQIzDH+WtY5g9TYTHEakX21DkIh0UH6F56p7fLz0HV3RRAIao0fBab3Va4K6xb95yrVls0CcQtugAxkYXibSG+Lxhyt3V/SrbqwyeIdppavah2bEyhvhEutxTqNDwlJjnHdZcYGev42CyBG4FxyueZ77jaX3eqMMclRMaq5msa0fR5zUnrGhNez7kzdoGNZ9VnNcmoRGjS7acPs3IayYsLeLxonFzqJPRHN8oDErAC9HxanMrFo15X9VtPu4NbGQKRVIN//NxkH5bV1mVWVsgtNj38RlN3e8/lh8rG+gF/rrEwZUmItMiSILFiqVx9Y1GuFxITRZiqLb0fjI2XpWjh56Za6tNrhKQnNLqIVQq7Prtk8zL2NsM2bjfUaafEj5HnG
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 08:53:00.8489
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 56d1ff6c-45d1-4b62-2ac4-08df4a085833
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF0001885E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7801

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

