Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010012.outbound.protection.outlook.com [52.101.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C3B9279DC8
	for <linux-sound@vger.kernel.org>; Tue, 26 May 2026 02:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779762170; cv=fail; b=JDEk3BE80Cccm7Q+cJvhPNEwmN/l3aT3grlAgDUjaFdXrAeE0/NHf/gq2aoWiU+kVWRCotLB0jTb91BB5DPvvirXxGf9dEotU8WbY9ySnLskeZivnMOnMk2kjtIszdDXkjnlFTvGjuvXJkUs8crgt0pEnmgUjEgMQWhel9Z0P3M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779762170; c=relaxed/simple;
	bh=P/TUqSrTpSZwYnyUbmqwoiC9//38/Wj6D/CtKPfeRyg=;
	h=Message-ID:To:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=l772ijYvnoUG+osXheCDsxMJlY98ssWPocpXJq0dim1r3r+RKxZ1hC0o+nXFVhJ2aBmt6KPlYqdHBAytQEC3xUHvlzBK1PGkmzXDRfw6XJN4o34QWxazV2DPOGtQ/pV1uTjQhluCOIFb4AcvMZfuQgFEvgCeG3FcE5QNaGtCr78=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=cNyJLwMv; arc=fail smtp.client-ip=52.101.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="cNyJLwMv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fuDBFFOmzowIXvivEX0ON3BG8bAuiuBpYBhPEjDsGhYngNHk7pbhIDidKe4QIX0AZft/OCrBIPEyzt9Po9SOvqkH8PkNVrO55+ckaOXRBMSvKe7vxji4aZcePhsPVsTGUu5HKdgidTitDd7SfZ390FvtCgfmqUW7hY1zS2UmS0k9MoKVsXdKfFN2T2cmoAMO/p14fCFp3PgkX+STvQW5lEDximuNupk6mLXGlT41ajulqrHGFDTO5u3om7oeWzCVm4xLQEoEylhRc5phTFCyO/86J62pnn+zEqh5T1f1y1JUN2NxXdsDiBF7dsHa060mfwa8gSApdvXD00Yw27fS9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cuMRAxrk75NGiCEeOabk6RHuMk7O6cdyn74+LvvWJto=;
 b=nAoFtNqbpwxbBM0kQrvIU4VRQ5OTXJl5OjHV2xorP0ZE1PxNHapaLHnefFMZIwwXptmaS1I9cMpZy3nsWM7EXp7X+0Sv8+30bS8nG4klG2A9FVaqtIvGiCJ+v6tPD75mx6Cqw7xgmQiRIvcU4LvGG9hpOts1tsyaYmRhJaI3sQ2jzfSQ3Y5rXtf0dAf0mI+Iski7Yr2iq60fIaLqIlUxL5pRv3nMlKW+pJWHKaceQnDjSLjATPtF8erG3udAOnKUpIuDqWIFR/MQfR24+mqHwke1ZQwfPmbTBbo2tRrgJx+ehDoStiUXnG6z4yijKvrimKCErTapATHa3ewKy4Lyhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cuMRAxrk75NGiCEeOabk6RHuMk7O6cdyn74+LvvWJto=;
 b=cNyJLwMvdoEpeerxr/cvxHmURNAwNl7IrbOnQVH4+U5fQYbDzuySzpbznTToT8a+rrPeGvjOZX6aIRwOcJV1a9L0lpciteo27HpAlw8VlWXXDPVSBgmRpAmF/1qKk+yNeuJcqcm+40Ac8dxRZDHtEa87yWidIlQQwJXO+1dfhVk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OS9PR01MB13148.jpnprd01.prod.outlook.com (2603:1096:604:30f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Tue, 26 May
 2026 02:22:45 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0048.019; Tue, 26 May 2026
 02:22:45 +0000
Message-ID: <87pl2igb9o.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH 58/83] ASoC: codecs: uda13*: use .auto_selectable_formats
In-Reply-To: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
References: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 26 May 2026 02:22:44 +0000
X-ClientProxiedBy: TY6P286CA0033.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:3b7::17) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OS9PR01MB13148:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ea6c994-e617-4e8f-48b0-08debacdac40
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|52116014|366016|921020|38350700014|6133799003|11063799006|22082099003|18002099003|56012099003|41080700001;
X-Microsoft-Antispam-Message-Info:
	l7pbPRPb4BvKTW9KSZUuRlma62tSUhliR19uDLDlu+JGXCAiiCISIoYq7yNvNq//HRK5slmXEt93PXD0rDQDsqm5M6VSdloG2IgAFhR8cjJBLT+qbVZhhcV3NYav661VpfuI7onhYgKER5I/ZHj/3pbYYOZcbq16ykxbcyEX3rTm6UzmJIhmkH2gOO7JX7cli/kd++E4aZzPWZx8rzZy5plkAORNmApLqESh/Pkhdk76YgniyyqyMs9UXhPVETiHCrKZZW12RPlRHbOXp7xoBNFKAL52PPTQ/W3gA8S/2ju7+g62x22tyMODPxchyy84sBXIU4GyvIt1v55CdvwkoI40/gVsLcm2hFU58f1vkJjGkjGHGexJV0XGiimUoglPUPIhieQgjB4bXfQzqSxiAwiD+jQOubA3pYsD358eidXc8iynk5l6j325f3zp2vY6fxJtMJIo45u43HbYd/VmHXxJFzSPUmuhBSllajO1BWEsc0DHCtv4Ea5YQCb/3JYe5mb021PMURzqJZbiECwuCmtMWo1VCZQQ+thg41qR9XyesT21kcbM9h2YWpuv2oeXl3XkQzIgtzo/N5+yDfgj4n8Ax/9fB9iL7WtPFBPEES+axUlgE8LFSIlyuSFYaJ4LtkKl+jX/f7fexQVpF8EWFNbBeIXNPIvUT+R2lk3yS8GpIqAy3IkuhxwgOk1xu2q7iVoScuMO0IxDJ6zAI4w7oll6hQlQk9/sr07IkFbgNhrxT4wZd0HRTWCqTz1B+QmZhsrhYihBgSp/PHjX0QzakuMNOHw+EAO6umdNDi1Hv40=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(52116014)(366016)(921020)(38350700014)(6133799003)(11063799006)(22082099003)(18002099003)(56012099003)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4kDZgLXUdhgQHpZYdacmYmLSiJLMpxt7DKrYOeAT6zut91vU6tPpgANL7GX2?=
 =?us-ascii?Q?PGxBATXbsPurZ61m5BPUQZPWBkZR7zOruyvRaeJBvew3AaQ0yaC4W6YKgz1R?=
 =?us-ascii?Q?RdoGaVSE1+ff6P/vogRCwJHasZFghnXlMyIFfFLV+E8SaJQPUgt7/gGi6zUU?=
 =?us-ascii?Q?MLCIRrw5H0P2TZpRldJrReFjDj5YH5pZ30d+SLNnGgFpKW3lYKlNzjtm6twj?=
 =?us-ascii?Q?oYJWyMktWqPt8KSSEtxidmU3wHecYZbCGKvkO0zZeb7cLqV2g5Lj63/XHjPT?=
 =?us-ascii?Q?grY2TuiLAEYRZpAhzZ9JWLoBbb/rdX709NqczTjCNv8gCA4k+ttjMzG91DM1?=
 =?us-ascii?Q?traaY5IqBABRiAvh95NtyPp5llkl6p9oO1ueMLunqrmsXLk1B6KUKkAl0TI1?=
 =?us-ascii?Q?WGYwqJA20GQ+YrHzgX6Mh7B4QKvlHFyKdXm7Ul2RGOve2P5MP/IfZ9ezwRkL?=
 =?us-ascii?Q?ga1gkdT/SAtItvyby1WJQjIPxfg9J3XI9LD5BZs8VRwFzs+HQjDVxFWgSO/D?=
 =?us-ascii?Q?vAm+MI4cov3vw47lF97IGaiqD1Bri6TzZmlgA+Y59kd2sDgiHH+mn5IlQsBg?=
 =?us-ascii?Q?lnK2gTksjuzaHeKd/VqThiSEFl94kXG1As2oVndw6KxUhRDvUO5WrQi3d+7o?=
 =?us-ascii?Q?Tw+cp7TMI2RYJiT5Pc/Ipf2DcnLjfsVk+1YtWy7H6LO+L6Nx1VsI7nvbNKkm?=
 =?us-ascii?Q?IzLaCJ53FiKaSZ/NS9N2O9uhIYjEV7u+jeg6INm8w0DN8qoNOyXZpx3OFWzK?=
 =?us-ascii?Q?NZZs0M97EeZbkSPoOcaJns1TcQLi0eXeFKtcMeDKU0ZmiMHy7ObbXydR2CJN?=
 =?us-ascii?Q?QmEwwuAkaJAxFgKW0xGgMJLaI6DwuLVjbihewMpdjD/wmaH/FxeXJtoaKP1p?=
 =?us-ascii?Q?YQeotpsvcGIxdrNFGTVyg288+G/gmTkg6ljR5X6qhMhYdiVy/PGYz9yr+5CT?=
 =?us-ascii?Q?KXlfbh5K8kNE1UY79C1EBtnh3ZlAXoGgho68ivC5nWCUIN59Z1b82lCs1X2c?=
 =?us-ascii?Q?7i7+34orjZaH35bTGHCt1iuV12j5yM0D+0Hoeq2YGiLKUH7jjfgUz9mxok6x?=
 =?us-ascii?Q?R4Li5X1cFsHkTXDLNVx+aOmCGRnAaC1vOhB1WEWJSdCFhuqlxapVih/6X2Qd?=
 =?us-ascii?Q?lq7tUMwk6aZrAKHkpPqVkae+PAZShOXhROh0FA3Ydi7/bQHo/bVFAIGdpGdc?=
 =?us-ascii?Q?wHsTyiywyutwBqY2BuMC7LxwyPoRUmHuBgFOwWe+7NQc+laZRbFrQqkbm9x+?=
 =?us-ascii?Q?wqqLB/vL+OwAwnpbG0VXLadHVQpQavxORlB2D8nCr6z2GdZXkLC34nw1DOEz?=
 =?us-ascii?Q?Jga05RSksHNSHQ2Okh9OQxPZV0XmGFGAphz1dEBm9kABJTpnmOTx4CZBaBjs?=
 =?us-ascii?Q?4HUNETFy6RVNMJs6CQc/oJMsJ7hegQt238qyw7fbRqxsxNsHRW+7AZFAFviW?=
 =?us-ascii?Q?2k63vqGFzeEBT4Fzfh/iCzKWKvp+/uFKaDD4r0MzhUVKDjxDZX0E7AtFT/cg?=
 =?us-ascii?Q?3Ci+ygIUK2bzIlwYy0TBdlvMXBv428gHXIJGMaDhnESnIlySTFvQAediXuz/?=
 =?us-ascii?Q?ThUTlW0lkbrPQmGeQNDUAGYAOgEyu+DEbgVxfdyD6pcNAM2Nra8bGTlgtY+l?=
 =?us-ascii?Q?71y124UnYskMAmAmffE1FJhQpmxV6USXL5BtcFz1XFfBGRw7fc6OOqt0Q8ga?=
 =?us-ascii?Q?flMc5Z0Ea2keoWY6c7uQYYAbsdpdM9iGWSwMbgfj+ESMS7yZYGoFrKlsQ5pU?=
 =?us-ascii?Q?pXIrhbYMULt/vNEej5u2FwDXjvPU8YAoPXQPcYAA0+ajGF1APbap?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ea6c994-e617-4e8f-48b0-08debacdac40
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 02:22:45.6289
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fz34ur3+WBEIDDd6RrKHZ0YAOAfOQUhsM6befi+A0iUr9zgj2if608b0mGW0Ffk4QnmepUW20+vIsa2DUdLyEnwvWVrqj79FeheyAkTbmFj8HZDKAz/P3PX5EjD5RRkN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB13148

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/uda1334.c |  6 ++++++
 sound/soc/codecs/uda1342.c |  7 +++++++
 sound/soc/codecs/uda1380.c | 11 +++++++++++
 3 files changed, 24 insertions(+)

diff --git a/sound/soc/codecs/uda1334.c b/sound/soc/codecs/uda1334.c
index f799772ff747d..d7ec2fa342ae6 100644
--- a/sound/soc/codecs/uda1334.c
+++ b/sound/soc/codecs/uda1334.c
@@ -194,12 +194,18 @@ static int uda1334_mute_stream(struct snd_soc_dai *dai, int mute, int stream)
 
 #define UDA1334_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S24_LE)
 
+static const u64 uda1334_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF;
+
 static const struct snd_soc_dai_ops uda1334_dai_ops = {
 	.startup	= uda1334_startup,
 	.shutdown	= uda1334_shutdown,
 	.set_sysclk	= uda1334_set_dai_sysclk,
 	.set_fmt	= uda1334_set_fmt,
 	.mute_stream	= uda1334_mute_stream,
+	.auto_selectable_formats	= &uda1334_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver uda1334_dai = {
diff --git a/sound/soc/codecs/uda1342.c b/sound/soc/codecs/uda1342.c
index 12f5757f4210d..8b56081f59e18 100644
--- a/sound/soc/codecs/uda1342.c
+++ b/sound/soc/codecs/uda1342.c
@@ -223,6 +223,11 @@ static const struct snd_soc_dapm_route uda1342_dapm_routes[] = {
 	{ "VOUTR", NULL, "DAC" },
 };
 
+static const u64 uda1342_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J;
+
 static const struct snd_soc_dai_ops uda1342_dai_ops = {
 	.startup	= uda1342_startup,
 	.shutdown	= uda1342_shutdown,
@@ -230,6 +235,8 @@ static const struct snd_soc_dai_ops uda1342_dai_ops = {
 	.mute_stream	= uda1342_mute,
 	.set_sysclk	= uda1342_set_dai_sysclk,
 	.set_fmt	= uda1342_set_dai_fmt,
+	.auto_selectable_formats	= &uda1342_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver uda1342_dai = {
diff --git a/sound/soc/codecs/uda1380.c b/sound/soc/codecs/uda1380.c
index 1dd09d10fc4ad..02adc534dfb06 100644
--- a/sound/soc/codecs/uda1380.c
+++ b/sound/soc/codecs/uda1380.c
@@ -653,11 +653,18 @@ static int uda1380_set_bias_level(struct snd_soc_component *component,
 		       SNDRV_PCM_RATE_16000 | SNDRV_PCM_RATE_22050 |\
 		       SNDRV_PCM_RATE_44100 | SNDRV_PCM_RATE_48000)
 
+static const u64 uda1380_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J;
+
 static const struct snd_soc_dai_ops uda1380_dai_ops = {
 	.hw_params	= uda1380_pcm_hw_params,
 	.shutdown	= uda1380_pcm_shutdown,
 	.trigger	= uda1380_trigger,
 	.set_fmt	= uda1380_set_dai_fmt_both,
+	.auto_selectable_formats	= &uda1380_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static const struct snd_soc_dai_ops uda1380_dai_ops_playback = {
@@ -665,6 +672,8 @@ static const struct snd_soc_dai_ops uda1380_dai_ops_playback = {
 	.shutdown	= uda1380_pcm_shutdown,
 	.trigger	= uda1380_trigger,
 	.set_fmt	= uda1380_set_dai_fmt_playback,
+	.auto_selectable_formats	= &uda1380_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static const struct snd_soc_dai_ops uda1380_dai_ops_capture = {
@@ -672,6 +681,8 @@ static const struct snd_soc_dai_ops uda1380_dai_ops_capture = {
 	.shutdown	= uda1380_pcm_shutdown,
 	.trigger	= uda1380_trigger,
 	.set_fmt	= uda1380_set_dai_fmt_capture,
+	.auto_selectable_formats	= &uda1380_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver uda1380_dai[] = {
-- 
2.43.0

