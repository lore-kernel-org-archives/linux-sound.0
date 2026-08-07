Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011046.outbound.protection.outlook.com [40.107.74.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60A7C2472AE
	for <linux-sound@vger.kernel.org>; Fri,  7 Aug 2026 00:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786064075; cv=fail; b=tYHejgoqeOTAbkuG4ETYDqGg71zbS9/1g/XDYAQQSjxO5XTQLvyIE6zppNi1JvVxTsomr+uZ4RIQEC+e0Rts64eJUDFhhef3Ar5oG287cis/UYDy+WqNk8aoYH4xq3p4qreYN4eb+pSsGTht/ZlqdVc3LrATGfc9vOLBQxTN7C8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786064075; c=relaxed/simple;
	bh=EPbemQ1+3j88BCXbSCihwuSZSdTD4fIkgqNWECqqzgE=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=I2yb/lwARWXvgfDkDMX8xVK5oMdD6ChyigAfrBzNex/Esuxy2go3yq/624yxQOZd208I0F0MJb7SOPIqkLGW2aP66yRPOQZhuAb0zk1gdevON/J0vRp3LK2ssW8zs3Mr/eqLQswDSjICTg+xl1/goPdi1/+rNW/JnQK3AQ5MlDM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=WwZgwZUl; arc=fail smtp.client-ip=40.107.74.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="WwZgwZUl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O/pIa294aCoO77a9k7gSKdq5UHDBrArM9lhWlmCtiI55L04MGx45zOhGUxqhguc9ZR4h/Wkiukg9sRAP29IRGFbYLm0iZvpRzxdisMf9yCM7cgGcf4HqYCa2cDxj1bO7YnGLX/nefDYd9OwaxlOGCDtDJnmEaw3IKF2ic/kp4YOD1PALys+fD/MWuCtmQ8IX4K/LwBjKYX9fTCFrkMn5im+J8y7e1N8gj+KUc/AG3z9GWwnwaZVxjZVPDkyPhmZBD4XQPZ05AddxQ7Nbrz0yJ/bwak3QLeN/2bVmrDawHq4spBMJUH7Wq7jbvjP3WhQ2+9tFW+Qx1xVOehbPeLalRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fZNsXjrJ9g/Dq1KZoejWoV2BrqUFKR1gFxS3+IYhV3w=;
 b=yaha5K94NST7a+SUMqJUZ7D9VBHg23N8nVdAwonG3VwBhj2gVZoS+h7mesN+IxnI7d2DAoxDepv9ibxSMtaJXgucZFGDynUogj6y2q/tymrMM5JuGAfAiQvUUhILVjplEYe2ayXtG6KuH18Tqu8PAgsI37I259KEk57BBarLesVzGDCzPZ7viK1Of1AQqACEKchpB2gZ006+uCp5isbjWQVWdQdrjeyaDZ1b0bq45zbLeGUGN1RTqsgboSETYJbmzZ5Y2I8ZognSTmi2a4DRsdnH7hmLZM3H/InysH3P9SD8nPfXFVHS+QBIk4MR1ITgbiVH8I/I5s2v2i/4z2yAiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fZNsXjrJ9g/Dq1KZoejWoV2BrqUFKR1gFxS3+IYhV3w=;
 b=WwZgwZUl/LRBtS2ysYXUGZhB8bc336yCx0ImXUMitM938HlFkDzaZKB5GDlQsLtVUvLfgxb5zGMm2aCMbZVe51sqShkP7ZPvk8iT+HWeaXfmUISRAAL2OLIu3k1cnVPIyBLiwk33I5vnAko4p+paQ8UCzVCyGXs1TXi/KLzQY3g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYTPR01MB11044.jpnprd01.prod.outlook.com (2603:1096:400:3a1::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.23; Fri, 7 Aug
 2026 00:54:31 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0292.022; Fri, 7 Aug 2026
 00:54:31 +0000
Message-ID: <87mruyu4vs.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: David Rhodes <david.rhodes@cirrus.com>, Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Richard Fitzgerald <rf@opensource.cirrus.com>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org
Subject: [PATCH v2 14/44] ASoC: codecs: cs5*: use .auto_selectable_formats
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
In-Reply-To: <877bm2vjjn.wl-kuninori.morimoto.gx@renesas.com>
References: <877bm2vjjn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 7 Aug 2026 00:54:31 +0000
X-ClientProxiedBy: TYCP286CA0097.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b4::11) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYTPR01MB11044:EE_
X-MS-Office365-Filtering-Correlation-Id: eefa8e3e-0e15-4a41-e14b-08def41e710d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|23010399003|376014|1800799024|366016|38350700014|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	DYfLIOYN+S0dpCIuT3FZigb0spcFzMBecGtvFVcmUqr4ynvitiivCpbdC+6UGduG9JTvXJtvwOWkG3r9slvpyLVYhh6f2FHdigzhcYaQ9sZFivpBULBfSujiH5iu1nqEFiESbB2kpfHNpMOH3GEf4T6A7/w6nulzAo5p/B+EFflxAw6wOOu2MVjuzZvQGXoUfeplnVpjAn56rLP1dL+xSi7eo0Z/ktZwPHvgOkdCZMYOLfV/o2ZMo5XinCci+CPGW/7SU4CiNpf/erKnnamZ/qGpKA26C6w3agdSwta+vLwHbMAZVlJ2jYkwZlwE+llKqFgM/4YAvwhmBlmP6oLhlLK6WV0LgE1auE7jtXRgXmZgi4R3YL54LlYYVWRGl+JMAw9e341ERQi0xE0232UXAm8M6YAswDkkqfYfNjm3if57PTVrnr4hsKVJ0XL1GaZxiYqPo4GdMlvvhotunVbCA4+coc+wFNCTEdk7cMJGyGZOPCEg+se75RWYP1UHyFNynZ6gaxeqBn/ciD5C5VRBZ+Fa/THQsdb0q7wTunvim4CW/L1gj9p8FvUdiNSdQdaLMqjL/8w6tBzDVmyCdNAro4nNejM3mPQ6Bi2ishj5izX5zBfBsIyvVFOEVi1/VJa4vlKf+fGBfv0Pf4xCtBElquBUllvIjoXQD8mp+3d2yskLuK3kM4nWiiDCxw0T6ZCTbmngp+TWl92sEgEqfU7EROmUwh/NZp/kNhpKM4fCC4c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(23010399003)(376014)(1800799024)(366016)(38350700014)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yGKutIrsC9m1JN/zVuxQf0OY4xa8Y4iH2UPwg5XCOGXqJCQW5EOfy6I9rV34?=
 =?us-ascii?Q?bNiWJZ2c2nPLSfGMX+LBDp/Wb+dGkzVUK40XAHqDii5PhKnKPxhs6hhlcJac?=
 =?us-ascii?Q?tAEXhmQ7dAXJdN9NYxe9yFIDMviJTy5sUR2RR3UpbW7IABiDcsGvvOTbDWRJ?=
 =?us-ascii?Q?ZYCgwitDJuCM0BSicEh/nFO8mcJaXtCN3eBWLpS3/+wRL632C7X43zySDjeq?=
 =?us-ascii?Q?bSUpIGaAJUqnnA1l8u/kbY9PGdPRlL+fYv2nyAGjMimCiTWJ+9uSy0mGPDvW?=
 =?us-ascii?Q?KdOLs6BQxntidn5sA07Mmwel8R/5oKiPSn45TqXJg4uXEDfR7BPv2fDU55kN?=
 =?us-ascii?Q?jsa3Klnax6hbqwFTO5aBXBMq6g9bDuU+KP8HO/m6KfPvrb/vv5NPdX/TktCK?=
 =?us-ascii?Q?5fBnNSE4GnwSNPCCdVM6XPAO4rE9O/ldZIrMcK0UmpT1NVr2UJ7XMEStvDGq?=
 =?us-ascii?Q?T2TzcJCpsgfCNpAN6K1aD5CLevM1BhmLSkQtLrPNlo8m05VlB0yiw8m6Fd1t?=
 =?us-ascii?Q?r/gudKKdDpCW6Vic1qJk3VmdyOB7GbXLsG7/V3+muEaBpKr9rub1cHA0rPZT?=
 =?us-ascii?Q?cLvaw4jwCirDzFJ67ynEzpA3LnR6K3F6uoCk6udPf2qO4uRtVVWWHE+HCuXd?=
 =?us-ascii?Q?RFOkEp6YeLsy2snCTQIJXOOIwVltA3jo6eakOlDyjxuGTea7Q0f5vmrRz/4S?=
 =?us-ascii?Q?A8fucZ3LFc13CtpBxZU7De35/4qZhOcvqKM9M6MrhQefCtS+OmseSmBSkHOo?=
 =?us-ascii?Q?rzc/+K4DgvSgJUFAZ0IM9Lkzs9kQtgab3fswHnJN5+bm5k2Hhz0N0ytEE5j+?=
 =?us-ascii?Q?Tndz2kvv+El4xbMynzmatiUgT1JsfUk7WCx8sT0ZWT81a6W5FIcUwFcN5h+e?=
 =?us-ascii?Q?4NpWbXP56XjAkOOpx+vOOf+jKWWMXsQ9czbxTX/uz7HeQRmC70LwKjGRVZiy?=
 =?us-ascii?Q?skz3obo/fBi6olMqw6+K4gwA/P9peJ7mrxhi3y0NT8x9JGE45Peya0BuJeVc?=
 =?us-ascii?Q?FASTboNH265zQYlkTNYrhg9kSRGi7RaGGWlvjpOA0ruCneEmH3sJY/B5iYhM?=
 =?us-ascii?Q?m5RFDScBs8HMoaOzq3QUkCXc2Y3J1mTVdBhdB4SVld9psz7CeZm1KPWzh4I+?=
 =?us-ascii?Q?etD0IqY9TbQjeItsIpIM3tQcYD5NFg/qQKHST/1Qot2mD6wF4+3yayXDljk0?=
 =?us-ascii?Q?4Yz6iGN/pvesHlk/RgZ6+vJifWwpgxYnH+f6agjVvOmvjaWp9YG5GDZ0P87T?=
 =?us-ascii?Q?g3XJ+aObauFkakPZUrPX+JL0YrGe1Dry2UW4gM6mLPno0j+N7UaILJlUzp/T?=
 =?us-ascii?Q?HFuZYHiVMEBCpSQGMv0LTm7rfZVlXI+j2WVqMBYLpMaPDfnMARzaxGOjhcEb?=
 =?us-ascii?Q?9GLDlgbFdSj0RyJA71EQRZk0RkKmUZjb02jRF8SBkjjPlgOV37cn7PuxtvcT?=
 =?us-ascii?Q?2OXisxG6YdjVVMrddcDAl6Ke4utvdcCcZkrfBUxxbaiKowCI3rO42JofC9Us?=
 =?us-ascii?Q?uIN7fI+rnmafTq8ko7aP0K5hlavO6NlAouMwxE9E3OeOZp8gnbGNZpfM51Gq?=
 =?us-ascii?Q?f5UsdQdhpmQ47ckdxjgok8xJFafjKz2N4vCTBKMRQeji4/wbB/4X98DpxRS6?=
 =?us-ascii?Q?dg4bPSEskvhw3yL45zclcrTyliHIU84gqn8V2Y/WQSE6gICGbllSka/VgoUR?=
 =?us-ascii?Q?XO0hf3cFnJN/Aif3Lp97OMY1hdNUi8W4hIxzWnuHNH0JRK6zvAgzH78tPQxI?=
 =?us-ascii?Q?UKh988yLadYiL4oQ77jfmolwe2sbtfgxnuIV/Ny98tSVerT2md6z?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eefa8e3e-0e15-4a41-e14b-08def41e710d
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 00:54:31.7113
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F98eZ1tSan4SL1SqJdZ6bEIA1w7oYoiOa8jVokmr7JmzOEfR4+AH2mnyL5d63AuVFBFZZuM2EqeD2aLQKy+Ndh7HGDQkCcLQX9KOaSZPIt3TesF1oN+/R+gtTgoVvY+7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYTPR01MB11044

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

