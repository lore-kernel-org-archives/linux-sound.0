Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.21
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795453648;
	b=eQDVG6haYBPob3aGnd1dWDzLQxM+IG9YvO5CvTDt549DOvSUbn7ih+Wtcxi1rLRjENNJ
	 mR2JpcbE24ly32epOBVrM+4bwbBY/y9VFZXN1Cy/wJbJihwIKocl7UJhY7UeRAuQ2hmaA
	 TwvAgDOGwAOXS8PSSF9sfjbCLcTMBbW7HPly3quzVsrJo0TFVflKKLAP2OZfwMvznCS0v
	 3hpZHVLblYwbFYiGVv3F/CvC0ZB38NF8HT9t7kmd5P5+vBm8A7+mWDZBG2gwcWTD4DI8g
	 LIIOVJnNMpm/Oj6rj8VFvgQfq2VjoGdLtnjNFUdteLDrsuq9kKRjoXSJ2yrfdEJxBCw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795453648;
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
	bh=iy1UXqbCNpmIvsTgL/zhHFoaBSmEE9Rqb2TUApr3hYc=;
	b=5E0PH/8U78lqw/76zjlyhXuWp9/ZKxPgO9X+HEaZm7O8ky1d9dE6V6Wo1PE7TTDr15BV
	 pq0Y1hgSqCL3dB0YCgjPinWgdyRqeVUojsL1vJoMCfOwce96LEDgrlh9bK12uumLb/Adx
	 q6MmrSxDUNZgDUzhVnlwlI9gv0Qo9io80QAMr8tYPd/m+43JTJaStdWpkyhptqOSLy9im
	 WfgGuJLtLfU1V3PCXSLlnM0zx7aEkrOYI6YJVUMCmqVZ88iLlJYjDTQAQM5coSL57wmV2
	 3gIa+cf/FAIlFBRwnBdgEsls8iRUEI1x0TekLtrGEtGJ2M+ssiBoTOAO5DFSrC9ms0Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b="BoPo+e/r";
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.21
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013021.outbound.protection.outlook.com [40.107.201.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E84C606A31A;
	Mon, 23 Nov 2026 17:07:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E84C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=BoPo+e/r
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kmunFU5KeTh89/D6e9mVxa6mCEI1ah5yTjjI4IEOptATC3dTZZnmhxzznQbwTyeVor40JnRA0TsM3q5NcQ/cjI0AwFhn8t6ZBPFppgRSi0QuF63t0yrlvtkmdwg1o03Y6iDwiIWNZjNsq4tT9ZCELsSSCoxrSfKy8foXdFcYBQbLim+vBW5D3kFgmfwie8aAJBoo6FdSXcE0L3Q85hpDn01J8fcbW44Nv5Noxng5+lHaw1lscfQyTE7wt0YbFTmN8+pBaPBIo5IzLuk4JhauzDDRNh7bD1l6YGN1W0oOPi1vav/PX7leERv5As3CnAjoNmPle/PzbVeRq4nR+8YhEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iy1UXqbCNpmIvsTgL/zhHFoaBSmEE9Rqb2TUApr3hYc=;
 b=GabV/7VRslwLL4fX2buouo9WVyu6I7rDSG0o7Vwe2Hlvz85/9+TWdhgyO/46Zpbm1G+EhYndwkFFQ/jLvp8qG/IGAvshe4P75NN0fHJb1u5Rwylc9tQ0gX4jFc59VQhVomzlWtTax+qdWMCDwID1LgPYDOf7Bc+dFzmpsKOP34I5+FpaKSvWTe6J1wLnXcJuQ/1/LJcv3EJGAiNkb6hV1jMXRe7C0L8XNN7YXk8iPiGNt7tu50gkmUrC8wk2QkLdNBaAwo2UH1bIXEKtUdYhA2Sbr5msYtT8BEZU8wPEUBTNeaIYINfqna3EvftwsHAACD1Xp8VuKsAdpxiPePv01A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iy1UXqbCNpmIvsTgL/zhHFoaBSmEE9Rqb2TUApr3hYc=;
 b=BoPo+e/rDNCsRyqQ39AZ9dRv5SrdLom3Ocavwp61WDPIqsOd9vTkjQL5kKobVSOv9WkaoUEsUlG/mKMUwrdHMZQlTZRhltk65onNWbSFg2BolznCoh0DYq0UPANiHLaXQF8yTrkrFTnh5ZgytzauuvsL9I+QXJAGCURaTIw6Y18=
Received: from MN2PR18CA0030.namprd18.prod.outlook.com (2603:10b6:208:23c::35)
 by DS4PR12MB9772.namprd12.prod.outlook.com (2603:10b6:8:2a6::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Mon, 23 Nov
 2026 17:07:18 +0000
Received: from BN3PEPF00022BD8.namprd03.prod.outlook.com
 (2603:10b6:208:23c:cafe::56) by MN2PR18CA0030.outlook.office365.com
 (2603:10b6:208:23c::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.14 via Frontend Transport; Mon,
 23 Nov 2026 17:07:18 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF00022BD8.mail.protection.outlook.com (10.167.248.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Mon, 23 Nov 2026 17:07:18 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Mon, 23 Nov
 2026 11:07:13 -0600
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57
 via Frontend Transport; Mon, 23 Nov 2026 11:07:09 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>, <Poojitha.N@amd.com>,
	<lee@kernel.org>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH v8 11/24] soundwire: amd: assert msg_lock is held in amd_sdw_read_ping_status()
Date: Mon, 23 Nov 2026 22:27:32 +0530
Message-ID: <20261123170520.1380924-12-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF00022BD8:EE_|DS4PR12MB9772:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c3002c5-a24c-4da0-c314-08df49843af6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|82310400026|1800799024|376014|261026121527099003|261021121427099003|261102123227099003|11063799006|56012099006|10067099003|261009223027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	qzpPPpyw9a1vTjlOpau1yls+/2sOvWesiR0n4OhOMhhStNlcYLCGb8qaI60bw/YeQDrOcRho1QA/UT3We41CuEsOi95eF+gdzaavbw56vnMbLuySzh1YgdohtFTvPJl9O7Ll3A+TIIMDhsrZ6xqERkjyGJBuWQ23Vpalve//M+EioeVUW7BgNG8JrF+exER8Impf7NT99LLY0DoYs3jcv3TaDCq7en2waKXxRScy4cXvDjFfyCf+osT/UJWbacV623bqsd+LXMBapoJJDBKKeRo+WCF7dI8b3ls/9VX+/DYXQOrIP4hg4oNL32Ugnq1zjxy+e99E95SIZuNyg4unQ09KXyThY2ZP+xwcpCvkXo6F1dusScZMDU4mkbmBQNyyXlm1kb2HbK10KXaspcUgJaSlvjBJNMklnAL8YVxr+JVLIjhSs9/5n2t7tJ/Nr6WrestgFGPEh/XoABuWiGDaIhmtHplf/vyCY5ZQzZaPzUh1e/HoD3Bb17wWqUbAFMyzcW7iF/lh1SlDyA8O8fj46dia+QafsBMitxMlXck8VqBq4ax7rHi5wm4B/S3gGXofJexvhZ+2H9hH+bM5jrz9dH5nHFRLncUGJ9oeYmDQHIWcBmSWAKkVHw4av9PEYX6aaCeEmrhlJaL94uEW0cvPupiMPXrOUImg3ven8j3MfLdeBx+nQOrm0wFqRK19pBecfCLKb1JFGOY5qAp54YZ5+Q==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(82310400026)(1800799024)(376014)(261026121527099003)(261021121427099003)(261102123227099003)(11063799006)(56012099006)(10067099003)(261009223027099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	tF5NqYIDa/u5eX1xx42nPm7xCWrKignNLuGNgjbFiclBANRE/xhCovPBMAk907IFmepW5PNmsRJOdv9zzAzcN5QFDcxpYteIkEs3w1f/8JKodA7MxLoCwngASu0KXOdKQdYkJC7zLj7DXMlYJtV8uqora38WYtwP/n5OOnOT0ca1Mbga/ELlfkyjKnI31QJB2HcNouRJcFgnJU+P7trqWTpMIUXMe8uFE0lcBl8TQGtn90MpVN/UhRVTG1bKRwuEdUKT6xipsp+T81T+pgNLv03lSW1mSgMn/nwzIu4oidenNvOjzfIqQz8a6aF/0Uyiy+ntcfLhXa4h0aHZTb66YC++7FK9fic0x3DNT2U3LQ5TEV1Gb/gn4Hx4hcCq5MgVhav9XqXWu0ed8dTKk0WZgq9xgUTE246GTUlk57kyo3v/zZyHsGjbs2F2RtZ1Xfkk
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 17:07:18.3238
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c3002c5-a24c-4da0-c314-08df49843af6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF00022BD8.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9772

amd_sdw_read_ping_status() is always called from sdw_show_ping_status()
which holds bus->msg_lock. Add lockdep_assert_held() to document this
locking requirement and catch any future callers that omit the lock.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/amd_manager.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
index 7b1aa2a87a32..3a97c12b45e8 100644
--- a/drivers/soundwire/amd_manager.c
+++ b/drivers/soundwire/amd_manager.c
@@ -562,6 +562,7 @@ static u32 amd_sdw_read_ping_status(struct sdw_bus *bus)
 	u64 response;
 	u32 slave_stat;
 
+	lockdep_assert_held(&bus->msg_lock);
 	if (amd_sdw_send_cmd_get_resp(amd_manager, 0, 0, &response))
 		return amd_manager->ping_slave_stat == U32_MAX ? 0 : amd_manager->ping_slave_stat;
 	/* slave status from ping response */
-- 
2.53.0

