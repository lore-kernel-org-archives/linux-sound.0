Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010061.outbound.protection.outlook.com [52.101.229.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B45BA381E9D
	for <linux-sound@vger.kernel.org>; Tue,  4 Aug 2026 00:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785804191; cv=fail; b=R9ooFU5J8dai+en0uWSSNF3Z2aoXEbAzTGoS9fkkSTrhgsJg++JoNY5H3kyY8jiWn28LKQO6vKaMwQSWfLsL34V03LRSC5hyiXK5+Q+Llh1gAJ3JYBkbupBMr/w24GQWGzyZZMfjJ74xTtFIZoNBMiNDi9C4NgzagOTvHpx0cqA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785804191; c=relaxed/simple;
	bh=c+TnswjV15Qi5F6lApk28HTMLLPeYo5g6/x7JSyYuDA=;
	h=Message-ID:To:Cc:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=BLDY9O7vDpK3h/Ss/MGr6AGNSKalSl0tnSfuY32nvrOa5J4yVvDXKYqTVWMctlRgie+aNOYx15yWBqXR5tMf1W0DYHoj6c9oQzMLtG0Udf6e/OkAQ+6kfSIVMhrwXJPO6s8MpTFDWbjOXJ52Tf+/GSrLfQBziRfSyaJj2zBvX4g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=cI8Lg6An; arc=fail smtp.client-ip=52.101.229.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="cI8Lg6An"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AtAGHTNU3+iucoCHPhEcaQzXDLyKVb5tTWK3Cyd8Q6RVy1fLsC2eJ/SAzDtTrSJp8VYSEUZ+i3rb/HkEk+yUVwNnSmgnuoXLPiPH6Fl2iUuMRzZYIStrkzPbPoJF/M5ZnKEKsfMUB0LroKJQMDao93wvwhi/DVf72oH3wDyB3+2FNqmraxc+IvxWxq619ClH40ajiN71YjJzWHUh/hEUV+WPrRkjxo1bEvvReVjE21E8Eo0pXv4JpSefbuWu7eKJcrEDkic7VQ0BovxpXEAo3q5OH54+d47u9ETTKzRNyxbY6nzlfI+8rloTX4b6HbuFQQ9z7crlEfT+G3A4Oy1N9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4XbfREriJdPZUs6IP2C0uwJh5NvbEWk48dUJ1ORNwnE=;
 b=hYWBcRd0NFi9FcosrXKlDBwXI1Al1NeRkSEwBjL7zL/IsuQg9G8UMSonj42n8OeT5Y4sfRTfSTm67RbhxRKoUGm7/jbbEvoRzoVVTKQVEhLgv5GRV3RIAfqM28EoJb3/zNWh0O0R/c4iWs0XUJ5Iwh0nXA67LQi8VU/BFzB74tydRVHYThBwXhXuqzmUAjbmlUVFNoGSiNmPMJS4fcTJrL/W3e5UOCkE0ltRqwzQKcavnK59Dva0FpVu6IyA4447NygmPdTYHCH4eu5eqTo5zL/QPYG/H6LOMJvHGPD3S1JTnIHppG2QwkD10wd2Enln4Ncxmac6k/M9HmRI+/AEAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4XbfREriJdPZUs6IP2C0uwJh5NvbEWk48dUJ1ORNwnE=;
 b=cI8Lg6AnKk0wuf6A4lBSzg/YnV/lPKfZ2uOx4Ppdymb4YVI4zYqTcGFD+UlaWXLW4szZBGO/yvC0qQ+RGCxdnT0HUaLmTJhl5C7uKUtO2MfX1Od7lLHT6tYvJP2JkCkPjqcq0NN9d15T/vLFsQjEJZI8J4Bg8A7PuALcpmnLY+A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYCPR01MB18168.jpnprd01.prod.outlook.com (2603:1096:405:3ee::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Tue, 4 Aug
 2026 00:43:07 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0270.017; Tue, 4 Aug 2026
 00:43:07 +0000
Message-ID: <875x1qww9x.wl-kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Oder Chiou <oder_chiou@realtek.com>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 30/44] ASoC: codecs: rt*: use .auto_selectable_formats
In-Reply-To: <87cxvyyazi.wl-kuninori.morimoto.gx@renesas.com>
References: <87cxvyyazi.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 4 Aug 2026 00:43:07 +0000
X-ClientProxiedBy: TYCP301CA0005.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:386::8) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYCPR01MB18168:EE_
X-MS-Office365-Filtering-Correlation-Id: b2968b33-b7ad-410f-a51c-08def1c159d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|23010399003|11063799006|56012099006|22082099003|18002099003|10067099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	LxJqIYiwzXbnPFwuADsvKDUHoqR82vnYFQ6Ur1rcc/Qd4K0ESvfiair0Z74OsoR+5IiBFvmMPV7Ubvl1fJEvDKoU3KhaRBBLzHV9T/2Weu+GMoyaXucxjfylIEdDdiH7U0/1NYx0hSTIxnwue6zQ2ntHu91R5SVRLc34SJLBh4Ns/shmlzaADGkg5YW+zASbCX/A3VLVBMDrxEuUApVMI5r/z4G33tk9Tqo5m7K+5+f59WhHkULZjISvZC1W9e/6zHtfrdX7ixW4DZvebyXnWgRc5iWCzKuP6dffuKE91HleMV3t/iQqY8EVRydSQxGSh0RFQSbJZlTEz7z8y+2MFq1MedPUVE4icm2zFcx6HG7xwSmEwrOT5J10m7nggvGX/hK/+gFtFMFz59/qLwXPfwEjDlBluOaD4npbQB+9qwnOisL+ifGYdGA9J2qrq5Ghr9e8ZR2Yfxhc77rXENizJOv/5/u3BQSSy6y4d3XIg7IwHr8MvKZ0IS2lyp3Uis3W6N945fq169lfYTItI4MDPHRHtJFHuMucqH6/YrWWNQHnWyEkPDq+NsuzKW4VFnzbRJMZXInYkOBrN3LWw+IGlZqLolDEnzIGzicA2RETdYfEOCHD862RZR4lPQC6Iow2zazw6IRPPgWSGRHAeiaTJN/ToYVA7ym129lcH2ET3hWlew5M+M+SSyBaOJTZtTBaMKWCMqcI1DVVqsNVQdaods2+ZFV9eVPdsbV7ADH8b0w=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(23010399003)(11063799006)(56012099006)(22082099003)(18002099003)(10067099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wx/OXgt4RsAdyOaq8fCkGS0mANTMRp67PnOQawAERIm42AoWt5Y0WcVj/fLP?=
 =?us-ascii?Q?kYhUNvSRdXCcCIMxxlqUddVLF+9uYve7t18cwvvrajESdFiil9A+mBhVnNEf?=
 =?us-ascii?Q?5qfBR8oiUyUND95occvV+urLaHF/b/wknDAkB0URICuQWuzPli019YauUm0p?=
 =?us-ascii?Q?2bisbwp/+xCqA6t5FYCpNQIwhBFourFJXs86os6Sw6Qc8KLbvuoXsgeOfi94?=
 =?us-ascii?Q?iU3tKKlA2z6XVRjVwa2XO0AONIGWIwku6q9IxTNpsIEJPGBhz6BBcFtXdVKN?=
 =?us-ascii?Q?EhOsoqaPXzwe8arygZdZYuut/3DJ53CE9SGHWCuQkPjxrlGt1RI1Ly5To10b?=
 =?us-ascii?Q?b/BYN9ueDG6cXn4RunwCRtJcCgfla2xJ1QrxVEgFyaaFJT30OHcXWbgAAodL?=
 =?us-ascii?Q?LR+Ztcsdc9mQI5zjAK+Cvn7c3NbcpmqT70kd/HR7586D8jbsvHtOKWkWfbO2?=
 =?us-ascii?Q?WMNIIzuh/+SucZRdbrwIWMKQS2m7MmJchIzr7prQlRuYAYeCTbNYmdw9Fms8?=
 =?us-ascii?Q?CewCjqJ+ayH1hxAE6PDtMRirLWXBmiuGxQC8+IEq8pjlYe02U6CANIdVnztd?=
 =?us-ascii?Q?P2aZ22rKVlYBw7oXOa3B28vrM0f7/hRNWvBEAvV4Qr/9FU/xJBt67Br5kK0n?=
 =?us-ascii?Q?j7IIBRUJoDswTVSQb4hksvf+kFfVXB7H4X2aessr4bskEQ018WjvaUwpvAIW?=
 =?us-ascii?Q?ttlLn3vtx8BX6wi8AI3ZTcLgWG586SmAgo7jWS0dvpYsIL5BfW2l1V//Kk5X?=
 =?us-ascii?Q?domwpYs64JsMnb+Uxln3eYo1zQQVwSMwF75FBNKKOXlbwMce3Vwq0sZ/ROH5?=
 =?us-ascii?Q?145pPPPxAhgGqWjMOEl4hQ/30sP50BQK6zJftPphwQPlNCxR0EeYyp97ieiN?=
 =?us-ascii?Q?YfMKpNVoap9ZqlbWxH6b6Zj1vSyBAUK3Y7qrodwUO12/isaQHbNCSdzfJNL/?=
 =?us-ascii?Q?bu80T5SxDuJ4LpB+QbJ9kymDh0f4DYb7L6TGD6XUIZK/c4bs6eeT/4u308l4?=
 =?us-ascii?Q?xZImjke2yQWuDMLmm8Glck3hQdr+nsAvABQ/VSti8kc+rEu4C6pri2SHn7eL?=
 =?us-ascii?Q?ujdUwP8qDEGlHubADiMd28ZZG4L6GT1DBLPqVf05Y3AQj1yHiBnbFi0Do/2B?=
 =?us-ascii?Q?6lCgCCzDjR+plptd7BEmSHX5h2hxkq2Z6tEoWIVzeVkSzAjxJ12zaEnUZret?=
 =?us-ascii?Q?yee6ahZmTwVc2ZcxmjSlrWkDUG1XD4FS3Wd3/aroWHaWug95VscElMccPeNj?=
 =?us-ascii?Q?/+jNn4+Z5x50AirwZc5xgA1Zgw3GbM5lRvmSnQDo0wu5axSbJGtkqbf47MCj?=
 =?us-ascii?Q?eY+Al41N3tn2aRaXtR2yWWjnwb8OfuX2Tg42Rd3idTvPDOgnXYPwhujBPGNL?=
 =?us-ascii?Q?/JKDdpvRUJXWvitmrGSZnD7+EoLcTvJ0hxmhz07vef6RQJtHw15Mvd32Aoq/?=
 =?us-ascii?Q?SuQBoJ7huJrGN7+Pg5xf2aIeD/3EzXPeuKlILO3JjSvdEJlhqx5Qd7zXAk94?=
 =?us-ascii?Q?1gqRTu/NQtfVbkGi0BlcD4E2LZHpKbNWLZNH7/bvvFAP0YxuJuN3N2faBZwX?=
 =?us-ascii?Q?JxoZ3iL1Jp5iUhrWxLDelFWpNtXe/Y88mbja6ZhGlvKvCwSPeWTsZgPjk9Wk?=
 =?us-ascii?Q?Fcqr1e099dzklAaWHl0OTgUqHimqaprsR78+3QIFZ0INKabmFN08SQFy1TEF?=
 =?us-ascii?Q?RshCsPPQyzr91KsK47U5FESMJ1TCsKgz+UTDgcUAvWjQZMIpoj6sp8ebBWyh?=
 =?us-ascii?Q?3+aN/3KkvD2rCPd39q8599W3fDnKBEjdQtiBbtN0G7hrJRZs59Q+?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2968b33-b7ad-410f-a51c-08def1c159d6
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 00:43:07.5262
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V0PkzwKWHvWs1Tw8J0BB5DRdSEYzCoaVBJ7FQ5DpkXgcmCEHGSvaD15EZj0Hi6oQLPJT900sHbhveI7tJA2eniCta2GHC6FY6i33YvFfwFCs/Ij0zGp0oFPRQRoERSBv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB18168

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/rt1011.c  | 10 ++++++++++
 sound/soc/codecs/rt1015.c  | 10 ++++++++++
 sound/soc/codecs/rt1016.c  | 10 ++++++++++
 sound/soc/codecs/rt1019.c  | 10 ++++++++++
 sound/soc/codecs/rt1305.c  | 10 ++++++++++
 sound/soc/codecs/rt1308.c  | 10 ++++++++++
 sound/soc/codecs/rt1318.c  | 10 ++++++++++
 sound/soc/codecs/rt274.c   |  8 ++++++++
 sound/soc/codecs/rt286.c   |  8 ++++++++
 sound/soc/codecs/rt298.c   |  8 ++++++++
 sound/soc/codecs/rt5514.c  | 12 ++++++++++++
 sound/soc/codecs/rt5616.c  | 10 ++++++++++
 sound/soc/codecs/rt5631.c  | 10 ++++++++++
 sound/soc/codecs/rt5640.c  | 10 ++++++++++
 sound/soc/codecs/rt5645.c  | 10 ++++++++++
 sound/soc/codecs/rt5651.c  | 10 ++++++++++
 sound/soc/codecs/rt5659.c  | 10 ++++++++++
 sound/soc/codecs/rt5660.c  | 10 ++++++++++
 sound/soc/codecs/rt5663.c  | 10 ++++++++++
 sound/soc/codecs/rt5665.c  | 10 ++++++++++
 sound/soc/codecs/rt5668.c  | 14 ++++++++++++++
 sound/soc/codecs/rt5670.c  | 10 ++++++++++
 sound/soc/codecs/rt5677.c  | 10 ++++++++++
 sound/soc/codecs/rt5682.c  | 14 ++++++++++++++
 sound/soc/codecs/rt5682s.c | 14 ++++++++++++++
 sound/soc/codecs/rt9120.c  |  9 +++++++++
 sound/soc/codecs/rt9123.c  |  9 +++++++++
 27 files changed, 276 insertions(+)

diff --git a/sound/soc/codecs/rt1011.c b/sound/soc/codecs/rt1011.c
index 15488a0592837..d47b0370dd6b0 100644
--- a/sound/soc/codecs/rt1011.c
+++ b/sound/soc/codecs/rt1011.c
@@ -2133,10 +2133,20 @@ static int rt1011_set_bias_level(struct snd_soc_component *component,
 			SNDRV_PCM_FMTBIT_S20_3LE | SNDRV_PCM_FMTBIT_S16_LE | \
 			SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S32_LE)
 
+static const u64 rt1011_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF;
+
 static const struct snd_soc_dai_ops rt1011_aif_dai_ops = {
 	.hw_params = rt1011_hw_params,
 	.set_fmt = rt1011_set_dai_fmt,
 	.set_tdm_slot = rt1011_set_tdm_slot,
+	.auto_selectable_formats = &rt1011_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static struct snd_soc_dai_driver rt1011_dai[] = {
diff --git a/sound/soc/codecs/rt1015.c b/sound/soc/codecs/rt1015.c
index ff0c08ff610e1..c6d59c2860644 100644
--- a/sound/soc/codecs/rt1015.c
+++ b/sound/soc/codecs/rt1015.c
@@ -1016,10 +1016,20 @@ static void rt1015_remove(struct snd_soc_component *component)
 #define RT1015_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE | \
 			SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S8)
 
+static const u64 rt1015_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF;
+
 static const struct snd_soc_dai_ops rt1015_aif_dai_ops = {
 	.hw_params = rt1015_hw_params,
 	.set_fmt = rt1015_set_dai_fmt,
 	.set_tdm_slot = rt1015_set_tdm_slot,
+	.auto_selectable_formats = &rt1015_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static struct snd_soc_dai_driver rt1015_dai[] = {
diff --git a/sound/soc/codecs/rt1016.c b/sound/soc/codecs/rt1016.c
index 11c8c45574a13..56a2f3d3354df 100644
--- a/sound/soc/codecs/rt1016.c
+++ b/sound/soc/codecs/rt1016.c
@@ -534,9 +534,19 @@ static void rt1016_remove(struct snd_soc_component *component)
 #define RT1016_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE | \
 			SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S8)
 
+static const u64 rt1016_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF;
+
 static const struct snd_soc_dai_ops rt1016_aif_dai_ops = {
 	.hw_params = rt1016_hw_params,
 	.set_fmt = rt1016_set_dai_fmt,
+	.auto_selectable_formats	= &rt1016_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver rt1016_dai[] = {
diff --git a/sound/soc/codecs/rt1019.c b/sound/soc/codecs/rt1019.c
index 370521149ac8a..3998abccd93a8 100644
--- a/sound/soc/codecs/rt1019.c
+++ b/sound/soc/codecs/rt1019.c
@@ -492,12 +492,22 @@ static int rt1019_probe(struct snd_soc_component *component)
 #define RT1019_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE | \
 			SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S8)
 
+static const u64 rt1019_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF;
+
 static const struct snd_soc_dai_ops rt1019_aif_dai_ops = {
 	.hw_params = rt1019_hw_params,
 	.set_fmt = rt1019_set_dai_fmt,
 	.set_sysclk = rt1019_set_dai_sysclk,
 	.set_pll = rt1019_set_dai_pll,
 	.set_tdm_slot = rt1019_set_tdm_slot,
+	.auto_selectable_formats = &rt1019_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static struct snd_soc_dai_driver rt1019_dai[] = {
diff --git a/sound/soc/codecs/rt1305.c b/sound/soc/codecs/rt1305.c
index 2d5fad76cf528..92998ec0a392e 100644
--- a/sound/soc/codecs/rt1305.c
+++ b/sound/soc/codecs/rt1305.c
@@ -910,9 +910,19 @@ static int rt1305_resume(struct snd_soc_component *component)
 			SNDRV_PCM_FMTBIT_S20_3LE | SNDRV_PCM_FMTBIT_S16_LE | \
 			SNDRV_PCM_FMTBIT_S24_LE)
 
+static const u64 rt1305_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF;
+
 static const struct snd_soc_dai_ops rt1305_aif_dai_ops = {
 	.hw_params = rt1305_hw_params,
 	.set_fmt = rt1305_set_dai_fmt,
+	.auto_selectable_formats = &rt1305_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static struct snd_soc_dai_driver rt1305_dai[] = {
diff --git a/sound/soc/codecs/rt1308.c b/sound/soc/codecs/rt1308.c
index 630946cd7cdf8..28c25871ec0c0 100644
--- a/sound/soc/codecs/rt1308.c
+++ b/sound/soc/codecs/rt1308.c
@@ -729,9 +729,19 @@ static int rt1308_resume(struct snd_soc_component *component)
 			SNDRV_PCM_FMTBIT_S20_3LE | SNDRV_PCM_FMTBIT_S16_LE | \
 			SNDRV_PCM_FMTBIT_S24_LE)
 
+static const u64 rt1308_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF;
+
 static const struct snd_soc_dai_ops rt1308_aif_dai_ops = {
 	.hw_params = rt1308_hw_params,
 	.set_fmt = rt1308_set_dai_fmt,
+	.auto_selectable_formats	= &rt1308_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver rt1308_dai[] = {
diff --git a/sound/soc/codecs/rt1318.c b/sound/soc/codecs/rt1318.c
index d13fd0e141252..23d6ee974ef16 100644
--- a/sound/soc/codecs/rt1318.c
+++ b/sound/soc/codecs/rt1318.c
@@ -1087,12 +1087,22 @@ static int rt1318_resume(struct snd_soc_component *component)
 #define RT1318_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE | \
 			SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S8)
 
+static const u64 rt1318_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF;
+
 static const struct snd_soc_dai_ops rt1318_aif_dai_ops = {
 	.hw_params = rt1318_hw_params,
 	.set_fmt = rt1318_set_dai_fmt,
 	.set_sysclk = rt1318_set_dai_sysclk,
 	.set_pll = rt1318_set_dai_pll,
 	.set_tdm_slot = rt1318_set_tdm_slot,
+	.auto_selectable_formats = &rt1318_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static struct snd_soc_dai_driver rt1318_dai[] = {
diff --git a/sound/soc/codecs/rt274.c b/sound/soc/codecs/rt274.c
index 63b5fc439773d..d70feeb7aa1f2 100644
--- a/sound/soc/codecs/rt274.c
+++ b/sound/soc/codecs/rt274.c
@@ -1027,6 +1027,12 @@ static int rt274_resume(struct snd_soc_component *component)
 #define RT274_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE | \
 			SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S8)
 
+static const u64 rt274_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B;
+
 static const struct snd_soc_dai_ops rt274_aif_dai_ops = {
 	.hw_params = rt274_hw_params,
 	.set_fmt = rt274_set_dai_fmt,
@@ -1034,6 +1040,8 @@ static const struct snd_soc_dai_ops rt274_aif_dai_ops = {
 	.set_pll = rt274_set_dai_pll,
 	.set_bclk_ratio = rt274_set_bclk_ratio,
 	.set_tdm_slot = rt274_set_tdm_slot,
+	.auto_selectable_formats = &rt274_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static struct snd_soc_dai_driver rt274_dai[] = {
diff --git a/sound/soc/codecs/rt286.c b/sound/soc/codecs/rt286.c
index ded0ea3324804..0632fec5b0108 100644
--- a/sound/soc/codecs/rt286.c
+++ b/sound/soc/codecs/rt286.c
@@ -995,11 +995,19 @@ static int rt286_resume(struct snd_soc_component *component)
 #define RT286_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE | \
 			SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S8)
 
+static const u64 rt286_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B;
+
 static const struct snd_soc_dai_ops rt286_aif_dai_ops = {
 	.hw_params = rt286_hw_params,
 	.set_fmt = rt286_set_dai_fmt,
 	.set_sysclk = rt286_set_dai_sysclk,
 	.set_bclk_ratio = rt286_set_bclk_ratio,
+	.auto_selectable_formats	= &rt286_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver rt286_dai[] = {
diff --git a/sound/soc/codecs/rt298.c b/sound/soc/codecs/rt298.c
index 5414a1712b571..5901638198d8d 100644
--- a/sound/soc/codecs/rt298.c
+++ b/sound/soc/codecs/rt298.c
@@ -1056,11 +1056,19 @@ static int rt298_resume(struct snd_soc_component *component)
 #define RT298_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE | \
 			SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S8)
 
+static const u64 rt298_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B;
+
 static const struct snd_soc_dai_ops rt298_aif_dai_ops = {
 	.hw_params = rt298_hw_params,
 	.set_fmt = rt298_set_dai_fmt,
 	.set_sysclk = rt298_set_dai_sysclk,
 	.set_bclk_ratio = rt298_set_bclk_ratio,
+	.auto_selectable_formats = &rt298_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static struct snd_soc_dai_driver rt298_dai[] = {
diff --git a/sound/soc/codecs/rt5514.c b/sound/soc/codecs/rt5514.c
index 58aecd4c83a60..8dad8ba0fe0ff 100644
--- a/sound/soc/codecs/rt5514.c
+++ b/sound/soc/codecs/rt5514.c
@@ -1142,12 +1142,24 @@ static int rt5514_i2c_write(void *context, unsigned int reg, unsigned int val)
 #define RT5514_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE | \
 			SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S8)
 
+static const u64 rt5514_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops rt5514_aif_dai_ops = {
 	.hw_params = rt5514_hw_params,
 	.set_fmt = rt5514_set_dai_fmt,
 	.set_sysclk = rt5514_set_dai_sysclk,
 	.set_pll = rt5514_set_dai_pll,
 	.set_tdm_slot = rt5514_set_tdm_slot,
+	.auto_selectable_formats = &rt5514_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static struct snd_soc_dai_driver rt5514_dai[] = {
diff --git a/sound/soc/codecs/rt5616.c b/sound/soc/codecs/rt5616.c
index 46ee412dc81db..3f9d97d04d48a 100644
--- a/sound/soc/codecs/rt5616.c
+++ b/sound/soc/codecs/rt5616.c
@@ -1260,11 +1260,21 @@ static int rt5616_resume(struct snd_soc_component *component)
 #define RT5616_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE | \
 			SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S8)
 
+static const u64 rt5616_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF;
+
 static const struct snd_soc_dai_ops rt5616_aif_dai_ops = {
 	.hw_params = rt5616_hw_params,
 	.set_fmt = rt5616_set_dai_fmt,
 	.set_sysclk = rt5616_set_dai_sysclk,
 	.set_pll = rt5616_set_dai_pll,
+	.auto_selectable_formats = &rt5616_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static struct snd_soc_dai_driver rt5616_dai[] = {
diff --git a/sound/soc/codecs/rt5631.c b/sound/soc/codecs/rt5631.c
index ed1233973eb83..f97fd24e4229a 100644
--- a/sound/soc/codecs/rt5631.c
+++ b/sound/soc/codecs/rt5631.c
@@ -1626,11 +1626,21 @@ static int rt5631_probe(struct snd_soc_component *component)
 			SNDRV_PCM_FMTBIT_S24_LE | \
 			SNDRV_PCM_FMTBIT_S8)
 
+static const u64 rt5631_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF;
+
 static const struct snd_soc_dai_ops rt5631_ops = {
 	.hw_params = rt5631_hifi_pcm_params,
 	.set_fmt = rt5631_hifi_codec_set_dai_fmt,
 	.set_sysclk = rt5631_hifi_codec_set_dai_sysclk,
 	.set_pll = rt5631_codec_set_dai_pll,
+	.auto_selectable_formats = &rt5631_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static struct snd_soc_dai_driver rt5631_dai[] = {
diff --git a/sound/soc/codecs/rt5640.c b/sound/soc/codecs/rt5640.c
index 74fd05176eff7..4fa1eee8e87f3 100644
--- a/sound/soc/codecs/rt5640.c
+++ b/sound/soc/codecs/rt5640.c
@@ -2877,11 +2877,21 @@ static int rt5640_resume(struct snd_soc_component *component)
 #define RT5640_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE | \
 			SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S8)
 
+static const u64 rt5640_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF;
+
 static const struct snd_soc_dai_ops rt5640_aif_dai_ops = {
 	.hw_params = rt5640_hw_params,
 	.set_fmt = rt5640_set_dai_fmt,
 	.set_sysclk = rt5640_set_dai_sysclk,
 	.set_pll = rt5640_set_dai_pll,
+	.auto_selectable_formats	= &rt5640_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver rt5640_dai[] = {
diff --git a/sound/soc/codecs/rt5645.c b/sound/soc/codecs/rt5645.c
index 0d546fb34e527..11715e9b8b250 100644
--- a/sound/soc/codecs/rt5645.c
+++ b/sound/soc/codecs/rt5645.c
@@ -3537,12 +3537,22 @@ static int rt5645_resume(struct snd_soc_component *component)
 #define RT5645_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE | \
 			SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S8)
 
+static const u64 rt5645_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF;
+
 static const struct snd_soc_dai_ops rt5645_aif_dai_ops = {
 	.hw_params = rt5645_hw_params,
 	.set_fmt = rt5645_set_dai_fmt,
 	.set_sysclk = rt5645_set_dai_sysclk,
 	.set_tdm_slot = rt5645_set_tdm_slot,
 	.set_pll = rt5645_set_dai_pll,
+	.auto_selectable_formats	= &rt5645_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver rt5645_dai[] = {
diff --git a/sound/soc/codecs/rt5651.c b/sound/soc/codecs/rt5651.c
index 5c729135f71bd..9723b4c7540cb 100644
--- a/sound/soc/codecs/rt5651.c
+++ b/sound/soc/codecs/rt5651.c
@@ -2102,11 +2102,21 @@ static int rt5651_resume(struct snd_soc_component *component)
 #define RT5651_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE | \
 			SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S8)
 
+static const u64 rt5651_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF;
+
 static const struct snd_soc_dai_ops rt5651_aif_dai_ops = {
 	.hw_params = rt5651_hw_params,
 	.set_fmt = rt5651_set_dai_fmt,
 	.set_sysclk = rt5651_set_dai_sysclk,
 	.set_pll = rt5651_set_dai_pll,
+	.auto_selectable_formats	= &rt5651_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver rt5651_dai[] = {
diff --git a/sound/soc/codecs/rt5659.c b/sound/soc/codecs/rt5659.c
index 3097ee6d4e89f..3d782f41ccdd8 100644
--- a/sound/soc/codecs/rt5659.c
+++ b/sound/soc/codecs/rt5659.c
@@ -3716,11 +3716,21 @@ static int rt5659_resume(struct snd_soc_component *component)
 #define RT5659_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE | \
 		SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S8)
 
+static const u64 rt5659_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF;
+
 static const struct snd_soc_dai_ops rt5659_aif_dai_ops = {
 	.hw_params = rt5659_hw_params,
 	.set_fmt = rt5659_set_dai_fmt,
 	.set_tdm_slot = rt5659_set_tdm_slot,
 	.set_bclk_ratio = rt5659_set_bclk_ratio,
+	.auto_selectable_formats	= &rt5659_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver rt5659_dai[] = {
diff --git a/sound/soc/codecs/rt5660.c b/sound/soc/codecs/rt5660.c
index edf2e3e346e4f..807604120d282 100644
--- a/sound/soc/codecs/rt5660.c
+++ b/sound/soc/codecs/rt5660.c
@@ -1161,11 +1161,21 @@ static int rt5660_resume(struct snd_soc_component *component)
 #define RT5660_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE | \
 			SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S8)
 
+static const u64 rt5660_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF;
+
 static const struct snd_soc_dai_ops rt5660_aif_dai_ops = {
 	.hw_params = rt5660_hw_params,
 	.set_fmt = rt5660_set_dai_fmt,
 	.set_sysclk = rt5660_set_dai_sysclk,
 	.set_pll = rt5660_set_dai_pll,
+	.auto_selectable_formats	= &rt5660_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver rt5660_dai[] = {
diff --git a/sound/soc/codecs/rt5663.c b/sound/soc/codecs/rt5663.c
index 262d3bba1f3d4..ec46e6180cc0e 100644
--- a/sound/soc/codecs/rt5663.c
+++ b/sound/soc/codecs/rt5663.c
@@ -3222,6 +3222,14 @@ static int rt5663_resume(struct snd_soc_component *component)
 #define RT5663_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE | \
 			SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S8)
 
+static const u64 rt5663_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF;
+
 static const struct snd_soc_dai_ops rt5663_aif_dai_ops = {
 	.hw_params = rt5663_hw_params,
 	.set_fmt = rt5663_set_dai_fmt,
@@ -3229,6 +3237,8 @@ static const struct snd_soc_dai_ops rt5663_aif_dai_ops = {
 	.set_pll = rt5663_set_dai_pll,
 	.set_tdm_slot = rt5663_set_tdm_slot,
 	.set_bclk_ratio = rt5663_set_bclk_ratio,
+	.auto_selectable_formats	= &rt5663_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver rt5663_dai[] = {
diff --git a/sound/soc/codecs/rt5665.c b/sound/soc/codecs/rt5665.c
index 1d987472ba42f..9545758f58d66 100644
--- a/sound/soc/codecs/rt5665.c
+++ b/sound/soc/codecs/rt5665.c
@@ -4401,11 +4401,21 @@ static int rt5665_resume(struct snd_soc_component *component)
 #define RT5665_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE | \
 		SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S8)
 
+static const u64 rt5665_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF;
+
 static const struct snd_soc_dai_ops rt5665_aif_dai_ops = {
 	.hw_params = rt5665_hw_params,
 	.set_fmt = rt5665_set_dai_fmt,
 	.set_tdm_slot = rt5665_set_tdm_slot,
 	.set_bclk_ratio = rt5665_set_bclk_ratio,
+	.auto_selectable_formats	= &rt5665_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver rt5665_dai[] = {
diff --git a/sound/soc/codecs/rt5668.c b/sound/soc/codecs/rt5668.c
index 4154bad276101..1a4a928c7c3c6 100644
--- a/sound/soc/codecs/rt5668.c
+++ b/sound/soc/codecs/rt5668.c
@@ -2254,16 +2254,30 @@ static int rt5668_resume(struct snd_soc_component *component)
 #define RT5668_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE | \
 		SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S8)
 
+static const u64 rt5668_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops rt5668_aif1_dai_ops = {
 	.hw_params = rt5668_hw_params,
 	.set_fmt = rt5668_set_dai_fmt,
 	.set_tdm_slot = rt5668_set_tdm_slot,
+	.auto_selectable_formats	= &rt5668_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static const struct snd_soc_dai_ops rt5668_aif2_dai_ops = {
 	.hw_params = rt5668_hw_params,
 	.set_fmt = rt5668_set_dai_fmt,
 	.set_bclk_ratio = rt5668_set_bclk_ratio,
+	.auto_selectable_formats	= &rt5668_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver rt5668_dai[] = {
diff --git a/sound/soc/codecs/rt5670.c b/sound/soc/codecs/rt5670.c
index 1d120b5dc2be7..f772f093479ad 100644
--- a/sound/soc/codecs/rt5670.c
+++ b/sound/soc/codecs/rt5670.c
@@ -2791,12 +2791,22 @@ static int rt5670_resume(struct snd_soc_component *component)
 #define RT5670_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE | \
 			SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S8)
 
+static const u64 rt5670_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF;
+
 static const struct snd_soc_dai_ops rt5670_aif_dai_ops = {
 	.hw_params = rt5670_hw_params,
 	.set_fmt = rt5670_set_dai_fmt,
 	.set_tdm_slot = rt5670_set_tdm_slot,
 	.set_pll = rt5670_set_dai_pll,
 	.set_bclk_ratio = rt5670_set_bclk_ratio,
+	.auto_selectable_formats	= &rt5670_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver rt5670_dai[] = {
diff --git a/sound/soc/codecs/rt5677.c b/sound/soc/codecs/rt5677.c
index 3e4d1dbce740e..8d2f2cffa6193 100644
--- a/sound/soc/codecs/rt5677.c
+++ b/sound/soc/codecs/rt5677.c
@@ -5033,12 +5033,22 @@ static int rt5677_write(void *context, unsigned int reg, unsigned int val)
 #define RT5677_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE | \
 			SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S8)
 
+static const u64 rt5677_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF;
+
 static const struct snd_soc_dai_ops rt5677_aif_dai_ops = {
 	.hw_params = rt5677_hw_params,
 	.set_fmt = rt5677_set_dai_fmt,
 	.set_sysclk = rt5677_set_dai_sysclk,
 	.set_pll = rt5677_set_dai_pll,
 	.set_tdm_slot = rt5677_set_tdm_slot,
+	.auto_selectable_formats	= &rt5677_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static const struct snd_soc_dai_ops rt5677_dsp_dai_ops = {
diff --git a/sound/soc/codecs/rt5682.c b/sound/soc/codecs/rt5682.c
index 6f7e68c20d135..50c528081fff3 100644
--- a/sound/soc/codecs/rt5682.c
+++ b/sound/soc/codecs/rt5682.c
@@ -3043,11 +3043,23 @@ static int rt5682_resume(struct snd_soc_component *component)
 #define rt5682_resume NULL
 #endif
 
+static const u64 rt5682_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 const struct snd_soc_dai_ops rt5682_aif1_dai_ops = {
 	.hw_params = rt5682_hw_params,
 	.set_fmt = rt5682_set_dai_fmt,
 	.set_tdm_slot = rt5682_set_tdm_slot,
 	.set_bclk_ratio = rt5682_set_bclk1_ratio,
+	.auto_selectable_formats	= &rt5682_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 EXPORT_SYMBOL_GPL(rt5682_aif1_dai_ops);
 
@@ -3055,6 +3067,8 @@ const struct snd_soc_dai_ops rt5682_aif2_dai_ops = {
 	.hw_params = rt5682_hw_params,
 	.set_fmt = rt5682_set_dai_fmt,
 	.set_bclk_ratio = rt5682_set_bclk2_ratio,
+	.auto_selectable_formats	= &rt5682_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 EXPORT_SYMBOL_GPL(rt5682_aif2_dai_ops);
 
diff --git a/sound/soc/codecs/rt5682s.c b/sound/soc/codecs/rt5682s.c
index 34997cfb465b6..cf3f3d53a4b08 100644
--- a/sound/soc/codecs/rt5682s.c
+++ b/sound/soc/codecs/rt5682s.c
@@ -2926,17 +2926,31 @@ static int rt5682s_resume(struct snd_soc_component *component)
 #define rt5682s_resume NULL
 #endif
 
+static const u64 rt5682s_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops rt5682s_aif1_dai_ops = {
 	.hw_params = rt5682s_hw_params,
 	.set_fmt = rt5682s_set_dai_fmt,
 	.set_tdm_slot = rt5682s_set_tdm_slot,
 	.set_bclk_ratio = rt5682s_set_bclk1_ratio,
+	.auto_selectable_formats	= &rt5682s_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static const struct snd_soc_dai_ops rt5682s_aif2_dai_ops = {
 	.hw_params = rt5682s_hw_params,
 	.set_fmt = rt5682s_set_dai_fmt,
 	.set_bclk_ratio = rt5682s_set_bclk2_ratio,
+	.auto_selectable_formats	= &rt5682s_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static const struct snd_soc_component_driver rt5682s_soc_component_dev = {
diff --git a/sound/soc/codecs/rt9120.c b/sound/soc/codecs/rt9120.c
index e51cd4a318948..1445e823c4ff0 100644
--- a/sound/soc/codecs/rt9120.c
+++ b/sound/soc/codecs/rt9120.c
@@ -289,9 +289,18 @@ static int rt9120_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
+static const u64 rt9120_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B;
+
 static const struct snd_soc_dai_ops rt9120_dai_ops = {
 	.set_fmt = rt9120_set_fmt,
 	.hw_params = rt9120_hw_params,
+	.auto_selectable_formats = &rt9120_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static struct snd_soc_dai_driver rt9120_dai = {
diff --git a/sound/soc/codecs/rt9123.c b/sound/soc/codecs/rt9123.c
index 07eaf275c9e98..6322415120b78 100644
--- a/sound/soc/codecs/rt9123.c
+++ b/sound/soc/codecs/rt9123.c
@@ -299,10 +299,19 @@ static int rt9123_dai_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
+static const u64 rt9123_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B;
+
 static const struct snd_soc_dai_ops rt9123_dai_ops = {
 	.set_fmt	= rt9123_dai_set_format,
 	.set_tdm_slot	= rt9123_dai_set_tdm_slot,
 	.hw_params	= rt9123_dai_hw_params,
+	.auto_selectable_formats	= &rt9123_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver rt9123_dai_driver = {
-- 
2.53.0

