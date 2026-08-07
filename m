Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011031.outbound.protection.outlook.com [40.107.74.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78912259C82
	for <linux-sound@vger.kernel.org>; Fri,  7 Aug 2026 00:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786064212; cv=fail; b=CGUofgCetTuMQDxKyT4UpMg80smUlColNiM7aWKzoS6AKqNrAQLaK7Yk8jqmhQNzv+IkFOezrQ00owqlxqJIGwdXBrysI/E1pk/yi9OrP8ekbXDaeK9u/yXKh+rXmF9iK/f87hm9PleYXdKxoywBawz1rnwyaGzaQcl3OsOUvKk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786064212; c=relaxed/simple;
	bh=8rXfEFPi0gwkkpLp3GdIYkbJCsLL+j5gwxvBB4Q8IL0=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=gZH7SGwZuL3Ck21ySp/IHB7Mzdu/yoAYMC6bMBFOMIQqNSwf7ltUU6PuRyN/kf0k6kEpSIpFcl7ys7l8ppKgWNiIi3bGBHNWFnCDDDo/gZSrSTo5phvkDu7zksv0zLDRKtJJDRfw9RS3rlQiQbkQaYvF5YB34M5gX+EqGS0F6t8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=b6XxE8Rr; arc=fail smtp.client-ip=40.107.74.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="b6XxE8Rr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mkn6KlzKs2tn0wMsLF8j/DIBaWv6D1RFZEr+Z1uq//hif7EzddDViOuOdQoESZOON3oy8IpShDCt77KqUzGu1ZLBY+B3jc5rpG2iASM3mkVPovNnmtJ+uLm07hwERYxrm3UMhxt9sYtywmJLNahwkWz0vS5vSSWUGj1qpWbgLcLcjms0OE6v2NEw1sziOIPcB2VMEJ4e30QuvvRj9Z49sVdgjYQpdtndfdo3WViKnSUaXtDNjS8u6ND6/pu74Gz/cuSPpwycxzKLpla23ZJViB/5bZJqOD56PYsjwHfAcZRqYPr6FsLDLEi7YzT1zXLB7sTAqZhKMdHUAGwyOc6vuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eNVNtn94pHNOJbbcd6ibXbwU8LTBqs/RzKl3mM9Fa4A=;
 b=k+ZcWItdx7HmklVRBFnWInJBU6ZjHUtcHrJRQZASyG1ZMJ1KalGFLaMeXt3wMsW2UZA0o79pYU3ZlyzI0G5JlGzzZCNFvOPYf8wQv9OCIZRk90XQ/y70DH+Wub7G2UQwskuhoMOH9ySu1CSaFCDVuBGGONt7ECeWjugATlthtW0WqSUrKZjSQA3wUmHnoRxp/Cy+5jQJUEJpXwY1UQzy3IXbzksoODWdxxLNEKmfGRXVQHhNrojMBEHgqy0FOQb3rwwJDG33W/qBAHKna1pY0cBcqE5TeWC21wSnpGXSQAa4zrVsCKMbSwzUZ/WlarN/hHL0FuRQdiKiGob5u5YEhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eNVNtn94pHNOJbbcd6ibXbwU8LTBqs/RzKl3mM9Fa4A=;
 b=b6XxE8RrrQZ7b3LtllefLcsV4tGssQpUlddT8IpGEZUOa1I9HLR0rHeQ5xnwHhj6o4xCGQvLq56x2OsS7qcLTLVKJeisFKyi9VhfuliALVzEDFk1QHsj2fknkMW8F9Igv4tkz3dezCVzgds1+lR7Hh21We5pCiTeFMEisggmC/Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OS7PR01MB14460.jpnprd01.prod.outlook.com (2603:1096:604:38d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.23; Fri, 7 Aug
 2026 00:55:25 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0292.022; Fri, 7 Aug 2026
 00:55:25 +0000
Message-ID: <87a4qyu4ua.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Peter Rosin <peda@lysator.liu.se>, Takashi
 Iwai <tiwai@suse.com>, =?ISO-8859-1?Q?=22Uwe_Kleine-K=C3=B6nig_=28The_Ca?=
 =?ISO-8859-1?Q?pable_Hub=29=22?= <u.kleine-koenig@baylibre.com>
Cc: linux-sound@vger.kernel.org, =?ISO-8859-1?Q?=22Uwe_Kleine-K=C3=B6nig_?=
 =?ISO-8859-1?Q?=28The_Capable_Hub=29=22?= <u.kleine-koenig@baylibre.com>
Subject: [PATCH v2 23/44] ASoC: codecs: max*: use .auto_selectable_formats
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
In-Reply-To: <877bm2vjjn.wl-kuninori.morimoto.gx@renesas.com>
References: <877bm2vjjn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 7 Aug 2026 00:55:25 +0000
X-ClientProxiedBy: TY4PR01CA0025.jpnprd01.prod.outlook.com
 (2603:1096:405:2bf::13) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OS7PR01MB14460:EE_
X-MS-Office365-Filtering-Correlation-Id: eeca4306-9521-4f03-f672-08def41e913c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|52116014|366016|1800799024|376014|11063799006|56012099006|10067099003|6133799003|18002099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	cO1J+fs6nIM6+7l01W2cauSepCdfdgR8BvR/zRkph2iKaqACaLxky+HNm2zfO4abc1zuVvpdSkt3nfu4//pgmYGukLTxVR6lprhzIA54GECcMNo/fNAAEOpXmdBDm+wiNdajKfQNaintB1PPqutF7p0o++LOMvqVlAbWXJmHDsG5JdEvewuBToPBVJo3xwJhUYCIDvnT5W+8OzEc3cb/lWjEEBAeHkaYzy6pR1abOOIZgTVAQk9OGbMcjfNR72GfFONxl8kBCDf9nhpAIysbSAFe6UMvNbPV69WPYme0buL3dbsMlZ7unw/nQNEFINzQ+HMBTU5WuzMKMiqJAArAJfd4IhQM7MG+k/TUYTQaBUb8kX4cwTxejZd5/bYaos/GbfA063v754ItyfzfB3pDK1D2vLGRb/AnqrJY6BBbteyncLPp5hwgf/5PxRlPrCt5N5tm1aSGbhSZNlOJUmiM32aWIkHH1O0RMVtYbUftBzlmS5kLESDUhIhrerBHIhhdYolMQxBoIfFTl+gHWOUOQqhlaYyec5lWK4k2AKYSWhUMHJGXITqS0MjTc4HfLdoKU2D6G0GhlaufrHYEIEqf5IKB0Y5UPQRluHb5HMNdYjqHalIFYnRi4+TqEzH2SrNpyx9IYc5m8ttiJxxyPAFj6nzu6QZfOJoFP8fYExNxxUqtsz/pxjwUF16BNHhNKxDfo/mBa3wVqCS2HYt3gBoiQOLih2MPhKku/Q/HEJccMng=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(52116014)(366016)(1800799024)(376014)(11063799006)(56012099006)(10067099003)(6133799003)(18002099003)(22082099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?aiA2jU24TruMRmaMbFoAyvxxS+y/AEJa975Bu1c5cc3yJul5nWCCZHm8szQV?=
 =?us-ascii?Q?i9VI61jcSZymA8Mo66SetwBCZDjUgScFfHOpnxJPubqt1AQA1GEq+gl8t5uC?=
 =?us-ascii?Q?6MK5lcVE0J1ngDTR2U9w0eFOe8UUB4AEyWKsU9eC936cnsj4INdpD97wsuDS?=
 =?us-ascii?Q?fUxkyXBgQJ5DQgMtNs4hiv02l2cpsrPb3q+0ZbXRQEbdWgw/SPBVHThwbUrc?=
 =?us-ascii?Q?kpJwLXVsgukaVg9Vm6fNaCSyg0qJ0m4dlFAXGnqDjReNyU2FCLmkaez+AqFe?=
 =?us-ascii?Q?plaCMuXH2B9HFuAlr1BRZfeFeaebgDtStFHoaCZ46I10vGTQVNuPzDEkbTY8?=
 =?us-ascii?Q?Gr80BolkW26kKlkDStdy+LxAG21MndUrfVrcd4p/C1Ci0jEp5QRVIuMV0gFi?=
 =?us-ascii?Q?W2sSUEDEMotBXdl5kd0K0tMwFnTpB6G6FS8Oo/kR6BTPX75UacwhUNo17DZM?=
 =?us-ascii?Q?B2cvc3YPNcTvplvdamkh+U8s4fFrEnD2PYB8FOKREYRINiqPcSNSFYWnPSzp?=
 =?us-ascii?Q?yYqeEpBGS9k1iXo9Cjw97Gffpeemk9LL5MbetujKqN0QvDkZnuMZ7hgCA2Yh?=
 =?us-ascii?Q?h5vp9cc6H8NIr4Qs7jcly/J2WbZy515XHEZPiA+Qaj9ditQiguqVLkyWTymJ?=
 =?us-ascii?Q?cZ+zNNwy9rTuS/znlIwNtY1PmAPkMXKs0H4OQNOHIvT9UkbAhz2+VyGIgf1c?=
 =?us-ascii?Q?JoPSCzWrWlOGmhm4OYMY/xU5kZaDGZbFvrIjXcHaxjk3MziDFUNmrPnjZEUr?=
 =?us-ascii?Q?FZS2bWFs3yFDPmhbmkERrTpW98EA9R6a/USQOFSzdTQKlP0ZIVJqXULmIpWh?=
 =?us-ascii?Q?ETj5YGm1Us2f8bsfr8CVQXwq88nh5KaXcmuCOXJanvBm6JhnINHlg3rixHr6?=
 =?us-ascii?Q?+arjSugUeMrngF638KLCrJ1M98D8gPg5T8KP0VJ6FqjWE3MxJ6DIJc8WgcPA?=
 =?us-ascii?Q?ZMl2jTDYbV4I0O+ziKY/uRxpN3HCAkJZMD1j21Gvu2sXm4DwZdeEWZZQSGs3?=
 =?us-ascii?Q?WIrZh3xt3xq6LSGr8HSd0ZVdLVH8PAO/f0ckvoX1Kw6ygrVHq4xjIFJbCCJf?=
 =?us-ascii?Q?4fyhs6wO9yctjMlVlhY/3Lm0xt5VsLDw9qMtM6yQpTWQV+OKNYRVIVQ/O6Dy?=
 =?us-ascii?Q?Mi/vVTgXCm74FAvkJpGytOwERcAKf3XdJptle//EkFhIuNva+nBfOT+NvqZe?=
 =?us-ascii?Q?6RDCUKFlpMnBWhuPBVFURgcVy6oBTuLaW6PJeVJOmnao02b/o9Jdpw021XfO?=
 =?us-ascii?Q?+WxhIwFFRJIkHUMGASPMTgkEaa0yOjpDcDceQonVUVICD8ZuhT64d08C9kNJ?=
 =?us-ascii?Q?pbDLBOFNjZCqtQXh+9aWGHUJiO0yYSc5V2qHjaq4AW33KuwbhuDDMoCb7ivL?=
 =?us-ascii?Q?ihuY6cxwY4N2R2uSjoz5UgrxuOvRUGR1L9vv1YiiTj9HpbRrKKItVOPlXfex?=
 =?us-ascii?Q?GhiDfrsxFTzck76JlpQX0i5wXjqgmcW1BzlabkHKnMbTWJrIt5K4fHQS4CTi?=
 =?us-ascii?Q?l2yhAtpRkopMJhRyaTLphoGAklpEG1KWZ42i61MczeC8/OXjNUytDisbgyid?=
 =?us-ascii?Q?MWF5MZSSebEZ22asQIZmuiN0gcT5j9fD6KJAklcFsIFLUGuXoufhJO0ob8o2?=
 =?us-ascii?Q?a9drPsZR9TP+XDmVWgNbMkWUGbiseQ2EMSKTm7PNLSPCHxkVQvtAEBR4EQEq?=
 =?us-ascii?Q?wlcdwN4PKjCKVbnQYcnXs9+odqdWEgCbI8O9L57Ts26/vOgFDUqtrHjHPgIM?=
 =?us-ascii?Q?aBGjUx/cfoWyyYBITcc9wyBHUmCyvskAKaFex9KXaAWqZweLYJZ5?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eeca4306-9521-4f03-f672-08def41e913c
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 00:55:25.8034
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZTDMXPJTocGav99iaqpbckKNKszk2jmK2MvinN6tsM4Rp/KN612n1hq0bA27LHsJrWmTRn4b5kLh+FmOirGyoxAShZ5seBr8RoIH5ypOMBTEXmORQlzOip3jOhYH8yEJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB14460

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/max98088.c     | 12 ++++++++++++
 sound/soc/codecs/max98090.c     | 12 ++++++++++++
 sound/soc/codecs/max98095.c     | 14 ++++++++++++++
 sound/soc/codecs/max98371.c     |  7 +++++++
 sound/soc/codecs/max98373-i2c.c | 10 ++++++++++
 sound/soc/codecs/max98388.c     | 10 ++++++++++
 sound/soc/codecs/max98390.c     | 10 ++++++++++
 sound/soc/codecs/max98396.c     | 12 ++++++++++++
 sound/soc/codecs/max9850.c      | 11 +++++++++++
 sound/soc/codecs/max98520.c     | 10 ++++++++++
 sound/soc/codecs/max9860.c      | 16 ++++++++++++++++
 sound/soc/codecs/max9867.c      | 10 ++++++++++
 sound/soc/codecs/max98925.c     |  8 ++++++++
 sound/soc/codecs/max98926.c     |  8 ++++++++
 sound/soc/codecs/max98927.c     | 10 ++++++++++
 15 files changed, 160 insertions(+)

diff --git a/sound/soc/codecs/max98088.c b/sound/soc/codecs/max98088.c
index df438baf05dc3..1dd7881c84aa3 100644
--- a/sound/soc/codecs/max98088.c
+++ b/sound/soc/codecs/max98088.c
@@ -1342,11 +1342,21 @@ static int max98088_set_bias_level(struct snd_soc_component *component,
 #define MAX98088_RATES SNDRV_PCM_RATE_8000_96000
 #define MAX98088_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S24_LE)
 
+static const u64 max98088_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops max98088_dai1_ops = {
        .set_sysclk = max98088_dai_set_sysclk,
        .set_fmt = max98088_dai1_set_fmt,
        .hw_params = max98088_dai1_hw_params,
        .mute_stream = max98088_dai1_mute,
+       .auto_selectable_formats = &max98088_selectable_formats,
+       .num_auto_selectable_formats = 1,
        .no_capture_mute = 1,
 };
 
@@ -1355,6 +1365,8 @@ static const struct snd_soc_dai_ops max98088_dai2_ops = {
        .set_fmt = max98088_dai2_set_fmt,
        .hw_params = max98088_dai2_hw_params,
        .mute_stream = max98088_dai2_mute,
+       .auto_selectable_formats = &max98088_selectable_formats,
+       .num_auto_selectable_formats = 1,
        .no_capture_mute = 1,
 };
 
diff --git a/sound/soc/codecs/max98090.c b/sound/soc/codecs/max98090.c
index 60da518b0e57c..038790a2ae609 100644
--- a/sound/soc/codecs/max98090.c
+++ b/sound/soc/codecs/max98090.c
@@ -2382,6 +2382,16 @@ static int max98090_set_jack(struct snd_soc_component *component,
 #define MAX98090_RATES SNDRV_PCM_RATE_8000_96000
 #define MAX98090_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S24_LE)
 
+static const u64 max98090_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops max98090_dai_ops = {
 	.startup = max98090_dai_startup,
 	.set_sysclk = max98090_dai_set_sysclk,
@@ -2390,6 +2400,8 @@ static const struct snd_soc_dai_ops max98090_dai_ops = {
 	.hw_params = max98090_dai_hw_params,
 	.mute_stream = max98090_dai_mute,
 	.trigger = max98090_dai_trigger,
+	.auto_selectable_formats = &max98090_selectable_formats,
+	.num_auto_selectable_formats = 1,
 	.no_capture_mute = 1,
 };
 
diff --git a/sound/soc/codecs/max98095.c b/sound/soc/codecs/max98095.c
index c47bfa2378b89..787b62738c08b 100644
--- a/sound/soc/codecs/max98095.c
+++ b/sound/soc/codecs/max98095.c
@@ -1413,22 +1413,36 @@ static int max98095_set_bias_level(struct snd_soc_component *component,
 #define MAX98095_RATES SNDRV_PCM_RATE_8000_96000
 #define MAX98095_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S24_LE)
 
+static const u64 max98095_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops max98095_dai1_ops = {
 	.set_sysclk = max98095_dai_set_sysclk,
 	.set_fmt = max98095_dai1_set_fmt,
 	.hw_params = max98095_dai1_hw_params,
+	.auto_selectable_formats = &max98095_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static const struct snd_soc_dai_ops max98095_dai2_ops = {
 	.set_sysclk = max98095_dai_set_sysclk,
 	.set_fmt = max98095_dai2_set_fmt,
 	.hw_params = max98095_dai2_hw_params,
+	.auto_selectable_formats = &max98095_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static const struct snd_soc_dai_ops max98095_dai3_ops = {
 	.set_sysclk = max98095_dai_set_sysclk,
 	.set_fmt = max98095_dai3_set_fmt,
 	.hw_params = max98095_dai3_hw_params,
+	.auto_selectable_formats = &max98095_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static struct snd_soc_dai_driver max98095_dai[] = {
diff --git a/sound/soc/codecs/max98371.c b/sound/soc/codecs/max98371.c
index c8d4c68af5623..b62bd98f2252a 100644
--- a/sound/soc/codecs/max98371.c
+++ b/sound/soc/codecs/max98371.c
@@ -322,9 +322,16 @@ static const struct snd_soc_dapm_route max98371_audio_map[] = {
 #define MAX98371_FORMATS (SNDRV_PCM_FMTBIT_S8 | SNDRV_PCM_FMTBIT_S16_BE | \
 		SNDRV_PCM_FMTBIT_S24_BE | SNDRV_PCM_FMTBIT_S32_BE)
 
+static const u64 max98371_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J;
+
 static const struct snd_soc_dai_ops max98371_dai_ops = {
 	.set_fmt = max98371_dai_set_fmt,
 	.hw_params = max98371_dai_hw_params,
+	.auto_selectable_formats = &max98371_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static struct snd_soc_dai_driver max98371_dai[] = {
diff --git a/sound/soc/codecs/max98373-i2c.c b/sound/soc/codecs/max98373-i2c.c
index cbd7ebffa6d61..4e52282ace7f7 100644
--- a/sound/soc/codecs/max98373-i2c.c
+++ b/sound/soc/codecs/max98373-i2c.c
@@ -398,10 +398,20 @@ static int max98373_dai_tdm_slot(struct snd_soc_dai *dai,
 #define MAX98373_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | \
 	SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S32_LE)
 
+static const u64 max98373_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF;
+
 static const struct snd_soc_dai_ops max98373_dai_ops = {
 	.set_fmt = max98373_dai_set_fmt,
 	.hw_params = max98373_dai_hw_params,
 	.set_tdm_slot = max98373_dai_tdm_slot,
+	.auto_selectable_formats = &max98373_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static bool max98373_readable_register(struct device *dev, unsigned int reg)
diff --git a/sound/soc/codecs/max98388.c b/sound/soc/codecs/max98388.c
index d97dab41bf0f5..a653e0a21899d 100644
--- a/sound/soc/codecs/max98388.c
+++ b/sound/soc/codecs/max98388.c
@@ -776,10 +776,20 @@ static int max98388_dai_tdm_slot(struct snd_soc_dai *dai,
 #define MAX98388_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | \
 	SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S32_LE)
 
+static const u64 max98388_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF;
+
 static const struct snd_soc_dai_ops max98388_dai_ops = {
 	.set_fmt = max98388_dai_set_fmt,
 	.hw_params = max98388_dai_hw_params,
 	.set_tdm_slot = max98388_dai_tdm_slot,
+	.auto_selectable_formats = &max98388_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static bool max98388_readable_register(struct device *dev,
diff --git a/sound/soc/codecs/max98390.c b/sound/soc/codecs/max98390.c
index 66309e87fdbd8..f91e863868f6a 100644
--- a/sound/soc/codecs/max98390.c
+++ b/sound/soc/codecs/max98390.c
@@ -462,11 +462,21 @@ static int max98390_dai_set_sysclk(struct snd_soc_dai *dai,
 	return 0;
 }
 
+static const u64 max98390_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF;
+
 static const struct snd_soc_dai_ops max98390_dai_ops = {
 	.set_sysclk = max98390_dai_set_sysclk,
 	.set_fmt = max98390_dai_set_fmt,
 	.hw_params = max98390_dai_hw_params,
 	.set_tdm_slot = max98390_dai_tdm_slot,
+	.auto_selectable_formats = &max98390_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static int max98390_dac_event(struct snd_soc_dapm_widget *w,
diff --git a/sound/soc/codecs/max98396.c b/sound/soc/codecs/max98396.c
index e5a2fe824c03d..935319fee41ba 100644
--- a/sound/soc/codecs/max98396.c
+++ b/sound/soc/codecs/max98396.c
@@ -790,10 +790,22 @@ static int max98396_dai_tdm_slot(struct snd_soc_dai *dai,
 #define MAX98396_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | \
 	SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S32_LE)
 
+static const u64 max98396_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops max98396_dai_ops = {
 	.set_fmt = max98396_dai_set_fmt,
 	.hw_params = max98396_dai_hw_params,
 	.set_tdm_slot = max98396_dai_tdm_slot,
+	.auto_selectable_formats = &max98396_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static int max98396_dac_event(struct snd_soc_dapm_widget *w,
diff --git a/sound/soc/codecs/max9850.c b/sound/soc/codecs/max9850.c
index 9bd6a61212c1d..c229b732121fe 100644
--- a/sound/soc/codecs/max9850.c
+++ b/sound/soc/codecs/max9850.c
@@ -254,10 +254,21 @@ static int max9850_set_bias_level(struct snd_soc_component *component,
 #define MAX9850_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE |\
 	SNDRV_PCM_FMTBIT_S24_LE)
 
+static const u64 max9850_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops max9850_dai_ops = {
 	.hw_params	= max9850_hw_params,
 	.set_sysclk	= max9850_set_dai_sysclk,
 	.set_fmt	= max9850_set_dai_fmt,
+	.auto_selectable_formats	= &max9850_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver max9850_dai = {
diff --git a/sound/soc/codecs/max98520.c b/sound/soc/codecs/max98520.c
index 4fb98505db1a1..57759d85907be 100644
--- a/sound/soc/codecs/max98520.c
+++ b/sound/soc/codecs/max98520.c
@@ -326,10 +326,20 @@ static int max98520_dai_tdm_slot(struct snd_soc_dai *dai,
 #define MAX98520_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | \
 	SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S32_LE)
 
+static const u64 max98520_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF;
+
 static const struct snd_soc_dai_ops max98520_dai_ops = {
 	.set_fmt = max98520_dai_set_fmt,
 	.hw_params = max98520_dai_hw_params,
 	.set_tdm_slot = max98520_dai_tdm_slot,
+	.auto_selectable_formats = &max98520_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static int max98520_dac_event(struct snd_soc_dapm_widget *w,
diff --git a/sound/soc/codecs/max9860.c b/sound/soc/codecs/max9860.c
index 0d7ac37850bba..33f7059b19246 100644
--- a/sound/soc/codecs/max9860.c
+++ b/sound/soc/codecs/max9860.c
@@ -459,9 +459,25 @@ static int max9860_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	}
 }
 
+/*
+ * NOTE
+ *
+ * auto_select doesn't include _DSP_A / _DSP_B, because it has many limitations
+ * (= max9860_hw_params()). It can be selected via Card directly if needed.
+ */
+static const u64 max9860_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops max9860_dai_ops = {
 	.hw_params = max9860_hw_params,
 	.set_fmt = max9860_set_fmt,
+	.auto_selectable_formats = &max9860_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static struct snd_soc_dai_driver max9860_dai = {
diff --git a/sound/soc/codecs/max9867.c b/sound/soc/codecs/max9867.c
index 07a53ec2a18a3..f2214e3a19ce3 100644
--- a/sound/soc/codecs/max9867.c
+++ b/sound/soc/codecs/max9867.c
@@ -522,12 +522,22 @@ static int max9867_dai_set_fmt(struct snd_soc_dai *codec_dai,
 	return 0;
 }
 
+static const u64 max9867_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops max9867_dai_ops = {
 	.set_sysclk	= max9867_set_dai_sysclk,
 	.set_fmt	= max9867_dai_set_fmt,
 	.mute_stream	= max9867_mute,
 	.startup	= max9867_startup,
 	.hw_params	= max9867_dai_hw_params,
+	.auto_selectable_formats	= &max9867_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 	.no_capture_mute = 1,
 };
 
diff --git a/sound/soc/codecs/max98925.c b/sound/soc/codecs/max98925.c
index 4302ab16a642a..fe43ef99a0cba 100644
--- a/sound/soc/codecs/max98925.c
+++ b/sound/soc/codecs/max98925.c
@@ -484,10 +484,18 @@ static int max98925_dai_set_sysclk(struct snd_soc_dai *dai,
 #define MAX98925_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | \
 			SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S32_LE)
 
+static const u64 max98925_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops max98925_dai_ops = {
 	.set_sysclk = max98925_dai_set_sysclk,
 	.set_fmt = max98925_dai_set_fmt,
 	.hw_params = max98925_dai_hw_params,
+	.auto_selectable_formats = &max98925_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static struct snd_soc_dai_driver max98925_dai[] = {
diff --git a/sound/soc/codecs/max98926.c b/sound/soc/codecs/max98926.c
index 5305e1f9d97fd..d57620a3e958a 100644
--- a/sound/soc/codecs/max98926.c
+++ b/sound/soc/codecs/max98926.c
@@ -448,9 +448,17 @@ static int max98926_dai_hw_params(struct snd_pcm_substream *substream,
 #define MAX98926_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | \
 		SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S32_LE)
 
+static const u64 max98926_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops max98926_dai_ops = {
 	.set_fmt = max98926_dai_set_fmt,
 	.hw_params = max98926_dai_hw_params,
+	.auto_selectable_formats = &max98926_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static struct snd_soc_dai_driver max98926_dai[] = {
diff --git a/sound/soc/codecs/max98927.c b/sound/soc/codecs/max98927.c
index 524300d8fb0bc..d8dfaefdca7e8 100644
--- a/sound/soc/codecs/max98927.c
+++ b/sound/soc/codecs/max98927.c
@@ -463,11 +463,21 @@ static int max98927_dai_set_sysclk(struct snd_soc_dai *dai,
 	return 0;
 }
 
+static const u64 max98927_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF;
+
 static const struct snd_soc_dai_ops max98927_dai_ops = {
 	.set_sysclk = max98927_dai_set_sysclk,
 	.set_fmt = max98927_dai_set_fmt,
 	.hw_params = max98927_dai_hw_params,
 	.set_tdm_slot = max98927_dai_tdm_slot,
+	.auto_selectable_formats = &max98927_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static int max98927_dac_event(struct snd_soc_dapm_widget *w,
-- 
2.53.0

