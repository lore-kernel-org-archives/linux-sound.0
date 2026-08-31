Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011028.outbound.protection.outlook.com [52.101.125.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E44BF3B05BF
	for <linux-sound@vger.kernel.org>; Mon, 31 Aug 2026 05:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788152859; cv=fail; b=gsFm58L3R6kVzDDfWeieOiSumeYl/b70r3MyrU+qmB9wmsdCHsizoBz+cX5O1LpJHL9JyRmp8KRU75x+xATZ6UPivZMeNQcd5MkXLDLGAAGgQXdpM26gEucIFTTfFDoyCcs9uxpbWRkq12K6we8cyYWkO3pjDNt7INSHpOnfYMI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788152859; c=relaxed/simple;
	bh=EPbemQ1+3j88BCXbSCihwuSZSdTD4fIkgqNWECqqzgE=;
	h=Message-ID:To:Cc:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=nvB4+7/4vGNtvu4LDJ4S9U5N/pFzq2uwKG/XTlUWm/xTUFcIYnhWlAaKZ7zgLgoPB4XcEYD4OO5Njg8v9rDc7VjOCGlqaM6aZ65yhtMf3SqFg7QyvZM+oAYwBarXtv9EpC1bp9N0WwiLhTzx5XhjZRnzSaTkmp54QY+qBxLzhgQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=XMacC17J; arc=fail smtp.client-ip=52.101.125.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="XMacC17J"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AC8BeZXwANqQ1a1i7BtMl+1ASVvUUBTnSYGPoVGom01tc+IqBle5hwSZX0u3MW/qbx9wmCrVnrbaidaZAY3nzwgikZv/zaWJALV1yavMut7QeKdi2pZw+YcsB1b29UC/Hqk6h3WCWgBaaI7HY/RaddGijiFUQjYBQB0B1dRTwzKwx74AXa3BFDeETTNK600IEzRKQANCsQWJvrw6/0cgtgEnh3ZhmJLKltJ4BYFVGg6ogXdOlBJLDmKcSYLUPZ+z1yvP/FwrqohdCUJzROabIypLsqohsoTpxLhF+xg28c1iRjJOf1Dmi0Iy+mBUUVxbocS7cB+SATy1i7wA4nLrRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fZNsXjrJ9g/Dq1KZoejWoV2BrqUFKR1gFxS3+IYhV3w=;
 b=bry3kbMEITY1+y97GfMLAdHPJ/K4s/92WklPVxaH7kk+WyuNgjiM6iFBt2VimKazXNnMVCy2AomV8xY92M5R33/waWci3QvwmL1gVdXrWpMTfKUqE/U84h/goeV1bwd1rrsx6npPxj4rPFCfc0GYDSE+X+bmSv6y6eqLGTfceK9jVkPufwWXD6gL1KsnAR+x1kRdF//CWpGn2Zud1/01mMz9H1SnSN27z+T9bBDm4g0sRqC11RMVFe4LjRR/QVhtePPQUFLD+B6byKymmlgl9rcNr3eGtCCH9NgrsR7dRQPS3htvvSzowTA8AOa+6riHDPZ0/PwHw3VeVZzX1MBFtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fZNsXjrJ9g/Dq1KZoejWoV2BrqUFKR1gFxS3+IYhV3w=;
 b=XMacC17JK6MDsjSk1MoLiFVEMQI4oAeXckztHmuSCrGRm0He/IJC+wmoVDFv0N7713V6GW45fi7juPJphYrtjRgy4KHWu+LOYvwwjEmCHZLRmun8OuWE4Tpfejx3woZo6lYj7pF01Os2XvpQPcIh7T0srUB1OpknRBnl10jGbdg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYRPR01MB16474.jpnprd01.prod.outlook.com
 (2603:1096:405:2ee::10) by TYRPR01MB13019.jpnprd01.prod.outlook.com
 (2603:1096:405:1c7::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 05:07:35 +0000
Received: from TYRPR01MB16474.jpnprd01.prod.outlook.com
 ([fe80::2a39:9988:dbe9:894b]) by TYRPR01MB16474.jpnprd01.prod.outlook.com
 ([fe80::2a39:9988:dbe9:894b%6]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 05:07:35 +0000
Message-ID: <878q5mvpwp.wl-kuninori.morimoto.gx@renesas.com>
To: David Rhodes <david.rhodes@cirrus.com>, Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Richard Fitzgerald <rf@opensource.cirrus.com>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 11/39] ASoC: codecs: cs5*: use .auto_selectable_formats
In-Reply-To: <87o6eivpyd.wl-kuninori.morimoto.gx@renesas.com>
References: <87o6eivpyd.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 31 Aug 2026 05:07:34 +0000
X-ClientProxiedBy: TYCP286CA0369.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:79::13) To TYRPR01MB16474.jpnprd01.prod.outlook.com
 (2603:1096:405:2ee::10)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB16474:EE_|TYRPR01MB13019:EE_
X-MS-Office365-Filtering-Correlation-Id: 657e3fe4-cb4c-47a3-fbfa-08df071dc4dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|366016|1800799024|376014|23010399003|18002099003|22082099003|56012099006|11063799006|10067099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	434LdkXXAT8V5CJGMbwrQMlWc4YCLMer1HH5qwl9L0PxkofzJKCG9ZQgYMLROUlqawtI8Z4p5piCschgmWfChG97STQh2l/d33BPK/ycQaIZtIFCGC2qQeeClcEPfnLspv3XHBPbpOEM+qIh3Q5ZcYowHZqCIc4Vn5nUfxIruUUay4bVMi9kYDs7qK4K7w1kFPIk7i6rqsqROeC46o0zS/jdlypwEEtH5beG/weroCctPJlNa/qe9dSW81Mzu7TkC17yGd6E+1UWpRx5Cz7SNszveO92omzUF4s6dHGSm+w8oBWLp+wiHVQ5AoHmkadMaF2zCDVYTeI0lo6fLI8RZZMLlrXNJJ89fW/qmHZ9ICEpsqRdjas4RpcY7+I4w4zGDoK/TENxKFslNL7th09XMykbkmoYHN7LRxbdS2sysPOJn3mtGO9gpKvYdQQGhLfwXMfUg2UGIiUJ5yqniXB4IPxg8VTFOZmIT3j40NF+maO/Yv/v5JejrkL10YYdT9T6dhENkvHCwY/sNLDOuhf4uqb43bnNRSDUWiCnaFv4FKjSqLemqc02QZy17894QBMnr3OXpTFFIRc+kkd7RlZd48FoUtUPOuuLNpjrjcWiTMT9xkYvv8PdoIRENJ4C/C2i1DCmPEdxT+6dKlzWwOSTbKzZiFkhBtmd08UmRWFP8A7kSQg+BEq7MjnftRwVVGD86Plpi9jTVAhr+Wkqmt8qIaTu/PN3l11cp52fqGgfkAw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB16474.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(1800799024)(376014)(23010399003)(18002099003)(22082099003)(56012099006)(11063799006)(10067099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GQ2wMPOvxjsh903ilFAbrCZx4xrf0Yiy+vhzpDJmI2xvjyYWd9/gl+3JwUPY?=
 =?us-ascii?Q?n28RGpgbbRy/ZifoSJpSKHsuUhEusc/QDVwV21fzXu+KlZEbue/likzfdMru?=
 =?us-ascii?Q?PpOMccAD52QamTaft3nCZ7j2FMjjzqmKOGRdCUoLDGR9ga/FA1Sl5+tc7UZT?=
 =?us-ascii?Q?BWyTDfyXYn+TgCzI+83eyXhgqcLoIPceniXMSRaDjTAwQV2cgHCK5R/KzQGU?=
 =?us-ascii?Q?jUQ7yzJjiea4Pl2BuUsZcO4lQLi0pDJ+oScH1nCx/b5ZQOeBjmcFjRcAjQQa?=
 =?us-ascii?Q?zihKmAnYjmr43cKSNc4ESjetWbAcWIACAFH0y14bI6YImuBXe9ESgq8G+mKl?=
 =?us-ascii?Q?mPsQVqch0f5q9i22hjQvij5bF1azMGvaXDRlXmIM1F8LPhT14x60pzWUngLF?=
 =?us-ascii?Q?kzaaWPJOxq8Pr8iUqVRgHcbmFDRsCF6IEUKFN02Sl79S3qN1J113aVmZ2rkJ?=
 =?us-ascii?Q?Ia2LBJROiU4NxBNflFUa9jFZ0Fe2p4e67kiImDdd7XWrcMPYWbspgaWyj2g7?=
 =?us-ascii?Q?eDBIjg8eTBNNs4bi4g/HZu1wSNVqg+s5vgDx0YgUt9pUuQtJstXUpDTSVPQo?=
 =?us-ascii?Q?Q6N0YrwKUJbni8bEFeznnISIPhu346IGyyS8KCe6PPMtlh0zN5MHypO902hc?=
 =?us-ascii?Q?TMFS/+yNgNsWmRwY+3e5Nr1lXKxvqMYLCZOi1NUGPPSL3PHw52HZZIV9BOuR?=
 =?us-ascii?Q?ozRPbbtQEyiyn4aWiTLhqh+ybSXZOkiLitpA+opoZdaMGCmELYEUp1MdTq+K?=
 =?us-ascii?Q?ZzomZanAbHfI+W8n3idBQpBkExqCZFudfDi6264oHpVXj2jla84leIF0z2xZ?=
 =?us-ascii?Q?t5sHT2L/sJ37M0mDQYrXsJLgE2MqsvUT/XVLg4s5r07i5mpi8ZV70MDhs8Hp?=
 =?us-ascii?Q?MJDlHx8scLzca1RBaH+F7UkQBdkG1khQX07hd1GJB8jOH5gmwfaMnaRL4+ZJ?=
 =?us-ascii?Q?hTUs8LTXLG0KraZrsF5jJNrfvmifrl5HnZBr4QatImj/7DL+Mtv3CCojCoVZ?=
 =?us-ascii?Q?TAoJN7sQN+xB4S3EpcGPbGN1NA/sZEOgjhlMR5O0SEIu4d66MjzpIq7zOdcV?=
 =?us-ascii?Q?SqVMH49NUudUoR/mV6HLLp92FwbAV5GkXY3kLyd29lEhNZUHhDqDivlc4DdX?=
 =?us-ascii?Q?FbnNrTk0nZaDVnk/OPSZ/BnWBMkku3Bzzyom+4vyGkgdjmicUH4syvoO0H4X?=
 =?us-ascii?Q?bphouURMnD0XoT2Fe4zur2OG5pZmvxG0euggly29XMwIrK4ih1a94yzsBYl6?=
 =?us-ascii?Q?LpGuxPeO2X15hLCal1P7eprI4vwFJ2O7SgFlD3YnWGWbauWIdCBJJcm8KUHL?=
 =?us-ascii?Q?RntEmD4bVq0hLYnz3S7PtRY1sWEegY2xSJ1+IUoNnfuu8q4jtZ0q8RN+emf8?=
 =?us-ascii?Q?JDpz3cq1vm7rC0Vco4ls/eJQwQkYcWBjDynnpJKWnvUTV4TVprd+atjQ9kMY?=
 =?us-ascii?Q?QHvIzk+9g68WG6U5/trQsk/RoViYl/m/tqrAaCyL4k8OigU/mfQggo1sp8DC?=
 =?us-ascii?Q?8sJ8QbT228x5BaRBtEokeNTR5bvMulnKKjWo8YoU4vEnxkxa9MsafuCaVzvd?=
 =?us-ascii?Q?G4FvYRRCvQu5w1Vb5JgZuV8dJ/q5bZ4tLIGxXVzt3RRbsGnEgAuamqgow9Pk?=
 =?us-ascii?Q?msjw32bYbNKSPW0C4HEGSEwvqLLkMm3RJi4eyiaSQfTi3VfuXEvSmBi5xnSq?=
 =?us-ascii?Q?02UodGeJcGb78B2t6+IkhBNb9h12sjAdQFGoqQ4pI/4knDauiEVl+CJCC5yf?=
 =?us-ascii?Q?cvjexaepf/5bRn23o3uCMrPyERD45HKT11QNyNjyf0lKfxfzf3+3?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 657e3fe4-cb4c-47a3-fbfa-08df071dc4dc
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB16474.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 05:07:35.4154
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HYprVXJ74s1nR1U+0VweVOGLGaZKG0QUX5NJ4BkYSVKc+HOFY6xFwiquFCO/njSK20S618bG27mrAb/Zc5VqV4UF1rzuRjCGBztyIPNMfwWk/JV58PNn48FtDdgW4PZU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB13019

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/cs530x.c  | 9 +++++++++
 sound/soc/codecs/cs53l30.c | 8 ++++++++
 2 files changed, 17 insertions(+)

diff --git a/sound/soc/codecs/cs530x.c b/sound/soc/codecs/cs530x.c
index 2c7e331359117..e0ea246edbd89 100644
--- a/sound/soc/codecs/cs530x.c
+++ b/sound/soc/codecs/cs530x.c
@@ -945,10 +945,19 @@ static int cs530x_set_tdm_slot(struct snd_soc_dai *dai, unsigned int tx_mask,
 				  val << CS530X_ASP_TDM_SLOT_SHIFT);
 }
 
+static const u64 cs530x_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops cs530x_dai_ops = {
 	.set_fmt = cs530x_set_fmt,
 	.hw_params = cs530x_hw_params,
 	.set_tdm_slot = cs530x_set_tdm_slot,
+	.auto_selectable_formats        = &cs530x_selectable_formats,
+	.num_auto_selectable_formats    = 1,
 };
 
 static const struct snd_soc_dai_driver cs530x_dai = {
diff --git a/sound/soc/codecs/cs53l30.c b/sound/soc/codecs/cs53l30.c
index 511453b4c3752..c9c682a312c33 100644
--- a/sound/soc/codecs/cs53l30.c
+++ b/sound/soc/codecs/cs53l30.c
@@ -833,6 +833,12 @@ static int cs53l30_mute_stream(struct snd_soc_dai *dai, int mute, int stream)
 #define CS53L30_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE |\
 			SNDRV_PCM_FMTBIT_S24_LE)
 
+static const u64 cs53l30_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops cs53l30_ops = {
 	.hw_params = cs53l30_pcm_hw_params,
 	.set_fmt = cs53l30_set_dai_fmt,
@@ -840,6 +846,8 @@ static const struct snd_soc_dai_ops cs53l30_ops = {
 	.set_tristate = cs53l30_set_tristate,
 	.set_tdm_slot = cs53l30_set_dai_tdm_slot,
 	.mute_stream = cs53l30_mute_stream,
+	.auto_selectable_formats        = &cs53l30_selectable_formats,
+	.num_auto_selectable_formats    = 1,
 };
 
 static struct snd_soc_dai_driver cs53l30_dai = {
-- 
2.53.0

