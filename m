Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011019.outbound.protection.outlook.com [52.101.125.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 608203033DF
	for <linux-sound@vger.kernel.org>; Tue, 26 May 2026 02:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779762254; cv=fail; b=GhWiDMBQVOZPK3AnCDdmBMWZjlZoJyWlGMcSAabXvxdB2fWctfbhlqhiSwBjKKOPOHaW5hGgNMawi3ZbU50fIP07GHlZJeFbf9Hc2VfFJRLbzjbhCky5yR7KOEx5+S3HmRHj1yBR3Kn9/4Q3/51/sQ6LVwR5yMd63pmLpZwQses=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779762254; c=relaxed/simple;
	bh=Ey4fArKTckJNTuzOo8zmUG+IsPPYGB8J/KwRknLoqbg=;
	h=Message-ID:To:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Zzyxq0GdPMojKUPd0WWPKQKU9x1M8aGGPXRSbwicoK4xH+HdvRLLLVHqMKewgT02k2pFHZsiDq43Hu4LDsYYXfB9SUZ25AnYIkbCLQwor7KSIKQ6ydwfqFt06LXFe8Cop97Hqfyp5I8iaFttu0q41TJafl5BBnqHCquygOxSiQU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=FqSnPFW9; arc=fail smtp.client-ip=52.101.125.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="FqSnPFW9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WilmKTsYBBqbAmmDuezpR3mTSRg18aPoDJYuy7hQBUSRsdA60pQljUAo6HfR6lxp9rl5t6Yk2hmEkFGAvRlFNn4rr7iKteVGMme6f1kuOUizxyiu7mddHyIRKMcz9G7n36pAjYKzasLOzyp87uaQwjvRGTgZwFJ1vxizmUZK16Rjgo8HitLDYTCERNGcBX/6J73tejQPRHToUna+bx2weJAgXrq9zWw7eBid3GQtfBJVkRxVQe4cTSl9BeuT+MM1dW9CJOAw6aDX/xYRzg8tAnYQ9hK/C9zA/D14xufk+alJjzwwJ4ckiplS82nuJxTU8jc4DdvXyxfOEqtW7zYI1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iY++M9An028f0UClqsCHnMyUhdx/oTWzuUYn1C2eZfw=;
 b=AwU39B8XZi0ANS7oYKyFgnFF2c/C+IJFiWkrrbhDbWLvFMlAsQaNJZ4bjD54BZkI+WoTOEn5fYsIo6VU2amjskvtJIPtSLfKw3G6sHXb/TvUmqRD688LwRDEGNbrNXSCwk2ZsrRWwUJf+02YxzRSjffld/ZTBcQlsU2MtDgSw9x3M5TTjKrGlFyGha1f9aJZ+jVxxSZQOhDU84AcBt19amHKG5dRLVoKntLkIOV01JClKMMR0vVtmO1rKQ1X3scplMs9nyPIKS4Y1bz47PVqZwvBJwR//9Mms6Xhr6rcACBFJhCNKvkGJQDPBfxsmieL5+NXuktsaqpKuxYSjS6EIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iY++M9An028f0UClqsCHnMyUhdx/oTWzuUYn1C2eZfw=;
 b=FqSnPFW9zdza9xX7OW5Z+KEMvYAy3K6hoO+uL9eUTszWP5fQifJaMlFgOmPqgzaFKY+KmM94IgKWptSj0RpvdyRp0Bu5UzSpVWBS3hgZO5cMUOmBS5iTL772iJc3dAH/BbSewtAIZhspAbsIgSfKyouJw/4XTAkhC/26Xmtn7lY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OS9PR01MB13148.jpnprd01.prod.outlook.com (2603:1096:604:30f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Tue, 26 May
 2026 02:24:06 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0048.019; Tue, 26 May 2026
 02:24:06 +0000
Message-ID: <87ik8agb7e.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH 63/83] ASoC: hisilicon: use .auto_selectable_formats
In-Reply-To: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
References: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 26 May 2026 02:24:05 +0000
X-ClientProxiedBy: TY4P301CA0039.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:2be::14) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OS9PR01MB13148:EE_
X-MS-Office365-Filtering-Correlation-Id: 466d5321-b250-468b-696a-08debacddc8d
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|52116014|366016|921020|38350700014|6133799003|11063799006|22082099003|18002099003|56012099003|41080700001;
X-Microsoft-Antispam-Message-Info:
	ZQtjtURTnChkrdbW7x5H24k6j1QkXGIqQnM40PxtwSkwndBvVs7zZpuw5aWY/cSncT1JGy9udlqBR7I80lA92LHVoJrhtsf9geYL5ku5vgSrbFVFm1LCuGR64wOjbziEXVs275e4AORCBBeM8MBI107PasfDxXyFayt88JSJULsBR95YtJHHR+BfWwpDMnfWwtZmcmFMKJj8dg2t083SeUjBszPnGFNhse2mDokoH5j/VmYfJk8vJXY4Qs6EwMTFfhIwOiPfTYwXMF9A00CNRE64XXgr3WEMu8tSPsO0I0MlMkEO8ZpVNGY+CMbsO0HPgZ75bUOKNWVnEMJV9buWSowCBmfjDC5mZ9WOvRumNXcDd/iksSzQyhjcjlz2vCAt5qRwVfg7KD4SMjzFXJ8Lz04SrGlZmpvFJ4XXfT1WVDRDSqWpq7gvLhkLyADqMZe6fxOWdwhRzxP1nEU/bX6JMsMzPtf4CIZL4etKoCtkLASFGojTXfrL1OrB8r9qR3+fYj2dr0ElR47RRf7GSg1d7sHL1hvTJkruZpruD92bOmB1/bmVV4/cExVCZHjCtK0Kga6uCuMcrVzr91SCT89/1VBEXOTPioSHVoVcfplLFMZPBsHuHYtsiuMgKS6A0d26mJlZtvaZIHTIFzxuYQ1o0ajuIfJfWoO2E35zlcQU97VB1YqoixXJ4k/ND5/kQ3qKCCG03hjwyx5YqefKMmq6Dq+xNxtOxB7Zjb8Qx3rIM02+AC31na4h8Vn+awuldr1tpq9U9A1mqN21H3st22dWvwhYf2MlqmGzypkCC6PFNJ4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(52116014)(366016)(921020)(38350700014)(6133799003)(11063799006)(22082099003)(18002099003)(56012099003)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?iM1D6uik0UyGNtGTjoquWVkKYUJKR9hCy71tLlawdxS02dUtOca4qffACial?=
 =?us-ascii?Q?/HwDzMCXRPpC03o1/PDiHFKYBsI50HhUXvbNy4Nu9e8fsgWVNXmFlkxIptpB?=
 =?us-ascii?Q?bacfbfW6wVvu/AYsFBEEaRYaqOWEyitaJVYK4ULoGWQ1oKCls+ECBT0zgRB2?=
 =?us-ascii?Q?yeXd2WpAMcWD7IP8QLUZbcH1KCMVNQB1EqL0JTysL4FpXkREjxtZ2GlH3Ogd?=
 =?us-ascii?Q?u5hW8xiX+5op9P8omjiGYtHkFyQGVYxX+Qw24386+U//FaJcpqGwWE7WqQAr?=
 =?us-ascii?Q?D3sy1AKWydVhG4/KSY0jG5F+H42O4NB31IH/os0ahTGWC1k1pbfvshNlQyXV?=
 =?us-ascii?Q?lgaQ9p7gruDrsyhFfnS5OsxnNehXNqf/aFm1pYVB0DR1PZ3QlSA8+4+4Z9a2?=
 =?us-ascii?Q?73EElqAbxwrudPJxesfqzRE37vWAoYC8HiSauzZ02Memc835Z5i7EEuM+qsi?=
 =?us-ascii?Q?26R+obwG1eWi+9istveljfQNJw63t1J7BuYL06rK8Zjn4Fy6TatDP6Ii7N5Y?=
 =?us-ascii?Q?ZnDqeFd8H9Ew7ZAOXJDjq2IhcieMdsbUyOAvrYFD0RdFqMCq2Sk89JRLVTYj?=
 =?us-ascii?Q?JFmQV3FAvC6bkaGgVaPyGqfltB0rnpAZ2npAbeID0et7uWXVkc6jXJlYwc5x?=
 =?us-ascii?Q?LYpyB7MaZLNnVqTbVfVVY36SMSnPp/Eqsq4U/ObFBFSP4NOtVjcEHX4gAKA4?=
 =?us-ascii?Q?QmN065BgHLk1PqjBde2nwgdB6zjoJZEb3q1uQGiOvzRvtcwmSy/scvdQJyWg?=
 =?us-ascii?Q?0234chHOnDQu6hSP+y116nTSv41+jZhoI0m32mEnMkdhlNMmu8dOfkL0IhVS?=
 =?us-ascii?Q?mKKsM2arfJ+u52+qUv0aVRZOQ3M2dZgR6AhVMP0OsZ7uKiXfmO7pXI7N0b/h?=
 =?us-ascii?Q?usfPWczLsMaW+KSeRrpVw76D3BCma4GQWDbHQVnxDew+gAhRdiKmogbcSbmM?=
 =?us-ascii?Q?fm7pH/LarQK45WihM46U5nwtPOdUDzpXkRdPQU6Okwjb1sTVy5fyE1MBwHtW?=
 =?us-ascii?Q?fZL4f6VYkJwTliEZLtesab+uwqVDnVZ+4CGCM9H2DpGnxx1odmAb64zPeZnx?=
 =?us-ascii?Q?Hr2Rnq7Y1WF7WvAMSir2iZL+e5+WmFdD8i/gl/S3P2xSE29/zoL6SC8+J+5f?=
 =?us-ascii?Q?vl+ahgpa6CMH11jC5tzoTPlUEPy7nRT+Yo/er9C7v9RyL5VTHi1vetVKx3E/?=
 =?us-ascii?Q?JNcIGDXrHbBfK/EzMO8/q3qbdBVqJ83WJ0jlVaqnKxnhlExV48RJcjUigaXx?=
 =?us-ascii?Q?9T4t06UBjipCuOAm7z2KpWJVL2VwxwBacxmpyhKQaBOgbp/xfh0l989KN0wq?=
 =?us-ascii?Q?fXwU6m//TCLmxFwoU2Uf0tLl0RS5Ov7fTUAZcgWTs2/QT49fhtncp5/FJEbu?=
 =?us-ascii?Q?S7tqFmJFberl3MH5jprqSvKoHm3BA9Dbk0S9uxzoU4aWFhjAPv36eQIuauvN?=
 =?us-ascii?Q?j9iuFNKNw8w5cZ42dfl6I1Qafrqmq2vVRYWt4gfIyyJhMyzJnnL8joPESQEq?=
 =?us-ascii?Q?vbyOUoSV8nbgrbi7CiOZnhz3B0LmiNJVT/s9am2FPguB7SFoYJwGNcRPg2TM?=
 =?us-ascii?Q?4px90RdvNcpeMD71daPbtxEkFPkbspQ+bMzxr6tEuUMGn1zsRkCVZkSMkuwz?=
 =?us-ascii?Q?DPNvBx+dJzjVixM3yrokt8pHO5OKIBGhR2dzTnlqcRZepBPWSaugw2cEg1p1?=
 =?us-ascii?Q?n3Ji0nL1MOg8jit/rfWuWMmFQ5RXsLPH/mSW+LzXCwSVjN0/RZQ2XoYZyI7m?=
 =?us-ascii?Q?0CRYnl1p7PkpYmXhQLDQQHPTxzi6/XpUZ8A69X/+b5F/STcpDluZ?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 466d5321-b250-468b-696a-08debacddc8d
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 02:24:06.5922
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iiZP+jcEcAIKhuMnOmTpNr3JGUhw6JReXyUv+hUx3/dafxeXveFm8mWinjkmXWMt+Js8YV0a3vUK9FL3f1PGWFsRYZm2/3wTbIMJUNVPNDovHSCk9lylnxZlKBRR4B0F
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB13148

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/hisilicon/hi6210-i2s.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/hisilicon/hi6210-i2s.c b/sound/soc/hisilicon/hi6210-i2s.c
index 250ae3781d140..32751f3d430b4 100644
--- a/sound/soc/hisilicon/hi6210-i2s.c
+++ b/sound/soc/hisilicon/hi6210-i2s.c
@@ -509,6 +509,11 @@ static int hi6210_i2s_dai_probe(struct snd_soc_dai *dai)
 }
 
 
+static const u64 hi6210_i2s_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J;
+
 static const struct snd_soc_dai_ops hi6210_i2s_dai_ops = {
 	.probe		= hi6210_i2s_dai_probe,
 	.trigger	= hi6210_i2s_trigger,
@@ -516,6 +521,8 @@ static const struct snd_soc_dai_ops hi6210_i2s_dai_ops = {
 	.set_fmt	= hi6210_i2s_set_fmt,
 	.startup	= hi6210_i2s_startup,
 	.shutdown	= hi6210_i2s_shutdown,
+	.auto_selectable_formats	= &hi6210_i2s_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static const struct snd_soc_dai_driver hi6210_i2s_dai_init = {
-- 
2.43.0

