Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011026.outbound.protection.outlook.com [40.107.74.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8C912EB10
	for <linux-sound@vger.kernel.org>; Tue, 26 May 2026 02:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779761714; cv=fail; b=gIShh8Lxqa9RBuedj7TUF4i8mljM/LXYwaY8cJxyR6OaqxIjKwAEU7OYdjUQX1hPgvlNgWu2xDvUJAcw1xX9sGgtauWvMN6dRCrzPWU7bLyNRzzfaHZMMNa+FxdhZeKLsnzYVTZ65KVd9zdJQUPIV1EIzijuZHr8OvVdKFoixqU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779761714; c=relaxed/simple;
	bh=bKSyqvwCpcGB0fcD7KbsVnTZPuadCKNm1BQViFOiMmA=;
	h=Message-ID:To:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=m0z0ypHaugpXZuepnmIwH4dkdjtZ55lXQbSldIu4nTDtAaBxrL5F+otV+wUK3elmnfkzGPKp/MnRMz5UGoix7FHnFV3wLg2VnGr+LXkm4R1a+/Rg6qcP3IZShtUn+nJPr2PayPUKrFS6bAeeCSy5KEcZmkz6FI9huRT0+IphVHw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=FuaS7f66; arc=fail smtp.client-ip=40.107.74.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="FuaS7f66"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mt8mGtqy5YfBGCGtSVTIjQNxum2fEWK4o7U1O3bCjzRtizMAsQ+FemtSKKXXRCRVN3rWFzfIrqU2911aw39GU3kwVEW6KKjxmfVRTL31ikY6x7HMg3UneYvfgYlv7eZkdlzWAU90NbVbyvhtKDCrCowx//dUv72/kqUYL8pA3DIGbNBpW66v3UTn15iVtCu8jtZIdejxLZ8hpWZWwyV99cjGbKqHiUWIyGvzssnTM5JgDoOSuvHIlpcjooRyjmXMiAchjwSqXKtQ3W0aIoqjAm5cOEkF8UB65t3GGJ1K0Lt4/U63Fhk4YcuhgCXpo1ldAxK2kf77vZuVtPAqoT/lWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sAm8mKFERz8g023yfLltkWp8JziELfw8AMU7GhEWHEg=;
 b=T1GtyyxgT+NaFpKtKE1aKQ/69qDWwHdIL8RvssKkqj58xwuuOoFekeE6gQ5VaNeoV+mCHm3qOGTdvLZjBs2xf+pDF5CGyc1hYtt2d9yRnCztkNGD5RIgZL5l9TrbXROg6lO3yRzbSjHrWSAcZTjiwa5l9Azdma67uzU+TNtfFcVtwiMIs72tOlW5yoMUUdQsVlU21q5mwROwvxqsfJ3HsT3aZUadBAeQb6beSptA4L2oMK3apcXopVUwg3cDO6YqsyXofRBlFyz8FT/eWQjEcvlfspLEAEyJJ+ykjR4NEZSrwAos9CS6iCoEuBu0hTC2hAaBnK5FX4Ee3CPXnIBQQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sAm8mKFERz8g023yfLltkWp8JziELfw8AMU7GhEWHEg=;
 b=FuaS7f661L5gZ2G0A5Dfck/dl5JNLkfHQh7Y7pQJWK4tNWu8u037DQ9QJmOLOwuLqFQG3W0nU6xLws2ty728BbEsKciS5UZNkbrQ/zPRwJCU0R+iwo8u5szEKvoC498/fXtpsL0cjN9seUGJhiIbjyWKHTC+Pl+lv2K76Or0SX8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TY4PR01MB14087.jpnprd01.prod.outlook.com (2603:1096:405:208::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Tue, 26 May
 2026 02:15:07 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0048.019; Tue, 26 May 2026
 02:15:06 +0000
Message-ID: <87y0h6hq6u.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH 27/83] ASoC: codecs: cs35l*: use .auto_selectable_formats
In-Reply-To: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
References: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 26 May 2026 02:15:05 +0000
X-ClientProxiedBy: TYCPR01CA0129.jpnprd01.prod.outlook.com
 (2603:1096:400:26d::16) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TY4PR01MB14087:EE_
X-MS-Office365-Filtering-Correlation-Id: 390d43f4-5280-43a3-193a-08debacc9ad9
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|52116014|11063799006|56012099003|18002099003|22082099003|38350700014|921020|41080700001;
X-Microsoft-Antispam-Message-Info:
	2BK7mVbiQasEZ7qp6kUXpCyV3WlW4AJkCz3lmOUlkLRCpmfKgzfriduFczRNa50D9U4ZxLohJOYnOmLX/uHRdNrOMtXHglGdxXOfhVEeFCoLDJkkjhBh2iUmNb28vR9iuZY7ziaRiKWc06h7yFnE9JOTraBx9q6d9PlpdQgewAW9VJPh28XnlVQQjonXDYu+xT9xI8jRipSxDqa0G9Yo9oetJ6C/9See4htiUfcsdNkRpE31wdX3VebVX90FMeb6drYAQpG7pxpJeOuT2CXVkeLkGwLWXcC02S9R1dtuAgNZNXoy/Y1VCx4a7OkHPyITRVQhfONNdGYELqK+T4iyUX5vebLRy0o8H9unTSAUrP2oFaY1VMHNn8l+cxL6otG/W/0HQvwcz0AYqolhndxUaGEyx/14GAXXMA5RuDOpe3dMcuO7XDP3Baxz90tcNdwG1OXbjK/LO40ggyxthfQthiY73UMiWmBkTNBT/tQtoRLnVT3fMiv6zoTbQKyFXve5omV60b9dmgRdMf88oLzMAXmEvaeyxm43Io0GWgf5xN8bATsz+MZO3pMXP4wFcFJnmf+CyRATFUNM8YitFGT6dP0ijdLwSAVaJ187jMoTkNGySUfAoK3wSmxynN93Oa8z4PqybXTvMdqNmIoiu8ukal3YHBnF/cyj3dXn1ncH5ZF4FKYic7XWlgpKjJJ3zf2oQJkPG6QZwlWxwQlS6Vlp32s+O+3Wle1zL7sYQKs5HK637i8vfhl3SgDa1nQzEz01bJaxTgDi2DJHq9fBaw1yI9eB4GonZCw0HsSFUlpqrvs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(52116014)(11063799006)(56012099003)(18002099003)(22082099003)(38350700014)(921020)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5QNt2EvmkUmo0k+j9I4ixp+e+pVw9wwjYoyaNfTDPbAxxCaI5dw0hr1wTzty?=
 =?us-ascii?Q?aVx6cNkOtJa1AQNliq64m5HjX62vG5wX9crNSZ2RvuDa0CJtuknJ4eLyFMXQ?=
 =?us-ascii?Q?EVi7RdMNEKO1n9Z2yZg0c1uMp2Dp7m8b/Srxytrmw4HqbiGAHh24OBOCWHQK?=
 =?us-ascii?Q?+Lpiyms+9GECVcv2lL8pDjDA+lH02/NDntay9DzsNbmSPkgMb+5hW0ZawgiQ?=
 =?us-ascii?Q?ctZI35Xee6LenKlrscEkfusKIaLvUQ7zKlvOYm3rRvJ+3oDeCAbAXMt1df2J?=
 =?us-ascii?Q?4Og1REXj0RMldR465jEv+59xLnKEggFlQoJ8j/Jbra9017RdtUvn33vVW/Mw?=
 =?us-ascii?Q?j7ho+eAhlSq5fPzu4uY8xQ/0GGJxH7HaSvIaZ5FM1jtLUR320Z9JXMlECtlU?=
 =?us-ascii?Q?Vkn58isb9rM6TmNeqGCJPSgPDZdp4uNktynAx0x8nqehOBIeaUchqJnooPUx?=
 =?us-ascii?Q?y7PyHIF1EACLte+jjO/qC5D14aDzW65gv9Pq1Umo7+gG3P+U2usxOXPlpIMe?=
 =?us-ascii?Q?nHSsT2T4Y9nj5seHHq81rW/KmwAaux14jSxLIN7gxo7SxhSCbeeyWPBySbaM?=
 =?us-ascii?Q?7iuZaFTEp9z39QiKFgmMgwhV6Jf67z1JDmhmWFamRP4JK2l3zUiT1EmLWFos?=
 =?us-ascii?Q?N1VGa5C9K6cOKniQw7GnfDkMyjpQwrOEW4fvoqzJkfx3mRI3/FN0FF2MqYEg?=
 =?us-ascii?Q?0zHqtWtvl5S4J4S72HPG+CReFsaDmuA4+UHD/UY4ZrR7i9sfvFb078NgZ2fQ?=
 =?us-ascii?Q?XnGqCQhMWTDsCIdQoUa9s/Fa4UDxBMV52OvfEl5zkXC2hErE1Q9227Z1/fj0?=
 =?us-ascii?Q?Uy40PyYqNwN7SxVasGKHD6wBrIEdrzxuari5s7cPzhJtH8lUr+mMfUMKgAsK?=
 =?us-ascii?Q?DwBG3ymZEHhYDSh0pEZihA5qjqBy9vYLIZPrKw3GIPV4fWgZwm7LiV3+elZ3?=
 =?us-ascii?Q?R+f9K+C8J2WFHNBQa7y9lY6Fm2u928+F3yLMOj7gxwncjS/S8pgb0TWl1UqD?=
 =?us-ascii?Q?gwEg1anihAwT3QwI3Fn3LP32rbmFuJVgS8o9eNC3b2z7CDlWFo4zUxhy48nA?=
 =?us-ascii?Q?+OWdmzmBwxbPOYbCsog8tFei52EaTnR2tm10+voyQHI7bs575BXNMGQvOORv?=
 =?us-ascii?Q?I15n3eNZDPDT86QrVeE8Kqo40few90i8TkSd9knZm5E3taY5vQHe1biye+q8?=
 =?us-ascii?Q?x5sOUCcJZBz2A2xZQw6zpL6ad8MuYMeBQRzYYbsjYliJtoP3p0veDm6lEkRz?=
 =?us-ascii?Q?pOof4iz7WnD3+pEOJ9Y8FNAR14Xeia+iMtllJvzp6h3/xG6dmL5lJhYNTBcv?=
 =?us-ascii?Q?rBYrQCOrVPgTRl8oZOubGZ/hW20csuCW3PD8AVDMeR46jGn+/LtWpYNhJlfN?=
 =?us-ascii?Q?+sTm7QxbOtvJr4cwiBZggW63bBC90G/9LRUNWFCZE7mfwmetdZTzUh+JDRje?=
 =?us-ascii?Q?mLBKE4F/lYx83Qu2jec7Guussma+O/Jod+TexZToFuETkWaznLgy8dxGwI/t?=
 =?us-ascii?Q?pR6vuGUiGntCl1HrZ/qrCK/CClVHaY6/+9uGzFfTxz1Atpi9b4k6pmw2gt1y?=
 =?us-ascii?Q?J9xHKey/IBlVssWetVE5yYXEII8AHbl83ADQRsvPAcex7uOr6wnASNg4swLU?=
 =?us-ascii?Q?or6IjBvvBk2igqsZElmLltVYhpjNHBEQJjkJ2Np9Zdtwc52MmYJHHH67+s5H?=
 =?us-ascii?Q?thBQRM0Q6SWvISX4/B+HXlllf7aO/XSRmdS31CO8IhhjfivuVE/8JhvlX7zc?=
 =?us-ascii?Q?9mLKLu9ArEt3GFEBlJt9DYCDSYLQo2WVxfxrTTonmAiZQ/BT4IZ6?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 390d43f4-5280-43a3-193a-08debacc9ad9
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 02:15:06.8976
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F4k/1FH0wmmLsFSJOmqXjM6z1rhVHWS7E4b07BwEtl54WLP0wkgz07XMzqykqHTrfoYzoa1odDaRIZCj2evDkkGrDS73PYneG/My5dXM9EDz8Ud3BTZauR63RrHgLs02
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB14087

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/cs35l33.c |  6 ++++++
 sound/soc/codecs/cs35l35.c |  8 ++++++++
 sound/soc/codecs/cs35l36.c | 12 ++++++++++++
 sound/soc/codecs/cs35l41.c | 10 ++++++++++
 sound/soc/codecs/cs35l45.c | 10 ++++++++++
 sound/soc/codecs/cs35l56.c | 10 ++++++++++
 6 files changed, 56 insertions(+)

diff --git a/sound/soc/codecs/cs35l33.c b/sound/soc/codecs/cs35l33.c
index f49edb9ea1f2c..0d291bd2387ea 100644
--- a/sound/soc/codecs/cs35l33.c
+++ b/sound/soc/codecs/cs35l33.c
@@ -662,12 +662,18 @@ static int cs35l33_component_set_sysclk(struct snd_soc_component *component,
 	return 0;
 }
 
+static const u64 cs35l33_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A;
+
 static const struct snd_soc_dai_ops cs35l33_ops = {
 	.startup = cs35l33_pcm_startup,
 	.set_tristate = cs35l33_set_tristate,
 	.set_fmt = cs35l33_set_dai_fmt,
 	.hw_params = cs35l33_pcm_hw_params,
 	.set_tdm_slot = cs35l33_set_tdm_slot,
+	.auto_selectable_formats = &cs35l33_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static struct snd_soc_dai_driver cs35l33_dai = {
diff --git a/sound/soc/codecs/cs35l35.c b/sound/soc/codecs/cs35l35.c
index b2439ec3c19fb..f4f844cafd68d 100644
--- a/sound/soc/codecs/cs35l35.c
+++ b/sound/soc/codecs/cs35l35.c
@@ -657,17 +657,25 @@ static int cs35l35_dai_set_sysclk(struct snd_soc_dai *dai,
 	return 0;
 }
 
+static const u64 cs35l35_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_PDM;
+
 static const struct snd_soc_dai_ops cs35l35_ops = {
 	.startup = cs35l35_pcm_startup,
 	.set_fmt = cs35l35_set_dai_fmt,
 	.hw_params = cs35l35_hw_params,
 	.set_sysclk = cs35l35_dai_set_sysclk,
+	.auto_selectable_formats = &cs35l35_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static const struct snd_soc_dai_ops cs35l35_pdm_ops = {
 	.startup = cs35l35_pdm_startup,
 	.set_fmt = cs35l35_set_dai_fmt,
 	.hw_params = cs35l35_hw_params,
+	.auto_selectable_formats	= &cs35l35_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver cs35l35_dai[] = {
diff --git a/sound/soc/codecs/cs35l36.c b/sound/soc/codecs/cs35l36.c
index 89645327945f1..170588be4dbe3 100644
--- a/sound/soc/codecs/cs35l36.c
+++ b/sound/soc/codecs/cs35l36.c
@@ -947,10 +947,22 @@ static const struct cs35l36_pll_config *cs35l36_get_clk_config(
 	return NULL;
 }
 
+static const u64 cs35l36_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_GATED	|
+	SND_SOC_POSSIBLE_DAIFMT_CONT	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops cs35l36_ops = {
 	.set_fmt = cs35l36_set_dai_fmt,
 	.hw_params = cs35l36_pcm_hw_params,
 	.set_sysclk = cs35l36_dai_set_sysclk,
+	.auto_selectable_formats = &cs35l36_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 #define CS35L36_RATES (		    \
diff --git a/sound/soc/codecs/cs35l41.c b/sound/soc/codecs/cs35l41.c
index b2a076706c796..d286025183f46 100644
--- a/sound/soc/codecs/cs35l41.c
+++ b/sound/soc/codecs/cs35l41.c
@@ -953,11 +953,21 @@ static void cs35l41_component_remove(struct snd_soc_component *component)
 	wm_adsp2_component_remove(&cs35l41->dsp, component);
 }
 
+static const u64 cs35l41_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops cs35l41_ops = {
 	.set_fmt = cs35l41_set_dai_fmt,
 	.hw_params = cs35l41_pcm_hw_params,
 	.set_sysclk = cs35l41_dai_set_sysclk,
 	.set_channel_map = cs35l41_set_channel_map,
+	.auto_selectable_formats = &cs35l41_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 #define CS35L41_RATES (		    \
diff --git a/sound/soc/codecs/cs35l45.c b/sound/soc/codecs/cs35l45.c
index a032bb23b4ac7..25a9eb916fa39 100644
--- a/sound/soc/codecs/cs35l45.c
+++ b/sound/soc/codecs/cs35l45.c
@@ -846,12 +846,22 @@ static int cs35l45_mute_stream(struct snd_soc_dai *dai, int mute, int stream)
 	return 0;
 }
 
+static const u64 cs35l45_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops cs35l45_asp_dai_ops = {
 	.set_fmt = cs35l45_asp_set_fmt,
 	.hw_params = cs35l45_asp_hw_params,
 	.set_tdm_slot = cs35l45_asp_set_tdm_slot,
 	.set_sysclk = cs35l45_asp_set_sysclk,
 	.mute_stream = cs35l45_mute_stream,
+	.auto_selectable_formats	= &cs35l45_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver cs35l45_dai[] = {
diff --git a/sound/soc/codecs/cs35l56.c b/sound/soc/codecs/cs35l56.c
index 80158913a60e0..ef215229aa5bd 100644
--- a/sound/soc/codecs/cs35l56.c
+++ b/sound/soc/codecs/cs35l56.c
@@ -560,12 +560,22 @@ static int cs35l56_asp_dai_set_sysclk(struct snd_soc_dai *dai,
 	return 0;
 }
 
+static const u64 cs35l56_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops cs35l56_ops = {
 	.probe = cs35l56_asp_dai_probe,
 	.set_fmt = cs35l56_asp_dai_set_fmt,
 	.set_tdm_slot = cs35l56_asp_dai_set_tdm_slot,
 	.hw_params = cs35l56_asp_dai_hw_params,
 	.set_sysclk = cs35l56_asp_dai_set_sysclk,
+	.auto_selectable_formats = &cs35l56_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static void cs35l56_sdw_dai_shutdown(struct snd_pcm_substream *substream,
-- 
2.43.0

