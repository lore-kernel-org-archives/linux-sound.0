Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011055.outbound.protection.outlook.com [40.107.74.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B91E2E2850
	for <linux-sound@vger.kernel.org>; Tue, 26 May 2026 02:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779761441; cv=fail; b=hD/bEjvXhqoN9ipxPjTxJeo6rakfNVa96QBy1WVi5bx9r8/q30NzCmFKMRjuaJD7goZ0i3JG6QgBzgYc9y1cagqo3UYkIfXgc11HpLas+aJerRejdQ9eiCAnTb0gzpYiu09J/gIW+tAvBifI/ecx+DA9DxJ8ZUbZ6c3CEPaVUAQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779761441; c=relaxed/simple;
	bh=u+18n7jF/wGEiM5lb0F1UIDtWDuFGO7GlySjvL11yPk=;
	h=Message-ID:To:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=ibTb2whh1qZ2kt8titJtGAFv8Ar6igo7kJxj2MZzxqzRIzn7si0AndM+Xhz0d03fyIBx8eKDjaT60NmyP9koRDc1iTqhf6b2jrIgy3GGcWjW+q23L3ioqoF0BuXfbS5z8dKgiUhKmbxplD82VlWnyeuERmee2Zw5f+1asy+JNtQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=YAr/gIA0; arc=fail smtp.client-ip=40.107.74.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="YAr/gIA0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O4zb21avufYaP/3AoX++b9Bs42YDUU+0N/SYSv8IYhua8WSkdk6Tcsbia6heUTinbXLkwFX8OHsDW0N3w5FA6isvF3CC3m6I35rH8w+whxCy1+koTNLUoJnMPaOlyRvb8TJ8OFIBAbSqgnrRKUq8mEA5haXrYOqcJ5Phc4LsRo/JBzyXRRhzUS8eFTWDbVjwXpWVIUABzWkV0m5t8nA+Gi5p+dGZ+X5/Be7L1Z/1gXAodD62osW/bG12WmCiTVui2LvrceFNOOITG3nHcoyg3Ds6Enojpb3mbHfUN7XFCf9QiQYqUydOqCEIltbLEGWqaATa6hrkf7bHs3hPe4XbRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sYiSAIV9TE8VhWoif5/O184zAO0hmaEvUPkf6/psrNA=;
 b=kUFoILtmvTgMbS3N4eFu8C8MWr4pU8sFSl8HG7bBAldtudpy9LTZ32eBgcsXGxVYunpS4+Onec/hm6nNEZs5MS1TTckHUO/tMILI56lnhyuLTsBx8em9xWnEExRVZyIYYmywzMAGuCw0abftWAuDPLxzO+5KEjZB0pBcYuJWx/JEgPWH6Ql3vGLYzVp7jeDFdqV2PDqUq2pTwDO+F2tqoFrKpDc+vdeZGJlmm+zYjMtfDzIYFhscvn/gVgooLwpWSPLGLVTv1WESK0FESXsbSNQKcnL219BElDlS3IgatPCLklI0I8fiX428a+9hPlLnOCnbb+Mm5dQf2nFeuzq7gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sYiSAIV9TE8VhWoif5/O184zAO0hmaEvUPkf6/psrNA=;
 b=YAr/gIA0U86+QytiiYIFb1Vqd9ydPSvY484ClekC75XVkmOUTKEyQFGM2wmdETc6ERMzhPaxgaTlYoKroHl1QAHVo+mHMcm+X1hy8W4aEikxH+kYgIquMt67jjGznGUwRgSFajkyLkQuos3MXRPAmEw8NkLsjEJW/XoGRwdjWD0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYRPR01MB16271.jpnprd01.prod.outlook.com (2603:1096:405:2ed::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Tue, 26 May
 2026 02:10:37 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0048.019; Tue, 26 May 2026
 02:10:37 +0000
Message-ID: <878q96j4ys.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH 20/83] ASoC: codecs: adav80x: use .auto_selectable_formats
In-Reply-To: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
References: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 26 May 2026 02:10:36 +0000
X-ClientProxiedBy: TYCP301CA0012.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:386::10) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYRPR01MB16271:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c582cf6-707a-449f-8450-08debacbf9f6
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|7416014|366016|921020|38350700014|56012099003|18002099003|22082099003|11063799006|41080700001;
X-Microsoft-Antispam-Message-Info:
	FgM+VA0lm4V76KPWZPJJBMoO40yBKH5kSUR5Bw+Bg67NGfUQxY2LZL4cn/uvO5LHbOY0iF5/CW3A/3EDOKFLPV7WtrZknqx+CcMWAVP4madx464WNpuFCSwtxeEka6lBqyzhs1nnK+1WP00mmmESQIT1riUggwPA6JF1anvNMqovmcUaSEKJvhwEphOd/5uuKji2rNlgpBKeUrh3gxBkIq6ivX3f7bsJ8F+bGM20sJOJZdZOhetMieaRRJAWYlRRdqInyDshRQXZ6xpzRrsSPN7Jt5ETMUGRY+gkkIwB7Ml+q5UcDeRA1S2lxMdZzDCRwc2gg9M3ohcl2AapXaVfA91EX+9f/zX3HYVliQW/GmvF7DvFPOHg3gCn56ithE/lWzWJjWlXGa5IXZIJe9WJbVe8Vj1PxNhIB0U09hy3walGs0jQQUTn0Hfi0MxbKDAchsRTWKWQ3tQ/b7qYu1ouoboVny4wPuX+OvLeiodV723e+ILnJAZj155/UDXZmSFjMQfpgmtqaicKHCzqNQ9xH8K1wGi1SGP+01l/87SbSUrbl1iuPndv2av/sjxf7Uhdq/k1oELbAh/ctHoBESZQm+IxOllwvarJEwo9x4kG+WBWX7NKuX6EzC2OGhqEi4FnEiftKeqvt5XE2FCVuPeFbZ8Mhg833+DfjDSC8MYbKlMf5jhi5T+zToKESLKxo/Iw9SbxlP4wm/+Jf1dwGr7Tgg68+0vECMnY/GkDeZM9A3IKKBa7jEs7WboPqxJKsUSJSkH+WJBAriE3ME09PA38Fwk2I2jTpSs5PtBmKBTgJvY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(7416014)(366016)(921020)(38350700014)(56012099003)(18002099003)(22082099003)(11063799006)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hYovPC1QwfZEBYxoWQEypynzd4w6TmdMn9GFZ+62ZFKDCsb+A3ZZYARBrwwk?=
 =?us-ascii?Q?sRC2TcVJfWzighXK8D6Gg85nn5/bxhGauouQE1s/Rt+VoJbiHOkOwjNTNFj1?=
 =?us-ascii?Q?ZErApYHasshiGjyDumQyYthvKBqHEfhxExwKCdQA5vwv4OlTRt9ZD+qBEHOZ?=
 =?us-ascii?Q?nH1ddw9NspoNILYYynuhZ/nJe2UBiP7o+v4NpATls5bFN4ov/sG0HAiH2PpU?=
 =?us-ascii?Q?kuMJalhkCeFjWGOEhj6RPOPgWJlvVbrQ8AGEjMe2saXYhEOGYIfGuF2OYoAm?=
 =?us-ascii?Q?Jv3jVxh923NHdCbv45q+PZzzGowkixfnxEeNcCgniv7oteimTcT5c1rLOTDq?=
 =?us-ascii?Q?fWzwxdOrG4xXGUCrrZAx4gJd2H7Zv7dZxXimCbo2dEJYrOLtrIq5Yt5+XXlW?=
 =?us-ascii?Q?g11XyDFRd2HjqUk9qDBkf9coVt1SJ/fwYrmzUteJVcLOEmkXDi565URwqJqb?=
 =?us-ascii?Q?Z33eGR+PmnPOeLdlQbEvAf6ppaoOC7xL6CLPxKdl55gFnWZ8akbUUJfZ4EAK?=
 =?us-ascii?Q?heA6HqbD2tjvHp+rJ8PNUaQP92H2W/3lPhMBecT1zJV1SZn4oognRaDlgXaQ?=
 =?us-ascii?Q?XZrGFCIcsSe2MohXkTOmqqLaCiw2cM/ZcMQzIOS+IrRLy+FS/vHN5hiiAcSK?=
 =?us-ascii?Q?iImhKkZiDIBITMtPSz9aWFNOKqjCw06595FmBggH2W7O23ZeRapQvRKSmBYJ?=
 =?us-ascii?Q?saCPb2KoP6/0oxEFuIOwCWSsvIY1LGgn20T5e4ueGfX35KiqVY+7R1Du6fQn?=
 =?us-ascii?Q?8dpSAYGQhVW768p45EgcKa9nygP858sYRSURYingRc5jFsIdzOoZI4zozEl2?=
 =?us-ascii?Q?RKoM6//iKr8fnoyElHCxfksbsqH7xyACeqO7y6UzW5Mw5KWueAuM5+VuROym?=
 =?us-ascii?Q?RMYFp68vJHcss+5LDr15u+BHH+XOMvCb0cfwZwJ6Qb+qONpWlwAGRfN/ggnJ?=
 =?us-ascii?Q?B9wBBQtlJ+EHO5gdU2Idr37aDqTn4IbU+HHrQzYxnsQnY6iPtX6SHV2EoDDg?=
 =?us-ascii?Q?2INPEbIqkrEZInU2DG7/hoNsSfC2ALno2dlP5pnzgZNuKbqk5htGrAVdk0h7?=
 =?us-ascii?Q?GvC79iDo+uIBg4s2PbTagiaS02KTU3Bwkj7/G+/T0L9g6LeFA6Zwi+kJjsL1?=
 =?us-ascii?Q?LyAvVO84/UyITqGKJDXn0K9+DsNiuJ9JZ/SvVabUUQXUaww9oA+vZ3qoBdUX?=
 =?us-ascii?Q?td5hr2v88SYrkOkYF1PKr8W87ayCpRM9QXCgqyidGJpBwCsF73YTCInuWD63?=
 =?us-ascii?Q?1QMSdmedw0Tpkh8hpEr4KLVyMMlkmws61jm4qgcjaE/TFCH1JLqihr2F79Xz?=
 =?us-ascii?Q?OJoGBxh1K8kypnyAUPLnHh/s58y7qdlc9Y0H0dST2WE1+1DSfw88KbQl6lqn?=
 =?us-ascii?Q?kLwe7WhSO5ZgxdQ3HOT6FUYD6Fv4dy+m4OlYkmH/3PFhdJqEO53I4HsYf7FY?=
 =?us-ascii?Q?m5X9YZsNZ0JP/TyT6ZwT/E6zJ3E7sc/WMEIwlpnb/LAH2ez//xeUcIefODjN?=
 =?us-ascii?Q?eG4ETWezsh0Zul1ZDGyg3U+RuBnIjmloE5+L945p5MpfcCnek4sgz+fUjV9E?=
 =?us-ascii?Q?3Sb44DCMBDW0Uyk01BB8ztc98GKkQVI2uAb+nPAo/2g2NKNRgzNZM/AgFVdQ?=
 =?us-ascii?Q?cl2e+5jtqsmsRiwNDnoUlgU0X6Gezx6fwCJy3eOwauLpoXI+5bMeYKuQlEUz?=
 =?us-ascii?Q?XTlWuP5LKaCs89T1xQK61z89BXLtwBEm4dRtJlAqsAp94C62HcXMYKemgfmR?=
 =?us-ascii?Q?IjKrdiqYWV1FisTf4HBQ+xfPzYAc0pI5QHdBh0jx8+ZtuMtjsO4z?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c582cf6-707a-449f-8450-08debacbf9f6
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 02:10:36.9239
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RXNIYUdaFEk9DTqAfa1cAwQw53g6HFH8UpEvH8oNq3QxPlamyvuwH9NduJtWn/ywoutO2SwpLN6fdbNS8xH6U2CXmEg79pKMOdxW3G6L85xDZYsb2d5wzFLKKhzJMH6z
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB16271

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/adav80x.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/soc/codecs/adav80x.c b/sound/soc/codecs/adav80x.c
index 8a89187f9c782..e97c72ac9b2b2 100644
--- a/sound/soc/codecs/adav80x.c
+++ b/sound/soc/codecs/adav80x.c
@@ -743,11 +743,19 @@ static void adav80x_dai_shutdown(struct snd_pcm_substream *substream,
 		adav80x->rate = 0;
 }
 
+static const u64 adav80x_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF;
+
 static const struct snd_soc_dai_ops adav80x_dai_ops = {
 	.set_fmt = adav80x_set_dai_fmt,
 	.hw_params = adav80x_hw_params,
 	.startup = adav80x_dai_startup,
 	.shutdown = adav80x_dai_shutdown,
+	.auto_selectable_formats = &adav80x_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 #define ADAV80X_PLAYBACK_RATES (SNDRV_PCM_RATE_32000 | SNDRV_PCM_RATE_44100 | \
-- 
2.43.0

