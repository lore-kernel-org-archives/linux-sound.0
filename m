Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011019.outbound.protection.outlook.com [40.107.208.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA1131E2614;
	Thu, 20 Nov 2025 10:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763633966; cv=fail; b=AhXdEkoUjJnvYEi9kWWcnyB7snDACWngOLCaK/bXCBrwklVErGoN93C1pDk9MigqOTABRGJ3PgYZtIWD/148U8XNoctxH7cv7MEVQcEFomnyOD86Cne7gRSJr6JkuWRGVmN1hfZJBYzGBxtZa7G6v7CZPG4PJMqkggKqsb1drTk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763633966; c=relaxed/simple;
	bh=s61OrCpgTDIHhzVqONBpD6CUriJ2EGIlAdWRIw+HrCo=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ej+LUVj5pwzNoQGFd82RlSbi+qqHfLtbMIXhMIZZgGoZ9eHPott6ondMMK2hukga8+28Qx53/W5ICMCdgff/n2j3aY7tSw3iVXo2HrAxmhuMBUdglIq5f7OsM+gK6x+be1885jWsowZcrM5rBrwkUKiv4Zpjq7/+Ab/k3YtbElQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=P4aFKJCT; arc=fail smtp.client-ip=40.107.208.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="P4aFKJCT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wF8IMC1OP3YAvkwaeDGUtj/Ol+To6PcoCicRqWD2SNoePLUkOkTpnHeYvqIP17fSl3Utfj+kyYlGuPhyikMZuXgjt9qpaYg+UaAroLNHz19J5CnGYM1zbO+MgyUZb86AYiXgvxPxUTaM+40/lMpWtnQL7/yMle+aB5guV8d/et429QHxWZvNQZXDY7bioU/qwS+mArtpjY43mcyG2i9+2ivNAnxj7OPveQPeQZbcW38UhFiB22OcL6LuR1h2wJQScMUhSCJsa3Mi3QWlBD6Y2rfiUATqqQFEMiTBgj7P/VOfIkI8PvzjbuO/NL6D5zJ5lELEbAJcRFJEUaoAAA/e2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c4iTQsteOWJ4Y1Oxi7p48kS3ehR2Aq+SPAnIBGvBFyI=;
 b=yQ88pjeAhUMWvyo66/TMItx30MfzaubFA6GCjp/dzzDecZS89gECS3gfvN3jdSuAIJJVIwbYO0ECGyZLGAlta39LGX7fbqByf1XcEXOKNrhXY9aKjZ1WhxE43YZSOVbgqQsXyBd+v/6vUjiiJK7gIY1ClEuj3VWSwlYcBL0EmuGK49YecE/T2/5x4fzflPbFcLKcbg/CF3a5ExBPpyeyTBVm320+AsksFMmbTCrzpR3WOJa+LZlwVqxfE4D8Ivp5Aud8eLoHLaR1Ywcd6s7K/Htq3qKBS9Mz+sxF9Q12op3z/VkakTYJyf1XfwRkLKPm6eUanGoYSGFhg+NbWqIjfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c4iTQsteOWJ4Y1Oxi7p48kS3ehR2Aq+SPAnIBGvBFyI=;
 b=P4aFKJCTPpsF0DWlHSBR2jEYlDux2AOVaJHxCR+j5LNYiy2b4tHUh7WhxLIp12oEPs1G3rOb67QDbEog/iO2zUiJHTnh93siykHqAUPwQXlqOPviboPmwCHGiS/Ez2eU9hYHfPPtqiWJs95wT9VzypHb4oWGuZR6I/Xt8niPSJ8=
Received: from MN2PR12CA0035.namprd12.prod.outlook.com (2603:10b6:208:a8::48)
 by SN7PR10MB6331.namprd10.prod.outlook.com (2603:10b6:806:271::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Thu, 20 Nov
 2025 10:19:20 +0000
Received: from BN3PEPF0000B077.namprd04.prod.outlook.com
 (2603:10b6:208:a8:cafe::af) by MN2PR12CA0035.outlook.office365.com
 (2603:10b6:208:a8::48) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.10 via Frontend Transport; Thu,
 20 Nov 2025 10:19:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN3PEPF0000B077.mail.protection.outlook.com (10.167.243.122) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Thu, 20 Nov 2025 10:19:18 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 20 Nov
 2025 04:19:14 -0600
Received: from DFLE210.ent.ti.com (10.64.6.68) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 20 Nov
 2025 04:19:14 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 20 Nov 2025 04:19:14 -0600
Received: from lelvem-mr05.itg.ti.com ([10.250.165.138])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AKAJALE3501729;
	Thu, 20 Nov 2025 04:19:11 -0600
From: Baojun Xu <baojun.xu@ti.com>
To: <jwboyer@kernel.org>
CC: <shenghao-ding@ti.com>, <linux-firmware@kernel.org>,
	<13916275206@139.com>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Baojun Xu <baojun.xu@ti.com>
Subject: [PATCH v1] ASoC: tas2781: Add more symbol links on SPI devices
Date: Thu, 20 Nov 2025 18:18:46 +0800
Message-ID: <20251120101847.41294-1-baojun.xu@ti.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B077:EE_|SN7PR10MB6331:EE_
X-MS-Office365-Filtering-Correlation-Id: 566435f2-b18c-45ef-47e0-08de281e43ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6kPMAtRy7jBwuQwyUGBEDiP8CyY14q8EXsAgrPHs6X0IzfrSmMMaAdPYJ6vw?=
 =?us-ascii?Q?gpC7r+EDo2ZQQKmhbVO7kb0AkO+6uNvgyeavue7EH7P2OXNrb04X1BVWVtIt?=
 =?us-ascii?Q?PbO8HNsQmxO7Bb8tUPoKhWyVO9gvj+GMQbFMm6SoekOa4cGufh40z1Kg4jq0?=
 =?us-ascii?Q?5OLcLqJjBbit808ygGyivGi4TFJEoOvcwgpcJQn5uG+YjPz38dIy7q96K+pH?=
 =?us-ascii?Q?eViQmjRa1+X9QrWyy8TRlEUlN5RP90lo8jHMEj4tmaiFGJ3VUoPZdhpLNn13?=
 =?us-ascii?Q?/h8UiJIpZKfHebMWkH6E1Uiz214j7soo6HsZsONQCY4+6pk+9jodMOV87Y1D?=
 =?us-ascii?Q?EeZFE7PP+f+/qKIW05fzpAUK6j2WvU/Ld9HHwYLpmHCgPh/5p1JLRFyxOLej?=
 =?us-ascii?Q?jgLmMpJ+gQc4j+4neTs3RoJ3p2Z+fPTxNXNKyiQoviNTD+cnz7+uHCIwWM6/?=
 =?us-ascii?Q?2YQ416LXavhCs4V9Km7onhVIa5uTIdSFNpbhDlmxcTKE9M+As7QxxVWBlDfS?=
 =?us-ascii?Q?imgMvZzOKNCxpXHdUsTOjtrSo0VZj1bQOzbDjPMTDMfUmx9gkmHBoytrq6hy?=
 =?us-ascii?Q?+YS73ZHVXoWUHZCMaGCEJMIJzv5VHweTSLwVMpsUBNH56ILL+UzxF/ReqZy2?=
 =?us-ascii?Q?27W7hmlj2srwDOY7V5lpBBvysv3rThUwWMEvR+IiWyDZrdficpscVXUxU6zx?=
 =?us-ascii?Q?hSxChTIq3k/GEp35Ql+vwzjKDi8lDS42JxoT5S/4wRSy3cW584D2TC7edeY6?=
 =?us-ascii?Q?Mhq/PzMCcprnW1SVtqRcKGd7Vx3CkjdmxDqxECbOHr2vYzt0S8JnQ3h96pqO?=
 =?us-ascii?Q?S9XzfBEX9fDhMHKBHMgXgV79nuyKBvP1TXFQDR9HqZdkqJFWExRyxmjVQC/4?=
 =?us-ascii?Q?4iPJnu5kXbGTnheYBcej5+Buejih3BD2FOuIBfpluszvRcQTzA1skfJtSl7x?=
 =?us-ascii?Q?IZfit/v4jCRh3xyy3E9zIpTmAJk4eLz3kZv912RA/OVsV8J5yafK19rtLUga?=
 =?us-ascii?Q?FL9CaDN8dgi6B557twYSop1QspPJg3U769F237l0W1gXHk561saqXpbFlq7h?=
 =?us-ascii?Q?wcF9c/Z1KpoBNOQwasXxEqLrCwNHu5eptOOo9hYunFBZ3dgqBShzE2eGOOgb?=
 =?us-ascii?Q?ZAn//iuJuRYxHawO7PQkSgusJ9j7pwZtAUqpOqrlmdWLMdp19UueUiuGBRHR?=
 =?us-ascii?Q?CHutBxe0zYifKzU9glxfIxnyetslvTYlFLE53qASsBWIThMuKS5dBWgb4G1d?=
 =?us-ascii?Q?sDyGERKGATW0IRAl1rApzA0PqoUcheDf52huv/ifJmcC/QRu3Dpu+EgmRlO2?=
 =?us-ascii?Q?E6zLsGkCo9/pEABPKupYkbgzFl+LI1sRW3qc8H3ypcfvKuSYdwxQ8YmLhym+?=
 =?us-ascii?Q?Z2SKPDx+XTsxh1KGVW/3w54YRythVPzxySfqk2fz9wk2PDvpThkvjuINdZDz?=
 =?us-ascii?Q?4Cu0eQxLqo5URzDhXhqHwSnn4+nP/VKvwmBcZKFydqFFHnmf8AKdBFz/eErX?=
 =?us-ascii?Q?nlqFcPx6J0vATOAvOFRFRE54MJP8gUgBQP/Fwo3mMKLTLQl44vJGPET5/UZI?=
 =?us-ascii?Q?U0e1aiGz1dclYlqzIQI=3D?=
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:ro;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 10:19:18.1650
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 566435f2-b18c-45ef-47e0-08de281e43ad
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B077.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB6331

Add more symbol links for compatible with the source code.

Signed-off-by: Baojun Xu <baojun.xu@ti.com>
---
 WHENCE | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/WHENCE b/WHENCE
index 64f55dec..02e6d357 100644
--- a/WHENCE
+++ b/WHENCE
@@ -8825,18 +8825,34 @@ Link: TAS2XXX8DE8.bin -> ti/audio/tas2781/TAS2XXX8DE8.bin
 Link: TAS2XXX8DE9.bin -> ti/audio/tas2781/TAS2XXX8DE9.bin
 Link: TAS2XXX8DE80.bin -> ti/audio/tas2781/TAS2XXX8DE8.bin
 Link: TAS2XXX8DE81.bin -> ti/audio/tas2781/TAS2XXX8DE8.bin
+Link: TAS2XXX8DE8-0.bin -> ti/audio/tas2781/TAS2XXX8DE8.bin
+Link: TAS2XXX8DE8-1.bin -> ti/audio/tas2781/TAS2XXX8DE8.bin
 Link: TAS2XXX8DE90.bin -> ti/audio/tas2781/TAS2XXX8DE9.bin
 Link: TAS2XXX8DE91.bin -> ti/audio/tas2781/TAS2XXX8DE9.bin
+Link: TAS2XXX8DE9-0.bin -> ti/audio/tas2781/TAS2XXX8DE9.bin
+Link: TAS2XXX8DE9-1.bin -> ti/audio/tas2781/TAS2XXX8DE9.bin
 Link: TAS2XXX8E17.bin -> ti/audio/tas2781/TAS2XXX8E17.bin
 Link: TAS2XXX8E19.bin -> ti/audio/tas2781/TAS2XXX8E19.bin
 Link: TAS2XXX8E1C.bin -> ti/audio/tas2781/TAS2XXX8E1C.bin
 Link: TAS2XXX8E8A.bin -> ti/audio/tas2781/TAS2XXX8E8A.bin
 Link: TAS2XXX8ED5.bin -> ti/audio/tas2781/TAS2XXX8ED5.bin
+Link: TAS2XXX8ED5-0.bin -> ti/audio/tas2781/TAS2XXX8ED5.bin
+Link: TAS2XXX8ED5-1.bin -> ti/audio/tas2781/TAS2XXX8ED5.bin
 Link: TAS2XXX8ED6.bin -> ti/audio/tas2781/TAS2XXX8ED6.bin
+Link: TAS2XXX8ED6-0.bin -> ti/audio/tas2781/TAS2XXX8ED6.bin
+Link: TAS2XXX8ED6-1.bin -> ti/audio/tas2781/TAS2XXX8ED6.bin
 Link: TAS2XXX8ED7.bin -> ti/audio/tas2781/TAS2XXX8ED7.bin
+Link: TAS2XXX8ED7-0.bin -> ti/audio/tas2781/TAS2XXX8ED7.bin
+Link: TAS2XXX8ED7-1.bin -> ti/audio/tas2781/TAS2XXX8ED7.bin
 Link: TAS2XXX8ED8.bin -> ti/audio/tas2781/TAS2XXX8ED8.bin
+Link: TAS2XXX8ED8-0.bin -> ti/audio/tas2781/TAS2XXX8ED8.bin
+Link: TAS2XXX8ED8-1.bin -> ti/audio/tas2781/TAS2XXX8ED8.bin
 Link: TAS2XXX8ED9.bin -> ti/audio/tas2781/TAS2XXX8ED9.bin
+Link: TAS2XXX8ED9-0.bin -> ti/audio/tas2781/TAS2XXX8ED9.bin
+Link: TAS2XXX8ED9-1.bin -> ti/audio/tas2781/TAS2XXX8ED9.bin
 Link: TAS2XXX8EDA.bin -> ti/audio/tas2781/TAS2XXX8EDA.bin
+Link: TAS2XXX8EDA-0.bin -> ti/audio/tas2781/TAS2XXX8EDA.bin
+Link: TAS2XXX8EDA-1.bin -> ti/audio/tas2781/TAS2XXX8EDA.bin
 Link: TAS2XXX8F40.bin -> ti/audio/tas2781/TAS2XXX8F40.bin
 Link: TAS2XXX8F41.bin -> ti/audio/tas2781/TAS2XXX8F41.bin
 Link: TAS2XXX8F42.bin -> ti/audio/tas2781/TAS2XXX8F42.bin
-- 
2.43.0

