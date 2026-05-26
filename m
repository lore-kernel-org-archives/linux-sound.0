Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011035.outbound.protection.outlook.com [40.107.74.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90B3A281532
	for <linux-sound@vger.kernel.org>; Tue, 26 May 2026 02:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779761899; cv=fail; b=WQmmlp7N6L69JH1utlwFxZxMWUg9woSp5cbLgmTSG/iV1jDmQ/Jkdj7zHzdiH/iQmDpGaFMxVHHffULB+tKobJiZ1WvZgUgEwZmnGVbv0H1oRtK36xV3P6n7RxHtHaNODP1jKT/XJRDGRWJ+GsoJhaOrlSQ9btW49tE9f6651Wk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779761899; c=relaxed/simple;
	bh=0H3ZIhrqzLe2SRcHU1bMqNtn13Iw7Pz5SjUo0i4pU1o=;
	h=Message-ID:To:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=UpBgjfuVnqex9+oUwURINtopMfxQnCrWCGVL7nS8R0Qeu95Dxpfg9/AmOPo10EGQEx5QpibknsiVIEc1Y0x8hKc/GtrVmJ1XE3IJusxdTd7x7Qe9MGlQQyT+n9lU3iCbVItZNHJD0448eEiSdBwQhnl5saRQck4muJYIRiLzuRA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=IJZ6DVZi; arc=fail smtp.client-ip=40.107.74.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="IJZ6DVZi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mbFg0Eq4DBQDmve0WWrCmuFNEKcssDSgeeFUiKQ2dW4bfMiYJrr0kEaOPfp0HUwrc05kahwu5fLs1tYzCa0FVu7FPvhShgjEch2TJT73glkH7eoqJzcfTgeTh/jIFvj+nc475DoEkDlnukLk0yw7QqvRB6n2yWNuw2BX0LfFprIQ00f2V1UPrFlhp/ebZnXry4DNV72Fc2N/YYzjvomSQc9jX6Npu+uOoAFtrhM13R0+qeGbiWCg8YRZpzpT0fQSLl7SLs2DEL4PAaNKot6qLn6P4KZUBi6DWOOk/8d9DnMn3M2zgx3eslKcLuJZ/6BFyRn0Q2pob6frcNyex/WlrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gRqwxyDhQ9ocLWp5VBS6Kz831pk0VBbM4BUWT1zd/qk=;
 b=NSEy2zMsgjlUAWRaDh1FpyMil4a4jdp5KEw/zDufwDh6kW4nuvpbtt1CIxHpKiEErRUppNxlYg7lwXsGX7qO0HKKYdVUn//exhTmrg4i9KOWnzl9itAhYvikbjQFCOz9svu8yCQIn/q45+TaxuNU2xHW8r7UhGCvI6VBWQCLCr7YV6kfjr+y9bk4G11Q6Fx0gceHP2GTqvf09+NXL7Ai3jjzBsiXqZ8d8htCfmSk/M+/iAQpWU5x/kQaRQyxUtF/QzVpU8VmLyZXswItyEbhvMb82c09vY/djqT1Js/bZ+9P1xakP2H/zrZltnEEaJqND5LUP9O/IcVPeuAZZt6KnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gRqwxyDhQ9ocLWp5VBS6Kz831pk0VBbM4BUWT1zd/qk=;
 b=IJZ6DVZilMiErKxaGCHnn7yn2/JOsBApDolE/XxTmAFLtPN6F6/RF2Z5mLGL0jNO3YUAJ7fdtaWvPTMl24KceRRfEozN4Qk9MIJ8BJH1lCGRhh60n2iXQKdx+5NYJGtrysed31ctX60253L9HJcqUFDpTm5ihn7YBZqXR6L/JEU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OS7PR01MB11916.jpnprd01.prod.outlook.com (2603:1096:604:236::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Tue, 26 May
 2026 02:18:14 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0048.019; Tue, 26 May 2026
 02:18:14 +0000
Message-ID: <87qzmyhq1n.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH 32/83] ASoC: codecs: es*: use .auto_selectable_formats
In-Reply-To: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
References: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 26 May 2026 02:18:12 +0000
X-ClientProxiedBy: TY4P286CA0097.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:369::12) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OS7PR01MB11916:EE_
X-MS-Office365-Filtering-Correlation-Id: c873b596-a82a-4e0e-ce51-08debacd0a5e
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|7416014|38350700014|921020|56012099003|18002099003|22082099003|11063799006|41080700001;
X-Microsoft-Antispam-Message-Info:
	082mrYo6LL38keqBCYOxsWRQHEjvABN3VtrRM4lTt/L6Bq2g2tAgRqmMErCJPs808Q+rUaPYIjYRg42Fv18T0avI9ETs+gbtn3AYWi2tP8grebM5khnXC1zHXywoigo2LHSlhca/KDPF2diNt2wE1qZcV/W/xii+AK0Yw1ljdHpBpRQSYyJW6kdoaPPu9OxagrU+bT/hR651JPRYEqORos5cqpP4JAfKdnMSJJ8s9Y2QSpLw0RH6/uJDrETEhwWEfRlikypFL6EYG50ttFrKZiI8KxJ/6o+kuKGGQsSLb5YWadh0pzr8i9Xe4gy07lk21P/GylTnxeEZCEWLL1kSg3nWzpJccie3T7UnzAdWqsXIwWk/5wSCmuialJ1YfCbET88Wfw3WMYTn5q49o53osbq+Q1xdv3SQLXCkKY9ln3hGHZmkJAh7Ww9Z9RIaTSuBWMYCdXbtszcnUiJY4S8HwYsBiQmylPozWgiQ71Ojqw1qI7qLqPH/2C2j5xztogVsb6C75ide+FRCBtZpX7m46e+qiVPVYZHVlkOUg5RBADxTg4lYWdhqpY7C1bldE0MNHoWdAQDb756G2gxRiN3u7faum+FLr0Ilsbgm9Y+Kk4l+dC2FOAw8YKh2Tl75ppjQlJ+bbGu65myivEidY3aQ8wZZR/nlAQgZSHf6vDrrGd/i5joVw/mkJTcH+0Jmzb6wxCaudcbZr/F62Suqo4KqD2jBMiRGuFDau+IS56AGtEZsdiX0D5WPc/40NFO1sM0zrERSPbnMUL0xrL2m30i7pwvaiIcetdPH4GqJHL7o/Ww=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(7416014)(38350700014)(921020)(56012099003)(18002099003)(22082099003)(11063799006)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WKBeqGW4mE8D03/RJrROwe7H9GzmYTAl1LzFnM3cUngUY78MYqCL0mB3rjyB?=
 =?us-ascii?Q?LvaqpJWIXglpzBcljcA1A4XW+e0TmZu3sFkuNKVjMEGdwMvCD0cpEqJmvSbF?=
 =?us-ascii?Q?Wh+02FUbuqEvXpeTm0K9A0FUhwx/8xJuGZU99GQ5xmQHeUWDX1+Iq6jvpm3T?=
 =?us-ascii?Q?XSbxQdy5noS1YgWmBSloCNDLVIESUSF0jf15bqxEa1jCCB3DMkFUfxo4uvIV?=
 =?us-ascii?Q?6PMNOVsJhqJiCJLnajwpKJe0ZMQIKSRCSJpXWN8FZpToJPSuklGVQGExI3wa?=
 =?us-ascii?Q?PcXk6aoSGF1euIKOsRvbzjVMX/020MnFJ1zCipFyZtSh+fK4FYpAFI5ffyCR?=
 =?us-ascii?Q?VYNSyMah93mwazwb+y4Cn+RUtobDQVYegqevSOcGflGxneteXzxzz0YhLXqV?=
 =?us-ascii?Q?VeFscRUL3wEForBMNuFScprX8Qmd8Z6ShsHHMU+zg61v+Ju1BYdhjUMmmqNc?=
 =?us-ascii?Q?fFGcmBt29yecENDnrms1GSaMQBKMCCCXhNFsNx6HcJo+4oHd9aT2sjOfca/y?=
 =?us-ascii?Q?DZwhW3CFWMX1WYukRNkSJWCV1IoBGPPfC9Zn6VKzXHjqXbVinfAbFg7FrrcS?=
 =?us-ascii?Q?+r22pcxt37w9WCGuLxuKDdJWFzw+45bvhn9BCpJAZZu6yYThqdyYLjXxyGct?=
 =?us-ascii?Q?xd/QLNEsUR7D+6VbVxpMMsxjVRCx1dNQAu4g0ohBoceUUUBri+1GN086l9FN?=
 =?us-ascii?Q?EzlnXS5FgFSz9zvZJUwNyRka9JsICPEYLDsCT9V99gJoTJ+4yxaZgPkfNzlV?=
 =?us-ascii?Q?+/C1y0n4C/HTZFIOJxbhOKzWrS5dW1D23ds9T3tLY5988KJxJ85x/t/tizso?=
 =?us-ascii?Q?IPwRMygkIV570VnRBD7AdAa+JYXMZ5r6A0VDXe6xX0gyl5cYp5VYNigwWouI?=
 =?us-ascii?Q?tPCuK2ki3DnB8XHxov4OOjWb6IY7vx+Bux6ERboDm8SPt5eKsczvkd3k0dTF?=
 =?us-ascii?Q?+WxtR03+RaDQJpYm42AQzuPGjDGMNOG2Q3Aq4vNVq2uhoasw72kslnWyOX5o?=
 =?us-ascii?Q?CDCQuKKgqosH/QxfJBuI+k8/G6lO0f2+AJSg9QJmDewdT3pMEG2vThWb60Jb?=
 =?us-ascii?Q?3zrLrC9gZTdlgdUjWAxnfjOjeIqL/V03nBuzdz0a1LQI5lOWAr1uW4tBdu1x?=
 =?us-ascii?Q?/mv8gf1ArZcF6WJdl7sxLHha/9p0ZAq/T00N1LtqqpLrYqycgpuJaqam1b1f?=
 =?us-ascii?Q?R+w6sgT1nCRcYg5pPu11sf1AiR+6UW4Y6n4O31tq6DuejtREi3qSjjIcfeF2?=
 =?us-ascii?Q?ES/6jy2vQRfBdRUjTE5AWg+z6E/RCWxOKQuenwVW4jLYLJAJGZuq8ed3xVFj?=
 =?us-ascii?Q?Zz4gUuFLQUWBWkfb9q+T/YJD+qORBfmSVbvgt2xbQlT5r2toPKkuX0PDZClx?=
 =?us-ascii?Q?yDryxmiZSiH3vM6rS6LUhnT6Le5yR5Dz4l69M4o7BRI8lkxP0x+zTdLYLKmj?=
 =?us-ascii?Q?LPnkhm2mrT3CqiTLgr3mvwLMxwOvnXasRgOgAXdzWkecaiVHWiWryyRfNZ1u?=
 =?us-ascii?Q?FK6bx9HTlXYnbuJSOQbYE9yRBp90R+sWa7EBgbnmPbsfUP+7wxr6DR6FbHi2?=
 =?us-ascii?Q?XyVrBzhcTSwhMjBbEhOZKY5PjTgAav7ztdqGi05pnplKMHQFLPFRjIWJ94lC?=
 =?us-ascii?Q?RRZHlvnJhJbQpKBplob0J2D8wHCO+UYeuiXRz2GG2cp+/z1WjroN6z/a3dJ5?=
 =?us-ascii?Q?rTHrFnJaus4A+DcnnXmbxW8k7Ss0P1urQtpKXOvjo3sHVECW31W1aaybjXH6?=
 =?us-ascii?Q?rEElH41RdV6E0FcmRyvTz6q1idskYUs7mYtrRErGQG0NwFiFKCYX?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c873b596-a82a-4e0e-ce51-08debacd0a5e
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 02:18:13.9907
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WbYSRtFl8aNruW0WTugc1tHlll680KIEHmTpMB8EFd5M0qfjgM6OuZkxdAU6EGEJAsZ/v8LxCzfNsOxKQBWQ1KTBuPfT5AHGhEHUe1L29Fs+Of3vFjan6AIXxpPCB0qV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB11916

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/es7134.c |  6 ++++++
 sound/soc/codecs/es7241.c |  7 +++++++
 sound/soc/codecs/es8311.c | 19 +++++++++++++++++++
 sound/soc/codecs/es8316.c |  9 +++++++++
 sound/soc/codecs/es8323.c | 13 +++++++++++++
 sound/soc/codecs/es8326.c |  9 +++++++++
 sound/soc/codecs/es8328.c |  7 +++++++
 sound/soc/codecs/es8375.c | 12 ++++++++++++
 sound/soc/codecs/es8389.c |  9 +++++++++
 9 files changed, 91 insertions(+)

diff --git a/sound/soc/codecs/es7134.c b/sound/soc/codecs/es7134.c
index 441df1523f1c9..e3e6142ca0288 100644
--- a/sound/soc/codecs/es7134.c
+++ b/sound/soc/codecs/es7134.c
@@ -130,10 +130,16 @@ static int es7134_component_probe(struct snd_soc_component *c)
 	return 0;
 }
 
+static const u64 es7134_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF;
+
 static const struct snd_soc_dai_ops es7134_dai_ops = {
 	.set_fmt	= es7134_set_fmt,
 	.hw_params	= es7134_hw_params,
 	.set_sysclk	= es7134_set_sysclk,
+	.auto_selectable_formats	= &es7134_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver es7134_dai = {
diff --git a/sound/soc/codecs/es7241.c b/sound/soc/codecs/es7241.c
index 339553cfbb48e..a0bd5386387d4 100644
--- a/sound/soc/codecs/es7241.c
+++ b/sound/soc/codecs/es7241.c
@@ -152,10 +152,17 @@ static int es7241_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	return 0;
 }
 
+static const u64 es7241_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF;
+
 static const struct snd_soc_dai_ops es7241_dai_ops = {
 	.set_fmt	= es7241_set_fmt,
 	.hw_params	= es7241_hw_params,
 	.set_sysclk	= es7241_set_sysclk,
+	.auto_selectable_formats	= &es7241_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver es7241_dai = {
diff --git a/sound/soc/codecs/es8311.c b/sound/soc/codecs/es8311.c
index 6fe3ae41afbd5..b08dceada65bd 100644
--- a/sound/soc/codecs/es8311.c
+++ b/sound/soc/codecs/es8311.c
@@ -800,12 +800,31 @@ static int es8311_set_bias_level(struct snd_soc_component *component,
 	return 0;
 }
 
+static const u64 es8311_selectable_formats[] =
+{
+	/* Hi Priority */
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF,
+	/* Low Priority */
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF,
+};
+
 static const struct snd_soc_dai_ops es8311_dai_ops = {
 	.startup = es8311_startup,
 	.hw_params = es8311_hw_params,
 	.mute_stream = es8311_mute,
 	.set_sysclk = es8311_set_sysclk,
 	.set_fmt = es8311_set_dai_fmt,
+	.auto_selectable_formats = es8311_selectable_formats,
+	.num_auto_selectable_formats = ARRAY_SIZE(es8311_selectable_formats),
 	.no_capture_mute = 1,
 };
 
diff --git a/sound/soc/codecs/es8316.c b/sound/soc/codecs/es8316.c
index 6a428387e4964..39a78216df249 100644
--- a/sound/soc/codecs/es8316.c
+++ b/sound/soc/codecs/es8316.c
@@ -558,12 +558,21 @@ static int es8316_mute(struct snd_soc_dai *dai, int mute, int direction)
 #define ES8316_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE | \
 			SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S32_LE)
 
+static const u64 es8316_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops es8316_ops = {
 	.startup = es8316_pcm_startup,
 	.hw_params = es8316_pcm_hw_params,
 	.set_fmt = es8316_set_dai_fmt,
 	.set_sysclk = es8316_set_dai_sysclk,
 	.mute_stream = es8316_mute,
+	.auto_selectable_formats = &es8316_selectable_formats,
+	.num_auto_selectable_formats = 1,
 	.no_capture_mute = 1,
 };
 
diff --git a/sound/soc/codecs/es8323.c b/sound/soc/codecs/es8323.c
index d067f7bda03a6..c817bcf32b36f 100644
--- a/sound/soc/codecs/es8323.c
+++ b/sound/soc/codecs/es8323.c
@@ -623,12 +623,25 @@ static int es8323_mute_stream(struct snd_soc_dai *dai, int mute, int stream)
 					     mute ? ES8323_DACCONTROL3_DACMUTE : 0);
 }
 
+static const u64 es8323_selectable_formats =
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
 static const struct snd_soc_dai_ops es8323_ops = {
 	.startup	= es8323_pcm_startup,
 	.hw_params	= es8323_pcm_hw_params,
 	.set_fmt	= es8323_set_dai_fmt,
 	.set_sysclk	= es8323_set_dai_sysclk,
 	.mute_stream	= es8323_mute_stream,
+	.auto_selectable_formats	= &es8323_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 #define ES8323_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE |\
diff --git a/sound/soc/codecs/es8326.c b/sound/soc/codecs/es8326.c
index a79b2da350998..572dd240b5fe4 100644
--- a/sound/soc/codecs/es8326.c
+++ b/sound/soc/codecs/es8326.c
@@ -722,11 +722,20 @@ static int es8326_set_bias_level(struct snd_soc_component *codec,
 #define es8326_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE |\
 	SNDRV_PCM_FMTBIT_S24_LE)
 
+static const u64 es8326_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B;
+
 static const struct snd_soc_dai_ops es8326_ops = {
 	.hw_params = es8326_pcm_hw_params,
 	.set_fmt = es8326_set_dai_fmt,
 	.set_sysclk = es8326_set_dai_sysclk,
 	.mute_stream = es8326_mute,
+	.auto_selectable_formats = &es8326_selectable_formats,
+	.num_auto_selectable_formats = 1,
 	.no_capture_mute = 0,
 };
 
diff --git a/sound/soc/codecs/es8328.c b/sound/soc/codecs/es8328.c
index 9838fe42cb6fc..98b6767d86def 100644
--- a/sound/soc/codecs/es8328.c
+++ b/sound/soc/codecs/es8328.c
@@ -722,12 +722,19 @@ static int es8328_set_bias_level(struct snd_soc_component *component,
 	return 0;
 }
 
+static const u64 es8328_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J;
+
 static const struct snd_soc_dai_ops es8328_dai_ops = {
 	.startup	= es8328_startup,
 	.hw_params	= es8328_hw_params,
 	.mute_stream	= es8328_mute,
 	.set_sysclk	= es8328_set_sysclk,
 	.set_fmt	= es8328_set_dai_fmt,
+	.auto_selectable_formats	= &es8328_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 	.no_capture_mute = 1,
 };
 
diff --git a/sound/soc/codecs/es8375.c b/sound/soc/codecs/es8375.c
index e8747bc24433f..bc21cf7e602d6 100644
--- a/sound/soc/codecs/es8375.c
+++ b/sound/soc/codecs/es8375.c
@@ -494,11 +494,23 @@ static int es8375_mute(struct snd_soc_dai *dai, int mute, int stream)
 #define es8375_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE |\
 		SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S24_3LE | SNDRV_PCM_FMTBIT_S32_LE)
 
+static const u64 es8375_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops es8375_ops = {
 	.hw_params = es8375_hw_params,
 	.mute_stream = es8375_mute,
 	.set_sysclk = es8375_set_sysclk,
 	.set_fmt = es8375_set_dai_fmt,
+	.auto_selectable_formats = &es8375_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static struct snd_soc_dai_driver es8375_dai = {
diff --git a/sound/soc/codecs/es8389.c b/sound/soc/codecs/es8389.c
index 3484c87853cb4..d2a3ddeb4be83 100644
--- a/sound/soc/codecs/es8389.c
+++ b/sound/soc/codecs/es8389.c
@@ -736,12 +736,21 @@ static int es8389_mute(struct snd_soc_dai *dai, int mute, int direction)
 #define es8389_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE |\
 		SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S24_3LE | SNDRV_PCM_FMTBIT_S32_LE)
 
+static const u64 es8389_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B;
+
 static const struct snd_soc_dai_ops es8389_ops = {
 	.hw_params = es8389_pcm_hw_params,
 	.set_fmt = es8389_set_dai_fmt,
 	.set_sysclk = es8389_set_dai_sysclk,
 	.set_tdm_slot = es8389_set_tdm_slot,
 	.mute_stream = es8389_mute,
+	.auto_selectable_formats = &es8389_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static struct snd_soc_dai_driver es8389_dai = {
-- 
2.43.0

