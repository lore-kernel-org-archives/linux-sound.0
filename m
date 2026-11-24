Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.71
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795510378;
	b=DqF4zHd9+5GPtNUJUxNKk+qez5secVesyjo30sdxmSUsMgL1YDvlcDBh/++KwATJ5eE8
	 nV5iC7wDCY/EkisgLY9EgQ+q4NY9JbtcpnZdc3RpZhDusPLd2OkJrci4isVoKofH2k/2O
	 2MGfCyKpNYcGshjsDPn5v0YaYG/WXtIy0YpbxhI1KVANDUYHPDF4sb9+7GHlmW5bhgjf9
	 akNL9dejUfC4afaR/ZSSokiA9e3Gev0j8LLIu1itcm8SdfK6/70RU7UJ6QL/ElLvUYbkl
	 vl7fzsrvoRIgJKmZLL+69DvkCY71Hp+X9qQ458QpjrgErlz7IpB+qSfl9RDU9Hjzi4w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795510378;
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
	bh=Tl1BrLSGv78eSSwtp1QHqqPpd+c/l5aK2ILzfpwwTg0=;
	b=RGtC7Rh3kLwyZ62JJ9Ceq5MvUWDTq50OLXF9peUoyXha1qk9/VUevd8L6pQ8NGYpCpDD
	 sMd3eiSdPfqDQOxS6X6o/zX6cOgfn6PJUWsnEsotZFc1mcs79BC/28GzF+700nKgNw29B
	 f+5XAkJ31tazWsu+vlqpCaSv06Wgi6vShpCsmaQCOD6NMcH7oP/Ei5L57fpso28f5K1kE
	 7UsblU0QTRNAZko9lBTv2BqyP7DPvPBz67ZKBxvVm2cgzmOsrzhDPtPNEPzTin7R1+/rc
	 KG0DdtZWY5tmUF5cUJT0qwok5Ml/ZtoQGYm6E5GVMiMWyDcu9XtnZxzkiJGjo5qFLlQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=wvj1wwWH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.71
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013071.outbound.protection.outlook.com [40.107.201.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B761606A326;
	Tue, 24 Nov 2026 08:52:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B761606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=wvj1wwWH
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FlSuu89y/iU9MwC+KopGzPVhv+98MhMNShk9GwZorVrV9IYJoWWca8dMYKmJwoP7CATYvwPiElvSLYBHN5bB+JQyT9y4loR2ZsACmfaq7coW7Y9ihvtHeTTMHxhS4qh8W/5iifaU4FTh2ys9TU3pp/EIvUVzACkaMxSa+GzWSoDeumvvT8pHHiDcDTBcDZYS/yyW4Bm5cgDIYinm+4MWE6qfnVjoXSXEs41+oPAiS+dXFweL8aCPiPs2EiC9Phn8BlOL68YfruscJ1gU5OE5apnJ1Gersac7QXTf5xZIzC1W7+COXf+ZNq27kP4yfqdhH71h8c1A42kvnKo9Dh8wjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tl1BrLSGv78eSSwtp1QHqqPpd+c/l5aK2ILzfpwwTg0=;
 b=Mx2da67j8nuj8/dnCU22gF0+qf6y4XVMYpW4Ux6symDbOOT2rbOnr1IfCVA6MRdvvTiYFrQzloRI3ElhIfxV4VY32YzvtUJPLBuY2GsIx8+F2RTTFGFT1QPXzzbDtKO7czcLA6WoFJBYFrkx7Z85OxUitht0FwVBBKa9/WWI58A6IfiuRoR7B56KuCNUS5AG1qtysnhYOJrows2jQoWF3XqHGnAF0cQMhp35QiQgN+kro998TjBWGKmDAaJXU9WEotCZsJ4W+VDdagY3L3UDPGY8akbm/KXPoXAb66ICURYbgupvjh2Da/UvkjjgmfpsrpJ4PDXtuhPk2QahTZ/O8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tl1BrLSGv78eSSwtp1QHqqPpd+c/l5aK2ILzfpwwTg0=;
 b=wvj1wwWHieS4OW+gxfrWZZl+IW64WgJ+vqGafI1AsxKJa2VvpyCJOe9gJNSRxK9JTtMxOZ7CfUTMWK7t86mMniCj35ULobIjDwGds3j/bwLoKU8dIIaFQHowcY+DNxJV2PYSJvz4sX08IzNZkOziSCWPrlbBHn7KtW3IsX8zOT0=
Received: from SJ0PR05CA0034.namprd05.prod.outlook.com (2603:10b6:a03:33f::9)
 by CH3PR12MB9217.namprd12.prod.outlook.com (2603:10b6:610:195::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Tue, 24 Nov
 2026 08:52:54 +0000
Received: from SJ5PEPF0000020A.namprd05.prod.outlook.com
 (2603:10b6:a03:33f:cafe::7c) by SJ0PR05CA0034.outlook.office365.com
 (2603:10b6:a03:33f::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.6 via Frontend Transport; Tue, 24
 Nov 2026 08:52:52 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF0000020A.mail.protection.outlook.com (10.167.244.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Tue, 24 Nov 2026 08:52:52 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 24 Nov
 2026 02:52:51 -0600
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.57
 via Frontend Transport; Tue, 24 Nov 2026 02:52:48 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>, <Poojitha.N@amd.com>,
	<lee@kernel.org>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH v9 18/24] soundwire: amd: drop amd_deinit_sdw_manager() in POWER_OFF suspend
Date: Tue, 24 Nov 2026 14:18:24 +0530
Message-ID: <20261124085033.682755-19-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF0000020A:EE_|CH3PR12MB9217:EE_
X-MS-Office365-Filtering-Correlation-Id: 7bf9b831-f128-4adf-5be1-08df4a085343
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|23010399003|36860700016|6133799003|22082099003|18002099003|56012099006|11063799006|261026121527099003|261102123227099003|261021123027099003|261009223027099003|261021121427099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	FPKFTVDiopkm8S4qwsrWayV1TFBDHC1NlW7FmcIQFJyh2xCtgdxShgYNPmXJieo8cwxQZ/l4ya7LPriefnqTj8J160CQQ1kuNZa3oN57kT9RWECcZ84WpYidlk9TZvKU7pxcCut5CfY5tmMoC6spGbbHsAsqBUHBH6/OgJs2cUu3Ds5jfrgwCUVIskrHZDHoxF67TXO3y3Y12dt0fxsNT9FNl6DhPx19/YfI1xJOhMBWfdj8bnaAsWklU54SXr8a1KUg48Vl449IxaJBeweDChzpvUq9OYLrCKeEG9TZ/CF+oervfbF81x9dQRWfFMpUb+u7k+Ci63LMwjzYzMSSubHI8RZNJgoWeT6h2dCbvxYNPHwSpoh4752eNAj4cbWPP2l6fwj3E+wrIM07E7Fk6DR3/Ze3gETLOC4GCUPn7pB/dnxQrk+ET/PMZH+K7fDuk15GIjAxQsbW4NOLfKcBWcciQfvznUaUNV4yyPT3dMmcfiXfcL6/5ZmmNVJdeW1y39Cx+Gbc6k0y2uccoOQyRMCC2WwAjbGaRKux4T14WjxP0M0eV6oyhMiNALi2104o8DonD5+p0lv7feUdg7b6XgWYhEFlMcL9bgKm/19nU1v3xLLGdcOuWWtu6aTmnj0QB0CL/gLpqrQRn936OEpTJOLVC1HQJx5Hc4O7insPklGybZecr9M9IySWM6wO8Vyu7JQxJFzaFSjw4Xc48H4a6g==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(23010399003)(36860700016)(6133799003)(22082099003)(18002099003)(56012099006)(11063799006)(261026121527099003)(261102123227099003)(261021123027099003)(261009223027099003)(261021121427099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	MSyYArfMIiyd4uq5LCZ/s4vRJjriaQW9+avlAuijBbsfbQxkYjFZpouzHSdDDgVBucbyFpa2mlV46bPekWPI0iibQVuhAgBNJgCxcGX+oKXvwmBbiXv5sp4JLg0kNX10a0v4ZzAHxgozxI5pezMevmvbZhSwjK0VTwIsRDFcP6YTmI9u3CFN+OzeH/GOOg7yvUXSVwEVxszJeeBbyGqECi57fFL4qTX7pRnQzhnuy+yjChPPFA1AhwabrdgVtFnD6YNvJ10YPb0+EQ/eUKqZ7T9AfPl1vx+J/ldpfsYgAQpFSfWTgMTx7H/JGNhsV2iWp7cgF8EoKbAZYuFP3izyzVZmbAEiNPmB22H2vzT2q+aVWFf1nuAIYwbKrq1b61A92lYxnW/zKhEUSJyllvfk2rPJbNe3TOG9Z22N9vm59n+XjhwXKhg+Ce4MBQX/XMyN
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 08:52:52.5759
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bf9b831-f128-4adf-5be1-08df4a085343
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF0000020A.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9217

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
index 8cb661690f96..5786eb312e6e 100644
--- a/drivers/soundwire/amd_manager.c
+++ b/drivers/soundwire/amd_manager.c
@@ -169,12 +169,6 @@ static void amd_disable_sdw_interrupts(struct amd_sdw_manager *amd_manager)
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
@@ -1464,7 +1458,8 @@ static int __maybe_unused amd_suspend(struct device *dev)
 		ret = amd_sdw_clock_stop(amd_manager);
 		if (ret)
 			return ret;
-		ret = amd_deinit_sdw_manager(amd_manager);
+		amd_disable_sdw_interrupts(amd_manager);
+		ret = amd_disable_sdw_manager(amd_manager);
 		if (ret)
 			return ret;
 		/* System suspend: tear down all pads */
@@ -1507,7 +1502,8 @@ static int __maybe_unused amd_suspend_runtime(struct device *dev)
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

