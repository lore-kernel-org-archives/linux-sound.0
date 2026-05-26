Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011020.outbound.protection.outlook.com [40.107.74.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 550382857CC
	for <linux-sound@vger.kernel.org>; Tue, 26 May 2026 02:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779761866; cv=fail; b=cDUoQt3sPk++kDI42XqlW+THoDwDDHzDNvRkjGZmvaxf6LI2ZG/CnnVSfag2LoIf3DaKjvn62c9pWaYkC5HSNh1BO0e7P/SvbofcFzA+OnkTKNo6XT+5u6BzOrKM/r53AcIlG0HIO2YKdYTVMnmyF5SitwW67zCRzfVaB5PrxRg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779761866; c=relaxed/simple;
	bh=RE/vgBuKrcSME2DqT0sB84n/zlULXGAq7EF6FlnDnCs=;
	h=Message-ID:To:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=LPuMWB0BgJ6NnhvaGUDHzpaswHaVLdXRoTUC+zpbBW9kcJWqxuYD7vvTlSobGAQ40bSOzLkXQ7YGQ/7PTfS28agLO2D1N6mky8ydg8hwrJXZUzQybQNEx8e/PVRX0cJZBtyEx/Tjb0GwCCCnjb0niSW1tFMvhLM6NsKGhdOjxoA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=ddBWdeap; arc=fail smtp.client-ip=40.107.74.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="ddBWdeap"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y3RhyboeOSUAa6iVhJ1uQS++W3N86MFWE634cEEPJmTGHbEmuIcEi/ZB7XAYaFuDCEw9E/E02wyNHl0CchoaztpYw3hVOxRLHo/otC01+HChgfXlHQjILuEWlnlBKKmcQyndGEgyyqtJWHkglqGEyPjaGLmBE7tyrFK6vB6LJVduxD8MHk21A+oyD9YhDJONHunbG24S5jYHn6eyRHOz+U/SO9vCG/mcRq0arjJQhXOpZ4cdKJsiZAcwbeetFetXfvseDnvhnRqLJ0ovNobfwL/REaTOb0tFsvq3EExFl9hZEwAdQcAjhLrf71fH5DIarKbVmHUZtTQA2zIu+oeikQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=skYsSTM5+ue4whq3Dl2mnrR6YBKSz68e+VCXFuYSOGQ=;
 b=nLAUEzTEtg+am3bw/ZrnpX58nteoBygT+Ijl1xECnVG3gaQGrxM9YaJG76PXNyLs0fBHiVPJB57Y3+maznU30O78vuUD3EqCfxp40xsLdpDR3UCCX7VARBGIopVHanDlIArF90Qu2JaBprLBSfbKG0SkGTJMdac1MdVEHuSxr/dfEva4e8CtuaKUayUUnOAd9IQ4EThq9sfqQvXW3wXv6cz8CVqPVlkkJ9ygO+RpYNl+pBElWyxUn8YRBKoMpXjI6usBxHJLrTdjYRMqqHkpBrPFmI0DLvjTA4s/N677RTmeyOkTMPmaiHiVsvI8wZ1eLhvKEt7MOId3KlG2HzmIXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=skYsSTM5+ue4whq3Dl2mnrR6YBKSz68e+VCXFuYSOGQ=;
 b=ddBWdeapjjyD6QSYUWCTdZY89iGEC/se5CMsVFuiTyosXO/qegiyt720+D30zAomD8epw4shiviORyzezTklrzcjfwAuvB6KIEpd/QHQK2AUPnWqpwIUyjNVKNATc5CUjCdYXSX07+1hFxerDq+LxMDvh7Qh4AHKFx3iKrHeir8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OS7PR01MB11916.jpnprd01.prod.outlook.com (2603:1096:604:236::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Tue, 26 May
 2026 02:17:40 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0048.019; Tue, 26 May 2026
 02:17:40 +0000
Message-ID: <87se7ehq2l.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH 31/83] ASoC: codecs: da*: use .auto_selectable_formats
In-Reply-To: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
References: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 26 May 2026 02:17:38 +0000
X-ClientProxiedBy: TYCP286CA0318.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3b7::6) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OS7PR01MB11916:EE_
X-MS-Office365-Filtering-Correlation-Id: 85c9cbe9-233f-4fc4-5bfe-08debaccf624
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|7416014|38350700014|921020|56012099003|18002099003|22082099003|11063799006|41080700001;
X-Microsoft-Antispam-Message-Info:
	9QT7aTy6MZDI7HMSUxHs3UiqlLtQVud04d1bTmuB2PwxhhCKGVFEvK0vBxkW/tb1pl8C9dtwF/9LOymDX59KNANjcLmbv+AUcTC9365jnLHhd+qKc/xDivedg2s0SWj8/p8op/orbZtrQ6Q3OfpBl35eOK+T7e87xwerjProtuKrjWS6+aPO8R3muAZ265sVb2b7+jk7L+3pxxpXD9hWHG9e1xC+D1GMERMG8l3uatMFnLcX3ziNHgyqsGBUfN4L0G4cPOl297oqDu/Vyekv8lNzDxMNsQdN+iYKMysiNYdRynVp8bARzJtFL3ec2HskD3qLYuz9w0otA8Us08JVWupC29D1O4ioKIlZuTKAfOMqd0d91nbmWbMxe+2u4H69a4qK3ACKYO1GHLatXUTzX+OMyVq85U4viLaTWcLEI3sBJp6ZQt1GBp6zBekV4TN/E/fkr5Oax9o98hNdH7Vdy/MUQDDiGg06wapsaYYuF57QuS+CDBsNkXiAFLO0BqyZU3dy99z/6kW92zxcJ+djhHux1xrkkqMAPb7L7B4vH+vTiBhuUe36rAyfxVoYunAodPep9SObdxU6j36FPm2gUqhEumzL+hKW/Fn4jBMGVj9A9a+tTw/1pZZjrnFt+IzBZ5Xq9NDQ/1oiCxvc/RnbiOmRrM9qeQRN6BkHXaHLtcu7e6+ISlNMJqdyjVRolpDeCwF4yoi10vTAzr1vn5FrU8ADP4fbwTkTSj+coqiADJ1PgHotbYHkpGlv7qGDCFlNvuhupbtBqxcyxToNjIhPly6cq+fvV7TmHJW5D/ePTvQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(7416014)(38350700014)(921020)(56012099003)(18002099003)(22082099003)(11063799006)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ZXPtpFqOyzz6zk0+gjQpqEcNXl88HL/qM4N3XDZj/ApUH082dgCrWYNSaB/e?=
 =?us-ascii?Q?h3QrfZ6RHhF+FyRzSM4sr63+AHVz29OzKGaw6N8tpUYUuKDm2FgE6aDD/tL7?=
 =?us-ascii?Q?avObP+uHraULCIq5sEVNCjTSVOQd6sOWGWZ+Y4TGmoFZst5yEjOKMWGYDRb0?=
 =?us-ascii?Q?uQ58UkOrYEn3LVyp+UayDfT4emSdpDoRNYKH4a/vkfF5wzrpQ6kpBW+MEQoa?=
 =?us-ascii?Q?bPGW65WsdBDDFdxYAgWtDJH9lsF67qPXTPDGvEjuZ7rz4vtTY8pt5fyafMzK?=
 =?us-ascii?Q?xMxbIWFoGMu9EOpt/B3iinBUccevyM0LYCz+KnhpKg3Yy1OXdKMukMjbKkZU?=
 =?us-ascii?Q?isP00f+p7cH49Ck11If2GMvF6sWAFbdVqYFknGycteEjv8B6vdqWKQHE5i7o?=
 =?us-ascii?Q?EAKEIfoCTpzL0Atuts7Au0QFX/vVe2vNFgnnGjfWpjkDY9ppQc+Mw3JvnD4P?=
 =?us-ascii?Q?Q+ta1NDZf4RWpkmX3F6xldOlXHB7WQ/XjAydfRe8HEVCmPG64dF8CZCVlGir?=
 =?us-ascii?Q?ImJ2zrAH8fiAD1UFCoUgSDweA39oZoaN7ACTXYjoSa9Q47qjPRSp9FqMhvr8?=
 =?us-ascii?Q?8lKKJ2CTaF9umTtKwbhGlTlGdnwz0p4rKgf1yX7lB5nsjQkz2DptFc5Ob9AM?=
 =?us-ascii?Q?c96/q7LE04g5BcM4RtzpEcC//pyd8knUCB5J2VEApPaA8ggx4dLfwBZRxgE4?=
 =?us-ascii?Q?AWh1VMv0Eq8T8JjQoS4u7Co6UvlSvTKart3qNok8oi+1MdlYuu7B51VITNRF?=
 =?us-ascii?Q?QMT03RShJxbYChrHlhVpLvU7ZfTnjAdkri1BPtdEB1ZXXA8UHKO3RDOypvTW?=
 =?us-ascii?Q?IXytsDVXmsDlABvyo29J+uF/0cpNbIzXlXAeHBxuCryUF3nJyUwJwsMGeiJJ?=
 =?us-ascii?Q?Z5iUw7eAv/B4WAM1gL3JHOcWphPdWFy+OJuSjfB2u+vK95pxNKgvTFlm+bKC?=
 =?us-ascii?Q?Wy4i7BxyEGiUSHWFp5//3VBxR8U2/5QqoDeUsUl7ewBJaqkJz8ZUAdQHeBUE?=
 =?us-ascii?Q?DyD5tE39xrS+Pmw91wYJvfWD2X509C1R/dPL3U1LaEAWagMDJumkLccE5lD9?=
 =?us-ascii?Q?Uj95eGz0K4jKFmXke0gAzEYoLowpPTHmelnLIRatZyCAAfhYjaAdx0G/DTHr?=
 =?us-ascii?Q?XexaZewV68cPzcf62EZMBa8V9dG7yjeKg4AOz/mYh6bXNYqKdp+OE1K1dYe6?=
 =?us-ascii?Q?6kupe8wqz5PkcZ84jBZe7HF1mSPMgQ9R0D1+8ncRlgWdZz8R5tYkGYK9CsEP?=
 =?us-ascii?Q?ixOZjiOHqrvKId7PdIg9et//aMerR+fpEnZFPO3v/cIJ20T+5WTaVJqhDfgF?=
 =?us-ascii?Q?tq1VEzdNW7DziwxHts0TDn8u6LwdmVndf6UojdjXWNe7W47DVHzoX98DyzgP?=
 =?us-ascii?Q?XQWy/3jhJJ/X50oLLyAGz3BKVia0K+lQsDeO5QWEhUOluZqqeXDM/0Jg6wxQ?=
 =?us-ascii?Q?GAFWhszYVjQGhKhwlBb9P9XWgGXF29q4zqIuPgrRlCUC/1dXqaNiDZN3FPc3?=
 =?us-ascii?Q?ynur7x8QAceY0o3+5sEdATe6EyOUETi3elqGnjMJcvLeFWnpnEltuLmqJCUQ?=
 =?us-ascii?Q?4J4KIdEKuvZ9YR/eaAvkBbYpP028yeD2PcRnkZ/gQ3H5A0mobqwmq/m3vOGu?=
 =?us-ascii?Q?eppl8yasu5+qAyumh4Lpy6MtprcXGqbpc8Q0jlkXS/DxT7qOEYnmyYy9jPX2?=
 =?us-ascii?Q?TLUQiPgZWY+AFKA1pAIj0yJLwbJFrnZUSQhXOxw9SQrMTKkfs3gHRzQ7oOmt?=
 =?us-ascii?Q?6/WWs2jCugSoWiSU1qkAfQgQQv//BdbvTKuN+gJsW6IwGnhFt1+4?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85c9cbe9-233f-4fc4-5bfe-08debaccf624
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 02:17:40.0339
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eRII2O5J+5vgzIDnVUvvBuvWByFlRfr2jFjncneqEGQQTPtnSO9ynyltlu0I+AbxqLbQ5z6hWA/90MN4XubymSRwcQtUHWN6sxhdC4nM4P9Iqv2/c881vtLN32njCDGw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB11916

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/da7210.c |  7 +++++++
 sound/soc/codecs/da7218.c | 12 ++++++++++++
 sound/soc/codecs/da7219.c | 12 ++++++++++++
 sound/soc/codecs/da732x.c | 18 ++++++++++++++++++
 sound/soc/codecs/da9055.c |  8 ++++++++
 5 files changed, 57 insertions(+)

diff --git a/sound/soc/codecs/da7210.c b/sound/soc/codecs/da7210.c
index 4df1a25e318b6..597510de561a6 100644
--- a/sound/soc/codecs/da7210.c
+++ b/sound/soc/codecs/da7210.c
@@ -1030,6 +1030,11 @@ static int da7210_set_dai_pll(struct snd_soc_dai *codec_dai, int pll_id,
 	return -EINVAL;
 }
 
+static const u64 da7210_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J;
+
 /* DAI operations */
 static const struct snd_soc_dai_ops da7210_dai_ops = {
 	.hw_params	= da7210_hw_params,
@@ -1037,6 +1042,8 @@ static const struct snd_soc_dai_ops da7210_dai_ops = {
 	.set_sysclk	= da7210_set_dai_sysclk,
 	.set_pll	= da7210_set_dai_pll,
 	.mute_stream	= da7210_mute,
+	.auto_selectable_formats        = &da7210_selectable_formats,
+	.num_auto_selectable_formats    = 1,
 	.no_capture_mute = 1,
 };
 
diff --git a/sound/soc/codecs/da7218.c b/sound/soc/codecs/da7218.c
index 93bd045ed8701..361daf14152e2 100644
--- a/sound/soc/codecs/da7218.c
+++ b/sound/soc/codecs/da7218.c
@@ -2166,12 +2166,24 @@ static int da7218_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
+static const u64 da7218_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops da7218_dai_ops = {
 	.hw_params	= da7218_hw_params,
 	.set_sysclk	= da7218_set_dai_sysclk,
 	.set_pll	= da7218_set_dai_pll,
 	.set_fmt	= da7218_set_dai_fmt,
 	.set_tdm_slot	= da7218_set_dai_tdm_slot,
+	.auto_selectable_formats        = &da7218_selectable_formats,
+	.num_auto_selectable_formats    = 1,
 };
 
 #define DA7218_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE |\
diff --git a/sound/soc/codecs/da7219.c b/sound/soc/codecs/da7219.c
index f0874d891e120..71441f718b5ca 100644
--- a/sound/soc/codecs/da7219.c
+++ b/sound/soc/codecs/da7219.c
@@ -1667,12 +1667,24 @@ static int da7219_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
+static const u64 da7219_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops da7219_dai_ops = {
 	.hw_params	= da7219_hw_params,
 	.set_sysclk	= da7219_set_dai_sysclk,
 	.set_pll	= da7219_set_dai_pll,
 	.set_fmt	= da7219_set_dai_fmt,
 	.set_tdm_slot	= da7219_set_dai_tdm_slot,
+	.auto_selectable_formats        = &da7219_selectable_formats,
+	.num_auto_selectable_formats    = 1,
 };
 
 #define DA7219_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE |\
diff --git a/sound/soc/codecs/da732x.c b/sound/soc/codecs/da732x.c
index 12d1ac98461e4..c7806b279b992 100644
--- a/sound/soc/codecs/da732x.c
+++ b/sound/soc/codecs/da732x.c
@@ -1188,10 +1188,28 @@ static int da732x_set_dai_sysclk(struct snd_soc_dai *dai, int clk_id,
 #define	DA732X_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE | \
 			SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S32_LE)
 
+static const u64 da732x_selectable_formats[] =
+{
+	/* Hi Priority */
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF,
+	/* Low Priority */
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF,
+};
+
 static const struct snd_soc_dai_ops da732x_dai_ops = {
 	.hw_params	= da732x_hw_params,
 	.set_fmt	= da732x_set_dai_fmt,
 	.set_sysclk	= da732x_set_dai_sysclk,
+	.auto_selectable_formats	= da732x_selectable_formats,
+	.num_auto_selectable_formats	= ARRAY_SIZE(da732x_selectable_formats),
 };
 
 static struct snd_soc_dai_driver da732x_dai[] = {
diff --git a/sound/soc/codecs/da9055.c b/sound/soc/codecs/da9055.c
index a88c135331457..faff1535ab12a 100644
--- a/sound/soc/codecs/da9055.c
+++ b/sound/soc/codecs/da9055.c
@@ -1317,6 +1317,12 @@ static int da9055_set_dai_pll(struct snd_soc_dai *codec_dai, int pll_id,
 	return -EINVAL;
 }
 
+static const u64 da9055_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A;
+
 /* DAI operations */
 static const struct snd_soc_dai_ops da9055_dai_ops = {
 	.hw_params	= da9055_hw_params,
@@ -1324,6 +1330,8 @@ static const struct snd_soc_dai_ops da9055_dai_ops = {
 	.set_sysclk	= da9055_set_dai_sysclk,
 	.set_pll	= da9055_set_dai_pll,
 	.mute_stream	= da9055_mute,
+	.auto_selectable_formats	= &da9055_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 	.no_capture_mute = 1,
 };
 
-- 
2.43.0

