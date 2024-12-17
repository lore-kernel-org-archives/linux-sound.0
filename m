Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010046.outbound.protection.outlook.com [52.101.229.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 608E98467
	for <linux-sound@vger.kernel.org>; Tue, 17 Dec 2024 01:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734398567; cv=fail; b=B7Lm+rmEixXQP2JsUVFm/z9J6Pz62gX7NEzNTQ/gfVJaLG/P1i6nhWYLB+GdU6n4HMHOO90Bs1y42DipqKyZXaXGGdSeODYHgumSsVPMyYpnoR+IebPQNdBXWOWdwVOpd0N4dJVofzfGId2zjUsaZH5C5iJo4ZA7iHb07g7uJhY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734398567; c=relaxed/simple;
	bh=xbtbibIRoroRWiUydzl+7rGM2kAwEYhfrh0qAI6L17Y=;
	h=Message-ID:From:Subject:To:Cc:Content-Type:Date:MIME-Version; b=Nj6TMyx57F6MsN6iSnXD+OteivuvI5vgeAoE4bVyxKSPVHeT0pwikH+d/msabl9dbklxJvQ/u1RHciuwkmsazFDXuwfUJ4zgeaQQuKA81Ut5YjF/7OVA0RBUEOJq05VsMSGZO0c3iGxDpV9N6vnKcbhThTmaJMQefFRXl5dzv+A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Ql3UW9Ig; arc=fail smtp.client-ip=52.101.229.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Ql3UW9Ig"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MV+Ivei4ma8Ya8uYfwg/yM7xm/61ijzi2WOBFroQY3CH9biJCURh4BmsFSHIfBasVYiBbDs+IMwj09sEfDDA5iqagfpIviZxvZlNw0MIrlWScrJpjxdEkUwkKpP2js3q1grc8OjQUYsaLYIB++TU5yMI8SmcrOldeNuL/lj7EZZtlR9d3yt5RBBpvTfheu5kYm4NDwMzV25pFFVsUmgTG1HHf929MTuOH3sta2s7CQ6dmurS3IaVAYSxraT523/0OtPWz83hT8uYx6WW3pYJ9tCmMCoExv6FS1j5bABN/pZXgArdx15LTZ0XNqofzE7QzXBQvMdFeuCcLK/sO8Vn8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9TDqrhfUBI7jFKJ98cm2pYIHfR/0xUQAhSFR+oRVFz0=;
 b=uJ0dETN8e0MiiMWO4pi+Eul2Iqizbt8zUW6mTYcv5PS5nKFPlzlS/dSBsHnFZAbnydqECN8ZTCBEAh2D9msIz0nYab7sRJnd66212PwUfLWA/kfxRmM0X75Be2TWzjyGkoCYf4B+lYtrRfISTcf6YPHlmQqOAUsGutzkCf9Ja1BckHGJ7jm8+WI5sAABOnEparTlhEtGtiPKjs1sJBVWXtJjhXaxhexJhoTtEO5Bp7IINeo84c6d1IeXTlsBvXfJNtcy8bVrvtFN58TJrrEMIZAeLVmbrPcP/ZkZfbEi08U4i5Rcd77soie0vHdE4Iyw35RQWuP0UUZ/xQsCQRtvwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9TDqrhfUBI7jFKJ98cm2pYIHfR/0xUQAhSFR+oRVFz0=;
 b=Ql3UW9Ig1kWUB3eHcI6+qeevWG3lD6SxlFTwLcQ5g8ZOcnUqoE28XAxH/6lL4rI3lmV5mfLZ9yp+OAxmHoeuRSKg043Vr9zX+hgP7c3ZoA71rIc/dY87Xkd8ByyiNlPo2gFnep5VdnQkeZo4bf4GEheelXhL8ABAg1ibvZ2wNlY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSCPR01MB13698.jpnprd01.prod.outlook.com
 (2603:1096:604:37f::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.22; Tue, 17 Dec
 2024 01:22:41 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8251.015; Tue, 17 Dec 2024
 01:22:31 +0000
Message-ID: <875xnjnlwp.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH] ASoC: soc-card: remove card check
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,  Dan Carpenter <dan.carpenter@linaro.org>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 17 Dec 2024 01:22:30 +0000
X-ClientProxiedBy: TYCPR01CA0164.jpnprd01.prod.outlook.com
 (2603:1096:400:2b1::19) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSCPR01MB13698:EE_
X-MS-Office365-Filtering-Correlation-Id: db46345a-34f9-46e5-342e-08dd1e3946f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?DF1jJGC9tNWBac0soH5Q1Ns5yXE7c3qoMKQ05Uf4kG4ZQTW5AXz/KC38olqP?=
 =?us-ascii?Q?RESMUXadiwZXZpuH+O0j75pbj11Gs3KgXh4TByp6C02QoPNjsGe+U5+I+sF1?=
 =?us-ascii?Q?xMQWRGJ96/CtplD/b/UhgocBDnO/b6ckwnZphNmrYNgMijIYuJrZ8NvaBgNR?=
 =?us-ascii?Q?fnljGnNaXfWIR/tJbb3lJ3FJ6TsRL9ySEA8Zr2CLCQ2uklTmLnETq+5o+LVT?=
 =?us-ascii?Q?2eN4livpSsrSYcdheF9HcmCq8d1mS7qknluEGjxFp0TbQLTgClbQMEwsmw3+?=
 =?us-ascii?Q?a5bxsBLZuogbg3fYpYDXik/vQelGYhQY9luEt4ZBfCom0DJXx2KXPWy9I32+?=
 =?us-ascii?Q?aUrqZCfEkRjbS5K8EW6KaDzhk0+kyEEM0/u/9mMByDQh4ImbHNnWLh+c1Waw?=
 =?us-ascii?Q?aT60oYfEeeFZlS5nR3S5HsaByH94NA6Boy6TIAysKPx1BUa3IYQjf6PmCl89?=
 =?us-ascii?Q?Bk6fxm+ZwF2rKkHpavFyAFmDkfuv4/PWHEwinl0FNRPMY0RnNLgydAsEzPOb?=
 =?us-ascii?Q?Zl/090Ta4LT+iI992y/J1wYSlqiMmhyAMCjCy2Ac7R75lqLanQdyuc/jwgPv?=
 =?us-ascii?Q?JLRLiO/CBbNcZRsf40RzT2OcKsPxg1GGPFnrEEv6GehLQpape6yamfgz3J6g?=
 =?us-ascii?Q?QqvHiJzL8YpZMZ55Z7pelCqXzVSkt5evX/j/435ZDk54sBNFuQ/ltmnCbRGd?=
 =?us-ascii?Q?Aw0JkpXujg+eQ2LpY0/E7SDwK9iWV4A9dBwWtjAsmJ+059nv+6J6GXyZycnZ?=
 =?us-ascii?Q?iCMHdBbBaceY6pPCNzeoN20WBckcEbGe5zLGjjCpvUrMk9jLJl4egu4FVWRm?=
 =?us-ascii?Q?oqcHDXQvW6nxSr2jvYn0pXTe31jyXhCZaT5zjOPfQMVs7ZOAs4F0Kh4IEGdP?=
 =?us-ascii?Q?Txni5HYPFBFp8DpJQtjOlRLAEPXw/gv+Gk6r/4PETGQk5B2Er1y2eQmPD8X/?=
 =?us-ascii?Q?5EIH/oAjHZHelCZVuBpToBEryJzjRynOdBgbh1iTUOuS+zmITWohRoubWUdT?=
 =?us-ascii?Q?VbF6NNRn9ApvdDUT60423yfaM6iaVegWLrKdtzqU4hVu484/aOqRbv2neVXY?=
 =?us-ascii?Q?TV/6TrNiYEGdSCZzdJTrxcfZ+/xVSXhuCAhRc9GcEVPXP7mYtr7hcAMI8ePN?=
 =?us-ascii?Q?6tN7kLK4fzBJKAQenFaTl3J4YIFGVmfqSaAuh8Nf276iAKk0fILIeREnUrFi?=
 =?us-ascii?Q?AMwMMrEq2O66oX20bu6wx1eQJzGR5sAKQTJ27Bn2JrBjzw/I48NW+dXGr+5/?=
 =?us-ascii?Q?2k5HkNOPGMvw8lnI/RJC6sOo/CF8Yq6wWNnR8fp/6RvocYriFJVUb4s6CtkE?=
 =?us-ascii?Q?sb7zSoEhCP+gE8zl6Xrvjdk0M42Bqd14IS6trkux2zr7Y5m+LGV9IT5w8YiU?=
 =?us-ascii?Q?e4uGNM8peT0gmREU6BYl6THdwD/v8qLY+ObB1Dzdn+DOZ9cSbNnQObcLGsbN?=
 =?us-ascii?Q?tK+jpMblFWkR1f8GiMTwThoHHWiAMSbc?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?W2Ye5sUnNUImmjwFja5KBbuodOGk5x62qGf8R33dHsLsT2LF0ktaCHT/nff2?=
 =?us-ascii?Q?a1RcFSp5Ppm3p2jRht9vHfOcYcLMqcw+crBqmcnMpibNQ79TGa1z1x9vdKHw?=
 =?us-ascii?Q?ghlIzEnnf/xo6H51ZNChbEHw/fFnGKqrLO1+0f22QO3DywycLDFvaXxXm233?=
 =?us-ascii?Q?PERyV+aR9uAtpyiYi77P9ghWRKq2fSpAMPFbQj++YAIz0MgVaEfvDUwb+eJb?=
 =?us-ascii?Q?E+1FkhG5YCuZaPm993sDaA5KF9deuxcHAWi3LvGfYmVs+PGi6Qg3o/5oJO10?=
 =?us-ascii?Q?7l59bAzw7aEQTsim9zApExpxHmrMgsYAe/hivwvQf+9ar7hwuj24Kym/qTBx?=
 =?us-ascii?Q?N3HwVy+xZQrzygSK2/vqV2DAqxqMSUgHJg9C6Wn0bcttNyL9yOWnAhkOXr+X?=
 =?us-ascii?Q?WBUi+1AsQT1Wydg2PE64BchlAFfM78vR2tt0RFQLlLw+L1YV3R5y4htsj+y/?=
 =?us-ascii?Q?Pvlt69V4YTwrohtAlkUgxmzHi0hqOqBnrwK9V9TlA5JmWS0O1maPL28Ay1Cz?=
 =?us-ascii?Q?6+Tsq4+yMsbXquf/Xlh3Q3NST+zR2oE4ly3mg3mFaHfNLov/BUqthq0sOhxH?=
 =?us-ascii?Q?HlUYCNrpHMpHqZkweSoF4fENvVg3HGQ1BJ0UhLQzQgBvskUon3xsZ6fieCWi?=
 =?us-ascii?Q?o6cK6FgVzLCx4mYfp4cGUV5pEQW1vRubXd0JrjitSzhTkTQsK3nbfXrCgV4n?=
 =?us-ascii?Q?tG6zmb1DdZ3mWU9rJwjeP7bIJW9XWriStAZ7jcOMNe2uMHlmxeVR7XWv8rmZ?=
 =?us-ascii?Q?z7n75blGxoBTlAwHiqbxTflPC+uQEGtdNx7ZFAKrAaTRbTC1ogq9rfFF85BX?=
 =?us-ascii?Q?IsRvtvXqtm6Nfkn+pBUB2MNd3B0JsYbdAbPDy/s8s4l7GBJI9xs+3sLaaXvb?=
 =?us-ascii?Q?MluoEOVDeUsCm+n5Q6GOq7LVE2wWi/NvHTJiUQtdeMNgQl6MxsUy1PL7Ago6?=
 =?us-ascii?Q?zCPxPkMXGztaXHSY6tBH5B5vEv8wezLG2XAQ0dvTkQbWkIcZGoPnJOUBrqrg?=
 =?us-ascii?Q?zax3VD+O+PURYhFM3VxQOhz3a/7KpdBZhmyqXpz3S8w0E92M1hf7NL2x/C69?=
 =?us-ascii?Q?1StC0RyawStWRS+5BGWIttjhYkQYrONeeI7Cy++6QJlNJYrOtEmdSQaszPHg?=
 =?us-ascii?Q?3rScTjr0we6NaOx8038ReilibOwNZg6BCNbXbMN5aTvTsPpyTqa3qnHyJOQG?=
 =?us-ascii?Q?EFmgQGWVI+8Qir2KfQAfOttVWGJxKGUKb1EEcmr185KcFinmX0Z0gmMgPdri?=
 =?us-ascii?Q?48/vhJnIDyYjuBWZzy8p0DV2DWBAcWIcGN/RVb8+brk6M4sAngzeMNOw7OvC?=
 =?us-ascii?Q?Aipo+x7jqRcgGND2OMRYmQIxOpvt0bpkPUWdQN1Zp6NCgEY6CNfsM1+QmBJL?=
 =?us-ascii?Q?XWRkh/+2mgfumeZnc3qWVXsJwtx1/P6ulbydklUaQRHXiyCigZ9A+pqv0/1q?=
 =?us-ascii?Q?dYKJ1pIprSgPsagf8BTDTDkqEXUypJMjqRIPfxbIQMxA3Bg8HkNDSYnAvUx5?=
 =?us-ascii?Q?4M0bmjfziUPplo5OWRFz3WEr7S4qByIWr/0kZtH6wQiQv4lSNbYibiQ+JUTe?=
 =?us-ascii?Q?Bydsc+RQJX2LoCV1nJ83YKzxhDRHl1t/mU+gdYYqQ97KaSEkekC202Q666yR?=
 =?us-ascii?Q?DRvgRBZlWRsNGajJIavdU9E=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db46345a-34f9-46e5-342e-08dd1e3946f1
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2024 01:22:31.0309
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +sJsdYPxXh4oLlGCtnJnwJ+TvHMnMFE9gU53i4urZCo6LTTI87KYk4WKMy9FLMmwuyO+TrT4+6IeldYdbN8vKVvw5KsJR3vkMP8RC85tUbVn1t0yKTZXJg40dmRFYTcR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB13698

only snd_soc_card_set_bias_level() and snd_soc_card_set_bias_level_post()
are checking "card" in the function, like below

	int snd_soc_card_set_bias_level(...)
	{
		...
=>		if (card && card->xxx)
			ret = card->xxxx(...);
		...
	}

But it should already have been an error if "card" was NULL.
remove "card" NULL check here. Otherwise it will get waring on
smatch without this patch.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-card.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/soc-card.c b/sound/soc/soc-card.c
index 8e9546fe74281..e6eb71b3010a8 100644
--- a/sound/soc/soc-card.c
+++ b/sound/soc/soc-card.c
@@ -219,7 +219,7 @@ int snd_soc_card_set_bias_level(struct snd_soc_card *card,
 {
 	int ret = 0;
 
-	if (card && card->set_bias_level)
+	if (card->set_bias_level)
 		ret = card->set_bias_level(card, dapm, level);
 
 	return soc_card_ret(card, ret);
@@ -231,7 +231,7 @@ int snd_soc_card_set_bias_level_post(struct snd_soc_card *card,
 {
 	int ret = 0;
 
-	if (card && card->set_bias_level_post)
+	if (card->set_bias_level_post)
 		ret = card->set_bias_level_post(card, dapm, level);
 
 	return soc_card_ret(card, ret);
-- 
2.43.0

