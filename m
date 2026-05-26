Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011008.outbound.protection.outlook.com [52.101.125.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F086930149F
	for <linux-sound@vger.kernel.org>; Tue, 26 May 2026 02:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779762127; cv=fail; b=QningJtZyo9Yo/BAO60qoqxFY5H2RTyqC3Gagkn5cck8mQv4ICFWdQdpk4VbbHFY7Ge4fXp4/dSA26SJtT3/GCclAL1BAlfDFQaaJFyXoWEVWQGJYaL4ECxS6CgiWPbzMdtHqXdcV17VPiWDSWiTBgleDDgthpMd2lWf9TJiDoQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779762127; c=relaxed/simple;
	bh=qN+gKK2EJLHAEk0X6vJ7DRI6nuP4vYPNEC8a/tJUUJg=;
	h=Message-ID:To:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=t9eU2aVkEMhZQb7TNpq0UQi4AQRDr0+NPjXktPrf04BgomtPpjHIKDSZ4ZJUOFRvD2jcy3Wkom5defQjjOttqYFRlRduBq7gepjFzpQO6752/k7+HHn/F2EIHSY6dnafecwNtDCYlW4MyXCgt7+DTKfxm5u0bMIiQFVh7DVN9wU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=nqRDW/XX; arc=fail smtp.client-ip=52.101.125.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="nqRDW/XX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OuBlCdzxP+pZ+utSIbqATckh65SecWQzJTbazOKCT4mexL2uL4bBP3PpiMTwb3TpPvsbvExTjxCETTOgYe/zGo95xyokydOqxZWbNuGrXI4BFRtUrjP2XmPuePr25WFDuqw9jeqngLGAyIf2SqlKQGHv4cpUNFGCa/eH5icdkRKYNhsIcCWI5A0NdJux0UsfiJDRBesvgOKVYIx4Pq094U4cs8K2nOiMPOG5h6f9uxlXKdU3PMwUmys+ArfsYYpzUZDq0ni1yfcLOgWunMBBmGP0qqL2odKRPCAKcEtSyrf5l40FNC3MUkmE7+wefmbFcnTNUi2pRC8iYgCCWIk7pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NR9znkTJLQyWW1aoeZ7fRjNYoFvLcbNBsQtRLqxSOyE=;
 b=JX/HmecURzMH9jFvTumRx0SQDaF+5I2ZWTB+S9HCOM9Awvbzh2450unCuNh/j0nteI/2Z8uYPQWssiA8v9OSLRHKjGdj5pGd+vVQdRr0bJigZ1Iihcdez81RjymZNvPg+x2EXY+zn8crRlBOQZeGQgLRVnuF8AD5KGWilXyz6J/L14ZY6oLE1nVa6Ijo8K2YCscW9+YWmRX8fRVg21yxZEJc990LKAYkokMBVnw1d0Nq6q5/SlMiaPdXn4ElgIa9T09wJwb6V50rlvDFMSKbMyHJ22rZfVpb9uC/YHQY1E7hf6xiOyDJOj17FADEEEjN3fIDL7CXgZIfhT9JRscagA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NR9znkTJLQyWW1aoeZ7fRjNYoFvLcbNBsQtRLqxSOyE=;
 b=nqRDW/XX/NSf6fLdgNiVsDChHP3WMGm3URXk0Dl9zcPALqfHVcMmqM3yLNXHmrXxRR1y3hvhBDkL8bk8Vf2V2BQo2DEIIKvG71D60xlgk/ixrUNZFIH5+O6WqiDcqpO4Z1MnXFz6U4tN7RLdCV1xcSTULY4sDGIZHKqvtC95wRc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TY3PR01MB10158.jpnprd01.prod.outlook.com (2603:1096:400:1d9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Tue, 26 May
 2026 02:22:03 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0048.019; Tue, 26 May 2026
 02:22:03 +0000
Message-ID: <87y0h6gbau.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH 52/83] ASoC: codecs: sta*: use .auto_selectable_formats
In-Reply-To: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
References: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 26 May 2026 02:22:02 +0000
X-ClientProxiedBy: TYCP286CA0317.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3b7::7) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TY3PR01MB10158:EE_
X-MS-Office365-Filtering-Correlation-Id: 88610945-3ace-49d1-cdcc-08debacd92dd
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|7416014|376014|22082099003|18002099003|56012099003|38350700014|921020|11063799006|41080700001;
X-Microsoft-Antispam-Message-Info:
	J5a+H4MeHYiZqcVn2kRkK25K7HuP+87RdzeW3ukUvLVoeMmJeP30BvNV7H9Uu2tbiTWCClduNklaThoZuK50AA1jyYho7wzb+8oGt+AYC3amK3SruQU1GP2dNAM57UkGm6cYR8EJduKEwh6iW3mfwBrcSMmwPFJH71raE+7ENNOMNdrpO2ok4ru7ZeOTnCM8X0ejHh1k3ArTVY3hAIVmKmZ3WfwcKJGG+PrED7L9RV2OUxOev2iFc0xCyYyht0+LEAl8yCDaSegVui3u443MO2ehLiffOukH6KZRgUDoLXY+vCA6nLjumPOH2Y9tfDec0rMtYpJnj0aZrXi6bJFZF0EGm4Me9+GnnT5ksbXZa+zjPwQ5cP66MHfyl8vbm41+IQB0aZyFOTwPVvntK7Uj24XTc/pXRYDJ2TS/BO9wtQJMxR2h2T3rgMnpFiP4p6a2GwyaLRuc4Nhw2xybrAWwTwGFbVHw3M+hiY3q84Q17AkkPr5kZgkZ1WG2s4YXTz8u8WPJJ6tWfBDdlEGrm1JatDGSJz89aNxG/BwfrL5aTdZ6dMIoMu8PjyZm7KWHOvM3tIJnUFVPKd98LjMqQ+rFpk6w1fOUE5okepeMXNeI8cWRRn4uYQAXAdEHjZbXqU7zsDwvqE0kCZFhxONVh/3icWYdwOLIteoBxvPBJMZ9Z+BIF6P0zkjdsFF817WGRWZUP+y4WBk+6MMDtmOBnFHcY2NeY+Y91xQdKjmQ/CaeOJq84WN2ICmSM4HLfJtxrahAxfkBnYXeoHyn0QjiHQIrrBq+mWHQFUHSThB7a/lfTFA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(376014)(22082099003)(18002099003)(56012099003)(38350700014)(921020)(11063799006)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HuhMFN+IadDskL1ffReI2kHSLPXS4ZHe9FbuwBnxFGQZ5FsoJlTz8XkOxiZJ?=
 =?us-ascii?Q?aoLrqiWmDb90jPMT5NeyG/GvtJFfB4aG2TkPnHwNcUQQiGLoZWqzLNeXydBn?=
 =?us-ascii?Q?bg3f7+zawmnoO1fqhriFfGR+xQXzGHg7JHt2COMJXyV6h0AIOUUQMmVenPvd?=
 =?us-ascii?Q?Vmg2cYp/piOZ+c+Mi++DVJdZI7N6wmhlTA2AfN7xHmtsPj1AaworSmqjGJ+E?=
 =?us-ascii?Q?FNUxWo5Kr/kEYto7ETarryFPPEZh3hOBcL/k/CTJ2Pc+/uhVeEue2tdmYjlO?=
 =?us-ascii?Q?ZfGMhWW1lOmKX29k0tveK5cy8dLOuE6l9XHlelPGgF3Bo3tcizks/dx6QTZ3?=
 =?us-ascii?Q?m6jJTxT/Jl4vfroa7AicACx/b8xMbvsS4hhbkWlU1mjBcmVftc2HmyC7yHd6?=
 =?us-ascii?Q?Y6qiPhEKr6APpTYECVnvgabLJ+eQBH6T4S8sJukbtnGq4K2XfT4A/MwTxSuI?=
 =?us-ascii?Q?Tq9HmKx+7zdAxi1ZrgAxZ4KsDrBS8noHVI42bswvs302VVSKHc4J5pHsQGoU?=
 =?us-ascii?Q?3vGeyY9kvZc4hZKr/3JryJvDBjVBpmtXWSRYYtk4ZuYhnd/hiFL8LoT0Wxk4?=
 =?us-ascii?Q?D1LZjzlNOkIr+WLZ9XTvhWHNw6+fb5PvYa/ApZUSsZNFDaucuPU4zmUDnOAy?=
 =?us-ascii?Q?uv+S50e+R5CzB8d1xwaZF7UQbiko9SDvi43ghWw8IncUyMD3zUTxe02VTX5x?=
 =?us-ascii?Q?5blVSK+D6Bn+rCvrJKfwBJubi/xuGULpSVFZdPTR/cYg25BpmH9XAuCYrx6T?=
 =?us-ascii?Q?pNQW6t7TSM9t5LLby4HctILWPpUFDU2duyAcA1V4+DFyLr7U7JXxInNm3pV0?=
 =?us-ascii?Q?HVTo0377MSPUpM8+uf1936lFg2PW2QIMb0NuEQCShBvnqX3i0fzZQssDoJ2r?=
 =?us-ascii?Q?8Sp/mU2MPbXzISkbl9D3AAR0imjsOJXqBn50EkSdT4x6xVM/MM8kfv5NIpEt?=
 =?us-ascii?Q?6j/l9pNvV3cUJqXhxkyFaMIiO4X1quijaHLjLaQCizBUo2iKl+3ZVf7+5Kf4?=
 =?us-ascii?Q?Wrf1rFShosiB7cUYQwaIx0qHmwKYKBWM//3LaQkwQL/av9h8vv6IU/yaHY4m?=
 =?us-ascii?Q?QbFwmtnCJcKL4T4Le9Duu/0ovnNvohzy0g+aYBeP4JY9S+pFBofHvd1F+gTz?=
 =?us-ascii?Q?u5H7YSENZnyd3odk+Ov1hM76QFNhd+B6jp9ro/Rr1d3Jd4sfrqrp4+BVQbet?=
 =?us-ascii?Q?8gig+DFW3F1vcpewC+u3SiuXCHkeRc9SXZWyLvGIq8CGA3CiPOfVIS/DygQ1?=
 =?us-ascii?Q?Nd7mINL0VbZI03JiebCtdk0LOzno4ZwLoXTLgVxw1EaCKODll3Wl/jvqv8VE?=
 =?us-ascii?Q?Ansg4IB4aopkAL732IpgVxCM3TeeKEUkzwK9aalgiRV03A5ye67XaqlgZ1pC?=
 =?us-ascii?Q?N5lQQLx2CtpneYeMy8z0nHhnje6+tkcwa89MySbFWLysUKpqT1T9wm/iBYz0?=
 =?us-ascii?Q?aSNTurWrFipUaa15VfWqU/KcrQohNTiAWBY+MylbE18iGS0h9XTxKwHJH6hR?=
 =?us-ascii?Q?KUhd0pPZt+0mthEjpQwq8yVBB/KQRzLx0D6JBJ4SaVyRgkMZva9DjaGFDTWB?=
 =?us-ascii?Q?6cVYs1aLMVQLnFrvQ3VPI0XcK9/W/vVWF5t/AekB2z9zm6C24LJR6MFDYkCt?=
 =?us-ascii?Q?q11XHQcj1A3zuJ07p0SvBd+JXZzbgSJltxthBCGZfi7SOHowgc3AvTdJGyzL?=
 =?us-ascii?Q?aF+rMVmlj5UwIJO6cnTTdJrKT8o2XCJeGmXjKjnyAInC2avWzQpdD2VMOCCG?=
 =?us-ascii?Q?4fIX7n9np+384xas/+9oQxb+CG2SlTZFJpRR2eEiu95kicK8ShO/?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88610945-3ace-49d1-cdcc-08debacd92dd
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 02:22:02.9702
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +OeifnyN770fCZpHtLDrxF9LSYuqOZzmsKbdFIe6k01+EiX8Sl1zncjrAthq51pYHrEpVILFuzlVQHv9gZF0mAJfPBHhBfYXc6nHPhltkeuag433qCGV5lkqLAXk6N1E
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB10158

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/sta32x.c | 9 +++++++++
 sound/soc/codecs/sta350.c | 9 +++++++++
 sound/soc/codecs/sta529.c | 7 +++++++
 3 files changed, 25 insertions(+)

diff --git a/sound/soc/codecs/sta32x.c b/sound/soc/codecs/sta32x.c
index 652c6e3a9e632..c145c88ba988e 100644
--- a/sound/soc/codecs/sta32x.c
+++ b/sound/soc/codecs/sta32x.c
@@ -851,10 +851,19 @@ static int sta32x_set_bias_level(struct snd_soc_component *component,
 	return 0;
 }
 
+static const u64 sta32x_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF;
+
 static const struct snd_soc_dai_ops sta32x_dai_ops = {
 	.hw_params	= sta32x_hw_params,
 	.set_sysclk	= sta32x_set_dai_sysclk,
 	.set_fmt	= sta32x_set_dai_fmt,
+	.auto_selectable_formats	= &sta32x_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver sta32x_dai = {
diff --git a/sound/soc/codecs/sta350.c b/sound/soc/codecs/sta350.c
index 99c7f7ac807b3..0bfafff4ca0e0 100644
--- a/sound/soc/codecs/sta350.c
+++ b/sound/soc/codecs/sta350.c
@@ -886,10 +886,19 @@ static int sta350_set_bias_level(struct snd_soc_component *component,
 	return 0;
 }
 
+static const u64 sta350_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF;
+
 static const struct snd_soc_dai_ops sta350_dai_ops = {
 	.hw_params	= sta350_hw_params,
 	.set_sysclk	= sta350_set_dai_sysclk,
 	.set_fmt	= sta350_set_dai_fmt,
+	.auto_selectable_formats	= &sta350_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver sta350_dai = {
diff --git a/sound/soc/codecs/sta529.c b/sound/soc/codecs/sta529.c
index 7d57999f9cb13..0faf439ffee9b 100644
--- a/sound/soc/codecs/sta529.c
+++ b/sound/soc/codecs/sta529.c
@@ -286,10 +286,17 @@ static int sta529_set_dai_fmt(struct snd_soc_dai *codec_dai, u32 fmt)
 	return 0;
 }
 
+static const u64 sta529_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J;
+
 static const struct snd_soc_dai_ops sta529_dai_ops = {
 	.hw_params	=	sta529_hw_params,
 	.set_fmt	=	sta529_set_dai_fmt,
 	.mute_stream	=	sta529_mute,
+	.auto_selectable_formats	= &sta529_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 	.no_capture_mute = 1,
 };
 
-- 
2.43.0

