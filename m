Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011036.outbound.protection.outlook.com [52.101.125.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57C23287259
	for <linux-sound@vger.kernel.org>; Tue, 26 May 2026 02:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779761912; cv=fail; b=DgQ0Xuhw5NJv/3nYzZBarMy8JZ42CTKfBMizV4la548wW+7faCTRZhI4eYODjOTtHnoixuMuwW9hT8A1D4WuCybu3iDjTKPPehT0V+jOlYEcF3m2BJz23gDRYgLL0K9CLoVYjzLhFQO5KPpzfJoK5VUbGRzLpwPSi4mS0OITweQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779761912; c=relaxed/simple;
	bh=Us99qbHa0FMRwWPfwFp2xbWZTfEDx8Na1Wmm/Cxmftc=;
	h=Message-ID:To:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=L/a3hritU16IXhuWPL0FHlreFGvbf0c6z38txpchvzv1Rh2ohpNOT/vnZHtFKD3rXh+nFU4FPr5pnAM3NHuabubgsoNIkbdpaMvX94xQpHnlkMbmlyorlwjEzW+kVO+gfNuUOgaygLzOzxtggUsoaxcTGMMx6b0ZYM5UCAX1l1Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=EiFOPb5p; arc=fail smtp.client-ip=52.101.125.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="EiFOPb5p"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XjGyyD23vxvlKA3/Vgcyd3miSoNAjYwOi/XMj7fCyZc+ZnSrVHPMtsWLy1Yn8/gXBb73m9KJsasjF7zlknHjAmHT4GTkZFZ7jAVe20NjZxLhyp0ztVLJhMzIz+UokaP7sKfVtGOaO1UCgbOKMwOR0Vq6tKxQaih0vdJurbtfaWJ9bmAx+M5t2izZPmgJ24L8TLtLqLltswvACQJ9q2MTwCrpc1Mmtg6PMvjSCgHX4m3U+GweBu4tge+GVGJHm118IEIHOUdWF9ckyCtvAImKNxEmRFA3KrgDUZhPsBPtlTROfZ3hT4GfyJ/yr9e+BuROkjSLlBE5JQt5XG6iJSdRPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D7Q4Z/Tdi2q/Lgc9mw9504DRCKn8DvFmVuY3VQN5cmM=;
 b=c4926PkDWeVuAbPDNRTFJZUN9H5XW4BTqyyh6Ya4xMa+7lDXJ60yLfbeviKhI22A9WLAqkYGrdyhD88nt7CKHOU1ALOmE9hoeOZp305YtpeajBVmoI6H5JqE46lzgkcWRwCz8pDQUjtlZCqk4tMq8Xk/UoNs5TJSDu6yIokRd7JP/SgIM7QuZe4+bF/UiBq/pbrgLMhtC/5n20kPGKJ6xaQ49wPPgPtora8m5KxFaLR4d4+srfQHVSLj9qqiVMaL/3bQYlhTA6IrmNsmvadW86vUow4SkTghQ7r8MU4ud7ttnGYxxcE2BmiqzBUYHmWlr96+o3hLuFK7iLD2dPTPwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D7Q4Z/Tdi2q/Lgc9mw9504DRCKn8DvFmVuY3VQN5cmM=;
 b=EiFOPb5pSawLkpVjdQT4a9rlc0yz4JBZmdhkYxD3cUqOMj5eIf91MqGxO8BfZPHMwD9MZMIyChVc8sZP3ivchJRCuPcM9MDU/vCeSXTd9UxHNyewToQyZyP5GJFy9XMHXYMF3ZffBbvSApWWhOaSMKAYDIJYyl2FSpw/C6SM7pY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OS7PR01MB11916.jpnprd01.prod.outlook.com (2603:1096:604:236::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Tue, 26 May
 2026 02:18:28 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0048.019; Tue, 26 May 2026
 02:18:28 +0000
Message-ID: <87pl2ihq19.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH 33/83] ASoC: codecs: inno_rk3036: use .auto_selectable_formats
In-Reply-To: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
References: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 26 May 2026 02:18:26 +0000
X-ClientProxiedBy: TYCPR01CA0130.jpnprd01.prod.outlook.com
 (2603:1096:400:26d::18) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OS7PR01MB11916:EE_
X-MS-Office365-Filtering-Correlation-Id: b039b04c-4b2b-43b4-0e40-08debacd12b0
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|7416014|38350700014|921020|56012099003|18002099003|22082099003|11063799006|41080700001;
X-Microsoft-Antispam-Message-Info:
	CU10Bzul6Zw3NMmeamHs+J/HGrbwy8s3y/kTDJ0IWKMLbOTpBA2IhWcDlcp/m8bKlNl5A/3rdSfCMMXXyBQre/of7aEFx569FJu587JJ01GeYdEWq+r5J/EU0nb8/sWNYLnq3XvSF+bJoZeFxEFpfrSRdEmRzhEfa3GbYzG0CgIbnFy2Lg6eMIA7pEPjVSe5+Qa/syV7ftV85BGVrc79mEoXSe2hyS/MfTZOtm5/HwdDbdy0Ydyl4zT7OJx7fDxvnYi6XVedgnfr5JObNMR8P13b8ok8H2cLnMztqJ5DJPQtAtSPIskWpRxe/VEuGigXD6cGs9fL4/0w73Sg5SPuQlIIYR1MHmxnANgHO5VcYYyGwHZP8PGzKGXHMdSUvLKoIq7ZeyvpFdwM4SxT1xV9D+GhXy4GT0YVuzANDEW9QyYI9GeqJ3pn870T2Q3cyM9BQeJfyrw7g+bu+3RBHQU/tdNKHmJ68/HrV8qWdU6dWXN0mLeRM9FWbkE+M8VXik5KaVypMT+tomGO1BGTVZPZZggkKpE4hUIz+CoLOnjRDUx5hExgbgoK6LxvNqPkBdpq0BPPLMKUD9BUOjl349RwpcpeW5zAv7CVFx/ypam/qHVmEf7UgnUk5XBjyrJluMGCzxVUoRXmaWhRjfW6McSpxEiy1YLzabioki8pda0CR1WaO32j0dxtyCMpi4KZYb+uz4wEUqTEAR3CUG2FktEte9oEtTMsl1UHuey5cHqbgJ7t16A2wZyKD3IBBO4rC3UX+HIoMAWU7NBNi8KbuvNLBBOcTXhOtTpzPQBSdbFjeL0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(7416014)(38350700014)(921020)(56012099003)(18002099003)(22082099003)(11063799006)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qMjz51yBkqOgziRjBDxOhoeRmCKspPliFKNy0Iw2h3H8ck7foNd/p7EAY2is?=
 =?us-ascii?Q?s8GhOT6ZMDOEZ48SOzwgbLzV9oc4DC3Hp1Y+FNmEe5ltQ6diYgBMYD5TiZDe?=
 =?us-ascii?Q?yYDNB9Ct1ujhN7y3mp7qcaivRMit+Spuks1gD9lFccCX6XFlOv8H//T3aiEH?=
 =?us-ascii?Q?ATq4RTFKl+UQa5tR1khg88lc9TBZSwuPDDT2RsAOaJ+DlK3m8uhCFn+p5hYD?=
 =?us-ascii?Q?xwIxtTsrV6+HveV4XqgyNmbSnUqqoEGAtMAqmk2K9N5g+Ko0znr6s2f15gyU?=
 =?us-ascii?Q?yddczLYe0EDY7B8Gq6XBrwrAKqTSR3oMD7/XOg0Gm1XvegapqpEiZ7dfH6eh?=
 =?us-ascii?Q?yM/YRSX4q3p1mkuMv/mXEHCl7/Lv5KEXxZyYuJ/C57bb8VRY0/B7/70iRqRc?=
 =?us-ascii?Q?rLSNViE4WOwfYc/8BEpOsCDYecjD7TqRZNTN9mHhy3ddS6G1Y/q46M4Psa04?=
 =?us-ascii?Q?6MNdatsFVzKLWn4c11HzLF7w2CMfpOeQx01truQQNbLqZuXW9ODsgE1KTArs?=
 =?us-ascii?Q?SEZ6hVQ1Kya80RiFG73vDe4BeoNHHaFY0c1b++M8TIOUfALoMHQi/rEgNPaz?=
 =?us-ascii?Q?GaVu8WqgeWspiLim2dNvhc8norabY/EtG4OL4JDpcQrpMcITvq9oU8J8Cpt+?=
 =?us-ascii?Q?XrIohJ3+7xWsT4xFV+Ltcv9l0qoxIgnhE2wn5Jc7JnLBThkXINQtJl1tJKNc?=
 =?us-ascii?Q?wE8EU22hCoBirK0sA47ZJXtskqlyNi79WsxXYZFroN52dEko3qWMImUVFgiZ?=
 =?us-ascii?Q?DmWWy24+TYY3jloazn/WrRog6A5yTteN8GO5GbGfXi9DOru582gf4iK4JoZE?=
 =?us-ascii?Q?J5SYaRANcNsMTG5HwJq0LQScO+RXOki2cX9YnET3wZBYIoICbLddmhGHq9cY?=
 =?us-ascii?Q?oU5NK5I8OrDR2xEoN1RPl88OQyi7QKq5loNbfMG22V9CqR+Vf3ewJQVqwYV4?=
 =?us-ascii?Q?jHuVC98iUvE7x2qdGk7U3FpPQYsU635tmLPXwsF1P1UHS5bp4evRYfI7uy1N?=
 =?us-ascii?Q?hV5frLocohzEzCFjuYzAeuLV7Bo6AXs3knjbyOX8EdTPNtnUe5gPF2SPiHu8?=
 =?us-ascii?Q?gxtO2trJ6whjlyeP3AICLoJbNkKLq21p6JA7E7cY+vKBd7TEaf3FdMaLtvYk?=
 =?us-ascii?Q?mGkJWCyNiyWfTrpoG3CpdLVviStytjkBee1T02rqkbAD9SEuErzDh2wKAhzI?=
 =?us-ascii?Q?lhyXzHEV1tbQWwStj44DZlA1JH5ymC5QOeZ/6xHEW6leKW+TQXaSLKTyUk3v?=
 =?us-ascii?Q?xAl0pqXv684gf1tbcPZn6e3ASqCt/pgXDauIK6iBdp0PphnVmbf+WoN6AlDj?=
 =?us-ascii?Q?N1oUNozJ2/UZdZCcwErjgQpUP9aE6wk4CuyqISN7dgYI2wpqBGGKMQVVJtUf?=
 =?us-ascii?Q?lU9OpSvAeMkS0uJA7DI/tQN8AvQnJYKHOmZ1qodrXQz6/C2EFCu0EE3UxdqQ?=
 =?us-ascii?Q?MAio5OZHAEJArO+CxcEs/ekFJ906F3kypmJGCU3IbrhogTtyfuqg1EbHdAIa?=
 =?us-ascii?Q?Iw8EE2uECZHWS7nEgEgMey1zT0+HMGdMBKbYL4y+2y62s/NTklctkCSyfgCE?=
 =?us-ascii?Q?BMLkv0aZRHuuNHYVxD09Q/tWi6cgfRjy3kywN2cmsmIUn6EFuMTdmnPKa3pv?=
 =?us-ascii?Q?BdyWANdaLZmXaWivdd64I9kDmzBIY12OVplNaKpMzzWP8epn+4mwaa4fNOnW?=
 =?us-ascii?Q?X/d2urnOanlnRHDf/5XKv5+HsMM9YY8FlN3Bh9xJyilNvsTQiXuOk9o4/RWK?=
 =?us-ascii?Q?y7nxPMwTrRFUPMZyt/u9TTqI05KGDxVU1k4WOUjasnqQcVKhmxFs?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b039b04c-4b2b-43b4-0e40-08debacd12b0
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 02:18:27.9182
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IhHJvkqQuXJxtzKZ+DQR9EzFz83/2sQ2yv2buyQwCxJ0XKgPo2b952XmsO7UrmYv6P3HTiI71RzMkaEKvI8VlBwxMBE1FJoPDoW3z+Xq6u0OyyGmp9GKNN6irZiVD+gt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB11916

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/inno_rk3036.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/sound/soc/codecs/inno_rk3036.c b/sound/soc/codecs/inno_rk3036.c
index fdd19f8e88640..aaf03f2281507 100644
--- a/sound/soc/codecs/inno_rk3036.c
+++ b/sound/soc/codecs/inno_rk3036.c
@@ -309,9 +309,21 @@ static int rk3036_codec_dai_hw_params(struct snd_pcm_substream *substream,
 			   SNDRV_PCM_FMTBIT_S24_LE  | \
 			   SNDRV_PCM_FMTBIT_S32_LE)
 
+static const u64 rk3036_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops rk3036_codec_dai_ops = {
 	.set_fmt	= rk3036_codec_dai_set_fmt,
 	.hw_params	= rk3036_codec_dai_hw_params,
+	.auto_selectable_formats	= &rk3036_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver rk3036_codec_dai_driver[] = {
-- 
2.43.0

