Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011062.outbound.protection.outlook.com [40.107.74.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07D6B388E62
	for <linux-sound@vger.kernel.org>; Tue, 26 May 2026 22:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779835926; cv=fail; b=gZ6LOizvNbrTQKpy4OHWh1oXJmV7TRBrcj5fx9wGxGRBoa518BGH5yhpSwwL0x9otHSYcZjJNVmQd9Hb0JJWS0lyyI5KDTNcUJQdB5MliRdo5wRoK2IRGyZguJdOTyHstJNA2qQcL30skjjuG4yzxjv8Gd2XKhV6H77SGoin56c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779835926; c=relaxed/simple;
	bh=XBqekcdxqe5g60xsm0svgVErwCgIQgXbsLE477dRHG4=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=fjCuH/kr1sqBIGzJmeZVlpejSn8eoHn5Bmvb5vmc3TH7Pdmm2/hPqmNwpykKEXufO9I259/z0n29zTjdvyGidpxcelH7avslj1uTtpRuvxW4jNlRVi9s9DJe0Fe0eeI27nTTOaLlWdlQZTegd0quZzQYXoHdeR9ejdkwauFifTk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=j92LV6jX; arc=fail smtp.client-ip=40.107.74.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="j92LV6jX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oE3/cAJktUkHaURUtQ/G9vuSYrXrI8/m3V309fFAp64x0y/MyT9en8QFNN2LtAGWF6WyKP2CQ4s3eaQK21JgV2qik05ZE0/0z/CQyz+DtLV0cWRm10tFZkmyYqN5fmavLW53KyTXI/KhtPoSGvl0DuBiIoavhjCwXT9K+rXWc++iOlO0m4GyXZ/fum5nLekKeskamq6CXMJApMDXKhiL2DFwFZqN4QRM/TDlB6l9IpglMe74vEXyRI3HZwntVG+JEsamJB3EO0T1Yi/rztnhlh4nXxPGLSAcIywsVHAu9UGv57W0X/5lZ7q2+Dl5TNB8FmQVhOJoGLXsg66QwRnb0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KMx5bA4RInJJ3y42ytv8EZ1TnET/uWAWgWpsYbdfrGA=;
 b=kUYj4em7EZ1XPSyt3EwXZshr7mEpA/IkSbZvK5RV1fRG5K4XfmUWb5nWxEiQCA0n6zEVWGH0gZX6EBiUiuup30iupoolgQaEJ+5ZR0WRx2zXedW4DiG9bOeBm4V8Gf613MpskyNuJ3NCDJPtwW6/ZagywqINUAAnFHuGKff3oy9Q5nc5JpIRKpB6gEiFYnnQCOiMVoJ/BIrnRMxHQPSAQnsaqaEZ4CIcwPbAGG8Gtu1SYY0gBvkJ+88JLUZORF9BcTrUUcG6hpRfv/dBjVnQWRfGtHq4sqULSXH5R9owubwLenLF6vCrCn649r/qlnkapp94ifMd2cXAsHoT3Ct3tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KMx5bA4RInJJ3y42ytv8EZ1TnET/uWAWgWpsYbdfrGA=;
 b=j92LV6jXTkqP4xUb43swJc6NcIoZzeU76uPwfzyCt0rqUb7Ry+RD8lO0WKST3Xq3a8NQ3dzh80Fbn0VBxf3+wkoBkC1APwz13nX/cXNkjQHZitSSRyJvb+77KmUY29p8z0q4CTkXRXr6PA7c7acjgVntQD0n0AOIDTRJ9kAK6Ow=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OS7PR01MB14808.jpnprd01.prod.outlook.com (2603:1096:604:398::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Tue, 26 May
 2026 22:51:59 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0071.010; Tue, 26 May 2026
 22:51:57 +0000
Message-ID: <87zf1l9437.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: Re: [PATCH 59/83] ASoC: codecs: wm*: use .auto_selectable_formats
In-Reply-To: <1bbeb467-cf1a-4403-9ef3-62bc9006f47c@sirena.org.uk>
References: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
	<87o6i2gb9h.wl-kuninori.morimoto.gx@renesas.com>
	<1bbeb467-cf1a-4403-9ef3-62bc9006f47c@sirena.org.uk>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 26 May 2026 22:51:56 +0000
X-ClientProxiedBy: TY4P286CA0012.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:26d::10) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OS7PR01MB14808:EE_
X-MS-Office365-Filtering-Correlation-Id: 02a432b2-f3e6-4b47-b88f-08debb79638a
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|366016|1800799024|38350700014|11063799006|4143699003|22082099003|18002099003|56012099006|41080700001;
X-Microsoft-Antispam-Message-Info:
	lQgoog/q1D4KdZUybwXLJPsfOLd9tKZNy/MGT6w4nKfCBWiYFcgnQn3qeP1arIWGz73cqAF4MeHBruGia3wCfTKpguBs0D6fC7z4uLr83wZVm6Ukgdsf5ke5mKaxCdFgyo3x9BQjjCE6GfFJ5Rj3DoAShLSrTxyWbe0GlsglamwjvXujLsiac7UQMuEwMCDK5XEI2dImNfWKbyrA1In3rhAMBLxdM8r8M19d4o0FujE0hDsHpP+1Yvny2dQkGAxXOMTuoGYtpDd0vlX6k9jETZpA0aUoQ5Siv7TEOmZo07Lntl/3gfu9vOza2v+DkfQu1poqnIEiFAOgylkWcwXtlxyLLsBKlzGBZDYzoaRb9XarxXh+8Eipw6yPM6CvvUHtLN3DOcO3L+QrgiXjJoRm5Kda5WlcMgUp/RbN82ereZIQ8vEHUYS/hC6wOiWKKVPGx8KGrKW3YKfMEYtIahdLwSSyOrhPK0qWmRXSWdb9z79ABCz2g9bcgPYdPGiH+eT5VbWvT4TTY7JDPyC2q+bRUJgRq6qSaySdp79DpsJrIZzbiRkjCR8tM7WqY03BOdZuUzRoPU8+Z12CFDjRZWL0OnmG/CYYDno3bEmloMyLUQQoAxkodt+gJoi3YMMaZuPsfG5lSK7XAMMfmcvpg8d3sqs+JtlhWjkHrIlfm6eYYGOAEnzBRKyPr5xlCvzgYwIF/Fdx1cH9lLFrJYMn/tm/+tk4yHMgoRpiQytGzmDEW52RbWVBv3ly6TqBsG5C0z8ceMo+q+5l56l+lzZGwk5iwg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(366016)(1800799024)(38350700014)(11063799006)(4143699003)(22082099003)(18002099003)(56012099006)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ZyocDL7i+K1YGXA4U63MAYMqrBZYsc2cbpiRTYjd7MinN79mq0nHYOzwherG?=
 =?us-ascii?Q?4+DW9EttvKQGvI42jaWzr+0sZYjWgdkHU8+8TCcWWbthn+wLjB2k7EVro3nT?=
 =?us-ascii?Q?wMAjKVScjJFa+tjAORM3EAgfzDEa6HdbFQXuJni5TGFQ1unY5isMUY7SLaDy?=
 =?us-ascii?Q?nudO515tzKoL7+RX3o7X8fCGiap5Fv5ecZJz75O0Hk0cEDdFvFdmmrr1+job?=
 =?us-ascii?Q?NSMkxv4oIo24pa2HmBJfnwAaCebPiXM6j3i7yqXMmDBh7UfjWhcuFnCYfEXc?=
 =?us-ascii?Q?QNHV5lC/MbEWYEQGDMiF5NU3C6ruFvgtYqXCGnKOG1gg5+Ozq6jrR2R6ekis?=
 =?us-ascii?Q?w+0zGjZV9bZUcfHNycMU8wywGP3bVLm+yyauTSkNOBxBC9huAnWWqc9Jtuy3?=
 =?us-ascii?Q?RsY86kiEyuYCMV38EgfhQjG57mGGZKjzlLfryX4//BFrEKLAEd5s8mVtxcq5?=
 =?us-ascii?Q?i+EPViAcPc1Y1ZtrrbKiLG2hrrKxzH1PssTBKe8ajjWcdNA6vB0fytX28OG0?=
 =?us-ascii?Q?zRQ2IQNz6JlJB7OamngeCtw0BjaL4K1YYWhJE6DzZ1gsz7w4S33THJe19KYq?=
 =?us-ascii?Q?e0k1q/D7sQ5hXJ21i3DNO8fAVCFPMSORzT5d4qAtjDhJYZnncgxnhHz3uUFp?=
 =?us-ascii?Q?7L/YSgE8n+cGYoJy95v/lwyaAvUrURP49K0X+WgU04ko5ffIj5QYgaIAn5ie?=
 =?us-ascii?Q?XG4ZQa5pcNBO0evd/N/Gr62k/su1St7YU9VaEBaskT4dmLEy8uKisNehggDd?=
 =?us-ascii?Q?TRzIO0UtlKYKP4fSQhez5wBYdjyAdBVz6iR1PnCgCSEFjJkMlZjPm/4dwVyC?=
 =?us-ascii?Q?joQGM0WUt3Trd+wfdQ8bfn/A9SO6tpTb6ry/0QyyhPlJCoq4VpEa2FbanskD?=
 =?us-ascii?Q?7CTEYU+UsT+qNs2J4xLg0yjcZTbf3l4+yIKfkJLunSwffn5CS5gaP2CYiSEk?=
 =?us-ascii?Q?AlQXoI95AJkaZ0Hb7cQtFPT+kmquo+m4D18jUyTBbZyoOukjOhaxzfU3BWdp?=
 =?us-ascii?Q?NfRED7pL4TbG9sZJcMWW1PiRuH2g+O3kndWiQoJjF+YjunZFrGBrS32CWksi?=
 =?us-ascii?Q?//Y+ePaMBWQiQsupDJFJyp1t3+SqFGVN4BYJM3w6DdirYPp7HliVGnQXPVOg?=
 =?us-ascii?Q?g+kOdVLhdFxq9VaJs2E9+c3V4M2XYLgqO0bKgVBNNKR4cK0wfmSC/yUozt9d?=
 =?us-ascii?Q?XCo0siWU4qJ116rd4AX8nXD+FcAxrkvynTjPDf+6pk9i9yb7aAvJ5uDGGmJY?=
 =?us-ascii?Q?zgMAA4PDko5KuA7z2UfD8YkDJ6n4nD5xwEndAJtaSC7ll8AtZTOP5FjrzH0J?=
 =?us-ascii?Q?sxkpXg6OaERroam65++hBUDilDZK7SEJAmn8V1WTFZFndchmAdcljK/EYBZb?=
 =?us-ascii?Q?DxKUjBJfBLHcmitJi0nnMMHR/ztj9YRz3VoELigmgtRQKVeTLWfztgswqV9H?=
 =?us-ascii?Q?652RVRDNdfnuuRb1A7P64WbJE3dllIJi9c8XrOhtM3xzYX9c9Dxo88YyFme6?=
 =?us-ascii?Q?5L7K/YweIW5KD6RYDa+d3Ljj2b9U4zo5Vo199UUXGhyYcu+rWDxzUKkGacaH?=
 =?us-ascii?Q?Yq3zcHRFf1tnKKVXjVpvIX+KLSi57pWK1mL8kxaT7yEWvn3cjl9inL3eOnle?=
 =?us-ascii?Q?lV+FlbZbqBYwNMR3S2D5PJVYWGcEMST2yCHEjhKAa7RdwWNjIUceP6Vu/nJG?=
 =?us-ascii?Q?cZZP75VHwq+qbqTBb5/wOq+zG7Magl1QgrshaHRCTcm0kqFPvqVYhCsmVsI4?=
 =?us-ascii?Q?fzujy5CKFRMj5GcrAHMQEGZjE0+KH0YaKa86OBwEYzzoRkLToI3y?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02a432b2-f3e6-4b47-b88f-08debb79638a
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 22:51:56.9717
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X3nD+U3Lmdf+OM+weUtYn/HktOS4epyGk24cb5ifvx4l7EWYuV/YgEKcTlEa/H5XK+IP7uoc4TdH3F3peJ1Nsipl9SjHc5AklKA6oCjIulgD1vex0ZJQ5w+enbBDjpOc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB14808


Hi Mark

> > +static const u64 wm8737_selectable_formats =
> > +	SND_SOC_POSSIBLE_DAIFMT_I2S	|
> > +	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
> > +	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
> > +	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
> > +	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
> > +	SND_SOC_POSSIBLE_DAIFMT_AC97	|
> > +	SND_SOC_POSSIBLE_DAIFMT_PDM	|
> > +	SND_SOC_POSSIBLE_DAIFMT_GATED	|
> > +	SND_SOC_POSSIBLE_DAIFMT_CONT	|
> > +	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
> > +	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
> > +	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
> > +	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
> > +
> 
> This is way more than the device supports, AC'97 and PDM both jump out:

Hmm.. indeed. v2 will be

	static const u64 wm8737_selectable_formats =
		SND_SOC_POSSIBLE_DAIFMT_I2S	|
		SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
		SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
		SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
		SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
		SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
		SND_SOC_POSSIBLE_DAIFMT_NB_IF;

> Looks like we need a bit more checking of the formats.

Thank you.
This is not super important patch-set, but are wide.
I will post v2 2 or 3 weeks later.


Thank you for your help !!

Best regards
---
Kuninori Morimoto
