Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.53.38
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795453612;
	b=Uli02xo+ZirNfy1fj161b4dj7oORisJgmLOxeXsi+tYHSSokgHuq0Q2XoyJVwLUzdhoS
	 iYgUVRhjdqvJPGlnIYH7QUqTO346oDiXC1g7qMnJBCT65z/pTY2loJnB0yQjeV39SUFBF
	 hxFG9Jsl9zv74/U/rm7G/3YUyIi6SMjAE7b+O9d/2asQbt2XTmurS3F3RQEE0xalMyr8o
	 yv3bKOJVutU9ZrSSPZSDVny5Xn1RSMIs6aGAG+i5vUnxRwENTaZ3OMbPfV1QYDggh1B2E
	 7RPOfxWhLKiFenmc4zGZR/VUbp2KwxbQARRFs7Jrh7Y1k2cNgggmV2gKTuvTwaRWuZA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795453612;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:
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
	bh=UDePLOwWNW5OhQluSHp8R1uPazxNKeG2Cqb4L6Z1sZ0=;
	b=Gkg8/ghFI6Q89pp9lLUjUegBdKgmvytrX5PCxZc8f1kWhsLIXUl0QST8mXq2Ni/OwJre
	 riOydHBPLymVwStSjeBNQPbAwNT9FXThBLbUVZ68NWYS+KyaMvU8DKaz+o2A/QUtzWYp5
	 b63VuUYuqe/8X5pyahg+GVBoi5pIepmlcAYS/0jLtpgWgfxrHxAodUq0hSd4Hc6DOMM1A
	 wPYskJfd8nQDcPWoZbcjwb8pORtDUW7WFOjb/Y7axG6LYVDQT5rxLel3DdoB2Kd5PLVKG
	 d6YU6Rg+jyM8EI/o4u4aHCJSSPAkurM6gBT95gY+CzPKRJ6Kogsdc/UCULmDXV77mRw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=sUiEmfTu;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.53.38
Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012038.outbound.protection.outlook.com [52.101.53.38])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B1DA606A31F;
	Mon, 23 Nov 2026 17:06:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B1DA606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=sUiEmfTu
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I4g469vy+d/zIpb2vYegrHxI4dA02TQhQOUCtI5Wm9snth9G7+KgLNMtGWcPB2U2ScyIC7DqNaDcGemOLDQSUiG1Gyv/WBhaeN3NhQKmRnwpfwyy0PoBtnmPHjZbXLDpKFalYQ8BM7E0/Vv114KiQPLhhh1NMOxr6ddisEJ1dxgHNnl/FhoeIEbF/A/WycSvPS3Fz473349zIgt+RCvFwOMs6aiRVeBtbTXcF5ZHi+zNzJUKsOKopW5P0m09AidsUfQ3qt9K3ezY1XD9UwyY0Ug5E+YtLMWdfC7HESU8EzBJsHi+UFs9/qXIcNNbnlB013tdbk3RoPfVJkDsfZvQBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UDePLOwWNW5OhQluSHp8R1uPazxNKeG2Cqb4L6Z1sZ0=;
 b=ryhX07CP/OPmaDGyO+xmLfaFmnQLQSlzxxr80atFYgbiELJa6FNcpF6ScO24J0lRadCSJafdvsDLPmXvHjtkFXrUr8FfoMJr/js4MeIKLRmtIjqTajiUO+X+Y7KloN/cf/+6QVTnO9FRL55o1ma4v1RdRjzCOnRzLoltql2agl1M95pt5zdbGrW2fyvUGMEDYw29TyraiXo/YvCUbE99D2MwonI24dULvSY4QX9cEIVnNNKih0LEq7AgLlirHbtuVR0d7VmCHUEe7ESWUzLk9xFNwMJqGWAbNG+cl8cz/WuU4t9hR00j3tEyNT4a7JKLzn6v18J7JTkutI/bHXkZuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UDePLOwWNW5OhQluSHp8R1uPazxNKeG2Cqb4L6Z1sZ0=;
 b=sUiEmfTu4fjxw+NkqfrpszapwFKl51IjwfOZghH693dW78LdqR0hycqgF4UF6KkhRotCXz114rjF0nufUi/fYyeqaUtQ/akh9BDgAb/OxLBnMdw8GMbHRyKfpLvQYUZa2gT3lUlRj21QcOl7/O3MyAKnJHj0qzYMIXaknNjl/2U=
Received: from LV3P220CA0002.NAMP220.PROD.OUTLOOK.COM (2603:10b6:408:234::15)
 by SA1PR12MB5658.namprd12.prod.outlook.com (2603:10b6:806:235::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Mon, 23 Nov
 2026 17:06:43 +0000
Received: from BN3PEPF00022BD7.namprd03.prod.outlook.com
 (2603:10b6:408:234:cafe::a8) by LV3P220CA0002.outlook.office365.com
 (2603:10b6:408:234::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.14 via Frontend Transport; Mon,
 23 Nov 2026 17:06:43 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF00022BD7.mail.protection.outlook.com (10.167.248.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Mon, 23 Nov 2026 17:06:43 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Mon, 23 Nov
 2026 11:06:42 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Mon, 23 Nov
 2026 11:06:27 -0600
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57
 via Frontend Transport; Mon, 23 Nov 2026 11:06:23 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>, <Poojitha.N@amd.com>,
	<lee@kernel.org>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH v8 00/24] soundwire: amd: SoundWire manager driver bug fixes
Date: Mon, 23 Nov 2026 22:27:21 +0530
Message-ID: <20261123170520.1380924-1-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.53.0
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
X-MS-TrafficTypeDiagnostic: BN3PEPF00022BD7:EE_|SA1PR12MB5658:EE_
X-MS-Office365-Filtering-Correlation-Id: 686fc31c-8ed1-4ddc-d4dd-08df4984260c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|36860700016|82310400026|10067099003|11063799006|56012099006|261009223027099003|261022075727099003|261021123027099003|261102123227099003|261022105027099003|261022113327099003|261021121427099003|261026140227099003|261026121527099003|261028144727099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	IuohhL6K/4uvJrn7I5kadKA9QDZh1333ubJF/y15Pkk7nOWGVjA+GuftwfS4FgBuPFIwbNxuq5QDoQSp0gb80Q1yyFqMcIJNLTeztDwBEOFEWN1Iu2ptLrJ9seI2398EFTjUzPEKNjrQ4ZdahsjCXmIeb634Ilt7E86kH/tNX3xfPpz9Axmtgvwcfv9+hQqcCj6ff/B8I9Dj8HjdsZsZwlQzRw1UadZg7LXT3khfCInMH5NRvbIEDAI2zJ4zCMW2NDNTP9friOHEkoWIXoDnmCNzxW18VU4HWS7LxIbbsxawxc+LZ2dQb7ysy5P36nvAzcLSJ4aUNSmUbPhVJu7R6iBboCjxO1Gke/JQOO8GB8JSufGmhOwwvAGfDl1EZyordlhKHRbTTaRQHExHyNbMGAgXavbcGmiPvJlat81Unw0blu8CAGrZth+XKt9nXdZtPGNCkPp7FO1n7uUt59W3R3LBSG7aw5RpAUH+tjV1LEk/BKFnZLv54rMyG2zY693mei2IScmwgGBhNbhhuyY56RQqbVRz2bHoisx8l4Dy50/P5Fj+H4gzKD8rJRTXutrWPEhisx047lVnVI8/vXyCBRfGdWC0Ew4yCqiHt13ivQpoBmLJQAcoikS+6i912ocP+JbXWDyaZ3zhEN+zMcmgqhiwid5oC/MhI6RiACAGgG4=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(36860700016)(82310400026)(10067099003)(11063799006)(56012099006)(261009223027099003)(261022075727099003)(261021123027099003)(261102123227099003)(261022105027099003)(261022113327099003)(261021121427099003)(261026140227099003)(261026121527099003)(261028144727099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	s6OZwfg2RJtzH/2FsYMgnpE9rlHVTP0s2POBZoi7bW4oenhTCuHkc3XXm1WqF2cIyVoiQiWyu/b4cG7vpU3F5BGZSoZLaPLK1UWL1J2lH9U73B/3GbknwTn9MSjhE87pVMVaj4+rPKuw1jJNA2ibP6+nRbaMRKqqV9MeXTpEwe5ToQmBFbBkjmMDdmgdHoqC7FLVK+0zf1lYwDEUGBovPUlMv5Snm4f1TgJVX1uRQWZirZBIDEiALKtYNVyBLrhS0SR4fvuSYG2JVtt3Oda2kOY95Wt43Jx/OR2W/kehJw1xAwTxWmhZcTLMPL0vv4/ShK9glwhTbG7HxDrpl5Ff/aZXBJn7gyNSdvii/Z+gfpStQXn12S04ZXO61ZO5IEArfj1mpEhaaGXHlwRdmVQraoE3IwQ6Ga8+dvaBAeqM9sj2Hz35HZXZ2yOfRWbqWcMr
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 17:06:43.2353
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 686fc31c-8ed1-4ddc-d4dd-08df4984260c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF00022BD7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB5658

This series collects bug fixes for the AMD SoundWire manager driver
(ACP6.3/7.0/7.1/7.2). The patches address correctness issues across
six areas. Patches 9, 12, 13, 15, 20, and 21 fix issues reported by
Lee Jones <lee@kernel.org>.

Wake interrupt handling (patches 1-8): fixes reported on OEM platforms
running ACP6.3/7.0/7.1/7.2. Consolidate pad register macros into
amd_init.h, add correct SCHMEN/OE programming for ACP 7.0/7.1/7.2,
introduce D0/D3 PM pad helpers, track full pad teardown across
suspend/resume, fix missing wake interrupt and group wake-arming calls
in runtime suspend, fix the IRQ thread dropping STATUS_0TO7 on
simultaneous wake and state-change events, remove the spurious
STATUS_8TO11 clear in amd_sdw_process_wake_event(), and fix a missing
wake interrupt for ACP6.3 in POWER_OFF suspend.

Command response handling (patches 9-11): fix silent widening of
-ETIMEDOUT to u64 (reported by Lee Jones), cache the last successful
PING result to avoid spurious disconnect warnings on transient timeouts,
and add lockdep_assert_held() to enforce the msg_lock contract.

Work-queue and driver lifecycle (patches 12-16): fix drain ordering in
the remove path and defer dev_set_drvdata() until after INIT_WORK() to
close a concurrent-remove window (both reported by Lee Jones), guard
pm_runtime_disable() against unpaired calls, guard IRQ work execution
with the interrupt_enabled flag using WRITE_ONCE/READ_ONCE, clear stale
ACP_SW_STATE_CHANGE_STATUS registers before re-enabling interrupt
delivery, and add explanatory comments in amd_disable_sdw_interrupts()
and amd_sdw_irq_thread() (reported by Lee Jones), and fix *sdw_ctx leak
when sdw_amd_startup() fails. Companion NULL-check patches are already
merged in Mark Brown's ASoC tree:
  34ea81a7f284 ("ASoC: SOF: amd: guard adata->sdw dereferences with
                 NULL check in IRQ handler")
  41e06aaef9c0 ("ASoC: amd: ps: guard adata->sdw dereferences with
                 NULL check in IRQ handler")

Power management (patches 17-20): propagate amd_init_sdw_manager()
errors on POWER_OFF resume, drop amd_deinit_sdw_manager() in POWER_OFF
suspend, replace the open-coded >= ACP70 comparison with an explicit
switch/case, and fix interrupt-gate and work-drain ordering in PM ops
(reported by Lee Jones).

Drvdata and register safety (patches 21-23): add a NULL drvdata guard
in sdw_amd_startup() (reported by Lee Jones), and fix shared-register
read-modify-write races in amd_sdw_set_device_state() and
amd_sdw_host_wake_enable() by holding acp_sdw_lock.

Generic bus fix (patch 24): replace pm_runtime_get_sync() with
pm_runtime_get_if_active() in sdw_handle_slave_alerts() to fix a
deadlock when the parent manager is in RPM_SUSPENDING. The manager's
runtime_suspend callback blocks in cancel_work_sync() waiting for the
alert work to complete, while the alert work blocks in
pm_runtime_get_sync() propagating up to the manager. The fix conditions
the early return on pm_runtime_status_suspended() so genuinely suspended
slaves defer the alert, while slaves in RPM_RESUMING or RPM_SUSPENDING
proceed without a PM reference.

Changes since v7:
- Patch 15: expand beyond the interrupt_enabled guard to also clear
  stale ACP_SW_STATE_CHANGE_STATUS_0TO7 and _8TO11 registers in
  amd_enable_sdw_interrupts() before re-enabling interrupt delivery,
  add STATUS clears in the ACP6.3 POWER_OFF_MODE wake-re-enable block
  in amd_suspend_runtime(), and add explanatory comments in
  amd_disable_sdw_interrupts() and amd_sdw_irq_thread(). Rename to
  "guard IRQ work with interrupt_enabled and clear STATUS".
- Add patch 24: fix deadlock in sdw_handle_slave_alerts() caused by
  pm_runtime_get_sync() blocking when the parent manager is in
  RPM_SUSPENDING; replace with pm_runtime_get_if_active() conditioned
  on pm_runtime_status_suspended().
- Link to v7:
https://lore.kernel.org/linux-sound/20261118104353.331556-1-Vijendar.Mukunda@amd.com

Changes since v6:
- Patch 7: drop Fixes tag; the STATUS_8TO11 double-clear is an
  irq-thread logic bug not attributable to a single introducing commit.
- Patch 16: change approach to publish *sdw_ctx = ctx before
  sdw_amd_startup() and reset *sdw_ctx = NULL on startup failure before
  calling sdw_amd_exit(); update commit description to match. With this
  ordering *sdw_ctx is visible before amd_enable_sdw_interrupts() so the
  IRQ handler window between interrupt enable and ctx publication is
  closed.
- Link to v6:
https://lore.kernel.org/linux-sound/20261117070906.803139-1-Vijendar.Mukunda@amd.com

Changes since v5:
- Drop patch 10 (return response on IMM status cleanup timeout) and
  patch 11 (clarify bad-state guard poll omission in IMM_RES_VALID
  path): dropped after review feedback.
- Patch 2: rename disable_oe to needs_schmen_oe for clarity; update
  Fixes tags to cite ACP 7.x introduction commits instead of the
  ACP 6.3-only refactor commit:
  commit 2c0ae8ef1e5e ("soundwire: amd: add support for ACP7.0 & ACP7.1 platforms")
  commit 34b1cb4ec286 ("soundwire: amd: Add support for acp7.2 platform")
- Patch 4: use "POWER_OFF_MODE runtime suspend" instead of
  "wake-armed runtime suspend" for precision.
- Patch 5: add commit description explaining why the early return
  before wake-arming is correct when amd_deinit_sdw_manager() fails;
  update Fixes tag to commit dcc48a73eae7 ("soundwire: amd: change the
  soundwire wake enable/disable sequence").
- Patch 8: update Fixes tag to correct commit SHA.
- Patch 9: drop dev_err_ratelimited() calls for ping status timeout;
  the error is already tracked via the cache introduced in patch 10.
- Patch 14: update Fixes tag to commit ed5e8741b8db ("soundwire: amd:
  refactor amd soundwire manager device node creation"), which introduced
  the partial-init startup sequence that makes the unconditional
  pm_runtime_disable() incorrect.
- Patch 15: add WRITE_ONCE() for all stores to interrupt_enabled and
  READ_ONCE() for the load in amd_sdw_irq_thread(); restore
  interrupt_enabled in the ACP6.3-specific wake-re-enable block in
  amd_suspend_runtime() POWER_OFF_MODE; guard IRQ work execution
  instead of scheduling.
- Patch 16: simplify to single-problem description (ctx leak on
  startup failure); remove the concurrent IRQ handler race rationale.
  Two ASoC companion patches addressing the IRQ handler NULL dereference
  window (adata->sdw dereferenced without NULL check between
  amd_enable_sdw_interrupts() and *sdw_ctx assignment) have been posted
  and merged in Mark Brown's ASoC tree:
    34ea81a7f284 ("ASoC: SOF: amd: guard adata->sdw dereferences with
                   NULL check in IRQ handler")
    41e06aaef9c0 ("ASoC: amd: ps: guard adata->sdw dereferences with
                   NULL check in IRQ handler")
- Patch 19: add WRITE_ONCE(interrupt_enabled, true) in the ACP6.3
  wake-re-enable block in amd_suspend_runtime() POWER_OFF_MODE.
- Patch 20: expand description to explain the redundant
  amd_sdw_wake_enable(false) calls and clarify CLK_STOP_MODE
  interrupt handling through D3.
- Link to v5:
https://lore.kernel.org/linux-sound/20261107154659.3358223-1-Vijendar.Mukunda@amd.com/

Changes since v4:
- Add patches 1-8 (OEM-reported wake interrupt fixes for
  ACP6.3/7.0/7.1/7.2): pad register macro consolidation, SCHMEN/OE
  programming for ACP 7.0/7.1/7.2, D0/D3 PM helpers, pad teardown
  tracking, missing wake interrupt in runtime suspend, STATUS_0TO7
  race fix (promoted from patch 12/13 in v4), STATUS_8TO11 fix
  reworked to a targeted removal of the clear in
  amd_sdw_process_wake_event(), and ACP6.3 POWER_OFF wake fix.
- Add patch 11: clarify bad-state guard poll omission in
  IMM_RES_VALID path.
- Add patch 15: defer dev_set_drvdata() until after INIT_WORK().
- Add patches 17-18: guard IRQ work with interrupt_enabled flag;
  delay *sdw_ctx publication until after startup succeeds
  (supersedes v4 patch 7 ctx-leak fix with a more robust approach).
- Add patches 23-25: NULL drvdata guard in sdw_amd_startup(), and
  shared-register RMW races in amd_sdw_set_device_state() and
  amd_sdw_host_wake_enable().
- Drop v4 patch 7 (fix ctx leak when sdw_amd_startup() fails):
  superseded by patch 18.
- Link to v4:
  https://lore.kernel.org/all/20261026044507.2310694-1-Vijendar.Mukunda@amd.com/

Changes since v3:
- Add patch 12/13 to fix IRQ thread dropping STATUS_0TO7 when a
  wake event and a device-state change arrive simultaneously.
- Add patch 13/13 to fix STATUS_8TO11 double-clear race in the
  wake handler introduced by the simultaneous-wake fix.
- Add lockdep_assert_held() to amd_sdw_read_ping_status() (patch 4/13)
  to enforce the msg_lock contract machine-checkably.
- Add return response on IMM status cleanup timeout (patch 2/13).
- Update patch 11/13 (fix interrupt gate and work drain ordering in PM
  ops) to also fix amd_sdw_wake_enable() ordering in both CLK_STOP_MODE
  paths: move the call to after amd_enable_sdw_interrupts() so the
  unconditional interrupt mask write does not clobber the wake bit.

Changes since v2:
- Update comment for ping_slave_stat variable description in patch 3/13.
- Split the remove path work drain and pm ops guard patch into separate
  patches (patches 5/13 and 6/13) to improve clarity and maintainability.

Changes since v1:
- Rework patch 1 to fix the u64 return type properly via out-parameter.

Vijendar Mukunda (24):
  soundwire: amd: consolidate pad register macros into amd_init.h
  soundwire: amd: program pad SCHMEN and OE control for ACP 7.0/7.1/7.2
  soundwire: amd: add pad ctrl helpers for D0/D3 PM transitions
  soundwire: amd: track full pad teardown across suspend/resume
  soundwire: amd: fix missing wake interrupt and group wake-arming calls
    in runtime suspend
  soundwire: amd: fix IRQ thread dropping STATUS_0TO7 on simultaneous
    wake
  soundwire: amd: remove STATUS_8TO11 clear from
    amd_sdw_process_wake_event()
  soundwire: amd: fix missing wake interrupt for ACP6.3 in POWER_OFF
    suspend
  soundwire: amd: fix SDW command timeout return value handling
  soundwire: amd: cache ping slave status to avoid spurious disconnect
    on timeout
  soundwire: amd: assert msg_lock is held in amd_sdw_read_ping_status()
  soundwire: amd: fix work drain ordering in remove path
  soundwire: amd: defer dev_set_drvdata() until after INIT_WORK()
  soundwire: amd: pm_runtime guard in remove path
  soundwire: amd: guard IRQ work with interrupt_enabled and clear STATUS
  soundwire: amd: fix *sdw_ctx leak when sdw_amd_startup() fails
  soundwire: amd: propagate amd_init_sdw_manager() error on resume
  soundwire: amd: drop amd_deinit_sdw_manager() in POWER_OFF suspend
  soundwire: amd: replace >= ACP70 with explicit switch/case in PM paths
  soundwire: amd: fix interrupt gate and work drain ordering in PM ops
  soundwire: amd: check for NULL manager drvdata in sdw_amd_startup()
  soundwire: amd: fix shared-register RMW race in
    amd_sdw_set_device_state()
  soundwire: amd: fix shared-register RMW race in
    amd_sdw_host_wake_enable()
  soundwire: bus: use pm_runtime_get_if_active() in
    sdw_handle_slave_alerts()

 drivers/soundwire/amd_init.c      |  76 ++++--
 drivers/soundwire/amd_init.h      |  18 ++
 drivers/soundwire/amd_manager.c   | 372 ++++++++++++++++++++++++------
 drivers/soundwire/amd_manager.h   |  10 -
 drivers/soundwire/bus.c           |  45 +++-
 include/linux/soundwire/sdw_amd.h |  15 ++
 6 files changed, 425 insertions(+), 111 deletions(-)

--
2.53.0

