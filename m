Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011049.outbound.protection.outlook.com [40.107.74.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA13172637
	for <linux-sound@vger.kernel.org>; Thu, 12 Jun 2025 01:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749692591; cv=fail; b=K3GLkcirDjD16bu4qfYXtljloXnrPEcLPmzKIfZWpdw01lgP4132OwsZnIXcWuKydAHPRUnFC847fBVot1V851O4nb/DzR5i8W/gfmo0gbJ9Vs02PaxouWtxZbutel9Hn6L2wZDYeBJ4aC0BC6htiossrz5u3pen0zcpawmarao=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749692591; c=relaxed/simple;
	bh=5jk1nqGj9lmOMXgzkjL0tCEc7dfJS7xaeWZPwmISVpY=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Qu0gcSTU+pJRLgKRrf440N6D7TulDLQvZqp5OG5Mu4iFlhlEIMIzoCTWGm5eoOjs1l2gcu/G9nZTaj9rdddfpBRqbgsICpzcGexLX72yMwrIroYOojzWqBpqnSF5LrtoOGQphtuVuHWq56NScEzsY88OgRQLBCqvLoTHh/SWQHY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=moAC/vYO; arc=fail smtp.client-ip=40.107.74.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="moAC/vYO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xo2OiNgFas/3WFNddeS20Z4QBnqpuU1xteDGX7+xVOUNBQ2GQXPRPSIFMwSWQapQw0nGRYd3B/Col5/6jP9ytLTfD4NCnCGw78CW/XbREy5lWwhyJcBgiu/O1/XYXkw63h0Y7pGAL1ypptL99O1+1OJWAm6I7aElX6pIRJxkwjudlJkkLHArlRIEuRLTBgfeF8nzD+g0HVGNocQg7wUBaE4qTHaRdkxAwThjzICC7IcnS7eamLmiPn3cQPdYAeNYshW9jULpwMnRR8CUtvz6U7kx3raRedJoIdbZ2npPUNvHKYBpoGmnYH71+sfhOcoWYm3pQtPvj1NAIRQgI1eE1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VdzGiRJ9Sit3YnH2rJ1TsrZW9Z3VfTbLj6hzK0KHZ8c=;
 b=FyEqkDhF7518ADwkBOFK3IQFn0KCeAo5NyY4TQKaJMgC9T75RGjMD+BU/cuGsrT/bhMmsS6urj2NOwdV+SSNj8c+/u2iiJmt1+mq1a5wN05o0KCKtJbe45SGnzRUZhcvnn66yvE/ux9rrVllvc/8d+KyGsv7N/f7kk2xVm4ElzI22ITr7z6gNu4ATEzW4CJ49W3U2iGnxaiKK92tD2Yj+Fh2N68IKeNATLJtm6KI8kvLEzFGfRQJDdb6/x4BihBqCSZd518VQE909G5jWCiWTs3L3f2OUJY4kytRtLB+QFeJsHPZymB9X9QMuqZGmL0y3zHph35Q+Y5N+6vZlZRMDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VdzGiRJ9Sit3YnH2rJ1TsrZW9Z3VfTbLj6hzK0KHZ8c=;
 b=moAC/vYOiBSEteKsFG+hpfOh/3JO5I8rXn3x2Zxh6HxLTvHsEH7QlFS0rVBJWa1CqFKQo06wlBwLY9+keUt/JuzoOgYnf96/SugYNhN/I1UjIC1M7hNEpkLfAhw+dB0e0dKJ9i+HdrxE4Nzoxl5VzYj25bLa/r4G/VHteV+kBE0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYRPR01MB15122.jpnprd01.prod.outlook.com
 (2603:1096:405:227::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Thu, 12 Jun
 2025 01:43:07 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8835.019; Thu, 12 Jun 2025
 01:43:07 +0000
Message-ID: <87ikl1zqdx.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 16/39] ASoC: qcom: Standardize ASoC menu
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
Date: Thu, 12 Jun 2025 01:43:07 +0000
X-ClientProxiedBy: TYAPR01CA0206.jpnprd01.prod.outlook.com
 (2603:1096:404:29::26) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYRPR01MB15122:EE_
X-MS-Office365-Filtering-Correlation-Id: 08456382-128c-4387-45b0-08dda9527b33
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|7416014|38350700014|921020|41080700001;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4MIinMJZnfe/+Gbek7k7/YMQBc/buQFRZWD3k9IcdHwiVs1Kw8rbmIhHTRUk?=
 =?us-ascii?Q?IpEDpkjfkgzo6Chea84yu0RJNT7VyQ8ULMbUPjpX3t4DfzfP10XhR4l401De?=
 =?us-ascii?Q?h+EDhtAv9PNmJVBkWi/55DvK3hdA1BkAl+fR+5Irdy6m3aDbiWvkAx30WClC?=
 =?us-ascii?Q?pn9Ljoczg/sFnkXTc013kVXyv3A8UjDdXhO46iEMjueFgl1PykBZdD95RhoO?=
 =?us-ascii?Q?I1tLbAyUT0930xY4l9O5HCLxCvo9iAbD2PsUV4jsFEgN1SHkfC0fzOGVPlwu?=
 =?us-ascii?Q?+z6VqC1LdOc432QYBxAovtKLA7CzeDJmN69z7HwQusjKFeQr0px+MTMCgtcV?=
 =?us-ascii?Q?RIZRl31eyjgG5VrXfbc7rDzdD0WDpel5eGl9INFTvPd7u35YIsOTPxfdcVNS?=
 =?us-ascii?Q?pHqFBdLlReoksLQAarih5kXEjFKc4J9TYn/P3VPjlZPo3tIkerzHIl0JyLzW?=
 =?us-ascii?Q?Dvz/jXDIvu26PgjCfwsHlDnfFHHfDTjoJ52fqN2C/O+p25etPNwZbjg3Gv/p?=
 =?us-ascii?Q?02KJUIUp0gzghnIB6owruFPR6wByF+N6QoT/VNj1XY4CMI3RIUdA9qiV0CHg?=
 =?us-ascii?Q?XOVYX98vymb8KRnnT3HKM5Wku3fFDKN9okDgUYCr/fJV736FeMFxNC5FWH4g?=
 =?us-ascii?Q?utsOr6UOfB6uX7CLh9wQ+frAanHCFnq2CCVZJ3xU1BUnfSiOm246HTRi8YhL?=
 =?us-ascii?Q?g4A32HbkQBLC9DjLst9Fb1mbB7HuMFZedgQJNon+5vtMX6G89Cekp6sPBD2X?=
 =?us-ascii?Q?DyFJCz2GAS9fBeH2D8NH0EtrcZZDZ0YHb+KywC/bNkgLyBywz8t2Alb1ykXp?=
 =?us-ascii?Q?g8T4GGItz+dcAvkh63yIIGxcKA/4d6522BgaGfoJEIAuyLC1gt61YjrxTnC2?=
 =?us-ascii?Q?9MgE95jJ6yCrUsxdCHP1p5FCEkqPENOG9jfQ5AYMD2yvo1K/U96LK9qXeJQq?=
 =?us-ascii?Q?nZ+oz3SJHKZATgXLZvWUabaybE9at7UeKOc6DMnfJr7QJMbwzcdfQf0Um0dD?=
 =?us-ascii?Q?zpAKJQpdkjKTfNxIt4EWbKy+cN38vDzxEuuVWV8f7hbCtyB+UCfKmevbqDIK?=
 =?us-ascii?Q?YVT0hUUgqiRDPkzbBB/82geV+QAUwMhd7eanqdaJr92UZVUa3YTBA+bP0crM?=
 =?us-ascii?Q?Q5fkrP00md+n8IsJOe5RiC0vOVsHCGSw/VWlcgkFF11VJ86VoiIeOjyvvdwL?=
 =?us-ascii?Q?1L3DOjKsxqrVUQ4Vf03CPCq42GhFU4gyuWaoBYSLPQ0PQ+oahK/gLhI8jFxT?=
 =?us-ascii?Q?FsWXXg37ysyJDv/QlLVM+ChLxxDB+VFqoRm7PJdHF13z/K+KcImIFIE27l2y?=
 =?us-ascii?Q?j4zcnGJs2KY5IgFv5DdCq8bkZ8SAnW0vCVbV8ueS2mAtER9mD09njM9u05qX?=
 =?us-ascii?Q?OLO3PJONShArjFrIRp0EA6qagLJ+7HVJj+t8+NffFmnJDEn4mp93ETDaXgOV?=
 =?us-ascii?Q?VcAp8YiZtjs8EjR0JZcHnGTLHD5uVmyRZIO7fIXyW4HOSQE5zqMwALaUsU0E?=
 =?us-ascii?Q?Umdf02MtZ9AJLpYav3/lEF1y0wQzavwQ3mCJihzXSvjo+UElhI3C1AnOOg?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(7416014)(38350700014)(921020)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?e0Nt/3GdpcdrqULaT94sQE31U9oNqFJg4UqqbUiUMXtSA6DL8nEW0HbTP3jO?=
 =?us-ascii?Q?67udmSqvyJAvFD+p4RbZSz2tRXitmsVp9yVSPG6u/bEqTK7v+NTztfnj6MgO?=
 =?us-ascii?Q?a/djOExcsP55Rv2lotGHR+UcJNc70VASz9OzXr8P7lm/voG8huCq0aEIf0cJ?=
 =?us-ascii?Q?tY0qMgN4pbkzUpV0Za/Oczhvoxr2g9NXaW4/h8s2Ni32v5oADQXzIFZWG2BM?=
 =?us-ascii?Q?utUj7tkYkt4TXOATLSoaVIId9FQXKSkdXEIMV+EpHIE4zTsunftme4T/bfHb?=
 =?us-ascii?Q?pGIrWHipq/aaq2c+3Zrob4XrLdmK0UqG0U5GeoIueR5ljoYJBnn5+VuZDsMe?=
 =?us-ascii?Q?4YIKebvLrZNEYCKUgttE2WeuVoUyST097oNeJGHupDS3bcNRYveGJwSXa7mk?=
 =?us-ascii?Q?Yt8RdgE7wXneGm9ItT1nv89/SolnJLvMWUuoWCgbFkT9AlhfpZXzE4juU8w8?=
 =?us-ascii?Q?CAAWh9sroQ8AiVLL0roRhMQcBtGrWDzteW1zWXFepjaI5Xnq1ZEX/0KobMve?=
 =?us-ascii?Q?yQAD8LRI+4vxA0DVzMZ1eaAseel9+2w7t4lkqyWaJROKXp/WIgXBvvuZXw+s?=
 =?us-ascii?Q?mTaUBO2qBD3lR7DL3j9IL0Qup8D63nSjJG9gb04vUdOq+DCupGIFdjapGXGz?=
 =?us-ascii?Q?dFaUmrW731mqe0aaY/KRl2SkbRtmKLKviOq0reNXVI3vefl85EE6d5juqBhI?=
 =?us-ascii?Q?+7LihU43sEyr6y3zVceLRt8wKSJArcO1QKv4c0+yddBkaPwYVBLGqtzcl25U?=
 =?us-ascii?Q?NsoLMYTSjEylz2yDuVSYHPUqaVsjIGzmRRCnBBxttCmDPeRXvVFhgc8qkgpz?=
 =?us-ascii?Q?M6TOI+MYq137Ev1TBewOFUHo/ij8lCPoo7O6adOzhp01f0F89FyR+P9kN9/3?=
 =?us-ascii?Q?0TKy2jFigmP9nlhioZ1bf/JTbSUWDrysQsn/JnBtaWz9pAnKhAadCFJFynle?=
 =?us-ascii?Q?ffaKk6i1zzBWstrUbTzipAmz+Srr4SK3dpsDylDxrjE7GEUKGcaOhbYJOnc1?=
 =?us-ascii?Q?RzOgxh+qgFIBpnsOBNZxpD99NI5CMUT47qkyt5thIUSeAEmFPNX/eoAOC1Dw?=
 =?us-ascii?Q?Qtr8LcRyta7nmFO2N46yyjCGQLoIeM6N4t3E4W+s6cGIPSFQ1yAzFDJ1WyRh?=
 =?us-ascii?Q?k0DUs9YdI1AgAyIjdDDn88jLfkIbL1TIXkf1ata4RW/xt9GWmK922hFkELtI?=
 =?us-ascii?Q?Oe2fSRNxzRHVWxPDbExVS/XCZX+mdEHzpFEZ/ML5uzyOgZLoWbgeqXJaUtjx?=
 =?us-ascii?Q?zxFED+AaSU7X3oMHKKHf+dEdcQC+7oZ+g9rqQZSanm0avsC0wLCshU7FQe8K?=
 =?us-ascii?Q?kVFT1e8+n35PSftTJ001fFjyzG16modOnJ/U3fU9SGyitMQ2UlijyPYXOTIr?=
 =?us-ascii?Q?2wwLpROS2cFLFOAXzTvOdUj6esDGvrpSikcxruZEoenju2CJmoFbKyjE6/Ig?=
 =?us-ascii?Q?IJXERArOZTdFEgDEFGHQqHF9+aQwMIWlCJM9BhuK44QoJzf7EFWpYhDHWzyO?=
 =?us-ascii?Q?HGHCUWpcXPRdXBtz7DHSkB6PrfQp2b+gbLr9TDVSf7oBSDxBYH8hkZIThWl2?=
 =?us-ascii?Q?KHQCJIMQyIryTrK0G1H2EqttfEjeDmtLn4GT7fH9i2ytdyx2FMdj+T8mA1Kj?=
 =?us-ascii?Q?gRnFgoACOdJs1Mn1WaFB1H0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08456382-128c-4387-45b0-08dda9527b33
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 01:43:07.7564
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8CcXsDNR0MgP/Ldf4hQ4LKEhaebleXniAMD7TRYJYByvcZLqlkSphAtmL2+DhUYpaC9Vrt6Dv2ZBgNlfz0w378BD8vqAsgRuOfjHaw0Muv54TDHqnzzCy3AbGOPf4gDD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB15122

Current Kconfig menu at [ALSA for SoC audio support] has no rules.
So, some venders are using menu style, some venders are listed each drivers
on top page, etc. It is difficult to find target vender and/or drivers
because it is very random.

Let's standardize ASoC menu

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/qcom/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/qcom/Kconfig b/sound/soc/qcom/Kconfig
index e86b4a03dd61d..dfbdab9eb3a39 100644
--- a/sound/soc/qcom/Kconfig
+++ b/sound/soc/qcom/Kconfig
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 menuconfig SND_SOC_QCOM
-	tristate "ASoC support for QCOM platforms"
+	tristate "Qualcomm"
 	depends on ARCH_QCOM || COMPILE_TEST
 	help
 	  Say Y or M if you want to add support to use audio devices
-- 
2.43.0

