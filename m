Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011023.outbound.protection.outlook.com [52.101.125.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 472EB15E5BB
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820502; cv=fail; b=bh/31wBwkN8UOMoP9SasxKGvX+a47md+nu5bpG6iYcUpV0xC7rtDt/l/m00xsmcrKy9WHXk3iv8usEGX60NSnRkh+HPKlwHNO93+cJw10OV47xYrL2aAVZdmXjhLrr89sSq27Qa/0qhwf0vNpR6YYvi5BMkTD2tdQJH2AnwggjA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820502; c=relaxed/simple;
	bh=eZxUbamUyG/X1g8jWryjaQ+S27tMBBDXyMlNbGVzIqY=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=RtnTBZXTu0C+/egKQPC4BBiBWzH8EJAeWuOA9FkiEsAxPBhZmWL7wgaFRIa6uI1wSVDhHN+ADRlP5+jhmnbUxcRK2noPzDqY7ihAiEUGbC7H8ZKw5OpiqK+abn2CkSqN3s/SyJG4JKTVflJoaL+yQ6vh8Q4Y6aSTEIjESo/fc9g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=UMutYKid; arc=fail smtp.client-ip=52.101.125.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="UMutYKid"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Irll0KU42KpDZ29TDX3M7cupESj9PzxZvaPqRKc/UWbYDBFVjcPdOfwE6uJ6qSXBfZ6i3AURbtDT+V4D/EyrWgLvowu8fNsYl5J/a6LiQF7yX1ElnkofcFCd3+2aHBdKpxRFnv+wFzwN28o+XxUHYKc5LKGmAQJ7IWPhrRw0s4i3vB3C4qwzDCYolYGuY/3AcwU8JE/C6A24a2/BuLSVS4PGBa8xJJgxmczA/GGwoMOrLPCv6xtBPNbsgiyvcUpDY80tRU+Ilj1Ee+DczO7gqPrOY6nSVT+dr6ly7OubGopuSN7hxgtZIRtb9iOp97ZOEqaGI02b6e6X8rVgSpL4cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4kaJ7ihJ0tWw50eh3RMgdohsXLw9AJJwLuYetunDhP8=;
 b=doaglqKMZ48ZH9+qHDZd3wGEj9fGHpDP8qaReGbr9Vu3Ekzlq1+tR7IZ/PJo4K7I2/Baro5ncu0TjRRhGkRCzP64Wwq/aK5Tm4frdbMYw+39/LraUxb3wDpqwTSFJE3XPks1OD6CK2RCw38MAdIRguj1m3eJY65JN9w+c1/4YGW+KrJTASJCrDqAsFD4ks3TDH4egeCkRxNhHpZsmq21bUTEV/Mqn514tMwLfrR251lRVGya2igLH6slS7ahXiWdsJWCFHS7zAs3z82MoK4OHoiNnPrH2Sv9iNSXJ+vModFLi7KgjZE68XpXPgchXPqQ0J3i08fsi34LLUzb+wtx5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4kaJ7ihJ0tWw50eh3RMgdohsXLw9AJJwLuYetunDhP8=;
 b=UMutYKid0Ku+iaP/u5soVvKKws7ovkyNjV+YeZnvs9r9IqyKPuWG65EshVDPlmYrkVVt6JZUdKxpgNn3YYogcy0jxdiBPUGszBkHSTs8LUH1SqJp85FttvzGLErPp36zKKZWkZ4bj1WRaqRd2NF5TzfHXBph3B17Jhm2xK6yPM0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSCPR01MB12802.jpnprd01.prod.outlook.com
 (2603:1096:604:33d::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:21:39 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:21:39 +0000
Message-ID: <877bvx771o.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 053/292] ASoC: codecs: cs2072x: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:21:39 +0000
X-ClientProxiedBy: TYCP286CA0139.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31b::7) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSCPR01MB12802:EE_
X-MS-Office365-Filtering-Correlation-Id: 87f1b0a3-cd0e-49c5-4931-08de20b84878
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QStHfZr6bgnXPS7pSTOT21oUlO5p8/RUDWVxNFSHu9odDnSncrXFM6SpwuMp?=
 =?us-ascii?Q?kQztssClL3i7wi6hoR1P5Fou7J+krUMKpXSaDXtNP46MHGuMqkjT0jGUuxBV?=
 =?us-ascii?Q?BLlJlQUKZgQcqJDylgs0EEbHMnOM8L4KnBt1BoJHX1ibxwlJdORTE8YMD7Hd?=
 =?us-ascii?Q?wad/Zv6liq+0A+E63vScFxblZVvUeAXNakhYk/j9DL9K4qkyX3kGfN+SXVa+?=
 =?us-ascii?Q?u6FNB4xAk1y7iD5xy4csA7EwLKyVwvPiD0q9gZKKZl0LYbcBZcSTr2GCvmjw?=
 =?us-ascii?Q?ex07SYHDR5m8ymKHRDZ5ZHjclQVgHibBw/U+uI2i6tSYQB3MXp5lSI+tBrIh?=
 =?us-ascii?Q?GVQ63Az+x8vbCR46o4MtFCE3dZZ1tx1Yxxrh84Sq50vCN1ipqRjYQmUdsx1+?=
 =?us-ascii?Q?xjvUhT78NgB9vm9OVvqY5T54PF3My2aVGEEKnO9W6PjkTIDo9PzfbKLYcObN?=
 =?us-ascii?Q?B5g9vhnzXV//KFQ4OwWxniV51d4vPfxMMZOAUb5ki36GJhUOzYULZvEIMnh/?=
 =?us-ascii?Q?LqNxIs7xjikHcCCRbyWhsM4D33V+6I5BwNs1ZgVj5o4ebjpdI98pqNe7g3oy?=
 =?us-ascii?Q?y6Me1wjg130mcFsUHEeYu79eS+UKUTjqg3jHpyBmucd7IIob435XbLsIs9D6?=
 =?us-ascii?Q?eawKwVaJe4LVpgLXrj4tU//La8M5wtEyiGLYsIqXbTofuqU8WGQNa2dAXUfX?=
 =?us-ascii?Q?T60mW0TD1gRi+i319ylEo9oIX/EYL5cgbMK0iZRXwzVuoNkD/TEojAKuB/pt?=
 =?us-ascii?Q?dDKPxtlGyl7iWg/27W3g73Nq/P/ZhfUoU234/P2iReFNElI8pQrmtgRSRyho?=
 =?us-ascii?Q?GLst22o632ynaXqmK1UrKX41cdMGDWgdWXNnBXbu6TjyIqlh4x6ZhVxlcWca?=
 =?us-ascii?Q?RGLsIYgMJKRL1+7pb180XfgL6O8nARfzDp5tD1F7cHtxhNLl81wRJPpLvR2s?=
 =?us-ascii?Q?HQyW9sk5gNsDxJUCtBBxFSz3rXgq48giVZnJCgfePzSYI0+UjAbtcQg8Moj/?=
 =?us-ascii?Q?HUZHnXC3zoos790wqouIcvD2AjMI2/0RazHwGSmWl+bjFUR1rsZ8ETChV1Xl?=
 =?us-ascii?Q?1OdLtJbTmIBXQVpy3oyCty1JP4VroObY/yHCiNWjM3sKovoj6whxpxxGwcIY?=
 =?us-ascii?Q?n+VO4h/fpSRRKaK5R1mDMxztfFlAe7qjjQI3tJFA0EQdlZpmmWiDlABzVw8R?=
 =?us-ascii?Q?htFmyMh7j+ircuO5jQI04XBRGhLzA0/VMEdJhXFAkeB+4QaiZDkVMcYrb1VV?=
 =?us-ascii?Q?l1SHKCM07Rm4ARWXa6Lk74umvc9oKRT6wyJK4cQNDhNp7mmAduFLBcrBxpKz?=
 =?us-ascii?Q?r66OGwsLcA3kQXzRKryQsq28f5NKkwh7TEOFC1ABQFkP0Wng7tw26gCG4xut?=
 =?us-ascii?Q?KR6LV5+xMdOjw9B1clchDMFDELvUB/AvxThs2Ive9Znr02uXO/FMxsUd3obP?=
 =?us-ascii?Q?04lofm6Llvh1MNc4wH168vwWwMofv01EHoWRG3GCy+JNS7203B66200cPyLc?=
 =?us-ascii?Q?PLcTURuPQplH+DjARFs/IOEWXjvNq5mb/iEB?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qPL51mM+71byqKOeFevd3fXZxxquciiNGF0gV4/G5P8vHyv8AftCGccPzBDe?=
 =?us-ascii?Q?yt9ukObw97s9SidWolmzngO9smPtqCmu366Msn0dDE1IPQMQ+s3tzXaHGk6Q?=
 =?us-ascii?Q?bLkXU9VWjaWB3NBwONhB5zveJFKxw6denjkY1QjxlqBy2pYrNuHWrRBllKt5?=
 =?us-ascii?Q?fsVPZTKdLaUpvtJW6O2vTQSXyfuGAKEA6DvFy4uSooBklQ3Ol7ixhmS3bU8H?=
 =?us-ascii?Q?51Kl1SFCvlU31tu2nM8VIE2YaYxwW9pVmmSJfsXPncVJjGaseyb27yzUULZV?=
 =?us-ascii?Q?XrLGU5kY/kWSn26UG5phfd+YEm2q9GT5kpAmoQXrrXaPgQkpAEvDNwXwq+0U?=
 =?us-ascii?Q?mzMnfd/aNf+GO3EsfcDbNPuIKpMsoRZydixTM5mUeej6FtBp7MN4k6TY9Lm5?=
 =?us-ascii?Q?JPozKjE0P2VvN6ZirGhSsZjuCbp4c5t+Q76sBDKReFgRluFrbO3kgpqeyh+Q?=
 =?us-ascii?Q?c+alXm3m603udfwNs2FlqFz90dR6URmpOmlp3bB9Phls5PgJuxLEnPi+S/hg?=
 =?us-ascii?Q?5V2TNSRsn8rF/FwjD9ivLRlzx54cU+P9bWywZwHZLod6OjH71NSxUdhyduMC?=
 =?us-ascii?Q?HxUicBdVDg0XNzAcFKc4l5EoGNRcczmSSBaVFh/+9oS4Y/Z4ql1W4i+ELLhM?=
 =?us-ascii?Q?c7vrGU8M8KF2IEviqru8nV8nPleD8R5fEcTypx/znkpNQNoCo6Euh2OiEGeA?=
 =?us-ascii?Q?9TCUE+pHgg0wZtCzbB16V55gAqIKk3M1rBvyeRdIGXaay5qXzfsIf5T27OKP?=
 =?us-ascii?Q?Rjzs+hEr1kvgpqSvnAIKBb2xbaV3pNoKt5oeTcLffk6uPa/KWfRR6WmelsMC?=
 =?us-ascii?Q?wLphu8/9iblmAhokh1cts7diL/9R4xp7zD9kvMFizMmUkX/g+v7me3/UC/LE?=
 =?us-ascii?Q?eYM1jbZV9vas6c/kbXrv2LNdsYBSbGl9mGgvei4ir5iru4rGI+b6Yc7wTMDr?=
 =?us-ascii?Q?QFmS7PpXWk4U8TJMtsHbLJRuQYdiwvL8aOj9iZD5D6m14es8c2yB6tYPqKEI?=
 =?us-ascii?Q?jEQRCget19YZ50zeoIy3LWH15u7Ot4r69VlovD7FhSzuO9+o5tEZNs5HA5gI?=
 =?us-ascii?Q?r7tp3jogG//0AFge5B2afj/27KYtIg7awF4LnVxzefTjzjaeeL3BIQ49KSek?=
 =?us-ascii?Q?ISE/aFHdrFqbrg3IlkABSY6AXT0Oyb6nCbGgySNLG71JagoFaIPMkA9DtmhM?=
 =?us-ascii?Q?Zet83rDK2blbsbbfhxLPdQRpj1qZVZzyzN7tIhnFGIVqWHf2VnX6SfYOmqDF?=
 =?us-ascii?Q?QGQu2GxobqC2E44TDB+qS/L3RK0qE6A7yCJAsKDhg1HwX3gtydLCc5FOpG9r?=
 =?us-ascii?Q?Q64vze8SWdaRLu9PXOrM38xFJTWMIPJUF3pSDIS5Zk2cx6jjb6ItRNSwUZSV?=
 =?us-ascii?Q?FXmEuppfBl4vTcbBWKj48028DQQSA6rEO1LmHImmwuqXU/BOyTegS7NDybpk?=
 =?us-ascii?Q?CQEGWsHvz7MV1ulV5hcksY5IPEyk1okpJfHQue0ssmjQxkI/XcyFVpgaAsYu?=
 =?us-ascii?Q?4qKJZPPAkjCcmNpmwMjj3RVUgz/9h/wZ0pKWiICz3Rb1e+djGwOKDqy4H+nn?=
 =?us-ascii?Q?V0CBviw13mKxCmNOmdXSPWV8KhsE8BdHnkVGh9fQ4ic9w3xyDnIQJKstwBnQ?=
 =?us-ascii?Q?kX5wT5g+fNzbQgHZQSK/z/Y=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87f1b0a3-cd0e-49c5-4931-08de20b84878
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:21:39.6564
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u2Zi3OCrvf9TJMHnMXxNsQD/rjKmO8AVvbUiy7fM4znZnF4sgAxLBuZKaYB7TnZ1fUYmzBX3QV7VlpJtHsmiZkiMqh24LVCARO/wfVC+7XvelO2phhFx3j+wbBz2BX16
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB12802

This patch converts below functions.

dapm->dev					-> snd_soc_dapm_to_dev()
dapm->card					-> snd_soc_dapm_to_card()
dapm->component					-> snd_soc_dapm_to_component()

dapm_kcontrol_get_value()			-> snd_soc_dapm_kcontrol_get_value()

snd_soc_component_enable_pin()			-> snd_soc_dapm_enable_pin()
snd_soc_component_enable_pin_unlocked()		-> snd_soc_dapm_enable_pin_unlocked()
snd_soc_component_disable_pin()			-> snd_soc_dapm_disable_pin()
snd_soc_component_disable_pin_unlocked()	-> snd_soc_dapm_disable_pin_unlocked()
snd_soc_component_nc_pin()			-> snd_soc_dapm_nc_pin()
snd_soc_component_nc_pin_unlocked()		-> snd_soc_dapm_nc_pin_unlocked()
snd_soc_component_get_pin_status()		-> snd_soc_dapm_get_pin_status()
snd_soc_component_force_enable_pin()		-> snd_soc_dapm_force_enable_pin()
snd_soc_component_force_enable_pin_unlocked()	-> snd_soc_dapm_force_enable_pin_unlocked()
snd_soc_component_force_bias_level()		-> snd_soc_dapm_force_bias_level()
snd_soc_component_get_bias_level()		-> snd_soc_dapm_get_bias_level()
snd_soc_component_init_bias_level()		-> snd_soc_dapm_init_bias_level()
snd_soc_component_get_dapm()			-> snd_soc_component_to_dapm()

snd_soc_dapm_kcontrol_component()		-> snd_soc_dapm_kcontrol_to_component()
snd_soc_dapm_kcontrol_widget()			-> snd_soc_dapm_kcontrol_to_widget()
snd_soc_dapm_kcontrol_dapm()			-> snd_soc_dapm_kcontrol_to_dapm()
snd_soc_dapm_np_pin()				-> snd_soc_dapm_disable_pin()

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/cx2072x.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/cx2072x.c b/sound/soc/codecs/cx2072x.c
index 934526f8f292c..b0033bf9be3aa 100644
--- a/sound/soc/codecs/cx2072x.c
+++ b/sound/soc/codecs/cx2072x.c
@@ -1341,8 +1341,8 @@ static int cx2072x_set_bias_level(struct snd_soc_component *codec,
 				  enum snd_soc_bias_level level)
 {
 	struct cx2072x_priv *cx2072x = snd_soc_component_get_drvdata(codec);
-	const enum snd_soc_bias_level old_level =
-		snd_soc_component_get_bias_level(codec);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(codec);
+	const enum snd_soc_bias_level old_level = snd_soc_dapm_get_bias_level(dapm);
 
 	if (level == SND_SOC_BIAS_STANDBY && old_level == SND_SOC_BIAS_OFF)
 		regmap_write(cx2072x->regmap, CX2072X_AFG_POWER_STATE, 0);
@@ -1363,7 +1363,7 @@ static int cx2072x_set_bias_level(struct snd_soc_component *codec,
 static void cx2072x_enable_jack_detect(struct snd_soc_component *codec)
 {
 	struct cx2072x_priv *cx2072x = snd_soc_component_get_drvdata(codec);
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(codec);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(codec);
 
 	/* No-sticky input type */
 	regmap_write(cx2072x->regmap, CX2072X_GPIO_STICKY_MASK, 0x1f);
-- 
2.43.0

