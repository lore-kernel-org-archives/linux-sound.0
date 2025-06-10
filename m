Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011053.outbound.protection.outlook.com [52.101.125.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F7B125E44B
	for <linux-sound@vger.kernel.org>; Tue, 10 Jun 2025 04:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749529224; cv=fail; b=r+0BTv7Zc4F5ZlKx+Xw9XkLzZ7gy+9tHMOB0gWvD7J5zXpwNZDXob78NRbBknP7N0X3RXVbHBzSAuhS1JRARzLsSJrHY1Us12A3DQYDq2qeUHBlY6P1G+yLqSxneoBWzbAgsQ9gJ64KRxfFksqTTa5j8gcf1uz9IZnx6gzTVWFA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749529224; c=relaxed/simple;
	bh=CRTDDImdMMnSYm5QB1SODwNVgFDrfbbifMlttZNIULM=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=jTPllMYFlq2ax5Ooap4S6vEJcOhMDzJFjQHnR2UM3Prn0OKk6tpF+mDaMfb+zPp+DDqVOKZxtBQFW2AWuOcECFYLGUcHmYPP8s74lIsMCPzJpWXPIJ+HgGm3/KvgwMhpdSFy5N3YTp0joyr3HjUitSRU1Lilk6r5d8kNLPA1I3M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=S52MF7o7; arc=fail smtp.client-ip=52.101.125.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="S52MF7o7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZgGTv5PKssPMToilQlQJX4kmt6NV0H8AKX153MHhLZtAe6JEKU3ieqXnsyNOVRmiuxUyMie0Mbx5bmJtjDXn5KEY6DPMVnkS+yiCdTmlnBAg3dKjzMZA6WiQhNCHmaOAAopP7jGrz2mlb1FKVoNaIMSmQ31pGrTnsxz1rASidrnsFxvp2DWMTcmvjC5AfXwDNn7tZyGsI8uo08dMSWOYokLhJBnoNZxI9k42Sg3BVbz2G+JGEKH5DFNBD8QdvWtduCm5zzRupZPJ91kyzSwnC85ESOfX7RyeipGRxRIBXGfcOafH1QZRcdTn7+5+drRi0WH+tTUeNOlvYCxKOJ9DBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WGVDfcp7eT6xx+BPM/oatBkgbaJw3R13fZlqbHxTDZ8=;
 b=ZWaqkfYV3PmGs6rCkfi/8Yxnj6YSDoVnw5yVUOpVdBTNchTofIseWnFSqBe6MfmbUxtxWULnPECiPKUzmKkJgyKeCgNZDyUhob2jh8YeSWhXku6SzdBndYVJBPYRmiG606t13a/q+VBrwlaDcHzc8b/uz8tRlgHfWnmnNwaP8WdAsjHhbYLsjYOMrZ/k3DjfkuBwXx9g9vCQzGvfca02IqkOofun0RJ6q1X8GQucvSURo3moBEjymta6I1vIzVK8u3uDCCnkWJqy+UfHkM3ViEJ1ri9PDMVma080DS83FNZ3KRdaofnOrzby6pfOjeQAMx1QGGqVHCIQo2bDTErreg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WGVDfcp7eT6xx+BPM/oatBkgbaJw3R13fZlqbHxTDZ8=;
 b=S52MF7o7T8D0NaAXcp8lpOC9uOeMaNGhauUu1Dk5x8wPMFHPJjNzKErUjl0TcZjcOe6TZA7cUJKwBd/DI4bSyGtXHDzGOSrH74iCrsTnekrxi7zjxtExq4ugOWudZnsllTrq0cvUjEnv1mFq7MXC5WYhyFHvPHR1qeXYfNsmUhU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB10510.jpnprd01.prod.outlook.com
 (2603:1096:400:307::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.31; Tue, 10 Jun
 2025 04:20:19 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%6]) with mapi id 15.20.8813.024; Tue, 10 Jun 2025
 04:20:19 +0000
Message-ID: <871prs8by5.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>,	Jaroslav Kysela <perex@perex.cz>,
	=?ISO-8859-2?Q?=22Martin_Povi=B9er=22?= <povik+lin@cutebit.org>,	Claudiu
 Beznea <claudiu.beznea@tuxon.dev>,	Andrei Simion
 <andrei.simion@microchip.com>,	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,	Cezary Rojewski
 <cezary.rojewski@intel.com>,	Peter Ujfalusi
 <peter.ujfalusi@linux.intel.com>,	Bard Liao
 <yung-chuan.liao@linux.intel.com>,	Ranjani Sridharan
 <ranjani.sridharan@linux.intel.com>,	Kai Vehmanen
 <kai.vehmanen@linux.intel.com>,	Pierre-Louis Bossart
 <pierre-louis.bossart@linux.dev>,	Paul Cercueil <paul@crapouillou.net>,
	Shawn Guo <shawnguo@kernel.org>,	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,	Fabio Estevam
 <festevam@gmail.com>,	Daniel Mack <daniel@zonque.org>,	Haojian Zhuang
 <haojian.zhuang@gmail.com>,	Robert Jarzmik <robert.jarzmik@free.fr>,	Heiko
 Stuebner <heiko@sntech.de>,	Daniel Baluta <daniel.baluta@nxp.com>,	Orson
 Zhai <orsonzhai@gmail.com>,	Baolin Wang <baolin.wang@linux.alibaba.com>,
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
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,	Mario
 Limonciello <mario.limonciello@amd.com>,	Yu-Chun Lin
 <eleanor15x@gmail.com>,	Vijendar Mukunda <Vijendar.Mukunda@amd.com>,	Nikita
 Shubin <nikita.shubin@maquefel.me>,	Arnd Bergmann <arnd@arndb.de>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,	Vinod Koul
 <vkoul@kernel.org>,	Shengjiu Wang <shengjiu.wang@nxp.com>,	Piotr
 Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,	Sudeep Holla
 <sudeep.holla@arm.com>,	Elinor Montmasson
 <elinor.montmasson@savoirfairelinux.com>,	Binbin Zhou
 <zhoubinbin@loongson.cn>,	Keguang Zhang <keguang.zhang@gmail.com>,
	Alexandre Mergnat <amergnat@baylibre.com>,	=?ISO-8859-1?Q?=22N=EDcolas_F?=
 =?ISO-8859-1?Q?=2E_R=2E_A=2E_Prado=22?= <nfraprado@collabora.com>,	Geert
 Uytterhoeven <geert+renesas@glider.be>,	Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>,	Sameer Pujar <spujar@nvidia.com>
Cc: linux-sound@vger.kernel.org
Subject: [PATCH 07/37] ASoC: img: Standardize ASoC menu
In-Reply-To: <8734c8bf3l.wl-kuninori.morimoto.gx@renesas.com>
References: <8734c8bf3l.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 10 Jun 2025 04:20:18 +0000
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
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB10510:EE_
X-MS-Office365-Filtering-Correlation-Id: b6304efb-aeff-4a01-822f-08dda7d61c0d
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|7416014|1800799024|38350700014|921020|41080700001;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?JXh5xWwYpUBegIHr5xTAiBhPOjzt9fVSK6UVvEv0WKA2OuDG+Mq2iN8rGVu2?=
 =?us-ascii?Q?p6ebvFSO35JjGdHJD3SvoVSXWnP+ceBeQPs+2xvTwoFyjnTKQqKNwzFPflRS?=
 =?us-ascii?Q?vDJ1CNTE3vqH10H7fbxrMGzZT1qC9OGpqamophO9DdcrXP/wSw782FpWfOB2?=
 =?us-ascii?Q?1bVL+U3bd7YCWiaZO/9apJIhqmQiN82KWCUkRfjm5dllEG0ZeYKIw9DqemFb?=
 =?us-ascii?Q?NM7yJSTYIaxvX5sXw/rJ/k5w3LIepQ7l2y6LPMG2iy8Inrhd1H5ylZMieREv?=
 =?us-ascii?Q?u72//Cao7jW8ZtGl1c7lST2PGDgAAOQ7K+YRQqvUXry+I1IKeT+cP1Src8G3?=
 =?us-ascii?Q?zkm8GL0VWr4fO/yveNcf+tbicIYrfH/G8tyB26BkRJHG9/pCtwg+RfLlNiVP?=
 =?us-ascii?Q?3xxSgop2GVSLd8BR/xkEqtDL32+A35Js73U8u7ydzm3iDO51FO9ablSdqYOy?=
 =?us-ascii?Q?Zn2GqOEJ/WjdbVwjoFyk77d5w7MQEir/NSdVbpAUqixi16Drnpj5kF3n8TQq?=
 =?us-ascii?Q?1sA6c1pD5b//hJPm420khRru79RU4BtUgTDFgvfxvPfNYYG57H7Mm07IwL0p?=
 =?us-ascii?Q?mCjVo92cBZPYxlIcqzBw4w1NUZzAHF+b3TPY9GTCi1F/fr7dPsuwkE2XHfh3?=
 =?us-ascii?Q?tqvdno+5rrV1kiZeH02PHf8ESRXyrM/jhCUsaPL2IaDuQ+/38S3bNMdhlM0Z?=
 =?us-ascii?Q?3Pwqn2/4z1cDbsjchZ3vFRVjIDR6wdHG6P4SiAdJddsUvmXTYyecEYOJ0ZSA?=
 =?us-ascii?Q?8nHteJqqZdNmYQ0NntgK/kf886dxxUJX2ORTVIljCdlvQmK5K3hKxKTe16s3?=
 =?us-ascii?Q?iEEx5KFbR3KkL6Zfg7zLQOc+3+oYk7XjYG5yZoc4tTbI9/cG5TYguL5+b/Mo?=
 =?us-ascii?Q?khbYJjvALmGfwZa91sBJQjPgdSkvaatB6InjiFEQytEe7M45hIDQ47M47tJd?=
 =?us-ascii?Q?LtpOMzY8cmYzY3BQA2shoi557V+MYVExZm+FExH/F+dmX+uBuNWKuOGw34Mj?=
 =?us-ascii?Q?9PAqPS91C7up6w6+fU9y1D/ZgMxur/7z78iPumqPJkFNmtwaVZVcw0EIVfX5?=
 =?us-ascii?Q?h3KznKBiKSazmMoVifBI4ttxQAVVDkiMdkF8VqzsEPUR8//MyHyh3YUQQr8y?=
 =?us-ascii?Q?C6UMWUyds65nlcZwmOaLwn/YJcyW0fEqZyyOMMSALICweGqACnfliSMf+etu?=
 =?us-ascii?Q?yKzNWsK+Pn0rp+X99Fkcfhf8k0687QBayo+Y0O2qmVvtmFmlbhkMtilYYuSE?=
 =?us-ascii?Q?vFBdOOhppiLDp3Mk+GMBMN1H21HDCa2I5GF5jklcGwdqmv815iNebie4EX6D?=
 =?us-ascii?Q?0yESP/rF/TqLcpIIjT9jA7YOP3Ua8Ii/4dfx862a17C3tPMbd/d6ONmpHVaI?=
 =?us-ascii?Q?RCgXd70Cg9KG4JAwPXl1ecnq2zxYLAVSJhlLQyCnJ2frKUdHN7EzKrAVNg/H?=
 =?us-ascii?Q?HH0Vp/dLr01PC+D+uoLrGBMvzQYfmZ8Cp22bGCpKEd63ww5l+Wta9hLdBehK?=
 =?us-ascii?Q?pXvkEp4etYl3Q3oehtADwfOa3UQ1VsOlAfkoeHlSgQlHmPEtL2JbkXV0bw?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(7416014)(1800799024)(38350700014)(921020)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Yze890o1YrgK5ToEFZDiCJvEgvca3RsfkG+aMMqhCncCD1tTlMKcvzrD4bp9?=
 =?us-ascii?Q?dA4cMgsMtfZeDT2ciwgeTtRNsf1Zj6CAVW0jBk7xH8wyCYyAb0fl2iDzzdwg?=
 =?us-ascii?Q?CwCr52ysSLY4/FUU3Z4iuAjgAk1bnUEQC5+fbXTuuX/WDfT+WH5HBIPpu5LK?=
 =?us-ascii?Q?eZ0i+dtqEM/WXBP2zkXuVSNTPLtCQMEHwxPV0Wcd4MQnXtfsuCVREDPwKG3Y?=
 =?us-ascii?Q?UqD2GWJheHS6mnCT4UEhofS1eL/X4TjGlOcuglhr4E/WrwkFSeTXekc5heV5?=
 =?us-ascii?Q?572Oydbidy3Rw0BFqkOglCXn5mu1cGLWZy//eyTgWAH8iDXbOAk8ibSRmXU6?=
 =?us-ascii?Q?rCgI8IeUQbhkENRFtgN+oJuqWtNXYRsxEh8LREtPRsK6vn0Lu1JuYqX5WN4R?=
 =?us-ascii?Q?7UQuF/j45C4QBodS9rzy/E0Q7nyS5rtIAUt1yfvPlb5GlE3ZL8z+Llam/yZD?=
 =?us-ascii?Q?pKONtlX9qka0tbtvvy9eRP7BJBLhwMCHrjuUqByKur+jlGXlUlU5c9GZ1jyO?=
 =?us-ascii?Q?EoLmygFRZKWVrDp5ciF1XItQ7qGKxJOCO8rmULpTi347K+8viHGZunE3ErER?=
 =?us-ascii?Q?rJZ21iieAJENe4HFCbxBzRILwwCJAv2JUpdfmQafdw142mKdnjoNkEtGxAxK?=
 =?us-ascii?Q?UL+KL8ukBL5DHD9UEJPsCMMnBf7nVhSK6/V3CaimESaapg9tkhEfuSKVUfrp?=
 =?us-ascii?Q?/s7IkQbs1UhtoEK1y0h3ZIjJT92iuULZ+0Vk71m1/VlWD3bsatcGCOLMMyBk?=
 =?us-ascii?Q?eDC4bbR5fvzALYtuIb551PqjUW3/yzZpDLuUce5tQmyNr1HNkT6AypVHXNXO?=
 =?us-ascii?Q?SuWd7fxYHDn73QOBz34U0Y3rDZstnLNCZcK2zvm+h/sN15ep9MJBFkbDrnAT?=
 =?us-ascii?Q?8A7hcTWQtzjFVRxpA8BjS7vuS+f4P0ZJAlcjNJ8CfMQeUXoDckR/iYf4dmIM?=
 =?us-ascii?Q?mIQLZda6Op0dsDzobPxepaHkQgSeEmZxUO+oHXMHFWfn2euol7LZTQemaUjI?=
 =?us-ascii?Q?ZfA/wKrvIsJn2bQt4JcLhgwOHqI3zsk6KJxqut+hXyu3gI8bwuKIfXB+bb5U?=
 =?us-ascii?Q?+A5Y+dtfc/h0g0WixS5Nq6j+pHNmhQskSwTiUngBEdJ9L4oeDt7QMrM65TJc?=
 =?us-ascii?Q?VGe9tKFYM7gPXPCEt9Igdt8krcrwChahQk6dt0REa85xhOz8KAFjSTctyCSM?=
 =?us-ascii?Q?DQO0t9jh8bGNqZTlGAfxQhSrF+y8NOO/xojGscRf4LuUqL0/+ako4BidQhGp?=
 =?us-ascii?Q?uTMeJMN0gGG+egVcu9om28dIaQLCnpaU6OfKRxydCihF5hFRYHkFKKJa+zsD?=
 =?us-ascii?Q?00DVDlZ6aZpmmm961Ul8tDJLW6lpwh9Sapy79flo6CSZWD87J8PC5oYJz+nw?=
 =?us-ascii?Q?XjP1TCwgjKQnfhzse0uEDHhADSHHK9HimxxxcG+L+VK13Lg7R3jCsBNyWDWK?=
 =?us-ascii?Q?N/sKE25zgwj2hqkOLuccY4qlwAY8BLeJ17qzCjkYMF0eJwkrB28oEsFPRM2t?=
 =?us-ascii?Q?Ss4Gly02qPM0ZVt3nTAYhptyggcQpTA8b6iX8qCM39KYGse92oz5X2adeKct?=
 =?us-ascii?Q?5HuZtiLt1D5QhWkhEpjrtAhhppe6Lvs5ZJwXS4YAv7PHyuw7dk3wXRpCb+MK?=
 =?us-ascii?Q?KUd76SBlv+T1+WAkr2Jn70I=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6304efb-aeff-4a01-822f-08dda7d61c0d
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2025 04:20:19.3491
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g3oiHolesEq5MD0mNJAjD98g5BEqVKpfndwmQmVpYUx5PAYbgWJD+W7I5vfupZ7vgRqn1bJLlkb/7kCJGBwwx0rDi5a8o0+V/MEw5IViKgn07dVEA/KRI2EdT31VhM/6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10510

Current Kconfig menu at [ALSA for SoC audio support] has no rules.
So, some venders are using menu style, some venders are listed each drivers
on top page, etc. It is difficult to find target vender and/or drivers
because it is very random.

Let's standardize ASoC menu

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/img/Kconfig | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/sound/soc/img/Kconfig b/sound/soc/img/Kconfig
index 568efa606ca4b..e2396e285a093 100644
--- a/sound/soc/img/Kconfig
+++ b/sound/soc/img/Kconfig
@@ -1,12 +1,8 @@
 # SPDX-License-Identifier: GPL-2.0-only
-config SND_SOC_IMG
-	bool "Audio support for Imagination Technologies designs"
-	help
-	  Audio support for Imagination Technologies audio hardware
+menu "ASoC support for Imagination"
 
 config SND_SOC_IMG_I2S_IN
 	tristate "Imagination I2S Input Device Driver"
-	depends on SND_SOC_IMG
 	select SND_SOC_GENERIC_DMAENGINE_PCM
 	help
 	  Say Y or M if you want to add support for I2S in driver for
@@ -14,7 +10,6 @@ config SND_SOC_IMG_I2S_IN
 
 config SND_SOC_IMG_I2S_OUT
 	tristate "Imagination I2S Output Device Driver"
-	depends on SND_SOC_IMG
 	select SND_SOC_GENERIC_DMAENGINE_PCM
 	help
 	  Say Y or M if you want to add support for I2S out driver for
@@ -22,7 +17,6 @@ config SND_SOC_IMG_I2S_OUT
 
 config SND_SOC_IMG_PARALLEL_OUT
 	tristate "Imagination Parallel Output Device Driver"
-	depends on SND_SOC_IMG
 	select SND_SOC_GENERIC_DMAENGINE_PCM
 	help
 	  Say Y or M if you want to add support for parallel out driver for
@@ -30,7 +24,6 @@ config SND_SOC_IMG_PARALLEL_OUT
 
 config SND_SOC_IMG_SPDIF_IN
 	tristate "Imagination SPDIF Input Device Driver"
-	depends on SND_SOC_IMG
 	select SND_SOC_GENERIC_DMAENGINE_PCM
 	help
 	  Say Y or M if you want to add support for SPDIF input driver for
@@ -38,7 +31,6 @@ config SND_SOC_IMG_SPDIF_IN
 
 config SND_SOC_IMG_SPDIF_OUT
 	tristate "Imagination SPDIF Output Device Driver"
-	depends on SND_SOC_IMG
 	select SND_SOC_GENERIC_DMAENGINE_PCM
 	help
 	  Say Y or M if you want to add support for SPDIF out driver for
@@ -47,7 +39,8 @@ config SND_SOC_IMG_SPDIF_OUT
 
 config SND_SOC_IMG_PISTACHIO_INTERNAL_DAC
 	tristate "Support for Pistachio SoC Internal DAC Driver"
-	depends on SND_SOC_IMG
 	help
 	  Say Y or M if you want to add support for Pistachio internal DAC
 	  driver for Imagination Technologies Pistachio internal DAC device.
+
+endmenu
-- 
2.43.0

