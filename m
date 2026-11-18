Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.57.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794998798;
	b=sR42+WZplA+gtonX+J+SAck2MgvOoOEb5K4oYdPnFLmF8HoptJV7DBugcBPpjDdK05FG
	 FsJ5tfJyeZ+onzYksX+PEB6yOVXNICWYx/0nHekIyWvAH+6zip3LoFWUWlzHeid0TDmst
	 584mSDVhRBWKeQdvzlKfVFM2XisyAqM6mNQVQ08/1rJZFHpJIFsoZKGiKf9NPG7kBdLOD
	 IZhnr3KhlrRBxPwD8KeaEzDj+9ZjqVCfASWqk+tp075v5GTUrdshwZwGDF70+FOl6mmcI
	 NMKRY6h9+zaWysfKarbzoQXQoqRDehYk0T+HkoUWma0z3KxP88UqEyFdRP+Ahg3htkA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794998798;
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
	bh=nFSmXLmHoScE4eLJlC4En13jW+wNv8SJ4zoIxxc9288=;
	b=wOA6sMFk6HWStvFVW8TglXjqhKnULWtpK3wOvARjmGYW0TJMZX+7EmxjWa0R4L5wpzwt
	 3WQAsPjMpar2I4a626QOrxu1HH4RqLfYPLxePFSDrbvaSCERm8xmQAQaRoY4qjtrr3m8H
	 3SHV7/lYUKZ7kShy70787wX9dgVT51cQFG8+cXM6L4zWyc21HFEVOmAYZ9mi1X9sBX374
	 G/LZaAa5shcX1H+fRWwXfrAj1I67RcwR333+YvWCA3fItyqIDXKnNsXY407cdjM+lmWdJ
	 e5pDMgjuYc9zOJVgYcFnRiCFB8i45Ad1RrCQA6N8x0zGcbkkA2U+/32z71dML7vCp+g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=v6x76hTp;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.57.51
Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011051.outbound.protection.outlook.com [52.101.57.51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D9EE606A31C;
	Wed, 18 Nov 2026 10:46:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D9EE606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=v6x76hTp
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hMHYY4exe+T1Ia90GBFbiYycPse5+L78iQ9vjH9eDX52tD24TA84s2w/cn2RuKSBJPLPDOIMeQnNEHwAwWTnw8NyvODE0ZSbDLv/GJOwOxE/H6njJWkKIFynkqcCmzwQTp/LZ6jS+1+oKnMbW/5zIMu0u88omSSzDZk4EsnphbhodfQEKpu/MAeZuw2KlJ2CEwKhqKgrrWsaCdBfr5Adv3E5vx3V5VUUrPmR+7YuhSQbBrPhASfxyV2Br0kJZbmWF7hK5qOuls/SnHuRUX5Y5UNc7IOcTXba5FtBNQrO0Q6ZMjTXc9X6QEEYtJ6w5t7txf9+lPHooWxwWkJH0e6Z3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nFSmXLmHoScE4eLJlC4En13jW+wNv8SJ4zoIxxc9288=;
 b=X0JKduuSM0eSjSBNBfxTa6i1dwi0UOi+R0xeq8zuCAiBM2mOn2BY0QWrWXRgFtM9S5ntvcG6FnWyn8f4P9zrU+m9P8SlzvTmjcSBdn1rL8JWDUkIsnvYcXcE2UuLuElfRgYNXGwnH+dcNFAVXJm8RbQfkHdeiBNw3nAl8juqwj3+FaWPFCjQ/E9Aj8auHn6H/4mGjHMV8tWcuBmomV6+Zl9D46RWhv5xlc3stilmN+rwcdrZTphTAku9A/HUOO3pGdPCs3FhHrYrJWoJW70gq9QNuUt7MqYUlo0UVPdsjAr2cb2Y/ituZXA0rKtwNVnLFsNX0PikuZ1O1QKJ8YDgSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nFSmXLmHoScE4eLJlC4En13jW+wNv8SJ4zoIxxc9288=;
 b=v6x76hTpI0nwDYRLquhCMzrBj2D6dajq6sp9ElBi0dMtPuAUIblSYOnC6TLP/R+W0QDnI8suIuKDn3PYUTU4r8/BhVsnTE7JptgZAnK+zJkEmo7w61OIPvej7tlZJddnI+U26dROk2LCVzWjUg1KcgNa2MXiNXsXT9cj0HlepuA=
Received: from CH2PR14CA0034.namprd14.prod.outlook.com (2603:10b6:610:56::14)
 by IA0PR12MB8647.namprd12.prod.outlook.com (2603:10b6:208:480::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 10:46:33 +0000
Received: from CH2PEPF00016D48.namprd02.prod.outlook.com
 (2603:10b6:610:56:cafe::46) by CH2PR14CA0034.outlook.office365.com
 (2603:10b6:610:56::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.10 via Frontend Transport; Wed,
 18 Nov 2026 10:46:33 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH2PEPF00016D48.mail.protection.outlook.com (10.167.244.117) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 18 Nov 2026 10:46:33 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 18 Nov
 2026 04:46:32 -0600
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.57
 via Frontend Transport; Wed, 18 Nov 2026 04:46:28 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>, <Poojitha.N@amd.com>,
	<lee@kernel.org>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH v7 19/23] soundwire: amd: replace >= ACP70 with explicit switch/case in PM paths
Date: Wed, 18 Nov 2026 16:12:38 +0530
Message-ID: <20261118104353.331556-20-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF00016D48:EE_|IA0PR12MB8647:EE_
X-MS-Office365-Filtering-Correlation-Id: ce91e524-df40-4316-3b45-08df45613615
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700016|23010399003|22082099003|18002099003|6133799003|261009223027099003|11063799006|5023799004|56012099006|261026140227099003|261026121527099003|10067099003|261021121427099003|261022075727099003|261021123027099003|261022105027099003|261028144727099003|261102123227099003;
X-Microsoft-Antispam-Message-Info:
	ELcNLhc8exh+nTObWmQDN+Hqi9MLP6KrUSx6Q5uNzJXFAyWpGJ2X5frEmvetpkWRohOR3HJ6coKAcTQoUrEjifAL7TzOAZ/oVqFrEV2ps4+1EjzBFFrnYjPVDg5+oOtewFFo4vhjei4qdRfJaQCmQqYTye2oZKGJ+ihw68HFNdoNE1RKvEJUSwi+ZLz+5VN/h4TzEAbLiD850r8b2MRFgdPEDA0hrjtcwkBUFAYhwBKDz1p4hnu+zQ2ONJi8e49EqptlNlkRA2Nt2FzHCq1oE6Ulld1FS2tMAppVSppzc0R56VWTv/yQ8UeLNKmzl7Nacytit+XEAoHxVbMGMuxizOvq/Po3NNh9OLM2u2ux6LZoMq2wboSMkh7zw0bOSiW4gwocnW5N0nhdIt7FCXY6hW2xRutanxfcSTtoRTlH5ZCb03WjFnNRmLmmgYbzYgQQYKcoxFQ5zLAiF1MUe3jPSuyIdPhW00SxHRpgy3sxvrY2u1e75RXDudsbTLpUaE36WEVMthwDxvoiwJNAYM4eFIAv3QsbfUeRjK0py7VippDLfrJC1IEBqqHSAnU3nSnuCbZec7VylWmy2htWVbd2opXP+bhFVfB9zUxr+jAvnxms0r7LS6rTmzel/NIesXXpmVej1pg2fTqE2dHlxytiG6+Ued623BbszzxNQeMiGjgYczag34Mu111FNH582jXW3GCuAVR0A//LFRNKAqchYQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(23010399003)(22082099003)(18002099003)(6133799003)(261009223027099003)(11063799006)(5023799004)(56012099006)(261026140227099003)(261026121527099003)(10067099003)(261021121427099003)(261022075727099003)(261021123027099003)(261022105027099003)(261028144727099003)(261102123227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	t7whRdXPdGjSEA8klOCbSzSY+Bb95zRO6y9EsVSPJOK880bqg0z5kWCiSrc8V25Iivmpw0KlN/0Hk+lMNSzBvmE3hJkwUmrsClvxWWVXvafSoK4M0kFuqEHR1mAn0SWq/Wez1a0BMhqVsw/CxXDScxCfbbprJ8bt6Lamwe3UCRTuN9u3zhEV+X2qrg5pgNE4UcHNRO/yH9vuZWOjBw+fy4hR2SmGyLaoK4cQgyCo+WN4cElFY5o+L30rrUVJMmzrk/FHUkoMiuOhtpIMK2Yw17AI7+g5UkhsSDH78S8aLjSOLBd99LtYD6MCZeR5QSMewZeXgTJQxM3j1v/pAfold3HmlQD0lvqP8nakWp25rrjXFgFV+Bog9ClC9OxoNio34dAMm8Nv7zj9vfUEjTeiVmkCiLFK+3K9E3jdaAoVIfZBO6toJdXU4+ajH+N+XGgl
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 10:46:33.0850
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ce91e524-df40-4316-3b45-08df45613615
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00016D48.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8647

Replace open-ended acp_rev >= ACP70_PCI_REV_ID comparisons in
amd_suspend(), amd_suspend_runtime(), and amd_resume_runtime() with
explicit per-revision handling enumerating ACP63, ACP70, ACP71, and
ACP72, so that every supported revision is handled explicitly.

The host wake enable step is guarded by acp_rev at six PM call sites.
Factor that repeated block into amd_sdw_host_wake_enable_by_rev() to
avoid duplicating the switch/case at every site. The remaining device
state transitions keep an inline switch/case as one of them carries
additional PME handling.

An unrecognised revision cannot reach these PM callbacks because
amd_sdw_manager_probe() already validates acp_rev with the same switch
and fails registration for anything unknown. The switch default therefore
emits dev_err() and returns -EINVAL to make the unexpected case visible
while keeping the error path consistent across all PM operations.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/amd_manager.c | 100 +++++++++++++++++++++-----------
 1 file changed, 66 insertions(+), 34 deletions(-)

diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
index 3c5a9c7c6c4c..ecef22baffc0 100644
--- a/drivers/soundwire/amd_manager.c
+++ b/drivers/soundwire/amd_manager.c
@@ -1401,6 +1401,23 @@ static int __maybe_unused amd_pm_prepare(struct device *dev)
 	return 0;
 }
 
+static int __maybe_unused amd_sdw_host_wake_enable_by_rev(struct amd_sdw_manager *amd_manager,
+							  bool enable)
+{
+	switch (amd_manager->acp_rev) {
+	case ACP63_PCI_REV_ID:
+		break;
+	case ACP70_PCI_REV_ID:
+	case ACP71_PCI_REV_ID:
+	case ACP72_PCI_REV_ID:
+		return amd_sdw_host_wake_enable(amd_manager, enable);
+	default:
+		dev_err(amd_manager->dev, "unexpected acp_rev 0x%x\n", amd_manager->acp_rev);
+		return -EINVAL;
+	}
+	return 0;
+}
+
 static int __maybe_unused amd_suspend(struct device *dev)
 {
 	struct amd_sdw_manager *amd_manager = dev_get_drvdata(dev);
@@ -1416,22 +1433,18 @@ static int __maybe_unused amd_suspend(struct device *dev)
 	if (amd_manager->power_mode_mask & AMD_SDW_CLK_STOP_MODE) {
 		cancel_work_sync(&amd_manager->amd_sdw_work);
 		amd_sdw_wake_enable(amd_manager, false);
-		if (amd_manager->acp_rev >= ACP70_PCI_REV_ID) {
-			ret = amd_sdw_host_wake_enable(amd_manager, false);
-			if (ret)
-				return ret;
-		}
+		ret = amd_sdw_host_wake_enable_by_rev(amd_manager, false);
+		if (ret)
+			return ret;
 		ret = amd_sdw_clock_stop(amd_manager);
 		if (ret)
 			return ret;
 	} else if (amd_manager->power_mode_mask & AMD_SDW_POWER_OFF_MODE) {
 		cancel_work_sync(&amd_manager->amd_sdw_work);
 		amd_sdw_wake_enable(amd_manager, false);
-		if (amd_manager->acp_rev >= ACP70_PCI_REV_ID) {
-			ret = amd_sdw_host_wake_enable(amd_manager, false);
-			if (ret)
-				return ret;
-		}
+		ret = amd_sdw_host_wake_enable_by_rev(amd_manager, false);
+		if (ret)
+			return ret;
 		/*
 		 * As per hardware programming sequence on AMD platforms,
 		 * clock stop should be invoked first before powering-off
@@ -1449,10 +1462,19 @@ static int __maybe_unused amd_suspend(struct device *dev)
 			amd_manager->pad_fully_torn_down = true;
 		}
 	}
-	if (amd_manager->acp_rev >= ACP70_PCI_REV_ID) {
+	switch (amd_manager->acp_rev) {
+	case ACP63_PCI_REV_ID:
+		break;
+	case ACP70_PCI_REV_ID:
+	case ACP71_PCI_REV_ID:
+	case ACP72_PCI_REV_ID:
 		ret = amd_sdw_set_device_state(amd_manager, AMD_SDW_DEVICE_STATE_D3);
 		if (ret)
 			return ret;
+		break;
+	default:
+		dev_err(amd_manager->dev, "unexpected acp_rev 0x%x\n", amd_manager->acp_rev);
+		return -EINVAL;
 	}
 	return 0;
 }
@@ -1471,11 +1493,9 @@ static int __maybe_unused amd_suspend_runtime(struct device *dev)
 	}
 	if (amd_manager->power_mode_mask & AMD_SDW_CLK_STOP_MODE) {
 		amd_sdw_wake_enable(amd_manager, true);
-		if (amd_manager->acp_rev >= ACP70_PCI_REV_ID) {
-			ret = amd_sdw_host_wake_enable(amd_manager, true);
-			if (ret)
-				return ret;
-		}
+		ret = amd_sdw_host_wake_enable_by_rev(amd_manager, true);
+		if (ret)
+			return ret;
 		ret = amd_sdw_clock_stop(amd_manager);
 		if (ret)
 			return ret;
@@ -1488,12 +1508,10 @@ static int __maybe_unused amd_suspend_runtime(struct device *dev)
 		if (ret)
 			return ret;
 		amd_sdw_wake_enable(amd_manager, true);
-		if (amd_manager->acp_rev >= ACP70_PCI_REV_ID) {
-			ret = amd_sdw_host_wake_enable(amd_manager, true);
-			if (ret)
-				return ret;
-		} else if ((amd_manager->acp_rev == ACP63_PCI_REV_ID) &&
-			   amd_manager->wake_en_mask) {
+		ret = amd_sdw_host_wake_enable_by_rev(amd_manager, true);
+		if (ret)
+			return ret;
+		if (amd_manager->acp_rev == ACP63_PCI_REV_ID && amd_manager->wake_en_mask) {
 			WRITE_ONCE(amd_manager->interrupt_enabled, true);
 			mutex_lock(amd_manager->acp_sdw_lock);
 			val = sdw_manager_reg_mask_array[amd_manager->instance];
@@ -1509,7 +1527,12 @@ static int __maybe_unused amd_suspend_runtime(struct device *dev)
 		 */
 		amd_sdw_oe_ctrl(amd_manager, false);
 	}
-	if (amd_manager->acp_rev >= ACP70_PCI_REV_ID) {
+	switch (amd_manager->acp_rev) {
+	case ACP63_PCI_REV_ID:
+		break;
+	case ACP70_PCI_REV_ID:
+	case ACP71_PCI_REV_ID:
+	case ACP72_PCI_REV_ID:
 		ret = amd_sdw_set_device_state(amd_manager, AMD_SDW_DEVICE_STATE_D3);
 		if (ret)
 			return ret;
@@ -1521,6 +1544,10 @@ static int __maybe_unused amd_suspend_runtime(struct device *dev)
 				dev_dbg(amd_manager->dev, "ACP_PME_EN:0x%x\n", val);
 			}
 		}
+		break;
+	default:
+		dev_err(amd_manager->dev, "unexpected acp_rev 0x%x\n", amd_manager->acp_rev);
+		return -EINVAL;
 	}
 	return 0;
 }
@@ -1542,11 +1569,9 @@ static int __maybe_unused amd_resume_runtime(struct device *dev)
 		ret = amd_sdw_clock_stop_exit(amd_manager);
 		if (ret)
 			return ret;
-		if (amd_manager->acp_rev >= ACP70_PCI_REV_ID) {
-			ret = amd_sdw_host_wake_enable(amd_manager, false);
-			if (ret)
-				return ret;
-		}
+		ret = amd_sdw_host_wake_enable_by_rev(amd_manager, false);
+		if (ret)
+			return ret;
 	} else if (amd_manager->power_mode_mask & AMD_SDW_POWER_OFF_MODE) {
 		if (amd_manager->pad_fully_torn_down) {
 			amd_sdw_pad_ctrl(amd_manager, true);
@@ -1566,11 +1591,9 @@ static int __maybe_unused amd_resume_runtime(struct device *dev)
 		mutex_lock(&amd_manager->bus.msg_lock);
 		amd_manager->ping_slave_stat = U32_MAX;
 		mutex_unlock(&amd_manager->bus.msg_lock);
-		if (amd_manager->acp_rev >= ACP70_PCI_REV_ID) {
-			ret = amd_sdw_host_wake_enable(amd_manager, false);
-			if (ret)
-				return ret;
-		}
+		ret = amd_sdw_host_wake_enable_by_rev(amd_manager, false);
+		if (ret)
+			return ret;
 		val = readl(amd_manager->mmio + ACP_SW_CLK_RESUME_CTRL);
 		if (val) {
 			val |= AMD_SDW_CLK_RESUME_REQ;
@@ -1596,10 +1619,19 @@ static int __maybe_unused amd_resume_runtime(struct device *dev)
 			return ret;
 		amd_sdw_set_frameshape(amd_manager);
 	}
-	if (amd_manager->acp_rev >= ACP70_PCI_REV_ID) {
+	switch (amd_manager->acp_rev) {
+	case ACP63_PCI_REV_ID:
+		break;
+	case ACP70_PCI_REV_ID:
+	case ACP71_PCI_REV_ID:
+	case ACP72_PCI_REV_ID:
 		ret = amd_sdw_set_device_state(amd_manager, AMD_SDW_DEVICE_STATE_D0);
 		if (ret)
 			return ret;
+		break;
+	default:
+		dev_err(amd_manager->dev, "unexpected acp_rev 0x%x\n", amd_manager->acp_rev);
+		return -EINVAL;
 	}
 	return 0;
 }
-- 
2.53.0

