Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011058.outbound.protection.outlook.com [40.107.74.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 959992F7EF4
	for <linux-sound@vger.kernel.org>; Tue, 26 May 2026 02:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779762006; cv=fail; b=UbCuwLizeSizUjseFWEEBIMeA8RGK4tNMwQ9JP8eDKyLwfca4AerRbp5EWznx/YN2dZfUt2CHqTQzoH8POaOXCzYySzD+2FenDBpv/bvF7BPzkpWkkOWe5kJAUmpAIVlyp8Ma9CxKEBGgfFTpzufhGJbLxVIFmSSBM5mwDE4NGg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779762006; c=relaxed/simple;
	bh=rAmqF+zaC61FVQTq3QTp26YFRvL1bt+MdLUBrBbyp5o=;
	h=Message-ID:To:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=FusykEfjv6HwcdaRf4JDULIQ3Lba01O7vFcneQbiPOSOrt8sstDAc1nouRD4UKYGNUnY7n3vJR2v83WIqpIZePyIeBrG/8oOegSMU/xTPa211/LS4xUZYmQXNF0mQPtdpW34b8FytvyQXQsvKG1N7Eai9Qb7GtnuzCVrSpUhoIU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=HnCqB+9R; arc=fail smtp.client-ip=40.107.74.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="HnCqB+9R"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bRGbWl0iaJngIjJpF7CS3QSarSHdRJ9fmGFfaRSRfhtbagZDBzUxBcDv63AX0P0HnxOPAgAu7a+40SKvSKcdMzztRrbCaX7Qbd/0yw5JyqqEPGDhHqmEPlERzgPO2p2b14dmfvZY/i+PM5pqoR08vCzxMQJ92gc1vRL84mynEyxu5+DLyX48cQsqBquqhKN4EuGFMMmnHBo4U0DPJulD99pIJM9oEslOLySY/5ZnkO9bjxc+IYxtGy9PbGF68fnbvMB9ef/Y1yoMlYoupg1s9XP4DM+iRAe+QmwL0gHYGJ9EIV2YECo7IjSS00aMoHTBaITMAVJDl2+Lw0vrOsomtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=giKfd9YWjR6D3Iae4lyIcefRwRoPU+1rJSD6nXaBxxI=;
 b=D5Kj70eaDprgytbGNZpMU1PSZ4aBAZmcVULtjtRwa6ziJrysMzWuEJqSPrbfVz8yVrl6JTyR3vhA9+4x3CrZ3WnRSj2Ne0qaWS2Lp3jk5Frwq5g9Qzh54+jznRnvlym590TegG3dk9Q4mfZQNj+65sex0a23jTIdBnBm6mVLdqBXVuYIxI7l7d63kjfFDPnOORxAURraHgXmrAS3rH6Cd6sRvjq8uUM3nLdLc6yUtREtqbNVtd2hHQAicnoQUO84RqaWXlvZCakvqIGA6Qrsp/EaVQoQrjXrUQfakEe8AA7BzQUdIVVxqbU3takv40HhhSJ+nmt0qGIgbPBTKuO+uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=giKfd9YWjR6D3Iae4lyIcefRwRoPU+1rJSD6nXaBxxI=;
 b=HnCqB+9Rajl5laU0VPQMJ47MELkIqmFGamtbA1QKXiLFr957uGnt4elQXN6HLpCAuVn1BUmj5zbOD7wpG4A05kRTyjocfDNABl0SJMGSA00P7+yRNQ1clQ4zCF5l1eLhq5CLjHV+FbIkeuImml3eoJyXnYbM0Ob5BfFw0gD1Bn8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TY3PR01MB11843.jpnprd01.prod.outlook.com (2603:1096:400:40a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Tue, 26 May
 2026 02:20:01 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0048.019; Tue, 26 May 2026
 02:20:01 +0000
Message-ID: <87a4tmhpyo.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH 44/83] ASoC: codecs: rk33*: use .auto_selectable_formats
In-Reply-To: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
References: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 26 May 2026 02:20:00 +0000
X-ClientProxiedBy: TY6PR01CA0030.jpnprd01.prod.outlook.com
 (2603:1096:405:3bd::9) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TY3PR01MB11843:EE_
X-MS-Office365-Filtering-Correlation-Id: 636f6e7f-63f8-4eeb-227e-08debacd4a6b
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|52116014|376014|1800799024|56012099003|22082099003|18002099003|38350700014|921020|11063799006|41080700001;
X-Microsoft-Antispam-Message-Info:
	j1HRMH0cKxYLmvW6f34b7se+u9qELGUIqhDeplHMSOKIpoqA6yHOICkSQuAEkS3TVVnMkWG8ka+3quGb+ReFeg9nPtNYUGJKgFDXyrBGHjSDtIrsR/OVeQpwx3Im/ibBIelu88173Z6iaaJHw9Xw0v+sbYfIrtdBllPVIizO4s04XJyjmj/HQth6SM/Lx6b1/SPBJjZzSXOYRwtrAubkbNf9JzATvoEhofugqrkW2QqOdi0WmPdFLpU7G9XteIMMkr/kDK1Cpj0jcqAJR+ji+RHWqgCcWCKGLU/76BYUaDYdDeGSRjjHvYATqIj8otGlrzNvF18NxL5yEq5v7e1x8UwyxDvBkvjmcZTZpwggaKK/V2hcPENgdBQn9ZfsLH/OGx7SdTTrNxp4rrt/50rlwo6uSGa01uj7BZlnO+VNR1kw0fxXakBXKcM0Etp4098PxEG7zGJpySu5GjSN+paG+MwXeuSiV1+AbBe2IkFiXZj/i1vhvhGzuocgn3AeiOqipmDqJlR95uB5JIEQl9kNDE9a0oTIjvml1e5y4s8Y6AuHwJUGFa+eefnUz4bJEny/kbG+Wn7o2q51IugZJalMHO9uPVazlcbW0x2o4uHtUKcD6NLHJyAMGZ/FtXVoyndRHqaBWk0+i9g547utFwNYbyo8npHpXfW7TNV4g+9QWVTHaBs5b+7ZOPquO5ud7+Oqhp5f2jetdI0O4YbGztvf1tuyJZkgZeA63chSVrcPU4fpMXrgliO7Zw9ve0x6Xm6yFJKm1jdmGHSjQffGQ/YjHfRAwUoV7hYuMi85TzptYmg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(52116014)(376014)(1800799024)(56012099003)(22082099003)(18002099003)(38350700014)(921020)(11063799006)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tq9FoWyCS2WsFXNnd/qinqaAb68yq1BbRj6dzTKtG0zJLNHUN8+KUcz3YrQF?=
 =?us-ascii?Q?NOcVtnsYnqF9dXcgFrnMvMXa+qA3l9lMqt74BJ/4EVArjElIQAdhHbDWXIfH?=
 =?us-ascii?Q?dWBeTuEPeeBFetu7M30aJsXsHxmXNlEyzbclGnoG/+R/k5cPgOQpWszyd6Wj?=
 =?us-ascii?Q?uHOXumEKn2F+rs01m32yVr4ba/bmEOiLIxXLbKYmWRjkury5XZ0cgLJIv+zH?=
 =?us-ascii?Q?k57S0/ku5f0XHNsIBx5VpnR9KGG9gl+Tp7pq9giCepQUx20fWXmNS0+SUXah?=
 =?us-ascii?Q?RRVMsBksv8p1TAf5hvMDSd4c99H7cALK0b0Wkx8RfzYzLFkKV/LHBCj5yuuM?=
 =?us-ascii?Q?cpFPbOz627RvKguq9Iw914HwzprIPFOShvJ4LGM5fRh3EH6b+QmseIXeJ33N?=
 =?us-ascii?Q?pPTunSRwO8WYSM0ontvtAdqZlWEOgKEWKpVVJSt1vw5Fqj5Wq0ely4cRiYs3?=
 =?us-ascii?Q?0ENJhLfJfAtarQvHN2NvDiQljKC6nnNAaTmqfV2tIJnuwEbKNsfNGt27A9Iu?=
 =?us-ascii?Q?7bYefCpxfVgvESoI9tlpZ15FKYoRmKI+hBk25jZBKD+rH8kfm9pBL8TuqLNW?=
 =?us-ascii?Q?rlgBnI0lG+QkP2NB6017iMXFffVzEepqjuOiKq6oi6ZanyQ14ZN0p31Wftyr?=
 =?us-ascii?Q?a6tFaxc//xlHDAabA9vZ+Y0FLFLpeCWFOgWPXWwpLw5dM7xHg5uMRWzt3DFO?=
 =?us-ascii?Q?bJ0AW2/nYUmaqImIu2SQ3Ec0+mhGDB/GtgMP6RD3HarVe/8jsD1OdT5GAv5+?=
 =?us-ascii?Q?np/I3SFShPw7BReNdcuBNLlawIFj+fB+/DKkrLIUZHKuM4MxsYZemIKTo1Jf?=
 =?us-ascii?Q?p5Jr0HJL3WheB9f/wHp39C4G3NJbzET5uhX7y/T49kPtGNxFU+cDpgbUhpj2?=
 =?us-ascii?Q?MrAGX5EQp+xpAeM7t6lnZztGPpBdhrFg+7L37y69zfYZigbw2nT1CP9I359F?=
 =?us-ascii?Q?CcJ/w/O5MG51UuxHphzuPAmiV3j9fF9moHJgfbh1SYm6XKfTUb6iQwpOYYAU?=
 =?us-ascii?Q?+NbTlO9hU2GyvXNbW8hJmDYFKcVmHY/8AnUS2C7XZpj8rp3X+K36j4fR8Nv8?=
 =?us-ascii?Q?7maNX3Ack7TcjG03BgTE3hQnrgQiZMt6I2IHmhbko2Aya4CcraLthrcZXezO?=
 =?us-ascii?Q?/KVwvcvt1ZA3wh8kBTtEsEAuaAKnjsUO/YiC1FqoRIHh2iZLY3WRAJBqAcS7?=
 =?us-ascii?Q?QzcwlH0k2nBcawAEqLySgn9yNuMFGsrLgIX/FkACHput5Lkt8yTnRBlVDoeD?=
 =?us-ascii?Q?yGWnsr9SOpLoqvNaSI9MDaMb1QrwnIWnfILIDTYtbtP2RP8yKTnvySsTu83F?=
 =?us-ascii?Q?IfII05+Qxab39no6dVQNwp7AeYOKYZLImyc/gnXmCbPA2qz8eYr/k26ZzinX?=
 =?us-ascii?Q?h6eRwa4FCYw1H2/Mb82nceOJr9e0oE896TBpxyVumc3syEac0r5vtvsKTkIk?=
 =?us-ascii?Q?LznOMDclvHVeL51bIUlgRCyRrbZsdX61OqShEhrtMdGVoHExODRnEeNM/Bo1?=
 =?us-ascii?Q?6/MjhtaqZHob3xGmfkSmTrolKUXjn+9nN89mQizNQABett7ycPtiNgsfcPdG?=
 =?us-ascii?Q?4VKKCnYDZT1Le0XPozuZlG9CfuE6XUO47mBeDNwa4oiuavcfgJ8vmy2hyUYL?=
 =?us-ascii?Q?zsJzHp8FRDCCGeLh2FAxC19hVK2eix9NPiJv+FVs9dwBUQ3riRfs35id+Tag?=
 =?us-ascii?Q?j5h750nLWhnd9FV/za2w1vWrF/UsKhBrDp2GlV3+6UcMmrztrP+jbxUOh5pH?=
 =?us-ascii?Q?37FGtBoV+xD8Lz1eymvcJNfygmxZBzxOCqk//OKwdgJmxJe0Pi10?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 636f6e7f-63f8-4eeb-227e-08debacd4a6b
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 02:20:01.4562
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CSrpWq51LLWWnIR8qTItCGz2QMl6/cLHZ0pEjCWaXWewMvA5/cme6o2cp7M8C9fSGxk5QYGcMTE5o9RFDGQI6c7j5qurROsRq3alRKKh4Dp1blgq1yM0W/oZCTg65t9I
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11843

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/rk3308_codec.c | 11 +++++++++++
 sound/soc/codecs/rk3328_codec.c |  9 +++++++++
 2 files changed, 20 insertions(+)

diff --git a/sound/soc/codecs/rk3308_codec.c b/sound/soc/codecs/rk3308_codec.c
index 60befe9d37f05..abed31ba660c8 100644
--- a/sound/soc/codecs/rk3308_codec.c
+++ b/sound/soc/codecs/rk3308_codec.c
@@ -679,9 +679,20 @@ static int rk3308_codec_hw_params(struct snd_pcm_substream *substream,
 		rk3308_codec_adc_dig_config(rk3308, params);
 }
 
+static const u64 rk3308_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops rk3308_codec_dai_ops = {
 	.hw_params = rk3308_codec_hw_params,
 	.set_fmt = rk3308_codec_set_dai_fmt,
+	.auto_selectable_formats = &rk3308_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static struct snd_soc_dai_driver rk3308_codec_dai_driver = {
diff --git a/sound/soc/codecs/rk3328_codec.c b/sound/soc/codecs/rk3328_codec.c
index 9697aefc6e030..1ab7e3f024bc5 100644
--- a/sound/soc/codecs/rk3328_codec.c
+++ b/sound/soc/codecs/rk3328_codec.c
@@ -312,12 +312,21 @@ static void rk3328_pcm_shutdown(struct snd_pcm_substream *substream,
 	rk3328_codec_close_playback(rk3328);
 }
 
+static const u64 rk3328_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B;
+
 static const struct snd_soc_dai_ops rk3328_dai_ops = {
 	.hw_params = rk3328_hw_params,
 	.set_fmt = rk3328_set_dai_fmt,
 	.mute_stream = rk3328_mute_stream,
 	.startup = rk3328_pcm_startup,
 	.shutdown = rk3328_pcm_shutdown,
+	.auto_selectable_formats = &rk3328_selectable_formats,
+	.num_auto_selectable_formats = 1,
 	.no_capture_mute = 1,
 };
 
-- 
2.43.0

