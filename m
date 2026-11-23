Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.201.61
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795453728;
	b=wa+O+rqROtmHj81uxWyBw4ejY2ap7ipw0ydKF8A2GlR1oAEdCBh084qO4Mcs+B9ryHM3
	 FvbbG0j2YDUXMP/y4rE1OBwrOUH34n2JP/R4trtngenNJ2Xe1EolPUs73Uj5Sjm8uUr2v
	 ARMhuLN5GEkykBYwWavA21wQtMbGSeRs2G2oGRdVQ425VRw9LMdQbv5oZt0kvS23gbZ/5
	 ubEXYJZs83YXUshoPivfO8LjLkGvl0qQxqAE0oHkDBMCczKoOU+lrz0lJL43QqezjHaTL
	 BVLxw4kYYWx4s5x3WtLzEkDk4mAdg08ttkmkRU2uZjIDFZAUgZPvjqviQ927mTZ41NQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795453728;
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
	bh=XQiSWhckQPAPmEYjXIdOnHoIPJzeNiGq8T1n7vZv0V8=;
	b=lLMEyseKP4Qqpz1jRVHGcVG+L0fC8wAlajo7zPwkER2uufOjIiIOMEyN9dgRpa4UPVoD
	 fpIkgJlp2NDgg6DRoP2YlaQ6AMBTR47Kq2Djd58qG+vwuvuQcxfhuGYXQ/t4Pl/gmm9JL
	 71d49vfMrtZN/HZD+WVUfwUMhGZZYt2NFAu83x99q2tGPf3s/BGNNR3hq7IQHXSjQdPN3
	 hbPKugWqYpluc1xhrM6xYbjJ5ESa8alG0fbtkDxDWtQhv0VMKSqWDAZhmZD7U47UmEn1v
	 I0IGnRszO4Q4Y+xdNjgX7rCrdhSshyB9XcDvuoH1XC8hhhGiPXNizWn+3XCNM2i22NQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=v2XXJAJY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.201.61
Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013061.outbound.protection.outlook.com [40.93.201.61])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2F94606A321;
	Mon, 23 Nov 2026 17:08:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2F94606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=v2XXJAJY
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KTfhV7W6Z6fkW3OepRZw2rj7Q8i5GWMEPbuzvO9qnSfOIEBn6xeRhnYpqyuezgWubusL1o/CmQI0tscok/Dn1TAJBCqLLrROeP9r0g41FX5qhCYjYwXv5Q/UsWTy9gUSaULy7x1CGLlVVzbwtoJH6zbfllOQEAHqeGyQAyBrTAlDWF0z548nXyfrOciQ0D7N21X3GdNo5v9OF4Qgq/7BpkBE51SFUhhWAWDj5opl5O1QHDXz6MpQECKS3cPLPuWAhYKO3JPYLPENz9DCzJUJrRajnbR7C0Z0nh65xZ9FsNXw0Ov+nZc0dKZYjbVChBVmcs+4VsKWCgDvijBBsjguXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XQiSWhckQPAPmEYjXIdOnHoIPJzeNiGq8T1n7vZv0V8=;
 b=MJUMmanS8CGs+oPPJ2dZL5o2Br//HS0elQkzl/Ryc6qZIA7TKFf1//V6LhPOdeNCjvJGA876mKudn0b/IQxKQa0eIcmOHb57zjw9mpT9fxFDcbzW9J5sc2m0H3cC2GNDDZkPL5JUzRWeEySkOr/Jfp6kgn+jssvwQBBx8EG9HcZsouUA4OyMMkcOkaFdP2i38LtuhpItN7aXw51iOpbFPtFIttey4Xl8sx1aZ46+vDvRCzfNCQ7V08Qg51EomVRLKi1bZiGv/u2rp3l4qV3BDcTvULMy/0YnpNe1Rsgq3fCZIJdYLGqkf2RGNrd1e+mA1MJtf3cO4cfbnd5OOYK05A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XQiSWhckQPAPmEYjXIdOnHoIPJzeNiGq8T1n7vZv0V8=;
 b=v2XXJAJYc4aYSBgyAGuPJMoKoEj/bf9PjRLrCENEE3Bgza2SNI+tYfPDm/ZfBJHHMxbqN44NZyvT8QvrKnh1pD62mKs3JqtlHkcNZHIjPIEBUJIu42HVJRn5EDaBRcMmEvzb898jx8jD7ZdbGpizCr1h9cSvX4yjEfJgwUJheq4=
Received: from CH0PR13CA0039.namprd13.prod.outlook.com (2603:10b6:610:b2::14)
 by SA0PR12MB4446.namprd12.prod.outlook.com (2603:10b6:806:71::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 23 Nov
 2026 17:08:39 +0000
Received: from BL6PEPF0006C3E1.namprd02.prod.outlook.com
 (2603:10b6:610:b2:cafe::11) by CH0PR13CA0039.outlook.office365.com
 (2603:10b6:610:b2::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.5 via Frontend Transport; Mon, 23
 Nov 2026 17:08:38 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF0006C3E1.mail.protection.outlook.com (10.167.249.231) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Mon, 23 Nov 2026 17:08:38 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Mon, 23 Nov
 2026 11:08:35 -0600
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57
 via Frontend Transport; Mon, 23 Nov 2026 11:08:31 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>, <Poojitha.N@amd.com>,
	<lee@kernel.org>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH v8 19/24] soundwire: amd: replace >= ACP70 with explicit switch/case in PM paths
Date: Mon, 23 Nov 2026 22:27:40 +0530
Message-ID: <20261123170520.1380924-20-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0006C3E1:EE_|SA0PR12MB4446:EE_
X-MS-Office365-Filtering-Correlation-Id: db194f06-7fc9-4847-c5f3-08df49846ae3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|1800799024|82310400026|376014|10067099003|11063799006|5023799004|56012099006|261026121527099003|261026140227099003|261022075727099003|261022105027099003|261021121427099003|261028144727099003|261021123027099003|261102123227099003|261009223027099003|18002099003|6133799003|22082099003;
X-Microsoft-Antispam-Message-Info:
	lDeM3IC+IgqcSqp0rlq4otu9p7WrVw11ogCwoftlLOdyLGYKNhVZV7mWve467l7PkvdX+hG+8x2vU9R0zAZHOH7CZIzO/NGP2GKmQA3Yt71abthUYUloysAmaj2a0bq37p4Z22iS+tCvQcilsUUs4n2yL7g3zpoQdQHwZEz0n3965FvMhfqdp35dFRngmX8kBY9X/THW6Pz9lGTxZLI0VWUtEmRxE9v/trLTRxx7k1MCUQbVI8lHjSH8+9odwgMKHUq0OekpeI9QCbBUzSBJAq9rqUvmHaAROgTU/Gee7KBqd7bmW0h4k/84dnqFfnvHnOD1M96D4xk4VYOCaGCcFW1m88Sw+wSpW36o3KkWzKEyIjPc+OatF22d6gLxB6rknR2DMxyYgzyfhLumps1u3wwq7+6c6GHU+iACmzhX3Gm3bnku35PYzN+IPeGADKPmRb7GrXKPUv3IK7rk7VW9ngiMx1n+kZMXbP/WfInojRHOMeCpStOESAn5z8PHqdHMexBTJjHAoUWJ9hbFaMJmlf/SN8d5yTYLLYVYCLAQ5cUlQO+mUcj20k5cC4x+R9Puw3bAM0WgmXFGRF/STe+TtC6vk9gHFzKHGeyG2QaocLFJpYleW5Ug456yHk6gwyyXlAUdYfEH5N6gEAhHLDD4bNaj9w9kg1lpXDMJvCVdoY4IPZXJ61u3m3Zovv47pYOQO1A1lCHbcZ5ZkI7as7XqTQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(1800799024)(82310400026)(376014)(10067099003)(11063799006)(5023799004)(56012099006)(261026121527099003)(261026140227099003)(261022075727099003)(261022105027099003)(261021121427099003)(261028144727099003)(261021123027099003)(261102123227099003)(261009223027099003)(18002099003)(6133799003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	FZaX9TwlXzoESnq3y4NQixFPne/3iFyzb7uheq6TtaPOep9CPDnGSsNE1lNjsSuI6LxnTPBAjjUiqnAWoATcNxAQTfRJvL/AV5gSDYckiIKGJ+I0OD+eyE5qjIObzv5SvBou9eAGxBizjDKiWdw9fApIlE7/x5Ibpn5nD0ewk2I+11h1Y2IZNuxtwxmR9dIea9CYrhlcU0pRMPYkw2li/NRJPhRuftqOpTh6J2ijk/vo5o+BAhTbGR82YoJnLf8hBC/ri587S+CO0JROwNEfbyVdEgRuRNb91T+lx8wKgZQHaamUTIKMDy8hCFXO2wYlJeBrBKIGM4RgqLaqAIquLokVS+1TeWWK1XCgk33gEeaVnyPW54slIER7SybMSW84AulkgMJcnR8AZ6GLjuA25kM+Sb2xdfSWZpCJjc2MMdodRwsggpiT38PMaHsKiabA
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 17:08:38.7297
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: db194f06-7fc9-4847-c5f3-08df49846ae3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0006C3E1.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4446

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
index 5786eb312e6e..f9e99c682839 100644
--- a/drivers/soundwire/amd_manager.c
+++ b/drivers/soundwire/amd_manager.c
@@ -1420,6 +1420,23 @@ static int __maybe_unused amd_pm_prepare(struct device *dev)
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
@@ -1435,22 +1452,18 @@ static int __maybe_unused amd_suspend(struct device *dev)
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
@@ -1468,10 +1481,19 @@ static int __maybe_unused amd_suspend(struct device *dev)
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
@@ -1490,11 +1512,9 @@ static int __maybe_unused amd_suspend_runtime(struct device *dev)
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
@@ -1507,12 +1527,10 @@ static int __maybe_unused amd_suspend_runtime(struct device *dev)
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
 			writel(0x00, amd_manager->mmio + ACP_SW_STATE_CHANGE_STATUS_8TO11);
 			writel(0x00, amd_manager->mmio + ACP_SW_STATE_CHANGE_STATUS_0TO7);
 			WRITE_ONCE(amd_manager->interrupt_enabled, true);
@@ -1530,7 +1548,12 @@ static int __maybe_unused amd_suspend_runtime(struct device *dev)
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
@@ -1542,6 +1565,10 @@ static int __maybe_unused amd_suspend_runtime(struct device *dev)
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
@@ -1563,11 +1590,9 @@ static int __maybe_unused amd_resume_runtime(struct device *dev)
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
@@ -1587,11 +1612,9 @@ static int __maybe_unused amd_resume_runtime(struct device *dev)
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
@@ -1617,10 +1640,19 @@ static int __maybe_unused amd_resume_runtime(struct device *dev)
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

