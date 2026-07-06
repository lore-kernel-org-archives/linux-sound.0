Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011027.outbound.protection.outlook.com [52.101.125.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D48135FF58
	for <linux-sound@vger.kernel.org>; Mon,  6 Jul 2026 02:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783304322; cv=fail; b=TXfMFa3IIlKhYUQAgdO3k3jCWyVtA32P566l/JKSxevCnw6+imbnMsK+jgLI+koYpVs5uMjJwU/ikL/cujOuoCu8juoPzRi2lQ6Fn4iXbuH5wQ3eATKzkvkfkKVq6p76TwbOzxCH5A5iPgcTHlQiJFwaJamNgfBpk/FcqJoy9uo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783304322; c=relaxed/simple;
	bh=VVDk5aMV59YJ0F/NavUxEcMD30laF5H1Eg0x2c1rPwE=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=iL80pN3hl1eN73s54m2LoZrX7ufHSJx7M8pIP9iNnN935tTYV+hP9InriH+ndcU4Lf0vz77q5+tL8pWD385b2r+qvuhPCgvFaNnweufyF6JauuWgr7l3vYO2qbvR/P1XxekRx2Mivi17Z9kWlTaIg+zJXOw+BjY+R79//iKscrg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Vnzeansv; arc=fail smtp.client-ip=52.101.125.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Vnzeansv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JD+sdHqhxQ74OznJWjB6WA0tvYAjRJlebGhkNslCy7gbmq2rDkNWtbBWlEXm97AEXESMJ1X6IC7HWmO7+Q8FWiirWR+moXZYUWT6sbrJgaSehHG4JOAS8HCAc7cPlhsGlQhrtl/oGU1ArC4/bIKH7xCb2sR1bsoFZba0nCznUbOqqIrzswCmtrLLLSDpz5XXoFuvAqVyYXPOzcmc8rmVe8KhUcZytcfsUyHuZVdes3W8kDSGyohE/KquL8ek/smbSoUuEU0i+t+Xw1v2FC1TIrcGlxErvLXygH+YnCCwdkDdapu8fabJ1bdNInLLsYj6+1RbG97j0E3xv3WQEhgffQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=731Mv5HJurzljhUs0FtmwuNtLshde22nlhJJ6XerzZc=;
 b=gOYGOGlOkdXj+SJASO1Dk0l3zZJkj2mb1Wk2A6XORcyN+B23eYR6/Gv2s6DVU7mzTEZ3T38lI5oZFykAbTqQZHy0F6O60OiYFrT94Gp1NixnhVGll05uHtvMWU2365tjQOrwNsBRl7iWqftL0YR8jYlFRg4gfeuQ5j6wml9j8QafPKMN4//0KAU/8FC7jBbTF19popi7aVAstLiq+5RlcGWesAF5IJSc1iDxtNY5eEhEIL8bcPrjDjeitul36BCIf0O0rzIVC5kX3yJaY8+CC6dFQAOzlk8qEfUqaxjpJFlxeXAmjjyliposV2WYJ9iIYvfDhEqRqXJ4LUpNzr3oHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=731Mv5HJurzljhUs0FtmwuNtLshde22nlhJJ6XerzZc=;
 b=VnzeansvGBFGpkmC6TGllzULfqk5CFgatOn3QsV8NquiawOO1w4ve5mwEGozeaG/2e6X+dzbLih/d9beepdNP0k0hG7rwOJfX7gjV8h0neU0t1/wyvaJnv1IIFgZJ9dYfsuzrozPm2w793pCXClbA+EI6z0KzuGs994vx0Oi1nA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYCPR01MB6963.jpnprd01.prod.outlook.com (2603:1096:400:ba::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.13; Mon, 6 Jul
 2026 02:18:39 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0181.010; Mon, 6 Jul 2026
 02:18:39 +0000
Message-ID: <87cxx0c135.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH resend v2 2/4] ASoC: codecs: pcm*: use .auto_selectable_formats
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Kirill Marinushkin <k.marinushkin@gmail.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
In-Reply-To: <87fr1wc13y.wl-kuninori.morimoto.gx@renesas.com>
References: <87fr1wc13y.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 6 Jul 2026 02:18:39 +0000
X-ClientProxiedBy: TYCP286CA0250.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:456::14) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYCPR01MB6963:EE_
X-MS-Office365-Filtering-Correlation-Id: 078e3763-4c8e-4fbc-e1a8-08dedb04e465
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|52116014|366016|1800799024|38350700014|22082099003|18002099003|11063799006|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info:
	0litMfjMpSpql/OVqBpbgf66JI3qq/WwefhaC7cmhvXha/s4r7YzxpKDDFyoK6hzAhSZbK+mAfZds1REPOKTDsl3kVUYgPNsIF+N6/e2hCck7UtTntBT4qDrqraRu98Ybr83BKosEosB195zaUQLJXB79uCUOC3hDGnm6vELeF2Ivs22j15OPdGoES/rv0aWpuP7AJcCSDbLJZpGpU2CdjFY0JxzKdEF51t9cYfl8y8Cvhh6OP3Vz60VxJpIPbuH+tV9BDQzT0CbFv0Fzx1gkjZ+jifF9NnOex2QPklYoaaEE5qrKai6ZnTF/wzK1HbalXHnu4m4D3iV64XeyQv2B4YBtUghO3lFPZrXOjOmAApJAjOdU+NEA/hnIiJV0pxVreXVOX7+IBoJn00m56Nlmpt87Mv40Gq0JxGtP37tD72XfAmw3KCBFcUSTeOlfjRjetfAo/ny3So2st9lp76YhAve/5VMZ6EF6KhLRDhgH7LRwK/3rdnnQvGFYYKaJu0fWiLXl5tVT5ztl7vumzm8rC2DmNst9/Jdg5v9mu/uc9hyMF37lIVmkpc0xpZWM7hlAClf5kP2iBIyt/yU2qNTIcst9DVYFU92MEDYLsWC505MmYpLx1vtOc5qTZcxKWRVw1uRmQVMPXXM0bdzD8qZXnZzQen/p6Uqjn9GBJh2+mRZq6rQCw49hNYqxc2LHWWpF9nPb11xb2VquJWaY6CvxURB5Eyu0Qc7D6Tk2Aq5Lvs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(52116014)(366016)(1800799024)(38350700014)(22082099003)(18002099003)(11063799006)(56012099006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?KX4/e6vx0cdhc11NHwzhgHiTBUEGYk+yLzQCRuCD8ZM6DwGS5N3zmKY2+jrF?=
 =?us-ascii?Q?fh+ba/yX4KH+f7jvs5RHc5bI97Mt0utMBQWnmEb7yqC7aJk+qck8gccSLDgx?=
 =?us-ascii?Q?1ZPJ8K/DuU+XJGgYIulQV4xJHU+ETgmTYjX2P6kHQUHBpPb2FQXVpbLtYiCR?=
 =?us-ascii?Q?MXxJj+0cm2XXpJc10LH9Rcf7MORq739GgnfiGIcrlLEhfktCzQ/iJm8eDgDq?=
 =?us-ascii?Q?I/5Cyytm3igVqjHbFiZ/so0CDfe435rLKnN/HXeaYnipdxpe2pIXEks0QJhq?=
 =?us-ascii?Q?u8FxfriYo7kAVll8EL3p/afwfUC0aDCSM2JgH8B7+ojYh9MTH26QOeNd4a1C?=
 =?us-ascii?Q?qfyP+yG1L5WsAGuEnyzscbZVpCX0krJo9hV6UxYHRWhgTyLyRklwRoZ3iHE6?=
 =?us-ascii?Q?CXKT2JELcRxY+yt7yHtV2VnMEzWsdKv5ss8SUyQNP74BNDBr4nqehf0+5OXw?=
 =?us-ascii?Q?WiAKUdM6RJZwTfVBO+/0tJgiw4OeK0YG27N+sdpz25oEXpYni9AsLuRm9JZX?=
 =?us-ascii?Q?ZLCrgS+tyXRvEdUJiur0UDF9ecPmGBml2EsV9zwQQ2XAqpqb7c4oy2jKCk8P?=
 =?us-ascii?Q?JJ67aVSjXdukIQqJgX+UVMda2dBl1VOLo6l9ZE5rTN6alHY9IvorHRp4fWvE?=
 =?us-ascii?Q?qvkK61gBimXHqgV9g+aUkfqQ88fsPOe0p/tKJacgNYHas6lXMjLXRiibBGmE?=
 =?us-ascii?Q?KWmMUaeKx2crcqawG042Z5WoNGAHXE+pWpEZCKY6G8GczgZJCtbxHFrrdEOU?=
 =?us-ascii?Q?1pOtdlEhoHzOtjJpXFXg06uWBFhgmrl1YktFOjSOXFLgSVIYwnQi4CWaN0UD?=
 =?us-ascii?Q?kedvJmekn8f+CwGFxXbTupwIrPzj/Made4uhf+N7L2934iuiXNiKLwDoNdjx?=
 =?us-ascii?Q?2m9OyMw9ddjZp8r+YN31PI87TbAAbr2ByUIOPFzS2nWUVkdwn5LEw8psKhjj?=
 =?us-ascii?Q?eBBJ59xSYSBh9Wr/Zi0v5JwsbCMqZ227j3ozz7oYS5bzH4EubRoYhKMjKOPm?=
 =?us-ascii?Q?Pxri9B0irNADV1LOZ0uswE6D05ZIey7pYi3arx6udB5BPp6bosd3CX07dcm9?=
 =?us-ascii?Q?lKCZOxmkfDG8+utU9v7kTSrmRp0bFLQTn4CkWv/C8Lknw+Ea87P6SG1IOufX?=
 =?us-ascii?Q?BEbX2EpJWY/La0tOMRDbwA2+h25I/QYV3AAuCP+hdawBwWlHOO2PTe07Wm/p?=
 =?us-ascii?Q?w0OlUpW8GRfzy3pdek+rFy0KW1hTP58sxCBZJmxu7R+LfNey0w4iPCiv6lvH?=
 =?us-ascii?Q?EFlLlMKyg3G65e3INFLBsKBKYtoVV3U/5bKk2bIDO7SuShLj3f/IvPJ1y5Oo?=
 =?us-ascii?Q?SRju1LvGQbMDuH7v+ngeNGr0mgPj5CUiQEbzWl8qLyUdcIZ3wzsQjatiYY/A?=
 =?us-ascii?Q?vL5ZL2okDfwvUbots62ijOUAj7LQfyGKMuQnZDl3F/Icfu/on3GxTw49FRVD?=
 =?us-ascii?Q?uU59lxFZcnQWLxm/ZzcPsdY2Z0Q7WS160oVclPB8jocawTjUxWZqZXGiCIyJ?=
 =?us-ascii?Q?Zil4EGwWFdkVR90GwO26XOELNcOfs8cnDQaCKyhdiSlmVrWvTiiQaR1uZOHf?=
 =?us-ascii?Q?FvDNWhBTJ7CVgugaf4BhfzszB4LL7UQjuZqFhRRA6DbJbqjcRcFGdc/7EfIT?=
 =?us-ascii?Q?o6jOwHFuRq85I1OrOiGofFjnf5Gfb38j6SWY5IyLCFqmFIPC48wiqcK9tTnx?=
 =?us-ascii?Q?/FIYXwh8CTefbY/nx6clOoMHl5+g3rgxw0qktmGy2SQ43ehkrZ+qbPRmVbSz?=
 =?us-ascii?Q?8H1Kg14LDj/Es/3zpjOQrczD7Pfmth9RZAQZWUaS+eYldh9LDukq?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 078e3763-4c8e-4fbc-e1a8-08dedb04e465
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 02:18:39.2945
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JGGZ6QStSbl/1KULxLSgiyrk4U9zqnXm9O1Ru9T9FvPVR6Ifu/PRQA0n7ZLYCteDtXqI3DzLShvFWKHz3UyhiDDgV1XkGVbGhhgGl2+2YbIGo2Dv7ST409NRj47G+sQL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6963

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Kirill Marinushkin <k.marinushkin@gmail.com>
---
 sound/soc/codecs/pcm1681.c | 7 +++++++
 sound/soc/codecs/pcm1754.c | 6 ++++++
 sound/soc/codecs/pcm1789.c | 7 +++++++
 sound/soc/codecs/pcm179x.c | 6 ++++++
 sound/soc/codecs/pcm186x.c | 9 +++++++++
 sound/soc/codecs/pcm3060.c | 8 ++++++++
 sound/soc/codecs/pcm512x.c | 9 +++++++++
 7 files changed, 52 insertions(+)

diff --git a/sound/soc/codecs/pcm1681.c b/sound/soc/codecs/pcm1681.c
index cb923cecb47fc..60fdbe5c4e054 100644
--- a/sound/soc/codecs/pcm1681.c
+++ b/sound/soc/codecs/pcm1681.c
@@ -199,10 +199,17 @@ static int pcm1681_hw_params(struct snd_pcm_substream *substream,
 	return pcm1681_set_deemph(component);
 }
 
+static const u64 pcm1681_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J;
+
 static const struct snd_soc_dai_ops pcm1681_dai_ops = {
 	.set_fmt	= pcm1681_set_dai_fmt,
 	.hw_params	= pcm1681_hw_params,
 	.mute_stream	= pcm1681_mute,
+	.auto_selectable_formats	= &pcm1681_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 	.no_capture_mute = 1,
 };
 
diff --git a/sound/soc/codecs/pcm1754.c b/sound/soc/codecs/pcm1754.c
index b68a528000be8..bb15da1c24aa2 100644
--- a/sound/soc/codecs/pcm1754.c
+++ b/sound/soc/codecs/pcm1754.c
@@ -78,10 +78,16 @@ static int pcm1754_mute_stream(struct snd_soc_dai *dai, int mute, int stream)
 	return 0;
 }
 
+static const u64 pcm1754_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J;
+
 static const struct snd_soc_dai_ops pcm1754_dai_ops = {
 	.set_fmt = pcm1754_set_dai_fmt,
 	.hw_params = pcm1754_hw_params,
 	.mute_stream = pcm1754_mute_stream,
+	.auto_selectable_formats = &pcm1754_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static const struct snd_soc_dai_driver pcm1754_dai = {
diff --git a/sound/soc/codecs/pcm1789.c b/sound/soc/codecs/pcm1789.c
index 3ab381e9a8566..f06e353743aaa 100644
--- a/sound/soc/codecs/pcm1789.c
+++ b/sound/soc/codecs/pcm1789.c
@@ -164,11 +164,18 @@ static int pcm1789_trigger(struct snd_pcm_substream *substream, int cmd,
 	return ret;
 }
 
+static const u64 pcm1789_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J;
+
 static const struct snd_soc_dai_ops pcm1789_dai_ops = {
 	.set_fmt	= pcm1789_set_dai_fmt,
 	.hw_params	= pcm1789_hw_params,
 	.mute_stream	= pcm1789_mute,
 	.trigger	= pcm1789_trigger,
+	.auto_selectable_formats	= &pcm1789_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 	.no_capture_mute = 1,
 };
 
diff --git a/sound/soc/codecs/pcm179x.c b/sound/soc/codecs/pcm179x.c
index f52ff66b6e644..cb70927872aa0 100644
--- a/sound/soc/codecs/pcm179x.c
+++ b/sound/soc/codecs/pcm179x.c
@@ -142,10 +142,16 @@ static int pcm179x_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
+static const u64 pcm179x_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J;
+
 static const struct snd_soc_dai_ops pcm179x_dai_ops = {
 	.set_fmt	= pcm179x_set_dai_fmt,
 	.hw_params	= pcm179x_hw_params,
 	.mute_stream	= pcm179x_mute,
+	.auto_selectable_formats	= &pcm179x_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 	.no_capture_mute = 1,
 };
 
diff --git a/sound/soc/codecs/pcm186x.c b/sound/soc/codecs/pcm186x.c
index 0d1103fe4e04d..461ec74e87521 100644
--- a/sound/soc/codecs/pcm186x.c
+++ b/sound/soc/codecs/pcm186x.c
@@ -473,11 +473,20 @@ static int pcm186x_set_dai_sysclk(struct snd_soc_dai *dai, int clk_id,
 	return 0;
 }
 
+static const u64 pcm186x_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF;
+
 static const struct snd_soc_dai_ops pcm186x_dai_ops = {
 	.set_sysclk = pcm186x_set_dai_sysclk,
 	.set_tdm_slot = pcm186x_set_tdm_slot,
 	.set_fmt = pcm186x_set_fmt,
 	.hw_params = pcm186x_hw_params,
+	.auto_selectable_formats = &pcm186x_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static struct snd_soc_dai_driver pcm1863_dai = {
diff --git a/sound/soc/codecs/pcm3060.c b/sound/soc/codecs/pcm3060.c
index 8974200652e7e..f01c46583e897 100644
--- a/sound/soc/codecs/pcm3060.c
+++ b/sound/soc/codecs/pcm3060.c
@@ -164,10 +164,18 @@ static int pcm3060_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
+static const u64 pcm3060_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF;
+
 static const struct snd_soc_dai_ops pcm3060_dai_ops = {
 	.set_sysclk = pcm3060_set_sysclk,
 	.set_fmt = pcm3060_set_fmt,
 	.hw_params = pcm3060_hw_params,
+	.auto_selectable_formats = &pcm3060_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 #define PCM3060_DAI_RATES_ADC	(SNDRV_PCM_RATE_16000 | SNDRV_PCM_RATE_32000 | \
diff --git a/sound/soc/codecs/pcm512x.c b/sound/soc/codecs/pcm512x.c
index fdef98ce52f19..12163ca7899a7 100644
--- a/sound/soc/codecs/pcm512x.c
+++ b/sound/soc/codecs/pcm512x.c
@@ -1505,12 +1505,21 @@ static int pcm512x_mute(struct snd_soc_dai *dai, int mute, int direction)
 	return ret;
 }
 
+static const u64 pcm512x_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B;
+
 static const struct snd_soc_dai_ops pcm512x_dai_ops = {
 	.startup = pcm512x_dai_startup,
 	.hw_params = pcm512x_hw_params,
 	.set_fmt = pcm512x_set_fmt,
 	.mute_stream = pcm512x_mute,
 	.set_bclk_ratio = pcm512x_set_bclk_ratio,
+	.auto_selectable_formats = &pcm512x_selectable_formats,
+	.num_auto_selectable_formats = 1,
 	.no_capture_mute = 1,
 };
 
-- 
2.53.0

