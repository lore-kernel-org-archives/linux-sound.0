Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010038.outbound.protection.outlook.com [52.101.228.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55137305671
	for <linux-sound@vger.kernel.org>; Tue, 26 May 2026 02:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779762449; cv=fail; b=osbvZPkS3wFyQUTW6RjwSYLaKGLMGHMViiJpbXi7aDq+6pB5tKF9yJPQBSFHl8h3LuzzkzD1XFUxLFAUbLl4ry+6XYVHxUfeaSDBDKH+hUD+kl90t+o2af7RE8uCbUtiN8T3I2FKIh22ilaQUjchdp1q24Yw0CILHMyEUyA5IXQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779762449; c=relaxed/simple;
	bh=9cJTENrMzjo4yoEY4GLqZJGlDFPGLuUdlZ/pTkQWS4o=;
	h=Message-ID:To:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=g4i6bCCOzL6dNunalwQKCIWRKzT1rZOW7DCqUrhy8mJ1SRvJMrR8G1Qr2gflzvk+/JC52ScwMTJW8BHQntCfPfbKpeT4F3Vl6BKjPkuYXiJLAaV4d4LeRNHhf2cFZbJbBcle87SC3RXx2f71R9LtLwVPGhiLy2+V47WyNdC+wbE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Gy+wNzV/; arc=fail smtp.client-ip=52.101.228.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Gy+wNzV/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WiNpB+lAg24aZ6MeGhq4QSVpAlvEya++A0m2zd6X58Xd+EIER6nkJgRDZ+Rli23jFsaTaeFZrQKVE3eOKW3z99rWulVOR0Hqlsg40thhRcQL+B4Ioy6VEXq5wrE5awqmyQWL7KpVKUJ/bMh/OaeI/qPV25KGS7IXvBqJ4K79TMZ/WIeRCymmEucw6DwmCFiKU1xTeiKOqF8G6eUYNYuSl+UaJOSdZUQQazZKWG/IrE1nsBEwnAoGfOXZs8KAoUPfQZho9sphFgCQ68z2K699MVWpSjHZPUWF3oq75rG1cmCfPC4NJwulDvKntSEFSSfigOOAEd07hXPYGp+rZm5Lmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tSCXQSxdF8WTwbtVK/mnuZ7M2K8URi2urIapF51nicc=;
 b=M+pv8rBB2eNpYbs6TM0xRJ5FjTSQ6H9uxEAWc08S2ZBRUjenrEZRKj2owLWRKaFCZ0EuB8H5wnwGiW6XutlXj963fbTMs9Qy87oVGnAh0LllY89J+rRj0oMUtEwvHN5gPZSm9ON87dvUiMPBkqBDldeczKEiGy4ZJm6QzJYRFtaY5eltVwdpC+uKculIlKE9FnIN2Zd9pK516CrtzZs0/IR2yuXK1nPWGNxXg/DCfRFACgkjKuJt16nrpKEvpdTN0E5Z9LAB7UM55APvH41rXBiD33F+E/arvpLqd2Pg2PLBVsSziERn1vGqeC+JzDS14ygdiHI21A7wHh8hzhykTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tSCXQSxdF8WTwbtVK/mnuZ7M2K8URi2urIapF51nicc=;
 b=Gy+wNzV/YwZREXw+OujK+bVsux7/s5lC/9pFvyDYtzzbnQM3QKUu6NoRtQWvp+q2FTf264t8+snfku8wpYwt8DSXIO1jH5+bkXXcDReFQTC6EDwspuCbKky0NHf5s2ZmmDbnzp9L0To8EodMZuxe/9puxGYXK/mi61sLbGDOfrY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYRPR01MB13144.jpnprd01.prod.outlook.com (2603:1096:405:119::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Tue, 26 May
 2026 02:27:25 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0048.019; Tue, 26 May 2026
 02:27:25 +0000
Message-ID: <87y0h6ewhi.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH 77/83] ASoC: stm: use .auto_selectable_formats
In-Reply-To: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
References: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 26 May 2026 02:27:22 +0000
X-ClientProxiedBy: OS0PR01CA0179.jpnprd01.prod.outlook.com
 (2603:1096:604:26::30) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYRPR01MB13144:EE_
X-MS-Office365-Filtering-Correlation-Id: 30de5778-3d94-4d4c-c311-08debace52d3
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|1800799024|366016|376014|921020|38350700014|18002099003|56012099003|22082099003|6133799003|11063799006|41080700001;
X-Microsoft-Antispam-Message-Info:
	3s/7/0zxmwbxfno5Mw5lneTkYjaauf7Xu1r0K5PRJ4Bkmr0Fh32ef8u6QP8aVpS6hAFVXlpbv2/SfZecPVc0OF3hIfH0Fzyk7Hg1oHpWbpXwt0gxCLbO/1Rtl61nf/CH9rioAZ0VX6T5IbxzWj1Cjye5o8Zq445bRB4ek15sGoW7MAWdKNN8sYtGFRqmRvf1sJtqK9/vJ7ExZIT+pMQIoIx5MG0S090SvyvWtGXiGMeJFlSWRQ7hPeIdflLodAyRvjupYhQEMiiKZj6QYFKQ64+Jq/ZYXx3Q5mRI15T+a7mGymHx7pwhq+AfcHt1OPiyhVYPYmxjuKgGDY5DmAsqG909Lnf7HeUiqm4RL1O/GVlI8AoxkQYRW0HmFWhhthFqUu6KzuHy8n3OpbPjToGrPYXlrFKr1TyTt0K2uickyUpBAzz3Zd2rpnMgUR7irFY9mj7BO1UhOwarhjZGo1XgeRMTKsfbx+j9DtbYNoB+MFP468kbe8C59miuVOIkG/15t/DIWRafHNoZK6mCzGGFycwq1HUTbvocStW/6wRct4baIWF4QbIOE2aEe9M8uMLnY5l5Un4accmd9mx5a+G0LmkWujrySdTOOpAyHGx60bFMPNMaz/caY/erpITFxU9hQP1o+yWsEob/Pw2/5j4sC86rz7UtAPnznJZhB7IbdMAIa8wdFYmQ98YMqd0cPdFf6HzcMEvWG3XENvQ5+jbFph5k1aOT9slsNaPZnPI0Nxa2OWR9YR73YXHq9wGcaI5gSlN5gI4cQ261eoEy2iUEUB5XrXPYUYStOQONR+cymfg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(1800799024)(366016)(376014)(921020)(38350700014)(18002099003)(56012099003)(22082099003)(6133799003)(11063799006)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1J0krSqv9+x2LXPAnLQ7uoMsk0uPoyO1VwHXYmaQJic3HBjPboquVpuJ3FXa?=
 =?us-ascii?Q?+eZqJrR5OjOaJbrQW5/SzpHMvixtPu3UeIDW11zALUXJ79nSUBjQjhud3IdM?=
 =?us-ascii?Q?o6NYQpvQLI4HmblhDBaqBl+dHdL1y/v5nWObMZqVAXu8Cc11kTvNZXWYSe1V?=
 =?us-ascii?Q?hW1FX0uYIiLnATFamyfg7kPHZF5UQe0yFcpxmtUqpmdDv776bQmMR6q78+3A?=
 =?us-ascii?Q?7+6iyotq+K5euiwLDIOKAGzW00xgAvd5gXjlHQPV+83+7oCxaYAmAKYupBBk?=
 =?us-ascii?Q?xtimYQwMkfdb0+rh1pPsN1udwBkA8e62RGJZNXOA6CLcLzRYa0nx9WMig24z?=
 =?us-ascii?Q?OMWkwibjbNJYiHDdq+QNmUXHNgDq9cXMbPcRAZtEzDX7DPlIRrW5iLN4V+MG?=
 =?us-ascii?Q?4DMnOk476eLo1viiZy2hatmzU54BESiBSMd2QdDou8B6UvZAFevJLWOpPPUH?=
 =?us-ascii?Q?foPlWfX2IzZjjI6ox8bvjSLZsJ057lcxdAodY3p0mM/Apnz7imAb6qp8anQi?=
 =?us-ascii?Q?yvc0wiZBvbLuJLOSblcN2+8IJmOWLw8xBMskKPpfT5b8v7qPXHK369zbZx9M?=
 =?us-ascii?Q?VY2LeKml3RFaRkCUGvp5YzJeW4pfU4WDIxkXx7fGbLlpIuueRnUpz4FxJ6gV?=
 =?us-ascii?Q?tiR4Wwn42/G95+g8U67C/QZcbfxy0mf+1Wx8LBth6yx3NDiXYARVux6wE8Zv?=
 =?us-ascii?Q?9rdLA7w6XWUj24qhhnhV+JyCgvYXuIMOXXtRRuPIMy5j/AkaxzfBoVvaCWje?=
 =?us-ascii?Q?u6azbeT1VYbFfRNIvDuy5ZJcDKBRF6p0xUiwEx2XU4iRhFrfz3APUOAE/5W7?=
 =?us-ascii?Q?oYIWBFSTaCFOI3DH7Zojo2QIwKgb0nh1XEwhj2VxAfcdzUAawglBVC6sH3kc?=
 =?us-ascii?Q?NKawyByVlKmAF7B8y9vKQND1KWAXh745sDtfXvZ2F+iT1jQ/xh9e9iA6MPho?=
 =?us-ascii?Q?2/K22+mOFneQrt3FN8nlaEPSNXMTKjiBBkidKxwNxG23y8feTK3k9g8v/EOX?=
 =?us-ascii?Q?MM/KvUGSBXkRmHMAbw5dTvcQv2zXBwdruwsO61RTc4IbNJ6zY9NQCuJZ3ju7?=
 =?us-ascii?Q?Eqhb+24MY9wo0cqoFSNabska74QX+Bq6Toxjp0Ek0LwerUsRC+ZPQgvFwSAJ?=
 =?us-ascii?Q?Mu0UfZBbmnx+SSTk5shImxu86x8aYh9NEv/Q/Qvu5/ggMHBgXudJCXqyKAh+?=
 =?us-ascii?Q?K6yMzsHQ+O0ByJe6hr9yL9xqnvIgE4idsrtHt0KhMEE8ECEElXPZutQ2dYdT?=
 =?us-ascii?Q?RyNDeaJIhAPcU3TnkFBm9RDg+E/JxvS7zA/BxzhphBS85u7InInFEdDZFWFL?=
 =?us-ascii?Q?n+trFS6KWyp8jW7f9lCvllm5BTL6pGuzwGvHXkutBnsyFSSau7XBV0e6N/LT?=
 =?us-ascii?Q?sEOpTmK1Rwq3KcPqAySZWxZC5MNt0wHDdsXeEEutIezNsTvdiA3djjBdm/tY?=
 =?us-ascii?Q?54NVXppsqMRuv1gY0P9Yb+d9zgsTmBwR0CoUCb9bbYEGOkI1E5LGQTrSd5bd?=
 =?us-ascii?Q?ikYkbnYvVMwyE+Zv4U4I5WOUzVjgL+c00/N97oztgTUhhJar2KEbxA/MjvYT?=
 =?us-ascii?Q?81HH2afCvT8SMpxw1Kv1uRYzywXXpIL89UEqpd9/hOc7BBqYIZUNU7jXbgar?=
 =?us-ascii?Q?2Xq1TCuxBfXS/FVvaZ/mlWadoSBCOotsAdcd47KSqt//RNg5aoZne3MYBDjh?=
 =?us-ascii?Q?SqmTVM8ctzhqaltyygD4Gdd68gweLSnzo1x3ocZmfD5Ap4ftfLQhk0CehQVX?=
 =?us-ascii?Q?+U+Pyy/cg9uBM3Pefxv9RAe87K9YmZQAFi43mcRWO6sY4gi+ZLT/?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30de5778-3d94-4d4c-c311-08debace52d3
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 02:27:25.0209
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Env6+FrhLQCk54oWpWBl9OXXXMlDD2+l4Pugkq/s134x8H/5uqN+82Meb8n3xpP9tDRgWRT57numu4ayreHZnLywGMNP0mdKcLUGvdVinyxI8PUc9paMKZKqietwaQpS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB13144

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/stm/stm32_i2s.c     | 12 ++++++++++++
 sound/soc/stm/stm32_sai_sub.c | 15 +++++++++++++++
 2 files changed, 27 insertions(+)

diff --git a/sound/soc/stm/stm32_i2s.c b/sound/soc/stm/stm32_i2s.c
index ae9e25657f3fe..d9ea26b1c7afd 100644
--- a/sound/soc/stm/stm32_i2s.c
+++ b/sound/soc/stm/stm32_i2s.c
@@ -1089,6 +1089,16 @@ static const struct regmap_config stm32_h7_i2s_regmap_conf = {
 	.cache_type = REGCACHE_FLAT,
 };
 
+static const u64 stm32_i2s_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops stm32_i2s_pcm_dai_ops = {
 	.probe		= stm32_i2s_dai_probe,
 	.set_sysclk	= stm32_i2s_set_sysclk,
@@ -1097,6 +1107,8 @@ static const struct snd_soc_dai_ops stm32_i2s_pcm_dai_ops = {
 	.hw_params	= stm32_i2s_hw_params,
 	.trigger	= stm32_i2s_trigger,
 	.shutdown	= stm32_i2s_shutdown,
+	.auto_selectable_formats	= &stm32_i2s_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static const struct snd_pcm_hardware stm32_i2s_pcm_hw = {
diff --git a/sound/soc/stm/stm32_sai_sub.c b/sound/soc/stm/stm32_sai_sub.c
index ea9e8bddd63f0..e59bfa34af76c 100644
--- a/sound/soc/stm/stm32_sai_sub.c
+++ b/sound/soc/stm/stm32_sai_sub.c
@@ -1358,6 +1358,17 @@ static int stm32_sai_dai_probe(struct snd_soc_dai *cpu_dai)
 	return stm32_sai_sub_reg_up(sai, STM_SAI_CR1_REGX, cr1_mask, cr1);
 }
 
+static const u64 stm32_sai_selectable_formats =
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
 static const struct snd_soc_dai_ops stm32_sai_pcm_dai_ops = {
 	.probe		= stm32_sai_dai_probe,
 	.set_sysclk	= stm32_sai_set_sysclk,
@@ -1368,6 +1379,8 @@ static const struct snd_soc_dai_ops stm32_sai_pcm_dai_ops = {
 	.trigger	= stm32_sai_trigger,
 	.shutdown	= stm32_sai_shutdown,
 	.pcm_new	= stm32_sai_pcm_new,
+	.auto_selectable_formats	= &stm32_sai_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static const struct snd_soc_dai_ops stm32_sai_pcm_dai_ops2 = {
@@ -1379,6 +1392,8 @@ static const struct snd_soc_dai_ops stm32_sai_pcm_dai_ops2 = {
 	.hw_params	= stm32_sai_hw_params,
 	.trigger	= stm32_sai_trigger,
 	.shutdown	= stm32_sai_shutdown,
+	.auto_selectable_formats	= &stm32_sai_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static int stm32_sai_pcm_process_spdif(struct snd_pcm_substream *substream,
-- 
2.43.0

