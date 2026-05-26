Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011000.outbound.protection.outlook.com [52.101.125.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86F542E888C
	for <linux-sound@vger.kernel.org>; Tue, 26 May 2026 02:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779761962; cv=fail; b=oJYRRaoBDC0qPLFs1ZPPFNWdxb0ee5m8NKAirF50KBGkxMcPorVv6072NxWJkMkW197lgP3r6mXjAXK7bGApOc8eIcMXW8dkYHKEh7ppaSQHJg3IoYBoOiwxPAITUuAzEb13IHa4qEfuV4lUE5QT2DJIHxbev9UKiG7pUwsrers=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779761962; c=relaxed/simple;
	bh=S02TkYkAEHOX/hUrvXKJlObktlYydmsOELKFbROXkH8=;
	h=Message-ID:To:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Jn8DkqqfpLwJb4P/dCyMmt5kVajc4fVuEmLeGadWJf0doKeFiC5ul7mJmFBzvmc/28E9IE6ZpKGmjnDy0SBQZz6T0Vhu65Af859i1sL9KjD8mcVMIHbxFLiSozAI0azdJUBhpa6RamzttcpOTYFeErAd0V04lLUhPnFqqgKvBnY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=AfLzOtjf; arc=fail smtp.client-ip=52.101.125.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="AfLzOtjf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O+k/GiT1dSR/SOJ1b7tKvtRtuULHYDc+X1ib1PSmxzs+urAu+IufhHyQAVkfcuhLp2+Gq9z9dqasLKcXuhF8RvGC4WaJyIipuww2IxSYd9NbLNiuNrFQImLygZSCE8KdykbaOUcttMCEOFV+Rxmgz2XH8UGCR+O3TnGcyd+No28ZFutXLYzMmurDjOV5iKFigJfdhbAPkxQmqbgULjpL3HC0jNpcF3iEsggwHIPDPFEjjuJUYp5yDNCwDsWr6ksDJY2Nt8xpQaWLqudOGQ/paEJ4LUqs4mqcZXo+/pRI2KGe5d+VizDXGuhyHELnIaARfSdINJA9LcZOhoCRwuD2Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fjg0vPJ20J+zOG8qoPA4VtjIDKhUj+JBK14M0Rl2ajo=;
 b=hnXswapRK8H2os498pUyjh4zt0MpjzZMoQK0Y4uTKaIdgxgLhXlw/Y+X8fWpIPvBaA6EM+cGd3dx1rGv75XU5lG8JETclXNqAAHg6/+jxvDlgc+jXh6m3ZWiyy2TSIBSukhozFteTkICXBnYmFE+/83IuyUf1A6krW8ROrmu1LhlzsJX/nXKq327xlpPyYgsUx8v0MG4IEhkrj7cqYt41i2zY2g1WDlP5xg0EIvVS51Ax0qxINC4ccytA7KQmhw+fLt8oReuIewBp1ea3RQRniqK0u38cwrZApy6n8DTYk9mnUdRe/he+EHpAaZixW2duZXXcYatPohJtJElA6vPJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fjg0vPJ20J+zOG8qoPA4VtjIDKhUj+JBK14M0Rl2ajo=;
 b=AfLzOtjfh1OBuHJOwM5oZscFrPVjhY4IsnRcbxK9/KRxv297Nzl0VH2M6bFkJiE+dPhGXykWSJTBTALluszu9j+htZZGgBBfc8kLPmEzexD6IFkOpyBgxiON5/HvDnYyEWGDaVi1CH9IzEY0oGlmO3MRlGLBNLTtHVzguvyTLYw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TY3PR01MB11843.jpnprd01.prod.outlook.com (2603:1096:400:40a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Tue, 26 May
 2026 02:19:17 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0048.019; Tue, 26 May 2026
 02:19:17 +0000
Message-ID: <87ik8ahpzx.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH 38/83] ASoC: codecs: max*: use .auto_selectable_formats
In-Reply-To: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
References: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 26 May 2026 02:19:14 +0000
X-ClientProxiedBy: TYCP301CA0078.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7b::14) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TY3PR01MB11843:EE_
X-MS-Office365-Filtering-Correlation-Id: 04e2028d-2e0c-486b-09c0-08debacd2fee
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|52116014|376014|1800799024|56012099003|22082099003|18002099003|38350700014|921020|6133799003|11063799006|41080700001;
X-Microsoft-Antispam-Message-Info:
	il95tOEWCDEfN9o1nxFd00++ojsqwkxTPTgCFn7NfD9cAkFpoPgtJVNBNWfXoUZHWg9tN0r+H/qWYC1HpqC4JqCnjHFXV/7HAZpoPY9RgocmOBQiCTemjZqiFLLGvG+bToGoPsbjSfAnlTe9Xrw2bVpWcmkOEuhuJPlbeKup2klPUOf8qU3xZjMi4T92FcKLrAJDNhaVWg8XZzoVvAXHFKeippxqn0dzF939zKwb+Uz+im7ie2g6mMIMfPS6XsylVhLAtDxNoD+JBI7a4jP5h9/IMl6kEB7anbCFD1AnONcyfw5ekZ8CtSYLLyCg3YhJBrj8N0CJXQKplRxBNtqMYWh7z5VMPfLVMSREysLd0IWiJDqqsq71aDGcAhO5TNr45oXLnHU9YEuSAyuzS/43sVrq34ZJh3fHTXgCTnXZ7KUBzTFTgOQDIYv4amD/lAxgvyUBMcT8lxTxT1QzC/BQCr6NYB2mce7s0PGlw47T+4rYsdD5wosrY9IPkvJ59Ic3cwSzxraZwnKqKLCtnW/Bee68Z0cbI6mjPCOk7DzSszfc2UEPiL3uBczL3x4Kh/zCzNb6kB5ZgI0LhQXx2p5wT4CMY/qOoSukCVUoClnSDAMkpzpHBw884kmPGUyeoksgMWscfql4bYo42KlxIYl5ul1/AmCpKxQNGTJzDEEXQidkxdKXBqiYcqDSaetHIqvi8iVZbt0ioB3PJdfB1u5JAlaUpMuCukPhKQIxbQkUWdvhJRe6Rx4+uaP7AVjFo944ETVw+76ocqiIp6CO60Q+y05hiZVsG/nNgDrNqcuNywg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(52116014)(376014)(1800799024)(56012099003)(22082099003)(18002099003)(38350700014)(921020)(6133799003)(11063799006)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4OgjtS+IJPEHBjyQVPBLahdP04zgrU8MK0qJcTIovWDVye6SSlvHFBAiFTuj?=
 =?us-ascii?Q?J8mny+jv/927UFpuCESPgyb8cc2TVFn0R24v3qIVJGQjv7LWkK5pBXhrSuNQ?=
 =?us-ascii?Q?LSPT0vlRCkKq9DpN/jVRhIj1TFVbA9WntqAEiGj58ntD26fnvbSv4jrrh/Iv?=
 =?us-ascii?Q?5wmFofnziicKv1JdHjZ9ABozfhfCJWGuL2avLyY8JMIEEuw4PTOHAmQncENV?=
 =?us-ascii?Q?NykdSHeS/1AFbkgKIKpC3QYr7AOGdILh4lStndKeNM96vpkHmK10qSyON99i?=
 =?us-ascii?Q?dvuJKJzfNcO6rn4/1x2qGor3iVRJl6yv+Kb9QJytR4DfQkjRJ5b6tEBrG3tT?=
 =?us-ascii?Q?ZOW1Q5YSnSOLgn7BbiLdY6QTDLKJf4X7b2AI/YiZBzUkKZXEYn2Sc/itrlDo?=
 =?us-ascii?Q?8kaAf7Kz7YDe3N6VlhRVTHJZ8AG3KYn5fHH3Yhcx8B+9dPUFuJcngU6RVt0M?=
 =?us-ascii?Q?S3aukj2Qm893+7G+ALgk35jTW3ih44b5xOoBf1iY1mL3cgQ/bpPVPF2cbxQl?=
 =?us-ascii?Q?U24ahCpswqTS1zQ/rmzw8aIIXjU6KnG0qPo0blP5P8ri9ehm9gMwa2o0v/rE?=
 =?us-ascii?Q?YyR3GLT/o6T3J1j9CEo92/iF36toIDBCEH5uZ6CBJJcuHgAVW1BZ9YWmWuR3?=
 =?us-ascii?Q?DDTyZUliW7DWD/yMBWu1U7eXzfwmNVoocbyP0sc8tPhqmIjIqzXkG9gWmBGx?=
 =?us-ascii?Q?f3yKQETo10DQnW7zfKFayWN7JEADcgMxRKvsHNdVE6v9wy6RzSluPI8w2SbB?=
 =?us-ascii?Q?1nInUJD99q+KqoJ+AVKtxU64StJPaG9Um7/YbT9s8iSxesHi3PTgx1cIpgCb?=
 =?us-ascii?Q?9JF7iQNzemybwEFZt2ovyP6IjUz63pgwc0Ia3cLfCJyqLtgUAoGyGXLZaHCh?=
 =?us-ascii?Q?6UVA8QEz7kt/4qm4vuG9zHet6K4VfWTJJ2eG6M4m+627Fdh/8oa6TGBnrTWd?=
 =?us-ascii?Q?O3TWOuMFWt8Hrlb/h5faBBTcP9R8g2/v7iHhWzNHq/fsGSbhuE8a1C/kT2qw?=
 =?us-ascii?Q?zwwM127+Dj8nQGR0SUMb+IyECRVkxngYK+tXm8/a7skdxZD6Gt9EGd68b5WP?=
 =?us-ascii?Q?t4xt+NK1Z25L0vNoMRkhVrltM3oE2EC2Kw5L6VViiaKEP8DpG7VcYkMoVWj/?=
 =?us-ascii?Q?yCSlhYBVnIps5orUFRiqK8pHmwhNhUwiWZsoTiDcZvUy8NNWGCaTU0pGL2F8?=
 =?us-ascii?Q?djMAzrcEwlmjNn+VbrYYOAq2XayRWVhQD+vQPNaTTeLJOWpXBGOIO7CYwEnE?=
 =?us-ascii?Q?sPlcsfxjdM2fT9eycAlz57J2cGaLVfinb5tA5wPhcLicLom/t89nZR0prJ+L?=
 =?us-ascii?Q?ZxG54cwkoNmv5Qc3oWD4Qb5JMB/4489FwdW/HU4ySuFJxPOJX0F2B7T+8tpr?=
 =?us-ascii?Q?o2mcM7YSJhiw+z8YmYABKYHU5JWsuulP4473Hy0GWHcRRtiT4p5A4Mofsa+I?=
 =?us-ascii?Q?LUN/XxvXNPGYUjC0wsZj2RTFHfB7h64wFosBYnQ1XpegEhq49Cvf3Jfvx4W3?=
 =?us-ascii?Q?KIWONHBKKh4GkaXfhDVbOGybPpW/DDYN0sw6tDKZHuA+q46hHXvlwthH3tpe?=
 =?us-ascii?Q?35PWM0Tv94skKWbaam4c/1wCeXj3u636Y/5yEOn3LxcQwcCMD4s79YPH4Cji?=
 =?us-ascii?Q?3ZvOFqRlZxZXReqT8POL2enUI9exdem/2nITvCdkkCZuRfxsylclqJfTroU+?=
 =?us-ascii?Q?nse0UXZbA3MWJKfpsM7nVGLdTcmYgweq6HpwgqSO2yO2go3DytYcysaZbwsc?=
 =?us-ascii?Q?YJPdPchgr0s3mAI/m723L/louL6uN8HFSmnRtcyp+Oz1518HGWG3?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04e2028d-2e0c-486b-09c0-08debacd2fee
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 02:19:17.0296
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0WR8DoDJSFdTSnIlTdrXUDaYD0NFzeL7W9xBcWOHRNbPmnEJNKNX9O9KVBFgUdR4nErSVX7rEi/jMpndwPXOGvZDd4QT7iSWmAfsrmHOYo0CDWntPlK1UYq4E7aSpJfy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11843

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/max98088.c     | 12 ++++++++++++
 sound/soc/codecs/max98090.c     | 12 ++++++++++++
 sound/soc/codecs/max98095.c     | 14 ++++++++++++++
 sound/soc/codecs/max98371.c     |  7 +++++++
 sound/soc/codecs/max98373-i2c.c | 10 ++++++++++
 sound/soc/codecs/max98388.c     | 10 ++++++++++
 sound/soc/codecs/max98390.c     | 10 ++++++++++
 sound/soc/codecs/max98396.c     | 12 ++++++++++++
 sound/soc/codecs/max9850.c      | 11 +++++++++++
 sound/soc/codecs/max98520.c     | 10 ++++++++++
 sound/soc/codecs/max9860.c      | 12 ++++++++++++
 sound/soc/codecs/max9867.c      | 10 ++++++++++
 sound/soc/codecs/max98925.c     |  8 ++++++++
 sound/soc/codecs/max98926.c     |  8 ++++++++
 sound/soc/codecs/max98927.c     | 10 ++++++++++
 15 files changed, 156 insertions(+)

diff --git a/sound/soc/codecs/max98088.c b/sound/soc/codecs/max98088.c
index df438baf05dc3..1dd7881c84aa3 100644
--- a/sound/soc/codecs/max98088.c
+++ b/sound/soc/codecs/max98088.c
@@ -1342,11 +1342,21 @@ static int max98088_set_bias_level(struct snd_soc_component *component,
 #define MAX98088_RATES SNDRV_PCM_RATE_8000_96000
 #define MAX98088_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S24_LE)
 
+static const u64 max98088_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops max98088_dai1_ops = {
        .set_sysclk = max98088_dai_set_sysclk,
        .set_fmt = max98088_dai1_set_fmt,
        .hw_params = max98088_dai1_hw_params,
        .mute_stream = max98088_dai1_mute,
+       .auto_selectable_formats = &max98088_selectable_formats,
+       .num_auto_selectable_formats = 1,
        .no_capture_mute = 1,
 };
 
@@ -1355,6 +1365,8 @@ static const struct snd_soc_dai_ops max98088_dai2_ops = {
        .set_fmt = max98088_dai2_set_fmt,
        .hw_params = max98088_dai2_hw_params,
        .mute_stream = max98088_dai2_mute,
+       .auto_selectable_formats = &max98088_selectable_formats,
+       .num_auto_selectable_formats = 1,
        .no_capture_mute = 1,
 };
 
diff --git a/sound/soc/codecs/max98090.c b/sound/soc/codecs/max98090.c
index aaa34ba86802d..07b02e01638ec 100644
--- a/sound/soc/codecs/max98090.c
+++ b/sound/soc/codecs/max98090.c
@@ -2382,6 +2382,16 @@ EXPORT_SYMBOL_GPL(max98090_mic_detect);
 #define MAX98090_RATES SNDRV_PCM_RATE_8000_96000
 #define MAX98090_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S24_LE)
 
+static const u64 max98090_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops max98090_dai_ops = {
 	.startup = max98090_dai_startup,
 	.set_sysclk = max98090_dai_set_sysclk,
@@ -2390,6 +2400,8 @@ static const struct snd_soc_dai_ops max98090_dai_ops = {
 	.hw_params = max98090_dai_hw_params,
 	.mute_stream = max98090_dai_mute,
 	.trigger = max98090_dai_trigger,
+	.auto_selectable_formats = &max98090_selectable_formats,
+	.num_auto_selectable_formats = 1,
 	.no_capture_mute = 1,
 };
 
diff --git a/sound/soc/codecs/max98095.c b/sound/soc/codecs/max98095.c
index ced9bd4d94da0..326a09bb5addb 100644
--- a/sound/soc/codecs/max98095.c
+++ b/sound/soc/codecs/max98095.c
@@ -1412,22 +1412,36 @@ static int max98095_set_bias_level(struct snd_soc_component *component,
 #define MAX98095_RATES SNDRV_PCM_RATE_8000_96000
 #define MAX98095_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S24_LE)
 
+static const u64 max98095_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops max98095_dai1_ops = {
 	.set_sysclk = max98095_dai_set_sysclk,
 	.set_fmt = max98095_dai1_set_fmt,
 	.hw_params = max98095_dai1_hw_params,
+	.auto_selectable_formats = &max98095_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static const struct snd_soc_dai_ops max98095_dai2_ops = {
 	.set_sysclk = max98095_dai_set_sysclk,
 	.set_fmt = max98095_dai2_set_fmt,
 	.hw_params = max98095_dai2_hw_params,
+	.auto_selectable_formats = &max98095_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static const struct snd_soc_dai_ops max98095_dai3_ops = {
 	.set_sysclk = max98095_dai_set_sysclk,
 	.set_fmt = max98095_dai3_set_fmt,
 	.hw_params = max98095_dai3_hw_params,
+	.auto_selectable_formats = &max98095_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static struct snd_soc_dai_driver max98095_dai[] = {
diff --git a/sound/soc/codecs/max98371.c b/sound/soc/codecs/max98371.c
index c8d4c68af5623..b62bd98f2252a 100644
--- a/sound/soc/codecs/max98371.c
+++ b/sound/soc/codecs/max98371.c
@@ -322,9 +322,16 @@ static const struct snd_soc_dapm_route max98371_audio_map[] = {
 #define MAX98371_FORMATS (SNDRV_PCM_FMTBIT_S8 | SNDRV_PCM_FMTBIT_S16_BE | \
 		SNDRV_PCM_FMTBIT_S24_BE | SNDRV_PCM_FMTBIT_S32_BE)
 
+static const u64 max98371_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J;
+
 static const struct snd_soc_dai_ops max98371_dai_ops = {
 	.set_fmt = max98371_dai_set_fmt,
 	.hw_params = max98371_dai_hw_params,
+	.auto_selectable_formats = &max98371_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static struct snd_soc_dai_driver max98371_dai[] = {
diff --git a/sound/soc/codecs/max98373-i2c.c b/sound/soc/codecs/max98373-i2c.c
index 20de379d08de2..3e848b31d5c0b 100644
--- a/sound/soc/codecs/max98373-i2c.c
+++ b/sound/soc/codecs/max98373-i2c.c
@@ -399,10 +399,20 @@ static int max98373_dai_tdm_slot(struct snd_soc_dai *dai,
 #define MAX98373_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | \
 	SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S32_LE)
 
+static const u64 max98373_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF;
+
 static const struct snd_soc_dai_ops max98373_dai_ops = {
 	.set_fmt = max98373_dai_set_fmt,
 	.hw_params = max98373_dai_hw_params,
 	.set_tdm_slot = max98373_dai_tdm_slot,
+	.auto_selectable_formats = &max98373_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static bool max98373_readable_register(struct device *dev, unsigned int reg)
diff --git a/sound/soc/codecs/max98388.c b/sound/soc/codecs/max98388.c
index 2576841b7de21..7d62b2d6d847d 100644
--- a/sound/soc/codecs/max98388.c
+++ b/sound/soc/codecs/max98388.c
@@ -777,10 +777,20 @@ static int max98388_dai_tdm_slot(struct snd_soc_dai *dai,
 #define MAX98388_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | \
 	SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S32_LE)
 
+static const u64 max98388_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF;
+
 static const struct snd_soc_dai_ops max98388_dai_ops = {
 	.set_fmt = max98388_dai_set_fmt,
 	.hw_params = max98388_dai_hw_params,
 	.set_tdm_slot = max98388_dai_tdm_slot,
+	.auto_selectable_formats = &max98388_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static bool max98388_readable_register(struct device *dev,
diff --git a/sound/soc/codecs/max98390.c b/sound/soc/codecs/max98390.c
index 2bbedf84ee5d0..cccd395534984 100644
--- a/sound/soc/codecs/max98390.c
+++ b/sound/soc/codecs/max98390.c
@@ -462,11 +462,21 @@ static int max98390_dai_set_sysclk(struct snd_soc_dai *dai,
 	return 0;
 }
 
+static const u64 max98390_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF;
+
 static const struct snd_soc_dai_ops max98390_dai_ops = {
 	.set_sysclk = max98390_dai_set_sysclk,
 	.set_fmt = max98390_dai_set_fmt,
 	.hw_params = max98390_dai_hw_params,
 	.set_tdm_slot = max98390_dai_tdm_slot,
+	.auto_selectable_formats = &max98390_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static int max98390_dac_event(struct snd_soc_dapm_widget *w,
diff --git a/sound/soc/codecs/max98396.c b/sound/soc/codecs/max98396.c
index 9c1d7213410c2..fa5db92767f56 100644
--- a/sound/soc/codecs/max98396.c
+++ b/sound/soc/codecs/max98396.c
@@ -790,10 +790,22 @@ static int max98396_dai_tdm_slot(struct snd_soc_dai *dai,
 #define MAX98396_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | \
 	SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S32_LE)
 
+static const u64 max98396_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops max98396_dai_ops = {
 	.set_fmt = max98396_dai_set_fmt,
 	.hw_params = max98396_dai_hw_params,
 	.set_tdm_slot = max98396_dai_tdm_slot,
+	.auto_selectable_formats = &max98396_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static int max98396_dac_event(struct snd_soc_dapm_widget *w,
diff --git a/sound/soc/codecs/max9850.c b/sound/soc/codecs/max9850.c
index 9bd6a61212c1d..c229b732121fe 100644
--- a/sound/soc/codecs/max9850.c
+++ b/sound/soc/codecs/max9850.c
@@ -254,10 +254,21 @@ static int max9850_set_bias_level(struct snd_soc_component *component,
 #define MAX9850_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE |\
 	SNDRV_PCM_FMTBIT_S24_LE)
 
+static const u64 max9850_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops max9850_dai_ops = {
 	.hw_params	= max9850_hw_params,
 	.set_sysclk	= max9850_set_dai_sysclk,
 	.set_fmt	= max9850_set_dai_fmt,
+	.auto_selectable_formats	= &max9850_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver max9850_dai = {
diff --git a/sound/soc/codecs/max98520.c b/sound/soc/codecs/max98520.c
index 4fb98505db1a1..57759d85907be 100644
--- a/sound/soc/codecs/max98520.c
+++ b/sound/soc/codecs/max98520.c
@@ -326,10 +326,20 @@ static int max98520_dai_tdm_slot(struct snd_soc_dai *dai,
 #define MAX98520_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | \
 	SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S32_LE)
 
+static const u64 max98520_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF;
+
 static const struct snd_soc_dai_ops max98520_dai_ops = {
 	.set_fmt = max98520_dai_set_fmt,
 	.hw_params = max98520_dai_hw_params,
 	.set_tdm_slot = max98520_dai_tdm_slot,
+	.auto_selectable_formats = &max98520_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static int max98520_dac_event(struct snd_soc_dapm_widget *w,
diff --git a/sound/soc/codecs/max9860.c b/sound/soc/codecs/max9860.c
index 0d7ac37850bba..ebbfc4adae9a3 100644
--- a/sound/soc/codecs/max9860.c
+++ b/sound/soc/codecs/max9860.c
@@ -459,9 +459,21 @@ static int max9860_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	}
 }
 
+static const u64 max9860_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops max9860_dai_ops = {
 	.hw_params = max9860_hw_params,
 	.set_fmt = max9860_set_fmt,
+	.auto_selectable_formats = &max9860_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static struct snd_soc_dai_driver max9860_dai = {
diff --git a/sound/soc/codecs/max9867.c b/sound/soc/codecs/max9867.c
index 07a53ec2a18a3..f2214e3a19ce3 100644
--- a/sound/soc/codecs/max9867.c
+++ b/sound/soc/codecs/max9867.c
@@ -522,12 +522,22 @@ static int max9867_dai_set_fmt(struct snd_soc_dai *codec_dai,
 	return 0;
 }
 
+static const u64 max9867_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops max9867_dai_ops = {
 	.set_sysclk	= max9867_set_dai_sysclk,
 	.set_fmt	= max9867_dai_set_fmt,
 	.mute_stream	= max9867_mute,
 	.startup	= max9867_startup,
 	.hw_params	= max9867_dai_hw_params,
+	.auto_selectable_formats	= &max9867_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 	.no_capture_mute = 1,
 };
 
diff --git a/sound/soc/codecs/max98925.c b/sound/soc/codecs/max98925.c
index 4302ab16a642a..fe43ef99a0cba 100644
--- a/sound/soc/codecs/max98925.c
+++ b/sound/soc/codecs/max98925.c
@@ -484,10 +484,18 @@ static int max98925_dai_set_sysclk(struct snd_soc_dai *dai,
 #define MAX98925_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | \
 			SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S32_LE)
 
+static const u64 max98925_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops max98925_dai_ops = {
 	.set_sysclk = max98925_dai_set_sysclk,
 	.set_fmt = max98925_dai_set_fmt,
 	.hw_params = max98925_dai_hw_params,
+	.auto_selectable_formats = &max98925_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static struct snd_soc_dai_driver max98925_dai[] = {
diff --git a/sound/soc/codecs/max98926.c b/sound/soc/codecs/max98926.c
index 5305e1f9d97fd..d57620a3e958a 100644
--- a/sound/soc/codecs/max98926.c
+++ b/sound/soc/codecs/max98926.c
@@ -448,9 +448,17 @@ static int max98926_dai_hw_params(struct snd_pcm_substream *substream,
 #define MAX98926_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | \
 		SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S32_LE)
 
+static const u64 max98926_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops max98926_dai_ops = {
 	.set_fmt = max98926_dai_set_fmt,
 	.hw_params = max98926_dai_hw_params,
+	.auto_selectable_formats = &max98926_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static struct snd_soc_dai_driver max98926_dai[] = {
diff --git a/sound/soc/codecs/max98927.c b/sound/soc/codecs/max98927.c
index 65e6fdb30eec8..de3194eb8f796 100644
--- a/sound/soc/codecs/max98927.c
+++ b/sound/soc/codecs/max98927.c
@@ -463,11 +463,21 @@ static int max98927_dai_set_sysclk(struct snd_soc_dai *dai,
 	return 0;
 }
 
+static const u64 max98927_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF;
+
 static const struct snd_soc_dai_ops max98927_dai_ops = {
 	.set_sysclk = max98927_dai_set_sysclk,
 	.set_fmt = max98927_dai_set_fmt,
 	.hw_params = max98927_dai_hw_params,
 	.set_tdm_slot = max98927_dai_tdm_slot,
+	.auto_selectable_formats = &max98927_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static int max98927_dac_event(struct snd_soc_dapm_widget *w,
-- 
2.43.0

