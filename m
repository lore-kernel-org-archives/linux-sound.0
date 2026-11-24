Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.40
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795510316;
	b=C03ssSwFohKrv9gy+Fuaw3sbiBUDyF2PsPsd5ddymNQZncX/NGKbWiOZvjyFKXwAQKAR
	 R/AVfEJRu4QNpqXoeiPoMLUchRpbYQfdJcj1mksWcQOQ2GDJCaL+O78fKa12G+xjmPlTs
	 kmPuIs+O5S9PUVx5etiGMVaAV5+S/0dl4IC6hVZF+GnjaZ/Ojaw4Pps0ixJV6i2jocAg2
	 szEetPiNW7PD0nEtz3u2l0Wyg/Dphmyg2O3t025xWhJ6yW5WRU/rZ2h/oNlPRPYwayJ9z
	 Zwe765egMPWu1wBmzULBVy8jkRMWWcYATZyJu91Ll6Vw3yEuKt/7HuPvT75AyseCUXA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795510316;
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
	bh=ms9uEHuYtFxKr7+RGGY2MB4kMPZ1uPR+M1v7PZJVmMU=;
	b=AjFuiEo6fvFkLAfJnK5KMfYgC/A2zQDUUC6Ny2poAh7epiAJpmxW8R96lsvVnbty+v7+
	 cwjeA/e7H07gMQEFu5NM4vs6rs+7nwQPTcyCpfiLLuDEbiHpD7yt94txw0RfgkJbPT4L5
	 138O6yMnebnp+rLZ2P2IJ/Vg1+sOHPCS5mO4RlEkR7sjvpIfNWqOgOy4uEXpsl5ZEXuj2
	 Iuschz00ScjbPbQjc1ux7E9oxKReh+qumvll/+swfn//gVxFXDvykM3aefI/A9eFfuSs3
	 KqLpd0qZmTpHxF7zAodSYNX9KMILZU5PLXtDDFAshvryaDiB0zKDFTE4cye/rnRP2zw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=VkzES2Pv;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.40
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010040.outbound.protection.outlook.com [52.101.201.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AA64606A322;
	Tue, 24 Nov 2026 08:51:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5AA64606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=VkzES2Pv
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ig95hv7N7IHL/MeSZpgs56yS3c3ot72pjT9gOujmGYFOoRciajQWGiQEWbrsEGDSQkN4Qb2U74Yh9WdKYzLhKv2b4JlpURdykgFTZkd+EVtqegf0PFUxNq9nnY1J91joj5xKGUTGm13Socp0gHd3vV9jiKqD43pN0X1l+7mQY1BwWjHOMm/nGjE3OYtRT52vVf0v4ncsRvvIX85hm1iM0ur1aav0P67nJI2hQV+1UC0sdSG+UWMoKcyOZpsFW9mLnwZB//V7rsnP3/X5IMwxh+krDfdnNcGdfBmAzqwayy3YLPtX6nsVrefP06yos4zzqgmPk8Od2xc+GXvBGCCq9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ms9uEHuYtFxKr7+RGGY2MB4kMPZ1uPR+M1v7PZJVmMU=;
 b=qHPcVX48Qc8qZJfnHp7MzcHP+3MCaHcpORfy2aoK0yTPVChfZdvw6I93va1NkC6yGv3jqFBc/GrmER73loU6tSpOwyDXq4+eTrVBAB7rOmzcwO40j5Pasolnw9JESJ5CW6yv86Q0mYnRkTtgPIJksDJ3LEw2rj/TZaHt2lftxljlYiv8AoK6lRHce1VOA6Q0rGUyE+0BEHXf2jR3R5WSSy+1JwoZmChYpJ+DPrq0OVuSjPSMbrzoq46hh/8afqfcja7lgxQrH9IuwF1R0dJiwIagahd5RHwK6z5JLUUaTJrdUKgyo3u27KmESgpR6t6X3Kz3E+70slEb3/KOfsXLRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ms9uEHuYtFxKr7+RGGY2MB4kMPZ1uPR+M1v7PZJVmMU=;
 b=VkzES2PvVXfe983CdmoywwSYhr+epDgGnrqsKoVpXAWiH7RDcseSVxFIwJ7B+Ipyht+QeX4wfDKRIDftt+ibRQXzGfXQY8dywv8F3Sxfsx3+n9k0sGECDsj7ppcJK7Oai0BWgn5oAait7uWg2rc6d8vnXvTPF8Yg5AZX2oxlb5A=
Received: from SJ0PR13CA0123.namprd13.prod.outlook.com (2603:10b6:a03:2c6::8)
 by DSVPR12MB999260.namprd12.prod.outlook.com (2603:10b6:8:41d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Tue, 24 Nov
 2026 08:51:53 +0000
Received: from SJ5PEPF00000205.namprd05.prod.outlook.com
 (2603:10b6:a03:2c6:cafe::2c) by SJ0PR13CA0123.outlook.office365.com
 (2603:10b6:a03:2c6::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.5 via Frontend Transport; Tue, 24
 Nov 2026 08:51:52 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF00000205.mail.protection.outlook.com (10.167.244.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Tue, 24 Nov 2026 08:51:52 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 24 Nov
 2026 02:51:51 -0600
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.57
 via Frontend Transport; Tue, 24 Nov 2026 02:51:48 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>, <Poojitha.N@amd.com>,
	<lee@kernel.org>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH v9 03/24] soundwire: amd: add pad ctrl helpers for D0/D3 PM transitions
Date: Tue, 24 Nov 2026 14:18:09 +0530
Message-ID: <20261124085033.682755-4-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000205:EE_|DSVPR12MB999260:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b4d0cbb-ae65-457c-a2e7-08df4a082f90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|82310400026|1800799024|376014|261026140227099003|261102123227099003|261026121527099003|261022075727099003|261022105027099003|261028144727099003|261021121427099003|5023799004|11063799006|56012099006|10067099003|261009223027099003|22082099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	bWxXrDEU0oZt/4YDpuv+fMV2dS3gzhJjtw78mWw8MzufxxcT2ijrmmRaXzhqXgyfYlRFxs86yz4krRIySPKen3AWmaC7qD1Hm8n+w27p7+pMrubT26PdcykDBx/FCRl8t4nWLXL3Y6F80ry7v98nynbcnZONyrC6prUDOJS1FUhrZDwwb8pD7NNjaMeJjhDoMr09IM7naCc2VAv0ZfHhmXrFMwjVKLJTGl0xiJ9LAANTUf6DXsjHI+ojh99hvM4y5Ho8srsKrMfC5Kr4ejBIl+4Pknr9BoTE99p81DSPwm3j06wVUarwWdjBknFNEeqp73p/IOeJA3zGXUPZWNsT+UKg3zgjntZKkf4y9fXsL4I7p94i1Ct+btk3+FPZZW2HSl6/ZyiidBP4SJZnkpMR5i/6Vd+aBMYQMtvefgGrsFK94Mb96/TkdisY9SJFZqQzMqc6riBoCHevlCNux6o7D1oIDy4xKDSbq6texAnR602CLLA7PdGNpORd7JFnNYFOH7jGih1LYJMQNA2PNVW/C2SRTS3ekHcanJ85vvRLX7p0iKD6nqz7g23Waibu8LKDLOTbMX2842o3tbLHNObOkO+Snl/SRaHaFB/HC0U//JnZF38lphBmiwfGN4gSzBwV1P/SQUdV1TZOio2MNWWEoFy555YOYfIB3GyapDNUYkWI/rwIfTsaWSlgOYRRrBQYiNOjvvX/mpBCL8EXbAKSOA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(82310400026)(1800799024)(376014)(261026140227099003)(261102123227099003)(261026121527099003)(261022075727099003)(261022105027099003)(261028144727099003)(261021121427099003)(5023799004)(11063799006)(56012099006)(10067099003)(261009223027099003)(22082099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	m0tgtV141HP0tNZZT5jVEZ7xqVtrlfvdU5UFELhcm/Q8SoLcUGUUVOBZCdx3czelyblYZeJ/rB3D6WNP/D751Twn1aGAb9ewjORy7bOqY0AVyCymIyxLKI2uLC0uI2c39/iMvOTJmQ1YyBz5GPFa8EDqACZPSEG0Zlx9SiVHNkfD5gVTdSjA6a/q/zcitTFY3gMGvv1rgjygqC/3wYzoDn17PB7/IsIQC6ITLPS9fV96l7y+rxYoebPv79/UQwOULgFbkhB4gS1wzgBdw90cdhIwyXmhlPT4WQNoBepGjnrq7ag6A3KOpet3kZuI7leckAeF05I5r3CRuGuBV5u2bPHVmh+jHy+NWg8TaniApmQio9RgP+WqxnK+CbzKekovChaLQQFl6sgyJ4LCbfv709vEFpxvMx0rxxbdUgA/7/68acmrmsSDKk56ti8REizT
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 08:51:52.6801
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b4d0cbb-ae65-457c-a2e7-08df4a082f90
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF00000205.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR12MB999260

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

