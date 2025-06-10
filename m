Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010029.outbound.protection.outlook.com [52.101.228.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08E07259CAB
	for <linux-sound@vger.kernel.org>; Tue, 10 Jun 2025 04:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749529189; cv=fail; b=CaEegsK5H1c5MXmdtlFvsXItueXdisoOqo/83IMJaYMznhDkSesdRw8G7fXvNQaI7qw6v6+MRn5hWWhywlZuVppfDtnKh+qUVyYpuRb6ed9kyc+FhC1riZeetnByPpX1CDgiCtpsidqO+CK2Thy+zuUsth8pJ/cJJhm+EtSE6XM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749529189; c=relaxed/simple;
	bh=gX9wjatp+WqxcYQfkQh3r9xPOrPfhakl8CYLjshu6tE=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=m7H3gvRgm/Nc8c5e7+sWNfHGpuLoqqJm326lDwBLC9YrKfA+J7FvMTzVqGSBsdvVUZ0rfkoUKGlFtH/ljYx1Tr6+P5v/5p9HjrCAPNw4bq4nda+8rzMVNJylJpzcXneIaSQJqp45rICU9FjdSIABf8rQvkny51QQf6UYzRgDrII=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=TfC69bdK; arc=fail smtp.client-ip=52.101.228.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="TfC69bdK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N71+Qrg0JckQceyH75e4n37CFypMaFYWieKV3IfM48AlKZEZQ+iyobs3beiX16tA5WQDgXQ6U1z4Gh+b+BOnU3xZ4Oyk70laKPMlVOqFT4IoKqQmzLDAOvJP3C+5gGvlN7EEcn4lvtKjlImhRdc4DQyBkp2Sj8BzJcEVnpaMGzTFJHEyw2jGh7Z0I7LDsFLmdWjFEA4MfqgWTwVOAXB6XNJeTBOsGPJSPOkVt0+QHncZ6NKjtxHSX+dntUNUoR2PMOkC34jyDBdWK8gLLqN2PNED7W1tZ9hfFWPSwi+Qydm/PAWyEqahbj9ovSsblwbprSObJSUK6Ybqau01+dui6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NZI7x2tbaMtTS3SHT5pU1t/euUwgf9KhhGP+g3s9T2E=;
 b=B4hVWw9Ul9Kal/GcKoi/mbRODcaklPQeAOq1+rtFnEycc5bXv5qrsDk0wNNmDk7qQjVaXHcsrcmWB9KzNEzZvYDwoucx8kjUiyBV8gCaTeUF17rWuSBAjGu8nbMjhzFoH5r9UvWN93CZjQSe/d/PkdChGUbbn4/5a1wtL6+ZB91BZnlvceiGzYflfjm4eeZz9BdbHe2jDkYYSN6lthktdCFf4g/Z8yOo6TEOY93XzIfKsS8YgGOt2aLwjr7kp9l1eIrmz14gNHkD6Xp/44ZYnlobzrB6RhOK/0hkhQCBj297EzaQ1GbvTAhugnCCQpNkpU/BRjo4R4+RLU8HkwTKzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NZI7x2tbaMtTS3SHT5pU1t/euUwgf9KhhGP+g3s9T2E=;
 b=TfC69bdKJbli7ca+aSlKAJrsQkNSB/zgOAdI3p3wsyZlPWtbCcKeZ9u/diFzl22JaiPIT957z3+01IZUVSRJN3AHW3Zeo3ErobI4BtUr1U9hhNnVUeqWyKlBy0gHF9Gcdf9ku4tTcJHq0uD5wcYKofi58NomXgCjCPQgzH9W2JU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB10510.jpnprd01.prod.outlook.com
 (2603:1096:400:307::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.31; Tue, 10 Jun
 2025 04:19:43 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%6]) with mapi id 15.20.8813.024; Tue, 10 Jun 2025
 04:19:43 +0000
Message-ID: <877c1k8bz5.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH 03/37] ASoC: amd: Standardize ASoC menu
In-Reply-To: <8734c8bf3l.wl-kuninori.morimoto.gx@renesas.com>
References: <8734c8bf3l.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 10 Jun 2025 04:19:42 +0000
X-ClientProxiedBy: TY2PR04CA0001.apcprd04.prod.outlook.com
 (2603:1096:404:f6::13) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB10510:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d156b74-32e5-4698-09cc-08dda7d60699
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|7416014|1800799024|38350700014|921020|41080700001;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Uju3aDyUcV+MB/U+FePPZl5WF50dwmMXm0T8G8mJlHHiEXme0Wrzv7ysM0LD?=
 =?us-ascii?Q?AqEKSVjFHD67XG+BiACcHrTwX8rRzjGgfryPvzc43/MaodE8cw3SF08odTvU?=
 =?us-ascii?Q?Bq6tYPh3oSXdxYsvp8KQmCfNJWmhDwk/t5j65Z0h+2u0ryKc4sQXNflQjCGM?=
 =?us-ascii?Q?HpT/ogX434ljul37x0JBb9th69y3HSBFGUW2FMyzrMP/hTlObR5MCSQ5TEvc?=
 =?us-ascii?Q?+MyzOUFZbq2+e6MVYsWYH8XhFJv9InSlG0/Hp9dwdsdDwiXNBvyaqZP493A1?=
 =?us-ascii?Q?e2ArtxCPHkEWpFNJ10pmBWQCm79VyesgirrL2cpexa8QuaMi054QzSmoR9I7?=
 =?us-ascii?Q?IQwE07xUKx0G8p4r90puZRBA2S10jLhpLVgEL6Co1k6hjlNqfxTxae5UZj7/?=
 =?us-ascii?Q?QigkMC9PEAR2oa4oaT/zdr+EkDaS+5uT9JQuBcXPKFYhs+4FRqfyhb/s0vE9?=
 =?us-ascii?Q?EzXIU2gvHTT9+ad8ectA4+elpM1HHj+MzP00xMY1X4LuU4TwmPOJHTEKyH9o?=
 =?us-ascii?Q?2/Jic9kkX2o1/anMOql1XdLMztsbYlgbTV2qi00h4HsoJRuqfOiOdnV0ElKi?=
 =?us-ascii?Q?6GXrHOKOPd6Te9QhVfFhDo6BYHhxrY1OIF2anY6JtG/Ggpx2VMNyziZ7+5Nr?=
 =?us-ascii?Q?WuQnNEwPkuP9/b5YACjbLOhNYmCPLlO5nodbIRag+pGLw81jmXdh/Lrf5yMy?=
 =?us-ascii?Q?mBIbx+uxv2ljnIyqzVS/dtZ9n9EdTyrCx+pBnunEhJEWF7+NOE7Tk0/pIZW6?=
 =?us-ascii?Q?nkDVoz5cr1+SQB/edDMshDHDOjiJoVtQzZVhSdE5RlTDP1ArPaPTG3esXXUj?=
 =?us-ascii?Q?NyzFqmkesh6crZoC5dzOK0xzsTV8dehz9O34OR9LBZM+Ic4A+6Aj+izFqEo9?=
 =?us-ascii?Q?cME2t0JPFnARvq4gGNWQ5L/paZG/VmXYs3VtvReheOHi0sjfUTDKzDlN0s14?=
 =?us-ascii?Q?29WyFvkk93kp0hzELRcT3tst7UmcxZf7odwQNW3Yon2An3SCzedr+17Mag4D?=
 =?us-ascii?Q?EiFy2wONgOL4w/Omdxue+gJfrE38sqGY/Et4ipTxhs3Jl6O7nu1fjqFDyFPg?=
 =?us-ascii?Q?GpJdOV9Ezl7vFXHIqWNJb/ueZEXZO/aSbUvHIgVoa2raXfGFV0PqwL3K5sfy?=
 =?us-ascii?Q?so7uyGR3cn6D9OL1E6vLBwAMjxZIN+4HJfA6jl0Z/KQsbR/ZJX1u0k5UVN4A?=
 =?us-ascii?Q?XqadOjyqvPEaeg1N0iBoiCQSqugYOWrdky1OStyRriTfxzLcQbfjU4P5/vXs?=
 =?us-ascii?Q?buYIS0aR0P543JmnsrVHJDt2ddW+/f73xHSauqV0rc8G5ReAhQTkClK7Mr1c?=
 =?us-ascii?Q?m/wtMZzbFFv59YvM7rjad921I/OLrMmdbb5U2ULm58hdZempdn7ji1sZi0wJ?=
 =?us-ascii?Q?q5ucMB4C0kyo7P7AGX4OvelToMFxvUb7jqj3h3Lmd29IiP/N95HQYWi8Tly5?=
 =?us-ascii?Q?whSY1bqSO4Tjd8DrDMVecej81TNfo8t+5Sev++r977fHkBZjtRspiylqfI5u?=
 =?us-ascii?Q?L8wYIAw0mauE3xfw4Ds0/fw2mbfTr3rwp7iNr4tSyG+ad8O9df/qOZ5NYg?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(7416014)(1800799024)(38350700014)(921020)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Pnw9Ji+34CoGs+aCJ1KDbyshpisWrZ8GAfhW7d/jSrmRQ1ID8H/HinXof3CP?=
 =?us-ascii?Q?lVBjx0QEGKOAKLmLicg+7MMqmp5o2PEMzPu+IjfjjvnWY+Bbq5M1H8uSTZKu?=
 =?us-ascii?Q?UKRrrk9KjajU5V2SZNNOq6MPO13W+WcG79vmoJan73Ngcpf2yxR3sPD0+qQy?=
 =?us-ascii?Q?JUTNIZHDW/GemxZ3GN0Svd9cTloaalC+Y0SwH6rEt3vhY2ngS3asdNWQRvrg?=
 =?us-ascii?Q?mN8uZIiN0YM58lanWVvYBYp0GkokwSi1HFIw8HaoGGDgq3k+yIox8XVIhQ2u?=
 =?us-ascii?Q?bloWfWLtQoM2cjTdAKULhHrFSlFUDe+AQ2mic0AAOerGLIhZht+wdDT7kZuf?=
 =?us-ascii?Q?VHaRJ7Tuusmz5f5SllShjg53G4XKfnw+nTAMzHHio97Bq625l9C1dNR0SuKr?=
 =?us-ascii?Q?xJKHkmbUvIQTPKfDI04utpsXPsaR8+aIU+HL4AA+2Kg9b27yYwf0+NbJQ7H5?=
 =?us-ascii?Q?IA9nDjtxUKI98AaYqW2aLTCAALreyKi0JXB5HjJB06DZf7zvlTHpeE9tRTLS?=
 =?us-ascii?Q?Xj2mH7Yew5sexyo7+2ETYxi58PFQWNc2PE/jRWJfziF0d9xSQzaJU2ztUEP2?=
 =?us-ascii?Q?R+OJTtyNTrzVO3WyLqnF/j8OGUvKF/nMPoK1fKZYgCefabSrDSf+x8h3BS2D?=
 =?us-ascii?Q?ipKCT6imeT3qCI9owhVDMadFqWarXmGiRtMU8Y844QId1gK1CKxPktzR9ESI?=
 =?us-ascii?Q?HBSksfKbNbhgadn3Y3cxpPbBLR0uPu86Lo0dYYhG45LUdgpP0p0lzWlff+Nr?=
 =?us-ascii?Q?Vi8vjguX0U2W9TnoCS1/03y+/QgLJ6avarU7i/3ntt2j7DK3BgHiEjBnzaq1?=
 =?us-ascii?Q?WO59/2ORHXLpy1yhp492lyaz6lCtLZnVVNrSh7Lqg7FPz39Ypvf+JqPn8zdr?=
 =?us-ascii?Q?UT4Nfkguruhen1zPRGAqGZR99cv0KUJtC/ri8Iu3inVsZqaXqJcba2W+TDBd?=
 =?us-ascii?Q?uc8lNC/46YJRhTWbVaIVMRxNmjgrn58KwwcEIPWnYvsqPsDjJgL9Be8wYHqy?=
 =?us-ascii?Q?CjEyV3mc8Poix9DT9aNR3n5U91j1oiva708rlLjacFT7MelP8E9pHEQi2iuJ?=
 =?us-ascii?Q?BWoH5XmtjavjdnHtzrDOyPpYSpczAD1UlS73GtASh7Binnvq/qXEyuJxU0ZL?=
 =?us-ascii?Q?4ScOut5wA4DHDl9eFlLgo3yeeUyNgUx01u8vMFwWzoVgRjyckWs0gDMaYlV7?=
 =?us-ascii?Q?kAkoFfEQL79UGbMEnlAuUFwZntLJFZPs04fDKQoa9A0PR6hdl5k0Vi+IUi0m?=
 =?us-ascii?Q?NUjNOnF5Ugz7c5qtp0Q8O9AEFCeJW1CJmj2jn8ELEaGQ9LUZ0OLX91IpEuLD?=
 =?us-ascii?Q?ymRJ2JxjErMRe0uebz4xw3HnTAa8SUBcPbKskBN2eNY1aACvUQorXsxHNIQv?=
 =?us-ascii?Q?fAhlJdUf8x5BTL3kwBX1axPGc10gv4tdK3pp+o3mVNal6jmivhqblmFS4zxi?=
 =?us-ascii?Q?0TUkJ7Vi2sSgjwClGtfTwT/Bci8zAyNFIT41qNHbmge+iUIKX4el4rFK1Wj9?=
 =?us-ascii?Q?XJ5dyTW8cfkrfSWazPTemi0K0hHQSrBr4+NtSfFV6Z9zDtiStR8+EOfJ+tVv?=
 =?us-ascii?Q?ePz4HiN7qFMqHjIMAzM4QMV830n3frM2Lpl5TXqx1I6KyBweF2TzFkwcMZ1T?=
 =?us-ascii?Q?sEAk82zwL5aOcvpve1nHeI8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d156b74-32e5-4698-09cc-08dda7d60699
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2025 04:19:43.3532
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A1gz7Ia2hpJd4V0sltborQM6GKGSUyT8sr0G4yarS683wYEoGxT4mZmRZFhwBYhnlBVyTnVESr0iEjgv5bzoZX9wtxTDKtACjHCpp0qJW1VSB0TZBHreYme7E3sVTbGB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10510

Current Kconfig menu at [ALSA for SoC audio support] has no rules.
So, some venders are using menu style, some venders are listed each drivers
on top page, etc. It is difficult to find target vender and/or drivers
because it is very random.

Let's standardize ASoC menu

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/amd/Kconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/amd/Kconfig b/sound/soc/amd/Kconfig
index c7daae392d746..b1c4dc95129bc 100644
--- a/sound/soc/amd/Kconfig
+++ b/sound/soc/amd/Kconfig
@@ -1,4 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
+menu "ASoC support for AMD"
+
 config SND_SOC_AMD_ACP
 	tristate "AMD Audio Coprocessor support"
 	help
@@ -185,3 +187,4 @@ config SND_SOC_AMD_PS_MACH
           If unsure select "N".
 
 endif
+endmenu
-- 
2.43.0

