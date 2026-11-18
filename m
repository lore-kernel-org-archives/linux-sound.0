Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.43.14
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794998778;
	b=iLo/xRwph79kPiz2BvXFK7W6cTQFLesM6oj4Jm2fXA22w8tFQQT9Ja3rUzTTXkcSuR7M
	 mlbbW1J6BhzMh7BwKso+q9t873DXeeaY5EtxLQ6qn2gXk+PEj9k0on6KctxX2knDluUjt
	 hsaEwiN8rCZPOkeh4Ap8TdLacgPkNyGLAO4kAojyIahLDenqYkaicnB0DDd4XlIAKlDRp
	 X/JoZmDsPsga37hE9ucCs1Di9Pe1mItJmiUOgdAWX36SQduQpj+vv51oRJEFZLLK2f5+s
	 QpQV6h6l1XCKub9GzhWbm5dJat9IqWfRDcIbquFzsQzm+LEXyEBBFyoqiS3jTENQvcA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794998778;
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
	b=GmNm90xnHEke0dWR+MEBF/DoITtlf9+cSL6aAGEVM32IZBevfte/fXckaHmc5rxqHMTm
	 Iz29Z0/+I6cQ2aulsXCgtjKL2mdG+uVhO2W4qRW3BZ63loNI7s8Z6tsVEbJ7sfOqF6Lea
	 c33F9+It+mAmFAIOTBkpQM8NQBfoqCimJIH86w6IYWDsYpGv3eJUNtCtYjuCEfvO9iPg+
	 UWCPnR31ZptP9dcrtlKUpWEoI3IMtbM5tPeF0wATbeOCwF87t9AiYdlqj5rJl3yyyeYck
	 bRaTfe8KqtcPYs29aX0LIAIgCieGhtYBGF34zfcKudvFHOKshUaNE1abkbyf1v429nw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=jisaDHHF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.43.14
Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012014.outbound.protection.outlook.com [52.101.43.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8854606A325;
	Wed, 18 Nov 2026 10:46:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8854606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=jisaDHHF
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ju8nyT+PmhQoms+GZS5pjQZOxN9Y4SKs5SdyEksMPsWgmp3Wx5KGPVXr2VmSqQk0m7qR9xOgMwEovVDVeNPoDKXqYfeqHFU/EbpOV9u5TjyIYEBKq3/Y69aqPMKgIxIQVD987bLiVefIUwDGFvzvrFiRJbS2hVCRhpGrlE31ZbxT4C0yJLFrvZu189PrkMFo5U2HXfjInkzuBP3Cb4MpxPXFSiB3fvp9u2MaCe1vWtVkdobi+/E0WnqbeIRVv+4ADYKs3mVRZH0RmoC0mI70W3NbhiGGkNMSUxhEJhc/wJUsl1bC4lMMT2bPsWRU/GoISdm3SdkOt8mX3j9bQXXUmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zpyHyHQVcfY3tNJDfAzrBXFZw/fhJuDXMPV3QfgDDhg=;
 b=g8ibXHrHknvWBbt83IVekvQCADKIdQHfeUeOGAPk7aMhKYKlNlPZHQIr+oHqL/2Jhrx1cgZOXg6rXP1lHWsZZbH7nyzvCEZeVOBXk9a/Ohs5eOjiueFfRheWsRTrqoCh7BvxmBk645qmAGb/TK3vifrFFck3zPu+vgKKbRQdq0HLXY0epZ4GzEbugLExWqUo/8OwU39qwnW/D1B5Eh9QxsyTbje/s3Vy8VICx5bycctXFpqUfDA6Jn734+8Acym+TTfBf9eIizGAZuo9db72FSowzfOQ7nS5NWPVJiQ6+VrtYYr1lKcPfQtttBKOM0/DU4mVdeNN5O2VauEe5Mc9UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zpyHyHQVcfY3tNJDfAzrBXFZw/fhJuDXMPV3QfgDDhg=;
 b=jisaDHHFc3Jnk0C3pY/4/fNbGY2wHh4yXK5imDN38gqffPKJrCIfBVOr55Yr6ZjY+u4Ylvm1q29Vu38p3GSASqJkd5ULinIoqk9vmFFaId/slYbWD98QgvFakOaF/WrJBLThtLEZvoiTeabg9Rnjgze4Aj2JAU2DjtciwdE4Rzw=
Received: from PH8PR20CA0005.namprd20.prod.outlook.com (2603:10b6:510:23c::13)
 by CY3PR12MB9579.namprd12.prod.outlook.com (2603:10b6:930:10a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 10:46:12 +0000
Received: from PH7PEPF0000000B.namprd04.prod.outlook.com
 (2603:10b6:510:23c:cafe::11) by PH8PR20CA0005.outlook.office365.com
 (2603:10b6:510:23c::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.9 via Frontend Transport; Wed, 18
 Nov 2026 10:46:11 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 PH7PEPF0000000B.mail.protection.outlook.com (10.167.243.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 18 Nov 2026 10:46:11 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 18 Nov
 2026 04:46:08 -0600
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.57
 via Frontend Transport; Wed, 18 Nov 2026 04:46:04 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>, <Poojitha.N@amd.com>,
	<lee@kernel.org>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH v7 13/23] soundwire: amd: defer dev_set_drvdata() until after INIT_WORK()
Date: Wed, 18 Nov 2026 16:12:32 +0530
Message-ID: <20261118104353.331556-14-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: PH7PEPF0000000B:EE_|CY3PR12MB9579:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ffccf35-d2b9-47ae-0f07-08df4561296d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|82310400026|23010399003|376014|18002099003|22082099003|261009223027099003|13003099007|11063799006|56012099006|261026121527099003|261102123227099003|261021121427099003|261021123027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	AviKMCnhXsoFzpgadgNeF5C/0Xfq79C41Wgl2/5cbCKlLrW3MtD5ZwLuD3zkOooQE3Jt5Sb9EtKoVdKZIRKRfPzmJhBOIdSguRUErf4FVKjYrdKmNQUVhE8eprlN62V8zq+tnost0pJapoAPNSIkwYB3uBm46UxJSjNU44Op50KnjF8GBMPGda4ZMZba80At9KqEC5TK/A9qDmen9rleEaAG3oPDT2AL8P1kL9H/gHCVvjTBVQttvsgh7zFosWhLS0p0d7EcmYPPsDST1dv6V4ya4Pa1pF5ASyyfFWSJjKLcqP/YAQgRT2gAKqtyHSDFI9aWkEp8X7brnU3WzsDRFDIHROSgyb05BFaC3EmD8WO3R3X2wWk70FK4Sp1NBT1/9/6i5777FXDqlhsfS74kG81xQmdF8zInMeY89BeFyO1JTgFuOU0iOGDgfYMmFncNvbtyehs2VY4Jc98dRYW3Jds+u++X5dAqAzoBB/qutR6mu7sNPKyFw5NCSREDjdpY1z5QbAjZtjInLRyhXekMmBuDzPw2ouiMUqfkko/LSiU7wnu5TPa32EsIVKt8lTfLOhA3k0VGn6cJqE8r4s0wN7ELg0acP/LhGlcfjozhbr/bNo3ASOokBc8c+yFw5uJCQMq+zmL8S8sjK1nczitE9g==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(23010399003)(376014)(18002099003)(22082099003)(261009223027099003)(13003099007)(11063799006)(56012099006)(261026121527099003)(261102123227099003)(261021121427099003)(261021123027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	itrJh5oCWbL7PGZmZmX50Xf19HE/UQejAWg1FUiaxBdfDZq1438rzJW4LRv/cpuomSp8bc684H4g3glhwZSLTG1L/xD3dO2cEMSjVI8sWbYWAwsZ/ETU4v7SLY9CnIpBLNxD6MPE+24hfLW58NyejNPH8wGmdqBiGP1QVemW2JHg9Em0476XN+/AAnNFVFNKNt8QLj7bh0UsTYWqlGvfXYLkw4IYyZZbK3WoHlkSN5BrYZ4pa8P8H6rEeOiTWlwrfNkuyDb6+FxjUOAPdvKHm0vZgnV5FSzaUwNyCKkfx/fUUI6XDIMgPqQ3KpJVblfMVKxkcQWYCTElhgtGq2XiSV5Nkw0l/T9X6ncSYE3P76ofZxOMm7vpu5B0O8zBOlKkO9Tt5P251r5f7hP7svuUacT+LF10bhNlvargVaGULYyAkKoPSEw0yME0sXsI01+r
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 10:46:11.8268
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ffccf35-d2b9-47ae-0f07-08df4561296d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	PH7PEPF0000000B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY3PR12MB9579

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

