Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.52.21
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794998769;
	b=FXFC1zA5pQcrDXmNygVCxotacv21NXqf3jbGbn3H1dlqzmiV/TwG5iZpnH6kQEN+OKCr
	 8yd9o+17eDrJiu/3h5WfHSx/HfCxDKx9B7dZfbJtLdsakU35dt9tJyh2D8rpQAaYIPJTR
	 bliz3KvBt81URoAJzztvmyMiPbo2R5IALjAbZq7HQYqonAPp7+QLb7yE6WiXQomRt+50E
	 oc4dwxKulrDFI0u2AQEw6YO2ZskG3m2aA5vaI0djDJr9Ii8VDvnHdKm4dtlCKoaxcz65A
	 3m2YSCab/9NlQ+gSMSRDW1+7q8wT96MGwzJTCBZCcG2GPwtxJEueXjbdDO10nhneq8w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794998769;
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
	bh=iy1UXqbCNpmIvsTgL/zhHFoaBSmEE9Rqb2TUApr3hYc=;
	b=NY45k3RuN0zEv/HZU71eoqmSP4207wmpo4pV8faoMRz6P1zx7Vp8+FBga1vKRW1ZqeZt
	 7S39L071AItxyd/aCoLp63MhfKgbm9gjDo1YxT0D0t9JPV6xXGdVOja17NJznUg1r5+B+
	 0EoYDm42NFbEtwOGqspBThmjOv0Sm/eeczxYxwuQPvcgMIorbT5jkEsDsA3OXHK3cK0Lx
	 449JCssLjlO67OnzCNJpHGHfewii8byf8lI/jax4OelHW3dAdmbe/apSsJWb68DNL7nQT
	 gWqn+I2WsRfexWlc7BqQ8fYHlIiGDCA1qvvozx2v+jUP5cuLFqQQqvbqNICc+RFYR2A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=reGMcA+N;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.52.21
Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011021.outbound.protection.outlook.com [52.101.52.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBD6B606A31C;
	Wed, 18 Nov 2026 10:46:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DBD6B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=reGMcA+N
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=is2D4/ZdS/1BD+W2EMmepptWJtIZsFaRHix3vfHAByQTqoQXN3qaR4d/3NQAORk4tY2SDCdDATXDLhkZOlNvDMmsu8uXnBvxuV2aUL6v9u1xNKbNHL1ErEJAusBWE1UPaU6nIxwc7PQGTj/xGZ1M36xxs+A9qbnMhUExulzM8dJlrkfEaYM4RJTDJwIzMDseJ2QPONn3Ou4UJMxxzkRsG9VaGtgWO/DP97kQE8VhWDCRVTShpJtLqgyCF/Hj7e7M+CQZsLrKbadYfMeeekrItc6m9ZEVIHCXxOlKJY2Y7Ni2aWgizSJgIKcU8GaSXcCFN4s3e+s73fhPsEM8I/JfYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iy1UXqbCNpmIvsTgL/zhHFoaBSmEE9Rqb2TUApr3hYc=;
 b=LLSoGkWtANpe6eyfQ/LIzinjFCf4YdBmIJqU5f67WYqMm9ZdMIGhSAkPd9PMHRjhYNbbLkd03UlAqhWZAh6vkbKSHu4LDOf3dn69p1lAHFJ2boF82wvUD55ii3BL2apJrDzZ+d9+sp/4xH9IENgWTLmYV3ZLnBvsTQh2WkDduwkHDyt2a3wnQXMI8oosDOu2/AmLwb8p23yuWn07/ey0BhsH47qunq623v6DRJTcyhtsnMZ6Y/FZESJXjhuk36Wus6FdXLsGnkpX7pC+Nk6rnTuwYjKYDkw3FQ7wVWBU1mOQhH5AU3nULAJTwDJo9Of6i46PFA8H3S0bfFox9Yqzyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iy1UXqbCNpmIvsTgL/zhHFoaBSmEE9Rqb2TUApr3hYc=;
 b=reGMcA+NbFKmBbaoX+bOoFQH7cvB3oicr6U82avnJ6qPe3cHLPG8ZFu23MFTO6PrYFiUzWczPcpQiKH88hMRBVZSx94fCLjAO9ZXmyVYtephQAKiG2JNYdo6MRyX7vMRrOV7FQH9D8n+jKY0UDzn+1kVsJ3UyciLQ86Dk1CH6x8=
Received: from CH2PR07CA0049.namprd07.prod.outlook.com (2603:10b6:610:5b::23)
 by DS7PR12MB6024.namprd12.prod.outlook.com (2603:10b6:8:84::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 10:46:03 +0000
Received: from CH2PEPF00016D4D.namprd02.prod.outlook.com
 (2603:10b6:610:5b:cafe::4d) by CH2PR07CA0049.outlook.office365.com
 (2603:10b6:610:5b::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Wed,
 18 Nov 2026 10:46:03 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH2PEPF00016D4D.mail.protection.outlook.com (10.167.244.122) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Wed, 18 Nov 2026 10:46:03 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 18 Nov
 2026 04:46:00 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 18 Nov
 2026 04:46:00 -0600
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.57
 via Frontend Transport; Wed, 18 Nov 2026 04:45:56 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>, <Poojitha.N@amd.com>,
	<lee@kernel.org>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH v7 11/23] soundwire: amd: assert msg_lock is held in amd_sdw_read_ping_status()
Date: Wed, 18 Nov 2026 16:12:30 +0530
Message-ID: <20261118104353.331556-12-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF00016D4D:EE_|DS7PR12MB6024:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e4b7e78-1a59-466f-700e-08df45612493
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|82310400026|23010399003|376014|18002099003|22082099003|261009223027099003|11063799006|56012099006|261026121527099003|261102123227099003|261021121427099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	6rv6glIOGLyuIJHVVbJvNPbl/1mZqnbYc3PvkQdBSoZ+htz7Ukxq1wNPhLWOJrkaBuaCnswd63m+58g19bGQezmVZAGL9XwsZfI+SL18Ku8W/xO5hY5n+pdsEk8ZvN0PngahmnvWPRevlbybOojdCZtUOB5uRuzNN0pEIzMd0B2ItxKKR2/9G7GuOIYJaHEKxwJgWfptyDbZfyIpVj+hJkV8jqhzpTgCLWRNsoXEI+d0oBaYTEfe/PZjmSLFvfoios/vRnYoTebGfb8Ow5e7Q+EuuNtHWcUg9bKQCwdyfFBTGxOIzY1dZ98g6C4KvxdtyvJiC21U9E2NOroNXLL/FkaMirED8CT5qGayxq2pds5dEIbHa8v3SU4zKsog8xO/WwR4zHaKhUCPDGqafQ5Gn9AoMOPpuAXsiO3+h0b9cI1z1D1KPJ9MPlE+W5Jhjbhw3bEMgYmZO39KO5GRSo9YWBeF6whS7Bv+Or7K7MmDcv5AjWGOPDNeSLD9+EmPZxCunosGcB7rj1WITC9K+JkRSpqwOFlD8WP+3BTs/b6/j6OO8b7HcNYBzeAPxfY1K6FkqDq5o38ikFdxyGHlU0QiLHi/xTsJtsm5b7Yw6iXTcqNR2uUAAtdP4MQfORdG4lXKToVXOxLcyQflgNZwW9njzPuIPd8c2lpyYp0Zx4spjefmBajjqKXLf7QFvmrWTAlt8NprdQ6x1KC9bbHVxFhLPw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(23010399003)(376014)(18002099003)(22082099003)(261009223027099003)(11063799006)(56012099006)(261026121527099003)(261102123227099003)(261021121427099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Urxqkn4tcyMXjmkqb+NzFrtuToc6I9u2MMhp8GMy3/u85b5bwOF1YBeQUTBbI/ykI4X+85Tai5KHNpadd3oMgRCQzJMT+7t5HF5xja2gq6WDFGY+e5SogUBBM/Rh1iVDF6zc0s06wcxhUz4XeFknZud10YgZt6B7yw0s+fQZOGb4FvO6xF2eT64He4UIZ7BRrv11yNltmtDvry1iGegkTqNCon3rw0XbDi0dB0bZCN3UfHjqt23Z1hvGuJo18cuG1W7FrTGm7b2Sr/OtKhXZA4VGPguTYPfV5AsKyORNmArPXD1CenQeaKT1puj3yweXKBwfJyK1AFidR/mxzBYxoVpVfB8MlkENFRmvoeFfUyaoaQ8UfE9rrZhC7fBmwAYMhhPtgW3kXxp/bxsBVX3tiPywnXdDZ6ikqqK0W2wz9A3q5A93y//enT5VrX1jKICq
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 10:46:03.7134
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e4b7e78-1a59-466f-700e-08df45612493
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00016D4D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6024

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

