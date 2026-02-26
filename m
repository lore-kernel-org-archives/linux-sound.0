Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazhn15010019.outbound.protection.outlook.com [52.102.133.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A203738F22F;
	Thu, 26 Feb 2026 07:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.102.133.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772092714; cv=fail; b=ABUe9buyIXNWXIh2sb+N9zAvulrEKfujVmktLllnko+kuiryekJHBmwjf/RerEbe29DWsYCyAWDEXg+B2djQ+09iYBcv14HmelcYd5eCJsxWVH9rKF8DGAbC59BsriV5Nbsdig1UPzbZhQBv3Xxv7RcayaDzKn+DXEulKD8imMU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772092714; c=relaxed/simple;
	bh=vzTIwqt94K0Yid2F1Y0AK+caYiMkX2XgOX48GzLJOas=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=S77AYqqpYmxfQaVlXWNzAj727lBA/SQj7GqHGZrRfPRODgCyuR9vjUj9QScTzcs1GAoAHOMhzIeHufeC0pxrQ5rYdWS7MFxCqYVUYNj6yQsMn2MwDa1WrNnS+X5Gs5c12602FyA3sdA+x/DPFh2XWmtrGjwYeLPUD4cABNcppto=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=Kb00A/Xp; arc=fail smtp.client-ip=52.102.133.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Kb00A/Xp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WGAzYur2BEHE7kyPR8Sh8v0M7z5/b8QXDAT1w3Ljn87o3DE5OA7IUt/RYmS8/YvG5l0v2JVFwkUKB+XNf/Etp5gf5xT4N7u0v25w/Z9IxrVxB0RLlzrcM2nNJ8g97nD2mYSrRr3PKaLLRZRA+6kpi1qNJ2wPlc7t2n9R9HvIYFjoPjjISQlak1kPqq9P/S0FqL/VWTtv/efoc7fhpXyPKG2VJO8l/hZ9CAtLqdsBiLMCa4J33hwDviY0r2ANfvpxkWwxNPMX8mX3tkXWLFVqBjC+eugyNZD1SsvFA9XStvjegOq02GMoU9xeGkivR5E2cKVjRX/NTsXAqevd5zROBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UAHp0dcweFxFAdZWOLX6kBP1uh594Yxg4pw9mR4EXY0=;
 b=Cl+UWwCgGFUAAD4UqqfU5hvKBn1XDRYBeZWkhQPYm0ysl1DFSfK255GeLVjqUIDJOachDJtdEWYMJkGaYyhBWnE/sNoIXx0W0HSfh6Qbw8Mt0nNqRHjNzGCb3KSiDbWR+7ZalQbnUbMhZd4W6rz1JB7mnuVzyb9R9WBAzRIteNzi8IGj5VUddhBhM6HcCJuuhd6itscHF2fW5YWQ3yRrSE0s+Z6WtziySOym+jJffTUBWBsIJfsKZ9aSc3V4c7HNJsZVSainqbOhItdG9gtHv4QvI9DPLV8EQRIrmKQQ/VuMB3YzSc7yw5oUW301yJrOMQwDt98JJeT/8H7sLR1VQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=google.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UAHp0dcweFxFAdZWOLX6kBP1uh594Yxg4pw9mR4EXY0=;
 b=Kb00A/XpxdxgL11SNcKLFDttP1c+8xt8wBenPEzsLZoHYddj5BIU+Auco3C0l9kgNGIe6wzcnPYKO0QtgJ6H/uXagpCcj3i4USn5BXL038BYjJ0XHrW/gqS7dw5WgGODz7Wc+vgdwkbTPpJZf+5ocwxAGnTH/H+WgiBmT6yFNZ0=
Received: from SJ0PR03CA0011.namprd03.prod.outlook.com (2603:10b6:a03:33a::16)
 by IA3PR10MB8683.namprd10.prod.outlook.com (2603:10b6:208:572::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Thu, 26 Feb
 2026 07:58:30 +0000
Received: from MWH0EPF000A672F.namprd04.prod.outlook.com
 (2603:10b6:a03:33a:cafe::c4) by SJ0PR03CA0011.outlook.office365.com
 (2603:10b6:a03:33a::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.22 via Frontend Transport; Thu,
 26 Feb 2026 07:58:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 MWH0EPF000A672F.mail.protection.outlook.com (10.167.249.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Thu, 26 Feb 2026 07:58:27 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 26 Feb
 2026 01:58:21 -0600
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 26 Feb
 2026 01:58:21 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 26 Feb 2026 01:58:21 -0600
Received: from lelvem-mr05.itg.ti.com ([10.250.165.138])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61Q7w5L11501104;
	Thu, 26 Feb 2026 01:58:14 -0600
From: Baojun Xu <baojun.xu@ti.com>
To: <broonie@kernel.org>, <tiwai@suse.de>
CC: <andriy.shevchenko@linux.intel.com>, <13916275206@139.com>,
	<shenghao-ding@ti.com>, <baojun.xu@ti.com>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <lgirdwood@gmail.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <devicetree@vger.kernel.org>,
	<k-yi@ti.com>, <henry.lo@ti.com>, <robinchen@ti.com>, <will-wang@ti.com>,
	<jim.shil@goertek.com>, <toastcheng@google.com>, <chinkaiting@google.com>
Subject: [PATCH v1 2/2] ASoC: tas2781: Add tas5832 support
Date: Thu, 26 Feb 2026 15:57:37 +0800
Message-ID: <20260226075737.405-2-baojun.xu@ti.com>
X-Mailer: git-send-email 2.43.0.windows.1
In-Reply-To: <20260226075737.405-1-baojun.xu@ti.com>
References: <20260226075737.405-1-baojun.xu@ti.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000A672F:EE_|IA3PR10MB8683:EE_
X-MS-Office365-Filtering-Correlation-Id: 78fc2d7f-74fe-4049-e167-08de750cd316
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|34020700016|36860700013|82310400026|1800799024|12100799066;
X-Microsoft-Antispam-Message-Info:
	orUgmHZNjj4tCYXBkP/uC5I775W9HOAH6Eu5kvkNpP1tSdUge6i7aD/A/bA8xnrt1toxSnflSOHY8ZEV5AwiP0ZooPOeyHhswUVfXGYLXq6XflIX2l3FX0kaNt0B5EZdhJZA9pMkm6xd/Ris3yeENETD+hiCxKU0JnYmaPWLdmwA8EkBsnNlleyaJ8x9lwAkBFJIa1MDVByeuVZhnKdtOsYt86Z8d1zphAbtJbAQRsdel3gu5NVnLtm/VZhoNNus11dd1/hx0CTDZGwJ4FzGMwsksCq80ppubbAiuhRkOtBzJbJ77YsOMKgpwY5hRhC3rdVZUqeoKhEXOxn//9i5CHCu+aoqM4ZOwuEw71YA18bNiubWFNzEC1c3f9gbVhIwTywzB7JN0HahZAB5KdXseLgkPkqLNralEJe+sSeOcqUYX2EzhajV58Z0f4RbxCFshR7j4XQx3tKsbLI8lwE6ZMtL/AfTKojcShluvbzgNX1iJeFTO7uaMKt5vCUHVZciHaVbR9AzSXrN+r/fx5tZv3s+TIHAKJUJCoiBC8Ul2un2Kk3RB3dnN7g2aRl5iHzJWOhgfpU42pLOor1Y5EYqU6usuv/oj3cor1U3ObYOdYAi7Uc4xU2K5bvVnjQSuf1zgU0oAcGWT5wGSA4EIRr7Ug1lNz4CTr2VnWlyJ5ibIFMLvMCG+WCrdF8BpXscc9+EqwDzVJpl2Tg+PBPf5m5u+zJjA1yCqkELEiswrsgECkj6mMe1ENxblUkuLBSuoA3TJpeGqE7NlHZ6axFxxcKdH1NI5jId5dIuPwAt3FlXuqLxKMprGGBukU0+YrD+MtnyUg/pLUBk5qJ0G5zCDXxQow==
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(7416014)(376014)(34020700016)(36860700013)(82310400026)(1800799024)(12100799066);DIR:OUT;SFP:1501;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	OCi2OioHmSjS51UOIJr1w6VxGN1NXg5QJuLapQpet6M6FLkvTzgYLyC2hraTYE8AQpiXpbW0ulaivQKwVvDNbTFW8iFHPSimMOWvSUDwB219OB7iMSA5ubn6H6p4XDMHHhT7kLQyxFR76DcQKj6c4Z5NmPD1YdgZkz7Wo6Jr5YxzsT+b4qgtmfnjUbqziK5V1ipNSzZqvzk7LehbxH/lICxCrkwBhHoCZTHtAaGx4UJ65F4viO3sLz4TYu2pAhj4U5kcgTWM0HXSLUQlRWPiChMOyEc1G2qx9UNLasrOQiu/ysMwAEiVqtQyhQOaylG6dLcaNQwWFevKl/304gNO7Vl65C4ys8MrZd95bwOsnoXFh2EHxmSpZq9AzlK9sa8M5MQ/rbzVzXsxgZZgWahQsy7mEGoT54nfUqmpyW+y01+DCihh5yNPIxRq8EF27hr6
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 07:58:27.3414
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 78fc2d7f-74fe-4049-e167-08de750cd316
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000A672F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8683

TAS5832 is in same family with TAS5827/28/30.

Signed-off-by: Baojun Xu <baojun.xu@ti.com>
---
 include/sound/tas2781.h        | 1 +
 sound/soc/codecs/tas2781-i2c.c | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/include/sound/tas2781.h b/include/sound/tas2781.h
index 7c03bdc951bb..c9152a950483 100644
--- a/include/sound/tas2781.h
+++ b/include/sound/tas2781.h
@@ -131,6 +131,7 @@ enum audio_device {
 	TAS5827,
 	TAS5828,
 	TAS5830,
+	TAS5832,
 	TAS_OTHERS,
 };
 
diff --git a/sound/soc/codecs/tas2781-i2c.c b/sound/soc/codecs/tas2781-i2c.c
index 41b89fcc69c3..9228b3b6383b 100644
--- a/sound/soc/codecs/tas2781-i2c.c
+++ b/sound/soc/codecs/tas2781-i2c.c
@@ -119,6 +119,7 @@ static const struct i2c_device_id tasdevice_id[] = {
 	{ "tas5827", TAS5827 },
 	{ "tas5828", TAS5828 },
 	{ "tas5830", TAS5830 },
+	{ "tas5832", TAS5832 },
 	{}
 };
 MODULE_DEVICE_TABLE(i2c, tasdevice_id);
@@ -144,6 +145,7 @@ static const struct of_device_id tasdevice_of_match[] = {
 	{ .compatible = "ti,tas5827" },
 	{ .compatible = "ti,tas5828" },
 	{ .compatible = "ti,tas5830" },
+	{ .compatible = "ti,tas5832" },
 	{},
 };
 MODULE_DEVICE_TABLE(of, tasdevice_of_match);
@@ -1747,6 +1749,7 @@ static void tasdevice_fw_ready(const struct firmware *fmw,
 		case TAS5827:
 		case TAS5828:
 		case TAS5830:
+		case TAS5832:
 			/* If DSP FW fail, DSP kcontrol won't be created. */
 			tasdevice_dsp_remove(tas_priv);
 		}
@@ -1918,6 +1921,7 @@ static int tasdevice_codec_probe(struct snd_soc_component *codec)
 	case TAS5827:
 	case TAS5828:
 	case TAS5830:
+	case TAS5832:
 		p = (struct snd_kcontrol_new *)tas5825_snd_controls;
 		size = ARRAY_SIZE(tas5825_snd_controls);
 		break;
@@ -2105,6 +2109,7 @@ static const struct acpi_device_id tasdevice_acpi_match[] = {
 	{ "TXNW5827", TAS5827 },
 	{ "TXNW5828", TAS5828 },
 	{ "TXNW5830", TAS5830 },
+	{ "TXNW5832", TAS5832 },
 	{},
 };
 
-- 
2.25.1

