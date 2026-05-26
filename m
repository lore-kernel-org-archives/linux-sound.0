Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010028.outbound.protection.outlook.com [52.101.229.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AB692F7F0D
	for <linux-sound@vger.kernel.org>; Tue, 26 May 2026 02:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779762121; cv=fail; b=Vfc/J1ilo+Q2dUJRe++aeKliYlryD6g1Hd0YXZa+MC6qbdsU0aBIwrrwiPssHDl2MG9DLrpmtdbAK79DZiHGAJbM9dxds4/0l4U5zLEf6WmBsaTAezvv095Fc/iTel/NRPEi7jeM8NFHWykNAl4u8AfUaLvBxj3nEFn5l6HlO8M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779762121; c=relaxed/simple;
	bh=yjgCwYrv5VdX737wX7JXOQfeSsO39cn3Ed3PRqe+Pxw=;
	h=Message-ID:To:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=ldNNTvkXrByU+/VvDPyfoBHK9wKM3h+Z4JPGtZZkjpRHDnnG/eLySdADdtuHjOt3JRFzWNgSBpGnsfKTUIW8QDsdfLBWeY6rNvI73Es8dXCUh34uhC+qulGn9ploAkaRWXud70Y/N6qHFzRuNyETCsYPVqEbjpXSvP0lsndh3qM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=QR4Te3Jn; arc=fail smtp.client-ip=52.101.229.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="QR4Te3Jn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nVnVLeEm7TeJMZoTaylAZvIb4FSwQlUSnWzn8Km8AKZXAlgHRUhmgAY9WbFLv0E+sVR8H/dkb2FbcStz5jbBZdOSGvOZTP6c3m0wTNOycRvu42FeVtcMd+HjUHPgF3rnFanNrMsS1HFfJ9Ln8gVaE+HWvP3tbqFakAUHp1j12/UAWiZPDo4sGj0wLN0/9w9Fn9WWEwXY1hTYFJC9IuheRmbdHOjFYgRNqO4Ecl9fhTJfCugPHGfhzpaopobyGFPUwJs8V4uzDNcMGjhPyyWVTSv46UDschZjPApslccYhQaiySQcLuPyItPMvAU7SXlkCT3jCKAKRMAusc2ayWyfag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HQnlK0fOQudJQsczJac9G/HPF63HrwakBiPxUiACebs=;
 b=GAs3VXe5wcTTtnK29v0Ec/X+DNFMK1OEO5IM2XVn0YArgdNNth7xtwSsissn1wi22so5RBtEF/mA00TmlpsO/nT0nAAQqY6v7Vi4iumk9KksVXLlN54U5+E/30nZcWKFtwi4lRMqiFNvlRU3TjYcGc3FyZmy0oEej+Wk26zK3Z1QJBqxCbqYnYt6Ve04MHhPe/5ZpKgrVDabLUzXzY2aKbz8X4/x6+OCPZBNwjU8U7Ih9CfIXPKZpickKMyRccixhVkn38V30ovgKnCD+jAXFdTujYsjdvs6KynnBvGsIBV5yo5JUXsFQAYgRCwf1yzsypxBqdIfEQsXmo2hvnckCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HQnlK0fOQudJQsczJac9G/HPF63HrwakBiPxUiACebs=;
 b=QR4Te3Jn4WlMY+VDOVzTUmaIiiWHD4ByiOkweMK4kMipLG288qKJVqUv+oCQumLmpDUiv5nMKe40+GTLNZROX3xvlOspk+RT+doGubgQ0I1PxCeHpeRZl5rp+lH8zcuJneysI3x4pmjsJLOIHJQ+7eca0jiqS45kCHjRCQNvC28=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TY3PR01MB10158.jpnprd01.prod.outlook.com (2603:1096:400:1d9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Tue, 26 May
 2026 02:21:56 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0048.019; Tue, 26 May 2026
 02:21:56 +0000
Message-ID: <87zf1mgbb0.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH 51/83] ASoC: codecs: ssm*: use .auto_selectable_formats
In-Reply-To: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
References: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 26 May 2026 02:21:55 +0000
X-ClientProxiedBy: TY4PR01CA0063.jpnprd01.prod.outlook.com
 (2603:1096:405:370::17) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TY3PR01MB10158:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c9ddbab-c801-40cc-98c0-08debacd8ee4
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|7416014|376014|22082099003|18002099003|56012099003|38350700014|921020|11063799006|41080700001;
X-Microsoft-Antispam-Message-Info:
	Aavgsh5nDKZIUuroMt5QOoneA5J0frBfVrlVba/YkZ2Jrm9I1kKaKNdqxcCIgzpXF5h5SU/n5agpY7/hCez1wVgCymmdeL+xjf5R2Tal5Hj7VuxJBbjTjoPco0jiOVr8H0FNxEPGH9iHkThhzQeVbmvdtQFYN1biw3p7kp8zlFOquk/Pwp74bQDrzcCyjPRQAmSL/ugmRXWX9IiRBnU0upWPXQZvxLB6t1lYwrAWRLuELp1GhanwlcvYM8Geqm20lBZJ1523JrUosP7BAVuu9kugZgBmsoNQiU5bNGLjC1ZizA+QJy2O5ze006jMyAJYx+CzEq4rBG41DCSqsbbHsBEDIRfxkXiGhwvRG4x+qAkHRPGDaeWo99x8/rXRcmqgQyuyt8d9kzS1RFqO7D/ClrwMDm4lr+LC6PJO2wO9IgbuJLhZPKyoxQ1UiaWt+jROV1JGqbFePqky1v3Vx4YykKlJAj0uWEJxn+Sz6O79SRNwRoAAYuRhsr9ZQiQPF0yl/21g/+gr1W/CbwCyd7stb7hngzrr0B2Li7ZZykkKOZpAVladROLbxa1vEGO80AGhrzSqVxNhQfyzI3YY2LrNw02/lKT3kf4l7+Rc5Lytz+iJq7z1cPdhUbsZukt+mJecyiujxdbNtw6iBougB9/NkQFpbcyTAEGmN0JpdyZj2o4JSkg6bjT75sC7XKPuUwQrn1+G6j8YT5Aos1h29OHwqaAxqAQzm7iwccrSXc+BC0Ggs3S6e+KeTueBuOVlPryEkS4EfH44vSnPw4IBdvV4f+fMXleWlY7L7Jaft1zNvsk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(376014)(22082099003)(18002099003)(56012099003)(38350700014)(921020)(11063799006)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?p6BIks3wQMXcC9QakW2BSN1Vu7w+BwD7fHeSnvDC2ycT1dUhpDDVVAejB9Ul?=
 =?us-ascii?Q?B3QNTbHaR8v6mz9WLoXzQN3dOyQeU5+WMoafCKXVZAuMn2+zXtB7h555MzSD?=
 =?us-ascii?Q?0r4jucV7z9nT0C7g4pRu6fFTh+Znj9RzydCiRmJnTw/oDkDHLtpbcIEsYGmh?=
 =?us-ascii?Q?k1GcgP9XYXbCpfIgdZ4lgupPfS9n5EIRphkhmpVGBq1bBGKzfvyUPmGBtI7t?=
 =?us-ascii?Q?eeTPtm7N9RG7UKlmrXCIHHyTnpYOXLS9liV/QywNUb/dQes6mk/X1iVeJWW8?=
 =?us-ascii?Q?GBV65VYC92XmDn6jl3Joj5h7EC0KzICpYXqW1XOxIVW0376tqcAGUmeXW1GJ?=
 =?us-ascii?Q?6ppsFhHLvSGAZZvu1cQSS5S2xkGAtrWD985HdAhW35UPExzpDn0B9/lgWl2l?=
 =?us-ascii?Q?w9wsshtGgceyuzXPqR2vVH/g8d0AqiNH2EVRGY1xdVmx6tG+C1VO8/ozYSUf?=
 =?us-ascii?Q?Udg6ADJXgcWDtx6YSaPseECS958SK+HkA5z4do4jaB7mRqxIyxrEnV5WslMm?=
 =?us-ascii?Q?jPYXzY+FVVYTikqABDC7MH6E5Nmb67YIIRCfzw0/QKXmVpENlniPN1zF3qhD?=
 =?us-ascii?Q?vHkwNImI5RJthtQ0js7FOI7HOTad4YoW0chWfw5hfw9d1ICyUth4TtOi2Q9t?=
 =?us-ascii?Q?bfmrgEm9qrv2U9Y9/nkXlEh/8orbAhFYvftqgAg1/bhc/mIp872sbKQxyaC2?=
 =?us-ascii?Q?+++4xoJdSOQxJa9OG7GHEcB4LH0qeufJB/SAuV3AT3W8GNm8/g5ib1yQ3dNt?=
 =?us-ascii?Q?q/6eMdo4XjCfs7UZQMQ0/Lq6oRyWZ+U1IFxT/v0trO4zsjxf/GueyOisz6HN?=
 =?us-ascii?Q?M/JAKd8o0Bytpj7/FYVOrBimux/q/41uB1BBTDpNQM3CZjp348hbeXk75faN?=
 =?us-ascii?Q?hIkrz3eUGyfwQGCz3J8LJYRG59tmb8XTkOyVUIlxzsCCv4ZHEwhtlLxZ2T69?=
 =?us-ascii?Q?tgrqLV7fZA7qRxvYzXpt9Ht1Gja/FEc+FOb+Mmavp2qA0PKfbSUrvq8VomZP?=
 =?us-ascii?Q?U57iiwAvnG5fvIeSU7h3MBOEEEqAKLQeoE0rw/P2eNT+4mBzqaiKxF7G26z+?=
 =?us-ascii?Q?iWFY72/FPw0Wi78XfcIiJhRzAdyE3PBuRVriCor1q4OmQKl6LeUb0wVQ2cDA?=
 =?us-ascii?Q?SOp3LPpeJVubrEvH9VJI/gS/yfEu7qEtIDxOa+TjHSEYEJGrdF2LB4SOIgsJ?=
 =?us-ascii?Q?SH22B2OPJlhEu+ox07GZ5tiO+JI1RcDaTYMY7HeCVVOVL67oHKNnfwdcQJdN?=
 =?us-ascii?Q?oqC3xkd1AvZyUxnXtLcOmRQ7p682f6ZarGPXdnO70bYVrNbPz+6WFq6/axoX?=
 =?us-ascii?Q?NLQlHGwXlPScbtMUV/JwamfUiC8X2h0TcqSKDcUP3cYoqHfL6Z9QewzY09Qz?=
 =?us-ascii?Q?0zw5+yUR4X/7tNF+PBpPI7E51cj3hlDlST3HoqfEJa9YzbaatxwZl3lDxkAa?=
 =?us-ascii?Q?GGJ0fcYD5IcPNoXryLuap4VEU11PMWHFFgfCUSqFIqZd4Q4YLIA8bXGetuhN?=
 =?us-ascii?Q?ZJlUzK30Luu7/+npkg/GRp2i6NTUrxwlrXR3HulWOjEZ74PZCogd8U7Uzkg2?=
 =?us-ascii?Q?x8csgnTf4loPNFfI5snLzXRuLLRWoEc2/n8YVG4mtXZX12VFA+v7vldC7VSQ?=
 =?us-ascii?Q?zQhrPNaE7IvpAXLRFyVQfdeLL2zERkIFxJlnAIUFo20BvcEqFeyr29V9EbLb?=
 =?us-ascii?Q?EDoie/B+Qp7lTVL8btGyWvjyzHAOM3q2xsJLCDDHVyPrYwy9Wz/1HHOhZirH?=
 =?us-ascii?Q?L/4uGiYXFish3n805h/+P/o+IdmdX/yURKf7kwTkR1zlJT8Ii/f/?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c9ddbab-c801-40cc-98c0-08debacd8ee4
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 02:21:56.2933
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V4hV7heWJWs0dmqdmFvX01xMiqqP1LzBUwxH+/xkkld52NxB5iwvSM8/llse3qqQNigr7vN6C6LpuSRMnXy8oTwOGbGzrZhxBypgmFIcjFnlhjDT5fdzYkLzPL57SZ/d
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB10158

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/ssm2518.c | 13 +++++++++++++
 sound/soc/codecs/ssm2602.c | 13 +++++++++++++
 sound/soc/codecs/ssm3515.c | 10 ++++++++++
 sound/soc/codecs/ssm4567.c | 13 +++++++++++++
 4 files changed, 49 insertions(+)

diff --git a/sound/soc/codecs/ssm2518.c b/sound/soc/codecs/ssm2518.c
index 5192569ba6a89..32e81b31479d1 100644
--- a/sound/soc/codecs/ssm2518.c
+++ b/sound/soc/codecs/ssm2518.c
@@ -620,12 +620,25 @@ static int ssm2518_startup(struct snd_pcm_substream *substream,
 #define SSM2518_FORMATS (SNDRV_PCM_FMTBIT_S8 | SNDRV_PCM_FMTBIT_S16_LE | \
 			SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S32)
 
+static const u64 ssm2518_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops ssm2518_dai_ops = {
 	.startup = ssm2518_startup,
 	.hw_params	= ssm2518_hw_params,
 	.mute_stream	= ssm2518_mute,
 	.set_fmt	= ssm2518_set_dai_fmt,
 	.set_tdm_slot	= ssm2518_set_tdm_slot,
+	.auto_selectable_formats	= &ssm2518_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 	.no_capture_mute = 1,
 };
 
diff --git a/sound/soc/codecs/ssm2602.c b/sound/soc/codecs/ssm2602.c
index fccd2eacd7a6a..92df44f869155 100644
--- a/sound/soc/codecs/ssm2602.c
+++ b/sound/soc/codecs/ssm2602.c
@@ -523,12 +523,25 @@ static int ssm2602_set_bias_level(struct snd_soc_component *component,
 #define SSM2602_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE |\
 		SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S32_LE)
 
+static const u64 ssm2602_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops ssm2602_dai_ops = {
 	.startup	= ssm2602_startup,
 	.hw_params	= ssm2602_hw_params,
 	.mute_stream	= ssm2602_mute,
 	.set_sysclk	= ssm2602_set_dai_sysclk,
 	.set_fmt	= ssm2602_set_dai_fmt,
+	.auto_selectable_formats	= &ssm2602_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 	.no_capture_mute = 1,
 };
 
diff --git a/sound/soc/codecs/ssm3515.c b/sound/soc/codecs/ssm3515.c
index 8c6665677a175..f71509237fca4 100644
--- a/sound/soc/codecs/ssm3515.c
+++ b/sound/soc/codecs/ssm3515.c
@@ -356,12 +356,22 @@ static int ssm3515_hw_free(struct snd_pcm_substream *substream,
 	return 0;
 }
 
+static const u64 ssm3515_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops ssm3515_dai_ops = {
 	.mute_stream	= ssm3515_mute,
 	.hw_params	= ssm3515_hw_params,
 	.set_fmt	= ssm3515_set_fmt,
 	.set_tdm_slot	= ssm3515_set_tdm_slot,
 	.hw_free	= ssm3515_hw_free,
+	.auto_selectable_formats	= &ssm3515_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver ssm3515_dai_driver = {
diff --git a/sound/soc/codecs/ssm4567.c b/sound/soc/codecs/ssm4567.c
index 8415dd163edd6..181047b38d3df 100644
--- a/sound/soc/codecs/ssm4567.c
+++ b/sound/soc/codecs/ssm4567.c
@@ -389,11 +389,24 @@ static int ssm4567_set_bias_level(struct snd_soc_component *component,
 	return ret;
 }
 
+static const u64 ssm4567_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_PDM	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops ssm4567_dai_ops = {
 	.hw_params	= ssm4567_hw_params,
 	.mute_stream	= ssm4567_mute,
 	.set_fmt	= ssm4567_set_dai_fmt,
 	.set_tdm_slot	= ssm4567_set_tdm_slot,
+	.auto_selectable_formats	= &ssm4567_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 	.no_capture_mute = 1,
 };
 
-- 
2.43.0

