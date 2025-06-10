Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011021.outbound.protection.outlook.com [40.107.74.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBA6C2571B3
	for <linux-sound@vger.kernel.org>; Tue, 10 Jun 2025 04:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749529210; cv=fail; b=aNeyJR9k6wORtTnmDTIvflrjXO1HPmwgrMBq1ZZlh7edpm6h4tyO5NvrtmTPNkLWuIngrlUoOE6hPm/w7EghBF8wnVGYlLssq0TMCMAuLAoStg0xvA8NoU5j1+ZtvOTuk4SBtHn7wnvH5uncVn8HZ1JvKScqcGGSZxy1xm5ty8M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749529210; c=relaxed/simple;
	bh=7vJPiJ/6zo+tv/e5XolKEKF09NORtEXhfmg9U4sIgG0=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=e4YlX7pT/YZS4cJki4PPg1RX+MkYAcwReFz/VhH+kHBuiNi9Y5nrB/mMCtiY0mfhEHVbdKShJjKSMBTIyr8DRwia1lKZnqZ9r4Dk21O4gL6oqcE9wuSfkX+SxVmOjLsb2u64kOBy3Rqws3XtoAbwBZwj2shkUygGWU3BWBmVIsA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=od17n+er; arc=fail smtp.client-ip=40.107.74.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="od17n+er"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xjSUjF4rqFyCRDDHV5NEw3Zp9zaga9DiJIEL2sF0fiXcRlSUTce9zZgh/XcR+VjRHJlupfbMhWdl4S6NFMhMybH+KeLDDIijeydfWHKsUJYE6TDOelHaIIrGCRV/DLOh0t0dOpwDjpc46Ext7RhUxpJJFu7J8kc5jbDOH2q6iCZ+ocCk5C10aRfwBmxudYAGFiFJGNYE9/Qpoc6fJp+73Q9/BlnhEl5KBO7bw5CLVSoHH175e9Up3dDe+AIB3dFtDCfBqqE2CnlJNnyB0wjYWMwaSk5164BkPxXrui99XJTAWXn3mQ7vTEwgQxTtehNDf7wvUdSgQSuzo3bAs0bDqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sulf5ApqDVjuUlo0Zbrlb4z29icC7JubT09ypouMQYc=;
 b=hJeSyHuVDRSTYsxRgY1t8yEhrpEBJUCODn6KhenZBKmaqBsVRgUX2mxlGjaom4urWU8tKoPMAe1rpVyWk3/gqFuA9vz0SOCJ247haXQI4T1PmbF9ljVujgUt8eNesP+SwetkHxPmJjE2YBuiMIORkl8ESEOdf2uAtEgD6EiQGA3p7+61bRBiGAC3P/kuoiHaIjJ/SqCDLkIIEdKdzw4rBu6iX5USUNUSJq5baBi/y8RQJbJFCZbYeuWk+gFmhTUMF+fjeF7x+n8t3ziMED5Od9mQPpEqYiP/kegfLmcGwl2ZwOxVv6EW2/pcc4UCgUHEtvEsqprnYSKcX2uV5F1Uaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sulf5ApqDVjuUlo0Zbrlb4z29icC7JubT09ypouMQYc=;
 b=od17n+ermZWwzZU28kqSynrM+juqcmzNNBpamsfastyN/RBlg/Vw7GvPrCFmiW8BTHkFApyGO7UrhjmWm0IHqas7jzYbb3ocjw1+FWzsaEl2QFr8WNBX+/IlGnwG7sbrwKSEWKXNioj7qOHoOFETQhZ0H5tHFuTreCNmncH/XGc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB10510.jpnprd01.prod.outlook.com
 (2603:1096:400:307::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.31; Tue, 10 Jun
 2025 04:20:06 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%6]) with mapi id 15.20.8813.024; Tue, 10 Jun 2025
 04:20:06 +0000
Message-ID: <874iwo8byi.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH 05/37] ASoC: dwc: Standardize ASoC menu
In-Reply-To: <8734c8bf3l.wl-kuninori.morimoto.gx@renesas.com>
References: <8734c8bf3l.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 10 Jun 2025 04:20:05 +0000
X-ClientProxiedBy: TYCP301CA0018.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:381::19) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB10510:EE_
X-MS-Office365-Filtering-Correlation-Id: e27fbb68-aa19-43fe-1f9c-08dda7d6140f
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|7416014|1800799024|38350700014|921020|41080700001;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?dB+kgQh+Mo0X8L1yH0cBWFZEsIUuoCX8th+Q3Sc274dXVi0ZW1rITdeVF6Pu?=
 =?us-ascii?Q?GVS//eyR+0A43+eoKOuuEGHMoTOJYzdbXmvSwOyepOiwm6EUZ/8LzFf4qgNs?=
 =?us-ascii?Q?Jro1UHUpeoUBprD7I4UAlw+SGk2c+ahbrLUaSAlHHoMw4uzhTzD50Y6mah4B?=
 =?us-ascii?Q?CFKn3OrzoUqxnk2sGA2XXF5jQBoNXpNub+9Zwc20pQfU8N2b2VXtfYVdXMDn?=
 =?us-ascii?Q?XPwAO71x4hsBr6y1818bCxYuJDFCRNWm2IzT23l31uwnvUXGnJvwPeuD5y7p?=
 =?us-ascii?Q?gkkqwfPGDCFdW3Mj9TSK0zIxwvUEApJ8VdNvHkVXjXqGEZyvYUfGwjySRtfP?=
 =?us-ascii?Q?kQl+LKjpQglABNN2tbwrynyBWHE6zMv6FpLBZ+PrSLQinBYskQl6BRoyFZGW?=
 =?us-ascii?Q?J8/NVwrsxvGbN4SU4+s5mpkwd2IOI/o7hd4qbJQXSTfsDvPd4IPLkwvYxlPJ?=
 =?us-ascii?Q?G7+BPrUxeJ7zVjft62zI5D1gYsRSLEhUdSo4x7v9VjfqxOnkKcCcv7c/QSIA?=
 =?us-ascii?Q?h9vw9JYx5nSy7q2BgpWG6BvVEonDqV779HSYgf4chOctbkrUDX4X9VDjhOJZ?=
 =?us-ascii?Q?/omQgGi44DU8hp08/U8JO23G5qe7VB2B3SHfFsQ4KoLiswiSpnFiumkC+y2N?=
 =?us-ascii?Q?Ir7MOPPAzmL+svTuxMcpnAFs31eu6en2qGpVXmYv1hTFPhuIuj4HQlITO3Wr?=
 =?us-ascii?Q?bP0m30x2ZY97HAxhkjyVUqWVOVNj1qc4VEABqoVLXqVR7EFDaKYwWCXc4U+C?=
 =?us-ascii?Q?djmf5zlVMYL8pal/ID4hGyMDwI1NoWbbxwDM5p1v5lmYXnwBElqLX2auJEsl?=
 =?us-ascii?Q?ttIRF/SV7A9XxHoTmF2vVAjMJeqREDlVTsQhoppTAglf0PMT5HBG9HsS3mPg?=
 =?us-ascii?Q?+q2zbx0QuwyQWzMU6/tpsWzMH1vbTcINhhQEInd8scyuUFWIVQFQ5ZKsr7q8?=
 =?us-ascii?Q?xhLh1PYHvcMLcX6ZXT5J+BpC3B8cf7rIYPJv2cvuKfqT3MbUleuewxiNvvjS?=
 =?us-ascii?Q?tiC/sn/JdCfbG4qHrJx1S/hw0i5SWabeZ1EvASm09HIaOs9ARvxNwHz2TkwV?=
 =?us-ascii?Q?YhURmD4h5X1lQYl+FKOsadoyX4xzLQwr7UFKIcsdwmw+vGNeGlftgbtrMaKP?=
 =?us-ascii?Q?LQEu94fgZvZD83bGiA0MoCSNnChRE9WDF8uk+NDMbOw/+OqJ8DAUZAFKNOC9?=
 =?us-ascii?Q?vtOyIWUHl8bEcxYJ78ucqv2q0ZAWD7dSVZDIosCaeiEtNvN2o3X7AnDoDP2O?=
 =?us-ascii?Q?RnzyJQOVuKpwx7jv/CbzASSBKh2CB0wTJ4tGAvNmvQp2RJ7Vcj8p7N9dYd1l?=
 =?us-ascii?Q?GVyliiO0MfLN3vAFjJpIxLv7DYGa8bR292ZxTrsoB39h4KGGBeDXBBR7yZmv?=
 =?us-ascii?Q?JzYbMLvdD9iT4mwIeRiPJpT1V/EcySpkVSNn9qS6EP6RlokfAa0w7/mbs00L?=
 =?us-ascii?Q?5jika/OPb0hqgSqomIjFrseikW46Rw/Yz02+sMhFg3JomktcwP2w+nMjUufP?=
 =?us-ascii?Q?VvreKCuVkmfezmIe3EoloEWW3PpD7MEOpo7E?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(7416014)(1800799024)(38350700014)(921020)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lhKzgd8j6ZIkgZeHcppJRk0kAlOs0LdhZ/RgspITkfStQKpzQgc9DGMEjFoR?=
 =?us-ascii?Q?9EnCThCL0FA+F57p1ZSvby6yR/aZIXrxYTye0PsDRuBqss/wHJCgyppEc4KG?=
 =?us-ascii?Q?r/Unh9PRhqtDpuf630CASJL54Xe4SDqMeiP9FU9HEl36zBOrPJZ00MMm/dcc?=
 =?us-ascii?Q?sQNgOR01ZRQIov7tufjzCsoG0azs2LMckFBgWG+JsMFjVjvChMggogll2AtB?=
 =?us-ascii?Q?wQRfCWy3h5Yq8goJ7nSGHs6g/SHnCP5Z5SkWEeKvkHWYdS6m9/K8vJinPgSt?=
 =?us-ascii?Q?+4DYsnIkYkXL1gSqyn+nu1UM5k8jNrrqCXkihFoLF5uvCpGUB60HPcZpJ4AB?=
 =?us-ascii?Q?JUWP4rjaKSV9etjQhKawIjrIy462b7RX0Ep+Gz1oq5OPZHzEn966r35rGfo9?=
 =?us-ascii?Q?NPGCeALeEzoqjBqa2ZB5uwRzmO1qdsy1nODZO6geO9OPGFi/+4BWFSnq0c0O?=
 =?us-ascii?Q?tn1BW65NlBhthpWWbBh3ZkTnAJuH3/ZvoLc9jndyxAkfVipT9OYDrHwTD7J1?=
 =?us-ascii?Q?m/rgwmm3b1uHnm6CJNF5BCqZZZAjOIiyvQOESOULw/tZM9Z12EvpVNVlazMf?=
 =?us-ascii?Q?2/X6uR6t34qkT7ksMGlCKNbLLnz3BuR/T8LMBU9O7YJXidHDkOOLlo+uK5VI?=
 =?us-ascii?Q?smLOzXlrOXEJRTOrAkWIOuqWuRhhWtWqy//u6SutJWdh7yTcbtkpwUr0Eap5?=
 =?us-ascii?Q?DFsC4baCBkBfG5rRkYEF8aNmLrYRgEyjF7fHfpWEGiunZyVkWt6DaAnU9Gqc?=
 =?us-ascii?Q?zrLzNSEj9fn6SB8cnFzF1YMImMJDcxaDDCwKzaDq7UkfTBSuqrLgdh0NbDUY?=
 =?us-ascii?Q?yWnaJQ+DBly8ar/cu7C9Hly8vxQp7EBTzrIbiowEt23vGISz0RCujinujjI6?=
 =?us-ascii?Q?SyJxunz4RMxEOhVpWkUp4+GAPQIY0PePYDRwF9KVAPmwhZrqzCqINu+5QyCA?=
 =?us-ascii?Q?OOQNEpi/xRM2P98gcCMo1OdYhUsBbpVxPFywrm4FwHw7DzkuXg+etaOmunjC?=
 =?us-ascii?Q?+k/o4Iz2O1tPcSMvBZgberH2GqrzkYKX8KBrQO2ixuorFOQxlmYVxKjDsuyL?=
 =?us-ascii?Q?OF0RpAvsg9o6tC6gf4O2L/xEGTsjtQvgQCodoRQ9QYcl7zpXIpZzBYsuL8av?=
 =?us-ascii?Q?pkdIntB0Zng+Fui7h5NPdZn46ISLuW2/naWhCDd4KF3n6MXvpoGxHFGBouUa?=
 =?us-ascii?Q?5OYkOqq4qzNbgl8oVI4j2+h2FwGr9jM3OGN26fTAdd4/qxndrn4K6k0YgkZj?=
 =?us-ascii?Q?en/uAVUBp4JjEp3OnuPURAePX5od60h4AwUADgZqN94tp2eoM4uXmwDgZoXf?=
 =?us-ascii?Q?hndp4HCY1ZCN4z7Vm6hE154jG+xYcCiRQE1kbjB0N2TpdaDl/QroXAhPd46N?=
 =?us-ascii?Q?2/sjSH1dvwVSZXwOICkZA3BJu2lFzDBD8HaSbs7iQJnsKRCoxgmRThnBPcEp?=
 =?us-ascii?Q?hWtjJzU3nGgNGUgPO0ZInnwXAoko+62Lrbh9ZSZRkNhNbbKkVUTWfD7S00oO?=
 =?us-ascii?Q?wXj2iI+n+gV0FbJz3Mq6ULm5bK7pCd72dU5UdQhSGia1IW3uCBJPDeXPrtIi?=
 =?us-ascii?Q?DyUMlKkRpIYKfIahMJGAnhH7liy6hNrOEZaqwhrv4qgCTf3GaLHNl+XvtgL0?=
 =?us-ascii?Q?vzTUE1gM2iMlZFTLqWJMiPs=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e27fbb68-aa19-43fe-1f9c-08dda7d6140f
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2025 04:20:05.9797
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Uf8gHQFmeO7l9glMKD6tMaGsE61GLsq2V/96WHwH/pRztorzd+R7CaDpyOc0kXrNj25Is3QkamuEhmSaEWmibEqCUvoIvqEW+vG3/aTdAks9It/zu4HES8ZGwxHJreVF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10510

Current Kconfig menu at [ALSA for SoC audio support] has no rules.
So, some venders are using menu style, some venders are listed each drivers
on top page, etc. It is difficult to find target vender and/or drivers
because it is very random.

Let's standardize ASoC menu

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/dwc/Kconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/dwc/Kconfig b/sound/soc/dwc/Kconfig
index 71a58f7ac13a9..9aa73a5cf0b77 100644
--- a/sound/soc/dwc/Kconfig
+++ b/sound/soc/dwc/Kconfig
@@ -1,4 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
+menu "ASoC support for DesignWare"
+
 config SND_DESIGNWARE_I2S
 	tristate "Synopsys I2S Device Driver"
 	depends on HAVE_CLK
@@ -18,3 +20,4 @@ config SND_DESIGNWARE_PCM
 	 This functionality is specially suited for I2S devices that don't have
 	 DMA support.
 
+endmenu
-- 
2.43.0

