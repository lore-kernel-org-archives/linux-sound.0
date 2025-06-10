Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010005.outbound.protection.outlook.com [52.101.229.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D04E825D550
	for <linux-sound@vger.kernel.org>; Tue, 10 Jun 2025 04:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749529242; cv=fail; b=E60MWcv7GpIguQhjUtLUK/yD9xEzOmsJtwlEYj9DbLE796eCYMHo/X1ex0GY5e9+1bIT2DT+ITmEgflxhIOwg2Wi8kFLD7oYVlqDlu1/97ON+789jXZdV4eguAH23IfR9ML/FLaQZpMpsQbWHpvadpwilFgWqM1KplCKIMLHaEE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749529242; c=relaxed/simple;
	bh=VNJ6Q92rVD8y+Qy6YluAjSD4Sz1sIp3Lc57HS6906VA=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=b6/UIfg/yKPK1otnoWy5w5eTWE6LYJSyioXKouB57FvEk9LPEBHFSfVILWu3N0whV5F/Hvsf/pGPUf40KZf3ecUmAdV22OSnpp1A6t4VBXNWnPizweCPA50k6qXCtjCTwsHzkotSy3E2+w7+/hRo925UzcV9ggEZc7uSJUhfzf8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=lDS/zyg+; arc=fail smtp.client-ip=52.101.229.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="lDS/zyg+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y90cLmPoQG37gr8jPdHkNogyeHhCsV3L6FEiPVYRtpKqhY3grElEkjd2YJSDNO4Oy+yFMltLaYZ9XHRiOkH1A0shTrUQTQO51tCjH8FKY3TGTjYv8LTiQbEumYxGYS6lPKsaADLYLIxtf8EeuXkwvXvFDjWyKDh110+wqU9H4FYi8TjZq7tUCskdexO56dGsKzEMSV/RV+IiD80B4x31R2K03Sl6T35VlMrdRogzRWeF0qKbS1bjRwoLyMnhYnfm5WQXD3TM6z9rpD6QhMFud3Dm5afc5QJRQECr1jmCJQqs9WnyzKHZxe2KYSFtj/Jr5ox44Pu9jBQI5kAqkl8Nyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kash1Z2GSMeNvERE1TnFtqDwNWvWRocxlgPhYtDwZ9U=;
 b=bjjpL8/oxhxCoK9k9vZjZDovMQmwmOBTm9RTJGVbozAhK1+hy5WRyWZZ0reueoiS3bzDRzturvwmUL/oguw62LvAgRTdEpB0tP3RG38DkT1/Y0qxnIYQJ/IeJw/jqH/PSac7RKqS73CmtnauI66tW+Xhgo0FUHgcvPWBq9aldUpICOyMDPXbZ+HtoGKEocITwtBzjTHMO+An5mCXp0CSaYjDTa2B3Kp4ITg2aOD/P+Qvn6ksg3xlkNszZCMuBnEBIdaqLpi9mMV5Aq9ApfsX4lINqUR3rCClRAeRwt91fTKNfTCWrZR6o5NmNmtO2NzHjxOj4EAARObFQHiM+e/42A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kash1Z2GSMeNvERE1TnFtqDwNWvWRocxlgPhYtDwZ9U=;
 b=lDS/zyg+A3rXhajbfIAZ08SYiozP42RC8c6kvc8n663/4/hz27RosCO2W76ZViltOe2bIV5c1P1fIlqXkxhcSyX7BlOxVktHznu6PZkOV6HJzQhm/gRNBWs+yRczx/VE2yNQTPKI3A50gLmyiwMlz5UExsF0PpBlfIHo6jKVk8Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB10510.jpnprd01.prod.outlook.com
 (2603:1096:400:307::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.31; Tue, 10 Jun
 2025 04:20:38 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%6]) with mapi id 15.20.8813.024; Tue, 10 Jun 2025
 04:20:38 +0000
Message-ID: <87y0u06xd6.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH 09/37] ASoC: pxa: Standardize ASoC menu
In-Reply-To: <8734c8bf3l.wl-kuninori.morimoto.gx@renesas.com>
References: <8734c8bf3l.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 10 Jun 2025 04:20:37 +0000
X-ClientProxiedBy: TYCP286CA0206.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:385::14) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB10510:EE_
X-MS-Office365-Filtering-Correlation-Id: b61484df-6ad4-4124-e6a2-08dda7d62748
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|7416014|1800799024|38350700014|921020|41080700001;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xI7Tj1ZUe9szK25RVRZ1XUunIA4Hc4QipoEmBy8IdYd4P5G7a0oPhONkXK7V?=
 =?us-ascii?Q?Sx0ql+Hihmez1NuPhVOOPLRFYuvZ5qSntWsRHTzlYQw3OuLbDBIVphnMV+yR?=
 =?us-ascii?Q?9/OQ4MDy7iKWENPoxmRjinZ2KCdt7qInLvEl8md6tZ5QNqLBS7kAcLr6gLpc?=
 =?us-ascii?Q?6TT/WSd8Ig9D64GfIUWHXmRzUx8I19N/ft+QSG6pYk+BCr8987dWrk+zF43Z?=
 =?us-ascii?Q?0iOQlA+EaIsN6LkdUMQ8+PuXhybhug9EygzgP/Dot+Kxe1ZBKVHGARLf6rcC?=
 =?us-ascii?Q?0qy3z8lZfYEy8GKGLRpwGENgmkBvOnsDpSWm6kdx3VViqe4U4Xhd4uouAemC?=
 =?us-ascii?Q?4U/L8q+kkVzkttt94X+TY6i4ThA5CmXdsKSdtlsmF6Lc+kYSfL9ZIeyCBgWp?=
 =?us-ascii?Q?/m8+8qKIDR08tuLx0A+6IkIsDYKsiikir9pTebnM+D9EZIVAIAMqIAzgUwlR?=
 =?us-ascii?Q?+iY17UkQEvpuFdURzM2KrImnRfoJuiEdlwRRGA2F6jaMh63a2eAd8cSk7Pu5?=
 =?us-ascii?Q?mK9lk/HD7lLaYVMmrMSRZCC76z/uyCKLesX/hh5ySQvFp10eIXe7rWcQiptf?=
 =?us-ascii?Q?n0kvp92WR5w5/ESWmzVzoNYC2Eh0QZV21geMg5u2BGOjVdxtYUjqX2EHVMxn?=
 =?us-ascii?Q?s1w1l6Rtah07v4cQSc6pcMjGdU6611n30RQiIasXr6uZzljm9o7brVKJlBD9?=
 =?us-ascii?Q?9Yc52Xr7073RXH9u/zWg+XOd80HVE2LQP3authQ0fs1PnvlbdFahTcdxBOlr?=
 =?us-ascii?Q?mH/IfALK5a9lUJg9oMT2a6Bot/1VfSUigZVZBVwo+x7aVoTgWujpaA+QVPNN?=
 =?us-ascii?Q?A5mUhu5KwH1OAj9Jt0GRz+hMmw0mm41IGbpsFtfaSRRah9/KlVKm/hdoqg2/?=
 =?us-ascii?Q?feMD+cqINX191O97fUeaga3rJoc0Wk8dDR9br+cazqBrwnqp3pnHFJfUn2RR?=
 =?us-ascii?Q?OOoyVElOGdNbzy061dbvxuWnUbfpiNbq891VZXWqAWoqzbZF7GKxPqJQqfYj?=
 =?us-ascii?Q?zf3Zk1AG8hq3L3nwoEsxIb++ri4mfPMDqR5YnOjNHM6svhws8ae0Lqx/StDL?=
 =?us-ascii?Q?algJ8LroPouY0ycCGOJXnO/5arlgSMcwOR/p4r47W1ON+pa6fN9TlkarT7iz?=
 =?us-ascii?Q?3GQ3aQFgr3l2Ay4vbcDhDUgptuLx9XNz7e4FQHRBmUgUQMAFgF8FGVx1uJ+0?=
 =?us-ascii?Q?SzlEOCxjmJQmA8NrvDHo2zmuizFugU9CUfYHZY59o5u3tEupt4Qn37cWqmjP?=
 =?us-ascii?Q?FMD2clQBhnAJaSgS1EeBUD9AvC/FdN0zvc5zsf3rhxTVglOX8FSkccR4FwY4?=
 =?us-ascii?Q?ijTFYwMM3WBOICCxM8otuGX++FHy2le2aU602zN6frRNXSOW/vVH7vqdDxOg?=
 =?us-ascii?Q?7ISB25iiLw/SH7w6ypb/VbSGFJZU62B5U8q1ZBSfIc5dnfNrl8Nc/+zNcX44?=
 =?us-ascii?Q?DRxw54TNW38YKtTBof+xJdEU2awY5iTeoqv5ee+6cMyCsJKRreWcrzZnCYi0?=
 =?us-ascii?Q?CMuxt3fXpnBBKW/f6M3NJPwVUvS9lCKgP4TlIv3RKXeO8miQwOji723Izw?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(7416014)(1800799024)(38350700014)(921020)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3KOZTZoNqw/ted0aJe/9eg51vyaQiAHjxtafzUjCRA9y5IdN2cwZiZ+Urw9A?=
 =?us-ascii?Q?ufvLbqbaSoX6R5MqxMkZCbqwWp0iP3PAQO+SYDwBCe5qzAB7ieD93oSPXnqw?=
 =?us-ascii?Q?JwzuwD6EoTqglhs9OzcL7xpEzO06D7ZMJS88v/QhuZfrgxqPhv9oCBRR26P3?=
 =?us-ascii?Q?ywvk1f1lGItd+leFntuvqxOWyBiLRbRrFGRl2mpxdLb7DFB/xHYeWPNCmA9L?=
 =?us-ascii?Q?PYQDWK2F9G0xnTl9KEN+j72QHCm6X59jy6Zna9OiC3CZ3iXyNCrwOxUet+HJ?=
 =?us-ascii?Q?fS2/h5UNECRl9uYp2zEzRZtnsfHH7dMlLRUehdUA9RSlCTg5a5must3YuJ/D?=
 =?us-ascii?Q?7qgTI9DgEY8kaqtneiP4tvVvQfFMH3E9oMRKNc3N6VO2uIgd93RKputn78F2?=
 =?us-ascii?Q?1jSpN9Is0GD0teajqV6rCv3gI6FWRTX7wRTGaGO54VDP7tQKCLaQsskfLQ6+?=
 =?us-ascii?Q?s54p6AoQyQBDbZCq4wtyuF8UaZALCk4xWcV9NEGKMg04PHjUSdqrCL1ncIef?=
 =?us-ascii?Q?6jQmigF8Jvlqu4BNjFohZtFptsCmujCk0NSNW6l+OtdUZbjOHVQJhEuEEMqe?=
 =?us-ascii?Q?5ofakzne7gUlormHBK0cy8pdEP2qZC+1wpBNEa71j4VqyobTbtErpR9zhoOV?=
 =?us-ascii?Q?M5uxpEwuZ9dy1TeMlKuBRZnKn9Zr4gSnVsXAYLQIGp1Nt7+//zmx4ZvFW1ee?=
 =?us-ascii?Q?e4HpJiLc4uthprwRi4T2M1MmBeoqrvey37GlEZ3HHkWcqcN/JmP0sqVAtI5Q?=
 =?us-ascii?Q?o1vsDBVMNCg6ayEK/0E73uTAtAkp36MC1mBWzbuQPsWqQTUWrAtYTvo3wcFb?=
 =?us-ascii?Q?AAhs0NnEmNTHfI6lNnXTRW1P23hUkosGHqCGtPPy4bvpn1VxmelUdoyt2IaE?=
 =?us-ascii?Q?zx/jn6rCDuVuv6uYaCrR2LPbwoYtVCVVAFUC1YZ7Gtj0iCKr+bkogA7J8fpk?=
 =?us-ascii?Q?K1GM1fsoVOg6vYnVf5tfq6scbadYStR2VlwdhodlwE98rK7EoyujLgtE+IBg?=
 =?us-ascii?Q?6U4qpJS00lu9R7oYG2znb/vBmRQiLr6Vy10CDZeFPogXYlvHg+0pEwOSyZFH?=
 =?us-ascii?Q?F0joo93n0DPUU7P1qUeSgVbGbQHCqFWi1zb8YBkOuEqooIQU0k3Ttz3zaPHX?=
 =?us-ascii?Q?hHC84BJebCLyatvDu9SBkV228tuzJKhgJjpaqFvI/TCxPhIpteOZeq748HIq?=
 =?us-ascii?Q?C/Py+ze8knjM5zUvNzEqmEon7VCqBRv/wkmtgjtJr1TuZcg5TyPZjB/5pBi5?=
 =?us-ascii?Q?z+MpdlRRSybZWwQ8vcwDKWzN8cWUp9AH3EGB0oUt0PLdWEHcZZFJ0O/RV/6Z?=
 =?us-ascii?Q?UcqcqWhGT0aWVq1Y0aX985vBRhZbACLmtD2Hp9kbqDAXAArBZEHW75CyHnI9?=
 =?us-ascii?Q?QfF5eC2ZGDVBOwud1m7BgFGbz+w3yVu/bZx+JgPEAVeJ/1sLLt4PXCQhSXNg?=
 =?us-ascii?Q?g4hNgDKHSrWcTiS3dWIP4pTDrqu/mO5YadYgYbNRH3tpmq0vUEVeHRAsq20m?=
 =?us-ascii?Q?Az4OkacEeuQh9I7ZTalOMbUwQV2SUiLPnNp7SL7CFonWUW2boK457E8ALkAq?=
 =?us-ascii?Q?5auSB53L2cGz3I/jN5199VY9qAjwrb2+R3WoRj5uJs32T6pR3X4LIluhNzZl?=
 =?us-ascii?Q?R3Z7PXa2Oj2JyTEOrwWyVO8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b61484df-6ad4-4124-e6a2-08dda7d62748
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2025 04:20:38.1978
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xY6O/D4Zcy0JcOFWvBHGF/4nq3LZQQT5k7yFFIs/h6PTIthbg/UjyV9h/3Ql4lsslxdrKfKKHIvtulrzEfMaIyLhee1B2kE8zyg/hRDkZpbL8zKS8NciP4BzkbcYpAtR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10510

Current Kconfig menu at [ALSA for SoC audio support] has no rules.
So, some venders are using menu style, some venders are listed each drivers
on top page, etc. It is difficult to find target vender and/or drivers
because it is very random.

Let's standardize ASoC menu

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/pxa/Kconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/pxa/Kconfig b/sound/soc/pxa/Kconfig
index e05d6ce4c8fa2..321e4d3d61e64 100644
--- a/sound/soc/pxa/Kconfig
+++ b/sound/soc/pxa/Kconfig
@@ -1,4 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
+menu "ASoC support for PXA"
+
 config SND_PXA2XX_SOC
 	tristate "SoC Audio for the Intel PXA2xx chip"
 	depends on ARCH_PXA || COMPILE_TEST
@@ -52,3 +54,5 @@ config SND_PXA910_SOC
 	help
 	  Say Y if you want to add support for SoC audio on the
 	  Marvell PXA910 reference platform.
+
+endmenu
-- 
2.43.0

