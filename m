Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795510460;
	b=X2pwvhmmkWrAoc7hZQF5SkCZVNm8VkLmYK4N5OZYVuJDCIhx5dXywP+5HbruFx1rnnWA
	 neUNayOWp4EDnG8PvoD9tu6hK6cgoeRWBpGPU1K7ysMH4Th8uFwZBNVf76gxK59juwqDd
	 RHVAg2jSP4t0q1Lp1HAvyxGB5toyahFJwBuFgY0HiPHRxD48FNR3Q+uRB59pUyJJ+ksxx
	 k0hhhjMgaB5iiMv7Wsy0gP6izWdAZcVv/SwDezbXVTmUg56hqF8sz7vddPmX8IjdGS3kA
	 PbsrNGNJnd3MuRGOK9TWHF3bgit3eEC9fZXpJpKTVKL1HAcP6fQ+g5JNkHMBJ0H72TA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795510460;
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
	bh=UiTzaOX94LIPpAHkVY4+FQ+ItXkEAijgtNDpBzIvlSE=;
	b=Wl2bPobVAnlBtqllvL1G6lLvmywLOSlJQNtioG5oqZEicy+mTeJYarVp8aW7JG7vgucE
	 aQyABhAp4ORHTCujWWZTtDwETOi52ZQh5wgDCztXVeqC1HsxEFZIGcsjTmySoQL0f3kec
	 93acv4kVrilm6CDauRYJgFh5lLKo0l3kntcX27O3kloRl6t7u3llwYyVpMA4h8kwX2hSI
	 WrW30j8oz+uSFFax4THgPr8CTRxEhqtVPehYUoUJYBKO4IiyOcl44g7KDOGNNN/V38NLa
	 EOOZic/Gm8OKedIQS5ZZZMG4JpnS6d4ilwPQdi8+t9Gwa+1LsxO49+ID/DoOodqjjcg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=t2Gk5I5Q;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.41
Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011041.outbound.protection.outlook.com [40.107.208.41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A60B1606A31E;
	Tue, 24 Nov 2026 08:54:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A60B1606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=t2Gk5I5Q
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=grl4lxNr9+vB+92glqTR3X1ep4MlVWD3513FRnwoTZS3c2lpLX77eyMi7k3rlYletlMZz4EwLn/A31JrzgwFaV+Z9br9lysFDWYQutniLj0wHrRGYFLhmFADCHKZ77/0Wmj2JSiiNDeSjCuWCMWI843HyBCguziqKTlbboPKcvtmkFG0PjQ0WjTdUjaQQbICDS+lx4Kf6DExyJUuG5XoPf4O3YMvLb3pRFIlbHa2PmaRjZvd8b7vss58A1p3C/pgukxK5e599tJ9/2m0B7YoH63+H6mbK4BO9EfYMBSnOyEalSYgrbMi9XIvrpYiz6oP2+RICsG3Opy229YN+1wLvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UiTzaOX94LIPpAHkVY4+FQ+ItXkEAijgtNDpBzIvlSE=;
 b=hL2oLBapRLETgpYc4JB0FJHpZPRagjOx/rz9MZo3OwijzNqT50C4/V8KM9uN5doadmXfH0tNtuiruhVrfXLR9RO4vMhYd2CHBLq2E7BP9Dgk41ooF1AKWYZvbSmMJw8U4JSnAe6wNDpNzi2QCA0SQgPUYXQg3cfVVU31k6u8PezQZlDbp13yyX0Jkg7KIXJinmJovslK6b0/CXs+r63xTDniKtqRGQrQjhFN0VeXosbwtUemtlsaqeT4wbLrkmqUmnX7IanWSzYCV2u/a+V2Rk/ejgVvIyUUJ2Uc9atXRjLw+6tBy04UrkXa4/9oJqWl1YvAdteLCbIJg8c+7tV9bQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UiTzaOX94LIPpAHkVY4+FQ+ItXkEAijgtNDpBzIvlSE=;
 b=t2Gk5I5QNV+xY5ntCzfJB+jaYn1nQTCqatpIH6F6y7bz3kiAyB5/lcwCIyCtP/4rRuVxW6S1c8yGVKM9Y9RbMyYxnSDlrfcUzWUkHIvzhKfeJr4RRybqHye17LeKGodZui7lI6l6OexwLi+/IJo2SEEag7u6BEzZ45c4TNI26tA=
Received: from SJ0P220CA0024.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:41b::32)
 by CH3PR12MB8727.namprd12.prod.outlook.com (2603:10b6:610:173::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Tue, 24 Nov
 2026 08:53:06 +0000
Received: from CO1PEPF0001885B.namprd02.prod.outlook.com
 (2603:10b6:a03:41b:cafe::59) by SJ0P220CA0024.outlook.office365.com
 (2603:10b6:a03:41b::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.5 via Frontend Transport; Tue, 24
 Nov 2026 08:53:05 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CO1PEPF0001885B.mail.protection.outlook.com (10.167.249.244) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Tue, 24 Nov 2026 08:53:05 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 24 Nov
 2026 02:53:04 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 24 Nov
 2026 02:53:03 -0600
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.57
 via Frontend Transport; Tue, 24 Nov 2026 02:53:00 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>, <Poojitha.N@amd.com>,
	<lee@kernel.org>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH v9 21/24] soundwire: amd: check for NULL manager drvdata in sdw_amd_startup()
Date: Tue, 24 Nov 2026 14:18:27 +0530
Message-ID: <20261124085033.682755-22-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF0001885B:EE_|CH3PR12MB8727:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f70006d-5e47-4b14-8f89-08df4a085b1b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|23010399003|36860700016|18002099003|261009223027099003|22082099003|13003099007|261021121427099003|261022105027099003|261022075727099003|261021135927099003|261026140227099003|261028144727099003|56012099006|10067099003|261102123227099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	4JrnzZM1lPET/+cW6SMv+yh1JWctLjMdmoK6bJfsagNXthvPBGJfmBXNSUTCs7TJEugZc7xdoWuOKBGrT5YDvXnq9+tM8V6UMqvCND7OvnK7C/OYyJPkzNrIwjBCBulI0ZGdcCdQ5UfEdM9iELSrO6x53QaJmwzLYLNEx4fIgNy16bddqe6NmIe6Ekpl9PKeEp9e0YNBajabBt8vzkUcVQqzjCAbjL2gkBmZngDr6o/1GhYIGrCZAWsVy5rtegQ7WTtFx9+mvv70HfGcbfu13ax2VkqBtBT8g4la473wk6cQdHrNyj/L4JMyjeTefvE5tHyELAAe4sZ204Nn8feYLCANUktEA/ZO5zInpW2udtBY43AvWVrsZmOU/wFjV8ElCgoqVbU5onx5s7I5e3AD/Zk9LdZR5nE0JnlsSkOQs6lqXyzkq5Pc7tvZyjShbQiaDvqUkRXjUpk1GH4DmjO9CoiyUUR1VYVx2d0pxcE4mDWJIvCF7vFrSmUn+BsOdrAiub+Rh8SQ1Z4L5Re5PNZGsQCDEDA7/a3J2zd1hlNXfT3jnzfkpdnb39mbTuVYr9Ym/yL0p9huMmJQLlDI8pOV0tf+C/WSoO+m2HdonXCylkeOFpmEkE1wbzOqNdCEirmmypvARenePcir5ea81w4CrQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(23010399003)(36860700016)(18002099003)(261009223027099003)(22082099003)(13003099007)(261021121427099003)(261022105027099003)(261022075727099003)(261021135927099003)(261026140227099003)(261028144727099003)(56012099006)(10067099003)(261102123227099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Jb7zkyRk6KUk3OcBBhnafRHt2CALnyWzYoSkH8Oa2gqSap0lBUsclZK5p3kgdhtUttia/nYQGCgvlTiKMO51X+K7s3EvgsYkpUMs9pMtoeGskjGxU+gGuXEw1tnR4TCgUCU7l19edhAjKTy9CIyMSVneyN1HV2KPm4JasK+NRPqsK9w0+12gZkGdrDxOM+jDP3VchSBqD9NWFmAtjoAEPt0jOaMMgxKmEq8zxI6ukxH8PU4eHIHXTczHke0xgqcoYSQ+Cki+ZosSbW4jcDFrtMqYxuQDAvD7eWBTDM/a0tDyQKSIzYz5xnPKjFI9zd/3/DTXJb7XosqnZyOyhnbYReJ0g3Vmr/U/AEOQjNo1H+XUoOk8LdepwgmGIXxJNtcezN52Ryq9kUIX7YWg1rILjW0ArgSx0QJkUoGD/w/uXiS1+rfoKXbfX4ByylDxlGyw
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 08:53:05.7793
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f70006d-5e47-4b14-8f89-08df4a085b1b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF0001885B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8727

sdw_amd_startup() calls dev_get_drvdata() to retrieve the per-manager
context and passes the result unconditionally to amd_sdw_manager_start().
If the platform device for a manager instance was registered successfully
but its probe failed (e.g. due to ENOMEM or a deferred probe),
dev_get_drvdata() returns NULL and amd_sdw_manager_start() immediately
dereferences it, causing a kernel panic.

Add a NULL check after dev_get_drvdata() and return -ENODEV so that a
failed manager probe surfaces as an error from sdw_amd_probe() rather
than a kernel crash.

Fixes: ed5e8741b8db ("soundwire: amd: refactor amd soundwire manager device node creation")
Reported-by: Lee Jones <lee@kernel.org>
Closes: https://sashiko.dev/#/bug/linux-6834a8a0-632f-4c73-9174-0fe7e06b5303
Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/amd_init.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/soundwire/amd_init.c b/drivers/soundwire/amd_init.c
index 50e487e409a9..4f1c2eaee70f 100644
--- a/drivers/soundwire/amd_init.c
+++ b/drivers/soundwire/amd_init.c
@@ -172,6 +172,10 @@ static int sdw_amd_startup(struct sdw_amd_ctx *ctx)
 		if (!(ctx->link_mask & BIT(i)))
 			continue;
 		amd_manager = dev_get_drvdata(&ctx->pdev[i]->dev);
+		if (!amd_manager) {
+			dev_err(&ctx->pdev[i]->dev, "SoundWire manager not probed\n");
+			return -ENODEV;
+		}
 		ret = amd_sdw_manager_start(amd_manager);
 		if (ret)
 			return ret;
-- 
2.53.0

