Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.57.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794998750;
	b=MP+nP2iJqCh3+yAMJmAwyIQzR9POOlZbvweJGZum3spyXzjSpYivCjgGM1NNTq8UtgBc
	 jzVds/fgaTmuOwjMDJyPbowrwEPxEXBkf88gvef34t2O62KMhsExBarHGe2GLS8TkbR0k
	 0LnJGLuOCKulGZzrIE3QQIHYYL1hMd2EAYHL/QRQeKzXLApU6F7IFGFBE/2b90I0aDVlY
	 K2rrCSksbKGYNbpr/pDMj0Qe5zWa2IIhuemCGGrCUkT7Wtidu8t4q20rfITQbqaRNo+b+
	 B+L+ASjgBeA79B4ZHne5HSqx+42jB8w58eczGE6NcwJ7VLkLOeUZh0XeX9RtnR6xOVg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794998750;
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
	b=sQ5dZW0Pb9tPbR6OtAwzOX31BIYpQrlTWGm0iwiBkK7I1OtJcFmJej4CUmz4VTmRqFj9
	 4emK7IVFPu45slgCPAQCJooDrPRlGXZu0EkC5iWQW/EYKYXb1EvEeK495sPj/MFFeBViM
	 vkSx5mR5bLC0WXxG7uvx1FcTV2otnLgdN2Lmm9ZdbDAulIus4TSV+dQuUWDaPtijFNA2b
	 /vaNvE62Dl7SXeoMSzy7U2DE4ZxJs5lSg5/DcHr3qK2U38W8KRv/VDAcdnuxrVtTjxd2c
	 M1wNXvgGFnYIk5JceEsGqapi8RQMSuVlxQxJzvoyUFKfzyDzbZ6fh1CpPPs1qBJvgHQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=zly8Gi1P;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.57.11
Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011011.outbound.protection.outlook.com [52.101.57.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38D6C606A31C;
	Wed, 18 Nov 2026 10:45:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38D6C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=zly8Gi1P
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NdWn6DAGBsSIChQJuTtD4E81o2ABRjHixPwA5+t3vgfRxCrur+3bRVhkvt1udKpebtxbhhIkP4bzF/2mHICrHSuaT7QymJfnl3MidlHmNgZ/3v86pVMSSxoZPuVlZ9DhI9XYTdDhJs5kn750AWwRq1M89jSMtEOKyHOjT+B08VeNl9U0b38bz3oJT835ZqG/GA4ypOPLvn6ogSFRSKLMFNY+8TCjzuqo2/7yUUE9A7R5/wG56IWcpNBzzd9JP4vmjzIIX1zoHK085eRee23ASxmmU41Z3F1EAKo7sZAwTw7q3J7KB43G7ZhOBSGE4JJ1gKW/qd9vAKATzR68oXn0cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yP/YwroQFk0PJFb9eTj9zh+0/SYNgsuMxRI2l6KZv1A=;
 b=ct2rvK7RLRdCafT99H899SLVnAxlv0gppVutlMKQIZaBbJb/A6RMwOVXDVr0eqsPTt7aR8dN97LMDRhw63qJw3eyI4adaz8uapNvhZCKWML2IjreHP2Qrr0LVn3W18NJstcUUpwriMSS519itLOqaFAa5d6ulUx6fqNK714askIw0i4g5LPDaXunVXadncuF0+TBIhrqO9Ckc/JIK2zCfWOWuTAxeoomZWkYrSxkhwK/g29aGtXkXQcSp+POUpDAfrceqDBbUh73kyYJ8NNBQYYyPt11yfbTC6XV5vDSD8rksBXPE12KWvu12vJfOkDnfp8uMCPr48EFtHVgkXkjaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yP/YwroQFk0PJFb9eTj9zh+0/SYNgsuMxRI2l6KZv1A=;
 b=zly8Gi1PH9I67Mb+YGqncs0r9dGHuePD66vK/RIjVpbFCQkYP2urCNo6xcuKJ3wgBXXAOKSeYoi6Xg0n/tfG9/XICZU9PEHqIbBMV5JKOB/aNIEpaaBm0HlZJtpsSV4zx9AM9pUGeeXafzw9hBVWS8fvNdhA/X9Ke8UmYGdz+Kw=
Received: from CH2PR14CA0032.namprd14.prod.outlook.com (2603:10b6:610:56::12)
 by PH7PR12MB5687.namprd12.prod.outlook.com (2603:10b6:510:13e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 10:45:44 +0000
Received: from CH2PEPF00016D49.namprd02.prod.outlook.com
 (2603:10b6:610:56:cafe::7) by CH2PR14CA0032.outlook.office365.com
 (2603:10b6:610:56::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.10 via Frontend Transport; Wed,
 18 Nov 2026 10:45:44 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH2PEPF00016D49.mail.protection.outlook.com (10.167.244.118) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 18 Nov 2026 10:45:44 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 18 Nov
 2026 04:45:43 -0600
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.57
 via Frontend Transport; Wed, 18 Nov 2026 04:45:40 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>, <Poojitha.N@amd.com>,
	<lee@kernel.org>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH v7 07/23] soundwire: amd: remove STATUS_8TO11 clear from amd_sdw_process_wake_event()
Date: Wed, 18 Nov 2026 16:12:26 +0530
Message-ID: <20261118104353.331556-8-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF00016D49:EE_|PH7PR12MB5687:EE_
X-MS-Office365-Filtering-Correlation-Id: 83fa7b44-0f8b-4508-4603-08df45611920
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|1800799024|376014|23010399003|18002099003|22082099003|261009223027099003|11063799006|56012099006|10067099003|261028144727099003|261026140227099003|261022105027099003|261021123027099003;
X-Microsoft-Antispam-Message-Info:
	9CsbqqMCx3piwS0dJ6uefGWpMsFRCVAbLadg/s89AjyiodM1JngTWNqqplMb5Vo/ia2zWDc6Ysv1jbF78DXdQFjjv0LqGlbEFw4iiZjFGx3x48KW7ScNNrw6ukdVrtgBm9Lq8UHksMYRUyhmdvVHUQ/ib3gPoLWPHXr9LDaqzxXmAJ0XQs2uRvDXpPUUMrUE8OLtvImzzAbCJvlfzKfm8/nPht2GNcefafZrKXiJP/D7DYjNea6ux1Pr73clI55LhKa5Io9kYcDMFw9Mn1ftJHTHNWwSwmN19PxU+rOX/bAl4RpN0T9Dq/U29EcetQHUruqUzNBkorxl+qF2zEEMyUHyPZ7ebLWFWoGjAK2OYWrAw1s7ugWUu7mkjtG62pzimtpzUE572CBeE+jR5MBOW52pik++cKchy5tGswYpL/8DaYZxi46ObepuI4KKiCWOoq0CVYTUPUeqSVVwYEfUWON9y+3ZQnGg3ydCZ77PEQYfuVQmF2Ew+00h3IqiJX5nV0QAc/FpEUtRH4SgA9wfZdw9Gb0Q/kuJVJvT2EScNfabgvkNY3EWdaPq7GCPeiZKDj1kkYZ4VDLYwf6nPItsVqPOHZUYxRN8rwijfdIli8VIhtOJFCEJyY8mvGbJXuNzlVlRUQgI+2D0IlZgpGXpcMNP1j9GFIPMLbwQ6HtJYOKh45Yuf1BOev3sDPBCcN1+p8WV5noMMerA8x544q0yyw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(1800799024)(376014)(23010399003)(18002099003)(22082099003)(261009223027099003)(11063799006)(56012099006)(10067099003)(261028144727099003)(261026140227099003)(261022105027099003)(261021123027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	FSa+5oQKM89Kr2dls8lv/2ztPTXLqurBvNP7HQ6NSEReXci3Hv0/z4YwaNv5P7LQIwNHvg+KkTkRylC9xu1Yz8ZNXbuKppLRCGBpsLbg7IvjOI66VLCTWgAg/X6vPIeNbW6ASOD6uRyALpgTy5BWgkOGd5Xh1PhjgE//nZz6OIVPBsQbRceqc3EFEEOFzE1BlxVyNrCwB3AdHQ0E6/RXQ6eg4LpQN+GJW6UJIyXEKqLUoykYwHkIZNdj7gwaMdj/Ang1GtT1AEuArCE9QvY0rvW03tl5BwZAd9xxw4LQOgp8MZm3nQuELc7tYbPfEd4jM5N1Z2uHzh862PSaN2GVYHgM+XrAGPiUhWwrwK1Yyd5aDAy6cORoupZ8rm+Cg5YQebk3NqFcz4vMZUlyqQSG0nBrxdUbwrwTjzhsQ70cZINHzAUxjbSzOAPs6nxSeF5e
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 10:45:44.4993
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 83fa7b44-0f8b-4508-4603-08df45611920
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00016D49.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5687

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

