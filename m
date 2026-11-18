Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.48.6
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794998814;
	b=lpWPRo8qw1+TTaWGoS9T2cU53Z67WpkY/mBZV+bIdc+p8b8Vbo1F+ZzyNUE9Hhb3Ediq
	 wqsgrDLATUO09dLWc/7g6SxOxSIb28vFbvqN4ONzM/I0B4CZJ2pYzbJLLDMEocBGDaAhX
	 p2MTQqLFWeOPW82C3UT6E0os8Ia2y7YsCA+x5kbjqe+X/DDQU/pcjyNQSQ2NHl1cmbjHB
	 KWaYI52ZE6/DV6SXfp6u2GFfWFU0xOstX6DwMKQWHMINEWE54R+IvTGN7CVTtcedzjEsS
	 BBaqulYS6DBgNANqmO7wiKq68HuglMLkiYlvMFC/gagALIiQFMtECzIv+h9KysklcfA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794998814;
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
	bh=gbzc0b0hqZkI1AZyqNSTSaubT0tKmq9Itj1wl1KFX08=;
	b=a2jq0E3vTrdg6qsvLSkjje6SfE45x/tBn/n/Zit3zQW/W6C4QUgGHL7RflaC0nzslIB+
	 eQwywO75wH00HddiRrIKZG8X/aeXUm/buD+N/NRu7lskU0DFUnd3timHhYp8fI4Z3S6e6
	 9wGGjO7B8do822LIqt8yVeMyn4A3MlgkPlN36cLYL/8AcKB90RfN/GaqTCPnjvQUB2+ig
	 dgDBWN8f2Nxa2F3n8AF0VJFT4qZKmqpgcwlXQFIj7WpFa7kc1+udTBMb1fqWXKoXSfDXq
	 v/ArPEZBrW3MrGhQcb45PAtShkSJmu0mtc7lAnqahp0TRXokC7yyKD1inpAkhNWml6A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=XoxEAUa8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.48.6
Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012006.outbound.protection.outlook.com [52.101.48.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 062DD606A31C;
	Wed, 18 Nov 2026 10:46:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 062DD606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=XoxEAUa8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WNxbUeJ9iYIBDrs/805eNBQ4+iyJbp+yCK+UbULQSFs9lQQWL1T7xvbN7lGIk2wpthzF+z/6C1ttICzkDQDk4HDL1ZCvDyaIyhmPQpJZH9aynp96eexNl//i4RCt2HjuR2KrKpFnUCjhMgfKkbSHatkIShbUKD+vlTheU/95mFXxKLqHs9kr8NXPnPIKq5u1c7WZWchqwDDHJ5U4cVdezKamxHtMjlHJS2dmZoIfpxuN2mQYfjN2dZyWaqX1NbwdgZILUIOJDWWohd70lHQ66jgA0sTDRfxfpcSfvr24icY+GG0I5wzP7rbhfqKl/Ygzkn0Vf3PSWS8vA+g9oqbB6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gbzc0b0hqZkI1AZyqNSTSaubT0tKmq9Itj1wl1KFX08=;
 b=w00wajfse/esffz/T7aX92ZqaqcQK0+siW28JUbFOqilm+/uZJWPHMW7M8XRRy4io/m5B1vUL00Bs9cc2hgJKMuQiw5z+JyuHfCF3ZuwRvvPnLXudyWdCEdv+reBQSYhs/4bWaBNBlLzEUuAP3zgU+tv94dqXIf+8HJTfsdQbMEXAZZJHwYW2glzYygX7If8WCr0IkhmBIDkm2nzmgbnNaOLOhR4qqz9RxPjVcpx7D71GqXRXK8noq7cHPR59pHiLEOl8vvh0PntdzTLwE40ecbWOuW2AXRra87I0dR8rKR0mRIPHWCKb54IJVUqcoO8wsOwvia4iBX3L9vVrHkRcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gbzc0b0hqZkI1AZyqNSTSaubT0tKmq9Itj1wl1KFX08=;
 b=XoxEAUa8LZvfuGSVqHdoKwhjHR85/xdDKwPKay6TMEs9ltN+QrVhthIzuOXLnjBvG9XyZuaMdGGSk2k4e5VwSAWeo6Z7un1oqkL9540R5c8I64JXPL+7iAerXnsUp3EkWncR6oknyeS/h6s/puC4AKgoV8p/IdXFwPrRKYIJ3BY=
Received: from PH8PR20CA0018.namprd20.prod.outlook.com (2603:10b6:510:23c::28)
 by LV2PR12MB5847.namprd12.prod.outlook.com (2603:10b6:408:174::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 10:46:49 +0000
Received: from PH7PEPF0000000B.namprd04.prod.outlook.com
 (2603:10b6:510:23c:cafe::72) by PH8PR20CA0018.outlook.office365.com
 (2603:10b6:510:23c::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.10 via Frontend Transport; Wed,
 18 Nov 2026 10:46:49 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 PH7PEPF0000000B.mail.protection.outlook.com (10.167.243.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 18 Nov 2026 10:46:49 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 18 Nov
 2026 04:46:49 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 18 Nov
 2026 04:46:48 -0600
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.57
 via Frontend Transport; Wed, 18 Nov 2026 04:46:45 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>, <Poojitha.N@amd.com>,
	<lee@kernel.org>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH v7 23/23] soundwire: amd: fix shared-register RMW race in amd_sdw_host_wake_enable()
Date: Wed, 18 Nov 2026 16:12:42 +0530
Message-ID: <20261118104353.331556-24-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: PH7PEPF0000000B:EE_|LV2PR12MB5847:EE_
X-MS-Office365-Filtering-Correlation-Id: 56fde6e2-d2c3-4c8f-d7d6-08df45613ffe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|82310400026|23010399003|376014|18002099003|6133799003|22082099003|261009223027099003|11063799006|56012099006|261102123227099003|261021121427099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	vM/he/zowpfq+gAzWJP1v1SYf/5w4hquXpJu+Q94WxYTs1t078fAO4t5742I9e8cKQIL0qE098NeV4rjqFcmLI+71yQvi8tQqJO+KgSZfxOZn/oiWngM8IKGGT+D9k1/dREEZl1OMnS6H5fh2L1V+QhgFsNRa7EtURhihmmXFgWYa+6xEdEb8tq/noMzHdPfhpPjqmFr0537gcChwm1BpDjvf8DigTJDrHXvvGVdIfgOp/sGpnri4oa8RGB5oGZWgi4bY8hhik1/1bnQYZSzohLreOXwE59bO0oAGuDA55iWCNXUan7HZUxzz7qJBBGXD71x4CcklXXCspYagXZ2fIbIyiukjUMhrRqEVDQKgxtrn2ApdOujWNZJr0mNojHg5kf8YrAwl4ar9Ia5rx0MW9DQm1KNTX0OSyOKVIccwxlsibQmxwsHOiQ5P5hEo8IwqQAh3xNpJ93ea+4Oeq/drF66xBVPalx22cw8AjyX5jPyWrV8vZv789cW+7F85veqZnHyRpR8cUTZNiX0Bs4UPbG1uHKP2TI9e3ye+xkTf/IxcUbAqAAUP8bHiwc9/fSNac7sVwuR/sUhBhPNoWyilGEyIStpZcjJXXfgISsyPmryYYw+MMgAXBIfw/6apkMJJ14AEkEj3cLUZFylqyV5OsAJlstX/cjbsL/ir40c9KgIqzG5pgWdJq0gzF/DZFoGelP3Vpg+bVIOzx8IMxTSqA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(23010399003)(376014)(18002099003)(6133799003)(22082099003)(261009223027099003)(11063799006)(56012099006)(261102123227099003)(261021121427099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Ul0CmVxT+0/eKIAfqYnhZJ/W2cyNn3divpGZwxYxDvtbh/J/p5Jf5Il9OMvFAc5KvyXxZo21utjLfXGTz5QXQnVR/Ma61sLJ8KL+c8W/J3eOLItDh03cU6sjf7N3L3C9myzo2bWRGlaj9xe9Z2UIREHZy3Stn9d3MK+mq3GZA+lVbA1FeFfMEjAVFtk1L8wJJoJ78MuC21cmXywLLBg9xTeVYrOUGj0g1kj72hj3F1EEqpOnIIp/DGu1ehaPbhNN/rC0HOesk+7Nz7OGG43wMMcoBQu7UYyLGtDGFZAIhuFU75B9P8+KeF2BZji0GuG99Gh1ET4QvysfqMvfMKeiOxL2Rir3UPksH+7ibWLH4S4uVmVohd37G3mpOqxhHBjBgLlZzFzidX930jrwpoHFwDUbrPXc6a6fi6m29o+ay7jfBHCHuT/OSEjzwEklFg5r
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 10:46:49.6503
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 56fde6e2-d2c3-4c8f-d7d6-08df45613ffe
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	PH7PEPF0000000B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5847

ACP_EXTERNAL_INTR_CNTL(ACP_SDW1) holds host-wake interrupt bits for
both instances (BIT(22) for SDW0, BIT(23) for SDW1).
amd_sdw_host_wake_enable() performed a read-modify-write sequence on
this shared register without holding acp_sdw_lock, leaving it open to
a lost-update race when SDW0 and SDW1 execute concurrent PM transitions.

Acquire acp_sdw_lock around the read-modify-write sequence.

Fixes: 3df75289ddc2 ("soundwire: amd: add soundwire host wake interrupt enable/disable sequence")
Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/amd_manager.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
index b882ec4d5cb5..f9ababd30393 100644
--- a/drivers/soundwire/amd_manager.c
+++ b/drivers/soundwire/amd_manager.c
@@ -323,12 +323,14 @@ static int amd_sdw_host_wake_enable(struct amd_sdw_manager *amd_manager, bool en
 		return -EINVAL;
 	}
 
+	mutex_lock(amd_manager->acp_sdw_lock);
 	intr_cntl1 = readl(amd_manager->acp_mmio + ACP_EXTERNAL_INTR_CNTL(ACP_SDW1));
 	if (enable)
 		intr_cntl1 |= sdw_host_wake_irq_mask;
 	else
 		intr_cntl1 &= ~sdw_host_wake_irq_mask;
 	writel(intr_cntl1, amd_manager->acp_mmio + ACP_EXTERNAL_INTR_CNTL(ACP_SDW1));
+	mutex_unlock(amd_manager->acp_sdw_lock);
 	return 0;
 }
 
-- 
2.53.0

