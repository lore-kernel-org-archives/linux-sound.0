Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011052.outbound.protection.outlook.com [52.101.125.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F87A2EB10
	for <linux-sound@vger.kernel.org>; Tue, 26 May 2026 02:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779761735; cv=fail; b=ntZeVWJBJEh/6xuE8dr0WMFaffXg58ulk7QLzx8uRN8tvkoiXh4ooSae5cbvP53d9DfhS01bjBvpajEAxiuTTkvWuM/FmZFpFIiUpL8GiYIRPjnOt6Ra2IYcWQJCq3B1Se6W6J+zbMYYFO6N8WP8AvB68zFrhxXErOnVCE10TaY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779761735; c=relaxed/simple;
	bh=NGNo/JJgNnfCEHpKkRMZT5VRV+3YnLCN6hBpTtsCF8s=;
	h=Message-ID:To:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=WQJeGl094JovjJE1FW3fE0i02+yNhZcoZ12XSS2vuY5kdqtUk4bKBzs80TfDhZO6vC3wtVQL8IvgGddRBuBGf6JDnZnuUfP+KQv5xlN5TzYw0OpblhpF+40BbGKl9aaaL0XFi2h3DWZlk2ewiJ97FPl5y20yIc7e/D9mjg1Xy7g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=QztFaqlD; arc=fail smtp.client-ip=52.101.125.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="QztFaqlD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UHLX6ZyOL70mpgP/clh22v5QcLI0c4iCJbB53+YsBZLkHCZB0qzHDAHNehma5EhCoUoXf7IK6bvDX/ic8JZKbMfHsrYyGGAFah32AlwRDw9kxrOgrGUTTPFj+XhMF+NTPtBbYhV1R3pFO8Tsc2AnM3VdOnuDvq8keZni2X3sG7CbY0/dnDl0qLUlK/szCnN3gIBOAKSFEufZ0yHez4Tfk4UmuSxY2p/T04Vj19p7e9tPWEjBr7d5vJmzUD3MZxFeEIUvMqyTr3fMhFC8WvwkcgI3qpYHnI5xTUYWCHTIfHhjWz+bbTx3c+LH1iWBNtEMNmbUKZn+a0bUIpZIuXmIhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SbE7GrISyxq2bB7ALLVZyIQQXVGKlQfCoNCyXxqaEDY=;
 b=O1pHe9A9Jnv56PesK65TgBia7WFvMhTZGKPqyMnGRc9Ll9K0AV51jJujzNk0usAT73CMh1CKvGqGzKZpwdpwJ+I7fLVuoxMBW15ogZw8pHeXky2fKRQ6B6DJ2+BU6vThYIBBr+TUunXvFf+GGo08/7uSvg0pTSDtiFkfNG9AAMYkSsp82kAT27ovr8g1PjmrjavSCu7LHRLx/JQvSPvi26AXMO3qTgeiL+XvubUqO1OV83rZqDNltbQW7XwtaVW/J7xgEfL14rjOjR6OOpy9NDbm/p9dKdMEZZemxOOb3rSVkLcb+djcAUICK7BbTjhljD8a0osYpwo8IgFFdzwr/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SbE7GrISyxq2bB7ALLVZyIQQXVGKlQfCoNCyXxqaEDY=;
 b=QztFaqlD7ZU/RgJ6AT/ZNJxJLspZKJOVe3lq0q+g3Pds8wx1Kl4YdD/PJ7OW6VTo+Qf67pNx82k8/XaaOSAyab6BIhJm08H55ofIEMjTkEHaMJSsx4YxAZCvCQv6e8zLsXXSBAJOMJ5uRteseOwrAgh+mKeOg6xnCXeXyGopRhQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TY4PR01MB14087.jpnprd01.prod.outlook.com (2603:1096:405:208::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Tue, 26 May
 2026 02:15:26 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0048.019; Tue, 26 May 2026
 02:15:26 +0000
Message-ID: <87wlwqhq6b.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH 28/83] ASoC: codecs: cs42*: use .auto_selectable_formats
In-Reply-To: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
References: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 26 May 2026 02:15:24 +0000
X-ClientProxiedBy: TY4PR01CA0095.jpnprd01.prod.outlook.com
 (2603:1096:405:37d::6) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TY4PR01MB14087:EE_
X-MS-Office365-Filtering-Correlation-Id: a52062ce-3eec-430b-118d-08debacca67e
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|52116014|11063799006|56012099003|18002099003|22082099003|38350700014|921020|41080700001;
X-Microsoft-Antispam-Message-Info:
	1aytUZZxbQLb2JbX5djfi59N0c1+tCgHNzTRkqqHFx6+vGmDpFqPBP9e4LxewHSarMZ0dYMxmyYJe73ACidjuFb3//I4gcttjeDh9TVAJK9j73kE22tOEtErrwq9I1O/fSoz5n0JG4ZhK/ekXGldaqwkatKeohfue1NNZUT7LImSiIr52B+hACO1Ago/nlPurl5Gz0M1+fDkdiBoq49B5IUWdG2+DDTD/kskEXbZLrAPDE2zSOhjguLgyj8tfSsoj9qWhtuYQg6LoyCGXlMYD9QtGw3RHXK+n7F3FPTk/ctIXMKwa3mE3/LSSR2MKJ4roqeT7Vw+51cWqHULLGWbRwHvFfQvl3Un6wl6Su6MSBncXOwAhAzaqdRTlVARs3dXULK2g9+9IHFLtH+6PH9aFXi2SL24lA1ACrLB0kz4QyPhXP4DFCoqJrqDGE+5YSlg6XsJ7UWzk69aYSalixQM67H2+ZEs8Um175IXAB7NUwhq4qkuLXdlw1wh0kxW4sNi7QRC4zxrnoL2gPkAeqGLekgv46OdWyXrh/EnLg0SGHwkycKr53Vxmm4PfxGki7rFpKjoDquUcipzXSHSuAoKfWWY95ioybQIvC2FOuDcJChJqjFqFc5IMHRko2XtmR8ZwOFaABizRPtbZrPY1RW5GA2UjsY0qOlQQSj7rcuQ7zFAJHd6cIoJBg5peQwlTuFd8OKpieXv0pxjTVttIjBR2t05tgfsrpk9ZI9ENFnL0ER1KgKi+mZDEtBrLUud54mWrSfB7nQlDgpq+Yjh3OXofre5jpVmfEaLsas9NFWq3wQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(52116014)(11063799006)(56012099003)(18002099003)(22082099003)(38350700014)(921020)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BY4PmBuKoARFm/nawoT8glojz46iYJjsVtYqTyhHUjCb3WjWuhg1snk5MDk0?=
 =?us-ascii?Q?zMRrSqtlPu3o5jSipVNsnb1wRNzVKExDXKQk66UmOW6F5R8n/46AfoqdFGH/?=
 =?us-ascii?Q?AWp4ofoMVAUdhJGcZN5XLSyQ3BUfI5D28H4wR12kAhNW122oV7NhVBoki5mv?=
 =?us-ascii?Q?jIxWKZM5SS3/I9aa7jAAP3f2vMWzEctGknfbTcCuePRskJClX/9Ao1g8Pd67?=
 =?us-ascii?Q?2WLlS8hKHN2YnrSy6ubkKnKRK96J0Tz8DwTOBLhPYxXEEpE4foRZZ00fpngk?=
 =?us-ascii?Q?WdQOFbDIz/tsN+3gqXpxpQKIlKiEpzlRpnzm0B8CeutjFZqQbb95UsMmypK2?=
 =?us-ascii?Q?GPZ+stTy/HW+D3AuymoYSN3BMI5gnWN82Fsy0Q0qwnzeT7QWsQTF28E0VP95?=
 =?us-ascii?Q?31rfL7m9qFvZSI+2+9Pu0337WqrNzOli1vKreJdbOLE7TTJXod7LTGA/qkiX?=
 =?us-ascii?Q?r7hL1NKI67bQpuHS/ngFz3RjPzu1wIUzS5gdqJJZsrwLCjCYwr5ryR0dD9k4?=
 =?us-ascii?Q?mDCuA6BrZzBVdHFboklyG/pJtYJLdv8Hr5yYAN8ntKfaUxJIRx+u0x6WatSy?=
 =?us-ascii?Q?phYTuv0QsQ1mv03nffINWsLgRtZGOfcHllE44w1cME4TEgUwbQ/3wxyx6aas?=
 =?us-ascii?Q?LPV3fxCXg9C1ju5d2yrWoz3Agj9chxkAXqavmeqDvfqj+P8S0VGwjtbEbbgC?=
 =?us-ascii?Q?Ov+cDZznayngrJucLffutTOdsNYrF4F+ZUlCVjPlZafdoaaN5rPTONtHDOwU?=
 =?us-ascii?Q?z1TYMNB+X6yF2h5gc4+cpvo7dg/9YDVJzq/KpcqA1YbIXGg64msdKoj+0wXo?=
 =?us-ascii?Q?k61RSv0pEfHam5kcSx3FyjdfMqCsuVoQF4Cx3uePBo1I5FkEx15+Ou7ODdtl?=
 =?us-ascii?Q?OJ2zxsn10wPvceNcfeN3y/lQKS2eXmAGl+K8sgQmkKLJvXf5IK48TY2wZmhO?=
 =?us-ascii?Q?we0heE2M+pFPADXmpeeIipbPHvOcdaDlO23QbArjcp42zJTeKnlfgnfEJCld?=
 =?us-ascii?Q?e+KS95F2nIlZUt3tZk7W3douPR4iUiG6f9YDDfm12yNxl+vdrDoa+PFyH6wl?=
 =?us-ascii?Q?btD9VFZQmc9RE+O2jauiZYoEXSTPnc213d5onA3V9BvAJ61pQL1Lhs4ydp+j?=
 =?us-ascii?Q?j1IwO5Cm5WpJJfGzwI+u20jvCvETgAq5brLDj8iyPTUP2Teegt3gDUhIiDuK?=
 =?us-ascii?Q?sknU6+wvgwRzKsV94mh2ai8Jpm6TMr60eyFpbfjvhtzz4KhDlYiZLUUrXdeC?=
 =?us-ascii?Q?nBWPsjOvyoIkwHUJAaT5P+ngVMf+NjiWBeKSAUrXKe0ExoPc1OjnvFqM0Qvd?=
 =?us-ascii?Q?+QPFwlHtJVte47iuuDLnL4bthSrseWSdZ9H1eLPh9Uc136vWfWNOiJtKSmk/?=
 =?us-ascii?Q?6JwuWMl408+op6lnt8CjUB0RAsUwaDPYSPpWZtg6CRPX80Pt1ijTs7Tihf1d?=
 =?us-ascii?Q?9n5v9otTEOO6IQ3AADssrzIEvErXOs4i9iEfs+NW27OPaON1SOXQJF/5Y/eK?=
 =?us-ascii?Q?zH14ZC+bw8Sf/c6OhxfFf09z4NpygcHMGq4PFCuSEoSozpUF3AULmJAJalpZ?=
 =?us-ascii?Q?YMSq7amJlyGWVrECgGiYqMiamQhlACWq9fJL5a5w+v6IRpPXNcIaejKx12Zx?=
 =?us-ascii?Q?1J+s2mZZz+tpv+B/zZsxdzCsn8j82yUGgPXzPjLWXQ1nIgugdAqQQ7uf14g9?=
 =?us-ascii?Q?CxmEln4XlEtN9+VcZhQxUDmJWZQTMRc8IUPh2cqDQwXFeemzh7ig9FQ7euvE?=
 =?us-ascii?Q?BJDP1q2qjbtmDbH+a0o2OjtRH4ROOmCA6strkkEt3qXIQjEJRbR/?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a52062ce-3eec-430b-118d-08debacca67e
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 02:15:26.5392
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YuAdqT/BbKRmpQ7DnOYwJgIMy8u67v1Z7pJlelLgejmfARygz7N3YX8oUd+9WffKzqaIGB5ZSPrPB/SZznTjUaT80Ps0uU75BVoabCNtXczDgy+LAv/ZS1zLPWwhXkqj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB14087

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/cs40l50-codec.c |  9 +++++++++
 sound/soc/codecs/cs4234.c        |  9 +++++++++
 sound/soc/codecs/cs4265.c        |  7 +++++++
 sound/soc/codecs/cs4270.c        |  6 ++++++
 sound/soc/codecs/cs4271.c        |  6 ++++++
 sound/soc/codecs/cs42l42.c       |  9 +++++++++
 sound/soc/codecs/cs42l43.c       | 12 ++++++++++++
 sound/soc/codecs/cs42l51.c       |  7 +++++++
 sound/soc/codecs/cs42l52.c       | 13 +++++++++++++
 sound/soc/codecs/cs42l56.c       |  8 ++++++++
 sound/soc/codecs/cs42l73.c       |  7 +++++++
 sound/soc/codecs/cs42l84.c       |  6 ++++++
 sound/soc/codecs/cs42xx8.c       |  8 ++++++++
 sound/soc/codecs/cs43130.c       | 14 ++++++++++++++
 sound/soc/codecs/cs4341.c        |  8 ++++++++
 sound/soc/codecs/cs4349.c        |  7 +++++++
 sound/soc/codecs/cs48l32.c       | 12 ++++++++++++
 17 files changed, 148 insertions(+)

diff --git a/sound/soc/codecs/cs40l50-codec.c b/sound/soc/codecs/cs40l50-codec.c
index aa629ef53db46..d7a8b880c9545 100644
--- a/sound/soc/codecs/cs40l50-codec.c
+++ b/sound/soc/codecs/cs40l50-codec.c
@@ -233,10 +233,19 @@ static int cs40l50_set_dai_bclk_ratio(struct snd_soc_dai *dai, unsigned int rati
 	return 0;
 }
 
+static const u64 cs40l50_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops cs40l50_dai_ops = {
 	.set_fmt = cs40l50_set_dai_fmt,
 	.set_bclk_ratio = cs40l50_set_dai_bclk_ratio,
 	.hw_params = cs40l50_hw_params,
+	.auto_selectable_formats = &cs40l50_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static struct snd_soc_dai_driver cs40l50_dai[] = {
diff --git a/sound/soc/codecs/cs4234.c b/sound/soc/codecs/cs4234.c
index 89c424dd838b8..86cb741179da3 100644
--- a/sound/soc/codecs/cs4234.c
+++ b/sound/soc/codecs/cs4234.c
@@ -561,11 +561,20 @@ static int cs4234_dai_set_tdm_slot(struct snd_soc_dai *dai, unsigned int tx_mask
 	return 0;
 }
 
+static const u64 cs4234_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF;
+
 static const struct snd_soc_dai_ops cs4234_dai_ops = {
 	.set_fmt	= cs4234_dai_set_fmt,
 	.hw_params	= cs4234_dai_hw_params,
 	.startup	= cs4234_dai_startup,
 	.set_tdm_slot	= cs4234_dai_set_tdm_slot,
+	.auto_selectable_formats	= &cs4234_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver cs4234_dai[] = {
diff --git a/sound/soc/codecs/cs4265.c b/sound/soc/codecs/cs4265.c
index 286d5ca298541..019f7333e75fd 100644
--- a/sound/soc/codecs/cs4265.c
+++ b/sound/soc/codecs/cs4265.c
@@ -495,11 +495,18 @@ static int cs4265_set_bias_level(struct snd_soc_component *component,
 			SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_U24_LE | \
 			SNDRV_PCM_FMTBIT_S32_LE | SNDRV_PCM_FMTBIT_U32_LE)
 
+static const u64 cs4265_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J;
+
 static const struct snd_soc_dai_ops cs4265_ops = {
 	.hw_params	= cs4265_pcm_hw_params,
 	.mute_stream	= cs4265_mute,
 	.set_fmt	= cs4265_set_fmt,
 	.set_sysclk	= cs4265_set_sysclk,
+	.auto_selectable_formats	= &cs4265_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 	.no_capture_mute = 1,
 };
 
diff --git a/sound/soc/codecs/cs4270.c b/sound/soc/codecs/cs4270.c
index 47cb10eb21bbe..8a5e5df80757f 100644
--- a/sound/soc/codecs/cs4270.c
+++ b/sound/soc/codecs/cs4270.c
@@ -457,11 +457,17 @@ static const struct snd_kcontrol_new cs4270_snd_controls[] = {
 		snd_soc_get_volsw, cs4270_soc_put_mute),
 };
 
+static const u64 cs4270_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J;
+
 static const struct snd_soc_dai_ops cs4270_dai_ops = {
 	.hw_params	= cs4270_hw_params,
 	.set_sysclk	= cs4270_set_dai_sysclk,
 	.set_fmt	= cs4270_set_dai_fmt,
 	.mute_stream	= cs4270_dai_mute,
+	.auto_selectable_formats	= &cs4270_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 	.no_capture_mute = 1,
 };
 
diff --git a/sound/soc/codecs/cs4271.c b/sound/soc/codecs/cs4271.c
index d8cdd37e9112b..398d8c24a9ce2 100644
--- a/sound/soc/codecs/cs4271.c
+++ b/sound/soc/codecs/cs4271.c
@@ -455,11 +455,17 @@ static const struct snd_kcontrol_new cs4271_snd_controls[] = {
 		7, 1, 1),
 };
 
+static const u64 cs4271_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J;
+
 static const struct snd_soc_dai_ops cs4271_dai_ops = {
 	.hw_params	= cs4271_hw_params,
 	.set_sysclk	= cs4271_set_dai_sysclk,
 	.set_fmt	= cs4271_set_dai_fmt,
 	.mute_stream	= cs4271_mute_stream,
+	.auto_selectable_formats	= &cs4271_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver cs4271_dai = {
diff --git a/sound/soc/codecs/cs42l42.c b/sound/soc/codecs/cs42l42.c
index 2652a639a79ad..ffe867b43f617 100644
--- a/sound/soc/codecs/cs42l42.c
+++ b/sound/soc/codecs/cs42l42.c
@@ -1122,6 +1122,13 @@ EXPORT_SYMBOL_NS_GPL(cs42l42_mute_stream, "SND_SOC_CS42L42_CORE");
 			 SNDRV_PCM_FMTBIT_S24_LE |\
 			 SNDRV_PCM_FMTBIT_S32_LE)
 
+static const u64 cs42l42_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops cs42l42_ops = {
 	.startup	= cs42l42_dai_startup,
 	.hw_params	= cs42l42_pcm_hw_params,
@@ -1129,6 +1136,8 @@ static const struct snd_soc_dai_ops cs42l42_ops = {
 	.set_sysclk	= cs42l42_set_sysclk,
 	.set_bclk_ratio	= cs42l42_set_bclk_ratio,
 	.mute_stream	= cs42l42_mute_stream,
+	.auto_selectable_formats	= &cs42l42_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 struct snd_soc_dai_driver cs42l42_dai = {
diff --git a/sound/soc/codecs/cs42l43.c b/sound/soc/codecs/cs42l43.c
index f0d6ff0b2976b..427d24e8433b6 100644
--- a/sound/soc/codecs/cs42l43.c
+++ b/sound/soc/codecs/cs42l43.c
@@ -671,6 +671,16 @@ static int cs42l43_dai_remove(struct snd_soc_dai *dai)
 	return 0;
 }
 
+static const u64 cs42l43_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops cs42l43_asp_ops = {
 	.probe		= cs42l43_dai_probe,
 	.remove		= cs42l43_dai_remove,
@@ -678,6 +688,8 @@ static const struct snd_soc_dai_ops cs42l43_asp_ops = {
 	.hw_params	= cs42l43_asp_hw_params,
 	.set_fmt	= cs42l43_asp_set_fmt,
 	.set_tdm_slot	= cs42l43_asp_set_tdm_slot,
+	.auto_selectable_formats	= &cs42l43_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static int cs42l43_sdw_hw_params(struct snd_pcm_substream *substream,
diff --git a/sound/soc/codecs/cs42l51.c b/sound/soc/codecs/cs42l51.c
index 0519affe0ed8d..4b964c7133982 100644
--- a/sound/soc/codecs/cs42l51.c
+++ b/sound/soc/codecs/cs42l51.c
@@ -533,11 +533,18 @@ static int cs42l51_of_xlate_dai_id(struct snd_soc_component *component,
 	return 0;
 }
 
+static const u64 cs42l51_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J;
+
 static const struct snd_soc_dai_ops cs42l51_dai_ops = {
 	.hw_params      = cs42l51_hw_params,
 	.set_sysclk     = cs42l51_set_dai_sysclk,
 	.set_fmt        = cs42l51_set_dai_fmt,
 	.mute_stream    = cs42l51_dai_mute,
+	.auto_selectable_formats	= &cs42l51_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 	.no_capture_mute = 1,
 };
 
diff --git a/sound/soc/codecs/cs42l52.c b/sound/soc/codecs/cs42l52.c
index 9d6bcfbbf0b20..10760816a5f91 100644
--- a/sound/soc/codecs/cs42l52.c
+++ b/sound/soc/codecs/cs42l52.c
@@ -883,11 +883,24 @@ static int cs42l52_set_bias_level(struct snd_soc_component *component,
 			SNDRV_PCM_FMTBIT_S20_3LE | SNDRV_PCM_FMTBIT_U20_3LE | \
 			SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_U24_LE)
 
+static const u64 cs42l52_selectable_formats =
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
 static const struct snd_soc_dai_ops cs42l52_ops = {
 	.hw_params	= cs42l52_pcm_hw_params,
 	.mute_stream	= cs42l52_mute,
 	.set_fmt	= cs42l52_set_fmt,
 	.set_sysclk	= cs42l52_set_sysclk,
+	.auto_selectable_formats	= &cs42l52_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 	.no_capture_mute = 1,
 };
 
diff --git a/sound/soc/codecs/cs42l56.c b/sound/soc/codecs/cs42l56.c
index 4d9a22a1029c6..9c6448ebb2cf3 100644
--- a/sound/soc/codecs/cs42l56.c
+++ b/sound/soc/codecs/cs42l56.c
@@ -960,11 +960,19 @@ static int cs42l56_set_bias_level(struct snd_soc_component *component,
 			SNDRV_PCM_FMTBIT_S32_LE)
 
 
+static const u64 cs42l56_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF;
+
 static const struct snd_soc_dai_ops cs42l56_ops = {
 	.hw_params	= cs42l56_pcm_hw_params,
 	.mute_stream	= cs42l56_mute,
 	.set_fmt	= cs42l56_set_dai_fmt,
 	.set_sysclk	= cs42l56_set_sysclk,
+	.auto_selectable_formats	= &cs42l56_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 	.no_capture_mute = 1,
 };
 
diff --git a/sound/soc/codecs/cs42l73.c b/sound/soc/codecs/cs42l73.c
index 6ddc6549492af..72076ccf4570e 100644
--- a/sound/soc/codecs/cs42l73.c
+++ b/sound/soc/codecs/cs42l73.c
@@ -1163,12 +1163,19 @@ static int cs42l73_pcm_startup(struct snd_pcm_substream *substream,
 #define CS42L73_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE |\
 	SNDRV_PCM_FMTBIT_S24_LE)
 
+static const u64 cs42l73_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B;
+
 static const struct snd_soc_dai_ops cs42l73_ops = {
 	.startup = cs42l73_pcm_startup,
 	.hw_params = cs42l73_pcm_hw_params,
 	.set_fmt = cs42l73_set_dai_fmt,
 	.set_sysclk = cs42l73_set_sysclk,
 	.set_tristate = cs42l73_set_tristate,
+	.auto_selectable_formats = &cs42l73_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static struct snd_soc_dai_driver cs42l73_dai[] = {
diff --git a/sound/soc/codecs/cs42l84.c b/sound/soc/codecs/cs42l84.c
index f2a58163de0ed..71d40f74adeef 100644
--- a/sound/soc/codecs/cs42l84.c
+++ b/sound/soc/codecs/cs42l84.c
@@ -663,11 +663,17 @@ static int cs42l84_mute_stream(struct snd_soc_dai *dai, int mute, int stream)
 	return 0;
 }
 
+static const u64 cs42l84_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops cs42l84_ops = {
 	.hw_params	= cs42l84_pcm_hw_params,
 	.set_fmt	= cs42l84_set_dai_fmt,
 	.set_sysclk	= cs42l84_set_sysclk,
 	.mute_stream	= cs42l84_mute_stream,
+	.auto_selectable_formats	= &cs42l84_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 #define CS42L84_FORMATS (SNDRV_PCM_FMTBIT_S16_LE |\
diff --git a/sound/soc/codecs/cs42xx8.c b/sound/soc/codecs/cs42xx8.c
index 12fe9b3e2525e..056665f806122 100644
--- a/sound/soc/codecs/cs42xx8.c
+++ b/sound/soc/codecs/cs42xx8.c
@@ -393,12 +393,20 @@ static int cs42xx8_mute(struct snd_soc_dai *dai, int mute, int direction)
 	return 0;
 }
 
+static const u64 cs42xx8_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A;
+
 static const struct snd_soc_dai_ops cs42xx8_dai_ops = {
 	.set_fmt	= cs42xx8_set_dai_fmt,
 	.set_sysclk	= cs42xx8_set_dai_sysclk,
 	.hw_params	= cs42xx8_hw_params,
 	.hw_free	= cs42xx8_hw_free,
 	.mute_stream	= cs42xx8_mute,
+	.auto_selectable_formats	= &cs42xx8_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 	.no_capture_mute = 1,
 };
 
diff --git a/sound/soc/codecs/cs43130.c b/sound/soc/codecs/cs43130.c
index e7b06f962790d..38b90edd8b228 100644
--- a/sound/soc/codecs/cs43130.c
+++ b/sound/soc/codecs/cs43130.c
@@ -1609,12 +1609,24 @@ static int cs43130_set_sysclk(struct snd_soc_dai *codec_dai,
 	return 0;
 }
 
+static const u64 cs43130_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops cs43130_pcm_ops = {
 	.startup	= cs43130_pcm_startup,
 	.hw_params	= cs43130_hw_params,
 	.hw_free	= cs43130_hw_free,
 	.set_sysclk	= cs43130_set_sysclk,
 	.set_fmt	= cs43130_pcm_set_fmt,
+	.auto_selectable_formats	= &cs43130_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static const struct snd_soc_dai_ops cs43130_dop_ops = {
@@ -1623,6 +1635,8 @@ static const struct snd_soc_dai_ops cs43130_dop_ops = {
 	.hw_free	= cs43130_hw_free,
 	.set_sysclk	= cs43130_set_sysclk,
 	.set_fmt	= cs43130_pcm_set_fmt,
+	.auto_selectable_formats	= &cs43130_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static const struct snd_soc_dai_ops cs43130_dsd_ops = {
diff --git a/sound/soc/codecs/cs4341.c b/sound/soc/codecs/cs4341.c
index a44e6b3c298e7..74544c58a4159 100644
--- a/sound/soc/codecs/cs4341.c
+++ b/sound/soc/codecs/cs4341.c
@@ -171,10 +171,18 @@ static const struct snd_kcontrol_new cs4341_controls[] = {
 	SOC_SINGLE("Popguard Transient Switch", CS4341_REG_MODE2, 1, 1, 0),
 };
 
+static const u64 cs4341_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF;
+
 static const struct snd_soc_dai_ops cs4341_dai_ops = {
 	.set_fmt	= cs4341_set_fmt,
 	.hw_params	= cs4341_hw_params,
 	.mute_stream	= cs4341_mute,
+	.auto_selectable_formats	= &cs4341_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 	.no_capture_mute = 1,
 };
 
diff --git a/sound/soc/codecs/cs4349.c b/sound/soc/codecs/cs4349.c
index ced1270c4d68d..4f04338fdf9d0 100644
--- a/sound/soc/codecs/cs4349.c
+++ b/sound/soc/codecs/cs4349.c
@@ -229,10 +229,17 @@ static const struct snd_soc_dapm_route cs4349_routes[] = {
 
 #define CS4349_PCM_RATES SNDRV_PCM_RATE_8000_192000
 
+static const u64 cs4349_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J;
+
 static const struct snd_soc_dai_ops cs4349_dai_ops = {
 	.hw_params	= cs4349_pcm_hw_params,
 	.set_fmt	= cs4349_set_dai_fmt,
 	.mute_stream	= cs4349_mute,
+	.auto_selectable_formats	= &cs4349_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 	.no_capture_mute = 1,
 };
 
diff --git a/sound/soc/codecs/cs48l32.c b/sound/soc/codecs/cs48l32.c
index 086ed0f57a85e..bd535f245b870 100644
--- a/sound/soc/codecs/cs48l32.c
+++ b/sound/soc/codecs/cs48l32.c
@@ -2367,6 +2367,16 @@ static int cs48l32_set_tdm_slot(struct snd_soc_dai *dai, unsigned int tx_mask,
 	return 0;
 }
 
+static const u64 cs48l32_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops cs48l32_dai_ops = {
 	.probe = &cs48l32_asp_dai_probe,
 	.startup = &cs48l32_startup,
@@ -2374,6 +2384,8 @@ static const struct snd_soc_dai_ops cs48l32_dai_ops = {
 	.set_tdm_slot = &cs48l32_set_tdm_slot,
 	.hw_params = &cs48l32_hw_params,
 	.set_sysclk = &cs48l32_dai_set_sysclk,
+	.auto_selectable_formats = &cs48l32_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static int cs48l32_sysclk_ev(struct snd_soc_dapm_widget *w,
-- 
2.43.0

