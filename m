Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010008.outbound.protection.outlook.com [52.101.229.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38E70305696
	for <linux-sound@vger.kernel.org>; Tue, 26 May 2026 02:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779762383; cv=fail; b=aEi+r6y3UiHZnx9ecV/TjxX+DeZhNX8XMZ4pFJGfrnWKJb01kMQu4UudZfBVrg1iM6mY4G1uEb9kgRttP0jjaKkmpZIb2gr0Ye2Pi8HHbFFZ4Z+L+U7Ee3G/bBlt7SUZZl5XzlXKsD7IrFG+3MWC8Z72EF26grPEjS5G3Y8QsUw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779762383; c=relaxed/simple;
	bh=/heIuWA6QrLb3eIJoYB6z8k+zvUGcy9hOi1B7BzVFK0=;
	h=Message-ID:To:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=kVpXDjG01yY72dyj3eBRdTedS5Sp6J+RbL/NBEOAUhi+yASeUBDLPZlWizhnttmzGQzgkXHPwpKg9qIhwFBcIiWVJTtAj0yF/cLWq56hm27iUwjGRVfn9fbqgGz6qQv2GRJpGqoq3jqfKcs5hnJzzUkbsNKyXWR1pR08SbkWO2E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=PGROpVq2; arc=fail smtp.client-ip=52.101.229.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="PGROpVq2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jWZ95QO+ODFP/io4jgQL6uxTsELMYLihvbeOBxf1JuIPXcacCpZGXkhsnUkKMlreNUYw4QaxjJ3hiV3qDQ10k2BvlDFrdrcJy0XmcuiZxJQ/PAPQM9A42N58M69pss7LGlcu78orh09jJSS4+heYwkis8QWf8PLfLNE9GQCSD9bYJsv00JFUsH7Ra0TYVfO7HtTKUvEQ+yIzd5Kx+39QngfnHFyPKBAdFpqzld7p5XvtB19HJSdTRwlLJWfotQ54tROmunAClO+pyqiDJ+DPGt+pW4+y01mSIWipnEdtl03G7/LMytQ1dtI3+6a5tyV2yVxro2tySInTrqoq9Zrudw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vcrQBzWq1+HOZKov7IKX38C/vgbNXmjNH0UQGGkc5lo=;
 b=DQ3XjxqVVonlrMcQiHgkc0oENOtzNCo6OlDnqm6tjB6DHnRdaVpIQGCvy6mQHEYV6lySC8HK8hcMQJZ9a4gd5LNDxw/OZnVYmhkLdoA5ORyWxI+RNWUyNUKHPP7cMBlmKl8Xk+79VTwVpeTHfQvp4ELazbAvspghxFpuW5Aut+vUOo3kyp2aOZ+3YumXoqE7vmve49vhejBBC2ofMxXdP0GenmShSOnx/Rd1jtla5RQ/g3IoaiT9pWnJ2gd0xmhD4I2aMNb8YrTzp/VUC8AW9IVsosGfQN0wxlAP11aTHAwwsy9Vs3E7KmNE8PiX18eMOBvocR//NqBfXbRRXUFR2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vcrQBzWq1+HOZKov7IKX38C/vgbNXmjNH0UQGGkc5lo=;
 b=PGROpVq2NaxCiLXu/3u/wgvUQD2PXdyi2+WOyYAZ9tjajdYEGQGZph7nJaEgbyS8PMADBOu9Rtc9aoLgHLie6OslHICSQvsKDPP2VmHh7i6faU0R9bYZa2D7Hon0KlQPg7a+bQ0WTlyLMU+ocUPK7XP37F7oFwWslZHeKOCBJ6I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYRPR01MB13144.jpnprd01.prod.outlook.com (2603:1096:405:119::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Tue, 26 May
 2026 02:26:17 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0048.019; Tue, 26 May 2026
 02:26:17 +0000
Message-ID: <878q96gb4j.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH 70/83] ASoC: mxs: use .auto_selectable_formats
In-Reply-To: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
References: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 26 May 2026 02:25:52 +0000
X-ClientProxiedBy: PN5P287CA0043.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:25f::15) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYRPR01MB13144:EE_
X-MS-Office365-Filtering-Correlation-Id: 280053c8-66dc-41fa-aab1-08debace2a84
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|1800799024|366016|376014|921020|38350700014|18002099003|56012099003|22082099003|6133799003|11063799006|41080700001;
X-Microsoft-Antispam-Message-Info:
	ASdlVr7iQTd/vV3a1UquHJ4m6bjFHyrXQiNNStLpTHWtQ+GJ6gWjd+34OKiWUb6n3NB1xjWNgtGEipb5bBQULqshSY8JBw7IW7G4llLeVEq1D871D05fCL6kQ/KjdsRHFiZAwr2T5eOZYkqrZ1My3X/nhgS0tEerf06AepuIooVeZAlwWbIoO0gmgDVXZQbjsnM6EmMJPQOXJiKVg08OCYu4iAMh1AbRe7r1ltrnI70TVW6HmPsmVZxtGV71TTBKe19gv7N6UUXZzKd9DmLBnEJVahvca4rqi70JCFGrAZZgW3VFiyPQHliaHD9rUQDeX5S+J1HlvDCc6pPWbEZRYz2W+92MkXL03H7b7Dck87F4Ha7M+d+O4aHPxDnxKVpyW6mCMWJ7p5IE1q319U6sQeWkUIAu1LvWYA5MwwPByN1rsDORb0uY58WoQ5QZaZAnsCU0KV5kZszZjBazzdpmJW5LtThDKRki8leRBaqHC1nTfLuE5RZLDPvY+J7bXLG9ct3+HHuVIymk+L7xexKE0fh84U9RGU9DlCJgFMlz5Fz7v0B+0NKbV9tqL/0G5uUuUDCTBnezrT6Z6eTaT/QKyugMdy5cmKwAb2quuTAW2af3TtEgQ8Leju+ScSDZvaolZUxN3v4zTSJCvqP70WZcULh0es48w4k2l3y+CX9KS9zvhKD2m1agQMiEx+70TND1m8zrDH8aw7x9633gGioZS2+3a3nBzcOPu1WKA0hQKv+vdMiagO1dV0WQH4N67QlTS+M++mgoKeUXI/PxIgsZAlJkLU6w7Ah84doo/6lkr9I=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(1800799024)(366016)(376014)(921020)(38350700014)(18002099003)(56012099003)(22082099003)(6133799003)(11063799006)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?csMlULlhs4MpuAKR+03uZET+tmLQKgLD8rO04wZGEypz6HQWa6FJNt82IOYE?=
 =?us-ascii?Q?uBVFK7L4UhJhgwiUwBEPcr7c9AWWpo4l6YsaYtwjunFPcXfN/7igEzIfSTTo?=
 =?us-ascii?Q?1m1o6lKM7X256VcZ1A9GSkC/pkvtMSWufz67u5S/Bqt+oo4HNUhQpgJTY1IC?=
 =?us-ascii?Q?/7H3UV5mx4BGGd41EZgubASsa0e4IUDYYBRsjrtgftaLlsLkrwK9DO5ltMNf?=
 =?us-ascii?Q?6FR0gfJ3wg7/+m9+jmVMcGcG1PRcFWom+rnJU1p5NGGvHFn7PHZhSMXnp1vi?=
 =?us-ascii?Q?GSYxiWfPi3CkuYnaYiqtqbVJtqtZJge+bvNQdgUPpd1fzG257n4rGRWj1VQ4?=
 =?us-ascii?Q?2bR3Y0njrU8V/hYKJ0qedoMPpE28CHMdH8+9z6F4WMWTuZs5wgJjJL2Hor8U?=
 =?us-ascii?Q?a5hvL6FP3mSfI6WVsu+XmM9OHZukYyiIwAO55BI2UHku+6NYe9cis3MMFTOq?=
 =?us-ascii?Q?WTDPdLynUlVI+BqpQmioYBM188VfDVd9Eg7l8SCBlg71qo9OepueNjFh9bIg?=
 =?us-ascii?Q?p1B6IZUV8EYMr6suWgHPh1MZcMkYBQvNewHOqzhI9XYuWTTX67SB1UkHwAks?=
 =?us-ascii?Q?rb6zChP2yFV4bJeQKurv6edahSFkhh+jcKNvXH5mHdi95Xc5b97MAv7V8X5m?=
 =?us-ascii?Q?f20MeBIadHoj1IRG8j86FrOYMGSgTeSZ0r/4nd6KAfvhVQT+RTwz4g1hkCED?=
 =?us-ascii?Q?57oUrgzgh4mXriILhbyP0c+FeotWauA3sHFscvCDOX5Bh4I8UIHzCFH3urBu?=
 =?us-ascii?Q?B3+E2tfSM9bHYoz88gJhDkq52o3KYJAJ/ULR0A5c65kmPmC981XVa1UVnkyT?=
 =?us-ascii?Q?4hFU3q7OWdtSWiv6E+ESxfIfp3d9gWG2XEvOWpggXf2Wf4UjIhyXiWg//1AD?=
 =?us-ascii?Q?M6Go6uj/+HAVgpulS5pWUPKOaa6FpuTHjTTzlzZcbnixTFM5+MniuL/XIVL8?=
 =?us-ascii?Q?No2T6/6/kyGgwY4M6LdX1M4/GAS+eIpoUswiHXBXMrejw4UqGVNRYLbpyRUw?=
 =?us-ascii?Q?ubpg3hBmCLf42biaTymGqtZzJtMY4Skc7fAYnAwUAuiWp6Cg3/smycAiLBfB?=
 =?us-ascii?Q?E0HT0fV5DbEdY1fYElP9HqlLRXNlRAGtxdci4o60067IZTxE8VHXWLtOjwzE?=
 =?us-ascii?Q?NBxmFolcv+i+LfxBv6SwI7dNLDtz0/5NKeQDX1n2yp5NxQUq23T3/KZBrRVx?=
 =?us-ascii?Q?SvcsiuyvnBxEzznDM4T02I7UGnem2Un82gI3aBJR+mbQ8lZSayQyPxXHDblx?=
 =?us-ascii?Q?RO+Ll6pihRroHn0IPuTHobXf829o0JDuYLPybgp6P7uMuJlqqPweRlNp5EEP?=
 =?us-ascii?Q?vD82Fwa10D/LBycYY9nWLii9Fra/TsZ/ivg+J1uDyPxZGj9hX4yO0a7N01bq?=
 =?us-ascii?Q?iG3jEAst4kLdmwqc6BX+gCbIg6LDAljcvtCHpQeBv+k6qQuIAX7TlZSaqRpN?=
 =?us-ascii?Q?JicSjwDmguWx9ybJrPz6sBGu1k8Oo01AbW16O0qQRACTg3SVf8LtpxYP5wzL?=
 =?us-ascii?Q?DQRjE9MTLFamHWDdLZvMKyZAU5N3yv6qS4EXheTN4oxTmFVNNp4nwSHgi68/?=
 =?us-ascii?Q?vU0+R+jIIeLyDJq7FqOeDSA3eqKh+g/8k4oVNmWAidSeyqwyqBQNv3V5DWZ1?=
 =?us-ascii?Q?YnGAM2mbluF6BnGj5GlSdvlKFp4oZTMVeg/rQ1wwNrfD1JHdHqIqsxyZ5Hb8?=
 =?us-ascii?Q?D+KQYXHwoW7cZ9iTIZeC82LuKMrh0MQenTBoldRLLN97DaYg41JNcC4n//2D?=
 =?us-ascii?Q?ePypEmsxI34Gv5Dlh8XkvEEPiNHzXRy7CgRvp+HjroU1ReZqnhwg?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 280053c8-66dc-41fa-aab1-08debace2a84
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 02:26:17.3886
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1oJqN5rHSRIQXaq5He80Q6UIsBXJUpyvxcy0fUT4nCKvu3T2N/rco7kKKViZpRUKwMwVOhpTNiJOJDokuXnkA+E8TzxYRb1JMxlH3rxeEN0TsIEPM22TrXxnhrY2iDJg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB13144

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/mxs/mxs-saif.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/sound/soc/mxs/mxs-saif.c b/sound/soc/mxs/mxs-saif.c
index a01a680ad4d71..efa0581d0d506 100644
--- a/sound/soc/mxs/mxs-saif.c
+++ b/sound/soc/mxs/mxs-saif.c
@@ -691,6 +691,14 @@ static int mxs_saif_trigger(struct snd_pcm_substream *substream, int cmd,
 	(SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE | \
 	SNDRV_PCM_FMTBIT_S24_LE)
 
+static const u64 mxs_saif_dai_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops mxs_saif_dai_ops = {
 	.startup = mxs_saif_startup,
 	.shutdown = mxs_saif_shutdown,
@@ -699,6 +707,8 @@ static const struct snd_soc_dai_ops mxs_saif_dai_ops = {
 	.hw_params = mxs_saif_hw_params,
 	.set_sysclk = mxs_saif_set_dai_sysclk,
 	.set_fmt = mxs_saif_set_dai_fmt,
+	.auto_selectable_formats = &mxs_saif_dai_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static struct snd_soc_dai_driver mxs_saif_dai = {
-- 
2.43.0

