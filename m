Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011001.outbound.protection.outlook.com [40.107.74.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4892872637
	for <linux-sound@vger.kernel.org>; Thu, 12 Jun 2025 01:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749692606; cv=fail; b=EAU8h5Xn8TnxC/fF8Ak/aKPx+os3WvU1oHWrucd5TgqWxAEl81/K6PbuVEInHuYP557IqKD2hbVKKZHGcVBx4/+o6TxffU9uoufBZ7QTUiP37ZHsdpEgJX+UTNuMHIynnpb5oj/+tn9pNEKoLLqCT5SvXvGG2yaHxr0cEDLSZRw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749692606; c=relaxed/simple;
	bh=9yILyiM6gTDyQNFWfYd06E7p2PkdfCQfUwHJno1Fav8=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=l71bLCVjw6dAsR0SsSGwkmUfrg5LAQLcLdSqMf3fhA0whdbDBlVHTGE1hBcWlzS08L4Bmd/cSLX1WHzzUbhRgqRBbZx9nK0YScjtb07MG9qbq8TGnzoo4VBU63n5vDxQIkLt2yeqzZ5bLn3LLQ4Y/0jDYQKsTk8bBV05Lta/AmA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=AouQ+V6L; arc=fail smtp.client-ip=40.107.74.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="AouQ+V6L"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MPOBavOCylkvfdNy+vNuxl8CIW6RLA4N0Q4Ka2Q/LA9gRwWTPXXQA4GadWva9GnoWPMVH2CDDsKztV69Q7URjh1L3YC3b6GUPL3pNjOORaiMoG8BaMFGJNgm7x+h/VfpBKy8Luoin7Gk/sBe51f4xY3EUnnG8qEyliLo7hX9IhFMJZQhvcLb6ZSqLzZMAqo1mtuft7OpHtNazZbBM0Fo76VT5h5cQvmZMj3szYszxKuoZDONStnFDhhCLS3Wc6vVOK3lFsqORE8x9lWyaj3/VunqiLrr9NDiFTNBJXv3PzpPab+aHZbAjyw20fxbqTqcaqR57xNawZZDdsypKOmayg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gz0c8xKZ6WWMRdILsNNaqL2sgvjqPugEuhiRZ74B7wU=;
 b=hmb1ku7C8zD3QeXBC+RcJ0v5oe75Ui4MkqTJMRqsgxThjvXmjyRZ7olri8E+ymCdqBzjkfs1CQSPAFTzW8yQLTpEsKs5i0am8TeqiRtUBJRJ9ug/gnAfIZU62vDL2eZ40QdSzu6vvI3qAkCywhuPCCU0WHBqM7LLxjAt6UWHI0ehsyT2oMK/5rZELOBLQxAlq8GaPNNu+XwIQT6iU4dgq8p2a0M/u6J2H6KvBuYKiftijmNsjzQcXWNMCW/cce1rpEKtTjMok1Bc7Aw5wEY02jd0IooV7mI+nHKBXHKDVay+Vhxzv2VOM7L21McZvNnAS8ys+iH6LjK26xVxkDrCIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gz0c8xKZ6WWMRdILsNNaqL2sgvjqPugEuhiRZ74B7wU=;
 b=AouQ+V6Ldf5615EHZc1UuoHgjVzZoNL8bbg3tPST+Zvd3cAr+R1V7YPgc0vnMq0gyFdOo0rK5KZGgK5fuYtcUABRJo24mnE+wvzDhOuWxYhma4kgVOFnPjPnShijjtfXsAmPgiYfwRna4zFDTSAMTAK4Cr1VTiYtpzix/uSU2GY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYRPR01MB15122.jpnprd01.prod.outlook.com
 (2603:1096:405:227::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Thu, 12 Jun
 2025 01:43:22 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8835.019; Thu, 12 Jun 2025
 01:43:22 +0000
Message-ID: <87ecvpzqdi.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 19/39] ASoC: atmel: Standardize ASoC menu
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
Date: Thu, 12 Jun 2025 01:43:21 +0000
X-ClientProxiedBy: TYCP286CA0168.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c6::18) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYRPR01MB15122:EE_
X-MS-Office365-Filtering-Correlation-Id: bda9f924-9761-43fb-d38f-08dda95283c8
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|7416014|38350700014|921020|41080700001;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?jaqulqRsDSvc1Gj+N8R+HQICivzqUlDUqqxGDJkt6cg9ogWgrSqgWtcHpS3q?=
 =?us-ascii?Q?E0f9MxIHhQipgILZWJ+r6qnQR9aJMrp3jdQuYnKAqZ5mPSYDYJLK9UVmuiE0?=
 =?us-ascii?Q?9Jd+8eD6u8+Y2Wm/8MwPKfrKbRmTekaI9T4JBakBaj/P2dhKggCc0TfcEnNI?=
 =?us-ascii?Q?vq+D6V1iK1m6jGcfK4Z8KZWlu+Jz2Z4CmiI/GQi1fbncn6NwWQf6J4TEoxAL?=
 =?us-ascii?Q?P2wGejWryE7eIUV53z6vhr12Gszxv1hFn1s8K43wVtDI6mAsase0FXLvD3AF?=
 =?us-ascii?Q?tt+OsyMIlnw7CDCXtacBVms6jt0QyLrjFITCvH7Er0xNAT1TwaDnf5CbqRN8?=
 =?us-ascii?Q?6yLQwcTyMwYleB1OhcgfFznql+XLpHbwyEmK76GV8zXdNZx8QE8KLaoyE6HT?=
 =?us-ascii?Q?3UXxFcMdGJaL1RGF+pLKW8mWs+vroGKXkFW/XVbgWu32tegz7laCAZQcbb1s?=
 =?us-ascii?Q?l0g0cdkg2GT3rDCuM8OHcZMZbJVG9y2YykweK7O+MVye6xwPa9LFIlgwh68C?=
 =?us-ascii?Q?2Yt59F7MzxeAB0afCfM73cUKybYYHH9oryLUWrv87hAaXiHM6I2yS3+zKHLL?=
 =?us-ascii?Q?S4rTN4HaczhE1PheIysUHw2n+ZbhMla372pPi9mADoVU/CC5RJXvRvqCNj1e?=
 =?us-ascii?Q?js1ztpH9Tb7zKhvw8uD4LSIaGV5vRLmDnL5ILyltRLML2miJY1dw8co2qaKi?=
 =?us-ascii?Q?3Oke+OfkjEGQErJKHYu1jlgtyBBIWMg+Y8V8K+hd78Zfvduh3pZLPitB9JHG?=
 =?us-ascii?Q?SYyzroww8py6XUA0vnmLYTmHzGRMRoOKAySy2WhWVaSWPP24RGQhgfk3Zvhe?=
 =?us-ascii?Q?nBtAxswNrkSCEWoguxdn6nIaYaGYpJ3KjRBzhLlv9Ax5zSzNpAnFcDn0Y+3G?=
 =?us-ascii?Q?AJq3RVRcdcbsS3xGZoE8x2LaKjgzcPHMJfIG/3UWgBfUyeXDn/SLt7ZJkW5U?=
 =?us-ascii?Q?B2DcFR87iqLirN3gGe3hrLAWKCjS7I5/rc1QUBVUDbcv+xsCBnI/qLqRyw2z?=
 =?us-ascii?Q?X8o1G3bcAL/ptnSozZqD65j5npclVwmiMnJ6mAQ0iqUo4Os6A7uM9CN/6OBO?=
 =?us-ascii?Q?zdHeQmvi4JIoK6n+W9288YtN/k7nvyyEfQl9gSaT0Tjt9V2GLV/3m6gVu6r4?=
 =?us-ascii?Q?shCbTJ5sQmhcKyw61NOksMO1fzRoMO6MjVYQjKdshxBS9l6RUCVcDvkaWIcK?=
 =?us-ascii?Q?GIFHEEKN43+AkhD7l0/GQNzVq0CpbtBLaQTchBqp8IszoErsMfavyP1GjjZ+?=
 =?us-ascii?Q?W45mwP8+Xm9I1w1ZarVxsnStsVRbsuUGF8nPQaS8X/YWai/Ea8Lqe0ULu0Pm?=
 =?us-ascii?Q?2eIL81BYySQdwaV4KrmXy4WIfIe6cT1SnSvJ9+kne+iHsVYECdQVcUv/K2eD?=
 =?us-ascii?Q?Rpo0eT9JJA5X1CunCr5TtWMRRjPN+uXmdEhIsWuRwRgmJ1nn5bfm5W95uH5m?=
 =?us-ascii?Q?yiqQdqm9AKquF9oXdxz8x6ZPqKiuv/b7zxx9YTbq7s1a6Md+zZfq1LG5vIWF?=
 =?us-ascii?Q?VL7g/fNRAVKY0hcXPflOTTs/qiPktFHcRzsTJ/I86cHUpMvexejUfDYN3Q?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(7416014)(38350700014)(921020)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7uCOy+dnszSi1pyhB+FL+YQpjG4CGXV8XCh38s1F2EOuFh9SOgMatqPAAaIN?=
 =?us-ascii?Q?jonpCvUMe864xZNrdasDjwx5jKDIe9uVx5cU8ApdRDLkLFsV5dr5Yr4y65YH?=
 =?us-ascii?Q?RuqzNT82CTHNSIHWn32rQqST2LukMt/nn+4aJc0VcHbL3vei2QtKRY1aCLMi?=
 =?us-ascii?Q?XokcevoPJwLjtVzc1+DfM6L7xupZoHMqs+xs8ojWBt2yUWyCyjqPaat7527k?=
 =?us-ascii?Q?lsa97C7fVppKsZmTI2uerwBDI5MRcns1A9tsGdRs9CHaOj/mfY3riRNFjn47?=
 =?us-ascii?Q?lmaBeh0IUomlb9JOEkTFKI5OTIHJke8BbinYehNkjeGeeyrCOnU6eDm0IQMN?=
 =?us-ascii?Q?oWMhFhqQv8hFOz/TPNtjHRY/I/Ye0KAUWmF7Wqw3Mm4H3zjtjD11USBbmqbR?=
 =?us-ascii?Q?hJvc3frW3zLYxlWUfu57uCKW46fukk6U3zZGyDJtrmXv90uThf2PKSj9pwz0?=
 =?us-ascii?Q?AL8C5ZrM7i6pFKwlLb7MkOQsFP1Qiq1arDfsBCf4//1hgf6Ge/qqI0bZSfpd?=
 =?us-ascii?Q?Qdj5w+jKi2Wtg1Dnjj9mGHS4xPgv/UXOh5O9b9ahK6eJp/9Qo95vmr4aG/jm?=
 =?us-ascii?Q?oVpPSeMr4KLxAPII1AE5QuhQjW5J3lZFRS1XpkVtIBd58foorhsjB4S3kyt6?=
 =?us-ascii?Q?hQOSPbxEjc6yP2kaEJiHgIce3RMm6Or7UuIt+R00aZxP03jPNuX9LdQLE/+5?=
 =?us-ascii?Q?5FdsQr5ie4NyPiIK122A37zeZ0p9cGr809LoocdnZgI90FjH0alkhMq/ZKsH?=
 =?us-ascii?Q?J1wcjl4NK+B+yaCEEsJavSotFv2iei1iEJ1VWrZ0A+MTjA/VfmEkEceUix5l?=
 =?us-ascii?Q?1nMvPU5rV+IsFIpaVdWsQL4U51+ITz68uP9L/mCBlykL0JIE5wppxMzJ+e5P?=
 =?us-ascii?Q?sKpIhAwDy+QOpu8j4BKjFAa0VqaIVO3JbFvw3easXuMjz0SGKm7cABMk/9aA?=
 =?us-ascii?Q?txMMUNsaneckrA8blmp6j7/Yog6A+oMrD8dPwXnsHD4QhOFtizUZhg7dQDHG?=
 =?us-ascii?Q?szQczbd7IWJjunpMTi7kJFHWaKE2Kz92u9tJHdSjyKk+xQpsIRRg5441BtEC?=
 =?us-ascii?Q?PmutuRPYJ0QqqSv8Uo1RtddXF2Z9G6KptoG1Cg/dhtknTeou4x3fDNMoDwq6?=
 =?us-ascii?Q?LCWD+oUVc/8FB5BMw4jHTS6cZn0BsreTT8nM70XHpiiRW9KwlnXgMWE9I4pY?=
 =?us-ascii?Q?nNG7f1GXVVRKvzO2s18x7JL7oZNMKr/ILXzlOvRutSCoG00ri6gtW4JgWqPJ?=
 =?us-ascii?Q?7+BzYutKS0zrOVa4zLyad3p05ojxBE8/7Uwm7I2lN2he4ZuZFpCyXtEP9Nh5?=
 =?us-ascii?Q?QCeknTloVGoC2O+TmdVlvMVC+1Cd1jMQESdFgN8xvBFJ5+JO3yVWwJe4/Imn?=
 =?us-ascii?Q?nGe1qnFRjHUSd6E9VeVuazRfEbRukkCSDoxrZcYnaVzv5Ali7BBFnXiPqyfK?=
 =?us-ascii?Q?/rCAGZUxkTeinst2SNMDjnzO6w0shvSpQPKk+p3Xg5edFlpQj4jEDOENPqg8?=
 =?us-ascii?Q?9ZJ8SM3OL4vvST2Yb786uMnNZ0d8JWrtdwgg5eJsqU25GtXNbP+Cz6Rj9SNg?=
 =?us-ascii?Q?6n3n+HkFUpWiiDvJI4fPmDsVrMpQKnNODSpMJl6kbukLay2ydOYdbYLRS+rS?=
 =?us-ascii?Q?VvwLwSK+3QJO0IPbf6SbBcI=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bda9f924-9761-43fb-d38f-08dda95283c8
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 01:43:22.1462
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OpyrsiO6fFd0knTkMzOoDBkm17dcQydPIgDfzLGsWxe2tQGHJVpvyCeoOa20ElrYASi+IbNVT/U3LNj62GtFxqhh11C5sx8YzEeixDKk5aC7DpmCYhf5Ko3B0gVIoQ7i
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB15122

Current Kconfig menu at [ALSA for SoC audio support] has no rules.
So, some venders are using menu style, some venders are listed each drivers
on top page, etc. It is difficult to find target vender and/or drivers
because it is very random.

Let's standardize ASoC menu

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/atmel/Kconfig | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/sound/soc/atmel/Kconfig b/sound/soc/atmel/Kconfig
index 5d59e00be8238..4f51612f3dd2b 100644
--- a/sound/soc/atmel/Kconfig
+++ b/sound/soc/atmel/Kconfig
@@ -1,13 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
-config SND_ATMEL_SOC
-	tristate "SoC Audio for the Atmel System-on-Chip"
+menu "Atmel"
 	depends on HAS_IOMEM
-	help
-	  Say Y or M if you want to add support for codecs attached to
-	  the ATMEL SSC interface. You will also need
-	  to select the audio interfaces to support below.
-
-if SND_ATMEL_SOC
 
 config SND_ATMEL_SOC_PDC
 	bool
@@ -176,4 +169,4 @@ config SND_MCHP_SOC_PDMC
 	  2 data lines. The signal path includes an audio grade programmable
 	  decimation filter and outputs 24-bit audio words.
 
-endif
+endmenu
-- 
2.43.0

