Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.56.70
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794998792;
	b=m3hwAWFm+yKaFS/Bl7T6L9+cCqPo9e1Bo+VizEhUOZuSY5rypsLf5Mv8FWa2VJF2nclg
	 ZCzT3jG26rSCpn80jj+TJjO3cLGe/pFjsJZBogoFD06v1BsIVLIdQoijb/WcHX2YOY8RB
	 j874S2cRi3VkP8if4KgmSHI6YRcYpU/oY6teXXvQ6FJD4mTRXJ9tn3XgERDYzytKErjDp
	 pwry9R4J0STFo40klIsuIvAGZWUBZSU48+ZZy8XOjQ6m7Sct3lU4SQIatVhXN/iG6cYey
	 Y880Ys3qrL5UnQkx89AZbd05acA0WAZ4bTwc/LmnW+fanH8oP1RhMtggLLgkmsJXd+w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794998792;
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
	bh=oWUR8xegIQxJn6xGwo1Ib5fGiZHIZpb2glUTtdFQpYs=;
	b=lmvNrosRzStPO3qqqhS1G0P/Q72BODEQJD5wHr6oXTBNRY34IeB4Li2WCB3vdVc5arJF
	 MhN61BDjWh97q0Gv9OVUCLVy9m+G/plBeB2WR0t1FJulzwfs/OwIjeb/oTOq7BeflULAk
	 453FIYU8NGVoCTzj4t5q430MqXkccKoGHS+/LidT5fCVLcHDZh342pKSJs/cRXKWOOO7y
	 qOLz7grMBUBT07vhpaN4AhQk6uujpGCHdqkOAIdyDSojHQj43uQRFs94Z8P5gwjYhbUYU
	 3gYbVEpZXglcxYSAkOoJ6hWm5P9SWSgzwwNsaiXJQMZNeXeFOJWt1ODRsYiC1chcqvw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=GSXqx0jR;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.56.70
Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010070.outbound.protection.outlook.com [52.101.56.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9783160A260C;
	Wed, 18 Nov 2026 10:46:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9783160A260C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=GSXqx0jR
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SNBRjVLaK0XvGssVjIseKlGTsgTyK0f0aYICgOsiWV3jNiqBQu5Lgraa9Yzq+Bkw2lU/tRUkwpT5mqcIPmUaK0/8yLR2OLCcEcMVFRrur80c7m4t5YbcqvAs0DRprcHGWGT28lz/kDuFsCv0L+dqOYi2AEaJAJgcjUwEKN3oE8G9lkc773RGei88CQRfEDP8eIRCzWguJIVRwD7vTW2CgNzy6wPeiADWXGY2ahgRNHk/3lA2GHl11FUS1yhoS9Ua+3gkXLo5STGk3f3uvQT+mUqsLBYY4YG/jAMrSQ+12K+NqbCNEmKiAQgwEpgfvwMGfzfKfibFbI/0qgjwAmedlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oWUR8xegIQxJn6xGwo1Ib5fGiZHIZpb2glUTtdFQpYs=;
 b=UFNZ7plVKEstVFkoiCjpQ41fIJCz7SeCZXYmeYEBgT4+dKiMQGFGcvUnx0e65BeqNkK1qPoRpoxUSr4GpsB3jbD13yfDngSwSVXHYfuBkzNkWkx9BZ7vOHEOxrFoiwqRQoXIIGw3bCdqW/4Bud2dcVEbT6cE/VE3sxvNeIzbLQuhAIihwvCWK54qKzbmw5zPqzfNFm+m7GEgKiwuVyiaFp207eZ67Q9h2TjxSWMIVSntDoOHnJbipZySKC/PMtTIjdi+Xre/aMWhFo2WqkXFTy6B6NeFEC90Tv1C4n81fmiCMkfD661Ln+AhFRidE9kKuxy6LJCR44cGwb+5L6CLiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oWUR8xegIQxJn6xGwo1Ib5fGiZHIZpb2glUTtdFQpYs=;
 b=GSXqx0jRY5yB3m+EKflHonpt/FCn9nAvE/QndomN05fhmA66sfxoD7q/pcIJU3OmARh5rbaVLRc66sp6mBuSW7GRehoIMPoui8/odWk8tsi3ieW8Rrm3mIw0j3OV6m9oxik6aEEkFK4P4f64coF6sFa9ntLBtkhcGVTJK18eGTU=
Received: from SJ0PR05CA0207.namprd05.prod.outlook.com (2603:10b6:a03:330::32)
 by SA1PR12MB9516.namprd12.prod.outlook.com (2603:10b6:806:45b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.13; Wed, 18 Nov
 2026 10:46:26 +0000
Received: from PH7PEPF00000009.namprd04.prod.outlook.com
 (2603:10b6:a03:330:cafe::21) by SJ0PR05CA0207.outlook.office365.com
 (2603:10b6:a03:330::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Wed, 18
 Nov 2026 10:46:26 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 PH7PEPF00000009.mail.protection.outlook.com (10.167.243.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 18 Nov 2026 10:46:26 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 18 Nov
 2026 04:46:20 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 18 Nov
 2026 04:46:20 -0600
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.57
 via Frontend Transport; Wed, 18 Nov 2026 04:46:16 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>, <Poojitha.N@amd.com>,
	<lee@kernel.org>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH v7 16/23] soundwire: amd: fix *sdw_ctx leak when sdw_amd_startup() fails
Date: Wed, 18 Nov 2026 16:12:35 +0530
Message-ID: <20261118104353.331556-17-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: PH7PEPF00000009:EE_|SA1PR12MB9516:EE_
X-MS-Office365-Filtering-Correlation-Id: c6810c0a-ddb3-4c0b-a885-08df456131f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|23010399003|36860700016|22082099003|18002099003|11063799006|10067099003|56012099006|261026140227099003|261026121527099003|261028144727099003|261022105027099003|261021121427099003|261021123027099003|261009223027099003|261102123227099003|261102130727099003;
X-Microsoft-Antispam-Message-Info:
	IMJHcnqyWF2vSDtAt/MSt6oK1tKh+PMrYkUr7q79rzkediOKowv68ilZNKcihw0WUpzJ20CSZNj8pj3hBeRX9LrIsSI8a23l3ZpUSQ00aMpYGpfnlDTFFcgJCeMn2+tShZGLQZj9WsI1VhXZchWebXqa21/mGWjoh9/VDelWJJiNXvnx5Mz7sbuTLc1P7deC8maYyyoJ7C/M7G64BEIR5CBApM9oSv0vWHNmp+NgZdNrZjvfTAt470u8E4dtcf1v1Rr0yUVGeGazWdEx/fuUPrQ5JfAu6wUal2aHgsT4J+3h6KXvBEAx5uHYhLcNA4MC8SbfcTGd4RevkyqF7Y2tZysruTTsSxu1c4PSg/9zGsiy4KjmgoVe/G0tj2pKvo8iK3jUr6lxlQ+/HZGSqnDzcIcaGfqaUz4DHB719y3RhOLchOxF84/J13uWtVP5toL6iyWtbKWvvm0pWwcferPtTsGM4DTDAbKkE9vHoditmZEqZc/SQwlX9pugS41dtZ7YsOH/bxZYXws1upttv10sgrR63RW1tZ1e851YKUHEdaSjfGMBqkpbcitBH9Ebxy1MVk20br3AWITTNDZntD0xWcJ2jd7dwaygFOM+Y0UYKnexSvJ2dP0D7yrHbaSiu/iPiOOTSfx5ACyWBQd+dOMCLIxtXKrHD+zynHdDVMh7ESLY1VNfuZH9miwiyqYXsQcD4JlLC0Rd6Dvz4KVtoB5VMA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(23010399003)(36860700016)(22082099003)(18002099003)(11063799006)(10067099003)(56012099006)(261026140227099003)(261026121527099003)(261028144727099003)(261022105027099003)(261021121427099003)(261021123027099003)(261009223027099003)(261102123227099003)(261102130727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	DXrwVqk3hdzXP9zZtG6GWMcgivornQmMa9771yN4wWipVo5HYBRdPonlyuVBWXTXIl6jry9V1CbXHRWNZSbyaU3QE1TcYGYwBJjpAUr4+vlLn7++Dp2OB00JzrtZnlaiVj/zsJPO1rupA9B/qisz9vL+9j0JgdvJnBB+M5sjS3ukYfL2vqnDDgZKi/3JtV4W/k1s0mTbQrLGV5dpfBPZt4EOSfTiigUrud3fb5LjDkt2UeNCoqxtdY3g5bxHRgwHvIa+e5Wh4tOtR/smtHioeVBbk/PS1oJ8sp5P+CWRAqkcexkcKM59idLPx2A5jGDBNmqQFmWybQKM439Q4gPH894hcL/m+BG5aseYQcohcCJ+nH7JNNAKSkHwkh03HhZxiTPnPLH/5plHbUOVZCyA8GMcOnR7brl+7mX4qF22F7GLm0Aufx2I/jwwOJBqUIym
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 10:46:26.1574
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c6810c0a-ddb3-4c0b-a885-08df456131f6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	PH7PEPF00000009.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB9516

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

