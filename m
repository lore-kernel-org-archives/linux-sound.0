Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011031.outbound.protection.outlook.com [40.107.74.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B60A14B950
	for <linux-sound@vger.kernel.org>; Thu, 12 Jun 2025 01:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749692645; cv=fail; b=tpkwyAnLahJRb0zdaafqCAXE85jdZ3Ni9bkyf2yOkAAucj4FzTZEder7iRFpWXjQRCbMh50e4UIgelWx+ECK4IgaaINmxRDRe+BIBmRm/xrrGOm4tL/8fFXin961ZuH+gSvyVSUDlcfAUjWPvrghFt2JiL2bPjUNBhstmN1BiQY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749692645; c=relaxed/simple;
	bh=cMUCkftbH9fMZFQs03sEgMhB4RarQNU2WV3pW80cK9g=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=b/FrPqpQ4WBDoU/Hmx13RfvCDPsHBzRNrvohsZy6XP7h5Q/RwgbVma+Nyu2fAAKpErCZChX9Fb58EhrAHsFE5kLoI4SYmIPQn1z0+0fPaG9/RibNuE6XFIYs6GMWUhmltCouIjKH61qNuZwxdqzzmIHENaf4hW1ds7TXYu5pN1Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=MC6IWr5m; arc=fail smtp.client-ip=40.107.74.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="MC6IWr5m"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qe4EjH4Y1/eqYvHtni6zZTzI1WdWGamMEjxS/XHKk9pb4j8pDpp0t9QYnP9VLuvhtPbDMUFzK4/5FdDSC0r4T5W7yroBAES/cEBSSfwdZmfJ1vEALDmiAY2MajECht2r/WfD6eExZx1nr9Gstdnr2X6jOUXHwdFAah9cITSCvTN8KUEwBD5vaWj+LFHbv5RVPwK9C26i5H3XHVwby2PjFqehpw2xW24PpV3sGTwllw+w+NRqOlsUmMo/3RQAN/uajY9Q54KwzJ7tNyky6UZqR2CkuckvGBVOi1fexHFPCbESG50dmrgDHUpZn+EWJS7jNTdaISzMxARAShc2W2cqjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iRZmOA4u0v6DbfnDnKsFq911+F8n0SYK9ENPyYuwbI4=;
 b=JhOdyUwQ+agBOcm1lTPIrBjEgok0/VuAzdUSHAtRvUyJCSsUpXMzguu1OQCZrwzVwUjTCWZ9VKYI5pZoWUD56RZ/1bo1SwGo8yy4fWJFifp6sYWBap2G6J2Eaj/mgq8BKgAO+d0bA9kYYYtBKv4wNo3pSIvdEaMrq0OdpBqfpdD6Obv0fVRn8pUACZfSt4zzpEGGecnEkXneWF2C0NbW5kQLuU6tA+BS+M8FOZuaJJDGfL3ZqmiaXuGaV155VYlcf1WSUx9JXz90HRnb+dyM4QiuhKgtZjtO1YkZaC6eH0MqZXozIwK0HDVZ83wVKLbUvn+wlr0EgPhRKfCPi/FvMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iRZmOA4u0v6DbfnDnKsFq911+F8n0SYK9ENPyYuwbI4=;
 b=MC6IWr5m/VfXmZlSYaHLLiI7/H0/OvrpCJnUMsDTbM0gvPcdEWk/6ZexEqxj4yD7UtB0k5Zyd8ysmBKygtd7qomNzjdWs8ecQGZyZtvPsErpMdLdoh3WBPDcjrqbZUZ9SLfy1paU3je42Xh+mnuO4Y8ICP7O7MOK3KPEyW21aLM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY3PR01MB9824.jpnprd01.prod.outlook.com
 (2603:1096:400:223::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.30; Thu, 12 Jun
 2025 01:44:01 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8835.019; Thu, 12 Jun 2025
 01:44:01 +0000
Message-ID: <8734c5zqcg.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 27/39] ASoC: jz4740: Standardize ASoC menu
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
Date: Thu, 12 Jun 2025 01:44:00 +0000
X-ClientProxiedBy: TYAPR01CA0012.jpnprd01.prod.outlook.com (2603:1096:404::24)
 To TYCPR01MB10914.jpnprd01.prod.outlook.com (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY3PR01MB9824:EE_
X-MS-Office365-Filtering-Correlation-Id: a29c08bd-96ae-4180-7934-08dda9529ae9
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|52116014|376014|1800799024|921020|38350700014|41080700001;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?N0cf4Y152ZBNnVFTGQsNh46C0vqXuYzvGpV+3zC2QW+5CiQFftVmxu0+fOpS?=
 =?us-ascii?Q?1Vdl4lAB0w/h/QjkA4j8XTNACfDF2c1PVEjM1uzPmGAsby1dIji/U/qeJMGy?=
 =?us-ascii?Q?W+bl4MZF03ecWZGow6c18VSAG0SaUC7SjcBpWw9ZXmt+PEmh5b7MU2oXKfjm?=
 =?us-ascii?Q?1rSdtR/Xb8BSYuAT9vy5uEJT/TEZUhVefL0OgQGUS/mgkZyUfDdp+fqljXVi?=
 =?us-ascii?Q?Gappj+jJbdHVAFtvecj7Lbe9V9+G3V8rvWPGWw5rG2yU8ET0v9+kQed5uiKu?=
 =?us-ascii?Q?gubCxpdC15hDpydCVGTbBKmjGDcNGSJdoddTgQKle8K1R7C7/KmB6Lv3LgM+?=
 =?us-ascii?Q?ak52+onfjPnNPhSW/BoCy8JNJiZ77QVuGS5ZC1NF+ATEZVIH5pTO/Kv5irR2?=
 =?us-ascii?Q?1fd1C5kw8yiNzx+Rkca6M3IxBMpVbH18slcvGbVe+3J0kF8PrKAC2mZyw4ag?=
 =?us-ascii?Q?zVtSY9vNdRQEbptXf2KgSAon056THKZSIiL3c5VTLfgF9APoG1LW/yLmV1W3?=
 =?us-ascii?Q?5Z1JpPQRv+UjyPmBAb7litsuvquEv4/xUMqjtUTSBdJ6h+7yUr8zrSYbG/BY?=
 =?us-ascii?Q?SVdzWiABYww2KIvkV/PWBSzVIARqHJHWCyCg1xW+T44OAIOC+5+gMrAq3xxj?=
 =?us-ascii?Q?+cVBo6g3oPc+oK97+5l9Q3DMEpOqDDA/apUPpD47vrErOB1VUXTpuCAbdkmS?=
 =?us-ascii?Q?4Tqo5R68x1DPrJMIYeTDYnMtdsKm+nuhh3TSt2Flfh1iHvaGV8iOBUPcY5uV?=
 =?us-ascii?Q?dlf9BFwgor9nquXXcSqk7l53wPkCmbZLNvBh93fLsuPutqJCg0oUIAlhcPHf?=
 =?us-ascii?Q?TSDSXd5jy2uUmhcI1NoD14ticK89ci2p4KrhbK/0lt2xRUXypcfqDShCa25m?=
 =?us-ascii?Q?WY1XSpi7pK5/YR2AsU6FRYSLMysnFzAhh1m0fhcXQHF+rRHTn5petQlEguPk?=
 =?us-ascii?Q?g70fGCEcNdLIMMDPORF1zm9VYaLyvmOqHOGG4MNoluJZC4izpNvIp0YPcQe8?=
 =?us-ascii?Q?voeEZb+G2kiI/3js5X20Up36GlRSzBNtyL5ZjM1LTaupdwAsDyn3V/E0cyMn?=
 =?us-ascii?Q?xBF3BF0X61ueeFOiWyaLGumVsi2FBbBV6CkCbebmUVw25RtBUwuNHa513fE2?=
 =?us-ascii?Q?zOXrlNNUJNRsjnUTQQKYJ3/0rpil3qjWKsvHJS+yGU1jIDShMNFvMXaUBrYv?=
 =?us-ascii?Q?KV5Udc42NiMkZePlioRn78LiWxlIkje5AoUUXVrWNhdJAf1d5hxwnKQHMi8U?=
 =?us-ascii?Q?/DO3j+mA0dY8OfACgeGt2Jsks0B92Ku+nCcbRxzyHAmJcWL3NHt+kVQXQdza?=
 =?us-ascii?Q?THYaNN3k9NVBodSII6sLjdyMfW7j+mrrGCCYmWO47nvx/mxUoZ5s3RD5ci5l?=
 =?us-ascii?Q?L6BaWVPnFOIh7JAlTU2kJTx7ika54heZeQQFnnGRK2lW9NvC++zH23QXW9Le?=
 =?us-ascii?Q?I2Xx6n85lza/WSWqxS/hXUrmhyWGIl5jlkf2hGAxdXNT5Cs3uURq9LDqOXo6?=
 =?us-ascii?Q?/CgOC3O6OBV5dJ02UnmL6BDm4TanipA4V/yKTxE0H4oQa5oIMXw3H+fsRQ?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(52116014)(376014)(1800799024)(921020)(38350700014)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DbdHEf7h2y/kPuPKoWyKw7rXmamTFH/EXV4jsPjeaM520CCMLu/U0pme2K9D?=
 =?us-ascii?Q?D30gJgOngds0SMkvCWDx/etCT33egx5zXRPhOzpD1MSDLNglQ9kyIVHP6Dmr?=
 =?us-ascii?Q?1KODct5tfTUYBbHeByX3xOpcuoRxHPtC/8w5+2eidlG7MQKhDGhSEtEvBNMF?=
 =?us-ascii?Q?55D/f6VQI4JATOCq3IiedyVz+gfyBAbVFm0JJwQlzgKKKlDnwFvaP3p6p8HP?=
 =?us-ascii?Q?JkOdyCS4Gp085wBlLTikOTSNT8o+05gB77ijbFsJPVfqPEf9mFleBmsuqZ6X?=
 =?us-ascii?Q?1uIxsjOQUryHk6TjpiLY/xOYoELem0aV+292sUeyw9fMCsjduCo1NsziDKId?=
 =?us-ascii?Q?nhDqP0S/lA4+sNE1WynQSh0ZeGfWEryf4ysOQYEM9r3Sg1+GGFybHkKa9gVy?=
 =?us-ascii?Q?q0B0TRTjeWmuqNPU1oPzFqS3ssCVpVeoy6MKOCejPp4+Hab+NNVuDfFi5gVo?=
 =?us-ascii?Q?vA5xKgbrXbrfQQ8GDxLpJ1IxrhC26jAgnnRw9/0oWppjtVDiSLfUUtEjOAKz?=
 =?us-ascii?Q?kX3cyxHP2yMnCzuPNEzFJyULsaXqP/E7EecVhXPCqWwrO78TRLs5VB1pNvFj?=
 =?us-ascii?Q?FYAcgizH93pd8qA1j6cAeQRd/0sCQYPbUw0Mjix6amVZAPgXRmAQfIDyy09I?=
 =?us-ascii?Q?ctFuph5F8QJUDC63b7S7sKSlJBZxCGViFaCynKzgBBEyunCm7dV6i/WecehO?=
 =?us-ascii?Q?3MoX/UCoL3zOhqSwRjhzBg5f4LiDtUIKBwBm4KpA7qu15wdC7VbZNFVXDrzj?=
 =?us-ascii?Q?06t8HXbdAYdWnjem/I4vN+0pxyKWeNp4Nq4UNKFkCQ25r/uwVIadTucF7kWT?=
 =?us-ascii?Q?/jZQZ+yFg4IaUrV4RVw6Is0BOjgxNhqG1yMbVOYK9pcvbY8JpcrFmQW263wf?=
 =?us-ascii?Q?bPLqzDCpDWegPy14OHmGgSNjYrAQkb8xqPtyOiq3AVN/T9uyN+3ctgUFONxB?=
 =?us-ascii?Q?Ja0Lowbty8JgwrGctq3vGqWzibMjTQb8nEhpRNklQIiyB2GOHzNAMJa9BnWq?=
 =?us-ascii?Q?yYrutsbxA7jXe3ncR6xA0CwQYaTKBPDYSlXkB7dZqu9Pb4IyzozNtbTqfU7a?=
 =?us-ascii?Q?D0vv+ATu0hPC+XILAfntL0QgrEVLlUMiLtIou2eceRzmh8baForO77pz0AD6?=
 =?us-ascii?Q?NxBJchk0JpzuSVl4A+OVkJZnzR2+XNWFsypc6FCPI2LaTgzrLyuWJu/9XT40?=
 =?us-ascii?Q?F3XphZjwHUW0cV9pZHwqTnnrhpXZbF2fJuujUrzOp7FFAtDSJpmYCmf4Wong?=
 =?us-ascii?Q?yb+DUSNHEvBr9r4Tvbr7jzHh4eIDlwmlIyQjDicQQiU4sUoNlYMrmQe3xEfP?=
 =?us-ascii?Q?NDZel1d/R8f4y5VwtITXcZu7Y6BeQ6ES1JC2joRk/BJFVrBpAJjlrfaicHlx?=
 =?us-ascii?Q?Quez6rw7g0n+h3PBNBpcMqI5zCX5jlH8g+kqF5K0VBpv47JY4uYQdk4QTr6G?=
 =?us-ascii?Q?Tmk99b6xsGpJ6Qf5aX8ApbRJvV80we3L7hDQQP2lHPRgVVfcgUhkq/FhpLbf?=
 =?us-ascii?Q?JsZH2PqxHM/xIMT/ktXLlZ1bWSxC+fGp9YMiQzYjL7CU485oGOjdcw9KbYcz?=
 =?us-ascii?Q?jrnjk4vL96NBMeTKk2lusjMeLR+cGM+SlOJ8MuANdFjDxRm79QaI0WbMq0x1?=
 =?us-ascii?Q?jiTuBBVZRK86YH2ObU49Hig=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a29c08bd-96ae-4180-7934-08dda9529ae9
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 01:44:00.9418
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VCUnCx6NRVvLEUI1C+hPkDrEfBmahBVJUS2rwbZ3XvBZiRV7pM2L23Qe2JtFAoFfcymbMRs/9B7coBFY1xJJEH6HWppYh8fa8seMcNvg8/si53wScDP5vCacozq73vjl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB9824

Current Kconfig menu at [ALSA for SoC audio support] has no rules.
So, some venders are using menu style, some venders are listed each drivers
on top page, etc. It is difficult to find target vender and/or drivers
because it is very random.

Let's standardize ASoC menu

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/jz4740/Kconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/jz4740/Kconfig b/sound/soc/jz4740/Kconfig
index dd3b4507fbe6d..f3ff3fb492392 100644
--- a/sound/soc/jz4740/Kconfig
+++ b/sound/soc/jz4740/Kconfig
@@ -1,4 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
+menu "JZ4740"
+
 config SND_JZ4740_SOC_I2S
 	tristate "SoC Audio (I2S protocol) for Ingenic JZ4740 SoC"
 	depends on MIPS || COMPILE_TEST
@@ -8,3 +10,5 @@ config SND_JZ4740_SOC_I2S
 	help
 	  Say Y if you want to use I2S protocol and I2S codec on Ingenic JZ4740
 	  based boards.
+
+endmenu
-- 
2.43.0

