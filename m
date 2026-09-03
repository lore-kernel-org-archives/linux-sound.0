Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011051.outbound.protection.outlook.com [52.101.125.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 886812FFF8D
	for <linux-sound@vger.kernel.org>; Thu,  3 Sep 2026 01:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788398069; cv=fail; b=qdP53mIx6lFjr3Q20+V/SY5EjLoK0yffz/65FBRPumiQllzcwGTwA6KHMd2W4D650UnaPdng4EHzxKv1gEl6TdVFNrCX/knxU4skt80ECVzvzUGdBw5v2CXZzyq85tPnY0FetBG4P1HNzCrdUdrdCf2eqJeAOrPWIFcvaJ8FLWo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788398069; c=relaxed/simple;
	bh=aHcZDRGazSel/k98xmN6C6WYLC3JwRTqmOp3h/M0bsk=;
	h=Message-ID:To:Cc:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=DJYR79ukVlhndKn1LSwzhs8e0f+YOrWfDfZaMQtsHXeSP/sG89PRplu4QDGNoZFQJrAo4OImleO0rShG986MX/KKnknpS1BPqdhFknLSSRGktqo2+Zi/i65DnB2Q1OUfT2Gzb90gl+3dX27imR0PR9EmW3RmiwCriSd8PPoM3b4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=OK+vrN0N; arc=fail smtp.client-ip=52.101.125.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="OK+vrN0N"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qEqHAvwSusigGQcYtTSKfz0Bn9+PbYjHMZvGZADpdyQ/kGaG5/BDz76jNhbiWD6kFziVVg/zfrd/B5RGEkBA96Uzv4G56nh2KsUiT+aZrSDz3epbulZyRK5yGWvxxhTWwbYkAU39YuEeeFdahCBGdDILU9brJhLVTX0QQCncOPGq9vPguNH7+xp9ACaFQxyv1kyPKbl0VhJ3sFhBj2ILPtz/aHmnQLFt5rJQnSFKNt0sHapQuIKvIviHLJy9p03VK/A3jVw4wscwnVEt6Ap9Nq+Pev+C4PhQq8WyoKAuAWTTlyaIYiX06/cw2RrsSfLXHcUaQESkPVLSBE66fvy2Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PKHW6jD+wuzbOeX5SzzKRVIBU1mBQqg9YRr6VWHVTQ8=;
 b=xcx/BiuXNJ3wsaOjQAoLnWmwM6M6mGWuSVekwNPoskj5wnQtaYB7zlasLOgcNaT1omnbJTFrywggK2qdz44UylxbCn8vDeTD7auT2UbbITbwmTuTsccXANXngIGTXXe+LVgT3yOVMR2WiRrETOgypPFfNSV9B52DB4jVMeDaTk1eLwpUjcyCxWjZYdPZ/5QzQC2tNYTWC8KUjYfSXw0Om2QukMSxIqwCiavSKNgQ0/82NNpB0kEZupSVOb8teai/Km/eJBCEIDiBUBolFvSofiTiMl1VHLAL8Uvvh+1Rerawee36/lGaCndR33nLEdVke8dj7q2ucQCMankgZtrHvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PKHW6jD+wuzbOeX5SzzKRVIBU1mBQqg9YRr6VWHVTQ8=;
 b=OK+vrN0NQ8nS/auvns8r++jhNDxx+R1xi0QbzS7cQijasy6OQQWrfF69BYCLuARrPGIxDMTZRCh0z9BZdO7qe1R9GwiCLS31ywNfQAEkgZBjYJ+QrPcmD0P/zgTgYukwczl17iX1xLIXGYzlnybjVT74uC4+uAp1XJyYNAxeiu4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYRPR01MB16474.jpnprd01.prod.outlook.com
 (2603:1096:405:2ee::10) by TYWPR01MB7169.jpnprd01.prod.outlook.com
 (2603:1096:400:c7::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 01:14:25 +0000
Received: from TYRPR01MB16474.jpnprd01.prod.outlook.com
 ([fe80::2a39:9988:dbe9:894b]) by TYRPR01MB16474.jpnprd01.prod.outlook.com
 ([fe80::2a39:9988:dbe9:894b%6]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 01:14:25 +0000
Message-ID: <87ecfbyw3z.wl-kuninori.morimoto.gx@renesas.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>, Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Olivier Moysan <olivier.moysan@foss.st.com>, Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 15/21] ASoC: stm: use .auto_selectable_formats
In-Reply-To: <87zexzyw5v.wl-kuninori.morimoto.gx@renesas.com>
References: <87zexzyw5v.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 3 Sep 2026 01:14:25 +0000
X-ClientProxiedBy: TY4P301CA0117.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:37e::8) To TYRPR01MB16474.jpnprd01.prod.outlook.com
 (2603:1096:405:2ee::10)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB16474:EE_|TYWPR01MB7169:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b49de93-6377-4ab0-2bcb-08df0958b1ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|52116014|376014|23010399003|366016|38350700014|6133799003|56012099006|10067099003|18002099003|11063799006|22082099003;
X-Microsoft-Antispam-Message-Info:
	nt//PYM6+1aI61uNKHQQz2Zv/iKNHEJz8nigbG0p+TZz4sB9BXnkHE6a/E6CgTxOriY3vrF6RzV/q8qCrcflFnf6TAorZXPq4zEZ7y6vvkv/U23MZ/27dQV2/hz9Dr+k7hD6TgiKkka7Sd+IEEuKY4HYx2t2yjISzvIaXF/79WpKMz94Pmrri603soRr2Lt9LpA8IowwUGm6lYVfxtj1I1t5Oih/x6ajYTddjWJKKIAM9m3qsQk/K6w5C3z+Tqo4spPy4EBrqWAtxA0WqTZSQMoG+/320S+NU2Ka7Wz4F1VYaQNDO0rLIFYULKSDEhQATX2j5vx0ULwuCXuBp27puRZp+nO3vdvfj/zX1NWjfIJdPUs/3q6KJ1zwex3s47zSZvHuTACtIRagI+KRfSlTL2iYIVQBCocD/oFoTxeBk3W6Kp6gHzUWcGqr+2+Zn2+arlRse9s43brhC3KnidTybdkIf2b0JOJwYTTZQyKlIqCdEIn859oVRcWdFbfc8TPREEpCumei1gek6awt4P3MZ4kZEqNXlX3jSHj+z1ALe1W3IlaJMjcdoCeucSxEL3bKHgFtt7rXTMAGSn/In//yI+pKgM3ivOdry+DluYb1Kb35B2MD60bPtuBPWykYS0jztUgAriT+wYNHI8s/ivBy4o/k0wOxhDzixvHKkzTH9BnLkKdyQmBWAE1zoPH73kzp1ps6JlkdOAVzmBV5ATLnjAPWRTvcanPSXT9q4gOCSzE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB16474.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(52116014)(376014)(23010399003)(366016)(38350700014)(6133799003)(56012099006)(10067099003)(18002099003)(11063799006)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1l+gv39tzjiLopebvVMahsIb+PHEHR2cij81OX+hZgtA5QUebQT8ofdWn/hk?=
 =?us-ascii?Q?hyT6NrpI5Qr/pbsZ8CXlj5/q+dsn+rVwaveP0e/8pxGQcZl7BIE/BV1fV8jY?=
 =?us-ascii?Q?RVgAA13wGjtouRFAcCsi3YYUMZTwsLmy2oqBh3q3pAJY4Mz1sCycvKfN2RrA?=
 =?us-ascii?Q?wYzU0KBlIJaOLQtF6hWPGkqmIBi+kYCcMrT6AL+8USpcQK+4BJFCDFRPqp+o?=
 =?us-ascii?Q?fa5knCb8WpuhY8Ap9FO4fkHZToNbQNWTxn2RJhrzvwsAQI96uoRceZNYWZR/?=
 =?us-ascii?Q?V8L9zd9EA+nCmjOVGTBErbxGoqDdQzeevQ6hLgm/qanUL0ZcaIOzQaQuI1p8?=
 =?us-ascii?Q?1jrTwHCS+GvFNrfWHxGsmp2anqALymF9tD3WvEMf6qs4Z1iVvoFb2OrrBjqk?=
 =?us-ascii?Q?x0i4MYyIle9TTMDrZld9RmHy+MrTgHdoeFxf3hVhv1mNxnkq13Zs4R5VqJ4j?=
 =?us-ascii?Q?zArNzyYHG7yfV+C5l7htXORO0GuAwK/ztHaPdfKMSMcvhQpeyCyfXRI4rERc?=
 =?us-ascii?Q?MoG2n/x0L09QXbzZXp4xLKKNuLZ8SF7I5lPbm5aejYUzB/Yh10sAu/iyjuq/?=
 =?us-ascii?Q?yGnMDHlV+6NlOp3fgXtOIhxmOxXRd77yizqfNbYL6uh+BSc77nIcptqKHPEy?=
 =?us-ascii?Q?4h6pTd5i8kdToTRzKf3P4Wbvfu5xeoG6Zdc4HMwjpM4Iq+VqVuAHFLyk2D0f?=
 =?us-ascii?Q?Y764EeqSEz2Z9thcyTVd2OFH7YKNh/Wh5fDNlCtnn0uhiId866EpkeMHF0uc?=
 =?us-ascii?Q?yLz+nGlgneQJ6bqvVGquBZZG2PJyD44oQfYjvIRe+/ncFav8MddWueZgSeCn?=
 =?us-ascii?Q?TVmQFwoFSwgTVMc4Fc36Xpa2lvPQdSTOZrgMeM/bmOHMyReesk66Z5ISzXqu?=
 =?us-ascii?Q?axzJNIS3KAHVuUcJ9NNG7NovEjZVi4eQ64nwWnEBGZp6tqU14hohhE23gCDr?=
 =?us-ascii?Q?/rUqiS3IKF4ChQRfqoEl6iUxv4oZ44t4hWC3k9DqqWIIMdOvQQuIryeEdhjc?=
 =?us-ascii?Q?qBqUVhA/v1HTBCNroLRZhHAN0rqxNeIfJuM9KQ3SaXwKr5w7ACUxQlLJX2FX?=
 =?us-ascii?Q?weq1BZswwp8n4lmRm9DGGF1lZNbZRTbzOJcW+waCMwzx7sPawffgbirRsGpl?=
 =?us-ascii?Q?Ci6CIXZXtYUzkWmkQqjqtlFZKph0T5KESLHRuTTXNmcPsLQPiVSX/L7YoZTB?=
 =?us-ascii?Q?qTFvoRoXLSgMhbD3RBfWMbSX5cbqF6D0kJJW/Iybc0SymlinfQm46/RsHQZ8?=
 =?us-ascii?Q?pPqw7QtrikbMrP2C7FoRYHN9xhkntRFwSyyB4DUGHL7b6xyzloyn0zOsKwwZ?=
 =?us-ascii?Q?75tpf/ACUz2izMHnAIrtOHlkuHnFD20nm1v+TpEOcYyhMvtYehof1Q68GhPn?=
 =?us-ascii?Q?YZjKscs7hlokIOs2zc+QyPMUU7I5oucGOmKo91feS7rsd8GhXHXTubPdLrdl?=
 =?us-ascii?Q?RenQUyES+L2mSzan6Y6w1ndTsK2VoCLi+r3LduJ7vOqnydHjw9uZDb7OKylE?=
 =?us-ascii?Q?XMZd7wgtD7PcxuEeuc+9y1or9VHPdatVJ014fpwtEbMzLXbK24q91mff2JMo?=
 =?us-ascii?Q?tspTAUruWBh/amOjhuNeJyzCga9Zs5E9CX+BdjqR947MsmID1cfRBfvkdFFH?=
 =?us-ascii?Q?HePf6BZThIeEnKlJD8XkFMWcU3b2FwzEF44mvbr8uyHKF4ldJbwMvSd8GNZt?=
 =?us-ascii?Q?MHBqthf7g7i9ib/iTe+qtDpEgDUM8QIFoPu7qni69/LvOBxov/ieix5/63Sz?=
 =?us-ascii?Q?P6XZU2qafvZtdm4hxkyBnWj/CHpt2ecY8l/+BaTAWo75Q8Vq4sue?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b49de93-6377-4ab0-2bcb-08df0958b1ac
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB16474.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 01:14:25.3486
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6V3auTR4mhf4rz9lDfggyTSW/KsU7zz6z8GtLtt0m1og1u4391i26MtnjHQXD3r1dg8UViVANi60tLpIRwhyvVvecxK6emEmDUju2CgacmOSv5HYemSXtmu5NWsnn2tp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB7169

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/stm/stm32_i2s.c     | 12 ++++++++++++
 sound/soc/stm/stm32_sai_sub.c | 15 +++++++++++++++
 2 files changed, 27 insertions(+)

diff --git a/sound/soc/stm/stm32_i2s.c b/sound/soc/stm/stm32_i2s.c
index 83b51893b37c8..a59ad94423726 100644
--- a/sound/soc/stm/stm32_i2s.c
+++ b/sound/soc/stm/stm32_i2s.c
@@ -1089,6 +1089,16 @@ static const struct regmap_config stm32_h7_i2s_regmap_conf = {
 	.cache_type = REGCACHE_FLAT,
 };
 
+static const u64 stm32_i2s_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops stm32_i2s_pcm_dai_ops = {
 	.probe		= stm32_i2s_dai_probe,
 	.set_sysclk	= stm32_i2s_set_sysclk,
@@ -1097,6 +1107,8 @@ static const struct snd_soc_dai_ops stm32_i2s_pcm_dai_ops = {
 	.hw_params	= stm32_i2s_hw_params,
 	.trigger	= stm32_i2s_trigger,
 	.shutdown	= stm32_i2s_shutdown,
+	.auto_selectable_formats	= &stm32_i2s_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static const struct snd_pcm_hardware stm32_i2s_pcm_hw = {
diff --git a/sound/soc/stm/stm32_sai_sub.c b/sound/soc/stm/stm32_sai_sub.c
index 9a201bdb306f9..d00377efe3f99 100644
--- a/sound/soc/stm/stm32_sai_sub.c
+++ b/sound/soc/stm/stm32_sai_sub.c
@@ -1358,6 +1358,17 @@ static int stm32_sai_dai_probe(struct snd_soc_dai *cpu_dai)
 	return stm32_sai_sub_reg_up(sai, STM_SAI_CR1_REGX, cr1_mask, cr1);
 }
 
+static const u64 stm32_sai_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops stm32_sai_pcm_dai_ops = {
 	.probe		= stm32_sai_dai_probe,
 	.set_sysclk	= stm32_sai_set_sysclk,
@@ -1368,6 +1379,8 @@ static const struct snd_soc_dai_ops stm32_sai_pcm_dai_ops = {
 	.trigger	= stm32_sai_trigger,
 	.shutdown	= stm32_sai_shutdown,
 	.pcm_new	= stm32_sai_pcm_new,
+	.auto_selectable_formats	= &stm32_sai_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static const struct snd_soc_dai_ops stm32_sai_pcm_dai_ops2 = {
@@ -1379,6 +1392,8 @@ static const struct snd_soc_dai_ops stm32_sai_pcm_dai_ops2 = {
 	.hw_params	= stm32_sai_hw_params,
 	.trigger	= stm32_sai_trigger,
 	.shutdown	= stm32_sai_shutdown,
+	.auto_selectable_formats	= &stm32_sai_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static int stm32_sai_pcm_process_spdif(struct snd_pcm_substream *substream,
-- 
2.53.0

