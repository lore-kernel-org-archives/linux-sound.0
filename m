Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.60
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795453738;
	b=i0F6HhrbSmW4evSQupV7a2zB4pQTkgndF09LAvMN2XsKjpnrvl2T1IIakwfH8aMwKHHL
	 Dp3u5IwC18B7X2TDkS1fikl8SfhFIRVLi9sKNU7MwhGfKmoKh+cn7VpzgJn6YnSzrpp77
	 dMlRRI+WHfhlLMO7SXcrR3wzKO4bakGwQ7nVFcT/kMjoCwRYibUY5SXdKEir50V4pAASi
	 meEKH6WUOn2PeAR4VjaFRkQ3Y141eovkgqTqi9MPJsmQDQhOuchg2gMMl5XvFEC+DYZ5I
	 1OKKqoMkTwV6W/GXKemH/+pjZfmgkGjOcm2/SGh7s5Ih2SFRJU89LibZjiqRjjgU6Cg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795453738;
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
	bh=UiTzaOX94LIPpAHkVY4+FQ+ItXkEAijgtNDpBzIvlSE=;
	b=3zO3t5AOOCZ08KuZ5a/ntsAv9xXgHWhLg7UnVX0K/kQeSpbA+Sr4rK7szQ2peXIxBEbk
	 BVDh67/ztWjrRMUY9nA4b18QAIKF+ijS7w5qgleUvsrP7/yv+DU9mwPh+uiRPadCIgI9m
	 kIAzrQbWF50ycr/ICTlHutB6xviTdlsfy7K4XsEITX76mprehdHxPNIIV/DUSb3TaF6U9
	 /yayxY0+qNMJ6KCbLd00Qhu4s5OhewYdzXPtAkMpnUI2bf7IoAzJbFB1ARRVnp4PizdQO
	 g2IXT8t9CcySjDJHAJcoJOtL3pBF2jk95hiXScUtAjEotKfmMxb4HNtLTJqekJ16veg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=BKXYLS4W;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.60
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010060.outbound.protection.outlook.com [52.101.201.60])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50D67606A689;
	Mon, 23 Nov 2026 17:08:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50D67606A689
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=BKXYLS4W
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zmo5/qMqOqJM6LG51bXH8XBAhtiIb+Pcq1Pop4sW7iJqkHB1TIKoi1aN33M2zC+N8vvu4/VK2iTq3lpAKCj+/Uk8NFCe5pZ20C89qbjDMbUcKXDDvhquiZIXuv9I/7HFL1LNeLNw+9jq19TJkbuDJujdQN/z00a7wJYIHMOy70W1GYdD6U0n9Gqncs13t8S3f/Ik349GZlTNkK8Tt9qICtFFV+OxOooqdyqq7OJ+57iJY/VLjXIpUP874ivyPtawLNny3JiTRqsGBBpUdGOjuRWsQM0GMe9ThfwlmghgONdMQG5wngCeC6NXrXkrihx8u1lay6VSFLij/LX0kn0A1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UiTzaOX94LIPpAHkVY4+FQ+ItXkEAijgtNDpBzIvlSE=;
 b=wR+p3/XBrQtSS3IsvKHyMaevHREI8lnMSfH2nsMYnxgy+fyyVJtEFmC6Yvq5vFQbAaDOwyHkio/wfqOnY+7mLmcX9/DVswNoXSi2Jxft0Es6pqtJAMDR4dteWKiV1TQjs5B1VYT7IwAU95rgcuyG/pDEupxnfgRe8dmTClYstQd/3qKGacGXjdvnZfYhoVvR2XevIHvVo1pMgBEB5zGPuzrddzwEBsDZRJ5TGLlsWjVYsA6nfpQRRUBS9a24TW2hYXqBwcHcjp/Enz8Cw/0IRWVtgqe2GP5QyEC1NRNyc77/5946qaNdpJ9VPOzwlw+RQza9fehsrs5VEavi5wdRrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UiTzaOX94LIPpAHkVY4+FQ+ItXkEAijgtNDpBzIvlSE=;
 b=BKXYLS4WHZrzqJh5mH9+OboYNyTiJmtL/L9pusEiXdDywpfzCKFPDBga+MMsl3gp7K/b0uUenA8oipDW6+GwvSkg36kxin/pzn3TfYQoNpQ7zR2iVR82CCnz3Orpo1wr9iI/s/5fxBCFIaWq5rhwKmIJyElnnDqDZAH7fufOlig=
Received: from DM6PR05CA0064.namprd05.prod.outlook.com (2603:10b6:5:335::33)
 by LV2PR12MB5775.namprd12.prod.outlook.com (2603:10b6:408:179::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Mon, 23 Nov
 2026 17:08:51 +0000
Received: from CH01EPF000BE944.namprd02.prod.outlook.com
 (2603:10b6:5:335:cafe::7b) by DM6PR05CA0064.outlook.office365.com
 (2603:10b6:5:335::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.5 via Frontend Transport; Mon, 23
 Nov 2026 17:08:51 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH01EPF000BE944.mail.protection.outlook.com (10.167.244.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Mon, 23 Nov 2026 17:08:51 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Mon, 23 Nov
 2026 11:08:44 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Mon, 23 Nov
 2026 11:08:44 -0600
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57
 via Frontend Transport; Mon, 23 Nov 2026 11:08:40 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>, <Poojitha.N@amd.com>,
	<lee@kernel.org>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH v8 21/24] soundwire: amd: check for NULL manager drvdata in sdw_amd_startup()
Date: Mon, 23 Nov 2026 22:27:42 +0530
Message-ID: <20261123170520.1380924-22-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH01EPF000BE944:EE_|LV2PR12MB5775:EE_
X-MS-Office365-Filtering-Correlation-Id: 42525a96-0d75-49b0-dd52-08df49847243
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|376014|23010399003|82310400026|10067099003|261102123227099003|11063799006|261021121427099003|56012099006|261021135927099003|261009223027099003|261022105027099003|261026140227099003|261028144727099003|261022075727099003|22082099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	7QgL43ITWqBRPrBzg+I8Or8tewKY+7FfwG0iwk8Zgx/bvy/MiNuwhfg6ppSzXxk+Zb0J+S+mWHGwZFuxRBh3MwE7JX4hX+fCrPQtvFFr3Vd1mW0OEjakmBJuT47ick75RVmZCjNYZerknHTHIBdJibMhoOGrKMzJ0J9cCHepqkj81UBp+UnIzshjWrtmvIR9NYF+5/G/ljQvYS5ofkKslYI2yA15EPbehsuG8LHUlRDUnYMmFTK4eKL+k2q2oNiAHZOEMh+bx/VVKCkt0+iyUQgxwr+YV/zduhcaSoDe6JT2P7Sp6SkKUoZLk/8vZHDZOgf+bW/4S9YZNNcpAazNVPnzgNV2CMd6S6HJFvEMtCwUx8IeHwb4x7r6pTp0yqter8WW37G6K4YvScVJWGBb/ZAk+aD2fqMkNCm7bKLIXzd4wzFGoojTeLoK19naoXsPkFn+CT86sq62bTZViMhHpl/KyaFs3mcSyduRxplkWjWdekUC3k5rA5prKECyBqrJ/sHdT8ChVpOI0FL2+aqHqRkWXzAP551KiY0BSI9a+YcUta1i21lYY0lc3/DzulGeKiTFClErk8yuttXQ3lWGHBysyvvKw/LCvhUFrjl50mQZTPAvZbFfgHoItzxSzromm3x+uW2PZclInL3qUhrvTw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(23010399003)(82310400026)(10067099003)(261102123227099003)(11063799006)(261021121427099003)(56012099006)(261021135927099003)(261009223027099003)(261022105027099003)(261026140227099003)(261028144727099003)(261022075727099003)(22082099003)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	0RWmYx9PNFKJozp3jIp6lMdGGl5oQHwi/9xGhL8pFTAziZQQHFGtrQkHn39rSBxi7IQJQ5lpT2SbDw7LbovMVzcRaCY44KJQ8nRtNLOR6S7jY1aGFLdXToTCXnK7wRo2lk+0SS2AdlfG2u7bNmvIiksZtxqEdvjgSiWu4lAx7EUvRa1pReeIqHAzxnQZxRwo+HQ9fpqTpbpW+/rgJtpShdL4/xfBfIl+cnL/YUfRV4TolNNs4RAqULL4RP6TZoZY/AlRq7BePfKhH1FNgi96PQ5Dl713W8feYL60L5299vRCtH0nn0vNYvPGh8qUVPOQ4YYeDoT000NNKmWH01oIUZqirqShSpFe7UhwvhmxwW8QO6JUs7UtjY8Sunvzc0NdRPH0E8RM+5osOUkljR1WpJ0pY0zHEQHNx02Kkc9v26x8VvaWll9cGOximY6N+RvG
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 17:08:51.1174
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 42525a96-0d75-49b0-dd52-08df49847243
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH01EPF000BE944.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5775

sdw_amd_startup() calls dev_get_drvdata() to retrieve the per-manager
context and passes the result unconditionally to amd_sdw_manager_start().
If the platform device for a manager instance was registered successfully
but its probe failed (e.g. due to ENOMEM or a deferred probe),
dev_get_drvdata() returns NULL and amd_sdw_manager_start() immediately
dereferences it, causing a kernel panic.

Add a NULL check after dev_get_drvdata() and return -ENODEV so that a
failed manager probe surfaces as an error from sdw_amd_probe() rather
than a kernel crash.

Fixes: ed5e8741b8db ("soundwire: amd: refactor amd soundwire manager device node creation")
Reported-by: Lee Jones <lee@kernel.org>
Closes: https://sashiko.dev/#/bug/linux-6834a8a0-632f-4c73-9174-0fe7e06b5303
Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/amd_init.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/soundwire/amd_init.c b/drivers/soundwire/amd_init.c
index 50e487e409a9..4f1c2eaee70f 100644
--- a/drivers/soundwire/amd_init.c
+++ b/drivers/soundwire/amd_init.c
@@ -172,6 +172,10 @@ static int sdw_amd_startup(struct sdw_amd_ctx *ctx)
 		if (!(ctx->link_mask & BIT(i)))
 			continue;
 		amd_manager = dev_get_drvdata(&ctx->pdev[i]->dev);
+		if (!amd_manager) {
+			dev_err(&ctx->pdev[i]->dev, "SoundWire manager not probed\n");
+			return -ENODEV;
+		}
 		ret = amd_sdw_manager_start(amd_manager);
 		if (ret)
 			return ret;
-- 
2.53.0

