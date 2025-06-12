Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011011.outbound.protection.outlook.com [52.101.125.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B15B472637
	for <linux-sound@vger.kernel.org>; Thu, 12 Jun 2025 01:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749692548; cv=fail; b=G3A9HYc4zGpbVW2OgjNvWcsYqXQOtOeRWepcXvEHXMXqieaqqzrXxgeKCto8v9IZdzmsa/udyGBpTVYxuXDIZiVmbvb73apSwjfF2KKpsbKqGdRxhkEu353FO/eJmy7n0Li7dToG5cT+JgdTnoTAkchQ7CQHGRfBo9DmOibG0Zk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749692548; c=relaxed/simple;
	bh=YBRKx91wu3DGcXH7eAz/kv1puflggqjjTvsreeU1Kv8=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=F3WSYu399E+MaKloT4ukD64doD0x91qffUpiq+it7oSlVm14Iajihny1zFQKXCdcOLK1wAoEt7JaVWug4/SwUmw5qIrz+S5O7HFri/dCuw30LNrs+q99rVo9+mcbKVgyMlTtw/W+EcHAiJVfChVKbhbJYDLOOsCA3mWRo3J66fw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=by/DhICk; arc=fail smtp.client-ip=52.101.125.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="by/DhICk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pv6r7WE5lQsOtiLTjHiabTBkqc7I+hm9LChXrNeme67uoR4GuTHZ9kx1bgCtEcXwxDEIXGQKgXqSe1bTw5hxa47lTtJ2L1Zc2ozCLyU5+FxgRmmFwN83MTxun2QXXtPIhCzdTSc4SsnpMvdeqBmjKz459uPhRKajzI/xsJOI4N6D4yod1KxM2+hVmxX/TWGnI2qsdrRCLcU9qv4MZ+xQQkogVcVgJNWF9VPHHC2iRjL9miweRV1qdJvWBizdbRFKZR3N8ugIzgK8tnIseKLlpUi8iQ70lLo4jsIl7lIC9Bcn0t60vkv3MM1zoyxqWo58niMD7nnFDVmr0WTFll/fdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zd0IeiwKQ7E7HcRlZkFcL+vYOJxN9ZLGw77Z1WACMhQ=;
 b=tMcJLohwsDfAXhnFNHLIVhe1m4YlOPS93M+MAzpcPAR1Y7BLDLrwsveRAV+Ow2DayPVuWoJkX1lueABX9ri7M5i/00+3n+nQOiMp1Oge7gX5JrZ8bVVIYzjwXEKkMP7Z/muPTHvNvge/pV70WVIf4n3GIyISbkwQ9T/sRD0LN/RZ4FfhHY5sAu46KP2a/CfGxE5wQhSiEI4eBf6EPfnGy2EKNKnnikpF8Iig96ZADaanAfJssyo9P8X4YGMVO2k9OfKJnzE3mkyvuLP89j5Symzm5xl3KnBR533Cjrx0qZo0ULe8dQuBIuMvk9gvnup3874YEmdlHhFu+WHkesa5PQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zd0IeiwKQ7E7HcRlZkFcL+vYOJxN9ZLGw77Z1WACMhQ=;
 b=by/DhICkGxsj64W1dvDkHn8cTdMmizN6MXzsjkxKQZVn0gXGQ8P/yLEdSTZqJwpfK9pb2Y+kEkc7ElgT8cy4xt81lsR3UO/pVOegABVRPK8AAcdCM+6tWL65HwApIfcx+ax9F5A5Ie/QxA2LbavwMyRVsyRaL7ncPlrAfN4fvuo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYRPR01MB15122.jpnprd01.prod.outlook.com
 (2603:1096:405:227::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Thu, 12 Jun
 2025 01:42:24 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8835.019; Thu, 12 Jun 2025
 01:42:24 +0000
Message-ID: <87v7p1zqf4.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 07/39] ASoC: img: Standardize ASoC menu
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
Date: Thu, 12 Jun 2025 01:42:23 +0000
X-ClientProxiedBy: TYCP286CA0277.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c9::7) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYRPR01MB15122:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ebd99f3-5bd7-4889-4703-08dda9526143
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|7416014|38350700014|921020|41080700001;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+yz3RXWEH3uYi/LRec6Bq02/Gk0Mbvw+IKZvODYM+KaCj4HBd8aLV51/ZtaO?=
 =?us-ascii?Q?WLZTBAnIDz3l0pnzYb8tNEAcXj9AN+tMjk65oOJYyHJlzhxJWUqW9STpi56X?=
 =?us-ascii?Q?Cm0x3U+4XH3NDw/xNJHOmYXpZ7kgEy2coTydw8Ep5Lvek1GSa3LIWBABg4At?=
 =?us-ascii?Q?Px/dFs6AHHdBWEs2QIXyJ3XKiD/kJ94BB2F+IHJrM/H889f6SKs2OAVpqbcH?=
 =?us-ascii?Q?Sp6a8v2zpwUB0ybpRgXX3GsaLrfcpIq30AHMJrJ92lY/axRH2kTc/o4l88TZ?=
 =?us-ascii?Q?tQlkmHGJbjnyQREAZYudsWY25D0T6pLBjWkLmVJyvgH+YRfufjtqc6ZB8s9K?=
 =?us-ascii?Q?QQuAlc6KVVTg5qMGr9qbOwxBcOsQDfK8x2x4nN1ebnpdj4jiNc9MLzOzIKFQ?=
 =?us-ascii?Q?rCEEwHxAHOFi4ujFa2O/D6xtY2skaOCWFdmW1q/sVzndjqVEJ90DbdJcDuLc?=
 =?us-ascii?Q?jHj2/AlKH2nBpxQrRNBp6ERHAT0e8KfNGPMI0pZXaj3iehcMM1ryI4LQzSx4?=
 =?us-ascii?Q?xHs/717wgQ6eFyLkF8o7qgQae0dNCbH6RLMHwNWUAWOwfGfOsR+XTHv35Hwq?=
 =?us-ascii?Q?msk/dlg3xI62di/kryvveqc4wsrmABkMPWR+NEQUs4kpSoGX8dTGo2WNLwNr?=
 =?us-ascii?Q?V1fHpftWo3aKEx80yuEbODofvlXcj2DGsDDdTe9SFQOhS7IO20lSG0t9iT0g?=
 =?us-ascii?Q?bZnszTb1wUuyO+2tUxlUCmJeEgAXcFdsY1Eawb6Lp+iA1F82EU19rFaHQrgF?=
 =?us-ascii?Q?KtxU3zZ3lfYQwFWEDeWC3wt/Ky6vyJGpzCmQrAGtOFnWo46V7WaXSDntcyHY?=
 =?us-ascii?Q?IYigzECqXGfxvJky3J0q8eqxlCp20NQ1ej0dZo7JlVuTnFSyRuFbhUT3M4uM?=
 =?us-ascii?Q?VxvV1ft2n638OUrw3iBtgJOxgZhKqWZAWvX3W11mIFFdW/Wcl+bhqRmh/NmG?=
 =?us-ascii?Q?l0ux4Vh7/AcNFVnLfFcyMzhedhQMJIiabxXw5cQ5b+TWyezLOEQ6LmUcLHfS?=
 =?us-ascii?Q?g4gzL5Io2PO0CF6G2Y9PhOowmc5n/GHRvTOGD1AFn2x5axSpD/hMLYN3W6Wq?=
 =?us-ascii?Q?wO0K47bOp19y2U/pQ7xBzzSIlKv0pT7ITDc+u8w/fKfpkFkNdJ7M+GrYm6Pd?=
 =?us-ascii?Q?HkJsUnrl5K690+6FAyLRpuAL1VmTtWTcG/fcgb1ieiwwBZ9xFMW8dUG0mqJo?=
 =?us-ascii?Q?DAkUmheUrybWlViUJrDQsMeC4u6vi3VN9t3Q7MrLs/gOTvYLL8w5fCCsdcJE?=
 =?us-ascii?Q?HZo6bTDrkb0wKZRB5sxv1k3lEUtmmJ1P3+3XC7jCFvz74JgII4zFWDdbrH/G?=
 =?us-ascii?Q?RcLT+c0dzoyFwU9LLOrC5nJiWWi00FHDNe61rfI6OmohKNAaA/Ro6fCmmCzr?=
 =?us-ascii?Q?0do+llYz3c2TOzvLiedTGGzAzIP0KHvBq+NNoBzhbdQiE0VHhIz/yXFhbP6Z?=
 =?us-ascii?Q?mtMLO3sSw2fpwMg0sM7BDhsSo5qjn+JRCYy9MVjcs6pgSLHqcfelm/gWhVUv?=
 =?us-ascii?Q?eCltmvMs7OoVc/NVo67/tNUfpkdHMq0pzLRIMOQfmBcukOXuRa5VapESsQ?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(7416014)(38350700014)(921020)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?KM9vukRyJeBH5ukdLWH8jD3ypONPxyDWATsyxgVRjvtZO9xfGiyS8sWTLwCm?=
 =?us-ascii?Q?mA4uGBYdwzl/pFWjSxE7Jt9LRADFqZpe8M2UMyczzAY0BwnpC/shgAPcE+ag?=
 =?us-ascii?Q?tLtpTDocZJ0gwVIgZkbLtzkz/rre00/lEGH6jqKbqqo2baRt7bbupZkWnbkU?=
 =?us-ascii?Q?o2iZCw4SoCZ2u4mE7DHCN4PioO0z5NgKVlAg0qjBWPzVJr/HJkJJ0n7oe5dV?=
 =?us-ascii?Q?vjhAt75z3egFAPCAX3Qw1i+4h7gOvb7oNriX1XqoFJ7Y+iZLpfLbmNX3Hs3O?=
 =?us-ascii?Q?W4tsuKYpHqqYyrs7rF3xfh6ixhvw+/B1r6BOX3SvLkq0JF8Mylifrh2MLvCz?=
 =?us-ascii?Q?f8CEPmdHZunn5sQ6uNRfaT0D+aAzRjTAPg/SuizkZXVJGxAWhm2KEVq1qwHd?=
 =?us-ascii?Q?KZ7B+PWeuc0EgqZ4RSzCRnf/Y7UBYzh/6sK0bXiITje5XyKDriFC2fj++/Wd?=
 =?us-ascii?Q?gR+RCLsuF+jSVXOpanqX9mJdDYCKKC6xyg2nDRtAMkhH+pqrc/4MuD/yjSXh?=
 =?us-ascii?Q?72rcVgkUJZogKEfPj2hUlSz4ASGpnG3VJUFNYUhrJcTRxBteIURDUIigngHx?=
 =?us-ascii?Q?CRTQXCb9OQALiakCeSmqg7XmUIt7OrIhuLXh/n8U+7YE+u38NSTfKz0YQxO2?=
 =?us-ascii?Q?UkZluM2zeX62eV4smN3btPsCACAmuIC2fBCm0JGx3RoQ3t3XNc0x4bGz+eGG?=
 =?us-ascii?Q?Yctxu8cTnMn1VAcL5qvz0VSbAPX357ffCPe4vyUbCa6USTUbq+dsP5Q6ImLK?=
 =?us-ascii?Q?vIMDNdm7IidTbwzdBAudAjn/PyaUs478Ihny3Y1LXaWU/8JGqZyUfm4EvRKd?=
 =?us-ascii?Q?ATf0cgHl3r2iFY5SHIVf7lA+5Xx86scNlAOvSsvSudEalKVSWdyejJDWDFCT?=
 =?us-ascii?Q?dmP28+iQUvVCEZ+zaR06F9yatcxfUGdVVjTSIwKM1mOoXQCtv96CNjUuIGnr?=
 =?us-ascii?Q?IElb2mcwVbsPPTcN6ju/UVjJD0xQEkVojtylQm/vELxUwDq2oRWmnXTI5AzO?=
 =?us-ascii?Q?0FuewVPdev8HBcRTvYdv3aillLceJRxkpaEoiEk9eBuaNt+1qkAUqVI2mZtV?=
 =?us-ascii?Q?oXsPkzg66myeDo09qdrnBwKwHZEFfBcyOqfUtgW8JzEdwR6gj3YkipUORr5F?=
 =?us-ascii?Q?1QACb/P4z61W31NNi24olJOke57TKXi+Z2zyD5GaqkPoHJOwM7puyZ4xBa8F?=
 =?us-ascii?Q?ztSGFmomk0JDLI11sFEklI8hJzwhuWS8UoNtkSIGcHSbsF5QDT58LNvyhTY7?=
 =?us-ascii?Q?DL8AdDE9TXKFmu5erj0e8Dgczxl1jUWGAPQWuRig+oooVS5M5YZNdVkFNbM+?=
 =?us-ascii?Q?yhF6K6ywYFka4Jbg2aPuX0ZA6BZf/SAI+FxE5PpXTx/pQGPCHPUoZW9tgsW5?=
 =?us-ascii?Q?+Z852ovbad06hKwh2i53ShPBdy/xK+M8J5ma91YSO4RZbgyy0rNdyta7uu0J?=
 =?us-ascii?Q?Gsk3FadpjmlSzaJI6siTv38j7yQ1326takjMiAlwk4ybF27P3tG9mHdIeul2?=
 =?us-ascii?Q?M1byiGXZkyo+zrTZ4tzvtuVfgl0d6jQ9XomGxOtVlASvKydiJYu5nruVjFAW?=
 =?us-ascii?Q?qyG3NIGcYs8UrWUAJD+DNLQKy/ogcs35Qa9CRYbQNkhU+axyzK4xR1M4VTNd?=
 =?us-ascii?Q?/nCDY19scdX230g2H5E3BQA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ebd99f3-5bd7-4889-4703-08dda9526143
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 01:42:24.2625
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SaoY5VJfcSMQ08s9dzlqqvgKfFzrSmLGtuzoV8/YQd3vyB8m2StuU9Ixq61lP6RRn+EiMxVduO8gNW8VOSJ07nQpt0CKxBcdcdHmjoOX4jTQHrRdhPl64PcDO9b4Iamn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB15122

Current Kconfig menu at [ALSA for SoC audio support] has no rules.
So, some venders are using menu style, some venders are listed each drivers
on top page, etc. It is difficult to find target vender and/or drivers
because it is very random.

Let's standardize ASoC menu

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 arch/mips/configs/generic/board-marduk.config |  1 -
 sound/soc/img/Kconfig                         | 13 +++----------
 2 files changed, 3 insertions(+), 11 deletions(-)

diff --git a/arch/mips/configs/generic/board-marduk.config b/arch/mips/configs/generic/board-marduk.config
index 05ca34cd5a734..65433c5c4fdee 100644
--- a/arch/mips/configs/generic/board-marduk.config
+++ b/arch/mips/configs/generic/board-marduk.config
@@ -50,4 +50,3 @@ CONFIG_CRYPTO_DEV_IMGTEC_HASH=y
 CONFIG_IMGPDC_WDT=y
 CONFIG_IR_IMG=y
 CONFIG_CC10001_ADC=y
-CONFIG_SND_SOC_IMG=y
diff --git a/sound/soc/img/Kconfig b/sound/soc/img/Kconfig
index 568efa606ca4b..9a4cba6fdb505 100644
--- a/sound/soc/img/Kconfig
+++ b/sound/soc/img/Kconfig
@@ -1,12 +1,8 @@
 # SPDX-License-Identifier: GPL-2.0-only
-config SND_SOC_IMG
-	bool "Audio support for Imagination Technologies designs"
-	help
-	  Audio support for Imagination Technologies audio hardware
+menu "Imagination Technologies"
 
 config SND_SOC_IMG_I2S_IN
 	tristate "Imagination I2S Input Device Driver"
-	depends on SND_SOC_IMG
 	select SND_SOC_GENERIC_DMAENGINE_PCM
 	help
 	  Say Y or M if you want to add support for I2S in driver for
@@ -14,7 +10,6 @@ config SND_SOC_IMG_I2S_IN
 
 config SND_SOC_IMG_I2S_OUT
 	tristate "Imagination I2S Output Device Driver"
-	depends on SND_SOC_IMG
 	select SND_SOC_GENERIC_DMAENGINE_PCM
 	help
 	  Say Y or M if you want to add support for I2S out driver for
@@ -22,7 +17,6 @@ config SND_SOC_IMG_I2S_OUT
 
 config SND_SOC_IMG_PARALLEL_OUT
 	tristate "Imagination Parallel Output Device Driver"
-	depends on SND_SOC_IMG
 	select SND_SOC_GENERIC_DMAENGINE_PCM
 	help
 	  Say Y or M if you want to add support for parallel out driver for
@@ -30,7 +24,6 @@ config SND_SOC_IMG_PARALLEL_OUT
 
 config SND_SOC_IMG_SPDIF_IN
 	tristate "Imagination SPDIF Input Device Driver"
-	depends on SND_SOC_IMG
 	select SND_SOC_GENERIC_DMAENGINE_PCM
 	help
 	  Say Y or M if you want to add support for SPDIF input driver for
@@ -38,7 +31,6 @@ config SND_SOC_IMG_SPDIF_IN
 
 config SND_SOC_IMG_SPDIF_OUT
 	tristate "Imagination SPDIF Output Device Driver"
-	depends on SND_SOC_IMG
 	select SND_SOC_GENERIC_DMAENGINE_PCM
 	help
 	  Say Y or M if you want to add support for SPDIF out driver for
@@ -47,7 +39,8 @@ config SND_SOC_IMG_SPDIF_OUT
 
 config SND_SOC_IMG_PISTACHIO_INTERNAL_DAC
 	tristate "Support for Pistachio SoC Internal DAC Driver"
-	depends on SND_SOC_IMG
 	help
 	  Say Y or M if you want to add support for Pistachio internal DAC
 	  driver for Imagination Technologies Pistachio internal DAC device.
+
+endmenu
-- 
2.43.0

