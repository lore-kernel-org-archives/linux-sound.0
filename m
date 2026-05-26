Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010006.outbound.protection.outlook.com [52.101.229.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BE302F7F09
	for <linux-sound@vger.kernel.org>; Tue, 26 May 2026 02:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779762143; cv=fail; b=tqQ/1LWUF60i1s7UH/YErty0Papb1+j+vcf5XiNHHou/ud30nwcBeG0yrz/QHJzUMC6600oTR4Tr5VBg/DUHuN0B3UJSbwTmNbj0/hEkamiA1XI9Colhu+FUziE3mHwlpoMsjyoD4EijN53ZaMqh3AAXo9HJcFw6/r1CTW9moyE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779762143; c=relaxed/simple;
	bh=CblzlRAaFpRHfRWGw2FN7GRLkfED684ooLu14jLFGh0=;
	h=Message-ID:To:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=UGcZx4tKIeyoKR74SABM52fDK8TGafo77TqMp2JTDiZoIW4JxSIoL4rBIUcxtWA4I7Puh7m2PHwbg30BHMGVhULY8woPnscknMVrMWWwBhCM+Bm0LsRx4qIZUY8YMR+X2f6CBy0guuOCN7jnxb+5MTmWNDrlVifKhgy5W/ik0rM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=eHQgR52o; arc=fail smtp.client-ip=52.101.229.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="eHQgR52o"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SkFQtQxSNVSnVyruKBOfz9pmTcFyHvlgYm39IWcIw5njIm9eMs7IQFHopIbJuXTeyTlDOHBGEINAzvyfmMYd/JX3KzHLCpQBvIjtROp0m2QClunrYpsicLSepfxfLNloTZVWDftLBmzvvo4FxbRrLeDXf0FQmsz7SlXXP1fmMa3IH9sOdmXleQyNbPo3noHyTBC8n0pwy4We+rBkae6iAbQOpp/nYR8CMSebJQxXc4uYEtC1lNi/WScFj/d+VoRLxrAgalVvjrPClEl9Wgk3wzmIDTgnMw0ySmyftriAKiL5MaN1aHPMkMSqP22Doz+7kwZ7Bc5ol1+l6769HnPC5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C5OnNNWv4+3dFnkvr2VD0K4mwABFfbh1E14vCKJDwNo=;
 b=CPUoKP/1TddG2y85eV433Cgh4i4eePOMQ/c7XSiNMjUexK66PWeedvxgbl93Kuw+vHPvnjyDQByitVgMbnLcmvsBgD2EmyWovs/5cqEVjsEjZwLkUKHZFzVp+oBbL7+cAGvWYPDrDo3M+uyLeibd39zkqh2JOJr/EV5n4/yuYZ9C750cFXIKVprL3jsYSUX9Qei0WGuF7deZxY+7K9dK1obXClXq2X21sTY3v6HyfF+82R//2y2oV2z4f4Ci/YBmYm3OIqJSwpEudDTIWelWxcmT52rcbfKoHnr42L3bMs0uygJZywoB9aj30Xwc4Rb7ibl0Dw3tM8Esf2xM6YgFBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C5OnNNWv4+3dFnkvr2VD0K4mwABFfbh1E14vCKJDwNo=;
 b=eHQgR52oSC90KNc3JW5aV9lFvfaQp3YO7XUnt0zxtL6RxvSwyG5N7tHKZH222KAeDW1blIRC03B3ao3FoPAmtXgGGaDQf6Hvk0vs2bCLQmlWjSmyCfhfFoKUCT3fbW6lz81ZLC0gbsjiJ96k+zQEQ5ScHjdcej08l04bgqecxOU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OS9PR01MB13148.jpnprd01.prod.outlook.com (2603:1096:604:30f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Tue, 26 May
 2026 02:22:19 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0048.019; Tue, 26 May 2026
 02:22:19 +0000
Message-ID: <87v7cagbae.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH 54/83] ASoC: codecs: tfa9879: use .auto_selectable_formats
In-Reply-To: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
References: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 26 May 2026 02:22:18 +0000
X-ClientProxiedBy: TYCP286CA0314.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38b::18) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OS9PR01MB13148:EE_
X-MS-Office365-Filtering-Correlation-Id: da069e60-a106-496c-1045-08debacd9c8b
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|52116014|366016|921020|38350700014|11063799006|22082099003|18002099003|56012099003|41080700001;
X-Microsoft-Antispam-Message-Info:
	KtV4GGUsigy0JPW5oTo82pX7biWzLCO0zr23cyoRLglRDdzoGybzCE6HIJhaX/dyKn3MDKql4+jsELcizJKsxVt+dbNwxXjjeBLsxG9ykMm9kiEPL6kAOL8EZbx9shOHwu+QNyB1a5gkW96aSBj0nt19iZ2zNmeDkXClk2VEGU6HUENr8N7P45+wNUYVRa7J7/4WI8/8Jz2t/QX89pbMuSQJtVs9qi30WEjN4PMxpoAEHlkph6gbVzrdPQt85TmWSxPNexF1X9H4eBAlwhS/M5kwGnFcqvqbVsbrgTxgbdeCyIEMUVYtacYK1WC9vY8uw04MnAkbsIWAz7rSPJSDG3V4UJX7xojsbAeeOscxSwAsGKVXCCg6mx5VulXtMju2e50maBOzjOic4xMhkZfj4HaV/lfnRKKD3wSRpUpfCDSBSKlBZjRZB4hyWnFNC/lzoo+ulm4jzkDmVkdkDR1NsC65amDusP+9AoT6OJhjdxF6ykxherYgiXdoQcgakKowkkroNMRDbFVoMjFxywI/YPUrHpZW8dNWUcTDHWUpzzoPYFH0jlFyDh+bZD7u7FoQpCmbEKPX6WPebNC8z34XV2+B63iBlSACJX2U+FB+S/CbYhTpdfS7KacpMQS6wQVUMhtbIlJGhoI2zQvFScR7CGmKJjQwl87VELa/IKutNCTTXKRz3+67VutKz/f6AQf/e0A4HPY16y2/72XmRJyahHwvn68K4zvzIcgCPg/5qLpGPlsdzHJpDUIJxfY/Y769//qXj6eeHa9IDvUm3U79iWGSK3XzT36YLhLODzSFUw0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(52116014)(366016)(921020)(38350700014)(11063799006)(22082099003)(18002099003)(56012099003)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?epteGJdNS0M8/RZykgSGovQbk5364mSz4vrN4wevoe6GgIT32vrEPguhUllv?=
 =?us-ascii?Q?ZYeA3w7/yommll4OYz2RuQ80m5Lrh4zFMMLQb62daQR0T/zSa4n4a2jzq3W3?=
 =?us-ascii?Q?Y+XhgHqNGqoNrrIFzzNvMdwPuq8RLVS6IcTzwX/GWdvlEAPNMeDC+7qVyE8j?=
 =?us-ascii?Q?qNbhxkvJaq3AcjhfFZAQ4Pu/dH8x26qYfUshQBXU9UI2dMzqcl8CpsyEJrSH?=
 =?us-ascii?Q?j9QRfNqs+eW9OJZRINFh60Ke60ku0iD4RiOwm0WjBIW0QCWQjgHrTSFS1FL7?=
 =?us-ascii?Q?QExXT4jWQkK2QvTUGA9FxtYoRyHvofeNLZoXBemyG3bcne3scLn5as037hE/?=
 =?us-ascii?Q?xaKxJTBuESV4xovTOFU6saYajq7sEP6NOIJZaXIXIeTjDzHLiAlTx1uNW5I+?=
 =?us-ascii?Q?Iai93NDHTrm+elRf03xCKo57RiELt0NyNJy22TKsL5TX9sKnUogzqm4jEXY6?=
 =?us-ascii?Q?jscaYMdBGTESn7vaq8xn3immfs5MX1y7IiEe1nx4pxLxaxOs87SvE41nLpYA?=
 =?us-ascii?Q?2gAQmL7wpXyWGTpBVAO3/ibG3bFDzIkpNlY89Xd/aY/cQMTJTu6NujX16vUB?=
 =?us-ascii?Q?sWpRu2/tOnumUw/Xy7CDevBezEOEuPrgPphCk+jFS9ztXtJU33d7smVxkD8g?=
 =?us-ascii?Q?C3gKuQrSPOXDLf5jeVcu9SCvCYmw5A+MixRlRCNA0+emQvPrF6f8ucZGXCDZ?=
 =?us-ascii?Q?Gs9KpIPWUmZtUe0OkO1Y36C5aAH7dhIfO8g8P5w0AeZ/A5MtcxJrcKnziVW1?=
 =?us-ascii?Q?zPBEZ8jogDICVhfyPw1LfcshEr69bzwlN02rSxAuLTx59ip1bZGcsd8bjkYL?=
 =?us-ascii?Q?4CcawgYYhLIeOjmrovwoI63T37JJv8V1itUlsqVQR47z/MIItYKQD/NZ7fMB?=
 =?us-ascii?Q?uGhKbxaBTeeJdmumhhWO+pa4Tx82nQyB7x22EYK0tYRs91Jqsh3wsIri9yp1?=
 =?us-ascii?Q?m27mnodfq+OdQHXMiUJMq7jHbDDcq5zqTmn7C/fSEpXmfnbKEgX91RcQW6AG?=
 =?us-ascii?Q?i3Hpc00IZyYTeaTqAgZjrr+a3zfMwuoe3iB1CVht8HFT9dyW1EH6i9QWnVbP?=
 =?us-ascii?Q?n4imJm6fPbtFrqOHA9yI0PPAyv4dD/Jff/Hr3qvbP4E42G3pE+YNYXRygH+t?=
 =?us-ascii?Q?zxuAzfRvP8d7tHMoH9WMJ2VhbsTh0pgdETU5bOyrtGaKT47CbYK5Qhd6MOUQ?=
 =?us-ascii?Q?gWHOiPOQCjaOlV95Yf61T7KAHCi/z4ElsEhFgPN7WLPyU79pdKRMFWNmJ+Ss?=
 =?us-ascii?Q?CafNsFekoQiyMXh2qbNjd+R0jtDjBL0QW7U3VBMSYf31O5LzF/CUKdrlJDg1?=
 =?us-ascii?Q?CWehgGrHKvyK3lyjfg9iP06QOdifUBhcVH3pajRkZWWFdevZaW2Q4BW625zy?=
 =?us-ascii?Q?MUyuuVRy1aHVKMnxJtjFQ7C+e1beJyV7qM1s1kUs7Sb77JWGngHabYPUry/Q?=
 =?us-ascii?Q?234CmdNTpgkuBz+/kEJv9fE6DY7YJn7/NJU70OSHXdNcOFE4pepuG3y/jS5S?=
 =?us-ascii?Q?vPReuynQafy7xP+rumMJz2EEKbAfUhdsL0A2tHEZZaP1RlRB9aFtuiTTy2ea?=
 =?us-ascii?Q?g0bC+RHYdKnhdJu3UAOuQ7VBpDsPj/HiIvZIu2yHIkhHLYJDTNP3BPTRjla8?=
 =?us-ascii?Q?SZEChzDBco9Uwi6ziXL0n0zzDbs7NA6FtJ3gZ4jpAVJS40L3deezoRU8agYi?=
 =?us-ascii?Q?Q4suzvMjHXBz9R079ZuuXqfpubmb4eLAXsDwP0TrsKgDNZHQLaGsuUEXCYXb?=
 =?us-ascii?Q?ZEcOsySIHq+LMn3/f5ACj4PD7mxEQEinaCHFXwcfC/YTk3LDc5zH?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da069e60-a106-496c-1045-08debacd9c8b
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 02:22:19.2206
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8/G2ccvQswur5rSI/cOSCBtheBZk39HPCWNVguzU5IYAaTsx0RJ9P/Yas5CBlyJ/RYRbbP2aYzBtMnQtUT5P1qvOIhgaCYwOoCof6TznkBRfaPEqpBBGYY1SylFShq7/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB13148

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/tfa9879.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/sound/soc/codecs/tfa9879.c b/sound/soc/codecs/tfa9879.c
index f30479f1f53b0..5191037317687 100644
--- a/sound/soc/codecs/tfa9879.c
+++ b/sound/soc/codecs/tfa9879.c
@@ -248,10 +248,19 @@ static const struct regmap_config tfa9879_regmap = {
 	.cache_type = REGCACHE_RBTREE,
 };
 
+static const u64 tfa9879_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF;
+
 static const struct snd_soc_dai_ops tfa9879_dai_ops = {
 	.hw_params = tfa9879_hw_params,
 	.mute_stream = tfa9879_mute_stream,
 	.set_fmt = tfa9879_set_fmt,
+	.auto_selectable_formats	= &tfa9879_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 	.no_capture_mute = 1,
 };
 
-- 
2.43.0

