Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011051.outbound.protection.outlook.com [52.101.125.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15A103002A9
	for <linux-sound@vger.kernel.org>; Thu,  3 Sep 2026 01:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788398071; cv=fail; b=AT/GPFmBdTpBhutS8VyVY/zq3TFkuOgewc1QMbEyFTCe9oHmx2lCA8gKeu/VHy+PA9Ohy4uoTIvYgbWpydpu3Y+n5aCthbrYAja7bblLHU0fKnmtSJdAi91a5QrEq/7IpZQXMy6RtUyMYokgOzvlc/OBnVY1Mo0mB7Uv7QVYBck=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788398071; c=relaxed/simple;
	bh=j5Uht9o998FYSk93VFmquE+w3OIbotPqZDCS7B2dEzs=;
	h=Message-ID:To:Cc:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=d4dMmpE65sc+DKmZHKK14CPnGhYGtmnCoWY89Aon59DMU5JBWSwswuPcfrnpgSzE1fsbgPqiedeG7yeXZ64ic8WA4H7UBd8B9+eIfF4ptxVzUc6ipc+LdSARaiTDbvHRpysGBTzGKft3HwMpdHq/5io9Sy+KC+y98hJw4ajOxIw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=BwXPK79d; arc=fail smtp.client-ip=52.101.125.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="BwXPK79d"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yTy5rdIudvJgaysXYCNdS43VavnfZxud967ESwx/TLCeS4FOw+tiMQH9hf+2HNvGRX7atJoeKpZJGUQeEfUdNQdpTGosEFzEtUTGEZiKldAHurAQGrSrTPgBIvTsVKWe5A/ISr0z9+/oizDjI0wL0Far4vLyz5oaRkRjWe9CcBs5Tg55nLXl2ffTLVhZXiey/lNEDJXsLVs1G7gfxjWR45MeotTaH3eaxwzg/oWCssLxvXaKzeBkbFLqGQ7KSpA5Q6CH7OyyHL4WBCLQXyCWuESYLG0K1xTPEarp16yX8ao83hwLBax5VsXEfoE2HOljL/DDj0EjBWDZdp9jLa6UOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J7i5M+PCwkDA3qU180DlA+T3MoQXJK982xTzSfqvKX4=;
 b=eGdoirN1CwyoPJWZIG7vyLPeHSm45vE3xZnXIke1CjNxwynbwPPseeeHXw6r3rpky6/RrsLnniM5nAJl0uQTT659njX5hXUP/Uo96QAbQOc1CAwzaUs4VNnpe06CP7wta+s750enA9FAXLgxwNJ/3u5iqymD3UMpNRdR5Y2yFSPSCH7PouQEO2tZUMjPwRD1L10ubeVCe8FEX1NhCCkySC2u0RtY/zFSEEM+3Cj1M7uG6FC5hskOMF1SVbjQXOkd7OHSKsJfZs6Po1FoyEx0jrMlgwms70jjzjIIGGRU6iHSY1pGt5EypooEM3JVM0ozEt2fAOks5AJP+3Sd+nwfAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J7i5M+PCwkDA3qU180DlA+T3MoQXJK982xTzSfqvKX4=;
 b=BwXPK79dwDvR7/AuqXMRFGB7hryjnv0AIvG+5O18WqCbzKz6v8+v4VBejpHsEaIg9M5Dz6VCg2rPdm52JsBnhZ5QncQWUSPO6sl2/9TkzCnI2QXvctEWudA0HFHGngMHHN4SQGNTODfbyhhgSiBRrKdXA8AXZMpXTHGqAPij7BU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYRPR01MB16474.jpnprd01.prod.outlook.com
 (2603:1096:405:2ee::10) by TYWPR01MB7169.jpnprd01.prod.outlook.com
 (2603:1096:400:c7::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 01:14:28 +0000
Received: from TYRPR01MB16474.jpnprd01.prod.outlook.com
 ([fe80::2a39:9988:dbe9:894b]) by TYRPR01MB16474.jpnprd01.prod.outlook.com
 ([fe80::2a39:9988:dbe9:894b%6]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 01:14:28 +0000
Message-ID: <87cxuvyw3v.wl-kuninori.morimoto.gx@renesas.com>
To: bui duc phuc <phucduc.bui@gmail.com>, Chen-Yu Tsai <wens@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Jernej Skrabec <jernej.skrabec@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Samuel Holland <samuel@sholland.org>, Takashi Iwai <tiwai@suse.com>
Cc: bui duc phuc <phucduc.bui@gmail.com>, linux-arm-kernel@lists.infradead.org,
 linux-sound@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 16/21] ASoC: sunxi: use .auto_selectable_formats
In-Reply-To: <87zexzyw5v.wl-kuninori.morimoto.gx@renesas.com>
References: <87zexzyw5v.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 3 Sep 2026 01:14:28 +0000
X-ClientProxiedBy: TY4PR01CA0098.jpnprd01.prod.outlook.com
 (2603:1096:405:37d::13) To TYRPR01MB16474.jpnprd01.prod.outlook.com
 (2603:1096:405:2ee::10)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB16474:EE_|TYWPR01MB7169:EE_
X-MS-Office365-Filtering-Correlation-Id: 855f4190-aa6a-4065-f497-08df0958b3b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|52116014|376014|23010399003|366016|38350700014|6133799003|56012099006|10067099003|18002099003|11063799006|22082099003;
X-Microsoft-Antispam-Message-Info:
	AWxr2d+weDL8pAaIU9+UWlLHFQiPu03EXM3UBF409LqB+7Q8m48rkyzHHa+jXr0JYlJTlwmdoFULwgIWe1L5TvzRlkX8HQf9w+DlaF3IUvhX4UX5H841yuXm7irxjn6h7LT/gdyEUTcp6Olv/mAfBCKYnyf8ToznYbFwg/8l7CYI1FXCNmeF98J9gETgXlmkbuOnw7DYP7tIHJsR+GXuAoP3bV81u1iqpWRCeZfNUGhaZ8UvoK1UVWlxB0AnIWmX+Ml1/fwBZTuT/OUJITa40Ec4P/DqYuzgCpTHQ8UPHN7RMQTPnNcVZFW3YeVVf8pOMQb0sH9KNrLLhOHVVsWfpPKBYprQ656olsnHl7H0OLOTxrzoK9qfXundhfyHJeXxd40lcWQf3x/1wUXbstO/UPznI8QcogpiDagPu6v24OyauOdj/vKAJn5Ix6hwCM76Xto34TvYKWWwlKVNpwtbzoDXVkTw2xhMrkOzSHcv54jKAkyitgU7THZ9xOXsPB0SAtHxTM+1O4nF0ENIDZ7rS6h7ZOHC/kN7zwpnVThO+XFc+ROxl1qM8bBvZBHoYM8fiyhw6uIEWtlI8DqjKUbimJbFqFTmaCxi64U9BTjL0+S8XdanOeB+adXTZoABDQYiLsQs0iRhZGyDA2ACIJEcTl8OjSos8a5LAEOKHaZDqd0CiCDEKbEV3phxp8Ne0xTGS7y3s4ofFEWUTmIq+ckOmRf7MlHO8KUNqr69wZYRqAU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB16474.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(52116014)(376014)(23010399003)(366016)(38350700014)(6133799003)(56012099006)(10067099003)(18002099003)(11063799006)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5TrhCsQ2pRzSX/maMbobDjQxlZNwPraHInyii3JeoFO5ImbRUiICXpFlOnUM?=
 =?us-ascii?Q?3+xsoXidzpRQOKATIOOraPC9pDyZqpGCJovsLuUOM8pLBxKuJDyysnXyKq2y?=
 =?us-ascii?Q?+8o44ohHenGuzqCAgfrgNk8m8EXIvFW6WiqbNxPRqNOBxHKXvMRWjZMmculE?=
 =?us-ascii?Q?l9ZNLQFtycUInAVdONofNSvZioGcaGgaKKBx5el1VtAX4ZZh1mogWArYXvPO?=
 =?us-ascii?Q?Ivj1tZKtgx1MQYmxa3dxGG4xmCdhcNJ36XSRjNlIYgNzI1rMb1qkpqIQ8pc/?=
 =?us-ascii?Q?ehEhkJnzRM+hQsKzuskvwCKZVA4s1WvPCTAqEtYLTB3sz3kotBOzu259XDHV?=
 =?us-ascii?Q?OVSwD8cmxhNRF/xwrQQrOd0yJOz5nJaHYKF3WkmA81gVxX0+LHlurGHdcAI+?=
 =?us-ascii?Q?hxlUpT98kd8S+NzsUtzMPUmv4t3IuLXS63zAmXzMD8sUYiDTWhV9eVENnF2S?=
 =?us-ascii?Q?bA4jineWT/0ADqeNpsE8synrJAno8+yZXob0nCHAJbaVUR5BkWJR6UA4oczJ?=
 =?us-ascii?Q?pnx5Aiyr5v24ecIsyHIINx8lLK2Uk02i1GyGMiRbc3pvCkNOfVQwVFdt9kiZ?=
 =?us-ascii?Q?T/wlG9KoBsjGz0k5TsHY9Lxw4Vx0xWk3hbzu9iHJUc0DZX4Iv17UTEIGxkWh?=
 =?us-ascii?Q?TuQ6uC60fAh6efIpvidmo4DUaB0YWG5Ykisj1Uls2DcqXTFa+TmS5uThDVb5?=
 =?us-ascii?Q?KXD3hXKiEFfo+Hy8jL0v+7zRrpDxvnF9f1ItMF12ZXjgdvHewA2fPq46ECLF?=
 =?us-ascii?Q?wKEZwhMPSWE6mynmwodO85HWnCiIDdrahn4lTeATHf6jACr0ypcb3h/wj4qz?=
 =?us-ascii?Q?ZCO6sEtSYfzFAbXz5cVXAE6OCEkjgI80TvnC47FIgzp6PD1RcPkGClv0WgI0?=
 =?us-ascii?Q?4Fyb6ilv/bJ18sJSEbxwtv8HG/q3lvNJ0PBDJxMk207F849E7M8uBg8HU0Gq?=
 =?us-ascii?Q?SFqQB/doK8gYVMzrWNyd6JqsuzIQyhK8f3OOYEDqXJ1oKoLJTdVsmO76N9KH?=
 =?us-ascii?Q?snWjG5ciGfoNZqRz7GmM5qv/mkZwUYH+CNFnOyMEuRLU3q++cjWhnZ3fjFZq?=
 =?us-ascii?Q?ubVP07TXgWITkLNFTNRBP7mOL91yyDNnfvBDcNTJ5tplPmjXlHRONQxixkNv?=
 =?us-ascii?Q?OeqRcilXJ0kD9lmztVutd4ZoFLa8nh92BZCdCAB6OZZ/003NVXFmZtvKEXfz?=
 =?us-ascii?Q?hDddBi6AQiD1OmYXEErLzHUKq06TUSAnkEEABAwlb0ZitjB3bwnePe7ZBLXv?=
 =?us-ascii?Q?K+IShfjjNodnEKP0EeIDBLu6d+Yw/QGHQkCkiZr+payIHSlsUcIFrLwwtFEA?=
 =?us-ascii?Q?kkFFS53xrTiUjJ5m0eI2eBgkj0w+t4s90p4lUUOdHh6CDRuE2DBPEzd2BzaM?=
 =?us-ascii?Q?U3vRPbyXY8mMbWS3P6uhJXSnPRMzvAtHEKuzyXWSLPXLRI9OBevtYcRBiwtF?=
 =?us-ascii?Q?6JKYv8Vabnx2gcxoGH22hm3Ek0wXn6Q1/C2mTi43LAr3DzeFylgZuIq1TX8b?=
 =?us-ascii?Q?h0NfyUz5qB7Jl0491YGDq+eL9su4YAQWl6jizB52wZ+eqOjwLQLSQ7Zbin9r?=
 =?us-ascii?Q?M+7FX7nA0AFZWXGvKzS0jjneOmH5fxxHlhFvJ/mVP/vp/U8OIw3RAy2eBFEj?=
 =?us-ascii?Q?8T3nby3+TjHFYoNl30FeRHkA/ctWxJk8oNAZ8q6MeEZv8gzTfirGPzwYjYEv?=
 =?us-ascii?Q?mCyWWSqXl1lzlKnF9oqu7JN0N49/nU6AlU2WUb6MWprV0ib60se8knbEsWI/?=
 =?us-ascii?Q?rNAIg/GqX48QlJuQ2a5pTaVIg9xf8Y6QmU7xZ1sdukjYBGNJyUyX?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 855f4190-aa6a-4065-f497-08df0958b3b2
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB16474.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 01:14:28.7330
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5q7EbAOmf7J+qo3Ts5Iy6kLkCkCYBJ5zeikcMQeBwHLthpm/EVoqm+b48NUhbJxtNoy9nevyAsUOj5/RhDYQ1F6i6QDrwiSCEfxQPIZvg70GFJJt0bC7eBm0IT70Jvi3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB7169

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/sunxi/sun4i-i2s.c   | 13 +++++++++++++
 sound/soc/sunxi/sun8i-codec.c | 13 +++++++++++++
 2 files changed, 26 insertions(+)

diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
index 716fa4d872ff5..43e6ea2563fe4 100644
--- a/sound/soc/sunxi/sun4i-i2s.c
+++ b/sound/soc/sunxi/sun4i-i2s.c
@@ -1106,6 +1106,17 @@ static int sun4i_i2s_dai_startup(struct snd_pcm_substream *sub, struct snd_soc_d
 					    i2s->variant->pcm_formats);
 }
 
+static const u64 sun4i_i2s_selectable_format =
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
 static const struct snd_soc_dai_ops sun4i_i2s_dai_ops = {
 	.probe		= sun4i_i2s_dai_probe,
 	.startup	= sun4i_i2s_dai_startup,
@@ -1114,6 +1125,8 @@ static const struct snd_soc_dai_ops sun4i_i2s_dai_ops = {
 	.set_sysclk	= sun4i_i2s_set_sysclk,
 	.set_tdm_slot	= sun4i_i2s_set_tdm_slot,
 	.trigger	= sun4i_i2s_trigger,
+	.auto_selectable_formats	= &sun4i_i2s_selectable_format,
+	.num_auto_selectable_formats	= 1,
 };
 
 #define SUN4I_FORMATS_ALL (SNDRV_PCM_FMTBIT_S16_LE | \
diff --git a/sound/soc/sunxi/sun8i-codec.c b/sound/soc/sunxi/sun8i-codec.c
index 6bd42da57ac01..2e4a205e4e565 100644
--- a/sound/soc/sunxi/sun8i-codec.c
+++ b/sound/soc/sunxi/sun8i-codec.c
@@ -688,12 +688,25 @@ static int sun8i_codec_hw_free(struct snd_pcm_substream *substream,
 	return 0;
 }
 
+static const u64 sun8i_codec_selectable_formats =
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
 static const struct snd_soc_dai_ops sun8i_codec_dai_ops = {
 	.set_fmt	= sun8i_codec_set_fmt,
 	.set_tdm_slot	= sun8i_codec_set_tdm_slot,
 	.startup	= sun8i_codec_startup,
 	.hw_params	= sun8i_codec_hw_params,
 	.hw_free	= sun8i_codec_hw_free,
+	.auto_selectable_formats	= &sun8i_codec_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver sun8i_codec_dais[] = {
-- 
2.53.0

