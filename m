Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.198.30
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795510394;
	b=5PhuizVKyJnrOjtcgnHhfmfBN3k72LuZAY7oc/dOsXz47YdShbXLmnv89+sXyvCwOwVq
	 qnQB4WTCzGoZywWlZ0I6YYpkiaoLnoui/Xn4c9g5Rgj+fBY8WbwN3nDnl8Vwt8uuloy4g
	 9mRkq1jThtgwjLywyUCcd2vBnPCd4dMwq+mDzVAehJGxbSDSNbkMqZloFupwyTytAdPit
	 khFqeyDZMbrDnJXo9SFEvOy2l5M25euXbz6tfSiF/kaTT39HSwyI9pTl4hdPrsgaAaZUW
	 DmO4CTS9A/dBtOCGUAk9qWrbfjp1vGqB/FelW/eU/38fczaiSYVylDXcsBL4EV/IQlg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795510394;
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
	bh=j1gAbKuTPbRsRYr0wpKVFl7EE71eI2elcSKGbiUuGoU=;
	b=A+oyXOb8cRcZ06WryWEFaNJ6OZHYupldOjmzxDIvIyRlxsj/HqzRLbwXFlI39jepGkEQ
	 Q3usVokmAXFUji4s9zk1RNO0jCQfJB4TVNLb3AvEeXRufySf9hsaYSYTM1pydMNGkJb5O
	 9LQSYfPiPZdODJZo20nFA2tD9MsbWaYHBIUYuwBNnSfenK78kKbemPAgoMd7RCLKZrZb6
	 7Kw1VPAp8d7X0GSWK/0ZK/BNqgDzQhQTs3bv2QoKlnndlSigKFNZSE8IyBAuG4JEamivn
	 hCEOlV5GGebmyqB7UhwV/3eMOQ+R5aiwB4CMv7I/fzw76HxrfD6GKJ/ylZNLA/y1leg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=m7LhHuM7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.198.30
Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010030.outbound.protection.outlook.com [40.93.198.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2EAC606A32E;
	Tue, 24 Nov 2026 08:53:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2EAC606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=m7LhHuM7
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y2AdWPLlT+BK5M1+VPY6RDyvvhdMx8xmNYwRJ0i4ZK5L1L8KMjCMH26qb1IRDUpwsm1YRSDaDsAKtP3IWIRhqsOalqrF84iTwOqTZbTOZ3SJXxB7V/JgkJhxada99mE9f4J73/AVh1UnTulvd56MrMxwrHN1+3yR7sESZXlsfs6+Fj3OXTrplQ4H7F10inKP+Rew3/JH9acoJ5hFfqiXYh9IbxWfR/YXapTIJI/ukQSMUF7u90/dSDsx/BJaqatJk6K4gpjEH6CQI+PlOgffQU4ZH9gecN+u3IEYBbOze4e1dAe5jeaiPe5yB7685kr/esCRNu9iX+2nHpFyDd/9Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j1gAbKuTPbRsRYr0wpKVFl7EE71eI2elcSKGbiUuGoU=;
 b=eiO6NTjqxYEjV3YyYBLlRW4Wl5rwgy9RF5+ZEd/5RuWeIsURMp4WuaY9XkC+9gRHu2ebAFaH8L7D8ulHmO6b5R6dVYGB4th5cdXVl9W0QPFeEJq4jLXVP9vSww3Qwmi0sZPhy3AB+AvE0vcTsV2BsXBab6K0e9VF9ROBEZSlWbGP+7lkcISqTa5FgygHbfBUUsDelrLMbO1k6MFpefyv35VEBT42pDjMKaZ87AhcM9HKT7gG+gj0YSUdk9yIX3m0rl60Eq5n12fi39wPbYiMr7F3xIo2712mJmo6qy7GAJTuAYupmVbFF5XjFFaGFboGI07DOXHic8gkjkS9t2qNiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j1gAbKuTPbRsRYr0wpKVFl7EE71eI2elcSKGbiUuGoU=;
 b=m7LhHuM7pI7ouLbgRweA8JE53e6y/QQ/YI8GTTywwYri6RPPwSwWa0BHQgcyj5fEInx0d1tS6W94agnR+dCThu++Lt8YLzzUHOTif/EeFUuMg+usfGMpVNmSQQZ9JReDacE44plC95BYvsELslOr4EAjAmEYmd+zlUczTxWajWA=
Received: from SJ0P220CA0016.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:41b::23)
 by CH3PR12MB8402.namprd12.prod.outlook.com (2603:10b6:610:132::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.5; Tue, 24 Nov
 2026 08:53:08 +0000
Received: from CO1PEPF0001885B.namprd02.prod.outlook.com
 (2603:10b6:a03:41b:cafe::2) by SJ0P220CA0016.outlook.office365.com
 (2603:10b6:a03:41b::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.14 via Frontend Transport; Tue,
 24 Nov 2026 08:53:08 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CO1PEPF0001885B.mail.protection.outlook.com (10.167.249.244) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Tue, 24 Nov 2026 08:53:08 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 24 Nov
 2026 02:53:07 -0600
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.57
 via Frontend Transport; Tue, 24 Nov 2026 02:53:04 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>, <Poojitha.N@amd.com>,
	<lee@kernel.org>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH v9 22/24] soundwire: amd: fix shared-register RMW race in amd_sdw_set_device_state()
Date: Tue, 24 Nov 2026 14:18:28 +0530
Message-ID: <20261124085033.682755-23-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF0001885B:EE_|CH3PR12MB8402:EE_
X-MS-Office365-Filtering-Correlation-Id: e6e34237-b69c-4a81-c792-08df4a085ccd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|23010399003|1800799024|82310400026|10067099003|11063799006|56012099006|261022075727099003|261021121427099003|261102123227099003|261009223027099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	Vb4/eH3dGA06lqAUmTuz5W6cAbuIXjx9stNr01Y336JogqBLjaZ0/WpfN/vmE+lw/QQaI2ET8Zie7PlzwwPfm9TQGTHt+PVVWKbJmfYSvk+n3k1nW13OPwAXQSZNieCut2l5j3lgqeNxdaDhc0QHAKliTDobbFwyJyQ5n2Qyvz1z+x4binyb9f08TT8rTSnqGWJEn5HO8LNG9jrISKeAw+qd9k7oOf3dcmlwkeWqar8MLadNrobyh2sw0aUcWeZv72FRDG2UD2erDZR2kqAhofVnlkPkDlu2YYltTnyIEJVSmxaNrKJPDY9DXldRa7SMVRkYcClNMN0pq5e4WigA4xlBchUeEzMRLXVtcLSK+yZTQ6RBNvIVRVogz8jTYPzNkTtZfQpZMt5nWMjsOGvYRqE+wAGfvRd7XSprVkSzLlVnzUAS1dTIAaWgcWfXHD1VAVdlHbapiXyBe77BRWepdSnkY93/SR3KgdMpE4GbFUOZJshg0so8QEMCEo9hSmW+6XkXHiVE5eAPriC5eJx8vFO9LpuFHQj7NmYU4rkOHQN5EHK0rrQfhEhcFgBUmevgMZbCzR5nUlE16VymZzTpOkRrGgTE/9PlWMkSiaRudJtKMSfBN6FjTBDXtiLiOnIy67r+9HA3jBlzsK0+cEybUbPKaNZMswG8jkPwZ1wm+SRHtaKpiS1gcYIwIueAwWgguVfBP/ni8A777ZgEIQGgxw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(23010399003)(1800799024)(82310400026)(10067099003)(11063799006)(56012099006)(261022075727099003)(261021121427099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	CMa+p1sxP4Q8EBLo8cxXVdArmeGzF4h4OotJQ8tDcnhdKn1YIwFx9Ivwi5L+AkJWGwKoea0HUpBwaLZDpbJGV87tjjk27ZpaLFlEPCr5TcTHi0YGCUwinjwdtg1IKC1mC8aTMJx6MDIDXT0IEB8dK+8cYD7Mmap3w+HRCgzpa1I8DD/xZg1pTkxSveFsH7tIx9E1on1N+GwfEsfUfcDBK2Wf8NFiiescLcgcWvrafLjatQcIA3JLFteXUoTxChq8pBO+uLD8xofHetQX7k5binTi55Idcwr092BbUBEm4AVpbT/MNZ9d5z0TguY6T5AUNVJVb1TXHGFOtTMKxMEZgklJG4W/C7AoUGWVLkTbkTrAiq1ANLHx4x6ewmQYmNZi0Oax7p0das5ycls+piDRvyEtjRgZ+faE9YY6nSHx50iwro7p7ZR/Y6j804orXa+h
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 08:53:08.6310
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e6e34237-b69c-4a81-c792-08df4a085ccd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF0001885B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8402

AMD_SDW_DEVICE_STATE packs the D0/D3 state for SDW0 (bits [1:0]) and
SDW1 (bits [3:2]) in a single ACP-level register.
amd_sdw_set_device_state() performed a read-modify-write sequence on
this shared register without holding acp_sdw_lock, leaving it open to
a lost-update race when SDW0 and SDW1 execute concurrent PM transitions.

Acquire acp_sdw_lock around the read-modify-write sequence. Unlock
before returning -EINVAL from the default branch so the mutex is always
released on every exit path.

Fixes: 829c3e1cb4a3 ("soundwire: amd: set device power state during suspend/resume sequence")
Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/amd_manager.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
index 9f717a9033e4..988e879f1599 100644
--- a/drivers/soundwire/amd_manager.c
+++ b/drivers/soundwire/amd_manager.c
@@ -292,6 +292,7 @@ static int amd_sdw_set_device_state(struct amd_sdw_manager *amd_manager, u32 tar
 {
 	u32 sdw_dev_state;
 
+	mutex_lock(amd_manager->acp_sdw_lock);
 	sdw_dev_state = readl(amd_manager->acp_mmio + AMD_SDW_DEVICE_STATE);
 	switch (amd_manager->instance) {
 	case ACP_SDW0:
@@ -303,10 +304,12 @@ static int amd_sdw_set_device_state(struct amd_sdw_manager *amd_manager, u32 tar
 				  AMD_SDW1_DEVICE_STATE_MASK);
 		break;
 	default:
+		mutex_unlock(amd_manager->acp_sdw_lock);
 		return -EINVAL;
 	}
 	writel(sdw_dev_state, amd_manager->acp_mmio + AMD_SDW_DEVICE_STATE);
 	sdw_dev_state = readl(amd_manager->acp_mmio + AMD_SDW_DEVICE_STATE);
+	mutex_unlock(amd_manager->acp_sdw_lock);
 	dev_dbg(amd_manager->dev, "AMD_SDW_DEVICE_STATE:0x%x\n", sdw_dev_state);
 	return 0;
 }
-- 
2.53.0

