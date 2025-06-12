Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010037.outbound.protection.outlook.com [52.101.228.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDF38185E4A
	for <linux-sound@vger.kernel.org>; Thu, 12 Jun 2025 01:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749692691; cv=fail; b=kOuJmhgAKZv3bKL5bYq16YSDcyrPYMDOPDbgkCBj0UUmEZkSPLtqfA8t9dKPP0DaYsgTR9ND6JFVYNmwq62ve4NLxkqnCga5NpR4LjvWWTisQnt0tT2W4U2m1kzWhPSJKysBuMipdEZIukiXYRvWWsd8wh4W1+m9EfCFktq517o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749692691; c=relaxed/simple;
	bh=1ccr0QNTaftplyRAWpU3/J6aPSQ8z2kR+588KTm2JTw=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=IMeikUiSSwTuRU/wkF76urrTKOMyqSsxDOTPopn/U6479jW9mSmW2rI1Hb4UD7GTGZALuwXhvatbQ63iq32p+6/tsyQ8s+R7l4NR06le5shduyson67PX7HsjuqC1zHnwC0kWogdNsGFcqkpOMQuDdcHzsGiyXhYT9euofHwjdk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=IKjNMVU4; arc=fail smtp.client-ip=52.101.228.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="IKjNMVU4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CQwi8Krrc9JkntelKlwfulaEVs+/NrfNbtuTO/9x45638ejkyVmAIO0winpD7CMUY+Ewfr/qrfZqmGAL/KYgdcOSwW6ngURN5vNML9WL/+Hc9hmPlqSoHGNbQ1MUIzv1ZuewCMMeQCiAwMgnM/jrR84bcNRk/QeNQTCHRvNPPaiYC3P+5cgBg0HNxJTqJHsmqkFxwMO1Hzu24UcwqGoWRWwlftJieKkIw9cAn6PWu2t8s4OO9LZBtwwVJwkSsDDUroervc3L38yLVDEwpK1ji8ftN90BSPL+/NufUMCM3l7vY+FqkOVeRESpuHP7xccG6zXtS3RLr+EvKbWYfv2j4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wgAxw1T/+8lBofLzeAuXIk3m/GjKAb/3zgoGJhoYE/8=;
 b=BqonDdm4tFqYbMco/rqB8duFdzWT0hpk3A7wv+hQ0pYzDlvogAdUf/IKa8+v5s+OskG/8GNMACBCckUjNbaj3GbVOsh9Iq1Bdp8Vvghto7FV3qM0kDlg+KMGIb5ZNw19nKFgAA+FPZDsznswFduerRbHrHcBhkQVRUzUdtkEKbSgUjRrpOJcus7RZLq6Q8gOkmckPqbryoNF5Al3mhoX+68g6OkFwpE4EO6Ni4YBCiksXk1CnO9bdruQYOyD1JLPb/ARBu3SI4aASBqNohbCnr9RGgyca/7nOz31WqLjpGrunNS0Xm+0Ed0wwjWiIWbdqMcaIUrD5NJqXV3pmGfcRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wgAxw1T/+8lBofLzeAuXIk3m/GjKAb/3zgoGJhoYE/8=;
 b=IKjNMVU414Izi7bJpanTiA++QEDtBLFwC9bmIW1bPz2+TpVkLH/PbjIA+XulIH1OUMXv1yT9WT2L6fuGPDSId37d0hdIFRS1ibZHK348nofYRQSJu+dC21wkC8o/7GJKsohN5uA7m2rQj2kRNQqmqqOmtXM6ZbRRzV6SrJxNeKU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY3PR01MB9824.jpnprd01.prod.outlook.com
 (2603:1096:400:223::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.30; Thu, 12 Jun
 2025 01:44:47 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8835.019; Thu, 12 Jun 2025
 01:44:47 +0000
Message-ID: <87plf9ybqp.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 36/39] ASoC: rockchip: Standardize ASoC menu
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
Date: Thu, 12 Jun 2025 01:44:46 +0000
X-ClientProxiedBy: TYCPR01CA0178.jpnprd01.prod.outlook.com
 (2603:1096:400:2b2::19) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY3PR01MB9824:EE_
X-MS-Office365-Filtering-Correlation-Id: 75fb147d-f6f0-4095-d9a7-08dda952b69d
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|52116014|376014|1800799024|921020|38350700014|41080700001;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?yhJFGktPVjAmS+ILvoN/L6hUQF5IHvJl90URoKHkzlg277/lPcET/1ZM9Afu?=
 =?us-ascii?Q?EA6yO+9+BBt7YufhAipxmR7svEKviz0e2iXJ/YzCcpwLfTV9lM6KobloDdeL?=
 =?us-ascii?Q?Lfl9SpxU5PiftRSgvMhu+P9v/nX4XZIAOmkB3KfSC9RWew4Tk+/yhSfBwp5Y?=
 =?us-ascii?Q?0ZQmBED2Q/6ndW5u+/l9BPbhql6UgE+ZqHg94vRnqqRh3PMKmhon5EUc+Hhq?=
 =?us-ascii?Q?bNHb5a5nuB5HyKr16TA3lfxfsyYVicqaCOUbk4mh6YwZoBpE5GRAk++tFYT8?=
 =?us-ascii?Q?lDuHu1hL74YZ1JVSmulxiwwNN8YHnlqNGInV6x8UNPm3MY7mR/ReAa6hPG4g?=
 =?us-ascii?Q?xzQ63yKchMhUHjxLYFr5g94jzZUZX50xjhusDavit2PuLLp0HtXDgy7NIEeW?=
 =?us-ascii?Q?NSr5yWqAyYj99A69ig7BMun5msfJefVkfrDSyrIYcr8emWmtXhL3Xx3zpxFP?=
 =?us-ascii?Q?NCUyUmasnec/8lZ4bZ1f/bql4DE81DXpSfDwY5S3zOhv72OKxDI+m6xUBFxW?=
 =?us-ascii?Q?B0I8ULiF2gQlBQ+EcurNurh0eNXJv1ZHOdaAlFlL6MORBTFq1D9EfKEO2h7D?=
 =?us-ascii?Q?xB5LthsAGO0cz5Df+xxBkjEfugSfSRjSssP84ELG6wvqu4JE7PMpSargzaSX?=
 =?us-ascii?Q?GYSa3WtXpHzGhrfl/LYq1wylOKFJk1Iwrh4tNThKIw9S7FXcB5xPIrzx8yS6?=
 =?us-ascii?Q?6qKJ0pksMznNUELuWMxnSRrRNRINsbeSOU2I6GmZ8x9wtaiqMGNb6JGwLC7j?=
 =?us-ascii?Q?qDtuN7gAim8KbyftxqUmtRSV6fDTPBLBY67PuhSSz94DNRoqwOBRVOyo17ci?=
 =?us-ascii?Q?guuNKMcUSjS1Wp2frhgTbghR4/9QxEW5YwbYlZ0vhgUc0A+b0TWtxCj6lwlU?=
 =?us-ascii?Q?W8RYkgpuZ67OXKKRPLx5xHg3plo3YwOD1wXBOAY2ZeKUFgHIL1ue6DnAn8aT?=
 =?us-ascii?Q?eK4Ma38vWqhdXzOFT/1sANiffHGJyYKTWygInlHvG69qsVCKAxI5fNlaa3oi?=
 =?us-ascii?Q?1Sgg9c+1SWMbkXL7NeRwueDSpv1zdcl81LM7ii1R8mJfkXY4l7feuy3Oqb05?=
 =?us-ascii?Q?bR7Pmm1F99Yo4HgIxKMjMZ6Hmu5+Y+3gBq+brF744VvfvS6CdDZHqdKR0Dfx?=
 =?us-ascii?Q?zVsO80lu/A00RbIZ9os3StY3mtHKEcwUrqrW/NlEA5kWI54603B3sECqdfy+?=
 =?us-ascii?Q?mI7EGuAYI8Vi5SONwV9wZq5TwQ8erE2gPIGzhgnLXIha3XUSCAGqw6y+R3LK?=
 =?us-ascii?Q?Pt4mCIctzXplm19SEgGQukjEtPN0thWnebTWymvykqOHxqUmEjTbgEg/sVqZ?=
 =?us-ascii?Q?bQggNSqN2NezwdK2SmPojzPF1Sdsrh0dvbpqi+n3sk8AHi/7Wxriu8zsOA9R?=
 =?us-ascii?Q?Kw1nq1vLng8lo4OXPuajxhZHJuqPDrRbENElKmFpTqhiKtSHymiocMzrSASQ?=
 =?us-ascii?Q?n5lStgu0SFSvk2YJNAHIvGdJS0YWrDdxP2zrB+0jwWqZybFgXp4cHKyM7wLj?=
 =?us-ascii?Q?gf0D9ald7z0AhZjy4AEAT09ow0zPEC5cG+FPBz/9jbvx5Q653yW6HjoDkg?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(52116014)(376014)(1800799024)(921020)(38350700014)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0EK77q4lNzzsyv/M+kXLPOPFW56VS4X4NaqSrpCLGG3MJdCcvkofrr1UzHkK?=
 =?us-ascii?Q?YHhP/Sdp5SdvzCCJnh2wIcHt7FESlmSvoU2SjuXAkCnbBJq/mmjZ9rHklGfx?=
 =?us-ascii?Q?fi11qXmipEORqOcXRrERA9IrN7JNuW3c66SZArVvPEqEKflgzqMmB6kBrogb?=
 =?us-ascii?Q?cfv92wPFiaIWFXKCD80dABmPB1VQFHyWcpssXzAIk8cfTJCgKfOiwsis2Peg?=
 =?us-ascii?Q?I7YW2o2Dzbyr/fc60/DcdBElsbODW3ixzsr9nrnWTIJ8Anf2tJ2j+6NJBmyL?=
 =?us-ascii?Q?GdsGn//N14I6pCZZ2l5K6rnJtPLifru5kGC+Sdqvn4cll5xszfVvclNqEoaJ?=
 =?us-ascii?Q?rBR5n5cQzCvxEJogSmMFWFVz96gKYovKEj7TXkR6FYG9gA6vHU0IDG0KnCTq?=
 =?us-ascii?Q?RHLXROOiz9AObgtIdWauyvNq29afTVhpgnsuOe915gc6c47/MbmXc1wkuj0A?=
 =?us-ascii?Q?iUrNSnqntN2VqvltiSJd1XgaisJvfcutpkjgP6pNZFeUbNwMqF64DWxBnFFr?=
 =?us-ascii?Q?uIcBCA1wp7T9kBijgSxNlD5Jjfcz6d4BU9R8/ZS+ChansPfHTFd7vKrmNzoe?=
 =?us-ascii?Q?aSJUxjN9cVgM8DT+zVTL1uyJygf4V2S89sEkfpzuePqiPVoaijkVbWzBnIsf?=
 =?us-ascii?Q?nKsf0HtST1PKrzk0KeuDEc0/sxS4LpoJQBuEkOhm2uCje1i40+2/T0KC0dtH?=
 =?us-ascii?Q?PJs94FKx90y190g8B2kFslKZy+TRl5ZGSA6H9cNmR3pbI1fq8IsxmHlBG2SD?=
 =?us-ascii?Q?OoMKKKR8Hsr6E5G12AvoRHWf0exq0n1dOyODcxw4GN/hojum8+Qn4PxZa+5L?=
 =?us-ascii?Q?+T7A7zUEU0aak1P4rNXo8bvr0mczXFd8FP02uH+pwFurlR9PGIe17TmGqLKa?=
 =?us-ascii?Q?plKVxXtFXHIa7X0nTWIUfp74+FWTtl9FYqoasNMBskeNFbpMpdjjnvkoF3JE?=
 =?us-ascii?Q?EAFLSsALu/BZInWRnTqJQZb+ys2/m1LDnNxJrLnjLvJ66L9pDvwWvcNUW9YS?=
 =?us-ascii?Q?8O+y5IvscpdsJ6NApf4wYaJeJN80VLFf+6EN/+ReTNrgkNj/hiVmLNGj3rhm?=
 =?us-ascii?Q?1moDF+c2tMO9siqnzkz2IlXnRQfO3tR5tsO6Ge+QuE0lUOdvtcUfnax4zA7l?=
 =?us-ascii?Q?cHhbi/qtrFL3LbsBqlr4WO81v+KQq8fMeFlgrd0kd3SUDFBYn6zsqgu2bQiK?=
 =?us-ascii?Q?YnxlsZfaXqvak8KeCodPjx/DqZoV8N6seiiiqNw7MMBhs22mcnjcXb7hf6nr?=
 =?us-ascii?Q?Tiz+8rRlU4l5IOBaIoyxzjmWJSzC4OUvYPCL+PDTT4c1cRgT7IskSJgA80DX?=
 =?us-ascii?Q?+/taJJAwLFJP9mFMzdNj76pSy04WCKG3UppepJ4N2411xF8tXfT9u/7rAgQF?=
 =?us-ascii?Q?JmR2zepeZ77ww711xIDiXk37UkxSloQc5/d3mIVyl37DkMj0K6aUO4f78ddt?=
 =?us-ascii?Q?Myd56SJewuO+ScChQ/zzF81JPTEIrivzw0kJtcAevheZk/5/p45YuwJLb2xn?=
 =?us-ascii?Q?PePjx6AksYe2Lt0vMck4ZJ3pdeBEj1QVKA5WinfNpgFICTWaScDPOkQ7CQN1?=
 =?us-ascii?Q?pMt4fxFVwuzYK4sZhrA75eRjJrmwnBTjzGeIzQt8JmbnPvIJ0MiLHzsWgVhe?=
 =?us-ascii?Q?JrjeIDWaWM92wMet3dUzZco=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75fb147d-f6f0-4095-d9a7-08dda952b69d
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 01:44:47.5836
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9CzRYKiSUWRTO3kfCCVIaUzUEJMigT8jv8rP7DSOEiTw8MRBGzGjFCFO2U0HqXXRzW71uxdyDXww/VxSUkWlO6uG/fqeu1xML83/H8Rv90CUSU7xcn8SbXK1PLnZFfj1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB9824

Current Kconfig menu at [ALSA for SoC audio support] has no rules.
So, some venders are using menu style, some venders are listed each drivers
on top page, etc. It is difficult to find target vender and/or drivers
because it is very random.

Let's standardize ASoC menu

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/rockchip/Kconfig | 23 ++++++++---------------
 1 file changed, 8 insertions(+), 15 deletions(-)

diff --git a/sound/soc/rockchip/Kconfig b/sound/soc/rockchip/Kconfig
index a08544827b2a3..bd210fafe9fea 100644
--- a/sound/soc/rockchip/Kconfig
+++ b/sound/soc/rockchip/Kconfig
@@ -1,15 +1,10 @@
 # SPDX-License-Identifier: GPL-2.0-only
-config SND_SOC_ROCKCHIP
-	tristate "ASoC support for Rockchip"
+menu "Rockchip"
 	depends on COMPILE_TEST || ARCH_ROCKCHIP
-	help
-	  Say Y or M if you want to add support for codecs attached to
-	  the Rockchip SoCs' Audio interfaces. You will also need to
-	  select the audio interfaces to support below.
+	depends on HAVE_CLK
 
 config SND_SOC_ROCKCHIP_I2S
 	tristate "Rockchip I2S Device Driver"
-	depends on HAVE_CLK && SND_SOC_ROCKCHIP
 	select SND_SOC_GENERIC_DMAENGINE_PCM
 	help
 	  Say Y or M if you want to add support for I2S driver for
@@ -18,7 +13,6 @@ config SND_SOC_ROCKCHIP_I2S
 
 config SND_SOC_ROCKCHIP_I2S_TDM
 	tristate "Rockchip I2S/TDM Device Driver"
-	depends on HAVE_CLK && SND_SOC_ROCKCHIP
 	select SND_SOC_GENERIC_DMAENGINE_PCM
 	help
 	  Say Y or M if you want to add support for the I2S/TDM driver for
@@ -29,7 +23,6 @@ config SND_SOC_ROCKCHIP_I2S_TDM
 
 config SND_SOC_ROCKCHIP_PDM
 	tristate "Rockchip PDM Controller Driver"
-	depends on HAVE_CLK && SND_SOC_ROCKCHIP
 	select SND_SOC_GENERIC_DMAENGINE_PCM
 	select RATIONAL
 	help
@@ -39,7 +32,6 @@ config SND_SOC_ROCKCHIP_PDM
 
 config SND_SOC_ROCKCHIP_SAI
 	tristate "Rockchip SAI Controller Driver"
-	depends on HAVE_CLK && SND_SOC_ROCKCHIP
 	select SND_SOC_GENERIC_DMAENGINE_PCM
 	help
 	  Say Y or M if you want to add support for the Rockchip Serial Audio
@@ -49,7 +41,6 @@ config SND_SOC_ROCKCHIP_SAI
 
 config SND_SOC_ROCKCHIP_SPDIF
 	tristate "Rockchip SPDIF Device Driver"
-	depends on HAVE_CLK && SND_SOC_ROCKCHIP
 	select SND_SOC_GENERIC_DMAENGINE_PCM
 	help
 	  Say Y or M if you want to add support for SPDIF driver for
@@ -57,7 +48,7 @@ config SND_SOC_ROCKCHIP_SPDIF
 
 config SND_SOC_ROCKCHIP_MAX98090
 	tristate "ASoC support for Rockchip boards using a MAX98090 codec"
-	depends on SND_SOC_ROCKCHIP && I2C && GPIOLIB && HAVE_CLK
+	depends on I2C && GPIOLIB
 	select SND_SOC_ROCKCHIP_I2S
 	select SND_SOC_MAX98090
 	select SND_SOC_TS3A227E
@@ -68,7 +59,7 @@ config SND_SOC_ROCKCHIP_MAX98090
 
 config SND_SOC_ROCKCHIP_RT5645
 	tristate "ASoC support for Rockchip boards using a RT5645/RT5650 codec"
-	depends on SND_SOC_ROCKCHIP && I2C && GPIOLIB && HAVE_CLK
+	depends on I2C && GPIOLIB
 	select SND_SOC_ROCKCHIP_I2S
 	select SND_SOC_RT5645
 	help
@@ -77,7 +68,7 @@ config SND_SOC_ROCKCHIP_RT5645
 
 config SND_SOC_RK3288_HDMI_ANALOG
 	tristate "ASoC support multiple codecs for Rockchip RK3288 boards"
-	depends on SND_SOC_ROCKCHIP && I2C && GPIOLIB && HAVE_CLK
+	depends on I2C && GPIOLIB
 	select SND_SOC_ROCKCHIP_I2S
 	select SND_SOC_HDMI_CODEC
 	select SND_SOC_ES8328_I2C
@@ -89,7 +80,7 @@ config SND_SOC_RK3288_HDMI_ANALOG
 
 config SND_SOC_RK3399_GRU_SOUND
 	tristate "ASoC support multiple codecs for Rockchip RK3399 GRU boards"
-	depends on SND_SOC_ROCKCHIP && I2C && GPIOLIB && HAVE_CLK && SPI
+	depends on I2C && GPIOLIB && SPI
 	select SND_SOC_ROCKCHIP_I2S
 	select SND_SOC_MAX98357A
 	select SND_SOC_RT5514
@@ -100,3 +91,5 @@ config SND_SOC_RK3399_GRU_SOUND
 	help
 	  Say Y or M here if you want to add support multiple codecs for SoC
 	  audio on Rockchip RK3399 GRU boards.
+
+endmenu
-- 
2.43.0

