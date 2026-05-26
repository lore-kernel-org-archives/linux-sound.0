Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011037.outbound.protection.outlook.com [40.107.74.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CCBD2E888C
	for <linux-sound@vger.kernel.org>; Tue, 26 May 2026 02:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779761991; cv=fail; b=kncjOyALRvY7SyK35lEUBXp6OnXaTWf5MOheanOAsTZUUDZLvuWYJZZPsvJMMZS4W5Rz0T3ubs7rBrKbEUpax68sE5fkXm8wXuxBBxJfzKM3v3rAgQNHb78OqlPHhEB+h2Cbzbv0Qq5C5vLFVea9TXr74YPHzPW9U5HXvgcMEJs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779761991; c=relaxed/simple;
	bh=bXgdkr5wtQRwSoF3I8aHcTrKcD9/aH5UJfeHC+8ba2I=;
	h=Message-ID:To:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=SS75LP4Qt/UfddkrV3ssUIbUi+NQs09KIRGLO5yXGc/c5PZjPJi57eF7H9Issn/qQB8/rxfs/0JEucLTSUbQh5E+RPchE3QN7cuQmkFT3LkmasLBHmn4y4OoVE4/u57snKS8H7iKGTt/cXV94qcY10cVKNxAr/Ph5O02J7Qj57A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Eeg4JGEu; arc=fail smtp.client-ip=40.107.74.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Eeg4JGEu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=frU7l7G2Lqm3k4dO28TmmcIXWBK3Tx58OaheuHKSxJ4wESNjERt2ha7nS2PhNA4lRdcIvPJ0FUpNisHefFTmg5CcSKMfY5H9BPTAO6yDcn+BYfaOYOuVu/ARdj9o0cNDH+iigE6uQGm2P8S2nwKcaTcw/uGutB00ydZ7+p+fV3NLvSEQWsdXBCpznq/1kQh4TKK0pmKQmXi5XBbl8TLo8YdZMPfgtln95JaOpfUztULe5Q5GzoiCrWG1bqYkzZD1ezx7ahID8dcsYgHzGNZAO2do569zu6hY6bT9xTCDISknCb/tsWTyjc7AXovJearLQLSo77RxRRNPx6oPjBxcNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m8Jee8x1YI5H9Dg010NRkaOR4/nJCKD3bSM1B8NAjt4=;
 b=dxfi5iQKlTEjUfM5jOY3GREKknOdqsp9F80KicSpPqwhBeRGQUFwCLw/8CzS2s1UwssGSwLmgrl8uGKRuGuo+omfgcWAhmce9+hcY7al1Vjb1BrAhtg/YQx6yer8pvaF0qj9tJDhK9NHJY36CTGKjb2fxfXekUF0A/YAvKa1Goi229Zi1Qwl3baOSap5vReRQif5H14xwKejgNcV4ieDyOGGP2P2mGIYL5VV8K1pUx/rPJ9wLrlnTEnQIfW4PtDvnrx/MYOQdKlfAPGXCUF49pthE4FXk4yQeJXTO0Qgulz2URTjUx+pasF8f5Etketij4MTE9DPXT5SckTuoYeDnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m8Jee8x1YI5H9Dg010NRkaOR4/nJCKD3bSM1B8NAjt4=;
 b=Eeg4JGEuuQURkUqscU0cvHBrYj2lIOBkIhp+rd9x4k4cTuCuGu3G59ORtmWVzLievBRUCo+6yIgazAPI4GaXIF170HeTHAWotoaCDlxmrivBpzEQPFeGb3RrytbJaXnelIgbIb8orYJPCxkDXhMW5FybbxiBHzRWGmMeitN7gNo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TY3PR01MB11843.jpnprd01.prod.outlook.com (2603:1096:400:40a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Tue, 26 May
 2026 02:19:47 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0048.019; Tue, 26 May 2026
 02:19:47 +0000
Message-ID: <87cxyihpz2.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH 42/83] ASoC: codecs: ntp8*: use .auto_selectable_formats
In-Reply-To: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
References: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 26 May 2026 02:19:45 +0000
X-ClientProxiedBy: TYCPR01CA0123.jpnprd01.prod.outlook.com
 (2603:1096:400:26d::9) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TY3PR01MB11843:EE_
X-MS-Office365-Filtering-Correlation-Id: 27dd18d3-b204-4f09-4ed2-08debacd41f3
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|52116014|376014|1800799024|56012099003|22082099003|18002099003|38350700014|921020|11063799006|41080700001;
X-Microsoft-Antispam-Message-Info:
	jm2F04D6SeTnjicrTCLayeZlP13nQvTasJ7CzLsQLm21jXd3lR8++jMsOpGZvAc3HXAxM9sxJ6qNoN5fO1ikXh5OTZKyC2Wv90pKIIRGA2jA9sRer84zMExH2qXq3M2aubkllVPuyeKC82STeNzA0w0celUamvelQmQk8KVLPBea/l9uEZBgph0j0uYSkKFhrrFBJ4HIZbdByDPwbhwOeRs826uMfOabOragPN0mjAb+kO/RSCJQ3hdT+/0gLujdxCEeA+3uMGBkah1W5MIjczG+du2N0RWXLMZzse+b5ROMSTFuVtyZTExW9gmSNTUO2nbpSB26ByLrbQTHjcIZOBJtpozxHDJ8f7k8njZTUjT5liSKzM02+ogVCoX7W1HPIkYxCam5JzXGj5Gx/i0yuIb4zGmDtEhBts3wBhTz4yiQRh2kVFYnSNCiQ3d/klqeZrHXhHc18Z8A6Vljd16HEzAWk30KwFJyiiQsEnx3ow/3I6F3dYtbsa0/Z6wM+5RsOLId/4KSJQRCo+G+fmbVv0yO65ZsptVy8x+36vLpZxW4ZvfnsUSbmaFHMgyNbuIwnCXyzQdF82lzkoCrQo6ChN6OHxrptDbO0ng1nyxp8VMYPurfcTskXCUvy3NFhAbQt6a/EtOe5r2Qi0egrJgZ+oVSquZJLQZH+ihiVmRjd1MMEK/6DiO2oZq7XBWL/ocGJkRAltNDMfBziR5Ihmfo0RfLIYDNWTcvZJpawzfRit0aWhswYb9soITsG+/BcPfYPMGnsv/KIITOpbVCbi1uouO+8QrOTR8CCupNt9Zk2WM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(52116014)(376014)(1800799024)(56012099003)(22082099003)(18002099003)(38350700014)(921020)(11063799006)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hWQ7Ims4XcSfmOsfHhlizU0/kf3AsSpUjezR1KXP4wY/Fb/fQmh2vSpyUKEZ?=
 =?us-ascii?Q?wHYkmS+DrPaVmvEeW0bJJ4MliKGA+qXfeKh7oExp599lgkMrRkYeFDYB6iyH?=
 =?us-ascii?Q?RpinIK/JvaXhbNf/qtaDB87uzHdxSR2A51DsxyXCUpT6O85P+vt6AfzIiABH?=
 =?us-ascii?Q?yrprGJShSe6OyaqDSXfo7X+OmSloEWlASv3Jp5N85ERw6UAEPFB1pKDsL1kT?=
 =?us-ascii?Q?r7UEGaOBlsM4nl7rlm6KE+WtwcoLewFHR13BZ9/Xg87sRQN+/LCVth8paBh2?=
 =?us-ascii?Q?5lnUro1xbaeK00Uw99WwMc14M24J1b512THkqsPycBFQCRrMx7+Z2KLUqDHc?=
 =?us-ascii?Q?fzEpOvHi2aQ1TqzejGS7SFZUztz9qo5FHpbmEAXePGFbEc5Zm5OhIrefF4Es?=
 =?us-ascii?Q?qYle0OaLMXTKfRdzM1N/HL8p+Rh13w+uZcKYFfusgz9KJBSaZxFEFoJVQTZj?=
 =?us-ascii?Q?XO25lq3HMmV9cOtSv93eylhhMa3zOcOBT+06gGKvk+f9TlGKINcTHPMO3tsP?=
 =?us-ascii?Q?H4wVcua9FM6M4WASLQCywgec9Kh7kEdtX7FLG7PEpREqZX7NVIgrIc7HNLxj?=
 =?us-ascii?Q?hqPdqaW6lvYLiyUk2GO0/vm5ividPoj6KZJWTWMoXe/5ic3D0l2ZZSduatvB?=
 =?us-ascii?Q?Bx7nCpHtgkmEm0WsGBJQXGQdC+TDTyVIh9PuNWR2JSMl2+CQoxnjS2rWD00n?=
 =?us-ascii?Q?U7PSQ9o5X/52af1I9lAdFWIB9GJiK2mHl+3HiQpTtESECqCzP6KswZfmySnm?=
 =?us-ascii?Q?sKLtWLGJBQFRk87UsOtMe0wtMU/UpS8p8Z3KnwDiSzO0cqJ1qs8jbuQmFrd8?=
 =?us-ascii?Q?goOX/ByKyRNuNBkfrZeTL85BoNPNzyAj44rtYXXWgWjz0+SnDKKAW4+TorjZ?=
 =?us-ascii?Q?3kqNWCIZGkwSCvbCuiwOjFCM3iPm1cgzR4xUGYZMJo+R5na2OWEVfKmju9cG?=
 =?us-ascii?Q?qh/SeTO84z862bWnPGebEc+sQlRjb5kHAMvTs7EAEteG9CadCv9fiL1a60lN?=
 =?us-ascii?Q?gD046K/63EE+lITQJ3Mu5QXAGL+ywkGszLIEF4WH0Aflm9lbSOaOZQjLj1zx?=
 =?us-ascii?Q?Y7Z3ANFjaRAOZL8v10CSsf1uNBlCqikv/GgtbAjlDJGNGBPWqDWTEvtNTbfO?=
 =?us-ascii?Q?RQ7eXuYmIlxBCcXtXu0njITRH9bVbuOu92RTSfzauqf+jmDqtrSMhNMbwwA2?=
 =?us-ascii?Q?OLbqNs0/7oJj6TxVO59CMFww5W26gSSDn9LeBrqM7r4BKObElnK2L+x34SZF?=
 =?us-ascii?Q?scyEbXYXS3kpo+WT6lfqI8EheHAFwh9FRTKVqEYZ8vwZYMrkeBvXzKefeJF8?=
 =?us-ascii?Q?HhZzqYC2YQNaMNYbMnQwprS/f2Hyax1pE5/NEpWrBeXeWHWJONtfR969hKNY?=
 =?us-ascii?Q?869n1kSRAtHxWr/Z1K1jDcd1DAJtouHv0BxJHN9dSCHPSrHmI60yZ25fBtEi?=
 =?us-ascii?Q?BwtvbIu+3zHeqxq5V13OJxMPATm8PxKO+DVIVc2PcYNbH4dRnfFnAvrxUIU3?=
 =?us-ascii?Q?EKCw0gEuOPQ+qXTqtXoIHq9AODPHvNGTU73ut7N5KPgnIlP5ELtyutQFkWhR?=
 =?us-ascii?Q?CEBnukrNp5dJrCGNWImHLrMoJ5QsV21IQko/25FHDE3KxxV/lPVgXOfTBgAJ?=
 =?us-ascii?Q?H/7ovKd8XcQOoCf7j6CdA1MZxRo8mpJ0GfxUNsOudf6IYutzZFTCZAswT8jQ?=
 =?us-ascii?Q?muiyDKFmYpDoM2oJFYBPQ6uXzz2cb+UrUyV1womCtntyUCPa7cbCODRnRaI5?=
 =?us-ascii?Q?YJr8bzj9ZOX9S6smdLIG9hIgPrjZ8w0zEcbLXSMMlpiBfUTyHv6b?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27dd18d3-b204-4f09-4ed2-08debacd41f3
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 02:19:47.2489
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XmVWsHCYUDz6dwNiNKZ8rqrolewEzBp5ryrz2lsTFfXAGMGVpBQvtcsYIfr+dgIaHK2YWFbufqpcwGfXmSB0ISx0sfu5FY6rWOfXdP96oG328iIX/Y0FCmzubNG0mdCG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11843

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/ntp8835.c | 7 +++++++
 sound/soc/codecs/ntp8918.c | 7 +++++++
 2 files changed, 14 insertions(+)

diff --git a/sound/soc/codecs/ntp8835.c b/sound/soc/codecs/ntp8835.c
index 5837b9379fee7..39620b84e214d 100644
--- a/sound/soc/codecs/ntp8835.c
+++ b/sound/soc/codecs/ntp8835.c
@@ -385,9 +385,16 @@ static int ntp8835_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	return 0;
 };
 
+static const u64 ntp8835_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J;
+
 static const struct snd_soc_dai_ops ntp8835_dai_ops = {
 	.hw_params = ntp8835_hw_params,
 	.set_fmt = ntp8835_set_fmt,
+	.auto_selectable_formats = &ntp8835_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static struct snd_soc_dai_driver ntp8835_dai = {
diff --git a/sound/soc/codecs/ntp8918.c b/sound/soc/codecs/ntp8918.c
index a18d79aa80aaa..eca34fafc4e6c 100644
--- a/sound/soc/codecs/ntp8918.c
+++ b/sound/soc/codecs/ntp8918.c
@@ -306,10 +306,17 @@ static int ntp8918_digital_mute(struct snd_soc_dai *dai, int mute, int stream)
 					     mute_mask, mute ? mute_mask : 0);
 }
 
+static const u64 ntp8918_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J;
+
 static const struct snd_soc_dai_ops ntp8918_dai_ops = {
 	.hw_params = ntp8918_hw_params,
 	.set_fmt = ntp8918_set_fmt,
 	.mute_stream = ntp8918_digital_mute,
+	.auto_selectable_formats = &ntp8918_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static struct snd_soc_dai_driver ntp8918_dai = {
-- 
2.43.0

