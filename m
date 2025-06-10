Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011018.outbound.protection.outlook.com [40.107.74.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C55A725DAEA
	for <linux-sound@vger.kernel.org>; Tue, 10 Jun 2025 04:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749529325; cv=fail; b=J+IV53DJSzTGetGdH9hcdMkbHk/zzQgNnvZ1klMVz3LAzMn0ZFcM/uDbGZovgNLaLjHFhkRo5mQ6rSU30m+zXOeewvuR0usbkemi4VkL5xVVoSastXCsi125YfNIByk4/Qpfg/vZho7owJKMETVn/RavlJ9m9EUDSQ8kJeID63k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749529325; c=relaxed/simple;
	bh=Z3RmMR393SsVSXOA4jQ8uzEb4RgNbmn8sm9a0Z4XynI=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=lYr9ose7p2fbXn9H9tpu3H4wTL6Yj6gBVjv3kVb+h6jJIZcjDZLxegmsuUV7PTp/egnG/FpTShO3PFRFPCzmXt633FotRITU8yARhNjtBWzKpHkaKqVjcnU+V8IEc8KXLi8JDXZSD2y0J1t952xXu23+Sx3W0WyNBonY8rPAz58=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Vtb96SeU; arc=fail smtp.client-ip=40.107.74.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Vtb96SeU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nJ9S40Sh2wb3vkO3KLozfdepe6PM7l+KSCVc0zcNUUPVQG8mG3ONlT3CMzuelkYP1YXHFcTcABJm2GoJ3a21TJY6cdog5eYbg/cXSxeHoPZdT2aB9hN0Q8iesImdR6TAG5AjzJ8yiyHN6PL4GY+OWpBImhV8njymhnlfUZSyEQ5LScqad+El3Rdp8CrSBWhNL3cs6FgubvENxHfoeBiDrU0J3k5H5B6RLWu/o0PZvroELn0raTIpr2NnMY3Q0SmFB/8j1VYdHa0mBQEent8E+MX5jQb6GAzPJf8mRcHwVhEwQHn32TAyZXGayNvG2ZjjCrvP2dVZsr5eXMsASnRe/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kUrJ6FtoabV1UuLtuX7LfnwDflnBkOoVqxD+h7FAwKk=;
 b=Lpj73pbGt82zq7GSGuV/9+EYX8saCtrBuPQZtg2Gnk6ZaHrww7sDcVOvfwB04tKEkg/PIpkHI9RDoFCj7RLk3zK9SjPOdnmXTIN24t4OKjvrE1d7JCaiyIj/YlEer7dYuue0hwUO4mPWxU2k1DxW8hfrXkYtD9oSxa8SkC98HpOmkaZqOGYnre2riFfk4gjnkxXl/+WawspAdCkMhysPIkAECPQsY0aqgy1IBf9hDyqcSlnGpMM3K0vFbC91gr1KQ/XnM24s7ZGlfDdpy6DWuAG2VRIaFcI7QjeFP/58gCtzqicTG/zIxg0Tnuvycc2euylSzliLAdgV9QBKq7IGzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kUrJ6FtoabV1UuLtuX7LfnwDflnBkOoVqxD+h7FAwKk=;
 b=Vtb96SeUk13B3pPk59bHMp5VS+0VXDYG9tSKKzMGAWQcdxFsej+bYQIHj8/R3+xlxVFfpuKIYhVLQG7ngimX969aaXZtiuO0iwXYUJVks37Xdnba3jlfh1JSrLA9bxuQKXJcN9MKS5xcHQMDQ+DZjScslQmUj5+ML+8bnus5VSQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS9PR01MB15231.jpnprd01.prod.outlook.com
 (2603:1096:604:3b7::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.22; Tue, 10 Jun
 2025 04:21:59 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%6]) with mapi id 15.20.8813.024; Tue, 10 Jun 2025
 04:21:59 +0000
Message-ID: <87jz5k6xax.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH 19/37] ASoC: spear: Standardize ASoC menu
In-Reply-To: <8734c8bf3l.wl-kuninori.morimoto.gx@renesas.com>
References: <8734c8bf3l.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 10 Jun 2025 04:21:58 +0000
X-ClientProxiedBy: TYCP286CA0055.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b5::10) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS9PR01MB15231:EE_
X-MS-Office365-Filtering-Correlation-Id: 5bb39b1c-d100-45a6-daa8-08dda7d657bf
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|1800799024|366016|921020|38350700014|41080700001;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?jChOpEe9Cy/7Hqqj6bbMCkrK72qG9aInOZUaFECLJ0EPj41npkbDGA81Oomk?=
 =?us-ascii?Q?68Z+NeR8mkGORGCK+joxVr8d3sXEovVFwYjmxJ5ObMUUbrV46rkmgd3plQ9p?=
 =?us-ascii?Q?vIJfAb5cEFapuL4i2XMFmy+iktQud61bWuCFPWbC7esc57uOEtKuwiQwY1Sv?=
 =?us-ascii?Q?yVN18q/PXcXdgsCQE8c1eZk9zP1jaV+R2gKGEgavZiFJvtbD3KLSDrZtprun?=
 =?us-ascii?Q?VtiTaRpfGzchCGYEmUEw39yyuJ9B0RopFgcV5IliWsxR9+TrlEKj34dUSRQS?=
 =?us-ascii?Q?PA2lstsW8UcHseeV0TE6bSHmuJRKlpfBLpYbaUDZy2lxR8sFu0pOE16mko1k?=
 =?us-ascii?Q?9JO/624zjH9qnpFSuvrTybfV3hf+v4xohPPrDgj5bkDQbregtX9O1b2ctZjc?=
 =?us-ascii?Q?9SkpoQOxJN9UNrt16lJxJzghtOG3F4ugEtoJMxauv86kPMNK3XPsmEFYQ2ki?=
 =?us-ascii?Q?H17FyW7GtrkutwJ4MxCKNskrM4PkOkBVwVb0LXgpLnQ2aS/DdnbXwgZ9ES6S?=
 =?us-ascii?Q?+1UKIRLeQjPPL6JzXdKVM91v+0Uxu39EzBxg0+cw9IxYXauFFtWUrkpqgst3?=
 =?us-ascii?Q?MOvGEKhvr4RTDNNKMv7tfQ17Abmrj5RUHedSFHSR6wd0FAtWw1oz8oEfImbi?=
 =?us-ascii?Q?Mmtd9AgSUbtnFaImb0D1cRYatN54HF77aidx8ICNTq5mmh/ShfjuQI/tmD6X?=
 =?us-ascii?Q?Bt/bd36YDmkuZHKsEG2lf0cfiN5lJVgeyUtt6sQhFyHmoHU9QeeBjnBk7sbc?=
 =?us-ascii?Q?XtQdkeEyIYjxohXMhsmJzoDI648d1kYSCB5nlbG/J+wB+66a2hhdM7uGwP7O?=
 =?us-ascii?Q?Rw/KDUgVP5r35Ezq1ZlQfSTEkEB4Xtmx3ClKI4poJ5KbXsSL7iCX7S2ur7TR?=
 =?us-ascii?Q?77S00iY6M8YIzy2sHL7HRPY1SgIWs5vPGS5FZw/gcrfmMenUDirOau0+c8ZH?=
 =?us-ascii?Q?klWGw5+uXztVrc398sQ2erxGZQ3likEsbf1XDRPWe6sq+CqDwRpCVAonvkwc?=
 =?us-ascii?Q?K7V3Nwn5l8pKXa3zG69YKM1LBEDeZX29Q7WMM2mWIS1i7m1a9fl55QgNUzWZ?=
 =?us-ascii?Q?SKy5Gc7Bk1w8Ywmr+ctgcVIazowWnpQNrhH7ARv8Rv5IBRn/3sFuZxRhtsTH?=
 =?us-ascii?Q?09zvTvDV8PPmQib7vzpBCJfZHYd0BzNvpJXKKAUfO6vy3z3xW1DkXj2zStNA?=
 =?us-ascii?Q?mkg8DxEsN7ZygWYE7ORILuNtGZeYY7KO9yNI+EIs4OAVljjQaaMdlzgZVWcA?=
 =?us-ascii?Q?JftDf6EH4r1N4hTrPbf2/gy8+FVFQEbSDHHGkyMJcOqs7uEnI/jgObjy/k3g?=
 =?us-ascii?Q?sHad02fk/TwPCJ0RZhVmHw3J7lKSF4hEDgFqrNYWB2Eli+xzRAv7qv2FGB85?=
 =?us-ascii?Q?1A6mV3ATBD/c1wHoDDfrezMusZ8LQ6+bkrAxmr/PQCb4HiAA3mJAENKnZUTv?=
 =?us-ascii?Q?5Jo/u4V7XKNeyQGvCED9+uEOtKMomKNzwuUEHONXCg22MGKdbf6ygnLGxjBT?=
 =?us-ascii?Q?APBSfV9T4vk1IPg7AU2QE9sfrfdUKbI+pSnTRtggi2R+HaGymDMITA8VGg?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(1800799024)(366016)(921020)(38350700014)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?M2N0rZRpM3gu0nxrhLn0yJ76OvBpeSabu6pqoenyP10dgezATRr4OPer+ia9?=
 =?us-ascii?Q?wDHwYXK1Q5uFroc36Mm3xKr1VRAmlUiYpjsdS/dTN002fYRgSFYjhnfE7mIB?=
 =?us-ascii?Q?cdybyAahg7Pkb2l1uYLQ17jDsQqEFjuJsuuuVZyS9Q9EwHqq6inhlEtPuNDl?=
 =?us-ascii?Q?k3qZqheGvFBf/fO5vY5Qp4D3TK1B8V0jeYjnHUY5LPqvrhOHbQtJFXyKlvpx?=
 =?us-ascii?Q?elK8xQ3uMkDzwjULbcC2YsPz4akrQaJdU9gXxZ8oAUL9ljn/k7iElsqYbasz?=
 =?us-ascii?Q?d8wJWPV9kx1jbA2Hqqe5xuQejf0E2MSFkjDsenSht8F+tvgiNhN0yV5ss2ae?=
 =?us-ascii?Q?a/Mw0N3clGwp6heATDg1ZZYNo7FcvylwafsZCutF8XBO4Jo0E7NkPXiIZmcb?=
 =?us-ascii?Q?i5WFszJpFJI7k2RwnUPw1JUCvDNBfE22h6GohlxISMpkfisG47lpVwhtwS6r?=
 =?us-ascii?Q?iFwxAg36cvEFo4XhZjHb+UZt6p8jgGyS7Ua+ygKRzj/9WbVQ+3DZmpvnYIlj?=
 =?us-ascii?Q?HGO5wbQFpRPkQckLr3q4BHwm5n4/tiHMy5mib8KRysf2ShT/GzRO0oE3N29+?=
 =?us-ascii?Q?oqj6FvrP6jWp+YYWBSkkvfIr7RsNT47VJ7FSLxUHOTsmInVLX0xEWpIFP5P4?=
 =?us-ascii?Q?OA3l7XK9k3ImEgQFx7tv/Y7qRqWwkDP+qaDafpwMNXyNsPp40BkaWf6YoFV/?=
 =?us-ascii?Q?MkuUujwgpU1FwNzKMFWUk0+biyv9VedUvzF7aiK3djbcDxaKsfI6v1y6o/hy?=
 =?us-ascii?Q?R9yAUmFl8TCJRaoXQIzD+ADZza4hTwFqk9vroPTV2MgjUM9MjEXVRlrVj93A?=
 =?us-ascii?Q?bU1pn+bKeoCMq/X5lhk3j8oLj/JZC1/+WSoGFyurV0nYu2o6wo1tOU4LhUUv?=
 =?us-ascii?Q?f8syt3n/wte7uQ3/XKnLUMGYdtV96TFS8fXWZvN6FPjfKKwl/pEDzXDCCd/i?=
 =?us-ascii?Q?UQonpv9+QO5sH7njI5ll65af35j4TXjq/O+O1ETARk2KIvWudxmzKP5kmZ5c?=
 =?us-ascii?Q?Ov49JKRRizguwqFk+CeaUkudlqkHL7H9IQyLY+tAI7Q9dB9eRDhyz9wTvtqj?=
 =?us-ascii?Q?D5dc/0h/JkToGy0dEylnv8/snBziiSJnBy/TS3ywsDBHr5TznXQULFzLswnq?=
 =?us-ascii?Q?ORiKtlUYu74BqE/aLUOU8S7GzWA5z0XuF3Hg058MBn6N7OXr/NtP9J+pgET9?=
 =?us-ascii?Q?9aljWYvSU+hX8OaN2IZ79IaGpzOPWxM6gDkfcz2qgZe4U8Zd0gp9z+ZtSe55?=
 =?us-ascii?Q?IX8EZ4USEDqV7D3HhgvpPhGzi7wmSU0sb35nVPNr57TTJKVgt6WJUnj5+9xr?=
 =?us-ascii?Q?gzCd5jS6/1d1Nd7IjKPJeh6t+7oCv4m1fHhCSj57Z78CG+W7qIjkLEqNRYNp?=
 =?us-ascii?Q?GeQPmAQkbCVIFRGbAFhJa8P2fspGtj8zmFcal6LAbx7AF451mnK3ZaKdvpoE?=
 =?us-ascii?Q?u24lTIBT9fkpL2jZ4Sn9KVe7B7sgcHAQFLpqey+A1/VCmTT/DMh9PFoqUrzX?=
 =?us-ascii?Q?aBYllYixHWxj/U3sOCQM7/2/86da1v0pd6ryjzDLs/L9w+GtqdWwiW58dJOP?=
 =?us-ascii?Q?Rb81xbnaOT0m33gyqxJRObBSYTYg6NSMhNOGdps02V7LeG3XjdUrFFI0qAS+?=
 =?us-ascii?Q?bHpZ2+puvSOx8pDPoT5V/PM=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bb39b1c-d100-45a6-daa8-08dda7d657bf
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2025 04:21:59.5177
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CwUwm9SrfA0xYZcHmi9Wco5pL/nrhnVAU2FAT9CcanIRUa+L359Shne4u5ke8na/+Yib6fkZ8/Wbtj+k6FTF96fbMwo7UNB0CUskBTdwfBLsGsFic+q4/f9IfxWPagbY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB15231

Current Kconfig menu at [ALSA for SoC audio support] has no rules.
So, some venders are using menu style, some venders are listed each drivers
on top page, etc. It is difficult to find target vender and/or drivers
because it is very random.

Let's standardize ASoC menu

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/spear/Kconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/spear/Kconfig b/sound/soc/spear/Kconfig
index 1b053de1ae7cb..77316396d6da9 100644
--- a/sound/soc/spear/Kconfig
+++ b/sound/soc/spear/Kconfig
@@ -1,4 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
+menu "ASoC support for spear"
+
 config SND_SPEAR_SOC
 	tristate
 	select SND_SOC_GENERIC_DMAENGINE_PCM
@@ -8,3 +10,5 @@ config SND_SPEAR_SPDIF_OUT
 
 config SND_SPEAR_SPDIF_IN
 	tristate
+
+endmenu
-- 
2.43.0

