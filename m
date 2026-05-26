Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010066.outbound.protection.outlook.com [52.101.228.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 058B82F360A
	for <linux-sound@vger.kernel.org>; Tue, 26 May 2026 02:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779761998; cv=fail; b=YE+QWnDRaYa1HyDZlvGA1qqQnF66ZhCaaYz+qw6WoIZDsSkiLbndwVQHPfFugr9cR6Ztb5KrTEeXqgt9RN5XcVBl0BDeSjqHPm1ay3YLvh816nnMjwhxwGhUri580c/4fwwtdUv7Rn0z/MLhz5Ah4uKi+QAd46hecRo5iZ9bsck=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779761998; c=relaxed/simple;
	bh=HiLGEjCCHtIyMKb0N2MewVoxCEYScAbFMbUSAfLDN4k=;
	h=Message-ID:To:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=TZ5/lWfYqJjLGaGwVg2RNm7p2A2C+yDePc9rOv+p0Tj0HtLkM/lB9JTk4HBK1ZHIfPBbHVMPl3YBGg8AOhAzNvuQuSQSLQW1LSnO7GLDIxl/uSGcqhNQtfShrEWxxbgKp+Yld5MKyU8IKzZe5af+e/aFv3gvshR/hCQ2DMtIl9U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=C/bOyBU4; arc=fail smtp.client-ip=52.101.228.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="C/bOyBU4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IcKwQP+UN5TavsjD3/feCS92Vyjj6j9F7VdcyoD/uvqGCG75o21y/IATD8qDCkIBwVjxYeq5SUxOY5dpM1ZHimXtGXaJ7uaTpGQu7Od5AdNbCLgPV2dtcP/PV5qCj+Si1jlh9exbn2hGlz7jXfMqvQ96WGpUVK6p5WUXWtS8I9Q1ps94CflSxMvLFZMt2EOYrvMUnJ642fZVeFe2lYcCnrvuPvIf9AxvHSdun7n1MWTODzAFRTUfkHpmNRDpih5NFlxWvT/KvXJKy3VpO8V6Hx/UN36evcdz31WgBa1WXvfhYc7jbX4tFj0jxC82TNTIUA8QDDSW+mfT1TyRBZ1+IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K3fUSrC0S3adt9Gf68ZrP83sW61zjDjHY69328yM4aE=;
 b=NdgcCJPkGi6aj0Me616FjtQUiQwEWlIXUvPfGWITiKR6E9FzWKotDrRQ5L3l8JX3sdn6HBYi69og/mL3p2ZQtVu2PcIdvXwACG3W5X3UdW+flTyVg4n4bLbG/EnU6abtJD6R0q97jK2U3Oc3hLz1AVcyygOj01MEoKeo3my7D5MNnbNkWkoMidGFCY6/0MAl4I3lCLUy9g2HdYC9valVN++KLA+pioDWh5V6xiWGAViO/7Wruc2K9b2BynJRhebyzimsj8jod6wN8Ws7O0eV7DuTk3A1NUZodjUAMQe3YBmLC1GwXm62VfDnxrR5BbPuN6jgptsNNZTuIEt+3ADF5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K3fUSrC0S3adt9Gf68ZrP83sW61zjDjHY69328yM4aE=;
 b=C/bOyBU4cUtCM/PyaIWFevzAgV4Gv+CsI3m7hAz7219K1XDlf7DFL3/brq2eI34T7h5fA0oFMVeaLerfB0lA2ZKqFS36Fg1WOMFBC9EfW1ol+TbgWReosIOjFWpMBaqRDBgcRHpZHrdw/xadreICvmfhwSayfpKyL1+BmNnOT3A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TY3PR01MB11843.jpnprd01.prod.outlook.com (2603:1096:400:40a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Tue, 26 May
 2026 02:19:54 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0048.019; Tue, 26 May 2026
 02:19:54 +0000
Message-ID: <87bje2hpyv.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH 43/83] ASoC: codecs: pcm*: use .auto_selectable_formats
In-Reply-To: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
References: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 26 May 2026 02:19:52 +0000
X-ClientProxiedBy: TY4P286CA0121.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:37c::10) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TY3PR01MB11843:EE_
X-MS-Office365-Filtering-Correlation-Id: 3dee4231-26cb-433a-338b-08debacd4609
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|52116014|376014|1800799024|56012099003|22082099003|18002099003|38350700014|921020|6133799003|11063799006|41080700001;
X-Microsoft-Antispam-Message-Info:
	uu/D1/Cjo/miocMehEBd4JPgaljMkfX+bIOnLXW43pqckMCahSsTxFX/N1TPO9F61jZ5JLMYyLa38ELQR/oremdAHElHEtE/DbtdvspYkz6c+OsxsUXEqR0xcpCPB3iM1jn43d1iOjWtzwH+tse5i9+foAOXpXce1VAkyAd4lt0FeGtNtHO/dSp9jJcal/h1a2ytyYFn5RAagjxeWDVxXcJjADOcHk3f7opul1/LNOXm2MIvP35AjkT2U9+llDJmdtJPe6Tt56XCYB3/B7XLSKDPZQNa0kuaLMd6ibGDmSY/Jc9de0oLLVdZp6ODcuUk5scwwcHQqIDCBzuXv1LGdJ+9FprqcIoxEBkBh3PKI4QeyglgW4zaHboJDwwQBdTgMFdVIaUKTgwXQOsY2vVQok0fQ1qNWBqDZprK4ntf7MC25+Q4jvPWMGl8VJOfkcNGuEzd7YejVkrjvXSjJF+4uiC39l3z6p9/Pvjg9+DAKDZ7pHUTZ8n6tvLwa6Dm+FQcnhaIk38izmou+hBHW8qLe7cKLh/P1GOnajlUL6QEkgFHpm9DXkaBJNWq/cpaf3ygilslMzfGkUE65Kaa1cZYhP6M/sEOaJqtC2jhtLmXXux7xnfu8hQvVWM3SaBTREshwOGbA/EkAJtQPPCNe4JXVdYuKEaWeWnj/jvJ1WyIZCe38tkWnfIeXXVw1si521MFMQpNrZ9nbwYYKa7S5DEP0NzYFr3yJOQh9EsDpVoxaUaRUJI3lIg2bSIkKdOem2qnYcCvVr3YyG5rIwfqF0LVPpcYXgSEMdo7eDjO8IIn5IA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(52116014)(376014)(1800799024)(56012099003)(22082099003)(18002099003)(38350700014)(921020)(6133799003)(11063799006)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qR7ekaAqq73nF8YSns/Ctuj0yiMqDhNEwjqU2xnWk9uGTKCzylEaWC+SRN4A?=
 =?us-ascii?Q?LYlYMAZMsyJUv/ir1hXLe+isdKoycUn8+CMKqGHEtZ5GpXEcuY2zlXPOFER4?=
 =?us-ascii?Q?BXou3wRSgbfQSvd9W6hVp/uiBTUeIzWHl+OBUxmuR0KjYPa1qs9dyJ3hAKya?=
 =?us-ascii?Q?Vuhl/IVD5Kd0FybYvN19z3UJakOGQLSR1QNySdwoHddT+anGFlP/pe4QqtZx?=
 =?us-ascii?Q?Z8x0+Rdq4KcJvfdT+U0lxPUUNgIbPiwBx/eYUQiN+InGctrZTLguTL22cn7V?=
 =?us-ascii?Q?jkROb3G7CbPtXHClAxQtee7V+9lhEYQczGg51GPoHiVuimAUSK402Uzj2x3c?=
 =?us-ascii?Q?wKE9qR4liktCCd71b0KbmNlXyZr4te/cNNUKlqAC5/KG77hyGrOiunm0RdUk?=
 =?us-ascii?Q?zM+DjkQ0rb6afAjhVV/RStdpGQVKBd2Hg0B/8lDGyg5J7IvAkBNDcblHhsIj?=
 =?us-ascii?Q?H64Cfx4QkOqDrK9l3mDWmO6QiZA0HfdSphXvue1v4dlI9OSbJnCalbXhsUZ+?=
 =?us-ascii?Q?AC6EXrEDQYRtOIRgwsOYb4tq6PqmetOEYxG7jKPXVuMCl1e7YYtIOwuOWhy7?=
 =?us-ascii?Q?6OPMw2osJp4bN9SAV02sUtp23nLxsB76LJtUv/GVSrIVHoyQQxhfb9+Ru5xV?=
 =?us-ascii?Q?IrvAezkj1OH2/2qd55A65KZUcIDIef+Ioeh6ui2XYSGE6yCsC2zf6yqybp2c?=
 =?us-ascii?Q?WWVbcFlGVMswS5FYCDtLXoIt9+EHiZyrq0a08sZwh7n4f/BpR2szWrqN0L2X?=
 =?us-ascii?Q?qMzCD2/BIQu8O09pQmdFKqSMLrTou+dKi29MZLqEY1SkITD5TGd14ADVhyax?=
 =?us-ascii?Q?/3JxUvSV8A99AdqlJbT7/fOVBK3m538dztovxQ7EyWMv11vYiRXaLuu9BvwG?=
 =?us-ascii?Q?VGQtVh85X4JJqOxhJJQfvmtBsgBx6io3xhS9ZEG1F66Jt8jLHBJJKOfuUsCm?=
 =?us-ascii?Q?hrn+3QaAj5oUthAlhapKXEMKoCmICGnc5mfvq4QEwYsq/8rvIOsQVMjYEmt1?=
 =?us-ascii?Q?K/3S4hK5sMPui7ZLgHSKvRXP/m4wB81Zk3jpFpxE8nFbr7BJ7FQm+FPz3aB6?=
 =?us-ascii?Q?YX+3QCnTBSA0CH4sawTqZWF6U06AJI9xIYJ1OpIUCm2qMhx4dTk5PoTr87Hd?=
 =?us-ascii?Q?JZRbH4SV1iSbRvQRzaAk29fEuHHd2FiZZUaIP8mGDXMzmB7vFV9UNL8bkUUI?=
 =?us-ascii?Q?o2Ql+4cvNIN308H/dJRD6z5X7+8wfuI5eZqQDGPGaL0OryMNUPiEh+CNFEhh?=
 =?us-ascii?Q?2TbdDhU/kbp+X6eVH1Mn3bwFAsWUsq94DbzlLIbRhHS41HJ30xtMXKD9NMBS?=
 =?us-ascii?Q?+a5lV7ubp86RkY56B0AKynVqz49jHUtm+aGovan6vIu7xbo4PRMbe1443FrO?=
 =?us-ascii?Q?9xB/HJpqkh4Evn2Oqx40ZZcioTwcikidAO8KUGwhZ63a6rS9Up5Zes6MkCk4?=
 =?us-ascii?Q?AA9PetpVNXiJjoyD/4vwZdgACxDqXo0UJRmhOz3/F3jXq5n60svNAAoa4vdB?=
 =?us-ascii?Q?cIa3pw8EKinkS+HVG0Bbj0UtPuiZ2eyjtfumJBIupGOZx64s+UMyLXHiDYFO?=
 =?us-ascii?Q?Su4Si0BOY1NYaAnRg5lHyGtrfSKbCcGVlxMY1z/FAnEFGnhT9LtpCnoeehWW?=
 =?us-ascii?Q?9bqrtUctBmqcH0ISNJwGP9FZ8YU1F3AtVr1MawryHqHt1g67vqg57nMQpDSM?=
 =?us-ascii?Q?dGHn+6ltt+LDs0vU6Og/VMhRvNRmS4DOxvIRaiAHYNn/nZoaJh2yhAumtXs0?=
 =?us-ascii?Q?SauqJ4ZFW75oCz1VSDeHSi1xP1DPFxBachiH6syhRqSvfa5oyW4C?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3dee4231-26cb-433a-338b-08debacd4609
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 02:19:54.0332
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oTXitDPFtLyOr1PUVlaGJuTTRBjasfpjKkqkJVb+owteEs17zwQHxiaFelfq3agRuJtQ+bEMZvYjnFzJxfz4pamGMaqKp/GHWQB1iz5jvCMeATspS0pzwjuS1x4DU+8V
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11843

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/pcm1681.c | 7 +++++++
 sound/soc/codecs/pcm1754.c | 6 ++++++
 sound/soc/codecs/pcm1789.c | 7 +++++++
 sound/soc/codecs/pcm179x.c | 6 ++++++
 sound/soc/codecs/pcm186x.c | 9 +++++++++
 sound/soc/codecs/pcm3060.c | 7 +++++++
 sound/soc/codecs/pcm512x.c | 9 +++++++++
 7 files changed, 51 insertions(+)

diff --git a/sound/soc/codecs/pcm1681.c b/sound/soc/codecs/pcm1681.c
index cb923cecb47fc..60fdbe5c4e054 100644
--- a/sound/soc/codecs/pcm1681.c
+++ b/sound/soc/codecs/pcm1681.c
@@ -199,10 +199,17 @@ static int pcm1681_hw_params(struct snd_pcm_substream *substream,
 	return pcm1681_set_deemph(component);
 }
 
+static const u64 pcm1681_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J;
+
 static const struct snd_soc_dai_ops pcm1681_dai_ops = {
 	.set_fmt	= pcm1681_set_dai_fmt,
 	.hw_params	= pcm1681_hw_params,
 	.mute_stream	= pcm1681_mute,
+	.auto_selectable_formats	= &pcm1681_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 	.no_capture_mute = 1,
 };
 
diff --git a/sound/soc/codecs/pcm1754.c b/sound/soc/codecs/pcm1754.c
index b68a528000be8..bb15da1c24aa2 100644
--- a/sound/soc/codecs/pcm1754.c
+++ b/sound/soc/codecs/pcm1754.c
@@ -78,10 +78,16 @@ static int pcm1754_mute_stream(struct snd_soc_dai *dai, int mute, int stream)
 	return 0;
 }
 
+static const u64 pcm1754_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J;
+
 static const struct snd_soc_dai_ops pcm1754_dai_ops = {
 	.set_fmt = pcm1754_set_dai_fmt,
 	.hw_params = pcm1754_hw_params,
 	.mute_stream = pcm1754_mute_stream,
+	.auto_selectable_formats = &pcm1754_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static const struct snd_soc_dai_driver pcm1754_dai = {
diff --git a/sound/soc/codecs/pcm1789.c b/sound/soc/codecs/pcm1789.c
index 3ab381e9a8566..f06e353743aaa 100644
--- a/sound/soc/codecs/pcm1789.c
+++ b/sound/soc/codecs/pcm1789.c
@@ -164,11 +164,18 @@ static int pcm1789_trigger(struct snd_pcm_substream *substream, int cmd,
 	return ret;
 }
 
+static const u64 pcm1789_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J;
+
 static const struct snd_soc_dai_ops pcm1789_dai_ops = {
 	.set_fmt	= pcm1789_set_dai_fmt,
 	.hw_params	= pcm1789_hw_params,
 	.mute_stream	= pcm1789_mute,
 	.trigger	= pcm1789_trigger,
+	.auto_selectable_formats	= &pcm1789_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 	.no_capture_mute = 1,
 };
 
diff --git a/sound/soc/codecs/pcm179x.c b/sound/soc/codecs/pcm179x.c
index f52ff66b6e644..cb70927872aa0 100644
--- a/sound/soc/codecs/pcm179x.c
+++ b/sound/soc/codecs/pcm179x.c
@@ -142,10 +142,16 @@ static int pcm179x_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
+static const u64 pcm179x_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J;
+
 static const struct snd_soc_dai_ops pcm179x_dai_ops = {
 	.set_fmt	= pcm179x_set_dai_fmt,
 	.hw_params	= pcm179x_hw_params,
 	.mute_stream	= pcm179x_mute,
+	.auto_selectable_formats	= &pcm179x_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 	.no_capture_mute = 1,
 };
 
diff --git a/sound/soc/codecs/pcm186x.c b/sound/soc/codecs/pcm186x.c
index 0d1103fe4e04d..461ec74e87521 100644
--- a/sound/soc/codecs/pcm186x.c
+++ b/sound/soc/codecs/pcm186x.c
@@ -473,11 +473,20 @@ static int pcm186x_set_dai_sysclk(struct snd_soc_dai *dai, int clk_id,
 	return 0;
 }
 
+static const u64 pcm186x_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF;
+
 static const struct snd_soc_dai_ops pcm186x_dai_ops = {
 	.set_sysclk = pcm186x_set_dai_sysclk,
 	.set_tdm_slot = pcm186x_set_tdm_slot,
 	.set_fmt = pcm186x_set_fmt,
 	.hw_params = pcm186x_hw_params,
+	.auto_selectable_formats = &pcm186x_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static struct snd_soc_dai_driver pcm1863_dai = {
diff --git a/sound/soc/codecs/pcm3060.c b/sound/soc/codecs/pcm3060.c
index 8974200652e7e..5fb344c6d8d90 100644
--- a/sound/soc/codecs/pcm3060.c
+++ b/sound/soc/codecs/pcm3060.c
@@ -164,10 +164,17 @@ static int pcm3060_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
+static const u64 pcm3060_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J;
+
 static const struct snd_soc_dai_ops pcm3060_dai_ops = {
 	.set_sysclk = pcm3060_set_sysclk,
 	.set_fmt = pcm3060_set_fmt,
 	.hw_params = pcm3060_hw_params,
+	.auto_selectable_formats = &pcm3060_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 #define PCM3060_DAI_RATES_ADC	(SNDRV_PCM_RATE_16000 | SNDRV_PCM_RATE_32000 | \
diff --git a/sound/soc/codecs/pcm512x.c b/sound/soc/codecs/pcm512x.c
index a70e8ea166dc5..981a2e56fa724 100644
--- a/sound/soc/codecs/pcm512x.c
+++ b/sound/soc/codecs/pcm512x.c
@@ -1505,12 +1505,21 @@ static int pcm512x_mute(struct snd_soc_dai *dai, int mute, int direction)
 	return ret;
 }
 
+static const u64 pcm512x_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B;
+
 static const struct snd_soc_dai_ops pcm512x_dai_ops = {
 	.startup = pcm512x_dai_startup,
 	.hw_params = pcm512x_hw_params,
 	.set_fmt = pcm512x_set_fmt,
 	.mute_stream = pcm512x_mute,
 	.set_bclk_ratio = pcm512x_set_bclk_ratio,
+	.auto_selectable_formats = &pcm512x_selectable_formats,
+	.num_auto_selectable_formats = 1,
 	.no_capture_mute = 1,
 };
 
-- 
2.43.0

