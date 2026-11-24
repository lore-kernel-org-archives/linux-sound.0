Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.61.32
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795510388;
	b=V5I5plYrNO7qIdfmyupNVowwYGqkUH7WA0o4Qc+jkmVVAxGA24eawrwpwwG3r2X71xa0
	 fuS2I3kGWX5WGE8Po5KDqZN6qdtFadhsmDJchDr4jmMylGi7FUAmmBMvebQKlJ/6SbHvK
	 eEbIP3sujtjNl7VgdyinsC6OLJJ8U0KrxYTHc8F9fPpFWeW1No1jKMuqYXCOMw3N8KtnJ
	 i4AxfDPczAi+QH/B423TX/Lmp/fr+TC8hmV7EGV3ji5hMonm6T1e7JdvczQ3TzCRrxhMg
	 WrgVnN698jHvpjcs2SMd25SHfbQdJNBHXp8ygwnGM1ZtX2nSRM3Bp0Z7ZNuL25RvlyA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795510388;
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
	b=MGSoNxVSW8n/jHuOPJh/UUvOyyzzTCSCBNhPyU3vdxOVQaP59kNynnrLWBsPiSLHoveD
	 fYBUpdVIXTJdcpxEFSmmGM73wQSl/dCsAKCKJ2Pqy6XJZEoYQ3Fiz44XPbpH7eBpJTQaJ
	 frMR12Ma9+2DuZTc5JEVVZXc0AqIE3yGMLDuAuDCLV/4SteqN3pD6TKZ3hq5StE5shW6K
	 XwrZbYKItVAasnENp6I5h2D6WZ+9q8sFEsR5IB6KR1EQj/bfIm7hE7qhtLdkAIjVid69f
	 POedhebh1cEptQ1cyqwD83yRVu3eXMc1LG+q9pGM+eZyvALNjhuSXKtoh17OhHXGSwA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=C+9IR0ac;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.61.32
Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010032.outbound.protection.outlook.com [52.101.61.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC5EA606A334;
	Tue, 24 Nov 2026 08:53:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC5EA606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=C+9IR0ac
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lmCXeouG3WXzgbLHeySIJf1qRehNaPUZt64wP+y9p5kw9eos5n0JImT3ZfV+sktgmLGiGxkgvjNy4QW83aAWWEyWkIVwZIk7J67Nr8AGUVBrPV1yTb0QWg7EJNev9NLvIvg1lF/A4t79Y5q2L+3iOMxs3r8tXBdEGS4Qk8fRlL+6SBjROlXWGD4xogdcMD4ciFXrQjExd8MDzWntt+KVRG7LKXq7xXlp/glGCbrIZ7+gmxEGcx9yGUYhSJLehsL88WRlRQdnufZNKtwXEUDlrOOcWRKEcKD8gK1On3F1XFaRkaa5yH3E6c7r92pkc/gAddG003KlqKAYehg1+VHVrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XQiSWhckQPAPmEYjXIdOnHoIPJzeNiGq8T1n7vZv0V8=;
 b=mlhpjvTsxCY+NPwfKKETRAqG6E173mPpdGoouyWXNalG3gOf7agwkbhgDknJR935Yi14DOAIN39ZpasTcLYvQS9RmV6Xw5WMuj+s96fs+63NytSOlNeNtUEkUHjYKCSj7yGeU+FRyLHq4PPXNV5jbgLa6HWOUr7M4Pd+9yEi449kxry4MLNtzZN2y+RkgrzHbD4lgx40fq+WAGOQFUdJDIBm7QPrMaNjNtnGOOzkjQH/ySNwQdqgmlnW0U/ezjVrH/GGHvCZBiLBkVQ4lmAw5hnc/TxPUr1Dt9XHBgCWT8uCl5wqGA69m8o2zTZop5iheKFSWtgvLIQ/Y7OthO+Ayw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XQiSWhckQPAPmEYjXIdOnHoIPJzeNiGq8T1n7vZv0V8=;
 b=C+9IR0ac2Hy6r8oIL+PKsBse+LL9cZj/1w9ALFFUaDzMur5ZMEbV0d1g8t0hlvWn4pl5RsOV2PEXgJFSql9tBsHi0lAPJIupAiYi1cPnR/LjsjcjiGX5mTmP6GjKyS60LGza9Rsj/ZUh6haXAtNazcb4vHYBsehffNxMvGXccfo=
Received: from SJ0PR05CA0042.namprd05.prod.outlook.com (2603:10b6:a03:33f::17)
 by SJ2PR12MB7920.namprd12.prod.outlook.com (2603:10b6:a03:4c6::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Tue, 24 Nov
 2026 08:52:57 +0000
Received: from SJ5PEPF0000020A.namprd05.prod.outlook.com
 (2603:10b6:a03:33f:cafe::80) by SJ0PR05CA0042.outlook.office365.com
 (2603:10b6:a03:33f::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.6 via Frontend Transport; Tue, 24
 Nov 2026 08:52:57 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF0000020A.mail.protection.outlook.com (10.167.244.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Tue, 24 Nov 2026 08:52:56 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 24 Nov
 2026 02:52:55 -0600
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.57
 via Frontend Transport; Tue, 24 Nov 2026 02:52:52 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>, <Poojitha.N@amd.com>,
	<lee@kernel.org>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH v9 19/24] soundwire: amd: replace >= ACP70 with explicit switch/case in PM paths
Date: Tue, 24 Nov 2026 14:18:25 +0530
Message-ID: <20261124085033.682755-20-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF0000020A:EE_|SJ2PR12MB7920:EE_
X-MS-Office365-Filtering-Correlation-Id: 3eca0a72-2621-4250-053e-08df4a0855e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700016|23010399003|6133799003|18002099003|22082099003|261009223027099003|261021123027099003|261021121427099003|261022105027099003|261102123227099003|261026140227099003|261022075727099003|261026121527099003|261028144727099003|56012099006|10067099003|5023799004|11063799006;
X-Microsoft-Antispam-Message-Info:
	b0dUraYLUAUNUyd8eif87/ukdN7RHtSVxsYCB/2U73TI/RsayidnFL2JnLepVbBGtrzF8CdTisW8fqndA5zlqc6FwuKhTIn9yXbQ/3iZaJ8LGgwSfzl+AAkCSzAvYXS5gK9M1HH2CGxnFSKOH0E2y8brjRCQtOJrihJUNXjrYPAx3367Dtoe6I0z7wI7WmoJVPRpyF7wjh42qBRchzXwYGnuCIRANgJXI8IaWAg/3cKQbYgDAZh5Mscxly4mY98gH+s7TkCiFouryUZs2OJhovVsT7CFzpjyymvbOQ4GXgs2bCZvBuPEBmQ/CvF0dRCaKHMeeuSjSU5N5hg4PrzbRVoJkbkSLuO1WzrLnhI5s4WtIZ1u/qbJ/NH54XPLsqhnU9FoshpZAcwwaJHBZ6oyKSq8dp5221t2JD8ECPgBfLjjR4w4KdK7WRL8Ve+CrDFPHtUrdwYG5FXoGDHlSNYLx6vGUKus/2RKjJDcm0Wv6VCFuNOP0Sg5811fBqbcqdK/qF+hPcND0dQb61w3ahuhTwmknYKvbHDKpEkaHr4qkR1vu5A4bAFmhIfc0vhYrSi4yxJNvO85sj4o9nY4DvESeoWIiZbuB12TUO4JBQudT+iaDnr//ce3XZJztV1Ta72jEeVLLx/K2Rk9IQbtERNeUbqX9YREmPgVrIkY7U1Et7m/uYdtVM/YxkfdQyG2tDOgULm8FWd2zOBuJetuvsMLBA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(23010399003)(6133799003)(18002099003)(22082099003)(261009223027099003)(261021123027099003)(261021121427099003)(261022105027099003)(261102123227099003)(261026140227099003)(261022075727099003)(261026121527099003)(261028144727099003)(56012099006)(10067099003)(5023799004)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	4nKIHkBpQCgVVhZPTOVpMNmtVnzskOm8CvyAQ1vQdt3lnNBxltnFrfFjvnpmtiGbLB8gcSnV/u4snvM7xexk94PUn+B7AW1pvmkFbfljB+netEAL5FqADmam+gvtZQ2+gJ2obeC0+RLXJkRY0efuaNUKVc9P6U9D/mp9QWfWUH00jEpDxlMHBsGdU4LEZZfyK7py0IQzkTnrrjS4tua1q4Uzw3zIxlWN5YkQ4oSwvjtBqezlCzcE7pSIELoxkQEKUPq0L8vYPU68uaZewJ5+nqXQBjvtgywZ+F46OsnrmiDswl6hJO1V+njegrAgFcQjf9gtsxYM74zAExC4Gi/Ze4DBQWD/Ra+q+aztcrT0CJDSVyOpH+T0uTdYyEpqFbZ/NPuxmEOwtHUFINJCndUwsHZLOHjOqDOsevWdcmzxIRZqlrhv4aVEgCTWKau1RqzM
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 08:52:56.9566
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3eca0a72-2621-4250-053e-08df4a0855e0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF0000020A.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7920

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

