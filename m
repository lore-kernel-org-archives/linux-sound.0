Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010022.outbound.protection.outlook.com [52.101.56.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE52133556E;
	Thu, 19 Mar 2026 09:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773911303; cv=fail; b=MIyKOIWT3Xnj8TCGdwsk/OQyaAY2JL7DrglmwIN/cXh53T4Fd3oU3AWVpvkCpSSAISXLpvWacoNIYYteqmpm3xnSIm4qvB+2IOq3SC7h8XmpJjN6b7IZyoywsDujHAFQ2PwrYKmjqgu62kp/6Fa5gtZBPSoCjww4SppE6p+YzxI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773911303; c=relaxed/simple;
	bh=AwxRSHEnQ1XiD+X79p3ku9g0fxS27pmKhODIISjeLbQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=RuT5Z+5Hp9cgPUa/a7+XjrTjzCpsSu2wcRsx7gFtvOwuChXLDCVJ8uG7J3Gn38Skbo34WYYVWD4Kt+4lSxqEKo8eneX1BRwC55cOAem+ywqAwH2clbet7GeBA+OD2CNS7R7fOVHxrRfdEXnKu4/4+U12jdqWTJr/my9w+QM+2Qo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=CitgYE0k; arc=fail smtp.client-ip=52.101.56.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="CitgYE0k"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V2wRq+lItoXgt2ZE3eUK2X9S/baRv3DnOnZtY9SBlOjzVfWQD1KOkjpmRI06rNFAgY9usDRqQ8esjz4fGTGWQ3NI335r3AkD3FjU8a1WiWtBsc48xuHOj94inKTuIzgkOsM23a/9s06hDfI3hKmjp8htE9G+qrq8tlDg1uYYwdheCo12dTA9TM5e1AgD/MXXGDuqDIgnh9BY83nc2E3GcnoOdei213c9GuhL3VVQc3ISeYF+rJnLp+gOWjKjn1sfErRK9AOs6inJSDjiFEbKSAQh/Tdh06KWacPWHpmTflWFSyrfLX47ulUrxzIzi81VeRsfRXdji4WrRu6ccj8NLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gD3meonvhOQIxaF9D2Hwe2UDRmQUFbvGWLJLp0u8lg0=;
 b=tQpApuUUX//GzhjbiJvO3vGdBYb6+iWCutJ4A8Wk70VD8IWToTA+QfEaNH9WimnP5mMy6SXrUWz8dAV3H4jTrd8nwuCsSg+wKgoNInI8wplemW19oV8h+LR8KbS+CWfMShUMJEVRPvlvdGFFT1RD1hH2069S48IRaOlVLNEwOCe36TrDe3u8jpp0RJ7Bh7ZZkVgqVxFipYyrEdNH3URqz/T/8aQ93p8meHiuebMolzKUCFTScLeqimIVvOlvJ5VttbPiBJgBHzTnvvIZtFrbvJpW7UZmIoGbn6fnmxHvVGHLJAG5uCboiMZOGe3e3JB0DW/E6w9R9+ODS76sS1IE7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=raspii.tech smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gD3meonvhOQIxaF9D2Hwe2UDRmQUFbvGWLJLp0u8lg0=;
 b=CitgYE0k6Qg7SyMwdg4J/gsOsROHDf2nclNk19ldfZYLiZo+IabHhmGlsfNKNMjunlQ6U8OQ0bBo02Or5qdo+qdaVKsbsBanW0AGmO0skUMN/dZw/mph++mIrSlsDUhGqppPJ1/DdH89AQiAwXTPxLzllWbxUT4KcGTTajdq/Pk=
Received: from MN0PR03CA0027.namprd03.prod.outlook.com (2603:10b6:208:52f::33)
 by SJ0PR10MB4717.namprd10.prod.outlook.com (2603:10b6:a03:2ac::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Thu, 19 Mar
 2026 09:08:19 +0000
Received: from BL6PEPF0001AB78.namprd02.prod.outlook.com
 (2603:10b6:208:52f:cafe::c1) by MN0PR03CA0027.outlook.office365.com
 (2603:10b6:208:52f::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.19 via Frontend Transport; Thu,
 19 Mar 2026 09:08:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BL6PEPF0001AB78.mail.protection.outlook.com (10.167.242.171) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Thu, 19 Mar 2026 09:08:17 +0000
Received: from DFLE209.ent.ti.com (10.64.6.67) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 19 Mar
 2026 04:08:14 -0500
Received: from DFLE204.ent.ti.com (10.64.6.62) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 19 Mar
 2026 04:08:14 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 19 Mar 2026 04:08:14 -0500
Received: from lelvem-mr06.itg.ti.com ([10.250.165.138])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62J989xK2334866;
	Thu, 19 Mar 2026 04:08:10 -0500
From: Baojun Xu <baojun.xu@ti.com>
To: <broonie@kernel.org>
CC: <tiwai@suse.de>, <andriy.shevchenko@linux.intel.com>,
	<13916275206@139.com>, <alsa-devel@alsa-project.org>, <shenghao-ding@ti.com>,
	<baojun.xu@ti.com>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <webmaster@raspii.tech>
Subject: [PATCH v1] ASoC: tas2781: Add null check for calibration data
Date: Thu, 19 Mar 2026 17:07:47 +0800
Message-ID: <20260319090747.2090-1-baojun.xu@ti.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB78:EE_|SJ0PR10MB4717:EE_
X-MS-Office365-Filtering-Correlation-Id: 0499cfb4-7480-485e-bf14-08de85970f0b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700016|1800799024|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	ppHbzjTRo2GSQAsK1uDSWp6wwgTEYM8hB6MkFX7eDDH7kYEb+XH6w1IX6HqBg2vwrjJz5ec8pkwOJeL0RzCW3EyjYuJKZ0z0Zd5aQdjjUcCObtWl7pi8fOepY9ghB9PZ68QG2dtcao7a8oTLFtawa0rICLjkAa1/hfNXQW2ZZBj6PsBGHYBqZcN+7n5tjEQ1275LySHpiy46EGmT31B3z1MabGZ0T98XQkpg/7dm6HrYmEN289GL9sTvcBLuf77mQJ3EGIkNsZnw34EiZE5LBjAld6J3bkHidtAHfoPui66lFxn7JBkKdNKgkfgVZbJ342XLeB4JUImTpymAkA4L57Yrom00SQqPShRMfQshv+b8T6ca3PWCHFIWkWU/K0ubE0D18gOwxF2F4eva4lEZTobE9B8dY4HviEpBOSCiObRr+sO8D8SeCRulJdfm/STa3pcV0qSwzHxzZM/IHNDmDRnsJOTBbV8zH8+oe8cr4eTxA9LDnmepo0tU7FR+QQi1Htu7Ca/9+ePPHBCMiJGlYKZaLgJiDozzXHOhpPu5/ajx7yzBtdWQeMF9tBwiJ17DayfSOtgCjVTMNaz77MhhdHppiGPBOKNHknY7dRaAAaE649IO4NkVIWR1FJCL1Iy7XdFZdoUxsW7ZzgZ+V8RKFEe8KCPfHswNWDpf9pFGX4xnL9JKEDI38M2auQBSEdIbrEEPdC0R6eJ6B7jbL1cFZrYiv3gcMyK6VeHDCHnLTLdhM44dB6uNKOmoeK7bV1qphmw4sHy9IohVBSWTTsxAYg==
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(1800799024)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	BkYlyeSaGEoMEP1HX+ECk6xrGHT0jsSSlg/xZr26ikigoBPViJZ7JSA5X8Zl5qc0o6PrIkutlWRuO935yMxJEQzc8CSz3ElEf5MJsKTP+EfNR7a+GztZNao3xu4BF0hvfyOUscKs9ltJNWcfbQpsSHzenPVkQp6ABT2XHDbX4Yg6nPNXa170wHGoJtoTKMvl81b1PNejDOGlAHqz+CyALFT/xbmibQKy3ZyDzJqffVcFtMCNSVrfNMitsnt6lPZz2aK5ck1MRA06Vobpw01qrEFu23MyORaW3oAHzGCmPivBx1UON82ZaCzFOfI6PazplQnngCIsRKOr6V8q5VgXyGgbptt3Z++DGtm3DED6FCB9eDCzK/lhInrxUUcBq4ZdRMuCAco/xxN2yjlGoX/R/8r0RPueD5dJ0WOgrjXp2BewlqfhvPJCCzpoVyiDOHkr
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 09:08:17.1006
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0499cfb4-7480-485e-bf14-08de85970f0b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB78.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4717

For avoid null pointer problem if no calibration data exist.

Fixes: 55137f5a68b5e ("ASoC: tas2781: Put three different calibrated data solution into the same data structure")

Signed-off-by: Baojun Xu <baojun.xu@ti.com>
---
 sound/soc/codecs/tas2781-fmwlib.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/codecs/tas2781-fmwlib.c b/sound/soc/codecs/tas2781-fmwlib.c
index 5798d518d94c..a1d86bd309f4 100644
--- a/sound/soc/codecs/tas2781-fmwlib.c
+++ b/sound/soc/codecs/tas2781-fmwlib.c
@@ -2550,6 +2550,9 @@ static void tasdev_load_calibrated_data(struct tasdevice_priv *priv, int i)
 	int k = i * (cali_data->cali_dat_sz_per_dev + 1);
 	int rc;
 
+	if (!data || !cali_data->total_sz)
+		return;
+
 	if (data[k] != i) {
 		dev_err(priv->dev, "%s: no cal-data for dev %d from usr-spc\n",
 			__func__, i);
-- 
2.25.1

