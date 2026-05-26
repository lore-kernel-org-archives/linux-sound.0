Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010014.outbound.protection.outlook.com [52.101.229.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 821A628A3FA
	for <linux-sound@vger.kernel.org>; Tue, 26 May 2026 02:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779762563; cv=fail; b=OJIusQokbF5UQGzutgbEmD7UgprflB/yw07pcnwaYfVNSA3TK9Dr0H1gyb0Qg68ROsFaz8HN8KZnn+2gsqnZyZtpm/0kxNxMtRFOe2ml3V9czYN2GWod+joTWcpngJJXdarLIAlAEnfe+/ln6AbCuzKREJVOVHXhCbVAmLTwJn0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779762563; c=relaxed/simple;
	bh=cPIODit+/1gtMmuFH/rDXB6Ybx/IIcWyTJWlohF/WNY=;
	h=Message-ID:To:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=pwDNXPbNuA7NzS7LQs9OsJmvQk09//JtzucyrVTQJgNDk2fst/Fpk5MaWML6g3++5gjCGjAPqf494bC13l9SpJ1p+AfPeEl3uHSKU2Myon4N0e0c1Far2XGzC+oNwZpskS6yvklZgr1z4OM8S8+MOu0uG/va3Dkji/Y7krJ74MI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=EqlI/uSh; arc=fail smtp.client-ip=52.101.229.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="EqlI/uSh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O/Y9CrjuYHfXmY9Y7NCo0GokZd4/m4uZkKZtckh3jvhos7DSmDXWxDwW+l+8eA9tqXFgu+WJrmr46XzeeppV1bkZkDfoVn9at1JrxHDsYkGWKYILziQpKOEjr/YiiILfbNmj1dWM6ADFZN152lpoSLt+8ihOvNc/I6GehwHwOAmSfroMLGoeyP0BFFSzHKJbQ10034VBOKUtaoePSBE5zjlg/mlhnRo5ls3VGXcCjfkc4oPxkwSfXYuDL03gjkBv9UUNLMEODNx4X/v1IfAxyqYQndkPhAY9Cc3/ZFHwNr0flP4z/vkwgITlbRUXVdnIMM4Zs1yNF5nqfqeMGtRV8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+qKg3fv+I/bWFUGZOtxqjKP8FcDm62dWTerSGd2EXMs=;
 b=LlPqtZmR7cqn4XZuAYt4VC5u0z83Kgp4unsff2lVaENuJEIqTOVyCu2i8Ni0JItH/Oeg9m9Q5Aeq7LzgdTEnUsl5nUsFRh6v45y9vOVgo6CrqoQyOfqEqbF286vQVrSYwNDLVOWmbze5xp5tInFMSr6cUm7ug9AqEdIUVxsplygxPxvBkcAwWcWduLslxJ5qdAS84OQuLrr4cZ/vGoqwUX0zUFcd9c7wjnqaC9v01Lo2Yjh2Orr25yEXGqzpsjnI6Vs5wuebDvGpTWN02MAOHpvWb59FGTeuVy7kZ0UNCg+ClRe64Ssx3wKN2uJACBy2cPiqIevblsNG8oaqqRHJUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+qKg3fv+I/bWFUGZOtxqjKP8FcDm62dWTerSGd2EXMs=;
 b=EqlI/uSh2PU5JfSaOrVyrVg/eH/2SR8UFC8Zuif/SvTBl5VA65Hp4belChsvdpuvAFxReCCxYhwR8bEaj5jGmO1xkwzG2/iEkxtb9SAexirGC/s9H6F6nLJCJheviioC5gekPiyd1ArsPiYT+is5CzlHpX2iixmzD9z5b2j13a4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYCPR01MB11158.jpnprd01.prod.outlook.com (2603:1096:400:3df::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Tue, 26 May
 2026 02:29:15 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0048.019; Tue, 26 May 2026
 02:29:15 +0000
Message-ID: <87se7eewf6.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH 81/83] ASoC: uniphier: use .auto_selectable_formats
In-Reply-To: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
References: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 26 May 2026 02:28:50 +0000
X-ClientProxiedBy: PNYP287CA0096.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:2b8::7) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYCPR01MB11158:EE_
X-MS-Office365-Filtering-Correlation-Id: 01b9643d-be58-4817-6b4e-08debace9494
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|1800799024|366016|56012099003|22082099003|18002099003|921020|38350700014|11063799006|41080700001;
X-Microsoft-Antispam-Message-Info:
	6+V4lev4ul2WqckVenKmfZ0cAOYWJrvYzmCaEr/KuLyTQNiEzpF/wEIvLtIjqnDuyy05Z3/4WQi9B2fQGFdBGJ0lffAy9/r9GFxdXAzEt0zy/CwV1kuybq1uSuiW1/W5bUEdvEqZopdCBwyxgYeEjQA4myBmxTd8ok/8a07Xp5Y7C1I+VjSvRk295CY09efQTYkuZ0fPYpqyS5o6Vx6NOhAVkN81QOa0jAh7ootWzU5ZZiTUas4uHSCBSFuDLKFSKusUGERRMBTARC8eswLMK2Gk5uDe78vT5htYdGt3lHhS9g0pDjx38IqCO6yeLrNzRJotL535dXqSMPZXy+X7o+Sxo15v1fORt/2kfyDy3fcb+JQf4v0nZO8DJB9o85Plv9uwZJDkazjHwh25KKDIahz9wbrwbSLQpUdyMxLGvxMHgwJbtXVA7VYiZTz1x8EwAXi/Px9p1JvMaurdVE/NF9+6pewxw4GXfprpUmqbOvgHtxn6A1S4MK4PHzU3iGWZQZbYE2q88VZb6q8Ow9aELrNpBNap6VyRYyMRQzCVc1S9TCUKp1xCfyCvSiDPm8RSMabGxD0Nzn9LzsPemFzPslwnFEbxpAuvaGfhgyd0pDSyTJI3hjDs8EN0ZQATel4yBIsZIZmgTD8qoSJNk2qkjMT0ToqaccIHF9mLbHQfDQTYy5ZnMLj/DlJ8J66HHGi136UnyFSmVsFB9b3ShziJwKJwXwqwn4xTRbAIHXz93H2VVj1XkE8gsW3ZzaNUPlEsdnAYrSjDAOhCTlF5+3V6BlSayEdfAPk3Gc7fhhdthSE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(366016)(56012099003)(22082099003)(18002099003)(921020)(38350700014)(11063799006)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nks/YSUs9e8/K/fF0PwWAjb1uvUIxQrtrZ4sh/lr84GjFBMZj2Bq5yilQv4O?=
 =?us-ascii?Q?9/AaV1JWLEpGBo9UNLnw7jD4cASu8glub9+1UbofDkmv18tFfpjbXHiuV3MR?=
 =?us-ascii?Q?umROrYxegNpr2wbemPpo3LLJ9ehKaz46VokAV/Pz1LA7LhXIj8aSiJ5srzsq?=
 =?us-ascii?Q?MLKA4dw0NftpubpN2HPdoJcDbRCbkdmxLGMTg0G41Y0upVD942gzE0cDZ6OX?=
 =?us-ascii?Q?SuaTR3Q/kICE3uz3YFZHWt300u4QjVO0LU5PV9njEXRnCMvbeYsMEmqtMJi6?=
 =?us-ascii?Q?SMMxrkVuKickb/srRZVkI0nc4auLiOGg2bDyVs2XWn70HSeGR7G5k6yz9bvh?=
 =?us-ascii?Q?2mfotnSbffK3n5+Gm9I9gZETqptTvbHQs0uj/tFsRFEGRbR7P6k50+8qn08x?=
 =?us-ascii?Q?8WI0c0OcGz+BMnVbK7S9YtnboDOF9aJAF97weIhE4RB4V+0RJFZ06KCRo24A?=
 =?us-ascii?Q?rJHJlzSRmHGzfUeymkslA6PTrAQgF+6ic04CCKUK9iF43jaPi4uG25AIp+Js?=
 =?us-ascii?Q?V1c2zHPhEfatZnydr7oi9drt52fDOg16cILTWfL9WhmaXTN6FO+wLE+mjxi8?=
 =?us-ascii?Q?QE2cz03hX94OzJ31YqWlb2Me6SaJwQQd9LVn7G+dDlAG0FAzMT/Y7IoSzCYC?=
 =?us-ascii?Q?Dg8oyISTdjnQP6ik5xXmK/lbyAPlZa5dX/Xhh53XutY4Xze54OxVCEraYp5/?=
 =?us-ascii?Q?N/krbEYgz2wS0k/FGf8OPMny9mX7s4OCRzB2xWnvEO5QpIa9tCoA9nWObxhQ?=
 =?us-ascii?Q?uL/Xm30pAMneWQpD6xr4AP/RYnxMDwhQjKEpW2Wr/ch+azcoUd5gxdSkn3Yf?=
 =?us-ascii?Q?XDozhpORVgTHqtBGuqDByaJEZPlJPWhxUWUaj+wgkmSLuIvHzPMTPb3HZH3o?=
 =?us-ascii?Q?rJHJq+BYD2d9ELGl8cbbqVbRjNweZI6oJzHqgxsE7HBqHE5NHGEfURKBjTzq?=
 =?us-ascii?Q?gJ5WQqJSk96ONPrnMKwGaUhqcxAPrIO/UiejV0eg3/1u4xRCbrPEseb/Ns3B?=
 =?us-ascii?Q?AfPq6UalpjybcyMhWOM2eqV1mDYbWcpto9JskORRiW+b3d1Ts+J7/ntFbbk0?=
 =?us-ascii?Q?9fwfzFXm4QNsAJ25tY6gAagYOu44FxStQ069IlM+7a9bV8qe9YN1XQv2nnB9?=
 =?us-ascii?Q?0y4fF2BOTU+zJrHTboZJiV5xxQDfBB38Zgk58r4mAA5ssAWc9AGLWUaH0b+S?=
 =?us-ascii?Q?/VxNBcvhA6hqqexCmNA27jHTXouOIf1NoR+NrKRkNW5+cInMD9LvVDBOmR+T?=
 =?us-ascii?Q?QqeH7OnAhBsh9l4G6RBDToaM0Mrs3h/nj2+9GASh1XAAdcCmllc4ahvQj3uT?=
 =?us-ascii?Q?fWWvnqY7FCfvUHPj7ThicLrhL+ltDt85CFDZaP/+K4z56M4nm6K+OJ/w5htX?=
 =?us-ascii?Q?Yj+uWb8dOXL5MBossuAAihJaVi9EFjzFwRdoXMtgx4BZ6UfLGascKBiviZwB?=
 =?us-ascii?Q?GeNqn0crNVS00BRHSRCLS0voe/RtZPFFyZdIFsbtrlAnRXDfKCmYBIr6bsiq?=
 =?us-ascii?Q?MEFEgHqZ85qEHRMO7DMNrvm+tpyvHpQHhviAuO5/QcqlP+O/W+dB4n5rwK8n?=
 =?us-ascii?Q?iOl+MGKSfZstkixUE6cVcBhyf/3/q/QzB8eJxjVR+vVCStA623KQ9Z367D/g?=
 =?us-ascii?Q?tGXNJYa2awJU8h++W6StT80oXG9mL2IahR7EQwqF0V8b1bYW42dHnhxX9/fn?=
 =?us-ascii?Q?Mc2JF8ttkDZQAEjxM57uKpWtp2MNeSGQFUpHzN5OimluU0LyA3kaAUyTptIo?=
 =?us-ascii?Q?wydUunbx/1T29vRSuSaKrlySV7B1SG7+PXUil/6oQJvc/PAebL83?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01b9643d-be58-4817-6b4e-08debace9494
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 02:29:15.3437
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j/Hx1cnm0ikLNrmui+AFaj/2yMqt9XRLTL/2g0uFopvDuAXuFJ3VZuGcWNVppaNLCPMjEtJZ2vMNVjiK7hUS+PGdxZzKRmZ0o1iU+4OHY9gZmcTiZZ9Kk28mq6jLXILT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11158

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/uniphier/aio-cpu.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/sound/soc/uniphier/aio-cpu.c b/sound/soc/uniphier/aio-cpu.c
index d3dba21b2d049..a72e7b5864107 100644
--- a/sound/soc/uniphier/aio-cpu.c
+++ b/sound/soc/uniphier/aio-cpu.c
@@ -440,6 +440,11 @@ static int uniphier_aio_pxs2_probe(struct snd_soc_dai *dai)
 	return 0;
 }
 
+static const u64 uniphier_aio_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J;
+
 const struct snd_soc_dai_ops uniphier_aio_i2s_ld11_ops = {
 	.probe		= uniphier_aio_ld11_probe,
 	.remove		= uniphier_aio_dai_remove,
@@ -451,6 +456,8 @@ const struct snd_soc_dai_ops uniphier_aio_i2s_ld11_ops = {
 	.hw_params	= uniphier_aio_hw_params,
 	.hw_free	= uniphier_aio_hw_free,
 	.prepare	= uniphier_aio_prepare,
+	.auto_selectable_formats	= &uniphier_aio_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 EXPORT_SYMBOL_GPL(uniphier_aio_i2s_ld11_ops);
 
@@ -492,6 +499,8 @@ const struct snd_soc_dai_ops uniphier_aio_i2s_pxs2_ops = {
 	.hw_params	= uniphier_aio_hw_params,
 	.hw_free	= uniphier_aio_hw_free,
 	.prepare	= uniphier_aio_prepare,
+	.auto_selectable_formats	= &uniphier_aio_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 EXPORT_SYMBOL_GPL(uniphier_aio_i2s_pxs2_ops);
 
-- 
2.43.0

