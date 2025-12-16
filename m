Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011070.outbound.protection.outlook.com [40.107.74.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 281CE224234
	for <linux-sound@vger.kernel.org>; Tue, 16 Dec 2025 02:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765851301; cv=fail; b=qcoj6b13kRdKz2JR/dw2AZVVYG/YndxlQk8Kb0ZZZ9Hh+4A4ZNbopYRWFb/kwzZ88rWkg6K+1VBPzMaZleCTJzDI8+Al87AFY+DQjWIgunDfaj7e2X+LG/a+BT4K0NAbIhUCvpz+tV/PJW6If6hYPSUPrdeEHmkFIAztwy25fUU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765851301; c=relaxed/simple;
	bh=52pGof3TNa7pfx0ug2ydjjrwA0vZQqo12XdHK/KgY8M=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=A3GgfNj6bpTRLnAkVp/57uly+QZ7w8WB0kj8HREq/cZx2sAUvN17mvQtCmlADS2sR/0yEMeFCjDqhxDmJnVdV4p42IeNQjauPbl/L3tOCtfvlkMVGKzFWZ5he/GRp4ZCRlQA/b8uzIAnSNvjqO+V9ZdO5dGJPDjGwrriU3DLqeE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=AaIJ14xi; arc=fail smtp.client-ip=40.107.74.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="AaIJ14xi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=voTlEeRwsYg2A+fToovMiE3E0NUlu6MixCNwZJ+a1NUFM3FfWrs2kuypFc6ggk1ehz1mH6ub05sEJ/fJ76yjawi5VnTz8vIQexbRYH3bW0W0YM2ccFiqN5TBmi6QPm3BlQyFEFTxdPLNHXp/0w/9+anPYK/03sRsvePXS9guQUCMV8IC2Y/BCV5AltPsoNdFwWH5XtM1zWNfx7p9/iXPvWj8HFT+eWdghG8aozCn3hQX5beBUiWMMBnBKkXvWHwm9ln/fx1OzESD3Ar/K8Y8sSDrrVHyhqr5MIugk2SxNTKs4dDOe/+vzPePtg5MPewXKrVXLHvZTsXGFEkofwuIjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nub2GX/UtUXV0jzeIJ61m9ib2LEbo3At2Bak53b4xWg=;
 b=WqHG09iGYrVtJpNjVBo1eMDK3UXy3hr1ETGrnIokvmiA2xkvOkxbcQp1aQu9/y2oH7umSf1NaeWrr2CEtl4IR4GYbIJYitE49DYeCvAsRhp1xmt4e/KidGZOWjriweMdCfteBLzUA0dQbLw3OyzjbzY6LR0dUkTW+xNYm6KAjrk5H0fYW3g5OXABPntmCaEMvLGlvTDhqCv76aG+h6AWTp1XqoABqOnYkQx0kjSEyLwu0uYStka7kUx4XGX/4+rM/wjVdrb1Wd1ACub7rbOwNsYrkpnfEtfcP669coHve4nNoWavz+3onAMz4DMf9Y7Izvv7i+0+XpFaEIbIY4DxpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nub2GX/UtUXV0jzeIJ61m9ib2LEbo3At2Bak53b4xWg=;
 b=AaIJ14xi8zbfeXt/rYHH7RTBmIt/uHkJq5aFFjNcs9q1lzO4Zm/Q9OBeVl+cibS78AoyRQ+sKiI266eXKyg+yheFrRDRo/X7C0YNaQFwn8omhAgZ4HVVvcVWhdSS8x452O9rDmG2xeYSn1D0f0vemMZUU40zL8MwFqYdhtswi10=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB8637.jpnprd01.prod.outlook.com
 (2603:1096:400:13e::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Tue, 16 Dec
 2025 02:14:56 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9434.001; Tue, 16 Dec 2025
 02:14:56 +0000
Message-ID: <87tsxrrx40.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 4/8] ASoC: soc-dapm: remove compatibility definition for dapm
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87zf7jrx52.wl-kuninori.morimoto.gx@renesas.com>
References: <87zf7jrx52.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 16 Dec 2025 02:14:55 +0000
X-ClientProxiedBy: TY4P301CA0072.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:36f::19) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB8637:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f523cd5-cc75-435a-50de-08de3c48e7db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9Cobd6o/PobPnmiuMQR/wjkn3G+ER1h3gHqwgSUc2gDYjbMB30t69kW/GAJm?=
 =?us-ascii?Q?1rS+0Cur/7pARkNtGrbpPcAkD64wuRD0oBW3lyfpXUK8Mmop7DXnaSlLiSVx?=
 =?us-ascii?Q?1IcePJocHEtkxDpjLXEw94UQb4fWWeHpxvl5/I2K7aiGbSdRGOc6tW1koo+3?=
 =?us-ascii?Q?SCvxdhPCelgBzLEtTIY4R317cKBc54KY/nrnOZDq1RdgwlvwqWOGBPTDF+rt?=
 =?us-ascii?Q?lz/Jvos1A4XJzjOlKiBUvCPOXIgdH3GUDrnwDhZjjQOFeYEs7hmumIpR2Wg+?=
 =?us-ascii?Q?l8u2TZFfPHnhdlAhxiw1MptSkCDWQ63a+begoc0K39Tsd+iCW836YlV8RG/+?=
 =?us-ascii?Q?fAcCPgn1A7IXmhnnD+9udlW+7tgIyLCtCyjIrOQNDWcLna6qjP3iPIhAaFu/?=
 =?us-ascii?Q?a/tnkVPG4gonSFPubbIxPYPEVahEBNwnXHbrkv5+s0zWFCHu8a+pfBVZgEbU?=
 =?us-ascii?Q?byOX3fuCqocP93uSj/p8Rdyh1QDep2PGI6MitB/lDMEyUBkJhqWItLv/Rm91?=
 =?us-ascii?Q?Ow7Q2ZEE2YuKbsPbN56LsuMpcy0sU4C6X1l1PaaqcVqD0y+nU8zZAzo3D4QH?=
 =?us-ascii?Q?tI39uIpK6ZRaaghzDNUIokfBPKXX892ep1IkRQpT5i/BwVbkLWzxzBW9iF6h?=
 =?us-ascii?Q?TJCQ/etoppo9nxv0pJ4ruUgwKzp6eZ76t8VT9aRybKB/qpSoah5NWE7hWorG?=
 =?us-ascii?Q?KLg3Q4RdONdaFAi90vGSdEZyF68Y52m/IWfXW6k24F0YAWkSS6MQ+PCYemLC?=
 =?us-ascii?Q?35RFdYnu8oVKMRkZj8Iis/RuXgFCQLF4QQmz3cYeAsEK9R7GseX6Oq7UO59P?=
 =?us-ascii?Q?OHK02XANSLHYUBlwbb8i3arZGKEkA666p85PrMdZWbtUwXYY6mOgd7Fx9ytt?=
 =?us-ascii?Q?8TO7tpQKehAK/6oHp3DaO8zg/wAp7/fl1NVyz3S8tveLTrOgEaRWFWD0f+WK?=
 =?us-ascii?Q?CACvtr228eS8nIv0z7FBnis+vLbVkhVT1t7tmkrWbkVCdLTLUjEOX2mLknR1?=
 =?us-ascii?Q?DcaRuTm2Q0GbMDQ+mK8y8IaXlo3kycT3JsHK57cq602eyAC7UNOPqzSF7mdz?=
 =?us-ascii?Q?WP9lySJRKi5uaD3MrmlCL3GF+RKqUDMXIXxbPhZNA0NfufsscCMciRBfvR60?=
 =?us-ascii?Q?o8XcVZpyFf3rzYZdX537ee6ejukrHAcvym2Lg1GQQYsREwPE1CObqszZWKfV?=
 =?us-ascii?Q?MT8Oi1dtG3aDo3f8a3pZLaJ/+bKpXtSoquuXPLeDvEb3gzB2zQ2YoFt2vjde?=
 =?us-ascii?Q?aiG/UH1tz//8juYlakhokKK9xYSiW/K41qTk0u8Ky2fxYk087Ow6WuSCzLwY?=
 =?us-ascii?Q?jx2rvRLvBpzgondsqLjF7MlpEYje+OE3kRt0z7ZeOqQy9uS6ys2L5UNiEMYe?=
 =?us-ascii?Q?Y3QceKIUdOWtXraD1xzmWKIyTD/5lGmcC9MPzC8+5W6seaBPcPheVUwj6OY7?=
 =?us-ascii?Q?mHthATKDcRE+pUcuD0jq5tKnwWUizeRphQnBB4C8mIijHJ9RvkzSQdHXHJvC?=
 =?us-ascii?Q?jk66HBLGEs196pV7zjen4kYeig00s7imhJcr?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Sdqs4nPoUufJ8ximaa218qWbhLT5qv1rgeoZwdH82rJkpBAOxJp71YIg3ijI?=
 =?us-ascii?Q?anO0wvGxcSDrRzQKSrUgfv8ncCmDs7bONnr3BmXfydbtXXOYVWkSEwa6JGcK?=
 =?us-ascii?Q?tyhPLOs7Pyu5Regb+8+ePugQ3CNezDiWM7kg7/eEaP3CkjMEhf7U2A8LK3KW?=
 =?us-ascii?Q?Ky0w7qhLJ5DBeNs3ri00XzSg+YMBFH4cxMaVncmJ8SUCvhOnXXEUw82Y8PvG?=
 =?us-ascii?Q?syB7dVYzOJ7q4RAfqxr36xGcY4O9rj3QVVtkUgFCCxLH8PreC9HRG9Gp6GOO?=
 =?us-ascii?Q?ZxLZGGj4QV4Qt1DyOrnwtfeH/X41WWBrbZeI15/23dIA5G73EblNJGI9gpHs?=
 =?us-ascii?Q?WkNCPGoRYKzb/HiF7asDvM+DIeXm8nIOOqT+f4gYSEVsBwl6neHTsg6xb5p3?=
 =?us-ascii?Q?VEQhUMHTVJKL8sAMspuziAXjJGv8xONzyDougFZD4dVZo9ly0eKmzokYbC3v?=
 =?us-ascii?Q?SbhRXswm3i8WtQezcgZtspMjltNBrdJI6cHaGINYc0X1Hzrl9DjnTMRqfuM2?=
 =?us-ascii?Q?upc9aTut606tuXfkIxx7mOkH05rGmu8Aq7ky4jAB8rIkLWxwvH72u3ZkFCEU?=
 =?us-ascii?Q?ur76wuhtTQA2D+W5UIXW8HvzDMrulN5J+einPmEBxSu2VRrTxbANtPOMSjMb?=
 =?us-ascii?Q?SPCEiQtqw2yc42tjc4bXYtJq+ubDLusznG4+ysFMBWnf5vHIWbUYft88aBDS?=
 =?us-ascii?Q?g9FgwDpH3ks/F2mCPxHsVyouuSuWyTcAi5AzPm8mC9xrQZ5X99mhtOXrY0j6?=
 =?us-ascii?Q?A6hj5hH7pZcJdAQAyu0eeEZ8fjJqu6EjEur6h57CZEH7A8tCxTgdsP4PExbI?=
 =?us-ascii?Q?EkjgO79wqnlTCl1aWAcX5QWfiKj4/vE5AESe/xMJjYxi5hgv3QM5LpYCQJEa?=
 =?us-ascii?Q?yqwCxx7G2NuAlW7PIo8wq0noaN2V9ob7OoyB5jiTgsa7L98yUzVeQvP8Ib5q?=
 =?us-ascii?Q?t8PGm9Bk5TeZzaCbENVZWRg5D8zQhiAwkhGkBtGWh6p7RbqW8cUmkaAIRTVC?=
 =?us-ascii?Q?2Hf8IWfA9FKBQt/kW0766OWjfSuQcmAgitzCtXEAbQhzQgJFRrCWu5ypwtqf?=
 =?us-ascii?Q?odttirT4CXcdxgvj6sn6dKchJBBpVuIDaOVMYW7ERr7GbB4mMO3LnI2YXOK6?=
 =?us-ascii?Q?rTFWIGBMA4w36+iL1HHQIkNWnF9XEuNnSMUlwdnZmnpVPtgf7Gt86Y7HWv7R?=
 =?us-ascii?Q?3d3SWjYVqOy8qzeoZiaJqIMWUdbFoT13vK0xIa1rnV2y3J6Y/l8UW4l6fXBZ?=
 =?us-ascii?Q?GhvWewtchtZR/X+n2uwK/ViwOALmcRS13gs5pvqVr5bxXiDruX6iDEU2Povx?=
 =?us-ascii?Q?4kBubOzUyi6Peg4VFLEH4Vs9qex08ZFBjWuQoqXG299i7ZEDyiebSn9jSJo3?=
 =?us-ascii?Q?aet+lWn/0nwyXzJZ//obIiecZUeeMiiT1hpo9XqP5JExjQlaHkgbnvn5WUz0?=
 =?us-ascii?Q?1477hpkXYlP5kPTThg45cFhRlD1l2ghqBfWcAnNowLovvqoMUwT64LtK6zwb?=
 =?us-ascii?Q?NJVH1EiUUHjEtUHkXU8qbW1kdw41SGK5xhaVo0I1OHMBZLSBTSnEPLNVcNVU?=
 =?us-ascii?Q?pEvm2c1zVZpM+ReZWL15lPyCjkyytQMAHq1uCsag0PHSj/SYzy1wIPLhVCc2?=
 =?us-ascii?Q?ne3kiq9Rvuak1firrez0LRk=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f523cd5-cc75-435a-50de-08de3c48e7db
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 02:14:55.9567
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6iPCPauE8sx1SSSpAlVu6ZhFNWUqrcxp7mhAqZjet5V9ivZU9aCAmIi97o37LXf+813X9HXasybGNKiUPHQL3I2stxjAetrqCSegJrrjrwcL7kK7gZZrpfGS5M8QjjLD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8637

All drivers uses new functions. Remove comaptibility definition.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-dapm.h | 19 -------------------
 1 file changed, 19 deletions(-)

diff --git a/include/sound/soc-dapm.h b/include/sound/soc-dapm.h
index 75941324886be..7d3ba38260765 100644
--- a/include/sound/soc-dapm.h
+++ b/include/sound/soc-dapm.h
@@ -705,16 +705,6 @@ int snd_soc_dapm_force_enable_pin_unlocked(struct snd_soc_dapm_context *dapm, co
 int snd_soc_dapm_ignore_suspend(struct snd_soc_dapm_context *dapm, const char *pin);
 void snd_soc_dapm_mark_endpoints_dirty(struct snd_soc_card *card);
 
-/*
- * Marks the specified pin as being not connected, disabling it along
- * any parent or child widgets.  At present this is identical to
- * snd_soc_dapm_disable_pin[_unlocked]() but in future it will be extended to do
- * additional things such as disabling controls which only affect
- * paths through the pin.
- */
-#define snd_soc_dapm_nc_pin		snd_soc_dapm_disable_pin
-#define snd_soc_dapm_nc_pin_unlocked	snd_soc_dapm_disable_pin_unlocked
-
 /* dapm path query */
 int snd_soc_dapm_dai_get_connected_widgets(struct snd_soc_dai *dai, int stream,
 	struct snd_soc_dapm_widget_list **list,
@@ -730,15 +720,6 @@ int snd_soc_dapm_force_bias_level(struct snd_soc_dapm_context *dapm, enum snd_so
 enum snd_soc_bias_level snd_soc_dapm_get_bias_level(struct snd_soc_dapm_context *dapm);
 void snd_soc_dapm_init_bias_level(struct snd_soc_dapm_context *dapm, enum snd_soc_bias_level level);
 
-// REMOVE ME !!
-#define snd_soc_component_force_bias_level(c, l)	snd_soc_dapm_force_bias_level(&(c)->dapm, l)
-#define snd_soc_component_get_bias_level(c)		snd_soc_dapm_get_bias_level(&(c)->dapm)
-#define snd_soc_component_init_bias_level(c, l)		snd_soc_dapm_init_bias_level(&(c)->dapm, l)
-#define snd_soc_dapm_kcontrol_widget			snd_soc_dapm_kcontrol_to_widget
-#define snd_soc_dapm_kcontrol_dapm			snd_soc_dapm_kcontrol_to_dapm
-#define dapm_kcontrol_get_value				snd_soc_dapm_kcontrol_get_value
-#define snd_soc_dapm_kcontrol_component			snd_soc_dapm_kcontrol_to_component
-
 #define for_each_dapm_widgets(list, i, widget)				\
 	for ((i) = 0;							\
 	     (i) < list->num_widgets && (widget = list->widgets[i]);	\
-- 
2.43.0

