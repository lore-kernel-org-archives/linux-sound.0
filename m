Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011071.outbound.protection.outlook.com [40.107.74.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BADD8309DCF
	for <linux-sound@vger.kernel.org>; Tue, 14 Oct 2025 04:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760415803; cv=fail; b=PwpxKwhiVzWPtUC1IxO8NuBWc4Nf8NUt9q9cXf5taoz5xPPB0SbVUf8S+hix9BELmkg1EnK+drpPfmX9HntIXJ57pTD9hx3VYWRyalJmQAnNq0THkMj/n277KEfkpaRUwXex5UvoLPcnXgG/pq7T1FS672A+x0YLL6p8zeM3EGM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760415803; c=relaxed/simple;
	bh=rJ7iMKcG/fBAzu1PDF7zkJPAjmZuGOozBGC0apWrEKY=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=vAYct9xeXl0L9nGWj+MKAv2m96d9wccY7Uxa59ZzqRnKkJMmcSU5k9RJP8uFWkKC4DFTOPouEq19YSQq/pWsCxRzQZOGRZwMFlO6j1NbkFaJ+HXqMyuJF7uhpLD+zdN3hj7OfVsqlTdeG9Kv3Eg7KdEavNlSQufhwMhkyZyFNtM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=mCyY89Zt; arc=fail smtp.client-ip=40.107.74.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="mCyY89Zt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GHt5g2NZfRrBBUPapoTUTOmbw0fUZVy2NPKn7ZjWoCU8d9/XUe8WkkQBh2Y2DIyqSenlYaV69qlv8LBOZrCyB3uzow6WRMY7bqlWm9tjxoEivYoJuSJ1BYEY5ApRV7oqC43OCKDEcn973+ZsyMJYYnLOyKv1llbDVPY+61QJdkKjZANvXicFe7J8URVA2FiB38gruaVUvH0dtto9Y880GXoO8eYcUJjJEHH6CKX0G8Hv4sp+qfvifwNgvgvZzWnAh2XztqPmJ9F9JzrrmDKDwj2NKC8qLX6SmtbPAvEBoGbgf16MMux2Nk3QL9IlLWCooGU9n24dKYMHFLVwlvWKSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MnDD8YRDGwMFPu3d4MWv2Grsql+7KqG0rBibfF2LLwA=;
 b=M3jKoimERE+uG9ZGEKSeJy2Cn1PjHDGD3vQ4TVYSS8Rvk+GM02nSICTjuDBHkWx5c09SVow4d1SJZqdGnQaVbyYobKvl6YkA/9LIfsZZYuRhTaO4tx8NRmqAxZiXDuw/E8sL2hMOtAo2+0RrLsF54XnBaejXBToVSuotKeUL8rs6ZFzyK3r0AQQ5C3DjuYzQqyCZS6HXijeZzeKrAbd8MyFGvxDvvSkrxCtTWx3l70QfLshhEcvCAmnNw+kg6O3SB0wfc2ZMlvH9iXz9ZVkscIOKCAo36cXawpVmZyHmnfY8u+8/UHsDTA354xtD6LYSFtuc+YBMJfuvFjqj3zV50A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MnDD8YRDGwMFPu3d4MWv2Grsql+7KqG0rBibfF2LLwA=;
 b=mCyY89ZtHroBsV9dn0VGVKrVZkv4f0CpbYepr7UzPVrV/UBND0wokxfxm7XbZE64leCq1bXGdAzNf5YxZd1RYkxeItajNEvHmLuke3RMk5+XJW1ozVtCImfrszx3IaRBa7fXQEV5z/dQpC18u+1kHQU/6NJhNi0KjO4HM4vl2B0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB8810.jpnprd01.prod.outlook.com
 (2603:1096:604:17f::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Tue, 14 Oct
 2025 04:23:19 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9228.005; Tue, 14 Oct 2025
 04:23:19 +0000
Message-ID: <87frbmqfgo.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 061/139] ASoC: codecs: pcm512x: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 14 Oct 2025 04:23:19 +0000
X-ClientProxiedBy: TYCP301CA0004.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:386::12) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB8810:EE_
X-MS-Office365-Filtering-Correlation-Id: 46f1da83-aa87-4686-c18e-08de0ad96786
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3zko5g4X+2gPaCmF4O/2WiCXTHb+AsJYFtE8VVtC267/qWjZ3zbRIrcTJDSO?=
 =?us-ascii?Q?EkRRK0Tzjty1vSlnVxOHSaubt0ZIVr3K1/sbgz1od0i8lN16Ii+NXhTbPH2+?=
 =?us-ascii?Q?A6gOD+ABUfhw3Hvm2vYukfbmQA0s646KtXf7yrBCu0d1PGVrjZuOg6Msls6t?=
 =?us-ascii?Q?EHTNWvey/o/0uAOEsH2qPP0eD8WmwebTAkfOLuuQri6PL5/Kr2D7eiQYWO3J?=
 =?us-ascii?Q?/EM7nWGf40+W2v0e2kFIsKdRDxyehsNuGiXBmlNaa+d3zQC6zFUMZJbML4IC?=
 =?us-ascii?Q?WeVk4jtIl7RtgJYueNUcm7t1V7plmqyUoFclEDcvZx9kWTXzQXDf1dv8LJZQ?=
 =?us-ascii?Q?7TSmMQbI4QA3yLrJM7fnuMaNiDZwSnDHFIh1+a94LanNgZEoiip5eHRkQXZr?=
 =?us-ascii?Q?yO3jNvJipfEQe6GE9sZcbFG6IuYx363GagUNVgdO4YOBU4gMw0d8LAraglQp?=
 =?us-ascii?Q?W3TfAdFdxFD+R2jfZMa/pmABaJ/TYOWbWWMb69NS8Ke3j4XKf0nW82xCBec9?=
 =?us-ascii?Q?8l8pdZoixC52hKnv/mfN31xiY/EJ/OIYEa1PFqJaMMuY/OBiiKtQzEUtq6nH?=
 =?us-ascii?Q?tJurccF5pjDAZZMXrln4VmGyT9vMOIbzqZGiFGGhbjLH3anpOlPFGyZbcF3f?=
 =?us-ascii?Q?+9kwky/iiBWEyUsAM6zZFbDFX3mhA6BJgbvd12rRvBUgUhIRKSmVhyK7xsgH?=
 =?us-ascii?Q?ieKd9JfTiQfymI4YDImiAIHZFWTFqpONvCXpfXh5fwOwwdhFX0ci/sbe4G9U?=
 =?us-ascii?Q?imOWiQVh/e8MDMoKJybRYxcdy46RWT6CjlNXVuaFQBT7q9q8h0hRnwaTbtNi?=
 =?us-ascii?Q?keODz0yhXpZHVBHkmWtLfhGrViTcLschEjPiwOCd/883z7Qz/ygA412WDXHl?=
 =?us-ascii?Q?Od5jidocg2XcRIk9x9hOGQbujLdp3hK3oRzamGlqHAe1uVYzhsikFCnaIyr+?=
 =?us-ascii?Q?0sErYmoW3sYN2heXQoPT2dJ4fQ3oaMpRfnvrAeD1oYTxOYOWtzjsUg3o8ggG?=
 =?us-ascii?Q?KEHMGL+XsmSWznpnPYZRQpQkzYDrco/JdnOD7MRgnFOnIcMxoqrLvOlXqt1g?=
 =?us-ascii?Q?PRPi1MQg68HTp6qHLUa6fqZ+Ftm6HSEDSRA9WYvHVLqgyGqS5Iv4PaiYJXy7?=
 =?us-ascii?Q?IT0NpdFaO37uX/qJ0+tTNABfUNNHd8P0BbYh+cYbwcUvO1MHXeOHKR9tObhO?=
 =?us-ascii?Q?8hy7IZS1faZDxct6wyXfCokD/6RaNoF1otY7qUasa9SB4xoZ3a066yyOGB5+?=
 =?us-ascii?Q?X7ujv+coSsxzP1sU4luVti3KOL8ujFQvboqShMc2NnjDPZKuwHISQijyG9Tc?=
 =?us-ascii?Q?dG3vNzrtTKrgm5CJMyg48wXJlVf0YUW6gEWJu8EgDm3TaqhgUr8EYfZifRD8?=
 =?us-ascii?Q?JVPfOzUei7UmszH1tFrCcy+UKjqnLwL8b/BEhCajQ9tlsy4cXUjTLos1H2Wk?=
 =?us-ascii?Q?ds8GuEEAi1B+vjOupJ0q6sGKCQxyY44wsVuxlLEJSKqzUGSumFrxl7WxGUDT?=
 =?us-ascii?Q?HwqGVmfiZ8v/XVgBRDNbowY4nlr0iC/Mt3GI?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dLHoZzGbcUIazgejspkklp7yfBzu1HZMEYqQAeVBK2XdcccOzC92ZZO3v1op?=
 =?us-ascii?Q?4HAdipKWtb8q4WdE+o/vuUWU4lMfAG+vWDxYdzN+2dXAcYUPrk9vWrfnoDFu?=
 =?us-ascii?Q?l19qi4uIqheXSugId6GmVATJXLMidBjmJqO5cap6fK6GFtR86AyI0lehKopS?=
 =?us-ascii?Q?l2rbaLQ4nPrbb5zDl0f/x2ToUx6t0zT81z6QVKb8/95N/ingeXvTci+REht1?=
 =?us-ascii?Q?yQhsYrs5qtD5PpX0ycEuQ/qqSLAlbx6PVcYZnv6yPYfxDoeJw4+mkuPpi5sp?=
 =?us-ascii?Q?I75Q+td23fpakN0HMpC8wr31LYoIzxPCStS1yqGqVVeCHZoKHo27QmcBshE/?=
 =?us-ascii?Q?uqpwPpW3t1faNIhCaMtpu87cdcwbARlWAaY+k4/JDciTp8hxD98KVa0ip/kH?=
 =?us-ascii?Q?sfUJujxr8DOTzl/BTacsHdIjg9u0ASZgBLJktTA5gq4//4QLJmVEhMG2WqIY?=
 =?us-ascii?Q?6Ea1z65ub9PSUMLUt1xjG/swAU3MqnY9BYbGGH174dxEIY5aI5wxSJq+49ZX?=
 =?us-ascii?Q?i0hXAMVODXAEoI3CykyJ0r5B8e8LWkAXQSBA+ktJPkYrXsSxNqPgkiPKvHWj?=
 =?us-ascii?Q?BhZ0pQkwJkUPnXqoJuJRQouQbNkPAWfz6MKT3ltpKj7N9Gh0AFex9/7jGUgG?=
 =?us-ascii?Q?oSPKGUo0qsxGb4GKm1Gb+bmNTfWEEOsur2RFmTed9EjJWTGmg7ttMUcYQvLZ?=
 =?us-ascii?Q?+JOyCHEM0SOLKUWXggEm7yz4SWhNZ4oTX+IT3aiFopfUtbHJy964+876puUG?=
 =?us-ascii?Q?T4WNtYjadI5ZnyGBOaUwq7GzkMeHSdEyARdDH/I9xa8egekTgOIhT62u+MU+?=
 =?us-ascii?Q?SG4ikKl7WGIlRAxeOLTizntWmLy087jPzgJf36bKScx3G5bQV8b388WwciUK?=
 =?us-ascii?Q?AaDyqDlZgurI69ClF8pdsA+g9oU0oVu+0ctiYwLX+oNKryZ07xs/BUN3lGDB?=
 =?us-ascii?Q?taQ9wGokfl7NR+9L0kPNfFMFEgfiIw5h2zAvBVq3HglUdQloQl887P1F7sjI?=
 =?us-ascii?Q?Jd85gMSP1oA18ITZi0oWZvrmHKLMPxqphAREbWSDMYMxiWR/o7rRECmpdK67?=
 =?us-ascii?Q?n9jlqLUCF5muYU5k8C//HrgwNyUlcC8t+h4yXyBucdGVPCnUOPOn2ObuPhuc?=
 =?us-ascii?Q?26vxTP5clM/e+19BvNHfYHGRzpIXCHoku/k1q4ELWkpSagRAOja6qwD6ITjk?=
 =?us-ascii?Q?ndYpqI3pJ7/jXyk/g0S5DnBpoM0XP/TD+YBd/IPkco4Rt1Y65tyOBiU8d2sb?=
 =?us-ascii?Q?sftskzH3NrdKn+NauooTooQsRvqjZrB1Ze6LYqbq46oaK9uMo4H3Z6zeTmRW?=
 =?us-ascii?Q?UpMdDSIC+jX59r2C4LWqIEiRdhzl0mtA82QtoLRDF+rK5l5uxZbboGXEpoRA?=
 =?us-ascii?Q?gKHOZU+j3NOzRKEQdFuoJstJEDQNbcFb1bgHtPNSUTakKtTR+ZkixRny9UZg?=
 =?us-ascii?Q?7PobRrqNpyoQtp1JGrbjdwH7BH1RKYTfFABlucxPZSGA7xaDdLu0oiZUBI+h?=
 =?us-ascii?Q?2Gg1JUzIM/5qx/9xAJmMkhk5k6xk3nzOowKTsa8AqDjAdE4Rc65o+dEQIs8h?=
 =?us-ascii?Q?3DO5C2uY2ZGHfEBGdFVBrAQlAzt13VF+DPI0IT1G20Hgl/OCf+gpmUAasjDd?=
 =?us-ascii?Q?lDtgnC8xmkBOusUaH5G3k3c=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46f1da83-aa87-4686-c18e-08de0ad96786
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 04:23:19.5215
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L2bOBVZ9S/TTCKgypTMPOaP/TDKqE6oLBj4BRXZjlDlrnLzegFmVXLuSysZOvDJqQ7jKaZLjfBbSkiXR9nULWs77Yh18l4JaC/h2ryWBgYdlZf9ECtrZnl1Dvqn73yOQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8810

We have very similar name functions (A)(B). Both gets component from
snd_kcontrol, but (A) is used in callback functions which is registered
through snd_soc_add_component_controls(), (B) is used through
snd_soc_dapm_new_widgets().

	(A) snd_soc_kcontrol_component()
	(B) snd_soc_dapm_kcontrol_component()

(B) is using very picky way to get component but using it is necessary in
ASoC. But (A) is just wrapper function to snd_kcontrol_chip(), and directly
using it without wrapper is very common way on ALSA.
To reduce confusions of similar function, let's use common way on (A).

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/pcm512x.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/sound/soc/codecs/pcm512x.c b/sound/soc/codecs/pcm512x.c
index 007dfc0fa2249..0c06f1f0da3fd 100644
--- a/sound/soc/codecs/pcm512x.c
+++ b/sound/soc/codecs/pcm512x.c
@@ -224,7 +224,7 @@ static bool pcm512x_volatile(struct device *dev, unsigned int reg)
 static int pcm512x_overclock_pll_get(struct snd_kcontrol *kcontrol,
 				     struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct pcm512x_priv *pcm512x = snd_soc_component_get_drvdata(component);
 
 	ucontrol->value.integer.value[0] = pcm512x->overclock_pll;
@@ -234,7 +234,7 @@ static int pcm512x_overclock_pll_get(struct snd_kcontrol *kcontrol,
 static int pcm512x_overclock_pll_put(struct snd_kcontrol *kcontrol,
 				     struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct pcm512x_priv *pcm512x = snd_soc_component_get_drvdata(component);
 
 	switch (snd_soc_component_get_bias_level(component)) {
@@ -252,7 +252,7 @@ static int pcm512x_overclock_pll_put(struct snd_kcontrol *kcontrol,
 static int pcm512x_overclock_dsp_get(struct snd_kcontrol *kcontrol,
 				     struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct pcm512x_priv *pcm512x = snd_soc_component_get_drvdata(component);
 
 	ucontrol->value.integer.value[0] = pcm512x->overclock_dsp;
@@ -262,7 +262,7 @@ static int pcm512x_overclock_dsp_get(struct snd_kcontrol *kcontrol,
 static int pcm512x_overclock_dsp_put(struct snd_kcontrol *kcontrol,
 				     struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct pcm512x_priv *pcm512x = snd_soc_component_get_drvdata(component);
 
 	switch (snd_soc_component_get_bias_level(component)) {
@@ -280,7 +280,7 @@ static int pcm512x_overclock_dsp_put(struct snd_kcontrol *kcontrol,
 static int pcm512x_overclock_dac_get(struct snd_kcontrol *kcontrol,
 				     struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct pcm512x_priv *pcm512x = snd_soc_component_get_drvdata(component);
 
 	ucontrol->value.integer.value[0] = pcm512x->overclock_dac;
@@ -290,7 +290,7 @@ static int pcm512x_overclock_dac_get(struct snd_kcontrol *kcontrol,
 static int pcm512x_overclock_dac_put(struct snd_kcontrol *kcontrol,
 				     struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct pcm512x_priv *pcm512x = snd_soc_component_get_drvdata(component);
 
 	switch (snd_soc_component_get_bias_level(component)) {
@@ -393,7 +393,7 @@ static int pcm512x_update_mute(struct pcm512x_priv *pcm512x)
 static int pcm512x_digital_playback_switch_get(struct snd_kcontrol *kcontrol,
 					       struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct pcm512x_priv *pcm512x = snd_soc_component_get_drvdata(component);
 
 	mutex_lock(&pcm512x->mutex);
@@ -407,7 +407,7 @@ static int pcm512x_digital_playback_switch_get(struct snd_kcontrol *kcontrol,
 static int pcm512x_digital_playback_switch_put(struct snd_kcontrol *kcontrol,
 					       struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct pcm512x_priv *pcm512x = snd_soc_component_get_drvdata(component);
 	int ret, changed = 0;
 
-- 
2.43.0

