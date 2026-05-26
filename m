Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011021.outbound.protection.outlook.com [52.101.125.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AB9E2E0938
	for <linux-sound@vger.kernel.org>; Tue, 26 May 2026 02:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779761934; cv=fail; b=PbCdBCyeqMEDJJRVNVVPmgD+aFCRiv20b389NQ0IGEfQljhnkfy79cPe2MHw2rb/VSd4GIhpWkcZB+VcLLeng9XGjNCWJTAtb41dobwuWvh0sdMvq/L+ekkwkKkqssSh5aOfFjGNomCLt+fc3ORQHeIkUDWalqzdeRw11zexE2k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779761934; c=relaxed/simple;
	bh=B1xXU1pvqOGqiVEUELPohi57VBbUnlrHyehpQaGsCiI=;
	h=Message-ID:To:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=f7cjFW5M+Lz+M2xUN6rYmRKODxbwIvUWmErWbXCnMHnpc2kFlQ6vp7YnwWMRq8zlBXjRSmL4FMyVMci7d4YTKs8LjcoU4Sc0B8muiHxqK23RG57I1Nh2TQG7jwh16eppLM+Mcg1hIYQUNK4/58zZ3Rny2Cx128/ZqgixLH6gSM0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=GexbqtoB; arc=fail smtp.client-ip=52.101.125.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="GexbqtoB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pz27H+Q/xP2kaIAcCrY4Kcr6QvRkZrMKcCU89gzknhJvOteilwDEIN+bqwcptstShbBQ61Itre9+S+tcOgcGVAxbc+baM48GqIzszikvsm9NuW5xWYiSNDLaq7DFSwfKRkRsJDJBtPkK26k8xQlOAZSfXvtlRyKIvBVpevPvAQnT3XnqyGjmxPj+hQmHVNhbCgve9FrVjh6yhMBZlMVN6txBM9zEmvLW7uv9ldCL6gFxs/gDlQ4SCLDuiYG6tDb+56o1FSU9wQfGq5cF+QimuCWAwHIZ2LdcHBXhmvHhL0IB8uGcUZLV13/LS8I1uZxy3ShXaJZ0MsiDlesZDaAbIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7soZ/dDTPy/G1dJ1CfJohvGOKrZfvCstxmYZoCVeaac=;
 b=Y6WSRUZ/j7AF4bb7FA8Yv2rL5ThKqmqEUbl3lBbZgXlludwv7YiYrZezy63OdGAUYutjk/f8N7qlEhHGV2MwpzXXyX9AZv2yLZaGgpWewvTgalgajUp55c/T9uEc8D4GF6tuYChgf0+SXLhY22Y2tdr9jEYYR+Nz5VG15Xq0xU0IEQvUdHg4SwH2Tys/1SebNj3GCSZmAd3iXx5w2IqNdlJ5Vf4BY3fKVnhiqDkWqcb5R8AqBlpp5cDztH/Xw9ZWSgtLyGwMM+mUI3mTOVb3cUHLIJoe3yAWbj3u6GdJKzJ7ERzrl8BG95TnmhjogepXCzGAjlnVygfHpaUBGp3uYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7soZ/dDTPy/G1dJ1CfJohvGOKrZfvCstxmYZoCVeaac=;
 b=GexbqtoB75p4fJEl+sN4olO0WuUev/nDoMXNNxvZzCRjf5/XbVcWj1PM6x1WXk4T4Y8BHhnxmZUh/TkjpxEb35VmikofjOTrYkZ/aRuvpTV5mTCBnP112Nt8nErRIOmZdTr+ulgWLGb61KVjL4K18eyvTqNqAUKGnBTkrzLo63c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OS7PR01MB11916.jpnprd01.prod.outlook.com (2603:1096:604:236::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Tue, 26 May
 2026 02:18:48 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0048.019; Tue, 26 May 2026
 02:18:47 +0000
Message-ID: <87mrxmhq0p.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH 35/83] ASoC: codecs: lm49453: use .auto_selectable_formats
In-Reply-To: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
References: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 26 May 2026 02:18:46 +0000
X-ClientProxiedBy: TY4PR01CA0106.jpnprd01.prod.outlook.com
 (2603:1096:405:378::13) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OS7PR01MB11916:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a5b840e-5998-465c-6804-08debacd1e82
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|7416014|38350700014|921020|56012099003|18002099003|22082099003|11063799006|41080700001;
X-Microsoft-Antispam-Message-Info:
	p8ViHG7PZtW+rWfz3/UK/kPE2WphSp/OabwIcIsAUWHfFwannIDqXdenWMsCHWD2Wc4Wh2NceLM1rO2zirU/H3UkBHdhegXrDznVbdRZEd5xftGMfiiwXDQY/oTV3FnABgVJJIMcuoK2luBwnHQmlsXzfzKVsEQyN1bCFSUUrWhOyPnAbdnvHzNkIf4aLyrUStcL5Ck4B4oQn5bhk7rjmpDgNB5XbR5p53oeZYxY4PUmvQ9TjLkK6qCasT4dxIR15eWJ1AOFP1VlDooRYXCz44iloJhm354p9kNs3y0i1x/OXPX+PJcMI+oOnQRWGzNeq/vpelkbwn9kXkmgrmnOobdc/L2sEbF0B0t2hTyWyJyEgl34oEQcWaFFp2EfLwLGCJ0m+Aa9GFEUsIw+mgv+657t47yFiiqkOjZE5ChMWqH4zgmMmslb+2RozAbMuNK4Sg5gSwb1oaX6P6mDqlf4Db2q2MkD8VgAmpUpnOUUzqKNdYgvb85B7L+gn1o4pEwUUG76K3KW3uexCm9l4AbPu6qsaHUMsCvcX0uSTAJv1vJbpZH65Mao7NdJ7GMWvKK91mtk5cb+obETnhaH5hR9fSHWJDEXuXv24tFeQBvWhOKUqAAZm+a/Sh3sMZ/TmLirQKe9BfwHtZWgupJTOtFsdqjiaTOIVCK2I1EdBlE7eejNN5Fo714l7GOjcFKrWjBgUFJoX4dOJkiUNONuSZuFW/kwrbVg2tR7RfVO5BuxmAYO4NpLmaw31aTkPRLSH4c1nqp2oR5DAbPGMoCxAsoyvnwimuiD26Jljc0Inb7vmN8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(7416014)(38350700014)(921020)(56012099003)(18002099003)(22082099003)(11063799006)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4b20HZQA+W3WZAZq18RRaHOT20fE/OuL85O0SqGu8BFQps4B2NUIS6FPczpS?=
 =?us-ascii?Q?He4vCuBgQj7wNTqUV6efGiAznWddZO0c9CeCt0jqlYTvI/BS4cZr11G6wi/q?=
 =?us-ascii?Q?5qC3MKaz6iYHuaAU+GTgrinFVJLSK8PqMXUrP8QztXqxK0ZLY1NOCbZiSs5T?=
 =?us-ascii?Q?eLTCKcXKzqlKmjq0eOqLcSmLhinw4u7qga2EMxtBTdvGyiQ+Bl38ABplScf6?=
 =?us-ascii?Q?rk4PDGzRUPUfcyJR3GyriaroeN/hnFe1k+VGY6Zs5ScfsBX+l0QqSE1U+5Lg?=
 =?us-ascii?Q?ivs7xWjN7e4oc7tQ/qqnjX1EjRMnYyCjzblMdkk1VxrypM6+UM8NaQNfCg7W?=
 =?us-ascii?Q?ru4I2cCY/w/LawXDi+eZ/K2c/mUTvYIGYyk//K8UGadpb9LSnRoKaBoJjiiv?=
 =?us-ascii?Q?uaeyhuTMEcV8zuiz2Ilv4/nQcIMMgDhiAh9pXvbUmbCP0RCDCdifArzCwm4A?=
 =?us-ascii?Q?h1crHdS2S8nICxnxF3DxfvIrouYpEI2dcACB4HTI1HzN5iXtyRCRH8pLAbGt?=
 =?us-ascii?Q?F40ccZn8nSQZv9O+a1XoBBSJU/ELjC+3FJTAvPuBBYZKkvf4FCZJi7w/lwcU?=
 =?us-ascii?Q?1qY66mm8SXfQh8furIr0SLX7i0Z6FmFHbRdXMvgRlZgVuq3LG3YYXrYQ6pLu?=
 =?us-ascii?Q?mxJAZECtk5q432hR4EavT56SWlmvl/izaqa7j9TkT7yhrmA1D5EJhV92x3Hf?=
 =?us-ascii?Q?5nTl2OCkHaZcSJhhUGGMn2JLQHdlXShUuM3bmAp1BJE6Tc203Iw/y/h+I9KC?=
 =?us-ascii?Q?j1LylrO2B6NTm4wyTw0zvVSjN10oSZoU8i3+MYkhTib7zEluAJr/3KMTN5Iq?=
 =?us-ascii?Q?iV3bPx/mNbBJQkFXezkAaK/usK6l994WGkbNoHop1TXPkdyiF8QjjWwGKlNC?=
 =?us-ascii?Q?LD+gNR3EDxNC0HjEoIwBzmQ3NlKz0yeRMwdGYUjFn6v3YbfdyOYtdNJJ8BY1?=
 =?us-ascii?Q?PGC0ErkC+ix084DWesJpomZcTH6XzfLJRPWTnFvbNKOt0IqvusZ7LBC1wPF0?=
 =?us-ascii?Q?1eQ4thVEEb4xJkxiKW0SUJcn00pfvtdQq4n/AvEAQ1McjWhGJXFYDXVBR0vL?=
 =?us-ascii?Q?qWxTTkX7J+cXO0eBd+4FhhmXCcL2/qnstARHbBXjrRnnQ1/Dxrkf9NWe5qiv?=
 =?us-ascii?Q?qj0ZQqyCcVWqJNrRhK2pTGdVi/uFBZmWSKrr3wKD0sMNrkDDP6ufF6d5Iopw?=
 =?us-ascii?Q?NopH9ObwQT7qW5yMNkX9i5itHtXBvE2s6KZ7fKYyfw7Z0GBeJJ8zc0BdJfPG?=
 =?us-ascii?Q?ET9pvSKeWYwb4JjE6qR8KBSs4cFSYo0fCQ61yv/m9U1LE145QVg4QpstsAop?=
 =?us-ascii?Q?KRvbvtIb3OR1aXPtFCWqvM4WLPHMwuw4wwswK8gONOB5pRr3G4CEjJAY2h9q?=
 =?us-ascii?Q?KAOSFjaLFmOhdmaPlWrDu2sisH9ATI/5eKQ0GZE+9ALzGljoPMXB4A/95v1x?=
 =?us-ascii?Q?MLnt3KW6mJEZZFf0RG+tjsmmUOXfSMHVpr0UF20yjr1jPcDCe3pMyBlk3nI2?=
 =?us-ascii?Q?1tDUJPCXRhlOVexuvF/nnhmPtZez1gkFMOLThWrFrg1v2dzFriMotfAjemXy?=
 =?us-ascii?Q?jLY8HPrIPefOXQHigoMDg3ZijO2CHaXF5LyPoGTqsj8WQdSMzRfIDX4ztP6o?=
 =?us-ascii?Q?sHxCXnhnzWF3eV2Ckw9pzuRaBucgTCCuCMZX67jXRe0e28zkgZCntYVsHGZV?=
 =?us-ascii?Q?UZ+V4olv0K+FLdwa4b4P9575n/LAwz4IMMNkuIdEUIAlAyLy12O3peIERkoW?=
 =?us-ascii?Q?qLfhXm4Fj67MSmsC+gmd9jj50tYVc/qztwZp8c4J+VSJootlvSf7?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a5b840e-5998-465c-6804-08debacd1e82
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 02:18:47.7697
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5c8rX9nywWnG5ZlGUhPF0edXY9qZDK0g0nZGILmbBAU7AoLfnD8DAvBkS/YJClOzaM/tUIBHs7Sdiig59pnHCZeAzOw6D4QGWlzPuOcOiqzgXdpFr9JO2aQVlT9Z5vxO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB11916

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/lm49453.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/sound/soc/codecs/lm49453.c b/sound/soc/codecs/lm49453.c
index 6e2e292d143bb..991555bec712a 100644
--- a/sound/soc/codecs/lm49453.c
+++ b/sound/soc/codecs/lm49453.c
@@ -1283,11 +1283,18 @@ static int lm49453_set_bias_level(struct snd_soc_component *component,
 #define LM49453_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE |\
 			 SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S32_LE)
 
+static const u64 lm49453_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B;
+
 static const struct snd_soc_dai_ops lm49453_headset_dai_ops = {
 	.hw_params	= lm49453_hw_params,
 	.set_sysclk	= lm49453_set_dai_sysclk,
 	.set_fmt	= lm49453_set_dai_fmt,
 	.mute_stream	= lm49453_hp_mute,
+	.auto_selectable_formats	= &lm49453_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 	.no_capture_mute = 1,
 };
 
@@ -1296,6 +1303,8 @@ static const struct snd_soc_dai_ops lm49453_speaker_dai_ops = {
 	.set_sysclk	= lm49453_set_dai_sysclk,
 	.set_fmt	= lm49453_set_dai_fmt,
 	.mute_stream	= lm49453_ls_mute,
+	.auto_selectable_formats	= &lm49453_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 	.no_capture_mute = 1,
 };
 
@@ -1304,6 +1313,8 @@ static const struct snd_soc_dai_ops lm49453_haptic_dai_ops = {
 	.set_sysclk	= lm49453_set_dai_sysclk,
 	.set_fmt	= lm49453_set_dai_fmt,
 	.mute_stream	= lm49453_ha_mute,
+	.auto_selectable_formats	= &lm49453_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 	.no_capture_mute = 1,
 };
 
@@ -1312,6 +1323,8 @@ static const struct snd_soc_dai_ops lm49453_ep_dai_ops = {
 	.set_sysclk	= lm49453_set_dai_sysclk,
 	.set_fmt	= lm49453_set_dai_fmt,
 	.mute_stream	= lm49453_ep_mute,
+	.auto_selectable_formats	= &lm49453_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 	.no_capture_mute = 1,
 };
 
@@ -1320,6 +1333,8 @@ static const struct snd_soc_dai_ops lm49453_lineout_dai_ops = {
 	.set_sysclk	= lm49453_set_dai_sysclk,
 	.set_fmt	= lm49453_set_dai_fmt,
 	.mute_stream	= lm49453_lo_mute,
+	.auto_selectable_formats	= &lm49453_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 	.no_capture_mute = 1,
 };
 
-- 
2.43.0

