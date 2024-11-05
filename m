Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010048.outbound.protection.outlook.com [52.101.228.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF04B1D31A9
	for <linux-sound@vger.kernel.org>; Tue,  5 Nov 2024 23:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730849664; cv=fail; b=AiJfm43l0I6Tm7OWmHXjTUnuy1GFxeAQVuYBwTmeXWIxpddHbSzYOQiw+BWMi+1gKSbJQrGvFVE22LpvmF6Zvkn7m3OJfXTSbzrsPCpfTU3tgElK9Il9Wro+u1kVnfFeMyJIGJ0C+kH0R8hM4zggyqlbQ95jDlaXuFTYESe6J1w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730849664; c=relaxed/simple;
	bh=0xC/mUuO8rpkPkEjAtu3v6C5wVti1POFaA3jOiHkhFc=;
	h=Message-ID:From:Subject:To:Cc:Content-Type:Date:MIME-Version; b=S/hZzfFRUM+/Q3FqmmZaD1dydc9FCfKgnypqiS+K3l55/7tfHrXJmK3kfkwTdFMrPiDQkmG86ohnVbwrhAuakm8xH66WaE67i/jTuw9zvAXuYqc5FVUZ3PRCpyuMBHpDncapfLnOcZxK/Ir7iIGJV8jYMeciKELVzEa2Prihz48=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=JOXqte1S; arc=fail smtp.client-ip=52.101.228.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="JOXqte1S"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WaN4VjAygRJ6+BD4F0lVKBi8loUiPsu24TvjdbD1QAVOOAMxqa0v3LZiw3NBFaGaXi7gQl8jb2uwL1pwywjyHzdhL83YC1RfpFPqpxuCSpCCEqnr9MqKINv59xsG+4labF1J3NWrfb9pp7q8Xn7hiBO0rySZEyDRMWXsHZUTXPAKVWTJATjnEN72T8lGU8+3KO/IH0zAUGFYTOauAtGoCd516EQzdRJDdiSAA82itXI9s7yCQQ+WvXAEI5lZ2t4FwBtaQgftJZjapxF767KsxOHyl3WJsrGE2aEY0OVGn8RqNqyMoJqVCoCQxqTyoOh66GmwUkML8Hsk2bO6KdmdIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=13mH+/flqlqhIFn0pK7zwftuoWO4LDGR1p4hwb2I9jk=;
 b=OoZjPbavg2qL2z0Wi6BCIMlUwrxHQSqK5/FAdIZQcYggq51A0HAA/BZGWlY+BKgEuv++pzXTA1am3I/eQnUKKPaqGWTbLVfcphRc250G+z16vFL+/1rcC30Yy8kBFbH+yyegzPUwKXrN/IkpTjoJoN6df5Iz43T6M6OM8bbXzsiFMssgYQ2/iuOaXLa5kDk0OZcb2IknatwpyU1J66FRowaM8SGl0i901uwk/AVlVoBNAIrb1iqVL5WmWNfjfOlpre7Xu87Fa74jqW2/o0LTKGvWKZpw6jTLJbkTrXnRf3Yym2kpT+63tFEtwrodBKgKu2y8DyVPltQKum5VzLVEKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=13mH+/flqlqhIFn0pK7zwftuoWO4LDGR1p4hwb2I9jk=;
 b=JOXqte1SKO+F4IhO3HUDN5+1DLcTlLkHciJEl8/rz1wzhb9OqYoN6252wwE2lqElIgh+lAAP8cFjZais5S+KFaEOGLI+FEZY0z4wRLXaASdZUytprIiQ5mWDeKSrOUnHkkub83D332Kf5lzLgxbseZdeSQu8HAY5qRZTXuGwKUc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB8344.jpnprd01.prod.outlook.com
 (2603:1096:400:151::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19; Tue, 5 Nov
 2024 23:34:18 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%6]) with mapi id 15.20.8114.031; Tue, 5 Nov 2024
 23:34:18 +0000
Message-ID: <874j4l9rwl.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH] ASoC: simple-card-utils: Unify clock direction by clk_direction
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 5 Nov 2024 23:34:18 +0000
X-ClientProxiedBy: TYCP286CA0375.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:79::11) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB8344:EE_
X-MS-Office365-Filtering-Correlation-Id: ccb6a0bf-5335-4ec2-db73-08dcfdf25e31
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qLBjVYoG9ccn69Z/6DqHaX+4Qzzz+Fdapgm7VAmBZzvMPJeqlm2z7PQgLnzi?=
 =?us-ascii?Q?4tV5ddht/hcnz7dMYnQITtyrPn5iiBMAFr/8y5mL3dvLZ9YHpNpRsGw3KeSv?=
 =?us-ascii?Q?uwyxakkZissSabS/a2VJfH8dslbPnAIaEoN0xBEkAxMcEb2KKKaoEm9Evwtl?=
 =?us-ascii?Q?LDjYqzCIUp31Wv8Lj4bsmDqLGPvBqRPZGC9T3GFzWqi1vLOX+sM4O7P1tf+n?=
 =?us-ascii?Q?DoxX9N92i9HHwlgGJ8giPavjmL6N17J3kTl6iwvfhzJPY096dug96adxX1rC?=
 =?us-ascii?Q?2ScEY/9RtegZsK4cDLpPhsO5Jnq4/1G9DReKXpudCxpLs7YsNIhI0O2l2/bf?=
 =?us-ascii?Q?GOG6N1o5k9V/57o5dneY1GpD5klqlfZZSj1i7Zo0CqWh9xn4EBsUxqqZA5F5?=
 =?us-ascii?Q?VbuMhAZmpoUXtYqP8jUHrdU/uDdcZwmU9k/S/LHfLit7PsFfhySKlVHLjrvN?=
 =?us-ascii?Q?uHnyEpImY2ewu4ynnxQwk+f/UxtTKsYI4ZR0HmzpwAnIXt/0J82D9KpPNMi6?=
 =?us-ascii?Q?FQlEjaZJEuuGSaHWljpwPF2Qlcmwy72MM79q++NPDIkZrcMBovgvKXHvyPkT?=
 =?us-ascii?Q?XJL9xhee1VNYdg+JLz2u9pCZ4yARDbejt+fTDHKaGkdg/Uy2I+qoW5jVUq+w?=
 =?us-ascii?Q?1cls4nbG7FrYEZ8bO0O9JgPQ8tUAYKvdpmvxj/iNKnKhRRguNX/7y1YfHApS?=
 =?us-ascii?Q?21ec/gcoSXc7qudgzJB2gAmNjvu+PDv7/uOgJPf7crC/x5AZzrFwWWY8z89i?=
 =?us-ascii?Q?GZuuaRECAEzAAOx6Ts1qM4oJYZq9S6V84+6m9Nnqa6zvHsGwaJlpeEx6Bk2V?=
 =?us-ascii?Q?UdXA4p84SLw1YQ4cKDc7uB+zwLjNkTX5pTYRRJv2J3LZ647WkKS0XkSXRzVr?=
 =?us-ascii?Q?4E/9ZVuAwPTFkJ5lyPnd1AAQA8LqAAjeylztt1DrilYGzalvB65gZSwkc6WG?=
 =?us-ascii?Q?HSSUeL+hRqvgcmZqntEvJ5vwU1GOE9ltMzNyRZsPUYcVkcFJp7l2d8joAPju?=
 =?us-ascii?Q?PKmMUHRQj4UcF6ubExInqH9JX73mGj69lpDNrBvcFGHx3kN+ZZ/zb63oMzgl?=
 =?us-ascii?Q?I/SwxmJgOgFtXrWQ9+JQf6+lCBwj8dWGNf7pNNtqY8OXVWJJTco5eksg/qJU?=
 =?us-ascii?Q?iWO3+Mg4jv4Db+XTdWUEdCZhjnelFM6B7qSNvprSxbCSlfO/f8JkpimA9kQQ?=
 =?us-ascii?Q?sVR6RN21ONsVoLHJBhb2Ak04IZJ+sFKcXatW8v6877lKyOOz8aNNMqWGnCEC?=
 =?us-ascii?Q?Ve8bJ1X8NEIdV3WKqsNffd0Lsgf4dZOtQYplN0MBpFAbBt8kDMVMdWBn7yt6?=
 =?us-ascii?Q?yL0NW6K/sPs6V1t+vHslNwX9YLo1mwWpLBA4qvabdAYED3Jpq4dcSkAnFU/9?=
 =?us-ascii?Q?9hqwB5k=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rbqxnOC4KiWL5Z8PqPJZT0BCbtIupx1m1nxjnjfhtaNWUp47joMNR6jVWZ7H?=
 =?us-ascii?Q?3Zje3luaiF+gCp6Q0Hnk3dgDFJOsOZ9j3qOPdKoxTDYLRVIZ1DpaLKVKw6gQ?=
 =?us-ascii?Q?6mkRPuJo3RCNEa/u4m9ox3o8KJcxWIkc9/h+98cGpOrFBTg/NbKiQlpQ49uw?=
 =?us-ascii?Q?2K2+GTrlT5EdgbOGvq2RUERD/EbsHz4Hmcl+oL0dfHp16Zqr0vGPNXtJk0o+?=
 =?us-ascii?Q?/97Qt2eqQ/S9QJGeCYVBQxD+7L/NW11wm/dJb3NL46nSjhUoSYcAqldx0Y5+?=
 =?us-ascii?Q?0wpN3cN3LKJq/OYdowyif72QsXjRRKGKNs5dn8pQ/I5DO9btJngOynSaGU/U?=
 =?us-ascii?Q?NecdKtXhoHeWG1XKWGrKqT4PUN3l698IABEg4ZQGxcbFiRFhMZIk5dm+4ztT?=
 =?us-ascii?Q?kI8C8/W7KfOHEQIhG/BaBd8HPr5tNeJfROiKTNivkq3noNnoqTK+jowssoBy?=
 =?us-ascii?Q?KvWB5MZq9MzQv/WEC5P8lBwyFO/JJghK+I8iVpcLG2QxsihqiGvmXj7Y8aeU?=
 =?us-ascii?Q?MXv4QiznpjL6k4+2keJ52xRaZsZz1jZCZlgl7H9iZAY4e/N3GxmElskf6uEO?=
 =?us-ascii?Q?OahKVU9kimAvuNgDVUWslyKy+GtLRA5t31OEKx1oD71KcXSNARyUUjYP1VOt?=
 =?us-ascii?Q?lBdxsKwZtKOZkrz8QOHWxDPViLHugOuCOgFaxdyrWxsZ4g036MLltVdwSFeR?=
 =?us-ascii?Q?XJTRr4IvehPH2HHHKreUEWw+dOjxMjDePS06lkkHoCewf2otI340e7Cifr7/?=
 =?us-ascii?Q?eYSxwnEnefnhNViKuwG2dGD4Tf0FDkCJKfCDXLzWg3A9o1rtiGO48ZFy09t5?=
 =?us-ascii?Q?sZIEYmosVIAbaw04ROQNuhbrtKZq4b+qNsOBcgl8UQn2UowA5n4/yMLFemY/?=
 =?us-ascii?Q?uxQhVhVwMQUTFrKwmFuEL3BGw2MW/fFyNI2AR5+zWVxueOZ/mnAFplhKXh2Z?=
 =?us-ascii?Q?Z4Sdw+EKwYMNy8Yxy5qZYyIj2T5OS141mlAC3CPgb5q5zYxC/y+wno6Qf0DF?=
 =?us-ascii?Q?gcrHnFrDbgcyvNGqb0ep6i7hihPwMbpQstavTd994q9XwO4sa5ouLR7mbQ97?=
 =?us-ascii?Q?/552PjRSRuu1zJwMNm99YrKoiENbwtlbo6WPvjqFQOV/QRM3B5e362fdqJJd?=
 =?us-ascii?Q?Q35GIpRL3od468Rspt8KttPdca6RYKyLeGEWsA7ZD0Oh9io9+/voEN97fqCP?=
 =?us-ascii?Q?Gs18TKQTLUcTR9bEC6iBJZBKzL3v/UbtT2JJSTmHj8pgt651tVXabAxbVUSP?=
 =?us-ascii?Q?OC8e1EpshDAElIUjwo9iFRaCinQPD6ZoHNDb/1SSsMNihJ9STz+xDB8rixsF?=
 =?us-ascii?Q?qXYef5bvG56QtM6qjgal/EApR7w3jODj48pX84qAPIhhWRr9OvF8Em60QH6g?=
 =?us-ascii?Q?Lqx1PfaalYg3W33PvGJLd9e/N9N90CMhuNlw9sYrWdNbG5IRCfxGWJufzPFb?=
 =?us-ascii?Q?5NeXn8GDP425n2hLrKkjAyyB1DAqifB1sUm23Y6eWWreBmEHq8qkHLy2oyoT?=
 =?us-ascii?Q?GN1xBNWcLdCh6f3axGNyYH7UwQw+C7ECDAlOL+aqA1GPZvOOB5YL2Wb4MhH1?=
 =?us-ascii?Q?szuTaqFL81tDF7z0d+8Jbv7qQXjAbfs61qekpves3lPjIyupDCjYk6hYoiSE?=
 =?us-ascii?Q?q9qEVxl+UNJKVN2Gx049I5E=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ccb6a0bf-5335-4ec2-db73-08dcfdf25e31
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2024 23:34:18.5226
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7ynYoqkZNh4xIXL3poCtaIeu9XziMnFsQkeWTRHurzMVL7pxXUv7fKWrKy87QEyrrRLtSTcPIF+0b8X3Ixg3xCY6IzZOaxZRFiUHfXptT+O10S78rTnD7ybORzJ59vJM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8344

Original sample-card assumes SND_SOC_CLOCK_IN is used for
snd_soc_dai_set_sysclk(), but someday, Codec uses SND_SOC_CLOCK_IN
and CPU uses SND_SOC_CLOCK_OUT at hw_params(), and dai->clk_direction
is used at simple_init_dai().

There is no uniformity today. Let's use dai->clk_direction for all cases.

Fortunately, almost all DAI doesn't care about "dir"
(= SND_SOC_CLOCK_IN/OUT) in .set_sysclk callback function (which is called
in snd_soc_dai_set_sysclk()), so this patch has no effect in such DAIs.

But this patch might breaks some existing Sound Card. Use
"system-clock-direction-out" property if it needs to use SND_SOC_CLOCK_OUT

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
Request to have Tested-by

 sound/soc/generic/simple-card-utils.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/soc/generic/simple-card-utils.c b/sound/soc/generic/simple-card-utils.c
index d47c372228b34..dfc5bac23edc3 100644
--- a/sound/soc/generic/simple-card-utils.c
+++ b/sound/soc/generic/simple-card-utils.c
@@ -365,8 +365,7 @@ void simple_util_shutdown(struct snd_pcm_substream *substream)
 		struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, i);
 
 		if (props->mclk_fs && !dai->clk_fixed && !snd_soc_dai_active(cpu_dai))
-			snd_soc_dai_set_sysclk(cpu_dai,
-					       0, 0, SND_SOC_CLOCK_OUT);
+			snd_soc_dai_set_sysclk(cpu_dai, 0, 0, dai->clk_direction);
 
 		simple_clk_disable(dai);
 	}
@@ -374,8 +373,7 @@ void simple_util_shutdown(struct snd_pcm_substream *substream)
 		struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, i);
 
 		if (props->mclk_fs && !dai->clk_fixed && !snd_soc_dai_active(codec_dai))
-			snd_soc_dai_set_sysclk(codec_dai,
-					       0, 0, SND_SOC_CLOCK_IN);
+			snd_soc_dai_set_sysclk(codec_dai, 0, 0, dai->clk_direction);
 
 		simple_clk_disable(dai);
 	}
@@ -483,13 +481,15 @@ int simple_util_hw_params(struct snd_pcm_substream *substream,
 		}
 
 		for_each_rtd_codec_dais(rtd, i, sdai) {
-			ret = snd_soc_dai_set_sysclk(sdai, 0, mclk, SND_SOC_CLOCK_IN);
+			pdai = simple_props_to_dai_codec(props, i);
+			ret = snd_soc_dai_set_sysclk(sdai, 0, mclk, pdai->clk_direction);
 			if (ret && ret != -ENOTSUPP)
 				return ret;
 		}
 
 		for_each_rtd_cpu_dais(rtd, i, sdai) {
-			ret = snd_soc_dai_set_sysclk(sdai, 0, mclk, SND_SOC_CLOCK_OUT);
+			pdai = simple_props_to_dai_cpu(props, i);
+			ret = snd_soc_dai_set_sysclk(sdai, 0, mclk, pdai->clk_direction);
 			if (ret && ret != -ENOTSUPP)
 				return ret;
 		}
-- 
2.43.0

