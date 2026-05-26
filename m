Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010051.outbound.protection.outlook.com [52.101.228.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 744FE304BDC
	for <linux-sound@vger.kernel.org>; Tue, 26 May 2026 02:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779762432; cv=fail; b=VPzGpYRjklnz+UoCdfrLa4jBhFifzJ2/rKXrlu0VSAR1FcRCuxsqN0JGCycN+enmZFcMpxanXFhIGbX0OmyORUsFIUFmg58iEjlMcSWsRh8ootHFwVFULsO6y7vjugJJ/+H/c4Ndhe8LutXWFwGM9Ij4lLLd9JSJ4VPBr3kUURs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779762432; c=relaxed/simple;
	bh=Ze/cAuL8MdhZ92SYV4/CRBei5fzNKQ1nM/J0JCgKvVk=;
	h=Message-ID:To:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=fGqosApPUEDlrIUuLPQkDOdfafICHrAIrA7291RoR8vx9gSv6YpmBPW1Iq6iTFKwpscHtKyl9rAYsdNTWnlrfMOGd8Fa8Ll/oUYWgc2nHXNcrFF5gfjS5cOkN8uC6RN0pEyBOX7xNUZLCzvgJRHBnURmVDmzMWfak66xtM21obo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=I8zduNQG; arc=fail smtp.client-ip=52.101.228.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="I8zduNQG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kQnF2wPcRGKyYSJ9geJeTZ4aeR8nS23Kdip4ZvkxxmOF3mWNXR/iaj9AADzApm1CaLtFdlnY6KSljqsAH8DwbDo7njObOvsjPC01AvEjdxWcsZJEnvCnOFs8zmmhZFlJuSmfeDFPLWw5kVTTG+LcqJJvYqbIvup9g0X+9GEXlsMD2/inKgsu5hHifXiqXMHIxW1PRydZ93XukMgVoo9ffS4N+ChkQCelFLdvTEN9RHGdHIxkU1fRtHXJkkz7SqF0nq3vSBS1jQ1SjOsViCMyD3KhaJd1OzOITs1Y6YGKSJRiLsJW7irGSsNNr61ihPi+ktOemhHDvwjPV9zkNXn4QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bb3iWeAhakrOTzncOjHnqAQMOpAKPU+qhZpxO7ptQwg=;
 b=Ocu4UdcejgRegvQnJsnconu2LVSiuAzjzPBFvpEFKF5MMOYf/ykrO8TuAF1dqlf7xtvi3qhdf299Oy573D9nfkXPiMnwTFk33XR3KxwMXZ5/YLG6G5puHFd+NAVs2uU662/lSzvpODeIrPL59bjR24O+6jYvdXUb9OwIznHImfmba7w52mI5yffvdrIE3E56JDME5Qlu8njfCBq8D9MU07QZvNLFfvsqgZcUPDUIRuoxuZ90H388qRo3jD/wiSGWSCdn9J2ImQWuP6/EwJANHBpU971H4N3TyNkaGxkOM6P6O34Katt+1OsTFrAgposhHAnBGKVdxBlMaNlin35q+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bb3iWeAhakrOTzncOjHnqAQMOpAKPU+qhZpxO7ptQwg=;
 b=I8zduNQG81mROfG6KBpLkF3bsF7jwNTZp+kW+5Mzz6ygif1iZs3gqzaALZ0SFPH7y1rMjLw6hE0YFLMECiX0stD2jbHDohzEltMnJw3N7LmQ5PGjQyG5dzRJl6X6rgY0UzWsajqXSVUWBlX2W+gwNthxWGUYTdqaaXUTyFhMnuM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYRPR01MB13144.jpnprd01.prod.outlook.com (2603:1096:405:119::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Tue, 26 May
 2026 02:27:08 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0048.019; Tue, 26 May 2026
 02:27:08 +0000
Message-ID: <871peygb2c.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH 75/83] ASoC: spacemit: use .auto_selectable_formats
In-Reply-To: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
References: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 26 May 2026 02:27:07 +0000
X-ClientProxiedBy: TYCP286CA0239.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c7::17) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYRPR01MB13144:EE_
X-MS-Office365-Filtering-Correlation-Id: e2aedce6-8a12-420f-4856-08debace48df
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|1800799024|366016|376014|921020|38350700014|18002099003|56012099003|22082099003|6133799003|11063799006|41080700001;
X-Microsoft-Antispam-Message-Info:
	OmB1T2q370+DLyBJQQu9MmzZe8y6LpcK0fqkoY40ShdqAeKTfOvZnYVGHbch0WM95VLNWOnmMXPGC94ouy6N9V4Jffb4robmVgxDRZTy09flJEjjE7wXCwvRkJTqejd85MYP9W+Fwdp/5qS58BFOikfq6lZILtEdtu0bCOHyWGapIIRTv1RocEwVrazt+vYK631Px0Prs5j+6zSzcNYKYtnOhtO1wGkVKqPKOvFml/CMfEOfIJS8PekyHZ+hK8vLQfJMwxkZZVKsO/GGha0ayQ++K04rESFVsezB6VBOVgFB0uFWUvhC36PlbWHihgDNvp7YR0hlfWQ7YOsQi1ZnuSoDzIlqlzUbpMutqnjy/e2aCatZdU0Pzv6VH8p0fh9644Oh+2xk6iNvZWVbjlkMPn4NRunIPjF48v+3ptgxvzKAJjY7xnrYja2peQ6qzQiJxMjB7xajNLvMqkBvY4LtD9atG/F1nIyvtELxU4PZgqNA0vqYKFoYujfxfRrh9IHrjq0Mf8ezPOISGiE4K/CH1Q79zXmEVKdoPaXDO0XKQo5kFAH4bGB4j3LZgs4RJsRPs334YCmVd43sJCuvHuxJrMz/JyVyWyKequOzFU3DgwNE2KNWUsvIqsQkjaK35pbE582qN2eB8bdAy1NOJNaMvKx3fOWGzkk2WMBuhITUbQbkVl+qscSNiXJEUiKeAJfhrrbVzasInQvSN/6tHZRcXCXTCB5Cp9H6gi3tk1l5LL/nFbyUnotxHWJ8F6Zl+cvijZiZv2DNHDnZEDXVQJOhPzC56bQwG50hvcBUUKFlOow=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(1800799024)(366016)(376014)(921020)(38350700014)(18002099003)(56012099003)(22082099003)(6133799003)(11063799006)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?r1UIXquNEiFGoMp2r3SnWSWE2Tdg1m/NhkV8FbwhNAitb4HTVzwuerqwBM5I?=
 =?us-ascii?Q?nK+uohx4I0YzRWBWcSqKT5UPMerIOZcfObCBh8C1B8AR9y7mSrJ4XP5MFOYz?=
 =?us-ascii?Q?mwRdOoGo951KsToCa9DbUJFnUueMUmBhnSmowVqvoShZVEAT+3y948K43N/N?=
 =?us-ascii?Q?5lOJJLGFS3O1vwrdIpEVzDxWw+rXDAE/1xasSSZ52iykp3lQ1idt3gdcKJ7K?=
 =?us-ascii?Q?bwaaTyoIKcR8mRWzTTjRsfDb0XLCjJQ0Cs+UVqZUEpw91+IsfK0siAu+l+/c?=
 =?us-ascii?Q?ZSowDcjIk0RYFqoPOYUFFvUPDeANtk95YmInrQGt9IFhTN/3f+hWPNKAOiIw?=
 =?us-ascii?Q?fvRPYxfvUimFHuJ6OQNRo3hra5HpwFgJXpPKDMdylFuVMOGoV8gcKqePPgY4?=
 =?us-ascii?Q?LzFzSBJRItw/gcxUqyRLgD0lKscR44TSiLaRktczsIvn4PV7I9CH0zpBgTQD?=
 =?us-ascii?Q?prU49/cZJFFEPFJ7+dUANLjJujLVkd02ZXkOqG758hbMqhUl3qXADL6X18+y?=
 =?us-ascii?Q?n++rkfLoGvhrYckaYAI0ZO8gwLC4Kl3EBpWcL9NOsFMN9hGAOJZat4ZqsNFg?=
 =?us-ascii?Q?JGvZcDMDyKm07UOBcuVCervQn7Cyl37oIQpIVpw8ntdK4kh0C/w1NgnYxDgx?=
 =?us-ascii?Q?t+K1gTAo1+a+JUekMwWaD5OBYF4RLrO10ZE21GNWeIxBxV1sYLKA01oWr/eV?=
 =?us-ascii?Q?MdPgxHXaIYYLlBSsjAH7l+9jbF1GXW0jF2eDwCjzia0ep6ciiuyS43WlYauM?=
 =?us-ascii?Q?WDKF6nHNsTBp09u6tBy9qO2iMPgsXgag7g1Avq+PFLFWmdw1YSrYzhogJ9YD?=
 =?us-ascii?Q?LOeU7G090dfXXuh8hqyU7F6dXLfOI0TsDvn8ATFXG8hQ8iifLptykINMmpWS?=
 =?us-ascii?Q?Pw+zdjMVTfREp4JWnr9vNldZcDPBdDJTO7JUE/jfZ9Crv5meGZvOKg4TqW0C?=
 =?us-ascii?Q?mDHbV3ymRL4CJy6OM6MykRdjxqIRkkhIUysADqQHd5s+5NAmC2xRlNV/iwLQ?=
 =?us-ascii?Q?+4Unqs9g6Wp1sQFqrGNBrW++PypaDlktRLPGKNuWdxaeGg8zKu4Cz5nBpoMZ?=
 =?us-ascii?Q?7UizLjHQfD17fu5t8oNVbovmY/1JIGjq8XwqYFe+KtKdJr+a3+Y5ZaSY4CIT?=
 =?us-ascii?Q?4ZqfEP8I3qobVbNMuOZeLmHuf64iRWXfHjrkWNmF7qFhxq4FM3YJpKh8047Y?=
 =?us-ascii?Q?VYk0eUENcCG7xN5C9YcPn0fZ2C95KK32tpWggxioLuDJI/RkEe9oVojdZZQ0?=
 =?us-ascii?Q?r8TyL2Hp/Gd5X8w/JleCGv7WWd229F7K39oUh8r5+ZU1ffIp8NAuEC/3pkxX?=
 =?us-ascii?Q?/a2K2vUHs+8GEMW7U3wAMo39r5Szt0r7ZZykVWVqfeJhEZyNZ/axgAj7PQLH?=
 =?us-ascii?Q?AByQuuiAGs/vWVmmdDWl6G1FX4bvMIkKv2ZXtDAZQP5ItYoKQGr6UQPKnp3W?=
 =?us-ascii?Q?qhLn4L1FHfjM7hBK9dsPPQ2WmjuMtyuITXPjRWrxwi60QAGcqaJf181byme8?=
 =?us-ascii?Q?yHn3ED3SV1GFAJTpiM8OQfL9WwRrc6crQKvrHQRdINl4xaQsLZbClKylW6xH?=
 =?us-ascii?Q?KoLy63lT60FjQ8muEUHicR5UHADJtCdsZj0rboGkyUG0O6k1Yl0Y2sfq1I8o?=
 =?us-ascii?Q?Tzom7mdDGUcDvpT8xsrniOIodv+2vgCziYRiX6j85fTmsQiEFMet/BV4uW33?=
 =?us-ascii?Q?AOsIZTQoEca2h7NcDWBHfwYi2PX8E/SCXmXLqV+c2v/W+nHu7BxvpPBD9mFk?=
 =?us-ascii?Q?mv+UaNp2dZ17KYmbQu57UpYs3iPecZSqIyvCoyMuh41921sXebQ8?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2aedce6-8a12-420f-4856-08debace48df
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 02:27:08.3417
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LOQmSNwaPcf9OiV2aAgz6KsPNL6mBF47B4vFU2OCjxZxGi31PbGtMpT8B+i54YOkbsnHKj7WMCe+P/PgJBxPN/0srqQYJkcX+EF2XSdYGgkLM3AmFhoQ0SHhVpiLPFgu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB13144

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/spacemit/k1_i2s.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/spacemit/k1_i2s.c b/sound/soc/spacemit/k1_i2s.c
index 5420ca2aefbd8..5a7b6d89efde1 100644
--- a/sound/soc/spacemit/k1_i2s.c
+++ b/sound/soc/spacemit/k1_i2s.c
@@ -317,6 +317,11 @@ static int spacemit_i2s_dai_remove(struct snd_soc_dai *dai)
 	return 0;
 }
 
+static const u64 spacemit_i2s_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B;
+
 static const struct snd_soc_dai_ops spacemit_i2s_dai_ops = {
 	.probe = spacemit_i2s_dai_probe,
 	.remove = spacemit_i2s_dai_remove,
@@ -325,6 +330,8 @@ static const struct snd_soc_dai_ops spacemit_i2s_dai_ops = {
 	.set_sysclk = spacemit_i2s_set_sysclk,
 	.set_fmt = spacemit_i2s_set_fmt,
 	.trigger = spacemit_i2s_trigger,
+	.auto_selectable_formats = &spacemit_i2s_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static struct snd_soc_dai_driver spacemit_i2s_dai = {
-- 
2.43.0

