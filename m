Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011002.outbound.protection.outlook.com [52.101.125.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F3B12FFDD6
	for <linux-sound@vger.kernel.org>; Tue, 26 May 2026 02:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779762100; cv=fail; b=pV09RXx88ygSo3/SVK4Rj4QdodYIbujnM2Q15YM+dSeyzZpQTJsSxiu4hlR6LSFyjLlkw2+fsWYZIGMy6hc5dWGwKNqmTBPlN94YXTY9N264iyxRB1GF9hqVagMs3ye4nWZE94vkr0p4ijBpdnZfJ15btBnVcOSuG5WKVncPl5Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779762100; c=relaxed/simple;
	bh=xlBgQrnxD6508IV54HHIPb+JsTV1aEKDsbRj+0fiqJs=;
	h=Message-ID:To:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=mmw7QGEQo/srJICPO5zbTMKY2HGVmCAM8+Ab/oat7VBLCw7vzTF7AzrJLuS7SuSW2EmNT3943YrmNdUk/CHcHwBRfRe/lt2wrK6iu+CMQOtbDyXGBmi+P+pkqtaOMfaOywnpb7a9zAKBTIOm1czCbJ15TbuwMTSSAHBDl5EBuOI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=B6pSo9Os; arc=fail smtp.client-ip=52.101.125.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="B6pSo9Os"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HxdmQLVb0OMoUPprrWP3v2MNTCXky94YIPvwKZc5n3b6Ib5GW+zPGKjk6WLExLYj+eab7yahumYFEcIs3ciHEmVlu8ghmOeA4Wni+rpVU0+gkQ1BwqnO4EdF9hceOHG4wUirlmdna4nIDIZ9G4N73wXQOothZhD8BbyKS9hLgwqa7p01VweX22rAZ/OINujS5XGxKCNnMG92RCeTOE8ShCUSSvBe180gW7aKNI+orsbckSR4F8Eq6L41/FFYhKDnMt5qgsRjOgTyK66V67PJoYEg3cSvN1mwlQxY85DTSZcpE4o95lL7IdCxz+EsmRFRASSaNC+koWYOqVPr9bzjFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UsACuWn26cH0R4QGgUMsv1GPgWI14KtcG8YkLUKorvE=;
 b=VyNfLGvWjnTPOr+i68YwdxcdSfe6UpQyWG2+QrSTzXh0MKpJ1D85ZtNjg0Bl7/NJErPXYLOygEJy2fpsDOkRnBTGo57HIX4HpgxT/HYWmqmi1F7TGA6Bcb433S7IquS6y1BSE9oy3iIrL32UpD3lI9zpn1/PCeHOdxhRlQA+t34rO+XpaN49BXFSCM68tMhMsCgCQqF/6ivcyncSka9AXZDeP/IMlvpMEvaY1Et0P2XPk/eD63X3Rw/bAXsAOh9sxJMH5g+bltsze77j0Qy322pnoygONZGvXEx0pJhNLZynK14+r2Eu4aL+Fv6qf63gsWceWElefz4Hn0Nel/C6fA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UsACuWn26cH0R4QGgUMsv1GPgWI14KtcG8YkLUKorvE=;
 b=B6pSo9OsqRNgQeSDxqRDv8RbjCuzt1+4NSBTazYatyNKI/eAcA248DqsOBTt1N4GkpsaAdK2ONWMXEJQIFAahCRN0VaZtNkv4jMA4PDldYI+578qquW6GX39abR2TqWMA85+5Vz7uxkyzfSmvDmt2LTTm6FRXQtxeEmtTMmJ+TY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TY3PR01MB10158.jpnprd01.prod.outlook.com (2603:1096:400:1d9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Tue, 26 May
 2026 02:21:35 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0048.019; Tue, 26 May 2026
 02:21:35 +0000
Message-ID: <874ijuhpwr.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH 48/83] ASoC: codecs: si476x: use .auto_selectable_formats
In-Reply-To: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
References: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 26 May 2026 02:21:12 +0000
X-ClientProxiedBy: MEWPR01CA0047.ausprd01.prod.outlook.com
 (2603:10c6:220:1df::17) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TY3PR01MB10158:EE_
X-MS-Office365-Filtering-Correlation-Id: 516635f7-2df3-4792-9176-08debacd827f
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|7416014|376014|22082099003|18002099003|56012099003|38350700014|921020|11063799006|41080700001;
X-Microsoft-Antispam-Message-Info:
	A3z+g8HncnMHpt0ZTL74qCLXAsqlDAGuFhhl16fIBu/Z1UqNSExfm27zx00Tr7tgqSj05MMSv1GHHH6Zh6+QGyjzOeuFx+L+/3iR83ClXA6eTmTKFHkhIuTmTj/+JK7HNt7JSYuoaOBlLMBzUOO1POV0aFFDNkZbqxJ6c6W1l2h2KkcvTY7GO205cBIp4QukFmERO4vv3qgpFGzxni4tPJcwSp0rWc/ZJCfqk7PLQo54M2SS/g/qmtA0YxF1tRHv0VbdwkPz3NjFdXKSkolh+SzBC6Q4P944mQUm8drOQGOIfpfkrh5NDrOYMjTnbVVkFOCKDTUsxk1SoQUkChEutUGpG2H/cq5kYfKUrOybNJH3JivmmDXYdi/bDVUch76ZiDjxS8KENq3ZfWW6gzl3fOFMb6UL9+8476w6lHeauch1T2cVzHQOpTr4tQExslDMvr+9fD6YJJ3rAgkokmS7lzjGlgx3WqNVUSeKn375//9+1LBXEMdxcEHwpU9jCwd2VMdwZ4cN1SdQdM7VxziddA0+ohDzp5Kmi/6RcEHOqHQUUBf++QHfEfdbSLKl+q2vXYUfmBDh4WBcgEKRGr+w0RQfgoTbMfPyiTIJlsmaodo/lNgxtKa0G4+PnX2LZ5UAA6x8OaUYtkE5XNM44yR6qppisanvOk5ceUxlXBYVDyw+hrb0WQwwBpRlDuNLppYJ9AC84tKb8+OGRC//+I4HiE0VZlb/W5h2zVWgB0RKz9dYD+LUAGSm9G1BnvltK4UCrARiuIJmr7bcHlEuuQFz5rua0NypJsiEwqt6EAn79GY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(376014)(22082099003)(18002099003)(56012099003)(38350700014)(921020)(11063799006)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?sZSrBEQg8Cl2bwoX+YpU2Ohl4U3mk9h1eriLlMx04PbPPRU+uUfm9LGkFL4F?=
 =?us-ascii?Q?cikj4y0H96mGjAPEGMDU49iFMUrS8O/QKTl9EBA2ITIvPss8VMgRFlCuerI0?=
 =?us-ascii?Q?9t3iTQ0+JlIj5XFzPNyH/MtOPLrIXSzYwBsfls1B3tX6HQMO9PMJZpP3PTLs?=
 =?us-ascii?Q?dth+CSjH1AZAfNzsnUveVpDxUJIbL7uiKl7OV9eJnwJaVYAPRvTEvUAapfaH?=
 =?us-ascii?Q?Wpy5jD7lijpJ+Xsvh224jYb+392iI+E2K6Zz81kL9RgpqJrY1/fvq5d1peIQ?=
 =?us-ascii?Q?ut7Npsy3D5qUirg552HVCyCzSNelDZo8QEEnlWOZNiyl2hk8PWBQ0gthiufV?=
 =?us-ascii?Q?MPF9u8seZqXwSRgR6BKrXlgNSLeSTmRBD2L1iWSj2gtA+kGW9nUlzR10KX+s?=
 =?us-ascii?Q?nFJcwlqNEUz8jq9kUv+pF4p9toDYaFFQE1YGyAD5c1cLXilMod4Sdyi/Ss5C?=
 =?us-ascii?Q?2bnT9WTHkggfJzu7GITBh8cDEsamFVnlvDuamivM5DagzesfyMjwTbbVKobp?=
 =?us-ascii?Q?2uufhqd1g1IsZijWPucIXXQ+9lLFmg5Ks7uabfuTyHcTdNhrstFWa1FJA+n9?=
 =?us-ascii?Q?ipBhQ5PvQHqjuhNuya9trk0MIt7z/+x1J7suf/bSWdk2EIohKT+DBWHK8xlm?=
 =?us-ascii?Q?JjaIP67/7ZC0e2KWlhhFaDYIsrTTOp1qxtJFy/H9ndHuOtrb8EGXU6nrPL74?=
 =?us-ascii?Q?EoIx64U2Nksh3HDnm3bDZaPgox8FS6kx6IeMsQJ+99wG5MBBF5ElX1yKkQrg?=
 =?us-ascii?Q?8x6H8A69W2sxj1alnDZl4t5VsHuMjM7rYFUxKSVNiRKfimZrj4R9EvPiNJve?=
 =?us-ascii?Q?eS0j2jQSrEtvMzB5NYJqiiz1aKIyKqQYJZCG1gSCkczheZRC1dLmFo33+O7c?=
 =?us-ascii?Q?1B0VdDfoeB8zFsAMC49E6Sd3TXxQ/IoO9zE49Dz/jRx9VsverJ/aiyc+rtH5?=
 =?us-ascii?Q?YiqpUbDQX3woW+qfu89hKmyTexiemd3r+z2JeL50XLaVuVkbxlN01UMrzq03?=
 =?us-ascii?Q?LoNagqy+iiqjWfL48T6W66S5J4mN1shV6I76dI4fUSVi6vnSB903rOxK75Uj?=
 =?us-ascii?Q?cG54HIPyK/vkUZyIMPqNstlg5Wb+DjKjAhVbXUPxzC77fD61iNiy2+M3eHqk?=
 =?us-ascii?Q?AF3ELqMxyxbrWqRga+LaTbnGeJsOiEiQXR76a+EMSr/0vzV+LIpuxeMY6ZBz?=
 =?us-ascii?Q?iUOmFG+Vf/1RmnZomKEdu+Ab9F3REnH+i2vL3XO5NYHj4nhyEI5hccShPpp/?=
 =?us-ascii?Q?7eyK/VPAQ/EyfL+1gIh1kNoS2SfuJQDfX4NYKQQJ38f0TKob8Oj7YAMZdSeu?=
 =?us-ascii?Q?xWZ91jlNmi1AFKTBULdJabA5XH2H3g4Do4MvRDYUP7v+uKFO2tvsIGSPg4/u?=
 =?us-ascii?Q?wfiNJOjv7hGY8hlaR9eySkcG4/rBebGAMF5GFVUUOzsNyqCQ0jXvUy7xW1r2?=
 =?us-ascii?Q?K7wVELLshFXz3CazIangSWL03NxuKXyMEuyr5hDH2exhtteH3wBSnScxMvYn?=
 =?us-ascii?Q?agrEOj6RYc9UKjkY8KCJfG97hsnVPHioAjQnQS9W+aL/KCxMPFDzzMRKp2tW?=
 =?us-ascii?Q?RWOqQ7amGTTPFkvfu0QbGlEZiHD28q0a+4VC9VeFvor3XwY753ilVlryJzkk?=
 =?us-ascii?Q?GPV5zB0ilfdld0y2Ef0rtOTtUvzYOL6NjOCMMCZC/EPo7qZQ5LdEWKXDKtTQ?=
 =?us-ascii?Q?v7PbrInk1f9Yvf0/k8JsTTkIpIu1dBt9SV17mISQotKxe6z74ADKfPyAC8P5?=
 =?us-ascii?Q?/D/wkAMJzNsyDyyLXoQCar6dAScWkWJHMhKDJGg66/GuXZ++79Ce?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 516635f7-2df3-4792-9176-08debacd827f
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 02:21:35.4957
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xuyvLUH5S+ZXLBJ/YQB6+1x5cyt12H/JWbUJ+PxGA2dEbA6J5xaYJkw7tqFXDODkhMPStnzNmn1QDwKo88VegFQ0q7u2mhXD2TERILjoY2VCmLfJxi7SbIhx85vBHBaE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB10158

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/si476x.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/sound/soc/codecs/si476x.c b/sound/soc/codecs/si476x.c
index d87141ba84388..d1b4739ac8104 100644
--- a/sound/soc/codecs/si476x.c
+++ b/sound/soc/codecs/si476x.c
@@ -199,9 +199,28 @@ static int si476x_codec_hw_params(struct snd_pcm_substream *substream,
 	return err;
 }
 
+static const u64 ssm3515_selectable_formats[] =
+{
+	/* Hi Priority */
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF,
+	/* Low Priority */
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF,
+};
+
 static const struct snd_soc_dai_ops si476x_dai_ops = {
 	.hw_params	= si476x_codec_hw_params,
 	.set_fmt	= si476x_codec_set_dai_fmt,
+	.auto_selectable_formats	= ssm3515_selectable_formats,
+	.num_auto_selectable_formats	= ARRAY_SIZE(ssm3515_selectable_formats),
 };
 
 static struct snd_soc_dai_driver si476x_dai = {
-- 
2.43.0

