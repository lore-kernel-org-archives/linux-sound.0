Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.195.0
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795453829;
	b=4YXmblMrzJ+8i/9hY2Wyt/PrEyq0UGJFY2UJXBnJjEVC7WraOo7A7anOhfcoV7NX41ck
	 vA4K4fgGvgJsCEtK8vw98rbzNKmstQZlikDKFj2L2mVC/0fJER3gt9VuobRtC43q1gYON
	 mXRFW2stLCLn3NKMFPMx8qNceznABRADkQiY8Nb2Y3Ol3ll5Lh83n3mmnjyCOjgUp4rBS
	 YzOLYLc55B1ZDFU737AV6iw6oP45N+O7+Wd3RsWKc85dZyM6sbQsfJWXrrBQ07mgLpZoa
	 9X7xG5RRC3+IAQA3Oj+jcQvR6et745FxSZt39cAwJysJnMdejMQZWQv44x8+ot6DMXQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795453829;
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
	bh=oWUR8xegIQxJn6xGwo1Ib5fGiZHIZpb2glUTtdFQpYs=;
	b=ugslAOc7gSukZJb+hFN0g7uoF82lQTYSan8alXVZXEJsFBXnELZg8WUabPVMtBDDl8Bl
	 ArtyfNpfOF5JMep8gRr50vZhZxeWq3r1V9U4jGZFJkO+DOwmXzhrN9DXuUlyojl3STmgt
	 L24qG/8xgX3jcRc0G1iVoUGy6VrisCJGuXwfBwQnkgFn8Xmj8KZVcMl99Ll2Adbb1Ws3a
	 3RZBv9NYTbuJGkl+esZopVQLves3in54gv9uOpyvVNrRi08c1e8AFyvjS/hqahvOPEi1w
	 w577HRPVksdaXl3qTWlHyOOFX5CK2U1oIcQoVQg7DY56xHI0EU6gQCKJfs5QtM3Ithw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=XSRIiecQ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.195.0
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012000.outbound.protection.outlook.com [40.93.195.0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 509F9606A332;
	Mon, 23 Nov 2026 17:10:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 509F9606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=XSRIiecQ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VSKrW/EdbCCo28+8ZqVgHUG00KN9/jtrw0lXgoo/MV38C2M4k8F6nqv1xTkRB7PN1S+NlazMR9ilHTxQNbtb2buhIFmekW8rqIBg2IeaK38kDmXCIqIrSJtZ6PCm/skS78Ymc1fBjMeAimzhLOprv5HQO8y5S5/eWwooDo/l/Byu1ttUzqLTJipDr8ncJTk6v3rknf/DFO0vh3qEMlViz7GJnTGjTouTC4xNRNvJy8h2U6eEjz/jsXyI8boetEyujkgA6uEq27VdgSqVFHJF+XnrZJLmLSlsEixDHvXCrwStDgvpIKD8Ry0HhS+MCBEoXFHIJEISmNcoZmvtWa3cFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oWUR8xegIQxJn6xGwo1Ib5fGiZHIZpb2glUTtdFQpYs=;
 b=L61dS+nfSX2/6151UghwzIVAlvx7i/3sSJgVSSZb66UMqbpnLbAh3lO6bb+/qlA8uoqJsUVuUEYSLud1f0uZIz3zarvIxWKZWZZcriYVImAJPdw2MsnPfWGpEXiE5tP4Z2Y/hwR0+DJbcim1S357dl5GPOezzgMiybRK6IicUsZD9RutmnTKshWAmGFkyZi5fo0WwsQul2hy+fl0EhvWp4/iFxO+7CnGFnXTlEJ1BYqyhDTdnVXvprpvLj2L2Mx+2LWrZtOKgOKeHwZY5gwL8/XhfExS2RRDVkYHOcUf9b5OTBX+gMxxIsEk2eyFJAk/8BDFnSyhFhDaMA7CPuCovw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oWUR8xegIQxJn6xGwo1Ib5fGiZHIZpb2glUTtdFQpYs=;
 b=XSRIiecQ+XDmERnA30/nIbn7IW855KxMIkDnqVZEpcMURXTv3btn5BVVZUPwGxsdc0CLzH2u/2KiwLNYcqZdsViPJCaxa0N5JR4uM/V4uMhKXzABPDV1zWZX/2mScgBfqOAN8LJYhgg9TDVrUsvoWgdhVtM5uUZ3YscPsPM9fSk=
Received: from DM6PR12CA0017.namprd12.prod.outlook.com (2603:10b6:5:1c0::25)
 by SA3PR12MB465449.namprd12.prod.outlook.com (2603:10b6:806:53a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Mon, 23 Nov
 2026 17:08:23 +0000
Received: from BL6PEPF0006C3DF.namprd02.prod.outlook.com
 (2603:10b6:5:1c0:cafe::86) by DM6PR12CA0017.outlook.office365.com
 (2603:10b6:5:1c0::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.14 via Frontend Transport; Mon,
 23 Nov 2026 17:08:23 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF0006C3DF.mail.protection.outlook.com (10.167.249.234) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Mon, 23 Nov 2026 17:08:23 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Mon, 23 Nov
 2026 11:08:22 -0600
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57
 via Frontend Transport; Mon, 23 Nov 2026 11:08:19 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>, <Poojitha.N@amd.com>,
	<lee@kernel.org>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH v8 16/24] soundwire: amd: fix *sdw_ctx leak when sdw_amd_startup() fails
Date: Mon, 23 Nov 2026 22:27:37 +0530
Message-ID: <20261123170520.1380924-17-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0006C3DF:EE_|SA3PR12MB465449:EE_
X-MS-Office365-Filtering-Correlation-Id: ba9501c4-bc57-4bfe-e399-08df498461ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700016|23010399003|82310400026|10067099003|11063799006|56012099006|261021121427099003|261021123027099003|261009223027099003|261022105027099003|261102123227099003|261026140227099003|261028144727099003|261102130727099003|261026121527099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	tug/n0X5NxVaIxPzby9xviiQ7piNWk4e2eyY9xhrh6qO+XUNqzuTMJNfPPzrTuuZO07ZO4WEt98bTKRHfnW0lYVjyR8sxIMsULRW3NQrmQa5Z6L5xd1cUGHvzBIJzg9BdR7IICrnW3ouMivYJk5zr8L0hyfVFJ3IRCQvlbppfZlgmjniDa24z8LCicL5rqNUBtrZPaJ9SR/99a7JEcodvqNeFmYZqt2wh4ULkutsTAFlWLKQW7pihByRdDa2zXqp3A+fxy30ym9hiKoN5TkCVMdrcdnN4UBZFx8CoZrlf6ZiBMS1hw6TD5dzsl+Lt7aeKBInK095DQROGtCBXhriUxS2poVQ7rZIJ3pPgZDrCtiZL34HAcRMkhLNxAPwWDIs1pX9VC29nY8l1/3+1qbogvQvXisCn56105tBzb4Ny3AdbPUrdgj29biFlsKQCd2lzuOtUDDfZx717A8ym8ZmNfKSq+uYtxr2WWka7ARZG8jnkY6i6uOE1vZW6m354K2M37JUvPg6wSK5yrbEBtEzd+Lc8pr98DF1T4I/U17rXg97bJN/XbgROzq/pJrnJABPG3IjXHso7FxUojoAFLL9ScVgoOEwzhx8EYJh7A/sKaa2E/W5KJouidSzFfCdB5P8xqUTU1dmLyjzct2z9Ma1/Xn/1aKK2zgp4oHzX9Znz4pJE+QiSxXInYKwycqgmifhNhULjcBOKr73JYoGJ6tzJg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700016)(23010399003)(82310400026)(10067099003)(11063799006)(56012099006)(261021121427099003)(261021123027099003)(261009223027099003)(261022105027099003)(261102123227099003)(261026140227099003)(261028144727099003)(261102130727099003)(261026121527099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Xny4WMstrnWCKl5cO4wOiy//thUPStux3yY8xzRDizr6mPAVpSVtLmRyh1Oju0dtJN4c8d25GKS+o4YT+sA7ukb/mT0yxxbCXZLIppuFoKephpqKgBAI/yo9rCfro9w5Y+pu65jtZtggKmP3h/0jTduAGq9KdUR2tssqApLvVJnIoUpyDroDwaE7JHhHKwgBSgvbtl4P8bbDclBlwcqLr+SdQYcxwqGl5wJOhk7GnjljOpAMEF+GT793gVOBhL9qCTMJFXiXDqPkVCQZi++L8a5W5sjxW19+Ds234mIXD1quxVBh2zXjjQGPUT6rA+atN+Of+QqoGlpMPZ6Ljp2NuQDZNAFL9yvY6qbrTyK6KOVqkv8rcPszsnALDtc0qxNua3NoY+yOLfm4/W0JR/4TRDFUyGIB8Lb2hCcJRC6AxKuvHp4OLvf54DczQjJM9GUx
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 17:08:23.2822
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ba9501c4-bc57-4bfe-e399-08df498461ae
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0006C3DF.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB465449

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

