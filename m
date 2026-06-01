Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010022.outbound.protection.outlook.com [52.101.229.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 580E6FC0A
	for <linux-sound@vger.kernel.org>; Mon,  1 Jun 2026 00:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780272478; cv=fail; b=bahUQ+T6xzuN1Sc0dJvUCyDHHWBQlNlNQASgUpIe52+xG0g9FjPRSbjqD1RTiW70PuRciBk+eUalcbSFosmCE3GtF7VDgbwW+YXNg98j50LTEKsxElTCs/IcO28ofGkYKZjdirvvLBjZkjPVlkM9xe0It9ftJqNvJKw5TnvziVY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780272478; c=relaxed/simple;
	bh=zLYL9lbwScwH8bG+NueJSaFu6aBk2XHBpdeBg4eFHGs=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=mQeDd+PgCSpxMyy6FXwcm0PsI44aggvuChPGJlbodXbmDIwlQ88/ODjbQ5L7Iv5aVvNEp9mww3Ikg3c88cYhh5DnGt1aPHDVM5pIGf+EKLDU0ECprqzRQqeyClTUdIyXkHEN08gOx8O/Seeq9KnxQBN7AmyIMw6pFLRUWyN1dFw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=cQfXdMox; arc=fail smtp.client-ip=52.101.229.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="cQfXdMox"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p1G7tZv6QRxybQugwUvgH+hkeQuqZsuELc5dAUKzq6vOBDRm2iHKKMbiCbP//UR78n4OKKoaIXYkD+2Yg9GfeRQOA/mDywiKIr7zC4I83yvKzaA/o7Xb3lvycWcfKf375ox1qCA9no/9tDFX1mnIR2oBFC9T5YIBDixPIWI+4gNDnwWx33CUVIZVnK2SBrCSvd4xbBVi4GcsvpEl9r2wi/2TOkETT327DxlIS9STcAaobMCykekYt97OjwNEPb91cljJtyDAHsEN/JpsGo9CXL5TZ5ly/bBJ1RMtr1yD5ZWB0rvK5fkHRed6NBmbdCsD/mC2nGuxmLMhbHh5kQ6+Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UjX3lyCcETSpvV95YOnjvogOrtarbDm3vH9vrOXBuzY=;
 b=tEEkFvdiJ3gYWJXIBvjxGgKFOQ0FPy0/NtIEmV7pDPg+Rba3yzAFhgPJ7b3k6dBi9V7NfgZfNjnovR0FsDZvIdA2NjzFQHxMTGDMzc9dxncgzAj1hGNJyK0cVGdeJ7KKuLArIUd2tDjD2i2n9it9ncPJ7wrkwVbM5YY5QihIdmb1cEKxrRvD5K4zIROU9dCkO2m0q9Y2+i6n9rieeLvMhzxKdGJ5X9XLat+VrygCleGYxCf0yoL2JaI5op80hW5DdXELfMWr77KaqViMT41w5SB5pY2a89MHFd+mWZU6uhcAFRDlSQn0FFOuQSgg/7LoDAfCW81ibdcf3jLxFBFgkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UjX3lyCcETSpvV95YOnjvogOrtarbDm3vH9vrOXBuzY=;
 b=cQfXdMoxGh+pVrKg967yia2oqbLMgGVV13Apnn5I+yZHRO3h1/hoW8ep6mQe6aKL2XjtSUKAofBTbQRA3oQ1KolLf5HHpEcGUz5fBY5EU6/1jyDIenq4TI8O0C2dRKB5HrRJc0cZnA4Ywq4Xw3RiW+oI111KRRaxKLmWEJWfgTA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TY6PR01MB17860.jpnprd01.prod.outlook.com (2603:1096:405:346::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Mon, 1 Jun 2026
 00:07:48 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0071.015; Mon, 1 Jun 2026
 00:07:48 +0000
Message-ID: <877bojazsc.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Kirill Marinushkin <k.marinushkin@gmail.com>
Cc: =?UTF-8?Q?Alvin_=c5=a0ipraga?= <alsi@bang-olufsen.dk>,
	"J.M.B. Downing" <jonathan.downing@nautel.com>,
	=?UTF-8?Q?Martin_Povi=c5=a1er?= <povik+lin@cutebit.org>,
	=?UTF-8?Q?Nuno_S=c3=a1?= <nuno.sa@analog.com>,
	=?UTF-8?Q?Uwe_Kleine-K=c3=b6nig_=28The_Capable_Hub=29?=
 <u.kleine-koenig@baylibre.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Baojun Xu
 <baojun.xu@ti.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Ben Bright <ben.bright@cirrus.com>,
	Benson Leung <bleung@chromium.org>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	Bram Vlerick <bram.vlerick@openpixelsystems.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Cheng-Yi Chiang <cychiang@chromium.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Daniel Mack <daniel@zonque.org>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Fabio Estevam <festevam@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Frank Li
 <Frank.Li@nxp.com>,
	Fred Treven <fred.treven@cirrus.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Guenter Roeck <groeck@chromium.org>,
	Guoqing Jiang <guoqing.jiang@canonical.com>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	HariKrishna Sagala <hariconscious@gmail.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Herve Codina <herve.codina@bootlin.com>,
	Hsieh Hung-En <hungen3108@gmail.com>,
	James Ogletree <jogletre@opensource.cirrus.com>,
	Jarkko Nikula <jarkko.nikula@bitmer.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Jihed Chaibi <jihed.chaibi.dev@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Kevin Cernekee <cernekee@chromium.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Kiseok Jo <kiseok.jo@irondevice.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	M R Swami Reddy <mr.swami.reddy@ti.com>,
	Mark Brown <broonie@kernel.org>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Max Filippov
 <jcmvbkbc@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Olivier Moysan <olivier.moysan@foss.st.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Peter Rosin <peda@lysator.liu.se>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Qianfeng Rong <rongqianfeng@vivo.com>,
	Ray Jui <rjui@broadcom.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Samuel Holland
 <samuel@sholland.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Scott Branden <sbranden@broadcom.com>,
	Sen Wang <sen@ti.com>,
	Sharique Mohammad <sharq0406@gmail.com>,
	Shenghao Ding
 <shenghao-ding@ti.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Steven Eckhoff <steven.eckhoff.opensource@gmail.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Takashi Iwai <tiwai@suse.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Tim Bird <tim.bird@sony.com>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Vishwas A Deshpande <vishwas.a.deshpande@ti.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Yixun Lan <dlan@kernel.org>,
	Zhang Yi <zhangyi@everest-semi.com>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH 43/83] ASoC: codecs: pcm*: use .auto_selectable_formats
In-Reply-To: <93f2741f-e23e-a1be-bc04-a00a5c4713cd@gmail.com>
References: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
	<87bje2hpyv.wl-kuninori.morimoto.gx@renesas.com>
	<93f2741f-e23e-a1be-bc04-a00a5c4713cd@gmail.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 1 Jun 2026 00:07:47 +0000
X-ClientProxiedBy: TY6PR01CA0038.jpnprd01.prod.outlook.com
 (2603:1096:405:3bd::18) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TY6PR01MB17860:EE_
X-MS-Office365-Filtering-Correlation-Id: 590662b6-954b-4966-8a3e-08debf71d063
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|366016|1800799024|38350700014|18002099003|22082099003|56012099006|4143699003|11063799006|41080700001;
X-Microsoft-Antispam-Message-Info:
	G6vlR9oSCjIKD4MteH973DmRftmqeZPYubysOaJ/86ymbsNqidS1uBD2LZfK776z6NrAbh5/j28kIKwcMZxGFLhUufnonPlDo2E0Y5+GQRFtSoliDy20ovIqnBSjcScpLoHVq0fJL5gzc5ec3oRn5oJN28TPdKyg/Zqa2YcW3UAHUejeUHtQa8x1KRZZeUpbcCkUj0hsPJ4dPTtLOyL6UJiGe4RJQC84snmEtiazKhUs+qSyAOgZnIoTHNh3NR/1RVPUmsIR68vl+GSV6XcI3an8xQhsqUaxzpwQiOtkCiNiWP8/9xWeV+xOYOpdUDzj4sFIBzZTfJBmkzOyKuv7ewkMq1jyhNZjRD3Mhl1J58vc0NkEEIqXdJf611XRpkbHlGNBJxCgTyRta+uuuAfVj4jsRY0b9dogUnFHMWalPdne02p+0y5fV71CI2IhfIe7hx1bTV2h9vy0o9Pchvhs/X05nchQ6glADZxUlHjaSv5z4JInxm5xpg2RbUm6bya1TVJ1ZO0DFDRlbNv+GbgYSfHEIzs3ZHQ+sEJH7BTUkEbrY2Ea4zJL3GoZdNScOaxsgdrZ/vNCfp9tTJAbr/fm6A5QSbJDBMux77q47P9D0rTHNkuAYY73ekOSdQRWMG1Iz28pvk1sTZQp7G1/dZRvqjR1u3cpqBW+oagb1eui2EWFz0ZcsibGwr6SYmkItkl5Xbp/p49L69Q3JHiDkCY9G3RrnKvW5X3Pw5C8ojF1WmTRfpt3ayQM5N034lC6Yl79LRerTrhDpTGnxAOwcXH9Wg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(1800799024)(38350700014)(18002099003)(22082099003)(56012099006)(4143699003)(11063799006)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LCZqshl4YtlXrEGySdb3Te3iecufi8kOxtoZSovfyToaqBw+odIq8AC3ygaW?=
 =?us-ascii?Q?k95+vcTuW4oImO28CEILclau/0cWrArLzZckU0WCLDvxYK1w08O5Yt36/VTJ?=
 =?us-ascii?Q?kOveOrlITnjJ7RYhHF/+CFcowabSuP5XHpCOIn6jpjHmjFaAJE9VpELvhWyL?=
 =?us-ascii?Q?m81qourMJJ1su8QrRPaXD1f703f/Y3ldidXsHwrMNbhDSV7g9AIKa12JUc/8?=
 =?us-ascii?Q?hJnbjLJYYRlDCLWQnQoL1Hy08sNb7DCAYC/bUuKcd/qXELqcHG/otcpn7rsi?=
 =?us-ascii?Q?6PitS91lljg67VkAeQWmEkH7a5wUcUrLCV+obBnjiROBHiWjsXesTnnQ6JNR?=
 =?us-ascii?Q?d7VIBBDw8PSIFNxeNV1HBsCOvC6UtxslH/kkOYqdtL0vAkND0olkAEcbs1j0?=
 =?us-ascii?Q?iLkWn/xmyobgaQYZikLcJqxeZzLr0ocO9dUuHnR75T3RE304we3wefytQ4BF?=
 =?us-ascii?Q?8zWFoNr4esOG+QC2jXlyshmsJXhs3G4lQ3sMhHDJALK/1cB9ik26WbmpuMkL?=
 =?us-ascii?Q?j+I10tHj/Mefck2PhcrzAOh3h8X9tgCMKQbTj6xfhgZAR8QAzJ7tuSwjCCDM?=
 =?us-ascii?Q?3ismMXlztltF3k2ODvuHKUeF8ARiFlhji67HBvwVNCAJ2Z+dQnTDBXLY0fFQ?=
 =?us-ascii?Q?BiEIsj517dWjLyRCyQIT0Wzp3OieHQwD5oEbqzadGbEMfR0U/DYOGB8gbX0U?=
 =?us-ascii?Q?N9TAxQsEFh7UbEjacv0a7z0PrnR3Zz5jlMwa5UE/eUYMQBwSWgEL33oqibfM?=
 =?us-ascii?Q?qYbi27sFqjL6x97yYnp89qmpWw8is0Axk/HbyIYKnRuAQDTeIDhowKbXL9EE?=
 =?us-ascii?Q?sluDLC1FCvzqMF20q02VVxuKV3eNI2tSzPTDM/X3SmsnG8rpQUClyt0UTbke?=
 =?us-ascii?Q?RbfdBHv2jl17Nf7i8kIQ3G/eZvyMwUcADf4mscStBuH5f8JWx1GFz5rxgCoN?=
 =?us-ascii?Q?+MVU/WKrDblBYX3vBS7nz5qo8rp0ENySXAHZ2MJLpLXA4E0H8AuYA4a2aR7k?=
 =?us-ascii?Q?eF9ptmrvIK3k1JacITRAeemZLkkELxNSSjRRsIUBUysOJ4ZSGRL4R+a73dhw?=
 =?us-ascii?Q?8xbzlR8Vsq+Fp2rsYpkBOx78eYynK+6Y2J8sNfRAKwXhxfI5/vVIgmtcu2lK?=
 =?us-ascii?Q?uah+v7Zq7FgAWw3LVCZcdCtOKY7RnLeNLz/k5+etRVGk6hxpm7TEbVns4u71?=
 =?us-ascii?Q?j9XxdZXEgLHyn0lPoSmi/yIvy/bHYblYWJyWQBTSzY0h8WB6d3rO4PejB3p8?=
 =?us-ascii?Q?E9JnOUZnlirfuZGTh+X19x+U3E0gXytjGzTZV1A0ElfSKTAq3DozNsaZ7K5u?=
 =?us-ascii?Q?ZLKUf9dMD2GnbefhMmAayI1NWVarwyVflkaaEmxm6k6cDzUDCt3i0GFBu0gW?=
 =?us-ascii?Q?rVK9MCy4neW3VFnlIkaZvmvM88gCaEXg37ydCi83GvA3VSd8O3C+f12ioXiC?=
 =?us-ascii?Q?E3G/DWKO5oK7Ju/nimOyBWh95SqqjfLTnB8Jhd2ICDgPPrZDGZBnR4q7/gDx?=
 =?us-ascii?Q?UvtP5k96ZY/kZ9r7zD7AVbz0+912KoNfIKMutgy7a2bYbfN58j/NDKKL465f?=
 =?us-ascii?Q?+22Qj5lW2nwEdHYNfSM6OwvIQuADQNfy05JJIe4Psgb8fF+G70cOh9TUJCfZ?=
 =?us-ascii?Q?KvGtTGuDuzu+M0rfUmE4sxr7aXE6P/IsKUKY/2G7++zbrlpM49CXHcMbuNKt?=
 =?us-ascii?Q?A4AJ9bDQSNBhxlqmz2XoT3SmZnQVzaJ+sQyjdsBeZ28rBBfULjMG/1NwVChY?=
 =?us-ascii?Q?ko3CDkerPe9Iigbbuie6F8my31LHvr8zQ3+u2X8WtzuQq6MKm14+?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 590662b6-954b-4966-8a3e-08debf71d063
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 00:07:48.3493
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kVnpFEpBD3y83AEr4TZsrz71hqH5/4Vy+GhM8zbWUG/ogHAs8hmSBCZW3uTM05Xi5gD2JyNW76Cr8r3dfgwFUNtjk7hCM6IKm7ooHITM3jAPZUJMOuvnWf1eWejhVttC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY6PR01MB17860


Hi Kirill

Thank you for your review

> Only one minor thought is that probably `.auto_selectable_formats` for
> `pcm3060.c`
> 
> could also include `SND_SOC_POSSIBLE_DAIFMT_NB_NF`, similar to `pcm186x.c`.

Ah, Yes indeed.
Thanks, will update in v2

> You are doing a massive work, i deeply respect the scope you take on!

Thanks a lot, it is very fun for me ;P

Thank you for your help !!

Best regards
---
Kuninori Morimoto
