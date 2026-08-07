Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011015.outbound.protection.outlook.com [40.107.74.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 273CE1CD2C
	for <linux-sound@vger.kernel.org>; Fri,  7 Aug 2026 00:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786064024; cv=fail; b=Rfx8pfSdXpFwYQ3GWM7CTh92lhmi9uF3Ix4bnl8q4b2JN9L6qbEbMvj6MR949QT1KCMkhUgBh0dITAC+oS90yTqrIWo3U72FwWCb9/aGJjuLPkKm+OHCUbNaxLDZPRBOFAGKZZQdoz5q4oNH7xdkRBiShbw2kohOixe185OCnPc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786064024; c=relaxed/simple;
	bh=LAZhXE4mYEfHlJj20TIaE1hXyQHb+VH/yoF9NEIG5dI=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Nt3Cx6zCCPEIlaDC8xeAdh2hTC/SKOQwEjKXvg3a+v+9+UGdlaLHkRVGuCjVNQt+wJlgabdQxbPLHv5XOnoDGyMmltUDmcunz5ZbJv74uZtAAVtsyzKbmyQDewujMyH/hl+6dwxhrWsCxGMcgmuZbbhl9nYmgK0npy73QPj325A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=UtBSy6BZ; arc=fail smtp.client-ip=40.107.74.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="UtBSy6BZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=er8ZRyb78YuvhX+NKbM9A+1y/qEKhv01MVyZGtcG09/XlcT+fuOn+pjcyVvCtWSpIzDEOpvv8nbSeTMFek45M9CG4QFAZkt1T76CgcPLnejbzEf7ZtFtAe+OdkT1ME3W0p48ncAwnf8pxwnck1MzxayJ/j05yq0RD+V/bJDbl8XIDDrNiVSwbR0HhDxsKiuVeqy72LnHMceP7xMvDYV3c9qOqzd+yxzrdahxCb0u6cs4NckzUgR7/SorVZJyQvY2lD+Fn4W1VPaRH2ZimnJqRz6anBm8nmxYBAMCUuQ7zxFmPOHqxCbmL/rAW96UpE5NPZNpNi9UqAOa7wE/t3J8+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FjTJGNhEtRo3+zGQfkWLuTcBg1lD27Suql9M9mXZvVQ=;
 b=GGVLJNWH2s6GTn/2kXeLzkNk4MDfP01GIvdCNZTM/wek8xkxKhbj+EW9FDZqozh/iN/5FSD1NDieSQQADRKZCfjIUa0Be6V5gnq0zXsfP9xUzxAifIxliiCfpEOn7SlCayDLExvNDfQyXjOtFAak3c9TYXM4Gq25OTMNm8Qzt5csjg+YWy1GSnb628VSLrCGWvuiqhyot9Ji1Y4hjiZqk0egd+PBLjv3PFUziIf9AI61TmFiJJ5hrA9/zKaha4GEpBjuSpXMqXln9wuky/RnvoW/NuijKZyqWwTY5DhTpERSMx0kbt9iWDLuXD2QMVSNpzYDVRlTsvC2/ktElksbIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FjTJGNhEtRo3+zGQfkWLuTcBg1lD27Suql9M9mXZvVQ=;
 b=UtBSy6BZps/0TkjazdxIKVzud0RR9y+gArk1eeXZmfhmaOrUHtUqAXT1TwyOhq3Fayib6G35YwEJHTSO0wL5UXTNbSTCWNDe1faRiS+eBB4hkfNMJGuta78ANwCc3F8jMIjdsViIafOnHxYqPYoFfIowwlXBkjVjGrd6ECpvbwo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYTPR01MB11044.jpnprd01.prod.outlook.com (2603:1096:400:3a1::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.23; Fri, 7 Aug
 2026 00:53:41 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0292.022; Fri, 7 Aug 2026
 00:53:41 +0000
Message-ID: <87v79mu4x7.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 =?ISO-8859-1?Q?=22Uwe_Kleine-K=C3=B6nig_=28The_Capable_Hub=29=22?=
 <u.kleine-koenig@baylibre.com>
Cc: linux-sound@vger.kernel.org, =?ISO-8859-1?Q?=22Uwe_Kleine-K=C3=B6nig_?=
 =?ISO-8859-1?Q?=28The_Capable_Hub=29=22?= <u.kleine-koenig@baylibre.com>
Subject: [PATCH v2 08/44] ASoC: codecs: alc56*: use .auto_selectable_formats
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
In-Reply-To: <877bm2vjjn.wl-kuninori.morimoto.gx@renesas.com>
References: <877bm2vjjn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 7 Aug 2026 00:53:40 +0000
X-ClientProxiedBy: TY4P301CA0018.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:2b1::16) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYTPR01MB11044:EE_
X-MS-Office365-Filtering-Correlation-Id: d9083990-cc86-4451-17f2-08def41e52c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|23010399003|376014|1800799024|366016|38350700014|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	jFDjiAgzOsER6trc2D2d/4jy6v4wUXgxj0OVY/9f0dcVFE23D6tYt2GImlBWNtVdi2EJ+MZrZLRLYmyp2uNqkCuBLUSsURfAwfxJzUJ3IX+x0krZ27/5rCzxaF+nv5RUH6sOlZtdLbxWenjGPHXw8pVZotGDT741aYBwve/4oZw5BxSHL3C1AZ4rWghjiy+EfO7nSEcgt5N8X8TqZU0T7Q5FyL14Xm0/8accaUcLwrnjqQVNTQXcYyj0a0BalXvTdPniSOOSauSCmt78i1hwWNSGuXs+Dgbw01rlfsF/vpJMIhrPqbNmmrVE0g+lSAAGB1ZfejaHIZ8Ed2hqcBxpiboQUDoPgZVQI8k7t5Q9gTokXKyDogZNjyJh3sqxOh1AD4pyEeV6NsNDj/ogPyKy971F/46DDtenRi5WJd/9bPAR5jJCCfCIbJ9mGPJcdHObGeZszcbvUJhRs0/SgJ3AxMzuJTA4bsgY9wudqkLoJenKym60D5/cBTTZSQTF/3kezXz0q09gFJpEx6TqmrHHQy0rZ4rqNgDshupEytjHK3SdRQh9gjzXEpDcIU5NKfVV5lMFNGTvhIXDDZOpXZtsm9J83+69eIJcmSDXcAe7SlzeTi0XuDYw+JTnufF1iYtp26RuUVPqSJ3vnFamMAtmcbaUxbNbijBnKYOxV6Gx1CvRUD+kHlLU5Hw1tQ3FbzhegRLwMaxbrmrMDbEsJUjzAcSiIZy/vtw3ubHf/L5Oyp8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(23010399003)(376014)(1800799024)(366016)(38350700014)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mvc+HetcpS0nt+vHkIwZINTyWGVwYGa4RtIvQw7reJo3OUOYeY3mpSMQ2BtY?=
 =?us-ascii?Q?IzFL5YX6ksQ/EcJ7YJy2JBBjnkXcalDfueirjJC/N1wQ71ODV569d4MZ7vxI?=
 =?us-ascii?Q?6+DS24r3lWhZ1FrBjfhmn8j/GPP55rjLWDOMBly7DAGJDqkYIcnR+qRMnRw0?=
 =?us-ascii?Q?iBXHXFQa4sS/0/tsYxQQosRyAzoi//Tfh78Ac1Sm6JUgsk6RVRAvgTizPWOr?=
 =?us-ascii?Q?tCjOsRk+1oeDKZaidKRoG40NDAG1fQf6v7ZuT6APCs9uw9h8G7OuCLQrhX2v?=
 =?us-ascii?Q?7wNmxTlRHUDeH43KUC+Jj+piuztlKit18YgFB9ei6+KYKzmssbMXwCtFgcs0?=
 =?us-ascii?Q?jP7eBDXhnIqe7BX+VoACvfztLEv9LxoX9TP4UDVQEQDkXIq4qV2fma89c/Du?=
 =?us-ascii?Q?N0Nm0JHPZpzc0v/JvmWKUsDQHKQTVZ6KvPs2sh3TNsM9EH180Yvgh4zHS6oa?=
 =?us-ascii?Q?bgKPNPBZq7yRTbFcHQ3JmiwgXzJIENFcxPNPQ1BHmtvyiNIcEBKwY2FJcGvV?=
 =?us-ascii?Q?qbh8a41oEhObnuX7G6ckJd8Gwuy2wI+sUmzDFA0qVIVx5V7suYEzqhlBTVJV?=
 =?us-ascii?Q?kkn5WorNmbV8Da67G2UWUjg78fU56X9feSUu1G/wktI4N4r+pPjt6519RHUB?=
 =?us-ascii?Q?W9Cqp2S8TlXxhlkeafqwHpTKnkNn809ECGnRqsjH3fI/LvSCB3mZTcOtGzri?=
 =?us-ascii?Q?ZOAXgbVpI+9ZfgopSCvwhyQCR2YQ2MEhbnN5UwYK0nK5yNHLKG2lSe5joSpR?=
 =?us-ascii?Q?FtbeygBRUsQhe2cGqJjFchEQSGsRD18AdgTqnCZiSm5Fepnn2P9WhS0bS65W?=
 =?us-ascii?Q?s9+YYd97QDRlsibedOUkkBwCF7mFfvp7xL4G5y2t50dkc3OHSzbnI6f155b7?=
 =?us-ascii?Q?78h1k4PE2ZysGpFrY/scypsehnZRdPqHXeN1zDu26hBEluMxb4aMAV4wHM1y?=
 =?us-ascii?Q?4ZpGIMye5kBcKw49xa4LTriU+A+i3lWWjTvqxMEOU8QOflzPIsQjFadjCjT6?=
 =?us-ascii?Q?f3+GX8J3mv6Zpr8HVSbWTTdY2zTgffXtofNq4OiEuISmSQnghTNl1TrjqKIQ?=
 =?us-ascii?Q?qH2HULAz5lfMyuqSQaowJlkmjznig4MfbeJmI0qgIdJBENy55d2EoUNY2sAA?=
 =?us-ascii?Q?zdTjjNre1ZtXFBzDDmrg36KWAcKzraAQHbIk4/egg41XPAG+TlKFfbMUlIMs?=
 =?us-ascii?Q?4ju34K+fn33f3O4nn+Dp1bIKLynXipCMCOMPNp4CTRtHxSR03koHfrk0qG2u?=
 =?us-ascii?Q?V9GtdCfHxuzWS+uYcuzDE3xELvCAQA8iX/8rj8lJYbbn1BbK8XhC2vzKvLy4?=
 =?us-ascii?Q?luK4GN8lIC15poSix5HUwWv0GFkOWWcxl7R1KXjF7wC4WMv2cjQAJExaTyN1?=
 =?us-ascii?Q?tfOFo8wR3+9CHPQ2iHgee8aQBxvjRBEdvCYLRv1akcWXx/4TRA1Exk2FPv9d?=
 =?us-ascii?Q?HjiRra3l1oA+XbrSLAmE1jhcSfkAA7VRyzlees8NOC6Fbwr9B+M9O8ejuTjj?=
 =?us-ascii?Q?/uS2Xu/emuSErXJ+5yfvr/fh4D4hEkyEQ30RiFm6i4eU+nkLYpdJBnJRGQbY?=
 =?us-ascii?Q?iArOO8SHZgognanX7mQNkoS2tx4wq/L7eIjWeTrnxCm63gTxyIbCIeg6uRTI?=
 =?us-ascii?Q?9rH0t5T8wpieE9Hq5eSyixi7YcbcH+ho4k1OUfWDcYbXgsZ69TZyT84E83Ug?=
 =?us-ascii?Q?RejYF5JNID+DYoA42GzdQa6rWcgYh09a3zeXEnQdN/teb1BagAzyHc1SOyk2?=
 =?us-ascii?Q?t3JZEIu/EW/fqSaEbA6eOb4Fh/lYlhWYuL2Zljqmj3zMNdDuP6n+?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9083990-cc86-4451-17f2-08def41e52c9
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 00:53:40.9552
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jhFKQIU8Xrk2oNzR/SDQqjDR+v40BNKvvl1B1zc0xKTIqaydA5PBpIe441f+rVmL0fHXdPZJChYAuuUdglcQErN0jVOPNcuxYs1sg5cGAYgzpoRjeU4P5p5OYoKU3dRz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYTPR01MB11044

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/alc5623.c | 11 +++++++++++
 sound/soc/codecs/alc5632.c | 13 +++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/sound/soc/codecs/alc5623.c b/sound/soc/codecs/alc5623.c
index f5a666c493615..96bb1d5927729 100644
--- a/sound/soc/codecs/alc5623.c
+++ b/sound/soc/codecs/alc5623.c
@@ -822,12 +822,23 @@ static int alc5623_set_bias_level(struct snd_soc_component *component,
 			| SNDRV_PCM_FMTBIT_S24_LE \
 			| SNDRV_PCM_FMTBIT_S32_LE)
 
+static const u64 alc5623_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF;
+
 static const struct snd_soc_dai_ops alc5623_dai_ops = {
 		.hw_params = alc5623_pcm_hw_params,
 		.mute_stream = alc5623_mute,
 		.set_fmt = alc5623_set_dai_fmt,
 		.set_sysclk = alc5623_set_dai_sysclk,
 		.set_pll = alc5623_set_dai_pll,
+		.auto_selectable_formats = &alc5623_selectable_formats,
+		.num_auto_selectable_formats = 1,
 		.no_capture_mute = 1,
 };
 
diff --git a/sound/soc/codecs/alc5632.c b/sound/soc/codecs/alc5632.c
index 2fd3dd7ef8b34..a5e95f3fc2474 100644
--- a/sound/soc/codecs/alc5632.c
+++ b/sound/soc/codecs/alc5632.c
@@ -1003,12 +1003,25 @@ static int alc5632_set_bias_level(struct snd_soc_component *component,
 			| SNDRV_PCM_FMTBIT_S24_LE \
 			| SNDRV_PCM_FMTBIT_S32_LE)
 
+
+static const u64 alc5632_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops alc5632_dai_ops = {
 		.hw_params = alc5632_pcm_hw_params,
 		.mute_stream = alc5632_mute,
 		.set_fmt = alc5632_set_dai_fmt,
 		.set_sysclk = alc5632_set_dai_sysclk,
 		.set_pll = alc5632_set_dai_pll,
+		.auto_selectable_formats = &alc5632_selectable_formats,
+		.num_auto_selectable_formats = 1,
 		.no_capture_mute = 1,
 };
 
-- 
2.53.0

