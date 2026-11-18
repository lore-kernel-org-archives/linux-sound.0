Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.57.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794998753;
	b=DevxakMzeZ1jkvKsmeF/+JD4jHjeGa5LbkP5UmWvSjfVBuR5poeocmMOr4hjWmuy2I+7
	 3gPxd5kF1MLjgHzxAR3bhqXBk9oTV1h2M+Bbyt3Sc6vYTbBL0fJ0YJbE1vu6PB+afRUFj
	 1EQoOkKdT3/0KnzT4XffQLLkAvf7YHS213bJr4FclvdOXkRFGgSMA7OzeiXNQjHXNTg6D
	 qdyvGrblbpAPfL+nJ2Px/65bVDaE2PeRZHlTSLLPPEIioqnmcALExrszEj4PcDRedNu0x
	 qiaMF7+lgPejYPqCZiWZD3RIrz61+qBrWrnnBxo2W0Ip/sWJyDeF6gSfGzPioW2Gt3Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794998753;
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
	bh=/AL7G4V6RNKC3iDTwyfysmZ7mMSDhnqZKRqQUFVlBuU=;
	b=uL71XT6FGhcc3K9A+t89Y8BnLQGP9+KhHynDEv9yrhcJQlHIPtTcWn4aaSMSVbg5aptk
	 He6QfVH3pQ5hCEdQfOYV/67Ka35UEd6AxRQIS333Aiix8Sca/mbpH/OlIMLg2Q9h7mBen
	 MPKzgq4NLSYOvG6qLtUw2VrMVa1pAnBzZFlPtG9+94UyBauNBXTb35MvnAE9NBAc7LO3g
	 PsVbbqSy9guq4zuOeISA/GCa3u4NxQZRkkZOAT7LYOA3wLJpRaR5k3mfBsj8KKfi+2dYS
	 79VveGA+gptZ+RtfQYxQxWtIkRcggIS2m/oj5M5fcr9Xga63L32/6X1GOBiQ5bI+h5A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=fGuWiTT7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.57.18
Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011018.outbound.protection.outlook.com [52.101.57.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1211C606A339;
	Wed, 18 Nov 2026 10:45:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1211C606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=fGuWiTT7
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TAuJxurjqNjwGDQMUI8k/P2ZsdYxgBtZh4TJdzmBZMxEetJRpewmFATwXisZ3q0/zHYCzeKsHDAy72yT2x3wuniKLDkiqjRSliULwKLyl/OaK1AgJ+8ZMF9LG8jfprJ1Ha/0FUt2p0U83+vPorC8V6G+omudEaNA+ydm76EPB9qWNkdSGG13J/k0wo+dMdWFJQj8lpmupfQfjAq6r+YWmdLel5vrHhfSB8CCcL3KrGw8wqe6bLfNsYiPzQU4Qc+q0N8UrlJrX+/aA9tsASO3oGAFywAy+eVfqGAkhzv+c8bMkchFEFsgQhLsTlDb2I2GeP87u5w6MuZ/X4gnxlVSow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/AL7G4V6RNKC3iDTwyfysmZ7mMSDhnqZKRqQUFVlBuU=;
 b=v3ySHcL1iYStWm516H3aI+8U6dtjxXUAWzo1ILWIvWEvbARu7FoJRZa/Gi1SLQ/NN8bv2cWZKNMEmyWCzle3WnxNyQ/z6wlFvASr1fknVw8ixffWS5sjTaNH3b5yfeer1wXnZj0EGJM5Df/4ewIb+g3W/1Hv/q2gnZ/zVrs1VM3aUDQAKzChBQm4FfAP9YqY7kHtCjvPOQTLGLOMDLbB+AdkmTAST8tS9cZkpFIWoLPyQi/hbnF5iRinqHEiF2HLtWWf4xAqPThu8xroUCdgtJqmLmMxvruAeMyUn0EGQGdGFfkl7uUrGVpyguLRMa2yFSG1mRH9L9BCAnhBJqyP1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/AL7G4V6RNKC3iDTwyfysmZ7mMSDhnqZKRqQUFVlBuU=;
 b=fGuWiTT7PV/Szeh3XJJTynHm7803WVtcgvW44dbLSPh0S+VEM/o2GvqXvn2U1zKLfZlozGDRm6WXxIDc/HZCgEj3C+tHTjXs+EgEuUOE62SbFFubcNOu+wqAsC16FHor/C3TriROYWimXCfgdnnR2Gv4jWgLg5tC7NQbSZg3kWM=
Received: from CH2PR14CA0033.namprd14.prod.outlook.com (2603:10b6:610:56::13)
 by LV8PR12MB9231.namprd12.prod.outlook.com (2603:10b6:408:192::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 10:45:48 +0000
Received: from CH2PEPF00016D49.namprd02.prod.outlook.com
 (2603:10b6:610:56:cafe::29) by CH2PR14CA0033.outlook.office365.com
 (2603:10b6:610:56::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Wed,
 18 Nov 2026 10:45:48 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH2PEPF00016D49.mail.protection.outlook.com (10.167.244.118) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 18 Nov 2026 10:45:48 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 18 Nov
 2026 04:45:47 -0600
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.57
 via Frontend Transport; Wed, 18 Nov 2026 04:45:44 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>, <Poojitha.N@amd.com>,
	<lee@kernel.org>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH v7 08/23] soundwire: amd: fix missing wake interrupt for ACP6.3 in POWER_OFF suspend
Date: Wed, 18 Nov 2026 16:12:27 +0530
Message-ID: <20261118104353.331556-9-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF00016D49:EE_|LV8PR12MB9231:EE_
X-MS-Office365-Filtering-Correlation-Id: 96dbd3d9-62d4-4d7a-dfdf-08df45611b6b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|1800799024|376014|23010399003|22082099003|18002099003|261009223027099003|261022105027099003|261021123027099003|261021121427099003|261026140227099003|261102123227099003|261028144727099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	reNhZrU3b2yXYw2VWgwLnDhQL3KfMDnef5vFFQ7gNHU++qkWRse2nOTvXYXpHMMNpVBxdiEEqAB6Vt6zELzNpyiDUhHsFN1g0ETtUUoRj8jQTrgfcXw2VAJ9fsaK76XOQ96EM/x2f3TTLxIgWPj95Z0Ttjha6LVBL0jdUYtK2WKR/t8yaVbrVBPgyfZHNBrFBvz24uzu3RNB5iVFUrqj5C6KTyoYJ4THaJeh4+mR1IIIgBXIHC1ck3h11TVHlmFLgPQB9BL+3YFnJ4w4HS09QvgHiFUHzzMvgbcf6jll7gCKr8A/etgUXuYpW3YaGXQTRhZGvRjBlJ3pW8AweIZ8bbyDKxOJ+ctfGP7ROxQCiFVUTxe+bYVgKOjP2HLBLSsL7hS874/+fPcOhMWQNd2xpdU+yWSsFsuoXm1Yt0JV7FCRRzZRAYszZ3bOPL1gatDuFy6GZjsxV0Iu3DNvaDKO3JhcAsAxWWOldya/pk+tZ1Xz9rKA1M8MJZwQxW3cq4ToRJS3jceoEy6pnegsV9o5jyMpXa6WNIcyDo/eNcwPyde0qCIX0khgruya9xl77jMAw8TLZZiueqXEzPcD97u527UQX/XTkWzt/C98g5YqOtIm0lZAJ2AhGA2U/MacK9x61Wq52Z7hq+kOwBA5QHoWEJi5MOdSbg0zuvZ/iQADn3DfG/kP8D5Ea/ox3X0j6tdGGjlwr1paWTylPdblHksL1Q==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(1800799024)(376014)(23010399003)(22082099003)(18002099003)(261009223027099003)(261022105027099003)(261021123027099003)(261021121427099003)(261026140227099003)(261102123227099003)(261028144727099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	rtWBiJSI/pDCCjzKiZSvlLTJYuciRWLTp52HPofIVLDUj2WnY+qnMI63Kvpq0Vyzeu2tBqyagQYh3MC8taENSmI7pXKCd0ELVAdU6lNpi9J10AL27IWSotS3yiOd8N/nGz/BaGa6XJ0x2V+Aa5IvQlbVgzCr2z/C0a3OOFSE8y3tTb2F13w+OXlWdQ63mwQg1ftvpX97eZGInkuvbN6tPfU2xZhkco/MZr9z7Z2Z7hqbBqM70MmWQ8OuTNb5D39WZ77xOQXkBjhY5D0s0qbSqQa3fHDfzIrXpc9GX4CkT/UAksrResejzYPTwfa9uipIBkSoTGHwLTgb2IeUL2bOAcQ9rzKJmZla3nMJeSToCixKB+9JGFvI0PtIw8RNutUuLlN3GhAwkxdlHKKI6rJMLwqBAmDIGmvcnsI2ruHGDuaWGfpfazMWwflbBpeL/xhO
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 10:45:48.3813
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 96dbd3d9-62d4-4d7a-dfdf-08df45611b6b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00016D49.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9231

On some OEM platforms based on ACP 6.3, with a SoundWire topology
where the UAJ peripheral is on one instance and the speaker peripheral
is on the other, wake events from the UAJ instance are silently lost
every time it enters POWER_OFF runtime suspend (D3) while speaker
playback keeps ACP in D0.

On ACP6.3, unlike ACP7.0/7.1/7.2, there is no dedicated host wake
interrupt path (no ACP_EXTERNAL_INTR_CNTL1 host wake mask bits and no
PME wake mechanism). The wake event from a suspended SoundWire instance
is delivered solely through the standard SoundWire interrupt bit in
ACP_EXTERNAL_INTR_CNTL.

In the POWER_OFF_MODE runtime suspend path, amd_deinit_sdw_manager()
calls amd_disable_sdw_interrupts() which clears the SoundWire instance
bit in ACP_EXTERNAL_INTR_CNTL. After this, the wake interrupt has no
delivery path to the CPU.

Fix this by re-enabling the SoundWire instance bit in
ACP_EXTERNAL_INTR_CNTL after amd_deinit_sdw_manager() and
amd_sdw_wake_enable() complete, when acp_rev is ACP63_PCI_REV_ID and
wake_en_mask is set. The acp_sdw_lock mutex is held around the
read-modify-write to prevent a race when both instances suspend or
resume concurrently.

Fixes: dcc48a73eae7 ("soundwire: amd: change the soundwire wake enable/disable sequence")
Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/amd_manager.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
index 438cf52a212c..3f3fffbd529a 100644
--- a/drivers/soundwire/amd_manager.c
+++ b/drivers/soundwire/amd_manager.c
@@ -1467,6 +1467,13 @@ static int __maybe_unused amd_suspend_runtime(struct device *dev)
 			ret = amd_sdw_host_wake_enable(amd_manager, true);
 			if (ret)
 				return ret;
+		} else if ((amd_manager->acp_rev == ACP63_PCI_REV_ID) &&
+			   amd_manager->wake_en_mask) {
+			mutex_lock(amd_manager->acp_sdw_lock);
+			val = sdw_manager_reg_mask_array[amd_manager->instance];
+			amd_updatel(amd_manager->acp_mmio,
+				    ACP_EXTERNAL_INTR_CNTL(amd_manager->instance), val, val);
+			mutex_unlock(amd_manager->acp_sdw_lock);
 		}
 		/*
 		 * For ACP 7.0/7.1/7.2: disable OE only; keeper and schmen remain
-- 
2.53.0

