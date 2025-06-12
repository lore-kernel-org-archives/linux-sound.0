Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011041.outbound.protection.outlook.com [40.107.74.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59E4B146A66
	for <linux-sound@vger.kernel.org>; Thu, 12 Jun 2025 01:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749692540; cv=fail; b=tLVYv/OCCe7VDXSR1JVQ38J0VLzfk4vxJ4Mc6uEPySfVD4l5/20LF9tMiHKQMArYpuCfpLujw5jEzMOPCqwAxCXK4p9kSJfdVr0bt+J5sBqIdn2X3Grb9PhM/tzvvYyVfwmOJiKES58sFWRrDJ9rZjVniRg6/XovlaPo2cDAeA4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749692540; c=relaxed/simple;
	bh=tmsSkwwkXGswwKoLEd5w2YxzRIk8ubw49EVGXyzODRc=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Wg0uxXekODYn1DSWPFfOHUghMXDmHfnj2IAb4J9UEjAnwa++IK258A9hFkTmUeuclBYXQy5nN0Wt0+Oswt6nb8R8M1PtfW/1WN2Wu3G5EHGrNjNQgSuU7PQ6z4RHflpHce9Jn7aGmGf08UZDpnk01apduGCZeUA4Cc6ZMVRMBgA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=ahlNYHKB; arc=fail smtp.client-ip=40.107.74.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="ahlNYHKB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xqpEXnCJ7z5cezy0P4xErxz2x9ssunFdlvr6e2o7nIqR+ZNeZsBk9ZgOxWNESNe8qMB+VjubpZLhf3xCTkxmAKIbB/IWAqxqA8KdhWQWnf//I+pXxnAAh9NPoP2oadI8YRN8wQt5wDNPCUnLxDVf3oUbXH4raVNOOzdfI5Gl+uBpTe9ww+KW0a8Plk+YadajGB19WKHbk5XKw7TNEIhJUtpnix4jf2SjQNKzpNyPH9A4I8SEYZz6xq2YvMj0ivFFp2GqZWgfYutinHfdp1RG28JVKtBRR4FBswouzYEiw1zgvVNo7MhSzleguHOL0P8RUV2d2vy5jQBAWgkjMSFZ+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dcMKV1lWyhrGi4ozdkQeI4IMi/lIACzgszB8/dpyzas=;
 b=NltqZmveCICauHEaNRacRxGRMyhspMpcJZ9EkBdaqlglFrbRivVvAlNPdJKoonDoSgl1gDh4mM4Avk/EQGaKPEoSDnHq8Zsnq57ZMsl2/bKmBVK5V2vVUSWJLEiUJcDjU+wmbwK0ZtEgFT1q00YTl6gFdv5CHLYGTnWpww8S+ByDjiV8XT8Hwb0qEfFu1wN8K+Rr4Kh88k7TVbC6DB2VZQw5r8TH6eSvHh8OEjoeu9kGzU/RS+uVXPM0ODfYTDyGPZqN6dQRMXqczs/5svcPfUlHanTJ7tlnlz7dLg/1defSj2Crtr1euBJ75GPccTIioSCtp5Ee7N+H0eKDBHSwMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dcMKV1lWyhrGi4ozdkQeI4IMi/lIACzgszB8/dpyzas=;
 b=ahlNYHKBmtnHWLXy7biR23qmJ2quEJiyqmX7TnUukORTQseLRJVPlZ3Atf37CVr+d+CL7ZtciLBgTgF2T2e0V4Dw3qGitOyDoQmV6Kw/HvwC8fTVv4WFbpAa0qNl3+GyAk+69QNt834xRRhBlAcuD91UktmND0lEVJQRBbDi01s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB9937.jpnprd01.prod.outlook.com
 (2603:1096:400:225::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.25; Thu, 12 Jun
 2025 01:42:14 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8835.019; Thu, 12 Jun 2025
 01:42:14 +0000
Message-ID: <87y0txzqfe.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 05/39] ASoC: dwc: Standardize ASoC menu
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
Date: Thu, 12 Jun 2025 01:42:13 +0000
X-ClientProxiedBy: TYAPR01CA0122.jpnprd01.prod.outlook.com
 (2603:1096:404:2d::14) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB9937:EE_
X-MS-Office365-Filtering-Correlation-Id: 161b5828-aa1f-4b22-d8f2-08dda9525b53
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|7416014|1800799024|366016|921020|38350700014|41080700001;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?q6d8sGcQbiDO66n2bqQqJ6x5lnC4ALktZW4MYjIS03V/pvXDcvSlh14jMs1y?=
 =?us-ascii?Q?2F4gH+Lh9lFvZC+21WoW+dEKnj7p0cWJQEW8oZILpYNKuVG0TSz6xuSN8sOC?=
 =?us-ascii?Q?HXhy7diu2nelOPlVOMYpvX661kQbjvyFHzXc5kND9MaihnJevXBaNd5puvBk?=
 =?us-ascii?Q?6rjWDMMougvInaYWNxSS13PrwLUvdYP+rIgKjFKudzRmjZyQmI9u2IrIRdC/?=
 =?us-ascii?Q?XmurIbEi5ExRXDZMsXfWJ6egKd0OX7kXVMhpf5nxry6afT9URqDa8YZxMCuB?=
 =?us-ascii?Q?roXv4nzLbaLGDsp99GsH+kEK9y/H6mW9q+kDPhAxPGBaLHV2mg3dSRNjVhQU?=
 =?us-ascii?Q?BP5+kvIRhP70O0NEmV+iUYmUBPxxFb7PlbSc+zayMtSus54+J1tWz+RsC2AW?=
 =?us-ascii?Q?w3PvXdThyXsWOMDM+chwLzbwNIWQ0lxtEr2ILXdfGG2kv5URtob4UJ3heAaQ?=
 =?us-ascii?Q?GrYDqkOpyami8Jws5wHWikMCB3mj+xj7R6WAf9m3QbNmQ68qACqQD9TboyyG?=
 =?us-ascii?Q?OmFvIpxoTLyi7Jr/f+I3UENhSsBtHAea6D3E+zVlCRvQFm5uTcZWZuwbhS6k?=
 =?us-ascii?Q?IgRpdD+WITt1A7b/CKISIuY1fBPJhC5mrozNauncef3uWSZyJbOJPdu9K54e?=
 =?us-ascii?Q?UdFsmDC0rDJB8AkbB78l3knGyBFNkwazezRAUflUFfavD4OJAcFvZ7omHMsx?=
 =?us-ascii?Q?zWQG6UujYGROpKH668P2lbv3J7UFarXe7nDYh2suUaJB88ad/srtBFeAqVHz?=
 =?us-ascii?Q?5x5nL0NYGKhAF+rlj0pOoZ3olHRU4Sl12aU71cwT/4WxnCEleEfiGujXtDkc?=
 =?us-ascii?Q?sP5vkyOac9r4wmkLrd+eD18A6yYy8z7rIhcIdQ0QfDIE6LbLUimlvZwMvPaa?=
 =?us-ascii?Q?TaUbSTvjq3nc6SeiQKe48Su33+/Q/j/1bZ/PiM4UtSS58+BOXMmYY7fHAjjt?=
 =?us-ascii?Q?/aWkN7kke1Cu4K5Bn+nerDzHqtX1X0l1rYpQ0IyBGJU0RvwWVmKbN0LLkBFK?=
 =?us-ascii?Q?TqmEZ0VzYivIQlbql+7IWopoz+oDx1gVJYJYEVbAhcgQH3khax5MHQldoKxJ?=
 =?us-ascii?Q?TS/jymHeKKgc1Byyb98Mbfxhq6451IH5Kdq8f07kkt/ppyxzdhwCtoHOakb+?=
 =?us-ascii?Q?eGuJA3uchQ9cRAE8VvVAMmG2kxnSchJv0mqqq7tU7cPUjCi6wU4xQ7mKrrAt?=
 =?us-ascii?Q?ex/2fCmoZ34R4K7lzHYcZAzhDhVQzK936mqGcI3qojRv1N4RyzQggQ0+7KlD?=
 =?us-ascii?Q?sPFyIyP+/AIHUa0gMwVgomGie+cVhR76WwgnMpgXCd9bJ/TdgrjDHWDNP/rO?=
 =?us-ascii?Q?z0X2OjWQkpd7ffTeBhVgc9DMXrjJLGYkLFLrBbm3kqUccgDo1a5Rhqkv3nRP?=
 =?us-ascii?Q?nsiEvU+YIq8FBA/OfoXnAYVSv6DR5Our0ArkKhuRa2PhiGCgixDjI3BFsz6E?=
 =?us-ascii?Q?JFpMYMNGB4pavEypO29BWJ13qTNL43fcMPxv31P3w8ozHgytG9cRmEEsb1iO?=
 =?us-ascii?Q?b+Fdd2b71wDoSUnmydV++98AV92rTo/38cVa?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(1800799024)(366016)(921020)(38350700014)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?unbx71AZ0lQRwuTzFnkAj9UqmLqq2biBnanBm8Q8cluaWCdqfcOTH45ul4wc?=
 =?us-ascii?Q?NrECCDe/zMzLLjWc6TwyVy+Z5c0M05fP9mXY13lAWpLsAnFiJJ6Syu/1BnAE?=
 =?us-ascii?Q?Aj8jQqeY6SZbCRGIwy25efdopiH6UbJRrD5eiNZTZAksVMccD5TKyoSyIVdh?=
 =?us-ascii?Q?Nx7VT4FKip5HYCpi/OBkFV7xmKbT62miC4L6e3auc+slr9FfrniLvnnqNXKA?=
 =?us-ascii?Q?Gip/b6LvVgV+IkZj/kHRLi9P1pfCtl8PZ3xvalLPeM6QsYb7vb1chxkGyjLq?=
 =?us-ascii?Q?gg+RYSqF4wM36BH7H1g2CQyXR7Sh0x26r+NcTZw7pCx6Mag5cxtD/YUjaTc9?=
 =?us-ascii?Q?WJxXpYGXy9tvZxkTuu46mrd0JpLEmKDNvbgJfT+QhPZ1ahMzKAH9J3HJXibw?=
 =?us-ascii?Q?GrjFwuUcvDHhKbad377mSDjdxG7RAF0pLF+Sho3MzPFKiw6G8Yo++iMYlQDk?=
 =?us-ascii?Q?4EccjgQ3gzk7VC1arcQ3m2MFo6WF8JmkWNbGme+RWnd3o4eHaOG9OHcWVz1v?=
 =?us-ascii?Q?hrdVy8zEDNSChmUWqAOQoG1HWUacuCtShV+8S9U8Gn6XpfY2u7JWZCkU03VU?=
 =?us-ascii?Q?n24tXH7U2Wy8ssMqkebgsE2aM+JeGhbcLA6yHMdD2df/Ss9GB5Rdi0iHUr8a?=
 =?us-ascii?Q?MN5TDTsKnsdSSxtchajO0dl8amW4rxceRoZq5VeYFo6Lp69V63FzN5ULrWYA?=
 =?us-ascii?Q?4sFkxeOtxvvpCjW+qBNd7XYfvL4t0HNYz49cG2kRSpqWI+QzAbHQG8knILL6?=
 =?us-ascii?Q?/VatZ3XWJ6PchTq4RdN3+uv0QLmGNBsKLzhM45t1WUQ582+r1bdVdVoQUwak?=
 =?us-ascii?Q?ZBxIKOkwimIvEgauHxW5l7T8Sjf++9eB/jR8mHiEiMDyWd8kQUhSIDfwzlRz?=
 =?us-ascii?Q?ZgoZWHnELrov8wY1l7KSAFk2qdepTxB2cnnj6AZrICEmczcnfbDHc/CVTACc?=
 =?us-ascii?Q?qsQI0F9YsXSJie/ReclebpoyOpzv1ZNt3aqtMCnZmgPZxRMLM3FVI5TFBSy/?=
 =?us-ascii?Q?gRDs/vBCWoPODc74rpc62fww8T+7J8N1I3jsCKixuPkCADx8FJVgV+C87Ik1?=
 =?us-ascii?Q?mMkwtCw4v88nbDlhxQ8hakNgQFEapFz+EevKj1hSGQjoNdoJUsHMlF8Nmib6?=
 =?us-ascii?Q?yoGYcSbHaWzodCpghn0m8xdRj0hpRYBNsdmh1kU7G3swb6GqLn717YL75vTJ?=
 =?us-ascii?Q?iPsNIIWf3AMpjgn6vrFy6mTsCgLfP0oDXf/t3U1yoP6RL1NtNdd+pGX2KPsA?=
 =?us-ascii?Q?cJOR+zLwdWLYqSxazife4SvjQzAdfcJR+w/mgG1tQUs/nP9Z4Xg6oG02dDVm?=
 =?us-ascii?Q?MdUy7Ti/4ulHhIWyE9kzUNlwsGCGyiiwGy3TLfhk5z0BaPqTmMjNcEyMFXgU?=
 =?us-ascii?Q?yeFPt8hGsuRO8Y8vN+MyUgEQObTuOzZqgR8yn41dHtviZ9pG3xy8TxX+MN3C?=
 =?us-ascii?Q?GdZK6IxnLMO0izt6h8JTGBnE/i3kK0JOFStNlXVmBUMNvYGltIWuqk6caWdJ?=
 =?us-ascii?Q?7Gy7iCupcASHz867WwNEghbRMEv6+D/HTjrpy1Sr2/mvfzxuwu81l4aABt/1?=
 =?us-ascii?Q?bEidqZYzT2PeFtb1FOpULxwNPOT8fGAYa3YcqvxkoNjAftuhu1PIKYERjDJa?=
 =?us-ascii?Q?lbXaWiXT2Jw8AukBPxP4bgk=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 161b5828-aa1f-4b22-d8f2-08dda9525b53
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 01:42:14.2855
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vRc9gp8d7OaXrJ8YHTpBN5PiVd6cI2TLbZPlQPs1IRJRYf+3lUmCNq3OwsjlncsGI58rp/2qlo6PpvY9YSAvOhHZG0mfY4Zgabnbw7IdOeKmkS6VMR2E0vv7ALvgs2yW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9937

Current Kconfig menu at [ALSA for SoC audio support] has no rules.
So, some venders are using menu style, some venders are listed each drivers
on top page, etc. It is difficult to find target vender and/or drivers
because it is very random.

Let's standardize ASoC menu

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/dwc/Kconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/dwc/Kconfig b/sound/soc/dwc/Kconfig
index 71a58f7ac13a9..6bb31b64210a4 100644
--- a/sound/soc/dwc/Kconfig
+++ b/sound/soc/dwc/Kconfig
@@ -1,4 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
+menu "DesignWare"
+
 config SND_DESIGNWARE_I2S
 	tristate "Synopsys I2S Device Driver"
 	depends on HAVE_CLK
@@ -18,3 +20,4 @@ config SND_DESIGNWARE_PCM
 	 This functionality is specially suited for I2S devices that don't have
 	 DMA support.
 
+endmenu
-- 
2.43.0

