Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011052.outbound.protection.outlook.com [40.107.74.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30899405F7
	for <linux-sound@vger.kernel.org>; Thu,  3 Sep 2026 01:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788398083; cv=fail; b=eTXOaYGvXQ40djmU64Xcb1qYAHn9cU9ffRO+zHfANmWUkWh2oD4OvMshuFBHE0AEypb0lyUeG7JxtARcyLYIQiUbUXOFQGklSPIqS1uleHx+zP7YrOApNqGLZNtjmj0zytCIbBaADmNXnLBN8jlfC8wFQgd2hcqDHiEbc+ZPJs4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788398083; c=relaxed/simple;
	bh=qMKI2kxGtCifZtHJoDfH3kxVJBmIjitwnzOD73zBfNY=;
	h=Message-ID:To:Cc:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=KRmYWW5wcaw+TvZUbKGuqeRJNKN+hb7FdFkvLpM5bkpYXi+tY8pW22F/pxU4bIoqzD61G8fnc55pB3U2qTjIIC17v7msO08zp/u6CYCbQv7nsh0dZggJ0jn++7+ArSB+Uge5kT9M+GkV3ya6posWOfbPuNLT5QvNNnkm4/lcXHc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=T9q4uOnv; arc=fail smtp.client-ip=40.107.74.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="T9q4uOnv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kzmeqpKxzJ9g2oFie13Rp7aUEn4cKruq5mymoj7AXvAY+EdYlNdNEHN6fUoP8Qiw5bAHGQp2CY0dhxWKJzuDrncj34smmfyLNvcXLn+IvRn23HdbzGodOQiVU1a/GWBI3iyfId5JauHGoPfEf/1PpcR/GNGRjr1Fv8gaCbMurWiOrSvU68zoTjpNSageR/lNr54iw648vZgJcnZayHhLXvOLqghwq/sJbQCFka1UBHraj/eC/oJwddmaAP24SbTOEhO/1mTopJOmpS5US9DKgQnxhGYlhd1FmmLQCTFQHdl7WIho6uVg2cRc0ha3Ogx3QkiF2ggbO4+RSBp8zhDlTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=492rGCqL7uR6lZtfGmU6UAgb4cn4gwqkLEQsuo04YDs=;
 b=gEoYbmkyWsw2+qpIUUeu8gIb5hQwU5r6A7Kua2/Ll/Oosdz5cXPEa48sfXWTtrPkzxBZ4EhjhkaejcVQ1DM0pW/lpbH5bwVotRtvYiUC09bDZr/cLVLb8ASIWAHkXQ8cF9+DXLsx1x0mpzEwbdUHUs0E/y/MG/czPR16fvo4zKdMRgK7/lHFE57NekN4U/xtZwlQJZE1b1LSk18O/IxGmMWWzWIj3VR+KWnu5h667yUWDl2Z5sk5CENilexE9fRDLjT6DVj271DTmfrE5snat0viFCJArpZjhU4QXesqBcIjtwsb92H4rNfpgUfhUJHPv1qeoEzC7aNRs3oFVLlSdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=492rGCqL7uR6lZtfGmU6UAgb4cn4gwqkLEQsuo04YDs=;
 b=T9q4uOnvWL6WQ1qih9JCDyvPPhW01porejZNjrMA0eqjRcZJ0nkkZVMZstGsP+ez7StQrsXTWfK/1Ar16q8RwfsObH1wIVlyZyQz4rOCuWEwux/7+X0GqQyfe5X36rb5axvuxHI0G4YGCIBr2aNxCTR4VFLHboRgPXklcNOHCI4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYRPR01MB16474.jpnprd01.prod.outlook.com
 (2603:1096:405:2ee::10) by TYWPR01MB7169.jpnprd01.prod.outlook.com
 (2603:1096:400:c7::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 01:14:40 +0000
Received: from TYRPR01MB16474.jpnprd01.prod.outlook.com
 ([fe80::2a39:9988:dbe9:894b]) by TYRPR01MB16474.jpnprd01.prod.outlook.com
 ([fe80::2a39:9988:dbe9:894b%6]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 01:14:40 +0000
Message-ID: <878q5jyw3k.wl-kuninori.morimoto.gx@renesas.com>
To: bui duc phuc <phucduc.bui@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 19/21] ASoC: uniphier: use .auto_selectable_formats
In-Reply-To: <87zexzyw5v.wl-kuninori.morimoto.gx@renesas.com>
References: <87zexzyw5v.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 3 Sep 2026 01:14:39 +0000
X-ClientProxiedBy: TYCP286CA0099.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b4::17) To TYRPR01MB16474.jpnprd01.prod.outlook.com
 (2603:1096:405:2ee::10)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB16474:EE_|TYWPR01MB7169:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c5e4a78-d7c8-44c9-42ae-08df0958ba5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|23010399003|366016|38350700014|56012099006|10067099003|18002099003|11063799006|22082099003;
X-Microsoft-Antispam-Message-Info:
	0CedF5mM8TmdiQ8+kTx976tHkXgtllvIrlL7JVd3GSPSuS7YC91ueZw0u3vxcmOiqE28dPkda6iN7w/Ha9cd2U5QCMHna3EaMGYVmqXSkgk3KzXnQsuGoyQ4asSnsCfYv6NfPJ2qsWp4FCKn/Jv/nuPwSF0spTZ8UKjRpYJgzUMho/atPvbBUD3IZ1t4SxgH+HezPtQZbJ8bxDufXFbxrGdiTH7I1BFpb3p/d/9NhmWO2/TSKlbAFInhsb983ID9GKWvzkvK07zTtd9elC0TqBG+ZOLMcmJEmmSPkL8x9RnltSXNJmYJgJFzJBB28aHxmy8DLSCf0lg7OkJnFpc1Q0k++xBdcTclOvTjWTlq0A8MOUSFz6L6Lvru2VubHKToVi1jRcy9Tjah8McPe7b3C3okOf6jLkWdFUEVQ9b+RHnKJ3/ut/jfcpm79GjjQOSRgCczNklPkenVaB4KrTe/hZZwoLfAYlAbHJ1lvjtz1Fk1RL/1Q9LvgyFn8+rhBnd5i9sCG1OT0uCkEr5M8BEd3KyefFPuDOwrV8kKVetdztGrfQCixVfn0FdBYKy0Xgn0Cic/hNu0DcjzjpOCqvc6xMdFUE54SQLlLf4AyuD5CTv52/4aWsbuXTTcU81Cy905LjpyE933j+QUH+fT/YyEA2oBlGxqM8WKwzi9EgzmHaBUrpmeIi9GBezPm87y6zGYzY2JyghRvogV45NmnrQjYJyjqyhrPqmq9xP34fqqC4M=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB16474.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(23010399003)(366016)(38350700014)(56012099006)(10067099003)(18002099003)(11063799006)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Lb+nUqbY6WSV00Yl8gbwuookI6VfFoIulW5vRBt6lT5EpvFvaii66IKPN7W+?=
 =?us-ascii?Q?QtX2hrHbvJn4UfvDhpddu9pSnem/87I/4AS6FppkqaIdvl7RjGVDjoic3k1i?=
 =?us-ascii?Q?qKyD7z+oXy8rYXj7fmdBcd562pwInIqyW/hMC6M2xxeeNAWtEFxfAb00HLrR?=
 =?us-ascii?Q?xpnytjhE24x7lA0yfA6/8P9eIS1Yn9tpl/RwnPaDcSIGObTRHQ+KenBklEf8?=
 =?us-ascii?Q?cFfAq00DOXa6Z4qkf/AAtVfAdD2p4PwxV1fNQheR8/wRw+pj2JLGlEfYXY2H?=
 =?us-ascii?Q?NAM6UEZ9nHcHHtpogT0Nk8Wd2+Z0vsQagfPdrchQ4mDxCoiWgYc2cfY6V49I?=
 =?us-ascii?Q?+9DS024kB06CZnRepjECoPbwhFuKqdQQ3VMyT7e/GeqdFmo/bMeqBbnFZT6C?=
 =?us-ascii?Q?Bcq82XzyvTelJyWWgeiBOi5GaqaecrlwzE4EinxoxjSLcmGlcqwuBdQMXlTy?=
 =?us-ascii?Q?pCd9UO0ai7pydq2axVI/iFdA0pbmdnzgyW5etQDyzI9mJzeri2GS7lcwX2fp?=
 =?us-ascii?Q?GPwdR4RsprFQB9QYQmOtxCJn65UlzAqZZh6+CZIntCwNt2kRGGQiP19/5m5k?=
 =?us-ascii?Q?semAaM5gJfA//8tZUln/N+dpZOh/tVwU64rDaY7s2rmmkoIa2WEaYAGpY8q6?=
 =?us-ascii?Q?aT+ISE2jmmOEGC067pyr5Qim9I0xvP1SNmwJFI33Pde5ixt5cmpMzonCgxTL?=
 =?us-ascii?Q?d/AIuObju9IFrZp+Ij3pi/1S2fTSyMRvk84WGoZMYRHqbqUlOzcBsuzMlzZg?=
 =?us-ascii?Q?kCCR44wPDtL1LEQ/GjbdHhI9FAs/dxeJORTaPozebYnvIqgj6D1W73IbkEpH?=
 =?us-ascii?Q?0lCHep25RiDsMHwoIe8v9ONkcafnhTthl9sm4SXc8DGR67zzAYDOiRGM6ZPZ?=
 =?us-ascii?Q?SXwSpYJpEky3hoWSYDm8Ng40/Vixhhcvb57LM1OBF+ShzN+ZD8DpBquQDJ2K?=
 =?us-ascii?Q?FfmseXDB9AB/kDklmKg7Okuw/YEkb6446h6MCLJZSBT63jgrqTgx8zM+5v9W?=
 =?us-ascii?Q?d5lK34EwNHPFEowB+63v9ZxRx4bGmyhxj1HXtj9y6lcfAKSldQiv+E5zy3C1?=
 =?us-ascii?Q?qmTKkhFtQkLaoI5hZxFIHyWfkVsl+xwPEdK7sD2K90Gh0dxB2/lrp6Z2V4QB?=
 =?us-ascii?Q?yBEVLp0d+QX56oFBPhYwpBDZzgtTuoJiV1V8rXwW0rUO3K8iljdBf5h1lF7z?=
 =?us-ascii?Q?nvME4CbIfQAcGIOemJgx4DEPDGcuInKdFwOCSY1YdsnhZG00X/MnXoJNVAIj?=
 =?us-ascii?Q?WXXJAkmPUU/qycFCR+kddxRu/Ni/YlHueGyhjlgrzIQVMk5cZyVvRpHpgUsq?=
 =?us-ascii?Q?FcXGFqJhCV2wDsE+V5oPHjwacoSI4qKJPOcsF4whYNp8xqdVkeWeKseM+R3h?=
 =?us-ascii?Q?aP0lLbJgpAzsTL5BFrtkYu7QHCuNNP+LfWGaFxRNINiYXX8vzo2WwmguBGnO?=
 =?us-ascii?Q?XXKjFoH828tug/5KItwgcof73EcOviYkHBEadqHCHPoBie5bLrfoqhk43mOL?=
 =?us-ascii?Q?VBwfG756rQjl7UfhtoZi7D8DRw9aWP7/KsQeJ+VbPFrSWEJWa/ccOe9oRJrn?=
 =?us-ascii?Q?mUsVKW1wr/qgpT9LDWuA0VL9Q2tC4X0tna0I6kItX8KhZol8UVIB7tEdyhbT?=
 =?us-ascii?Q?ssHJNib3JrOydKt43bmp+jMcOFOWTe0NxB6rTO8+0GJyJ1o2dOdn3h/rbEK8?=
 =?us-ascii?Q?tpgpIqSAFCCjwhdVmixd6K1hrGCrDB72fwOIH0zDkJg+h2AFIEbF868NcvaN?=
 =?us-ascii?Q?2ka6v8M3eZVajlTWR/HfVKQvXI8w1PFzcHMBV/dv14X/0AXQhKYe?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c5e4a78-d7c8-44c9-42ae-08df0958ba5b
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB16474.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 01:14:39.9376
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UBiNAQGnqWD7FZKUD2XmJAWxARCPn4nXVCTC7GZ46TU2/Gh0djG8OR8nCefOS2vVvCI93EgHID4jlDGFZT4wJ9sQpjHGzasrQwgTjYfwx54ofSrl9m78lTKTpEwBl9fJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB7169

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/uniphier/aio-cpu.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/sound/soc/uniphier/aio-cpu.c b/sound/soc/uniphier/aio-cpu.c
index 78c82bf42a8f5..b263526f19905 100644
--- a/sound/soc/uniphier/aio-cpu.c
+++ b/sound/soc/uniphier/aio-cpu.c
@@ -440,6 +440,11 @@ static int uniphier_aio_pxs2_probe(struct snd_soc_dai *dai)
 	return 0;
 }
 
+static const u64 uniphier_aio_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J;
+
 const struct snd_soc_dai_ops uniphier_aio_i2s_ld11_ops = {
 	.probe		= uniphier_aio_ld11_probe,
 	.remove		= uniphier_aio_dai_remove,
@@ -451,6 +456,8 @@ const struct snd_soc_dai_ops uniphier_aio_i2s_ld11_ops = {
 	.hw_params	= uniphier_aio_hw_params,
 	.hw_free	= uniphier_aio_hw_free,
 	.prepare	= uniphier_aio_prepare,
+	.auto_selectable_formats	= &uniphier_aio_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 EXPORT_SYMBOL_GPL(uniphier_aio_i2s_ld11_ops);
 
@@ -492,6 +499,8 @@ const struct snd_soc_dai_ops uniphier_aio_i2s_pxs2_ops = {
 	.hw_params	= uniphier_aio_hw_params,
 	.hw_free	= uniphier_aio_hw_free,
 	.prepare	= uniphier_aio_prepare,
+	.auto_selectable_formats	= &uniphier_aio_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 EXPORT_SYMBOL_GPL(uniphier_aio_i2s_pxs2_ops);
 
-- 
2.53.0

