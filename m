Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011041.outbound.protection.outlook.com [40.107.74.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BAD372610
	for <linux-sound@vger.kernel.org>; Thu, 12 Jun 2025 01:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749692532; cv=fail; b=P0xWuzyWIT/Vxl7cObgNiWf9E38JsSrKNsAkFb7vFnvFj8WVf7CAmSV3bAAfqh0SRwg3VDs79GVFLBSljDoJdqOqjYvwzaHqhlVUre3MNRNGchLsdvjoqVnuiU4Od+KnnE6Q7apCWC9RYL+NNyfZPMBDHQnHZqbda/ovfBu3MlU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749692532; c=relaxed/simple;
	bh=CxIXwPnzQ3lvORo4SYna8qOMNFoDIFwaX/Kbx9FUUxc=;
	h=Date:Message-ID:From:Subject:To:Cc:Content-Type:MIME-Version; b=KYfQcAQ3Cjy9tt7ESoFuSOxSmqwIfj1DJWJWDVuMMprchfVxg16PtHSjnqAHVEB2MlQBgG0AX9+B4V2tYfpcNJS785KxT5QTqcsKN7+2tt6xi2JBn4ZQiKyySyfBZMWLd7HFpQ6TV7P/CLKk3yzgm+qndMlT6FZ4oTdMRj6/Yys=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=XzxLjhTQ; arc=fail smtp.client-ip=40.107.74.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="XzxLjhTQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xu6XXUC3aKnqwHDOvLyFeVLLOGNteuVr1Wp8kCrn+HpsNY5YdDbfyIuCUIdkA8dU6fUfAzZYYzhtwV2ljq28UlDqLDCaTIVxCsFr2Eyvb0XRp+0rlUdFMfwuR93lurjEcEkKbEckoXpDHOeSN1UsC1Be1SNCMSKZp7JBHm830ZrOntYSGgN/kzkF0n2WEUvmHne5C7c8AWjSxGdGAtX8WQODN6JQ3ECvlYyIMGTa+p4xFSWnsPVPVdRvGM2+b4apq4qGVwXtbpaY9TQpuY1LNcJenGXKfbipHZyoiIIMOpYpCoFifebnpU95vcLDD958tPIpHSlIKqEFQQb5U6O+vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9DylZUaXcVgZN23dWruzkPg34hs+jvaOO1npn2O8/t8=;
 b=nSEGHQnbDGDLhG5weJ9SjxGHbfNFtQG+p4KOb/XE5fBx2fuwRSdSs1upKCb8ElpkmCZNYpdBE+6qRNUVEJv9PTCopWZ3n3/ri9lMq/Y+5Kfv8naOLQ6z7fEJDBXit6e8fp9knklVFfUAXbwwcTVKLv4ld0JMFMg0JZ210kPeGgxB54QoecPpPm6u4MIjVcY6SaoxuSHB+LfQyjpBlaYJqjJAWF1QY8K6ZCpvzYJ6ifvvHWukDfPxms02QYu/7pBVTUj21XOq5Qd9hOc3H7/Xm39K+R1C4+ojsR55K8xiXp2OKaZcrqga4MbSgwvYjksTI1OK7GEeOeQwosgZjzeoBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9DylZUaXcVgZN23dWruzkPg34hs+jvaOO1npn2O8/t8=;
 b=XzxLjhTQZGuJkoXC4letEnvWyhFgfbJpWuGYK/w2jyVOFABiQUiB4MZaj+0XpUyD0gF4pIcvd81cLxa6b+AenMWQK7BqW+kNROdo3rTnOEEvwTRs/24Dc0JPyLpW11D+lgHQn3sDvaCquWR6fmLgP9Zk380ICdRL3OqMAsNTjbM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB9937.jpnprd01.prod.outlook.com
 (2603:1096:400:225::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.25; Thu, 12 Jun
 2025 01:41:26 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8835.019; Thu, 12 Jun 2025
 01:41:26 +0000
Date: Thu, 12 Jun 2025 10:41:24 +0900
Message-ID: <875xh120u3.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 00/39] ASoC: Standardize ASoC menu
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela
 <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, =?ISO-8859-2?Q?=22Martin?=
 =?ISO-8859-2?Q?_Povifff=B9er=22?= <povik+lin@cutebit.org>, Claudiu Beznea
 <claudiu.beznea@tuxon.dev>, Andrei Simion <andrei.simion@microchip.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Cezary Rojewski
 <cezary.rojewski@intel.com>, Peter Ujfalusi
 <peter.ujfalusi@linux.intel.com>, Bard Liao
 <yung-chuan.liao@linux.intel.com>, Ranjani Sridharan
 <ranjani.sridharan@linux.intel.com>, Kai Vehmanen
 <kai.vehmanen@linux.intel.com>, Pierre-Louis Bossart
 <pierre-louis.bossart@linux.dev>, Paul Cercueil <paul@crapouillou.net>,
 Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>, Shawn Guo
 <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>, Srinivas Kandagatla
 <srini@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Sylwester Nawrocki
 <s.nawrocki@samsung.com>, Daniel Baluta <daniel.baluta@nxp.com>, Orson Zhai
 <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Arnaud Pouliquen
 <arnaud.pouliquen@foss.st.com>, Olivier Moysan
 <olivier.moysan@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Chen-Yu Tsai
 <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland
 <samuel@sholland.org>, Thierry Reding <thierry.reding@gmail.com>, Jonathan
 Hunter <jonathanh@nvidia.com>, Kunihiko Hayashi
 <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>, Michal Simek
 <michal.simek@amd.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>, Alexander Sverdlin
 <alexander.sverdlin@gmail.com>, Elinor Montmasson
 <elinor.montmasson@savoirfairelinux.com>, Binbin Zhou
 <zhoubinbin@loongson.cn>, Alexandre Mergnat <amergnat@baylibre.com>
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset=US-ASCII
X-ClientProxiedBy: TYCP286CA0247.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:456::18) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB9937:EE_
X-MS-Office365-Filtering-Correlation-Id: 33aafb99-a214-4ad2-dfe2-08dda9523e8a
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|7416014|1800799024|366016|921020|38350700014|41080700001;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?rRLtf/DzNV6CBP/CMC5PA/B6lDzQda52tXrYdL1zWRyt/mz+uzaQceBVbKJ4?=
 =?us-ascii?Q?+ITVeM70ccxopV8JC6aZolC1ABy1mtpEnP7OU8b4FHcaM56fxzDnIxyEroV/?=
 =?us-ascii?Q?2xzxVn/0Ja8SWxhyTu6Q1h/gOOkb6O4N93OPRtCtepBDN8PoZFirTvYhr6V2?=
 =?us-ascii?Q?4Th4FkvM0Ebu0cxYT91Ff7kUDcnCrRH0GhHbnGZ+PpP2wE/5VFEw/lGobpqJ?=
 =?us-ascii?Q?2WSJP7PmUW8sgi1TrwmIh4T2np10a9nrY8wGkIavzkD+2EmGRkwSc42Ew/me?=
 =?us-ascii?Q?C9wUY2c2EbVMsGa2aiDtXsdxiEO6RvJ8rVRKh6qa4iR2HAAHpBmEdpZPR1n6?=
 =?us-ascii?Q?wSERbF8LAb7kLm6R0mnTP51jfCVKXmyWqZBEDSmBTsutIebSt1xbPjuZeSYc?=
 =?us-ascii?Q?NVfJHZGmgeirEaBDQNKyDK4du9NnWpjFvfU7dtkGPJ3Z0y8CjYYTK8Y5mHHs?=
 =?us-ascii?Q?PEmd8gETSQhmKEwL5X/HU7c6DoGLPRytcdDsbqWTFmsPLfVRfy8Wopc7OVIX?=
 =?us-ascii?Q?Yh/YoZHvEta0K3j0BaIZar9aTgVUjFo7YNCSD+u2iIf5YLT0782edBJxj6pC?=
 =?us-ascii?Q?Ag+ODbCQu4vnMKwNVh6q4ylc+UYU+biY/mGEZqqKcugO6QPzD+GpXITazqFZ?=
 =?us-ascii?Q?/2M8VZYEjfkJ862/Ym5ag1wokPUkYwPGLlavssZQEnWYRSttHCI3SzljXEuM?=
 =?us-ascii?Q?awMwmQnYBeqTBpouJpzLrss4K2TINPCJ7FVkrUBEM+2NlyqOMSm4WPwjhAFx?=
 =?us-ascii?Q?XJMdF7KvocLwM/NkcYZiGhdrq81Lx2Vba2LEffp4YjGsCvw/qpuB7YmBCAH+?=
 =?us-ascii?Q?nSvRDQPEPja9ZGKfTNT/sqRW3R8qTo7VDzNiJQlY5/bsC3YVz8wo5gD7V9yz?=
 =?us-ascii?Q?KNayf3XNY8y8zOA7PMoQj1Bk2INgAxmpGpfvreOA1Hv3+T+O3ZP7HX0GaiPh?=
 =?us-ascii?Q?G4wrUWaGGQha+FkzIM15GOniWkpL5GB361d4U0TafGN+onJBBf67v+N6vj4t?=
 =?us-ascii?Q?uBHNtxdEJiqYN/icLSVQ4ddNMOCoVg18bW1q4alnauxJdvgpOjN6hxpiM574?=
 =?us-ascii?Q?lb5Umm8MjoY6K5hUcdeueK3VtPYMTDI9IKFU2PEpe0xRZJUD8rc0YEqmOJAK?=
 =?us-ascii?Q?Pp6Mv1Z6bTFl6oq09jypy4lCjVJnOiDmq33HtQ8ZXvrkP4u9pNuqrGaUe6pR?=
 =?us-ascii?Q?lRjOlqWIJERMg8vYmsP4vY66RnK/N6MVaJ+wvOouaVfPvKUUStmX2zGVlqV0?=
 =?us-ascii?Q?8HQPKfrGgvzcg7+1I+6KzCgmoz3ghn+nD2YM0l80g1c6/Elxry3jG/2O6dd3?=
 =?us-ascii?Q?WDGOD4Btb05RVINlKgZGedLezDH0762dTxk/n7grdhPdDbSobYgb49+43R0S?=
 =?us-ascii?Q?sn10i7H9CHMDEkqk4pI+31pA5dkthlBYJXZCzpW64iiG9VESzeTf/hvKqnVu?=
 =?us-ascii?Q?JqNoCTduLTOzXrxAYwEf9uCGmQyF9neAsQu0Y4HRfV7Tz8z5TbVAGVCCu/6s?=
 =?us-ascii?Q?8UW8tLPHqOCAAWh9o6ws15Ch6fig4zCnSMVKsUXlW4btoKRXLGaNwjuqPw?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(1800799024)(366016)(921020)(38350700014)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IBL81j+6VB/7PWhD+Y4dYw/h/JZw3TXvW9sXdsrS5DafZJDjyfvmHRglpJDg?=
 =?us-ascii?Q?x3FefOVkOROiZfFlQhNbcuVmtdk71tTQSReYSTN3QrlHnS6KdyBk6n3U3CMZ?=
 =?us-ascii?Q?Io5a7pI4cu9u5GNC+dtVG8BE8fXOjeikcVNAKBMyC0s+AVK8o9sVN2YOQR/6?=
 =?us-ascii?Q?u/tIU5Gz2W1Qym7cSfreRPafugfn1DfKVu888pNAmraeGrO8fEVgJyA4H3S7?=
 =?us-ascii?Q?c5MM5c0dayC66xv4BHhEth6LOoa0oGWLOFOg60sAV4oyLRSSAFLJF0yl6BcY?=
 =?us-ascii?Q?IPJEuSTCib0dQ10SYyDVP99l/pbP/FE4GFg04kriZmgHBsWyJCp5RzCSxf7X?=
 =?us-ascii?Q?6sovJ7j6yaBaHJEmPJ11SQBbyjGBEUiFdWq8HsqDJiTz/ue/LWF1IFOdAuO8?=
 =?us-ascii?Q?akOrhGYN/vsRZbp5VFw1J8O2VMyU+3u2Up7Y4lpFOgTBxK+raFnQB3abwtFy?=
 =?us-ascii?Q?GL0tIVSd4ReuVbZdHZw88/Slx1Zu/nFzxIdyITuM2BO7QkKXEdgn2p7UtmbT?=
 =?us-ascii?Q?iYhdTSkI7BaBZ86uFIX/bnZsJWVYH2bhPsfxwmZ6wi0sQcTKau36qQWeyZZD?=
 =?us-ascii?Q?3tdHnM3NxTm9p2M2Y3fQGoNfeXV8iHXLyi4BopL47UsM9swCnpDUQjDvRzMo?=
 =?us-ascii?Q?7vicVbWYPg8+6kakps3kaRzxUHtW/uJjQMMgoG/DuwPFPomnhmoddfNCUDdS?=
 =?us-ascii?Q?aE4XRtkxRi/r/e2r16V59jpB2qIc/Bp7a1bYGHoJAKgSv7JoNX7Ysd5S0G2s?=
 =?us-ascii?Q?kXNdxwEbie5LUhFGA6KaYiAWoeG0Xtp+2/7e0GZuE3b597uI3/RVFE8QGQHO?=
 =?us-ascii?Q?uTg5615dpx9s+ljKuqeyqvlnILMGiRPxE3zT2Fj57ouI4XI0eUxH+wEURyKR?=
 =?us-ascii?Q?xrWp6uIw3KpF6+ZGdqyhv5hqJXOjNXTkKisfw1l1IEuVkQidH4Pgv/BtNTRF?=
 =?us-ascii?Q?+kP/X44yPXGTVDTKP5in+RjZt5d8qmjE6oaJRRd461vyCrW+kECkOlwO8yOZ?=
 =?us-ascii?Q?raILRFwjsqxgtdKn/yA3IfgLqybtie8odzrAOyehJ1BSozGoADDIUo+NOTU8?=
 =?us-ascii?Q?had8InPXXd9y+zdMC23pMb+xG3AEhdsJRa9kleEVE/82dIIooxIopT84PjAF?=
 =?us-ascii?Q?V329gc7KAGe+j5TOSjR7i/2lfeeWbxgPfB40MF7Vv2RNRJ7mhz61EHXKaTme?=
 =?us-ascii?Q?mv9mv/TBE3hr+x95sEB1uQPp+Cnk80cNwuLgLikpnmLvjjxYDiKcL2/XbLDw?=
 =?us-ascii?Q?VK5jNgSi3aCJAOUS/Mz2gQzu3DIM9Hy5p88zmrqvrdaJwOiOCLXlxjsID1vr?=
 =?us-ascii?Q?3zYZt1ATgFVzmGCk/L+xsw6eka1JcJmodoFvwTuEHwg3to9p5rUBks+GySPG?=
 =?us-ascii?Q?DmLiVZLqtGapKj3Df3QFPkxctTLOBkJQVrElVLaUJ053++LMYTDPadjC/1ll?=
 =?us-ascii?Q?xbDYZaF86kKiB7BSLD4LiUbjwPJb+/ARs6Ka/2LQyKXW1ftPRQRs6YZnajsy?=
 =?us-ascii?Q?uEt57fUYDRwE0mZ1LHpzbZq5gi9JsZuN8Qq9tBLpjZaWxMkw7O1i1S3PwJG2?=
 =?us-ascii?Q?ybBJM4Ja6UGEzVIGOjvpEu9t1DbIa+RpvXKzd5u7NOiquXcgomrR5bqehGpo?=
 =?us-ascii?Q?W5NxsvEH+QIn5LRehRaAK6U=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33aafb99-a214-4ad2-dfe2-08dda9523e8a
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 01:41:25.9783
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OUlKT5nsojYnrcD9IYtxMHpX/5kt3/n43U8TZmQSyCYIuzYD5wLrLOLxY1hHcgKclUMNwom0qtKaztKi3N7PK4jogd/RUSE3FKGIg13WuaCfC5TaFeUzdP1uhfsYRTu3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9937


Hi Mark

Current Kconfig menu at [ALSA for SoC audio support] has no rules.
So, some venders are using menu style, some venders are listed each drivers
on top page, etc. It is difficult to find target vender and/or drivers
because it is very random.

Let's standardize ASoC menu, like below

	--- ALSA for SoC audio support
	      Analog Devices  --->
	      AMD  --->
	      Apple  --->
	      Atmel  --->
	      Au1x  ----
	      Broadcom  --->
	      Cirrus Logic  --->
	      DesignWare  --->
	      Freescale  --->
	      Google  --->
	      Hisilicon  --->
	      ...

One concern is *vender folder* alphabetical order vs *vender name*
alphabetical order were different. For example "sunxi" menu is
"Allwinner".

Link: https://lore.kernel.org/r/8734c8bf3l.wl-kuninori.morimoto.gx@renesas.com

v1 -> v2
	- add Reviewed-by / Acked-by tag on each patches
	- Remove "ASoC support for " prefix
	- use "Sound Open Firmware (SOF) platforms" and moved to last
	- remove "CONFIG_SND_SOC_IMG" which is no longer used
	- Do nothing for "sdw_utils", because it is single entry and no prompt

Kuninori Morimoto (39):
  ASoC: ti: Standardize ASoC menu
  ASoC: adi: Standardize ASoC menu
  ASoC: amd: Standardize ASoC menu
  ASoC: bcm: Standardize ASoC menu
  ASoC: dwc: Standardize ASoC menu
  ASoC: fsl: Standardize ASoC menu
  ASoC: img: Standardize ASoC menu
  ASoC: mxs: Standardize ASoC menu
  ASoC: pxa: Standardize ASoC menu
  ASoC: sti: Standardize ASoC menu
  ASoC: stm: Standardize ASoC menu
  ASoC: sof: Standardize ASoC menu
  ASoC: au1x: Standardize ASoC menu
  ASoC: sdca: Standardize ASoC menu
  ASoC: sprd: Standardize ASoC menu
  ASoC: qcom: Standardize ASoC menu
  ASoC: meson: Standardize ASoC menu
  ASoC: apple: Standardize ASoC menu
  ASoC: atmel: Standardize ASoC menu
  ASoC: intel: Standardize ASoC menu
  ASoC: spear: Standardize ASoC menu
  ASoC: sunxi: Standardize ASoC menu
  ASoC: tegra: Standardize ASoC menu
  ASoC: ux500: Standardize ASoC menu
  ASoC: cirrus: Standardize ASoC menu
  ASoC: google: Standardize ASoC menu
  ASoC: jz4740: Standardize ASoC menu
  ASoC: xilinx: Standardize ASoC menu
  ASoC: xtensa: Standardize ASoC menu
  ASoC: renesas: Standardize ASoC menu
  ASoC: generic: Standardize ASoC menu
  ASoC: samsung: Standardize ASoC menu
  ASoC: kirkwood: Standardize ASoC menu
  ASoC: loongson: Standardize ASoC menu
  ASoC: mediatek: Standardize ASoC menu
  ASoC: rockchip: Standardize ASoC menu
  ASoC: starfive: Standardize ASoC menu
  ASoC: uniphier: Standardize ASoC menu
  ASoC: hisilicon: Standardize ASoC menu

 arch/mips/configs/generic/board-marduk.config |  1 -
 sound/soc/Kconfig                             |  8 +++----
 sound/soc/adi/Kconfig                         |  9 +++-----
 sound/soc/amd/Kconfig                         |  3 +++
 sound/soc/apple/Kconfig                       |  4 ++++
 sound/soc/atmel/Kconfig                       | 11 ++-------
 sound/soc/au1x/Kconfig                        |  4 ++++
 sound/soc/bcm/Kconfig                         |  4 ++++
 sound/soc/cirrus/Kconfig                      |  3 +++
 sound/soc/dwc/Kconfig                         |  3 +++
 sound/soc/fsl/Kconfig                         |  2 +-
 sound/soc/generic/Kconfig                     |  4 ++++
 sound/soc/google/Kconfig                      |  3 +++
 sound/soc/hisilicon/Kconfig                   |  4 ++++
 sound/soc/img/Kconfig                         | 13 +++--------
 sound/soc/intel/Kconfig                       |  4 ++++
 sound/soc/jz4740/Kconfig                      |  4 ++++
 sound/soc/kirkwood/Kconfig                    |  3 +++
 sound/soc/loongson/Kconfig                    |  2 +-
 sound/soc/mediatek/Kconfig                    |  4 ++++
 sound/soc/meson/Kconfig                       |  2 +-
 sound/soc/mxs/Kconfig                         |  2 +-
 sound/soc/pxa/Kconfig                         |  4 ++++
 sound/soc/qcom/Kconfig                        |  2 +-
 sound/soc/renesas/Kconfig                     |  2 +-
 sound/soc/rockchip/Kconfig                    | 23 +++++++------------
 sound/soc/samsung/Kconfig                     |  2 +-
 sound/soc/sdca/Kconfig                        |  3 +++
 sound/soc/sof/Kconfig                         |  2 +-
 sound/soc/spear/Kconfig                       |  4 ++++
 sound/soc/sprd/Kconfig                        |  4 ++++
 sound/soc/starfive/Kconfig                    | 12 ++++------
 sound/soc/sti/Kconfig                         |  2 +-
 sound/soc/stm/Kconfig                         |  2 +-
 sound/soc/sunxi/Kconfig                       |  2 +-
 sound/soc/tegra/Kconfig                       |  4 ++++
 sound/soc/ti/Kconfig                          |  2 +-
 sound/soc/uniphier/Kconfig                    | 14 +++--------
 sound/soc/ux500/Kconfig                       |  2 +-
 sound/soc/xilinx/Kconfig                      |  4 ++++
 sound/soc/xtensa/Kconfig                      |  4 ++++
 41 files changed, 114 insertions(+), 77 deletions(-)

--
2.43.0

