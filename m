Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010060.outbound.protection.outlook.com [52.101.228.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35A6B1CD2C
	for <linux-sound@vger.kernel.org>; Fri,  7 Aug 2026 00:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786063971; cv=fail; b=a5UHsxCx2I4J39nOGqrOwYCXIExOVdE5u/Wc5MgOd/R7Swg4Sl7Jkd95qKQDtZcBo6eaUAvy/AejKEe4DOyPZXrtPiVpiCfsRcEDIO+VF6A5sDAKfYHYXpzzcn8iicG0l9Za0uTuY/nBk0Jwm3Qwb7z9Ua3jCTBor0BKh5CawpY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786063971; c=relaxed/simple;
	bh=tJmFOW0Re7fGFVDrkEsI98wmOUjTqfdJZzNOIxh1KGY=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=GkI7SZ6XeIWhFgqIUpAz/un6TesZIIspGEFRFwgBafWlgHhXwRf6jIAKo28/evH+JZwYkAxSzamDn5+Kd2AXsKRQmWDvMEP/DI8B8TpktfjTJNY4MMxpPadMY7bvYyo1B/94Ld/b89tG24IA8bU0N0dVsqIeESG1bSzOO6d7HbY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=g44YyvIs; arc=fail smtp.client-ip=52.101.228.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="g44YyvIs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lvLBrfA7zSpyx4yawdN3prlMKHMdTpmxMKmx/qvAOzau8CgiWUhdwPAu4VkfU5LVdDl7Q4bD80XQKHoE0pHX94Xf1FvSxojS1SKpS4Z6tmcft05cgrRD5JyUVVDL/yuap422GHqt+OTglx0DvoWAPlsozgY/X4ijIC8PUpAcw/HWHVLzX8Ugk1Cg2KtUO/2Y1+xn0Hsg9BUoEywr77ry35x3jlu/wgeYyRDn+34wSzSgpHbase++A+zPwMPgZV2M54khq2aFjJ786isfNMoFizXWEmamY8eB36vP9t+MbdSPwUIbKuKAgOVNuzPQme7jNkUJuVoAAP9ePU0u2jXzgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1UIpaZ8PQIXRPmhNFadCt1aQXSnKEqs3x9yp3ozrd5M=;
 b=i2XhAhCpqvuHENQwl63/rJetPb3biXkKig2qxR0vaRwa2NyhgwF4+L9qPHO4fzM7RApwRpauiXW6ISCaiGg54pLuhi7Bxfx41VsZAXHxctwBRWI/vT7G7Yiu3IthRdqKaY2rQpUEKTS05NsYxWfDwElgCBEk9zc5MaYSxa8imyslxhHOLrfkLuqqhFVs57YTx+Av9lLtveJ733HW4ehktAhj3lUOaIgdoLMBJk3VbYG8JC6L/k64fq0pd4IkOxBFj7Nf42MnDjwtPppUz7Ti1Qjv7grI+yjPWyYeBNujElud2zhpIXd4KO5xHw0G6RlX4bicvizZ1KkrM4bIHx5n7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1UIpaZ8PQIXRPmhNFadCt1aQXSnKEqs3x9yp3ozrd5M=;
 b=g44YyvIsblzqEO9aIBb1Iz1zFpn5xxlwgYHwyuAyY4fDH4BCGTJ8sJl9AIxC1Y6NusikFxqlnyD6IBtZuEdxrM5e20a3vYM7pnj7vF+cMmi8PhDpQASwghzWGOYf9EFSaf6Bh9t+r/CLf/dapKfHp6wQO0xZNyABWgWA5CNmzeE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OS7PR01MB14460.jpnprd01.prod.outlook.com (2603:1096:604:38d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.23; Fri, 7 Aug
 2026 00:52:48 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0292.022; Fri, 7 Aug 2026
 00:52:48 +0000
Message-ID: <875x1mvjj4.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org
Subject: [PATCH v2 01/44] ASoC: codecs: 88pm860x: use .auto_selectable_formats
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
In-Reply-To: <877bm2vjjn.wl-kuninori.morimoto.gx@renesas.com>
References: <877bm2vjjn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 7 Aug 2026 00:52:47 +0000
X-ClientProxiedBy: TYCP286CA0334.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38e::12) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OS7PR01MB14460:EE_
X-MS-Office365-Filtering-Correlation-Id: b4f3559c-647f-4fb7-d4f7-08def41e332c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|52116014|366016|1800799024|376014|11063799006|56012099006|10067099003|18002099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	cJ0Y5I8ER0aGDZ7UlcwetowuetfX103U1cdjlZgukLF8LVkFzxh/4pHBGohL7IggMJaFcnVEngj6ZrgE95ntiIaMrRbFk+uYbrq3ST7KqERk0qF9bmvwBJxYYj0a5K2w4KplU6G7m5bt4JXf/Dm6Oj3KuNNDbvuY+ZwvfSZmElsZqlxSGApWgVRjKrGeDkSowpXvmngxeiWvm6mg8uy9vqKY1X8gHYhxpTArN/y62qg3A+5YhS264JRu01r9fiUXzwiOz37FsX/WwPKIUhbIt2KSZeWVJvVXH2dAIHOWXKjSaFKqgf76ukW0PjDLY9vVBdrQhi7jpcIpZsAPJaZkB4QoUtN1pyutvJDD7owLt0zw9m9GfRcm4m2+LYi2z2QwF7e54cLvg8mbICGj4XD6T+QQdM1ph16g4eQACGRar1w+NL3JGZ6AWxcpBBV706d3AcfV0MsUMZ6yU95cyyzh8ko64fSQBN7KAhhPfvss5UsuCxReZg6/iOnS0K3I4mQHd3TwgMx6otdAsjBKaP3qLz9jRf46EC+XZtXh8BSIVhTxyLl5iMnDLcx7iLIyg2/7mJgrAJSIkoeby9bjFfIhid8xZFdAJK7DvEbuDDieDp0rh/YsImRL05rpoS9JiuH1Z9t+SMVZ5+MyxQicUPWK625Z7Bw0LsNd5kRffyhNrT0Ukcb+uxTzifKyzxtrn6mWqSudBDE5ClUVu02Nh6z2cdZvI7lYyG74sueSMFZcLXo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(52116014)(366016)(1800799024)(376014)(11063799006)(56012099006)(10067099003)(18002099003)(22082099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JWlrUxarV1n/HJelSbyUU2kyvpjOIMWsXqMtG3nW4HwSP7c1boExsed1JxKu?=
 =?us-ascii?Q?fVxNTL+0MLwAyGh/1yVKML1N697jxn+poNIkL0LLXGgfMkndSVkwqJ9hOjiY?=
 =?us-ascii?Q?G47StNlrM8WNnpgiyeEQD+h/2MeTIrTVhJnsKgUaBDUWF4vCvPRXHxLL2cm0?=
 =?us-ascii?Q?/67MDe0HUFOmq+j/5kfU6xwhytgiYaGfUhgHZ+V1T+Hk+Xs1GNyYicITqLjR?=
 =?us-ascii?Q?JrAMHOJo79TflCj9yTNJtXQEjfJ2oyv0A4OoZDQXtnCmquXLNShAnY6Gkfjm?=
 =?us-ascii?Q?Obz7p5RZZ+4vZeBIrbzsyP9GIOqNp2fHm5813s+/kWvi2HQk4ZeX14PTomnH?=
 =?us-ascii?Q?rU0DAQcS7G8UnnU1L1XZPTxva7I3/oNNPo8sKcIhf5AHOuanaWCm8Ma2jTuP?=
 =?us-ascii?Q?JzKsH6Lp379qNGjRtb75LBMBr1oe4kcFgwqFT3s0BRkU40FGjepgN8GSVy/K?=
 =?us-ascii?Q?yQGHURTfFomX1cTyaRNb4xfTaKumQ0jRzL+qFs5txLFY1JW20V7V0o1IByYT?=
 =?us-ascii?Q?+gbViwu1H7Vs2Hp7CZAzVeA8w83PlRkZBagmsO+4GTfFoHK0qKKFBdFYU3Ox?=
 =?us-ascii?Q?SkO0jFeYZd0pc25JJqEvWnkG1th7qBSMTo/1HdHXIf8+ocXRaESmueDBiXWL?=
 =?us-ascii?Q?FytZEwhUQTGn4xJVqZ09HXbMC2wqGnSFW3tAZioGTNzI1pzICil3go3VIJII?=
 =?us-ascii?Q?9JxdbJ+bxSV+uI14UWWeVOAgkryyL1HRb8guKEHX3HFrMkwKHxxq5LoC90rW?=
 =?us-ascii?Q?AwURvC9vtj9FDiZytwW3H6ywstETNRI4+KvzSbkvJKWRR0iw/YVQSEMliF0F?=
 =?us-ascii?Q?gcQdQ2/+uGrznX3nmM4cTNLRbkneefRuUW239m2/ED5TpKjYTbVobd9PEsyx?=
 =?us-ascii?Q?l9l/mRdtC2qLjlj+0tKaq/gBWcZoHz1Mq8bsQqu27ttKW5dq03XXZaR6bO1V?=
 =?us-ascii?Q?IEuuLgwE7TwwhEu40B4WeEbwWCoB6pnqcqzOEHXQBaeRdZsGS9qFS2AfPQjW?=
 =?us-ascii?Q?k7tulJfezVq6HfWKklqmBsCGbxl4ZxXXWvvGF6JjxNl037LH6eZxcMykAvl/?=
 =?us-ascii?Q?fczRmJ6KSFjb22wvkMldSSb8OfS+zFElAbhxb63RK8kJnjNnMGHSGY6deGKT?=
 =?us-ascii?Q?lRHGW5JnNFqdDIijShBjg5zmNsbP3126Vt1WuGrrmNn9/plKrFg7/CJL7XZH?=
 =?us-ascii?Q?94penYJVLV9PVn/uhjylkCCn3hQqQUlxmMPYndpfZPEzNrj+3X15HmhOm36O?=
 =?us-ascii?Q?BqNV7YqCM50NBOCUPuaM/EIYCwZ3TRwdIVuDBQhTUQB6U96i1+1B4AFbRENK?=
 =?us-ascii?Q?I+Ny0NvIGTLKbsdhawUvAO4OgPup+XqGL9fmrzxq83PjVnlk972FMxwO1pt9?=
 =?us-ascii?Q?VJlM7444e3q6I6GNPX+0hyVewtjHS2riYN33kqAshi6TW0EnXSLK3Y46tE/c?=
 =?us-ascii?Q?6lWkNF7fKdg4LiWoLLZlgJyTY8NFSYpiioIm50jGpVv5QVvVarhzWBAYDFrh?=
 =?us-ascii?Q?2C83xfAv14x0cFeWcyQZZnZn4WQDUJN1Gtd5IBZLw1XDKJxi06dmIXQkLCbn?=
 =?us-ascii?Q?USFMmURRG6/v0RWiIWhV8hluh3AasVvd1G4gKS04wYR1kbC5aIg6Eo0XjEr8?=
 =?us-ascii?Q?KwOT5PmUZwbYNY3jWxNfDNZXoB0P1H9khwzMP4ZjUcNlAJxwpcZupbmZLLj/?=
 =?us-ascii?Q?kNJJopH0Yoeau0BpbVf2Ey8CttJY9T6g8EINj33g6WQ71t52FnK8WZ3HVKq+?=
 =?us-ascii?Q?f1iBdjs0hxhAjkmVmdY+eXv3hQc7Uec=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4f3559c-647f-4fb7-d4f7-08def41e332c
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 00:52:47.9362
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d7oDsORaL1Fpv23LWf7hYKmb9dAGgSqHbe1BJ0Kn9LdRZbwSX6KhBuHGM167dg6+xuiHquSfjSBvCGKrmjY/aIPSfnBTX6avD9rjtucKKsq+QE8bIp4vXCEXC3hlIiAj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB14460

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/88pm860x-codec.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/soc/codecs/88pm860x-codec.c b/sound/soc/codecs/88pm860x-codec.c
index b4f5b24cde456..7596227fbccfc 100644
--- a/sound/soc/codecs/88pm860x-codec.c
+++ b/sound/soc/codecs/88pm860x-codec.c
@@ -1136,11 +1136,15 @@ static int pm860x_set_bias_level(struct snd_soc_component *component,
 	return 0;
 }
 
+static const u64 pm860x_selectable_formats = SND_SOC_POSSIBLE_DAIFMT_I2S;
+
 static const struct snd_soc_dai_ops pm860x_pcm_dai_ops = {
 	.mute_stream	= pm860x_mute_stream,
 	.hw_params	= pm860x_pcm_hw_params,
 	.set_fmt	= pm860x_pcm_set_dai_fmt,
 	.set_sysclk	= pm860x_set_dai_sysclk,
+	.auto_selectable_formats	= &pm860x_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 	.no_capture_mute = 1,
 };
 
@@ -1149,6 +1153,8 @@ static const struct snd_soc_dai_ops pm860x_i2s_dai_ops = {
 	.hw_params	= pm860x_i2s_hw_params,
 	.set_fmt	= pm860x_i2s_set_dai_fmt,
 	.set_sysclk	= pm860x_set_dai_sysclk,
+	.auto_selectable_formats	= &pm860x_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 	.no_capture_mute = 1,
 };
 
-- 
2.53.0

