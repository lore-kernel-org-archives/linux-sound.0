Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010046.outbound.protection.outlook.com [52.101.228.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59A4A25DB15
	for <linux-sound@vger.kernel.org>; Tue, 10 Jun 2025 04:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749529423; cv=fail; b=logLYIRbJj2lxOLX217o4zZ/4zquXemLU5qKpFidYPJYKvAzq1uGtHMOOmmtdzn9ps5fYUnY0ccxvZRjBe2NMK2pa4sfzHLTEynsbJAcldhx3MTqu1S7FYk6cVlArd/Y/y4cWpqjsOcV1f1iof70tDCIU0TWGfuUsmkM6DHJkm4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749529423; c=relaxed/simple;
	bh=wg4I0n0gT5TdWuR6/M3jStYXtxMvMzU6qP3yD13CV28=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=cbBMJs5eInNgZeScDHaV/gLHd3NQSUZruZd6zO21nZD1+mPxca8hdU+2D8BMFbp0wESLx/c624/1qY9ZGJmWlMVZWxlEwkx5//IlBtpsE8cyixTpt8hDekWI9qFAV4WG8gPd2pqxxbkdU+f0udQ0Qysu1CTUtaUm67hf4GIRM3M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=XiViSapO; arc=fail smtp.client-ip=52.101.228.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="XiViSapO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BOdpe5GEy+a4tyLga3hebVjC7tFzvxLN9lFc/PAQEN9TbSc7jArmLy99mH6Uq3B9mlHu6071K6vkf+oegaue1t7oVj7HOAvPobCJPOgu69QZ/9iwDmA7FupuNFb2P5wOOpxvnjQHKqD4mAhxthoaI9SwdNYZh2kPsFZv6hB9ApgnEzg4NwPtKj8RU7TdBLyuJeiDBy9WPjG+HLptmxsaXPG67vmAukHMAmMpm2dwkbTatGLIJ4e7y0UTzpiyyGiXKRdmxWyL80ra1gMOSlHOa4YI4CNF2cMF2jRDXDNW7JwVAjdnKWse6ORCftLjrCe8xgH2J1FRdPqFSXRKMv5OlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DjdYDaCJEL+yVFvqaDfBdVpRopouW2zbJiF9RE36h0k=;
 b=ideLRzRswFjYxoZ4Bx8Np4XdeNjH5+L70zkXs3KsdlTZwrXZM3dCv28XDGSrvtRqF4wr762AIsxIaXjGTF5ifflbeNRTsgDEra0gxG5kQIZ+PuuYe5f6B6VAmbe2xn+vxOJ3WEx1+eeu4q54HjJMYRnmuuSYIGv0bdKkDQszz3XNkV7YPit1iXVHk5TjKAIg51ueEhAPecVIWmOa4I5RliM42n1P5hxZDkqg5lOZAxE96Atm5UipTmsIwPTLCoECAFvOhuCI3au1cr2UxeXlu5upYAspb9/1t71uUhKo3jjmHBCLshcVYkQnqfipHRlnRvORLNnlGYrKUb8ULcSvHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DjdYDaCJEL+yVFvqaDfBdVpRopouW2zbJiF9RE36h0k=;
 b=XiViSapOeleVPc3T6jWnG2gZ4YgPw9qsUdZLc1KlJbdzuFNB/vmL/aUm5HOGmd6x5tfSNVC+z+MpthU9g8L0kJt18h9MvRQhqQsb7VL4DULIiDcIoyEpkmHiHBbVNeqQzpXafucgjSfeFi0L4OPz/HPtmssR3Od4LiPM7GdrclI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS9PR01MB12373.jpnprd01.prod.outlook.com
 (2603:1096:604:2e8::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.31; Tue, 10 Jun
 2025 04:23:39 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%6]) with mapi id 15.20.8813.024; Tue, 10 Jun 2025
 04:23:39 +0000
Message-ID: <87v7p45inp.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH 36/37] ASoC: hisilicon: Standardize ASoC menu
In-Reply-To: <8734c8bf3l.wl-kuninori.morimoto.gx@renesas.com>
References: <8734c8bf3l.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 10 Jun 2025 04:23:38 +0000
X-ClientProxiedBy: TYCP286CA0144.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31b::8) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS9PR01MB12373:EE_
X-MS-Office365-Filtering-Correlation-Id: 7164daaf-bf8b-4f92-00e4-08dda7d69318
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|52116014|1800799024|38350700014|921020|41080700001;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5cLmy1oUDFPwcy4Pz7p+ShChR7ABbaMqT7sifcreFMh3xMgLY17fFGGe3Yqg?=
 =?us-ascii?Q?+KugVpr0t+M2THcJzF9EQPPEiCUimMJouQ/XsH/0murqrcA5r8iuSllFzt8Z?=
 =?us-ascii?Q?dIbseZWgRghfC6WprYkk/cK5QgIo7l+hAyIUGIRY4//laMqTS6/FqpPAVcSJ?=
 =?us-ascii?Q?7C+aknOeQz/S8xuJ2gFZ5WfZbMesvW5SpzEzbESnCTyaV/6tT3zeC7rYXo01?=
 =?us-ascii?Q?sLggsU8c6hGRLYiOjqdbPzfWGW0mmX8SpZgmpIUXYF5wkGUeuP8rWlrOkCO/?=
 =?us-ascii?Q?e7YTemWCT8ZRt7ktSaRdY79tOd59o6Q41b4LHlQnRfUDXXba0b9IzXKjdQOJ?=
 =?us-ascii?Q?7w8zvP8ZKnPAnwj/GDwVThKjVWDVrc0E0LG0FzeL4/6zYv9K8CFMJxedA03M?=
 =?us-ascii?Q?kJ1Wz8grQvaT9kO1k9du176n79VFVeUucjzqT9a0gFo+QiEfFV2LKZMIJA04?=
 =?us-ascii?Q?1dzHciKgwrfTEXx3VTWeDke47VZ78RfQE8GiDueZ0JGD2Aq0hrTqgXWoSPD1?=
 =?us-ascii?Q?cwx+weEVpgQH9M/00tbUyyb+I886paRorsEvbUXP33G7leTjdAyGTlRCTmxg?=
 =?us-ascii?Q?ylWsjzSW/BX5N4re2a3Y/ExXohmPyZuzGbjcBk8Xt+4U9QhISxjS9Lgh2KDt?=
 =?us-ascii?Q?ExiD74jCf/Nw/U1uw0qTxUr7/mEQfIRiWmKmdTly4aDNSK/a4zNOmueanjgR?=
 =?us-ascii?Q?pu3DIFmEv6JiZbuiZRJ/Ey7GyviUQv4KpmuC8uxspu3g/8Pb93BmMP1vKEEX?=
 =?us-ascii?Q?AiAki1Wfgr6Ji+xFg8cVhSMGiEPk7gyjGBAgjl7ZimmyCzlMqf7Y27BCKh8/?=
 =?us-ascii?Q?XlivRlJjSELgYB42Njf1/dopjxouQQbW5XDzPiCOfI9x+dHfmOzoGM3YQ8eu?=
 =?us-ascii?Q?Nn7nn/adreCI59wNRyKu4Doq1jR1a2q+T8TxjWx6gWdfSKj89Vn4YI/F5B5D?=
 =?us-ascii?Q?8vb3V0T8poARO2weWsHOwJYT/SXtCEpZdvGQjUraM+QZAXHmhLDhbZKFcgcm?=
 =?us-ascii?Q?WcD2w26ThDEZ0J0hJ8SVtnSyxRES/NZBUXRBwOqXcTYf/rjX5WDQcAx69sFJ?=
 =?us-ascii?Q?IMX/pEz/Ki8LFZpwqTtSNTngu4gX5KKFocxAqDlyOuTWy20V5piKiXBwFYyM?=
 =?us-ascii?Q?aNoUNl2X2jQq6Shh3hn+Izre+kudAJlEkggj4Pl5/Hjj9UuzXt2wCFUhUSz4?=
 =?us-ascii?Q?a1KH9SFfRcUdT2V94hwraF6wyKP8yYVj32aKSg7cX4DePj2sBO4i1z1o93qh?=
 =?us-ascii?Q?mIRTUFPQDSxQBK8mFlW381GEH8m9t4WwSbuPRPo4RTGaHTj7Dbb0Qo3hlYFm?=
 =?us-ascii?Q?y1M8OyEYjOpghDjsOKwK66nsqB1byDCWHoEq+PHpbqZTm1wSpzrn+BgzTJkm?=
 =?us-ascii?Q?N0uheuK3+Am495to4qA+wOBwfGT0+fngEp2f3E4bcVUMeWLwNjfpX3bczCP0?=
 =?us-ascii?Q?hfl1ynQr/blmPJU1S0rDsojOprCWvpYYoJeRjAd0Wq2zMa/3O06lVyfqGmvw?=
 =?us-ascii?Q?oNNZ5ZNwQ5/Uf7r1qKghBMV8TVIQpa3Fi4ArKVxlIPYzUVwRKVtr2/IrCA?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(52116014)(1800799024)(38350700014)(921020)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?eYyLqqvTibFzPBWzLvdFdX/EtYN1TLqdQraW9IKnCdBMO8DjAldNorfpizYV?=
 =?us-ascii?Q?/53oc3iAbJldpEpzdDKLFgxW+g5MWfBzANBOeKQ8T3PBQHdhiXXscNnertq/?=
 =?us-ascii?Q?Xo72+zW16275882kNlzMhIHfIhGGVS0Q1eM/HPUxd0glJnoqzLc+NkpRb0V2?=
 =?us-ascii?Q?DjKWbYrV0SlG2aSHuTrYtD+ejtLeXGh6P/OsYSU8oc1C9C1UNVhFSKIJVs0T?=
 =?us-ascii?Q?4Wl+2Jbmv16hWjdmSA2CbhzT5nnvwmp+HF3plFcq2YZmMv+YCPGVcCYFn/2j?=
 =?us-ascii?Q?IVUAhNW6X1yJQ7ZGrNX8+Hk/2zJGkOtR5ETUIjmXFnOtriOrZnhrPEuJPbcp?=
 =?us-ascii?Q?l3V01dLrXvV57CwtnohQBgBvhrD0Nk9pxb3vVmWI1O4hP65sWeTpuXe3Zf0y?=
 =?us-ascii?Q?wBQPCidA8WunI4Nacg7+fxwtenX1ODZRPeM254Ub4aHw8m+RQa33WJsl2ULg?=
 =?us-ascii?Q?/4WBugZFEMGZtAqXGN07qG9XvWKiPicHVF0Yo79uV5X8iECBxlXdTdTqDwBu?=
 =?us-ascii?Q?vC0RcVpleZYYc6BbcILYrR4YAlGrSW66tjHJkuTijpNLv9clSH8i9kgS8Df0?=
 =?us-ascii?Q?NS4+qklOxXI3/3vh6QW0Uikf8tBNEj8W2WL6xCvSPvZR1agS7aowCUbjUbMp?=
 =?us-ascii?Q?ZPRbhKjOUcJGWsxLjyEsF11q4LNAT04mVI2T0938rem5IQ1BmB2aA6PtGdq7?=
 =?us-ascii?Q?gsG5ZhlObnzRixTLcZ6zKAIUIWu+8GMoAuV5SJFxOTc8iyg+N6s95CX1O541?=
 =?us-ascii?Q?ZApnDM3KsBWgZ69TRpd5u4Roj1TUlXzyxHxpNJvhqcNRXZRDhg3pnI4nodGI?=
 =?us-ascii?Q?UV1wIRSNmtQXwxcxC8B2j4dusTnN3h+U9HWom8eK2vgCv10XpDj1KkoNkCxq?=
 =?us-ascii?Q?oXruZBomUE0iFSpUEHBRdBP7UPk7bc39PUTK7EfxhjvuvYV1kFIKsM3sOmHN?=
 =?us-ascii?Q?WpEbKHFeEMi7RmyFwT9KFqiOASx067+9H9T4l8fg9l9RkNlKqTHUUkiiimzo?=
 =?us-ascii?Q?g00tlmQb+/42XxT1BgpQfigP5OrDT0F/s5oFcBI+/MwlV3yC0HpBtfnBkRaK?=
 =?us-ascii?Q?vPH/QkVhOafRiUozFw8Izw5uJiXwtTvll8ad0fN9lnWk5RSOFaO6FcBQi9ao?=
 =?us-ascii?Q?g30TzvIcIMkAUvsacCXumvOEbkyyuXEmOUO+t+p96avWWAkkMEewLXlW69d6?=
 =?us-ascii?Q?mjh0z7bqSReBNTA5RYA9TnMfxVlm8oEjP83yF719no12wREFLBJU5dAVH9l1?=
 =?us-ascii?Q?0az8wTedCCezVjBt7XYzLs8gHxcuVBcyMzTWXTBQ1uH236Vo8DYHA67Po2u/?=
 =?us-ascii?Q?WC0O4Pv/DHnMnPaV5mM//Dh7MTIMcLZ73MIPlwnALM9bNjUcuskFx42OmBDv?=
 =?us-ascii?Q?iPlg2n2qzL3b0kPt9UiSuOOMMLUhPQNEtYMCf0vaGLKQDr8PSfS+kn7giiqt?=
 =?us-ascii?Q?SKkzzqM9P5B5virf7iYaU2Fz+1qALkFLWZFU4W/uvtK3XypbOBnqf5MgyPI5?=
 =?us-ascii?Q?2qxiqYbbq8Ayl/DI+pzdCZQNpnpOBbCp4ua35USXQCZkA9NG7yCrUpz1DlfH?=
 =?us-ascii?Q?VM2UMH8kk2CgBlVf8Gq+B5L7H+4bvvxftv1XqaWthP7MWEPtQxSNpuSA+ZAO?=
 =?us-ascii?Q?1IIHNKUlsU/50MB4l2B4gWY=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7164daaf-bf8b-4f92-00e4-08dda7d69318
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2025 04:23:39.0441
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lHwH6tOmJIn+wZztd4mo0DTm3sg5VnRNo6m0wiaj+hB9Y/4GJ38bwo9n0ZaYuV4owskXRzVe42BZj9Q7PS3h+IuvEWrem+eUPkjf+Lpg+wthswWmED7SApWs1nGixnG9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB12373

Current Kconfig menu at [ALSA for SoC audio support] has no rules.
So, some venders are using menu style, some venders are listed each drivers
on top page, etc. It is difficult to find target vender and/or drivers
because it is very random.

Let's standardize ASoC menu

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/hisilicon/Kconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/hisilicon/Kconfig b/sound/soc/hisilicon/Kconfig
index df8fbd8bb4b03..5acb6c35a4970 100644
--- a/sound/soc/hisilicon/Kconfig
+++ b/sound/soc/hisilicon/Kconfig
@@ -1,6 +1,10 @@
 # SPDX-License-Identifier: GPL-2.0-only
+menu "ASoC support for Hisilicon"
+
 config SND_I2S_HI6210_I2S
 	tristate "Hisilicon I2S controller"
 	select SND_SOC_GENERIC_DMAENGINE_PCM
 	help
 	  Hisilicon I2S
+
+endmenu
-- 
2.43.0

