Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.3
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795510365;
	b=wC+mD9J6Nn5g8CU6+PezwO5EX04+ee4+/xX3GN1k8hNrK768enCa7cC8bnyv9A6xIq8Y
	 GYSYaJF8YyOySts82P+gmGIQmOQvQejb9g0PWYzLDfnzqT+0c7brRuevKdEKPzdOWO5zl
	 R1gHE7TIqsI25eH1gtjN0odnwufYpkoSK6VZEzgk9CRQPgC78SEee8bOhQbVcEodqU3+n
	 e36tq4msOkhVqPk2Zo1XEhkga7MeaCAew8220IRTIhFdZMZypthnckjpR4kz7Y9nDfBsu
	 cVs4RHAQ72hn1zMMCsCXK/J1Z3kvTgoqGk54+rc7wfCys4TWfxavbpDU4srs8JOgNnw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795510365;
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
	b=EbyfHkS/8L3jqlwS2oKEbE/6wjF8b0ip+yQRNnqLzBopDRh8GXGIxN6ztqx3rNTXfAiK
	 AakVoOez+0h+vlna9wTBY2l9oYX7zJ4DnHcsFMmQf15wuRI8RKQ/TsiT8uDc53rBzruUa
	 7BS9N6Q8ft6ZMaWK/WAbBt7iaO9mW2fFNbqB7l7j845jFnMZXJmQey5rU8K8NFlWd2CLg
	 j6Fv+oC5b5CV8Y/jPiA+nsVEhYl7jv+7UCOYnU1IHCgV58uHx0y1KdVznH2GdM50zNjqQ
	 kdhUhZUcjJ+FhqPRvzOYTEyNfPYMNSKbCAj9Ij5h/EykMbnsg90SQrJz7Jp9T4xzdkA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=QUvIOcCc;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.3
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010003.outbound.protection.outlook.com [52.101.201.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17284606A32A;
	Tue, 24 Nov 2026 08:52:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17284606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=QUvIOcCc
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DHUeojpkFApBiv4AggZKVjvCzvgLAG0FCjRWiKzdkY707oUVdYGuT8R8gijeBbiKiRCG6TgQKBvfDeTaKmogMOFaZXm1vzd+XIy5NEJCFIUeGUJvAZbKGWx+mkFl5Wz8cb2pAcB4ODENgj8E76GlQaD0cZak0lNsiA51hxK6ntHfzog+Qu8RagZpxwMGOd5QujN3e5Jz0Gq9wZ6YapHQIWPdVuP4eCGt/EGnvQfyXlzbcpfN3e4Rz09AGvFfMN05izRa+Rg8936aObo+DCzHs/FIVTmEJ8xFM+hrb9xwPb/CtukCzV5a4S9XOlaEaCFpHZvmqX9u4vS0Qbqznijmrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fBfLulQDBsViWKJquVogu5YvdACWq70IES3d00VorWI=;
 b=ZmFSlmvck600D3TlifmqvJlQ1zQkseG7/dMcCpsdm3tldwR/zPyFfCuRkYcXvoslrE0okckKIcDcw2yF3yHFjODPe6EAmrb8KSF4IwB04CLNPHCvDPK6nqtRfGuXRDFrh6lbq1hCt9gSayfPqfLUlOoKs0x776BEIUVqV6eUwRwMHnVGkXufwSOvmXGWL+VhuImYvQg/iPb1HQ9VWryrE3fKqrk9D2X6kNXUeqN74RYo8r8UaG4v0JdbScuZGwsEE9c/GxTtpZ7LSDhgWk3l9jQZ3SkwjlZF5N6N8Ofk4OEwPHtqrhT/ZH9xZXAYSjqnQOhJT8H5LVspVk0VhQpvag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fBfLulQDBsViWKJquVogu5YvdACWq70IES3d00VorWI=;
 b=QUvIOcCcyij1Bw1sGYZLHTJaDpoorBVaudY93MQHfEWDFHr1rejAh326lkXc8DgVh1i8al6D+YUJ1CedKPNtyCgpbI6CFT4lnn1rCfM67oFZvpnPlJktiGr0/ciC1zGzPfA0I0raId2hX8nb7iZ2fkLZDZrDf9SXFbFf2kufdcQ=
Received: from MW4PR04CA0088.namprd04.prod.outlook.com (2603:10b6:303:6b::33)
 by CH3PR12MB9252.namprd12.prod.outlook.com (2603:10b6:610:1ba::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Tue, 24 Nov
 2026 08:52:38 +0000
Received: from CO1PEPF0001885D.namprd02.prod.outlook.com
 (2603:10b6:303:6b:cafe::94) by MW4PR04CA0088.outlook.office365.com
 (2603:10b6:303:6b::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.6 via Frontend Transport; Tue, 24
 Nov 2026 08:52:38 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CO1PEPF0001885D.mail.protection.outlook.com (10.167.249.246) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Tue, 24 Nov 2026 08:52:38 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 24 Nov
 2026 02:52:36 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 24 Nov
 2026 02:52:35 -0600
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.57
 via Frontend Transport; Tue, 24 Nov 2026 02:52:32 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>, <Poojitha.N@amd.com>,
	<lee@kernel.org>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH v9 14/24] soundwire: amd: pm_runtime guard in remove path
Date: Tue, 24 Nov 2026 14:18:20 +0530
Message-ID: <20261124085033.682755-15-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF0001885D:EE_|CH3PR12MB9252:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ecf04e6-5dd0-4c82-3653-08df4a084ab4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|36860700016|1800799024|376014|6133799003|22082099003|18002099003|11063799006|261021121427099003|56012099006|261028144727099003|261009223027099003|261021123027099003|261022105027099003|261026140227099003|10067099003|261102123227099003;
X-Microsoft-Antispam-Message-Info:
	16ISBzIkLQBcSM8XfojnafylXQO5Os6tqkDVngvn1mBvh5g2KTjDLVMw52aBIs1nZwIgTqmVnwom8eIlcpAW3zT+JgEyD1YVUZ23MmtXOCvTANZhdT6B4Fb4fbB3bsdX78imMg+KsE7mxkg8MiNjoizsboiCx7NgGmmQF5Bf8+t5gCeIuWuNIjwmfF/ybFyJPJ7LgAkRULfkaLjPssuWcdVCc0wvqnRe8THaJF+LCs3WOlQnU25OdlJEulzMLVHTvmZ8HO1jvZk2WPPLJMWYknMvVofySo/fd45EvdWOYPQ7x/SV98g/hIB9g4G7fdsVxhnet3+78PxLxsR6SmwgYSbJgd00QaND/vQzlJvnatGFt1ILOlVDUlTeu2sbdPFPBSFW5L8D9lYwfUBw1QjNoDZMzU8DfI3UUukoNpkpo5Mwv3/IlJJijmwedqyOeW5ScgZOA9zxbOQ6iqcBreplBVkDWefXqtZSO1hXmehF48Zh19TD0GnEMFm+zEj5EFgYlI/dNQ72QLYEa5rYK3W401gjDV9tJJ8Epe4w6b2dyM9o2qDG+DiBdvj6lWw1DVwLnLRZgZxMmjvX+Tb+8pf2LmVu/3jbnjOlAxRaXlsMN3Zfu08pPeZCRtbT4hajFzDp6dRGQ38Gt/uQmNOKkYXWGicGT13o5TzuaWWxmP8oZFEtYD7Q51JuDfXLR3mHLQtnTa5gh14hOYLEiKfLHI1ljA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(36860700016)(1800799024)(376014)(6133799003)(22082099003)(18002099003)(11063799006)(261021121427099003)(56012099006)(261028144727099003)(261009223027099003)(261021123027099003)(261022105027099003)(261026140227099003)(10067099003)(261102123227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	PlaMCW4yg7/OhuF9X7t56V6cjg5YdDACtOHIS65+OsEU9X8H3DGrmtsnucbljqejhuY58vntvFRZVQ0xMpsfOps7MZuPq7Sq6muRx+9IfAo8YGygT0vWcUfqhT4KcwA/bdTvwB7JV/FCD0nhHb3HGS+qSDVIc+3HZlLL4vpWHWLNz5/cx+178JN/P/ksKOo7pf3M926qe+G3Hg07f1Z30yaUjyL04HJusQzbyI6W0nL36lCVuE/9Gn1N6wLr2WMvU3rr4q++bAMdsRCAZYTzNtaYJf4D8NWkY7iyf6o0EujxvHe1zl/hogQKkjXbXdrhzxqwO4KwW8apfkXdlUNbj0EmbHWz+e6PqYtqITaOQ52obqNSF5gD8YXuX/ta8qGrqTbzqlKXoPCwvvP+lfpPnJHN4o98M2sAa8gIjjdVZSIzJeiJpcqNUGQo/goIhcfg
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 08:52:38.2031
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ecf04e6-5dd0-4c82-3653-08df4a084ab4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF0001885D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9252

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

