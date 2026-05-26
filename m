Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010009.outbound.protection.outlook.com [52.101.228.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 293782F8EA4
	for <linux-sound@vger.kernel.org>; Tue, 26 May 2026 02:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779762333; cv=fail; b=IXRHGl2QTbx91EkRMmLlseq8qwXKDLGmfEHFRp+ev2sW5tGdm3sy/cWGCyknl2GfCrosGkznBl9IcFINI3X2f2I+xJPtJk8zEq+yKEWwjejmBPxxuavPd1nn2tJ6ysyYpQ2pWpgh91V68+kGvWsNygEZgcExKkMv7oMnyOWNaJU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779762333; c=relaxed/simple;
	bh=TalQ71PiMhD7pG+VQWInPS0JGpch17/OvwUy1gmlkdQ=;
	h=Message-ID:To:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=TKqqOxO7jqgG8MBibF3JON5a8sVTa4z0mlUzMNBnfj/tVrWxGe8pcm3zRtw2dldpV8mtJljvuqWJsPfe/qJ0UEjZJ3d0S2Kta4uyc4I42pQZHW0iGN6lg7ea+HshUd4wbTPJoLeoS9Ao3pkvcisMLWcU/jtkE3GmXXpNGFi4i0g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=bv3THGTE; arc=fail smtp.client-ip=52.101.228.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="bv3THGTE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TWiyvALDijLU2HGU8H5+DI1iWWUfziKCkB7EUXUmoTnhsUfBMn/0SmTeGJM7l/s2vNUDV6PxrGm7LzkGy/0+NW06O+NoRygJMZE34YoKKWsjW3q44pQ2q+1REantxGbEzJd59Q7BK5eEeQMRacYLRh50Jev6j2VoJez0JBegGW/t+fZ0GsIQm0PwWwLoVMbmJlC9Gaxjy9AQV4supHFB8SKyHvVsQ9OHJV14xf2j48JjJxOzeVJQPSjI040JyT4xVQ3agouA0d7anX4mG99LeoVXw0l8Fej8S51nKS81Z9twIH/M4ruLi/u1DxxQ9HxWHqFpssaX4El/E9LZIDMhcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=umXlCw94HlbLPK58xofzpY3pQBt+PgdlmexaGV0beBw=;
 b=lj11rd0wtT/7G156gxrvqu53iUIraLcOwesy1/SrRh6zWJXM0Le7xGoBKYqm1HgP2XVfSYp7wjDJ67Kqv2dJl9k2P/JJYKw29BGTFYxsXVU5lEmFds6w3yG3rRP4eYd8tfWhI789oZyra0TgjSTfalMZ7/+5YslhtNH6Bfmsbx8AERCkDFKNxkfivubs786nkgdjUDxQRxY4GwsopN7Gu81Ndyr+hAvFfcpU0OHyjUVgkiwTBch0WJ72VqIF7zQqwInYYbuYdFvEMe3dnVYd2FRkxTf+Wwuv1Ec+Brdkm7L/VVoKoGZj9mEnGZhc9kCVPdkivC6iLNn1KdTmLHKNwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=umXlCw94HlbLPK58xofzpY3pQBt+PgdlmexaGV0beBw=;
 b=bv3THGTE7lKrZzKlnvekrIt3xWocuWC0pOEl7ahDK/qgczWxyFcNlfiC/kTYkQEQKp32f+elc1RkTm2gBRZ7CydPy/S4WYUjepQVBPRfcGLHvwys4Ip/DDROwsA8YwHJ1sJ4mOONWQQ/RO7NAlnpuDlLi5BtknttnAPtmyKXB74=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TY3PR01MB10158.jpnprd01.prod.outlook.com (2603:1096:400:1d9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Tue, 26 May
 2026 02:25:25 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0048.019; Tue, 26 May 2026
 02:25:25 +0000
Message-ID: <87eciygb58.wl-kuninori.morimoto.gx@renesas.com>
To: =?ISO-8859-2?Q?=22Alvin_=A9ipraga=22?= <alsi@bang-olufsen.dk>,
 "J.M.B. Downing" <jonathan.downing@nautel.com>, =?ISO-8859-2?Q?=22Martin_?=
 =?ISO-8859-2?Q?Povi=B9er=22?= <povik+lin@cutebit.org>,
 =?ISO-8859-1?Q?=22Nuno_S=E1=22?= <nuno.sa@analog.com>, =?ISO-8859-1?Q?=22?=
 =?ISO-8859-1?Q?Uwe_Kleine-K=F6nig_=28The_Capable_Hub=29=22?=
 <u.kleine-koenig@baylibre.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Arnaud Pouliquen
 <arnaud.pouliquen@foss.st.com>, Baojun Xu <baojun.xu@ti.com>, Bartosz
 Golaszewski <brgl@kernel.org>, Ben Bright <ben.bright@cirrus.com>, Benson
 Leung <bleung@chromium.org>, Biju Das <biju.das.jz@bp.renesas.com>, Binbin
 Zhou <zhoubinbin@loongson.cn>, Bram Vlerick
 <bram.vlerick@openpixelsystems.org>, Charles Keepax
 <ckeepax@opensource.cirrus.com>, Chen-Yu Tsai <wens@kernel.org>, Cheng-Yi
 Chiang <cychiang@chromium.org>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, Daniel Mack
 <daniel@zonque.org>, Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 David Rhodes <david.rhodes@cirrus.com>, Fabio Estevam <festevam@gmail.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>, Frank Li
 <Frank.Li@nxp.com>, Fred Treven <fred.treven@cirrus.com>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Guenter Roeck
 <groeck@chromium.org>, Guoqing Jiang <guoqing.jiang@canonical.com>, Haojian
 Zhuang <haojian.zhuang@gmail.com>, HariKrishna Sagala
 <hariconscious@gmail.com>, Heiko Stuebner <heiko@sntech.de>, Herve Codina
 <herve.codina@bootlin.com>, Hsieh Hung-En <hungen3108@gmail.com>, James
 Ogletree <jogletre@opensource.cirrus.com>, Jarkko Nikula
 <jarkko.nikula@bitmer.com>, Jaroslav Kysela <perex@perex.cz>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Jihed Chaibi <jihed.chaibi.dev@gmail.com>, Jonathan Hunter
 <jonathanh@nvidia.com>, Kevin Cernekee <cernekee@chromium.org>, Kevin
 Hilman <khilman@baylibre.com>, Kevin Lu <kevin-lu@ti.com>, Kirill
 Marinushkin <k.marinushkin@gmail.com>, Kiseok Jo
 <kiseok.jo@irondevice.com>, Krzysztof Kozlowski <krzk@kernel.org>, Kunihiko
 Hayashi <hayashi.kunihiko@socionext.com>, Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, Lars-Peter Clausen
 <lars@metafoo.de>, Liam Girdwood <lgirdwood@gmail.com>, Luca Ceresoli
 <luca.ceresoli@bootlin.com>, M R Swami Reddy <mr.swami.reddy@ti.com>, Mark
 Brown <broonie@kernel.org>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Masami Hiramatsu
 <mhiramat@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Max
 Filippov <jcmvbkbc@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Nicolas Ferre
 <nicolas.ferre@microchip.com>, Nicolas Frattaroli
 <frattaroli.nicolas@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, Oder
 Chiou <oder_chiou@realtek.com>, Olivier Moysan
 <olivier.moysan@foss.st.com>, Paul Cercueil <paul@crapouillou.net>, Peter
 Rosin <peda@lysator.liu.se>, Piotr Wojtaszczyk
 <piotr.wojtaszczyk@timesys.com>, Qianfeng Rong <rongqianfeng@vivo.com>, Ray
 Jui <rjui@broadcom.com>, Richard Fitzgerald <rf@opensource.cirrus.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>, Samuel Holland
 <samuel@sholland.org>, Sascha Hauer <s.hauer@pengutronix.de>, Scott Branden
 <sbranden@broadcom.com>, Sen Wang <sen@ti.com>, Sharique Mohammad
 <sharq0406@gmail.com>, Shenghao Ding <shenghao-ding@ti.com>, Shengjiu Wang
 <shengjiu.wang@gmail.com>, Steven Eckhoff
 <steven.eckhoff.opensource@gmail.com>, Support Opensource
 <support.opensource@diasemi.com>, Sylwester Nawrocki
 <s.nawrocki@samsung.com>, Takashi Iwai <tiwai@suse.com>, Thierry Reding
 <thierry.reding@kernel.org>, Tim Bird <tim.bird@sony.com>, Troy Mitchell
 <troy.mitchell@linux.spacemit.com>, Tzung-Bi Shih <tzungbi@kernel.org>,
 Venkata Prasad Potturu <venkataprasad.potturu@amd.com>, Vijendar Mukunda
 <Vijendar.Mukunda@amd.com>, Vishwas A Deshpande
 <vishwas.a.deshpande@ti.com>, Vladimir Zapolskiy <vz@mleia.com>, Xiubo Li
 <Xiubo.Lee@gmail.com>, Yixun Lan <dlan@kernel.org>, Zhang Yi
 <zhangyi@everest-semi.com>, linux-sound@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 66/83] ASoC: kirkwood: use .auto_selectable_formats
In-Reply-To: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
References: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 26 May 2026 02:25:24 +0000
X-ClientProxiedBy: TYCPR01CA0135.jpnprd01.prod.outlook.com
 (2603:1096:400:26d::15) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TY3PR01MB10158:EE_
X-MS-Office365-Filtering-Correlation-Id: f20a9bd8-5890-4a87-fccf-08debace0b8a
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|7416014|376014|22082099003|18002099003|56012099003|38350700014|921020|11063799006|6133799003|41080700001;
X-Microsoft-Antispam-Message-Info:
	+2BWnMCalpZWtQvpc1C+BU0pFfr+xUfUB9i7P7c+u+dAfcc54UT6OZMBtnc2Y2M9FZJULb7FADgiNR2hr/1uY9pOUbbM7ks98OX00V6t5rfvWZZMt4M7qNub2zSU7GIFA7EdYpjpPJl6IBxuySid0s/58IwqKhuU3fDfnPXT+4plhrLFwIj4rziB+2fMZoqo6737dIMvHAwj9GwxfKTtcAbqTlBY/FnqAOnYGaw3Xfp1az+H5vpdTwEOT5hNQGpx77wAyQlNUZIVnZ0BCmcX4MLixlyEbC2EtTKSDHdvEkltHriM/krgTDqZwK6cBo1NJpK4aUI4H+TfbtyCsjIOqtyqds2fRjNnat6WLyosd9gr4YBsExV+TURBDyQ43QFDImb46UyIgyfM4SMFIM0lLgK5mHvbJZKtr9JqMnkPxLb97i3ySE8YfNDXlnnttx7vs8ZFEOiNRBCUVe8yJtfILDs507RMrBKtvakQFQDGBTqL1yFGKs61JT+lSG6dok6jMZRIRT54oMqCjE50z4uI0UhdAXA9E05qbfe8z4I3f/95pDs6/iFYSfFupOpk3AZmXBD1XLsUF6PQm7rs0hFDhqFTM7QVQ23Dgg9taeYOV7lv+deTru6IJ1QcYVvrb5m78XxgMjcTF/e4aGamL8utMvgXv1IW2WP+11bUPi1fC+tWl/RfSZDflsmkW2ZU5zRBiU5DRZ0h6CZ2qCaEsg7C+rkeXPAsPDe7m7FWBoYs54GPFvIbUZxck6LoYhCYOJClGqjx/Qpt3Gncb8qQliXk3sYMF0GfMxM59AiSHKnqrZY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(376014)(22082099003)(18002099003)(56012099003)(38350700014)(921020)(11063799006)(6133799003)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wJpvr8/hs7w6eBl2alBL6/ciNlY/qHPORBoaXuEeY+AY2yqrFjXsJAZB1GAg?=
 =?us-ascii?Q?wnn0NF/LmwfDHUqz2FyWo93GvSuLMQd2JW3CRjhJIECfqva1HSupHomDN+ZI?=
 =?us-ascii?Q?BdWcMuKyhIOe/ofkx0c3KgJiFDxyviYLRY0itBkzov3qN94H58e3MiOmDJrT?=
 =?us-ascii?Q?X4RWl1IdRl5GsEz9oTFcuiSIcY/iBm+bkzwCKU00+EARTFPtcD5tiKPZkZSy?=
 =?us-ascii?Q?KjsWOMaxlnKHH4/VEkEm52CklJTVphpz86c/C87BsUgb5Y9x3UEnaXoQUpgg?=
 =?us-ascii?Q?T087SovAZOnsjF4hPLUJxpYIkLw8LgvIRjvG75RmKuYUm1bKrMgYNLmOfPiM?=
 =?us-ascii?Q?S6ok7kSzF3k3VH1MevZlZANrmNfoOap5VrAPJ43s3GHZ/opMKLP6oHtesdxn?=
 =?us-ascii?Q?wPvQwBdu1dEo8fuf4B2EZJu8wJKXNSSWFWgcFjUfQPn90twjIjB+jFtQohaI?=
 =?us-ascii?Q?6bJkCLuIsiOIKP4YZtuqBtC1Rj3MGPXuNQXV4CrRbqcF7RDLGChsQVE/rbV4?=
 =?us-ascii?Q?DdZNO35g9DQ4/5N/yPIEbf/sZrNebarJqDFwtlvx/LsFR88MFKBlwd6wKWYA?=
 =?us-ascii?Q?dhNbflkgiH52f/vmDsdlHgoQ6bnno69vnzYFc4FQIieT/HuNw9u29diCtFSy?=
 =?us-ascii?Q?LYUQrQe+QQXXJQ76jR1bIy32nj1Fs7AWK8Yb+FezlSXVoM14j/HOJo7G83gD?=
 =?us-ascii?Q?W3nFgDUNgHcakr+LyeVXwO9aYhX9qDdJat7dW7Or/RmF1BqjJjM9aDDTlxsd?=
 =?us-ascii?Q?czZv2IAWUBwBvG+Kooj7z3yvfFxQWaDt9yyahy8N9HZ/jSw7S+Cdfyk2jTLs?=
 =?us-ascii?Q?+MQSwHxvkyeF0sAGhQuQuFI/CQ+kPIuE94Gnbviyel68h7JWB3DyA3AwR8X+?=
 =?us-ascii?Q?l89rmq8J0gBDYj9OrIzylXLHJnaCgTI+DKa5j6r0R+n3MsDYLoeaMOyTCcUz?=
 =?us-ascii?Q?z4udxdg8ZQNSsqH4e+1B2cQ+AgfTFihHKM/4DTYWRgscosH0/DiQT2tX7sxA?=
 =?us-ascii?Q?Vo4nvgzyTX6E7c/c6a8GFAJGW22NF7vKQS+azxnA1GNzhmiEd+ywdxO36aQm?=
 =?us-ascii?Q?ZQW5cXJP13aKJuiakagSeCkdV4nJuTz+wwkpedjwaFFIYjugbQq8SRtMupXP?=
 =?us-ascii?Q?TH6fmEiAub7PdcpBZeqbnqTm/9vNK0u4eXICUsrNiWtooDwoE0uuH45KdAtr?=
 =?us-ascii?Q?GwAk9g65M0a5Tuw4wPtGicTnf0/ZWq3V/UnjbeuUvF954d2t+zY1WrGoJeZ2?=
 =?us-ascii?Q?vgeuhp3Ud0PZsMtZawHqwZa/EVHhIMAbpTdvU7vFPLTTsLhWdTZwHJ5Vn4Vu?=
 =?us-ascii?Q?b5Xh5MHISZeYlSJpvxZ4vQYLd9gU9clBwLRXfLRVDtv6wt2kZAw93+jXDYB0?=
 =?us-ascii?Q?86PrjhhmJxvZuT7lXbt2fcWXghax1hUGDv51tvy4Cyx28QbBG9Cx2nIbc4j2?=
 =?us-ascii?Q?AcRvKtoNUEVwKpaWoc6OWIJleS4jTaS+6e5/AOZxHRGKqDWGgf20zSiZgWan?=
 =?us-ascii?Q?lB9WPLS0WobKDuHJglzPfjN8YDW7hp0OCVORQZihORqei0BL4PS8qo8JDINm?=
 =?us-ascii?Q?1ML4mi1Cgn02pUR3zbB+5mpoRL28pvooUoObL6XhkDKCYEeTW4H8CHkAWB0/?=
 =?us-ascii?Q?mstwWhFYveC1JaFhjWr4AzHSf7AjQBpTWvnN3Z2PHELse+JW8jFs6DqCbnPi?=
 =?us-ascii?Q?wyAOe/rHj84MNM+PlN2K7G+lhZ3YJV7GH5ewgfAlYDcUocNOTI/QGPDPDJkb?=
 =?us-ascii?Q?Q3ni1VkXqx1uu2VtvCxE42tICY9jjaQeid+qZ7RhKOPxY3itrnOh?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f20a9bd8-5890-4a87-fccf-08debace0b8a
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 02:25:25.4791
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UFD3kowkIj1wzJueENndVvfvaEZWtL+AqlmGN4JAUWhu+g9TWefD4Jt+oa6wv2kcL8hkXH6mWiMeQERoxPKBRQEZvCa8ZLNeHoiyqFFlU4nQQqNMZOHZmwU8cqoH21NP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB10158

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/kirkwood/kirkwood-i2s.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/kirkwood/kirkwood-i2s.c b/sound/soc/kirkwood/kirkwood-i2s.c
index 99bd066c7309d..739a819d84945 100644
--- a/sound/soc/kirkwood/kirkwood-i2s.c
+++ b/sound/soc/kirkwood/kirkwood-i2s.c
@@ -544,11 +544,18 @@ static int kirkwood_i2s_init(struct kirkwood_dma_data *priv)
 
 }
 
+static const u64 kirkwood_i2s_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J;
+
 static const struct snd_soc_dai_ops kirkwood_i2s_dai_ops = {
 	.startup	= kirkwood_i2s_startup,
 	.trigger	= kirkwood_i2s_trigger,
 	.hw_params      = kirkwood_i2s_hw_params,
 	.set_fmt        = kirkwood_i2s_set_fmt,
+	.auto_selectable_formats	= &kirkwood_i2s_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver kirkwood_i2s_dai[2] = {
-- 
2.43.0

