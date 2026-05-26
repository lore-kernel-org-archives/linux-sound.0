Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010011.outbound.protection.outlook.com [52.101.228.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BAC02E091B
	for <linux-sound@vger.kernel.org>; Tue, 26 May 2026 02:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779761419; cv=fail; b=YZp0TZSSY5jZIWa1MAnWS+zN4OYQMmeqj1Oq+g6ekMaENkXkLluXOams3TVLeYgk1tNF4Odb3wkAkV4pUx8yXt5IP2ljgayemD/VF3QmfOLH2wJaEbo7KyU6klOWgMT/8HwJirU2nwhpNM2Msx9s2uL2fCpznpVGwSZ/pDEB2rA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779761419; c=relaxed/simple;
	bh=ppAuF7JFlDEYhu+eFR/mgl52xTt9tpSck2JL187NeB8=;
	h=Message-ID:To:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=g9MnvpAAMM3vFPylrRenqWIPWU20FIcshjA6fdAZFeZUNbvSXRTvLWUdQ6jlu58fSzxeYLK4FeQcDnS5ZTM+HlR7lulOOSBmKa0dC5IzFNbV10wG2SIMgfTdMpN9etGeay++2QSwNj93irJwphFJGtjom8k9D+6rQvHKVbB1LMY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=KEfFsKrH; arc=fail smtp.client-ip=52.101.228.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="KEfFsKrH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nOgC7X5n52iuq36iZFrDcItI4j+GzqGFMAOMEN8de7aeDWeN+ZvIJ8NOnZp+bExiMUQdoKO/3kLFWfM+mMQertsgsTl18KbAoGJPA8fHv5HeaomSW/PKSkbsLV+TjqT7I77fCRMZLHuX+hJdWkcQKt5Rfz/1IgF7dwFzlelsKbF6+vmeawUuSTPNSCfswhcpc1hXt/xGJQMeKregUxDp6Qr4tiaHQLrkfa4YTL9d7AwwXX8ALqCjQyI/gPvdcgLUtg7bWJJ0ESk2d9so5Yiv0U3SUzn2K337SBvOpw9AcV5q4EgL7rofelgMArg6OzCSxOPZ2PjrJoz7uHLaP4ArpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ryHxwftXgV5tQSg52CPdIVIjsFuxuDM18tAVZr39u3k=;
 b=BPnOsQI5GAvhNADAMLbKvBUyR+UITcWZD1wOD3mOckKd+JatLA2tBF+lQcN7oT2QMhYkqiRfZiyPWA28GI7PQKh2MyvIzeo1iaLeSuYF0zq1SjH1yDB9WvM3BjYB59nahk/6PhEp1HwOWkxWL70krkV/f5gBdVW05Mj0EkDd5Ct3zWp7+YImS+wGhDNvRMDpzCccfYiTlVnolJd/Jz2AkZgiMfsAeT3AkAPoXDGFmN5Jmc2SfRjCmTD4yr+JK9NCYKC7RwY6DsAWTi3hf6ChYydUR5xPNA3ZpEM85o7E4U/JX4RO5n1wWv/kBolBenkZgnq6xYcS/68uZfNOy6iNhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ryHxwftXgV5tQSg52CPdIVIjsFuxuDM18tAVZr39u3k=;
 b=KEfFsKrHXYGxVgHemnIRfTLqeVrNIly1qZY7Vbl8VfXw4EE/YVXWfntlDQwm12gTqrYWqtVYPOJKv4QLKaEam2qM9rIPaM1reOs3zNpN0cZLRzUzWx8ZIBEE1IxqYUPzvtfYDWFQF4og8n+gvzHOcTzyi/kdHX4UH2hLYgtUzZU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYRPR01MB16271.jpnprd01.prod.outlook.com (2603:1096:405:2ed::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Tue, 26 May
 2026 02:10:14 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0048.019; Tue, 26 May 2026
 02:10:14 +0000
Message-ID: <87a4tmj502.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH 19/83] ASoC: codecs: adau*: use .auto_selectable_formats
In-Reply-To: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
References: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 26 May 2026 02:09:53 +0000
X-ClientProxiedBy: MA5PR01CA0082.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1ad::8) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYRPR01MB16271:EE_
X-MS-Office365-Filtering-Correlation-Id: 9978423f-b593-4cd9-02c7-08debacbecad
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|7416014|366016|921020|38350700014|56012099003|18002099003|22082099003|11063799006|41080700001;
X-Microsoft-Antispam-Message-Info:
	3plUfjylP2STFEuXruNoxf0p+CblE51a7CJ4jqadeWiKN3YpfwOL9qyKjCsLenX2p6bRTYWJCFBM6zwuPppGjT/rv7VqTcPmd/Q25JIsywKkiA60Rc2UAOwy75uU6S6cp6zCWyP32RMHxToU8Q+W6ZoFaJgYLmTc2sCkjizK/tPuoheVGoBAwOZMIXhtH/t3/L+aRNzEcmS6f+m9ZExOam6yJ2LHmcWe1hrkqn+QcNOAwjz6UPE7QIJwp5C7m5iTmGDP7Lg7lLLjLcNucsJcuxBh6fYUEyhPzQMLMr4aQ2xIBxTY1CEL6t7GS67mAXDIkpzQCVPt+GJtXTTRVvI2zqSwaAIvo/s8duF8pb5I1DNckwMyhw8uEZWNAUchlg0m4WQFhKI7gKmhWGyAJUWHSjtO3ih8vfSkYK9GDoW4MN7ol5zDh0HSliVL2lvGdQiWxj6qV15bdybq4LVd3GRxIFESnEYAmuHV3McHjjz7U+GnAaUhgZwOh+V4lYzr+ojxAW49lvhs8JDx8n/wR4unCZiTu8bn0nXpLCTbaZe1cebLojDHWQiUfGKuX7HMGvGcrhm36CN0U+5V1fp+YYyHBLj2O3uJi4xzoO0WPcoGRg0C3tsLcwEevSih1Kf3flmRqHxkC667xYaT2DuxN2F74zqFsMm1OUSnQOAy5U8OoSnjaN3FbjszXXo1l8/K+TxVdpvRWwCOvjOoHUGWu/hCWM0zwsNG8HMrXSvmy1xLzfVC47UBDjTS0JFV6B/GqzPd/OUM674DNpC+huQqmvWOrpLki+t/liOBJkHc776dTUY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(7416014)(366016)(921020)(38350700014)(56012099003)(18002099003)(22082099003)(11063799006)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jyL2J6QbvaHpyMU0EwdkOt8GNjtzDhcyhV2qTvI79tZrGzx0hx40aqjqMJAR?=
 =?us-ascii?Q?/T6oYGI/ACVGGeOVR9VGAcY2vIRGAkyZ53yPgPLAxX9TB5Fa11ZnHusWG3bR?=
 =?us-ascii?Q?NRBHvmiZKQjJVtpFK6Hy1t+t8waxYl2Hmc57yuCaSzd+XQOZ9cXvAyLN4CNu?=
 =?us-ascii?Q?21EmpGJqw/VFeufy8FEiYjuEzNHE1S6hrNY65VRXYWhh64R3VNYt4oLyE2/y?=
 =?us-ascii?Q?8Krnyq2nKrlzAMaV49sHE0iZI0X91/4ls41H+z/WAmojo0cPD6MDSww+YB0i?=
 =?us-ascii?Q?3BWBdc+SMeXn27lqSLWwTUsw6T+omJNe8/wwTZXexBfdPWmx7u1VwfcWk2Lu?=
 =?us-ascii?Q?mjYntwI4cxoUrrMGi6xnJb7krTtW22EuVm+MQ1FpsnvNCYq3Huyhb1j1IWmE?=
 =?us-ascii?Q?ULOE+/Pmcjmz2vakpkktgaD3AgMWEueDjDO3go3FvPpriljAcLwFbx/jo15q?=
 =?us-ascii?Q?oFX48QVycwf+F6ohS5XO0dToXq1StQXGrgXROP0nsEH+bz8ipDVnyQpWLIHl?=
 =?us-ascii?Q?qauOG9KRuLe6O2dbKWgiUHD7D5YUS0yl6PxmW0vSBLLHnp62dkasI9p4xPyi?=
 =?us-ascii?Q?iLp8nBMKFeIWR2wFWDYauinHsVTMTHm4aX5sEJY/+ZAqADIKucYByxNrF7q8?=
 =?us-ascii?Q?H44A/Hpva2CiPXiMcdsd9j+ZkNwfy1Da24sVMOuZYTikZSdI2vHPF145AMAw?=
 =?us-ascii?Q?nsICg13OnGQ0J7POuHEnGgQ7Q7FfwmMoLbg+Yw6TvmFfA/YrhwQudFvGTZC7?=
 =?us-ascii?Q?G3PNNepfq2duF8DXf2VUybG1qry++6oLIVqjEcsS3FK4ds8KeVUQ4nPmEKwi?=
 =?us-ascii?Q?E4hh7UGDReXh8Y+g/IBTZGRWX92NMjZxxGB/QYQ+hPBRtpkW9zt/PIygG4pW?=
 =?us-ascii?Q?7MIRabYv+FI55Hlt9//wijiMzsw6YTckzLSGm7AX870WzNVWgHubo878yykb?=
 =?us-ascii?Q?ehL0h3KEsArLPDgmpP51EQtmZfdHNI/VN2Zywzds0k8QxaK/lP8sN/848Cnu?=
 =?us-ascii?Q?T2JgCpJNiBKjgcJlc84D6jQh8LzVfvv578ZJwYcYWhmfs6v2yW8WNsIdI8Zb?=
 =?us-ascii?Q?caiJNWQTdp9kHNJ7f4fsu1qAK/i+rSBALoItk56s5LKvCpetygFP9+us+q1o?=
 =?us-ascii?Q?vHqillQeRkeEdb2a1+kv2g2v9PsyXbReMSV71tfJj0Sk8XsS5n3F90IZQQUB?=
 =?us-ascii?Q?X7SJjeZH2xcEnlrOy1z8NBftqZfjLCMqXEpEGqeA/h0cx4ItUosx0Ut0WLfx?=
 =?us-ascii?Q?RydZSiF1Sti/rGJ8JMnDerd/K/CYZ3HC7msGQiHPmINgs21XzjcHDatxyYuB?=
 =?us-ascii?Q?Ldi/RAhcI+9dWTNYR5m6K9U2C3Oc6flBQUAoHAdI+Hjw9pLb4sPL5x9bp11/?=
 =?us-ascii?Q?O924Khn/cy0sgcWKISlcCGTUWhVge/xnkwIO/u/HRWojzcPcTKODFueg3hj2?=
 =?us-ascii?Q?cbmb4rFmohlgv+AwpY27wHW58TVK6a9m2C40svARhKVGLfg9jKFit+rGRYF1?=
 =?us-ascii?Q?SFahKBV3GDGT4f0haY4Wa2sgAod5mjB9+FGxC7Y/KUtYl9U7udt3W8JNIOZr?=
 =?us-ascii?Q?289VhvINM+UIdPwuMtc52BmALbSQQnGmotY4bRwUFTaVWhsL+L6UqdlO0W5A?=
 =?us-ascii?Q?1VHl7DVosAjeUvag33EgVLqqxp/zvSxbWVH9POrwgHF9kx9S4G85ZMTstgEy?=
 =?us-ascii?Q?qdJGKA28qoWW/h2kyRMqBpjfjdfl3HIR/1PiJAec8QpZAl5GoMbFr2c/KRSK?=
 =?us-ascii?Q?KbaLD75MZ0q8hsiynaiFW8Tnqd/GcDHj1QJgF+hYOVSyCd0xPoAI?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9978423f-b593-4cd9-02c7-08debacbecad
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 02:10:14.6676
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8Bd4IrA5PWypKQmKHhKqmdCOmLxgGsuoshJ1fiJgaUgUNzZmijNiqxlAbb+dYk7xLsg3lelKNLdRmp5mwOWRHbu05FDNTHtfIzuiBquaByc4JLx+1Ea1Zq2phMpN3t3H
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB16271

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/adau1372.c | 12 ++++++++++++
 sound/soc/codecs/adau1373.c | 12 ++++++++++++
 sound/soc/codecs/adau1701.c | 11 +++++++++++
 sound/soc/codecs/adau17x1.c | 13 +++++++++++++
 sound/soc/codecs/adau1977.c | 13 +++++++++++++
 sound/soc/codecs/adau7118.c | 12 ++++++++++++
 6 files changed, 73 insertions(+)

diff --git a/sound/soc/codecs/adau1372.c b/sound/soc/codecs/adau1372.c
index d7363f9d53bb3..7494034005356 100644
--- a/sound/soc/codecs/adau1372.c
+++ b/sound/soc/codecs/adau1372.c
@@ -877,12 +877,24 @@ static const struct snd_soc_component_driver adau1372_driver = {
 	.endianness = 1,
 };
 
+static const u64 adau1372_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops adau1372_dai_ops = {
 	.set_fmt = adau1372_set_dai_fmt,
 	.set_tdm_slot = adau1372_set_tdm_slot,
 	.set_tristate = adau1372_set_tristate,
 	.hw_params = adau1372_hw_params,
 	.startup = adau1372_startup,
+	.auto_selectable_formats = &adau1372_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 #define ADAU1372_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | \
diff --git a/sound/soc/codecs/adau1373.c b/sound/soc/codecs/adau1373.c
index 5dd961b233ce9..aa7d3a4b9f588 100644
--- a/sound/soc/codecs/adau1373.c
+++ b/sound/soc/codecs/adau1373.c
@@ -1196,10 +1196,22 @@ static int adau1373_set_dai_sysclk(struct snd_soc_dai *dai,
 	return 0;
 }
 
+static const u64 adau1373_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops adau1373_dai_ops = {
 	.hw_params	= adau1373_hw_params,
 	.set_sysclk	= adau1373_set_dai_sysclk,
 	.set_fmt	= adau1373_set_dai_fmt,
+	.auto_selectable_formats	= &adau1373_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 #define ADAU1373_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE | \
diff --git a/sound/soc/codecs/adau1701.c b/sound/soc/codecs/adau1701.c
index 329ab01b62c00..505d52c636278 100644
--- a/sound/soc/codecs/adau1701.c
+++ b/sound/soc/codecs/adau1701.c
@@ -627,11 +627,22 @@ static int adau1701_startup(struct snd_pcm_substream *substream,
 #define ADAU1701_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE |\
 	SNDRV_PCM_FMTBIT_S24_LE)
 
+static const u64 adau1701_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops adau1701_dai_ops = {
 	.set_fmt	= adau1701_set_dai_fmt,
 	.hw_params	= adau1701_hw_params,
 	.mute_stream	= adau1701_mute_stream,
 	.startup	= adau1701_startup,
+	.auto_selectable_formats	= &adau1701_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 	.no_capture_mute = 1,
 };
 
diff --git a/sound/soc/codecs/adau17x1.c b/sound/soc/codecs/adau17x1.c
index 26d7eb437ad18..45ac226b2f1bc 100644
--- a/sound/soc/codecs/adau17x1.c
+++ b/sound/soc/codecs/adau17x1.c
@@ -776,6 +776,17 @@ static int adau17x1_startup(struct snd_pcm_substream *substream,
 	return 0;
 }
 
+static const u64 adau17x1_selectable_formats =
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
 const struct snd_soc_dai_ops adau17x1_dai_ops = {
 	.hw_params	= adau17x1_hw_params,
 	.set_sysclk	= adau17x1_set_dai_sysclk,
@@ -783,6 +794,8 @@ const struct snd_soc_dai_ops adau17x1_dai_ops = {
 	.set_pll	= adau17x1_set_dai_pll,
 	.set_tdm_slot	= adau17x1_set_dai_tdm_slot,
 	.startup	= adau17x1_startup,
+	.auto_selectable_formats	= &adau17x1_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 EXPORT_SYMBOL_GPL(adau17x1_dai_ops);
 
diff --git a/sound/soc/codecs/adau1977.c b/sound/soc/codecs/adau1977.c
index b42f35b1a6036..b9d9853934216 100644
--- a/sound/soc/codecs/adau1977.c
+++ b/sound/soc/codecs/adau1977.c
@@ -741,6 +741,17 @@ static int adau1977_set_tristate(struct snd_soc_dai *dai, int tristate)
 		ADAU1977_SAI_OVERTEMP_DRV_HIZ, val);
 }
 
+static const u64 adau1977_selectable_formats =
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
 static const struct snd_soc_dai_ops adau1977_dai_ops = {
 	.startup	= adau1977_startup,
 	.hw_params	= adau1977_hw_params,
@@ -748,6 +759,8 @@ static const struct snd_soc_dai_ops adau1977_dai_ops = {
 	.set_fmt	= adau1977_set_dai_fmt,
 	.set_tdm_slot	= adau1977_set_tdm_slot,
 	.set_tristate	= adau1977_set_tristate,
+	.auto_selectable_formats	= &adau1977_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver adau1977_dai = {
diff --git a/sound/soc/codecs/adau7118.c b/sound/soc/codecs/adau7118.c
index 5ddea63a6612c..9749299bc7f2a 100644
--- a/sound/soc/codecs/adau7118.c
+++ b/sound/soc/codecs/adau7118.c
@@ -418,12 +418,24 @@ static int adau7118_component_probe(struct snd_soc_component *component)
 	return ret;
 }
 
+static const u64 adau7118_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops adau7118_ops = {
 	.hw_params = adau7118_hw_params,
 	.set_channel_map = adau7118_set_channel_map,
 	.set_fmt = adau7118_set_fmt,
 	.set_tdm_slot = adau7118_set_tdm_slot,
 	.set_tristate = adau7118_set_tristate,
+	.auto_selectable_formats = &adau7118_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static struct snd_soc_dai_driver adau7118_dai = {
-- 
2.43.0

