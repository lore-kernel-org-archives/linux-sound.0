Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011027.outbound.protection.outlook.com [52.101.125.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 011682EC0A4
	for <linux-sound@vger.kernel.org>; Tue, 26 May 2026 02:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779761654; cv=fail; b=AONcMcZuPbixdEq0MiN5IocmkXLdqOML9tSyGMzYjmT6Wdpo08lrvO/tGxmlKw0hrfcOb5cnIKvPo3opKlaV015G9XXdqsWGdvo3i/cyQDnEU8+fmge44K3jFLpghJcsUWUtwp+TTnYUQG0sqlYAGP33RULNF/z5Av123mz+J8U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779761654; c=relaxed/simple;
	bh=DU9P2RpnpgFJcjOYmaKnwkkihQv1OEyfLZ4XYz6KEI0=;
	h=Message-ID:To:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=FQv74p9KQA/M2cBlK/17sGlvRcAxjA1tBh+BTbjGLXoIKoa252pIqUwOg5aMXnqoVWvciRjX1MOQ6cGiWbeSc+KihzC22aYhQ6GFxMkXMn49u4rfEnMALMLGHVjOwse8B5EZICE9ppVcwJ43UThKERxhl7E0Qg+eGBFnwrG4RBs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Kivbu/pu; arc=fail smtp.client-ip=52.101.125.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Kivbu/pu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FLKVQN+T6316lOZ5enTTsc7fWhVNGosWBgPuPe9kDBvWd7G0EERYf4qW/yINGoN5F0I0+BlVDJ2cLEghZebIQ9bjhQc3Kl/XaSrH4pfxHpHjewi2UFRsdZ0jbCMQvTNB2+9mCG0Latd4dfnhu07DnDIxBNs6ob4ODwPM6WuDVT/JaRK3AhQHtL5KdGuO11Y1DcGYHiItpxKfYw9sUFfHjiwcKkVzt9Exwsj8nsAQTze7MU+EDugJ6NlabcRkOlKwls0rd2iNoc3yNn5ZQckf9yS6uNynK8OS8VLDKOaiTH3w/AdcC/jhGDwOZvFYtQC2yegKFY6m2jA4NWedf2j09w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vsbiIl994YdFoH77W/hl8nRjgAFpH7VKaXNADcB8wkA=;
 b=OVjWcj/QCrVRAOduU3zJ5WodDFqi/gV6K9fzoi9BNvDcd9HMrnW5NB/fzKvXK/UmjrA1fztoPttnZzkqhciHLor96PpahKrbAZhglqkP3lKX3ADjuqwfUCPyBpX85fj37C4A9EI/66eNgyepkl8KoXKJCd33v3eIYMO7bnuY/F7CSq6rzuW7e/e6lL2O93fZi5n7OUAoOd+R1zkUvwEEKYbSIiSM8OLXZoFXDurgJfosw1Y+VE3uDaMcO2pZOJYtn5tpltAaNkKHYewCldDuhrxyJOV+O1jfabkrek5w/jvC+i+ihGobAsslpn1uNsfnF56WfxMY01U5AsKTLDMCAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vsbiIl994YdFoH77W/hl8nRjgAFpH7VKaXNADcB8wkA=;
 b=Kivbu/puKLpi9xs898IeqyEtmxtP/fi+8cIaDZhHkS1Qwiv2AiOk8XBxPYf6LOvJ3F2jnXeMymdG1HyGSZ57xtxoHl7OiS+nZecUkXqhhNZsIVEMFSn+4KPCMoisEUN+dOKcvgH+K8/vG7GYcaAIN/Yadgotvg/vIodp8TNyVvM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TY4PR01MB14087.jpnprd01.prod.outlook.com (2603:1096:405:208::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Tue, 26 May
 2026 02:14:09 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0048.019; Tue, 26 May 2026
 02:14:09 +0000
Message-ID: <871peyj4sv.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH 25/83] ASoC: codecs: cpcap: use .auto_selectable_formats
In-Reply-To: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
References: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 26 May 2026 02:14:08 +0000
X-ClientProxiedBy: TY6PR01CA0004.jpnprd01.prod.outlook.com
 (2603:1096:405:3bc::13) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TY4PR01MB14087:EE_
X-MS-Office365-Filtering-Correlation-Id: 81648cb5-b3ea-4d29-9777-08debacc78c0
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|52116014|11063799006|56012099003|18002099003|22082099003|38350700014|921020|41080700001;
X-Microsoft-Antispam-Message-Info:
	KBIj8SL2aW5euL3dga2cCzvzNxKarrxLPCRfl6p5/QDd8LDUzRucFG1cQW7b6eeOFBhF8x5J/pC2de1Ty7vy4+Jsx/SJE9OjcZxAo5fY+nXBlnK76yeFOy+Iq0vserJEygzGTe1IloHLS4Va1i39wCG/IS+gL3iS4KustMQ0MwaMSVEDKgPdv1DerL7oWnoKOA26z/ZYCRTa2laiAgZY9+4HQXii0vIi0qrlkK0oLtamfn9YtPl5pgIN1Ak4Nhs5ktcQDoXLvC8JCFaGbZWKwcb3zK+62IJy6hTStL9kPFGSoLYyKZhT0mmv/mkHAZEJXC7+IfcZvw38XG6FIvceRG8EvXs2LYQGGAJCJ8YBCRGlSAydzO4fCK6kX6fod7NGJo2UkluERIAUYAvS0ZqDMAu++o8nh43u5Wg4iyuTVaXRC72tN+r2m7YfN2vx+KBsrQvquP6+kILVkFcFlraOV6T8SmB0jS47pjvN5ZlPs4DYPqBB+5zBskVfPVSZ4VHuPWiurlhzcJE86pZ5/mx1bIDCK3l89UelU9x6gc0LCOyIqhNOBCBDfCEu0KPiTZaimCpujPrtMUlc3AJwb2ecl07WI1mtWqbRnqS1wSpP21yMXhVgREUvMT3ltcATsJg9WxVzTO+U6WIruxHZePLADPoMwZFH7CAY9x9rMw3fX3+DRB/26GdLSdQwfp51XxSaGODAHRSOuwVK0UNlHLk5sqCLGSuGT2BAidMnkysJXe/gCFVEymPYdGS/t62Yz3vfnao/tdRiN/nPFfgQO/3Qi+V/ij661LpedyjXjz+/piI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(52116014)(11063799006)(56012099003)(18002099003)(22082099003)(38350700014)(921020)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kR2lxEnIknLGIcfTZ7UDI3p2CTH9QNnvPz626gMclxpWnGxlD0swPIdDuQ7J?=
 =?us-ascii?Q?t6sO7QE6eKoPS4lNPISy4Rp2rLALqeLvLxDEL9V1OHeXMbkfmPs4COCAJpLk?=
 =?us-ascii?Q?XtLKgbcgCsLmpIbOEWg6X6oNbv+pbfL5l4p4YErt5uiVI4SblTVNix1wczcM?=
 =?us-ascii?Q?XySjTWYy/ch4bc04kBXJ9f1VUr6Qe0ztl49Kk71s7j0MvuBhgiuYsDZqqTv9?=
 =?us-ascii?Q?Lqs+sZI8ABE94cus3Bbkzopb4xsf9e7myRgHVBK7Qy/A+m8uXRlj5+lh8xfb?=
 =?us-ascii?Q?jBvdkZJLkIHxMKnLjIVR5DmEzVegxpLqbr99bE/S8ZNo+OzAjzIMDLqUOyX0?=
 =?us-ascii?Q?WavkeHRa/hdqgN3a3hwm3Ndfi2UiS138rQ801lqZEdouOrZWvv5hO7+YsbrW?=
 =?us-ascii?Q?rm5DwUzFNsSsg0mzex3ztvOHpMc66+UXL19C770n6qKAJKV/X68U6CrXYtcE?=
 =?us-ascii?Q?vH4RZYOsvghVbiyu6i/Yim8iv1QDab8nNb8vxsJGDPDo6slJbHNztUXvCHRC?=
 =?us-ascii?Q?drdJrEfUtaAZbDRiQeOh3Hn3y3zdiLCI1jfbBLoOVlv9EUWnp5dMT8T8UdBM?=
 =?us-ascii?Q?uCcFXCllwmPtwcKvTB3BUMTXMZZmdhC5qiqO6Zfa7ySXbmHf9u+APPOWW1c3?=
 =?us-ascii?Q?ynYzhLPCNJfwGC+LyhhPs5N1QmuujhsI1VOdjr+vxawco/C3IQZlU/flIjSv?=
 =?us-ascii?Q?ETIMeXt2mwo9G6Rf59gFAJ8uf6pteFAERLCxW3PFH4qu/NxC4X9aNM9zHNls?=
 =?us-ascii?Q?E9C1U6K8qA8V1Ni66hK7CbDgxbHGK2dEz+D13dR3TUcZNCGSpNHmz9XH3450?=
 =?us-ascii?Q?D2ua4q3MVOAiGEPPyjVPqx5AGnuBSWfBA04n2FESjXfxGWipoagTsVuosm1K?=
 =?us-ascii?Q?vRHzF17MSMFwpc+/iX9veyDE7CrDMnmIwl5ttAFuHEFIHlay22Y+AOLCSWF3?=
 =?us-ascii?Q?lL7XiMw7oyT3wc8SWz8wlB4v0l4FcCuPGGrvNFjn79OqPBoQ50wXerFAqXjV?=
 =?us-ascii?Q?DrRCMkZpv28zBYeX4NqTafP0LMCREbZRkoEqIAHK+Sj7ekszv7vyxfKnuQHG?=
 =?us-ascii?Q?HlpKrf+cLSiI7pJKPD7XouR59l8l8/IDMAoVBHrK4hmKJfqjb9FY+8EockxN?=
 =?us-ascii?Q?gXPyerx57k3j6wlxiqF38uyd2dPxD1G+kZAFdfIJdP+Nb1tCYiXeZv3dqSgn?=
 =?us-ascii?Q?zFP5fLyqYv4KRsLRV8cJx4qIg93xYi+PT2g/ERZBPHcrmSg5Rs7RNmfJKp7V?=
 =?us-ascii?Q?0841MDJzHYVjPkzHlq5153xZqce5PWBZ0YWEAlfWrMoGrDGpygaVflYRV2Ev?=
 =?us-ascii?Q?CEzk9KT2GnHaw6yzh3bYkITl/JkEGGsnTYI0HmQbXhuyk2B8G6lG+8BES1Ee?=
 =?us-ascii?Q?40hjMUAcN375b7PA6TCIBbrBkKmv9nUXJI6GluFI0O5MIEAvHT3DC/tOd82T?=
 =?us-ascii?Q?tPuRiKrO7UA01sYFD+AHwFjsM1Fyy+eMkQ/0YRC8AEdlI17AX2qbMJsiQFuT?=
 =?us-ascii?Q?gf13KXQ9qo8Q2L1dY2KGf5Y+KPPwm/f888jBW5TsXqsXAtygAHaGr/YO1XcB?=
 =?us-ascii?Q?y5VIiJeyq7cJfMwT7i/6wXViL+NwrsogAshOI68DYN5QdLRx7Z/P82/SyRjy?=
 =?us-ascii?Q?fAjT6hxj3kbJzdA9MnDSTuludGJevU0Y7ZAibBKDfzJmjuqdW/uIN3uFQ8xM?=
 =?us-ascii?Q?lDg7Ke0SWJX9G8NbVYFbodalupg9+R7UZutRf9A8q9JW2IzCOk3zTBdkWBs4?=
 =?us-ascii?Q?W3DrlV5Mlx10Cr/ONgHIDbvQ4+S70NiVdZoY6RvTu61e4mgjndRE?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81648cb5-b3ea-4d29-9777-08debacc78c0
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 02:14:09.6661
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PXpPYIhgmG4OfhgzpBWzUK1ZHDCMjBUDLQfwbnaa64Z0e36kFRV4vMNczUNGZEuqUeNFTQLW4IE6Cl+1tYk49tXc05CHTdaL5vqjzX2fPYjbvX/L1j4Hc5Vw3YQgMCkj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB14087

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/cpcap.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/sound/soc/codecs/cpcap.c b/sound/soc/codecs/cpcap.c
index 6b80c455b0747..e4f0291d7548e 100644
--- a/sound/soc/codecs/cpcap.c
+++ b/sound/soc/codecs/cpcap.c
@@ -1253,11 +1253,27 @@ static int cpcap_hifi_set_mute(struct snd_soc_dai *dai, int mute, int direction)
 	return regmap_update_bits(cpcap->regmap, reg, mask, val);
 }
 
+/* FIXME: non I2S ? */
+static const u64 cpcap_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_AC97	|
+	SND_SOC_POSSIBLE_DAIFMT_PDM	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops cpcap_dai_hifi_ops = {
 	.hw_params	= cpcap_hifi_hw_params,
 	.set_sysclk	= cpcap_hifi_set_dai_sysclk,
 	.set_fmt	= cpcap_hifi_set_dai_fmt,
 	.mute_stream	= cpcap_hifi_set_mute,
+	.auto_selectable_formats	= &cpcap_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 	.no_capture_mute = 1,
 };
 
@@ -1528,6 +1544,8 @@ static const struct snd_soc_dai_ops cpcap_dai_voice_ops = {
 	.set_fmt	= cpcap_voice_set_dai_fmt,
 	.set_tdm_slot	= cpcap_voice_set_tdm_slot,
 	.mute_stream	= cpcap_voice_set_mute,
+	.auto_selectable_formats	= &cpcap_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 	.no_capture_mute = 1,
 };
 
-- 
2.43.0

