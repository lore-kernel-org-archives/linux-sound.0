Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011059.outbound.protection.outlook.com [52.101.125.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4042625DAFB
	for <linux-sound@vger.kernel.org>; Tue, 10 Jun 2025 04:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749529317; cv=fail; b=fIFz+7544iWU2iYNLbqc26pboIXVc9g1mrXper5LzAC3ocxKj19+NgHeQLj/OxgBvus77ROHnR8t+KaZpU+WSPdxQA/U65TkffRMh3yys60yO4pwR4/NaZeTnrFxK05ussakEvmE3PFydlVDQgwr74JqrrWOQvNHNdB3ijeXy0w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749529317; c=relaxed/simple;
	bh=UyX1RQJW7JYPOo3MZQj70x86FYJ2PXuPuN9yyZKT23E=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=pEJ1eLJJXSaUDrU0LB1O4vWlKE6/KuV2zg+GWJt6nJg9gX2udD1Ph4eLXCVqv5dDwdzT9K3CC2lGH/A9l+z1k5ihXi1aeIlAnwHssabieLcAzqQDhPVzWgC9c37q1qI/hKDP63gCb4YNwSL0g9fFK65LRwW8JXAU1f/GJfy6tqk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=CKs+TAgU; arc=fail smtp.client-ip=52.101.125.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="CKs+TAgU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iojslFZBnGeQrV3hc7sff4TKQXefNMLZurOR0vYlDWz+e32reDMHpJRQyQRNZLW0mqezzGeBIOPUyJOJJuI9XFoIpS+KwPqTRTeLjfYAsSELejx5c/Ub3VWoJRiksfcLNmUMUoo34TckaHQ3ns/C/ykjDe+R6RIWK9DiVzHMHm0lu4lx5koAM4MvdWUKBzuo0F7oLK9ZmRbRmVMHnOGNe0rhEkxs4PAfdLE0Pjpc/e+zph8Rv6Bnsw/6i/vsiFJVzNP2K4eM8CddKFVdUcY7HmIa+Sx3imDqAx1lKFNIkreCHt3iZY4nYN26ZpDZ+CUF1xEaXZxgUh+GSEviao0NsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=La/6QeaDAtaMeEiVNtJytZ848QWz8eXtUbxyGdE80go=;
 b=tsLZS7s+/vYU5O9hpqA6CRkoIoxTdZR+SZy2t6dFcI3u7yyxHkwpGNIheilEVUBxzMZAZxxrLaf+C/Nn/6H3sB3DJT/YbZsC3qIvNN4ybFUkLmgzArGeLFvGAjGBBM3JzI2DFcfLvH+ELUo9gOrhg38VEnCSHzOgtUeR9fu/wS5ZX5VaMimyz1U7jZJ8VC+mPNGtaOkB7j4rYIAJkgDxFPrkRGoVBRwz1xnc0lgh1h54K+D2gsim3fPLr44eJcbgP9d13bEOgmcvjVJd1T2dDvphnM/abfB9veMayd7mt+Fz0wEOoP8SOvOX/3g9g08Wr+ajJxXnj/KW2Nnazbp6Fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=La/6QeaDAtaMeEiVNtJytZ848QWz8eXtUbxyGdE80go=;
 b=CKs+TAgUrjSjMCKiteJ9yKKwnbjDDm/xR/hS64g4sMEbFj9cvwZQpZoD1PL1nwzQlq1aLuCuRzJ7q4YIz5BpWTcwMliMXGhsPBLJEBrzA5xGy8POe3cpLobdkfUku7+MMDmgF0a/wBRpZ3Q4uWPksbv60iq8Ny4BPfnRx0R2IAA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS9PR01MB15231.jpnprd01.prod.outlook.com
 (2603:1096:604:3b7::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.22; Tue, 10 Jun
 2025 04:21:53 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%6]) with mapi id 15.20.8813.024; Tue, 10 Jun 2025
 04:21:53 +0000
Message-ID: <87ldq06xb3.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH 18/37] ASoC: intel: Standardize ASoC menu
In-Reply-To: <8734c8bf3l.wl-kuninori.morimoto.gx@renesas.com>
References: <8734c8bf3l.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 10 Jun 2025 04:21:52 +0000
X-ClientProxiedBy: TYCP286CA0313.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38b::8) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS9PR01MB15231:EE_
X-MS-Office365-Filtering-Correlation-Id: adbbb788-d2bf-4790-dd72-08dda7d65408
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|1800799024|366016|921020|38350700014|41080700001;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hut+iUdrl0IokRRPuc8j/P/rO33FtM42y177qRpWIROF3Ev3B0WYMGco7OHW?=
 =?us-ascii?Q?+CZqra6Pz0xfsGw6xvAwjXnHYl5E0C7ChmbIwoAashmzTZSKfjx+8bKgQqOJ?=
 =?us-ascii?Q?+ySCSPJ4W4wdmKn7vE+etYdiE4Q24+MOg4YZgVWIofC9em6uJJFYqItRyx1L?=
 =?us-ascii?Q?T6tkqXLfd+Ex1aWIUs4PJOofdK35DRBPSOhRfoVBa4uGMsjS7Q11c+BEEleb?=
 =?us-ascii?Q?BqC8uNrqYHSaiH0PKlFNgQTJcBru+jv2x9LvYY7xtBuXi1S3YI5XkmP3v8ZK?=
 =?us-ascii?Q?6hXScP29Z+MSKqLbFuww9VP597ReIP0OQoah/fT3HZ7GpHVNyMv0ZMsLxKuB?=
 =?us-ascii?Q?pv6ggbYIv5mWLO7j6tEgyzM9IXgjZmKfmv2p7oq5/0OEBcb9sycyrD1K2hqx?=
 =?us-ascii?Q?G4F+XKoCKDDPthYAtUQBNILTVaSQm4XElqnRlkqBwA5t/I8o0chdCHGQ4fVp?=
 =?us-ascii?Q?/xfH6FOVZeKYH9lK07IVwoSAWjMRCAdulRPPA7qirQFKZ4LKG3ntk/w5u/ij?=
 =?us-ascii?Q?qmypqCgXLHGX4jFTy9zV09J4Ybx08Vp6gbfddBqb3ypPB1lOmDplUml3kkN/?=
 =?us-ascii?Q?fQkUbvCwQN5DBtja5lK28SjKqpHBYWjvATAfS7ybPvHuqNa5cw9Tha0rFMBL?=
 =?us-ascii?Q?CRWrjc2DGLzNnOlVftYexVIk5SZ3P6sLytF0vpYdvBCkGuMSFkNKiLmR3hdb?=
 =?us-ascii?Q?PW4HyChqmkdzobvZb7HwqzSXXoPI0WxLSUAvlYm2HDbYv2EsWNIGiyYYfh3e?=
 =?us-ascii?Q?QjT0xin6FC2p2cviArWL1ridKBiCiWTs0sA0tBm0f6TOnD4LrJvYK6P2X1Lg?=
 =?us-ascii?Q?1ridEw63CJwp+xtwQEuoZablDFn/vEJVEqJdRPqPViq0iw3C2YWDzS+TEPRC?=
 =?us-ascii?Q?PyTDgpbRp9Jeh5GUsdSItrhJMw2AOcsfuaz1aFZIbsWzY8fWxMY7oUg4ye/t?=
 =?us-ascii?Q?2Jlys37zKY4utmT+F1B/dRj4oaGYpU+etxe6F5xJCtKUs9R+xs8VbXCNjSA7?=
 =?us-ascii?Q?LHpEgBpu3MtTDTsGckNtFhbbigXte3NjLfn+YkqXTKvs3xjO4qMIkJ8ESsov?=
 =?us-ascii?Q?VklMfcyHlJHXZ33/LS2oHEpK+XQsD6JLP2AQtNSU9SCjThnObwiIiDMBN9sK?=
 =?us-ascii?Q?ufifpcqRtUcDuQbABuYTypllE8AaEnob4PS0tY6c8Jl/fUrpLzlKj4hLmw2N?=
 =?us-ascii?Q?EuZ4kbQvpQY8IWl/C9HHgEJ8fC2mUwkpzoe1Obd6J28Tj/EOzzQx+g7Rpedx?=
 =?us-ascii?Q?S1LunZVvLvUn1AtXPh/L8/yKhu8gujJm9oR5ZgdgJp7G2jgE3R/hKtVGb4NM?=
 =?us-ascii?Q?Eq57LVaVMXTepF0O97AjzlPZKHAdkf2gUTeRauptjBW27mCEpbgjHYzHnlpD?=
 =?us-ascii?Q?W/up8Con3V2pToYiWP438zCGLHc4nWHuEf8gi1lEfjVxssGsfFFcbJjFfb22?=
 =?us-ascii?Q?jpSILK5hBPbrS4eYfPtxOxFc7NYc4eSlm47GWc23PG73o+hANtaqGGQ8eZeC?=
 =?us-ascii?Q?dO5U6HSLi/t+hLqhAih2HsPzucnV0Y+B9uMnSmryaDBBaDryNIT2bHi3yg?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(1800799024)(366016)(921020)(38350700014)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PVR6B5Lu+ygcMM5fU54uByj060HCbS+gghfg+tYOv/aU/qZ5j8CmMCIw0Yyi?=
 =?us-ascii?Q?E6OtfOj33dZdJ9/0PtAO4Z/wk/OJv7YUAnb5PmGe39XGrp67eD0Z2/OydmAv?=
 =?us-ascii?Q?ihgJ359Qr70bDDDkjJGIJiTjhVgK2dAqvyIpuOrBKqKXELyhyYleD4a1Mpqe?=
 =?us-ascii?Q?Rs2Y1Y49I6wxRLET9208SUviE/Ejf+4fZu5Y4XpxmrEAsjO+UnwO2R91gvQu?=
 =?us-ascii?Q?1M7WCmRR5JWDG/UbVcAk84iuXbgAzMZiEWkJrI9WWvd0JI6JViIfsRrAf0kW?=
 =?us-ascii?Q?XM2zm3qHOULYC+4QENFg5Pn/4RhHp2UzACPhGhdoowv0VDut4U6xhm1T9qqR?=
 =?us-ascii?Q?HcsVdJS5J6zX54sDUGj/wbjttJd7iQIgHExTiMYeqoEhILxIPE+zEIihFviu?=
 =?us-ascii?Q?6n6xlLqMFcz/qaaqiwISsk8y7GWkK3ndS0nCH7zIdOT+a3Ixw46GA0eR/hgQ?=
 =?us-ascii?Q?aJprHei2DCFlbj0+t3PTY8NQJ6hIyTSt3h9kxfd0R7EssODS4sJ85oc0Mloz?=
 =?us-ascii?Q?2L6Sb412s9+SoGbFX6J8RvdDqHhCDrPgVpeqbNtbl8RikY6DuO7FM87HA7Wd?=
 =?us-ascii?Q?BbucV5tGny66ErugqFYvObhAU2L6JDX3ryInSLGwRWQZdn4TF77xOlTDA0y3?=
 =?us-ascii?Q?HeU7GK9kk8a6PEqBWvh472gCP0KvNHuoo29VGm6p8cx5seTyeOyz2iPtnYxd?=
 =?us-ascii?Q?piz711FzYRs94z/jqyj0oybn//YQ7Oll+p+Q4/eV1JLroX9KprLRnA2neLaS?=
 =?us-ascii?Q?X/fDVKT3sInEqTkmf69DADLgPSBEfvLvrMfhUkVKVG4/+ck8XTjROpFkLHhX?=
 =?us-ascii?Q?mWxDFc/77YUPvyJLUGCApVxH7rediyruBm5hCARwU0GlKbU3KBfuDmwnTOuQ?=
 =?us-ascii?Q?I757FHPSfTJK2zCNMTRSsO/+M//sWQQQiWvtgNp1gQu+5fMpxRpfJczdMD/y?=
 =?us-ascii?Q?AYxeVg3OiNPkS1e568IOMtpe1hfkRjUNdbPsmEiSgaqBTba264FvEqDB8hIE?=
 =?us-ascii?Q?XY8nboTp9F0b7iydDpt1dmuxbY5vAsEA5QGdrn+p30kBP8q87+ZR434A+h1h?=
 =?us-ascii?Q?ZhCC/W1OpnveMeBwrUi5O3CkpJpxaTFkTqGlKg1MwQkruGXrzXkD025dmD2W?=
 =?us-ascii?Q?BZ5N2NN0APhoGr3SamuYi+UoK05BbgAGFULybUt7+XHeHpyzGpEPDW/7b0Xv?=
 =?us-ascii?Q?jMSJAd0yzssekkAYAhSPbux5rUmS9OYt6oNDmOdw8KCpld8Rmmo3PMDf0A7U?=
 =?us-ascii?Q?QkejFnoMkn/oqNdM3VfqStoL4nq0L9Gw3rxq0ZMvdijMdNtTbxZKHLGrg6pd?=
 =?us-ascii?Q?SDu01QT0hm9dDlFqaX2B9MpbE7m0Od+jUuz9ooODWtcRGSP2YZFfVMkGxnhU?=
 =?us-ascii?Q?Wht7fSfDYtS6Ci5qPJawl0gUWRH8+m/Oa8Oi4SkhmpssiCYees3oNuq8txZA?=
 =?us-ascii?Q?huoE7NuqxeQidJ/XAPyAL67wXvhuXnBnQQ93L8ABFNoapm+DybtD2Lh55WZR?=
 =?us-ascii?Q?O1UN79UKP9Rnwx02DImOY5b85MSShzSyreqYi3DRxL7T9sG4aoGFbVbPL/i3?=
 =?us-ascii?Q?Prlegg8iJ3z///vQ4ocLeJrZNX8gEVOpZ+J3QWN0F421nwWCag+SAwubbYrY?=
 =?us-ascii?Q?p2Us9xoQYjbZdgf/mmymRig=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: adbbb788-d2bf-4790-dd72-08dda7d65408
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2025 04:21:53.2534
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K7gbioi+auzixIGiD2s2GnaKrgBL45xxl6ykLbSS/X/jjrtuuBkG4+UcaGSOtrOKV+NhBpLMKPFeDbG16s2Pvxdx3KjgRD8I8xN+7UEoVN6sJmTp5FZ6KqKWJ3x5GjS4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB15231

Current Kconfig menu at [ALSA for SoC audio support] has no rules.
So, some venders are using menu style, some venders are listed each drivers
on top page, etc. It is difficult to find target vender and/or drivers
because it is very random.

Let's standardize ASoC menu

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/intel/Kconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/intel/Kconfig b/sound/soc/intel/Kconfig
index 2db494b0e3cff..b30fff51e7392 100644
--- a/sound/soc/intel/Kconfig
+++ b/sound/soc/intel/Kconfig
@@ -1,4 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
+menu "ASoC support for Intel"
+
 config SND_SOC_INTEL_SST_TOPLEVEL
 	bool "Intel ASoC SST drivers"
 	default y
@@ -115,3 +117,5 @@ source "sound/soc/intel/avs/boards/Kconfig"
 
 # ASoC codec drivers
 source "sound/soc/intel/boards/Kconfig"
+
+endmenu
-- 
2.43.0

