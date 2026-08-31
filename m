Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010042.outbound.protection.outlook.com [52.101.229.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 904443C4555
	for <linux-sound@vger.kernel.org>; Mon, 31 Aug 2026 05:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788152949; cv=fail; b=Bjafmi2t2Wcj+01OqRtNfPrinn/U/gQbY2t8xjpDxYAmUr2wSNnkjqr1x/na4/Ibcy7W1B7UuK8Tcgx7MoVG6UM3Rd87eoPAbQUu7p3NN1EEhjnxtSN6Ib11HRDCtZUicGuJ3dyZ/mMt/TyegpGKYgpBGlSq8UeT/5mjfSmSdDY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788152949; c=relaxed/simple;
	bh=F3weATu/KJU0PlEYuh9qbqjvoZHyY8XLg1b9JHYe3Vw=;
	h=Message-ID:To:Cc:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=S/6LFAmjoRUtwkyvpTUOZewypze5ce5g123TC2C6jjt0jJWlR0SkVmm1VkXqd581X5gP3NCHkDDNQ2Cx/fmhb45kjbeWhkvnmiAVL13anm7u7d1rlEZi/mUiqA8eAh06Pk3FAbHqqgUgPK9RMuKDPa3E+TLhrH008npfbWfolHY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=nJXxUPvs; arc=fail smtp.client-ip=52.101.229.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="nJXxUPvs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pNhPsPF0l/O9Mk/RxDuZFdghSn9zUI3pQpLa0gkXdihlr83l4rN6MEQLDgRPSrBXny2Sobax2VNTNl6MCtn91rza7kxBNWd7hwNs6c0COct0RQ8oFsHYPvn0vzx03B8HGqIr8zQKGSGlWEf23YmaaHEcP/+ohxUlU2fINtkRi6Ng8rCONtoq3tcA8cJGoASB8HGUh7hhYTx5U6a+mkeEXx6Ta2L6pnil35pYW6kAmwLTCz/tsbYMongYjOA1MkvbuAsWZEf1tCtNbi2kLW5dtG2aJ/CrNbIZ7f09Qwp2vhHUtPFK93rqTPrVHbf4wxK2EENalpaAGaMDc7NQPI5IOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UeDTiksyGwsTowv7E4Ae2YGc+G9bFSZje/7KbBJyDi8=;
 b=dnGX7CX8gTOEU+GZP39EP4zDxvBtJso5Gbph9Lp4XPuhE0LgvHj84DndSONwZpNccFQjhcBKhr1ius1erhvgXkkt/N2p5qMdlfyiKKt8Macpsns7dF/nh9BbIcZX8QPbF4q7pmeCRvQgfCkpacMGIY/fhMW0PKSf35iCVN4TpUxETw6L89eJvKPFc67vbWqq06XJRZoTGPU8bV+qW4T4GXyAzkAx/y0AAIAlN6wZzezwn/e9NEnYZVkCxBMmTQUp8snEa2A8d2gToc0Ipl47v24I8RnvGvPVhOwy1J987yZB/v/1Fk/oJUxrZaOy6voRnbneUrEYQJPyBY01x4NpFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UeDTiksyGwsTowv7E4Ae2YGc+G9bFSZje/7KbBJyDi8=;
 b=nJXxUPvsZkVCovexBNMHCbPZoYkRMDs1jlOzsWUZbnWSL+akKUayKOgGWGzZF9oG/TtzMUjwblhT6BYzeKzmGZ05sfqcDISJTJibDr72SztCGn/QTMwc1/BfMb25XC0NtAE151epo8xXFSQQ/5p3w4rQqyUiYF4LiX6TUdMmqP4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYRPR01MB16474.jpnprd01.prod.outlook.com
 (2603:1096:405:2ee::10) by TYYPR01MB12794.jpnprd01.prod.outlook.com
 (2603:1096:405:15c::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 05:09:05 +0000
Received: from TYRPR01MB16474.jpnprd01.prod.outlook.com
 ([fe80::2a39:9988:dbe9:894b]) by TYRPR01MB16474.jpnprd01.prod.outlook.com
 ([fe80::2a39:9988:dbe9:894b%6]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 05:09:05 +0000
Message-ID: <87fqzuub9q.wl-kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 31/39] ASoC: codecs: sta*: use .auto_selectable_formats
In-Reply-To: <87o6eivpyd.wl-kuninori.morimoto.gx@renesas.com>
References: <87o6eivpyd.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 31 Aug 2026 05:09:05 +0000
X-ClientProxiedBy: TY6PR01CA0027.jpnprd01.prod.outlook.com
 (2603:1096:405:3bb::17) To TYRPR01MB16474.jpnprd01.prod.outlook.com
 (2603:1096:405:2ee::10)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB16474:EE_|TYYPR01MB12794:EE_
X-MS-Office365-Filtering-Correlation-Id: 9788c7d1-0211-4598-ad8e-08df071dfae9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|52116014|376014|10067099003|22082099003|56012099006|11063799006|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	6QUKSz6MQk2XaI2iQqW5lpUvqz3L81PaSjhAC2lSfOJzWSue3Ws0OYTIFcaqUuy2FYq1A8lLxB0WSUhePMSBh6w7zVn6/7vnOJopnKhiGG1YfIJ8SUEqBStr7UCE8sYImeCyqNZzmDI1IAsih0d1rKXBPiBzbi8WCyyyDnJxQfF8fg4OdJN07yVghrlf06mRGjtc2JzMehjN1sDwBmE3yNUABm0lb2qJgx0MGVLi/oyZIs14vv7ScDa3DtPamSNYyl6tUjyqHHlLLLrHI5RCwcHuzgdg4YwABtn1Qoe/4vR1zz1T9aM3oZd26LPAMX91K7oGG4+VO0z7Iz2vhv5oVpXLH9Zj5FZWZ+YZ7Mop3776brO1kjiPSHa4uIIE/IjgqQhyd16fpmjpUpkltPx2zNTwReaKt7BO4LqcWxEY/ku9857ZxVBRaUS6yCMEY3qzC97dMr1dw/aTWMGZZR78Umth7HB26e1NUWyGkPLkgl/fruXJRCqpbexUd14f1miZgQzhpBBTZkco5hk8o4qGc1CeVYqr5rgcPINsb33pIkp/udPvf1UsPtJG5EwNnzAlew77HwfAf6O9NG3Ij3toPAGwIyPccwnIlnVr2FqOqLY2b8Fyks6U1bzX49dX5vnMMYzOxCNQlHCFiB3YxUReeiH3LcMIqLNqv3w+XK+e9ylYoYk42+wG4Wg3PuB9+R/ZdPhUFGipzUVVGJgXl3PEJTeFVbEt3hk0Q/suawNTUjo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB16474.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(52116014)(376014)(10067099003)(22082099003)(56012099006)(11063799006)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CXZ0mjBY7g+g+iOlCc7/thUqFGmmoGLMSIvICN9fgktuVhUj5iiPpNsv8Woe?=
 =?us-ascii?Q?gx4b9gbIoTNVmNm532DVzIZkB9OzeLkfBmxaEZaMxXLwZLVBEwlfHtuX+FSV?=
 =?us-ascii?Q?4VJu4lggLZTi/gbL9YEJvLGBdpXaX36HRX63cb63werPW0XvI8GwK9sFSgYH?=
 =?us-ascii?Q?NxoGZ8HnukDTEoVy28VRVyA7ivOkMA3TBvGXilr0VdswglptRTWymw0nm6f+?=
 =?us-ascii?Q?4Ge4tsKy/aYLvlymSqNOjP4lWLo2B/PoXV8bmdVsDfeoZAGESmxyGGX960q9?=
 =?us-ascii?Q?kf+xqqlgRLcxzQ8lgcO5GiH6ILaXe24gTcTelR2GP7YjJiK2VQmhWJqYDbUO?=
 =?us-ascii?Q?egZC8DsAtPUHxHAcNe0M/QNEmoXt9i5m274o/ihJB+TaTlHvYWvQ1lG15ZTf?=
 =?us-ascii?Q?Noh1YroROfdJQuO8ZaIyvwDl2BptX2iBUEk6QhiFqrFXQRMqUsxRooIAaRcv?=
 =?us-ascii?Q?qHnwpx0GH4BJw+ticSjF+1jc0vVfEoE3xIzwo1uTUSWluacQ+aCQ2Yq4YI2v?=
 =?us-ascii?Q?3HIj9XVf1lhanHzioOEaAKsWUujvqI3WskCB9TVMR1uZus/vB6xXBgozIqWV?=
 =?us-ascii?Q?9TWBoY3q8UjmGMPPWySWMUfLzj8LhGXcT7NZvNkJpWfGfN21ilhQpGgv2IZ7?=
 =?us-ascii?Q?7YLb3xVdWO4ROJgCrh5+2dwz3lfNRfohoKsxEn80eV4diaTLHCX6P9nmIdxH?=
 =?us-ascii?Q?6fmYvp+zvvYuH8eDVAMUftR2MMCvIcUyjcGvo7xo5timPEGmYMQD5cyoR0t0?=
 =?us-ascii?Q?FFp7rNII0EuO+3XKN4p4WKhQjmGN44/tAnUJBPCwGzI8/G1Ui3UcCcOeolR7?=
 =?us-ascii?Q?AgGeLygrOxH8B/l6batyhNnhP3weOcpUBBEOhOgUrYrSHs+m7yDriwzh0w7F?=
 =?us-ascii?Q?X4jb9fv6/jl7ZokIbof1WE0ocu4Ormc9cS0s7t36nQRw1RXtcaD8EhjmXxf8?=
 =?us-ascii?Q?MGgqQjAANoCzLkR8hvXOtj2cfy0RM99nn9Pw73212h7OCObuUCq5LqEBukah?=
 =?us-ascii?Q?Ss+A6u265hVkRZdWPvG53tMg3fC3Weewo00t0WWJ3K0aaXObxP1ZzrGgoOjd?=
 =?us-ascii?Q?DVPaOLoF5eLq11KLmIz5NHAIOwxU4Q9CLEsyHacVJue7MNddqlZpsjf3DgKe?=
 =?us-ascii?Q?2+3sjx8+Mcw8iQ48rVY7o8HE3bQcyoTZbf0Vu8pbeujQTrgTI1cf2edwKsgF?=
 =?us-ascii?Q?0r+ytzZkOMrA7xDjXrieSFkYSbMlSoaeFEf6yxwUqdzk7iN5K7HcEyCB3+mY?=
 =?us-ascii?Q?oJ0hJqVlyqtgeJM60d3h5ZkcR56MNIQk0dBobbUlCxhb6LKl0pnYdWNacuHx?=
 =?us-ascii?Q?ZOTMVloMub2z1lJUxWPBeawDoRVMJQpLjtHyQzhwcBgeRja3R0RGmm8dz4Ga?=
 =?us-ascii?Q?YNPd65aHbTd9NDrLwdgU+c+p1CU1URpoYM7UdCByGoQD3qMEj7k2aqFxgecA?=
 =?us-ascii?Q?4CKWPo15aabCOwhixUjd2wA3+vf01zudZ78Od1pKJ1Eia0zNbsec5aigzpMC?=
 =?us-ascii?Q?IWnnqGWAVdA2vpafVJrJU0vHyhNqvXtDCHO3wvKtm17wefHeuiCm2t8RZQq4?=
 =?us-ascii?Q?g1lMZ3NnPWfjqQWoHzPrDYAXPvqDAcL7aCINR6IC8UsxdWm0TI3JSuvXCWaG?=
 =?us-ascii?Q?BdSfTZolRJXG+e9kZHJMED0FtBxyCKZJ7LHvmJQw6mdFv7GOnvFLSMH3AR6I?=
 =?us-ascii?Q?yUv83VsNA31XtLM9dA2R5DlZX7c8xlaDrLzqIgiRzRitFppj1GxpDn6rfjxg?=
 =?us-ascii?Q?1AIz+ruEZluzKJkdpm/VDeox54vDdaU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9788c7d1-0211-4598-ad8e-08df071dfae9
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB16474.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 05:09:05.6130
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ffEvp5+yXSzhfox35pFY0hcLlUo4e6vHTNo2w+VOusl8Kzv2vr0lnPrNja3boWMrLu5BFWKV1rVwo2cz/0NzUuN4yR6XvZL9fWNiRAMs3zK+dsWk24/yrewgFfNkwEYq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB12794

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

