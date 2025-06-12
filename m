Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011022.outbound.protection.outlook.com [52.101.125.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67FBB16F0FE
	for <linux-sound@vger.kernel.org>; Thu, 12 Jun 2025 01:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749692703; cv=fail; b=ZuRp1iu9PUqX+tmOKcsgTrRf1nNt508ig0l3dMqnyajrPlkRJyXOryxHKQqz5JeZmdR8mKZZySWurxRxrFgEHeaTErgvsYIQ2320+Estgf5s3uu+T4nOgFNCclef9IGH19o+Yq3DwYEeyh3d/9eN1T2reNKJ1hWF/wlA4IC+bJ4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749692703; c=relaxed/simple;
	bh=RKXxd3/IawIVzPoK9OxJBAv7ea6Pld1e8o/E2vP/ebg=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=WVKwuibnsqkI+euKef6/Vp2dOUtUaPvznS7TWb050QeSQim06qDDcKUMkE+WrRn/U/CCYAZydj+YHqWeW+9jILjJptDGy5sqNshdVsVDPkgT4kK6n/tC7q169YUINT/2CixBygLs6Key+EJ9q7pwMH2wG1zsKMfdELiIMNS8BEU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=j8JK6Ar3; arc=fail smtp.client-ip=52.101.125.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="j8JK6Ar3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jRYLBfRYCQpz69V9W/SGQFMNDbsFa3Jw8kWpEYi4JNEtE5r12DG7wxQ5VuqNslnWYeEjXqdhZm+m7ydmTfZYiS6P9SzIMh00GV3b6K9Mo3nDi0fErCMChHctK2XYcMPVTJ5imRVthWVJ8u6GGCy9Dvb1JJXnmjWWkmjxWZi6Vqd4n/yY/JOIyaCeFvRle+HBEfb6BoZSVD9tPT4LR390tY/eiCpN5+jPttc2M5w37MoQQi5/X+CBY7n8oh2wAPIRTubDgGrfjtrpJzcEhJPdt2GHB1610Kvll4jAp6z6d6yQp5yToRcPElh2gbu94A8PwFTnqGgY+Kbl24uYGDUGQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U3JP/w/6m9hHm0aSjrRFC/8tMieDZRGtI1l2ZmJ+wmo=;
 b=xi2C8+itA9KbaDyPqhLEsEjk5N7qqRczVXPMKZ9LPnY4qlaV0QxrByaQcB9hR/2gMfev5vFBti0m699hPGvV7C6H2z4/qPI6bFi4eBSIU8Ry0si40xX7mRoYGdEpHIwZ7CwVMM+qplaebYcUa4ROUbPT+w6hqf8tu/SQbLDCf36+d8QW6Emyoz/SbGpC61KimNe6dTCVQEcllhbXe+UyiTu5kfp7aCFefvFt6Gcvmyy3W9vsi4Wht3PwQXc3HkdSRxFUeDfTwLiaEiMMLQyxKYIAXRvS1bzPtWfbLMbOnI2ZWfTpWjFlioPvryscQuqmmAXwp+rimhyjyFBZsiB0XA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U3JP/w/6m9hHm0aSjrRFC/8tMieDZRGtI1l2ZmJ+wmo=;
 b=j8JK6Ar3nGQD9RFMSME/4UlG/O18xEVlUqX1SXWEZ04X7zbiDQyWaoeMlSf/3WsahF3q5zxEaI4o8wutVAMct7HqI26Od+10KJ+eF1yN132wXcVRUVnq9uUXs6IuEnNsqGkhL4mieLdxQGKzJ2C2BZInkFywZQo5kSx87vH3vVM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY7PR01MB16176.jpnprd01.prod.outlook.com
 (2603:1096:405:2ab::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Thu, 12 Jun
 2025 01:44:57 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8835.019; Thu, 12 Jun 2025
 01:44:57 +0000
Message-ID: <87msadybqf.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 38/39] ASoC: uniphier: Standardize ASoC menu
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
Date: Thu, 12 Jun 2025 01:44:57 +0000
X-ClientProxiedBy: TYBP286CA0014.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:404:ce::26) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY7PR01MB16176:EE_
X-MS-Office365-Filtering-Correlation-Id: 4cbc9068-c8e8-42a2-0c59-08dda952bccb
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|7416014|366016|921020|38350700014|41080700001;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?E2XVMC8nbRBuYCrVpxc7xSqxCsTCZWICK+Ih/IaTofDE7bwynYy2C7VUT2oX?=
 =?us-ascii?Q?1EADigzZkOI203oInKZYJT+B8t35ACPOe8nXB6Wlu2FQ2U2IJ5wSfBxk89Eo?=
 =?us-ascii?Q?64k3vgjiVnVwFFg6OfyKjrAzykMwLcZAaiCHhbYzph6oDiiIgCfe4ERvoH+4?=
 =?us-ascii?Q?fcO+kxDBXHLiOmcR/Fpkdozp0WGEKoaX3h5eLZd7MEcaaQmC0waLZn+xwCZO?=
 =?us-ascii?Q?y5dxt2IgQalEfUxGpSDiOSydvXSNZKCXSNpa8xZDvNe0rC00nZDTMDBcnESY?=
 =?us-ascii?Q?kFxWu/9agvhB678gEOyzI3qbeS6+KGgCx1CZIh95L25rs19AdRXGGQxinNhg?=
 =?us-ascii?Q?/JRk5cWk/ACK91VqMp16mu45q9XS1i8nC8VlFIDQapGPrtnM14904Ze3TFA9?=
 =?us-ascii?Q?HsM7nzbFeGng5Rymtioy4Ax6zJqyF2+pnnp0T+9hCnMQAsmePmSxc3beWj++?=
 =?us-ascii?Q?3v0sxV2KqUAfJ9GGbAJPG+ja1Zz6q1qpj7GXssb/j8QuBvtsrX2MUeZMq4ZF?=
 =?us-ascii?Q?v4tYT6E/6j2uOg8k7VZW190cr6ReR5I8073MS4Qz762H8dm4RK3cC6GZTmdU?=
 =?us-ascii?Q?guaAhmFMyOAepGisE70lF4Ca0n/onb46xKsOi+0aFK9W9C/+SyW13jxxMcN/?=
 =?us-ascii?Q?PExm/8U7naOolV3387WNHk62mb7/cLyt+HTOQQTb5QBOgIyNvz6Yfh5bqNpH?=
 =?us-ascii?Q?uAa7Rxdm83yeW2gwaveuos2NXvI/WwMdUkEVWLnNUNxi9fXJYsbVar6duOLY?=
 =?us-ascii?Q?OjH0jvKZVZCH3MlMkhbzbzKoQ1g8c50g0rW9yc3d5h6Dj8ui9z3ApC3jxK1I?=
 =?us-ascii?Q?X8BooQhEPMfx9MDt1r0GbSOgnJLoohiLTgoenRZ1Umaa0QrbOxPXr9QvWVfG?=
 =?us-ascii?Q?VpeezuNwUZwHnoIgf95dF5Hz0yFxoaWAzYoA8bt+Yer7C7FzX+k3qaB/5+GK?=
 =?us-ascii?Q?bbEC84U5Pf3h1ATSFsb6IfPbDDLavKfs5cmiWW5eLbCRHO03ApFewFRFB+qc?=
 =?us-ascii?Q?7eeHLnjE3BCgoBGj3zF7VF0rwpEsY9EuK4GPb8DAzsQ/4Q4G839CiDyyslyE?=
 =?us-ascii?Q?n+DqTkImLrM32cat21rb8NUBwiZraZigr7VGhqdcSUjd9H1WLmAGAoiu5Sh0?=
 =?us-ascii?Q?mSbZWuRXyPgbw5REcUfIVoUtFFXWTVqNMYd0gmTTv6vTn/0JPJxgTfF2xMMd?=
 =?us-ascii?Q?679BdctOvYRmjJNDPTPQFButwhDx8V8XVNRsRKIbLfgf2G5A/llxoMiTl8Tm?=
 =?us-ascii?Q?mnAfg4fyu41/P9TP22hWUaWtyE8142t32rRqH0yf4dXiZBDBHKrCbz/vH5XR?=
 =?us-ascii?Q?aMjuLoz7S8Z7+0HQsza1racTZf9gtlzhilGrxNQouTG1Zjgu584M08AQ9gfw?=
 =?us-ascii?Q?EPcI5ykrHBN5Jnr2Q7jFY9H8hF08wSu7mVLXI7QcepPpT6COL2VFzjXJxi4F?=
 =?us-ascii?Q?fuSAOijDtRxj7j2DAxya/yQmtJyuaa8/BSGkyZ6vCx99C3STLsT6UUMK8LqE?=
 =?us-ascii?Q?reUfoSFuP3OKB/LXvA4G1yHtUEagTaOxuAWXoiKEt2SlAUUaGoX13wCdPA?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(7416014)(366016)(921020)(38350700014)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Had9gz9FwLORUaiX+4sv9SaGU8OzMiWZDpyD4PTpdAQ8WEBN4B/Po7lC0JGl?=
 =?us-ascii?Q?ljJUcbRwX4WVvYEsteS+6b2Nf67qXAW560DvchjEHr23UoJw1oW1EpxE7PE/?=
 =?us-ascii?Q?z8fuUCwLqlN0GBgYDSB/JCYCL1EznTC34Td3MyYKHWyid5/vjR/0rPW+yGyD?=
 =?us-ascii?Q?m6YgYF+TREFuTxWqtFaIamllcaqavISwcOKSx3isGlmZD1tSpvVgTNzWcGqG?=
 =?us-ascii?Q?YxXh6MlSPxItqh8N6110zCnsQtSdI4/NTruc9X7w64BGRLx0og4ET1khrceE?=
 =?us-ascii?Q?MAId8vKfiwwJxS8hMcKmmblwBwApGeZobXweC26IPhHaE0YCpf4DZIAJXKO4?=
 =?us-ascii?Q?DnXbuWLN/GKcYr/MMVvVKHO2/lYK89N2l8WOGhDCGfx+VkFTM2CQ16SbXVka?=
 =?us-ascii?Q?rss2gyu4TPbqGzAHRyJdN5w5QC2Pv4lHrG2uAUhPGNXaGU3/JnRQnA5+qzAb?=
 =?us-ascii?Q?gPClacnhUA/JU51iLKp0MKjXpprU7+um4BLfWFiDeSCPXwWSeOwVyW378Fd8?=
 =?us-ascii?Q?7QRsYVf/vCfRGPYA1gDZWgBsPgMtX8JX4WExL+bdmS3ca3av/0CFtoErU4J3?=
 =?us-ascii?Q?AvLndFk0y+P0YEgHffSMYZAPlqlath0TRvPQSq/uy1T0yz6cMy2nAw8E2z9A?=
 =?us-ascii?Q?U6kQfY4KO3VaTVtIsLbwOBMGkhGd5kaxC4e4af8HOFLe87JNuaP6l1mmzwYJ?=
 =?us-ascii?Q?aUb4XElL7e112QNlNyYUdTvK/YCP4nBA6Ld8ftmnJAkps7hBlDZL5pIUEqQA?=
 =?us-ascii?Q?ah1QoyHpCUajkJxnWIXSckCXs2FJO/g7URI87Y8Yn8Ryu5uWizFi1g4jjcop?=
 =?us-ascii?Q?De1XNNunVjy+8h/qXbu8qHZWPMKaSlQbzlATDlRheP+BpyvuKkry+K/ldbTm?=
 =?us-ascii?Q?QbwxhVxImq93D2glkGsZlXdR7G7AKOTmoxKxP54UqjR+MQURnp3uJVcVyFX7?=
 =?us-ascii?Q?RCYf+DqQ/8ZUPBT4UQaxTOwYxu8PDrqr+M3B/fA2qAPgLTE8R92A6LOxEGaR?=
 =?us-ascii?Q?pfKvu2G/osGHe8/3BuzYA7zKBYnBFVMzWxn9LqyM6NFteNhdP0Qb08WppTEL?=
 =?us-ascii?Q?KPhjWFap9hMQXePnhHply56SK6mQrW5rZtLwa2pCpl0jTrFTHgWD5+sH1d4H?=
 =?us-ascii?Q?zO3K3m3t1YkcEDlhUfLmyktCo/GIuoqDs+XXorceQcIgqPdFcHHTzDNL+UO2?=
 =?us-ascii?Q?lWygMPbz0TXoyZeRINAzm9IGXqT3tHwtsPfwB8brAieRjt8pAQeRdcyXRkUo?=
 =?us-ascii?Q?T2Z57y7oFI6cAwbL6mhJjb4XnOyV/rR5ZMhzCfJBwTi0Llur8sW5PidvKL13?=
 =?us-ascii?Q?YGkBdFa9zq1UM5xCJTtzHKuDErlP5hre7ThK9xLLr9BYZnWoiIvrUbLre7z9?=
 =?us-ascii?Q?Rghq84Va3uSYzZNUnXuMMkQZm9/btkr0hnqY6twqA2UiiOQf0qBJKVYCx+Pv?=
 =?us-ascii?Q?NZiiGvHUtTo1Qh6kCayob6Z7jNLXlbatJkcBunadHAUzOjnMarBW/j23Bomx?=
 =?us-ascii?Q?ZfhSzLkPv/LwndOQZS3wiG/uxOayYlgcf7JT8wkwJwFK6gIS4z784PJTuM27?=
 =?us-ascii?Q?APZS+2Ozq1F+PdBBtYjd7P44zLm8QO1JknuI6gLmVo4T8wzB7UalcDlk0mID?=
 =?us-ascii?Q?twYUMLXMohnLJR2QZrGW2J0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cbc9068-c8e8-42a2-0c59-08dda952bccb
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 01:44:57.7576
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z+OIZEVaYGv4ztLLrYTpO6YU4M7hSzlGxMRlr0i97VuBE9i1sAAf/DEd49GCkAJammsWVKiNjGcg8mPk3J/EpcWImxetAuNBMu1k1dzjg2rfA6L6qydxZiKAF99Ihqbx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB16176

Current Kconfig menu at [ALSA for SoC audio support] has no rules.
So, some venders are using menu style, some venders are listed each drivers
on top page, etc. It is difficult to find target vender and/or drivers
because it is very random.

Let's standardize ASoC menu

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
---
 sound/soc/uniphier/Kconfig | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/sound/soc/uniphier/Kconfig b/sound/soc/uniphier/Kconfig
index ddfa6424c656b..7c978639e0aac 100644
--- a/sound/soc/uniphier/Kconfig
+++ b/sound/soc/uniphier/Kconfig
@@ -1,18 +1,11 @@
 # SPDX-License-Identifier: GPL-2.0
-config SND_SOC_UNIPHIER
-	tristate "ASoC support for UniPhier"
+menu "UniPhier"
 	depends on (ARCH_UNIPHIER || COMPILE_TEST)
-	help
-	  Say Y or M if you want to add support for the Socionext
-	  UniPhier SoC audio interfaces. You will also need to select the
-	  audio interfaces to support below.
-	  If unsure select "N".
 
 config SND_SOC_UNIPHIER_AIO
 	tristate "UniPhier AIO DAI Driver"
 	select REGMAP_MMIO
 	select SND_SOC_COMPRESS
-	depends on SND_SOC_UNIPHIER
 	help
 	  This adds ASoC driver support for Socionext UniPhier
 	  'AIO' Audio Input/Output subsystem.
@@ -21,7 +14,6 @@ config SND_SOC_UNIPHIER_AIO
 
 config SND_SOC_UNIPHIER_LD11
 	tristate "UniPhier LD11/LD20 Device Driver"
-	depends on SND_SOC_UNIPHIER
 	select SND_SOC_UNIPHIER_AIO
 	help
 	  This adds ASoC driver for Socionext UniPhier LD11/LD20
@@ -31,7 +23,6 @@ config SND_SOC_UNIPHIER_LD11
 
 config SND_SOC_UNIPHIER_PXS2
 	tristate "UniPhier PXs2 Device Driver"
-	depends on SND_SOC_UNIPHIER
 	select SND_SOC_UNIPHIER_AIO
 	help
 	  This adds ASoC driver for Socionext UniPhier PXs2
@@ -41,10 +32,11 @@ config SND_SOC_UNIPHIER_PXS2
 
 config SND_SOC_UNIPHIER_EVEA_CODEC
 	tristate "UniPhier SoC internal audio codec"
-	depends on SND_SOC_UNIPHIER
 	select REGMAP_MMIO
 	help
 	  This adds Codec driver for Socionext UniPhier LD11/20 SoC
 	  internal DAC. This driver supports Line In / Out and HeadPhone.
 	  Select Y if you use such device.
 	  If unsure select "N".
+
+endmenu
-- 
2.43.0

