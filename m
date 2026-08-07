Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010071.outbound.protection.outlook.com [52.101.229.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEC4325B08B
	for <linux-sound@vger.kernel.org>; Fri,  7 Aug 2026 00:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786064209; cv=fail; b=lDXUlcK8QnsdOoO4ZIHcFUg3oZDLs+2wlrFAq2qFHF7NJK1Ht0IdduWz/Kai82xGAZqZ0P2EmOWW6/hxqzi3T8lfepQyfPxZQ0zpGb0ZU97kVSQw4nxmG/3LYDxMZINeio611nd5t7zcRQkDPlgbLfjCAO4qCI9OFzB1LKuAPi4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786064209; c=relaxed/simple;
	bh=cnaUI15gS6auaspeeoeg3o2vW2v4hLIz1zqnjQRcfNo=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=YUxyrGjvZ4zaDTFURwWf7Ghwx81036qnW2jYih+179aP12+HxHbMorlF+n4noocLnqCPvFWAG5pigvkIg0/nbv12TvN7lZecjOG/7/qFKIDZ8/U8dX0Nm74JasYLuQdaKSlR4GoGaVez7O3HhznrrYJm/quj2eVfvx+NBU4PD2w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=cox+jH56; arc=fail smtp.client-ip=52.101.229.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="cox+jH56"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JRS/xYArENDY/FupIeSNrmYYvCPawGikIdU4QKVC8pEzhvmoURV2G0Iv9F+N6EZMibRkRcZvX7SePRTUx0ll6ma9WrE3yPpyPK4oinAm6jSOukLggt9FT7THORUxZTbY2CQMUt12QX8HunBt16lZ6lf5aqAG+zJV+vNYMKcPRuG7HHacNA7DdHati4VEnmC0mpmbCXVREvEF/ELvrx0qKnLMNCxXQILO4niKlEEXpI0CdjEwRccg00kDZx3ll50BWlbVQAFATBh/YAmn6l7xUu08KX5v52VOAJY6CtRp6VwzChEdIcnBOnwJTiaQXCIbsfOHwmjzPmtnyHrcnHFHqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tjhml488qTaEGZnI8hHxLEEIU3jetXToJJ4ND3clAPg=;
 b=aCI2rRCYukTmaX1M0BGt0MgsfscX8pqJnh7oouBfLSS9H2LAmcwtwlAgTt8vs6IDhRDcewCPhWXJvP85GMRzS4GZZpRKOMezOtS8xFw/2kYFG4XcLDvxMikKkPWjTLvAiVaAOiLQOfBkf9fsrhTjlyyayoEILmVHnHp3CR3Iuc8stLkJht4/jfb00rNthMvjDsSDJ0iig1vriNeLztvWjJ3ApZNEtlOAjgKhQbQEHMsHDca3vLCC/ByDJ+etGATiIRqAcsPbnNEsmGUQZ4SluT/zxKBJaMO0Ez89rNuYWj5DJ+/uS+Qw32u0/BPbFiYtUqTBbxBkD4V05jUrgjtkQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tjhml488qTaEGZnI8hHxLEEIU3jetXToJJ4ND3clAPg=;
 b=cox+jH561ngjWks8cKNMAIIYo1zMF1cZxP87qhcOd3l5u5jJCKLS/DTk+dLHcoGsE8PJATCD0S0f1etz6/EAycC4clvRoE0TcTtSys5fZTNpvGwync5dDsTC2jMlMgxwOSjE7bqOj8cJQ6zzXMZT5+2bO4lrSfQRnkXGNh7gklQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYCPR01MB6638.jpnprd01.prod.outlook.com (2603:1096:400:9b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.23; Fri, 7 Aug
 2026 00:56:45 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0292.022; Fri, 7 Aug 2026
 00:56:45 +0000
Message-ID: <87pkzusq7m.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Baojun Xu <baojun.xu@ti.com>, Jaroslav Kysela <perex@perex.cz>, Kevin
 Cernekee <cernekee@chromium.org>, Kevin Lu <kevin-lu@ti.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Sen Wang
 <sen@ti.com>, Shenghao Ding <shenghao-ding@ti.com>, Takashi Iwai
 <tiwai@suse.com>, =?ISO-8859-1?Q?=22Uwe_Kleine-K=C3=B6nig_=28The_Capable_?=
 =?ISO-8859-1?Q?Hub=29=22?= <u.kleine-koenig@baylibre.com>
Cc: linux-sound@vger.kernel.org
Subject: [PATCH v2 37/44] ASoC: codecs: tas*: use .auto_selectable_formats
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
In-Reply-To: <877bm2vjjn.wl-kuninori.morimoto.gx@renesas.com>
References: <877bm2vjjn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 7 Aug 2026 00:56:45 +0000
X-ClientProxiedBy: TYCP286CA0325.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3b7::8) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYCPR01MB6638:EE_
X-MS-Office365-Filtering-Correlation-Id: 5996a96a-dcc2-410e-15c4-08def41ec0e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|23010399003|366016|1800799024|921020|38350700014|10067099003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	fCCWaEfqa0M37cNMbf/eKatEv9wvJZKS2tDhGZTjd6kb8AUzaZBuJ38E8Eqq7SGKl7/qxlBHBKXz8iwJlMyqwUarPXhdVUqSGZ7XNCtESIMnIOe3arWkDbhrUlWotXLuq4lLiKIYDwTKycnhzhxgMEwXCUij0883QexP1OenmS2RncI/LHY/dL75O28/+4uKBlOZ/8VyRaOLCBAZEkJkloVEwfHzBf8saGYAcc9k/ODdg+4aGbtyD6VRsCS00fA8jA6TLVcxQBlxux0HV7D7s9X3KZqFPs3IfQYDTFbDtQz0+6/ApuDRpnvFpfOelQiwoO+MZVhqVgUGaoLFPB3oULGd5fjOq1YheHMNpoKWXXnUOQaAnhhrOK5mn/EIrFtrwrQGQ4V21f4ea5DF3g/eRieloqfATyjGbmdjFJ/5VRr/28MIaANCC57x+6SXmDh7qayVRzKPpGj98arwa4WqcJOqwByCir6mcgjXDB3WoUyHUMvgOXc5m5BLsMyHzyw23DaJUmCmOoCg64889XN7058KzAzjOWAh56k5rHcz+U0ta8Q0P2WGuHTh2mTVSwDQ1gR0UiiN9wRirClzTE0cwH6DpoRQrbKKY9Ow/VHDyuc5ERxoGoCKUFE49P3OmNZ6T0E+rTgU4tfCgJ/Z7hJ3B38oOq9UCZgDQeyn40l54Ah3Esmqvzg0AQFv6Ti2UqFGxePoEfHlTghkF+51JoxOO2yX1TYvh06EZJCbKy4fS6M=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(23010399003)(366016)(1800799024)(921020)(38350700014)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VYkn0Y7vaOV4owF5hg8X9TXankb1lv1i2rnURelRbOoaBhGYdSVKVOiNeqiZ?=
 =?us-ascii?Q?RAqVkeAsi7UW8hWZ1IoUI0QV1+Ox9Va5XzWF0g6IPl4IrE8OSilaz+rCfttL?=
 =?us-ascii?Q?UW4c0QPWxfHB+FdQ+06Wg+ZAKLDAY746tPFx35yDPjve8aCi5gWHmzLG2Vl8?=
 =?us-ascii?Q?HWXQhe8wEMTiZDg/MzWmXS5bPqywgIF6AB/OYYAVtH0VtRLvFol+k/9uw9In?=
 =?us-ascii?Q?UNFNusdUayMBPNOGZcQTAWAC4UfR+j6/cbyoOlBazk4SJ2OTiocFD1XGvd4s?=
 =?us-ascii?Q?Si/dYTANJye80f/ZuBxNflgiuKbhikvqT3lARsVZ6tos1hT6B+73TWmZH13S?=
 =?us-ascii?Q?bow85S1wyx0meJFJQ6TD9WxIzyUTZYb8Zs93EyotlGBF6yEvTQef2TPoAyyc?=
 =?us-ascii?Q?dfmVHIfMWlArCs4WDgUCgYT1z5qRr4k9u0YENtDw8JSEWZRFSyuM4E2AQ+1C?=
 =?us-ascii?Q?MAkWWS2f6kkMBJgzQjBtsXe8Kq/o1wj6eVJOsREOEPoEFoweLvlyqVZRi1/z?=
 =?us-ascii?Q?4SlrgPBpIaYcJfWf9zPNujjzDbihChcNF0gjMq3xqFTSIc5Ya9a3xduPB4ic?=
 =?us-ascii?Q?CGgplqKta2Zg7CDYV0P6RNx48NM/eHfMUgzaSEFmS+hIvD/+bJQBvrcPPuvc?=
 =?us-ascii?Q?btNYoV+maCBHwCSFZhcFxk70ADlM8niBjiwgOW2doXTGh5F2v92p+zIJSPtD?=
 =?us-ascii?Q?Zm/kfnefQ+lo0REAdnWLKSVvgTb4DeISW0PKBv1sPNSaB7QGT6NxymWfzjzm?=
 =?us-ascii?Q?dEZMk4Y7+aeb98/SKq96OQBx1zjsSicZPGrT095uLXwFQEGXcfuS5N3AZbT5?=
 =?us-ascii?Q?wQtvjnPXWIx9tQQduTUMh/DXG0qbIxarxR206LVt4u4MPKQOejaKQwm9bmiH?=
 =?us-ascii?Q?vJPRx3tsP6roTi29hEeaXZAg9XdUZgwdOmgoK+HGePTh4rlBV5EwDu/WJAL2?=
 =?us-ascii?Q?XFGAKSZvExv6jc74rD7wmXKHBbeVBiEQf+9Yy529lVvB4j+0WT7VPL4PK40T?=
 =?us-ascii?Q?ZDlH3RUhW2XwmBfrO7M/6Qv2nW2trvEyxzu8upa9Wombfwbr9vIPSriRcqJe?=
 =?us-ascii?Q?VpQy1hMmtWNxKM304J7+zbroejITmrvbFwrghemB2WShDhuNUBPtgi/TxrKe?=
 =?us-ascii?Q?6bz1ujKCycrYsv+kmKBRBXjI5NEHLJCfYuY51YEMryswktifJz2BLVCBmeV+?=
 =?us-ascii?Q?hdTOf0J7ed/1nd+Cbn6LEUh2HCi4OJzhGqbCirtQHFs9mRyQi7paq/fNwYyN?=
 =?us-ascii?Q?51EF7KIX4ygqJD7G0rYkbsgQXHm6I7FzBOYUo/lB9G9wE7elDuiVWZdVlIR1?=
 =?us-ascii?Q?rNZIATGSLuB8uVJqH5Bj1wkXjJ3Jc3EPKzCUTZDl/6uYeNOjkFVMzv8rIYX9?=
 =?us-ascii?Q?rFhm7V9G8Y05aDGcrgCHC4iFlLd8tr0tnKR/T7huU0yz2/16ysEX2hGrDWVX?=
 =?us-ascii?Q?5yCqn9WaNYB/4xb3DQsqzNV+x+ZHtHQcH7BXlv3pH9KvF7jQARTp2On5aKVv?=
 =?us-ascii?Q?kuZDokjPuOUT9dc2isswIfCavZ5OCmMoj41paZ6Ys7FYdUcgXzouIWvEtDEA?=
 =?us-ascii?Q?XlKKkNOCk2h6di6gxu0JRnM7TUXlRcGXS3AUbo7xIcGGo5tM8K8nAN7NYkQD?=
 =?us-ascii?Q?TG9uUSJ8k7LgafU2tWbvii3a2LZrxRCwpEgY47m8AjU54+v9o6rwmUwj8OBs?=
 =?us-ascii?Q?LkDnS+D7zYIG6+HHy6wFp1D3mySchgz4LZEsqftqgJPMi4hHsChz7XgPJdh8?=
 =?us-ascii?Q?d0fRJD04Y6FoDihAMh8UYAS9MJlchWY=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5996a96a-dcc2-410e-15c4-08def41ec0e3
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 00:56:45.6503
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EgRYm55TV9qs+IoNtP/++yqQVnCK0E4cTCdW7EfHF8Lvia5d0pvpHTvP4crEvse5AzlUWJbz3E24vbzTk+LUcGtUgsxRb4wqPYWg/M8tjYA03/rtpVPEixBlc91cQxBP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6638

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/tas2552.c | 14 ++++++++++++++
 sound/soc/codecs/tas2562.c | 10 ++++++++++
 sound/soc/codecs/tas2764.c | 12 ++++++++++++
 sound/soc/codecs/tas2770.c | 12 ++++++++++++
 sound/soc/codecs/tas2780.c | 10 ++++++++++
 sound/soc/codecs/tas5086.c |  7 +++++++
 sound/soc/codecs/tas571x.c |  7 +++++++
 sound/soc/codecs/tas5720.c |  9 +++++++++
 sound/soc/codecs/tas6424.c |  9 +++++++++
 9 files changed, 90 insertions(+)

diff --git a/sound/soc/codecs/tas2552.c b/sound/soc/codecs/tas2552.c
index 22f93e29454fe..5602fd2fb8399 100644
--- a/sound/soc/codecs/tas2552.c
+++ b/sound/soc/codecs/tas2552.c
@@ -518,6 +518,18 @@ static const struct dev_pm_ops tas2552_pm = {
 	RUNTIME_PM_OPS(tas2552_runtime_suspend, tas2552_runtime_resume, NULL)
 };
 
+static const u64 tas2552_selectable_formats[] = {
+	/* Hi Priority */
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF,
+	/* Low Priority */
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF,
+};
+
 static const struct snd_soc_dai_ops tas2552_speaker_dai_ops = {
 	.hw_params	= tas2552_hw_params,
 	.prepare	= tas2552_prepare,
@@ -525,6 +537,8 @@ static const struct snd_soc_dai_ops tas2552_speaker_dai_ops = {
 	.set_fmt	= tas2552_set_dai_fmt,
 	.set_tdm_slot	= tas2552_set_dai_tdm_slot,
 	.mute_stream	= tas2552_mute,
+	.auto_selectable_formats	= tas2552_selectable_formats,
+	.num_auto_selectable_formats	= ARRAY_SIZE(tas2552_selectable_formats),
 	.no_capture_mute = 1,
 };
 
diff --git a/sound/soc/codecs/tas2562.c b/sound/soc/codecs/tas2562.c
index e1d62f30418ac..b765d2a340f88 100644
--- a/sound/soc/codecs/tas2562.c
+++ b/sound/soc/codecs/tas2562.c
@@ -588,11 +588,21 @@ static const struct snd_soc_component_driver soc_component_dev_tas2562 = {
 	.endianness		= 1,
 };
 
+static const u64 tas2562_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF;
+
 static const struct snd_soc_dai_ops tas2562_speaker_dai_ops = {
 	.hw_params	= tas2562_hw_params,
 	.set_fmt	= tas2562_set_dai_fmt,
 	.set_tdm_slot	= tas2562_set_dai_tdm_slot,
 	.mute_stream	= tas2562_mute,
+	.auto_selectable_formats	= &tas2562_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 	.no_capture_mute = 1,
 };
 
diff --git a/sound/soc/codecs/tas2764.c b/sound/soc/codecs/tas2764.c
index b11b998aa32a6..37aa17be32004 100644
--- a/sound/soc/codecs/tas2764.c
+++ b/sound/soc/codecs/tas2764.c
@@ -602,6 +602,16 @@ static int tas2764_set_bclk_ratio(struct snd_soc_dai *dai, unsigned int ratio)
 	return tas2764_write_sdout_idle_mask(tas2764, tas2764->idle_slot_config.tx_mask);
 }
 
+static const u64 tas2764_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops tas2764_dai_ops = {
 	.mute_stream = tas2764_mute,
 	.hw_params  = tas2764_hw_params,
@@ -609,6 +619,8 @@ static const struct snd_soc_dai_ops tas2764_dai_ops = {
 	.set_bclk_ratio = tas2764_set_bclk_ratio,
 	.set_tdm_slot = tas2764_set_dai_tdm_slot,
 	.set_tdm_idle = tas2764_set_dai_tdm_idle,
+	.auto_selectable_formats	= &tas2764_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 	.no_capture_mute = 1,
 };
 
diff --git a/sound/soc/codecs/tas2770.c b/sound/soc/codecs/tas2770.c
index e79754edac5ca..59912ed9f4a5f 100644
--- a/sound/soc/codecs/tas2770.c
+++ b/sound/soc/codecs/tas2770.c
@@ -566,12 +566,24 @@ static int tas2770_set_dai_tdm_idle(struct snd_soc_dai *dai,
 	return 0;
 }
 
+static const u64 tas2770_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops tas2770_dai_ops = {
 	.mute_stream = tas2770_mute,
 	.hw_params  = tas2770_hw_params,
 	.set_fmt    = tas2770_set_fmt,
 	.set_tdm_slot = tas2770_set_dai_tdm_slot,
 	.set_tdm_idle = tas2770_set_dai_tdm_idle,
+	.auto_selectable_formats	= &tas2770_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 	.no_capture_mute = 1,
 };
 
diff --git a/sound/soc/codecs/tas2780.c b/sound/soc/codecs/tas2780.c
index 1ec1c076204fb..8f869cf0a187c 100644
--- a/sound/soc/codecs/tas2780.c
+++ b/sound/soc/codecs/tas2780.c
@@ -441,11 +441,21 @@ static int tas2780_set_dai_tdm_slot(struct snd_soc_dai *dai,
 	return ret;
 }
 
+static const u64 tas2780_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF;
+
 static const struct snd_soc_dai_ops tas2780_dai_ops = {
 	.mute_stream = tas2780_mute,
 	.hw_params  = tas2780_hw_params,
 	.set_fmt    = tas2780_set_fmt,
 	.set_tdm_slot = tas2780_set_dai_tdm_slot,
+	.auto_selectable_formats	= &tas2780_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 	.no_capture_mute = 1,
 };
 
diff --git a/sound/soc/codecs/tas5086.c b/sound/soc/codecs/tas5086.c
index 4d1c122c8f04f..1ab82ef1c41d2 100644
--- a/sound/soc/codecs/tas5086.c
+++ b/sound/soc/codecs/tas5086.c
@@ -743,11 +743,18 @@ static const struct snd_soc_dapm_route tas5086_dapm_routes[] = {
 
 };
 
+static const u64 tas5086_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J;
+
 static const struct snd_soc_dai_ops tas5086_dai_ops = {
 	.hw_params	= tas5086_hw_params,
 	.set_sysclk	= tas5086_set_dai_sysclk,
 	.set_fmt	= tas5086_set_dai_fmt,
 	.mute_stream	= tas5086_mute_stream,
+	.auto_selectable_formats	= &tas5086_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver tas5086_dai = {
diff --git a/sound/soc/codecs/tas571x.c b/sound/soc/codecs/tas571x.c
index 8b5f9accf1207..5e2560347461c 100644
--- a/sound/soc/codecs/tas571x.c
+++ b/sound/soc/codecs/tas571x.c
@@ -352,10 +352,17 @@ static int tas571x_set_bias_level(struct snd_soc_component *component,
 	return 0;
 }
 
+static const u64 tas571x_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J;
+
 static const struct snd_soc_dai_ops tas571x_dai_ops = {
 	.set_fmt	= tas571x_set_dai_fmt,
 	.hw_params	= tas571x_hw_params,
 	.mute_stream	= tas571x_mute,
+	.auto_selectable_formats	= &tas571x_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 	.no_capture_mute = 1,
 };
 
diff --git a/sound/soc/codecs/tas5720.c b/sound/soc/codecs/tas5720.c
index 0bbcfaadf3f2a..2539a097e743a 100644
--- a/sound/soc/codecs/tas5720.c
+++ b/sound/soc/codecs/tas5720.c
@@ -682,11 +682,20 @@ static const struct snd_soc_component_driver soc_component_dev_tas5722 = {
 #define TAS5720_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S18_3LE |\
 			 SNDRV_PCM_FMTBIT_S20_3LE | SNDRV_PCM_FMTBIT_S24_LE)
 
+static const u64 tas5720_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF;
+
 static const struct snd_soc_dai_ops tas5720_speaker_dai_ops = {
 	.hw_params	= tas5720_hw_params,
 	.set_fmt	= tas5720_set_dai_fmt,
 	.set_tdm_slot	= tas5720_set_dai_tdm_slot,
 	.mute_stream	= tas5720_mute,
+	.auto_selectable_formats	= &tas5720_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 	.no_capture_mute = 1,
 };
 
diff --git a/sound/soc/codecs/tas6424.c b/sound/soc/codecs/tas6424.c
index f5d50f8a1cfb9..2718183e864c3 100644
--- a/sound/soc/codecs/tas6424.c
+++ b/sound/soc/codecs/tas6424.c
@@ -378,11 +378,20 @@ static const struct snd_soc_component_driver soc_codec_dev_tas6424 = {
 	.endianness		= 1,
 };
 
+static const u64 tas6424_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF;
+
 static const struct snd_soc_dai_ops tas6424_speaker_dai_ops = {
 	.hw_params	= tas6424_hw_params,
 	.set_fmt	= tas6424_set_dai_fmt,
 	.set_tdm_slot	= tas6424_set_dai_tdm_slot,
 	.mute_stream	= tas6424_mute,
+	.auto_selectable_formats	= &tas6424_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 	.no_capture_mute = 1,
 };
 
-- 
2.53.0

