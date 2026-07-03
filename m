Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011050.outbound.protection.outlook.com [40.107.74.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21F1F38D
	for <linux-sound@vger.kernel.org>; Fri,  3 Jul 2026 00:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783037142; cv=fail; b=N+Qe+EfqG/eLMl349W15Q8FMfIwlwRQ76TnngsJoGBYM+jEbaIz76RU8HL/KThNNKZdawqAhOzRsZxA0J1v8m9h5ken2h0c/JND7IA9+i5uljDK0CZ70lRZzh4834+RoeduLLhs4JmWTvUie5JXU678DhbJ0jm00hy9k/8R0LVg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783037142; c=relaxed/simple;
	bh=y7LHU6QU+ZG7pFbSGTnl0tthvxkNTLMc8Rv5F5ZEgCk=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=CzD/WG94hE8QgaBYIgXmVMsHb1rArEZ21dXN3wn66zdY0TyKXXEcYNIvxQClwLm7bRkxPiDZd9a8E2b94uJ+FH4AmGKd96cCV9swHf7agdt2xWpt5p6PMB1XNYuv3fUYClB0hlt/cggZm4DmEfW5jTlsLZwQ9Ys8PVmAGsbkQoI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=gbUqGB/N; arc=fail smtp.client-ip=40.107.74.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="gbUqGB/N"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oi9EF7doU7yZgToi/YOO2oZn48MmEFGxOAGYDJTAu7+Mrnqp6H/USON4YzYpOWOFuKp7Jqfy7WbyfTQzeoB0PDcAu8sEAuTBOCocv8AmQXpIbj9jZoodwVojCj6vfBtNK72+pv0PM1WooOim9UMQcAbpqxLuPfSHxUzM2JyM1KKtoK7Gnp2I2cwpb81SNZwMyCI4XV0wFw5MEQFIeGI9yZ11WFEfWUYUwwgkJuGh8YH/QI/rje6WKqEbzdYx6A5jAM8/nR/UHQPVqjysPSq9sNOixLKXevCz7jHvn+sHJyoFz+85MxzD/y3hIfi2aBIQ5rcUNO1+W1xVMw3CsNcoWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UXBKU8i/NUs3JdL3zVQYkquLo3qVfYU7AcuRoPsOaEQ=;
 b=U5w5Mhp83YmH9GVus0vrWxAEI7ZCjT2iDYu9N3f5hcl5wWKrmJOn3kNBSjmLLTojBsfY13854UEvDRil6F+nkU5vlYGyTl6Rlue5XxZEKXfqYxFneBY8MpkgZ8dtsNwcq4edZYVTqim9IZi02Zsb9ZL4EpS7A74wGJ1j6ZrWb3AwLshMTu/mrHC4Y42wwUDX+aw0zHmW+9iA3jlkBS86dFXAGqyS3yQuSvDGrDi8fvDIjhhYtOJ9mR6L16Ylg1pf9yLrhoDeDD3QgTbCmxwFkwLdKvZV8TrRjXt7xrRK6ktBISMZUhF27I0v5iCnduucErTjjdBpxrcg3Tt9abEiDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UXBKU8i/NUs3JdL3zVQYkquLo3qVfYU7AcuRoPsOaEQ=;
 b=gbUqGB/NUOVJ7/I/CBlk4SJPM3sEEbhFWetXnCs71RhxH/CjWSa+EullYy3I+5lN4uWXrmcIcToDYL0kPGN20EpcOVQD7LG+Srrby3OiAsN2J7DP4Ei+VOz0am2YvZds8UOPxVSBOgcleWt46BXpdt0QEaFg5+LO+C6Ky5wCtxw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OSBPR01MB16299.jpnprd01.prod.outlook.com (2603:1096:604:3f8::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.11; Fri, 3 Jul
 2026 00:05:38 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0181.010; Fri, 3 Jul 2026
 00:05:37 +0000
Message-ID: <871pdl6ipa.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Amadeusz =?ISO-8859-2?Q?S=B3awi=F1ski?=
 <amadeuszx.slawinski@linux.intel.com>,	Bard Liao
 <yung-chuan.liao@linux.intel.com>,	bui duc phuc <phucduc.bui@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,	Jaroslav Kysela <perex@perex.cz>,
	"Kai\ Vehmanen" <kai.vehmanen@linux.intel.com>,	Lars-Peter Clausen
 <lars@metafoo.de>,	Liam Girdwood
 <lgirdwood@gmail.com>,<linux-sound@vger.kernel.org>,	Mark Brown
 <broonie@kernel.org>,	Nicolin Chen <nicoleotsuka@gmail.com>,	Peter Ujfalusi
 <peter.ujfalusi@linux.intel.com>,	Pierre-Louis Bossart
 <pierre-louis.bossart@linux.dev>,	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Takashi Iwai <tiwai@suse.com>,	Xiubo Li <Xiubo.Lee@gmail.com>
Subject: Re: [PATCH 2/8] ASoC: soc-component: add .priv
In-Reply-To: <c4b90a39-1a4a-43b8-9d57-a4fa22edb706@intel.com>
References: <87v7ayxk3s.wl-kuninori.morimoto.gx@renesas.com>
	<87se62xk2z.wl-kuninori.morimoto.gx@renesas.com>
	<c4b90a39-1a4a-43b8-9d57-a4fa22edb706@intel.com>
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 3 Jul 2026 00:05:37 +0000
X-ClientProxiedBy: TY4P301CA0043.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:36b::6) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OSBPR01MB16299:EE_
X-MS-Office365-Filtering-Correlation-Id: b2708390-719a-4012-a9d4-08ded896cfb6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|23010399003|1800799024|366016|56012099006|11063799006|4143699003|38350700014|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	zcyp8+UM7HLO6Q7Af88X2aXdITqk7Cgi0vNL61Zmie9HGe6LxV3c1LC3pyYWtCddUT7Uqi2qwq84DfWFmAvpBgcF3HK3NYeoHzHpnturOQZ9pIA9Bn4APjtRm2BhU3pcBNTvL2LTU5jqhbwsxA2+wZmNB2myQMlEsCChrfNuDu5XIE6ha/y/Ncvfi08jCaPTb8sBP9WtwiuxnPd6FtIMdhEtebhgBlfz/3nk5AQM+yezdcGvo9bQpOsXL81O1x7ZpAQ8e/4R8S1zMkXDnnRSdkVhpm+HOhKF1gzLYq4ax56CpjGrX+HjL4YE2se1WTzMvF2DSl569QC5FuAmBUyOxKTL76KIN0SaiCaETjKcGgsxgE24ME3Qjv+zYdATNxS062psEVKyzjl63UMLVgRJTSYhxSKzzZN4l4yIwWl5cctWjnsPs8QcNyWxFhyxPNYTwZNThNrVOvh3E4AzZWgFakT5fQuieVVs2xJLnM84Y7DCrn4zLiymu0/obCrIbs6MO8LvRAZy+YpfkiH2P/t9uMgLzi1MoQzu9Yk0ot8RZ6R9NIuvOaUBdBzef467Aj7V5IvofZdc3qga8Llym4fokVrekW6VmXBUTmU2T4ULrR6RsEfSpVXSn57FtLXqd3mP4OIogFzkkFJrN1DYzNQju+2hpoHKPTVO5jl6s02+9ZUkkOdYR8+VPnhZbEpwmnliewHkPnibOypk6BRADq+3VC5FN1qG7vkKMU/T5Mym2TQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(23010399003)(1800799024)(366016)(56012099006)(11063799006)(4143699003)(38350700014)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?202FtLYoHuKRdOftEnvgQEqLq6LmWfu771zjugfylzgdCH/RN8k/mk2dq7AJ?=
 =?us-ascii?Q?nHRs9qifjuYagYur/MMadJapkcLQSSeGl6aJgoC6l0gVQUpSGRmuWU4HXh/y?=
 =?us-ascii?Q?SitqihiMFWJ1uvNW45qlmDzzvl/iXFWMdob2DA5KJjXPvW78fS7FNhEyL+8a?=
 =?us-ascii?Q?AuyHrYKxOyus/nRcCsA8Ed6ToLjA2hoW2zQ1ja5Hy5AB4811ALvEzfzmDo6i?=
 =?us-ascii?Q?7NzCG8cXPCGVgCdjyZXjouP29VoCL0AtQhhdSz1RdbKN4lp6agpqGTSk8hzg?=
 =?us-ascii?Q?wPf2bAq8LVlIHM3TBCWCWSnqSpYG9JVur7gtTyd1XoUI20bYE2+eeMN5Cgfk?=
 =?us-ascii?Q?wbmOxJY7IzianYdgcteNQLsayVgEKlkwQNQxESqrjp3k4A5CXRhHMtPN1sZq?=
 =?us-ascii?Q?Vc5c/LQ4F2haZFVjXNRKXI5eEJ+57Y08e/HG8UnsFuTqLSr8co7vlVvm5xS6?=
 =?us-ascii?Q?y1+E0ldf17xXasUp+chO4/68Y5ZgTofBQQE4JSRaDVjCYXgOyKiKzpwhoQFN?=
 =?us-ascii?Q?CsuplhvjBeB9Jrvxq8FmC+3tlOYCpxdr7j3XSUMkeUfxwL5G5CsTCQyaUnlO?=
 =?us-ascii?Q?JvhmCpAcbDZWOQfEouWyDMaGFFzAdv/AW9EsTzFVlbZWDVq3Pm7cSPw2E1KF?=
 =?us-ascii?Q?7rTtuc6U/Uj1zfur6GraZgD2oz7IGYRzye5zPIUzFVaHDGDTpz/oiwFYSYCm?=
 =?us-ascii?Q?rLSCT4L22hm033zYsX+oc2ZhL57YsGVd8DGEbBsm87imug8RlXZoc/mRejpW?=
 =?us-ascii?Q?TT8EZT3fvbmA4gTNVKO4iakF3+Z2X7433o1j6fVZGcrJCBb77+QATq1K9Zp+?=
 =?us-ascii?Q?DiR24p4UPdbpeMZ8MRJ6ai7z+vZKdz+tF2dwPCR1gK0Oe/WCuc5mbxRrPIWM?=
 =?us-ascii?Q?rKuJdPY1xYsl5MtPSkKxzeb9VC10IEVBPDvtAbbRFUfRPNFjo6h3Vu8CCAuv?=
 =?us-ascii?Q?ANrRCSKi8Zu1DpQZ9GongNoBZAVkM5OR6slhkHd9nBfsxaGgdVeJQ/C2QMpk?=
 =?us-ascii?Q?byxbovyIdmy/st/AU5MtO+cSvT/1rzX++G9tPDmUTrsG7rYRQcZmv6ImGySa?=
 =?us-ascii?Q?KTNwizdBxtA+l3F1TQQJM4bI5RwqkgUswW3ZtIKTeC2wXkSQXFOMXvrBKUdf?=
 =?us-ascii?Q?rj1lTXyD05PmGdfg3thUk/a5fYGg5ZHd0DcSxHuozZdKOaGatIHdMpGoRVQW?=
 =?us-ascii?Q?Ap8ip9zlQ+AJ09Xzgtw6kEIFTow/MMjICG5/6I3F3SgvuNLnlne4IsKsrazy?=
 =?us-ascii?Q?DrZOCQ0QkuZk/vqAfKGwdFLCX0dCoPQTS8NIjK8+63evYaM/c/z98HAqwclV?=
 =?us-ascii?Q?fprLDrqfO/wWBu87M5b31qT/vt0Y59TdGyqgwm4ekS5985zmL/pws0OnSJDd?=
 =?us-ascii?Q?Wd+j41JvLYwrVfV2gccpT2jvMksn/nE/JUclVsTyeN5LVA5NG0ujpsiC2Cy8?=
 =?us-ascii?Q?k3kVwE+8HC/sck79MN4fYeaCCOiNkk09AD1b+cv3ULtOt9dhthDlrvbqELex?=
 =?us-ascii?Q?7YOStxfOVx6km5P0Ea8cavjmPRKXHI+xOGqtWumlZWxgptTAHMq2ubfebF6v?=
 =?us-ascii?Q?wFvCFS4g10bZv3kspn9p3TxZr/ZUqjODT0dPA1ouYkiNHsnAxIMfdsDVduYe?=
 =?us-ascii?Q?E+mUxIHabCgo1sU4PK5hCd3/jrF2yPHFGMv9RVsFo49OTopuQwzJOd2YFDGA?=
 =?us-ascii?Q?ZphMA8y62Dl9lfN3Wnsv4e9T39H192+7l8POVO2hzwt6JJ8NiulJqvXug6++?=
 =?us-ascii?Q?dGKbDN/Fla8qPlrDM/RZ+bX7ZicBp4KKR7bUXwoNp9jMV1Kp7lVl?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2708390-719a-4012-a9d4-08ded896cfb6
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 00:05:37.7041
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OXx1e06GIxolLskMlF/22rNfsfdAG3jTxNtC7//AWCs6J0DxxudJ/aCWZHmF02VAp40NFPW7NyfVtKLTjXQNUMTsi8Xs+CJ5gFt9M8DqCPDTsLUUrCzL8w++MPPjp4VC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB16299


Hi Cezary

> > +void *snd_soc_component_to_priv(struct snd_soc_component *component);
> > +
> 
> By convention all "to_" relate to component_of().  It's not the case 
> here.  To be cohesive with the rest: snd_soc_component_priv.

I think
	- component_of()
	+ container_of()

I will post patch like this.

	dai = snd_soc_component_to_dai(component);
	dev = snd_soc_component_to_dev(component);
	...

I don't have clear rules, but I think I'm using _to_ to converting
struct pointer to struct pointer.
And, converting struct pointer to its member/data doesn't have _to_

	name = snd_soc_component_name(component);
	id = snd_soc_dai_id(dai);

I'm using to_priv() for priv case, and I want to keep it.

> While at it, looks like we are going to have a symbol per field exposed. 
> A bit weird, isn't it?  I innitially though we are going to leave 
> things at:
(snip)
> but if the intention is to define struct snd_soc_component in the .c 
> file things will get complicated.

It is a little bit redundant indeed for members which doesn't require any
special operation/check.
But, not so many.

Thank you for your help !!

Best regards
---
Kuninori Morimoto
