Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011052.outbound.protection.outlook.com [40.107.74.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF1F22E0938
	for <linux-sound@vger.kernel.org>; Tue, 26 May 2026 02:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779762325; cv=fail; b=rYYiQ4I9rp5tpaRg1IY2UlXXtQxS0X5Wzqtqvlcwsqeg8nO3j0Td1b/q6E8DMS5pliUxhUfl64wfryuYP9XgtlfVmOsPtcSbw5IOmSmD+ao9kjk96vo5kkT7/UuXG1Rv7VB/YXWKj43U+7ExNIlcGc7t2WCWEsw4JM2YtIwXI+0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779762325; c=relaxed/simple;
	bh=c1scLPeSoGTxNkHdYCkGDTVwxDfub5gB1PUhjRXuKhE=;
	h=Message-ID:To:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Cnd55bqFcqreQCvnA9KrT2wKUlP0iyoqbjyOPNssdduVDyNjGa/YhKeprejHZjUKrv23kFMjVeIT7I87h+aIETbe0nh38BrylAfVgErbSZu91W+phmn3gwd+M+wfHhCkb9YfLS/zlPRex8qq4fO6DP165GuZENkUytqd9+yMtOU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=S3lpxfdB; arc=fail smtp.client-ip=40.107.74.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="S3lpxfdB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z3qQJKL2xYc4hsRlQZwVTJp6vejJdfYlFCHUjhpqerA3deiOASg2wggxvurL9LSWLKiTnOTBzH9xlvEdiM16bNUEeruJmFNvg8JL+PnQs0LF/R2Wzx8GyJB0KpylUa5LmuYod9O4iIs8q06oxnTG0KWJ37vYimpPEzBpVB+YDLajbi4VaxZE0aZJHVTDWybXDGRRk1aG/M2fBUzhTnyNYbB5MI/BZSSfzXK/MUtdlRIFwesrqD9/9a26skuoBEyFHrVSeiTEMQ8/VDEyxqW/zFDi20PaRGfhTmwt5Cq5LvhWwzPlxjJiXVyxfAUKdIFtooZdshEroghS3jpZAE6CRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Arbip/VMolBt82kqd8uOCVrB2T/xq3x4Su4Kc5eYAUk=;
 b=hxgoprd1VG3TaKVO+THBU4lJGtvyRUE6BZjHaMW3Uh0XQBgJez14LZ/eQktfhnnS6zcO2G6ZpOVDzhK2ip+60dkPXASFJ1ATo3OnMmJG1g1U5WApgrlxUw9FDLREht7dggtgto9zhoja5xKt2AgTN1uH4qT2IFD8QvmdGVjiOU0pGnZqJC883FEHDV3Q6o9faGU00Cgn7f2XBuNpVBM3Xv0vens9p7VxhrwagdLGe8+zaSzvOWiV7xqrv/uQXU05oMnKtYSx0e2b7Z1+Nq4sgJbQfi0qUPR2G/DDdj6rts8E+OtrakXKUXNeUwfHjFSg9JYZgkBc47z+ycEZPGQPtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Arbip/VMolBt82kqd8uOCVrB2T/xq3x4Su4Kc5eYAUk=;
 b=S3lpxfdBLB2idB4jAjnWSJxGj1KQxc8W/fXyDtpsVjYUaP29cEGX0TV8A+/nqI03J3WTw2lIeAQGfyeIRwRNltS/ij247GsJvIuByJflj3x5XSAC5UWOpX/O0X2ruYZbVbdbdkg3CGJvj1XYeSuSw/gpTjbhyU9uGn2IZgveVJs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TY3PR01MB10158.jpnprd01.prod.outlook.com (2603:1096:400:1d9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Tue, 26 May
 2026 02:25:18 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0048.019; Tue, 26 May 2026
 02:25:18 +0000
Message-ID: <87fr3egb5e.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH 65/83] ASoC: jz4740: use .auto_selectable_formats
In-Reply-To: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
References: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 26 May 2026 02:25:17 +0000
X-ClientProxiedBy: TYCP286CA0366.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:79::6) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TY3PR01MB10158:EE_
X-MS-Office365-Filtering-Correlation-Id: 827ce9ec-14f5-4807-d81a-08debace0792
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|7416014|376014|22082099003|18002099003|56012099003|38350700014|921020|11063799006|6133799003|41080700001;
X-Microsoft-Antispam-Message-Info:
	OViCRi3QF3aYq3veB4MVqFka+yS6yQ9YDOKNbiuhbk5Y1SUVKhquwnnN6sjP9J15NozjHWtb5qG8/P2ikqV9xLZOPvFMLv9CNuKqVrsARi9ZOMihIALQU+x519dl+6bC4ervgl47Mc1aS6n1M2SCY2keM/mBouF2L8SY7JqLQPi9tcDsG8lWp4jIdKmGoiMuUL0hSIvAaBQZShfX/q538hfzBBsF+55RjLBDkhm3CLZf6svIy+Fltj0z2DUEwXmnzb992LJP/cRzLDHc/Fjg58s/8P6+Q17pSgc/sIZgSHg/JFcI31ournzPtUX4drLDG8rApUlNtnecbxymAx6oJtIMvGW/B88wGBsqWfigcRkFwQ78w9LRggFjHBKMMMduNlYC+xxSwhyJd7sCxNEPp7m4b2wGDzhhbVV7lZddHz7vW/1Ggm3wg0W6QhNF+TaUYYQNXGW3NgUjPZ/xOcw3Qp8XNUdCHCwIb3kquedOL1+GHPGW6MWrc+/P7sYG7UqnkD3agcmGI0ZZ+e8yS+wirY++xCOjvnefpsHPSUuekBV5ng5Eq4BsPFiYYwz77j6H9k1dTf16ywyixA+5Mv1JA/2R/WG0Q+DZzL8RCUzSGJodFVx2wNv0lK1GE3eGUv+YxwJJ6laHhhgSurFCaQYWvlHbVNwW1V74Q4cd1080sDdjlRFvvoD9DZk5XP5le16np8iXc3z7q+pz316TPIZk+TV6hMmnBabQcQG5eU+n/ve5XkLH4UU2v60jBthWz6KUaVg/uagjWHE7Jdor/xLcZ5X/BVWGw1EM4BDRHa77WuE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(376014)(22082099003)(18002099003)(56012099003)(38350700014)(921020)(11063799006)(6133799003)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pblIvIHP2XGoU84/E42hF2liOggEriaOgDg1ZQAKklp/fSBzScmwBCaA0b9S?=
 =?us-ascii?Q?5N0YugaFNH66lrH4ihUyslC/W52z5a+Xbiw0C/Hm+CkVJrPuMdj7QkjbclC1?=
 =?us-ascii?Q?GJAIK8Vy1uw0Q0QDEuR4pmIG58K+mAqC4BJNnTyqvEgNEK78Ycy/Tnb9NMyP?=
 =?us-ascii?Q?opoE87R4bJa5FxPdBWa407yD8fWe+rF3mMnXivUjyrCbsEVfObni7c18gWb/?=
 =?us-ascii?Q?cN/gsTnOgaQC7G7oSHrssmCrb6UrOX3vWi+C7fKeIVbiBd1XjqdJW2pC4N7b?=
 =?us-ascii?Q?URBLr9ME3NJFTKXO+jSVf/vaQjNGMnMdJZ2+54pm8TFJANhFbY1wryx5fSZH?=
 =?us-ascii?Q?31hhNdL37uvPJVw8BFibxPG6JeDuWR2OKkDvuL/ADBkDlJ5fp8YlnOZpI7OL?=
 =?us-ascii?Q?9WQoZfmk0/8yx4M13DWZY17zNpKkr418x+C3d/3LZ6Bnt5z5XWLIgPSOOxSb?=
 =?us-ascii?Q?AM1wJkn1xxbthkaa+ST677vFZIo1z51A1/KKDPXJsRueofjS3zVIElP60V8r?=
 =?us-ascii?Q?ZPmfklDc0vcNMcySAJ3W41rJ8lMpV5QguiHk4Fh3MFumLZtItgMniatHgu+c?=
 =?us-ascii?Q?OsF0mjseOyAzb2kOQVcV5BYvr2zmYxaOTOlOpK/XN8dh6EBWPkRu759VMQ9T?=
 =?us-ascii?Q?cHIOH4j1WGwpzXzp+sUJqpUdGzhET/LNB0UWgZDecLAVEVMmYSLe7Xsg9vLx?=
 =?us-ascii?Q?s6vsageidQjF4hpDcV02jJTR2fbTElZzZk3GTzAhI89GPTRx3EFISvIRtG9B?=
 =?us-ascii?Q?q8xJPylDb7zRT1Cl7Bs7SYb7x03nGijHFPgadMVSFUD5ZmV7/HA2G7uAQNU7?=
 =?us-ascii?Q?AMDtAYEKQSZO8t4KDWj0neukbNuxtOz+yDNLv1oTLDhuq+2TJLrRTKNQGMui?=
 =?us-ascii?Q?1iD527m9rPYGB1dRq8WGecta1ylM9w9F+tzItLEITR/LDJYbCiV50rI1NWtd?=
 =?us-ascii?Q?+Olv1r0zzACU4FP1mB3w06zW4YyGh91KA/PQN6f2CnekuULebAqb/kQWdJHO?=
 =?us-ascii?Q?OUJ5/UP8VOgpA8cLVm1WcB1ONxsDcJ5zpsqIDMooCL6u1/FrcYvTPGJb3CYZ?=
 =?us-ascii?Q?pcTHiwYnxfefxyC05p7+iNLY5c/ere+CjPCPteUJRe1Is9ZlJjPa9Smuhvgo?=
 =?us-ascii?Q?SB2GjxcxLeY8vtDbzDTARZ2r4hP5DGEgpvzR/3uWg+rZKYTTzYhNkP4YOfaP?=
 =?us-ascii?Q?XBcjqJvckebtr7/kRXf5rcAn9zguXIE2LpkDJ6qyeDlJYjJ5gwdCWMCyH8v2?=
 =?us-ascii?Q?5qIetrV/V0r7A2xU2qAwLKQPRjaa1niJ3rXO435/6+IRmqHvHLdIGVjLwB6I?=
 =?us-ascii?Q?gyLNH5PBDKqMfi4/a9N8yk6xQ3iV8oLHU7kDLNVlvoECi4qUZTowC6o+I9hx?=
 =?us-ascii?Q?/mQJY27CeWl61idLMCWMygnfxd/oa8jBpci/DcXaMxGDGInpSB4dWXsKsp2j?=
 =?us-ascii?Q?ew0ppvfN2VpkdvPIFSHLjS/UH88e7hwIo5AfIk9q3BOlqc1+HA7pNNwa5D0l?=
 =?us-ascii?Q?PAEpLaip2/z5RcFgJgcOW6gJSL/1XM1j77h3tWSUY2bLeTpAz83CLb/5IEw0?=
 =?us-ascii?Q?WAFFsoYnVvOPsaBO9u+n8KiVuyG+F6KHQJTW+bDWQreamCwIcbl5YLQNKzcC?=
 =?us-ascii?Q?BYvjn9v3LDoODmdobPC8RiVBEgVxgM/R7NW3UonfG46oUlS7WvwdDUlS9xTz?=
 =?us-ascii?Q?sElkrIWCAp2bh1mrzUONiMUZBHvkBgEb6W2+ayVuSPJDg0iFPzjD1zj3cRc/?=
 =?us-ascii?Q?ZgwQg8eSqjmIZw+Kq3Z2jLJ7A229HnLJ0eab/rHpsJd/A3sxK0ja?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 827ce9ec-14f5-4807-d81a-08debace0792
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 02:25:18.7875
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zMt6aOJjXd75k15X8hWUrr0J7vGGIPrNnTF1qkHgyqmX/LA7ukPDirkCatE0/oJuzv72SVMEFAfJWX48xuk8alaYIcRt1LwP6Zjrs0WdNtyekIFyRVs9nEfSF+j+S8ga
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB10158

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/jz4740/jz4740-i2s.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/jz4740/jz4740-i2s.c b/sound/soc/jz4740/jz4740-i2s.c
index 5176195316158..40fa4e39349f0 100644
--- a/sound/soc/jz4740/jz4740-i2s.c
+++ b/sound/soc/jz4740/jz4740-i2s.c
@@ -327,6 +327,11 @@ static int jz4740_i2s_dai_probe(struct snd_soc_dai *dai)
 	return 0;
 }
 
+static const u64 jz4740_i2s_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF;
+
 static const struct snd_soc_dai_ops jz4740_i2s_dai_ops = {
 	.probe = jz4740_i2s_dai_probe,
 	.startup = jz4740_i2s_startup,
@@ -334,6 +339,8 @@ static const struct snd_soc_dai_ops jz4740_i2s_dai_ops = {
 	.trigger = jz4740_i2s_trigger,
 	.hw_params = jz4740_i2s_hw_params,
 	.set_fmt = jz4740_i2s_set_fmt,
+	.auto_selectable_formats = &jz4740_i2s_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 #define JZ4740_I2S_FMTS (SNDRV_PCM_FMTBIT_S8 | \
-- 
2.43.0

