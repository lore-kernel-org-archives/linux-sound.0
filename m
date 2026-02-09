Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013055.outbound.protection.outlook.com [40.93.201.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06733450F2;
	Mon,  9 Feb 2026 07:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770620971; cv=fail; b=Z66TPUbFQwSatQlIeVzZO/GN1GoNxOaxpZyfmXHZFivzy4BQ6yAogL0CxCdL81uFWVozsZnS/HqI33Lr87278fdRDWZekaLqUJ6fU0955Ho72x2ADzXB1cxYD9ClO4IWbPbOYlYAqzXQwnyJhRSsjAqOZ2CKafx1X/OSzNE6VBI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770620971; c=relaxed/simple;
	bh=iPCc4ZuTsTt5qaSD6cXLbmvrQ3ddRFzNxhE8M9WXHFY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=DM70Mh1qscvlzn/fRDCBJa3/kI8CROU4r7Rvtcmt7VvtYW4pCNlhK591ZXRpKKzWYCeNTvy8DDSxHNlHAc44Uto9oSPmgKtix+JXO6FqVslFZzl0y8MssDyFthNfKjsCukiT2MW7SWOfYctV1e2XtA5uEfCM6opSGLSpSaM4iIs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=Vwn0w8wQ; arc=fail smtp.client-ip=40.93.201.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Vwn0w8wQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yyPNDUITjXum84qPh6drNm7MA+WXXNOq73yd2P058/5vtOWHrt/vodUaYTgxVZs4C4k5yYu5B61ACLQSkISTjPk1HGj6lbpvvOlUVdZD8/aysaNd4nwgZx9pDNLKDqdcgr8PWHfLZRSv0RnaOh+ZWJZowzK4U04bFXMIweesB171N96m+15XLby+Vd5ki+wrJ+aAdSilQpssnwLgyQrwiWXv8Z+xSTfCeoIZu4rmEeZI11bLMn7CenPJseYGPR90u5QnO452+GJ0cHzuwpOEkhv8uD8UtDoCqU0Nzky+2ckktRKtEYSX1Oxhk8yrOe3GKn9G7FbEaCnFgKldZ4s4cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l6/Rr7L92nhv3F9wk91MyhdoPVy77+p7VPxg2WmiRxE=;
 b=MO+Gb0evEADODxgNjlSVhzRt75U5BZfjZatQ/t8smqB/+WmDiOCMLxObAqzUnp38E3srupWkztV8ZIABWbeNfC69ME2L0ARYkisZqRpaJ0NHEKUK3M6t3ZBqH2Fhih8X08MkAW3FvuYEZZ4cTfvQWTZNTiTbJrj8wJVunEdQnQyrv7hGxg6M6v/YFmG5j3ppLLqubSoc/Foutr8bFJS5qbKVTE7pvet5pW6NwNdD1u8EoJhZdxy5bc0azGrqMQ7kQrdumLE7mipiV+U4MjXnb72WaBKsuZJ9glbCAKc5el2OeP8d9EbNWi/O8hIzS7aP4CUlksyhZNbxtApAgsJydg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=opensource.cirrus.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l6/Rr7L92nhv3F9wk91MyhdoPVy77+p7VPxg2WmiRxE=;
 b=Vwn0w8wQW0ITI3ZRWiAYirS2A9Q4eIBzXKlTuSY6882ur+/VNM4X1mG12hw4MR4cXZZ1inoK8zirBveysj5I9y37BLMHVtqr0GxB/1lXFLMH2s5pibrxw95VCdvxpqhnvVoJTUxovtkpMSrWS3MR4DXN34qYxGHpcNdB9HZq0Qg=
Received: from CH2PR05CA0048.namprd05.prod.outlook.com (2603:10b6:610:38::25)
 by DS3PR10MB997724.namprd10.prod.outlook.com (2603:10b6:8:346::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.16; Mon, 9 Feb
 2026 07:09:29 +0000
Received: from DS3PEPF0000C37B.namprd04.prod.outlook.com
 (2603:10b6:610:38:cafe::e1) by CH2PR05CA0048.outlook.office365.com
 (2603:10b6:610:38::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.6 via Frontend Transport; Mon, 9
 Feb 2026 07:09:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 DS3PEPF0000C37B.mail.protection.outlook.com (10.167.23.5) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Mon, 9 Feb 2026 07:09:27 +0000
Received: from DFLE206.ent.ti.com (10.64.6.64) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 9 Feb
 2026 01:09:23 -0600
Received: from DFLE203.ent.ti.com (10.64.6.61) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 9 Feb
 2026 01:09:22 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 9 Feb 2026 01:09:22 -0600
Received: from LTPW0EX92E.dhcp.ti.com (ltpw0ex92e.dhcp.ti.com [10.82.30.14])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61979HCH1554203;
	Mon, 9 Feb 2026 01:09:18 -0600
From: Niranjan H Y <niranjan.hy@ti.com>
To: <linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<yung-chuan.liao@linux.intel.com>
CC: <pierre-louis.bossart@linux.dev>, <broonie@kernel.org>,
	<ckeepax@opensource.cirrus.com>, <shumingf@realtek.com>,
	<lgirdwood@gmail.com>, <ranjani.sridharan@linux.intel.com>,
	<cezary.rojewski@intel.com>, <peter.ujfalusi@linux.intel.com>,
	<kai.vehmanen@linux.intel.com>, <vkoul@kernel.org>, <shenghao-ding@ti.com>,
	<baojun.xu@ti.com>, <sandeepk@ti.com>, Niranjan H Y <niranjan.hy@ti.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>
Subject: [PATCH v1 RESEND] SoundWire: Allow Prepare command for Simplified_CP_SM
Date: Mon, 9 Feb 2026 12:39:05 +0530
Message-ID: <20260209070905.10749-1-niranjan.hy@ti.com>
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
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C37B:EE_|DS3PR10MB997724:EE_
X-MS-Office365-Filtering-Correlation-Id: ec6cc3f4-3346-4c8d-75f5-08de67aa29d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|7416014|376014|1800799024|7053199007|19052099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1YinOuGBNnbZ+yw4pefwZL8P+m1oZiccwloqxI1gdPC6JpPZrzGsXc5ozjl2?=
 =?us-ascii?Q?lQEWfR0pxFp4CGJMdC0PRF9ADJNxPRbWf11OKlURZ5/MBwNCVW1iPtD8+lji?=
 =?us-ascii?Q?ocbGIZgCCongkOl612eGD/tZcYlGW5VcYXzhaRL8TlJ8DNZoinZjXi/3zi9N?=
 =?us-ascii?Q?oH5mi34pR/Pha9JaSen3RfpiqRNZoAZjb1QkARdFnRB+w38dxliH6Sh5Z0Dv?=
 =?us-ascii?Q?f1whd2EPUj6Q8mNmE25jv7E1SrKhqE1omBnghPrPQ5SpRfcxa6w7/OdgeDzj?=
 =?us-ascii?Q?iS75xdSyEOUh6VyMEMbcbLd1AID+Aou+sFxPViuaKD7h0jJrhfrATf9Gp/tP?=
 =?us-ascii?Q?ev1RO82Vi+ol8gaRuv//4FvNtoHOBIUEJ6yao3l5n1mM/U6K6oSPrAipfxjo?=
 =?us-ascii?Q?VoMgkJY9gI2FFtxwm+hMJDa3HVxZ3KrPupwYqLMEBj1XdnRDMDmjw5s09Cl3?=
 =?us-ascii?Q?yGf1V1fdVbLmlIp+zp25qx9OZllm/m9wV0xMAbKnpafd3wI5WJQYd5BFWG7/?=
 =?us-ascii?Q?VUHijH3DZKCbkfyBln6sJbt49KU1WqLl/J81HWFhWzjVlbZjpfzBiRDm77VY?=
 =?us-ascii?Q?pZhj3LuLtXlZU9XUcSlYsxKSqFyFONKkY5uY84Yd7roEBlC56HYrnkZr4b3K?=
 =?us-ascii?Q?tu6y0LVj6sTPGj/E96BnH1HnE1SaZz3cd7IghgO16xvnt4fUL8kCJam1thME?=
 =?us-ascii?Q?AniEIFd4CBLl+6wE2uwndT7IqmV6OXtm+/zpNitHm4veh1FhBZRyxXyk5XbD?=
 =?us-ascii?Q?o/X12fBRTyCMD3w2aKltlQi1DGY/0rjWTeromYP9ntZJt/Cn/JzKnTiO41po?=
 =?us-ascii?Q?lvQeeY0dr/XFC84X6q7RMe9QqLk+3DXGOG853cpxMug5GYTiqn1GDp3Fw0tM?=
 =?us-ascii?Q?CtPfy9NldGo8vPDaHtbv4wrQGDBRyryWdACX1ZHcFJDsFg3e4l0h3tJWCcWH?=
 =?us-ascii?Q?TUPKtYsEZcnEtS0vUOcPNFuB/hvBIIEHmTC9U37RE09JJiMz1WYWGbUo7/sf?=
 =?us-ascii?Q?s+cJhRRDoSMO/bptKjLSAl+HhH/g7jX0YeUT4E2DR23lLINZp6m8Ucz3Picg?=
 =?us-ascii?Q?YenvdDUn9oeXkZuoIR8Xz6S60sz8wK05aCHwel2Hs6MLMQtfcdzTfG8FyTf7?=
 =?us-ascii?Q?fdGtEaQlBw7kpN0ACxSd4pcwN45qKAiRCznIAmJDG/eu35rvNpL09qoTKaKV?=
 =?us-ascii?Q?WTtp0SG/e+KkzUY0V1QvURzC5ZCojc5ZdPrJceNcAdFDm6kF5MRKK/tL8Sje?=
 =?us-ascii?Q?7V/eSkUcYeR/Ojy36EBc5ZApIZGH5uxR87iCyK+asc/X02CgvAhKfB55fYyw?=
 =?us-ascii?Q?ol0o46kv/U2UneglefwYdaUENKnBOY6swOTHn28qgYxKMvPrbSu0wnXw8a9X?=
 =?us-ascii?Q?TI+WQhXa7wYzBG1puMjHMw2eGf/dVI4i/FlH5tCSzJmU3bbNLfMKiTOxzOhg?=
 =?us-ascii?Q?q07rHfIyJp9rbzCV8qoeoCOOMLHGI2TWZxkPWV6+C4ffnONbFPjnZUc9Osss?=
 =?us-ascii?Q?VDLfSmgj3/p+cr/wqIoANgXCsj9XMt0rILClof35BdsfR9aRdxMBSlgoUZKT?=
 =?us-ascii?Q?6BfIvGXdnANuzwWXZKoCSExJ/irMmOYHIxD63fHubRkE21gWUCMj8HRRQyFF?=
 =?us-ascii?Q?1yg5gjQB9hHoe5GTJsdhBph2zl+nUs18r+0/NNrsFMOh8d9FaAd2JB82TCW1?=
 =?us-ascii?Q?a8iVGQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(7416014)(376014)(1800799024)(7053199007)(19052099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	IoI8Z4TaHBCYWMcTJSUEt0hdrUMmIOA+/GDKR3As5Zol4klOOQsDqH+sXchGhfg0SbjMKKJ9gmeLknVg/jTcSpIqNLnqMQ33lpUClJHBvRM9up3XE69OUUrxy9GdyRf8cWRw8L4HVqGx4K2JYNvoyXHGuXYKBKrIpMuXycbE/z8Mafjxurn4iUaa8PfSPXquPCB0uexEAxA5ilZy7v6VeDaC8oUz+FddjLqAPP8CONHlBKQ5tPvN63PfyhdAfSUrdnpgMq0CoiQW5WozD1Y/OgvLu0cjDHv9FjDxmtPlsuqqSLH/bD9wCuca9QexRHgo6zZLeFSMH79bKaadpP2ADvNnXJCRLqaa7HpxRuMSpddOg2OHEoNXHo1BTZO0+89R/jT4HX5Oc2TD/ZakfAWO5D9ynMZQyjcs3HIPAL/BujH+Z6iS6v54sQCxJ/SvE7ZQ
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 07:09:27.5760
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ec6cc3f4-3346-4c8d-75f5-08de67aa29d0
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF0000C37B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS3PR10MB997724

As defined in the MIPI SoundWire specification v1-2 for
Simplified Channel Prepare State Machine (Simplified_CP_SM):

* Figure 141 for the Simplified_CP_SM in the specification
  shows the "Ready" state (NF=0, P=1) that can be reached via
  "Prepare0 OR Prepare1" transitions.
* Table 115 (Stimulus to the Channel Prepare State Machine)
  indicates that Prepare0 and Prepare1 are read-only/"write-ignored"
  bits for Simplified_CP_SM.

In TI device implementations, we've found that some devices with
Simplified_CP_SM still benefit from receiving the Prepare command.

This patch modifies the code to:
1. Send the Prepare command to all devices, including those with
   Simplified_CP_SM
2. Ignore errors returned by devices with Simplified_CP_SM that
   might not support this command

This approach maintains compatibility with all devices while ensuring
proper functionality of dataport operations for devices that can
make use of the Prepare command despite using Simplified_CP_SM.

Signed-off-by: Niranjan H Y <niranjan.hy@ti.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Tested-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Tested-by: Shuming Fan <shumingf@realtek.com>
---
 drivers/soundwire/stream.c | 24 +++++++++++++++++-------
 1 file changed, 17 insertions(+), 7 deletions(-)

diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
index 38c9dbd35..33605dc83 100644
--- a/drivers/soundwire/stream.c
+++ b/drivers/soundwire/stream.c
@@ -504,14 +504,19 @@ static int sdw_prep_deprep_slave_ports(struct sdw_bus *bus,
 	sdw_do_port_prep(s_rt, prep_ch, prep ? SDW_OPS_PORT_PRE_PREP : SDW_OPS_PORT_PRE_DEPREP);
 
 	/* Prepare Slave port implementing CP_SM */
-	if (!simple_ch_prep_sm) {
-		addr = SDW_DPN_PREPARECTRL(p_rt->num);
-
-		if (prep)
-			ret = sdw_write_no_pm(s_rt->slave, addr, p_rt->ch_mask);
-		else
-			ret = sdw_write_no_pm(s_rt->slave, addr, 0x0);
+	/* For Simplified_CP_SM, MIPI SoundWire specification v1-2 indicates
+	 * Prepare bits are "write-ignored" - this means devices may ignore the command.
+	 * Some devices still benefit from receiving this command even when using
+	 * Simplified_CP_SM, so we send it to all devices and ignore errors from those
+	 * that don't support it.
+	 */
+	addr = SDW_DPN_PREPARECTRL(p_rt->num);
+	if (prep)
+		ret = sdw_write_no_pm(s_rt->slave, addr, p_rt->ch_mask);
+	else
+		ret = sdw_write_no_pm(s_rt->slave, addr, 0x0);
 
+	if (!simple_ch_prep_sm) {
 		if (ret < 0) {
 			dev_err(&s_rt->slave->dev,
 				"Slave prep_ctrl reg write failed\n");
@@ -530,6 +535,11 @@ static int sdw_prep_deprep_slave_ports(struct sdw_bus *bus,
 				"Chn prep failed for port %d: %d\n", prep_ch.num, ret);
 			return ret;
 		}
+	} else {
+		/* Some device return error for the prepare command,
+		 * ignore the error for Simplified CP_SM
+		 */
+		ret = 0;
 	}
 
 	/* Inform slaves about ports prepared */
-- 
2.43.0

