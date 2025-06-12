Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011042.outbound.protection.outlook.com [52.101.125.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AE4314B950
	for <linux-sound@vger.kernel.org>; Thu, 12 Jun 2025 01:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749692659; cv=fail; b=Rh2KnS9ljKCemk4RmoLeWdAxMMqieVY+15hoYw7NObW9GFFqA1CCwvQw3His72Hvaar2bksdnoDxTjLQm3Ph+GR8i8yQ63dJ9UKwPHka8w9BcC1Gf3wDLJyDy/JFVxqYhNJkNu3jiQ2fjUWYMod75K/KcCe1fqPoEWQFEnPedKo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749692659; c=relaxed/simple;
	bh=aLkuP2DxvmuSVROsJ96m99mFW2+nf5Ti6BLOvXaNs1U=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=ShyMoc2PsHLLWNwph2PxNq/B/q1iknA4OR6uqS1IZfvhG3mKrjDkyipWb7EkHKrnC05oJma6rvuD2S6ZB0UrXTnZS2neS4H7jGmmI/jQepN/Dxyo5xov9v1jqvmKZYcu9gIRnnqJQ0Kpjeh1nHmdJe5nXpaY1waIKvcymZgPpCY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Pgi+gHDG; arc=fail smtp.client-ip=52.101.125.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Pgi+gHDG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yDQHnblSMjGC7u/SLpD1kLn8Q3hhzVMVIzJCbBGIGN7cWWTMYgaya4kkd5Dma8+ZJaDE+DdsMo8VWHgUAkhDOAWWyNpelbMkotYhMkMRN7OwFPJQQ11LxXN34Hdufh5NhEfgGQcQ5WlzllqO9HsBWEN9mvgEsqBKoxo98AHa5MKeUkvWj/8ZQa0t5JkbM/Emo1ZzFiqQUdQUcVzl1dLgdFIlLjjlcWO9qDIuiL6lT65pehtKa0DDE/K2Z+nGC6HLysBFBX1FZR+oF/e3UCepL92mzD14OSytCZkjYKkRLVdGybufkX0OTxenXpvcrKOIEo2U7AgZ3rrjSXmRjsgCHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ph9O1BB49PP4GDS9nn/DwqEsxFLqMSIwcxfBm0Qx5bM=;
 b=bH3gH8wICoV7CovrJCr/gPV84M8kJm7G+Y30TZI2Kkh11teLlngAAOT+h3kClOCISW7iVh1/yuEpV+Y9UzRQqR/0cfTyebq4TRYHxAhaOX/b5xisHKhYey1Mt3qTc8ImDaT7g9UuzcN0HM6q4fd19KmnwWGCNh8Zy2OPmSMRvp/Nm0MhDw5sUCLjQgwvZfhGjMrLqDBZ5OLO2FEYVR6b6Ut7MNc4+sMAC3emrSUhd6/swhUE6wgPjyA/YN5hGewd0OuEm0dYi3n+lMX2GIOXNSPWpewcLPd9CQ0xbtzfe30kbszElO/k36zOGCeMeUGrTk1HZHjSYEL5eWLp28/Oyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ph9O1BB49PP4GDS9nn/DwqEsxFLqMSIwcxfBm0Qx5bM=;
 b=Pgi+gHDGcsj//EKFg+fX/taJdvEGFMWs+pA2XUMZANQSE1FMXkAEmXDrFVNPpWExGjyNLUQeJqgOyy1W9sQTmKzfFyPLqsK6uYZ1WmUxcVOadLzyb5KhR0jAaAwzciQdobZelr2MAZGT2/xdoBxCRYFJ4CW7reud5KI9KiD/VQc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY3PR01MB9824.jpnprd01.prod.outlook.com
 (2603:1096:400:223::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.30; Thu, 12 Jun
 2025 01:44:16 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8835.019; Thu, 12 Jun 2025
 01:44:16 +0000
Message-ID: <87y0txybrk.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 30/39] ASoC: renesas: Standardize ASoC menu
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,	Liam Girdwood
 <lgirdwood@gmail.com>,	Mark Brown <broonie@kernel.org>,	Jaroslav Kysela
 <perex@perex.cz>,	Takashi Iwai <tiwai@suse.com>,	=?ISO-8859-2?Q?=22Martin?=
 =?ISO-8859-2?Q?_Povifff=B9er=22?= <povik+lin@cutebit.org>,	Claudiu Beznea
 <claudiu.beznea@tuxon.dev>,	Andrei Simion <andrei.simion@microchip.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,	Alexandre Belloni
 <alexandre.belloni@bootlin.com>,	Cezary Rojewski
 <cezary.rojewski@intel.com>,	Peter Ujfalusi
 <peter.ujfalusi@linux.intel.com>,	Bard Liao
 <yung-chuan.liao@linux.intel.com>,	Ranjani Sridharan
 <ranjani.sridharan@linux.intel.com>,	Kai Vehmanen
 <kai.vehmanen@linux.intel.com>,	Pierre-Louis Bossart
 <pierre-louis.bossart@linux.dev>,	Paul Cercueil <paul@crapouillou.net>,
	Jerome Brunet <jbrunet@baylibre.com>,	Neil Armstrong
 <neil.armstrong@linaro.org>,	Kevin Hilman <khilman@baylibre.com>,	Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>,	Shawn Guo
 <shawnguo@kernel.org>,	Sascha Hauer <s.hauer@pengutronix.de>,	Pengutronix
 Kernel Team <kernel@pengutronix.de>,	Fabio Estevam <festevam@gmail.com>,
	Daniel Mack <daniel@zonque.org>,	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,	Srinivas Kandagatla
 <srini@kernel.org>,	Heiko Stuebner <heiko@sntech.de>,	Sylwester Nawrocki
 <s.nawrocki@samsung.com>,	Daniel Baluta <daniel.baluta@nxp.com>,	Orson Zhai
 <orsonzhai@gmail.com>,	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,	Arnaud Pouliquen
 <arnaud.pouliquen@foss.st.com>,	Olivier Moysan
 <olivier.moysan@foss.st.com>,	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,	Chen-Yu Tsai
 <wens@csie.org>,	Jernej Skrabec <jernej.skrabec@gmail.com>,	Samuel Holland
 <samuel@sholland.org>,	Thierry Reding <thierry.reding@gmail.com>,	Jonathan
 Hunter <jonathanh@nvidia.com>,	Kunihiko Hayashi
 <hayashi.kunihiko@socionext.com>,	Masami Hiramatsu <mhiramat@kernel.org>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,	Michal Simek
 <michal.simek@amd.com>,	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>,	Alexander Sverdlin
 <alexander.sverdlin@gmail.com>,	Elinor Montmasson
 <elinor.montmasson@savoirfairelinux.com>,	Binbin Zhou
 <zhoubinbin@loongson.cn>,	Alexandre Mergnat <amergnat@baylibre.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <875xh120u3.wl-kuninori.morimoto.gx@renesas.com>
References: <875xh120u3.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 12 Jun 2025 01:44:15 +0000
X-ClientProxiedBy: TYCP286CA0168.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c6::18) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY3PR01MB9824:EE_
X-MS-Office365-Filtering-Correlation-Id: e5529ffb-40cb-48a3-7482-08dda952a3f1
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|52116014|376014|1800799024|921020|38350700014|41080700001;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+k9UJxyaxX/xQDHj+8h0vaJArJ1RNndIPWZ1k+E4wxjraWwA3fM+rWOt6w62?=
 =?us-ascii?Q?eGq0dSyvwN5w9aqTL49jH6VWau24+yj88+fGxNkFrv/lDyAuuABL/0n9fqDj?=
 =?us-ascii?Q?HtvQraiXvUdfWcOjOSwVdvWIA5AMRGbl91RduFotVgSUP1Rflzb0mjrCCx2v?=
 =?us-ascii?Q?bzsLUVhdSlg1wUL01sjZ/hA6jncdJYjTsOgny30sD/lHdXsiL/MYlALpywas?=
 =?us-ascii?Q?e6aZKr8ZYPXgqvoQVbNlfO9wfA4PnTbDr59mAxHKFzrWgvnunWSlMo3xVXke?=
 =?us-ascii?Q?MNJY3jrq5UWZ6qXz98PS6WMYXYgdkIrZlXNx21bSJ2UfGYsX6y8caDH6qVgW?=
 =?us-ascii?Q?V3SnsymC50GK437gdkjV9h3+PNonju8TN9iOoTDABT2X3LoAMdkqPpAyrCmt?=
 =?us-ascii?Q?TNTjmUkbFqKLiVoYcXNwjz9ewp46Xlen9VmrM/c+wdDJt7VMKygyWT9bpMFD?=
 =?us-ascii?Q?i350PWi49pO8q1RTJhKsZv9KqyIwbBfYAcVGMo6VGnKZ+VucwBD0QVUcpoVf?=
 =?us-ascii?Q?vAVFi273aEqf/VYiaohYBDapPFRO8IyHv1LuDwpT5O5jSmB0u94wQuhp8YaA?=
 =?us-ascii?Q?3KSRsriq0bnI7U3MLEqlfUr6CNpsC9IU4xzvum1VaTaUDfiFKY5hJWFN3N9f?=
 =?us-ascii?Q?nnP1m6QHSuN4oHXNhAumpSlpje0LXDrUwfRx+ru0wGf0dOo50N+HkPvPy/Xs?=
 =?us-ascii?Q?DBmaNUddd5EAB+DB+em2U7ndtUyYp0i+WMjnyyNGMkWJDZahzNMsgl3M8F0v?=
 =?us-ascii?Q?pCyyrERz7lWnPCFipbk4Nr77rmNRbryAfMRzs9+QzX7oSMaD2kiRYM8VjA88?=
 =?us-ascii?Q?OqyPQVr66jAkVfM951Of0KrpvheBKRNG087Ehxe+F330w6kE/nLaDkl0lLOu?=
 =?us-ascii?Q?F5fW06PVneusEB4yalfETXb1wyzINmIuqnnKBoR3ihvyIu/I3frL0pVl3dVB?=
 =?us-ascii?Q?hVmHWAipDbJ4tLYRnNEJH6htGN/M56Xk8utdWGW2SAOnnAAxwkN3vpQCbBDI?=
 =?us-ascii?Q?vLnuZ6txcdSBee7ki/4Zg3/ZX7BOr2JnzV8kz0nOg61fL4xte+YTqE7tYXaa?=
 =?us-ascii?Q?naYFBezTYhKr2CeImDdoELM0zH+EXq33Aq4i+aDdX7bCZZ80dqValbl86Hni?=
 =?us-ascii?Q?kGArXBkyU0C315N76Iiq/vIjbv2VvFtDR7Tda/EjIsVim8T8vg3RX+rrhWzI?=
 =?us-ascii?Q?RPWJOreWKWbOyJ2bmcyo7kZqzQlasIdY4wnG15nPJpb7D1yX4lC19TE/+lnQ?=
 =?us-ascii?Q?EbsMd7kqwT9ZXggOReqYUfwEAeXwNt9HSlpi1U9EcsJyspeSTv2PksSyf4UY?=
 =?us-ascii?Q?TUlHwpElIbsK9pS+uUbw58wpkXG50Uc5i0L6cH3DaSogXfEiJa4chUWYQZXF?=
 =?us-ascii?Q?lLyPd9SxNdzywAqC4E86Ds9PPG7bgFeaLvWYLiZz/5+XDoOYG3GYkT52n48B?=
 =?us-ascii?Q?+yudpw4epUksapD76i9vGLUldwDHf7ipTlUPh5buO3foBgK5YM/sM8MBKeqG?=
 =?us-ascii?Q?8Sc2SF7Y9efOUqMpsr+o7inYZmJm4xfDxCnL5r8DXRmmHlMWHSlWf4t40g?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(52116014)(376014)(1800799024)(921020)(38350700014)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HR9aojzfs0CegRfasu0PiOTHyrkDrBNONyxRg6QeVVjFSXKoh+goSxF2gyth?=
 =?us-ascii?Q?l0jyqboE2CmiUaiblF6KGmWPdBkWGwPbIO5BS1Sxen3xVnC3lyIjZlOb1tX1?=
 =?us-ascii?Q?rvsEAfTX4lSIu2YwwjRtqkeyJXPYjFDKmut4NO5vCpO1DE52t3+fhuEJXU1U?=
 =?us-ascii?Q?FsyMEi/nvFqiAmv9lhR1IO+2yX7St+JsI76HpxUBM5B3MGObpdnEEiR8nGsB?=
 =?us-ascii?Q?if49DBKfMr9TV0Ig4qOGN1jyuu9ihYZiVetuxQHr24QKRm508y3uh1ogl98D?=
 =?us-ascii?Q?xdtuShmpQ7x1wUoFDO4wAETzMtMpbQ4IaeK9tUt+NEMcVeAp8+gFSDmGCEnz?=
 =?us-ascii?Q?hvwwMavmUhBvC+ryh5+cw5lludUG+20Hq3Q7hSEzTw9nNslnjToYTK8aLgq7?=
 =?us-ascii?Q?IGLT1K5Gt9RznlO+RyfL+vCtaQ3ywtyxdEd+92LcVr0ufU5iFROu0KXJ8uD0?=
 =?us-ascii?Q?Qwj3XAurdeCn0RdArCgv4ENRvP/C4rY/hUhEjRLEda7w4VRQYzMKr56s4w+a?=
 =?us-ascii?Q?5kV9Vxe8phajTHxGeZmuY5gu0fuGUtpVl2JuZF0btutjOiX1GEQvdgJCBKCR?=
 =?us-ascii?Q?6x5THTg/Dc2iEX7g4KYYl8rdUK7iCDuiUJSrSSgnvZ3dDisn2GioPAMkm79b?=
 =?us-ascii?Q?33+s7CAnq5hsWERHV3bycZVlYhdfFtFL7UUKXp5ookc6lQA1k3VKlen+WiZX?=
 =?us-ascii?Q?RvVyGGOUOrKAvcSOLtVUy/BBqzkgmtpr0POY16IZnWkpfiQYYyXHdkrIOC6i?=
 =?us-ascii?Q?x1IzBmsEEbmfBkTJ272Kk2nak2ckKSPPNhJJdJQfgeZQvExLxZpxzq2EXxki?=
 =?us-ascii?Q?8xSz37xKQKHmooqtgg+baKCZ1jxQs/UmXYjdC+HuLcScrrdSAZ0KkgD6CPgY?=
 =?us-ascii?Q?6ZB9lBMX8cu7PWYATGXeGY6n+MnDPa+OSwWmH7wdvK9Oy5pFtsHaxzn+4VG3?=
 =?us-ascii?Q?48RzZaBf+bwiOtmPa2ZKIUXRThLCIhQnnG11PEZXT7LuW78t+f/QYaMx0omE?=
 =?us-ascii?Q?lhVEYJnxcldWWymA5Vs7iOsOK6RU9x5kyUhXPeVs2lhq7arXzYuqxAwYHvUQ?=
 =?us-ascii?Q?mmb9xT4hFhXZ/50pi5iRRMEWQxIhz6ZANPZGeSDcvvtFmn6QdU9DJ2jb7QO3?=
 =?us-ascii?Q?fyHYJy7377Ra2wLElYfvzRpcndwKkT2P1WL6DXu05KMcNVJcjqFPmkCqD42e?=
 =?us-ascii?Q?tIWnK1p2WWZacwc+d+5xehHOPc7nbsZho18QWX83vs36NQAjBshO6Yyjhc/9?=
 =?us-ascii?Q?BGxoBVl2so3bBDjt/Hx4YEaZhJekl+uo+NvP5AN/17tw8lGYMGA9Y/AkvAjB?=
 =?us-ascii?Q?PczizFaBoraUiY/97Z1CIapIVp6z8qu07ohuKbxQx7UjsWUFhuDqY5KlH9k6?=
 =?us-ascii?Q?ZNkkEXJItTAtn/Yidtk8mkT6N7Jt7W+uWhSMacHcnWpDItwXe3K2hxgIksqt?=
 =?us-ascii?Q?pWgyT0LEHD7fOx9ng8t25pWvlLO8tiWT/baDC7Cu0bdXGpUNlP1F+IO/7qbD?=
 =?us-ascii?Q?fsApkBzUj/ysNRXOVGxX5gX0c50mXcVkwQ15mfpgqUnXoDXr6k9IjvZ9xlkQ?=
 =?us-ascii?Q?hWCyWbeWhEKbtA8GiX9DjGUBkKqZAkYWEmX5DboHHKb5FyBjTWKCTVSSVjjo?=
 =?us-ascii?Q?h2ji/EaUJiZV1mty0tanehM=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5529ffb-40cb-48a3-7482-08dda952a3f1
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 01:44:16.0708
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KNTndwj4LGfmPYgXXesd20dyrfZzPOuK8dyd63IVXxETopreJSEDL9NTQpSJMnjseERZhyR/4qJsPC+rgMZhT+0JKV5Mf3JxDYP5fD6Np5wKoJC1neeVs/jqBntimvB0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB9824

Current Kconfig menu at [ALSA for SoC audio support] has no rules.
So, some venders are using menu style, some venders are listed each drivers
on top page, etc. It is difficult to find target vender and/or drivers
because it is very random.

Let's standardize ASoC menu

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/renesas/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/renesas/Kconfig b/sound/soc/renesas/Kconfig
index dabf02a955ca1..11c2027c88a71 100644
--- a/sound/soc/renesas/Kconfig
+++ b/sound/soc/renesas/Kconfig
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
-menu "SoC Audio support for Renesas SoCs"
+menu "Renesas"
 	depends on SUPERH || ARCH_RENESAS || COMPILE_TEST
 
 config SND_SOC_PCM_SH7760
-- 
2.43.0

