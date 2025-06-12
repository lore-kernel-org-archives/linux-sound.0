Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010014.outbound.protection.outlook.com [52.101.228.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B468C14B950
	for <linux-sound@vger.kernel.org>; Thu, 12 Jun 2025 01:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749692641; cv=fail; b=dTfmXSOxcVmA4qzg/xOpWVj5VB0YDChwNkgaV8VXaEhJ7FdSUZhDzYP54oqhwTIhQAenV8ZqZrclAwy3Txyn2Nf07awDJDaMG6YLd78qBtgd2Toe9QyTX+ChNwBnzi+BrtcHK2s6fS1HUqn/SB1rjtNaz6RGY4aKq/SEKhcVWyw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749692641; c=relaxed/simple;
	bh=WoyprR/WvK/wyvx8mfZtiSSqzUL2uOkRwmXV7c8GgoA=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=AxWs7MBK4W81GYGAW27aAcH6pxSXbltnLm6Nqx25bZ5CJdTvxcrzdWTA8aG6HyokTP+ztbR1hGAS+bd7phrxW2DVfxV1Yey7wqLpEUh3mcSLSJ3ci1DoT+jpOGKHfIlgJx7xh5xctrgzzh6WE9E88FeFqivIHt53+/ZZjHn5Eg8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=eb//UDCe; arc=fail smtp.client-ip=52.101.228.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="eb//UDCe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cUYm3NQY5d4orLK+BnbmJpamsiDJvrlirVFb4ncylF14MWeqNyaAt+y/tqlosd7bP2KqQv9CPBTv0Z6VdhR0kxCWWcVrNmnG+2he24FCj/5N0CHdmOAu7diMBF5Xt7zPhGdqrwFk9NrkU7U4sF7870CmSjqQz5shC3WFTlqsSuuOpCz3OG0eE+sMfhNRGU95VARUdY25kreY9XG7mEpkKweNgY6LDjimtu4UFXU48RIYaev7c316xtbOb/cOpE3tW62lR6+0OSo8hVhxoEoQ82HBymHj3fflJXTFFcJS9fuGM8snlJhXI3DbZC4RS4c9JXEmF+62gHPzbOt3vf3Aqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JPQSjHme5FIe5lAVNFfiN2aDKDAc3plB1Y/R41gi8Ck=;
 b=Vhs0t0lA8PYGwiWooif0uSk2oP0qoMrxUjSJs/9W8AeUHMBUtkrs/m2UGHupOzktvjc1V3JwOSzOJIypczfbIyzUypEfhcd1pkl4pe6rIsMxyWycLtyz9+2zrS5qv/CFkWRfm33FP6JlDtgQYHVjCcbU3bJxdvi8WNCWAUlCLpUdbS/LFgNAvCLWLT53fuh/TWPykAW+HE4g+MsD0r1yfyXxYIO77myiPMG8X+leOoL0bHy2+MbCnJ3dGBOJ/WHN0rXa/wLx7028/xy2hgOl5NxrdaeYHPT0PJJRDJyZtGR//BBfKrpR4x1g+HwXrwXgfC+wfqdTnjR+598b1GTmAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JPQSjHme5FIe5lAVNFfiN2aDKDAc3plB1Y/R41gi8Ck=;
 b=eb//UDCequDSMt3DhjNa90NNsD6UhBp3tbf7k3RQ3om96w7sK1wH7V/UDXf40PWV3Xf/aKyfVp1OV2dGsYy7rT0824TU5hnUMAsrv4vt4GpBH6rk4EvCdUyltmq7Wb1leCJJN+nmOgObuJ4sgwwWKrbm2vyOj11crPs+L5TuR48=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY3PR01MB9824.jpnprd01.prod.outlook.com
 (2603:1096:400:223::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.30; Thu, 12 Jun
 2025 01:43:56 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8835.019; Thu, 12 Jun 2025
 01:43:56 +0000
Message-ID: <874iwlzqck.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 26/39] ASoC: google: Standardize ASoC menu
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
Date: Thu, 12 Jun 2025 01:43:55 +0000
X-ClientProxiedBy: TYCP286CA0359.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:7c::13) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY3PR01MB9824:EE_
X-MS-Office365-Filtering-Correlation-Id: 1791a30b-da9f-4a0c-bb65-08dda952981f
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|52116014|376014|1800799024|921020|38350700014|41080700001;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?L4h5LJxp/GVf1ro0PzVo3YLUZHSQAySe48kf+OBFz811Mpk4a5FDHMHmwTDq?=
 =?us-ascii?Q?Fo+1pNaXs/vPbcgWpFJWDfF5I7oQvS0W5l8XD+C3D3unP+NNCys1co2CIUmh?=
 =?us-ascii?Q?hRbMlAjDFswcKx0z9dbp5IDLk5s8xfwMQ8cKsaGe7k2/dg1rRdyn2WvPnbks?=
 =?us-ascii?Q?c0VQIfsFpyva+9shWQttVQDleXR9/vwvAmpnrTh70+93QhDhtUGEOeOj7ZfJ?=
 =?us-ascii?Q?Q/XYkrewFzlq4Q6mkciJh6vXo2QOfZ3RQUuHhm1Vp+CfZSIfDg2JS4YqEKDt?=
 =?us-ascii?Q?I3oczszvG73ooh6o6qF4ClokMmAJSYjPQgNl5FTz2vXrqWEC3J+i7zZaYVqt?=
 =?us-ascii?Q?AhWBoMucrf/ZNXSZiU97Ai+abvMGbOvylboYCqqlA73wxYjl5YiowOG4xn2u?=
 =?us-ascii?Q?Z5kMEymfv78ZhNbOHrxoYYlffz8xWwDMmW3L2Mf91B/TRnW3X2VB2YdKb4Mc?=
 =?us-ascii?Q?TfnEU2u2MZvTvRFBgcZ5z1C52HdQ8NxGrfJeyY/CEmTnRtrO8/1Rc8ACmb7o?=
 =?us-ascii?Q?sXAWd45ZBRYGWVy0CIrmxCNv8pb956OsZXwpMASHy2eMMoy8OIyP9T2mZ91H?=
 =?us-ascii?Q?7t/EdGrV9mW6CiQRlmnZKlgJcujwtAlekODddCgqRZM5qgrhvmuSswQi4qIs?=
 =?us-ascii?Q?iJzga9QXS1Pwf8yv9U+1COFIFMXJZT56GPr+vhNVSpiCt90f3b0TWx4Xg3rL?=
 =?us-ascii?Q?5x/6+He2VkpANkPk/dkIkpPDGoJ8HhjuNrQvinKgneMovu2et55fLrKlVbqM?=
 =?us-ascii?Q?0kS95IXHvbMxBPVj/3m4kgtYLP/Wh8Bp+Rb5artdNEcx6GhQHSEvfh7ib+Vc?=
 =?us-ascii?Q?PqEKlhEsZ0v2C7Li2nVeyTIeU7VE5eM9RXtTlgjeOR3NDHU0TdTmyvnlxvCX?=
 =?us-ascii?Q?Ov8Gyl72XczI+ZFpFktp3dR0EKc9OTj7GwLjlbFHwp3EYH9o2yG6RG7OAhtG?=
 =?us-ascii?Q?/t/Oa5MJRX/RIlnHWECtgzazoqJXVCDALNRQko/PisIdv0otxZjcvR1RIXOR?=
 =?us-ascii?Q?ZJWMdNrJHpXtmmlj2UdLh269+Mfrmz5ltlodexhMqYpweNZkevvztEr8Gt7K?=
 =?us-ascii?Q?SgbbagpOZtn3ze/k2M1TCW74J9z1IF5/Nc5h2A6Lcg90P5fudXk3dAU7E9Id?=
 =?us-ascii?Q?uMnYsqUajMMA/9PT51fMLSzfPLRJ3m5APKO41Dyhm5Usj023Qd9LZGn8ywxy?=
 =?us-ascii?Q?xVGSPTyJC9pBvex6P+EnzhGT/LRRccj5fmWnsfzv0bczYCIAnYfFC7zKx0ct?=
 =?us-ascii?Q?Esl69J7HydNQuKZ3z1DD0efqyxqu/oRPcBZX8srgVOaVYhOvGdpagUE5BJWG?=
 =?us-ascii?Q?Usqr9dFLFXVLgr0jKeBkTKHJbZ6PLYA0/wvsc9f8eXLVu+rwc7IvSn8UQl7+?=
 =?us-ascii?Q?EzxnX4aSg+8beraKqHmhrloKhA2iWdd48yQyj5yvZi9HZ7VxV8+7WgC1mxqy?=
 =?us-ascii?Q?hJljRPK9AL6m4b1bVmloj3ds19RpkXUAJ+34y3jRk5EmM++lFe44/KHJehiA?=
 =?us-ascii?Q?AyKddMB92cPZCVo2K2pBPH4O78unpoVnSUMp8Msc6WnlhbuqdjHqQ+kgCw?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(52116014)(376014)(1800799024)(921020)(38350700014)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ENEBkT016tpQ67+oeNYErKTfWmXjwDckh9sKkYxjxPQHgG17RDShQoQMzirW?=
 =?us-ascii?Q?rKCa4G/+ludnSP9p3nUuq8i/NxxJM3NOiu/LJiLGOClmFm/QjEIHt2YlCycA?=
 =?us-ascii?Q?XmO/bTeU2CW5udYEaT7CeziNLzg2x42oCNqRLaMGzzB/d2rcNrrXcVMk+ex3?=
 =?us-ascii?Q?ttPhYML54842GaQF4BqZVUTx5qyyq80S6hIAM+T8dZasVHXabrFlaGNihbAU?=
 =?us-ascii?Q?mmSrzzp6/NzAgvVLHcGZGykKrZUfJv01JphumOPHklsreMbUGjWQpyilS4ga?=
 =?us-ascii?Q?6dhSpxQPIaFFgicjjXOoYY10dt+qGAoy+REr+W7pZlNRJug+Oo7mhVtzKQRe?=
 =?us-ascii?Q?MQeaXnusW9Y3t65Jmg8P3ham4g1MUGwJ9lzRnc9mpO97LyV2lG4ZfA8dTaCq?=
 =?us-ascii?Q?vZAC1Tm6qKQvuWVOUSf7p8IZQ94QxLK4dUW1y+pMuRib136BXygFPKXZ2U2I?=
 =?us-ascii?Q?PuZvEsrryy7cOnMrGUQgAarksRxEPxWD4EtafjF9UpAcPWUu1KvioAwRYLZR?=
 =?us-ascii?Q?Wb0TkmiwXzAhZG2ZhPjjaMisw/q3y0TZEKaEcy5zPyPYb5aFD2O5uT4XNre5?=
 =?us-ascii?Q?A0Hn5HDVMa65MuAr6roJO/OJDlLYaqMf4G6LLEcjKw8PAJNeKWZcwadtrWYZ?=
 =?us-ascii?Q?e3fgJn1U0y12gb8Z0VK1Qowa1UbzC78PtvCB4B78sO/R8KGh/flShJmBJqhq?=
 =?us-ascii?Q?HEoUxpEc8cMTacDFFHS562CAatvRjZWyhitDxT+pT+q3EWyzbannksRwTb4/?=
 =?us-ascii?Q?IlLQb8GXs1Y4OI+Ke+uJkYRlvD04wh5HLZR/ziKMOjZOZlTMEpRQn5xwVILt?=
 =?us-ascii?Q?ZcGO98dnIBKOWBc5H76+EDReyoKG61knItjFmKEP6pSD2vyPaXNrUrYs4NiT?=
 =?us-ascii?Q?XPxeK4eoShB6uMdIQNah9WKeplKFmmvD93V6L/L3hdgb/GSF2Wpk33cvYhyj?=
 =?us-ascii?Q?PV/WbL+SMlyy21sMNgnC9YqGNWum19YPwSxNPqgY0aVILzWC4ahKLQn8+mcx?=
 =?us-ascii?Q?WtXMp909+DuODCi02G/sHGJUqs+LS8uiS/xQtr6ZaSX42HEyuh/fPU/4bu2l?=
 =?us-ascii?Q?mKDrv1+TWAkjad+e7L7p4MZ4XRX1jwEE1K+ACmzFjHb+xIqhEv4GzaKYTRGD?=
 =?us-ascii?Q?8jEH18K6lf8kFAihn3f2FD9XGgqMU5F7n8u1oEsih54CyEnml+9SuqspYSlJ?=
 =?us-ascii?Q?nVH0Noh+ISd0uRY6Z/ROgMbTxInT8caYxuROY8pRCNDfh0eTikL6TxRE/kSG?=
 =?us-ascii?Q?09oZoMx1v+y5XCwwEU+0e7zzqqu548ncH9oCkTy/GyBrEL/TMAZLtRkRjMQL?=
 =?us-ascii?Q?EUrVb8FkVjFPE25WEIaiK+NzV/eVkvDUQEWELe+zZwscBXIUGyBAJ+lqij8j?=
 =?us-ascii?Q?QBSNk1BRxWVIt8kMERlS0nRbhccXMRCEXHvZ14EIwnfWwJcs++RvpkS2vIdG?=
 =?us-ascii?Q?OTxpFq/4apS3GYvnWzYgPv9SyCUq4S5dLfDDbQKXyUL8t0uaZ7KOEbirP6KW?=
 =?us-ascii?Q?itcutVYzwv5VHFUUcaYTAGw1hBG/vtcUxtknfLQegaoHNXxjFeAs3StqI2Rg?=
 =?us-ascii?Q?5CHOEu0isYRUlzRrLFqtfm6WxnpxU27zmRtixDWVGcRcCh3jx3/1ITiaY2Yv?=
 =?us-ascii?Q?C0gQSlzlEj3eC5vsnu9jhhE=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1791a30b-da9f-4a0c-bb65-08dda952981f
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 01:43:56.2606
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: poBklx/AOghO4n8bU4PmCcBum7vmmO2Ui0MmI3C3xnLPRaoLdAuYltuY6ZQc0nX4YpsfnHBdl83t6XpvkbYl1hXtLHtkDKQKD8rUj0QIZH/f19FShclBmz7zD2tGo7oT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB9824

Current Kconfig menu at [ALSA for SoC audio support] has no rules.
So, some venders are using menu style, some venders are listed each drivers
on top page, etc. It is difficult to find target vender and/or drivers
because it is very random.

Let's standardize ASoC menu

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/google/Kconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/google/Kconfig b/sound/soc/google/Kconfig
index 7603782fb0602..6005653170a8f 100644
--- a/sound/soc/google/Kconfig
+++ b/sound/soc/google/Kconfig
@@ -1,6 +1,9 @@
 # SPDX-License-Identifier: GPL-2.0-only
+menu "Google"
 
 config SND_SOC_CHV3_I2S
 	tristate "Google Chameleon v3 I2S device"
 	help
 	  Enable support for the Google Chameleon v3 I2S device.
+
+endmenu
-- 
2.43.0

