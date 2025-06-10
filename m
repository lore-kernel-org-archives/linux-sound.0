Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010038.outbound.protection.outlook.com [52.101.228.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA6C22571B3
	for <linux-sound@vger.kernel.org>; Tue, 10 Jun 2025 04:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749529216; cv=fail; b=uqVbrI6QnRwoZUJkhzii+w4KDLnrbHXCclSDcdGTJdVZguZb7UqCTtnxPFa8+b8EJWJ8SJHmMCKw4qKsc7Yh9R5dkrFEv+NkQ7NW8SE93D1oJW1PPG1cMmQ750usvCYKFSXTQx76XmNrkiVYtJuI1ulyqAhYjF0y0pu/Ku/Ei9s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749529216; c=relaxed/simple;
	bh=mpVsbP03dGV8Qs6TEIb/DMzazftdTHsvGkTzCZEqeD4=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=o0eZECLGQt7uh4XFuDujkEwkMyLJKESeOhhwIP8Y7DmoD1wVvABs/WFSFEISSfQcsMnllrC5xjZlCaloKv/eteCsvYVG197unEmTQglKuK2MZ4pl21BOlPIjlr4I9BNQjm6ME7fGjXGfmUf9woUdV7u50XuXphpvjWZud5tiiXY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=jGhYDB7o; arc=fail smtp.client-ip=52.101.228.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="jGhYDB7o"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NIMqJ4Z5h9q+7x8Zh4CoP8iM/QJRF8yrhEHhTXzvYdxFvMAvCT087cBlPkccTV33E6+R/CPZxF1LFKAm8/5+Nsnw5U3u5kGnYSLD+j+6WDkDvY5nFhI8bDFrlaF+EHOz1c6dWJySJL7iMl9/1qPN2RIHyJxn3UABBm5LZLmY++daEtOepZb3Imsj/7N8KuQk/vZ0c9dLLecyRjRM7Y3b2tucq4SU+Cdc384PpWEFIid37aKZV2KFH4SYWLtZ4dMKVTL5hBSxDQiyQ9L6IRBzpllpTfnZidD3DkwDiym4Br2q1NF7TzrFNVeirsh5oJeMTcO5tP9bEr1ZvrN4uUZXKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YuoQRXS6FDsbI5Rd6GlULNRj7DVjPBcUZj10hswuaI0=;
 b=dHn9HkoftnNgqA3XbDLkUjfl3empnT6FRFxuqFkSjjD90PXN5/jOxsS+x3PEZCnTXEbQYOOR8cwhtRBDlroL/iGswWB5obUkpeKjC8KoHHWaY0jVjHvXlJ5q3eLD3z6ACrPkZALQ1frSWMQcQZndvfrxNOwZyGqgYml9kWDPCU/7A7OA4Vb3Dv5tKPTQJqe/wGDFf0d6Qa4yuTXYUb3GukqFmZ9TaKZ2PSV9Q7hD9rKbxaTJHPvvTXy54Xk9t9GRbgQdweUBeW/cXzNAJ0iT8AzMbstmZolKk9zSXShy+APDcHR0NJZh/T7p4cdYZn9LxikahNIQ1Frcusb/YmEhrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YuoQRXS6FDsbI5Rd6GlULNRj7DVjPBcUZj10hswuaI0=;
 b=jGhYDB7oXMtrWCoh8ZJK1K6U1v7IzaiLgPm6UIJKPEmhWQ5dmVGGB/qSUuu590pvEK+Xv8Lq3RwmGAnk9oFWxHyr4Tdsq13Pb08RiYUmA5peNjLjyrloOU2MKOi2bQQ6ji2c/RtTWvvXbvZQVCrBxPz13EUnVFnAR7Tm4VbQLXU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB10510.jpnprd01.prod.outlook.com
 (2603:1096:400:307::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.31; Tue, 10 Jun
 2025 04:20:12 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%6]) with mapi id 15.20.8813.024; Tue, 10 Jun 2025
 04:20:12 +0000
Message-ID: <8734c88byc.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH 06/37] ASoC: fsl: Standardize ASoC menu
In-Reply-To: <8734c8bf3l.wl-kuninori.morimoto.gx@renesas.com>
References: <8734c8bf3l.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 10 Jun 2025 04:20:11 +0000
X-ClientProxiedBy: TYWPR01CA0014.jpnprd01.prod.outlook.com
 (2603:1096:400:a9::19) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB10510:EE_
X-MS-Office365-Filtering-Correlation-Id: bef17c54-d27b-488a-8c4f-08dda7d617cf
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|7416014|1800799024|38350700014|921020|41080700001;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?0q+ViVcBSjf9JE6BgSLdy/V4+QOYnJZqZEFBE33XP6+ANBJG2AOSS2W9vi2v?=
 =?us-ascii?Q?DMjsCDKEAsS2m8ba/Qar5w+KI4BHLFbkxHMqYy95KVoiv2xyGughLLdWtFAl?=
 =?us-ascii?Q?vqHp1wmSwK/bf1gyaS/+9HKU32BhbQKsBywUoTq8RIwEXkCKzDpVYoFdEnLT?=
 =?us-ascii?Q?7ocTiKHtoyVFQzSMi/nlVWI24aDjS8Rjsa/xtNUGROujMVnoeHoCKIMJna9i?=
 =?us-ascii?Q?6hMPBN5rFEtjRPfc0JQaoVPDSd0k3zYxRs1wSWAqm+5jRgDDb3qkn0cdPvwZ?=
 =?us-ascii?Q?yvqToJl0oxd2OD0bJd1oj7IczkMjF+dcgZizJQrtE0kRx4asM92AcTrC/5Ov?=
 =?us-ascii?Q?hETqePHH4geG5KOGE+Hm871rBvDq+GD4Tg9d55WKYXFGt+5TXQmziFuaOVZO?=
 =?us-ascii?Q?R1bc4Uxfpe8wyQ0ft/fAj1wu7GHAXV9/rEx8aD00idrgWb5B6vzF1Sijw13c?=
 =?us-ascii?Q?/HHdCBW7mdEMQrG5BmmB6mjVmKiJ/GXoq/PPj4AynuulLmDzOKmEf2WGw7nr?=
 =?us-ascii?Q?neLJdUa3gUUJYunLmrFYmlNZ5oH4n4x+lZhquqbmjHdruAj7JS4fqYjnK8Yn?=
 =?us-ascii?Q?WofYWMq/G6M5Rk9uR05jr3+h3Nl2OOEdR58nezCU2zYZOlXwaLKj68vMc5Nq?=
 =?us-ascii?Q?XTYtQyr5Cwb88cj2XqM2bMHUIlVI6yBDgeIRT+nlfKpxFSjtFb3WPC6jxit4?=
 =?us-ascii?Q?lRlaoZYPfKNknzR4hW46knwkCxp6yS9Fqv+I4hVFLsfC20xDnriIDMjPjaAc?=
 =?us-ascii?Q?fzklnln4NkoAKCzY7BnI6mxue7h2qvzY+9uPnWoYe3B2dN1w2Y70NqcH2G3p?=
 =?us-ascii?Q?4YDmIeNsf1xEhur5eliMJvYNT/L1R3indgaCehN0SUQVPZNyUpH2Ce/jA6om?=
 =?us-ascii?Q?/Q1VYgFdRl6WtOxOGDfmBVBFzfkIbcdkS/tQrNIyNH0oBLlKcTol+LU5jePj?=
 =?us-ascii?Q?4bbWTrfEfST71Mhu51zzxHDns9A+uXD61UwKlc+KqtNaN6Cir+qMkzMpmzRR?=
 =?us-ascii?Q?v+RzRU7xKzZf0HSeprcgwRLHtKcd9y4Sgd2GVQwGKhd4sKhiFE7BH8MOdHWU?=
 =?us-ascii?Q?aEyENEqPVR5V9BKNYy6oeX5v1kZsNGDI5/n7d4NVu19g1nGIeCX1g72QrZaQ?=
 =?us-ascii?Q?W8dcgNJcENu+xzZj1/0OR03P09vyrVQwy7IzpAkNnEYW6xbbXRlvqtqNte6Y?=
 =?us-ascii?Q?csXs7ENMsAkJLvRtb/NCCW7GMJPm4SToAZEH/Oi+CS0zf8waMtYGN7B8SjHv?=
 =?us-ascii?Q?8agtVblijS21pAyUum8A1wFdq5I3XzawZAJXe0fHpmw0+Ux11vhegHdQUTsD?=
 =?us-ascii?Q?m51lCQSziuzefiObIM6egoYogUK03HBz0fR5gE5mOCTNoIiK4/r6uMln0/Pl?=
 =?us-ascii?Q?YTTG3pQqxteDdNVW8rp/TBpz7rGrcCkwv/GUzupvAbMN5jltljwclLYkT/Xf?=
 =?us-ascii?Q?WFDmucAvw8WcEq3pAlMA96m+M4ko1x31FCSP0nvbCeU813rTZhfx1378tZi4?=
 =?us-ascii?Q?w5UVPva8SzkOL1dnCkFSXJ7jpZU/8XnDolbFNbj3kYt4xMXISwh7zpP06A?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(7416014)(1800799024)(38350700014)(921020)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UdD3Fcy3LVgkuz+CWEFfAWV5zkeUaATpexuf6xrq9lV7eZnIS7THIlR0izpr?=
 =?us-ascii?Q?XnhbTvAvd3X9MqfSI8b6qihptzNv3lcXWFebwOf4Y9z26pi7ysvP72YG8C1G?=
 =?us-ascii?Q?iFVrLtD3xLl/g3bFmd3x1guRnUz1HTAQ6BuVKLarkmzd1c4yAG+OC0MDdFxg?=
 =?us-ascii?Q?Ok14JxIlUhGjMm2DSHZfc9kBIs4VFDK7t7Odj6MJjhAvhL8ACfd8ylXRFgeR?=
 =?us-ascii?Q?BQ7n1bMPUInEOMIDmCJ0fG6JXAmROUXQ47n/ZPoWfP4ddEYgF+xzAJpM+qNN?=
 =?us-ascii?Q?iHRscN5oqfzrYrfdKWtI/cnsFB5ST0HNcd44aNngvbJ6f6i3mP7ABxao+7tk?=
 =?us-ascii?Q?tIIJHJW/raD6Uc5oB8Dq/ZOC3UDSc9DpHuB2EbEFCwndF74AMU54Do4nF1qP?=
 =?us-ascii?Q?cQsHZ1yi8zXEQipwg6DAP8ar1kJh709og4/Gvnw5krdvykg4yPb078kH1kSL?=
 =?us-ascii?Q?Sfa7xg3MBa8mLVOcSvUYHhtl869loavSuBOtdy9svSsAJH0TjF0mi8pm7ouS?=
 =?us-ascii?Q?NZFuPcKWnQDOxYg5KcZtUouR/ZRp+D/pBpnA8yMK4zA4gwacMHPYEzvPd2Qq?=
 =?us-ascii?Q?jAPeEVkTlP6suip55LU/QcZqoGw1yTOT6ZFg2SuZb/snLMQcB35WAcI2wbWV?=
 =?us-ascii?Q?ReJeC5yD+KvfZpoPqXqbNSHis78PPcIUaMKq83NLeBliETJd5EKzPAe2LRE2?=
 =?us-ascii?Q?HwBbcF9Nd8h01zKBGUO7XNpyb6GVkCwVcvoI4//iWo2y44vk+0gZO2Qbtvl1?=
 =?us-ascii?Q?ZqvjuEAgSVEH2DazxSWhHfCaC3JB7V+fLq/YTPYXaMRZ0PXVTe2SJpl/2xKt?=
 =?us-ascii?Q?kjh6w3xX0C79yOPB61ZmSL4c4L1A4aIF4ulf8usuGuuK7JnWxLtamXWsBjzO?=
 =?us-ascii?Q?RbO2jgRCVdr4zPoDle/aOBX1fSnTlodVGZBlqiSuS8tzYclGstehajml0qk6?=
 =?us-ascii?Q?mqiokT8kECCy23VYPJ2t6faHlCOiVH5Z5GYNPrPymhg7WwNLuDufxvxiGcGP?=
 =?us-ascii?Q?tL9iBJa1DVM8zKz2FRXZm1RcNtoKeVYcYEnsXck4X9PoKQyAz9m/p5H//wOu?=
 =?us-ascii?Q?TxaEoyalF5krQYGNRg+HFnjPbQwUXtiLuLgzLO4a3NFMj0VOU7W02sEEoiJF?=
 =?us-ascii?Q?TDRRSZRdXhvXZ0C9tbBbxmT2rv2zYK1C6kMQo1mRtaWdJNg/nTgWJBxlK/x1?=
 =?us-ascii?Q?1QNOf+F7pEgzlNd1SH3n3Nxe/mXS1AKHcMtYfEuyirkYmcrrBlRcvhd6iOTA?=
 =?us-ascii?Q?q35Q5mqzAUz9AFkiJd+zhnD5bhbTxIhsGBFqbkihCEpOGNLt3Q2BADBodScX?=
 =?us-ascii?Q?T3HSWPmZVzNf5uNxcb3fWdBG5HrZZXUhomHx5ORKIQV2SQ3Dl6IKzQeGYQ0g?=
 =?us-ascii?Q?NRibOU9hQL/xunyPaKwcYdAqaV2iqCwCPwWPH/kg5jWcQ1kHKDUipYvGzWyQ?=
 =?us-ascii?Q?xHlaacutqTiHGnmdBWuvnE3dMM8Yc3WbnKw99VXEAHqNi6CiUVKw8KadxJua?=
 =?us-ascii?Q?hd6MWREWd8FTJGRgSfIK1hqDswsVyT9ae6+6eutoaCGivbFne1HBBXEVjJ+o?=
 =?us-ascii?Q?JgLMQxmFAX3uJ8pq80aRkWTwqMaIcW3U1Kh8QoKtLDvKGSwLiuWn21+AQIQp?=
 =?us-ascii?Q?lu6oRcyBcZrCc536DBCNMkY=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bef17c54-d27b-488a-8c4f-08dda7d617cf
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2025 04:20:12.2415
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q6u8ePz3+wEXpF9my3NYa/PLqfY8ZT9z56t88ZEABcX62LJILCh5Wb0Cl7pZrVTHzMgCfiiUx2dqDI1VfeVzKqXeUV6YeCLmdaIiyNBHPeSLYRrHF+HQ/LFmHQ76F91e
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10510

Current Kconfig menu at [ALSA for SoC audio support] has no rules.
So, some venders are using menu style, some venders are listed each drivers
on top page, etc. It is difficult to find target vender and/or drivers
because it is very random.

Let's standardize ASoC menu

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/fsl/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/fsl/Kconfig b/sound/soc/fsl/Kconfig
index c4cf3cff58ded..1dad94bd1ff65 100644
--- a/sound/soc/fsl/Kconfig
+++ b/sound/soc/fsl/Kconfig
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
-menu "SoC Audio for Freescale CPUs"
+menu "ASoC support for Freescale"
 
 comment "Common SoC Audio options for Freescale CPUs:"
 
-- 
2.43.0

