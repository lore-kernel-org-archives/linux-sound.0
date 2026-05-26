Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010053.outbound.protection.outlook.com [52.101.228.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25F4D308F26
	for <linux-sound@vger.kernel.org>; Tue, 26 May 2026 02:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779762602; cv=fail; b=lwY5sSFITJEPYhGd1qkJrKxm7A7zlnkly7A5sYl9C+svju8zXNxl6eBooo+8/01WVSzWfIbBeCmH5pFzCKPnIbSJ0QE7Z1nw8CW5gzJyZnmT90RYWrY/41fRhnw71Fm9zNLB69fhHVnb5a1pHNw9z29D6g1WOvdvYNXo8Rsz8kg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779762602; c=relaxed/simple;
	bh=REM2pXarlpfJ7S1OHQuB12GocOSRFa3ogIMVBY2tqsY=;
	h=Message-ID:To:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=sjvz3lSDqo0XRWJtjYhebOlvTrKIonjwrEwuMdm3oR4lSBt5v8tjBi95ppR3Cb6mLm86XiprKvW9hetH+jKdxRMq4ZOnlJBfTCkYVx/TQMW3SsLrJKoljdiR0f5eIbSMZDorlMJrLc+UKXUhEISe4/5gRid45o8pXqFprOhp4oU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=GOdY6IFS; arc=fail smtp.client-ip=52.101.228.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="GOdY6IFS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SvtZVxfOD7JbE2FICHQ8rTVjz0EuicFO7H9yRamcSIKBGW6DWfUvrtTU+WxxDclRPVbcsGBv437Mnz0yRL6EilSn+0XFVzYw2xZA3Pz7U3IwpBT6U9B2NTfDvjYe1/HXUecKD/FbTd2boGeG9fsOHS1A1Dr27YWrMvwpJR8oVlTimHqj2wvV6lDNO+xXr+P3KEh3hsH8OP60/M2LI6OM711/+uXH/0WTrRfmOtaChJ2zJEXEYTIs6H3gafaNFE47gnPC9lJ2pusWKn4OJ0D2PshfibCqvMxZ/FBYQc/4vCJdaC6mJjxQGZnYMGEjbdYF8JyE/SY90Nd22Acg6ksiog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p37NJcv7EO4g/R+H5XaJrshNvK4Mec0kiST+cjE6+2I=;
 b=hFIXtaXJVJAjA46WCPMV+GnqtaQMnWobjMjSWxxmRfySDJpAwqrcncYKraak/LezqKGf5FVrgLn37X5YOArSbZo5lMvQ8AeIOTQUgximAMu38uMBUBFyUtFWHcg2XPAAmPz6K2FMbmdB7A70De1mwLX4ktTvNpyzN4lErP8tPrO/u7xOItklcxgZpHmbGUS6/9FujVt6bbaV0l6l1L9/Ea0lzvr05cH0oNEXrn6kyS1wUxNWhi81FoJrV33r3EvduK4QRvEbh1M0SLuq8BYa8DZUb3s+BvlAGN1+hIvw0XmcYMVBUFmq4c6OAxXfmOkDE1ONWZ9jFFPvChd4h2suKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p37NJcv7EO4g/R+H5XaJrshNvK4Mec0kiST+cjE6+2I=;
 b=GOdY6IFSlryL9an5OIed5r+OWry83Hr0LX+2DNojPnh9JG4HWeDqUZPxwVo0PPg6zltErsr+RB3jGtnirC/D2hnXHgycEkSy62/MkYW7Ku0dLZPy/0FOANa9YMlUf7XGaRv3nY8Mt2ze9p4ihBkDBuM1EpCVwAmFBLJ3jOQmRFA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYCPR01MB11158.jpnprd01.prod.outlook.com (2603:1096:400:3df::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Tue, 26 May
 2026 02:29:57 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0048.019; Tue, 26 May 2026
 02:29:57 +0000
Message-ID: <87pl2iewd7.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH 83/83] ASoC: xtensa: use .auto_selectable_formats
In-Reply-To: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
References: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 26 May 2026 02:29:56 +0000
X-ClientProxiedBy: TY6PR01CA0039.jpnprd01.prod.outlook.com
 (2603:1096:405:3bd::12) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYCPR01MB11158:EE_
X-MS-Office365-Filtering-Correlation-Id: 3fa9521f-fcb7-4ae5-a40c-08debaceadd5
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|1800799024|366016|56012099003|22082099003|18002099003|921020|38350700014|11063799006|41080700001;
X-Microsoft-Antispam-Message-Info:
	1L1lVnmb3D8f/BiJGQmJIkS4EU1dFYiDNRzzeeNnO+zdXvRwRZQPAF1ogk9TnYHqTw0NRTLYInRkiZvs7O34npzs8kcGtE7wjCdXDgPn5wH1j+PPWQjDsFa2aQInpiWRlC5H66bImL000a+fVCqLivQ+OLHkN9EIyQSNdMe3eWZBj6mDjN6xVbXFv9lHM84IFjIao8Dd4z565Hk0B//VgvY9kZqMqTR6hIBs3cm82nd6nu7Dq27qSYiE+WM34PZ2T3vUwZt+jy+aebY+IPim9VFDHCRVB4wfMMfAGqJDWNmWOVdllBCoRdCJ8NVbsHDolwRdtoDqw7V+yB3ko7n5VAMfmUNslkYp3+bMsb+O14u+bIbG96291jKRrhYe9YQjCTcNzh5YZXWSzyGz7raMuUZx6pmVJExExqcQ5fY2tU+uCutgOGO5121niEscSP8GOYcGGl3sMm9aX7E+ai/oSH146oeMc5DhZbW0mnD23f+yaCN9Yun6lTpQTxZEgJT0d8sXNCY8jThZxcYCVpeKUlIFywqiPvpHY2dxWdL+UYhuRd+RRFB8VEKmKiFBkrtkipzXclsCfFu/jcfXKUcqy7sEOHNhA8WCf6Q/K1C335Ea0PgkauIu9nQyDo2qr3d23RMEoY8diGjk2eSXQAO1AuKw7jpaamcL/+mpspO4djOo2nlg9bDMCIl2mNnoot5i9kF0HTAVQLaVFJkN8aPS7mKAwS6VPpj7ucP6z0mOrySzqcrDJ5FGpD2CUe1fJNUYNgFIWmPV4QA3FTuBLe0mNfIhd4QFInTEPAGtsEXFO60=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(366016)(56012099003)(22082099003)(18002099003)(921020)(38350700014)(11063799006)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xBExX5Fg7BpGCyxQWqX2O/mH0cj+QMbVVDY7SLguQTRaDDxngHpmsZxrarPq?=
 =?us-ascii?Q?dM1eX4EU6C0mRnkfJ0xl7n2fiKLJpqTT6vztT1CERI3/VorhryD/IuNaYkS1?=
 =?us-ascii?Q?xgXzWK1rg3oj4PZubdqAmDgunilMfnhy6qTM5XigRxZKB4pPuiJ5qOarNGQo?=
 =?us-ascii?Q?Qm7L6WwueXwbDDMADLZZc2b3EghRUQeKOdLfegKKG+hsQUukdO/cSP/6GjEa?=
 =?us-ascii?Q?bVTzz989aoH5nlZlDWZxpZyk+pLpPRsMVP9yQjLpOmX+6RI+HcBmt7yDghDP?=
 =?us-ascii?Q?5bZU4oeojdFKM8oA75D2zvXG+z8bDy3Y85gRonccNT4NhQ8ZRTCd1hyD9kPH?=
 =?us-ascii?Q?VLooC7dSH9NU6tMnSz8sGbVCClqDPNy9Ew8fK2Vn9D6FxQ4DydcjRiebF+0P?=
 =?us-ascii?Q?GlPaoJwYYrz7iKux3kxVGPEjEQsyGw7g/rGVu4PB1XoPXcWo+5OTtUJIbU55?=
 =?us-ascii?Q?MvcftadTJ9dTQTAZu7xZt3SxfWd+XoGrpndR+QFrohHVBef0pnnaJVCKmkQG?=
 =?us-ascii?Q?IiUnhiDceJYdDvNE7AdDfTxuch8pV8Y76PIHVbGmRb8aDi6jpX8OlFM2vjpU?=
 =?us-ascii?Q?+qEI711mXo1sMAp/+rEnS+9KL6bBb4mkkNum53YMr6iNiKF4Utj1/fXEipDa?=
 =?us-ascii?Q?YJloK/EPN5TShZJ+qknzJRV9hQITFPR2860vhDnqpJ8dhNT6/q17V9lSPU4l?=
 =?us-ascii?Q?PMyYT+TgLt7tXQ74KsizzrHtCyGn0tjZ0N5ODj9ChHj8ClAEQNyFS8jHVodr?=
 =?us-ascii?Q?rOTEH1rIXFJWg6/oWoBEkNktC7ctcHWCBCsf38Aji10quRA5CgKN+PTmL67X?=
 =?us-ascii?Q?aodYtaIC+RD+itrGOmFYK0qTI9vH6vuHdv0rIxJ4E2/uF8saZCxL7WPM3Hzb?=
 =?us-ascii?Q?Fx4sYpuwNeq9D8f6v0E774PnLwDV4jPUOkwhu9hyHzHuSvxNRismQwAJwDSB?=
 =?us-ascii?Q?pVCIP3h7WC05mEkEuVwNcamOxFaeY6N04xfoDzyFiufh4QGhGnGMYe1MjscK?=
 =?us-ascii?Q?Ci+6QUaSqWBx1ZpThUTMJW0gz9ChaCO9xJijhY4gW0+m8bANmEDmBwVy5479?=
 =?us-ascii?Q?6fco6P0dpXwhs8M39aWnmdCdw0xBtIsa8yJu2obowtivvtjK2wcgFkpPXk9n?=
 =?us-ascii?Q?XLn/3VBggIJ8KLmo7kihsY7lQL2i/BksrbafiN0sEwdB93yajHoIfcp9zTXB?=
 =?us-ascii?Q?/2iHw4bdOnc0dmzpT6YAbPAsWd7CKGjOzS/QdxIT0YrxUHFIBlqmNm9g0Vxj?=
 =?us-ascii?Q?hJKYjdNYXoKQuf2rpMw7gFbNN0VuFF+sITu5Lca0951SljjaEsDn2O/6dXMi?=
 =?us-ascii?Q?tXhtYbwDoBhbQYbbOvxfQtiUxmroq7BVNOwzirwJc0m7kz9AJHsrM4KfH3wx?=
 =?us-ascii?Q?PXqYWfLLElKGauzmsEN7X2ZWXsHQO18NCm0evhyu3ByD/k75jh//7LA3/iX8?=
 =?us-ascii?Q?IL0EliAju3DgvXd5CKlbIvQSOXiXvI3fnz0FoXU+Qp41Nfvf8Hg/BTx1rho5?=
 =?us-ascii?Q?Efp55f0CW4TWkX+y9A2f9hn66WtnCP2Pse39PUaGMGlwZxxo17s3amvOS/OV?=
 =?us-ascii?Q?RPUfB+7xdpKMO4BlAoeRsVCnJdxFAkYzrOmCAjeiddonroe8W1dZA33gxOme?=
 =?us-ascii?Q?LQZnqr7lqNfWFvqsbfK7gj4hnCRnb+DsHkn0lKkm9XmOhaejsjLYfS0PmrCk?=
 =?us-ascii?Q?ojuNdj/2C9IAEM61z4jmSM9Ml4AqJhES7sXwJi/1LmBHEwoHfzdQSQBVX5dw?=
 =?us-ascii?Q?KW6V2yd+Elq0Ql5gZ00VesVvY09GqvOFjLMpCs6R1q8eYQjKqY1M?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fa9521f-fcb7-4ae5-a40c-08debaceadd5
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 02:29:57.6661
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yXcqTnK+zRT4rbu4i9eS6MgTV0w1nch6lvBkVDdgzXBKUUCc/Ib0iAOodVxTVcJRGsmKVSQlxWI/DNQL0z4MqAoXFnnCQTYjviwcA/lLocnOwfz4xjqsicKfsCAYlNHA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11158

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/xtensa/xtfpga-i2s.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/sound/soc/xtensa/xtfpga-i2s.c b/sound/soc/xtensa/xtfpga-i2s.c
index 9ad86c54e3ea1..00a0a3c740084 100644
--- a/sound/soc/xtensa/xtfpga-i2s.c
+++ b/sound/soc/xtensa/xtfpga-i2s.c
@@ -485,10 +485,16 @@ static const struct snd_soc_component_driver xtfpga_i2s_component = {
 	.legacy_dai_naming	= 1,
 };
 
+static const u64 xtfpga_i2s_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF;
+
 static const struct snd_soc_dai_ops xtfpga_i2s_dai_ops = {
-	.startup	= xtfpga_i2s_startup,
-	.hw_params      = xtfpga_i2s_hw_params,
-	.set_fmt	= xtfpga_i2s_set_fmt,
+	.startup			= xtfpga_i2s_startup,
+	.hw_params			= xtfpga_i2s_hw_params,
+	.set_fmt			= xtfpga_i2s_set_fmt,
+	.auto_selectable_formats	= &xtfpga_i2s_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver xtfpga_i2s_dai[] = {
-- 
2.43.0

