Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.57.68
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794998777;
	b=LIQz/CJXMuO95IK56XbKSTc6bCAaD4sAXrNdYerHah3thDpPC8gUIpcaz20occSqvk9M
	 MTkmP0THmZLgMcRnLIs65UwDV1roXiSDkqmrVWiL/gm5kOeMTqhEuL/ZE/bA1dyS4oOtX
	 9oqZgUTzGjybYKM5LHc7v6p1AzP9ppto6Rd88l/IyYXsDgqFAxmwer2skfJ4nQSV5y7g8
	 QxIBjdYek0u6otqXAxBjXaLDUtMwKzOJErt8MIRwLnxHSP7DrcUNWCTlSskskGr5TYf4P
	 yU6kxyMFHabqaV87Fo2DcZ40Tr7XL6RThfgX4GZnQHVwpX69f6K51e0RJlE2nQYDTLw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794998777;
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
	bh=Qss38gpUnIXCvJyjifrG+UCoHE4SVMGMh4IdOuoQyY4=;
	b=YDTFsUK8GjJzhT6F9mAosYR2U8djD8g5/IkEqpsNhWeF66wK/LATFbrg5mctmjav2kly
	 lcRjDDGBWPHIs5fFDQyVJm7GnoJ1mN8mpbRmyeslL+hjIMW6n5hmgO/SBEXPwn2UGsu7/
	 px80ZofhSncZ6A1aHwo1ah29N/g/kr6lfLvDivDzURUaQ5BNthrq9nUdCGuHkl9UcrWG4
	 uI6ApOyw+3Ahvo5stPEPkvOODdYRxfzGewrwXXD56RrZeRAnZ6HwylTZBzrFayiJnjyxX
	 FV8ZciD0D+ovo9ZtGr+8eQB9QT3kw7WLUm4uJ0nF+HSIt0jjrn/NEFOWD4sfIHzBMqw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=U5hG102r;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.57.68
Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011068.outbound.protection.outlook.com [52.101.57.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E86F606A320;
	Wed, 18 Nov 2026 10:46:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E86F606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=U5hG102r
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=he1dTfcqu9HA+GN8DVu5cgoalUXXNOFvkfPO7Nd+ewZ/gqDAZ4Hk9vdcxu2J1wMIFByYl/cl+bx/arIhfaAw+O3mGce3CByg6rXSn/tYzx7vn5nCxOVUSEYjFoj/2wzp3lDBNoKkjnQby0YcdqJ0Le5MpXbG4UWHcGhrtyyI3QNkwwWV/Zh3gx2as/QnvklFpgJMSv1LGgG6S194qQPekitw37Kb+8VRSR4LVjXjF8h7g4CLPZsPXf3gf56PzZwiPvoEo7yQLSKGFYnM/A95X3P/u0UttJYSxWLBGd1NTovVkuDGRcJHIRQ7lPVOYfr6puvpt2yqznppOZIJrrorEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qss38gpUnIXCvJyjifrG+UCoHE4SVMGMh4IdOuoQyY4=;
 b=MmYQLmMC56c3qt5sTAfU8O3CwUFFciMVFIU7ny016RsGtSmHzxBeroTJc2JH7ZZcTkbdyRWEw5xphGc3jYuvD8wmFB0iTyEyam4kO6mpr0SQ8HoaYyhzRw4W0oNDL+d0zSXmeAjgm8w5SgMWqaqFt49K6Ce3Xasj3wKFRnHG+HRCext1hUKPDOBD5rT8kvMz2S117lKyz/jLEdFKJjGgTGXurHN5akiJI62CpIpky/GyRS4TAs706WeIObIkPwFaSGeL3IM/1rAdGyaOAg/FU90ZHHwWyBMHEYv97PkCAtpzCFG9q5oML9x4NHOw5UN4YAuFFJsU7IyBA1XyiEUNEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qss38gpUnIXCvJyjifrG+UCoHE4SVMGMh4IdOuoQyY4=;
 b=U5hG102rVxrhc6txrIXDKO+ajhEq3is2yt5SIXtOiBHU85AYt4h0FsoI2hgjFotpY+uKdVBIPD37ZdSGCh7QpMYPNpr76bkkmAlRkDPRd0ywXmSy2KjMUKjwGS2QKm1q9ba/jY3dMIONLbQPxiZvLY21JxRovJo7AciQfd0Ccm4=
Received: from CH2PR10CA0021.namprd10.prod.outlook.com (2603:10b6:610:4c::31)
 by BL4PR12MB9533.namprd12.prod.outlook.com (2603:10b6:208:58f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 10:46:06 +0000
Received: from CH2PEPF00016D4E.namprd02.prod.outlook.com
 (2603:10b6:610:4c:cafe::7b) by CH2PR10CA0021.outlook.office365.com
 (2603:10b6:610:4c::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.9 via Frontend Transport; Wed, 18
 Nov 2026 10:46:06 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH2PEPF00016D4E.mail.protection.outlook.com (10.167.244.123) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 18 Nov 2026 10:46:06 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 18 Nov
 2026 04:46:04 -0600
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.57
 via Frontend Transport; Wed, 18 Nov 2026 04:46:00 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>, <Poojitha.N@amd.com>,
	<lee@kernel.org>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH v7 12/23] soundwire: amd: fix work drain ordering in remove path
Date: Wed, 18 Nov 2026 16:12:31 +0530
Message-ID: <20261118104353.331556-13-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF00016D4E:EE_|BL4PR12MB9533:EE_
X-MS-Office365-Filtering-Correlation-Id: f24118fb-fac9-4126-a8f4-08df4561260b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|82310400026|36860700016|10067099003|11063799006|56012099006|261021123027099003|261021121427099003|261102123227099003|261009223027099003|261026140227099003|261022105027099003|261022075727099003|261028144727099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	eZU/qZKkiLiER9vh3Z+jtl7WtKjlPKdjOCgyYFyi25/iV8utCT3Trt+Cu1BS0lV7V1wN1+dy6edYfCz/OwiPSH/cN8CTreS7EM+pIVBTjDtR4tReLLEMcmBKy78pVp8+8Zi3Xe7dMSOQmV670ivo2uQryog7xLJqNDFiNviS/fr245OkszO4u+nbLuq4zBJdDytC2mm44SqtCQypTlkpkxdPfmoFTR0iBkpt0otyCoeOeiCJT0n3oJ+I3qlvcv++ehBdDa2xNjtNh5n3fLwRM90n2Nqe7SZO0OLb2xm7aI5n+0d91fb3+gKvqyW7h2BDD1eZoWeyutHaHwbYFi62l6haAV401sKpikKXTYQQn2SATw2exGrmaK0E0pLLhYOo0nWEHEj2l7nY2RAtojX8E+jGoeTuHhhIhW3fikzlXUhsDzE9fMAJ76ZWGR7tWES3jPDVfQCLVcsZaX1dvlk8WnKfz6aPeNnVFc3WOY3ZfIa0CWcEpGx3FHnVRCv8DRqVzy3FvP/q1yXlMfgIEBEKcMcTAUZ8ARA8T76Bow+Kwe0ulsdfyToLQehk34ZPgdw4mTyQz8S2zqxPFS1Mt8o1ph27qWEWFCxqWG0TzVi7L+ypMru7/1aZmDLpzc5pYMMcvXYsmIXQX263YFcRv6d3EQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(82310400026)(36860700016)(10067099003)(11063799006)(56012099006)(261021123027099003)(261021121427099003)(261102123227099003)(261009223027099003)(261026140227099003)(261022105027099003)(261022075727099003)(261028144727099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	aZNywOVwnJKB1i0EY55qA9O/HNvxKXXk1pj9NUYoo5wY8eNmgqOdZsJH9KmNSgP8q0PjwcjrCNgAxZDUeEi6ua4xezHim1+cPuYgdwaEqzh+BQYfdMp9G/M53LtcvuKTzLg9SJhtz/XQf3P7lu/RDwuLRGY6gQz9lhYeFOX3/hz2zB1xYiSRCbCaLgQpe2l+VBCoiIAx/lbgNF6V08Vj7W/3qpYYFxxiDs6f4tJhVz1kHyftqqNyjp1+yq93sESPxW1U6sI/UKIYILQBUI6+10VhEvVqtth7ldAFu8F9fQ/M9PYTtw2UPix+MWqxd+o80WiqjjVAZ6OT3uIaTKTePQcRvcmIdgzqARtrkFMxOYVtvIppl7ncID6gqlnqy6OgmmzIJJm8mtvQRT6Uxymw5DKUXaqq5V6svGClykBrUZDvwDeiRswnJhQHs1GOBWaY
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 10:46:06.2064
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f24118fb-fac9-4126-a8f4-08df4561260b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00016D4E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR12MB9533

amd_sdw_manager_remove() cancelled amd_sdw_work but not
amd_sdw_irq_thread. Since amd_sdw_irq_thread() calls
schedule_work(&amd_sdw_work), an in-flight irq_thread item can
re-queue amd_sdw_work after its cancel returns, defeating the
cancellation.

Fix by calling amd_disable_sdw_interrupts() first to quiesce the
hardware IRQ source, then cancel_work_sync() for amd_sdw_irq_thread,
then cancel_work_sync() for amd_sdw_work. The existing
cancel_work_sync(amd_sdw_work) is also moved to after
amd_disable_sdw_interrupts() so that any work item queued between the
old cancel position and the interrupt disable cannot escape draining.

synchronize_irq() is deliberately not used before the
cancel_work_sync() calls. Once SoundWire interrupts are masked, no new
IRQ deliveries can occur. An IRQ handler already in flight may still
queue amd_sdw_irq_thread, so cancel_work_sync() is used to drain both
amd_sdw_irq_thread and any amd_sdw_work items it may have scheduled.
This fully quiesces the driver workqueues, making synchronize_irq()
unnecessary.

Fixes: f93b697ed98e ("soundwire: amd: cancel pending slave status handling workqueue during remove sequence")
Reported-by: Lee Jones <lee@kernel.org>
Closes: https://sashiko.dev/#/bug/linux-9890e8dc-4b7d-44d3-bfb0-171dc421e28c
Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/amd_manager.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
index 3a97c12b45e8..b1a0e12819de 100644
--- a/drivers/soundwire/amd_manager.c
+++ b/drivers/soundwire/amd_manager.c
@@ -1266,8 +1266,9 @@ static void amd_sdw_manager_remove(struct platform_device *pdev)
 	int ret;
 
 	pm_runtime_disable(&pdev->dev);
-	cancel_work_sync(&amd_manager->amd_sdw_work);
 	amd_disable_sdw_interrupts(amd_manager);
+	cancel_work_sync(&amd_manager->amd_sdw_irq_thread);
+	cancel_work_sync(&amd_manager->amd_sdw_work);
 	sdw_bus_master_delete(&amd_manager->bus);
 	ret = amd_disable_sdw_manager(amd_manager);
 	if (ret)
-- 
2.53.0

