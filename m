Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010063.outbound.protection.outlook.com [52.101.229.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D4C42EC0A2
	for <linux-sound@vger.kernel.org>; Tue, 26 May 2026 02:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779762234; cv=fail; b=fdVADJMiEDVsb7kPT5dA9uqBUukKAsWmycpYtmZ7BPu4bazQDTuRv2xQffFgll1iJzD7/G8HqofTmsDx0kQ6Z3g/vvxyzgM5XNfBKlCNTX0Ijzcr8SFj0JV9q8Awq2/emX2VXZs4vapoqS4o6u0mub0yNXE73ypdd+AoQSwwLEM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779762234; c=relaxed/simple;
	bh=8P0Vgj6P0lt1mzXfQ9L9cOwhX/4KKEQhP+0XVikU7Rs=;
	h=Message-ID:To:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=k6E1u+LrrEtHxHIeqCwkvpITNgLixGTfzSz6qrZP6jaUymFwwiEP75Xrl8bFQhZ1E+rw69CXXRGfIyYuOHbI4zD0XPA7RlEiJEQMAp8tmcuHyqOrTSXnbxSfTX1BPUURiVZ/ktCyeuyw/at1f+hOah6F8BVaQZRkA1kBglqLVDM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=TUSJlCxr; arc=fail smtp.client-ip=52.101.229.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="TUSJlCxr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kUkBEi0p0aRiWoCTGbl/K+aCivQdb4IX8WdMGiJVhWy32/snQwDUERXpZYKXNCxRHxg/6iBOajbMItQZ9jbB83e1UBClW45BKNs7J00ETA/GL3CzmE96D9FAW793HFpTXLRHUMvHqgotmto8UxRfrGLj/95HhR1Pz/zF/kn2CHjXOVPZHIX7XzkTpbyCgMvdg2p1gwo5do4kz3Z9TeGP8WTFR9yeWQ27xsD029PizzCaZX5LsqDKetPJe5fLnaUHTUUXTaQWqNk44rOhZxS4p12JfXK4Yl/5Qvact31qmZsTC9zEWCGGS4KWmv214j9UlnizZ2wkFeg5B/mjk0xjdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BxnHj2no/tuRzV+7iZDAWhgpFFH8R7vYQ6FndBex7L8=;
 b=AQg5eS9UQS0v81Dmz+aiaKtRMIkjWAV+iM0j95ULj/9ogWHvA7/fwHsdKlHubCcBZ+mp8611DwuX++GLwyHcodLUDdhPabZ4hkSN/LlzNjKDNdf8y5OoZ/g/U81n/he4w5djER9s4/56pd3PG0LtXmqYjnx0KI9wK34lD0LvCXQtP3660GbxUYf+qk9uSKTun3BOdDf1NYkNvG5V/TFjNDcufWEQjggYhUG4hfB65fl9CteSm2xrOpwuhq19oycXF1HMIErJMMityg1r4ol2fl+5TxGZsWxqJdB9HFkPNE4pfefNDYutvDL/U7oD+/KLRLfTBxbae8admydk8VPmSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BxnHj2no/tuRzV+7iZDAWhgpFFH8R7vYQ6FndBex7L8=;
 b=TUSJlCxr1EqrvlXJPy9Gy8bm/E3cCCKaK4Pn25lxQNYP47rIDPlM2xcK0oIoZe3YfWvyj6aC7dnnEEb7IDrrihitpbcKFNBhX+0Cv5dayBxa098Rr4ER0ZJ9jsC3IsGe5/nO7g4MdCMIYCoL6qF6HCQKtH1GnzyEhQyBBRFHzWA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OS9PR01MB13148.jpnprd01.prod.outlook.com (2603:1096:604:30f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Tue, 26 May
 2026 02:23:50 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0048.019; Tue, 26 May 2026
 02:23:49 +0000
Message-ID: <87ldd6gb7w.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH 61/83] ASoC: dwc: use .auto_selectable_formats
In-Reply-To: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
References: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 26 May 2026 02:23:48 +0000
X-ClientProxiedBy: TYCP286CA0234.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c7::6) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OS9PR01MB13148:EE_
X-MS-Office365-Filtering-Correlation-Id: d3bbbde9-fc99-4f72-2b9a-08debacdd280
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|52116014|366016|921020|38350700014|6133799003|11063799006|22082099003|18002099003|56012099003|41080700001;
X-Microsoft-Antispam-Message-Info:
	oepgMrZzAxnUqkFcTfUu0biyZ+u5/koFKIDHo+upP3cKrTFnNZnBxx/nWC0qyJJZpn9JMMtcBI1iI9EY4qrYcG4ernR3pXFn60VDnAsORnGBJ25tG+jt2SlcBDX7bzAj7ayG3WKMwP27VuLsJ4yobntBpVUUQJrW7QNlyxmk8bQiGLh1Brmu5eFsIdDzz2v1OFGa3vXEAJ0mUEh7y0La3iFGce19YqzM70e7JIqyOWz3mvqFpufAympo/drOIuSgrlK7PMr7vzfxuXlFj/0pK8u89FF1ZqDOcP/plQAdfMgY2jvm+MetsuAQXK7p6pTfQanlpD3eZbGD80Aeus5fk5WaBGBdWH4ShCPQEcgu0BDn6iksgAQuVQ3Gt8mjUjIH1uHaN/fKlnF/AEcubvlphUvcwFkfUovwlZ7suZsrovkg9C8Yhy1FJvM1byBNY4pQ40Hw/cc+5SEIZaieQ6gm9xsIqMv/FVqB3pl3P4CAVOz814iWvxweClhlnhKKLTCzWvO9jAyjCAN2YDilIgzlbBnv3yFybgx9jQR3OkhFuxI5u4umn8nOMH4fLRMRxuYAeitHb3zgZHkSaohgYGkA22rCSEQff+pRPCdEWY8CXkUDdHY2smO4Fezu1me0kfZUXsiiTrXrr+sQ/7VGgpsSVNWVzAIUBJZiSHbH56aMfncJmiuiDm0tv82tU5tsY9aYgYgzC4mmcoaBAfX7WBDoahKJVxmBnP2hMC8+ykCbvB6/GzrpBPz9TAVcvI2VT70Nn5CeZPwYGyvFzIQQi0op4xLyFYKKRf3DkdINNUaj9bw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(52116014)(366016)(921020)(38350700014)(6133799003)(11063799006)(22082099003)(18002099003)(56012099003)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?aR2knHD1epu40NkTquWlUkQV/DqtbwUnSlKTDJY/QygOk9MHpPmGhifCQN8L?=
 =?us-ascii?Q?+UUfP+UwNWCTn9iRrSCq3ObZePMGrV8M6Tw/1tkQC+H2dMFkQDJXA2QNh5UX?=
 =?us-ascii?Q?VS3O8rDP1XBwo7K6Lv8CNlFCyDkmbaC4kM3yDasd7p2xrmLYd/K6XEQh/ZYk?=
 =?us-ascii?Q?MklP9FcTKNFxks4mqclddf6FpaLF6J1u161Fr8tkq4qsjXNavj78dFY+iZb8?=
 =?us-ascii?Q?+UlZh25sz/G+livXGDaKm+8gel4NdDtjCdZLcFB5WnqwFpzx4cCWO0ymeb6N?=
 =?us-ascii?Q?23c7Eo3sZsxrzCM6kEbHLAySslbW3/jQCBY12IP8mRHSxib+SgK3z4B8EbJt?=
 =?us-ascii?Q?naHbvDD/HI5nLJcgHTKmcb+gm/28TERTq8OB/aTH26LIHApgc0KzyVc6kdGo?=
 =?us-ascii?Q?vJO7MbE8X6wqJ/+6NfRn1LaNWRISgmLjgC02fowNqowt0EzEnq1zsUMXpGLc?=
 =?us-ascii?Q?cOoUGTaWdVWyaMWAaHiSQr3XjdSOls2dc7lsNozHbdtK55gFZYKHqvbUuokQ?=
 =?us-ascii?Q?I81t379Jz4CprXLnKm8yVWoCBO9zn/KdMjmhrjBILIveENx8sQn0KQPrBcG6?=
 =?us-ascii?Q?zppHydVdH4KTyNp/dLhPssmky51fe6S5uc3HvvrEdCn3v4XbX3DkXM4NhqdR?=
 =?us-ascii?Q?Hfumb/jrtTlHk0w9ZZSfD/p8YgEkorsM1u0sdhDj5hdECMLiYf5INmGTt9xc?=
 =?us-ascii?Q?QlbviWuXC/VXWwihvqXvAkSPQykbjKq3rgIquGd8xLa0XEC/xnksjFr7KLAK?=
 =?us-ascii?Q?fTSkpA4gEuWOTlGdYovhfc6sYAcQJlXATO4emtq0yvO7Y5VqNoOm310GE6jv?=
 =?us-ascii?Q?FpJCAjrvGtM1jQop2JFuWt1/dCOJoZVeoWEf0y6JG5dHPhYSU5rTkFYub0d7?=
 =?us-ascii?Q?Ix+C4apaYC3BKiiIJov4eEcqX2pm/vY4XUiBi7so4EN2o6gG+GFMJJ8wsrVz?=
 =?us-ascii?Q?z6K/bRBcQ9f9fL1EefLACy+zeNyw20tTMDNUdiqefpe22pNl/vUu3mFNXSZw?=
 =?us-ascii?Q?KbhOJWHFML6wlbrShqPoj96qVtdFmZ8NM7kLGOjlLNb+U9w/H+2s0mGCSk0H?=
 =?us-ascii?Q?oUN9cMXFoA+LkcydYCCKsk4WHvKLZUOf5k3KMVy0RYcb7ybN1ye3s2QzKtPx?=
 =?us-ascii?Q?mkcqyrJ2OoC4hpdZtAhDxwALojb48Lv4srUoF08BesMykLPQ8qL5adrZBcY1?=
 =?us-ascii?Q?D5hC2BNiVUKR1D5wIva/2G2kMYZxSX60VowsihTp8uwuWUZRcZ7h1lpmckYs?=
 =?us-ascii?Q?0JXS750pfW2U8LNG2GxiyW1GZwUx0X0Bg/PuUgOiRzxz9nPop7tEX/OJdaLw?=
 =?us-ascii?Q?rlxTUJpVOFyTEpKHqGYCSnx0YXchny+KOW1YPj4+Rt5LvHHPRH+ZOBoa2Say?=
 =?us-ascii?Q?murVaPFn/nEW35GglpBVvZ2BScQ6gXs6aanVKfktMs50C5GwgEbtcoNmVumr?=
 =?us-ascii?Q?SLU1xkX7ReZhv2YBgQnrJ1zAP+f1lvafzsU85y8daA1vBh/0L/t3hEowO/2z?=
 =?us-ascii?Q?Sc3c199r4iWzttA2eJo4rMqczIEaMDK2DsNQjtaRAETPi2ZUDOPf2LTTKU2M?=
 =?us-ascii?Q?39TM6sM71/Mb+6IadHgJGC/WTZhIJtrIQHivDyvJ9KdshUdVINyIrzvvPyZk?=
 =?us-ascii?Q?3QVy1TjMNGuCYbQ8BnBAerxkbOwacAan/kxWiSI+IztXkTfaoT+icbEehmgL?=
 =?us-ascii?Q?VUFBGIfra0qPj4bPbKqz6LNH8Sw4nx7GYk+vBmIxj5uVt/H6Xv+En/TI/04x?=
 =?us-ascii?Q?k0MGSuRnc/ofxKhVJaFv7z8lsmXPXdtY1jX0GEhGwYSzK/IG7HJ3?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3bbbde9-fc99-4f72-2b9a-08debacdd280
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 02:23:49.7671
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +8AcT6pxcSPGyglG7pZy+Hd4n0g/IqbhrUgm/eR4JVfsWWDC2krZKC6kv02PphalP48SMJthaWraD1Vu/DVQmZjhd0EHJRqA9vcgtg9AykFdi6iitmsN16VWkQMueq0l
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB13148

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/dwc/dwc-i2s.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/sound/soc/dwc/dwc-i2s.c b/sound/soc/dwc/dwc-i2s.c
index 74dfd39fd6047..be5d06b720c8d 100644
--- a/sound/soc/dwc/dwc-i2s.c
+++ b/sound/soc/dwc/dwc-i2s.c
@@ -464,6 +464,13 @@ static int dw_i2s_dai_probe(struct snd_soc_dai *dai)
 	return 0;
 }
 
+static const u64 dw_i2s_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B;
+
 static const struct snd_soc_dai_ops dw_i2s_dai_ops = {
 	.probe		= dw_i2s_dai_probe,
 	.startup	= dw_i2s_startup,
@@ -472,6 +479,8 @@ static const struct snd_soc_dai_ops dw_i2s_dai_ops = {
 	.trigger	= dw_i2s_trigger,
 	.set_fmt	= dw_i2s_set_fmt,
 	.set_tdm_slot	= dw_i2s_set_tdm_slot,
+	.auto_selectable_formats	= &dw_i2s_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static int dw_i2s_runtime_suspend(struct device *dev)
-- 
2.43.0

