Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010051.outbound.protection.outlook.com [52.101.228.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E81133596F
	for <linux-sound@vger.kernel.org>; Thu, 12 Jun 2025 01:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749692680; cv=fail; b=BWWqaAgzu2RTZki9pSzg7i/YF1PKnhH3dsu4GqrhPq352LMpmNPFZ11Kn72BvuETleYN64OzUkLFvZpHxAc58KYnEhtbmvzCVHRrcWOJ7suiwjAH2CZB7ry0hcnoA5Euv45QrA9tMa1PpZjvpC3v3wuL0sL+BM76rCTvpuGwuoU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749692680; c=relaxed/simple;
	bh=GCdJVYSjS460SwogomIdLqBljdJM41uViPGMTVyrsvc=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=rJNAWja1SUybaYqAXf/E6JCMeOjn2uFQR5WzIKSBieV9GHZPcsb1uoaM+0CiQf4OD8Kz3AMDCeqRurzuNeCcaGMp7lpWtmChnL0lD4wOf9vwD+/M2iVF19jBKaAACblC/hQu9peTW+Aqxr3qHwA4u2oY/8n8ozFl3UgJT6A97YU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=PEzHCZ6t; arc=fail smtp.client-ip=52.101.228.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="PEzHCZ6t"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GxMw3j8IMMy3BG6vZr6/HrosDMQUZUNGMi/o2qajuQx+mnlNq03Ag/vX78gWTcUpgsRrKKzqjehH/Zf5GgleCC4tvNRm9d5rZ7P5DOUMfyC0uehnEJ6h7f0P/Mz9axC2CWdGGh9PDGlm/46Wc/7dKtBgQsb7bNrl+vNtgMiKzMRQxlDdwFtp+6tLfHcCO/O7MiON/Nub89ej4f3JYK8qYFBEDS6ObNi3lqE2WEObvUoekVyIcq1uorYGx6mGHV0UhetgKmEsKGBxKdC0WFK3M3xaxMYaTOCy0/cPMRXX71ztKqnQdRECs4bHHsLGkAb65cPHEhJkFj1ULBoxqnUVGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=to4Sd3brNhDFyxi6i7if5Uab1sL16vgXL7oQ6ljhTT4=;
 b=N48bTA7Dtu1bZlUV7PjfrSCyByrESsPaJswbnsstqNKBwtOTB1uPNVTCZR88OUoyqzNcufR/6p+gQxl/31DITlpVU9z4Ey34e6CTLQpE2bo2d1bM3reZLW2i3Zk3YYhQmwFVvm34BeaLFOoNMdGNGWWR7eV6DqG+HPlpfNkPBbHrniyDkNtrfScBgm8UCnSq3wl8tjFpW+msM1U332VeWmlI/rVPDqByRcwliJ4oLFEMmhsxl2WCNxk4oaVGshbX7/VtkRMq6jc2Uf6rU31uDhY/rixZ7NBpgwlH6lToxQZYXiQqDyMYPt77kRRXUABL1TWkdSlWdEfHLFN3NXvnSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=to4Sd3brNhDFyxi6i7if5Uab1sL16vgXL7oQ6ljhTT4=;
 b=PEzHCZ6tKs2Oe5Gj51QCbLevj3GvFt/XwQAobYlLrwv29X1RbimnpAzNJhJ5yaFN9EpZvxvKIntEIkQFDe04rnV9abGuLeNsMLtKY4zo3Muk8avsqofclamYtq7zByZyY6JGhwkTEsJNuacXzfHhs5bRodM5rG3DEAG/hrd60R0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY3PR01MB9824.jpnprd01.prod.outlook.com
 (2603:1096:400:223::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.30; Thu, 12 Jun
 2025 01:44:37 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8835.019; Thu, 12 Jun 2025
 01:44:36 +0000
Message-ID: <87sek5ybr0.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 34/39] ASoC: loongson: Standardize ASoC menu
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
Date: Thu, 12 Jun 2025 01:44:35 +0000
X-ClientProxiedBy: TYCP286CA0200.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:385::6) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY3PR01MB9824:EE_
X-MS-Office365-Filtering-Correlation-Id: d7c11acc-50e4-489e-595f-08dda952b046
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|52116014|376014|1800799024|921020|38350700014|41080700001;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?yMSDCMq/idxnHVzugeL19tZNPEDADCDJQi74G4pAUWVYzgBtyXF5QEEkp9gm?=
 =?us-ascii?Q?jCisRlPkvlX0StjH4yt4cAPllarzW8F+1CLB8sICkiAsXw1uOJDPsaP/Y1jC?=
 =?us-ascii?Q?Q1fWe0UniUy6IRHLqDSf3RjQNUolMqzh2wueItTiPDjcQAYMskaXxC+d9ZIu?=
 =?us-ascii?Q?EUqnwvDF/eai8awBUK4Qf4rN3YADERpRnfXLoVmBmV2uMZ/HeIp+2wSgjID7?=
 =?us-ascii?Q?0qAhsu6pmR9sPpoPDkV3csVG6xuhT/p0Y2LCUHZY8/gLktG4GaVzGYNwwgxL?=
 =?us-ascii?Q?zdSN5vAlTcCPXjIPfG/W7IdyK0PsiyM/fg9/4dUbZbF1uKsU7h5cZFRVmvGL?=
 =?us-ascii?Q?TvNQYZ58mSnq12IVJsi7PkHqiVBdQWEZ3nzmaim1iz98aRKvAuBsdl9hX3TL?=
 =?us-ascii?Q?FPkyIbGO3KKNUj47a9jXjfKxQxulUt6PiD0rNZQ1gPnqKY5+dOo9F/f6l4di?=
 =?us-ascii?Q?a5pyPywFrf5eMfoau7Xqc59na4fy2v9DKYaWjlmgEwL1TYynpa7ZlfHIYMna?=
 =?us-ascii?Q?q+8hZcq4nr47wgmzyjsoULiaJRE0HeLVSer6QFvAiKQV9fgNeqj4zv0IyQD4?=
 =?us-ascii?Q?mrNPlZIoPerCvyOA7Orm5sb2pD1G3MvStI+kB9EsATd9mRIGL6E5fSrF7G0b?=
 =?us-ascii?Q?lvkoomEkgZklMUfxFcX8dP07GNk/q46qpPt1aspPmjXmMQpCZTzsGmWeHhpH?=
 =?us-ascii?Q?8Tae7nzQXq72/BGw/LgcWLzY/zlnc563W6lU2bgIU8JzYGL387MfR6CbwuXQ?=
 =?us-ascii?Q?iZXE4D+5shcmgaoDcv2WKgCGKjdB7dgsiO6IFlg6My+kBdSM0q4BbRQeLItS?=
 =?us-ascii?Q?cY7ueom+pzJLTUnWIIV++3o+qZ/a1b1es3Op7pTxuivgK0yA+8WhW1X5XLgr?=
 =?us-ascii?Q?jpjRH3cnAJniUNsjWQg/WTCLd/NGaQ1whp7GtIWECm6/K2Q7kPHp7dhKOmJB?=
 =?us-ascii?Q?0b1IWDAa57NFR1HXH6CC7A9V6bExIpB5tPYMT7KI6o4FJEqbG+x+AUw4Xwnc?=
 =?us-ascii?Q?jULeYuKaZZ01bIPfeButwWzF7gmtJpYyTnoEAKWZFL6Y36E+nWNpsiDjb4De?=
 =?us-ascii?Q?rPHZA1OaEu9NMAh7gilGb5e0tJIWnGvrlbrf2bJ2+wp7A8IDwvCKM/y4TN76?=
 =?us-ascii?Q?Rx2GQKuQO3sftVOAkcbBPCKXQNfDQSlqU5+LIF90f4wuwZLY162sih0Efljr?=
 =?us-ascii?Q?cXMAYf8rHkn/XEdJPkSQFUwSSherb7jnFSZntuhvGoQgP12TO2fLrP1w+Pg6?=
 =?us-ascii?Q?37D/kF9SPIMgbH7Ax96hI/8Kn7NV2YxnTvHjWmZqRa0Ubi8JmsITuZhf2kTo?=
 =?us-ascii?Q?R5fpqqERRCodpa0WiqtLoJs3Jll2KHLMbQxauWDO5eaEpfA9W8Rz940tJBWq?=
 =?us-ascii?Q?4vOeEbdnlbEcnSZ+4Z2yY0wxnrGKNh9cwDFHv2qeiV7s1oqKJFTrLfg6039D?=
 =?us-ascii?Q?eToEB0mLfNT+oIz/N+8Y90CuTlbnFZoh+Ka2JTTMWnQDAEn+mQGmEqvppNg7?=
 =?us-ascii?Q?ppsv5TKg6Jrh8bN1dMFOkOvMmjtWp3OpmHRrezJV7bC/YQvGPEzgOqdgfw?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(52116014)(376014)(1800799024)(921020)(38350700014)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QcI2d0wVJS3FWg+jbk5fqqovbpeqVtNp8wkEt51xM5dWjnwqOPWxx0WBfY1o?=
 =?us-ascii?Q?Tur3zchuRNMKxdEtuXab2B7iyh/PF9x4lt95rPmT+QWJZyD2R9b4lmrD+fZR?=
 =?us-ascii?Q?CYrKLy7+pI0nksPBxGZZuRurfTLlI4vS0tnxD9Xjs5sUlJcCycjFdweUhm1G?=
 =?us-ascii?Q?Dk5W2O4tzUKV2SEvRFtKibN68NY6UK7Xwf/nmHAJpaqvcTjOLlSCvrexx7iT?=
 =?us-ascii?Q?qugbKN/3/JXSwbBiVBvMtp9k0HBE1ozrk8o6ch+BX01pBjSYIzxDtjYdFgRH?=
 =?us-ascii?Q?JQjUsHR48S8qV3owikRkFg7k8r+4AozAV29qrmYUw7enCWkKZwm5ZuYgM/a3?=
 =?us-ascii?Q?td62i0v3dKX64sVKc4+L6yEEfvmAq/tF5eETqMJTt20mflx8QZQ7jn9qAGwl?=
 =?us-ascii?Q?KXRT+WlNsnUxcJmAoy+LCgVSgdtfuIp8yy7ojh8rF8aS3hADlvEJefGtzSCc?=
 =?us-ascii?Q?RS3BTt6hlS5SICP1jt98AmGIq3CVQZZY52F4uhKQqiWvHv/tPnPhQgfAexwA?=
 =?us-ascii?Q?aWil3O1D1zDg/EparyuP8yQBLHORW/E+QzyhqY7wpLk1phEZKQCxqPdOfLUz?=
 =?us-ascii?Q?9P94iV0viGuobWTgdQtd5S9YKzRU/EOPhofCFB20sBsbRigenzNYfvyTKnUZ?=
 =?us-ascii?Q?GAnTswDqRtrnd9ePs/P0JGeuJBGEdS+HhQdN5Si3m9gylhCjqQfaUT6udQWo?=
 =?us-ascii?Q?cKuZ6Q6jqfzQPB5USqJIHxvbs9RYJYpQMVdME7yDh9caVYkHJGCoJenq3IKV?=
 =?us-ascii?Q?OwMQoFNFBHXOz1TG0UdDGyDLQ5ckyOFmrtd1evmydEPPcE5tYIMBjr1bEiaS?=
 =?us-ascii?Q?eIxHpXlJb7M7s2f+J0jShzPEB7p0xSMcL4664qAqngK1kTbxN6WpC8J8yBIV?=
 =?us-ascii?Q?3Z+eo+2eY24/Vf/n626fGUI5aTHAvRE9uJLqyuv0q/wbRtCap8jMRoaRuhF3?=
 =?us-ascii?Q?0BvkQqinO+C2eA8WgMuQMe4lNAQt5JWkuvtXx1o1wUTDTshsY0TYgOUc69TJ?=
 =?us-ascii?Q?USUZAb194pFsqYYMqM9uGi6g3oggyiNjbXz04jVxUZG2HpttEJrBjJ4LM9Mt?=
 =?us-ascii?Q?nvLmXxbo2YAqh8Lm13g0twBBawF6Ze+W5JacDoz5XUsB1+5QysiLHBhgXuzM?=
 =?us-ascii?Q?3Z41IoCjWc5HfIHuvdPp3GAkAQseOOuxv9EI67lCDCTBWSeQGer5AjazHFDa?=
 =?us-ascii?Q?tHr5p67CCEniFQFxKfCoFptFxa+yJlvQSLVJvPAqKlsWoj2Mo7DaxQBlOw5D?=
 =?us-ascii?Q?GcsQI0wr+jlYVp6rFQsoV8x5jjwsBO1iHvESc1EcQISKWZnhufVAq/Eqe3LF?=
 =?us-ascii?Q?LDFW7frBipHZ5HPz3YjeTcCdfCN9gxTaO2TRn9jFFzkaLLWjjsj7c4946oJN?=
 =?us-ascii?Q?0OUhzIjgO6S1MfIfOvLVddaEGC4dcnqLTYtCkdOIJDC25vkv4pw+6a6LsXkB?=
 =?us-ascii?Q?qLT9u5VpvZXC5PjYxRCkHxQ8uiPhaD8bHwtHLGUqvO69mW6Xe3WGlgEky5ZU?=
 =?us-ascii?Q?4fJErgBmBBOGxYIN+cRwwbEDWdlUctCJuwAsSEHAiWF7kLeZjrOSGdTVgoIC?=
 =?us-ascii?Q?LnoeB1uBCproMW2IV85aoG2t2xz3okR3Vod/NmdjaWeQdPFKrD6mfSty3umT?=
 =?us-ascii?Q?HxRlbz0YY1a7Cbd5L43r1yg=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7c11acc-50e4-489e-595f-08dda952b046
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 01:44:36.9008
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L1lBByhuP20N7rlYL30cvNOirl+5hoGsKDPn1uu+olToj8pvKyK7tdso3SkT9xzAubTmYUaejWBPq5hF/9m9bIvtwCNrM0oYwRxxcR5RSov/a+WmL58OqNdtfWlJKkgm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB9824

Current Kconfig menu at [ALSA for SoC audio support] has no rules.
So, some venders are using menu style, some venders are listed each drivers
on top page, etc. It is difficult to find target vender and/or drivers
because it is very random.

Let's standardize ASoC menu

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/loongson/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/loongson/Kconfig b/sound/soc/loongson/Kconfig
index 1a3c28816e7ad..2e06670e4d7e8 100644
--- a/sound/soc/loongson/Kconfig
+++ b/sound/soc/loongson/Kconfig
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
-menu "SoC Audio for Loongson CPUs"
+menu "Loongson"
 
 config SND_SOC_LOONGSON_CARD
 	tristate "Loongson Sound Card Driver"
-- 
2.43.0

