Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2066.outbound.protection.outlook.com [40.107.114.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23F456FB8;
	Fri, 28 Jun 2024 01:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.114.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719539257; cv=fail; b=CNEfKYJgDyqsw3v0ZdVWwykR8Q9+jOXzZLXrwPcR9/mg+xvrcXMTPkX3/Egpo9ZpOZRKaMdxVvZkQlOPPd7WFAUVDjmqELnlDe0WJeYAYT3C+ZmTYla3VvwUcHIAdHn/hk4E+Z6duZ/bywnXmDFNjkl1sk0FGiqROx+kDKa3/qc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719539257; c=relaxed/simple;
	bh=dZLAShEzZUGReMqEwHgICfRl63lkzjiljzRoDvpMb68=;
	h=Message-ID:To:Subject:From:Content-Type:Date:MIME-Version; b=k2qUpHjuANx5MnRdaKaMrtAtRs7LntgCRlxJPa7YL/A+t7Mwak+e+LwCBbNkQZa8OB8n7zuF8EVes/FxupBE8FnUDdzruTx08nGPcKYak3vJEtQtA1mjz7p0zIv++6bAwIMxtwS4QBgE+/Z2sChBtNaIscV64OUOYocf+rqqijw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=jnDWHh0R; arc=fail smtp.client-ip=40.107.114.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="jnDWHh0R"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I7LKaWblgECy/KM5PcFoXl/RDWINPrRd4UMNgQSTiPA9g9kHrmchznhJZm8THot2Ll2H4f6TM37oE/lxf4rGyilPQf95RO1qWk2nP4EBwuaMW447uC4a+0wMRqQLnyn6Jq2esWTxQr+OPQI1W8TVXO5m6LRVtu7xnsUGKIYWerSttyZUk5zUxUd7g9yBpwHdRHLl6i/oi5DB1P+vdLmFFjYydgvIN5c6wueHw2Zh0YMMygqPB495Xi4BpqGj5zRK9p1s36P9llhBBxKpPK0nt3MCMSgmT0xPtGvxRsDoktc5WcspYF/KYzPMnfi3z4LJGegkdCAbJNRWEQs3zA6VDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i+o7dWaaJij6pPGkhzmwq4FtT3SoPQOZbKXpZyQLB0Q=;
 b=KjOYH7PxTldAdW1/V6qAJu4RGu8pL0gtzxVpCDuPZa8u/BDrJd0EnONFrWhdb5rcTa8ZwGutd6+JIvxBS0bAAynMVo4Pbf2yrwrsfqG9AeoxUZtv3FLEgfm+IntT0E7N+S4x3z0Ip38V7fe9huBHjh5e63+4X7//epaI7on9WN9r4D3iO/yQPIK/LjAPCawuTgvEmHurbyewLXfT2bnYwq9vbNWdrzrUFssJhdKZu1R2166RFoFJS4RLx5w4HMTedVwFsFzzWejNcsDpIMjobHV3jln6HaL/ArCEIYuVC98GSQV4V+vLEOwuEu1eGkt9l0UJP2c1/dyoqhmTKbNDiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i+o7dWaaJij6pPGkhzmwq4FtT3SoPQOZbKXpZyQLB0Q=;
 b=jnDWHh0R+SP9792DhAxBtSchtB/3Vp5c2BCPok+kQzQuh0UrDJJUfpzmTpEEXy4WEnRIz8XszcgTCS+Kxg+5y4aAEqdflN+9BcFhFGP824mgtrkpE9AdxWVaKBSLM212ZEcbMY7UxaOEDV9gCVAzhSTuCVLREFPwT7UGxrMCRKg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB9886.jpnprd01.prod.outlook.com
 (2603:1096:400:236::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.34; Fri, 28 Jun
 2024 01:47:32 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7719.022; Fri, 28 Jun 2024
 01:47:32 +0000
Message-ID: <87h6ddale3.wl-kuninori.morimoto.gx@renesas.com>
To: Alexandre Belloni <aleandre.belloni@bootlin.com>, Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, Takashi Iwai <tiwai@suse.com>, devicetree@vger.kernel.org, linux-sound@vger.kernel.org
Subject: [PATCH v4 0/2] ASoC: simple-audio-mux: add state-labels
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 28 Jun 2024 01:47:32 +0000
X-ClientProxiedBy: TY2PR02CA0065.apcprd02.prod.outlook.com
 (2603:1096:404:e2::29) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB9886:EE_
X-MS-Office365-Filtering-Correlation-Id: 4edb0913-468b-4771-a2c7-08dc971446e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|7416014|1800799024|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?jsihb/LH+tBTsah2fajoKRY/YwI86YOVDZAaCWfgEusdmZoCPa77nWg0c/ix?=
 =?us-ascii?Q?nPs4yJ28cJwxqaEGNxUZ8X+OZDNRxi55Id2iD4aw5SgyQJw9N902pb2CKQRK?=
 =?us-ascii?Q?J3ti2YR4PNLazQHFFCUuJWTIm4pfCWqk0t+eK9rXdAoy0ZlijUUQ+TjsxOic?=
 =?us-ascii?Q?2weZLeeKc2DPYPjCxYua3eWUPlnVVE4IVAWTYFq1sO5uQy87qH6M98p+Zsvs?=
 =?us-ascii?Q?Km0Zl9VtXdYofY3jUjQ1GH9fdLRBVZ+1m9fwe79/hNkTz339sh+kJRNDkCk6?=
 =?us-ascii?Q?smhw3BpZvrNCbv061xS+hpqugxqx7yfn+zEdRs+fNigakkC1w94+5lUh8SA/?=
 =?us-ascii?Q?8QuuyAhS5JzxQQMgKG44/TTp20MsGZWVyqVxJpVZfBXbv9ZAx+2MpJcAdPiL?=
 =?us-ascii?Q?c9ofjsuHU5q6XCdhs3q7GSPFihbwHPYWKooCoG43aYbiJnQT0vdZBe9yJhMf?=
 =?us-ascii?Q?QI9V4DequjKASms3jBqPVmV9MGKmenF6oxf0Zbs1uFjwQgWs7kwg1CjbOetZ?=
 =?us-ascii?Q?iQMaHURKdvG7iu52bpR2eWHZlMRtijqEgogJYbiogRLH2w4AfmufYFSNpjKG?=
 =?us-ascii?Q?CopRullgTpASQ6IjA1q/qW1UzQAd9SWQY5RoiICNdF5cxhyqYfVS7T5DXY0o?=
 =?us-ascii?Q?ZId8o48xPnL56rKMyb3JmGqyx5/aNtHGf1VU4kLWeuCmKoKBAeRSR8ATXplf?=
 =?us-ascii?Q?Ho0fNDj9byrCFi0tecOJjsrS2OdPtJIFBe9s4UZK2FWAjZN6ahEKgU15i7RJ?=
 =?us-ascii?Q?Sp+pH7rxsIBJvhu/QEq59BNzZ4xcYuWK2jtJy10MJnGkiwKg5Shy2dppqCFA?=
 =?us-ascii?Q?9eD+iFJSnsZlQr9sL29JzjDSMQlAQsCJq/uqJ4o3n1Bq8PXI0JwWeclVSg1E?=
 =?us-ascii?Q?YtG4VCVDiFXze0e1Q5JWsg4bvbKyj4SX9nDOLTCOyW2zI/bWjDPffPQ4LiMO?=
 =?us-ascii?Q?eMvH0JV4/9tBhmZAWBptjplKQgJcucfX3oEYQQLcwBh5vp4fP3hdWzQf8Unk?=
 =?us-ascii?Q?V5OmqmWNGODXZxPPDW8U99HCM9pu4SxF1e4uNBakDY+ubGP2I0mhhLkUpDgh?=
 =?us-ascii?Q?9S6HIdlezDnh7KzZT15+5K9TUHb8hKtosCtpmMlSdzdI/21115w5AXFk1MPR?=
 =?us-ascii?Q?kKY6djKq43KAMTiUDa575N2hpEq90Fpgb+YRVJDjzkyyCFN2hFCppF6qmFEs?=
 =?us-ascii?Q?Rwcm1fqQNvQ06PJFXZp7Yk6KtMyEaMuDJ7+/f4WyoRbvHOnXI9GYNHnXtGMd?=
 =?us-ascii?Q?dtnZBA2ZO+EjMduc5Njbqk5PM0LHzqzZh5YSS9mHkfXWdY0gHO8U9Bor6Rhu?=
 =?us-ascii?Q?VN478BIelnEaOksaOacDwA/hok4NUbI04M/NYR9A0VshXPp35pCmRCcOU0Uj?=
 =?us-ascii?Q?9DUSr0GY3MG+eMiQXLrXxHNIiRhr?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(1800799024)(366016)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VPXK9USkU88Fkp0Py0E7ZXMujHSLv5jMCB6Mc7YbQtbDXgF2s25Gq08lVDr0?=
 =?us-ascii?Q?WQslGhFFdzhSs7mi3kXn4nQgHFgiiqnY/m/EYU/HETZUWmO7UlSZzmXUSmsD?=
 =?us-ascii?Q?M45F1HTbQ7ogMml0qBX+bI4lvR+qjDTY0N7YIpMXe8v5Ehwa37OlmvfR+rYU?=
 =?us-ascii?Q?AR/6KOFkaCFR2dl+RUu4yBHSw9v3AQh6OFOQNqxtu8OdMIQPPyRlcc+mPLHJ?=
 =?us-ascii?Q?4K69m3uedlVILtvGmyUR2BdIUfovftZZ3Ywr2djAjCeZu8tB5fVZOi58VeUO?=
 =?us-ascii?Q?Jw47dn6oLCh3k8W5i7FmEGboWD3zfqH9b1y7lJhz8WLabLBeS+DmVzbUtOxA?=
 =?us-ascii?Q?/8oxKIJ9X7Db/8GD/E5VPhmzavJr78f8LmgHgQns9pKXMFatckBv0CTOKYDe?=
 =?us-ascii?Q?MYJCxrZYaVf0Grv3VCewQkU5yS0XkH5W7Xtv3qk+rPUoWHDcMOVphB9xRSdy?=
 =?us-ascii?Q?xI5/8RxouhvsPaj9u8JEbLgGV7Fa8u4TB9MRJgHeMWYwsNkwXVs/Db/pujR5?=
 =?us-ascii?Q?NJh3CpR4uAvYhKMly8MvUZogzxwwxUKa212dddQ7/4Xafk+A/bFXfvRU5WfF?=
 =?us-ascii?Q?fegdLnQ2+WL+jWkYIJH7VyFGvS7U3q7CsMQshhvFT0SVnQiqfZeGse4skQiR?=
 =?us-ascii?Q?naN8QvXMIB0m5qZoY7Z8MeipONq1WGVISIX9oMMvOdYc9Z9dNgmw+wMs6FQo?=
 =?us-ascii?Q?XXiE3jhSgF+zpRswxaYptU+uFg4D8PtMj1CCpXJdqgKF9AExkOWbn70IqUOj?=
 =?us-ascii?Q?Pw4TbrbeBDL6LXlGKREJ+UqswiYDVUyV+qhZ620jmSkcTtQ3v/HKqZN40jQt?=
 =?us-ascii?Q?zkaL9irA62nUv0r7wOCudweQMFrJGZtZZ4m1ToHzPia0iF/3uJ+DhF5Y/nS5?=
 =?us-ascii?Q?/2XoL+yZ/3lPcp3tIzOK8eZhtxk1U/b1tMNeuYANEKznXLwYuu+q7f6LGujA?=
 =?us-ascii?Q?vUVlAhKS86oBhpRmj6LoSWamtBVXm3G52j/PH3ig8LndjOk3L8lsLAN6EkBw?=
 =?us-ascii?Q?p04z2ANBKybkSZ+zJh1ygqNMpJKJGHYJxfQWcS6bJbiWfHIuHboYf2uwVbvu?=
 =?us-ascii?Q?v3ijONnS85osSGGpgkWw8IGx0ky3kkcz2TmL8bBt4Tioywr8Cpok+pInnXc4?=
 =?us-ascii?Q?Mswo5mVWb23O6k01kvEV7MbYRjadRCMMGJvexXnpUAKAMduYSq4GW0iCZ3bT?=
 =?us-ascii?Q?T8HC3vpPRaK3E/YIDNaUqad+CvSKedcPiRNj+9YE8kF4+8+PfcSV1nQ0WMsf?=
 =?us-ascii?Q?RacTXX0uCtJ+oaLRfeqzsJ6HFo4h/DaWm5opNEkAH4hjS59v9FZ1uxsiq+i3?=
 =?us-ascii?Q?nZ50U4+FQ+z8aZKHmKNnZX4GedtkcvImdxAGzf9xplzY6TxRFfWK4RDWxq27?=
 =?us-ascii?Q?AYCXKoUMhOO7wxz922af17T2W/rnccIvu1g2OoOvPn7SzdLdGOx5e+gFcNst?=
 =?us-ascii?Q?RTkcZd3qIr1+4BKyFMWDQGVJqsmDyFjiHJR+WuXlhSDejeXcByUyCqBkH/lB?=
 =?us-ascii?Q?o/7N86olGZ2hVlxou+JMF+pRptL1YkTkce/0F/37vA8WRm+alGKiOifMpiL9?=
 =?us-ascii?Q?gX9Gjhs8QZofqzmFXyphINsQUZMsSKGlwChVzQ6NsrkN9Z1+a/8U2yuotz0o?=
 =?us-ascii?Q?n+fFDfoZtlUL3gEji8s/AIc=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4edb0913-468b-4771-a2c7-08dc971446e0
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2024 01:47:32.5180
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: usHiOD234o2X3EyeL0OfAoGE8PgxTp/ljanI5m0iAHpju7RZkfvU4S1roYrT/b2y4Z2DwLyXnTJA/bs2/NAly14pXs7makJugO4L/0GKBj+hxV82FFoYNs+GykR/HDX1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9886


Hi Mark

simple-audio-mux is designed to be used generally, thus "Input 1" or
"Input 2" are used to selecting MUX input. This numbered inputs would work,
but might be not user friendly in some case, for example in case of system
hardware design has some clear labels.
Adds new "state-labels" property and enable to select MUX by own state names.

Original
	> amixer set "MUX" "Input 1"
	> amixer set "MUX" "Input 2"

Use mux-names
	sound_mux: mux {
		compatible = "simple-audio-mux";
		mux-gpios = <...>;
=>		state-labels = "Label_A", "Label_B";
	};

	> amixer set "MUX" "Label_A"
	> amixer set "MUX" "Label_B"

v3 -> v4
	- add missing property type

v2 -> v3
	- expand example on Doc

v1 -> v2
	- update git-log explanation
	- update property description
	- change property name "mux-names" -> "state-labels"

Link: https://lore.kernel.org/r/87bk3nqc0e.wl-kuninori.morimoto.gx@renesas.com
Link: https://lore.kernel.org/r/87sewxapr5.wl-kuninori.morimoto.gx@renesas.com
Link: https://lore.kernel.org/r/87msn5apey.wl-kuninori.morimoto.gx@renesas.com

Kuninori Morimoto (2):
  ASoC: simple-audio-mux: enable to select MUX names
  ASoC: dt-bindings: simple-audio-mux: add mux-names property

 .../bindings/sound/simple-audio-mux.yaml      |  6 ++
 sound/soc/codecs/simple-mux.c                 | 55 ++++++++++++++-----
 2 files changed, 46 insertions(+), 15 deletions(-)

-- 
2.43.0

