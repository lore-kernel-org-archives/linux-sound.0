Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011013.outbound.protection.outlook.com [40.107.74.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A64E2EB10
	for <linux-sound@vger.kernel.org>; Tue, 26 May 2026 02:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779761804; cv=fail; b=oa5IxSWDDKPoB69ddP5Ldjrkl36Z+RLcTV4Fqkr0yAl3/Ju4fo659nDuylnqvdaboo82JOGVq/pNx3orktt+X+9PmXku18Cl9zLJEMiy7ZUR3d6wXAgKp5CExmnfND3F6LxVASZK+YGqzqCW2NbCrWPFls8ZgIOlzz79mXRx980=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779761804; c=relaxed/simple;
	bh=hJYukA/ai6HDnUwhXy+lezF0uKoosKkb4bv9o03inGc=;
	h=Message-ID:To:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=bFU/ZLNXkqXnRvQ9l2QqmTkTufZrH1H/Riu6jHh0d709AWIdfa0qWVhjXlIRlB7EBjZMEWEe2pqdSoAQ+CtUK+9hFTXugnYoHe9xTpnuocl2bFWGSmjFL1Gluk5HBr1uxj3J0X9PmyF9p++kF3Nt3V8FebBigWowqh9Z6hFAYI0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=f1JMAbdc; arc=fail smtp.client-ip=40.107.74.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="f1JMAbdc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i4zv7fCRUhW0m38EvdfeQ6pdhVCp+hjnte6enigQfuS/HMCASA0gq4SBEqI5wnjTKfl9aRhLFqDyTJfD9X2z+c93EZ/kSvvp1Z4hGMRRJZpktWXlClaeMIVZguVxP7Ec4jdY7KyvH7vq1giX8Ox9I8nHwutsyuHhZ/2izIfTrzuGG3QoUukW1GULfLQJvm75cJjowumj51Yvl2WQADMB1Zd8FBKB/nwPc7ObETH44D6u25Dcb8RhanUuA786h/WZwZdD3RD+UP/9qxj9PG7RHovVgSgxILTD9mOuMFfYUDvpxc6Duv7jHqnYRaU9uYWmyNe4jXYYFeL61+RaRpx+Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t4cBDU0sRKKrgKamBJnp2F3FjuoHnjSLv1oBQKOTJgM=;
 b=dyMTsxPEJVJEURvjDRmu5Gx7AFJBZe79fKqbg/yIBaiPqIhifkAFPCbNQyWIwWSdMsnYNUmA9IjIx1Wgmd2aP1GAyNzzf7Z6DUOhEgZVo0TXO7BVIVgZOahUGDOG3W5M8dNRUYUHZsUQiwa7NQsqVT7LHHUWeCDktgcki6ZiARI2wxMm2c2TbKq3KBA9w6ZwxMgJXexZrKM8TuHAKQEKfmRdw83e1O5I/8cbLI3nhBSh58o8A0BCxzlq7dmvBqmFBp2P7Trrti2vRa3d0WqkAn9J/2JLbbUF9VZJ6ZgTv5AZblCRvD757cqxgTrmG0K6Aabd90/weyPR3fQr4741zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t4cBDU0sRKKrgKamBJnp2F3FjuoHnjSLv1oBQKOTJgM=;
 b=f1JMAbdcAf09NsjNhkUnEjptglnYfKUePFIoYpVeYQJlI1srKyrqC3bAZjzrwlgE+zUWd4j0+tOppTuhfJfmTQv20ZNqpJ+8Voz3WikwIH7T5Xh3cD3LhM24KzRQ9DWUoMiIKsquE6LlwNClnv2eW9bTGyTl/CURUyqfVJyRlEA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OS7PR01MB11916.jpnprd01.prod.outlook.com (2603:1096:604:236::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Tue, 26 May
 2026 02:16:36 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0048.019; Tue, 26 May 2026
 02:16:36 +0000
Message-ID: <87v7cahq5t.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH 29/83] ASoC: codecs: cs5*: use .auto_selectable_formats
In-Reply-To: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
References: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 26 May 2026 02:15:50 +0000
X-ClientProxiedBy: DU7P189CA0008.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:552::10) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OS7PR01MB11916:EE_
X-MS-Office365-Filtering-Correlation-Id: d4ef0341-6373-4501-f8f1-08debaccd053
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|7416014|38350700014|921020|56012099003|18002099003|22082099003|11063799006|41080700001;
X-Microsoft-Antispam-Message-Info:
	MgBXJWs6OlnZrMnzmAR+xJM8kWhGRK7V4pXk7D5cd1MuwkvwqaB3oCCybv1APeHwFi9LBcpGzUySpAuC5ScCcd3RC9YOAlVExMR+k/XuDndTtBKut/iujiwKML6NnB4Hvc0LiAxflw3SsFoWDpgFX39qJgafY1PCuXP1JfX390F9aFz3eA5S7qg2TQFlzGdAYrlHEiA4kYH7wJKD4vWOFewxVp3elA7pKnm/ZBxJlztWYUX92z7YLnFM+6t5IWGfq+C9aI9foIYgMHjZUw13w9tu6Mkg6yEXbuxTmS269LQoRjphTOpdBPSjyfrs4u6r7kt5qPNKLNzvUbK96IXAeQn4bYN/NWQ/eWT3SZvud/mAv0DZR5Chg2gunfR8kLZYF56h+hnQAlRSYyyxHzFI7GjkmKc4ZTjgk8dqv99PygjIcYkFkrNeViK/Iv7IEGABU/ARQ7zGZj9mCN7vyKBab3Bhv1s1Il+uvAvoHtWB43J449JQgg9qt2Dg8kn9f8h+fEDoUza7iPu6Z2MF3fYXhaznKwIJim8Y/KEFMz5aNWS3e0bpzc/+B7y+/EHBbTv1fetmVl/uYJR4xV3fEfbBBo4TuEw4aWnyhVmeUIZHQ3rMMCh9squJ+JLH+RD0sX3b1wXK6IVgrxmuJH094ACab1O+tZNl633Wr+3lKbKAw9Vkl6x7MtExio3y8sDIGQI/jYmEo5nIweOPbXDWBPXSQQBkeKJzmyo2umEir0LIvc63bn1jfOI0HIyFEQMYEMbUfrcNmL09rWPmwj15XsgIHd+NffIcGFU162nlvxXJG4k=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(7416014)(38350700014)(921020)(56012099003)(18002099003)(22082099003)(11063799006)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+UCI7mq+jvjHw0C9gvGHrz2LCc/TlXZS84j9Fx9ej1c/z0B1tv9nn3SUpY/z?=
 =?us-ascii?Q?g5mWMa1uZha669QSlhoUWAlfkwlRjyS6vRUO0leJ8Y+UQPG1O+zboJ4HXSgr?=
 =?us-ascii?Q?+SnllHDqez+L7+jRHXTqOC5kbNtIRvllMXAEGNh6jvVVBWt94Z8CZn94ykGB?=
 =?us-ascii?Q?KxJnQH+hg7UY+KqTnglq1nrP7EWP0KfFy3iufUfnj/k4KO/zrRU7c6g3XQIG?=
 =?us-ascii?Q?o+DBpYrdl1IKxyfkLhrgacqsbX0vHypa/n8x4eCGTJ1yg5f0AKpvusIBVVHE?=
 =?us-ascii?Q?sTAbaryELMG2VE459DJtiup+fXWF4BtkUPYhUoCwmpZ6+8aCK7CR2DEVZQcu?=
 =?us-ascii?Q?bSzK2haLLjFdGla9tDEs8RXaeZrELihk1A7qDljHqbhsHGX2ljAh/7bPgS0l?=
 =?us-ascii?Q?O6X7bncR7D67fvR1T9XdTcRuLc32YG6QOVm6qZ9A9vf6fxnkmIVWtJAdkG93?=
 =?us-ascii?Q?hEiEgZQIwl/dWY48VdwhBTMZqPxl1Q8eubPfP2Go9umYLOmjVyNUzsvI3hvm?=
 =?us-ascii?Q?3/+LPn1cRqCJsZRae3F4UHaIlwvV18+u2SpL4zAq5ZITo6aNXzsUk1PMIgc0?=
 =?us-ascii?Q?+4qotUNgANCTGEij/dvJPFuag26hTej8HgvBbhIlvmDEwAUvG4zRklhvaTxT?=
 =?us-ascii?Q?zxfWHYNiGFqBfMLLYnOwdu7gqBlPoXD6RHbpiJnrjrUAHXFHii9XmWXtO91t?=
 =?us-ascii?Q?4ClMBOuNIc9vCeslTFMUsTIm1WLc1YvyTB1OQhg0RZ3vcX23f1twv86nyMUt?=
 =?us-ascii?Q?OlJup+uIf0NspH1OtE42QIGXudgiSOby5Xxn0tN6m2p+h8YEPh1TdhyJri5D?=
 =?us-ascii?Q?J0+2vbQ0Hth0Yp+Y0pvz/byvJULZRoAQDDeaPmWfg6u7Pea9nQLNTi0Eq77Z?=
 =?us-ascii?Q?BlUq7k5Azl1NXdcknlrI/T81yhGY1R/DRQZQ0vjcbm8UYGelqnuwPGJO5fAA?=
 =?us-ascii?Q?feBauoURzWpuqpHVX04cA1POHNwlE4yNCID4T4yf4Y1IEZxADNTPn7EA/pCY?=
 =?us-ascii?Q?6S1jodW8hLZzaWH4vw7VUNoEbT0TjWozqTTeFMFVa4mTnSczDV/Y4hXx5fWw?=
 =?us-ascii?Q?k8a7YdJQJ5Ja1mrurX3EQNW7+O3qafQmgxJG/KNmuK5kL9QweS5g1WY84Jhj?=
 =?us-ascii?Q?TJ/XPa+ikQ/vKN56PysHoA1P/DTiqF5/e2CcQ5YYIQrM5iH7/S2vuJDM2YOs?=
 =?us-ascii?Q?axuw5EzQtTcRWc4itP/Ch7lqaI54AcDdXLiAQ2s1etH3kgmyExBwhvwdVd4N?=
 =?us-ascii?Q?KywRnnAwf/97Z044vFoqJQCj95QCNgftnJe2Pw1HZEAIEPmli0KnyPOceNNz?=
 =?us-ascii?Q?Um52e4rBdfzgJqW/ehDvgYmuySBMHOsxC6Zi+HFdaeXhBJf6vzBk1Dezft/G?=
 =?us-ascii?Q?g76qPet+u+Lkj7AHmAo0JM57OnXrhsObgCSt/WFEQOgzEK2GHwdlc276dg+p?=
 =?us-ascii?Q?YyrFSJMqB947MyZAIXfPNUpyAdRGyW3YT37Xp4+SlI8yxzjOBx2Yz1exQrkx?=
 =?us-ascii?Q?aMTsg1a0igROzd2B5K9uKo7V+DB2TRz+z2FK++ypxWUOFoD0DST9g3OWCu3t?=
 =?us-ascii?Q?JPgJy1wQKmSj9pU8S0099QHszWkTxCrDoPf9fOjgm8lLhzy9YiBg1FNwXu9Q?=
 =?us-ascii?Q?05xDu+IkCgVR2bBywFDKpKWiaIKEEqonrsVOyZqYoDB+EaeIBCxoji3H1rNr?=
 =?us-ascii?Q?IuWRrQuCEiiAnzXMC/6aT7LVxsSZiH9c00KCoEHQb8T829X08/twin5u/hAV?=
 =?us-ascii?Q?KdNDnPs8zNlpUGl9w/iqCeiZYVBWTQ0eTB05daJptrTvTTCUe/5f?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4ef0341-6373-4501-f8f1-08debaccd053
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 02:16:36.5904
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p+CreUBzvBlrUh2c5HDuj3QS0Q9AkUYqmfvICMShe7PLGV9u6tMrSlT24tV1K7YpagMES41y1Ks4bjIbw5S41dYzx1+BrRcQQzr7yaYjRAKzPOBg3iH8K5OMyhQ5gvkc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB11916

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/cs530x.c  | 9 +++++++++
 sound/soc/codecs/cs53l30.c | 8 ++++++++
 2 files changed, 17 insertions(+)

diff --git a/sound/soc/codecs/cs530x.c b/sound/soc/codecs/cs530x.c
index 18b5ff75feec4..a8b43a78ac0a9 100644
--- a/sound/soc/codecs/cs530x.c
+++ b/sound/soc/codecs/cs530x.c
@@ -945,10 +945,19 @@ static int cs530x_set_tdm_slot(struct snd_soc_dai *dai, unsigned int tx_mask,
 				  val << CS530X_ASP_TDM_SLOT_SHIFT);
 }
 
+static const u64 cs530x_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops cs530x_dai_ops = {
 	.set_fmt = cs530x_set_fmt,
 	.hw_params = cs530x_hw_params,
 	.set_tdm_slot = cs530x_set_tdm_slot,
+	.auto_selectable_formats        = &cs530x_selectable_formats,
+	.num_auto_selectable_formats    = 1,
 };
 
 static const struct snd_soc_dai_driver cs530x_dai = {
diff --git a/sound/soc/codecs/cs53l30.c b/sound/soc/codecs/cs53l30.c
index 511453b4c3752..c9c682a312c33 100644
--- a/sound/soc/codecs/cs53l30.c
+++ b/sound/soc/codecs/cs53l30.c
@@ -833,6 +833,12 @@ static int cs53l30_mute_stream(struct snd_soc_dai *dai, int mute, int stream)
 #define CS53L30_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE |\
 			SNDRV_PCM_FMTBIT_S24_LE)
 
+static const u64 cs53l30_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops cs53l30_ops = {
 	.hw_params = cs53l30_pcm_hw_params,
 	.set_fmt = cs53l30_set_dai_fmt,
@@ -840,6 +846,8 @@ static const struct snd_soc_dai_ops cs53l30_ops = {
 	.set_tristate = cs53l30_set_tristate,
 	.set_tdm_slot = cs53l30_set_dai_tdm_slot,
 	.mute_stream = cs53l30_mute_stream,
+	.auto_selectable_formats        = &cs53l30_selectable_formats,
+	.num_auto_selectable_formats    = 1,
 };
 
 static struct snd_soc_dai_driver cs53l30_dai = {
-- 
2.43.0

