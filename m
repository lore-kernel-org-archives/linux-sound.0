Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010023.outbound.protection.outlook.com [52.101.228.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B8371DFF0
	for <linux-sound@vger.kernel.org>; Tue, 18 Feb 2025 01:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739841298; cv=fail; b=XXxG5M5hUDzz9Cn7MtuH5K50/Q/msciBR0j3M3z5h4J65t6A9kp5bXlOakc32FPT0CDn9n37R6my24lbMgw+8SkDAEzvhRZmfeYJVVi5WEy25GBd4symxbLFDurjIjj8qK9CUbIV7/sUEybR9PaBdmNXFl5MGeQrCa/Z2twQZBc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739841298; c=relaxed/simple;
	bh=F1FhQKiw4PCpqKkETIPk+OyxY9uDXk2ka9yKjk746+c=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=lc0ZWUbtEBwRFCWN1GdCe0NKw7wBtcLHHEBre4vPOk8kocF11m5C931+uovYfQLY3owcRKjfK2EvtHR3zzM7yw0LDU9TuqmzHIdy2HCbeciklWatxQim2ELhOVG/nh8PZ5odSXo+8jdTqzSAt7GhmKyXbjVp3BJYszOFyH3AHAY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=YFrO1c6H; arc=fail smtp.client-ip=52.101.228.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="YFrO1c6H"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mpsv8k0d66Vru3s1P63KOLuta1uIzYQizKK70HUqHYV0EXs5XSj7W5aM/kiMXq2z41PBzOXG2lN6uVwzzYMD4X6icm2rrNmBwsxYehThfx8ClFLVHfBR6bDo8/8k7fizC/6w/ONsgWc2a3/AELn6i8cw9Jxj6VjpW2cp66yP2oZmuRVRAGY6LTbkByx99DntEMOGvWPpuy8ROsYdnKcV1bMJB1jir+ZFkSEt9Hv9vUTlklVXmPt8IXjJNIOliEYV/mDoidHz+lw1i6K26T1u+kNKYqq8c70m5n4znkvUDXPPM220WWO/BEGoXXuTPS/fV7VceIww6vlJhmclRxopqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=myNTDciVCzCRKmbFiknqb5Oq/t6u9BaFgVd+7dpi+o8=;
 b=MqjEEgunOYTaI2LMVvQ1l+fICZPccmJ8whdolQERBPh42GaCy08lOTWYUoAbIpEcl/PYDuDjhPcdEjR6w3FApdyc2s4bJfZJU2gLGMIFJO5xC+EqxBmT9UJd41d65tOZ9nTDk+AbicoU9NUoPyBzT2t3qOUzDyWmkf6x7NYROM56KoZGbF3HRVFJteYyHJaAy0pl1efN24T9s6VPeeNJ5Hw4r3BjfMPWD7mdw7H7Csqa54YoRXFQYDr/va1nqbkiQLZ/nFCajaY0YOusYstFJzZdJnVnSZE1nFJv0ruWA9mWwpXiYRBazF4qbGcTAa9cixuL4SZCioROZUSh9QR2IA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=myNTDciVCzCRKmbFiknqb5Oq/t6u9BaFgVd+7dpi+o8=;
 b=YFrO1c6HIP1PqwvDj0iSsF/O8XLf4QyoJSWIRj7Q81ZixNnrKI/xB7tzS1SorxQZ8+fjdhf+jfaFW/pXpNy7u0+yAE7aSd0vxw3xnpo5iJlrRTb0Fgeguq56tjNoo3YS5PfK872oD9zhWmxuQFThQLYmIlQLdj+06E3hc7NLkA0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB10906.jpnprd01.prod.outlook.com
 (2603:1096:400:3af::14) by TYCPR01MB5934.jpnprd01.prod.outlook.com
 (2603:1096:400:40::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.20; Tue, 18 Feb
 2025 01:14:54 +0000
Received: from TY3PR01MB10906.jpnprd01.prod.outlook.com
 ([fe80::592:9b7b:ef57:2dd8]) by TY3PR01MB10906.jpnprd01.prod.outlook.com
 ([fe80::592:9b7b:ef57:2dd8%4]) with mapi id 15.20.8445.017; Tue, 18 Feb 2025
 01:14:54 +0000
Message-ID: <87v7t89hpt.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 2/3] ASoC: audio-graph-card2-custom-sample2.dtsi: Separate Sample DT
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87y0y49hqe.wl-kuninori.morimoto.gx@renesas.com>
References: <87y0y49hqe.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 18 Feb 2025 01:14:54 +0000
X-ClientProxiedBy: TYCP286CA0288.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c8::16) To TY3PR01MB10906.jpnprd01.prod.outlook.com
 (2603:1096:400:3af::14)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB10906:EE_|TYCPR01MB5934:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d3c59b2-48a8-41d3-d321-08dd4fb9a6d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wvIQz4whh35b2eGNty3PwWIyNcKdG6VYC2U2vIAYZQVkDz8I7H+m177fSIDx?=
 =?us-ascii?Q?wO9Ad8dfPKbyj2MI0jtzD5Csd1+bnod8XzurVMx1DC7G0oGv9hIWVx8N0R6k?=
 =?us-ascii?Q?A6bLvBnPkthi2bmyFDUEM0Z9KXR8Na70gPLLIYXmaZgw/adzb8lxGQgoDjdz?=
 =?us-ascii?Q?QUBYYdF6Qbn/tcft7Z94rxC1YoV1f7fHY7aaUHZND8lU42rcKl32FzFTHl+W?=
 =?us-ascii?Q?971VyqbTqzFFWwekw3/4EJJ+EXsVEQeZ4Slswn/v6h+dzhBwoASxkCI/VF6P?=
 =?us-ascii?Q?NgnkZ644BhphsFhijZJbwtdJ3qcSbzRD77EDJbj9wdf0UG8+mukmtoJBkmo3?=
 =?us-ascii?Q?yKfwejYQ36l8etVQsWQDBV8z0rLdMc18hS/eMa7NV+gVA0IM5OAgEPmQPRrR?=
 =?us-ascii?Q?RbbotQDHTT8sf8Fz/hn4tRcEfLFH2aJJX4xluscQKDX1wA+yOHPCYjX6cPkA?=
 =?us-ascii?Q?G0Y2vHyqkphaioDkfV+OvXYCiG7fftqTxzKgPoH5NQ5Pbi3Ph4qRp6OcptDY?=
 =?us-ascii?Q?0FkCB+ovze9ibaut+pQ83VDQmydcWPt7ikZeC+19bbUrVgG1N+NDJ9Kcm8WB?=
 =?us-ascii?Q?36+FR22DebjKqs7C8RtjGbKXki2QgnaU4I3V8MQaGzsKi2RWpVKTrEZ3RC60?=
 =?us-ascii?Q?kMpz4RWB5Z14/o+AZ8KaKmoR+s2X+REym4jn5rIFgc0AEzLLx3l2lItij41C?=
 =?us-ascii?Q?m/fBGkMvybIe3cnmd6w5mdC5qzzBgZPI4p8ZX/e8UJBjXqcRE37Aix4OVFwJ?=
 =?us-ascii?Q?pvsFzp7bJ2F75eaPeF5lxC6iNZzUVRYtaDESpYxc3x1k3n+T53uF/Dh83WoN?=
 =?us-ascii?Q?XcrTfwuYaH0cg0hladFSyPBqKvKTsedJ8MqP/pSk+XJcmbCXsmm5pdoO7ImY?=
 =?us-ascii?Q?fHuCkXKQP5i1FJa8gcdCnxbf2Gisr8HwC5wb5IL/QIKd3O+YnERl3p3Al8ko?=
 =?us-ascii?Q?7ZqSZsXF4KtejY9FnOl5nHohHHJ0+d1/yIbK2EX4FuOWqxVF0gqmjRSy9gdu?=
 =?us-ascii?Q?O9cy31IipqUeFEjsClHem1eRzIKlDKIrR6c2VYKK//WKqoWGwYbsPCv5qrgM?=
 =?us-ascii?Q?Q2Z7oZnvyHlcnBJ4FiHyOs2OGG+6AFnRWfI9EGMiv9fnhEpMVoDuJ1vZEZem?=
 =?us-ascii?Q?Gpx4GdyPyiWhsI7OBBdt8L5/TKTvY8Hqe1SQ03tlk7Vw9ZvvsI65bBIyTfih?=
 =?us-ascii?Q?PsC03I0F9YGVziv2Paf4lPoLBkalUhU/QAA7zKd/A4ym8lM8i6O/uBBCTBko?=
 =?us-ascii?Q?YC/MG0+FPpo1uJ/6FcpXqLwU0hlkplaB/Gk41YPw4rrCol1TTUFvgcnwg9I8?=
 =?us-ascii?Q?1fpQisUgA7pVUE2ZgpOa3psd8L0e04k+RzfafJ0hit/+hFmbMWXKx1H2q8H+?=
 =?us-ascii?Q?I9nthvxk954CWXeFEMYAoLumhibjWt9n3Ib1zYjihumi6YGoynuMxER2K0Uf?=
 =?us-ascii?Q?Mk3411J9gk92E+7XYIWsVM/ndZg5jUeY?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB10906.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YskP8b1M7u/YzmaHgHeXpmcMqFQbOFmR88PQ/sPVfSLWwE12UvwjcbwZx9OE?=
 =?us-ascii?Q?fCHWOseKg51j4tJFJsE1Ch2llrdT9n0VTH/vFJOLmqHSVZUHkOMnePvzZ5Us?=
 =?us-ascii?Q?6qo2zUgGpQ1bwq6MmqCUDLhLQJFT3IVZWIKJxbFhRRzoaJNSmFyoNSt74KgQ?=
 =?us-ascii?Q?TD1RMhXHnCr8vCFIwz1ZnE6Ai+Z28B8DVpqsbI58seshQC35TrE4koUPdNXT?=
 =?us-ascii?Q?38ZgceEN/CYg/oTjL0mlQek4Tbdm6ZNr/HbBRIf5c5UzrrdBLLK4nRZlkz3S?=
 =?us-ascii?Q?9NtItTrAtVTUgLcgFw+u6W3OMAh/f+iv1vi/k10K9T0zc9nCVctb9XbSTyZs?=
 =?us-ascii?Q?saXpCYsbydLKCxjtjPukndF9/ByclWqP/FniKSlyn8EaEncuRdS8mZv/5Cmf?=
 =?us-ascii?Q?u0V2Mle6f0XnXjx52dRcHCf60K219KcpBcdtMb8MxLAFf6J8JOzhkFtxjmfC?=
 =?us-ascii?Q?XsPUMZTS1lN0q/wwPUAjeyPIr7ccWX5oq0GkxS5VTPkOxTVNILf+nApHVs5v?=
 =?us-ascii?Q?R7gAGhfi2d+LH9Zwjp8NFrRGc1zTTIec4vt0npCXqtOL67dp6nWPwcDsFeKA?=
 =?us-ascii?Q?UovG3E7M7DpkT+MfWsjykcLJozDuzDyTwc/vEUosUT0Dw3crlH0DXLrMLi/T?=
 =?us-ascii?Q?1ALzodVj8AA3V8FYuhqGlCHcRU2zUxXPoS8ys80GY1ViveFDtpoP9lK8TtHV?=
 =?us-ascii?Q?5eAWNakX2Mtlu4QLV2bsQWKFiW7cmMj3qlu6ZN4vNjDsi6viVCLU3T1tNIoi?=
 =?us-ascii?Q?3upQQgc1xSS4dyhTj0eNAaScMG7sRr+vEGMWeCHvCapXzd4oogF2Ji//YbQY?=
 =?us-ascii?Q?NevoND47A2Zt440qlNb4AauQmdNtuvmUh2dLwsDigmTDahgJ5I8OQkjZt+kH?=
 =?us-ascii?Q?aEH95iduWnqXjpjoJ0Rm3TLr1KKLIyqAaZhgSekgAs92cPPnzbRW9s+YGEq1?=
 =?us-ascii?Q?TT4k/orRX6VJKhZ1wrzlfGQRfXjr6nIq98VERMJYWg5eScdJWytxdvnkWmxG?=
 =?us-ascii?Q?mWYVoOI2B0kwHhzbmeYzDbz8Oj3dtuhkfnnp3xSIM8Acs0MhiGPoS9qIqEn9?=
 =?us-ascii?Q?1aaCzQtH+PqzMU++QTSJvFEXg3phZrbrje2+AV1yXAhDFDSHfJ3h6ASq5lws?=
 =?us-ascii?Q?hkawguG9rKglO4ooKyAkvE6Cldng0RF6oErrrXrdDo+VmSCHt0TPSNG37Av0?=
 =?us-ascii?Q?lALmYX9Qv9lEXwniJ8oyyI7X5ouvs4tVO+8QSo/IMDygAimwU1mNT+/WMonV?=
 =?us-ascii?Q?csyuML79KRZQaE1350QD+UmzFgW31M+sKrs2VOB7Gp+OZBfvjXdOQ6doXXiI?=
 =?us-ascii?Q?gmLMxSq7FV40YbResxhjuqjNLiHMDUnLlB1b+v4DigD3slNVxXni3hOneUVH?=
 =?us-ascii?Q?GIJyck1IyDz5mlWkaPbqekvihB/WxXZyxbpjXgsJ0KlL1iBT/OxwABb1X5sy?=
 =?us-ascii?Q?LYchEuHi7P+2RmUkUCh2SeUPz2MEDCE/3kz2TJNhY0iVmRfDJ9veFUbznRsI?=
 =?us-ascii?Q?nbiIcFj4ouJ+eQkr4Ijmz/yZtOgZuTlM67/sK4XrEBLBjPH1c6138j08/xPo?=
 =?us-ascii?Q?8cQMJRXveSrKSuvIkOZ9sytt4cbJ5+ftzqV61ua7hnda958RjH95ut92gOg/?=
 =?us-ascii?Q?D6kShtMupyGAQemwvFnjKAQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d3c59b2-48a8-41d3-d321-08dd4fb9a6d2
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB10906.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2025 01:14:54.4369
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 83ljorFSVerd8JOrQbPZ+FKSsCf2UiI+a+8H1HAA7xiFEvmckfF26K3F0CTUZzAt+I3JEqYNZws6WzY/59Zd+iwdoaJoXPcFDO9B42XZyAwDhtlWTndwqE05LjN56xEs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB5934

audio-graph-card2-custom-sample has many sample connections, but because
ALSA card has number limition for links, it is impossible to have all
samples into 1 ASoC card.

Separate it and took DPCM / Codec2Codec connection part.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 .../audio-graph-card2-custom-sample2.dtsi     | 382 ++++++++++++++++++
 1 file changed, 382 insertions(+)
 create mode 100644 sound/soc/generic/audio-graph-card2-custom-sample2.dtsi

diff --git a/sound/soc/generic/audio-graph-card2-custom-sample2.dtsi b/sound/soc/generic/audio-graph-card2-custom-sample2.dtsi
new file mode 100644
index 0000000000000..1fb061a10ab14
--- /dev/null
+++ b/sound/soc/generic/audio-graph-card2-custom-sample2.dtsi
@@ -0,0 +1,382 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * audio-graph-card2-custom-sample2.dtsi
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
+ *	#include "../../../../../sound/soc/generic/audio-graph-card2-custom-sample2.dtsi"
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
+	audio-graph-card2-custom-sample-2 {
+		/*
+		 * You can use audio-graph-card2 directly by using
+		 *
+		 * compatible = "audio-graph-card2";
+		 */
+		compatible = "audio-graph-card2-custom-sample";
+		label = "card2-custom-sample-2";
+
+			/* for [DPCM]		   */
+			/* BE			FE */
+		routing = "TC DAI0 Playback",	"DAI0 Playback",
+			  "TC DAI0 Playback",	"DAI1 Playback",
+			  "DAI0 Capture",	"TC DAI0 Capture",
+			  "DAI1 Capture",	"TC DAI0 Capture",
+			/* for [DPCM-Multi]	   */
+			/* BE			FE */
+			  "TC DAI1 Playback",	"DAI2 Playback",
+			  "TC DAI2 Playback",	"DAI2 Playback",
+			  "TC DAI1 Playback",	"DAI3 Playback",
+			  "TC DAI2 Playback",	"DAI3 Playback",
+			  "DAI2 Capture",	"TC DAI1 Capture",
+			  "DAI2 Capture",	"TC DAI2 Capture",
+			  "DAI3 Capture",	"TC DAI1 Capture",
+			  "DAI3 Capture",	"TC DAI2 Capture",
+			/* for [Codec2Codec] */
+			  "TC OUT",		"TC DAI4 Playback",
+			  "TC DAI3 Capture",	"TC IN",
+			/* for [Codec2Codec-Multi] */
+			  "TC OUT",		"TC DAI7 Playback",
+			  "TC DAI5 Capture",	"TC IN",
+			  "TC OUT",		"TC DAI8 Playback",
+			  "TC DAI6 Capture",	"TC IN";
+
+		/*
+		 * @ : used at links
+		 */
+		links = <
+			/*
+			 * [DPCM]
+			 *
+			 *	cpu20/cpu21 are converting rate to 44.1kHz
+			 *
+			 *	FE				BE
+			 *		 <feA>	****	<beA>
+			 *	cpu2_0 <----@---*  *------@---> codec2_0 (44.1kHz)
+			 *	cpu2_1 <----@---*  *
+			 *		 <feB>	****
+			 */
+			 &feA &feB &beA /* both FE / BE */
+
+			/*
+			 * [DPCM-Multi]
+			 *
+			 *	FE				BE
+			 *		 <feC>	****	<beB>	+-+
+			 *	cpu2_2 <----@---*  *------@---> | | -> codec2_1
+			 *	cpu2_3 <----@---*  *		| | -> codec2_2
+			 *		 <feD>	****		+-+
+			 */
+			 &feC &feD &beB /* both FE / BE*/
+
+			/*
+			 * [Codec2Codec]
+			 *
+			 *		<c2c>
+			 *		+-@-> codec2_3
+			 *		|
+			 *		+---> codec2_4
+			 */
+			 &c2c /* CPU side only */
+
+			/*
+			 * [Codec2Codec-Multi]
+			 *
+			 * --NOTE--
+			 * Multi connect N:M is not supported by ASoC.
+			 *
+			 *	<c2c_m>	+-+
+			 *	+---@-->| |-> codec2_5
+			 *	|	| |-> codec2_6
+			 *	|	+-+
+			 *	|	+-+
+			 *	+------>| |-> codec2_7
+			 *		| |-> codec2_8
+			 *		+-+
+			 */
+			 &c2c_m /* CPU side only */
+		>;
+
+		multi {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			/*
+			 * [DPCM-Multi]::BE
+			 *
+			 *	FE				BE
+			 *		 <feC>	****	<beB>	+---+
+			 *	cpu2_2 <----@---*  *------@---> |x a| -> codec2_1
+			 *	cpu2_3 <----@---*  *		|  b| -> codec2_2
+			 *		 <feD>	****		+---+
+			 */
+			ports@2 {
+				reg = <2>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				port@0 { reg = <0>; mbe_x_ep: endpoint { remote-endpoint = <&beB_ep>;      };};/* (x) to pair */
+				port@1 { reg = <1>; mbe_a_ep: endpoint { remote-endpoint = <&codec2_1_ep>; };};/* (a) Multi Element */
+				port@2 { reg = <2>; mbe_b_ep: endpoint { remote-endpoint = <&codec2_2_ep>; };};/* (b) Multi Element */
+			};
+
+			/*
+			 * [Codec2Codec-Multi]::CPU
+			 *
+			 *	<c2c_m>	  c2cmf +---+
+			 *	+---@---------->|X A|-> codec2_5
+			 *	|		|  B|-> codec2_6
+			 *	|		+---+
+			 *	|	  c2cmb +---+
+			 *	+-------------->|x a|-> codec2_7
+			 *			|  b|-> codec2_8
+			 *			+---+
+			 */
+			ports@3 {
+				reg = <3>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				port@0 { reg = <0>; mc2c0X_ep: endpoint { remote-endpoint = <&c2cmf_ep>;    };};/* (X) to pair */
+				port@1 { reg = <1>; mc2c0A_ep: endpoint { remote-endpoint = <&codec2_5_ep>; };};/* (A) Multi Element */
+				port@2 { reg = <2>; mc2c0B_ep: endpoint { remote-endpoint = <&codec2_6_ep>; };};/* (B) Multi Element */
+			};
+
+			/*
+			 * [Codec2Codec-Multi]::Codec
+			 *
+			 *	<c2c_m>	  c2cmf +---+
+			 *	+---@---------->|X A|-> codec2_5
+			 *	|		|  B|-> codec2_6
+			 *	|		+---+
+			 *	|	  c2cmb +---+
+			 *	+-------------->|x a|-> codec2_7
+			 *			|  b|-> codec2_8
+			 *			+---+
+			 */
+			ports@4 {
+				reg = <4>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				port@0 { reg = <0>; mc2c1x_ep: endpoint { remote-endpoint = <&c2cmb_ep>;    };};/* (x) to pair */
+				port@1 { reg = <1>; mc2c1a_ep: endpoint { remote-endpoint = <&codec2_7_ep>; };};/* (a) Multi Element */
+				port@2 { reg = <2>; mc2c1b_ep: endpoint { remote-endpoint = <&codec2_8_ep>; };};/* (b) Multi Element */
+			};
+		};
+
+		dpcm {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			/* FE part */
+			ports@0 {
+				reg = <0>;
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+				/*
+				 * [DPCM]::FE
+				 *
+				 *	FE				BE
+				 *		 <feA>	****	<beA>
+				 *	cpu2_0 <----@---*  *------@---> codec2_0 (44.1kHz)
+				 *	cpu2_1 <----@---*  *
+				 *		 <feB>	****
+				 */
+			feA:	port@0 { reg = <0>; feA_ep: endpoint { remote-endpoint = <&cpu2_0_ep>; }; };
+			feB:	port@1 { reg = <1>; feB_ep: endpoint { remote-endpoint = <&cpu2_1_ep>; }; };
+
+				/*
+				 * [DPCM-Multi]::FE
+				 *
+				 *	FE				BE
+				 *		 <feC>	****	<beB>	+-+
+				 *	cpu2_2 <----@---*  *------@---> | | -> codec2_1
+				 *	cpu2_3 <----@---*  *		| | -> codec2_2
+				 *		 <feD>	****		+-+
+				 */
+			feC:	port@2 { reg = <2>; feC_ep: endpoint { remote-endpoint = <&cpu2_2_ep>; }; };
+			feD:	port@3 { reg = <3>; feD_ep: endpoint { remote-endpoint = <&cpu2_3_ep>; }; };
+			};
+
+			/* BE part */
+			ports@1 {
+				reg = <1>;
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+				/*
+				 * [DPCM]::BE
+				 *
+				 *	FE				BE
+				 *		 <feA>	****	<beA>
+				 *	cpu2_0 <----@---*  *------@---> codec2_0 (44.1kHz)
+				 *	cpu2_1 <----@---*  *
+				 *		 <feB>	****
+				 */
+			beA:	port@0 { reg = <0>; beA_ep: endpoint { remote-endpoint = <&codec2_0_ep>; }; };
+
+				/*
+				 * [DPCM-Multi]::BE
+				 *
+				 *	FE				BE
+				 *		 <feC>	****	<beB>	+-------+
+				 *	cpu2_2 <----@---*  *------@---> |mbe_x  | -> codec2_1
+				 *	cpu2_3 <----@---*  *		|	| -> codec2_2
+				 *		 <feD>	****		+-------+
+				 */
+			beB:	port@1 { reg = <1>; beB_ep: endpoint { remote-endpoint = <&mbe_x_ep>; }; };
+			};
+		};
+
+		codec2codec {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			/*
+			 * [Codec2Codec]
+			 *
+			 *	<c2c>
+			 *	+-@--> codec2_3
+			 *	|
+			 *	+----> codec2_4
+			 */
+			ports@0 {
+				reg = <0>;
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				/* use default settings */
+			c2c:	port@0 { reg = <0>; c2cf_ep: endpoint { remote-endpoint = <&codec2_3_ep>; }; };
+				port@1 { reg = <1>; c2cb_ep: endpoint { remote-endpoint = <&codec2_4_ep>; }; };
+			};
+
+			/*
+			 * [Codec2Codec-Multi]
+			 *
+			 *	<c2c_m>	  c2cmf +--------+
+			 *	+---@---------->|mc2c0X	 |-> codec2_5
+			 *	|		|	 |-> codec2_6
+			 *	|		+--------+
+			 *	|	  c2cmb +--------+
+			 *	+-------------->|mc2c1x	 |-> codec2_7
+			 *			|	 |-> codec2_8
+			 *			+--------+
+			 */
+			ports@1 {
+				reg = <1>;
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				/* use original settings */
+				rate = <48000>;
+			c2c_m:	port@0 { reg = <0>; c2cmf_ep: endpoint { remote-endpoint = <&mc2c0X_ep>; }; };
+				port@1 { reg = <1>; c2cmb_ep: endpoint { remote-endpoint = <&mc2c1x_ep>; }; };
+			};
+		};
+	};
+
+	test_cpu_2 {
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
+			/* [DPCM]::FE */
+			port@0 { reg = <0>; cpu2_0_ep: endpoint { remote-endpoint = <&feA_ep>; };};
+			port@1 { reg = <1>; cpu2_1_ep: endpoint { remote-endpoint = <&feB_ep>; };};
+			/* [DPCM-Multi]::FE */
+			port@2 { reg = <2>; cpu2_2_ep: endpoint { remote-endpoint = <&feC_ep>; };};
+			port@3 { reg = <3>; cpu2_3_ep: endpoint { remote-endpoint = <&feD_ep>; };};
+		};
+	};
+
+	test_codec_2 {
+		/*
+		 * update compatible to indicate more detail behaviour
+		 * if you want. see test-compatible for more detail.
+		 *
+		 * ex)
+		 *	- compatible = "test-codec";
+		 *	+ compatible = "test-codec-verbose";
+		 */
+		compatible = "test-codec";
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			/*
+			 * prefix can be added to *component*,
+			 * see audio-graph-card2::routing
+			 */
+			prefix = "TC";
+
+			/* [DPCM]::BE */
+			port@0 {
+				 convert-rate = <44100>;
+				 reg = <0>; codec2_0_ep: endpoint { remote-endpoint = <&beA_ep>; };
+			};
+			/* [DPCM-Multi]::BE */
+			port@1 { reg = <1>; codec2_1_ep: endpoint { remote-endpoint = <&mbe_a_ep>; };};
+			port@2 { reg = <2>; codec2_2_ep: endpoint { remote-endpoint = <&mbe_b_ep>; };};
+			/* [Codec2Codec] */
+			port@3 { bitclock-master;
+				 frame-master;
+				 reg = <3>; codec2_3_ep: endpoint { remote-endpoint = <&c2cf_ep>; };};
+			port@4 { reg = <4>; codec2_4_ep: endpoint { remote-endpoint = <&c2cb_ep>; };};
+			/* [Codec2Codec-Multi] */
+			port@5 { bitclock-master;
+				 frame-master;
+				 reg = <5>; codec2_5_ep: endpoint { remote-endpoint = <&mc2c0A_ep>; };};
+			port@6 { reg = <6>; codec2_6_ep: endpoint { remote-endpoint = <&mc2c0B_ep>; };};
+			port@7 { reg = <7>; codec2_7_ep: endpoint { remote-endpoint = <&mc2c1a_ep>; };};
+			port@8 { reg = <8>; codec2_8_ep: endpoint { remote-endpoint = <&mc2c1b_ep>; };};
+		};
+	};
+};
-- 
2.43.0

