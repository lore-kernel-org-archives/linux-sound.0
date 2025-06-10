Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011013.outbound.protection.outlook.com [52.101.125.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 470F425DAEA
	for <linux-sound@vger.kernel.org>; Tue, 10 Jun 2025 04:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749529361; cv=fail; b=rCEuUUB+NTmkORyvhEoFStBtMSpotMLKd9UJMJsdK1xY4uaNcqoLOlFEApmckBNs8/bgmlu/p1aYTAyEdE40pY7N+2dfGMx6tSyuhOqWVTAydMX1i4XsEVK9yfrV7esXDld5f8a5fWbCyfYhiaHaQJ72sbXJH9rqc9IE/rT4h+Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749529361; c=relaxed/simple;
	bh=30J/OTipYz0P0jIWPL52n6RqFBBVcg2LDce/UvDEmn4=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=fhF0rxzA490KkP7qKNftr0d2xgg9zVnCe+BsoM3BPy/Q4pcGaTIrle3PzfDQU14iN8OvZkV5ZRbrF2g5rfdV1vCDVbmDk3/rWrTrRZXCsTz/JjVzIP078rbM7vP35ARTqwLLRvCXFVvHt1tslZ6saNYWVsz94TxL18+hbgQtTf0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=OikQPTeC; arc=fail smtp.client-ip=52.101.125.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="OikQPTeC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HJMArj02Dei9H0S0wPrLxBIssdfY+nVvuHIAD9zs9mVGQq5AJNVH+fWghG1LfspGwDLFJkQ10CIAhG9EliyQmyFeEz3kUJSSmbKR8X/FKofhWzXYvTt/zfiKv2r0cx5VKDKmoAaTOmK+QekVVUa6HeWPUqKJfF7iUj6Zck7E1A7u5GD2oqSCKPkbDkV0StszqRxAr5v8tjStHqKq5TIUeeAO9mkgjJdPOOrlYP2XqPpLTFrrHnu5DwZ1VTihXieZqwUGd6BJTaUCxCMfQsfWgSZOmq00pMWDN0rBMdwQ9pF+Tx1k/UqHJTxB1Lup+RkaZWAq/JKr5vguEjXEoYwKyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jnECBXrRzUAxdufp2nlhPsWaNcrURrFdBLni/h7teus=;
 b=Pl2udM3APM9nKaR8Bn4Dq/vgQ86yzuacvIH/Uelbu7OIvUOvJWAJiUPlfMFr5ASxZDaZlVnT4MPNzj/tDp/TCnxR5CcJlp+vOg+o0xnGFgM7MgosT3wZqisRDxXsEqGg483oOOY9DZiWjRo9xO6ggcmmOSdBnTnHmmYZHNLa9T7LgyrkoeIfECgcIJKQ/sYH/0TcRgwEZiQRK4Zf6b9S5qPkNbxeaZGfI4W9V6p6ac88eG7XUnb1Wi/Z7k7A0BDwdZsAXmfb18XiX/amXmBPZn4fi/s3u7zO6Szh/Sx+OSMBvBZOWksdZq/v01yxkxIBq842qLnlMz987qyJ1uYtrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jnECBXrRzUAxdufp2nlhPsWaNcrURrFdBLni/h7teus=;
 b=OikQPTeCzsu+PgmZ0UZKOM1ey11picQ/FJgHaqBtiWaeFQqyvYa5DFjoeDYBtsdTiHzFlO0a+h3dYi1y04xmkKARZQbNPIi6tOQSNYQFHQyjh6euj0pPlThvs1z4XHXEkI6KoGNjXNtYaLl/Pq9ieX00PG8MCwVl0JlU8vIUOac=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS9PR01MB12373.jpnprd01.prod.outlook.com
 (2603:1096:604:2e8::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.31; Tue, 10 Jun
 2025 04:22:31 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%6]) with mapi id 15.20.8813.024; Tue, 10 Jun 2025
 04:22:31 +0000
Message-ID: <87cybc6xa1.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH 24/37] ASoC: google: Standardize ASoC menu
In-Reply-To: <8734c8bf3l.wl-kuninori.morimoto.gx@renesas.com>
References: <8734c8bf3l.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 10 Jun 2025 04:22:30 +0000
X-ClientProxiedBy: TYCP286CA0176.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c6::8) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS9PR01MB12373:EE_
X-MS-Office365-Filtering-Correlation-Id: 07c013fd-ec85-4d1a-a444-08dda7d66a84
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|52116014|1800799024|38350700014|921020|41080700001;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?fzPtGj4K+ciri6MJJ5B7P9WCnqLcYZ7xysumAggfHLtXLU6tSlkiM7tO/p2V?=
 =?us-ascii?Q?+MnA87t0TSnTSPKxwAp4sbLl3sD9DQJBtp5WafyXDQ8QKRMvx+c9kG8TnmvW?=
 =?us-ascii?Q?phpFWgb67MEDT6nYdKwM4YmwzxJzwF988+vjG3mQB+2RQmwibBXxPfxrON2Q?=
 =?us-ascii?Q?3Rd8jyUhAwMTaBgasYN5SLk/NDk09ZSb/OE6wMIeBDB0jdbhQELCAM6p9cZE?=
 =?us-ascii?Q?pAv9/w4RDJgLkfM9P6uQ57ZxRGCM3trX3J/1QlSDV3Y3Uf/zWiLzMk0FNcXf?=
 =?us-ascii?Q?DuDd9vsu1F1vCO/8wfUqf7lB4JuljRUeVsA+IT5tuZ8XhQmc93/aqo3OJ1Vm?=
 =?us-ascii?Q?VeK3TRAwhllcpBs544h2NAkh6IK6qKujdFr72TR+pR8TYaz/9DHBbCJiI7DB?=
 =?us-ascii?Q?ivdrRUfzlNIId1YXcg3SEpeSXOLM7I5A5qP8WkBLU3DKXWZTWAg8bNLU7WQ1?=
 =?us-ascii?Q?S9j96qPJrNGyxFkKw+aKt2rzz1upAIey0/sfvu0Fjkb7cfOZ4KFpsnP41l0k?=
 =?us-ascii?Q?xds3qAdxAAHg9+5/CiEtO6TBidb2/RVxoTboNUO0ib/AjT3uTKLZbAaTsksj?=
 =?us-ascii?Q?c6hMsMwX0WZKR4xwF32Cou7GugCvfDmUuYAXbQ0VoZV94iTbEaQhnOrvnwbu?=
 =?us-ascii?Q?Z9hLolO95xssWVToYJDTYhETxw0JsqVEIY/OIXBqkrd5b5nHAN/bg2R7E87O?=
 =?us-ascii?Q?Bn2IH0CSsCipi+IW4S/X2X82P//XdwhKAOjQZl1IghPPAUmik6apP4NicAPD?=
 =?us-ascii?Q?eiwm1+tjJmPE9hbwPlhDXYgDPYiPkLQuDYBh+AJWkdclkr5+VBMVKBRsLh7j?=
 =?us-ascii?Q?ya6/wgiUc1YTTsukgijsUfUAsUlw25DM5ySPn5UcFlq/oV7ljXqR+8azXSBt?=
 =?us-ascii?Q?LkqDkhvwCZ+JuI+IwQwko/Q4EY60/lUsTueHRItcEfxj7Ziu+5HpMWB2HX/N?=
 =?us-ascii?Q?yrMIy/hg2YyEp5byJnYWb9GNS1HZBF7xFVk41tmpdXqtUE81E6lx/rrJpjfN?=
 =?us-ascii?Q?6uU3wNGgJKBLTS68yuDttFqKxhU5xEE4q7+sGKPASd5B2Yck4psTmUrxOm4Q?=
 =?us-ascii?Q?IC5VZDHPFs9vu7fe8Elr+/hssncq0v5b0s7acofyWA08/WIT6LvLZzD573+v?=
 =?us-ascii?Q?HTY2j4PwZDStQjLUyTjjN8kZAb9W8GzjbGDMr7DF8+vLSjwOfT2n6rPZNOzC?=
 =?us-ascii?Q?F3PMTx+LtbOM87LfEDrJd1eNRlIROQhgSRYrkgavN8Eh1yCY8nggB8UHYgYy?=
 =?us-ascii?Q?yJW1w+h1BTtdxqHR06Da31g284L+SMawS9obQapSJrEzf5lIr6yrJk/UL/Jq?=
 =?us-ascii?Q?U3GV9U04AA88ojGGXKbIfnr6M1FdsQIMTJkZYIlx+h7FoO5kcaf4IAZegAIy?=
 =?us-ascii?Q?/AHEgV6phRjY7W6bQsr+BEvMyGeqFgYMfE1PskZhuG8acyrADYh2EsvZtCmX?=
 =?us-ascii?Q?5V2YrxdDDfZznpK9pYN0yW2F914niYVwxQ8Tc32DLjaUdm64YRVV+Momn9KA?=
 =?us-ascii?Q?OYyXPAh1WpNNDyfHfZcdLNBv61euzklq/HOHFPaarCrHGd0LXelVReqz7g?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(52116014)(1800799024)(38350700014)(921020)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HvUvVBOQRu/JXetgmiL+bpBImhDKNjY4XiG0x75CSF7PTljEo5uZfeomIZv7?=
 =?us-ascii?Q?EZXoScwDMSi/VPjESjvmXEphrzJbLiBNo8CrJSF0WnDlRoQavrFM/EfQtZZc?=
 =?us-ascii?Q?ESII2yLTSZ/bot5c/ldIS9YdXa5SaxzM2kFFitTbhfjBm4ntDjnA+kSjB+G+?=
 =?us-ascii?Q?LB3WROJcSvmmu/KNmZfLt1NhlvGnfIMhJTUUwAayda0Bpf0QajstoqDoEKCr?=
 =?us-ascii?Q?nW+Hepj6Q3vn1XGi2AmkJxxkwbduzbjqvP+JhaPkkdFrCzm0+jMhfJvBak/U?=
 =?us-ascii?Q?sEKahyRQNt1GNx3t9BO6stokjXeFpKPp/ZlQwu/ypGqe4szLt8dfzOep5FTE?=
 =?us-ascii?Q?PJw4HYFCtGch2qHsbbvRRzVnaYSrz/XIGoQUhGSGlYeGD2bbiaJqq/xNSYlh?=
 =?us-ascii?Q?OmMuth0fV/XdoXaNCQ1JQR9+Y2DcXTG3lv3GYMVWyByKv/6CvialjnXivlJo?=
 =?us-ascii?Q?ZLIN017x1szlCUz6xCWhMyAaotpPit+yyw8EXM5lK5+MlL2D9e01L//NDUBf?=
 =?us-ascii?Q?iCUEhnfvhLq+qEieC03HyjW3PzOlkHY43cCfb2WXMcdy3sbmvh34sAjBGXiS?=
 =?us-ascii?Q?E3MVMuxF+I0I8aD6SAHnlWv9yO1gVVAHhBum0ma1AS10jD6TdX6QhmKkrbqE?=
 =?us-ascii?Q?ofoIC8Ov9TZt48otLrhhZflwn5vzWUx7i5ycK0HxcFlq3haXOOM5DCGlBleI?=
 =?us-ascii?Q?oPl4GWxqgF/WOaPSSCH5ZhR446uT//ot+d4+Oh1MyYe2vdx0BYXOfpT4XDwt?=
 =?us-ascii?Q?kYHYVJ4dBiV/9ts/DqlV3Z1BB2ZumamOhRg6xkHlEWyQHzhDB+T5RoDhELLi?=
 =?us-ascii?Q?GclSpoAE018zhzXz1NNOWswSKmAgecssIU3r25XFkD1VDmEXxVu9oZrFI58J?=
 =?us-ascii?Q?G7bh9h0LnowXcBBjGS884LfZD17tD1vvEHIgX247Nj+Niy1OOERs5LSK8ji7?=
 =?us-ascii?Q?Qi3RZC//VoKb1imSbggrnCkNohvBw4QML6d8184k7u3rOzDThMlBOa9/ZEW6?=
 =?us-ascii?Q?r9/b4DFJDlxkdREG4B7Cp9XWW7mrmJV4rf/CtT22fgZthlfktFKZnUIW+VrK?=
 =?us-ascii?Q?q9sarup755o4SV14GybkqzY2pT4LZj5S0TYKUGjcVNOMevxeDuF5t2yvLobx?=
 =?us-ascii?Q?t6WYrtG1y4chVgbU6T5fkPcq7Mo6mnK+j8k4q74FSQUnDju4jItQ1PcqBcjL?=
 =?us-ascii?Q?/84XIs6ZQhMlAc6Lvf0R/7dNueud99JHRbux9zgYhAGCiFTErugVqgoqHsh9?=
 =?us-ascii?Q?VhMrpXkCzZB1d8DupXp8I//hY28IXT06C4buwZyt1QB82p9cplsxJrk1TPPQ?=
 =?us-ascii?Q?PY09qVOczUDGQb7LDp+kjn1MDgwIreYKEBd4yqzjYQc/vJm1ofb3hs9tOuZ4?=
 =?us-ascii?Q?dn5iMh7NrI484NJELXfwBssKePc1YMUFa43MkIyzW6rShklATN85X0cyi86b?=
 =?us-ascii?Q?1wXdNzjGCP+Koc5rUpnSNNBp7HOgCMx1/ZpjoxQm9COkS1sSPWuZlozkwqxQ?=
 =?us-ascii?Q?MWp3+R3mfVv2cJU7b1HjLos2qrtjPMP0pMjXsAbQT+7ZAYjHuIZWV38a6phN?=
 =?us-ascii?Q?QDMU5Kzi8WKdUMZT1wrYCiwBZRS974xtT9afH3eSPs2PyCIecrfCwRwXb68Q?=
 =?us-ascii?Q?IyShBwNqwnFHIerggZW1hhI=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07c013fd-ec85-4d1a-a444-08dda7d66a84
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2025 04:22:30.9771
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4zCgxhgK41GbwZz38EwPCIy1+dhDR9j04dEfes9CJ4kxjvTWCn2SubI1nDwA4u26RkN3O3YG+tcS3WSU8uX7FT5wgwXc9IzBWcdeEyNW71Bf+Lkbp3R+6b5U+aVfNSrP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB12373

Current Kconfig menu at [ALSA for SoC audio support] has no rules.
So, some venders are using menu style, some venders are listed each drivers
on top page, etc. It is difficult to find target vender and/or drivers
because it is very random.

Let's standardize ASoC menu

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/google/Kconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/google/Kconfig b/sound/soc/google/Kconfig
index 7603782fb0602..b174d53e0f12e 100644
--- a/sound/soc/google/Kconfig
+++ b/sound/soc/google/Kconfig
@@ -1,6 +1,9 @@
 # SPDX-License-Identifier: GPL-2.0-only
+menu "ASoC support for Google"
 
 config SND_SOC_CHV3_I2S
 	tristate "Google Chameleon v3 I2S device"
 	help
 	  Enable support for the Google Chameleon v3 I2S device.
+
+endmenu
-- 
2.43.0

