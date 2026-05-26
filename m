Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011020.outbound.protection.outlook.com [52.101.125.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1CC82E62B5
	for <linux-sound@vger.kernel.org>; Tue, 26 May 2026 02:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779761696; cv=fail; b=jd0ZFpiLP/Fq75caS+UASYuXpkEZMfq6cMrYy7fAvi7MwcXO8SOZ+vnOfz5pViGYa3r6jqLA2h9rOI4bhcNYg8eQGnEup8G1J2x2uev9veyWjdwR5QZKXHf/Vz/1Q9uFvRqDAN2giue5gckY+dRHSDRJtlPMFxhvYigIFUTMovc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779761696; c=relaxed/simple;
	bh=bFValM/q2PiBqQtPsXfMJQT3drCk6MR5zvkuBdWXFxc=;
	h=Message-ID:To:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=QGM38NuhG0sWtIU6+7TpRM0PyqvjOMHQHwh+omo+R7dakUxB0zOx/VwxRRJYLq2gC1x6J+i2SDciK7MWnxJ8BsnRbd0dfZRU1qqvG6ZP9EMl0qHonxqv/NzZy8BOwJ25Fn7HsW3BsK9jH6MoQAC6BiVuSIXP7hmGYjxNN1dFVo4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=ojT0T8p7; arc=fail smtp.client-ip=52.101.125.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="ojT0T8p7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HNmpJvSGdq5NzhhUw9C7ejZwtbtW4BgtUnJ36dhVTdTEt4ujV/erAVl8985W9wRu+9aDKXbxPg6CWesSZaBxABTZsWQxcm1T/4ScCVtIbFy2bC3dhRFc0dMfFK200MpK+cIsJU1bl6MkdUTMCJ2FMJAdJBEUGakN0y+uHJmh68naHhdrezYEofMDw3SxWkZaGjDKlOjkV0zGjQqzIWil8CchQQ/m+H95Tm3lmI9qWwkskxk8QAuo7MvgQsXRNj6PFrvUNNLPRiPY8D/Tx/yL7Ck6tRx65sWSyBT508oRMcPuynO3DtKMR3Au6INDOsbQ/P2/73U0/GbGhypz+ZEsKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XxdYQcWxk7TBmujXI4XwG2+wQaN0zrR0OjkSY6S+WB4=;
 b=T3wte+D9h6/ZZYctom7Stvd4TCUdM2wMIGBloPYTN8EHTKnsFB89vgQ2yNWlGTPwif1Kc5N6nmKW7oyD6YF310AFgJ5DlFzdK5R+XecVoSyAeY253365VxvFsDQR5BvQP5LaBjwqd0+I8Jlrzxa/TXNPNuyR4P5mgcQE/vn0/Zl8RVFMVtDtbiN0b46mXwTVS/TF9G0SNd68wXtV5yOipk7eyQblekBhpm7G/Dt2zoNYNGIvMBuCLHHIOb/Gq9I6F0R7wTpephcmtZ5vNBXxtS8adcN5bu0DNkhR1rYfre2ctLfJp8JdCBl6lOv3duEzhkUJm0/lmG33oTPimvgUJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XxdYQcWxk7TBmujXI4XwG2+wQaN0zrR0OjkSY6S+WB4=;
 b=ojT0T8p7a7NMBaNWXGJlZkVebNLSk3KGQj7QdobeJnLYMQ8JjUH3ZuSJ9xrhAoHWE/vj/glV8LTNltkYKT8Zo0DpXdGH1U3ShekOfgEhWqeQjdNz2Pays6B3g6mSTnWq+Y4I/YGHctSCg9deP5KhZnqzp0EIncN8lnwDSUDRBKY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TY4PR01MB14087.jpnprd01.prod.outlook.com (2603:1096:405:208::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Tue, 26 May
 2026 02:14:50 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0048.019; Tue, 26 May 2026
 02:14:50 +0000
Message-ID: <87zf1mhq7a.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH 26/83] ASoC: codecs: cros_ec_codec: use .auto_selectable_formats
In-Reply-To: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
References: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 26 May 2026 02:14:49 +0000
X-ClientProxiedBy: TYCP286CA0142.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31b::18) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TY4PR01MB14087:EE_
X-MS-Office365-Filtering-Correlation-Id: b1434e9f-990e-48cf-1213-08debacc90ff
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|52116014|11063799006|56012099003|18002099003|22082099003|38350700014|921020|41080700001;
X-Microsoft-Antispam-Message-Info:
	CxzpbiFewFj7Ti9GJ0lVh98xAQR7trUgfLDyC0GksqvEESTcSMJjGiayrYpta9QHI9M2BCg5JpADSx0bs8GASW+zJTy6hiCv5SCwmJMtRRsUEMwPMFJ0Mfe3pl8Z15LtKQsGB+Ihr5l70GFEq0m3tIfI27A5FE96ZS1YsE2y2bIRUZPCcNUQQ87k64tcKQWpALeNBg1nB4Gq3yP1AUDVxYhEkMSZtK1wGqVX9l/bDSXdKrfoar6hcscd6I5/r7rTQroyKXFxyZCORvnqYltONQ1w8kwvOoMfpY6I+ww2ZqLyGTS91/rZqsAWzkHJPqpYtUqyz7rIDR99bLHwPUeFNdl336wqj/lGRV47bs9zYKu3ZOynTMXLnKpNkCKoxyR4cMU28ZOZhYNw0TQYwDAW29AxIgQX9+8sY4IDEPTu7uxYp1imA+SCI9i0X7QRVhp/O7nPeI6MJg+JlSucoRNTta4kV5LD2a3CcGACSuIkFN7HwoOaiqQmAmwZzHf0fsjgYkgd2sEjNqjEwBcbeWC1Fl8Rxcb012Y4575qQN51QhZD6HQurS9876XGnDjMG3nB826TLJjbl9H6jL7vWdQLSSmOQ4Z0gBPZVw+aOxrO6x2ZKnvryQlZOkAtjwMlmjyR288xqcZ20/mpPFPB1x8kalH7VvjkRez4p+ASr+DLA9OS/yx+poQe6bMyg4O1p9kLplq7xzx45VHwa3440zdziDbl0ISBHJn4AStsIcBtCdnsQCI14mGiVmBG5J5yIwQgVr5D/db/E0OsQNx0Ea28jJBkbgzuyyD60walKxNSGyY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(52116014)(11063799006)(56012099003)(18002099003)(22082099003)(38350700014)(921020)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GSyEi7k9GEW10/GZiv+fuvNvU2Ck9ZzUGNXpe4FnmYFVUWKOpxWxiACtrNCT?=
 =?us-ascii?Q?ngajBv377c4n3hbAnA0QA4K0Jv2014r3m8+znF0nvEVZmYgnduAqbMtgFeUu?=
 =?us-ascii?Q?TH3u2sY+ZeJ+xScKBjGnyQCIdsqxq63Zy9H9J3Q+ir/FZZf7fC8JW9VyKMDV?=
 =?us-ascii?Q?0cngV3fAWR71sXkwGNS6nvFNdLHu5mZK5wgMP4+VuS3IWqoX4mJsLGXYBPhN?=
 =?us-ascii?Q?risIv3+lHlORERhu5kMAKhxup4pFpnwbMYqtTHUqW/KMO8AvBA+rJXiO1aSc?=
 =?us-ascii?Q?GfHPY64yGwF6rHcuyy0ZzUt016MF7QtImhO8a+41nxXlBl8qydWfCP657jSV?=
 =?us-ascii?Q?8kGuCTmJSQAfc3T/XE9x+NwWA2gnA/IVw7Jj7VP/GopLybe/FMSkfTnDIEdo?=
 =?us-ascii?Q?vkJUe1HgAoI90qhfPmTNUcw9pZiCbB9UrcUkmZ5+LFeIUsWwuDQybB8pVMat?=
 =?us-ascii?Q?SVBN230TRT/0XG1NgBxfQ1K6CFEUP/mP8YvJ9mKbQUkutERGQDWbbzob3h/i?=
 =?us-ascii?Q?hNUNbKdzmXbg2/VuGXGjLsuGrlRGPmELKkqmI7VDm9UKkYh/X3E8EkJXlP7F?=
 =?us-ascii?Q?vr2ZtEX4RH6H3bqMa5G3e7IShAtk888UHVhJxzUFgM+0PRW/eskuFQglFrv+?=
 =?us-ascii?Q?+ofxywe/1LRRQIlUC2goLVYHWa3oW/Zeht7Q+R9Dr+zbMGuEsvn3tIji4WLM?=
 =?us-ascii?Q?CI/QWukSpCU6AvXCbhZXLYNYsOXJxHqrWyDvWk4Mcd8m7NrY71BcwYLhpN6b?=
 =?us-ascii?Q?WbgmrK1tiO+dtZfNUym4upt+v7KgkC1vp0QZHequyMqMB0qnpbPLI9ROT6Hf?=
 =?us-ascii?Q?fJCZvrBSz9ElBM2ZV1uFJuW4Bi8kYQZdeC2EQLmZcY5mJCZLltlGt0dNTJea?=
 =?us-ascii?Q?3aj5s5Q/bzZ8GcEYygjWy62miGiyVNr5oFT0hM9lqUbSZFlMzaLXtDSmkU3M?=
 =?us-ascii?Q?GtZWJTc3fPOGosksmEtrOlLJC/g98Y6+nLYNCVIYm+ZqhYux0Ozpx8F+pAxC?=
 =?us-ascii?Q?gJZLxEY9NmvCQmisgEGWIkJm/B2uPg/ykNDEAJCMBHwwvIfIT5bQqIU1kLQ3?=
 =?us-ascii?Q?9CdH32JT3RefK7vlAu711/5agsaSBq5ki426Ei+0DDrzmap/9sfQZK3xnlhU?=
 =?us-ascii?Q?MXG4VuLjTiuOrAjj6LHlIzErYqHjkpjXGOuoiErU2IZE1snQuX5ibd6xk7fb?=
 =?us-ascii?Q?9jUXTLMFFShW8Fdj9TP3zJKvhWogxqKAKjoGGMwQTb00rUbsKfka9omwm4ZC?=
 =?us-ascii?Q?T6hx9bv5V6FDvgNsE7g/ti1ZlYt1LkGe33XO6pR/T35HGGYNhCwi79EvneDV?=
 =?us-ascii?Q?4E7aQ1nme+12otyJ2TUsRCOuDWq5bOa+G//WsSFtxUnagJ4SXnm8o7N7NI1l?=
 =?us-ascii?Q?mmJggFEUWmG/8U8DfKUzYpBFcuQ3pFjGmYuVTIW+i82B8IbjxeKgXZH6SkRU?=
 =?us-ascii?Q?7HkClSiLSokrv9n6uzNN6eSnZjL4SF60p1r1GqjjRhxI4m1TG5CanUD2PyV5?=
 =?us-ascii?Q?7ovFKgH3b2Zz3A2dbOtm9NGbKC3WotfH83p9S0e0OJCwiP6vu+eGc/L4UNMn?=
 =?us-ascii?Q?FLGn0XQFKRTXA661y/1CLaSQ+ZutI75aAl0cP0jje51L/Wqt1DJpUKdzg3sN?=
 =?us-ascii?Q?Y+f2qt8Jtw5i8JhfbFgKg6fhHl0VhRes1UfTkkw9QoI4Je3s9xJiRsuL5fGT?=
 =?us-ascii?Q?OtsGLUljM7DrJUTSRtSgCbOy0P69Cu3g9JZYftrdAgbM7mkUMTmSRfT8+8BG?=
 =?us-ascii?Q?KAZ/JosyrMVkOQEIqcOpiXAjt/cLKLMK2t++nDBV8PqVVNibXj8P?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1434e9f-990e-48cf-1213-08debacc90ff
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 02:14:50.3329
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ey016wyxj7gcFo1AqwxGP6u421O4pkx3Pn8Z3bY3rOTG10ewzVlwSDQCDKyk156NMpPiPNYXKgdGPcGbx2zr3W2YpPaUH3WHHuxS179ZB10065jBZmaWqKfKqzjC6pD4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB14087

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/cros_ec_codec.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/soc/codecs/cros_ec_codec.c b/sound/soc/codecs/cros_ec_codec.c
index 7dc5a7c3ca96d..83c50e77eabf4 100644
--- a/sound/soc/codecs/cros_ec_codec.c
+++ b/sound/soc/codecs/cros_ec_codec.c
@@ -319,10 +319,18 @@ static int i2s_rx_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 				    (uint8_t *)&p, sizeof(p), NULL, 0);
 }
 
+static const u64 i2s_rx_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF;
+
 static const struct snd_soc_dai_ops i2s_rx_dai_ops = {
 	.hw_params = i2s_rx_hw_params,
 	.set_fmt = i2s_rx_set_fmt,
 	.set_bclk_ratio = i2s_rx_set_bclk_ratio,
+	.auto_selectable_formats = &i2s_rx_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static int i2s_rx_event(struct snd_soc_dapm_widget *w,
-- 
2.43.0

