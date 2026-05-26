Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011006.outbound.protection.outlook.com [40.107.74.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10BB5305694
	for <linux-sound@vger.kernel.org>; Tue, 26 May 2026 02:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779762519; cv=fail; b=RZI4J56/ACXDrxHZhlMxiie8m9GqRZBtGCyHa6cPQ0JCl1La/gYBzxdF0PLpUxfn7JSYh7IwKUI2NySwrfxXYVrB8dhojZJl2eQymKoX2imYDYX4PPc6ENAAaA7EtU4Zhmv2V2kfmHe2l05XQ430A22oBLlUEmiWlVDbVQqlvyE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779762519; c=relaxed/simple;
	bh=3W4vcIGuVVrBpTZp72j9qwaSsYlHX2WHtPW014IxmCg=;
	h=Message-ID:To:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=E2bc71LpZa6CC45AbFJA9FbRtGpheTpfCMmPsMRXo8U9fsPUN2lVQO/RT0c66yZ0bYihv14jolLhS78NANA/s4lSDgZ2btylJQKqFLQfR6g/TYFvref1g5+ETH4jpHKzdVO1WD2pm7kF0OwEJivKoQpcHrIIcQafu0oGXZ6oP3k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=mbnO07BM; arc=fail smtp.client-ip=40.107.74.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="mbnO07BM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ewm5uQD6LGK7tbCJdxO4Eor9uP/UvjV3cZQjYwNJqhcC6F/0SF1/HxdELGD3QdngEErSVvEf4HJHTSkdMxvJvgbk+5vaAkPWmBZvvnGHAJGGRrurh8EGwxk/zhWbOLEUvDmhthzWYS1xCBKr/qxdZytVfLL8I36/VDrA/v0RGOw+kiYyvbWiiGnHXIM9aU5/1+1Xv6iKkkRRau5K1RscDSd3E6EwTNQVOJWa1K27VN1AkNsJvdcnR9C2isLgNOPiZydLx5GfQrsbMcGVqf3J9a6gQpcRHjPhX+6v3jEw24rkED2De6LYvxqmbixvGKIDWtI/ame8lTatbBa48jYNzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xMYMd5OdSAoPod5IEh6cgjBDCWR00vZx484MI7hEgf0=;
 b=ZjvT8cbb34OUrwiwrGAz1l7XIW+FO9L8A+pwlCse4ZSI6FNmDn+3PDNyoX8b8P3GL6MfSDlX4oRStzdY75Fx4NKwxtumNPKgsXZvzN7zj4i1gevGHj/Wh0Mm6hM3yYnt3dtDYs5oTjTTxFSQgd1UT5CfyR1tDqxMjegoAN3BPg8+d0/awGrLG+uJ/RJAeM0hSg5kXDVod6ua1C22G61JtBMvf29pIGcmPfMbgMqVmmyqPTO+Yxkd1Rt9W5zXdILKthlfAGoV3euzKW4jv/1fBuS0CzPcugfxxRvN1iAjXPt/zm2LgjULvyWfrzGmloV/s7/Y8fZCNkp2QPv2Ixsvyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xMYMd5OdSAoPod5IEh6cgjBDCWR00vZx484MI7hEgf0=;
 b=mbnO07BMfXycjg+F/g23k+EKwFWOJvQE0vzMs2ZkGa0kUoVYuujUpUuWtn7768KkvW/4/zEyH8sAnvqx5+ny9VdIICOZlhh5qbkK4UdXYVENs+zPcsXHxXqVZ7pvTJmMYK+9ezn/G6yjqxpl+vlwuDmu7LMggsGH23s7pSKMY0o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYCPR01MB11158.jpnprd01.prod.outlook.com (2603:1096:400:3df::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Tue, 26 May
 2026 02:28:33 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0048.019; Tue, 26 May 2026
 02:28:33 +0000
Message-ID: <87v7caewh3.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH 79/83] ASoC: tegra: use .auto_selectable_formats
In-Reply-To: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
References: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 26 May 2026 02:27:44 +0000
X-ClientProxiedBy: DB7PR05CA0021.eurprd05.prod.outlook.com
 (2603:10a6:10:36::34) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYCPR01MB11158:EE_
X-MS-Office365-Filtering-Correlation-Id: 29527e3b-b173-46b7-040c-08debace7baa
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|1800799024|366016|56012099003|22082099003|18002099003|921020|38350700014|6133799003|11063799006|41080700001;
X-Microsoft-Antispam-Message-Info:
	1HDJFh11U14+2h95mofuK230dXz2ZximMu4vBoTGL87mDwNTYd8R0Sd6UmgJU48Gl4f+Eww3h/esZQjPNqV/Zf92ko+/NcwYdq49UeWuCemW+364akFptJeb4BTxHjFtyPLZYV29GIIX0uYAxakcZsZJxcTTeIxHPnvthuJlckjHjb/IfEmDQe6FSUKeEyeydG3gJbH5qYrYCuGrJZo4fTgYHgtpn8ActZceQG49wvO/jcZu7LuaJqvYODs6BJH33BXn+3raoSpWx4ai7MO0HENFxC1sz3CHS5oBsg8GXisaFNhsS+abY4Zz9DmGakMfv3/Py1magYu3eFjVpaTRVcr2agdm5iw/Q9FNkfgzu1Ie8L2r+xcAbf741cIY6fyOIUGJL68N0r1rznwmxTxyrvuPxeCWBpm8JE1d4eIQXBOnzTkR+d46y59eJx9XRisv6JCK2CTIZzwoXjnEQZ2Mezj0SYrlu3fbTpZ/YI7xQrRUi6jAZRQplek3HFozhZL8Qhq8gWV9TTnLQ2mkHzXc/cMtqoNqdMQ4l1hKl9cuTPe7UAN5i3S0OPogrY4CGrjhuCcLkUCmWvsMXK3kJxDd4E1mG4wU373Cyb0bW2JiUEecHY7ifnFqRTYAPCs3oHk9KeTBwk3eZJG6B6qz3bBzFdFQLxC/+Fu5ueR4cKhxK7slXI2vFx0DWhImgMG/9zgZST7bqBNn/Xxrw0vUUjmoIFEM//v/PDAGLMoVKneD+soPSZq9/xX1r4erud8zf/g3jarW6Pz5IRybqPTfch6oulrNoqyp/H6JXx6FFzAfQo8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(366016)(56012099003)(22082099003)(18002099003)(921020)(38350700014)(6133799003)(11063799006)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?joavYpj1vgwlD6Iy2/gOTKMvhATBlyHCW6h2xTFGekVwUb26cceaOQ0KJ5hC?=
 =?us-ascii?Q?Ahkx4zUTVGov23VuHV0ERqAb/28Bzz8E3ops9jd9ubOmvRFzPjKapYpWtiU2?=
 =?us-ascii?Q?caSgUI1gcq0aDMtcTAfn+th4cO+wN2mtjpgJ8JW9Uz44BaNCkoND6v7a8HRR?=
 =?us-ascii?Q?nibWouI5dr5GigifMVtKshoh2iVTC6xp3X8Z1jLmWAJV9ectbDe9QBG3WT65?=
 =?us-ascii?Q?a2xpcj2+jm4ju4d90lRkrRdh0f/xp2tlaqJ1hp87NCiSDlLHmkJDvGEAbw+M?=
 =?us-ascii?Q?n18suR8L3wCWuXfdCUEZ2z3jznhMlvTMBd9l8/0mcQUqb6khTyx6gDcKDiP9?=
 =?us-ascii?Q?A9Gf7Nq8Ua2XW4aDXM/UbabjEY0uOaYultNIKNj4H7ry232xP8G5GEaBWZiI?=
 =?us-ascii?Q?0B/aMqa0ZawJRHSq1bxM1IVrzSK8kVof9CUq4gI0wmNcOve6aDRedCU+PzRM?=
 =?us-ascii?Q?2rJ4M9GbANKYBtIkwhGNlFnIfQBDboHmKPi7yD4ZsD5r5h+3m9ifEzx69PKD?=
 =?us-ascii?Q?OHa0JKhvKyJ5ff4aeB1cfqit/83frTor1Fy3WQxOCkMOrtq0bWJ2kEGar5of?=
 =?us-ascii?Q?xqdcxSnBd3B65CZpWhaovWHipXDfSEvfvIRo6UnS93bQsNwymygGYj7SN8dW?=
 =?us-ascii?Q?dyrgpaVPtJ+cZhUObQslMf9hubjeYkvLFtLHiqHTk84CVB6Ew2CyAga3W0ER?=
 =?us-ascii?Q?zn7YFfdAybjR6lkPctKYKnDqXUp0mYde7/m/EVvEnHIuOf+lpqL3doQ19dp5?=
 =?us-ascii?Q?56nymUGq/E6WbPEa3FoRsGdyKrglWA28Mb4CZoIHmayuDvzypw2C1BAN4Gu8?=
 =?us-ascii?Q?+nkTiX8cy1cVrvwNDx3VXtQxhf2HWbG/MsB/dvzYz2eRlpOw5/Tmf8eH5koG?=
 =?us-ascii?Q?hcwFOzqWszeWvMcZtLG1qFTuE2K3R8hmlhHRu/0gLBV7ie28Q/POzRyOgTnR?=
 =?us-ascii?Q?aSlyziXTrP6kLm9jJt7QvZL18KRwauC9zloX2c5nWYxmQn1vXZ7CbgUwuBeC?=
 =?us-ascii?Q?6pn030JANOqAxmo3duOrqduouTO9z7SjG3xYH8lBKrIH4esF3x1P4rdiT1SV?=
 =?us-ascii?Q?kXN/Pg3JkM2HAT6ZBdZwtTiqbme7uWSu+7IQZnKujvxzEuSX+7iL1JOVbJcv?=
 =?us-ascii?Q?bixcM5z0KC2uNOTgDaMLRlC7eYLJHGf/1Akta34oV7r++KQ0gk1l3gRj3T2A?=
 =?us-ascii?Q?aiL01C79SJkrVuosG6iyScCiJMmrYqdA9k9oL62kJbSNj+hsZYafV3X5ufTP?=
 =?us-ascii?Q?ddJ9WWetfCjDODd5jRtGZMtUSDUH0cHedDNlDv2VhibUqoUfEDqcj8RX67BL?=
 =?us-ascii?Q?8j2S2x5NWRv6eMVhXGlHWuMoJMz4EY8zbsYiO3cj+L/CrN6NPMDRdquJVinr?=
 =?us-ascii?Q?70+0RZ75hdivvdYH9YhIoDrMU9PvIKMZbg6eJ/L9jdsYjnFtuM/TPBNY8OLj?=
 =?us-ascii?Q?3+fGwH+bxq5KHdRG447yejVXsJsY69HlmOK+dctX9Cw7dfjATeA/QSJVbsjD?=
 =?us-ascii?Q?JHr58FWa4CIp4z7E86yFLvbevoLv5hoYioM5XGBlaaiw27ncU1WipUhxZfKY?=
 =?us-ascii?Q?tZ9X4QtxL4jejxIAt2xpgK/qAqXM4y/Seu2iHTOwsNigpLunfKWv1to3uEix?=
 =?us-ascii?Q?W+YDKdQkOMQpjhtINy4QCHzOnxpmCAavJ4I8cC4EMEKr7Q9khuqJAE6jZDUd?=
 =?us-ascii?Q?wm9Y4kQHt+6g/svXXwySBaheu+GPBnSu6TMeMxwJ1dh1ugIOa/E5LTqKlOiS?=
 =?us-ascii?Q?odc+5Ee2Jw0CTgIV0MvCYFIJ432qpGGGjuPWsOzPhX7yBk2EjDWu?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29527e3b-b173-46b7-040c-08debace7baa
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 02:28:33.5381
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GB8zIh+cR6lxZ4cjPydeyXUl/SmayDoa2m/XRfipqevwGQddkBflCGSe2c0izRHTtpJOQj7kl2w8HWWKEr52GSeh7sq06MvpBH3PChV5ztIXjXquy2fG5L7ckeyZsJYe
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11158

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/tegra/tegra20_i2s.c  | 10 ++++++++++
 sound/soc/tegra/tegra210_i2s.c | 13 +++++++++++++
 sound/soc/tegra/tegra30_i2s.c  | 10 ++++++++++
 3 files changed, 33 insertions(+)

diff --git a/sound/soc/tegra/tegra20_i2s.c b/sound/soc/tegra/tegra20_i2s.c
index d9ab210ad69a9..b31f9477cb2eb 100644
--- a/sound/soc/tegra/tegra20_i2s.c
+++ b/sound/soc/tegra/tegra20_i2s.c
@@ -309,12 +309,22 @@ static int tegra20_i2s_startup(struct snd_pcm_substream *substream,
 				   SNDRV_PCM_HW_PARAM_RATE, -1);
 }
 
+static const u64 tegra20_i2s_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J;
+
 static const struct snd_soc_dai_ops tegra20_i2s_dai_ops = {
 	.probe		= tegra20_i2s_probe,
 	.set_fmt	= tegra20_i2s_set_fmt,
 	.hw_params	= tegra20_i2s_hw_params,
 	.trigger	= tegra20_i2s_trigger,
 	.startup	= tegra20_i2s_startup,
+	.auto_selectable_formats	= &tegra20_i2s_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static const struct snd_soc_dai_driver tegra20_i2s_dai_template = {
diff --git a/sound/soc/tegra/tegra210_i2s.c b/sound/soc/tegra/tegra210_i2s.c
index 0259b137547c0..9fb19415dd15b 100644
--- a/sound/soc/tegra/tegra210_i2s.c
+++ b/sound/soc/tegra/tegra210_i2s.c
@@ -728,11 +728,24 @@ static int tegra210_i2s_hw_params(struct snd_pcm_substream *substream,
 					      cif_conf.client_ch);
 }
 
+static const u64 tegra210_i2s_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops tegra210_i2s_dai_ops = {
 	.set_fmt	= tegra210_i2s_set_fmt,
 	.hw_params	= tegra210_i2s_hw_params,
 	.set_bclk_ratio	= tegra210_i2s_set_dai_bclk_ratio,
 	.set_tdm_slot	= tegra210_i2s_set_tdm_slot,
+	.auto_selectable_formats	= &tegra210_i2s_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver tegra210_i2s_dais[] = {
diff --git a/sound/soc/tegra/tegra30_i2s.c b/sound/soc/tegra/tegra30_i2s.c
index 1d7b3aed51fd9..69acff73f68ad 100644
--- a/sound/soc/tegra/tegra30_i2s.c
+++ b/sound/soc/tegra/tegra30_i2s.c
@@ -302,12 +302,22 @@ static int tegra30_i2s_probe(struct snd_soc_dai *dai)
 	return 0;
 }
 
+static const u64 tegra30_i2s_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF;
+
 static const struct snd_soc_dai_ops tegra30_i2s_dai_ops = {
 	.probe		= tegra30_i2s_probe,
 	.set_fmt	= tegra30_i2s_set_fmt,
 	.hw_params	= tegra30_i2s_hw_params,
 	.trigger	= tegra30_i2s_trigger,
 	.set_tdm_slot	= tegra30_i2s_set_tdm,
+	.auto_selectable_formats	= &tegra30_i2s_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static const struct snd_soc_dai_driver tegra30_i2s_dai_template = {
-- 
2.43.0

