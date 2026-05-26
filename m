Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010022.outbound.protection.outlook.com [52.101.228.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 117DF1FDE31
	for <linux-sound@vger.kernel.org>; Tue, 26 May 2026 02:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779762243; cv=fail; b=VQPVWfth2nd9dZWGKkrD/JuXIXSE0E7+WG6ifJ9/JYcf5nwLqHcx9eQHjR3IYEw5rXySDSJ/M3Tyi+1JVi7Agi2QhK76tA3OjWJJeZm7wWRKQRQohn98umqDpavCQRiZFIooE71fCg6AO6UXVQ0XyiA0VGf2ZjT4HUFURewaf+Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779762243; c=relaxed/simple;
	bh=tyG95FvBqr52C51YFjjvMH38vOKE9Qok7ALNaEyQfKE=;
	h=Message-ID:To:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=CV13ouaohMOYuFff395J1LB/qpS6gignGlraiTLgcVdO2dQ8xoWwjBtpfXDy+J3GzCsX8MbhYmrU7W6zLRfnqXKEhtRu6rPf3EeGvXQUS6U/DIOUjA91ilkgHF4cdD0C3lmCSUGFO4/IOAa1BDEehIlkBRdu8+VD4Zarkbuy8+E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Lm2fGdYF; arc=fail smtp.client-ip=52.101.228.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Lm2fGdYF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nKH/INgQzvaxom4OhhLYnPkgqewax3JouGIdgbrl/9XUFA1JaZ02gP7FQqJ039sieXHd1lDLAIr9Eb7jBtWpeKKoOAj7z78QmU6h8C0wBfImfeBHVmeAgCIdjlWbzQtJXSYCJ5X/M+2rKLjLYFd8buV6HR1EPe46ZGUULRKC+IdHy26Q4MgEljL0M0UHUrsQbGdJviX4L13ilcRmAyVZ4LIJGCHG2KK1cqp12Bgg0aLlGFJVIMlVAcsEjlcNQzq4h4iO6TjYTsb7/HXrlcYpnpL64ElA97uMptqZI+oPOTHDjQPFIYlzdUA1U/UePbnHJMjEzciaJ4j4ED+2ZXHRsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PtVx6ZCtvTZ0Mf0jrt1ETMGrJVYuSEvKltPpywYpURw=;
 b=PsU9O3v7P8Y6F2+ws+5IISOxCZlCKsSsUPjR62B0hsI8WKSQJ8Thvk/LcllcosM9ZXOnnuX0XDKzKtPrEju3ySE09YU0AVLj/97RgBrOx4ZuzmmNO3B6hIqSu3R4b8W/wtmArVs/e6b2ajcGxXabIKLHG0Rh1hUhR2oc1niSy7Xc3hdRX3f2qrM+eJoSqaaqbJ0yNocPVM6fT9EjF6HKuvM37Nz/Xzqv+ladAQ4TRwzT87jNd9YOKOS9jU7j+RoQnUOZ2b6w+Ldo5FWMiohvExLtzOv0mgbfiNboOfoAm78RJXTjBdLfmAlpoPH5Obj3o4takc8I52V2/kQY7lAMmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PtVx6ZCtvTZ0Mf0jrt1ETMGrJVYuSEvKltPpywYpURw=;
 b=Lm2fGdYFsjK2wn5bUmsDaiHEihkzC6JRKCHWIZZx6vWlKuaKSV1I/fSyp45d+oAiHZJCA0rK8fjnPSYiThLeRoxCGMoGtcmth5+Bf0sxIgCgRRFdNVHtWtH0l3lkBclUHZER3EOOauUPdNGPJNFtUQ57G/tjowj38CMdktFzvto=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TY3PR01MB10158.jpnprd01.prod.outlook.com (2603:1096:400:1d9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Tue, 26 May
 2026 02:23:58 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0048.019; Tue, 26 May 2026
 02:23:58 +0000
Message-ID: <87jysqgb7n.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH 62/83] ASoC: fsl: use .auto_selectable_formats
In-Reply-To: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
References: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 26 May 2026 02:23:57 +0000
X-ClientProxiedBy: TYCPR01CA0192.jpnprd01.prod.outlook.com
 (2603:1096:400:2b0::15) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TY3PR01MB10158:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b44efda-7f47-4040-891f-08debacdd776
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|7416014|376014|22082099003|18002099003|56012099003|38350700014|921020|11063799006|6133799003|41080700001;
X-Microsoft-Antispam-Message-Info:
	vHSQ+PraguoJxhtdPHMvswR+/BtwsLivBPAxDrp9FiRewIl9ppQmmc4/8iny25/C0+yeVc9o+MtKse0O6VCzL3OpA3eKGPC9R7Pu4I+b4QwKGJVhzcaq9bdJWy3PodoGrzd51sB5PItceo4ewo/Yb8p01s5RdOH8ce4osZW1UmHazdNonf3ekE9ZugFPLaMnI2rj6RktWKVTSwQTU828wVfKLkRSzTV2WNicSgvG/2cVpiTBdYShm2nAD9AWxwF8ZSSc4iyIFz5p+WUAUVILLrMnmX7VamF6VmOVWT6kx5eU/JUt+d21Jl8Dz9FFw0gB+DJrli+mX5ZvYg4YK2GI7i7qcdbntmVy5EYGI5ZznzW3VpEkircLunfUfxG4P4vKYNFqicPj3Gixnz86+fT2mOgzwdbX5+MP1HWxl1Nv1QmT2wm6az0F2cQZo+UoS5wrSCimq1Jc7bd7ZcnR01Hx4RbYLyinB4QyserZ7GkyQcNJ92VAy5bK1tQd63B50iXg9ZTIEwjbh2tgSRWMYMhcrrw7xqg42bH6VZuN1LoY2+Kj5F7yVs+zt18ayYfjvkmYfx/nOu1K9hJ7lZxkCxVtEob+E7Sd2n1CqGnT48l2jfLRuGnaF0yj/qTBe4Y/ZdHNqQX5fJ6d6VJUpOVfrGsBShuyOon0AbkwhPEOYEaW74tEr7lcr7z960kRm2adDxKXnxMeBobRyOHzfmP28x/OOjYVN3NMt84NViUsp3qzj59Lqf6Ms/zW/LXW9hmfhOwIcrDq7Hk+TDljCX0aCs/Ze4xUrbXHLiKrSj2DX0ILPqM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(376014)(22082099003)(18002099003)(56012099003)(38350700014)(921020)(11063799006)(6133799003)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?e0W2XrvOivFrfCAkIRAVLXA1TVGzhNhfbX7c85pTktSq573tyyxUubvGDG8g?=
 =?us-ascii?Q?Bwg6ew6aBBY4ISaz2Fo4mzkKku1Kl4aVmeQXYhsNFTgOpULZV1TTmMbWGnbD?=
 =?us-ascii?Q?YSa32xyqjlkxp1nh7lqAMSNDqFacWh3PR9EWGmHcbJIUMSOBhJGfdmuC04cv?=
 =?us-ascii?Q?ulCnfloLQ6TIGJe7TnSiym5zd6yVMZxU9jvhhsK+OpY2OypkbvrIW3xSQ7JX?=
 =?us-ascii?Q?H76/t8g8byV72IuYoGZU68Fxg0bqAq40vOGN4REE/NSmvFOeXSV81jtX6Dlf?=
 =?us-ascii?Q?1jtOhxtzo53r3cVPtczV0JRSe87pzgzhtp3ZMZa/Mumdycj8YFpr1ICWFzbt?=
 =?us-ascii?Q?RLL6+91AEIrMBYMtfJu5vXltPo5P4vP/TINuLU4Vsjk9qfDQ234swhvRs0xw?=
 =?us-ascii?Q?VMfc7MygAZ+2MMj92eON5Kj5wvo32w3lwUAXAkQx8gmoR3T8lZ5g7JN6t6y/?=
 =?us-ascii?Q?9xP76jJgsZLVACf//Cvy+Jhhfhf1XgXBLMVfkRA6t2EmrPXGbIPAN54G0wdO?=
 =?us-ascii?Q?FFEps/45Uq/a47D1ViCmak/u2FhKQafhxV3ssmhhbiN62TqCU9kVH5AmdHnN?=
 =?us-ascii?Q?FLIOPe0FMGEhPvflMJdX+eEOSXIginEqDM3vgds/a1De1FgcZEYG59/+b4kD?=
 =?us-ascii?Q?OE86rc233vlKA4eqR62lDArcjXJythE9iG2Kxd7LC0YV2pG0OqwDPsp+XM8X?=
 =?us-ascii?Q?mAVRHYftwvePoE7JF6nFDD1wuq+K+gbvVPf4bbcVH05Rsfe47HMygsTGvMpc?=
 =?us-ascii?Q?S5AjcIcnD17lIFez3b+NLgoN/cFTkqzpMyYU2nKNbSMusU6oLgFIFKkl9FP9?=
 =?us-ascii?Q?XJfbnaKY2Mv9YuwMgXLvjnC2n6mpXWM4VAV5gjj+pL9KtRjXOzfnxQohvPz4?=
 =?us-ascii?Q?Z8f+lgqD+unACxpjfLypkclE87Sonsax4qPIb6gqKfQEuSXebTGZJGw+muyg?=
 =?us-ascii?Q?TodFUBay//Id7ILjOPoZ/0FSIxTxizCWRDwB5I0KS3bCmeTFIe0l6CGinmHu?=
 =?us-ascii?Q?Ih4KRljWjfm2Kym0oNgQGO0syAyBbJCER7wxTMcCuWoNdgRqPaG9iXym81jX?=
 =?us-ascii?Q?M06I3zvEVcU0timL/azvTawnK+thpswGzzqwQv4hryKEq4FsSsACXA42/dMc?=
 =?us-ascii?Q?t4jX+m5qiEfZg3qAsS3tmSh8FLjdWDdo2kyYkewkLuD4qNXWaACSj4/a4mQY?=
 =?us-ascii?Q?E8agq6vtaFFCpJq7YtNXjphOQZinjMFmDS2s8AMDCJrJPSQ2uLaaLPVobl+G?=
 =?us-ascii?Q?GhH2lsTA4cSgXPBzdbQC2bNxIfyVi97TjWH+UpwjFK+EmSGhfetkSLgH935l?=
 =?us-ascii?Q?2uGnr5CvMSTcWFrzLPmi5FSdYgTkPLUgIrsXmdDk2axhqhWNEs1tuzdZw9Eg?=
 =?us-ascii?Q?mWXT52/oPkVWgeMkguv6HqP8WsblwhyvJPzbJRxKHtarwMyI+IfFgcUPPuVm?=
 =?us-ascii?Q?OHyssQPx3n7Fg25miu7Vm5ELoA9XSuXAZ8Gaiwg+mdr6FJDeqp4eiXfj0OgX?=
 =?us-ascii?Q?bjeBUQuY4ns4dCbq8khRfTA1ki7P26Adt/6kAG/PtEzmbXGkqKW4VlwE4zNt?=
 =?us-ascii?Q?qrZyZcuPjKh7jUbql26mkEs0x5bnNGJShqLesneRfDR6zBbdEzYn1u9wtvP+?=
 =?us-ascii?Q?X4o7mCiGV5KR00okvF5+KrUNJr2JZFMzdziEWnp5Go1ybQSonbYrvan5RRuq?=
 =?us-ascii?Q?yZyMX/f1u6iW2BmAbd5K3Umw2R0OozXp9yDHwNrDxgkAtlmfdU4lRaJIHswN?=
 =?us-ascii?Q?N80GE0GMqlf7ok57GuKyVLwUBiXzCTl2xF7KRakIOk5BQk3SC4VG?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b44efda-7f47-4040-891f-08debacdd776
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 02:23:58.0605
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JAUNy7asC/6QQ1lYOurNlh4Fyf9YeiTaTRUMDGativuJDwcckp2XUkHPiLov6j93AdnZEPm4oHl9lmsknhIdLccdUke+BJCRMuzuISCQHbxx1kxmoURdG43FxV20zYiU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB10158

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/fsl/fsl_audmix.c      |  7 +++++++
 sound/soc/fsl/fsl_esai.c        | 13 +++++++++++++
 sound/soc/fsl/fsl_mqs.c         |  6 ++++++
 sound/soc/fsl/fsl_sai.c         | 18 ++++++++++++++++++
 sound/soc/fsl/fsl_ssi.c         | 13 +++++++++++++
 sound/soc/fsl/lpc3xxx-i2s.c     |  4 ++++
 sound/soc/fsl/mpc5200_psc_i2s.c |  4 ++++
 7 files changed, 65 insertions(+)

diff --git a/sound/soc/fsl/fsl_audmix.c b/sound/soc/fsl/fsl_audmix.c
index 40a3b74321744..3ab071ac0a03d 100644
--- a/sound/soc/fsl/fsl_audmix.c
+++ b/sound/soc/fsl/fsl_audmix.c
@@ -308,9 +308,16 @@ static int fsl_audmix_dai_trigger(struct snd_pcm_substream *substream, int cmd,
 	return 0;
 }
 
+static const u64 fsl_audmix_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF;
+
 static const struct snd_soc_dai_ops fsl_audmix_dai_ops = {
 	.set_fmt  = fsl_audmix_dai_set_fmt,
 	.trigger      = fsl_audmix_dai_trigger,
+	.auto_selectable_formats = &fsl_audmix_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static struct snd_soc_dai_driver fsl_audmix_dai[] = {
diff --git a/sound/soc/fsl/fsl_esai.c b/sound/soc/fsl/fsl_esai.c
index cde0b0c6c1ef9..06fd38187f109 100644
--- a/sound/soc/fsl/fsl_esai.c
+++ b/sound/soc/fsl/fsl_esai.c
@@ -795,6 +795,17 @@ static int fsl_esai_dai_probe(struct snd_soc_dai *dai)
 	return 0;
 }
 
+static const u64 fsl_esai_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops fsl_esai_dai_ops = {
 	.probe		= fsl_esai_dai_probe,
 	.startup	= fsl_esai_startup,
@@ -803,6 +814,8 @@ static const struct snd_soc_dai_ops fsl_esai_dai_ops = {
 	.set_sysclk	= fsl_esai_set_dai_sysclk,
 	.set_fmt	= fsl_esai_set_dai_fmt,
 	.set_tdm_slot	= fsl_esai_set_dai_tdm_slot,
+	.auto_selectable_formats	= &fsl_esai_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver fsl_esai_dai = {
diff --git a/sound/soc/fsl/fsl_mqs.c b/sound/soc/fsl/fsl_mqs.c
index 901f840df9047..39129f970c3f5 100644
--- a/sound/soc/fsl/fsl_mqs.c
+++ b/sound/soc/fsl/fsl_mqs.c
@@ -187,11 +187,17 @@ static const struct snd_soc_component_driver soc_codec_fsl_mqs = {
 	.idle_bias_on = 1,
 };
 
+static const u64 fsl_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF;
+
 static const struct snd_soc_dai_ops fsl_mqs_dai_ops = {
 	.startup = fsl_mqs_startup,
 	.shutdown = fsl_mqs_shutdown,
 	.hw_params = fsl_mqs_hw_params,
 	.set_fmt = fsl_mqs_set_dai_fmt,
+	.auto_selectable_formats	= &fsl_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver fsl_mqs_dai = {
diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index 87a40e2b9fdf7..9921b53ac184e 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -1005,6 +1005,18 @@ static int fsl_sai_dai_probe(struct snd_soc_dai *cpu_dai)
 	return 0;
 }
 
+static const u64 fsl_sai_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_PDM	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops fsl_sai_pcm_dai_ops = {
 	.probe		= fsl_sai_dai_probe,
 	.set_bclk_ratio	= fsl_sai_set_dai_bclk_ratio,
@@ -1015,6 +1027,8 @@ static const struct snd_soc_dai_ops fsl_sai_pcm_dai_ops = {
 	.hw_free	= fsl_sai_hw_free,
 	.trigger	= fsl_sai_trigger,
 	.startup	= fsl_sai_startup,
+	.auto_selectable_formats	= &fsl_sai_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static const struct snd_soc_dai_ops fsl_sai_pcm_dai_tx_ops = {
@@ -1028,6 +1042,8 @@ static const struct snd_soc_dai_ops fsl_sai_pcm_dai_tx_ops = {
 	.hw_free	= fsl_sai_hw_free,
 	.trigger	= fsl_sai_trigger,
 	.startup	= fsl_sai_startup,
+	.auto_selectable_formats	= &fsl_sai_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static const struct snd_soc_dai_ops fsl_sai_pcm_dai_rx_ops = {
@@ -1041,6 +1057,8 @@ static const struct snd_soc_dai_ops fsl_sai_pcm_dai_rx_ops = {
 	.hw_free	= fsl_sai_hw_free,
 	.trigger	= fsl_sai_trigger,
 	.startup	= fsl_sai_startup,
+	.auto_selectable_formats	= &fsl_sai_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static int fsl_sai_dai_resume(struct snd_soc_component *component)
diff --git a/sound/soc/fsl/fsl_ssi.c b/sound/soc/fsl/fsl_ssi.c
index b2e1da1781ae8..65910ff4d2a33 100644
--- a/sound/soc/fsl/fsl_ssi.c
+++ b/sound/soc/fsl/fsl_ssi.c
@@ -1151,6 +1151,17 @@ static int fsl_ssi_dai_probe(struct snd_soc_dai *dai)
 	return 0;
 }
 
+static const u64 fsl_ssi_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_AC97	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops fsl_ssi_dai_ops = {
 	.probe = fsl_ssi_dai_probe,
 	.startup = fsl_ssi_startup,
@@ -1160,6 +1171,8 @@ static const struct snd_soc_dai_ops fsl_ssi_dai_ops = {
 	.set_fmt = fsl_ssi_set_dai_fmt,
 	.set_tdm_slot = fsl_ssi_set_dai_tdm_slot,
 	.trigger = fsl_ssi_trigger,
+	.auto_selectable_formats = &fsl_ssi_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static struct snd_soc_dai_driver fsl_ssi_dai_template = {
diff --git a/sound/soc/fsl/lpc3xxx-i2s.c b/sound/soc/fsl/lpc3xxx-i2s.c
index c65c17dfa1747..ea521647129ba 100644
--- a/sound/soc/fsl/lpc3xxx-i2s.c
+++ b/sound/soc/fsl/lpc3xxx-i2s.c
@@ -257,6 +257,8 @@ static int lpc3xxx_i2s_dai_probe(struct snd_soc_dai *dai)
 	return 0;
 }
 
+static const u64 lpc3xxx_i2s_selectable_formats = SND_SOC_POSSIBLE_DAIFMT_I2S;
+
 static const struct snd_soc_dai_ops lpc3xxx_i2s_dai_ops = {
 	.probe	= lpc3xxx_i2s_dai_probe,
 	.startup = lpc3xxx_i2s_startup,
@@ -265,6 +267,8 @@ static const struct snd_soc_dai_ops lpc3xxx_i2s_dai_ops = {
 	.hw_params = lpc3xxx_i2s_hw_params,
 	.set_sysclk = lpc3xxx_i2s_set_dai_sysclk,
 	.set_fmt = lpc3xxx_i2s_set_dai_fmt,
+	.auto_selectable_formats	= &lpc3xxx_i2s_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver lpc3xxx_i2s_dai_driver = {
diff --git a/sound/soc/fsl/mpc5200_psc_i2s.c b/sound/soc/fsl/mpc5200_psc_i2s.c
index 9ad44eeed6ad8..86ae64a26ad77 100644
--- a/sound/soc/fsl/mpc5200_psc_i2s.c
+++ b/sound/soc/fsl/mpc5200_psc_i2s.c
@@ -118,6 +118,8 @@ static int psc_i2s_set_fmt(struct snd_soc_dai *cpu_dai, unsigned int format)
  * - create/destroy dai hooks
  */
 
+static const u64 psc_i2s_selectable_formats = SND_SOC_POSSIBLE_DAIFMT_I2S;
+
 /**
  * psc_i2s_dai_template: template CPU Digital Audio Interface
  */
@@ -125,6 +127,8 @@ static const struct snd_soc_dai_ops psc_i2s_dai_ops = {
 	.hw_params	= psc_i2s_hw_params,
 	.set_sysclk	= psc_i2s_set_sysclk,
 	.set_fmt	= psc_i2s_set_fmt,
+	.auto_selectable_formats	= &psc_i2s_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver psc_i2s_dai[] = {{
-- 
2.43.0

