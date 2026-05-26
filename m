Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011064.outbound.protection.outlook.com [52.101.125.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B17B32F745D
	for <linux-sound@vger.kernel.org>; Tue, 26 May 2026 02:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779761984; cv=fail; b=aj4J7DbAgfuEve7vty5whpr0VzuanvMSw7lEfdzNaTri41BC9D0sxiU7vKR2OnfIFy4w1rWH/rcYrucH/MDg4p6+qZpyhbGZBlOIq5nYXbJuUvxIYtViJ3DaY/P3DMnbsDHacC+U/J8SgU++0aYkS3UCLBvAfIK+bktHQekDLfI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779761984; c=relaxed/simple;
	bh=RCIi7QB49UZXPoMqGNevFts2mFNmGC0DPisGpIQOHxk=;
	h=Message-ID:To:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=NpcEOGgVRoZfagGP4APz3wpnZSzFTsCsCFnY3Nib3W+e5eJHP0VPGGa0bJtfpGlnBzmdd5DlgMbyif1gj0TZCAIk3WiBwTB7/CsnmLMh2h43sel/tfVuhXTGxuh0+LtjWLOlqX4RxKXwU91rVSnvY+NOv3/8hqf8nAS/rGp8hJo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=VXTZbtp0; arc=fail smtp.client-ip=52.101.125.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="VXTZbtp0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QoQuB0TBBzHB9+e236gSeiqZ6fqYLHjzyt2YsIfh+IRDIbR8Wp6iEDzTHtSB5hb9CcJ0/QXBsq6wcmMQDILzSD5lMriKs0fspwqjnxq+M7bxD6udnK/YqiKCmCFcmXSPc155gqzbSn7O4P8E/42NgDBdm3OEiVP5j/EPH/uxIoPfKhIMj7uktD5tAQ5D5tv6M9PSJ3I1bFegLDxqBRg13rh/h4nlOPKbLmq/9nW1y6wdF0LpKGHvATjkecpDDzuoSRs3FoSPyY9ZBZ5fIN3PCo41cLcFpQGryVFuhjZ+EGbg2styLhS4JZrEkHWfrEuPTynIN8ZsAa2MRM1MJQiiuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=263tq1DaqxMYGjP/Av6yX5hbZ+Q2hsZ17ii+C8r1Q/M=;
 b=lMC4h48CIr9Op5S7NNUNFn0D+gFpChxoTAfbTUWyneB9vKIbFZVdd0u5PZF6GTNtsulWxq6a3528RqyUeNvqD9E+RKOJD+IfLLSOyc7hV0dfVnjkh+pGjPbEtYYnezf+6VbBHFSuitSej9CCcp9i3OUxLyLureIvoBNDWz9z4BLhXngFrdPX2ZIJM7Vn32NQtXwILkFkRTYio9+UcoJx7AE+66gCr01SeUhogrHSEU1b0eoQjml3cPxBlXafRPayXqwRwjgTYV7J3wh0RT/0T2giShK2a5n14SLIqxanCVi4lu9umBda6c1C7LusQgl4Ymsm+XVowkkukCsPKtycbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=263tq1DaqxMYGjP/Av6yX5hbZ+Q2hsZ17ii+C8r1Q/M=;
 b=VXTZbtp0J8U0JrKYJdN3yr6j5pYs28y1EzGu4fyzuM6ix/U8Yhk3N5LcwQ9iGc3UY8YDWKnCV1PmlbJcF6aZA7Kmu5xHNjnxE+BMBrlNQypeFhwOIr/NWUpu1uyxOMcn6arnOsIgzvyAZaayYHRGWzUsKNIBjzlcW4eDeLnnZJQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TY3PR01MB11843.jpnprd01.prod.outlook.com (2603:1096:400:40a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Tue, 26 May
 2026 02:19:40 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0048.019; Tue, 26 May 2026
 02:19:40 +0000
Message-ID: <87eciyhpz9.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH 41/83] ASoC: codecs: nau*: use .auto_selectable_formats
In-Reply-To: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
References: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 26 May 2026 02:19:39 +0000
X-ClientProxiedBy: TYCP286CA0012.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:26c::16) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TY3PR01MB11843:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f1f10b0-eaca-4a8c-5def-08debacd3dae
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|52116014|376014|1800799024|56012099003|22082099003|18002099003|38350700014|921020|6133799003|11063799006|41080700001;
X-Microsoft-Antispam-Message-Info:
	aha6odFDH2jmH3vPdRiwEBUJS56GsCpx0rKB5gbqJFytpEa/ljm1ZFKGEuwYdja8E+WMc6IWvYBoDKnG8E1FwoleVQJOmsm65TjEVPodS3tIhLBE3CKYDeQk3L0RvPpGbZWJ7QJwecX0oUaQopUuywYGIpiUW1YqjUPs2mjVhjT/ekKvtWEMygA6z5IAuyIZU9+PoEsP7sIl9C8S1C0+3v4uOfGEjI8jws1QOJGaWWMdU5eapBlOCTROCkSXc3rzSBg7XemESnAuFob68W7SSJ47fi4FHaZ2N7pci/s6m7Nrs/s+P811VRDbxD2YHQI8qVxkfjtezmdsjArcYuACim6Y/MyXYHeitOADmmZ2snyubuvcWVAY/4hezmxWe43tvCjhd7QWdNGNBxJqhIP8Lt+tZuSZZ26exGsQugXsYM5ZSWmi2s6CVmaaACY+I/4PFIogXi/o1ZaGCh5I4sBUa8g2pJZvG0lRaQ0osJcbjiEHq+4RLetFT1YKUOCFBqRHkCBOqB8H7k3itZxg7R/GcM2JuqnyOc9Tmkta93tHBoniFZDMNgSGdunmguIOhecFjVf98RyacyLLqfcuv50C54Ct29QeCdG8ZgktX2T09jk1xK5R69QYH1EJfmFacMG6b5IoLpR6HZw6+gKqZOlBbl2e/COvUozmAYCFV8VHBU9FDYh6k3HaS7OgifRepqXOpFtLhAQxP+u9Sciy7kXgWOtwPnRfzbkNcdx+NtcIVdZesHGlRgAmZmtZAQp+/MGlQEtz0jiHe7EvG9RU1aiN2VKVhW9GX//JXPi90eCNT2g=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(52116014)(376014)(1800799024)(56012099003)(22082099003)(18002099003)(38350700014)(921020)(6133799003)(11063799006)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1MkvUCyBqPPvP8042smfHh2tHY4M1bHQA23HHGycXyGbhwSlkH0zUSG5Exkx?=
 =?us-ascii?Q?vvNgyWq9/Zowk7MZHZYoQWtddGyYXVskhdBG9V6Boa9GHh2KuWNsWfpNe+RN?=
 =?us-ascii?Q?It0elFRZYIgHY1pMkoJKIjRRhjNGu7rLVS2h/rOSr/uM4WoAaI5As6t8W4lB?=
 =?us-ascii?Q?sUfbFc806aPd+ZXoT0D/96/hE4p2+rYuRimam5NBzmU0ra/HsWIktTUyhr5i?=
 =?us-ascii?Q?E1WE0j9AjbvPrr/To5zwQvifMMDejEMz12HG7UkkfAWz9SkUoeCVCJl0q4We?=
 =?us-ascii?Q?En4LuqQrn8jvWtjKU2utguc5C3vsOw5yf6SQWisBuX3qmMYK105SIBtsit4a?=
 =?us-ascii?Q?49oPxrsLVYm3a96lfTDDdImZXLVLBS5bsVURyQQN8MQXOdWb348Q2NuZyHMv?=
 =?us-ascii?Q?dUb65iiqBgD+MxurT/4mQk+5I7xE843zNEVVfYV7ATD4EArFjC76F7r9+WtD?=
 =?us-ascii?Q?onjRvCmWsjK51NVbTXgcwRIJaJjLP+6Leyh9e7xoqLknBZv7mGZsi0ruRZf2?=
 =?us-ascii?Q?I/L2BAKKEh3i6xsOB0HbGhNz27kEYDR2+tlHcGsL0A+xs3KbvKYRw1ixBvDi?=
 =?us-ascii?Q?qSzQBNF0fnGLVXkwL4XcoMS6iYul24eSVfCbrGMjaiomKFpIk4l2AEG68V1I?=
 =?us-ascii?Q?2KPMxg9CEDMFPRvJo10B94csGri9nlNRI62XX2qXeeXheunIZ7Ja6zAtCWY3?=
 =?us-ascii?Q?oBpchkMo5MyGc40Tlltumqof01RoJarQbXs/0l7fSqDnus2HkRgwHxlv3zW5?=
 =?us-ascii?Q?yZk0QIrbBLZf2KRdLOZwaCD/dkt443yQk/G2Psm3bUdB1W+etVju1s/s8WOi?=
 =?us-ascii?Q?PyY4L3U+FJ6qTTrsRPrzxZ1DrDccLxuqhrx9K4ErTITGe+Zx4YPr8i/DBCbC?=
 =?us-ascii?Q?9xkkb3o6ugWMFjFOfQMBo2WZYrOgihjxtjYt2gKo49C644j7LtmbDvFdlXvm?=
 =?us-ascii?Q?z0f14NQJDKTYUvWSIqD+eoEs1IWBS/JXbz47XIApFhP0ND8O4B7qWExbISiU?=
 =?us-ascii?Q?1WROoKhSkgBMT5unVxOIz/8CDifj3FFNov1I2yTobfaH6tLSqpRfTTz+slPV?=
 =?us-ascii?Q?0iTE4OqpZWL+k81BRqkAzlFz195dv0CBO4nJQOA7ptTDCQJypK020mkgco0n?=
 =?us-ascii?Q?74pKKfu2usXyNQz0yE0j/KAYlBL8heXQnNJ0ZGmIafjK+4kYgSH4/8xeJCMn?=
 =?us-ascii?Q?4WFjxfOsjmqwl61+IBSu/8e2peWCqx2k0Z+PJmLPD8RDCfBZn0BKuweIoija?=
 =?us-ascii?Q?4E4jCRusM/ehyynZn3fzTK+PEpWRzjv3vEwm4xla5xVVRFNtdPTDW+sEvn/h?=
 =?us-ascii?Q?305VS9H35UEa6VtZcbUNk25d0WDlgm4ew9tZYaVhp7WGUe3RbQdQbB32JHuR?=
 =?us-ascii?Q?TMnCtGtmoLxAU3NOCFP9VjeuR0n0JDPp0i+/rzYvhEhimF4Tm2wcwJTZS67j?=
 =?us-ascii?Q?S7c3KEp9yUtDCVrgGw5nTOupkQy73/uM/wNVSQG04DqofFB3NTBW8/tr8dpT?=
 =?us-ascii?Q?Uhze34WHb2qF7g2yo6ppMslI3irMhDxRmDBniN6JCgOgBGt5EoirtSiR/ZX3?=
 =?us-ascii?Q?lGu4MStsxlkJrDsbaLD8PzPLE+TjEs02Xb28KEmSgMplOTnf2JcJYYzFJOX8?=
 =?us-ascii?Q?Phvhgn/nrQ41Lwk4UeDpYE5T2EhoM38mu3omTEFtkdZtkbDODpY//C1zkvWD?=
 =?us-ascii?Q?kL4qAAfXt8/QBYkOLngJaL5mrYAEn39TIREeQWakriWk+ynUAESlTh8fF5I1?=
 =?us-ascii?Q?2kf/m5hAOBSy/sCJheCemdN81odOWLWx/4OnpjfaQ6jS2Wz/suRP?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f1f10b0-eaca-4a8c-5def-08debacd3dae
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 02:19:40.0228
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qdVxYwPj6zcWl4Ieq2qxXCnghgcwgyHCk5jAfJQEM0Y7BBndLHYGwATASQUcUH15Y70LgV9usLJZik6di7qObDMuVSpegVmoAYz9eXMPZEg0CFTsZpJNiXUnl445p+o0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11843

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/nau8325.c | 11 +++++++++++
 sound/soc/codecs/nau8540.c | 11 +++++++++++
 sound/soc/codecs/nau8810.c | 12 ++++++++++++
 sound/soc/codecs/nau8821.c | 11 +++++++++++
 sound/soc/codecs/nau8822.c | 12 ++++++++++++
 sound/soc/codecs/nau8824.c | 11 +++++++++++
 sound/soc/codecs/nau8825.c | 11 +++++++++++
 7 files changed, 79 insertions(+)

diff --git a/sound/soc/codecs/nau8325.c b/sound/soc/codecs/nau8325.c
index 236d94c29c249..2c95ed00a681f 100644
--- a/sound/soc/codecs/nau8325.c
+++ b/sound/soc/codecs/nau8325.c
@@ -628,10 +628,21 @@ static const struct snd_soc_component_driver nau8325_component_driver = {
 	.num_dapm_routes = ARRAY_SIZE(nau8325_dapm_routes),
 };
 
+static const u64 nau8325_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF;
+
 static const struct snd_soc_dai_ops nau8325_dai_ops = {
 	.startup = nau8325_dai_startup,
 	.hw_params = nau8325_hw_params,
 	.set_fmt = nau8325_set_fmt,
+	.auto_selectable_formats = &nau8325_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 #define NAU8325_RATES SNDRV_PCM_RATE_8000_96000
diff --git a/sound/soc/codecs/nau8540.c b/sound/soc/codecs/nau8540.c
index fefbd5722c004..a939f4b7bb250 100644
--- a/sound/soc/codecs/nau8540.c
+++ b/sound/soc/codecs/nau8540.c
@@ -623,12 +623,23 @@ static int nau8540_dai_trigger(struct snd_pcm_substream *substream,
 	return ret;
 }
 
+static const u64 nau8540_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF;
+
 static const struct snd_soc_dai_ops nau8540_dai_ops = {
 	.startup = nau8540_dai_startup,
 	.hw_params = nau8540_hw_params,
 	.set_fmt = nau8540_set_fmt,
 	.set_tdm_slot = nau8540_set_tdm_slot,
 	.trigger = nau8540_dai_trigger,
+	.auto_selectable_formats = &nau8540_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 #define NAU8540_RATES SNDRV_PCM_RATE_8000_48000
diff --git a/sound/soc/codecs/nau8810.c b/sound/soc/codecs/nau8810.c
index a050387dd485f..eb3e93380678c 100644
--- a/sound/soc/codecs/nau8810.c
+++ b/sound/soc/codecs/nau8810.c
@@ -817,11 +817,23 @@ static int nau8810_set_bias_level(struct snd_soc_component *component,
 #define NAU8810_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE | \
 	SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S32_LE)
 
+static const u64 nau8810_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops nau8810_ops = {
 	.hw_params = nau8810_pcm_hw_params,
 	.set_fmt = nau8810_set_dai_fmt,
 	.set_sysclk = nau8810_set_sysclk,
 	.set_pll = nau8810_set_pll,
+	.auto_selectable_formats = &nau8810_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static struct snd_soc_dai_driver nau8810_dai = {
diff --git a/sound/soc/codecs/nau8821.c b/sound/soc/codecs/nau8821.c
index c45c5b864ea4b..ecadbaee10379 100644
--- a/sound/soc/codecs/nau8821.c
+++ b/sound/soc/codecs/nau8821.c
@@ -981,11 +981,22 @@ static int nau8821_digital_mute(struct snd_soc_dai *dai, int mute,
 		NAU8821_R31_MUTE_CTRL, NAU8821_DAC_SOFT_MUTE, val);
 }
 
+static const u64 nau8821_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF;
+
 static const struct snd_soc_dai_ops nau8821_dai_ops = {
 	.startup = nau8821_dai_startup,
 	.hw_params = nau8821_hw_params,
 	.set_fmt = nau8821_set_dai_fmt,
 	.mute_stream = nau8821_digital_mute,
+	.auto_selectable_formats = &nau8821_selectable_formats,
+	.num_auto_selectable_formats = 1,
 	.no_capture_mute = 1,
 };
 
diff --git a/sound/soc/codecs/nau8822.c b/sound/soc/codecs/nau8822.c
index 19fee5f4bf5f6..942bed906a6f9 100644
--- a/sound/soc/codecs/nau8822.c
+++ b/sound/soc/codecs/nau8822.c
@@ -1021,12 +1021,24 @@ static int nau8822_set_bias_level(struct snd_soc_component *component,
 #define NAU8822_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE | \
 	SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S32_LE)
 
+static const u64 nau8822_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops nau8822_dai_ops = {
 	.hw_params	= nau8822_hw_params,
 	.mute_stream	= nau8822_mute,
 	.set_fmt	= nau8822_set_dai_fmt,
 	.set_sysclk	= nau8822_set_dai_sysclk,
 	.set_pll	= nau8822_set_pll,
+	.auto_selectable_formats	= &nau8822_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 	.no_capture_mute = 1,
 };
 
diff --git a/sound/soc/codecs/nau8824.c b/sound/soc/codecs/nau8824.c
index 426a488ff2a34..853eb9472af92 100644
--- a/sound/soc/codecs/nau8824.c
+++ b/sound/soc/codecs/nau8824.c
@@ -1580,11 +1580,22 @@ static const struct snd_soc_component_driver nau8824_component_driver = {
 	.endianness		= 1,
 };
 
+static const u64 nau8824_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF;
+
 static const struct snd_soc_dai_ops nau8824_dai_ops = {
 	.startup = nau8824_dai_startup,
 	.hw_params = nau8824_hw_params,
 	.set_fmt = nau8824_set_fmt,
 	.set_tdm_slot = nau8824_set_tdm_slot,
+	.auto_selectable_formats = &nau8824_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 #define NAU8824_RATES SNDRV_PCM_RATE_8000_192000
diff --git a/sound/soc/codecs/nau8825.c b/sound/soc/codecs/nau8825.c
index ae83b778bf935..5165aeba4b675 100644
--- a/sound/soc/codecs/nau8825.c
+++ b/sound/soc/codecs/nau8825.c
@@ -1507,11 +1507,22 @@ static int nau8825_set_tdm_slot(struct snd_soc_dai *dai, unsigned int tx_mask,
 	return 0;
 }
 
+static const u64 nau8825_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF;
+
 static const struct snd_soc_dai_ops nau8825_dai_ops = {
 	.startup	= nau8825_dai_startup,
 	.hw_params	= nau8825_hw_params,
 	.set_fmt	= nau8825_set_dai_fmt,
 	.set_tdm_slot	= nau8825_set_tdm_slot,
+	.auto_selectable_formats	= &nau8825_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 #define NAU8825_RATES	SNDRV_PCM_RATE_8000_192000
-- 
2.43.0

