Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.52.71
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795453711;
	b=lNPArZQrxx5T3mf4nX4gwOB71tcsdtVdO9oEhn4j8hqOr28jyv4F+0vrA0ZFNa5TwlX5
	 JNTPiQha4OXVoOhzpptrJeiu4FOUkz9miq1zqwRKGjGarZbZERdLP35qiLHxl7KOeeIGs
	 lQ+oJLgP/dF202FtBAKvPgidvtOw0DK9zSryfKSzXLgo3f7KM8CALqpap78N552dM/F4l
	 Cn6Tmzu0R6UonPEcVBfnUsmjxuKV2PA6/wCJdrUsOshyOlWrRHQC0NgB+moqIeJSZ+kYT
	 67Oc3soeYndbuOw41xoDhpJvhmvYLAtT9ZJJlEn4Ppn0e6+jP1kOJh2D/dBN73KDytA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795453711;
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
	bh=fBfLulQDBsViWKJquVogu5YvdACWq70IES3d00VorWI=;
	b=jqchapfgIoJknPu8YcPwTFUQ3cL9nIhHeiQYHIxYIfuoWurGL8+vXlRT10iCTszq0x0+
	 1C+47mjiDy3Ogx2fKqwpAsfgLd+FF8THvMFBEe6dmaoyXsg//OxEGb0EBU+vWQG8wLnIH
	 L46e/FgrtDAZpruMakeJZvUQ+lFiug4jFtB85p/yilmdUipBVJiSa3ls7RW0WujJX3gF5
	 Z3WKakOxzBeSMhKRZwfvBT840Z+BZmrWz2vUK2p3yPysw/6ChSy9H7qv45WaIAjcZBbqz
	 OKO3l7GVzK4PBKfiZZ/SOj4DY/3L+GQA6DN2IwFu0BndaYrlst2kMpllPGVbXMIMd5g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=tBQxsYJf;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.52.71
Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011071.outbound.protection.outlook.com [52.101.52.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DCA0606A31A;
	Mon, 23 Nov 2026 17:08:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4DCA0606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=tBQxsYJf
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SIuXeUDJKntzTNuheBVW/Fhe6gbEJCm+yHjQaiwU4/mbXDWwW8ySPPdn3zFM5boaWtRbeQMJ2DIJgMmdAitePiZGkSunme7aAmLPp5hDfGzcJ3ZkmeXeCAB88T1aBfZRSaqpcYFlZMgcdyh+UNBZ7zF40g/kfrE/4Sw+X/EisOlVzcx+2MWg0x0ORTZCTqSSRcti+x6gVvH2Haq6wFKJS43Po/y9X3u69GAqVykUWNYaS/7LmJOK0ZbFuqfjJmSF4lFCEYFbVxBG0kj70bafF5Du7rSm9zjG0jn4FFMO2myFn0cNXse62cWfR/dlKugXWm4tSnuyW4Vj+ERUJxqhgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fBfLulQDBsViWKJquVogu5YvdACWq70IES3d00VorWI=;
 b=LYt6RsDGMRn45t8UGpsD612/GMRDUB8DO4jBw84DGQvb8TLVyaK7IkGVyJikz9Xn8nTHWLJbYKpr4R7SV0BnVPU14KJDOt46s0s1XZYf+1Y049VLst9AxP2WL4P2XfLevb0Mis7g09ZzSkIsVcjiVrR2B9XjjCQdZdWxUnTp+c0daAUfXjmNYBa5jLmyYOLerivfGIGXu6l+R61SU+EaVvnZgKCFC7LMtBrvlKN2IMsb+UISiNInoq7FXrmGuTRED4dxn3Q66LhJPkV+9XrbDlCB4UCGw/VDqXBysVfAvZqnu1UiKI0JePlyM9oq9HNhqPsaxZoeqwREg705k1Od0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fBfLulQDBsViWKJquVogu5YvdACWq70IES3d00VorWI=;
 b=tBQxsYJfLO7wZe/o1OadIybF92+eVBD3e1S4hLbhQzTRzpPWghJIaWStD6zpuhjaROjsqTO90VuC3YBrJ9XQ7yVuv7aTbJ05ulLcTHCwGaJwC8gmZaYeQ3k/LKK+4NJ5q6+k/FA4pneeZ5Gy7q/FRsm0OUz+cbJI1lv3cWwG5t8=
Received: from DM6PR12CA0015.namprd12.prod.outlook.com (2603:10b6:5:1c0::14)
 by MW4PR12MB7141.namprd12.prod.outlook.com (2603:10b6:303:213::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Mon, 23 Nov
 2026 17:08:25 +0000
Received: from BL6PEPF0006C3DF.namprd02.prod.outlook.com
 (2603:10b6:5:1c0:cafe::4f) by DM6PR12CA0015.outlook.office365.com
 (2603:10b6:5:1c0::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.14 via Frontend Transport; Mon,
 23 Nov 2026 17:08:25 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF0006C3DF.mail.protection.outlook.com (10.167.249.234) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Mon, 23 Nov 2026 17:08:24 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Mon, 23 Nov
 2026 11:08:20 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Mon, 23 Nov
 2026 11:07:26 -0600
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57
 via Frontend Transport; Mon, 23 Nov 2026 11:07:22 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>, <Poojitha.N@amd.com>,
	<lee@kernel.org>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH v8 14/24] soundwire: amd: pm_runtime guard in remove path
Date: Mon, 23 Nov 2026 22:27:35 +0530
Message-ID: <20261123170520.1380924-15-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0006C3DF:EE_|MW4PR12MB7141:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c1fcc08-36ac-49a4-bc90-08df498462b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|82310400026|1800799024|376014|261028144727099003|261102123227099003|261021123027099003|261021121427099003|261026140227099003|261022105027099003|11063799006|56012099006|10067099003|22082099003|18002099003|261009223027099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	x1EnwPf6RZ3c4uQrM68/svjbgkZDYSQk7je7iSZE4WwmxTgqhxeZeHBVQu/ue1NhpbZnZSQnVAqvwjVCW59Hig5dAVVWnhWlV5lrhGiFE/RRUNzyumRmR6UyqIPdXYm3TLcgVgZLF4MryYtnBWRhA/33KUjmqA07RRFy8bOmwgk0HHbJx3O8HJXpaMRoBmWZ4cMWTAOTfUuWV9iJcoEXuEekYzRJlff7PAO9evut5kOyIPqUN+V37xwi1+4idyFOztNTx3Yz140y/OqqZnRu1LIEP3V2NBTKU0bmtzf5DvCKwnjaN6Ox13jHbr0AEgU32d9p9jg5SakOT/pZveRUcuG5CbCG6IzosWlaP4aMTmXqV40FHubOO3QeVapZsIOLHhASYtLSwRFHgPnFnWxbKvzPLRFbPm52bU31Z3/KqQGUuUC53/G1CSv6QcVv0dt4trDaeyQPADat2Aw+ChQN8F0SMJe+ubq8mwj25vrOLDXi6uPYSU51AAqCUI2LAnV4GMImLP2bAwWuIrXUe+adH31QQXU+h/aQmG+zfkgBVfQUGOn/p/AUoGSglYwZabcHT2HztFTXVA1ZQD/RSjPDszMJyGZ02v26ct0E1fH7ic/we/yNhFn/ja7ORCG/cwKEJ4Dt8vGZQD2eLd/ZvN0o73lLOPn1eh1l1nemAq9pBnZxAwSLcoQQU2LMHzCaLRhOllravGnpfCa1pWBwNSnApA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(82310400026)(1800799024)(376014)(261028144727099003)(261102123227099003)(261021123027099003)(261021121427099003)(261026140227099003)(261022105027099003)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003)(261009223027099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	gKNuSCqxWCY/wo3HWQ9Z6z6txIX6/evOx7TFLIPwFMtbgeeku6yNJvsmys2hTBuzkF5PlSC4nF8YmPmLOj7NpEeDPVH4GACF0jGI66Mc8MrjIPdpmPcuLo7egAAU/pTjy0PmF4QrT/Y8Kb2Ah/4k0x14u3u0i0PL1MhqW5urQg5nFj5xAq8GTc+Q7/gWBH+sH7VEByoI2SzOI/4xVy3qk1eUVW/mc1RUO9wsrefPHhav99w/ffAy4Xk7f1V6Its8CFekjGS7jbAy9m+QXlzC7B67zASkFYzDvYV6fQqqqY5eGWgho7DsPknckQj5D7W84DBaSnq6ZlxV5Wc81s2vhnkEnasOTPHK0w0BocuYQEn4GXaS8nO94NAFuDaTDA+KMjkSMRJWNNv96OPRqPuo0ObvrhyegOLOPVU/Qph2hN/gwHDjxjstIezGFYZHWs9f
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 17:08:24.9848
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c1fcc08-36ac-49a4-bc90-08df498462b2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0006C3DF.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7141

Guard pm_runtime_disable() so it is only called when runtime PM
was actually enabled. amd_sdw_manager_start() calls pm_runtime_enable()
only at the very end, after several fallible hardware init steps. If
sdw_amd_startup() fails mid-loop (one manager started, the next fails
before pm_runtime_enable()), sdw_amd_exit() triggers
platform_device_unregister() for all managers. Calling
pm_runtime_disable() on the partially-started manager finds
disable_depth already at its initial value of 1, silently increments it
to 2 and returns without a warning, so a later pm_runtime_enable() would
only bring it back to 1 and leave runtime PM disabled. Use
pm_runtime_enabled() to skip the call when it was never paired with an
enable.

Fixes: ed5e8741b8db ("soundwire: amd: refactor amd soundwire manager device node creation")
Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/amd_manager.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
index c412d4ff4606..93c96613b5d8 100644
--- a/drivers/soundwire/amd_manager.c
+++ b/drivers/soundwire/amd_manager.c
@@ -1265,7 +1265,8 @@ static void amd_sdw_manager_remove(struct platform_device *pdev)
 	struct amd_sdw_manager *amd_manager = dev_get_drvdata(&pdev->dev);
 	int ret;
 
-	pm_runtime_disable(&pdev->dev);
+	if (pm_runtime_enabled(&pdev->dev))
+		pm_runtime_disable(&pdev->dev);
 	amd_disable_sdw_interrupts(amd_manager);
 	cancel_work_sync(&amd_manager->amd_sdw_irq_thread);
 	cancel_work_sync(&amd_manager->amd_sdw_work);
-- 
2.53.0

