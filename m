Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011027.outbound.protection.outlook.com [40.107.74.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B8892F7F05
	for <linux-sound@vger.kernel.org>; Tue, 26 May 2026 02:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779762068; cv=fail; b=jrrfa/AWtrrb0cXBmptByVqIf/lP2qbZQNinDHqxL14gB0sWM2fq/DbWXxD8D/5KDUpZIQpIqyDTwKo08gR1ZMDXFYgRWqhuCnt0Gvg9BRqjCeoeM3oL41zhhnc53RUzbql/k0tcMH8fvJTJuSEX84DdeA0QG/CLeq6/fh4G1JE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779762068; c=relaxed/simple;
	bh=p4dgFl903CCk3H6TJHzrtFezKMe9aS36/uHoHhK0lqY=;
	h=Message-ID:To:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=G/AdlMxVxAwV3as7JiNNjD/sqQ08HxTPbXpW1iQ6oyUw47XrA6nVLXJ0JOhSxleuFGmAhyFMn09ETF1qJrNhf3YkfvUo5nJ5OpkgI5wo7OYEZeCGKEd/n/3wD6UbOk4lvAaPam9Rq9/R0k7Qw2SHndby8/bXsSbhtPoqB2D2NuQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=kmKCOX3W; arc=fail smtp.client-ip=40.107.74.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="kmKCOX3W"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OnUaho1MFT3p//qu726b+m9YqZfwykncHB5e3yGwmH9+2RWOpD5D3iyPLcMih5ExK07kppyynvbRSNuQ4IWbLYzJJq/Pu9mNQGe2w8kWGO+5waChssRFXyJ6JKXBb6huStWqH7LSukP5TX6dayHP6RQVfaTy8yyk4l+t6EA22u5ONIa0q/+83amxOaj50mPGtbLPbILjXlXvsjDxelAcm/0+/kQ+S/RNJ65zgQtvD0OoQS5DgDH/ZGQ1Q6DjgK+YYEBDIYak+tPl72S5w5tIfwGgRqP4fTqUIlPpMeonbMsfLD6Cd4mkACKPtNA40JOi7dYFhMFT+gu/cm6Fiaw8uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+5FLnn1ZYm+MwoaGHdIBc8B0xXwd+ryOcMlZiiH7QeQ=;
 b=EFb+t2QBG8kN8sxkaVQISQc6V42vGWfSvQDeXHZJpny+PHK1eNR5b8QF5WxrRAwUwqGbwKW4+Dp5tIunwrVJBXNkmm1TgtSAQG1OQ1JQl3DImg4ukP4++lRgTNb+ufMJ3xh3dT5Umj6CJwfKQUs7O8uJTDBS9MJZXqlUtbdyzVhC+Mm23xFvviSjwAwera3DL09kn1ldZu+zTvLhJUUrpli5Jn8dCzhHo2GYfmLdWbVFMCWvU4+P2Q1TztOgvAqyzBVMtnGz2gNFarKSVJKEKFtWvCldJSXOKnkU+OPdDBpbspOyY9PrNQqCjuxkvGJUBaLsy06N222SPSg+O/DaMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+5FLnn1ZYm+MwoaGHdIBc8B0xXwd+ryOcMlZiiH7QeQ=;
 b=kmKCOX3WBiGr8rXAonkovm56Tch9ls/DMasOpx0GtSw3FSjIlITXfnPBFEixvqdr18JJTDGB5zZly83VTb9QRg/O47IB7iBeVCSwUdYu2SzCjH75F8r7C05lXd72Sh9dNUdBMPjSwSSSv7ZdJwao7Xg9D2bG7q1YADOT59lEFTQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TY3PR01MB10158.jpnprd01.prod.outlook.com (2603:1096:400:1d9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Tue, 26 May
 2026 02:21:03 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0048.019; Tue, 26 May 2026
 02:21:03 +0000
Message-ID: <875x4ahpxf.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH 47/83] ASoC: codecs: sgtl5000: use .auto_selectable_formats
In-Reply-To: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
References: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 26 May 2026 02:20:47 +0000
X-ClientProxiedBy: KUZPR06CA0013.apcprd06.prod.outlook.com
 (2603:1096:d10:30::19) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TY3PR01MB10158:EE_
X-MS-Office365-Filtering-Correlation-Id: 99f05267-e5a2-4dfa-7e8e-08debacd6f12
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|7416014|376014|22082099003|18002099003|56012099003|38350700014|921020|11063799006|41080700001;
X-Microsoft-Antispam-Message-Info:
	TYusa1dkYQ/893cbzQxsECJrImb8YuDFRbgX8fa2wC/pjXHmw8OYH6p56yU9Pz6hO9JdNtIlrQF/inyzr7a2Zt2cCfFGx1jzyyqfYnkki9pV4LZoWA+Yyesyjh7tzBO1wUvWT11rwRm11eFzBSgQIQ94SyBOtJdzwRrpk/b0+wjLZuVJmbWgwmNxAUb1o2hNhbSTrQDSRECG+08lEnVYgNT9Lcoc9tfoc3YCrIAJC8aWpNjqtee9DZYcKAkNBalwSuCHc6TjGOUBN8LnZLDJAoHEDDoXBhAH4dl9/Qlse5xuoD+2nJWzI9Xa6QRhjkECSnqTDp12wo7ubktY/4u5Mw2tidi8t9N8hzdvw/79baE8UB/1agaX8R+gQ7Wg4UJR0N3IjjOtpGMyAgeyfDhuqOsDQvsLCAv6rOMkEKS0a7SNBczEnbHn+qQ1Llet9y39V0JFVtRQ4GBjJyD8ZvfB4iHOhhDxP+SADe2k+WYO4KOQ9z4E8IWyhehU41L+8pKQWRus7+wdwQvrh8+e1qTNUx6PMtIGYswfKmRzsL56dX7v0lunbtCH4g1OMbnE6yjWqapwyhQ1S3rS94ENsIWVlhVDkiwKqHzRo72/3BCU9F7J7ccQovA/fbm2u12bzGg+iaGQ5QRmsTdd4mEGcUT0F6mYoB9Gu1lqmJdMQcaRydmjvXF9CDUQZD4T/le6AwXDLtY+9q/bF7SWIAJNxfEyC8fq1lKm6QvVK1YS54bX4zuH4r6D+RFMlWJBKHhCNKBHmi51aF7rjeamTwyIWsDmyHU62MZjle8Fek2hD6Ya0L8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(376014)(22082099003)(18002099003)(56012099003)(38350700014)(921020)(11063799006)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/TzODD1OzFcCZgvAgnAGBBC5B8ocbYIfGR9kXsGnz8vlYtKrXUPuXz6cFYPO?=
 =?us-ascii?Q?SengROaas4lgvUCxLznfXzJsylBLfb24jiJ01LTfDNjT4520lnwAqUpZEq2I?=
 =?us-ascii?Q?rRg5utWKWM+8GyA0sc72LY9UOyMH3P/h1PscBFTMcMVLMWRp1sXOyI/xxBSR?=
 =?us-ascii?Q?OUM9opQYy2wDCLmeYk4uNzAq/yZ0LjtE4Qc4hp9XPR1bE9Tkp4U4Rw5eSY9T?=
 =?us-ascii?Q?y530Pns5ms2NYmEMbAXD0qJG9yKQ9N8JQFU3o+UjIE8Nnic0u0ubu8eMm94P?=
 =?us-ascii?Q?3HsKExHWcfePSv0RdN11ApD+E/Y/W5Ebu0d9SkTrGVIt+Ag0epyGhRf+QrGd?=
 =?us-ascii?Q?K5Mo+PS4yk/KCr2+c0qjEw22zf/pHu8aYoacfZDT2TD7Tp/kcWFZ2c5WFY/t?=
 =?us-ascii?Q?nUIHcT9wbojo7yvAAMjagaEzU378dX6VPymh3zOX1nGp6PUWiKse/L9vRqWz?=
 =?us-ascii?Q?e1h1tpe4w7SYiDDBI+DfzY3YIJKbt0Mpt02HMqtIa+w/ZHQStisXhqkwxTco?=
 =?us-ascii?Q?SR+dl9/zvSZuuZUy5A/BfBVtJ8s7duM6Bc7IRGO4cTVNBXGgMvhYSdHEyEUn?=
 =?us-ascii?Q?Vhyo90IqkcbpyFkaGts9yVWPXrfI2H6FcoisCfPw1jyz7yNY9p5UJ1YSwjKN?=
 =?us-ascii?Q?XFVM32XuyTp9qR7ifd2icXhGgzLCmZKY3aU3tAIok9jcEDdLVhAnsZzT1ZRp?=
 =?us-ascii?Q?cSKa+Ctj8hbTCxx0j+MZ+7TMKoRT0g1huGhBlOQS15WsJRLZhYe/7g6nIMK1?=
 =?us-ascii?Q?6/LxUlzwmYClM1pKHsGPH2V9sgW73BvgjotWIT9BLDdDPEFGlVtpiIPxL0fe?=
 =?us-ascii?Q?2wMMxyIyFXHdAyoItYXl6CjnvaCE8pChbSqn2EJEP8kSXRXDKEgJQ/xQaZ3J?=
 =?us-ascii?Q?QY/1w1ak/Mzf2+6FsrOVZYPvVf8nFWBkGhVqfRJmLrBpY7PvwyjQRKEQvwX5?=
 =?us-ascii?Q?JDALpCNedsZAxx48NeODw6KaJh6EI8+wluyLwQiNyh1FW7qqxmQN5aMSpN0B?=
 =?us-ascii?Q?ruyaNq7JHfFH1cx4XRBb7bpulvr/Vy90V1AWFX/jqDlKp0Bz9/0FLxRGf8HR?=
 =?us-ascii?Q?4vl/RHGXo35oTZNnpCiSsZnhuYNMzelLdwTDqnShzTxGtyEsc616cFUsDezA?=
 =?us-ascii?Q?DVRt4RTS9PYkXafd4n3rAHzDCLVa+Gn5iVjKBswyzM2FjZ2SMjAUrkeDFoMG?=
 =?us-ascii?Q?ZdvG4Kz/FspTA6iaJtjXV1WtRuhr0/v/8joH1Tf7RZW0mFsj4V60XT/lUXIT?=
 =?us-ascii?Q?mJJ1JW4d176a9l67KdnJZmXTfiVZdrx49zuj+BS3RwPEaFuwLFkNcflPEHiU?=
 =?us-ascii?Q?twX04v092J+pDpRAUlgs5Uh0FofSsz9WsnGiYoRu+ZF/+vXPVmz6RPZolGLE?=
 =?us-ascii?Q?CcLVE8Pf1C81FbQyd8ckbhW8R5y++NYyYjYqNvXsnT/oQUyhy0zSiiiJBJjd?=
 =?us-ascii?Q?x6sh6r8dXqRqo7/kuQ96O9y4/Wja4bEL2wdyyE/185yfRzPMRjfy5huH9DGA?=
 =?us-ascii?Q?5Wsm8VB9rm8MnolqzKEyihWzIokQBwLpDAOvL+iPdiLlBJMIjaOXY0UyDixa?=
 =?us-ascii?Q?ce+m0uJ34YF7H39h2Ar1LrDgfgwjiSWNsg4EN6lda4J3NoL5TgSQJl8i1lYe?=
 =?us-ascii?Q?7ilLCoJMuPnhVZOtlBemtBZDTk4q/oaQBEcV+TlYQahqhUD6HYBGCKKEzZRp?=
 =?us-ascii?Q?Plj6X0GBpB85VJJ0+bjfCu2TVqaRwa/fSS8SGnabreRgkqENPNp6zLWf05Le?=
 =?us-ascii?Q?T+w2yQtA5eB99g7r+aKYfnY+Cg4+VmMFYjJnGnT7Pq1EInUtV2cm?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99f05267-e5a2-4dfa-7e8e-08debacd6f12
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 02:21:02.8932
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p/Q6ucWIbayiSZ3vdWa3J3bln17SgbX04ECIDgoAAleUCS8nbMDdxJUXRNchreS6uhopddYl9h2bk7gP28oHDpS9qJYxVa0vApjlQYpQ5zFsoby8iaHB5qNtn66HaDuX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB10158

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/sgtl5000.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/sound/soc/codecs/sgtl5000.c b/sound/soc/codecs/sgtl5000.c
index 59642673b4cbe..70ebbac34e061 100644
--- a/sound/soc/codecs/sgtl5000.c
+++ b/sound/soc/codecs/sgtl5000.c
@@ -1158,12 +1158,23 @@ static int sgtl5000_set_bias_level(struct snd_soc_component *component,
 			SNDRV_PCM_FMTBIT_S24_LE |\
 			SNDRV_PCM_FMTBIT_S32_LE)
 
+static const u64 sgtl5000_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF;
+
 static const struct snd_soc_dai_ops sgtl5000_ops = {
 	.hw_params = sgtl5000_pcm_hw_params,
 	.mute_stream = sgtl5000_mute_stream,
 	.set_fmt = sgtl5000_set_dai_fmt,
 	.set_sysclk = sgtl5000_set_dai_sysclk,
 	.no_capture_mute = 1,
+	.auto_selectable_formats	= &sgtl5000_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver sgtl5000_dai = {
-- 
2.43.0

