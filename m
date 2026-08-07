Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011030.outbound.protection.outlook.com [52.101.125.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 040BC258CE5
	for <linux-sound@vger.kernel.org>; Fri,  7 Aug 2026 00:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786064216; cv=fail; b=eq8hgXRs8+59847+NCkPKVY7kH80E9Sd87Gk2tyZqkdrf0dZQ52sgQRAMtWEzflXpK7RE8DDvnahv7zBSXO4dbSdn/s7wCXet/enUG8lyXqZKKbNOTr7VWoVnBMmtp1nXsVnldZZ5m+/T3hVrI61gDA9i+aDHHProQ2yCDI5jTk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786064216; c=relaxed/simple;
	bh=/J9qsfjMKy6pb8cJVAQb0Eg3zNJG0IoqyQnpuIyZmqg=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=S2fhds0PMyrnlhxMbqDR6wqyQ5BzU1u7nhWR6pV/CaDVdYrjMY6yoMfa7aZl8OVB2VgaMvei86OwQSaUP6J3MfWfNehub6HWbGtxiox9WyLtX8YjmdRs0GlTZvJNKXVV88C1UGat/QfPE/g24R+bZUnjyRQExLDj3jgzJ4eKmow=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=LiiEb4vi; arc=fail smtp.client-ip=52.101.125.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="LiiEb4vi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rYZeGu8EZ8l8TbPOl+Nou8T7tyO36Ij4NuaAxhNLOsGIGiGfT9AuqPeUkDl7d+Z2SgRbohLvGJEN88bTZ/KdA4iM627rSd7F1fctWWdU00lAqk+KSKu4cIQU3LVioni/lc236CIO7854ALkCpP85gijScs6uksf4WGanA7QS/YxYa2a9DYnfJzDDfaDJGlGThNTpulAedoik4a3IvQKqLvuvTisdF2/tJIkKm6uWiDHGFG4aANFTiktxbE6mO8s82eVGfp2QrLBNczfgZr4HIF1sJShg8QsjzF9rvHUw9tqr8uWh9Z+1HdgUiazDXWjZorJp1CMjCtO0DZYPg1h4ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KtgF3wKryQbgFZF/1JcFow9SbhD5RVSl2QkmgDeM65Q=;
 b=Z/hCgAwmoKm+V9/XP0rDh8NsY7dYE0Hl4TMxkU4e6YOjdY/JRLoPDT356N27VOLCuciH8DkLM4o7xmddHNVIpjKWEPl+Pla/T4JttHlZeZKJrj8NOx5/IUI/IT7WrhfYHFL+Oo1/IvicbbkGD5V1fKTjf92rxuVlA+Qgoon+L7Qhh4ut0692thyKtDyRQOWCFqzTaIPcUJJZy5BxpXFwuVU4JdfOJS9A5wL6TVs5tFYisqRsfni1uha8yeYCKxU5I9qJvojW1ysP52SGd4aCWSdB9V/0qQfOXQ1Ow67+ZglaDpJBWto2HbBZ1oRzUjxSGk12SZqttJZTcE5YHX+uvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KtgF3wKryQbgFZF/1JcFow9SbhD5RVSl2QkmgDeM65Q=;
 b=LiiEb4viTrPA9bitCzMfrruMCbvx+3cVayaETqmEt2P9Nz9a2fbegfFVT6gW/88ktWM1OfymfG8QX0ZS2f+J7rmkNMuo/4DC3ha0d9PsImJsBBbGBjCYCNVvG6xIgWptsA8Sk/qu1nBpvr0NkOC9gIMD37LWLhTdvvjvQtU9YIY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OS7PR01MB14460.jpnprd01.prod.outlook.com (2603:1096:604:38d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.23; Fri, 7 Aug
 2026 00:55:53 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0292.022; Fri, 7 Aug 2026
 00:55:53 +0000
Message-ID: <8733wqu4ti.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: =?ISO-8859-1?Q?=22C=C3=A1ssio_Gabriel=22?=
 <cassiogabrielcontato@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Liam
 Girdwood <lgirdwood@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: =?ISO-8859-1?Q?=22C=C3=A1ssio_Gabriel=22?=
 <cassiogabrielcontato@gmail.com>, linux-sound@vger.kernel.org
Subject: [PATCH v2 28/44] ASoC: codecs: rk33*: use .auto_selectable_formats
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
In-Reply-To: <877bm2vjjn.wl-kuninori.morimoto.gx@renesas.com>
References: <877bm2vjjn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 7 Aug 2026 00:55:53 +0000
X-ClientProxiedBy: TYCP286CA0251.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:456::20) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OS7PR01MB14460:EE_
X-MS-Office365-Filtering-Correlation-Id: 0166b34b-0a7b-4875-1df0-08def41ea1ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|52116014|366016|1800799024|376014|11063799006|56012099006|10067099003|18002099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	gga03pnA12/qw1Zae9OjF7R6gjcMHMvnWe38uJzFp44LdNXbj+ZcZvruitOFe8QlPTvailDwVbsn4dzSopjKbxUn1pCLKebPQYpnEUlUCblamxaW/Zg2lhWF9vcKozQU7MHgxWVC3XaM2A5F+J4tUOaFzd3xknuktVQ5he/NeZ1LwLX4m6AXch/5y+gFcilZBlEjazabaEb25ROOj23xPwFl4AuZ5eYUF9J9zAL9F3j7OTZLCdb0WIg8jm1ZPhTAKZn/fs2GhGlhm+yTYBaXZJmb5GgUkdUpHJQhhimgBiVAiBrCVHdYtUR99i4ioEgXqmHUhmiqb0sRnl/Xs5gOV4HF+zBgsc2fyfRzfxqfDXl7fI+oMmtk+UK/gxCMjLr6vsru/t4tdq3wszqrmCirA0CUEWEFXWy7/maY7YhA9iKUausHmUFqgkM6dnIGIcE0TVwP4ZcKNA+kMgK7GFw/KbSWF53Nj5FqzUVjSUFe+uLsxoiQgYpdPOpzvqr4xrITAYFs2uc9XjsZn6ue6dRBSDiIveicoiF9usNsid5F5KZOQnzyhltMFV2t4aOwYjriNL59bBwwCv4g87nn+1IakOKIxyCt5Ej6FnZoMyeEwJRCrqW3kVHxKRM/jr85GPK5FF1ph6GiVoxqDaOaSK9dq2M376oZshQSTMBKgC2xtUHL0f40YewFTre8cV5jabg/jDDq27N89hNSvdSFjD4e9D6OtbRsE0zX/OSWCQi7pBM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(52116014)(366016)(1800799024)(376014)(11063799006)(56012099006)(10067099003)(18002099003)(22082099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9/gYoygr6QLTv+y2JOtEXKL/D29Se/FrDfLK03uQejkv2n6d+XZAhkyyTR+I?=
 =?us-ascii?Q?nqH8Hqb2VscXEFn00vtta5pA3NNHmoUKNGQ1IqDBUlk3nsdGjmLEqNkzoWNn?=
 =?us-ascii?Q?jMY8bKERe6vSercllkVf5utd1c9k///vZ6Ef8/e7xFxkfqLE9McofX0oTe8K?=
 =?us-ascii?Q?CxRmf2Fnr2UzqVMy5lgsUBuP9002YxjPyQyFRpgWWilcKJbUicJ4nsSnOusd?=
 =?us-ascii?Q?LB5qvSQWfUe5hnt0VFtndbZ+T8sR2C7PSCuRMgoJlEhklp6hWFssmRwsr4LL?=
 =?us-ascii?Q?v3S6pHM+/MM0iR6DPN3tGh12jfMOMN0AgzSkjMGd4CqIxSK5Ns4yn/hFLdW+?=
 =?us-ascii?Q?yRfdVaxG7+Qb+/Mb9jFThJ0lnBjwkWe0/hS9gxxQJRJm4kA88obFyjEdGltA?=
 =?us-ascii?Q?4CKgC3Ppwjz4OMun1pztep5j0fHtW1rLrz5jf2c+OUJa58XrESMk5xdap0jg?=
 =?us-ascii?Q?z8berm1VVLLetxHfgRX+AoS83Jf/kiB1oZ4wi2AEe1inTjqAspyxJFMv22nD?=
 =?us-ascii?Q?TY7Bd+F2fobbrS9ke1AqFiG9IwAj+hXLA6qM4ILtdKkYayHkGyBdJhmET1P4?=
 =?us-ascii?Q?YMlmAICognPNUD61pVXvP4IV8pXAQYdNCMQc9gXCVSRPXdFqGFVyUgIjhiWm?=
 =?us-ascii?Q?A9g3A0l9wuV6I9C7J9b1ns4oY5UfiDG5S3M4LVJPO53+HgbJCUtFir1tj/Mt?=
 =?us-ascii?Q?7kI/3NsYALg/zrl4cSLSbbRouoIUTcMH+Fdto2CVSNih9zNkoqrcMOHOf7uJ?=
 =?us-ascii?Q?b6J8rhDgxHMTy2PWTp491JMqVkA96M3QuZv8KigfPS/E7knYx/Fe7nG9xf9m?=
 =?us-ascii?Q?S87KfJCQAuEpdBlOjtmWSmsj8fd3GvAOiFpE6mDHy3DcLcGiye3lrwGZQUTh?=
 =?us-ascii?Q?l1cwDdNrOgBWoMBobDhbR2KALJCVmSv361KdJgx1cTv2AM+7+cbhszWCCRmD?=
 =?us-ascii?Q?OSexxrKA+20hc1gENr/mWEhXrBx40S30sERTLL9izxKt4rZ/12PbKUop+JR/?=
 =?us-ascii?Q?dfG8DJZJr7w0d2g7SS7rWlIQDEaQ1uSKPOPwxBO3mbWEgwpKeMpRiCK+FhvZ?=
 =?us-ascii?Q?d6w/VliFmCZIML0OC+7Hz8kyzzf5T1FcX/YxuEt8Ivc5+kEdUmwPysBZ1TXd?=
 =?us-ascii?Q?h7sPlk/MDnr5T0wsyDs51Dj9HeH+jC0DC1uA7swr26B4+1OoMkeD+el1qs5Z?=
 =?us-ascii?Q?lIyAL9XJ/+ooIF1RMpbmFQVK7JlqlLLC0f0IUtnoRF/ZnP5Xu7gM8632lN1p?=
 =?us-ascii?Q?TzeK8Sec+0/NEqq/rcmVbWPPntGZWbOddROko+n7mrhfVfEIevzro+DrfBzf?=
 =?us-ascii?Q?s/YWxx+7+aAVuM8pzrhk7dMwkG9NlhdbR3f+j3tLLBVU1H9VomHu/s/hHvSC?=
 =?us-ascii?Q?ew5y6NMFqZHTLAk/gRTtypuMSNbj+AMRuJ4ruTXI8z1+/qDsMcbrIgR1ADET?=
 =?us-ascii?Q?ahUlQnYDbml5t/n9zhsecwaDOCj422xEC9zkiqrglps3JdkrCNDzAc+Gbt4f?=
 =?us-ascii?Q?XGlCH1T+aRZ4v1YGVeyUlVkRzdFsNzcxTXn0faNdLzYQyui+efrVYHYIFkVJ?=
 =?us-ascii?Q?e0Wg/cf7xbw0js+eZkVTRqSUb/z59y0Ychp3+RLRhKB24CUkuPrdJUjNvfLR?=
 =?us-ascii?Q?XpwWoXVcXiWqkohkj0KfQhKMqBDZ+O+w2tnjoNQK+2CWR82HFCgh/8P5cPLY?=
 =?us-ascii?Q?HBigXc0C1huph+4TL9IxlLrwU6F3SFX1Y9/T1QHJ6t46Bhz2up+WKhmm70Kd?=
 =?us-ascii?Q?Lqzq0o6lSCV3qt9Pp2aa3JFDTErJHwM=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0166b34b-0a7b-4875-1df0-08def41ea1ea
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 00:55:53.6719
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RCSNPLhdgk3Wh8u9K9wCdW3clDVg4d+3EGZgWcdao6oWT1SYJFxMlP+obqCVyHvrgMc2zQxDlJcskYNfkdGWv0y0N1coeSjoNrDGMFZ7xSK+UF+ISz5PhceNT/SnCMcs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB14460

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/rk3308_codec.c | 11 +++++++++++
 sound/soc/codecs/rk3328_codec.c |  9 +++++++++
 2 files changed, 20 insertions(+)

diff --git a/sound/soc/codecs/rk3308_codec.c b/sound/soc/codecs/rk3308_codec.c
index 60befe9d37f05..abed31ba660c8 100644
--- a/sound/soc/codecs/rk3308_codec.c
+++ b/sound/soc/codecs/rk3308_codec.c
@@ -679,9 +679,20 @@ static int rk3308_codec_hw_params(struct snd_pcm_substream *substream,
 		rk3308_codec_adc_dig_config(rk3308, params);
 }
 
+static const u64 rk3308_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops rk3308_codec_dai_ops = {
 	.hw_params = rk3308_codec_hw_params,
 	.set_fmt = rk3308_codec_set_dai_fmt,
+	.auto_selectable_formats = &rk3308_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static struct snd_soc_dai_driver rk3308_codec_dai_driver = {
diff --git a/sound/soc/codecs/rk3328_codec.c b/sound/soc/codecs/rk3328_codec.c
index 5871b5a819757..c2798ee940593 100644
--- a/sound/soc/codecs/rk3328_codec.c
+++ b/sound/soc/codecs/rk3328_codec.c
@@ -312,12 +312,21 @@ static void rk3328_pcm_shutdown(struct snd_pcm_substream *substream,
 	rk3328_codec_close_playback(rk3328);
 }
 
+static const u64 rk3328_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B;
+
 static const struct snd_soc_dai_ops rk3328_dai_ops = {
 	.hw_params = rk3328_hw_params,
 	.set_fmt = rk3328_set_dai_fmt,
 	.mute_stream = rk3328_mute_stream,
 	.startup = rk3328_pcm_startup,
 	.shutdown = rk3328_pcm_shutdown,
+	.auto_selectable_formats = &rk3328_selectable_formats,
+	.num_auto_selectable_formats = 1,
 	.no_capture_mute = 1,
 };
 
-- 
2.53.0

