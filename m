Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011014.outbound.protection.outlook.com [52.101.125.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D4662F7F0D
	for <linux-sound@vger.kernel.org>; Tue, 26 May 2026 02:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779762137; cv=fail; b=r3pXHPXQihylwfIb4ys6T9Q/jWodglUR4iYKKRnyPURNWkY8kRMGrogW0Cc24Cu12s7sOhisstrsbuZa82q8Om6x1i3USxLYshpluzGuBPhJ02keSYCfzZJMv1jTWLORq6sOvdKvvAovvT/qevxlY3+abv5xduGCxeEAkCGXi3U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779762137; c=relaxed/simple;
	bh=OPh/1bB1mKiBwd5gtJYj2KnrM4fVSnIedXRHmDvRrfo=;
	h=Message-ID:To:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=cW/7Sv5x3CNJMkUMUTjFeJd/QSFqYCDgvUh/uqFU1Rm9ZFltmk02Zl2UvT3I5K9Oh68Ou0rCJjSqYU/TBfEhul0ZlphONTA/3ltFIiN4FRKKKl7Jd6aMpfJBe4razxE99WNVpRr5FzDcs5BDro9Cs9cxz2Hv9RqfNktKzBpPJSE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=DvN/nyFa; arc=fail smtp.client-ip=52.101.125.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="DvN/nyFa"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T7OO5o4hQqkHKCPiLVzlBAiVfvbhWFKnBx8pq88YunPP8IMqdloz7LnSs/Lt+OZxii489Hm+ROjzjs/acXOZ8KzpbRXY2JUmpASXMmOO148j6tNhqwkmxk/KVAVKmss5z/T0c4C104AFkgEjADJk1yq0SW6hGq7PZ7vxjwgdjCCWY9XhUuEaE5nFZJcbrTl1VK0zDMCYCXcBEoZSK/mdUjUPCVG7aP6Gpl/Upz93GWW+rOo7bOneHn+bayAIYQEnijb3lM3x2z7+PGj98p/gks4O/nygPq+gu+cYtcU4LMDRw3bozsou/g2e/sus+5JO38wvRyMoFa0KGeKqnscVYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=36OUJ9xGkmFkD9RF+BnmSa7/GQ9vZAidWlQvszQu1GM=;
 b=NDhQUNEg7L4IFPrzxfOlZK7oVPHPsp0U0+MNJpky2PcRX0V9aHl/RvBUr0fWXvp13APj/ZXmLUPI4AEcbmaduBv00PiXIkJnMbIcBK2rtbtcEFyKJz2rehdXeEWIrWujRP6ftWB0FgfQyB76LA1avrRLlddgEGvpOJ8t1az6wnRWkoqEO8WD1yFIGl4OP47/ujRsHGTmMpZeIg80HPyA6+qjrmbQX1i6+1010LHcp4N0VYOED2AdpspiEpAB2QKELj/5vUrPy1uyl/E2v6IqMTVnonUJ6A+pdKGb575vhl6iSXOdxMmhBr1TxQfgMw9b820I+vAfjHjey4xWjzFZAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=36OUJ9xGkmFkD9RF+BnmSa7/GQ9vZAidWlQvszQu1GM=;
 b=DvN/nyFaJuHWeYSN9vsrk9+/o+oGq1z7yYC8nzieTfhia37WG9tNNpFrZk14pgfxIs7cQRDPgrsQo9wL2kXgCtZTvV2sMUq+mOSKdQ3j7zLo5nk45FR4sk6HlNLO6CEgeNsyIqFQqi0fWHf/OOcYtXYwAm2G9nMSzTVviaXguf0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TY3PR01MB10158.jpnprd01.prod.outlook.com (2603:1096:400:1d9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Tue, 26 May
 2026 02:22:12 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0048.019; Tue, 26 May 2026
 02:22:12 +0000
Message-ID: <87wlwqgbak.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH 53/83] ASoC: codecs: tas*: use .auto_selectable_formats
In-Reply-To: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
References: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 26 May 2026 02:22:11 +0000
X-ClientProxiedBy: TYCP286CA0083.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b3::11) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TY3PR01MB10158:EE_
X-MS-Office365-Filtering-Correlation-Id: 29e9595b-d25d-4027-e4bd-08debacd98ad
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|7416014|376014|22082099003|18002099003|56012099003|38350700014|921020|11063799006|41080700001;
X-Microsoft-Antispam-Message-Info:
	OtSbi1fD8SJGSXhVlTSfedxuyC4Nh2UR68pHhsmmvqZ+gd7jz/v73yDv9zOwYMkU/NrpvMyHvLl+nEeqsV35yB+flDt/ajunhZcfqX4qtJDK1F1IZWg1BtnSE4k7WUmXUM7VfnBqXYtujjHTUe3DRIhN1KXH29FCUzP62GywJfcxz/EXOAsgbDhP1PGDRaD1uXIVCnKx8nhsZ+qxkKXY9hztGY7AZyptfCN3m1YGV8dub7hrLAwqjDQiVowGqpzLif54jRmLdgItls9G6b0Cad5b6YrkOu0ItYDd7Fv4CrGn+nzCZeVkhViNSis/TE7O6Ae4rdnStDyjzbH6/nPG5xLwgdTNyZZKC5lHatcBFovP0UKTt4uXW/PblyOmxLB56qseozIMaX14YUHB68Tj/ZX4YRdQcz0pRmi+lUIsYTXlC7D/vvjPuYvPXf3yQ6cdBYh7gpzaNTfYuVB8tfSmKlqD3d9YoHDYSSoI17CrwhoyYVvrgtOePvTFVQAop87I3PR6Pwr3Z+mqOLGz5jSpstA+NivQWo2QDBLNr0wzfHhs1Cv6kUxMCP9fyfMK8p+SlXuAHUTWpUj1c2qZVl3J/uSV6eB9tvb7tdmHzpw2fhm296XdMoPpokYF5/mz7Mbv++U+hJdJOtoT1UJAc5erBYlM9d97mi0bJM1NJ0SmeBO5hA6BVzylfaYGNB0690fI9IeTNc/bCrV2VzsHBOqlmptjQh3EDnoVCU+mguiWVJd3DnnGIXm5/tPt1ZkGhZ4sFPjErV+LFoXURwVZYsEego231nDVSp+HFt7u2jm6cKU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(376014)(22082099003)(18002099003)(56012099003)(38350700014)(921020)(11063799006)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?v4Lcq6eSuj4TgWzyAcKemne18Lyz5ACXxVi10bat35xU5nLxVTKwLsp7FO/J?=
 =?us-ascii?Q?kylGkff/3NGd6oJF2XU1Ulydi1wGZMa41j1bDCoVNSgNnOWuan6yqhXNdu03?=
 =?us-ascii?Q?jIwGAM1X6BdL+D3yMFBf46OW/SBxw2zvwQuidQdnbpvDuNQ9v75ByPXD1Cy1?=
 =?us-ascii?Q?8TrCHeNw8D1RAWCBd2QSUOb8Z3eb4FGYzCO3/NTiKkMMdrLU7RnaWUPZ/a8A?=
 =?us-ascii?Q?NRLwCMITrhdhuXsiWuLgqR9rJwWXQibX4vUlij0xIjfqPm5hC5HKZxUOkz+5?=
 =?us-ascii?Q?vp6nHxM9RNw0HE1cjX7nZLGT92nB2ezLunU2DNlX3AtZl6hD+wvRWrn1bLfN?=
 =?us-ascii?Q?0+88prMGnqq1RVNsxT6V2BLTuY5VbBO9jYTWrDw3VA0wRKuBdQiBDnw5J62N?=
 =?us-ascii?Q?V4ciO6uOcbwdyrodckX/j1Xc/i4JClCf4opmg/sco1Qlp8y7JVpurhP8lbJR?=
 =?us-ascii?Q?Xc23FrjFg3cm5adKwtE2eLTWGesgtMSGESm53Yi/+xv1/jDowTqRPbmIVR4f?=
 =?us-ascii?Q?WAguVpjOWr3uc7cXZU9VC0v5p4k9u5KLeuebV1QOzHBf+O2HS4JR2bpgPP7z?=
 =?us-ascii?Q?9bsJwwl0FsVYsXDN8TSxWxBkztbWGHfsJHZkv6t0dzqoia+6+BoVk2bxmtRf?=
 =?us-ascii?Q?IJaORxKsAI3EK47xRW3fjUYXb9XXjcrBrx8F8PPIhUHhfFx8x6ZJixzxJY+I?=
 =?us-ascii?Q?c6nP5+11niqqONd8xYCXYuMgxEShY9ww+JL53AMaa06Dz8XxDbU3+/yPUJdS?=
 =?us-ascii?Q?b128nfHTy4OpgMmwl6MIr2LdNXvf5EHwRZuFuuicCajs+AlUkQpGBvYw/gOf?=
 =?us-ascii?Q?j/CjHerA25z5/z3+l5xq6oADeyi0gz4RbaaCUeGa0dsHQtL/K9D3YqniAwfT?=
 =?us-ascii?Q?6U1zDsmedXb7Ffomikldeiehr5AReUzF9wH4X/edMAtR9iIvfz9vE/iZPAcH?=
 =?us-ascii?Q?kW1s9FIcOanNt1bMVY3NGcRWp/oDYKoLPY4KJM0mFcCMAMc/29ryB7rDtYid?=
 =?us-ascii?Q?wWvv90pdPDrtJft/ag7hQ0lAfTGv1fHks6YiJsLKYrDRUrOuYrvWEHceu2Gq?=
 =?us-ascii?Q?O8Ku5oXeHz+RKhNrZUDYO1yxM8SY6nfZxaos8xOxlPJrAfUCjFZ3mRP8xGkj?=
 =?us-ascii?Q?117fxtO4Lh4u6gIgn5GVHr2QHxs3L1YbsreYqydN8ULbv3RcJUf5cCEsLaK6?=
 =?us-ascii?Q?wrYRvgNwIU/cj1DovM/aG0JEVFhyq49P+CkVjAb3q3NDJBX4yFZvkgJ9czwv?=
 =?us-ascii?Q?68FpvVbmUPyirkSAK936CUcfbh7vf4YdTYS+DHVTsFAnYz7k9+d9y0voVI5R?=
 =?us-ascii?Q?zQWO1xh5Kj15q6LTnUFjGi0TJyeULWCj1mB21rBXM3VKV83jNRK+mAOuD01N?=
 =?us-ascii?Q?qLAYNzwPetXXXlGxuRRnT9GKeJviQeYq/fngadCHUReak5KnK5xBD7MJgLae?=
 =?us-ascii?Q?ohUVr1vFRZ43d4fiUtg301+9ZAjcQcYeb75Hcf9vL2gxJZ8CvubOH8mstN66?=
 =?us-ascii?Q?d5YfINkH48/1BJEMRFzdddrPW6VI8QRlr9ZzcA8YonMucOpmUffVdngNlxmH?=
 =?us-ascii?Q?enzpt6ArRw8pk4lOYI4YX+TYaFhvy0Hnera7u7pFEc16SEEd60lsqb4SfC4E?=
 =?us-ascii?Q?+8brwfujmGTsMzfpocVywIiY3BXQRX5fbS9mjZv6W1JgufjyuibHNAWKxXEW?=
 =?us-ascii?Q?z4g4paStcmZCqu6vC1m9BA8R30SeE6iab5j5JkaYVCZmwf0clSBS+PV06Nl1?=
 =?us-ascii?Q?Xp5hFvj4nKuJLQJtYU68jDGP0GJfur18O4E83F1KGQrTJeUonb37?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29e9595b-d25d-4027-e4bd-08debacd98ad
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 02:22:12.7385
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QP90BrnrrdyammQhz8c9Rf+vRgk/vSBNRQ2ptoBeKpNJvI7oLY+ClagBHPUyyWpudxcb6E56CwR0nxXESHLzEWQ0WFEdvvCBo3CINQ9LCg9MBY+CKf00gEpS5e+L70dB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB10158

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/tas2552.c | 14 ++++++++++++++
 sound/soc/codecs/tas2562.c | 10 ++++++++++
 sound/soc/codecs/tas2764.c | 12 ++++++++++++
 sound/soc/codecs/tas2770.c | 12 ++++++++++++
 sound/soc/codecs/tas2780.c | 10 ++++++++++
 sound/soc/codecs/tas5086.c |  7 +++++++
 sound/soc/codecs/tas571x.c |  7 +++++++
 sound/soc/codecs/tas5720.c |  9 +++++++++
 sound/soc/codecs/tas6424.c |  9 +++++++++
 9 files changed, 90 insertions(+)

diff --git a/sound/soc/codecs/tas2552.c b/sound/soc/codecs/tas2552.c
index 1a7650b9b2a7b..9195c014dd50b 100644
--- a/sound/soc/codecs/tas2552.c
+++ b/sound/soc/codecs/tas2552.c
@@ -510,6 +510,18 @@ static const struct dev_pm_ops tas2552_pm = {
 	RUNTIME_PM_OPS(tas2552_runtime_suspend, tas2552_runtime_resume, NULL)
 };
 
+static const u64 tas2552_selectable_formats[] = {
+	/* Hi Priority */
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF,
+	/* Low Priority */
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF,
+};
+
 static const struct snd_soc_dai_ops tas2552_speaker_dai_ops = {
 	.hw_params	= tas2552_hw_params,
 	.prepare	= tas2552_prepare,
@@ -517,6 +529,8 @@ static const struct snd_soc_dai_ops tas2552_speaker_dai_ops = {
 	.set_fmt	= tas2552_set_dai_fmt,
 	.set_tdm_slot	= tas2552_set_dai_tdm_slot,
 	.mute_stream	= tas2552_mute,
+	.auto_selectable_formats	= tas2552_selectable_formats,
+	.num_auto_selectable_formats	= ARRAY_SIZE(tas2552_selectable_formats),
 	.no_capture_mute = 1,
 };
 
diff --git a/sound/soc/codecs/tas2562.c b/sound/soc/codecs/tas2562.c
index 2f7cfc2be970b..7294e0fff29c1 100644
--- a/sound/soc/codecs/tas2562.c
+++ b/sound/soc/codecs/tas2562.c
@@ -588,11 +588,21 @@ static const struct snd_soc_component_driver soc_component_dev_tas2562 = {
 	.endianness		= 1,
 };
 
+static const u64 tas2562_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF;
+
 static const struct snd_soc_dai_ops tas2562_speaker_dai_ops = {
 	.hw_params	= tas2562_hw_params,
 	.set_fmt	= tas2562_set_dai_fmt,
 	.set_tdm_slot	= tas2562_set_dai_tdm_slot,
 	.mute_stream	= tas2562_mute,
+	.auto_selectable_formats	= &tas2562_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 	.no_capture_mute = 1,
 };
 
diff --git a/sound/soc/codecs/tas2764.c b/sound/soc/codecs/tas2764.c
index b11b998aa32a6..37aa17be32004 100644
--- a/sound/soc/codecs/tas2764.c
+++ b/sound/soc/codecs/tas2764.c
@@ -602,6 +602,16 @@ static int tas2764_set_bclk_ratio(struct snd_soc_dai *dai, unsigned int ratio)
 	return tas2764_write_sdout_idle_mask(tas2764, tas2764->idle_slot_config.tx_mask);
 }
 
+static const u64 tas2764_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops tas2764_dai_ops = {
 	.mute_stream = tas2764_mute,
 	.hw_params  = tas2764_hw_params,
@@ -609,6 +619,8 @@ static const struct snd_soc_dai_ops tas2764_dai_ops = {
 	.set_bclk_ratio = tas2764_set_bclk_ratio,
 	.set_tdm_slot = tas2764_set_dai_tdm_slot,
 	.set_tdm_idle = tas2764_set_dai_tdm_idle,
+	.auto_selectable_formats	= &tas2764_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 	.no_capture_mute = 1,
 };
 
diff --git a/sound/soc/codecs/tas2770.c b/sound/soc/codecs/tas2770.c
index e79754edac5ca..59912ed9f4a5f 100644
--- a/sound/soc/codecs/tas2770.c
+++ b/sound/soc/codecs/tas2770.c
@@ -566,12 +566,24 @@ static int tas2770_set_dai_tdm_idle(struct snd_soc_dai *dai,
 	return 0;
 }
 
+static const u64 tas2770_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops tas2770_dai_ops = {
 	.mute_stream = tas2770_mute,
 	.hw_params  = tas2770_hw_params,
 	.set_fmt    = tas2770_set_fmt,
 	.set_tdm_slot = tas2770_set_dai_tdm_slot,
 	.set_tdm_idle = tas2770_set_dai_tdm_idle,
+	.auto_selectable_formats	= &tas2770_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 	.no_capture_mute = 1,
 };
 
diff --git a/sound/soc/codecs/tas2780.c b/sound/soc/codecs/tas2780.c
index 1ec1c076204fb..8f869cf0a187c 100644
--- a/sound/soc/codecs/tas2780.c
+++ b/sound/soc/codecs/tas2780.c
@@ -441,11 +441,21 @@ static int tas2780_set_dai_tdm_slot(struct snd_soc_dai *dai,
 	return ret;
 }
 
+static const u64 tas2780_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF;
+
 static const struct snd_soc_dai_ops tas2780_dai_ops = {
 	.mute_stream = tas2780_mute,
 	.hw_params  = tas2780_hw_params,
 	.set_fmt    = tas2780_set_fmt,
 	.set_tdm_slot = tas2780_set_dai_tdm_slot,
+	.auto_selectable_formats	= &tas2780_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 	.no_capture_mute = 1,
 };
 
diff --git a/sound/soc/codecs/tas5086.c b/sound/soc/codecs/tas5086.c
index 4d1c122c8f04f..1ab82ef1c41d2 100644
--- a/sound/soc/codecs/tas5086.c
+++ b/sound/soc/codecs/tas5086.c
@@ -743,11 +743,18 @@ static const struct snd_soc_dapm_route tas5086_dapm_routes[] = {
 
 };
 
+static const u64 tas5086_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J;
+
 static const struct snd_soc_dai_ops tas5086_dai_ops = {
 	.hw_params	= tas5086_hw_params,
 	.set_sysclk	= tas5086_set_dai_sysclk,
 	.set_fmt	= tas5086_set_dai_fmt,
 	.mute_stream	= tas5086_mute_stream,
+	.auto_selectable_formats	= &tas5086_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver tas5086_dai = {
diff --git a/sound/soc/codecs/tas571x.c b/sound/soc/codecs/tas571x.c
index 8b5f9accf1207..5e2560347461c 100644
--- a/sound/soc/codecs/tas571x.c
+++ b/sound/soc/codecs/tas571x.c
@@ -352,10 +352,17 @@ static int tas571x_set_bias_level(struct snd_soc_component *component,
 	return 0;
 }
 
+static const u64 tas571x_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J;
+
 static const struct snd_soc_dai_ops tas571x_dai_ops = {
 	.set_fmt	= tas571x_set_dai_fmt,
 	.hw_params	= tas571x_hw_params,
 	.mute_stream	= tas571x_mute,
+	.auto_selectable_formats	= &tas571x_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 	.no_capture_mute = 1,
 };
 
diff --git a/sound/soc/codecs/tas5720.c b/sound/soc/codecs/tas5720.c
index 0bbcfaadf3f2a..2539a097e743a 100644
--- a/sound/soc/codecs/tas5720.c
+++ b/sound/soc/codecs/tas5720.c
@@ -682,11 +682,20 @@ static const struct snd_soc_component_driver soc_component_dev_tas5722 = {
 #define TAS5720_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S18_3LE |\
 			 SNDRV_PCM_FMTBIT_S20_3LE | SNDRV_PCM_FMTBIT_S24_LE)
 
+static const u64 tas5720_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF;
+
 static const struct snd_soc_dai_ops tas5720_speaker_dai_ops = {
 	.hw_params	= tas5720_hw_params,
 	.set_fmt	= tas5720_set_dai_fmt,
 	.set_tdm_slot	= tas5720_set_dai_tdm_slot,
 	.mute_stream	= tas5720_mute,
+	.auto_selectable_formats	= &tas5720_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 	.no_capture_mute = 1,
 };
 
diff --git a/sound/soc/codecs/tas6424.c b/sound/soc/codecs/tas6424.c
index f5d50f8a1cfb9..2718183e864c3 100644
--- a/sound/soc/codecs/tas6424.c
+++ b/sound/soc/codecs/tas6424.c
@@ -378,11 +378,20 @@ static const struct snd_soc_component_driver soc_codec_dev_tas6424 = {
 	.endianness		= 1,
 };
 
+static const u64 tas6424_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF;
+
 static const struct snd_soc_dai_ops tas6424_speaker_dai_ops = {
 	.hw_params	= tas6424_hw_params,
 	.set_fmt	= tas6424_set_dai_fmt,
 	.set_tdm_slot	= tas6424_set_dai_tdm_slot,
 	.mute_stream	= tas6424_mute,
+	.auto_selectable_formats	= &tas6424_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 	.no_capture_mute = 1,
 };
 
-- 
2.43.0

