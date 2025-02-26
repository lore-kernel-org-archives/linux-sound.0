Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010016.outbound.protection.outlook.com [52.101.229.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BA85194AD1
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 01:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740533829; cv=fail; b=eH4yO0cI2d+4y/CFqedpECPd9meQs6UeOjjNilUSIn04ot8M9o1KRLscodXNsiIVrt2AkYe46QIoO0HXevDJSBeNBtTHCifnHWKvz5XnA98M6hGTnamcpMUSsu8FFzjFXPJHakcVMGz0y0Hlnbz24UgORNa5TVGlFJ40IYSFOjE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740533829; c=relaxed/simple;
	bh=PnjycaYJPxSRQIcF7uOg1xN9qS7/ZvZAw2OgjfPHJVg=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=pzzdOvKkojNJ0/dGl0vHFDpRWTKiRTk8o4efZlUqkOYAKwQqKRiaDm2x70kYSqeeYjd0yeVyq39VRQgMLd9cA33rmwNBlRqFJUJBQANZ60wTweUvBHXaMOIk0ZCeWHj6gfMoR8//iCrNhPB7IJgcOM35aeRbewtTudqvdeuCL1U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=ZMdlfPyq; arc=fail smtp.client-ip=52.101.229.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="ZMdlfPyq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P4lJ8ttm1Sty8vUH8N4qfeAROMUcD5KaoFhg/eTkLqxwRa+Gg5eYrH87kYm5V6tJTUl2T2hgHxNmOHv5MtVT7JBV2n36gc8pYtJd44UyTQVUCSwOv0FNcWOJbMbmofXppK9MItF6l49xKHbwQ9v4pzo3MZq6Kl+BNYIF2mju+/q4jhiMI47XyJTmsf35FO4QdKudN0x76RasWqygrhL9t8XRNAtDDHb4GP1iViI0lWXHsH+QskKNiY+VOTvgjczrOjgQXRhCkOrHCPkuSj0kE96v/rIFfjEJL9QM27trCZMBukB6lkK33fTcbqO6Y4JFIjKCAFtgU5zNPTuLfLBwBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gbemtzi2wHMs43VxLnU5u0CFMDNgUG0A1khjVCaq3ic=;
 b=S7NZu5GFdkLM+zwJR6Mm2ngWCRdlA7hfjHUKeWWG1IRA90ZukJNZYe4rtjzkgG49Nml2suR+ZJzVQ2OSXRlcoSxNEqQ3yFPh87nWobMt5Xsp0TROUWa65sLDBdnNtZvqo7O+u0Vnx0GxqNuASGa2hpxZpC7e8PDcfhPvztKFUyvQePofwkv9BgxzRYIoyFrzo8m06llzit0Dwn9AKXjEvrDQYoiPoyeOGHKp+uSO8QTaQxokys8omB3SHS4pBhAEkiyrZB1G8A2o9r5nxub3fEEL4MpJ82JSWwdoerCy2kp3DHQlLqIjy6MEEwmBfTq7Gm3Nuh5mIQCz+AG/MsWC9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gbemtzi2wHMs43VxLnU5u0CFMDNgUG0A1khjVCaq3ic=;
 b=ZMdlfPyqs7mIqAXEg80tJ3tM97FTyJIQRl1bgKetoB7Cvnl2lBItB/FoFSHiYkx5SNsECZu2E8VR0+1fDUemIAp1tRD8xkaOEs5ltDM6Uzply5T1UIetP9CYIs9mdoOv1neqgilK8OPHPt7AoHWqL9nn3OTTHUDfmYzuB3Inykc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS7PR01MB11967.jpnprd01.prod.outlook.com
 (2603:1096:604:23e::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.19; Wed, 26 Feb
 2025 01:37:06 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 01:37:06 +0000
Message-ID: <87wmdda3lp.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 113/157] ASoC: tegra: tegra_asoc_machine: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
References: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 01:37:06 +0000
X-ClientProxiedBy: TYCP286CA0166.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c6::17) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS7PR01MB11967:EE_
X-MS-Office365-Filtering-Correlation-Id: a49a980a-cdc5-4ebb-fa77-08dd56061417
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?IbMcB51GeRZa9Oobtgj7j7sttcxpZTmc+9Bip/E1uDDQAqqeg+FN57wMmThY?=
 =?us-ascii?Q?+gBWbJTSIOzfq42lFCOg/ECNEaEXzQu6OIdBGxK2EWe3Tz/BVJLC6z5Jstmh?=
 =?us-ascii?Q?V1Dya0cKlFXmrda7gs9J5wONl1ilvPY4Xn41odwCg4hbc54yuLWocnWqzdnB?=
 =?us-ascii?Q?SsSfwgIb8IRbJ+MUgYRV9xDzz2fcCbMM66U/QL2WNJco5oVr7q+1JwjVvbqo?=
 =?us-ascii?Q?uKpb81DVS2/XM2W13TDoxEfFE6bZDda5XivfyTdOCfSPW3u0rE6TDOaEsjje?=
 =?us-ascii?Q?4U+qVditzJOADy4R/SH7m7ymia0TJ+jyqYqRIRjPMtm7hSj3sOzfye11pLzB?=
 =?us-ascii?Q?6aqk5P+7p+ZVAp8Kv4keHYIiUo3AxUuP+gfa/sWP86lqUHOhVPhPsGcO5ZjA?=
 =?us-ascii?Q?P9aAaGRjQLBcVxSAmjfLO4SjCJn0PI00UyfQcsdKg4odorl9obBQXaUw4xpS?=
 =?us-ascii?Q?d5/s8f3IIMVG4B/tblZMdXcNFsFWYiZbQ3fOY7TBUE/rxek5BryjqVw+3SKH?=
 =?us-ascii?Q?hyKwjiJK4jZgXALZK5fXqZgCH8ITtbaW0ZMoGLCH4E2+MsylwaRNHKOZKjB/?=
 =?us-ascii?Q?f+HuRISm6H+6RaOsS5IZf//oPq4dFbd8+0k1XOsDA4bK5+1L4Qdkv+XAxfxy?=
 =?us-ascii?Q?4ha+Njyfb4G06kp48spRYMrKQn5dT0sOE4Ev/80IgLMk86qLZw0uLl6t3TlC?=
 =?us-ascii?Q?ryq1JeGmAyoLI+Xyw3o3rV5FTSuTgaJSWPGEJLR3oRVC1YfV7UbJt2xB2daU?=
 =?us-ascii?Q?OmmiMU0weU6Uu4j5YHBBeiKBxTBFl88DQETWEfNaCbZffhDRnUDXod/TfYPd?=
 =?us-ascii?Q?ZsqQebm1FqG7r7V22lfkzzLWdyQJMGYfnmjdiPSpgCI/vI9JRZ8ejtj81mnw?=
 =?us-ascii?Q?hVBwsrARgxOy3Sj+Wk1QWeCmrw2oRpzFFhfDFmELkTRzcHC9KXw4rRsI0ne1?=
 =?us-ascii?Q?w+tLz1SqZZZu4xtTbqkD8U/RxQY4+a/FjXiXQp5pj++40qMXeYQ1aS5Xbnqu?=
 =?us-ascii?Q?2njbLjIvQ6KQlu+w4F3fjtO7Y8m3fVWSbxxM0qdFY0P61hdG8F73tADxgnz1?=
 =?us-ascii?Q?SQODOJwMyQzuNt8zNRxKSM4bCdYGNfAa26o3DjRcZEn28zVXyc8JRql31DyS?=
 =?us-ascii?Q?4lq4sxWqXeYk01Y9YmEqgb4JTHvY2EC3gtWzkkIqSpby/AfoQRYQvTDnVOgN?=
 =?us-ascii?Q?gqM1t1BeDXhNjZ3698MPgp1DxTueB0KVUrBJ2xck7YmN1o/l8YHc20R5mLli?=
 =?us-ascii?Q?X6U0ld/TyXqSl424Gq7cKNro1Gu0dqCDZiFDkocOmyAEUAJopXushYNVm07U?=
 =?us-ascii?Q?oo5UGSuWcP9TOwcsmJfG5sRJHfTCGQ5JmZogc+/G9zBnG1d/XhIZ8OTKv3F4?=
 =?us-ascii?Q?x1op9xEwe7CA5VYPSrwXedZ2hLoansAZJVmIn8u67LRfpaff140lhg2MZbEs?=
 =?us-ascii?Q?b8Uh6j8ZXeRUtrR/YPP+NlYsl8YR/ybr?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Yhx83SAet1xenLaeWidqzORP9CJIO4XZzfHgjXQTekuYt71u9ctbyhPeQKoe?=
 =?us-ascii?Q?rHKfjTQCX1CufOcrkdHJszYUjrURxAdx4eIpeOdqbsrKFDrM8XpgkeYFFvam?=
 =?us-ascii?Q?9PG90PV2PfAxuD7yzgB9SeaPJ8ObEkTHn4c41WC5SiSTL99M9joKXpAbRTVS?=
 =?us-ascii?Q?8TsP73giu4twpZA8ASw0Nne6jl6S6fbmtCFGT60FKewSrLJuA2xdJ3V7FxBq?=
 =?us-ascii?Q?8o7iVOxsQRMl8gBT//ua2+cTHtGwLUgUDNyfkBEeeSwjWFUIsCNrflOj/vzj?=
 =?us-ascii?Q?dLGLRCAaUladAjktTUO9WJtVV8wFib+LB/1cVf0rbkLz+9N7vE9RPwwlIMvP?=
 =?us-ascii?Q?cuWY0jtYIihVQ9CXKR+cyv8/ZYPOVku6h2Y6yqSBTVLCbxZ3/8HTi3EEV1oe?=
 =?us-ascii?Q?WOo/jnMvQh942q+bEE6qDz3nPh7nsVyUA5pXj7BJDFay/x9xS5YCfUvKZ2xZ?=
 =?us-ascii?Q?05iNc6g2RU2OmErvRCqDSiqRNdejBybA+fCmYmA0Roourwn1x0Ls/Y+GQDSj?=
 =?us-ascii?Q?HK4ttvNn8R1uguEaPNVugSK6A86e5TpyOhAGJzcDpmgp1y7qV2sPskivevXE?=
 =?us-ascii?Q?3IQ7C86KgaOcBBbr6eoqppt3KEMyPdkh7xobO3eEMY954R5nFmstQx7HQ1Lq?=
 =?us-ascii?Q?0FRYNGoXcQ2NMxijaVOWhSNoo3roRrUvwBufac/alVfjfhDv6ysfRxYSWq8A?=
 =?us-ascii?Q?Ks5X+SkvXY+9eEPHSG20NkML4PUZHGny4F6Rj5mNvCVXfU6dPnb5iK7zLhWp?=
 =?us-ascii?Q?sJ9kB0EYMgh3cpidYOvHbpkV9UHLi3eEgZql8PqsmSGP7UGdgKIzj7XcAPDS?=
 =?us-ascii?Q?daS7ASK5lVDc5heFWzE9UaHNWLyIHJ+dFFLLtRh7gx+SnKkMA2fnS+8yRss0?=
 =?us-ascii?Q?u3y4263bCqfi1JgyFUwxTKSAjV8lr6bD4et7tBy5s1VA/hW8WwB8OCFSXhCQ?=
 =?us-ascii?Q?zZMOTcgMHz/50B3lxCD0yBJhP/+/MhvGCN4Ip07Du2Y2f81BJcuXkYkrWI63?=
 =?us-ascii?Q?FVdoNOJ69u2NVuhj/zltyiDH19aRb1aAQUXc6Ebc+5bgSqTZs43ZYLG5Ia8e?=
 =?us-ascii?Q?rBquUTUS36ChQ/ApqRHmUGVCaH+2LyPAKF9RUEHlsKyCf2smg4Eo1KupAJAW?=
 =?us-ascii?Q?hyQH2y88cj0KZz6shVacr+yR51XU/0cCmzzkEEXYiWiXiaDQ31HIO2FqWS/J?=
 =?us-ascii?Q?7tLeiw+liDapXUskqaDWwv262eRNEWbl01IjXpSFH0d4BkVaT8ZKtH7A0N9y?=
 =?us-ascii?Q?Ru7cgWO20H26nwHIWU6UlOmSnWGvU5h3DfpH4U9kv0htFCVO/Br2QIUmCWuE?=
 =?us-ascii?Q?9WAO95JNjH+5+R9Ope5D5iPl+UUNebUQQfMOFXP9mJ61Q1zUq5NkVeOkDqx0?=
 =?us-ascii?Q?mkT/WEI9GmAfd6CkvHG6d8bighUnyaGtCBy3KlgdxZOp/24Jrk0OJuH8jCoP?=
 =?us-ascii?Q?zA89ghWZROnyEH61Z0nWSblQhIVyUxUT8KwVf84oUxdcjOe1k54OUyhZtrLA?=
 =?us-ascii?Q?jr/W+X1+NPBvRkFliej0hBG783FhGTdtjG3ahd8hV0TZv5gN/HFPJPanp1Du?=
 =?us-ascii?Q?jQelKoes54mDEZ4z0GfdBOPd3CjYlJdOyrP6P8D969YrpKUoykvkl6Ul+oyN?=
 =?us-ascii?Q?qE3EUjYQfzAxc0rivEV6Jao=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a49a980a-cdc5-4ebb-fa77-08dd56061417
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 01:37:06.4466
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FQbsWg8awh9I/KuGhZYJFcrsI4q8NiyBgYRAe0NI1SCJbUQjiNCCtvTJyq0N1ZLqk9BgihKBH0gmtC1TzooVvmEZKrCGe4YOs72/g1D3i+d921aiDWG8x+N9x2M8eutg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB11967

In SND_SOC_DAIFMT_CBx_CFx, M/S are no longer used. use P/C.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/tegra/tegra_asoc_machine.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/sound/soc/tegra/tegra_asoc_machine.c b/sound/soc/tegra/tegra_asoc_machine.c
index 775ce433fdbf..62f896772731 100644
--- a/sound/soc/tegra/tegra_asoc_machine.c
+++ b/sound/soc/tegra/tegra_asoc_machine.c
@@ -637,7 +637,7 @@ static struct snd_soc_dai_link tegra_wm8753_dai = {
 	.stream_name = "WM8753 PCM",
 	.dai_fmt = SND_SOC_DAIFMT_I2S |
 		   SND_SOC_DAIFMT_NB_NF |
-		   SND_SOC_DAIFMT_CBS_CFS,
+		   SND_SOC_DAIFMT_CBC_CFC,
 	SND_SOC_DAILINK_REG(wm8753_hifi),
 };
 
@@ -701,7 +701,7 @@ static struct snd_soc_dai_link tegra_max98090_dai = {
 	.init = tegra_asoc_machine_init,
 	.dai_fmt = SND_SOC_DAIFMT_I2S |
 		   SND_SOC_DAIFMT_NB_NF |
-		   SND_SOC_DAIFMT_CBS_CFS,
+		   SND_SOC_DAIFMT_CBC_CFC,
 	SND_SOC_DAILINK_REG(max98090_hifi),
 };
 
@@ -736,7 +736,7 @@ static struct snd_soc_dai_link tegra_max98088_dai = {
 	.init = tegra_asoc_machine_init,
 	.dai_fmt = SND_SOC_DAIFMT_I2S |
 		   SND_SOC_DAIFMT_NB_NF |
-		   SND_SOC_DAIFMT_CBS_CFS,
+		   SND_SOC_DAIFMT_CBC_CFC,
 	SND_SOC_DAILINK_REG(max98088_hifi),
 };
 
@@ -769,7 +769,7 @@ static struct snd_soc_dai_link tegra_sgtl5000_dai = {
 	.stream_name = "HiFi",
 	.dai_fmt = SND_SOC_DAIFMT_I2S |
 		   SND_SOC_DAIFMT_NB_NF |
-		   SND_SOC_DAIFMT_CBS_CFS,
+		   SND_SOC_DAIFMT_CBC_CFC,
 	SND_SOC_DAILINK_REG(sgtl5000_hifi),
 };
 
@@ -812,7 +812,7 @@ static struct snd_soc_dai_link tegra_tlv320aic23_dai = {
 	.stream_name = "AIC23",
 	.dai_fmt = SND_SOC_DAIFMT_I2S |
 		   SND_SOC_DAIFMT_NB_NF |
-		   SND_SOC_DAIFMT_CBS_CFS,
+		   SND_SOC_DAIFMT_CBC_CFC,
 	SND_SOC_DAILINK_REG(tlv320aic23_hifi),
 };
 
@@ -861,7 +861,7 @@ static struct snd_soc_dai_link tegra_rt5677_dai = {
 	.init = tegra_rt5677_init,
 	.dai_fmt = SND_SOC_DAIFMT_I2S |
 		   SND_SOC_DAIFMT_NB_NF |
-		   SND_SOC_DAIFMT_CBS_CFS,
+		   SND_SOC_DAIFMT_CBC_CFC,
 	SND_SOC_DAILINK_REG(rt5677_aif1),
 };
 
@@ -895,7 +895,7 @@ static struct snd_soc_dai_link tegra_rt5640_dai = {
 	.init = tegra_asoc_machine_init,
 	.dai_fmt = SND_SOC_DAIFMT_I2S |
 		   SND_SOC_DAIFMT_NB_NF |
-		   SND_SOC_DAIFMT_CBS_CFS,
+		   SND_SOC_DAIFMT_CBC_CFC,
 	SND_SOC_DAILINK_REG(rt5640_aif1),
 };
 
@@ -928,7 +928,7 @@ static struct snd_soc_dai_link tegra_rt5632_dai = {
 	.init = tegra_rt5677_init,
 	.dai_fmt = SND_SOC_DAIFMT_I2S |
 		   SND_SOC_DAIFMT_NB_NF |
-		   SND_SOC_DAIFMT_CBS_CFS,
+		   SND_SOC_DAIFMT_CBC_CFC,
 	SND_SOC_DAILINK_REG(rt5632_hifi),
 };
 
@@ -961,7 +961,7 @@ static struct snd_soc_dai_link tegra_rt5631_dai = {
 	.init = tegra_asoc_machine_init,
 	.dai_fmt = SND_SOC_DAIFMT_I2S |
 		   SND_SOC_DAIFMT_NB_NF |
-		   SND_SOC_DAIFMT_CBS_CFS,
+		   SND_SOC_DAIFMT_CBC_CFC,
 	SND_SOC_DAILINK_REG(rt5631_hifi),
 };
 
-- 
2.43.0

