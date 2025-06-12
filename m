Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010009.outbound.protection.outlook.com [52.101.228.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5EB4165F16
	for <linux-sound@vger.kernel.org>; Thu, 12 Jun 2025 01:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749692696; cv=fail; b=rWfdF3rHs+qw9N9YiwSEu0OfgwlEmMMo7s2nlKpEO2mEM41NLYBJLrkNAsCfu0eFwpUmHbuf+4CuIm5STmpRSGv4X8uLFc7za2GtuwxleCWM8vfCGkxdKnmYTGcRdgDHX4zCHe0qOBxZBOQjjsbaKZlEbEajB3hMGQ/AQM6nKFQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749692696; c=relaxed/simple;
	bh=GNeUwGPztNaB+WRz9TfZHUVfohzPV/cbeT12bhjGXmQ=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=CbvvQ9rpVETDy4jS7coKOLmZbdxAJJaqgKpb8D7GiFdj0k2aLGhcO3ixke+1EA6aUPus/Sfdr2lRYj964XJ9V1p+dFZe/ZxSvO39f7CFUSDM4/ysoVzgIAClOJxaYUWQ7gxnxolTM947/RbS2SpIZAOfa1VO6YONQLg+IgdYhhg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=n1tnZg/g; arc=fail smtp.client-ip=52.101.228.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="n1tnZg/g"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PBZCJlYKXFBH2G3x1+KRejVAXVl0N7LTUtgF8aachcQ5xGKZYw/+/LV+VbYx50v/2oBgY1P01AOEsPX4T85xPryUKDTN6wuCyLRYqX/MN7OcY/r9mkEB6fmws52c8D0pEJ+Ry6gTtOPEL4RUFJe3xlL7M2THSB/6FPcbEgxBCXFKPFbbBfw4dd6V6EUM4E3mGppTkddMboR29GFOIoqTCEryE6sEK4B3eJ8j2ifYmFb1iPlM7ZNDzE6VEETwQmIQtVwtkgrHvS6Up8B9Mu3JN6/j0bFTpB1K4jLA55KE8mobvleibo38Fww9LP6zSPv9NTjVjDB1gFKrDQnT+WL4iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7CTygdrTOshnBpAO+bW3z7UxrkCNhOBSS1A7NNo6/hU=;
 b=SxbvR0J7HyaYGHqF1759dEePCql+NPOPGfSo8eQo67STgXTUFRfXp6GFoIKC7LOB8k6Rxp+Zmua41PN+KnsjtWWNIczFaRd9cuuMTEtXwVYQzAyMf/K0Oy9w+6REAfo1qcbjv3cDVfqnB/SGqEqC/JxrxlB3nTfYZ/yW8FSNDHpnYMmrHIwirRSSUaj8vBXykb6n6rNQdULt1PeGzbpSuZcNeVDk0vze4Vg1KJm1RJ8Ysipe8qdlpIuVO12wdTLbmyqeT+VxVa9AIse24nPSywJb5ehca4yGADsOHwIFnNFFXM/G1mK4RqVFfmXHmAQCgEfRSX4GqqRBHWrB8vhqAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7CTygdrTOshnBpAO+bW3z7UxrkCNhOBSS1A7NNo6/hU=;
 b=n1tnZg/gj3Z+3Ml+P1GpTxEC29igWA1mi/ZT2GAmI4NBoHjXcCpg3J2vUJasAMOXQcktDeDp86JkL50IfduVG541xw0Ayo7EelNWE3hGZJsuCRZGXrOtUGx+rU7gPqJ3deR+5FoUdaKymBaErUzbLzORNwsyI5EZ0NHC59/+xnM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY3PR01MB9824.jpnprd01.prod.outlook.com
 (2603:1096:400:223::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.30; Thu, 12 Jun
 2025 01:44:52 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8835.019; Thu, 12 Jun 2025
 01:44:52 +0000
Message-ID: <87o6utybqk.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 37/39] ASoC: starfive: Standardize ASoC menu
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
Date: Thu, 12 Jun 2025 01:44:51 +0000
X-ClientProxiedBy: TYCP286CA0362.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:79::16) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY3PR01MB9824:EE_
X-MS-Office365-Filtering-Correlation-Id: b6421259-8803-4201-02c7-08dda952b9bd
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|52116014|376014|1800799024|921020|38350700014|41080700001;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QlPyYrtnhDQrQAbv6wN2OyhvV0qNQjLKzyWMRL/HliY6f3eRl7u415EJUrVq?=
 =?us-ascii?Q?VHpnCF9pNtW4csywq5z2ED9NgZmlYMOc4KMuRsNv5eLkZq6ywArtmVH7GKLS?=
 =?us-ascii?Q?38Yk7fi+0HTQxxHChPwA6DbgvIoMsoByKye26Xt6KafyIdxck6lJ4uLTB18h?=
 =?us-ascii?Q?2BEgdG+w6Vb8z+VA9WeOflEQjXYW2nW7/Ji4TwbY0MH3os4VLufbdVKEPjRw?=
 =?us-ascii?Q?1mF/IMv28vj1ZVMeDP/wMMpV1e1p/HA3tJI5jSX65sfuRVT6yJhvgM/7TXWr?=
 =?us-ascii?Q?Q9eAl6+dz7gbh8DLI0TMlfy7GXwGE1FHTyDogQ4qhJo8PE3JCHS222TlsTP6?=
 =?us-ascii?Q?nZXr/V34bePswIz3dNiwkVmfowR0ugWlGRZaMqIB+c2+YywAWP5s+rNj9kdp?=
 =?us-ascii?Q?p4EVEnHwEXeBTcBogVGZhVyGJI06GNPpMv/tJG5o8FOzLjVy0NOevHf989Pd?=
 =?us-ascii?Q?E1ewT0yoKw2NkgkxFmDTjfk6UArkhWKndTb7UaF2LjNEkkQSHNUIb9BYOWFq?=
 =?us-ascii?Q?3zD8c4DLp8sij7a8MG3rGBU9rfpwF82F/ie95KxbmQrUPnnX2/yCBr/koPZo?=
 =?us-ascii?Q?MTV4ssmRACb1Wf7csuyigmEmXhPVqtS+M+L1uPHbWBhGH3bToiiUR0+yKu+W?=
 =?us-ascii?Q?LiDfnJXc+kV2e4z8dCA9nObBw4BuLcmqDzjYntk93hlToQKHoLmClrsFK0Lk?=
 =?us-ascii?Q?K4v3+Bm/+tmZVMg1nRKRvqlk7aOKv60igEduvHo5hP3Ynt879+pvz1Hl3/gW?=
 =?us-ascii?Q?n3M8ZZdtBCETezzSlXEQ4ivGmRjeg/BkP7R6KH7gPm32H4baR0rkiqcFNpSG?=
 =?us-ascii?Q?gbU1EseH12nDwrhKnWu4G3PfqQ5pRzMQ0smkdj7ZUT48tuRQ2tx2kS9ytvww?=
 =?us-ascii?Q?3vY5FEpPDHdPrthB2c8Z7Pib909e8FMX1LfdVFp+gu3MLeUZlgWzqJgC97dY?=
 =?us-ascii?Q?6uyeG1XNvSZ9OtGzBJXscytuiZ8zqf3VVxEZCjL/OKZH0MJd2hK8Y30RNZYn?=
 =?us-ascii?Q?+kKAX4n1WIHk1ZG3FooX935WJLflPC/3Qdny1E887azcw3Xh6MsGOU5UcwfL?=
 =?us-ascii?Q?krA6g4dMCMCIzhJaUODZ79w7vsdkfy1J4BJrV9hLZWkBAbddxiHQiJMaZjwH?=
 =?us-ascii?Q?GGVMRl0fZrQOjjAV7KKdwV99xcx+qO33bOJh7agfX+qar80f6BSmLpSRD/5H?=
 =?us-ascii?Q?yg0vRHg4SrSzIH5qQeZJvb1dL7EokzXBrtk3cGyopoHCK0SLhmqtTjYWjN5L?=
 =?us-ascii?Q?UgrKi5NtzxIrUGAF0LroGfMSJsqs8vwW5vW4DSBGv3bu88lXfsZ95zsS0qV/?=
 =?us-ascii?Q?xD0geS76EvmKn4T5Obc0NJsObcZnVwfOKAaDnFbkILPt7C+wsCjqd0miEu+H?=
 =?us-ascii?Q?B+R48tnEg2GSiaBWRdnfFjMat4yIfjbTxWK4tJz/8OQhGTNSNfMnZxw4JLd9?=
 =?us-ascii?Q?bFJxmqyJCMfINgd+WjuLeImbTOXNdOFvE4MYXANhohk5QvQKVznXv6Usd73K?=
 =?us-ascii?Q?974sEyZZ6RRHYj7N61JGXDO77ayc8SCauOEaJNSe1gSIHl4WaD9wEyW0Bg?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(52116014)(376014)(1800799024)(921020)(38350700014)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CHXj/UTGukNjTB5147TbfViPazsRDz+AYpRwCtCAL3jHigH7QAd6BzOF4APq?=
 =?us-ascii?Q?M1k8jr2NAnLWF2NYknq+EfsxmdQHllqNT7CZkwvAQSABEfAx0hl0CzeM28kJ?=
 =?us-ascii?Q?NVPKPXhybt6tzOduFy3W3de7R64h2/0iS59H69rFZgchxf58hAowU/WfjLql?=
 =?us-ascii?Q?RWf5WbC8WaLw6t11CrIya06AeBBkRl8Fn4HfDhBr8IZ/a+LM422ERhb77eu6?=
 =?us-ascii?Q?bxTqJezRnheC/397jtMbOFjgIHcIOdzvzNT2jkBejAZO8v/Dmr4F9vVeFYUO?=
 =?us-ascii?Q?iZqBNciWQm8GY+W55gael8CMAsTGpoYsogcrmuCbelMw1F+Z3zdSjM05YW0X?=
 =?us-ascii?Q?6tgsPaxR3/ltS4OeWJr2Cjds5hA3DAoQOaZyMUzPgn9Pl2BaWvTAuQ7xW83B?=
 =?us-ascii?Q?47wABFxo7dIlna7L3NUkbXJo/mxeimOf0grunvKMffmCyIEPJ2PTG61mRoqZ?=
 =?us-ascii?Q?i8Wri85A3RJmc3LH7PaJcLQ5bKCNdcj0ZjbtbrtgT6mau9L5QZwaGNo2iolP?=
 =?us-ascii?Q?2IJ4H7JDGxZ+IdmHCcCatSSyVKQqgenqVVYG+rKOIBN7LnWsqlSnSg8zr9UW?=
 =?us-ascii?Q?hRC4zK89XvPCqzg2sWWojv5rNIXZAAle52/rmUsX8P3LTK3pmsFdifANsDDO?=
 =?us-ascii?Q?X3h3bBzbnmnOpPUifv0CCASnDs/4F2AAJkLNvcxuGHfwOL/Yowdac2De9xF/?=
 =?us-ascii?Q?8PZdw18bHmqInphGUQGgpGzmXaPop6QDZWs3dJZhsaHTbwk0ndN1CjotDYEu?=
 =?us-ascii?Q?u7S1NT827eBbj5VuF+mXP1DKhpDkJlCyj80veVD+l1jBlKesH9CK77/f953j?=
 =?us-ascii?Q?+QKKB1pmgNhF5fbuLN2QfW7m0K6Bt+mgp3CPDWXZxt/k4N4Wv/EXpBmkT/uA?=
 =?us-ascii?Q?vntNobJ8nk0XnfXvmx7cU2CSygo0PyGnu3uYYripaGwXSNIuQj4kq14zeTG7?=
 =?us-ascii?Q?4XiZhQiAtgKcQsRNCETN/Voj5H9F5vxy5Wk3NSMASx1euOWJ7tdsnfGEVFTy?=
 =?us-ascii?Q?SOSXwENQ06MFe1ekbIwaONXjzp2u/iDQtUZaYI41UMc6Gs1p/Eu2QOyEN6HP?=
 =?us-ascii?Q?Wg/e3YPPNzmbzguvhtGxs5UsZfWVmLENzhUXMwXpdPpCmqLm/9ciBnh2R8nm?=
 =?us-ascii?Q?3nlsk6FqZ0pr+MYefWkCB89T+pU34MriWlUuuc3d7CV+AzmG+1FFqvZH2NeD?=
 =?us-ascii?Q?r0JjW3cFW0gqOXWyfVE5XaGGAKEjk/DWUgsZDnWb7fY3T2RKKvK0LLKpVhXj?=
 =?us-ascii?Q?3iP6xFNuUgJ5BwC4lAfIkz8Bhg+28J5ZSrwBdtm587E7A6Gc4N+aQwGsd7wu?=
 =?us-ascii?Q?9wS04N+Uu4jFuivq4NAkIXRewoEKFhe/cI27ehp3OQCrEL7fVo0dJXE5WzxZ?=
 =?us-ascii?Q?bYOWevieKdxriEAavNF9B3n5gNZCalBeiLNmDbjLFQ4y10gvdxvfVuE/XpKM?=
 =?us-ascii?Q?gIIZTBzOsRzhyEYndb9jTuj1351/biL9akbLOowQWqC3SxIHU/MFOOMzsnax?=
 =?us-ascii?Q?j4v5yMbsLZAs3ZLLZVAKA7FZr2fsL2Yfp2LvR0CWWcFA8VpWuV0vXgEDQaUM?=
 =?us-ascii?Q?c2HeXHe/BYQBgK+td7UaB4bYLoLstt7158rUDkMfY03zzzCXo/qNYMwTNk/u?=
 =?us-ascii?Q?OoQxGacYABLIhRpWquParIQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6421259-8803-4201-02c7-08dda952b9bd
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 01:44:52.6488
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C/z8lH3Ll2K1dFXH0+LuGE82HBPj1bnNWcXGPYs81HBwXTlh3l5c1HAYxctGwD24CN+kso/QAE2+DfsCbjlOAbYtydQRo1VDNyTcOgRJns2Z0636dzsXffuPKB8YRL+z
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB9824

Current Kconfig menu at [ALSA for SoC audio support] has no rules.
So, some venders are using menu style, some venders are listed each drivers
on top page, etc. It is difficult to find target vender and/or drivers
because it is very random.

Let's standardize ASoC menu

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/starfive/Kconfig | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/sound/soc/starfive/Kconfig b/sound/soc/starfive/Kconfig
index 279ac5c1d309b..1e11aa74594d7 100644
--- a/sound/soc/starfive/Kconfig
+++ b/sound/soc/starfive/Kconfig
@@ -1,15 +1,10 @@
 # SPDX-License-Identifier: GPL-2.0-only
-config SND_SOC_STARFIVE
-	tristate "Audio support for StarFive SoC"
+menu "StarFive"
 	depends on COMPILE_TEST || ARCH_STARFIVE
-	help
-	  Say Y or M if you want to add support for codecs attached to
-	  the Starfive SoCs' Audio interfaces. You will also need to
-	  select the audio interfaces to support below.
+	depends on HAVE_CLK
 
 config SND_SOC_JH7110_PWMDAC
 	tristate "JH7110 PWM-DAC device driver"
-	depends on HAVE_CLK && SND_SOC_STARFIVE
 	select SND_SOC_GENERIC_DMAENGINE_PCM
 	select SND_SOC_SPDIF
 	help
@@ -18,7 +13,8 @@ config SND_SOC_JH7110_PWMDAC
 
 config SND_SOC_JH7110_TDM
 	tristate "JH7110 TDM device driver"
-	depends on HAVE_CLK && SND_SOC_STARFIVE
 	select SND_SOC_GENERIC_DMAENGINE_PCM
 	help
 	  Say Y or M if you want to add support for StarFive TDM driver.
+
+endmenu
-- 
2.43.0

