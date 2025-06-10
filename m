Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011013.outbound.protection.outlook.com [52.101.125.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F5CD25DB0B
	for <linux-sound@vger.kernel.org>; Tue, 10 Jun 2025 04:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749529362; cv=fail; b=QJ+IHZ6WwCwx6zWMIwJaz1Rl5irKxRmMwD+Y/zboYxSF7gu6BdgV5M1aPMWbaUxDGWY4yh4cFXdqtB5czSqpHzK8kfT55+QauAY3aK3UO6rfBKD0W17qYU1TPjEwWy7xRuB2kdx79Ma4fDHsIkVmca1VX/GRj2ajprzG7IyL8cg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749529362; c=relaxed/simple;
	bh=lgem3HbIEH/SFxL/a+u8Qps4nTNFmZtwjRl6tFNOEaA=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=O/6332y5gxAhz1FKDsPI/rELqMyhfOMor9BsEqQunOT1I5jZ3BiDtImMAoXUJezAilc7Lyoc0V/3QcKkFvk8hYkqwiK89GhchWLVeLfXLREEkjcRTwx4k/JvTlv1zF0VfsRz/MZCT6k4q6apRFWDSimjfBKsHBj8dsf3f18HFxs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=B/7N03tp; arc=fail smtp.client-ip=52.101.125.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="B/7N03tp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XwbMUSBuy8JRzi30hGc01UClLWfA4697f4+oB9HV1z3KvlDTphVlny4PR4X8DPjmknh2sTD05c0RdAF8xgV4BYFA69QUO8OfC0mDx1ETYAYMjRds2QC6lF09iGEPSb37aoHVPf3oijREMk333Xx0KtH8UiBiT8YkL9nFm8HwR3nbQtRt8g5SSSJ5wiybmqfLuMzbKzQB6QOCDZHtYOAlGBhXm6NWe5WGSql3lFyhBUVwFx0d1Khg3P9soLskB3hAid7FDPOspjnnU8KjE8f7ZS5srI7a3Drlz21sv2humEzRmYE+ffPYpI2FBr74Oa/7aabWm34r089GuDm+L1/E1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yh+qjTwc0/h3nDdMpVfKx5e6juL4qwSiuCLr/I2U7DE=;
 b=Xbph+wIc3aAgyKeCljLYd8L4iSquBSzyQqpiMtmfl/9tEr/1ZFrcQntC3i6yItHTZVeuJJv6NxcqvihOixTuJsIr+Cx+notkO0P9Rm/it/eInW+U4fMqAnLWkw3HMwe8UFfFHwIKnM5Df80bSJElCMpuSocQX3qqGuKWKE8OdMsz1wQTLYFnH1yJFBHEpYeljdwYqDk4m83Q6SGd6mMAyl52W0cDtJcQbbsMt4AEdX3JA4es0gMBQMDAinyAcErWn7y/e1e7GnVJR5ceiSiHyCZAx05HtDSf1FCFw9sBhSQTJIVtSLG6nm9evKwrdXX4j6AB4rDN8z7v0g07AbqI6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yh+qjTwc0/h3nDdMpVfKx5e6juL4qwSiuCLr/I2U7DE=;
 b=B/7N03tp7SZoBC+VlTos+feAw9jJatIvtxtLC5HIJgtcxSghPDYnRzS4E1aCMJes8oRRRTXN5Is9Vl/Hz3hAH8TkNSNONnSbDgTtHAboJee8SiIshXWORjv7vN9i3Qrq9Ta1kVARIBQobS80DC7rgBPJTUA1Rg+kswB6kjGlXK8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS9PR01MB12373.jpnprd01.prod.outlook.com
 (2603:1096:604:2e8::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.31; Tue, 10 Jun
 2025 04:22:37 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%6]) with mapi id 15.20.8813.024; Tue, 10 Jun 2025
 04:22:37 +0000
Message-ID: <87bjqw6x9v.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH 25/37] ASoC: jz4740: Standardize ASoC menu
In-Reply-To: <8734c8bf3l.wl-kuninori.morimoto.gx@renesas.com>
References: <8734c8bf3l.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 10 Jun 2025 04:22:36 +0000
X-ClientProxiedBy: TY2PR06CA0027.apcprd06.prod.outlook.com
 (2603:1096:404:2e::15) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS9PR01MB12373:EE_
X-MS-Office365-Filtering-Correlation-Id: ecc605e1-8055-4e87-f853-08dda7d66e69
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|52116014|1800799024|38350700014|921020|41080700001;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4kYUtk9pz4/qO2zfVZaZXmyLjChxkFw5bhdtRTWsA3XaHjEsUDqcQe416t4M?=
 =?us-ascii?Q?pSLGobGTFiNYnIZRHgiyIBBYkNAI5cKoNQ+jtHO0KK+tcXEehma+IvXefuGh?=
 =?us-ascii?Q?KgNGVmdf8cv6WClkZjmI6WN7wqSnkA3Sp3VtPNymF9xNAIl25tkZCVANSE5S?=
 =?us-ascii?Q?wWHM56tVF38SAAV1rpfJJcLuOjli9S1b1KyS4MkqcrTKHQrP0fxghYI3nqki?=
 =?us-ascii?Q?tTsdTDNvq9chVf3fLmmiriFQsb+iQ5ib0R3soXYMR1RSwoCYrgLobDdsYJZC?=
 =?us-ascii?Q?+OUvDAhqOVVki/FwbgMvEhWcs5zE4fC3j47pBava0TbBeu8WMnw8vEeIKWrt?=
 =?us-ascii?Q?CVqfjQekfdw+faUhvWSBlAxozey9/1VlSCmX7AwpXZxxP/a/Nhal/rfg3OXl?=
 =?us-ascii?Q?bDiRTLxoP7t+57SE9lAungtMW1ojtRQfAGGN8aFOO+Y7whJLu9RDlgAHLg8m?=
 =?us-ascii?Q?7dHqpV82ju7bf2VdFAyx0JsDIV1slGdS+V/92H7EdBh1oblzLS3RkKGjtX9X?=
 =?us-ascii?Q?XyZ4fNeduJUW/13e++e4d6f5yjj83M8bnMt7/6fg8HLm6F8b2myDw772SQej?=
 =?us-ascii?Q?yPOejghIdE+xOQrbLTJul1Qx5dlz/013n4OwnMaJiKsB+XdBPvs3RAVQztH1?=
 =?us-ascii?Q?E53WbeM3gNYPn5To4fpKDnZgiwFcfgZuyLgw4+CAHwmHG8rbgUguOploB0sL?=
 =?us-ascii?Q?1H0GLZ/SdRkdMr2LVtx9nWCidlv3t/sIr4tW+tpS5+woEZpbq2Cvts90g9zq?=
 =?us-ascii?Q?ALZLVzrkoGTeTi6bunav1v4XGjdqREBcP8PAL/n9ECHKIl3eryh6hh+qO0ZB?=
 =?us-ascii?Q?DcuWtN5F5GeBOGYi5XnUfXMuKuVuvOvW9kKx6KEU4r5mrDOhqXwEtJM7GBz9?=
 =?us-ascii?Q?47tfZ6qAKSVDXAo6PJTy8oRfNWil0H8nbp5yPsVXaeoaJirL6lpeY/8YkMSb?=
 =?us-ascii?Q?eShX40KyVGsGEjJUxMU3mtG17XYptc9l47LqUY3wqOs0L4pt938Up4vrDijH?=
 =?us-ascii?Q?ETwabrFhUYz/IQB0bh3kAm3xEK9QSEcZ9gxCJZfP0K3UaHpnM6DyODCTU4Ej?=
 =?us-ascii?Q?dnjO8FKMlbUxLhM79Nqyd0Vw73IpWjB+lyqZjjCcStbV32tpEPovRJ6INBtH?=
 =?us-ascii?Q?8oMsCVhVc6eCcQR/lBjs4M3r/GwHjtqtTDx60MdaRTTZFf5CkXf0ajyeOMF+?=
 =?us-ascii?Q?YnP0iuuREoZkuaQdoi7Llw1OFgOcCheoKTjOeAAdqpxbU1tvL/Yi4OYwGKKm?=
 =?us-ascii?Q?kA0m/pkVU3wbkwaB9aDEbDOWMkIn2QvEBE+0TYTEGsQU4HQpc6TyOKO53bHU?=
 =?us-ascii?Q?rWoSrUVDKpeSpgfioqtQviwAiMaj2EvQ6WSRu4SND0jT/2DwXGclSr0RFLI+?=
 =?us-ascii?Q?XF9E8CvpQJ+DMHAbnnyQzk5iL/O7Ig9oCtHMnk6izniL3o9BKg4QHC3juJLm?=
 =?us-ascii?Q?BkLbzm1xkNV1ACM2md21C2+GkgEm+q+4VMKpdU7Vt6afQ9309JGxw0NMbSy6?=
 =?us-ascii?Q?c6hvo6MJPLVny4q/mDtXzV3BKbu0dhowWIc8p1UKzuTEVYadiSgg2qU/xg?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(52116014)(1800799024)(38350700014)(921020)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3zV1I1mZPDXq9Kw4m0zytLeypgpSxEPlqUFqH3PXj1P400UosIiYPrwcyAmu?=
 =?us-ascii?Q?V1lK3ENi547q3Pd03COyfxZ+nJCbvqs9mkGYGhuzSK6EaE4Y9iNnLs3an0Jo?=
 =?us-ascii?Q?/SNlRN6dspK6vn1EA8+BianJH3zy1NSc5T8VUTXfMvxQFkYi/VQPNvQ+agwp?=
 =?us-ascii?Q?KEIqgKIhIBBrq7Wodh2JTd/fzdkqZWMjtqhuHsdXRDiX4Ga24xO+oE7o15i+?=
 =?us-ascii?Q?m/sJR1HmuI/kOrU3fhsnPQRHRlicRqaclmu53ecaEnNPcNxpm89QJJ5yOxUt?=
 =?us-ascii?Q?5g+aTQeO5397w/aRhSR5cJ+WbxGIvQxUsprzM2AVb/uAQowtXzIYT8uV6ZTj?=
 =?us-ascii?Q?s4wkJOjbZFeJ7Egn0AHd5IrsSmm4TJdWY94lcdTdkEZSRaBNHkDxeQoiv2El?=
 =?us-ascii?Q?rQ2UmF7rkkIkm3FzofZVZDC5DjE7nmrVCY56K1TBJ4t+uSExFvDCHxLexDXM?=
 =?us-ascii?Q?cpGSmofxXvintOViIdibpOpEtz7heSrZchmiBAE+Uts1yy5JrulIH7ONCHb6?=
 =?us-ascii?Q?XPsxlhBaJYL1mfbGfDLwNwqi9cdc6z6qDnUm8qIOAc4nnMv+mJSn5BbSQ+lF?=
 =?us-ascii?Q?nLddGoQxXfu5YmcR3ZDY79S1BdleZ3lZTK1V6s4P5mTgKY9rwh1jJtzwKsFC?=
 =?us-ascii?Q?HxjazMD+fWcVqCi0ZzY5BhSlvc9xvbXzXG9ArudmYUykQUYbOI6JdMjqVpLg?=
 =?us-ascii?Q?uSN0YPS99T7EEyeXheY0J6wX1LlF+kYVAKtg9k5fpXCHR5O9GkBU7qRoqcs4?=
 =?us-ascii?Q?YFvsR3FAqCnrGElWAAmYnFaBsys6xDj6qv7109/kejeHYfsQrx9zxr4IOX8l?=
 =?us-ascii?Q?IloqnXrKahcqtGmdcUNrKOlLcnWioa+5Mu5DvJoQRp1M2759hdI/EjXrXpnJ?=
 =?us-ascii?Q?DJNxlOh9Rx9gCSca86MNsS8wwfdE0bv3u6IKpI399w4KqWGPNo7Eyj+F9V5A?=
 =?us-ascii?Q?K0E7wCY0OZmQbypa+Z605eH+0qFS6CMLg9BUkipe9ePYj0L+Zts7xehwOc8x?=
 =?us-ascii?Q?P3/niZOy2kWUblsITIz03k5/qZdjNTUwNcwWHHnpWbmCyliPRdDTA6HQ6V4O?=
 =?us-ascii?Q?IqIai3kfCsbhLmtWYFr9aZImCPDK09kmoeWZs/NfhPqQrYU4c6DmQ/IIN2QP?=
 =?us-ascii?Q?VHJ68HZayWu4Fsbr/2h1YZsbIYYL5hrwr/vMOLq610Y9OEY3eyUmgFAY1dBa?=
 =?us-ascii?Q?+tIO67SNWfvXrBNPwh73kjvmHLaRuPIDuzhiFe37N1RyOhAZ5UbxPsheP7yj?=
 =?us-ascii?Q?jS1Qbd+L24dL2Nsp0+wZ3uY/TU2YCb2d5pOew5qdCxdQPFS6iwSP2SDzBeDc?=
 =?us-ascii?Q?TmSDpivhmUYlAX84OLKqomyWmbRD/XGdlygpawlB6EtXGVv6JjjVyJAFwcQl?=
 =?us-ascii?Q?OCoSpbu4c82Uu9/Di6ge6HiibAzcRH9RaRqVnQAX29SgfuwOttxyS8kZ8MPq?=
 =?us-ascii?Q?32Pl5MntsKJZXzr6gU2rzxymxP5QPxS+jzywps9Fj4hcpuKA03vdYK9A0ZCB?=
 =?us-ascii?Q?UgDV57nKprgrgBlUJ4eN7FD/wtpds3hBpJ5DNIADION9/thkSQ9O4bOJXVzY?=
 =?us-ascii?Q?VNjR44hibMwsFMrlQt64ghKBMqM5F/IZab1LccPapMYljcJm8FwNFi1N9Eyf?=
 =?us-ascii?Q?alxXL0xzhsSFPGlR084ZLvE=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ecc605e1-8055-4e87-f853-08dda7d66e69
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2025 04:22:37.5456
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zuDh2haWVvboMGnVVvToFwJdxASTDwwk2De9vZrQ6Z05EJtHW1S9+kFgsI6ZYvNwcUtVgeGzVuRj1dnJ42gaO8YUffWcKApnyQjK0IQO0gJk74PuGPl4wC54nzw7QbML
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB12373

Current Kconfig menu at [ALSA for SoC audio support] has no rules.
So, some venders are using menu style, some venders are listed each drivers
on top page, etc. It is difficult to find target vender and/or drivers
because it is very random.

Let's standardize ASoC menu

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/jz4740/Kconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/jz4740/Kconfig b/sound/soc/jz4740/Kconfig
index dd3b4507fbe6d..7b24df5774865 100644
--- a/sound/soc/jz4740/Kconfig
+++ b/sound/soc/jz4740/Kconfig
@@ -1,4 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
+menu "ASoC support for JZ4740"
+
 config SND_JZ4740_SOC_I2S
 	tristate "SoC Audio (I2S protocol) for Ingenic JZ4740 SoC"
 	depends on MIPS || COMPILE_TEST
@@ -8,3 +10,5 @@ config SND_JZ4740_SOC_I2S
 	help
 	  Say Y if you want to use I2S protocol and I2S codec on Ingenic JZ4740
 	  based boards.
+
+endmenu
-- 
2.43.0

