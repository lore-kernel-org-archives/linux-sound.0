Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010002.outbound.protection.outlook.com [52.101.228.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36563248F7C
	for <linux-sound@vger.kernel.org>; Fri,  7 Aug 2026 00:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786064204; cv=fail; b=U9s0nVj4eBO+OagISRDJFDLQ3Rs9RArRrNXuxOax5nWHFvb+l76LUvuScN3A4vMfXBPJ5O+eNLs+ImrEwfPtAGaMBdeyNkDPOL0PKP638nUwviAIzlEytTNAxRB+vick/sRKzQA/BATpwUDn5cppPfWayQgB1M1aSQ1Ct/UUECs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786064204; c=relaxed/simple;
	bh=F3weATu/KJU0PlEYuh9qbqjvoZHyY8XLg1b9JHYe3Vw=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=O8D5BfbngsLqQoxUyc78lwlt0o3iVhFq8y+nTq8iZVvrwMbFnjdXsUCUhFP/rs2Qnh7+85GvUYQJsp9uysxobZaWLUo+2kC2zfL8Mw4PebkDPATdsc1Bi1u61j15D2tw2ahGElPSPtqacZfxL07zbVA5QQ0sRV4OE+3JLSW+Rpg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=pjmWH1o1; arc=fail smtp.client-ip=52.101.228.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="pjmWH1o1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C6Orlyoy77+cO6Qlo0wsgNs3yuF+pagmF5JWqquRD430vxteV3qb7hn/MZxXGsFhvGo2pEmjRoBZcKqgbbL1rsSk3J4QFtqlxvudxyD2XS9wfmiR+j4daLDC8oUVquil+hRV3z88fPm25NdtLB8BB38rxmCszuxqdt/vGEHZSGB7/yiwvyxOGpbt6pdkvn5HLbohPO2fCUlrcvkypY219lvFm6leXwA1o/Me2I3sZGzUWSHM888XDLw09IPWA1it9wCfKVKSVtuEQc777DBwvtjXx4cwmoQ5MZtEemkZAPnujR+FOYMV/CZ7Ma/MC9c88wgMw/Rb7IRGOH3AN5Dsww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UeDTiksyGwsTowv7E4Ae2YGc+G9bFSZje/7KbBJyDi8=;
 b=SuYF3b7M2ZtimlaH/qrUKoKWgDnBlEi/qgiXeWrysqLuKPyod5Fu52dOojBrOiH/73oPqxZAMeVnwdRZCr3Lf/k/GGp6DpZNsbFHb21+ixmT0Ga33MHD1ydnCYTx55gfT/YJ0JlcZ/BtdxdGhc9LZyiINT6EtJSL/rW/RoI/9etepvGOTWa0X0tx0k/dYRQKYZqanq0kWD/k9RAuwCL2mgDim21tr4ngIvZ5mQXS7eKGQXZBAy2VYMXOCrop3yUAkLpHnrveo2WFEoybLy5AMSX4VUtHtOWmO4GMqPe6+0pGij/K2Sw/NPn1yiQ5dIRV4zdtk+c5223luQU1l+Y3uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UeDTiksyGwsTowv7E4Ae2YGc+G9bFSZje/7KbBJyDi8=;
 b=pjmWH1o1noQKGvq3D3GLYT9JM23UPqkCKn8I8sf/bmw0dW5TP4WnaDiVmRiaQpAoRfU6GZ5mDke9AoIfW8Ioy/wlopu/6Oss5amhHBIaRvkdiGBzl+xBf8M2TXYm7DAo6ADVH2nZrAtAuWlvIF5rRt001V4TOCuecoX9IK4iebs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYCPR01MB6638.jpnprd01.prod.outlook.com (2603:1096:400:9b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.23; Fri, 7 Aug
 2026 00:56:41 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0292.022; Fri, 7 Aug 2026
 00:56:41 +0000
Message-ID: <87qzkasq7r.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org
Subject: [PATCH v2 36/44] ASoC: codecs: sta*: use .auto_selectable_formats
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
In-Reply-To: <877bm2vjjn.wl-kuninori.morimoto.gx@renesas.com>
References: <877bm2vjjn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 7 Aug 2026 00:56:40 +0000
X-ClientProxiedBy: TY4P301CA0062.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:36a::13) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYCPR01MB6638:EE_
X-MS-Office365-Filtering-Correlation-Id: a060c7bf-a88d-4408-2587-08def41ebe11
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|23010399003|366016|1800799024|38350700014|10067099003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	hzZ13q8sabQ82kdOVavI+ikYaYVBLq/o3gs8rs2H44yucSAWxABjg4HC11RSLKlWZLMuG4B0inauas5T7xaNziZS5Mcyj4wuRA0NoB2DrItWaisAFQYMrywnTfOZcDavvkXWXHgJLFPwYPewKKqSkm8kr6Rypw59nWvmtEQR7WzrZeycd7HtZrHO0/8L+IbIPu7zdxNrJ4zEtu9950lDAajsRvTYYJnYHJLrCDE/ctsiH2nzEnFNyEjJRaCAZgfa2FrGlDHPgEAITBkLLoQ8IR3cEn26xJjYxT3XYIV3QTbI9ibPrpLMDT8KIJwzrmsbSR31k6vcng+0Fs6MsRbKWYn8b8EGS/2V9oXH1ZcXrFlBd7ojv3IfPp3MraWVI2fpoYPTk63geWy8uEJeU4CZOQzsGM1fvFZk8vqDLHnZZKl/+4AZ/Vs53xe/HbjpGzku0FKkxaxbCK7kfL1dTFWeest4HnqvWJyQE16DHkGacFdjbOU0Q4ERLypRPlTlscQQoBPU6LFRDNECmiLHvTq0Yuk9HevcQrJa+mWqH18lNH3hFJXlShZIkiRClX2y+GyabYy/TrW8keqX2ntZ/reWs1oy2+O7b17vNsnfjGzAy1bBWaA7hLSZBVPI3GrGdeY3/TvoVFXD2FN39xx9PWwXZUpV/4mUEm7wvvxLvm6y7lDbpSa7yIgAqBuPwi7Wdq2icTwcMH86T+uXIejUagHgQjjTyfZQLk2Gg/pIjw57NHM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(23010399003)(366016)(1800799024)(38350700014)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?w2DFJ6SkHyhCzKzKaAn3BxnyjUAi9WUKS/7BsDFH4F5eGg5Bh7KQir9mKv17?=
 =?us-ascii?Q?SBJ2BPgHhBBI/dh9nGUBQ65D1bQT7S4CKrB7rJU5yQ2jvuFN0zU0PFdRzw7X?=
 =?us-ascii?Q?DMlenLlZz2e0xx9mHB6v6yTOGFmoenpiV1xITxP0S8GhLDBw0GJL0Kigj+n1?=
 =?us-ascii?Q?Vejh9dReT1M01zsV8vHPyxkdL4l7QCvHzsMGz0adNjYJtqjThkL8eQlHUFXH?=
 =?us-ascii?Q?bSRAIEBjfQub4QM8chMx+cR/Gn5XghL24aQVcZKVELIXLsUWdbcjdXA/VD9Y?=
 =?us-ascii?Q?6v6VTQfAAwmvag+lkhxbvXtXJoi2D2DOWfkMT5mKt1i210dxcu3et4NBe+ou?=
 =?us-ascii?Q?j5S3AJaWn5O6gGz+FFyefclqOcUc7zumIDHvoKBSZ2Y/LaH65tUBkfAi5CzH?=
 =?us-ascii?Q?dfLNkIcuvN6STc5Mdy1vrIGZbb3YV9Fj62fc+scU1Z7pros4hWBqaA+8RZJe?=
 =?us-ascii?Q?gJY/w+m8F+EaDq37l7dPNBsKXJ5ydOgRu0GUUs3m25F6Syy8uSwih9EB851K?=
 =?us-ascii?Q?uddL9ULSoWe9Q1+1Oy+v3JI/r3tg8hymZ2IBcLZ2FNCGcSdoOUkVU0E7RM+X?=
 =?us-ascii?Q?bXzks1I+lBztoqErSi2sXyDbcHTwCu202MPlryHcOtp07jH5Nup52/+TVjj9?=
 =?us-ascii?Q?ZNZmnyrnPjAu/GKk+6j0ejeNHrPlNzbLxNQSJKPC3wdjJ7c74sIUOBjjvJ3J?=
 =?us-ascii?Q?flsVY++YFmJaDiWj9JFxLzgQ/Th/cDy7n1PMIgk6q+JWKY0DUIKY3M5Yky0p?=
 =?us-ascii?Q?YO8jXyMO6qye7wF21AfPzCQNP8UoDjLMy7GKWT4PjNT9Kd5HZtslxA6sjEjd?=
 =?us-ascii?Q?jJkwzwsyXujLZgMnuPZJkfm/SdxMzX44XBx5n/uPkAk+9iPDfuXxC/Ciyjx+?=
 =?us-ascii?Q?sRfod+aON+MgGhnRW4GI8cJ9rp2HdBPmLWvyjWDz8dhunfNPnLfntr+SPxCN?=
 =?us-ascii?Q?A/oZ+r+jILNt7o7j31nuQ7s8GkU0iWyZNyIbo1lLGb5gmjtuRySnyIom5Cta?=
 =?us-ascii?Q?Yh0cuqivhgcsP08/+s8ZSjVRyrY9OlKGQB8vm2aqmP7qG2BKy1Qwd3aIuK+2?=
 =?us-ascii?Q?rbVGNuIYaNELvl39pBMUd3jO2VuFSTg32MKi9Rkv/rMCAYKcY4QxnLLVEU3q?=
 =?us-ascii?Q?RhczilVFX8jjFDePwXs/uqdEqtOgeT+Y67tZXYUREEmMtlz+cPZvSOwcy8Cf?=
 =?us-ascii?Q?jbICotxbrzJBZ+SEytCenWB/1fi9DGGSihQOmqyYzfOTsqp8vjSpd6gExclr?=
 =?us-ascii?Q?2qE/lSwoy4pxemFoOfbX7zVXOvjYIt/PWXrpDtaYcxZmVe+3QacCo1SOvcEx?=
 =?us-ascii?Q?LGfqxVz8stxKXM01NdNv86jsemQpmBQ1BocSR4gfTh/tlB8AhO7L4MwJcvga?=
 =?us-ascii?Q?wOWCY1amYHIV0MBgtuAxAfMduSBVBZX5vp4V66xjAl1HdaCeqgKm63XQ7HqS?=
 =?us-ascii?Q?fr6Y/Zl41WrW9QYcZ/jpDf8YJaCfsultKl+3c0yQl04qQW+j3rPAoPwTdpk9?=
 =?us-ascii?Q?OCxDe4hYCcf/L3/0g8elu9/OzmIdqBs9iwWtlNQGHnBEdS6e5jWb2wQcqjGk?=
 =?us-ascii?Q?pDtL5YZWHS99khXfeT8s8Qe0GolDKCG59v72NIEOyrr4LQFABMxTPWWvZqFA?=
 =?us-ascii?Q?PIVvBv+/Lqj0EBtW3rbzDj7FN+ilr0Yk47AnxWxMjM8M+Yh8WM/TztLT5nEH?=
 =?us-ascii?Q?MLsKGKZMQ5MZqdQY/ykcT3HfDVtvwVizKdGJbWuk6AqA0MqIUgijM3WTUjo1?=
 =?us-ascii?Q?2xUtixk1nuV38SxbOdUgqxAKFf5+0as=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a060c7bf-a88d-4408-2587-08def41ebe11
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 00:56:40.9142
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rVvSy2TwC7Nn8rUwUgtXhOk47WdvKyNgspQh2LAvVGt40+YLOkzvCXWq4eA1sh0xI+ppBNoQjJPze51o7xLHaBNqvFG59yAsdoSDp9jT4NBuD5N6vFG3L9svhs8r+ods
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6638

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/sta32x.c | 9 +++++++++
 sound/soc/codecs/sta350.c | 9 +++++++++
 sound/soc/codecs/sta529.c | 7 +++++++
 3 files changed, 25 insertions(+)

diff --git a/sound/soc/codecs/sta32x.c b/sound/soc/codecs/sta32x.c
index d6de739212f92..9a9a68c722cd9 100644
--- a/sound/soc/codecs/sta32x.c
+++ b/sound/soc/codecs/sta32x.c
@@ -848,10 +848,19 @@ static int sta32x_set_bias_level(struct snd_soc_component *component,
 	return 0;
 }
 
+static const u64 sta32x_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF;
+
 static const struct snd_soc_dai_ops sta32x_dai_ops = {
 	.hw_params	= sta32x_hw_params,
 	.set_sysclk	= sta32x_set_dai_sysclk,
 	.set_fmt	= sta32x_set_dai_fmt,
+	.auto_selectable_formats	= &sta32x_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver sta32x_dai = {
diff --git a/sound/soc/codecs/sta350.c b/sound/soc/codecs/sta350.c
index 2ba35076732b0..d6d29d291081f 100644
--- a/sound/soc/codecs/sta350.c
+++ b/sound/soc/codecs/sta350.c
@@ -882,10 +882,19 @@ static int sta350_set_bias_level(struct snd_soc_component *component,
 	return 0;
 }
 
+static const u64 sta350_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF;
+
 static const struct snd_soc_dai_ops sta350_dai_ops = {
 	.hw_params	= sta350_hw_params,
 	.set_sysclk	= sta350_set_dai_sysclk,
 	.set_fmt	= sta350_set_dai_fmt,
+	.auto_selectable_formats	= &sta350_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver sta350_dai = {
diff --git a/sound/soc/codecs/sta529.c b/sound/soc/codecs/sta529.c
index 7d57999f9cb13..0faf439ffee9b 100644
--- a/sound/soc/codecs/sta529.c
+++ b/sound/soc/codecs/sta529.c
@@ -286,10 +286,17 @@ static int sta529_set_dai_fmt(struct snd_soc_dai *codec_dai, u32 fmt)
 	return 0;
 }
 
+static const u64 sta529_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J;
+
 static const struct snd_soc_dai_ops sta529_dai_ops = {
 	.hw_params	=	sta529_hw_params,
 	.set_fmt	=	sta529_set_dai_fmt,
 	.mute_stream	=	sta529_mute,
+	.auto_selectable_formats	= &sta529_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 	.no_capture_mute = 1,
 };
 
-- 
2.53.0

