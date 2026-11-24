Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.52.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795510371;
	b=rfGQm/Hb+S1AljXTZNvEYke6noj8+ZHEMSoe5uOSs5PjWMcS+Qp4FRxKVPlalpYVWLBQ
	 +UnVKv44mauCKJGERAnMLwK7KFAHaKQoNBS1f14ZkuIj1FC0pHQMSM/Npozzo82jy+KA7
	 vqhw/jSiRF5evlaVllrJFB/q2o7flKwXledNzIGyV7+soYPrVN/8sq1XLvxsgLpFkAAL8
	 9VBwugsx5fAjEEVH0b08k3Fch673ZXCc3VaQPQhfPbf8HAQp2MDlFi7hpo8oEDIFHz7UT
	 vucSYk8+sC9OLUG+pClJL2U2kCgWY5ogrISquCA12S6N4WnkcvvZjQVX0pcjxCiMY4A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795510371;
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
	bh=oWUR8xegIQxJn6xGwo1Ib5fGiZHIZpb2glUTtdFQpYs=;
	b=QssMYtjAMT/LXEV77qiuJmBZCkRkJZ2u+CC5+xuRYgCjn4RXAyRoErBYKfKwH77lCkER
	 sqri84pBb7bdt0CxrTruUd2Efou0bWTeSmJrm6sx1MkTngPEoa5JF0xArFNITqHl1pmhk
	 IQ6YMlsT/Pcn09i66AuoWyfRwCq1fAo+GTFl4rg+mGq0/NE9EjcTmy/u/9RzAdI5+emBy
	 60im/L6mjQoq8M/DKRwEePOC9Mx7898abiH85+9HopOTsQK1xo/XD1BWduTFigutWgzaa
	 6Adma3zRS/Zx5WYHvnRt0oJlRMJE8+r8QRRFxAngjf0vzGbc2tbhUhnMhcNV9hMO3Eg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=yZh49Pd7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.52.50
Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011050.outbound.protection.outlook.com [52.101.52.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E1C5606A32D;
	Tue, 24 Nov 2026 08:52:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E1C5606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=yZh49Pd7
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DaV2hHRrsqRN4/t3r/fSiWS3cwkBfaQ1HLxseOUsvnwoYVC+l2ibg1HQz8KA7OONr6naYwzPWwDpdnSN/YW1uhDnslifyrCA6M2PcXcdvO9TXPgvFkzSryWY61Gmoi5/1wA6XdGPq/kZ5Uc+4s4TSm0YiV/leleWzMYg87PAb/Js//L/1DSgVKyzx4dacKv8Kdzz8x24NuefL7zBlAJG6DX1l606LlcbZOqvgK4zfj7LgoZg+7Hq6uHkLljkEOHn9BvjxQc/XNdkH/4DyRw7PYDN5yuHdEXLhkr14rVbKzBXCkbaKBZp9Odbugr7q2XK4zAwj0ouBe5+Qs3H8gRS/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oWUR8xegIQxJn6xGwo1Ib5fGiZHIZpb2glUTtdFQpYs=;
 b=coIpymflARVv5mcn2fIHSw8Tt7G4Uolk9Kcyj3GBNEfOh3qZDmfrXdLK2KYAfZwZq7gCR8tzqrRFwLc69zZwt6l8Bq1xkDUijuCSfgJcZ/DdXinixgLfbh3qTnkKYfPmOKeXxFxtLLqR6ACviojMTA58/3iwpT7E+hIXKmn/nuax0T3jpdJGj4aBPv6LbeylpeY8WMY7Y9TKApzvbDyExrPGlgLHRHv+aj0qzyBxbuCdqzTQU36KrwxC6mnkyx4CcPiyBlnwFQXYI9xf27waN033CBArX8kYL9A1r5SSHvHEJ0qpC59Y6/WPOR+w9hfcDb3NJVdhJmekuv0vxLp7NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oWUR8xegIQxJn6xGwo1Ib5fGiZHIZpb2glUTtdFQpYs=;
 b=yZh49Pd75fS1qoeeO8a4wfxofHYAFJNGbyJwXKs2UM17KLgCczpXsGWZs2EPP7evrEBj7Czl1IEK+Zu/Xkec6binh3bZsZgu5Xkzjlwmk77igtw8jRiCvgPa5xTewj+YrZYiwh4LHY+CLViNgA+R6aigtYpMUFn0cmopgRvetYc=
Received: from MW4PR04CA0069.namprd04.prod.outlook.com (2603:10b6:303:6b::14)
 by SA3PR12MB324744.namprd12.prod.outlook.com (2603:10b6:806:531::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Tue, 24 Nov
 2026 08:52:47 +0000
Received: from CO1PEPF0001885D.namprd02.prod.outlook.com
 (2603:10b6:303:6b:cafe::59) by MW4PR04CA0069.outlook.office365.com
 (2603:10b6:303:6b::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.14 via Frontend Transport; Tue,
 24 Nov 2026 08:52:47 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CO1PEPF0001885D.mail.protection.outlook.com (10.167.249.246) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Tue, 24 Nov 2026 08:52:46 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 24 Nov
 2026 02:52:44 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 24 Nov
 2026 02:52:43 -0600
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.57
 via Frontend Transport; Tue, 24 Nov 2026 02:52:40 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>, <Poojitha.N@amd.com>,
	<lee@kernel.org>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH v9 16/24] soundwire: amd: fix *sdw_ctx leak when sdw_amd_startup() fails
Date: Tue, 24 Nov 2026 14:18:22 +0530
Message-ID: <20261124085033.682755-17-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF0001885D:EE_|SA3PR12MB324744:EE_
X-MS-Office365-Filtering-Correlation-Id: d871ccb6-e02e-49c4-c005-08df4a084fe6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|82310400026|1800799024|376014|22082099003|18002099003|11063799006|56012099006|261021121427099003|261026121527099003|261102123227099003|261026140227099003|261102130727099003|261022105027099003|261021123027099003|261009223027099003|261028144727099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	E2Yu2g+MhEeDXF3x169cDL8LsOK8HSYblYSo+0XFegHqTu78nLV7ev3+syx8FlswrUVt5CadPnduD0ztZsuoaLOUcYRpHr9yYE8nHF2avFRk8qoYI9YRYzII5aYxx7yU3V0Ao87UE+3wUs46OGn4CwCB/fOxgxSObSSFEjGA2mEBazPO879l5Zsb0k7S8mgN8dEpJfOyruaDZ8g8Ou4usfkpMeA0Fr+kASTHFAu35YOpXQFeSNV6x/D6w3lEd5VKHXc4mU7PgLndwvsWMKoCP1HT+6lBH1fbtszrOixmvE/pBE6ia8zXYBJmC3qTeTRqpj3lexedZoCbX6oc82ajpcgpBL69pQHa4tNNne3kgurF7aCLZfnY9QDP2CquGvv9tMweMpMStP73+Ps8yEAJ7MkYKmP1JJcIBN4lp3W52A8iC8R/2Z85qWn85DcU52Ub/8CY/iv2zupXn6JAl/pnphwG3UYJ9uDdjYQETDTjvjsRejJVdFQdH4oOBYZHMivD9MzuFEl5vqlCUItfRnXi+VsjvdPQCrALxdE9AUx4+hM6rVUY4UnUISQF4OPFOBAjG5VU7NOUwMcDX8G04hjVP41I3qMSpaBpy3duzt6XcuqAK1LWnwRqgSrPdXObKwLDcXZ8s2nHXUkoua+UkL44lvsM+tcBwu56NVCivUCAAPZHFPdxj6rGEJgNWrfskyhAGFNqINKVyuwCQrVPRgLkBA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(82310400026)(1800799024)(376014)(22082099003)(18002099003)(11063799006)(56012099006)(261021121427099003)(261026121527099003)(261102123227099003)(261026140227099003)(261102130727099003)(261022105027099003)(261021123027099003)(261009223027099003)(261028144727099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	MIWhXVE/IK9MvY95/G+7TDWqjD83hQjz8O8jJ59dSvvgrm4a2k6Q5IiTtGyltG1hHggOtHzx7C5lVsSxPW0tsU1oJX+19pckRCYR3dQXL67pPc4L/OYs6+Unqhyh3+NEkTqFTtTVs1WEPGxjiuE2b+lwG5aumfJFs0TI0CiCBuaYk88GKFz1yVJue/121HPn+EdQt31dGnRAQnUKpuf6ROVeEEDnXEVOGr6wYwao50tcsgjCyr6ox8cAcJynhehUo9aBcZVRzB3uxt/PaIz3GNAiOwlRZuwHRIB1sRCz+tpQ7DjuFZsWj0B5HUGxAeOOP+TwAGxBSSKICKqLjj7sEglOnpGKSi1K6diUvAYAlvsQ1e36Xh8Hd4fIJ52f9X2+6QrtC8QUDLf1BFrv6X/T8xk12TPuAUwsR067rfnyng/p42D4uuBFf+tX8rUCoDKp
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 08:52:46.9254
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d871ccb6-e02e-49c4-c005-08df4a084fe6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF0001885D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB324744

sdw_amd_probe() published *sdw_ctx immediately after
sdw_amd_probe_controller() returned, before sdw_amd_startup() ran.
If sdw_amd_startup() failed, the error was returned directly, leaving
*sdw_ctx pointing to an allocated context whose platform devices were
already registered. The caller has no way to distinguish this from a
genuine probe success, so the context and devices leak.

Fix this by publishing *sdw_ctx = ctx right after
sdw_amd_probe_controller() succeeds, then calling sdw_amd_startup(). On
failure reset *sdw_ctx = NULL and call sdw_amd_exit(ctx) before returning
the error. The caller always observes *sdw_ctx as either NULL (startup did
not complete) or a pointer to a fully-started, valid context.

Fixes: ed5e8741b8db ("soundwire: amd: refactor amd soundwire manager device node creation")
Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/amd_init.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/soundwire/amd_init.c b/drivers/soundwire/amd_init.c
index 8019a4faeae5..50e487e409a9 100644
--- a/drivers/soundwire/amd_init.c
+++ b/drivers/soundwire/amd_init.c
@@ -182,11 +182,21 @@ static int sdw_amd_startup(struct sdw_amd_ctx *ctx)
 
 int sdw_amd_probe(struct sdw_amd_res *res, struct sdw_amd_ctx **sdw_ctx)
 {
-	*sdw_ctx = sdw_amd_probe_controller(res);
-	if (!*sdw_ctx)
+	struct sdw_amd_ctx *ctx;
+	int ret;
+
+	ctx = sdw_amd_probe_controller(res);
+	if (!ctx)
 		return -ENODEV;
 
-	return sdw_amd_startup(*sdw_ctx);
+	*sdw_ctx = ctx;
+	ret = sdw_amd_startup(ctx);
+	if (ret) {
+		*sdw_ctx = NULL;
+		sdw_amd_exit(ctx);
+		return ret;
+	}
+	return 0;
 }
 EXPORT_SYMBOL_NS(sdw_amd_probe, "SOUNDWIRE_AMD_INIT");
 
-- 
2.53.0

