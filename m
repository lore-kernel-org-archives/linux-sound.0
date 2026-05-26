Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010005.outbound.protection.outlook.com [52.101.229.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE7A123C4FF
	for <linux-sound@vger.kernel.org>; Tue, 26 May 2026 02:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779762108; cv=fail; b=PP1RNG85762KtwNVvlV25JXxpn7P8Ii4GXCXnFt9dScpHb3cIU9iDYLfRU+XQY2mWfRD2AIGuUZ5g/rFX3ia8hu9Zx4kpoNHdrfY0594Bum8/jqsT0BjKM7yxJhB5ZYllR3ooGEzLNexCYSslnzD7Jv34mnVi4Kmt9qXd2UM5Ow=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779762108; c=relaxed/simple;
	bh=e3xE7okW9zmvCR/otUSImNWRjKTv9FCiHCSaGuC2FT0=;
	h=Message-ID:To:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=AuBByMX2z1eU0GkdnxovfwCvvY7HzStaU+xb6C5SiAwkbJpixJG31NIKc0vEORp6tZHo9ISMPuC2RegH7MkAF8Tf5NT5PNfr63o2FrwJT8AEc0vCfQW6gY8g0nnJIwBVBaIofiX9AXX57NQXvrzG6MCPGUYsuo9pSM+bBpYjZHk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=f2yjG/Zd; arc=fail smtp.client-ip=52.101.229.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="f2yjG/Zd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T2d1frwhPefrDSoA1Xd941ieO4g7TpHwP3OwMOIdPtDQowoZZrBcNq1VqJsld7s0xOfI/FUyWzGT+Sp1Hex0lgvwqEKYP1dxQR3paoo/7yLgUd8QRPd5++b4EN1aYdpPTARY6YOG8qwZUkVhqE5q4zqHk34AwdoYS0kdX4VE7WJAYjvaPDe0t0Zes9jbmERcruojIh5IlbXtYHGfneZGf74MgiLdeLWTb/aqYLhxQXNfkVL6TgbN3x6BM9bfPwBCKjPReCIEu87XxsUu/HY2d4OU/np73mqn9dqRToOdUwFg/OK1aJrT4mx5bcSG1M+eeuTEWDrsrUDZrm3jKn9BQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bfGMhATUQHa6y6m2pUoWW0l0IsgjWa2NYAywnSQjMCI=;
 b=RMrYXY3QwvH4wBGgUQ8wxCCNryIHjvZFgQawecErItbUvv2QR/NuxleBKjQu1SfWIlgf08y1ufHchfZ+hR65H54iuwxZuynQYHfvJ2hBDQ21HiP9LLSaGMLGX0kN7bPgehWb2q57GI47KTsnnNdJnm3QrjxCmsWystrxDAVJ58Su63K8DBSHOF+BgO2G/1p+lLHlQ/DxQ3wr8vR+k7UfJrbRABJ4D4YCWsZ1dXWqPualaKqZ4W27SOcBo2BMNnM1+iU+9ftflgAfRp2y5xTh5lEtJLTqLnw2tGMsx5TyaAG6yLTmUGDtufFSuUlN9YQf/UVy12uuZA2cLQTnC/AFmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bfGMhATUQHa6y6m2pUoWW0l0IsgjWa2NYAywnSQjMCI=;
 b=f2yjG/Zd8WM4UqB5a2muB62LC5jbW+qYj9VBou8K82f0UJ002CD55TH/78iw40/TqVm7XMtFwEhnpEdgK0ixmuAq9a9HClONV+uthccQ1RUumCTpXeOJngI9T0KQ+yq8VWqg2jDfrnlGYUOGnkzW2aD7G7DWbCodBW1q4RFs6wM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TY3PR01MB10158.jpnprd01.prod.outlook.com (2603:1096:400:1d9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Tue, 26 May
 2026 02:21:43 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0048.019; Tue, 26 May 2026
 02:21:43 +0000
Message-ID: <8733zehpvt.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH 49/83] ASoC: codecs: sma130*: use .auto_selectable_formats
In-Reply-To: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
References: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 26 May 2026 02:21:42 +0000
X-ClientProxiedBy: TY4P286CA0097.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:369::12) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TY3PR01MB10158:EE_
X-MS-Office365-Filtering-Correlation-Id: 86dbdce7-6683-4482-61ab-08debacd8712
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|7416014|376014|22082099003|18002099003|56012099003|38350700014|921020|11063799006|41080700001;
X-Microsoft-Antispam-Message-Info:
	WGWQQNvw4kgUhQWHpntROIQxdA845HHq3VI03sfAaOkgz+9Ivy6p3iz+FUTr7zd/qzKcA7J4XdE0cZXxhAshv5FdpckoyNNAWav4HIH+cezEqG/eMJynntjE4C4FyB10tbs5xr2J/Q6vkuub0I5Q8fhOqacBz3Tsld/vhN20WnEpvMN0e0Rqw3ANBi4+e4tcmMSan2izeMeh99cVxiUwT30RPiNo+ae47mGIY4UGxBUJfnKEsPps3NOiG68BbCyxinHQU2PdcEL6/WseVvzaiJJYQyKy/RhKXWzMHOz8JEIAgEfQ56w7MRlKxjqE7JzyIUnCelWEZc86qcLM6ENEaXIXoutQ+jn2SA1B4ToZJIvG0K0NHkHHbo9Cp5z5N+Y75wcp5jUHTeBcfOgtDHiI1ZbGbYtdwga+G8631rST2vsfu5Z1aNjGPDtaKxE5c6O2SrqR71ZqND3BX5Mv1GueBg7gxyk9DXs/irgd9+eVsl870BP1crP9BtaO+zj72rm47qFuwMrwICfLhjsipnntUiTPPZ81aD0PpE7Y7b2jazS515YN6Oy4/beqeN9qjrAJ6qPOqmxx7lafdIA7xKmLVvMho3WVrbay0RJ7MSvMyTDL11wkjhz1WTRRt2X5GStcT3IrsXhetdNtDEinKMYtocc0jezXKjGCG7OmKdQIEyYXRHluqVBnqzvCPRTgTyUtDRaiYkNaF0H4V7Dh+bzO/KtiZ5WDOUnNlNhyx5gqMyU9uvZN+A10VGiIwar7bpKgwZFGBtuUspzqqT1VzxdgrpxrO+hSC0ahgsl7gFG2Tks=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(376014)(22082099003)(18002099003)(56012099003)(38350700014)(921020)(11063799006)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mty/mlFZqKtxAH23RyFLZp3cXlLdOqizl0t9P+JEiQsEY0W5HfJR6J752/yl?=
 =?us-ascii?Q?LdsOo9z+8dHMsUPT30BAK7L1qhRCY/RdmJB+xyOoDRa8Nw0fYzDVrph7TL/q?=
 =?us-ascii?Q?PHblcxBASeHpPS7jg9xU8LFTS4v5dz/j65EgCfj/ycyiim7qjID8nHqmf3kA?=
 =?us-ascii?Q?GURgjUINJr20wE4Mv5rK4CmLaa65EKXEuQzLSRED5urYc5rbsp+pPG+xNlbW?=
 =?us-ascii?Q?UhLSZWsAFvTk98pysh/5elHxOpX/lXoVPTkDa1ca5+9rYkcLwU3LdC1Frb3E?=
 =?us-ascii?Q?HBJC5Z/HLarxYMK71WIG5FOC0NJpVfyN8pAGfAyCUIdzxHaDKGmFNmOOGJJ2?=
 =?us-ascii?Q?dfSa4RIOPU4bSXtuAFOE0ovm0KdEYD6dnmsFz4kEk56snxA7m0oBRnCqAo6Z?=
 =?us-ascii?Q?l4JYNsi5V+iUVEBwwysdnKwyd/tC3RIG1+G34O0LOWcF/tc19qaEGl+pY9kG?=
 =?us-ascii?Q?ZzgYJwubgmQOHHu9EzhDAVybjMPPS7SilkDNYLG+ZeUQ8wwriiltRWCi0UZh?=
 =?us-ascii?Q?Cdl78rpdOizuPfRQwiQQHog+gnorOEF6zm0/5daDe5J1xmfTXjRHXjIYJmbe?=
 =?us-ascii?Q?VF85FMa3vYtpWFJylZUTUfsItP5rgZMQujMkXAGuq0mjP9J7IoLBYycu3bBW?=
 =?us-ascii?Q?xllsGrUBlVmfLFh9eZtDIxOp9sLo57pNZkKgE16c+RQxPMkRmfb4VtrYgRZw?=
 =?us-ascii?Q?2hcCkTklCDcPekVSJ3lEA8r3iSFScHe4K4BrJLZXAK9WXzO+IDgTmhKnm88j?=
 =?us-ascii?Q?3VyLd5OEx1j1Lb9Q41vG+FxlrWtNyG6YHyYoAkyhSiKmgn4iFSxLfqOxCtjX?=
 =?us-ascii?Q?iJFIBWKx9pOLVU+3WQGcgpOTbcWE6IuaFWeMH/blA+S86lrzj64bVXYQJSRH?=
 =?us-ascii?Q?3EzfrGA52oaCAns2sVHg4aKWC1iGjRua4tdWgD2PHnBiONb1AbS7S1kkzERi?=
 =?us-ascii?Q?Uu+x2kFdMRk7s1I+WBN6QpCLwHS8+C4rYG6rcCZrRGvTDSze3QdA78Iz5xCO?=
 =?us-ascii?Q?heGgNraOv5A//UwTErThpcxNsvQlpWFpzOheCQykjwwqK+ZeqIrhRsLOFMzH?=
 =?us-ascii?Q?1xPHFEDHcFbtCsWQSFgHmt79vLCqQNPssP/mbDCevglvJEeG1tP28YIZQ+2m?=
 =?us-ascii?Q?uIUI1v+W/MD2vbvbTB9JFcnR0Xuydv3zQSvAQCnnwcoLYntbJGOf2XFqDrZJ?=
 =?us-ascii?Q?XFpw1Br9jAE1pcmJezQHAFZ8MiYQVy4MWVKNJTcIUqw3i0kxUcDMk8nWQBNr?=
 =?us-ascii?Q?1siybY7v2zXYl2It8HLlZYkLIhDq2Jh3FIbOkiuKxRDg5Oqt5ERPRz52cywC?=
 =?us-ascii?Q?Z8UUSLdw8+rE+Ne96vw8nYuhy/Z45BHyIlJDtP89ERsLCbxCK0AteAnKo1Nz?=
 =?us-ascii?Q?lc4rOQo3Ri4jtPzJZmm3DwaSmtWS8JnQVarQRQvF0tsfZ9zw3VIrZd0V/Vwf?=
 =?us-ascii?Q?1e53Sb7fM2P8sZAKssbZFOUEcjDhabSObhymQcnv5Wxlf1dXgKFpbEbs/5Xm?=
 =?us-ascii?Q?sT8fre+BI9qJpR1BT9yPNog8blIhkT9lG2AGaygMfh8FEQuJN/FOpCTgB5nE?=
 =?us-ascii?Q?elG4IKPPwG5lszxJZcXKwGWOh3YaRHwuyRasOfyn0avr6LUTHkILeRBRU39y?=
 =?us-ascii?Q?/UNre91NUKq+AT457U/I+uFaMADkRFDLJpFL7TzCQMxWH0ADJ7prBiLq4yI3?=
 =?us-ascii?Q?ZheFx71FtITD0dP1AhZM0qMi66+MUqjdQnu1pB6CxtdXbm1qqQwXaQ+eHoBT?=
 =?us-ascii?Q?mpV3JTVEP9iNMrTFul4Y1rfKeRGcysE0/tFUo9sZeKueImd2i+Sh?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86dbdce7-6683-4482-61ab-08debacd8712
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 02:21:43.1513
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oSEM3bhCUzlIFlG7RWmGxIIBaUBPCXTw3Ss8TMiXKZESC+t+FMtBj84oYyPABZRx3pylC5czrTOVzju+q3wcVzXE8D5StdQ/kKs/oAegXhzxyF23FXImkgx7/6hJF6qi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB10158

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/sma1303.c | 13 +++++++++++++
 sound/soc/codecs/sma1307.c | 13 +++++++++++++
 2 files changed, 26 insertions(+)

diff --git a/sound/soc/codecs/sma1303.c b/sound/soc/codecs/sma1303.c
index c7aaf98ef71e8..963519ade3fb6 100644
--- a/sound/soc/codecs/sma1303.c
+++ b/sound/soc/codecs/sma1303.c
@@ -1413,12 +1413,25 @@ static int sma1303_dai_set_tdm_slot(struct snd_soc_dai *dai,
 	return 0;
 }
 
+static const u64 sma1303_selectable_formats =
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
 static const struct snd_soc_dai_ops sma1303_dai_ops_amp = {
 	.set_sysclk = sma1303_dai_set_sysclk_amp,
 	.set_fmt = sma1303_dai_set_fmt_amp,
 	.hw_params = sma1303_dai_hw_params_amp,
 	.mute_stream = sma1303_dai_mute,
 	.set_tdm_slot = sma1303_dai_set_tdm_slot,
+	.auto_selectable_formats = &sma1303_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 #define SMA1303_RATES SNDRV_PCM_RATE_8000_192000
diff --git a/sound/soc/codecs/sma1307.c b/sound/soc/codecs/sma1307.c
index 1de6bd1e4ee7e..52fccd7d63635 100644
--- a/sound/soc/codecs/sma1307.c
+++ b/sound/soc/codecs/sma1307.c
@@ -1552,12 +1552,25 @@ static int sma1307_dai_mute_stream(struct snd_soc_dai *dai, int mute,
 	return 0;
 }
 
+static const u64 sma1307_selectable_formats =
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
 static const struct snd_soc_dai_ops sma1307_dai_ops_amp = {
 	.hw_params = sma1307_dai_hw_params_amp,
 	.set_fmt = sma1307_dai_set_fmt_amp,
 	.set_sysclk = sma1307_dai_set_sysclk_amp,
 	.set_tdm_slot = sma1307_dai_set_tdm_slot,
 	.mute_stream = sma1307_dai_mute_stream,
+	.auto_selectable_formats	= &sma1307_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 #define SMA1307_RATES_PLAYBACK SNDRV_PCM_RATE_8000_96000
-- 
2.43.0

