Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011005.outbound.protection.outlook.com [52.101.125.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 523CF3C2796
	for <linux-sound@vger.kernel.org>; Tue, 26 May 2026 22:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779835487; cv=fail; b=h46nRZANhJWmBcrC8e7Tz9rGgunH34DJJq4k4W++dxWbICJ7E3oiBRRsniRUzLS6suK9ut5qpn5Kfa7N7hVd9Nk+sLPpYSEaxUnIJUnywtO6a3Px2tv+sZkZMyemOhT0C1qeJr9pnwSXTW8b3F1P9EzVc7JW5gYPVnvMlcbo/5g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779835487; c=relaxed/simple;
	bh=8aPJ9/OzoECgwpn/HT3P4PCK0tPqonHGGi8zbY3FusY=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=LkRGYu06oxz+TcqOdtPIT7Ae6Vm9eAB/mMTuKOT6zoKDVlqrDMUxDHEnDNGnK7elEsW4dyfPKLOERw/SXZS7kLfc5l9rFft/uk2nmFKwusN739slNLN86tb/eqZSsu4bUMcZ1+LcLlCWJGCvUIeiiTSbou8mXXofIi9d3TxCv0M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=HdTN6qeW; arc=fail smtp.client-ip=52.101.125.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="HdTN6qeW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oGxe4ww7koq0iNEXFyrBWWex2CyTc9JoOZ0mSUgASgRPvXC8R9+JAdcsLCtyiCyXQrzpCgIuSVxikYx8XUiNpUOr45wX9r04eIbuRAPCLdnI5XCIMTqshom339ga3orWfwoAbXP+tWEF+3f998KqoxHf38JZhFfiQDGpd4Ik5aB1rEFbqoJJZ/mYViN3KiC0bBODoOZNI+hjqohKGVM6v05mM3XDdlx5JzmaRQcyv9J7lVmyJabQ+Xy+i75Ik+1RhbsyfFiYqTsZX6nKuFxTFKbtMxnjNlp3IG4zqHI/zXEUV7fizX/WHyLJUdbsMj0YlRV47eaDUTuyjfTfeBfGDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pHSXl5h2u2Z4bay1cxPrSrIFziqb1JKq3kfvVQLstmw=;
 b=JXrnuOVetXr4eg4jxPchJWeO6JZEdqz+fZIlUqZfGYh2iy8fsfi4YcQMdvRfmX9E2ySUFO1AwnyLCZqdaxriZCEZAbc1riVeynfJw+I/zxIN13kc8clzkALvkwjeHyb5Q+OsJZKJOo40bdlLel6l3/sjPLuMDKDzjlglVnzcahsZAtuSS9AV9EUDnVG1idZwfVZ1KoQI3ReJ0SrMJAuT7CjFfgef3jFzFc7x/GLe/ngHkluNi/CUEXwcK+JQW8rdhTaCQGtoMwmudv3tm7RXJKV1ZdnsIOG7WZkKmj7K89t3IiN4Bga7oVIGK7rK7J8hxuf79KqDZswMqLZ/17oSIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pHSXl5h2u2Z4bay1cxPrSrIFziqb1JKq3kfvVQLstmw=;
 b=HdTN6qeWt1km8vdmZWm/6fMQJ+cmqS1YlWJWKmI+B2TYCcl26UK4/msQqYqRifa+YQRV0HUHl0Tovi26noOAfAPL59K4tPnDHtGGiQL6jWVGRsrZTQoi4frQG5B1TTDZXCV4X/1O83KayBUfj6JsiFqUAOVfMlpHYGg6vLQR3R8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OS9PR01MB14205.jpnprd01.prod.outlook.com (2603:1096:604:365::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Tue, 26 May
 2026 22:44:42 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0071.010; Tue, 26 May 2026
 22:44:42 +0000
Message-ID: <871pexaizq.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Cc: =?ISO-8859-2?Q?=22Alvin_=A9ipraga=22?= <alsi@bang-olufsen.dk>,
	"J.M.B. Downing" <jonathan.downing@nautel.com>,	=?ISO-8859-2?Q?=22Martin_?=
 =?ISO-8859-2?Q?Povi=B9er=22?= <povik+lin@cutebit.org>,
	=?ISO-8859-1?Q?=22Nuno_S=E1=22?= <nuno.sa@analog.com>,	=?ISO-8859-1?Q?=22?=
 =?ISO-8859-1?Q?Uwe_Kleine-K=F6nig_=28The_Capable_Hub=29=22?=
 <u.kleine-koenig@baylibre.com>,	Alexandre Belloni
 <alexandre.belloni@bootlin.com>,	Alexandre Torgue
 <alexandre.torgue@foss.st.com>,	AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,	Arnaud Pouliquen
 <arnaud.pouliquen@foss.st.com>,	Baojun Xu <baojun.xu@ti.com>,	Bartosz
 Golaszewski <brgl@kernel.org>,	Ben Bright <ben.bright@cirrus.com>,	Benson
 Leung <bleung@chromium.org>,	Biju Das <biju.das.jz@bp.renesas.com>,	Binbin
 Zhou <zhoubinbin@loongson.cn>,	Bram Vlerick
 <bram.vlerick@openpixelsystems.org>,	Charles Keepax
 <ckeepax@opensource.cirrus.com>,	Chen-Yu Tsai <wens@kernel.org>,	Cheng-Yi
 Chiang <cychiang@chromium.org>,	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,	Daniel Mack
 <daniel@zonque.org>,	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	David Rhodes <david.rhodes@cirrus.com>,	Fabio Estevam <festevam@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,	Frank Li
 <Frank.Li@nxp.com>,	Fred Treven <fred.treven@cirrus.com>,	Geert
 Uytterhoeven <geert+renesas@glider.be>,	Guenter Roeck
 <groeck@chromium.org>,	Guoqing Jiang <guoqing.jiang@canonical.com>,	Haojian
 Zhuang <haojian.zhuang@gmail.com>,	HariKrishna Sagala
 <hariconscious@gmail.com>,	Heiko Stuebner <heiko@sntech.de>,	Herve Codina
 <herve.codina@bootlin.com>,	Hsieh Hung-En <hungen3108@gmail.com>,	James
 Ogletree <jogletre@opensource.cirrus.com>,	Jarkko Nikula
 <jarkko.nikula@bitmer.com>,	Jaroslav Kysela <perex@perex.cz>,	Jernej
 Skrabec <jernej.skrabec@gmail.com>,	Jerome Brunet <jbrunet@baylibre.com>,
	Jihed Chaibi <jihed.chaibi.dev@gmail.com>,	Jonathan Hunter
 <jonathanh@nvidia.com>,	Kevin Cernekee <cernekee@chromium.org>,	Kevin
 Hilman <khilman@baylibre.com>,	Kevin Lu <kevin-lu@ti.com>,	Kirill
 Marinushkin <k.marinushkin@gmail.com>,	Kiseok Jo
 <kiseok.jo@irondevice.com>,	Krzysztof Kozlowski <krzk@kernel.org>,	Kunihiko
 Hayashi <hayashi.kunihiko@socionext.com>,	Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>,	Lars-Peter Clausen
 <lars@metafoo.de>,	Liam Girdwood <lgirdwood@gmail.com>,	Luca Ceresoli
 <luca.ceresoli@bootlin.com>,	M R Swami Reddy <mr.swami.reddy@ti.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,	Masami Hiramatsu
 <mhiramat@kernel.org>,	Matthias Brugger <matthias.bgg@gmail.com>,	Max
 Filippov <jcmvbkbc@gmail.com>,	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,	Nicolas Ferre
 <nicolas.ferre@microchip.com>,	Nicolas Frattaroli
 <frattaroli.nicolas@gmail.com>,	Nicolin Chen <nicoleotsuka@gmail.com>,	Oder
 Chiou <oder_chiou@realtek.com>,	Olivier Moysan
 <olivier.moysan@foss.st.com>,	Paul Cercueil <paul@crapouillou.net>,	Peter
 Rosin <peda@lysator.liu.se>,	Piotr Wojtaszczyk
 <piotr.wojtaszczyk@timesys.com>,	Qianfeng Rong <rongqianfeng@vivo.com>,	Ray
 Jui <rjui@broadcom.com>,	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,	Samuel Holland
 <samuel@sholland.org>,	Sascha Hauer <s.hauer@pengutronix.de>,	Scott Branden
 <sbranden@broadcom.com>,	Sen Wang <sen@ti.com>,	Sharique Mohammad
 <sharq0406@gmail.com>,	Shenghao Ding <shenghao-ding@ti.com>,	Shengjiu Wang
 <shengjiu.wang@gmail.com>,	Steven Eckhoff
 <steven.eckhoff.opensource@gmail.com>,	Support Opensource
 <support.opensource@diasemi.com>,	Sylwester Nawrocki
 <s.nawrocki@samsung.com>,	Takashi Iwai <tiwai@suse.com>,	Thierry Reding
 <thierry.reding@kernel.org>,	Tim Bird <tim.bird@sony.com>,	Troy Mitchell
 <troy.mitchell@linux.spacemit.com>,	Tzung-Bi Shih <tzungbi@kernel.org>,
	Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,	Vijendar Mukunda
 <Vijendar.Mukunda@amd.com>,	Vishwas A Deshpande
 <vishwas.a.deshpande@ti.com>,	Vladimir Zapolskiy <vz@mleia.com>,	Xiubo Li
 <Xiubo.Lee@gmail.com>,	Yixun Lan <dlan@kernel.org>,	Zhang Yi
 <zhangyi@everest-semi.com>,	linux-sound@vger.kernel.org
Subject: Re: [PATCH 25/83] ASoC: codecs: cpcap: use .auto_selectable_formats
In-Reply-To: <57bedd7f-dec1-4b61-8a94-d858297ef3f1@sirena.org.uk>
References: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
	<871peyj4sv.wl-kuninori.morimoto.gx@renesas.com>
	<57bedd7f-dec1-4b61-8a94-d858297ef3f1@sirena.org.uk>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 26 May 2026 22:44:41 +0000
X-ClientProxiedBy: TYCP301CA0038.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:380::13) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OS9PR01MB14205:EE_
X-MS-Office365-Filtering-Correlation-Id: 665d22ce-b782-449d-7830-08debb78607b
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|7416014|366016|38350700014|18002099003|22082099003|56012099006|11063799006|4143699003|41080700001;
X-Microsoft-Antispam-Message-Info:
	0G/qWkuoMVa3HJg0y7Wi9S3PAqndQdrKqH2X7tTZROeuL5zDIBU6kYtuNujAvFJSJgpywkD+dmgzzeqUUZHNfISUCWnjcOu0PLjDi78LyEZF2fu27Clv4Gf9+OO6dqLOpDlpaqW+x/IQUbgM/c2VoSOALDGjEWsSyDzx7JFkfAN4aKqW9++2dUMjUjLORoxHZVYPHP8twY5mGc8PZTNwGMJeD3c6WDelaureX1Rjr9+RNURrdDsHSVWirBijFKO6i+Jp1PfPT9vhFofP4/cbt+qhR9wqg70xkQe5xmd7bz8AXmYjE2JLL9qXZO+XZeAt3E0BknE7/N6g8BYX1CxllRmCY3yQTRdQSz1nWtV5DWWihDOy3hXRGA57hKWqpRayxAm/Ux/K+NKroAxqxUAu9sr1WokDXWB0rdR7sSpqFtH6bwPa9AaUd8Bb3nmingK0FQxKZ9eMv1SY6/r297fwUWyLNYm2sMoFBsar2bZrtCIYyUUSmsf+NsHTLZtroJLHx590xHZl+YITZ+132sCDXYZt+Nc6c5PFWd9Ugovqxxf/hiUMnplIvPeiDzYlfcCqCvMNpjy2xWsuLNNV5/u1DOPblcl1iJ2AmEHN3f2uJhihsHVSTlX2WcHEe4PycbnJGPgonqYZe1obcp2wGaYoI7xMAB1XWCEEyUugz3/V32e0fapZcykCasWcpLpxZaQjkz867lu00NIxbHYWVLxZErPuTTAsPyt6rxoRoyo9kziqaaxL9nyTXE3LWZ1u1OdW3o9of3ofnuwWltS9s74ykA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(7416014)(366016)(38350700014)(18002099003)(22082099003)(56012099006)(11063799006)(4143699003)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hT//dM80hrYpY2gQujX6J3w4lOPgKS14TKLwNRk1w7BvEkwpmBqBRot2i7E6?=
 =?us-ascii?Q?vtQEwMzYp1EZyDMbbbztdOF5on/96W0go9wzqenrpLeXmer5qlzXnJVsjZYs?=
 =?us-ascii?Q?yqkHKKmlAeyg+m5VLLvCkk1M09bGVam3XhbIyaOJYl2HwE41d9kHWYBU0auu?=
 =?us-ascii?Q?5RyeVEEzdeNbre3FjYVKjB4zgyEhmVUkxqWpl+Wxn7Nb0l+rTaHg3qb9HNzQ?=
 =?us-ascii?Q?p8+d+DhKknomj0+9U8IVBfpLrgtMrVzLrjcBKFD0rUY+Afc7epI2Os1jknji?=
 =?us-ascii?Q?hWS9vENyp6wHWTGgQiChC/2W8zYSbWHQ484ofOgU/W0CzflTwE4JlzWcqibZ?=
 =?us-ascii?Q?mc0DQCsEmSgkghml50Uty77KGIKoSXheyDzE1akEEEJ1NY+1Brk15x0Q3apK?=
 =?us-ascii?Q?aWZPqfCLT871SINE1eULlWKwnDlW9N/7KRmUDhK4wVy+Ycbyv5cGZvQIh7ql?=
 =?us-ascii?Q?djzE+x2v2VOFcQWftdZkl9p0ihjo2rvtPl5Wb9GFuMw5tek7cD50MGEfEeFC?=
 =?us-ascii?Q?6cOYUJ22c5NgfqVfyW9e1yOcX/+qqRrOSyjHXMWA6sNm6MoUf59Z3oDAxHfX?=
 =?us-ascii?Q?9J1rxhu2aZmeZTT6GlL589lY8TaWTrakfg0Auw9m/uNvPwa9SOzq5pDgFTwL?=
 =?us-ascii?Q?VzAQKRgvK/jQ00K+CtvMbZTImI6MhIWgjmgEIeHnh9M5Izra1vhmjXj8I6yY?=
 =?us-ascii?Q?eiOtt4ZE2M4ObeW7e7gUs6e/XupA+bRwROF/np+u2TNQtAuIIjh2phxOzB7j?=
 =?us-ascii?Q?/nq5ErW/NVD5wRU+x5VaON9cUuuABkazKBOfsTrrfwPIYo4OqZ3fBujr9Gyb?=
 =?us-ascii?Q?WbYjHtdssz8JC0kO66uPm0wH32w9xdnHYm3kZ+ffPPnXzvDIxf020sCijnyw?=
 =?us-ascii?Q?h92FMSsPrIl3xucP7AFeqmB5/kXswnxpG18woANEYfpCQFaXGYu2w5Qz6v6c?=
 =?us-ascii?Q?uOITqdNglw7K3JbftNqBvSI3LVZkEHE6eKam+0N3maFybWAMZfKeB883LNI6?=
 =?us-ascii?Q?nE6HACluEAsolGeX+THQHVljNJJ5ErKKH04aRncK5W27h2wG/ffcie6bOXjP?=
 =?us-ascii?Q?c289EIkPbASOoN2BNYrq0tzhhzKTpSghT+SsGnnjDLm/K6edXc6WB8OOmPcf?=
 =?us-ascii?Q?jOE2aszxvgp+uMji3RnJ+cRYdq/uaB1shQl3nKubDsdzlbHHL0zyl/elM9/G?=
 =?us-ascii?Q?CZDmgprH/6U7AQHTul4fpoSaIKlb/JVc+MsVixl/dgOcGOJFckSw6zyqfYrr?=
 =?us-ascii?Q?zuIRkQRMjVhGzo/lYlFeN8owXc2m7duIUiGf1YAkKxRbS+rSpjcnMW497rep?=
 =?us-ascii?Q?zFlpHW5xTpK7b1jJ3I6i3cdcxHJPFsLwkvsIfOJER3m6nExEgCpox8QDJVtN?=
 =?us-ascii?Q?mjvlFL1kFmLGBRcWY0asbv8J6NV7igSHd9xma1hrOj6kbHToHROVnmaHvfwB?=
 =?us-ascii?Q?jA7emEM5Q1fd1K+J+gqeSkGc1VtPRn6IvJy3otl+d1xw8Ba9tATkoZ9e/MyX?=
 =?us-ascii?Q?GlfUIuurdCrufAnfuMOPl97uc+g211KFPTSffbEld/oSHk9ChUwGzPI4qbk6?=
 =?us-ascii?Q?vKJmQh6AOSpNhhXkM5fdfLgTctctGINIdPfPVX3CjNZ2K/IjLjSJH7xS2FsH?=
 =?us-ascii?Q?ZlmUqHKL7FcmjdhTBJobrwjA+hwnUi20cjit/X/dgdxjsah6ERrLHRp3L5o9?=
 =?us-ascii?Q?FuhIC8OgclKybAJpWK394kZcP+moJHWYPDOnVqK9a8fVhEpnz4/j24ukW+SX?=
 =?us-ascii?Q?leoWcNSuDKtf7Cea70iZI6Y73x2BmG5HmLA3EaajuWj6vqNLqgX4?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 665d22ce-b782-449d-7830-08debb78607b
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 22:44:42.4132
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WAG35d2+A0DMaP0ieesWOCnZ2czarNMlvGbT/GvKGbTGhSBJUmbufBKRA6CautXEsIrHL9+610olWAmiD2bfl0XBWcShf9TiLRZDPcbhMAJ6fFrfrl2baimcue7CBsoq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB14205


Hi Mark

Thank you for the review

> > +/* FIXME: non I2S ? */
> > +static const u64 cpcap_selectable_formats =
> > +	SND_SOC_POSSIBLE_DAIFMT_I2S	|
> > +	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
> > +	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
> > +	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
> > +	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
> > +	SND_SOC_POSSIBLE_DAIFMT_AC97	|
> > +	SND_SOC_POSSIBLE_DAIFMT_PDM	|
> > +	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
> > +	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
> > +	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
> > +	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
> 
> I would be astonished if ths supported AC'97 or PCM.  There's a comment
> saying:
> 
> 
> 	/*
> 	 * "HiFi Playback" should always be configured as
> 	 * SND_SOC_DAIFMT_CBP_CFP - codec clk & frm provider
> 	 * SND_SOC_DAIFMT_I2S - I2S mode
> 	 */
> 	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {

Thank you for pointing it.
The reason of above formats is it cares I2S or others.
AC97/PDM are not handled as error here.

	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
	case SND_SOC_DAIFMT_I2S:
		...
		break;
	default:
		...
		break;
	}

I'm not 100% sure about this codec, but should v2 ommit AC97/PDM ?

Thank you for your help !!

Best regards
---
Kuninori Morimoto
