Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010046.outbound.protection.outlook.com [52.101.85.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62EC71A3166;
	Sat, 22 Nov 2025 09:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763805592; cv=fail; b=D59tYtPHmH5xirh1PfV4JtB4CLs+hqYkYthdMW7xNC7lKkOi/wNGTxN8sRGdEA1SL0FQN7MO+nd2gyag+MeehNI84J7Z/kdu+rdJuDjhwT7xwezo0zRcm02b1QoqfTl7EbafYfn8MLnW3KK6modkthJ0PAl7OmxFRCZFmcjakL8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763805592; c=relaxed/simple;
	bh=t3rs52AfqpkRFqp7yAdq5q+m/K6itp/5XHeqaX4Nd1o=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=HZK39xLz5BWz/OYhVkF7B591nH2GsAZ8Fu3VQSwOS1Z9vXE+uIYvQhNcXrktO6BezNWkHg6nqidYRB91QmJ+oiU4wJJeDPrxY1SPUHc2cPl4pwZr6gWhmRx44LPtka9oNNSo/8HJgytNODBtt+hqavlO1Nlm0BlULHhy3/KP6yo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=fb756wfB; arc=fail smtp.client-ip=52.101.85.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="fb756wfB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wfxbRY87frTSfxHy99uRMYbeIYM8jiiIbLzXxcyI11hU70nYH9flWHBXpiEetelPY0EOZ5JB5++oRKGwoWOTdzsMRmQu2XZ4JqWTs2YzYsxC5EeOd0ZeQo2FkTJl1l+vVB29BWo+12HkvYgaVdOQ3rTDnucim4NI85gnOoGmOd70xUjzvUCf0ClqjiL8WmhfGGug/DkvTRr7PTOfhuas3hY6+7x1SRuBXamAaP9ZjSPZuhoDtr95+oq5iJRC2H6wSU5KeiVOwumfT2ekH52O+SGZqo30+wIQV/3+PCrVwDEWXTitxT8F/FB7CHtAp5t2mfeoYzLyP23KrQBm7uYiug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lzn05fNcC9cmjPSxam2UWL8l9Sc8Gu/cJVUblGhYUbQ=;
 b=hWQ5oIAVZ/cUiGNwGR5tqjnfTBWWBwRxgavoypPwV/YGb9uKKdzj03hmbIQdPo9KRAGDifq+o/VaYukbTa+6lYsHz8JEHN8lyC5RcNxoAVHPuIkj12tzlWG0e7gkzOn1DUwhOj7y8Sko4D+Ar2gh1dOJUAUhqfOKJiB/pFjPp+Bwsy25K2RXHTwV2bFgvckK5tZfnAlK7dqGgZLd8t5EOyw9F68gErUMXE72Z1eEP4qKvPl2kDgm/UntnahGij3gbi9MOXJi4pIA1StBYheewImDhF3ZYjE78c0ncHEbpbD5T/pQCttMWDG0qPhB3WuE1+QCctwY44atSSwUqqmzEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lzn05fNcC9cmjPSxam2UWL8l9Sc8Gu/cJVUblGhYUbQ=;
 b=fb756wfB6mSr9s2pIjunTT6Tp5ICs7dZekXf3TmD/rF2HOklaQWPGWTR7AvQ12VnuYMVV+MlFsl/vf+XyoaXFf6Wv8BTkWS4AU63BJhdL76fBLvKCJFc8KMD//4lqTC1EpjP+fSQd9En+TnEgJe9uokz23DiQmyT3CF06jyWDVk=
Received: from CH2PR03CA0024.namprd03.prod.outlook.com (2603:10b6:610:59::34)
 by MW5PR10MB5761.namprd10.prod.outlook.com (2603:10b6:303:19a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Sat, 22 Nov
 2025 09:59:45 +0000
Received: from CH1PEPF0000AD7F.namprd04.prod.outlook.com
 (2603:10b6:610:59:cafe::28) by CH2PR03CA0024.outlook.office365.com
 (2603:10b6:610:59::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.14 via Frontend Transport; Sat,
 22 Nov 2025 09:59:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CH1PEPF0000AD7F.mail.protection.outlook.com (10.167.244.88) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.7 via Frontend Transport; Sat, 22 Nov 2025 09:59:43 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sat, 22 Nov
 2025 03:59:33 -0600
Received: from DFLE215.ent.ti.com (10.64.6.73) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sat, 22 Nov
 2025 03:59:33 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Sat, 22 Nov 2025 03:59:33 -0600
Received: from lelvem-mr06.itg.ti.com ([10.250.165.138])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AM9xTW52934710;
	Sat, 22 Nov 2025 03:59:30 -0600
From: Baojun Xu <baojun.xu@ti.com>
To: <tiwai@suse.de>
CC: <broonie@kernel.org>, <andriy.shevchenko@linux.intel.com>,
	<alsa-devel@alsa-project.org>, <shenghao-ding@ti.com>, <13916275206@139.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<baojun.xu@ti.com>
Subject: [PATCH v1] ALSA: hda/tas2781: Ignore irq for I2C device
Date: Sat, 22 Nov 2025 17:59:03 +0800
Message-ID: <20251122095903.2239-1-baojun.xu@ti.com>
X-Mailer: git-send-email 2.43.0.windows.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7F:EE_|MW5PR10MB5761:EE_
X-MS-Office365-Filtering-Correlation-Id: 159890a0-bad3-4f87-e72c-08de29addc22
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Bkzk2Bzxg+1Y5QU6+v3xz3UypcEXzZ6oPh1I8IjmZEDQWGBbliuT7T6Ec/aB?=
 =?us-ascii?Q?tcq4aiihpD3qyhSUbOoYBTh82i4VnjPZhKIgIHVr6ASDHRuLlHaZFlulL6o+?=
 =?us-ascii?Q?0QNosE1FZRRhn2x7MWeim1ZLMwrt96VAoNJYOa93kL6tBEmK4RycnziMyjm4?=
 =?us-ascii?Q?/rB2q95fS2sw9nNTV9QBIc+h0H9N5efX/663MmKiLIqolvN6igtISnSiLhtl?=
 =?us-ascii?Q?L/fkFY292BZKsWBg71b2xn1vTQYhZB5bN25K8cAtDxdb9O4jsvpTNrurHvrR?=
 =?us-ascii?Q?keCkP560Fb7se0dHVh36Rn1NkcpWNqTFkLxGL7t5+hJvNszPMqNyYyqlgPat?=
 =?us-ascii?Q?eOr8sZxucKtKTUbsBtah1+dgfuyrhaAo6KjqBkINIBhU91g+bbz/jMqLDDUp?=
 =?us-ascii?Q?JOOkixeUyGGu5dKpRN5wTPu7KeDR+iVbxvy5GumuLoxdL+5DeCVvtcbqVQXU?=
 =?us-ascii?Q?PNf2MQJPGaRUqCtbn+PuI9tDJc1H9Icql/mNBU/6LLQAVrw1gmgdoLe9LEuf?=
 =?us-ascii?Q?BzuxW1t2278v1UGRT+CgDlyimjq1LGQBJEICKecbYrdeB+PcuYqATXjk0isD?=
 =?us-ascii?Q?cOYqSS4oRyf8B4Huv7t7C2zUEFxgHb+OyezOIAoxZTXe8OcIAXseqfZIpm7x?=
 =?us-ascii?Q?0wOfsEF2pVOwzUU1OjR0ccQ1yFBFfXfz4bhe6G7nKdj5PmkWKmJ8Y97yZB9z?=
 =?us-ascii?Q?jOvmO300S813kxGKipUU7cwGOsgRtJcOrPORMRzcGvhirtwajR3Nx5eZ0/NI?=
 =?us-ascii?Q?r0HMq46ydpxT1bKVunXzsnqUClslnqJKIna9LydnpRq6aGkFzW6wXTv2QSKd?=
 =?us-ascii?Q?LtirlxGdOy7NIRmt7YfZXQ3QqSV4HHIL4aYTOa1NkZAPpu2C29KFqGJssKMk?=
 =?us-ascii?Q?l6iRAnQSMI3sRuqxFczN+uvBKLJXF4F9vXI+PwsjYjIvggB+bcDyHvB41Xgn?=
 =?us-ascii?Q?6qCdMIOKqCM0EKLQZnYKIN/il3o0Hcwf/jpQQ8BuunH00jr4H8YxYjPrRXI0?=
 =?us-ascii?Q?/klq9iH/2HwAAeYTD2h4WrFJF+ngOuXSfXs26mme2G7HkyLWHAPvwctAr7Qu?=
 =?us-ascii?Q?n3cSC5TpxqXpUveR9g/jCe2qROFJSGpTrfipJuLt3YC65b3/cpVkWMAEYKSG?=
 =?us-ascii?Q?PBaOEfMMJaPByC06xEZkD75lYRgC5v3C1yyj0PMHFZkHq/Ei72nF34wdC5Lo?=
 =?us-ascii?Q?MoAj3sZgk0Okxz1koCijjF9BREPB25sjM3JnEMI3H0caSjPO6i0txENZWAiG?=
 =?us-ascii?Q?kUJl8B2eHVRyZT6ipv7dsPeeiULsdne7XlWeFtgaVz2qs/Dv17fEw7qAGbYe?=
 =?us-ascii?Q?3mAvsALK4HU4d8EYrBWX01yI5w2g64rxGpN55hilHXZbKBoH2GAXr8ZqWMm0?=
 =?us-ascii?Q?C+nYzoQ93g6a383WNohRUi58NCUf6rqq9aP8XQuT2DDk8LkLe39ngstVriMI?=
 =?us-ascii?Q?XqXIldFrGFSzKSNF2QU8W/9NPtoiKYynxi1uoOrltlmvoAPXE7JF6RlM7tC/?=
 =?us-ascii?Q?m8H/8j0l0ZxptL3MbXI10NCTCDJi4Z386++WhuD4WxvLp90Fq7qXWDfmVPDw?=
 =?us-ascii?Q?tBd6H+Ht2PZFpg0d8ag=3D?=
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2025 09:59:43.1620
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 159890a0-bad3-4f87-e72c-08de29addc22
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD7F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR10MB5761

In some projects (HP Lampass), no GPIO was assigned for irq,
it would be better to ignore it.

Signed-off-by: Baojun Xu <baojun.xu@ti.com>
---
 drivers/platform/x86/serial-multi-instantiate.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/platform/x86/serial-multi-instantiate.c b/drivers/platform/x86/serial-multi-instantiate.c
index db030b0f176a..86cecf3ed916 100644
--- a/drivers/platform/x86/serial-multi-instantiate.c
+++ b/drivers/platform/x86/serial-multi-instantiate.c
@@ -214,8 +214,6 @@ static int smi_i2c_probe(struct platform_device *pdev, struct smi *smi,
 		board_info.dev_name = name;
 
 		ret = smi_get_irq(pdev, adev, &inst_array[i]);
-		if (ret < 0)
-			goto error;
 		board_info.irq = ret;
 
 		smi->i2c_devs[i] = i2c_acpi_new_device(dev, i, &board_info);
-- 
2.25.1

