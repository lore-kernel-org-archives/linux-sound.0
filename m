Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013039.outbound.protection.outlook.com [40.93.201.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0242122D78A;
	Fri, 23 Jan 2026 11:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769166777; cv=fail; b=aWt4TfPnccgJhOvGb0KbF52OkQaE6zn/y/2V3w8Q6CEBDNLK+j3C860wBkhq9fwHVe3rXckLEKCyn1hhqtJjXZNboPmbY5fGJvRWgW9+T6HqcjGENbmq+6dR4I7JsiNy4Wqoz5mQtdJYU4G/BXMx3MIzV3Pem9gSO4fj8Uk6FW0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769166777; c=relaxed/simple;
	bh=6atbsMOpw+ZxLOoBTx41gqHLseE2xvqXIUaH+ASitmc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=fhSIbwTHJ6qJz3EpUsmpcNL2M7fZo22k6UY6CrOy1VznqiiBlqj0R3EkoBhb0LbZkLwgz8Dc5u/0wA7+2KA6ssnrMoSH0ZrHZGC2mct9mTItjP0aE/jMkDQRYQBBXAE9XhqzBtyQBot7JGOkZnnK6nIvR16nxjes7C4HDnC2G2k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=4eoAkCxI; arc=fail smtp.client-ip=40.93.201.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="4eoAkCxI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yd26IetbDJ8V7gfc6vBsoNgJ4E3af8zceePbXd6Mr7JJrWbTNmnDx0Ocfdo3bXmX8KMoXtJ4kBGoXt6ms23udX4xPUP1vJBH8mMNhPH2f/k/hkLyg7bOalXaTuUfwHph5+6psXavAglSMbSu4Fj3wloa10nhf4zhjsHZP0BynE+JMtq2L9T+H0wrlTsYROQpSRXrdDsgBQO1CUk5bcP71xITdBi14GfwCvGY+QZ0H0Ed5OM3U6YtqXjzaID/GqAQ1Xa73G1Glgk5UJ9z/FI5m7kK2OctMwAjeDzqQYfG+Gf9Ri4HgDEfTOh588FZwvYYUptI4klX5g/9AVx9rribOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KP9qZIKR5zdDHaRiEeY0MorT5k1Yf51z7fOOOCS1SoY=;
 b=F9yeRGJ/EH3S+5OAZbQqkUxwm1GF1ISpF1DIz6UDoKol3bq/rs6WTiuBUFqKmqddZTyY+hszC2Fq6YXtBL6mlYb0akyUaGbRxYKgBhXCG8kR/MYh1y+i95y+Qf+l5m5mWFutttFnXlyI1zOgFrBNeSNMMwup2vZMTCdyXouDFWsM4fdQ4jntIOEDrAx7uMDp5ZHhzoZTV7w0je7/NM1xX8GNMukUWD7UvYXkzpe6n+mUCnyHMCAnDaqRnmyZcqCVXJ/EGq/PzIecOMLYL70GaL+7KzHn0v4DrypxEsuv5WZTf2xJnS9aB+wUQXRTNGKe/1pZ3fizNnrZWhmzTOiDxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KP9qZIKR5zdDHaRiEeY0MorT5k1Yf51z7fOOOCS1SoY=;
 b=4eoAkCxIdDWDbVXvJ/rFPmyO0CVuIQyjPsoucqCZlYijtXHf2QvCgbKPBztMLtFlhdK3jDxFto8yzeEfUHlOpPzfk36AEwAVTA46b86WC83dSbf792SMz4fuWshJ6PjlGlNjpQfyyfkP/VDq0p7gJqXnN/XGi3WnQgy+xKyqQDk=
Received: from BN0PR03CA0018.namprd03.prod.outlook.com (2603:10b6:408:e6::23)
 by DS0PR12MB6630.namprd12.prod.outlook.com (2603:10b6:8:d2::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 11:12:49 +0000
Received: from BN3PEPF0000B073.namprd04.prod.outlook.com
 (2603:10b6:408:e6:cafe::26) by BN0PR03CA0018.outlook.office365.com
 (2603:10b6:408:e6::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.10 via Frontend Transport; Fri,
 23 Jan 2026 11:12:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF0000B073.mail.protection.outlook.com (10.167.243.118) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Fri, 23 Jan 2026 11:12:48 +0000
Received: from vijendar-linux.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 23 Jan
 2026 05:12:46 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Sunil-kumar.Dommati@amd.com>, <Mario.Limonciello@amd.com>,
	<venkataprasad.potturu@amd.com>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH V3 0/2] soundwire: amd: clock related changes
Date: Fri, 23 Jan 2026 16:41:30 +0530
Message-ID: <20260123111233.3649153-1-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B073:EE_|DS0PR12MB6630:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b9958e8-2e0e-4cda-5036-08de5a7057b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?VJsE5ywY69DPacCvpSq/r2f7X4OgvPHmTlpj26xtviSoT3I2ET60SuZu037K?=
 =?us-ascii?Q?SyL8X+prY4AIMmWoog3p+BNlfdTECaMAuPmjl1tAtpd3Hjlhb4hqrIK6uVqI?=
 =?us-ascii?Q?6fZxdhq/h5crjGv47D7LGy1fJJ/ESwq8H6DhIzzr9q0Jp7U3nUha8QHwQ2wP?=
 =?us-ascii?Q?HszJmdrX48NqyWBp+H3P1oL3+ZXBzhTa7sNWAwemMa9IJ2HvexdJvxMMQ2DV?=
 =?us-ascii?Q?IKVjSViWQUDF5/rR7HT7BHywzBH4i41/OOy5ZWqd5+jn7+IuvBuD5cqqnvXx?=
 =?us-ascii?Q?eTuWXgiNcVk1UHgZq4X3xsuVqbKPAkegfV21h5CR/nX8Zxt4Iuny/ud4ffEX?=
 =?us-ascii?Q?SjCwNRokRfblrGfp3bY34A3wXBR87fhlAmbk4UoT8wsA289aOCFKECKK92Mn?=
 =?us-ascii?Q?24IC/o/GVfXTMFiYwZwi3uvkMMzqwzm9k1rOs9ibIzdg0qIozg3r2PB/cr+h?=
 =?us-ascii?Q?MCLfXUXa1u7XHhYRwnBi5DU2asvUguBYt8UJ9niovgjXBQT8CIjRBJgF+shy?=
 =?us-ascii?Q?pmFZAwoQCjMM/8qESNnfkpbcnAfN250QjkdTTMlNGtr1Pps5y6BUgV8R3G56?=
 =?us-ascii?Q?Y4qGpyuEwN4ZsL3z0Q6sHjSn7w3goF1MV5JvkFav/jNSEnmt4+N9PWqByNeo?=
 =?us-ascii?Q?Dg+0FIedBhwVyyjHpIfOHYmDvIzrh/MX4xUPrn/Bt7QKhZ3+WwvPLbp7zgib?=
 =?us-ascii?Q?MQP8Cxhz/eQua1ucYEMa29HFu4JHHKHXigsH0L6RwRxq7SLEcnbu1F02nrJQ?=
 =?us-ascii?Q?5W44gEg+V3GwmJtp2MxrBLnPsI5sMpiY5IylKz5rAAqt0NMDq0rIndX9zCPQ?=
 =?us-ascii?Q?zBaV/vOnh0g+OoaLJ6PvKmooTnDuTUIqZ9HjK1tRgQ2lWe9gO8UUmPbxUXLi?=
 =?us-ascii?Q?8T1PX8fBfDEn4IzH1GFlfWP2uoPCP3hHX01Q1UGH/IBFB4L998J3Awvwr1ix?=
 =?us-ascii?Q?6tNBVQSElfkKchiTmuUCUy9HcxIzb8BXj4etYKMsSgmKlvSd0vKvuOUpA6G8?=
 =?us-ascii?Q?QmXBuXRA/heIi3+q2swjap5925kEj3ohcp324+YzsGpZQ9WDawuryjZmfyxS?=
 =?us-ascii?Q?slNq+bjhv/v1rJPoePSgGtBGqbT2ET2qYM19fyFWW+Miu1i/uc1SkGC5sycE?=
 =?us-ascii?Q?/5oppiuK85iVlVLu8KiZg7yRfUJRGS1RaMV6gtrA1Zih+4Rv6cjctH4unVJI?=
 =?us-ascii?Q?wKlMHw2WpnVp34R95lfHUA4wdZTTIfeRoseH6+Ok5bMC+8MdU/OjX6ru0CBh?=
 =?us-ascii?Q?M/Wj9IzwXUgytDiYsMdDazcLnM+ULgK9lqZ/HTUchAAkTLsgelW8vQrEk+Br?=
 =?us-ascii?Q?ymtPQ3TGtALkXqZF5quUfrNqlNkVgB9ELAiLJB5uGC0RDi956Quit7ZXVY7+?=
 =?us-ascii?Q?ZuxTuzhcMiDqKt/f/W5L1ENyYk6b6VdMvjLSYG1oHZsve4injuNnk4pObXah?=
 =?us-ascii?Q?gA7F/emiLY5Zqso0Xax8HrmUc5BXSLZmfDqD8PeK1LpyVzQV9DeRAGrNiCRe?=
 =?us-ascii?Q?HsPVVk1yA4ZZlDOh3w9Gc+hlvW17CZ1fbUNiARTg1q/Dm3t3b9v+BDeFDT3I?=
 =?us-ascii?Q?lDzKFOBoiDyJmwFiIbfzfUAXs3JO8A6Atql+AU6kO7sZgKeIsHdyB1iaXvfb?=
 =?us-ascii?Q?wSDZ+UC65u/R707JljC+4E0Kk3l64850yh5AI6yAr+Q3JHFHzF3FYyuAnMo7?=
 =?us-ascii?Q?v0SAjw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 11:12:48.7356
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b9958e8-2e0e-4cda-5036-08de5a7057b9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B073.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6630

Refactor clock init sequence to support different bus clock frequencies
other than 12Mhz. Modify the bandwidth calculation logic to support 12Mhz,
6Mhz with different frame sizes.

Vijendar Mukunda (2):
  soundwire: amd: add clock init control function
  soundwire: amd: refactor bandwidth calculation logic

Changes since v2:
	- Update commit message
	- add comments in the code.
Changes since v1:
	- Update Cover letter title.
	- Fix typo error in commit message.
	- drop unnecessary condition check in compute params callback.

 drivers/soundwire/amd_manager.c   | 113 +++++++++++++++++++++++++++---
 drivers/soundwire/amd_manager.h   |   4 --
 include/linux/soundwire/sdw_amd.h |   4 ++
 3 files changed, 106 insertions(+), 15 deletions(-)

-- 
2.45.2

