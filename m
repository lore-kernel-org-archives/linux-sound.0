Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.57.61
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795510346;
	b=0vy5AGH+QqSUIyRK8VnUJk8BicpVbndsjfZ+fkvv8SBp/ZUTycCub6WCJ3lNHM/w0OvL
	 Xmp9K47qCdzQsD9rF1PKlSwn/1ZsX+UNZmRhbPS3P9i7jk/hN+Lr+Z+iU/5uo0JC/K2tc
	 Ky6/xVf5EGhiSYaXKaa/bm7cUiBvbAYn4rbAcIqkdquARGh5xpsu6a6RyqQYR7+THnWSc
	 ALkzTtCtIU5eWFDtdI1emNtzQQ53GxaiPbaJmM/W/CAmC7OCdSf2JHmNv+YWJCpJwwVAd
	 7ET78g7gj7t9YuelSyWEhK3n4l0EmY0V/jKInwwvgPv/+3hv/tihySYIJCB3fY10OTA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795510346;
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
	bh=yP/YwroQFk0PJFb9eTj9zh+0/SYNgsuMxRI2l6KZv1A=;
	b=TzetZuLVZiywAmZKJ7QoJR7BszjXhMJEnGvC96Fe7zUGKlfyZ9GAApMQaTvoVlOpiqWC
	 PgsPyfXSw7GsN31CaQvpxT38Ap/bbwRafcJMNqxV9oPmpZnzzCgLQRh/JX4ZctvO+rWFr
	 CuszNP5KXKSuz7I4Sgi/wdwjq1wL9AdB8R2tsDe3iVzbarJ0s+XT+B55Nmlk+gP9XQYmD
	 hAGlhyWDnS9YWUB4ZblUcs54VgXEH2qb+dZOixD4cDcFI9OyMTjTja/kwmC2GXtAC94E+
	 kb2rG0Sjwnwt9KW/xhacLzMBvS4v+l6cxsiOlnnYbYmiurFu2aZ+pyunLVh3bvsXv6Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=EBvGZAXR;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.57.61
Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011061.outbound.protection.outlook.com [52.101.57.61])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22060606A335;
	Tue, 24 Nov 2026 08:52:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22060606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=EBvGZAXR
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xA/DqHon4i2MALxOkhG8awErehYOxRdLNSWsAz3yEgipDy4QjGRHvj2m3RmSnABLIPky80niedXHpfr4DMnROHk3kq4OmhRyyTIjyGxZVYbqXyyjKoAgHC9NaFCteya4nZrBWdy7nRknsrRGxNI1H1mOS+5Dqr3dXS5lvPO5ZXaJcCuqEcNZzSkua9Lba72TEOORsTcG4qJxkmXsGuMl3VOKgRmZUB4ALfljfoq+ei5Zxy5UtJnvecv7jSl7uVvo10jeXwaQ/z9uNJIuTM/qaEb1n/nyteQEomrQkQj2GoyxLY0exmycg5wzA40+iaf/bwEm7V9ERJ4j9ERDI135bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yP/YwroQFk0PJFb9eTj9zh+0/SYNgsuMxRI2l6KZv1A=;
 b=pMAHsl7QWA53OfQyKHKV4t6YBL8q0DXzvIqrxiZiE3Sy6LHsRzZt/cdxbVWIvcZDRhKYPBxXUIPqD2rOiIbh7dj+7F2qMnAR+RRTn+dYwEuXgpoT/DgSsb8f4+C/+KBNp47BEifqGQCx1LSg4r7zBMP8pJPTMssjla3VAxRhcQHv8NbDVqjqTmxrN10xnLxsE7ncbYgwNt8IK3rzuCpwVPLRE/8P8Okg1326epWfztRBzoS4RkDRyr26n397Hbl/AbIcBaT0kjDmee/sch+DZYUOGvOwsjbgXs1K/5E8adVh8BP+7xX+/hw5IM/58NPkMOa0WOJ3RijC3aixg33n6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yP/YwroQFk0PJFb9eTj9zh+0/SYNgsuMxRI2l6KZv1A=;
 b=EBvGZAXRzBRwucr+wh7qgnwu7fw96L4GymxzUjVLL0EPKRGdb11ZNA01I1WzfnUHRjEcl3QCwNs+DlFp4HJbomT0FX9BnopgjoTjmxquha68F/fltrFOJzzvBHUxxo5dRH7p6XLWaULz1GZCmtG1ynjD7PlZwjE8GvxCX5tBOMI=
Received: from MW4PR04CA0062.namprd04.prod.outlook.com (2603:10b6:303:6b::7)
 by CH2PR12MB4085.namprd12.prod.outlook.com (2603:10b6:610:79::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Tue, 24 Nov
 2026 08:52:22 +0000
Received: from CO1PEPF0001885D.namprd02.prod.outlook.com
 (2603:10b6:303:6b:cafe::36) by MW4PR04CA0062.outlook.office365.com
 (2603:10b6:303:6b::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.6 via Frontend Transport; Tue, 24
 Nov 2026 08:52:21 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CO1PEPF0001885D.mail.protection.outlook.com (10.167.249.246) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Tue, 24 Nov 2026 08:52:21 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 24 Nov
 2026 02:52:07 -0600
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.57
 via Frontend Transport; Tue, 24 Nov 2026 02:52:04 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>, <Poojitha.N@amd.com>,
	<lee@kernel.org>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH v9 07/24] soundwire: amd: remove STATUS_8TO11 clear from amd_sdw_process_wake_event()
Date: Tue, 24 Nov 2026 14:18:13 +0530
Message-ID: <20261124085033.682755-8-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF0001885D:EE_|CH2PR12MB4085:EE_
X-MS-Office365-Filtering-Correlation-Id: d6d85af7-f53a-4478-a068-08df4a0840c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700016|23010399003|18002099003|22082099003|261028144727099003|11063799006|56012099006|261022105027099003|261026140227099003|261009223027099003|261021123027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	aWjtMSAyf4i3FnHZy0WcWsMU/0zp7rnB+1YXVpt3BN6YymIZ1F7Cy+MidWGHhPPMryZDiqy/s6UlXWFks1kDlU6q1MgzTztG0xq7XxB46y71QEDe0lui+/p/P7OZcS4syoRuMDSGRWUnT3qAF5MbFQL5DqkaOvZEbalASuYUyiElJwMkhJNqFTRVFEm6N0nLFfXUuGqKOIM7HiycnnPIepLeKl+MdJrZU0MrH2rAi4V3+8ttt4QIOZjYV1V7WSsXUTqORamhJOGkL+JLClfnoso387n6s+oetiN/+Fe1tqST2plkD99sFEutgRZp1eFMvmQ6FHB2BGUMj76PloCX7XPtA7L893wdQ6veqyHQ6ynG9LWoqwpbtrNb7ew7cCEq9qTdzc/j2ge3ZJaIdXpsiwzT6FcmX985AXnZNXFdqNPwrFWaUIXN7R7O/oSmDD6QyKTvt/oth/rvWp77NEUDt/AEvwDyL61Ywp1XloQXtNT0q/sB8TbyqpLBeeq0G592DkUIfCbn+MrpwUB3csp2eSMhZ3W6YZsgzBfkknUDSAZoSZnwuEP4TIockGzZcbZrcEfwzzrUCIoYAt+wS3ctAUpOuAf9TcMIpoFn9HFn0dCmYSn3t7r8jry2GXTslQQV8fHW3ngiedZKDZOJGQyIJ0BsSZ5l/APHKwewZZLNOtpwm+gqW2loLJIYoT+O19wAmisspPAfvWClJaC953H85A==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700016)(23010399003)(18002099003)(22082099003)(261028144727099003)(11063799006)(56012099006)(261022105027099003)(261026140227099003)(261009223027099003)(261021123027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	uJo6sBPrKcCIXIyGfsMoWAJzgYiJB+spMbQf5v0Ca6CnJp3kPuWeQ5lJ/prsFYByVigFYI6HX6QgITxgMLc+IrfT++4sM3OoBHSkF2yp7m7eRaYnAx82StdoOfWzWAd8EoEcXRc1ZC5mg6QeBoypRNi+Mmgap/pN4r5dBILJTnjiHZt8ghxjHNHZmPcvkiViospzQLOuZ23ycuWYOfzyyS0ivYy6NLYGAbr82CzWBCyXB8Sjwx5m+m+u9mcTq9J/oVbR+gG/xIcjMugLUDNaLo0WyMkCEah1gIpgiHm9ubdIK6+dEKr1DahFjsIfFbQJAH2prjgIKFr840RZJgVWzfC+QkcuOw7G95Agba7dEMihVdVbnPI296C1FghjHysrhlXhCLx4VyYdYFORzO0sJ6EPRyTLtGhxLjhpFQeeaWfY0Tvmsdz3heGodypSUJxi
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 08:52:21.5561
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d6d85af7-f53a-4478-a068-08df4a0840c7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF0001885D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4085

amd_sdw_irq_thread() falls through after handling a wake event to
process any coalesced PREQ or peripheral status events, rather than
returning early. With the fall-through in place, both
amd_sdw_process_wake_event() and the tail of amd_sdw_irq_thread() write
0x00 to ACP_SW_STATE_CHANGE_STATUS_8TO11 in the same invocation.
Any status bit asserted by hardware between those two writes would be
lost before the next invocation reads the register.

Remove the writel() from amd_sdw_process_wake_event() so that
ACP_SW_STATE_CHANGE_STATUS_8TO11 is cleared exactly once per invocation
by the tail of amd_sdw_irq_thread().

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/amd_manager.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
index 65626ca590c9..438cf52a212c 100644
--- a/drivers/soundwire/amd_manager.c
+++ b/drivers/soundwire/amd_manager.c
@@ -1093,7 +1093,6 @@ static void amd_sdw_process_wake_event(struct amd_sdw_manager *amd_manager)
 	dev_dbg(amd_manager->dev, "SoundWire Wake event reported\n");
 	pm_request_resume(amd_manager->dev);
 	writel(0x00, amd_manager->acp_mmio + ACP_SW_WAKE_EN(amd_manager->instance));
-	writel(0x00, amd_manager->mmio + ACP_SW_STATE_CHANGE_STATUS_8TO11);
 }
 
 static void amd_sdw_irq_thread(struct work_struct *work)
-- 
2.53.0

