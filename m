Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011012.outbound.protection.outlook.com [52.101.52.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CDCA382F03;
	Wed, 13 May 2026 01:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778637371; cv=fail; b=rs0lX/hV6QPP7rZw8YMBarfrvGwxRZS0TR4BljaDQbx68q4sYyfHb444WWijF8Pn11DjSgZPBXhMe3yanYjsaaTHOa+Q9C3Xl051kiumg9vCC/1XAGlFt81LL/nCg9jiHpCfXIPDsMQb6I0FnVP2Ihlcxf7bIvTt2vXpomGiiCo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778637371; c=relaxed/simple;
	bh=2LgCR64Y2WQi0BD2TzJmSpB4es4TLpegjiOiNmNa6wk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=dsM7DAdL4PBlqx6hwulwndQJQzy5ZcnpaOmOiYtHiUHuRgMSDGOQ5bN13qqyJcQ6XcDxShEgld7ai3AO2fhzSDYNqhwEjySc68ZM8jdOrvoNyW60ntkjehvlo/+IRNEbrmn46o4H5PH+S1ncgDg5y0YhbmCSLm6Gyy7cVGqB5fY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=G07toiOW; arc=fail smtp.client-ip=52.101.52.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="G07toiOW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aIAaB6WpOepU35g0II1SSl6aZ+CZxtiFicPeD3Ju+KX3s9Cug1kCd0PLmA1hdGocKYoQFXwo9w6eu5cxt9+X5PeL70IT6PqEARl6waWASoe6toYpfpQjUFY6VFfGZUzqZNYPAeepRplU9j0sx9ttTj12SmMJYrWHr0vVi4wQNnsVo4MOHM27ByN6Tr+YVl2lAHDCxLhcImAyqe0mTP6SEJ+2CUEvkYJWPYjqA4U7/xXvBhkpXUa88mR8u4+EIunGYUjFWOJLjaVE4hqFxgGnk8g48ca2LRns9PRCB4otym8piyibFqp+Vn7SRzaQpy3gzk0KfuWm8LxyTsXCEX/ZXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p2YJ9v+qjbPB+WI5OZirBWWTuPADwWkHwxB+Vd3Ls7g=;
 b=ovDJ1qQgvp9DM6fdXo3egutIK5fQ+PMvfKBMR0uBljbCcf6jF+LRovlDw9KuMXXjkD79jwu3B2JNxZz4w2RlZjvYYzeanuvaRfZG2RNtE+Omg3tAT1KHvuKMupIc+eLBQiRCIbPLa75CWAvVFmS0kQz9MAoBQQJ0hccGOQ7tlhWxF4Xf5JigP1WUKPZg84y0TZJENTTMQEjBaAkNen5xZzFhL3D8rgcvZqOyCTFJz21WO3HMRLjZnmA5O5c5oOCwcQcXFhPzEZ431DbMUN/sAbE/PwvpmGDcK2ygQsX2pM8ASiWWYQD6wWjC+qEpb3tdwSZyzxilp0M9Jsa0eEVnkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=gmail.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p2YJ9v+qjbPB+WI5OZirBWWTuPADwWkHwxB+Vd3Ls7g=;
 b=G07toiOWtgMxKbaen1NyzcmrcyRh142NhEFuaIep9B80AmFGrAti2fXytNCE9ikVjmsLwvTyMp5yjwQiNPX89PRypLIn7Rnix1CqW5tUIaR0300Y1MUTJJ7iQLLeaF9Sp5wI1Wn7BGMm0OgXmuf6dhcfvOjSWK0kCLAJu4jUKSU=
Received: from SJ0PR03CA0137.namprd03.prod.outlook.com (2603:10b6:a03:33c::22)
 by SN7PR10MB7032.namprd10.prod.outlook.com (2603:10b6:806:345::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Wed, 13 May
 2026 01:56:04 +0000
Received: from CO1PEPF00012E5F.namprd05.prod.outlook.com
 (2603:10b6:a03:33c:cafe::75) by SJ0PR03CA0137.outlook.office365.com
 (2603:10b6:a03:33c::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9913.11 via Frontend Transport; Wed,
 13 May 2026 01:56:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CO1PEPF00012E5F.mail.protection.outlook.com (10.167.249.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Wed, 13 May 2026 01:56:03 +0000
Received: from DLEE207.ent.ti.com (157.170.170.95) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 12 May
 2026 20:56:02 -0500
Received: from DLEE211.ent.ti.com (157.170.170.113) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 12 May
 2026 20:56:02 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 12 May 2026 20:56:02 -0500
Received: from LTPW0EX92E.dhcp.ti.com ([10.249.136.11])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 64D1tuKJ2719067;
	Tue, 12 May 2026 20:55:57 -0500
From: Niranjan H Y <niranjan.hy@ti.com>
To: <linux-sound@vger.kernel.org>
CC: <linux-kernel@vger.kernel.org>, <broonie@kernel.org>,
	<ckeepax@opensource.cirrus.com>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>, <cezary.rojewski@intel.com>,
	<peter.ujfalusi@linux.intel.com>, <yung-chuan.liao@linux.intel.com>,
	<kai.vehmanen@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<baojun.xu@ti.com>, <shenghao-ding@ti.com>, <sandeepk@ti.com>,
	<v-hampiholi@ti.com>, Niranjan H Y <niranjan.hy@ti.com>, Dan Carpenter
	<error27@gmail.com>
Subject: [PATCH v2] ASoC: sdw_utils: Remove dead code in asoc_sdw_ti_add_tac5xx2_routes()
Date: Wed, 13 May 2026 07:25:42 +0530
Message-ID: <20260513015542.2420-1-niranjan.hy@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
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
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E5F:EE_|SN7PR10MB7032:EE_
X-MS-Office365-Filtering-Correlation-Id: a835f745-616c-47aa-1eb3-08deb092ca35
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|7416014|376014|1800799024|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	PzfEK75h4UgGNi6CkJy2GN71wP6M9kRFQ0kAWqEMEfffo0kXEsOGyMLZS7DfVD2q2cNkFb616M/yciC6bJ9YC/eZ/VbaUgnlu4GiqYl3ZZawJAZoQqy9bIiys2RTft8S1CqubokkbBiogQOUdS7puYE5Qzkzw+W8aPh20kASR1IlFrZ7Hdv3brMahKopQMEBWmLZzl6LSGuI/Oo4w/RecYHpU/7GBGqflxJ+pt7gVRkwfUrUMv23JlHjD2gDqFPOOylzNL4lZPUcwALAhq1kLPsIiEh1UvMA4Lr8SiD42X3cH/xTs/suPZMyhYj38ds9l/ta/rIZ6YfcIOCVg23bp/KLpNsquyT8XUF/EqruHlAAzBspowSG7mZZd/gHnieYqA9spoVxaDkqnW2j52mPONQ4hrZZCT0/gImmKiBj75fJ4Fv3LxTN6QB+Z9a1ipWum5EiWYZ6hKlzIgrrcB7QopqOtTleLxZu0HdAtuLnzKiF8bolf6gT9wRKe8kQPGBdTPr6t5cE5TMQ5gSahxIR5WlJUf+Xx6EmZsIBHhRol4OJVXxaCqupK3cwHtTQdNA7TrCe33cU0oNJg7+yrgPOyZE0kDl0e6J8TinH043jWVA7uKQSN7WHv554+MNyo7i/oNx3R6o1SQiVeanLYIqiPASOGqtrJrnuF0c6Ykv7LSBTQ0F11jfOue3CT/V1jo2Xckn4RKHFba/7OkrUVl0ER/OD4jeOzPjBIarJHiFuLvE=
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(7416014)(376014)(1800799024)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	b3QQ15lYFS791LSAmPer1h24t0F9kNmwDkU8Nh+btkFCTC0tH0LLoxuK66nDvzRi5KKHL64biBKgtIaEG/jua/74iyG6HfmIHQphlPHlgXuPJ6xXBS2YNku+cnaExkmkA7QbOMt2N1pg//06DB/2S/q50XgCcGg6xW0HSD8U4W7Zimx1PVc4f8aOxr845PAknbEtshu68bMDwKLiThGQExdHejXf+N++JdvGxmgcOGxXgturA1TNasD59Frpks/PirdvekwXrCZjR6V3JXHPlr31AaZHCYNeovr0l5hZYn1iBywPFNLZHO+wzsMIwQG20NDu/dnu0pW8DI7QW2jZ2cVbck4hl1I3EQtbWqXVIFVwlIvp13daNviEQTJkEYAVRt3ZY0bmVUo41n+vFn583j7Et9twgbdIvWMBxrQeptUX2DTvTme7+jzoCByGnrxv
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 01:56:03.6085
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a835f745-616c-47aa-1eb3-08deb092ca35
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF00012E5F.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB7032

Remove unnecessary checks for scnprintf() return values in
asoc_sdw_ti_add_tac5xx2_routes(). The function scnprintf() never
returns negative values and cannot return zero given the format
strings used ("%s SPK_L" and "%s SPK_R").

The existing length validation at line 110 already ensures that
name_prefix won't cause buffer overflow, and scnprintf() guarantees
null-termination even in case of truncation.

Fixes: e812de61e9a0 ("ASoC: sdw_utils: TI amp utility for tac5xx2 family")
Reported-by: Dan Carpenter <error27@gmail.com>
Closes: https://lore.kernel.org/linux-sound/agF8GBcHYUaGJbXY@stanley.mountain/
Signed-off-by: Niranjan H Y <niranjan.hy@ti.com>
---
Changes in v2:
- update Reported-by with correct email id.
---
 sound/soc/sdw_utils/soc_sdw_ti_amp.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/sound/soc/sdw_utils/soc_sdw_ti_amp.c b/sound/soc/sdw_utils/soc_sdw_ti_amp.c
index f156116fbeb..d0ae5d7efe8 100644
--- a/sound/soc/sdw_utils/soc_sdw_ti_amp.c
+++ b/sound/soc/sdw_utils/soc_sdw_ti_amp.c
@@ -105,18 +105,12 @@ static int asoc_sdw_ti_add_tac5xx2_routes(struct snd_soc_dapm_context *dapm,
 	struct snd_soc_dapm_route routes[2];
 	char left_widget[TAC5XX2_WIDGET_NAME_MAX];
 	char right_widget[TAC5XX2_WIDGET_NAME_MAX];
-	int ret;
 
 	if (strlen(name_prefix) > (TAC5XX2_WIDGET_NAME_MAX - 7))
 		return -ENAMETOOLONG;
 
-	ret = scnprintf(left_widget, sizeof(left_widget), "%s SPK_L", name_prefix);
-	if (ret <= 0)
-		return -EINVAL;
-
-	ret = scnprintf(right_widget, sizeof(right_widget), "%s SPK_R", name_prefix);
-	if (ret <= 0)
-		return -EINVAL;
+	scnprintf(left_widget, sizeof(left_widget), "%s SPK_L", name_prefix);
+	scnprintf(right_widget, sizeof(right_widget), "%s SPK_R", name_prefix);
 
 	routes[0] = (struct snd_soc_dapm_route){"Left Spk", NULL, left_widget};
 	routes[1] = (struct snd_soc_dapm_route){"Right Spk", NULL, right_widget};
-- 
2.34.1

