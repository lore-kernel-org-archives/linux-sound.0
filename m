Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011039.outbound.protection.outlook.com [52.101.125.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B88C25D8E0
	for <linux-sound@vger.kernel.org>; Tue, 10 Jun 2025 04:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749529280; cv=fail; b=EnNEIwEfeKQ/oitkf8f72AvSGv6zhrlPWQVnJL8wdYco7wJcM724Q6hWiCe41ntRZDrqgevdp1Md8cfgNXEADEJtcdISMZSp7CAcSrX9FPc8EBrYc1ltb2UJkYlWtpgcFYUZpi1xBVpt0UwGPHTqO83MgnVLPCfB6ep5/iiibns=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749529280; c=relaxed/simple;
	bh=VgxTSYHXrGSVPCfp5Cwh84texatQwCFhJaSYfdgV8FQ=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Dfdda0IvI4E0qWbdFFdXu3EigIZdHm69bYIdLc5YV0yFvmb1dWVnkdiCKrVXxco6+jplTtOxicle2MJYvaSRSNmPOeDZDyW4h/cUoteq3bVBPXNzJuH7TWC2ZraH10YUZcaOzxQF+R0LQP5zJUgdiWRWFeYjqVJ2DYU7dAd+8Rk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=kgZCQja7; arc=fail smtp.client-ip=52.101.125.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="kgZCQja7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LGlanKCFCN7f9wB5Unfi7fbRBEtJB5R8fALJRu4I+yFti9h5Bu2W/Zm/sma9ICDZEtYSz0IPzhGmEIClRcs6LdqtxCLJjkSBY0Mt/61dCEHyNPRUhPkYdNkA8hImjQZMtatMj5UI7mQy/m62S+V8Ag3S7u+SslEqmaG3ahKjt0pEw8+UzBuTQZpTUCcAUIC2x8FLlUu2ocbgoCCqthi86oURbUWRbTik1HrM4iFpFm+L8s/F/Htd++RnR1usXl6uW5LW03bWqg2qE+l/Bgt9fuHQac8HlOJXf73+Lh6Pe2C9pf4dh+f1dw3BPEpwV0FhBP0UFsipQKq0ILg1W9KgVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YHL2CO2kMD7/TbSotQQsS3ayVOI0G3+Mtwt9WRWtHSc=;
 b=e7oihXHBKZPxs0FBKkJkbZGslCEoa0N6ntE5KRn4BFD5B8Oux8CmYG5qDadvBDCmELpX8/zAVmD2yynTYk+ppfkVOvr/f8Qw+ZndrJ19nFjANPVPyMLpma331Fk8QaCakyo35shBF7tzReZwGUdbHROUKnSbUFknim1PQCQt5Ft6GuXP6TZF9KJmYznc20maSiigMOyZ1mt4t8ib5Bb8wsJYs72QXzKR/NbCcd60zTNI7DTgULSWw0AbJnpKHcwNut3AZyibXiGbTIK9VIUEtj8XF2wU6I+SGATXHL4lzSvay2zNF/g+bLtFsLgt3uVGMhpYfqtIBFiusy7SrjzYiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YHL2CO2kMD7/TbSotQQsS3ayVOI0G3+Mtwt9WRWtHSc=;
 b=kgZCQja7bP4palXZcyRFHTig5oV4sBcACod1DpZmNRFq32X0448SPCvq1fMfqWgI5oEpgVjahrhcWWMjAnm1vSSbhihWVFxT3uggwFAxutBJZeVNzYuqAPOzrhQDh/OF+FfGgcvCgNNP4tkfzSCYEFWG5jXC9W4GLZZ5FgdeF4U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS9PR01MB15231.jpnprd01.prod.outlook.com
 (2603:1096:604:3b7::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.22; Tue, 10 Jun
 2025 04:21:16 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%6]) with mapi id 15.20.8813.024; Tue, 10 Jun 2025
 04:21:16 +0000
Message-ID: <87qzzs6xc4.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH 14/37] ASoC: sdca: Standardize ASoC menu
In-Reply-To: <8734c8bf3l.wl-kuninori.morimoto.gx@renesas.com>
References: <8734c8bf3l.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 10 Jun 2025 04:21:15 +0000
X-ClientProxiedBy: TY4PR01CA0017.jpnprd01.prod.outlook.com
 (2603:1096:405:2bf::14) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS9PR01MB15231:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e3c065e-8a06-4a9f-1f2e-08dda7d63dcc
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|1800799024|366016|921020|38350700014|41080700001;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Od0fS59SSU07MQI7zbUGyDnHGypUJ91m6T5wqQwGZzljrgdSfHOceNStn42Y?=
 =?us-ascii?Q?qKcfmJWIp3ZsXWaQL7QsuF8oNHTRgxstWPfnR1XsVlRApSEwfZAQ59TyBldS?=
 =?us-ascii?Q?uf/tZJ5DOZ3IR2lrM4hVLpzA0wsladiwyWWylpj6H7WC7mmqeUIG4VbBctZE?=
 =?us-ascii?Q?2wBvHXGRLxwiUiy3SlkkZ6KsA1YgjITkw6h4j9mOb0g6JbZd6ryBbpZafjg/?=
 =?us-ascii?Q?cmeqXWo4hyBZIxFBIBgsQjOwwExHi2IWOhY7YHwUNgcsp+D7sp5v7tfJ5gWd?=
 =?us-ascii?Q?6WH64/J+rR+W78twUu79qJ56n5CAwSoagObR9ebmcOYEu3hTxjd8bZwqRcb9?=
 =?us-ascii?Q?mN64cq2VODrR1rxJ3UrPZ88xTuA8rP/2KP2IyM+0K3NQe8Vyq5gekElFLG0B?=
 =?us-ascii?Q?xSYVPioItywBUJXL4ko2Q+ZQYObgUg/yM2xGgBsWS3n/8kdVlRVwPbYRZRgS?=
 =?us-ascii?Q?rVRTcvjRq3LO93YvwOdkjfkpw4eKcZK4WAOrD0/Ep/zO065gVjjMj2CDZdjN?=
 =?us-ascii?Q?0rKXqKTVgGQiVnIuVU11IE0ezw82xtuHDnewNIitkaE1bVDxqthJtBQNft+d?=
 =?us-ascii?Q?+KVuZEvoObjk4lCuK3gQCWOssvEJIIvxDvVN2ZzDvxZfO+seK/t9yV7mHIA2?=
 =?us-ascii?Q?axvV9F4F0XxU2hUV2EhrKOz5VC2AKYdWNIYeYfWrLPa8W5bTl9XoB/4RKnFL?=
 =?us-ascii?Q?2PNA2lxP1jbBvJtz8SJWqOkAyhccBWLZFVBzNt7NQV0RarC+BjNspKGsy8ng?=
 =?us-ascii?Q?9NhfZhnUvihsBJA5ezpL9RyWhRTdHgix9kPVDrRVeCKsYW8qgmTxPL3tWJcH?=
 =?us-ascii?Q?d7bMQOBwsOjCMD64eRfnNmgk3tyWsOEk/B8zdu1y69S/xEYh5bxwRHIPIOHZ?=
 =?us-ascii?Q?nFOUzgv5s2w0UYzJRyTZW/tr/IEY6O05N0rNiqq/2q5V2J/tFBWhK3NGrQly?=
 =?us-ascii?Q?Y6ijXHSo8zD8o3tfDtuGOGTrnL/fv7PcDQDyzYA7DS5lPkVxvJiDf2VWaI97?=
 =?us-ascii?Q?p2/NTY5mbG7VboDcIJty7auNtUoJ3GfVrps+d0dL85G39/H4r3j8Mqk+pmU4?=
 =?us-ascii?Q?OVQ4GXzCuQR4yvUaay3IdoHkt7WYaMM1IKE8T3nomx6R0ZPW+eVsBmtetYmz?=
 =?us-ascii?Q?1WlogpqDjgMmzsbhfog1WvnKfXJhZ4pAvm3iUW38q0GlocksLmXUdSt4aIB8?=
 =?us-ascii?Q?0CDt38aO4qQlIQ3NGObZPSADU9VVVzbtgh6+1DYnSBHCMV1HmWgxRiukjJmP?=
 =?us-ascii?Q?uXbWvmVKdGNtsYeEEnn7eg1OlDECuvVaeC257JS6lxRuAaEzcJ9ckiwoX86Y?=
 =?us-ascii?Q?oQOmXIZgEz3+HoVi0m+MTPvlh3ZOfJ/40v7c8c5dbh8G/8DlBrdMvjDBeqqC?=
 =?us-ascii?Q?w5/KjQ1QeQn/OpWVvBiun5vqlTcbArb8mkK0unXl1aH3F114wpE/69VCvB3T?=
 =?us-ascii?Q?guq3ypHXurHNPVWezdgbUO8+zD9vaeTxd6MdvelgXHCHhGGMoKkgzUHfKTF7?=
 =?us-ascii?Q?gu0AI5Y+fmppnqVhhOMbkISRYvKqmtE0LwQtWCeqqyOvu9cKBJjysDuHmA?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(1800799024)(366016)(921020)(38350700014)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dgSzCpf2aINYEzr2J2sc/U3IsDgnbBdTiewehmvc7dik+7fBS2GHXFTya5RV?=
 =?us-ascii?Q?7XBmPvdDuMpYEGq1++tebN4f1miGHCSVtEy1wgdBGFyvdDMHr4Lo49Yr5m7z?=
 =?us-ascii?Q?S45Qt8QD2jBRC71bYKrCdmtwHHwRwzKWLj8oZ5B6+wh/BLlh6HfMChKZ10Wh?=
 =?us-ascii?Q?Fq5ztbP8LCHKtyWs1/oyS54G1tcxOsJr0H/SxyjqoUTrI9Z3zpK5Cq6A4Mg9?=
 =?us-ascii?Q?22v50UHBMwZ7o8epxXKFx6c+EQ3EOxMAsLvnN/oUEQsAmX8Ek3WjWU5ADv1b?=
 =?us-ascii?Q?zPlcmjq2MUA7FfyzKZsbKB6lEx/6uVvS7OiWJS1zCqSXdAiROf43Z3T4UAqc?=
 =?us-ascii?Q?Je0y9J/lY84DvKDlAdSzNgP4VrGOTQhzvb10V+LlhLPY/MCm7ERrvmLEmeV+?=
 =?us-ascii?Q?RQwFmLKpN17066H2jBOqh17wSd39vt+aSvdrvHWEWnmOSL5+xjXnngWOjAOC?=
 =?us-ascii?Q?btG1q9+HozSS91xz+u0GdDKZ7ti+NwnA8CYZ5iKCLpq3VHoXVM99q3gvP9Ly?=
 =?us-ascii?Q?/5MB9OgDvYh+lK2BTwHejCTYGf5B3a+J/9sSf6d9GIxa91SQd7X+gnaabLlO?=
 =?us-ascii?Q?Cp9v2qPQcBI2Jb90UGCso/EcT0DcBvX7TKy4jtEx+HU8Qc3en9Rpb3PN7pnl?=
 =?us-ascii?Q?XRtfzeLTWGFJbuS+/941lQzfBP47Y2XpHu0dPcLv4Hl5O3RT3gyxwmtwVhxc?=
 =?us-ascii?Q?VVSv71REKQsEts9GoI0S0aji6g8QM/6Sg2IdSnXJU8HKBcu47e1BwoUTCGhf?=
 =?us-ascii?Q?WexM+hAza/k9WtDVGkjbysctjsIKVqQO4lTNAeAMFnPYbhg3IpQ4wbVxyQTF?=
 =?us-ascii?Q?pSG9a2++73ds1QosGsCu+7MMsO1GkyILIgNbASiQBtw1iYSTq2DwQJvteGes?=
 =?us-ascii?Q?XtQrmyMAJI/gNxTtQkUPaaCzRg7bDr+pZ2lNOuD7CJNX+Po1CXd/tSNKyOjE?=
 =?us-ascii?Q?9x5R3infOJ7C01nj3xGDjUtWOqLG5Fb/+dwk72PRoGTkCiNJfDM6HeZeNqQy?=
 =?us-ascii?Q?AYH6t+7Y7yT0CzMqtwAS2yZ1IQDgnA1PfFRA7FAybArbdw2HWDp3Q7if9hoJ?=
 =?us-ascii?Q?hyi9gc3kG0gIbCJjmaHXBZiB8ArfZs+oJXTawbzx5CvkHi380GOf3qTA/Oqo?=
 =?us-ascii?Q?LHl093ha4XI3Hn6vh/2DY6N3HtIsJ2RO4P2o1plABe+NolcUp8Hu4ecA+mwC?=
 =?us-ascii?Q?cOm5iF+CIlv4X31snHSVbWhcvzuQioSDtHD26Cnq0C/x/UR/Gwr8O1ma8b+m?=
 =?us-ascii?Q?9gxSl76hamU8oTqsrfSl4LuZd71HRpjDSmv4tuaOHSo7Jhe480n91u2lYrIE?=
 =?us-ascii?Q?Dofby8Hoq4ogQ4e8j2xdUdtGpTkwjjgUnE1yAXr1O6BYYn6umyyXqbjTM0wP?=
 =?us-ascii?Q?qihKgjWSRGGWpT4QhI1lj2sJvG94xnsHw47jAe08rzGHxRGWuapFJSgqsFPw?=
 =?us-ascii?Q?aHJcpLBCYLWd+rrAhH2GgFJI3Ge4cucqqnTgpvMhBDE69un86m+m+OLCGgQO?=
 =?us-ascii?Q?/+8YHkW4UgZEhuzgB28kerSd230QaQ/skV2FQ5lyCG/TCM430tfOuxAEe29u?=
 =?us-ascii?Q?1d7wfgOS/yazC5EfO7NOR7TQjYE6oLs9NdVErxWHzg7TlqDIHQPvBA50frkH?=
 =?us-ascii?Q?l7tvMxA0Rjn1AJkRQCB91Js=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e3c065e-8a06-4a9f-1f2e-08dda7d63dcc
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2025 04:21:15.9459
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TOhJ+0zbAVSG480fhpciEz11+XAEQ7bs/pHbgVrJBVBL1VXszkp5N1AA8+WOVJmaSwBwbs6LnVXexpleNCCMMF6gVBEUsJSlkSxH+BRqcbQSGiMxiQ+YYwvkUhl0SAjE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB15231

Current Kconfig menu at [ALSA for SoC audio support] has no rules.
So, some venders are using menu style, some venders are listed each drivers
on top page, etc. It is difficult to find target vender and/or drivers
because it is very random.

Let's standardize ASoC menu

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/sdca/Kconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/sdca/Kconfig b/sound/soc/sdca/Kconfig
index ee20b9914aa1f..c514d2506a3a6 100644
--- a/sound/soc/sdca/Kconfig
+++ b/sound/soc/sdca/Kconfig
@@ -1,4 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
+menu "ASoC support for SoundWire (SDCA)"
 
 config SND_SOC_SDCA
 	tristate
@@ -9,3 +10,5 @@ config SND_SOC_SDCA
 
 config SND_SOC_SDCA_OPTIONAL
 	def_tristate SND_SOC_SDCA || !SND_SOC_SDCA
+
+endmenu
-- 
2.43.0

