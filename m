Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011013.outbound.protection.outlook.com [40.107.74.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C00725D91B
	for <linux-sound@vger.kernel.org>; Tue, 10 Jun 2025 04:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749529266; cv=fail; b=rIQCBgyaKHzTOSd8bGTA/iCCkKw5QUvpOWlit1VNXMhneNZQ8+UBNFyfTqem86g8PFgFUoL3ilKhBbKgs9ST8wYrzDbNTAEU7q3bx91EprBYlxRjPz9BYyObawbQdZLKredYfWoaor1RTL0rQUL8cB8D30zMv6IHTXEa+/BJiKQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749529266; c=relaxed/simple;
	bh=6GWCm7AjefKSToUNmsYX27qskZJ6CY/8SKLA6o4n+rg=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=UKTAGX7XHv4O7/tVGKsCINRfUZ2Ibz6REX0F/vPArvYYe01pR2Me8fUBGcGi5Yi6SshzKZqE9ivJfYXsBRmGNZUMji+AlWZDY8m075bwR+DFsydpjzWvpPoiDjEba+GDijC8DInyHKP6CH/9OTf2CwmiicXTHWz4rrxF4Npe3Gw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=JbszWVlK; arc=fail smtp.client-ip=40.107.74.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="JbszWVlK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ldmLiDDSAgs3Ej1q9GmeKvrhEbJposhQceTZGHKUfzYMLtgYaPtz9cBuzqZNzdsd6tzfxfEz8oCMpkRyPPS42dKDk9gSvpJ4QSd1P1pcHkI+rTuuz4bCDjUXowheLlnspQRDOPjJrEEcY/215bJTk5GGpkKOUS+hnJ7eypdcUC5kKUsc0CIaW5B1bqi22uxW57hZbXCHERj/rcTmsBTtnD4r+Gptq5bRpdjLI/YwPPtI7BohhdNfIkHKtSYJA4JfeAudWOPcFV50I3elH3lCqBl7t/Lh5f8lRqbaN2hwmj0VwnPis6/AWJoG5ffyZtgnsx4nbYtJRg6IDKAJ/qEmeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rFQAJE9Z0gst/0ThwtHp5J0aJ634yO4ccpZ2J52K6tU=;
 b=o+BRYkW3F2o43vCDup5gTzAEQSIO5UVR/jKK5jTj1oiFXnB4dZ6LtJBjyA3GxrclIjoMvWMDafhuYETo6d2mA72Z8zaPCZAoQwxMmi+cXaBtaJ/DflcXcLeZYFO51aVblK5HIjf56cQ38/CP80YPl8btqihKdQh5GISeO3IpUyfC1FOoi2iX8D1/xbOO1KjWDZ8V+/QKSPeHD5Auy7Pg+OojN+BlQwd4Oz6nGP1aXDk89PPMrGRZGcrXlXC6W5Rg5+WdQGBeygNWi8+a5ZWPMLIOIRN10rFgOzZhQqxtoc0CBzLRgwBoBT2wkg8AXxL9V1s7SJ41dyWtywit70ulkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rFQAJE9Z0gst/0ThwtHp5J0aJ634yO4ccpZ2J52K6tU=;
 b=JbszWVlKMeewS1cL2qWLqhtr6+0zhYdJWnae8gqP0m/QCHEGv70TnhSRoQVEcXTTzvA7JwBfVrnD1p0TxxLalcuqIevPIZcOtsQy1W/TKFRoshF9Id0rM5Pe688FxNgpdYFNNndYQg/aY2jAg8FqUs2L+CDkxba2FnK9H4ISDk4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS9PR01MB15231.jpnprd01.prod.outlook.com
 (2603:1096:604:3b7::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.22; Tue, 10 Jun
 2025 04:20:56 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%6]) with mapi id 15.20.8813.024; Tue, 10 Jun 2025
 04:20:56 +0000
Message-ID: <87tt4o6xco.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH 12/37] ASoC: stm: Standardize ASoC menu
In-Reply-To: <8734c8bf3l.wl-kuninori.morimoto.gx@renesas.com>
References: <8734c8bf3l.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 10 Jun 2025 04:20:55 +0000
X-ClientProxiedBy: TYCP286CA0252.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:456::10) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS9PR01MB15231:EE_
X-MS-Office365-Filtering-Correlation-Id: 7fed7307-dfc8-4ea2-2324-08dda7d631dd
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|1800799024|366016|921020|38350700014|41080700001;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?RDeLoGNVGiiG9ogyu+HRAlBTAgtEdPX85r5JN9Sz92gNbPHA76HUAlOlgXV+?=
 =?us-ascii?Q?9UwKw5QQC5n48iL2x4rV2IF6ltLRjQZjX9wfWiAsE1xi7QmAmnl8GyLcZWR0?=
 =?us-ascii?Q?xKa7UTMJtHl7/XHEUYScEoOPOZK5P1iBUE27ihaOnsqHQjPd0o0AQT7l5iYX?=
 =?us-ascii?Q?yu/beUUJ8gZ46V8Pq1CvfaUhKGblJHhPh/EIn+kxV+imd3c/508xZvj/wzPC?=
 =?us-ascii?Q?ilr/uf2Op53LvMAhpAu0Ubn5Oa6Id88GTKtVvH7jzvrhWTZoSNJyq+FSoR/5?=
 =?us-ascii?Q?Tvz/8wc9EvWtq5WTmEgYaYTL4upawBJ+7ic+PJggCkrNza1OLU0YAoSnhQFy?=
 =?us-ascii?Q?KJHQYS+I896aCnY8LqDXcOZgQH676AsvP9eQKGR5CqvvLL3GKhe4UdqHy6Ah?=
 =?us-ascii?Q?5iXwvKhMWN8dHYF85SR8jrvCSGmLBgeNKs/myDREof/dsroDFBi8tF6UPJ7Q?=
 =?us-ascii?Q?NdNgMHfWBX6UIVihUySGjRdBt3NQfhyH+amU+7ug1Jj8pBIom36MpzawF7W2?=
 =?us-ascii?Q?tJgWplR467KFmb+N5dybFAhIkFkP+49ME77Rq8Q2f6VTfPvOAOPaPvZPergG?=
 =?us-ascii?Q?RV9MYZc/ReRIQ+L8dS8McgI1a4OsCrjgUfQSm2kAiT4P4tEIe17l6Aa9I/NS?=
 =?us-ascii?Q?Dvt4v/uCxwXqVVq6QwbNKMmOE+ULx9vRieIrtML0E/k6WHGD3ClzYyxW65CX?=
 =?us-ascii?Q?2nV+5sen0XhQViULWgMp7uBtcdq7aAg4lXI78/9NDheA2mw/coOYKjocNBH2?=
 =?us-ascii?Q?6wyd+Tl55PlDpLfhTZRnt/oI5XyaCuKGtzG4F3tSyKa6kZelyFclbQ+/XSKf?=
 =?us-ascii?Q?O/etZH+nc/gncuTF9pVQ9DAeiFY0I0OcfruOCdbxKw+ruZNjdewLm0OGcY6l?=
 =?us-ascii?Q?5Ssmc9uXBAd6jSzFm7aysVuOXyQQTsDD0Jp0eO3QL3ttHjnVcU+P7XHtwXzV?=
 =?us-ascii?Q?7Atg7/TUf6oqNJ1DKVYR3TZCYlYCfLOm8wfwz0vxaeOkLEF39dB1yoyU4Avm?=
 =?us-ascii?Q?04ko8iYacvJ/MEeuge/MeomQOg0eHrXYqsDMinAezy4hf9VBdi023Fbbe/Bv?=
 =?us-ascii?Q?bz/ZyskGUYK+Cy1T/1TZ7M5A/xcp8fKJF8QA/taH6QNf11YZIPUGY8ljvsy7?=
 =?us-ascii?Q?efZ/IfEg1a2xGVlOI3bZTOELLLXxvQRTKMS+5bYIRcsQVJ8Ejd6wDCa7m4OO?=
 =?us-ascii?Q?6PTkpdrUZWYAONLVOr0fCBiBpuIoWbvye5vyRZe1UjikcI9KaPID4/zBDt8R?=
 =?us-ascii?Q?ckcgiWSSmKfW/j5WM/nmq1iJCkcvNQ0VTbQpwG1MZJ0kCMK2yRkDoaTNnu4k?=
 =?us-ascii?Q?SUZ/ETN6QyVLd1wPPlebgReN49BmP9pBMpjo5oljriuFRQQVYCnierH3BI3k?=
 =?us-ascii?Q?VJu26VtiMuFDPviXFbs7ewR1FKaLnqinu4IHWD3Fqn4XE9xG5MnOonZAbce+?=
 =?us-ascii?Q?SYttvusUZQWhW3M3bEUnsi8d3plOydlxVYfQimQ63T9Mudg/QIQeh8MC9Eqy?=
 =?us-ascii?Q?igRvdW74LszkXqcXKFUi5NjoGH41tRo5tb4N8OQdwskHXrHRXYVk9JG0Nw?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(1800799024)(366016)(921020)(38350700014)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1wQqPmJCmMUzPs8KP4XiVv2AIB1RWvjK316gGwFLjh23ijFm6W1YShY1rxXx?=
 =?us-ascii?Q?DifWrNpoa7Ca0CL2gugYSc1TbGs549ivbVbtrs8LsQRkYMkiPVr+JDXFMbii?=
 =?us-ascii?Q?GlZQT2DESNAOed2ekko+GkOfr/DadTX3EL8Qf+XPBHH3+vh2dpnfy1coSDNS?=
 =?us-ascii?Q?bNK6SsCLc2mNhuug/NnRkg3V1JyiV1hpGu+RR3aviWM/rCqH+iryAPjXfgSU?=
 =?us-ascii?Q?DYZyAjSZ8i1jsaUdD4bFapeEx2odVj69MgxFL2P0UiBCwduqc+LH80lUqDHj?=
 =?us-ascii?Q?jkhyZgOIQhgkLpAv6xulTxMPwwbeD5hmbQKHAo546HTGq+J457fQbZk9DMll?=
 =?us-ascii?Q?gQV0slCowoHmGkZ82GG4Ax/OLlvK0eZE8sabYd7JQqJ/FXv1M7SV407Rvpq/?=
 =?us-ascii?Q?cGf0A7vZOSVHYOnn7L6p9l+rjZDp8f4JmXqSHTk95x7nOfVnx90qGMkm0Opx?=
 =?us-ascii?Q?MiV78oxp973wADxnSeYSwTC5qm8XBWoUqwmVZfMvreh/nKmJtsXFiitmY7Rz?=
 =?us-ascii?Q?ykTfmV7a2VpT03aYYYDz1k3jSPAdhhbjk564ziaWknqiTdgainZJ3AP6xTXD?=
 =?us-ascii?Q?/zLFf/oX8UWKgiTHxqoLS6NyGDEByvfT1LLDtZXBZr98w2pOI9EnMtTCzOdF?=
 =?us-ascii?Q?Mvtc7br7MIdLIummpUZdWgKYRWgAoNAdfzTXHuZbe/lrZ3esWMfaEMbkUyej?=
 =?us-ascii?Q?2Zpd7bf/cFdAWWvvOaxDvnHLwpRhCfZM6L1beGY5499cc142Ji/kV5tMbehf?=
 =?us-ascii?Q?DeUHU4fCz3q20f57oNxIPe1vqiHvAPKjChwzHaoa/nml19AFkRSy5FCePw3O?=
 =?us-ascii?Q?akUi7OvqvThZLiQbKoLhmr4h6NC6GmFbN+x3+a4ZNuhe5kPEoOJ1H0w0H11f?=
 =?us-ascii?Q?JtkS8pY9pZu7Y9c0IN/e1Qov6W1AXZsaIKWamTchNIQXgr85oG6WKlic9NSD?=
 =?us-ascii?Q?vombWbV/sQDiCdgylVPAJtwSyBzavbb5nitJ8pXS/56x2B/XywU5vTGr1gPQ?=
 =?us-ascii?Q?GgIZxmiDkAuSFF0Tuf7BNqcrKzW2/EkzHgID/8MG0y/7GAiZmycveMsyf1O7?=
 =?us-ascii?Q?L3O9Z7i8lhpyMBUcv6vHWmWMSfPRqOSFW5vuIyfBWFePw+WnbxegBOWIKX6H?=
 =?us-ascii?Q?u3R8x6eoM0WbSZ4QXn4fTsk5+vZrB5eI3gLkfDlKdatwntKN8esSFtDU6tav?=
 =?us-ascii?Q?MooKBuZzgcIRuOb4M4B2faJl4cnVx/ZUeXj3Nk10mieknFvX3kVRJB/62d5x?=
 =?us-ascii?Q?LpOO8f6k+nbIYnx8LZd5G+Y27jA4htNmsvZNLirjWRa3AKeh3aXkjmImcdVH?=
 =?us-ascii?Q?o/wNIRxmAPl2iyY/SCIsFp4tpUdxCm6cpCmVpBLUIsaY8IDZlQzDSs4qGDNq?=
 =?us-ascii?Q?LTqLeSNPSmmH7Oy4AmNlavG5C/z+h1HbpBPFlS7xDSNo3BnvFqiVo55xN9YQ?=
 =?us-ascii?Q?q9HmhPSlf7+qsUB8gR5XAwIVeA7X/+YyOI3o16KVvCHJ1FoB7wZuK3oywgH0?=
 =?us-ascii?Q?Mg11lEAVdirWjIm/C4eMuCdLwCJVIkHHDa8bjvsKbN+4+Y0SmD53aeVb2otr?=
 =?us-ascii?Q?bF5eXeSMgb0CP6NhEj9a9IEaA2g7IkUTHNbEWga4Y1Wdmizx3EwRVrL3NxCi?=
 =?us-ascii?Q?2kRc/YKYpZoV+pedVlo5wnQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fed7307-dfc8-4ea2-2324-08dda7d631dd
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2025 04:20:55.9387
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UFWF9MX1iBrUDDhvQZjVWFGF8o0/nGBfJqQKBb4/yLPBb3/FwbThCG7BEU71sAJMoqTkLxbcS9v/mJ61YhJivX+TdCgOhryT2kJFp1xqHqDgAlNlVXgFUSQTN/85XE/o
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB15231

Current Kconfig menu at [ALSA for SoC audio support] has no rules.
So, some venders are using menu style, some venders are listed each drivers
on top page, etc. It is difficult to find target vender and/or drivers
because it is very random.

Let's standardize ASoC menu

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/stm/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/stm/Kconfig b/sound/soc/stm/Kconfig
index da1f7a16605b4..08f32d2e606ce 100644
--- a/sound/soc/stm/Kconfig
+++ b/sound/soc/stm/Kconfig
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
-menu "STMicroelectronics STM32 SOC audio support"
+menu "ASoC support for STMicroelectronics STM32"
 
 config SND_SOC_STM32_SAI
 	tristate "STM32 SAI interface (Serial Audio Interface) support"
-- 
2.43.0

