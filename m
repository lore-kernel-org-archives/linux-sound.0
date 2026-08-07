Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010030.outbound.protection.outlook.com [52.101.228.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3970825B08D
	for <linux-sound@vger.kernel.org>; Fri,  7 Aug 2026 00:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786064234; cv=fail; b=kx5pCYi6GNGBl+rOD1licstNIZvU7tUmG7DDT0Hc3ivHVg0oGVBSN0Of00SxsObXuGNqVaRhlNJNmhSiDOziEhiz+M1tts62LPbacHdAQaREFQt5mtwopwlnzFTKgg93WBUuuxCCrPZeL3AWS6K1mE0zwByq5n+JZOFRWCLuIK8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786064234; c=relaxed/simple;
	bh=D2lvIpzl2FDF7GqnxAAVA7AJer3b/xwlJQJOqM1bdUo=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=ci4K/T+yMvFAWuIDiS0Rlo4ap7zx+BxoNMIYwCsDJ6TXtdPjriMmdpNP15kqJBIfop4ApWYe1tOtcX0q2/8nyf9BeCgZdlLvSnbkjdVue3PFSrqmcBAV6c7+1cCGZ/LaGC5Rl4672Czz4Q4dZvhcrxm1SwwNMwa6QQWD07y8ilg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Z+hYBpcf; arc=fail smtp.client-ip=52.101.228.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Z+hYBpcf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ngxn3SLgr3FNtZmesBG9ppdWSlZvOz+WSytCMvNbeAGNPNpRX/AJ2tcPZFzx5cDpPTY9axK3p5143Xbn6kAyyM/2CaxEfuyyUQisdlqWD1fn3+Qt+YHk6I/w/9achY8+13xMR/0RQcOOA+jUpbDm2d7JWk2L1sq73wrIythZANHodQ+rjG2m+kLCr7eWI/V6yc+Bi1cZ0QQN484vP/SEufNDHhbScL93al5i7QdJO2fC+vIIZaU95mJgmSkUJ2cXHW50JP1zeb2CBQvenUo3DQcJGhV6kvyg2y5ZnBQHOgZqjcjwv9wKOZuyq3wroPINxeh7QwYagbPdSIA4nMDcuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ax0+PlhaSomtklhOu0OFMMtM1WxeYDUIINXdU7d7ddM=;
 b=JYgO8UinVEc/XkV6H3niqfTHIok91wgqMvZFaAGRMKfqfCAhrTLzotXvsF4vCDNZbARNtEPDmUEOCIsavGzIhaqIShs5wb5F0U+V5OMQw+CIa8XDQvIRnv7vM0cUrUGaOlfJVqqIlCPP3hIQJvmRA8GmeguF8GbMbYOD5wQ6Hcbw2iR0U+g67clRBl24bmQfdVuYV9QBgt/iQY6E3nENBeH10fa2W0r4cV7LoWeVfPNV9YsBXLN/qYfK2X5oJOgYjzJVlMXuXc17IdaDhPKjs/F4VuGkSN3sXTUsF5rSxgT89QZjnMww+GoU8nBHjjrBQTpXQfMmQBGhFcHi6qtoDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ax0+PlhaSomtklhOu0OFMMtM1WxeYDUIINXdU7d7ddM=;
 b=Z+hYBpcfskd1nLHQPAFgfdLL75Gnc3KgTnjwlsTmhOmWhZoxSApfo3iscyV4V8BgzdX8LYn/xALq0iX4sIo/mS3pmOz24awF5K/WkEvwrZfP5H+FKO0EOE0AhEfHmMkf7Y1/MoOXCFDlKgO3URDwYb8kHsNsTEF/tEXcgUm6U5Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYCPR01MB6638.jpnprd01.prod.outlook.com (2603:1096:400:9b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.23; Fri, 7 Aug
 2026 00:57:11 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0292.022; Fri, 7 Aug 2026
 00:57:10 +0000
Message-ID: <87ik5msq6y.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org
Subject: [PATCH v2 42/44] ASoC: codecs: uda13*: use .auto_selectable_formats
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
In-Reply-To: <877bm2vjjn.wl-kuninori.morimoto.gx@renesas.com>
References: <877bm2vjjn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 7 Aug 2026 00:57:10 +0000
X-ClientProxiedBy: TY4P301CA0032.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:2be::10) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYCPR01MB6638:EE_
X-MS-Office365-Filtering-Correlation-Id: 4971bc0b-3a5e-465d-dd8d-08def41ecf99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|23010399003|366016|1800799024|38350700014|6133799003|10067099003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	W5tdFD9Q+rvBXbpyQDAeLTqLsG0NxTi5fxZS4akoPvXM73CANhvTruCSN8RZNLyfAF2Uiv1TPu0VhmTeh8jqeqhSjcsnSvOPf4gI5zUQ4DCe2DumBGHi1WKHXALk4MeBaQo2WZCQXVgkh/P33G5WjsnOE2jUmUz3GgTnp7trfvjkqql0t8arFbV9FywJyJNe0kdCsE/cKPsZ2WfM3xeeOoywGVDSx1NbBFu/Jgi8tOhfj3cj+vRkQoVvwRkojIz9bDiAMMTjDviLszEQplzzrEFl3BoEQB8XaK/UeEi9CiY0ombDe/rOJcSzkJ+dYdWO/UzgUkdKYqZ65WNwWBMlFLp5udH+JkLrDYMvHCMOn99EQdKcm2kONmvGiT4pdX5cdoRzjq0pzIz2FhYq8a07Tab15eIyk3MAmeTOCMxz1O0yWuDba1z3JvsaOEQEQPflEhLACgmEdUz+vxaHsdPMaxmedjzoHv7s9dQkFnIkmFHpzamLwtLBBmR00tzQh7KmqSyqU/c4p6teK9lBYVRZSdd5CmLKXYLbCLNgPZZUj4WuX+zBJ03zU10XGtN4o/ib/Z6s0jFm2ibF4zbmItwZxjeZazjnu75SxH54SpXHhoytRbe+XkQMCfNp1/+4J3PJDOgk3sVNia1u4ef5D20hWfILFkQiVHRJUCQCUm92Quzfvw1T96RHLcP3p3NsOub7y8zkak3jLMROaqYJNEko8g0su66NDaewLLROka4gFTw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(23010399003)(366016)(1800799024)(38350700014)(6133799003)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?raI4dvAy4MOP1H+VYudJ5r7N5sNNL4gT0AwM71YL3jbQ4zIKwZnmlMCvOTRD?=
 =?us-ascii?Q?T9dZoXJP+XRDJPKXpXeXw8a1HUibT3PWoDQQqsNoqhINVNL4UaSN3v1EbCwA?=
 =?us-ascii?Q?CC7pCVB82Xvj+GH4KE4Fg8zZrB8yWnUK3OW7kuws30bYQX+h6wXMaJ1o0ZWQ?=
 =?us-ascii?Q?galU9ujKJ6z89ty8rDywjk8eg2gfy6NDgunEPsTUOpY1B2B8iiWc3Sk/FW9r?=
 =?us-ascii?Q?hJ/QDXllc1qwu2mJ9gnsc8O0N8w0DZBfs5bbgsxunvPAbFJD0+SyLqAkWdxr?=
 =?us-ascii?Q?3dIWoZ7fHXzu1fTMR8xGG8sMDPD0hNYxtaKYKMpQttcq83P2jeZZOCRmkEsu?=
 =?us-ascii?Q?ltaBrokSQ1Wy46Gxlgr0Cc12Bwm1e3wGxgw9m6Cxfh46KBJ0FwIM1qGnY/J1?=
 =?us-ascii?Q?BIoECcIbaMwizx3ZmdLzY5a02k7RhZMeBejDDpi27w0Y1YwTsYhohR1UrKQ6?=
 =?us-ascii?Q?n2I6OoT2UL07m9HqG7qLW185Qd6RTy9r4CZcO21weoanMCd+KEgswTJ1P/M/?=
 =?us-ascii?Q?cpb/q2n0VjQsEatQUef5/nl2ElFIbx+z5JUBoXq064iF72Z+ctM9Jt5fNxMK?=
 =?us-ascii?Q?uotjfNoR3PEX4Wz7BnMYVm/QfySGEF7kD75sxj4p0Ue7IM+ZQ1QZIi9lpkkh?=
 =?us-ascii?Q?UVKk6SdCOdBZDjFpsreh4VsY5r9rOkOUiegQX7oPoACIl0LBgpSx7nJ585pH?=
 =?us-ascii?Q?CuI2pOkdnneYqd2nLV1dEzah86wXMFEvY919/IJj2zVcjgdfTQa4FqZgMAgj?=
 =?us-ascii?Q?wUPBuUw7o190kUgrwactDHjpycCY48LEzhFn4eYiguiKfsn3Jo9tqla0umk/?=
 =?us-ascii?Q?/Lb9/roSQHntAH98PtmwWsUgiS+njlGUVm/KH8NYDvQrkEKavRHJCuQiRABo?=
 =?us-ascii?Q?Ey2GMI1wswfUtzn2ZvN2XUxyfROVK9/r3TJ1VIBI3ok83EFlIEcsEbqANVtA?=
 =?us-ascii?Q?bEih51GMDFvWnzBzQ2XzISlyIbg52aYwULNC2Evz97Ac6JFH0lxmKImhzH1W?=
 =?us-ascii?Q?4jvwhJRobCmty6t2qopmLWsvmNlcjA6rg74CFOHjTxxTJbzvnnE+dU4/9rXm?=
 =?us-ascii?Q?VLF40uGzdRxzzV+Rnklk8F/1y2owKX0I641c0P26CJsKWpirMZhxQBo7D4sD?=
 =?us-ascii?Q?uWQiYKgslLtIuvTgF6h3gnQPreKLoehqUJ/0NpDvG/yMQcpKsXI9AMBVhafW?=
 =?us-ascii?Q?VpHMpcbrnYEmlfSbH7vzimSTxnTHubbNV8sKa6Aqq0BIoW8dvj8X9D/wyjb+?=
 =?us-ascii?Q?lY53aa40ZzLi4fizTi3zN2Ej39exn/D6384+OIms662tNQT85i0IObjrtUGN?=
 =?us-ascii?Q?yJQ5en107vQMeM6J20KnUn9oJIJ40BuXanTBh6FiIXAeIX/oAehVQ50At1S/?=
 =?us-ascii?Q?3jfyLoQUzjDVt8kXANmBsKA2EKuFpOkvq+VN4j2Er2f53Qmjs7G/5X3j5yEU?=
 =?us-ascii?Q?z8Cobaa1PK/YkTL2ylc1j3gw/QpgXpfuXqoSi1ZWRHpzot6uewmxdXF5ykHv?=
 =?us-ascii?Q?cDEatFP+7Ggo+pyMfkB2ugtTVV2VKRhRld7BOo8Z7DICd+LeimMQrthSQbPI?=
 =?us-ascii?Q?RvXEe4CdkCTeJUCl4jJXY9wKtwgOQ/KnJ1RQ6BH0ZBN1NKESUYAWY7AmUr1h?=
 =?us-ascii?Q?VShqxtQWgLzpgKiHbU4T0BcCMxsOhyMOKAbz4IEE7LXPh6MqP0fVWliaOyf6?=
 =?us-ascii?Q?PDrJynvdIBdBQMygOFXY43pPSCck9rkYoqoJfF3XjRabwLv3qn1BGjEgZVD6?=
 =?us-ascii?Q?ssOCXlANVvEt1awl5QKUK0I6Eb02zu4=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4971bc0b-3a5e-465d-dd8d-08def41ecf99
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 00:57:10.3882
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x4i/2EKHf448zXaq/s372ZVKc0LsQ2pfVHq+HsSnzhnIuK2eNgbTROcmIgemIF5tnf5mOPd9I8GInr65FrrDu4hhdAVj07n4XaAJowSDiEnFEXwLGR5s7ITT7QRLpF7X
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6638

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

