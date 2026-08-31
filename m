Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011004.outbound.protection.outlook.com [40.107.74.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70CDE3B05BF
	for <linux-sound@vger.kernel.org>; Mon, 31 Aug 2026 05:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788152845; cv=fail; b=R7Sf9FJFGREitYwqN0+LA8vcOiPlqtgbjR+GZnBgYU9bafp+dZM3nebL6nVuU0kc1jgGL/XgmZzsLOnbzJeu9i5cA/QNpdHwHy2XUVrcr5wKsmC0cgVBdn/y+EZZgSayP7/d8Vi91WgRDjAkXlNTLsgp/4NGDOab1PCh1n5u41w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788152845; c=relaxed/simple;
	bh=r4soRqR/JfIyYWgFtAhz7lf3tFDdNoTOBLoymXzZucQ=;
	h=Message-ID:To:Cc:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=EmLbIGEyc+m5/9ysOhaoA531ZLDAnVz39MoXTUZ1LQKT6uY0S0MmGoQnYlz3ueCcKTD3bftaqBhOYrBaKXiDaViB39H2ZEhU6lC87EbtcaD+hqgJNgsBBitK6rfYLu3vXfrG6Fmk2O/5LHlYD6DrSGEW86Jazcfk7Liz16woWq4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=m7Zcd7C4; arc=fail smtp.client-ip=40.107.74.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="m7Zcd7C4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mo+bVc0rRTx+dVSObSBUC7HreHEiWRWOdhkDoBfeF+IkbhtFLiwgtJFlKU2om8TiFbL0oGXMkboiXUGG/i+9oXudNQ5riJa0l+zH+eYNLBASwF1W1IOl//nQv2kfE/tq/NqD9dwHkcUas45cugpBwMyvtZYY/3i7t9uUn9zOtUJJjmwY6kA56ekaK/4/44nBxYqDYllpDMlgKm+PvBcY3OHGrerCjkaDJyiRS4n7RSxXfPqMGvQ1P+TIizsV0rNHaaSExpITIQaH9AmXcwAH7qjzlr0zdJU1A5dI9Cr/2tJ5GPyWKj+cGT7ROlyORRzrxj9FZXmw+fw4nPwaJhZQ7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UKB2bWtNUFhcTHZDMP/OhDNUos1yKLYHjgxgCr28szE=;
 b=enX4O974kpFSmPXpStflAiu25iSsBtqc9nlH1HLeSQRtlW3ANNdYx8YdTh9ZoY/QTpDdZ9VJ5mtW1hZS4WIwEifPlZ/SKPOA1Nnlu4zI5IPtx0585WtWJCzHFu+CHakcEamxyIH57eo6bvsmMHmU+QP2ux7klq72vB+2dZjm7F2S25pdUHjTua7L+zQFTqbhjZfuaX0ePiiJPgpMN7/ql/pDWgAvUq71WT0lgdbV8ca1tOWD6hlQkIoqQ4+uCl2YxpMzwmHJcczUjUsHzQk3bnK5jyoFZHawc56CtjacDq9K00+SEtILK3qeuI/OD7z3jx0HtIkofivxzEwBqesIiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UKB2bWtNUFhcTHZDMP/OhDNUos1yKLYHjgxgCr28szE=;
 b=m7Zcd7C41kd0vU7FFvxnx54Vpaoea29pIRg1sH7lQtUnlm3XqYbDHezdpfUVOqvq5NbyuJwmKR1+GWmORzSgplyheA0zXFfsva8NRuTreF3E+vIvAqOr9BEnx4zDHADyZ3Gj9zPG3WgLLnwSBXYu4Sy2wbmLjER9z19zK0rgMoU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYRPR01MB16474.jpnprd01.prod.outlook.com
 (2603:1096:405:2ee::10) by TYRPR01MB13019.jpnprd01.prod.outlook.com
 (2603:1096:405:1c7::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 05:07:20 +0000
Received: from TYRPR01MB16474.jpnprd01.prod.outlook.com
 ([fe80::2a39:9988:dbe9:894b]) by TYRPR01MB16474.jpnprd01.prod.outlook.com
 ([fe80::2a39:9988:dbe9:894b%6]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 05:07:20 +0000
Message-ID: <87cxuyvpx3.wl-kuninori.morimoto.gx@renesas.com>
To: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 08/39] ASoC: codecs: cpcap: use .auto_selectable_formats
In-Reply-To: <87o6eivpyd.wl-kuninori.morimoto.gx@renesas.com>
References: <87o6eivpyd.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 31 Aug 2026 05:07:20 +0000
X-ClientProxiedBy: TY6P286CA0021.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:3b9::16) To TYRPR01MB16474.jpnprd01.prod.outlook.com
 (2603:1096:405:2ee::10)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB16474:EE_|TYRPR01MB13019:EE_
X-MS-Office365-Filtering-Correlation-Id: d76f860b-7028-4da2-a6f3-08df071dbc37
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|366016|1800799024|376014|23010399003|18002099003|22082099003|56012099006|11063799006|10067099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	s+SusmlQrTGsPgMyT2/j/hWoeEdLye+hnC+p2L6IJ9l+flKNuVsWFrx7gTd9K5Y1aK5W/Mx+XKA4KnySu6JgX0PGn3EGxo2Dwgtuw1Aqu8d84qQ24A9pXvAqd4ut1cU7yvvgKivG3DwLHmyWtXs56F1MS2kBfNZIuwzXyjqm2zRYS9Vz+KG6r8cgqkwaDCMUot3ykGlbCZExtrYoW0GpISy8RUq6YoBtaHfoVnpa6NRsUz+QyUPAUo5pWdIk4XvjQd4cl3Ocec3QEK5VSRXyFxjELV9BOrpBhmRdrrla/oCJb5I2i4Xq7TyD1TlOnubXXH5UkgM2Sn5Nlm0P2iKM+anUs46LlrBFfVHBw0PCNF/xwZ2hPgbGrlqLBc9nnnAZeC8qjpzwle3hHtqoy8ELTP5ptGKY+SbMgABlACYic5z0MSzsVX3j2Waskv2Fs9xgakrkwb1kjSJh5wt5WBnTmR/lUwgnYnUBjIIf6VUNS0P0UYkYQ3ZZF1SHjhQ/XJwQd1JIzpPcwLxAL/ujHOQlqqOjCF5X7FvLbhTlj+pC7zf6B33ziHk4gt+c416cqIQSBJsHJh/G4nUnFpkts9J8Gs0fdEBKzPaQHQPwXiJR8+6c2K/dyC/Ua/VseT8jn4+oGzEt7emyXnJLZOhyYMsIO5MclmGMrIInmq/klTt5xspH/7TU088A4XlvU6riHEdOxh4JGywfgS2HsruNEvv8jg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB16474.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(1800799024)(376014)(23010399003)(18002099003)(22082099003)(56012099006)(11063799006)(10067099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yGGFReCkJ2mZ7zTjJcWGBkHEFUXoA78Ly5wj0kRyvaDgB0NbliLSfhuEAh0t?=
 =?us-ascii?Q?qQanfXKu6nKnwKNQfBuX6aXkA8leVTNJ9QIqFeveCkWsaK/VtTjeuYQVS3/I?=
 =?us-ascii?Q?/ZFUDEzHYVWB779lnbIS6RIvwNGhbU3XyWnsa+UboW/WbJVNlRzKPpFUvorZ?=
 =?us-ascii?Q?ayCqr2BtOwxhyH9C5Dh82O5sPDaqiSk0cTMkC/bIzYbC3nU477dbj5rVWByP?=
 =?us-ascii?Q?XisSbFe3PjGiP0ItgCUs/bsScblFDQTCsMAgBgCySfKqwmmu7lVrMcXqij9p?=
 =?us-ascii?Q?4hgnoIjLd4GWC+NRvEEto0yyY0lDey5fs7KCDo4/3yoWAJ1UqbNNb5ZKYGae?=
 =?us-ascii?Q?ZpBKeKHVabrPbhx+ckOG7nSoBlLb+gjXKBI4TXpK4LdoqKOObGAVENhyEDdh?=
 =?us-ascii?Q?pjxousLZOWaZm9Fs8b2IixDgOCadEZuXMhcY3rBtJTR8JCRqCV6o0QZ4aaeG?=
 =?us-ascii?Q?DZ6EdOg50mLmCHLjL/ozm4MB3mGHT51Nlt460X0/dyd+0Uhg15qTCW3WQV4/?=
 =?us-ascii?Q?S4AV47P6W0mlnZeUv62hOjjWN+kUT7pMRajVLkbl8xdRE4e7so3tIVTvc1fa?=
 =?us-ascii?Q?3XX+AlCiB5ssf15fz1vuKJLz+qp36n2mFYvkWiFEMVskl38Xz4NA458h+E/z?=
 =?us-ascii?Q?47QPYLn3EDPkVMNHJRZn4iPB8OJzvDBNz5r5MK6ReL9+kGRrsg14VDEg6I+g?=
 =?us-ascii?Q?KaLsQlkYQDQtx0UqBCs3k/7ZX6Da8fq276CRSolCEntl7t7VhvdFEgaudXNL?=
 =?us-ascii?Q?7+8iLiCO3mS+UYxoMrzxR3Yo8vesqyzG3MlqzjWZlanfP4Px3MXx5OqOYGUS?=
 =?us-ascii?Q?8QM4UDvizP5YIhzXlJupR/2Tm299KKP2/6w6FQIkvZW27tZO57lJsRsH+Xtx?=
 =?us-ascii?Q?1NAH5zkg7FpkqN6G5ka1MQBRDtGhTMHEAHcagZQNX4/zg+kVlTd9HTPG/Tsm?=
 =?us-ascii?Q?6jTnTaNE5vg1h6fZ1Jt1yod4bcXMP512j3TvAncog0DN2eA2RyM0Ap/HtDtM?=
 =?us-ascii?Q?1dr+cWiGUMoig9cKfDheF4mi8lDfXnempoGh6/JKJBh8e47WC9d35ZjFaA9T?=
 =?us-ascii?Q?xuzBOQzbNis1Z1XSD1o1LP/s4VPjYaFEREFdyNK1rnwAJuPBbQjLTwTtLVoj?=
 =?us-ascii?Q?iT6n4mg0T38d4wmjV0DLIm4xNXJBtQksvS1fa6ck/xnD3KKXG9KlhHiQz7Tt?=
 =?us-ascii?Q?uCyfCUrQIGpMJqC73M8rFSJneyrj6rFvITVVxgLhot5aN7VVHrKg4c2TZ131?=
 =?us-ascii?Q?qyOansLfvQWPZ3oqYFyng8OmQldAayNg/Y+1hV1MkZs/DSkl0PSwuqZ8MFAs?=
 =?us-ascii?Q?IVeX/Jh4aEbu0UkO1w7pYF8NkGo6GURoVQDVloZytIEJw0/cxiQ20wN8uzLs?=
 =?us-ascii?Q?iknoRHlQs5BMWuiWvVa4EezVGZffElP/L98W+/WW/iPcQUzVFchHPdSYUzKZ?=
 =?us-ascii?Q?W797Er4GWArYKGzME3vJ+wnuA0Jpj7XPFEObu/rXDd0FwU7Iw5mKU9+njb7U?=
 =?us-ascii?Q?TfpMmhaQQRs6pJwmedfcYgIYf2KIb8dE1VtDMEqG65bf4CvF1n53uO9tBncD?=
 =?us-ascii?Q?BXznmZ1672AjYjn/dNUG9rFX+GOhV0i3mvvIRwbaDttkLgPtHMIl2KcNQ2+8?=
 =?us-ascii?Q?Ijmp1Y4sLtvvWvlTb5Zqvdp4DDSMwxE727TKK9vzCrBKYyLMeQXvenTgYkVq?=
 =?us-ascii?Q?T1DRSvpKQaWylixraTwPS7qUx1ahW4lMa0rA6eUQ62KhvLj5AmZT6744Fgdb?=
 =?us-ascii?Q?ZYw7XgfMslwFWlSxOLAW3ZppvW1OE+YpACsKZ7TxgsoP9r2Rkp/I?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d76f860b-7028-4da2-a6f3-08df071dbc37
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB16474.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 05:07:20.6038
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UXiVkBlAY7iW5NpQhlqRB+UA9R84/Z7BJP4nzFpeYM95K5JbblIKCsZLlnSF1QrtjZuSUtsSM3GvJrkiBh09syoD/iEbZdt8rsnKuExqOZ9wj2i6jj662LMuTpWUgB4h
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB13019

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/cpcap.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/sound/soc/codecs/cpcap.c b/sound/soc/codecs/cpcap.c
index fc41e1547bdae..0262900fbb7dc 100644
--- a/sound/soc/codecs/cpcap.c
+++ b/sound/soc/codecs/cpcap.c
@@ -1244,11 +1244,24 @@ static int cpcap_hifi_set_mute(struct snd_soc_dai *dai, int mute, int direction)
 	return regmap_update_bits(cpcap->regmap, reg, mask, val);
 }
 
+static const u64 cpcap_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops cpcap_dai_hifi_ops = {
 	.hw_params	= cpcap_hifi_hw_params,
 	.set_sysclk	= cpcap_hifi_set_dai_sysclk,
 	.set_fmt	= cpcap_hifi_set_dai_fmt,
 	.mute_stream	= cpcap_hifi_set_mute,
+	.auto_selectable_formats	= &cpcap_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 	.no_capture_mute = 1,
 };
 
@@ -1406,6 +1419,8 @@ static const struct snd_soc_dai_ops cpcap_dai_voice_ops = {
 	.set_sysclk	= cpcap_voice_set_dai_sysclk,
 	.set_fmt	= cpcap_voice_set_dai_fmt,
 	.mute_stream	= cpcap_voice_set_mute,
+	.auto_selectable_formats	= &cpcap_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 	.no_capture_mute = 1,
 };
 
-- 
2.53.0

