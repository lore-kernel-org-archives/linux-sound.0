Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010015.outbound.protection.outlook.com [52.101.228.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 100E825DB18
	for <linux-sound@vger.kernel.org>; Tue, 10 Jun 2025 04:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749529384; cv=fail; b=ba7Jvw+CDND4dCQ5CbyPXpdNcCaTqoUjyoReg0gXaONGNIVbpt1I5r2RA3rdAkoKn/CWMJyiFplqbpprS1fcJYm7eDRzQZavmh40LKpeVGMvIC+Mm5fQwaEo2gZ31ZWltkkyteLrite55gymVK+ioXJ9bFW1qiGhXWDxkrNJPow=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749529384; c=relaxed/simple;
	bh=Kjz+QkrNIynW6jf9c9owOjhvWXkTnr9fXWQro1CwbmU=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=k/7EKbdWlwgD/WDEOwcnYmwSDmGYSWXPiCHaatZndY8JR9d4hjPwHNssJUSde9KoniEXbtgJ8wRUHNggcyu7Nj4dShnFaI2RF9Z0+caqZ8gQbKaU+zNF2DdG4lrVOL5Kqx5KoUDopqcBNP538aEJrGkZ9r/OFqzPcmSLlXwsTc8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=T2N0iKf4; arc=fail smtp.client-ip=52.101.228.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="T2N0iKf4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fGbknnEoZBoBF8NOhtfv23/KRdmwzcf4x5axVYT7ui8nABVLPmWa829NBmZ//RAVupAlbfrT19AUd4lEjsnFT6bWRTA1xL4I1fPoG6QmMnsAAi41q7wYJ0gDLr4JbNyIGjQ/FLV9d7OmRvJ0ufiFK8fR5jzqVJsNeW7Fimt2wDOB5KFGdSbYsXVqd02BhWM+D5LQVIPGQbm1jRKUGTm4enbKvHKvCxku7+ELBpZ6r44wJg7/IISeVWczcxOGedETrPfF6v+I/1nqC8tsS8uEgaWpTTvDEasQojV17Bbu57qXv6Db1ZuB+3C1WWz5uu4KIGaOXGeHogi7s3W72TznWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uoM4RuGuyXarE9HwGDV89sSEnCCXMF5UoXtYns+xcks=;
 b=odxYVGhO2T1qJHalgiN566gJduLiNtOPxRdBge+TCoNAaHAmm2/F05T6l29VALG5fKjj4l9WpdbmtYu9kKwbZlT7oCdNWQFKrd4EpYYUVa9b+BNWSE1kbwAbqwsObvc328u6WImZkw+1fI7PDMPyFO6PnsyqHpY7r2/Q0xngdE7w/ojgv77C3fmTwYKCMIjIz8WsFqsx1BBVqPuVMhwAM3rMBUCvk2246s7YFOIRtxdvfFZyVRYvMJxZMuZBQgsbqBpMzQSxXB62/dGmqZESea18OAyIT9YXK0dZQ5y1yRewW7Dklv2U5xWVlX5vAi0pH0Vrlux36hF6HnX0jDSfiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uoM4RuGuyXarE9HwGDV89sSEnCCXMF5UoXtYns+xcks=;
 b=T2N0iKf4fkCQkCvdLOJgxMupcpv/iB/gbCJWxXK7vkWwNyv/2JFtLNVbw0Up91SnXwnOPU3LDl4kj3c+NpswL+FW7RLcaOynsItGwnWzrPcIXeCWxpRZgiDmJoT6UlvjJahGjwwkmRug7F/5ZByqCyZdBJhE0k9MgKf4NLGdstc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS9PR01MB12373.jpnprd01.prod.outlook.com
 (2603:1096:604:2e8::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.31; Tue, 10 Jun
 2025 04:23:00 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%6]) with mapi id 15.20.8813.024; Tue, 10 Jun 2025
 04:23:00 +0000
Message-ID: <875xh46x99.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH 29/37] ASoC: generic: Standardize ASoC menu
In-Reply-To: <8734c8bf3l.wl-kuninori.morimoto.gx@renesas.com>
References: <8734c8bf3l.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 10 Jun 2025 04:22:59 +0000
X-ClientProxiedBy: TYAPR01CA0220.jpnprd01.prod.outlook.com
 (2603:1096:404:11e::16) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS9PR01MB12373:EE_
X-MS-Office365-Filtering-Correlation-Id: 2620cb2c-fa57-48b0-9881-08dda7d67bd5
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|52116014|1800799024|38350700014|921020|41080700001;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?37XacnADjCiZTkdPMTiS2MIHB8XFKefCg3P9rAQCQOKhGp4Mlgdx/ECa/zu+?=
 =?us-ascii?Q?cPb/hoX1IYaPrZdXPeYzXLBwuN12jtP6FmjIqbuBq/dIn44hiOCv4AnFMBMJ?=
 =?us-ascii?Q?0bkJ70q9ZUn1fPPw4uNAx0BylyQgjSRo/XufTb4b2bzymNb6z18HdkrGj8Xi?=
 =?us-ascii?Q?I221KPeRVADLe98OZCYzlmwpMWG6m+aZbuBfGoH+7jNB0ePuNm9OBtMpDNbX?=
 =?us-ascii?Q?eX7aJcMjL5bkL723dbbrFI7RmUWDWsPDL84J+alOQhyvzr0veZFXTGc0rHZy?=
 =?us-ascii?Q?cThkjAipWhi3klXZhuGUDwX+2xWRi2Wzi/Zm5biz3SOS82cwfidCersneo6b?=
 =?us-ascii?Q?L6tq5ZT1OPBqsOFfKZKXZgyhNyILazer8/l/+FjqJ1HnPd6O15PyRko8op4Y?=
 =?us-ascii?Q?PT5GEAPtjZBKmBtNTte5Ovd0imFYO/WwSUmiF+lbXcOtLTI8cNFVZn05wyLR?=
 =?us-ascii?Q?l/BFEe3u8AjK4+UbUHF/Mar8rlGpduNoh6aa8P33iFfOKOWAME3DaEzfmSi+?=
 =?us-ascii?Q?P+nQ0WvwtKflDPPzifYw/A28Lz0ztHA1fj9SYXok4wLu8bwahFDL3zuFNnkT?=
 =?us-ascii?Q?rYB03wiaPR84AeKPJ7DlxUvMF2BBGgC7Zo0ohW2E2kGEVJmDJa6hP8Etrypa?=
 =?us-ascii?Q?JOV8chN3tAdhFsHTSOMkNlzpIMUbKyNkuSqJKFHlat1rLNAOHUEO32vwudNl?=
 =?us-ascii?Q?fQ25gG5jBxk9frr0Gs2hFQpxpFmZ0T+GETbEgfHBny8vFJ40P2+3nBFykYm/?=
 =?us-ascii?Q?NIelOj+3BI/5Nv45k9QbofhQTF7sajSNiVGIlWwCEqI9PZFsAQ3WQlrJB1No?=
 =?us-ascii?Q?NXaDVcH+3v4NgWJixxYV2kIaTh+cATS17PpYDMh8XJOdwj5Ty+GT2HG+h3ix?=
 =?us-ascii?Q?0mekFnivsBx5yDiYQkYpE2GZ/SJbypOKO/X3NqbSbEjHxhlMIofstKg4D19N?=
 =?us-ascii?Q?3OV7Tn6PimfLC22rLpvzuMdfl6TTYlUDQWCh7qD0Gxm5E59tT/Qi2XSFr6uT?=
 =?us-ascii?Q?9j/PKqUslXg5oS4JofqPhu6raxgiYmnFp/zINbLEio0lQ+TuUi2jLIVSw9fd?=
 =?us-ascii?Q?xVn3595IsDeM3FKNlXNxAgAQDYhsup/0uvB2ZD+5KbxXnXST+2MI3exbmsqh?=
 =?us-ascii?Q?lFrn0AyjFkJTr83HFc1KWGaw0HAHYoevl1Jv6ZrvO+32VKSVZOVMZGUHPhOg?=
 =?us-ascii?Q?dqZ/b++pPc85suMveGxS4sEXvuR0eoFu0rYocR/+4T/v0qYK1LKkWvWEZEEm?=
 =?us-ascii?Q?p+d0VVQOHzBRRGHT8B3Nk0Fbg8JTdDDXhYGd+Ip/+QrPit0UqAN75eTmI/Wl?=
 =?us-ascii?Q?q1QPMTpv6fJsNPRtKpRGGoHkKXBffWhFUVKRaiUHvfW1FXeRayPYspErqodL?=
 =?us-ascii?Q?QUkjyC2vjFhcK6ktpKS6lofYGgmJV69VSdZsZJ55pjOmepNVI7k4r05dyF0l?=
 =?us-ascii?Q?qQhVBHaQKe7aRaLl+g+Hq51ejeAK5+iXNiKSPfdBDBjOOKcbU+bnWHL68tNU?=
 =?us-ascii?Q?ivJAvZyuxWvRmCHP2bLOzAymQ6X++A6SXceA9G0qN6A4Hut5Kj1OCffW3Q?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(52116014)(1800799024)(38350700014)(921020)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gjsWn5Gbcu+SYlNS9yxFT2XuISn2oykCD1dRImXeEwKewNm/AHQy2iqyYIUA?=
 =?us-ascii?Q?v8HTcZeEnftcciSG5hIUE6aAzfXbGa9YeXF8s1XZdbAlIfxjrGXHO7s2rdKB?=
 =?us-ascii?Q?BB+bnpLTAJhS5yCgTm6EjAPklKebh5pZ6mQX+AavGuxi81R1tK22gS0aTbP9?=
 =?us-ascii?Q?kpW7qbajwAMIVd9Uwq7ASO7SOWoWuIA5rzI0KaAijXwPrn68KJtVX1cOSPIF?=
 =?us-ascii?Q?usuPdZLr5HEPcB7beu+qV1RUcwXt/v+778SpqgfJ+L4iQZ4dICWy+ZEFhIzR?=
 =?us-ascii?Q?kQJcG/1gyTLCID5zsDrYZRPQVzWvGpRD5+os6rVkrOTySLzsCcQEH7QL1RAw?=
 =?us-ascii?Q?Ha/ZvrOJiPh7lvM4A9PnZdJ8Jz1n1ZXs6uODnzEOSMLFnAc5uLKcIx6MyAOH?=
 =?us-ascii?Q?SxCdktTPrxDySklht5IsmfRH/UCm3xuPgrsYrFa4UXtmfl+mdcxRD/pvvCOi?=
 =?us-ascii?Q?JA1Bn35OgBQaqWMxi3ILEBdgwyklgWg7vtJDKN1Rf+fhR30jBybql8za1qBL?=
 =?us-ascii?Q?gqowJsxd+Ux/3FfjCPitcqY7erYzunIu/f+1Ov5PtCDAHsJiqALyBqyVgBpW?=
 =?us-ascii?Q?VOynftOkSRPaVkAFJkF6SuI8XjuGkJrdv+WBxeIdx5gD+888O/++ew84ef/n?=
 =?us-ascii?Q?7vgOnW7V2kk+vWudmlwMJQeLtwYnsT6NA0Z2U1uNHBWLhlxGIZo7l8l/0AIT?=
 =?us-ascii?Q?A+OAPPjeIASUuVkT8NKP7GLrvNQKKfQ6ONXKZ2voLaHq1dt74r8Z3ULknlWb?=
 =?us-ascii?Q?EN6gJNxha2G+CF4Pfw0mnF3XF0buUOLeaV1+BPJdT3GVBDg5oLsNwo4hx32y?=
 =?us-ascii?Q?YyPcmnY19X2zKzxhLp1umbWv5S1MUHTkeNkAeImxzot5v2KTHf+PoQy91cOc?=
 =?us-ascii?Q?aCBt2A+19Y28O1LQpMjDWeLJUgLbrpvXY9XQiwHmhn+Fkxyo3o4dcQpcgW0/?=
 =?us-ascii?Q?LMFXbp4sK3dMH+rXA7kWm7qpMv7wU+oWaEL1ZLCCs+sAFFV6J4GxVik1mLQK?=
 =?us-ascii?Q?gQfSp2nnE6ZwZq9vLyb6nr37hodrPXkm3TnwRU7UwsF34cZ6SV53Cce2nwUA?=
 =?us-ascii?Q?ENYKxEzvLFpqGgXmtX1OcvbjhJAWacmly7ikiIVXThWFzmzXRkUkKeM2WSup?=
 =?us-ascii?Q?AAUj6PDUYjPRPBbMO7tn+H0chWxGx/BjFIfFZxPYJl0klebx2uirm3fSEsu3?=
 =?us-ascii?Q?5+cD6E7uIaLNOxJBKasUrC8OVRwU6MsP0fGArPKbTefHOpdeOwKqTDFjh/vr?=
 =?us-ascii?Q?a4qp7cy+bj8b4gVfWYGZyvsj7yIjMLlBpFnOLjTLyGnAPCxUboy//DrYtOM8?=
 =?us-ascii?Q?Y5DqA6MSia4KX7F0nx8HPUNqo0YfoEH0nvEagAzHdY6TpRsMPL77erWlCx2S?=
 =?us-ascii?Q?lqyDqkKSyIHe86P3ABoep/Heva5DXVCXIVcXVdXN75vbO+7ES4vw7SBee0jU?=
 =?us-ascii?Q?2fQzhNP2K694eiEQXKxcQ5+wTh2jaNO+ajacELuzpmjYfO4/igRxk8xeteY5?=
 =?us-ascii?Q?7SpfIa4k1ovjOQphBAmLzedMa4FkoqscKz+A/MmWA7YUiuIf2ai3AEVgPdp/?=
 =?us-ascii?Q?UuSQUlc899H5tukbHTDlG4thVWbVU3p5e0nSkpgS5WVRKErcuLwtroStLK/b?=
 =?us-ascii?Q?QG9FFMx/Wi74dY7X1JswM/8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2620cb2c-fa57-48b0-9881-08dda7d67bd5
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2025 04:22:59.9954
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GKmhaWd/TDACnZt9puBZYu9DKZENnRqu+TBuDbZ75IaCPwydS1VjbpXjKMSymYSmW9kRbFl3gmXEaY1sbvJy7DGd6awza9YDWNFX+/DdThY3hUeEN2GIEF0meYreq/fl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB12373

Current Kconfig menu at [ALSA for SoC audio support] has no rules.
So, some venders are using menu style, some venders are listed each drivers
on top page, etc. It is difficult to find target vender and/or drivers
because it is very random.

Let's standardize ASoC menu

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/Kconfig         | 4 +---
 sound/soc/generic/Kconfig | 4 ++++
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/sound/soc/Kconfig b/sound/soc/Kconfig
index 1b983c7006f18..b6a1f6fa26a99 100644
--- a/sound/soc/Kconfig
+++ b/sound/soc/Kconfig
@@ -111,6 +111,7 @@ source "sound/soc/bcm/Kconfig"
 source "sound/soc/cirrus/Kconfig"
 source "sound/soc/dwc/Kconfig"
 source "sound/soc/fsl/Kconfig"
+source "sound/soc/generic/Kconfig"
 source "sound/soc/google/Kconfig"
 source "sound/soc/hisilicon/Kconfig"
 source "sound/soc/jz4740/Kconfig"
@@ -146,8 +147,5 @@ source "sound/soc/codecs/Kconfig"
 
 source "sound/soc/sdw_utils/Kconfig"
 
-# generic frame-work
-source "sound/soc/generic/Kconfig"
-
 endif	# SND_SOC
 
diff --git a/sound/soc/generic/Kconfig b/sound/soc/generic/Kconfig
index b6df4e26bc4ad..2acc9fda019c5 100644
--- a/sound/soc/generic/Kconfig
+++ b/sound/soc/generic/Kconfig
@@ -1,4 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
+menu "ASoC support for Generic drivers"
+
 config SND_SIMPLE_CARD_UTILS
 	tristate
 
@@ -37,3 +39,5 @@ config SND_TEST_COMPONENT
 	depends on OF
 	help
 	  This option enables test component sound driver support.
+
+endmenu
-- 
2.43.0

