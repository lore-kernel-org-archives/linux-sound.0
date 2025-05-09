Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010016.outbound.protection.outlook.com [52.101.229.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3361B4C7F
	for <linux-sound@vger.kernel.org>; Fri,  9 May 2025 00:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746751007; cv=fail; b=rt8EwOz9TiJJ8HPq2WEkCZLdCifbc7Wa0EfJkCV+sHgJ6Hl2ysuIK1bGVx9xoz0luGxadMoWcZZfCn25WzL3yySOPOGsuJBp4pZn/AQ+AVzGiAloiFDnK0bX3MaPX1LF3TWSnI4/qOQ7aLIZdOstY+09yzngcbjUND+QVSZqQ1M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746751007; c=relaxed/simple;
	bh=DGSOzwy58s6UzLNwovm4MfXGG+gbry2131fsxWCURn4=;
	h=Message-ID:From:Subject:To:Cc:Content-Type:Date:MIME-Version; b=WGsP2/wtGS7BUHCIjdieJYepxNvaNXFzt1jMGHoir41XoV5/SoPNKHejHgvGGV7jKhJAWzmkTmf0bdSGmWf5CpOxZaO3XHVCkX1F0agLxXZ9php/nE9QG2hfYhtmInHCoanrbxnL+oJIaloa0N71J9yJ8BSniHxRZV9N7IQMMgo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=l5adUI3T; arc=fail smtp.client-ip=52.101.229.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="l5adUI3T"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RzNVatX24lTKXRaTjb10NeAgZnf+8jnbknIjNd4n3nEfqDonQytrXrczVeXAWS+6CooQG3u6rYAnN2qWiSMce2ZsQjK/RFomvp9aS/eI54npbNL4JiSJ2ZfL6uxpx+sKaDWBTz1m/Rmz2SYakqEAvyUCLuIGEtqmRZbOIMser4QM0kqu6xIFtOqSfgGcGvOM8yqLQs/HH9Wy922LVG2d78Bcbe2VdhMj6Fall1sYgyH4XsADyQ3k49KZdvexlZCZhO5qa1yEvzj6DRdSKYqotRVfozr1VVZW7zWo6pOOYO495gK4TSVKNtky/IkGtuVCqNVJA+kMaMvMwpJ3e3+HOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/FUCBiZaIMjvecckHM5Q+p/0wvETPtqwYL5JHTj/4iQ=;
 b=ShWZH9VBrgixWAMJlapcawSkNCxpBWuvXSK8EfK1Mp4++25MJVMy4dlNe58HbBAxOozN4l0XuCdxan1uf9XXy+Vb88u8Lpx6lqAcFhMm33XL1hIVdY4aiB9smDLKmfgy5VhfCa8Z/PoMDRm8X1SKqIeYbX28Ylp9xI5TIvHydWkPzPnT56gkYIKZ13BdUhr6fyCNb0aZ3JWMxgkVPCE6nWW6tU7hCDdhqIAqVUVfSs23MrLEd1gJHTVhNZ9yeDodzmBddgn/omYdC+ZYjMiyO4uZH6hs4N6gj2rPN1Mgs3/Fo5en9fCS2juI77PeebTGwysg/3G8/o6KbJGzORS0Pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/FUCBiZaIMjvecckHM5Q+p/0wvETPtqwYL5JHTj/4iQ=;
 b=l5adUI3T65Hgt3HwN2XvK6RfPTEKEaIijwtCU7JAjWvB5vgWkPGIKJ7+NBYBdQ1nfFI1CWye7pD8lFCJ25zFIYsMuG7luYc8hPLTyf7ZcF0mLIpJUQ7yu1KcRKLqn/a0U4Yr8njNk2yuPoHqYa2Q6a6MtVBc8V8XqOmzcrPimys=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY3PR01MB11320.jpnprd01.prod.outlook.com
 (2603:1096:400:36f::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.24; Fri, 9 May
 2025 00:36:43 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8722.021; Fri, 9 May 2025
 00:36:42 +0000
Message-ID: <87ldr6pqlh.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH] ASoC: soc.h: remove unnecessary definitions
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 9 May 2025 00:36:42 +0000
X-ClientProxiedBy: TYCP301CA0019.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:381::6) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY3PR01MB11320:EE_
X-MS-Office365-Filtering-Correlation-Id: c19cde86-cc65-4adb-f3da-08dd8e919210
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/5sw0SDlNia13oRaq/wh1hbC6hIhdIPK885zsJv7KKn4GA3atZeK8RDdTXGh?=
 =?us-ascii?Q?B/pFFk+GNu2bzn91LSVdc9xUSzyEa815I/yEQpQzExvzgpwm7k3nv9AVZeIR?=
 =?us-ascii?Q?cNvWOg7eLts9IyDgbXovT8qJlqhNbTidyBopRVe97e6hOY4Dn/oM1zRmB6Y/?=
 =?us-ascii?Q?eee/KVvWyQ1dIs14yml/LeLYPiMfKoV6Lw9fHDzygyDFQGfiyV3/Apz/5Brk?=
 =?us-ascii?Q?rtIabJnFmlMuwilv7UUS5iUGBojZXMG72VLDbqcGj5mI0pg3auOniZeUMT1d?=
 =?us-ascii?Q?fyXoeK74m5oFmEKT+9Z+6exSeWFiKnUeq1BO7w5GXATwvjk2LMFEaxgCiIW0?=
 =?us-ascii?Q?YnWta6+WWNcHr36nZPXPC21iRW3Twb4Y0T65Z9KOfj8elyjPVVY3CbU8viY1?=
 =?us-ascii?Q?UP6Qvp95UdCj0dyZFoEGZ+q9DW1MKNWGiFIBbc4YXVaQ7cZNVPqoZDYm43WO?=
 =?us-ascii?Q?0UmHCcF2EhGnXN1e/+35a3cpU01dRVFVKVd2cf362n3dWT9qAWzGTzYVTp0u?=
 =?us-ascii?Q?xgrB6D56PN/uVxM0suioZJI9OAB8W6cvwtU72zG1Bwqq1WuOhT4ESOWWQD9+?=
 =?us-ascii?Q?PERo6E4oV1CGemM+n2tsuYFuqOzwb1MlXWJLJatZiuo9dcyuRIp6ohJp0fIG?=
 =?us-ascii?Q?4kB/RgoonoDtdgSINjbObd/u9V4zecFKaTEuTtbaXpKbwWn87rAqYPl2YkPS?=
 =?us-ascii?Q?iVpu3dqJi+675PVzp/5Zz20lfblHPJPwfnBQRc3P+LxxEccFbFxQB/0mcnwf?=
 =?us-ascii?Q?R5FsRc1WNEMhRBJ9FIXCUZG1aDlO3KmH/pkCDbnzKY9oHV0cBKIKHc5W/pNV?=
 =?us-ascii?Q?BeWTzU8T/HWsUXfT82BAbKlwoWxx7hp/IgvrwUf7IkYluymzkmQX03Yorw/2?=
 =?us-ascii?Q?qeiQg1Jcuta6Ka2pKl/4UcMp934KbCmzMIqPGfAivrp0mk56uJPiXjucNzDY?=
 =?us-ascii?Q?R6UW3y9hqqQZ1xgaNEOWQYAdbz8BVR+p1MiT9AURtA0SEqKT8jCCo9aM4Won?=
 =?us-ascii?Q?IJAHUOKrfnmqF/rSueGXO3gYkMdWfbX/ZA4FVEFppzMyN4tl2oea/RilHhJ4?=
 =?us-ascii?Q?me+Ml7ps1t+iFbQ5xyC7Z/aCHAY7/+ivKwh+sif+Rc+1twetkRHgHiVbWRi1?=
 =?us-ascii?Q?ZmyCal/BTF+WK21cc2NkZbUSljBpA7bDO3Tupewmkn1HEdd3jeQo3k1YetqI?=
 =?us-ascii?Q?XElG1FoB15pWHs0VAAzooMdVDkIKRmVVBfvHYLAHeNqfWiOgXyfwyuWOFOfl?=
 =?us-ascii?Q?eeVJQId7PA0TwF3uUX6GTFb6ObD+mmM5z0yUXsqXsBUciaNzwUCOmJFyHRN4?=
 =?us-ascii?Q?ls1ItaJyYBhqdDeH3DYwZLBrn8UrPO6+IeHkC9fqQ5QeGwx2J/4CWSj8FUQo?=
 =?us-ascii?Q?Fhvmuv3a+LGCA971taayc1vNFGRHrpf19joM1O2/pX9ERIY45Vf69S0pbQXV?=
 =?us-ascii?Q?jneMVKh6jovL2n8/z8fQNjoqmKxmXTyQl7t7hsTDbRNp8MbzUIPUsA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lrzRD9iZkNmRGtG2osq7iqaa7c91dPcgfAO+7cMz7N31mva1T9ovWUXrKJ9e?=
 =?us-ascii?Q?zRUKQs49fj7a0w8JNEIhR0wZxhpcU20EnSI5tYHP87gRAHIJ6V1sNNh/l5k8?=
 =?us-ascii?Q?mxXbMHDTKOF26RWMEtCOxgoXx+HWmSpBCTPNQ1g04Po3TcBiSwWJfOedJla5?=
 =?us-ascii?Q?hr1895wWYAhHG70Qf1iGL+mt+E6kv2lg4g3a094Bg/or9R5uQXJA2l7esis3?=
 =?us-ascii?Q?UOyZ/ypXsLSc7As5J1cbR+fvHzPBvnzm/MI30b1P5P54grOd+uzkGhISbanI?=
 =?us-ascii?Q?3YuGgpx2Pe7CRayaaw73JQ6eEUSyV7AMYotoEq5i8w3GXHNyntLENS+Lwhra?=
 =?us-ascii?Q?u3WulXzfM5zZ1Lvydw9iMd1QL/fNuDZGoJWvg3P6dUM2WAvWc917m4d73qb4?=
 =?us-ascii?Q?G6K5KYFN9Tu1qIGB5vUu6cx8/SZFYf4c+wHIevTJUbX34cmQensRcHd6PrF5?=
 =?us-ascii?Q?4A+gfxA2yeY6Ly9fEMDAl/IPaYchd92HaMxZhBUy7ZY7GPdE6wK11KunCEC0?=
 =?us-ascii?Q?RaftLN9IXlzpf+vPr5uKNWUZYlHau1KOPX4Zsw52uahrJlDwONC8YkckKzOy?=
 =?us-ascii?Q?rv6ajJ/83OuRj4+V9GGlz7EUsEAT1zx/MFxd0yND4nQfaBZvlW+mFYMmXvRM?=
 =?us-ascii?Q?HY0re0QqPGb6p/4TlKKvKCCfmfKe4oQGt1DJkz3cM9JJmO2XfgSPJ7kXoKaM?=
 =?us-ascii?Q?o1ufOZKMFlaV1h/etY/0TvHtdf4kRMTESjkH1+SEIw7A//ebnYnuY7NCygWs?=
 =?us-ascii?Q?TWZjcx+LZICSlEevdq7pRWTFl6o7qCwXdHJAuB6AkNQIN7Gv/PD39tvCrK4h?=
 =?us-ascii?Q?EX7aY6XJu7aHlgqJqR5s2Svlmm/bgLOF31mWkx2x5g+W3UYPv456lddQPRH8?=
 =?us-ascii?Q?nKFcVN1QZpham6bc75oVx1uEJcfJezeomkJ57iTcvlE/OlOqw5/3c+QUl2vX?=
 =?us-ascii?Q?wqM+OVptuS3S5bZQonw2FqxZrh+iKsv+hpOKU/laRogR5/bkIzfCLDoM3gVT?=
 =?us-ascii?Q?gvO1umNg8uB8CRhamHfAbaC+Sm6jSZoSep11sIuA9uXwr/n/Z4FLsOz3Vgb5?=
 =?us-ascii?Q?4utzp9nDv8qO2MDsN4gpgmtuXCPTE2UMU6sxx7jWq6GUogUlbNbhTLOrgN2d?=
 =?us-ascii?Q?ga4+5icvdrZzB9qhp4nR45Bvd1zKMAi8Djz55jNKGxmurjIYRg6F225ETbji?=
 =?us-ascii?Q?Pxvb0h49kSAW7HQdO9vGcTzOO9DrWQ62TmpmOHyc4Jj4G/K5ItA4pIUdz5VE?=
 =?us-ascii?Q?WOsB5pcRuIh0+BP68tMkhljK8Sy+xNPJnD5/JzU611wGHk1HyNrQs03dlkxW?=
 =?us-ascii?Q?dkIfz8WHm/p154VUEGXUZUuCGdlKoz1C0F/NSBYXAI1WcriLPPOgcReU5ByW?=
 =?us-ascii?Q?RwQCCgqRYw74aKbAwbh2RNvFEW5ZZvicdX3kfxwnJliboq4lo82lhGzsJ7Oq?=
 =?us-ascii?Q?Pbjnjrb7hegF9gF0dCQpjkhakLqUMyhOFYfLsZCRXxSywzu37dST9LzNVrGF?=
 =?us-ascii?Q?BvW1SvtbxKM4RnknLBdl/tjD8scU44QNm9mXfZwQVDJ0UQuoepS73/guUL5q?=
 =?us-ascii?Q?JmABA+l/nr3SdqadJw2pn4Jy+mo1hObvfy0qtSAtQLzWUUd4hSGgZ58u7gtJ?=
 =?us-ascii?Q?i7ic/PIN/p89CbDjPfpL9oI=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c19cde86-cc65-4adb-f3da-08dd8e919210
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 00:36:42.9324
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LEiJlZErvNR8jPtjmfOOFNTGDUhE5ZkWLlmX7fDLpub8DAWMt3s0RyqwAc8k2pqhh6yIpwEaiShe4ickdiQfIIcqdup3D/ueabGFYtw8Dh1ycIepOLHwWbECvGJhtmqa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11320

We don't need these definitions. Remove it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc.h | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index e425394c3ef46..dfd3496221cf8 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -394,27 +394,20 @@ struct platform_device;
 #define SOC_ENUM_SINGLE_VIRT_DECL(name, xtexts) \
 	const struct soc_enum name = SOC_ENUM_SINGLE_VIRT(ARRAY_SIZE(xtexts), xtexts)
 
-struct snd_jack;
 struct snd_soc_card;
-struct snd_soc_pcm_stream;
-struct snd_soc_ops;
 struct snd_soc_pcm_runtime;
 struct snd_soc_dai;
 struct snd_soc_dai_driver;
 struct snd_soc_dai_link;
 struct snd_soc_component;
 struct snd_soc_component_driver;
-struct soc_enum;
 struct snd_soc_jack;
-struct snd_soc_jack_zone;
 struct snd_soc_jack_pin;
 
 #include <sound/soc-dapm.h>
 #include <sound/soc-dpcm.h>
 #include <sound/soc-topology.h>
 
-struct snd_soc_jack_gpio;
-
 enum snd_soc_pcm_subclass {
 	SND_SOC_PCM_CLASS_PCM	= 0,
 	SND_SOC_PCM_CLASS_BE	= 1,
-- 
2.43.0

