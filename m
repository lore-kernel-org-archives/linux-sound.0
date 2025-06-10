Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011036.outbound.protection.outlook.com [40.107.74.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4A6025DAEA
	for <linux-sound@vger.kernel.org>; Tue, 10 Jun 2025 04:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749529329; cv=fail; b=EtsSlIRWAF3cRrH0JhmgyMPG4kyq9wKhaKGs1MCpo6K5yn8aHKMl7uFg1z0XL/8yWjPA2yhjr3eBcuZEvT/hDDkpZY8NDwpfjfraeTeAh1FfuqCJNx7bgOiZqwjHhkuYqTSjdmMuImGsHkLFB1T0xmM0SLXHQqg3XkSIYiRk9V4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749529329; c=relaxed/simple;
	bh=LMeLARl1nXE+FrVbOvxAXkaX+S+YY13+7gr1ktgqePE=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=O1JdvQHWrHzzTKflcvxl0hdN9jUJUBHqMIo9gl0yrOztHZypBzIUw3Xou1FLVtRyvIdm+DIxKZOOrVivl0ITL+3N0y0QibxDNZ+LuWQquBWaaxKZrLgvzovMqnY235M2D3v8LXyOTjdvURUHGTbgQZdZ7zyPGun/XJUO27vg9X0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=U0vznozK; arc=fail smtp.client-ip=40.107.74.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="U0vznozK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W5mLtACMnMx6Jn87GcIaVgEaewGCUqyhU8ICUngm8/mF8Op6rzXj/qFYlc4b3hEaqzJZe45otRHRWL9ZfYxuKSDSchP4yxZkj7WihQy005ADe5KrORXLgh4TwoF3GMaXe5exRHkTleqBgr4YWWY+Aci4Xw/9WJfkHf3nMbz54gw1VOth0UtTKT3JeC7YofXPVQ1VIhhA/c3r7YibPQ33pVCokzIqzjDE8o3lZzXX3hFmdxje5kcl7QOYWEmDJivkM33W/V7q11d9dy43ksEsYrHDbTAjsRXbnZcNBN0xJzKoPdLMdjel69YR1g+7gnPd+mSnDVsgMqGWIsdVRgPqEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2EYW8w5SXZTB3bARwZgWSqninp2qpdgmV8MoBWSeRgQ=;
 b=sl3nUnXitItAWxDFm5VFi4U9d1rCEdIu7/JSk2vlnCswYjXTWYSAKB1OoafnXgPbLGVfoHzWcGSv4ntQ5z7b/l+O74uVy30aL9gkmWwBruxMT3TWH2oAwy0M3omlR8tjmWMHI8e4A9DVqrg/NyKgWWn81aJRg7ZBpIdlaP/pqeWkq4QYILZQjCXqw/q0UBHQjhtYgBEa+MtR6PTsrsClYDA+Wui2TC8pP3mesmmvBCQKqIHO3dAbfaYW1rjKiC2VytjI4nKe1EuZrSq4QJW6dBEfcD5/o7IgI5nce5R8ZfXvLt+6aa3c8dhAGz8FvQ/zhd2SSR4GrGXOmvK5f/Qj4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2EYW8w5SXZTB3bARwZgWSqninp2qpdgmV8MoBWSeRgQ=;
 b=U0vznozKpSLieo7VWjpQqAD7jLdgkLklFXLQ1G4OnJzQMpltpRKunAgq5vrgKuZ9ILJJ05gxgL15TD0YrnTqJcsrdiiZqAPKMJJHFkBM9yb8BCAixBo2g4hs9GsxnE95BdZUdGpGOaVpzr8U3xDieTIt14dBzG5xGE6GI0yF1Fk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS9PR01MB15231.jpnprd01.prod.outlook.com
 (2603:1096:604:3b7::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.22; Tue, 10 Jun
 2025 04:22:05 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%6]) with mapi id 15.20.8813.024; Tue, 10 Jun 2025
 04:22:05 +0000
Message-ID: <87ikl46xar.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>,	Jaroslav Kysela <perex@perex.cz>,
	=?ISO-8859-2?Q?=22Martin_Povi=B9er=22?= <povik+lin@cutebit.org>,	Claudiu
 Beznea <claudiu.beznea@tuxon.dev>,	Andrei Simion
 <andrei.simion@microchip.com>,	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,	Cezary Rojewski
 <cezary.rojewski@intel.com>,	Peter Ujfalusi
 <peter.ujfalusi@linux.intel.com>,	Bard Liao
 <yung-chuan.liao@linux.intel.com>,	Ranjani Sridharan
 <ranjani.sridharan@linux.intel.com>,	Kai Vehmanen
 <kai.vehmanen@linux.intel.com>,	Pierre-Louis Bossart
 <pierre-louis.bossart@linux.dev>,	Paul Cercueil <paul@crapouillou.net>,
	Shawn Guo <shawnguo@kernel.org>,	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,	Fabio Estevam
 <festevam@gmail.com>,	Daniel Mack <daniel@zonque.org>,	Haojian Zhuang
 <haojian.zhuang@gmail.com>,	Robert Jarzmik <robert.jarzmik@free.fr>,	Heiko
 Stuebner <heiko@sntech.de>,	Daniel Baluta <daniel.baluta@nxp.com>,	Orson
 Zhai <orsonzhai@gmail.com>,	Baolin Wang <baolin.wang@linux.alibaba.com>,
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
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,	Mario
 Limonciello <mario.limonciello@amd.com>,	Yu-Chun Lin
 <eleanor15x@gmail.com>,	Vijendar Mukunda <Vijendar.Mukunda@amd.com>,	Nikita
 Shubin <nikita.shubin@maquefel.me>,	Arnd Bergmann <arnd@arndb.de>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,	Vinod Koul
 <vkoul@kernel.org>,	Shengjiu Wang <shengjiu.wang@nxp.com>,	Piotr
 Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,	Sudeep Holla
 <sudeep.holla@arm.com>,	Elinor Montmasson
 <elinor.montmasson@savoirfairelinux.com>,	Binbin Zhou
 <zhoubinbin@loongson.cn>,	Keguang Zhang <keguang.zhang@gmail.com>,
	Alexandre Mergnat <amergnat@baylibre.com>,	=?ISO-8859-1?Q?=22N=EDcolas_F?=
 =?ISO-8859-1?Q?=2E_R=2E_A=2E_Prado=22?= <nfraprado@collabora.com>,	Geert
 Uytterhoeven <geert+renesas@glider.be>,	Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>,	Sameer Pujar <spujar@nvidia.com>
Cc: linux-sound@vger.kernel.org
Subject: [PATCH 20/37] ASoC: sunxi: Standardize ASoC menu
In-Reply-To: <8734c8bf3l.wl-kuninori.morimoto.gx@renesas.com>
References: <8734c8bf3l.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 10 Jun 2025 04:22:05 +0000
X-ClientProxiedBy: TYCP286CA0176.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c6::8) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS9PR01MB15231:EE_
X-MS-Office365-Filtering-Correlation-Id: 22203cb7-d594-4d52-33e6-08dda7d65b6a
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|1800799024|366016|921020|38350700014|41080700001;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?LJBvU9RnY/TU2qzvaNu8H9d/avPXlRUfiSi0izsjOCzgiwAAFGsspjXH0pI/?=
 =?us-ascii?Q?fB3FVsR4TZw57GIYkU+xuN0m9Q1JRv0K/07GylqPdkEyxW0Pd37Zjm43/dQM?=
 =?us-ascii?Q?eHPTUlYWj8FdqBGy9+84ia1IzJGkZmOC+yMiEXhsO2fASYGH3YvBJbjXKVII?=
 =?us-ascii?Q?A7TfG18J9gTAtnvl3QXaKC4Jwk6vFQi1ECWNLPgUCdvu+QFbOOUsgqPRjRpq?=
 =?us-ascii?Q?RO76Stj5UYWQ064yARFBbXfZZ1IVdC/Ox9u+vyK02t1BHP3J7nbG0t9SoLa0?=
 =?us-ascii?Q?krAeB389Hf/E1J7veNXyXsnw3GU/Rafd9u/nTTTjJuMWxM0nfNpVgewUvv0G?=
 =?us-ascii?Q?g1F1kkuA0uBKJz2rvCdh8iFhomloDmKVDwxBX0Lk0/IYcz5maodkg0dLHmgd?=
 =?us-ascii?Q?2tPyWdm686IGOXdnE27+uIAs2ITZsVchzCuzaJhe7o431/PLUUmp05xpMbUC?=
 =?us-ascii?Q?NPA0QZUyD2wRAC4AI/FB2pUAmgIiyUTLoulUDkpRZ/BXpJ5xzcchbwwV2Zz+?=
 =?us-ascii?Q?xnFXW6BbCcvxM/YXqKbWIssdxX30Yk7zWDyfyX02pObOgVQN1q+sfUx/ASlx?=
 =?us-ascii?Q?X/4HB6tdHuT2B1c8QLc0C7mIwNRQLWsPt0q6SB0LyvDBAYPq/fZawfUOLU6Z?=
 =?us-ascii?Q?3Mm3jEzdnAfm963j1C16inZoxLHWFTayhbxRcyUou1pjT65l05xwsX+AEkjP?=
 =?us-ascii?Q?iViM7TjP2b1K5pArioSTEAsaEURnnTHuEppHjDF7VGTX5XlG32gkxGZjPYyq?=
 =?us-ascii?Q?EnANOOkgp5h5s21iqw7R16pMyuawhofdUzOVTF6n7fu+5zTKlNRGYBoX5fvl?=
 =?us-ascii?Q?sIV9E4JvAnGAwYiUK0Phc/tmaZPgtxJVYoHNrQUhqiGKw/+4tOMpCjqD/Rqn?=
 =?us-ascii?Q?08VRDOi7x+k9jcw/+WPeKulP5T8T8AakCYroEIsFRuVuDpeLyvbs3sM5eM/q?=
 =?us-ascii?Q?yjH/kyRAIC6u8HVS6JGXb02j3zj0eDtNyDsP5UVIuFvxNZblGpBeoVL5vzZA?=
 =?us-ascii?Q?KgHfS2WEhDNsYPGkg2Dh0Xg4sOr/Xwv89R1v4fQAGBGf8oOdXVwDFlO3SB35?=
 =?us-ascii?Q?PNkiYYHBARdgBY857sGZn+wlmSXJ/Dh1bqc12zqsK/ecqTGpYE38T+WlkWav?=
 =?us-ascii?Q?16Nt6eOQ61wusyghZJ9kOVDRm9IYFFsp9d1AcRi6Lz2dtbCnHF+agHFdmoUS?=
 =?us-ascii?Q?0iogTeEsCo1QoMgBw8SL+KmTs11yRIZh9kC7IBA7xo6LmeKVCxyzPN0BK6gQ?=
 =?us-ascii?Q?pqep4ao5jtufdfW0HNYQ5pMEVZlJKR3vCcmTwLsrQMX6NgQLhkHsn6MnAJjO?=
 =?us-ascii?Q?qv59XuNxdImsrlnlHoRwKvkU3GR9to/NlJohxVEOwNa3r+tQb6jroFUOxAaG?=
 =?us-ascii?Q?D+F3GSXB2keoTOvCS0oxEfmKweFu2NWuQliR+/HMNDmK088vArN1KDMMvYVh?=
 =?us-ascii?Q?o9EJl9KIKv94aIdVppXIOgjqF2JyrpMfQ/RQu2maK/NLhEIJ/UdF6lEZWmjC?=
 =?us-ascii?Q?lId5sMNNrBPSriYSXht1XHmq2NSuRmvgVuvdPk5iYBKc7tMFEad6yxH57Q?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(1800799024)(366016)(921020)(38350700014)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?htld12yhwzZRNTPIUbq/v23/6mp9mNNZYVBnqDjlooLwJHFRM1zH0S6aqECk?=
 =?us-ascii?Q?TU31Cp/3ez//eiMeqgqGgmsYdj5CeSDvp3FacOeVqDGBvjndHYWbUEpqauVc?=
 =?us-ascii?Q?x7XBTnoDnrTQ7S28NndYnvsJXDlCg0y5WqOmXX3/8QdztSjNtogGZGM3Hefa?=
 =?us-ascii?Q?UbItoo2fSA3lFOwd4zOjZsz5fp88m8UNGg1iqgCWqVgWhqmlD/qtYbLbsRsH?=
 =?us-ascii?Q?/P1SOsiRZyuS8ke1vG6qHlErl3gTMJmBZkAVHNuOCMYpUm1FRlF+q0SmlLBH?=
 =?us-ascii?Q?Lz7c23LZUSDYGVrI/6GtjPMTTBwSvzcPv0ULhW/74ym2ceZ4za5J2yB/syEe?=
 =?us-ascii?Q?zTVjWW54YCoUOuDcKtjvB7+ZDefse/sze2mAhK3XqsevH+iBmnqzWiUcSBnA?=
 =?us-ascii?Q?3wsK2UYnrMDRwQDd7DQW6zO1nGL9vB0nAVCcY09OwZt9IpAEljUkhj+0y61p?=
 =?us-ascii?Q?8R3L8ohH/4R6Jw5b7I4ZfTESMC+JhpkC34hbtxuCU0NEisYW4LP7iGklMnJR?=
 =?us-ascii?Q?zMBsULP95EOIAT4oR83ekvSm+3xguIdMX02E6zpOyYIiYzd6SuWgRkAgaQ7a?=
 =?us-ascii?Q?2rk/v+VTgQijYUO/k2/PJlYsb+FnjiOfPEB0MSOzQpSOmlgiWk/x8lkFCI3a?=
 =?us-ascii?Q?cOO78iaPCdMIaGaWjX2+NZ/uL2EoZT7+GmnWWFNTqrXENhQ3mnFzpTgOjIXJ?=
 =?us-ascii?Q?tHbSbJbJMNJhvxIPWMRD04SiZpN34IE1NCFkDTBMBbwXFe+hq37jk2DqM/+u?=
 =?us-ascii?Q?3VYQhvQ6MwfByqZ9StuJchlJXOgf07QxvrtFRhbXd5bygqnR4YC+b+c+AhIM?=
 =?us-ascii?Q?p7DZ7eZDZrYM4rzOGv+4zc8Rw64cVPLH2RoIqSANSmR75ObK9bkZwZPJ5pUr?=
 =?us-ascii?Q?wwJAQGqD1xT66/b+d+vatAeOWOYlTWB1R6lzhXJ7p3ODJb/+1OYwlHcSYAOi?=
 =?us-ascii?Q?PVNS5sWWIBgibN4L+gSOPyMJbkrj7p21dq/U+wv6oLjsp+KqyeeVjZAroCQe?=
 =?us-ascii?Q?keUMWzSGMCYvdNoBcQuKaizDPWHOK67feXQIP5NN81m3lrNJHNwNFCopk9XB?=
 =?us-ascii?Q?0q47JoLY21sQUeuJmheRWat7laffj6K9FE6w4m5cJ3ZMXir57Sxt0kOM+l37?=
 =?us-ascii?Q?BeVZq+Fzem8vs8V0SWQZ3X4zcBEq45OYl4zvOQOA7glRQTuC9G2K83DEXqva?=
 =?us-ascii?Q?e+a5CGN4TmQe+7zKmIgDBPtwxZbd4SJBg20bP5jiyHwp8D90W7KMwHMO6QWu?=
 =?us-ascii?Q?TaZ444rdITQhbGM5VncA1+HH51qxyJaSgpfSS8RY8T1pj8c2B2xNhhgW1rsC?=
 =?us-ascii?Q?VxPI5518nYcrMTKOxHxcVIWEaZ28gQs3xLgkcy6GtCo/gcO5AT49MQPAiM1A?=
 =?us-ascii?Q?H8NQSBFnLO3EgIB9b+rghjoLbDGUqbIxAuloBCx1S3aUZivsUQQFWyP0Fn3S?=
 =?us-ascii?Q?sil/UiG69UirZGOsrOVh4ebBktalMEbocnSloSEbmimZfr5NExNbGJTh6ByM?=
 =?us-ascii?Q?Uq+2VQKV8IHvyb2qNeJuxoY4ipNDELdTMQrFqVX/vubP8p++6MpDwTFjg1ed?=
 =?us-ascii?Q?zOgh1bCkGNToNGJIYUG9pKdU9a5I9QhAGWRVhJNMSjIvr/QvDIJ6KC4D/80Y?=
 =?us-ascii?Q?tw+RtUvymvlfQ+1ozGlrIWU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22203cb7-d594-4d52-33e6-08dda7d65b6a
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2025 04:22:05.6324
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LVznrT9MCV9DcbITIWsZNuhyqRsaP47CRBNzgMvG+VxYooTZOzTEX3jqoOj8hBRMm+fT21mLT+zy/859wsaYD6CuN4taifQxcAZFHR/mtASZkiWfgdmFMMd6dM1dtAcd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB15231

Current Kconfig menu at [ALSA for SoC audio support] has no rules.
So, some venders are using menu style, some venders are listed each drivers
on top page, etc. It is difficult to find target vender and/or drivers
because it is very random.

Let's standardize ASoC menu

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/sunxi/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sunxi/Kconfig b/sound/soc/sunxi/Kconfig
index 1f18f016acbb8..00ca48ebd7b9b 100644
--- a/sound/soc/sunxi/Kconfig
+++ b/sound/soc/sunxi/Kconfig
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
-menu "Allwinner SoC Audio support"
+menu "ASoC support for Allwinner"
 	depends on ARCH_SUNXI || COMPILE_TEST
 
 config SND_SUN4I_CODEC
-- 
2.43.0

