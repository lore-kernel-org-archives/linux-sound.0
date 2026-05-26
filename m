Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011061.outbound.protection.outlook.com [52.101.125.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE5152AD00
	for <linux-sound@vger.kernel.org>; Tue, 26 May 2026 02:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779761313; cv=fail; b=V5GhUZ+Dfn6cmWG2WLq8ekx8CPwg2oTmwW3gMu/+8g2m/02psvotqS5wC8/v1kXU4FVY75SDMszLOTGi71Aiv7NJuB5XMPFf5BQcRcAuD0GlpewNUC/XSa9FpJVogOvyb1QlzZCrldFYNvQgeGQUSThrLE32C24xI8lYLQCzNi8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779761313; c=relaxed/simple;
	bh=avMLb1rh+OvCoKO570uxlsDngfjjDkhV0dyblLTANt4=;
	h=Message-ID:To:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Czu2t3huIKo6jOrmo8kC+J8d4K0xfHUYPItm1g4M59VsshIGHUrfH00xanlpkji/TGfoDVRtXc9FED+bfNExq1L2W9rGGSOrU9TBaTVNsgdj5st7cCxY/YwZwGw2dWzF31pgN2GWjDBLPNXWgRqI/o4D9EoUpilQEsnFePpV6GQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=CQTymqyM; arc=fail smtp.client-ip=52.101.125.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="CQTymqyM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K/kI9sXVFhgWI36xnR0YpWszLHxCetnNh1MUTZ1zKdTewGPXL/6gIuaw0DZTAKMA9gkYIhrQvKxmv5RaZROfBlpJbhAUYyBkTvnrnDUcgDUgmDtwOks7J8rruKa4pZMM9rGPKmuqlsULtfnOMzDiZENYGVxGJgokPiPopQw07s9zBthyaULHX3i3Cd5x75v45K2WVEoKcHuPcShD03RHJ5goobuJ2O6DR/bdwd0gM5G7JX/+GFdnkbVyzexWOSHhlRSAEbxy1/XP9R+6uOSXvQmCshYvlYoSwvWUiGGWeKVSko+r/B72fsRkVljpXamc8TiLqWV2OcsZua9Z/ZhdAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mdbuq9lObaEnI/aa4WuJUW68s5SYVLgXujrskw5Iti0=;
 b=F7vMQ4tnOsllDjWCPeHW4nz7EQu0V2YooB3AU8T9mXuOxeTHO/AL0NKFDxEdotMgZ8HP9LFj/Tvq4b/WtD6Tvtz2fRDtdEFv3LvCVsK3s86G/sLNWONXNd+r+GfN0NvTx11cKTTUVc6YcBDLJHlynjC2jyjUAB2Hs6CPml56iB1uCQW6TthmF9hU6Ik3VReP9Uc/8OjuTG8YSnUt6EKVnpgqQwCTYjtesfOcuHpwEKlK3ZMuAfYOFeUU5qnpbWGhLn+BEyRnj5k8bggxQwm9wMW5JTblfj+0MDawY86uvsRRDLBaXd2v7bCw91Y0P9os/uBjrT5Kdc2IeIarlRO/ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mdbuq9lObaEnI/aa4WuJUW68s5SYVLgXujrskw5Iti0=;
 b=CQTymqyMU/tted0CtGsglkd2/Kn3QiBLqYl0k/79xpx/gbcPwBwRoNoADx9WJw5vX4u3aO0AjwOfVaWOr27e0i70CTNKszZjiXaMA3mKbQN5Clt7EDnsAPNE1ErtI4w2WvM429oz5nLzUTJMr11O7/9QzItW7B1DkGU4QY5JiWk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TY7PR01MB16102.jpnprd01.prod.outlook.com (2603:1096:405:2a5::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Tue, 26 May
 2026 02:08:25 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0048.019; Tue, 26 May 2026
 02:08:25 +0000
Message-ID: <87eciyj535.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH 17/83] ASoC: codecs: ad1*: use .auto_selectable_formats
In-Reply-To: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
References: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 26 May 2026 02:08:02 +0000
X-ClientProxiedBy: MEVPR01CA0049.ausprd01.prod.outlook.com
 (2603:10c6:220:1fd::17) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TY7PR01MB16102:EE_
X-MS-Office365-Filtering-Correlation-Id: 69c8389e-2a45-4891-e465-08debacbabab
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|52116014|1800799024|11063799006|22082099003|56012099003|18002099003|38350700014|921020|41080700001;
X-Microsoft-Antispam-Message-Info:
	OIDP/O+o0LC/Rp5hZbG2ZFCvjgvuHfT/okp8Fof+kl6w2EvP1dPUHutTlzGh4fR4uiCN4oHN05/4Z5VG7fNu1tZTdcQNcLYT4JqvG2WIjr8l439LTgbmB3cUN5UaQ8kiabm22di4x7ZeYflvlPB7iK1UYircbD93Z78KcAnj+suZ1JktrrEnd/RirlbXzT694ig9ZkzVGxfZzz3aCVwIAq+4gL+c8BvXuIj1N+tjNmzJJNo3r96rW0qsXTp3tEtjr6s65CS2LwzGXYNrc0ZGjTJXyajc7R487RMYFslxCADizgIhH6HEVQDRhzZvwvUCz3Hj1ZYA8uA/MC/XebqZD452L+dCbK51zzktw+OA+Y9ApFq2fbG8H4aDMHoI42DscLCOTVbYrIRhdBRfWc1hgSt5piTAbOKgU0Rq8zSG/EaKOjlSuSnjTBZv8jBWw6GWc+TNy8fLKcAHKGYkdNt9IB95UpB1oprpvxQxcy87lmAHlqY74kqIFMeWOH5XEeI8swlrimvxPsLKElOCMYrKJ9XhGln8TYZ9rtDvKnA/5WxDz90GWOEWwaLxwVwFpM3lPVJrQkOzSTiJjO3/k6Sa0n8HUzT+U3cUCM70ukjf6x+wOC9d/vCZJ1Q7R9OB6mb3puUiJFZJCGT+wb2QIYwvH1+PkcSURgAlUBkpnZwY6ZZKqwg9FBGhXwHs0wYHN/2btem0eoczD4c5LQ5pHhcH2idBjzpw9ql7zrrztWimhyWTpjF+NwWQc27OmnHsR0lkp7Z/2v7ljnO0e2qgoKEU6pwRG3ouuuycP6GBGf6016o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(52116014)(1800799024)(11063799006)(22082099003)(56012099003)(18002099003)(38350700014)(921020)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?sjS1r+xUOnsCq3+Fpw7nXCwP5HBbGMraj7EGlAQxBY0wQMbn9mr8B3WJNejf?=
 =?us-ascii?Q?KrRLaEiYMiWDlD5RJbIhYC78UxLyHDkeaYOMcl/PM/XS46xrwOqPNwnlIvQd?=
 =?us-ascii?Q?Aw5tru8RUPnI+oiJoEZdqY2QtPXumMvSpFFrwCRAChHKsRc4zCijDGFr5DHK?=
 =?us-ascii?Q?JK+tsHq9mKFILc6Hrl/bZgqYy8Hx2bKfVlyZFd0K4XSdjEVNCKDTwDuO0rMT?=
 =?us-ascii?Q?LrhzGvcFuon9xOyUhbLv0/PEXcLzzgCULkDH9Rb33i/DPbne0Hf995CIu0OO?=
 =?us-ascii?Q?LNuVMLD2WkVHkVUl2mnVW4+12pLxKYipk497VZNPSwNQUgd+f1yy+SxRJU3O?=
 =?us-ascii?Q?Ns2GkgsBIpQ5kQJR2ewtpdvZDZNchuhsij7hDSldw0kbzXpY2C2QDQ9M0COC?=
 =?us-ascii?Q?Y7DaQssAQtP2fHEFacgS7rDbthhxcXvgfH3kXnw/SofJW+nw8nbNaplnww3m?=
 =?us-ascii?Q?OYVVLAXDP6r79SKFImEACYod96tCAHHefOJOrjnG19E9NRPKUMy76fgdD5wT?=
 =?us-ascii?Q?LA1B/1/uM3xrer/mWhY2DGKkJ3bAIoVIDrLd9fo9yV9S51SQx0ywUSGQ7T0q?=
 =?us-ascii?Q?K0fTRb7HTIyAgEZ3Gk2QgTAcmrE8Kd2exUuNIEbkge82y0bfDoRT+UXIZkda?=
 =?us-ascii?Q?Htt8CL7xyy49HJbcMr8tH8QxTDWNl5bZOjBgpGZgQy4efSr+pzroZEzFn+EI?=
 =?us-ascii?Q?89VVjjC96X6Qxre6eDvBSRFUn7kMPD4bdP9Bb6JX6+trEMj3aw8E/RvWDQpJ?=
 =?us-ascii?Q?E0jS5z0+xKMBwMQFtJBetE0hWsU1Xamv4T/nzYnkStHasZrCvlCvl6EbckhU?=
 =?us-ascii?Q?iX9Xvds2L84UVHj7qFJ4+PSrQhSpheOAV4Rfs4uksrSgpU27XK4LkGtnrWpO?=
 =?us-ascii?Q?fcwx5ilYA2IojQgADO6pCbaoiujEgxG4J2KI9a0x+JyRyQupZEwo4dgAsu4E?=
 =?us-ascii?Q?DsIvCE1F0QqF7hL8lkvVs9xgM2d4egOnsoH2EWzm4KeeQGcBh7uw1smI38+w?=
 =?us-ascii?Q?HQK4A+w3MdbuN3pYBpBZgbgJa4mUOj16wzJAxVQu9dfDh6NQOtHM4K3nNo6l?=
 =?us-ascii?Q?vdp4tY4xXiV2X/MKc4Umk6d9rqahpHJQGLmerAmui9kaa2nZkn43WGWop+xB?=
 =?us-ascii?Q?k8d7rRR6M1NCNLSvFNmrG82syv8+QFv9nBOX0wVfjQCAYpFsxlppSfu23oFz?=
 =?us-ascii?Q?2Lu197i6jiSeUO340FqDM0MArYt2C229UT9Jpc06SRqr/VXTCfK5/Gg2V3Db?=
 =?us-ascii?Q?8zoaLdZeeeOYEXmQ7H+qni+eDg0rd31v3+gEAB1jETBhDEaOXJl2EaX8d9I2?=
 =?us-ascii?Q?pIhnaan47KO17KL//qs7zYlSVgEt44aUd3V9wG1BNxRbXc88TWtKp833ztMe?=
 =?us-ascii?Q?Aie2n31RtYwijN3CXq6hrSbsIzvYcnIvSx1AHd1sL7bP2SiYNUMuFLNW0pT3?=
 =?us-ascii?Q?xIPzIEQ67/K52L+LKwPiL2f/u0P2gyT0jhHG/kehwvKLf3MxAG3HvYT2MN7u?=
 =?us-ascii?Q?dPLhxNaoXOM2uuYevfUQHQbWyYN22sp6wRQDlqpNx52kk8nQJ4HUFgZ8QmDQ?=
 =?us-ascii?Q?pK5FTHAmhZFFtSM/1pCQbCWkMTugiZBINWjUEPdCRstd++ZNUVNjkd8kIvYp?=
 =?us-ascii?Q?16Ll7kUwe5dM2dMrtNUXuXSknvSL3UsvELS02gRwziUkw2WFnSgfSn7mlXNQ?=
 =?us-ascii?Q?8G2c+cB/ll3a37UxET0Pa6zoVuVdp4dSl9Hp9shhjhIJnT+9WqFYPnHtb0kX?=
 =?us-ascii?Q?Fk5RXq3gx1t2sFFjgJa3Gf3B+E+mlyRnZ4IByccu38Piud+N2pM6?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69c8389e-2a45-4891-e465-08debacbabab
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 02:08:25.6015
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4g7K5zcuR9VMln7IIyGWM54GELrdiv896n91dAiYaJMee2hA1QV5p+zlFh8Qcye70B8iOKDnrl8JnBILIiieFIQ0ct5BAkBGhKsDPDHSXcUXG8joxJXtDYRD7df9/rl1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB16102

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/ad1836.c |  6 ++++++
 sound/soc/codecs/ad193x.c | 10 ++++++++++
 2 files changed, 16 insertions(+)

diff --git a/sound/soc/codecs/ad1836.c b/sound/soc/codecs/ad1836.c
index 8afeadcaf8b09..dbea83bd49b69 100644
--- a/sound/soc/codecs/ad1836.c
+++ b/sound/soc/codecs/ad1836.c
@@ -193,9 +193,15 @@ static int ad1836_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
+static const u64 ad1836_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops ad1836_dai_ops = {
 	.hw_params = ad1836_hw_params,
 	.set_fmt = ad1836_set_dai_fmt,
+	.auto_selectable_formats = &ad1836_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 #define AD183X_DAI(_name, num_dacs, num_adcs) \
diff --git a/sound/soc/codecs/ad193x.c b/sound/soc/codecs/ad193x.c
index b93531c3a9a40..9841c779b1752 100644
--- a/sound/soc/codecs/ad193x.c
+++ b/sound/soc/codecs/ad193x.c
@@ -394,6 +394,14 @@ static int ad193x_startup(struct snd_pcm_substream *substream,
 				   &constr);
 }
 
+static const u64 ad193x_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops ad193x_dai_ops = {
 	.startup = ad193x_startup,
 	.hw_params = ad193x_hw_params,
@@ -401,6 +409,8 @@ static const struct snd_soc_dai_ops ad193x_dai_ops = {
 	.set_tdm_slot = ad193x_set_tdm_slot,
 	.set_sysclk	= ad193x_set_dai_sysclk,
 	.set_fmt = ad193x_set_dai_fmt,
+	.auto_selectable_formats = &ad193x_selectable_formats,
+	.num_auto_selectable_formats = 1,
 	.no_capture_mute = 1,
 };
 
-- 
2.43.0

