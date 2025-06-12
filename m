Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010067.outbound.protection.outlook.com [52.101.228.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20AE672637
	for <linux-sound@vger.kernel.org>; Thu, 12 Jun 2025 01:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749692595; cv=fail; b=ci1BhUHptr3xuzFgbJN3ojn/PZNolzLKeQQzx9/w3Pa9hx17Thle48vJw+DDNQYzhsheGHNYQSWgIRL5QkNhBxrr62hYR7br306agBBrIPC1uD15l/BquZrrl9cMFxutqN4WpBd7lPrJbHRWYLcRtanXEDKl6yGCyh654+Fuews=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749692595; c=relaxed/simple;
	bh=PllPb1Rm7uwobv7x+CZHIBp5M8HLBeex9i/BZd1Pfnc=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=PrkUG9Ia5m69/jgSzWAjV/kWQbCn+DSiUsa/pEVvI1bNJUBNNGE8IohgT9vZmb50Hdu4qKEUqQTk9fu9yTOOh/mn35WFziTyG8m6PjZZXPtajPLztsGHE86v2fEfi+Y0LI8fMc+57t9ijkd293GH1bbRFtAr/KSvLsh8XvOnn5g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=aH6W85TQ; arc=fail smtp.client-ip=52.101.228.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="aH6W85TQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SZsdx0z/P8TN/KBTsD8UrzRlDJzWEMuNWrSnqqELG+vJCdL26mckAfKcWOhtFUUfcPwI8tCeZ8iF8qm2W3yCi+OPtr8Kv5IhHVfWmZ59eVsi+sYNOxlrieFJnseA/s8U7w7P1SdcYwKaejLtJfnbgsbkFaDJzzP7SVU7GObHTiynufdVFsPdBjT9QDAOk6Cfk0lZC//Qrrk4PwLtUpYgDGBAizaIwD0T9pbzWnhj3DLjh+bVB0CfkYd9TWU3vXx6wJ49QFoK95JnZ7mGtjeHSjRFnMXapO4PG7+rx1gQKts0zP93t/Qa0yIXGbBKMH8qZDF/VCtkLIz+yuog+luQHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uC3QB35vihUoXodSx+4pDPg96SPsb7tA0wMFeTQb9+s=;
 b=mlkZt4tZZnIlju26JVQk92hakyiI/UC5xV1JNJIbl6ewppbTu1aNRUBdgNiIaLI2y4Hr/iryx75ooOI2UEse3EdlyyD471rUQ6YMGx2FASyofJXUaSODXSzJm+zJJLh4YSVBBZ0ueDQzSpkRGOHaBAn+kCZ8a9USdMLNbzWcxBD+UK9L7ppwGn4y7tnTp9yU0SobSR3gpsyvoFR38JP+YBJOlGinoyGfFlk/ydUN2qvjSKqaNd2VlMoGLD6bctQX/0ZhWw9DZQbCyTm/kocBtUAADqnj7uXQHNbJlluyzE+c7BY3EggwKFow3/uF4JHvRR1gcN5LRnDkNj6V4pqhSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uC3QB35vihUoXodSx+4pDPg96SPsb7tA0wMFeTQb9+s=;
 b=aH6W85TQ4y0aVdvqmHlTjxqSicH0R29H2Os0QDBNLUFkKmNfYODbCNIMdqnl5eONBHJV65SJfxyaG/Fu0KZskd8XMM6KQMxKRTGKrObEw+149H5zw5jNb8OkSZuIKMJOoTLyon8S3jxK2aw+2doYNr88Bur2CcD3dmfWct3Zk0U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYRPR01MB15122.jpnprd01.prod.outlook.com
 (2603:1096:405:227::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Thu, 12 Jun
 2025 01:43:12 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8835.019; Thu, 12 Jun 2025
 01:43:12 +0000
Message-ID: <87h60lzqds.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 17/39] ASoC: meson: Standardize ASoC menu
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
Date: Thu, 12 Jun 2025 01:43:11 +0000
X-ClientProxiedBy: TYCP286CA0138.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31b::13) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYRPR01MB15122:EE_
X-MS-Office365-Filtering-Correlation-Id: 86d835c6-ea16-416f-f953-08dda9527dd7
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|7416014|38350700014|921020|41080700001;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?x5UAwhLpGTgEovWLdpstHbYeLkLV7de9W8UaRR8fdlyR6v5A/TVWDBsv8G+4?=
 =?us-ascii?Q?CrBjs1fHMuF8ggWCcpLIOnuYBleK5ECHwMKKTuRgEns2t4al0NSfZqT/L5pw?=
 =?us-ascii?Q?swLc+Y6tFhodbbzfPe/CmjmEJUcVVZme3l2qDBrgwIWzIvAztY7gVa7aNgXZ?=
 =?us-ascii?Q?KfYxHumguzOwhh0hbNRfyPSpRas8iZOkehI8AeI97nkbSyRwELOP4YEPHT4L?=
 =?us-ascii?Q?Ejr6X/osXipUNCuYGs4cAzqZXCDWYaG57tfRptP6slSj48cCeziYTbhx6Byh?=
 =?us-ascii?Q?kxKH/vTSqOTj8PibOXbVLgmifMZkJYjf5VlIg1yY+LwCBflA/EGn4pP1K4Ub?=
 =?us-ascii?Q?xr9828wf5dJOoA48+wXxSwsq9IlC7luOrZOIdN7XCaI5Qi9Lr3C2SRH7o76n?=
 =?us-ascii?Q?1NEWoo6fQ7mGSNbWgkKCEfdYAlp5eEs9DJq8KbxWVwd5o0ZmehhrmR97MDiX?=
 =?us-ascii?Q?/48sf4ENgn+qkBeFUkCkY7eB+/9NCHnoMLCUYi54MudJclYI0Q57B0GHdC/h?=
 =?us-ascii?Q?PJPVC38bEqJ9ju67RSx0LsUa2UZo3bTkzS9upB9fM0+rlOWChg+XQdG3sHWr?=
 =?us-ascii?Q?fM6NyQWaqrxGxK6MVkDyL4457Fk5CJJn/GXbTdpQRByHbk2/2VFu45T1g7oJ?=
 =?us-ascii?Q?1hFSKTI1VVAwKRGrl22S9O9oit9+nip3dzZplObM+fFVKvQoOFgkUMJ3JUX6?=
 =?us-ascii?Q?Vi5qdTLWBUOnAR7xEclgLIaRcL+4mr7LUC3PW0i1AhoYdruiNcQb9IPasdWI?=
 =?us-ascii?Q?xt28bzqT7Y3oOYjIWkie3O4q0WRKCejRBRzuJmOZ+iqeLLcTkkWmSm4PcL4o?=
 =?us-ascii?Q?PoljGpTzLHcLFo7gLnLOc16e9Q8xT82iMVnkph5e5xCaxSeQgqqwcw9GqVYF?=
 =?us-ascii?Q?3+pQKTFESMMpaIlSrEiTbYGGBcRqK33UfH5aJj9KazUidLvFxaDMn+xoEOBR?=
 =?us-ascii?Q?Gk+fPr6QmJA56QVlZoMe/kX+snkkuEHOMa5KxUAWLjyr2Nb2SSiRw4f35iCz?=
 =?us-ascii?Q?KuCUw4JClZQy1kjUWVmDC0XoQ7CQlVPIl9qn/ktZSE+R1UNSHX4Z1FRCetoo?=
 =?us-ascii?Q?omSfGQ+Sdg9PVdJhQpd6ULlif8tBsri0BqfvI/UKeYYndvJLwhlpU3/n1uGe?=
 =?us-ascii?Q?oTEwBWL972NXqOT9K5XaGb3G4GEz1yqkuyESQI3Z2Z/LFK4/ujSSM29rn/eq?=
 =?us-ascii?Q?6u9Xr3JGN/Qyfz1fpW6Q4k/si666iS4GnemsnDxJjaJb1RTsgLVsDKPSjo7r?=
 =?us-ascii?Q?93uQhsSpF8IQDOMP3AmYEb2XQ0R6+A4VUT6b4IEM5hgvX3/klhaai3krKoj5?=
 =?us-ascii?Q?n2mvSdGflHq4squo7pKFsEHZWLzR3u4AVqarlNCuE27mupfKR+uMQOQXAKL9?=
 =?us-ascii?Q?b7oGTz7z7yvaiciMnghbcO6KRqDsNSvXSyVJQFcJwqwu8hYTtZyn4k8gx8ep?=
 =?us-ascii?Q?/0iCm6pzhTxfl1/GPirRjiLIj0JgtC/Pdg9tcAUR+SuOXQsltpPBL0ugLLf6?=
 =?us-ascii?Q?9Bt1QIAEOPTD9AmxaP8+G35OdRjJ/UmrqtdNmooqs5ciRJ2pqeDPd5oOdw?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(7416014)(38350700014)(921020)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Ovff6MnFcr3XRhKOv12TElUyTwLAe5czEzhy2PRbWNEm5nDhS1hL6+oK13TV?=
 =?us-ascii?Q?ph0maReTf/O8KyuOm/XaI+J4qGhp3+PbcAN312sbMaOkMPemlwOR5PTHNGgQ?=
 =?us-ascii?Q?1pzwXUDFkIo1tCQBvY30R/7rniMwuIXEdKb+09fBsp/1/BSSn+97HRDduLYD?=
 =?us-ascii?Q?Nj4f7Vt8ZcB5iJwryBXzZ1GEiNPcwcueQ0+6qB3NjjflwuvcgihGD5vWxr1p?=
 =?us-ascii?Q?KMolLqFOJTxeu1O5VKpJ6JNmmiylV5f/bgRcwMYtLK2fuPDFIvxy6uUOjNlB?=
 =?us-ascii?Q?OQ4jqWkXSjKrTvrAEm6K/8A2u4ESL68lBaIuzmaw0wHvuWp1OZfA0TIjpj9D?=
 =?us-ascii?Q?WDm9W3KN9OFbEL+Cscd+qMqmw36gSdBfVCYIbreA5uAb3vGFK49SW2Rp8SFb?=
 =?us-ascii?Q?0glywoHul4VMPUHStB7nUrWBpmF0wCoziU4uo6WMdYcMp3zlarY9MfteVjGX?=
 =?us-ascii?Q?ecx5vxT149cmFXa5bHL50/YVZXMBwf14NVpKmaWa7uLsLNYDGT5AuAwhTH4D?=
 =?us-ascii?Q?2dZZvMhB17OduNltqr4GO3QraiUZYffRCfmXM45Y4cb+OH1wsrZzmR9IjcNG?=
 =?us-ascii?Q?6UbLDNeZoHs2I/qHvwfw0BCKvRUo+ReruO1h/q0aXt1DF1mFfrlCjPIQVVtK?=
 =?us-ascii?Q?ocqaxSf+diohIU028N9h3aFJ+855wPXX82HJKqqeSYtoEQc1Y1Hb+SBB0cCQ?=
 =?us-ascii?Q?X/7Ha5+LUmUDPsVE9+Cc1+saaf/EP+JRntYU6m+pCCBuKiJx28wiz2twKchw?=
 =?us-ascii?Q?LJ++itWDt8wOSNE3K7BygaY1a5ctpkrxLTTyXjvqHlZkK6vvnRlx4QNnm/k+?=
 =?us-ascii?Q?sVZr1dqodWDTyIUpfK+prLi8Jj+jSFYrDB0vsuemNVOfawSuTvy4OwwHPeEx?=
 =?us-ascii?Q?HmqoHm1ecRB3YnCwnL7VFxh4w5NrDZJy0JNVvIx+QPfacm2YOBXPWaL4ox0H?=
 =?us-ascii?Q?NIg8AWArHqNmwFhNwTW5g0f895B6MqQoMcPPpsrvfqkkfKd31Ty4tEAlrCe1?=
 =?us-ascii?Q?ozHRohW+3LSnmskNpMc+UPm9eKovhYoRbfEn1MKN69k0xMqX70iOznw7trpW?=
 =?us-ascii?Q?r5nIs3Ezrx1NOdayKINhofltemfMLOAUbsL11IPPiVmtm17qnAy3RZmQpwbm?=
 =?us-ascii?Q?aNi8RfjpU0xbuxiPexUJ/LRM7In7xedcA6ZQ8u7G+rMEQ2taOKXGa40UWByK?=
 =?us-ascii?Q?99J1qbd0aiwbnaZuk88vdUBs6QQ4yoYgyqip9sTvNVQB5umf6LDsEc2Ql4oR?=
 =?us-ascii?Q?LvMvb9t8t71jNPNO94zhjgXrsCBfSYS2VCeMbrHRkiYWacRj/9DF5sJy9lkT?=
 =?us-ascii?Q?5PS7256OczA55Q+ZI2Rr9r41ZLF9VpTIBR6V77nlubAqgxXiCsrIhhU0lGWl?=
 =?us-ascii?Q?CJlQ8qGbOWUBObqwo/R3vj1fOZAXJhjyxNMQPmyZnLj5RaqwfzFEStAIC5Vr?=
 =?us-ascii?Q?1VbmPanojkPGT9AGl+pAjag8w+XnYEO9slY/voYDD4tVYEs4UgCM8hwyVzUd?=
 =?us-ascii?Q?3A3ECOHWHrwaowmpeuSW5pw5AXB3WMMVgM1PO+OvwrziJnRSqwCSCDI3C6jc?=
 =?us-ascii?Q?gpLXYxFZFNM7Qkx+teKoexpiBG0YLjz+hbj+LU3zwlsi277bElcSb2ZAAZZx?=
 =?us-ascii?Q?MrKkVmSweFKSzan4BdCQE/o=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86d835c6-ea16-416f-f953-08dda9527dd7
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 01:43:12.1605
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gNT6R6IwgF5TOHJpAt6WBjMlTLadwLGRJ4i20b7oswh4NCoCQn3g8v7chPwA3VkoHrIZQpDuCAAYZsoedAuWOklnxSdt+1Mk4NEfwgozlg8XpfUYbvkxOP7lwhKepzIh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB15122

Current Kconfig menu at [ALSA for SoC audio support] has no rules.
So, some venders are using menu style, some venders are listed each drivers
on top page, etc. It is difficult to find target vender and/or drivers
because it is very random.

Let's standardize ASoC menu

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/meson/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/meson/Kconfig b/sound/soc/meson/Kconfig
index 6458d5dc4902f..d9a730994a2a2 100644
--- a/sound/soc/meson/Kconfig
+++ b/sound/soc/meson/Kconfig
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
-menu "ASoC support for Amlogic platforms"
+menu "Amlogic"
 	depends on ARCH_MESON || (COMPILE_TEST && COMMON_CLK)
 
 config SND_MESON_AIU
-- 
2.43.0

