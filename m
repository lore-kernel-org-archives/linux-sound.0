Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010029.outbound.protection.outlook.com [52.101.229.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2A68305690
	for <linux-sound@vger.kernel.org>; Tue, 26 May 2026 02:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779762456; cv=fail; b=eiRvm+R2BgNR79tv1vi2gvMczPYDcWYmC8jTgFFGQpTUQYGEiGozurTj3v45IBrSYHe0Yho5OyQAWAiTtwaoTojpeiIC4U7FYUwtHSXrP1cmO+L6zInw8JenCqR4f5PVHeXE1knU7ekEyGhTgggJ3Mqxf0nYcWi7ryNz09Zxmug=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779762456; c=relaxed/simple;
	bh=HDpqIIIgHa6t1PWv2kSIBvzAroJKPNWY9b+5vQYu2C4=;
	h=Message-ID:To:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Jo0D754ehMR7hnixHuXxR0tRllTNu3wN1ylYoiL+CLm2f84SFYS81OYPDtAQJCEPUVHqpCLaOqBZyCSLU93a5NKlDjnupWwU5CT3rpIBxgIX7Dpac0f6h98//bxS7OPjJC8z+Ye2/Vp5hJaEpa+dZc1LMR1or59WOoTBkKLdrzI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=STz9Gcf9; arc=fail smtp.client-ip=52.101.229.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="STz9Gcf9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EpE1dKFR2t+OCbWBuHKawv5/IfeXiwBKNJ1kwChBiKrP4sR6N2tzd0yPpJ1n1bY1aByT0RSfK4bsTHxwxsKnDauqQSp3qQlgETUvR2xh8m0ZhNv3fFpmbFRH3DbO/BFR1dx02Bl8Ym96aC+0ngx1EC0swnzpQeUoE2QcUEIaSoAAiFmLHyKY+ESr4mCpzECCzG6wzfpqOJoO/kBu0UnEYATlwZrC/Ak8FSXIEfHqCaSfNohWkss1l+SHFf5vB0E05L+uqLkF8hkKeFzWsR8fsZV+jpdUlg4sv3emKmRFYTOx1IpDlYBnw+ZTH/MwpEuYquomNcc9DOkijtMY8/9Puw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kV3eZt0k6OiJuqEL1PH1YVWpfe9YkiTlD/DloMUhAMU=;
 b=jUVEzq1COGi08SyL5CUweLCWA5UcZzTiCHsOqB6vBk8Bn9cxrP3SSlToUAspQL/VQfIQIeoiNfz1WotN05ATyHCs9mgLDWre8H332ThQFZRFpSrv/Rm2WKc/7GzR4enpGDxgr/kcqB7s0LB/ZYqlAseJWsTBhwksJNQFWp696OFl7okc94qMen6Ey9tLG5tFG2SD10Dx/kN+W5OT8Af0f+LcA1QCMmuI9APDuKRNWjh/ENK1JMRKNdvbsB0aw8vsjsgExY65v+mTFuXXzRBHkU3LMqU2XRopfQNnuPrHH/eWa3iwnr7O8KhwmmsO1TbRk6A7OxRlQYZwucwQuHG+TQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kV3eZt0k6OiJuqEL1PH1YVWpfe9YkiTlD/DloMUhAMU=;
 b=STz9Gcf9csI3cpBE1Cc9y2exzHy5dl98BSsKYUOGrqgHV41vZVaq4YcxvUF+UghT4i4qHtJSEmkx9hYJE+8PV2uYmcoZcVPX9q0chVxHdAoRPAGJC5gDoN2p9L7qMyZhJSN+kr+71UKeNTtvBVdt1tfN7cNfEG9xg6WltD4YMKo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYCPR01MB11158.jpnprd01.prod.outlook.com (2603:1096:400:3df::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Tue, 26 May
 2026 02:27:31 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0048.019; Tue, 26 May 2026
 02:27:31 +0000
Message-ID: <87wlwqewha.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH 78/83] ASoC: sunxi: use .auto_selectable_formats
In-Reply-To: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
References: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 26 May 2026 02:27:29 +0000
X-ClientProxiedBy: TY4PR01CA0075.jpnprd01.prod.outlook.com
 (2603:1096:405:36c::17) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYCPR01MB11158:EE_
X-MS-Office365-Filtering-Correlation-Id: e024db4d-cf05-4bd0-5c9c-08debace56b2
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|1800799024|366016|56012099003|22082099003|18002099003|921020|38350700014|6133799003|11063799006|41080700001;
X-Microsoft-Antispam-Message-Info:
	nQHKSEQM3RMMOv3YsYVuWeeP2MhX3DdoJFPRM7xr6SDSnISvPKbnBvq8Ne60Eu/VunE7nfvPLXM+S9lGYUBlIVEJUsMyt/W77idjBoedLgN92Cz5JXnntH/oTUo8R1fW5tUjUY6DMwDwJ9LEiJNameXiO9wMP3QV0u/rHUFPZ/Q43ft4tLG3Igwxtp2bnXFzS6MV88qc/q7yrjobeN8x3cMMh7Nmx9qxCyGozMThbCmMQepZiLhuAyMKQfmu56otOwjzvPus5aXjsOGHNPJjGBKbzmoY0PgRns5shwnpdAuplaJwVQUxH678DGW2T6ZkgEGp8Gyb2lYsppIkgqa9NuraOLZmU4hKVznezlqIQw+347FL7vGV4iFlLxfKPTA13qo8F2PBGUePq5opwZ2PQEobnpY5VQH4zRTuK46Zz9vIajCXK6LiQXE4H2IWSpRGEFHPcknDSNazpZRuGL/uC5luFDRLAyIKhWhPu4amOvpYrCNIYaNGOQboN1yL7JYoARfo+LW3LCnN4OjcMbuv0fM9oooFFrUnUTV2XKlYaEd7vkTcCQT9mZ6f7IJXaGINXlfsHrzgQc6Of3t7L6EJSYG/g1Eg7Y//CZ772a4Z1zJqs48uiiwS48wzffkq59TspT+9c4Q7mTzGoifPVrmzL5BcNZX0XiK1CJOsmS/o9wXgt819RVSeeaaG6ZSDLLXt0BSz2PCEabhSumnLPSYXXM5BTwfwpaiHv7mm9C0JhijekBIEVpIzemmBceDljMAeJvFK9pTuVUmy7gOsPTQbbhBSGEoqyo23AI8g8RrgGwY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(366016)(56012099003)(22082099003)(18002099003)(921020)(38350700014)(6133799003)(11063799006)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Lb5LT3/9D9sWHK9u70TpWD3UsMtcWrk+BvWf4gSPo93S0VYvQQEhRfB8WtwF?=
 =?us-ascii?Q?lgEUuq3QTzWA3Y5x2vHE3vfOza3/PJKqzv0hj1YORam1mHt8tPO8C4ei69BF?=
 =?us-ascii?Q?DvJXNASXZqTKy9bgJApD0QO6S/nrI3HQ88a9nPtXlPzArqopkkM2czYh8YLz?=
 =?us-ascii?Q?EZXM8pfX18HZObsZbZWFPxLNLuGL668VV51ZfRd+/rzcC1I7huZmTtuuNWF5?=
 =?us-ascii?Q?zOm3eNq9zjACulIpUDWYSETR/3/BfgmBB5D8CWHyOa2UUmCT8wUBdB59fk6v?=
 =?us-ascii?Q?ENGogxKPIHuu85ogYBTE9jvMEVDWYDziJmuXCMenGsXlYmsxKWq1XSJBN3NZ?=
 =?us-ascii?Q?DGeBSH8IZGOrAsPx+E+sVCe1x8lYUwj/fTWjUf4veLJuxsv+7+2xB8QuT5zP?=
 =?us-ascii?Q?cfJFBUW/suTAx+GT2PRq7clqdGgInVxAZZdQLo9IAPdJEM1ojoPzX085Rllf?=
 =?us-ascii?Q?ZOsYH+KahvjvmB0WOUUecLOHvJ86zDK/542rbML0EklW4hKTlu4B+BguVNd3?=
 =?us-ascii?Q?R8hZgrM1s295bgGYiuvYKfMzuKwByt3HSkXAp5PsNWg1V2SSr5N/LV6xqgx3?=
 =?us-ascii?Q?cB8gCLxOMtt3PAGnz8H7lPcDjBLdyDlj8HecIkpqj7JJ79k6BjQqxYWSTgP3?=
 =?us-ascii?Q?+Y5hkJQoit/ZTngfpUlSkyhGci91s2Xt7TXQXqeXSe89I+Iwju08IKp44kuO?=
 =?us-ascii?Q?Oyhc8NytJ0f+pEW3e9qQ52c1sra6p3f2ZjrXwhvqwXPZIUc29DrZsNTiVTLz?=
 =?us-ascii?Q?KnRZTxkTJoYzHto5Eq+M9jY3+y7ltDUzvjCBDct66V0gB9N/q+y7zEwH6C14?=
 =?us-ascii?Q?uetYcdgbhfmxjZbyk3DZ3i/8j86fjeJTjGfNdW2wTVD9ci3mlA/4KNBclJF6?=
 =?us-ascii?Q?1YI7VLU3WFUcEVGwhzQfXTlslIMrGOfJ1b58RZ6VsKI0p7sj4YJeM32kojwt?=
 =?us-ascii?Q?EjisgxImvjUg0GTAZuKzvcAPtCUdS/P0bT0NNCS9Wxjaz9TSyYCjLa1rH6yW?=
 =?us-ascii?Q?eDwixC9sEotsKzB/+wM59+QFJ+idai+Q1NxHNpdanJXOyAOLaUbmw115kmuf?=
 =?us-ascii?Q?9EfebKkg5hWx+K2QWAxhIFEsOE28n3FMNEjdH5LZImRS71oKdW+sV/KMfTvi?=
 =?us-ascii?Q?0Uh2Pnk9VrlbYgVxYfRHby1Jsmd/Iv3ZixFSqgszvz54RwqYouPgAxDAQwa5?=
 =?us-ascii?Q?+BWzdm9Gt1iMhqjd6FWDdjx4gBKpBKu7x8rR61DPLY9jQmQjye/Qe6NW+bv9?=
 =?us-ascii?Q?+OX+Bd13DpnlMNls+HHE2iWoYDxQVNRVxfPxBzH7mO/cye1Zbe2JsLrViZdR?=
 =?us-ascii?Q?LJtzQ4PpNFtylMXjHKuSb8pZzNQnwetGgKQuI2PS/HAGiAoMmz+QUrpWNUXz?=
 =?us-ascii?Q?Ll9uj/dXumCsUMsXeD06ClKfVYDin4EorSu4hX9jg88U9kU4xOv2JMWY0bea?=
 =?us-ascii?Q?aNOcDh1/g7tzYR2Kx11G0e3H/wog506AMiH+P+JlYuuuskwGVigcTr0ecOWJ?=
 =?us-ascii?Q?pZ72FkdZEegMgApIa1qAY5B8PtEiQp+dDF4Dt7ARsvh3aot7ULtRkPDs+/zH?=
 =?us-ascii?Q?FzjNnzSg8imSTXztndJk4qfCcMBTXw7pl6CwedKzSJMr3PSYGJ9QS950Yh4i?=
 =?us-ascii?Q?KbZ70dhEEd/5UQCXyBfRoTaPMHM22QHcEKSvTyk6ll9VhfAgBsGbfS8rReIX?=
 =?us-ascii?Q?qKMj2kAUYr5COImm9v8I9uM1fnvxVQiemP1DA50zuSYDCXdmfWPGpnJfwBNY?=
 =?us-ascii?Q?9oEUgbjIAJEBn36ZfyhHhALpzpofVtojTTFc8HkOzEMt5vNj6kwE?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e024db4d-cf05-4bd0-5c9c-08debace56b2
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 02:27:31.5374
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JELQFNxjQ0wolFnPuUXdogRAili6c9xtgt94uPniQEuTKdeFp6f1VmYpxjHKf0WxRSIF3rVyvCvNiiPGKDcBzoy5lvZpj/SW4XkOR+8Fx8tHYgejd1hmIr7z/qYbqqTW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11158

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/sunxi/sun4i-i2s.c   | 13 +++++++++++++
 sound/soc/sunxi/sun8i-codec.c | 13 +++++++++++++
 2 files changed, 26 insertions(+)

diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
index 40de99a34bc3c..0c4fa028e1db7 100644
--- a/sound/soc/sunxi/sun4i-i2s.c
+++ b/sound/soc/sunxi/sun4i-i2s.c
@@ -1106,6 +1106,17 @@ static int sun4i_i2s_dai_startup(struct snd_pcm_substream *sub, struct snd_soc_d
 					    i2s->variant->pcm_formats);
 }
 
+static const u64 sun4i_i2s_selectable_format =
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
 static const struct snd_soc_dai_ops sun4i_i2s_dai_ops = {
 	.probe		= sun4i_i2s_dai_probe,
 	.startup	= sun4i_i2s_dai_startup,
@@ -1114,6 +1125,8 @@ static const struct snd_soc_dai_ops sun4i_i2s_dai_ops = {
 	.set_sysclk	= sun4i_i2s_set_sysclk,
 	.set_tdm_slot	= sun4i_i2s_set_tdm_slot,
 	.trigger	= sun4i_i2s_trigger,
+	.auto_selectable_formats	= &sun4i_i2s_selectable_format,
+	.num_auto_selectable_formats	= 1,
 };
 
 #define SUN4I_FORMATS_ALL (SNDRV_PCM_FMTBIT_S16_LE | \
diff --git a/sound/soc/sunxi/sun8i-codec.c b/sound/soc/sunxi/sun8i-codec.c
index 6bd42da57ac01..2e4a205e4e565 100644
--- a/sound/soc/sunxi/sun8i-codec.c
+++ b/sound/soc/sunxi/sun8i-codec.c
@@ -688,12 +688,25 @@ static int sun8i_codec_hw_free(struct snd_pcm_substream *substream,
 	return 0;
 }
 
+static const u64 sun8i_codec_selectable_formats =
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
 static const struct snd_soc_dai_ops sun8i_codec_dai_ops = {
 	.set_fmt	= sun8i_codec_set_fmt,
 	.set_tdm_slot	= sun8i_codec_set_tdm_slot,
 	.startup	= sun8i_codec_startup,
 	.hw_params	= sun8i_codec_hw_params,
 	.hw_free	= sun8i_codec_hw_free,
+	.auto_selectable_formats	= &sun8i_codec_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver sun8i_codec_dais[] = {
-- 
2.43.0

