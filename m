Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011041.outbound.protection.outlook.com [40.107.74.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39F96136E37
	for <linux-sound@vger.kernel.org>; Thu, 12 Jun 2025 01:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749692534; cv=fail; b=DkfpSjT8KWeAlRE4IANQveNweRdz4r5lw3hR0auhMR0NAaQxua475cCSN6Fosdtonk44nI8BoIeNR8Mw0okZklJkXZqC8iCCbJKRHkIBwBeMjNO+5ULH0tv6t/dda/qpnMdTxP3nJqxwORumy21etuFh36mtVotWpkzfZg683Ik=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749692534; c=relaxed/simple;
	bh=LOE//QQ51q6xwac2daZ48JJbJyr1tV0m40hFNHRdh2k=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=lELi2JtphcHqg0a8ysGlLwZp6YE4WP5m26vkhiaqJaJtevMAZ7uKOA/lSRxVvFYNW3AtuNvlUAdaMGCIgHWrFY3OGMKPNr6u1W0ZhVILAyQrF2ei0HyqejL8Za298lLODVw5su84m7uGhijtVSDcskdB9MaHMDITpQ8r/XOYtqQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Xkr5m3Ma; arc=fail smtp.client-ip=40.107.74.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Xkr5m3Ma"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XOR+6Rsn1uUEzRfFdNljGw5pLkrEIwc/0Jz7pwiGWid38IHC8sFq9SOWxUqbQh26VEI+icgzLnwoFViRTGSgoGe45yFz+tGlutlv/tPYSLl7jfj2jH9xTbfb4BwGSDUWkHdDFLS8BRmKG2gh/yLTdH9jZx4a1szjHq3Zmn9cB19nOGLcWSZGpN9OOmRqPbi2WsQ2oKb+MBkWc4AP99yknXp4b3lW+f3KBfDlzM5w3kCvmyIytmMlsq0DZTudB3zbaQQTV5BhmdFU23A7LxOT9FmrB9Wmz7BNWrTBcYyJ0F6quG0Rn2uhVeGyhRmFeC83SspDkrw3HgUUaO/t8O0elw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TJk82Yrta0qBymAIojY3tT5mef8pEVKhjz53lqxY9c8=;
 b=aRN+KEFcrKCi2GRHLlZQ7itYwM58m3nwQqTS4um2vo7bW1xD75AMzLa/xrMo1KtHSV00ziTCn/T4YElY+iq4pC/IH2SZXFpwBpzeOnpFkBrujLtjxqS/4y/0H1Dq0nVCRsBH2s619ucMmFtZTgMsg1uRpANZjx9w7wSkztbzPBqt1u+VmkFaHFNlVxMKGAVbiW36Ze6hrAZcG7qyDfHc7TTBnK6CxkcvjtxWlt6g0BRdP9oW0UCwpVlBBWaJTbzey9jgRbFNtqkGBCsSWilEYj++lFBNhYTisDBYqY4IF71JTtJjzZ6ITfYZt1g0PguBKC2KLIbW2cRuFaJD4ojWIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TJk82Yrta0qBymAIojY3tT5mef8pEVKhjz53lqxY9c8=;
 b=Xkr5m3MaSZWCkivpx3eD/ShR5yBiGQXLCPQ5NPr4D40BvSptRP2PLufBFlY9Hj2CWnAqBzUhQH0wSA7CPO5JHlJa9zRh7NQprVtaabS0ms8Ex/scqePU4HnrKIMTblyMCUoh2sb3g9Na5zFZn4teH/XOWVMhtbszUHqbpJylRu0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB9937.jpnprd01.prod.outlook.com
 (2603:1096:400:225::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.25; Thu, 12 Jun
 2025 01:42:01 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8835.019; Thu, 12 Jun 2025
 01:42:01 +0000
Message-ID: <871prp20t3.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 03/39] ASoC: amd: Standardize ASoC menu
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
Date: Thu, 12 Jun 2025 01:42:00 +0000
X-ClientProxiedBy: TY4P301CA0033.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:2be::13) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB9937:EE_
X-MS-Office365-Filtering-Correlation-Id: b7b2ded6-a387-4f6a-b53e-08dda952538f
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|7416014|1800799024|366016|921020|38350700014|41080700001;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?VqxKjzgfnqaYAjkJv0jK+8Ri9B1DBegA2mSIR1Jt8XNQqaWNgp1YyqumO90U?=
 =?us-ascii?Q?rSRXeL+f4T1SprzZWebSSzzewQ+0vaMdB+7UDckhFo1bxk5BSwB3XTv+mW+F?=
 =?us-ascii?Q?8vdVECKey9af2+Efilb5QutjAAchVQmj0td4EmoCAA71tItSi42fZ/DVVpDS?=
 =?us-ascii?Q?Z+wCvGgL3D2w2BGVKAVDzLxk8NQxmdRdXU7PIbqmSTMB5NyC426B060p7QDY?=
 =?us-ascii?Q?KXiTrZhTLgHZQrW4XbCmdJCIxjbD1uwrvnIntjhmiqtHT+XbdUleOoH0FtAS?=
 =?us-ascii?Q?+EYOXl4hpffPLSz48dpDDgpLyJr4JfF/Nr/tenCJOl2BCOxnurxw/8B20WzK?=
 =?us-ascii?Q?5ynU+GpixdGdC8ciZrZRiwu58xX7WR6NPqgmU2dorQbm5EtnR9bw0ZpnRcfO?=
 =?us-ascii?Q?HQNGfvsWgE/G+mmqpC7p+0ZcV1ozx5XWP3x/pL9TvUhsdTjdT2mljuQ37yhf?=
 =?us-ascii?Q?JGU8m+uQIvvNTC7+mfLCOf2GIYI9uEEcbJJMrn7cUAMsM3naBDrHMnipjFo/?=
 =?us-ascii?Q?EDFlD2mIRbOw9Dac0TOwK0VptsfWqp2MzH5lVhbcjN7zeO+E+iKxrrG7oJnn?=
 =?us-ascii?Q?1bXLoBsD44sTCn0bqHvXXnusaa7hFkr/CssW+xew4GPrj1DAjO0hPzZ6xdS8?=
 =?us-ascii?Q?thfVKI19dZv+fYicQlTYDl9X/k9MS4YvC+EjUSe0jj6lqZknOubA4IW7AD2R?=
 =?us-ascii?Q?WfCyCC8j5Ht4Gg9JuilKrJogQCWivMzSmGqYVuDanzzveVoMAOPjCU/FsK+N?=
 =?us-ascii?Q?EGBi5c8EomZgCX6cIaTMBDbXama9RYfCmaIbuVpJyr/6IsfqZ7lFpHLiE4k9?=
 =?us-ascii?Q?naKFmJezKfRUriYm8eKO3V031kLpEWgoM2NWj1E6QXlnIauKJG3RhfquIdlS?=
 =?us-ascii?Q?+1PEV+jRpOXoANsdgRAguEj4LqE/aO2S1Y5NnHvAftKdEOEyxeGZ5ZJSzAk3?=
 =?us-ascii?Q?CA/33jwv4NPVyn2i033GGOeTZd+5PZvBRolNvwJMu+qL6PkwJU91lb0HWSx4?=
 =?us-ascii?Q?5G5Ke25+gyggbWUjuP5AGip9fCxkHNc2083GTcbbIDWQ+qUZDeBX+rNeYmOk?=
 =?us-ascii?Q?pgnFuPFEq1/285AskfvuNF9NnpXtZ6z6WZjL/Z4wVYyKgWE24xxQlMT/7UCW?=
 =?us-ascii?Q?sv0+48vTR+ruIQL0HAxDbdYxJl22qSYPBlXF5HUmIChjHnyNWlJ9BGYS9yr9?=
 =?us-ascii?Q?hNUInbj2pfZI8WcHbCJw2mAKqEok8aeraWFahxbNBEJwSXew3OkKKjdFupiI?=
 =?us-ascii?Q?BQCxNYABZY+JdsdRt7VDbYaKCpeeo/kC+hUxxe0pVkAgqRl1TFQ3imbGRpRD?=
 =?us-ascii?Q?GTNa0sfGPrl2p+oksQX9e3nFnU/6BuA6Yzj9SXFqRzfjhAGzPoJuZe6175r8?=
 =?us-ascii?Q?3Hc6UeRF+L+pcXocnOlS1dbw0bWiE+CB065x0Ibhtmf0RvkEywd18s+HAtj7?=
 =?us-ascii?Q?O9D2tmRZCBskk2nDMnw+6qlaRyKT3jqqrK6wfIQFJ8JBLcgQPe00p4CioWoT?=
 =?us-ascii?Q?i7NBrvoSvrWNWvepr4LURg0aHIYIhShJwTkni4CMfmQ9nMmtJBTkL9FTUw?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(1800799024)(366016)(921020)(38350700014)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VaxtsiPFRKCTENkciXy7p0hj0bBW7ELAPOPnEv15XGc+2Y2PntDVlZkFwHzz?=
 =?us-ascii?Q?zr41Yg/2DAFnVCgHH99mE17JrPFN/MR+cgFZZ1P6orD029ymP1AbcE4q62FL?=
 =?us-ascii?Q?KBst8/VkXQtFzwwtKbwSEABxmg3ZWNIdNvs8HM2U1+9LtGvUK11ygyuObW1u?=
 =?us-ascii?Q?GQUZPpPztwbF4yKDyTrNmWCN8/eupd4wbfm+wMYKVZGkWqUJIDBkJSzwH4O6?=
 =?us-ascii?Q?Wc7xTK54dayQ8saxIW5SJFw5dnUhqUP9gfk5TCB8IGuNMIn/eRUbslpvpXqV?=
 =?us-ascii?Q?OXAbNgQHOjppV3RBW/b0wCVctnX+9nUuLkEbt4KESPy28V2qYNvTqZJF0WDE?=
 =?us-ascii?Q?i5pocFOWY8+4Nnahvsusr8Un44QsiWf66RdTKIGYlpFC/zzAWo74mlSHncZW?=
 =?us-ascii?Q?Tb21j4W5FHEH8/DLwiUGJjNRmnTHPWQoJ+/eNd0hwjFi+zYB4y+yTC0RMiuu?=
 =?us-ascii?Q?7NF6S7LFPEYFFqMbSg93EIXWtg+OULuFJcasRWGL2KtyLwCQDkmjuC4Bp/pG?=
 =?us-ascii?Q?EoWRrfg3+D5SHBGOTPodpmTUtQwvZw3QLBaiy7XOK05idkZ3lpAI2f9nqiVf?=
 =?us-ascii?Q?5joiG3AVB7ZBJcdPMPdzHzO6jkWG6tUDU/Y6aFnet3iQPdI0lm9mzQ++9VXm?=
 =?us-ascii?Q?Ns7C3wB6dIP4AAcW4iseXPLcMFYXUfI/RvBVuxFp8Fn3UG4g9OxGgKfPVO/F?=
 =?us-ascii?Q?iirJbDwTsvNSzrNcl5Nh7FCBVGzW0HTsZo6R/3ZhEnq9ud0TVnkKSD+zxH2R?=
 =?us-ascii?Q?/c7BSQrZsQX3W3Ofw3iArmEyMYInAwqfgLLaNACZESumWeS77rrwumWF13+k?=
 =?us-ascii?Q?BGB4MZTYVNfLZrtzS1AonP6j7sWnNga4MvkNUBzgqRWZ1F23mRMWDlEBT2mI?=
 =?us-ascii?Q?bqr0L0g2utxM1Frnm7e1FVMh6MqnMKa9Lkl48A0KKtIdTUOraGwOOOOhzdSl?=
 =?us-ascii?Q?US5uBDEq0oo7Lf1SROCarL7KFARjTap7jmn5gHfATu2c2t1tlhIWBGswLapb?=
 =?us-ascii?Q?m8QER+R9SSldNcKu83RPhR7Aj1ViiosJwWXRAr3XjeCulmYK39nPbarn2QtP?=
 =?us-ascii?Q?COSonP7EW7ly0QAtsPTBM8bSdQh2EktcbSt/NWukNjwYiIv28a9V4tJEhBI5?=
 =?us-ascii?Q?G3awrvnmfpiWSMJ9GGej3trU7v8LbsYcT3tC9b9gqB6H+UcZr29Sq/vOeKNU?=
 =?us-ascii?Q?plyXkBvxVNS9+lUE+/QKm7dDp8O9LChfiZjMezk7mf/V6DyeXzgL3XlJlX7d?=
 =?us-ascii?Q?PhTbFLQZg8QSb3xXTfLWC9C+j9x+V7sVYaixqml8EpFF4w6NFtwD0dpJzC6R?=
 =?us-ascii?Q?GgPky1Iv3TyyHdMs//ZbC2qooy1fwXy/ja6chQn+1qeertacy6v01ZxRDYxL?=
 =?us-ascii?Q?mIA6dJ9uFNNvGiCmteWHMEEYaAL32w9KXQOrQag+SHSHRLWk/ecrpc28OfxE?=
 =?us-ascii?Q?XOnCM90K0+8MX6/rp9HUhjn2olonqAx8yjBxwyZcd/CwlmeaoA3XVGXszEYu?=
 =?us-ascii?Q?cupF/GEBbLE4FIKwYxrmuAhfLex0kFTwF42huM7T1GWKMK3Wy8V1nrszGO3i?=
 =?us-ascii?Q?041wXtQxHuhS9XvdK2Z8BLLxjx2p05PHAKLCzwXRNPYQ/M/Mf/EgFOtulijU?=
 =?us-ascii?Q?LlBVDXkiX6Bsx8MwtqqYzCE=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7b2ded6-a387-4f6a-b53e-08dda952538f
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 01:42:01.2195
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6uuGiNADLv3h9ffZaOvBTiDRq6idSUvZcxAdA7sOyJH4aBfHKCSsGY8LtZLHyMVcazhgVSOlcoBecB26m437II4zo10w42LZnH+pC5xZQ3GU8ueIHCJI/LCF4/nbQDfc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9937

Current Kconfig menu at [ALSA for SoC audio support] has no rules.
So, some venders are using menu style, some venders are listed each drivers
on top page, etc. It is difficult to find target vender and/or drivers
because it is very random.

Let's standardize ASoC menu

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/Kconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/amd/Kconfig b/sound/soc/amd/Kconfig
index c7daae392d746..fd35a03aadcbe 100644
--- a/sound/soc/amd/Kconfig
+++ b/sound/soc/amd/Kconfig
@@ -1,4 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
+menu "AMD"
+
 config SND_SOC_AMD_ACP
 	tristate "AMD Audio Coprocessor support"
 	help
@@ -185,3 +187,4 @@ config SND_SOC_AMD_PS_MACH
           If unsure select "N".
 
 endif
+endmenu
-- 
2.43.0

