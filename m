Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011016.outbound.protection.outlook.com [40.107.74.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BEF025DB15
	for <linux-sound@vger.kernel.org>; Tue, 10 Jun 2025 04:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749529405; cv=fail; b=s0qY1sWVvWcMM+JPm8UEoKv1KdciGdpRef1m0vtbLOUK38hJTzvwfs1cF6kyZwPo06VrAktjiPkFw9kqVIFCO0Xoesqxy5SHjAWnQSaPhGmfXFkBqEwBUCjV1bu/bTkad33111J4vbNwa6Z/TENXdthTPlYyi/nmnGEoUhvItbQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749529405; c=relaxed/simple;
	bh=BsZc51TYmeEhe8M2yRTR8j+f5xyshP6QRcn4MKLvykU=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=V4RRNOu02nNZcYrGwzbEUjzF/TtuZobT2Bx1A08inORfBoAnzvvZsUuY5HKV/QQh/TgbvGrOr2CNQd+Q+nwW9hYSMYi7y6eDvqA0DOWrkCNIMYXX5154+0TWcKnOhr4PIehIVWB3fPg1VKPhqZNrb7u/hiEkQdNKtIqzMm+u+7I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Q0VFMZ1/; arc=fail smtp.client-ip=40.107.74.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Q0VFMZ1/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k3xcFRBn48qKyRU2Vx6Y8xJTzGjn6r2lfHtaQyErKFkwWdvFM8uW203/G0oFPbcUODEw+h/hIq3EVUnWpsdqPKTeqtHuHK5Z4PPayvhH0Li6eItSAkbNC5+1+HQzkduutwTADRtZxvnGDVbnk/L11ptPUYLoz0SRLdVW6WMHZ0G0ynh2e8cESldBwznHugAnuO03uE4lVi+3e+2io8aRcY03R5OCqeSFmvaAAdE+zRzmgEfkRqEknGU0N3hbs7cv3didGawkXHRiXL99H3Rc7+7OfUtC8e5tmH8QykSyJcxFHCEE+PZndKrH4CSMte5yAOUO/q+yqSTJkTx2R8Pzyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Ds77sv7tdxjxjhlk0YNw5Lwed5CNwS1HHfnkQ8vC/Y=;
 b=WE4JDbKKyWKmHf4g58XRWVwq7G1dBzBkR1n3s1ytpA7/eO5mOFGwD6Xh26WwkX1Mcafn0BWe94Z6dABS3M5MzXOXL8ZEKcinmdfrOdzrVIYAk+zNxKcN0G4QkAlrvNAz3lxESrkyb/L/p7YpavOyNtpzGDswULk6PyPkIAB3WgLTyHnIWWgdsbvSYol/gJLYJ1c8UeZPIFQMQ2mUtlF+vwnQjxv2dZvtyEqpgUEdILx4MJZTgPbPXAFm7WI+OFcHxjPQJXkmhMbj4l3uBj4u0B0Dn5n78PlJzZrpUoQuyKVq4pncx4KIIDdPobUdNad0BkclYKpXSddMqMDp5vJ4iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/Ds77sv7tdxjxjhlk0YNw5Lwed5CNwS1HHfnkQ8vC/Y=;
 b=Q0VFMZ1/oECaYZtsGpJ7pVMFLAbpllYZfHuBFAaTw+soc8ZwpbUoU/Kl/Q4ap8gJUu1jA4sQ0awYMSUZjIupdKDoVub+T90IZDdkjZBUtRzBQQ7rXuJcKArNwL71gehVjg5crFQCfFGq4AuNCtH3UxgdkYFYXZI+SPef9IghBfw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS9PR01MB12373.jpnprd01.prod.outlook.com
 (2603:1096:604:2e8::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.31; Tue, 10 Jun
 2025 04:23:21 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%6]) with mapi id 15.20.8813.024; Tue, 10 Jun 2025
 04:23:21 +0000
Message-ID: <87zfeg5io7.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH 33/37] ASoC: rockchip: Standardize ASoC menu
In-Reply-To: <8734c8bf3l.wl-kuninori.morimoto.gx@renesas.com>
References: <8734c8bf3l.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 10 Jun 2025 04:23:20 +0000
X-ClientProxiedBy: TYCP286CA0142.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31b::18) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS9PR01MB12373:EE_
X-MS-Office365-Filtering-Correlation-Id: d6f20bd9-dc73-4379-c830-08dda7d688a0
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|52116014|1800799024|38350700014|921020|41080700001;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?t4RNAcfd/W/axcTv5sMFx/kyebZSctklziNdbbX1miWu3V5+ga/ts18LMy/X?=
 =?us-ascii?Q?YSDbjHRCM9fA39437THRXjxVaxL0vf8vn9CrNE3KKGZtOar+qAVtXOisFAn9?=
 =?us-ascii?Q?Kg6QJ9i1V2tWJAJB8xpgrbyvh0KaioY33NHyRK+tFQ+iytsp7+kjpmmEMp82?=
 =?us-ascii?Q?ov0ogqKpOq2JDRlnPlTODXkBQQV35BHQLb4nYNMz4JaXojDLl1OS8cRwHhOZ?=
 =?us-ascii?Q?okBWkSj2wv73bxnHe3iHJ490W4XZ5vfisvuow4Vzeb0rDzGTm0BcPcmTWnuA?=
 =?us-ascii?Q?pOBSp2UZ50Kqv8u7jiu2Arp+/5Rf6d8Af9mq07+dmcxoodXyYuK3ITUigrhB?=
 =?us-ascii?Q?EZq88UklGmzz4WD+difGnC6sVQnDDldZ5ajElkJwEvJ968EmWUKgeVLs8zeB?=
 =?us-ascii?Q?b/q0MyZ4qxi9aK+MqW91Jbto9N6iEdsR+u8BzFdzB1R6LdkZiQygL9q75TLN?=
 =?us-ascii?Q?5K8doY2UpzrFzTFf32MhfgI5W6vNGEYaHVuchXpDmTzUC2XWSt6IOk7RnhT2?=
 =?us-ascii?Q?QYHvM4HYMAzFpA7IevMPa5njloZkmBAe925fcKZva0QEo0jpcrb/sguS2Q5q?=
 =?us-ascii?Q?lP5tUiXuLeKoRfJKyJvXz1htnx1Su11A5IvGUcco3r1NO3VPGwr8T10OuXJ2?=
 =?us-ascii?Q?MW3NKnbmOXUYHoUUK18UvpjXg0BrqYYmruZqBCwnhvTaQ2umq7SeH8qC0yFY?=
 =?us-ascii?Q?V3qGdOgnQ2Uk7dvlVhNfQw4DndBqI9RdQeB89Il4RWToHgyjAH6YO7S9qpxS?=
 =?us-ascii?Q?wgOlMfyHdx066b+z+4HWS6jJrAjCohgTeRznWU4qbDCphkNF8aNMaboKpDo5?=
 =?us-ascii?Q?IqWePtiAhDuB8KbKJqwLFpa4krNoFIYrT+Ii8hvFFiy7DzwcdGAhoUR6Bsna?=
 =?us-ascii?Q?EyT+4PgIlL4DX5yVFeWN1F0PNcc/zURfI8PICo0nGUQlS8Apsyo+mnoY7eEM?=
 =?us-ascii?Q?LwPRiyuEq7OPBSUsyhYW0r39MIqkpg5Cf+7R8digN8fDwaSVr7bwI03rd+iz?=
 =?us-ascii?Q?jyKM/aRvVbHFX6GtWCUvUAM71Y8/PX3cftsJ4GqeZx4BjQFhDqfWCdFmdPfx?=
 =?us-ascii?Q?FH5xASyN9Bd83HC+Vd51RbeICC5XO+nNHPFyUMvTl2SQUYGg4Bo5wxjoftxy?=
 =?us-ascii?Q?wYfUEaiPDsJozIJjxcuJRxScZ+LGkZBD3pHbEobmzPM+iFit7pmWTNOlgCx+?=
 =?us-ascii?Q?EeY0OaNLkn6MwnDlts94NImKUcyXr2WpucQaL1vU46JrYYUuH31RvL3eQ0NR?=
 =?us-ascii?Q?sQnvqkFj4ZaBNuqoSKBJhz5hnGMn4TNGXJdGTwes04cL9xUYMfkSMwI9VLcT?=
 =?us-ascii?Q?eebw24Bfzm/NMKqpCcoqoAB2HtnA3EEKgAlV2UD+b5xjO6VqK9Jy7wZtqCWC?=
 =?us-ascii?Q?aX0xVGYQlp+2bQ1YDCBdTj69H/TNuIH0hQgO7Y/Rce3gmwlHQZUgykSsT40t?=
 =?us-ascii?Q?1FbUzQiJLSJv1Ewqz3OGAXGt0j9Wi7wgZfrx9Ud+80qJSBn62q4h6nyWgldi?=
 =?us-ascii?Q?vM+/cAqsZy+7KN+T88cV7yfjt8+2B8iodeLMnMenle+8mDNWWA+lgiAzVA?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(52116014)(1800799024)(38350700014)(921020)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Gjm7DqGK8zP2RN0aUQJtxNLbGIjpUuVwOnO4pcHw9V+K+ej2buuwtypEGRYR?=
 =?us-ascii?Q?sQvHzmJngK+wIqStbyohzxfoO94crYce7ZTgWowka6rJ0VqGUiJE7NKQRHW4?=
 =?us-ascii?Q?rhV6uFY+qtVme2IbggXTQzBiC7Q6apFWPZL4qyTdxoWET4qqWy4CGzp6lbCf?=
 =?us-ascii?Q?IUo2cOev1MkCu3vC4FdhZVvEgudg0cPAbhVWor0Ro7Kha1Jzs6pgGW04v+8C?=
 =?us-ascii?Q?lTL1w1/KCecoYBMTbI6r8Nf3FvtQgPxU/mVU3gg4cds2/sCQ+RMjgmA5+wKm?=
 =?us-ascii?Q?rXcDhqooxxYQ663rSl0dB1du3J2YwRGs9LCa82jhRfEcDXePnlOqKjrDZuU7?=
 =?us-ascii?Q?dLYfmlyrx0+6WIYqlb8ugXUOTl6PcBo6y1Ttj7gUqrvGVA2hGs0ihphcCPR4?=
 =?us-ascii?Q?XlkGD8hXdX8gNQZHUAyRg/nevk7z8ve1074WmwBsqKsgyx0N9+AuHAw5mtTP?=
 =?us-ascii?Q?Uz2Bf9fmv1R8JM/I5Rli6HW5Pqt2cKepRIGV70nvOoZ99BhLfxfEVu1YKmN6?=
 =?us-ascii?Q?Wubbs87a3hTB3txSqIxCZ4i6T7OoGnjCfD3rfoOoXREIZXgfP73HZ0/9Ny8e?=
 =?us-ascii?Q?xttQQwSDiliyRlTbpofIaAhEoGZz5is+qxOOnJ9ZHJnTqQbDvKlaHe6O2oF0?=
 =?us-ascii?Q?/3AkaS8EsrJ7FI0zIfvCXuQo+/Qg/aZWhL/pihenXIEomnigvrw/jzOP0RLX?=
 =?us-ascii?Q?AI8s3jF207F+LGF9IbGn56MKhOV5M9lpNV+hThQzMxLPhnFmVFKBuNH+rWGf?=
 =?us-ascii?Q?3DRx2R8xfVuHq7o8FOMFKsV3/eLjblZqTCilqbCGeushjT5QHxfdnj4qR2px?=
 =?us-ascii?Q?tyQ+eDaAOyzFQWXdPNHWrPstPg94UfBhjcbwZkvfpvdJ+gILQZGxC/La4tNB?=
 =?us-ascii?Q?PhSpHNm/4VMS8uuh/tLorcBjEYcnIdNQjiz53tu3WavQAo6AcdgwcLlhl3Cj?=
 =?us-ascii?Q?R69RiksbdYxX71W2FRhGYRHURU8Tt4Z40rzZ6fF5t9cdrKmguLxsZa6L8Z2b?=
 =?us-ascii?Q?OAgpQL2X6NolY7//L6BSqJPeOxgBwX3DnrXy1IDgiERvAy/9uXHeTxfHdIAg?=
 =?us-ascii?Q?Jy0CuLmB/ugUy4OCRbgMX6Bozihlbe8YT+M5UBiM73JHEqLUdPPNEdcpfZbi?=
 =?us-ascii?Q?m8bONPp2v6rt6lnCcVYBo/o/N7HAKiQDlAtvUSdG8IHlYR6iPIZ/Zjn/XJSc?=
 =?us-ascii?Q?RY1EdrI2nquVtF7wMbJVkIYRz5ICZOUXa6BVAis8sJta7VOS70PNtOZHNkWk?=
 =?us-ascii?Q?vzTVxBPD6wZL26umTOvSKhB9Kcgsc/01plxZuRTVFy1ik9XO+Gik8NonM7Wj?=
 =?us-ascii?Q?ltGdCQ/kYtOboI90AgEgZhe7eSu6a8FaVuG5eejIVLjdVzqbHBChzLTFQEJ+?=
 =?us-ascii?Q?khp0N19dTnOs2utZ5m/XUqnNAsLToYvzM72pr6WNp8SbHPgupzumlOQUJVdq?=
 =?us-ascii?Q?VmHWsqLveR52NTXgzWx8rneCOmd4yLDF2oCv+UsfBiButnNzVi4DKCAHabZe?=
 =?us-ascii?Q?yCh/MilsHGA8fIGbfPo8WiDtlhTvlBlzpwABwLf5UGhbBtxqw0fdi5WmJO7Y?=
 =?us-ascii?Q?cMk4nGC88VVXv7qvQPO7nkH8582kRMYmZ8SV3Yq3qmyRzakNLvrgab0gd9js?=
 =?us-ascii?Q?KK0KIfHilbKwy70+fEyPQbU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6f20bd9-dc73-4379-c830-08dda7d688a0
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2025 04:23:21.4972
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HRk7zATKG/uW9dwgHV6kr3Z+wBlA/rE88E7QMFgNd6mT7dOM3AMetfQdYt2r3l3dnPUTGh5Fgr1BitxAcN4u17mqUriMjQsJAxqx7yowuqgt4AX53Tl+wSHxwRMAy2fX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB12373

Current Kconfig menu at [ALSA for SoC audio support] has no rules.
So, some venders are using menu style, some venders are listed each drivers
on top page, etc. It is difficult to find target vender and/or drivers
because it is very random.

Let's standardize ASoC menu

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/rockchip/Kconfig | 23 ++++++++---------------
 1 file changed, 8 insertions(+), 15 deletions(-)

diff --git a/sound/soc/rockchip/Kconfig b/sound/soc/rockchip/Kconfig
index a08544827b2a3..b39b32d7bbc54 100644
--- a/sound/soc/rockchip/Kconfig
+++ b/sound/soc/rockchip/Kconfig
@@ -1,15 +1,10 @@
 # SPDX-License-Identifier: GPL-2.0-only
-config SND_SOC_ROCKCHIP
-	tristate "ASoC support for Rockchip"
+menu "ASoC support for Rockchip"
 	depends on COMPILE_TEST || ARCH_ROCKCHIP
-	help
-	  Say Y or M if you want to add support for codecs attached to
-	  the Rockchip SoCs' Audio interfaces. You will also need to
-	  select the audio interfaces to support below.
+	depends on HAVE_CLK
 
 config SND_SOC_ROCKCHIP_I2S
 	tristate "Rockchip I2S Device Driver"
-	depends on HAVE_CLK && SND_SOC_ROCKCHIP
 	select SND_SOC_GENERIC_DMAENGINE_PCM
 	help
 	  Say Y or M if you want to add support for I2S driver for
@@ -18,7 +13,6 @@ config SND_SOC_ROCKCHIP_I2S
 
 config SND_SOC_ROCKCHIP_I2S_TDM
 	tristate "Rockchip I2S/TDM Device Driver"
-	depends on HAVE_CLK && SND_SOC_ROCKCHIP
 	select SND_SOC_GENERIC_DMAENGINE_PCM
 	help
 	  Say Y or M if you want to add support for the I2S/TDM driver for
@@ -29,7 +23,6 @@ config SND_SOC_ROCKCHIP_I2S_TDM
 
 config SND_SOC_ROCKCHIP_PDM
 	tristate "Rockchip PDM Controller Driver"
-	depends on HAVE_CLK && SND_SOC_ROCKCHIP
 	select SND_SOC_GENERIC_DMAENGINE_PCM
 	select RATIONAL
 	help
@@ -39,7 +32,6 @@ config SND_SOC_ROCKCHIP_PDM
 
 config SND_SOC_ROCKCHIP_SAI
 	tristate "Rockchip SAI Controller Driver"
-	depends on HAVE_CLK && SND_SOC_ROCKCHIP
 	select SND_SOC_GENERIC_DMAENGINE_PCM
 	help
 	  Say Y or M if you want to add support for the Rockchip Serial Audio
@@ -49,7 +41,6 @@ config SND_SOC_ROCKCHIP_SAI
 
 config SND_SOC_ROCKCHIP_SPDIF
 	tristate "Rockchip SPDIF Device Driver"
-	depends on HAVE_CLK && SND_SOC_ROCKCHIP
 	select SND_SOC_GENERIC_DMAENGINE_PCM
 	help
 	  Say Y or M if you want to add support for SPDIF driver for
@@ -57,7 +48,7 @@ config SND_SOC_ROCKCHIP_SPDIF
 
 config SND_SOC_ROCKCHIP_MAX98090
 	tristate "ASoC support for Rockchip boards using a MAX98090 codec"
-	depends on SND_SOC_ROCKCHIP && I2C && GPIOLIB && HAVE_CLK
+	depends on I2C && GPIOLIB
 	select SND_SOC_ROCKCHIP_I2S
 	select SND_SOC_MAX98090
 	select SND_SOC_TS3A227E
@@ -68,7 +59,7 @@ config SND_SOC_ROCKCHIP_MAX98090
 
 config SND_SOC_ROCKCHIP_RT5645
 	tristate "ASoC support for Rockchip boards using a RT5645/RT5650 codec"
-	depends on SND_SOC_ROCKCHIP && I2C && GPIOLIB && HAVE_CLK
+	depends on I2C && GPIOLIB
 	select SND_SOC_ROCKCHIP_I2S
 	select SND_SOC_RT5645
 	help
@@ -77,7 +68,7 @@ config SND_SOC_ROCKCHIP_RT5645
 
 config SND_SOC_RK3288_HDMI_ANALOG
 	tristate "ASoC support multiple codecs for Rockchip RK3288 boards"
-	depends on SND_SOC_ROCKCHIP && I2C && GPIOLIB && HAVE_CLK
+	depends on I2C && GPIOLIB
 	select SND_SOC_ROCKCHIP_I2S
 	select SND_SOC_HDMI_CODEC
 	select SND_SOC_ES8328_I2C
@@ -89,7 +80,7 @@ config SND_SOC_RK3288_HDMI_ANALOG
 
 config SND_SOC_RK3399_GRU_SOUND
 	tristate "ASoC support multiple codecs for Rockchip RK3399 GRU boards"
-	depends on SND_SOC_ROCKCHIP && I2C && GPIOLIB && HAVE_CLK && SPI
+	depends on I2C && GPIOLIB && SPI
 	select SND_SOC_ROCKCHIP_I2S
 	select SND_SOC_MAX98357A
 	select SND_SOC_RT5514
@@ -100,3 +91,5 @@ config SND_SOC_RK3399_GRU_SOUND
 	help
 	  Say Y or M here if you want to add support multiple codecs for SoC
 	  audio on Rockchip RK3399 GRU boards.
+
+endmenu
-- 
2.43.0

