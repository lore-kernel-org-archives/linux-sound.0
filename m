Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.62.10
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794998818;
	b=qdh0iM4Kpa9DYAJGmBL4mDQtTpeneKE1zUNuAhrKPGSJ0SRA+t8gM7SfNuHfXSAm3Cl+
	 32Voow385Nlht57nHZgzrEDA7iFXp151XX5DYUvBQIAo2tN0sFZsFO72xrTlkjTi+H1Jz
	 I3UdDxdPNA7vk/9vD15ZZmVHBLLp9W3S8Y5loNPHOVR3OG4UBjhYgMhgNk+D3j7jNbXLQ
	 XNjeSL26n6T5ZKgRIndpVGU2O2ARPrFrhSiB5SPJECZ3WVBIARQeX1a0GMacosPMFuz3h
	 Pom7sMD4iJHKD55eqOdegKMyJ4CZLK3uHGP2RE/iPUO2uKxbI2rrruG43e8MdYfmf3Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794998818;
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
	bh=XG0yPFSSt6cvDdmxWhUYyIBEyI7ztazvAOPu7hfT4hc=;
	b=UFDIjhbwErHV1df5sx/PE/Rph8Bvn98WU3xqUxVxLb58xju/uRut/CyzlFlWz0ENRbiq
	 K0UoNci8S0hLW0R/QCnMGhZPMrv+30ezWeaW5lU8nCrNkOkoXJWRcyMvYDytTl/Vs0BkW
	 sQQtf84t7ROuEi0fZ+ZQb6meQsDRi0p0uCIPUkPMOgwMQ8R65RnPjiSrAKDOF9MMl6Y7c
	 dH3bl5BHrT4cSwErO44yYm7W+uxikrW7uSJynVzYxJKgZ2VfUAdzFMhzsx/bNCzvtv62y
	 atwnTvILIvY24NdlesE4F6IFsBd+vThkGQ0IfdgJofmnAeDD7MaWWcyVhnCkfApyNrg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=VJRtJjbV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.62.10
Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011010.outbound.protection.outlook.com [52.101.62.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F521606A320;
	Wed, 18 Nov 2026 10:46:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F521606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=VJRtJjbV
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PxItyyaKWnUCGUcHmTavEVwKqa9MtEKdsmKIVkvOEkX6imaAsztud+RgAj9WHVH18Ncx7YylkE0VLaWXm4fB8t2UGuDT6uhNn2gRmCknnNdQwQZHp7mM9yF45pa6PrcqnfJ7fmlSS9/8oIQsMh+U6h4P77VYpk9RmwhWdweSzebwKug58jSbj2gKkpsycTyr6qysWkU2zfXfJ1KitUrfus3yL+h1b0JOyEBDv68NaZYWwQTJNGr+BHrjQDNH6BmjlXwhqV6LcXu5DighN4o58kZlmnD+2CxSH2G+0NKmkEWCW4pS+8p5kmfggszMQ0438SsQ88nbHgfQGPxMVbEmUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XG0yPFSSt6cvDdmxWhUYyIBEyI7ztazvAOPu7hfT4hc=;
 b=YV7B3zbgvYtChQ5HTBBwn781Tg09eWpvDcxax8UQ3mG9ppsVVYn8MycUr6zSsLCyT07SvaoiumA3O2yHiyW9MxiS2wGJjNbjZK5YJSh3W/dLy/jD/QkuAs26hSbIiOT6ir1x7sc+IK3SnIDaJ0y92vQVX4WK9w8YB3e4v+LMbXtE5PZ/DAQ5aiqB1ZCMGR1YoSAA12R0flUc/8W/854MY9WFzgWteLD05oqcrs6ye83CYCNwQX8+Irs4IcnqGSYEB1ji9emySfcBokFQrFyS06Of+zeGuzvM/VLlxgacwL5YAme6gkCrzCM9v1jmPs6OW3G6vf+7qBJso4Wc9tTNsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XG0yPFSSt6cvDdmxWhUYyIBEyI7ztazvAOPu7hfT4hc=;
 b=VJRtJjbVi2VjTmT5WjunXLHN5i5XpeUg4JJDw+Qm1LakA7zFh/55Em1/on8h7tkcfIHcPyqbIEparRDAIGVehDk+QE2XvbD/4+1v59hwPwgHslPXfKPtfMf3vAYDWMchdD44R8HuwPvyW/TKL8Y5kgxKuEvsb2AZTBxA0An98ug=
Received: from CH2PR10CA0005.namprd10.prod.outlook.com (2603:10b6:610:4c::15)
 by CY5PR12MB6249.namprd12.prod.outlook.com (2603:10b6:930:23::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 10:46:29 +0000
Received: from CH2PEPF00016D4E.namprd02.prod.outlook.com
 (2603:10b6:610:4c:cafe::64) by CH2PR10CA0005.outlook.office365.com
 (2603:10b6:610:4c::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.9 via Frontend Transport; Wed, 18
 Nov 2026 10:46:29 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH2PEPF00016D4E.mail.protection.outlook.com (10.167.244.123) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 18 Nov 2026 10:46:29 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 18 Nov
 2026 04:46:28 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 18 Nov
 2026 04:46:28 -0600
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.57
 via Frontend Transport; Wed, 18 Nov 2026 04:46:24 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>, <Poojitha.N@amd.com>,
	<lee@kernel.org>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH v7 18/23] soundwire: amd: drop amd_deinit_sdw_manager() in POWER_OFF suspend
Date: Wed, 18 Nov 2026 16:12:37 +0530
Message-ID: <20261118104353.331556-19-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF00016D4E:EE_|CY5PR12MB6249:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a494d74-d7d4-4268-bbb7-08df456133c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700016|23010399003|6133799003|22082099003|18002099003|261009223027099003|11063799006|56012099006|261026121527099003|261102123227099003|261021121427099003|261021123027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	Q7VKaHrvw8fQ6MCPdTJ/AF9JTznWSwBjF5RcMg5RAxhcQd4e5f58sl55K0pqwYgPi5d40T0StRMRq7FdSICOws4MzMhBrejJufD15MaQe4qtIRFR2tjcmsMbTm0EFHrVgPmWdwrugXqXBFHdjtswEKpHEWBTE4J2KvMZhwJz+UqfLfPqq484ck1G8eoh0R/xVgpIArc3lcfkYD2S9yCiNHfzs2/cp7zPUuXpwnVY+W+VzmNbnJ0XgTDfhpJov4NVfY2U9YHHzE4YkqQhbe1PlLZGjc2QnP/rG5mVkjOkTYeE8KMHQ9y1as3J0SyGitomBz0rUcmQC0B8/S0d6HJo52vEDu8FG1Ld1Z5nvr/FCM0QbXRK8W+FxjI/k5Wb6rJYWTm6L32hlFeBgqLEza8LpCUjGNuLnyRCqZxVZbm/x3tJvFZE36vcmwkQ+UwzTi7dzix0rIHfFs60ejYjUTquu21HhOfQ9O3DWJrAD7XfOxN1Q41rd58B81Ksf9O2GudPURRA7cViwEq5Gavdn9eBajDghu18CJR3E+ioky4smFOvo910y/DVd1vU1kvFOSi1mv9vBEtHcOsmtCbkSWbz4g2bcubi6TlgkuVqlk7R3zsQzw4dRTbuhuNvTbvQdoDVES7WmlzQ77zpEMUcD8UKkxY0ALnUGgvA7Eo4UdJN3dngX1GPUkXMD5o2KC1LxPLMFirQ+dIXVbsZo5vb8KW6gw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(23010399003)(6133799003)(22082099003)(18002099003)(261009223027099003)(11063799006)(56012099006)(261026121527099003)(261102123227099003)(261021121427099003)(261021123027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	MjWnmvYMcf7Xl6XjKpDZzAtkgTr6ycxireSaTorpRWLj3YzaUC4xovKiXnQSHyweR1IljO8VgZFFjTcymxHLpNjRm12qCooSNs6qkaviZXLFsiE3SsO8QmKEcDbwM61TMXtE4GSJtqQ7la3Jmyu6CA3qkbB1deZmb/pUociHuUl3YeLri407IU9aH/m9hTIehb4NO8EZ5Aff3ovi5QeSp4U5VBQeYOoYP5E9HBKP4FfuhErmN+03sjO8eLPyjN5jgulKYRsqXouWHX9Q3tP969LHB7g8J8SI+mY5St6l9JCL9buVnUDCk3PfUNw9XR0OnwzR44s8xmKqPZ5yfKhkxqyoHPCrriS6deONCqYtJZCY40Z/UActX1NZltMUI8OC2A+8v5TGCfVX/v9PTq/jArU1IpzTvjcZc9OM6wkWQGTQ9jmNjyCjza9mrfIJEhdL
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 10:46:29.1893
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a494d74-d7d4-4268-bbb7-08df456133c2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00016D4E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6249

amd_deinit_sdw_manager() was a small helper that bundled
amd_disable_sdw_interrupts() and amd_disable_sdw_manager() together.
Expand the two POWER_OFF_MODE call sites in amd_suspend() and
amd_suspend_runtime() to call those two functions directly, then remove
the helper. No functional change.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/amd_manager.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
index 934a8f0f3298..3c5a9c7c6c4c 100644
--- a/drivers/soundwire/amd_manager.c
+++ b/drivers/soundwire/amd_manager.c
@@ -159,12 +159,6 @@ static void amd_disable_sdw_interrupts(struct amd_sdw_manager *amd_manager)
 	writel(0x00, amd_manager->mmio + ACP_SW_ERROR_INTR_MASK);
 }
 
-static int amd_deinit_sdw_manager(struct amd_sdw_manager *amd_manager)
-{
-	amd_disable_sdw_interrupts(amd_manager);
-	return amd_disable_sdw_manager(amd_manager);
-}
-
 static void __amd_sdw_oe_update(struct amd_sdw_manager *amd_manager,
 				u32 mask, bool enable)
 {
@@ -1445,7 +1439,8 @@ static int __maybe_unused amd_suspend(struct device *dev)
 		ret = amd_sdw_clock_stop(amd_manager);
 		if (ret)
 			return ret;
-		ret = amd_deinit_sdw_manager(amd_manager);
+		amd_disable_sdw_interrupts(amd_manager);
+		ret = amd_disable_sdw_manager(amd_manager);
 		if (ret)
 			return ret;
 		/* System suspend: tear down all pads */
@@ -1488,7 +1483,8 @@ static int __maybe_unused amd_suspend_runtime(struct device *dev)
 		ret = amd_sdw_clock_stop(amd_manager);
 		if (ret)
 			return ret;
-		ret = amd_deinit_sdw_manager(amd_manager);
+		amd_disable_sdw_interrupts(amd_manager);
+		ret = amd_disable_sdw_manager(amd_manager);
 		if (ret)
 			return ret;
 		amd_sdw_wake_enable(amd_manager, true);
-- 
2.53.0

