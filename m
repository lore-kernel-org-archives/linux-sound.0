Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011023.outbound.protection.outlook.com [52.101.125.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A7B91AAE28
	for <linux-sound@vger.kernel.org>; Tue, 26 May 2026 02:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779761629; cv=fail; b=SU+cZ6KLNsbCDkc4TemCZRkB+ZbQrQFhOW/kBkZR6wtYcHKgqaE0GIRUCE+qaq1ug56ZsmzkSQHndyLuVNV1UD0cAqjHn8D4HA/oGiod0cwG73AkuZHC+tiB2+p3rw+UDmaOcXvE32BHAPs770q0+OHne3AFbCvWVHLJesysIRo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779761629; c=relaxed/simple;
	bh=I1optUbiFAnPc3Tt0srqdJGtEhhV2zqOLkJOc7pkYis=;
	h=Message-ID:To:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=dueuWCkvldKXCXAk5ymsb+KyM1whfs6GW/nacQrVP6kp4kqF/ACk0BCVepyfW4tMDgmSKUog9oB+59dDi1LNUT9OnqAmXJAbVnRa9kvaMwni41dmtF+tWc+QdCwllXSj9RmhblCsEbljdbTtq/6lbMqm51eF0GruYHA4beIMm34=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=jWVGDYaN; arc=fail smtp.client-ip=52.101.125.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="jWVGDYaN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kz5WRo3IVdormLeWTW/S/nCye2wUDoS3BKWl97mfiTY0NQFxphqpVvUSU6h2tuBUtg5YQ97S6wQKc25maHM16pokkTvw710TvBv4208iSV5TWlZlMFZp8D2baJIbpX+jMfv7/QSf6FDln+bNry9c7m5TGwLub8kU5A0JwTbSMI97K1CZnElggcBwFW2aHNK+F/ou+zZHcjA3r8CfMr2UdnXtB9lJFl1F/6CiPNRuLj9ZK2Evi8m6j2rnDaStAotcz7YN76XbYaFCbWo/AxnfTIJ0uUiNbio5xF/N4bvWxwk3y6N0+Ys/kKAVoOnwdgp3dnGjN+oPjgv1jdeMJcU7UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1gfRHYH1nubmEtNnZmUq1OgnAvYYFS3nafZZW8YU2Mk=;
 b=UMbO47PLoioheb58yjRJImzwUQ7qiv9T9dcSfM+04fwBPJ3mvgBAHQFFyRpwpKSbMCmEq8IS9c9rU1r3Wbq4O8+jcy3uenmOfY/b1yCXII9yalONCXptJ4h56iEd7UCYEHZjDok+MRg1GLYobrxAugxgmox+JJfZ85vStITllIh3k5Tq2HL6jo5cJfjrZ81okuyafCHrncnKMEYPma/eoBTPzY+gpSaqUTfSuypG/PlXG4wVkcn08X88AIt8PRQDoF5lttovU0RbkVQk41cUjRNnnhL/EYAQ9+chRaHpaMKCOvgYayBAyDHDsOsVFF1P2Mr106e1/2fffHr6XrX/QQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1gfRHYH1nubmEtNnZmUq1OgnAvYYFS3nafZZW8YU2Mk=;
 b=jWVGDYaN4ZODusyiM0LVijgFWLQ3DG3t7u857WE7oekk4NUdSAcoSixSmbfve6246oRoroo4FWKwM/tYB2vVJ5bNVWzAfoD3pbVyWGAjlLJ4NUInsE2Kdqph90RkmyFQRY2IEEQN0IwU/w4ywD8SNZBRrxD1bLwmayDqJe4chP0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TY4PR01MB14087.jpnprd01.prod.outlook.com (2603:1096:405:208::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Tue, 26 May
 2026 02:13:41 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0048.019; Tue, 26 May 2026
 02:13:41 +0000
Message-ID: <8733zej4to.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH 24/83] ASoC: codecs: arizona: use .auto_selectable_formats
In-Reply-To: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
References: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 26 May 2026 02:13:40 +0000
X-ClientProxiedBy: TYCP286CA0008.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:26c::15) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TY4PR01MB14087:EE_
X-MS-Office365-Filtering-Correlation-Id: f4f2340b-1aa0-49a3-2e5b-08debacc67b8
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|52116014|11063799006|56012099003|18002099003|22082099003|38350700014|921020|41080700001;
X-Microsoft-Antispam-Message-Info:
	lTk3j4iExOuJtzvzdBN4PP4IcFZ9Rcw6eMNwglGCTlWT/p6oQHkRGke/m7J2r/nAXnPwlssmjYfL6UcdcJczu2eJnW7VVYjpxF1ux6IMGQHUWnesTpy4FZpH5SMbpbQWerrY2W+jzyfu78u7FgBg4qFh+pqpoDCEevpn9B2hj3FHsxNdZ6GEhDg7L/5FxF1bv5tAvK2Qak+03IempQGdXZc7Q9OG1gkhYiOOkq12JQBPQ9aKsn/j5fjTwR4jBAY5MFVY4DjlnTUYL7ns3Oz1Bo0EOo06b+BMEms6Tcbx5nD+aHM4ivN2UTc2InOueTMX6Yic+PwzzpWMRF+tQfAgEn/ZxGBvn84d89RdtHufv36DXkuiTcSkmH6HD09Rbk1WpJIqroYJQoU2+BmfGk/imvl3h/MSu9tbau6sme3bK9d7DXruw5vmTq8wOxatQ+gCQ7XExTsV2pZskGYQ3ehQxMRzieBh24ttxE1xPPkacc4/cpxUnZbMKlE2FFjSFMSbrvHxtqJ/utf0vCiVS3mlxKXbv5F3WBWB/BXs/lUtUWRReB5E5yUccG1vT0Q9uAT5X2GVxZHTckfCpMjYCwGWCUqjFJ8MqGP3apxis5CIMWycPix3CrXHKcMqrCRdQbfXyDPZY/3z12uSNrWHqFiotCw5BB+CRyhi3Mk19A4LBt6hKV0CJzyIXnaKfZqLyubOuqVqZic0SLBg459cqRewWxwyKQyvggDr1Hnrq3NOhDuu96Gai05dVvjzOSit2W4rLlUbDjATvEVgT9gYB6Xr4wOHbU0YR3X0DHKA+c9FwpM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(52116014)(11063799006)(56012099003)(18002099003)(22082099003)(38350700014)(921020)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?R9nYpoNKJlFqeehbijutIqG2wiYzB/XEDXGERyLy3TokA2PhCEkw2EO5fT00?=
 =?us-ascii?Q?07ijJBWRQ86dQuK2j99AvZ/65+lvPeSXaANO3Gaa9fNea3GGj4zhfIoDNK6t?=
 =?us-ascii?Q?2807R35XaHU2SKTaxaCSIb82LQp9RLd+D77Kq6OIMmpMaOsw/RGxnI6XxEop?=
 =?us-ascii?Q?UYneKbKAXP//TqYHYVY0/SAyZ/RLyqNa8YwbJtY7siymIzRSl5X5OJuyxepd?=
 =?us-ascii?Q?qOHCAfdcKrhSmfD9noasgqRR6+4t4+JH2zQm3inkUMlx36yykMxp/9JVqWH2?=
 =?us-ascii?Q?KU83JfPXlJO+Eu3yu+++VXJ5llewLPKhJMvEj8GiSlox1+W8FxxEWbhX94IL?=
 =?us-ascii?Q?qxoMCk63Tx2klAQFamjDQf+jNI8b4UR/vdza7/rW+CaszGUgDr1hWVx++ZUV?=
 =?us-ascii?Q?oM+sN2xt8bj5UBBWL3UHDR5bms7BaHU4npky2pQMjG42qSn9sXn/lWGIjvUW?=
 =?us-ascii?Q?h+WjexIGwMJFIZ3t5AY9nkIEbfc0hhyg8EgZ4q5FdCaWStXQ/HnYb7tUnMsi?=
 =?us-ascii?Q?rxiQM9h9Dhf5guEo74PG+zDvD3rBt1yCB5tWX41q8lSynhnGEvHa5uZ+Ja+q?=
 =?us-ascii?Q?/5POlKJP6wgTRWKyLHJMoC0VmI49QerJbfyyZm8j1C6zpRhRAHMii9zNyWmt?=
 =?us-ascii?Q?w57PP5lp7aihcoSbE8BlCOEPulrBk0Y0dwv8/vwFSRLezgJS134pjg4Oct/A?=
 =?us-ascii?Q?53DaYY5PkfjleXp8jjvZG8Rl9BPocPnaqFJ04y0Gmc/GFAzB33u2EPBtFC1C?=
 =?us-ascii?Q?CzQ7UAYwzcKtm2Ab5MdgZQnbGqQOP3Lgbyu8Dx3gnlWcKivmPLbmFF/kuEcE?=
 =?us-ascii?Q?0jgEOeR2UaFbwRD+OGtTAwmlLF91Sz/4rOWWAejD/FbCcJDN92pEYDE7lFQl?=
 =?us-ascii?Q?3f8K+HcSDTEy38/AgD6YzSZpyS19auzbSii0adW3PLVWfEvT/mxxpfY7SmSC?=
 =?us-ascii?Q?LnBeif20jDphP8nOSlreS7u2Qdg7uHzZRk0tt7zelzLX223zfI15XW8MTB7B?=
 =?us-ascii?Q?ivL9oszO8ThntedfmAfAz+w6Cf842h4nJzgV6b/00pYkfNA+ogWt07zGXtPB?=
 =?us-ascii?Q?9KcKwc2bDAiv8jD9wyJe+rsvZbh1yiGLw5Khrraj9XbfqQAdDHfhfWBlsjv+?=
 =?us-ascii?Q?HooMPHoodGAFnEWu5cvCIOUBZofmcjXKHhU03W/Ca+oYHe/uECN7BPi4dneW?=
 =?us-ascii?Q?ejX8h+s1GsHOihxNiiT/6/2VsERHphJpB1AyuHeppAyWAXYIQv1AvLX+f1iB?=
 =?us-ascii?Q?voJ602A33AKPkomXq8FbD06DOEC5On1KMxaIXRGuon7Id+xVSaTpkE/iOioy?=
 =?us-ascii?Q?vA0+xxOrEwsaabun6BAyVBRvzLlw2XrbXjJ5nF5GGl8NMWPCHIE/IAC5k+cW?=
 =?us-ascii?Q?nxOgDNW9aAG7bbOpiD4J4lgNgB27ngDstSQSMGSHSNqW+7VOKIursW8/4V1b?=
 =?us-ascii?Q?ck9mG+QVapUC7SJJBq8TphWKu25DFRhxeP+mojyX+Kd3keo00QO7XBkGtOIT?=
 =?us-ascii?Q?EZ0MdDHhjotA2cALOSwS9PRN55E4iqDs8o3KB6dw+fkJ5cHxGSF66FOzXKAJ?=
 =?us-ascii?Q?zQB8T64IYo4k786y2STbpADA0PbStkPHQK0ZbJcvxcrZeVAXxt67PjqKYlwr?=
 =?us-ascii?Q?Izp8jVqYeFRhUFO7AciA2BLmI1BcY8IOGvsgiEQjusDdPgxtN/YZ2EpoguMU?=
 =?us-ascii?Q?3phL2QvD6VVlEjvx3Sdz3tM80t9xcvMOuRVf1ZoUy2Ky4ioUjqnL6aTw/XSX?=
 =?us-ascii?Q?kqx893+Oy0qR5jLTP5it1WxM6vtfn0XZv20ZDgChiuruocQPWbJK?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4f2340b-1aa0-49a3-2e5b-08debacc67b8
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 02:13:41.1013
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kyIroOsYYpzKf4kUyb3e/KhfehNirprX2JEbJk6yBgRYFlHh2/bSoOEWqeCzk/LQTuBPOw44KixoBD2Ko9+u0bGVl2JjyCAPErFQhE6ZcpzRaD9Yvqr0wnJB0BYcwbzX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB14087

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/arizona.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/sound/soc/codecs/arizona.c b/sound/soc/codecs/arizona.c
index 8c683b0bb74c4..93eecd97d5837 100644
--- a/sound/soc/codecs/arizona.c
+++ b/sound/soc/codecs/arizona.c
@@ -2020,6 +2020,16 @@ static int arizona_set_tdm_slot(struct snd_soc_dai *dai, unsigned int tx_mask,
 	return 0;
 }
 
+static const u64 arizona_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 const struct snd_soc_dai_ops arizona_dai_ops = {
 	.startup = arizona_startup,
 	.set_fmt = arizona_set_fmt,
@@ -2027,6 +2037,8 @@ const struct snd_soc_dai_ops arizona_dai_ops = {
 	.hw_params = arizona_hw_params,
 	.set_sysclk = arizona_dai_set_sysclk,
 	.set_tristate = arizona_set_tristate,
+	.auto_selectable_formats = &arizona_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 EXPORT_SYMBOL_GPL(arizona_dai_ops);
 
-- 
2.43.0

