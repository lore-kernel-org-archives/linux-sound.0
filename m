Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010009.outbound.protection.outlook.com [52.101.193.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52185282F3F;
	Tue, 12 May 2026 11:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778586881; cv=fail; b=R4IJ/xVHyNX668CvL0InmngHpziQ+X2gmuuO1P3JdL52msHTWGm/z5cNzAqhbnPQtQzesZjR7zByC/W+dziz8xZ3oy2wiotGRp9ecAEkexw1A8pwG5lYTfw01ft8PqsHuodRRirDegk6pc4QhgHFvKjXHhIyMj/3/tba79sBf64=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778586881; c=relaxed/simple;
	bh=ASBnDvGo4cZCps6oEZhwOtdBBbDdBqCWTNUGvrEf1Bk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=NzDOQIjECXDnJ6Bvc64IJhglZPH7Tvd8civBUCVS7P3ThNM1cYiEWTcANG0faskxzhotdOX+TcQ/02VJ+I6Bzj2DbIj5yYCVjwzQZ8M4gK3NkvaenpY94z++fKUAB6xKpHkY4vM/NkfjnKypBjMF1lVAwbfGyJEtuWjQQinrO+4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=lOkXNgs5; arc=fail smtp.client-ip=52.101.193.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="lOkXNgs5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Te5NnWYGm9J2n5HpvoxTcv++q0NU2zavFB6wJkohHgqks5Uo9V92+rC72Un/VlqhTTt93MBjjnnxsBUirjhNLJGvLRK5xc1AgFFuRaapxgd3w3D5q31Rv4DQSM5tKuBN1WvQbc3JVyrPaDq3C/tN+smOWyfZtcl+XJUKKSGb3Ba3HkIE0927lFWSXggcYpHO0viJEcPG31/5jxmeGBs+L7qeUNoLxNwoTQPjWl2ssX8lSm3yyfTblg3N4Pc0JwhFIjg7B1XSNmpL9D1L/AhD15z1DS0l/rm8ufUazT2J4QUcHZq+Qr3zdVeybgjKaqh1hxns7SUqh0IV8YaORYjdcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S/l6IQfPMfGwuAGDOYmx0llMCbD1aQ5OkRYYZzn7ggE=;
 b=WvxtuQRrLh3SED01Hr1oj4VzCF6i61GQ8RdEm5LAYSMV9pCsjjTE+CUgv+QnddXm7n2JZdZjFQZ08D5WwuaWYkey5HEc64rQD3rEC5ezf0j3HIKOUaDSejR/7C+slgP9L9MHQt83rcDn7Pd/k3f825Z4y6pzVQxzvCARd13Ff5+vCiJRznY5iq3UWBA8mnl1CyrboEKWyNK3I6K++qZph4RV0MWPj6y6d7CmGM5kzbae3jQWJ/kFPuMomlHFNJ2OamujR11R5MV0Y64nTVzfqHw3gq2mFgSr614eP73UM4pvxW8LTPM1ItJIUi5k1SpIIdK/1aa1DAufceqStmvDyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=linaro.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S/l6IQfPMfGwuAGDOYmx0llMCbD1aQ5OkRYYZzn7ggE=;
 b=lOkXNgs5RXYFeIGHGoz8+eiSaPRyuiMZTGxbEaVqcyaDyPanfr0N6GeHE7k4aHqeQSb3kyZ39ek0ogNEld2qaiGQWcVKY50vGpXo5VEUHkk7JriQutElvkQOxg4aQRJmKPpN18XV20B9PDXCP4Jl8YDBlkt8YhHFgr/4zihutuk=
Received: from MN2PR06CA0017.namprd06.prod.outlook.com (2603:10b6:208:23d::22)
 by DM3PPFE23691A9C.namprd10.prod.outlook.com (2603:10b6:f:fc00::c50) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Tue, 12 May
 2026 11:54:34 +0000
Received: from MN1PEPF0000F0E4.namprd04.prod.outlook.com
 (2603:10b6:208:23d:cafe::fa) by MN2PR06CA0017.outlook.office365.com
 (2603:10b6:208:23d::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9913.11 via Frontend Transport; Tue,
 12 May 2026 11:54:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 MN1PEPF0000F0E4.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Tue, 12 May 2026 11:54:32 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 12 May
 2026 06:54:31 -0500
Received: from DFLE208.ent.ti.com (10.64.6.66) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 12 May
 2026 06:54:31 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 12 May 2026 06:54:31 -0500
Received: from LTPW0EX92E.dhcp.ti.com (ltpw0ex92e.dhcp.ti.com [10.82.30.14])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 64CBsQfr1373735;
	Tue, 12 May 2026 06:54:26 -0500
From: Niranjan H Y <niranjan.hy@ti.com>
To: <linux-sound@vger.kernel.org>
CC: <linux-kernel@vger.kernel.org>, <broonie@kernel.org>,
	<ckeepax@opensource.cirrus.com>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>, <cezary.rojewski@intel.com>,
	<peter.ujfalusi@linux.intel.com>, <yung-chuan.liao@linux.intel.com>,
	<ranjani.sridharan@linux.intel.com>, <kai.vehmanen@linux.intel.com>,
	<pierre-louis.bossart@linux.dev>, <baojun.xu@ti.com>, <shenghao-ding@ti.com>,
	<sandeepk@ti.com>, <v-hampiholi@ti.com>, Niranjan H Y <niranjan.hy@ti.com>,
	Dan Carpenter <dan.carpenter@linaro.org>
Subject: [PATCH v1] ASoC: sdw_utils: Remove dead code in asoc_sdw_ti_add_tac5xx2_routes()
Date: Tue, 12 May 2026 17:24:23 +0530
Message-ID: <20260512115423.2341-1-niranjan.hy@ti.com>
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
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E4:EE_|DM3PPFE23691A9C:EE_
X-MS-Office365-Filtering-Correlation-Id: 31dc53b4-42b5-46dc-efc8-08deb01d3b40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|1800799024|376014|7416014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	rPTCMeOtYXTYKOp4ymH7krlmcczorqd0XJWi7pF93zps6jWfOzKjjRIqC4+TA3WkH5q+hs0lnwl4BnNahW7SCRc7D9IEVQFRF9Pea5D1t2XbbtlboZEs5g2TyByfDYHqHUpZx7tYYEjZTOO7A9+LkQ3bQuiWuq5DHwN3sZ8pykmp2Izyq2fxn0Es3MgUYfMXumN7jqCbdRhaMZ4jpPm9MF7HZFZLFWREv8vLhbI/IQmcdLeAGriTNq1Gn7GHvtJUtKF3Mo4TSWshLmwzMs+UokwtPCehI+tu66kPQ6GWmxxk59DvAVgySPfaVSkIo6e7m79fRwoq2ypbkxFPow/xVN4KbTqaZVlUXALdWSIMw3HyBKVMr79fwtLRJwcMaorlu6h8sEVUcCCaHKUOY/HYNXg30cxo7gSkipsBDnHryATkZw0oedbCSGwPhdRvECKgi2whb+Ako/2fb4AT0XG/WwdmezTGVFzlAIx5BKEyjKTpGHlC8bMGwYjaSjS6SiK41DDvND3D24cG7IZDvnlmHUYIBcwzlV24oqolIhlETQHMya6rWwsAYNcxrR/PHQQgRApBKUddfj3Ft5C2fb9qA3JitDtZdcYcCojiTHbViFD7nrE3Eoy7wJE6T3ZPpgUAevedXSUvWjfc2HdXJJbI7kYbXJIMiGqgUW3lq1L4apgTmuAD+1yh4K0AibBEZnavTFV/Fe+5ZGXjzzPRDdhhCRAmsATHtYVynEwz9seO16c=
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(376014)(7416014)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	bDyS9SlorclgXmH8OHdpPozyJBAxfMEgfpEkEhq+1rRkgHDOhcCcUFYP4c+mcljfVp0l+duVg7zuX35VXRConh8PL2vCCUSLxoz8emdwdxZXq9251pJfPtU8M124U4a/le34g2awQ6jfz5cc54r6zshCoS86hvvy/5IL4hBIyfaYeamdl2jE148ZT7Ej8Q6JcUHP4tmKKrCPBnPPF1zw16q/xEaVWwgC1ABqVd7awkTW1Eqafws1lIQ4ihrfjnzTKTskGoGNGlw3GalFNzZ25l6m5xx3c/HtwDLUyQii9Necd5X2dl5FF5r76OrPMOMYW4OdyVhEB7iFIEYf5jZrDHwavElYF6b5UlDBKu1c8/1kVqoM+nGjYexDRAD+1nRyJGKZxzJSWJteh6dP+78V7fOQjaFNxBfPAq00C5IOiIT3MTZSuo65jkExR4eSSh5x
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 11:54:32.6638
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 31dc53b4-42b5-46dc-efc8-08deb01d3b40
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000F0E4.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFE23691A9C

Remove unnecessary checks for scnprintf() return values in
asoc_sdw_ti_add_tac5xx2_routes(). The function scnprintf() never
returns negative values and cannot return zero given the format
strings used ("%s SPK_L" and "%s SPK_R").

The existing length validation at line 110 already ensures that
name_prefix won't cause buffer overflow, and scnprintf() guarantees
null-termination even in case of truncation.

Fixes: e812de61e9a0 ("ASoC: sdw_utils: TI amp utility for tac5xx2 family")
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/linux-sound/agF8GBcHYUaGJbXY@stanley.mountain/
Signed-off-by: Niranjan H Y <niranjan.hy@ti.com>
---
 sound/soc/sdw_utils/soc_sdw_ti_amp.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/sound/soc/sdw_utils/soc_sdw_ti_amp.c b/sound/soc/sdw_utils/soc_sdw_ti_amp.c
index f156116fbe..d0ae5d7efe 100644
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

