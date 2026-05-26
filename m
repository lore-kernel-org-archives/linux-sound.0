Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010049.outbound.protection.outlook.com [52.101.228.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F7CB8460
	for <linux-sound@vger.kernel.org>; Tue, 26 May 2026 02:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779762315; cv=fail; b=HXAXVOd6IFWPvHKmEB07idvyl6NHnIRgxtLxERypntCDOPPrbLHv0AZwh7T6CZp62IoWe+/rB+dwUmvZcl8OBwjl42NU4KmAFTOnz9OSwqNzvsMMOwPGcgdETCLTRcGtBoEwhxXWKx6neQ8iAH5brP/uGDKGt7tGEefV4/PIwvU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779762315; c=relaxed/simple;
	bh=De+qjyOTPFwurxUjecegnVtTqWLfNQt0a0YvSoPC3BE=;
	h=Message-ID:To:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Y1GV1voIfLwZrKjgKjsUCD8BpVqty245s/5qJyyPhswepJUU3r9awUeQPmzyapMgJgm/kQncUgrMd2dq6cLcXukKkUfUmL65J8JKSJ7iv4ZYnD0YQpiNYcEjEbhpj9JJ6kMfHcHKnQFYt0awpAJmUcrokRCFu6GPxlaXJJ1onio=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=gwQc7yLD; arc=fail smtp.client-ip=52.101.228.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="gwQc7yLD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bs4L7gOw/Wcp0FiQKqzPNTYZtWm1Xfa5i13tahxacXS+aAxTlTTUMFJ2MgbmaEx9Qjg2dp5ypbWqCVnGBj18PrAx5wD2/X6dlEEaYOFGnaLlBs2PRxNdfIELlmqtE/sjYvRsuVCav+nl3X77motysoQDBzrhr3/VUBockn8EJgPT2QQ3a7brCZ9HSBpVwvvKuZ9jVWAHTaZoWw59vun1QDDtWCtSygZwt/nfyvQxkBKTldxTBA3cxIOZFJWzooOzhZgh5D+DU82zxNQCDNDllhX4/nvPJf2iRWudLwmuQ5Upf5Wg/bf08/Hl2Edc6NVgDk1eKQ4XXA8IFJythMrg3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ug5IHaAmmtibhQiVVFedxoGnALgH4DAkYdqkgxKuI3E=;
 b=jSWG3cv8oHlEmkDbMbE8eXW8vGre4ZR2YtQszi3zXKvlznJmTISRkiUyTbiq9sKKSCaVTJB3a9W7xODjSktV9mOIvXdwQYLdoanC176eeXITj8O6Z07nKfhSTQybW8JP4ydpeSukHXO/pynmCOo+JmXuQLfPPnerfbJc1DNh0+pyEzqCtkgvfnKlkml3+Ru55s2Qmmc7K/OpfWrQwVdja+zZ8nT+kzUwTqYam6aaQZ7F2vA5HErpVzJdw5NqEfHs8QKuKGkOQgV+z5+4HG0FsO1ShZeoHRXwjkDffVabnwErLKTzqujSSueo9KA29ZwFR010gNUpcZlYz21L38AIaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ug5IHaAmmtibhQiVVFedxoGnALgH4DAkYdqkgxKuI3E=;
 b=gwQc7yLDcbUkv6Cb+cQDiUZRyxPM6vsUUrjgu/H3CSm3XeJuLX0ZyffDBAdgEkgfvLjf6f9lhvBEh/2pKmputYZOoOpByS73UUlU3vYmFWudGhQpXy6i3MGmzsejl1/xaNIrK23oxkSHpDM0fJUUuLcS2wBMVF+a0qgFfw+pcOE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TY3PR01MB10158.jpnprd01.prod.outlook.com (2603:1096:400:1d9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Tue, 26 May
 2026 02:25:10 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0048.019; Tue, 26 May 2026
 02:25:10 +0000
Message-ID: <87h5nugb73.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH 64/83] ASoC: img: use .auto_selectable_formats
In-Reply-To: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
References: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 26 May 2026 02:24:23 +0000
X-ClientProxiedBy: DUZPR01CA0016.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46b::9) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TY3PR01MB10158:EE_
X-MS-Office365-Filtering-Correlation-Id: a0af6d11-06f4-4e36-48fa-08debace025a
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|7416014|376014|22082099003|18002099003|56012099003|38350700014|921020|11063799006|6133799003|41080700001;
X-Microsoft-Antispam-Message-Info:
	zChZF6YGiI4+9DWdRkNcm9pe/k6yfQJTYUjZPOBW93yzVSNJfgqO0/cF8W5syEALftlvF5CBp5h53able2rwBpsONH+27cdob533a5o/01bX840emleNhIIaI8rcMkyAvjzwFvm6VkaPzVtaQjYl9dpSs/6SSQQrjsZa1g0ODSK9Lhr/sdfK0C8yUt4Vg0FBHYN28eEt1tZsMTMrdF/995oXtHrOszs10R2J2jZnS3HpA+DgPbZTz8gGls+q2+dAeYSXuDzSDDYnvysiaRuYRWB+8h7YzwopUWsH+LDiMe1Rif+nCE7fWDd08YhMCSV719HzOXHJbNIima5O+Pjq9XchaziffllHwXAVFWQ9R+iApUz6rWt49Xd8UBRfNKeS3vFj9u4DuFvZ4IqprFByaPQdDKDMUH2WHqE05Xit/eneR+/nZSAevcG/B5XogpVi4GVdLTT+7ryQzghAhdpDBBSBiSZZbV06hYDsUUkU8bQOHRIgfq1u31vBIThOrcMTY0UyR/8z8pBe31omFdKaH7J/2Hg6w0SwWmRXRxXnPOiumVoplfry2vYzQtd5/xBW//Tef8aKNIqHF+qRcvTHS+X4vmp6P4xfMuST0mpdIB9ruexhVSKiPmy3UrqpA2o8Gsc5UgtiuVI8Pi3dPBL8z67Ex+RaWTJ3Zf6roJY70pZ+1wqqWEQEJQj8sW3ro4pL4BX1Ja39A2rZGRNIA2eTO6y6tuWJWinRUk1x5UAKX99krkdPeaPIXBpHQyRqrotEudMTVZcMpmWX54UYevFn86iYlhZTVBgBlWeyll6FAK4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(376014)(22082099003)(18002099003)(56012099003)(38350700014)(921020)(11063799006)(6133799003)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0atHKBSFQn327cp+m4iA57JbJNB0MLJWoFerDcZSNG8bUqZ3iXrCFpwRyC+J?=
 =?us-ascii?Q?SnUAH56HHCypQl4OGLfN3IlbzJkcgGCiS0SfsQ466px8IJdVjCZ83iw6IDtQ?=
 =?us-ascii?Q?LNS5rHMPCX2hHhD8yU7hZhVqJcIH6oB/FmCvEDcgUaazTfaBI4kkWeqdTUw0?=
 =?us-ascii?Q?5N9hP6o67rYz5mR2y6YMTjoJLvMPD8QC3+kWCevmQdZ4Q4D4bWu62iHz36O+?=
 =?us-ascii?Q?2AgbCKwiRbCnEVjo0q0/3zA5dj0EOQN21W+5S9VXvsxw+csVkOO59c6ixdPI?=
 =?us-ascii?Q?uKeMBO970ivIJ/5Hv7+Y5qyzMtpgwWzYxI1+jJBH1r/ja7M8Nlqbq623T7BL?=
 =?us-ascii?Q?//8ZCBLftzu0NrYoFg1Cf8NQ70O0g8j2QVCwEoDLL/TyOLdOXeZJoTaRjAC0?=
 =?us-ascii?Q?j/2dy1UjsYZaQAd60bqIRDsK3tDGC6bhthpwTu0/Gb/yPyCz8/2HhpaD4Sbj?=
 =?us-ascii?Q?SK0zFGu3GEJIoW4x0uCXSCKQcLox1d3mVbsk6yOwAvxNzBHQJ3Ebc+mSYXy0?=
 =?us-ascii?Q?SgmnW++X9aDaCe6VEEp2XvM2fpyv8JQShr/FmjoELE9AVhNCKZLNz2X+1L0A?=
 =?us-ascii?Q?RUcIcn8j96L8F0v0J53g4azFL3UXHWyikn8PO1AxCdUoMKrw8AT2sJH1tdKn?=
 =?us-ascii?Q?bciMprR5OLTrKWJOWONFGwiHHp1o8iXOMMMJW35VfQwZq1Yygpv6D8dD/0v1?=
 =?us-ascii?Q?ovXwcbaWTRX1X/6Gx9hYuqZZRB9akK1tiZ4ProkmsJxvZ4KltLh+rM1Zzyqa?=
 =?us-ascii?Q?3hQigym+gsGALBFYq0QGPy8iPwgLyClNcpXbC4uV1KHIppdY3BFSCGbVZ9p6?=
 =?us-ascii?Q?MTKhgjNR4UdIKipVPnfhjx0JADifT7VNUcPH6WpViCExn4O/0jeTP5SsXATA?=
 =?us-ascii?Q?69cuySGtRf1QRT16LFqK6R7yPJ8MVbgcYkRU8wfu3T5NfvJ+cS2QvNsOt/KC?=
 =?us-ascii?Q?klJA4OWtTguHKWR8Nm3DDlkdtx05Vb8gItpzMWHx75CQQ1CsaOdvdSWo0vE8?=
 =?us-ascii?Q?X1JvdnUevB/hK9OYcKwuGfm9krU0LGTWXRHk/Ik0EMvYMe6JBNgYJF7E4ZG9?=
 =?us-ascii?Q?8Oxk3moMkdgkTGFl98FuVkEH/5xULeqbw3KPXfLTqFrdiXKoTBSJFjHMrc/p?=
 =?us-ascii?Q?KFJAsw0uhiQnMc/S7ihrJ9hcJ0ksqP95pEwCigQ5dnkqxoo1/2vYSzVS4fFM?=
 =?us-ascii?Q?Fkzgg3GxZwt7KZooh3jrP1jgMJRkduvOk5XmfmKwO7dHf4IWrN9M57Yzq1sB?=
 =?us-ascii?Q?x3rjg0GZ6ONprtcwuD5njHeF+rnznlttI5QbcB2JP6BZNqepUxvYe1TKO9ME?=
 =?us-ascii?Q?tsaJJ564crP6JU4va+sPs0/UXqCitPx7rtfhTsLb9/A2Pnl1QSpEhUV0fS5G?=
 =?us-ascii?Q?lsd2EahEYV7432w3V81L5d5auKionA6DdevtHms5IzU5w+Eby1h6YCJKcKD+?=
 =?us-ascii?Q?pSVnjTH6aAPq3++jNeMPZ3aGIwpu0lms/regXdyLQ2fD3bZ8pUKuvKbWto5f?=
 =?us-ascii?Q?9Ly0PrSr0KGfJfayvndV7O2g7KnTX1R0lgSzyfh59vnfHetftBjdfMskmxiK?=
 =?us-ascii?Q?XW3ssuQmOVeeLx44VgNL3JyCEmAgNGzjOAItfkmmlDYRGOgeSRZCsVsQgn1T?=
 =?us-ascii?Q?uMidZnjTUJ7zVGxYw2kkyGCxkSXVvf0Y3jYrQbv0MJ4kQa+b7PRKhmLw/LGx?=
 =?us-ascii?Q?LfX5XXbhhvhc1ogzdpmBYM/D4YZFVEKW2C9DcPK5uygxf90LxxPGN7ArCc2R?=
 =?us-ascii?Q?FRMn3NSqaiNTZJiVQ5SpxY3PaCyt1FWTZ6wf+r85bvC6LW2KTi0A?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0af6d11-06f4-4e36-48fa-08debace025a
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 02:25:10.0233
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9PFqxt3pWtHefDodecIcZrdYMPEuShbLMBJso9DTIoqKyJXcIOYP4ZDoBrEatHEsfkueV78hh6iFTBy5LbCn7lZRlvlIh1BX0fln9lGkA3KVFHDMd6H3icfyp29kfhHj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB10158

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/img/img-i2s-in.c       | 12 +++++++++++-
 sound/soc/img/img-i2s-out.c      | 13 ++++++++++++-
 sound/soc/img/img-parallel-out.c |  8 +++++++-
 3 files changed, 30 insertions(+), 3 deletions(-)

diff --git a/sound/soc/img/img-i2s-in.c b/sound/soc/img/img-i2s-in.c
index 98d2ab68883a4..a0c87e2a9b30b 100644
--- a/sound/soc/img/img-i2s-in.c
+++ b/sound/soc/img/img-i2s-in.c
@@ -379,11 +379,21 @@ static int img_i2s_in_dai_probe(struct snd_soc_dai *dai)
 	return 0;
 }
 
+static const u64 img_i2s_in_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops img_i2s_in_dai_ops = {
 	.probe		= img_i2s_in_dai_probe,
 	.trigger	= img_i2s_in_trigger,
 	.hw_params	= img_i2s_in_hw_params,
-	.set_fmt	= img_i2s_in_set_fmt
+	.set_fmt	= img_i2s_in_set_fmt,
+	.auto_selectable_formats	= &img_i2s_in_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static const struct snd_soc_component_driver img_i2s_in_component = {
diff --git a/sound/soc/img/img-i2s-out.c b/sound/soc/img/img-i2s-out.c
index aedcf56a5359c..caa7870dbec6b 100644
--- a/sound/soc/img/img-i2s-out.c
+++ b/sound/soc/img/img-i2s-out.c
@@ -385,11 +385,22 @@ static int img_i2s_out_dai_probe(struct snd_soc_dai *dai)
 	return 0;
 }
 
+static const u64 img_i2s_out_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_CONT	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops img_i2s_out_dai_ops = {
 	.probe		= img_i2s_out_dai_probe,
 	.trigger	= img_i2s_out_trigger,
 	.hw_params	= img_i2s_out_hw_params,
-	.set_fmt	= img_i2s_out_set_fmt
+	.set_fmt	= img_i2s_out_set_fmt,
+	.auto_selectable_formats	= &img_i2s_out_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static const struct snd_soc_component_driver img_i2s_out_component = {
diff --git a/sound/soc/img/img-parallel-out.c b/sound/soc/img/img-parallel-out.c
index 86b60e6dab38f..89270913ab352 100644
--- a/sound/soc/img/img-parallel-out.c
+++ b/sound/soc/img/img-parallel-out.c
@@ -183,11 +183,17 @@ static int img_prl_out_dai_probe(struct snd_soc_dai *dai)
 	return 0;
 }
 
+static const u64 img_prl_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF;
+
 static const struct snd_soc_dai_ops img_prl_out_dai_ops = {
 	.probe		= img_prl_out_dai_probe,
 	.trigger	= img_prl_out_trigger,
 	.hw_params	= img_prl_out_hw_params,
-	.set_fmt	= img_prl_out_set_fmt
+	.set_fmt	= img_prl_out_set_fmt,
+	.auto_selectable_formats	= &img_prl_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver img_prl_out_dai = {
-- 
2.43.0

