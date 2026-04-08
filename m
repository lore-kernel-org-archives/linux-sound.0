Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010010.outbound.protection.outlook.com [52.101.228.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6B8E270552
	for <linux-sound@vger.kernel.org>; Wed,  8 Apr 2026 05:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775625732; cv=fail; b=X1hFmMl7EjDu2PXM9N41428GqoYkVlpwz/BaWBpiWBSztiCRzwdfLVWGuX5F4HkmICZBKf9DlnfJZyB8p3xqUEHPp3L2OIvXplqN47zhS1l30ui0WEqubkBE/LnAlSbmxYKT8L2z7K2Kzkj5q2BHWQI+uRpBI/jUBRwX7J3ITh8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775625732; c=relaxed/simple;
	bh=STx9QpQl/nB9YErfjQQpczm1DcakmLj8tsIW/9A6xks=;
	h=Message-ID:From:To:Subject:Content-Type:Date:MIME-Version; b=rJovjGmW0pjKVNUW8KKbmo2SpLbPjfgJkPd7L4Dd6H5y9x9Diy4kZsoVjs3IiHRCDw3KGi8RGIZFNMHypGvYiga5JWFcfge+k5CEraGy5/GGMog3NluKUPFhE69dq6y177s3R7pz0f2ysKgJs96pGt7eB2GTHaDZU+fS1DLYsGU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=nhvHJjZX; arc=fail smtp.client-ip=52.101.228.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="nhvHJjZX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c0ZSTyjMpoo/m++NzKMmJloNaJtKOantgH4HSHw1Z5F6WWnxnpkTvSr3S9NyE3jdAso7TRvmRS3NOyX+71TTK76jEQ+ddsEskxpv/EXfLTw37n36sc8Y1B6PwkHymuSlNDsVtXQaz0jgUz60u5yWflSc80a7fFBNvxxMuULx4C205zxfGjvMcndIgU1JRa8Zj8MOtfNcWLZ4C3NcB5X3QC3onX/KEpkaa1U5ZFCyLtuL1zNBCifxXLqNeiLpg679eSE+QflZNA5/9KyagSFdaIXXnnC05/PyXWrY0Tp0fdo7T9iYX2ybCWlxEUAxiKx5LXaImPuMRV+ej85GmqXqRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D+RKeuHYJ8B7LiIWg3Dtn0SEq0yIOcbSz9gp8B6zDqI=;
 b=RdXHXNgW2boD9b9kzhbQuJMW5SAoAZWPcF36ULE5NUyonhMVnEG00mA3d6dfdyU+PPfsgg1V+1B6qMXQM521o+XSlu4vDjoBfcbj1+GCRZfzmQylEJ5krSoMnhEvcTWRxoTLgToW4bSFNr3fxKF1pPHr1nUPZZsIUo601kvqCnMMN9eDjoSQa8+y48xN8Y6g6YZpIjlOf7TGJ0O8v5qP1IndbXWT5dNKy9mEKLPxnRra2GFJEVRYqmygEV/IVYZ1Pk7CdOS0p5Nj2r8+Vk7a3O/oq+UgviMPVq++gHHbfotJab76L5XELaWZbJ1MVHkbTYnbwtvZN3fBEMypixNdcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D+RKeuHYJ8B7LiIWg3Dtn0SEq0yIOcbSz9gp8B6zDqI=;
 b=nhvHJjZXNa7tu5gqbyIVhfqJjlCyseYVNxcHNb2d8ZibUNm10PupemWCOVEl8HVdTZ2ACnIPDW6kNfbxex5aIw6Ib+35yTTrGYN73MaqueaH6pj3+VQZqeQI3932AzkuFHv8MgtmH9b9h88hsciqPAwaF/IfnnCzrV7po+O+uMk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TY4PR01MB15455.jpnprd01.prod.outlook.com (2603:1096:405:273::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Wed, 8 Apr
 2026 05:22:06 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.20.9769.017; Wed, 8 Apr 2026
 05:22:06 +0000
Message-ID: <87h5pmvxfm.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>, Venkata Prasad Potturu <venkataprasad.potturu@amd.com>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>, linux-sound@vger.kernel.org
Subject: [PATCH] ASoC: amd: acp-da7219-max98357a: tidyup acp_soc_is_rltk_max()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 8 Apr 2026 05:22:06 +0000
X-ClientProxiedBy: TY4P301CA0020.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:2b1::12) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TY4PR01MB15455:EE_
X-MS-Office365-Filtering-Correlation-Id: 4faaf8db-00f9-489f-cf4f-08de952ec665
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	zZNKtGOPdPf4jbqy239eiEk5sZ7dRUceYwAfY/37FZTYmpF29xiaISQOISkSNJqvKXjjbE2tiV/eBpejJPBf5j+/dqJjnS5TwMrPkf83I7K23adhOGyh7ro+5KE9g5ejKYBRhNMN6RiQPOpuqeDm/w7PwcFsDlr5jAMKdfAq1STiSIJGdJhyTtcv6P35ozE7R5mng7FO4q9ztkCrTln6wwZc0aL6fB9hMDYwVCBRsIDlcd1CFwJjv4hG5PFt55I/k3H3RxQX5KsamU3kMKdWjjvL21E9fXWSM59vkxbAoEDEyKZ0me8pGlrzjCdxrz5Tp9lld/P47d2G92JQIoDsPhVTM0sa93RPteM7na2ylw+FwznyXjXzFzetIVWYfxtVIvt8Dm+XrA5iom/TTQOy5Y6b5pEcipGacYVDNdWYgaFCobwUYEwOpQ85xxK/oA1LKaZzw66k7QEjlgRkErdsUXMf5Y1rBWpfq3EGOIKkGfY7XYvZ5zBAnJDwGRK9ecGidmitRxdWzWL6tnbTjipsUDDS7kHeJMNLBbTm0Gbz0JqnCF8+aVZ9CZPNG07HRu2ajIZYOKKsrazlo3FlnumVylvJf0qXGGlI44htbOQKx1+EQifG3a6t3c/WZ8IlwKqZa1fg5bbBnyj4NDr8+nq4RSzzlZuXwKcxN0xREgSLWPMy7x+XXcZTMZerj9K0gVhC0hmJirmNKgTKTzYzvQYLGrxx4DsS6WRyYCnab1+lYtpOwgyKHVJFfxjjGEKfldxpuoJsgXMuvZzVZ5x5zBvSHG3v2j4z4AmDR59hviSSTBk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?FIz7lu3YoQ6FevETE6VziXXfl1+h5+m8kW19VNbBw5iB+owKdLLfr1Mdsmox?=
 =?us-ascii?Q?Sktc1gvHUjoaHSKm2i+eEO7opy/mpvVqcexiiC32INEyR6SC/ZGKKykDR1FC?=
 =?us-ascii?Q?VE68WrHYWVtqnGZrWvkRgpuf4GEYgXmU/K9ySVOVnNl6G5eG/b1ekhoawrrP?=
 =?us-ascii?Q?1sXlzmISNj28fc7ehQqtncB6AOupufpZh8CyvE/BYVAPTe65ab20miTAwY8f?=
 =?us-ascii?Q?Dhnxj7Pgrm+UJJ4tVwhbYObCEyak6I+4Ep6ib6OmLrC/Lyn8MzAx1CvQ3y3X?=
 =?us-ascii?Q?6lERL011hT/ALIHXaqe920UZS8buCBHIs4WCqRx3CT7nyDtlG9dPTb4ur4xk?=
 =?us-ascii?Q?58a7OZF4RK27t1B3LES6RSNeiOlS8h7uZ1he6NfWpU2CzB1UGLup91YzPYVG?=
 =?us-ascii?Q?Tf3YOLSlFyUgX0VGB/4BV/3MwXet+zfA03LP7dvrl+X+s0Ss7KCwT8axD+Hk?=
 =?us-ascii?Q?kw3DFDv2i2YUMGWL+jusYYQQatePb9+syznnVQ85RPa9JS44l5LMrBX4nsjg?=
 =?us-ascii?Q?iJYQEIeNW2Y0IQWvrO5WUi+vFAYE323kUxRSBOu7Iiuqxkk2pVnC6050H4uU?=
 =?us-ascii?Q?vCz8iuni7b9hBa0UTmA2LKzwfxISMh5vJwXAb35d10kGhuTF4A+I8CDT21x5?=
 =?us-ascii?Q?ImQaISr0mbnI9UUcJWdmornnacyQpotzglHZe04r2VXKSV9+VTkMPrULM0Wy?=
 =?us-ascii?Q?pfJZvStyndkNQSHNlWtayKkZ0MIhce7CKbOhudnvO8IOvn7SKXUvXrzMOH3D?=
 =?us-ascii?Q?B6yrVVkW4tX6/F5VX0LToMB96sZ+GTB0fJFXmAHJ9wbp99xyPmD1iJBhsTnc?=
 =?us-ascii?Q?Ch1YJy17bgLkCuWuVwxYde/FPqtpROCFRUjxy/OvZ7bWNyiqYL3uXwEXL/+p?=
 =?us-ascii?Q?elxa1RbgXSOYaUZgBjZ+idgQJ6+GWkLyS5m5cc35SPYNGqQMTG/OuK+6yAs8?=
 =?us-ascii?Q?G6/mhhXHrb8cWAYPeLY/ujUn+8xTQvLwq/oHnTYAR1KlaS8VjriAEs0D2Tvh?=
 =?us-ascii?Q?0V31Dd5wTLIoO+fMRT4n9MlDAJ3iUwf82imDp8JX++9EV6ErjIhJX4z6i7GP?=
 =?us-ascii?Q?VgqzEN+RE7OmazgrP2H7jCQezxZdU7+NrEq6arzTRKtf4CSQz9jWHqIALlIF?=
 =?us-ascii?Q?fIG4tdYzvuG1cQvrIOx8AiWTJ5rLs9wIj8IHNgNMhp1O9MpMrdNxdwH33K+C?=
 =?us-ascii?Q?pslcvNvoZ91q+NA+RJ6ZrRtc69lZL4AI9RR5AY1rWdOtw2UUOFmqC+jEVT+7?=
 =?us-ascii?Q?mZp+AMJfQg49+lwf4p3inAD2VmlCQqEityTQ0LSc7yGBR2m9U9E0kmei7Lzb?=
 =?us-ascii?Q?nNqEjJZnbnmY2tMts9kk4wsfd3VBKBZgKN0KpvzpGwU1+WIQ87YN5A19vz78?=
 =?us-ascii?Q?5CUsVvywJhfgESPeYPVJfdZvhie0D1/J4u6USK4kKUtbJTL8BoPgjYjq3pz0?=
 =?us-ascii?Q?TN2jUL9HMKAukPQPI+AFWixvcOyTKY9+vJmHhoj9bANMoYI7oleeUOUssNZd?=
 =?us-ascii?Q?AdnqYWC37cnyx29/RfkfS4qqjJ0+G5KOprOhdViuj3FA5wTMSPuzZx7LJOy9?=
 =?us-ascii?Q?KUY4QLTnr9D4U0LYNdoIAXwseWNtMfoCGKvfci84cCmjTDEYN6b758agh0ZM?=
 =?us-ascii?Q?c/egPJdbsbWG3RoHrpGLc6whHnRWlaXxrHzyEEZEInfMGzrFsJkftB2rM9T+?=
 =?us-ascii?Q?Yr0eV2xP4JWVf7GWZoI1VEuFht4mIFIhwd0YHOxGDrhAxWJXCtIt+LlQvg/A?=
 =?us-ascii?Q?wNhHJ5Q685pxPCuTE03+XD9oacgMp0ygzY8+SLSwf+SPalTUEDNw?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4faaf8db-00f9-489f-cf4f-08de952ec665
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 05:22:06.4239
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4JRkrnt+78C6/cNj0lGBdC/PTE3gFcFTCzjuDss6pwSsV9wlPvubi5+TGVU2lnq5wPDJ2/uzZohob73OGOIOxcai0VGu9YdX8R2RoONmmCSAaiwrMgkQXpq28wORjKXo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB15455

acp-da7219-max98357a() user exists behind it. No need to has pre-define.
Remove it. And it is local function, add static.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/amd/acp-da7219-max98357a.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/soc/amd/acp-da7219-max98357a.c b/sound/soc/amd/acp-da7219-max98357a.c
index bc493e47a9a64..9aee80ca97e04 100644
--- a/sound/soc/amd/acp-da7219-max98357a.c
+++ b/sound/soc/amd/acp-da7219-max98357a.c
@@ -47,8 +47,6 @@ static struct clk *da7219_dai_bclk;
 static struct clk *rt5682_dai_wclk;
 static struct clk *rt5682_dai_bclk;
 
-void *acp_soc_is_rltk_max(struct device *dev);
-
 static int cz_da7219_init(struct snd_soc_pcm_runtime *rtd)
 {
 	int ret;
@@ -705,7 +703,7 @@ static struct snd_soc_card cz_rt5682_card = {
 	.num_controls = ARRAY_SIZE(cz_mc_controls),
 };
 
-void *acp_soc_is_rltk_max(struct device *dev)
+static void *acp_soc_is_rltk_max(struct device *dev)
 {
 	const struct acpi_device_id *match;
 
-- 
2.43.0

