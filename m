Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011029.outbound.protection.outlook.com [40.107.74.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAAFC4C83
	for <linux-sound@vger.kernel.org>; Mon, 23 Jun 2025 23:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750721387; cv=fail; b=qmUkLwkH7XGW2TmXSwt//e1PfEEIN0wBDCHW7QZccYTt40zZURInvW0uNNfAR9Uj4bdBtEjP9wREe7TPkT6+OLIhtgYmaZrbEFOBYnX9+AmwlESgS57It8bb8W0a9OKr0u7C4AH52JL5yWy0rMoPfz+vwqsSlIOBkUORe9IMWCs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750721387; c=relaxed/simple;
	bh=4G9vtEcG87dT8yTKA8J3ZwpQH2w9oK4Elox2kuoGAyo=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=MZ37W6nLMJKbwQty26XEQM0qGNwLxb99rWO+9TNlTW8ylmZpXQUPQVTEvve3DYuKII8k40yPO9noaBVsqTIBOed1jmpKXYHiaGDS1jfCN9Ya4ZCZPPC4coZCe1CPDOgYnxYHybBNol2LuDoWJku5y3ERps1s8qdleW3P5iYMqdY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=OI/QnG35; arc=fail smtp.client-ip=40.107.74.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="OI/QnG35"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SH9Po8iWxbyxX4yChzF9ryhCCOCLUoMkV4D+i7ZWcs/Aviy/uVMKqNY1I+jWKgduHaRkGxoXy54ukiWXWjGSocL7f6Ws1nXD7uyZrbo8AWFk0jJJqz5RPkCjSM7jmB1Y/9POljroV2du2NEcPHrFhjloaILhiQrvO7msbOm+5pKQtvyzCeRpy/vGSeRDELSgMB7Jf4daXGH6fWSR2tkfMYYq8F7sjCkROJ0gjQrT63dq7PBx22/pSXMbUnU2DQQAaIOul1sITqnURtr9oDcsBgnZaAeZbvOx8NOUKTsVI6Rvy/BoppRHx1mgbykDVZv/rap/TqKsUknUmz1QXcnEGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+qi+TtPhlGxW0MGzXLktR8WBj10ERLjbXPuumpIyI20=;
 b=PA11qWPbTWj+cAM/DiU59uCm4dvscUP3iB6/grn4a6XyAamT6axKYLvVtn8LIjUkXEo0NSyTwPIqazB7TT7hMkCP5ezKwa/ITkCCmmWPCS4utjaukpnlwHYmxdAUf2i5wzGYNqjRObPEb+XQb0CZZeP1uYh2G6G3ZF2pf7DW1JaZaiolOLOE54uv8pRlg0nGiC66DzWQIbe6hzMGXOHnUrJhV5aJLnhsM5odYwtyYuaNYyLarhumvhmgUMOgK32kcQa+lZeo9OhhUYUmAII7yk34P0dMHn+a3xyJ4jQdD8zvCITwslqvilqedkBC3icV/W9m7rXYtbUyRWleKGLhDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+qi+TtPhlGxW0MGzXLktR8WBj10ERLjbXPuumpIyI20=;
 b=OI/QnG35HeBr6U38iOvzd9LUxK8JnxO/CG8dxKDBjci9TiN7fHFwdlyBZ76ba0aiEhqnKigNlHPfDtRftzmbZ9IFWUA0lJkDHgSCGkR+QofnpfhdbVm+bP/WxNrVsjSTQRV4BqgKm7zOij3xYIUtwNwq1OqMUXokPmWomLbEWhU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYYPR01MB14661.jpnprd01.prod.outlook.com
 (2603:1096:405:19f::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Mon, 23 Jun
 2025 23:29:41 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8857.026; Mon, 23 Jun 2025
 23:29:40 +0000
Message-ID: <87ikkmqboi.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,	Liam Girdwood
 <lgirdwood@gmail.com>,	Jaroslav Kysela <perex@perex.cz>,	Takashi Iwai
 <tiwai@suse.com>,	=?ISO-8859-2?Q?=22Martin_Povifff=B9er=22?=
 <povik+lin@cutebit.org>,	Claudiu Beznea <claudiu.beznea@tuxon.dev>,	Andrei
 Simion <andrei.simion@microchip.com>,	Nicolas Ferre
 <nicolas.ferre@microchip.com>,	Alexandre Belloni
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
 <zhoubinbin@loongson.cn>,	Alexandre Mergnat <amergnat@baylibre.com>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 36/39] ASoC: rockchip: Standardize ASoC menu
In-Reply-To: <354ff629-0278-4dd1-9e73-145364abead5@sirena.org.uk>
References: <875xh120u3.wl-kuninori.morimoto.gx@renesas.com>
	<87plf9ybqp.wl-kuninori.morimoto.gx@renesas.com>
	<354ff629-0278-4dd1-9e73-145364abead5@sirena.org.uk>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 23 Jun 2025 23:29:40 +0000
X-ClientProxiedBy: TYCPR01CA0208.jpnprd01.prod.outlook.com
 (2603:1096:405:7a::16) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYYPR01MB14661:EE_
X-MS-Office365-Filtering-Correlation-Id: 2793a334-123f-46a0-2a49-08ddb2add3b7
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|7416014|52116014|1800799024|38350700014|41080700001;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?TEI7R+tGNAqfzg0EsHLq7vCC+6/PILJzRfvpyl2O25NkWZWXM82GGZy4PN4h?=
 =?us-ascii?Q?SdespnoSNlsMpwuFHAEISLChMxDDABmCYgvWv9jiaJ7YXznM02o2Z3wt9eEF?=
 =?us-ascii?Q?DUdkLOEXvhpkSUMPMrCfU8wKjtYH1i6U6nWuMUDiw+V9oASpwrCltcXXVALQ?=
 =?us-ascii?Q?O6oo/s1GVTb6V+860hz1hexiiAyXzvgc0PoPNCgR5Du2wIzzbbAtuzyYwWZ7?=
 =?us-ascii?Q?doCf29gS1gs27n0qbXoJW/xfq3zYmQjhXM07ETTRuTvGwK0fMVL6F5z16bte?=
 =?us-ascii?Q?hRRRqfnrklo8Q0iYi1VJAOLDPTJw/o/JaL9RYqbXn4QUzq4KIuSuuWZ0clKv?=
 =?us-ascii?Q?+eePsjMoGj8Qjmmv6bKywwBXS+0LTy41/ZlwKANBlTkPu0bTqZvKLalVP4ul?=
 =?us-ascii?Q?zDNQc8N8LcGdWcp4XVE0Q96jEHS/m9iW5dM970MdVZBm3hC9MDMdhLJkx4xv?=
 =?us-ascii?Q?5fGxqcDFH5X20QxaCyneh0Mtwfcj8b4XUin7eamGWr5TIFU5yXsrTQ+fK85R?=
 =?us-ascii?Q?Nd4MDF1FCqWnjYHgFjYjL5jYc8oOEIwfOoLlfaQ2A6/ApFYAzYufTohn1IvT?=
 =?us-ascii?Q?cktQlxJGo1wiV77BBnL0Ek8yi08NQm4D7BJcTi5wOAH8jhhv4LnWDz0h/Bff?=
 =?us-ascii?Q?u1QQ4v63P4ntPAug/sCckKU0Ur34e+5j7SZFoAGERqxIib0TCsC5YuVQH6qW?=
 =?us-ascii?Q?H9pPBVCmIAwppeKxNZWCIyGFAlDXIS+u5mOkeXTlFzOr9vMSYEOzakByk3lY?=
 =?us-ascii?Q?s3MeFSXCXaWiGprw0Jc5A0Ohxytrd0mj8Er9uOEgSP9GswA1HBSNYvl4FHC6?=
 =?us-ascii?Q?d8xoHyKKpci5Bg5g64VdoTn7CHk+xEWV26AkU9N+sPABWXT/w6yqy8lPmcLS?=
 =?us-ascii?Q?aAYdvhq3rjNQtyCheQMeQm+ivmA52xvvMZK9RGYFWRxWn/B5edkGHUYVb8EG?=
 =?us-ascii?Q?0AY2VkuVB65t4xsZ7pkAQIDUQhDQf3RGj9XMxw72GgiJFqrQamFIPbuoGdNf?=
 =?us-ascii?Q?BtIGbTSkAKhEeTnDhbGvzCM8EdHHhctP0e71WP5p+9erXe0NZIDi8yPiqARB?=
 =?us-ascii?Q?Vccno+BxgbAaDVAIfkRxiWbZ3RsZOauAXywWo8ndbd3BwlYfkAMyLw0kDcmG?=
 =?us-ascii?Q?vZmyiatLl6YpV6aYTseE+/1qQIku5oCkNWlTFqQOWpkhcjVHKByvMsh45y+O?=
 =?us-ascii?Q?4DOXFM0hIieAVMZY9l9x4YEwcoubjSbYIyxl70RbfY2hQN96HDgbLibZ/9oC?=
 =?us-ascii?Q?JjMduA+pISjwqE8PkAJP+Q7V+3Al/08EODuZp0eOwdEv+v98w1r0HOZSJn20?=
 =?us-ascii?Q?sym8qKcthdRqapl3CzB7X+7Azxov1jkvT8DlcC1jqyFTiwJ/4kGMMCreIESN?=
 =?us-ascii?Q?y/VfXNCARU0fNYVMAOzLHiCvS+4LpU4VafNNfuusLPoMti/877eFRoRLq5nX?=
 =?us-ascii?Q?CDr/BQBXGipliSW4qx40ywWlcF6sS+Gh3K/QlAUCcYiMxgOSecIggj2f2EJT?=
 =?us-ascii?Q?ObZ4vWTp+ltyFm3MqUQgB89ofhcrCmaIc4oR?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(52116014)(1800799024)(38350700014)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8eDS+HlZ/7oVM1AnSc2Yb22EJXyOfUxGnNMc/mxFsWP6KVipASpC4zlA8b1E?=
 =?us-ascii?Q?ChwTsVhsEiSu5vtukb2D7BCnoSgmbYUtJTHPqCqIPL/yl+TLyN/9zjWDCf/y?=
 =?us-ascii?Q?QbZH/FxJR0SB7VhEFXgrhOoeiRqLw+NTGVseNEiYIYu2QI8As+AezgWK1aNn?=
 =?us-ascii?Q?Er05LpQDLVdBWmqYpCpUp6d/m6m0Falu9fuR0GU8Luyl5JFXChC5Tb9mCoRi?=
 =?us-ascii?Q?uiUQI8FzYABpllTFVUAuNfk9lXExLPPaiBR7rBuCa06ab57tUGHPx2If13Ie?=
 =?us-ascii?Q?c7IHBP/OEXYUaIMZBsmn35nRgDWJTCggEGcN05TOOyHVGrcqPpyv4U2y7cm0?=
 =?us-ascii?Q?Vfm5vnRwqL+u2Qrku2MzotOofo7lIpJjvRY/7kpv1BAjWedWssfsf6437iw2?=
 =?us-ascii?Q?gzDXHR+U0rXQ+Lkr27otkYy/xguBLL5J210beotoFeKTg4meOE5TUnqOaAWX?=
 =?us-ascii?Q?Jkkvb66VBgAT20Tx78b7hSmW4v65IPcPUvY2UeherhM0vI8GWLFFawH/isct?=
 =?us-ascii?Q?r6nVADOcJoHUfLK+c47te/LW+eAzOS3pf7/+SQfqHu5VMzw2tM3aP+T24KnJ?=
 =?us-ascii?Q?umBWUc6LWnL/CveGsSSdlRkdBOFkWVtTwqqquo/pWgE0cEDMMxS1BggUA3AY?=
 =?us-ascii?Q?x+JRkQEjVTGkoWKX7pGnS7q1Qq/m3Un4n/hfhH+F43VlKURv7xcH5TSlS1JU?=
 =?us-ascii?Q?hWyGGyeIgykWpBfyrScBoOSG4xofko8uIxBEtVT/eJsesS/awtHA1py7uQ5l?=
 =?us-ascii?Q?/CtHnAnOAiBFKon/9GPmNUy4pD4D8y7OQ9m/q9bFefUEO/7SVyT8HTNminnv?=
 =?us-ascii?Q?QnEisUsTNV2lz3HO9A/hFqPaFHZNlOukfQ0B1Mx7T2anmshiAVvNi18A2gMS?=
 =?us-ascii?Q?G1m1c4PA0bxISkUR3fVSTHA9owldI1FOrUfwxg8RlcMc4jG1EPmKJco9IbVs?=
 =?us-ascii?Q?cYKVt3dsmoJRIigfynEkKgXetiacQWh3xQLGVo8O8MTtF6QdjFZ2ZOykjV0O?=
 =?us-ascii?Q?s9dSBpIw2O1kVL6zjEIyyWOsCqC3cPs2XK7WH2sx7ECJS6s7K4oIQEvE2yuP?=
 =?us-ascii?Q?uu2XygkU/vY/pDnJQEdni9rnPzua10+ZHuqSDFB3kANoklstQIpF20UEuv5L?=
 =?us-ascii?Q?/l+g6EsLuIrMh2f8zReB/E3zVFAmbsuuCiGfHf9qG8zhF45jpI7pWLiMngFK?=
 =?us-ascii?Q?3pNY11ytxllbckXrwExtmMC799tKxVslt5f87m5FzmYo8uzUzcnLMkDWxtj+?=
 =?us-ascii?Q?XN1eaRDAeK3UDpBnlfneoplkFsiazGbuAtxnKkix/OmP5dz2bL8BtSak5fz3?=
 =?us-ascii?Q?fy2Wcjxkbd7s4G0tHoHx0W6PqdXLrJY7jwnF541rXOv1MCSpCV285H1x26hy?=
 =?us-ascii?Q?21wa9Q4AR9GzQFh0yJMI2qRtLnQbQ6x+PtH7ZjBW4oI4pN0+6jkPELyUtuhQ?=
 =?us-ascii?Q?aWdaJwnfVDNNhcsADMr3uHKUxHJaaXQqEYstDCbwD3ya5+CSDNFznliAd4ut?=
 =?us-ascii?Q?3wlgFrm89ZzwYmkci9Q9k1igqlihjOAICvkWmmmjdJ11NFeDNeape4t+y2si?=
 =?us-ascii?Q?IxXOh9v4VrZM10oadz2b7AE/i5ccjg8abn0pgKWnHixclk+UjYA36MXDOkvy?=
 =?us-ascii?Q?Iwj4kWhBcKiEKm/msDOCY6M=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2793a334-123f-46a0-2a49-08ddb2add3b7
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 23:29:40.8887
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K3RsUp6cMF8gMB0sQY1bhULFYmPZ8V2FdqX6IlXyrtDkViHW25HlZK0eiXf3dN2pQeh4/xNbgyGvivabUq4RZpL5TjeIAaINJ3YnnkHvWGPZ+mrTVYAjQc/3iA0D5b1j
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB14661


Hi Mark

> I'm not sure it's actually this patch, and I need to try to dig into
> this more, but with at least parts of this series appled I'm seeing
> some of the sound cards in at least the RK3399 based Renegade Elite fail
> to probe with arm64 defconfig:
(snip)
> -CONFIG_SND_SOC_ROCKCHIP=m
> -CONFIG_SND_SOC_ROCKCHIP_I2S=m
> -CONFIG_SND_SOC_ROCKCHIP_I2S_TDM=m
> +#
> +# Rockchip
> +#
> +# CONFIG_SND_SOC_ROCKCHIP_I2S is not set
> +# CONFIG_SND_SOC_ROCKCHIP_I2S_TDM is not set
>  # CONFIG_SND_SOC_ROCKCHIP_PDM is not set
> -CONFIG_SND_SOC_ROCKCHIP_SAI=m
> -CONFIG_SND_SOC_ROCKCHIP_SPDIF=m
> +# CONFIG_SND_SOC_ROCKCHIP_SAI is not set
> +# CONFIG_SND_SOC_ROCKCHIP_SPDIF is not set
>  # CONFIG_SND_SOC_ROCKCHIP_MAX98090 is not set
> -CONFIG_SND_SOC_ROCKCHIP_RT5645=m
> +# CONFIG_SND_SOC_ROCKCHIP_RT5645 is not set
>  # CONFIG_SND_SOC_RK3288_HDMI_ANALOG is not set
> -CONFIG_SND_SOC_RK3399_GRU_SOUND=m
> +# CONFIG_SND_SOC_RK3399_GRU_SOUND is not set
> +# end of Rockchip

Hmm... indeed your .config lost all CONFIG_SND_SOC_ROCKCHIP_xxx.
But I couldn't reproduce it in my tree.

Get original .config

	> git checkout asoc/for-6.17
	> ARCH=arm64 make defconfig
	> mv .config config-before

Get new .config

	> git am -3 ${MY-PATCH-SET}
	> ARCH=arm64 make defconfig
	> mv .config config-after

The diff around Rockchip was

+	#
+	# Rockchip
+	#
-	CONFIG_SND_SOC_ROCKCHIP=m
	CONFIG_SND_SOC_ROCKCHIP_I2S=m
	CONFIG_SND_SOC_ROCKCHIP_I2S_TDM=m
	# CONFIG_SND_SOC_ROCKCHIP_PDM is not set
	CONFIG_SND_SOC_ROCKCHIP_SAI=m
	CONFIG_SND_SOC_ROCKCHIP_SPDIF=m
	# CONFIG_SND_SOC_ROCKCHIP_MAX98090 is not set
	CONFIG_SND_SOC_ROCKCHIP_RT5645=m
	# CONFIG_SND_SOC_RK3288_HDMI_ANALOG is not set
	CONFIG_SND_SOC_RK3399_GRU_SOUND=m
+	# end of Rockchip

Lost CONFIG_SND_SOC_ROCKCHIP=m is no problem. It was used just for
menu selecting on Kconfig.

According to your new .config , it losts some CODEC too.
But these should not get effect from this patch-set ?
	...
	# CONFIG_SND_SOC_RT1316_SDW is not set
	# CONFIG_SND_SOC_RT1318_SDW is not set
	# CONFIG_SND_SOC_RT1320_SDW is not set
-	CONFIG_SND_SOC_RT5514=m
-	CONFIG_SND_SOC_RT5514_SPI=m
	# CONFIG_SND_SOC_RT5616 is not set
	# CONFIG_SND_SOC_RT5631 is not set
	CONFIG_SND_SOC_RT5640=m
-	CONFIG_SND_SOC_RT5645=m
	CONFIG_SND_SOC_RT5659=m
	CONFIG_SND_SOC_RT5663=m
	CONFIG_SND_SOC_RT5682=m



Thank you for your help !!

Best regards
---
Kuninori Morimoto
