Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010032.outbound.protection.outlook.com [52.101.229.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3975D215041
	for <linux-sound@vger.kernel.org>; Mon,  9 Dec 2024 07:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733730022; cv=fail; b=EgmNvYhrOCACxXocsfQJSMAUsYClZxlI1mGDspb82F7jOJI2abQUcB3AzKPIP/TyuUlpXVBNN5xfe0t0L3wJxqefwSFiBzmiEZctoR9rnyu93w60c7rHSHnWFonOIu5/o6pVNtTyOyT/X0Qw7YPsfs8f4ATEZqPljQBaiOp0CIM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733730022; c=relaxed/simple;
	bh=sMPQ+Ow0RBxY0sN8Mu/ndFTHHEY2FeCrI+jKkQPXMoo=;
	h=Message-ID:To:From:In-Reply-To:References:Subject:Content-Type:
	 Date:MIME-Version; b=ZUK9Kb4pni+LfCZENHnQPJrkvqrxhkyY0xM0gJ8mab+ltBanJSBpST90KB/fpmvZ0EfBwfEtlzNiQZJhtEEWR3qeTiy8BbqUXX46oKawmnsBZzpVErxnGXHfMZ4XKfKQAmYbK8RNjMoMy7lsXaDfPtNNqD8l6hUmD/zehpPuwtY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=jhaZWQ+u; arc=fail smtp.client-ip=52.101.229.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="jhaZWQ+u"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hRjYnmk0zuy+raov5No0t6JA6qZ2PyEQIoxsUN9/bCOCpof5SJNpwqRE5pgY17GREC6jEK2zSEg3+BkZ7JvmlbIg6VUt3/vc3P5WXkbZX9a8h4kKU7IMeLZvtBVFY9gfXhKInxg4y9wWSpwFyIFYRSUUslRUUdIcp/0PaKLbW5oP9Jvv9eg1W+bvQMZl997tEhcFDZbrIyi+NBrUFLEymhDAjbjRc4ASGCGzi7Jb4CQYXz95cTpMd/8NmXhMyprUX5jaw9WPRiLg2KpSZS06Nir3N+tU0Dm/2zD5rkgkXq+0Q3NpUSUbnMCtLAvmuSvMCw65bjQ14pOKJW5eSPYErw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zb+e8q4KpHcy3V9pTTwUXxNQNIlnCv3uKGHLWwsSF9Q=;
 b=x0Wy0z5o06iLga8DuMLemPSWlQBSPI/2UmAm3uP9opwsfj1kM/ObIIlQpIsoSyZrLVLSwntbN4OkDMS+JAODZQj2KAKNpVmtoc8lrQvbTdRb/STSx+Fs8NK2yMcood0C/wGW+tXEdk8cnAOu4TsLJq2nily966B8kr/GTQy9zvTBuC2qSa7mXD/E+I0zN8A3IS0dhKVX8v3TTgIL7IZBt1INAYt/5c1MHx7fNC1iXHxIlklVHal8A8JDv3MxOAixw5+kIyDshLbIwBsJkbrkQfG9l8y4uMh++8NI1Xm81drn2yHRXuUgRx3NK6Je3ZxkofqEwwh69b7QCZbss5EQJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zb+e8q4KpHcy3V9pTTwUXxNQNIlnCv3uKGHLWwsSF9Q=;
 b=jhaZWQ+uaLZSE0NmqN3LElIgmMf9RsWOLDlt+6rmoNoMArRWMHIW+yrkI8NhxQhVKfJzFlZm1j9YrFp+YMhi53nom5lgXFR/YkqUpY+zcJOn97jNXQabvqytuZYMW0YMO5d2nKp9K1V9NucgATXeGMprD1utKY8bUSC8rEr2ztw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSCPR01MB12968.jpnprd01.prod.outlook.com
 (2603:1096:604:32e::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Mon, 9 Dec
 2024 07:40:16 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8230.010; Mon, 9 Dec 2024
 07:40:16 +0000
Message-ID: <87jzc9mhi8.wl-kuninori.morimoto.gx@renesas.com>
To: =?ISO-8859-1?Q?=22Nuno_S=E1=22?= <nuno.sa@analog.com>,
 =?ISO-8859-1?Q?=22Uwe_Kleine-K=F6nig=22?= <u.kleine-koenig@baylibre.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>, Daniel Mack
 <daniel@zonque.org>, David Rhodes <david.rhodes@cirrus.com>, Haojian Zhuang
 <haojian.zhuang@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Lars-Peter
 Clausen <lars@metafoo.de>, Liam Girdwood <lgirdwood@gmail.com>, Luca
 Ceresoli <luca.ceresoli@bootlin.com>, Mark Brown <broonie@kernel.org>,
 Peter Ujfalusi <peter.ujfalusi@gmail.com>, Richard Fitzgerald
 <rf@opensource.cirrus.com>, Robert Jarzmik <robert.jarzmik@free.fr>,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
 linux-rpi-kernel@lists.infradead.org, linux-sound@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87wmg9mhkk.wl-kuninori.morimoto.gx@renesas.com>
References: <87wmg9mhkk.wl-kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 09/17] ASoC: codecs: wm8995: remove snd_soc_dai_set_tristate()
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 9 Dec 2024 07:40:15 +0000
X-ClientProxiedBy: TYCP301CA0078.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7b::14) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSCPR01MB12968:EE_
X-MS-Office365-Filtering-Correlation-Id: 61d8ca3d-b544-4a5e-fc2b-08dd1824b91b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|1800799024|366016|38350700014|921020|41080700001;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?v1d+f2ovK2su5opGToz6UPlLkXj4ylidq48hDl2HccpT6WoqVOC6VcD71WIX?=
 =?us-ascii?Q?KBhBbyW8QYsDc7004jlw9maj2Ohc3J1Wu4mqw7XwMGhOVoD8biFDW7B+VpH/?=
 =?us-ascii?Q?MKeRPQvsXuErIbHhuEfYvX9zRn9uKo/fH7auxY7HXRdv0sY/XLnfWx50rChx?=
 =?us-ascii?Q?HYaMPzMOIf/ONOsRafhdAyWpjKcQIdiLRCY4bISfExClmDGOJuZk5WU3yuHe?=
 =?us-ascii?Q?5uWJIC5qqE/9RzDbb1mQoBd2lpo/+bQhfAM65RrgkwmJY0/+mcaPyBMT7BTz?=
 =?us-ascii?Q?Y24bEy4Msj1DxCRhr5oi8aXQjQhVeimmIHz6zwnCXXO/ifD9ICoM0c8DgkZe?=
 =?us-ascii?Q?o9RSdKJGv3uuK5uQrhijdpEy50vpVJ4083mR4dCY3jA7Dl7QV5JMxAXzuLwi?=
 =?us-ascii?Q?Vjs56SMHhnbMPPDAk0uBbQD1ZF18oryK9v4lYZ58kjq6UutpMaLnvqSbShSQ?=
 =?us-ascii?Q?eSNv8F9nmSIGe10us+iXXvkKDIDNmzm/BlFM+5DBzxe9etEOguBTI1pYqnhQ?=
 =?us-ascii?Q?ZgJ0fYlkPrGlbtMv8EDwZlzFZ7kIzgkgsMyEOx/ihi56laqJvsnpHttnSHnN?=
 =?us-ascii?Q?OGdZZAB6RtAaQCvvCyoDI9R7idXQN9r/jHJZKco4q/gre2gzLCrOkTM1oAoy?=
 =?us-ascii?Q?d+oK31BfIseZMhWfkXjWPrRdCJ0zOGjcLrOy2LZhKDhmc4G+AUC+fF39yJVg?=
 =?us-ascii?Q?Pa4mQNqyI3BzXKhJEy0PXKeg9ibKudFfhKzX21fBeqarUQ+jEyVmAqNX3U5Z?=
 =?us-ascii?Q?7Ydpx+F7b97vRsFtCBniB/SrvtuXE3tCBcIo29RRUfvFmqE40UXD7u23SJrO?=
 =?us-ascii?Q?kpdseu1qHLnrT4yVukzJzC2oMEK0GOuaX3uR5fpVrajSkPpZvC6Ba4bQ2MUk?=
 =?us-ascii?Q?LDWFpxnzTt2OApWiaDOEeRCqtsCXeXut4qiPh0V6YiNUo7lQNRGCRhLID0w7?=
 =?us-ascii?Q?7opPVZ41Dx2HoqnyhoqBHtQV+WoBhYDLFlcwHyqc2UBJQiYaNbMu36MHXg+2?=
 =?us-ascii?Q?RRGalA+XllH12hMhCD9PN7q9nqVNCEM+vs+hmodkHaHqKLetVTqjY7CHDEQu?=
 =?us-ascii?Q?Eu95tX5poLwkYc330kiLnTLbTG5veDJHhdeDqstatIutilYqJILSeso6wYwG?=
 =?us-ascii?Q?l2qtuxg5r/94UCxYLs/vp9YXUhFfCnuqfJSTBzIuOOcnvQueo7NdtfRJDbVU?=
 =?us-ascii?Q?47JsPXgudqkGt++mGtdhVe5f5HxGUtPmRrN4wYposDgsIqVNC3LzQqmt3HEF?=
 =?us-ascii?Q?VsiBDOVvZNcusAMl9KIS8MlvcpnBPpH6yqFgAKGvqJzG0oo9CtObIbgfQfc6?=
 =?us-ascii?Q?dzkf7vgXuA1bBzS2mSZYNhIqgf01663w15PpjPgQWDnHkMB9atLZlr5DmyMe?=
 =?us-ascii?Q?BeEaabdkTFiY7SQNemocBmBUsLaoORecHI+MGO61hVdKqrK30Xv0s070my0a?=
 =?us-ascii?Q?ZCyonJmi3u0m2Fg08RQ6HhvQ4nMzSogc?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(366016)(38350700014)(921020)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?e+9tYxW1OEzsEll661nFnifcJnHZZ0ju6y4SogWbya//fj5zenJZw0j80Li4?=
 =?us-ascii?Q?ME8SYz6xzoobM30IW6PiwIin3M03fbUqM0yXvIhNftSaYxvsmu9z6t7WZf61?=
 =?us-ascii?Q?Ml24LYxlahIh0T5HVsZ+dZTApo7xzrqcIeM2SCAFN7W9nbgBkzROR3yDXIRv?=
 =?us-ascii?Q?0FzQmZUXNqQGaS8z/5S1nm21REAiegojWmmFkfcHXUHlQwVfSX3OPhksvZY9?=
 =?us-ascii?Q?4uoJa6gwBJ6qA7lAAU5dy5C4W5H/h1cCLOYKPqKqxxxjN6FYydm+MUeK6l0e?=
 =?us-ascii?Q?QZq0M1UAq8X00BKe+xlCIUu8VylttnjvD5fA8J3R15YOsLmR5BTEVsxD/Uke?=
 =?us-ascii?Q?Hs5m4aYKIVqHbJQYuWQhyVYlenwnn/wFclll5+YjDstGHOSXwAeRTh0WuqYm?=
 =?us-ascii?Q?3QXjEJkxGAqUK4oIf6+Kr4diExLXhXv0aTbfMGScj388BEMztUhW2ogoXQum?=
 =?us-ascii?Q?AzYiL4RDyoRiL1tddE8y66kEiRt16EsKEhNzVEor+JrsFouzisFu2yzq9K/n?=
 =?us-ascii?Q?ui73Ep35CgIXPaTGY76OX/hOp9yDwZqRn7ODvPnoJtlIDqrEn4kZEdCnyPs/?=
 =?us-ascii?Q?Ej/Yb1qsLqaMfvTxH4CUOYxa0/TTeg+dGzxBUlLlbiB0074DNwgn9yVLxban?=
 =?us-ascii?Q?fhnjiC7Fqm46hSCXoJ4fadc2n8PnX0zbLX60J7iXSktRTp6wAv+lBqskhE77?=
 =?us-ascii?Q?mflv0YE4uhG2PRK4ZWiJyX0kn8huG2sGE/pMjQIyRdTdJJ5Fjd4MBUHcEfWa?=
 =?us-ascii?Q?wEo0bmPharIEbIOtiuBFoj/p3CrkLN3r7kWjyGSdTup4qDvlHrAPswu7FGrS?=
 =?us-ascii?Q?UB/i9toHvoNPJ+mgplw/TFGhew4OsIfHlYqbIezyKRF4h2nVyF8KIq/mwepi?=
 =?us-ascii?Q?uadiKrdIzBgpXMQ54uiIh/ha2EtANk5CXAuUHDawquZ64mdzpq1IV90AJUVY?=
 =?us-ascii?Q?VJN5+tKthEvZrEni/1qpWXQTGM399z5dyLwUmAU+ySEnY9002kyCBrAoy22x?=
 =?us-ascii?Q?whqeOqPzQFnMILx3mNQS6MEg68uWm1sUfBVuTJytWNweQFnx4LtgVPHmee7G?=
 =?us-ascii?Q?a8nmW4tT5rz1TAsHZZsk5D4iYHs4ZLaeRxnPOlfPnt+zvEWGH8RHW0Tl5+As?=
 =?us-ascii?Q?r8kBKa+CAoRRsh5ztQz/8n1bcCba4dZkypqcDpJCY3WPvrr2JHDD1U/JYXDl?=
 =?us-ascii?Q?xwq2VIMPny75T1ZyxlERGhZ3EeDmr7Oqhevjy83rQmCPmHbWTXvT6/kbq0yA?=
 =?us-ascii?Q?YzNnQSd4P+ArVm/vzsojaeprvPZAp5tM8DrZcPh9dwB/LoBmbfGG36h7sywu?=
 =?us-ascii?Q?+4dVQriH6hS5evVaGNMn34vHO7aMv3ToiyLllIo7ZSXJN/AeWhEP1YXb5Jhp?=
 =?us-ascii?Q?J/Ikwy8QX3DZNZL/nQrUTdfxN4PFAly1Lau8vgx55O8C6l9xRUe2Cphafz5d?=
 =?us-ascii?Q?X18dBfvygMoPmbgG1ZhkCinl3AuwZJdGZjkdLfAT347KKFa1HCq6bN9DdC5C?=
 =?us-ascii?Q?nUlgCKV6ydPH1BkI/hO4KMtIsllDepCrlKFP8F93qGG8OFPdzJhY3YIbOAqn?=
 =?us-ascii?Q?Wu1Mt/wV4kXiyZ/v+ni1lmLj6ma7Rf7zgU0yScbBSniEgbnsPAuMlYySe3Qb?=
 =?us-ascii?Q?N7YiAa8wcvDj2W7MlWKljyA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61d8ca3d-b544-4a5e-fc2b-08dd1824b91b
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2024 07:40:16.1142
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4qwLslbqATUTsvtSY8h2lB6Prgw+WivaE3pPpX4Hxw/a5j8iPesfyX54uuK1Lg4/i2LOwNuSL65C4BauqPW5TG3BzqEZFDpSxq2LRgYWUKWS9gQIJmwKmYnd0Aq7hNtA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB12968

snd_soc_dai_set_tristate() has never been used before.
Let's remove it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/wm8995.c | 33 ---------------------------------
 1 file changed, 33 deletions(-)

diff --git a/sound/soc/codecs/wm8995.c b/sound/soc/codecs/wm8995.c
index 1f9a9b6369350..c324cc5ea9416 100644
--- a/sound/soc/codecs/wm8995.c
+++ b/sound/soc/codecs/wm8995.c
@@ -1678,36 +1678,6 @@ static int wm8995_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-static int wm8995_set_tristate(struct snd_soc_dai *codec_dai, int tristate)
-{
-	struct snd_soc_component *component = codec_dai->component;
-	int reg, val, mask;
-
-	switch (codec_dai->id) {
-	case 0:
-		reg = WM8995_AIF1_MASTER_SLAVE;
-		mask = WM8995_AIF1_TRI;
-		break;
-	case 1:
-		reg = WM8995_AIF2_MASTER_SLAVE;
-		mask = WM8995_AIF2_TRI;
-		break;
-	case 2:
-		reg = WM8995_POWER_MANAGEMENT_5;
-		mask = WM8995_AIF3_TRI;
-		break;
-	default:
-		return -EINVAL;
-	}
-
-	if (tristate)
-		val = mask;
-	else
-		val = 0;
-
-	return snd_soc_component_update_bits(component, reg, mask, val);
-}
-
 /* The size in bits of the FLL divide multiplied by 10
  * to allow rounding later */
 #define FIXED_FLL_SIZE ((1 << 16) * 10)
@@ -2096,7 +2066,6 @@ static const struct snd_soc_dai_ops wm8995_aif1_dai_ops = {
 	.hw_params = wm8995_hw_params,
 	.mute_stream = wm8995_aif_mute,
 	.set_pll = wm8995_set_fll,
-	.set_tristate = wm8995_set_tristate,
 	.no_capture_mute = 1,
 };
 
@@ -2106,12 +2075,10 @@ static const struct snd_soc_dai_ops wm8995_aif2_dai_ops = {
 	.hw_params = wm8995_hw_params,
 	.mute_stream = wm8995_aif_mute,
 	.set_pll = wm8995_set_fll,
-	.set_tristate = wm8995_set_tristate,
 	.no_capture_mute = 1,
 };
 
 static const struct snd_soc_dai_ops wm8995_aif3_dai_ops = {
-	.set_tristate = wm8995_set_tristate,
 };
 
 static struct snd_soc_dai_driver wm8995_dai[] = {
-- 
2.43.0

