Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010069.outbound.protection.outlook.com [52.101.229.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A3D2259CAB
	for <linux-sound@vger.kernel.org>; Tue, 10 Jun 2025 04:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749529197; cv=fail; b=ldY5O2oNyFlG2knaLwioTYVSPW7LAKnFmviSd/+VWCq0iDxVoaoa6BRLk9vj5xB4tS540es+HCTsCvxtNT8F8y04f6DZZSqAXVVjcNpIe4BC6oVgzwIEtWH8ohds6sEWpQCQ2NZ+p5qKVtYZoDBnuwiUnLQ9ByWsbFeJKta9TRo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749529197; c=relaxed/simple;
	bh=PmebEXJojAF5FxIeEtsItxn60I5UFi1q6DmvYQ+o1fo=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=i59Ai7ZU5H4UiBwgNfuuM4fdiHsbxr+4s+UBIM3W4j0pECRj1Vi1d7NOFqS3kRDirrTD6DO+fjBvOZLtQ+fOXNr3OvqdJvCuRFmBXwAB/I3gVa792q55ugqOh5Cm9PKL2FnhGtHzdxiO0wYsSELOVMowfL6qpH3HflHpt6hphmg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=L30m6adO; arc=fail smtp.client-ip=52.101.229.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="L30m6adO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KHUv1eFnLvL1Cl+/3p0gok2x9ujFhQIVt6PhG3Tkqbbu1X0+XBCLw7pPQ6thqdqNmz2XzZYVr5HZBjBSMcS9SdzmIv+XkTTdTqCjHQzg83qZgfke4XE2+2YRptWxpmqX5/7uXAPsy1PA9kezdOzhSk5X6cVq0JoJb8lMESDKsKr7WEYotVylMQ3VgBKTPP3xHnfA+71xY7PbjdsjTPwmZUjR5HRYLQhhilHN/+2JzMAXePUMPaL+In+yp9fQxAG3uJ7g15DKrordwtdK1CnV4cv+tyG7qKoJ2/5K0jK5CJ+bKZFgxv8n8KhWNRrrr7A65gbYfHeW96VPhq0sGwYh9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ghrzkQIe57Xk6CY/JvP6uWk5qBPau2m9nMqfZSzvYsY=;
 b=IinnxKuBUtIkv7roXtokZdImffeqjJmPus0XVE8bfP5mkgRPJFoDH+MnH5GORIW/bPe/eh/4+1XJKJQEgZ0Utd0JkFzPkeHQmXFqbK//NntoG42dd4GsztCupHQyjtMapTWuHWiJuv0tx56gvMpsLIM58yKO2vxtOYgzd9R5zRDnoFbiuNTtv8v9kXSnRJULuYmQi8QKJ4m0fEybjU7nAEURzp+tKODNZznzxTLZBr4PNCcLO/Svv3p6XvdiThJSucUgdk0+KVH5U2r+zOf4cSGRJV/4CAxNVCs2/ywFxzeWSemJux4AKv1DhmPfUcyIyA02S2OMlauRSUeRk5KkMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ghrzkQIe57Xk6CY/JvP6uWk5qBPau2m9nMqfZSzvYsY=;
 b=L30m6adOWIBoLFtf2OnpV4SxD40w2bYJqcS/IN1w4ps7fOZuYQlucIKRLeFF/V4avOfDc852FDdLDtPkJSgsj+GIYdvuDTBPS2weTgVtv1u8dYNxRNfR8jItsuCm9W8qtrT0XShLgj7n+3HKjFsZgAyx2SaDkj+BAVpsnk1CJjE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB10510.jpnprd01.prod.outlook.com
 (2603:1096:400:307::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.31; Tue, 10 Jun
 2025 04:19:51 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%6]) with mapi id 15.20.8813.024; Tue, 10 Jun 2025
 04:19:51 +0000
Message-ID: <875xh48byx.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH 04/37] ASoC: bcm: Standardize ASoC menu
In-Reply-To: <8734c8bf3l.wl-kuninori.morimoto.gx@renesas.com>
References: <8734c8bf3l.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 10 Jun 2025 04:19:50 +0000
X-ClientProxiedBy: TYCP301CA0018.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:381::19) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB10510:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a2c04e0-7d33-49f3-c731-08dda7d60b42
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|7416014|1800799024|38350700014|921020|41080700001;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?04NDWkESBCTklW+010m7R0gIvnPh5Lj/txDibgXUsBPtTjTtcwt7qjMxQId6?=
 =?us-ascii?Q?0C5wAgTK/agN2lcgX09vfuLMPaiSqFLOfioHFWYBdpiusGX2CAnWZIlXMJ+U?=
 =?us-ascii?Q?1ziG8RDvb3TPmxE8ae9CofE+VAHoSOYktx4G4ZCDyTQkSyLHFG4frCkhZ/bL?=
 =?us-ascii?Q?L87OxwI9N6unfVnA32hp6hFHB6QlasyDUsTNk5KVqykgjtk/hQJSike2T6pb?=
 =?us-ascii?Q?hTtXMgs81PY3eZWhCfBxG1lxLLHv5L2AsXUiwU/ObYFEPGWGPY+OeRGHPh/t?=
 =?us-ascii?Q?gvCv0d8AVgnCXjdpWPm/O+P9ah+wkDhi8Dbyy9MlIyBaL28M9CvjOBNBcqsh?=
 =?us-ascii?Q?dc1UBE4n3ZOQWEei6SZveQJwCoh8qIryqLPBYuTvQDEVzytya+6BCPGKxY5K?=
 =?us-ascii?Q?oNrimTGxo1iOkbm4+qLcG9+Sbtg7b2Johqrpv99cG2yPscraFBPIdivycwPK?=
 =?us-ascii?Q?MagHaXeUYuDk4/fAkIKoVSJS2Fd9Yu6CM9sSrPJuvV9DTXh4gIqqpeQFZkI6?=
 =?us-ascii?Q?FzkeMP9I5B3aDCK3LEjGcH+3W40cvD4W27mnTtKpPz8wouSKS6c822JR1W37?=
 =?us-ascii?Q?lZ05sVT1WQMDsHfSO22jXks7WR4nZ4IzxBXlUbjMKAPSGRkbn+pQxbOAwCsk?=
 =?us-ascii?Q?y9cwSx2MblK+BU/PHUr8POEcxdCHCJ4etTKIjGW6slczioL9H9tvxLcXFBSz?=
 =?us-ascii?Q?K79b43uQwBuhTJSXQpBnre4Vf+j2TeJmsmCv1E+yENJXAVHQFIuhDuus84GE?=
 =?us-ascii?Q?b7Rsp/QWGnXvDyLr6h7OpGGNmBPVUIBUQi8P/FWh/k02T7+2n4zxxAmfRQTw?=
 =?us-ascii?Q?OaK5wIE3T+jZDkzoLIMwgjefJ4/FXXONB0W67iQA5By0HcD07i008PW0gc8v?=
 =?us-ascii?Q?sCFA8WI0RrSyFDvcrTSarJy9gkgg4HoK9DjqG/gcu2QQRQHnn6s7rvtOw2Tu?=
 =?us-ascii?Q?pQM5wA/H9feOO7SPB4WQIIb0I4wifhAOAz0BCJ66gRgJNzOCIOV5lJjq19+i?=
 =?us-ascii?Q?YaGiP//ag5ctgIXFyRrtJFAtvXKlHWQazO3g8Yp347TJjmQuH6tovq+sjVRm?=
 =?us-ascii?Q?5sSInApAEQrOzGFiMLUWCnDh8WaJvK5euXyDZeOSFo/F5m5cZ8uMN5EUbS8q?=
 =?us-ascii?Q?Y3X8YCg0TbE3glaMVeWrVVL1DZOIH1AG0zt1zYgx9e0hO0QUCRbx8mfYc8LK?=
 =?us-ascii?Q?GbSXo4IkE9QAhFNurIxNjScX19qUjU1A8qcPc6b8qXpLsMuc22QOXZ7HcXlZ?=
 =?us-ascii?Q?clk8R/yKNPFoz1QxJK9oPWIz1Jz0PQhiToIlVMb71kdpB8KqgfNvqzedYiXt?=
 =?us-ascii?Q?PrTyW0loaXNCwO6mMdqeXCrggHIGMpwi5rNkYFgXZUBjLYv9sV9Tt7NB7kdN?=
 =?us-ascii?Q?fcZZUpIDuXG8CfrA5NZICctRCUj/ArJ6F6z+JUOOxKA6PlDLgVZRbI6ycQZ0?=
 =?us-ascii?Q?fgSqecyQSxBf/02Iqqad6CAa5+CKNRAj1l18r1h9kTO1cImIIGbGWbBHXwYs?=
 =?us-ascii?Q?rWKuIR2ikX/UyRw/EvkQI5fK/DvxuqufJVL4IKiLKuAiBImkq55VsFqjpw?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(7416014)(1800799024)(38350700014)(921020)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/iuBSwi5MNzZsmVQdf7uRbF+iubx6ldg0gd0IE4tRpCPvreAsflzm/LFMojz?=
 =?us-ascii?Q?mJJJ530PdWLgp61Ws9kgDNH+YBlslRU7rtr14LDJiUfSJs2OOZ/VyRhCwFP4?=
 =?us-ascii?Q?VIz4YMyCAk6KJfO/umRj4E2YI1Uy2gwt5Ds9hE7FBJju6xpjcUQkej5KwcXc?=
 =?us-ascii?Q?VuhRcA44k4ZKB8XngM80OHf4uLPrbN+EIE1YFvZ1YigSs7mvhMgAwpoClMfo?=
 =?us-ascii?Q?u/VrPcdkKO/rCuemnjPd1ZIzr2lRUxkEssY1a4KecuXl7WomiYozdnzPZVEo?=
 =?us-ascii?Q?nB2nJuK7itMgRniwKl6Hgw88wFQEDTk5CwpugkoXiChtI72wSHbAiAxt5xHJ?=
 =?us-ascii?Q?+QnRpXcF2jWidl2w7luZJK+GZhD/8lVnL5P7QjjA7Qeqb5+vxkCtsuj1GK7b?=
 =?us-ascii?Q?Q4PsYxiStttFobeSH3j+xna7zPAkBIX0r8vP6cERZr913SVxxRMYrV6rniB7?=
 =?us-ascii?Q?H/O4l7tx4iQdA03fgApNjlKgjJwWRd2+y30q12u3D9pbJMLS9bjFZC0JZKZW?=
 =?us-ascii?Q?5F5Z+M9aWgd74qRLUzPd14iPvFjdi2ej2nSm/lfO2PXnljeNxSyMYtwOYTkT?=
 =?us-ascii?Q?lnAVv4PNNmpJCIjh2zoiHDxxFRjLnftGx18cauVYBynGNMoyIcxwfX3Uadeg?=
 =?us-ascii?Q?OW/pDiM3mAFY6A3oVNl0ai9EJkiKboEUIGg+blXP2PElAEnCusFUTWc/Hxoh?=
 =?us-ascii?Q?dU0Zz6sZ5aP9FPGK0+YokegDkIyL8mNeIrAcKg2F5BgEVWPkHYX4a2tf69wd?=
 =?us-ascii?Q?ezjDuFrnR0xQO/NFAFhcuGGVDayn6mkDOiubOxTvDtyFpyK1WdpWMzhH12Hd?=
 =?us-ascii?Q?Bjbfsd7hNi/l5sBfdcjo+hLfNOKHv0W2Qd7VYDC9U9HoUI45BDXHU5Bxipm4?=
 =?us-ascii?Q?ft9438adqrcJMKLPE0tSr3H/UjFUE5vdScMf/pi5AN3/JdWVXBpewJBROR2m?=
 =?us-ascii?Q?JuQ74K61P/sJL2ZupByhwuCco6uXbpIGIGBQTZgCnIfsS5FgwIY+AAO9zk0L?=
 =?us-ascii?Q?oVE2MxhI/p6HettZuUZg90Iv/4dZivSTbexvZ6HAEecXwXXP5CRgjNpg3IZ3?=
 =?us-ascii?Q?GwIVdJNOpXRnDeieUptyBazq+hQV4uQB4gW5NSs+n+LOKFN2IU4o+tmnYEMG?=
 =?us-ascii?Q?/eE8AMXCGilwwjdI5oQ/4bPo6qwKHvGgv9u+pN+dmysTkSyDc6fj3FwQt23P?=
 =?us-ascii?Q?o1S6pwIbHcocvqKvqIIxN435BTU4j9UGBte39ysJoGoannIkJoQnkkaHkY5R?=
 =?us-ascii?Q?RT9EAtbJTxGvfeeIRQZw+fLwq6ae2MV7p6kZTzs8V5JoMeFBPlUdnHS7VNEM?=
 =?us-ascii?Q?oIxLlWy1xFDyI2gQlGiCbwCKIV8hFND2kCivc0dIqgzOtv3frNArYoeo6b+0?=
 =?us-ascii?Q?0I/L93J+YGikmKtfD+aTkgz1FkDfuwFCYMPZcZTYTMXeIng+qHkHbolC6Pit?=
 =?us-ascii?Q?hSGUJgjzoyA8TCwn8n3wOgi6FP3SxULfaOCuS8v7O3x4gDT+MSCz9dbJsH6a?=
 =?us-ascii?Q?/1JP/fsAQw1brvKlgjEjKPpOdlXwlJjdb+Msn6dJq10NI3CdILSK0bLYZdBu?=
 =?us-ascii?Q?AdxXcoP3I2nVUk3UbM9SD4I5sEyQGDGszEYPca+SdHHJikDAas9FvM0vWWJj?=
 =?us-ascii?Q?64Ejnx+Fxs2o7nMhRaQ9R0Y=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a2c04e0-7d33-49f3-c731-08dda7d60b42
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2025 04:19:51.1895
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2Lol+6LE8Kl4ubDYmyET2NAuzdFqRF+8QY4A/nx30tLnmjAnuFHunVkyWw40YNdmx9RmuqCGmbnKCSTRGtfrpUTcxAr4tBymBol9J6JBzF6j/Jp2eaWtiQ2wC36ezr1Q
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10510

Current Kconfig menu at [ALSA for SoC audio support] has no rules.
So, some venders are using menu style, some venders are listed each drivers
on top page, etc. It is difficult to find target vender and/or drivers
because it is very random.

Let's standardize ASoC menu

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/bcm/Kconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/bcm/Kconfig b/sound/soc/bcm/Kconfig
index 4218057b08742..13eb8a96c2acb 100644
--- a/sound/soc/bcm/Kconfig
+++ b/sound/soc/bcm/Kconfig
@@ -1,4 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
+menu "ASoC support for Broadcom"
+
 config SND_BCM2835_SOC_I2S
 	tristate "SoC Audio support for the Broadcom BCM2835 I2S module"
 	depends on ARCH_BCM2835 || COMPILE_TEST
@@ -26,3 +28,5 @@ config SND_BCM63XX_I2S_WHISTLER
 	  DSL/PON chips (bcm63158, bcm63178)
 
 	  If you don't know what to do here, say N
+
+endmenu
-- 
2.43.0

