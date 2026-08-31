Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010016.outbound.protection.outlook.com [52.101.228.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D7B3C4555
	for <linux-sound@vger.kernel.org>; Mon, 31 Aug 2026 05:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788152897; cv=fail; b=UlmAh+MMAjpnHSNZx72KFMrX2VXdamiXacb7DlhqycA3HnDBhqj9lU3rVQTS0+cEosCvRBH296EGZqTVQsDeZWdta80Vi3f77O+E3rseaEQ8++hqlsl3MT0zjDq2itXtyYe/u8TXTI+9T9Cdg1wJXyiXoFsIZci9TrMYFxzvNgs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788152897; c=relaxed/simple;
	bh=voYSZZkS116oRFLDax2KSjTLbbSHfGdkyPl9KAXui5k=;
	h=Message-ID:To:Cc:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=mJ4Ht0AM4mIWjFK82Q4EX/gIGlHnQmINAZRZXU9dNhAKa6EMZqCSkT05RyW+KAcvlGl9+LpHYhN/Kw+r8g5JVIPVglBwp4913GWLlVvF0vAas70T/dJbYIHa4KoX90TecyX3zOPVyz5cE0x6CpLhb7A2GLVJ/PoE9gfxnzzdOog=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=EBGIIdy7; arc=fail smtp.client-ip=52.101.228.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="EBGIIdy7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ssreVjGuhX8UboAKAqs1oh0xB6P0FsmZsJbeSC8qTlktR2IyM0Rb4bNbz/+nIPSK0LblZQ6MyV2XKOld6yOqusPAOTUmuQIHWo5DKCTowTors61rDEis7sc9CxWCyY9C5Qpi9W25w1exCaJtOcgWsPuUO5g7JZ7jmfJAEQP00P5asaw3u/r1dgwr7mSRvXiCN19hGlfIMBlSElcSk/05mzzUm26ANDIt+zcqH6i/d/mtSVQnN+/y/g6lThUAT5NqyA1WNR1qLv2Q0sajZ29pxYHq8tykkyHL11D+5XNSG9YN75bKWcboZYL+DfBsjDMbJftMPvy6z2z3Tgdh/aa0oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=02+Nk/kkYTG4CAxbqEqAvVS49hOjiT/Wqq9rXirC1jc=;
 b=dtyqi7X0KXoNPlmjCA9IIBhtKlFwLFi0C7zJPc7FcjdrmcKAGAqq9s/TIpnp/PO7wtS1GppXMa7dCeByhoQ9XiasZK2qK3zXpx85JkD9Bs8SFK7DrRbRwx3h+71h0dQ6v6K16LcIyu1G09scLtag+IPA8lJ/mIf9nQ8N86/YAiz5dCYxj6aXZnSwaGRhUQ0d5xEIBkLXMmM+h2FoZseMwIo0o1VrH0NjoRZh9uDaIn4bVkBs8Gi3eoo71yIHC+x54bs0BhzbCgSyuHgWEoj29chU5l9lLT1CQHYvtu8yMtJu8YsLxwnvYa1/SzCc/3TqqlzX4FfP8q/xs4XYncuzhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=02+Nk/kkYTG4CAxbqEqAvVS49hOjiT/Wqq9rXirC1jc=;
 b=EBGIIdy7ZtwNzUiF9hZvHqr0yzxgHE7nEcXesErE31TH3Cxscx5RRuZjg19v5WWoRXhsbnqieZPC7xpCGeQBlBew1cx0gKsLti9MWFuSEE5IXxVjnNie4n8iQZDUgRMogqC6kHoQZN0UzZMGGvmYEIqnRARMOoRh+Z0dim2myQ8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYRPR01MB16474.jpnprd01.prod.outlook.com
 (2603:1096:405:2ee::10) by TY5PR01MB18382.jpnprd01.prod.outlook.com
 (2603:1096:405:3e5::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 05:08:14 +0000
Received: from TYRPR01MB16474.jpnprd01.prod.outlook.com
 ([fe80::2a39:9988:dbe9:894b]) by TYRPR01MB16474.jpnprd01.prod.outlook.com
 ([fe80::2a39:9988:dbe9:894b%6]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 05:08:14 +0000
Message-ID: <87wlt6ubb6.wl-kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 19/39] ASoC: codecs: mc13783: use .auto_selectable_formats
In-Reply-To: <87o6eivpyd.wl-kuninori.morimoto.gx@renesas.com>
References: <87o6eivpyd.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 31 Aug 2026 05:08:13 +0000
X-ClientProxiedBy: TYCP301CA0073.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7d::11) To TYRPR01MB16474.jpnprd01.prod.outlook.com
 (2603:1096:405:2ee::10)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB16474:EE_|TY5PR01MB18382:EE_
X-MS-Office365-Filtering-Correlation-Id: a22fe506-9f6d-4e41-c364-08df071ddc06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|52116014|1800799024|366016|376014|22082099003|18002099003|56012099006|11063799006|10067099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	jw2NGVSW316jg6pvd5RYBegfzciJbkZbR7qslCzi+7mKoa6cwmJWaXrQ4j3BuHOSADEk4W6IJwCdaDEw0gyNe8EGqKvyWXB6DJB4MxwATG1NK7vPFg7oK+CAOX2YIMI/3t8IwJke/N8/hxPBQ7Q8uFJ1afShmaf7p+SWT+7BxcR9oBrVb6bi4GCs5u98z5WYqh9JqUSxHWn2echk8Iyc0W70hA8Exe6sB26EYJw0PVR5Ppg+8TtE9rdfUNnMayfpVcv2mKnIkwAgGqBWSRo5SeV8h28lroVFwSo4S4AgVhxbykdeeDnHH7BO2IGIV4sQUbs98ot75usLkvqqXDaHVyJMKUsLzBF/v/YUR1x061XPNSYt75Mk+WiamHTc2pS7d+njtliEYEkXwGaOb5SJmiFUUxnKni0YPyUxtQArAzau2RKFOtQ0zoE+vn50XNb5WRH7rsL0IT/fllwhImch4fgXbJPIMgqqUo0cmsOYfsrvgKTR4jZdDXz4W9/kuuN1LIH5ndiCCJudPduz38afgCpXZ09Qy5DTlRmzmvEdABHeLwe5A5dq2MXkaZSj5AMGU0mg5TkYALFmnz6XM4gelfY11CUBpJ+bfxnyB7lmT2x5aQjexCpdWf+YMpugxcrmQIWHnu3WUutELr7ZjEKoQ4NgQ5k/TnRqsVGxuAN3TURwz/k6+8ks4cthfCO0Ul9QXozW80WymRzJY1a4M9tgA1k9OeYWTv7k6BSt12mLrqM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB16474.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(52116014)(1800799024)(366016)(376014)(22082099003)(18002099003)(56012099006)(11063799006)(10067099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3wb+dvWiiYyJyXDc53fQqrz3nhd3hwRVfEJ1AW4BAFurDTMCUGHuCMKsLEFQ?=
 =?us-ascii?Q?OpSS3m2G5XFlLn8gEb0W1hgjqVWq38DeTi/HQUdsgyMtx3ikOL+KiF39qsVV?=
 =?us-ascii?Q?vj7+3e96GWaz0eedcj/5ago/qNviDqCwYCDv/Y4NQP2tRekBlJcdV2seUGx6?=
 =?us-ascii?Q?yRK1siVhqUVyEQDoEUc7jfqljRqfDj/jC9S4c9a7VXUT/Ui3r1lTtIYF16og?=
 =?us-ascii?Q?XUaUNHZKdx3XLX3l8/9A1qr5vZLhay3U3lzaCWdTL7tuWYjVExbgS/qTYCo0?=
 =?us-ascii?Q?tWRt2AULhGyZOPxYwfWcGef5n4e9omOQgPDXo8/yKXbQnwxNVOuqSqZOcgC1?=
 =?us-ascii?Q?lC8rDia2RWGIqPLedjOnEKl+1LOax/NmlEcJzQxEhVsMqWV3Js9vv8pFN++D?=
 =?us-ascii?Q?q8p2UncEQi9UCcC4Gep48rWhHs4uRDyJfcgblKDEOTg99fl0aVwn1QVSRStq?=
 =?us-ascii?Q?yEi8v2FTWGWAm3CF4ufBkPhoqIgPdjToxKuPQcV286BPaIjpUrkIxS12i4ku?=
 =?us-ascii?Q?nvC9/ywceK1TLoJkWyooWBcikfdj95zePCMzkCKKgk8YTnAoJz48Lwu/d1Iu?=
 =?us-ascii?Q?+I4+7DQffNdzfhUr86rLEa7JLlcKua557Lkrl4mbCOt500+ob49aNfVZ6jw6?=
 =?us-ascii?Q?RzP+nhOtEZHQIgpZpZFcksItCZWHFZ3Atxw2qqA29lU8LN9+gCI2rDi9VvVe?=
 =?us-ascii?Q?SBv1qpy99QT6z9OygFDN2Bn1sZv+SuA5F5Z+LCDIgYUwWeyO3HQB+XQHnKCh?=
 =?us-ascii?Q?TqszkXgsqst1BNt0JlYS9P262TnM9D36b/fmdzgs8b2NvrcEIwvKJIF3CfC3?=
 =?us-ascii?Q?IQHEXhdQczHKsUnQGzHhEgTSwKZ1sme6WYWuAWon/dCynY1toK31c9DT3Q/T?=
 =?us-ascii?Q?/p57v/g+ZfoHzVuPdewUJl0ie2i7PZByFL87l1HZLbiWET3xpOxey0wKhp78?=
 =?us-ascii?Q?AC0nSWgt9EfyFYad0HmKsuNeu2+b0Aur1sM8aTNsHmUgNgzUkrmGjsKPvFtb?=
 =?us-ascii?Q?YyGf7Oh4za7Kj2ggPYIm9grfR00DHrQ5HK1Qyv0EEX5Rx/+gnbd1GX+O93jL?=
 =?us-ascii?Q?JZNT/T4G/iaoSJiJmoSTm/3hC+L+TYhGr9BFkWuAMDBPQ5+LPsWfuHw1nUL0?=
 =?us-ascii?Q?4S4yaOtCtmG/Awb1jnixy2jn2Lnabl+ypJ2EZLVYFt9x4XNC8IMy9EomBHvL?=
 =?us-ascii?Q?3MIHr1oPSdWX4bvRdeTjjf7HRT0abUoUpvWsjwiTa0Rk1rRHO+wTkyCUNtib?=
 =?us-ascii?Q?AYFR2PjNhBN39PF7ZLfLoR4gE/vTZ+jXqX0V2sV/nBHm6rvjNPC2s5uy59aE?=
 =?us-ascii?Q?4dBI1wMKGTeJ71iICu+Qx7duPO04pKQcROGPlR6z/6iL31ck7xjgjITGwsEx?=
 =?us-ascii?Q?Zo6hGHPOAli8sR7EwY18majUAinhE2ShnKg6Bsw3VDsn7UfmGUbDEheYQLvx?=
 =?us-ascii?Q?4lFynWF1ijjKH09+S8p86rHAkiiRbr3/U65daydbitszb1+lKBWTuJ8L3856?=
 =?us-ascii?Q?SEXnwFye4ZbgmZHBoFwF3otBbCOee0nGH166vh3/OsUjd0Lut5Ngf1sPg+rs?=
 =?us-ascii?Q?x9LI3PG9zrp3zTalXZglJ38nCl4Ro4ZW19o0QFqJk7Qeu3selLpRcXmJgZSa?=
 =?us-ascii?Q?RbWvYnINxh+Gv/FeRnHFK2GZcto/SjRKpIgMTqPOy2gk6H8/CdPCNUM7UtEi?=
 =?us-ascii?Q?F6MyKpMyQpI0AF8r4e8wTC0xu4m70gKfydMvx/0KHkwnL8j/OCKEfhgl8Vzf?=
 =?us-ascii?Q?2jhSUv0r0GGIJM20Eb23RpSs6Js2r0Caf+bC2d7cm+7dstAQSVY/?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a22fe506-9f6d-4e41-c364-08df071ddc06
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB16474.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 05:08:14.1121
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ez/OxE2u6LcNzWcDykxs6td6b07pePYC8Zw6QmnzL6tiY53wvjctVCzJjklPQr6kystpFZoDO4JbTakjTG2MoLIEdogaVHOlqZEh7nRtC3vxKnvbvAkKF/2WpNW8DGGm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY5PR01MB18382

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/mc13783.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/sound/soc/codecs/mc13783.c b/sound/soc/codecs/mc13783.c
index 086ac97e83866..a6231a12a9b09 100644
--- a/sound/soc/codecs/mc13783.c
+++ b/sound/soc/codecs/mc13783.c
@@ -637,11 +637,21 @@ static void mc13783_remove(struct snd_soc_component *component)
 #define MC13783_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE |\
 	SNDRV_PCM_FMTBIT_S24_LE)
 
+static const u64 mc13783_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops mc13783_ops_dac = {
 	.hw_params	= mc13783_pcm_hw_params_dac,
 	.set_fmt	= mc13783_set_fmt_async,
 	.set_sysclk	= mc13783_set_sysclk_dac,
 	.set_tdm_slot	= mc13783_set_tdm_slot_dac,
+	.auto_selectable_formats	= &mc13783_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static const struct snd_soc_dai_ops mc13783_ops_codec = {
@@ -649,6 +659,8 @@ static const struct snd_soc_dai_ops mc13783_ops_codec = {
 	.set_fmt	= mc13783_set_fmt_async,
 	.set_sysclk	= mc13783_set_sysclk_codec,
 	.set_tdm_slot	= mc13783_set_tdm_slot_codec,
+	.auto_selectable_formats	= &mc13783_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 /*
-- 
2.53.0

