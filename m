Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010028.outbound.protection.outlook.com [52.101.229.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99FBE30566D
	for <linux-sound@vger.kernel.org>; Tue, 26 May 2026 02:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779762412; cv=fail; b=TWCPPhhwCEFHcl0f1ZpFiSTVeSOJ9F1ZN1/eeCzuyGHQ7Vgs+gsgwXzQmv1Jej6FveLrf163//CEU7YfoV7dhy6tO4n1EWk/uZLBpAuG1RTgSX/VdE+Fr34tkVZ0VUjY9BGux3KVkGbSYxgry1Jgf366PUAgYDdvSkJx4IU3AA8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779762412; c=relaxed/simple;
	bh=hsYXG0uu+2kUiS5akb0WRTUuu9SOaXye2vLuxLwT33w=;
	h=Message-ID:To:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=o6DqvBhJ3Nw69v4B3a+X6F36uuvtK2BMRKfxrYCJbJb/YR4IIydWaxqIyvdq33/q2FhFf1aFUxC7UqU58rd9HS2cjBVikX9/k0I3NRmAOCuqvdH3hcqz+P/X3EHD5JTC64ddSJRhTlAUuoUUc1fLH6J524D9n74EeC4totWT54g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=OEq3ovFS; arc=fail smtp.client-ip=52.101.229.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="OEq3ovFS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BQ++C8ssdZ6xiqoRxj1oVuVqiYO+W+Vu7IZcgCJ2oCV+9ZIuO/AlOf/hlWjJyGQZ8Mj7dRepWua4ALCMIJyf/j2VSDo2azKh2Cyo2mWN5qKj1i/cJjzdtHtMwQucD7L9G4YcPN4HwQK8wFLe/eAIh7yaH3ZkTx76L8WJw1NLc10U+h1qI/BFXtgS2ZDTsbgrcxnbatkyzfht6sOls96fJzDbOJor4QSA7TSKrSYOskLhqVG1c0itqAmBsJ15pFs0EwNZMxrP2cEmIMWbRiEnDL1+JNoWemZ7p00s222+ysIY2xkQmFlZGwPrz4ZIQDh1doZ6rFcFzMEp6qSuv6dF0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ad1WzTvwy+OtNCYhKHeYp/x5Q7WBXal/zOeL/UxiiVI=;
 b=dxtDbRDBFlOKKs4flkG4t06Ezglxn4J8wgWE7G5V9yrfxPvKRM2SdM8BhlNgMPYyvPQupyQqk7fYD03eC2yB8Hb/BJXvyn0k8i5x1dxG8BYwNIgOpnu41neUhan1tZOj3mbFMxtWa0/6psATbfYpLLi2/IaB5Dtxs35oZiEZOMzwNyDqYgREfkJdGZpvrIiUGYrkqTs29IydcliraAk0bAei0CU/4DZh9vBNA9wbUg2XdwCW1Gjh5f1jmdkwwhqauXImjldJKLLp0B23NAeqcnHKAzju7hevrB2Z/f8Yzx8M39rySWlBfhUZTwmOLx65h7ZfqOuUOdp9Qwozic6RGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ad1WzTvwy+OtNCYhKHeYp/x5Q7WBXal/zOeL/UxiiVI=;
 b=OEq3ovFS+r6pmP3FhQCPYj2ajH3/VdWgt70OJaW4ob515o76l+wvXfjsYAensf0MqBT58ECzjAXyvEKvWN/iWZHS5M6d9Rm74yY3Y2yKnMND2/eE9hfv2aktzp+4n6ZPa/N0PLh1KJMk9mAixun2LdG3zH7lT/dHQvaqD0eqBYw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYRPR01MB13144.jpnprd01.prod.outlook.com (2603:1096:405:119::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Tue, 26 May
 2026 02:26:48 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0048.019; Tue, 26 May 2026
 02:26:47 +0000
Message-ID: <875x4agb2x.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH 72/83] ASoC: renesas: use .auto_selectable_formats
In-Reply-To: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
References: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 26 May 2026 02:26:46 +0000
X-ClientProxiedBy: TY4PR01CA0029.jpnprd01.prod.outlook.com
 (2603:1096:405:2bd::18) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYRPR01MB13144:EE_
X-MS-Office365-Filtering-Correlation-Id: 22dd1b91-a45b-4457-e504-08debace3c9f
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|1800799024|366016|376014|921020|38350700014|18002099003|56012099003|22082099003|6133799003|11063799006|41080700001;
X-Microsoft-Antispam-Message-Info:
	i28DB6/mbU/FMkG+cpSYNGlt+d2hhcGVvs6ajdVgegRRR4Xj7Qn7cA9FX+Tojsempf2VOZH3VZ7IA0D/1ZFEajYygW5mM+wYbfQXxxk44IKaaorKb0RhJnv5WKY0EEYoL+r6ZV+CPdU+b2C3NHZIobpGjsMoNEdYJaUnc1IiupiIVUqtW3Aa8RRdNr0PojgHJhIYb+ZX5/fdsIfRND82cdODcAwbSuivBBeqk5QWU5PAxsV0e5GPD1joMpVvR6UJvnUXxc+dHzBdRGxhZdkkrqNVzHPCLJS540WK0JYSJonBPsvio4YOgWRt+hVxRxe/w61naUAa5NZUstki3aJCu060E7iJkfrUM0p3SgVqTnD9XqzQAOD9fWBhxsGKq19yriFZUrVSmmjhZwxcuF4kqaBwSVNApl+dhxi78QzbpuW1l7xC2SWii65f7NPsroNWpy0rB1t984KylCil3XubTmYwyAGJZvI9cujMKp2Eab4Enj/uV8/4/5p4mU3M/B9Sm2SZ3/9nm//kuUBRncPumVEwSGboYPYnJ8+SwchTaDn+75haNQlPNxTLnIl8H+QnAO4nPoGoMKMGCcfninArw+ZGRlb9pn2ZoGGSPqpPYUBnqkJPzvj5e8m1TvHaBffGE5UhWQY2Rpvl+iQPOkEts/TCN5HlayLMfAmSVY3KF/TlNyphUuU6kEV0RXFrtT4XMtya7adWhcLtvz7PmXj+1YFaxIa5Kx/TfjcXLf1VPF0VVdmTLQaMpANh5rudguway+Zk/zGiVHNLwok5+11zXXhKLvbS1vzR9kYD5PgcOcU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(1800799024)(366016)(376014)(921020)(38350700014)(18002099003)(56012099003)(22082099003)(6133799003)(11063799006)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pnZSS+i66sTkZL3ouKxGKjpgNeHXXR41zsAaAq8pRUCaHK0LPMYpB37dsD+a?=
 =?us-ascii?Q?XjGObq4qYBj8lTyo5xi+2HmVgMKY8RkpjRx1FvFTkySaK6fX82fIChPnsHbP?=
 =?us-ascii?Q?Rsotipif6Yk6PM5EGWbdwTOzCpdEpMtXHqqLD52CXBQKbPMuzE83UU/GslWx?=
 =?us-ascii?Q?btQZxzSKuQzzvokNsz5norRWIi06Gj3BQ3utt0SCwqNXQeLtNYAW0uIjqT/x?=
 =?us-ascii?Q?K+fPkpbG9p7M+qS41mCH0jW30tzx1ovSXAay5wWQio1CH5hpfR/rJrCH3d8t?=
 =?us-ascii?Q?lQ4gfb7h9xIw6qeR8d9NekeXZNyaP6GNpLjYang/2hnKdTQBaWvCJSDiNZQL?=
 =?us-ascii?Q?jmTL121/1yf2/kb13OM+FJSM4gIe3cf9NlR67THkCJd/0anHb6KmhmtBYo3G?=
 =?us-ascii?Q?nDMRbU5uftlR+001DMJ7iPtUqY4E6YM6EDi4tdtmh9eBCMjMdq/IoHYbK7Tu?=
 =?us-ascii?Q?4uCCuCkZv7igHQNPdSeTpSAxRpDRX9VFguDU5qO465crdI2qQfp3rHOipitV?=
 =?us-ascii?Q?K3X4TBfL6aUcgNSmNNCX1uJYQr3AsIk2mcP0120w5gTMxMGsbRh6GVW81V5c?=
 =?us-ascii?Q?Iqs3N5RWNF8dayjH+ZaNwEdj0+7k0912/c3J3QSXJIKwNKRUu32j1Kv63Ols?=
 =?us-ascii?Q?x6HAiEP+CmY0p+VXI67r89LmX0J+SbZFVICSZHsh7bzLfSTl1b+cTaqduJ+k?=
 =?us-ascii?Q?hHoDIWIr+b0GvabU8CwGtHmxfAIN8JxqOjTWFS9hR4gYegrSsGBOSzQjYKLW?=
 =?us-ascii?Q?ek9ebcYkQA1sdrpLI/Al2T7qB2QeUPEebJtshW1akRxEOnIba7zvyA8EJGy7?=
 =?us-ascii?Q?z/Ayz8LGxYMbaNrDLidAPuYZqblLjZBe8lr1wTP3NJvyrulmKuk3jD9K9qRf?=
 =?us-ascii?Q?tGrk/qa8Adia7LhBOrNmzSUfeMarA7iCKxuuW8FokYEEBLBbiQPAafzJlyEG?=
 =?us-ascii?Q?7cd5mL2LG+ceWv+JqAANIxq6dJ4BmexFxgVkIM5adzZU30qIzrd/roGey2Q4?=
 =?us-ascii?Q?zhK62CEWmLoXXbyKLmJvE6689LQPNkshGYslgnMt7gOQOeMSknS3XCHAR/Rs?=
 =?us-ascii?Q?9j3BDySPDqNNICRtqDZ8KgS6Lad4aVrTZNpfD0eGGAjWsDu9waQvIc99QWM3?=
 =?us-ascii?Q?mFy+nk/MaUFaHk9RnRzJ4H1CUthbg+Gib7vnMCnIo/NMptfptyhnrNRaOiRw?=
 =?us-ascii?Q?s2fdpUhyjLKS8nllhDAf5cBLbQjI9443/lxX63nhVI/YhzEiGS+ESuq1wrrY?=
 =?us-ascii?Q?SG2LH14igVNJsXQhKsJ5/GBQlub7CEz3glrZhCKaIK1SvsVm83LJuL+S9lJr?=
 =?us-ascii?Q?XXFY9LUxLw5YzZlfKiBx7/45CYUHqJrgF7zm9aRyIirL9eGQT2tlewbFw2iu?=
 =?us-ascii?Q?VMLYntJBuXSxumynPhNr0LX4sVHj+avx3XohiiN2uaz3gRl1WZFPi0Ij5PX/?=
 =?us-ascii?Q?QBhYCLvUhs3pqFLk0rI1gGh53+VVqE19WnBQbJW87IomW1A/jY7Jp13zGIn6?=
 =?us-ascii?Q?GzXWktXY2CfSkwhG32IKLqlxfveInJ0q6ptyaVqtKgs+EDRvSxjDGGny9AYq?=
 =?us-ascii?Q?4ub01Y/Pt5Lv/TDYHLcknrNd6EoMqX3Iqu4Ub4dn0Flu+BFeAOZpaie1ldDW?=
 =?us-ascii?Q?0vahzGsBv+xn1Y1MwbVJzSamSJ8evv6GRyp6gxrJYSZp+TVVpQPer018aSvr?=
 =?us-ascii?Q?Ljh1dicrcBhyfk0XNUvSMxI0043BlWt6OlGroR7Bvi6hGqkSIod+DYIAjcKh?=
 =?us-ascii?Q?Zn2aWKxCqqR4W8kUWA9bZ4hwvwEIoCWjhp6l4LZ3nr7E5n7KUHoJ?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22dd1b91-a45b-4457-e504-08debace3c9f
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 02:26:47.7745
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kdQrO784csXjvNiyVZIf46FMcnxLk+KIqG2jOqDuRN2u9n0D88FP+/PVgEXiP2jESJ9354f1ln5QK/rVl/LIQtTwqoy/M/ZTE+MyziH/f+sPpwMDRmO/hvnuoF+XTlzu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB13144

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/renesas/rz-ssi.c  |  9 +++++++++
 sound/soc/renesas/siu_dai.c |  6 ++++++
 sound/soc/renesas/ssi.c     | 13 +++++++++++++
 3 files changed, 28 insertions(+)

diff --git a/sound/soc/renesas/rz-ssi.c b/sound/soc/renesas/rz-ssi.c
index 71e434cfe07b9..8243c8816efba 100644
--- a/sound/soc/renesas/rz-ssi.c
+++ b/sound/soc/renesas/rz-ssi.c
@@ -1042,12 +1042,21 @@ static int rz_ssi_dai_hw_params(struct snd_pcm_substream *substream,
 	return rz_ssi_clk_setup(ssi, rate, channels);
 }
 
+static const u64 rz_ssi_dai_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops rz_ssi_dai_ops = {
 	.startup	= rz_ssi_startup,
 	.shutdown	= rz_ssi_shutdown,
 	.trigger	= rz_ssi_dai_trigger,
 	.set_fmt	= rz_ssi_dai_set_fmt,
 	.hw_params	= rz_ssi_dai_hw_params,
+	.auto_selectable_formats	= &rz_ssi_dai_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static const struct snd_pcm_hardware rz_ssi_pcm_hardware = {
diff --git a/sound/soc/renesas/siu_dai.c b/sound/soc/renesas/siu_dai.c
index 039b1264d90db..299a596295cac 100644
--- a/sound/soc/renesas/siu_dai.c
+++ b/sound/soc/renesas/siu_dai.c
@@ -688,12 +688,18 @@ static int siu_dai_set_sysclk(struct snd_soc_dai *dai, int clk_id,
 	return ret;
 }
 
+static const u64 siu_dai_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J;
+
 static const struct snd_soc_dai_ops siu_dai_ops = {
 	.startup	= siu_dai_startup,
 	.shutdown	= siu_dai_shutdown,
 	.prepare	= siu_dai_prepare,
 	.set_sysclk	= siu_dai_set_sysclk,
 	.set_fmt	= siu_dai_set_fmt,
+	.auto_selectable_formats	= &siu_dai_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver siu_i2s_dai = {
diff --git a/sound/soc/renesas/ssi.c b/sound/soc/renesas/ssi.c
index 96cf523c22734..f00067bafe8d2 100644
--- a/sound/soc/renesas/ssi.c
+++ b/sound/soc/renesas/ssi.c
@@ -329,6 +329,17 @@ static int ssi_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	 SNDRV_PCM_FMTBIT_S24_3LE | SNDRV_PCM_FMTBIT_U24_3LE |	\
 	 SNDRV_PCM_FMTBIT_S32_LE  | SNDRV_PCM_FMTBIT_U32_LE)
 
+static const u64 ssi_dai_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_GATED	|
+	SND_SOC_POSSIBLE_DAIFMT_CONT	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops ssi_dai_ops = {
 	.startup	= ssi_startup,
 	.shutdown	= ssi_shutdown,
@@ -337,6 +348,8 @@ static const struct snd_soc_dai_ops ssi_dai_ops = {
 	.set_sysclk	= ssi_set_sysclk,
 	.set_clkdiv	= ssi_set_clkdiv,
 	.set_fmt	= ssi_set_fmt,
+	.auto_selectable_formats	= &ssi_dai_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver sh4_ssi_dai[] = {
-- 
2.43.0

