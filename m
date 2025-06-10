Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010057.outbound.protection.outlook.com [52.101.228.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 105BA25DAE3
	for <linux-sound@vger.kernel.org>; Tue, 10 Jun 2025 04:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749529271; cv=fail; b=s3INf8rz+PvdnB/oqXyDWyU7lYdActsovWLM4j2zY6f8F9XI7xKO3b1Jmy2sKHtIYrojjcrbDmbqyjYcBFr0coXGscQcf95GgDbfZDZK7fmEc+3nq6fUN2jOav89zVRJuyVT89U5E2BTSv/WVnY1bxaHsexlo5Lq/tN2jWg4Y3I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749529271; c=relaxed/simple;
	bh=XUhJ/R2skr4wyQprPwixGjP7CYF52YNIzfLitLN1mbQ=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=PtairQOG9DtOpTFgaC05ag4Og3uJ0ENrMajSuyA7IdHNmeEqPlJUASDEkvMW0nbYuiwmyLuSMoQtIIAb/mOo/7RphT8AQLc6R5rK4SLGR0xL19dAWUkrdPVG22glR4sDMKp1prTZpqa1lTjeXdLRDpMeeWA47Wk0llwqYQmBq10=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=PA+7aooe; arc=fail smtp.client-ip=52.101.228.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="PA+7aooe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lisQ4lMbL5AoQGrB7IWCGwP6kOD5V+Diu+MgzDhNP8mYcjSR6NgqftGJso88AAMFT8AHZnQdyHWs/pp4rSA8yDMmq/uucEhlMdcYO6iE7Jf1FCnb9ZSb6rDxG9CzSDgW6rBiTBLXMxAJVdsONauNcrHpt+ZXMFZXk53kxhsnHNfKGa2Za7WtfHVx8TbmADzOtcyJ0mx320nKhQ3xcXfLQ29Vt7dgNuODyBVQW/5A6MAel90mmGbcUz01ixvpX4zJchR1QaiPeXRbUSxLT8kh+OKOSRizXduhlXhHyqgU8OwOwS46yufRJJ9cGfyIl6QUVyjUm95KjqcVE8gDsNk9fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5ZP5fCS45uCgwAltOFrvI/mnQdWY4Mndh9FC8J2Dqd4=;
 b=YzQPkAfMCR8ivqzfMNqlSY+Oa02DS3E2SwkzH9HbnQ/tGeO5OeA+imDpHpGvK9isCOHTWgU2MZMG0DzGrSm1SQHWM035T923WDh7I8hd2H9x6wsZJnKvN/LtI5wYAgwB/ogqYq8upCmQ4+c3EJhBObKyUzpv24G7dSEVyrzwqShSLP0xA7tJmNAr1jVF0kf/3M+vCtVG3igqqwiUXSnbVYIP9mXrUe4at5zpwg1bz7nUvm3gsxsjkFNFEu+xZZbV7aKDZ/w7HMMjT0ORGktbQWsXC5LrIxaLBGjGoNGZoSqjtKzEaDDLLIrs86nIGyAwSYjLvuUeimwiBwWNk6k34w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5ZP5fCS45uCgwAltOFrvI/mnQdWY4Mndh9FC8J2Dqd4=;
 b=PA+7aooegUgIVq6D3IaZsICdWkkAERJQkwEecUCF1vFUEaOrgTBjj7v1Oq5rBrR7Hqrcy/G2BTi2PSvq75HPSdeqU6Y7tH5MtNfvdESvll8E9M+p50Cvi+M1UYldWTmc4pu8iFBEJpi/e/dAH/G5aCdK5e1Uh9WAFTjNgq/Tvy4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS9PR01MB15231.jpnprd01.prod.outlook.com
 (2603:1096:604:3b7::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.22; Tue, 10 Jun
 2025 04:21:07 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%6]) with mapi id 15.20.8813.024; Tue, 10 Jun 2025
 04:21:07 +0000
Message-ID: <87sek86xcd.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH 13/37] ASoC: au1x: Standardize ASoC menu
In-Reply-To: <8734c8bf3l.wl-kuninori.morimoto.gx@renesas.com>
References: <8734c8bf3l.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 10 Jun 2025 04:21:06 +0000
X-ClientProxiedBy: TY4P301CA0004.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:26f::13) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS9PR01MB15231:EE_
X-MS-Office365-Filtering-Correlation-Id: cc13413c-54cd-427c-3282-08dda7d638c7
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|1800799024|366016|921020|38350700014|41080700001;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?OHbJXoggc5FgtamUTYRR63ameYhlf2i8Sb0LJoqCKi12Y4H6WPMw9IUnGgjw?=
 =?us-ascii?Q?TXFJhGNjc6OwV7g+T7IRWh/cUvQgj9+LAhnJ2VQXPHbYWjyUMS4VDz2Xy4xz?=
 =?us-ascii?Q?/nxeZukXzWLQHusi2vTfeobg6CXMxR/GfBBj2p56q2lB4QeFXBFO2I9lTKyR?=
 =?us-ascii?Q?Kgr2g+qZVSFplXV3nqhWRijLmxb0dVMBh/wdPKHCR5kmUmd4dkzdntmzklWu?=
 =?us-ascii?Q?CXAx0FrwHTu/r49aP9oD7yPBMlMcGF6+h+k450XGdD6uc1hoikvc1w84q5Fm?=
 =?us-ascii?Q?4NV7Z4XfBcVQiVLFG2g+H3fPSk1XpEUUHPc/HXHIb6Dg+v8JhXBLxfWyMW4z?=
 =?us-ascii?Q?imEifEzQtdxrq6kpB027aw7D29tD9YpKqDdUDO9zk4OwYn8l5bXGPNkWe1nM?=
 =?us-ascii?Q?nvE8voQ7Pdh2h+CFwtx05k56S+kNsFSYOWBbxLlHNkgBxKOZpisRAXg3MGgm?=
 =?us-ascii?Q?y/F8UjaJ1/7+K5kOUTrqJHLwEdqYCoz+MWQSXBVPPXir1aZdnNPp7OLx6YPT?=
 =?us-ascii?Q?Ft6FtJEPntsFpwL6WYkR+wcOBrLVcKpe+tEppmuHBpPEZYLcTf52sX+L/4nx?=
 =?us-ascii?Q?HGz3S3lQdAI0x1Sn6lxzy0rwEIU3sBy2/wnXWB0PbUTlaVI5SsnPIUSjnyU7?=
 =?us-ascii?Q?rfcsfd43NANZgrrrAAJkKA/uztxnXa9AL7Vh6ympplO4Pje8RN3B0WDhhgW7?=
 =?us-ascii?Q?O26RuLAXwkj5y/k6qf9MoDDJUT7CGMNaVCv2AeNN1MRx6oJKcrs4qHr1imzh?=
 =?us-ascii?Q?63G9KyKjy2pQBaQta0TsiK6fdg3juR8SEILIgPQzOljdUP0DWYZktJYzC2ra?=
 =?us-ascii?Q?S7U2EcW/zQ2rt1b2ksmQJIePRwKrN3SuqcahzLeGF+fVtTzQBBNtRFjOMrdb?=
 =?us-ascii?Q?4WUacwgjYhIYLCsLGbbJbQ2Hf/dfOglvrKDf1ZR49qaBdAF8rCJrqc8r9Bmk?=
 =?us-ascii?Q?A5hQg+qMHbnPRZrx3kKquO8Swdm35XoTMRXlQXA8kwAt1mZ7B5135vUesjJv?=
 =?us-ascii?Q?eu8eZ+mktxTfLM4JIA30L2rS/xDpgnyc8fOOQX/AIC1YPfz3eR6iX7LdguJj?=
 =?us-ascii?Q?U97bWiSyVRbIeRZEPWQF1jswsvu4jk2iPJezYtmYNNP1q+B5/U8fQv1oz90W?=
 =?us-ascii?Q?AEDFFoPXQWOBBYvLjrn74on8a9y5osIxjBzmH+I5h4YMa47hrYxagE3MO2Nf?=
 =?us-ascii?Q?82pDAMCeWjxmIoRpbaM5QSIN4KMK0VNEzPiRDTiofy/dwwdOWdZYslA/sfYo?=
 =?us-ascii?Q?BOemLJXG3a+Zee1H8nRwu6qNVe28aBPSbee6A2Np2BoDYBVr17zRHvCSU7Em?=
 =?us-ascii?Q?Nf6ajP+Lln30z12DDpcKaypTuzGVKVh7CpQ08MqTg3BUsx7cl9nMbM/M1gKb?=
 =?us-ascii?Q?JvUufcvMXPBKuh5Qfqeluaq0fKrEXdYr7mQxR6q6EZ3RdYjEnB1ixHalLHOn?=
 =?us-ascii?Q?8Cbg+mn1kVOqAprrviCAOxQhLgZNfBCevRSf7UY6IYl1yOluVQgdqa8Kenzh?=
 =?us-ascii?Q?VZXTKPChzwcMoM3RjHtiJxAys6/Cmldl0WhNANXndHdPKDqmYutOGgPjIQ?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(1800799024)(366016)(921020)(38350700014)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0s+9NJW4k6XiwacP6isWi5L69odzQIK84Xyey7/LDw+2nlPDckoJ3lLAHcIO?=
 =?us-ascii?Q?4SRHWq7dSDXgFXwjiiMusvcF10HLv1Fm39wEU0NFvtHG9dKVg2I0ezIbWCWr?=
 =?us-ascii?Q?Hs5OpDLcoP/V8iZuZGXSMUY37a/SWz6nTYKPiNiogENrnKxzBqOw+oawHo4+?=
 =?us-ascii?Q?dldN390rogZ39SdKLeaqx/Jp4EdZU46PvJcH/38OzpeRUtpKeQG1ugba5quE?=
 =?us-ascii?Q?bV1j6W88RputFToptW+PJrq40F90lp9RcyXaFp/XgUv+PRDv2+xaO9g1xPQY?=
 =?us-ascii?Q?vfvILGPmqFqJHR2RZdgh3WpPr1MiE7mU6mRrl98w3GKEdMHVV0VquPb6itUB?=
 =?us-ascii?Q?2EWcly8ZQxALs2aYaL6wFXwttWzHmYzkkq37Hcd1f3ZMXhi4OrMiKzfEKCfQ?=
 =?us-ascii?Q?VMWHU9Ap9jlNXjzyZKaI2GNHxHJ9Q4EHNS1xDe69f8wk1CVXgwixBWrDVfUs?=
 =?us-ascii?Q?W4QaHQA8mXItFCQVRBkLuturihhhry83OaoRKNrF33yYVDVTPzpWTJ/s9McR?=
 =?us-ascii?Q?jApn01WN27FiQn0HwsYjEv5IK0dl9hWBQFZ1PRIwYLMuzYblcYHRGYUWKTgU?=
 =?us-ascii?Q?odjyy/b5FdsdqVeDqnDdXo6pzYa3hvAm6J1yDo7cy/35aRny9qYmehOjWOtQ?=
 =?us-ascii?Q?vz4bIU93OwBjVA2d03nQdoLlWOjghYAW+CL19CmKatPgpOQAbIHp/dwoyhjC?=
 =?us-ascii?Q?ELVjhU8ZbztmLR97eU9W8gEVONh/v4qOkwujQg8Iv3AgDlmEzOKAOTQ4hMM1?=
 =?us-ascii?Q?b0b9/CD0du37HHPOkop1G450K+vlKD5fves1g/aBDniecbs4ZuMnOKvsjT10?=
 =?us-ascii?Q?ztclfRisijAqmosL6aypxfZVROwfqmD0d6On1loFuYyzkeSms+1KrobusZ9I?=
 =?us-ascii?Q?Q95Hwz52N0U+VfWQOLRkOkL9On2u9njrq+s17z9mwHFJ93ZC2V9qqb5I5BXB?=
 =?us-ascii?Q?mNGUH+943Ee9mDHRNH1wIU1ksjYi2jCMz7tNE+OAGNWEEm89AmnkQQ5dp/Zn?=
 =?us-ascii?Q?JJVhJ7saxcFTccmgSbNIEWQ/gL/L5Vk9r2nkhVn3wdgM9sRPF7HpwQpSX6lb?=
 =?us-ascii?Q?KBtRanu9dUHoiRH1KFqdg1GoNfwY4cACBptUfkK2VHXYPMnHKup34PHPl2qB?=
 =?us-ascii?Q?hoWuHsGeZd5eluZ9zkmC3/j6ZI+AJJEfbXeuIJq5mNBIqxS1IqOGXws15Obu?=
 =?us-ascii?Q?KzcTXlx/4gxMPH6WOjy3cNKeTmT2sQKHZkAIAvgQKVbOzv1Vw2P5hky3TNqx?=
 =?us-ascii?Q?I98YiVS8293dv3TyC8DlFp4FGnPxW+Tz47iygTzdDn1NJs8fGIBB35ybdMS+?=
 =?us-ascii?Q?LNqf8oII/xKN53RnNWnhiMULaAcD/TZyCJ/EHf4giJh8LCMzahMMZ0kEB8wd?=
 =?us-ascii?Q?eNcuwMMM0d6FzJuzszNq0gARl1bWUfTY3JZKx9gs+dnwfJGLs88aSxsDdMeJ?=
 =?us-ascii?Q?IcDavG9EOMzSLAJF/87ICBrktCU/mnUh5puF/iqhIuQv8vmK683tEEQSeTMQ?=
 =?us-ascii?Q?LkAUPtwN8uOnVhPmUqPJArONHpk7Vnui7PlnRQG7l6gmtGECUALxhL4iZjwQ?=
 =?us-ascii?Q?Um6XUMKhkhrpPz0UJM2Zryq8aiR/fCLW7zzpw02EDtqoauqWpOTLGa+ca3um?=
 =?us-ascii?Q?MfqaFWuTTJWwaRwsIQZ9aJ8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc13413c-54cd-427c-3282-08dda7d638c7
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2025 04:21:07.4996
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fvAYtJs6FPd/h3oPIFSMikBt09NA57/MMlt5sMKl4AkUUvkVf0UfAxtzbcMYynkqBZrIW8mfez01omRpsG9/SDizB5WmFkP18/S8j50UPorWI13jI9IF1KtgSPEEMFTe
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB15231

use "ASoC support for xxxx" menu

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/au1x/Kconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/au1x/Kconfig b/sound/soc/au1x/Kconfig
index 8a78809e87543..01627fdf392ce 100644
--- a/sound/soc/au1x/Kconfig
+++ b/sound/soc/au1x/Kconfig
@@ -2,6 +2,8 @@
 ##
 ## Au1200/Au1550/Au1300 PSC + DBDMA
 ##
+menu "ASoC support for Au1x"
+
 config SND_SOC_AU1XPSC
 	tristate "SoC Audio for Au12xx/Au13xx/Au1550"
 	depends on MIPS_ALCHEMY
@@ -63,3 +65,5 @@ config SND_SOC_DB1200
 	  Select this option to enable audio (AC97 and I2S) on the
 	  Alchemy/AMD/RMI/NetLogic Db1200, Db1550 and Db1300 evaluation boards.
 	  If you need Db1300 touchscreen support, you definitely want to say Y.
+
+endmenu
-- 
2.43.0

