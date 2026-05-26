Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011023.outbound.protection.outlook.com [40.107.74.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DC32287259
	for <linux-sound@vger.kernel.org>; Tue, 26 May 2026 02:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779761943; cv=fail; b=sk+2w36pr3WqeUgDY0tijlvTrY56yEMXrJqYZbd/qs3KpOiShCi12YLGo0NoSp8sar1xZADqYg52j6Q3SFZ0bx23n6FHnNCbSxOl0v8xBq6KAd7jLeombnaUf2s39hrEcYBWmsRnKuCzYBz+5jU0MkznO3y6WkwpJOUjSpcIsTI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779761943; c=relaxed/simple;
	bh=LgF35Y7RVbfmEVAil+yRdLREae+L5lvU/oNo4EYh3Vk=;
	h=Message-ID:To:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=ppKdgFZToit1EOyhBtkhXkGPKYxWV7H0hg9uZt0ilx59shdr45d9gRfORoDJ9eNIPXwl/8fWqTwpCnVrN5CpJit/xdsc74eY+PzJ2Phez+mePR1gCohZoY94gcN57OFr57NYiJuo50bYWKahDrjOqCGkK8+TZpsyY9/XNCE4W9g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=ai2LhJ4f; arc=fail smtp.client-ip=40.107.74.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="ai2LhJ4f"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XNNitfiPOav0sr5ri4xbDDV7THv/b8E95zBoZJyI34Dnn27Q5op5//YgPF2ln8ZtpmyEpnSUcYmySMRluLPLYvjWoGJJXQE/oEsk4LVRAmJ/hKEeZqQtn/cHVJOLdVc6UUyuWksrfReb2QA1axJFnCkwGKwHqoYTjhwpr1FKhcLqYT8URskKZMkj4o5ztJg5BOTB5ofwXRlgfUWv3tG6K2nmz2qMKhQjMr6OgU6Ot2fsrk1kiSe/LOcXA/a+FaLTIHxPidt1jFcTN+peoxpEdcRO3IP/AHvONWgY0kzNhReKkproMoVzF5hpgSsijZuVg+SzYT1hHe4FDy7Pcq82iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5DbPdf566GT6Z6pbz0wDEWPWA1faoG/1fDVrT2ZbMwk=;
 b=bFwiJPv6NwKMBT7PIAFvYhhkRgcI/Q1oUVtAO9z+dImRhYM2/Y8UVCDm3dTEpcm1rbAlonZhEH3SToI/hNIffXR+x/gcgRiva0hk+pYZPE8WWr2U3ekHzJTnVQA6WsgB3mFkcHavI3HOXc9t+azsuIy/DHizApiAKIe55b0uFbcEZqQstrg6TtaK7u787X+1EB+Z8sN4mlLHky5jXc9cR2s8RLpVy0fsTTmYkcuHk9/HfHXJ0mXL1C+GyRon8KB1k/unnPdN7H2NtdksxC8Eor4+nFXktMm+jlPDIJQQ29zeaBjcfvdefFKEKHJNfLOtQYvieq4Pii7yMB3w0yJSkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5DbPdf566GT6Z6pbz0wDEWPWA1faoG/1fDVrT2ZbMwk=;
 b=ai2LhJ4fk+kO6WI7y5j4GkHKB3Gzm0ODwmPKXcSZ+J9E2w5DtwguNo8N//uyv++8GwRGMRaGu5e5qgKobA3J1eVVLjVkunUA7ZsMyHqTaKtowCFrgtzEDDIoD92SWLmPKiWnYpiEs9B0aCGiVJHAUn69mnukebHPWVVaE26l19E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OS7PR01MB11916.jpnprd01.prod.outlook.com (2603:1096:604:236::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Tue, 26 May
 2026 02:18:58 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0048.019; Tue, 26 May 2026
 02:18:58 +0000
Message-ID: <87ldd6hq0e.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH 36/83] ASoC: codecs: lochnagar-sc: use .auto_selectable_formats
In-Reply-To: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
References: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 26 May 2026 02:18:57 +0000
X-ClientProxiedBy: TYCP286CA0295.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c8::10) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OS7PR01MB11916:EE_
X-MS-Office365-Filtering-Correlation-Id: 29fe26e3-06c5-435b-0744-08debacd2515
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|7416014|38350700014|921020|56012099003|18002099003|22082099003|11063799006|41080700001;
X-Microsoft-Antispam-Message-Info:
	Pm7B31VxI/llAp7vooA7tRoEoUJsc3BcYSQTRC4l0kMn/BLU7HHtSc4Y4dXznaQx+knAPDWfplBYqXWFS82/twhkEvxZjl+Qj6dh4z8NwC6rSbyUPG/5yUMLTXCJ83kM3kTBtnYNJ5NotGRWL9X+2dMHDsOhU8l/4dkX4uIbbOoTqfhqKtvd0nEfXzXdqy6RSKIb3rhNf0uLwoNNZOfZUWz/Fjf6lOLnc5rhBsYCdaLUiO3RLBxD5mI4qh375iFv46xee63SwtQub80gRnJps57OexjIoZA/PgiQrCPU9AYEim+dTMVf+iKHKVT7ddokd3osXOIbn4V/F7zogD7g7fhmVGe7/RG0MPTxRi0wzaTCvTDAcLXvusPLS5qOEnyn+oWrlCmWwg4FPxx9Uzxdn9Cl7jZ+qyb5Q/RvPKNk9JCnmlGHe298Z17ZVjrD+83JxVj0zm8cFa6BOK8itQuteo8S4nPsqCZ5BTCwQJIWEAc0CbzKu6zOiPNq9H1vMbmRZkfVbX0JGojIF4XDNb9nE2QYJxq97oydm0NJX43p5kWVRkpHGMWQyXLSrsfGYCRqONlL9JW9oB90yUICXJvdbTczWvcuBun1Uat1c+iYrCBeLKeYKTmVY7ZjlBZiWVWaQbA8JGWItZc7Mlhd4eVIgpgQzlBtMKH9zl+Bs20ICW2UMOIKdMtR/vCOrTGIwH81C+KVCiUzXK2ajg/v3FZO6qY15/IP6gvJcI/CQnKFfHeKm/9wAka1QaGfl93S9cIf9QVMP+2zuU4dkn92DpyUvfzwzrPAdUME1pR4rVVhzgA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(7416014)(38350700014)(921020)(56012099003)(18002099003)(22082099003)(11063799006)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?m+5b4qhdL+z6S4nO7qmQKK5yCfAx9dVfxdDtCqObrL3LSPCXw3YpMMHBfuuW?=
 =?us-ascii?Q?1eg37u7OTyOuVy/BBfFYmOm/2X01bxSCMAI5CTOv8jralDleZl+tYB3/hoDE?=
 =?us-ascii?Q?03p16omfuK6B4s461yI2iEc95wnlmt/H6cY+Yp4C157JebbPIl9JvFYyDQYR?=
 =?us-ascii?Q?1FVG2ePLfC7wP1kZCy98F9iydddGRt32DNSEynm43E463wpJTTY5mlEZSAJq?=
 =?us-ascii?Q?sPxE18RsSWGoqDqO9ahwIVzaVMgoqd/bkZbC1OtvpO1yJRtb862wNXjYOUvv?=
 =?us-ascii?Q?5LEUNS172lSPnrZwS0kN8soRGQ5XkrMeBMlOYisTTAKlf/kAvYN8dG5ElNsL?=
 =?us-ascii?Q?fMWDWScVx07i9Y89XHch3kU+Qz5jiFlsIHqiZlY1DGOg+XvHe8UmFLOxYYm0?=
 =?us-ascii?Q?QdRJxlV8ZYanFz/wK4rgf3pifjP/aO2wGs3VIERIixh1oXQevQGqmqzqpD8D?=
 =?us-ascii?Q?qw/WXmAOYQHnDd1iIg5XX7YFurTlEpInsYAllE8aJtvdl0h1E7MdcdPc37BV?=
 =?us-ascii?Q?ChrIis42asaMp9ASf8pb/6en4JsjVoZDGFTjATSe5zwQ7vYe0UBptoUZBiQO?=
 =?us-ascii?Q?EYN3JlKq6cv7S7/dXZnnY7+BQODBB+//YMjoAq1VwokLsU843V+KJUR68JtM?=
 =?us-ascii?Q?i8vKxa0TQueVRhB3+IXVv8gyGPqkfuCvTAD/mnuYaM635VXCLc2SZbDGPKqJ?=
 =?us-ascii?Q?73fNtFIw1qyuX/MHIgnyeBNpg+AUwjDQAMkqEej9DH1J+4zRSCJ2VMm5+aBS?=
 =?us-ascii?Q?PCSZ60OD1vhLhIH+LC1keh4b4HGvMSGN7S/XNFvoaJKA1Besw/v7IpiX/K1Q?=
 =?us-ascii?Q?BL1NR64ImuwTMqPUyNK9l9UHHDLiKhQ15NOEPY8yr9UqzfS4VKHrzsbUayMI?=
 =?us-ascii?Q?KuavKWp2c8HXbaCfUMYCEqCCtEfEMDxo8THUToN3KEc/Gx43ngAZPWcLII/y?=
 =?us-ascii?Q?aBlzpcEMDJEZxDYbCVUXaE3qSEU/ggsbNB7KTU/HVXS3hBWvOktpNr+1OrN5?=
 =?us-ascii?Q?FlFmYjIQHiCTX5ypPRjEBko2dhBBI7nkyRbwbsZ5Mt19EnR2UB7NZOC4gf2M?=
 =?us-ascii?Q?4T7f2gISwKMlyAkC5tUZgjjW12oxaJ5K54RfqtETQXWSiy0avlbzUQeTl7VP?=
 =?us-ascii?Q?WHZ3w0e+Rl0Cw/OesMYlSTKRa+qQWXEAQ0dGfznd58zvFb453boGDlMXE0jv?=
 =?us-ascii?Q?DgFSPyWAnNxi0jMDYP8sZUGmdCLCpc6vGtqQzsJDozBFY3LaAVYlu7lb+ZzZ?=
 =?us-ascii?Q?dVAz863MlB5mtxoQp2JA1yLDfGhoVsIjqyRIP502SM1x3ioVXYz5fkbKbcm6?=
 =?us-ascii?Q?kjr4HQqyDzlyjv+vhb4R5fhLNgV9FhkLwlezvVUdtHQz6l9W69J+iVs/NzaP?=
 =?us-ascii?Q?gqK3nEJeahf5ULedIDWPJumzaot1ZUMFVvf3Cx08yyU668w15phyLu86sbwe?=
 =?us-ascii?Q?5p/4BTBfVdn9RH29rRdryLpfXKMliXz/V/mr8T1GTjlB2t7tFMQjVulPa1jb?=
 =?us-ascii?Q?WpfOgc7VImSlym+auO/htg6ngiyAGO+pl4o77VJu7mlwYVMlJsdkzmI6jB4q?=
 =?us-ascii?Q?O4j0Hx2jjCK+D9oNha/9az5c5q3zKf2yH6XQejEJTdr/hqhj8YXUTsWI/Bus?=
 =?us-ascii?Q?UO+I8VzwO+qRp46EKYNDBrx6ds1h40OILo8j4fTgPEjYc9JUnC6228ekM/dw?=
 =?us-ascii?Q?/ezYKSo/mMcEJAxgr6udi4XT+eDqO8Xh/6l0KnCduyAYGWh9nWf3gsEb79UL?=
 =?us-ascii?Q?aetQ4vtF56h+3k4fOUVDO0xAI8x/MgY0WmAZKXJIIjKoWBwE4GgI?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29fe26e3-06c5-435b-0744-08debacd2515
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 02:18:58.7717
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9sdZOnMkn35H2H5s7HEoN/7ZCtqzdhlgHaEtB7Ia13Mqo8I0xBwR/iVVzpDGa6wO/B6vdM3RDG8pWh0aqBSVfz+4OGcAiqJmALvmzGyOkyKv379tTuzKLA1cov2pD1ow
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB11916

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/lochnagar-sc.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/soc/codecs/lochnagar-sc.c b/sound/soc/codecs/lochnagar-sc.c
index a3d6318c90500..dadb4a6c287fb 100644
--- a/sound/soc/codecs/lochnagar-sc.c
+++ b/sound/soc/codecs/lochnagar-sc.c
@@ -137,15 +137,23 @@ static int lochnagar_sc_set_usb_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	return lochnagar_sc_check_fmt(dai, fmt, SND_SOC_DAIFMT_CBP_CFP);
 }
 
+static const u64 lochnagar_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF;
+
 static const struct snd_soc_dai_ops lochnagar_sc_line_ops = {
 	.startup = lochnagar_sc_line_startup,
 	.shutdown = lochnagar_sc_line_shutdown,
 	.set_fmt = lochnagar_sc_set_line_fmt,
+	.auto_selectable_formats = &lochnagar_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static const struct snd_soc_dai_ops lochnagar_sc_usb_ops = {
 	.startup = lochnagar_sc_startup,
 	.set_fmt = lochnagar_sc_set_usb_fmt,
+	.auto_selectable_formats = &lochnagar_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static struct snd_soc_dai_driver lochnagar_sc_dai[] = {
-- 
2.43.0

