Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011067.outbound.protection.outlook.com [52.101.125.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DF58305692
	for <linux-sound@vger.kernel.org>; Tue, 26 May 2026 02:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779762594; cv=fail; b=H/X/HX1EidtjqBXzYzyRc4jGHA4Qx1rXzbR8MZRHQHrofdr9zEdBQHX8KZKmvXIP9Ia3dyDP8B3oqm6yxoNSWPqeBWHWPn9IW/QD1Tj8CqrT/lLLSFTANKRU12THS+maGSyMwZhVps0o3hvps1kysTQt2xUM+wH2emJoE0ta7e8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779762594; c=relaxed/simple;
	bh=QAd+MufqSeUQxobGnTSCeMCaY1AJA0xrcINcyr7elRg=;
	h=Message-ID:To:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=KAARvGJS3qI10ogeZWR5ooNxNxPF+EOYY4qpGTIbTQiOJ57QyRDm0MrYDrcCehhrJ9GeQoL4ckAbzQG8jaJ4lW4UcZegPuZF+6PMz+wyopPPapJlinj2hEKxNYAK2cd+lX0WE7ItUnTMzg1bPBkgQSDAADxcrLmMon3qFSLBrP8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=WT4zVjxZ; arc=fail smtp.client-ip=52.101.125.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="WT4zVjxZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c0uQjunGnH3Vwa2xblNj1eyguh2Yffh0kKMqZG5U7dFAGgvok7HkYBf4LRZl7xJO/7UDocqzkU58543Wf6hoPntMS4W4rG+yG0TQlSe8YYU4kA+E0i0WfTcsSkO4spDUef7yFa3YZWBNXEAXeUSjYSCsoMPi4tHYoMJot0PAOlId+0rxYG1tSRvK1Q1Q0iTLUcwVHZkEhxMAVvcg6CF4qVEvN533a5HEZgNYc99dTTECyLdjEc3PsVsy0IDfBr8uQlQlILXA+J4A/rSq8apRf6BOATGE/Au6KRYHAhLSYENYnolBjg2gpbVMDjmYwZf2sDlojPEynaBKvD7w4wiKvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yR27TPidg1hhxgxPJ6jMbLYmvGfKj6zdAMVIzvra3lg=;
 b=Dieloz5UcGV7KphC5jo3118X0EQkQ3nPyC3/u44B4VU/+CdsvMkInxmDUn6EW4bVmJiH7aZ8W1IpCwWIrRTyQ5DIehZmAxKy6xPMm0o3G5VtdVHS6NzqxDB6wrWD8QD7mda5zvh18BtMiTbiEq7rvCjWSCuco8ljCSLXY9Wv8qcb5A+Oj/WEJ2+gUfLhww9uLvh2lbnG8o7fNqJ0KcpQjAaZUKh3wv2cbGG1GFgKwaLeTTeIR15bhCvlTSewI3CDjLOZmkHwy7asXv5SgqeIr9yFOp7CL+GOBPldVjTrA8WrZUuXImo+20sForZQvx0XUfdXT8QX8HrjSgtV3n8R1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yR27TPidg1hhxgxPJ6jMbLYmvGfKj6zdAMVIzvra3lg=;
 b=WT4zVjxZ8NQaFOPDzCjGDrv6cdNFOErZwBRCHbLfAHCb+GRKWO4rARXv8ZGIeLq09QovBSieo5Sc2epoJcPvZuv8+xYSonvsb+jz6ZnaSQwB2AkO6y4uESymZQXfKvRg8CKIsSoD/rOGJgyxvZu8u4NEovYTFknEVxnn8AoaMJQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYCPR01MB11158.jpnprd01.prod.outlook.com (2603:1096:400:3df::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Tue, 26 May
 2026 02:29:50 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0048.019; Tue, 26 May 2026
 02:29:50 +0000
Message-ID: <87qzmyewdf.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH 82/83] ASoC: ux500: use .auto_selectable_formats
In-Reply-To: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
References: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 26 May 2026 02:29:48 +0000
X-ClientProxiedBy: TY4P301CA0083.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:36f::11) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYCPR01MB11158:EE_
X-MS-Office365-Filtering-Correlation-Id: b06b1e15-22d2-411c-6ac5-08debacea936
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|1800799024|366016|56012099003|22082099003|18002099003|921020|38350700014|6133799003|11063799006|41080700001;
X-Microsoft-Antispam-Message-Info:
	w5iK+OGBu68dR2YjKeTxkO6RfNeLAe16f1WReZhfuZ/CnPYNZUEDeDgKgLVt7Dhn6csKW1P5TWCI1zKhFdQ2jePkfnGHBmetqdGhgg291iE8lFR5+Y1I3kbCOpp3x//IfCVZN+A/GK7fLzCU1T3Qeh4IDRUSmBBS2tswi1MFX4JLmZpNqN7EJGHwG1Y+XwmzP3nYiAh2t0ZGMvMMWcxPdKIHuNnh/rnOxOVTcFdz6wew/WgAT1/s2vrhppjWWgqXqzwRJT1iO8fsZc8ROLfCk5A6M+82UHDERSyoLOM1xT0V68HLW+tUD0APGFdYXR+rdDq9vKXAWSAtOeBfht3vnOv+Daszzo56jpfBGxdF6f5tS9jheThSt4wFUAWmVbMtsNG7CaUsVb8b8PyxGEucJqdKB0ZkEXtVWt2ahoZ3uFnnBIRLuZWXfSGneHu5VAoF04K9Sc5zJ89PH7bzyDVirRZpL+tKJAO41uMnnIzQMt6kdNG986Kql3Ki5tBS8SPSiFc1uybNVnw8NoawB24UCkefMnKvbkvPvgMSLPX0Jxv/4c1iWHLS9RENJIyAZwAwjg8Uqujl5acu9J5HnCoKUjAXI4OEY/zm1SRULRZfO1KW5v5EEq8kxdKzvaTAFbwuRH/81IbHnF/uuARyKzd946tl8gsUvpG26E/k5B5qCnu4gTBJsv/buR29BEM+PvwaikkPlrkUZxrbQb6uhHYWp9KoHfXgmDZmvY8J4ZEjC1SdxJlqONvrc0QVpcVpGRMWAEBFRFM2EkYk8e2GVe14dNMUJasTyDERrapRZboZmVk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(366016)(56012099003)(22082099003)(18002099003)(921020)(38350700014)(6133799003)(11063799006)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IrP6oqbHXyyUJ4s44bFwlFwBc5JF2Paje+GSyqFoQzusST77Ge0lo5wVIz1O?=
 =?us-ascii?Q?BwJyt7PUaDR4hcoXSuyQj15l39ja2egQnRjZihuCp6w8PbD7xEgsh/kPXLu3?=
 =?us-ascii?Q?Ua62osgtvXw4/CxVnd+3c7H90mI1akHDjpokKCaVBaLA0xGO99U+7YhDUQpT?=
 =?us-ascii?Q?vfqY1/UZ5iM9UivjiTaBoHSL3JVdGEV942TQ7815qGTp76SWdMbUJloY4/6x?=
 =?us-ascii?Q?a2AID+e87JKvN8MvjKclCeVboWrpM+xIRBA2caQvdtKR1LKZs7i6zVfx+B2d?=
 =?us-ascii?Q?hMZySsaoR7c/PIzx6DAdyn9TFqg61uAJ6oT8wlSqYKRLxWMYv59b5k/dt+a1?=
 =?us-ascii?Q?+rdhFb3X+O6DwbNuTzQNgGnTQnMyNEseLi2IXDtNEnOilN/oRgaw4BnbdKYW?=
 =?us-ascii?Q?ih/SWtR4fCx/3jt18pyewCc4gB8eU+XbrEuhDWYhQzCKd1mvhG/96ewudjCo?=
 =?us-ascii?Q?WK5q0vm8Euhj5YU2eiiPONwnnH8UG/HvVi8VnAsqNLDig2tzKAEpQgJN4yli?=
 =?us-ascii?Q?RiXzPC8+hfM02QmKvzGrME/3L5dvYxNgolCc9D2YgVSPfVU2Q5vnnDBgeAeh?=
 =?us-ascii?Q?fNVGa2bYYjXpkFSR3hJbMvna24YSi5H9vVCqn2ZGWjTkyeg26oPA8SfxF2N7?=
 =?us-ascii?Q?7QYtQbuLJff3z1hM8lRMDKsJ8MsXLxGeEuhy4DP50qrHBKv/KWZ9VdAY2blW?=
 =?us-ascii?Q?pX3+cRXJpqIjJgkzP8/yIOmy5KLXrfrxgLXXuIsYI3ia6EWOpn4Nyc9ziAaj?=
 =?us-ascii?Q?tK1aE41BovdBFYn2FbMhuYZFVFCeReKIvPlx7q/ufowgvagQIJGM1/D0Q99e?=
 =?us-ascii?Q?P52D/Jr+1acuHnQMlzct56/LPwowOmZkYI+10kHof33dI29YYmuBLap+MAnz?=
 =?us-ascii?Q?P1K/KDh1QMMUrFcanhVhe2ihEHavbmeqMoqNJMxuVNEQLDTf02vtk2zdgcdv?=
 =?us-ascii?Q?p3y1nLvuf1w5LWZKeSIIgZRZMSFRzAppFI6maiEaNUdBGnK05mo/J0R0sJsz?=
 =?us-ascii?Q?E29frSz/AdXLXVyuil+rhpldM4Cep3AQPx7pIdi6SP9VshrJ3/KjC3XzKE6Z?=
 =?us-ascii?Q?SmzlKJymshxry4cW5yusZXhYI1BRHc1nUaPvmw7aWL4v0pyF2EMgAMSM1xSw?=
 =?us-ascii?Q?mriwC1GZJ1Jvyi2CZx2ZPUcXRXWw5MYc5yqvHW7I5eJdvhQaHzwE7RX3ayco?=
 =?us-ascii?Q?eT0ZD65LaWkALH5moBE43rW34UwkqBnf9183shJ8tZJahkMmbEtkH7MpF/dS?=
 =?us-ascii?Q?9Wx4+E5JYaew06niu1g5kZ7h7BydDC5SReHsU59YB0cYjWNOPLpE7GSRvsGX?=
 =?us-ascii?Q?mDmdzpAZ46NSC36ktjPjfDKrpP+npErvKraW3wh1TZwLw4W9zqKQ1DhAL/Sw?=
 =?us-ascii?Q?VEtujZiHpDTAzI46uvfN1i3ZmB7zAZaV3yzP6lhYgU/8B1S/fkgoEH7uaEVF?=
 =?us-ascii?Q?A0nu0HMbZ/vvA1he/BCeIZG7po9niI9eCGiKEmGQumwKHFqAsAr1EePD5Pjs?=
 =?us-ascii?Q?J5EzyD5HV3OoQGmuAU5blSAwzU+fTJAym9rWpjfc/TUqkDICLrXGmKvFSzjm?=
 =?us-ascii?Q?/LXGSzXxyhNVJg/0n2z6kPRoxt5sOL9r4uZDEBbdIpjXGZd5I0bXE64vk0aE?=
 =?us-ascii?Q?dUNMQb4zOezMJISitahm0DqacCVRYUXz9WcYt97jBjco+KrT1oYHnLJtkO/f?=
 =?us-ascii?Q?Y13uGhVUHWvcBC56wZDgW9yfC+CcCzdJ6sDPzNyHNvYiypL9yevdC+9+lyX+?=
 =?us-ascii?Q?c3bbBXKVV9Vb0ti3VUHAg7TgGJ7oYGi46H6klamziHiJ/ZdJIbqz?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b06b1e15-22d2-411c-6ac5-08debacea936
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 02:29:49.9418
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZczXWXULTouMJ/4naJEcDPx0QMnaMAurYOQQgXWT6H+MFQJ00zXVl8mx7GxY/jxkVCnVe9XiJ0TG4psLt1XgkhFQLRkNjJZ2u0My0hJZYZCJBQM9eKsZwWpJPxwsIHBx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11158

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/ux500/ux500_msp_dai.c | 33 ++++++++++++++++++++-------------
 1 file changed, 20 insertions(+), 13 deletions(-)

diff --git a/sound/soc/ux500/ux500_msp_dai.c b/sound/soc/ux500/ux500_msp_dai.c
index 7798957c6504d..68cf2d21f184a 100644
--- a/sound/soc/ux500/ux500_msp_dai.c
+++ b/sound/soc/ux500/ux500_msp_dai.c
@@ -681,18 +681,25 @@ static int ux500_msp_dai_of_probe(struct snd_soc_dai *dai)
 	return 0;
 }
 
-static const struct snd_soc_dai_ops ux500_msp_dai_ops[] = {
-	{
-		.probe = ux500_msp_dai_of_probe,
-		.set_sysclk = ux500_msp_dai_set_dai_sysclk,
-		.set_fmt = ux500_msp_dai_set_dai_fmt,
-		.set_tdm_slot = ux500_msp_dai_set_tdm_slot,
-		.startup = ux500_msp_dai_startup,
-		.shutdown = ux500_msp_dai_shutdown,
-		.prepare = ux500_msp_dai_prepare,
-		.trigger = ux500_msp_dai_trigger,
-		.hw_params = ux500_msp_dai_hw_params,
-	}
+static const u64 ux500_msp_dai_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B;
+
+static const struct snd_soc_dai_ops ux500_msp_dai_ops = {
+	.probe		= ux500_msp_dai_of_probe,
+	.set_sysclk	= ux500_msp_dai_set_dai_sysclk,
+	.set_fmt	= ux500_msp_dai_set_dai_fmt,
+	.set_tdm_slot	= ux500_msp_dai_set_tdm_slot,
+	.startup	= ux500_msp_dai_startup,
+	.shutdown	= ux500_msp_dai_shutdown,
+	.prepare	= ux500_msp_dai_prepare,
+	.trigger	= ux500_msp_dai_trigger,
+	.hw_params	= ux500_msp_dai_hw_params,
+	.auto_selectable_formats	= &ux500_msp_dai_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver ux500_msp_dai_drv = {
@@ -704,7 +711,7 @@ static struct snd_soc_dai_driver ux500_msp_dai_drv = {
 	.capture.channels_max  = UX500_MSP_MAX_CHANNELS,
 	.capture.rates         = UX500_I2S_RATES,
 	.capture.formats       = UX500_I2S_FORMATS,
-	.ops                   = ux500_msp_dai_ops,
+	.ops                   = &ux500_msp_dai_ops,
 };
 
 static const struct snd_soc_component_driver ux500_msp_component = {
-- 
2.43.0

