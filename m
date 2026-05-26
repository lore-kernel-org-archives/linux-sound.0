Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010013.outbound.protection.outlook.com [52.101.228.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A82E1AAE28
	for <linux-sound@vger.kernel.org>; Tue, 26 May 2026 02:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779761924; cv=fail; b=n6TqtV94JxDI7hzqN7uincb9+S9SwhTqdDgTOaPSLfmvDI36MDA39pOob9YxR819o5UsgX2JoFBwG///vQ/rmc2r4IrdxsAMSlNJSZLLYgYqBVIXWQbm1u+VsaCEeGwxdW2AMEsQ13gh0xHZfh/k8VmIQKNL4Ee/k1cP1wvPjB0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779761924; c=relaxed/simple;
	bh=QngciMv97d4IUWby0Lwrp7ZS8+PXvATdYg/HlaEkX20=;
	h=Message-ID:To:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=ACbzkKyBkbWkbQ0loFFKeggkSxMVm7va3Y9pXGWKEHO1tm3BJeLW6DtWwll+6g9HnnaRnQXN/79HrtAnMFMqWDrSO8gEleaQV5ku2Djq9BVoTu434bxi8wdykGDr6sBPAyjDjZK9TBwGAMDODhp0a22dGZM3KFIlsqxQon8nZM8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=RkUHWZ80; arc=fail smtp.client-ip=52.101.228.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="RkUHWZ80"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BHkhy9TZxqnn/LZnAeCexNZie8XHtqFg1l+Dwnd6/4BHt3BdJC4pDXQiJzyNxBjXrTRfSAk+V6luNwgWW5R5WbZmm2OX0E0mj4YiqkF4UqQfE0MmpOW9913Wg2LyBUCnQbS7qv/jkGcPVFWCahr4AAI6loTMROU+bA2QWV8ix9hJCUqbm6pfclAqY9rX8CkenZq9evK3oUTaJOID+6NZARZ1SM3ZImN4x3RPWgHr7xeV/ApwffYzawrZC1KrXoObAGbdsjE8hZId2dVm9W8PjU0rKeJrxa43oiNa2tcYOqGeXD23fsagWOguGoR+n+eiKmNPhbzAVNXq03rYd11bKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yiXv1ZliIVYW0b7ZniNAmRcJrAzSbp4w2Qqs2sDbrY4=;
 b=a+pwVK0fmpOhZ/JJ6wsKlmzzUrwRkFjPOMXjQWqKsZaqxIlKmDJJVc2qgeaCLGsCQUlOouy4fDJV8L7udHbEWCFXKKIoSOYkMj7NUqcE32BAGpnKnyq6/oXFtgf4rJ6taDcDNfC1OaJLAhcmAfrflb3dc0+maMVUoC3rHMPtvYJEx0ZL/BDF59CXYkTngxcM1QExI1MMLONyOZIybJq5IflgNejvq+i93b9ZFhsMofBo1x2ER6mgVQrN9WxuJiinX3ocTDlH7QyxvkHQyn2nLYpNR38ebE5hiOcOxumIYpvsEniWUrMLabt1/wNJIMyzJ9QYT19sY7M4okDaSKqXFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yiXv1ZliIVYW0b7ZniNAmRcJrAzSbp4w2Qqs2sDbrY4=;
 b=RkUHWZ802I4wqxRMej0WasU3mOFAVZQ39n/C5Q509uHKgCbKdrsYmld8An7AV12Z2c3hOC9wbOTGAUHq/zPvm5D3gZMTpFrlvXU4VKUMdTu7sP8kfxKlIgF0w/boavtTVxt4XJeyjGWmNI2g+xborwrdLMR+/RSSfevQTYp3JqI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OS7PR01MB11916.jpnprd01.prod.outlook.com (2603:1096:604:236::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Tue, 26 May
 2026 02:18:38 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0048.019; Tue, 26 May 2026
 02:18:38 +0000
Message-ID: <87o6i2hq0z.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH 34/83] ASoC: codecs: isabelle: use .auto_selectable_formats
In-Reply-To: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
References: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 26 May 2026 02:18:37 +0000
X-ClientProxiedBy: TYCP286CA0138.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31b::13) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OS7PR01MB11916:EE_
X-MS-Office365-Filtering-Correlation-Id: ec7d4c1c-1ad1-47c6-1267-08debacd18a8
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|7416014|38350700014|921020|56012099003|18002099003|22082099003|11063799006|41080700001;
X-Microsoft-Antispam-Message-Info:
	S7EeCHjffE5KScoEKBqASBjVUNAJl1+zC1HrT43gFpflmJ1pKRKfO5NQQ08oCrKVqk7Ue/B+utQ1hsdQkCReTjfO8ejh7eXvR3qybeSdlVZcjQGUTXSn7cuY8N1WEmJ10m9GRnl01w8vCZKWk8Z+LRhcqZWFwI3ijFmQrBnzl9hQoZoaT6B68LW54s7DKFHH6Cyf54sKZfzgQWtJgf0sYNpe7+sDdBESvnY/NzPvvmYvP2kMRFQ4DQtAs0xHGYKMG2aLM0A1Zv4HQ2xZPzAnDTUJ7N8pQhJGP7fZ7Y8Mc9ZHBP8JOcV/b7LBJXpIh2enUKeSFbmCzngl087zDiGS50aePzIM5EPq4fiLaRfhnmk3TFF75Yk+74ZOOLbQSxipJYxQnzL7lR875Nrs7xYs3IM6HNOSoZ2zitIuI+xoXVJl330RVsGdujbH7DqZIPv7PZmKwR36OgGA5aT3fbo3qOGETtYvr2RB30uqJ1FhbF1MCm0XEwEfOUYpmnZt7eA57MHIRWFG3IOF0zmVE8+8YA9LuRJ2Xik+U7DlUsTxNAH5goOCK5l5uXNsHX5uoyxsHOZFXQrKoAKb9KB/XVE5sXlqkn4VP8DmaONj5bsR+54rjkqL5yz1ERW8lp5i2ZTfoH2GTl+OUyCtDROIqnNMqyV+81EwetvwYqcpI952xrdM4MdNG8m3v7eMuazZdrcWlTkECvJy49lIPe/D1ut8p2ZJ7oU8mTU4Vi/3BEoaUmDJY+EUpCIdc409O1iFO3W98nBhvi5Ea+Dy7AUbchIBToOkXUsz41W3JWzvG1QsyXQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(7416014)(38350700014)(921020)(56012099003)(18002099003)(22082099003)(11063799006)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?AqY9lkijQBy3lrStb690ksb0+9GsfyMAf2hpWoLAaiHAvUYUIlD4tqbYwzUF?=
 =?us-ascii?Q?ZtPWsKxVYfKVpvM6NUmEHqFAozxhdrn+9PXNLmk7dTAjwwFFem/4Z0+8gCDS?=
 =?us-ascii?Q?icpJ6aMeIPCL4qW5EJyt96ucp/uRbmEUq3H68LKVZARK/5RUdp7wULclZxmt?=
 =?us-ascii?Q?bZ+EWn2r6fzxFGdPdHbEVLeEPcq3JcaKOlJbaCwMEAVL4vDJOXSTSxh6CREW?=
 =?us-ascii?Q?iNOIP3gelrzvtIi9TkNkjf8OKF/6QnXe7utqN0iQ7RTNlwytaWHZFosvSDbh?=
 =?us-ascii?Q?p/oVmt4+AHOix8+P6IQb1qprCd4CboVlO8pc/ihNjhwStiossMBIyQIcRW8N?=
 =?us-ascii?Q?t39GLgMW/4bmhB1sgg6m49CuJFrLm5fGKxQAzhH20btvsxyzRkkuezofQBKw?=
 =?us-ascii?Q?COsklOe7qo5nOjdxUEm3Uy5xwJ7+B9rkmLfMvqgYNhuky9D1nIF/xLFH4GXK?=
 =?us-ascii?Q?OXq/ztnRe8V3NiVsJLX2lQ7CgrCfD0Cy5r7A/9OvP8ysjqaGmAZrTx+QrkLq?=
 =?us-ascii?Q?UTk4c3KWaO9JmQWPJB70ChWkcmBUxWNOG/aFve8zHnJDMrtQzZ0qXTYLQDlv?=
 =?us-ascii?Q?ulHMLCCLqX92e0eb65SmmxB45unRTG6Nt606V86bA1z7dN9ZtkATCvG3bk+U?=
 =?us-ascii?Q?WVsP/JcCUj6KGqfPVQHOp0X8bHhYnq4Uart0YnqRhoVWM2waby5SlWPqW064?=
 =?us-ascii?Q?oqsowwoZIgXTwwiGxCjN6puYxzcjS9xbyRpTqtMQQOD7KCaikG72xlHiu/9R?=
 =?us-ascii?Q?6tH4Fjp9sNrcU4nfMtXJK+/73N7AVV3yrCRH7x1/rpDWx9rCDF2XrnwpDsat?=
 =?us-ascii?Q?MH9fgR+DRKcYR4qE5YidOEKpzVFoPr8eO6/rm97NDfjfVKgs4DAP2kXfX+OR?=
 =?us-ascii?Q?Lk2GsSh//zxyjdLAsG1fyQnAZI87/wvF8Ind37MK2aRLD3J43rxBtGJisTl2?=
 =?us-ascii?Q?vUUtmlxLN7rmxC/jfWE6Ag+hHLLFTXIG1KJaNDNR3VOq6w0nMUe31FjvtpbH?=
 =?us-ascii?Q?xePnkdy2JWbrFnmdzP1RUBtCOMeBBLegiGeJDsmMMx7KBa1zKW0eYjVsHgAN?=
 =?us-ascii?Q?ciI8IAbWx00+dAqFc0Ho2ZlGdtjpP1+DzncKDJP+q8M5PfWHnl2Y8bdhcals?=
 =?us-ascii?Q?KMNPnABA4yzaCQMD+mQ9gotb8RHf+LN+YDQTcYNr73G0sM85UDTseadAn37w?=
 =?us-ascii?Q?p6VK0ZVMjKoZKE7sSxuBejRqmGKbQVn2aFi7ML3cphOniR+skESinSBG15Qx?=
 =?us-ascii?Q?sKdvIVIbRxlR6/x5jV20kGVN4A8viF438rAF69Ild3PxCPOLjG86V9XzQKTn?=
 =?us-ascii?Q?u6qpqXxMTFqaWteIvhrktfcdeo47nGTVmb0fs6b+dwbwCRdFxESyoac+qU/B?=
 =?us-ascii?Q?YESzxSq5vh1jO7rMrVWR5h5IL42hadsrLzQy39QlCdgh1/6/2p8F/i8ExI6h?=
 =?us-ascii?Q?WvK1qGKjnOx+OuDrwNxg4pjcL9T6Or/gkex0eVkDwe1gYuXWodXDFmLyzcUi?=
 =?us-ascii?Q?9J/bXimQVRDEyZ3MNzvTeaMph7uHLhXZ7Od6dHi29W0TeJsbl6zu9VX8QEct?=
 =?us-ascii?Q?KSOfQuCOflPmJ7oCCbcFvFDnHrhlzzLafa3gnwMcFwzfK/e4n57NkTWyXPQk?=
 =?us-ascii?Q?5xxfbcKDz/OPNZi5uZyaknV5yH1ZnYHIoBSfhZ3oFsDiPh9agI8yTEUGcKQ8?=
 =?us-ascii?Q?2PRIuxaXn1yKzGeFX3cq8aidByMcb0lgX5d/R2ZRTIHEaHNwIHRblbkSV9XU?=
 =?us-ascii?Q?7YCY5CgP6acQEf2CyUmpU6QWX7RV7OarsnTIUKIbVha10VfSSA0L?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec7d4c1c-1ad1-47c6-1267-08debacd18a8
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 02:18:37.9602
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B9xo9ZKSZQBGMIy/tPCslPRzq5DM+xlllcapS6oYnEM8128QtNCEsbRRloTnsxJC2hhE/zKNPm4D4V1jMZ06yrGXe+IX6FxxFOodYnwM/xap03oLH7v0uN0POqm86Dbl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB11916

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/isabelle.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/sound/soc/codecs/isabelle.c b/sound/soc/codecs/isabelle.c
index fa1c23dda4eb6..7e8dde79b11a8 100644
--- a/sound/soc/codecs/isabelle.c
+++ b/sound/soc/codecs/isabelle.c
@@ -1011,10 +1011,17 @@ static int isabelle_set_dai_fmt(struct snd_soc_dai *codec_dai, unsigned int fmt)
 #define ISABELLE_FORMATS (SNDRV_PCM_FMTBIT_S20_3LE |\
 			SNDRV_PCM_FMTBIT_S32_LE)
 
+static const u64 isabelle_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_PDM;
+
 static const struct snd_soc_dai_ops isabelle_hs_dai_ops = {
 	.hw_params	= isabelle_hw_params,
 	.set_fmt	= isabelle_set_dai_fmt,
 	.mute_stream	= isabelle_hs_mute,
+	.auto_selectable_formats	= &isabelle_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 	.no_capture_mute = 1,
 };
 
@@ -1022,6 +1029,8 @@ static const struct snd_soc_dai_ops isabelle_hf_dai_ops = {
 	.hw_params	= isabelle_hw_params,
 	.set_fmt	= isabelle_set_dai_fmt,
 	.mute_stream	= isabelle_hf_mute,
+	.auto_selectable_formats	= &isabelle_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 	.no_capture_mute = 1,
 };
 
@@ -1029,12 +1038,16 @@ static const struct snd_soc_dai_ops isabelle_line_dai_ops = {
 	.hw_params	= isabelle_hw_params,
 	.set_fmt	= isabelle_set_dai_fmt,
 	.mute_stream	= isabelle_line_mute,
+	.auto_selectable_formats	= &isabelle_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 	.no_capture_mute = 1,
 };
 
 static const struct snd_soc_dai_ops isabelle_ul_dai_ops = {
 	.hw_params	= isabelle_hw_params,
 	.set_fmt	= isabelle_set_dai_fmt,
+	.auto_selectable_formats	= &isabelle_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 /* ISABELLE dai structure */
-- 
2.43.0

