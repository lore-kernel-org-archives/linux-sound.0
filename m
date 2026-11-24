Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.85.35
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795510354;
	b=J6iFFo5KG+TtNEXtAfsJ8QfFoZGZAKn6FQp1BoIoUzuXEiQm86RcsmY6qDTBRHJi2V70
	 rtHKvoq9WitQbKd12jE89G5g3yEjPhmQtDShxG6tzfAztIVEC/5PRok1MCJPJgnoa4z/B
	 EJ0ZolG1QyvVg/LVG364DKubxSsfWdJxDeKGTi2rmgMq0fc30t5Hgl7bjgsSycGyWQ5qs
	 ZzRS1pK/cPsfLKQMcOT7IrVxeIPqPsBf2ZX/eclU9xw5ReVMLYXXoV5/GOTHIN0vRnSUD
	 QjHeC8Fe8rdkSCdZ0SXzJdeUsTVCyUQfGeAhiy1ECndqB96plwuK46efu99t1huQi5A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795510354;
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
	bh=Qss38gpUnIXCvJyjifrG+UCoHE4SVMGMh4IdOuoQyY4=;
	b=e5XKmD/Y4xR7e3f9Cp0e9sR+5/4tsC5lzmKJQdsA8jJlqau/uobfuiW1+5A9BLv2uaw2
	 63HMCawSEFp8GenhmjAFEj4IqauyO/RkXM3Up1PXJFQwZb34G/uzQlRXf4tJIzMAW2+0S
	 QRbWRdWbdNmFUqVWoMQ+w0w7UU8yaNMKEMWlre7vfa5sl0qzYMjz+qZfTOi7lWpARIqOW
	 BJW7i/GegMDV9OzgqKn/kkQ6kFtqS1B4SLw7jgXrP2LbQOq/VWPsL5jOoxdmcZKowyRJf
	 5kcwJR9PYIDuHo+ZCGeXSEn1OhgyTrq/P73dr9sPW6/o0J95dlpmyJPHGmt/Xyy0LMw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=WWJntemM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.85.35
Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010035.outbound.protection.outlook.com [52.101.85.35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 164DC606A32E;
	Tue, 24 Nov 2026 08:52:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 164DC606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=WWJntemM
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ey7YSUGiB91mizv0hu9djWSPT1m4+vQRmwhVu0BkgoLVSdqscPbjvCUhlv6r57j73wAkttnrfk6vgy9ZIHNfZRkYuWEDjdrLu6BCZacB+Jiif8vF0i142cq2wkVB6NfOGxGUeCZy86bIZDFCxibdtu00VScQcLyW3McGOMnP+CqWDrix1U9EPDP25cwA15b6NbLxHYMEh7sRyM0MuDpU3/XesAFu87Kpz4wrI9y198XEZexUFBtDEZbcyf4zf+QoVLX3AhRHWTR95rBZ90LZ7m/k84Itw0RdywQu2r57Au6yob1aBviVg0JB+tD3iSt8WTuqoqNHPRzc3MjID3aIiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qss38gpUnIXCvJyjifrG+UCoHE4SVMGMh4IdOuoQyY4=;
 b=iiyXSSBP6unBbTrs8U5Q3R5aiTCbCbfhgarQnn9N/AvmVXaOWcvROOLTCT4/W6JVnArtn4Qzrl+E3jX0cy+3gVPgiNSVYfZFWOrklr/QT3k6B8H1aSBl3ckeTyYcbgpfFqElbHrvtRxY4xKkcoftB20L9blqFbBbUzhAzId/q2diwvkg/TUtzPWUh+UvfoIav1NRVtHyC0dLSn6+vBNrtCE10EWzxs/rxKYhPM3YcDqmH7G6b3Bwu1J1o0gUfO6UkYRHYpxy2zzcjGV1/E3lEjcpVlFulmW7e3yVOmD+RmMWZQJOW/rEDSlv+uk1LOIRMkbdc3LUouGQRUGduajDug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qss38gpUnIXCvJyjifrG+UCoHE4SVMGMh4IdOuoQyY4=;
 b=WWJntemM/rK8sQ8pfYYtHx97TYpJMAnrx/KWKNAJGDlvjgr7Lp4wsIpbR4B+ZDKWkknUPf8Ibm3Z4u1NY8CGkig1XQhJ/vj7Nm7W4u2fKHkNoBJ/qeA/PitIQ+U77y8phQdM9SqZux72AFInRlcH3gyEPhUBxLdbheguhPgK45A=
Received: from PH8PR07CA0037.namprd07.prod.outlook.com (2603:10b6:510:2cf::17)
 by LV0PR12MB720236.namprd12.prod.outlook.com (2603:10b6:408:3e0::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Tue, 24 Nov
 2026 08:52:31 +0000
Received: from SJ5PEPF00000205.namprd05.prod.outlook.com
 (2603:10b6:510:2cf:cafe::8) by PH8PR07CA0037.outlook.office365.com
 (2603:10b6:510:2cf::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.6 via Frontend Transport; Tue, 24
 Nov 2026 08:52:31 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF00000205.mail.protection.outlook.com (10.167.244.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Tue, 24 Nov 2026 08:52:30 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 24 Nov
 2026 02:52:28 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 24 Nov
 2026 02:52:27 -0600
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.57
 via Frontend Transport; Tue, 24 Nov 2026 02:52:24 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>, <Poojitha.N@amd.com>,
	<lee@kernel.org>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH v9 12/24] soundwire: amd: fix work drain ordering in remove path
Date: Tue, 24 Nov 2026 14:18:18 +0530
Message-ID: <20261124085033.682755-13-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000205:EE_|LV0PR12MB720236:EE_
X-MS-Office365-Filtering-Correlation-Id: 78830875-5aae-455a-9f76-08df4a08465a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|23010399003|36860700016|22082099003|18002099003|13003099007|56012099006|11063799006|261102123227099003|261028144727099003|261021123027099003|261022075727099003|261009223027099003|261021121427099003|261022105027099003|261026140227099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	bh3DbYQkvPf2Co2wCe11srriRRGko0/Rf03GA7znz/3XoDaPl6Uex4kVAVRqNWbZ+BqSI+36ulUyETV1J9Fa7HPSk2wbAbg6/vV4ms3w9d5Uzn+/wUlGi4adtnZKEBUVsHRs0MRW/0h0M6k6cVA+EzXd9ZcWwVLqoF5GFJnQLEAFIJZPF3e1LUe6njVDQtQwY1yvtfwf+YjEanf7ZNU022dqKP9645IuD1POIBHyp61+O0Q6V6Z9YYMeLyBKgfHwFYnt6WqDI2g9V1A3iOadRu75z8gw346ZFSOza/5+oO0rn6Kzb1a8lPVo3b66zJaqnlV/DXR3/430XbcQAcB7qJoNlAZ+rCLEWUbbnusITQVQkHr/uLQAowq9sPYUEtWRbOioX/AT1Tzl3+EFBYXu6jR6NEIQtFEDxpLk4iJn/JEUWqqSbjm+tTKnUkxbx0+PvnD5N2sP2Q+wONoZhVp/hUzF/cWDEMtqxapZ7v20yiaVJJGRB1LpmMxd4lR0PF4QFMd5jAqe4OZofC5ufMbP5JTHAXzrpMxlGJpU9R0/qYomZqlMAMUTaHr4MyeiXivcLH1TORPnCE4THXXZcgrd9t16FMwtw7WZ8XNcmMeUt3pzZmhi5+9VxB0MoiZEizBzCxAzsoqb1nVRfp8TOhZxbw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(23010399003)(36860700016)(22082099003)(18002099003)(13003099007)(56012099006)(11063799006)(261102123227099003)(261028144727099003)(261021123027099003)(261022075727099003)(261009223027099003)(261021121427099003)(261022105027099003)(261026140227099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	NHlmbDneFq1EYXipg5/l2IEQSSNO4GYxbND5AIEnuT/t0GoCTNvRpQZLC6FMJ+PeTbhW9q4TWepy4MnddwKrQanK4iOtLCAgVlRPEmlCpHyLPWT1SMBtXlX0F1HVfmjmzu/gx2NHjSsD08cNLcO2ldebrGY03LNy8kCXLJdCQH/E08VeuxrIK5NZFWMdBgHNk4H9bwWZlqKhb///WqWpPSri3QmXhuaEyKH02qFkutQHp16HJxohOdROfJZ3ko6z//2zw9KJ11UxzSzzIwPN6AantV7CYIP7SlIc7w9H6yM2e+ik6g85uLHHEtp9rT8zRqXKkoBDYI99V2lujJlTRhetWeQC1xBYMBCvLB1HfONb4IRRVuAL+q2tu64CeHfvXUc5VuZ0SWrf2SYBibAo1b0s9qU3OEOzvPbgZrE0q3F86jTBVggyAVl1jIvjeaFI
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 08:52:30.9163
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 78830875-5aae-455a-9f76-08df4a08465a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF00000205.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR12MB720236

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

