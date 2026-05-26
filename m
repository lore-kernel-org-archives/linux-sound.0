Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011014.outbound.protection.outlook.com [40.107.74.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DD222EC0A2
	for <linux-sound@vger.kernel.org>; Tue, 26 May 2026 02:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779761463; cv=fail; b=u1XBj6NXO27u6duvLKiPzixhs81TgTuaf7kmC8plql0a9Zh30UuXZ8PFGua7ZQpqPY8ECO3YsU/ngh1dTYInYgDN+q6tm0Bs5yXgBZOoDpmlwgxXkcd4zhVBf72wYqaXndGfkCLN5qS1GGb6CfDMWPdYlGOWoL0yOh1tTTW7/oQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779761463; c=relaxed/simple;
	bh=UJJN1AvkwcSOiZxhI0ANoxQC0TvczKCYAJLMsobhNMQ=;
	h=Message-ID:To:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=s/hlx83xzCWupHUMl4fC3w64knHsBbFA3IBrDJRGcDksRYEvwbqcyD4J/VDj1tkSHnStdVLJB3CvZAB8hyeSXveplOHUApxuOZfUzu52z69jgRT0tjTjwIMYkn2w4pvjNdtmzJfhhTSAHYA3YlOmvUu1lffHs48bvURXW0hiUkA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=m2u86Bik; arc=fail smtp.client-ip=40.107.74.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="m2u86Bik"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BS86VFg+CqCPmzZfcJ7XmAwc05RZlqrfN0cIcvcqj3cVqQOWIav0JANpJJRjqo39LaWREL70IG0KDu2HmJgP6TqurAxEYRcEg5wZ+pWxZGShtxtEGWQBYd4pXCZDf2e+OEneIFZJWXfLgDHzC7DEcT1/LBDgUgfDoyBm7kHaXwit35qI9baOEyJ3gelf5ss7egvhSwb2WEEVMPB1i7qQeRqM04oXZOBASJrbLsGbrzC6f46q104viWLclBqSlo3KElaJogjvGBjorxQOsEpxn4qR5hT0dPad4mQvYh84BdwFMrJUeU4GuR+XuH1aTzIlM9XiY3oRg9nyvmR5ammY6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dcwiXO1ShwkCQCi0J6r64eCA01mZk5zEtDOLBPOd6DQ=;
 b=jbOBpPuIRfQODOliluICKryGS//MdTL1N4+uglj8SW09lM+HEprbyH75WunskVqrNCuqVrBHe5dtebNVyKo771Af1oCzy7IPa8x8F18WJJHWIq9npLwGhued4QxuqMDr1hHbHPNU3D9FY5U/F8gYZSwVrpr35360NXWu+nPtXDbFZQ62LZ5gI/s2NDxhQ43cJSBQVCgyynNpgggu7wQipmdG1bqBx/IdWA2O3f+6CiJkXCPZn5g5HDBqmgAXk20GnY6wNpEaB9Kx5n+qkEXtFITrQZu2vOVS8KEPNeZxEAtYvTt3aOSusF5LckBJwBKypW8NOBo7JbkjXbsz1ET9Rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dcwiXO1ShwkCQCi0J6r64eCA01mZk5zEtDOLBPOd6DQ=;
 b=m2u86BikyG70E8bkAqiZ3s9CbD3Ifm3en6OzoD5Ka2YDe0MhEjC5p6eRFHB4UTZ/IjaKquzIP8UTD4QSxgaAN2+XT26RBAdJYpVFR1iiBLKUOsEXVteJfttyDsbLRWQ6NN7h4szUV4NqkB8XCvKPeCaY30t1d4qgn1CrklwBFC8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYRPR01MB16271.jpnprd01.prod.outlook.com (2603:1096:405:2ed::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Tue, 26 May
 2026 02:10:59 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0048.019; Tue, 26 May 2026
 02:10:59 +0000
Message-ID: <877boqj4y6.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH 21/83] ASoC: codecs: ak4*: use .auto_selectable_formats
In-Reply-To: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
References: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 26 May 2026 02:10:57 +0000
X-ClientProxiedBy: TY4P286CA0025.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:2b0::7) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYRPR01MB16271:EE_
X-MS-Office365-Filtering-Correlation-Id: cbf179ea-b84a-4a04-3b2c-08debacc0742
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|7416014|366016|921020|38350700014|56012099003|18002099003|22082099003|3023799007|11063799006|41080700001;
X-Microsoft-Antispam-Message-Info:
	NHzysNb5Mp0lduVUODQeslonuVXNDMNKFkH90xQo7QYjCsZnfNENb09lb1J1/il/xc8GvOVNKtAdjM/1hV4niaKyVKct8EBCW1Iw7jZwbln17PR/9GLKjNvrJ1zFQC0NBbOyyVimmo3ApaiaT8aV7nbASypUDJ8X2kwCTf/02+IlHr7YD+Wx9JAOD0tV6/0X+w8NVfxpZ1ZWcJQLrEPYWjJRJuLbHG8RwW2DTKxraNmIHcEHpp5SIpGgUS4/+0n4LxjLXAAvb4Y0x49MCStErLF4C2O7aI9/ITorv0pNEPAoUTcYF7V4PuKuygpuQ2wuZsqx11YPUmASr+uZnZFR4t6tP5RWK7CAxoX7RbXk0JCG0p445APcOq63UxOUZEVHuAHSot9Qi8WV240HhRm42qvYz6EU11JGnZ0NuRghUzC0Tls8A1SG/6VI+LgmMk0madg9Q+TZ1QqonHP/ErXr7NpClZgdhGFYJgvaNoDCsUZCZKSeuo9/9D7G3krMRnrNCA7K7jKaVV/8PPV/hUtgyqq8ya161V4T5OIs2zB3IWKlD/QA7+x8NM9AfTaehc6ao239Hft2uzEXDEoCJCh64yG6puS4MwQdmJBDCcsJfzyE88lxIx5Pod26EkyLuoakqOHW6kkE4pSIWl8mJ+KfETOWnDazh0VADUhc2/74nkfkGqXv4UJMUOunXHzQyehN/IIAtNnZJsb8oX6e9BYCziDCPb7hz6S3r4DlksrxNMTl4TIhvUw8u8gcioeoGaaqNHzVXGpR08mcM1WQ1yRWnB7oUaYL9Os/79zUn82IvJA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(7416014)(366016)(921020)(38350700014)(56012099003)(18002099003)(22082099003)(3023799007)(11063799006)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ejCoSrZw1OaxIKNo/D0YtL4+yk673zmhJD1L6GAlgrsqy14O++MfnCeleKn9?=
 =?us-ascii?Q?GGcLStGq4LwRTzT4fymaN7bBXdoWAI6Fg6rQoY3hRxzja+RnprgCKwd2oHGK?=
 =?us-ascii?Q?McdMsicMB3y9QG7k1QvHbzc2onxGO+R2U5ejHGjAdHr3KvyIUOhJjgeO3VuA?=
 =?us-ascii?Q?zP+/F245KfPKrguv4mdL8/byTouAQk2GrfCtR3uDv9GttheTujm14Nwzxxry?=
 =?us-ascii?Q?ldBFB1cCinkpEeaTeUqsTqYMzmPd6A9xmJ+qgBsfBF1IgRLMDC6BnkMT3QSv?=
 =?us-ascii?Q?BRkuiTVcWxPeQOi//N430gEjEkBRYvuy3SgXYDwV4fkTQ2RZA3ACG73SiPbu?=
 =?us-ascii?Q?fPkD8t4GkKY3zse/zNvJirZXLYS7FuYbpJYPCkp8CNTcvWl3TNcX3hfzggj/?=
 =?us-ascii?Q?dvkWABcHSicuFQ5R3+R7abEqEvBX7XihsWtcn8QF5GjRecU/qV0PPaT8XWTy?=
 =?us-ascii?Q?MI7gEJsgeJmT8JnI+a3r5kbW/XQd3MhmiJNuGUr9UKvRJrULMMbOynuUXLpl?=
 =?us-ascii?Q?oyycji+ATrI9Zfohb6ikEtdWEjFd8tK/MK8qBD9cUioUPLR11zgWVXZrd37Y?=
 =?us-ascii?Q?EqKEHXZaU+52zCQOVQvQ4UJKjV8WCk2cxUNmTpEtoOB127a87fMbtDOaig//?=
 =?us-ascii?Q?Wz9HZss9QFj1rsig/lxWpOwjjDI4WjOq2OXO/ov/iVzUj9wQyqn7ssfWhDJK?=
 =?us-ascii?Q?RECwTUW+wxRZC9Zm0ONBcmoBxw4k+vtYRgmCHjSW4+6xb7Q+1fdzeoX+uWS6?=
 =?us-ascii?Q?BUSTB46Z4lC/1qlZCjeF6+eyQoZvBXXYoUMejgj4WwdICewFWd7WQ29h351d?=
 =?us-ascii?Q?G5eJy0+KGZpUHlLhZEVpA839oQY+FK7PvUBroNGWBMLMTkcpGtmcSki7Keyi?=
 =?us-ascii?Q?OLqUrVz8ZTJrzc9auJx001aJC2t8ocUQsIceme43hieDngV0U8qoeaT8mqyE?=
 =?us-ascii?Q?SZ9JpxDQIM0qfNfzJAXQJ9ahj5v6E3k6RiZ9bsNodoLNA+vNRWmR9SpCQQBz?=
 =?us-ascii?Q?J9dEhJpRObWVtPnuqWJNPwo5v5lcPKwx5Ux+5POANBC+qdmnKi8ms1xsqB0m?=
 =?us-ascii?Q?nJibGGzQi1D+Hy9I5IDYzGqGApnEXu4fGn45S8M174EiBdIh6WL/bn8QvVvN?=
 =?us-ascii?Q?xNshPgEZvgI1ZbB+ceDlROvQeaol38NBvgfNPSYbGwBFlyOAQphCNKDycmzm?=
 =?us-ascii?Q?Wb8kFgwxVa3Cvl7zL032tXQhDaHra4dUKshmHKmOxHQhDvpeLVYG56R9Ulc/?=
 =?us-ascii?Q?ShxocVcjZzWxR1C9NRDzLFwADuL/iJyepBvqEwE2Lz2FRnLbP2ZJemLlEEU4?=
 =?us-ascii?Q?4VTwZHybr9B8QRzHPM0oBZQqBH6QL3wuzfRKl9KrKluwSIQmI6VbjyMeBMDV?=
 =?us-ascii?Q?W7K6lsdJH4IC41uv12Xc0EAJ8c4fT8OAfQr4DA6SYWB01oyB8zvjZGwbAotL?=
 =?us-ascii?Q?8W8Oep7kjsodi0xpVimpT/McydBF3Y9SKLV2BZDb1RNDGya8+zzmV8GBpudw?=
 =?us-ascii?Q?lx9DAlDJUABsfYkAQU6ebwi2O6F+vSClR3qXcn81hWsRw3jrnIyqekDorHa5?=
 =?us-ascii?Q?m6HaRVLYZaZyLP4sp5J18oL2vI+v5PU+jAYUWywUwMWCrFF4iJ5UcSgwpTrG?=
 =?us-ascii?Q?t3Sb5665dpRXDMGR+iJhWFOAA7rEkGlmaKbMR2zj0QArb1+TnIBzfN1933yy?=
 =?us-ascii?Q?Uzc7+Kagh4K+Y/lD8Vv1QF8DO/lTvSGa+UpA0LA8WreqiRpw0bf6kQN+w/LS?=
 =?us-ascii?Q?uRQlppq0AS+Wvf7cQhllexmVx9aGb/bahk32HWAd4U8EuTYxFySR?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbf179ea-b84a-4a04-3b2c-08debacc0742
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 02:10:59.2904
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: orl34hKUJhJFOwN6oJL7Ipwd7EBY/bGHe4It1kN01YiW/cUS93FyjIbi8CeNEao2Mp1UGDwOAJaZ4pvlwT7NJele9FAkp5LFl1I7hgf7cjT3BjYWZ9mNMuGe0j9gpSC3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB16271

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/ak4104.c | 7 +++++++
 sound/soc/codecs/ak4118.c | 7 +++++++
 sound/soc/codecs/ak4458.c | 9 +++++++++
 sound/soc/codecs/ak4535.c | 6 ++++++
 sound/soc/codecs/ak4642.c | 6 ++++++
 sound/soc/codecs/ak4671.c | 7 +++++++
 6 files changed, 42 insertions(+)

diff --git a/sound/soc/codecs/ak4104.c b/sound/soc/codecs/ak4104.c
index a33cb329865cb..0a12a73b96278 100644
--- a/sound/soc/codecs/ak4104.c
+++ b/sound/soc/codecs/ak4104.c
@@ -148,9 +148,16 @@ static int ak4104_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
+static const u64 ak4101_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J;
+
 static const struct snd_soc_dai_ops ak4101_dai_ops = {
 	.hw_params = ak4104_hw_params,
 	.set_fmt = ak4104_set_dai_fmt,
+	.auto_selectable_formats = &ak4101_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static struct snd_soc_dai_driver ak4104_dai = {
diff --git a/sound/soc/codecs/ak4118.c b/sound/soc/codecs/ak4118.c
index 03dadba0b038f..2b96b82d4e40a 100644
--- a/sound/soc/codecs/ak4118.c
+++ b/sound/soc/codecs/ak4118.c
@@ -236,9 +236,16 @@ static int ak4118_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
+/* NOTE: Common formats only are auto detected */
+static const u64 ak4118_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J;
+
 static const struct snd_soc_dai_ops ak4118_dai_ops = {
 	.hw_params = ak4118_hw_params,
 	.set_fmt   = ak4118_set_dai_fmt,
+	.auto_selectable_formats	= &ak4118_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver ak4118_dai = {
diff --git a/sound/soc/codecs/ak4458.c b/sound/soc/codecs/ak4458.c
index f81cd8cebdd89..a74be99e877dd 100644
--- a/sound/soc/codecs/ak4458.c
+++ b/sound/soc/codecs/ak4458.c
@@ -591,12 +591,21 @@ static int ak4458_startup(struct snd_pcm_substream *substream,
 					  &ak4458_rate_constraints);
 }
 
+static const u64 ak4458_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_PDM;
+
 static const struct snd_soc_dai_ops ak4458_dai_ops = {
 	.startup        = ak4458_startup,
 	.hw_params	= ak4458_hw_params,
 	.set_fmt	= ak4458_set_dai_fmt,
 	.mute_stream	= ak4458_set_dai_mute,
 	.set_tdm_slot	= ak4458_set_tdm_slot,
+	.auto_selectable_formats	= &ak4458_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 	.no_capture_mute = 1,
 };
 
diff --git a/sound/soc/codecs/ak4535.c b/sound/soc/codecs/ak4535.c
index 37555674cd157..6cabad4c9f74c 100644
--- a/sound/soc/codecs/ak4535.c
+++ b/sound/soc/codecs/ak4535.c
@@ -346,11 +346,17 @@ static int ak4535_set_bias_level(struct snd_soc_component *component,
 		SNDRV_PCM_RATE_16000 | SNDRV_PCM_RATE_22050 |\
 		SNDRV_PCM_RATE_44100 | SNDRV_PCM_RATE_48000)
 
+static const u64 ak4535_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J;
+
 static const struct snd_soc_dai_ops ak4535_dai_ops = {
 	.hw_params	= ak4535_hw_params,
 	.set_fmt	= ak4535_set_dai_fmt,
 	.mute_stream	= ak4535_mute,
 	.set_sysclk	= ak4535_set_dai_sysclk,
+	.auto_selectable_formats	= &ak4535_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 	.no_capture_mute = 1,
 };
 
diff --git a/sound/soc/codecs/ak4642.c b/sound/soc/codecs/ak4642.c
index 08ec2035b2705..e5266f94fb006 100644
--- a/sound/soc/codecs/ak4642.c
+++ b/sound/soc/codecs/ak4642.c
@@ -493,12 +493,18 @@ static int ak4642_set_bias_level(struct snd_soc_component *component,
 	return 0;
 }
 
+static const u64 ak4642_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J;
+
 static const struct snd_soc_dai_ops ak4642_dai_ops = {
 	.startup	= ak4642_dai_startup,
 	.shutdown	= ak4642_dai_shutdown,
 	.set_sysclk	= ak4642_dai_set_sysclk,
 	.set_fmt	= ak4642_dai_set_fmt,
 	.hw_params	= ak4642_dai_hw_params,
+	.auto_selectable_formats	= &ak4642_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver ak4642_dai = {
diff --git a/sound/soc/codecs/ak4671.c b/sound/soc/codecs/ak4671.c
index aac54e9d54ee7..1d804f03a21d8 100644
--- a/sound/soc/codecs/ak4671.c
+++ b/sound/soc/codecs/ak4671.c
@@ -582,10 +582,17 @@ static int ak4671_set_bias_level(struct snd_soc_component *component,
 
 #define AK4671_FORMATS		SNDRV_PCM_FMTBIT_S16_LE
 
+static const u64 ak4671_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A;
+
 static const struct snd_soc_dai_ops ak4671_dai_ops = {
 	.hw_params	= ak4671_hw_params,
 	.set_sysclk	= ak4671_set_dai_sysclk,
 	.set_fmt	= ak4671_set_dai_fmt,
+	.auto_selectable_formats	= &ak4671_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver ak4671_dai = {
-- 
2.43.0

