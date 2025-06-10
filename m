Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010015.outbound.protection.outlook.com [52.101.228.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D905D25DB15
	for <linux-sound@vger.kernel.org>; Tue, 10 Jun 2025 04:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749529382; cv=fail; b=O5Eu0pCXIUWjdlibcrwKA7BJyEhFzFdcv3P+Xdcacn8abdrBl9c94W0bvqLttASGVPDCl+AQA/wJMPWOm5Xf52rdSFFPBumHKW1RJ6SD52OyvEUGaEwYo9tDujYeBarGBKQuP7UvmRjvI5XgntuogN+vijUE7bsyl016FuuGTsg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749529382; c=relaxed/simple;
	bh=TryDxBi+W73bTSVEsYo8M08iMtwfZ4hX9x2deimJlAU=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=MnmB5tlLnerELRa4tUs2K0H0UyJokQNZ9Y9ieihlwgMXxBcoSaUY/2tU6CeYUwQ9fpxCIAugeBZfohCA2iCyQLDUMjBCAknbHIKFkhkCWn2Yy+yhhKHqGD3uU81yC71oPd/sE57nbjMnbijopFVcFyiinc6gnXMumr31oCffGdM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Ka7CSJ0a; arc=fail smtp.client-ip=52.101.228.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Ka7CSJ0a"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e/2XipTe1mbbMSROr1hryoN/B4+D0VK4HnbeAKfftMgRP3Of3shYgXx8WYzxC52bsxxGx5uCj9D9fquPQ8hBLVsjG/14Gb7MO1zeFeR1vqXp4tY3zo3BzQjDgTf5MbII9UGa+imVf090cw/SyCD41xOPF3FAdMQWqVluoflzWGrBIMtAG/WTjQl299qjBFIPhbrq+iekXwbrgmRolnDtAjq1lmKA7gMGZO0g3JoTCn4Hxc2BwQ3aSDOdJXBpa0+LI1hGH2Z1XjLsFo9c9GKWN7Nd8AjcGOQ6GC5uV6/3oDtosu055Hffd1uPUkbyi9NgosBN26AxuZc9SNl4vp5RVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SXGgbxvWp0XsSb7PTrGSYba/O/kSEZK4OGJiDfCDXdc=;
 b=dUEooxXANioNjBR9FeAI++UM/tT0IAt6SOyBdN/ZznrOs8wEgtIt4YtNZEZiaoM8ywAOkSYCgTNW4nTeJmSCoZEeEODWnRX+6DIPgyiie9Q/CEEu7tCfrmIJOzJR3Xq+4q1FUMzFTOdx7hFVn9yzqYdBhILgctqHZtWbeONn90j06YzetcjTLxBlWnHN48T7Rbl9/qMRrjJEc+Vu/iMc3naUp4RhLCe6p8VUPPpxzCU85I2aZ4EO/JLgC2/qm2bFpBRPHn/Y/E/haS4HLe8t0d8Pa9Xi7WzjZo2878uiwBWc8opH0U8rNrfgI6Mlzh/tlF8ep4Y3dSO7DREDHD9yFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SXGgbxvWp0XsSb7PTrGSYba/O/kSEZK4OGJiDfCDXdc=;
 b=Ka7CSJ0a+rEqAREiIir1cInbd4t1YDUJuUZbUznWpIOf7tecxE6jML75aTbnThUoHkCNJ4hhO15Gthr/4hj7vOz6P/VDCyik3CysptaByJwbdBrP2fuEr8mA/Nnv0hMwJTf7LA0D7tLziY59w2dBW12Whi/0EOWp1tbZGgWckbo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS9PR01MB12373.jpnprd01.prod.outlook.com
 (2603:1096:604:2e8::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.31; Tue, 10 Jun
 2025 04:22:54 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%6]) with mapi id 15.20.8813.024; Tue, 10 Jun 2025
 04:22:54 +0000
Message-ID: <877c1k6x9e.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH 28/37] ASoC: renesas: Standardize ASoC menu
In-Reply-To: <8734c8bf3l.wl-kuninori.morimoto.gx@renesas.com>
References: <8734c8bf3l.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 10 Jun 2025 04:22:53 +0000
X-ClientProxiedBy: TYCPR01CA0203.jpnprd01.prod.outlook.com
 (2603:1096:405:7a::12) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS9PR01MB12373:EE_
X-MS-Office365-Filtering-Correlation-Id: 5faf5b2a-0e75-4c27-91e4-08dda7d67890
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|52116014|1800799024|38350700014|921020|41080700001;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Q1DrTi88rV/APexRR7Zk3aNl7+/42q/lXV4P6QCNJVKjEEnP7Uih4Tc3k7IA?=
 =?us-ascii?Q?xG6VpoLRVxaTFNfAkB9Dd4yW/jDSDgrZCl74Br8A6zjkktTl4Od0d8cNsoxH?=
 =?us-ascii?Q?ySNWyRBmdH+98rEEjWD60/FOQFFFxBdBS5H970FyuD9QDdSYRIkBCRP4CTj2?=
 =?us-ascii?Q?TDzSju2WX6LZ22Av+vJc4CbIsrl7S89OqHEuPG4/vf16Aaq7VDkv8SoEc2oU?=
 =?us-ascii?Q?cL6UTN3L7eHM6grR2RT9H+KmOnntrmMkllnS9chm7S+cYquPqYaEDUXDJbBv?=
 =?us-ascii?Q?6l95uAUy3JcQhRBoyyxW17OiXuYBEHLG5fpT440Qq7FOI7eH+1XYMOxgq9Lm?=
 =?us-ascii?Q?6ebeAyc/ow/RI42s2hM8GiCzEFDc+doUz+WxtSLPDmmN74rDDKaqOs7XYLj9?=
 =?us-ascii?Q?CYZjhfN48fnX2goWHGE1uDk/XgD0A24zWbCncBTQFeE+D/ESMNKTfPjy7kVp?=
 =?us-ascii?Q?+L2EIa1rWVcDn2DCmcmvGGmU4/nX+3EAnNWGVeUgNdxoG/431vMPoArB22c7?=
 =?us-ascii?Q?7bvJKxw/944uvKf60Yqi0iCCwC3Ei591kGGkD4nlhni7E+Xt0dA/JulJx6C9?=
 =?us-ascii?Q?VWT+E83zCEMh6fZRRRLFE60xolPSoaHxGH0jANt3IIOexoN8x5roUZD5aS0V?=
 =?us-ascii?Q?BXY3a1TffzaDwqZumiyhcEg7KrCQqpCM9kSrS+kkTRLIGwwxbCpY0/M3qE7y?=
 =?us-ascii?Q?tXOkXsq/AcljikUepnMBPeRhyzOKtZGhbRcsjGGpq+DoOtAt58vwxofAfsvf?=
 =?us-ascii?Q?hB3dkXPHnoOcjXnF+EqjucEZFR/6YXXJkB0xVOgtMnpwNJLKy6sFAEWbLD+j?=
 =?us-ascii?Q?h9EMmFq33nEKwHIpPpQRTV7ZRZMoLdnLtKy1idEEgm4SoAKa5rHD9qMuh97H?=
 =?us-ascii?Q?4b9sy1CnYfaFXhivHTkQLMoqLODsZkVidIv9rzcfBxY0sjEOQ0hQMzKpwxEB?=
 =?us-ascii?Q?SZIMoAEX8IOe4R3vwuFBTHmqDsSVtbkNZuiwvyrZIuAT2fKWZN00SqKY/Kf+?=
 =?us-ascii?Q?674hseJ90D2erHfYVWNMr10EB9kAXpCOgoopqgvDoXHbFXK4z5WFAfuXaRSx?=
 =?us-ascii?Q?/I6juT41N4rVGf8AXxh4dCdT7EdplcGqkAaECMMKh0otx7M56N31TcNHwk4O?=
 =?us-ascii?Q?CI0YC3x8WJO5X9hcvDoXMZD/+yzN0JgFbGjAr7b2X1c3lTdB393uvfBzUX/D?=
 =?us-ascii?Q?aq9o1jH1+YyLAbKhibRT9SVzcAx+YUAeEGlI2GpIxNmC0+5Z00EqHL2gDj7C?=
 =?us-ascii?Q?HI1fY/F0mF6m2DltDN0YW9TgAIiQfi+omi5CMbV15KUqEO7a/TpXBZHMnWX9?=
 =?us-ascii?Q?vGoWecemAU5WMsSxmEhoM9Mr1VJOoW9mJ6VYdqBIU2ME7tzAiMzXuRx69bB/?=
 =?us-ascii?Q?U+ymNHowGArchQBHeQfJx28NCg9oeAgffuVvNQwugbRALZ3UAd+6DN++SPx0?=
 =?us-ascii?Q?DFLuxkJgZ1My5+feFnLUYgK8k6x110w/pT9tYrpOcnitfqrb4p8+XxKjPrhB?=
 =?us-ascii?Q?EJDMRkkUrVmKUgVHcp3cZSIj6cMbWwEcXokCIdjUpXo2MIA1Keb7y7OfQA?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(52116014)(1800799024)(38350700014)(921020)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wS7gJf8TLvEmdz11wjsEOpjn+QaeTYwpFn5pgwxJoKCLwCKS2qT/PMzqGadO?=
 =?us-ascii?Q?EieAJlnhgxcEL4QVWrkXNS6XQSOVxZq3OYaDV5nQfL6WZVnrNqgEziiNNUkS?=
 =?us-ascii?Q?whEPbbuEE/UydwgOnuP9JMks8/BTo9MsvuDX/D79amwvaQawQOVmP6PFdQui?=
 =?us-ascii?Q?MJq3E+H7us8hJH5M6AzypzK9pwEwvAOaGQ9TBW+QPC7McDutfIcL6UqdC99q?=
 =?us-ascii?Q?4bcjv46wVsxCs9iZMyi7d0BOrjPvwS6BlF+pWcDISS1ATea7+TJ2x6/Fqj7P?=
 =?us-ascii?Q?1u7o7dumMZ6c/j0lh/e2TQoH9V8TNJ4zFPBCKhWTxjaHbdK4eq6vIzj9yMW2?=
 =?us-ascii?Q?tmjz1ygxd6ep+DlMbAez1MOKVXmTczn7EJ31UmPutX++vNycMEe/mazNa70V?=
 =?us-ascii?Q?CtJ6gJr/DNP7QJvfIzzzawg8JrNElu6UECb+s4WGNQzU7UQhWLhli+p5OC1J?=
 =?us-ascii?Q?grZCpBRatgAdvv7UIcqgYVKdrkpStUufIPVPX1Qgc5iqiQ9iKOtkS94g1ejb?=
 =?us-ascii?Q?0rY8h2r4YHyqT13+G1mGqZRMGHVtRvY4ULTeGMSGo2mGvh/Ew0zcTvEfbVAf?=
 =?us-ascii?Q?QEPbxaLbthT8KuFont2Hpwxc3AOgFnGS4Iz+c8jYamgc0y98NFGZeKFDa+DY?=
 =?us-ascii?Q?xMDIwPPwQquMqSZrawl8Z3Qj6BUS2WstkkkE+2K9or+h35H8EahtUE+F2F+/?=
 =?us-ascii?Q?gaoC02fLScrzl5szaP7En+baqRlXEn6WfK08ABPqzV9UIfYdphWEltbGOvAr?=
 =?us-ascii?Q?w0U0Zi3okvhMTzmPimEV2LiVgT7IX2IcTskTCdAXlZo4bTwFaJB7N2d0+3EZ?=
 =?us-ascii?Q?lb0JPkDGidfDcpYAGcWDbMREHIp1xVliUSznCppg2PiqYUQMje0lo7fn5q5G?=
 =?us-ascii?Q?u49EKHnOqpfHODOiES8bAfabEEtZAz/9iYkfkWfvBnNOlCsgYSuByRQKPO4W?=
 =?us-ascii?Q?vGSr9G/WLpjwZ8fdEC/dDi70IE59kfmW7DPa8iNBwHoSmZJHxGuOgDbSWvj4?=
 =?us-ascii?Q?g6LI4gOjfPuck3LQMvj/9Zv8YTZOabC2i7s0Hocz398CRgisoDaWWrI2hnNu?=
 =?us-ascii?Q?1F2DIaB+e4wj0VH44dM1M7dN2scFpzKUudqWbrVxRlAgpDK2SYgjfBjz1jNm?=
 =?us-ascii?Q?3KS07PKgtvN8vBEXtDLE6ICyeo8I6E7dIDzLpXMfbp1pMCFfW3oHdMTe6Ki2?=
 =?us-ascii?Q?8n+LE3XwRU8RsCOpimD50s2WpmKf27b+rHCtJXfy+Q8qZeaM2ENUUVaSsFG8?=
 =?us-ascii?Q?gj9Tjf4oY7a3IhaWNbyR+7nHvzMzjJiJyPJW223OfKv+gBgQySZnWGRJYPh6?=
 =?us-ascii?Q?0aIeM5Dr0DSQXel9GkXeVJiVH7P3J3XtoglNeqWu3++2aWNKudzwPLC8rHfI?=
 =?us-ascii?Q?uTXVYebcW8s+XszyAxFqDZqtKqj1/aTbQDAsbJAaeUYgIU7yDhDHsi9msnbH?=
 =?us-ascii?Q?coz8+jI8FA8S6zP6eJ8KlF49S0T0xvFTT5Dzr2OYIuSrIESc0gIq8pVmMbxC?=
 =?us-ascii?Q?lpQ3K3rtBwU+uisjtgWd6T4hhDM8c+T4dT+bpI3zANM+fv33DBY8qZDst7dE?=
 =?us-ascii?Q?QL4wKG0hGr90ikHJnXXToopvLXxPAfigoaNvpznormMElKAcPrhUtuIvZxXX?=
 =?us-ascii?Q?v0i+x7vHVL72mhZC23OWh9k=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5faf5b2a-0e75-4c27-91e4-08dda7d67890
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2025 04:22:54.5640
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LFwWlnzSdL1TISVid4i1E6N5rzMa87VUHzbQAqjtJ6+7OcgpFmkqu47zYFF81L/SVxuQRL8CPuYkbdkrAUrvCcDqqKcJfAI9Wk7NSzTbIkyUFU8zPF8554brMBfmuApP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB12373

Current Kconfig menu at [ALSA for SoC audio support] has no rules.
So, some venders are using menu style, some venders are listed each drivers
on top page, etc. It is difficult to find target vender and/or drivers
because it is very random.

Let's standardize ASoC menu

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/renesas/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/renesas/Kconfig b/sound/soc/renesas/Kconfig
index dabf02a955ca1..2473880b5caef 100644
--- a/sound/soc/renesas/Kconfig
+++ b/sound/soc/renesas/Kconfig
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
-menu "SoC Audio support for Renesas SoCs"
+menu "ASoC support for Renesas"
 	depends on SUPERH || ARCH_RENESAS || COMPILE_TEST
 
 config SND_SOC_PCM_SH7760
-- 
2.43.0

