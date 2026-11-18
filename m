Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.85.10
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794998782;
	b=5eT+EC0/i+iNcQWrb502Ct/UM/iJyAcgNIjnpNbsSXhBs8Hp/p6kKcyjktL8d/BMYU+/
	 2U5YtjALMDyZpr9j0wuU/0kw+7zIN5Ez/ekobudC3dvTBUV8dXS1wpvwvAzoU6EKf9fCq
	 L8Bo5wyzaWnfy1XFzhKQ6Iv3zijwV2L0eO9a/jnthLkZlgaxL6K2hucJUztuv78d5tggM
	 rDrDWBmmxCNJKF4I1D9VcwkGQiUKJi1RvIQ598CWaOnyLgQa0KB+C6ibvWNUmJBLbARV0
	 qG6/Ng6lWqDhYIj/OLTE3pu9EAKBUBon5c/U9r0ILj5S6Syg2PDweWGMjkDpxSO7CXw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794998782;
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
	bh=fBfLulQDBsViWKJquVogu5YvdACWq70IES3d00VorWI=;
	b=DJbhKrby6tWed4WebzpYxIkfrN+SDIZF+kAv9odiCmwOXMcRSqGRknTB+vuFTdfjJp4T
	 VAgtQP5W1sCCo2Bka7vTc+TACN5tW92QpVV85bOQyLjsxOokMPNoOyEvmomBLDKlkE6ZU
	 ldp3h8b9A3tphqiFXNubyn89u8gFqZoYIlHlBWYXY7atzPDdnKIGtipYsofpptAUTiQJo
	 qnmagtckDVgDbAy0kV0rX7erydaBMb8c+P7zmmKqgzfvRXne3nvE+0J8UnQuvh5DHjlC0
	 Zlyekdxk2UH6VJ724YPGyh0TZLAZIB/48OfhDwpWy4/0hVZUN+8wB/ohK+6zW4r6JpA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b="elTUF/4A";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.85.10
Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010010.outbound.protection.outlook.com [52.101.85.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3197606A31C;
	Wed, 18 Nov 2026 10:46:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3197606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=elTUF/4A
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f64m6jaAL4zhVlwT+DiLmxJSY+U4NrGDZL3fYytg82x2eXtLsjXtNSbm/bF9X8QbzhlYj9X8c4yMaVfNYvFxf+YskzEg8YTVft6iPWIbMDha066VpuoSVPLVOhD9yfCNR5xjWCvCGm0JrEVyTw6uReC8oNdeTxYrwkaZ59nzhZ5rab6tW6DUgSqiOkD6N9Ks7ZVx2EIbrFw68grcprMo+ijf2qNiampg5G1WHJsKyLN0+8dyAf7FKVft9KxHHdkrdHNOc/uSR9ivLqxKm/Lx5UpV2R0GOwuBORWYxgvP1txXsVLNW8hrb+2i0A8gqwEhvR04DzF6scIf5uyoFWwrBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fBfLulQDBsViWKJquVogu5YvdACWq70IES3d00VorWI=;
 b=ENHpFoSnVsDbE3ZUu4O7NAg92LK+i/YI4/rO0xSiQXCoobrrcPv96p1KGJc1FBBbuXqKlvXNEoYEYvfALgdkYp7047NAQPDb8Y7shT91V+xWWheJ/LYxSMadtg5eqgSTteK8StLgaH6L7ZUeuG+GJenzLbqCRy2h+nZgeqNmdNQeOsfH0+6p9o7IZ/UXhBr6YiFHURsdoqJ9rS4tgEP4h6Swnc/xsiKLBOncsr76+8mtJcQTtzicYrv+tgLrLF4Vto/mS3PxfVLOtXgIzOiwa3R8i2w0TvazD3jzrwd8jMq3uCaij/McoMW5ULsaj0d5wCDfYKfwhCvZdT8W9+0Qtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fBfLulQDBsViWKJquVogu5YvdACWq70IES3d00VorWI=;
 b=elTUF/4AuTvjtJP0wCSLxMH4OH4DQAb957WVhZpytsDkhJQb8oEhebYYleP4ZAJ5AKLhZDlf34xplogfjO/8HsKvtTBRaQnl26M4ZJtq41aNcs0Hjq0yqQuCr6nD2sAInq6p9nG6hc/YJy9si/vaNRL8RSDOkHjGOKmdl8JZ774=
Received: from SJ0PR05CA0199.namprd05.prod.outlook.com (2603:10b6:a03:330::24)
 by MW6PR12MB8707.namprd12.prod.outlook.com (2603:10b6:303:241::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Wed, 18 Nov
 2026 10:46:17 +0000
Received: from PH7PEPF00000009.namprd04.prod.outlook.com
 (2603:10b6:a03:330:cafe::d) by SJ0PR05CA0199.outlook.office365.com
 (2603:10b6:a03:330::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Wed, 18
 Nov 2026 10:46:17 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 PH7PEPF00000009.mail.protection.outlook.com (10.167.243.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 18 Nov 2026 10:46:16 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 18 Nov
 2026 04:46:12 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 18 Nov
 2026 04:46:12 -0600
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.57
 via Frontend Transport; Wed, 18 Nov 2026 04:46:08 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>, <Poojitha.N@amd.com>,
	<lee@kernel.org>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH v7 14/23] soundwire: amd: pm_runtime guard in remove path
Date: Wed, 18 Nov 2026 16:12:33 +0530
Message-ID: <20261118104353.331556-15-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: PH7PEPF00000009:EE_|MW6PR12MB8707:EE_
X-MS-Office365-Filtering-Correlation-Id: c8f71636-b4b3-4768-95dc-08df45612c67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|23010399003|6133799003|10067099003|22082099003|18002099003|261009223027099003|11063799006|56012099006|261022105027099003|261021123027099003|261021121427099003|261102123227099003|261026140227099003|261028144727099003;
X-Microsoft-Antispam-Message-Info:
	2MIFgOvsKdHxMsjjmxJ3+IqaUVip8ybhL51h9LHKr0krMUNpX+txiLrLCbk2pEvPopZbG+wE7aG1zYXipQHqkc5hxfdE9ocIoih7Df9ukhGWr+nq9DBCRm/CHSPLclUCnnSlo7nNLvZWpU474CMxjpLYv+xECqtIn0I3pbNC9VULJW92v63psIgp9EiWI7Dqds9d/bhdJhMks/eD+k09eVAP/8YJBoxDHBGzXY+4vZfLewT5DhM+4sEmpfn1sUYT29/PAZ6CTrbakh1nR9/+f8VAmVah2kUx2izKMPjCEDesl5C29dH9hYGr1Zinyc8ng4/B7QZw/Vxj5ogsG0zUO6HKsFN+8NmvYgv8dpRdO4bqKClLhuzuFIqgaNRjiJSznMtmrKpkum8ByKb2TUi7dhgyDAe36e5Db2j4Mk1mM5NR6G2tQNOFrdeqHw9KG+lP0k+htFDTah1CjUvkeZwm7KlzA5+jNMnI4QcRJK8OyJlzFs3aculSCRSpNa9pIl0t1oRAR3cRGoVTMFiwGHpvklOHPNFHFJP7Fk5CZLTc4sBCniSjlqo3Jn/VjXCj4N48I0318GFiG/LnalK6qLvE26LcT2ZGPShEBy4rLCRDuOA5R3KLAtHINW+cQ2MOKsEB2Jlf6Lu6KQsbTXWRwr7T8eciDLCWwA0NhEYWLp8s4Ch0dMcSLLdtS1QYzPoZWIC/q+u6Cf+ofrsPZCHbxxuh7A==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(23010399003)(6133799003)(10067099003)(22082099003)(18002099003)(261009223027099003)(11063799006)(56012099006)(261022105027099003)(261021123027099003)(261021121427099003)(261102123227099003)(261026140227099003)(261028144727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	nrTgUoEN3cgj+oKXAyy1xHbl3PCIYGl6xgD2DRocLGAO02oQGAsKdSzkjh+sJcdd/ZoX25YnVPzNJpDRkED7j1O0CrEgw5cDE2atFvqSKyXkaxumgrG8eZUvvONgtNxgpttWAPL6nFR7oaNxWBf1hiXBu8uT3AylkVtAYabnqitcImWRQNTAkbdkJb3gxPGUQZNY5UWwcxsCeQCCHHXNIkNdj3YMuVlDMiOp1IQYkEJ+GZvQg0eCQVWDHbbx+GMTx4NnVMCWxjTKOFTin8BUt29ZlNgc6BfdCXuRyWpfYwfp18nq1k/f+DTGA0WDJS1XLSi99TD6cIPRAFWbuhnJgp2k+NHIL+EaJk0fPAEKMs9kXXSLKmrCkehCrcnWJ0F7JfgSbo+Plpy8b3qOKKBgNLghs4g4aRNY0KPjJoPHkYP7iZztWGwin8gOv+/qoN0z
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 10:46:16.8284
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c8f71636-b4b3-4768-95dc-08df45612c67
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	PH7PEPF00000009.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8707

Guard pm_runtime_disable() so it is only called when runtime PM
was actually enabled. amd_sdw_manager_start() calls pm_runtime_enable()
only at the very end, after several fallible hardware init steps. If
sdw_amd_startup() fails mid-loop (one manager started, the next fails
before pm_runtime_enable()), sdw_amd_exit() triggers
platform_device_unregister() for all managers. Calling
pm_runtime_disable() on the partially-started manager finds
disable_depth already at its initial value of 1, silently increments it
to 2 and returns without a warning, so a later pm_runtime_enable() would
only bring it back to 1 and leave runtime PM disabled. Use
pm_runtime_enabled() to skip the call when it was never paired with an
enable.

Fixes: ed5e8741b8db ("soundwire: amd: refactor amd soundwire manager device node creation")
Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/amd_manager.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
index c412d4ff4606..93c96613b5d8 100644
--- a/drivers/soundwire/amd_manager.c
+++ b/drivers/soundwire/amd_manager.c
@@ -1265,7 +1265,8 @@ static void amd_sdw_manager_remove(struct platform_device *pdev)
 	struct amd_sdw_manager *amd_manager = dev_get_drvdata(&pdev->dev);
 	int ret;
 
-	pm_runtime_disable(&pdev->dev);
+	if (pm_runtime_enabled(&pdev->dev))
+		pm_runtime_disable(&pdev->dev);
 	amd_disable_sdw_interrupts(amd_manager);
 	cancel_work_sync(&amd_manager->amd_sdw_irq_thread);
 	cancel_work_sync(&amd_manager->amd_sdw_work);
-- 
2.53.0

