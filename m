Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011008.outbound.protection.outlook.com [52.101.125.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E517D3C4555
	for <linux-sound@vger.kernel.org>; Mon, 31 Aug 2026 05:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788152927; cv=fail; b=W8ZbCC3obOnPRXYkjI9bIEdLiT5Y/7DNo+xlooNzZBcptWQjdw+RzENfFuQQO0lhAvKteM8616BxWuik9kwaWMTPlJdDziyYe8UmbfUNyAodUuDtnRPBbjWHkpQwTqJUzkFxvREtBDmUjItZDqZ9M1aW2zSBKB0Bfd3ijpE1P/A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788152927; c=relaxed/simple;
	bh=RZ+LjMyoNGHQ8TZ0PEXPf7wvSuXutKQh+1OvogfzYgo=;
	h=Message-ID:To:Cc:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=hDglktJw+Ud2/wAMX+f7zBtIqtfMofNwZ2z9phGEuVnLUhcDI/S06h4LLBy2RuK3xilIo7wFVR6GOSNMXWSunt5b86x9yJdpKwq1w3CY6RxeP/Iqf+komDExVTZAgRUMXDotOM//nNMBteJgS+gP6ZUSpTr5KAMEQouJDy80J1Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=NO1N4ugz; arc=fail smtp.client-ip=52.101.125.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="NO1N4ugz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HoFeBS6ZmzHlcm0NwlxvsjC65VJ5g6CsnCkyNufJnl6sAShH2wl+4qVlTALfTNHiCGw8csX4anyzXCS2nZitXwgVvjgPm+ZTW0soVyTPDtYVO2taz3CEztUp//X/NB6v4Qxl19EH0GuTcrr1bKQ6ST17k+g/CpDlLPbBOuBdo6vKiCGTXksFRmQvyuUh/BSDbSWdvC+xmjquTlhWZmr8IvlC9Gu2qkv6bONSN6Gg7O/08Y311lwvycrfiuPOxtMdDhqoB++r76R4qpHG+9Graj+rsZ6+YtGvgWSLEBPplQpSOKSRQdLf83tUpkOWtXAuO6AyVhil8NoUSZvTnCIbkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SJmR1wcu6evnno0+xKCPbWfhe2q4d2XzbRlaQcvEB0o=;
 b=NzMV4IXcnkKiz8u3/AkjJ7wZ4DgsWp4HSg9Ay8KdKCgHUBRRpWfAduk8bwLvh88FzxME7P0Mat6j48qe1ilhafHX5Id3T0cWNt3N6c4wQcJdwbHInJ7o0ad56f+hOdR8Ll2of+HwPUGyS6B6km9ibP622g92pXIdDJb3Wc8l7uE6lSTFCOK1NnEwUSg5SwxaRvF9rUsnCRA6yvA9phvDPPmw1u4023EJhCkaHTFNmj5mtQycuL4d95nJyqzAxZYo6nLMYTBWCE5ofBWfFdcjyMqf3A6+761GTHFkNRwgtaDsAFSIg6513Y6nag5klXsRZYkjdNE6lL/EwdREGk8ABQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SJmR1wcu6evnno0+xKCPbWfhe2q4d2XzbRlaQcvEB0o=;
 b=NO1N4ugzx5RRXoZ4bCn1p3viU4OYx6F4VOoMZd3fBCgitj2pSq3Yi5eWVtmSR8j1mY45OdWDzCuTe0qkdt75NPn2I4fgb5/YCP/oTOfWTFYWUWDPhILDuQ57p/juka5V8iETSsC6cUvDps7Gv6G6fS7XaSvFtuqgBp9Sp9FxIyQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYRPR01MB16474.jpnprd01.prod.outlook.com
 (2603:1096:405:2ee::10) by TY5PR01MB18382.jpnprd01.prod.outlook.com
 (2603:1096:405:3e5::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 05:08:43 +0000
Received: from TYRPR01MB16474.jpnprd01.prod.outlook.com
 ([fe80::2a39:9988:dbe9:894b]) by TYRPR01MB16474.jpnprd01.prod.outlook.com
 ([fe80::2a39:9988:dbe9:894b%6]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 05:08:43 +0000
Message-ID: <87o6eiubad.wl-kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Oder Chiou <oder_chiou@realtek.com>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 25/39] ASoC: codecs: rt*: use .auto_selectable_formats
In-Reply-To: <87o6eivpyd.wl-kuninori.morimoto.gx@renesas.com>
References: <87o6eivpyd.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 31 Aug 2026 05:08:42 +0000
X-ClientProxiedBy: TYCP301CA0046.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:384::10) To TYRPR01MB16474.jpnprd01.prod.outlook.com
 (2603:1096:405:2ee::10)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB16474:EE_|TY5PR01MB18382:EE_
X-MS-Office365-Filtering-Correlation-Id: ae25e34f-1851-410e-d46e-08df071ded4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|52116014|1800799024|366016|376014|22082099003|18002099003|56012099006|11063799006|10067099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	eYsT/TBtbIhiU6MpEEHYRb4p9uVLctBnf2z72rzkwCCX2a5R2Rn/ZRVEfonzUOtqaTRJcyuTYcBeOqrmzglstuV2omHSFOGaNS+P0d6hRWoZihS91lUfGoXbhXe5zhixdaMUxo3dSQIBlVfzI5NHbOrdMe7Ud+AG3bZPzq39hhL+YloCrEjzUehHOMVJrLnijYjIzdQu5Dikk3Fpd3Ko632xD+FEdkL8B4dYRxQG3W+/cEGcmdrjs6MaUTQYBMF/nRFXFzb6fAadUCbEemJqbw2/nI32ZNh1Viix3I+KVBHL+klO9I4+0ROkNaNjGT4c3BXIIr/bNYyrQvcd9z0bMy19Hnw6c8Q+c+avcVaMDklcsLkPcAzHaTuvjULs+3h+PBC9iYcpbOrD00c8hax5XzrSfsIG5UihnoniipwOTsUFjoprx0FRG+36jcu7nt7v+knXRi+L1OGv6nbvi3bw1BGLWVIYTmFAgutdAGDfWYTwx1PgTABCKg2FlgqFHSGCVz+4vdHgv3M9ykA3Fy0fihaoJutck8brJlOl+2uVsaSVh/g3ATQCAMN/6gxCUZ7uCSuqybQOUfL+8/in7+LZ3gu/fpNizHqJkvMU9Qp2ByT4P/xM8peg26ajOZiuGEryzhwUL4K6lmIv7B3tSonRpjq7hJU3rLIjHhpKvYw+BTksNVeijNcAA8PWI8USnbuWuqsdqthXxivhsDqOrNyJ8Ao/6dsIpnvsIx1HX0mib94=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB16474.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(52116014)(1800799024)(366016)(376014)(22082099003)(18002099003)(56012099006)(11063799006)(10067099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1d2ZK1b1Br2VIF0P7jdmEvLsNgjHrT+ooT9HWkccdHPRRXefnxigHDkjlog9?=
 =?us-ascii?Q?wrXQI+56oczz0kh5OL6WKy038H5Vy/FJTRBILmXwuqEF4vdfFNKR3lAITdSX?=
 =?us-ascii?Q?EGOD0jSAkkCpqomwVm4LCIs8727/cjSofUjgvLvjkmFjMtLoHUMgLjYSmwMK?=
 =?us-ascii?Q?MFGR5dhK9bxTbaB6vkevZn9e4UK62if/MIq7OIlqomRMougV4N+u9VThif+t?=
 =?us-ascii?Q?t9n9msEaLPHT2ZYcR0A42djwfWdAnmVEx0cPPKp/gFJddR2SRyE4pcKuL8OT?=
 =?us-ascii?Q?GsWWEIjxkgBAGzXllADKWInN9mCVicCHHy7g4k4nA9M6Vt6e1TMOR7dyenKB?=
 =?us-ascii?Q?z6nW6odF7ffimJaYxaePT5SKNXZry7eUh02gwCru/cdDVUyEnQsoOeObfciJ?=
 =?us-ascii?Q?Mx88g0Y8s4AHUMP9j3PyluSlszeASl3xvdAGtKzTdmZA6FT1tER0s1kUgJ16?=
 =?us-ascii?Q?NOVgIBzy7R0ozrlWT28erYF5DMFmt51fjgqgL+Q+Zk4CdMzFuOp0/CF2FbgU?=
 =?us-ascii?Q?KDPocCkKSV7k0DurFSZuvEcjO1uMMdFbJt/MW0Pbzak7KbsX23ZTh82lWeHr?=
 =?us-ascii?Q?Z3df/ECmNwPoVUUSb8ceoGbbA8eQdZrBG0tjqrd0r0N6Upzgvn5JQPtp2xXs?=
 =?us-ascii?Q?u++5v9OML5rey7Li5iXAhCBy0DNVFGkQJWZ5eELCv6x30NZ4RyB0lHULD/n8?=
 =?us-ascii?Q?Kl2chj2gO0LU+RohlhSafcZE9OMVRHELV91gDtkXiVZRj9BXrqWg6KHLqnWk?=
 =?us-ascii?Q?ThE40kHZ7jIgiJM7330R7J6yMonh+eOLZrGvxTb153oEToqaWzZkleYQd3Ru?=
 =?us-ascii?Q?yv5T+vu+nk2S0mAkQk6L25xRPKV+Ygx61S7gGcIqRX4tpqEHNq2WgkPBL0kB?=
 =?us-ascii?Q?9ZNeibUBVC75ZlFDDwSmnIV2sQ+xlWE6w0Gin2UPWYogyseLH/RQ4XZ+31+l?=
 =?us-ascii?Q?mjb1TbR8+HUw/ROmQdD01oTWt5fbPV/CU84FdAhAR6YUSu/Vblzm8akgBllg?=
 =?us-ascii?Q?r3tq6/b2aMU1Di3fUhsJycGdoXTY6RwWTvnn9BtChuvBHMUuRJBzyE+P7tGb?=
 =?us-ascii?Q?3mSSyxDposbCJMfzrKwVO9hap+4INDmAOaleZcyL7CPyW2/UyvYJemGUcRyB?=
 =?us-ascii?Q?0PmaeJYAkSKgJ5u8tgmRL2TSqQfQ/vj7eZbAIOmYKbwrQRPtE/VT7Yl2q+fo?=
 =?us-ascii?Q?BWqAn8NNMVC+B/jF0VX1gtRVvpfQLHBmFZO3rSAFn5l7i/ARgrcHwEEwQSjT?=
 =?us-ascii?Q?oVyte+1fCB/2zccp8TFoOMIejTdiXbes2h5SaAlymEYW8T+oM3kngDH+Cdhc?=
 =?us-ascii?Q?SNCBR/BRhPPTlrnfbfjP1sLg8Kc4Ufhb0laF139dlOf6Ulejq2zv+SBkB5Cw?=
 =?us-ascii?Q?FfF1cuzR+j+HUfrLgXIvHmLLZq7Yu4X82bOWVF2TWrJuNUcoblSkYZFFrOCO?=
 =?us-ascii?Q?BQW3GhauGDI4PuroxFnP0CI+m9ujGevM7r4BObytMvb07PTiASZXTWnPWtHf?=
 =?us-ascii?Q?fxopVWLPD6lpeFBlLfHgyJm9DfXMUy2lMlFLFfmBn7ZyLrjhLaVfCc8cT934?=
 =?us-ascii?Q?ZqgUG4VlVtuVOpeot7dXGDINMKHWyZcxqH/HsQjQOqFkkUQ+2BPmInnEhnxo?=
 =?us-ascii?Q?942akkHN16HFFw0d5rvCHLZbd9ifNGcO0DIADcEGoHuJ65a88sU6tk+NdXGV?=
 =?us-ascii?Q?IuJIZItKp6fytYZjXoQ9+65eAwtH5aRKGvsT7NVaWNgaEQvVnVqyi1RbiGQc?=
 =?us-ascii?Q?xveEpiNF9JiAPOoS471QKGcbRf0JRzGpJt20i+0TPZ7SYJoSCrTa?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae25e34f-1851-410e-d46e-08df071ded4c
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB16474.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 05:08:42.8612
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3+frBvQ5Xne7FWsv0lZTyDmjt1hzYy6wBEvBcM2QFhGjflVEwLOY97prORHpxhj2uOhSY3njWzefi2pXD1kXlOmMa8H13khToFDPso+ngg2b/F4/SmFdvNfW31QhLBEa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY5PR01MB18382

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
 sound/soc/codecs/rt5668.c  | 22 ++++++++++++++++++++++
 sound/soc/codecs/rt5670.c  | 10 ++++++++++
 sound/soc/codecs/rt5677.c  | 10 ++++++++++
 sound/soc/codecs/rt5682.c  | 22 ++++++++++++++++++++++
 sound/soc/codecs/rt5682s.c | 22 ++++++++++++++++++++++
 sound/soc/codecs/rt9120.c  |  9 +++++++++
 sound/soc/codecs/rt9123.c  | 13 +++++++++++++
 27 files changed, 304 insertions(+)

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
index 55607f1b9a1ed..5f61de9e2ff97 100644
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
index f8c370106504c..62fc071d646a7 100644
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
index 4217467904d6f..51b407b78e6d1 100644
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
index 09aed08b5b798..72407fec0f345 100644
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
index 7313ea71c9580..bf9f278c3de9d 100644
--- a/sound/soc/codecs/rt5645.c
+++ b/sound/soc/codecs/rt5645.c
@@ -3541,12 +3541,22 @@ static int rt5645_resume(struct snd_soc_component *component)
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
index 4154bad276101..cd6245d6b91af 100644
--- a/sound/soc/codecs/rt5668.c
+++ b/sound/soc/codecs/rt5668.c
@@ -2254,16 +2254,38 @@ static int rt5668_resume(struct snd_soc_component *component)
 #define RT5668_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE | \
 		SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S8)
 
+static const u64 rt5668_selectable_formats_aif1 =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
+static const u64 rt5668_selectable_formats_aif2 =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF;
+
 static const struct snd_soc_dai_ops rt5668_aif1_dai_ops = {
 	.hw_params = rt5668_hw_params,
 	.set_fmt = rt5668_set_dai_fmt,
 	.set_tdm_slot = rt5668_set_tdm_slot,
+	.auto_selectable_formats	= &rt5668_selectable_formats_aif1,
+	.num_auto_selectable_formats	= 1,
 };
 
 static const struct snd_soc_dai_ops rt5668_aif2_dai_ops = {
 	.hw_params = rt5668_hw_params,
 	.set_fmt = rt5668_set_dai_fmt,
 	.set_bclk_ratio = rt5668_set_bclk_ratio,
+	.auto_selectable_formats	= &rt5668_selectable_formats_aif2,
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
index 4757017cc83d8..7b80922236e58 100644
--- a/sound/soc/codecs/rt5677.c
+++ b/sound/soc/codecs/rt5677.c
@@ -5031,12 +5031,22 @@ static int rt5677_write(void *context, unsigned int reg, unsigned int val)
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
index 6f7e68c20d135..1aceb08b280d6 100644
--- a/sound/soc/codecs/rt5682.c
+++ b/sound/soc/codecs/rt5682.c
@@ -3043,11 +3043,31 @@ static int rt5682_resume(struct snd_soc_component *component)
 #define rt5682_resume NULL
 #endif
 
+static const u64 rt5682_selectable_formats_aif1 =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
+static const u64 rt5682_selectable_formats_aif2 =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF;
+
 const struct snd_soc_dai_ops rt5682_aif1_dai_ops = {
 	.hw_params = rt5682_hw_params,
 	.set_fmt = rt5682_set_dai_fmt,
 	.set_tdm_slot = rt5682_set_tdm_slot,
 	.set_bclk_ratio = rt5682_set_bclk1_ratio,
+	.auto_selectable_formats	= &rt5682_selectable_formats_aif1,
+	.num_auto_selectable_formats	= 1,
 };
 EXPORT_SYMBOL_GPL(rt5682_aif1_dai_ops);
 
@@ -3055,6 +3075,8 @@ const struct snd_soc_dai_ops rt5682_aif2_dai_ops = {
 	.hw_params = rt5682_hw_params,
 	.set_fmt = rt5682_set_dai_fmt,
 	.set_bclk_ratio = rt5682_set_bclk2_ratio,
+	.auto_selectable_formats	= &rt5682_selectable_formats_aif2,
+	.num_auto_selectable_formats	= 1,
 };
 EXPORT_SYMBOL_GPL(rt5682_aif2_dai_ops);
 
diff --git a/sound/soc/codecs/rt5682s.c b/sound/soc/codecs/rt5682s.c
index 34997cfb465b6..6dd0d36a71863 100644
--- a/sound/soc/codecs/rt5682s.c
+++ b/sound/soc/codecs/rt5682s.c
@@ -2926,17 +2926,39 @@ static int rt5682s_resume(struct snd_soc_component *component)
 #define rt5682s_resume NULL
 #endif
 
+static const u64 rt5682s_selectable_formats_aif1 =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
+static const u64 rt5682s_selectable_formats_aif2 =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF;
+
 static const struct snd_soc_dai_ops rt5682s_aif1_dai_ops = {
 	.hw_params = rt5682s_hw_params,
 	.set_fmt = rt5682s_set_dai_fmt,
 	.set_tdm_slot = rt5682s_set_tdm_slot,
 	.set_bclk_ratio = rt5682s_set_bclk1_ratio,
+	.auto_selectable_formats	= &rt5682s_selectable_formats_aif1,
+	.num_auto_selectable_formats	= 1,
 };
 
 static const struct snd_soc_dai_ops rt5682s_aif2_dai_ops = {
 	.hw_params = rt5682s_hw_params,
 	.set_fmt = rt5682s_set_dai_fmt,
 	.set_bclk_ratio = rt5682s_set_bclk2_ratio,
+	.auto_selectable_formats	= &rt5682s_selectable_formats_aif2,
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
index 07eaf275c9e98..251bad450ec8a 100644
--- a/sound/soc/codecs/rt9123.c
+++ b/sound/soc/codecs/rt9123.c
@@ -299,10 +299,23 @@ static int rt9123_dai_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
+/*
+ * NOTE
+ *
+ * auto_select doesn't include _DSP_A / _DSP_B, because it has limitaion for TDM
+ * (= rt9123_dai_hw_params()). It can be selected via Card directly if needed.
+ */
+static const u64 rt9123_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J;
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

