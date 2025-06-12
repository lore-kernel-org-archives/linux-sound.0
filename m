Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011046.outbound.protection.outlook.com [52.101.125.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B84913C9C4
	for <linux-sound@vger.kernel.org>; Thu, 12 Jun 2025 01:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749692563; cv=fail; b=C3W3m4tN75kEQ94p379Iv6NnBsAMQ0kmXUm3X3TvhPWRi0xbgrj5DpsZ+wNSZSySGbNofSUnKS02wf4/37SRyHJTiu53gx5n08RBjZvqNJqiTMW3F/XmKfUBni7KZP1nPH2avmJqhYv9ncstBT/QnfIQFBwdIeDuKBXAQqYURLE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749692563; c=relaxed/simple;
	bh=4LJsdXS3uFktkOomZUlHJACugvA9l4ERwaGkGV06l7M=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=EgeHcf1P087dgUtxWRQaYwyCQYVEfEqM8++JpzuwfKW0QHVL/GqCBUaGuUNR0JZmsiztX4bsBaamZ7TXYuKwexsL+zJE6q4BnEv/8y8kMeu6fP+XdKGK1av9kvUSuCCGtC4ZDfh0Br+ZlNFdUy3JTaAaM7pgh4f1qQbSAk/Nwbk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=hrsOknDL; arc=fail smtp.client-ip=52.101.125.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="hrsOknDL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gA9uxqJX/bQIbRyQmOWw2sOqrq54Cjb0SB/kv1A4npIH0gTx+6f1ANSzJs2+pfs26WUJfHKzaDJQAiintu1dSK3aNmTIZ1w/4irI5czddWV65UEuq+IJ1MOnnu/hyc/YAA7RT62tzzlGn1mPI1FR620NLTSo7Y51EXN/38CTFS9pQ8XYG1jkN4JwzX46jpiQ2jPZoN8Bu6sHgLwtBW9bPpj67wE7k+AA5PuqlYYKvCAFUvjkZwdhAAy2eTckaeA4KoqBY0mnkB6IuOH/+XIDxGDWAkMiGyykonoZBPNTdmpu4ATet3FZY4XbeF3HPXUtmJ7GpDq69Wi64MC4VhDonw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YSyfSGt8/ar0f7OjS7lwMG2OMkIhVUkl7n26fCsClag=;
 b=UIHbNleVvGtfmjINJxDbS080MWRaS6QgMBiBqLIigv1kEvC5aCmPSrBgRMQaXARv73OFUqi4NoQE4SzNdyBbNiSNiUx+b/ZqwkuJbQMcXuHD+EQd3NbX49FLlnfdqztLUC6EYvDhUKHdPRWDMzWpo2jbgwXnm9tgRMWw3uQ7zl7TTvoq8DCn2VARXV02pcpqStMnPboY/Yf8Q33BH+PNX/hakPktxsGPOU2+YnYs7+XoEt1nD7vxkHmfs1qNJuSQX1WE/4Hga1RiXZO5LZgwCYu0PZe0+U6SR8S15OV7pADFUpGmkgCtQka7GVJzqvGez1ulw/zFuZb8eLZJfzjHyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YSyfSGt8/ar0f7OjS7lwMG2OMkIhVUkl7n26fCsClag=;
 b=hrsOknDL1YQKexc/CNbZYpwQWRAFYWKe95sPLLnRwG2CVUQPaKG22QrlleUMT5oxNuqDHnTzRuyWReRbTGT8PD5w63zdfTSGMmKIf5UDs36T+iznhqz4/1e32C5wya8tT+PPXVPhjKY/03+s+oLE1jvzWxXj3cvJr1K+DJSJDak=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYRPR01MB15122.jpnprd01.prod.outlook.com
 (2603:1096:405:227::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Thu, 12 Jun
 2025 01:42:39 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8835.019; Thu, 12 Jun 2025
 01:42:39 +0000
Message-ID: <87qzzpzqep.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 10/39] ASoC: sti: Standardize ASoC menu
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
Date: Thu, 12 Jun 2025 01:42:38 +0000
X-ClientProxiedBy: TYCP286CA0322.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3b7::11) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYRPR01MB15122:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a0d2396-b8e1-4867-6aeb-08dda9526a4a
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|7416014|38350700014|921020|41080700001;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9pram9o4ngv8iXQRgmtF1UuplmhvxkTMjWny0EmmcibksWzj7BPCL84hQ+YH?=
 =?us-ascii?Q?9fYQqlRX7cd07vdz/nAyH3lrTM3pPtHK03mLZ851hVbkmXoqIDc1W+wlzuNB?=
 =?us-ascii?Q?MDhtCBXntB8ihTJ4+6yLSFXxGHh7CXegyrfLuXf9wdq1Kc2q0jMH4JcN3ZNh?=
 =?us-ascii?Q?3f+26836Iap0wWB3HXIcVOoBxPaRf+vZgD2A5GTrEmpa5s/7XposK52UpAz3?=
 =?us-ascii?Q?K5/JrASTptOmfDsbpq9spwPY/t8YuA3biy0OikG3uGHswtrOYKt4BCMWdFRW?=
 =?us-ascii?Q?9c82Ql2FvtV1vf4bplQFVNN5C4Hp9kyGxa88G4a6UpfeEhCTDXwEG4nYu0My?=
 =?us-ascii?Q?XIk9SDpOnOdn3L2RnAD2wAf+MBotVef67n236vC6TLzUIdil+PpbtN/4woV/?=
 =?us-ascii?Q?m0DznBr0ui725XH52SJXRohTAyGML8ta69KLwN2o7/0a+DrjNw4ZAVRL04Ga?=
 =?us-ascii?Q?BKKcdRkSLYT2u0FAlyhy77jtH/dAqK+k84j/snAw03oP2KO/PBxvt+oRACCz?=
 =?us-ascii?Q?p/oTcDVBP4PH4Q7ZFqxDJzig7fpnBaLn6UCQM20rjrajXLdJs7J+HhsWSoC+?=
 =?us-ascii?Q?d3iLt3pbqQDFu47sbsvHF6+gnW+IxslcY6kd/PDvYqPx/v86/2gbocZhx0l+?=
 =?us-ascii?Q?IuDQ0GONzK+xEazcSQuqMI2NPDJsgm7pxaPL5haK29rflMvgWzBZKMYd5YVQ?=
 =?us-ascii?Q?Vro3q1Hv4n+r2Z/XmgQVrrn6nfIqqhS49IQT8spd31yskJT6AZZH1NFo4cLZ?=
 =?us-ascii?Q?5WfgYu91pgvwm+P2uuL/lmsfneVNCvXl+SCifofPeck8sJF9NKCezgXeUSlW?=
 =?us-ascii?Q?0z3W6674hFC5TViPKw0oXusaUfmAmH9okNnfrMiqcW+HDnQ3LKJ+Ph9OvS1A?=
 =?us-ascii?Q?SCburXzLTRsRxaIKyU/Z/l3ZFY6Raijs0iXSPKWzlIc5ILd8eincG06xmM4G?=
 =?us-ascii?Q?aa1y/LurmsDvhq4bWRFw9SK3y1PZRSjyRJaqyUhSWuY7sbBVK8QxQuxB1Xs+?=
 =?us-ascii?Q?bP1R9CsxDXxBvDeIjJDfwK7wSfXgaKmOUGJmMfKqxRDRjnYJV64cSE+jMa8K?=
 =?us-ascii?Q?fYcqVm2wy+2ZqQ+I1tYXuoLqoBf6Lfyl9rPe/di69XZQ46oqSjo1RfhTNs/s?=
 =?us-ascii?Q?JFZSNbUJ7Rz2QimCsyA9pzJXfK9ieLHIH46sdJp1hQS2iuQVSuLuvP4bz2c6?=
 =?us-ascii?Q?+9lAEMd58g4VFQhAblZZVUhPXQwdsjUX+cugfTju4N1OvbngRtGATUNxTZqB?=
 =?us-ascii?Q?RpCdVfDzZCrs/1htOAX+ofXTc97aufXrwyTZSKgdJ7PPKXp2MgC/BwwMme4J?=
 =?us-ascii?Q?jI/Ewd8xWdhUk1gydIFHtvyon97vz9CDlrCIuBWACsw2nakPhnC1nTerYAPn?=
 =?us-ascii?Q?v1iTNy61tZ1E8Eu5AULr5yvnj/Pt2fQHBwhCaJ8yzzcK/8tAD8ONE7Qy8d3/?=
 =?us-ascii?Q?5iu4Ud29wZwJ6+roAKz19IO7JKg3GsphfO9TfpYvOJ5o8Ufoj6/yoyo5Tnww?=
 =?us-ascii?Q?TlrGNdHRtw+tMjHdyAKRl2oRlVN2DZ6MtCenvHXy5zTcoYMaHUcNOeRVeA?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(7416014)(38350700014)(921020)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?epQU+NjhNOOzOTQY2h8MztCYGRNXmHun3tZWcMO240UV0ipevLu+Z+f+uugn?=
 =?us-ascii?Q?VjsJLCgEsLBZqu3xCn98vz60usJsV2x1eIUhbRo5DdsdLlOiYK4APE6dpTsW?=
 =?us-ascii?Q?qL6/3ZKUsA2zCa5HtxB7nFh7g6lxWEqh24SNxh0EGp5FhcDVrfZEZlofZVH6?=
 =?us-ascii?Q?PfmC0mPiFKLH9FDYUslG5btyiwSGUhfiWxO5yHJYjQmIO7jdJgfzlnmtshLw?=
 =?us-ascii?Q?AG2Ntc+VBLJYsfo78nx9+FVjyCRoXYu32UJwapps8t4/5XPto4EyPzAEpbi+?=
 =?us-ascii?Q?RWyzV9YY2FUq5S03iRS2bvSUJ3emmCk1FShfblzZnvFKhB9skB3UA5Nb3ErR?=
 =?us-ascii?Q?ma4iFC6gQZTJ8ZvJYxkkLaMIdiOYI+bQAb6EYXqIWbyadyAuztPTgC+15DPc?=
 =?us-ascii?Q?I2mDZcvt47uW0iwXaE2rWSp9sjy0P6ILT48QUGqS8ypH22F3mkZg2T+WRRvp?=
 =?us-ascii?Q?LUVe9KX7jkplLLy/cshj+LwhvpjP1bb6BgTsYSuHN40UWMG5rXNnjdb0hYio?=
 =?us-ascii?Q?m8vbnzgRmuoib69rmoTs2YEI/v4m/Jwyo8XtsvoBxasXKgO40BRC5UuVdOUQ?=
 =?us-ascii?Q?onjJrJpcvxKusC4xtRIrB9m1Qnf9kO4BZ6Nd8xixvXy9DdJqTy+P1ekVkHx5?=
 =?us-ascii?Q?TbQqsXPKA0SnP3ny2HOeq0DcpuiCBYvbxUqG9NOT/emrZbm/Y7qDeB/dJKAX?=
 =?us-ascii?Q?FK6drdOIsjOJOiuWIICmRmosiPZ8TlqGc7OKLpbrFpAwYfvAzBjhlCawMj1i?=
 =?us-ascii?Q?wqQgN/dAmF1AZ56EHtuP1ypj1N33+AKWjeUeBshbmkq3uZL4gnLNaiNvh9lP?=
 =?us-ascii?Q?vzt+HP8FzxzsGXFdqQDb4EGLGXdhnya5VA1wPsy1t6G7WSWWsPWJxYuy/oQK?=
 =?us-ascii?Q?v5AktyHqvmrIgD8SuuWnKFUl/6zGtCrnGX6KopGiLB0S1RLozKFbh8OZfdt9?=
 =?us-ascii?Q?ooSDg/RSNIByljSVZErLNZbhxOqG/G5iVJlfRorqnpLjQA5cdJWFpmKQOg51?=
 =?us-ascii?Q?hGB+xtCK/axkQNHblljVnQl/LDHd65q7bBhsgkmq7Uhlw8hsX2y8BWfd1OW4?=
 =?us-ascii?Q?avhNVeGGHcy0ZYcD5zMYAeeMH+vw0+Iqk4bgAoBlN9ns+V2Db3yOHX77Zuma?=
 =?us-ascii?Q?Jbd0DWeZet7OpICYotZzNNW1DwU8zYNq99kPytORVPyXJ2/hF1eEO2wET/3F?=
 =?us-ascii?Q?0Ucy4I/cK4/Tk0GCkB1YhIDFqxDJdfKzB8rkeyXbBdoBexU0H5QeqNEdotQC?=
 =?us-ascii?Q?tIr6ajHBlRv0giNi4raPEHEAFSr8PmeFGV5wfTR11/OhHopFiBhJMZRETl7l?=
 =?us-ascii?Q?GSItVA8lLrOXuszFsdMoSboT92ZhPGI+LLZBYTXkfQWosvWXLTkM+4a+Xlov?=
 =?us-ascii?Q?LJA56blsv3tWpRmP4NQ+qHaP8C4m/KuAWshScc/HrTIytTwXKUKCodIdptws?=
 =?us-ascii?Q?PTtXeA8lOJN5UzJfRZxe4B4rjrbdayupMThMX7sbg8+VBMMXqTdtxeHTgQYZ?=
 =?us-ascii?Q?dsscdYYAIvPA3agWjGjsrfozWQxJPC0oAemKtPhm9lb8ocyiz2we8g+TMXw5?=
 =?us-ascii?Q?Fg3lXYwDQn8YANEJzGa/eqE5b5eS6g8iVG60FtJnDndwG6Sl8a6GBhLpz1bI?=
 =?us-ascii?Q?/loqmuSpmPd/wZUdSIEUJTA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a0d2396-b8e1-4867-6aeb-08dda9526a4a
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 01:42:39.3313
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LvN6O4PIuVF7J1WY+b1V0xO0C/1MnGW0L4mXUhhDdMSRvUP2tB1hpAtMfWJRjWY/XuulKQVnUViLxNWkxhdbAuQQG4UAr8oEMjPAn2pxQPGS/vC9GNcjRTftfen4pEPw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB15122

Current Kconfig menu at [ALSA for SoC audio support] has no rules.
So, some venders are using menu style, some venders are listed each drivers
on top page, etc. It is difficult to find target vender and/or drivers
because it is very random.

Let's standardize ASoC menu

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/sti/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sti/Kconfig b/sound/soc/sti/Kconfig
index f881da4b6aead..8e12356a4490f 100644
--- a/sound/soc/sti/Kconfig
+++ b/sound/soc/sti/Kconfig
@@ -3,7 +3,7 @@
 # STM SoC audio configuration
 #
 menuconfig SND_SOC_STI
-	tristate "SoC Audio support for STI System-On-Chip"
+	tristate "STI"
 	depends on SND_SOC
 	depends on ARCH_STI || COMPILE_TEST
 	select SND_SOC_GENERIC_DMAENGINE_PCM
-- 
2.43.0

