Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011014.outbound.protection.outlook.com [52.101.125.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAB202D23BC
	for <linux-sound@vger.kernel.org>; Tue, 26 May 2026 02:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779762441; cv=fail; b=urYM77uKT2I/nrA6HUboIt6jP85mOHAKTid8/bWPDjxoJxoS/8DAD9gCUD+JyO5L4D6xifUZgR/OcgBJUhP7I97G7NqgD610IW1unqljhEwuKOFH+/yk77LgC+qXjOsmuf4wrVVdDeuodvOqTUZ3QREFM6AfrgLk33Fk8F0l0JU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779762441; c=relaxed/simple;
	bh=xl0B5aOZfsh2pdoBbmvwk8z4xetemKpk8hxryoptcvs=;
	h=Message-ID:To:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=RlA28A51mpzZCdRYR+D9DyxAQ0MFuYsTlmAJAOl7e7D2OT8HXFca7g7m5GdV15lsMZFntVbMfA4/j0ViSFywUJEgDOBtff8XS2d1wYnr7/Us6Sl7jnfnPLTlXIZgYfNZfNodpainlcgKo99MP7RxTGFAY+l+fQszI0iBweDW/68=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=f3ekW7uo; arc=fail smtp.client-ip=52.101.125.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="f3ekW7uo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BAyOYlkZy6Z2mVts1oR3hUsIyuVIrZNSHnSjqqXZBQ6G9pTtLUt99tw+UbYXgTq3o0EgRbC+h4mTjqDYcRHphxlpp6IRg4eoMVdsp9aRTQCyKkWGfy6MD48H73X7xgynYRT62PGZZaLbOBEfDT0519iYDx11BNI9c5FJFZlPgDJb1cQApdc2kfG7W+cz/+jgew9UM4IYeDiQLqD97GvpVlDELnzg1vAVWHys3/zPdv5pi53aLFzMCJpC1SG6g1TDpRnea7f56NFhJaE54ljy85IBWokYt59S7vpA4yZqnr+bIZx3laXt36IHplyBKoIRxsIeTVI7IWK+maoInryatg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CrMafuKL2dLi0cLl+GK1kEnjDe+WeeoMdRI5C5OH8T8=;
 b=eLNOPtB8rePNu2X/OUKviRqApReGYqM+rZ7/WiyJevR4N/cBbuNZ42oOQJb2j0ZmWzK2D8NeTClwDm1BkBspoNm3odMmWMgkI94XBdC3rKOWNpWiGYvUCsJdFW4heonviSQn0ddT3BRo6NjpQGU/m21slQn4YegeaSvgIC7soAA+blVit3c70B0QIj+DBuIjT0uD9t11bNTVFIfFxgo2q8FC5tGWxYzWY2U+GeKqwk3apMjg4czY01IeSBbcYjQeUIfePhoOxqcXaObzpW3C1FmogMmmQcqVZxNgxrMcKgCN0cU4CD5RSDMHSKmbHc+Ri3f5t1BVJYm05FPWXhvTgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CrMafuKL2dLi0cLl+GK1kEnjDe+WeeoMdRI5C5OH8T8=;
 b=f3ekW7uofPzXjWy2lvEuOZHFRhTJvDOm/msjvNVwwx8vSe0SCXHlMZQ9PXKyQN0bfxKkOQZZI4D+2bYBY+/cd2MPjcUyFkzqzSqQcaLc+i1jD73gA1Kv3v76xD2WGj6GYvwBdSSosUIF6xfqyFn5SD6Si5LTkHwoYgk+tlTIXXE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYRPR01MB13144.jpnprd01.prod.outlook.com (2603:1096:405:119::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Tue, 26 May
 2026 02:27:17 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0048.019; Tue, 26 May 2026
 02:27:16 +0000
Message-ID: <87zf1mewhp.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH 76/83] ASoC: sti: use .auto_selectable_formats
In-Reply-To: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
References: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 26 May 2026 02:27:14 +0000
X-ClientProxiedBy: TY6P286CA0037.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:3b7::11) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYRPR01MB13144:EE_
X-MS-Office365-Filtering-Correlation-Id: bbdcf842-5a85-4b67-c8d8-08debace4da6
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|1800799024|366016|376014|921020|38350700014|18002099003|56012099003|22082099003|6133799003|11063799006|41080700001;
X-Microsoft-Antispam-Message-Info:
	ZDrd/Ijgr+aFxDSJU5LZHHsTwVh9FU7E2+LGF2BMrl8QPcMki2MkSSXBvrHCGnzk0RORHNszWVy6Wkt7FTfqyH2lj7PBPWDYr7NFeV+tKlOA37tq+j3IfAXaOezlV9f3ROlQQW1RDxjGFxEPwT/u1tBCMqLhUoHqC5Ljh9mjJuGuy9ytlM6PX/6mm1X3tuPbYn4XzLoFVugdkiFViQF2VOEbrrlVDn5pwa/tWsd8dweLZcynHQHMPlOtRVfPc07t6VMRJGKY+HM2Fe+QIUJaB+W0vuDCYXRjOWRe/hzb/zMoC6wHm60paCauObjEEw491aaXxX03y4XllDCurVDGTfIy6bhoRN95CbPbdZiAgT7uK4FFTZjZHmR6rrpugjjt9VVw9OlGFEVfnrTBEyLHZFD4y2gT7tYHQbGFJwW19ytIZpLfaFe9m6TrjOGJ0AzFJxktSji9jHyIdDko4ghuQMWBEWl0Jx/XMEhctUwmpdmQEj+k5IZ7wmmPGTMqfldxFhg8P+guSE+SeHbpBmqmDnE//nyjBUwS6tNnQ/CSSjRpuX8xRNKg2/i3wD5bUtOuhq/UyRfiS4jhGd2n5IdWE8W0jbF+33YvMtvCp3CFhUanhmUm9Cmhlh1IWitxX9aC+GCaKGxCmXzBxu9xkBOUW3mFOGgePdcuYfK5N8Dn1ekSGZ6jXZbxeYbSLip0JBBSfyOuQp4Xf3/vaC3FHuVtTfI6f8cKsGbjPsTw3XfxeDjii7Fa5GJG8nZ5p/mpNeAigMGzlROHxgsHeOOsrZPbqniqHdZ7oLcfhEtTRWb5iCM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(1800799024)(366016)(376014)(921020)(38350700014)(18002099003)(56012099003)(22082099003)(6133799003)(11063799006)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hm3Y3o8nlOrCPnTcarjBWvrID8Ks6xA/DiV1cdFfScDs8O2vevm/8gjc8pyc?=
 =?us-ascii?Q?C2gfDQe4oAwM2b39hBSWzPuz0RvUGXiQg6j7ewSm+UBGRcqF2TL7NLqGmmPC?=
 =?us-ascii?Q?qZKXFCXBvogoNx8mJVY0uNUffB/Nv0u6DGCYRxpYartpOwkzO2+lYyoHughu?=
 =?us-ascii?Q?XPVDM5FpPf/kA5gd3YESlvUMjGqiIe2Hox3+EEmsR80Py3IRqc1gMfOtU+js?=
 =?us-ascii?Q?d+9zr5VQFjJ7paF7Qnn6JN4b56mlHwdAjQR71ChSdVKm55PyuxrpJn7ji0i2?=
 =?us-ascii?Q?DUGyfXlss4A3JkCI6mG20ANIOL+CY/xSKhVmXdcnj6RlCF0OcZFE+qweCJ5T?=
 =?us-ascii?Q?O0gkozilLMfVeyL/osq6R7aT9Ks686I03AIFOTFBkwjxOvwf47PrQ7kQzAEU?=
 =?us-ascii?Q?7uGcNCJEunSL1LbbD/37ShVrXar0Egba8zkOWTgNEwC09Bvsna8Gxe4HHp1M?=
 =?us-ascii?Q?IUSzk5tbnjej5raGaxFPyzJxhEx9gNsodPAuypN35Tr5yZDUWpcptpzscWhj?=
 =?us-ascii?Q?UxcT5HnRDs+PAahs/lEoLCI93SdGEYee5WTLKfUuEx5DChrGnB/RFxJFus0S?=
 =?us-ascii?Q?K/AcyTiKTlRqBgC+RQOuurrdKRvnoNpyXlrfW9RjkQE2/wSW51R/Y7tkRDo1?=
 =?us-ascii?Q?hkMjcpk/Utd9bpzJvqUXqDaPnztlaIs8Kgsd8/Bm5enOkagEnRswXYjJQO6+?=
 =?us-ascii?Q?rCLYbOJ6r3tcnx/993MxDZhWNlgTCNeR4udM/kst5l6sfEe+iQ52/XF0v0xW?=
 =?us-ascii?Q?iRl0NdOZtOfSZkUew2kC6Ta2Y4mnf5fUniq4SOD5H+eWikMEqDLeq37s7i/e?=
 =?us-ascii?Q?U3OzG3OytJ9OJkCCY1V6a5TaqS99LhvvRjIyM5XQ5G9jNqb5Tn5y3GbtBgW0?=
 =?us-ascii?Q?+W+jwYCAaQxHqzLIMLHG+mqDeaF2/Je9vdRFOkEyCm0Lxts5ldLLnrttRcsb?=
 =?us-ascii?Q?Hb7l5aawzljaRczlXn3a15h2S0Umt42432Fod98DXFYn94nMdwFztIxQcEGC?=
 =?us-ascii?Q?/YJ71Ppb3oQfOuEU8CER2Q+r/oJT14tNZhlstcZV90GSpKek1xEhHyGls9Lx?=
 =?us-ascii?Q?WUFMOTnXQ889GwIkIJ33KVTsKW+b+TxQ9+lXxIbZ9gpN9/8WrhcugWFqAhoZ?=
 =?us-ascii?Q?T5oFhbogRftE29R1TCnWTozH57j5Y8bLpdkkmoRA79VMzRvuEHtOtiuFv9kZ?=
 =?us-ascii?Q?JIyU1/O6yiq2Ifnt8h4Y1LbbjCfQV+Fd2AykJUuwgC1wGXoLU6yGMU9edmif?=
 =?us-ascii?Q?kdFhAvfALYIAFgtE+CdQOMsOTpvieWuA/tr2hVytiOceEseZYa0sdxACGMOd?=
 =?us-ascii?Q?6JYvR3DIL93JW1C5qc2Cq1KhKgVt2eEPej/X8ySgJDBMccnOwlPBNEvkRufR?=
 =?us-ascii?Q?gf+IEHJ2t00i7DENv/zzsqmvz2GFA6dTo7887u3mg6ZXC5r0wWxv/GR6nR7g?=
 =?us-ascii?Q?iZ3zaAYDTkPIqHptEJJDLQehzzn749atv8rKN5T7yEQ9uYuX+WZ9dNNuMkRI?=
 =?us-ascii?Q?h+JVsJYiZyX6X1VBTSKvHYTXAoZily6H43RFwJBNT02iO2i304Hsy0IOHLqE?=
 =?us-ascii?Q?sxD24CZz5RFWziDpLeQp8GXy3cBNJGbnfeMMUP5RvPNMjt6bEmji8QMPHPiL?=
 =?us-ascii?Q?b2+k0IpUgzss7jXSSrzjVdam2V640YSzPTOAU5qTOIH6rFzrNEr8WZUH+ZPD?=
 =?us-ascii?Q?BZEg89CMSTsIg1+7PSjt+VggKzNYMtUMv1RHPOIADK/vCUbBHkk5ZNwy5Arx?=
 =?us-ascii?Q?vrqvlgry++ZM7VgjE7swUYhc0hC3GwnMJMdr2SutquKhAQAelVjY?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbdcf842-5a85-4b67-c8d8-08debace4da6
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 02:27:16.3728
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yxCnGa5sPJrEBDI6o3iWB4rxDG9ipEtuZcJ7MSJMxM7r3lFBmpdBnCem6xrtDGFgFkn3z6O+qRt7HYBOrZVWzExUt7qSuNDxbdW9ydvA//ayIB1/iJhrQQ5FKCfgBMYW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB13144

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/sti/uniperif_player.c | 29 ++++++++++++++++++++---------
 sound/soc/sti/uniperif_reader.c | 27 +++++++++++++++++++--------
 2 files changed, 39 insertions(+), 17 deletions(-)

diff --git a/sound/soc/sti/uniperif_player.c b/sound/soc/sti/uniperif_player.c
index 45d35b887e4eb..cb66bec68b136 100644
--- a/sound/soc/sti/uniperif_player.c
+++ b/sound/soc/sti/uniperif_player.c
@@ -1039,16 +1039,27 @@ static int uni_player_parse_dt_audio_glue(struct platform_device *pdev,
 	return 0;
 }
 
+static const u64 uni_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops uni_player_dai_ops = {
-		.startup = uni_player_startup,
-		.shutdown = uni_player_shutdown,
-		.prepare = uni_player_prepare,
-		.probe = sti_uniperiph_dai_probe,
-		.trigger = uni_player_trigger,
-		.hw_params = sti_uniperiph_dai_hw_params,
-		.set_fmt = sti_uniperiph_dai_set_fmt,
-		.set_sysclk = uni_player_set_sysclk,
-		.set_tdm_slot = sti_uniperiph_set_tdm_slot
+	.startup			= uni_player_startup,
+	.shutdown			= uni_player_shutdown,
+	.prepare			= uni_player_prepare,
+	.probe				= sti_uniperiph_dai_probe,
+	.trigger			= uni_player_trigger,
+	.hw_params			= sti_uniperiph_dai_hw_params,
+	.set_fmt			= sti_uniperiph_dai_set_fmt,
+	.set_sysclk			= uni_player_set_sysclk,
+	.set_tdm_slot			= sti_uniperiph_set_tdm_slot,
+	.auto_selectable_formats	= &uni_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 int uni_player_init(struct platform_device *pdev,
diff --git a/sound/soc/sti/uniperif_reader.c b/sound/soc/sti/uniperif_reader.c
index 05ea2b794eb92..9bfa4ef750071 100644
--- a/sound/soc/sti/uniperif_reader.c
+++ b/sound/soc/sti/uniperif_reader.c
@@ -397,15 +397,26 @@ static void uni_reader_shutdown(struct snd_pcm_substream *substream,
 	spin_unlock_irqrestore(&reader->irq_lock, flags);
 }
 
+static const u64 uni_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops uni_reader_dai_ops = {
-		.startup = uni_reader_startup,
-		.shutdown = uni_reader_shutdown,
-		.prepare = uni_reader_prepare,
-		.probe = sti_uniperiph_dai_probe,
-		.trigger = uni_reader_trigger,
-		.hw_params = sti_uniperiph_dai_hw_params,
-		.set_fmt = sti_uniperiph_dai_set_fmt,
-		.set_tdm_slot = sti_uniperiph_set_tdm_slot
+	.startup			= uni_reader_startup,
+	.shutdown			= uni_reader_shutdown,
+	.prepare			= uni_reader_prepare,
+	.probe				= sti_uniperiph_dai_probe,
+	.trigger			= uni_reader_trigger,
+	.hw_params			= sti_uniperiph_dai_hw_params,
+	.set_fmt			= sti_uniperiph_dai_set_fmt,
+	.set_tdm_slot			= sti_uniperiph_set_tdm_slot,
+	.auto_selectable_formats	= &uni_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 int uni_reader_init(struct platform_device *pdev,
-- 
2.43.0

