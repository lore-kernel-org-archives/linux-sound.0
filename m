Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011044.outbound.protection.outlook.com [40.107.74.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71C993C9EC2
	for <linux-sound@vger.kernel.org>; Mon, 31 Aug 2026 05:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788152972; cv=fail; b=G5BCIMiPa+pOXSb4elHP2jrTYRc482YlKBrOm0IDsPPdfEdNuO/i3ZXmzcQV77E9NoLjxJu1UU7M7LUL/pOa7qLwL0Ws8wwcjDeO+RZqFAcBs79aR/IZgh2PAwzGaGouDij4Dpnl+UzzxlwemhiwTlvb+pHJPCwhvtgiBtr1MQE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788152972; c=relaxed/simple;
	bh=D2lvIpzl2FDF7GqnxAAVA7AJer3b/xwlJQJOqM1bdUo=;
	h=Message-ID:To:Cc:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Z7be+5RPexZBYVBFHuqytVYoTMxwbnRnRATP8uVMRlHl4oIRLrsBe1P5fmJ1CBpfJAMNYJaYflMCMSw4Ra6PjyCvNSB017kz+v+2owmgUxb3Vs7ocxRnw4xfy8hVvcaI1+kQkhEqKp2yhOVHhC1kn92Qhu8DCO9M95eooC6HYLE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=kqiLf9pd; arc=fail smtp.client-ip=40.107.74.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="kqiLf9pd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DzQ2Q9xY60NSILGsK07NqDgyuAufVEOfzT/yMI5dNCl8Nc/wlrWRSNA9GQqEMmcWi8U/i8rkIR4/Qy3wCm9vcc6scbkdRLJfzqo4Xmp5PQQ8+xKUqueZoCzp+b8jhgy9n8ydNCKppl+3AVr1pg/Ie2AampQQwKfJXR4sLN1p0kfYcgkyfSgycfg9pW3lqAZbBHxTM4des3uPhbIxn3z7pZIHcV6bqg5mlTKSBupLegLdSKTET7rxieAOda1U+EiHPRnSL4vvMUoUaTPOe2zYNEjgof0O+evPMC1VaFfDWtGGtPl/i02wAtQvs22PMsyaVHXwmgLQI/ryWBCIsbuBMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ax0+PlhaSomtklhOu0OFMMtM1WxeYDUIINXdU7d7ddM=;
 b=cXSyZCSadSrzT1jFFkRI0FDRCnLbNKhZhvYwWq9n783L0PHFRNR7PACPBhzo5oBlMd5fG+1r9C7V6JT/P5DqVXLgeQgXBqknp7AoLQs1ae8dw9xaq67U30K+GntZaFgMCl5V2iRAJfuWWXhAMUSEV7DFH5/qohOLITutpxKAw4G0qALVXO4hUXJdkcRJ9Q0r0mpXx0FVoyIK4x+/OkkNsLFgZS4xWdF31HKs6BrMpK7jb0sjzCDRjhIBoehTAJAR+43TrA+N7OXeMZASufCb8P9jD9iEo2E69agsj7d1TYafPKb24DLmnomQ5i0Gqs59oljYMypRKfTEZMNGuCCH1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ax0+PlhaSomtklhOu0OFMMtM1WxeYDUIINXdU7d7ddM=;
 b=kqiLf9pdbPgfwQu+Qv3RYJ2EDaXyjnbWrmWhwfWgd+1UJIKSJ72IQxh8DQKUbY82DXAhqhdIpkemZKrAQHlk3uTU1u5+OERhtYDRqjw/XmvUZQ2lMVUMcnzyjr0iBf8kwuB5ImW21FWP6BzmYrzVly+qsyDv8F6j4TbPq6F0unE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYRPR01MB16474.jpnprd01.prod.outlook.com
 (2603:1096:405:2ee::10) by TYYPR01MB12794.jpnprd01.prod.outlook.com
 (2603:1096:405:15c::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 05:09:29 +0000
Received: from TYRPR01MB16474.jpnprd01.prod.outlook.com
 ([fe80::2a39:9988:dbe9:894b]) by TYRPR01MB16474.jpnprd01.prod.outlook.com
 ([fe80::2a39:9988:dbe9:894b%6]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 05:09:29 +0000
Message-ID: <877bl6ub93.wl-kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 37/39] ASoC: codecs: uda13*: use .auto_selectable_formats
In-Reply-To: <87o6eivpyd.wl-kuninori.morimoto.gx@renesas.com>
References: <87o6eivpyd.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 31 Aug 2026 05:09:28 +0000
X-ClientProxiedBy: TYWP286CA0033.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:262::18) To TYRPR01MB16474.jpnprd01.prod.outlook.com
 (2603:1096:405:2ee::10)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB16474:EE_|TYYPR01MB12794:EE_
X-MS-Office365-Filtering-Correlation-Id: 375cd75a-3ef1-44ec-8ba4-08df071e08ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|52116014|376014|10067099003|6133799003|22082099003|56012099006|11063799006|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	4MRMSSUdKNYngWE6Evlre8gJFvFHW6vD/jARSFzAYE6xq7wsJDDzNukWzjahRjq1mncRl6XzPKll+MOAYx28RSZP8DbOF2KBRT/sHCf8D2W1FGQDukJl+L1+xAejcdHfjnvJAOtnXUnGQgePqQQDT2DagZPKc3p1I11ZNWvu/DiszErTTns6m+jLU8QCeK8AxEWUzjE9A7sjx5fI8gz5/5W1zE9HbyR5dUj6/kCXihr01r3KIgkDjjUuAlTE5iC+9IQ4dAW4o3z5BlxKqPP/jYSq7ZxhdOnuVkl62+MM0UD8S7WQMzXnbxoAPvGMJj6XdQsG6G+tthj7wp/dSl1YXzIXBqDOUDU5PAWo4iFgvd5w8/47NUfPo/eKFhdeGLiCmv0xDUc2umCcUBRGs0QADTLFw5Bxm6pzGFkpxyc7T/EgVpBS118vWit3CXumOkWZp6ssLysTvs3Nqq5cif9vw+ryEHxsaZaqcRAJoyLWRp0MF1EEfuiei3I1mStllWp49T9QDZqPKiLQxiiz23mhPgUClmakc/iCWMubVY1NhZEDoCcSkFZTTDJY8Cq8CD04jT58mqldAhrt5HISeR3OkkLJHa6PxNf6UavKe576YE+P11ZrM+sFBRSmeDqN8C4TFtQzK8IqDNwtexatCshFhk1MfenCTj8watwVvRI0E+w42zympz1/1ctHwi6jnf1ifa+yk+jt78fJosC8RUtBYao8cy9cUTx06MZEUKjZc80=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB16474.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(52116014)(376014)(10067099003)(6133799003)(22082099003)(56012099006)(11063799006)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1BrCmdtXYOGRVDM1AAruSIf+ADAN3YmfL1/1Bl9SbUrmHzCnyXoMR9goJskJ?=
 =?us-ascii?Q?dnmzhMBVb5w/ENthL2+XvD+LhijJG8XHJl7OcgAxGqEW6LPW8jaM1F/RNzrv?=
 =?us-ascii?Q?658YblaKae0oT3NxrVNHtGoThA/m4UO3rVqynpZwMpJXWuFazK2AzJZCyYnM?=
 =?us-ascii?Q?68aLMrmvmLreBwKSQ1kcK2SkwQlyuxiDt3Ta7qPbMHDtSHW9/i2E71vBdBLM?=
 =?us-ascii?Q?hqAYoYFi0Tjb5nHnJdPgxO/UR80HXAtwMNFh9m9iPfKehQef3DfD57HbMzbe?=
 =?us-ascii?Q?mVy6UahGkDBjROJop2hrz0hlKfoHtziqxyrN1B6lTNCzAx6sy1K0TrvQcxBa?=
 =?us-ascii?Q?Gmdoj2gJI5cPhkH/bzcuf+bEm2ot4bbOCCxQ94ILYwqgeAibS7nwzqyozqit?=
 =?us-ascii?Q?m+nlabpFkXaZFebWNTnQx12lro+nVq/RkuTrry8AFvFdzImXLhy8m5DFexoH?=
 =?us-ascii?Q?wZn8v0HOVOr0ukC36MSu+Pq2uNbtO6qA0qHBOcFtCrQFqWnuB6nta2xL72M4?=
 =?us-ascii?Q?I81RWJ1Jkw34lCa90r+xbwCIqIjqVC7V1B1th+hOXG8kTIZ52QRy5zBrAvrK?=
 =?us-ascii?Q?DY7fDeRB56mN4ey9DPg/iR1MMcwTce67ZiuFspmDw+MVozc/o5VMTDxf9SdY?=
 =?us-ascii?Q?LQ8Y5mjSVBbMb+yUVEDDzru4SQpYBF/7z7MJlkrnrAAB1W5yEKQ/E4bOxVgr?=
 =?us-ascii?Q?r5LOHVuyztqmMGFA6+sYq6YPrEGzHAqWPrv0ZcF/0Mnx+OhooWqjftUWhyHQ?=
 =?us-ascii?Q?17C7HOlqb/+Lz4dWGAIqzmHuggsC6ZrATjtS/OhWjl35zkrW1XA4dPXDJ23k?=
 =?us-ascii?Q?FUgjhEmuh9IvQ9toT9g8WBiOKL8N1sDSGSXhbnibG6qV1YiAY9dX75bqB1w5?=
 =?us-ascii?Q?fyCDrYOkxlSEvtpocQDpiUyUmFK92mWe/jucOiDZI2wE3XXoji377FlyYZL/?=
 =?us-ascii?Q?DaEWmnrlBMO87S0gLQcn0fJUZvGjmdTuDmtEReCIvh/+6GxpdeILiSP+3H5Q?=
 =?us-ascii?Q?SxaQ1cfm5zEYaBzOyLC6biG1FGy4wJZSWmWmUxxwTU9ceQrbwkmoygS8sK++?=
 =?us-ascii?Q?J+6XOKlvH4Pg4xRK9ZDJ4QmCRTEDr9hAak5yvBMJoLchVIC9P8GnUCk5qjwp?=
 =?us-ascii?Q?zooTGyYRrWA5dHNvx22iYXpaRgKMYTi7mlgkrq/pIv9y4xo6h6cS+g/Xz481?=
 =?us-ascii?Q?WTJBz/aeRz2XaT+ceideYTyefY1uXddmTSYZ1+3e4Oir9mBGce0glho7eZW6?=
 =?us-ascii?Q?ErhMnBWuTpi4XMIW6NjqkgMnSzABR0BVJlZhXmhRG59fDce7/L6xHLebVssQ?=
 =?us-ascii?Q?HJE/1QbU8WfI5fX7RzUFfFt+Xht+YFbgy93xyVwz84Dbaz3LtLw3sD4iaj94?=
 =?us-ascii?Q?6ZUbLbGbGN2Z7GQVGzVpkRfWaPhtzT9kVDELl7c/9QI4VURYm/QwDn1o3JfU?=
 =?us-ascii?Q?EGJspabKr3xPBdPfzj88zEFKF2LuYNcKmuuNTqsmNPVOjOrRvCKd8X7NZnnY?=
 =?us-ascii?Q?3AdIgtqLqHWv0qgf1aZvBe05+1Kqjue6IDXmRP1bBn7uy0vNO1g5p6HfeTGT?=
 =?us-ascii?Q?0Z5jzHOYQRwit0t1UDxf/FTGPybcyFobLwHFqSfSxD1wX1woqZp9/cGWT+mP?=
 =?us-ascii?Q?dj1e6xQqwmAiflYtz6CfWZmOuXYbUOm1ZJeN+D8yx6+PTs5x90td/Wom0tEt?=
 =?us-ascii?Q?QN+arkQqrV6e4k6N0nQQ9lYwIXaETl68p08kL9DWp5XTdP8QpwnbagVqv1kD?=
 =?us-ascii?Q?sKk9ma6d3AmL66hPXiiz4IxjbPZ/EyGwxKPQrZPWkUpXodOPdPHH?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 375cd75a-3ef1-44ec-8ba4-08df071e08ee
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB16474.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 05:09:29.4455
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DRWLdezKheJWN3YkP12AOQZY0UCJMJmHuSw+rX0mNOGfXRHPEglzsa0UmR8SAx5tkNorOzc6c9A/039bvMrInIucSZY+hyuiibB3pKlx3Rt3FIsA2bzKrpHlc1GqMTJ8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB12794

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/uda1334.c |  6 ++++++
 sound/soc/codecs/uda1342.c |  7 +++++++
 sound/soc/codecs/uda1380.c | 11 +++++++++++
 3 files changed, 24 insertions(+)

diff --git a/sound/soc/codecs/uda1334.c b/sound/soc/codecs/uda1334.c
index 54c5cb5b3d4bd..7ae6afdba38b4 100644
--- a/sound/soc/codecs/uda1334.c
+++ b/sound/soc/codecs/uda1334.c
@@ -193,12 +193,18 @@ static int uda1334_mute_stream(struct snd_soc_dai *dai, int mute, int stream)
 
 #define UDA1334_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S24_LE)
 
+static const u64 uda1334_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF;
+
 static const struct snd_soc_dai_ops uda1334_dai_ops = {
 	.startup	= uda1334_startup,
 	.shutdown	= uda1334_shutdown,
 	.set_sysclk	= uda1334_set_dai_sysclk,
 	.set_fmt	= uda1334_set_fmt,
 	.mute_stream	= uda1334_mute_stream,
+	.auto_selectable_formats	= &uda1334_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver uda1334_dai = {
diff --git a/sound/soc/codecs/uda1342.c b/sound/soc/codecs/uda1342.c
index 4e2d6240a8695..63d087590ac99 100644
--- a/sound/soc/codecs/uda1342.c
+++ b/sound/soc/codecs/uda1342.c
@@ -223,6 +223,11 @@ static const struct snd_soc_dapm_route uda1342_dapm_routes[] = {
 	{ "VOUTR", NULL, "DAC" },
 };
 
+static const u64 uda1342_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J;
+
 static const struct snd_soc_dai_ops uda1342_dai_ops = {
 	.startup	= uda1342_startup,
 	.shutdown	= uda1342_shutdown,
@@ -230,6 +235,8 @@ static const struct snd_soc_dai_ops uda1342_dai_ops = {
 	.mute_stream	= uda1342_mute,
 	.set_sysclk	= uda1342_set_dai_sysclk,
 	.set_fmt	= uda1342_set_dai_fmt,
+	.auto_selectable_formats	= &uda1342_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver uda1342_dai = {
diff --git a/sound/soc/codecs/uda1380.c b/sound/soc/codecs/uda1380.c
index 1dd09d10fc4ad..02adc534dfb06 100644
--- a/sound/soc/codecs/uda1380.c
+++ b/sound/soc/codecs/uda1380.c
@@ -653,11 +653,18 @@ static int uda1380_set_bias_level(struct snd_soc_component *component,
 		       SNDRV_PCM_RATE_16000 | SNDRV_PCM_RATE_22050 |\
 		       SNDRV_PCM_RATE_44100 | SNDRV_PCM_RATE_48000)
 
+static const u64 uda1380_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J;
+
 static const struct snd_soc_dai_ops uda1380_dai_ops = {
 	.hw_params	= uda1380_pcm_hw_params,
 	.shutdown	= uda1380_pcm_shutdown,
 	.trigger	= uda1380_trigger,
 	.set_fmt	= uda1380_set_dai_fmt_both,
+	.auto_selectable_formats	= &uda1380_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static const struct snd_soc_dai_ops uda1380_dai_ops_playback = {
@@ -665,6 +672,8 @@ static const struct snd_soc_dai_ops uda1380_dai_ops_playback = {
 	.shutdown	= uda1380_pcm_shutdown,
 	.trigger	= uda1380_trigger,
 	.set_fmt	= uda1380_set_dai_fmt_playback,
+	.auto_selectable_formats	= &uda1380_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static const struct snd_soc_dai_ops uda1380_dai_ops_capture = {
@@ -672,6 +681,8 @@ static const struct snd_soc_dai_ops uda1380_dai_ops_capture = {
 	.shutdown	= uda1380_pcm_shutdown,
 	.trigger	= uda1380_trigger,
 	.set_fmt	= uda1380_set_dai_fmt_capture,
+	.auto_selectable_formats	= &uda1380_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver uda1380_dai[] = {
-- 
2.53.0

