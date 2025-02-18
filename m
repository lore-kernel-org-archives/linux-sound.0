Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010066.outbound.protection.outlook.com [52.101.228.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE71B1DFF0
	for <linux-sound@vger.kernel.org>; Tue, 18 Feb 2025 01:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739841292; cv=fail; b=bJIGIugMqEEZRiFLAskaOQRUlGiLMUZyIFoP677d1C0h+UqrQsShH1aSWgrqvck4AY8ubxS2DNzw2E651jFcMjrA8k3UjHXS1Yh8Qkh1Brq1ZL8DZzwmgbdHXHQZKG7NJLyHS5+S9zn2un0gD4wcO06XbWMfq6+oB9YKw0BmNIc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739841292; c=relaxed/simple;
	bh=nJvc5eiGXHI2zrwqMtjyWXDW3EjSIc9rvtTw9ULgb4g=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=OA4aIgO5LCz+0BDvzZZqB5x6PO2I4nE/Qz6WyG2muXG5FN1vLArFWX8hXymjQumDVcnmPjByPpMgfFeQ6axPrriap7QM2BGPVZrgfwtpf4N88F09AbazqLJkDbL5pC7tDu2K7JW9ufRoHqTYqbtPNfu2unPZNkw+QddPg2nzc98=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=f5mgORF+; arc=fail smtp.client-ip=52.101.228.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="f5mgORF+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cXm0lKPmffPiengDusS5SfcO6UhCITefTatiOkWd+AkPP+Pze+C6XU5BjGHnJGXU0BZFOLfekNVh9BGK89sF45ydwDk1gAVoI67nAUur2bv5gob0gKYm1EliCvoGLDAGDS8gBmb4aAOdLXYFBXKpLV0iU0781nvb+IOa3fLLzrHnwVXwMwTtKnkPmclAQFDBRTFfSo5rDoYSi0izrIF7QCTt7Dm4Z/8bOWBqC1zBim/hCZNxlSWHHvdoJWspI6KvXreicRJLbtWRcZjSBhu5E4tervEwGttMNTZUbX50maaI79m76sqZBgcc+IayE0G5fKKkMgf9tBR+Q2kIJZpipg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DGabqTSdJz6W3n8oyW+VgIDzqvqciR5BfI0CYcwGfq8=;
 b=cXUAFXya8ODbgUMmCosqjgBe2N5nJH28fqAYV3gvUveT/XJJ01mrtccfbhRVpvQKbmDWJWVbiMyqZDZD9WGOKxBwNL076Iz+6BLSe2/Piet1eyK+FJFH8VWEsnhTMnqGaYQGexhP8pShWzHncf/HEcPbdkMABsiNcI/p+Crbop6im4+3/kg8h5LbSxg7b3tdFpilKFog8RgFAa8qqw7EgZ0iIBkc4BDyBDNbmjj1TfdN42DJgTwfiNTYiDxg4LnPgdCGQyxN0Y2TJX8OS/tfHUMXK64FYUlJT/1Ku9iX5t0fO76QMCvYyEuTX36kGkWnJ7nVJtvKN0Iv6twSVVyzsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DGabqTSdJz6W3n8oyW+VgIDzqvqciR5BfI0CYcwGfq8=;
 b=f5mgORF+po0D4LFlA4UNC81Iiiro6HsmYUPXHIOEoSu3XhJNd+UecX3q3amNIRLHxvyXhnBnO9AnvT7EIFeFjrF/dA3KvIldjq7ZqmN2zVL5bispJ7UnMb7WOXCeUAmcaE1joiUCaimm78SFfe9ng7xYWF77nTL6cgakCXVeYMk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB10906.jpnprd01.prod.outlook.com
 (2603:1096:400:3af::14) by TYCPR01MB5934.jpnprd01.prod.outlook.com
 (2603:1096:400:40::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.20; Tue, 18 Feb
 2025 01:14:47 +0000
Received: from TY3PR01MB10906.jpnprd01.prod.outlook.com
 ([fe80::592:9b7b:ef57:2dd8]) by TY3PR01MB10906.jpnprd01.prod.outlook.com
 ([fe80::592:9b7b:ef57:2dd8%4]) with mapi id 15.20.8445.017; Tue, 18 Feb 2025
 01:14:47 +0000
Message-ID: <87wmdo9hq0.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 1/3] ASoC: audio-graph-card2-custom-sample1.dtsi: Separate Sample DT
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87y0y49hqe.wl-kuninori.morimoto.gx@renesas.com>
References: <87y0y49hqe.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 18 Feb 2025 01:14:47 +0000
X-ClientProxiedBy: TYCP286CA0238.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c7::11) To TY3PR01MB10906.jpnprd01.prod.outlook.com
 (2603:1096:400:3af::14)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB10906:EE_|TYCPR01MB5934:EE_
X-MS-Office365-Filtering-Correlation-Id: 934da0d1-5c65-486b-0709-08dd4fb9a2f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?TZndYKBdieRU2vy/yJG7zNrrxdyJb27tqbh0/7O7mf2NvTQSVYh8zuNNc1qt?=
 =?us-ascii?Q?UdXI3k9sD6pzGJ0cLOrnnZyseG9gFdm+tUYmjkr4UJRk19VJc/LXlnlnwsVK?=
 =?us-ascii?Q?05pbdwjtt+dwlL4dlgydaE8rmqvDi8cT+M71T4BrR2hZTGFKU8bzgJpXEhT4?=
 =?us-ascii?Q?LDSWhuOBdxwYgtu3dU1VLEHzuFKf/HDsVae95WO5M/PH4TceQlxOuLbNLlsA?=
 =?us-ascii?Q?N4THT5KSP55KWaVazqL4wGanwC+e/DHldzuNx495XQngxoSVSvhhMcsDjCTS?=
 =?us-ascii?Q?PD7VIWOV0u4a8krRcLzrZbVRESKJnDPcoOV8+jy0wXGaSQXBi+rO3XLhz6u0?=
 =?us-ascii?Q?LgjS3KEUWwpXD87uD1pm0BsF0BoOASuLxvS/jOitfV3+oo8mvECkn6VGwuSL?=
 =?us-ascii?Q?t8KDP33s2qnC8OGC73m4JneUWKuIlaKm9spjpX/BBstrnXEJRfcku5qjOACH?=
 =?us-ascii?Q?tgVX13Mf8Ar7w+qfikf9PdS+JpYo7B4zNvJio33mGVjjQJCwyE+tvTl1x5GR?=
 =?us-ascii?Q?qb2I01dHNqOp7TrIs2W2eB9lLllJdLVeIJFlHOydrEOLF2mRLBlFXzasZRgr?=
 =?us-ascii?Q?M6F0f5XDSKQiJpqbxMhfqpaK7Ilj3b6Otc1Q2D2jbT9OmGdE9CPOYnFBfc3S?=
 =?us-ascii?Q?g48zdS7xo/jjiqsxmrOsLiqRS6R90nGhCyKMz1ow9qi3R3DaQ2sxvQZt+bVD?=
 =?us-ascii?Q?tTHFGobBG52895Z3KsLlAuyBfuDT/DK6CXITXk+VWctggAtadoGPDhXa7Kkj?=
 =?us-ascii?Q?5QVr4c+Puta6oJ/V0/ZML/rRVIHj3g3GLCFSh5xm6e/WOrYnjhtS6mBsguOD?=
 =?us-ascii?Q?SLNF0V4jYJVHnupUILFBsnpihSNzZax5Ta++2uzMBPMdnPvMpN9HIaIHVaii?=
 =?us-ascii?Q?IXydAKKVUoCYafGK0mN329dxvxy9n0l8qdO/5E8FO5TyF0ii4+YF3kN+SMtQ?=
 =?us-ascii?Q?ySrkX3xiWz2XkEuMVd5aC5XvE4tOEijUoO5Ol9enPYpHPqb+8X7MCdHvxFOH?=
 =?us-ascii?Q?NH9NRw3JBH75HIKdMWd301SQYsHUp+xdUcLK533dVM0XdspUL9OpRu2MCXmF?=
 =?us-ascii?Q?8wqbjB+GLIv+qW5/+lNsDfMzHFNHVmBIjAAEDdXWSBq1PdVU5euMfmwE8pRc?=
 =?us-ascii?Q?NXqGrRoeq6sqEPQSZBFZAec6FB0xy9v3E9uWzgipi0KNurnAa8NrAR9E4aME?=
 =?us-ascii?Q?2qGXJLCp9uwSRaAcDSoDJN6t0btNNuvofs/YZCU1zemHI75zFaJ7nRLuqdzK?=
 =?us-ascii?Q?A9QHoLttWWHZUN314ysDy9+SAJjZkcghi+7uSHOajIUdJdzeB0lbqNNfp5KP?=
 =?us-ascii?Q?JmNR+kFIgEk109cpNnEF0UXx1nXC3eH0hYMT1YjNcFtRh0391An0/zsH80Jn?=
 =?us-ascii?Q?/a4QGRz0RalhhTckPKaFIyCcNwV7ByHXRD4i625TZSlEwiwdUX+N77IxDSXN?=
 =?us-ascii?Q?WHECMNWvk5E=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB10906.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?EWC2brH2Y5Q14Pm4SgMUT8hsZtdwyRtdFHssuyOmbMRhwLsyUqAER9rWA9dp?=
 =?us-ascii?Q?A43bB9OqzFb1OItS4rNqjX5wQ4nKgTUW77UtKlszTF5+ydnQXTlfHy3uoOoc?=
 =?us-ascii?Q?Q7fTbs15l1nZKeINH7ulGbel68WPK3azBET9EIOEInC0Eq9G7yrxQT8ezE4r?=
 =?us-ascii?Q?kqxgdBmgs8NzZrRJKF7CMP2Zq2ZGoQ08NDuAIngA8bb4s06mWHN5o59ORDTQ?=
 =?us-ascii?Q?W788S4wcYVXPtYSP9mPiG0CITjJKcwFXBDd4Gg80IJMflysYiLc7IclltpFf?=
 =?us-ascii?Q?U97SO1KDToFFGaeRaDvsysqI5hCnwLasJkjd18VEKow1ZH61rXRMdQ3HOnAV?=
 =?us-ascii?Q?U0P7z2FQUtI56LcpkDAtfI+xwl+oeTxCzWpvX1O1Kze14xQzEI2+jncXSgiC?=
 =?us-ascii?Q?wUPam1R2jC3NoC+/LEZd9Yn/aHi0x0cjyzS+HVxaiYqKZdWblX0x0qMu+2yh?=
 =?us-ascii?Q?Zhbxc1mMS6zk4hUAvczPk9ERCa9mGXgFJH210EwjRY+7EErEmARQNqY5cc3G?=
 =?us-ascii?Q?VHYZE7pbMVep0T7bb6xhqYWBvifesLhXSuDd7YIZhfA5sW2UIznhrS3LEv5Q?=
 =?us-ascii?Q?rtEtiM38t4EorCcwdNeAI71RnJYxXoyQKDUat2c3Gwh2sJGlZ6bgu8Z6a1d5?=
 =?us-ascii?Q?FKlEi3QGRq7GW3VFeKWbx5ZTjxebxzBK7onPmiVUjsZpUhEq8xUkp9Vo1i+7?=
 =?us-ascii?Q?EGBGqd4k1N1nfV+9QR67YlaYoWjcxTxtVPnh4999f3EVtt1eOuhicywslQcX?=
 =?us-ascii?Q?fChpY7L8bhRz4T7dZM3H8ZHqUwyoa78Wr2yy2xleTlolUhA4jmvsoQF12cZ8?=
 =?us-ascii?Q?Tc1mGBcE7xJa8H3of38qpYp7cVE7EgyVwYTi8rpzR7YnwHbGSJYML2jTVc3H?=
 =?us-ascii?Q?9tq+Si5mOHwLyHiK9p2xv366QJ7ltRM3b0n0bIwsC590m+gjrKzZ2tJz0rcC?=
 =?us-ascii?Q?6pHzbS0dPnUk7XZX3b7NRz9XMaEh3Q7HMIeIlHkV34DYum8nK7IUokZ8ook+?=
 =?us-ascii?Q?1wbl3I/Lyy7/vBIjZTYsFL/jcrVDJHsDoKlZ6/Ryk8XuNfm8Q4X1YbX3lUhu?=
 =?us-ascii?Q?dVlxfpSEcN/SnVTIyMljruv0kmr5kMGedtbls5x1PNWrDBwhSmB5Vk6mjC0p?=
 =?us-ascii?Q?m+OBeNQDgCvQZu5KSGIGGmiZ1dj53yd0LLuN85I1hIgM4EJZGYUGgzI0y8kg?=
 =?us-ascii?Q?Q5Igi/6KV+XLfu/8AWKQ8VopiPPVIUsfrPt3kF7eEqk3cGkJxGC6byfe379w?=
 =?us-ascii?Q?iECukLM5i4ZAwEky6p8Yl3kpwkHw8bBj6kWghCY1LTsEqUpEbyez0gmO0xD/?=
 =?us-ascii?Q?lG1cm2FcgMAbShIF4aWbpsYIbkuRwuSKKSOmUb5Oq1dm6dl76iPyHiMdOOiD?=
 =?us-ascii?Q?7XnFO/JK8MzwHNAbQ06CMiKFsGQr4KcwNH72vC4plzrp0TAnDTm2FUdlBahZ?=
 =?us-ascii?Q?RCUNfncC+3SV+UZEgKex5GdhjAer4zNuUYwvedvdC0ut3fWMtZtTrBiHeZU8?=
 =?us-ascii?Q?P0TtjljiaBXy5XXZBMpO9rjzVSJHGF9wkdsdU0ejlj+jIDBkiA5XogruQrNN?=
 =?us-ascii?Q?eeJf8ESG8HpfR1CH3YISj2bpV/gSSeHih7JFLVEszJXOCXNUmAo3hjGxSg5L?=
 =?us-ascii?Q?z5FXkuTIgK/tQWR4XZiOoI0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 934da0d1-5c65-486b-0709-08dd4fb9a2f0
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB10906.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2025 01:14:47.8680
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BA1ZrOJZ9ea3V8AJv8gNy4qKCgp/1qLZ9woU8jFwD5q2Q1Bo9v/qv08NHb1OvDR+sieMl9VsTk1P9F8CadVoSwSaV835WItvD2BuE9zyhDb80G8kG8UqPOGamHb6vEQh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB5934

audio-graph-card2-custom-sample has many sample connections, but because
ALSA card has number limition for links, it is impossible to have all
samples into 1 ASoC card.

Separate it and took the normal connection part.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 .../audio-graph-card2-custom-sample1.dtsi     | 396 ++++++++++++++++++
 1 file changed, 396 insertions(+)
 create mode 100644 sound/soc/generic/audio-graph-card2-custom-sample1.dtsi

diff --git a/sound/soc/generic/audio-graph-card2-custom-sample1.dtsi b/sound/soc/generic/audio-graph-card2-custom-sample1.dtsi
new file mode 100644
index 0000000000000..12d40e05de466
--- /dev/null
+++ b/sound/soc/generic/audio-graph-card2-custom-sample1.dtsi
@@ -0,0 +1,396 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * audio-graph-card2-custom-sample1.dtsi
+ *
+ * Copyright (C) 2020 Renesas Electronics Corp.
+ * Copyright (C) 2020 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
+ *
+ * This sample indicates how to use audio-graph-card2 and its
+ * custom driver. "audio-graph-card2-custom-sample" is the custome driver
+ * which is using audio-graph-card2.
+ *
+ * You can easily use this sample by adding below line on your DT file,
+ * and add new CONFIG to your .config.
+ *
+ *	#include "../../../../../sound/soc/generic/audio-graph-card2-custom-sample1.dtsi"
+ *
+ *	CONFIG_SND_AUDIO_GRAPH_CARD2
+ *	CONFIG_SND_AUDIO_GRAPH_CARD2_CUSTOM_SAMPLE
+ *	CONFIG_SND_TEST_COMPONENT
+ *
+ *
+ * You can indicate more detail each device behavior as debug if you modify
+ * "compatible" on each test-component. see below
+ *
+ *	test_cpu {
+ *	-	compatible = "test-cpu";
+ *	+	compatible = "test-cpu-verbose";
+ *		...
+ *	};
+ *
+ *	test_codec {
+ *	-	compatible = "test-codec";
+ *	+	compatible = "test-codec-verbose";
+ *		...
+ *	};
+ *
+ *
+ * Below sample doesn't use "format" property,
+ * because test-component driver (test-cpu/test-codec) is supporting
+ * snd_soc_dai_ops :: .auto_selectable_formats.
+ * see
+ *	snd_soc_runtime_get_dai_fmt()
+ *	linux/sound/soc/generic/test-component.c :: test_dai_formats
+ */
+/ {
+	audio-graph-card2-custom-sample-1 {
+		/*
+		 * You can use audio-graph-card2 directly by using
+		 *
+		 * compatible = "audio-graph-card2";
+		 */
+		compatible = "audio-graph-card2-custom-sample";
+		label = "card2-custom-sample-1";
+
+		/*
+		 * @ : used at links
+		 */
+		links = <
+			/*
+			 *
+			 * [Normal]
+			 *
+			 *	     <cpu1_0>
+			 *	cpu1_0 <-@-----> codec1_0
+			 */
+			 &cpu1_0 /* CPU side only */
+
+			/*
+			 * [Semi-Multi]
+			 *
+			 * CPU:Codec = 1:N
+			 *
+			 *		<sm>	+-+
+			 *	cpu1_1 <--@---->| |-> codec1_1
+			 *			| |-> codec1_2
+			 *			+-+
+			 */
+			&sm /* CPU side only */
+
+			/*
+			 * [Multi-CPU/Codec-A]
+			 *
+			 *		 +-+ <mcpuA>	+-+
+			 *	cpu1_2 <-| |<---@------>| |-> codec1_3
+			 *	cpu1_3 <-| |		| |-> codec1_4
+			 *		 +-+		+-+
+			 */
+			&mcpuA /* CPU side only */
+
+			/*
+			 * [Multi-CPU/Codec-B]
+			 *
+			 *		 +-+ <mcpuB>	+-+
+			 *		 | |<---@------>| |
+			 *		 | |		| |
+			 *	cpu1_4 <-| |<---------->| |-> codec1_5
+			 *	cpu1_5 <-| |<---+------>| |-> codec1_6
+			 *		 +-+	 \----->| |-> codec1_7
+			 *				+-+
+			 */
+			&mcpuB /* CPU side only */
+
+			/*
+			 * [Multi-CPU/Codec-C]
+			 *
+			 *		 +-+ <mcpuC>	+-+
+			 *		 | |<---@------>| |
+			 *		 | |		| |
+			 *	cpu1_6 <-| |<---------->| |-> codec1_8
+			 *	cpu1_7 <-| |<-----+---->| |-> codec1_9
+			 *	cpu1_8 <-| |<----/	+-+
+			 *		 +-+
+			 */
+			&mcpuC /* CPU side only */
+		>;
+
+		multi {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			/*
+			 * [Semi-Multi]
+			 *
+			 *		<sm>	+---+
+			 *	cpu1_1 <---@--->|X A|-> codec1_1
+			 *			|  B|-> codec1_2
+			 *			+---+
+			 */
+			ports@0 {
+				reg = <0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				port@0 { reg = <0>; smcodec_ep:   endpoint { remote-endpoint = <&cpu1_1_ep>;   };};/* (X) to pair */
+				port@1 { reg = <1>; smcodec_A_ep: endpoint { remote-endpoint = <&codec1_1_ep>; };};/* (A) Multi Element */
+				port@2 { reg = <2>; smcodec_B_ep: endpoint { remote-endpoint = <&codec1_2_ep>; };};/* (B) Multi Element */
+			};
+
+			/*
+			 * [Multi-CPU-A]
+			 *
+			 *		 +---+ <mcpuA>	+---+
+			 *	cpu1_2 <-|A X|<---@---->|x a|-> codec1_3
+			 *	cpu1_3 <-|B  |		|  b|-> codec1_4
+			 *		 +---+		+---+
+			 */
+			ports@1 {
+				reg = <1>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			mcpuA:	port@0 { reg = <0>; mcpu_A_ep:  endpoint { remote-endpoint = <&mcodec_A_ep>; };}; /* (X) to pair */
+				port@1 { reg = <1>; mcpu_AA_ep: endpoint { remote-endpoint = <&cpu1_2_ep>;   };}; /* (A) Multi Element */
+				port@2 { reg = <2>; mcpu_AB_ep: endpoint { remote-endpoint = <&cpu1_3_ep>;   };}; /* (B) Multi Element */
+			};
+
+			/*
+			 * [Multi-Codec-A]
+			 *
+			 *		 +---+ <mcpuA>	+---+
+			 *	cpu1_2 <-|A X|<-@------>|x a|-> codec1_3
+			 *	cpu1_3 <-|B  |		|  b|-> codec1_4
+			 *		 +---+		+---+
+			 */
+			ports@2 {
+				reg = <2>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				port@0 { reg = <0>; mcodec_A_ep:  endpoint { remote-endpoint = <&mcpu_A_ep>;   };}; /* (x) to pair */
+				port@1 { reg = <1>; mcodec_Aa_ep: endpoint { remote-endpoint = <&codec1_3_ep>; };}; /* (a) Multi Element */
+				port@2 { reg = <2>; mcodec_Ab_ep: endpoint { remote-endpoint = <&codec1_4_ep>; };}; /* (b) Multi Element */
+			};
+
+			/*
+			 * [Multi-CPU-B]
+			 *
+			 *		 +---+ <mcpuB>	+---+
+			 *		 |  X|<---@---->|x  |
+			 *		 |   |		|   |
+			 *	cpu1_4 <-|A 1|<-------->|3 a|-> codec1_5
+			 *	cpu1_5 <-|B 2|<---+---->|4 b|-> codec1_6
+			 *		 +---+	   \--->|5 c|-> codec1_7
+			 *				+---+
+			 */
+			ports@3 {
+				reg = <3>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			mcpuB:	port@0 {
+					reg = <0>;
+					mcpu_BX_ep:     endpoint { remote-endpoint = <&mcodec_Bx_ep>; }; /* (X) to pair */
+				};
+				port@1 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <1>;
+					mcpu_BA_ep:   endpoint@0 { reg = <0>; remote-endpoint = <&cpu1_4_ep>;    }; /* (A) Multi Element */
+					mcpu_B1_ep:   endpoint@1 { reg = <1>; remote-endpoint = <&mcodec_B3_ep>; }; /* (1) connected Codec */
+				};
+				port@2 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <2>;
+					mcpu_BB_ep:   endpoint@0 { reg = <0>; remote-endpoint = <&cpu1_5_ep>;    }; /* (B) Multi Element */
+					mcpu_B2_0_ep: endpoint@1 { reg = <1>; remote-endpoint = <&mcodec_B4_ep>; }; /* (2) connected Codec */
+					mcpu_B2_1_ep: endpoint@2 { reg = <2>; remote-endpoint = <&mcodec_B5_ep>; }; /* (2) connected Codec */
+				};
+			};
+
+			/*
+			 * [Multi-Codec-B]
+			 *
+			 *		 +---+ <mcpuB>	+---+
+			 *		 |  X|<-@------>|x  |
+			 *		 |   |		|   |
+			 *	cpu1_4 <-|A 1|<-------->|3 a|-> codec1_5
+			 *	cpu1_5 <-|B 2|<---+---->|4 b|-> codec1_6
+			 *		 +---+	   \--->|5 c|-> codec1_7
+			 *				+---+
+			 */
+			ports@4 {
+				reg = <4>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				port@0 {
+					reg = <0>;
+					mcodec_Bx_ep:   endpoint { remote-endpoint = <&mcpu_BX_ep>;  }; /* (x) to pair */
+				};
+				port@1 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <1>;
+					mcodec_Ba_ep: endpoint@0 { reg = <0>; remote-endpoint = <&codec1_5_ep>;}; /* (a) Multi Element */
+					mcodec_B3_ep: endpoint@1 { reg = <1>; remote-endpoint = <&mcpu_B1_ep>; }; /* (3) connected CPU */
+				};
+				port@2 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <2>;
+					mcodec_Bb_ep: endpoint@0 { reg = <0>; remote-endpoint = <&codec1_6_ep>; }; /* (b) Multi Element */
+					mcodec_B4_ep: endpoint@1 { reg = <1>; remote-endpoint = <&mcpu_B2_0_ep>;}; /* (4) connected CPU */
+				};
+				port@3 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <3>;
+					mcodec_Bc_ep: endpoint@0 { reg = <0>; remote-endpoint = <&codec1_7_ep>; }; /* (c) Multi Element */
+					mcodec_B5_ep: endpoint@1 { reg = <1>; remote-endpoint = <&mcpu_B2_1_ep>;}; /* (5) connected CPU */
+				};
+			};
+
+			/*
+			 * [Multi-CPU-C]
+			 *
+			 *		 +---+ <mcpuC>	+---+
+			 *		 |  X|<-@------>|x  |
+			 *		 |   |		|   |
+			 *	cpu1_6 <-|A 1|<-------->|4 a|-> codec1_8
+			 *	cpu1_7 <-|B 2|<-----+-->|5 b|-> codec1_9
+			 *	cpu1_8 <-|C 3|<----/	+---+
+			 *		 +---+
+			 */
+			ports@5 {
+				reg = <5>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			mcpuC:	port@0 {
+					reg = <0>;
+					mcpu_CX_ep:   endpoint { remote-endpoint = <&mcodec_Cx_ep>; }; /* (X) to pair */
+				};
+				port@1 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <1>;
+					mcpu_CA_ep: endpoint@0 { reg = <0>; remote-endpoint = <&cpu1_6_ep>;    }; /* (A) Multi Element */
+					mcpu_C1_ep: endpoint@1 { reg = <1>; remote-endpoint = <&mcodec_C4_ep>; }; /* (1) connected Codec */
+				};
+				port@2 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <2>;
+					mcpu_CB_ep: endpoint@0 { reg = <0>; remote-endpoint = <&cpu1_7_ep>;      }; /* (B) Multi Element */
+					mcpu_C2_ep: endpoint@1 { reg = <1>; remote-endpoint = <&mcodec_C5_0_ep>; }; /* (2) connected Codec */
+				};
+				port@3 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <3>;
+					mcpu_CC_ep: endpoint@0 { reg = <0>; remote-endpoint = <&cpu1_8_ep>;      }; /* (C) Multi Element */
+					mcpu_C3_ep: endpoint@1 { reg = <1>; remote-endpoint = <&mcodec_C5_1_ep>; }; /* (3) connected Codec */
+				};
+			};
+
+			/*
+			 * [Multi-Codec-C]
+			 *
+			 *		 +---+ <mcpuC>	+---+
+			 *		 |  X|<-@------>|x  |
+			 *		 |   |		|   |
+			 *	cpu1_6 <-|A 1|<-------->|4 a|-> codec1_8
+			 *	cpu1_7 <-|B 2|<-----+-->|5 b|-> codec1_9
+			 *	cpu1_8 <-|C 3|<----/	+---+
+			 *		 +---+
+			 */
+			ports@6 {
+				reg = <6>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				port@0 {
+					reg = <0>;
+					mcodec_Cx_ep: endpoint { remote-endpoint = <&mcpu_CX_ep>;  }; /* (x) to pair */
+				};
+				port@1 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <1>;
+					mcodec_Ca_ep: endpoint@0 { reg = <0>; remote-endpoint = <&codec1_8_ep>;}; /* (a) Multi Element */
+					mcodec_C4_ep: endpoint@1 { reg = <1>; remote-endpoint = <&mcpu_C1_ep>; }; /* (4) connected CPU */
+				};
+				port@2 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <2>;
+					mcodec_Cb_ep:   endpoint@0 { reg = <0>; remote-endpoint = <&codec1_9_ep>;}; /* (b) Multi Element */
+					mcodec_C5_0_ep: endpoint@1 { reg = <1>; remote-endpoint = <&mcpu_C2_ep>; }; /* (5) connected CPU */
+					mcodec_C5_1_ep: endpoint@2 { reg = <2>; remote-endpoint = <&mcpu_C3_ep>; }; /* (5) connected CPU */
+				};
+			};
+		};
+	};
+
+	test_cpu_1 {
+		/*
+		 * update compatible to indicate more detail behaviour
+		 * if you want. see test-compatible for more detail.
+		 *
+		 * ex)
+		 *	- compatible = "test-cpu";
+		 *	+ compatible = "test-cpu-verbose";
+		 */
+		compatible = "test-cpu";
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			bitclock-master;
+			frame-master;
+
+				/* [Normal] */
+			cpu1_0:	port@0 { reg = <0>; cpu1_0_ep: endpoint { remote-endpoint = <&codec1_0_ep>;}; };
+				/* [Semi-Multi] */
+			sm:	port@1 { reg = <1>; cpu1_1_ep: endpoint { remote-endpoint = <&smcodec_ep>; }; };
+				/* [Multi-CPU-A] */
+				port@2 { reg = <2>; cpu1_2_ep: endpoint { remote-endpoint = <&mcpu_AA_ep>; }; };
+				port@3 { reg = <3>; cpu1_3_ep: endpoint { remote-endpoint = <&mcpu_AB_ep>; }; };
+				/* [Multi-CPU-B] */
+				port@4 { reg = <4>; cpu1_4_ep: endpoint { remote-endpoint = <&mcpu_BA_ep>; }; };
+				port@5 { reg = <5>; cpu1_5_ep: endpoint { remote-endpoint = <&mcpu_BB_ep>; }; };
+				/* [Multi-CPU-C] */
+				port@6 { reg = <6>; cpu1_6_ep: endpoint { remote-endpoint = <&mcpu_CA_ep>; }; };
+				port@7 { reg = <7>; cpu1_7_ep: endpoint { remote-endpoint = <&mcpu_CB_ep>; }; };
+				port@8 { reg = <8>; cpu1_8_ep: endpoint { remote-endpoint = <&mcpu_CC_ep>; }; };
+		};
+	};
+
+	test_codec_1 {
+		/*
+		 * update compatible to indicate more detail behaviour
+		 * if you want. see test-compatible for more detail.
+		 *
+		 * ex)
+		 *	- compatible = "test-codec";
+		 *	+ compatible = "test-codec-verbose";
+		 */
+		compatible = "test-codec";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			/* [Normal] */
+			port@0 { reg = <0>; codec1_0_ep: endpoint { remote-endpoint = <&cpu1_0_ep>;    }; };
+			/* [Semi-Multi] */
+			port@1 { reg = <1>; codec1_1_ep: endpoint { remote-endpoint = <&smcodec_A_ep>; }; };
+			port@2 { reg = <2>; codec1_2_ep: endpoint { remote-endpoint = <&smcodec_B_ep>; }; };
+			/* [Multi-Codec-0] */
+			port@3 { reg = <3>; codec1_3_ep: endpoint { remote-endpoint = <&mcodec_Aa_ep>; }; };
+			port@4 { reg = <4>; codec1_4_ep: endpoint { remote-endpoint = <&mcodec_Ab_ep>; }; };
+			/* [Multi-Codec-1] */
+			port@5 { reg = <5>; codec1_5_ep: endpoint { remote-endpoint = <&mcodec_Ba_ep>; }; };
+			port@6 { reg = <6>; codec1_6_ep: endpoint { remote-endpoint = <&mcodec_Bb_ep>; }; };
+			port@7 { reg = <7>; codec1_7_ep: endpoint { remote-endpoint = <&mcodec_Bc_ep>; }; };
+			/* [Multi-Codec-2] */
+			port@8 { reg = <8>; codec1_8_ep: endpoint { remote-endpoint = <&mcodec_Ca_ep>; }; };
+			port@9 { reg = <9>; codec1_9_ep: endpoint { remote-endpoint = <&mcodec_Cb_ep>; }; };
+		};
+	};
+};
-- 
2.43.0

