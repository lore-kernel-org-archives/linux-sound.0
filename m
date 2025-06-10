Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010012.outbound.protection.outlook.com [52.101.229.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8882925DB1A
	for <linux-sound@vger.kernel.org>; Tue, 10 Jun 2025 04:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749529368; cv=fail; b=EcfhPbgZojbD3Hxer14sgvavubdyKwo5crx04xu2n6ugTZP0lDxCcgGj+JFOeRWYc31HyzgjiCHcwB2IHt0QIEBZ89Xy+fKtkTOLl3KT4rXzHjqHAR6jd/vKZ1hfai+VwY3J3h7wbRrZWdh4ZKeUSH/gW3KuuzBp/nYCmiBoOVc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749529368; c=relaxed/simple;
	bh=0OV04JCR91OQkodVsRP0lIM9Qz/GcK6mDcl8F5HkxrM=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=mTD5Wkbp49RJweQr7vRZAQLptnIgdirB8hblhk7UZv15gNi2E+cxHB+BcpdGDqNsYrz+rizYf/TRDLdLo5TqoX+OEQ/DlrXYR0EP+4GPwLBYbupR9zm413OkyVtQein/BCVUMU29DldnkCFXoLZkOnC/ctvrStv0EFLsd+1tpyM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=F6GIS6fW; arc=fail smtp.client-ip=52.101.229.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="F6GIS6fW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IOKGn+ISYIkWQ/YEHCC4YbgckKVWJNWxj/ncaDuTb07PFoC2u58PLat4e+YAhgguJCo2VOK1DIfjHxdZN4ER1OuqrNwg7U5yYuXXn6MShnet7fdxVvBs2NJNDMaCB0ZXHyc8Fabes6bOazBWzP0aogKDFNZehWCjgcYlWmFFS5iWlF1MVg9qnz+Vf9gybC32MpyLWJMkjBmLgN9VQnxDI7hO8H5PNQnSVInp+W1wZssMZVbdzo5Xllt8dA/8aAsi6hIWwVrjzKzIGsGRfa5vOn+25tyVRniZCQ5+dwXyMEWB3JK/pLi49A1jNuh65ENxYUK2dNhfpVzaDIAUZTKZlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jjwG87a8AzN+e0fYH17afTTp+GOhhJHD8pwZ8Gxj+L8=;
 b=HxrH2C8RJM1FW0apF0CEBvpl8t/LFHovCzaU7xHi6lZ1lPvebKamDh6YOn82HVgRy1+VLWldwAWU8BU4mGL6KrFsiFimx1X+/k2dhYHzlctACz0VB3LpqvxqLM+kL/JW43d6KQr6kOfxn80plPvNRJAL1QTmN+3U0oF0A6tTV9QaX6UF9Fm9V6kyOPZqMVn2M54QPjtCWsFRN7XCzytMNvAncTfT1F9c1u5Dskbf09IcbfIgXscb9iXa+W3m8W72/BGigOa6iIPGX27avIduxpjQUXQDNUje+oH8p1m+t0u326DeCrN0ikv8Ao/+0iT2lG5/Kc5q8+ymJmxfpZnSww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jjwG87a8AzN+e0fYH17afTTp+GOhhJHD8pwZ8Gxj+L8=;
 b=F6GIS6fWsGuOmw/od5TJwPMTJa1ba5YrcI9ryY0bBxuCEWpUtuDcQ+vRipxy+lxmCYah21og++f0pyo4fcZhU8CzDXKd/6QQSlzZixIKqt5LXK14gJoEN6VOG72tFDJavCQGw0dAtKuRwfIr1HQBw+MkkJMrt6B4QtHZGOx3+dM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS9PR01MB12373.jpnprd01.prod.outlook.com
 (2603:1096:604:2e8::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.31; Tue, 10 Jun
 2025 04:22:43 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%6]) with mapi id 15.20.8813.024; Tue, 10 Jun 2025
 04:22:43 +0000
Message-ID: <87a56g6x9p.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH 26/37] ASoC: xilinx: Standardize ASoC menu
In-Reply-To: <8734c8bf3l.wl-kuninori.morimoto.gx@renesas.com>
References: <8734c8bf3l.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 10 Jun 2025 04:22:42 +0000
X-ClientProxiedBy: TYAPR01CA0134.jpnprd01.prod.outlook.com
 (2603:1096:404:2d::26) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS9PR01MB12373:EE_
X-MS-Office365-Filtering-Correlation-Id: 68f40471-48a9-4928-58d9-08dda7d671c1
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|52116014|1800799024|38350700014|921020|41080700001;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?0QOcp9k8ur7dnuRE63MHqojb0Fih6rkvJ9pMulmUyoc4kgzCfObtNAnhKBZh?=
 =?us-ascii?Q?6A9vIwG/sNOf+uZ5HCwKjrM1DkzMyElcKsy3qgfPGD+xbse8plJBcw3iLCFc?=
 =?us-ascii?Q?BjOf4kWMDkIcBEYJPKGZPCR4MiTVKYmpeVvSYL9YS7GhoEai98xHvR8m4kqM?=
 =?us-ascii?Q?oJLpR66PqBK2pnsAkz0qNwbyQUxxPvMG2snuMGY7cz95hfc+F7LY37ozzg+I?=
 =?us-ascii?Q?tBKp+5aGGSAqD06mFPtXWJ2DT4KzXfIuTniBdsS96Q361XYaRoCOO2ZG2G8k?=
 =?us-ascii?Q?YVXOa4NunR/+XMiyuGNQiI8J0Ed+NEcD580PtjF4p4yYcW8ZBSSrMPSi094+?=
 =?us-ascii?Q?HIokuoOqANIDTz+uVNSvh5O2z0Ipd3rNed/G1kGOUbML2TKrR6YUFOG4COh/?=
 =?us-ascii?Q?oKUqWUNXCz/45MvPQ7hB3cFJ9MCi9uQC90DsY0t2NtTVEfgZ1f9LvC4utY5c?=
 =?us-ascii?Q?vdpiTrW7XuIaeGfDZ4QUCq4qilxmeF2JOVz0MN0vG9YxHJElRYSKB3l1/5/u?=
 =?us-ascii?Q?/c9jbfJRt7krUvdz6qdorH4jq57T8MCPucOJqMPfFfFh3zXDiPvnovlONVAB?=
 =?us-ascii?Q?63kaxZaQjh9PY2ZI2OQ57H4xGukb06kJDUIRER7sxoejRJWyhg2QFBqyqz7T?=
 =?us-ascii?Q?LdU0ZDqC2sHl2LX9VLlUYPkAP7u7J4mOQOu4MkLGQQQC9pZ6uP+vuZdlPrvN?=
 =?us-ascii?Q?SCmDJPJigGNOpS6xPDkXzbwWrnSw0ZIDKbMiBDJzvgR8WkKr1Q+ete5sqXRv?=
 =?us-ascii?Q?F73KXfNIYzH2/zJyNQ/YxFuWu4H3eAHrOMT9IWo/h3j3QckyoYCP6/d5JyWH?=
 =?us-ascii?Q?x/Y4P/9xmMXfzMxnPimF5GE8UZMtaavAvKDrjsKyxI+pAMunik8U+Ge3NGA1?=
 =?us-ascii?Q?GssZ31nxvbHuFm7gbz0+66AcM/Lrtnz+vqmM0wYoNyrf7yvYqLU59A8Huw9H?=
 =?us-ascii?Q?0ZT9g1Iy8STWwr1JTZOahYir7abk/YNUjpGORuDFgdd6NvkF+FjZcdmTA/vH?=
 =?us-ascii?Q?FQzp3hsyUekMLJ73Fl+I2qRrhsPKx/GNy75i245a7k6jq7gsROwe2TGk2jFE?=
 =?us-ascii?Q?6/zG0bzE1FFRqnVVO0eSuKCerwTXT8AVhkvPghLldz2JLvzEFFx/agPO9iYZ?=
 =?us-ascii?Q?S5HBG4Hr3KfnrkadMzVmKonqc1493tzT7jZARidTgZw1xj5eYp4HliCPDmdF?=
 =?us-ascii?Q?8NNALw6mFWg1ccBDIbC/fvYo3Rk2WBQ47ZC8FSrmKEtxWhWKKYO677Pofzr9?=
 =?us-ascii?Q?iT5+SDG1L3vWa0Vcig9HKrrJFhrZe7ikiBBDIo/0shnGlsHaa1p0+QEksN7k?=
 =?us-ascii?Q?LP5Ujbj2n2V++3nNp4kOqIqtQys9Fjs7hPCkaZUf6xJPaRj/T5KUomuEbNkO?=
 =?us-ascii?Q?DWlQVWRuUy1etTXWUOoyr5Trpn6kWaiZNVCy+VLPMkXhDxh8DP+YBWTZciPB?=
 =?us-ascii?Q?PuP9dR4yLDM45lNlPE6RklnCaBzX/VgmsUd5VYKlNw9J8w8PEwLyDG4T5saf?=
 =?us-ascii?Q?bzwlA+iiLbvNJ84LY5Ul3VxdhMrTrDTJ1fpGgn0nCgN4fm7WnxSydc54JQ?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(52116014)(1800799024)(38350700014)(921020)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tzNtGHLtGHtiNhz7CWI2I4vVtu1N+cM0kwFV0oA0DHaRv7VwkaNt35axtcJd?=
 =?us-ascii?Q?evyY8pM3RYKYOZUO1fVfeU/mRqlhjH6378nn6RI4Zk46MzhYbweNFUija9Dq?=
 =?us-ascii?Q?vdmItwyNa9PHZkANvG1zOnRWsYQtBZGS1FV2sRe4fHqWqjTFimBIIyC4CgmL?=
 =?us-ascii?Q?KLS6jt8J1nxPC4vi4caeiBV1OPdcx4zFbuxsclJ2ietE37rZd5ou4DGy7u1d?=
 =?us-ascii?Q?b4JK7A69Et96sk+rVTbhBzu7AsVVzdF79WMhr0ul8DwIkQUV2gLRwayyGcll?=
 =?us-ascii?Q?EkSPUZVEmo4w7fptxfEOPfCQjbT74GgN41n1cBZAbKyb9+ccVDsYCgLX/Y7l?=
 =?us-ascii?Q?jgX5YwexPrtaouwfYe6sNXsad2d7W9AuB2atII6GIVWrLTs7OpehXX9rOK1z?=
 =?us-ascii?Q?XO8YRDFFWI8odeeyD63SOwzhfflKgwg87aTWHoLEsGelTr6xi4fBNgmrHDEA?=
 =?us-ascii?Q?FoxumALzw1PpKFPhgX9H6ESXkQcCAVK4Ev8wFnIAfRQcU0ph6ObgYnEQ6OZh?=
 =?us-ascii?Q?DdZTvyQGtfhvcrt+cl/EeZyaw8NKaSb5h3R6DAuYApSkMHOO0fynqUOZl3IM?=
 =?us-ascii?Q?JlcNMtfGt7iYjZNFOR+81upvvvkgZ03U+026lNDo674lc9AWBQYIFkJUS1sv?=
 =?us-ascii?Q?orxCeevPKKLiVwiS5MmmgoZbV9WmYCJTs2fF9iTUZZ+0hC/Qzmp5LJdnS7hQ?=
 =?us-ascii?Q?633S8mb5atkH/zTzaz4ap2zPgyxaH5OQpsb4dhiEBj8A1L/9mDUvTS4cuYGX?=
 =?us-ascii?Q?O83DrPzl0maphjJFzGoVGa52ZRijDxKIldEk17AkJEp+GJEs40RM8uxR/JlJ?=
 =?us-ascii?Q?yN4L1lulhQZo9fY45jXwnhyRGTvOEn46McuGyyirzS7czSz0sPH/tZdav2Ir?=
 =?us-ascii?Q?LARSpirppmPiyyjG5zypexnjVIpXpy5IWkU1wQkhYQ4b4/EsFTjAgxUtrrmG?=
 =?us-ascii?Q?S/DHjAMQTKMPWvx4OeI2+pe2ioKiNIPX009Bq0Qw6AlQKPKKgdEkY67JcniF?=
 =?us-ascii?Q?uLikQTWmQ3QrnQI6y5vl6nXpwiR5gUAuBQmHqpQmwn2tmqP2f4wT4C9dfxUl?=
 =?us-ascii?Q?wfpID6hXCigh7W5dvNPf/bK4YfYR9PZxQZj70Jwn1br4wKfSrcKqv84gf7o/?=
 =?us-ascii?Q?/9RA7Sqm0CBQrGlyqhoQFC8fJjIS0FT9mTPYzoJppRJQpXGSaqEqCMiCNw5L?=
 =?us-ascii?Q?d3FBWGotXW7W0L69JeC60LUnUaQ6xMCQ0x7wRr+OPx4eurL/JeBvPA+LkesH?=
 =?us-ascii?Q?A+PW6beOgnX4s1jMQE1JzgC6H0/lylg1er3lwLDF/1jE9aAOJ7xhcs2eCAJV?=
 =?us-ascii?Q?j/x5sA3RdYMj79H862dO/nK9rVYy74nfQaseXNSG04yNMIMviQ4I7CLh6IiK?=
 =?us-ascii?Q?oFcolJWVzuMndejHXLokR7IsKOC+GWbJkXF63nXz13nplZgBIP9F+MlXfVZ9?=
 =?us-ascii?Q?wL6CHwkcLsV+/wbQ3hcIxjePdb7FJUfrjWjYAEAH8tLyAU0DT1pev9ZU5lCJ?=
 =?us-ascii?Q?SkAvs/GOgaqveDSEYXak87sxNwwTpiawjbn+LGLqpCrJuntxyDUMZQggeRet?=
 =?us-ascii?Q?vY/hnROpfMT3X2XSZLMR3gBHBZjtNi5QmKkL0cAox5SY9ITyqd11w+W9xKTz?=
 =?us-ascii?Q?fIs151PxEJ/TtVhVd/PHkMc=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68f40471-48a9-4928-58d9-08dda7d671c1
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2025 04:22:43.0998
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8SxBAcNg/33SBE9bJgVhM6lRi7ljWnWRx1JgM2Zy44zPgBxeBWMvp34kR+yp0FvU5ASssu1NmRlmNT5HXjXnESebLcAgFWnv9aW6u0N57/ORKAUrVCqvLlDuR3EIvRnP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB12373

Current Kconfig menu at [ALSA for SoC audio support] has no rules.
So, some venders are using menu style, some venders are listed each drivers
on top page, etc. It is difficult to find target vender and/or drivers
because it is very random.

Let's standardize ASoC menu

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/xilinx/Kconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/xilinx/Kconfig b/sound/soc/xilinx/Kconfig
index 5bd2730aab76f..27fa42361bb90 100644
--- a/sound/soc/xilinx/Kconfig
+++ b/sound/soc/xilinx/Kconfig
@@ -1,4 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
+menu "ASoC support for Xilinx"
+
 config SND_SOC_XILINX_I2S
 	tristate "Audio support for the Xilinx I2S"
 	help
@@ -21,3 +23,5 @@ config SND_SOC_XILINX_SPDIF
 	  Select this option to enable Xilinx SPDIF Audio.
 	  This provides playback and capture of SPDIF audio in
 	  AES format.
+
+endmenu
-- 
2.43.0

