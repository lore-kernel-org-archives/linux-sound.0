Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3F773F23AC
	for <linux-sound@vger.kernel.org>; Wed,  4 Feb 2026 13:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770210022; cv=fail; b=mSyvPZh1ms0u39hf4Vvo8kL9ljHfZS77ElpVFSRHoOC3quUzFivpKqnJJ/JBCOWgUb04Phc5TWC72nsgAWjP8O97Tq1BTFa9jO6wIiuvCmgzIM95KJmHkfPib3PySgTXyEYthttU7TKwavK66TOiw/fg/wwR0ItQxsxwmjMAYZ8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770210022; c=relaxed/simple;
	bh=u1VD7mZlbMY93Ow94fg8yx4lTAXTCMEFf5JGYn3Ks2Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YkJcLMBJGkfy4/nxjr0bZqA1a1V53NLKU2B41FLFJa1fQV42PNbb6hDqSa+U2vLlKUGsqJVVw472dKKRdcIR9wuXPIod3DnlOf45oHkcSrQckuvWg0k8ybtcEhlVoiZPdIBB0QZoeyHAJzo2Qfk9ZyupT1DZjvqz6P1gdat96Dk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=OZbYLd23; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=Du5pAcdN; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="OZbYLd23";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="Du5pAcdN"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6148tEJJ2815969;
	Wed, 4 Feb 2026 06:59:55 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=zCUxPNgFVxrH0530KcKpuyQkQDyb/4QRm6c3AVHfcpc=; b=
	OZbYLd23c+KcjAIeTTttiDtuFHzVr01zSp8TqrLN+d5/mB3Xa8rwm4Jar/48eF9N
	s9u2dV5sVwpeEVSpZOilLCSN2hOnnY+XRCsDcx9ATW0Kx7uV4WsBSptFVksilQXW
	6s5LxVqNf5rF7azA5eDrY74YgjOXxGg+gbEqlYv7q+7mHMfB5/GWcoOcZdBhZHfg
	EgrKvSAPrqN1P4ni8fzsBrdX6b+uehfPpAnAW8OpveF2r+lCV0UEVYno6XJxhsiW
	Y9olhdKQzdpiwDMgUmu/yz4G3mt+Hd29lGkOkvXXw/8WLtMIW8Y6kpX7f3IIxQZx
	aoqpc2E8HnRS+gjZ9e7rIA==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11022083.outbound.protection.outlook.com [40.107.209.83])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4c1g12vh3f-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 04 Feb 2026 06:59:54 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U3UsoD3IxKyArqPFS3JYF5Ayw1iLAprZoUzVAzYxAHt9M8b+6soc0wI/YhNc2pf72FIVXq/iAjIrzwXDzdXadkIvVoeZRUCJ09wphFbGO4RNJHhzn6LREUtlhNebKYVkTZ8ryt1VdEC3PPCMl3kHPgcTq9tmrskcHYstsTmnNLAY6Di+QJGvJdP/WTkfYD4b7XB2NkPiejkdR226QfySd4oCKHPMJlRz2NPpT6jSqwsT4C9/4jmccH63mT1fJaSGnY9bTpq/CYM1Z+PDPQsQQ2lQrJZ1x9uRw4lcMjFD6g1vb27rQy7Zlq7O61acRvWRV3dBo/xdlrxy6nevICZ4QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zCUxPNgFVxrH0530KcKpuyQkQDyb/4QRm6c3AVHfcpc=;
 b=jqcnalwn+ZPEgq3Oywqzig/wF5xH2OsNPlCbE3FDUNtY2Bl0RWMgBGLKedj/emcrzYGBIVPrYAAaETeE944owzET7f/JheOySiBHaLGA586+E3Q8qhCFeORRW2fXDy55B914FUcOuTkZLPWxvShcf7DwqTnwhOzOzUNvXYjM3d1uZPWkSc04ML6YSqHAQs6J3vIZbVSRcMQrBhtEXjxNFtY+uZFoZAw5WB2Di23h56NTazp/TlyvM0VV2pBI/FHiySzRGz2eTW7/cVoWwDni0eFylQFadaIfCp6sSS3RL36L4inds8w6GJBU1ejtIcflwPMAMsuGb1mDqCNW846C7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zCUxPNgFVxrH0530KcKpuyQkQDyb/4QRm6c3AVHfcpc=;
 b=Du5pAcdNlHhLHk7Y09BbYMyRTe5aROSEsZn/U3mFle1uBYbg8h6jlYfx0Qgc4zXQlFa1AQcUSbVUBWcP1qLBJAUM0r8glN1cHROtE5yy5XGz/nHJ5MWOWDyxLwcKiQUheBzzElcnpWMlkAxELj3RBQ+9pijWCSH6wNd0muBvcKc=
Received: from DS7PR05CA0025.namprd05.prod.outlook.com (2603:10b6:5:3b9::30)
 by DM6PR19MB4358.namprd19.prod.outlook.com (2603:10b6:5:2b1::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Wed, 4 Feb
 2026 12:59:50 +0000
Received: from DS2PEPF00003444.namprd04.prod.outlook.com
 (2603:10b6:5:3b9:cafe::58) by DS7PR05CA0025.outlook.office365.com
 (2603:10b6:5:3b9::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.14 via Frontend Transport; Wed,
 4 Feb 2026 12:59:49 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DS2PEPF00003444.mail.protection.outlook.com (10.167.17.71) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.10
 via Frontend Transport; Wed, 4 Feb 2026 12:59:49 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 1CBB9406550;
	Wed,  4 Feb 2026 12:59:48 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id EF552822547;
	Wed,  4 Feb 2026 12:59:47 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 2/6] ASoC: SDCA: Handle volatile controls correctly
Date: Wed,  4 Feb 2026 12:59:39 +0000
Message-ID: <20260204125944.1134011-3-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260204125944.1134011-1-ckeepax@opensource.cirrus.com>
References: <20260204125944.1134011-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003444:EE_|DM6PR19MB4358:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 24fc05fb-af59-4c28-b88f-08de63ed47bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|61400799027|376014|82310400026|54012099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?XCemwIkET+kRs7Qos4szzYuYicSIXgzb5mqoOHMXLKoM0/lV/HYSSD1hyscH?=
 =?us-ascii?Q?Sw6Z9vFNEs2Kpyz8sZIIaV8SuxFsZroFYGK9MnGxEU4gDJZOiM3KqyZnVn/o?=
 =?us-ascii?Q?tQ04EWFv75Xw5jhx6/TIbMlvz/wtTlVtMEqnnBrrGqvgMLhX3PExV3dhrzqR?=
 =?us-ascii?Q?tYmwZS4CpCETGQHNJ9ddSddRwWco5Ygq1+5f5C6hN28XaqZPvug9lKuUF+gH?=
 =?us-ascii?Q?Ev9QWKEUOJb51WmaW8WWEmgqBdkMUQAxt3tSDQ+wBdIHTXMyF7iOsx3Vo/5B?=
 =?us-ascii?Q?/9mM/xgwI69j2my+IzSXIqbrBCKDj0fBKUe7sqPBXmrffFdP7/PKYJsE3RX4?=
 =?us-ascii?Q?zLgNqUst91zpOMxMixWTyWLBV+okszGlawQdpz9lXbt2eSBWNpvkqlSGag73?=
 =?us-ascii?Q?GVPmcwiVldHlahg2dvlZbcKqW8UZRieiDOXyG8WS3p5I/mmzkmVeuMmRgBQV?=
 =?us-ascii?Q?k1B4YhHU9yQozlPrKJHt93KkcxdKVotyIMGplkGaNxTPiChfaAbawm7tzpGJ?=
 =?us-ascii?Q?FyDlEjLdZqNNjD5klSA+oWJqaHDT6K6drz5wNqEjjeGB8Gth4pShSluMfN6T?=
 =?us-ascii?Q?xEpJd3wY6DoAUeCPC87cgoNHgi4ElCmk6QTPllCS3g+3HmwnB1/vtja0XCHc?=
 =?us-ascii?Q?WU9Alj/qKB1dZSsfTlFBHdCH0bHre7ZfW/aYqFWokndVxHBsSAWp03vVG+kz?=
 =?us-ascii?Q?CMuQBjH99LOQm08KJysP25RkgbxlTwXgdY8qcLlhM0p/CLzGtXuvNQMoPk1G?=
 =?us-ascii?Q?GQYj18FZmX9pGbTYBIjuR1HNmB1U86+1v6DzlPvy3HgSh3YTl+0tJq+tVr36?=
 =?us-ascii?Q?J0hZngmOd7c2tZhN7XZ7aUTSKeegzQc9hafULay4N10PyzFQIJ90Qp4REfRf?=
 =?us-ascii?Q?5IXDjHNTurKndw8cttkiWMJkbcyKYx25rqSB4laSGsQ77GuFGo0gggfOI6ZG?=
 =?us-ascii?Q?J/WLDQyexpbpjtfVkwHXREPPmfSoMyie3QyNRFMFw2sWuA3jXvNo6Pu1P+eY?=
 =?us-ascii?Q?vgl4Be0OSmkMC4vmiADCF0yPMObdaDaqkxNYIcGRyGN+rDiC4D3mS2kvXOUO?=
 =?us-ascii?Q?MWTpj2o/J579QiqYme1Jce0rC+XhAzbVNduDhFXw091x2WYHh9W8g284TOYm?=
 =?us-ascii?Q?K0DhV75v5btwxKWDeVZx5GxKq4GPzzgCxZYf7P3HQey2xQJS6QDr7xZNUXbo?=
 =?us-ascii?Q?OY73oQjjUsily76V+wwfTHMJFIx+mqEfyzsnPSRw6bhuZvltzDF576VpjsZy?=
 =?us-ascii?Q?n+BuAJxO57vhhX6/nsl+cTsZldDHBr5c67YzzJDjoqlS9s9hoRH3LRWEm/KH?=
 =?us-ascii?Q?4LnOWVoOWlMzFDjkZUed17pNtz36x+D5XoNMSnzEUzcOi6+aXFesF6Y3VraI?=
 =?us-ascii?Q?4kLIhkWxg0EQPk7LOvKp0I6l45wBYt6DtG0K+IiBny3a+eBHN5ZyR7zSCdZI?=
 =?us-ascii?Q?a67rETTxIz2OhLdDkPu3tnCxbR0G+7nEEFQJPWIndqtjj8MIeluf4+dByiL2?=
 =?us-ascii?Q?3wg4tFJ+uBYp1gmMNSJ6R1JXhWevhTV+dv3EivL96NClxdR/mkbpUFPfCKEB?=
 =?us-ascii?Q?9B5k35/+ipB375YO56ATvEuNPCBErwV6/nxZWEa9MB96k+Qi60yVof8/dZni?=
 =?us-ascii?Q?SPETGHc/+nXv0Hbqxh/ibZZluoyiEdHUbBbedF8wjwXwNy91bvIfI7m3LgMg?=
 =?us-ascii?Q?7JW7Eg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(61400799027)(376014)(82310400026)(54012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	tsh/lOwGydZXmGa3sS9DvTf9doDSh72lLscKmIzXUrnjkqJFRlRehN76+z0VKe2vS/6pz87gJqJQBg+fWGEKQOpfZfjukS1F/SdNeKwOyIFcyFanf8+XYkH/X/xJ1rULluGZT4wmJkvvniB2ExyQQZ+focsYorx5NH5nwgz0AnVXouVQv6i/0TYQegZsjEg10cjuJMRqi1SBaq2nwlAU0WoFS49mAh8zUA3zMVJUXP6NoXTUM/qtFYa/0uuAQVS5CIATWgxqL8Vt6j5c98WrH4YNYGM2cOFRGcYRYKoca4LedLfpBv70nqcUzI/cIyaJyzPpDuckxl1tTOCXgK5Ael5KoLKZZWs76xzdpdKL9XNKwa9omCJvp5W2wDbLd/DfspLXDeJ9HZXnNhPCG1mXTcQp/EHIDz26VDe+zklms/ofvt63yl4dpDWP2khL05he
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 12:59:49.2448
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 24fc05fb-af59-4c28-b88f-08de63ed47bd
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DS2PEPF00003444.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR19MB4358
X-Proofpoint-GUID: OymlxboOXrxQMrlGrugsz8ONvXIR4ps3
X-Authority-Analysis: v=2.4 cv=Mdthep/f c=1 sm=1 tr=0 ts=698342ca cx=c_pps
 a=9FtWz6uTepfq9RxXq+Llww==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=HzLeVaNsDn8A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=w1d2syhTAAAA:8 a=SPwa-vltKjm-RWpPa7oA:9
X-Proofpoint-ORIG-GUID: OymlxboOXrxQMrlGrugsz8ONvXIR4ps3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA0MDA5OCBTYWx0ZWRfX9DsVoGoQTd0m
 iacVrnZWPQC0swtC6eYXkqec5laiprfBe44En8mxeNCzwIybTEnSFbij6oKehKnmitcnRN/yRP9
 /9b83e+lXLzYIcP7/wQ4kX0K8Am7/wjdIScIdNX+wmLkYmldLZFThgxHGm2n7SCylLsBapxkj1e
 7nq3vgum5M9bFr0Zl1mKGwolIVc5y4BHSWeT1Ed0i15YVA2/kjbkz252hhQcMYjb4bxWcAOtOT9
 tHScnnh9+o6yM+/PpXepONxHYQOx3vNkjabJMvzk2LmmXDoxOlqcK9tXygTJMFkhLgth56vf02q
 7zz7fWlQUROlMRJrAjF/tJAh+LC2vpXLibKrDGOfrSF2tvLOIf82GIMU1/otsRlKJql2GITQ0Kd
 pq9fYaq74LzQoiA+YtFVI/YPSv+FS+vathJVumBjqZLIKIQk71N8RbXKpVN+bvkYZ31ss5OwM//
 h2npFHQ/2s0bStmULiw==
X-Proofpoint-Spam-Reason: safe

There are very few volatile controls in SDCA that are exported
as ALSA controls, typically Detected Mode is the only common
one. However, the current code does not resume the device when
these ALSA controls are accessed, which will result in the
read/write failing.

Add a new wrapper specifically for volatile controls that will do
the required pm_runtime operations before accessing the register.

Fixes: c3ca24e3fcb6 ("ASoC: SDCA: Create ALSA controls from DisCo")
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/sdca/sdca_asoc.c | 52 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 50 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sdca/sdca_asoc.c b/sound/soc/sdca/sdca_asoc.c
index 498aba9df5d9b..9685281529e9f 100644
--- a/sound/soc/sdca/sdca_asoc.c
+++ b/sound/soc/sdca/sdca_asoc.c
@@ -16,6 +16,7 @@
 #include <linux/minmax.h>
 #include <linux/module.h>
 #include <linux/overflow.h>
+#include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 #include <linux/soundwire/sdw_registers.h>
 #include <linux/string_helpers.h>
@@ -792,6 +793,48 @@ static int control_limit_kctl(struct device *dev,
 	return 0;
 }
 
+static int volatile_get_volsw(struct snd_kcontrol *kcontrol,
+			      struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	struct device *dev = component->dev;
+	int ret;
+
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret < 0) {
+		dev_err(dev, "failed to resume reading %s: %d\n",
+			kcontrol->id.name, ret);
+		return ret;
+	}
+
+	ret = snd_soc_get_volsw(kcontrol, ucontrol);
+
+	pm_runtime_put(dev);
+
+	return ret;
+}
+
+static int volatile_put_volsw(struct snd_kcontrol *kcontrol,
+			      struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	struct device *dev = component->dev;
+	int ret;
+
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret < 0) {
+		dev_err(dev, "failed to resume writing %s: %d\n",
+			kcontrol->id.name, ret);
+		return ret;
+	}
+
+	ret = snd_soc_put_volsw(kcontrol, ucontrol);
+
+	pm_runtime_put(dev);
+
+	return ret;
+}
+
 static int populate_control(struct device *dev,
 			    struct sdca_function_data *function,
 			    struct sdca_entity *entity,
@@ -849,8 +892,13 @@ static int populate_control(struct device *dev,
 	(*kctl)->private_value = (unsigned long)mc;
 	(*kctl)->iface = SNDRV_CTL_ELEM_IFACE_MIXER;
 	(*kctl)->info = snd_soc_info_volsw;
-	(*kctl)->get = snd_soc_get_volsw;
-	(*kctl)->put = snd_soc_put_volsw;
+	if (control->is_volatile) {
+		(*kctl)->get = volatile_get_volsw;
+		(*kctl)->put = volatile_put_volsw;
+	} else {
+		(*kctl)->get = snd_soc_get_volsw;
+		(*kctl)->put = snd_soc_put_volsw;
+	}
 
 	if (readonly_control(control))
 		(*kctl)->access = SNDRV_CTL_ELEM_ACCESS_READ;
-- 
2.47.3

