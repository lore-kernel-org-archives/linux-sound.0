Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010065.outbound.protection.outlook.com [52.101.229.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38A93304BDC
	for <linux-sound@vger.kernel.org>; Tue, 26 May 2026 02:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779762425; cv=fail; b=OsqjyQOaVQP4M58/6RwnuKG03dem3B02C6aCl+BIfsDhxVg/iJb7PUdSO/Ho1AoQDOV09m0PU3yGCI+gV5rW9D56juEcQXq3Q467RyFBF0/JQVgGg7RVjvMdBoi4j5Hd/YbW36xtj0FmhteM3RSDPGwmbNWh0koHqarXjUnL2zs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779762425; c=relaxed/simple;
	bh=kKUOtHxblLZhR6h6cS/GQ2GmW/AMszw9cuo6afsjZJ8=;
	h=Message-ID:To:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Y4uxPZSAHHba/h4COG2Yv/rPj66e9iYpJL1s83U9BdlVZqwvyvhhtsfl5YZKeXnMhS+U6/E+p53TfXYrCqLqdWLymiRm6VuFhlspfB1b5sPVkYV4deS+QKpCa53v9KzAKq3N9g3CWAvdnWo4oIZjMpsbaN7qwM/3R6ZsdygKu7c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=JgtiDk0g; arc=fail smtp.client-ip=52.101.229.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="JgtiDk0g"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VxKE8DSmit5rlfva1nsgtgOooISNy4vYGDAqO3ESNYDBLFMBi/W3jjrDmRNbkDEwsCUH60MQ+3T+sTbbNazvK/m2gZOjcWaaeq08ditUaE38IqKtu1ltpWuv13v1cOo+GCaSSZe4wvXas8CHqD4v+HFbtGLnfSpLe2ADXdiPpqnpl2tbsfiHs3wFHPSHp9wIuZL0YmTacTBSNUVStue7dCzxv1VSFJl1hcdx4v0PyZquH9B9GzoL09Y+OYyXjawwOu+Xx5Ek6Za0SmTFiiFu8vp5sF3rzrKwXieKsh8snEkLt+vNCBUKV/Ut8JT9KrA61KKX6n/5f+5l6pTtJC+vSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/M999017uvlAlBDREuF82ZEbzaY5RUSRHj1nVhs59Vg=;
 b=W+C6UGnIdnmmj6nmioghqcFjgs8hzfuHS+ow3O+TiBFE/z+93Sn9LQe9PE+2RKyGq33QkgVlDFOODqdHwdK9OOK92Woix/g61nVn3iVv8+Wxr61bAdUyd8nWqAQSn5mnaBYg0WlPNdTdOqEndwhj1gsHepjqTfXf9ZjcIDJk0h3aqPfCc74gKk0jMpI0zy1g85Ma/5mFfDD7xoiG81hLxapygJv7Z8XU147ncdo6FInogq6qRcKFZQIWb6Wn8MPasD9eE8iGzYOLiGT1/GiwMUA0eMYe4ajaViaky513Y7nafLYCbvyZRMg4wx83Nu1hIbxzQ+DN7fd06kWcLKSTIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/M999017uvlAlBDREuF82ZEbzaY5RUSRHj1nVhs59Vg=;
 b=JgtiDk0gzqmdWXHfxNvs/fxNhSpO2VCFoTxdE6NhUtjHpY9rVliIqGop6JE+IemalbzBWqbA2kDyNZc8HNHTlJJh8J+LIXUphzL/ba3DtOHssHmQGLKzanHFDm7uUJk3JW+8Gs9rCIx5wD2wO5ef3woP3AmUoboWLgirABF0Wh8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYRPR01MB13144.jpnprd01.prod.outlook.com (2603:1096:405:119::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Tue, 26 May
 2026 02:27:01 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0048.019; Tue, 26 May 2026
 02:27:01 +0000
Message-ID: <8733zegb2l.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH 74/83] ASoC: samsung: use .auto_selectable_formats
In-Reply-To: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
References: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 26 May 2026 02:26:58 +0000
X-ClientProxiedBy: TYCP286CA0268.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:455::13) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYRPR01MB13144:EE_
X-MS-Office365-Filtering-Correlation-Id: bd4d97e0-1250-46cd-6e12-08debace44af
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|1800799024|366016|376014|921020|38350700014|18002099003|56012099003|22082099003|6133799003|11063799006|41080700001;
X-Microsoft-Antispam-Message-Info:
	+WHscHCa9EkORwcivd0LjCDqq+vEYsgk/HZxbi6Q/8yxaf0M2jaSlK8BObzRHZsxvUmXu16EamQmMqfWx2Yv9MdLMQ4grhDgUwAWBDrscooKUc4pqxORmhLjkwwQ/a2qVBHQAPF+CWWZx0X2s3npJrBB9DGpR9upBcwLyzMQJfkgm/EduPIXyO2LRJBRD6AjCZG9auBQjjoEFmMTeZHysN9YSl5xhQjHNGIY31m5fF/305aoD3lcXsAQ37PxrObNDDU1yavRQ64JDmPHpxwR/HQehbD4p+2X5Hb2GBg/4jYP5f0QL0ubhqq77NasvODap+fiAu6uL3wTcgGbkNCEwGw+XNbJZyT2jTmT3uDzhw3yt5LefKV4UlC3ckKtCiEQdRto4jY1uHELSEiSNLP5xWUPM12U0w0uBUMWLdzSxBv/UZnnboKfudeV1DFavdZU6NJeA12EgS4FoS6xAR0U8JW6aP0Z2HQd2aAX+fMhiOjYB3fYtEvu/aEHd3YIWtuobmnFPCzK3DV4PoOzua58wzsceancq0I9syxbhSnZbpjAIx3m6a28Mhi3WDwPnQT2WS3XiW8/FVNdvkqP91oB+8RlAkYoOJrn5nS0cgdbEYOTjzUaI4ohDD+fWfbFwM5IkOM2YpjMlb4tlQenx57S92cLqGkxW23mFU0SvGrFX/HkuuE67jl5G90tNe8GGDp78Ietu2XEmHPAAQrjEpxkhZNmqXJglZcnx1WucsD0eWR+Wz+EzUCY1hlOwFAyun4PMGTc6dvJTiLRgdzjCgypu1ioTU7rXtTIhWVVJaMr/7o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(1800799024)(366016)(376014)(921020)(38350700014)(18002099003)(56012099003)(22082099003)(6133799003)(11063799006)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zCa+Sfc1P5O0wmAY8WtbZIdcLPUkIu29HagF/t9fmOhvmyS+tqNLK+mrw1zt?=
 =?us-ascii?Q?8Eo/xndteZXT5+c1KG82uelE5/PyeUYO3nfof+87uWhj54/OVWD3/U3/vmiH?=
 =?us-ascii?Q?ZITEgYUihbhN96oNen+YLJFhzyZfZlIoeT2xpov9CNSaOYTbV5xQb8QwYqrC?=
 =?us-ascii?Q?bpMEhez4UWHPfVQ3rbFouGWRovRbKgC/YFZBzR8M0TpfA/I15VKxhVaDrkkP?=
 =?us-ascii?Q?c09ZHCQugMxj67KbQCdmmm5o3Uy/Y3PpT+PbgS0OqR6rIdUYHMJVSPVTnJs8?=
 =?us-ascii?Q?fGdzcMthDO+PRJFoCp60EPt0fGAcjtW0m1Ku/uHnDOrpy6pHeUyBfMBEAaT+?=
 =?us-ascii?Q?dxAj5HSG3FP/rrSRLv8Aj+AetEuSlEt5CjABeBNJV9G6ktja6cYItP2x1tRG?=
 =?us-ascii?Q?RryeJuXVKdim0+4FHoa8TlsF7DAGsAIQw2BENfCBfY4pZHOron5hONzcWXAj?=
 =?us-ascii?Q?pAjcb2hrrd/k1ALz0WdrOo5O9v0jMY7Mnp8ZfyVR5Rm5EZTe82FKDWiAfVfW?=
 =?us-ascii?Q?/VAURsnU4lKcvkQlWECP4mleYn78u1MtL6PHaxAKExGL/pmfD10n3drTSxrJ?=
 =?us-ascii?Q?cKN6uktq99/UcrTF5ZXAXZi0M9A32ac8X3Lt2mKkhs9WdYHyokUw7EP12RDV?=
 =?us-ascii?Q?2K++oVpt+i5c84EbCm5lfN5EOswUnggcYQ8Qq8+Nza6ZRqckczTrIZipfltf?=
 =?us-ascii?Q?LhruGmkMalfbuRh65p6JhMX26vukmZCw7jzQY/1gajEE0i1h1xhEtdyDmAU1?=
 =?us-ascii?Q?1ZW1vb4aLJ+ED/wFP076exYDH26vpT3IDYu+o5zmkeBsY+Cx01iTBpu23fvt?=
 =?us-ascii?Q?PH1XxufU4PahgvNVwbTiaDzbgJlyQRSn+PP+4onKgL+0oCRY0QFR0Kgc5koo?=
 =?us-ascii?Q?Gd45xVFnbJm4Jv/g/b3/FiYZ5q87XVwR0Fly0u+6B265iPBaS9sGhHjHooOB?=
 =?us-ascii?Q?gMXL55/uJOtr+i4M0UCFtJ0LcU5Psb8BwJKw6N/cs8+AlqtcvhpXYhKcij5c?=
 =?us-ascii?Q?h+PIctpAOY1EXomZAJ2NDajwGL+Y6izV12l1sNijbcQAYhrvi9biUXG+b0TQ?=
 =?us-ascii?Q?WoLS70hnw+MpBRIFBe32Z9mcOEIf8ZcMLRAub7ks2w/neg9J4QaFr3Ui3woG?=
 =?us-ascii?Q?c0/g7Yrn0WZJqCTklnwBYVeb6Z6LVEmDBHAaemiGat0AprQnQciO6PocdoBi?=
 =?us-ascii?Q?CdCN9jC+nuCLcxYJ4SgLLPP+mBxxGf/m9W1QXwvFkmcUOzfuJtb5780VWQPx?=
 =?us-ascii?Q?hhvLxta/eRaJmM2S19cfLIpwRd2u4NpQQ7a37RF+B1vIc6KRvZbWJKbV1hDj?=
 =?us-ascii?Q?c5Gdzxgy7Ci7WVzHmEJJzDdxgcSstl1ztPZCC8n1pU67V265JZ41pjYgYzdx?=
 =?us-ascii?Q?fb5TYYkV7O6s5EMtajLnYAOnV4zYTvYYgfXrthFeYhmkg+4EO3jc+6FKFFka?=
 =?us-ascii?Q?c9+rAqf+8/1ifUDiT9gbQNqHdZ6L5LYTxLWJLZC+OW7elTHAY6AjVbY8ibyQ?=
 =?us-ascii?Q?yOvm5akb+U96D03V3jRFkIl7PF6/kHXaBhqJTW+zTz/IDsMo9B6Ao5NXXubK?=
 =?us-ascii?Q?XwPWB2ETfvzVXFEAaAWEA2q0JV2xr3GDXpQK1ClLwYAOFaT/J1cyhgo8jLyC?=
 =?us-ascii?Q?mqtpmc/I0YpiXAMuLTsQq4ez6V9bmLqvvWI+cPKpWMvoPZJssecfd/vvtROl?=
 =?us-ascii?Q?SCvTZGbKewQuZbGZL39USlS+xP0NtRf44yfrzd8PfQfpJg8jBHwCel2dx102?=
 =?us-ascii?Q?MSkt8VxHcPNyWhOeFo9VANEEbNUd9TX8dI9Z8mOAdNBcpLLpWLjy?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd4d97e0-1250-46cd-6e12-08debace44af
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 02:27:01.2758
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6fIq+wQiX3Zw2DBk1x2Q9JID17X2q1xsmcqwTaDvD4Tvehtbx+XfIBeVr6wCelZ0zhSJes/B3guNUzUF2fZXq3NTx202xf55yWyF4Z37r0Lu9xbkMh3LIXt9iAjv39l+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB13144

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/samsung/i2s.c | 29 +++++++++++++++++++----------
 sound/soc/samsung/pcm.c |  9 +++++++++
 2 files changed, 28 insertions(+), 10 deletions(-)

diff --git a/sound/soc/samsung/i2s.c b/sound/soc/samsung/i2s.c
index f80f697a5d55d..bcd6f45212415 100644
--- a/sound/soc/samsung/i2s.c
+++ b/sound/soc/samsung/i2s.c
@@ -1099,17 +1099,26 @@ static int samsung_i2s_dai_remove(struct snd_soc_dai *dai)
 	return 0;
 }
 
+static const u64 samsung_i2s_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF;
+
 static const struct snd_soc_dai_ops samsung_i2s_dai_ops = {
-	.probe = samsung_i2s_dai_probe,
-	.remove = samsung_i2s_dai_remove,
-	.trigger = i2s_trigger,
-	.hw_params = i2s_hw_params,
-	.set_fmt = i2s_set_fmt,
-	.set_clkdiv = i2s_set_clkdiv,
-	.set_sysclk = i2s_set_sysclk,
-	.startup = i2s_startup,
-	.shutdown = i2s_shutdown,
-	.delay = i2s_delay,
+	.probe				= samsung_i2s_dai_probe,
+	.remove				= samsung_i2s_dai_remove,
+	.trigger			= i2s_trigger,
+	.hw_params			= i2s_hw_params,
+	.set_fmt			= i2s_set_fmt,
+	.set_clkdiv			= i2s_set_clkdiv,
+	.set_sysclk			= i2s_set_sysclk,
+	.startup			= i2s_startup,
+	.shutdown			= i2s_shutdown,
+	.delay				= i2s_delay,
+	.auto_selectable_formats	= &samsung_i2s_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static const struct snd_soc_dapm_widget samsung_i2s_widgets[] = {
diff --git a/sound/soc/samsung/pcm.c b/sound/soc/samsung/pcm.c
index 309f024bf2a4d..9602e4f21a3b3 100644
--- a/sound/soc/samsung/pcm.c
+++ b/sound/soc/samsung/pcm.c
@@ -422,6 +422,13 @@ static int s3c_pcm_dai_probe(struct snd_soc_dai *dai)
 	return 0;
 }
 
+static const u64 s3c_pcm_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_GATED	|
+	SND_SOC_POSSIBLE_DAIFMT_CONT	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF;
+
 static const struct snd_soc_dai_ops s3c_pcm_dai_ops = {
 	.probe		= s3c_pcm_dai_probe,
 	.set_sysclk	= s3c_pcm_set_sysclk,
@@ -429,6 +436,8 @@ static const struct snd_soc_dai_ops s3c_pcm_dai_ops = {
 	.trigger	= s3c_pcm_trigger,
 	.hw_params	= s3c_pcm_hw_params,
 	.set_fmt	= s3c_pcm_set_fmt,
+	.auto_selectable_formats	= &s3c_pcm_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 #define S3C_PCM_RATES  SNDRV_PCM_RATE_8000_96000
-- 
2.43.0

