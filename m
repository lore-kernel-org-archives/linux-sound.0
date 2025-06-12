Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011041.outbound.protection.outlook.com [40.107.74.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95EBB847B
	for <linux-sound@vger.kernel.org>; Thu, 12 Jun 2025 01:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749692529; cv=fail; b=T+c/XInFc/uaUXapt4q4w3Pdg1VwPNRE24TVh1i93owpWd6Gu39HK5c2SzpByb8IrZxcFtxZflp5y+UEpAtVsQUlv1VUi7hwuaOLJwWBiR5L7XKoCtyX+bhaarHkz6KYEu+iNS1/tOhUBJNb2X8p9ob09GMq2OBtoTAStrzIQJs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749692529; c=relaxed/simple;
	bh=I8O01bqhCf8DduCWR8VYydj4LSRbYMP4AHyHtbYlgTI=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=PmvKwi4uDjlTjssMlju/0jpgeCZCN0OXKGGrNPw8sqfsT2aVjUVF4OV8wmrl0pxLPitgQOFRJEr+O4GFUS5VPiTgklgVyf3niwF0y9C1NCu7MSsMNCiXd4a3vUvvmRLnBHqrBUkZoqVyaRyBJXbQdYsoZoaHMNH1q9jRKef+mjM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=h9ULMj0q; arc=fail smtp.client-ip=40.107.74.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="h9ULMj0q"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UGCu8U2IQL5SstvbDuwA4VghMr35Ypvx4BqAWDEr/dNkon1VeoRFnF93p+LVAMDWa0773IWT2eQpZ5k6MUbAAl8/Sk9Ko1dRa12qq8AP5qZfReTNcOaLNU+01qlKG3yApFSFztp/RYNTSVF/TzMkpc3Sjqwvc02xb8WeEPIIbY+aKxJIop2GKAEzLmsLddonH1Lui8Cix6eB+/VWQeCx1N6BFIf/909P3ZINTBHEAQ/mDna/c9CFAfxSFBaSi+nLZfAXNcbZHMF3c5YE+Fy34PMplYG4dBstHoSj9dNWWiuVdMloz7fuN9eAU1huFDt+ai5tSx2bQcT6+8nQfxseAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xIHA2Ih4y83t7no/3qaKFlq17OX3566n5QTJUAR6fG4=;
 b=SPFZ0LWr6+wrwaRkTQ5n2cpxsDpMH+1WvJPsZOphzORyyqtagZNTCy81QFLg2ltRhoKwlpngV1K0M8HV2c1s2pjKfzbba/dKKz5IB1k655652YfHoGWOjeVAcA2E8aMU0Jp27RDaHGlS6DSDjlLJCECEhV54BR8l1DsNw5l+q7B75sC7PzKY8rSBiGGDIvGpRGMtOtMDgRsxqrVTGtgxjjoAvkx7/sKuMwWku2asx5Zv0mCW+TSNEnPr1h+BlQa5FRVe0LZToxQDzdkNVLSS6xHN92ZuVqf+psn0CV+h/QzkQZZ7ECzBf4DirIjYBkScL634Gb8Ac8qHAah/7snTrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xIHA2Ih4y83t7no/3qaKFlq17OX3566n5QTJUAR6fG4=;
 b=h9ULMj0q6Yu7vi4nXUXw2LYjZzzlZ4A0DW/WSrWgI1IuMswaXBT4ZqiABAcJOxKkX1V8ilmaOVTWpzgQPrEwk/E7iUXQktmF0xpvf7mMgOz24zfjwK/H+cKnhJhWEwovlNDKvSkHDNIV04ebKOsshpHJ0+lsUrzB/PS3beTEP3g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB9937.jpnprd01.prod.outlook.com
 (2603:1096:400:225::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.25; Thu, 12 Jun
 2025 01:41:47 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8835.019; Thu, 12 Jun 2025
 01:41:47 +0000
Message-ID: <874iwl20th.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 01/39] ASoC: ti: Standardize ASoC menu
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
Date: Thu, 12 Jun 2025 01:41:46 +0000
X-ClientProxiedBy: TY4P301CA0037.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:2be::6) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB9937:EE_
X-MS-Office365-Filtering-Correlation-Id: 371b5dd9-c882-4b51-ee1b-08dda9524b07
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|7416014|1800799024|366016|921020|38350700014|41080700001;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?PitFs2XCSoaTgftSyqFN5w7Xy13cLgQm11nkg/M7xqlxmdT9BEkr2PHQlAl9?=
 =?us-ascii?Q?vxinprCjpIFCQIxepK5Kq9tuIgatcvTciSZbSG8DKF/E/vI7vNyPrrEEPE/R?=
 =?us-ascii?Q?1tZ24eOAwDGwVGfJlxKIhhirAmPgaltTcz3bKUweRdxnHzurrtAIdtSKDcsx?=
 =?us-ascii?Q?0dd66vhaRUcqOf9Frk4vkH+GOGWsn5VF0NJOfoHj59YU7FBuKavLOgYHp2hT?=
 =?us-ascii?Q?ooCDe1QZ8qT2i1d5yamAOipU7NplW339tp1gEsScTYoSLvu89Mn69KRNAN0T?=
 =?us-ascii?Q?RLWp1cFgiZQjU8Z/QMKEfA2dLUTXz6ttestNlSJrdC5famL63eu5SJiWGOMM?=
 =?us-ascii?Q?9L3JIls02xMQH5yd6+tR8TFQ+ItiDLjEmTClRVfxXWt3Q1Ju2AqgbX59i8/z?=
 =?us-ascii?Q?YuoDfto0wiw/kPHiyPUtc/NrhsO127jFXW1/or9F4ABKybeZdkGCb5uTyfVm?=
 =?us-ascii?Q?6FNNBsa9kNeN2iBiTPBcxbbJu9rqTOIjdqW7M4vXiTaISsklChYuwQJNBKxC?=
 =?us-ascii?Q?POlaRawogiN/QJBOVHPt44ogo3vqFfBTyRNzl58yhMmv1xy7uHzsfA0DbRg2?=
 =?us-ascii?Q?yilEopwe3FwAtMoMnRMHGxijgkpWYHBURWavg7gzrnf/ZdviW2jmo78PYMUi?=
 =?us-ascii?Q?Xn4eKiZHtwMfj8ZAMa6vefKlvY9RwbTcYe5R7mKvS3aXeNuMsV28tlgperXT?=
 =?us-ascii?Q?CMIPfPuT7qS5YVMbhacz37nDkVShMMnGY9OY3aefHRTywOAkTB4vgxqgyKDM?=
 =?us-ascii?Q?LP/TwHMCnlb4rxtNXgfACRdOtjRWeORyS2fhlwnQ63q0FxLq0IoR0uMk8S89?=
 =?us-ascii?Q?MZFzH5UBSrBUkrDKxv2JwG4S5Q9TolK7kMhkPuk6XGoiCaRea0T8vQ9GEK7a?=
 =?us-ascii?Q?2Rw13GKLoV6F7pctLguCfNeYsXBVX+B024bazxqY/5o84pzJQHSO+AMGpn6Y?=
 =?us-ascii?Q?G3JaGBUQswNgk+D+MWuvT6TNyYlcAlVyQoaV7urtPghiGBzCYRVT932+Lmb4?=
 =?us-ascii?Q?Us+861HDSKE0WYdxP0bk+zcU8cWXe5ZAKlFy2FlVxrf+AoxPy1d1hiCOEP8g?=
 =?us-ascii?Q?2z0SIquKa88pXt90TXJiZzyUsCSkmEtgD84BcHl0vrrCpl4F7ltrKbRTBmq7?=
 =?us-ascii?Q?XBJy8OsMBaPYV6SVZDVreAmigXJRM191nE4yQeQ7RXqLrbIFdnVMDFCnWfOq?=
 =?us-ascii?Q?6WDaLMtYC7X7iIj4QTIwlo2PblzBE2tMuBQVdYMibtTHR0OxBn+fGE3DRi/4?=
 =?us-ascii?Q?aqnW8MASiSzL/VtOVa97PZTkxaElw0PIa5Q1bBf9P86vzF1yBvKdh6uzhewb?=
 =?us-ascii?Q?IddiHRWzmblVQpf9XADGbXbdoffceBWgs1Im2uKkgGnokdPbI84+5n3i1Chu?=
 =?us-ascii?Q?3THrMLDWyAtrrt5ob43WM9AXKlIFH+UbRaQPJdk/gmC6QUZUsxRF6C0y/Y8P?=
 =?us-ascii?Q?/vx5O7ntcBCX+/juy/xvExXWHV04WLwaZvFvFr7+GoaRmq43vXLtokud3QYm?=
 =?us-ascii?Q?RLCcZGLRWpDRLOjDWa+GpA6LUB3D+IhtVJIl+SAjjc6/EIUp48esETSSAQ?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(1800799024)(366016)(921020)(38350700014)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NG/Ug2H0caX75YnDMTFDukj9NTvGinHu27DeBsO3AK4wn5Oe5DNLGcVyFOdz?=
 =?us-ascii?Q?NVYLC2Qyd9lHb4Dw3/VLFPCUPxN+cd2ij6BmIEaOV0NmeQhT/+yclDrsOMEv?=
 =?us-ascii?Q?OS5EdwVknhXHJkt5puIMfFtlMgW1wtB+LmvcR9WmAvutwRgjUwk7DRKe0cab?=
 =?us-ascii?Q?SvsfbSuExeVtqcRh1coM18Ol5Z/oCkbyVXg6j3bdPr0ByLxRy9jO8sDsZiJm?=
 =?us-ascii?Q?praEQyyJvJ1nCI5l2ABfUB62+QqW6GGe5MUe7POw1+JLF60xmDmc8fbcl1ZH?=
 =?us-ascii?Q?iABKSvBBTFv5QF2TgHtZ85524zjrbht+ydkCa9LNd5Ru4EU2MAfXXbEvTZSj?=
 =?us-ascii?Q?ywccaQakcL0wt7M+0KwwP9xEt3fdfUzrvqqPRlWKM3ZEAjnhTCXaw7aSnJYU?=
 =?us-ascii?Q?EsuXzwmI/5cTKqUdnc4jJKO2YzAcKpE4nrPxflHamQEiDIxrxS7u4Ci/dq21?=
 =?us-ascii?Q?drKTxH/yITdePJdaHLkRQ3S9XDNENv3RzlvUY0oU9Bbt48fKzIqUSc/GiYIw?=
 =?us-ascii?Q?M9vDWuSNbqUhy27yafUSg2asWsF2GLQnwLe4DTEG4tW7xlRLpO9OP1/xEnXm?=
 =?us-ascii?Q?bdHDpGWk0lP4TnndaPeixuY7ZBobOiCojgxDo75PTPGMbG0y6/AL/r9PUlUd?=
 =?us-ascii?Q?vxIX0zGS0YAWVXhE376ZL6i3RQdOV5bRiHtpDb9MXrWRp42elU5HjDelWKdL?=
 =?us-ascii?Q?8J9wDoLreBA5LfNbmxdzTabUT8xLLWDS3fxDAJu0fMZQnrvK9Dy0CI8txQHb?=
 =?us-ascii?Q?zP61wAeMEeltDpeo5P/ConTT6LaEdCCedJs1YBh3GbFEQXIBrXaLsHT/fbUS?=
 =?us-ascii?Q?p/5LyKriGQBV1ejG7UoG8ZVbESenuQmmJwqcFzazS38oODg4/oBaHbQgdZt9?=
 =?us-ascii?Q?15V0I50DR/pSwZYXeM5nuW6rzCdLloMLlbnDgZ7/IO6fuSHjbNZFUWPQf47H?=
 =?us-ascii?Q?93wE6jYsa8fdr2OEegSJQVNRPXBgPfE9VExjic1kC3n5536ND+TJdSGT7xWe?=
 =?us-ascii?Q?qPHRRN1JF9r5AVv1LxZhaHxB0kjxeGG83+ti4ov7J3s8OaiyRDF1ffONQggh?=
 =?us-ascii?Q?VB/nz3jfYRgyLs07kwab2KOSZ4DMbfixs9BkRTiJAnfy58Hb5zJjBYoxqCTi?=
 =?us-ascii?Q?oDj71P0nJ0wg9ZozlZnvm85eXLt9NBdD+ROo9ok3eDTCBQYajSNAGaYORstT?=
 =?us-ascii?Q?5T87kj0cFkYBEOEk1kKgvv3kSwK3G2J8dRoZpE0o69iSkR5JNBhQZOtrLLvn?=
 =?us-ascii?Q?u752Jhl1N241zEbNhT0zPadTs8JSHlVk0I07I4eHoWEYDfexGIi7qU2LGq5f?=
 =?us-ascii?Q?UyGl6Nl7V6NjRdYr63IsIK+XH8cj5AFMAv2szZiyCmUXHIKq8BLcwXHimSpM?=
 =?us-ascii?Q?mcu+TI3JtH8R0lJo8C9tbxQlAmaKagXhgRhlLZIWKbHrtsC2RyxuK6seCcaF?=
 =?us-ascii?Q?WtbZLoxRuaht+fOxC53UsDJWeu+tcnOND5pogPCB56R69eFqlo0gpEnytHf3?=
 =?us-ascii?Q?7gL9qpsAtm52aztJoFiDYlDk3GB2WQwsbmWxoFR+cguulEGQt2vsTR4Lj6qH?=
 =?us-ascii?Q?W37V8enjVB2YvuHLxnXhQqqXAn2exsoxrzYVCDYOz6Rr7fu/gVbceRQQQLVM?=
 =?us-ascii?Q?eSPGDREGRCndn2dMm23sCd0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 371b5dd9-c882-4b51-ee1b-08dda9524b07
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 01:41:46.9469
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZhK89CIwQbKfTkiL5aDU6BYtk+qi3wEBiUR400823k3g5JzsAJ27g3zYo1gVn/2d0DiXNiXmN9K1KGItzjURI3lYnHxCtsMazRXb2xI/E2VbC/TSx7iYTauN479cpLL5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9937

Current Kconfig menu at [ALSA for SoC audio support] has no rules.
So, some venders are using menu style, some venders are listed each drivers
on top page, etc. It is difficult to find target vender and/or drivers
because it is very random.

Let's standardize ASoC menu

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/ti/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/ti/Kconfig b/sound/soc/ti/Kconfig
index e22e41af32269..3323cf96e3095 100644
--- a/sound/soc/ti/Kconfig
+++ b/sound/soc/ti/Kconfig
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
-menu "Audio support for Texas Instruments SoCs"
+menu "Texas Instruments"
 depends on DMA_OMAP || TI_EDMA || TI_K3_UDMA || COMPILE_TEST
 
 config SND_SOC_TI_EDMA_PCM
-- 
2.43.0

