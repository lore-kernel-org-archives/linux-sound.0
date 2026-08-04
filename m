Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011045.outbound.protection.outlook.com [52.101.125.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8DA038238C
	for <linux-sound@vger.kernel.org>; Tue,  4 Aug 2026 00:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785804224; cv=fail; b=QRMZG4Z+Iw9ktsKxFaLMl2kiV8WlyAMi7NkEPnm30cG7q1wh+5dDlWo4N5lZquRKutoos9Uz9uhIZewA63twiVV9OZEyMc6hJ2VtFM8iY+7R/nyAHu/k+MyPi+1J9oIQBM5Xce381CEoDYI3lCSHNFStB2JfBnksLsV2RVvdE3U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785804224; c=relaxed/simple;
	bh=cnaUI15gS6auaspeeoeg3o2vW2v4hLIz1zqnjQRcfNo=;
	h=Message-ID:To:Cc:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=ROQldDwqAgtVZCY6HaJs+MCV15Lfp3saFsHT4U2c9+1bTmYCpoip1k+kTya907o0iVR1B7MAkFWqkTuHbf/72iNLjgA1AqtwYLU6TJeYpkt469UifWk/uVTgsPuZ+QnZZavcylKlCodRtOuhP01R2uE7s9+rUt0Pf4DmPpNCuWQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=XHd6Rp4x; arc=fail smtp.client-ip=52.101.125.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="XHd6Rp4x"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XnHO0d6bTe0OSEkAhrWJd1mi4ZvrZqxCiec3o2GHSwJDEZg4TVvuGGi/xM9REa7TAI/2bYqV8+3ABLtcQ1nE3lB5iP7uP/oCty9vkTfNv7asDpQcV5Yuz2RNdJ1hgMM62oj0w4ZlUfFLKqG64nceanRywG9RHOqAZB/hcHE+2I9ikiSUrrKane0QqarJEpNLsa7YNOiQJS7CblQ2mdt6SvKUM++uNWztM4rlZ1OwqoRVSi5im0rFd4ogbRI1hObt++ryY2k7m6+upkrhCwa8XWETMQfkaBBr9ZAOw8kz8k4lHV2wnPx4DCP7dA1d0PdTaDBcSt3B1K7j3AK/3+j1rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tjhml488qTaEGZnI8hHxLEEIU3jetXToJJ4ND3clAPg=;
 b=bKHhoMc2p2f2bmeiuFz8nQCepSr3jFxVnkTGEnI/cqXegJDtkjE4NBwnk9zJD94bFn4CNNJGLz+lCk6dYrRynZKPkQwJ/uRBO2gnhnHRQIaWhP+Xr2FXui3givB1nkWbbf156aTOuDShjW6Nx1yPZtQzqSIBFCiHkIhs5amgIGzBZgBOBAHgMN13Ab7+/D/extq5dPmsRJO7kN7nnKVW2Vi6HMIrKjqDkAg1aftdK+jZHMxXj2M2fs+bmRXvcmGaA1ePRgEMydZGYzwRvVY/fQbJvkki3r9IML43JBC9/9NdpfWIDdF1/WxW2s3krvC1UQqZieH3fvHKXZ9TU85bGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tjhml488qTaEGZnI8hHxLEEIU3jetXToJJ4ND3clAPg=;
 b=XHd6Rp4xHKe42GSy/FUZIHnuvUC0+AlMqc5USbQ6h/5hxT+z31IE2WyVbyemmrkAaKuqoyZE8tU/LPeC/mpIH/2eXqYfSKeQ53Rgo8GLJy55tWAQu/XfN9kuZjrehAaG8TkEe8VMMUaPkgEUL4MAeFqpMh5V5PqjyAddAu9BGVY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYCPR01MB18293.jpnprd01.prod.outlook.com (2603:1096:405:3ef::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Tue, 4 Aug
 2026 00:43:41 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0270.017; Tue, 4 Aug 2026
 00:43:40 +0000
Message-ID: <87v79qvhoj.wl-kuninori.morimoto.gx@renesas.com>
To: Baojun Xu <baojun.xu@ti.com>, Jaroslav Kysela <perex@perex.cz>, Kevin
 Cernekee <cernekee@chromium.org>, Kevin Lu <kevin-lu@ti.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Sen Wang
 <sen@ti.com>, Shenghao Ding <shenghao-ding@ti.com>, Takashi Iwai
 <tiwai@suse.com>, =?ISO-8859-1?Q?=22Uwe_Kleine-K=F6nig_=28The_Capable_Hub?=
 =?ISO-8859-1?Q?=29=22?= <u.kleine-koenig@baylibre.com>
Cc: linux-sound@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 37/44] ASoC: codecs: tas*: use .auto_selectable_formats
In-Reply-To: <87cxvyyazi.wl-kuninori.morimoto.gx@renesas.com>
References: <87cxvyyazi.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 4 Aug 2026 00:43:40 +0000
X-ClientProxiedBy: TYCP286CA0049.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b5::7) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYCPR01MB18293:EE_
X-MS-Office365-Filtering-Correlation-Id: 264f03cf-287a-485d-9fe4-08def1c16dd3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|52116014|376014|7416014|1800799024|366016|38350700014|921020|56012099006|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	k9Vn8CRnGh4+FKhQPGa4jD8QmF4KV7WGejo2tvRBSg/J12QsvXoAZzDD0yI9BWZJdt9Hqq1Lgmc8BbXEa3BX9LnTH/mJe6/zkDMGIw5vigBxcG4vk8PX05rGGUVqzfA7IsIs1aDSZjz3y8+qDtaT1RYJErb39pJdcRjplk8fvuNCnan51VUWAZTMSW1mYKYS48lMS3NaUm0YnllaSwxrbr8vrkGJRK+sck2GL5B+AFbQWkO/cBss31a23HCB3v35pePYQSVVJbAHrbSnNLbh1opXVTurM8Wldq/xUeyVVAQaJxH/qRDPXmnZMWbFLCn88qwgb5W2hLCHVvF0mTZbkqrsU4Yxiz7NnF4SKlA62cop7hEl1yMtQeD3jjHDX3eETXSyMMw89HAst2Kr0GIGu5/q/SxhjISCt+Q6rGOteS6QVVwh3DtWRB4f/zhDMWbLhZuZ+mlNb8qX8OBa9YFvkrslAv4j4qa49N/2nYqMh43Ot112dI69xI4HAf7pzdL+VqedJEe/fHJDz4sNzl1zGiOTnZ6Q4mJvmluTAh+Ib+gUugnMXg9+bYDU9Bg7CeXIBGKEYww+Pr8tJXhS2k9ID5+VGDmu46/5PX97+OOuNFkc1AXZoBldGFW7nGs2mrwG/ZLPKz0ksRlqqXPhD6eKsdwLyzdE3vY4gJq6FF7s2H9cwNwOHGb3MbW2unGlzXqg3AkpfUiRE2AO3ctaC5lqWR09tiZHH8W5N7XG7Z72pDA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(52116014)(376014)(7416014)(1800799024)(366016)(38350700014)(921020)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?AJKaH/viErOl1P5IIs0RU+AScbGgmwptbETcXS14U4RU7PO24BvebcjOnQS1?=
 =?us-ascii?Q?amdTkQ/4SSBBSXCx20GOVVIME+RvL8xSPCjh0qM2DFuP40JE2w/WIzqjUbTC?=
 =?us-ascii?Q?fP69iukVUebeNg8eUH4l+UkLDyP/JiG1a8BJEUnWcvob/ThF8y+rgHkqaIPE?=
 =?us-ascii?Q?Yw9BWqJ5qn+SWslKXlGaeoWzVcwiPQ73AvgpzF28W1l25FnocFFk5AEdo/SI?=
 =?us-ascii?Q?80A5Nz/M+66UZ8sWtWrxQryMVwHaH0o0Wg6zpz8c/Lgc9l5yVoXnqf0v2AJX?=
 =?us-ascii?Q?dFn5q3mPqN33Bj7CbNhI3mCgPgoeayfJd/3OLDKqnrjNbjv4ukdG6iy0M5pI?=
 =?us-ascii?Q?CrTQfZ9VemkQLQQp4nOXfqciWDhramt3Fs/DHDhmxP86YPECp/LuRbRFWM0X?=
 =?us-ascii?Q?c1XThkJbYaUG/ag+9Fyh4sV7LOQO2PTe24ysfFUBNCywLqSfBTj/yMaLAltY?=
 =?us-ascii?Q?6vGkmrCe6yF4M9wIz+xNrr+cWmY5s7KYPZBci0WlM6Q2WJLYjN/jlfvU2knP?=
 =?us-ascii?Q?fPdGfXZt3kSPuWedVAV4lfuCf6mPmyd32eXgNZq3o2GJ7qn925A1daYmsQGl?=
 =?us-ascii?Q?iqBOC7kA6syWOzoUnVpiNQWyhNxkh1MvLHlsPRoUYZXellyyA+qvDpBHZcft?=
 =?us-ascii?Q?azftl/94T4ct+B6wIkzWNRHAmdsvHKy4Qp3fWsTq9sge7ayTpXAbJql1YbeT?=
 =?us-ascii?Q?byAEdSq7Aw1dfC6y8YV6Dp01p0wDz43JOIzHYLo9sthAcUjYO2zf/bWNJF6n?=
 =?us-ascii?Q?mn1JVCRJdd86ECm6Umj/RmZGxEqltaog3EJdQG4sFv4WDGUFmMFUGTxY2Kdy?=
 =?us-ascii?Q?7lemD5ICMnqF6C0G3ykQex6+7TPxVy6tnY6kvSbSwMTROWQTWUgSwKTJpJ/3?=
 =?us-ascii?Q?g5r3F6PA6Jby0hUJOJiAEMVw4qG+ovZkfheuaQ5eeXqm2ZdS2qdEh225i6Py?=
 =?us-ascii?Q?gLgI1O/QBCDvNupzT4roW/10YOKgzEftz3BuUmvqaI3qvnIs59U48AhJLoxl?=
 =?us-ascii?Q?YdCA0mmBYadXO6PPdA4txnfXSqDihVpPX5dOd19ryGoPoq7cTWEFISAQs69Z?=
 =?us-ascii?Q?uh/EyMZnFOwIITkXLTaCWUdtBMYIPE7FFBsPqnlJfVnEP7Z6Q39Q8daotTKb?=
 =?us-ascii?Q?6/hUuSnUah2UtCog/DNLcxCN4UNz4/mTcsKUVVtaBEX1QQaHR0Zy0RQQ+5gB?=
 =?us-ascii?Q?vg+BQItfLEOFsyNNPr/Mr6/vsSGq2s8tc7FxM8Uajfg+/xB01SkbfZzQzlvf?=
 =?us-ascii?Q?ni/++UTNsowruFcQ6I4N4vKbTXIQ0OmO1bEVpqYVU0jA8aUbMPRTwoCLXqFK?=
 =?us-ascii?Q?e8gHNp6cxayhmUfEqRm7t9cJ+0SpZnUdRp/JE0+X8+xyUn1c9HKYZ+4NBamO?=
 =?us-ascii?Q?VUlHHzRocHDla5dBpLWvQUTYaZEX57wNwG6D/3JC0LgsZ8jADtCACZY335AS?=
 =?us-ascii?Q?Bd5aYYRWXNa9F+9Kjl40IP1v4FMp8D1lCMfg286o9oRqcAPHBu20Sy3LjxPz?=
 =?us-ascii?Q?hEqd6fFOmjB5FsuW/QEcfkXrfpfPRTxXUVAh4Yol1nzGkOQFfo4XjpngxgRw?=
 =?us-ascii?Q?j0v7UfIGUzQ75L2ZiUxY1dn7HUyHLc+mGXCwq7DyndxSbNbzM9zOmj2OtkFi?=
 =?us-ascii?Q?r0DQMNY/4ot/nxR+yG/yOPIZQz0KROoTdtKQNz6EdMGxHTFub1ZROk4cW3XG?=
 =?us-ascii?Q?VunkZauci/27Q0JsWdCNiT88FPWHzOjSJn1El0X27Sz1DQ23gjiUDK0bcZCm?=
 =?us-ascii?Q?h/pd+VNOXfDCmQdmyc18gSJJqUFWqXg=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 264f03cf-287a-485d-9fe4-08def1c16dd3
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 00:43:40.8386
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RKm9o3sKjjK738DT7Q8GrXEYi0mA4KfR/XA9zY4ZQcKBG0uV4w4KouwbmFwOD77wKRmAL6tPZ9uGG6x04eTRo70B4IyfQnuEPIFbdt2ipsL7M7vx8dJSogKqDl+99xHR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB18293

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

