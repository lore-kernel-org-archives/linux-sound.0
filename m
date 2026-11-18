Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.71
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794998735;
	b=RQcV6dACpN3Bz89P8E/uUjTtk12xsciMa6IJMCRb5gdYFrpR69QVkPNPvezOI7WpiHvE
	 x635Rv53thJmweWrvc9AOcat0TSQx+hOGbEdvsCTbNJ0NzXHEvVn8FqFS+mYHbfpKnsZB
	 sGk3bzMF2vlGHzhdrN6Yn02hm358ZUvT5yK7KyaKqhmfQWX72Xlxhiq5TdpI6cNflXxt3
	 w/a7RJUY5ypLrLnNEXgGToZZmwLTli7Of5g6ML0bR14BrrL0aDgLe5nayUYCDl4MBfmup
	 CblNPsySQA3uPlOxudbysy7/j76ujp6rhWmpwG8pmCqRl9zwc+Zz78EXc2DMc5skdjQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794998735;
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
	bh=ms9uEHuYtFxKr7+RGGY2MB4kMPZ1uPR+M1v7PZJVmMU=;
	b=GJbsCFvtyhH7FUKV/SU05Xx5BoCD5eqYlMypI2ionihOK/r6tHYYVjcJGupTha+cyNI8
	 c/44O9XXMYnHEU+ku5fRH+gSO+eRNE/KOnlHKvMJdHkLDzi0xSoM362M5WjgPmCV2EsYV
	 5LYWAXKepqmXqkCwYHadbTa5+b/6TA4pbF5ETi6OxipS/sdEiYPo0QPkVWL4821RwE6mT
	 e01pCIGm6nA6roWd4DXhd+lbHbFEcq8B4XTDyZQbqNI2ikbwBJ/3yZpviUp/lrtVk9vd+
	 uutEqaH1kR5lS0BkoxzrYA0XaCrRR6kyrRxvUpnzZTf3meLIkZBQ9rD6JGbaAPpaAxg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=L2wNHSkr;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.71
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010071.outbound.protection.outlook.com [52.101.201.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E369606A32A;
	Wed, 18 Nov 2026 10:45:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E369606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=L2wNHSkr
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cpkVrmd8cgNO8Qedbn08t5O+6zhdtu/+pJIZTM8SPHiDkYASG8qZBWJIgA3GsM8aBC1hz3MMuNilXd043RgjfQ6+xScNA1C68h3zZOjJWXUmYWcmOBjHAGtxcfW0hJOBc49ctvqlMzD+yLtqnmAYuyPWhDbYAg3W14QqFwWJjf/OsG2oV6zt4A+utsK9vENoSjQvjBO2pCT0Cx23ggSaexnTL8gu7CfV1j9aGJ9zR2pYxfvFr9U+j3+4/rzu8YUkC3vABn7xwKaIc9O6tFpanu96E+OalScIGAimPlCisHabGYNX0lUEg17i1mQFHsua/GMb3anWngBVa6MjNuAeqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ms9uEHuYtFxKr7+RGGY2MB4kMPZ1uPR+M1v7PZJVmMU=;
 b=H4D54me4P6Zh3nMZcF8HW0aVzvhJPYWeMSxN+zQyMDT+b/ueCo5/bztbeO0HGFZsXZu49esKFrODKQp/ArkyioUkuSZ3yCWAdF/dR/IK7InE72yG5GLZ1bQlnEG/zmOUT2IVTHJg4HV0Oyo3NqkVFZLlv8n8hD5wVclz9g/1m4Q78OPp3K5cRTdTMktiihWVdPGTLhDliRRssJmT1+K5HTnAQH7mZO+GNa6OULsfYZuDjOTruJxE/SAilewn7jWdwRKAZq0V+t8epo6o4n98CQa3cH7noO1b70IATn+Qc1dywKgc6VDrfK3/dvyB2Y9ZiH+Od4jHpf0gzLpNha9JDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ms9uEHuYtFxKr7+RGGY2MB4kMPZ1uPR+M1v7PZJVmMU=;
 b=L2wNHSkrvkhAqQzOdzp15qUgkFFm7qMlSSa2Yxex1jAWnaB0zSspJgOkStGmtqfP6TnTVsug6q7bq/KRbgXyoWtwMCE7HNeHZ7efWvdE+fBDcgYRk1T211/bBZ7ZP42oDFyVWkvSt3lWb54RE9Oyqv9MJbbjO6iHdORhohbKCWM=
Received: from PH1PEPF00013303.namprd07.prod.outlook.com (2603:10b6:518:1::12)
 by DS4PR12MB733313.namprd12.prod.outlook.com (2603:10b6:8:50e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 10:45:31 +0000
Received: from PH7PEPF0000000A.namprd04.prod.outlook.com
 (2a01:111:f403:c95d::5) by PH1PEPF00013303.outlook.office365.com
 (2603:1036:903:47::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.14 via Frontend Transport; Wed,
 18 Nov 2026 10:45:30 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 PH7PEPF0000000A.mail.protection.outlook.com (10.167.243.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 18 Nov 2026 10:45:30 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 18 Nov
 2026 04:45:28 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 18 Nov
 2026 04:45:27 -0600
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.57
 via Frontend Transport; Wed, 18 Nov 2026 04:45:24 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>, <Poojitha.N@amd.com>,
	<lee@kernel.org>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH v7 03/23] soundwire: amd: add pad ctrl helpers for D0/D3 PM transitions
Date: Wed, 18 Nov 2026 16:12:22 +0530
Message-ID: <20261118104353.331556-4-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: PH7PEPF0000000A:EE_|DS4PR12MB733313:EE_
X-MS-Office365-Filtering-Correlation-Id: 998459d2-fd0b-442d-eb68-08df456110e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|1800799024|376014|23010399003|6133799003|18002099003|22082099003|261009223027099003|3023799007|5023799004|11063799006|56012099006|261026121527099003|261102123227099003|10067099003|261028144727099003|261026140227099003|261021121427099003|261022105027099003|261022075727099003;
X-Microsoft-Antispam-Message-Info:
	ay4qnudqcxvT7yXUd6gX1gSRVeF4PHRqBuo7eIZHSaUSs2KOrmnGuYkQ4tpxEfT5nPUQlec3KD45vv0nQnitSwERgCsbc+Xu6WRP4Jcygcn6eABphF+6zzeuJhh4boOGk3CQ2lCOixoROA5+HzRacCKJPOQhzD3hC/f51Kz5VGBUBPTNA6J/acy2N1x6Py9OpuXNljlDrPXZ6FWqi2b3JDCjv4KypXWL+NRh4XlVkdhUtJU3z2dSNWcsdLbZp+OgUG1bHpha7GbW5b5M1fRkeyfRQn0MjrTpEtxUo5MYLAnUzNfmIxGXtiUzGu+5XaDW0sDul5pvIe28nPP8kRFxTsFNgb8FAo8wcF1rfiR97ml7e6Co2lovv3jwxuXiYtcTcE24cnwQacXb1ZVwCQ8gDgtKrxrzNewINNoDQHBfF7i2CG2rILulww60kV2Tn/Fbu2u+bRf5BTNP2ng09dXlBn66ydWtGz6GTzf+TKZ1UA+IUSDsWLwKnU/0swqHXVRtT8lpXhnn+TPlIVpLNiU9NzXA39RXwy50Lf9TOT+Qv3u/gevAWkpAT/JsWUmRIdXSTRk74fwbaiSRSauIN5WraodExR4Kw1H5P7GQxh95mIZZGQ/Zyw7Lj+qEq4lPHz4PktifmcilZHcBdfaHlVZ42VrNBMGEq62LgjgXXNqCdMRXhOt7pwyiR901/miKQVM61PezLYb4lih8DQ7zWeQQfw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(1800799024)(376014)(23010399003)(6133799003)(18002099003)(22082099003)(261009223027099003)(3023799007)(5023799004)(11063799006)(56012099006)(261026121527099003)(261102123227099003)(10067099003)(261028144727099003)(261026140227099003)(261021121427099003)(261022105027099003)(261022075727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	li/GvzX3MflcMgqTOPZ4IhMt7rCKmfwHmyPI5zYhn1ChsbJfhG+R11ykxPz58hazNsif9w2jGCluqBt2udKzdCrwSbzf46f6Yp0D4GXzR3hvpvAAqd8+HfCwQN9Zz6f3qU9kTmQWwKyMPuzYn5TnsY/M3i1euzNgEexS+ZTwVrwbNAkJLseu8Ogh2VHEAGBEFcjNm+iy8lC+o/Pd9dZDYmTeIrnjEIMZZInqDDfile1JRML2wVmHKrc7m0MxzUXtEfzslVniGuQuZCk4K3jm+NQhUUBWYVyMYwZTIEB9k7ECg23gHv951iknEHalka1vSnPVb5LcXsNxP+iHzooRsTbCSJF3gah+yKRJOd9KHzIeIuSTmMkJ5Fab/r7bpPqvmov0v+nBFh5c83/Kk8p6AXQ31/K9maNdMf+BxCnT0rmsWZrmfWMIWMxfvgIvjTar
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 10:45:30.6061
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 998459d2-fd0b-442d-eb68-08df456110e1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	PH7PEPF0000000A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB733313

During POWER_OFF_MODE clock stop the SoundWire clock is expected to
transition High to Low cleanly. On some OEM platforms based on
ACP 7.0/7.1/7.2, a transient High pulse is observed after the initial
Low; the clock briefly follows a High -> Low -> High -> Low sequence
(High lasting a few milliseconds) instead of the expected High -> Low.
This spurious High edge interferes with wake interrupt detection,
causing wake events to be silently missed.

Hardware team analysis identified that the pad keeper, pulldown,
SCHMEN control and output-enable registers must be programmed as a
coordinated sequence during D3 entry and D0 re-entry to suppress the
transient bounce and restore the pads correctly on resume.

Introduce amd_sdw_pad_ctrl() to program PAD_KEEPER_EN,
PAD_PULLDOWN_CTRL, PAD_SCHMEN_CTRL and PAD_DISABLE_OE_CTRL in a
single call for D0 entry (enable=true) or D3 entry (enable=false).
Introduce amd_sdw_oe_ctrl() as a lighter helper that only toggles OE.
Introduce amd_sdw_pad_ctrl_supported() to consolidate the ACP revision
check; both helpers use it in place of duplicate switch statements.

Both helpers apply only to ACP 7.0/7.1/7.2; ACP 6.3 returns without
error and unknown revisions emit a dev_err and return.

Wire amd_sdw_pad_ctrl() into amd_suspend() and amd_resume_runtime().
Wire amd_sdw_oe_ctrl() into amd_suspend_runtime() to disable OE while
leaving keeper and schmen enabled; pads remain capable of detecting wake
events when wake is armed.

Fixes: 829c3e1cb4a3 ("soundwire: amd: set device power state during suspend/resume sequence")
Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/amd_manager.c | 108 ++++++++++++++++++++++++++++++++
 1 file changed, 108 insertions(+)

diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
index a3316efdf8ac..b21691652490 100644
--- a/drivers/soundwire/amd_manager.c
+++ b/drivers/soundwire/amd_manager.c
@@ -152,6 +152,104 @@ static int amd_deinit_sdw_manager(struct amd_sdw_manager *amd_manager)
 	return amd_disable_sdw_manager(amd_manager);
 }
 
+static void __amd_sdw_oe_update(struct amd_sdw_manager *amd_manager,
+				u32 mask, bool enable)
+{
+	amd_updatel(amd_manager->acp_mmio, ACP_PAD_DISABLE_OE_CTRL,
+		    mask, enable ? 0 : mask);
+}
+
+static bool amd_sdw_pad_ctrl_supported(struct amd_sdw_manager *amd_manager)
+{
+	switch (amd_manager->acp_rev) {
+	case ACP70_PCI_REV_ID:
+	case ACP71_PCI_REV_ID:
+	case ACP72_PCI_REV_ID:
+		return true;
+	case ACP63_PCI_REV_ID:
+		return false;
+	default:
+		dev_err(amd_manager->dev, "unknown ACP revision 0x%x\n",
+			amd_manager->acp_rev);
+		return false;
+	}
+}
+
+static void amd_sdw_oe_ctrl(struct amd_sdw_manager *amd_manager, bool enable)
+{
+	u32 mask;
+
+	if (!amd_sdw_pad_ctrl_supported(amd_manager))
+		return;
+
+	switch (amd_manager->instance) {
+	case ACP_SDW0:
+		mask = AMD_SDW0_PAD_OE_CTRL_MASK;
+		break;
+	case ACP_SDW1:
+		mask = AMD_SDW1_PAD_OE_CTRL_MASK;
+		break;
+	default:
+		dev_err(amd_manager->dev, "invalid SDW instance %d\n",
+			amd_manager->instance);
+		return;
+	}
+
+	mutex_lock(amd_manager->acp_sdw_lock);
+	__amd_sdw_oe_update(amd_manager, mask, enable);
+	mutex_unlock(amd_manager->acp_sdw_lock);
+}
+
+static void amd_sdw_pad_ctrl(struct amd_sdw_manager *amd_manager, bool enable)
+{
+	u32 keeper_mask, pulldown_mask, schmen_mask, oe_mask;
+
+	if (!amd_sdw_pad_ctrl_supported(amd_manager))
+		return;
+
+	switch (amd_manager->instance) {
+	case ACP_SDW0:
+		keeper_mask   = AMD_SDW0_PAD_KEEPER_EN_MASK;
+		pulldown_mask = AMD_SDW0_PAD_PULLDOWN_MASK;
+		schmen_mask   = AMD_SDW0_PAD_SCHMEN_MASK;
+		oe_mask       = AMD_SDW0_PAD_OE_CTRL_MASK;
+		break;
+	case ACP_SDW1:
+		keeper_mask   = AMD_SDW1_PAD_KEEPER_EN_MASK;
+		pulldown_mask = AMD_SDW1_PAD_PULLDOWN_MASK;
+		schmen_mask   = AMD_SDW1_PAD_SCHMEN_MASK;
+		oe_mask       = AMD_SDW1_PAD_OE_CTRL_MASK;
+		break;
+	default:
+		dev_err(amd_manager->dev, "invalid SDW instance %d\n",
+			amd_manager->instance);
+		return;
+	}
+
+	mutex_lock(amd_manager->acp_sdw_lock);
+	if (enable) {
+		/* D0: set keeper, clear pulldown, set schmen */
+		amd_updatel(amd_manager->acp_mmio, ACP_SW_PAD_KEEPER_EN,
+			    keeper_mask, keeper_mask);
+		amd_updatel(amd_manager->acp_mmio, ACP_PAD_PULLDOWN_CTRL,
+			    pulldown_mask, 0);
+		amd_updatel(amd_manager->acp_mmio, ACP_PAD_SCHMEN_CTRL,
+			    schmen_mask, schmen_mask);
+	} else {
+		/* D3: clear keeper, set pulldown, clear schmen */
+		amd_updatel(amd_manager->acp_mmio, ACP_SW_PAD_KEEPER_EN,
+			    keeper_mask, 0);
+		amd_updatel(amd_manager->acp_mmio, ACP_PAD_PULLDOWN_CTRL,
+			    pulldown_mask, pulldown_mask);
+		amd_updatel(amd_manager->acp_mmio, ACP_PAD_SCHMEN_CTRL,
+			    schmen_mask, 0);
+	}
+
+	/* enable OE on D0 (clear disable bits), disable OE on D3 (set them) */
+	__amd_sdw_oe_update(amd_manager, oe_mask, enable);
+	mutex_unlock(amd_manager->acp_sdw_lock);
+}
+
 static void amd_sdw_set_frameshape(struct amd_sdw_manager *amd_manager)
 {
 	u32 frame_size;
@@ -1319,6 +1417,8 @@ static int __maybe_unused amd_suspend(struct device *dev)
 		ret = amd_deinit_sdw_manager(amd_manager);
 		if (ret)
 			return ret;
+		/* System suspend: tear down all pads */
+		amd_sdw_pad_ctrl(amd_manager, false);
 	}
 	if (amd_manager->acp_rev >= ACP70_PCI_REV_ID) {
 		ret = amd_sdw_set_device_state(amd_manager, AMD_SDW_DEVICE_STATE_D3);
@@ -1363,6 +1463,13 @@ static int __maybe_unused amd_suspend_runtime(struct device *dev)
 		ret = amd_deinit_sdw_manager(amd_manager);
 		if (ret)
 			return ret;
+		/*
+		 * For ACP 7.0/7.1/7.2: disable OE only; keeper and schmen remain
+		 * enabled unconditionally so that wake-capable devices can detect
+		 * wake events if wake is armed.
+		 * For ACP 6.3 this call is a no-op.
+		 */
+		amd_sdw_oe_ctrl(amd_manager, false);
 	}
 	if (amd_manager->acp_rev >= ACP70_PCI_REV_ID) {
 		ret = amd_sdw_set_device_state(amd_manager, AMD_SDW_DEVICE_STATE_D3);
@@ -1403,6 +1510,7 @@ static int __maybe_unused amd_resume_runtime(struct device *dev)
 				return ret;
 		}
 	} else if (amd_manager->power_mode_mask & AMD_SDW_POWER_OFF_MODE) {
+		amd_sdw_pad_ctrl(amd_manager, true);
 		writel(0x00, amd_manager->acp_mmio + ACP_SW_WAKE_EN(amd_manager->instance));
 		if (amd_manager->acp_rev >= ACP70_PCI_REV_ID) {
 			ret = amd_sdw_host_wake_enable(amd_manager, false);
-- 
2.53.0

