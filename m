Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011037.outbound.protection.outlook.com [40.107.74.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0047F17BD9
	for <linux-sound@vger.kernel.org>; Wed, 30 Jul 2025 23:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753917959; cv=fail; b=miU/c2JJMl7AG0UtGCu7Y3ugJIjOgTg76a5+N3cIUg4uvwYn4GCXSt4vCQHjJA+7/SJjn7MVfJ2PxHWQRMM5EM3Y7XFYI8w20RBB0DiQq/nAmPez2Nk6bi+Y7fwnvwPUUa9nYe2HgZeYHfZCo6i0yvpVfoK6VuDQkXi7P1yslOw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753917959; c=relaxed/simple;
	bh=30WhZ4QmxlvWqKkpByBxMjQYdeXiEZN1Va6PKca1KlI=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=OxwqbpRBylhVzxPVTDGSpsTUASNuy88sTJFbCQwJ5h9VQ41iHtg3BMLxiW5sGRMzw3DT7jJJ6udBW0vjAr368j04roqTWCnClLqBm8XBLZH+Ds4dCfFmErAYMcjBBvHb1sY/GcpihjUh9+DZO/wz0zius7SFjb+IO8IyDk+6WjA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Cy6Xigz9; arc=fail smtp.client-ip=40.107.74.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Cy6Xigz9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mQt4/TJxetMLgo4ULhDJ4g2CMc5MpwgEyaN/tuCgQ+l9G6T869fU/NAH9eF0Qs3H8XxC/CmcnnNvnb3+dUmI3mK8+gIIdxTzNpxJOvFuHQE1KT5OLAAnmwK11p3DY61aInQej46ht5CiOydR0cLTvO2Ya+kMEXUuwWduLkOMyyRf4qZNdI/u1m1nVRWqkIV0EGuX1kEQSBdYk2f6/m/AZhpp+R4bdT0R19sYEyr+IPQp6YVArJh+9YBep3RS5pIIGmH2bLsiqlzh1aQx+FgrT1KFec0/Gsntkll2GFaV9K8Ayk3Zj6CgrtxTGIR9y02wVGHL3Dz0oWvUxyQooVvnsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z/IS3MyU4Wv1MYIvCei5A1lnSv+TUSg7HrBfKsOdguo=;
 b=ABGw6OkxUJBM1bWEduPLooiog4Dl3smBdyFDT9zXxe6HjDidRJAPDvtWhTu5RXHV3x6mkUG8X19mdyruEEdJMdFtR+sk+kmT6L1s9qWlJW9ry/PPWlE6kG1pV3WorNmKPIWXNMYwg9SvbaVGYZSBYLEnMp8TIEw2nl9Qv1uxUV0wAcK47vSSL5NWE2R8Zw6sHbjbXG81mxNTeZrVMdjpICYF+NTgdkVgJGWkMzn8Q83cujEZ5qU5ofOIwNRy3YdC+B6iXEwo6S+KRPK2l3xSMJ/LREwBt8aA05ynvvYicsJWAfi8NlVKTRQAzWrtxm/WFh0Ek8oxkyhGrL61iq9omg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z/IS3MyU4Wv1MYIvCei5A1lnSv+TUSg7HrBfKsOdguo=;
 b=Cy6Xigz9nlicBDy25+vy5t4kRLwXfWAUmrYwfcebpUVZIqiJGFwwSkg03erAJePcF3O5lGfDcmR8/by/1CDnOI39MymocbZBRKX2BaiVqBRfYUpyl40LocvfJTIb6CVRE5j5CSXVH65JfVYYjh60onZVADXmTACqRTj9d1HnQBk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB8376.jpnprd01.prod.outlook.com
 (2603:1096:400:150::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.11; Wed, 30 Jul
 2025 23:25:51 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8989.011; Wed, 30 Jul 2025
 23:25:51 +0000
Message-ID: <8734adgt1d.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Mark Brown <broonie@kernel.org>,	Jaroslav Kysela <perex@perex.cz>,
	Martin =?ISO-8859-2?Q?Povi=B9er?= <povik+lin@cutebit.org>,	Claudiu Beznea
 <claudiu.beznea@tuxon.dev>,	Andrei Simion <andrei.simion@microchip.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,	Alexandre Belloni
 <alexandre.belloni@bootlin.com>,	Cezary Rojewski
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
	Alexandre Mergnat <amergnat@baylibre.com>,
	"=?ISO-8859-1?Q?N=EDcolas?= F. R. A. Prado" <nfraprado@collabora.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,	Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>,	Sameer Pujar
 <spujar@nvidia.com>,	linux-sound@vger.kernel.org
Subject: Re: [PATCH 29/37] ASoC: generic: Standardize ASoC menu
In-Reply-To: <CAMuHMdXOWCSa+c2p=G_gUqK0c_Bd4D1LjKYgE+XX0oq1xtvpeQ@mail.gmail.com>
References: <8734c8bf3l.wl-kuninori.morimoto.gx@renesas.com>
	<875xh46x99.wl-kuninori.morimoto.gx@renesas.com>
	<CAMuHMdXOWCSa+c2p=G_gUqK0c_Bd4D1LjKYgE+XX0oq1xtvpeQ@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 30 Jul 2025 23:25:50 +0000
X-ClientProxiedBy: TYCP301CA0028.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:381::11) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB8376:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b6f6259-1855-42c7-75f6-08ddcfc06c0f
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|52116014|376014|366016|38350700014|41080700001;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?TrdV7mUGbM2nOS9YXTmUmKbFfLZPYgLGuFYQ6oz9U1ZI0njcE2PDh4Pvteet?=
 =?us-ascii?Q?iihQGfnuv8MyH9m9OF+xzSfBRssgebu0un3UI7+Fip52zFBLWGn9Wq4mKhn3?=
 =?us-ascii?Q?NxUXpsb2Qk5g6ZygtedIv+6/N750drbnEHa8Yi5sNvP5HcS8UwXlqs9IMDpl?=
 =?us-ascii?Q?rOp63OzSoq8rvxR3BH42i7HK08pAV21ZK4GKj14Qy6H0Nwx4sRyhgPL+K8nm?=
 =?us-ascii?Q?2SJDkzEzFwQgxjchGspCe6tyxw5GLV2DDJEBOajJCr7hcln4wd9Th2V0Yu4O?=
 =?us-ascii?Q?bP6OB+KOk8glj4cd4twIw/Mv00qzfCQjJ7BV4JZb8e6XInAc+MR/DMKD7kW2?=
 =?us-ascii?Q?f91ZMhqhkUPG4JCpxzdoRbeY+6QznBn0gqcocOs/DpXxyx1eC3AZxNFrRBK1?=
 =?us-ascii?Q?8S8VdHJtfY5Dkv3BF+JjAOuE4dU13zD7x8onMKYzzNtR5z0YMCTM6eFaXPTc?=
 =?us-ascii?Q?a9l5f3HHJOew1og5KwNOUIG1TSaXDVx9q1my1H/CX43/tNGUErS0tgREs1BQ?=
 =?us-ascii?Q?uabBkwvuRb95SskhEo9PsHbUYEvAdRc7HQvYGpYYNTQg5LAeD+BkQH7GMWc/?=
 =?us-ascii?Q?1UPWDRu4a+AjohRMS65Rkp0un2eOtJXjBSuPkxQ6CXZU8jJni7WikRYx3SL2?=
 =?us-ascii?Q?8yrZ5mbDYndl83QBBDz48MWBOwgWEAqSeBEyy0xR9fOGVdOtIlZ9IA0oezVP?=
 =?us-ascii?Q?0HwOWPH7u1JP4SwMTaf7WP4oua7sJ9xc8hYYK6XKjKdl/cfK//k4gTxB1u34?=
 =?us-ascii?Q?VJg6BKQtKcbEukv1jrY9Q6KFKLpkfd7F+FkwKMir4vXPHpgNW8JIyvIIhsa3?=
 =?us-ascii?Q?hgbsngQk0GFWzRGXXOZspQQSJLSUNk57+dMUNntuVQR227zuO9oS4EYdBS75?=
 =?us-ascii?Q?Je2hKoxhYHru+O3q2HKqsKeMV7vuwHqoj1HncbMfNIXewilI/cYYIN6WPVSk?=
 =?us-ascii?Q?Mr94cIJ4iDbWDYHh466YsF0RAADkIEWyDGfw82MZCGRPF1LRaqzlJ0lk0iXK?=
 =?us-ascii?Q?/Zg8IF+2w+mk5xRpg12e+6AOgQQ7Yf6TA2eBPQMfnhtOMHPtLSwaLpHS6ESX?=
 =?us-ascii?Q?BsBSdfTZ8hqjDQPqIDmlXfbmY5IV+eqM2XsMXNhtO03vGI3ifYnDMg2BN9gZ?=
 =?us-ascii?Q?3KoBG3dfwiRIEF0k3+BEY4DW5TYsuEkRI0uenfmzSCS1KWlPAlBdLkdblpwr?=
 =?us-ascii?Q?6hHKNFZydeMzS0STpAcSnScds980ZvhrGFPvGLTIiRKyQm20i+yvciB6oSdJ?=
 =?us-ascii?Q?qmR3QwzaDo2CReaKnPoN3uT/nM7FytQ+QYiJTq70XQVx+RDXkn+GOLMcBP/Q?=
 =?us-ascii?Q?GXTYkAXpYy9b07+u/XQaieQ/A0ih5h3vlVeoitTd34+08Mil2rCiEqvM2qBu?=
 =?us-ascii?Q?EmGloxam0AqY0DquY6JvsCtkhKrsmuF/p7gJHB/NqiFygw95qDP+KILyZBP2?=
 =?us-ascii?Q?ky77cg1+MJ6X9YW5AaRsrmfobD8SDxvjVnn+AS2rToNOVKdljW6bLG+SvCH9?=
 =?us-ascii?Q?ya0BK7BQQTAhN5gZh8ZitQ/EQvLq+0obewXs?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(52116014)(376014)(366016)(38350700014)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?S0fBOOCfU807ax2B6gVlaSawOXfhcuq5X0/9qMif8w9yctgkYKlWQmQMSyU2?=
 =?us-ascii?Q?d9kSjAW8lVHwha7oj1wYqY9nGD3fORx4wB/oWZqJ0pRfAnu8IvTMicqPRtmU?=
 =?us-ascii?Q?7KkLvGhaj7JPN4Ier4G9augS3MUiJSVZnkgsqmRT4eyM3gGak454qTfHghiz?=
 =?us-ascii?Q?/qs/zYj4tfYr1XMeIbNLO8GjDySfcoC7AwkCu5Jhd2ZzGAHObWzejWiSN+LF?=
 =?us-ascii?Q?S0s3vrKixca0L1IOp5VhDS0KFw6pRVJyTYqmcyqg9AgzOAG4crODQTTyZgJZ?=
 =?us-ascii?Q?oYhQUbte59RtE5cOrMsX49ti/CmZ/1bwTxNIuzuHEGDJ5luaWSG3s+LnMZBm?=
 =?us-ascii?Q?qbxGyVwTm5tyBd3ru8+pA6aH3nXFf31Ys4IohqbPK33g8hjZMLEuH5xqYBj/?=
 =?us-ascii?Q?V70pYCxwiUgp56ZFFAUeR7QXWvh3Xj/SajcufoGf8VHCpqkOZp86HtP1M+QE?=
 =?us-ascii?Q?Vnh4bTPVpIk1dp6swe5I+LVJYHm/BVIHEdqDdmXu2eIgSEw5UUoVeQUZYeX9?=
 =?us-ascii?Q?b4S0ipvDnAAXyzy/6khuYRklx8iTRsDpQejbGaeYJodtRshruh/c+L1XQ6Vh?=
 =?us-ascii?Q?E4BIh6hJVzeS1QTfa5as2+lXRPU5U4TkZoI2KFTWQnigjCK94C5RP7F1sbJ+?=
 =?us-ascii?Q?Jq8Eskw5UepJMI+GnJEl/8fXrHBmHEhhPcFJrt24IBAw9joIzBAKH0Vhj7Yr?=
 =?us-ascii?Q?11/eHSvOdMU0jr53dFRHUojoxZBmf6GKgIhIyX71sFg0OfXZhdjDv3DiLbhX?=
 =?us-ascii?Q?4ApdiAnir8Uo7cgcA7ipilsCbQgusJn4h5jVBn5xyDhxNzDavJh71YgJ0URR?=
 =?us-ascii?Q?YrlrDwYPsOrwamJw9kz81DKfcqFxAneduaqISPWuNDeGqUhMohOvl2Z71njy?=
 =?us-ascii?Q?DPcNpnh7hoV1nuhoACozyXvMxQ+rDRAKjg88s6iOX/ugUuX/ceJd7hPHG0JU?=
 =?us-ascii?Q?HrgyXo1JNL9djN+7n0rCWqwrhqFAasZqoJAl6ILSyLSMMs3TK5HSNnV9XqJI?=
 =?us-ascii?Q?HUMSYkB4sefvmXWrQwpq1F+xv2qq+uClMlvBiUZvw3qbIRAetB3oY/yKCyB6?=
 =?us-ascii?Q?dz1FN2XLM9GWQmhNMzTi6inr4KQUA0wwtG5NAOZiNivJoJ1suOtc54z9MDEb?=
 =?us-ascii?Q?KZAKwrVuIiLJ61V+C3KHFfNAOKu86+By57+qlqYTR85rhKlvjsM+tH/hthoM?=
 =?us-ascii?Q?QurHEmxe1WHnGkrg1nY3+WgL8hyVdPMqFLZ+1z9X8fBDFGNAFt8UJYoHCZdU?=
 =?us-ascii?Q?vLxsVYhS/d/6fPIoqxQJenZu3BpcJnDnMWpBJ9/SdatESlSXEu7A4M8whk0I?=
 =?us-ascii?Q?FpszXniNrymlNNWy4uhqAq//D5TMxinaen/3OcN7SnUx6xRhgdlwpPkx+U6G?=
 =?us-ascii?Q?mk88VUWvswLPjCaD8xOqkckzCKc1Kpbftmp8DDLc2m7os1zDmX5ZXudn6d9/?=
 =?us-ascii?Q?jZ1V2GXc0f6C4puFA0qGtwGX/Pg/X93i6dRF2yKzcxdmBrwyxl3Ifb2v/VV9?=
 =?us-ascii?Q?KDGBp6GoISK31bNGp8zkY1lxh6o0qgxLDhZ0eg4INMKA2Y0NbCjQybOQWbvg?=
 =?us-ascii?Q?YQmRznwN/I0YIGVcpbaQbwuh6x8xR1GC/6ClihEvwKaEc/JwQD/Ai2gI5DfA?=
 =?us-ascii?Q?9gCa4U//DjkA6egIxiRJjIw=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b6f6259-1855-42c7-75f6-08ddcfc06c0f
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2025 23:25:51.1069
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dLUidEjrWhwbEbqZxfbwQm1/KTK5mhRbwCIGDAyUxHKzYC8fu6pYnb/qh7rHa+1Jv+7CzXCU3NKAlbtYuk8OmQ5NTt8VpEBNTN4oVUBvzNzFrHQGq8ZUFxE3Yota/DCE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8376


Hi Geert, Mark

> > --- a/sound/soc/Kconfig
> > +++ b/sound/soc/Kconfig
> > @@ -111,6 +111,7 @@ source "sound/soc/bcm/Kconfig"
> >  source "sound/soc/cirrus/Kconfig"
> >  source "sound/soc/dwc/Kconfig"
> >  source "sound/soc/fsl/Kconfig"
> > +source "sound/soc/generic/Kconfig"
> 
> This sort of hides the generic menu in between the Freescale and Google
> hardware-specific menus in the "# All the supported SoCs" section.
> What about moving it either before or after "# All the supported SoCs"?

Thank you for your reporting.
OK, thanks. Indeed it is a little bit strange. Will fix if merge-windows was
closed.

Thank you for your help !!

Best regards
---
Kuninori Morimoto
