Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011071.outbound.protection.outlook.com [52.101.125.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B2552FE56F
	for <linux-sound@vger.kernel.org>; Thu,  3 Sep 2026 01:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788398062; cv=fail; b=NWjyeXAZrfODHf4fQMBhgb7TwxzdeKub8X+0KoCghHzxRjwO279Lf8PjjmxPRGx+5o3EztiPVJXMltVtNeZ+U++aUnxw5+YXzF1WoS7I2C3Vn9yshs41k1A0QGIXpfQEDhyLoZm5/Pz2bLHZO/SRm6kx63zUHdTpfDsx9jYzBco=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788398062; c=relaxed/simple;
	bh=acs3fhQxHhsH6ADOQN65H5///3J7xab8qH8VCW1bmP4=;
	h=Message-ID:To:Cc:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=lsuWtwqYFh57Jd7TGH7i/cSyaxv21r6QICz0XyR1jSwjbrl21EjQq/B90knFPCz/LAYE7pAtdSIQ2m4N6IvtpTCQ9+bL8Mtjhk98NxPuS2RgUAbDXaUu6Rx8QN+hcz65017eU2f7TqiPimtWseQKeY+b8YzaaWfddq2zaamuXvE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=K3dwoXiM; arc=fail smtp.client-ip=52.101.125.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="K3dwoXiM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t+L7wz/yVFruYiGbKnIKeHkT3doyzhNes58fmXcyaAslJ2OTAs8vX0nHIR5BIZdrt0rzIBUBirjvb3zkQl94PaAUVRcBuRnpezEsVt23b/g5yhFLOQ1G9cN+5WQlIJ83Y98oYKfmix6TySh+m3jIehPpLGtQ97QkGwXL8o+/q77r4KtDsGmAmFxfkrprxw7lSd0xaFhnFsLYeiHwKyJIKeQ4i/CgJyWhazmDI1X13OlM5P/6IjUQtD3LBN5c3mv3qNAS5cmpAU+CmWh3rojZFBQtAfqVR7gdLtVsR0DbItSzvSPhSfVqkjLr6xdOkRgS4h4QcD+U8dYOLaFAjwn1Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5g799T9rrMMesIiswEEgr2rU482kdQiPj70089UkEHQ=;
 b=jKkrFiyWztF/ktuMDvPDirh+EmrlWiz1DNF1dFkXCWS7u+WVWhPhqZRgVF2rejICcvrfapCnxdzouKdaIIpxr/FE+WG8fvo6bhP1GXxXiyGspoGK8hmLd92lS7+f8wN+TzQdiTg13YnZkh7NL+l3MthJkWie1EUeqKz2W5JjB7+Xhk4SoMOj8g8Ip1fbpkzSqPT61UhF6JIVnfPJuHvOlDGs+Y8Zooge5Kk67+IhG5UfidmKkvjGlZJggR40SHt3aJ869gIoPXJdA9eYHvwlp/Yftwis2zlf8t0p+93/LkVM03GqyxKpsFpSoeMI5Bh/k1ZLH+8htqPZyZ4TKwGGhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5g799T9rrMMesIiswEEgr2rU482kdQiPj70089UkEHQ=;
 b=K3dwoXiMdkFHIZdKjHHvq8fJ53HDuFASoXF1UP2Rqoq/ciYrdyRLVNaI+oKebqsJc85Y//rJIafyrrW3IbE7d4+3QmqMCpxNVPfs+xYXU36h03EHfr1i6UHQOZY5FiA5TxAGn0pc2GWUAHyGh2BSLn2nBFL3Sc6Z2/XnUW0EDew=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYRPR01MB16474.jpnprd01.prod.outlook.com
 (2603:1096:405:2ee::10) by TY4PR01MB17164.jpnprd01.prod.outlook.com
 (2603:1096:405:367::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 01:14:17 +0000
Received: from TYRPR01MB16474.jpnprd01.prod.outlook.com
 ([fe80::2a39:9988:dbe9:894b]) by TYRPR01MB16474.jpnprd01.prod.outlook.com
 ([fe80::2a39:9988:dbe9:894b%6]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 01:14:17 +0000
Message-ID: <87h5k7yw46.wl-kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 13/21] ASoC: samsung: use .auto_selectable_formats
In-Reply-To: <87zexzyw5v.wl-kuninori.morimoto.gx@renesas.com>
References: <87zexzyw5v.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 3 Sep 2026 01:14:17 +0000
X-ClientProxiedBy: TY4P286CA0044.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:36e::15) To TYRPR01MB16474.jpnprd01.prod.outlook.com
 (2603:1096:405:2ee::10)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB16474:EE_|TY4PR01MB17164:EE_
X-MS-Office365-Filtering-Correlation-Id: 21a9cbff-a219-47d7-12de-08df0958ad31
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|23010399003|366016|38350700014|6133799003|56012099006|10067099003|18002099003|22082099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	Fu57IR5qRd/9Y4nGbR90ZybBsD+sSEzLeG+CEWDGwXJwo2R+09JrNBXoZkaT954G/+qLY20kQbFaQQ4DPfgndStWAphjfmk1bcfGwCw2Ops/b2rKzOouGh3QAUorq5pqksQvRkIEWpXyvJH1rwh9jpoGQrZKcqSiGqkNRk3ixKx9jm6WCytUzU37oPl3ltwXGlD8LriQYkokzFgFDpmof+4qHGOeJ7qAaOx649xxghlqS0E1sbN2BuP/YX2CuWgo1S2Ods96SWy1Wnrr9R3LDypzK84mf1K0ZCL8mkP0ALOa8hoDvkx+WWpfPNqLQORbQJrQh1N2D2jPZ0Z/63iYIHhwT8A+/Tb9Z1VodGjHbRKnfvBrUXkk1PTOl+Myo0zP2A5i4zuJQtScSAAhZrYV0AWQMy/v4ymd4++i40OkIEinA/d/7aTNTAEXJePb9jnvLJD3gchIEvOnwNwJgUsyTyaaigIRazWQkYU3jH8lNAprNHv8H/DcVlVqGEV9sg/zoDQk0i4Lt7beO57c1hPm2nSMrZQX8jl9x/wz5Y+U6T2ZicMNUQlo67fhoph1ALZHeKgYSbpkaRhrU87YPx5RdsSJFbh20spkxPaVdEnXaWBfjfggH18o8QIcLb8+WZD3DsCMFhZeoG6WDrx0fv9i5atEI3lPCDdXlw7fQb5gtgT/YFck99g4SeF+NQkAyC1QaelDXWyXbBuA7V96HUN9Tw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB16474.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(23010399003)(366016)(38350700014)(6133799003)(56012099006)(10067099003)(18002099003)(22082099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vU8T4HnLNh2L6lKI8IsGVoOy69YLoSN8Uo2CnOedlpqvnoR5llSlOPF2cUJU?=
 =?us-ascii?Q?S1TDX/Ze4w/CqOIRFG3l5ZIM4U1ntRblEPSkLbDHM1SE1FnMqI6hovS3gvbu?=
 =?us-ascii?Q?ML7qmQcxdTKeXOTCbGLkSJYFRbntZwD3ptCWcCP7QanWNZKxUmMj06fFUFl3?=
 =?us-ascii?Q?JtRtPb/+nyVhaw2uWHeQweBabfUDFLXOQEKsJq3dTsnItg0HEPXdGiwoDkji?=
 =?us-ascii?Q?C7xs1UR5xV0UuIENR7I5eash7OtbQWSeNjiTUag1LZd19fZKJRNUX7JDBtip?=
 =?us-ascii?Q?BYVuw5FasR18WzqOaFUM03Wa2AaGvmbD9kfGJ2aILEn0EW4tqDFZZaBwA+9l?=
 =?us-ascii?Q?6+PgoMmorgMBgn+d4xmUbhjFoAJSky2qhy0GE7attIc3J3NJ1ECnrh5B1Soi?=
 =?us-ascii?Q?9jLbEy27T30iVl+ge/iLEMTYGpmn6mO7B1uesjUAZXEFXpvGAr5uLH5oOU/I?=
 =?us-ascii?Q?6IwZLGne1tjuDOFei1I6v8Vjs92cQCBDlqRsQwPjWKqOSLGEdjIvangKmIYO?=
 =?us-ascii?Q?5Fso9FPKwCocOFhSyiPKLNjAlXCwJKxphsNhRnEkQpIhHNMjCP7hhrnHCBxK?=
 =?us-ascii?Q?k1x7LLnBPeN4iA736dpxWokKHKpUcbnTE7m2Xgq6XG8KOc/xiwSe2wq4Sgvh?=
 =?us-ascii?Q?n5R9CFTFYRHe39f1LOUduFp9/MIh1TVDwFXIsYz5U8U2cJk/J6jdnRXBguBx?=
 =?us-ascii?Q?ruAmf0Ek2s0MylKAXhhIfZKR1Zk2JXju9BcaEof0lEfakOV+F78qNHpwBvR/?=
 =?us-ascii?Q?dM3Or40AU549L5J7Tdp7iA3jBNN9Hkpwh+0sRxY8zDJWvQcd/VE4YwVHjzA0?=
 =?us-ascii?Q?6yUupoecZvx0beVD0rgbcywfaTuKbX6+E9r+EQYZMUQ2OON0ySJrQhre97Em?=
 =?us-ascii?Q?5MqhzGggDu3XFXWeyOaWFt4CqBu1bzcz2eTB0Fd+u4+d2hA4mGkjYr7WBlr4?=
 =?us-ascii?Q?EXJTpcRPWAYj9n6DBld+z1ib8HpVMKMlbwpOLHacEycIyZ8mLwGtAPtkENOX?=
 =?us-ascii?Q?RW9vvlptIShcCVlMbiTzrUDO4UUnGU9e3dqVMiY9Ylw1Z58iN/tYoG8sNuXp?=
 =?us-ascii?Q?d4MCy+3T4kG5CbOUZzScQowJ5F8dYUY/M883FQGS1xZqDo3h4pYFKH9xtc+L?=
 =?us-ascii?Q?TnR/Ibi+NLKHQtw1ULwQKm8DbVH7KY9NLTnOMx84921HNxvvgXcsY/t+Vffq?=
 =?us-ascii?Q?oPEUvoiLLHalCEH9VnAngJ14Q4cGxQiNSRgI7YAfZG8DbugxEPRi8vhVepgP?=
 =?us-ascii?Q?0dSd1ZygC2kSWlc4GrwUTZFyIzGfa+xJYIDXxyh7mVSlc2iVnjWRMi21m6m5?=
 =?us-ascii?Q?7/IxA8ccbzH0SF4HqvpXpEBIW9ofaxcvfgsCDA5MzP/2/yX7R5O4KoZadEGl?=
 =?us-ascii?Q?g9FGOiQmOBUKHCR/fA1Uizm5nsbAkwrEk2CStwUw5uL/eptZ/yPbJb/mZ00+?=
 =?us-ascii?Q?bqY7UPLTejOXoAFEncv68vBtInTjPb8//qg/QAQaZqhhmLJcYJTXTtwGw5SV?=
 =?us-ascii?Q?QPYmPLYAyidk+k2gbs4p9D8CePQb3IFRlcZQnF6z56jL8/9pHtb77f2OPRRf?=
 =?us-ascii?Q?y9/d1s60xsA/AOv9976tSWhQ90k+546EaC/EgmhWla0dfEqZ/oERFHMdCs/Y?=
 =?us-ascii?Q?5amT/cBxPZrzi4+PTpEWa7sIXsPdi8pizdZ5BJz72FZppLRKMeAAxCyyikfZ?=
 =?us-ascii?Q?Iq4UaN4cOI44v0WI2xrr8gMB7YuuRKdBcadXAQrtrCeSXoev4GXG1jg7ZXaR?=
 =?us-ascii?Q?EMlVbL71+KMHPvBuvxdAGPwlS3LEXhRUMq0r6JyOOznOpw1YjcF8?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21a9cbff-a219-47d7-12de-08df0958ad31
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB16474.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 01:14:17.8711
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HDBZjMeg+ADqfyZwzYj8tEYJchnffdtBV6eULlokmezDZbTiUaBthPgKa1Y7bzt2CRGAifnU8lrbhMvmqadJVamciZR5h9ldK6W2Zadfp0OoTCAXSpojHvhJT6EkxYBE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB17164

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/samsung/i2s.c | 29 +++++++++++++++++++----------
 sound/soc/samsung/pcm.c |  9 +++++++++
 2 files changed, 28 insertions(+), 10 deletions(-)

diff --git a/sound/soc/samsung/i2s.c b/sound/soc/samsung/i2s.c
index 3e76cb81462f0..b2047017ae268 100644
--- a/sound/soc/samsung/i2s.c
+++ b/sound/soc/samsung/i2s.c
@@ -1092,17 +1092,26 @@ static int samsung_i2s_dai_remove(struct snd_soc_dai *dai)
 	return 0;
 }
 
+static const u64 samsung_i2s_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF;
+
 static const struct snd_soc_dai_ops samsung_i2s_dai_ops = {
-	.probe = samsung_i2s_dai_probe,
-	.remove = samsung_i2s_dai_remove,
-	.trigger = i2s_trigger,
-	.hw_params = i2s_hw_params,
-	.set_fmt = i2s_set_fmt,
-	.set_clkdiv = i2s_set_clkdiv,
-	.set_sysclk = i2s_set_sysclk,
-	.startup = i2s_startup,
-	.shutdown = i2s_shutdown,
-	.delay = i2s_delay,
+	.probe				= samsung_i2s_dai_probe,
+	.remove				= samsung_i2s_dai_remove,
+	.trigger			= i2s_trigger,
+	.hw_params			= i2s_hw_params,
+	.set_fmt			= i2s_set_fmt,
+	.set_clkdiv			= i2s_set_clkdiv,
+	.set_sysclk			= i2s_set_sysclk,
+	.startup			= i2s_startup,
+	.shutdown			= i2s_shutdown,
+	.delay				= i2s_delay,
+	.auto_selectable_formats	= &samsung_i2s_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static const struct snd_soc_dapm_widget samsung_i2s_widgets[] = {
diff --git a/sound/soc/samsung/pcm.c b/sound/soc/samsung/pcm.c
index 309f024bf2a4d..9602e4f21a3b3 100644
--- a/sound/soc/samsung/pcm.c
+++ b/sound/soc/samsung/pcm.c
@@ -422,6 +422,13 @@ static int s3c_pcm_dai_probe(struct snd_soc_dai *dai)
 	return 0;
 }
 
+static const u64 s3c_pcm_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_GATED	|
+	SND_SOC_POSSIBLE_DAIFMT_CONT	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF;
+
 static const struct snd_soc_dai_ops s3c_pcm_dai_ops = {
 	.probe		= s3c_pcm_dai_probe,
 	.set_sysclk	= s3c_pcm_set_sysclk,
@@ -429,6 +436,8 @@ static const struct snd_soc_dai_ops s3c_pcm_dai_ops = {
 	.trigger	= s3c_pcm_trigger,
 	.hw_params	= s3c_pcm_hw_params,
 	.set_fmt	= s3c_pcm_set_fmt,
+	.auto_selectable_formats	= &s3c_pcm_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 #define S3C_PCM_RATES  SNDRV_PCM_RATE_8000_96000
-- 
2.53.0

