Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010017.outbound.protection.outlook.com [52.101.229.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C58BF3BB131
	for <linux-sound@vger.kernel.org>; Mon, 31 Aug 2026 06:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788158318; cv=fail; b=PpYPhPnKzI5FrmfMUx/iUtJogg8gN2x+3YO5DAPXEdbycJjuPVQlGyDK7CSs5MttKMtJKL2Ygk8SVkE3seaw3ei62o6dUqv31d9YkdmDy7cYcWxaOV7nkE9B9SvWmEg0C6iB3rLbq6o9xH0wz+FlKLfSzdtvtzt9zp9keMlJkmc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788158318; c=relaxed/simple;
	bh=ygtb2epyMIkViSMhn9n47mXeCIbUTwUtIdaX1SBKQrY=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=rpCwEPIx5eDsKyXM5P1Bm/8BDJdSsmMBzM0OKJH8l+98/WLhw0wahA8VkXbX/bjmXkmxx/Ql7sjTeiMmLNOwBJjHPmqmdNESl+RD/U3LRYZgMszPKxG1RB5D6dVxKF7M2g9NoA61k9bF+pFN9HtDEY8DZafU2GrLKA+hkodLvv8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=UX0/dAIc; arc=fail smtp.client-ip=52.101.229.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="UX0/dAIc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XUh06JxNxpfo9IZXM7lrP6H47Otf4+ILxJRMRQdeoP8IMoAR+tbvb7RGzsJKvodbBmE5J6cGVJ5k16sq6af+zhUzmpeU2nTJAvvcFTNEyfddl4Y8F/G2+h1uH+EYP+w8L4oT7yWYS0YLJ4nHkJYexos4yyZ3Le+hE1hv9LJwmzVw/KqM96tzYZSoy4sZsa4cB+ZPfcxFntUcADb1bASJBDmCXgz3tvTl3HJV832/j2GUiVLOYhMzFAbfEn18fq96Ov2rju7QcgaQNcYafu0RcZqOt3j5hb4V3UijGni6HJ2tJ0oS+BWLMx34jwpBH7Pg4tUueYp0YAHwPXBnARICXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IXBpxs6y3sPtJSePcI8VJHVB90K6PoQuhPZq9CUfWhQ=;
 b=ClL5WEaZ66z4+bBdIJceGVQ6UupAY2Mcr3PvUcd2fdCaeHwGKoQMhjqQXiPHdJgosZGpsN8jfCOR9/KMbm6sd2vJRaxVLTzf6V+4RmgGpHAxan/Kmcx70A/crKcuFJJ36rnL2VN6uOu7x616WvrZlkyO1YKkk68niB8sbJaMeWNfUu9F6q/R704mmdGw8+T+2N7+0SBSrJtkGUx68jU7v3EzpvD/znpsVG6ShqblrgsqxtBL16mJkWbro6lpubEI14p11KHajR6mFFWQJ67qxvwl49azKmpXpzp96lhZoI/Otbdye9NDoTY1HnvFqIkyy3svKbzIrBiwnsGX4n6eMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IXBpxs6y3sPtJSePcI8VJHVB90K6PoQuhPZq9CUfWhQ=;
 b=UX0/dAIc6T5oIbvjPK75avjxHW3p3PU516Ke/artAMsPOglaYXDQakbcj6QLhDI144UEIhyubo5IZzOhDajlEpO8YhMP3XldIYnaXR1RyJM3hsJel6HGKrrEEQMkHq6hcQE+awxTPFiX3ZwTP46sQa/Go/QP5mcU/JEVKbOLZLo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYRPR01MB16474.jpnprd01.prod.outlook.com
 (2603:1096:405:2ee::10) by TY3PR01MB11005.jpnprd01.prod.outlook.com
 (2603:1096:400:3ad::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 06:38:32 +0000
Received: from TYRPR01MB16474.jpnprd01.prod.outlook.com
 ([fe80::2a39:9988:dbe9:894b]) by TYRPR01MB16474.jpnprd01.prod.outlook.com
 ([fe80::2a39:9988:dbe9:894b%6]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 06:38:32 +0000
Message-ID: <87qzjessk7.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 08/14] ASoC: soc-dai: move soc_pcm_{apply/params/update}_symmetry()
To: Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	Vinod Koul <vkoul@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <8733vuu75t.wl-kuninori.morimoto.gx@renesas.com>
References: <8733vuu75t.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 31 Aug 2026 06:38:32 +0000
X-ClientProxiedBy: TYWP286CA0033.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:262::18) To TYRPR01MB16474.jpnprd01.prod.outlook.com
 (2603:1096:405:2ee::10)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB16474:EE_|TY3PR01MB11005:EE_
X-MS-Office365-Filtering-Correlation-Id: b5041b5f-8b60-4df5-4ce1-08df072a7a08
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|52116014|376014|22082099003|18002099003|56012099006|3023799007|10067099003|11063799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	uJD4WV/fgBXANu24ec6LZajSfsoQFHYBM318s8wJBkqGnqlMbIE1LOhjhCLQE+ZE0jPGTpFIgVodtSe/4OCe8tUv4psiOWNunwnf7NJurcA0UR7zpBwJWcbZ/jLsXn8rxrzJWAwPtcK+A9XUnSGdUjXcvImSm0vImvMqFPD2Gs5t+g4nUAcPt5TVwmm6BBmODoDZjL6SzyxF+kk6y/SdXlrqYV+JZvrWuLqiwe84+qr625YNnBFNZYd4DaGwVVQB1mcT3oHuge5oLrYk2If7Kl0D40w14D2bB6/dHwFNbH18lqf1HgqV3wiQmmht2yfeQbGo2DKl1wxecHQsdv1lVKY5Ti8rxDcRjZFlYcJI0M7Ny55wGKp6pD2rXRKiw1NcggbrY8LkoTbFQ3YvlKgw6S0BY+WKa9NKJ7nozfTBfiNqGYE9cZPn7nD3imb4fAk1RVJc6VirKd82jaAguHiBvEgKAPujiPKJO/UthNz+U7cXGNZSvtyavbBshfz8rHV6TKtLmcTiu6OWnnnoPZA3XZ+AwKhTq85pcUbcpyw86Z26VXlh1rRTNh6+BuYrfpZgiWVbWe65Hl52p2rUhuCTZz/f3kf4Upt74ggmhOUv4Qjj7BvpMWqZw4MBZ0j5QLROVZNCjtgjle93xF+13p5F+UXuBC23bOcJMrkc/nsoN42gMkRSPAitt3AitUDRyRm8pwtFkGRRwVaz3VIv+H2Tqg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB16474.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(52116014)(376014)(22082099003)(18002099003)(56012099006)(3023799007)(10067099003)(11063799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wy26ZaE8uEqhP/vfM7mks/3il8/D23S8F3HoAW3sRLf88jxAKGkNNZ1R4dY1?=
 =?us-ascii?Q?PF+Ds+4SwrA/P2dUjdezJZFLsxiiPtVvsyY3O39GMyHdVg1gf+1OG3YmyvCI?=
 =?us-ascii?Q?6OqTmjJKs1lnGX97NC+u9rfj7kTnBjKjZ1qzESdIuo5bejrOqGP0zIFVZRUw?=
 =?us-ascii?Q?jodn16uREUvWbIYW5CMjaXmugICTU/xQX1pbys9WYMER9GnQIjiAbqD8YIMC?=
 =?us-ascii?Q?YSs9+E0XM0PbD9ya0TDnNm+yUUASpJdCYILPLJQ58GeCT4FFHZlCwOneojZv?=
 =?us-ascii?Q?4sLQPTB92/HGtCo9kqCKhi9Am78oIKUC+4QTxsRSR5ndl81a1dsr0UDc4IVq?=
 =?us-ascii?Q?bALLqemBHqV1Yv4mMu1cPCJO+7yvXxxr7rWZq1UeLh9+zTT4giAhHxAXwKyW?=
 =?us-ascii?Q?c0si/kmszF+8Yw1pX4zh1zGixQRJHSgFxsDV8+GxLEYJtE9wtq6BFHBAq2Zc?=
 =?us-ascii?Q?qzoDfUhNtZDjsDKNfDkUuyEAf7FaCMsA+Ob/p2bQTx4g9I/TFRjeNW/xcbni?=
 =?us-ascii?Q?+uOqgLNtP+9Mvk0Jv69XrY671GDDSoH7kjDPxr06W0WibvmOQXD5U8YRnwLx?=
 =?us-ascii?Q?JNRc9XmfCLKQOPuQDWM4lpP8HqDfIxU/OmnteorbnYG7fhLnTaTJz2FTWi78?=
 =?us-ascii?Q?yGJ55LMgOXCJno/YBCDslbnwYVKp9qSb6IgX4+IEwywRyS+PSjTFdBzbf5AI?=
 =?us-ascii?Q?5lSKki4d0Ndy6YyA91r9OathGjtGl/dv8UaYGKAtbtHhc5zNJbpqNC3zbXLz?=
 =?us-ascii?Q?CgcCD4eWOVVMvqh4IqfZ47NF2IYmQlZgzmyCgnxJpqHtG++0cd9WVB2jNE/S?=
 =?us-ascii?Q?KERutUQMvuhbIQFroNS0UeL/HRw2GgKTg3x+d1Nrr+CRJ0ijneslXDX8+wIU?=
 =?us-ascii?Q?RSG5R79pHmMLO3BMuwFNrryYPjDnOr2b+yJpKJvabHVHVZCmXmgY6ObFejTz?=
 =?us-ascii?Q?kDSjMxE5gpnPz1IH0GaWQ1PUrpuHT3wnRX2ZO6pGXix6aFIxEApZxJEnIb9B?=
 =?us-ascii?Q?ZFFlzY3iaxqT2lVKpCWUyrlusicgA8QOdcfgz0l4z6cofcs/HR27UScJF1er?=
 =?us-ascii?Q?vJ3htfQVv+C3WDKJTr1m/nRLM5CYaym7qg6EH5mrwru83sGCzlvQmXtKKRgW?=
 =?us-ascii?Q?yvfHSNumuyHgNJQJalDjsOD+5f16qC+bmFmBSlfVQndE6JG7PGGLdVF3aXht?=
 =?us-ascii?Q?zGY8aKkEQ1pscQ3dpRZiEhHikAMzGnUFlw0jzsgi1Tv2yH9lPdq9dnukKzVN?=
 =?us-ascii?Q?Hwn8LiuJt3FTkFSlm0Upv29qw5GTpJ1cDIv3suQvustqkU7d3/OeRUJ6W0Gg?=
 =?us-ascii?Q?GDpx6fAUUZSYz7IolTsoR92WDo4Z0rbrk/gO4pHJvGqriBuhx2Sa44BdvsR9?=
 =?us-ascii?Q?BY8wChuYUaoXDfCeqWolIz1ddqv3X5seYYY8VI8PDG5NjtWnkFsUtD6kqH4F?=
 =?us-ascii?Q?xlp8sqFtnywpbDprlhDUyb29NOZMsJ+qsFuzz0MwEGGlho4L6BCAK7iKQtbd?=
 =?us-ascii?Q?BIQcKifM50pHPD+75sn2iBGrlW3p2o4BcG4Ohuf1D1PW7OKyHz/LogFCOhpM?=
 =?us-ascii?Q?zn/eJMiBfe8wMAf0kLIJ9cRd3e3vz95uBf8WT7rz/iFRVfj/5Uoh4i3ffpFC?=
 =?us-ascii?Q?x5PoTpKc6/mh2Aj1qHtbAxkiVT/nuAs9TA0RvvpEgHTwYmolJrIjJVHOHPzR?=
 =?us-ascii?Q?DNFXvijIQ7Kxr6KNORm+WWS9u9JNyPOOVpaOK8p/HxGxgdc9WCSap6g4rPWH?=
 =?us-ascii?Q?D4IwCBeZtU4oP4SG50hNzJgjvJm8LNZmDm2620xJ/lno7WLsL77E?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5041b5f-8b60-4df5-4ce1-08df072a7a08
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB16474.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 06:38:32.8456
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zbL4KVK5wZp8ODgHXFa448GggD2UUIEmQbHQ17piMFJLZOMxCWDsWChSennvK9shc/GdVe61OvMxcX81AcZaoVrS2mv0Cfr8fTyd9lSLLvUhOA/dyonQQhBqpmHtP1YA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11005

soc_pcm_{apply/params/update}_symmetry() are DAI related function.
And its parameter will be capsuled soon, will be not enable to access from
soc-pcm.c. Move it to soc-dai.c

It renames function name
-	soc_pcm_xxx_symmetry()
+	snd_soc_dai_symmetric_xxx()

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-dai.c      |  85 +++++++++++++++++++++++++++++++++
 sound/soc/soc-internal.h |   3 ++
 sound/soc/soc-pcm.c      | 100 +++------------------------------------
 3 files changed, 95 insertions(+), 93 deletions(-)

diff --git a/sound/soc/soc-dai.c b/sound/soc/soc-dai.c
index b8b70c5330708..73ef977d23cc9 100644
--- a/sound/soc/soc-dai.c
+++ b/sound/soc/soc-dai.c
@@ -1154,3 +1154,88 @@ void snd_soc_dai_symmetric_set_params(struct snd_soc_dai *dai,
 		dai->symmetric_sample_bits = 0;
 	}
 }
+
+int snd_soc_dai_symmetric_apply(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
+{
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	int ret;
+
+	if (!snd_soc_dai_active(dai))
+		return 0;
+
+#define __symmetric_apply(name, NAME)							\
+	if (dai->symmetric_##name &&							\
+	    (dai->driver->symmetric_##name || rtd->dai_link->symmetric_##name)) {	\
+		dev_dbg(dai->dev, "ASoC: Symmetry forces %s to %d\n",			\
+			#name, dai->symmetric_##name);					\
+											\
+		ret = snd_pcm_hw_constraint_single(substream->runtime,			\
+						   SNDRV_PCM_HW_PARAM_##NAME,		\
+						   dai->symmetric_##name);		\
+		if (ret < 0)								\
+			return snd_soc_ret(dai->dev, ret,				\
+					   "Unable to apply %s constraint\n", #name);	\
+	}
+
+	__symmetric_apply(rate,		RATE);
+	__symmetric_apply(channels,	CHANNELS);
+	__symmetric_apply(sample_bits,	SAMPLE_BITS);
+
+	return 0;
+}
+
+int snd_soc_dai_symmetric_params(struct snd_pcm_substream *substream,
+				 struct snd_pcm_hw_params *params)
+{
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai d;
+	struct snd_soc_dai *dai;
+	struct snd_soc_dai *cpu_dai;
+	unsigned int symmetry, i;
+
+	d.name = __func__;
+	snd_soc_dai_symmetric_set_params(&d, params);
+
+#define __symmetric_params(xxx)						\
+	symmetry = rtd->dai_link->symmetric_##xxx;			\
+	for_each_rtd_dais(rtd, i, dai)					\
+		symmetry |= dai->driver->symmetric_##xxx;		\
+									\
+	if (symmetry)							\
+		for_each_rtd_cpu_dais(rtd, i, cpu_dai)			\
+			if (!snd_soc_dai_is_dummy(cpu_dai) &&		\
+			    cpu_dai->symmetric_##xxx &&			\
+			    cpu_dai->symmetric_##xxx != d.symmetric_##xxx) \
+				return snd_soc_ret(rtd->dev, -EINVAL,	\
+						   "unmatched %s symmetry: %s:%d - %s:%d\n", \
+						   #xxx, cpu_dai->name, cpu_dai->symmetric_##xxx, \
+						   d.name, d.symmetric_##xxx);
+
+	/* reject unmatched parameters when applying symmetry */
+	__symmetric_params(rate);
+	__symmetric_params(channels);
+	__symmetric_params(sample_bits);
+
+	return 0;
+}
+
+void snd_soc_dai_symmetric_update(struct snd_pcm_substream *substream)
+{
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai_link *link = rtd->dai_link;
+	struct snd_soc_dai *dai;
+	unsigned int symmetry, i;
+
+	symmetry = link->symmetric_rate		||
+		   link->symmetric_channels	||
+		   link->symmetric_sample_bits;
+
+	for_each_rtd_dais(rtd, i, dai)
+		symmetry = symmetry				||
+			   dai->driver->symmetric_rate		||
+			   dai->driver->symmetric_channels	||
+			   dai->driver->symmetric_sample_bits;
+
+	if (symmetry)
+		substream->runtime->hw.info |= SNDRV_PCM_INFO_JOINT_DUPLEX;
+}
diff --git a/sound/soc/soc-internal.h b/sound/soc/soc-internal.h
index ce68402bde52d..3afc50d5760eb 100644
--- a/sound/soc/soc-internal.h
+++ b/sound/soc/soc-internal.h
@@ -29,5 +29,8 @@ int snd_soc_add_controls(struct snd_card *card, struct device *dev,
  */
 void snd_soc_dai_symmetric_set_params(struct snd_soc_dai *dai,
 				      struct snd_pcm_hw_params *params);
+int snd_soc_dai_symmetric_apply(struct snd_pcm_substream *substream, struct snd_soc_dai *dai);
+int snd_soc_dai_symmetric_params(struct snd_pcm_substream *substream, struct snd_pcm_hw_params *params);
+void snd_soc_dai_symmetric_update(struct snd_pcm_substream *substream);
 
 #endif /* __SOC_INTERNAL_H */
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 04d7079c338fb..a446e9c1c9887 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -428,36 +428,6 @@ void dpcm_dapm_stream_event(struct snd_soc_pcm_runtime *fe, int dir, int event)
 	snd_soc_dapm_stream_event(fe, dir, event);
 }
 
-static int soc_pcm_apply_symmetry(struct snd_pcm_substream *substream,
-					struct snd_soc_dai *soc_dai)
-{
-	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
-	int ret;
-
-	if (!snd_soc_dai_active(soc_dai))
-		return 0;
-
-#define __soc_pcm_apply_symmetry(name, NAME)				\
-	if (soc_dai->symmetric_##name &&				\
-	    (soc_dai->driver->symmetric_##name || rtd->dai_link->symmetric_##name)) { \
-		dev_dbg(soc_dai->dev, "ASoC: Symmetry forces %s to %d\n",\
-			#name, soc_dai->symmetric_##name);		\
-									\
-		ret = snd_pcm_hw_constraint_single(substream->runtime,	\
-						   SNDRV_PCM_HW_PARAM_##NAME,\
-						   soc_dai->symmetric_##name);	\
-		if (ret < 0)							\
-			return snd_soc_ret(soc_dai->dev, ret,			\
-				"Unable to apply %s constraint\n", #name);	\
-	}
-
-	__soc_pcm_apply_symmetry(rate,		RATE);
-	__soc_pcm_apply_symmetry(channels,	CHANNELS);
-	__soc_pcm_apply_symmetry(sample_bits,	SAMPLE_BITS);
-
-	return 0;
-}
-
 /*
  * Shared BCLK constraint: when multiple DAIs share the same physical BCLK,
  * constrain hw_params so that the BCLK rate (rate * channels * sample_bits,
@@ -566,62 +536,6 @@ static int soc_pcm_apply_shared_bclk(struct snd_pcm_substream *substream,
 		-1);
 }
 
-static int soc_pcm_params_symmetry(struct snd_pcm_substream *substream,
-				struct snd_pcm_hw_params *params)
-{
-	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
-	struct snd_soc_dai d;
-	struct snd_soc_dai *dai;
-	struct snd_soc_dai *cpu_dai;
-	unsigned int symmetry, i;
-
-	d.name = __func__;
-	snd_soc_dai_symmetric_set_params(&d, params);
-
-#define __soc_pcm_params_symmetry(xxx)					\
-	symmetry = rtd->dai_link->symmetric_##xxx;			\
-	for_each_rtd_dais(rtd, i, dai)					\
-		symmetry |= dai->driver->symmetric_##xxx;		\
-									\
-	if (symmetry)							\
-		for_each_rtd_cpu_dais(rtd, i, cpu_dai)			\
-			if (!snd_soc_dai_is_dummy(cpu_dai) &&		\
-			    cpu_dai->symmetric_##xxx &&			\
-			    cpu_dai->symmetric_##xxx != d.symmetric_##xxx) \
-				return snd_soc_ret(rtd->dev, -EINVAL,	\
-						   "unmatched %s symmetry: %s:%d - %s:%d\n", \
-						   #xxx, cpu_dai->name, cpu_dai->symmetric_##xxx, \
-						   d.name, d.symmetric_##xxx);
-
-	/* reject unmatched parameters when applying symmetry */
-	__soc_pcm_params_symmetry(rate);
-	__soc_pcm_params_symmetry(channels);
-	__soc_pcm_params_symmetry(sample_bits);
-
-	return 0;
-}
-
-static void soc_pcm_update_symmetry(struct snd_pcm_substream *substream)
-{
-	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
-	struct snd_soc_dai_link *link = rtd->dai_link;
-	struct snd_soc_dai *dai;
-	unsigned int symmetry, i;
-
-	symmetry = link->symmetric_rate ||
-		link->symmetric_channels ||
-		link->symmetric_sample_bits;
-
-	for_each_rtd_dais(rtd, i, dai)
-		symmetry = symmetry ||
-			dai->driver->symmetric_rate ||
-			dai->driver->symmetric_channels ||
-			dai->driver->symmetric_sample_bits;
-
-	if (symmetry)
-		substream->runtime->hw.info |= SNDRV_PCM_INFO_JOINT_DUPLEX;
-}
-
 static void soc_pcm_set_msb(struct snd_pcm_substream *substream, int bits)
 {
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
@@ -988,7 +902,7 @@ static int __soc_pcm_open(struct snd_soc_pcm_runtime *rtd,
 	/* Check that the codec and cpu DAIs are compatible */
 	soc_pcm_init_runtime_hw(substream);
 
-	soc_pcm_update_symmetry(substream);
+	snd_soc_dai_symmetric_update(substream);
 
 	ret = soc_hw_sanity_check(substream);
 	if (ret < 0)
@@ -998,7 +912,7 @@ static int __soc_pcm_open(struct snd_soc_pcm_runtime *rtd,
 
 	/* Symmetry only applies if we've already got an active stream. */
 	for_each_rtd_dais(rtd, i, dai) {
-		ret = soc_pcm_apply_symmetry(substream, dai);
+		ret = snd_soc_dai_symmetric_apply(substream, dai);
 		if (ret != 0)
 			goto err;
 	}
@@ -1184,7 +1098,7 @@ static int __soc_pcm_hw_params(struct snd_pcm_substream *substream,
 
 	snd_soc_dpcm_mutex_assert_held(rtd);
 
-	ret = soc_pcm_params_symmetry(substream, params);
+	ret = snd_soc_dai_symmetric_params(substream, params);
 	if (ret)
 		goto out;
 
@@ -2011,11 +1925,11 @@ static int dpcm_apply_symmetry(struct snd_pcm_substream *fe_substream,
 	int i;
 
 	/* apply symmetry for FE */
-	soc_pcm_update_symmetry(fe_substream);
+	snd_soc_dai_symmetric_update(fe_substream);
 
 	for_each_rtd_cpu_dais (fe, i, fe_cpu_dai) {
 		/* Symmetry only applies if we've got an active stream. */
-		err = soc_pcm_apply_symmetry(fe_substream, fe_cpu_dai);
+		err = snd_soc_dai_symmetric_apply(fe_substream, fe_cpu_dai);
 		if (err < 0)
 			goto error;
 	}
@@ -2036,11 +1950,11 @@ static int dpcm_apply_symmetry(struct snd_pcm_substream *fe_substream,
 		if (rtd->dai_link->be_hw_params_fixup)
 			continue;
 
-		soc_pcm_update_symmetry(be_substream);
+		snd_soc_dai_symmetric_update(be_substream);
 
 		/* Symmetry only applies if we've got an active stream. */
 		for_each_rtd_dais(rtd, i, dai) {
-			err = soc_pcm_apply_symmetry(fe_substream, dai);
+			err = snd_soc_dai_symmetric_apply(fe_substream, dai);
 			if (err < 0)
 				goto error;
 		}
-- 
2.53.0

