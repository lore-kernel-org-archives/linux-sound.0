Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011036.outbound.protection.outlook.com [52.101.125.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66B921514E4
	for <linux-sound@vger.kernel.org>; Thu, 12 Jun 2025 01:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749692630; cv=fail; b=mib9qX9NwSopAkoout8uokSXyLZXFd/B/Q4mRDmyNEPc8wuGRdFEHvZJSasYA7G1HamucK8s3PFz4rWf7FdU9h5VIrCwwFa0y5Cucffhm35Yve2VBn65i5ixA/1knRQXkJG6SuxCFjd2S8xuIl7CE1EtkmE17xp7+1gQXv167M8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749692630; c=relaxed/simple;
	bh=rcnv1bJGb8OHKeYGSOQQHh9EIgXRIR7jhzAYmM9JX8s=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=QVAS+ehLx+ViqCoxdaA8ftKBhQVDyAe/2nL6gLA88iXAkKLIQDh/C+StQJ0iDqn7n7bQI7gohCP4p9IbKdc6sVFrkkhoYMFbROeZnl/thnT4GVO53C7DfL+Dx7t+/3vnlDUStIGZrCWgTxoiOF5K/vI8yu3nMc6HwYS3BVD/T+Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=J8bZEX3i; arc=fail smtp.client-ip=52.101.125.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="J8bZEX3i"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QV76LweCbWAS5OkFUdAkI9Cw/MOvKHndV2cemXKqtvTVHMajz3YC4C8AnsaNNHOHoA5XA4i+hzc8CzqFE+qLth8Q9pAZPmcnXY6C0nkJ4/f3iT+WqMZ5t+Xe6Ol9AdFTJUErIZLU/MBgHh5GcPY6rjN7TkXPDsV8uPuAE1Y09FDpUg1V1kzoptACPAkxDMJ1G5BQna5LUcv4baHa1RSezPg1tOK+uCV2JC557u8WPCi9GdIlUSdh6qizGo5p+mwhGmjBHyXlJgswfBESYUr/3WWo2O2alZ0sI95+WPqzkmHCZ0rcvGUCEVBnImJIYuD87c7XHzfDswfuzG+kscslnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7tQPpywjxKcdxJ74riI0mcCUbE3B5KvygwiTmG9WY/M=;
 b=Q2XeXK4A6B9sikwiCjGHcqoArjMahBw2FhQ/c4YKGmO2NeCL/bY6Ypit4i7lwoc3pPU/pNQQtVlRAYMzLa0sO6LQHxaRa1UfvgUL+EvfA2DPL9NA4r/Wtv1x6NCLGf5el9kUoMkjVgBFXG24isgd7A4DHCQ0DwA/LCEEEjkwyfB/mm/KlVWEifZoAyxmwdF3IHpbt7xKCRJckn+cqduK0aw2HeZXhcbdU0kAbZFh7PVmLYoQmg1E/yD1gU6AKfVXO6DDCAy6aih0OfGV18lNn+yWflPzF8bX6iSiH7W4uj/IpQ63kgQAO8hBlCKjtL74sY1rxZjMBpUNpIHZ36UHrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7tQPpywjxKcdxJ74riI0mcCUbE3B5KvygwiTmG9WY/M=;
 b=J8bZEX3iUfrN4vlF7Z/adhN3KhfLiOvHDPlZFAOMeJeWsnFCAgCRC6rb2es7UzfC/1WXqv1q82okPFdX8kcFhPkRqwm8m5n2wDFHfRTzxI2HeMdZEk9Vkl7r5EbwqD+VOpQmMtoW9dqXDEjmFr3m66qcNpQE8G640FiYDwTjHvE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY3PR01MB9824.jpnprd01.prod.outlook.com
 (2603:1096:400:223::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.30; Thu, 12 Jun
 2025 01:43:46 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8835.019; Thu, 12 Jun 2025
 01:43:46 +0000
Message-ID: <877c1hzqcv.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 24/39] ASoC: ux500: Standardize ASoC menu
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
Date: Thu, 12 Jun 2025 01:43:45 +0000
X-ClientProxiedBy: TYCP286CA0106.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29c::13) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY3PR01MB9824:EE_
X-MS-Office365-Filtering-Correlation-Id: 37509430-154e-4716-4332-08dda952923d
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|52116014|376014|1800799024|921020|38350700014|41080700001;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QwTf6E2qmwGSsubKsWjSXQ/JzuycBlVUg7pinX2D1XR26qoWDQvEFrDE5tfm?=
 =?us-ascii?Q?kNHkdmySm3x4WEvEksD6Mx0b0UJRSrjyjLi011J9RZ4BydynilDDE6suO3zb?=
 =?us-ascii?Q?nTyav5+kwNXGIJOAFfk9pVUhNHQv8rC5oCaKm6GYdAUVPVPMY58o1zo7y3WB?=
 =?us-ascii?Q?lNWRLULYG7OxQqK1sQcFckzqCvxrQCy3+uOTNnQRXF1N/t0ooELZHbC0Eua9?=
 =?us-ascii?Q?8RHVIq6scTF/qDJ353hoQ09aBLqnMTE3CmryHcq87L3BgGjtzMVjnshAqH1P?=
 =?us-ascii?Q?Uw2z/jhEqpEgDToRP3nZqpdIBpGgAC86M1BeNT4KPlsHlyzNDcLBzJjVvGTW?=
 =?us-ascii?Q?WIQ9Vk6fbp5fYn2r5H899/1jshBKmwIGBZs5zVi5Wz9B9hefkFtjLJO3/k8Y?=
 =?us-ascii?Q?rqWLO9Pn3Vxkj/CxF6pQjl95XstMAmmNJl7ZFiVcw/0PYsCGjdPClIQZhXjp?=
 =?us-ascii?Q?2evrAlgpM1NOVnA7qTPwYMFiHxax4MUv2vA2F7IuOJyj3wL21xugjru/Eb0L?=
 =?us-ascii?Q?nYc4lMdeTGCUnUu6ud8l0tu1ATmoYcXoF3RDkVB9KoesKy8/nO6l1Ezd54bD?=
 =?us-ascii?Q?Mb33Za2VodWdPfuGYwlqDzM9+yHFtijBAcdNcv6E5cRZWk/sBLueGYPH2Le5?=
 =?us-ascii?Q?+xqePJYrId39zNrjzdy9CrZbg7MIQkDA3P555LrrKz3xzhMR8blJclxYLRPO?=
 =?us-ascii?Q?xO+M8cD+htLuNxiyHchpoFDHvWa0JSbFAm79ozFHEZ6I4ftAfskHPUSKF/7u?=
 =?us-ascii?Q?X/I7z7z/5UfPEXffqQ9OKJd/kTFBGD7d+XwKoGnuUlvhNb4vfg0YlntMYHVM?=
 =?us-ascii?Q?yj7ASV4+uvIDeB2EAEN2mMQWl3rEoKTuUg4ETrR+NMZVmixxqJu0+5LGnWNk?=
 =?us-ascii?Q?0xoV8lqw17YAjHP0yDuDsCwxvdAZNdGDPF41tsqGXrQEiohyN/PkL1jgEJ8x?=
 =?us-ascii?Q?0IvY2qTfF5p5zZCzJidVhZzwS3I0NanANx67QtMDP+FtWnmXuFGgYat/54BX?=
 =?us-ascii?Q?4xzBPXkfa2vZu3Te8cLlv0KHdKjkxP9/RUbVHcCqJsYG7yLg7ZJs3QEZ6Z9T?=
 =?us-ascii?Q?PLrj2wCcrkM/usSUIceIqAxVEYfW8matIua3RwzFoCt15FbaEFpW3uf30ZZ2?=
 =?us-ascii?Q?5Nl61BeDvjTht6FDxG93khOoxU2CQ4Nxh+yvY43ZHTcwltHBosB3Kr6e+uN5?=
 =?us-ascii?Q?E/jqrVC5IQoIsazjK0j+QledWxxdivMLIdlCQtAtQ8FtC7xabhvjOamvZbCL?=
 =?us-ascii?Q?4C2MQm6ynWJyq5X3W1AKnNOJXGf+nECNO+/ioTKuJEs//jeIPeBnGKJH7RvA?=
 =?us-ascii?Q?6lnP+BLJJr0iCzX74iY+zGBRqeD1ep9OsofgecO64tIVmwy5N4ICdh3po780?=
 =?us-ascii?Q?aM+d8M16sDQTJRCeY0s94PAcysyS7MiH9x20fY8GHjCLLyeYDyaWthrPO4nm?=
 =?us-ascii?Q?iqdC9KgKH79zwO4vVLZspdETCubRyS51/J7/OeYqCB716WWZH45+5Uk4KnLh?=
 =?us-ascii?Q?VkMOdC4bY8/jqsjLegAa2j0MRqQVzdkqZ5uECo5IHLBf7Kb4yTU3NEveMA?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(52116014)(376014)(1800799024)(921020)(38350700014)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UO1X3cKlSFJQ6qTmoHuUuHZJVGsQG+uU/QWrap6Vf1N3xQZlbyUbhJRGqbkn?=
 =?us-ascii?Q?fZWOiXSc4eO/0VyYAey7EDnR3HVYhXpAsqP4LAtI0M/myeY7VlR2vkMNJoka?=
 =?us-ascii?Q?eXewFcGG5RPPrulQ8fSzdekHL7VkCW2rNJoP3QKYAokEr9EPSY+dz/+k6CBa?=
 =?us-ascii?Q?ZBeEUk/1j3KlexT0V/QvbdaeMsKlckMrSpHK3cnuHYGydBWFCPlWFQesgvJ6?=
 =?us-ascii?Q?dJereWqjHVP4TYB58/pdZX07kIvgl4Xl7xLr/ywOU603HDZB3/uFQS3SkFAt?=
 =?us-ascii?Q?wluIcghC5BPDQgsnv39VsRA3lpO1/hTJ6MpSb5qTupmit3DBJF2a7q6W/REB?=
 =?us-ascii?Q?mAbHWOKC6Bc1VSrtOMxe0SycLrEu5v/FNIvuLrgIVcK8wnU+qrx50YMPVT6N?=
 =?us-ascii?Q?ktNsJlvPZGPU5yqKcGEsO+2R4TjnO+Crc4+dlFSzvabgzfgMIh4GceP916er?=
 =?us-ascii?Q?89ojbkuzQYlJJ1uUjNnZRX20RXtJg0rz8BgTtuCCqjEX4SMJOEb4ZIziXoD6?=
 =?us-ascii?Q?RKoE9ZAardLtgSkrGj/j8Z9hWN+ygZuvE+fEGzFeYpClUEJbEO5FnfBM4efY?=
 =?us-ascii?Q?D5C4dBHDLsoh665K1XqQFQTd01Pv2ZFtCutMq7D1xVsFttocm6kQKLVqhCbt?=
 =?us-ascii?Q?UO95ZQ8SbvI3GwCRCMlOLvpEl8UQZzVAbX+cvmAdT7+lULvgt4v/oVqtDqJS?=
 =?us-ascii?Q?gYBZU1T2yQxLrV9KQpr5YXJYhW+vOG2JROSXPF5QKEAuxvD6PlNkuF5YDDYV?=
 =?us-ascii?Q?FOKdhzsUNctpJU7GYnxZO904wTcl+P8542A05MWU6GawabU0afn9YCpREZUl?=
 =?us-ascii?Q?3OAZGavNOpw2ISId0grL97hSRvSSmjfPT5dnrBlgzzo2Nh4kZcZWXiDSt1H1?=
 =?us-ascii?Q?MMF0PxzXnYYPmZmVxKNhD/pxQuCpvrM1iCdFeQRRpYoUShbOkTyYe+e47aqL?=
 =?us-ascii?Q?DYAr8m4rffsKw+LTep2K0XdymQjcMBogb/Mzb6DEX8Q0DuI0+WEL+IpvB21p?=
 =?us-ascii?Q?FcwqPoPNSg1FZZjhCmBxQ8qsluQYnRiX4JR9Q2zkGkgH5PEOf3s8GGZVM3Iw?=
 =?us-ascii?Q?E+GvbNMZL1srtcWABIyopj3xhFDduhkK8s4xReGI7VxoNeGLLNUb9uK+nNhL?=
 =?us-ascii?Q?n8pZUpxGxDfXW3J5jFqSW79my3BvzIaTlMAceHkD5McuU7SR6QUjz4ycoSx7?=
 =?us-ascii?Q?8lmSULdGcNPNL78x9NKLjzV0awk+xSBL4hlC8pFnl4VpFjlLozlldqvgFWTp?=
 =?us-ascii?Q?JmIvJ2HuXzZ2h/TerL16ffhyEGge996sNGyQcBFWTyQ6xEParCVkDnJFynCl?=
 =?us-ascii?Q?EB80MEnYbb32JYIQ6764d2Qkh2s7+OGDi7Jl+rJZTKzlVVZKOC+TYyq+lCO1?=
 =?us-ascii?Q?fUMANE1P0/yFgX0MZWIEn18r32YR9tAUiuIGjivUf8u1W/aYyqjpIPndAPPF?=
 =?us-ascii?Q?9lQ0ZIIlKpSsVztatxz+ACO22PgP/tTauf2DClKocuT6pmn6guDJgqUXEzdx?=
 =?us-ascii?Q?n/C1xXD6pKNWWaR750lGuIzBZ8ZGUKpVeyMVAJbH/gQFgxmopyjoMf6SccZJ?=
 =?us-ascii?Q?N/hAJkE6l4COFqvQf0DbEqL6raqY4TnkRbT7mYQ7m/V20DZjZ6fo5iAlbGwR?=
 =?us-ascii?Q?HwXN/fmXRVerRt2JChBlhdc=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37509430-154e-4716-4332-08dda952923d
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 01:43:46.3884
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6DKYcY1PoZwj6VGpshB4VVW8lQN/DGTZ5vBU1MydEjeb5Jf9Diss4Jk/3Xz/akSe6Sxqba8BSJtk16z/od44MUcRRo8Oe7MYLiWRk4i9/klQjNeRzygD2DyWn5ycstBw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB9824

Current Kconfig menu at [ALSA for SoC audio support] has no rules.
So, some venders are using menu style, some venders are listed each drivers
on top page, etc. It is difficult to find target vender and/or drivers
because it is very random.

Let's standardize ASoC menu

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/ux500/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/ux500/Kconfig b/sound/soc/ux500/Kconfig
index 34b2438b52d36..1130580603500 100644
--- a/sound/soc/ux500/Kconfig
+++ b/sound/soc/ux500/Kconfig
@@ -3,7 +3,7 @@
 # Ux500 SoC audio configuration
 #
 menuconfig SND_SOC_UX500
-	tristate "SoC Audio support for Ux500 platform"
+	tristate "Ux500"
 	depends on SND_SOC
 	depends on MFD_DB8500_PRCMU
 	help
-- 
2.43.0

