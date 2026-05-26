Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010044.outbound.protection.outlook.com [52.101.228.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E794E1AAE28
	for <linux-sound@vger.kernel.org>; Tue, 26 May 2026 02:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779761601; cv=fail; b=NV5rRB0lIiJnfF872g5MW6TrKycXLPOSAiOqiDsY32FQf9KXhj5tn4fEoI7F0Vnp+LFvtknrmq6sYqsGbTOKoGk+WAQ/6i22dcvtNbHZKCV4DhXXRuj+GFRrRsSFdewZhP/oCj2FrvqZzfhF8tE9OW/LIobrQmIhWe6gHW8usP4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779761601; c=relaxed/simple;
	bh=qnlgbA6DYUaK0Tde8urrv1e8qSBedlNNFLlXetdtO9Q=;
	h=Message-ID:To:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=hMOO4cPEbM3Lq+zizwcND1bVRCEP7b6lhcUOKh7fguh27SSNY9LsI787EMauq3HRqldiA23TM9R4xBJtbo+OGW16Npi1TJw++yUnJDgb3l3VyZ+OjkKBXrZTwEe8aIVf6CsIXjvAEFgq8HlPm2NZmr6uaTYkMF81BNWFQg2FrDc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=YV+5TBo8; arc=fail smtp.client-ip=52.101.228.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="YV+5TBo8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QjdlgLrPpfkN0sQJ1FASR2+N6AW3OMHCgkKUpssJE4w7sEXHnXU4soejhOMZYOyfL4eLG3U4GOZHiQpG9oEQrWhk0ngZfoY5/IzUHdWHxKvNryuLzq4W6vaAlBnOICjcE15i8HpUNXSzF2PcGC1RTPUKI4RocbVN0tqWNZDzbuwIUN66ruVmjayb+qvuNPt1AZKICAwBerGoRxNmN3kCOCx1YwpJVphOcOUJNC2kRHr9NvMlZF2Yf8ijXyhbyTYckDZWx3trx96Gd6edCGsczfPFQqYygv24KVbHrepWs8g7ahqAFGBxB5PkFzRwpGnV4Hwo3/Deh8Hg1JHyhp3C5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Inu4ixnmnZFynHR33jPrJCOLwxShtGApXJVPqIrFWMU=;
 b=ftjWKzgNmiJJrsLSWtTHYU5S6rl7oAlxpt1UlRh73WiSYKR7LXOhgFJivsVQ1fTcy/qWc7ij28rk8O/OqLLwuCyOJWHNYGCTiTlt0BwsmaRpox0spB+5aOgchy14Tps2CtNwUSBMZWvf3QrbkH1LquxdYODufMRjO/FV8j5Sf3iR31wx93cXLUMeVkv2lShnkc/Na/1suK167KHkxTjSttp4J4VYXQ4u7/RnBeSGjWKcZFhfexUOqtHJUEt4oP6B4GYXrsA37cEzlTdVx79Vyl/FxRY/6pRAPF+FcBfOiL+B6LYP8d6OwBnzZlcx7tvl9ByOxNZpV/ECYmwyMl6LIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Inu4ixnmnZFynHR33jPrJCOLwxShtGApXJVPqIrFWMU=;
 b=YV+5TBo8HdMNdQsY9CQV2sGfGZODZNKCf0F3aENBl66+oXCTkuL2a3Xbz1J2uMOd0Lh+Oh7aDpAHrJ0aVo8NTrmVNfun0DA5tPTzN0ePuroFlTZN6qjL5Wg0i+dHXjqraoyB+O8GlPl0Y7RrnZWVgzLsi3j3UHCrdKjapxbKeF8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYRPR01MB16271.jpnprd01.prod.outlook.com (2603:1096:405:2ed::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Tue, 26 May
 2026 02:13:17 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0048.019; Tue, 26 May 2026
 02:13:17 +0000
Message-ID: <874ijuj4v7.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH 23/83] ASoC: codecs: alc56*: use .auto_selectable_formats
In-Reply-To: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
References: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 26 May 2026 02:12:49 +0000
X-ClientProxiedBy: DS7P220CA0008.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:8:1ca::15) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYRPR01MB16271:EE_
X-MS-Office365-Filtering-Correlation-Id: f7a7c581-1d1c-476d-98d9-08debacc5987
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|7416014|366016|921020|38350700014|56012099003|18002099003|22082099003|11063799006|41080700001;
X-Microsoft-Antispam-Message-Info:
	uQZQLirmgFm0Sn5T1J3SfFhLb2eH2mlpayJcYXr9GDrLbclyal53bOPNcDGK5M8gd2Lum56Flky/WsG3qxUzVHesm7Hj1JGSolL/jAczYdWozFN2k62x/jYi6yKCGfzIqbFGCOs874Pc56UG4PIaZ5PCo2pBNvQb0L5faw1WgPlMt5ErVPzo8c8O/x9Xsdk7tAvyFYOoG1/hxJKCbXCWUZ/l4vZb5p8Per241WogNYVP21XCgfISO3YgRvh3sEq1tvhnOTVtcuaVvegraM2HHYr73JCZoqAoRkWYXRq1KNUvsorPpHFPgoswnZ+uqHpr+qqXqP0xGdLNXTt00xAY+SS1GqmHdN30HyN7kx4ha6ZoZsLYeWELF7VnXIx01C/UMxKeSvbSo1ALp5x9vhHRp3IHcc4v6lH/N2Asji1itI2uQR1m5YG0DqhUrcT8CqN20iZzc55XyUYFAWGWVB+EbcJ24Dy+jVyzzV/qjblESQBgDMfH8thNGXh2T+4ZNQj08gTxzQEC/DqNZoz4n785ofvqnk5hjNjUjeqd9e+smjEj4YeGiErXxbRUt/gnOfPlDAnILdpo8NWE3LvnKBvhaJF2rgpgC4chqd8YRa4bMDCQ0t9SRa6R+CmokLhnTIcdFvUvCTLSlSX77QkTfLGmEPmy9o8CD4F+9Ykf1GgLF/Nvf6fHlu/ggGasQGJd65AudpxD3sAH4MmLORv4s3+5akzcaLeFRI8d30LGB1rsWcqZITYcQGUH0M6W9bfyrPWba795EvsH5d2fuYSjFFSR0U234fN3qB7f40lQa1d013I=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(7416014)(366016)(921020)(38350700014)(56012099003)(18002099003)(22082099003)(11063799006)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?etSiSq9MZsQ1ipWWbG9xc8kxYMYW99ja2gHoriy6QrQSukNbUyNoQVPv9er/?=
 =?us-ascii?Q?3tZS2umEDc7Nm8L8um/QJ0NEoLqKZ23cg/l90sqki6LYwoQ6EKspGLrko9bp?=
 =?us-ascii?Q?RyKmZ1gtl8SaIXcIgUsOjxZPn/B+V2NA2yvG7fKsrm2UFS0k8pF4e0NtPyVS?=
 =?us-ascii?Q?nXG5OZC6ynC4tfylW3dRGNxfaDuv2lTg8XVmCseiz2gvYHYSsu5hcpkJAGMi?=
 =?us-ascii?Q?77O9Zy3tXCE9uPn2oH5m3iwjOpJ2cq1U5nmpJu5rInrYeqvphzDIqhPpRKv5?=
 =?us-ascii?Q?E74DjOL3qUkhbROK4iaUKVBaq+IJE5j9A6WTo+yKiLjZnnjqH0VTitSvG2je?=
 =?us-ascii?Q?x+uQcE3DmVpANMtGQKuvZAorYe8Crmo/xOhuzdIGS26MxFoaRgV1c6HKkzlG?=
 =?us-ascii?Q?P6miQk4C+txUwKaokDw7ZUTukhRw7vhVBS7AVCjJtUK6IJJIgpy53n4lQvrI?=
 =?us-ascii?Q?3JWRy21zBxA5BsFGjaxeO+PFuIKABxbBQ/kfOV602g74d++XkjMxkKRJhBC1?=
 =?us-ascii?Q?U7lnSNLnf25xrdvdf8i6IbNycF2db7MEYtiHa9UQajNgeMfsED95+K8MlgtN?=
 =?us-ascii?Q?p57SRNNlJ5aBmVltBcntwteVyHbYgsPV+YaQ4MRdpTP1wnPddZZe2+dm9tlR?=
 =?us-ascii?Q?xnRM7TyqRY+cImN6bcSec7pvpKnmHtPze6o0vuh7e7U71fN7GCu0EaMy37BF?=
 =?us-ascii?Q?SBwcSjFPQYnwl0K/S0R+2CA81ZMQn6+Lc4Qto89zZ8Hsm7UhfrZTIdYNuIXu?=
 =?us-ascii?Q?B26hjN0E8iSa5lMES/Qb054NSpNras5ahfMIndkARxdDmiMyhYHj6g8LbI0a?=
 =?us-ascii?Q?YcN8cFLsOTAMH/w+pT6kpFXMFbxHa5MT5Jatu1maAAOhSzWZivj+Tx1P+Men?=
 =?us-ascii?Q?PsgRysNG/62PJLUYFHNfxIVfRnLIYOdggtv8+SNR3FDb9H0uPFlxvZHuYrsF?=
 =?us-ascii?Q?WuMGu5GB6O5PkQ6RbotUrWJm/yFRlsMV456DWyQtCY+CbQlmMAbGN+wa8sgU?=
 =?us-ascii?Q?DLui+V/0NUa6mzonFcsgKfEpb8O6jEQWLBE52B6xAfxA3IuMh3WsZfz8qFFf?=
 =?us-ascii?Q?wizTnXVQIZIO8wJre44vapQskuvX2rIobl46uTSbNE71YBlMTGdtxgGqJHT1?=
 =?us-ascii?Q?VGxQ7Gen1dDFvIn2OjQ9ife78gf/6Y9XvzTAbBUa+ru4Uzs9iuS0zARaAElX?=
 =?us-ascii?Q?P/QazU8cBs4wfZNrRUnKUJqo28vYFUOuYwq3iv5rvIqen2mGS2tUB19hCoyX?=
 =?us-ascii?Q?t4YceUxMVqZSXVDMBVMrUB/9DqbXCRs7YqribBe4nrHzBSBkwGeSFYogZz6k?=
 =?us-ascii?Q?cJHg7XFmeI1Upr/REdrvD5mCDP2o9vF67suubIDrfSSzzmiauEtGtii00WOy?=
 =?us-ascii?Q?9qZLdvSlskFaHWuphMUBhhTgKNvko4yCIMBNxoo7/lBEO22C+UMtRcqxW80z?=
 =?us-ascii?Q?auUAeRGil5JCJ59QPgiXzUFAtHLX196sTM2XwD6MqnoMkEEb3Mf4ep59iO6o?=
 =?us-ascii?Q?8sr9YY0ZjuF7gGnrBT+auPZJONtrmMAdLN6PXR6eeFZ5+1wwjJM/TKawGx8D?=
 =?us-ascii?Q?m20GkeqxhK4wpbFcvM7ydweFlpz0d4rocoQPCXm9kCKNF6GoIEh1PEaRIB1b?=
 =?us-ascii?Q?sjkL2zh+kgYDvS3n0h5axZ5rxoSjQuDhCYcZvy++fGtDWdG8Z2tWQA61cgSK?=
 =?us-ascii?Q?z8edaJsx6UHsoatuzGRLPzPpqGiYnnnz04HNaQREoMojDorETeQq42hcLVXe?=
 =?us-ascii?Q?mtPmmA8OuDxfoI+iS0RwGVn3HaB7OKEzV2qk+fb0IwvuBHBVbj+S?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7a7c581-1d1c-476d-98d9-08debacc5987
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 02:13:17.2860
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oyTmbKW090WqV+37BtqLurCYqjt5fVxcPhhOgJB2XSlC/svhyv8o+vtYXTSqIIpXIIKnCYTkX/VhoX6K0JjPXRKu/wTVs/jVUqFEPGKA3ZkBLGa4oIUTlwmnlXrVvMSo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB16271

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/alc5623.c | 11 +++++++++++
 sound/soc/codecs/alc5632.c | 13 +++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/sound/soc/codecs/alc5623.c b/sound/soc/codecs/alc5623.c
index f5a666c493615..96bb1d5927729 100644
--- a/sound/soc/codecs/alc5623.c
+++ b/sound/soc/codecs/alc5623.c
@@ -822,12 +822,23 @@ static int alc5623_set_bias_level(struct snd_soc_component *component,
 			| SNDRV_PCM_FMTBIT_S24_LE \
 			| SNDRV_PCM_FMTBIT_S32_LE)
 
+static const u64 alc5623_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF;
+
 static const struct snd_soc_dai_ops alc5623_dai_ops = {
 		.hw_params = alc5623_pcm_hw_params,
 		.mute_stream = alc5623_mute,
 		.set_fmt = alc5623_set_dai_fmt,
 		.set_sysclk = alc5623_set_dai_sysclk,
 		.set_pll = alc5623_set_dai_pll,
+		.auto_selectable_formats = &alc5623_selectable_formats,
+		.num_auto_selectable_formats = 1,
 		.no_capture_mute = 1,
 };
 
diff --git a/sound/soc/codecs/alc5632.c b/sound/soc/codecs/alc5632.c
index 2fd3dd7ef8b34..a5e95f3fc2474 100644
--- a/sound/soc/codecs/alc5632.c
+++ b/sound/soc/codecs/alc5632.c
@@ -1003,12 +1003,25 @@ static int alc5632_set_bias_level(struct snd_soc_component *component,
 			| SNDRV_PCM_FMTBIT_S24_LE \
 			| SNDRV_PCM_FMTBIT_S32_LE)
 
+
+static const u64 alc5632_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops alc5632_dai_ops = {
 		.hw_params = alc5632_pcm_hw_params,
 		.mute_stream = alc5632_mute,
 		.set_fmt = alc5632_set_dai_fmt,
 		.set_sysclk = alc5632_set_dai_sysclk,
 		.set_pll = alc5632_set_dai_pll,
+		.auto_selectable_formats = &alc5632_selectable_formats,
+		.num_auto_selectable_formats = 1,
 		.no_capture_mute = 1,
 };
 
-- 
2.43.0

