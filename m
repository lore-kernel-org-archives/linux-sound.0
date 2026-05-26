Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011019.outbound.protection.outlook.com [52.101.125.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84F593033FD
	for <linux-sound@vger.kernel.org>; Tue, 26 May 2026 02:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779762115; cv=fail; b=PkWH4yPuylju63/NtgiZFvWwX5xhPr2o7BqGFkGkkfYR46hc8bwAEy2QUSk/+7bH93MMPx/BnpRAyVr9m7/Q4Tpykv4tun/JwNh1QXFmSqipD7eJeharre+lfqu0/ppoAvssG3uXAreh58DIm707RbUbySswZn5lBjnnUteXEx4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779762115; c=relaxed/simple;
	bh=hTeIkFK9uB9PGI339ryD1TbfCiiIlnnZd/CdSUc8dO0=;
	h=Message-ID:To:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=ZQdecS976pMB8ZwrsMbrCU0OnNFOMIYK8m8x8zeevtSWWdNK9wgVlrABlp41xrNz4do2Q+oOKgcd0S3cAVVQXIUmIqLsGcAg7kKkjxD2zXC8BiELFHYEvx5qAzwbDJWSsT8/7zLAkH0hCwJUH3g0q1n4mQrW7o8tm861QF4iAF8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=HhO8yW77; arc=fail smtp.client-ip=52.101.125.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="HhO8yW77"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lcA+J6z49TVT8XAbxnJe8KX6gey4sJ/kjJNRFoYHsudAtFIsztHBcwZpGPWtcmrKQ6/NeXNlbiNgVSgfUHFDfKcPwNNjs0S4aJJVCCZN1JtUTKcOOoYfLQ7yNw7O+VUUWC4sB82QFKD8lDUp50n+fhtEtUQSfzMr98hPpWsH+MlnR85eMxicnI9S9iAEZvYs2K2OENiIrS23zLZAANjprX9A0pNTYjzLnxFgQneIzZLZbvBAAwR1s4MDqG7Dk+ROOuagpCpxoEDmlJFiYnHl9tyWlowzdknEDTdGZ7WHmRJYIlwn+h+/yMVqwEfijqePgBnYHL9xnEKttqjKfzM+iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cHUc7PAa2h2siuqXAxEtlgDAI9m7kM0FmyDFm5Cz5mQ=;
 b=HpzlrPvrxiQxhLoKxFEc74FaqA76M0RfEr2h4jKe2Q30Rs7UIHImOBeCNkPk1LNpDTDLrTrYW5AJaRylnqv4WRSqLCU0aQB4mECQfTEd32BErz54BsqTDKBUQzd29Ni6wIpFwJYV/Yd1HmkH95AdAx5Ixu45FGSrJWvz23lt7H9tzB4jJOuXTGuHHmdMZSW2v79E0cAShG0Szpwia2ZA8w3obm8U8Xo/e3Y0M4wtayDrn0cz97WbSwyxCMsU57Uw8TgCajoYuYCK2E+si/OAZyYzfWvdDMYsnI5t8Bh94fBMKpIayasc6cE2MmmyzF+RaU1rnNU2bTa/vO7Dja/LHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cHUc7PAa2h2siuqXAxEtlgDAI9m7kM0FmyDFm5Cz5mQ=;
 b=HhO8yW770oTEJqYvH/9f/U3sYVdlkl88Ai7OsVG98vul+gkUmlgXJBFLjD+UBcXZJ1a9b0QYDhgHgU9J/l52dxpgSaQQeBaOOTyN0Nx0urm1hUwbbWFPE7cxqsQGYrM4AnobLsiC/INmVyzjdN1+cpCuvUHkL9N9E3/o6xozzX8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TY3PR01MB10158.jpnprd01.prod.outlook.com (2603:1096:400:1d9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Tue, 26 May
 2026 02:21:49 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0048.019; Tue, 26 May 2026
 02:21:49 +0000
Message-ID: <871peyhpvn.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH 50/83] ASoC: codecs: src4xxx: use .auto_selectable_formats
In-Reply-To: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
References: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 26 May 2026 02:21:48 +0000
X-ClientProxiedBy: TY4P301CA0082.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:36f::14) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TY3PR01MB10158:EE_
X-MS-Office365-Filtering-Correlation-Id: 256c4ee5-49d9-4168-35c6-08debacd8ad0
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|7416014|376014|22082099003|18002099003|56012099003|38350700014|921020|11063799006|41080700001;
X-Microsoft-Antispam-Message-Info:
	BAi8pFJbUXoIRgx3CNgOocmr3RTEaGlqxBg4xTb0c70U2u+S5CKjRL4iDqD5a97xzBhtLh+a6+svjF+K8HhgIWa94CMLqLhX5uU/Q2xagWK8fWzQRF8Irhk7a+pZdp6TnjvvGSOncuamKDVCfe3UNEBvXAp3z9Im1gDZZZqBUcl8ee+woGo1+KFa30R7Uj+yPNTvM/hsXeBYslRpcb0NGE9WCSI7eaaC4xfZ5ACwOA3MUuiqkCBycHWbDO71Kr6JSJBncRY6mTJbOzV1PvSa9yeFHtn3n0KBQtsHJtSX/3vUJnnFF69/zQNnvm1LJ2O92g9p+aN+u4r8y9Stm04dMVFi2xUCtm3tery3FODuFkcA3c16xoJEk2dkfTM7xvZKeFwGDTokfkdd72lN6OmAUIyeR1q440rGUqXyiP5Lm2SDupQxjRR9WZIeMg2UkNPD04KOCO6YfoZ2KLIMM0Bdbex7GbST4Ah0ZTr1ZV7wNomfprG2EHWbvJRZgDhnhEjX7b2sBOl1o9cfTZZqC+DSKo/2EiGX/+gZJwLjWYWLNb/dW29lcJky6b/eReDMNZ1xxQkrlwd8BYO1r+yG9iQV/Qh5FizboKMh/Tq0Rfo4ahNUek/U8w9HnU+U7sUYKKL3T6Zn0kTlMPYYGHBNYHk/nMYyLpemFzUvlW0piSG37OaDEdTZ47SlzReJ3gLrm5uOXX+cMO0tmVYLUif7wtjFUcN0qdrfPKCayzVeuKL0PiPHUtEulRiobelwLBCPG6iEdzi1+/CRxP3Uqz2MV1oxRY10WdW+AlAJI4BMsmYJ4fg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(376014)(22082099003)(18002099003)(56012099003)(38350700014)(921020)(11063799006)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PlZiN/5qbTzFoMzRIVZ1tuvinVsuDtYNRewrMeqf1c56cKpy2tewVT4FZ0EM?=
 =?us-ascii?Q?sf/SzDH3//XcMZrpfES+2yzGkKh1KwQKj6d6SvvMNs2rX5ckJXhhNv3bMiMT?=
 =?us-ascii?Q?fw1H1lKDMb1PyQ2IXHSI5/sTY0V/t1iStjR3xejIndfJEgHCt6PxARk8qIxv?=
 =?us-ascii?Q?d4FmH5lIu3y7u8srkqDaC+FigPZl/d+FSMgH90EHIVffYZD9mB1Ozh4jYJ77?=
 =?us-ascii?Q?ALYj4nP6dN1YD2Bo1wIN5lA6MsikhXLUmnNItkTZ4yXGphdmMBZIkcb8c2Uz?=
 =?us-ascii?Q?pnyxJbqLe7g2XvRyKybx11uOYD3CnLsF0bAYrD2Rfwen+kscbkH5FI4jfSvf?=
 =?us-ascii?Q?rEGfH/K4YgERdCPacEhuM50X+ZNysXjbqFGp6Vc8ecwwskljW08KY394u18P?=
 =?us-ascii?Q?1AE4lNp9agBncG1wRI/Iy54H2xUl4DUylblegQcL35KKezTwPsGTewDM/gvE?=
 =?us-ascii?Q?6Cjk8+8UyigN1YNWmikM5GDLZwN+27kfsrWDXfGatVN9LGHmZ1Dx4IcUMGp/?=
 =?us-ascii?Q?Lbqrd+SY9SLb7SKP/Yjn0C8Uu3M6CfwgHRbh2QedKuCqJ6pZLEiJ5gDGmaVS?=
 =?us-ascii?Q?qM9dnKbxgcYN50dNWem+Oz9PTf8DE+bzVSZm2j1uiwqK5sQuMrAiFcGLXzrG?=
 =?us-ascii?Q?e/eJZBPr+pk/o0XeOooE58+11HSasIm1BxmizOfnoKFNRNCbh/FBiOy0TtGL?=
 =?us-ascii?Q?4YaSrXgQ0h4B+FcPdx4Ei+eTXskAoJYtPV7hAqTAlskAl8fPBxIeVPUhZP7y?=
 =?us-ascii?Q?reV9YnPBm3a+RAX/UgAB8T1zgT5U5wA0VoPtQOsRJFT7GmJtIDrZz7tO7zQH?=
 =?us-ascii?Q?CJXMoS7DPAun/FU+QLzV0yM3hxiT2HzZdivv1Zqn0EmTNJM6DZHjxGShaksi?=
 =?us-ascii?Q?g7kfXP6j+29kfWzxFBgcLTVwk018mybqyzZ48HNHAyDjfbx8LX3cGjfQ4Eiu?=
 =?us-ascii?Q?Wa/k2VVw8x7vrWB70JwZkfiMt6hig8VNZHS2YVtkXVhCtetbsyQjACkvtHQM?=
 =?us-ascii?Q?sbikpI5lhHTsWTl2MzIsyRazw1oxmjZF48xB+nGNA0pFvZOb6TBj+k5OUyXK?=
 =?us-ascii?Q?hcQKA1V1UCVyBy+KwWNArTIzz7RdgI4DiJsd8PRXUoD3BLX1FP56xlDY1LES?=
 =?us-ascii?Q?YsQpomFs45xUlOQwNMwpdKhZDh26WLQFYSgMXShDTf7ZtzU1ZXsiM1J9NoLW?=
 =?us-ascii?Q?W/x/pscyY6DH7mxksCjIqbmxR7j8NFueJX5/XwVEshs3Pvw6y9yUkoTRbDC3?=
 =?us-ascii?Q?UMlH1Q0IKgIFwNJPBWJluAA3dU5pC/sj7Gh4+fAAOD+XbfhBLT7EcRdamQMe?=
 =?us-ascii?Q?dM8RXzjB8uZghUq5O9jTTDyvYdYEmJzKErFczu+9MQ6PLAfBUjWn5+MRUcml?=
 =?us-ascii?Q?dfMVBdea8cQm5FaQ6MMq4dlu8blMtCnQf2CKCHp9rw+Euz1PY3xMIJXh0Kyp?=
 =?us-ascii?Q?rjBDA5d72xve1ro3HvnVrPImFYqy1DY5Uphlel0qEEmbQiYpLhetI3/FaVUN?=
 =?us-ascii?Q?UuUYfjFlL3zW51ccy+7ANwXm/flwyJlzJnDZGNJs1VP/RHF+SDP4s8ft26UH?=
 =?us-ascii?Q?6p6h7ZAvdAEcrLQBMWvBnXL0yuqXl+lupEbQiSuSVM8wHxlskJ5Jt+ZTFlMr?=
 =?us-ascii?Q?TbdmOlFVySH56baHQ4Q+U957H6b/YbXGDl1FZemwPWdyFlUSglCgC5JIf7Lb?=
 =?us-ascii?Q?oCxfUj5MSMfADQA7Gs93ymzTlxC2kCfnWHmWH4IT/IuIJeTsBOVQTRGU36Hu?=
 =?us-ascii?Q?yAD2qT8J0QR11IWC1x98aSxJSZ/O9h1zmhAkbzlm7Wp7X5iyz9ez?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 256c4ee5-49d9-4168-35c6-08debacd8ad0
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 02:21:49.5101
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WcBE9dSyWQ0kN0LNSyfXDPZvm4dwUKVF5VQdwucjeGF2U7UI2sSdXwtU7GGe1j3ApRFN//h3YU/ihVtzpnxXN8DZyQqBaKDPhGgC2dOYDB+FqHkz6ZVFxZ6LGUvlvMz2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB10158

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/src4xxx.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/soc/codecs/src4xxx.c b/sound/soc/codecs/src4xxx.c
index 5a34894752251..6e187c930372f 100644
--- a/sound/soc/codecs/src4xxx.c
+++ b/sound/soc/codecs/src4xxx.c
@@ -326,10 +326,18 @@ static int src4xxx_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 };
 
+static const u64 src4xxx_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF;
+
 static const struct snd_soc_dai_ops src4xxx_dai_ops = {
 	.hw_params	= src4xxx_hw_params,
 	.set_sysclk	= src4xxx_set_mclk_hz,
 	.set_fmt	= src4xxx_set_dai_fmt,
+	.auto_selectable_formats	= &src4xxx_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 #define SRC4XXX_FORMATS (SNDRV_PCM_FMTBIT_S16_LE |	SNDRV_PCM_FMTBIT_S32_LE)
-- 
2.43.0

