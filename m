Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011054.outbound.protection.outlook.com [40.107.74.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 213BD72637
	for <linux-sound@vger.kernel.org>; Thu, 12 Jun 2025 01:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749692552; cv=fail; b=dqwVWwoShtuwYGW/UoQHbCxWE+8YT16VBGsOBVyNDrpWKQAM1yog/rSVUNiabLLoopRic/91aoBF/i0EXXy5KHa5Jrk04tOqw82rY5cHDPKoOGpkdlEtDk8341Ou05TV+DsS4J9Hk/GFrdAOUYf5QJziRoVedzhttvORfHrrrow=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749692552; c=relaxed/simple;
	bh=C+KSEu/80hR6rQ2D8bnnyn+TvjYlONXBu0wSdKevN0A=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=nVrpXFrT8FJo4GjJgjrBXLz8xcj3I1zf9b/8H/VcKTsSK1ZQQ1+NIvGmygyRqTqLJ9wHkIb+fe8BUJ0PivKoQr+ZXM76QE5o4+oOolKu5VClFaD5t9J83Jt8sgT7ewKkRbPai8y9q8nRstneHrjkhaSnu04F1CMvIMhSd7g7o0g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=fnvYc05J; arc=fail smtp.client-ip=40.107.74.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="fnvYc05J"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m+X0zA+/drheBoAQAabF6lmWWrXnozlh3/UmEX9M1JETB4+Hpx7GSd+wSODfJEKGVG1xttE9ADB6lcJIb2xLnnluJuuFTQg83v1hzunnnIv0rnIZ0M0wB+Df1ccWjb96Dgq0TKVqeb/B8pDjvYbI5eZUPFBgcmFr7/UiWei84n/nbBY2w/jf7WiD/q0wyXa9PPvVPog7+qUCxHO9bMBXtw5Tt6ByGmUFGb+k9Jh5hYsemtwAKP7wkyktMz0/aUg5dKzb/E9omS8vV0s/tFtwCD3n9OBay0+XRZ9K3TUgWUhL7UtzFg5+sCIUoWuGS8MabYPR+ZUjbwbp93sW4CvBjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vGYiQUr1hpwWxyQx5N6roR6CzLT2vtPCc8/7P0DkTis=;
 b=nfNgMCx0PEpq+OPkmGq1bx7s6B1I3Mk9+M4B4+5KEHkvnCAz/OSrCKPcmZT+FtZDhSHeWIbQM9VU+DUz+8xOsWA3Vsb0Wh/TIHqL9579daHzd/kprVfaGVkkVTMg+GMpECTHSRDEaVS/q2MucuzX+LgMuZFCqpcjj1DbjZnq9I8ro3nQaiccTHBd9aohxlMSLRziMqC0KLnHnQXGO9HQ7lj5sI2tU5B+D5GBdeEoHomTIa5mMMkp7E26KdGwEY2GrYANodaVa9mUUyKeAQL4hus63qnN9ZsED4IWbwNJInoboSSzJz663Ypa0OMDOB3OCggXZtLAw34nrfIvdFrBqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vGYiQUr1hpwWxyQx5N6roR6CzLT2vtPCc8/7P0DkTis=;
 b=fnvYc05J3bJHhhNMNxDGvCpVJv+ASQ8m6X3pkZR6yJmT6V08la5Y7siGu/p1SzWMMfRYTxV8oOSDFnQlIFt8WG7S5dlaEIlXGYtZzF6PyMExc59hrK8LR/ezEtROhvtM5TAyOqD9SfIK/gahWkClXDOqJDruvdHDfYcNkUUPl8g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYRPR01MB15122.jpnprd01.prod.outlook.com
 (2603:1096:405:227::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Thu, 12 Jun
 2025 01:42:29 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8835.019; Thu, 12 Jun 2025
 01:42:29 +0000
Message-ID: <87tt4lzqez.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 08/39] ASoC: mxs: Standardize ASoC menu
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
Date: Thu, 12 Jun 2025 01:42:28 +0000
X-ClientProxiedBy: TYWPR01CA0038.jpnprd01.prod.outlook.com
 (2603:1096:400:17f::8) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYRPR01MB15122:EE_
X-MS-Office365-Filtering-Correlation-Id: 37983b5c-2bb4-4f8e-30b1-08dda952643a
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|7416014|38350700014|921020|41080700001;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?PRFT/2eubSdzs0MtX2tgn8Vhw0ckj1UtqM3faBuF1Z3UNVN8hOzvpug4adiN?=
 =?us-ascii?Q?dv+WWnAmh97AL2Z5r29Hs3PH2AxY6RFVWX8fCmSkE8rzikWE0tBrqfb34mE4?=
 =?us-ascii?Q?Y25A0Or0cHVtQ4d34Nc3+zyS+CptTvqADPkLd+J6OpQvM+dqMXX6EGzpS+iU?=
 =?us-ascii?Q?JGJMc3CANaWTKCtWti8l9at12Fy7yhDcHeMeXxnTtrfQQLZddni9Qed8GSUo?=
 =?us-ascii?Q?q6u7EMtBIrdLXcqjIz3iPnuuqhKmoXhRsCsORVRPysHWfY5l8dXghF2b+Fsr?=
 =?us-ascii?Q?6eMTvkroQU8PmzptYY6mNetNIZy8xLQU4lJUz59IalFtR9yxtSIkcydSxipQ?=
 =?us-ascii?Q?d4L/JqThcIfT68vh2NzrKkFiGz/zepFt/sP5RuINwDq1/6sQmSSvaVJxmTUK?=
 =?us-ascii?Q?xdFWO/nGPP5UZdFpdkfubdtCgbyJ04kGu20euwkexAGp1odPxWoVrnqIWM9C?=
 =?us-ascii?Q?DCoe0y8Q1e+ndJCeNS2mEa92L0eJqvTRUr/jSjGkqnNbO/+brqpmPu2LdpZY?=
 =?us-ascii?Q?vJob9Aaf7JAgGVJHTtjAZPBFjfUysb90LyjjbilLlpELxnhted4OG+QhwsIk?=
 =?us-ascii?Q?X5VXp7pfDHqN94n0tby0pPrkHUICapUv61pckg++rzOI/uAhj+88VTWeUDwd?=
 =?us-ascii?Q?Xg36qv0MBXJM0VgsjmJToervyUXR094qSMfK1fw6dAwX4NppoweyK7KqZ4W9?=
 =?us-ascii?Q?DZ9hTtALccoFaAjPZq4PpaGq9av03TiZS1o1uHReCOZo/SpFCQuV66F/X0u/?=
 =?us-ascii?Q?OEyjp8vmmylCIISdDjt7cRZ9aLaUg+9Tx/4dsi6GVPMHMOhdtRtedE+kcRMj?=
 =?us-ascii?Q?aUw08tf1myhYqCjekEVGil4xtvWQzYcGDOibWFLVtr3x6kUkcFFc5qkBeDMt?=
 =?us-ascii?Q?upG5oQMGaxwLBrIQNtlajapby2rKimwEQt5ca1dvuls5nFPhU9wN/lVF4Y6X?=
 =?us-ascii?Q?hQvbndezb9JJIw86TG4Vt3jrvTh8cr/a1lLklP5xYcWWt2Rv98XRPk1Yuw18?=
 =?us-ascii?Q?mIijHVgMB2jbjBdy0w//beL+iLz3Qf2HxjEvfxVN/GViAEL5s8phbSvIYrNX?=
 =?us-ascii?Q?b+DNJLaVqRiak8wKjakKAbKLMN+RLWaG3iI+Rkpa3LNoPowjIgR1vpH+aJ82?=
 =?us-ascii?Q?OxVTW1l8H/32Ca44LA+BAiDqS7x0etC3pszjQzK4hikYNvjXC9tjOhqg/Skg?=
 =?us-ascii?Q?Y2YdpCWIMVzXsv7f9+sgJy5SqlPQDsO0Dzg1oN6WEecy6INrHg7RM2efDidI?=
 =?us-ascii?Q?yZwny5YQbKJPG2s/S0Dy3Os6MZOIYAbm36x+pzXSGZvwwzifqZygO0H23OpF?=
 =?us-ascii?Q?vp0KNM1DDTc8C2/ZiSS9Zfi0CP+KZMwbga9G6DdHlK4p4/YpCkrultDHhZME?=
 =?us-ascii?Q?0kAQD+hIn9YRSny2FKpsTBYWEKWaaPLs/tHZ5AmHpP4iSs84vNntpr8Flrr4?=
 =?us-ascii?Q?EXtfY4+rEtZoDGN1D3E20rHfWwmVs/ucaN64QEplYlbUmnSnNqbsAiWpSA8l?=
 =?us-ascii?Q?9hyH51zKS2mwxDfwC0j5X9ueKOCncoYAPuHY+JqC3MYxergMKLh8Fuhk4g?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(7416014)(38350700014)(921020)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?M/h9nUYl52tgeFlhoRtL2fPgySv2ufzb3QgEsW3L2LUQ/BahwminaRkRve/V?=
 =?us-ascii?Q?FZrJ+0MgtSu051mKNJ2vROEGi3VmIRXSX9Ztm4DBqnwowfu9pLs/ti3azoQu?=
 =?us-ascii?Q?yDSX1/4hc8WQzqf7seqRsQxP278eDiK1Jnu+i7Hvs8sTKKKXU/39Pj6esRN8?=
 =?us-ascii?Q?oRhh76MQ0jgZBBfV3b2J3DezaUD2PAyQpxbaI/5tAFmioyicLR+zrjYyHo2e?=
 =?us-ascii?Q?BCdO7BkBc9BHkOQd2rcAsn5oQlPnF1un1ASXWtYqGPGxjzpStHMPC6B/VHps?=
 =?us-ascii?Q?rOWPvZWIMiEgqvUc6iUQ3ewV6jplMhSBB7nAjyUp1HxALwGS1wYy+TuwZcaU?=
 =?us-ascii?Q?KVZbnhdrkX7+inRXBSFk+hX09KTcV//hdY9UVZ+2qk3hlRS9W+135jg8zNvF?=
 =?us-ascii?Q?1//b2j9YfPs1Kk67W9ARVxYRtn6FpQ5nqbr6dVNn8UlvUFk/rdyFCvK91eBW?=
 =?us-ascii?Q?BEzF26vtCiM96fecQM1QKdKNlB/PjzLmF2RLOpGaTZ8yO6+VqH923e2oMoER?=
 =?us-ascii?Q?xIO4Mhrk3KscriwgJpyU/QqkwQrXFeW4Z6zDFdo3xA9lxoeC0/w7fW2sSqf+?=
 =?us-ascii?Q?IR4YKcIHRUNvHJ5U93gdTNvvVbNtTuY5uiaGXd9vrzYxJs4ZW6DKFA8dFWMP?=
 =?us-ascii?Q?/QlXe60KW1nG1M6woF+qM2uIQ/YXHKEiggsCeERj0L6NDqkmW2wnwklwZsRN?=
 =?us-ascii?Q?gj0CQ1esm/bNeldZUegFKEbaAwhWvJpeh8mqggiUnfy4Ih8rP1lB2sA6w8Zj?=
 =?us-ascii?Q?4NwAkH5KoClzNJTqCAgiuamn5ygVz0971kGZ9FCe3KPlvCs45mO2IdWbWsur?=
 =?us-ascii?Q?1+dbqld3xlGMPKDGvFU8Fj0Cm0VIRz5Rbso8gjCTPXVnQ7VHxBxCaWS4eeLr?=
 =?us-ascii?Q?VoFbzSPdz2m96utcSX5CEJnjlrqOYenbCVWIB+wi1F3V8U8nTCVGUciUDPg2?=
 =?us-ascii?Q?EkVOJYG8u5HDthkkXoDQrKZF34iD1oa6rTuL/GRJzmh3JybeG1m0E7cPgPo4?=
 =?us-ascii?Q?uAAmu+noKiQqBOHAuFzoWcEOqWS0AMagMuU20/VjcERx/WdWTun/3omzHj32?=
 =?us-ascii?Q?oBPESlHpZndDwI1dVnI3zk1gQCmwAkEHraDOS2N5HpFPsSh/iFeckdeW4sCX?=
 =?us-ascii?Q?u58xJdN0SUcv5ZPrk0e89i1ETAXMAuMbajoGO9iqESmt2lRT+5p1CnqhHS1E?=
 =?us-ascii?Q?IzGbIe4uveKE9y5aA7WXdyl4ILLspYdUFWfZ3MulpeMl0uVVDCoBDQYxBYkk?=
 =?us-ascii?Q?LrsZEGJ7ar6hmg0pcI6SpNOqWVhj1smr9pOHTiSH2A1LcHI3IzAynbUowqvY?=
 =?us-ascii?Q?nfifFiuombW9TdcHU2YX57LWDu30ERckANNZRnb9CF/PjN/5yEOEs1bBa3mf?=
 =?us-ascii?Q?YeXubabo5F7w3I6obHA78X/NFc1yvbdjO5OjyvjMdXSOq+FBggLAZLZMntx8?=
 =?us-ascii?Q?4qCtM7VWL/bNfsXtrd3dYEBtowuMAGIGaYfOHFUqMXXwmHv1zePfJJaftI84?=
 =?us-ascii?Q?5HX/ejyC9bNwqDG20dV5rafbOAGAANMBAl2BMc3CBayLsengjnLf1/do3jnb?=
 =?us-ascii?Q?OBw/zxskePOcyLs/5vBN478QxJ6+HU+xs5l+4oko69PpXmFTvB9yrjNIsCe5?=
 =?us-ascii?Q?5+EpSlPhqN+bdZ9+S2pGBCU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37983b5c-2bb4-4f8e-30b1-08dda952643a
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 01:42:29.2204
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CciNwh5kT+BLhmjIn/cF94zUr7B6o9fFM1rG6dsPJkS+273AXruYP21vu3tnZSaeKNN5F0sWfZ/NqhmYwMIwTZ3tEJyUvRvT4HNrndI4+P9Upu6juLl9JBxyOJiCsX3i
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB15122

Current Kconfig menu at [ALSA for SoC audio support] has no rules.
So, some venders are using menu style, some venders are listed each drivers
on top page, etc. It is difficult to find target vender and/or drivers
because it is very random.

Let's standardize ASoC menu

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/mxs/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/mxs/Kconfig b/sound/soc/mxs/Kconfig
index 402ef1ee7a325..2fb1ca711f71b 100644
--- a/sound/soc/mxs/Kconfig
+++ b/sound/soc/mxs/Kconfig
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 menuconfig SND_MXS_SOC
-	tristate "SoC Audio for Freescale MXS CPUs"
+	tristate "Freescale MXS"
 	depends on ARCH_MXS || COMPILE_TEST
 	depends on COMMON_CLK
 	select SND_SOC_GENERIC_DMAENGINE_PCM
-- 
2.43.0

