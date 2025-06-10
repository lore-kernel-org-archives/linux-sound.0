Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010063.outbound.protection.outlook.com [52.101.228.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A040825DB15
	for <linux-sound@vger.kernel.org>; Tue, 10 Jun 2025 04:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749529394; cv=fail; b=V/41CLy5d3VSgJGR2hD96u+qM/bjxQhWzFCDI9CeavKZ+S3JPDNZN+qnPySNQLD8x2TQh2T6aVm5VgCPZE94ihLL+go/4vuCj2Zpj2geROSJagxCgByN66L2i7elB0i7GGVVJWzAe5EdqXlmXbRi1+5ey25x6vzEywfvtWFOlYA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749529394; c=relaxed/simple;
	bh=eZbjl4I7gusS43XwAMz7fDsjOHVIwy6lszvOeNGxuzQ=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=sSojdlGWhxmBOWAWzkLwk0ZoMtRA8pc8+ezUHyhEHtg0w7UenYjo+4mhPm4MblbBSbfUhB468if9Fzyx3XuEzI1DY2//qBHaiEo5BOGBj3lFRWwOutGiDP+Bj2l+hHeMFg6iu9Ducx7w6T1/JzGgElbhb+lKfHS/3yyWM7F+4Gw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=UBT41TKL; arc=fail smtp.client-ip=52.101.228.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="UBT41TKL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P2iVfwTstBsW7QYq/aOmcxhi7I4mk0zcZW8rzuqY4LDl2jHSOIkbb+BVJgeolTmtTgwAfO5YjCEr98tpd3MhWr0g9a14glz/25Z923ZCIF4ySZCP9V8MC8fb2UlD1aFh1WRM6vEHBrxrXFg86YNsBw//3gzey4GTcBmMFJ9c18PNbJtQxFNR4EMAQ7+C968xVnk8/lYsXobNSQdmNz9rF3XR7vlk4llgkQ7XppLQjGAZU6Y7hss52wHSX74dZpCYR6my/rJtFY5B/03lO6KcPCdzX8YRDhd1twmohpoL4WWOA5o9g2q8ZKc4UIKyinBxnrfWISK+Oi8+v0Zs7DoJNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wH3Uk3Mm17e0OHoapwcCzczlUa0rHe2BBAbrbKVAutI=;
 b=yY9jwr6AmcSvbKVc8772dxTbxa403r/oZfO2dTFXDLMu1GaeM9k88AESVeXzEJZlAJ2o1jN41Vg6PK3mE6ZuzdtXI6kccnRl0vzTE1LwvWZ1ZgmfGmtDOklz8x+buFCSKOMGA9dFx36Z5yXGg71vpdMSopnqM48o6f5U+u3MkM2WCPeaKEFX/Je3AEKCiU2t4r8knChSGP0oSemyjGSVsKaQm1VfLCAv2ovI2oQfq0joDYlzGucqpcuohs90KRBRofBdsBkPal/Y0zsOpJRaPQSYrdgusfNcTg8Fm8TrhhnEYZFqcruJyAkW7Q1Gq7I5HcZGt1vEZX3WzSFfstDG+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wH3Uk3Mm17e0OHoapwcCzczlUa0rHe2BBAbrbKVAutI=;
 b=UBT41TKLhLVuZUJ2BPLQIi0nbVq4erLNE91Mj3X4swTB1DWc9toNZ82HysXUMcc7QUEMIBMf0Z0R1p64XVx9fpu44cquIvcNLCEmXf66I01faK2Enb04uusKNgKhYu3r1eCVTNsrvdQ4b0P2Q3r0BCAMmzyKQ/2UHI2pTeYXvtk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS9PR01MB12373.jpnprd01.prod.outlook.com
 (2603:1096:604:2e8::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.31; Tue, 10 Jun
 2025 04:23:10 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%6]) with mapi id 15.20.8813.024; Tue, 10 Jun 2025
 04:23:10 +0000
Message-ID: <8734c86x8y.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH 31/37] ASoC: loongson: Standardize ASoC menu
In-Reply-To: <8734c8bf3l.wl-kuninori.morimoto.gx@renesas.com>
References: <8734c8bf3l.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 10 Jun 2025 04:23:09 +0000
X-ClientProxiedBy: TYCPR01CA0177.jpnprd01.prod.outlook.com
 (2603:1096:400:2b2::16) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS9PR01MB12373:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b9bfda4-4f56-4cf7-f941-08dda7d6820d
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|52116014|1800799024|38350700014|921020|41080700001;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7BBghGlwmYuneASyBAw3RjZLS0oU9e9HY2fEm1OqN7yadje889bF5EsSPMiH?=
 =?us-ascii?Q?FU12Q5TXRGtQ6SZgY+dFRizwprNR2yCv40uE4ipV7wSpBlE8rVA8Pqc5KxDi?=
 =?us-ascii?Q?770hoYJkUCuU2JoanfvkPF2EzVNZLaEc6vDY+mJGPYWwINgdMV3Vcz44WRjL?=
 =?us-ascii?Q?AXcyHMiW7q8/kiNrNCfcj/d89OEtCUVTCXLTJn916A98fBoY/SWlm2Fc6DMK?=
 =?us-ascii?Q?bmUiVSScdhKipT1MLFRQQLsD3OcNjKY9VIB/WY37go8QWcdFRif+BlYqBeni?=
 =?us-ascii?Q?D/nNLyZSUPGbTIzmXSs40HnvUJfWJm1KPy9IgeXRHbSRoRNWxA1gHC5LprKb?=
 =?us-ascii?Q?Bp3VUKfnTMr2C8Wa+CCk0NEY7zbG7aAYsM7IoEJZAqIqBhI32RbEmW2t4iMU?=
 =?us-ascii?Q?PO2FvXsJZSfAEewxUjWvqWo+0oq5FmgvYMaljVo7MuVy2GSotB+n+fEAEqv8?=
 =?us-ascii?Q?VxTUCCk3fJBp+sYka2wHmqv2nrHv2+2ThmCb4KYhYtNZNqWf3d2fKwXeR1QL?=
 =?us-ascii?Q?D27JeullbfjWXCGxjtMOy5KbRfwGs9QWv8Waz1wzNlDN0dWfURnHwPUKW5VY?=
 =?us-ascii?Q?j8ieEXQ/o1UHYEopG9HJmS3mLMe4wOmoYS/Q8eTA9Lcwo6IxvaXbFPKe+6Df?=
 =?us-ascii?Q?YFESyvyedH5gT38PF0eWIv2FZJ6sGovHDMoko9h46rt0x39IfcfXWdDUQ/J5?=
 =?us-ascii?Q?Ig3H8rbnIy2btqwbIJ8WdSqTJ2uBEbZKK0blYWuMBsbZY7XpNv0h1BnXPY8o?=
 =?us-ascii?Q?n40/2J6FU0X7MxmtARKmXmVG64ogZBSVx2wqNb6rHekRc2XXz7Xyd7BFy1If?=
 =?us-ascii?Q?bZJzNcNf34GdxASqrvgepECjC60gI6U0kOJ2qWBmN6Nd03/nTdPYhkAImnam?=
 =?us-ascii?Q?UGqzbXIsYW7+i0upuAOe3iXidmDBA7DEFKxL0lYm/eNlJ+wybTTJyCsYz1s+?=
 =?us-ascii?Q?LTAQ5NuWnPdX9UBpPSOXbDi9AeSTARLzObgQZr/RLwBvmsj5pSs7vDzzHUVa?=
 =?us-ascii?Q?B72MbSikhZIRJZbpPtFx9yu2b73Fv1kOdtZqzCr29g+p/+fY8Pv+RTFv5ky+?=
 =?us-ascii?Q?Uu8gHw/HFptzEEqB1UxeRAa9+FpZUX37eWG0B5u1te8WwPms1Pux2DsK/wCt?=
 =?us-ascii?Q?2roO521emAMGBB/Z1DYmrnqueDzN6uMKYjLcuTURgNUwsSUgOj6dkEiy/p0o?=
 =?us-ascii?Q?FTcgbmTjRAna5EaIei3RSVoZ7/3xq5BrbWp6Ip87o323g3XEB1FvcjZmc19l?=
 =?us-ascii?Q?oHFjR+xsMwd7k3xZcwznOSrDhLoo1qgmOvlfjN4MNTvB3yTH2oUVzaaRQtmg?=
 =?us-ascii?Q?H8Cyup6xOKVdVzSAMdZVdjB/29Xb/EegFzzmMpsyKhgwW+P1g8wW4FBI54VM?=
 =?us-ascii?Q?IJz5EL+ydkO+x8FQh7m99Er8llDr1RJbokknnmMwakBkc4U39AT4Y1rbYO3Y?=
 =?us-ascii?Q?LLWTf7QRswgklCanFx2PD5aE/heeHFRxeoMiEN2zMCZtcZ4KP8QiKnq6JX1h?=
 =?us-ascii?Q?usJoCKId+Edif8QuVJd/y1HJnpCWzqRU3nuCh5Twm/bRnnsNOtBp0uPNXg?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(52116014)(1800799024)(38350700014)(921020)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6LdNHPv6/llEMcT784I5dw7ZGM3XO7S1amQpHSWpZQOx9OcNLkoqkyXF22+n?=
 =?us-ascii?Q?AX/E9HFlYNgsk7zBjb+W+lxqYMTkJS1OECdO8EUw4iXOgapxloI5qhLhl6XR?=
 =?us-ascii?Q?M1hBgchpdQ1+hRC8bt4zoCPFIHMcjWU65spFJt+hWXBJ2px/UjGiO23H6m6M?=
 =?us-ascii?Q?eI7khCA/F0v6T1bETdmyWbEYVjOo05f1cUyEKHXBYt3sSuhk+G+p5Ju6b6Fv?=
 =?us-ascii?Q?aCAw4xxKYql55NNC4ZiwarNx+nwMv2Zv63ziLFaL1GYFgRj9vUWkrxfhjMUH?=
 =?us-ascii?Q?mahpfEOEHOfyLiyHvlDdw/1SjuFuMLCou0TXVvN2I7wP/DCh1TO5Df5iMHGw?=
 =?us-ascii?Q?yPrnVvSI6KybqnZn+JzxWL9nHqiBMGJ2oB1HnkV/RdmJmrP8Q0dpRYoTXwd/?=
 =?us-ascii?Q?CbEXvcIQU5CVM+0/U533iMRLDzuDAf94X61L46Ad7bO2lgLIrEcyYivKyBBb?=
 =?us-ascii?Q?h/0FRG2Ek0fveyDeNaZwMq5h60FRqQJn5V3u9hfbM2iKXj2J7uXcBdvSjg+7?=
 =?us-ascii?Q?7yDnRD8NZ+w5Ab/DDsziDplRyAv+X2XZ0+TuD87Vf0YxfBEj2fqQUc8eO4oq?=
 =?us-ascii?Q?oocHUyWDOvEGW78AqhoYg9KTElPQjvkq72gBuiV6onWytSvbvh0BikwB63lu?=
 =?us-ascii?Q?h+iw16gK3FbPgRPUglFQQ5eonnGNThP51pITfLm9xebldCdi/4PESWDRRuZy?=
 =?us-ascii?Q?37EVgMbicUftE38gajCQ7HOozt6z0VJ9//R7drzcRLb77q5S8n4ekapE95cJ?=
 =?us-ascii?Q?IlfZd/3z/lObihhEVfya2ep5l66AsYC3sWtAKsOIqZDg0e1/RVUIeCsmcCJE?=
 =?us-ascii?Q?3OZu43QyI5yz4v8LBlW9ugB94WAVVu0PKFFiamQRm/NmBrSisA6Xscis2uYB?=
 =?us-ascii?Q?r6HFXyyYa6PWbykh+6f40/gtErFFJBoAt8JOuyN2vpjZ6XoS3x/1jkVODTJ+?=
 =?us-ascii?Q?+UdGs9/6Erf4p+fQDePLC/Fi0HpkhEuhJkWyrlpjSkyrIUY75AgUsWWwZBgS?=
 =?us-ascii?Q?edX7ltZr20ookVInRKQmbkUHlkU3iel0J9IpKgcvS2VvyoXYX6JYZ0dUUyZw?=
 =?us-ascii?Q?B1BYZvMxdy66Ky1O/t1TSQQbx8uWSuSP1WBNO4nfLVb/veqMLP+2JOL1cVcT?=
 =?us-ascii?Q?bbjsFitujBOyWoPkAfaFQ1ArBf8sBOM2SEbpMTC86wBfEGykkAiiqMxdhdOV?=
 =?us-ascii?Q?C2brVZuI4cap7QrDAySKmVBwI9sFnI3skdktDzvD6eVotRTDWy9qGAZurvVT?=
 =?us-ascii?Q?9XQ7jJRX3F00WsLAB0oKP8NCC5i9WwWpcxorzwA/vsOZqdZWMXOEG8XQPFtP?=
 =?us-ascii?Q?9EAwSiztu+++EfalSQig2dFO7hOt1pxq1DzZU/vbsxwQz+w3pTRe1qelg+dt?=
 =?us-ascii?Q?x5jgx4keZJIDT7C1q5JYkwhclP8JQlBeBxVw9BR/XPNJJe4IWtE2IFSHaG3a?=
 =?us-ascii?Q?E7T5mGW/QAoA73vubBsmpz5KV46UWIzhq680vNDpc3ulQq97MvwrVi8suaOa?=
 =?us-ascii?Q?Sy6MH7cR/xnT9+RoBZPy8nM7F1VJDcqqTY4jItbipzqvtkL3MRgCsx0VIsDy?=
 =?us-ascii?Q?muDOH79Mwy2UUVP6edmvNAx8iZn35qLOqzP5ygtE/S7o+TerIjgIWf3su4W6?=
 =?us-ascii?Q?pSOd8MZMij/y+Ic5SlymW9I=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b9bfda4-4f56-4cf7-f941-08dda7d6820d
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2025 04:23:10.4359
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LP+gztrNO0YuFbpjBPjQiZUczJs+j4MaQAgITjPUPirf3tr83lF1BB1f1aZOELQRan122KYyXfaT8TtOBEWubrEEQCVHsXKCtmqfRzIfVc5VZ/tYZ4sgZuGF7G6jhYYq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB12373

Current Kconfig menu at [ALSA for SoC audio support] has no rules.
So, some venders are using menu style, some venders are listed each drivers
on top page, etc. It is difficult to find target vender and/or drivers
because it is very random.

Let's standardize ASoC menu

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/loongson/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/loongson/Kconfig b/sound/soc/loongson/Kconfig
index 1a3c28816e7ad..d52bc2a6e0780 100644
--- a/sound/soc/loongson/Kconfig
+++ b/sound/soc/loongson/Kconfig
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
-menu "SoC Audio for Loongson CPUs"
+menu "ASoC support for Loongson"
 
 config SND_SOC_LOONGSON_CARD
 	tristate "Loongson Sound Card Driver"
-- 
2.43.0

