Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010040.outbound.protection.outlook.com [52.101.229.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D789472637
	for <linux-sound@vger.kernel.org>; Thu, 12 Jun 2025 01:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749692587; cv=fail; b=QxN0jlUngKY/dFujZ+KIjytdGZb1Aqt4kMSHlJQLMygUiwz5G+E7LpvidBN3AS/0I5ftVn5greFNYNTXepAAigEyiDbSEhXbqFiVwDxKT3PLHtGJY1GGWk5E2bDH4yCwlBQmaJKwcDaKoThv89Ikd98AS9/i/oBw6N9b7NwleX8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749692587; c=relaxed/simple;
	bh=VmHL5ETxE+qRObRcJ5AOAVXrO1n1cDVFnyHuzMu4lQs=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=SOA5dFKtbnYSAtSYM3lj+tJYvHlcU7IL+ksZR5KFMVj2/78/VFcBKZzLesw14K+MzFsRlf8MQgsDbnwa9eMNGHQ02J5/amlTMrxmF8GJAoLfkY15Gr09gEKKsn/ODBOrpEwIxWnRnE/Oj9rCcC/6deSHpTx8EbD76srKllfXkYc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=cmwOTnrf; arc=fail smtp.client-ip=52.101.229.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="cmwOTnrf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YqXdGrqM6lrRhnPXHntzaBhMFotE7me5vy9eC7VMLIGkXCfjz7evR2PVHpYeBBAfUPqmXB/F/7E7zi4l7xrQq6QQiHqUbxYmSkmjYw5Azfrqb92E2e/djc9efkZCy9tW/wVthx2zldDVDWee7RLqbqFHY9CNPDpIzTXr+m+ywd3l0QzgdF49QDo8ggmxkcdI0HVoTvXFk+PxOOvvfAfxhEKqBWffqpjZ/fy12oCKMnUC/iHM0DwvybW/K2EesywCCNiFAliZEPlysah0smOJocTMW2t6URadyombvsNq0Q2XTBIVerjJcKKogZbDJd7X9LBcftOWTTxV2xZKPweCKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a2tlW5yWm411XPvLI0ybQ62XsjGDqEu73K/HZ5Bpe5M=;
 b=RMeEIAGbczfX7h6JJ+W6uuRg9j++rK9nEGxcVF3t0OdqdVZFxqAAU5EaYl8+BBwuCDXuwEI8mI3U4DoTdsbz+zA7BBG28q1yKYUNV2EyqqT2onbu/lxiL1A2D2/zX2ohYKoZ0iLJgwUQP+PKFryDagl3m3G9oyhGY/EbJHCy6y10qEmPTa/DKzAMgnlzj6SLQtoPDjUSGCceW1c2gWPzhNKmJQELux3yVo5HpeeYjBxuq1ZUgm67DtiRp9wXWL5TNs0IC6PtMqYnK5AkzEURhTqoQ93sUIqB9z9qLTSFsEn5cQJ3OOrqSJEqtF2SWUsykX6n1gvJMWgayTOe4jVYDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a2tlW5yWm411XPvLI0ybQ62XsjGDqEu73K/HZ5Bpe5M=;
 b=cmwOTnrf8CPIFQFrno8dLBfAFXqfcFBgFHIXRimi7B8fAngqf/lnuOZSZ49iqGl1+Nqp/1ygFkm106ZZeIuec2aOEQXGUrjZPPTu+dm2JlNc0UfXVKiqVa+fiVc9gYXlcnoPPYRtFm2kFzFMKs+kHuIYGzDJKG/mLAbuz8duYiA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYRPR01MB15122.jpnprd01.prod.outlook.com
 (2603:1096:405:227::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Thu, 12 Jun
 2025 01:43:03 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8835.019; Thu, 12 Jun 2025
 01:43:03 +0000
Message-ID: <87jz5hzqe1.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 15/39] ASoC: sprd: Standardize ASoC menu
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
Date: Thu, 12 Jun 2025 01:43:02 +0000
X-ClientProxiedBy: TYCP301CA0041.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:380::7) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYRPR01MB15122:EE_
X-MS-Office365-Filtering-Correlation-Id: f668377c-149c-4825-46bf-08dda9527880
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|7416014|38350700014|921020|41080700001;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?v9GrvVBvuHA8ZxnHXIEVlRW0xHy42BdGrPJLmf0K8RRaeIznkXySZcAY3omn?=
 =?us-ascii?Q?ni00zO4R3NQgp0YjqURH5lf4HumS0tSwq3lAs2XkfrWc3ITYVMgwk7531KgC?=
 =?us-ascii?Q?/50fbh6kVznbO9EGaFkAtaEZx8YzaUG/+OuPeZcNbGwqBFoZwqpOqrC1oL6P?=
 =?us-ascii?Q?dF2GeH7BSXZw+RYc+Q8Fnrx3IxmRZVWOymCq8FqO5NhRGujMDjQTfuR0HscU?=
 =?us-ascii?Q?1jmMBVX9p4A/F4HCEb+QwCagCM40HsQkuebGEzHooFsnpNNbwVdMPkWtfYet?=
 =?us-ascii?Q?LnUrmK8CG96H0NQir9ZOzUMY+6OsoWeAFkrWdLsJVuDpVvqFUM907nFz5VhF?=
 =?us-ascii?Q?WQu24RxTx+dKogNWzSLEJU+1VIK9d5qPXRWWDun3NiRwPZxVD+rYGuJtEUpZ?=
 =?us-ascii?Q?2i23Zs4JzG8Wf1g6OfpOdQTIMPraCZkpPKJVofkLY5KsV6I595ocL1/PqnWp?=
 =?us-ascii?Q?OLSVpj06QWvqptIrTbZnB3Mdy5TuNax9iIyfTNXF74o/BqIqnr4+XZoU2YH2?=
 =?us-ascii?Q?Muki+hbKlLm5/OPktq93QtgP7DM/DJiO/a++VhlWDXuWsB0PstgPUp3xNsHK?=
 =?us-ascii?Q?wKNHDRlqp1hJmLTg9lsbD8HLE9bnxvLXLiIvJ60Q5FGUWDSvGk1c5qp8dQNh?=
 =?us-ascii?Q?DPclLgGMsh36bmwrythfaoWEZbRPl6akVQ/0g/Js+/vFCFBEdLGAlLu2xQLW?=
 =?us-ascii?Q?NktLeTfh6K0hya3hQu6AfzoHWPShU0TKyDyIwZVA6E4Tl+Qm3ck6JQmLaEE9?=
 =?us-ascii?Q?yQcCOzGJr1leUDoXldSLBqp4MVJt2NUpEmXWCre7cdwtNHpLxgQdsmulag21?=
 =?us-ascii?Q?fvjLTLSLMAgrLavpoi4yKKRCLnYgaibPFG0LsK7/TpWh8PZypqz8/RR6746i?=
 =?us-ascii?Q?ieX61F2Lvij/cLJ5QfHaFzuk9YfI7o27aLQFSjPWH8tCYZO6snSN5M3xMWvY?=
 =?us-ascii?Q?MkmPqGRl/atJHWnMkCUpmq8oZXmaQcO07rR8JBaAv+UjcrGjJeRlMQijX1/u?=
 =?us-ascii?Q?DzAumcQfciupNHZ8sFJ+XFXksrLZMJlv/6sZI8VrnlKM8+LsQYI+ACkfUD41?=
 =?us-ascii?Q?9zoDURSHnBRgR11r0pqbJDiFREY/LY14RjlIztkbp8W6NEFMIGDZnr5Mxgng?=
 =?us-ascii?Q?tu2FuzOTVK/v1CIF1i+dgBL64mqVjvDVPIi8jY1SH3phg/qUCA0w/5YQl40s?=
 =?us-ascii?Q?Rl0h+jyMVIp0J1ikvbZ2crwT4rCEMEXqY/o8NjFFzH+XMxidScvxP9JlqPmt?=
 =?us-ascii?Q?gQnfCDNOzZ/wLIZtrW2/FLcmW2A0n4igDbDT7ljTkhTQKKrz133ht6xelcfO?=
 =?us-ascii?Q?uMQYOtKN9OOBbqHZ8OyFDon0duHZzAZ/MHSyyWqrKMPOabCu8vwzdeqNsFqO?=
 =?us-ascii?Q?wT8cGKyeaNi8DaZd5t2saDjvqG10okIUgeiRV3ugILNf84fHDOX7tMgk8orO?=
 =?us-ascii?Q?nho2SfKFL+Ut6nQ96WSF35FEMckBHNAvFRs4HPEDu/WuAD8PLb+Yy8nJfB2/?=
 =?us-ascii?Q?uSL2V7odJaYcWYXdEJPwStj7FLpXBYD559075JSRcLpTYEK9556S77aSWQ?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(7416014)(38350700014)(921020)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?bJAo31TUFI4D679VwJSwwNIIh0YxkAhOUT6SYcBEV5bblU5ubki5nlrCG8/S?=
 =?us-ascii?Q?Vwd/Ss5WawG4D0tum7mVVIdStFIrySAVn1uoZkSke4daigAgTHLmhvstdopT?=
 =?us-ascii?Q?oBwfqUHeI72Y6wkIiJZ39yla4qSJA+GTrqy2tGhjJFhcSdB2MTFjxjL6d1OV?=
 =?us-ascii?Q?TQpmFWLR070+sK7KUuXA6HjDFIppylFA2CnUjM5mW/DUZ3Nrb1z9HBFHenTt?=
 =?us-ascii?Q?nQ0qM5i3C5ng49K5oPfzTpjgeyGal3Wtu+kI9Nad4s7z6eZ/DOrVAAg0AQEt?=
 =?us-ascii?Q?ssLD1s1GgUWoy+AfEZ79RlooO33CLZBQCh4p/lvCywkIGWwevXi/rvQVqQt5?=
 =?us-ascii?Q?YBRgz5F2z2vJ4fDTBvDubacjRGa+UF/X/v4H/y47OuVAdZlf7xiEhzwaUOrR?=
 =?us-ascii?Q?q3BYEzaA778sEvpuDQ9LyeacL0bCW1Yhq3IwlVjP/dkWpDPXiD0nGUL2h8Y+?=
 =?us-ascii?Q?wLAHEmpTjFW2pmsJyjw+qsABhtbsSjP9EajEOdX5mB9GOnVX0hvPBqvQbiGA?=
 =?us-ascii?Q?OrpR/rXE15ya8cftfQ+5VMX76egqo9xOvV2ZTVfrGRhUXtzOIvis4oR2Av+8?=
 =?us-ascii?Q?6oAdEA84QA68ugkYPiYAOR6zLoVOOMDYS30LGlPWqbxc6TR4O9zB65A/Wk3D?=
 =?us-ascii?Q?H5fT2JcL+8hhCXiMmzCGCE4FaNuxrcCJPf0kjbiiBH8K+VUZNZZBNuE1iQQP?=
 =?us-ascii?Q?wKtouArLZyH71u7Ze+De/o4iiREh3YBlO4yMaNsZj1FPctFvtzC1OkLwnSDf?=
 =?us-ascii?Q?etEj4D2TTvPFNN2q9YnOWRVBmcAy8dRHyuZ8LDWLk3j0G9M6lzpaQtn1f4gs?=
 =?us-ascii?Q?fkH08U8180c57ytPtwZPSoICJD7Y49foDR493LQVbKWJeFGDLEczCiQXT7PO?=
 =?us-ascii?Q?d7U0sqBQvNxUmQ5FMcZDNKdBwfUlwoeJJUPG02Y1kV9f8lFvTzqQUN2qo+ik?=
 =?us-ascii?Q?xBW/BwykmXMiVmtYtxmjq/rEksRNsOTJzCaNoav190+f6WGCaGb9Wv3z2RXG?=
 =?us-ascii?Q?KGTE+wDazsSo9TARI1MY18X2fFlwY2BEeTpQYr3Ar86mYJaozJfK7v8HIjZy?=
 =?us-ascii?Q?YwkHlGNgQHXa0ErMvUwNArO26/gb8eyHu6Mt6gAdx7yKdBEmB7OUJ3tSIjtn?=
 =?us-ascii?Q?tV5QtOvUSI5A8rtVgVthuIJz8dBaxaX5AnI5O7/dBqqZcT//AloedrKIQFwg?=
 =?us-ascii?Q?dMLmUhaswnZuru+D1A+FvAyHOEUBqAOZJLKmYU/1JtppeTHoKMWkxa2aZq+P?=
 =?us-ascii?Q?dwGxCM2uP3CVGmfNnJVGyA3W9L+WBvlbY3mwp4tY9y9YlZvimAf84WwNnfmA?=
 =?us-ascii?Q?k+EIjBjp1AWZl6H748WaDBj6i7jIRtzZAnmsPZQGFirS6t+bdI0ofZP5LPf3?=
 =?us-ascii?Q?ENvXZa0yL2dBn/AgczTSsiCGeizllUOTmaR5tPUMN6qqurg8RJWBbEtsVoex?=
 =?us-ascii?Q?0Cdt72iTBMkCnKZvCjuw9wYnYoV2lpXNuCz81Tzzit/nw1Q+LBagD4o9qdb6?=
 =?us-ascii?Q?cWGKiEP4xcFCyPcRvbtmXt30cm3gzLpQOif0e5qW6u39Kg5utu8dt71cQuru?=
 =?us-ascii?Q?MjSHBaVLRtbipKgqcrm324xnC7qOmspIjmJ7pXhIw3xhDIDjX3ML8rCi+KGG?=
 =?us-ascii?Q?Tewvsi0FwkSHDVp8QdNrH5I=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f668377c-149c-4825-46bf-08dda9527880
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 01:43:03.1918
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U3W7aJx8C7ubFWxym2tb1Biv6hZZljyVWjdj8MDTGwlTUB8Zic3s1RPRZglc8O5wX4Dl2wvylwla8MRR85r+QRX3BuaDkz/r+OuvvUHZhYOsfyTp9Ryx7enyW3dsX6r6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB15122

Current Kconfig menu at [ALSA for SoC audio support] has no rules.
So, some venders are using menu style, some venders are listed each drivers
on top page, etc. It is difficult to find target vender and/or drivers
because it is very random.

Let's standardize ASoC menu

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/sprd/Kconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/sprd/Kconfig b/sound/soc/sprd/Kconfig
index 5e0ac82785721..8ddfe55aa21f8 100644
--- a/sound/soc/sprd/Kconfig
+++ b/sound/soc/sprd/Kconfig
@@ -1,4 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
+menu "Spreadtrum"
+
 config SND_SOC_SPRD
 	tristate "SoC Audio for the Spreadtrum SoC chips"
 	depends on ARCH_SPRD || COMPILE_TEST
@@ -14,3 +16,5 @@ config SND_SOC_SPRD_MCDT
 	  Say y here to enable multi-channel data transfer support. It
 	  is used for sound stream transmission between audio subsystem
 	  and other AP/CP subsystem.
+
+endmenu
-- 
2.43.0

