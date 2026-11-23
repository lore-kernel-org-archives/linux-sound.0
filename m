Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.30
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795453637;
	b=kaxOCzuI4VhCrRZUPcPJKxUadPwmWiLi1LbStmhl2+mIJ42goI1P7whYI1lqxKZW6ANq
	 O/dJWHooWuGrggseKedcXGbkvgB+G7qwF49nP45DHAAiHZkA+8m7af7ycBv7+xN+q7+gK
	 NxdxjKLvakAcjFbCXsOhKJoMaWBjNzoDdWHKz/auqDuvZudCKgb6VeG7gwhmUfnZ8+PvO
	 v3FxGCg0ZTXtQgRGzVhZ9nlavJh07bFu3Cz04uqVYPhuMDZWdPQPNYPhn9Iq4kM9vW8CG
	 7dDBy5KZLFdGwqUmQa8i/shcGlp8fwOtLTp9HO9eNZj24y//vg4Mg5TRbMoFwY99WUA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795453637;
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
	bh=yP/YwroQFk0PJFb9eTj9zh+0/SYNgsuMxRI2l6KZv1A=;
	b=UdtkUHdxARFxDbuDaA/o7WrZreR8+2suJ63SA6BX+fBXvYBoQsHalxafFcXlI78S6OLJ
	 SAL4k0UmDbCQa2IgDQDzLibesANjBIPPLi6xxtlExlQEKlV2u/L16JhCBwG0CFXsHbQm3
	 w2dPc7fQFSf+lBH3h1ALFCl5utQtJFkkM4qmyjpUhPFfEzW3k1qcRY+pESg02w+6TpheM
	 JOkn3tzHBWbYeRuQep/8XdoJrtF9MCdl24hLMj4PFU1BbvwYcCO//Mi8OuPdjdCJ9DBWA
	 yXAlJ1iN3ybGyXEasS5LqCx7KCBp9DQLfArREe+wuubV6VywFwIZBHewYXmpI7iH/Ow==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=J6dW0yL0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.30
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011030.outbound.protection.outlook.com [40.93.194.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CA30606A32E;
	Mon, 23 Nov 2026 17:07:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8CA30606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=J6dW0yL0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HCPIuqeMQZa44WtrtUjb2WCtW67BE8GK4MozuQ1H+BalVU8PYJo7MDnrAjcPTvZe71kZ0UuZ1vPgZuhCWyuOnxJIsGtIYj91Mw829ONXVAEpxniFlI3qIczAC/K83MV1VdRhos7TW4ILNcANleyPckZxo9kbNQUniaXZV86hsEJCt4H7EyPqLYfkyrXkTrgEYrxXthvZFYr33PhEa7YgR+7UeLs0dgHTZVKZh0X7NPmdbJq2WnviIU1iFyx/+fLE4ShnPtdFtaHyh9WCqP4Mg2veez6AZUXKNIwcOAyf3LSaiCGFgyxfBJFgb9z5iQFz+sRG55eqcTdqmRVm9eL5Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yP/YwroQFk0PJFb9eTj9zh+0/SYNgsuMxRI2l6KZv1A=;
 b=mlNOdFoa1BPnRaMNzE55pjWKJGZLQLRY/cncjngW1bnhV7TuYJZNrl2tDMLjIzeODmNd7FHG/mG8I9AbFbce2pmgWmoErMAgOd30o9EbVVCnJXYTccnKTh9pY4T52WXj253cHt8tfJwO7Dly8CbzNS79b8Rj754and2a8n971GuBz/QjAqeDnrSFUU/qfXELWOxgz7jF/K8IpRrrhvqRx21j9Z2R247EszS9qhu1oPWJNPFNhVWa6aIHTJeYvLTAcKWp7GUAFjFsJzE2BXWLmOsB+zpGGE0FFofL6hnQGvhFyNwUyPZkWcejPgOwd+r0325HR/Rd6ncnPS8+w42x9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yP/YwroQFk0PJFb9eTj9zh+0/SYNgsuMxRI2l6KZv1A=;
 b=J6dW0yL0HZuj+/Bzqdsj9tZ6Rtp/cFwGeirl/+n3jgxEdb/Ew776gCkGES+GIFE0i85GvMvdCHBOtWt58V9GGjzsM/bAc2uqk9YT9Oa2nunXWXx+tXnYmaJORCJYrM9b7qCmWy2XQuASj0U8MWSgBMxtLJSQL5wrX6KbBemsx34=
Received: from LV3P220CA0023.NAMP220.PROD.OUTLOOK.COM (2603:10b6:408:234::24)
 by IA1PR12MB9465.namprd12.prod.outlook.com (2603:10b6:208:593::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Mon, 23 Nov
 2026 17:07:14 +0000
Received: from BN3PEPF00022BD9.namprd03.prod.outlook.com
 (2603:10b6:408:234:cafe::11) by LV3P220CA0023.outlook.office365.com
 (2603:10b6:408:234::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.14 via Frontend Transport; Mon,
 23 Nov 2026 17:07:14 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF00022BD9.mail.protection.outlook.com (10.167.248.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Mon, 23 Nov 2026 17:07:14 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Mon, 23 Nov
 2026 11:07:06 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Mon, 23 Nov
 2026 11:06:56 -0600
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57
 via Frontend Transport; Mon, 23 Nov 2026 11:06:53 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>, <Poojitha.N@amd.com>,
	<lee@kernel.org>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH v8 07/24] soundwire: amd: remove STATUS_8TO11 clear from amd_sdw_process_wake_event()
Date: Mon, 23 Nov 2026 22:27:28 +0530
Message-ID: <20261123170520.1380924-8-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF00022BD9:EE_|IA1PR12MB9465:EE_
X-MS-Office365-Filtering-Correlation-Id: c4761af0-606a-4a2d-1e9e-08df49843866
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|82310400026|1800799024|376014|22082099003|18002099003|261009223027099003|56012099006|11063799006|10067099003|261026140227099003|261022105027099003|261028144727099003|261021123027099003;
X-Microsoft-Antispam-Message-Info:
	bsjB14em813e2Gp3CIQ8WlpohrCPCiS/RjphOOn3Bz4A7DkZjIEJiN4HjJjkqunq1pZ70Q/D9xaWTWQhAiynHRmG999Dlf/R4HmGzDLpyKCoTgSNUGgULIrqMcEg0+jIXFlXsgYEI+3+V45J0meQMAuvqwbQG11Cso3WmUIfsXnmTpVcGqWMvLqgT/RKQGEHntIvd1SKvxAxzhgp1eeefiLtidH7PMMNPYcFXbveBW/8QhWc83qJpn2B8N/SfAeBdj1twt8/FLTgMsY9XPvdjs6kWl3zlM1UbwsVILkeul7xcEgUtDqx4t5PshtItLsrOMYqccYiioWXhBmnmgUw+fQ96WY45V50sYJZ2VEd4y/mGaX2RbqvxjcB1A1+aKklMW+rt/+cGLDpn2xbVxSfJAk7efmFQnPnlPhaI15FIfkFrnGHdM1RuGZ+xUEEMbe7SZ0oos+TAlSr55hfhFfI3/3eINF+4U7iKff8Sh8oNX9FvveIGFmAtCmoQNJGHcAPgwfPGbEHGP3AwojF6ICAl6qs2Nan6AI0j/mY5pBY6TFbgI6YoC5tWfxG4O0W6GQkCHYJeF1UjI0KtCMGYYT5Rjc0OX9EPaxcZ9460VdYY26/2v/+GCVIFHmCuCfeYg0PCA01/uz/gvJXquOvOooLp/SDHYhKidrflhau7wrDX2Gt7MhEWSkOQAkqXTOTuQVmaednSDNRsJOZ7CNlW9yWAA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(82310400026)(1800799024)(376014)(22082099003)(18002099003)(261009223027099003)(56012099006)(11063799006)(10067099003)(261026140227099003)(261022105027099003)(261028144727099003)(261021123027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	eQh+MxIu2WhSqqQaV3KlUe1XGMsE7K3zD271RbNV7bwlURYmNdO1XBqi1oazZh8qk2bWGHUPbiYo9Rgf9+WnrDz6PqlKZEhsghiQrrcJrnLfWlB7DMSuos+/jjAwNnupYVvByU29oLkqwrJRQTj18FVPcD8bCA6BSbMRWkZuUbpA3FMQTew7c87VUxTzOPaW+BtaTA78c0kLq6I3/cSY5YYipLlLLGqEWg8IBcWrc2sRSl0vO8b9ItkXhFcydEfefAf/I6JLz+CpdW6GGyH9CRK6pU5QFbB0CIAOkWLvbdYleHYb1ou6stnnOKuT57HZAU1x7GBCBGyXbLQ6AVfIjXpOtNYjZWc1dBEuRTC2qn9KJlLJI/AHyDoEE9pDK8Gb48JHo8VVcdbhTF87/F80WxyyuZfXoM5xu9rrr3nXHleZURalhJMX2Lt973kfF7mW
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 17:07:14.0164
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c4761af0-606a-4a2d-1e9e-08df49843866
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF00022BD9.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9465

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

