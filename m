Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.85.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794998724;
	b=uUaayajtcYCd10YC9lZzcCTKeFDTfct1f65INRxvt0yGRrODwcG3SvVWr4AuFhZ0sxTk
	 9wktGxSyNTgOvoxf4SpqSmaRj8tPxxrsrG+ptQJ9uzvLPI9hnrDC2ObWHr5U4ehLLmd7x
	 27Vt/6U4H0ZT1ZB/KTkzhqxcrJpg5qa9rME34FyNuWSk0wqhcQja5cKbVuWB3sYbynUdP
	 ZR2g96ZJF5yjSwofwQj62FloNkn77ME8lwNgXovWY5Ym+7NX+XFwBSVIe62t2vu6ixv7I
	 1SLoDc6ncuCgW+sFOOWY9DKjEIb8VSOnwwAefwy41i90SVXV3ZRRb7CBnY116wjfWjw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794998724;
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
	bh=p3CbYkF1pxGj83A509n+shyt7qvwzKC7vAK48vdxhms=;
	b=MXAtmbh+mS5ZhSXzN3ezc+W3g7h9xe1EMaZafA8KGQyxieAAA7a51pHVI0PzQwWcWna1
	 5aNekzBRrAemU4V6VP//JGszrPTEUswUshffDKfY2KGycEImRGGu+8j5FB+xvLazHXwB8
	 5CKyZ90TZF3cdbC6op7p+06sbykYKEyTjsMzxv9aqacdLJqx+mVUFxVrao6yn8o7eu9FM
	 ZK/om9wG2qmLYLs+t/NFctU7MTFfVInJi8nJP/FmZfj9fGZocOac61qhRs3hlSWEResSd
	 tFZerNjc6dbzg4jtv++FoRXLEe4uAx7+9FZKV+ccw/0ThtxGGgKcMMkmNvhsjXf2bBA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=YJWgpwFe;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.85.46
Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010046.outbound.protection.outlook.com [52.101.85.46])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39FDF606A31C;
	Wed, 18 Nov 2026 10:45:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39FDF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=YJWgpwFe
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o3Xpk88n9IDNRWKaNilsLPvEfe1Jq28wKruWK4z4QxxSkVhTCzB0mdwX+qsD+oktMkcztTuKQVcvwFPUnk4RdAbwNAd1gOUNS3n1ypGRz69qELQUmnumWs5nW5oBolr/nADL4CfVDjDYLe9DjDtT9GxmoErC4kkce3wBDcC9k11kuxAyF/wmQ7HMx3ugnlQ5ZIK2Ywnko1DWtBkaGGCQLfu9wSQYnTuFyfLfE856W/FSOjrotuy4xzUhSPZe9V2ScLI4TCtpG3l3gik+7icbBDfLsuZxy+QobYt3N5CHcEFjt7zoj4BoUcG9GJAsnjXWdfuDdj1uEmxuIXAkBvwuEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p3CbYkF1pxGj83A509n+shyt7qvwzKC7vAK48vdxhms=;
 b=sbicqD/4p1ROj47YM3qsLph74UzHPlynH9zXbDfYf5oIxHhFBPV+ESbSGxDmhhCZ7MCvhEJVbEqNqTZ1ZNG4wU+yWOlkoICmYyzJ0Wfh2GgVigcdmk9wwLUxkM8kpKhXGFbdirxRExyVOU2ejJoLOslgaQav3BvrMGY4jxdNlM4MHEqkcyHicWmoceBhgPLIy073PPB3EVjRNRoKWdxURsv9sncM4vk79zKiVxsKceOcYWU/PEVBcW3QZKlKIDQA2ynEvaGci0OqUrE6hEK7QzCjQtJyR+cutZ4OMHbhgew31SbrpoG/bSr1leDWtoJdEdnBmiOEtCO0QrQfXfGOGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p3CbYkF1pxGj83A509n+shyt7qvwzKC7vAK48vdxhms=;
 b=YJWgpwFepPT7HKudlzprTFmceWkb92DDk/NVCLskhKki0tT0LFvO7GsLp7EQtkflhxT60Hog8hste26n8hK6ER/HnnB7qgSOzMjE95Zs+GFfOT0ikOQ5AHbIMAkpVOqx6Wivfz2d/jVZPwcT9+YAUHtOpEnQZPjbwOGh9xi//BA=
Received: from CH0P221CA0045.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:11d::15)
 by SA1PR12MB9003.namprd12.prod.outlook.com (2603:10b6:806:389::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Wed, 18 Nov
 2026 10:45:18 +0000
Received: from CH2PEPF00016D4A.namprd02.prod.outlook.com
 (2603:10b6:610:11d:cafe::9a) by CH0P221CA0045.outlook.office365.com
 (2603:10b6:610:11d::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.9 via Frontend Transport; Wed, 18
 Nov 2026 10:45:18 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH2PEPF00016D4A.mail.protection.outlook.com (10.167.244.119) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 18 Nov 2026 10:45:18 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 18 Nov
 2026 04:45:15 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 18 Nov
 2026 04:45:15 -0600
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.57
 via Frontend Transport; Wed, 18 Nov 2026 04:45:11 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>, <Poojitha.N@amd.com>,
	<lee@kernel.org>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH v7 00/23] soundwire: amd: SoundWire manager driver bug fixes
Date: Wed, 18 Nov 2026 16:12:19 +0530
Message-ID: <20261118104353.331556-1-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF00016D4A:EE_|SA1PR12MB9003:EE_
X-MS-Office365-Filtering-Correlation-Id: f42da398-fc9e-44f8-e76b-08df45610966
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|1800799024|36860700016|376014|18002099003|6133799003|13003099007|11063799006|56012099006|261022075727099003|261026140227099003|261022113327099003|261028144727099003|10067099003|261021123027099003|261102123227099003|261021121427099003|261009223027099003|261026121527099003|261022105027099003;
X-Microsoft-Antispam-Message-Info:
	b4WB1nW3DNwecg36JLjk4IzkGHNX7Gk8rLLfSlY0f2SMFeu21bO54z1OzHIIXiDDhYX7Fg+lu7VKuHJM0PA4EfaERPdbM3swX2Lh22lXNIiRxgkkF3JikVHZ/GAdp/v13TCuZwPmsqQtUQKE9wameCR1KPpDxc7UKC03VudzbWAvG674PBt0cXd0D7hIzSRGEeOw3Amd49AIkKcYdEH8NuxRYjph3wuGMzz0p9WklhwZdWR/ec32tuNZ/RvhP2UqWNLa5DJhrTdT/BeKf4qafk2jYP1y0WyatvyK7tYDstOYXP/8axpvuD/IpmQh4f2UsRXK21YSuNau5r72vEi5pRFAjKQ0dvABeBWOAGyhfSYA+bvqqgEtN7Rmv0mZmeaULW0DXRXj/Jau1IGwG8wiZLvY+kZpePIKXxVp4rToZ4C8UST1O1jg/ql/l04KcDWIx+m948f66/NgO3nzHNKZ5Orbtp9PRbpZdNo5MLALRrPzdzzKo+vw18I03obeqJHK592UZHuRPf18XALx5dOwoQRO8V3sDLB3Azm6CSSla7VaOSC8rqxB/LAlERJ5rDDbOP9SvJY5/QEWtxUPVdWRt2PGVMquypZKpzOFnsY3/DDvjzumsfoRdKTuSUgt6XBWDGuEd2l76Du5179UnWyu78QsmU17iiKICgSK98hXbiU=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(1800799024)(36860700016)(376014)(18002099003)(6133799003)(13003099007)(11063799006)(56012099006)(261022075727099003)(261026140227099003)(261022113327099003)(261028144727099003)(10067099003)(261021123027099003)(261102123227099003)(261021121427099003)(261009223027099003)(261026121527099003)(261022105027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	mP3ATwEKKH1TDgtgEKERPGd/mIeUI2FNu2Y5sIH3zSF/guixU39hjZi/Q1VgfGm8RYp36o8mWm/+QRGnuizmORp33QYLoUDKhffr9GrmGevxeuSnPsrtCt8jIlNPx9j50x3nHO1XVp78XBb6AKhMvevtTtV07SniBHa0Ao5izEvMwYpmxN6Tg771x8Lt7r8dKZi14/MYuZMC4HoyLzYB84nyknOdUrdYr59CPKcRumzaXbfjjVsHaIsE4Eynyln/AiPxHCB2kk+S4UtLgJKYa/0TNIybaTNOd0J0jOsF6KXSeltccGNYGuNzYLidABI+Gqkh5R4CcuEb2obZ6aBysBVqAXNSTa4CrnRrMhiyYboGr+/MHqCe6zVviac5PySz49OpxMGCdhXbRanf4wETOZoxgmkyMiGJxE1BjSS/p7tairilWoyLXV93p/zlH7ts
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 10:45:18.1217
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f42da398-fc9e-44f8-e76b-08df45610966
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00016D4A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB9003

This series collects bug fixes for the AMD SoundWire manager driver
(ACP6.3/7.0/7.1/7.2). The patches address correctness issues across
five areas. Patches 9, 12, 13, 15, 20, and 21 fix issues reported by
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
with the interrupt_enabled flag using WRITE_ONCE/READ_ONCE to annotate
the cross-context access (reported by Lee Jones), and fix *sdw_ctx leak
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

Vijendar Mukunda (23):
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
  soundwire: amd: use interrupt_enabled flag to guard IRQ work
    scheduling
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

 drivers/soundwire/amd_init.c      |  76 +++++--
 drivers/soundwire/amd_init.h      |  18 ++
 drivers/soundwire/amd_manager.c   | 351 ++++++++++++++++++++++++------
 drivers/soundwire/amd_manager.h   |  10 -
 include/linux/soundwire/sdw_amd.h |  15 ++
 5 files changed, 366 insertions(+), 104 deletions(-)

-- 
2.53.0

