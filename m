Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010034.outbound.protection.outlook.com [52.101.229.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AADD437CD33
	for <linux-sound@vger.kernel.org>; Fri, 18 Sep 2026 01:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789695963; cv=fail; b=plK5boiJ3aY4vZy0ALQbwd6UrU9jUHY4DNZfKORAQ8vTqckPg+Bz5jj4itdHYx9a/CRgrK1g+ngWrvD3nKdaWUxa5YqCkHi3tLxYdEJICiSxFuW1ApunrS6hCFlY9V/7CI67/rY8V8eZ0knZl3I/LTzUCglbjAxa5GPVUY3Iy8E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789695963; c=relaxed/simple;
	bh=RJ6QlcrTv4kja8fS/ttlwwe31dE7ccJxBaQzjsmvCws=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Twme6OACbwsYj1tsDuH2R4HpREIqVU48bx5dMu2XhpctLQDNo8i/8mbdlxHKtHzwWI0q/+7iw2/nAFzQrQ1hl4JUsMbc9vjt7wa8dhK7wpNf8QaWKliB8O9LUG5RrIKkaD0XePo+Z33naBvrVCT5nKb8gF9bBhWt2bh4rvoJd+M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=TL/AJB9Q; arc=fail smtp.client-ip=52.101.229.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="TL/AJB9Q"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SbmeZZYPprodmI1uHDsXXUYQk+EmQbJzETTqeWotqhmsp8xNUC/Kl1/caHmdg+T5ClCKMIbAuAWXm5n2pcGpF/Rcvcd8BGQWSTKb4dRtU74g1d8BfQhNHjNOfP5Dnqvh8t30ImQ+HG5KfBe64aOpJq5Ua+hprqfzo0U6OUdGLXtkuYxbn4poT4KD/1JTca7+Dd+XvDvL9IjvGuLDKrAFGjuU8ZySILtVFCsbY1DEMoxEdjPRSYXibrAKRpvnNHVMbxmp2/WwqA441+hDdiuNZrEZU2X8VcbTA8WxpCUttCWD+eC+9DSgWhiKPVJixYjcWneMgqwvM8Rkp9J2PdR50w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KaMA8LGPuuO2VnbsmNW9r63YixCx3t8xGxvKFDa0dHw=;
 b=JmalmbRyZD83YuVaxuZzmGvYuALpLagLuzA6FBXAut11i8Ys+Y646D+TbJEt160+AemOkjyPVoBkul/qiPkFnYDmd0wcrinzzSFNbV5ADGlLfl4L1YjDEOczL200BvHDDCVrAm5Hl67aIClClx70bQfe16rpPxEnyHAdkswUuI/7hafCQS2MOV5wMC8bSMtFul4vscwWEmF6hvbZocrdD2DvNs+CuMgmEZuq+Q9znvBUWgw3B4vgIIYs31OotfgFyyRysdSBFlLVNPv0MH96JthwuA4v2Pw0Vi9wsxMelmAin14nnrKoYvy8pgnO6b/jYiTI+g17iTgD8SDyucIojw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KaMA8LGPuuO2VnbsmNW9r63YixCx3t8xGxvKFDa0dHw=;
 b=TL/AJB9QuPmMvpmHU8lUREeaVr7/354hXEURpJzgiNvFG9nDsCDU072E8VP+4FraQqpj+ZbxtZbQ9HmMp2NAKjI/L5PAhcyGSBd0AfQKv+TkjwGm6x6gnLfnvbcLpvkwsn2+gFdZ6p45GEShdxV3V2wE3MBQATa7EEQ5qAnfKGc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB14118.jpnprd01.prod.outlook.com
 (2603:1096:405:214::12) by TYCPR01MB7459.jpnprd01.prod.outlook.com
 (2603:1096:400:f6::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Fri, 18 Sep
 2026 01:45:52 +0000
Received: from TYYPR01MB14118.jpnprd01.prod.outlook.com
 ([fe80::846f:9035:6a33:1f45]) by TYYPR01MB14118.jpnprd01.prod.outlook.com
 ([fe80::846f:9035:6a33:1f45%6]) with mapi id 15.21.0428.011; Fri, 18 Sep 2026
 01:45:51 +0000
Message-ID: <87ecerjprk.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 8/9] ASoC: soc-dai: add snd_soc_dai_get_bclk[_ratio]()
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>, Alvin Sipraga <alvin.sipraga@analog.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87pkybjq02.wl-kuninori.morimoto.gx@renesas.com>
References: <87pkybjq02.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 18 Sep 2026 01:45:51 +0000
X-ClientProxiedBy: TYCP286CA0251.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:456::20) To TYYPR01MB14118.jpnprd01.prod.outlook.com
 (2603:1096:405:214::12)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB14118:EE_|TYCPR01MB7459:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c307624-6ea8-4a37-eea5-08df1526923a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|52116014|376014|10067099003|11063799006|22082099003|56012099006|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	vZ/1zqNLiy/u+c0/8TKb/TPq2e2NZXDZpbds5duwUGfeJOxV7jEvRzY/+6vYBQjjhNz8sbmlDgO9GaVWJUPfzTO2Jw+Pmx+4mibc5pEEW8rtTM0IzoBM5GWRlZB+ZftOKNrA7b336boQJnyvQRy0yVyBdiZP0cD2f3KBzbumElX+GtYpFLOSxVzXKg4QcqXiLOBRnm0YyHIDAPDyOZ4di43yonQsPCK5A/vQ3MBRAtR0byPRzuRU+DkQjFg/G3S5rtNF2OkwI/+Bnju+EYvk3AbPiS5W4aQR9OUgCmW8T/Zx7R3vDkG4nu+dHaLgiBo4q7BvNjxsRiVbrVUbfyH6eRsxQJLBOfA1ywFbAJV+QZCnIvHZDehlCLV64dmaG66qlrUf6Ju4tDELo0kCqRZEWWYNC87qgBk346aVF2K6G9E+uO80lP32K+H0bX+1ExkrZ5RDcLT4Ilnm0oH9v9y421hH0V3T1m9vfPnH5G9KXDQhwUXoOyDGO34uObufCEcYln4dUPznqrEfh0HyIys9P5cKmKLDNu1oxbnQOLhypi8+GRKY+umedmDG1k6ovHOj11075W1tJiO6PD6LgdCS5iB7d1lNu4aTibqBXPOY/iFEVXYzFiVQ5OAxPN69idp2nxALf1LoaQS0FS86F0mYSd+wlxJ0Kp/YFChy1/UFf3M0htD3Vt6Hv3b0roQvVXhyOk/DpBwhJiu2OFJFBU0dIipCeMIg38wRk1EJtjXhJiI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB14118.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(52116014)(376014)(10067099003)(11063799006)(22082099003)(56012099006)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?n2dE1plnyV67APZS3iI8XfPnlN+iS/0yliALrWXdGsuemeeipkXn/XFrB4U8?=
 =?us-ascii?Q?sOwVv9kykcFQGOkB0qD/RYs7Z8GrdOymVM9zsdsqpSa3Na8TvZYOvabqp7GS?=
 =?us-ascii?Q?EK5QNwg0//hk3IXXTOQ4nOgVvgpmUP6GxNtCe/sCzy4tFya4Y4PDrVw4SB2Y?=
 =?us-ascii?Q?0lIMVYfeGMKwxY9x7HppMKuBgVek/rHpPk+AX0KcG7VeSY71XoqYpywhkBUr?=
 =?us-ascii?Q?N7rLWxBN21LuBGqQV4gYhIzECSTh1VyDBrjJx071EHdEj2BCAu8tG0GFh1Sp?=
 =?us-ascii?Q?rrbefXpzqfPTWCe/htdsrT8uEF3HR+ueKIHJBUL4Kob3qmCpeZxl8ZJzgPHw?=
 =?us-ascii?Q?DfPXmQ3z8XP4kF6tV9Sfzs769AzWrSjF1IVEywVmKmFWz7ibZ7MVfx07W2vY?=
 =?us-ascii?Q?QtIXEydY92AL6O0H7AEfN4VVB4yr4KQlRWCs1c2M27HXMqWfkpy0H9mfVzA/?=
 =?us-ascii?Q?wROLHuNPAQgRbejy3PL0NmHUzeAG1ikqxYU948HasBVAP4iqAWlzqKkRZYYI?=
 =?us-ascii?Q?WebGqUiRBodtmLtIRwUwP57N94JqZGHWbFLFBRPp6Ql23t4CIj9XwaHwFFRK?=
 =?us-ascii?Q?S4EuDSVLLhQ0R0hOsJ5f1ZbMy5nr98edOzRPUpiyneYpon+R3A80kjQ1GDzy?=
 =?us-ascii?Q?meSFMNFUyGX+YHizhrHwbuLqgR3MoGNHSMAh5s9rDLwLLryel20DVKK2RWJD?=
 =?us-ascii?Q?3e5YqXooXKKhhLTBh67wGDx9goroiM1njB0XV+YPX2CTK38XJY/cz8zdK6W1?=
 =?us-ascii?Q?99S+HuQbHTosBH9KVqNUXK8EP4fN28k5J9MoldgHbovpEiM9WIe/SK8inG+O?=
 =?us-ascii?Q?NbQnGsI2HqqXMslivam078bsANh4JLFpDkD/LQ/yG83ZOwuXHciQ1roVWRyZ?=
 =?us-ascii?Q?LA+hgG1XuCGHYNeBmJcLatN++4q1Mwnsmf5NGRh1mHYZKG9/ycKfpx5QHUkv?=
 =?us-ascii?Q?C+YjSKNglTnioDNHeIIDGl6K1A2v1m1iwNJggEEmdu9cP7kt0iKEw1CNu7Wv?=
 =?us-ascii?Q?ttFkSpERTl1UlyzgJlG5NeeJvUYEG7V92e7qUZU9eMtI+LAan1cgwE3ThBWo?=
 =?us-ascii?Q?k8Od1USJaGmYtGPlV4krYnrJ7p5tkek4CniyMbKy1bHjlyInhqYfzslI3yzk?=
 =?us-ascii?Q?h1I5q1r4/YuPcnrYPkZNuULkuZsWuSUoy90Z5i+Cs4DVNmsJyiEdAJ123tZI?=
 =?us-ascii?Q?5GwwKhbKMLTFAWlyEcKlFu9UwQe4ymI17l/+LAJszOoyCdb8BfQ+iv591HQd?=
 =?us-ascii?Q?8QXdmygTjVkHq440iiTG1imtexiQWgEon8tpRm2vLwb59YXCGj5ga1Wn3Fvl?=
 =?us-ascii?Q?KSQMN9WNUDwfTIxW8q47VGuRwszuv318RtdxGK+A418pmQuo80gwTibcUiNW?=
 =?us-ascii?Q?tekYgF9efh0GepsWf7tihEqrUshAzgPmJCsL67AayZ5mZcwnY4skCc7bEdzA?=
 =?us-ascii?Q?QmplNkZ2xZPDIbZUpU1jjOKZi+/9AU4lJASS6SHnRCxgppqPw6VqSE310qiz?=
 =?us-ascii?Q?25RO/viWt0BF2nzTRMPI6Q5I5pcxIH2ga2ihQU3dWUbsdu7ahJrGWl0fXhN7?=
 =?us-ascii?Q?rZhqs8P9suDmw0pVAcNdBwin1mvVm9EyGTtn0t4wjzvtq5f0VEKTS6oFnBDO?=
 =?us-ascii?Q?Yg5jNLaf//uCglIZfvrQi7X3Jauz4VYoeAuzwyrIcPYJUwhCe2aLeLxShKjC?=
 =?us-ascii?Q?Njo2b6L4mIlHe4DD07X6kqnm3gYXfaX/rqveQCUESTsusdFmgWLh/eP9057i?=
 =?us-ascii?Q?/sDBMp/jTU6clDh21sHuaxyxo0GdP//0qtp6wqP1vsOJrk0GgGt6?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c307624-6ea8-4a37-eea5-08df1526923a
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB14118.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 01:45:51.7695
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MCdyEIdWneQoL5b2T8a7NABX75zxy9B7AevpBqIY80mTIvOVF9uribxo2FDDKs/etNgGO49YiTm8oD9ykLqWh/JOMX2ANMx+dWW3s+gC1m9K/jx7ohI7hv7uvKKmBrhE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB7459

DAI parameter will be capsuled soon, will be not enable to access from
each drivers. Add snd_soc_dai_get_bclk[_ratio]() for internal use.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-dai.c      | 10 ++++++++++
 sound/soc/soc-internal.h |  2 ++
 sound/soc/soc-pcm.c      | 19 +++++++++++++------
 3 files changed, 25 insertions(+), 6 deletions(-)

diff --git a/sound/soc/soc-dai.c b/sound/soc/soc-dai.c
index 7412294eaea46..edf7d808e46ea 100644
--- a/sound/soc/soc-dai.c
+++ b/sound/soc/soc-dai.c
@@ -1391,3 +1391,13 @@ void snd_soc_dai_symmetric_update(struct snd_pcm_substream *substream)
 	if (symmetry)
 		substream->runtime->hw.info |= SNDRV_PCM_INFO_JOINT_DUPLEX;
 }
+
+struct clk *snd_soc_dai_get_bclk(struct snd_soc_dai *dai)
+{
+	return dai->bclk;
+}
+
+unsigned int snd_soc_dai_get_bclk_ratio(struct snd_soc_dai *dai)
+{
+	return dai->bclk_ratio;
+}
diff --git a/sound/soc/soc-internal.h b/sound/soc/soc-internal.h
index 3afc50d5760eb..f350fe5280e38 100644
--- a/sound/soc/soc-internal.h
+++ b/sound/soc/soc-internal.h
@@ -32,5 +32,7 @@ void snd_soc_dai_symmetric_set_params(struct snd_soc_dai *dai,
 int snd_soc_dai_symmetric_apply(struct snd_pcm_substream *substream, struct snd_soc_dai *dai);
 int snd_soc_dai_symmetric_params(struct snd_pcm_substream *substream, struct snd_pcm_hw_params *params);
 void snd_soc_dai_symmetric_update(struct snd_pcm_substream *substream);
+struct clk *snd_soc_dai_get_bclk(struct snd_soc_dai *dai);
+unsigned int snd_soc_dai_get_bclk_ratio(struct snd_soc_dai *dai);
 
 #endif /* __SOC_INTERNAL_H */
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index a446e9c1c9887..e63b6317f21d2 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -445,17 +445,24 @@ static int soc_pcm_shared_bclk_rule_rate(struct snd_pcm_hw_params *params,
 	struct snd_interval *rate = hw_param_interval(params, SNDRV_PCM_HW_PARAM_RATE);
 	struct snd_interval constraint = { .empty = 1 };
 	unsigned int target_rate;
+	struct clk *dai_bclk;
+	unsigned int dai_bclk_ratio;
 	int i;
 
 	/* Protect the rtd list traversal with the ASoC card mutex helper. */
 	guard(snd_soc_card_mutex)(card);
 
+	dai_bclk = snd_soc_dai_get_bclk(dai);
+	dai_bclk_ratio = snd_soc_dai_get_bclk_ratio(dai);
+
 	/* Scan all DAIs on the card for an active peer sharing the same BCLK */
 	for_each_card_rtds(card, rtd) {
 		for_each_rtd_cpu_dais(rtd, i, other_dai) {
+			struct clk *other_dai_bclk = snd_soc_dai_get_bclk(other_dai);
+
 			if (other_dai == dai)
 				continue;
-			if (!other_dai->bclk)
+			if (!other_dai_bclk)
 				continue;
 			if (!snd_soc_dai_active(other_dai))
 				continue;
@@ -467,10 +474,10 @@ static int soc_pcm_shared_bclk_rule_rate(struct snd_pcm_hw_params *params,
 			 */
 			if (!other_dai->symmetric_rate)
 				continue;
-			if (!clk_is_match(dai->bclk, other_dai->bclk))
+			if (!clk_is_match(dai_bclk, other_dai_bclk))
 				continue;
 
-			active_bclk_rate = clk_get_rate(other_dai->bclk);
+			active_bclk_rate = clk_get_rate(other_dai_bclk);
 			if (active_bclk_rate)
 				goto found;
 		}
@@ -479,13 +486,13 @@ static int soc_pcm_shared_bclk_rule_rate(struct snd_pcm_hw_params *params,
 	return 0;
 
 found:
-	if (dai->bclk_ratio) {
+	if (dai_bclk_ratio) {
 		/*
 		 * Driver has set an explicit BCLK ratio (e.g. for TDM where
 		 * BCLK = rate * slots * slot_width). The only valid rate is
 		 * active_bclk_rate / bclk_ratio.
 		 */
-		target_rate = active_bclk_rate / dai->bclk_ratio;
+		target_rate = active_bclk_rate / dai_bclk_ratio;
 
 		constraint.min = target_rate;
 		constraint.max = target_rate;
@@ -522,7 +529,7 @@ static int soc_pcm_shared_bclk_rule_rate(struct snd_pcm_hw_params *params,
 static int soc_pcm_apply_shared_bclk(struct snd_pcm_substream *substream,
 				     struct snd_soc_dai *dai)
 {
-	if (!dai->bclk)
+	if (!snd_soc_dai_get_bclk(dai))
 		return 0;
 
 	dev_dbg(dai->dev,
-- 
2.53.0

