Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010048.outbound.protection.outlook.com [52.101.228.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E82423E0C77
	for <linux-sound@vger.kernel.org>; Tue, 29 Sep 2026 05:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790659770; cv=fail; b=TRW1sO48f8qeBiaNM5z2LGbbsDCbdji8YWOgZKuMmBkzDQP3NdimF4hL+JJD/OUpv+Qo0dsa3ldQ2+lDN0pFiR2lviWPvSTRwqomjUe/B+r6IhZ+A1N2DhlbKZBDK4I65JYIReKmfiTpuY5D8Z3ppCNfq2ECqT5RB88O9GtciJY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790659770; c=relaxed/simple;
	bh=1JBJxDEX5Cfr7WBW/5h1fMjjf/v9cHmiT+9Zt8WmsF8=;
	h=Message-ID:From:Subject:To:Cc:Content-Type:Date:MIME-Version; b=aMZLEbzbIXTC9Z59JqrfWSoA+QO+Z1a/zNhKi+Y7v66MEQth5dprKU8VcBc+Q69RgXO1Li5mFH1NXMA2cjb9dW+Qaukx1ErkMf9P9y66TQo9uyXj146f1wpcD/IClFGaE+w+1kpI9es2uRhQBX0Bg5tn1dTe7y4vllBsghdBjOU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=WAFomSnV; arc=fail smtp.client-ip=52.101.228.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="WAFomSnV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mngz/OiJyYapajRJXkNRm46XvbQf7XYIYm6l2CIPo5T+RNG1ZOm6oXgCk5Qy3Xjj1Bv6GCItbkS1Jl+DSP5O6cu6EFvDFIaTlUTk8pkfRNUumfP7mE/QwCogMVlvG2QKZNMoPzhizQQDD2MZQReuBAn2yKhUyM+egsTMt6l9PF+HT59aOtPp4+6E8u+hKLBileCwgX1ssf1rInIBx2G0eCMS6+ys61BQKRdRFMIaIftINVWB7iEEzDlQRShkXqgzOaKRL1GlOKpRRRoGSgNjKZO7acHdy4gAopGQjIMvrWALiM9MDQ16dcvUGfypTBhpzWcTqrKCbsRnXFmzyuYUDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XGs4bGcBs0wRUrf03ijjOJcshprPu2J8MXNVRw1qjGU=;
 b=f3oHsq4Uq9S6RG17WdQqKuJRyXpVknJHJYEbGAz6f1ZH3By/ytNZ5k+X8SyR9yP8gUznKRSGsZn7BlCX+RmbRySUd+hGbhZ/xcucYGdzZWONs7G1m4jXl/W2fqkdb2aTlrCNtCdsd1amtuoZtGF0mqvFxxSq0keMiPvjfQlKzCxht3lbVobc/g7lx4aGWmzx0+V8k79Ga+mx5NfayVbMtMbS2r72aiZuNyi9o4QJqV0JQHje9/pn4k82HhQ/qvrErBUfs5apWkFmAhw86aKUqnZxdkyDDp3dyagg3YC5IXYvDFzznuELw8SjcpsKoNT/bekTQ0Tsubhz/NFUIKL0Sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XGs4bGcBs0wRUrf03ijjOJcshprPu2J8MXNVRw1qjGU=;
 b=WAFomSnVvE/61629Lcyt5rr3bBv5kTuCEOeY9MtJrLlos46t74Zv4019aWviP26YkbArJVL2hPXXW61Aqsa5YnB5YZWvLxPYPlkdxnx79NOAIeGWagpE5th6Pqoz+lnj9sxHs2fxjQwmu/wGP0rpPwYpX25exW+WbkEvd4JXK1A=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB14118.jpnprd01.prod.outlook.com
 (2603:1096:405:214::12) by OS3PR01MB8890.jpnprd01.prod.outlook.com
 (2603:1096:604:153::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Tue, 29 Sep
 2026 05:29:26 +0000
Received: from TYYPR01MB14118.jpnprd01.prod.outlook.com
 ([fe80::846f:9035:6a33:1f45]) by TYYPR01MB14118.jpnprd01.prod.outlook.com
 ([fe80::846f:9035:6a33:1f45%6]) with mapi id 15.21.0451.022; Tue, 29 Sep 2026
 05:29:26 +0000
Message-ID: <87pkxweibu.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 00/14] ASoC: soc-component: move snd_soc_component_xxx() to soc-component.c
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 29 Sep 2026 05:29:25 +0000
X-ClientProxiedBy: TYCP301CA0033.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:380::17) To TYYPR01MB14118.jpnprd01.prod.outlook.com
 (2603:1096:405:214::12)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB14118:EE_|OS3PR01MB8890:EE_
X-MS-Office365-Filtering-Correlation-Id: daaf378d-8a0f-4a19-2f7e-08df1deaa047
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|52116014|376014|366016|38350700014|11063799006|6133799003|10067099003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	efUczPx/HuWa9JJGbhr4opZW21YsjM0D8Iz7CzOB3ZBGgbrMaBfkNai9RIwX3IFOCe65Ma7aMDNcPKQ3byn6GO4WqO9arWMniPRSWGCsZHU5KOle549Pj0wFpUmBgXNvBaWh5AlDN6lw6dOiS/GKUrONKD1QFi2YnmOWkKpJ8cU6FCdVJIkIqQu1xN0YZxgq7DQI5fOXQ2XilxujlIuZcJ64EbM7Y1OJmnx5r+0zxuqDa12cq7bC5BaI2ZoCgn/k8rDd+V2d4SXfRa47l8ZIlqSNAx8EeC9YjEhZ4sxXgh9+rj0o0D6NLBNRxw2DHD2wjzkfWrt9NL5N+9rSzO5ku6f/KUleUkbP9nDQOPwlKN7or20AMsg/lqMXozr/T7lFdxYqHn6Rz2vi0Cm7iITZnZMxfzGjT0U4qsa2Xsu61vp7MbUjYdWKMzvbyRIGdKmgWrLMNK+4CvadT8tOmtZni7ugK+QmOJz7ZccZstFtslpJLKX6bR0UdlGjA8bfx5NeTl7xr120PFKD9usGwm/MxPj7MkbNApKPY/ToGUIubEClH6izZgBtORq69S3AruFzRLCZkIzZkbEYsuB7AARzHfQMYP7sqPUzunxMC/HDWKLLURS7TSw1XxyfkFgmfYxdcJaSWhPz/2VZMNWwRpUXUq2iSnaZ7NThCjgBY6jgOhmlZDEjADYjZNmoTxTPlIKSLoIj1NI4wTsl+AcBU9ZNly8i97E+PTRZZJVkKF71xsc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB14118.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(52116014)(376014)(366016)(38350700014)(11063799006)(6133799003)(10067099003)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YQqQSJIhyT7AepD2goOJZBTNSmU7d/DpTIoN8htyi4kE2BISSYMa15fKpsdJ?=
 =?us-ascii?Q?S1/+dio69ZAW46RLiLUQWvIa6puIW/DW4U+TUU7vxvv8SApeHVU6KlRFMBs2?=
 =?us-ascii?Q?T+qnwO1C4pNggWOgcwN4sAXfM439mqDoxivXYVi1lNxFqxamqsbB20dQiwR4?=
 =?us-ascii?Q?D2+03FX7h3+ZgO2GCZ/xhDcPSmQR9BJOawEtkpDuqOeZJyMEpAz5NeOv+PKm?=
 =?us-ascii?Q?mKOONwSRk9ef6j+wfmBjZrAjpkHa9cjvfy03J59hcWHTU1mlwN1jNspWVRpF?=
 =?us-ascii?Q?daU9Py2Q4fd+BeapwmvcHp1qwQg0bMIlKdpTN+upmPJIuuEVwlrYZylX8Onp?=
 =?us-ascii?Q?6r8uaff5MdN7StN6Eun+IuCzxiBBNzEj/6hdjzQ3lvQulVez8zqnltJpxDb5?=
 =?us-ascii?Q?OQpoeUCyyEqX6dknjXkV9u8uXjmgQgsoEWZ9GZOyRTzMe9s7+Tcu+jRmZ22+?=
 =?us-ascii?Q?h2K9WDUURvdGGK0BTfLYLET6iu+MDAPkJQWvMv1AvSVpYipeJpXR70h/ZKuL?=
 =?us-ascii?Q?Icxw399me/uCdAW6BnKMyuqZzJU1IFkMtnqO+DitBeoUtVLwf99NfHwiZQUC?=
 =?us-ascii?Q?eyZRJVIYQgyYlsb75JUXHgTkq+TvY4sRoU9P/Avk6NvGOuVgMA93mc2yMBsn?=
 =?us-ascii?Q?RdAXmc7I/HjFlkq/YbGQBYCCY5au64FKvt4Qyiz0R9GuzWeIf8wtY2a18Pq0?=
 =?us-ascii?Q?zYfDSLOSgpsujSvftGplsr4QwCUtor5dzGc3/8nl95pyFxjdzdmP6vogXAhy?=
 =?us-ascii?Q?8DEtNBbY3TX31MCxo1FfxaJtdyYv5WVenbBSv89Xq6G+fyTon5x9TrWTsUoh?=
 =?us-ascii?Q?iUeFpYR8dzimgWyNDnXjy60y1eHeMxib81gn2YVLbRtFNak4TfcCqwVuORrI?=
 =?us-ascii?Q?8aY8D4NYxswCTfJWuqdVXRaWNZB8q27V6sujRcusLjJKMoKO/rJEXHOn5nyW?=
 =?us-ascii?Q?8ke+VX/q/EaooTV3B9RJDLfkdswZtllv+TCxt2ylui6+ABPsRMr9J/yxXOPY?=
 =?us-ascii?Q?pSzTBn8fml9qyozXSo8IaQBgjvE7b4T6n688KjC5hm79DyEZISh0JWkuhMqh?=
 =?us-ascii?Q?U3jTqBsGseTIHbQcec3Atgr4ZvEWEycdamWbkzycs9AzCqoI7+bqIhW8Iiqw?=
 =?us-ascii?Q?TrMc7pTB1xHv1Q7p/XFMQB0PnCAjRknLhiRkx3mMhP7AhlzNz9CCFk2JzFBg?=
 =?us-ascii?Q?bywrJTXR83LXQI/5u4rbgjFL749sMRrHFM9JYnnnuqfAqjLICzJATqbVNa1b?=
 =?us-ascii?Q?m/CmjwwlZAw+/54WqwPjs7ztHI5HpgBJhmVnrg/xwI+athbIlV9HQzuVE5pw?=
 =?us-ascii?Q?sm7lu2sglR35Q067SXgseDRM0Yml1wT4vjbj8U79NkQHFf+twyZmGjNiN6U8?=
 =?us-ascii?Q?5Anh0/JT0rVsMYkAndTX5Rm6cnnJAjyhcPrvKmoEFSiclMHk3Vq1kcpRsutP?=
 =?us-ascii?Q?D33bAUYL8woow2f5UwcY+Jnlu630dzMuCDQcaSLcNiV2C0aAOS0T6U9ElAiW?=
 =?us-ascii?Q?wIzLBLxfkbphr8C4KiRJoITX6euYcH4AEWMPPcbkVMy0EKVPkec4n0rP2u/8?=
 =?us-ascii?Q?A4Y5ussaUyINl4LiUI6Zi2F4EDOL4ai8EFBSEyN1kuxvjoCoTY2Gdk+hGIae?=
 =?us-ascii?Q?IMn9Vg2Hx4x+ITEPLTb3jlbD7zdBWzye7Hdu8SRvdilIv2jbe/FQcJaFRNZK?=
 =?us-ascii?Q?NdpiUh01sCIXcEqmNUGT28dzcGim/FbhV+48RvpfBT3vVt0je0BYmitiX6k0?=
 =?us-ascii?Q?D96MLysYd/qjkvAnt0+Ljgf0Op+dl7o=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: daaf378d-8a0f-4a19-2f7e-08df1deaa047
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB14118.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 05:29:26.0225
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n+dD0d3hYdV3XwttvUTnLvUv3H8Ds/kyCaQjUoiaIjiBHzVkrz/HF434z7jvsv+A6Lf4dXs4lc8lVgPf7a8/bZC5EvXZlI3vZWX61FwRLJTWWUBtaJiV1afONuItxzGW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8890


Hi Mark

I'm now posting ASoC Capsuling patches.
Current status, and this patch-set postion is below.
This patch-set moves Component related functions to soc-component.c

x: done
o: This patch-set

[x] move DAI functions
[x] add new DAI functions
[o] move Component functions
[ ] move Card functions
[ ] add new Component functions
[ ] rename DAI/Component list
[ ] move Card functions
[ ] add new Card functions
[ ] adjust Test
[ ] use new Card register
[ ] use new functions on all drivers
[ ] Capsule DAI/Component/Card

Kuninori Morimoto (14):
  ASoC: soc-component: tidyup be_hw_params_fixup() define position
  ASoC: soc-component: replace bool member to bit field
  ASoC: soc-component: move snd_soc_add_component_controls()
  ASoC: soc-component: move snd_soc_component_fixup_controls()
  ASoC: soc-component: move soc_component_to_node() to soc-component.c
  ASoC: soc-component: move snd_soc_is_matching_component() to soc-component.c
  ASoC: soc-component: move soc_{probe/remove}_component() to soc-component.c
  ASoC: soc-component: move snd_soc_component_to_dapm() to soc-component.c
  ASoC: soc-component: move snd_soc_component_cache_sync() to soc-component.c
  ASoC: soc-component: move snd_soc_component_active() to soc-component.c
  ASoC: soc-component: move component_list to soc-component.c
  ASoC: soc-component: move snd_soc_lookup_component() to soc-component.c
  ASoC: soc-component: move __snd_soc_of_put_component() to soc-component.c
  ASoC: soc-component: rename snd_soc_component_async_complete()

 include/sound/soc-component.h |  60 +++---
 include/sound/soc.h           |   8 +-
 sound/soc/soc-component.c     | 359 +++++++++++++++++++++++++++++++---
 sound/soc/soc-core.c          | 313 ++---------------------------
 sound/soc/soc-internal.h      |  14 ++
 5 files changed, 385 insertions(+), 369 deletions(-)

-- 
2.53.0

