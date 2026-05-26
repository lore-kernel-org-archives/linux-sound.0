Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010006.outbound.protection.outlook.com [52.101.228.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2E582E0938
	for <linux-sound@vger.kernel.org>; Tue, 26 May 2026 02:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779761954; cv=fail; b=tY4LcYADf4iVe8is+0W4pM/PtrfARmr4HddrQaskVSLfQ0QgupV3bSnYyH03cRhAaH7xXHNINK8sN+XnKZy2Vpqk2DQpXODd8YYTeDd5A1qnSZvCVL2l6phnGkVnActlMTOIUB36Fc9x9EDNg9qd3JyGM/QMZM/sneKzrGiJTvo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779761954; c=relaxed/simple;
	bh=Df78sYG2VD2k1JuTYA/vgaGaApsrZj6ZCFsOLWRohDM=;
	h=Message-ID:To:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=g8dBAI/ihJzGVvjgJcY2dcGE2bdw2tIx0OCzmYIuyL/RiP+MxYU19TN4vJLva0yti0XrdCkMvJ7eDVBJCVApOixKgenBrITlLryRX5YChQYDwNrvCzKViLp5HylTtYLoDmdF/SjC8yjKbAdV82YAAr0ujU84BecYh/fZ7qGs4bw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=evXNtN93; arc=fail smtp.client-ip=52.101.228.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="evXNtN93"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZzIUgwkcM7UJnl5WCXJWHjGSeWDfe5uxxyFbsNblJPpLI70U37XAQ2lO4MhN405iD/oZwwVLt9r5E7PlyLkZR0Qx8RW6k2/s1GGaEr5FNtSldKLiZu4lqUU0o1X19LEp4fpF83R1E+x7Y8kIMcpcBYcyWGy0MS3SjnlQSggjTUfljI//N4zJ25M9hNYiC9EvhXDoplbuD3ClPiPxipk8hUKl7ZQAHItV4OtQxUUjyl52XLxilJHL4hJwH/iE8bTejdjWKH8OmDfqXBDpiOkTozWpCjlcVSQQwaugTjab1T4FGP+R+WPtQIFYdEgZ1Ivd7eg+AlYOudgzJWmXra2YyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p5g6GQKptNxP4QahO5bCPWcwDaIGSXCexjqk1S1EAOc=;
 b=Re+cpf3N07y+zClR5HCZQuyLeoHBhWkLmGcn6n5ToYzH0UrEj61yvk8Ya7X8KIihiperhQFoT8JosPGvkHG3HsJdbA9B5SorUEZ7PgDwWKEXJaiiQ92fJbsM7H0ngjKHBx4OgbvCzO1RwwLMD8LhhVpQKcPA5C8pT6hh2w58AvkaO18+Ca4v1ZSFSdxXXuhJg+v6cdP4p6uXV1dp/MzxiOnr0f8KOWy1jRdDobh3g9WsvXWh7eS3bXQk4hAhycdjn45iyDb/cy95C7/qZNsbyXcHbsSqRbnLvQ9W5DQ/1jShUkKNKIab9/io5T0MHiRKhCgdUnQV0EjKTr26SZJwRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p5g6GQKptNxP4QahO5bCPWcwDaIGSXCexjqk1S1EAOc=;
 b=evXNtN93VqdWoUmmFe6p1vO0gFeG1IjcJGJNnX7IL7gMkxk1xHl+yKeKY26zv79T/I36BoA55DV9M2Z/mcgYkU2UrrI+OwVvR4E+FZxeNwxk65uxTFBgB/3HEHEcxJpN3cYp0/NFXbLLcfjuoqwfM4hsYFptS583963a6jgBNlI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TY3PR01MB11843.jpnprd01.prod.outlook.com (2603:1096:400:40a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Tue, 26 May
 2026 02:19:08 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0048.019; Tue, 26 May 2026
 02:19:08 +0000
Message-ID: <87jysqhq04.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH 37/83] ASoC: codecs: madera: use .auto_selectable_formats
In-Reply-To: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
References: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 26 May 2026 02:19:07 +0000
X-ClientProxiedBy: TY4P286CA0103.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:380::13) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TY3PR01MB11843:EE_
X-MS-Office365-Filtering-Correlation-Id: 468fb368-1a90-4862-23d7-08debacd2aec
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|52116014|376014|1800799024|56012099003|22082099003|18002099003|38350700014|921020|11063799006|41080700001;
X-Microsoft-Antispam-Message-Info:
	pDvTWqzjR299kpDzGr62G7Gk51cfBlurrCJld/IdL6EHA44Zk4RHks35A2WTVJG/Ac5iQqlFTFMHuky0m1RcE7tDxbo6Qd6y99AY1I+8pY3IXwnBt9VXAQTBgJZqLgz6LzuE6jC8yBkpOnkLljui/Jwj5ubVEXsDxUSF0XRB9ROSQlUjzzvlfRXun1W/dXCLaIORF78lVULw/BMRS0QCtEeR1pv0noACCMcjLBoEMsHo33TQN3xfBBTt2mwz7ACqwkZkjDWxz0aI8rMTkbp2ZkM61itkm/UYOX+9j2RDcuF4NDpr8kyvsUo/ZYsNzR5eMTTZNoZyq0DTTKDGJ54W+YKRkW9nHUvTgKvu45UaVuK/mOQtLbep7EflXLpPE4qEtdpb6s6UXa3DARfseuMdwCo4dh+S6MC43Bgmw94q/ZiDNv2Vd2dndDszlMKRSlsVg0tSYd5PqHKd4RFlYVIgbyqY1Znqdn+umxZL+tftX1qlY+Yh/HnV4ODpEYgImpgCJgviz6V77EVvhXQm3CEIpuArhtq+RhHUdEMR7RnjtIL7x4oQ6t7aIojwWb4r3UCD94b5fMMxHMElSHA7M6XX0MEZT1xatuXeJyLm1uPMyEGhmS7apMjUkecyuKcKYgtClKD0RaAGzWWyKnIp6tj6kiTC1ovm78Ivfcf/RojOQN+zymQ9tVf9Y7CQmg/bOZh64rwzcOHrhURpTy30KfO7it89cVwFGfJIN3qM5HLHIfzayUOxxszWbToQiq2W41FzPEK1GQn8wJP/xmO7MAFtqAHOc1epLw4JsJAZWBQbKtI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(52116014)(376014)(1800799024)(56012099003)(22082099003)(18002099003)(38350700014)(921020)(11063799006)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ZdiWIIzumpzkWJNlWQwxFJo4enbYfl2C83eoR3wIHsU8/f9IVcXBFMNbp3nZ?=
 =?us-ascii?Q?iXOS+PWtNrlTmKVqwbQQGtw8FfWqQWJnmTViPY0VRxkIDMxOL0R0Vuuu3viy?=
 =?us-ascii?Q?CUKzPoRPJ33ps7RwmAVAEmWoKaGv3ed4aTj9gGKL69mxvVJEvvKJSB+WdCFl?=
 =?us-ascii?Q?3A5ek7tKrnnNshhZ2KTjPiscncmcyDqTczXMnxcHmI++pNTJsbaOhx2YxGdS?=
 =?us-ascii?Q?16JD7bKsfUJwA5+0O7SU3wUxjWeQBEyqLtM51lISpLXgnITaqymUUaA7s/Je?=
 =?us-ascii?Q?Pqa+EqSfEHkD2kjPVH8yGjDlRIMSw9APsldlDppPmDS+DI/f1YzPnkRvS44q?=
 =?us-ascii?Q?5UMQYcDlt+aO51MKXRLHwe8M/J/cWpwylxE322t7QOwHZfEzhJ0d2bk4sYKU?=
 =?us-ascii?Q?iUuAb3gkO+Wl4+ZopPDmxYEgRsFPRBY4jp68+O8Jnujsilv0EuV4uv7lz3lu?=
 =?us-ascii?Q?mzTFh7xlrWYUea+7yjnedjklCDL5iA6RYsUFrDFXWPAePaWoE4eTn4bQHGvx?=
 =?us-ascii?Q?4w3cOwP1zAyRTsbf0aI6kuK9sWkRMS57eNcHgPHHJi0aBtVZ/iFx4Ng9G9HJ?=
 =?us-ascii?Q?nqogW/16MQIZcFAxxhfXeCxNQoFHjmmLMoredLmpr4uq+cXOsFxTwlM3Q13+?=
 =?us-ascii?Q?wLYkJEJHW5lJhPeWxk/7EnlrfqMbZ95FSocpudlRJdtsstJzCfb9JbO9KJPt?=
 =?us-ascii?Q?zNut6O8SLW3I+Eel2DgclOYpiVqXjo4hfe9oy7WwtKuviQknOTRH2AoSrg62?=
 =?us-ascii?Q?hHPvsRBva7pONe451WLPLQgT+RFRRUjd6Bh87yZJSB97hyBlwzeFdJO+7oVi?=
 =?us-ascii?Q?HOBfDH1lq2OH07gnXFTPE5AGb6pnIqqO3yvZuqSc5155cFOdsesMRlk8h+nf?=
 =?us-ascii?Q?j3h3jp4yKZdnprUVQN90jPKKTs1WiRdASUbYmmgxarZ2j7aAX/XA2xpELVu+?=
 =?us-ascii?Q?RaSzk4ZQOiyMWGKyo+4qFENQzG/MRl3y7AbKoE0ERnOE7eiahXDxXYU1a525?=
 =?us-ascii?Q?VsZwOuzLsW+nhE+c7w7uPBulkg+sKG+PTl15NVV4hbxjQD2ujNzrTGNgR6O1?=
 =?us-ascii?Q?SQwGpcLilACpjfwpzHjpJ3BioDHAlIPmQWqnI70hbJnNjsmSR7lDBTxCvUm1?=
 =?us-ascii?Q?cnIXQEyoTKG5LiQDljFRQabrAPCp5qNL4oNU2BxiKbYN9+EDMWM8D+U5p9cQ?=
 =?us-ascii?Q?LfOSw79lYb2FqU4BaL6tExtOlzTEk0PXGpIWnLcMPWUj4Z5Ph0NhEGOoND/b?=
 =?us-ascii?Q?7dmLHxcJqC87Wdn5YfSHMmVDQ+8ULlqSO/3tBYsvnKcqlOPil4gNd4MZEWUc?=
 =?us-ascii?Q?ZQTSgJKfEguFlMAFJXh4tB5hzjop3WN9HJvebG3lfqdqdyrLdNEx99pfVpt+?=
 =?us-ascii?Q?r7B9A+SshmpPBHjso5jZfX/dnZH0vyAQKpmRCjBsSXkSnfk4158hiSa6SM/P?=
 =?us-ascii?Q?HXfVFavqBsx050sXnDHYZzkDrKqWV/B0Kh0WhXmf8iouHWLq8h822yZ2MWAN?=
 =?us-ascii?Q?V523PrG+gE4KgNulQC/5vuvnthgCJ138voa183ZMGHZjrlHwm0I23o9IFSKp?=
 =?us-ascii?Q?1/3l8zlUgj6oSlzs+PVl8ZssQGzg0NlVwLvcyq5ndCLYYH3X44HhnaGMg4eY?=
 =?us-ascii?Q?Nb+DR2NFmTpCd2SvP9r8fhTU7OiNFKU+/hWo6UwpBSjTms20Tn11FujGq9ls?=
 =?us-ascii?Q?LYFXQsqOUfB5Gcdb4k2LMRaR3/8RtRNDJO1VUUg3a10JqJhFQ0CsxQvjl+aR?=
 =?us-ascii?Q?LItmwiOo5691he1AxHC8kqrZU4PVylldsRRRxkzGz2cuWs+xGYq5?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 468fb368-1a90-4862-23d7-08debacd2aec
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 02:19:08.5481
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WnPr2cnN6w7ruTn5FagOlzUqrzuB3VQ4ind9HrlyqvXldynsX3Uw70unbjrS/V0jlTIJfj+PeZT05wyuXZQE0IR1JCeU1IL6177OOAqmelUyxOG10ZmpYKHyTkhKRMwD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11843

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/madera.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/sound/soc/codecs/madera.c b/sound/soc/codecs/madera.c
index 98d72db599d8a..c8e3e6d6ec98a 100644
--- a/sound/soc/codecs/madera.c
+++ b/sound/soc/codecs/madera.c
@@ -3345,6 +3345,16 @@ static int madera_set_tdm_slot(struct snd_soc_dai *dai, unsigned int tx_mask,
 	return 0;
 }
 
+static const u64 madera_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 const struct snd_soc_dai_ops madera_dai_ops = {
 	.startup = &madera_startup,
 	.set_fmt = &madera_set_fmt,
@@ -3352,6 +3362,8 @@ const struct snd_soc_dai_ops madera_dai_ops = {
 	.hw_params = &madera_hw_params,
 	.set_sysclk = &madera_dai_set_sysclk,
 	.set_tristate = &madera_set_tristate,
+	.auto_selectable_formats = &madera_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 EXPORT_SYMBOL_GPL(madera_dai_ops);
 
-- 
2.43.0

