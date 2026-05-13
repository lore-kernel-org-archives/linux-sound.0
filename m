Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011053.outbound.protection.outlook.com [40.107.74.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F92C179A3
	for <linux-sound@vger.kernel.org>; Wed, 13 May 2026 00:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778631162; cv=fail; b=oRryME0qaB3IrQbNBxREMQmg+ECYcTIkNvIbKtnMfAs9+LQiSG25TM84JYKBE6E73pfwMsds5omfq4JPOrE4l/JBaggDbtVR3V9FRHHGUyihm5DpODGcjMu8A5rpN69YUMJY+9vmw+/iJjW0uyrWyla6OtDPr0E/Sj9Ei5MPtOE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778631162; c=relaxed/simple;
	bh=28vdWKikkbQDweNJoG9xdy+a70houm+G3OeAjpB/D7o=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Fwm3HAXPEz9/U48NFBzpqDP2JbSpPBRAQ7/9Nh3HpTvio/Wa/yYgR8xMZoZKv1Uvs684LdaqekRLddVaNPmnVljo5sLwDPs3p2UpZhc3LkshkwSsighLiYXXKP+GvqilFUEsxkHQS6Tp6pjKjwZ+XHK7LtCVtHD8VqewUJ3JgHo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Q9J0nG1X; arc=fail smtp.client-ip=40.107.74.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Q9J0nG1X"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SFtnvwcA2fmD9dRgR6IppLkSQPcODD1wwZxnjt6G7Je3xGMDyQ4eD2LcgKnrWv1lm8strxI2D+IONE0RkKrUY8xMYdYSezIiKHG2upvm2u3uyOVJWRhTPXEqqQnH7qLOPYsGnU4T3TgR6G1gRWhK8/4UPggEUJPF+TLOKAfz6icHBjKQE+g9R1fThHex5fD8lDGFEa3S4IDkon0VOOQdqWYSeiXaDzDvVHqzD12hSQjYREKwZ8xeCcZudtnwXbf0FIKw8f/L+wwQTx6cUs+E9XjLbyVBEEQftAJ2f6xWUOy0NBtqeJK2NQ3NC5UQaj/nTEtvQpWrbH2PPIjpxf9DOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4su6SpdB2m0HXvugNFGSmU0ALYBJ/bbSv0ViyFUVUmg=;
 b=PqZ1y/sx4tAt7HwCgCknrRjNrwp5tBNjfXPSX6WaNf39uJLP1E3lzdbORCTtIncKdpPzr3er8ru/EgxXr4MTYP20vAH6uPGSq94GMxUzg8d66tWOhjWfmdWPNT68phS41PiNoywXWWHnqTxY8a7TUERk3zskspbt1wYNHiuEWS4t4csVi06BfLIQiNXiToGebw3W3fG8MmxgQT5tR7UwUQWxMF1pEiy5xbquhYi3f4I86eR8oih+wo72cSq/lIj1ppFA4x4VMrDN/r3wcJuD7TcTCNm4ML0f6zJj0/WGOnCaSqoRTNJKrvjgYkQjtNDAUBlK/hYedKvfG6aUV/zcjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4su6SpdB2m0HXvugNFGSmU0ALYBJ/bbSv0ViyFUVUmg=;
 b=Q9J0nG1XCKqurM1cmVEid+cdz1fc43xpOfDImFc22maKj+kmW2S2fHzCjdVzh3JVuRQCsd8+SoZ9rKttFGWWzTsXUISgpTfyt4k7AcYoXtj32qNcTIOUlDtchoKGsB24kK7kcnNIC1wOpFWXt2Vtr5UVQtSPEH6AcM6pTUmQWHU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OS7PR01MB13832.jpnprd01.prod.outlook.com (2603:1096:604:368::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Wed, 13 May
 2026 00:12:38 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.20.9913.009; Wed, 13 May 2026
 00:12:38 +0000
Message-ID: <877bp86ubu.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [RFC] ASoC: update auto format selection method
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87a4u46udl.wl-kuninori.morimoto.gx@renesas.com>
References: <87a4u46udl.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 13 May 2026 00:12:38 +0000
X-ClientProxiedBy: TYCPR01CA0009.jpnprd01.prod.outlook.com (2603:1096:405::21)
 To TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OS7PR01MB13832:EE_
X-MS-Office365-Filtering-Correlation-Id: 9884bf5d-ab8f-4b5b-187c-08deb0845755
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|52116014|38350700014|56012099003|22082099003|18002099003|11063799003;
X-Microsoft-Antispam-Message-Info:
	83EA4fdv5ALtnmgp5jDGthtfEcB/D+GrU1Uz3Yez79Q5re2uF+2b8Dqcmm6e8M8h2tMu16kWIxRvhutUHdsoTVoBaXzahcUZmX2YuopGqR0QPU0kSKZonkasXPZPlSGSB+r7VWGxtw1jJoSoIaPBVhcjTUwrUa3aL1f+eM8Cqn8+m2w1k3wdJKQf2IIcYVw3wFwWYZKY6l1qARnjSQGBVm46SLNqSnSDYNAh0jxvp5UCbmx0/JE7LIIleZ7+OpCx+B3w3ONEJtEG69qeS0ZBpU21Jbkms+77EIhTSHBfl6EcBRMvElFYKoyzj52zFIXQsVCZ0s8oVG9qZosevwlxvXTBR4oS9rCBZMRkHpQ6WCd0ZY8UgCpYfm69T9fXu0j7+0bIhkWbh07uERVbPapmUnJu62U/QXgOMkRvrX4S7RLg0urN3hQJp5Xr+AG413NvoMNkZAzlggbtakdoj6L1mbE6W0RmdQHwjkA2TE7rf2iZy5qGUMn9JtecfQScvCDtPBwTOwQ9ScviEq3g9i81pxqTyYyTTQqHJpl54VhCaimtSVH2rXISxYTiiGp/KDGO+5UneJVApPF7tfsfC4wkuqDLQK6sDsLKwZU37vTQqXKjt5L+J23HAPIAQ0XmVe2hWVY2LeyonKRGMSO5juBkTuKdAue0bgISo3y7ytX0NJe9QbZuI88+UR3WYtRM1YPTIEmfcrQGQreCmJ0sbntSMFUCg3GFV1HxzFrrQfMdnvXUzba/LYuZR0IPYV6YIsBb
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(52116014)(38350700014)(56012099003)(22082099003)(18002099003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?I3MJ/UzKOBlcUTznf0ympM1m+rAtd8f2ic6et0loaRvGdzXANBjTEcbq1+kw?=
 =?us-ascii?Q?TmSvR01X5CEsOyov/Ylj325qG1I/yK8iKPapR6ECkXSbQAOzU0VVoTy9186t?=
 =?us-ascii?Q?11hw8GVKko+RubV2xVTnuthkUeo3DlAilJdBe5Rrv5fo4VjuDJrs8Pg4v0KH?=
 =?us-ascii?Q?pfy2QHxVD3VrElZGPHDdkDgVLsXdDM+56naybwTTVHJJIiKH2ofP9yc1lTJd?=
 =?us-ascii?Q?qaoZB5nyRLEdP14/F4FUcw07JdfWYue8of7qBsW6rM0a1EyD3Z83tNNvVzsQ?=
 =?us-ascii?Q?8H6mzQpunXJYh/jWM/sLpevs7HyuypcfDGkUAiCWrOwL+DLjY7UMOMAz9ji0?=
 =?us-ascii?Q?Ub641HclAur6qsp0OT4t0/v98CUnsiW3gDacKmquwJiaVeJnb2uvUpp31+o0?=
 =?us-ascii?Q?ak8WSpTCpS3XZaAsRasV/1jQTqZT+52UNr/GDr9ewGSo/1tf/imtWltv/7sa?=
 =?us-ascii?Q?CHMJUIN6LZwdTZVbA/W0ZCOFQ+D5DabS5gKCUjlvOQmt+ZiTN+CNuB3XmDiW?=
 =?us-ascii?Q?b+VYL11AJOCe5lJowTPKY9jAiPnSrvxzZRQktNOGDVz6/qtOTDE2HrniDhcR?=
 =?us-ascii?Q?F78l2mkmAVf9GUAQa7A6vPR8vnsgw5PCuP3EKEspK/Z/xkRFrvNXKisXSe+6?=
 =?us-ascii?Q?8WPzbAGOc5DosNqklg/DN/5jODQj1IaGyjrbDrHD20diY5i/DpbppRDyvV4k?=
 =?us-ascii?Q?x2vdGVisiPp494MSyiCg9bJvtDDRdq0zD2zKQeH1L21GA18Ul8sZIaiRC2JD?=
 =?us-ascii?Q?D4jOHVujkOqxZBJMf6hUZmw0yzr7Zzkhsfi8hZiX+lFDAN5M+7694Yqfu4as?=
 =?us-ascii?Q?6B9BwAsg4MovkFcuKuWEs4G3EmmyvUbgY4S4NS+gAU0rCCww9O4bULFwv7G+?=
 =?us-ascii?Q?MChijImgtO7S0cFk8zQSXEvLX14Uu/Geq7kVnSMPMowInlu0lTF9w4kD1VNm?=
 =?us-ascii?Q?jKj5KKVnOUeNCQ1xz/1bJ6j3dyMN3bYI5l/KSbD6HAKPDqOhoZhpYrylnJeQ?=
 =?us-ascii?Q?Gu+kDdxHUaONjpTfd0ekDLUQ9/7L4wgi0ZQUBDzI/SPv3UcNeNRWPedpQVgN?=
 =?us-ascii?Q?AHkpQKSbaFoUsmmQoZoQWkp9pH8PjUr1Cqv6/fPLvYatqaCiUFlg9SF1uYI+?=
 =?us-ascii?Q?3xFc9Wagq6xy1ytSUiJMXcSuFTM68wiHc8n0gVOtSy6ybK8dIzSM4sJa458n?=
 =?us-ascii?Q?A0UDr5VHGqpFOuN7xzruyZ4Ivcacvf0tZx7mIq5Ml0b0z9/VbsekW84Wspcf?=
 =?us-ascii?Q?KT2YLfwKJl6XrgvD0FY1X0Lkwug64LI4RvcwPRfrDjcdkQlnGsLorWY8FAEX?=
 =?us-ascii?Q?s1+Y9tyzzI6p+a82O+UCPjPUitGSHsJPdZxQDwYARyoM/51N6vMacpsz9xwT?=
 =?us-ascii?Q?kMLFkT38wjiq+PV49uktPPWb3JGKaFJsAXLYHTOEnjbIcK0S99dSANhB3osZ?=
 =?us-ascii?Q?8henhJO7oh/HnE0XAKnsFSBON+FxLZ0bZD+yJmUxZLquM4jxuossqF4ZEf9N?=
 =?us-ascii?Q?BEoETHHuRGW7Gs8xV+gHqwhUnsVTJR8r2RpQ+LSM5NbGRRjjVi5U4m5OIzdA?=
 =?us-ascii?Q?//YyizeyogswqXYZqroxID+F+k00JIWw0EH7HnouxP/ZPqbIJUzl5NazRzEs?=
 =?us-ascii?Q?Qic1nmqHwq8fnpJXgBXxWtfg+t6EZcpxCk6/2uGpiDNxj2ploVkN727+ey4D?=
 =?us-ascii?Q?Z2K26ouwGzracwl5UAVcKGnkmUBed4xNYieA7bY9XY8tYK1v+BSjjEwB/Qgd?=
 =?us-ascii?Q?Pc93g52BPBX3WDHCoDYy9/wTrSsX/rlKUC2kJEX3LJ1qTqIjJrcW?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9884bf5d-ab8f-4b5b-187c-08deb0845755
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 00:12:38.2116
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tSIhAnEu9qq7aZ4O2PvATmR5vDD+HGGsQ3+T5AefHp7N/MHSgN/KWD1/2OiDRAdZCToJvgD/nyVauPumDsWFQlqt8ZgmwYkTtgpx2u1F853zzV3SsovRddL9LX6e+Nxr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB13832

Current DAI supports auto format selection. It allow to have array like
below.

(X)	static u64 xxx_auto_formats[] = {
(A)		/* First Priority */
		SND_SOC_POSSIBLE_DAIFMT_I2S	|
		SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
		SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
		SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
		SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
		SND_SOC_POSSIBLE_DAIFMT_IB_IF,

		/* Second Priority */
(B)		SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
		SND_SOC_POSSIBLE_DAIFMT_DSP_B,
	};

It try to find available format from (A), Then, try to find from (A | B).
(OR:ed) (1)

In this method, it can't handle if some of them was independent.
For example, like below

	FORMAT			INV
Pattern1
	I2S/RIFHT_J/LEFT_J	NB_NF/NB_IF/IB_NF/IB_IF
Pattern2
	DSP_A/DSP_B		NB_NF/      IB_NF

Because current method use OR to (A) and (B), un-supported pattern
(for example DSP_x + xB_IF) might be selected.

This patch update method not to use OR, and assumes full format array.
Above sample (X) need to be like below, and this is already done.

	static u64 xxx_auto_formats[] = {
		/* First Priority */
		SND_SOC_POSSIBLE_DAIFMT_I2S	|
		SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
		SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
		SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
		SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
		SND_SOC_POSSIBLE_DAIFMT_IB_IF,

		/* Second Priority */
		SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
		SND_SOC_POSSIBLE_DAIFMT_DSP_B,
		SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
		SND_SOC_POSSIBLE_DAIFMT_IB_NF,
	};

Note that it doesn't support Multi CPU/Codec DAI case yet.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-dai.h |   7 +-
 sound/soc/soc-core.c    | 145 +--------------------------
 sound/soc/soc-dai.c     | 210 +++++++++++++++++++++++++++++++---------
 3 files changed, 168 insertions(+), 194 deletions(-)

diff --git a/include/sound/soc-dai.h b/include/sound/soc-dai.h
index 06ed6774229bc..d9947a4595d74 100644
--- a/include/sound/soc-dai.h
+++ b/include/sound/soc-dai.h
@@ -80,10 +80,10 @@ struct snd_compr_stream;
 /*
  * define GATED -> CONT. GATED will be selected if both are selected.
  * see
- *	snd_soc_runtime_get_dai_fmt()
+ *	soc_dai_convert_possiblefmt_to_daifmt()
  */
 #define SND_SOC_POSSIBLE_DAIFMT_CLOCK_SHIFT	16
-#define SND_SOC_POSSIBLE_DAIFMT_CLOCK_MASK	(0xFFFF	<< SND_SOC_POSSIBLE_DAIFMT_CLOCK_SHIFT)
+#define SND_SOC_POSSIBLE_DAIFMT_CLOCK_MASK	(0xFFFFULL << SND_SOC_POSSIBLE_DAIFMT_CLOCK_SHIFT)
 #define SND_SOC_POSSIBLE_DAIFMT_GATED		(0x1ULL	<< SND_SOC_POSSIBLE_DAIFMT_CLOCK_SHIFT)
 #define SND_SOC_POSSIBLE_DAIFMT_CONT		(0x2ULL	<< SND_SOC_POSSIBLE_DAIFMT_CLOCK_SHIFT)
 
@@ -181,8 +181,7 @@ int snd_soc_dai_set_pll(struct snd_soc_dai *dai,
 int snd_soc_dai_set_bclk_ratio(struct snd_soc_dai *dai, unsigned int ratio);
 
 /* Digital Audio interface formatting */
-int snd_soc_dai_get_fmt_max_priority(const struct snd_soc_pcm_runtime *rtd);
-u64 snd_soc_dai_get_fmt(const struct snd_soc_dai *dai, int priority);
+unsigned int snd_soc_dai_auto_select_format(const struct snd_soc_pcm_runtime *rtd);
 int snd_soc_dai_set_fmt(struct snd_soc_dai *dai, unsigned int fmt);
 
 int snd_soc_dai_set_tdm_slot(struct snd_soc_dai *dai,
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 04a2d64d977b3..691fd7fc5030d 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -1284,148 +1284,6 @@ int snd_soc_add_pcm_runtimes(struct snd_soc_card *card,
 }
 EXPORT_SYMBOL_GPL(snd_soc_add_pcm_runtimes);
 
-static void snd_soc_runtime_get_dai_fmt(struct snd_soc_pcm_runtime *rtd)
-{
-	struct snd_soc_dai_link *dai_link = rtd->dai_link;
-	struct snd_soc_dai *dai, *not_used;
-	u64 pos, possible_fmt;
-	unsigned int mask = 0, dai_fmt = 0;
-	int i, j, priority, pri, until;
-
-	/*
-	 * Get selectable format from each DAIs.
-	 *
-	 ****************************
-	 *            NOTE
-	 * Using .auto_selectable_formats is not mandatory,
-	 * we can select format manually from Sound Card.
-	 * When use it, driver should list well tested format only.
-	 ****************************
-	 *
-	 * ex)
-	 *	auto_selectable_formats (= SND_SOC_POSSIBLE_xxx)
-	 *		 (A)	 (B)	 (C)
-	 *	DAI0_: { 0x000F, 0x00F0, 0x0F00 };
-	 *	DAI1 : { 0xF000, 0x0F00 };
-	 *		 (X)	 (Y)
-	 *
-	 * "until" will be 3 in this case (MAX array size from DAI0 and DAI1)
-	 * Here is dev_dbg() message and comments
-	 *
-	 * priority = 1
-	 * DAI0: (pri, fmt) = (1, 000000000000000F) // 1st check (A) DAI1 is not selected
-	 * DAI1: (pri, fmt) = (0, 0000000000000000) //               Necessary Waste
-	 * DAI0: (pri, fmt) = (1, 000000000000000F) // 2nd check (A)
-	 * DAI1: (pri, fmt) = (1, 000000000000F000) //           (X)
-	 * priority = 2
-	 * DAI0: (pri, fmt) = (2, 00000000000000FF) // 3rd check (A) + (B)
-	 * DAI1: (pri, fmt) = (1, 000000000000F000) //           (X)
-	 * DAI0: (pri, fmt) = (2, 00000000000000FF) // 4th check (A) + (B)
-	 * DAI1: (pri, fmt) = (2, 000000000000FF00) //           (X) + (Y)
-	 * priority = 3
-	 * DAI0: (pri, fmt) = (3, 0000000000000FFF) // 5th check (A) + (B) + (C)
-	 * DAI1: (pri, fmt) = (2, 000000000000FF00) //           (X) + (Y)
-	 * found auto selected format: 0000000000000F00
-	 */
-	until = snd_soc_dai_get_fmt_max_priority(rtd);
-	for (priority = 1; priority <= until; priority++) {
-		for_each_rtd_dais(rtd, j, not_used) {
-
-			possible_fmt = ULLONG_MAX;
-			for_each_rtd_dais(rtd, i, dai) {
-				u64 fmt = 0;
-
-				pri = (j >= i) ? priority : priority - 1;
-				fmt = snd_soc_dai_get_fmt(dai, pri);
-				possible_fmt &= fmt;
-			}
-			if (possible_fmt)
-				goto found;
-		}
-	}
-	/* Not Found */
-	return;
-found:
-	/*
-	 * convert POSSIBLE_DAIFMT to DAIFMT
-	 *
-	 * Some basic/default settings on each is defined as 0.
-	 * see
-	 *	SND_SOC_DAIFMT_NB_NF
-	 *	SND_SOC_DAIFMT_GATED
-	 *
-	 * SND_SOC_DAIFMT_xxx_MASK can't notice it if Sound Card specify
-	 * these value, and will be overwrite to auto selected value.
-	 *
-	 * To avoid such issue, loop from 63 to 0 here.
-	 * Small number of SND_SOC_POSSIBLE_xxx will be Hi priority.
-	 * Basic/Default settings of each part and above are defined
-	 * as Hi priority (= small number) of SND_SOC_POSSIBLE_xxx.
-	 */
-	for (i = 63; i >= 0; i--) {
-		pos = 1ULL << i;
-		switch (possible_fmt & pos) {
-		/*
-		 * for format
-		 */
-		case SND_SOC_POSSIBLE_DAIFMT_I2S:
-		case SND_SOC_POSSIBLE_DAIFMT_RIGHT_J:
-		case SND_SOC_POSSIBLE_DAIFMT_LEFT_J:
-		case SND_SOC_POSSIBLE_DAIFMT_DSP_A:
-		case SND_SOC_POSSIBLE_DAIFMT_DSP_B:
-		case SND_SOC_POSSIBLE_DAIFMT_AC97:
-		case SND_SOC_POSSIBLE_DAIFMT_PDM:
-			dai_fmt = (dai_fmt & ~SND_SOC_DAIFMT_FORMAT_MASK) | i;
-			break;
-		/*
-		 * for clock
-		 */
-		case SND_SOC_POSSIBLE_DAIFMT_CONT:
-			dai_fmt = (dai_fmt & ~SND_SOC_DAIFMT_CLOCK_MASK) | SND_SOC_DAIFMT_CONT;
-			break;
-		case SND_SOC_POSSIBLE_DAIFMT_GATED:
-			dai_fmt = (dai_fmt & ~SND_SOC_DAIFMT_CLOCK_MASK) | SND_SOC_DAIFMT_GATED;
-			break;
-		/*
-		 * for clock invert
-		 */
-		case SND_SOC_POSSIBLE_DAIFMT_NB_NF:
-			dai_fmt = (dai_fmt & ~SND_SOC_DAIFMT_INV_MASK) | SND_SOC_DAIFMT_NB_NF;
-			break;
-		case SND_SOC_POSSIBLE_DAIFMT_NB_IF:
-			dai_fmt = (dai_fmt & ~SND_SOC_DAIFMT_INV_MASK) | SND_SOC_DAIFMT_NB_IF;
-			break;
-		case SND_SOC_POSSIBLE_DAIFMT_IB_NF:
-			dai_fmt = (dai_fmt & ~SND_SOC_DAIFMT_INV_MASK) | SND_SOC_DAIFMT_IB_NF;
-			break;
-		case SND_SOC_POSSIBLE_DAIFMT_IB_IF:
-			dai_fmt = (dai_fmt & ~SND_SOC_DAIFMT_INV_MASK) | SND_SOC_DAIFMT_IB_IF;
-			break;
-		}
-	}
-
-	/*
-	 * Some driver might have very complex limitation.
-	 * In such case, user want to auto-select non-limitation part,
-	 * and want to manually specify complex part.
-	 *
-	 * Or for example, if both CPU and Codec can be clock provider,
-	 * but because of its quality, user want to specify it manually.
-	 *
-	 * Use manually specified settings if sound card did.
-	 */
-	if (!(dai_link->dai_fmt & SND_SOC_DAIFMT_FORMAT_MASK))
-		mask |= SND_SOC_DAIFMT_FORMAT_MASK;
-	if (!(dai_link->dai_fmt & SND_SOC_DAIFMT_CLOCK_MASK))
-		mask |= SND_SOC_DAIFMT_CLOCK_MASK;
-	if (!(dai_link->dai_fmt & SND_SOC_DAIFMT_INV_MASK))
-		mask |= SND_SOC_DAIFMT_INV_MASK;
-	if (!(dai_link->dai_fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK))
-		mask |= SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK;
-
-	dai_link->dai_fmt |= (dai_fmt & mask);
-}
-
 /**
  * snd_soc_runtime_set_dai_fmt() - Change DAI link format for a ASoC runtime
  * @rtd: The runtime for which the DAI link format should be changed
@@ -1504,8 +1362,7 @@ static int soc_init_pcm_runtime(struct snd_soc_card *card,
 	if (ret < 0)
 		return ret;
 
-	snd_soc_runtime_get_dai_fmt(rtd);
-	ret = snd_soc_runtime_set_dai_fmt(rtd, dai_link->dai_fmt);
+	ret = snd_soc_runtime_set_dai_fmt(rtd, snd_soc_dai_auto_select_format(rtd));
 	if (ret)
 		goto err;
 
diff --git a/sound/soc/soc-dai.c b/sound/soc/soc-dai.c
index 2f370fda12665..ffa2bf9d85d45 100644
--- a/sound/soc/soc-dai.c
+++ b/sound/soc/soc-dai.c
@@ -120,68 +120,186 @@ int snd_soc_dai_set_bclk_ratio(struct snd_soc_dai *dai, unsigned int ratio)
 }
 EXPORT_SYMBOL_GPL(snd_soc_dai_set_bclk_ratio);
 
-int snd_soc_dai_get_fmt_max_priority(const struct snd_soc_pcm_runtime *rtd)
+static int soc_dai_fmt_match_cnt(u64 fmt)
 {
-	struct snd_soc_dai *dai;
-	int i, max = 0;
+	int cnt = 0;
 
-	/*
-	 * return max num if *ALL* DAIs have .auto_selectable_formats
-	 */
-	for_each_rtd_dais(rtd, i, dai) {
-		if (dai->driver->ops &&
-		    dai->driver->ops->num_auto_selectable_formats)
-			max = max(max, dai->driver->ops->num_auto_selectable_formats);
-		else
-			return 0;
-	}
+	if (fmt & SND_SOC_POSSIBLE_DAIFMT_FORMAT_MASK)
+		cnt++;
+	if (fmt & SND_SOC_POSSIBLE_DAIFMT_CLOCK_MASK)
+		cnt++;
+	if (fmt & SND_SOC_POSSIBLE_DAIFMT_INV_MASK)
+		cnt++;
 
-	return max;
+	return cnt;
 }
 
-/**
- * snd_soc_dai_get_fmt - get supported audio format.
- * @dai: DAI
- * @priority: priority level of supported audio format.
- *
- * This should return only formats implemented with high
- * quality by the DAI so that the core can configure a
- * format which will work well with other devices.
- * For example devices which don't support both edges of the
- * LRCLK signal in I2S style formats should only list DSP
- * modes.  This will mean that sometimes fewer formats
- * are reported here than are supported by set_fmt().
- */
-u64 snd_soc_dai_get_fmt(const struct snd_soc_dai *dai, int priority)
+static void soc_dai_auto_select_format(u64 fmt, const struct snd_soc_pcm_runtime *rtd,
+				      int idx, u64 *best_fmt)
 {
-	const struct snd_soc_dai_ops *ops = dai->driver->ops;
-	u64 fmt = 0;
-	int i, max = 0, until = priority;
+	struct snd_soc_dai *dai;
+	const struct snd_soc_dai_ops *ops;
+	int max_idx = rtd->dai_link->num_cpus + rtd->dai_link->num_codecs;
+	u64 available_fmt;
+
+	if (idx >= max_idx)
+		return;
 
 	/*
-	 * Collect auto_selectable_formats until priority
+	 * FIXME
+	 *
+	 * It doesn't support multi CPU/Codec yet
+	 */
+	if (rtd->dai_link->num_cpus   > 1 ||
+	    rtd->dai_link->num_codecs > 1)
+		return;
+
+	dai = rtd->dais[idx];
+	ops = dai->driver->ops;
+
+	/* zero chance of auto select format */
+	if (!ops || !ops->num_auto_selectable_formats)
+		return;
+
+	/*
+	 ****************************
+	 *            NOTE
+	 ****************************
+	 * Using .auto_selectable_formats is not mandatory,
+	 * It try to find best formats as much as possible, but automatically selecting the
+	 * perfect format is impossible. So you can select full or missing format manually
+	 * from Sound Card.
 	 *
 	 * ex)
-	 *	auto_selectable_formats[] = { A, B, C };
-	 *	(A, B, C = SND_SOC_POSSIBLE_DAIFMT_xxx)
+	 * CPU					Codec
+	 * (A)[0] I2S/LEFT_J : IB_NF/IB_IF	(X)[0] I2S/DSP_A: NB_NF : GATED
+	 * (B)[1] DSP_A/DSP_B: NB_NF/IB_NF	(Y)[1] LEFT_J:    NB_NF : GATED
+	 * (C)[2] ...
 	 *
-	 * priority = 1 :	A
-	 * priority = 2 :	A | B
-	 * priority = 3 :	A | B | C
-	 * priority = 4 :	A | B | C
+	 * 1. (A) -> (X) : I2S		:update best format
+	 * 2. (A) -> (Y) : LEFT_J
+	 * 3. (B) -> (X) : DSP_A/NB_NF	:update best format
+	 * 4. (B) -> (Y) : NB_NF
+	 * 5. (C) -> (X) ...
+	 * 6. (C) -> (Y) ...
 	 * ...
+	 *
+	 * In above case GATED will not be selected
 	 */
-	if (ops)
-		max = ops->num_auto_selectable_formats;
 
-	if (max < until)
-		until = max;
+	/* find best formats */
+	for (int i = 0; i < ops->num_auto_selectable_formats; i++) {
+		available_fmt = fmt & ops->auto_selectable_formats[i];
 
-	if (ops && ops->auto_selectable_formats)
-		for (i = 0; i < until; i++)
-			fmt |= ops->auto_selectable_formats[i];
+		/* In case of last DAI */
+		if (idx + 1 >= max_idx) {
+			int cnt1 = soc_dai_fmt_match_cnt(*best_fmt);
+			int cnt2 = soc_dai_fmt_match_cnt(available_fmt);
 
-	return fmt;
+			if (cnt1 < cnt2)
+				*best_fmt = available_fmt;
+		}
+		/* parse with next DAI */
+		else {
+			soc_dai_auto_select_format(available_fmt, rtd, idx + 1, best_fmt);
+		}
+	}
+}
+
+static unsigned int soc_dai_convert_possiblefmt_to_daifmt(u64 possible_fmt, unsigned int configured_fmt)
+{
+	unsigned int fmt = 0;
+	unsigned int mask = 0;
+
+	/*
+	 * convert POSSIBLE_DAIFMT to DAIFMT
+	 *
+	 * Some basic/default settings on each is defined as 0.
+	 * see
+	 *	SND_SOC_DAIFMT_NB_NF
+	 *	SND_SOC_DAIFMT_GATED
+	 *
+	 * SND_SOC_DAIFMT_xxx_MASK can't notice it if Sound Card specify
+	 * these value, and will be overwrite to auto selected value.
+	 *
+	 * To avoid such issue, loop from 63 to 0 here.
+	 * Small number of SND_SOC_POSSIBLE_xxx will be Hi priority.
+	 * Basic/Default settings of each part and above are defined
+	 * as Hi priority (= small number) of SND_SOC_POSSIBLE_xxx.
+	 */
+	for (int i = 63; i >= 0; i--) {
+		u64 pos = 1ULL << i;
+
+		switch (possible_fmt & pos) {
+		/*
+		 * for format
+		 */
+		case SND_SOC_POSSIBLE_DAIFMT_I2S:
+		case SND_SOC_POSSIBLE_DAIFMT_RIGHT_J:
+		case SND_SOC_POSSIBLE_DAIFMT_LEFT_J:
+		case SND_SOC_POSSIBLE_DAIFMT_DSP_A:
+		case SND_SOC_POSSIBLE_DAIFMT_DSP_B:
+		case SND_SOC_POSSIBLE_DAIFMT_AC97:
+		case SND_SOC_POSSIBLE_DAIFMT_PDM:
+			fmt = (fmt & ~SND_SOC_DAIFMT_FORMAT_MASK) | i;
+			break;
+		/*
+		 * for clock
+		 */
+		case SND_SOC_POSSIBLE_DAIFMT_CONT:
+			fmt = (fmt & ~SND_SOC_DAIFMT_CLOCK_MASK) | SND_SOC_DAIFMT_CONT;
+			break;
+		case SND_SOC_POSSIBLE_DAIFMT_GATED:
+			fmt = (fmt & ~SND_SOC_DAIFMT_CLOCK_MASK) | SND_SOC_DAIFMT_GATED;
+			break;
+		/*
+		 * for clock invert
+		 */
+		case SND_SOC_POSSIBLE_DAIFMT_NB_NF:
+			fmt = (fmt & ~SND_SOC_DAIFMT_INV_MASK) | SND_SOC_DAIFMT_NB_NF;
+			break;
+		case SND_SOC_POSSIBLE_DAIFMT_NB_IF:
+			fmt = (fmt & ~SND_SOC_DAIFMT_INV_MASK) | SND_SOC_DAIFMT_NB_IF;
+			break;
+		case SND_SOC_POSSIBLE_DAIFMT_IB_NF:
+			fmt = (fmt & ~SND_SOC_DAIFMT_INV_MASK) | SND_SOC_DAIFMT_IB_NF;
+			break;
+		case SND_SOC_POSSIBLE_DAIFMT_IB_IF:
+			fmt = (fmt & ~SND_SOC_DAIFMT_INV_MASK) | SND_SOC_DAIFMT_IB_IF;
+			break;
+		}
+	}
+
+	/*
+	 * Some driver might have very complex limitation.
+	 * In such case, user want to auto-select non-limitation part,
+	 * and want to manually specify complex part.
+	 *
+	 * Or for example, if both CPU and Codec can be clock provider,
+	 * but because of its quality, user want to specify it manually.
+	 *
+	 * Ignore already configured format if exist
+	 */
+	if (!(configured_fmt & SND_SOC_DAIFMT_FORMAT_MASK))
+		mask |= SND_SOC_DAIFMT_FORMAT_MASK;
+	if (!(configured_fmt & SND_SOC_DAIFMT_CLOCK_MASK))
+		mask |= SND_SOC_DAIFMT_CLOCK_MASK;
+	if (!(configured_fmt & SND_SOC_DAIFMT_INV_MASK))
+		mask |= SND_SOC_DAIFMT_INV_MASK;
+	if (!(configured_fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK))
+		mask |= SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK;
+
+	return (fmt & mask);
+}
+
+unsigned int snd_soc_dai_auto_select_format(const struct snd_soc_pcm_runtime *rtd)
+{
+	struct snd_soc_dai_link *dai_link = rtd->dai_link;
+	u64 possible_fmt = 0;
+
+	soc_dai_auto_select_format(~0, rtd, 0, &possible_fmt);
+
+	return soc_dai_convert_possiblefmt_to_daifmt(possible_fmt, dai_link->dai_fmt);
 }
 
 /**
-- 
2.43.0

