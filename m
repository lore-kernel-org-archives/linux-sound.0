Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.53.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794998789;
	b=xH7XRULuIUKi4YoDTS4CLA1dzD+gHUwHYDG2QoRTU8Ho873k0GxdGaiF8cvDZb2jZhRn
	 fUZUowPIehftJfGY0j5PduxKoty4NDbSxYspN9bPn9iQMY6iXnKWTd0NoHUYbJRaA58jB
	 j6y8lAOrrtl0IdwuaipzCND5STA82vpUE3uOBMLBZK/MzoImF21PcG1X9PoHxQwUpW4Z5
	 c4/FCRua/V9j0TNMAGkeasBZEYh9QTd0KjBGmg0jnlO2OjIOvEWKnLB4oay4jV+KFF7aw
	 XOy91UxGheglepSW7xPl88yYqc4H8PglzZDcG5bveGciGhqIRfTrsfC+d/oeqRYkDhA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794998789;
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
	bh=mom1yHCINSb5p3sykc2XVN0qgIMnn3q/LEvMdi9yOTo=;
	b=WQo0WUYNmABy+Yqmr0G7uOqTisyQ7vvekC8AHGaiqHFIKb8wiOAalvlAi9bbdOQ6i/1+
	 uWbuNpJVc3mIohwdHTvzz14E6JeZTVPt/6G668RkXCf3zR4bxT3EykQ3BYBgvxtBbTlms
	 9So9qaMNvnMTYLkbEI6EAK1ZmdpheJfnVbasuwa/i6clBi7qHdzgeFbdE65udToBeeZu5
	 UN9SazPsCw3NwFhZjlTqb8Z7VaBgmMRB0ocH5L/mxN4IYyXqTPV7r4mrGjZ9J0KKANsUL
	 p64BOTlYDwT8tRImchivXp3r3zpO69tlNPze6pZJbZM6Gla1EIZGdmYSYAEDyaVj+1A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=RrQx9q60;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.53.48
Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012048.outbound.protection.outlook.com [52.101.53.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD56C606A335;
	Wed, 18 Nov 2026 10:46:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD56C606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=RrQx9q60
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CAsdYRzsu/d9773quX1TCvNst8Ubp1H9Ftm3V0CgqAmUJfY0hRhX4L0v5+9ZCEahFF1Ig33udHKkrBPsKct0IoPYHMqmxQo5A//xsOXXqU5aWy2eq4HQEnV8YRz5zT8RL6rh+34x2wAIjVpcacWdKDA8vajE37ffKRwcr27Hm8gX91Os+7nKP5de4BNIp26rgC99pmXmKq2Qy3kHod7D3ePX6lM3CQJwl3r5sw8WwB4PKmoNVPsXDhDJS9dMtoZ56Zj6kNhyyPSumtxSWzAKEW5U5dlugWzIlUlHltzT+prnt30/7wAY1U1Bp5W20iLa+p3gJB1l6Qgv1EMkvVOTmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mom1yHCINSb5p3sykc2XVN0qgIMnn3q/LEvMdi9yOTo=;
 b=ZPxr+4rnlDYXnVvrdoK2eRk6PzV2tMZH1Q4spQQyWkV+zWjKbiiFCPwQ4+wCkKuLiGYAamPKDQEI9JhUmBBQdHAOKmOmNj6B2ZD3w528QaST2Njag7cwKPV+yIUXu0nUyZYU6pp1qLiD9JSX3JXYvRli/cmT2MTE3bGXSllPu2qj41lrOA9Y5B3kP6tI3sMwb+TkdyzeT/93D+9mRLPBoh4yKS35CJz+N+T+pRyIQFuk5+yCZQa5p3H/KZUhPb463FjZfvJXD6J/29l/uTOqu2VAOV9FCb6j2kt2WqRT4US0YitUS1mViVmKnyNBfXp5aSaSgHc1igejLBmWPER1HA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mom1yHCINSb5p3sykc2XVN0qgIMnn3q/LEvMdi9yOTo=;
 b=RrQx9q60UdKn2LSrbX0tacyB3g6xu7ebfiDvKA0PTNLZQj3xMLNnd8QeiUP9v+dIi0vG0CV1q/dzwXYrdAQZZeC3OwqC3gUwq9CM3LPEEffhCxNYInnyJny6DRE/8GGydfPfGB9DdTYychHQYYqLPtk5CtDaEPH1BGVGA8zbaAg=
Received: from CH0PR03CA0368.namprd03.prod.outlook.com (2603:10b6:610:119::17)
 by DS0PR12MB9422.namprd12.prod.outlook.com (2603:10b6:8:1bb::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 10:46:25 +0000
Received: from CH2PEPF00016D4B.namprd02.prod.outlook.com
 (2603:10b6:610:119:cafe::50) by CH0PR03CA0368.outlook.office365.com
 (2603:10b6:610:119::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.9 via Frontend Transport; Wed, 18
 Nov 2026 10:46:25 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH2PEPF00016D4B.mail.protection.outlook.com (10.167.244.120) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 18 Nov 2026 10:46:24 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 18 Nov
 2026 04:46:24 -0600
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.57
 via Frontend Transport; Wed, 18 Nov 2026 04:46:20 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>, <Poojitha.N@amd.com>,
	<lee@kernel.org>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH v7 17/23] soundwire: amd: propagate amd_init_sdw_manager() error on resume
Date: Wed, 18 Nov 2026 16:12:36 +0530
Message-ID: <20261118104353.331556-18-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF00016D4B:EE_|DS0PR12MB9422:EE_
X-MS-Office365-Filtering-Correlation-Id: 0440c58a-bfda-400c-4378-08df45613140
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|82310400026|36860700016|376014|18002099003|22082099003|261009223027099003|11063799006|56012099006|261028144727099003|261022105027099003|261021123027099003|261026121527099003|261026140227099003|261021121427099003|261102123227099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	poh8wxSPm3ZuOMWQk3s9MEDKdwC8rhQ2BB4sTkMklG2GWhckoCpaT360+a/vs+oIhGpyZQ8ItD7IPvNPG1IwQuUAUyojE0ikYBm4CkU3YctoSbjagzuJ74bIBoTGJgQbCSS3za7tRPvPo+NAz4/xAV8RtP6YfeIUJuEMfxaezRE77bWqdtB8Y/GzcolOak3FtzQkZfN/HR4YrJFTu+/eGSr/57hpMXyD44VdcHEwe1nmI5bXfEGIHpWnRuhtYI1cVcKcJ4+HHezb2gcSsiRyvbMCMf5yo8B692MHWVDCtFpRT1Y/q3b0r5fidq79XN3T8OJq5FjuYCUSuJZCW/9qh1O8rebfxKv9eWXswrxZILM4u/yO+B3b753s2dV5oZsk7dakaR6EhnkO7yUJeV5SIM614m1ffWvjd2wPqdtNY5FXcjHqFSCMfTTffmoqvZVA6KOGaYPMorCBDR06GaJi7i65fDIxCYypzzrL1eFbIpxb+ma3b/i7Q9GbM1ePCd8Pu06i6i31h1xtV3NlzZ5XSxxoDXYEeju/2aP9KNxTpjOkOqfP5xT0BXWP+6ynFyBoglykvfpnguh7JDroYU43ScasrMo1pS2lksU6IXC4Sk+BWM0F1qM6XwoFSJYD4rmfRXaxOu0d7TqrIhpB45ablbFgnoSqctQ8Gd5Sy1gsp72mwC8fKRCv1PJrJe0zpzqDNNBkGv3qOaGzR/Uf5xXCTw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(82310400026)(36860700016)(376014)(18002099003)(22082099003)(261009223027099003)(11063799006)(56012099006)(261028144727099003)(261022105027099003)(261021123027099003)(261026121527099003)(261026140227099003)(261021121427099003)(261102123227099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	nvZ+l6qvf2KOMZSRZ3ApXOCSLoi4bA+hi/LzXkAf2+IO0AMwuf/jqIhiH8WAPeVFh8RTlgAlIyasc04ziHghcQSuomFQplgeaYtB6Csbtq4CqyrPK8kPsN6zTj4iFnA18q8BT9XO+Zv6mWd2aLD+YLWyaF+VTbJCaMORTkOJ1I6mPVWuGJQfuT8rxMKUarqneYZzcv/CmAa8TjlAtoZcHdPPGIXHZhKRbkymZ31OJYz7YT+aPTyZrcMmUc1+WIc5cCxoGnA2KwO3eBFr2soe+vILkp91xp0W+4HMyICA626hxouPK+XFpXEdEqGnKHjdv/8gXcGP8HQQtYbjXSHu/ibnUXRsHXT0qjDRm1A/NylNX8uIUKWNNm6Jg4W6yfP0pDXF1hG4zUmXotha618zV80R+EvxO7crfHa+lg6Wgl+mVA/MS7zAJw2rnwLnAhHE
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 10:46:24.9774
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0440c58a-bfda-400c-4378-08df45613140
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00016D4B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9422

In amd_resume_runtime() POWER_OFF_MODE, amd_init_sdw_manager() was
called without capturing its return value. The function performs
hardware bus resets using readl_poll_timeout() and can return
-ETIMEDOUT if the hardware does not respond. When that happens,
execution fell through to amd_enable_sdw_interrupts() and
amd_enable_sdw_manager() on hardware that may still be in a broken
reset state.

Fix by capturing the return value and returning early on failure.

Fixes: 81ff58ff71ad ("soundwire: amd: add runtime pm ops for AMD SoundWire manager driver")
Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/amd_manager.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
index 1a3d3af4e0a4..934a8f0f3298 100644
--- a/drivers/soundwire/amd_manager.c
+++ b/drivers/soundwire/amd_manager.c
@@ -1591,7 +1591,9 @@ static int __maybe_unused amd_resume_runtime(struct device *dev)
 		ret = amd_sdw_clk_init_ctrl(amd_manager);
 		if (ret)
 			return ret;
-		amd_init_sdw_manager(amd_manager);
+		ret = amd_init_sdw_manager(amd_manager);
+		if (ret)
+			return ret;
 		amd_enable_sdw_interrupts(amd_manager);
 		ret = amd_enable_sdw_manager(amd_manager);
 		if (ret)
-- 
2.53.0

