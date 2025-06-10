Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011062.outbound.protection.outlook.com [40.107.74.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A77AD25DB15
	for <linux-sound@vger.kernel.org>; Tue, 10 Jun 2025 04:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749529389; cv=fail; b=LkUGQevO9uPpE34YwYCjO4bDQ4DLsYrzOUyaGnOXELpY49SrfvVQ5+9dB72aBbGFWdNefWct6vYKaB6ZUvJzVL6ioeKS9KUV7va9vf6sp6w+WLkoxr3wzUUsWxHdzbtM0ZIv38mbawT1r+6k2F5XHF4PZIYzvirCL5W8reGDNYk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749529389; c=relaxed/simple;
	bh=SgjhpPmNPkTH154so96xwm1/qkMVAq9kcoaYZ01vzII=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=KK+X+WV1Nf5SNpH5d8tZra3VZBC4AjfNStcQE6ZGqW6WszZUoxUgIhJsjRBjn+tSf7PfaeQSovkd/fxAQFBx3Ic7PHGLS+SDAJkpJez2675WQcxNBWpGT2KgDwwYr14lHgoHi1jstzflgSvcmZc9kub05M9gO0rgyKe/FTp5Gdc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=kgjeEaoP; arc=fail smtp.client-ip=40.107.74.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="kgjeEaoP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hxnIsAY5cR2tlsli7yWyJCDkz8gSp6wffCZMysXZXKoXlxYJeSzNCprb2GjiXcI5Ot8DwZgVvth5En4hTKtls9ftl9HwPw6x4ez/m6u+Wn+oaj5NE2ou1FVsKO9KDAZQFiiNZkfvSu316VVzhGXvl/PdRQWstjfYXtpqYnUoorp1bkeOmmM+/0GlC1PTVb48c1LixZISfg0FOjtYZBnOiDJklG+ciSsrijdrL8ahZWlWhOppJ5uYE7vd03UAg/EOeSqYwDW4ycPcBhVP3L5TnRpMI+E2fgXFysAwUZ6ZD/g+31ENlMVOHpZkqoUrfCBaD/OQm8VjsZ4fCIRcs0KIdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b0v9re6G0T5AX1f5MGu9r7aWA+B5gZuKEiOWpQgExj4=;
 b=r7ukYbgPinXm7ERcwCMcz4GZYaZdStKJgJMajh66TuF4/8LiUeFX4aZzDEr3lTDiWGNZTgnNpqgAk1ND32MDwplPCnC3jI6DWRJxmkhno3t9i7mRTQofuvEFGQfkggu5UBhHy2faQf4eAxYsjeCXXLD6SJtyvJHvaVtdGCKQyUO4Jh/5Y/5wy/WtyeZBvVYynkdNB9bzC02Dnht20M6gPHmdJf+VFZ2lbSekg36dTWi9SIGXgVFm2z5MLpNTAdHb+v/Z3IKCdXVHsq7Zwo3WiY6J6SJCgTok+iVFDGXRwwD/YnrmjXWMpiCWgW4uMzlQ5K4U5r8fR4jNLnvj9aV6pA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b0v9re6G0T5AX1f5MGu9r7aWA+B5gZuKEiOWpQgExj4=;
 b=kgjeEaoPoEFr1OvcTOq3M9oT7aVnZ3PJAV/S1U/ALGe4KMaKs8Y/vo/BRs7eTqJiaKXZrWYQEeqwgwf6/+Rm8IeBXjnJuFSUZhA6ZrOSXmRf8EfVD6p4nsP82qRQEajlLiuK60B4Roa0SOcwt2IfdFQS8d9r26oz8dVDKhTSnFs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS9PR01MB12373.jpnprd01.prod.outlook.com
 (2603:1096:604:2e8::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.31; Tue, 10 Jun
 2025 04:23:05 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%6]) with mapi id 15.20.8813.024; Tue, 10 Jun 2025
 04:23:05 +0000
Message-ID: <874iwo6x93.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH 30/37] ASoC: kirkwood: Standardize ASoC menu
In-Reply-To: <8734c8bf3l.wl-kuninori.morimoto.gx@renesas.com>
References: <8734c8bf3l.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 10 Jun 2025 04:23:05 +0000
X-ClientProxiedBy: TYCPR01CA0177.jpnprd01.prod.outlook.com
 (2603:1096:400:2b2::16) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS9PR01MB12373:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c0ab9c5-9268-4921-e8d4-08dda7d67f20
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|52116014|1800799024|38350700014|921020|41080700001;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+dmxmanAJxjk9tDK7wDYvuQhDzrUhnl5LSXajCz2/b16ezV5dCZ4BnI9Pn5S?=
 =?us-ascii?Q?ZVcLtnj7wGMcLnjKcw7ifVaYdM09qu6bm9XCwaK+zAvR2UNgV7aOUAYUO9Fg?=
 =?us-ascii?Q?r9Myge5+hr7/5jWD2o2TMcgIehWu8SURsFbBCLtXverE5xCrRN5qlx3mYVpn?=
 =?us-ascii?Q?EU4t5bcrcdBK3oqWC60qfEigUzvNqJAP30jZ9hGGnJmqljEgk92G1R0F4OyY?=
 =?us-ascii?Q?oEPg0U3NCWtvBS3GXYBB9YaymiNf4MJSr6zOKcbmI0ZhFHzGMrwikSZnrKwo?=
 =?us-ascii?Q?pk27w8M40hyItzsK/31tKiuqcZIEfgTY6GHdFqCREWJgPFa4TSoWJN3RASN5?=
 =?us-ascii?Q?RMBJWzGN7xccTAoRpBddYXyfS+u6S8RezzLRbT4uqLfNLQRIcpG20HDck9eJ?=
 =?us-ascii?Q?6UbGAk3W+6mdeRfMIBcl4hCokLRnQmmrI0B6Lf1l5rvP0JPpkw2mpgEF5iN7?=
 =?us-ascii?Q?RBj2oJQ1wySazKbHmfL5cdwsCqtsmf5MPbbx11pcsxd066iS646Bpu7aXsgJ?=
 =?us-ascii?Q?gXjt7aEfdo7rQFoBB0e26LopxIQRXqD7vuNbTUVLOT1pSCkmbav/Et+xoYSY?=
 =?us-ascii?Q?DTJ9JQDpVUCM7TqSwUbThM7kW785fkW1llP6cM4/yZfXoQHzNmRqloTHVpMF?=
 =?us-ascii?Q?ZQJMld1kKRdQUAHl2yQ6SB+qPI+LP1yvmDX6RQQ4JXqeDNCo9uI15p8jit9V?=
 =?us-ascii?Q?psjm58wr57oKQr7epve22No0wey7SYY+ckk22ZyMhZ5QuY5S6B87TUvRG73b?=
 =?us-ascii?Q?0Z3ZEsLwFNLBJ9Hgh6NkQUd3td7AOHsCn4ZBUZsC4+5y/6tP25NJXmtd/Qsm?=
 =?us-ascii?Q?njOUEmeqIuKP2J0xATu5aYJKXmxQxxzTmuGjZ0QeT4Qnpgn3VMDaCYrIY0Qy?=
 =?us-ascii?Q?jTi+PCbK40iPE0Iilcud0E4dsgTlp5a/nb7jzhjoBUE+XdEA7jT0ZoVRKe94?=
 =?us-ascii?Q?PhDu6hiKU8YlDg2i5ZKwI0FseJXcXjo+xLRv2LF+nR2nKwcVizr0wkadCEAc?=
 =?us-ascii?Q?f+3nyHTWfC9ykZr2Ee8812synbMMqmoPjg0cfDZpgZtXQvGkccpd3PyEkXyf?=
 =?us-ascii?Q?HN5YpFGiLHn/lzBHH8yfpY1yVkYWUwDrHdm9Ktd/8geOYBmEJyQ7m5WoTu7s?=
 =?us-ascii?Q?XcxNjr6pIpVis6+F37D04WcnA99BqiZwz4pbxIyQAZUx6XgXJynA1JDyLzmg?=
 =?us-ascii?Q?MJF+ur/r/Gv1xh85Gl4rvdOYwBn0Saxt+oQYRdE0YQjytSuVt4yq0ezbCJcK?=
 =?us-ascii?Q?uFAB9UN79/iIlhrFlBuBoQHaJ3SlVPKvB1kpMq0s5LS0vHbCODuoch5uHqJV?=
 =?us-ascii?Q?VizRxO6N3kyZGPi+sJIUcs0si/n7Wc6W+x7EbGqUyB/uigWF3/TYzn7ktWYk?=
 =?us-ascii?Q?0TFPt4k5dJDA9cMts4YMEzU3wwlNZxI9Ic2Jtua1uEiQgFEHJa37IKVhM5UU?=
 =?us-ascii?Q?TOdXxoiIwBFJIlbOUfDXAl3faCARv6Kd69cQD3ODrt3jtnjkEx+bT5p0v0TC?=
 =?us-ascii?Q?5AHh9D8sFwxonYRxFvVRAaLu/5p1P76fJrFKbkY8RwuDbaapYEf0nTdtmw?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(52116014)(1800799024)(38350700014)(921020)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?x75fImUlP/1mzj5akZv6DUvxZLC/N6tAu+UI0l9jJispgcvdJpZrxgg7BNDp?=
 =?us-ascii?Q?L7QyTzFA/95/PjiluYQds0gyG6klROLbGl0Fi+z3dcaNK5ojol75d4WkSyhb?=
 =?us-ascii?Q?gcExRc8BJANKIjuldcowpY87ECKhARiat/ghHYHqPZdrJoD+3dwaYH6r6xNY?=
 =?us-ascii?Q?Z/CmVqOwWzFl2dTxXufi4mxMEqTlxO1t3jqKCFEaErRCsRf6Km/zL4QUc5ro?=
 =?us-ascii?Q?jPx1IcRl+HL8t3RqnzDRKVIxe+qifzfLVaXFdVCX/u/mNd0hOgdeoRzmYEXN?=
 =?us-ascii?Q?Jeu0mYa3BoH1zU1D/4VG8O9gPGX2qE469elQ/UPNfsy0V9Dcc5nB/T13oTJv?=
 =?us-ascii?Q?6npCLRY7iZmofhWTykfMh6oPY0G3t8t2jM5W2kEhuacGqqEVjqoIFuxpF8gs?=
 =?us-ascii?Q?Urb9quqKyajBur2Z8Ygif0XkHJ3fO1bPV401v52vpe+naPz/E9z5yGhe8xET?=
 =?us-ascii?Q?vvIpnPZQN/88e1bGlHArTqSsol/HOVKn/yJjJFyPiC4y+5ygAZzwmcL9dbZ2?=
 =?us-ascii?Q?nEdwtyPEH4BPv/ksfVz3WCKFciCb7SmsSAL2xv4gwYgX9cyNtcyIvpCBLySM?=
 =?us-ascii?Q?BPlWAPjSVCHauemtnGg2KlJuUHzi3YRYgqwPHl1WlN5SYsJxHEuYiKlwoAUq?=
 =?us-ascii?Q?2ADT2Iq/7rVKnVc6ssSDz3DRoxAkmXeSmmzwJtm7ACvS4a8TRxWt+kUCqoqd?=
 =?us-ascii?Q?/MlIBR0xu/8H9E7MJyDKgLQ8j4TT1Khlh86zRd2nI7bDk7N36JgILZzmB113?=
 =?us-ascii?Q?JYzHrDk9Ajq4w06zVKpLyIn6q3FK6FVqBXXxova/wOszkwcLUK9Nhwd7LSLS?=
 =?us-ascii?Q?783qnqDkCkH0vQobTPxVAaeN5ah5cSa9163DdfwdjJbmFbCdQDigiLx6D+pl?=
 =?us-ascii?Q?xJjU++bFnSqsVw1OpZ77XTOtMipLHJ5OOod77c6EXwjFLjVTwUM30mpvbKzI?=
 =?us-ascii?Q?BgowAy5ZnU7zrDR6n5j2Fd7Jlcz5hs3I8qX/hi3+r/ZyBr/hRRsqWc+Lb8MQ?=
 =?us-ascii?Q?ptbg+3HPXqNDr42z3kCvi1p72hOLjTkIqCHDEFGLgCWgWVHmAj7r8/nEKYUr?=
 =?us-ascii?Q?kVK+Drkk+YDiz28UofJ0rfXBKtv2QlqusdoUg+65kdXgstTI71pffG79ZVXQ?=
 =?us-ascii?Q?0WE/OKRmL7v7D9TNEdAZnDigsqmxGuCOj/o8bO3g/N8FNYwd3ByzC5DEQmBW?=
 =?us-ascii?Q?SVAdqkUaD7UA510aF6+d0JhGDpYQe8z/NYsxQ30BY9yxd4jvrIhYx++JXQG7?=
 =?us-ascii?Q?gznvLyapfkL+5YwcLVoa9SKTfFdMs+E/kJA8tJ3xMPUwXlIE86pKHBAzhkfV?=
 =?us-ascii?Q?7hKsivn7/ydgh3vIAMRqID0JJDd/3nEW4wlBfKNhHPLhmjGmjKR4Kx+nTMCS?=
 =?us-ascii?Q?RxMWgFFW8jnIfRt/xNOoqXxLHD2w/gtNP18NeoiHk/gkv14jZJ7ARjQioiQx?=
 =?us-ascii?Q?vjQVAiahlZzPaLQHJFdkICRGarL25Hx/UIlrvBkQV5Xto7AY2jOP37Ox1cuV?=
 =?us-ascii?Q?DyACvpkGAxu3xuoem347DqhICpog6WNqOb8O32QKmk1+slR4v9EFOX/dWQBD?=
 =?us-ascii?Q?MA4F2gruIeSqESlBXI6Uk8FmQZdD6sO1KaB9PmfwG1EeAbTGpJW5UZazkcPh?=
 =?us-ascii?Q?sZGdqF+V5a2bN2VF7k/Q4yY=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c0ab9c5-9268-4921-e8d4-08dda7d67f20
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2025 04:23:05.5689
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jybFkDP2aImLUUWBclCkF53SpRmmlS0D1V4wV/5ZWvDQpA05D7ib4zxX9fJXsCxyxt5S0olZ2kJQop+cCmvNMlXr/0lh29fzy8mRTAA9KxUiQPqCuTKdQn3Gq4DdrCNn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB12373

Current Kconfig menu at [ALSA for SoC audio support] has no rules.
So, some venders are using menu style, some venders are listed each drivers
on top page, etc. It is difficult to find target vender and/or drivers
because it is very random.

Let's standardize ASoC menu

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/kirkwood/Kconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/kirkwood/Kconfig b/sound/soc/kirkwood/Kconfig
index 5d8a86b26fa2f..f2ec6ba020bff 100644
--- a/sound/soc/kirkwood/Kconfig
+++ b/sound/soc/kirkwood/Kconfig
@@ -1,4 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
+menu "ASoC support for Kirkwood"
+
 config SND_KIRKWOOD_SOC
 	tristate "SoC Audio for the Marvell Kirkwood and Dove chips"
 	depends on ARCH_DOVE || ARCH_MVEBU || COMPILE_TEST
@@ -16,3 +18,4 @@ config SND_KIRKWOOD_SOC_ARMADA370_DB
 	  Say Y if you want to add support for SoC audio on
 	  the Armada 370 Development Board.
 
+endmenu
-- 
2.43.0

