Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010005.outbound.protection.outlook.com [52.101.228.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5294F14B950
	for <linux-sound@vger.kernel.org>; Thu, 12 Jun 2025 01:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749692665; cv=fail; b=SDkpywGOLlZA8FcCPJkZAK8p1/ttQihvZOqHzTn9idWRjkvsFpH8OTNRIJfXMFK2D9ueQOjFbI4EotjykYklhZjRk1Kx3ekZk6ocKibqDoYBvvtFQ7lVdrqFTOFnhkjb3gRYaLav1CkJuxKg4L3JEmE0BviNUs1Xx+EhLuuAfBQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749692665; c=relaxed/simple;
	bh=Rh1zWXM5civz1MtUnfUFRIjDwN60wqYoeDlfupR8wY8=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=J7YAPLS4fHhTOBHn/X40F/gJVtRPHkDWx4mGGV94Q9zBnIs212M98E8mQ/6a11aM1e1xC+Ra/e1kAb9cwFXqKSzYb4sGJDHUMqiWRHV84CDkReGr9yJPFLPVkCFi5E7MPpEgelufO3IQk1d0IF2STfN2Kh2GCQbjz+9WmS0fxJA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=S2A+/kv7; arc=fail smtp.client-ip=52.101.228.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="S2A+/kv7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KOO52do8MN/71MFXniq6Ka22zXoFFXu+zJgBczQ8bfmbm6GWfnvNkdZV4xG3u+A2RBVWQtTfP2qX6E7GxHZ+P3IDAl37+0NieKd4zkkYVz2Wd397MIhncEreUH18EFmUMogwu6HHJB8qA1A7xU+wQMdH0GIq4KAOoC8LjNg9tRyBxGYEFzsNouLBbeIEYstekc6g8LVPp1aFArr9ThmS4VJc7AfIGp0PrD243qDoWE3LotKGYDaiOl9lMMHY7F9q1NXKNvzUhjb9fE4HaA7l5klojm2MQ7pw9piw7QmfWu29ENI6j2PBFjwdDYdIOily9ed0IZEowfTAkMilnW7lGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xpcI1Rmx1B8LaurqObAlw76Kncngib09U2dNfj8pesk=;
 b=tTdyOPqsL+5aljDB0gurlyYVMW25xXfx66iqLqeFB4SWs0hm2SJVIQuXsaPtX7QUkYPuxzb5xH3ywXW4lFeISZ8NPofJR9rYqATIuWg59VALq8bREk3SO01HhYQ78uWJLLx+/CbS6jhXMjAZ7+e4fDYn7YdVMhwe+viY5q/qRkQNCBHeEOssZ2oQq6GgJZ2oZUBeb1wvKgiUUHxuKtC5ua4i7p/WWpoCXSbD2HHoqu+wVKRiKgGwKySp3GfevLSmBhqfD/S8DZzJ6IzL8kQoZw0uLb6K+mMBBAKA65jxEb24mPFkap0boEOBT1kFUt5Hr4+EoWks0V/9Nn9D7LjvIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xpcI1Rmx1B8LaurqObAlw76Kncngib09U2dNfj8pesk=;
 b=S2A+/kv7/aFTD9MsA5BY/AVC9TSiit7oMsGrzJUGtUPPiClkmxEI6e7Zc8WZlYcZj2La6etBntCGGnE6soyumqDtJsidAHbZ7Ywo72TiHlsSRwE8oul30WRC9cowIZAp69cOf8q8H4slqI8B5hjDhggpPesftSTlh2nb1FNIT8k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY3PR01MB9824.jpnprd01.prod.outlook.com
 (2603:1096:400:223::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.30; Thu, 12 Jun
 2025 01:44:21 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8835.019; Thu, 12 Jun 2025
 01:44:21 +0000
Message-ID: <87wm9hybrf.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 31/39] ASoC: generic: Standardize ASoC menu
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
Date: Thu, 12 Jun 2025 01:44:20 +0000
X-ClientProxiedBy: TYCPR01CA0180.jpnprd01.prod.outlook.com
 (2603:1096:400:2b2::20) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY3PR01MB9824:EE_
X-MS-Office365-Filtering-Correlation-Id: 2755dcca-4e2c-4502-97ef-08dda952a6ca
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|52116014|376014|1800799024|921020|38350700014|41080700001;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Csj+1GZMK2T/NVK8a6yiVnQQkzBXQnsbXVewtU9gcbyi7fCACA4HA3O8cYQA?=
 =?us-ascii?Q?jpPTcOaeqHw5uV3ap4fCgzfLvjSWMmuLh66ZBO8LQ6GkmvIJ0o8zH4QrdSEy?=
 =?us-ascii?Q?uRZg/Ld+ZZAPBMC/5J6/vlCAxMI4btOSK2upcv/GPBZMgr9BRbGbArSC+eBA?=
 =?us-ascii?Q?ZHBTrKWCsvQndr4Tx+UlzUIfegMTmhLPmP/QdN70gipNIbtpWAcyqWhEvEoY?=
 =?us-ascii?Q?dqp899ZG89NTZy3hzXCs5Ju7VPyYPugPkOQ/I28teUHm5cip9/4f1Bc6KO9J?=
 =?us-ascii?Q?03qUjcP2O1UQvkufai9Pwae7u/kCCh61BB3cE0pSkastwziY31lyJgxRGCNM?=
 =?us-ascii?Q?wr/Rve2tnb0jIO+5tiCT/+a8/aoFz/LH1zZdHNw6iVISHLJ3HCMrZ5n3Z4TT?=
 =?us-ascii?Q?k1TERXS57rQwwpT2gWIzmMzTrhrDPOCWxw0ZmqrJyn9e1kfd+oLY5vBfdt91?=
 =?us-ascii?Q?yyeqJew8HsDocjG58wEp0U+hUj0xdRv3Eee+KOUqby4BwCtbwtEFrDV9xRdw?=
 =?us-ascii?Q?hcJAyln+uDM8zS7kFOzgs5s6+kGzk+KH/RtbvNB8uicmeXHtA4SNdFKxH0G4?=
 =?us-ascii?Q?TE98t7qnaoICVhNF9UgigUptMOP4zG6CqEuEqPL04v/y33XOQCudvSIJDePW?=
 =?us-ascii?Q?7ZMPh1icJM7mVxaRlDz5Oh96w5YIj3qFDRKc27C5QpjJwiPvJjn4sfcxjMeX?=
 =?us-ascii?Q?/rksD+ukC3kp0rjvnTgU6xjXmWO8ZtALRi+Sg3AOE3tpTWl164QMwmBut6Kv?=
 =?us-ascii?Q?c7yO7KlBCXX57lEUUWhYLzQPeORVFxu+mDwcPH50T2Ox7W+Wwy/+gY6wl140?=
 =?us-ascii?Q?bTOpRVNC3MjZW+KZrTMNnGaay+SMYJY0g+ZVXHOr9BFtwXVi3kslevaCSQGi?=
 =?us-ascii?Q?RgZBvrzxYsgyQ/t8jRBkEnXOF+2oKpswltEpwcaaUExaeGZhCOBGMP2ni3RE?=
 =?us-ascii?Q?awYMi9xIgDzd4J8Eth+ti5FDkbdNw3xDRbJAAHld4QfIQdgT5zLvqPwLYAwj?=
 =?us-ascii?Q?p/bLec9Hpb8oB2JRUH9Fmcg4stck2CXBiYyXJgyw20dXHU4cUJLO1iemdXdi?=
 =?us-ascii?Q?GGP5cNUXp6GVfA6doy44j4JxMiMV3L1M1sqCgATkwzY/FFrd/sxviNVXhj/+?=
 =?us-ascii?Q?U5hf7MFlzP2scWs4VUtTSJkkbv1l9h++GCVnkMOzdq8bWgIjlZJH6YWYK9wV?=
 =?us-ascii?Q?OxfUXysTiRscdjcS9MpYfsEliqyFDpMAbd+7Yk+0GnNWkMtBf33Bkf09qvfX?=
 =?us-ascii?Q?gPBf3tn6t5szJJmgTrMCU5FLar0BEtI0okffUgjt6OCL6c5yGvSMA+UwRR8k?=
 =?us-ascii?Q?HlyT37YEjo3aqTAvD/7MUMJ1AM0Lb1K/Ml/K4YZP0lXWW5FYCO2mbBgiosAN?=
 =?us-ascii?Q?5++iWTkxs5R3HN+2w/P2adzcNsDJYTMAaG7CuLrYsZtS6Tx/dqyHp9m2j15x?=
 =?us-ascii?Q?9oMAfQhmOG2Yvd+DiATBGni9dj3GxNtP0AHScK803ED9NuOQsTJS62Fl0ziR?=
 =?us-ascii?Q?Ap5IL1kKngiLut+ge9anqzHjkqw7Nzls8EWhRY9nCK3lYkjoPwXbLZfXDw?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(52116014)(376014)(1800799024)(921020)(38350700014)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5DiZMrf0r4InLmjODwOlWInDKIvGzzXoZgQ6sId+v4sCeHaa6boESRTEl9TE?=
 =?us-ascii?Q?uAd6dAkauRJWQzXg5N14B5v9wdlztzIiz6GsSCZdarLJmDLeSe54xiVJo3yy?=
 =?us-ascii?Q?Y9FRw/DsEpBS7f4uYq1DAIbUCL1zLYEpuEbS9Wqe4kuSaG7bb11ipNNup+Ti?=
 =?us-ascii?Q?l4HzJnQ2meDGoMBz/Rf6btgwjfH96kI2dUPrLUgJfsm+QJVgD2YD6SExudTY?=
 =?us-ascii?Q?JvGjealFppSu0qOIimR60XEJ7FcHuCJAq/Ca7I2+VZiwDqLDDbcNNB6vcObr?=
 =?us-ascii?Q?KVBQhwPw9LZaTCAUTiQ0YGc8/ltyzot5hfcFwWNKLKW2YYj1BmOZXt7YaGYR?=
 =?us-ascii?Q?8NUTh3c95LSp8uF+GhfwGTqlAG+M2lP9gSHC1pEXi+aRvY4bCxTqz4jahpfc?=
 =?us-ascii?Q?Xiznebeqe4KmIjxhdTIRkmHbtOixZLvH0pQkWzvW8JdfiPR6mrXvAJvquITp?=
 =?us-ascii?Q?jcgbMDcNr1urjUhaKN6gSffjL2m8cNSJwbLovVNTWgNoMsL6uVTwTwG/WSrw?=
 =?us-ascii?Q?48IQZ5S7y/gZKfNRzr7LAzAzbusci94chb9urpRnHmOp1vzBzmjhrNoLjELQ?=
 =?us-ascii?Q?pUGQdRl6CGyLJQ9XSLrYqaqCr853OMDem4eEVmk+EnfZa/9knTodSs06/InS?=
 =?us-ascii?Q?Kcd+8CGOuNJfhe7ClIe6ApAG+7kj6DOKVkYbOGOAh6FpB6FHjcXg+jNzkH6A?=
 =?us-ascii?Q?rFET7E31bjnKritoG5pbnjAcD82kJi9FDVpvz8xFjjXm8BOmK2kRaAe2Qc/c?=
 =?us-ascii?Q?a3ad6CcdLhGK+0NV7kCIDVXo3psbQ4qfgcoqPLZcm0n30G7y30firV7XC8oX?=
 =?us-ascii?Q?1faSWVNERdZ6SeYohGfYSvDW+BLQBKUGf3XjYVTD+YsdUf55/txHsaMSQDBD?=
 =?us-ascii?Q?9VHoTuer69bbxjo8sW2Sg3kVvZxFZrR74qmHS/1FQLnv8OLE8rj3ndqhudD/?=
 =?us-ascii?Q?lyI9StZ2rRY/7+c1VtLTY1eyuAljfFFVAhb3MRa2FYGLRaAJWQ8SbMHh5rye?=
 =?us-ascii?Q?sFL3af1CNpV5JnelBNB3toXQpDzdEgiDGVzyqlYwDBKIPMHWgj24Y70NK4zK?=
 =?us-ascii?Q?DMSSMxAN/nE3OOv7mazh1YVlLLyToZuS2QMM5721UPH5p5kCmA99bM1QfgyM?=
 =?us-ascii?Q?B+wO1LxXB78SbC+6qRkPDU9ADlUfKll+rUJgJVQe8PbtXLD6UcEnwI1UTe8k?=
 =?us-ascii?Q?s421dVpwZug0qAj2MdmGObQZpbroZvvpapd5iMSVQGCNjVVZz488iHEXlKKR?=
 =?us-ascii?Q?jDbD4gq/0NjjryWr1SRdafYWjWBI9cPZbFoOSTtg/8ZpUqSyIHjzY4qvtBOH?=
 =?us-ascii?Q?E0zotTllYkoIrcSUd5h6BoaQxgc6KE4ycbOpN1J89/rF6fkIT7PW0sdjijCp?=
 =?us-ascii?Q?U8clgF7KC6I2dm8By9Pgh+RUpICJc21SKizSqVdqF8+vCIMV9QWIHSq4cSMP?=
 =?us-ascii?Q?bym5clmyKZXIeY/+AF7gx38JBheYH2ed6cxpleELxSVKVTqKFLFSU+tgXe+0?=
 =?us-ascii?Q?zGD3PiDQZUVtZXxu8nfPfsXrbAF4Bl6RLeCgkkxDrNgp9CoqnzcGQnpQbxeK?=
 =?us-ascii?Q?9Ol81g1w32scpm9dELQ9S8JcYLHN56Ti/LGkhqu9hO/gMTcD0jkuGcBk9X1X?=
 =?us-ascii?Q?H2oCFrdgdE0MhXnvfVI5WB0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2755dcca-4e2c-4502-97ef-08dda952a6ca
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 01:44:20.9301
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gVAuN1+O2n+G6moJ3pweuVEUhp+eg24XI4oWDWrztN0IPoYdy6jlmT2reBbjHft+mGa7vky7NVWPIrKnOwWc6QtqbmMojxDpO5Fg+5TEICoFSjAYBk2MosMnNBGI/k/6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB9824

Current Kconfig menu at [ALSA for SoC audio support] has no rules.
So, some venders are using menu style, some venders are listed each drivers
on top page, etc. It is difficult to find target vender and/or drivers
because it is very random.

Let's standardize ASoC menu

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/Kconfig         | 4 +---
 sound/soc/generic/Kconfig | 4 ++++
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/sound/soc/Kconfig b/sound/soc/Kconfig
index ce74818bd7152..bf362bfca4564 100644
--- a/sound/soc/Kconfig
+++ b/sound/soc/Kconfig
@@ -111,6 +111,7 @@ source "sound/soc/bcm/Kconfig"
 source "sound/soc/cirrus/Kconfig"
 source "sound/soc/dwc/Kconfig"
 source "sound/soc/fsl/Kconfig"
+source "sound/soc/generic/Kconfig"
 source "sound/soc/google/Kconfig"
 source "sound/soc/hisilicon/Kconfig"
 source "sound/soc/jz4740/Kconfig"
@@ -148,8 +149,5 @@ source "sound/soc/codecs/Kconfig"
 
 source "sound/soc/sdw_utils/Kconfig"
 
-# generic frame-work
-source "sound/soc/generic/Kconfig"
-
 endif	# SND_SOC
 
diff --git a/sound/soc/generic/Kconfig b/sound/soc/generic/Kconfig
index b6df4e26bc4ad..64b0817e29550 100644
--- a/sound/soc/generic/Kconfig
+++ b/sound/soc/generic/Kconfig
@@ -1,4 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
+menu "Generic drivers"
+
 config SND_SIMPLE_CARD_UTILS
 	tristate
 
@@ -37,3 +39,5 @@ config SND_TEST_COMPONENT
 	depends on OF
 	help
 	  This option enables test component sound driver support.
+
+endmenu
-- 
2.43.0

