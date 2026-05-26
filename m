Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011064.outbound.protection.outlook.com [52.101.125.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2389E2E888C
	for <linux-sound@vger.kernel.org>; Tue, 26 May 2026 02:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779761982; cv=fail; b=ABtkuApUcw8FAeJtVPVETN066iqlcB4Ch5Lc/+bQy6zGRXFME4WHCTvgZEcFEutnpsSMDSgbx3AYi0lO4B+IwvzRrEMSlQwWBpeI+Asffue3Dh71ztOlHjoTy0+WMjzePnpERp7LtZOPD60kzJADlQ6WnGEiTzojRRp8LrRK+vA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779761982; c=relaxed/simple;
	bh=nLnN1ghhDXW7yfwI7+1Twtx/u+NTEZ5ZWK0xhKdoVCI=;
	h=Message-ID:To:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=D40sJewdUkEskmmYjb7a0mykVsdAmXmLdmulUeKVoef+aPvq0/W5xUggmFx9+yrV3x1jskKQP0KoKLCDCHQ6+iveYSiZdtx/wU//tgzhFrfNNhZhjW/5dKCeUQs1cNAmcIKXgBVyybUyl8iun5Ty2eqEpDtuvrcf8SJs2ZfF/oU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=H/r7QM5Q; arc=fail smtp.client-ip=52.101.125.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="H/r7QM5Q"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kLHJf/vPgAGHqJ1ryL8JZ6rbAv1R9wq+JZszYNBGqumfmev3nN8Xl+GoppldHQJg5Dxh9vNHXrC79qmYbUpJn2wnqSHBoaAvybykgbc2X4oIViMn3CjMpxmBbFgfENNsQ3n2fBYQV42o/a0TLaDEi1OZvoc7k/FqrNnfbxYdU9xaMhCyr2F/jJcfUFSWzBGvQeYHHiX6GVGpRnG3kT7jvixgqsp5S1yUwOKwJYL/iSPpF0In3hhY1KrDvPviiigzz7enZ//kf7m5ftIOE8dNZnTAtifcZzz8gH0yXdvNdDdlG6POK+TraO6Ae76u3RVpIhz1RvkpX/lTatnRq+bJ7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xT31gh4fqMPmEkVxCt8g5iXabla2foEC+XUncFsEu9I=;
 b=b1+mEHrcMwUeTO0OMwVTkbuI7cC+gpdI8WsLnTOomdaCbxuxlb66Cy7CgZUMuRMr2I16BxNifFVUtShLIJQTvPhaqUWhnTIgKI2pfA8PWX+muJ2GevyjWth00shZKB26dBu7gRnwrjCSzHMHCcMoFLgZE3w19iLboxL30ND9YlMjshdps+oGihQ3TiGmT7y1qoDCIPtDNt9j30PdJNcLr86Vzmy7AEGWO78pXrO1OMsTG2ci0yHbekeNXNwFpMAZn6+AqX3Ac25Z9zdpjfMJG/Cq5WwLqoXmt8J1u1pDb08zoun0SRLHHoT8EcWnkhK7+0GBHLViMDHjRNtiJDUgwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xT31gh4fqMPmEkVxCt8g5iXabla2foEC+XUncFsEu9I=;
 b=H/r7QM5QaUs97Er709907cb86SCE0rVUgLMat0NWeaSZj1wRLjq2ZjvUMwWh2wBTAECDEowdD54VTlT+GDJC9aLp+JHjPl3c3qWNbOieuxTpBZb4qyGBiT9TUbwLz83Dk5X/Z+ugb9newZa0jazoX8bWCgwYUHc8q49JdjUcGOE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TY3PR01MB11843.jpnprd01.prod.outlook.com (2603:1096:400:40a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Tue, 26 May
 2026 02:19:33 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0048.019; Tue, 26 May 2026
 02:19:33 +0000
Message-ID: <87fr3ehpzf.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH 40/83] ASoC: codecs: ml26124: use .auto_selectable_formats
In-Reply-To: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
References: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 26 May 2026 02:19:32 +0000
X-ClientProxiedBy: TY4P301CA0086.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:37a::7) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TY3PR01MB11843:EE_
X-MS-Office365-Filtering-Correlation-Id: f460dbb7-61ac-4817-cf9a-08debacd39e3
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|52116014|376014|1800799024|56012099003|22082099003|18002099003|38350700014|921020|11063799006|41080700001;
X-Microsoft-Antispam-Message-Info:
	otbM3nB1olrnZtAK66Au3Iw2oDmi51p1/IzqrWFlWWw/S4tFHH5UEPeDD+rb2+IhH25n/wjQQe498zxMeIkuYetSVVYbboVYBEDoS9Ctlo53iiGCmKOCX3WvgI73HzAx5Zhyoaupwj4Db93oAoUNfuJVoIMkvB9aqqG7764cu3UEOmJWScaOiK4T8XKEonKISXaFNBtV8mZY0Z42eXd9gmGfxQR0ppF54Sirg6BjfU8DiEY8ohRDM91CkhJ05ahzeZFD+nvmdBnAsnJhaxrhbvcoG4qBY0h9ubSPB5sJYMlzgzXk/gYnKSms2H7nvTgaEyNgAtCQqbqDxAeCsm3eRB4yFSbBjmZ7PK1kafWP54rdvSXXOw1gJvBpSE6KUK5qUdKRYADmzjqlKqU77KfM0mtFaWLH9gEmltom+fdIvi4GrZkapiz1aY2RUST6H0AmWyesoEUFkWBm87sJpeom9RpHek+nHUgRKQ7QNigPWmy6dtUXvax6PwxAfsU03yS1DHeOy9jPHs1yyHeZBsqs9qKrYzm2quQ9gGNs+VffULz5KRqUDrZTiytLztjgXHrY+whOdshwzBQgHbiI7qSURBgavB+aTwgr/vD+hZoAPwO6RvBirDd4S1jczZ7nzOYYffZmEzeQDBYSF1n6xQgvr1/HxNShP1DE1H2wSq3vAQv9SdN6sDB/5g/IrRHomJzRCkqN00drQYp128qCMxbT+uQLotDaQnU/40dvMs0JNbnBzCqNocTNXhuzP9/U575JFvyMPamsGSXQRxauzfZdmN7HvCTI2/oTw1C4S/GkKSk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(52116014)(376014)(1800799024)(56012099003)(22082099003)(18002099003)(38350700014)(921020)(11063799006)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5jsi77+FreLShF6MQSg/YyP9jTWGUkJ1zBGKpSMwvhBHPiV5/dLHkiRRPxqk?=
 =?us-ascii?Q?5KK6/BiFdpgx7X1Bj7g6Re7JGKZgohS/NCSaBx2s69p5rrk5sYpBAlmnDwyD?=
 =?us-ascii?Q?O3yf/hGSFQp6PeKurGRA25lXEl5vTGOgEhCYH7lQI/7eLGWzDS89qLH7kY5o?=
 =?us-ascii?Q?nSo+TcPhHu5KQv0adu0IZutmp7LAd1IPnZSHfkl/SbGRnmULKqx/Lzoy45VJ?=
 =?us-ascii?Q?cVgIjf7Wwb5abygtChrBFHX3N2rYalnyWdf+k+KIHq9YF1ZCKHg2in45/HNc?=
 =?us-ascii?Q?sfnUa89wygSjl80aTZWPxRh9ExV1YexM+t2JnXoQbzKmX2C5Pg7xjyBoTYuC?=
 =?us-ascii?Q?UUEt6Vgf2w1TuTr/qW/TQoUm5NQytotDtdT88vSSfTx1hCtCnN3YvYwmkj0E?=
 =?us-ascii?Q?nSchmQE5eEXqd0L0mpSqCkdBRXSl7c5O4i2RlvtBZHE15awjoL/ClT8aHrVX?=
 =?us-ascii?Q?a2owHGY8h+gnrV0Gn5Yvou7aenf/pDboUKYPDFVvxLPeEuEyRiUlSVqXF0ad?=
 =?us-ascii?Q?xq3ps0EGXTn7sk4etj1Z/1xsA9+SSOUE6ta4oqZMdvRuv3gWvUhvO+tHKjmF?=
 =?us-ascii?Q?SwFMwOmPGe4lu8v9Uluyi4MrkhbL65vJLE7ilT7HF5/kADCBtk38REdRMwiQ?=
 =?us-ascii?Q?Wm3YNBemAvznk9GFzd3GSSEt9T+tGUbpPBbxFOMBZDd9r6vYBdERmiy78Xur?=
 =?us-ascii?Q?khqr1CAjLy8rsn2/3XENvO96wO2ieoMD+1Sip8IZybYeeY+flvbZfCIeFl2r?=
 =?us-ascii?Q?Xzgyld73GCcnEnR18KNoXQInmbCsIKAjuMB1WLtz5MzPGoNtk1tj1znVGaQn?=
 =?us-ascii?Q?Lp4vo0jLMrZbVSLtMeIFGcYy+rLSVd0ckKL/RbvjtCOQI7co8fMbYrhT4mIx?=
 =?us-ascii?Q?C3pBzHNrAzkodUWNTn5BbdRGtZbcXiACBLmVgIXXs/HVuc77ZwDixR+84MLG?=
 =?us-ascii?Q?y6nNYeOwjj0qzPSzizQZfyjOpU4xbmRUTU+LP75kue+n0Y+vDP7hyuUoLffz?=
 =?us-ascii?Q?dI3yE7A7RGHFidKklnVmwF0lGP5Yhya9dH3FmG7bLeneATDn9FjIBprqsveo?=
 =?us-ascii?Q?ZYwAmYDIYz/Rr6Os3r4wwoM/80awH2opPaHO9+W4Lgl62G+p4+x0p/J2RtO5?=
 =?us-ascii?Q?RofVv9KOTdkRtSLxA0NYsZs8jlkSirwoBOeccsFyF14CpKBXoOs//IdAacIx?=
 =?us-ascii?Q?YJ2m+i8HnJx6qBMe5kQOI7bVGbjkIKxB/oCUb4h3SBfYXy85Qk7pM5Gd3N0R?=
 =?us-ascii?Q?kZJtfszW3k3huJ9A6yKRhBBYPPZtvWq/XfEVAEpwPlgzIF6HX2z3bJ2ZhG38?=
 =?us-ascii?Q?4A/wnX/l3GdqA57uCiU97/6Wewqu8qEGn30qfPikLvSDelGB0oAY35ueBcxD?=
 =?us-ascii?Q?RZgzS2vwVgX4ebltY4GhKH9EDs0dgCLGo8b80LmZEVJgFC6dBgrGuXuV5zTp?=
 =?us-ascii?Q?86QYAEEtQIhbz7aJC5eQg8uOAY3op+Ht9JqCIrQWw0B1oBu4XGiS+XcISs70?=
 =?us-ascii?Q?CXPcX7Ixmt3B7V8SlduRkQ8GooNMiw3KJL+rhYorTrkisGjhMgxnl+g+o4nO?=
 =?us-ascii?Q?xOLocF+wU1b/KvXaiHchuCSJfodYAdvY33RBSN5i80DI4tHhCmKmlO8+4ycB?=
 =?us-ascii?Q?SHMfsMhkHplr9B4KXXrj3i1EF/Z7LYdOzecHOekHB0MgXPzDaeE6C9+v4asn?=
 =?us-ascii?Q?ba22CD7VPBoRJuYOWiFDTWACCHtVtoR4IXToKKj7cGmuPSO0TkAcHCiO6PNL?=
 =?us-ascii?Q?lo77ZPUTlQsqw45VKeE2p7EyM7EhfMs2zMT0bl+V12u/4PzuxdVx?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f460dbb7-61ac-4817-cf9a-08debacd39e3
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 02:19:33.6529
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9tHIjXMNeUB1rOz+Q+1JDe+8f6YfAHOXNV7Wi8IWIS1aHCZzkGnWSSnikYVa6QYbAIfpP0z0uVay2wbVmY8v+mFOONuPIdga+MSJgGWOQ6VjFrOgUOtSSYuxJLZ0xYZc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11843

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/ml26124.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/soc/codecs/ml26124.c b/sound/soc/codecs/ml26124.c
index 8a14626d43ffd..ad111d92cffab 100644
--- a/sound/soc/codecs/ml26124.c
+++ b/sound/soc/codecs/ml26124.c
@@ -490,11 +490,17 @@ static int ml26124_set_bias_level(struct snd_soc_component *component,
 	return 0;
 }
 
+static const u64 ml26124_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF;
+
 static const struct snd_soc_dai_ops ml26124_dai_ops = {
 	.hw_params	= ml26124_hw_params,
 	.mute_stream	= ml26124_mute,
 	.set_fmt	= ml26124_set_dai_fmt,
 	.set_sysclk	= ml26124_set_dai_sysclk,
+	.auto_selectable_formats	= &ml26124_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 	.no_capture_mute = 1,
 };
 
-- 
2.43.0

