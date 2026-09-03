Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011054.outbound.protection.outlook.com [40.107.74.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC5C22FF672
	for <linux-sound@vger.kernel.org>; Thu,  3 Sep 2026 01:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788398076; cv=fail; b=gbv0r7tRHbge632JE/wcP2sHL3uHhgZAfurXN7IHT5TM/F6HS+tVzQTQvoSVl+N03LyhG3Dmxtul2s+QnoLYJKjXkgvJQFwhNeroBcScQNTFgLig3CexyT6g+8lLXxrXTx05OrpvYwP7P0s9LgnQ0vVDhY9ryuzTHtD1bBuOH1c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788398076; c=relaxed/simple;
	bh=zXG8nVizgGvzPMpAOUIr9erOMD2LqPBWMRtJy7n1cLk=;
	h=Message-ID:To:Cc:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=L8xiJ5kaA2X6UzlFV541zEXG+XxD5DeoHqQ3T9QireXB4kf/UMc5mu8y1+HYb5mU5UXgX0wEHaJhiqosishwdg9UFCMgnz4VPLoGP9mLv5jQn9WKT3EwP88PouipnVCWTRWoQM1nn2+BB8qUMIMwMNaiyv2QfQHwAGT8SVvYn3A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=KP8siyu+; arc=fail smtp.client-ip=40.107.74.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="KP8siyu+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e+AsLr7wXzVlxr1bdBmlq3UTyup8Mbbdp4K18tbwT6sgNfFUB8sOTEsyAYg5FaW4kFBfBt9l1klK88UywvFTxKCdvCkAy/m3AEjQfA9ALiqRHynUD436wIkFdE7JFUXFWDVJ7NlVx0O5i6Y/WHMyxPCgzcuzoF87LpPyEHHem6J+obx6XTCbwJ+wK7UPC6vOgxRtNcoFbnqsXM3cYqk/+oOPmobJiSh7JOGtgsTPW7317m/lXO497LumBxyyKdbOFAlR04oq8Og6RUyOVHxMa37knX5YzyQNfAF7j4F8Z0tjxgQeaCETgbWdRlMPn5EwDl2ornZhK4xmsAzwwkzOug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MwDmUaqgPhmTwyANhv47mPAbyQurvGMUx2Fjb3TiNyc=;
 b=KBIzDB1fqz4u+TvsQ9Dx9Lh1cWMW7D6OWsLecWmIM+fXKZufSV0g49+A3ZarHLP4bINn71wOokv6lMUPI45CdDtLT4DCFb2vpSt2YTQtAWe79/FfmaCCQp1khdE3QkBQUX2/Sp99CH6HY2n1kIEuBpDde1Z6wsV/hAboRNQXVxaaA8RqU6fiUAdTt0eD7WtDHSMGtHUFxdiI8Wh7KebqMr26l1bNvVMLLMU3ciqvFR9YdgRIe/YyIh5CMlD1FllUcF3B4jOjiHtX2CkNpSW3bcsW8bX+J36NuSYNmhv+kw7nrdpP53KIIhyrquA+tQuAllkN2FKuvKM/pWdQV3eMiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MwDmUaqgPhmTwyANhv47mPAbyQurvGMUx2Fjb3TiNyc=;
 b=KP8siyu+FtsJM3nsDwUj50PEgW9yG36R1pEqrHPfILibCWS32DbBJV3F5JMwTTrAlglD4oL0BWCcNHgiq7y8yR0GKOzHjdGT0p1cV3rnclr0k/9Owk25x5LpX35E/WKLqAmIvUonMdOi4+PTtiSTkM4zQ+/sCCzQr2J8qELawM0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYRPR01MB16474.jpnprd01.prod.outlook.com
 (2603:1096:405:2ee::10) by TYWPR01MB7169.jpnprd01.prod.outlook.com
 (2603:1096:400:c7::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 01:14:32 +0000
Received: from TYRPR01MB16474.jpnprd01.prod.outlook.com
 ([fe80::2a39:9988:dbe9:894b]) by TYRPR01MB16474.jpnprd01.prod.outlook.com
 ([fe80::2a39:9988:dbe9:894b%6]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 01:14:32 +0000
Message-ID: <87bjafyw3s.wl-kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Jonathan Hunter <jonathanh@nvidia.com>, Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>, Thierry Reding <thierry.reding@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 linux-sound@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 17/21] ASoC: tegra: use .auto_selectable_formats
In-Reply-To: <87zexzyw5v.wl-kuninori.morimoto.gx@renesas.com>
References: <87zexzyw5v.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 3 Sep 2026 01:14:32 +0000
X-ClientProxiedBy: TY4P301CA0119.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:37e::9) To TYRPR01MB16474.jpnprd01.prod.outlook.com
 (2603:1096:405:2ee::10)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB16474:EE_|TYWPR01MB7169:EE_
X-MS-Office365-Filtering-Correlation-Id: 82c012cd-f517-4c85-2a12-08df0958b5c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|23010399003|366016|38350700014|6133799003|56012099006|10067099003|18002099003|11063799006|22082099003;
X-Microsoft-Antispam-Message-Info:
	L9S1TABYt8FK/Ldb2kSiToCF8WrCYtfYrkgvBY2oqFu/jhvout/syZp3oOvy2iZM3uA3OGpBnzLTmdQgLzHHzLWE9EpgJ+O04CcPVlVUiTtUaEp+WgJLrIySm9MokoDg7jHn8AuWeP7H5Vnr9xpRlnwbjjDArlGdXdUgU75SXEtxIagVCm7QbYfhxWnSlQmtlCA586GZxya0W3QT/7eJRb82+uc/gpJei5LtWjLDb60WesXJc4i67dtaDztk3RlbXntLub728jJrHNpXuHhMD9wqClNtPz/LShuPfKKKiw2o8hItWKc50juSSzKJc0CXYrRyY4CTqVrfpNq4arWPHhZEPdafHcEHrpKxLTRje1iNSaTty1QwV6dQ4EMRm+wUixGUEZoPnIHaiWH9yNEDW0ulR5Awc0HuEcCdGGrJydh0nDQIA7saDhtfRZQGkEOFWKy3QNutiZojJbujKadUnI02tw0+Juze9EfRKJEJssnHovTzLQ2hWKP0HT16HuCMBnAzJcg6Ss83koVf6HarToegUjKF5BOUp6K8gHAgKoumzrGCCUjVCeibcxQza9pM4JMBE9CGj/bK1jAP2ctMicgSRj3hkxBkG+FzjgPmWxvnfORzBI+dBvRSrHkshU5HMs7OtCGL5RyxvU/jyZZt78bcFR9484inN/lYJNAP1Fb7Kw6+WbVPITGbCEv7o8vs7mKRRHeflfFuXIIuEz8EkKyGQqpB8eKPzX+GYpG+KaI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB16474.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(23010399003)(366016)(38350700014)(6133799003)(56012099006)(10067099003)(18002099003)(11063799006)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/b4FrdB01OJ0tc+hsGsFo9BKZ5C0+aBPKMebU5wtmgrV3MD+SmNj0BJIHRzK?=
 =?us-ascii?Q?f8Ij4Okrecqj2FnPnEo/Wz+wk80p8ID1siYWi8CACK4WKB4hChLsbxX83tLS?=
 =?us-ascii?Q?zu11Ih6aZnlZMqFCM+EgEFzMGnELFJM3R6XHzU9n1GQ4EoH6Qt4eWEvMnnKR?=
 =?us-ascii?Q?wq7z5RfFk4phQ0sesNA9h9S7EJUrOcwiGcUNBSK+6YLMOGiXJZAsWRarYhQ7?=
 =?us-ascii?Q?ywt/iBv3vqSlyQ5e/M9KJgeaAJsw9ucDnoordVKMPkgzZyPICA/bHZ6awrmW?=
 =?us-ascii?Q?1zHPTsQfNXnK1WUdLipXCca989N3R+Mj0YhTQuxhVO2Fk0Pwh7gpn0MOafDc?=
 =?us-ascii?Q?jdgOQFd3BUvEz9jgLuULvUZ++LD6eiQKBOhR/YddMVqBC+1iG7vfHi8O+LQh?=
 =?us-ascii?Q?OhdnkXgEyUKRZQAuhoYdo+xTDohbNwd8EYL0myyOcHdJS+RWOtOag95XikIs?=
 =?us-ascii?Q?++n95fdGHXB0tqmpd+IB1b6GTctx1PpX/u9qixBspFeVeNAtabv+wFeL9g2m?=
 =?us-ascii?Q?UMLq0whLZvIVAndLTHYGZElfj0ptxbdEN1MIpDfzZOAXwM8QQW5qiMrlygk9?=
 =?us-ascii?Q?68/IV/kRAJ2cNFYKSOkdejTEjhdFb41X7ODwiUvrZvZ1dXrFiVxFatxzC7n1?=
 =?us-ascii?Q?cr7mPLlXoVdUNM2KSxjMrnIPIxGOOjwl+MtHFuyRg4qBmbCdmEBjhyTqBY3c?=
 =?us-ascii?Q?J0knV4+xk/e+k74pmqhsoaeZEKhaY401GT67DRKwTo4iPeNGnx7aJYUVc1/Y?=
 =?us-ascii?Q?+Xx1eaHHU65IslXqPDv/puHYH1CT8dKTf0DD1kg2pFaYJc7c7up5D0YEL425?=
 =?us-ascii?Q?vozs8+vu8dOzuzy+sSa71t/nK1gn7ExsJd61hRWgQdegvhQNoZUIMSWnJz1A?=
 =?us-ascii?Q?krxP7uuEQmHW3GbsqweqVhiEVsQQ3hQpwrSgZzQebbz34AsyYSg6Kx8nGDdc?=
 =?us-ascii?Q?g/1ygkL241GDplD77grRfK5UyUPuOk8HG4aAoY2M+VrezgHxfx28GAjDH+82?=
 =?us-ascii?Q?VMby9G4rP8QRnfNVgNx6TUDzAAYcr/t9B9Rd0b4DD6/FVN52+mFbq9ZBaNCY?=
 =?us-ascii?Q?j0hKt5jPKsH4/Hecbzb1cqk5j3JsmG3izdTAJbyd1ITPVlGb4XoUv1KKxcHU?=
 =?us-ascii?Q?tR2W86fgcADBjwtgFEp0CLdbi0dNRcp695pcJGLxvNnodl7zF/I/nFoxVplX?=
 =?us-ascii?Q?XocWTIG9hArHTclYgN9zPvj/06WyqTlhWyzqt2x2FCeFz5B40uDCU13oTEvn?=
 =?us-ascii?Q?6lO6ChEqub+meEbgX7v8/oGT2SFVn5/7jdSxg7xGgGuDrocigCWOPqgJ6gCn?=
 =?us-ascii?Q?m7SLoLYXdjdEthbH3/e7Xn4e4QtjE2KHwJRvNaj0of3fvA5YPXv+Ke/DYPYt?=
 =?us-ascii?Q?i7Kd7D9bWjQwwCudhTS/RbcVY4v2E2bErcXR3yTqcWbWBOqKAbT/sihfFXTi?=
 =?us-ascii?Q?cPF/fd1DySLzR6mp4S0mBAgMEI8SfsjBJFAIQ0HpBEnj7U399t+dJ5t34DtW?=
 =?us-ascii?Q?1ho5lORke2S2ihyJ1hXPUwM3eFNJ9gRNQQ+RSfrjaVmdXTfQyLKcW5UKsQGP?=
 =?us-ascii?Q?D9gn8tgs4fSC0uaboUAqBIe1tj3bl2pCgGdS/Z6dLiaOJxNwjER50uBbIXmr?=
 =?us-ascii?Q?Mqr4NnQaKU0VEOS4g7sxYSX1dbVfQw53GTAmq0fgsUbtmtcnBUBPiqBnyRJv?=
 =?us-ascii?Q?qat+wMfWqmi+Zv4Cne3z0VmW74QP8bPA2QOafmsD9VpBjoSccXxzyEa1kfTh?=
 =?us-ascii?Q?APa5h4+qXoHhdthKMYOv/0BoAUXIO5WPAX8TgtMiZuVqRsJGsGKr?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82c012cd-f517-4c85-2a12-08df0958b5c7
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB16474.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 01:14:32.2402
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1wpHQ8uRxcZDOaZC3vXNYPTmZq9CLC4S0DK27PHkBbtWZmhveknsUQE3VKjio0IPzpR5AJ+weqLOHRne9UfP67fzLk6ReqYxV7WiGKBlzlEEodXFQMiH6rqWgJMUfGsE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB7169

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/tegra/tegra20_i2s.c  | 10 ++++++++++
 sound/soc/tegra/tegra210_i2s.c | 13 +++++++++++++
 sound/soc/tegra/tegra30_i2s.c  | 10 ++++++++++
 3 files changed, 33 insertions(+)

diff --git a/sound/soc/tegra/tegra20_i2s.c b/sound/soc/tegra/tegra20_i2s.c
index d9ab210ad69a9..b31f9477cb2eb 100644
--- a/sound/soc/tegra/tegra20_i2s.c
+++ b/sound/soc/tegra/tegra20_i2s.c
@@ -309,12 +309,22 @@ static int tegra20_i2s_startup(struct snd_pcm_substream *substream,
 				   SNDRV_PCM_HW_PARAM_RATE, -1);
 }
 
+static const u64 tegra20_i2s_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J;
+
 static const struct snd_soc_dai_ops tegra20_i2s_dai_ops = {
 	.probe		= tegra20_i2s_probe,
 	.set_fmt	= tegra20_i2s_set_fmt,
 	.hw_params	= tegra20_i2s_hw_params,
 	.trigger	= tegra20_i2s_trigger,
 	.startup	= tegra20_i2s_startup,
+	.auto_selectable_formats	= &tegra20_i2s_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static const struct snd_soc_dai_driver tegra20_i2s_dai_template = {
diff --git a/sound/soc/tegra/tegra210_i2s.c b/sound/soc/tegra/tegra210_i2s.c
index 79a2f898ea28c..f2cfe3b5cccec 100644
--- a/sound/soc/tegra/tegra210_i2s.c
+++ b/sound/soc/tegra/tegra210_i2s.c
@@ -739,11 +739,24 @@ static int tegra210_i2s_hw_params(struct snd_pcm_substream *substream,
 					      cif_conf.client_ch);
 }
 
+static const u64 tegra210_i2s_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops tegra210_i2s_dai_ops = {
 	.set_fmt	= tegra210_i2s_set_fmt,
 	.hw_params	= tegra210_i2s_hw_params,
 	.set_bclk_ratio	= tegra210_i2s_set_dai_bclk_ratio,
 	.set_tdm_slot	= tegra210_i2s_set_tdm_slot,
+	.auto_selectable_formats	= &tegra210_i2s_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver tegra210_i2s_dais[] = {
diff --git a/sound/soc/tegra/tegra30_i2s.c b/sound/soc/tegra/tegra30_i2s.c
index 1d7b3aed51fd9..69acff73f68ad 100644
--- a/sound/soc/tegra/tegra30_i2s.c
+++ b/sound/soc/tegra/tegra30_i2s.c
@@ -302,12 +302,22 @@ static int tegra30_i2s_probe(struct snd_soc_dai *dai)
 	return 0;
 }
 
+static const u64 tegra30_i2s_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF;
+
 static const struct snd_soc_dai_ops tegra30_i2s_dai_ops = {
 	.probe		= tegra30_i2s_probe,
 	.set_fmt	= tegra30_i2s_set_fmt,
 	.hw_params	= tegra30_i2s_hw_params,
 	.trigger	= tegra30_i2s_trigger,
 	.set_tdm_slot	= tegra30_i2s_set_tdm,
+	.auto_selectable_formats	= &tegra30_i2s_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static const struct snd_soc_dai_driver tegra30_i2s_dai_template = {
-- 
2.53.0

