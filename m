Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010057.outbound.protection.outlook.com [52.101.229.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 550E817A319
	for <linux-sound@vger.kernel.org>; Thu, 12 Jun 2025 01:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749692687; cv=fail; b=BZpsKHQlS6PbS3pwRmBzRHA3vtCwzdFeBsL9bXw+wWgcZu/TwysrPBamDbrD8wo0qlrhgxqFlCgb5B6Kqr5PlaO00P2bpf4WPKdRiryEEOg1li+JGWNEteIOaELICYVcwbAOxt+H/7KWBEVoUeyOMx2vXKzeU7l1VfGTUBqwjx8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749692687; c=relaxed/simple;
	bh=QL0SQzmFjqRdhmsmhCsiiOZemm0kxSUdGphBNnBOPYc=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Ur0y1qxKP5KmXBOD4nbGcTliBSR4iLFlMGJJ485LNpDW/O1nb9d5e+LX2s9SpsjbzRwLy1bH1hEjZrx5U6x9nVrlm+QlUDVQ9UIR+fO7jbLyEqL6wj5lyDGOpSTu5/Sn5gnafAgpGzhp7Nea0QK33L+q79GYp34f82YPJKyfdEY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=DFCfr7nY; arc=fail smtp.client-ip=52.101.229.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="DFCfr7nY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a983Su/qj/kKpbvjcyHLNmREmghtn/BQwNGN2P1mtcLcPzAKy58KqUOv5uwEZeBgOUN2cnxwaDldBVybnDxfiLNlgp65R1SZAvhSfGkHhw/X7O+5UpHf+KocpyWcoIfg6wXSZhethLa4roYkDNhgs9tRPwGz0VfRFrLqlhau3CfhSKT+NneEj9aUp0+DGRIJn0/Yk86dBXL63BG92e8l+BI/CnxB2osF6nu2eiLNhOr6A45jNGzxX0MqlnlqdpjNORJpdHbx36oStPXxK3WHZGTI6MYTryph8W6hVEmWSLPwa8b3p8YvM8R/okjQ3NvnhpudpdunaOEOqf1ABPqa9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7/OCq0z+WRIfcKveaoMGwwWwmcX2EgD5VaeWQYK3cLs=;
 b=p6P7X6A9drt32c+89VilCNuVV+StGCMm3ZlqC1hkbTnQ6dgZi8xwr4qfH6TAm4sMH6V7/H9kY/vQDO3htmnMaOE74ZsR20cEn26CqKFMA+2xuN0AaEBUsQGJZRz6XQ3/TeXP/Dzv5F4O3jjBP6ltSN3cEf16iPmUHTtqPSRobKVnan1B9EXZnBzTFsSBBtwoB0+qQGy19mgjPcagb2v+vgwmZfY6jaycIaKkuTA5i2KPML9w6x5jt188q+9hbiuguNULdGBj2Rrg7vaTbu67txYRpE9weUFqLU0Fz1tqeCGfQ0qiFlWTgC5eD9brJgCdX1Cew/FQ7n7k4hi8cn77Ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7/OCq0z+WRIfcKveaoMGwwWwmcX2EgD5VaeWQYK3cLs=;
 b=DFCfr7nY/HFRrL6RH3Yq+4l92ImefRHKo7KFSXBwmIxGC23h0U4yPlL97waDGvXinp1XDaTnlVIpqoERaL6pCFnmmd6feSWXq+dJo1hyxPZoulcJbxCsBKoTNNBumhKwahSaYlzALKHQinp6DBXrkDjwEaLMxkr/f7ntw/uRXLY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY3PR01MB9824.jpnprd01.prod.outlook.com
 (2603:1096:400:223::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.30; Thu, 12 Jun
 2025 01:44:42 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8835.019; Thu, 12 Jun 2025
 01:44:42 +0000
Message-ID: <87qzzpybqu.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 35/39] ASoC: mediatek: Standardize ASoC menu
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,	Liam Girdwood
 <lgirdwood@gmail.com>,	Mark Brown <broonie@kernel.org>,	Jaroslav Kysela
 <perex@perex.cz>,	Takashi Iwai <tiwai@suse.com>,	=?ISO-8859-2?Q?=22Martin?=
 =?ISO-8859-2?Q?_Povifff=B9er=22?= <povik+lin@cutebit.org>,	Claudiu Beznea
 <claudiu.beznea@tuxon.dev>,	Andrei Simion <andrei.simion@microchip.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,	Alexandre Belloni
 <alexandre.belloni@bootlin.com>,	Cezary Rojewski
 <cezary.rojewski@intel.com>,	Peter Ujfalusi
 <peter.ujfalusi@linux.intel.com>,	Bard Liao
 <yung-chuan.liao@linux.intel.com>,	Ranjani Sridharan
 <ranjani.sridharan@linux.intel.com>,	Kai Vehmanen
 <kai.vehmanen@linux.intel.com>,	Pierre-Louis Bossart
 <pierre-louis.bossart@linux.dev>,	Paul Cercueil <paul@crapouillou.net>,
	Jerome Brunet <jbrunet@baylibre.com>,	Neil Armstrong
 <neil.armstrong@linaro.org>,	Kevin Hilman <khilman@baylibre.com>,	Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>,	Shawn Guo
 <shawnguo@kernel.org>,	Sascha Hauer <s.hauer@pengutronix.de>,	Pengutronix
 Kernel Team <kernel@pengutronix.de>,	Fabio Estevam <festevam@gmail.com>,
	Daniel Mack <daniel@zonque.org>,	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,	Srinivas Kandagatla
 <srini@kernel.org>,	Heiko Stuebner <heiko@sntech.de>,	Sylwester Nawrocki
 <s.nawrocki@samsung.com>,	Daniel Baluta <daniel.baluta@nxp.com>,	Orson Zhai
 <orsonzhai@gmail.com>,	Baolin Wang <baolin.wang@linux.alibaba.com>,
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
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>,	Alexander Sverdlin
 <alexander.sverdlin@gmail.com>,	Elinor Montmasson
 <elinor.montmasson@savoirfairelinux.com>,	Binbin Zhou
 <zhoubinbin@loongson.cn>,	Alexandre Mergnat <amergnat@baylibre.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <875xh120u3.wl-kuninori.morimoto.gx@renesas.com>
References: <875xh120u3.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 12 Jun 2025 01:44:41 +0000
X-ClientProxiedBy: TY4P301CA0016.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:2b1::19) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY3PR01MB9824:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e041ecc-abc4-447e-41a6-08dda952b356
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|52116014|376014|1800799024|921020|38350700014|41080700001;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/AOAxtm5HS/1/XdOIKQVlZk5pRlIvClp4A2qFktpWpGc7PLawQ06GpWS/nvZ?=
 =?us-ascii?Q?G+eN6WzrqTZAa4R6mAwyFAn1dt6bsR52UWYOdSBCP622j0RVMydrq2IOFRG1?=
 =?us-ascii?Q?cJgcaCB84GhYsoJoTjjEnXbbNfF1Fw9KsQGklH9gdBGw1dbQcujBs7CkKztl?=
 =?us-ascii?Q?I56DuKXChOtmW0+hhb46xogmEkpaP9+17NGiTNRHh1wf7tY/gwukeVyksa/A?=
 =?us-ascii?Q?xDTO4eG5D41j7u/PWsGM96GDa6r1ENu5n5BNu/j5YlsKaXzp2rPje324D7UZ?=
 =?us-ascii?Q?P/WYeCXn9BpsFY3Y82tApdzI25HNur3JDtQXPDIx3LpzjvbMKdHQrZ/gTjRQ?=
 =?us-ascii?Q?cOh9MN3QvNZtYvNtdXN6CLp/ouo6w7r4/qop6M3xkD7JBNDzt5oeMcbSQRYl?=
 =?us-ascii?Q?UaxTDbKFCLD8Z7ync3F8E2sZ1UsqTGytswoUe5mcjf9Awg4RBc5gJnS5z0J/?=
 =?us-ascii?Q?yCwOLDK7dJnbdBg6e0QNJp3icULyRLM6cv4qrc9fBZTpRnh13RSweQTpQlyy?=
 =?us-ascii?Q?fpM5sRdsb0B6JFyrgG4/MxebFclQxdw7K3C7dZ4nH+jmL4h1SSnUk8TB7hGD?=
 =?us-ascii?Q?MS6Vp0LzZ8xAQFiJiV8PGsquKLYGK100ijKcP2wFL5or+XmP1UNbMcum7uSY?=
 =?us-ascii?Q?dUOzd5fUY6CsFRymGz5yzDkkEezVPlCHQqEnrnmU9gqAirDMK6NrcG2PSWDJ?=
 =?us-ascii?Q?iDZwa0595WCfSGYh3EckSbVtNgqM6vIKODjJN87zQ+yTZBCSBQqvnbiytm0l?=
 =?us-ascii?Q?4DvnGMV/7l0UVfrDPiaIe5brTafCswF5Cksp4aMp3ObdidIiIw/NFvYE0OH7?=
 =?us-ascii?Q?IsR3zlu9SvIGtnEpt4RW49+DSMmAOalmKVUsG9+tCNTS0X1rreX6EhD5Scg9?=
 =?us-ascii?Q?zBTQSuIhs7Ey2xrq/muQJO2m7RWFLsba3yOvoW4O1z1m7SxHLwxIDaAWxwfC?=
 =?us-ascii?Q?9bERA7QQeG2uHxP7tzJzJMoWN0+RzC25W2AcJevTWXnb6BkhWrcGqZXhS4Pc?=
 =?us-ascii?Q?0dJLNQbBk+XkTxUBPfRa45OAcfxh4VbFWSg7mo2b789g63hw59cx9p1yZlVQ?=
 =?us-ascii?Q?CHpCke3efL32W9mH4FOjM4/qli0liNFunAYS/2vfmVffDAavWbW1eEnCTEUW?=
 =?us-ascii?Q?QLm5iQUTvIjVxaAqWGEPpLmJhq0Prs5pq3tNZueQA20ul+1Ktg/RbnreR/1e?=
 =?us-ascii?Q?b+c2XPfzyHr0UOqBTpbJ/AjByBLsl5qP4ctaOa0ZvpWMwEdfYTToLe0WNNOZ?=
 =?us-ascii?Q?6sEYNr06oI8+65FNvtjYZM5P5oNpZy+3pZo9MOQNrqJPm8oPsGLG/EmcC6uL?=
 =?us-ascii?Q?yz1n18oqW71hUTaIYEgEDFboH8m94isoUsSCJnJncWGsdG72wQ0XlKHolA6r?=
 =?us-ascii?Q?vDmPwNrMN7Sbz0QBSU7lrlU56VDz+wmCswLZMqpm8FqyCHqUf+LX1VlQSicd?=
 =?us-ascii?Q?Yf3BjfDhn3NEcbZZ0Ez/iAXWrGsFFgF/UDTvHpI8RhRc74I1suVueBtRU+Ao?=
 =?us-ascii?Q?GHoLxUlRNF9DrVIaW0O21suvzWs2rKdmRgk+9goDiTW6hf7K0TX7+u2fwg?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(52116014)(376014)(1800799024)(921020)(38350700014)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BYlIPX1Gt/8gxvrQXM87ZSVHGrKxBgsMy+AkDhPtaBItUgd2HV6ENyROlFwh?=
 =?us-ascii?Q?TxZ+aWn8Be2WXeJLAmWPNGEYirWIwXs1wcrRBdgbqjbaQmTMQHgbVkJPK0Ja?=
 =?us-ascii?Q?oZNcYtuiaMvJXUcEw/2YIlDMv2wshOsID8u1SUYrifOkFRTCzr13VecxD4pg?=
 =?us-ascii?Q?nYNKnwtY+tYSA/7CwhRQs/k215OBSUtecUAscteA1v8PGEUhKWb22QppZbek?=
 =?us-ascii?Q?mVXfc7BRHSOrRxQw9OrkQrXHE9Lm9YPwy90DrKyjhfA36EvcFb8Ih+FtOtkS?=
 =?us-ascii?Q?5GWfgonYfWxTxXjE0c9yTcoXinRHGuJfbMREAe6nnjjH8pj6Xw93T9yPBXOw?=
 =?us-ascii?Q?yL2PS/5Vrl2Rd4E3tJw8AX7hYbSNrDTX+/6kvIoef0PgL8irn0EDhJHj0K29?=
 =?us-ascii?Q?MLGoYSSO2KYgjO7swGZIvYObp5+IQjP7qdfiehE344VV2FdChWo3leMI5mHK?=
 =?us-ascii?Q?Ph3LSMM8ioYeW9a7HAiIrh6z/4cjpV+4oUlCCFMMYhC94hDQysiLJQea+QOQ?=
 =?us-ascii?Q?nAjYX9RxgYz+16LKo+82LwK/G4OcR9ljCafVYF4Lnym+1pFo65HENstiWm0y?=
 =?us-ascii?Q?TQ/JjhOaNY0mirw+SGj5u/UR4HP/ds+1wYklahoJ1EyVWSkuMol4gFU+IyX8?=
 =?us-ascii?Q?twaq7uWiiYyAW/FGdRT8wR9u9TtIqKxTMgLVpObAqg/4jnjyJ56IsyxnBn47?=
 =?us-ascii?Q?88LXrEenftBN7XrZxvAPNbul0eKBO641N/bA+Uu/zGuuu+KOWrokr7ybyF9C?=
 =?us-ascii?Q?pUqAuxvtmMu+i6X5Oy8MIeCTJBlxyQGlRlhESsZpLVeci+vo4N7mH+oCD1W7?=
 =?us-ascii?Q?9QsRj0lToclVHmvcQjqbz+lyFPRwiTYQhneexVV8ihwiAPqWdSZk74Zsb1HX?=
 =?us-ascii?Q?C0E2T0gQ0g3LkBUsSWBrfwKy+IF/scbYGZlAGwTYNF4E7vDG3QBpwlkkW9im?=
 =?us-ascii?Q?B8RPTfW/Sm9aFttg6FE0xwbQc/6qKw2G0NIoUsLd7n3c0CN7rALyYi1wDysw?=
 =?us-ascii?Q?brN2dQsaVS6CW8I+Zp3/SGnpYmx1/J8tgheg9ppNl5qURW2rk/ERnXRgn8y6?=
 =?us-ascii?Q?Y/MBDU173yMpJ2xdc6qDZwJojvOgU2NyCKmvV8RjxfQvRBHmMIuqvAoGaK/r?=
 =?us-ascii?Q?W0QixPVKI1g0I6bfZUF3j3genykALoP7JfxFFoLp/lvqlSx/lH+k58ZAHaNF?=
 =?us-ascii?Q?q1Zj3BZ9cAPPKYtBwDGb7LX+ebhU1b7xZxo1iQ52MoIz0r8NSXrdUrq4ex8D?=
 =?us-ascii?Q?pQ5t+ykxmVzSizCZ3yQ9dRjIawjQ7w1zWkTTiQ2StBpqrSksA7N5yCLjAzES?=
 =?us-ascii?Q?NO971gN3Cg7EWIUY+T+OkGEEMFxjTnbQ3yt6HSfuOjsbUwgSgsqBqN2SHYOd?=
 =?us-ascii?Q?/fkyJ/w4K+lU+n2lHqXF74THbWayiMeYt3MH/+3DBdl96G2xcNaF3bIia/rH?=
 =?us-ascii?Q?kySoMXxnYxsYy+vL0jhWfOaMHHWhncDq01jegAlTOo6LyHAauNGG0H52IDfJ?=
 =?us-ascii?Q?UaMem0Y4c1VWWfXxyM3Ku0NqIl0aXgZ5VYeAgLVHXfIhBKFs+k05dK8qpigZ?=
 =?us-ascii?Q?fgaFzOVccc7VwFzuQQtT2wT7UE2nmVjYqI1rm67g2cwAZW+RYK897Yn1w4Is?=
 =?us-ascii?Q?D8+YdTxyv5UFvXpFSiUEK4o=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e041ecc-abc4-447e-41a6-08dda952b356
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 01:44:42.0575
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fRa44w9jEYWwRn/RjOznTsOEqmcEBssyP21NsYm5uD+SVhsG1t1WcV5dm7T/IWFGAItptKe37gASRza9YIAy1cAkgyVpumeelvmgaVO+67IDpUyntq7/XDsh/1i1hoAI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB9824

Current Kconfig menu at [ALSA for SoC audio support] has no rules.
So, some venders are using menu style, some venders are listed each drivers
on top page, etc. It is difficult to find target vender and/or drivers
because it is very random.

Let's standardize ASoC menu

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
---
 sound/soc/mediatek/Kconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/mediatek/Kconfig b/sound/soc/mediatek/Kconfig
index 90e367586493d..10ca8bccabdd8 100644
--- a/sound/soc/mediatek/Kconfig
+++ b/sound/soc/mediatek/Kconfig
@@ -1,4 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
+menu "Mediatek"
+
 config SND_SOC_MEDIATEK
 	tristate
 	select REGMAP_MMIO
@@ -319,3 +321,5 @@ config SND_SOC_MT8365_MT6357
 	  boards with the MT6357 PMIC codec.
 	  Select Y if you have such device.
 	  If unsure select "N".
+
+endmenu
-- 
2.43.0

