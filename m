Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011010.outbound.protection.outlook.com [52.101.125.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C5DC248F7C
	for <linux-sound@vger.kernel.org>; Fri,  7 Aug 2026 00:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786064184; cv=fail; b=Cos5EB8DFCLzCsD2gtIpdR9c58o+hVIyrN7ngFoNefqPAH3am4OXKl1abSMqpWdpJVho7wiiVb9L5mb9xJHch43tATwBBG7qYuruJCp1oWJu1lTmq9gbkya72rj5mHfpBX1U6l3zK7OoKk89PV+miPpBQdTjciN0Otq4XviN2nI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786064184; c=relaxed/simple;
	bh=C8N58xQXlneQcOvtO7Pz60LsAo84LuAkfBvjhhic+iE=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=uE2guMoFDW2MlrKPNXPy2CMExJuSY5FR5h6EvhgZ6By1SpR6WZLx2qlCtu0ZiegBbBAdysbqydxjhHnOehDTRiIg6rOTXWAGuhO3NLKzcfppeqHnJ3EFGA5wvVimC8y2ILI2r4GDH/+sgfJ3/eiMnHXpGRt8KW4yWP/vVKu0UPs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=dTnQ0E/T; arc=fail smtp.client-ip=52.101.125.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="dTnQ0E/T"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xVuNqV0FWhblJXK9K8zK/rb4RqqRR9G8XXR23NqhYvDfUB+OkbnLbVw0hB4BB0VtGX6BEQUezETKC75xGn039oacbTBt+A/taHMD5P3ZmcI5llzzlyCjUH3smc6+ZphE965BOErcmHfp5Z0u1AsFcdIrbdGf9OE4xmMrN9sMQLah1BdVPhOzZcVmVrms8NxTjHwVXcpArtCSP+O/AlST8NptOdRYn/vppAEFakG0xzLWJ41pQ5hBn9IF93GmIia/k6z4ic/kqgxDTgNfUFglEXENs6ExAHarEDdIquJLmLLspBSE5gPUZ2iKl4u9tujg0r9Dlgss4YWjmCdyKVLc4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XX7pRt1nPGFk9XNGWEopWoyFaL0pHgMr65y69qPFFnE=;
 b=gB6orSKal4qyeG476itEBJuokn9yCC3FQZU7glNvzk5o9UETnPa7IbWVmkGCZSvjEvcA/HBhyS/K3P6W9rTtMh4bHo/KQLJQ+REKnlfr2jCMkTJarR1lL5Wx6V0DDHvw9hrpYRyEWC9KobP21a7ye1LMpvIRzuhv8D+yk7yI5Ki1UDkGZU538MeO+mHwPbNH0QWUI8fvGJvl8sn3RDhscIhGMOBNPQuTehSEsLYWbOiYEDZUP3LuRJkQGBWoC7DFjqBUH+qssqmLki7I8DZ2gV53uGl7YZ/VwL/Mtg9+v95OoJcr1w1580S+jeEp7HA6nHgLFoVR6sVNXSPMp30mCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XX7pRt1nPGFk9XNGWEopWoyFaL0pHgMr65y69qPFFnE=;
 b=dTnQ0E/TwuZwSqKaYNgM4VnhkC0z4TDc0yc1oG+oW8flNtovqI52mH6Hxd6OXY70oR72OXojOtww7ri57pAgFzzf2ZGpkfl1DGd2Wrstj3O+MfjGKMtDeg4xz+sFxiYzTOzxrZQKkcRhSdRuUNjiZWnhdJQGJyXmrTlViPJuuDQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYCPR01MB6638.jpnprd01.prod.outlook.com (2603:1096:400:9b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.23; Fri, 7 Aug
 2026 00:56:21 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0292.022; Fri, 7 Aug 2026
 00:56:21 +0000
Message-ID: <87wlu2sq8b.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org
Subject: [PATCH v2 32/44] ASoC: codecs: si476x: use .auto_selectable_formats
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
In-Reply-To: <877bm2vjjn.wl-kuninori.morimoto.gx@renesas.com>
References: <877bm2vjjn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 7 Aug 2026 00:56:20 +0000
X-ClientProxiedBy: TYCP301CA0089.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7b::11) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYCPR01MB6638:EE_
X-MS-Office365-Filtering-Correlation-Id: ac2e4724-7325-423f-757e-08def41eb23b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|23010399003|366016|1800799024|38350700014|10067099003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Lza3EjGzNOTlWdUhahYAxRueFqtAxuNVs/k6nx3lDV4QVwjYYGYtJSlWsFHhZee31oMsQo86DqpPhbsuHUHOTJZM1+Yp1waBMM3Qdko/4OR+gWB/LRc+koIMop9tVz7PwX5ZvrI9BvJqDEm3yUTx5WLIiJ3RilJMYJ0fm/cDeAC1zQbPa6tHec1hNOYv4qeKW61u0eby5rM/bCZ0RAlNwa1pqoS6TujcitccZ2y4bx3yk3KzPPOVCgAH9VU/9vodqWpXwvp5mdzMCmdprqCkp8IgJZyRhJhe+niJPPzZKsnIBHHKKP0BPaM4KtpdEQi4Hmrk7LEEq/1HdQ41ogGYx/0/cin9YOkZt8o5+isneEzoxVQGP0ZdbnXvmuML5JgyVtnWdVBjZvCMGBpKBk1XF4Zwwp16qKgfNoJSuputrfIIaFsXY1/vvOFW7NzYhi1QFwBFkj0mkbvd9oBkC5jXwDY7mOgyg/y98JXPFJFHuRXGaCWDVAFw/F0TgEguCnKbkUzgtN1mbqN7j0MQi9CSR3uGCnw9EF7XD+Hd42ay7Sa2esKda1POiswt3nt+v3UAJLXjk5IoPfaZgS/dhJ5kPwpE8j9piOGzpAaJmg51I301AsQOz5ubUob39UKx1hE3oLKH2FOWXdItPRPFd0FQQyq8arC0IM8vgpFtzC+b+WEiQF1w4ICB+q3bXAknsI7qVCVgaJRCE7iiY9tukTTyk+wNsDDyoxekaXNsmNL1M5Q=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(23010399003)(366016)(1800799024)(38350700014)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YCvcWhFvR6k3gzG0+P3r5O5UFO7rgEFR4Fkp2CNJOwiZro8MMfCh8Otj6iKP?=
 =?us-ascii?Q?ZwJSg88ZwZmdp2z9eHjWNniVMYCGjaFxTKpDoETYKJ/Jl8WYmiBfrgtuWjzX?=
 =?us-ascii?Q?aLdaJx1UluWxB6K3Cf8M2ydmo+vTK+NwwaLuNiWYIy8qIrOfKZ2LfolMU2Kn?=
 =?us-ascii?Q?mBAzB81y3noVoP38AEspionjcTbNiN5CY8X5XCdzmTHEoe6o20bUK9JS6u4D?=
 =?us-ascii?Q?lCX9dQ7FzXeTzMtk3b1aKI9URGNKG1YDyiP7JBGzwciuQbyVtXpEDwWJ0eCc?=
 =?us-ascii?Q?MRiHqf3cAUQFiC8v304FRVCMi1Y+NtL6Dt3rEsJrMCoB0Cs1a5E6QieTknaz?=
 =?us-ascii?Q?l28l6XJv3oz3nYYsxHkdkyBmURx3gVAOg5l39lhjyJlDqXlbzi77zIsJNJSF?=
 =?us-ascii?Q?6t0DqstBfO65yWVO/zN6sPHS5ToiHzYvhWm3f5k3jFYWSgVnt0CkY+vyGafG?=
 =?us-ascii?Q?g4mNyFbwxini/7AeKYxdUE+znr9MkncY8mpi/1WWm9HFmRvFPbe3Fc/kkfH1?=
 =?us-ascii?Q?0Upedp9CeumC4MXpUP7P0vlBwwngs47lhvqXvA/e+pfBs2K3AjtgdhDemogT?=
 =?us-ascii?Q?xQNSu2n8ofDzrzmACvnTsnzotiR3X5510oz3bPC5TTQwRro/8Fkv8oigPibK?=
 =?us-ascii?Q?ErS00nF4lHXFoZMrEwSOKQ4ziQUg70VwJggdYCASo3pKMQnxKJ8p5aQc1kZg?=
 =?us-ascii?Q?vlikYSsEzIuYYqBY4jtp5XUsGbH/cTlYaTIiEQDJz6XR3vNrT4byfLuRHL7H?=
 =?us-ascii?Q?HoqF529wvHms3CeaeR2s8gs4HzY+k0SiOcBSLaviLyYh5MWxCpntx4YvlbUI?=
 =?us-ascii?Q?zevy/N60t/KSWHqBRklk9u3GXTm022hoA0rem0WP3VhQIdqjOf2JJtYGRkyz?=
 =?us-ascii?Q?QCB/iR5oLe8ElNfxF7Otps+bGecSc+T99bmwErbOGRHEfj4q3w4RrzCH4w2N?=
 =?us-ascii?Q?NijqzPoS5H43tZQF/Nsw5c8+lqkv6tYBL7fU3V2TI+7QZzTqdFyTmvj9L1qT?=
 =?us-ascii?Q?qQ1ifqY/zBlBtLmb5hFvmDIalwRijGe3JN51AE0u2eeRUopXLieEX++NVegq?=
 =?us-ascii?Q?/t+quvGMNIBwOyX2b7tyaf9Pf3QW25Kl82VIkl8BOP5H2mrhD93ngXA5XDl3?=
 =?us-ascii?Q?wG8si1y9DTOM1ANiLKo0iystisgIKIxyHnVvPUuMKcmkHu8jvPVQe4o4H4Sd?=
 =?us-ascii?Q?FJfsamE1q0/H+++kXLTYtxVfahAlcFuI2jTCYvX1plq2zTEUwnpQd24kE9Kq?=
 =?us-ascii?Q?geWHq/FAq4PRSqVbWx1ooTh5+P7Rvjco3kg3stjC+7skBzQT/AN+wzEXW899?=
 =?us-ascii?Q?gYIho0oZvVl3TN0vxajL9arMpTqofwAYPmZQnd9TeyXkfPlYGZmlbHGF4ja+?=
 =?us-ascii?Q?jRlHlVZzfPU0uBDFVg/zNHztTUTlkYa2IkOpmvv31pMUBh4EQf54egZU7y1T?=
 =?us-ascii?Q?sOB8rXPyb0WoMUqWW2bYiFfSPIDI3eWANF241u22V+fbEBrcz/doGuPOS/a9?=
 =?us-ascii?Q?/xPxafrkcP7fa5H3P5+UyCkkFRMvTpg5GNYPOz4oXrxP7YLexCEwhf71MrGD?=
 =?us-ascii?Q?wvfpFDunNcdEHy1WIao3fdDLBwXO5GQMrBavTMuyyz0VMK3f9915yHM35lMc?=
 =?us-ascii?Q?DszeQAavqpaqcsUzFfi054xKWqE2+GKGD+JFw4gm4XnX9Y6IFCBNEVvj/Vh1?=
 =?us-ascii?Q?U7IR/QA6JSrtl6ZBgZLei9gAUL2C2QQg5WaMu9nDNtxuNPKJ6H9WejqZ4HbN?=
 =?us-ascii?Q?mcQqaBgjDEI7vVQNgLfMZpJzTN2De+s=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac2e4724-7325-423f-757e-08def41eb23b
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 00:56:21.0993
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CyW4+K8zCzWY/VawV34xFiILCr87RvHhCxBBoAhgbhlcADGOBiJwmumAMGGgWf8XSDQRN8MbaoqCGCfR195sCqxeNRXHwfTn5VBIEp1+Xi55VFGQN51XY/p3V8Yy8M6t
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6638

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/si476x.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/sound/soc/codecs/si476x.c b/sound/soc/codecs/si476x.c
index d87141ba84388..104ec24abbeb3 100644
--- a/sound/soc/codecs/si476x.c
+++ b/sound/soc/codecs/si476x.c
@@ -199,9 +199,27 @@ static int si476x_codec_hw_params(struct snd_pcm_substream *substream,
 	return err;
 }
 
+static const u64 ssm3515_selectable_formats[] = {
+	/* Hi Priority */
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF,
+	/* Low Priority */
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF,
+};
+
 static const struct snd_soc_dai_ops si476x_dai_ops = {
 	.hw_params	= si476x_codec_hw_params,
 	.set_fmt	= si476x_codec_set_dai_fmt,
+	.auto_selectable_formats	= ssm3515_selectable_formats,
+	.num_auto_selectable_formats	= ARRAY_SIZE(ssm3515_selectable_formats),
 };
 
 static struct snd_soc_dai_driver si476x_dai = {
-- 
2.53.0

