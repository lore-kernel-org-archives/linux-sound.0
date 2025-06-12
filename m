Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011064.outbound.protection.outlook.com [40.107.74.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B50CB72637
	for <linux-sound@vger.kernel.org>; Thu, 12 Jun 2025 01:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749692578; cv=fail; b=VX2Ts7Xa+Vhg8ZYntcSvReGiUTLlfguu003OVFXXvS89jGGwqNHEdaB4FFWPbtrefg+uWOb/1PnCs5Rhmbiy2z4q7YHc+N3ftHT15FNpkfJARSZiVr/Hsv8d5qcaZmTEnBN2r/KNOmwVOJLcX+m77LgzB8Ea2PgatzH1Pqmx17Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749692578; c=relaxed/simple;
	bh=ohSerATs78cHS3iIiNpNx9mDaEK/5B64BEpJFSzR7pE=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=TtiIH0qeLBfU7DiNVWLWQrP4pzFmVhBGcC4YFqsdcQDLrXbQu1M56+J6BxzZFyC0hUIlT2fbrtqDxzZw7lAm0YzPmOkKakQIeJKc0HOMX27WlkLB6ZKpckILGtfJfNKdFIhYiJcu4yYuWT6QNPULfWTPEWJq0zkB1v+y5yxyE5w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=BgdbSHv9; arc=fail smtp.client-ip=40.107.74.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="BgdbSHv9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x3QWobvFDEbaQoWX9zGgTnowzzFC4xzmjrMKIlD1xA+eAUndoX64yocAMMxkvmVb2YXvpL11ZuvMFr04XjmY1oIOO7S1Z1n/GPMC+IoMOihkdjMcuWrpJRwB+m63SSKn8t5ZeRGdY+4Lpet2mo2y0GLlfWPXXrFTzKEBvbirjHbrGfDa3WeCm9Z7lUFzmdidQY5sVWtm/LaOWW9PfF9XTwsoiS7//hmp90zVhatbFXasV05ktyZFg1mUVpPWQ3iXnTBjo5ec0xWSp1By4JQjSPE6jHPirqmoI0zW4DqEE0U3CBnbcGEBCbESvJW2/U2tfCKKPJlcm6RkIHP/ePMpGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xNpWKkuu5XiIP6rw2MkFrCUQRFN6DW+yTrHqgP7vAS4=;
 b=uEs19L3pIxV7c57KfHTznlgjOyNhOfToKoyIb40FhklF9ILiHbx8FR8PPBeqxp4Yx3k3CodLuaJrEnWc1fUMwDsHScjBv9YhNvlDUqBl8Pg7jcTRWEVN0Blz5MPFQOB349qUcF6MO2C6HX0jVbYoCf8SQ07qNt0QZ2/XgiB9ycdyJAOwbIZhVc76NS+g/55LrjWLl5eQZwOK/F16R4ykJmclo0bLx/+H0gNwkdsQGXsVVY0KUsiUquYYceIqtP9SEY9wQ0cVUvALyulv8GZzAhJOTalM35mXvT1kGZL9M4vRMuEyDvizEUXvaSgH2lGqAME07ixnUrVOIxK4dfJXOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xNpWKkuu5XiIP6rw2MkFrCUQRFN6DW+yTrHqgP7vAS4=;
 b=BgdbSHv9epHDM7gyh3Me8t/LpWJUAxB6dqDRPevsfZhy/KR/cKniydHQhtzZWYQiuigFQziZhGvN6VfZyW87wMmzzTctztW/krliyXFPVSKrea2SIScbUi/yBta+4qdvqg8ZcqQAS1VHVqj27Ca3BhuNv2kT40RlaEvzE2SDP0o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYRPR01MB15122.jpnprd01.prod.outlook.com
 (2603:1096:405:227::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Thu, 12 Jun
 2025 01:42:54 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8835.019; Thu, 12 Jun 2025
 01:42:54 +0000
Message-ID: <87msadzqea.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 13/39] ASoC: au1x: Standardize ASoC menu
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
Date: Thu, 12 Jun 2025 01:42:53 +0000
X-ClientProxiedBy: TYWP286CA0002.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:178::17) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYRPR01MB15122:EE_
X-MS-Office365-Filtering-Correlation-Id: d415754b-209a-4765-d2d0-08dda9527357
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|7416014|38350700014|921020|41080700001;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+1Odt28WaM/V/yJBraTinQrVbw/4UC+A/zrweae4QoftqvpZWx7WMajIGToD?=
 =?us-ascii?Q?omLMB05A8y+hmAByZd1AwAqOWYHNgjqiPseV5P/yj1NYLLpK8S7+3TGcoy84?=
 =?us-ascii?Q?+vqaj58JAyOj0h3lKTcsaMTMVTnWA9zc0qJDewaPC1A/ddsHIAEoZ9AWFELB?=
 =?us-ascii?Q?rL5c5N4lqQjfeFDSvkDYSPWY6gaAINHSpjosltLOd92mEr5MSGeemWAsnznZ?=
 =?us-ascii?Q?wWakIOTdNUMc9JLmE5JEPpNhpTJUKz8DAdks/pyXsikKlm4LA1iekpjuG2Ru?=
 =?us-ascii?Q?xO2jhCZqA2IGSvUrwuyqvAN4YlwCi84QJ257L8AXoo56Yt4jAdjwXTtop4Vk?=
 =?us-ascii?Q?xVbsOWcC8+vLa3QjFjRvDElVzMKheXEWDGU1mSHTMpQFWNpVPxpPVVE/s1dc?=
 =?us-ascii?Q?Y10oHFwyD2bkAlqovlfDSaBEb1XY+2NPO0o6htKr7ufcJu/MvuglzmwONkSk?=
 =?us-ascii?Q?Vpn3mbIqHHzJqgJy8wpuxhwbVJMcGnCdOo+3fdVLUz9NNw1Ap+vudcWzZbzW?=
 =?us-ascii?Q?/1vzc2bfaQgLCdeDcLeGDOmt4DWrv3vNe28luCjfxWjpnzH4fbOBpYURJyQY?=
 =?us-ascii?Q?BRf/wjeCudamJ/bj7/KQhmNl3Is7guL2/V/aSRs8AofgHfDhbNMQ1FR/ZC09?=
 =?us-ascii?Q?+Z3UgQZhzrvJA0mIj3B8hw4b1FNUjiKtdvAcPILARRJJyrdR33rCYEKl2uO4?=
 =?us-ascii?Q?pS6moE7QMQ5JqMv4oXaUSlAHs0VoRoOO/9d6QYZABtF9XFaQ3dvlhnA+c8pN?=
 =?us-ascii?Q?x+iYe267rm0FWhiUHuUhs+1XrLCDM3MsLQEnULTUlcRoK7do9FNiFy2Nya0O?=
 =?us-ascii?Q?Jsx9q6RMoJ3A1P7w/E4xOzRCRNgTEeU0LMae7SL/7nE5Im8q/s5o2kgNXYTv?=
 =?us-ascii?Q?BHWWBoQERfvVk9Eaozk5QA3O727BO+vmsL69Bwropi2ZPhbsKs+9HM+bayz0?=
 =?us-ascii?Q?sHmmixTD+hilms+nUTNYGcLm/gzXvyNBRQuxhQlLd4XP4YbODeos7Mp2qm8o?=
 =?us-ascii?Q?RP5g00LPUj1nUNAcp0nkimrqrXpqEXAcV55sY9Gya5ui1QLwe+QY7hjukR6t?=
 =?us-ascii?Q?zqL4GUw52Eir8LF6W1f9NxJ5B/hSWYbMHtgDEEuUbs/ht68WG5UI57+PxSHp?=
 =?us-ascii?Q?zZ8LCsBGwnuaDI/0MgnC1CXhW9hsASNeHPfcvhcG+L5XZbea7XNlQOQP1Mre?=
 =?us-ascii?Q?hlU0TV/GIZ5N/bulFH1NNGdSCaqjoAodyQOjna2qW+Q55/gFAr9LfrRra48Y?=
 =?us-ascii?Q?zx+uyXy5QKaTN9UYt64iqt+jbGxmoHQTtTPkzCLW/adWqIajpceXdhNrHkwI?=
 =?us-ascii?Q?+6yVx30w6XwE1wmwgeL5Dx0RMJ0ra5QyrRf4QLFhI9WaU+oYPm0OEM6gmb88?=
 =?us-ascii?Q?1O4tykM4wMb53HwsbsRSiV0UPxfFvRWvvdfXXqe9yfYmPCVzp696KK/W4W7S?=
 =?us-ascii?Q?RF2FgHcTgis1OZSirPS14yGYpkkL8dhtzitCxbFeVRE+l9VbtBIv5zaon29Z?=
 =?us-ascii?Q?w82DR5rcp2PCD34pLYonDEvu+pYoiVGbN4aaissJkDr2xWJVY0U7ATcxoQ?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(7416014)(38350700014)(921020)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?eE8Knr80HymxTZ0d+aR9XqNOWUXqNRGLkaF0pDyN2vom7kOrEi7gjjX3akwJ?=
 =?us-ascii?Q?NEebMkX4eYYWq6D8SKZ3Su7sAs4A+jGbV1v5Cuep5o+gkyiRcJ83+4Gve1RN?=
 =?us-ascii?Q?NlG9HILdYJr3hBtI7JV/zKgithiyCCaKk7ssfEoZ3pXevFvvKmVc2R0iJfMr?=
 =?us-ascii?Q?h1S49UnCWPdwXyVFPhbEOm0JRTsjXdXJcHsu5Uy+FKRucpM21CRGVqtYQBtp?=
 =?us-ascii?Q?IkCf1qWaTz2e/g6dVfnaCaJSmLzTCCB4EzZ2cjzfzT4uemyEobMkT34qbFGD?=
 =?us-ascii?Q?H/2XvvjE9wfRA1lafyABEddt3uMfdUV2v1q37CBUgk+tw6Y2YgEDkTKjolBo?=
 =?us-ascii?Q?0lUaHFaENo7SiGrAwyrQFpHP9X7opan5wTgjQeG+Bt0P39e6P90zUS8Zjku5?=
 =?us-ascii?Q?QJUFoMybEfrj0a+nbNty7vnZm7RscUI7RkdRr1qU4IQ99McTfjizXqycqbRe?=
 =?us-ascii?Q?doGHzFFO+scXDLBDFmoAEArfH/aOk8HXQLbGLzJEpTdntrSAIlUyy5icoIlN?=
 =?us-ascii?Q?RJ6xKeDDcw0JuUvRELCrty8t0Q0n9toiPvQiPnSwiuHgjzVsFc7n5IfjdF37?=
 =?us-ascii?Q?6dJ092vclGB6dcol7MwqZ80bCuIhernz/GbBysG9pZwNiEpRi8VbOxhXbESk?=
 =?us-ascii?Q?AvzeGF1hnByge2zSQcgTNKHZ4IMENnjc8eRTbE4UhVRUKe2xcUalMIe2U++w?=
 =?us-ascii?Q?t1cnbjx+y0eyjPy4CSCN5uZlHXDAhni7xeXvkCnF41Yl7YfRogrEYB7jrouO?=
 =?us-ascii?Q?gjeV3UTmatBHAVEoXeMs69PDjJFFtwnqdyfi8YZBeka7Sj4vkSJtN+/wVD10?=
 =?us-ascii?Q?a6490Dok0kZottNAh+JDbqLLoViGINrpTxrDio8AJPq5IFcNKCh9LTIlSXUm?=
 =?us-ascii?Q?62jqDrnd5f7iLCaqNZYJVuDB3o60xw1jCmyM0cOODMghwjK4I6o//io6AF8j?=
 =?us-ascii?Q?Wbk59UPQKiQLkVEvwpZ79SGiOaLxk2qcpA8BYFv8afK3r+pOuEC4xr46jW4V?=
 =?us-ascii?Q?xHRQADlMOdb4BAcETzquFoONBxg2vQnPbIKH+simbtOvxAVCNpFhlR0ULEU7?=
 =?us-ascii?Q?DeWPVTUs/LQUWYEHoalVSd8eA8of18OBajhwTZFwga7Z8Kj30+yJ179Zvb3H?=
 =?us-ascii?Q?ZF30w5595WKm1qTVCvB1VzvDpJX8aWqw68gYCUJND4+0Zrvop2BJoWRlf1Po?=
 =?us-ascii?Q?lvE5iOe0xLrQKufpXTUp5zh+oS5srO2lrluDqoh5PqkIqyP8W3yum40Wc37a?=
 =?us-ascii?Q?i94O+hSJ9TjzaeB75qVgITn92kUF0+2K+E1uLMaIXCD4+lDJMyJ+ZUoFnczJ?=
 =?us-ascii?Q?32rilQI1JKE/enKyLWHmp9hQw7hBDRKymP1NNhc76utRWH0zc1i7CUCtmmkC?=
 =?us-ascii?Q?Q1yQFjIqC5ApdUDN0xoZhdwm8GuBhpoP0KfTj/rGNj2ex8q6geoPCvArYNJf?=
 =?us-ascii?Q?7p8VxPKpWwT1yW88j7Y75VqL6nMAGdaFU6pohX7U4Cjv2+023NmWaVmqTKsz?=
 =?us-ascii?Q?DzAtiId/+9yfMmTSmx9q8iz8TlW+zs2YOThV/chfTT47KHtjboNEKZVJLRnX?=
 =?us-ascii?Q?M9ptX1VnMqhdX3uT/pu1JbHJYUHbh+0T2cQtAr7OKa+6ho++4rdn5UU5Jsv8?=
 =?us-ascii?Q?Gg3AABuvKPao2fQ9knEPsLk=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d415754b-209a-4765-d2d0-08dda9527357
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 01:42:54.5171
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2Yai51A/S0zDABSj5t6tqFaBYotv64nWCUZ2oyHFi/CNa+E7J8D58q6xesfQBYhzXsgSyb6V5Tw4T/qd5NFgWs5a+YXWFHoRrx1g6meom7RU7I+iQuPmhZdGo5v5Us4p
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB15122

use "ASoC support for xxxx" menu

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/au1x/Kconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/au1x/Kconfig b/sound/soc/au1x/Kconfig
index 8a78809e87543..a7630897bc0b3 100644
--- a/sound/soc/au1x/Kconfig
+++ b/sound/soc/au1x/Kconfig
@@ -2,6 +2,8 @@
 ##
 ## Au1200/Au1550/Au1300 PSC + DBDMA
 ##
+menu "Au1x"
+
 config SND_SOC_AU1XPSC
 	tristate "SoC Audio for Au12xx/Au13xx/Au1550"
 	depends on MIPS_ALCHEMY
@@ -63,3 +65,5 @@ config SND_SOC_DB1200
 	  Select this option to enable audio (AC97 and I2S) on the
 	  Alchemy/AMD/RMI/NetLogic Db1200, Db1550 and Db1300 evaluation boards.
 	  If you need Db1300 touchscreen support, you definitely want to say Y.
+
+endmenu
-- 
2.43.0

