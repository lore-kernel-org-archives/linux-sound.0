Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.56.69
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795510358;
	b=e5RHHY+2LzefTG1asp+UpxYb7c3PEF4Cv20PqmBmDmrS0tf7f65HfXpRw+QDGkQX7ZGd
	 P3IancFBQYJ2Ipbtf/9LAIdQKVKY5MHLitn8SdTnZbKLGAWe/sJFakXg3DbLjFp+ogkjt
	 gWLpPPnbiiL6aiFtSwNw+968G/4buTYdPp/Jy+FQCYp9facCYxsrT8fjB0L409GxtjXXK
	 NNGqi8XUneNzHbKBFZ0ySiPiMqZ+h84AoKooohRGdtvmys51WbotmEhYWwb44tZ/4FduN
	 wOkd2DnBhteeH1PspkZEMgCbBw8DqO6nvyRlO9MAT9396f4JA+J4uv5KyW2Qw9vSPqA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795510358;
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
	bh=zpyHyHQVcfY3tNJDfAzrBXFZw/fhJuDXMPV3QfgDDhg=;
	b=e0E0nuHsXYNxMKML7NT+76tcjd4zi3QOSMTVJ6JlMJEuU+8MyLvp8PIC6qxN+DMwFIpG
	 RQo2iNf8777wCh22TVzNtEN3W4BK0Gybyq1e3Us2M4UvYLyB3VU/Yb2+2oDNktCr7MsbT
	 E7eq5FwqppYG6Y7J2EbbHT0dRDEPnxJZgKtphHqMz9vIQVWtAWbFNVrf5vXwMaOroF+Db
	 wzrkIF1rtRo4fwqpSGK5/MW9cFsEosWXDMLtkFLWJcWTwptK3cEth3ub1j2Ay2zmIoQCV
	 9UKrJrRnjKSA4DK4tZ40lSdWpprbvcIioy9EHa89F2lW7gNiuVDSql1SSznNmiyNYZg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=yfy6if12;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.56.69
Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010069.outbound.protection.outlook.com [52.101.56.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31A6B606A339;
	Tue, 24 Nov 2026 08:52:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31A6B606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=yfy6if12
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cTonSfHI23CFPwzdQ5KOzIoVSQbplUU6GeHjVxxjk8lsy5l3tKQvQ++42inLwt/y7RsK3hAnUjcf0Kaho7hrzpJtvVygePhgfoKxIq6TM/aq/vt1Ll8YO2ayJUNnF5gx2Di67yRUXDjjaHscvz0/AutEePqqTSmWFhLGDVcqwTp2ENHwUBagNlYdVaGMeQYWtEB1oTa+Bviue8CVFyr4s8wlWWJN0e7cGVJVZIDs38BJkZJTPqgzEGSDHnRf72hnw2BXOUvw6TEzoyJFLobdjFLCAQwbfpkV0mbpSXQfh6Hl6C4AU/lbWO/6sJYZx1ifXbj3lw90nLDLE9mMe+wZSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zpyHyHQVcfY3tNJDfAzrBXFZw/fhJuDXMPV3QfgDDhg=;
 b=U+uMP6nz3+WPeWIsudwP6cJBxXEx17X39F5MqpQbLUzK6VweUsjC6DjlUB0N5xFki1MJtm/eaMdYAcsVYVjJIRqyg9SLtapMKQjUJW26D/njYS1ds4mnT1d+DySEf7vF6jGMsC7TN6qbHz1USw56AHz441MCUpJNOlnUbqD37UUPZFfES9DyseSnDDg8xAO+edB//Fpf7bv78gUwz5JjcHQOL6tXho97J2lGZsDOAImQ3FRTL+DWQtwJ78KKfxMSENk34fehrVHSeuhTt8jN1+q8rdNsQrkyDZ6KbOJ3UN4ZJdGm2KM2rl5lX3Jq7zX+JG7wVZvPH0vGhu3JFoU1bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zpyHyHQVcfY3tNJDfAzrBXFZw/fhJuDXMPV3QfgDDhg=;
 b=yfy6if12xvXvSWrFCz3cn0xVCgKZN8XWeBVfVcqrNxj0RSshTwENaBy7ylkwBx+7AEu/Y6dznIIOYh1F47MrVm9muXhfk3Ds34404M3Tf0CKNBahs14jL3qSr0Po8wKFHFB+VhT3+dBXiaOY/X7yROKfn1XuxRGNG+yn6fuQB28=
Received: from PH8PR07CA0034.namprd07.prod.outlook.com (2603:10b6:510:2cf::15)
 by SA1PR12MB7102.namprd12.prod.outlook.com (2603:10b6:806:29f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Tue, 24 Nov
 2026 08:52:34 +0000
Received: from SJ5PEPF00000205.namprd05.prod.outlook.com
 (2603:10b6:510:2cf:cafe::21) by PH8PR07CA0034.outlook.office365.com
 (2603:10b6:510:2cf::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.6 via Frontend Transport; Tue, 24
 Nov 2026 08:52:33 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF00000205.mail.protection.outlook.com (10.167.244.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Tue, 24 Nov 2026 08:52:33 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 24 Nov
 2026 02:52:31 -0600
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.57
 via Frontend Transport; Tue, 24 Nov 2026 02:52:28 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>, <Poojitha.N@amd.com>,
	<lee@kernel.org>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH v9 13/24] soundwire: amd: defer dev_set_drvdata() until after INIT_WORK()
Date: Tue, 24 Nov 2026 14:18:19 +0530
Message-ID: <20261124085033.682755-14-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000205:EE_|SA1PR12MB7102:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f11c62d-8fa3-4239-275e-08df4a0847f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|376014|1800799024|36860700016|18002099003|22082099003|13003099007|11063799006|56012099006|261009223027099003|261021121427099003|261021123027099003|261102123227099003|261026121527099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	3X1XkWfS1TBOYLJ1KHpmhu095AijhBilBnDYJuVmFJ2E5eyGUpNKBOXQAqP0B2wAC9oEaUmB4Ws18sMAXww5wYTNOheuremweQe1WUE5UueHbcp0i8OZ4mlGBOfKVcSXhGTKwD9CObxLuLbUJ1mpVBqe1FWDs4JiZzyERbDvqIu9cYDiJyYKoE3KegB4B09HmyjwZWOC73e+X3v9+XzUXPH6ppnjI7eQfFe5pE/c8MDQcrKEhH9ojLsxhUh/w38UV0Y5wttob7Bl3nFwIHqnNqU5YgZCVeZ8y3b1WqGdgq8uOkmIOeA4zXf4ePu6szN2FhHugJ7xNoMX7jdLoQMRGe/tLHAKoe81IgZS6oT/tgvhSBvoXJOEipbGB9vZlVShGH0qtZxaOAEc1FnT6XdHr7BA0NfNtS54uSoQ26hiBMobyEJisfvBxC7aI52GCMtmRRJUw3Ib4v78WfVoCXrzfJLKkPDjQdwYe6W1xqzQWeHjzxazSX7O49wAyNLfrlj/nuRUSOKrxKHb5HcDLqZgp7FVI7YPHSj0Xbvop3JPS/3uBPaLhKYFvFuqfwSiXMjQXy4dXqvyG0MScBL26EFNhNfZXVgWhkk/lAQItUOYH5BarZbHWuKX/g4QKGtnJ4E1UeY61ON4EcbBnIWlpsljPA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(376014)(1800799024)(36860700016)(18002099003)(22082099003)(13003099007)(11063799006)(56012099006)(261009223027099003)(261021121427099003)(261021123027099003)(261102123227099003)(261026121527099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	mgyZfiZ8jLfgJQJ8hucXLBRAe2oOmscQZIk/NqXQKj0izbXBPGTkOll4O0q1ctWZJyWlYtJpbUd/44RlgVy5qGtQ7zg/6AFLzQM7dviW0RDkdQNp69/hdF4G2fIh1sMHZAPGvKZTXR6/JGTsqNqSoRAWbdogzye6MCQoODqq2Vjej9kWZUmkwOCa5mbxN7ncn+klDYchVdsi1H/FgwmG2IzgGW5hTvNb9B3NRWxudyq/3iO7ZQ2K8ffd9EIOOhtiROWcu0pbCh0htMwFe4or1bjYcN4G8xD0TQUHzzUgeaW+vEPDz1IRBo2WrUTS5gIoc4LVdqtdfkgc4q2xfy1rWoS2RrUqUnkrcFYnN58I1PsSBRAPbkjBrKHfCLEwMsYg/6ode5p3j/RRzHVHyMwZpDEYwGaqvXwRHnVv3LaDBE0VGRfE9yHiXKULNMbrxC+v
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 08:52:33.6199
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f11c62d-8fa3-4239-275e-08df4a0847f7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF00000205.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7102

amd_sdw_manager_probe() called dev_set_drvdata() before initialising
the amd_sdw_irq_thread and amd_sdw_work structures with INIT_WORK().
An interrupt arriving in that window could call the IRQ handler which
enqueues amd_sdw_irq_thread before the work struct is initialised,
leading to undefined behaviour.

Move dev_set_drvdata() to after both INIT_WORK() calls to close the
race window.

Fixes: 65f93e4096a0 ("soundwire: amd: add SoundWire manager interrupt handling")
Reported-by: Lee Jones <lee@kernel.org>
Closes: https://sashiko.dev/#/bug/linux-9890e8dc-4b7d-44d3-bfb0-171dc421e28c
Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/amd_manager.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
index b1a0e12819de..c412d4ff4606 100644
--- a/drivers/soundwire/amd_manager.c
+++ b/drivers/soundwire/amd_manager.c
@@ -1254,9 +1254,9 @@ static int amd_sdw_manager_probe(struct platform_device *pdev)
 		sdw_bus_master_delete(&amd_manager->bus);
 		return ret;
 	}
-	dev_set_drvdata(dev, amd_manager);
 	INIT_WORK(&amd_manager->amd_sdw_irq_thread, amd_sdw_irq_thread);
 	INIT_WORK(&amd_manager->amd_sdw_work, amd_sdw_update_slave_status_work);
+	dev_set_drvdata(dev, amd_manager);
 	return 0;
 }
 
-- 
2.53.0

