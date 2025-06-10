Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011011.outbound.protection.outlook.com [52.101.125.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A23B325D8E0
	for <linux-sound@vger.kernel.org>; Tue, 10 Jun 2025 04:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749529252; cv=fail; b=ObHKqP4SPbMDxg+ykvn1aB7oKQeuhLWBf0WePKoalt6rqIM3Fa1sEQkxLQcLEr3pTZy3BePBMXL91/dU4WsImc13x+DbCi234Y6I4DFhB8HZuXMXR10QS73dyY+rpLQcMjX5E3dY/DYLtQ8bTPJLyS/OZF+98CbIQ+izfWgZnIA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749529252; c=relaxed/simple;
	bh=0Am1ez18QxQfLnsr9SsRCrpivlbVF4vDDxopVfzhNS8=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=PvSdFg5ixTDUe5hF79xOQONxkVSTYMdt0JjA9tyxb3nzCciU1f3O9M+YiXTvCF5vwKhXd1cmSs2mhwZlz+kgbgeOAOlpZWicCxF0hSfT1F9DBKPkvXIgugDPHYSWlaPTYC12MDjCOp9482YDDnfJuhVub3IZGiOQSkUYVbR8Xow=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=JhnpFeQo; arc=fail smtp.client-ip=52.101.125.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="JhnpFeQo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QgBtgJO1iTvPAEgbb1qqcuXnWfdbEUKwWP3n+ppw3zo58AM6ecY6iOTCO7LvgL3R86kLie8UiYnfyh4mm2nbMfQ0HfwJYYnq1LiGe0OxeZdMmMx6KeZY0NFwArXcoJVmE3jR9SOe4GlKjWk8LlOPgGW+BQU4ago4QjltREgGr4BmzEH7kfIGUqORaGjpSHJJmNOfWThEWulPQyl8x2i43sxOD62AM/t30enkjn1F0XiXX9Qb0MIDoEAgIMzDGnvkDKL8wZbeIYCwrYz9jgCRzXAJO6dZi8e28wmiUkrHNSrxwIfn1HuVTUOIvFtzX6vMLYd94764AFoZVVi9GBdahQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bvS7KD6TciPVJQb/tmL5+NtQz0ZaQSFx55Auwz31pYA=;
 b=HH5upphguPXdIshVAmWViqVYJ7ndw414gsd2Yi5XzHbL3dekIUwqtVd1KRg9iji0Ubr97tvCAIB2BSOMyrydWx+Fwgo8i2UAfhxJc4e32uyqE69cUp0F/unwtEldXl8umr1ZmrLRPzbeJrEnPGzIXYWD/XdfKUNmNboN1qoyE/uAL72ApNSoFq0Wb7f16QqugN21/RhlzYJi+ys6V+x59XxAC4aLdd9aj8AwGhXD02naGul2Qz5R+U3pqnM7gY7Y7uj4RhfZ9u0QIUvJZBvqsNqJfGXQ1WinlylELhpfq8jIpYIK+/EI/c7MnF8cRcZ5E0uVAhj7M1/V3k1EaRlMlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bvS7KD6TciPVJQb/tmL5+NtQz0ZaQSFx55Auwz31pYA=;
 b=JhnpFeQoVa6iPnCl0nAeA5GEeR+/yjVpb7K5dn4sYdji/PDX2ruEL4lok3b/CA4R8EFT92CTGWhP+qSwDpGjwoeyzSLfpJMBeevvexfcC9++TkROMz/Sr1LNQuw3FEOQ/jK3YYxBQiMQvipBMVTgdPvUKS9ERGaw8j3y5Xq6WTE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB10510.jpnprd01.prod.outlook.com
 (2603:1096:400:307::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.31; Tue, 10 Jun
 2025 04:20:45 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%6]) with mapi id 15.20.8813.024; Tue, 10 Jun 2025
 04:20:44 +0000
Message-ID: <87wm9k6xd0.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH 10/37] ASoC: sof: Standardize ASoC menu
In-Reply-To: <8734c8bf3l.wl-kuninori.morimoto.gx@renesas.com>
References: <8734c8bf3l.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 10 Jun 2025 04:20:43 +0000
X-ClientProxiedBy: TYCP286CA0117.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29c::15) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB10510:EE_
X-MS-Office365-Filtering-Correlation-Id: bb2e6f7f-6780-4279-b6c0-08dda7d62b0f
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|7416014|1800799024|38350700014|921020|41080700001;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?bW3Gj69vNgDbCgkz5dIVUmnF3W0v9vZ8prrje/Ez3IlHAr0zM0unuNBS3UqY?=
 =?us-ascii?Q?gMaV86xVumH7kPvKdcUDnZnpTzNnEZizCj9Wr/fODvSIBd5L2pnNH+yFYv96?=
 =?us-ascii?Q?/aI0oVjjpBRk/YVGet//YDMzrPXuhtj1Gkt4pFtHBoqjsxyG8Tc34pIl4ste?=
 =?us-ascii?Q?lPbyEQImRYnGNPRWUHg9XfhC4/zazjET8HuPOsV4JVYtYoBvPzQQAQ/bfcN8?=
 =?us-ascii?Q?HMGWAR7KnCm2Mk60UxIi+6JrKEnBnmAGnuMvf5Rmma0ZyGDScvrXJm3TO1hh?=
 =?us-ascii?Q?PlLpPb+UTBFL1Qecev1XWHqs1nSAeFNPRKQrquxwTlNqbtd4Prebm5n2oRmZ?=
 =?us-ascii?Q?6w3iQbrUyEMF6vlgApNHYXE2sV4vOM0EbgTw9XPqfcKf+QHHkMi5t3xkXsTi?=
 =?us-ascii?Q?yftdAnm202Kb5X2kaCLpMdqpLHz5oSNEnG9I3FiA7nmGWqaOz619PdmFboXv?=
 =?us-ascii?Q?r9Ix9A6rSXTqelGIDPUiNlnHL/K3qK+Z8ALJLWdzblBQ71aNlfb/cjxphDyZ?=
 =?us-ascii?Q?l6kGJm9+gB0Q+TyrGYvn/kPHVPVIi4e7e8A/mdNmRTX1QEuyFT079+C8DQkB?=
 =?us-ascii?Q?EdCf13pxZ2l++NA/hdfARSrNkcXOVSALRPdAG2Hc+nBibk33BEr+MAbBOkLn?=
 =?us-ascii?Q?Sj/MrPGAAjUPS/1wya0zZ22js+MPpIsbvni7Vr9Kk26XLyX5USEScim6lv+k?=
 =?us-ascii?Q?EZOlXPySSYxEO/UKNQ32NOlDIslxfSeI/4v4DrKLV6QgCwKN/ePieibgDDOr?=
 =?us-ascii?Q?NLgHPy5FrJs28aM+hpY95slOxANv4Q8U7rt7KjX+g9YGaIDfK85c2kUBbE7y?=
 =?us-ascii?Q?5LzgFAyS3ebacPwley5YULBCLo3spb9dpO7ZSDwBcxnMfFdDbN53Xhnq6Gz+?=
 =?us-ascii?Q?0XWW3lQFpSPfdT64FsnzFIihD8DnpM6W8HATQWO26mM1ptqSIEboxRWfeRtE?=
 =?us-ascii?Q?FSnuiTur1kSe/in7ImP0rHtZMY1XI/txoAXTuKKHVdUnoxfNr0VxH8KYWtOV?=
 =?us-ascii?Q?VBWIEErkVanTrg/fOnPAQJzFYZEG3hHzXg4US3hR31I6EU6IhveTTwNrkBiR?=
 =?us-ascii?Q?2ifIlUczNCHRVNGNM2CuMcdkNxBxiYN5eZNixdZ/7O4Cqv0bm+k4OWcOdXAp?=
 =?us-ascii?Q?llc+fPhmiSNORbI3ohtAQAx56cpKoyQXa/hC0877jZ+8aBLteDA3gNRizeJV?=
 =?us-ascii?Q?tEkkUwGQkPk/QxEZAH6nv5U62x/5oMS/0jrq/2+xbTklpVlZPFMZVsiu7OHY?=
 =?us-ascii?Q?QPG4cm+5c2M76Sgn68JT3pII+jvfYecTWQAp7T3XrdnVvgDZK5w/WpYNGquy?=
 =?us-ascii?Q?yBmZzl+ZLm5/g/hKYUWwJh3iMXhWIIFSlC2ew8XiUTQOOWvWnwO73Xkq0+rG?=
 =?us-ascii?Q?ES1HSSbASXAKB5Q9NY5tAc5Mdnj6Ua0ozDK8g3r6WsA4YY0iLvO13K2FVd2A?=
 =?us-ascii?Q?AOJyDqj8UBvSJoiUx4vDeNelf91ygKySKisLFydPXuNDWpSVLrKDa9lLhLuC?=
 =?us-ascii?Q?YKQNUahXapWlPUsRwSaAWoqdd0XkFKAO7MDJd6Zmhoqjj0B0s9ihX3mhpQ?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(7416014)(1800799024)(38350700014)(921020)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0gRinMKeTu5zwsTcY6NNDygIZaLGDDb5T/4xRK+FVDbo5+wJsq3tGjuzr+Vw?=
 =?us-ascii?Q?+GD518McAHSFUtCNfgnWLpeE8L7Cvonx8qXToOYJuNlDL40mz3f5VYU9d9Uj?=
 =?us-ascii?Q?vClYpEhkLw0J9asDFst38CDnVz88cXhu/2kG+4hU1nvnIrCPTHPDWXRD9swf?=
 =?us-ascii?Q?RRZOPpaeMb/37HH2fdRnD9RSD5eMIaxDEHq7MBoiaoUH221ghZGzi51iI7Tm?=
 =?us-ascii?Q?ynnYqGz8N6nk88wsf/gr8+WqcH17tqRGMPaX9GdT4vO+1vTJKTUHDrypBmHK?=
 =?us-ascii?Q?TCJCJjoFS8/wmYqsQohH7JuYVT30GMjcBLEWdRgdQ+oZPVF4nxtqM2zBn2DZ?=
 =?us-ascii?Q?Y9TCNjjDUMzVg0uXjZOOuVgvPsutLBR/tcKWI46zgcvAa1jGNCzCfu/n4eOz?=
 =?us-ascii?Q?TptlsgR0bact2YTHX4z4ugdjc+J8AKPseleBkubE89QkezcfUsnEGCw2RcAu?=
 =?us-ascii?Q?qbmx5QFo9cu2227CZYmKb9QPjZ6GJCVAdt1bJw9bJ59vGqk5YyQ9dSPjcL5j?=
 =?us-ascii?Q?Zb9pIpwmogErVUHtifF7ss3W0Wy0p6yedOKO8O7WAl+s1YFy05QshjUcWmKN?=
 =?us-ascii?Q?kP6KcmzlD0nlCN94RRFfiTvVc3k9HOD6o4nYTzBqLaDaLI3aueKL6KMlBY5u?=
 =?us-ascii?Q?6QgQPUVxlcEoCKiWSWuo2I+qrCTquPhp105JzbeGM1/C5QmLIY4KA1ZB1Zrl?=
 =?us-ascii?Q?59K+b2Gv+KUMiaw/ih4E4YQSqn+nEPRyopuK2nyWJCho6uh26Ht8EFa7zHKp?=
 =?us-ascii?Q?DsV5imldvHrAVZSgWNhSD0eS1DQYr1i/Kd423bhvssPv4IKwUv8m/Vg2+qkP?=
 =?us-ascii?Q?uqr/xmuy9sT5ORHGcgV5172ml+pNzav/d0LUecPCQW1qa7+Ikw/Pl1Zy09Ea?=
 =?us-ascii?Q?nZ42mjgwmLqAdYVRgv0nCRnhwWIbTlm7W+E8b0qU3BVAn158AuKfa+UP4jQc?=
 =?us-ascii?Q?MRbtyUASZCNJ+fpJBstzAWTJTRqkOw62FgkH0kSezxp+eSsRqUe5CLO+WoT3?=
 =?us-ascii?Q?VyYe/ZgI/wHGjdDt1xGm6tWnBSq0RUQP2LRwPkXiunFcktBpBa6R+bUlOQ+t?=
 =?us-ascii?Q?zjRabTJ3UnIPPq3+G6lm/71ZIJFZYu3R7wTPtL5R1nBi3j1cueSVXryW9Yg/?=
 =?us-ascii?Q?2JD1Dx80lOr6oRXFRotj9G5pATu/wZxFtRGXimGhX5qQHm6WCETrli8qTtPN?=
 =?us-ascii?Q?an5FMZLlvljM/7IE/evHNKu25ZH8eNJKf2euhYBD6Ar8ClYh2yAFTJFL/HIN?=
 =?us-ascii?Q?jUUpnLLc065ezZlxDeIUVD39PS1pPkfjQ3Vo/DBrnNZWsoOQW4rn7gyW2f38?=
 =?us-ascii?Q?GTgkH1/U0aZTni42f2YbmnO6DiF5+CLJ1KmF7eO4X3mNerMb3teFtY1aeP57?=
 =?us-ascii?Q?g1KJQjAR6RkwXo9FC9dimj5wAS1SZtaxTlIa7YYy66Ohe09lrv7CCdRGNpGn?=
 =?us-ascii?Q?bxGlgLIQADG5YYelEtefpkmmqCEUXvnemFodUlUjpgmPZxXA/pu0EfnF1PFi?=
 =?us-ascii?Q?CZhN/71hcAhugZUHFX3O70Qvk6weQFHHzhAFJEbzVCsJDwu1PZ6dptdYv3nx?=
 =?us-ascii?Q?XskyxDFCMCU9MD/LcmR9fHsUcPsmeQem7cqI477xjxCE5KxXWH74Gs0tNNKB?=
 =?us-ascii?Q?vZGARZq3WUdmRpr7iUYA2JE=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb2e6f7f-6780-4279-b6c0-08dda7d62b0f
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2025 04:20:44.4918
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2Ve9bZPyouJJQ9IwDdj84DcD7YPYlbHryhiONMHv5P2s5ML9fmM/l6F6Q5HNH6L8gr1vbC/1qUm3X1ztu0/Gwnzhm53Bj1jM3XXPQ3PO1vj27wSyR8gj9kOlyTTGw3UN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10510

Current Kconfig menu at [ALSA for SoC audio support] has no rules.
So, some venders are using menu style, some venders are listed each drivers
on top page, etc. It is difficult to find target vender and/or drivers
because it is very random.

Let's standardize ASoC menu

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/sof/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sof/Kconfig b/sound/soc/sof/Kconfig
index 32ffd345e07fc..4879e7268bda7 100644
--- a/sound/soc/sof/Kconfig
+++ b/sound/soc/sof/Kconfig
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 menuconfig SND_SOC_SOF_TOPLEVEL
-	bool "Sound Open Firmware Support"
+	bool "ASoC support for Sound Open Firmware"
 	help
 	  This adds support for Sound Open Firmware (SOF). SOF is free and
 	  generic open source audio DSP firmware for multiple devices.
-- 
2.43.0

