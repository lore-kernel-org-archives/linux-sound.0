Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.193.5
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795510357;
	b=JMS+3xRDUXXDi+WQy8fypd8rTgeq1q8jp//G2cPLPc3WZ5ANBNij9itPBbBtbE7zKsS8
	 NqJfSlbGAAHIDVux4JnyoP4klt1n5DwQvqTn5eMf2YEXJ6oRi5OEFpzUPd22jOIOfuGPN
	 wejODe5L30mEnzkILgo+pQv+FqfdUOzZ2dHtNCyLuq3CltaVfgrewOmbVmbRZv0q4EEZ/
	 ucc/GK5b21PekwUevGzBz2t4M3j+NK+zIvUN1dYO6lZB0PV5kZlIHu/vMacW/HrvQkbwl
	 5tBkLMMpX5iIWfPZvi/pE9q6ZGCFodb9X61XMgkaqkFQLOXw47hBcfcfNOl2MMXsZpQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795510357;
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
	bh=iy1UXqbCNpmIvsTgL/zhHFoaBSmEE9Rqb2TUApr3hYc=;
	b=we2GdP8l6qt4cekyNXfYQFY7N/zVITISg6ysZ1s1aRPcdJHWUXdEkW1LOQ4Tk+ogEi5h
	 S0Rwan5M6aS47ItJp74uahhNPq2ETZF5tFAAiyrBJJuwO7sLExANjVI2CfixqqfDNQYCw
	 0pimJfZA7kt11OP6E2ai51w6eloRx3kCT8jvS/sIkH4fVSISSKWB4i4TrcwYOAUzYQ153
	 ohxa+HYOdF4RSgox7Y7vtEZTQX3ZDlJmiQ2GtfKh+SOeNA3c4FqAZS/TGGp7+VYXjagBe
	 AaID438TSye7nrhNVTG4GD/FMBY3dmVS71P78fp2Xp49yU5i2v1qSxaTzaEXbbd+2zA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=31lSD+5Z;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.193.5
Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010005.outbound.protection.outlook.com [52.101.193.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2F55606A327;
	Tue, 24 Nov 2026 08:52:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2F55606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=31lSD+5Z
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tGqsAJs/t2nN2T65oOtdz6pxCkmVrJDjOhFIxS3i6lvHfe3TnT99ZrlW9zGaXjpK/bYe1d7MMkAp0XiGzvEikBzKffmncY1HDIAP7P8aO7XE3arLc9oug/mCGlZQruJ27fZRC47tD+Pv3NCk4Qj5ZgyCzIkGbx4gE0eLkyAJSUNYC8W3bqGnzgu1GFIoPEZGMUmzI75nuSaqbZBB1udOqFdhnsFpiMTDtJJ2QmQixK2y17dkxZ4o50LbQvhwuOArpNi/KTFPKyVb255uGuWy4hACD1zfVKOv8OEyQaHU+VIhq7xFYGL+z/bKSm1l6m8C6N8Sz19u8WVl0pJAaASqDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iy1UXqbCNpmIvsTgL/zhHFoaBSmEE9Rqb2TUApr3hYc=;
 b=Vgr9CyPT0TWj/xKv7B8f2ndPq+jaitK/puYCcIfZ/c8OI2SI0dAvafFG5o4XoogQidYDn9lYlietJQyYo9nXUwk1OUVxqwhzjWi5A0lj9f1Sf3JVR7Ixcci4KRDKBhm8f4J6oPVJ8EIgWHbDUdZcd/7oMi/HkG+Knivpa4m1TNoSRmIkA7yWPdD3XqkhNx/BzqjyH0OetZ8MQgqpCYXrownzMpvQ/81FO0L2K5QTpum5LdlEDbPO7rYH+P3uLDsDEsBJXcC7YW76Lenm2h1zALBb1v3K+i7E5xwitBcO/JKNZ3iYW7mIJ+VwJOItyTPELmEUwEYxGJt60aa2j/V1sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iy1UXqbCNpmIvsTgL/zhHFoaBSmEE9Rqb2TUApr3hYc=;
 b=31lSD+5ZD5gUoNMRlJknL+4twWIxtyNvqRNAltwmHrG+N2y8RF9n9+lBkRUL5JKGXSGvax57E88W36bql1VLTP0WRtz3tTJKIcozOhvpNuJvVQBhzIby17zQlur6EIo6bSdZJdIvi6nDuYK72zd37pGxw1Zh/4XXMkqTUkOoEOA=
Received: from MW4PR04CA0070.namprd04.prod.outlook.com (2603:10b6:303:6b::15)
 by MN2PR12MB4189.namprd12.prod.outlook.com (2603:10b6:208:1d8::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 24 Nov
 2026 08:52:33 +0000
Received: from CO1PEPF0001885D.namprd02.prod.outlook.com
 (2603:10b6:303:6b:cafe::6) by MW4PR04CA0070.outlook.office365.com
 (2603:10b6:303:6b::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.5 via Frontend Transport; Tue, 24
 Nov 2026 08:52:33 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CO1PEPF0001885D.mail.protection.outlook.com (10.167.249.246) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Tue, 24 Nov 2026 08:52:33 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 24 Nov
 2026 02:52:23 -0600
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.57
 via Frontend Transport; Tue, 24 Nov 2026 02:52:20 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>, <Poojitha.N@amd.com>,
	<lee@kernel.org>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH v9 11/24] soundwire: amd: assert msg_lock is held in amd_sdw_read_ping_status()
Date: Tue, 24 Nov 2026 14:18:17 +0530
Message-ID: <20261124085033.682755-12-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF0001885D:EE_|MN2PR12MB4189:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c32abd9-9d8c-4c71-fcad-08df4a0847eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|36860700016|82310400026|18002099003|22082099003|261009223027099003|261026121527099003|56012099006|10067099003|261021121427099003|11063799006|261102123227099003;
X-Microsoft-Antispam-Message-Info:
	lAoHFO70GoQfeagW7Qy93dZr9E8RMk6jVSs3/u9pR7YX+wKThLvDpINWkn3xtCb9SJGqMeTun5Q17Kco8NVR1KFHVaYWd4PfrO1aiTOM/hZ/yMVnFLwRKeflKLXsX9EdNJVnIQMhllavpjIY5w8/90MUpOfr0BGvyhfVoZEJ8BISvrb0yGF/apIKvK634yTKOSD9BnxggRInNlCH46j4qvuzKLlKJJfEk8eP+jPAkluSTdUzpQSNHZ52mS3kIAcIzfcTKCtfG9kFBhhaxfthbwNavaV/4Hi9gB3Pazjr5UF3/ngJFudga1X/d2ZTl2Z0BkEMrI6wF8XtBXJoxk80LLbLxN2pzv13M0nH47gXuKTEG9SNdIKrnx6ZkYMPklAfhdXsJu5fubdwqPM1VOrNPiEZYTl0Bj3drHXuSkC1YGO/vrx4MsBKz7iw5ZJpTwxUr/tjVvMWWYRIgtEPbc0Sfp5cDtHZ3R4qTUyifVWnwrw4UydHvUxdQDYTl+tAZDr/90X7/iXkk1qSiLfBsXStEI/2htBIuJCRgJIiU2IAqmKFLkUuINNU9o6tBi1eLtrULBSlNQEzkL4+F4otlep25Nlm3SyrCToG8sgnVJGnl+3cGxL5nLwRYv8cGJtBzrHJEwXt7lSPnpaJHY4K0IdPhsgqCAXcy+Z7/fSD7emVeDKIkOzUT1cPKXPxI4uD+iBMT6iqzwuYMsiysCUn+rrV/w==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(36860700016)(82310400026)(18002099003)(22082099003)(261009223027099003)(261026121527099003)(56012099006)(10067099003)(261021121427099003)(11063799006)(261102123227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	qD8bgWMuhpubyxSZIHLgr+Bc+/EPdDOp5tbjkHHLLTWgKH4wwVuWvSlfLdtKzmq05sQQVi11FGJwCNZ8tlAxDUlYc/8VMbmBOd3tbPBuDkC7Ps7ZIU/CjNa7frKST9Kyj8usnxKteIMeSUMs04DIdCOsQvhK7ToVpjd23+L+/OjPgsieRV6iKefHZ8le5aEaNvvT/am086NQ2mWY2yFjZmotFZCeerGxY4M7ZlJxE/c3htDKG/ZgKakLY+/0+4qHG1yHp/uUL8BapltcASmvsCtomOwSIgk81/gZCTGHONVG8U2Tgda1eLdqy/HMwQvNgim8X5J91W5LePJws2NNGKcK/F73sIdx7Tkm6CXtUTXFW/UAL8Rxo4/5EPsemli7nMseFoSY+yLGSbqdAqWuUwCajjB3MML4IlY1UC7zkeKHTXTwtts43NpMUciNRfae
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 08:52:33.5392
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c32abd9-9d8c-4c71-fcad-08df4a0847eb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF0001885D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4189

amd_sdw_read_ping_status() is always called from sdw_show_ping_status()
which holds bus->msg_lock. Add lockdep_assert_held() to document this
locking requirement and catch any future callers that omit the lock.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/amd_manager.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
index 7b1aa2a87a32..3a97c12b45e8 100644
--- a/drivers/soundwire/amd_manager.c
+++ b/drivers/soundwire/amd_manager.c
@@ -562,6 +562,7 @@ static u32 amd_sdw_read_ping_status(struct sdw_bus *bus)
 	u64 response;
 	u32 slave_stat;
 
+	lockdep_assert_held(&bus->msg_lock);
 	if (amd_sdw_send_cmd_get_resp(amd_manager, 0, 0, &response))
 		return amd_manager->ping_slave_stat == U32_MAX ? 0 : amd_manager->ping_slave_stat;
 	/* slave status from ping response */
-- 
2.53.0

