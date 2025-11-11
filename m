Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011017.outbound.protection.outlook.com [52.101.125.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E90B1A23B1
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820599; cv=fail; b=SsBIKd66HRPWQupO1qpEu5yQNDLzGeLzbyrneXD/5pEF1Ff4fG2p1hYe3SlbBsjXFFci4U/HXkt2pBAK2gwZU5BzoL4nRSZd6CseL9C/HfxRlXbtrq6K/2U6EdfBecz5H5uH2qguoyEY4heB04DWlv/rt46DP1Fkyr5QcwWDRdQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820599; c=relaxed/simple;
	bh=FMre5+DCq8YdthGL45Q9TzqzV+XFdxYaoRF03ChaXcI=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=OP4c/B4iBef95Qpy+M10MLevlqdr5z9h3H/MnukN+UhGuIdtqnUowOXd9XPY4zeVcJOGDjhfLk8Wkxy9xa1IVgTwFMJPrwcSO0cGYU/ztIgpJkx8mECmuB4iIc/59KaoNuehmw1EpAS6KZlZ30kfcRI+PXS2uyx/LNWXQjOGcIE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=fHe0p30V; arc=fail smtp.client-ip=52.101.125.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="fHe0p30V"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iViAZrJuBjyx63WIQGwcTwwesFxorxosWT2jQyIqjvx/ReSkFNRE93RwW/bwYHhIYRelOfpi6DLw9ep269YoBdczWB+1OqGHOk2S0nHv8eLi5CtZWZuub30f1KsnSjk3GgQpNH0b18g2E5xZkL9f7oB7E1nY6RFfsYH64Zdpoo6ID9rF8+639rcCzpNmjeKswk8Hi1xKUjYGN5WREdPAPf7FUkQSJbPl/bPgH5sN/xJUQFkod2gcS+vDwQ7AX7pZ+xuoagTOShcOVl7q4xVPzyguaD6kt7zkF8NK2zJTC0XDE82LUOT+spjuYQ0/QAB9pPxH93mpSDZ52QQD+QjVkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fm+sSZuiC4bKSi5aj/w7cuaJKFawrA7fo68PfkoHXAM=;
 b=A+B+YHXd8GH5DRe8VhEP8ZzQv8Ypmnf4rTUObYHRverds+YIQxTTnsXyhAw1p5GQ01sszBLRjnaemCJglpTROLgBIcqskW4O+oniciJLAK6OmQBPIvGQxSdF6vPOe7a2295YboQqtydfqWPGjm3ckmwx8VG3t+SRZkg2fi1toyJ2uOfR4HA+j3H53YgtxlDI2kzjn7tJMAhhl0LeK7506OnShuGCSlshwfytigUyd3seCim3hYZSdt+PKjUUmCmAEqJsya7/2j6mW41gl4P4fXLxHQn1bsugr+DmYQ+5OM5Oj1z7kPQLqq2xjYpugIqBwZR2sUXGxzMC4B0qAWdJNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fm+sSZuiC4bKSi5aj/w7cuaJKFawrA7fo68PfkoHXAM=;
 b=fHe0p30VqNsxZ+AA/F6KdWm6BAJZas+TODLIUi1TeKfnp74lVfBOJrJr95wkduRj7RizbbLmDuQVxvIYkboVnF98P9p2SRqjWGtnJr5FxSozX7V9VmCsZ6uJ3G1vOuqyBc8VQ8cdmdEgQyZc5+BbqrDBPfXueLlI5dAWKHzFO4U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS9PR01MB16404.jpnprd01.prod.outlook.com
 (2603:1096:604:2be::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:23:15 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:23:15 +0000
Message-ID: <875xbh5sel.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 079/292] ASoC: codecs: max98088: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:23:15 +0000
X-ClientProxiedBy: TY4PR01CA0109.jpnprd01.prod.outlook.com
 (2603:1096:405:378::10) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS9PR01MB16404:EE_
X-MS-Office365-Filtering-Correlation-Id: 27cd8035-885e-4d4a-5f19-08de20b88188
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?UajdR3TpPKHjh6XQMvAizeSflOHH0OpZ7fj1o5u2+35SWjoqFVdEIiDW95IM?=
 =?us-ascii?Q?b0T40wCbnMR/bx6kfMKR6W2KT2cmqKnmGSgVsAdEUi5fezBgYSiRV689K6vE?=
 =?us-ascii?Q?P5mJ2lbcvxySiX5YA77VSXe0p7rTn7AwBzLoovXj5867Rz3pnqOhWxYNdF2m?=
 =?us-ascii?Q?Vi9wXup72rQbNUS1t6aQXNK6uWe2rNOGJJ4FYnAO0Jt06vIRWO5b54fzlhPi?=
 =?us-ascii?Q?sPn23N0+5JMAkGhkfSHx/mHkVDRplFYzuhJHvlrYAVD1mPIByFiIxDr8wwWL?=
 =?us-ascii?Q?L9Yf7MGMac8iH5VHFa+iem2qWxGYUAbGgXBYfTSv+EnBkzeT7tvnp15VF5+U?=
 =?us-ascii?Q?NQPK8P2fYt8cZO8UUHfrRpewfqQZHgkV0SLT7ig9iaKk/MFqnxTiibzxznt6?=
 =?us-ascii?Q?aqEIpU+G/+AL6l+0pWfGvFPryNxEpbffkjkFZE7EnzNYdARO5EiTUqStH00r?=
 =?us-ascii?Q?Nkm1iKTf8WU2igv5v1H/0IBD3HisQUthIyfdZa3fCg50fqZ7wZVkOEW8Akke?=
 =?us-ascii?Q?lQQTOfQya7yKLsi2gapRHE5Mdfr0XgGqaa8fezr4gVR/6hTRN6I3yLcELzQk?=
 =?us-ascii?Q?/C958q3FhFcKQR17SZYTZoIHEYnhcH83K+ehlauEexLWAQscG57i6O6qHZBi?=
 =?us-ascii?Q?GHcBRtgZSlreH4Vt7n5yAZqGLf3MZPrbTnmZR53u9EM6Cv5LxrILem9ZsDds?=
 =?us-ascii?Q?DKS6WFcY7RNOFyOeQnpbruXq9sx3i2vHA9gln8OqQiRWJZckPv37dxJDdypc?=
 =?us-ascii?Q?23NDBndRp/GogelUqzDRHvX3u/hjLxo8dVJP3NY9MibsCJ762g34IOZoa0BE?=
 =?us-ascii?Q?ewVqje25GHHta2MGVKi8DB9oGt0E26/PJlBps9PPZrWjiwlrxt4tsucW9+eE?=
 =?us-ascii?Q?3nRkWSWFfgpyq7cLpJZ+P6wOo8flocEzrcCekBGDq0Kh/GB21a0skyu+CvKE?=
 =?us-ascii?Q?2NYhXLBHjpmsDdC4xbzuhtAbv9TifDwQEeC2wJfB4DyE20HUHqgUNmN3nBGM?=
 =?us-ascii?Q?fnVUBUxJerMEemRLnq5TZVvcAf7QMh0esCi+0SU/O6h3AvYiWjBW5rtbrX8G?=
 =?us-ascii?Q?FBW6KHuoyUQ2louSZjagU4msCngAoSJLp4ttpBmary0dz8D60p7h0Ht69NSJ?=
 =?us-ascii?Q?jS6hjUgAsWl/cKeLNuhAwRyRq02gm15mZrMRYEcosBB7NUkjD3xZiaMXkDAg?=
 =?us-ascii?Q?CZhbseyFjq8BCNVTR1Q6gC+v0b7DlQlOqKbbMlfZfOKFqu0Mgw9sbtWG5NGw?=
 =?us-ascii?Q?5ET6I9w+OijHEqgSoEzqe2E6ivjsobluuLWvQJPqmYXtQ4GfKdRG4wwzou1C?=
 =?us-ascii?Q?+3VXyseW2hDI6ymw7zHtVUmc9V34y70PCUI3qG6LjrgJO2kAsfWuLZyKDRHa?=
 =?us-ascii?Q?tadYNRIdNthLxLv2X4dvtrSlTeJCjjW8wKjP5ZOjPPNZ8b9XbCYeJfsKzV3A?=
 =?us-ascii?Q?f5HtmJQLPE/dJTs/PYrJFl0MltNBo9PYMJoDyfl5UpLm6Dsg3EGW0Y5mdTuC?=
 =?us-ascii?Q?RnNWRlggfpd1JwuYAmB02Xtux3W+FkApIIC0?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?TdJVCgZoUprNCDcvSCqVgWrND2sgOnayXqBVIGAAGB2I7h1/eG9KqqMP7Npx?=
 =?us-ascii?Q?li54vhc/06HIEG+aEnCwh2TngWnDueTL4nobXuYlK14br7YMrAWzlDumN6qx?=
 =?us-ascii?Q?WWQNp96l1tBhqJEH40lwyAybZ8axIyVgL/UfJfp+CJDOr5BEvPqwYOJYTYxp?=
 =?us-ascii?Q?X+5CGELHkRCHuJVgiJj41uVieq1aJ+I+Cq88NAZwVGTaAeXdix3isT3ZELOa?=
 =?us-ascii?Q?VKkNszDPy1ZHfuz3F6io6t9dCwQcnW22qoDda3GQvOtBFyMY3nwoz1vakfW1?=
 =?us-ascii?Q?K9Zm9WyUSFBsXBtRGsIBJcispYgVApE6ZU2v2+Q6UYcbBxPyoQqbRl/Z7Bax?=
 =?us-ascii?Q?ePr6B6qjOe+ebJhinSz+73aNh9zxVxKDv8yHrVpcjVRqGzbl5qPsMIoIkNJp?=
 =?us-ascii?Q?5Ha4yHMhaug1OdCJbOA/k6jMBOufTXTlsn/ElrJVaJN7ESVFCVKMwqOEvjHI?=
 =?us-ascii?Q?TkuQBWytsoP+TfXZdNYlWO93Zqv/bffRTeaBqnbpdgZchhH62v/HDL/EyxuN?=
 =?us-ascii?Q?TjTTHAfr8d/9W8+ta5nr40MPgrX89GPnQtC4cOZ/XEv+wcFtJTgQOkpP0nlV?=
 =?us-ascii?Q?1XOnhxYhfP3YIldbRCYY2gtOK55ZSVVhHfnHgJfIkyFXs1NmzDCpoCJvjYA1?=
 =?us-ascii?Q?xIViL74QBN5FyKGQavAGUE/9BV5TIsmc7E1SrmfharM3iPj9EgJk2oRWHPvm?=
 =?us-ascii?Q?tw4SbeAChGzU6eH01r0m73iixfKzkGUIcYdPIYqaQkxkUzn4W5AP/WEBgyQG?=
 =?us-ascii?Q?1MiQd7wgrPxUeHY4YSSIVf64syr6PZDL/Hy4d6N85Wbi/2dEHJH3ivWwdZhI?=
 =?us-ascii?Q?xNM+/0BTo3B69tECEriUXJg55xLGNxCn6fOOufykEB9Ij740Qgot/evyWyj/?=
 =?us-ascii?Q?dXY29FTnOuRRNOX/3lYiq9MXyGT6S+ZI+DPBwoLnHdbFsQUcWABXnzNk1gcl?=
 =?us-ascii?Q?f5BFc4BDy15/FfqSkqdtIvvz/7YnNdMhr8fuND3bEk6tzMA7R1HSEOGyMv2S?=
 =?us-ascii?Q?/vb6OHEpzpMtGiVzoHqVy4eK+ykHa/D9bA/VK8B2UMhBMw8Fo8qPkToeSjd5?=
 =?us-ascii?Q?yTicgTII9vGsOZDPceWdj/dssicAJMjxw/KHhf/8dz8qOUhKKPUGiYHfk4D5?=
 =?us-ascii?Q?mI0wRd8QzJabzD1k5HThl1vlBItPh5vajnxbIqxPwsNgAAfmLgzIW3YXzhT7?=
 =?us-ascii?Q?LVwj2FE41CZYoAHYxuvNZQRvFKO3XqwCpStX5J+Gp9LlontGjydY7dKkwE/R?=
 =?us-ascii?Q?NeNqvI9ur2wsA5cfrO1zDIhTMjKBt3LSE+QI/Y2uCtWDam6C9TQmN8QuW0bH?=
 =?us-ascii?Q?KeKIxV1alzMmIQNuudeA2QHYvNfNOPsVmrwKSnc4FrrOXmd8Fy7fHNi7/ezf?=
 =?us-ascii?Q?ri4j7guJxB+8uv8Ve3vqsVUXu04GGAro8osQRtrNyAeCtYdu97TXcxwH/iLS?=
 =?us-ascii?Q?fidRstQBB55nFgP0E3rNvx4FXMRXCHSxA6cgsuNYLZDklkoy/VEx16ddXchH?=
 =?us-ascii?Q?JEiA2HbPJZ5v0HVRpycBwLeO5Dl7Ygb096OqM+ajNgKTa0QNs6RHqqbaV89U?=
 =?us-ascii?Q?ewqgOLdKnggIVJAGBHwhCqm23v8HNGV663ja0FnV0rLQAOqNZPUQcbOAMiKJ?=
 =?us-ascii?Q?dRQ7uQImtYz5l5Yvshbxipg=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27cd8035-885e-4d4a-5f19-08de20b88188
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:23:15.3821
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hdN5jJF9nZtZk7BY7JQ8tzEWqf6lBENdqWlp7KhDT4kne4snLnGaQTP69n+uPkJZn8XUsxEVWd4WO0+SHT2oL/1efTExkxYHiNMrFz7RS9Hdi/cVwd4ctsVUdZIax1qe
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB16404

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
 sound/soc/codecs/max98088.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/max98088.c b/sound/soc/codecs/max98088.c
index f1cff60abce0f..9f40ca4b60d5b 100644
--- a/sound/soc/codecs/max98088.c
+++ b/sound/soc/codecs/max98088.c
@@ -1296,6 +1296,7 @@ static int max98088_set_bias_level(struct snd_soc_component *component,
                                   enum snd_soc_bias_level level)
 {
 	struct max98088_priv *max98088 = snd_soc_component_get_drvdata(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	int ret;
 
 	switch (level) {
@@ -1311,8 +1312,7 @@ static int max98088_set_bias_level(struct snd_soc_component *component,
 		 * enable it.
 		 */
 		if (!IS_ERR(max98088->mclk)) {
-			if (snd_soc_component_get_bias_level(component) ==
-			    SND_SOC_BIAS_ON) {
+			if (snd_soc_dapm_get_bias_level(dapm) == SND_SOC_BIAS_ON) {
 				clk_disable_unprepare(max98088->mclk);
 			} else {
 				ret = clk_prepare_enable(max98088->mclk);
@@ -1323,7 +1323,7 @@ static int max98088_set_bias_level(struct snd_soc_component *component,
 		break;
 
 	case SND_SOC_BIAS_STANDBY:
-		if (snd_soc_component_get_bias_level(component) == SND_SOC_BIAS_OFF)
+		if (snd_soc_dapm_get_bias_level(dapm) == SND_SOC_BIAS_OFF)
 			regcache_sync(max98088->regmap);
 
 		snd_soc_component_update_bits(component, M98088_REG_4C_PWR_EN_IN,
-- 
2.43.0

