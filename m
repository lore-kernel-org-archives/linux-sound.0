Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010021.outbound.protection.outlook.com [52.101.229.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D60A925DD01
	for <linux-sound@vger.kernel.org>; Tue, 10 Jun 2025 04:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749529428; cv=fail; b=qoycb9h5pfr4so/Dbl6UxaJtOMOsmTRMgYK0AY8Z18eyCxf0Ly1PQivs10/uUiqzQRXqpJUn1hsfakVshffBzZL/JA7gDTVO/dHBCl9wgy+E+B7Dfdyri0SRNII/TJJvGRgAmTZov2gWkFoKYCqiMGGKfmha7RktjzCW91zopbI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749529428; c=relaxed/simple;
	bh=WrqsCjJGC4BMVPMp/2Ioq1Raq1TBfltlltu+oH49Efw=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=DiQc/ZH6at7hVUg5P0PEr+abif1I/Ccxm4cV8u6/A3hAQqod+Ru4NyZzTqkM2sDLf+E90x2V0TYBeaI+5uFFntQhnq6HVXAEgyYk/LqLFkAfQxGMKRTtg8xmDcchKfzODdFd6Fa4zGsXxxuA5+8ckWkmtFUY+oBy80gp4aZ0T7g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=eGaJsz+m; arc=fail smtp.client-ip=52.101.229.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="eGaJsz+m"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OcC6znyI5Esnf1hpk/Ite8vaXSm9DVzjiXBMPGamtHOwRN7Ee3/cwr1qMXMHvbe95s7IwaLwR9z+4Ig3UA23siXnek1KQlZi0QTz+lLBWOzZBJaADjWQXENYkgUbi0gpRDm5UHSCrDgH+m6X4PshRYGcE6yy04AgpMxMFSHLAKIgmNpETtcJpIwWpg3jH5Hkyl/gPrizG/RYBRkzSqXUMNHyWsQSZ7cbW/5utHi6TG/nzhLcS7RXtOur5Nux1QUH9hawnODqpIQS94FwaEL8aZH/00Uzd8bv5BUKsY2UFwguLaoObUZQ0x1D4ahJ87W12j5UcutM2BoYmzqmpp8CYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M4I90jj/taZuJyrbyMFW9SIra/wg1DOM+JC8+OeBQVk=;
 b=LVurElieHLuywm3tUHYJHfOVNT0ncOlTWn1icK3tRiT6pQ7YHne8t5043AAAASJfpszTzxMu90iDB7SxOM8aEuoeUdJ4V+XOITgDcHRmhJBKcEr6LxfQqWW4gfP5ypoWTWTydh5zhzGaBU7SxRx5yVw1LxT4pOXSh+ajC+ECFYdeCmyYGGUelw65rZKs75rqBK7DqzyHxN+vLSVrxM+J73wjWZDR+IHOTtBNLtzGryIdIpzJL3hY/g0yzeuu1/K+QZiRyswNV7rh1aVlDajRwE5jKQcE32WZ90IG6Nv5AvqQqs7NwL4hinJMWqvNMRnYEfmg25z1fOaQAckl/Ope7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M4I90jj/taZuJyrbyMFW9SIra/wg1DOM+JC8+OeBQVk=;
 b=eGaJsz+m+vTh+5B+TQfwt6wPKy48O/LoRiC5oNOEeqr5L6ySPdClXOXbUuas4Aj6t0jFqZwQnVarDqj0PTuEPN1ujeBhWuhRhF/c/urHjmUQOGdPXZNH78588VQYYAPC8j8fGoE62naglYqv+VF5GkFjUrIQTeSs8I7llph/w6s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS9PR01MB12373.jpnprd01.prod.outlook.com
 (2603:1096:604:2e8::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.31; Tue, 10 Jun
 2025 04:23:44 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%6]) with mapi id 15.20.8813.024; Tue, 10 Jun 2025
 04:23:44 +0000
Message-ID: <87tt4o5ink.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH 37/37] ASoC: sdw_utils: Standardize ASoC menu
In-Reply-To: <8734c8bf3l.wl-kuninori.morimoto.gx@renesas.com>
References: <8734c8bf3l.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 10 Jun 2025 04:23:43 +0000
X-ClientProxiedBy: TYCPR01CA0094.jpnprd01.prod.outlook.com
 (2603:1096:405:3::34) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS9PR01MB12373:EE_
X-MS-Office365-Filtering-Correlation-Id: 21293d2a-8ca5-4002-cd86-08dda7d69637
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|52116014|1800799024|38350700014|921020|41080700001;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?l+iJy0hzUJ18x3RuwIfgkkvFqAIUa8S+wEOl4wNkv71MwHzU54BV0vwgeiJR?=
 =?us-ascii?Q?7JjphkliAhqH++/vofLjo4H+rr2zAfnLAGC1J6YS6Loa8ATcUoDgGExJSefA?=
 =?us-ascii?Q?vo1Xptp+xTiXDC0iTHa80MI9OUKM622pphbArMeZvi2K8lPtNpKdDGbzp0S0?=
 =?us-ascii?Q?M/ThlPFJEkrhH0zNoPxIdqkCuL+XnLi3AZ1xoej6o8RbSdJ8GtkhPVYIuXCF?=
 =?us-ascii?Q?91/rnmkUFOJv+n7mD3OPZVH1Dm4dcGTzeHyr465EfYZ7SSZ2nnTd1nuhrCAS?=
 =?us-ascii?Q?bi4t5xIRMdDueuFjd9y6A1fWrAIImprGiEwEr90nF0p8k031g0DNltPDc7XX?=
 =?us-ascii?Q?h/sh0YhFG+VJXMe2A0p9sXiPe+R6IRaJUnYvIOWsgs60V0q61I+SZ6970JTm?=
 =?us-ascii?Q?5E2MhEFLXgVc8GirWVbLrSPrKZIbKAKXzN+yOizB2ERfRjR0zWi/bEGfiBDY?=
 =?us-ascii?Q?JuvIMtgQbFmwaE6dYlmdXdl0mqgUFR/GeK7O6CWFoHQkfxrtFNXkJcw3yVil?=
 =?us-ascii?Q?ZFHM67ZVael4gFzr9g+ViEcaVx8t2ncknQd+hBoIWhO/EOge6AisBD6ifz1N?=
 =?us-ascii?Q?tnNrG8MUQnq/WCNFzJyp3Ce2pV3mvNI9uljgTzGbBUiQ6FRspJYTbp5woCQd?=
 =?us-ascii?Q?gXQrFLAgAxmKVaXNl8y6PJrVFAlqYwevMthWHynH8JnYQcPHcCp1Q1ff5bpW?=
 =?us-ascii?Q?NkTcZ+RDJrBDI74tMJVT6qDr7/XVDwEMTQjSg8oJyn5ghU3+IWyO0hNQd/D0?=
 =?us-ascii?Q?mxNhMCmhT+iQNqlc/2pHZ1cebKq/QNtce1XzBsT1uP6nq2ssEb1dKcaqRcER?=
 =?us-ascii?Q?5RoTUaVYs475eWVd8zl7Ckua64gZdf1SBTtPtlI+Z5hfBnVB3kbSEGzCB1iX?=
 =?us-ascii?Q?FplpwMXcHM1uFfHa9iyfn7yeOATqHgaXWP8vqZAJkblPzvTlZ9QqtG+cEfFF?=
 =?us-ascii?Q?6yKjOCLIzSs/NY1ySco2VI7pt+ZrhHC5dmnQGjoxFsHJyU0V9N0jALPjmgrA?=
 =?us-ascii?Q?P15TL5cp7UU+7F/SunsUKY5FfuHKRC2KMhF2a6TCbYOug0Ji4u5jHzycbvJJ?=
 =?us-ascii?Q?qN8wbU5ZnIJtOU0FzepxbbcREghJhNYEazW/8qjtU/LTNFWpdkDh6C8NlY1L?=
 =?us-ascii?Q?9erlQW/MAP+6nRycwcYm12QKRcEvpvHYv7T/nIwAIcVURRyyfsuCYhzSs+Ri?=
 =?us-ascii?Q?OWB2jJM2L1OLGIwSd4uCdekMVuzjkze7hdmPEfEUx/R/EqRxAOKwpfgJKRKS?=
 =?us-ascii?Q?T5h+jd5Z3gWTQO3m5XMxt1UnsSQaxsotJ89QVf0Xi7lBGEH4fS6Jr8mF0cgW?=
 =?us-ascii?Q?pTNjPLGE9afvvj7IIQ824p8clNAzHG9aR1vWgDF2KfAq1VnW5uRqLPXqVTkE?=
 =?us-ascii?Q?59ubqAaipNleIZrWbz+bdiTyw0g5BC0vFqHC2T1/V08/MKdM1rc1mk1NYPG3?=
 =?us-ascii?Q?oXnsqRdUs/ARMsBDiJmmknExM4AUZ80JnYWu/7KhbGaD1/NifPuWBo/J2Cqg?=
 =?us-ascii?Q?xvyt7exn+Nz5hvH+cEtubgcynHrvZt0qAofFsKLmZGoTGhZeUlvo/cK2oQ?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(52116014)(1800799024)(38350700014)(921020)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UbTwAqYN1D6l+jcBAyQyo3NM381kxqnxLrsCVQftmz0g3aLEN9DKDI1aCULz?=
 =?us-ascii?Q?hECcLrHPkLcXTpCR79BdCAiF+t1C+sWCxQyFfonVVEePO799C/lSYH7jGUIX?=
 =?us-ascii?Q?OJoPqJcOKmZ2qvO1U/gf2NGIxkBz5TpB1ph6uvcwUHLI4O66LkAajho3X48i?=
 =?us-ascii?Q?Oulgg4I+WbxeQvBdrB+zH3zTITRXCZ2o/M0lAHBzodTfa2N6SCH5gKNV8o+0?=
 =?us-ascii?Q?ruGCd/2m1SkIb7AHUHEx/3xjF9K6tVEVwngw7N9qUVINaynKcjn5hsJvTcyZ?=
 =?us-ascii?Q?DfJbG6kVv9h02JrWoYrayZiNDc4XVZdnRBGO7CUfhv6mziRaApNMKfw0p/3f?=
 =?us-ascii?Q?OscfdqkhK0r09ct362mkbMmEPAgHLgogDEgJh5ALPc0x8HCFhkDC98iDM/jE?=
 =?us-ascii?Q?B7sqZ9nbCDlDavg+nH8FgHP5qQ3SANVUEo6rz7Laye0WMB1EuvQz1ZUHvRvA?=
 =?us-ascii?Q?wbGk2WNjreWNhqthroYkUEyw7Cp5q37WdlGLflTl1lNwWXWBwGcVo/BVA07m?=
 =?us-ascii?Q?Nm2I+5o/jZQsms1FQIfiyIS4ribuOCV6Lc2bj91N2SCPIE8i/90wOAFFqLjX?=
 =?us-ascii?Q?TACMTQQeudytK+KAV5bsOLqrA5ko4FeRh9upkZrN0TpF+1PeS8QEyZxCh6Vo?=
 =?us-ascii?Q?+NHrArO3Re0Kaed57fvABkBDy2Z75u+b2sJ8rIz43VEjS/4Ie1FQLVwDLMlv?=
 =?us-ascii?Q?V5s4FHhKsTq31VpCAp0/4oHuANs7MX51mPaieh3RFMBU7k4aORuJp8z9H5g0?=
 =?us-ascii?Q?XyTsMgX+twbR91lIiaaPct7WZgUBkzsF89UBd98/H/PkF0KE8bNTw+3UwS4x?=
 =?us-ascii?Q?39+YMSJIPZ4XZczjRfWRIDF9RbcPZanuXH+TAPNGpmjaG+UcprSnUnfmL6Pd?=
 =?us-ascii?Q?3VbXk550NBNyLZ0xCGI7qYk9qdZN7VP19Dt3RKIgDO/A3VrqBInLR8sBlQ0i?=
 =?us-ascii?Q?bI4NOv0ldroFr3g3viveWiw79TehykqS9csTMTiXCjmCA+/UzDDbhqXAXXQy?=
 =?us-ascii?Q?LSxwT9mjSgwUQHSnfMqJLzUPgohF9K2FzpFUfVtMNUCV9Z4bZMonsZSWpuM2?=
 =?us-ascii?Q?cSjPzVW7XwdIElq5OZt/6NMZncyAb8uPVYT04uNBmnvUKgycP82TAh7zXv5U?=
 =?us-ascii?Q?E5sRJWQe2S/o2Pn1ML+2R4EFFviI1jajQffzTcTdhf8Y/k9KzpuxRrJp8jYO?=
 =?us-ascii?Q?QIv9Hch4iqv50siEH6O6535PCLBCpBqJaqfOnDCULuTG5sarV859HFkyqGni?=
 =?us-ascii?Q?rw6veRxHck7ZatX0i3EIbvUUaQZL73Fht9a03M1DyaMfJjeQ/thh4DodhJ5F?=
 =?us-ascii?Q?cF9mPUCjeMlCXpPPjTg9j5CA5QbISPG7VdGyBEU/AZYfSZVQl8tIQRNbp43r?=
 =?us-ascii?Q?foNolFnEsGiY+BT6LjICoU4kcxm7Li92Jy6SiR6KgVZW3SCY4GYEtRDManeq?=
 =?us-ascii?Q?lIKNRAvcPnyeJxyuWADrQS7J/xxv3jhB7N6Lk/t0xggRzyIPtsnoyVygx7PA?=
 =?us-ascii?Q?jGdGQSWVjPBEZhp8yFrvMeKgvFVSgqxYEbAWWIDGrKR9MkqCveozcZ2GV1wx?=
 =?us-ascii?Q?3mpbVldVGsbWloeOM3DBjv69s8+ugeKQY9yKbktPGAHdtMbEcg7JSd2gRYqx?=
 =?us-ascii?Q?s5INLwfU1I9KeFjgegxro8o=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21293d2a-8ca5-4002-cd86-08dda7d69637
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2025 04:23:44.2936
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZhYE2qTmuxy/+rQvTe0arA2x1FWJ8MyzupxJiUgAJMWlUGVy3hCgjRr0OgVpfDEEZIZS8YmpOt/TxVO+svmnvXkx8HXuII5gVzETn/ZF/OjiuSHy/y9YoOEPvVr/gBLN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB12373

Current Kconfig menu at [ALSA for SoC audio support] has no rules.
So, some venders are using menu style, some venders are listed each drivers
on top page, etc. It is difficult to find target vender and/or drivers
because it is very random.

Let's standardize ASoC menu

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/Kconfig           | 3 +--
 sound/soc/sdw_utils/Kconfig | 4 ++++
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/sound/soc/Kconfig b/sound/soc/Kconfig
index b6a1f6fa26a99..d2934022344d9 100644
--- a/sound/soc/Kconfig
+++ b/sound/soc/Kconfig
@@ -128,6 +128,7 @@ source "sound/soc/renesas/Kconfig"
 source "sound/soc/rockchip/Kconfig"
 source "sound/soc/samsung/Kconfig"
 source "sound/soc/sdca/Kconfig"
+source "sound/soc/sdw_utils/Kconfig"
 source "sound/soc/sof/Kconfig"
 source "sound/soc/spear/Kconfig"
 source "sound/soc/sprd/Kconfig"
@@ -145,7 +146,5 @@ source "sound/soc/xtensa/Kconfig"
 # Supported codecs
 source "sound/soc/codecs/Kconfig"
 
-source "sound/soc/sdw_utils/Kconfig"
-
 endif	# SND_SOC
 
diff --git a/sound/soc/sdw_utils/Kconfig b/sound/soc/sdw_utils/Kconfig
index d915083c38895..a3e0f660fe2ec 100644
--- a/sound/soc/sdw_utils/Kconfig
+++ b/sound/soc/sdw_utils/Kconfig
@@ -1,6 +1,10 @@
 # SPDX-License-Identifier: GPL-2.0-only
+menu "ASoC support for SoundWire (Utils)"
+
 config SND_SOC_SDW_UTILS
 	tristate
 	help
 	  This option enables to use SoundWire common helper functions and
 	  SoundWire codec helper functions in machine driver.
+
+endmenu
-- 
2.43.0

