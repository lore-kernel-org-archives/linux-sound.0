Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010011.outbound.protection.outlook.com [52.101.229.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B4D42F7F0D
	for <linux-sound@vger.kernel.org>; Tue, 26 May 2026 02:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779762337; cv=fail; b=QsIl5QjwOYB2FWhCndpZpAa+eCXYUyktydX5InTRF5ao3VYKS29ejKvU6VSQHsM9r2JeDbN1qKDSbgLoppSnQId+tWZ7jVk9gaTm2dFdiQYd6HC8UgwP9j8xNihay0jvBBoLYim/pOFx4weyOiANmNxlrZrDR1eZ1OJDqHzk5Rw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779762337; c=relaxed/simple;
	bh=kxrnhR87vUWukayHGlogcYAzMgwHfuF4nL1iQFtdnOk=;
	h=Message-ID:To:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=YI5aaomj8/cTPD/KSj0xIcZzGr9ZIf1N+kwZAOSjdrmG/atkBfOJdaNOG4ODICfvg7zb4gxidJ/Opqc0C9r9sBLICLavO0M9fbceIaSiOXE1UBax/s1NXqC2amwycQn3hEBwRQZVZFpepkHwYRMkvcsyhxsA5hhN0FKagrTFwjU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=kaEB12jq; arc=fail smtp.client-ip=52.101.229.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="kaEB12jq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eYeX8dpYsKFM9oSgEdn1/OWAi59krt7CbFSRNa0DX0JoAWhl+CamWk8p9i9OuS1iGcS7TnqLFfRsUwXqmFRvtnWSKrHSuZ4P0x5a1KEXtEbDNLaMeCr4789tVs/FpS1LajMf+8xbJpLBzrbFcU9lKYfnfS2A4f6SVVsAr3y1Dpf/i/Z/06tt+Bu10XmPtSE0aYvjtsR7TJFlEP0XG99VvUU7MNv7WVBVYVR6HEcoAWGIY1YuKFVrgeovkc1bm0V6HOPXl4gmEZE4jWP4DvXBt+hrtDk9dSxWgnoWs/KpKdgEvPaQR5ZQvqZ1QDRjUThKluZDtOMRyAuEBxUx3zKBYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rBdAbFVoGyTz/PVrGIJdIyUaJnahvAAVqUeGCumt+5w=;
 b=nCwwzS0xPM1RSO+6SMklbHpAX3fsddzVuJr4uvbfIFJZ9KeU6vU9TPlVd8tO5aDB6wFJe5H4lUwwNmC1aFAgeZBNyBrOBMbQSAEo/i2xdYfPPO/YlxyjN/5M9bXZBIc/coGdhx8LoTwdf2meTpglnhmAzx3xEAI9Nw58H5IfVVFMoQCSh4O4yHEXkeol+8bgWmKnQ7RCG0db8/Vt/LLK60FDeuMdx56zzmqxHYcqIM3BeBFzVMmQoSWjTA6ZTkN54m+zmPUibKSOTzlqtAOJSr2rmUF/iRLDEspzi48RL065ZWHXXB6a3sR/yr/qK9bVx8uJARpQbUn/imMDX0zAdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rBdAbFVoGyTz/PVrGIJdIyUaJnahvAAVqUeGCumt+5w=;
 b=kaEB12jqc8npu3VDMJafJTUzLQaXDgEvnjjos4uFrwrRx+gp+nJrZfADZyQJ0gTmjomBZcdkh+nZ/Y324mjIJ0YDhr3XAFbQ/gKPUDVhoLk65wBj/nbDpv/aA+QatCmdqRNMDJZ6K9XGFenZbTwuOY+gKEAQyVR2FSuPJsX3ALw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TY3PR01MB10158.jpnprd01.prod.outlook.com (2603:1096:400:1d9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Tue, 26 May
 2026 02:25:32 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0048.019; Tue, 26 May 2026
 02:25:32 +0000
Message-ID: <87cxyigb51.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH 67/83] ASoC: loongson: use .auto_selectable_formats
In-Reply-To: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
References: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 26 May 2026 02:25:31 +0000
X-ClientProxiedBy: TYCPR01CA0182.jpnprd01.prod.outlook.com
 (2603:1096:400:2b0::6) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TY3PR01MB10158:EE_
X-MS-Office365-Filtering-Correlation-Id: 326d070a-1007-4ef5-bb4d-08debace0f85
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|7416014|376014|22082099003|18002099003|56012099003|38350700014|921020|11063799006|6133799003|41080700001;
X-Microsoft-Antispam-Message-Info:
	kC5F2K7C9b3MPXTXMl3pvXwrFrP9wcn7o8msIEfjfGc/CENEd+0FpsQHcq+pksqB7vrOLZ95tCWL2CUe2T4bSVWjYvbizRBvrNulMI4TAgFmDI/9xnCfE/06IN/ynlMWfu7lYIzbNeuPPjtnyOv9QQ5aYXMEVtJXzuZ85BOL9WorQF8EPQBwoEMU7FykVUhmm4ho8ZnwbsvEOLA96HolPdwJbGy+XDMyr0f7LsxEtJdQtTWLFbcBO7ijf3ayrFGbIvAYjwnRCdnttSuqFksay/GVMs/ZdvjSmY2LJ8QvpPwsAoxfQ5lyaTL0weAB81n+oKFFGrgM1u9QshUBpFISJ04/k1TA4FPWt9zNx0qrRkSm3VE/qHmpGNEeP+stCexITMOOPjwgc/ysD+SqYg07Y2cDzDF9zbTI/crDAPj/5zzp6RecfIFQrO5EZGMBrT/qBaeH1Y0zJRLskhajWm3fNCdXaSEq4vo5m+4jZfXAz8WNUVvb8N22QlSgSxFNnSTnmh3p1a2fuH2vVViTJjrKHDw1L30YryHtNmKcGWUuB+JJWnYGwKcC/VeaA+w4Farlps6mN1GRfaEQFTPi7PpsSFP5JIy822OcPwgcHI17GAL4ZdHteaY0CAUtKpQJQldLlbZeUochaAPsFku9LY+WPZlhfCGBW298pMrK20asywunFe+E2NWFOOSC9uhGPHEu7cYiIYouYvTNQEMrZ7wSAmhKwOrl00KYRxGSAHEdGQuL70QKTTAjytSMpRVssTwMbJNVQMirIdH1B2f4N+x36L+BvoSkt9QT9eNn7ui30dw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(376014)(22082099003)(18002099003)(56012099003)(38350700014)(921020)(11063799006)(6133799003)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?TlK0FlcVLTcFGUPkXSuS3W3Y2qQ65nA84ousOUQkg+eZ5utDBc8d3FaRF1lW?=
 =?us-ascii?Q?U0ezYdmvF1yQo14gzW6+cO/t5lWxx542gPJLC1fggpReh8n6BAjry+ITrS9M?=
 =?us-ascii?Q?FNCC8E57gDVvxBr+Oe7QCRf9EEmvYNQPuKhdp/hNDtTuUZSk7rCgB1uoWdDH?=
 =?us-ascii?Q?aau+/WcaevJlcwXeO2lKkj6b5+RbR6ugJr4ycJqO2/SrlXcffUablTSMfT8k?=
 =?us-ascii?Q?Dx0Q4VBdrft7+q5uAc/g+RZ+7iD5oHTmRpTLVppAfmIkWITLb6eIHIzFrTXi?=
 =?us-ascii?Q?8iLVp58Uy3rbqzRmZ3+nByE1U2tVbujArOfJSNIt7Qv/gFmwDX/3GuNt7Xto?=
 =?us-ascii?Q?zb55PV4F69W+ADW72FFestFBzcBCMQWvX+OuykzRtX58ZUZZHlqkJJ+LY7Bt?=
 =?us-ascii?Q?InIaluKDio+y5EsPW6fDuBZ9ZvgOsBPtIaev/O0l3wH00kxGbaFKCSQNVFXN?=
 =?us-ascii?Q?30dri2P3VEAxNr9g7XTbKiiKtpNkklO1v5whhziZmFn8i2JyZMOio5Wng09Q?=
 =?us-ascii?Q?fqLDmJLpCWhKMnVHO2OZLieEbd11BHBl2tjzekrTLQY8t8IZtwKlawbUlw1n?=
 =?us-ascii?Q?hxbIchk2xRRWCgU77pnzd9wGvqzoi8HO1DAaggB8goGCpA+inEJYjvCd6ERN?=
 =?us-ascii?Q?JOpzWviONODCb2qUTtmjY2rrUZlQyLFwkJ9Ah6gehrdK/BPoZ0sUslnYDPux?=
 =?us-ascii?Q?ukNRFGAMfqATd3sqwi00AKxozdW5iMHUQe8F0OoaYz74MwCSVIgBJB/j/ocN?=
 =?us-ascii?Q?yXSoE+J4UHX6in/BhGct3w2q2lJdzaSugxO4+T1ROcrBuL6FEJYSfEmDNQRs?=
 =?us-ascii?Q?f++fE6dMnEOkuM4OOIizGhKD49zznjvYLqqLHmjaZeF92iWrg9b2mv/WeTr3?=
 =?us-ascii?Q?t9PP7S5ak9iCxqA/XDa2/AHAlr8wkppJd6wReYvn1l4wFm2iYiMNTuTv3r9G?=
 =?us-ascii?Q?g5F2aD5qgz8X0g1GyVq6BQJRB1iVxFTT0FumqDrzrGxbJoxREDM4zg/G2IqA?=
 =?us-ascii?Q?c0e5Viatx1jks1mElljuuQm+NMQNm+SwcRzaUMkbgKWYTrqnu++kN7X7nI7H?=
 =?us-ascii?Q?UwBoU7fXFq/O+tv2MlB22Z94nIKYA7V5J4VHps+Y4mkI8dpGuIWyyXm+GtNi?=
 =?us-ascii?Q?hi2W88Uui4+S1El05FB5TA2/gBt5XS8ugxC4ibf9ujklkRjsUVYAEwN3dy19?=
 =?us-ascii?Q?33WRgMHCrA7h3VHyWGhZ7TEwZYZLbH1dE5GEI0O3D8M0adG7WFoC3s5vKo55?=
 =?us-ascii?Q?oMU9QfEj4867WgfYgZ1RsySUPjumNu5HGDYTIttBPU6S9tcEHpt+VjIw3ktY?=
 =?us-ascii?Q?wybYfXY8Hbppui1NLt3mBpTeSF08zISJfSzIC5e7bBq0DloRyB9DmbRDPo+/?=
 =?us-ascii?Q?wjuE/EAP7EUeYvHb9WrE09kV8mIXy1Byp61gAGHEsE6XYuwZF9oYl2bn8kpG?=
 =?us-ascii?Q?Ll9ziw5IwhnDMAs/9wkAu6hAtAo0dJfPMZoSx2gNa8kQM3fKPcFRS5oZQq/j?=
 =?us-ascii?Q?DCglaDtpGfwUoA1pP7h3eizWKdhVBmFWJBH5T07hqmNMX55BMfil5qB54Dx1?=
 =?us-ascii?Q?AiiJ+UxmPwUy0jlOmYXRTymgQSLsS0rNgHwlg+ZPq6dfMz2Igj2Fsuwlco90?=
 =?us-ascii?Q?1o8U0LvhzZVLRBy9MTGga5BSR385lR4hKKdukz5GbNxG5RCvpO3sEoGVeK3r?=
 =?us-ascii?Q?lgnDrEhijumtV5sfkRswnsBkBVuIZDKNIGf4mTYAJZvlgNreGgPokZ/lWxgL?=
 =?us-ascii?Q?Amv5Zx3Pc9hHUX3+AoV5K77x94isL4Mb0JWLJtCPf3bNQQjqj5Py?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 326d070a-1007-4ef5-bb4d-08debace0f85
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 02:25:32.1063
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J2S9aTo2EmNKTDOYJIQjUQs7bG5kmCrWUAmFgCfrzMNi/uR4u+Vb5ZOj5rV/8W34uvY0rxKsMboLhrdU4O9K+0I0vD3CRIF6WBo0Yl50gZ/nsPcz90l6VW0iVYAy/z4D
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB10158

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/loongson/loongson_i2s.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/soc/loongson/loongson_i2s.c b/sound/soc/loongson/loongson_i2s.c
index e336656e13eba..82ae3642908d0 100644
--- a/sound/soc/loongson/loongson_i2s.c
+++ b/sound/soc/loongson/loongson_i2s.c
@@ -220,12 +220,18 @@ static int loongson_i2s_dai_probe(struct snd_soc_dai *cpu_dai)
 	return 0;
 }
 
+static const u64 loongson_i2s_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J;
+
 static const struct snd_soc_dai_ops loongson_i2s_dai_ops = {
 	.probe		= loongson_i2s_dai_probe,
 	.trigger	= loongson_i2s_trigger,
 	.hw_params	= loongson_i2s_hw_params,
 	.set_sysclk	= loongson_i2s_set_dai_sysclk,
 	.set_fmt	= loongson_i2s_set_fmt,
+	.auto_selectable_formats	= &loongson_i2s_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 struct snd_soc_dai_driver loongson_i2s_dai = {
-- 
2.43.0

