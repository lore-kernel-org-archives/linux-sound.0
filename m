Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010033.outbound.protection.outlook.com [52.101.229.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A91A3C4555
	for <linux-sound@vger.kernel.org>; Mon, 31 Aug 2026 05:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788152941; cv=fail; b=CdSAodqTV0rsKm+epmc4rqfK/X0v9ghIuv+0itM03jEltTf/bGDnXSbYrpNMQPh3LlzUWbgOSID6gmC3kUUndSFHX3Jn8SqeQikyuv7JWUEJinlpA+qLB1s4MRnb6avLxX/Airqf11N+yAUlsU40N959oLNDqQgj6QxWQECqzU0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788152941; c=relaxed/simple;
	bh=k2eLtvpB4o2gkBXoANF6wq9q3VBKWhYCqvDHCbQrl+U=;
	h=Message-ID:To:Cc:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=sep+9RRF51pgWEq/rfRceXue0wfMXEyywxM1HSwmzYzwfCfxxOP+XNz5x17S2hXeRSf2xhpQtZ5k2QJ4PL+/ike259AY2OCa47KYCh7grbikbGJst7foCSX8WKnhgwI4PdUkTnGX0wnj5BlW2eoyFCfbXrJFk1bo7cMOSNZ284w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=VrCulZ+P; arc=fail smtp.client-ip=52.101.229.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="VrCulZ+P"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M4fGi3JJBkh0/g7GyJyF2tUOr8QLKqgJaF/puT8zndrzZ8YaKkV7f6fVEcl5yzCRNxrQ+m+Zr206UIveKONNn+ejWWE/47f6RYRSc8ioebDCZWMf5oujbJ+D6bKyhjVpVqjfgdRFSLLTIefmEq2c3xmpGNRFL37+Z8dhMnqy+o0nmMTuAn0lmGBya/e1I5VvM23W4sZHmJ2JeCaBf6TQs7aeq5HroopHovNYYylDi0GDPBD/e2xwo+l4/XQMvLLb6Of6WWgl88Ymp6MstKhEaejEtG3yZo8AcTgzxTPcTrHyo+kSAExJkLbadQgTj6qoThJ7yg87F0m8VpAhX3MIsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h1sZC8dGwyWCjxljvmMd4Fd84wsBFEyjPZuCYUa4W7M=;
 b=lx4zhed7Mv2P5MEYrLDQecWkbVYSB+HN0Vrn7VsVeXe4AhuQL9Rdq5tdcMNN/VsV2+Vn6P+uDctwoZ7Bsy7EXrtctapVmscEpqxc3NdiJv4KnkYzh3jjjafh7BgLwpa+QnXQSOlySw6qwKeKCIDKKN5MbEcA+zMU10J1DybsJcAE/cG7BngQFE2vDjZkNWr4e6goDUU2Ljam8fs8BTTkexEPk0uoFchJoqZX6e8bW03DMRptIZlDnE6bk8A5JtmPUapPLrC4XU8VSBDO4n+qRea/JFfNrusapb0UOHKu1bcBsQUGe7ATdpFu+hUVodxHuu03pFu4/i27nFBG0MKqiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h1sZC8dGwyWCjxljvmMd4Fd84wsBFEyjPZuCYUa4W7M=;
 b=VrCulZ+POWP4NalTTvxMI8kmvV2J7UBT5QLFxNzZOyc8h8aVXZ2rSt4GYEQIwkV8++f9eNygh1pxFC7wJrCyNJUCpT75JygTMJG1XH7DnWj0c7wXeEQgQZe5Bm5nhei7wbZp7kSgFZ++ll9MlNQVu6YbbXXfQAX9S1toVEwINuQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYRPR01MB16474.jpnprd01.prod.outlook.com
 (2603:1096:405:2ee::10) by TY5PR01MB18382.jpnprd01.prod.outlook.com
 (2603:1096:405:3e5::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 05:08:58 +0000
Received: from TYRPR01MB16474.jpnprd01.prod.outlook.com
 ([fe80::2a39:9988:dbe9:894b]) by TYRPR01MB16474.jpnprd01.prod.outlook.com
 ([fe80::2a39:9988:dbe9:894b%6]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 05:08:58 +0000
Message-ID: <87ik4qub9y.wl-kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 29/39] ASoC: codecs: src4xxx: use .auto_selectable_formats
In-Reply-To: <87o6eivpyd.wl-kuninori.morimoto.gx@renesas.com>
References: <87o6eivpyd.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 31 Aug 2026 05:08:57 +0000
X-ClientProxiedBy: TYCP286CA0243.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:456::17) To TYRPR01MB16474.jpnprd01.prod.outlook.com
 (2603:1096:405:2ee::10)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB16474:EE_|TY5PR01MB18382:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d9598c2-5cd2-4d86-fcbe-08df071df677
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|52116014|1800799024|366016|376014|22082099003|18002099003|56012099006|11063799006|10067099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	zrucNspqMms9iyDM9jLhI2WvNf+b5XwoKY7LjNat3GIbIxi7Ah/3a8yOz2+WaMk72h13jtV2AfCn+GKTOIBohx/kn+QdbVfEMT7HOy7BNwEmzYf/nswAN0NKpQnmm5xp68UoPIorn7SkoBVh3uzy5hF4n5UeqTBRe0xt5aQ1mpwDgXUT9fsYddSMHiM3FnGi3+TouIZ9VKEnhzl/M5p38r1d5lAwQO3D14N2u2IbRb7m8SkptLX12D4gw7yAIAwJZ0cpHLWjVWTJNHsp0rNOPT6MZ+xrxOOi4fwLNLLCok4A9p2aIrgi1vKuuy9G5/RKR7EIViIS31NJtrtMkrMuTYGObCbqTpvwiFXqqab/DdhC1Ku/dHsNDMBLu7pJd4KQS/Wecpd2ftc1QLR9GKQzZFpLUgPI1/jUtDZkObrxpO/UWiLmImPSB9IIx6ysKieBje4KGUL756HzqX7MoW9+Dr4i0I98J/NPqb/1UUlWZhAy9J1TUglufjtdVZDKK1HceZffU5U8YZVHt6iPRYKbS9UfV1L5FU+K6pk/ez6z+JcAiL44QtbeWRVhlOtX8dAozyfv8KGLVrxPzOgPRSpC4GntOQbIqmSGz95BqgIN6tKNwYod0P4hFmWvae/myXqWTgWZigjUsmVfzGHsVxJje7WHwekNe/McTxgv+/L2EeNNowUgd0Dalf0jKx7D+4EMMsYqM9uwwb66QsgArI8Jt2+RookEXHEe69duby+KuQQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB16474.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(52116014)(1800799024)(366016)(376014)(22082099003)(18002099003)(56012099006)(11063799006)(10067099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yev8ubACB/CDLO4vCswif0pt/WfSXGXr3MJG7xzYN8QsPs/JvyLWqIM6AmTb?=
 =?us-ascii?Q?FCSPK4q6p6w/5Swdec8WMvQDc9O+3Z1Q4dECZ2VSZUF2cl2Z0/JsEwmNkMRx?=
 =?us-ascii?Q?7VSRKQ3E/c8voAjKiYnL4bJdYEwYzMNXwmfsECi5sjyxR6dNkxmFp6eBAoCj?=
 =?us-ascii?Q?SYhmPbiowyicUXC+Efxk08fI2as9r45uNY9uAKJSQ6+Exyms6+sBL5joEZmE?=
 =?us-ascii?Q?xTSudBGujmss7mjYMj0lPujj9gcELomFq5aLrgcZmn2O/rOZdL7yn0D3Y0je?=
 =?us-ascii?Q?mlFmxVYQ1PuMXjevyJIjwnT/XkLLfu78TnONqtZc+7auxEAI/k+4LbJvqluI?=
 =?us-ascii?Q?pO8rqculp5NmCRvQND5zgovcjHzgJRck1lKkku49MEDa5UdU3+ld7cQ7UJYr?=
 =?us-ascii?Q?73NiKNzLQkhDTJ/7YhpvqOmUqla6yi4sx5Ed3G+eNwjsWti9m9xOJ+KYPq4F?=
 =?us-ascii?Q?Fs9z9O3Ai1YDEI1aOQE3IpPKcCGdSQazGhYUtF+FF3TpkOhio+9JFZ22aHKm?=
 =?us-ascii?Q?M+3tJMv+hh7lovp8W2RgO5hbeHQTPmX/v4rLdzjRrM7WMVJNJlidSrcOhLKl?=
 =?us-ascii?Q?eVuP06VCngeRoaDKXMgYhGcaz1ViKQ+mPsHhiO4qz4+kjOZe1fg6jtGBW+CQ?=
 =?us-ascii?Q?sSfbCfy8PCEonbamqsUyOSnmT6RnerP9nBnIi9PMi69N//ntARujqufNlGmD?=
 =?us-ascii?Q?2s+R6oySfMIepVUs05dH141j90iscng0vqaJsTd3BTO5J7fmr3MwOs8xQuO6?=
 =?us-ascii?Q?Cxb8Jw348/QheVjN51pfOVdLMUXn5bcjdFbrVD26Xhh87idDgjYSUncsTTXn?=
 =?us-ascii?Q?sTcO1MXr+SYTrdM1O0dIbXZZs1MRYyjXFBi8XmiQGYwuiU3fAaQxQw1gqwor?=
 =?us-ascii?Q?yCqQA+R+xruhyjo3iY551dGv4xgyHADkyVs5RSlBXiUaFfghyLt1jzWqIj7U?=
 =?us-ascii?Q?X+j2A8LMiJAUBcPM99PbYU5yk5SBQvaviZOdFweEN5gZ+xxrZnPLMAXM9B6W?=
 =?us-ascii?Q?e1Ifj2YJAw1evID09fVgangMSOjsxotTLI+GIQtCZs4OxaEW6xl1rSrk1P8E?=
 =?us-ascii?Q?HFj57KTuqls7Hc23JgzRPzUvm1m5zRZ4vm32N5AuMJaaVRPdhe9V2p9eIaKt?=
 =?us-ascii?Q?uNYvM9Wuec8YhHnrPF4UTxOJkkKLEfa9EgkyVpcrE1z3X/zy4FoK6LTDn2Jt?=
 =?us-ascii?Q?IWwcD+6LxG/8KzxC3hk3/njX/DIUlWx2XXU4yNxicmovcNaAfssVkdg2TjBQ?=
 =?us-ascii?Q?mIH1MXh73KBcJA9vtRd2Y6SxeN8GxvuJ+rboFGMJBqSQWth8s+94toreg1v6?=
 =?us-ascii?Q?R7K2dJWrR8QNRcouo+5cXnvFO7gU85NBJkg5tagkJeBOKYVERoRAedmG8ii3?=
 =?us-ascii?Q?9M3gmP4xq99SvtLr4OLEOAXoHlrgVBLQaAUOEs4h8QA4iI6dKyt/qb9ZRnac?=
 =?us-ascii?Q?ralhcQDyVKQTWd+FQ7bMy4IsUwLZawTY/Wx45gnl72G0dgOa9eJxmikDxpSb?=
 =?us-ascii?Q?LbDNpVTHj5mQ2LBPrsox7dY2VeSeupCFLGwg4DO3ov7nRq/86+l9IAyEdIG5?=
 =?us-ascii?Q?UAj2HIKYDfj9Usrik8JWOvEL8AEEitJ1Jdg6Ot7XhM6GWJCeRHKGDl/a38ez?=
 =?us-ascii?Q?GcKXE/Uo8Rg9f8bdEI5UMOVZn4xGCAbMKy9HhLMrrh3OhHs3Cz1ZDmhKsjX9?=
 =?us-ascii?Q?ltOFS2zaNzdkhB8TRZrb7eDEEkviri2DkJo6k1ozWpU41sm4XpWFakp4KMiW?=
 =?us-ascii?Q?c5a+l6rcoATO98hsfCEGT77K10DQVEtETYQnWHsFjh+CYd1/k4a5?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d9598c2-5cd2-4d86-fcbe-08df071df677
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB16474.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 05:08:58.1822
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q0fGaNR+ZWB5V/gg9n+wt/Qo9Tazm8j2FZcgLxtsK3JCtmlJ+GdKK0IvrNZ0p94GOeWyqYe+X7DfNw/D6PpfsqBeyKCaPLlE9yB8wvh4+9Ug95M636LbUuP0cpHs8503
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY5PR01MB18382

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/src4xxx.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/soc/codecs/src4xxx.c b/sound/soc/codecs/src4xxx.c
index 5a34894752251..6e187c930372f 100644
--- a/sound/soc/codecs/src4xxx.c
+++ b/sound/soc/codecs/src4xxx.c
@@ -326,10 +326,18 @@ static int src4xxx_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 };
 
+static const u64 src4xxx_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF;
+
 static const struct snd_soc_dai_ops src4xxx_dai_ops = {
 	.hw_params	= src4xxx_hw_params,
 	.set_sysclk	= src4xxx_set_mclk_hz,
 	.set_fmt	= src4xxx_set_dai_fmt,
+	.auto_selectable_formats	= &src4xxx_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 #define SRC4XXX_FORMATS (SNDRV_PCM_FMTBIT_S16_LE |	SNDRV_PCM_FMTBIT_S32_LE)
-- 
2.53.0

