Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01olkn2083.outbound.protection.outlook.com [40.92.53.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FEB2127B72
	for <linux-sound@vger.kernel.org>; Mon, 26 Feb 2024 13:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.53.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708955150; cv=fail; b=QA0tCFnICFJgg4SiLzKE+0PLsvjF6EQsS9qbdzZjv/nbiPELzzBcNLMoyVQT8qPXht5sdfOWQZmWuzp8t7LOL89fO2vJwJKQh+fjlWCLgRoofbZ6A6YdjUwSfYS1UDRC8IGOQ6hsYG+F7WoI7kcsXO+sxyJh+O9uTHQo65YbCz0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708955150; c=relaxed/simple;
	bh=1aWwSKsMw5TwMd5H2pR0cwS7EhFKMuvcc9tAy5cnnmM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GuIZ99sIvF7Q2Mi03re5ExTFbcZ9Y4KOdaScn/79PWEy5cZ9wayf9PA+KrZrasRnhpJznuQ9ndFR3c7GUm/6xFr8D2WK51GTut8AxWAfY1eS/jN0GqQady8OQKLBSuboihzEHiEMBFESsK4n5810AH08jMrAsE1z37DXRcXTGo8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=FAY1NMe9; arc=fail smtp.client-ip=40.92.53.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="FAY1NMe9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jZ1jvhRm5L0tqUrQ49/yGayIj0rpO9SvYsXglc7n7KguFYvAh1cH9AKNFJ0DdMlEtq+oDxfJ5v3ZR7rvK99GIQmxtSxmdjvGyH+z7l01+XjBN2izjZL9CLbXNbBawyTxG8cQ6IAeDiyTyRviFh1mc7mnre9Cu90+5ltuxUtdfIxCY3W+g1fxTZ0ZuMyZXy79cdoRjhiNi5ZaKmFxHNh8f6T8r0T3JxL5G0M9DBtzYuqssmSmYvSRQVBUycJMXo2aprdmUvdcoynyJGkVLOxMgAs1PdWkLfywd3Hw9HRAWni+67u2I9ujnBhq2p7Zx2XaxmAWJuwwjT/4bh+C8O+k4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8S35nQIJ3YCZ1EgFsdactNhnOfQ8KC2fhjTB35GlD5Y=;
 b=WVl1dPEOWoLaJfppfsa0u2Td0YC7plLAo49vRnKniL318BF8X8xW78XX9DJrJaChfu5QWhEGvRAxy3AJNvXQpSczdLA6oKsoBdkVJBmcqNU8nYIa1TfAt8rlmDqvb6oEqMso0d4Xl6WwPtSG1lF5zO6jMqJg9g+MSb4H132tCbW8MYO3csGDjt2vh1RNDq+sTShqzDQV9B7a52UvKopUjfQRTYPaLGMILfFRj9HBowr4IOSX7Abr2Z5uBidSHNzceYju4oHPDDq8EztXjiGSVXpqQMI8rx2IvfVSiNCoFT3NzBHPDcCHGa4/SheH6GHdJa3eTBpknU7RXiTeZuawVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8S35nQIJ3YCZ1EgFsdactNhnOfQ8KC2fhjTB35GlD5Y=;
 b=FAY1NMe9Drks4oavakK6DOLS9hDYbCfrgAT+4Xy4UHC7M+s9bS52MOAxAWlXIRVqZLEZdMlQigyPDraV1ht7LWNzST00HUK5JxYBS/gzPejWNNuatAnxNCJXFvq8OEYYNGy+2t2+cWhsM8rZSxEhR7JnpLlvJB0ERxYxcoRLRLZI8PSAEwokV+9uSMJ6ZOWybGe3giQTsPI/27J8SAtfLpw2XKy4Zp/1hJOBv6C8Z7n2Q5kvhTF3U/0OJlEywyY58ZFcdvm2r/aJ6vyXRHbdyEi9wwiQZs0Kdudh31bFcWSxtxfEvUcXGcVCg+1pVT6NWlOY2dkNGxlkr4ddWTA+lQ==
Received: from TYSPR04MB8429.apcprd04.prod.outlook.com (2603:1096:405:d0::9)
 by KL1PR0401MB6442.apcprd04.prod.outlook.com (2603:1096:820:be::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.38; Mon, 26 Feb
 2024 13:45:45 +0000
Received: from TYSPR04MB8429.apcprd04.prod.outlook.com
 ([fe80::b04f:2d88:3925:de09]) by TYSPR04MB8429.apcprd04.prod.outlook.com
 ([fe80::b04f:2d88:3925:de09%4]) with mapi id 15.20.7316.031; Mon, 26 Feb 2024
 13:45:45 +0000
From: Johnny Hsieh <mnixry@outlook.com>
To: Mark Brown <broonie@kernel.org>
Cc: Johnny Hsieh <mnixry@outlook.com>,
	linux-sound@vger.kernel.org
Subject: [PATCH] ASoC: amd: yc: Add Lenovo ThinkBook 21J0 into DMI quirk table
Date: Mon, 26 Feb 2024 21:44:50 +0800
Message-ID:
 <TYSPR04MB8429D62DFDB6727866ECF1DEC55A2@TYSPR04MB8429.apcprd04.prod.outlook.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <TYSPR04MB8429E5883243B650AF86A030C55A2@TYSPR04MB8429.apcprd04.prod.outlook.com>
References: <TYSPR04MB8429E5883243B650AF86A030C55A2@TYSPR04MB8429.apcprd04.prod.outlook.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [uY4pwkDeEWfDRhI3MGaADTDk3eQos4eb]
X-ClientProxiedBy: JNAP275CA0021.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4d::12)
 To TYSPR04MB8429.apcprd04.prod.outlook.com (2603:1096:405:d0::9)
X-Microsoft-Original-Message-ID: <20240226134450.39997-1-mnixry@outlook.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYSPR04MB8429:EE_|KL1PR0401MB6442:EE_
X-MS-Office365-Filtering-Correlation-Id: 3fca5a15-62cf-4c49-6128-08dc36d13b03
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fAq2AVemsUoqCrYDWpGRhmAbJC6y/ynpG+OcMUWugV5uK0s6PBHy5BMO3kchvnW3xbtMwR3IgxWkaR2ItUjDDklyV08I0f8vNf5XEW07CstTJBW4vscyc2+SayBTcgpdD7fR5djS+AAmklvdjXZgCc4Scaj92bubAlxsW/6wrw4C3foiCa36bT8zg29jXkaJXUcxdc26BdiHsEd4ON7DOSbACePJGBjfWy+vO43v9WFQzZL+3NibcXVh/vNWuq2SJdznOB2OSMFmQZsjbQpzXqDHZvvgMAtvp/Arr0PX5cV2zTOqvMFBE8Y5BEcLJpOep600+zBGzyvtWmmdLzIOgxm+V06kK8VvgDnEovOSK5kGtL9pRQNwUkgbNINiXdLMFGQD6Ri9uRPLZ9eHsewTdIJ/sfvyON6Jk2Txz+q+gydP7cU/F+Mxgh2atJ6lkMhp+FAVkqvT2zyuC6RfP2C/uRYzzTewsQ3lfezba5Jz4Sp/rxqfAOwt8Qp9iuP9CXgjGmiF01zkPGTNK/WN+lKHFqxFdzXAfgT0RgznwOkxnpyx7NrsydfMOyN+iMCxMYYz/D0AhbPlG7/wRFSIBwfZXnNnczliU+Zdf5V48JbDYaiILrFYTDxDERkwLveJ+oxb
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+cUXitgPY7zS3u/42g9dgASAhQSJABkwwOSIFpBz4a1o41umtVw7mzxhck7r?=
 =?us-ascii?Q?qqlPt4Z3PPiRBgW37g/wiVT9xR77QnnF6dG/BSawdJ+XexRlbXpo15z0Q5fe?=
 =?us-ascii?Q?X6yWzX+CH6zcvzMvjazg4KtuYLfMRXVxoQ7ahzZR/7QuhKqJfU5ZaYNslrae?=
 =?us-ascii?Q?JIPAJhcKXBsZazKyNM7kq7jpdCJdmGxt7T+llu+6GVOzFYrs9jWSa/Pn8uL0?=
 =?us-ascii?Q?pBKi8J/A0ZREPMs2tj9zNBZ9W71DU9yS/rUowbR1u1rH4CQ3MI9PrIfRc7KZ?=
 =?us-ascii?Q?O4WX0hCmImWr7JrcIJR7wGVFp/ayOKd3EOnj2uOWPV+YCQm7gL8/Tte99/4G?=
 =?us-ascii?Q?c1IK7j2yphYYQDVtI3LakXk3b0LV2reT/Rjfy+l2HOUAsCiT5n1JQx0By89b?=
 =?us-ascii?Q?I68yqKCy/i28CdD9fC41ybE+YLMAop3ksZOkLyTR8lO+r6M2uTFGZ+X/oQvy?=
 =?us-ascii?Q?A2pamoJgDWnKBYA7VOZ0jN+yDs0eWwkz4c4WKfEqFnfkkTcDXeHeKe2ZFymD?=
 =?us-ascii?Q?aXa5jdCWyvPAb11wTkKNSwguxPpQZ5Sx2efS09YdoQ3Qm2j7nSL8cG5TuS9y?=
 =?us-ascii?Q?zokX9UuiWhZ6TwYzDbV5qCo8T9BYUBjs8TDuN+tcmCfCb8MVVuwrRqQao0BC?=
 =?us-ascii?Q?s8Rj1NIrTALllFghUz06c5I/IeFjvo+bUKEnJ39qCxCF9NZLmp+EhiqxsmhL?=
 =?us-ascii?Q?41UVQ8YSLNl8JfKh75wRxTP9B0vN9NoLr/OvYsupvIZUMxHToofbLiULTEVJ?=
 =?us-ascii?Q?BBAvOa6wUIaZY6y8F54Wwyl4Qdrw2U4mOYqI4PrDS+fvFa64znhLtO5zPKRN?=
 =?us-ascii?Q?JqyBRbWLncRPBN7pnMiChuwhPiGnSKHlC0RjEeHIbSFj2wT/LaxoO2yxDwDp?=
 =?us-ascii?Q?yG9nKd3Wuf4edDyaFeU9AgBaVof6GI98pZYdSy1uyni5+4ZshI6g8MuDkJxG?=
 =?us-ascii?Q?njemCYR4qfr+kHsT8HiBspwpV3lDlElW6k6LUYk1LIb90rq6h4H+WpT/HZka?=
 =?us-ascii?Q?yaqyavnBoz8PYwrfW8Ou8zpnpz/gtIn2aXXfkAMi/h6v3XY6182XVQvMPNgh?=
 =?us-ascii?Q?MD7DTxZ6Lam7SM1KqiMcGo80+r+AF+g/YHwBRbisWhroQqnCKtegGtMyW3x8?=
 =?us-ascii?Q?88OOWnI8WQ+c75dso5RRgmxvGE5qxOEaYQCv8KU9Qjo691H2wQz85BoQMkN/?=
 =?us-ascii?Q?IxEKbOdwXTEeUN+820l0r4MQHp4w656eMu2djNHnEZwiXd7K18YvFkdT6LA?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fca5a15-62cf-4c49-6128-08dc36d13b03
X-MS-Exchange-CrossTenant-AuthSource: TYSPR04MB8429.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2024 13:45:45.1782
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0401MB6442

This patch adds Lenovo 21J0 (ThinkBook 16 G5+ ARP) to the DMI quirks table
to enable internal microphone array.

Cc: linux-sound@vger.kernel.org
Signed-off-by: Johnny Hsieh <mnixry@outlook.com>
---

sorry for the typo in mail before, this patch is a fixed version

 sound/soc/amd/yc/acp6x-mach.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
index cc231185d..558719875 100644
--- a/sound/soc/amd/yc/acp6x-mach.c
+++ b/sound/soc/amd/yc/acp6x-mach.c
@@ -199,6 +199,13 @@ static const struct dmi_system_id yc_acp_quirk_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "21HY"),
 		}
 	},
+	{
+		.driver_data = &acp6x_card,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "21J0"),
+		}
+	},
 	{
 		.driver_data = &acp6x_card,
 		.matches = {
-- 
2.44.0

