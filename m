Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010001.outbound.protection.outlook.com [52.101.228.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF4D61DFF0
	for <linux-sound@vger.kernel.org>; Tue, 18 Feb 2025 01:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739841303; cv=fail; b=gEKcoSZmGfhuFBTK5772vn5a8Vljh5gLtcLSh3Czg/1utQzAcURBw1Bp4DtocserSOzxDnyf13KGBla/CgdJmSaD9Y9p+Mo6rcjWkvFt6hv8wlI5ETZ38dSLggpvL15o1XhkjrPcVpBq8upGUwJtWfizsCZbz+tZo6ya38YIPL0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739841303; c=relaxed/simple;
	bh=Wy4z/sx/r850WTrCzKA8/pNLDSVQB1A13N1D6HBYn0k=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=M6ZzOZobQi8U0DD7r6NrwMD3kqB2seYAkyxE5XveuuVp45u3eR759NzlOaBpLDS/9ku1jyC2kKCSXfN1v/wsrAFFZFf/HrA9yXaT1ONWl2PgI6NuLes474041kieXNdte3sWVks4zPF2GJEwQ3EMgp0EvSOVX3mildW0nGeuy5k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=pHIq7uNU; arc=fail smtp.client-ip=52.101.228.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="pHIq7uNU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cx5vbMZIgIojPJYCPJMlQWTNE8DuI6B/NZMOG+tA/kiMuXW5FZl2TxsKRTHwuAUWNwwW+/aSXs2R9gZce7w7vykqOftnG8enmHauLDHt7jZAPhPYAC+f+IRSgX3v/7TEwC9qN4B/jRYf+mZOxMew7c+6e+pZCIL730nKBTmM2qsg+5Up49faflpajFD7uvOlqJnAot4XlA02uAP4Q9XN5BpBlujKO4N1AgmpC6U02bRA6sfdhvLPizOkNvMedPeWn4pORkqqK/Y7e88Ix9ES95RmevyWannr5LR0tnHTTluWjE3i/y+TodlNiXiJLRqBasp4Bh5Lb6nTc1pnGpJYfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wWn1QJUs3D8pMO2MQIyAANEOGuPgEE5N62hItD5kpwQ=;
 b=wtsIL1w2DE3/FixcU27aYIBWTpAfIDsHZmoGLl6+TjWOTh5OKhtv9WZhodKZTzXM8bukPRX9ZIzqtz7K26RNGgKRMr/5VBr6l/2at9PofNRR4Asq6AQsEqyml0AuLYMHaGmKYxQnJzuJfoKnlhrmtLNHl7yzXerxBNe6dj4arVWxiqB55OnppI0QyzTa52/2urpFsRGwkDYnWaxgxMWoiWX8bwraJmfwaJeRufk1kzkFYf0YNv0rVkoc8gFQl1IBqQ0955mXpG7yAcXQIpBeRdhoC2ep8U5FqZZECPb7OLLabCZfZdph+oBRcfnwCZra/FSSaDZ8O2i5YqS64tLosg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wWn1QJUs3D8pMO2MQIyAANEOGuPgEE5N62hItD5kpwQ=;
 b=pHIq7uNUpnE3gZNYyJCN9dTLWRf69RTK2IdOOlw+ob0NzPvNa+matb3X/NZPtRUoC1ufWpZSae/tm8Z5ijAP+uTsk5J2qnj6X1dD/44SPtEJwT0j/eU1VGlLdRVVRZmWONOGRaOUNQQzQ4EyTWp3P3qZibjtDG7NRhsx5Wc3Hp0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB10906.jpnprd01.prod.outlook.com
 (2603:1096:400:3af::14) by TYCPR01MB5934.jpnprd01.prod.outlook.com
 (2603:1096:400:40::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.20; Tue, 18 Feb
 2025 01:14:58 +0000
Received: from TY3PR01MB10906.jpnprd01.prod.outlook.com
 ([fe80::592:9b7b:ef57:2dd8]) by TY3PR01MB10906.jpnprd01.prod.outlook.com
 ([fe80::592:9b7b:ef57:2dd8%4]) with mapi id 15.20.8445.017; Tue, 18 Feb 2025
 01:14:58 +0000
Message-ID: <87tt8s9hpp.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 3/3] ASoC: audio-graph-card2-custom-sample.dtsi: remove original sample
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87y0y49hqe.wl-kuninori.morimoto.gx@renesas.com>
References: <87y0y49hqe.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 18 Feb 2025 01:14:58 +0000
X-ClientProxiedBy: TYAPR01CA0079.jpnprd01.prod.outlook.com
 (2603:1096:404:2c::19) To TY3PR01MB10906.jpnprd01.prod.outlook.com
 (2603:1096:400:3af::14)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB10906:EE_|TYCPR01MB5934:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f8fd926-e6f4-4c98-8b92-08dd4fb9a978
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?OzvWmntz0tvUoy4y0ZBXh6g75WRyBNvRO9qzZhuqjoJhOm6/328jQj8221dt?=
 =?us-ascii?Q?nXy8jjhaByRp4AHuWIZbrErcF2oGjJy6ukbwfzndttGn1PGOLaXTFutAFeVM?=
 =?us-ascii?Q?ybYMUkdU+MT+d/7tQPWzaTPLuXWQH2kAyhx1iiM9DkJpAI6KaAwADC4OFqci?=
 =?us-ascii?Q?E2QKaisgosFDnDeVvAIVd1Vigkn+YXWC/k1zylh4u7xOGGZMttOZ3ctAh00N?=
 =?us-ascii?Q?wRImK9kgn1YozWixn166yTGSEqJCCb8K2l+2hiovmR6/MrXX3JoSYGQw/AYn?=
 =?us-ascii?Q?unV/no7Nf9a13GnVygarESvklH7Gn3oz1FEOaYg8Sq5U/SjW3NK7djcFrUKY?=
 =?us-ascii?Q?gkcf/8llgjNiFPl4JSG1Tinju8I/LFLRO3x5I5hVjhlHEdl2Cu4tugj8TsWL?=
 =?us-ascii?Q?zQd7emXY0aIsPW9NSTMrPD67R+ezxbMaVIOz1W1Cikb6dTJl3TFmK6x04BG0?=
 =?us-ascii?Q?+qaGUPF/Zvp0g9PI7JjZzJip9ULiEPRtubW2NoYjng+hWY3O/I5p6oW9S8hl?=
 =?us-ascii?Q?9Blnu9x3/j60kIQk/JUAAtgUJA5jwDD02vlm2IgEfOUa/aJN4vu97EXJAplj?=
 =?us-ascii?Q?cAFER0C1SbjBcJOLGfoZaJkx3N4PxJBVQHlBba5wqt9oHLiLAV4yRJtu8Us+?=
 =?us-ascii?Q?bs6yU2fqEBn3cAahbH5iXbBxaf0WVGUt2/xYIYe+d4dOlg2CHRNHqvDrbpL+?=
 =?us-ascii?Q?x5PuRCN7CbWXKJO+GzUEZTzEvf8e3cspTE8Uen6t5psltKcf+vN7MkCsxyFS?=
 =?us-ascii?Q?+CFbNoQ6aeKy2KHsR2hf75p5pwu+jHHsSTK4z/BSpeM5HP+r/7pGkmSUO7o6?=
 =?us-ascii?Q?7jnhAJtCMSRXPxHTAvhYmIdiDHHYDZ14FBYty4rEysUDLNI9MDaSCfWM6w4R?=
 =?us-ascii?Q?sjlHSs8eSEbhnCH5bYd+8kWGdCDWgiGMLjxJF028unWki/6pUWZG0wUZfN8Y?=
 =?us-ascii?Q?yTlLSZiWhHdQ+yRcsN1kkGpYtzoWkg8a8C9KlyrxpTxmkAnGHCaNBKh7dm5M?=
 =?us-ascii?Q?U9C+wYrQuwVcGbgdtCr/ZTW31cHbNty5ZDVvU4XyixqITuKFuADPRM/90i/a?=
 =?us-ascii?Q?7XdFMZAPlMVu5f6/r09y6hx8ucWux7PT+xGQSm6bwV+WYwsxx31bB0/SVzO9?=
 =?us-ascii?Q?+HI/SoZsjzAZAzUSauOpTl6qk7SSiGt5BO7n5U1sqYJY+EFXmfAskOjwa41U?=
 =?us-ascii?Q?mXfrIbVxSd+ojptArZE9efLY/23w/zdYWu2LrL+BumKLceHE3SKMbrqZ7hBH?=
 =?us-ascii?Q?i4nsm26Z5B/kVlKAW3FSRq3abXVfW7dnhydO1xNcPOMK8/n9sqwrn1zT98IO?=
 =?us-ascii?Q?Rp0qDH7Mbs73M/kAWC+BE+wiRlGNeSzfhYSKtb2+EPC5E87NuUhBc7vk+oD/?=
 =?us-ascii?Q?i6pX3ojQlSaF7Ag1pqaaqFOkxB9VVdvT4NGIuKtfC5ltcF8FWq5QSh28tG7U?=
 =?us-ascii?Q?y+h9vrA67JC71ObLxWbgk5+W5AoWJVo1?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB10906.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?p3IHWT8kossbQsHQazj2Ac1X3Vpe/TO6CA77shjW0YDLQMseTC4tASF6DgOJ?=
 =?us-ascii?Q?dO+wkjlGJBDYbMXrnfNpKqjL9NzBqUCH9dpYNFIeuiqRXYH67ckb0xuEFYJ7?=
 =?us-ascii?Q?xOhVKTHWqkZOl93SSVr4iYDa/M0nexRLpTx3f1boUrGC+di4kPpdlRHPTxFS?=
 =?us-ascii?Q?BxeraWvMK/VLqrisFwi0hInMoV/diya8b9FcStXipuX8iQVAb2om/8FRc+2d?=
 =?us-ascii?Q?FgLreoL/IWY+8EXIR1mgrbNIyUW2ICIHVYXKLuxripJLH7I/zKAYHHUfrZKe?=
 =?us-ascii?Q?3J2vTyE5eD+Rl+0vgDhipty96p+aAP6m5B9EbQaUiU6jZsJzJRdh61/dcLgA?=
 =?us-ascii?Q?roVhg7sno+N3KwaShhe29ZooTCyAhxE5z9HsAvQYkZN2/UzWtAiwmqclAfyg?=
 =?us-ascii?Q?ADuoWWsZT9mGTkJ4RdICPtH15VqHPmLBWc/qkk4G/zdsaEeEfO6YdwJO6Qcr?=
 =?us-ascii?Q?0KYzuYt9HJsy9MAJF0dPtyGADe/vct33VxL12jMuTuSnvVGJJAoe7G6vpomr?=
 =?us-ascii?Q?RYSpCHvYjoM1CCLqZMU5c5egTMz5v6l3ullnWjzpcNFUbyHdZewGwO4FiWZQ?=
 =?us-ascii?Q?FTI/0vLXpZo6dfsjRPLxUkNJTaB10pxq/ytYfiA2d8ENauClcDJm9Cjvu7Hh?=
 =?us-ascii?Q?jssETsplqmi4uS9kvG/tiqQ4MSJXlBYEV8AHbNCgLEFeLDfeZjfYaz14zmVR?=
 =?us-ascii?Q?bh8N07IWLQMPZgtyoESv2z+W4mXa1d41MqOJl0vyIkPfrmaMAaI8+NsoOlMr?=
 =?us-ascii?Q?TVE8pAxM0kNMPJH80/xCQ3LYV4BJlTRqtYiKqF02nhCvH0WrxUQ/8ZshkQKH?=
 =?us-ascii?Q?wvHlYFJm1AHP0BVsxk5bO73hP3xyAqn69YU8aTnBRPV0GT5iebax7gays1iW?=
 =?us-ascii?Q?33GRi+B0vHvJO4QMB0Qsesd4jQHx/l7ACuS+9ZiTa3MGtXmWPEmtJKv+eJHv?=
 =?us-ascii?Q?R9oH8MWweC7TR0pPtqHfVizgqZWXVQJmlzklgXhahS7ONfanvJYa4kJ5IWhp?=
 =?us-ascii?Q?cHc2uW0uh0Mj3ahv1twvyHGdLiuHaGL+AfmvVPWvgtMXojTA9M8O/eWYcgbC?=
 =?us-ascii?Q?9HEk8GkMJD2w018KqXUj/M2939vPB3xtJ9H8r/+w7b6chrXHDWAEiRrFHzHw?=
 =?us-ascii?Q?QkrlNKgFED9pI9WqilUNPirhFXpoHG6HyhDH8LMLyZzlUQDsQa0P4zFpIWBJ?=
 =?us-ascii?Q?E8dldZgp6KcWgS0zprYyCIf3GW+ZQI9mEofy6PofFhkBl1wXlKjPttIr/j11?=
 =?us-ascii?Q?MyI4GCQg9rt/yQmATfGIwufQTsGE0pTtY3KwOe9PEI005gKOcPs+L4aXy4mi?=
 =?us-ascii?Q?ACMNMd/JVOz5pU5Pvl37QH1aOK+Fu5eJ92oSBTb7WtM2bKtotdjj6RDgOy+b?=
 =?us-ascii?Q?dNSfhHO+17r/5XDnKg6DPQp9a4iI5QI0SZjYKbefvNAU7X4/Z2dsSq2L//3f?=
 =?us-ascii?Q?9j3oN1Pw81Jez4cGxJNUyHKeY/qBMyXY2LBexhm/PJcFOi6JI+9mPGHrskNz?=
 =?us-ascii?Q?es3nmLhtV1CC2y1X94hNXCnt4raEUQxY1NKUnIu1ltKBCmP+aD9t0Kz400/o?=
 =?us-ascii?Q?KhYWVisXuVUBHaRflk4un/K4mKmyvK+wGoyVyBVFInbNf+jNa11sYu3p9F0Q?=
 =?us-ascii?Q?RjqQ/C+pRf7qV2KMd1XpLTE=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f8fd926-e6f4-4c98-8b92-08dd4fb9a978
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB10906.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2025 01:14:58.8378
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hprw+6BMoq/rfwwfx2yBlmJiekIlZdr00CiIFnfQvSgebG5POV550elb952+9Kj113qqsL0/F+NNwdGE+47/dYmKsJpOb4n1gddGa6uSkjmH6RTkbFzfFn1oZXSFEP6F
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB5934

audio-graph-card2-custom-sample has many sample connections, but because
ALSA card has number limition for links, it is impossible to have all
samples into 1 ASoC card.

The sample is separated into 2 samples. Remove original sample.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 .../audio-graph-card2-custom-sample.dtsi      | 702 ------------------
 1 file changed, 702 deletions(-)
 delete mode 100644 sound/soc/generic/audio-graph-card2-custom-sample.dtsi

diff --git a/sound/soc/generic/audio-graph-card2-custom-sample.dtsi b/sound/soc/generic/audio-graph-card2-custom-sample.dtsi
deleted file mode 100644
index 9efd31206c9b3..0000000000000
--- a/sound/soc/generic/audio-graph-card2-custom-sample.dtsi
+++ /dev/null
@@ -1,702 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * audio-graph-card2-custom-sample.dtsi
- *
- * Copyright (C) 2020 Renesas Electronics Corp.
- * Copyright (C) 2020 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
- *
- * This sample indicates how to use audio-graph-card2 and its
- * custom driver. "audio-graph-card2-custom-sample" is the custome driver
- * which is using audio-graph-card2.
- *
- * You can easily use this sample by adding below line on your DT file,
- * and add new CONFIG to your .config.
- *
- *	#include "../../../../../sound/soc/generic/audio-graph-card2-custom-sample.dtsi"
- *
- *	CONFIG_SND_AUDIO_GRAPH_CARD2
- *	CONFIG_SND_AUDIO_GRAPH_CARD2_CUSTOM_SAMPLE
- *	CONFIG_SND_TEST_COMPONENT
- *
- *
- * You can indicate more detail each device behavior as debug if you modify
- * "compatible" on each test-component. see below
- *
- *	test_cpu {
- *	-	compatible = "test-cpu";
- *	+	compatible = "test-cpu-verbose";
- *		...
- *	};
- *
- *	test_codec {
- *	-	compatible = "test-codec";
- *	+	compatible = "test-codec-verbose";
- *		...
- *	};
- *
- *
- * Below sample doesn't use "format" property,
- * because test-component driver (test-cpu/test-codec) is supporting
- * snd_soc_dai_ops :: .auto_selectable_formats.
- * see
- *	snd_soc_runtime_get_dai_fmt()
- *	linux/sound/soc/generic/test-component.c :: test_dai_formats
- */
-/ {
-	/*
-	 * @ : used at links
-	 *
-	 * [Normal]
-	 *	cpu0 <-@-----------------> codec0
-	 *
-	 * [Semi-Multi]
-	 *
-	 * CPU:Codec = 1:N
-	 *
-	 *			+-+
-	 *	cpu7 <-@------->| |-> codec12
-	 *			| |-> codec13
-	 *			+-+
-	 *
-	 * [Multi-CPU/Codec-0]
-	 *		+-+		+-+
-	 *	cpu1 <--| |<-@--------->| |-> codec1
-	 *	cpu2 <--| |		| |-> codec2
-	 *		+-+		+-+
-	 *
-	 * [Multi-CPU/Codec-1]
-	 *
-	 *		+-+		+-+
-	 *		| |<-@--------->| |
-	 *		| |		| |
-	 *	cpu8 <--| |<----------->| |-> codec14
-	 *	cpu9 <--| |<---+------->| |-> codec15
-	 *		+-+	\------>| |-> codec16
-	 *				+-+
-	 *
-	 * [Multi-CPU/Codec-2]
-	 *
-	 *		+-+		+-+
-	 *		| |<-@--------->| |
-	 *		| |		| |
-	 *	cpu10 <-| |<----------->| |-> codec17
-	 *	cpu11 <-| |<-----+----->| |-> codec18
-	 *	cpu12 <-| |<----/	+-+
-	 *		+-+
-	 *
-	 * [DPCM]
-	 *
-	 *	CPU3/CPU4 are converting rate to 44100
-	 *
-	 *	FE		BE
-	 *		  ****
-	 *	cpu3 <-@--*  *--@-> codec3
-	 *	cpu4 <-@--*  *  (44.1kHz)
-	 *		  ****
-	 *
-	 * [DPCM-Multi]
-	 *
-	 * --NOTE--
-	 * Multi-FE is not supported by ASoC.
-	 *
-	 *	FE		BE
-	 *		  ****	    +-+
-	 *	cpu5 <-@--*  *--@-> | | -> codec4
-	 *	cpu6 <-@--*  *	    | | -> codec5
-	 *		  ****	    +-+
-	 *
-	 * [Codec2Codec]
-	 *			   +-@-> codec6
-	 *			   |
-	 *			   +---> codec7
-	 *
-	 * [Codec2Codec-Multi]
-	 *
-	 * --NOTE--
-	 * Multi connect N:M is not supported by ASoC.
-	 *
-	 *				+-+
-	 *			   +-@->| |-> codec8
-	 *			   |	| |-> codec9
-	 *			   |	+-+
-	 *			   |	+-+
-	 *			   +--->| |-> codec10
-	 *				| |-> codec11
-	 *				+-+
-	 */
-	audio-graph-card2-custom-sample {
-		/*
-		 * You can use audio-graph-card2 directly by using
-		 *
-		 * compatible = "audio-graph-card2";
-		 */
-		compatible = "audio-graph-card2-custom-sample";
-
-			/* for [DPCM]		   */
-			/* BE			FE */
-		routing = "TC DAI3 Playback",	"DAI3 Playback",
-			  "TC DAI3 Playback",	"DAI4 Playback",
-			  "DAI3 Capture",	"TC DAI3 Capture",
-			  "DAI4 Capture",	"TC DAI3 Capture",
-			/* for [DPCM-Multi]	   */
-			/* BE			FE */
-			  "TC DAI4 Playback",	"DAI5 Playback",
-			  "TC DAI5 Playback",	"DAI5 Playback",
-			  "TC DAI4 Playback",	"DAI6 Playback",
-			  "TC DAI5 Playback",	"DAI6 Playback",
-			  "DAI5 Capture",	"TC DAI4 Capture",
-			  "DAI5 Capture",	"TC DAI5 Capture",
-			  "DAI6 Capture",	"TC DAI4 Capture",
-			  "DAI6 Capture",	"TC DAI5 Capture",
-			/* for [Codec2Codec] */
-			  "TC OUT",		"TC DAI7 Playback",
-			  "TC DAI6 Capture",	"TC IN",
-			/* for [Codec2Codec-Multi] */
-			  "TC OUT",		"TC DAI10 Playback",
-			  "TC DAI8 Capture",	"TC IN",
-			  "TC OUT",		"TC DAI11 Playback",
-			  "TC DAI9 Capture",	"TC IN";
-
-		links = <
-			/*
-			 * [Normal]: cpu side only
-			 * cpu0/codec0
-			 */
-			 &cpu0
-
-			/*
-			 * [Semi-Multi]
-			 * cpu7/codec12/codec13
-			 */
-			&sm0
-
-			/*
-			 * [Multi-CPU/Codec-0]: cpu side only
-			 * cpu1/cpu2/codec1/codec2
-			 */
-			 &mcpu0
-
-			/*
-			 * [Multi-CPU/Codec-1]: cpu side only
-			 * cpu8/cpu9/codec14/codec15/codec16
-			 *
-			 * Because it will reach to the maximum of sound minor number,
-			 * disable it so far.
-			 * If you want to try it, please disable some other one instead.
-			 */
-			//&mcpu1
-
-			/*
-			 * [Multi-CPU/Codec-2]: cpu side only
-			 * cpu10/cpu11/cpu12/codec17/codec18
-			 *
-			 * Because it will reach to the maximum of sound minor number,
-			 * disable it so far.
-			 * If you want to try it, please disable some other one instead.
-			 */
-			//&mcpu2
-
-			/*
-			 * [DPCM]: both FE / BE
-			 * cpu3/cpu4/codec3
-			 */
-			 &fe00 &fe01 &be0
-
-			/*
-			 * [DPCM-Multi]: both FE / BE
-			 * cpu5/cpu6/codec4/codec5
-			 */
-			 &fe10 &fe11 &be1
-
-			/*
-			 * [Codec2Codec]: cpu side only
-			 * codec6/codec7
-			 */
-			 &c2c
-
-			/*
-			 * [Codec2Codec-Multi]: cpu side only
-			 * codec8/codec9/codec10/codec11
-			 */
-			 &c2c_m
-		>;
-
-		multi {
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			/*
-			 * [Multi-CPU-0]
-			 *
-			 *		+---+		+---+
-			 *	cpu1 <--|A X|<-@------->|x a|-> codec1
-			 *	cpu2 <--|B  |		|  b|-> codec2
-			 *		+---+		+---+
-			 */
-			ports@0 {
-				reg = <0>;
-				#address-cells = <1>;
-				#size-cells = <0>;
-			mcpu0:	port@0 { reg = <0>; mcpu00_ep: endpoint { remote-endpoint = <&mcodec00_ep>; };};/* (X) to pair */
-				port@1 { reg = <1>; mcpu01_ep: endpoint { remote-endpoint = <&cpu1_ep>;     };};/* (A) Multi Element */
-				port@2 { reg = <2>; mcpu02_ep: endpoint { remote-endpoint = <&cpu2_ep>;     };};/* (B) Multi Element */
-			};
-
-			/*
-			 * [Multi-Codec-0]
-			 *
-			 *		+---+		+---+
-			 *	cpu1 <--|A X|<-@------->|x a|-> codec1
-			 *	cpu2 <--|B  |		|  b|-> codec2
-			 *		+---+		+---+
-			 */
-			ports@1 {
-				reg = <1>;
-				#address-cells = <1>;
-				#size-cells = <0>;
-				port@0 { reg = <0>; mcodec00_ep: endpoint { remote-endpoint = <&mcpu00_ep>; };};/* (x) to pair */
-				port@1 { reg = <1>; mcodec01_ep: endpoint { remote-endpoint = <&codec1_ep>; };};/* (a) Multi Element */
-				port@2 { reg = <2>; mcodec02_ep: endpoint { remote-endpoint = <&codec2_ep>; };};/* (b) Multi Element */
-			};
-
-			/*
-			 * [DPCM-Multi]::BE
-			 *
-			 *	FE			BE
-			 *		  ****		+---+
-			 *	cpu5 <-@--*  *-----@--->|x a|-> codec4
-			 *	cpu6 <-@--*  *		|  b|-> codec5
-			 *		  ****		+---+
-			 */
-			ports@2 {
-				reg = <2>;
-				#address-cells = <1>;
-				#size-cells = <0>;
-				port@0 { reg = <0>; mbe_ep:  endpoint { remote-endpoint = <&be10_ep>;   };};/* (x) to pair */
-				port@1 { reg = <1>; mbe1_ep: endpoint { remote-endpoint = <&codec4_ep>; };};/* (a) Multi Element */
-				port@2 { reg = <2>; mbe2_ep: endpoint { remote-endpoint = <&codec5_ep>; };};/* (b) Multi Element */
-			};
-
-			/*
-			 * [Codec2Codec-Multi]::CPU
-			 *
-			 *		+---+
-			 *	   +-@->|X A|-> codec8
-			 *	   |	|  B|-> codec9
-			 *	   |	+---+
-			 *	   |	+---+
-			 *	   +--->|x a|-> codec10
-			 *		|  b|-> codec11
-			 *		+---+
-			 */
-			ports@3 {
-				reg = <3>;
-				#address-cells = <1>;
-				#size-cells = <0>;
-				port@0 { reg = <0>; mc2c0_ep:  endpoint { remote-endpoint = <&c2cmf_ep>;  };};/* (X) to pair */
-				port@1 { reg = <1>; mc2c00_ep: endpoint { remote-endpoint = <&codec8_ep>; };};/* (A) Multi Element */
-				port@2 { reg = <2>; mc2c01_ep: endpoint { remote-endpoint = <&codec9_ep>; };};/* (B) Multi Element */
-			};
-
-			/*
-			 * [Codec2Codec-Multi]::Codec
-			 *
-			 *		+---+
-			 *	   +-@->|X A|-> codec8
-			 *	   |	|  B|-> codec9
-			 *	   |	+---+
-			 *	   |	+---+
-			 *	   +--->|x a|-> codec10
-			 *		|  b|-> codec11
-			 *		+---+
-			 */
-			ports@4 {
-				reg = <4>;
-				#address-cells = <1>;
-				#size-cells = <0>;
-				port@0 { reg = <0>; mc2c1_ep:  endpoint { remote-endpoint = <&c2cmb_ep>;   };};/* (x) to pair */
-				port@1 { reg = <1>; mc2c10_ep: endpoint { remote-endpoint = <&codec10_ep>; };};/* (a) Multi Element */
-				port@2 { reg = <2>; mc2c11_ep: endpoint { remote-endpoint = <&codec11_ep>; };};/* (b) Multi Element */
-			};
-
-			/*
-			 * [Semi-Multi]
-			 *
-			 *			+---+
-			 *	cpu7 <-@------->|X A|-> codec12
-			 *			|  B|-> codec13
-			 *			+---+
-			 */
-			ports@5 {
-				reg = <5>;
-				#address-cells = <1>;
-				#size-cells = <0>;
-				port@0 { reg = <0>; smcodec0_ep: endpoint { remote-endpoint = <&cpu7_ep>;    };};/* (X) to pair */
-				port@1 { reg = <1>; smcodec1_ep: endpoint { remote-endpoint = <&codec12_ep>; };};/* (A) Multi Element */
-				port@2 { reg = <2>; smcodec2_ep: endpoint { remote-endpoint = <&codec13_ep>; };};/* (B) Multi Element */
-			};
-
-			/*
-			 * [Multi-CPU-1]
-			 *
-			 *		+---+		+---+
-			 *		|  X|<-@------->|x  |
-			 *		|   |		|   |
-			 *	cpu8 <--|A 1|<--------->|3 a|-> codec14
-			 *	cpu9 <--|B 2|<---+----->|4 b|-> codec15
-			 *		+---+	  \---->|5 c|-> codec16
-			 *				+---+
-			 */
-			ports@6 {
-				reg = <6>;
-				#address-cells = <1>;
-				#size-cells = <0>;
-			mcpu1:	port@0 { reg = <0>; mcpu10_ep: endpoint { remote-endpoint = <&mcodec10_ep>; };};    /* (X) to pair */
-				port@1 {
-					#address-cells = <1>;
-					#size-cells = <0>;
-					reg = <1>;
-					mcpu11_ep:   endpoint@0 { reg = <0>; remote-endpoint = <&cpu8_ep>;       }; /* (A) Multi Element */
-					mcpu11_ep_0: endpoint@1 { reg = <1>; remote-endpoint = <&mcodec11_ep_0>; }; /* (1) connected Codec */
-				};
-				port@2 {
-					#address-cells = <1>;
-					#size-cells = <0>;
-					reg = <2>;
-					mcpu12_ep:   endpoint@0 { reg = <0>; remote-endpoint = <&cpu9_ep>;       }; /* (B) Multi Element */
-					mcpu12_ep_0: endpoint@1 { reg = <1>; remote-endpoint = <&mcodec12_ep_0>; }; /* (2) connected Codec */
-					mcpu12_ep_1: endpoint@2 { reg = <2>; remote-endpoint = <&mcodec13_ep_0>; }; /* (2) connected Codec */
-				};
-			};
-
-			/*
-			 * [Multi-Codec-1]
-			 *
-			 *		+---+		+---+
-			 *		|  X|<-@------->|x  |
-			 *		|   |		|   |
-			 *	cpu8 <--|A 1|<--------->|3 a|-> codec14
-			 *	cpu9 <--|B 2|<---+----->|4 b|-> codec15
-			 *		+---+	  \---->|5 c|-> codec16
-			 *				+---+
-			 */
-			ports@7 {
-				reg = <7>;
-				#address-cells = <1>;
-				#size-cells = <0>;
-				port@0 { reg = <0>; mcodec10_ep: endpoint { remote-endpoint = <&mcpu10_ep>;  };};   /* (x) to pair */
-				port@1 {
-					#address-cells = <1>;
-					#size-cells = <0>;
-					reg = <1>;
-					mcodec11_ep:   endpoint@0 { reg = <0>; remote-endpoint = <&codec14_ep>;  }; /* (a) Multi Element */
-					mcodec11_ep_0: endpoint@1 { reg = <1>; remote-endpoint = <&mcpu11_ep_0>; }; /* (3) connected CPU */
-				};
-				port@2 {
-					#address-cells = <1>;
-					#size-cells = <0>;
-					reg = <2>;
-					mcodec12_ep:   endpoint@0 { reg = <0>; remote-endpoint = <&codec15_ep>;  }; /* (b) Multi Element */
-					mcodec12_ep_0: endpoint@1 { reg = <1>; remote-endpoint = <&mcpu12_ep_0>; }; /* (4) connected CPU */
-				};
-				port@3 {
-					#address-cells = <1>;
-					#size-cells = <0>;
-					reg = <3>;
-					mcodec13_ep:   endpoint@0 { reg = <0>; remote-endpoint = <&codec16_ep>;  }; /* (c) Multi Element */
-					mcodec13_ep_0: endpoint@1 { reg = <1>; remote-endpoint = <&mcpu12_ep_1>; }; /* (5) connected CPU */
-				};
-			};
-
-			/*
-			 * [Multi-CPU-2]
-			 *
-			 *		+---+		+---+
-			 *		|  X|<-@------->|x  |
-			 *		|   |		|   |
-			 *	cpu10 <-|A 1|<--------->|4 a|-> codec17
-			 *	cpu11 <-|B 2|<-----+--->|5 b|-> codec18
-			 *	cpu12 <-|C 3|<----/	+---+
-			 *		+---+
-			 */
-			ports@8 {
-				reg = <8>;
-				#address-cells = <1>;
-				#size-cells = <0>;
-			mcpu2:	port@0 { reg = <0>; mcpu20_ep: endpoint { remote-endpoint = <&mcodec20_ep>; };};    /* (X) to pair */
-				port@1 {
-					#address-cells = <1>;
-					#size-cells = <0>;
-					reg = <1>;
-					mcpu21_ep:   endpoint@0 { reg = <0>; remote-endpoint = <&cpu10_ep>;      }; /* (A) Multi Element */
-					mcpu21_ep_0: endpoint@1 { reg = <1>; remote-endpoint = <&mcodec21_ep_0>; }; /* (1) connected Codec */
-				};
-				port@2 {
-					#address-cells = <1>;
-					#size-cells = <0>;
-					reg = <2>;
-					mcpu22_ep:   endpoint@0 { reg = <0>; remote-endpoint = <&cpu11_ep>;      }; /* (B) Multi Element */
-					mcpu22_ep_0: endpoint@1 { reg = <1>; remote-endpoint = <&mcodec22_ep_0>; }; /* (2) connected Codec */
-				};
-				port@3 {
-					#address-cells = <1>;
-					#size-cells = <0>;
-					reg = <3>;
-					mcpu23_ep:   endpoint@0 { reg = <0>; remote-endpoint = <&cpu12_ep>;      }; /* (C) Multi Element */
-					mcpu23_ep_0: endpoint@1 { reg = <1>; remote-endpoint = <&mcodec22_ep_1>; }; /* (3) connected Codec */
-				};
-			};
-
-			/*
-			 * [Multi-Codec-2]
-			 *
-			 *		+---+		+---+
-			 *		|  X|<-@------->|x  |
-			 *		|   |		|   |
-			 *	cpu10 <-|A 1|<--------->|4 a|-> codec17
-			 *	cpu11 <-|B 2|<-----+--->|5 b|-> codec18
-			 *	cpu12 <-|C 3|<----/	+---+
-			 *		+---+
-			 */
-			ports@9 {
-				reg = <9>;
-				#address-cells = <1>;
-				#size-cells = <0>;
-				port@0 { reg = <0>; mcodec20_ep: endpoint { remote-endpoint = <&mcpu20_ep>;  };};   /* (x) to pair */
-				port@1 {
-					#address-cells = <1>;
-					#size-cells = <0>;
-					reg = <1>;
-					mcodec21_ep:   endpoint@0 { reg = <0>; remote-endpoint = <&codec17_ep>;  }; /* (a) Multi Element */
-					mcodec21_ep_0: endpoint@1 { reg = <1>; remote-endpoint = <&mcpu21_ep_0>; }; /* (4) connected CPU */
-				};
-				port@2 {
-					#address-cells = <1>;
-					#size-cells = <0>;
-					reg = <2>;
-					mcodec22_ep:   endpoint@0 { reg = <0>; remote-endpoint = <&codec18_ep>;  }; /* (b) Multi Element */
-					mcodec22_ep_0: endpoint@1 { reg = <1>; remote-endpoint = <&mcpu22_ep_0>; }; /* (5) connected CPU */
-					mcodec22_ep_1: endpoint@2 { reg = <2>; remote-endpoint = <&mcpu23_ep_0>; }; /* (5) connected CPU */
-				};
-			};
-		};
-
-		dpcm {
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			ports@0 {
-				reg = <0>;
-
-				#address-cells = <1>;
-				#size-cells = <0>;
-				/*
-				 * [DPCM]::FE
-				 *
-				 *	FE				BE
-				 *			****
-				 *	cpu3 <-@(fe00)--*  *--(be0)@--> codec3
-				 *	cpu4 <-@(fe01)--*  *		(44.1kHz)
-				 *			****
-				 */
-			fe00:	port@0 { reg = <0>; fe00_ep: endpoint { remote-endpoint = <&cpu3_ep>; }; };
-			fe01:	port@1 { reg = <1>; fe01_ep: endpoint { remote-endpoint = <&cpu4_ep>; }; };
-
-				/*
-				 * [DPCM-Multi]::FE
-				 *
-				 *		FE			BE
-				 *			****		+-+
-				 *	cpu5 <-@(fe10)--*  *---(be1)@-->| |-> codec4
-				 *	cpu6 <-@(fe11)--*  *		| |-> codec5
-				 *			****		+-+
-				 */
-			fe10:	port@2 { reg = <2>; fe10_ep: endpoint { remote-endpoint = <&cpu5_ep>; }; };
-			fe11:	port@3 { reg = <3>; fe11_ep: endpoint { remote-endpoint = <&cpu6_ep>; }; };
-			};
-
-			ports@1 {
-				reg = <1>;
-
-				#address-cells = <1>;
-				#size-cells = <0>;
-				/*
-				 * [DPCM]::BE
-				 *
-				 *	FE				BE
-				 *			****
-				 *	cpu3 <-@(fe00)--*  *--(be0)@--> codec3
-				 *	cpu4 <-@(fe01)--*  *		(44.1kHz)
-				 *			****
-				 */
-			be0:	port@0 { reg = <0>; be00_ep: endpoint { remote-endpoint = <&codec3_ep>; }; };
-
-				/*
-				 * [DPCM-Multi]::BE
-				 *
-				 *		FE			BE
-				 *			****		+-+
-				 *	cpu5 <-@(fe10)--*  *---(be1)@-->| |-> codec4
-				 *	cpu6 <-@(fe11)--*  *		| |-> codec5
-				 *			****		+-+
-				 */
-			be1:	port@1 { reg = <1>; be10_ep: endpoint { remote-endpoint = <&mbe_ep>; }; };
-			};
-		};
-
-		codec2codec {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			/*
-			 * [Codec2Codec]
-			 *
-			 *	+-@(c2c)-> codec6
-			 *	|
-			 *	+--------> codec7
-			 */
-			ports@0 {
-				reg = <0>;
-
-				#address-cells = <1>;
-				#size-cells = <0>;
-
-				/* use default settings */
-			c2c:	port@0 { reg = <0>; c2cf_ep: endpoint { remote-endpoint = <&codec6_ep>; }; };
-				port@1 { reg = <1>; c2cb_ep: endpoint { remote-endpoint = <&codec7_ep>; }; };
-			};
-
-			/*
-			 * [Codec2Codec-Multi]
-			 *
-			 *			+-+
-			 *	   +-@(c2c_m)-->| |-> codec8
-			 *	   |		| |-> codec9
-			 *	   |		+-+
-			 *	   |		+-+
-			 *	   +----------->| |-> codec10
-			 *			| |-> codec11
-			 *			+-+
-			 */
-			ports@1 {
-				reg = <1>;
-
-				#address-cells = <1>;
-				#size-cells = <0>;
-
-				/* use original settings */
-				rate = <48000>;
-			c2c_m:	port@0 { reg = <0>; c2cmf_ep: endpoint { remote-endpoint = <&mc2c0_ep>; }; };
-				port@1 { reg = <1>; c2cmb_ep: endpoint { remote-endpoint = <&mc2c1_ep>; }; };
-			};
-		};
-	};
-
-	test_cpu {
-		/*
-		 * update compatible to indicate more detail behaviour
-		 * if you want. see test-compatible for more detail.
-		 *
-		 * ex)
-		 *	- compatible = "test-cpu";
-		 *	+ compatible = "test-cpu-verbose";
-		 */
-		compatible = "test-cpu";
-		ports {
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			bitclock-master;
-			frame-master;
-			/* [Normal] */
-			cpu0: port@0 { reg = <0>; cpu0_ep: endpoint { remote-endpoint = <&codec0_ep>; }; };
-
-			/* [Multi-CPU-0] */
-			      port@1 { reg = <1>; cpu1_ep: endpoint { remote-endpoint = <&mcpu01_ep>; }; };
-			      port@2 { reg = <2>; cpu2_ep: endpoint { remote-endpoint = <&mcpu02_ep>; }; };
-
-			/* [DPCM]::FE */
-			      port@3 { reg = <3>; cpu3_ep: endpoint { remote-endpoint = <&fe00_ep>; }; };
-			      port@4 { reg = <4>; cpu4_ep: endpoint { remote-endpoint = <&fe01_ep>; }; };
-
-			/* [DPCM-Multi]::FE */
-			      port@5 { reg = <5>; cpu5_ep: endpoint { remote-endpoint = <&fe10_ep>; }; };
-			      port@6 { reg = <6>; cpu6_ep: endpoint { remote-endpoint = <&fe11_ep>; }; };
-
-			/* [Semi-Multi] */
-			sm0:  port@7 { reg = <7>; cpu7_ep: endpoint { remote-endpoint = <&smcodec0_ep>; }; };
-
-			/* [Multi-CPU-1] */
-			      port@8 { reg = <8>; cpu8_ep: endpoint { remote-endpoint = <&mcpu11_ep>;   }; };
-			      port@9 { reg = <9>; cpu9_ep: endpoint { remote-endpoint = <&mcpu12_ep>;   }; };
-			/* [Multi-CPU-2] */
-			      port@a { reg = <10>; cpu10_ep: endpoint { remote-endpoint = <&mcpu21_ep>; }; };
-			      port@b { reg = <11>; cpu11_ep: endpoint { remote-endpoint = <&mcpu22_ep>; }; };
-			      port@c { reg = <12>; cpu12_ep: endpoint { remote-endpoint = <&mcpu23_ep>; }; };
-		};
-	};
-
-	test_codec {
-		/*
-		 * update compatible to indicate more detail behaviour
-		 * if you want. see test-compatible for more detail.
-		 *
-		 * ex)
-		 *	- compatible = "test-codec";
-		 *	+ compatible = "test-codec-verbose";
-		 */
-		compatible = "test-codec";
-		ports {
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			/*
-			 * prefix can be added to *component*,
-			 * see audio-graph-card2::routing
-			 */
-			prefix = "TC";
-
-			/* [Normal] */
-			port@0  { reg = <0>; codec0_ep:  endpoint { remote-endpoint = <&cpu0_ep>; }; };
-
-			/* [Multi-Codec-0] */
-			port@1  { reg = <1>; codec1_ep:  endpoint { remote-endpoint = <&mcodec01_ep>; }; };
-			port@2  { reg = <2>; codec2_ep:  endpoint { remote-endpoint = <&mcodec02_ep>; }; };
-
-			/* [DPCM]::BE */
-			port@3  {
-				convert-rate = <44100>;
-				reg = <3>; codec3_ep:  endpoint { remote-endpoint = <&be00_ep>; };
-			};
-
-			/* [DPCM-Multi]::BE */
-			port@4  { reg = <4>; codec4_ep:  endpoint { remote-endpoint = <&mbe1_ep>; }; };
-			port@5  { reg = <5>; codec5_ep:  endpoint { remote-endpoint = <&mbe2_ep>; }; };
-
-			/* [Codec2Codec] */
-			port@6  { bitclock-master;
-				  frame-master;
-				  reg = <6>; codec6_ep:  endpoint { remote-endpoint = <&c2cf_ep>; }; };
-			port@7  { reg = <7>; codec7_ep:  endpoint { remote-endpoint = <&c2cb_ep>; }; };
-
-			/* [Codec2Codec-Multi] */
-			port@8  { bitclock-master;
-				  frame-master;
-				  reg = <8>;  codec8_ep:  endpoint { remote-endpoint = <&mc2c00_ep>; }; };
-			port@9  { reg = <9>;  codec9_ep:  endpoint { remote-endpoint = <&mc2c01_ep>; }; };
-			port@a  { reg = <10>; codec10_ep: endpoint { remote-endpoint = <&mc2c10_ep>; }; };
-			port@b  { reg = <11>; codec11_ep: endpoint { remote-endpoint = <&mc2c11_ep>; }; };
-
-			/* [Semi-Multi] */
-			port@c { reg = <12>; codec12_ep: endpoint { remote-endpoint = <&smcodec1_ep>; }; };
-			port@d { reg = <13>; codec13_ep: endpoint { remote-endpoint = <&smcodec2_ep>; }; };
-
-			/* [Multi-Codec-1] */
-			port@e  { reg = <14>; codec14_ep: endpoint { remote-endpoint = <&mcodec11_ep>; }; };
-			port@f  { reg = <15>; codec15_ep: endpoint { remote-endpoint = <&mcodec12_ep>; }; };
-			port@10 { reg = <16>; codec16_ep: endpoint { remote-endpoint = <&mcodec13_ep>; }; };
-			/* [Multi-Codec-2] */
-			port@11 { reg = <17>; codec17_ep: endpoint { remote-endpoint = <&mcodec21_ep>; }; };
-			port@12 { reg = <18>; codec18_ep: endpoint { remote-endpoint = <&mcodec22_ep>; }; };
-		};
-	};
-};
-- 
2.43.0

