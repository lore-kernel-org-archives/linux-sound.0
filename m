Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B70A4221FC4
	for <linux-sound@vger.kernel.org>; Thu, 19 Jun 2025 10:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750327469; cv=fail; b=amtWQRAI/lmhIIwbk/5ALucf6X72vjiW92gvAYTbT1K///7PQJtqHw4Fd3lD1FJwAvQRmZnM4Cu78NEwYQizIe5qNWwRhr3psRWH6d15RKnRhqxTAZ/0vr9XhBcQtHmqbca0RgL8i/KKGDASebB9z+pqTZckuRH+CqnErFTWCu0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750327469; c=relaxed/simple;
	bh=ZFyZ7p5/iNUNdOjMrgj0tPpOpcosP7WcjMVzwwFwQ8Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cGkGOmJAXsRwkbpoMvSYdDY6r6A9UTGY9p906zZjidpd6MBA3V62KIYfBo09HYDTsuA2r+2M65kvEiluT/ts17Dmiw2uiBC4grTGk7x0ISny/+WuX1U6oDISzYoHrBI0SE35PpGXVU6aWl8p+lGamp5IR7w/oFkBiUomj5N4vn0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=V6bnO+7l; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=XxzDpgZN; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="V6bnO+7l";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="XxzDpgZN"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55J4sHDL017053;
	Thu, 19 Jun 2025 05:04:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=/pdoFSZUk3YLDBHVJk
	zFEHEaZ6WQdeJPv76De6mrIrk=; b=V6bnO+7l3uA/vNYF1dJEeqwePPCNP919gQ
	R4mIXiwstyQZVLg/0/QDqTGmqGgFGGM1zLdkdbB6zzKCJAXA+2FHCIYlfZafYvTx
	v2xwuGKsrjbQ5YUVrsKqdqg02klvzOZ2NYoasAXezJXFoANOcBbk5u4lH9AtGPQF
	EDwT3WCVEALEemsRchCw6rHxA1WUZyseJ8ZLU6D08wXZfGWQ6440t73pIx3vnB1s
	Uc5f/CeR5pCQbiNO/zIVkLhFtkE238l8Oc5cNlyDsYbesrNJ6rLmEGuiVdrKrX4b
	cjEH2qNXRPaa8FRuMiKfQICUztYZ9Bq2D3umm0+1g0U5KXsut5Ig==
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02on2106.outbound.protection.outlook.com [40.107.95.106])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 47bsfnt77r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Jun 2025 05:04:11 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iINHiN/UuBTKVDytoQp9oNpT8MuwtlN3UpUElkJodS2jfmD8KsEhnCVPNTpgOiNYhCrxMDh/fbk3uwQOLO+ITjcD+oebTqWDvWAJ7D5UaG4yViS6by+atyEdqhhg3H7cnYRlXAGe5qoTspCNHUTZ8t+/guq8gzimN8r78mgXhd/hnMbzPN0p1W3tDLc5ZszHDs7g9UvWG2wTi3wLSUIVL1tUu0bMYEKGg6Q7i2amINyQtwVjHeZBdsZkcEYBHxbOGAe16ol5H/5Uq3neNtVC1FPqHSxjICmifPlSLMzZif/G2k+7EmJOnUI0+76Wlxn6TVNk3UePZFefSSrrs9lA5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/pdoFSZUk3YLDBHVJkzFEHEaZ6WQdeJPv76De6mrIrk=;
 b=rtEZjgwTduMa23OuLzFdZkT/3H/R1DjtBE0iamHLCNnSD2dKSvPj/L19nJkaKv4kwpWquNH4fBgrgXujEpypxkV/ZMwOt7Zo+u0IdLH9ftVJlTTiMj9wCpAk9hmzrQwxbz3MkPeqAXBka0V6Txs9TmvfAshUJ0UjRjJlDi8+Ez/MdEbEUPFoeYW65Dn7vLGt6/QuRfwrxVQrt1gO+PZKMxy+oVw/WspJZSCA6/yPvDnzVBccRtFWrlckp9EVXWN8/vDzHFTbD5ipTHz6mtnPLB0qbU1vjQSBeFbGoNM6536aAHCW594aVZBJN5XLDRCGBKn5eC0w3T58+G4D/ubzvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=sholland.org
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/pdoFSZUk3YLDBHVJkzFEHEaZ6WQdeJPv76De6mrIrk=;
 b=XxzDpgZN5pIRq1syXZMckwu5IQqHTaRB5K2BjS83xwDeW1f1rvCwZ7LdAXIKF1VUioCrtAkghrW4HfwE+Y6D4+Q/qlevnn+Vxls7xetY2G3StEVvMu97VOvo85Cn0bOBUYf6wJcH7McixgRp607yhGc+5UM70iVElgWqMwXCrN0=
Received: from BN7PR06CA0056.namprd06.prod.outlook.com (2603:10b6:408:34::33)
 by CH2PR19MB4040.namprd19.prod.outlook.com (2603:10b6:610:a1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.16; Thu, 19 Jun
 2025 10:04:00 +0000
Received: from BL6PEPF00022572.namprd02.prod.outlook.com
 (2603:10b6:408:34:cafe::e0) by BN7PR06CA0056.outlook.office365.com
 (2603:10b6:408:34::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8857.25 via Frontend Transport; Thu,
 19 Jun 2025 10:04:00 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BL6PEPF00022572.mail.protection.outlook.com (10.167.249.40) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8857.21
 via Frontend Transport; Thu, 19 Jun 2025 10:03:59 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 778BB40654E;
	Thu, 19 Jun 2025 10:03:58 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 7086582024A;
	Thu, 19 Jun 2025 10:03:58 +0000 (UTC)
Date: Thu, 19 Jun 2025 11:03:57 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        =?utf-8?Q?=22Martin_Povifff=C5=A1er=22?= <povik+lin@cutebit.org>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Andrei Simion <andrei.simion@microchip.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Cezary Rojewski <cezary.rojewski@intel.com>,
        Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
        Kai Vehmanen <kai.vehmanen@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Paul Cercueil <paul@crapouillou.net>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Srinivas Kandagatla <srini@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Daniel Baluta <daniel.baluta@nxp.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
        Olivier Moysan <olivier.moysan@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Michal Simek <michal.simek@amd.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
        Alexander Sverdlin <alexander.sverdlin@gmail.com>,
        Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>,
        Binbin Zhou <zhoubinbin@loongson.cn>,
        Alexandre Mergnat <amergnat@baylibre.com>, linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 14/39] ASoC: sdca: Standardize ASoC menu
Message-ID: <aFPgjWKhB0nJMpuL@opensource.cirrus.com>
References: <875xh120u3.wl-kuninori.morimoto.gx@renesas.com>
 <87ldpxzqe5.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87ldpxzqe5.wl-kuninori.morimoto.gx@renesas.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00022572:EE_|CH2PR19MB4040:EE_
X-MS-Office365-Filtering-Correlation-Id: 3cbe5a5e-1b9a-4dc6-5d49-08ddaf189c8f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|61400799027|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9BO/oPWEPnPvbcNUdrIz1bf2mVygFpvLIFV2FDI+u84Zh6Ne0LEtSAF2b4Oz?=
 =?us-ascii?Q?sARcPR3OWPKIQAutRXJc+DY05ptqgoeDltorI0qZmKFykHFw9xZB4fDYLHRF?=
 =?us-ascii?Q?799L2piB95Vobs24/6aI0wott0fFjrBUM2Isq51EY/Px8UhrfkppaeGSYcWt?=
 =?us-ascii?Q?8mM9+jwRbVzcRsMZERtKjb3VbpHf1pp0BOw7jWApcvtwNMJMhx3mAhrlEEib?=
 =?us-ascii?Q?gsjgRZHu0M9kUwGdqanUx8e2W1rw5vJg0Rt4VXcq5gQXig16TtiybFP2CGQ+?=
 =?us-ascii?Q?0oBEhWrG/xm8fs7l0ooJL0Bm9DBVr2ivbyy5JQ4TctkLdCQMklS/HTCI/2Ui?=
 =?us-ascii?Q?Quz0vYXH7Ml+Y9ByqgqxODWlcWAYn2Y5nFuFhRclzhHsE6hCePNqSTan3ls1?=
 =?us-ascii?Q?jfEUIvXut+aaC87QQeKP1IbhjxRIDQhM99KII5BEAzAR6yl0hnDhZsy8KhJy?=
 =?us-ascii?Q?wRgMFSxsNKKeC6VsWiQKLIpsv8RDpRXlXmVXDPDBDB/4L6BheZ7j5TVW+mmK?=
 =?us-ascii?Q?hEJ38BnTboC0N1gR9y4adBIj9VsoGK9499Rk/eYtNV94E51T4lF2a/HELu3D?=
 =?us-ascii?Q?L/FgKw87zX5oNz3nycD5X/M0kGqLrBCrdZj9lad3npFNEw1t95uK+I27T9Y2?=
 =?us-ascii?Q?DHOcIwNYyMHGpigAA45/nUaVJQHb4Z/PR0GsxoeBeju+3yVpqdiOmD3Ao1c5?=
 =?us-ascii?Q?k90m7VSUooJgqQubMncVTOJDpdRGm1ZqadwFnAnpTTwJlgHmQ1to7X4/3/Py?=
 =?us-ascii?Q?buoflvwOQQmnw9V0/HhC607zIL5MkpSzU+mOTD+r0jRkCVneq0KmXk+eCzVy?=
 =?us-ascii?Q?szeJQMrFMFEJ6JAxYbue5kYVyHByr7Rl2f5sIzS9dGvTeGkqTJoIjjLdWhLg?=
 =?us-ascii?Q?N5mScDPGJ9jWjk+AX0MdXbTwBh/WMkaVfWLWcGOxL7XdMiMjnILmfmr9lbcL?=
 =?us-ascii?Q?5ts3xpGPDtzDZtTgKQmbk/zOCPDCSta1bFriCJEbh/t48JdC0EbCqIsR2fi4?=
 =?us-ascii?Q?frhscPDbaulO2Z2QlNTZ9rDUos6YO15kB7pUz1+0tF9WbW4vH3oXCLf9CjmF?=
 =?us-ascii?Q?J3ZCTKNX8eYKSgDOkWHkMBSrTmsgq2lPLRM4Ll2WQsXiN8dUOSxL7Dw7Snat?=
 =?us-ascii?Q?1uce9xI036EvGjpZV+i2ys5n17lo4QPjt8BjKs1t9poHuDLMFRZdSw3uySVS?=
 =?us-ascii?Q?LZRBR22nuI6zbGsx4UnWNUtXan30bS/wVDFoa20p2mmqPUhTTjJFmUEpEpK/?=
 =?us-ascii?Q?xvG3JEkKETQizVjpNuYimtGWUFL6v9MHl9iryJvwGbbHJJcJqOLoVKAFTiRH?=
 =?us-ascii?Q?SreEOgyxpgDhhzT/EZtCahnRayL6p0fvn6BhiFsAcLbWHfULwJj2EUy8BRUh?=
 =?us-ascii?Q?9UzEOFFGOk/rexVMQc0kzBKlXPutfvJY31Ii7SoE8+m9GGzaCfOqL/rrkgag?=
 =?us-ascii?Q?J5D/BkY+HQyBtaZ17KSJ16rsdAZ1qmh8vDQOloXQBszPqxrenjkiuS733bLy?=
 =?us-ascii?Q?tXZyQDjEqNET3kKImqZWSUK0NGrs53ihA9UE?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(61400799027)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2025 10:03:59.5036
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cbe5a5e-1b9a-4dc6-5d49-08ddaf189c8f
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00022572.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR19MB4040
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE5MDA4NCBTYWx0ZWRfX8PfkDQfl4V46 gBXXE0LC3eAKdLgJtpRFG5HvXyOGdTfnK8xmthQxfGyud2yg69xA0SF/arQFDo73LPINpFrHZnF RHnUZDs3kwlh84qUzKaLcF3WC0JUWUsxmvRIZRXoZxX6P9tb/26wEGrLObgxYTobWJ2pY7+Q9Ua
 jDcRpX7hftMnhVseK0ohnZStoc/NffZRq5RC20rn5oGF7hxz+REQ00XZcS6Loq/yUneUAamvocI sSrR7O1dGby2IV3RaitK3OmUwkL2qa1/TIBYsL2ddktZKO5uiqNi3yS4dDKAoCnuktc05DCCD23 U/xirM+tD3M7990essCvPsNkW0DHdwtleXlqXJaDGULGxCrPDaq7NuG6qAuWvSFMIE3DPYvUyvu
 x9WeZ4cUxndILcTpATpe7v7goltuareu44fR6QOnpl0sz3jcGPIHf2P7JnUuAQO6htL6QNm9
X-Authority-Analysis: v=2.4 cv=Z4HsHGRA c=1 sm=1 tr=0 ts=6853e09b cx=c_pps a=dHErvwaQtRSs5xc/QiMw0Q==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=yC-0_ovQAAAA:8 a=w1d2syhTAAAA:8 a=r1tatrmcjJJx6Zvsaw8A:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: kPfchp5thX78Pq0fw5KL38BH98CdVTqM
X-Proofpoint-ORIG-GUID: kPfchp5thX78Pq0fw5KL38BH98CdVTqM
X-Proofpoint-Spam-Reason: safe

On Thu, Jun 12, 2025 at 01:42:58AM +0000, Kuninori Morimoto wrote:
> Current Kconfig menu at [ALSA for SoC audio support] has no rules.
> So, some venders are using menu style, some venders are listed each drivers
> on top page, etc. It is difficult to find target vender and/or drivers
> because it is very random.
> 
> Let's standardize ASoC menu
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
