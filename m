Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010044.outbound.protection.outlook.com [52.101.228.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EA7713B280
	for <linux-sound@vger.kernel.org>; Thu, 12 Jun 2025 01:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749692568; cv=fail; b=BhEnIuE9RDZNtjdWr9hZMNXXp4f3Kym/U4YM3DC8FUCnj0qdvT0Hcwknp+vCwRUlt5wzUfOAf+VdYyBE/olGsGpul6ura0oTgPXxkkvgePAZJ20/3ZKXXIaWjrup8q+Ocmp81b6/mc/eLcMzj5WcZOtjRgLX/oD199EoNz7h0iM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749692568; c=relaxed/simple;
	bh=cavNykwzh2ikU/TREMvAsjXkBl6nrYSSD9yiNtgbYSA=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=fo1nxwfLOnG0/WHfoVPhSI/JDJ6V4ZJXPpQgvJoFQYYjtfNe9/BBd2PQYhrlCn2gfMGByCuLJVXQ+RvpABM8Be+2Dp+2MXPZ/JCreX3DNSBfxSmo5DVZvhtc5qWe48pfzleTGV72wI7sT7tyaev1LbRWfoIyPk7/An7Q91mY5DE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=OwvLEfek; arc=fail smtp.client-ip=52.101.228.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="OwvLEfek"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A1QdkFJNB6BnFUD/VG049hC8jQm5JTNbnXcRNq+zMgNNqJrzVXRdOvp+tYZm4Dr3QkH7fDyIZuP++zJpTmoyDDCH6GvnYmYQZ7Sbz24lNWJK495NLSETUOatNNocdubNobbLM+1KPW0w7D3Cf4yP62fiUFJnQ7kSoDM9RaRCNUC5/MD0Dr3eBDSg1gsxyG3jzYsmsfoYcS+nOVgKlYx8VlkFKndmgfbHYKYQBkpoBkFo5DmNkQwmGiVi71M/suQGmklSKbbXuXbSZ4Lx/Yn2trfF92A3IOYk+WeKCvBQny2S0mB9Yu8CtGk7OBxcjm8FAHuparViZUlw6TTlXWe6Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I2zT3xrL4SfwZ+VN6H3vlIvNaf0bRbklW0iFMNWfuYQ=;
 b=p7xfn9qaXUil2jIxIjtjeC5EX4UsLkJ31PFvCByjVKdiu2HZhy4cTd+bLJ03FWVu2OX6fKSfuiguj5BPZavwo46n9ff9ImjYfBhPdgCp9GosrgvTOtRP/PDNyLv9n/VEhgFGus0FQZGtseLIxf8mdklIlrlDr5q541BnU1+MwgsSniSeKVCjQiFpJQmvFdfZHt+93Mm5ZDKIqQg/zWGJRRSxQ5AKZ2ZjrE+5gmbkciju09D+ip9DsXKYEP/e/7nKHCNlRrpJasut5hEF58DAzcYHlFieEmvP1AmSmTkv2KGLN2k+1m6XmsiwGq6wH4dxEkP0FboHbpcMeQr0Yn5TQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I2zT3xrL4SfwZ+VN6H3vlIvNaf0bRbklW0iFMNWfuYQ=;
 b=OwvLEfekKuxRW2yybuog4+vIb9wYQ1MmoDXuzFOOwcO7dkXaQB+eBxR00+kW97GSQl5uRWF9zwDdLGc0jgdLnlhGec32TqJNzY7rGFPhyYBk5BbVPyYPvMoC/4vx8K+jy6O/PXqLPgb68FNpWSI9pOrGeCKrXLHf4ZZ6QB8FUQc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYRPR01MB15122.jpnprd01.prod.outlook.com
 (2603:1096:405:227::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Thu, 12 Jun
 2025 01:42:44 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8835.019; Thu, 12 Jun 2025
 01:42:44 +0000
Message-ID: <87plf9zqek.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 11/39] ASoC: stm: Standardize ASoC menu
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
Date: Thu, 12 Jun 2025 01:42:43 +0000
X-ClientProxiedBy: TY2PR02CA0070.apcprd02.prod.outlook.com
 (2603:1096:404:e2::34) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYRPR01MB15122:EE_
X-MS-Office365-Filtering-Correlation-Id: 3767776d-1afe-4160-16cd-08dda9526d33
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|7416014|38350700014|921020|41080700001;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?DcivkBmQpqcjpa/5LsJzp0TqFGcSBEpsGVsRQl0R193SIyCbFv+kdDAp2gzP?=
 =?us-ascii?Q?C9ZxjRHcG1CS4H78PD3EkGJorr9W1bjMo6wMqDUYo88GLmZ90HEvgRgwGeaI?=
 =?us-ascii?Q?V1xP5yIDm2RDt/D2msiBz6fiB4lb84OYl6m7Uh5ZZ4naO/FXzZ/cwgWvBjNw?=
 =?us-ascii?Q?rY182rNi8H9ojaH6HH1+tVE6bYHV5iY7sanop/tSfUuvfcvMDjK7Gh92yvLK?=
 =?us-ascii?Q?b6nm1zV5Cgk+mppTFOYxlgatG+6RwwNp74QKVlqvNTUn/gIpXMJGWZiiUrAF?=
 =?us-ascii?Q?C5daDZJ2nXHzQXcN8HA38pYWSkeHOG1UWib882h/QTvwuodSLQYdc18a91QO?=
 =?us-ascii?Q?+0diJPBXxqUKhymKf7KobkMyMba55dPiehIwwiEIjGDe0gZjQK5oyaSuQJ66?=
 =?us-ascii?Q?wo3JnMTvMkgSRiGjmwvw8F3fRzxaoVm4TyX+Qz0885uTqkSTefNA202jHz6W?=
 =?us-ascii?Q?bJEdFDRSrGsihJzlh/E3z6AcdZQZJzgbr3xBLLaPWGyHsm46RlxYRyQvVi9z?=
 =?us-ascii?Q?4iyuT0RnZHi4bTFr8hX/YFYx4CIRZa/s4mosgTcjC1qUsLprAmE0RiEaFSxJ?=
 =?us-ascii?Q?FcT5E1bovBRqxtAeqrju9wSLHyLbHOfBZmdn0Ko591pakiShNaPKyyh88GUI?=
 =?us-ascii?Q?3IF+z1q7QvcbuGaAysOnDtd4K/1IU36kQALcBk6mb/gM9z0a8e72VWeSkFim?=
 =?us-ascii?Q?fw++rOz4Y7s8GXfjnCKjrmGK4UxdOuVNajA9xKOJiFARzv5/v9Ll1BUPOgNO?=
 =?us-ascii?Q?Tjd9FhEDTMxXO7KS2NkSyO4fjyWnQVZVaBFidjoozw849/CMsbupPkPFYLG0?=
 =?us-ascii?Q?1qHZ/hQDG37eEQR9Z+iYca5P6rcMcd0r0IOZvgxiy7llifYoXn/876PYlgBI?=
 =?us-ascii?Q?h0XOVURWDNKDdhjbvY5VkMJhKvlNoplvS1RMwWvxMuWnkkntp63f5qpLk2mS?=
 =?us-ascii?Q?zN03iDunFHxJn/9qtycgLDcORq4k227kz+0ex7Tc51cZC5OGT9seUDROhogW?=
 =?us-ascii?Q?x8G+pzET9XVuHb+M5bd4bbWccOiUoEpUGbNEKvahnj1qa7KouKzJWR8EiJ1C?=
 =?us-ascii?Q?rv8/zaeZxSJvBgtUBwgO1QRr+rlQKqWi7eTAYNiTBIGDsVmz4wrXRx6JXZNZ?=
 =?us-ascii?Q?aPkNRyiVirOWm71SdXjJ+U6Mc+xK1dBn0+F6ptClGnPmH6ElaUb1+CbfytUP?=
 =?us-ascii?Q?z5ReB07rj6TXTFWUuJzgIGSK3B3Pu9kyCukFmesXTCURuInxqLchjiJpReqM?=
 =?us-ascii?Q?SfDaOMaOO/i7LFFtlyNhtR4x0UTFdwl2pWM8O57Cqub7Zh9oxMGLF7aJZ9yI?=
 =?us-ascii?Q?Q1g5FN5OBIc5yeg1NNcH8zi3n8RxYygFwe77Zoij8c+gF1wE+Uah8pLUz4Eq?=
 =?us-ascii?Q?ww0Yu9mx5G+nErgTcTPO2dXGFsX8GmxohMulahY6+TEZn02bJGehTejDvoiQ?=
 =?us-ascii?Q?M+ymxhcBsLg74VhRl5z1C0dVzGNd+lSMBkgLiMGxR2Qzy1Nw9qPpLrNuboAL?=
 =?us-ascii?Q?iSw8x7XNzAB1UaEHsWBftA1MRbpuGkOU/GSH/t4rF+1dr6WdoCkNpWWghw?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(7416014)(38350700014)(921020)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?D2wR/Z+WKsphjeLjTo4irIszLsIsjBtDhmSvCEcF2LZ22u53HApTKUsHN/x2?=
 =?us-ascii?Q?p4gqrRGT1YrRFBY114GZqISF8mhUx5qKqYIody7nWnMuSqUMF49dHbZ0s1Mj?=
 =?us-ascii?Q?j7qIKa3UB9kQLKU7RnCemR86sCitCKAxt0G7Vfh4MFEdddN2duxnO2nMDka+?=
 =?us-ascii?Q?F2nsgSGB4Mskh7KffofyRppm5AEjnQ2RXvEfJ4lJVCFMiiHde4Njq+vDkVtz?=
 =?us-ascii?Q?uSDVbEvWZREToer1ro8tv4x+b5sjjEIYJ4Jk767Nb9qO6VlnZOXZmA/1cTGz?=
 =?us-ascii?Q?jGunkY8hhqKeB2H/aunUexn5Yfyg4GV+JTf+s0w2tLLmZiLe4nmVL9D3982G?=
 =?us-ascii?Q?gQ1U0e2tn972mnKOteYPAsf3TObkMB3dnUeuz5NV8i9k81C+Pev1vMU1Iayl?=
 =?us-ascii?Q?coXe8kAS/AIW9hFzroASOEyjJqSJY0rHSdGRWUshAhXS6O7njTtyhZJ5NvGz?=
 =?us-ascii?Q?BCUXLUu3F5glMTyqL3bHk78gb2iB4ah5wJWWc7ADEsbSLzmL0iZmQikwTU6G?=
 =?us-ascii?Q?djwyR2DB/hm6esN5ZJMF9nciarmzI09XiwjihAQOxjucmpKTnT8rSH3BOSlj?=
 =?us-ascii?Q?n+M/dtGDqVNtI07vYiE4URjqHAj31XBZ4pYjtDb/TeBKzEadI6ni9gmWhakA?=
 =?us-ascii?Q?yDldxktQUhekpSU+F/7VgYRt261qudtEa7D+D0TPneflkVD61WmRnmjXdGqB?=
 =?us-ascii?Q?jkE9NT+aq/cFXlJ76x6KeAaO+3hrkIoHlMoTkX0g5ZH3CazxD8CNwKYZkVpD?=
 =?us-ascii?Q?CRBwmPJ49DnbezuuS1eEs6N7SM8m6fxPTFVIDrpPJRiNVo8LNyk6pCWAcRju?=
 =?us-ascii?Q?auunjiz86CvU0AuHwzSyk2hUpzMq88gkdSc0q9r/BiQAzuU7yWSyPZWiEqeI?=
 =?us-ascii?Q?lrQQ4wxLLVqE2xLE5Nc802OYnrTMfnUTWgQwZNZJh/G2ur6SIOjfHRU7i04y?=
 =?us-ascii?Q?5iQyQotHutOruSXvwd0i+RXK+x6sfV6Zy65XHio0ZSINLRx5lxaO8KLy1VHY?=
 =?us-ascii?Q?k7gIXgv1STGv3ObEsg4F9MB9RN+c1kH3tIInux0y+YaWgvTj6jE2CadcXB+Z?=
 =?us-ascii?Q?VKf/yeSdPvtK6jqED4ZUN4KE8bDY4JU+vCHbjm0xQGUPUgR/Cee9NlAaCVga?=
 =?us-ascii?Q?0ptldFjyCGvFN1FHgpACDVacuJ8ZA8FinbLb9ruYfuSNj5ZjSUiWLdhZ5Y/b?=
 =?us-ascii?Q?OoMy0+Uog3qUPFGfFV5PIiMl2QrXPgHivVaLhYYUl/g/mgwBg/Bik2dgUo+Q?=
 =?us-ascii?Q?UfmJOko5KR03L/IiD08fsbpRb5dd4bcLH4R6oQdETcd/0vded7n4aB86WW3y?=
 =?us-ascii?Q?O8pyOHQrSeDABWq8UZv6voywuP/Q/sH+FupK8g9PxWa9JxJU2ctPWp6alSJa?=
 =?us-ascii?Q?f9n+dnUfrJGljay7InAWbvhxDtxooFOQ4X3HxOvWXkSZkZ+3Psw4GWSOYIvl?=
 =?us-ascii?Q?TvY8BYyXJTetyP0ue2KEavEHUT9c3eJ6pAjTowNE4pfsSIkTfsrpIur91kg/?=
 =?us-ascii?Q?pDKRttK+nsXi/+2CrHAynGy4QADA6dDdeOpzAjo4OQOgjqJ2b8RigDH5a/Ck?=
 =?us-ascii?Q?Ps7v7v1Wlkrnws8e52qAEOpHtXyD4oKzWM3En/yyUdFDdv5oaGWpRc+MZwfl?=
 =?us-ascii?Q?d4ABDg1ggTYCAJap05RVu+I=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3767776d-1afe-4160-16cd-08dda9526d33
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 01:42:44.2499
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nk8VPvc+Ai0zYAssxLecW+LkPS+y5ebA+gZGLGyyHMIKzf4Yo36Z/fxEybbOtlQSXvN4oXQWMu60F0V/qOtEplJsRlKunj1Mv4lQL+KSrC0h32F2nunSeOj/yFJEJlZ9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB15122

Current Kconfig menu at [ALSA for SoC audio support] has no rules.
So, some venders are using menu style, some venders are listed each drivers
on top page, etc. It is difficult to find target vender and/or drivers
because it is very random.

Let's standardize ASoC menu

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/stm/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/stm/Kconfig b/sound/soc/stm/Kconfig
index da1f7a16605b4..2753d6c2a8266 100644
--- a/sound/soc/stm/Kconfig
+++ b/sound/soc/stm/Kconfig
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
-menu "STMicroelectronics STM32 SOC audio support"
+menu "STMicroelectronics STM32"
 
 config SND_SOC_STM32_SAI
 	tristate "STM32 SAI interface (Serial Audio Interface) support"
-- 
2.43.0

