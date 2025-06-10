Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010070.outbound.protection.outlook.com [52.101.229.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04A4625DB15
	for <linux-sound@vger.kernel.org>; Tue, 10 Jun 2025 04:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749529399; cv=fail; b=aMUje7yponp/OMQukU/KfhMof4NioqYwscO48Yl5k2h6o2GLN7vjfRz/d3VBMdNnnDjAX/2ZBe/+0xjMmo7Kme55CcTEg+p7kMCi5Pah1BLxXsjYrj5Jn5GQq83U1ytGMCAN0YQKKxJYKqHfaMdPbxX8dn1UQriv0Hi4scg8sw8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749529399; c=relaxed/simple;
	bh=iRcxR2Wy6eF3F9WePTChpJ7OSRahu5SaHzwjWbaKFWk=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=TMf+bhy/Rvh80KeuRpDtW3ELohU0NzBJTDS7pKQfAskfV9PUcK0lewLgX9fU7hCeLIrIsgWXi8EvukpCtkvHDfpA/fu7gYz3w1HAVlXeL6UGwZpApawroAGF1rpKmPDSGv9XXJ0RekmS5k+n89E8z6Z5ZfqD0LX+cfXd2Ex3Bxk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=RYbg7VMe; arc=fail smtp.client-ip=52.101.229.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="RYbg7VMe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l6c6Frpjh9eAI55ssMIhL8E27kXf13giv2rwRvAl0Z+ZjHwBaI4uT2TWwb1VxHPTzeNvrf3aZNmk8MxhdcO4N2Ydz/aW7YV69toUa4b8tXvEsjrvbQezdirlAHn4g6RRxCZZu8ZyOUgwNszUobXPTGrUSv1rANfb2XZSl74MywHkZWVI/9/O0inuuu2ecKfuOJNKwqb4l/bXVr2+DY19zbgb8rD4wzj9+6jLiMXDDk0R2UpkIb3nrMOEGiXrEKfQIw6wzGezNoT9eyWLWvNnBoxh+IFt6c/l7cBTmBxVdyYkERbVYtSXBIOiXHwfS6sWbyJNt8UEzdxMfJwuwD3fxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yZOw50ZKnmmbOIe0zlECxxM1Miw+uBipqlXMJnBYbdk=;
 b=cPc+kMA4C7X0yg9CXPF95USRsRhKNYAG1ZRH6g9pJyuAvJoSQoMmsiasbkb00D7FcIr70/lTR/pIduScP44MktOXXbAJBsvnixR4ZZpSNpstH4NTABu9185sXi6DtQmNBFaNS4iwLMGQKiRiPukoDBTCYJ6hYO5QcM74sISfbKpSQtE/5NA5Su1xmVWUubbbny8E/ds7WFvmWd0SjoOze2NY1dcduSsnpnV9mFEErp/5/JOChFrqt376UBQnZhO0uo5K5tSeDIIbJMDUZR4uXCTsWIBdnrYdcxq/sE+FdHl3IH5p9YemOKgeoejeMVuVrfNK5H8xV6+Bchy/dlp4kA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yZOw50ZKnmmbOIe0zlECxxM1Miw+uBipqlXMJnBYbdk=;
 b=RYbg7VMeW7Rp/lMz6hjQPgec6rhAhESQ1Bbmf0xk1BVwbacC9iU4OKXz3vBrekQ1RJLxnUUUfut7xhbS8xdXcWPyJvui7zwhJYt66wlGPsRliuQVgG6u92d9CMATtXcT8ahr5iypozlJ51iu9ZeVUlQhxeMBeDITbifhuY3MFMc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS9PR01MB12373.jpnprd01.prod.outlook.com
 (2603:1096:604:2e8::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.31; Tue, 10 Jun
 2025 04:23:16 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%6]) with mapi id 15.20.8813.024; Tue, 10 Jun 2025
 04:23:15 +0000
Message-ID: <871prs6x8s.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH 32/37] ASoC: mediatek: Standardize ASoC menu
In-Reply-To: <8734c8bf3l.wl-kuninori.morimoto.gx@renesas.com>
References: <8734c8bf3l.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 10 Jun 2025 04:23:15 +0000
X-ClientProxiedBy: TYCPR01CA0087.jpnprd01.prod.outlook.com
 (2603:1096:405:3::27) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS9PR01MB12373:EE_
X-MS-Office365-Filtering-Correlation-Id: fd4c8c1a-ba1e-4dc2-becf-08dda7d6854b
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|52116014|1800799024|38350700014|921020|41080700001;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+TAhNoWofxCUF3WWntZ7y39v0RgOvwGb6zORsgvjws1+kcBFnzZlRUzLI9YB?=
 =?us-ascii?Q?FeBqvINS/OWh8UA/EWRK6sHral0XeqeHqxkQR06ZyKZUpLTa9aqijDzLh4xE?=
 =?us-ascii?Q?RHYaAhAKCejMD2mZrW1gETDysgwkYDyjZpdIdx7j6iDbOWvquyx9zZn3wjbC?=
 =?us-ascii?Q?djlG1T+vidv3xcjce2JjPJeTeSiAfkfFEWxSQeyVhHwLUW6FHP+B6SreGp/I?=
 =?us-ascii?Q?PuRVaaKuXJgdYzwCwXguK0mpA5q8XMy3yr2/s+IqXdVw3aunjp0I5vKZ4sND?=
 =?us-ascii?Q?GuiP5sLCKoWQUanQXPvB8O+t6RzaQu6p/XFGHNo8bKDJWFfZ/Fu0TBIBvAwv?=
 =?us-ascii?Q?7tmge6jiC732LggA6y1/2XGJAf8RhBkg/meT4gTdHEx258dE4y0dIenkj+x2?=
 =?us-ascii?Q?QjnVdF8GDl31xC3F/4sl0IpDa07XS8N/q5wG9Z+9Bu6aMQmW+V26P3K/duPw?=
 =?us-ascii?Q?jY/bEmUYirSyJzXZEZmzHi01SydN0xvnE/HWJ7kkm+4vemA5UXn0r6xKkjee?=
 =?us-ascii?Q?7E9ta4LRpiHr+ZNH+wP0/uzl5KTaiRfO/UXsgL70/+J7jet1qO9auHSbhvsR?=
 =?us-ascii?Q?eqBchQ9p9B8l3+YXZEnHWuwyZkeM1RfzEWNhy7slR1fn50WBNlXfVwwG4HY/?=
 =?us-ascii?Q?Wq7PR4/HvPLBEDTt3MMbyad2X+asobjdH9zqDCI4kmJydp2LAkRYNyTXc79S?=
 =?us-ascii?Q?nofQNYmGrOhjWnButX8zffDLpiSHr/HV/9uYG5Fitvg7p6v5Z2/vvlkib4+B?=
 =?us-ascii?Q?eyEhvH7c6LQZ+d6tWIYaI0gUXrtI9p7m+SipMU6HLMYXin3g25CMRMat2kAc?=
 =?us-ascii?Q?RWcG7r9Vl2II2FaGFbmkCbKb6DwO5FObw2s451NBy5MByzcf7QHX7rjWrSN7?=
 =?us-ascii?Q?KB+JmocqIZJAZ0NbYyxIQCh8tedPOsgdHCrVRTwIUlxFPfUIciStjbIPMhWh?=
 =?us-ascii?Q?YKUVI1A5k2CUum281QrC46xv1QB7MyrWi1aZXhBgkKc/7ioR/gDf0GQnzZS/?=
 =?us-ascii?Q?HjUK+V6/PX8sZGiyTKMKp2+Zrq8P3TdytZvlwWpk/gOWTLawoP/drD2lHSf6?=
 =?us-ascii?Q?4/sMp+LoNoS6dQchX6fCdQx8/9eVpNPvzXchz1gQu7Ye1Wc6E8LaEtTdyt/T?=
 =?us-ascii?Q?Cj8h2GREZLiWZhSVLGPMRN4GjPo4GbrYCtsVeM0WBlhDf3fP6GMQLoqf3Ua7?=
 =?us-ascii?Q?i8vm9Eerbg6D5kHKaR1ZibuokruR6lvxntLmWjT7XChV5k1gMgPmNk6FXS9g?=
 =?us-ascii?Q?z2Z2jmZIwcHCO6DZ9wWlaEwt2sRx9FKrc6CYJ+NA6lJrL6j0eLTYEN6OfNrZ?=
 =?us-ascii?Q?LyYITFkzylOTDCMiejfwdZK7PLGoY1jm6C84miSb2f35radwMli8v8/+sNmW?=
 =?us-ascii?Q?SqL73e+RdzEhp5y9OOYjtv6txNAZBiS67NWbTWQPyRyEsJ/+nniWt9Jzqgzd?=
 =?us-ascii?Q?GTwkk8AD6NGA3wvb7B4pIhgo8duyOIDv+zQHd5ynbe0CbaoWxovEQnv/uxV9?=
 =?us-ascii?Q?mDk4YVEkcdWhTWTjWSrmBoGlz4pqkiCxYcFb97Q+o1v7Ezo9jHxxSuQhQw?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(52116014)(1800799024)(38350700014)(921020)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VNp8aYNPPmS9V1HMFC6UC3vjvRt9DlzjSnKDziaONwKk2e9HxUbgJkEktX8E?=
 =?us-ascii?Q?0WHZ/c86MRXGqcWroyDQbXTF+9kSXL7waaPFo2qgCVvPO5x8jxD+DT7lsIzn?=
 =?us-ascii?Q?vikbVbODAGHpsbOT2kQ/HsFsgARGAmYcL4yzBqkEzSxkEnWDLqC9gMBn2qNS?=
 =?us-ascii?Q?KnLifeerAX8L5yL+71IU6b5VSC2pXTIwLCkFjuvlvzd6HfntlUIk1B/Ajmqb?=
 =?us-ascii?Q?jZtlSEwNI7biUssUdYUGel2+IUiQW9mMZWoOUNpom7ZcRADIObxzhh8Xh35y?=
 =?us-ascii?Q?bNVCH0Gp/n8okX3lEI1jxsEe/0xpUBdADiSJdnF+sBIFEGKJs2U4pLOcNhmJ?=
 =?us-ascii?Q?m35VYGWuUts7TUvzsCJc3HCS+CVFUVJiiERilNhbPHutH30pci+zWbcZ3nXN?=
 =?us-ascii?Q?ckSC+jiM9amIWPCj4RA5RdkfE7Gshgul2N7XuMsofVuWeQPDTCjJ46d7bwAK?=
 =?us-ascii?Q?Zoj0OkDY5yoFDFTaf4LiD5L/blQiKGdKWOxD22zagSKlD+WJxQThjHojnAmc?=
 =?us-ascii?Q?HnZvLYBPZHMri38shlKFnzH/iknewIFc3HGjCjIP6btHNyXo5YauD99TvQ+d?=
 =?us-ascii?Q?t5hM79kmTbjWlCIU8caKMbYXGtLCzrC9OYYnmMt5bcvtOV4PmuTzxOFLyp7Q?=
 =?us-ascii?Q?nsCvb1nNXZd+hFJ18Q1F3j6Br13LGGKRIXmYPgMazYLM8ZAGh3e2l6MMGxxx?=
 =?us-ascii?Q?WVZoNM4bZVgcnPjTHnfrtEdS6zX9wyLwqiKUwuam140bYEO4//S6o1bDO2Z0?=
 =?us-ascii?Q?k+uUMwgy8IpYeduIYTvD8d94uRjx/56iatcf27NyvB5COfAfX7ZD2l5q/R+c?=
 =?us-ascii?Q?kN6PDh9PaTnKfMl/Fs1PiaLJi/WVeLkZ6Nc3Zn4Vz3+OcPwZpCxMAvcefsY9?=
 =?us-ascii?Q?ioA4A0Y1uyQouDZDlV7TSbB/4ECAo7DojJ/gANgfQ9uGEpNc31Y8y1lGp1M2?=
 =?us-ascii?Q?s1BecB6k7258pch5Nz9BqGwFhWDwcF7TJA8kLm9pYtZaEW4p18jMPmy6Yetp?=
 =?us-ascii?Q?mO9yx5GdEFWLou741BhpyEZIwWqxsaGyxtl8wOkLsNAchpsY48Xiv0v2a9dD?=
 =?us-ascii?Q?aYYROFrmzmQx/UTmiBA3KoG8JCHxpioGi4F1LtOw82yfiHMXAtBzZcifyhOt?=
 =?us-ascii?Q?TEldT3KbV0HHpO9WE3DE2jk3b1iG0ypqutOvnpX8VvdaDmy7cY2ipV/xhVDF?=
 =?us-ascii?Q?p70pYysqsQg5QC70G0C6IemD+f7kAMxn1uitQ6PoeJMZ5gK8H2Aij54YCf+4?=
 =?us-ascii?Q?xJhBvHaF+EMOmNQyNFOVkovco20gku8FbxAa2phfWzDiCrY7T/gEOWWGVFIZ?=
 =?us-ascii?Q?bVledOeDLtpW9ihhHIzUoFSvZBwwB4Mq04SMMqWj3v6CMZujjman+knIYipu?=
 =?us-ascii?Q?TpFVQv+NbrVUZHaY1kF2I8vjyyZQbfzmCrzMiO6nN2dnsj9bkUyQNIN54Out?=
 =?us-ascii?Q?XqjDmmP190uWuxGK/KqGPiPfPwp8vDu4alGCCPsLWY0fHmnl1+4gdLGPTgNP?=
 =?us-ascii?Q?IkFOLLnZs3IAWAwOryB5nouA+0tKnUStfOe2I1MeNP170KpBT4KYsjmvX13g?=
 =?us-ascii?Q?fdoqDJNUCO5KnVJSHYjYr37MTuwUQ2TM2YXIKC5YN4A16P1149s8gVGgr+PX?=
 =?us-ascii?Q?FoPooD21NAkvLkMmUEQsyqY=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd4c8c1a-ba1e-4dc2-becf-08dda7d6854b
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2025 04:23:15.8910
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /2kWwnDquNeuIUTZutjvwumivGXuRpAwSs3c82L1/9NFcx1je3gr2GnHxl38GM+CIEI/Gkbglp8fh+Ue8WoTNo9EnIU4q1wgmJf1mN2czKVMcWHq53bJuEC8VI/fsUy7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB12373

Current Kconfig menu at [ALSA for SoC audio support] has no rules.
So, some venders are using menu style, some venders are listed each drivers
on top page, etc. It is difficult to find target vender and/or drivers
because it is very random.

Let's standardize ASoC menu

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/mediatek/Kconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/mediatek/Kconfig b/sound/soc/mediatek/Kconfig
index 90e367586493d..9dfaf3d1dde66 100644
--- a/sound/soc/mediatek/Kconfig
+++ b/sound/soc/mediatek/Kconfig
@@ -1,4 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
+menu "ASoC support for Mediatek"
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

