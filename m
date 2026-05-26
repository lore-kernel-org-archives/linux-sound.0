Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011010.outbound.protection.outlook.com [52.101.125.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C2482F7EED
	for <linux-sound@vger.kernel.org>; Tue, 26 May 2026 02:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779762044; cv=fail; b=MurTSB6XOMEKxbk0UHPxCnU53CRLUaLb/Axc2HFgXKjBVNnuAZkTOuFhmC/VpEHW59j56ORotLhGxBRgaFkWEAiCG7DGzK2T+r24EmgNXVlwHoQgVyE24u9V4/WObemOr0N/rRTy0xex28njQ0Z+MKhbmREJSuvHNwjeSJF2luc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779762044; c=relaxed/simple;
	bh=mWUD72lqGbH3+DFj7jy+Rz7rgZ0b/gaZLe8VLVEY8Sw=;
	h=Message-ID:To:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=KUALua4mkHQXSSRBog2HPQM5R5cR1/OsgnLoH7wq1bQNhIPcbUKfcQyJHyLFPJDXP5mQrbgG2edq/2HEbF0povo+dDwTeufzlWByVHjNcvDlVOgutj5kV5WdSHfY34m0e4lz5JokY8GzPVRScdo+ZWPZ9K7vXBtj9UhgpntBDmk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=ViXWgjaK; arc=fail smtp.client-ip=52.101.125.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="ViXWgjaK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bRNq1ISskt7Q59GdWd39WUQj8J4J0Xj81OZbhqzeBRLpbAPPoWjns61NYUZzxdRvw2vAwk3J47eEAnCkf+xhnvY1O0lpR8MNIWwo+TOl3+bGeMYNIPiHDtVPq90I7tGYmXrZhqSrHxxcYInZUFVAXnQfz1X+hv4OfU5NqqON7Y0u/OMkvWpFm1KowGzjx6akzSN7il7GAZbyzB2CjMBdXCsFdxX0Wbmb0Slc/yqWLGAkDjdxRu59w7fGU8SJ5VryLARYOPGuWFUc3zzpqCZfFyK47eHsht0r/mbnkYdKz7lBWB0jOOrvwklgOyQBXjrx9alZdIW07la055SqEuyRTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B9IdiUgIlm/5gWch6qBKAj33sleajw9OK3umB6I21vg=;
 b=Vt87ptGObwQjgcwUCO0j/igRbCIB7ddiCBSbl8IN9Ngq4DLSqzNhTzFQlD//x9Q1UXXFocwufG5gav/mo6BNfEUALUyOYtR9nbWyIZgBKg/y+OIzwaQ5NACipV+JSdHADVR7nKfwi4dd5EFfn0nHXNJZ7ZhaKE+mCOxsZT27JvgRmGg+oUZo6jlfUN3Gxzq7Efa0CZkF3rB0nPu5GzvoRQIdUkhHYp7NFQgeiexNvNPnQmyl3u95loHO+PR7cVXHLzoGOlQCmAnkO3LyDrFEYWkOrT8gketPM7G8b71u5+XuAcPU1i3lHlSCSY2OyKWl0ZCfOXePmFTTbTv/T5HMxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B9IdiUgIlm/5gWch6qBKAj33sleajw9OK3umB6I21vg=;
 b=ViXWgjaKIJpn+o7Pr8kq7hgMMiVSM0oC+O3s2sh8uTvzHneTsgjgNu2ymYixnpNO2Y2q87WFRKWKRLJ6kgjApyTt65HJ46Bmeef9ZbBKZAeGE75WPtzbSRTVaqWt1ir0la3xDNMiERevV0D65A07moaubG18KF1Pb3pYd6xxOz0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TY3PR01MB11843.jpnprd01.prod.outlook.com (2603:1096:400:40a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Tue, 26 May
 2026 02:20:39 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0048.019; Tue, 26 May 2026
 02:20:38 +0000
Message-ID: <877boqhpya.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH 46/83] ASoC: codecs: rt*: use .auto_selectable_formats
In-Reply-To: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
References: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 26 May 2026 02:20:17 +0000
X-ClientProxiedBy: MA0PR01CA0113.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::14) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TY3PR01MB11843:EE_
X-MS-Office365-Filtering-Correlation-Id: 3823fede-6daf-4858-9786-08debacd60a4
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|52116014|376014|1800799024|56012099003|22082099003|18002099003|38350700014|921020|11063799006|41080700001;
X-Microsoft-Antispam-Message-Info:
	7Xlyr0mx1RK/HZEbLi0lL9YjKPU36iLhJS8B1B/Uiq2QEjLNb7jsJh4+MlT552PoQpTy0yVAsyoY27UL+hIeT9R8NlS2u9adcjIbAwHRNsc0eo/eKZtBM9a5YbIM0UJ+6V14uYFcG+DuHJzsTYUgG3F1+IYpu8cH/hUKUwSokR2L+d9UzoBOdv4WcVCN2BnAtRyER1+yVzFkVI0e0VdtKG+OUb+8D3VgrN4SqLvZG/ukTd6ZxFyCXPfrEXdYiM0CPC8bAFzHys7l/9Id2BKJ2JgPEUl2DkKUhwDwb/masdCjHZGByWiripE53XAIUutD9wWDUjRJc6rc8Np54FbdjOo/SCvIbG29lqdqqNkywBaZ1DCMsQBqgtDC5MGj12Ppeorrc7sfzoqwqvQg388taTTsldmVyuVEhvWRnFnPoT9rzI9KbOVtw/fxXMZNyx/UhLbKAhYSx2npzlR8xAu06X97yqRN/3TSnTQuz1tjJzvIZuR2zYED7CGp0VeOTz6xC3nDZ2hVPp3nsZ4ZhIrspJbihZ0476fqaFlwAEMY/CIlIwjI2bZJibxmYeM35KSDTd1Ji86bb1xYR2/R1+mXXHuaesJZey+osoIMjwVu+Dw/g6EQ/3JRvFETs9QZV4DnUvbRn7myetOCRrznilNG2BToDqcOiOGIvCVn4VvNnWTbA8Y2Hi824tWJLlHYiKDYqeRhwE7ba09zWlnbDbCEBSMY7ssxx2pF6Q6jw+eGnHivGmBAO/PKBHVpjdcJrNB1crgGYWqEoi8CakaU8xgn0dzgCpnh1RGueS7iGYd625M=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(52116014)(376014)(1800799024)(56012099003)(22082099003)(18002099003)(38350700014)(921020)(11063799006)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?SR1t41nRAbGiACjUFesnpMpDOl0F+VdnOqkD8vsd7FTYeEXd3rLZd+fJmUCC?=
 =?us-ascii?Q?fd0moyFN1yQ9vo+D9JsTga+Hijyv9TDGRg2HoPQcOgiIsNrCogjmjVsdq9kZ?=
 =?us-ascii?Q?KDcwriFuCe68xEwzrq8Ae3I9ArtoOIE4cw1GDx/YpC5SZiUvsbffrK6ft6xo?=
 =?us-ascii?Q?E0l6ktZGleNK4bpilMqksonK7VvemHj/wpRdsw3QY5++3Z2137wbdNGSWvII?=
 =?us-ascii?Q?mCdYGaNenW4wNi9O9tLD/EMiieotpECNlZXPPhQXyk1xMJtHo9jS6RS++z/v?=
 =?us-ascii?Q?awTyDoWbCCsHjHN0D6G7Le3sdLCHfhf9h+uK5OwqYXEfEYf41y/8ErMrrqB4?=
 =?us-ascii?Q?VE1bEMuirKt0nC3BChzWAecrc2ub6dDKQZeyWuvbsStKzMUB4efFpLDoPBJ7?=
 =?us-ascii?Q?nPoK4xoBui4/GvNTD2Y4qw6uohi5E/mCaibTm5KB3zozLCocX2JqzvH8Tava?=
 =?us-ascii?Q?Q3cZ9BXf1QjEeGq1lIB6FttMXNJxDuxR+3dxTGtMGcGZQxzraWrSYiv8CxVn?=
 =?us-ascii?Q?2qc2HDjPCkMOz3Ixh4QWCsaTm2bLGU11r1TFnp6FJ1nkGyUo9rocEQYGe8Su?=
 =?us-ascii?Q?tUGBZRa5xAMy9YxgoLPkyyPK3mFSdm1ve86Tox35LHqRfJNf4wsLi8RCMuHE?=
 =?us-ascii?Q?ah6OMUFHUYSyEQK+UfxowlOb+itBQSFFv0iZ4sRuKiVhe02++1Lq6nNhDgJy?=
 =?us-ascii?Q?a9HmS9p6CQNfA2xlPC1k/htFNtP6XchRZUEilEoUb2v/4zFexqKAM2y9gqD8?=
 =?us-ascii?Q?h4POfc+sU/OimzTishEHQfizmvEDNwS89/+YEzpFlOBse2NnRcFp03q7xsKW?=
 =?us-ascii?Q?NUHDTrNpOwTWcUQ9D2B75UXNMsBVHTykly/WXmrjS6E+10Nc2xo+C9RVTkJU?=
 =?us-ascii?Q?BSazMzjjwTpEtLVZPQ6nT225qFaBGyl2ZOPQtFq962UMSarsVP4R9giBAKKk?=
 =?us-ascii?Q?jwLCgMMPkBpXX75GDb680XbRQzYIdl1fnAKl3AYjaPJPYxdeWsA1r8yGJkJx?=
 =?us-ascii?Q?Glf5yHCmkykWJ5uGDqHiB/U5K6oIqADOdC+LsrSGGsjv/YQY0gARN3eWzY3i?=
 =?us-ascii?Q?9oJtAat4RC7fA2iDm7yQXD+xX9qCtf7Y9Q1vFAUUNkjXVlxdK+1GkVxyvxcm?=
 =?us-ascii?Q?A3SpUzJE7ClaA5G62dlNAc+NYhLOB0nsGrOAVtvmrszhsJKZg8tIwC5uRbke?=
 =?us-ascii?Q?98Jj9l8XUhXXV27ydtZ5P3OJZwTH3kFh98cjsxiRHszx4tQf5i/BT8ETIFEm?=
 =?us-ascii?Q?rp/OfWMwDZE1JHhM2ePNzwT/1S6embkw3eL2q72zd6U1aEqQInXMujMSHLnw?=
 =?us-ascii?Q?YZxfR9dGVhI6v2QT9jxV5ixMDFuEvos+xJkH4GUhs7Vni60EenvWaZqRWG+Y?=
 =?us-ascii?Q?4RFHe23XLV9y7ccWQ+EPnLAMU/EiEkcZ0+YRbgAICQ3+H3VYNp7/ucsNxali?=
 =?us-ascii?Q?4zCgtgwMoHOiQP2xs2p0mAvluhIS7ID8h5Fu7GkJFV5L33IwL4J78Rk6Mr2e?=
 =?us-ascii?Q?n5Twf24pMNpb6d9FWnMwFggA3Gfz54gS/BeikKcN25GvzVXnrOMv+p71Gba5?=
 =?us-ascii?Q?5jC+Ep/LuzdnYiZvB5FURKhFfPN/a63Jh/LWFPI+EtgY87XqRKfczA/OoOjE?=
 =?us-ascii?Q?pByPCYxL1Utc6V6CysbC3goT9J8GhIrgSpFLhOgsYs0Z1dehAT7xw7wcnQD9?=
 =?us-ascii?Q?l1TCwzGjNmCgQ9zWO6BlJ56pE3oG5deAT5sYlZityaoHG8N7U4klLYrdfLoe?=
 =?us-ascii?Q?3BUHoygo7A9JD/6Fe8KPjdb5Ibv0k7LnoElB1iPxsio/g68mmldN?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3823fede-6daf-4858-9786-08debacd60a4
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 02:20:38.8306
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QhK1bqdBG7jaNLASb4UNPoaED1GafZYnlJbqFVBNhKJJAw70Y3yFJRTLHU2Fn7uL0Ef6afjz0dKuIE4Fh/VBeNuWJsHhc0g1hYIKrOgSsm9ySjdD1qs1fSOVG2SqIrfJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11843

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/rt1011.c  | 10 ++++++++++
 sound/soc/codecs/rt1015.c  | 10 ++++++++++
 sound/soc/codecs/rt1016.c  | 10 ++++++++++
 sound/soc/codecs/rt1019.c  | 10 ++++++++++
 sound/soc/codecs/rt1305.c  | 10 ++++++++++
 sound/soc/codecs/rt1308.c  | 10 ++++++++++
 sound/soc/codecs/rt1318.c  | 10 ++++++++++
 sound/soc/codecs/rt274.c   |  8 ++++++++
 sound/soc/codecs/rt286.c   |  8 ++++++++
 sound/soc/codecs/rt298.c   |  8 ++++++++
 sound/soc/codecs/rt5514.c  | 12 ++++++++++++
 sound/soc/codecs/rt5616.c  | 10 ++++++++++
 sound/soc/codecs/rt5631.c  | 10 ++++++++++
 sound/soc/codecs/rt5640.c  | 10 ++++++++++
 sound/soc/codecs/rt5645.c  | 10 ++++++++++
 sound/soc/codecs/rt5651.c  | 10 ++++++++++
 sound/soc/codecs/rt5659.c  | 10 ++++++++++
 sound/soc/codecs/rt5660.c  | 10 ++++++++++
 sound/soc/codecs/rt5663.c  | 10 ++++++++++
 sound/soc/codecs/rt5665.c  | 10 ++++++++++
 sound/soc/codecs/rt5668.c  | 14 ++++++++++++++
 sound/soc/codecs/rt5670.c  | 10 ++++++++++
 sound/soc/codecs/rt5677.c  | 10 ++++++++++
 sound/soc/codecs/rt5682.c  | 14 ++++++++++++++
 sound/soc/codecs/rt5682s.c | 14 ++++++++++++++
 sound/soc/codecs/rt9120.c  |  9 +++++++++
 sound/soc/codecs/rt9123.c  |  9 +++++++++
 27 files changed, 276 insertions(+)

diff --git a/sound/soc/codecs/rt1011.c b/sound/soc/codecs/rt1011.c
index 15488a0592837..d47b0370dd6b0 100644
--- a/sound/soc/codecs/rt1011.c
+++ b/sound/soc/codecs/rt1011.c
@@ -2133,10 +2133,20 @@ static int rt1011_set_bias_level(struct snd_soc_component *component,
 			SNDRV_PCM_FMTBIT_S20_3LE | SNDRV_PCM_FMTBIT_S16_LE | \
 			SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S32_LE)
 
+static const u64 rt1011_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF;
+
 static const struct snd_soc_dai_ops rt1011_aif_dai_ops = {
 	.hw_params = rt1011_hw_params,
 	.set_fmt = rt1011_set_dai_fmt,
 	.set_tdm_slot = rt1011_set_tdm_slot,
+	.auto_selectable_formats = &rt1011_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static struct snd_soc_dai_driver rt1011_dai[] = {
diff --git a/sound/soc/codecs/rt1015.c b/sound/soc/codecs/rt1015.c
index ff0c08ff610e1..c6d59c2860644 100644
--- a/sound/soc/codecs/rt1015.c
+++ b/sound/soc/codecs/rt1015.c
@@ -1016,10 +1016,20 @@ static void rt1015_remove(struct snd_soc_component *component)
 #define RT1015_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE | \
 			SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S8)
 
+static const u64 rt1015_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF;
+
 static const struct snd_soc_dai_ops rt1015_aif_dai_ops = {
 	.hw_params = rt1015_hw_params,
 	.set_fmt = rt1015_set_dai_fmt,
 	.set_tdm_slot = rt1015_set_tdm_slot,
+	.auto_selectable_formats = &rt1015_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static struct snd_soc_dai_driver rt1015_dai[] = {
diff --git a/sound/soc/codecs/rt1016.c b/sound/soc/codecs/rt1016.c
index 11c8c45574a13..56a2f3d3354df 100644
--- a/sound/soc/codecs/rt1016.c
+++ b/sound/soc/codecs/rt1016.c
@@ -534,9 +534,19 @@ static void rt1016_remove(struct snd_soc_component *component)
 #define RT1016_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE | \
 			SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S8)
 
+static const u64 rt1016_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF;
+
 static const struct snd_soc_dai_ops rt1016_aif_dai_ops = {
 	.hw_params = rt1016_hw_params,
 	.set_fmt = rt1016_set_dai_fmt,
+	.auto_selectable_formats	= &rt1016_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver rt1016_dai[] = {
diff --git a/sound/soc/codecs/rt1019.c b/sound/soc/codecs/rt1019.c
index 370521149ac8a..3998abccd93a8 100644
--- a/sound/soc/codecs/rt1019.c
+++ b/sound/soc/codecs/rt1019.c
@@ -492,12 +492,22 @@ static int rt1019_probe(struct snd_soc_component *component)
 #define RT1019_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE | \
 			SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S8)
 
+static const u64 rt1019_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF;
+
 static const struct snd_soc_dai_ops rt1019_aif_dai_ops = {
 	.hw_params = rt1019_hw_params,
 	.set_fmt = rt1019_set_dai_fmt,
 	.set_sysclk = rt1019_set_dai_sysclk,
 	.set_pll = rt1019_set_dai_pll,
 	.set_tdm_slot = rt1019_set_tdm_slot,
+	.auto_selectable_formats = &rt1019_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static struct snd_soc_dai_driver rt1019_dai[] = {
diff --git a/sound/soc/codecs/rt1305.c b/sound/soc/codecs/rt1305.c
index 2d5fad76cf528..92998ec0a392e 100644
--- a/sound/soc/codecs/rt1305.c
+++ b/sound/soc/codecs/rt1305.c
@@ -910,9 +910,19 @@ static int rt1305_resume(struct snd_soc_component *component)
 			SNDRV_PCM_FMTBIT_S20_3LE | SNDRV_PCM_FMTBIT_S16_LE | \
 			SNDRV_PCM_FMTBIT_S24_LE)
 
+static const u64 rt1305_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF;
+
 static const struct snd_soc_dai_ops rt1305_aif_dai_ops = {
 	.hw_params = rt1305_hw_params,
 	.set_fmt = rt1305_set_dai_fmt,
+	.auto_selectable_formats = &rt1305_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static struct snd_soc_dai_driver rt1305_dai[] = {
diff --git a/sound/soc/codecs/rt1308.c b/sound/soc/codecs/rt1308.c
index 630946cd7cdf8..28c25871ec0c0 100644
--- a/sound/soc/codecs/rt1308.c
+++ b/sound/soc/codecs/rt1308.c
@@ -729,9 +729,19 @@ static int rt1308_resume(struct snd_soc_component *component)
 			SNDRV_PCM_FMTBIT_S20_3LE | SNDRV_PCM_FMTBIT_S16_LE | \
 			SNDRV_PCM_FMTBIT_S24_LE)
 
+static const u64 rt1308_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF;
+
 static const struct snd_soc_dai_ops rt1308_aif_dai_ops = {
 	.hw_params = rt1308_hw_params,
 	.set_fmt = rt1308_set_dai_fmt,
+	.auto_selectable_formats	= &rt1308_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver rt1308_dai[] = {
diff --git a/sound/soc/codecs/rt1318.c b/sound/soc/codecs/rt1318.c
index d13fd0e141252..23d6ee974ef16 100644
--- a/sound/soc/codecs/rt1318.c
+++ b/sound/soc/codecs/rt1318.c
@@ -1087,12 +1087,22 @@ static int rt1318_resume(struct snd_soc_component *component)
 #define RT1318_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE | \
 			SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S8)
 
+static const u64 rt1318_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF;
+
 static const struct snd_soc_dai_ops rt1318_aif_dai_ops = {
 	.hw_params = rt1318_hw_params,
 	.set_fmt = rt1318_set_dai_fmt,
 	.set_sysclk = rt1318_set_dai_sysclk,
 	.set_pll = rt1318_set_dai_pll,
 	.set_tdm_slot = rt1318_set_tdm_slot,
+	.auto_selectable_formats = &rt1318_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static struct snd_soc_dai_driver rt1318_dai[] = {
diff --git a/sound/soc/codecs/rt274.c b/sound/soc/codecs/rt274.c
index 63b5fc439773d..d70feeb7aa1f2 100644
--- a/sound/soc/codecs/rt274.c
+++ b/sound/soc/codecs/rt274.c
@@ -1027,6 +1027,12 @@ static int rt274_resume(struct snd_soc_component *component)
 #define RT274_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE | \
 			SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S8)
 
+static const u64 rt274_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B;
+
 static const struct snd_soc_dai_ops rt274_aif_dai_ops = {
 	.hw_params = rt274_hw_params,
 	.set_fmt = rt274_set_dai_fmt,
@@ -1034,6 +1040,8 @@ static const struct snd_soc_dai_ops rt274_aif_dai_ops = {
 	.set_pll = rt274_set_dai_pll,
 	.set_bclk_ratio = rt274_set_bclk_ratio,
 	.set_tdm_slot = rt274_set_tdm_slot,
+	.auto_selectable_formats = &rt274_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static struct snd_soc_dai_driver rt274_dai[] = {
diff --git a/sound/soc/codecs/rt286.c b/sound/soc/codecs/rt286.c
index ded0ea3324804..0632fec5b0108 100644
--- a/sound/soc/codecs/rt286.c
+++ b/sound/soc/codecs/rt286.c
@@ -995,11 +995,19 @@ static int rt286_resume(struct snd_soc_component *component)
 #define RT286_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE | \
 			SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S8)
 
+static const u64 rt286_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B;
+
 static const struct snd_soc_dai_ops rt286_aif_dai_ops = {
 	.hw_params = rt286_hw_params,
 	.set_fmt = rt286_set_dai_fmt,
 	.set_sysclk = rt286_set_dai_sysclk,
 	.set_bclk_ratio = rt286_set_bclk_ratio,
+	.auto_selectable_formats	= &rt286_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver rt286_dai[] = {
diff --git a/sound/soc/codecs/rt298.c b/sound/soc/codecs/rt298.c
index 5414a1712b571..5901638198d8d 100644
--- a/sound/soc/codecs/rt298.c
+++ b/sound/soc/codecs/rt298.c
@@ -1056,11 +1056,19 @@ static int rt298_resume(struct snd_soc_component *component)
 #define RT298_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE | \
 			SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S8)
 
+static const u64 rt298_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B;
+
 static const struct snd_soc_dai_ops rt298_aif_dai_ops = {
 	.hw_params = rt298_hw_params,
 	.set_fmt = rt298_set_dai_fmt,
 	.set_sysclk = rt298_set_dai_sysclk,
 	.set_bclk_ratio = rt298_set_bclk_ratio,
+	.auto_selectable_formats = &rt298_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static struct snd_soc_dai_driver rt298_dai[] = {
diff --git a/sound/soc/codecs/rt5514.c b/sound/soc/codecs/rt5514.c
index 00a4a208d2fa7..42decd111c143 100644
--- a/sound/soc/codecs/rt5514.c
+++ b/sound/soc/codecs/rt5514.c
@@ -1136,12 +1136,24 @@ static int rt5514_i2c_write(void *context, unsigned int reg, unsigned int val)
 #define RT5514_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE | \
 			SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S8)
 
+static const u64 rt5514_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops rt5514_aif_dai_ops = {
 	.hw_params = rt5514_hw_params,
 	.set_fmt = rt5514_set_dai_fmt,
 	.set_sysclk = rt5514_set_dai_sysclk,
 	.set_pll = rt5514_set_dai_pll,
 	.set_tdm_slot = rt5514_set_tdm_slot,
+	.auto_selectable_formats = &rt5514_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static struct snd_soc_dai_driver rt5514_dai[] = {
diff --git a/sound/soc/codecs/rt5616.c b/sound/soc/codecs/rt5616.c
index 46ee412dc81db..3f9d97d04d48a 100644
--- a/sound/soc/codecs/rt5616.c
+++ b/sound/soc/codecs/rt5616.c
@@ -1260,11 +1260,21 @@ static int rt5616_resume(struct snd_soc_component *component)
 #define RT5616_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE | \
 			SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S8)
 
+static const u64 rt5616_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF;
+
 static const struct snd_soc_dai_ops rt5616_aif_dai_ops = {
 	.hw_params = rt5616_hw_params,
 	.set_fmt = rt5616_set_dai_fmt,
 	.set_sysclk = rt5616_set_dai_sysclk,
 	.set_pll = rt5616_set_dai_pll,
+	.auto_selectable_formats = &rt5616_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static struct snd_soc_dai_driver rt5616_dai[] = {
diff --git a/sound/soc/codecs/rt5631.c b/sound/soc/codecs/rt5631.c
index ed1233973eb83..f97fd24e4229a 100644
--- a/sound/soc/codecs/rt5631.c
+++ b/sound/soc/codecs/rt5631.c
@@ -1626,11 +1626,21 @@ static int rt5631_probe(struct snd_soc_component *component)
 			SNDRV_PCM_FMTBIT_S24_LE | \
 			SNDRV_PCM_FMTBIT_S8)
 
+static const u64 rt5631_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF;
+
 static const struct snd_soc_dai_ops rt5631_ops = {
 	.hw_params = rt5631_hifi_pcm_params,
 	.set_fmt = rt5631_hifi_codec_set_dai_fmt,
 	.set_sysclk = rt5631_hifi_codec_set_dai_sysclk,
 	.set_pll = rt5631_codec_set_dai_pll,
+	.auto_selectable_formats = &rt5631_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static struct snd_soc_dai_driver rt5631_dai[] = {
diff --git a/sound/soc/codecs/rt5640.c b/sound/soc/codecs/rt5640.c
index 74fd05176eff7..4fa1eee8e87f3 100644
--- a/sound/soc/codecs/rt5640.c
+++ b/sound/soc/codecs/rt5640.c
@@ -2877,11 +2877,21 @@ static int rt5640_resume(struct snd_soc_component *component)
 #define RT5640_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE | \
 			SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S8)
 
+static const u64 rt5640_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF;
+
 static const struct snd_soc_dai_ops rt5640_aif_dai_ops = {
 	.hw_params = rt5640_hw_params,
 	.set_fmt = rt5640_set_dai_fmt,
 	.set_sysclk = rt5640_set_dai_sysclk,
 	.set_pll = rt5640_set_dai_pll,
+	.auto_selectable_formats	= &rt5640_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver rt5640_dai[] = {
diff --git a/sound/soc/codecs/rt5645.c b/sound/soc/codecs/rt5645.c
index 8a9af260e5f7f..2357f4a1f3675 100644
--- a/sound/soc/codecs/rt5645.c
+++ b/sound/soc/codecs/rt5645.c
@@ -3535,12 +3535,22 @@ static int rt5645_resume(struct snd_soc_component *component)
 #define RT5645_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE | \
 			SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S8)
 
+static const u64 rt5645_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF;
+
 static const struct snd_soc_dai_ops rt5645_aif_dai_ops = {
 	.hw_params = rt5645_hw_params,
 	.set_fmt = rt5645_set_dai_fmt,
 	.set_sysclk = rt5645_set_dai_sysclk,
 	.set_tdm_slot = rt5645_set_tdm_slot,
 	.set_pll = rt5645_set_dai_pll,
+	.auto_selectable_formats	= &rt5645_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver rt5645_dai[] = {
diff --git a/sound/soc/codecs/rt5651.c b/sound/soc/codecs/rt5651.c
index 5c729135f71bd..9723b4c7540cb 100644
--- a/sound/soc/codecs/rt5651.c
+++ b/sound/soc/codecs/rt5651.c
@@ -2102,11 +2102,21 @@ static int rt5651_resume(struct snd_soc_component *component)
 #define RT5651_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE | \
 			SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S8)
 
+static const u64 rt5651_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF;
+
 static const struct snd_soc_dai_ops rt5651_aif_dai_ops = {
 	.hw_params = rt5651_hw_params,
 	.set_fmt = rt5651_set_dai_fmt,
 	.set_sysclk = rt5651_set_dai_sysclk,
 	.set_pll = rt5651_set_dai_pll,
+	.auto_selectable_formats	= &rt5651_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver rt5651_dai[] = {
diff --git a/sound/soc/codecs/rt5659.c b/sound/soc/codecs/rt5659.c
index 3097ee6d4e89f..3d782f41ccdd8 100644
--- a/sound/soc/codecs/rt5659.c
+++ b/sound/soc/codecs/rt5659.c
@@ -3716,11 +3716,21 @@ static int rt5659_resume(struct snd_soc_component *component)
 #define RT5659_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE | \
 		SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S8)
 
+static const u64 rt5659_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF;
+
 static const struct snd_soc_dai_ops rt5659_aif_dai_ops = {
 	.hw_params = rt5659_hw_params,
 	.set_fmt = rt5659_set_dai_fmt,
 	.set_tdm_slot = rt5659_set_tdm_slot,
 	.set_bclk_ratio = rt5659_set_bclk_ratio,
+	.auto_selectable_formats	= &rt5659_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver rt5659_dai[] = {
diff --git a/sound/soc/codecs/rt5660.c b/sound/soc/codecs/rt5660.c
index edf2e3e346e4f..807604120d282 100644
--- a/sound/soc/codecs/rt5660.c
+++ b/sound/soc/codecs/rt5660.c
@@ -1161,11 +1161,21 @@ static int rt5660_resume(struct snd_soc_component *component)
 #define RT5660_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE | \
 			SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S8)
 
+static const u64 rt5660_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF;
+
 static const struct snd_soc_dai_ops rt5660_aif_dai_ops = {
 	.hw_params = rt5660_hw_params,
 	.set_fmt = rt5660_set_dai_fmt,
 	.set_sysclk = rt5660_set_dai_sysclk,
 	.set_pll = rt5660_set_dai_pll,
+	.auto_selectable_formats	= &rt5660_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver rt5660_dai[] = {
diff --git a/sound/soc/codecs/rt5663.c b/sound/soc/codecs/rt5663.c
index 262d3bba1f3d4..ec46e6180cc0e 100644
--- a/sound/soc/codecs/rt5663.c
+++ b/sound/soc/codecs/rt5663.c
@@ -3222,6 +3222,14 @@ static int rt5663_resume(struct snd_soc_component *component)
 #define RT5663_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE | \
 			SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S8)
 
+static const u64 rt5663_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF;
+
 static const struct snd_soc_dai_ops rt5663_aif_dai_ops = {
 	.hw_params = rt5663_hw_params,
 	.set_fmt = rt5663_set_dai_fmt,
@@ -3229,6 +3237,8 @@ static const struct snd_soc_dai_ops rt5663_aif_dai_ops = {
 	.set_pll = rt5663_set_dai_pll,
 	.set_tdm_slot = rt5663_set_tdm_slot,
 	.set_bclk_ratio = rt5663_set_bclk_ratio,
+	.auto_selectable_formats	= &rt5663_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver rt5663_dai[] = {
diff --git a/sound/soc/codecs/rt5665.c b/sound/soc/codecs/rt5665.c
index 48f57cd0920d4..3948f8d415f4c 100644
--- a/sound/soc/codecs/rt5665.c
+++ b/sound/soc/codecs/rt5665.c
@@ -4402,11 +4402,21 @@ static int rt5665_resume(struct snd_soc_component *component)
 #define RT5665_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE | \
 		SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S8)
 
+static const u64 rt5665_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF;
+
 static const struct snd_soc_dai_ops rt5665_aif_dai_ops = {
 	.hw_params = rt5665_hw_params,
 	.set_fmt = rt5665_set_dai_fmt,
 	.set_tdm_slot = rt5665_set_tdm_slot,
 	.set_bclk_ratio = rt5665_set_bclk_ratio,
+	.auto_selectable_formats	= &rt5665_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver rt5665_dai[] = {
diff --git a/sound/soc/codecs/rt5668.c b/sound/soc/codecs/rt5668.c
index fed6de40b8c80..0e12e095a870f 100644
--- a/sound/soc/codecs/rt5668.c
+++ b/sound/soc/codecs/rt5668.c
@@ -2255,16 +2255,30 @@ static int rt5668_resume(struct snd_soc_component *component)
 #define RT5668_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE | \
 		SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S8)
 
+static const u64 rt5668_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops rt5668_aif1_dai_ops = {
 	.hw_params = rt5668_hw_params,
 	.set_fmt = rt5668_set_dai_fmt,
 	.set_tdm_slot = rt5668_set_tdm_slot,
+	.auto_selectable_formats	= &rt5668_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static const struct snd_soc_dai_ops rt5668_aif2_dai_ops = {
 	.hw_params = rt5668_hw_params,
 	.set_fmt = rt5668_set_dai_fmt,
 	.set_bclk_ratio = rt5668_set_bclk_ratio,
+	.auto_selectable_formats	= &rt5668_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver rt5668_dai[] = {
diff --git a/sound/soc/codecs/rt5670.c b/sound/soc/codecs/rt5670.c
index 1d120b5dc2be7..f772f093479ad 100644
--- a/sound/soc/codecs/rt5670.c
+++ b/sound/soc/codecs/rt5670.c
@@ -2791,12 +2791,22 @@ static int rt5670_resume(struct snd_soc_component *component)
 #define RT5670_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE | \
 			SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S8)
 
+static const u64 rt5670_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF;
+
 static const struct snd_soc_dai_ops rt5670_aif_dai_ops = {
 	.hw_params = rt5670_hw_params,
 	.set_fmt = rt5670_set_dai_fmt,
 	.set_tdm_slot = rt5670_set_tdm_slot,
 	.set_pll = rt5670_set_dai_pll,
 	.set_bclk_ratio = rt5670_set_bclk_ratio,
+	.auto_selectable_formats	= &rt5670_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver rt5670_dai[] = {
diff --git a/sound/soc/codecs/rt5677.c b/sound/soc/codecs/rt5677.c
index ac084ca008f3c..488f5145c3b97 100644
--- a/sound/soc/codecs/rt5677.c
+++ b/sound/soc/codecs/rt5677.c
@@ -5022,12 +5022,22 @@ static int rt5677_write(void *context, unsigned int reg, unsigned int val)
 #define RT5677_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE | \
 			SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S8)
 
+static const u64 rt5677_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF;
+
 static const struct snd_soc_dai_ops rt5677_aif_dai_ops = {
 	.hw_params = rt5677_hw_params,
 	.set_fmt = rt5677_set_dai_fmt,
 	.set_sysclk = rt5677_set_dai_sysclk,
 	.set_pll = rt5677_set_dai_pll,
 	.set_tdm_slot = rt5677_set_tdm_slot,
+	.auto_selectable_formats	= &rt5677_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static const struct snd_soc_dai_ops rt5677_dsp_dai_ops = {
diff --git a/sound/soc/codecs/rt5682.c b/sound/soc/codecs/rt5682.c
index d39f8e4f3474c..4af2230ea8683 100644
--- a/sound/soc/codecs/rt5682.c
+++ b/sound/soc/codecs/rt5682.c
@@ -3048,11 +3048,23 @@ static int rt5682_resume(struct snd_soc_component *component)
 #define rt5682_resume NULL
 #endif
 
+static const u64 rt5682_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 const struct snd_soc_dai_ops rt5682_aif1_dai_ops = {
 	.hw_params = rt5682_hw_params,
 	.set_fmt = rt5682_set_dai_fmt,
 	.set_tdm_slot = rt5682_set_tdm_slot,
 	.set_bclk_ratio = rt5682_set_bclk1_ratio,
+	.auto_selectable_formats	= &rt5682_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 EXPORT_SYMBOL_GPL(rt5682_aif1_dai_ops);
 
@@ -3060,6 +3072,8 @@ const struct snd_soc_dai_ops rt5682_aif2_dai_ops = {
 	.hw_params = rt5682_hw_params,
 	.set_fmt = rt5682_set_dai_fmt,
 	.set_bclk_ratio = rt5682_set_bclk2_ratio,
+	.auto_selectable_formats	= &rt5682_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 EXPORT_SYMBOL_GPL(rt5682_aif2_dai_ops);
 
diff --git a/sound/soc/codecs/rt5682s.c b/sound/soc/codecs/rt5682s.c
index 3624067950c0e..e3f3b06892e8d 100644
--- a/sound/soc/codecs/rt5682s.c
+++ b/sound/soc/codecs/rt5682s.c
@@ -2931,17 +2931,31 @@ static int rt5682s_resume(struct snd_soc_component *component)
 #define rt5682s_resume NULL
 #endif
 
+static const u64 rt5682s_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops rt5682s_aif1_dai_ops = {
 	.hw_params = rt5682s_hw_params,
 	.set_fmt = rt5682s_set_dai_fmt,
 	.set_tdm_slot = rt5682s_set_tdm_slot,
 	.set_bclk_ratio = rt5682s_set_bclk1_ratio,
+	.auto_selectable_formats	= &rt5682s_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static const struct snd_soc_dai_ops rt5682s_aif2_dai_ops = {
 	.hw_params = rt5682s_hw_params,
 	.set_fmt = rt5682s_set_dai_fmt,
 	.set_bclk_ratio = rt5682s_set_bclk2_ratio,
+	.auto_selectable_formats	= &rt5682s_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static const struct snd_soc_component_driver rt5682s_soc_component_dev = {
diff --git a/sound/soc/codecs/rt9120.c b/sound/soc/codecs/rt9120.c
index 97f56af25577d..842acc3bec2c2 100644
--- a/sound/soc/codecs/rt9120.c
+++ b/sound/soc/codecs/rt9120.c
@@ -289,9 +289,18 @@ static int rt9120_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
+static const u64 rt9120_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B;
+
 static const struct snd_soc_dai_ops rt9120_dai_ops = {
 	.set_fmt = rt9120_set_fmt,
 	.hw_params = rt9120_hw_params,
+	.auto_selectable_formats = &rt9120_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static struct snd_soc_dai_driver rt9120_dai = {
diff --git a/sound/soc/codecs/rt9123.c b/sound/soc/codecs/rt9123.c
index 84fd3d6861de7..2b4bacf327c8d 100644
--- a/sound/soc/codecs/rt9123.c
+++ b/sound/soc/codecs/rt9123.c
@@ -300,10 +300,19 @@ static int rt9123_dai_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
+static const u64 rt9123_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B;
+
 static const struct snd_soc_dai_ops rt9123_dai_ops = {
 	.set_fmt	= rt9123_dai_set_format,
 	.set_tdm_slot	= rt9123_dai_set_tdm_slot,
 	.hw_params	= rt9123_dai_hw_params,
+	.auto_selectable_formats	= &rt9123_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver rt9123_dai_driver = {
-- 
2.43.0

