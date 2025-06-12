Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011039.outbound.protection.outlook.com [52.101.125.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84E75151991
	for <linux-sound@vger.kernel.org>; Thu, 12 Jun 2025 01:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749692635; cv=fail; b=l2jRcQZIokvodubIPcdUcKPO+BQeEq8lEAW8FXKrdlWg6bmmuCodh96AItQpPnF285Yz/kcuv2eia+mPOx4y42B0DAE+mBnfxLzahy3J6XOg78Ew0NnmPZ6u4w/sIVoH2uckkUBTz4zucQDdQt7lp0X169T0aG6RdA8kxv5dYtk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749692635; c=relaxed/simple;
	bh=rn9hHgprVQtCLqQWxZujWJ5KYUH1bFlxnI60qHxx/ug=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Ujc6rYdN8/sa4TNteDNc5EDXBIhhkSEk547W7yW4BpVWekPe5eLDoPTNLVDzObrnl/GT5sG2DSvTFuzA19JRu4bDHS9F2Tn8/xLiRj2hcjHD5yAtilUhwoC34nk2fLUDYMJds/23eLMY5HnObIM1SJMKmYj7Z6HpnxYVgCVzOQw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=YInWCIdA; arc=fail smtp.client-ip=52.101.125.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="YInWCIdA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ls0BBpje5aGyEBNkV0kGXeONvhlE7G8t0VM/NHTDWnenyNtCTRGJqTSGp9BCWy2EXwp2Ejmtbx3Jy4iRlU7V3SWEqPpJfoss+1Px9LnblkC7OREfrmiOGMOZAVb4OuE02n6xwBGuAFOkg/Zx2CQ4RgcrjbxWgEoziG9Sz6bnmPDlR+juESOAEuNiXEvJ6Fr0XYABRHbxueJF4DIZRwGsW/X5udMb8Exw0LRny7i07ybLNfPv9FjYsxJI1VM31yGf9vSAuIiz5VcQw1x+ETK5StSzOdASKqqtAw+1XvhrFlNcnPoo3A7NXv01j7KUuqgCSNkp6nmtyJmEwjevqo3ckQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2/lR3/OUU9+abAZrxBuZXS4bMP7c/aw+Dn5WW4ZPeF8=;
 b=l1J57/v2b11K8t0poKaiK/yu9snx4DgPDsigHmH+aleXninW3ATD3VfOd0adSGJCRn1luzgXazKNXEqwbWml1p7tkoW9UGvIigJlW071+8T0Z/v0yimXLwUFBxHODZ7z2iUNX/wWXg60hqhP2xuEIKUbMukFnOBL9peCpVUq9s+zN/7tuGiyw6739HxYfSBPaCoUDWhhUo6sI4ijUwX7CISDAvktsaxeMEKP/6aYhre7H4/Sp3rHBit1bCAlug3ex2neZnSiTZ9IvnubD1TnwF1+iaa31cS7o20Zvzd+FCN3vr/I+oZ42GfatlY++kIfKRYg/4Q8MYroIC2/yO1X5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2/lR3/OUU9+abAZrxBuZXS4bMP7c/aw+Dn5WW4ZPeF8=;
 b=YInWCIdAU7lUs6InUd8N35IKwSXIMuAFl5uJpugW4H11MMF0Dnn7ZXQ8YBt5LDVVfWtytdokBUoX51OTOUqDyCO0TBzybiKMlcb8vDcwlKh9hpld2uHVBlW0PnPj1uuinvmxUOuQbNkLrkSmumtWPO/ylvQZAn1ttEco5f3cQy4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY3PR01MB9824.jpnprd01.prod.outlook.com
 (2603:1096:400:223::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.30; Thu, 12 Jun
 2025 01:43:51 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8835.019; Thu, 12 Jun 2025
 01:43:51 +0000
Message-ID: <875xh1zqcp.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 25/39] ASoC: cirrus: Standardize ASoC menu
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
Date: Thu, 12 Jun 2025 01:43:51 +0000
X-ClientProxiedBy: TY2PR0101CA0006.apcprd01.prod.exchangelabs.com
 (2603:1096:404:92::18) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY3PR01MB9824:EE_
X-MS-Office365-Filtering-Correlation-Id: cc3875e3-81e8-4de6-8b83-08dda9529562
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|52116014|376014|1800799024|921020|38350700014|41080700001;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?PpIldhkOz079wFLkLuRo69TDG1xSRIgVBt2qkHw9tBztMy6kpfijaGsPeyCY?=
 =?us-ascii?Q?PH5ZezdcI3asD7PCl1SyGaEPglLD7aGd4VnMX0aR+MfMaJdC22R1mwHaarWv?=
 =?us-ascii?Q?LKTw4jtWBKmv9vFJEZy5+7R0E2V2dICKwr4UsTiCwCJY4/89M6p0SVqzMie1?=
 =?us-ascii?Q?n+0Eu0qi9leWd1oFBQqkhpjVUti87Fs7SJ83TIpnXdKVPRSRnIAFNNMm30dJ?=
 =?us-ascii?Q?HmH+wQpsMSyVmdCcpTWGp/2WR+8qpn+p7aph+ZULlzoA40BhcxSpC9oSokLD?=
 =?us-ascii?Q?PwEtoe0GJwfyfYgpOLSwktknHh9zQyUcuKICHUzlNC6Q0CnZlFtLJi9DCbxM?=
 =?us-ascii?Q?9siii1f4INRy3e/QK+WZy3bjJcHe+ngeXkhixWZiekgYJyfICc3s5yCG3abP?=
 =?us-ascii?Q?HQQ5L531815ZgCaGrLqfWpSrvlfysEClbtSe6yP8RqQJw3txooIhqDPFW4b/?=
 =?us-ascii?Q?/5t9iwR6OZFYQc4wD6EgeqeAr5TAzyMhkstUqfOyC/NkG2RA2tQl9Talbupk?=
 =?us-ascii?Q?JrXSQCBL/N6QWDwjAmT8QFfy/VX+aYk0MWYT3LgsOlaKwMV2imHaNpVsA7mE?=
 =?us-ascii?Q?0eAPcQnnK4+RKT7nWxtFQw7z8FyhEgCdtCPdmWGeyV269D8BBmCuXHqn7UbL?=
 =?us-ascii?Q?XDKj0tgXcPGtD2oEZb4Eq8bmCrd8nI3MWR4qTWwK16BC3veYol/oWyzv4J33?=
 =?us-ascii?Q?+P6CsO8YcScw0w68vr661ihHSR489+Ln9CkAnTXEusrKJ+pj6KedlZH23bM0?=
 =?us-ascii?Q?2c8vGI7M7iGJyFSTCeiAnWaFoXuQeOQJKyL0LNk3KGAXCAVroRuVhS+3tLnf?=
 =?us-ascii?Q?i4/V7JGp2gb5vC+X3G9tOeWt1yylfLz61IJRtcvYoLOncH1W4FAx2li3bpx1?=
 =?us-ascii?Q?UDKRWs3+Ksf1zwBIHeUrJXxDztptPvplfhR8pRN2YRIoZLLoiMdoaQhvGrww?=
 =?us-ascii?Q?t15beJ264KHj/ftf5Y6Vp5+kwbbvxhmc7BQVBidqMVNFL3TGwbQRkezmZz7i?=
 =?us-ascii?Q?sQTGSHiyEUDrcMecMVnI3zgcjUDNrWV01mgJB07Zn19/Gr0jDyte/RKC02eS?=
 =?us-ascii?Q?sCGDg8twWJZjEguT2x+LU/Eyz/BCqGUq+BvNwkWzivxHmecicsE1B+wV6yBH?=
 =?us-ascii?Q?DmxpMqbRtPfvwIurMHZFrrqS7eSr5EOxZ3+sGkb2o3oF5QY2Cn7KKhTfSAdJ?=
 =?us-ascii?Q?mA1lFoK5BNrOp1Ybn/b3hZduRrISTaW1g2D1bBeq3NeI0CC3GhjZWpte80Jc?=
 =?us-ascii?Q?FvYKSjOQ6vPt05RRckSbMkeTz1KOI5nY9MjBslo1AIugcK9U1BzQu2K/QTh6?=
 =?us-ascii?Q?J1eJ7HYq0an8Kq57ehJg/lNOmMm5l41B8l5h+/Bm6ak/c5DHVOBMBVnw4CV4?=
 =?us-ascii?Q?Xc/ZMHbSsPAgKgjXCoRPgBKSUSiQGPfacgECiI1dwsR34DFR1bia2oGeMgRk?=
 =?us-ascii?Q?aRQ4T53fx8vQKMy1tV7y+hv9LmcYJBuK8bf/1RCFvu4jV4qaLyOcD9r7lVYs?=
 =?us-ascii?Q?5GEIfXiteWJJvTdYEphpaIDfxWBmSlwxlzB/nk4PfpkIwEls9UMVVoc35w?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(52116014)(376014)(1800799024)(921020)(38350700014)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?uM8D27ceieDM+6i1JKDVSf0ADOssC/qnU37asZgV67cy/y4dhSaD4VZE759g?=
 =?us-ascii?Q?KZPvcWITNO3DGZ3d92LIQssI/S/M/Zo7sMzbri5FJqaq6exZFGyoFbff3is+?=
 =?us-ascii?Q?zY6kZdRg/w2dCgnZ39BpYu+/VbrRXJUozS2jBfxU/grrwMJ+zO18QQRV+kb2?=
 =?us-ascii?Q?OAfvM8oXhe+cf5aVT8ZFvos97Bnfq0C7Dxn6Za5AYPG/Heph/ih9wyxy9XgO?=
 =?us-ascii?Q?Ex1ayfvylCZ8jW58atxWgsvnCbYys92yfj3wnSw1OdbSEnWvT0ReOvtax5xr?=
 =?us-ascii?Q?8Av2sbhE1o1By2rc3rXWQmeVQvwYRCVRHDw53L4TuVpk20CQfOKw+OVhu2PW?=
 =?us-ascii?Q?20kCx13D5RogJTlo8s8yLnEdwS8KwqZo62/jT/wlFzOeWmv2HciNMrC8Bpas?=
 =?us-ascii?Q?qO1mNSFzxr2le7Spc1LsIYzje2SD2w45KkGA1z62VZZNBpSKbPGXP7Vtg7t0?=
 =?us-ascii?Q?aiHJmvBH0ZLMgWlV5nGj0jiCTUPAWyU2sGt8VhtNZj8JiMeWifDE25lUOAzt?=
 =?us-ascii?Q?G+NxHFHael6uI31sGJtBUrUsmnS1AwJ1rKSuQVkbUxj8uo4Z3+MuLfxlp7y+?=
 =?us-ascii?Q?uwwrKypCfAZKOZGV1igXMlLffdOofTT1FpVF2a1+okLguZW1EWz4TkIb8T1u?=
 =?us-ascii?Q?fPtGjEvZK0atcX9SKaU/sRwH4QEsYFnJjP7TetZA+Z8T1glGVv0yrf2t/++M?=
 =?us-ascii?Q?Gd2FKaCoarBogXdrqvJl9ZX910W3YtzjKSF9xg3dPDnhNKhlGDh2PlQErYI5?=
 =?us-ascii?Q?AxHt86cK0WynUD9usjJ0tJdiAnPPalYHrjkqGFNepWyDNvsmFN8YzSCTZ4lN?=
 =?us-ascii?Q?OyzVZW+e/CNiOnZBNSjr5iLMGqjP20ZPPkKg6InX85LTEpW/3O4Qduh2s18y?=
 =?us-ascii?Q?rcVYjcEKkowv9C/f6yznoB/QliWnHl0NyolJtpjRPZ8W2xKtp2ZPWQzwH2dN?=
 =?us-ascii?Q?ue9Xh7wBCq9LFJKaHdX6Mgfmv4p/K4JyUikGWXjFp9+DCPrWTjYIHKPX5vEE?=
 =?us-ascii?Q?5p0xsw++cxML3/aj+HgLfFxW5kIfR3TfM9NHLKn4VpHCoUeZmueQKTF1doD8?=
 =?us-ascii?Q?PwFz7RjZgsVQG29WH36JY5UY5spT9BFQy6kJ8etud0xgWwHKgtkXMjYSRxDX?=
 =?us-ascii?Q?3w4FS8sEwV3bWYN5Bbx9Z6E9pGrt9sWVVhN6CeGWlyKvENuQQGFfnp4+nDXp?=
 =?us-ascii?Q?xsO64xju4c+ECnGlVZUnYjCglpz4FrtzrkMCb8xizEN6axZMS9wOEmPW0edv?=
 =?us-ascii?Q?5dhowlUkIcqtQNz4ZDTal5cqh9g+pRMzocgcOr2cF/z9POSpO1hF2c71lOX4?=
 =?us-ascii?Q?Dr/9fj2i71kuDi2JZPONj9FR5u7t3KXSjj1dFKdTr48zg9fGMniSWYEVTPfj?=
 =?us-ascii?Q?THlph/NZRw51Ae7CsWC194Wqgcd8nPgrZlEJbLQ/bY5kg78b145W3jiAeIT5?=
 =?us-ascii?Q?nnTwVsqlFW5nsALQqjPKWgfydYNW978qXGAvthgHKxUSYEva0W4cKp2kzHoc?=
 =?us-ascii?Q?2ObrFjH+YdApPusUD2XRbapZvxG5O0lg77/jYBrau76CMfZ3GQYRY46mfs0l?=
 =?us-ascii?Q?eRoVuzqaRm+uJ7EwimzuApFXGxc9TmEcBBeDwOGEOQBoYLLO5H1sgcwJ2Xj+?=
 =?us-ascii?Q?zpTVxs2fLZ2CF6gqVbJsx3o=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc3875e3-81e8-4de6-8b83-08dda9529562
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 01:43:51.6444
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 31upNHlEPlK7AHQMSYDdWQXOeiIxXS6DyuzVyST8qb15qnrrcEVDriL+MszRSTUzdFAN0qanKSr1UcMRiWTQEOxSecDPemtW6xy1hH0hgrw31hYnswjuU11eRIjkqpY1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB9824

Current Kconfig menu at [ALSA for SoC audio support] has no rules.
So, some venders are using menu style, some venders are listed each drivers
on top page, etc. It is difficult to find target vender and/or drivers
because it is very random.

Let's standardize ASoC menu

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
 sound/soc/cirrus/Kconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/cirrus/Kconfig b/sound/soc/cirrus/Kconfig
index 97def4e53fbc7..31475e64e7dd8 100644
--- a/sound/soc/cirrus/Kconfig
+++ b/sound/soc/cirrus/Kconfig
@@ -1,4 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
+menu "Cirrus Logic"
+
 config SND_EP93XX_SOC
 	tristate "SoC Audio support for the Cirrus Logic EP93xx series"
 	depends on ARCH_EP93XX || COMPILE_TEST
@@ -31,3 +33,4 @@ config SND_EP93XX_SOC_I2S_WATCHDOG
 
 endif # if SND_EP93XX_SOC_I2S
 
+endmenu
-- 
2.43.0

