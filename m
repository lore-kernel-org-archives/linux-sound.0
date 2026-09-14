Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010020.outbound.protection.outlook.com [52.101.229.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D9A52E2840
	for <linux-sound@vger.kernel.org>; Mon, 14 Sep 2026 01:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789350479; cv=fail; b=MlC0TKXGNqmUpa4gHgl9NGuRcKilfS9j+g8fE6DyfzbxxlOYCffUhm47urGVp7dy3bcHBZulLJb+M+xQPTl9b4O2mRXOOCwgaEw2Dt1ZLncSIUiy+JWDQ8mCzNuzOGzXV7j4xSV4Ir45jNGetA6pHhMT2Dzd1i64fVYSjFtODr4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789350479; c=relaxed/simple;
	bh=dVjUxK9NpCVwKqgnP4dilHu9aNYmxMvKis8icX8AbGM=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=BMenuVU1WkFu4yWYS4pl+w6vecKJRcDdV/r0E7n5p44xnzUVLgUWmnJsSg2AINXvMtPfKVdnF73RVZgzya9iGx5pWi44ZQfqMmXWIDdv8AauKSdROq13jAR0z9+HxP3u06O+OGatttEBBMKkz1aR+hK+giGOa8aLiwi0+pI9DYo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=gr9R9pmW; arc=fail smtp.client-ip=52.101.229.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="gr9R9pmW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=svl/rtLqa+VP/nPiMv4BEIyvmXu9TEeqv/ErKWrDRugZOzJyNAgEeyxTAcBH2bH0J2driSr5GBKqE6T/cD+OQS2AUc6UYBJ3GsgjWt5wrk2YhDFCkYpR5+F0KySbyJT/Ai3mk2a/RtI8IHSvy53JA+Uxnl/LrWjeWy95JbDeSQPao9FbNhnT2U3593iyOvDRFUJC+gRPJ1h7HW/MjVUPLpDlfQTgV1URXr55QghxzfhHrMdVx+kP3LkLFyySJ6dwjHKZm3/EXgit7FZohjVM26JwJFBzDIPD1ahalcxwk9TwrptHmsNVanaiY9K0gqVba4xOx1QaiKJ9NVtfvn370w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MGd8g0YXRvOd2aeHFYUxiUSqVG67jfkvg8h595sppYg=;
 b=YAs/MuM36WO+3JxckeXIdiIZpCqmzQ6yZhuiXUMXO9kN0tzhGmY4irZ6Mx8uxuxbTW9kccMlP8yOmc51nk+GmduGHalqyjJl1C0qU4prfIsU3JvMGNEwYXiTGVIx0XAvdudlrsJJdVCKMr+WTUO+QwbDCBzCFNqo53DgrU1zSJAtxzEJUMrKMaFHBQAM41c7+u8MQ6Vn4H1JD2X01ynanLvYPEB7vyNy9hKcb+zZOcNermkxm7NV9D5icFoN/ylNhuZqVRtM4kUydutYzqHwJ8/vzkUrfuCvE+F+y8fM10CvqEENoVpHLfpsimQBRjXpCmf7Aoeyp2z8y6M2MTOhOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MGd8g0YXRvOd2aeHFYUxiUSqVG67jfkvg8h595sppYg=;
 b=gr9R9pmWUCAW/VTPP/YC2juzeSWpB8ee+wxYzcVBPUToXY1zGw8yWHw9aZoNZio/PdSUOyC+zVe/7E5bpIxTJKE03F5Hp3yvQvBMzPrWcH5sempsSNmo3jZRGNlMFvJ/jbglgtjolQ+LxFk1cTP1JwWDhM2u7PCcwfQ9JUnFNos=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB14118.jpnprd01.prod.outlook.com
 (2603:1096:405:214::12) by TYWPR01MB7202.jpnprd01.prod.outlook.com
 (2603:1096:400:ec::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 01:47:55 +0000
Received: from TYYPR01MB14118.jpnprd01.prod.outlook.com
 ([fe80::846f:9035:6a33:1f45]) by TYYPR01MB14118.jpnprd01.prod.outlook.com
 ([fe80::846f:9035:6a33:1f45%6]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 01:47:55 +0000
Message-ID: <87cxugli2d.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 10/10] ASoC: soc-dai: add snd_soc_dai_get_bclk()
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87qziwliaj.wl-kuninori.morimoto.gx@renesas.com>
References: <87qziwliaj.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 14 Sep 2026 01:47:55 +0000
X-ClientProxiedBy: TY4PR01CA0070.jpnprd01.prod.outlook.com
 (2603:1096:405:370::18) To TYYPR01MB14118.jpnprd01.prod.outlook.com
 (2603:1096:405:214::12)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB14118:EE_|TYWPR01MB7202:EE_
X-MS-Office365-Filtering-Correlation-Id: 15024b64-8ea9-408e-08e7-08df12023246
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|52116014|10067099003|22082099003|18002099003|56012099006|11063799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	V7f6JGlDihe3w4cflfbP3XBwcRYZUfFZYNusFW6BvoEYKF4W+EYUcb5ofPXh/grmKcm3fFfVLG9jw70Pm8jEdgp4HHsVY6NIOm6LaweDNLSoyQJMz7lHszFcCcKq9hyv1Ahh35YKKvDm87xH4ZMJNYw9AQ10r/olxpQDcPle8/3+9aySYfUmuxYSdeRSHJjhZDj/MvI5BXpxKEP3/mXB1a8mcSVQGxU/EhmytDNo0umySc6oyWp88IoU+BRgH1mnU4bil9idRxzTy1FbLUAwNyzlxQF79Di+XOT54dgh9uEoJlnzHZpEFQBdZrpZKtbhd6VEUzVHmD27dfWXH/xdA38MUXXsr1/7QbkA9pXafk1ZmfANjdYzWF2Rb/l25pW8wWslz1Cxoyop9pjZdcYot3XCaq8o5a5Y8asvhjhJGLPn0xfWzH0C9KTFJ08r44ovmwlqvgBSXeMGaS+KyYnttfjM7PHW0acCdfdJbLhgvLJOt4HF0igSsG/ofMtse1zWybHeyTEw08vqXeF84f1GvjkqU+/zwR609ACoIA8O3DHQyQ6O5weV8YaWIuB5ot55mrvu5+cUN6v1Vg6m4vhOodsJkRgHOuubx85PfZ8MWJ+wP60JGyR8W3poqCvGQulgdi5Kt1KlnjuK2OSCZCZnMjkXDZBkyCCLOU/8ZlmMrIyr+yljce+ojl81dBJHQtBaWzlndu4rlfqRIf8Z21w9T34zuL7A2kCMA73XgohaAE4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB14118.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(52116014)(10067099003)(22082099003)(18002099003)(56012099006)(11063799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wCSuDaR0Xd1NHjI2nQj9aCvuxhcVDDWUU9aM9RNUGuWFYyYHTi8/90RYJknz?=
 =?us-ascii?Q?9kv753HSiaR+l/ALLS5EMO1wWfVBj6fd7qgUoWf1t+GwfFSH2jFLNhm+xGli?=
 =?us-ascii?Q?Q15qD8KiuXz31PotWDDHPoGHq7VdKGpYZSQMUWFvbZKE9EhpwiIXW/9wi/dB?=
 =?us-ascii?Q?F1OU3N1fVWIFjqwxyQ/p0eWEk0FJm8WWF2NU0ZWkL0VbkrHKVoLE9Jf2JawS?=
 =?us-ascii?Q?It5xLtUi6FI7WsOfbyLn6crtnYd4mRxPjNjnowjM9sARs2hqs2rifRky4Bum?=
 =?us-ascii?Q?bqSMVB3OkkNmzfyiKvh3xVBPGjzr/LfxaCincOtKvWAWxYHZYVij1ucIMmch?=
 =?us-ascii?Q?sWP3zvPVoK5jOIO6CTj9ZeZrItJZG5waAOvh2NZm8M11Xmni9u69arU549IG?=
 =?us-ascii?Q?ef0hV87ATn61bmu3YQznSwt0DsxAmBNXjcAKwSflUHMQ1My1VpHHGsa81kfx?=
 =?us-ascii?Q?dov0S8A3jAXQw558reHIoHZf1+yvtSRbmtFznADZ7J1SF9U8bGNnb7AajNIz?=
 =?us-ascii?Q?1PkAS/lFEdgDwutKklm72E5IxqPn5xjnkmuPu9SRZF2Z2J/Eq2Rnc1mEiaDs?=
 =?us-ascii?Q?4xhRP6d3xG7dS/aRV+OlfvPUxXLzNZNZFth6fwaCOKjXqIXudbZsVVAqnGr9?=
 =?us-ascii?Q?/M9BeOZQLFnw2z/G028/5m43XoDGgxKv1oxMgVgMxMTQajS/WDY+j00kp2pS?=
 =?us-ascii?Q?IM/PcBbTvdUcVVSuVTkCJSxoJjjMUah/gt3Zq5C6Wa35AKad03T81SugjG/Q?=
 =?us-ascii?Q?ol5+2LQWIKviROlJBSAzDjbdryWLMJRHs9uWBdCw+xp3BLrBElTTz+0h8AdO?=
 =?us-ascii?Q?h6kVrVQqatIhz0xpv32IuAurwJfa9YcdpvvCX4QMh9p0QoRb3XYT/4HEhYUj?=
 =?us-ascii?Q?wWH52jjTh43j+hy6PC5qtDJ0Tq8pWD3ykhdLgPaILvPD9J1DYjMJX5yls8GC?=
 =?us-ascii?Q?ZCpUu63h+cSy3GQFgfRzR2AHTqNXNbysIVJWIc79DmGbod/Dws8d/f8UAq+1?=
 =?us-ascii?Q?NGYk+NgVcFAo50xVE3q4JBvcmQiqaoVWfV6hsSXNhIRZ5881DRhakrfg7tUr?=
 =?us-ascii?Q?RiXl3B1cXt1OTi/YolQk9COwXGXugHsWZmb2gxrJhhAhHsEOn/fvDQL0d3jd?=
 =?us-ascii?Q?8nZ6j/BQu/Lr9MZ4ksMvE56Udr5P6bAqz1RJWdp2gA8vm22oxJAZ6KXEwW/Q?=
 =?us-ascii?Q?ILQBOKRQisREgRgd+WokY9O/qSEa2Gnl1ebHS3fYz9ge/ITS72DcrS6EnDHN?=
 =?us-ascii?Q?WB2gkdapBG1G0rYibhy1WS5KhcMMeK56IxTl7an50vro5bqKDPwYi3lpeLru?=
 =?us-ascii?Q?/xxH2E/J8+OnDZXwVSDyxVBPTn8QpivEhi0QcVhkjnTmgMdj/oMOPQUo75IG?=
 =?us-ascii?Q?2aac/ALXkCTOKu3z33m+aB/j8jKtNPARnfcQpZCvgR11gkHxQOaRw+1R38JI?=
 =?us-ascii?Q?G5+vi3EYrdNU+fUyJlsVX5BhDt0kTFXzTiRN/ICvEnXm5fkytOXEk/+mYcNN?=
 =?us-ascii?Q?qoMGIb5klKtwhP+BIUAbTxTY3IW2i0bPDfF/Cw9M2Va0Z4CDWtLT7oBhlYK8?=
 =?us-ascii?Q?S3bRCerBR2oLdAPzfptUaE8R9eBp5IQGE11aGOK7L1/htpGvidB6vWLNQ1zx?=
 =?us-ascii?Q?Qh9I+SuE9DbSV9yMdFfzaMjkDc1zymrg6ix7A+ypovukmDxwdA2MuG5cif1u?=
 =?us-ascii?Q?FnZRtT5DxvOVpDiDcJf2F2DK/829AS5i028zjzcJU63TMdetK+jRhnwBWMj/?=
 =?us-ascii?Q?yw6gDxQ8AYVxnnTQRGuhqpfS3xdE3mnphqS0BvEqTyAqmT9JcnN3?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15024b64-8ea9-408e-08e7-08df12023246
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB14118.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 01:47:55.3979
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yYyD/Gx0yma/AAYGCMFjQn47xHZTg5D3XoxmM9n9E5ZQw5Ut8r5lyEmQYlsJhw2XaM2LZl2iympDl7F/gN7Kx6jejq+NdDfmjeVLFb4r5fWg/Cg/ATLrdlZBF5+TJQdd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB7202

DAI parameter will be capsuled soon, will be not enable to access from
each drivers. DAI priv has been mainly referred from SoundWire driver.
Let's add snd_soc_dai_get_bclk() for internal use.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-dai.c      |  8 ++++++++
 sound/soc/soc-internal.h |  1 +
 sound/soc/soc-pcm.c      | 23 +++++++++++++++++------
 3 files changed, 26 insertions(+), 6 deletions(-)

diff --git a/sound/soc/soc-dai.c b/sound/soc/soc-dai.c
index 28827523e3622..6418f5b12fb14 100644
--- a/sound/soc/soc-dai.c
+++ b/sound/soc/soc-dai.c
@@ -1385,3 +1385,11 @@ void snd_soc_dai_symmetric_update(struct snd_pcm_substream *substream)
 	if (symmetry)
 		substream->runtime->hw.info |= SNDRV_PCM_INFO_JOINT_DUPLEX;
 }
+
+void snd_soc_dai_get_bclk(struct snd_soc_dai *dai, struct clk **bclk, unsigned int *bclk_ratio)
+{
+	if (bclk)
+		*bclk = dai->bclk;
+	if (bclk_ratio)
+		*bclk_ratio = dai->bclk_ratio;
+}
diff --git a/sound/soc/soc-internal.h b/sound/soc/soc-internal.h
index 3f3406a006354..10208ac310095 100644
--- a/sound/soc/soc-internal.h
+++ b/sound/soc/soc-internal.h
@@ -33,5 +33,6 @@ int snd_soc_dai_symmetric_apply(struct snd_pcm_substream *substream, struct snd_
 int snd_soc_dai_symmetric_params(struct snd_pcm_substream *substream, struct snd_pcm_hw_params *params);
 void snd_soc_dai_symmetric_update(struct snd_pcm_substream *substream);
 void snd_soc_dai_active_action(struct snd_soc_dai *dai, int stream, int action);
+void snd_soc_dai_get_bclk(struct snd_soc_dai *dai, struct clk **bclk, unsigned int *bclk_ratio);
 
 #endif /* __SOC_INTERNAL_H */
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 7eb58c4b6fc31..f2a1a13eb95f2 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -445,19 +445,26 @@ static int soc_pcm_shared_bclk_rule_rate(struct snd_pcm_hw_params *params,
 	struct snd_interval *rate = hw_param_interval(params, SNDRV_PCM_HW_PARAM_RATE);
 	struct snd_interval constraint = { .empty = 1 };
 	unsigned int target_rate;
+	struct clk *dai_bclk;
+	unsigned int dai_bclk_ratio;
 	int i;
 
 	/* Protect the rtd list traversal with the ASoC card mutex helper. */
 	guard(snd_soc_card_mutex)(card);
 
+	snd_soc_dai_get_bclk(dai, &dai_bclk, &dai_bclk_ratio);
+
 	/* Scan all DAIs on the card for an active peer sharing the same BCLK */
 	for_each_card_rtds(card, rtd) {
 		for_each_rtd_cpu_dais(rtd, i, other_dai) {
 			unsigned int symmetric_rate;
+			struct clk *other_dai_bclk;
+
+			snd_soc_dai_get_bclk(other_dai, &other_dai_bclk, NULL);
 
 			if (other_dai == dai)
 				continue;
-			if (!other_dai->bclk)
+			if (!other_dai_bclk)
 				continue;
 			if (!snd_soc_dai_active(other_dai))
 				continue;
@@ -470,10 +477,10 @@ static int soc_pcm_shared_bclk_rule_rate(struct snd_pcm_hw_params *params,
 			snd_soc_dai_symmetric_get_params(other_dai, &symmetric_rate, NULL, NULL);
 			if (!symmetric_rate)
 				continue;
-			if (!clk_is_match(dai->bclk, other_dai->bclk))
+			if (!clk_is_match(dai_bclk, other_dai_bclk))
 				continue;
 
-			active_bclk_rate = clk_get_rate(other_dai->bclk);
+			active_bclk_rate = clk_get_rate(other_dai_bclk);
 			if (active_bclk_rate)
 				goto found;
 		}
@@ -482,13 +489,13 @@ static int soc_pcm_shared_bclk_rule_rate(struct snd_pcm_hw_params *params,
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
@@ -525,7 +532,11 @@ static int soc_pcm_shared_bclk_rule_rate(struct snd_pcm_hw_params *params,
 static int soc_pcm_apply_shared_bclk(struct snd_pcm_substream *substream,
 				     struct snd_soc_dai *dai)
 {
-	if (!dai->bclk)
+	struct clk *dai_bclk;
+
+	snd_soc_dai_get_bclk(dai, &dai_bclk, NULL);
+
+	if (!dai_bclk)
 		return 0;
 
 	dev_dbg(dai->dev,
-- 
2.53.0

