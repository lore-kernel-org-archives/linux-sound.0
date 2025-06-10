Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011013.outbound.protection.outlook.com [40.107.74.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3305225D8E0
	for <linux-sound@vger.kernel.org>; Tue, 10 Jun 2025 04:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749529260; cv=fail; b=UEtWqHy0+2Z2o0tQ4mnXVNdQ31uIb/LZKIJEswjHHg/dJtPXNCmsKyi+Ros7vSORVVphvHIanYiyl0RWWrcIMt6/acYyr+WePdCj9NgCGDSbHu77+udgDi591URl9Ny9qrZBu1HAdUYJP/KkR95Tub3yO+A9zaFr1DYa1j4NU14=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749529260; c=relaxed/simple;
	bh=8efY7ALNJezGHEExbkputXJjc1SH7usfDxFfVWF55Js=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Losv/VKh2ihsd8zkfLmw3nDTrkO6KUGiy9qDCJnTdRVdj2NLqcnPOa4Iw1NT9BCn14aRCenHUezOeB1EIM7RrJ6ImZTM/zHB/w47dFsOGxLcKQbpM24YbZ3rn0V96BvduKBXGtjANSnrWGzyxvV05IyGdzaau8ROReJ5u2X7EUg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=hDJpr6cN; arc=fail smtp.client-ip=40.107.74.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="hDJpr6cN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AlbxgepyVSwTOKVMfG/+DZbKIJUOx/BYcEDmeWj0JqhecIWxAqNv9mWFtJ63COFFwtRTSxCVOI7eSAs86oMmuB1A1Kz6OAXiJ7ZSOeC+j3avM4R65dmhgI2zr6HbD05xjgLgZAgQu3UKydIxe1jbo5HmToD1x8qVE7EOHWm0RKA4P9XM5FiQjy+MlaFapmep6uZHNm6SMIYl99aOdqS41BDqB2ngRMzo5TYnBvLbn8K1bFNrRl0tRMuBKE6LnAc304BVaJXVTors+H/lUsHRfnEtF9D5Do7rwhjis9EnTzMXlI2wtRMVePmtmqQ0F6iro5FwMXY14KSdfgdAB8eMiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jSmFttcbIfgAtKqgkl5k5ZEchpcC66kXZbMM48ffgbE=;
 b=ZVw2/PZzyNuqBEYkuMaNrq/a0jNZZ/AoSZKe+hX5AcBhoga+cA0A3KblBFhofAhkWqn8lgRaYUrVhAFh7YhvLbtt3SkT3DiXhQ7J3YmmC3QXs/PWeyTivmo+FloFpEb4jY7iiYhrOkbnjGkE3NWlG63cKF+7lSEb199x9jBOLU4/zcXrjw2LU0pf9bkdFwul2aup5R9o2EG+iZiBqKqSlF/oGyKCKbqYxM8Q46mQg47lJ9DaMPsiKk8yPDCaT8yhikhURl5PW7rGWVb6wOc7tUQ3Qs9IVqMjZMrOOhAFj9v3Fk7/HPO1AeLB+OMLGiSBuE1vmkslvSdRWFczdva5sA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jSmFttcbIfgAtKqgkl5k5ZEchpcC66kXZbMM48ffgbE=;
 b=hDJpr6cNCkxc7BK3K30sM8sJXuK+bXdmZTTRO1gloC9xD0zOK3bNwzXf92patwdLfDJqzar0l+4xht/TipzDsuIhcGrNq5kthN2aI/1H35kchF7zgLFi07euomfLkWvlCiBkc4GJBE9QfUxkh/Lrm67UasShQMNWfrNJLjriBf4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS9PR01MB15231.jpnprd01.prod.outlook.com
 (2603:1096:604:3b7::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.22; Tue, 10 Jun
 2025 04:20:50 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%6]) with mapi id 15.20.8813.024; Tue, 10 Jun 2025
 04:20:50 +0000
Message-ID: <87v7p46xcu.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH 11/37] ASoC: sti: Standardize ASoC menu
In-Reply-To: <8734c8bf3l.wl-kuninori.morimoto.gx@renesas.com>
References: <8734c8bf3l.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 10 Jun 2025 04:20:49 +0000
X-ClientProxiedBy: TYCP286CA0024.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:263::14) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS9PR01MB15231:EE_
X-MS-Office365-Filtering-Correlation-Id: 68a5f54a-1535-434a-f582-08dda7d62e53
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|1800799024|366016|921020|38350700014|41080700001;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2ZVcAd5mmpZn/7K/21VEr+eGxvrfkjaqCU3pPunrdYiaZEYm+9GDxlYaGrj7?=
 =?us-ascii?Q?nRQ6snHHCXk621Ej05BbO4DU7qhSoXYkY4nUdbHKIpsK0/LtGXK9OXCvHiLs?=
 =?us-ascii?Q?PzCnrhezkOXYzSsf6L5zRStjC9lKpxgP9gLiozLJTq7jNOo1r6I8qM7wgHip?=
 =?us-ascii?Q?f4zXEG8uJBX0xC49Dcbddfk+sak/fu+rfM6P1+HKqMRscrsDwVbeptcgtkqK?=
 =?us-ascii?Q?ZDxI67Npl/Zus7SBuNh/R51/WotNNj5++61ZefBstFOiXM/2dA9jxPubKFl4?=
 =?us-ascii?Q?cBGrQvtPOcvO/RwQdL811guYJJqIiVK2eDWJUsUR4Oed6yf/0WQ0kpI6i00d?=
 =?us-ascii?Q?idMVx1GgO7zqXS8aApdUA8uCeTXTNMmL2xNGJ3EceXwcQd6qJsFNdmJ19xY7?=
 =?us-ascii?Q?EG15RaiCC2mh5TGDkqfilhdMPSW+c/yHWEgII3rm+Q7ieEl0NJ/xA9GsWWvA?=
 =?us-ascii?Q?hcMD/fsNxB+celsAbRL78jj1cBgIIXAU9YPsEKlQds81K9VJzwypxsHKrizx?=
 =?us-ascii?Q?Vg46d3kfNlHpsrssjgEFvoMxeG85rjAeIYh8DiN1J0STuzPQ/mDAUPFKXEkU?=
 =?us-ascii?Q?I7QrBC0my8/VrM278GcsJYK/jHzeJQc69eMwKRd9+hIDVzSt3m4iNqKfTSZJ?=
 =?us-ascii?Q?aM34AhlZcORzANDgqx6u0lPPhznnGJ206w1n9B7oGSx9bCzvHrS36xGvI8Ju?=
 =?us-ascii?Q?5okeeVQxhrS18duThUT4/+oCntC+DdHGLn97mQltI5ZiWcdgok8A+aTdOddz?=
 =?us-ascii?Q?m9JQsUzNk4WEZpEW8VtNP7NYOih2d5bF8aTse+34xcXegubFFe1E40g9Bfdu?=
 =?us-ascii?Q?LOtnke6Ua4OvYTce+hjahWNie0HgzyesbrK/L9e6GeyLuwC2FnWQVSjaA5zq?=
 =?us-ascii?Q?Am0KNXiA1qZX3dbhHTZx+LXtGSnKQzeNXJDsuXYRcMQqn/LfT+YheKlDMGuu?=
 =?us-ascii?Q?FpWo3rSkDSIuFxyn/anocNP/r8hBx72nMVgP6Qk8Wgs5G3TXxAQdyFqFfD9s?=
 =?us-ascii?Q?PI35ZyKNBNFZ9qNnanmonJClmt8QgwTN5nPUYJqYQQv9+cG1Hr3UkmjckZHd?=
 =?us-ascii?Q?JcRphM0OdDI8zyL8itBpe7HntjNHNvb1cDi7gzUpZofKeA8ercka2rGhz/bq?=
 =?us-ascii?Q?nGjsd0GcfHUI4vAdwS9+dtCE4HOp/Nz8U3GaRgYdvzcTRfqciy45kzfWtFZU?=
 =?us-ascii?Q?RdSp8oJ/occ+AkU7yO8x5ZfpN7Q0A0XT63LQ6E8iX/0XafAUEiquB81zMmiZ?=
 =?us-ascii?Q?EDlg3yrM8GmZrXvJZ3cMPrNSbYfl/7YT+dRXByFoL+u8ZXhyeaRb/0hSzNsT?=
 =?us-ascii?Q?RLPsvgBDHlUDFvY4UqjFu5SxqabgIRLV5Tr3+c14DvpKb/M8OOmABMFzU0fE?=
 =?us-ascii?Q?/xQp37a7og2KbVxncxCL7AS/sL8PDNf7evVDaOxbhE0nELUEZPT3LD9e4kJy?=
 =?us-ascii?Q?mZTq3A2YiuQc2dc4pw1zT7Wisce+DyNVh4aDOtjkNfa51j4nESsrIgmSV8sR?=
 =?us-ascii?Q?enDZnLekTG39oWTn/9K9dMdsD9AdA6BhagoEtekzxnvESI9+K3Ee7k9pyQ?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(1800799024)(366016)(921020)(38350700014)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?swGjvI+lGqxCjC6/tXMc1eMQr03V0G+1ZJraxdivm1k0rM4d3dUUoJAWfWaf?=
 =?us-ascii?Q?5/+TAulVq8zfTVdRCmMlFYde5Yf/mZm7vgDQkN+PahtCgq6OXTaZFsttMnFN?=
 =?us-ascii?Q?JcMaiWJkf0GWUu/Q7eeuP7yMOBXjFIyLWIZru5UmIdHKARsxXae9Ww15VhWf?=
 =?us-ascii?Q?ibrYcW4j3+/TJWS0RPQRsV2VZtBa04T2NURshsT7D7JOmqZmwrZB1JBdcyTI?=
 =?us-ascii?Q?89c+VNC3CKgwelblrQW8a6e4ZycMThA9X9GtyZ0CQOuAA5jqT+UPQd585yHA?=
 =?us-ascii?Q?i2AegOl/suBPyqsWTflbI2pXCGaJT/ZwE993U+8gtnXz6fPrQ3PdbOP5MBLV?=
 =?us-ascii?Q?8w6x1JQOMVS6VO5AZW5iGtU4Sc/48oTCXF1Mf2kDRG/JU51IjH2e+YwSEdnx?=
 =?us-ascii?Q?9LEs2E+6A9sdJsAD00g6SWhfEAhVcNFqJ0GG9eoxEgTitw1KxF3LYldLXWj6?=
 =?us-ascii?Q?hOi6Bru3VWKmj5TVxXQAyZydmNFqnIwdv6yea6nxS7OqMzxFc1UcwmK9Tfl2?=
 =?us-ascii?Q?JQDbusCq8SNFBDR7xFrVTuoD1ngWlk+TmUJY9UJda6Yom+wk2G5kSaSr1826?=
 =?us-ascii?Q?GRBH/DkDItRvVRZH1c/XK7alNCJch/wEH1fHFqwa374vTfrZ/oYVBKLIy3r0?=
 =?us-ascii?Q?BPUikTFsYKYxBAHx49OB15dg9onzUKeA+ps/efxLLba8+BRZ0dx88hkRU76B?=
 =?us-ascii?Q?sKgJs1WpldjI61FWKGd803r7uLS4TztEKuR6QPTCC0z8FQwc2TrwmsyEBjWL?=
 =?us-ascii?Q?rxW6PtaeitiKAmEbCdgQtafHTbJd7gTrewWnO28AWvbgLAUd3QekALMu4NEh?=
 =?us-ascii?Q?I54jmFtVvHcmzGs2VdWSPVISDI14xCgMfUpdVw8MSvVYEv0ZLRbpJOTbywz/?=
 =?us-ascii?Q?kuUa+v9+lL332cKve90T4tPWB9Js9TcZHJKIUXV0WXsIu3zZKp642i8tM6vb?=
 =?us-ascii?Q?lRjBWnZXZwFHDzz9v8Ym5oef7Q6FKFNTTs42V7jMHXVbyHupM+b+ccslZIzd?=
 =?us-ascii?Q?bGTbQqN4M0jMCcHb+PRmoO8VWJ00McMDq9MRntIDr/qPcbjWttXpPDbzTwyY?=
 =?us-ascii?Q?BdAbf2XhbDM+XAApOVSWFUNrO5vLvkhSQ768OHB2ZBdn/Wsl2VonU0Wqlz3Y?=
 =?us-ascii?Q?mZh1Gj/9v35WHJZf0tCeeGYluKZ5V5VhmrOaHmaCrTG14Akvgg82Ifnfks32?=
 =?us-ascii?Q?kbTErMvQ5WFTnjfs2puGZ7gm+deA4DxAqNl7kJiCNn1ulFjyWoeEPuBDyA60?=
 =?us-ascii?Q?coLrkApduqDUtYzrAhsFwk0B008eTny1DNC9tdA3z7/wGEF/Rf3Vnf4zG43a?=
 =?us-ascii?Q?90kGehK+JMfCCkX4zs7GT2TfppZtjF+7CHhLHgbvVklaz+/ixWn3LO4L8hiC?=
 =?us-ascii?Q?lHyZ4Q0cDXK3rwBUcgHpq/CtJlhLn7HHq2SXSBqKl2MVbr5EfZqaanRbSgTC?=
 =?us-ascii?Q?Kzyy4Q8+/+nlsGm2+oJbvQ90xOr9PF6PUhT6bf+vBhFNZkdypti54q8lYZgD?=
 =?us-ascii?Q?VGkEUq7LlPFbC9couzq1rDjwHQzqp2+aQn3ocw5wxKFzG71GXk15YSlCRiBe?=
 =?us-ascii?Q?ZZ9gCpqVlUnUpOu3nTwKZx+KzpId5KPrNA6sJdqRbs/YnM1rUqAXNYG6a/ZQ?=
 =?us-ascii?Q?zdkaRxPQbJ2fcuGkN1U02FI=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68a5f54a-1535-434a-f582-08dda7d62e53
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2025 04:20:49.9932
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hNPGEuz1EbmMHxmc0xlKp8P+KJr6oFhLAfe1txOCzm0MAmWlVYRWT7aJA+X/HnDLuxc/clxBA2VEXkslcC0JBPMJhB4Sp8+wE5jl/m0GuLv1W6n2e0cJlz+j0UktJKGI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB15231

Current Kconfig menu at [ALSA for SoC audio support] has no rules.
So, some venders are using menu style, some venders are listed each drivers
on top page, etc. It is difficult to find target vender and/or drivers
because it is very random.

Let's standardize ASoC menu

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/sti/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sti/Kconfig b/sound/soc/sti/Kconfig
index f881da4b6aead..f99c2eedf93b3 100644
--- a/sound/soc/sti/Kconfig
+++ b/sound/soc/sti/Kconfig
@@ -3,7 +3,7 @@
 # STM SoC audio configuration
 #
 menuconfig SND_SOC_STI
-	tristate "SoC Audio support for STI System-On-Chip"
+	tristate "ASoC support for STI"
 	depends on SND_SOC
 	depends on ARCH_STI || COMPILE_TEST
 	select SND_SOC_GENERIC_DMAENGINE_PCM
-- 
2.43.0

