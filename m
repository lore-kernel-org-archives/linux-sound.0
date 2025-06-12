Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011041.outbound.protection.outlook.com [40.107.74.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A09327718
	for <linux-sound@vger.kernel.org>; Thu, 12 Jun 2025 01:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749692615; cv=fail; b=ujvB/397w1vv6ZjJNhiy/pJCIzHIvWMmbtZi3bgVbYmvNzJZkJh7fNfmcf9mJwwfDlIXKO2C69t6KMP8WS2JxaHAf2iO6/idWiwz/9DC4Z+e6lwikOA2L6Ff26Ak2asd0hwr4q3a58doBln/WGw7R/+O2mZnEFXv9ta6k/6pFLc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749692615; c=relaxed/simple;
	bh=rwvlTq+G4lFrHKv7nOqG4t18tyLm3q6+agA6VxhDzTc=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=R21avJSxbT5Ul8R98vO9ZgttaIHpwXLNbZoXpPRTUVrzAgJnXZZMAD/3LwAm6QS0JNldAwBULiw5UHYckDBoTTO+O1+n3YjfYfuadY/sZ+NJas2wdz3mk+BdLSmPkb78MfrrSwiZBlMXVPMrpEffCAOh4oPaL4425s4iaGrgqHk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=LSq1Vupu; arc=fail smtp.client-ip=40.107.74.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="LSq1Vupu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W6ls00Ut7UQkwk+mJlX9vjRQ80chGGKoytjA452iCSHMdBKDi50V60JFy7pAtlX29O4CzUiNk04ZwrFoE/zutyhqHC7aW6pm4+OVL69rJ8Zi5PFfvF29NaWkZw1e0wWl35rMdxwFPVBFN6qYv/U9IzKIE4ZOjPa4FAjX7SgoYe4blFqpcyqsU1goKp+vh/p96JTyDFlevbILFceudUez/kb51slIOrYn2tn5wVRwCNi5wxoNlJGsBM4yOZLj+/hqiKoovdmemVNIftl5oyZ2V/204epGExta0pnLvadO7lQ3hyLdb85JgmJ4TW/P2tjLa2yIXrGokM+yZ9FgS8CKDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JCRstq8+xVaiIx1hHKN108DCB27MezVA1PdhkWAl8iQ=;
 b=dRmL2SWYHi3VToZggQjKY7xzBG9IGOtD/nFpFb6KsZcZHH12DmjU5XQTLRnCgxOfOZzSpSmtwfcVGW/PlB5wkNEa2mnCFTIMqV8hbr1EKdBCPr6K1i92JOzVBC5ciAulEGlBeG1VwwGqBeQ402eH8JLQ/DGgfWEiF5msAr9R1r1xegMa8p4cEjIwW5G6Wm9QIzSZHRWg7INsTYdMefXuJfrrHkWC/kAke6WAgBs4FaBCwqZxBOzHI90U5tV0iCk7DK7wNpX48TTMF5VLGy/JD2aTIJqvY36dAV+A3wvMBRqT+Sh6AL6Pg/LOCv6+0VDefxMtFv46dT5iIcgLB6v72Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JCRstq8+xVaiIx1hHKN108DCB27MezVA1PdhkWAl8iQ=;
 b=LSq1VupuZvHzGr+RSzHFnI8tBP1ynMdVfZbb0qfmjO5PuTk6PU616WV9oK3l1X8pyRf2kEH73zwdiEibyYFIF81e6sXEKGbruTBsIKOvyE2Ckoc+TaflnPLbnQ5mOoqTOX/W+ZVPi+2QZF6IMVFv3G4ytgLQJwOSxlCC6AfnxRw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYRPR01MB15122.jpnprd01.prod.outlook.com
 (2603:1096:405:227::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Thu, 12 Jun
 2025 01:43:31 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8835.019; Thu, 12 Jun 2025
 01:43:31 +0000
Message-ID: <87bjqtzqd9.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 21/39] ASoC: spear: Standardize ASoC menu
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
Date: Thu, 12 Jun 2025 01:43:30 +0000
X-ClientProxiedBy: TYCPR01CA0117.jpnprd01.prod.outlook.com
 (2603:1096:405:4::33) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYRPR01MB15122:EE_
X-MS-Office365-Filtering-Correlation-Id: 6fb846e4-8e44-4fed-0196-08dda952896d
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|7416014|38350700014|921020|41080700001;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Ner+sYpTrjYRX+72aQFJognTO/olid+mmnH3tr2PV/VuEy92bBoPRWe6wtkG?=
 =?us-ascii?Q?9ilX5Ne4fnJdq13dnX6W7YjBQT7GnjiqLOv9Ww8Jbu+I9UWRzoI2vJl389hQ?=
 =?us-ascii?Q?koo41wWpwAGjI03Zn8r3tLqaHdHfSPOsjmNdI0e4Jt9upSHy9L8Q8zIql4eK?=
 =?us-ascii?Q?byRIeVvbsqvTDyoOg9oC48NxXySLCzGKu3W9fS1ZAmUvFKToAC0U5g5uZyM8?=
 =?us-ascii?Q?3Wjxv/ExAvRmAvc9jSnywGtl9ZAicmj4GtYfLKlbinty7KNpfkP3PfYL5U27?=
 =?us-ascii?Q?S92yvGTuyz2UF0dyAePodU2OSNxa82BUp8YYoCgfrK3fNH77jOWnODu2Z++V?=
 =?us-ascii?Q?eunO0NqN7NquTDH36ptyrn0kHNr2ccnX4wLpVHr6LO8AOCqme5y+GE9EDZHe?=
 =?us-ascii?Q?SZC0B6VR/YuAbD34yo328fU7JtWviQCNIeh5H+/w2TekWkNs8EjkUJFmlwMp?=
 =?us-ascii?Q?tqPZNEgS3Oc21HaGQZ5Wz044g2yUseef+tPLEjrpZvLc35lfLFl4oAT/z7KY?=
 =?us-ascii?Q?SXyrmFv4OdfU2omsJlvtV+NNdmJE7jmPdIWgEc/fVLHVvqeupfUYSQK4BZSH?=
 =?us-ascii?Q?SJ4ffOjIMAlyL2qSaE3FpD1ggv8CzIzpvdsqwF/MUzY03ObOi/WDuQT4HUlM?=
 =?us-ascii?Q?hzlwFygrejZvBIsF3OqpBiSvEvurue6pH+V42OALuoouVYIQ+1h4egych5Cx?=
 =?us-ascii?Q?/y0JGS+E/Nkq/hnPBg3w5xDztzTjDNHDy3vjpvNwhVwNUTBKYqMmOTHzd2gp?=
 =?us-ascii?Q?QASivtuYg492ULuPpgbtXwlEPEUC6XT94Zk3u/4eIN5VTnE6rozk2KAocFO6?=
 =?us-ascii?Q?/+Im0BZTw4YpnKDT0X1e1bwtYFvSi9BfPh7n5WolwyJNk0n9LfuGd1NGlflN?=
 =?us-ascii?Q?u5PgkS4nChoxUpvz81izP1Zk+gL14OfJD3y9rftfgWt3tHGhv/iM9uVsKTxn?=
 =?us-ascii?Q?J5jH4DL2fAmeADb6kVOEEeXtMzOXxMDgk7gzFAS9zPmcXW2YKacz1VyHjigM?=
 =?us-ascii?Q?PGKiprcszpoSkZC6RgDFk2tPlxRR19jUpxENFSoSlN3QLjUIKJ+oUQMll7TK?=
 =?us-ascii?Q?cRUDcBnTgTiW7K0eDQKgTO0ou9s8bcnk3rRIgEbNDtg4kZeimaLK7H3H+FOk?=
 =?us-ascii?Q?FvxBsQiaxNz9+b3gG/tg/ZnTwTSmZaVDP6H+UtYA3bx1VhDgfO+pjBSKYT2S?=
 =?us-ascii?Q?3RJLEn10Ti3VfxR1fUnBMz8ykNDegU8yYqBc9uNIVYt96uiuwyNfaegBQVNk?=
 =?us-ascii?Q?1vmd1Emt9kvWJWSxVPQLLSGvea6Nl79LFc61m0jq5sYwcQm3uVvG3uSwx2E9?=
 =?us-ascii?Q?+/SiPszvuygO9jOx5cwLDpF+XVQVz5pW73MHTuKcVwF21gc6XBqRTDtcA/gL?=
 =?us-ascii?Q?pMo9cRUl5pdvBrS6HdB/egsg4G10ZWUQuznGyBSVFvtF7cd1Ymhekrt4i802?=
 =?us-ascii?Q?rkO5yvsKo2Bu4yCUH34YCb+VxiSTFxwqZXUHXMtHf2A8eEirPBh8ipbd5Myx?=
 =?us-ascii?Q?okQE7eiuCKKglyYsouySLnL1R/Y5zFgW9Hi49/wpk7iiPtbchstnYycgpA?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(7416014)(38350700014)(921020)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HRuIlRiLU2j9ATi8Ubt2jzmZLWHRpxKBM+LMFhw5FOLt5ntj9QtGp3Ovdfl/?=
 =?us-ascii?Q?Z7jCScA4xA1afL99Qm+ZoU7lShb5hT6mPr+a7XAdCxnFPzbZG4Mny/viFKY+?=
 =?us-ascii?Q?stS7b5lYD6qtInJSPtaAaklrMEF/5Z4B1YiunQawYwHETZk/UZSjGq15ny9L?=
 =?us-ascii?Q?uGz1VpNZx93Wkfydf2QlgVvHH/xy+2A1CclB24aSHt+P8LAF/XXpPKc7yskL?=
 =?us-ascii?Q?fAKCDxBg80CAel0V++1SgJZL5TzHRFgPpLRnZ7uaIZnd24fxr+msZj3jHps3?=
 =?us-ascii?Q?2rczG9I8qz5dY94SDa1FIDlT7OzAy4dDm3GYq4j/icyzeXrsx3JwVJTpodp1?=
 =?us-ascii?Q?TcLHnUZbj5jkcc2OD89p7e5SLFppEdd080cAFszmQtEWC2g1eaYnurTJl/uP?=
 =?us-ascii?Q?tI2WCifRyTkKr1eW1bSPyTc85QEuQjqyosKeP24ETKIXAkVai+On6cOErq4A?=
 =?us-ascii?Q?5JSLtx0rX+8OGzUKVz5APf+x5gtr4VZQKDhyr1c5dtLjiaUjcGI68YPOZC6M?=
 =?us-ascii?Q?sOJnNBkV2h0RoEbSy7u/DGNGGH6r5Lg2zcQn9qtC4emisJXTcE/uV04t0kjS?=
 =?us-ascii?Q?X9ZrsKqNszEPaeHKbLCEsOTW5de89myTVVg828d1mPOWrELMjDvpP8MEI7eu?=
 =?us-ascii?Q?zVglejC9wdXYk8fCajTgu+8bvrp2CMAR3L7I3LspLlk/FPPz/dS/btZI+SSc?=
 =?us-ascii?Q?OkVaoskgVoWHR2a+Nz1L40SHYVGRzR1dYXO/VvL2H14HpR24d59UQ4CULPzK?=
 =?us-ascii?Q?vD4fVGhoyKdmLc4Qe8Moad1BKAAhLxnweDtv0G5JShtkpoLKKnvmQq/is0uT?=
 =?us-ascii?Q?aIpP9XbbYel+jjSwZP+qs0SREFCmICCkeZE0E+7BQ59rT+SOfDm3JV+XyC8J?=
 =?us-ascii?Q?0gajEVRHGceEZ2jrnpxv3iIdXWpvpnSFBgMd1R/OCDwFQpmKGSXjcmUZ+rPj?=
 =?us-ascii?Q?rDaB1W3tLU44LCWzM2yGf5ycEj+ONcvqtmIEF+peMLjpGzLyWYvb6gGQW99O?=
 =?us-ascii?Q?xz18Iwrim8o+KkvI7h/XRD9nt6e4MmrU9rpKYmxFh9s/BnSTDa3JPxB6h5D9?=
 =?us-ascii?Q?PlnFd5kteBasxlRfxv4L6t607oxsVBb5nEqDLYcg+Q00p5Ijq2HAMpSDAtmF?=
 =?us-ascii?Q?CmdXZxoNyaGF2seOB3+PlSiVUkCmOTu5zC5WRamJlwj9dtI6UosMtqFY8Va7?=
 =?us-ascii?Q?mP/z36jdH7bqxAYHRnnk9xX+cNvXd5K34yJtxpubokM/B9Tw7S/kqWkVdPqH?=
 =?us-ascii?Q?n2oKF226ORN3ZSQ88Jqfd50VOXFOZoAXeT7oRI/Ys1KZ9BJXGEHGpLUccR+N?=
 =?us-ascii?Q?mT/gm7II9DYNYuZuxrxG9yU09C8GDZ50rYGlujq/ZxQnEE05muKRZAQcwudi?=
 =?us-ascii?Q?AJEfkYl86WwPzU0iV1egTIj/fi76wKalYKKsxdX3Uu2Y9sRJ9LjdOLMLOgmJ?=
 =?us-ascii?Q?IabGEGB6dmID89RELody+pejp4ueSEg0tT7SmKe6WR+NogkB6UYjQmPdRvM0?=
 =?us-ascii?Q?M0LzNpNsNGLhCJstB9fZoeTYItEoGVMgYGPwbm0bJBgs1UN9jcksKlhr1pWN?=
 =?us-ascii?Q?l5Dkt9ZEAdH2b2M/CVWdqz02YW//ufyUCExcN+oRNHjpw1oYEZCViJxXpt+0?=
 =?us-ascii?Q?Vut9qaG7489xLoaF0tScK2E=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fb846e4-8e44-4fed-0196-08dda952896d
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 01:43:31.6134
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QeQyaczcxv+AsFiHXkSP29iJb7o4D0AVVRl4DtoMBg5k9YX28nz9Jr89SNMwOxoIjwtH4iZg7WKPqHo7NNE1lyntM/kR4Wdys0j3Y75EicEnHmED3l7o19Aa4WQC++be
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB15122

Current Kconfig menu at [ALSA for SoC audio support] has no rules.
So, some venders are using menu style, some venders are listed each drivers
on top page, etc. It is difficult to find target vender and/or drivers
because it is very random.

Let's standardize ASoC menu

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/spear/Kconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/spear/Kconfig b/sound/soc/spear/Kconfig
index 1b053de1ae7cb..84a52fd4c3ea1 100644
--- a/sound/soc/spear/Kconfig
+++ b/sound/soc/spear/Kconfig
@@ -1,4 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
+menu "ST SPEAr"
+
 config SND_SPEAR_SOC
 	tristate
 	select SND_SOC_GENERIC_DMAENGINE_PCM
@@ -8,3 +10,5 @@ config SND_SPEAR_SPDIF_OUT
 
 config SND_SPEAR_SPDIF_IN
 	tristate
+
+endmenu
-- 
2.43.0

