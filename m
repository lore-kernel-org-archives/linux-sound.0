Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.196.56
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795453636;
	b=oheLmS2RzEnOSkOrQjAcNrDLEyPY0/lrBIyn05D6qb4jRDS+ohnIZ5vgRZXrnTwLRD1G
	 qilIsgXP0p7Q3OF0ISHrr3euNn/uf053SOcgtub1I3PglRxW2etSXcBydWR54RSzpNRrc
	 vJ1/MjZD0ubeQq6UFQaJWVDaWmD1dAhX+IkbGMACDR3Afx2RLVSSy46ezPnjjucjmbNWI
	 6p1BXbLo3JP03LQAaVSNFeiRt+eGa1PWRqWuiLa/iy19Rs6aYQT8xkmSCS4HDtNazgr/c
	 DwLwIRf1cLd1DV+AAusTBf+TDe8ROE6X3hHZJoXWlQd+wBejhLeg/v9TYm+AfZukJsw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795453636;
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
	b=KArZH4/WHvCufYuizcKORqQgCn1Ne53L2Ntfpub4Gv75u0yXzE2s6icfC2k38Du3VKiy
	 sFDZcSWQVQaQURysHq1SM5ZW/EK5zsVyjyGkCbcLUpEb34mRhsmzYn8D/B0+ZEGtrKAVF
	 woUepYD03FApesToGcS33MOaCmofFCb5XKmTJ3JXHbR1zZuWRz/v4126ScG8x1zBQ+ZA5
	 betzlya+n8XoGt8GmMwabSzYavNOy//hp93ZFBu2gEPyBR2qUgtRHXiGtHgVhCMYiZsAk
	 g96/T07iKAe6EjA9907d4CzE/B5PsPIaTJ8sOziGKXulk7anwpu6xP1/uErhH27rj6A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=FZi4vC6F;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.196.56
Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013056.outbound.protection.outlook.com [40.93.196.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16EA5606A32C;
	Mon, 23 Nov 2026 17:07:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16EA5606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=FZi4vC6F
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OatyhSDMrxilGVidgqB9bhZGW4+iacJf7pkVY8SeKEBRQgT1GjVn/nNlXdKHz8Oke+5ziyzzsG7c/K0mCN6sBRUuMJMoexzyb0NOJf1VR3oDndKsGJwRdRAY30xUvDvgDh2RVnehNV8b1Ye52BX+EnKLm4DxLGTf+XCRAZZ9awyoe38xUF2UPm3+KOYd1q4c6HpJgYjUx7GfodumTYBQyS2uX+OHdBW4rz5vPFcPLfzMEwLlPt8SeQpJv50mgxQOplSMLHCiOGKNV+mD9bZiXK9U8YtgpHIWocOYgS6+8N5BcaoQ0TrHuE2dRI/BxbYmtOxIcQ/5hypGtGBWUIJ7QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ms9uEHuYtFxKr7+RGGY2MB4kMPZ1uPR+M1v7PZJVmMU=;
 b=iQj/esR8XdGbhRmqwszhP80y4wW8EzQrmWQFHDxxSmdFVde8CjpeQw7Xz80LQbEJ+RGdHun58W7stnG6JLUfOBE3AvsvudOMbZQ49/t4NdZQRge99oRM1ccC32k/Xv0tdxLsRaOs+vXxbtQYScPDftKyo3izBGICThvOTkqKAJt1oZAjHbguxR0bvjI/3OnUGvimtIMgJqstJ94Zgm1/sJLoy2A0t45F+xJTxJs6R4TttXunOP/vphppp8M/4oGEuSxpZuH2uFNd9FUBuoorl/bnNabWrYwg2QwzOUmE6lqVELXZLvwFPTxPFWSEu2RWLIToF26StJy4QE63ARrfIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ms9uEHuYtFxKr7+RGGY2MB4kMPZ1uPR+M1v7PZJVmMU=;
 b=FZi4vC6FeQyzF7mWwI7bdKG8Px5Oy3OzwKB2AVuFbSBTlV9YUXMJtrOkJ6oH7TOoPv3arrP1oMoBv2/s4MT4qIfVjqLGyqAwvDRpfJIbEJXHLqG4oGTDjil0czQHIakNO5N1O7tIwHkiYwc0TS64QMoz/hpcnEYciKGXBpMXiR8=
Received: from BL1PR13CA0226.namprd13.prod.outlook.com (2603:10b6:208:2bf::21)
 by IA1PR12MB7638.namprd12.prod.outlook.com (2603:10b6:208:426::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Mon, 23 Nov
 2026 17:07:10 +0000
Received: from BN3PEPF00022BD5.namprd03.prod.outlook.com
 (2603:10b6:208:2bf:cafe::72) by BL1PR13CA0226.outlook.office365.com
 (2603:10b6:208:2bf::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.5 via Frontend Transport; Mon, 23
 Nov 2026 17:07:10 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF00022BD5.mail.protection.outlook.com (10.167.248.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Mon, 23 Nov 2026 17:07:10 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Mon, 23 Nov
 2026 11:07:02 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Mon, 23 Nov
 2026 11:06:39 -0600
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57
 via Frontend Transport; Mon, 23 Nov 2026 11:06:36 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>, <Poojitha.N@amd.com>,
	<lee@kernel.org>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH v8 03/24] soundwire: amd: add pad ctrl helpers for D0/D3 PM transitions
Date: Mon, 23 Nov 2026 22:27:24 +0530
Message-ID: <20261123170520.1380924-4-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF00022BD5:EE_|IA1PR12MB7638:EE_
X-MS-Office365-Filtering-Correlation-Id: dbd6ad42-7cfc-4f35-6a31-08df49843603
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|36860700016|1800799024|82310400026|10067099003|11063799006|5023799004|56012099006|261022105027099003|261009223027099003|261022075727099003|261102123227099003|261021121427099003|261026140227099003|261026121527099003|261028144727099003|22082099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	n0IeJ50cT7SCTfYaWBiO5ZXdnh09IM8zb4H/E+jp0XDYOcyYfoLI0FV81M7fYtq2uacvY6AXtNS3MO/StWGeSlJ3b3BUiY9EiOciQm2kovnYQL4jggcWNU9V1B3LGzWWHPpvreL5q/KYLAtsHs0EftoOW95bhewQN/5+UUQpcoRIIJXpW/VfqkjPOdyz8A46Nrq1xCPj4CaLxEUyf3KkkG/mxf8zg6b4oKDhlGbt6l20Y9NtemqfUvX01+XOid21iZE4bSyowpTOHVaSz8ow1tbCSikSU/dqSVh71v4pKrkHK6EzUxXbd4D7L9ld0mDNusPUYaUHP/g16uedoDRCqkEfh+tvTTMiaVJ6viYgaJFdSta5XVMVD18CtkqSayH/R0YobB33RAwcNUnPullK1zDFbxil2e1Tikwwe4rg4oHt50MiCIJ4jDK98t30AwN3W8RZPbWyA16hMqpG7JFGlpVC/Qu4NqgvpszqREu1nxXo+ZSJhNm/VcHpoaVk2LlHyQs73NH41eASQGFBX98Z25wB/TC4AxWmpOeP7rry4RfydKvhwf1xIxr56zOBAm/fhBXTY0unxeCMiGwpNQYxIDeqCoMOQuLurtzqZ3NNum+Nr7/5QCjoGgW1t1VXJHhX/kZJGhFR+uIdIOBbNhSRWPlpyjvvQRQ7RM4m4XIQ3AKcXEI4zO4BdvCxvfU8CGPK94ftBPVOyRNdp0ubws844Q==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(36860700016)(1800799024)(82310400026)(10067099003)(11063799006)(5023799004)(56012099006)(261022105027099003)(261009223027099003)(261022075727099003)(261102123227099003)(261021121427099003)(261026140227099003)(261026121527099003)(261028144727099003)(22082099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	4HSeHnYxXk0xaPqsKUz8CCcmOG+a2vqXNMma3BS5IBi6fZOPB2l+rk7OfTWXKyWFQ2hdgxdZhHMvjZb2WmlHX1dpZxfv4Dsz/C6P0KtYA6s7hqi+qKTXLy55N8srIBoirsLJPidnDlTqSVCSenxKr/LewcIfvJo/G0gSoMMmVxdercdN35tkMjeUkQftBWw0iLS26JRBAQOFGF02XmSut+9NziJ8xqhBBz45013hJxJc9WW4vlSKD4ca6ip0XxxaW/OL4sjihsa0dAZjHYnSS9Q2bot0+evx+sdxE+9aakkenG5KM7V22FC6ErrTOfCTlfZUYn+oJFV7tT6r7P8Vln2/9RAzYpVeSN41fzTkSrQy9yuzNugcwRPu5uEFQ6va8jUOs+OcqBfV/Aj9RvHjX53vyEVcpAn9YoJG/uPI/Attde/p1gRe6ewgObfrHRVN
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 17:07:10.0178
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dbd6ad42-7cfc-4f35-6a31-08df49843603
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF00022BD5.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7638

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

