Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012058.outbound.protection.outlook.com [52.101.43.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6A6D34D919;
	Wed, 11 Feb 2026 22:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770847823; cv=fail; b=g/VxIPz92j6U03OGjm0aRNn+wEL/T1fhkNPuClV3lhCnNDkN4F7wqHtr8tqkdn0R5gcwbRrD/LkcffNNgvszwAcvQSzZeb0H1NigYvtTxZSCqfYNivDrjO+S91PmvNQ+rAjN3oLSR3zGVsHwhM8pak5mNVX2OeLTgzlc1cVoMi4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770847823; c=relaxed/simple;
	bh=sVcgoOnOhL6KrNs7fsmcWYpWtCT0Zgp/fDvENvtOi08=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=JoGuqJNDKv4dm9vjCgjonz2EED68qR8B7k9EzmJFvJD+2RpTFQkutFs2LGGUygqWDr55quCStIzY5oBI8QwMiO20VZyOyUBGLmOTqNobcpKOEQEyztsSg3EtoRWYuxl9ag3VXG9918WaMEcfzZeZyianYQ9OIGdNzGjQjYIoJo8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=MN8wt77Q; arc=fail smtp.client-ip=52.101.43.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="MN8wt77Q"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XOzvB/FPSqQ7M0flsXqvsZHiJIF8ZZhGlF5bGQkJxVUm8v5PnoPwrrea3sAomYyA06Jw/+zEiAi25b1bDa5L43LTeNnV1HR3KRyGplpWxVdviHbkNxkHfuza7WmgfHsFeOK4yuOJ3gMxCzyv8kCP4f8YIbcX62dEiGUfHszqnqTWMJc0vO+pjIqUbrtgQmkp+ie33hetj0ONy1wESeTEh1JXPCy/EQKE/R2pk7jJMXZqgSw5wdyzNQ9o9hTDDTotL88b4ijqG3QpPP1hjHMq/DI2hOzC1/KzymtA3RX1uY5FUUnAeuo3RrTn0x5RPjSTJr+ilC6PHOmLkUbORhKN1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QqzA0GWBQFsW4SqT6TkFvmGZyXYrcRtbt4eNDv4l22o=;
 b=L6ZTnnssNRf1Z7eWsSFAuM0+cauQS9ZPZs6hddknLhocqT08AHJCcLTdGyctIvmOWpvMFdUXOYgKGmVdpX7mRh/ZkCc9SqRr+I/1wzZuivFyu8TR7Qg8Jvzc0cK89jamY4BSoM6EdhKZq6iFwSDkig1n2314ok4UujUaH8KPTqIq7sLJURDOiW7fkYa+VfXCWKSrZvlWRCK5OG5q8VsEZ7cnTvJOrwfmzOMfVjw32YhHwKMbKYY6yv9+tB/6BYsR6gQmysdJjXYLxcbvEomoLHJSklz+lrBsM/DVrHw4DDVHV3VJFvS+GWBBX45uISNOJEQso2/Zs1V84X6lWhhjKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QqzA0GWBQFsW4SqT6TkFvmGZyXYrcRtbt4eNDv4l22o=;
 b=MN8wt77Qa5zKbysdlj3ogq+Va6qQCFRsvmj94Ym0NyXmxif4fa0JEGoXFqTMcSVr4quaWjptv3B1FOnZ7IaBIcEcXEaNPoguyjZma1FypPPPmn0exmG6tpGfk6M2c7EK7dcO+cn9A3Uq/tvTP96kz4FKyFkE8l9VFSA6dm9HArU=
Received: from SJ0PR05CA0099.namprd05.prod.outlook.com (2603:10b6:a03:334::14)
 by DM4PR10MB6061.namprd10.prod.outlook.com (2603:10b6:8:b5::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.10; Wed, 11 Feb 2026 22:10:19 +0000
Received: from SJ1PEPF00001CEA.namprd03.prod.outlook.com
 (2603:10b6:a03:334:cafe::db) by SJ0PR05CA0099.outlook.office365.com
 (2603:10b6:a03:334::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.8 via Frontend Transport; Wed,
 11 Feb 2026 22:10:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ1PEPF00001CEA.mail.protection.outlook.com (10.167.242.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Wed, 11 Feb 2026 22:10:19 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 11 Feb
 2026 16:10:13 -0600
Received: from DLEE211.ent.ti.com (157.170.170.113) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 11 Feb
 2026 16:10:13 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 11 Feb 2026 16:10:13 -0600
Received: from localhost (mz02jj9v.dhcp.ti.com [128.247.81.0])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61BMAD4I2378632;
	Wed, 11 Feb 2026 16:10:13 -0600
From: Sen Wang <sen@ti.com>
To: <peter.ujfalusi@gmail.com>, <broonie@kernel.org>, <lgirdwood@gmail.com>,
	<perex@perex.cz>, <tiwai@suse.com>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: <devarsht@ti.com>, <r-donadkar@ti.com>, <s-jain1@ti.com>, <m-shah@ti.com>,
	Sen Wang <sen@ti.com>
Subject: [PATCH] ASoC: ti: davinci-mcasp: Add system suspend/resume support
Date: Wed, 11 Feb 2026 16:10:01 -0600
Message-ID: <20260211221001.155843-1-sen@ti.com>
X-Mailer: git-send-email 2.43.0
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CEA:EE_|DM4PR10MB6061:EE_
X-MS-Office365-Filtering-Correlation-Id: f986dacf-7542-4302-2a01-08de69ba57d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6fiuZN8VQnOLHUt2Rq8VqEKtTU/HGEULaAsF+tspsbjlkvzABq9mok5jW0n8?=
 =?us-ascii?Q?yByiebUcduSTPYxSHn/nyYiLl1si5VldZVVHJ9DuRBna68+XrFxSUzJZgTD3?=
 =?us-ascii?Q?MeZGoPRVBvZ2PpVnM1yiQLZsDfnoAdIYrqYAboieUvn1V/2X5EEMW44u9wZY?=
 =?us-ascii?Q?/RNJBPO0WOGnxsWaNm0KPDvw1V2+QAfebz2eu79JG3yTMgNnARsR3Up42/wq?=
 =?us-ascii?Q?K0zM9IBT61lQvSCTkF+abFW8Y44f24MTBWlFn/ZnsOGmeqHaBcDCS7OSMyrt?=
 =?us-ascii?Q?fW6Hg9LVri9i/3PPBIBYUpPrh/rXkNS5KNYO8wA+4Pjf8WEItI40oXR+pSKh?=
 =?us-ascii?Q?hzhtzYhg7UfSNgD1jnoINShJCN5HFmyC+zRR8EgxFa0p6qzYVwSfwiHOEMcL?=
 =?us-ascii?Q?NIY+jpLc6mW0+vrYxUopkEyYD+kyk6Zgjpic3WzqT1jvLQI++WYAsvaGuHei?=
 =?us-ascii?Q?3V3nUB/8irn+0IBKZY1ZqqOUzhuYqisQfqZWRpxm8iRtYmu//9XOEw1ZMV8U?=
 =?us-ascii?Q?6OnrFuwJL7FycpnM0HCTGFjbLtGzj7iPMcI/adzlnFb+6h3sD3cWPqdpgdfW?=
 =?us-ascii?Q?uLkvoU4P96SlsodO/NMEA3nWYG4N/DNtjMgYBr0J/TG/6fxSHNouKtFDvLxu?=
 =?us-ascii?Q?NJLJQSTe7FSuvi6OJUM4J01W7xTWx99TL9qlY2WKo8BM19fVn1aFMCisc8we?=
 =?us-ascii?Q?sW8KEUkq3jeJ5XPj1i5KTRsgiaTk6+aj0z5g5V8qVr8I69N1PwI1fyyJfbIe?=
 =?us-ascii?Q?Y+hC6Vm91z9vYfOxGHk9nuJy2SMX4XA/ngZilIMAVJZdTPVr7x5pl4wWoYWB?=
 =?us-ascii?Q?Y20ywgvV9Fg+LRB5aLKLvkR+pvadni5cIcxPhKRVUOvoJRo3uTs21aI/fZVb?=
 =?us-ascii?Q?ay1YEvwP69+IvUQhHe4YeNwWNsX0xNrMsIgpsP5NmHO046ZFVqVNHG11fWrj?=
 =?us-ascii?Q?iXwPNEV0Ps57yOC4yA6IFMNMcH8Fd/M4X9rosQuRuJp6VhZ0PSsx+9bIufpO?=
 =?us-ascii?Q?6lVSNeFVZoCweol1MCsPemHiv8ERH9Rum9vz7JvHyETzJhjt4UdOAkCjeXT/?=
 =?us-ascii?Q?ZFU24ljUKZHBC40EJGxaYsPDhJ9ltcNjVAk/3uw+yMmbRsXgCgUwKwKD5iqb?=
 =?us-ascii?Q?AjXQq0Y2dmwSgVaosiv//BwbmYCZDRVawCFXPtnms/AtGXlEi2GmN5CexNpj?=
 =?us-ascii?Q?rVNflONRaO+ednX1Fn565lElZhaCHqPiwY5abyTOddw7IyKnkRHZnpOBb/OJ?=
 =?us-ascii?Q?yZiInE6WlNIZfSGCECloRgje5uttF/5yE8uvJd+U2Ys+g5EUYdqgntqF7lI8?=
 =?us-ascii?Q?OXHDlVWDCRbhbPXh1NZbYjXg01Nf9dB1aQjO1jlqqpgOn4rMgYF7iWRjWhoB?=
 =?us-ascii?Q?l7CT+YhTjmlkCJKuf06K0itj3b0CWIS2hu5hCpOQxBUd0ixCGeWv5a4HJ/U9?=
 =?us-ascii?Q?NiO7hHMlyFkYgp/bLvtEA83wFG4d/dbgyvnEePhTugR4YRT3/Pgz5aCgl+jr?=
 =?us-ascii?Q?kn1WjVWd6sDxcA0DiS88dJbQzGh4JqRlgW5lOxy9mDZrEIZx3HlragRNaI7m?=
 =?us-ascii?Q?D2XItiNcy8x+xpRIer9/mES/4jjURnJ8n+8VKHvlAlgHEWWjxgzi6o96Fox1?=
 =?us-ascii?Q?6sXQsB33nJn3byBQpvnvfgc=3D?=
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	PnaExdjT9HNIBPlnqwccw76MjKyxXuP4jLcq9TaTwDhCxt/fVwtma/ch7FtZOJMvjFzz9Gv1/TCmSRILj56biG4tM4+lXGmpPZm4fR+Lc4/0jLMMiF/QDbLNTwKj1oeMrPxidRZQmMilFLVgch1EPgbNkATHD/ZpiBVSWpe7NInCA2zMkffbAYsS24UTNCjO8Bfz/HloU2sUBAwF/26fpzfv8gKKuL6MllFaWYRLa5UuPG3R0GAnTKfgbwxr+qfaStAZrivOpqJ8CD1vpGh3cbK5YkSsFREwtLGsL3jzJ2xsYQBypi0JHCkB56MQdSnrQ/6Vibndp3b6bqEEPJg8gBBaCrSs318FGG68zIC40QnjBDVKwEL/LLBKN9cX7bFSgNVJUvsOX9oO4SCeUXlNYmWQdc9+LCisiysuFw36xFsd1gkMgALXlGMfMltMhyc7
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 22:10:19.0186
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f986dacf-7542-4302-2a01-08de69ba57d2
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CEA.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6061

The McASP driver supports runtime PM callbacks for register save/restore
during device idle, but doesn't provide system suspend/resume callbacks.
This causes audio to fail to resume after system suspend.

Since the driver already handles runtime suspend & resume, we can reuse
existing runtime PM logics.

Signed-off-by: Sen Wang <sen@ti.com>
---
Tested on SK-AM62Px with audio playback during system suspend/resume cycles

Testlog:
  https://gist.github.com/SenWang125/065c2840071f2569a79db9e99010603f

 sound/soc/ti/davinci-mcasp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/ti/davinci-mcasp.c b/sound/soc/ti/davinci-mcasp.c
index 8a2977093df1..643661ebee83 100644
--- a/sound/soc/ti/davinci-mcasp.c
+++ b/sound/soc/ti/davinci-mcasp.c
@@ -2811,6 +2811,8 @@ static int davinci_mcasp_runtime_resume(struct device *dev)
 #endif
 
 static const struct dev_pm_ops davinci_mcasp_pm_ops = {
+	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
+				pm_runtime_force_resume)
 	SET_RUNTIME_PM_OPS(davinci_mcasp_runtime_suspend,
 			   davinci_mcasp_runtime_resume,
 			   NULL)
-- 
2.43.0

