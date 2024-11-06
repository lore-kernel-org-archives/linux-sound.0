Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011054.outbound.protection.outlook.com [40.107.74.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39966645
	for <linux-sound@vger.kernel.org>; Wed,  6 Nov 2024 00:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730851852; cv=fail; b=hmyP0IFEmi5Y6uGj3b/i+4n+yMBX9adXeETNSMxjY+fIPs1w/lMtj9kTEywTCasjitBoE4+Z53fERdsPtFYO4k/J/rtaKasKq1xagBE7CzMdx6q5/xslYV+jcE5QwkAuRtm+5AdgRL47zYC1+glUZRkk5QUX9TFgTCv4TJY/600=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730851852; c=relaxed/simple;
	bh=j4X6+2FYv3QJCpifECL0jPPOzJpcC9eVTbEil/rCECg=;
	h=Message-ID:From:Subject:To:Cc:Content-Type:Date:MIME-Version; b=N7dKNK7EN7N3KWd7+WRqDuUWfSAhQaZn0Ys6HDjNNKK9EQsRsw3RhS6FqYrs33RFXdC+RCpSWEM7GeaOrlHVAAsqp9pVeEnu7lvL7igml+vRijdYJM9zgJ3SDKhYlp/+4DLbhBtg1laDrnfveMq5jjF5pPY0dsBLw6SX4UOQNCM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=cQvBbcO8; arc=fail smtp.client-ip=40.107.74.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="cQvBbcO8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hdcs6BIc5MjLjilhx+EaxrK43p9sBBZn5Z/xXzETRw02hF3dwU1yoIXJ5Gpso94uYzOYaA/0XoNVVjqrT9z5RwyDeXrmjpBhfdXZIX/irOAQdV23gM3pwuO6hPxgK68qh5ov7xW/ZrEPTLn4dhP0hAxUV1wT+6bcYpeHaEHpSjrFPuqiL0fJUOOzihXrjwH00V6oScYbwZN80hAdKSdItOVbHE1V2eyVTL9jk97hEqjHAHS4MvqslkTjUzDB5fe1jRUZGGhA+svdaW77fLADavUuKUh9CFvtTVLTPGfhSUYwQ0b6l38SWIcRXYxbFidj3VqcTo2rQcne2pOQyhTuVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5qmRpqoDP+jW5wJ0Xj/sgyr6J4dyg9lr5gAB7oD7FQc=;
 b=O0tOJtXTZuFMei/AUUyxh7u7uXurwviMTG8f/6VoaCfkcqhbw+IyW/iW6axGxNbTGx1OIxJaLxTNsIxfxEkyVf/w6/F/Ps6YkxHR+IGkkGeYN4skt6C9iNYoybJewFIJ3UlOWAtrPf111M41o9We7JlUzrls4Bi0v0Qk+0y2gfFtava09jZBlAQfws3htVe0IiSHrfsUCHyHUHOPAf3xGCFM2L/gQb0B5doXxnB2EFZaXidjSIK8LA7T1noc0t5XoIgQ4iC6i7LJQ3M5MEAnG8NgFSh5JgqoopJnkcEmyruT8dD2RwhCQTvMiSns04wLKWdD4blopyXziBd+uRogjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5qmRpqoDP+jW5wJ0Xj/sgyr6J4dyg9lr5gAB7oD7FQc=;
 b=cQvBbcO8XBz09YoFZDDIZxXPVI36O/4a0nWOQ333uFvsV3osyhFXFFMYo9/SGJKfCllsALOBsHHO6WY/xCbxt/ppVshFVfyo69xOmFDxgORRy7mRgS0uV+WlGF+dfElUmXVpchwU+QdZdRDDbuRFsDGmu3DvPzELEcq8deIW2pE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB7435.jpnprd01.prod.outlook.com
 (2603:1096:400:f4::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19; Wed, 6 Nov
 2024 00:10:45 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%6]) with mapi id 15.20.8114.031; Wed, 6 Nov 2024
 00:10:45 +0000
Message-ID: <87zfmd8bnf.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH] ASoC: add symmetric_ prefix for dai->rate/channels/sample_bits
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-sound@vger.kernel.org, linux-mediatek@lists.infradead.org 
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 6 Nov 2024 00:10:44 +0000
X-ClientProxiedBy: TYCP286CA0126.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b6::10) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB7435:EE_
X-MS-Office365-Filtering-Correlation-Id: 41b3063b-0340-4d35-2515-08dcfdf77587
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8/ySJxH8wyXPhOFi97iBQzlYmL5aytm35Y4QIHCvManp5nH2jxlrwxBQwRJk?=
 =?us-ascii?Q?Rmveme023RQdee92dF8bdhghzYgeWwD2gHMf+ZSyFE4M/uqbvzY3byrzouv8?=
 =?us-ascii?Q?wsTPTji8pJrOs2UYulS0IJeQI8A9j2SlFa0kz0EhFD6PD9I1DfXQzfK0beft?=
 =?us-ascii?Q?/V/g1+Z2O7lJLjPsat7klhRrOAuNE4iW/jcv0WqU8+oL2jDIwliIl5dnJPet?=
 =?us-ascii?Q?I/ivHVAjSogCx9d5KZyJfyGzD07z21U3+AhXoJj/n8tOrAn3WdleSqxwnDPJ?=
 =?us-ascii?Q?WRpybB8deFk7IGR6lzvd6yVetGd68GZTQT4rLvBW1Zbu/IrHAPzUEOD+x1CA?=
 =?us-ascii?Q?xr5Fde6kDCl2KUxuCmYr0bBzsqNLoqNDqEto0D3ahKsVBXlisrp+FV0fmAQu?=
 =?us-ascii?Q?o+IKlwsE7KJw+190oIRsi1MtkH47B5VkJ8BmQeQoxm8TjkBSMFxA/hxebaqA?=
 =?us-ascii?Q?HFkpL/+8TsoI0K5TRjGNOtOwXOOMblHdzx1wJh6AI0w3uqtqQlJZVHkm8I7T?=
 =?us-ascii?Q?efuA8ZySMjfwEh59leyOTQa/PP15OHV6C3Z4DZZaCyDXJJsCR3ECdeDnmClX?=
 =?us-ascii?Q?o47/9KX5m2alfdeIfa9nIy1X830sJMM7TVJhlNaZRThKLLKDOy1eMA0IwI+/?=
 =?us-ascii?Q?bqSvGUkhDzNtxEsUwDuRQMd+XzpRKF/VunWLg/PfHG2BNPh3qmrJNon0UbbP?=
 =?us-ascii?Q?CErlcQ+3N12jqM6dI+3P3QN90x4I8A44hc47TLYTWnb+PjZsJEGJl5jHAMQM?=
 =?us-ascii?Q?8RiVWddQlafpx9mvuntMx6yduwZQlFZsJpyHIIGzqcxVPYih7fGkIg8gXXM6?=
 =?us-ascii?Q?UsrQLT5HcMsWLsAz82PIEWviXVsClRdvXslgzPIIqNq48RwVL+5Pr5dYfTIP?=
 =?us-ascii?Q?Yr4DLv7XG/26BZivJfL4tz32oZhdY63C7SmJT6d3TVpEauHzOp4LcSh/rReH?=
 =?us-ascii?Q?Z44fN3BQQ2ZTF8n6qRJOc/Z6oWEtiu4rpYPxYtr30q68bYUhAkqJSKhtgaBP?=
 =?us-ascii?Q?avJDC7yelU5kZG6tk3LD4SUuSyvHP2xDJWJQrTFKSlKA+L4a7kjW7SdZrO5A?=
 =?us-ascii?Q?miKQhub1nuzg+euq8pLEqz2BaQpuO+fCYUSawnrIdoqUk4yFmbHsVowmMSC4?=
 =?us-ascii?Q?mre2CPVpDNoJZL9V4mslRW+4AdZlGochWPMeF84sfU9ACVrliW2Gd8KtGafp?=
 =?us-ascii?Q?gZMF7+zky6VkqZiWwKn7s7xXZ7RxAC+RdhkvuKR6eOCEdoodO9Jo4Bx6FNax?=
 =?us-ascii?Q?gpQFu173o8YtNpukYzY5ViYBmhSnlVFzW1wytASBucjc3Xe/Qmcel+kjWO4L?=
 =?us-ascii?Q?7JVjZAowYgXCAFaoR96psJTmIWWs4uzW3UAqOMPobId7VkrG/UFUvoGIGD2W?=
 =?us-ascii?Q?if3h4sQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0cVmicVH9fVVUzeAs/Wn+1vJMZNPMbNg5hOptAPPZ3GT5uTPiBrGQA6CdlGn?=
 =?us-ascii?Q?sodaYWil64AeLEJS9m5Lf654v35/R7R2eTlRunypIXa71JM15ve5c2hLCJb3?=
 =?us-ascii?Q?/+3abydcoNcrW9BSuW+wMbjA9wwYSR6aUlS/r5sTHFdaAMLRGCrTmWHD51iG?=
 =?us-ascii?Q?KHFKasztvsBjYHhf4PKRpgwEIP4M9YCIcx3HSsnqKB+Q3KUcn5w/v4fPGCnZ?=
 =?us-ascii?Q?h2gYSJ27O0e1ASd+AYjdIszWYh1Dpg463U/MxJMUy3tLfbRbsvlmcJNEkdOj?=
 =?us-ascii?Q?BMtcnAaiT2ke4aw/RceerdNnpT8y0pCMZK3Y18s4MZ5bWuqdH+mRARFqKlNT?=
 =?us-ascii?Q?FaaIOkLmYVM3dtoQ+yY/yAAEm6PBiUzdL0NRcZJePmQiXPEO1WHSIRW3CYVf?=
 =?us-ascii?Q?aDSUsIfAZ/ImzuS27ZpbHEYfUKZh/LWZCgsFieCYidjnrl+UxHK028XYIFbg?=
 =?us-ascii?Q?7xT7ZYX2xDIHaKRfaDxS8H0N7NstCDMIcV4GuX0X1ewlllQMtUAihktwLZJv?=
 =?us-ascii?Q?fKTNJ8tekgEHUFKfQ8PRBXYU2xgbXXxbwaEOZBufQJWoSjCgtXUqGskyJ+Xf?=
 =?us-ascii?Q?9pqtE76m0/TNrgHqp1RlZplILF3X5vanwQK6wwjOLQoRmAthDKDdtfve5ncy?=
 =?us-ascii?Q?dElDaSUuLfGKDqfTrT03V4g3jE8jDKWa29/WF9LMYuRUk+tR66tDYTPFwRDc?=
 =?us-ascii?Q?aZjpXiA2Jhy3RCnD+sCRT1FvlL0OzRD1DgfoDOd467B87FcMLGKOArSG0yGN?=
 =?us-ascii?Q?qHDxhN9qDm7scq4i9zNdiMKdnj6oRWatuk9/7149adQAAhDKdtVarwvqyC6R?=
 =?us-ascii?Q?XuoZV5TK5/1PuzibY+xgxmXp5IPSkRTD2t7jNwbShphBmVmLg+LFHU78kvUM?=
 =?us-ascii?Q?PRngGXH+3rvl01nNx5c7FN913UI+6K75ZuOJJJZPmeR8fxXEp5UJlOnRp+ct?=
 =?us-ascii?Q?Uv/4EwW9oRe3X6oaySclN82cwqA7MGvDGaDDuYuIJ7GSLTaeK+ilaCf2F+UE?=
 =?us-ascii?Q?8sM+vkFcDtgq4lKfiCDD0y0D4vvTFGCRUDh8883LcY0RMPc8O56c19wLgT5i?=
 =?us-ascii?Q?0v+rd4R1xTk1ZW8q2/y0rvw3whBJ3lhe30KneNsgz7Fd/4sVDjWkt5FR7/PY?=
 =?us-ascii?Q?Pj9pgU6ph9IRiHaUsLjN4+Vp/Xkv7iYJL1D22sxG1WzRdRt+AGnvmy84qIYy?=
 =?us-ascii?Q?uZDKsbzHJxM3YcpPBi59BPeJIEX6PXKQmlI+kjzhnhAQb6N5Vu54vcmFuOoo?=
 =?us-ascii?Q?RtK5s+FSmp1W/ApU6uSa+QJthh/GYK/KJU3C2++mAj6vN8NdHgi2b6A4mOpO?=
 =?us-ascii?Q?+/hkiXgURNOEJqaGC1KqerlDJeTUArnKsC3v6C13K6yOuSjTZVntYeo0mYQc?=
 =?us-ascii?Q?JTiYeyhI1h+rPzbDg0mrHzAVMRezXHeLkCycm/R6toFlT1gfsWWiRhDvFiVj?=
 =?us-ascii?Q?+S0V6DGSMaUCsSDbCrk90/Ev/irslgHC0cZDSY4O8Ix+YOZYKgps7ydrg9zb?=
 =?us-ascii?Q?RhHk64aWldd6FmBdVptY3GLHd72OOuNvKgUCe1rqyAEI4Zs9omrq7nn826io?=
 =?us-ascii?Q?lcJ0ID7mXkmEB/5YabAIHH3bkm2KLHcX0YCKs36c3MomFz+Gz4x2YCjVGEaW?=
 =?us-ascii?Q?SozvEhkMBruL4hLx1dHb60s=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41b3063b-0340-4d35-2515-08dcfdf77587
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2024 00:10:45.1825
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d35W5TJ2bwbIX4/wdYe4Qa3E2amsPH4ScTb1FT1DBpmonG/DT1ktYiOD0wZH2wmWLgOfna8BiUkp2pcGfY/aQLS4x5nv5UlnaY9+2u6ShoGxm42pvMYZow/QERlZ3xYB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB7435

snd_soc_dai has rate/channels/sample_bits parameter, but it is only valid
if symmetry is being enforced by symmetric_xxx flag on driver.

It is very difficult to know about it from current naming, and easy to
misunderstand it. add symmetric_ prefix for it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-dai.h                     |  6 ++---
 sound/soc/mediatek/mt8188/mt8188-dai-pcm.c  |  2 +-
 sound/soc/mediatek/mt8195/mt8195-dai-pcm.c  |  2 +-
 sound/soc/mediatek/mt8365/mt8365-dai-dmic.c |  6 ++---
 sound/soc/mediatek/mt8365/mt8365-dai-pcm.c  |  2 +-
 sound/soc/soc-compress.c                    |  4 +--
 sound/soc/soc-pcm.c                         | 29 +++++++++++----------
 7 files changed, 26 insertions(+), 25 deletions(-)

diff --git a/include/sound/soc-dai.h b/include/sound/soc-dai.h
index b275201b02f60..aab57c19f62b2 100644
--- a/include/sound/soc-dai.h
+++ b/include/sound/soc-dai.h
@@ -449,9 +449,9 @@ struct snd_soc_dai {
 	struct snd_soc_dai_stream stream[SNDRV_PCM_STREAM_LAST + 1];
 
 	/* Symmetry data - only valid if symmetry is being enforced */
-	unsigned int rate;
-	unsigned int channels;
-	unsigned int sample_bits;
+	unsigned int symmetric_rate;
+	unsigned int symmetric_channels;
+	unsigned int symmetric_sample_bits;
 
 	/* parent platform/codec */
 	struct snd_soc_component *component;
diff --git a/sound/soc/mediatek/mt8188/mt8188-dai-pcm.c b/sound/soc/mediatek/mt8188/mt8188-dai-pcm.c
index 5bc854a8f3df3..8ca7cc75e21dc 100644
--- a/sound/soc/mediatek/mt8188/mt8188-dai-pcm.c
+++ b/sound/soc/mediatek/mt8188/mt8188-dai-pcm.c
@@ -128,7 +128,7 @@ static int mtk_dai_pcm_configure(struct snd_pcm_substream *substream,
 	unsigned int lrck_inv;
 	unsigned int bck_inv;
 	unsigned int fmt;
-	unsigned int bit_width = dai->sample_bits;
+	unsigned int bit_width = dai->symmetric_sample_bits;
 	unsigned int val = 0;
 	unsigned int mask = 0;
 	int fs = 0;
diff --git a/sound/soc/mediatek/mt8195/mt8195-dai-pcm.c b/sound/soc/mediatek/mt8195/mt8195-dai-pcm.c
index 6d6d79300d512..cdc16057d50e2 100644
--- a/sound/soc/mediatek/mt8195/mt8195-dai-pcm.c
+++ b/sound/soc/mediatek/mt8195/mt8195-dai-pcm.c
@@ -127,7 +127,7 @@ static int mtk_dai_pcm_configure(struct snd_pcm_substream *substream,
 	unsigned int lrck_inv;
 	unsigned int bck_inv;
 	unsigned int fmt;
-	unsigned int bit_width = dai->sample_bits;
+	unsigned int bit_width = dai->symmetric_sample_bits;
 	unsigned int val = 0;
 	unsigned int mask = 0;
 	int fs = 0;
diff --git a/sound/soc/mediatek/mt8365/mt8365-dai-dmic.c b/sound/soc/mediatek/mt8365/mt8365-dai-dmic.c
index f9945c2a2cd13..0bac143b48bfb 100644
--- a/sound/soc/mediatek/mt8365/mt8365-dai-dmic.c
+++ b/sound/soc/mediatek/mt8365/mt8365-dai-dmic.c
@@ -118,13 +118,13 @@ static int mt8365_dai_configure_dmic(struct mtk_base_afe *afe,
 	unsigned int clk_phase_sel_ch1 = dmic_data->clk_phase_sel_ch1;
 	unsigned int clk_phase_sel_ch2 = dmic_data->clk_phase_sel_ch2;
 	unsigned int val = 0;
-	unsigned int rate = dai->rate;
-	int reg = get_chan_reg(dai->channels);
+	unsigned int rate = dai->symmetric_rate;
+	int reg = get_chan_reg(dai->symmetric_channels);
 
 	if (reg < 0)
 		return -EINVAL;
 
-	dmic_data->dmic_channel = dai->channels;
+	dmic_data->dmic_channel = dai->symmetric_channels;
 
 	val |= DMIC_TOP_CON_SDM3_LEVEL_MODE;
 
diff --git a/sound/soc/mediatek/mt8365/mt8365-dai-pcm.c b/sound/soc/mediatek/mt8365/mt8365-dai-pcm.c
index f85ec07249c3b..3373b88da28ea 100644
--- a/sound/soc/mediatek/mt8365/mt8365-dai-pcm.c
+++ b/sound/soc/mediatek/mt8365/mt8365-dai-pcm.c
@@ -44,7 +44,7 @@ static int mt8365_dai_configure_pcm1(struct snd_pcm_substream *substream,
 	bool lrck_inv = pcm_priv->lrck_inv;
 	bool bck_inv = pcm_priv->bck_inv;
 	unsigned int fmt = pcm_priv->format;
-	unsigned int bit_width = dai->sample_bits;
+	unsigned int bit_width = dai->symmetric_sample_bits;
 	unsigned int val = 0;
 
 	if (!slave_mode) {
diff --git a/sound/soc/soc-compress.c b/sound/soc/soc-compress.c
index 3c514703fa33d..563dc0767c177 100644
--- a/sound/soc/soc-compress.c
+++ b/sound/soc/soc-compress.c
@@ -69,10 +69,10 @@ static int soc_compr_clean(struct snd_compr_stream *cstream, int rollback)
 	snd_soc_dai_digital_mute(codec_dai, 1, stream);
 
 	if (!snd_soc_dai_active(cpu_dai))
-		cpu_dai->rate = 0;
+		cpu_dai->symmetric_rate = 0;
 
 	if (!snd_soc_dai_active(codec_dai))
-		codec_dai->rate = 0;
+		codec_dai->symmetric_rate = 0;
 
 	snd_soc_link_compr_shutdown(cstream, rollback);
 
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index fb7f25fd8ec5b..1150455619aa4 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -447,13 +447,13 @@ static void soc_pcm_set_dai_params(struct snd_soc_dai *dai,
 				   struct snd_pcm_hw_params *params)
 {
 	if (params) {
-		dai->rate	 = params_rate(params);
-		dai->channels	 = params_channels(params);
-		dai->sample_bits = snd_pcm_format_physical_width(params_format(params));
+		dai->symmetric_rate	   = params_rate(params);
+		dai->symmetric_channels	   = params_channels(params);
+		dai->symmetric_sample_bits = snd_pcm_format_physical_width(params_format(params));
 	} else {
-		dai->rate	 = 0;
-		dai->channels	 = 0;
-		dai->sample_bits = 0;
+		dai->symmetric_rate	   = 0;
+		dai->symmetric_channels	   = 0;
+		dai->symmetric_sample_bits = 0;
 	}
 }
 
@@ -467,14 +467,14 @@ static int soc_pcm_apply_symmetry(struct snd_pcm_substream *substream,
 		return 0;
 
 #define __soc_pcm_apply_symmetry(name, NAME)				\
-	if (soc_dai->name && (soc_dai->driver->symmetric_##name ||	\
-			      rtd->dai_link->symmetric_##name)) {	\
+	if (soc_dai->symmetric_##name &&				\
+	    (soc_dai->driver->symmetric_##name || rtd->dai_link->symmetric_##name)) { \
 		dev_dbg(soc_dai->dev, "ASoC: Symmetry forces %s to %d\n",\
-			#name, soc_dai->name);				\
+			#name, soc_dai->symmetric_##name);		\
 									\
 		ret = snd_pcm_hw_constraint_single(substream->runtime,	\
 						   SNDRV_PCM_HW_PARAM_##NAME,\
-						   soc_dai->name);	\
+						   soc_dai->symmetric_##name);	\
 		if (ret < 0) {						\
 			dev_err(soc_dai->dev,				\
 				"ASoC: Unable to apply %s constraint: %d\n",\
@@ -510,9 +510,11 @@ static int soc_pcm_params_symmetry(struct snd_pcm_substream *substream,
 	if (symmetry)							\
 		for_each_rtd_cpu_dais(rtd, i, cpu_dai)			\
 			if (!snd_soc_dai_is_dummy(cpu_dai) &&		\
-			    cpu_dai->xxx && cpu_dai->xxx != d.xxx) {	\
+			    cpu_dai->symmetric_##xxx &&			\
+			    cpu_dai->symmetric_##xxx != d.symmetric_##xxx) { \
 				dev_err(rtd->dev, "ASoC: unmatched %s symmetry: %s:%d - %s:%d\n", \
-					#xxx, cpu_dai->name, cpu_dai->xxx, d.name, d.xxx); \
+					#xxx, cpu_dai->name, cpu_dai->symmetric_##xxx, \
+					d.name, d.symmetric_##xxx);	\
 				return -EINVAL;				\
 			}
 
@@ -783,8 +785,7 @@ static int soc_pcm_clean(struct snd_soc_pcm_runtime *rtd,
 
 		/* Make sure DAI parameters cleared if the DAI becomes inactive */
 		for_each_rtd_dais(rtd, i, dai) {
-			if (snd_soc_dai_active(dai) == 0 &&
-			    (dai->rate || dai->channels || dai->sample_bits))
+			if (snd_soc_dai_active(dai) == 0)
 				soc_pcm_set_dai_params(dai, NULL);
 		}
 	}
-- 
2.43.0

