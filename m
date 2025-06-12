Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011041.outbound.protection.outlook.com [40.107.74.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 750CD1465A1
	for <linux-sound@vger.kernel.org>; Thu, 12 Jun 2025 01:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749692538; cv=fail; b=Q6xv9RmcBFRN+MHKBD/HujDm8XNbWkg50LPyrPzMyqsIvgWUc97jR9khjcgh92Nz9vTAVbRthbLZpqupSkwW1UbFnOqP+clgvnFnGJylycsfm3maOSY05yWCCdxqowpuhcdm2IlkiFFbDNOlMxmN5NJn8pS3aGUIaQM8AfVTaTk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749692538; c=relaxed/simple;
	bh=1MK7NcTFUAUYkaSv3qKD+EzAc2Dcb3yas2Z4xjek9eE=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=TTeUOK3RDMT83wQPvZaM2tZ8nC8okrjETEgnm5wKxzdntTbRzKQxR7jcCdrihWmePHxh/HQkCUv0NEEq3JmF8uBuZ68jdux/iO8CVufD4A50LsvPaMA6Cb7gFBAx2shfzi8NKBW6RgrGMbaLz2sGqvRZQ7tdQd239aX5QTfy+9c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=DN+ZNZwU; arc=fail smtp.client-ip=40.107.74.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="DN+ZNZwU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=exIXaNorsnnD836PIUTtldRUeFe9bQIjaYWAzxTC4H4SzOYBokOqsLPDa+NXu3KlfpJ0idWZ1HuUl8BaELAnB7/iDUBJIwuosy85ZCi8Hp6zsTpxNahY0NaNfWFGix71O9+qADaXRozeHvR9QjqxLXcRxdgLtdAupVsi8x0lTRQ+52/cMuM1BVjQnS5My6HaIcpZwRA842KSuFPbtDGV0mX8PrJnJhIU40AR8Lp25OB4yEyVjHJ+/0fXE8BSJAsreo3gjxWw9qxMhPC7VMo0yJk/2VcSqONqAhmxCcTuN0mvo4ejtFfvY91mSSLDz9tKcG8BYzDJhixCJbbK+qQw8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GMdnk+FGNzaWVuUj956w+eXZRbaOfz6qdLLITUe7xbU=;
 b=JBlhl4Zl65CwtF6Ttd4Lwicmz8mixRmDhxIV7JwRln6edUEBsQb7KdALFuSTAhcF256x/IPSQcE1J+HSSEZbVoUe5iCacnIMkyHdT++Mc/8poKhW1gZdGkq/Wog0RyNd8Xr9VNCLO9t2LU2PiBtR/hzK2cqLH/M20J3c3dlUGSjeDdZ2pysqSZtScvoes/ECZrTD4mDKvHFaxiyo3tNVhkTFdMUqS3KYExJxlGzMz+P645AwKiNarmPu62yTGG52o/sbxk0g1N5PGCr9X3T3YoSvHezvrJZdg93buBgoa1vn7GfM2DAUL6o0R2TsclZVmng4W5vzx0pxFOZ60+4NEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GMdnk+FGNzaWVuUj956w+eXZRbaOfz6qdLLITUe7xbU=;
 b=DN+ZNZwUIC9WkUSARp6xR3qUGKtae+idYeKCLkUjXhMx1aDAlKqeAIsiPu3ckcaJYaBJRq7ANIwT3DKcNq+7xYmTqhSNbDabkOuqIUtapKOe9y3ifuqe7gmOV7gFuXq2FbQBEvDIsM26ZDSJD7yzIIubh7iiIf2x35x9/3InVsg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB9937.jpnprd01.prod.outlook.com
 (2603:1096:400:225::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.25; Thu, 12 Jun
 2025 01:42:09 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8835.019; Thu, 12 Jun 2025
 01:42:09 +0000
Message-ID: <87zfedzqfj.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 04/39] ASoC: bcm: Standardize ASoC menu
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,	Liam Girdwood
 <lgirdwood@gmail.com>,	Mark Brown <broonie@kernel.org>,	Jaroslav Kysela
 <perex@perex.cz>,	Takashi Iwai <tiwai@suse.com>,	=?ISO-8859-2?Q?=22Martin?=
 =?ISO-8859-2?Q?_Povifff=B9er=22?= <povik+lin@cutebit.org>,	Claudiu Beznea
 <claudiu.beznea@tuxon.dev>,	Andrei Simion <andrei.simion@microchip.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,	Alexandre Belloni
 <alexandre.belloni@bootlin.com>,	Cezary Rojewski
 <cezary.rojewski@intel.com>,	Peter Ujfalusi
 <peter.ujfalusi@linux.intel.com>,	Bard Liao
 <yung-chuan.liao@linux.intel.com>,	Ranjani Sridharan
 <ranjani.sridharan@linux.intel.com>,	Kai Vehmanen
 <kai.vehmanen@linux.intel.com>,	Pierre-Louis Bossart
 <pierre-louis.bossart@linux.dev>,	Paul Cercueil <paul@crapouillou.net>,
	Jerome Brunet <jbrunet@baylibre.com>,	Neil Armstrong
 <neil.armstrong@linaro.org>,	Kevin Hilman <khilman@baylibre.com>,	Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>,	Shawn Guo
 <shawnguo@kernel.org>,	Sascha Hauer <s.hauer@pengutronix.de>,	Pengutronix
 Kernel Team <kernel@pengutronix.de>,	Fabio Estevam <festevam@gmail.com>,
	Daniel Mack <daniel@zonque.org>,	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,	Srinivas Kandagatla
 <srini@kernel.org>,	Heiko Stuebner <heiko@sntech.de>,	Sylwester Nawrocki
 <s.nawrocki@samsung.com>,	Daniel Baluta <daniel.baluta@nxp.com>,	Orson Zhai
 <orsonzhai@gmail.com>,	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,	Arnaud Pouliquen
 <arnaud.pouliquen@foss.st.com>,	Olivier Moysan
 <olivier.moysan@foss.st.com>,	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,	Chen-Yu Tsai
 <wens@csie.org>,	Jernej Skrabec <jernej.skrabec@gmail.com>,	Samuel Holland
 <samuel@sholland.org>,	Thierry Reding <thierry.reding@gmail.com>,	Jonathan
 Hunter <jonathanh@nvidia.com>,	Kunihiko Hayashi
 <hayashi.kunihiko@socionext.com>,	Masami Hiramatsu <mhiramat@kernel.org>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,	Michal Simek
 <michal.simek@amd.com>,	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>,	Alexander Sverdlin
 <alexander.sverdlin@gmail.com>,	Elinor Montmasson
 <elinor.montmasson@savoirfairelinux.com>,	Binbin Zhou
 <zhoubinbin@loongson.cn>,	Alexandre Mergnat <amergnat@baylibre.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <875xh120u3.wl-kuninori.morimoto.gx@renesas.com>
References: <875xh120u3.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 12 Jun 2025 01:42:08 +0000
X-ClientProxiedBy: TY4P286CA0002.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:26d::19) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB9937:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f0fc574-20aa-4477-2085-08dda952583e
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|7416014|1800799024|366016|921020|38350700014|41080700001;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?I38IxRlpcjuCFbA/SSOwsVE9bBGkvKJfwrQh3wmlhcRJN5aQfM5CVVCAsvUA?=
 =?us-ascii?Q?yUX/4YxPAiUryrWSeZDrQt0iXff4vDu8GxEtq3C6fL9niIauQ+LqxfZ8z3yW?=
 =?us-ascii?Q?/M6udy+1z2DST12Rz1n/el97jjjqjuBrNIrSxlP5p3+3cUAe2MxRyEQO+8ya?=
 =?us-ascii?Q?Wp2M3WF0X12yk2Zo31qi+N3fLpNu+kfl82Rjg1nuUrIqVcEOUNZFNX6qmTF1?=
 =?us-ascii?Q?0sSrUISFBAc6QR1SCPaoCMttJowqeSMYCtV1r2feTqxdczALytCqFRCG3pKF?=
 =?us-ascii?Q?Ip/KAGFXd57xvSJLe8SjNvslfCtAgQdOnsZurqtcQHyHUXZrijxy254zcZ/f?=
 =?us-ascii?Q?3z/p/lxlV75vYp1rO5R0w5lhQd6iVUcIU8ucqhhre3WvaQjF0yjzwgATEhqr?=
 =?us-ascii?Q?G/NuGkacO/+6ITiLiEUXMdqi1qSvbYnX6TC9tp8jaNCJVVombCNR71HaAH8m?=
 =?us-ascii?Q?Qe/6gIKdmwtWB83wLg8SSWqDAFHsCCSQvLT6hJjIaQemdP/gQ1WP8CRku/hu?=
 =?us-ascii?Q?gST5y8kgthS9isDIxhcb0G5sdFiZSVb2SqquMDzj1TjxFZk1HhSoHpUh03GE?=
 =?us-ascii?Q?qbGhJ6ZrJbTyn3dJU64OP4yGn/nLs03YCIKRQyyu8wMK8uA8gIEFC7ixuZl7?=
 =?us-ascii?Q?Euuw7jH2X0PqvCDNyg0HwwK2m9ssPN0kUmP/DWZEV4132clwJpZvc9O0o57x?=
 =?us-ascii?Q?aFKg/8YAQmKDDqOuEWuUVhzbtydEQnRh68J8H948CEBHqT111t3GH+HvhYsJ?=
 =?us-ascii?Q?hhE6McmD2GBhHGu1RzSTY1+C9b5Y+j7lei3mhJMhuVywn/fW6cXPsJFDh9nr?=
 =?us-ascii?Q?rok+ozXo3Wa9kDiCu/a2NcnfxTIc2QLNsUpzCGvhC4EzTe6Fxb0qKQ5c172K?=
 =?us-ascii?Q?DyiQiTvey3M2uv52VKDM+RKCAw6sC55x0AhFKCwNMvQjAB2CshbQWTkh+XJf?=
 =?us-ascii?Q?/kwtT+3Q0PgMAuzxBF/1fXaMhAvS55Py7smqHv0C2VdfonIlKcLjE2aXILcm?=
 =?us-ascii?Q?tOaS5iKDvS3+ys2j53WcFc32e67xX+8oKsu4c/tMtgaxvwmvjVPMJfV6V733?=
 =?us-ascii?Q?P/SxuKBlo4rgnd3XOd4W1qJFFIXqOoFRMcjAlWVse/eQDE6IxtcroikL5utG?=
 =?us-ascii?Q?fdD9GTYl2HxZ23y82XrRBiG0dTg82KABdqRo59bPuAqEKx6n+0bVr8P6Y2MC?=
 =?us-ascii?Q?RhTA1vzIz+iuxLaJ5Wc4zUkIgX+sOOuAjb+O2q2FQQlIycxZPjEO6pRuvYrr?=
 =?us-ascii?Q?oHXuKDCzxswHvQCGy+J2+k3L921WdHu5o2iW0SAlD886vrJQOPjQNtn0UM7s?=
 =?us-ascii?Q?2FHzs1I+MUHIlJ7yxIbzzjzmMS4aY34sCNCbhBlgU3jW3jPOIZMwEVd7f6y+?=
 =?us-ascii?Q?3cdNBYEFtGhV+/mDnfoZ59rc9RPQRb3JyP7nHkGr/nNvUijQ+mTClV7DOAC2?=
 =?us-ascii?Q?USnJRRIpTP+lBERfebyc9gLHHgCp0QTdCCKohDRtTcS0FRGI+2usE9fmx4N3?=
 =?us-ascii?Q?ET7zbMmrOO6jEpIY3YFQ5jF4oRIfiJzyM86MJddLyXR0WbH7SDHYtWKPfg?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(1800799024)(366016)(921020)(38350700014)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tzDqr/+JLsyNZU0mJjZXaclCeflNBT+S4bpNF1gDZ6LsaLhmDTsnsMswbHjA?=
 =?us-ascii?Q?QjzlkxhVupuxZiQnWOHrCu/8OQu1BMLCQ+zXzzQfmCyyW3fJqd1VmQM8stfg?=
 =?us-ascii?Q?L2X326JbAz0/yA8UBh01kpsEnntFN1SCBG9KzHz0JCzpJJsqXx/78Iwqrf2l?=
 =?us-ascii?Q?b2dRldJQGoqnZZHy1NT365PABLxCM2D7S6QLGp9pL2s+iYiz8yVU9Ovi1bYh?=
 =?us-ascii?Q?pqevkb4MZI0cBJee2VUGO+nm9u6PN1+Z0NF0NwGe/1vtJ5dSPSCkIw6tF+Qu?=
 =?us-ascii?Q?vfgGnP9DsXHSL+AHbW1pzRPtoEgAENhnq6AkVxd5ZohobNUnuzCb53Fb6iJG?=
 =?us-ascii?Q?plIYs/jO45ejl7j8a31K89blXuNvmpsfqNEZKZ0OJXG8/4sUlHJcT1U8Q7M4?=
 =?us-ascii?Q?kpxzXpNdDikFUV52Ms9qIiCFwHknsyPZg+BgB6qjlccP7W9R7DHk0butdrPI?=
 =?us-ascii?Q?IIetXKwh5tBBE87aBy8kkVFI/qXI6yEcCNIV+Iy8gcuVryirUTkqqlBm1H5m?=
 =?us-ascii?Q?2N/Mlqxhr/SylDQSPoF9E1h+EvRfnxefOBC68bYhioU6Sf8LG7hUmWyOH6yO?=
 =?us-ascii?Q?wNbmt8DrmEaBVAoA6gHi5zMq6mx6UtFWxq+OodU1HtCvA9VJ7ODeh/B4GBD+?=
 =?us-ascii?Q?zEZobF3BfBoUe2lfI2mB5dOIXO/HIDRoIMqr2UhHCoRlcXAonAZ+5/RPoUhI?=
 =?us-ascii?Q?1FVmlGLZZ0pDM4GJARD6odQf9CsVNu3AxT31D6R/a9bOFm4ibwVEdahSaP9A?=
 =?us-ascii?Q?jEu2P9fJGnTZIFWCpuugKTslUV7qSQhahbWRcVjCEkq4ROUzG2g8GJroZBa+?=
 =?us-ascii?Q?hp54g/LuufAoUHNnXmstFX9K1kN+9yOskgudtbeArhiimy9tzT25uga/Drz1?=
 =?us-ascii?Q?m98/i/lh/obwZh5hLf2QsrvCMGk4auhDtQI96Gdg52ISLaBovo6TSfl+k+E+?=
 =?us-ascii?Q?rhGet3cDHGJ9e1zVSsbrG6N4PJTauQniFytYZ6FlNlzb9jWVGHCFzxZWXZ1z?=
 =?us-ascii?Q?B3FXWaySA8MLh5oQ4DHehjX37CbRwfLUsJJZ/eOXgxPbpJ9XIYd8Y+wZjlQD?=
 =?us-ascii?Q?2kRc+m8R3ixV8+p7Ex6YXxe3yB3nbO4pWmPVgM4pObK/vNMT9P1uz5Q0KDN7?=
 =?us-ascii?Q?tLoR5gRja05Fav9F3x2szjzYnxC9OJMKtTVNvTsYhh+RG6FTuydOfQop22/O?=
 =?us-ascii?Q?5VIGd5Jt8+G2jV+MyJ046VhK4PZ9FoAXHu90nURs08tYUWV47XuZqjwCzvqN?=
 =?us-ascii?Q?DWDVG7GsP3i41d7fdF4huGGC6ppoKD7oKJryoyi2HetDKGjiVs3r2hIdT/1A?=
 =?us-ascii?Q?Y3WtMMpqiZtO8TQqSeA2bnYvFyaFv4nGCkt9cjx2rNGXCCV1Et6eJKM0Tqa8?=
 =?us-ascii?Q?Nrgx51Ir0uZ2vQkPHC1Awlva70QxNkjRCpc/OfTHO5zTBcwm/hPZkTUOKYgu?=
 =?us-ascii?Q?fWB51bDwy70nEoYriHYdKK87vQo5X4QgXYi0HyAKZm4aZ8376zGg3D2BTO5d?=
 =?us-ascii?Q?YxzGCFCWYshPSxQ+5I/8JDWPEmq7TOzF+1WigYhljOZKmLgisJ4MqUIHJFRb?=
 =?us-ascii?Q?bHslFf2HimH8zkyJNMWmky23Xn4V803s/uMZ0Uqb5W0BIjeEbXz8MpqYDZx1?=
 =?us-ascii?Q?pT4WLijBtY8CbrJwv9U3vFw=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f0fc574-20aa-4477-2085-08dda952583e
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 01:42:09.1239
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d7b3C+smF/xHxYhopADV2/BbILq+6EQI1ebD09KS8f2ejyWmqpgadPdSHLwDWx5hUpRIjuZpadLkz+JA+6cjmBeYiFhjuq7+v/kfx3K8cqGSQVxpQkJO8rHnwICk0kyy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9937

Current Kconfig menu at [ALSA for SoC audio support] has no rules.
So, some venders are using menu style, some venders are listed each drivers
on top page, etc. It is difficult to find target vender and/or drivers
because it is very random.

Let's standardize ASoC menu

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/bcm/Kconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/bcm/Kconfig b/sound/soc/bcm/Kconfig
index 4218057b08742..de4e8a0daf1ce 100644
--- a/sound/soc/bcm/Kconfig
+++ b/sound/soc/bcm/Kconfig
@@ -1,4 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
+menu "Broadcom"
+
 config SND_BCM2835_SOC_I2S
 	tristate "SoC Audio support for the Broadcom BCM2835 I2S module"
 	depends on ARCH_BCM2835 || COMPILE_TEST
@@ -26,3 +28,5 @@ config SND_BCM63XX_I2S_WHISTLER
 	  DSL/PON chips (bcm63158, bcm63178)
 
 	  If you don't know what to do here, say N
+
+endmenu
-- 
2.43.0

