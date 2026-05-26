Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010054.outbound.protection.outlook.com [52.101.228.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 454082F7F11
	for <linux-sound@vger.kernel.org>; Tue, 26 May 2026 02:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779762159; cv=fail; b=Yl5zqI2MJ4aOBUOqMsRnL5/TjT85n60r4NkrpfEeBVSeYxeizOHqInWA4f79TgxuNeBsRvi+3J61FR9Pl5MQbYdK6DYiK4mAnwoUAHfoZd0S537lgxLAQMUV8hI/JD7dPzgJUo/iG64fe4aEbpuvlsoiu8oGdkFCpHnG32KeWjM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779762159; c=relaxed/simple;
	bh=ecflYBVGLwsE+aQ2uBkCst3ITaHtHdSdFtUvfgm3dzg=;
	h=Message-ID:To:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=PvECR88bIZLUtLD86CjpnNiR7KG7F60OFpBaLEkwdEHm/WDAlxiVvUtH9jfPIXZcDHhNhpB6MLhzYmcMqyc6HyE4Vg3EEnlxtRcy9ppMrTzrKJWE0eqCRYQ+CDA2mZPVFTHaLtbbA+e+IhRqCRfTdC50yy+MXoZVRwPUBydtAxo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=e2EfiV2W; arc=fail smtp.client-ip=52.101.228.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="e2EfiV2W"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i+qUaMhVyHhRSZH112vbSIjcPuvW+B2IbZNC6dEL6jnljbayb9vNwNXsQFDKeEDxso4SpSXYYw2Vd/UOTcKzQb9fhnQmsSXZcZHcnjKcZ4j/VutSxF7Xjgtmymx8zCz+pr3l9s4Q0gPNGzh4PPMFWXxZf2U31UNIEWrX7fIA4sxRl/EURNIH8gCvULskrSonVaDpIDMHsDUZNyR1yD9YT1xGfBnV4DIhQ0vdrhtBLHdC8+zl3sT6vRVDVsAuW63WZWHN+/bXs43GHmIzun1OzeDPaRv+gpfwASF6nI5oa3xsORwD+6Yueake5MRUlTO0pd7q5mzVjW/Xd/xCCmclcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HPVbg55F472A++lQ5M0AunV5wP1lDDZVlhyH3pF19mY=;
 b=OeFNKnBCNMlf3U7Y/1CrD7sOtk0eSHdpn9fR2VWkjBp3crfsNr0T1zX/oGjRG2rQQKGsPTAT61lzYghkHtAq3541yEGMO4mZU51MHSPOTypFAgxBceb3j980lk67TyPGgO4eFzpTuOE4jAUrpoGt+T9mFy+W22gNR8RBqFxCooNGEkEj69PsECPTc4Ds2/AM9iogVDO9I5PIq7Zew9PQSRiVStOgt7SEEUGrpnb7bVn1ydd+swfrHz+93wjUCFTo1hUf4mx1/Vl9ljobVuDYEq/HG5KONZbMPxWCFZaX2AQ+YaFKdCOBMmpIXxUKTuOQ3L310JprjaETp37w+EO7GQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HPVbg55F472A++lQ5M0AunV5wP1lDDZVlhyH3pF19mY=;
 b=e2EfiV2WPNck/1IY5GMY2fRnnS7FUU/9oVABPyE3fEee78Jg88oNPO6omfiIHnRhCBbrKW4TWyBJvMUgnlvcxu5wrNgI4xCi2Rrn9dP0UZAmYK/DptBkuT217iu2fytSxZMAEhPJMLgghS1GY/vPC95KCQ722yY7QYDHFIc+kqc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OS9PR01MB13148.jpnprd01.prod.outlook.com (2603:1096:604:30f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Tue, 26 May
 2026 02:22:33 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0048.019; Tue, 26 May 2026
 02:22:33 +0000
Message-ID: <87se7egba0.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH 56/83] ASoC: codecs: tscs454: use .auto_selectable_formats
In-Reply-To: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
References: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 26 May 2026 02:22:32 +0000
X-ClientProxiedBy: TYCP286CA0175.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c6::14) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OS9PR01MB13148:EE_
X-MS-Office365-Filtering-Correlation-Id: 878e8eaa-6b8e-420b-68d0-08debacda4ab
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|52116014|366016|921020|38350700014|11063799006|22082099003|18002099003|56012099003|41080700001;
X-Microsoft-Antispam-Message-Info:
	EvLf1gn/HdpEExSSCTa1mx/MrM6Bo106RtK1RxOJ+oy3pue7f1WZEln2FzPI+DyGXlAslHK4MyBOpdUAA7wUgva3gbB7YsTnaFEaLMbrI+5lMKqcEdNzIOW98mG2XNOj208FQu8ql1EaXqF7uTJuU9to/lD7XQdWKzg4JVE8DDCKgb1XN3DKVpBAqaV5joUfpgfoVamYXh8NA3VVA9B0MVR+4bXkLGjYaX3t9l9m2qSfjAqiphvYUirW8vKplJhMJ7AlcAU7uMBSeaNgjH2XF4O/7AwPsFQ92IoSRrizrzP3WUbN3dZtfqu7l+nsVplRUbC0C2iBNcL1jZ4B+LTjtFWn2P2HHGYmKj+P11YS7uPbaNG0Yyn2cX3iblRpmfs1CvxZVdzYUfwZqF/7bCO6CtObPubChHxCcFafj8yGJKLbtFQdFnWh100j0qH6baxHEKAjZw9fvdurhfVPtg567Uj6haIbVyXSvdGn2IemBzoz7ikJ5ZDp4CfiY78rUNWy6/e+fdxD6/OqgFry8GkTKN7YK2i0pZ3qRMdK4+CWglVoFU0Ki43GXmsh7fy1sGohiOOPlUyNEtMrZnitCG5hwbeszwoBkWJbNCR7HHPliRordg8NJFYGisDFsAzXFo59oG3MQNqqqahEuqW0/SJcsyqMp9MRPEF8ysHo8AM0OYwmLMoydU+neHpvV/XC4A8EKvoHEabwF/jAdwqOmpU1RlQHee9yvX8SHtbOsW32YAUn/fyJn3izVQDFQX1Y764KGuNOkAUdFToIEj4Y8wL7UfBaKnuojxsRhj2LSO+BkOM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(52116014)(366016)(921020)(38350700014)(11063799006)(22082099003)(18002099003)(56012099003)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BcjJvSgveEQq/OprXklmOqb8xFP5N5Yglk7Ved7VrzJgY5AuIXLYiG9G7dAV?=
 =?us-ascii?Q?EZyFpZ7TejJ7TTEsWF/oCSrxA0h/X/QwBgkKOwiaZ/FiOQjUW50C06CQdU6h?=
 =?us-ascii?Q?YPJMeg7j0TKBrDK5BpIoQysVQ6x3TjEIEKhp25IRjZb1TqI+8VyusxPH6Xjq?=
 =?us-ascii?Q?WPbsE7GKVhSd1sSbP9qpxDE2LPhLc8JpW1gqVMzDhtjvY9yqclguvfevxKMU?=
 =?us-ascii?Q?EfP5ChOkdfSpdGE0GVo9m9gbj8SGgj87gdk+BM/6Z88VI5w7EA8k4gDjuA0w?=
 =?us-ascii?Q?uVlQrJ71xYRsoA9eX1Xa4t7WtNvqNA+Zn+3RSLVyWB6yPc17yF4W2liuBoWt?=
 =?us-ascii?Q?VeFnSRIQK4nYd2b+oP5T0mfZenj56Pg1GWMMkjA8OGGSGMc6iNpndgAfvTKy?=
 =?us-ascii?Q?nDqp60v8mFvIC3OWLczJg5uc0fxLpW/NowCNrn6v7sC1scUMUcHk+J3eBsbI?=
 =?us-ascii?Q?wk16E6IrOfmcI9j+gLY2mW+p8Pe6240cawJMcQoFsPKsYccOJigmEKY97XD1?=
 =?us-ascii?Q?PO2uK03hht4u8L1+40FCWcZ439NQOtEOMyMpBB8bK5M91YvrzyFQIgkJXIFS?=
 =?us-ascii?Q?B6iKo6gRj/vwkT65jZmWGINhpGZooGXg7TmSukQ/q/TNr+gAxISHF82LCDbQ?=
 =?us-ascii?Q?98JIZgAqEKkyYjebUs1Vu/9xlWvUA7UQXWfYETcsVdT+POGhUFkL/Fd6OT+6?=
 =?us-ascii?Q?5P6g4gjgHWsUip7eHE1DSoTGWTWkmPVhDfSfC0FpQVCItqjYylp7t8qTdXHz?=
 =?us-ascii?Q?FC8owzCFKPEGy7r4AmWTq+nDpKbNlIMk/ULvSsoxtj4saxb7J3Q2OSGo4aHo?=
 =?us-ascii?Q?0blgnw2L+1i2TwW0KeJAwgWSGVT4AcbWsBcxm1983svJI71gRG1oW/Q+79k6?=
 =?us-ascii?Q?SObambzrk7Ig+XUWatrAmDrBwCOVBz3AWR7V5jxeabp9JoiEGhauaV3xW2bK?=
 =?us-ascii?Q?dA7sRjMAJ1+U18+qbVL2GYeJc4MPq6Cah43zsqXxPPwav5b651OH9yFWWStU?=
 =?us-ascii?Q?D9YgZkjP+5z3X4TUMXfU1J3t2khah6UnWKVtBofEbzJsQSEreaH7w4xGyr7+?=
 =?us-ascii?Q?d+Mvcbsh38eJ+qBTgQMPq+7lZIqonOrR6afxTWsk6ISc/SovQnqaf/LW5L1c?=
 =?us-ascii?Q?5vz5M2QrDntGhoL/Cvcg0o7KRLBpcM050LnxFIgs/l1CzVQNDcFvorFl5Tee?=
 =?us-ascii?Q?a8ibT81r0EsaylMUCvU21WQxmi/ZWs7DtA46YF8mnfKvBIXVo+91goVNUuW6?=
 =?us-ascii?Q?2aZ90Iijr9zX/BmPhVoIPtVk8V3VeIEdJeKxKaJeMRjrT81t+0biv0JMYn2p?=
 =?us-ascii?Q?j0YWD2e0xMmlufzsAyXBrSnwSViXtKuPnPctqTJ/f7DAHdnkVDWe0klLnqbb?=
 =?us-ascii?Q?EghJhMNv6/2WxrpwVO483XCPA8hw7Gh0CfOylKaTxOYwU2/w0EwCtKs/xCkb?=
 =?us-ascii?Q?22rXGGsKC6VJe7R9K55A7f09dNM+ag4wlS27/UFxTnDwxl49r3LD7Uh5Q+9q?=
 =?us-ascii?Q?4A/EQLv3xVxVMOh+aO/Kuz8wI0RXVB8DwNmATNDR0BwnkrkEg3QerxIC6R/2?=
 =?us-ascii?Q?Erk58+V57Z2Pyp841mVVKFjpIdcJ+gvSdX7CQr8XvUPqq6qZpv484Ue8sOq3?=
 =?us-ascii?Q?Zlu9CRHw6lXZZ4c/i62JGCPO5xUP5FY399gePhRZUalYflXi6nfVJzNGmGeT?=
 =?us-ascii?Q?zDML4mDfoYt8Xyy2WpcAmnObNq50xK5UaIW9lDXAWKMsbAsoqhODaUq4zzYi?=
 =?us-ascii?Q?plKd1m1PkDISv0taxApQ4o87Hki9t0JFrpFCd8qtS+u0IjjG29/X?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 878e8eaa-6b8e-420b-68d0-08debacda4ab
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 02:22:32.8868
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1FNxB8q9hMa8KsfKPpmrX7GW/TULGrc4zzsMUrSuKz977T7YGsRxmrvxBR9JbI+OmZT0wv31J2745NRF1C0LflprDgngXwvHFFjWhh1XxxXz2QGLDwqfPHAnHM0I/9WR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB13148

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/tscs454.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/sound/soc/codecs/tscs454.c b/sound/soc/codecs/tscs454.c
index aad394937ce61..98502bc2a9e46 100644
--- a/sound/soc/codecs/tscs454.c
+++ b/sound/soc/codecs/tscs454.c
@@ -3256,6 +3256,17 @@ static int tscs454_prepare(struct snd_pcm_substream *substream,
 	return 0;
 }
 
+static const u64 tscs454_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static struct snd_soc_dai_ops const tscs454_dai1_ops = {
 	.set_sysclk	= tscs454_set_sysclk,
 	.set_bclk_ratio = tscs454_set_bclk_ratio,
@@ -3264,6 +3275,8 @@ static struct snd_soc_dai_ops const tscs454_dai1_ops = {
 	.hw_params	= tscs454_hw_params,
 	.hw_free	= tscs454_hw_free,
 	.prepare	= tscs454_prepare,
+	.auto_selectable_formats	= &tscs454_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_ops const tscs454_dai23_ops = {
@@ -3274,6 +3287,8 @@ static struct snd_soc_dai_ops const tscs454_dai23_ops = {
 	.hw_params	= tscs454_hw_params,
 	.hw_free	= tscs454_hw_free,
 	.prepare	= tscs454_prepare,
+	.auto_selectable_formats	= &tscs454_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static int tscs454_probe(struct snd_soc_component *component)
-- 
2.43.0

