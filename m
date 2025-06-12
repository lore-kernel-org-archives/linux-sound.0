Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010056.outbound.protection.outlook.com [52.101.228.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 265DE14B950
	for <linux-sound@vger.kernel.org>; Thu, 12 Jun 2025 01:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749692654; cv=fail; b=iTqmgOILM2DtO4vfVWrF8v6Ed3H7dP4xR/Eg0ojWawKgJDsuXnUexLSOiZCxhsGXp4/kc/K/13TW2mK27ROP/CMPrmMvHhNsqWtBimKjIxrvjh6LjDmomVqOlclXm71ANBHdnoYVkIyAFbB2JxCOr0yxt7q8zUiMaL39O977R3E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749692654; c=relaxed/simple;
	bh=xzrkhb4N/EiUwOFFHXvBKf6rJ2QJfkz+hkV5fmbjPUQ=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=j9XjdwSqTLnuzktLyJqb8zJ9yydHZLJ3zDsF4wZDta7sucW1a9Qxb5tmS2dPpb8Gdl7mLyyv6il2ueU20sYiz0bW6XmOOuTt9tDcfgWtfHqmmec7GzKgBkqQeTeKQrkqk/wei51h8HyDXAi0GfWukKat0RIYktBf9zNoahXGNrw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=eKVc/8VG; arc=fail smtp.client-ip=52.101.228.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="eKVc/8VG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JeltIVHQavr90w0NPjF9++xRYwywEsgM60DywwI3P1M2gwSAvZ6qWXLK/FzevmUpy1ThR4wu021V9vngDpi6EEHTaXtWqZHcbR4tGhgRGkQ6CYH0uNuGSdIonMVByz8b/qNpRLeoNzTYIIopzAX9Hv5QIwJm9CL1hA6vx4EQ8RnZSvrW/RhGElOvvAGTB9oVGWP+Q5B0Rcaop/09HSCC0oFGt9D6I7iWHNXmfVz0RE7P9Y+iZboUAl2E2/kdODaYG59e0ApiNMQaALYE/C1Dw5dL87MQOfbezqxQB93bW5T0zQgidn+XYriYGfJgnzMmHDR58UU8szNOOaRpIY0DUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=woDoTQZZ2+l15UtA6rwaWw93mfmTvuEA3Rwz5U/glpY=;
 b=Ch0vgonZz0noL13gvXwSclQ4F3/vZxxD1bS9FtumI/evj0+cCLGnmCs+pXAKipevuXuCA5BSGbY2Apve8o+zqYhUZ6DOABbCKkPYfINeFMRSLBrqrI/xcXGlOb0SZKTOeRe9J7Kp3ORFzlcjfjrnrFkGKvkvRDhXvgd16BJcCaKntuMjV+JybvMfTB2gKCsWrVzFQkCad1Xa4eRqJH5XsSxWKFYmJ8YlSzQMRCzzO1zuR6VpAy+QtAFcoCLvKtPDPaCl3twO3qo3aXT7RKSzTMOvWsSByJ+k6Kpol8gCOi3TuY5w25EQzopW0kYesE0pp/cwm3OPNcKs3bVhjXU5lA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=woDoTQZZ2+l15UtA6rwaWw93mfmTvuEA3Rwz5U/glpY=;
 b=eKVc/8VGRaeseapwRz6xNTigMqfLV/on878cd7y7gRsm2yeaKSWnqukCSmW4TLth/5fOc7bW2xZGwAaVPpI7tBtf2Ufa/gScwDpojrjQw1B0Teehggr8V4IuSwBaiGDkbwau78QlFyBChXSzKcqnZwnn6JGSZiRP+MS4KGjAmfM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY3PR01MB9824.jpnprd01.prod.outlook.com
 (2603:1096:400:223::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.30; Thu, 12 Jun
 2025 01:44:11 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8835.019; Thu, 12 Jun 2025
 01:44:11 +0000
Message-ID: <87zfedybrp.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 29/39] ASoC: xtensa: Standardize ASoC menu
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
Date: Thu, 12 Jun 2025 01:44:10 +0000
X-ClientProxiedBy: TYCP286CA0371.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:79::7) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY3PR01MB9824:EE_
X-MS-Office365-Filtering-Correlation-Id: af3201e7-fe6f-442f-d675-08dda952a0e9
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|52116014|376014|1800799024|921020|38350700014|41080700001;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3GPXW1pQuwhddJthwmZGZlLRhAi6i6HSO0PCKJNLSS5wrt+6v7L4h7CcSLY8?=
 =?us-ascii?Q?tFMcurqRflC8eg+mEhbSpjcT0QbKaTq6fDHgheARJUx8oM3PSQ8iPcGMkbus?=
 =?us-ascii?Q?9yY04PAM4COAcA490TyjCFWe6LC+2O8PGzEq4TwYFEzNf7MpB/BHo0ZnPpz+?=
 =?us-ascii?Q?gHo1B5lEogO2ro4FOJsKf4IrP4itcCLkwc/jFzM1Acpqj/OcKIO4LObPRPWQ?=
 =?us-ascii?Q?PkdEzJAgGHc1UJSdnCRD0sYtxFCV5WGe1qPgQQk/vJZqvMiAy6/8E3YVflIB?=
 =?us-ascii?Q?eSIXnFn+ybBvBItQ+mgq93r6BO7TaPc6iAcs7SfvR9+V2tGW5FMMSR+DJJCn?=
 =?us-ascii?Q?BSyjANYGoMy9c4D3FMQ9XSBms4nSvLRiMnw1zoRGFeZg54ioSlCYCzq3my2N?=
 =?us-ascii?Q?xlrju/G/piAGpuynKmUju8EVK7JTo7usYtClCgZo480i5CuSHelKFW3znk0H?=
 =?us-ascii?Q?+XW1KcvTkk10Q9qkKkAyQDuKSglByohh0sD0wwW5cEDkBcVhKFKhv2bgD/zL?=
 =?us-ascii?Q?aZS5YtBZt0FyP9hsg2OAYwLjLSj+zuY0k2jojXp1ct49S3tK+qIvKOaUGMZ2?=
 =?us-ascii?Q?6f3H16K1jrpdABNIru1Dg5Ht5X0820xqn+q2KjzDaBCJBwvsA523vgZsr62z?=
 =?us-ascii?Q?U2ZNYeIMdOHWAHgqlDqwsgWkn5Q+hJWyfZjMqF/UTSeMieMeZV+m616a6qlY?=
 =?us-ascii?Q?FzayHL0+vsWFyPC7sRpy7xdTCw8+kIyhrsxpg3usr/+//35vAyZK5f4rK7jt?=
 =?us-ascii?Q?5aV/OHxXPDaS+EhEv78/rV8SYz5mJwX3K7iayyBJ6U8PtqqZu90dLVcJwD6R?=
 =?us-ascii?Q?IgwvoCfJoF1Z2Vszo/tqvGvj5tSAdseRZ35jS+v8I9rdRWW02vU4xXCX0SVR?=
 =?us-ascii?Q?09ZFiA9Z3yeJUgGQt37L+Ob72fr2yYyDMMeVqyGYQc8Y4KMJpx0ZJKhQSX0e?=
 =?us-ascii?Q?cNRz5DQFFTqEpjJ/2PPKxTQrGPKlzv+XQBJl6zM1Bjwe2ivKWaHN7LKz+2o0?=
 =?us-ascii?Q?R80opN/OJBBOuw4tPnSXv6Y/M3dZudTXPF6UoweZd1hrulgM+Xqlz7iYadZr?=
 =?us-ascii?Q?aPwQhgoe/JL5qi5qPyR0J+m+rt4FuBAybxAU7Au5nFNjtMBpu9tMhsDDP37B?=
 =?us-ascii?Q?RcNGu6r9qQKjuS9M/X9uu+ggqUQCg1O84LdIvOpr6Mn4TVbWSoPA7AAYCMNm?=
 =?us-ascii?Q?VtyhFdcw4BzM7OCa2BvnqBOcTIou6ywX8qaaYag2gfcKVAWVWrOIv/7m694S?=
 =?us-ascii?Q?IXM7C8XT3Y4vE9mvBle/Mrz7klfFAgPwgjjPmkOSQ3oDtKQ6jKePj7/tBZ2T?=
 =?us-ascii?Q?o8usBXbTiHHH/Nqqku2FEvtFnGkp4cW/TYP8Akb7RR7Y8ykP4yRl55RhpIps?=
 =?us-ascii?Q?+Mo3LDf6bvAoDcBUN3aGvieg2ys/vs2mNYm4GTgorEeQRCSf9wzjhy1Wz1em?=
 =?us-ascii?Q?jc7JEog7wOcrSe/TEqAiqMYiBTCwWMTejwRBB+tU7mx9jQZpbRyGe6psRECD?=
 =?us-ascii?Q?gvr71XpLV75ASDZxB5cdtQxzKr4OlA3wnwU5ljW6EBLYjnMPsr6V0Zj44g?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(52116014)(376014)(1800799024)(921020)(38350700014)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pbg+vn5pfqgydRM0P5UaPlRbbNf+R1x/C37yl3pYpAj0nfl+KBONb/t8adqV?=
 =?us-ascii?Q?S++DN0/cGZpro/lWBOydeAB6LzaGVZEO8NyZy7lm9/zstWNvxnAWCrlvmC5X?=
 =?us-ascii?Q?GFFQivf1J/+poJZMYLdqEYVIPfcSFbc2MaGwoetTwhe0g4EEBrNwK3pTDd6n?=
 =?us-ascii?Q?eW+UBCHneY7ulvOKMFWkv86iy7+tL5paDjqUW9ucVx4PLSc8+fczkPbFqqKp?=
 =?us-ascii?Q?FDSfioKVXICP6Wd5ZASUt44Tvra1RUynedte2UtTiF5GNvXJZRLHH1TUK41q?=
 =?us-ascii?Q?9bHu8FU62JrXARqiMtIVaN2R97D6U57vUL5Hpark2jK9nXk8wFkTi/J7Gl7P?=
 =?us-ascii?Q?QRiDO/dxIqcSjpFIAfW176b2jCPflRAS9/2BdHke1PMihKWoMtH8GWE/ELgJ?=
 =?us-ascii?Q?DBG954mnoGn2JiaMCE9qhAamos5OE0CMDn6mfaZGo4MRj6b0OSbDoSzXd96P?=
 =?us-ascii?Q?ZbOPRMlRpp9yw0qCKzMJZO5MGZtuqUiyPE7T917qqKqTgmmq18k2HuqvzMD2?=
 =?us-ascii?Q?djVvGDZyg8T3pxwNLuHuoD8/ne5kfN6gCrfUmKMlHcRIONYIMeB8+Q9EmS8Q?=
 =?us-ascii?Q?VE4foFkJbviNF7rxX1hcrTGa7xD4bsGrkGZWwooOVVxhGg3G1HY4E6Jetbx1?=
 =?us-ascii?Q?mGGUK0JABMiq6Ugn8LcyEq/cRi4Mfp9p9gs7SDYZ3BFzCBu+qC9Ug7KsvVAB?=
 =?us-ascii?Q?+Jjr85ASJXVRyxBbCf7YAU1YS2sJkMUH+bdPo98QMtuUCYwoONGAkpLjyTem?=
 =?us-ascii?Q?OcX4E9KnHAgyJaGZarRtX3Nz3Z+duxgMbmCP8+t3khZpgXdmfxnPB5qo8Hn+?=
 =?us-ascii?Q?EjWANc9MNoZpORzQ6aGBEwiiquk4hrW4UUXLl+F2QWVKDSjtG5h3nQxLk1OG?=
 =?us-ascii?Q?EGPy6ancfn4htdUjUUSgmxUp1C9FXKK+5ikF5KCj1ruRYcpHKQhXVXvxS4eO?=
 =?us-ascii?Q?zvxrwmEFSXlZQTbwqnKE3D7jELNpvBX/4ZXR3GuFiJmEIzwVj37oLA0LA0PG?=
 =?us-ascii?Q?vQTBdIKHcieAi/D3vHg4d2k+f8mloJIksZlLeUgs6jKlKpBDnpsuDKnTFvG2?=
 =?us-ascii?Q?sjMa68PwQR0f8CRd8uAqYWlA47PYQEhGrdEnAZopYC104AjtGrA1btOO46HP?=
 =?us-ascii?Q?RzjHEcfPZUxa1hwYRh6DdPR+52LczzJnIe5ebgqt/dfN22Y5fVZ5zFPTbJU5?=
 =?us-ascii?Q?7vCeav42hPcD1Fmza9Vo+Q0Rlbfj/mHkMkn/7a5OTxbO+IbF6h2KsIhOQSzy?=
 =?us-ascii?Q?MChOPwpfB5ZmHhI2fctp80SGdLmgfVo5RvzL73Y57yDbCJ7dO1ndc4gYxzwF?=
 =?us-ascii?Q?QDpXt+fPIjQCWGr4GyYsZFUJgvaJEdkBQKJTRKRVgL/0g7cS8mlr2wAgQtf+?=
 =?us-ascii?Q?T6p30AQAAK4T/t4NNmN7hB2ZypvRZ/ak8FVP6vudIdwYUzM9Q0sx/iKhY9ZG?=
 =?us-ascii?Q?T6Q80dLH/F65prT8k9vGAUTnZMLBJEh3vfD4Tu0qyMztP2cJbteZadNXxodJ?=
 =?us-ascii?Q?jBGn5Xeb5Z72DstUcecZSTcQK+KjO3Dy2pHb9AiG+F7qK+ac8i8oqbnxlLw0?=
 =?us-ascii?Q?tLxvBJSWa5ZzJsPE/7aDLCY+dQjopV4/+6mdwAK6MdM//RtjrgH3aZIZ7zAF?=
 =?us-ascii?Q?AKg9Zzx0IMfA3SAwvqZu1Nw=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af3201e7-fe6f-442f-d675-08dda952a0e9
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 01:44:10.9753
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fBzJ840Ntr+HpT5/TIoEakspZtFgIWO4zc8H8rSazvyVWYF7h+c7FpK7zOrV0tveJ5Hf0qW+R6uCllh2Jo34gDHgSUKntMbqlSWPBVcQLsYX2lk8whgGinqliJIlH5nk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB9824

Current Kconfig menu at [ALSA for SoC audio support] has no rules.
So, some venders are using menu style, some venders are listed each drivers
on top page, etc. It is difficult to find target vender and/or drivers
because it is very random.

Let's standardize ASoC menu

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/xtensa/Kconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/xtensa/Kconfig b/sound/soc/xtensa/Kconfig
index 74b778f186cef..87457272c7731 100644
--- a/sound/soc/xtensa/Kconfig
+++ b/sound/soc/xtensa/Kconfig
@@ -1,4 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
+menu "Xtensa"
+
 config SND_SOC_XTFPGA_I2S
 	tristate "XTFPGA I2S master"
 	select REGMAP_MMIO
@@ -6,3 +8,5 @@ config SND_SOC_XTFPGA_I2S
 	  Say Y or M if you want to add support for codecs attached to the
 	  I2S interface on XTFPGA daughter board. You will also need to select
 	  the drivers for the rest of XTFPGA audio subsystem.
+
+endmenu
-- 
2.43.0

