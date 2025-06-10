Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010035.outbound.protection.outlook.com [52.101.228.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56CBB25DB15
	for <linux-sound@vger.kernel.org>; Tue, 10 Jun 2025 04:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749529411; cv=fail; b=Jxk+NrWLflBXGz79Y4RXXdi07mSlpQWbmZAXcffN1D3W5U1BclzWKI5SANpkrvzsx6YolchY17FRjnjUG8Ibl5x9uqUpIHYzsGCVuzw8ReKxZqvYAyTbJX5ePVXIHju6StRRvs4dAGqMSdkhlLeAENbIflWsfDb7QOD2gCYP2nU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749529411; c=relaxed/simple;
	bh=3sXMjDmL5Obp68mWx4U2ytmADTDq2oWe9vbIhEXhVsM=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=RawThwSzf45EmZ7GGIULdndrj4nRHqyjrjBzjdnlfjFHRD7Qk41T+HMqfezHSYXVfR2uiv5OWOfWslJQvUGz1FMWrw4xnZzUcMIjwJBhYq1McPoi2Sj4360knMeq2sh+S3SMJSJUyBi/FPhjsjA22ox9J8lT0KFx0lLuir9SdAU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=j6cwOSxu; arc=fail smtp.client-ip=52.101.228.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="j6cwOSxu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CjmK410rkAafxFlC9rlbAHQjT22Ej+ZOHbHad0zF58k95zM58K9rkMgas2O42Yun6xArFOwi3XKnfLrMhDZoDjfWUGzhjlGN6FEjeeFIVfMm3pJ1vYDJ5nP6JrJKiXRTGWT9Lh1wK6nBq6N5XH4MfIeR2T9kYxUwlqr9gutGGr/FHNfCNB+cUVohqs81d4qGqQaxmzNkYBP4UV3dzFW2ggoI74LGZve9JU+wAJghtOMLk6Ah0NWwtdm6ybobDX0rA5trT6b6AXJvSwfQA8jyG4DAo/2rsbMpA9F/0voSISqgcWJGv+zG8W94p7ViiWG+TUE6c6H6vg/Q7cwznRosjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gc/otPgwd7ek3vU4DsY3VmFe8ImejXIGgnV2llje8/g=;
 b=rueg4hg9+8zW0UX6Cp1+szj3hO4mTsDHOSxDOJHYcqwD9VtOsBMoBb0a3Efob2xBxkH+Dx+Ry7jcJbSBuQQ3gNNEMCJtOgWtwMzaoDfmj37+xCV9Nz1Os6USp7j6sW/sw1i/XYuehfBu/fiNM0Uf2fWPPZ+AO03CNc273mT7BIGFU9Ttxxf/kw//J5Gsl7+59sVJ0LRyDFXq6yi2hVDMROKZ5lXQzE+u+q20ADcDSTZO4Mkziu57Gwjch+Gd5VxE/komuzyXXPouveEqGw1QP/wPVOGGM/S7IOOsfzsgdJDDmlQRwwxoEh+Ry0aWmOzSDN6zWfAj1AWPzZDd9WwnTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gc/otPgwd7ek3vU4DsY3VmFe8ImejXIGgnV2llje8/g=;
 b=j6cwOSxu7yoDo2mNMhdzLkIEai6fZhfSN7RDRH7onLFFqEY8jOcmFk9C54xUT6oKyFwJ7sKEy5EEB6SweMmDz7Yc4DdTltBTOeC0PaEt52mE867E++x4yg1U05yqFjTyQ04zs5ASaEZyrGhD6uovzkyrLm0wogadRpNj/efDpl0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS9PR01MB12373.jpnprd01.prod.outlook.com
 (2603:1096:604:2e8::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.31; Tue, 10 Jun
 2025 04:23:27 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%6]) with mapi id 15.20.8813.024; Tue, 10 Jun 2025
 04:23:27 +0000
Message-ID: <87y0u05io1.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH 34/37] ASoC: starfive: Standardize ASoC menu
In-Reply-To: <8734c8bf3l.wl-kuninori.morimoto.gx@renesas.com>
References: <8734c8bf3l.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 10 Jun 2025 04:23:26 +0000
X-ClientProxiedBy: TYCP286CA0269.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:455::20) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS9PR01MB12373:EE_
X-MS-Office365-Filtering-Correlation-Id: 960b7077-1a4d-42f3-4d1e-08dda7d68c01
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|52116014|1800799024|38350700014|921020|41080700001;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?mLM1kNvl2PANU3EXdkuaGtg5gcpvcnwW4MrY+zEOn2DrK61fHBHRdhL1jeOw?=
 =?us-ascii?Q?AGiQZTMNV6kHfJh8rcYNgSWQRcpjeNhhMS14rMr2kXFxLFrmnQZmXxvaGp4k?=
 =?us-ascii?Q?xnAddzM4Sv7g8HTG0GmnRzTEqCq5IvSI/SR4retn1ZorpooY7rBwk3x7sEbT?=
 =?us-ascii?Q?AhxdszIP9kc0E2qbh3qPW3Ht1uKdHU7SghOAUXDyMQOTUUFfamETlRuxWqG7?=
 =?us-ascii?Q?Bkdbwbw7VSzKtgOEFY6iYWfAfKJjpvvUAhDwvWF5oxnhMhnqKJE6NL5F5SrX?=
 =?us-ascii?Q?jFD+wPF2XP3xBCF3m6OPdHWFHZlvhAYo/xZXcEj5k3t8zPpchnnVJ+P32arZ?=
 =?us-ascii?Q?5ZxRX0QolbABHE+CFqjFpt25X0Fq7CJblenkJ7Y6YX8Os0a0Q9t5HVt/+lBE?=
 =?us-ascii?Q?zTlwH0eqOz1It3a6G/zLsNY0pTlOECt5xckmNVLzQjJCS9xElsMp67Le3H8F?=
 =?us-ascii?Q?nmKFf6vbp4f3mcS0ialG/0nbarZdfm6wC14wS6ymOtFBN+jlV7JOssNhhkIF?=
 =?us-ascii?Q?K8vHaVXUeuonwOcPLHZmKoPZ/uPbllsL2GF/N2ds7KbjJdJJ87X6CrXBEYNJ?=
 =?us-ascii?Q?jiiAteZ923WitqUxOzEreGln2/2g2OgErtQ+3Q0JjO5vVyb1wYerqXCxb8j7?=
 =?us-ascii?Q?RVg+6mk0F68g1Vf32uX6IAZFb2Po6+ODhIDK2q9pS/TVDQ+knUFJyv3kd41W?=
 =?us-ascii?Q?z4/jRwk31VpglbhdscvSUByVMcTLMYSx/EYkyVgPnBV72+D42fHPRbBoV5Z9?=
 =?us-ascii?Q?ryM9EEd3Jv2GBdEk6WS/4l6mr+Agi3/esqXHyIwxYae+YUykfedCnqHz9sSD?=
 =?us-ascii?Q?jkDMWhHBjCgB61HYGqqcwe0vrr/iiNEqB5UfXLj0Sth6U6hNLm6VB4D/vyeb?=
 =?us-ascii?Q?oYiDNINqtMR9oxm1u2fzCa2qvIFU4VTxT5sAUqtPJyxjDDaDawzo6bFdW11T?=
 =?us-ascii?Q?mE18BDj9nQd7lvz8rfOqHVz2AzhEZiWPPO1w1COU/rQr8khppR9SWN4utasB?=
 =?us-ascii?Q?NNBnlypPYI9RvzvgAyz2qj1A6xtRcghG1BmVHRzBJax0Kl3GeI8S3cnQ6FHj?=
 =?us-ascii?Q?IHsgzYqcXCkaskcEnaV3qaEgq0CBUC1tV5RtAvwQQB1ECMnad7ntDolB8DTg?=
 =?us-ascii?Q?kS2K/dc5BKelg0th8kGiMhktcAItEhF5HLdew9c8iaAi4IX6l7NTNCZgC2Md?=
 =?us-ascii?Q?kgpPsxtFzqEkWR/0FM4rqO2sTABG2c1OLgGZyvWaHRiehWQzAgmQyri+97Mh?=
 =?us-ascii?Q?4znthtqqcjdf/7nwgHm8EZNYTutLhqpGvsAwM1WDEHwVYVxX++is10adQpKV?=
 =?us-ascii?Q?cJtzTZPtAQ2/GwOVjkTh57s3ZD9uJNFEGmHzK0ICUtTlcwxzNl4kBE8kjiu1?=
 =?us-ascii?Q?WxjdVMjycHE9Jmk3dNTSLIbkiKsnM7DotVQ0RUSQxydtPNafJnyWMX4ajkiA?=
 =?us-ascii?Q?v/o9qefhFwG6heKLa0bRZhS/Yk3bAbDvb7/lKhrkMMZYoUyIZ/XX4SXJ+RHP?=
 =?us-ascii?Q?EBPjdPAXByWKD1ugmkBIN35tLpd3Pea1c1u71KC6QSX+Fl0msB9e3xKGbQ?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(52116014)(1800799024)(38350700014)(921020)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1pCMRi7IwcbFzHc4K/atblf6WOE/9jAM0dnUnvEq3kWmMxyypCHSp24OX1+m?=
 =?us-ascii?Q?/bjZQLt3813eaGbn/w0qXHIRi9VVxuT2ygyBPsjPM9Dzio2D33n+4KmCM91y?=
 =?us-ascii?Q?9nrZFMdsjqWim7sZ7CKAMNgpDckhEzcUbEwcv788L4FciFgzxzlyOjoaifyN?=
 =?us-ascii?Q?bNdj29g11nkeK7vFBI080VFjuRCW3nrgY0g2QdeDR0AgVUUVUFDE135wDFxd?=
 =?us-ascii?Q?Iljj5rI+W9DG881Erx9ft0pDIl7KayI5Pz+5ASCpx0IFh25NCVfLjrIprzmK?=
 =?us-ascii?Q?H1lUyzOOSrumuXei6jDeHJMXZv2oUixWreeaWvbeZLUiKZ1PrUQralHKYLX5?=
 =?us-ascii?Q?aGku7qnpyTS+1sxmtTgc+0bogb7NLmX1FYpdOGC0CvRzGluPqRIVkGotC17s?=
 =?us-ascii?Q?42oxQcpunungUn45GccHawDGcaXTUecGbL3OsSsqKowVqXjp0cWRITgotDiK?=
 =?us-ascii?Q?3r5j2YSNaLVXrlRuX9s1yuQ/d0OyjMhnEw1UZE0Igx6HLkXdWz58UurejsDp?=
 =?us-ascii?Q?GcaPa/qiS2Va3Ddijv7sPM7LkGBpe1we0ijqNkPFxW64iyo1YUBlZwJI+aWB?=
 =?us-ascii?Q?e3cfi6ToB9+RRBRd/9OQS8dqU+PFazNCU3A/pWaSF1+2aJridUtKHLqZTFpF?=
 =?us-ascii?Q?Buh9r9PEiaDgYjLnwSk1Tdc6r8Lqrh0D8ZaHj6RSVmIv4SLEtV6FNHxsBxOO?=
 =?us-ascii?Q?/nNACXtJj6WUsYpm9HtmdChOWnB8aglRX47M1oHd6C+PYhCtS1hQqBHVWtur?=
 =?us-ascii?Q?AFCXpnUUQPT443lLsCMxhcRaEJu2gykHbbFxTbXnnOp8aZ4QR83oq2gMos1W?=
 =?us-ascii?Q?BaxebhOKR2PuYuic94AL0W4ExsTRf8sliLEqj3kufwVR62aOKKBHjRyN8dSs?=
 =?us-ascii?Q?AK+dErR/4W6xgIR93V/HvQ7SBKf65mrNxvq0E6MhRaL2GWv4jeWPUPvrJF5z?=
 =?us-ascii?Q?c6UrXKRBuHpFei690QrzpPGcKOHQmsBa6SN9BxjFDQGwBshgW46z3wVDGen9?=
 =?us-ascii?Q?oPlQk/3K10iCevLiNj+IaQTrlRhuKdNuhBTnqUD8VYBEUH28EkbJq5hmPr0Z?=
 =?us-ascii?Q?c4gltcaRqBGDotbsj4Ss+wSgW/Y9Jrz6yH4Kmx3JBkdQzQH9AeeyFxl5P6HW?=
 =?us-ascii?Q?fjLzRDursTU4Gdorcqq20TfHZRJv1SKEO3UwwC68kch76/BEha2nrdkeDFuR?=
 =?us-ascii?Q?WvFwtcaGYy7X+GI5LSUFGgPfPfW3hisPAiqx+Olx5XkO3BC53MNESMHnS3tN?=
 =?us-ascii?Q?MDyVvcadWP6z6xDtECYOvcRvJf1GUau6PQ5RolRA6deEpOWpN6QSrI2NnKoP?=
 =?us-ascii?Q?mEWTWshhUgqw5sMSWwbIBeSf2EUFLCyV9s8ACNtbRxI04ybQhaNZeOJGjbwU?=
 =?us-ascii?Q?MBLXMQrAu0Mwp8n51slBDMkNdHV6jrclQWqcnW+SE//8E/qOXRpKSbiSP9te?=
 =?us-ascii?Q?gugI57ZM+hL2tvDIZXNxGMHXKD5ATn3nzH0z1J8NAJIbNxq9uf3Vjmr9iNC+?=
 =?us-ascii?Q?nWtaZckLxoH01n4BIaCMQin/HyWe4lTApBtMr190fexkEkP4xsBzgtGFv0jX?=
 =?us-ascii?Q?Mm2yvgjJi1D3MqyoVIm5bcKDGGxaaqtu5EvGZw8FTOcS6BrZVNrBz55uKOL2?=
 =?us-ascii?Q?F0asAdRWIOewLWm+78hEZOA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 960b7077-1a4d-42f3-4d1e-08dda7d68c01
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2025 04:23:27.1463
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qZqGF6TzjyM8cAS3maIp9FjzgCBou0exYzZk+/LoTPLTqWGzBHwwvV0T84DaiY27BuheTJGp9qZiD3mDx0w+E6fvQXRxpm6vjU/7XD1gIUXLUxkocQEsrOzreh9I/p/d
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB12373

Current Kconfig menu at [ALSA for SoC audio support] has no rules.
So, some venders are using menu style, some venders are listed each drivers
on top page, etc. It is difficult to find target vender and/or drivers
because it is very random.

Let's standardize ASoC menu

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/starfive/Kconfig | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/sound/soc/starfive/Kconfig b/sound/soc/starfive/Kconfig
index 279ac5c1d309b..50f515dea620c 100644
--- a/sound/soc/starfive/Kconfig
+++ b/sound/soc/starfive/Kconfig
@@ -1,15 +1,10 @@
 # SPDX-License-Identifier: GPL-2.0-only
-config SND_SOC_STARFIVE
-	tristate "Audio support for StarFive SoC"
+menu "ASoC support for StarFive"
 	depends on COMPILE_TEST || ARCH_STARFIVE
-	help
-	  Say Y or M if you want to add support for codecs attached to
-	  the Starfive SoCs' Audio interfaces. You will also need to
-	  select the audio interfaces to support below.
+	depends on HAVE_CLK
 
 config SND_SOC_JH7110_PWMDAC
 	tristate "JH7110 PWM-DAC device driver"
-	depends on HAVE_CLK && SND_SOC_STARFIVE
 	select SND_SOC_GENERIC_DMAENGINE_PCM
 	select SND_SOC_SPDIF
 	help
@@ -18,7 +13,8 @@ config SND_SOC_JH7110_PWMDAC
 
 config SND_SOC_JH7110_TDM
 	tristate "JH7110 TDM device driver"
-	depends on HAVE_CLK && SND_SOC_STARFIVE
 	select SND_SOC_GENERIC_DMAENGINE_PCM
 	help
 	  Say Y or M if you want to add support for StarFive TDM driver.
+
+endmenu
-- 
2.43.0

