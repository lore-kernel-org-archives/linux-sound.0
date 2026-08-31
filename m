Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010047.outbound.protection.outlook.com [52.101.228.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71DB73C4555
	for <linux-sound@vger.kernel.org>; Mon, 31 Aug 2026 05:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788152888; cv=fail; b=ieMMvNTbvzX67lNUmPpryW1r/Eu71mQwpohNUSDlIJ9LLRuLwGO2KnzbHZnmWepibhMjiglr3I/UxHFMzVrq9MaSQB16DpsLzBmSVUkZ2fB6K0bBPDfrVdk/yvS3wHl4/PFSlKuT4WXPaLSv4+hiYWJiEjp5XDhUfXm6BdxdSb0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788152888; c=relaxed/simple;
	bh=V4uC659U8yTCo5pcB+9fANMwLRt/nm8G8jLjcFfmatQ=;
	h=Message-ID:To:Cc:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=t4x9LO4TX+2YBcg+t4iSdS+/52pb/bntf4fkSNnCKA2IvyR6ukjdGcuvOyTHaCMDTI5jk1zTdvMyWYhIp00cyssBhipREX4n+d0uu2hPVNp8q4LUg4dpgeRrZydw+LEk7ReYMZbJGRLjr1dPu0tLKLzt+mFgJy4/ohqWA7Owheg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=eOzPg2aH; arc=fail smtp.client-ip=52.101.228.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="eOzPg2aH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Br9wTDc3aX9MIaJI/mtg4kk925oSbOL0A6qBKHMhCsf/PWkJM6Q+5j85kAR5+j0nHc2zUP3t3Ke742CbkQm7tp68430fYCKCjYIn3YHgNW5w4+fl8rX2MA9hh/byN0sDQFXlsXgfjShbVTEG8WT/smGAe7AxwrhhFTsymZ1If/an0HNUOo0UCLQwO9SdqmEMu8y9e6TG4nUDWMk8bTnt5GUA1Y1Z4H62sNKGAGhI4FvvNFZiWCsckZhlW3a/wwejGfTfUx+JSIFzyVkZfyAEqsSBeROGAJWkwiBY8vtXBCNBnebsaU5lQMOaUhD8BkFdG+OPI4dSYWAscYDoLkVg4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E085A2ZJ76weGQI4Xx/6SHUYMzko+qZ/tWuIehppRfw=;
 b=gnbi8w0+TjRALGwTeS+mjcIWDG5NaW0/VpcKzjn7RgH/vFJbyp5loxPWzceTdFrQoMGS+LmlVp7E8u0Z1ebNP1XYyLP6F4CmQpbCyoX1oTVveklmUer2f04KI2+XJ6XOAPXFB6S/5zXvATWeTGN8SIAWOHm13hsbZkBLtTIz0TkxwPjl8piAWKIclUBlP+ivzeZcQ+qMakMYLqLIIfm6Zo2Q1xadOSWt3ehKT9vhkwYzzMl8W9yDaxCZgL00GhU/K5c3Y6KTp54UjSDCNL9mk8K+qEQYoMDN9vQs3sBVYygTxgQBLOFqUSwXlWpTmP5p9u/1mvY+eyjhRMJuF47EXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E085A2ZJ76weGQI4Xx/6SHUYMzko+qZ/tWuIehppRfw=;
 b=eOzPg2aHjRHJzZdLgZkk0R5gU/rnBGSsmdOq2iPYPYoLjLhK7nigXOnVLLAoTgvu8ObW1uDeWdaSy3U6OW7cII5k1DFffWqtYriXR2S+GmmLy2uIiYhMPTjKEWBtpuKtTLZ18UlfqmziB+cAhq76cK4acL0BdmS9ZrKuUprTbIM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYRPR01MB16474.jpnprd01.prod.outlook.com
 (2603:1096:405:2ee::10) by TY5PR01MB18382.jpnprd01.prod.outlook.com
 (2603:1096:405:3e5::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 05:08:05 +0000
Received: from TYRPR01MB16474.jpnprd01.prod.outlook.com
 ([fe80::2a39:9988:dbe9:894b]) by TYRPR01MB16474.jpnprd01.prod.outlook.com
 ([fe80::2a39:9988:dbe9:894b%6]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 05:08:05 +0000
Message-ID: <87zey2ubbf.wl-kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, M R Swami Reddy <mr.swami.reddy@ti.com>, Takashi Iwai <tiwai@suse.com>, Vishwas A Deshpande <vishwas.a.deshpande@ti.com>
Cc: linux-sound@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 17/39] ASoC: codecs: lm49453: use .auto_selectable_formats
In-Reply-To: <87o6eivpyd.wl-kuninori.morimoto.gx@renesas.com>
References: <87o6eivpyd.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 31 Aug 2026 05:08:04 +0000
X-ClientProxiedBy: TYCP286CA0098.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b4::19) To TYRPR01MB16474.jpnprd01.prod.outlook.com
 (2603:1096:405:2ee::10)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB16474:EE_|TY5PR01MB18382:EE_
X-MS-Office365-Filtering-Correlation-Id: 7331186c-2f77-48cb-56e0-08df071dd6b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|52116014|1800799024|366016|376014|22082099003|18002099003|56012099006|11063799006|10067099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	5wPNyHtULclt8rGkLuTO0yT0OGMAgHZsjgEaZ//Y9tjpkDX+o1dusIqMEaP/vKWnF50C3MTMo24TeFQ7c2KWK69jpJR/S16Fh7lW2MOPcngpuZBwu1xQL9y0lUqm9iLw7ZdmADIqYrnZKR4yFNQm/KNr8JuxxjYiwwRLlLKjaFBBQK3DEvuOEJu6yOxnVjyVnR7uFd8YPUR/kWp57u7O3//L0TW+9VF7Bygf6lOtWMDvB+l52s6xId9D8Glfln1U7nQwKTTAiU83ErzP5fwBgohDP2yS/QNpKc2cgq+DDAtkPUn61h8NtOUTDm/Sh9HCgH5uPf+SbqmbOG/EK0yGpN5tVIg2MdO9YY7JtrLOvgnatoL/wd7D4QsylSGG34GTx4m1Qo7AQsdaCpH//4iy7qGRVbAmB6LFhT6KTeHXI5x52tyigbMNaCeie/7N8qcvgoyBSt1nNuELnJFkyb+R6PBWW4lewpXWvV5aiw7s8/+T9IbmOA6J0kAkYdIhPR8S/pAV9uaELV3MR8ATTJjThTMB4cKR+YV8GX3U7UjsnbLZinMhGjopg84Iwt641iMEyBS53dCnmENZB72ZcnrXdK28Nm8zxHnMcNeofjWaegU6OuH4iJ77svGNogg7bcmn+IsByaCmdoHeJ5NFpvm+tOzdP+BJg3YunxbzaDBfpQP7XeMcUnKpQpixS1DA7XVSTmFATbu3C5g3xbtCVPl5eSiZqI45UfcSAp+vBqdy43E=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB16474.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(52116014)(1800799024)(366016)(376014)(22082099003)(18002099003)(56012099006)(11063799006)(10067099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pMeyIV0nkw4goYHO00Wh6lPNMQxhSLpgl4WNfRv4lRTMrUo3Zid6MBXpZ5vD?=
 =?us-ascii?Q?E7hqQkOtr0CJmgSev2ZYjqlhKQzNFRZnmR0WB7awf65SNUGi2ilLWzGpqsMP?=
 =?us-ascii?Q?xlagoLKt54IGPvUObVrlaWF1DkvWx1qxEEcjNrpnpI/PNmNeDKoQF2J84heo?=
 =?us-ascii?Q?jHvr35qvAb/v9ClDflX3PC8WAlZonzD0wSZkcOjlKXTQLwkdk5HA3le3ut4Q?=
 =?us-ascii?Q?DdjgThUFMC4TFqWIePktYmR2kTCz2ayIadXK/p4iSE034SsJqnF8iR2fUQoX?=
 =?us-ascii?Q?8Q5gnFUt/b2G6UcBjJXUufnRrum6rEexAkL1WBkWFcqTnMEQ6VZ5cLR2v7xg?=
 =?us-ascii?Q?Uk1wEly6mHZx5fM220Qb/r79z9j4WU4J59eBP3mVzdTPxJR2WLszEo8Wp1To?=
 =?us-ascii?Q?E+H0kC8MAGZIIPyvoZZP21b5Z9Z8/CITTIVxiQqDixLT9RPkJYEs/EcQkJ9C?=
 =?us-ascii?Q?EwlUdU2/6mDNekz/0w2/7jWT2Se5Cct1jT5LAW2Vv0QsI3sszZh7fKMT0kJz?=
 =?us-ascii?Q?Z1hnhIkmF/+lWJs9Kd6OAmiPyz+v/HVtZGQvcZpftkC3o+TmoToaQCBwkniO?=
 =?us-ascii?Q?1id0GPZc7rpEl7mu/sJvy2BW0ZZS+lpBEIoRF2h+cunGA8nqFLz8AS6EBZqF?=
 =?us-ascii?Q?Z1VOt++2etazjRpOnW+ucfMUn6m2sjDHqrWGyUg997ZJeGve8Fs9jER0yMl/?=
 =?us-ascii?Q?KxaxeERbALU8pNcV1A3MWxk2HLBqZtlDs0GCyurGvaUpsX0Qu2tgMe0YFnoS?=
 =?us-ascii?Q?2P+hbxAbwciLhvFemKCYOOwEnH8DTQh2+IoWlrLvUyIGgvvBq78jbDmZt73S?=
 =?us-ascii?Q?0emQKsEYCLu+CLwIDC7na5FrQczPXzU+hm66evqMrCfxqXNeCXDgVCZBLAf4?=
 =?us-ascii?Q?2bka6g2czmBRGBfLHSC2fzvbBSOEUZwzJaNLvg62hEOQy0C3T7E9MtR/G8SC?=
 =?us-ascii?Q?r9fJHUP8tbNvmzNtkGPqpOrGLj9BYDOjN2jxiszDa/ct9yoRnRFtdpura7Zf?=
 =?us-ascii?Q?/NafSic3kI6eMbPpUm3UMPeV/TjXDnXSM+j4XyfymmMorxuGX3QXVuc+3ME8?=
 =?us-ascii?Q?JBPJJ0kUW8Rr5zc21l0EhKveZi+x2s3aVdL5MLyUr6hBKsWOhBszulvnU7om?=
 =?us-ascii?Q?AnmxcrWu4Vlglfu0hszKeX8qoyllyM6U+r+jyhq6D90U5MvkpOQ/4voDoiwr?=
 =?us-ascii?Q?uvFHSF17iLzrJzFGhSe0TnT1phoxRA3CQW88lMbCY3mYNtPpC4O3YC8wPdGA?=
 =?us-ascii?Q?70H94O/yb5nnIc5bwGz8hjEZjUIqxQLEbtb7V8vcxbuwzSR1Q8aeYI9p1JKz?=
 =?us-ascii?Q?GS52j3suty4UmZVKQ/GLD6aBYN3tMX+K+B1YmKj65pLBcH4CyCBgrEsV+V23?=
 =?us-ascii?Q?k3O6PtItjbmu1xrmjR1Uzc7v9HY6rG/MMUOcqeFvQveh21O7aWVKHXr/gini?=
 =?us-ascii?Q?CnSasnlbCerpkfaKnkZTlYm+DiGeNZf5FYXg4NSeriM1mpC1nhj218OidGF5?=
 =?us-ascii?Q?bbdOCRRIWqKzeNDNSVcYtDU24e5AiOw8qPKWRIxAQudm6rAXPONsI76tuASF?=
 =?us-ascii?Q?oIMsioLod+dEzT3eXcAJ2kr2NWGuw3HtIprQiMjqLBfQEsoT5DwJ4eo+8E5e?=
 =?us-ascii?Q?515zyuGZgwUL3cmhqENuXR9eu41IJJABQC/zUKVvWHfhsLjC+HCW9DE5sxoE?=
 =?us-ascii?Q?RJNogUYXBPQj/B8/ZwRPScgxGxYJb1Z8NWRy/jIdKKV6IOnKJt0OwLFz4UNS?=
 =?us-ascii?Q?yeLqItedTcuDVq+FECEIfrPkj1sM4z+YpzfhsP6XhYqdvazw60Jg?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7331186c-2f77-48cb-56e0-08df071dd6b2
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB16474.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 05:08:04.8756
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1W4whDbeHxifZFYD9NEZtSPMiwHoJir90wz9lGRY25Cbp9WIjjLDOZ5ofFkFoQ8MoISb9BgG29mLO29G9tMjxibcLhHI/Gixu7BOxBfUfYBXfIpweUt5WWEjl25ht07E
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY5PR01MB18382

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/lm49453.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/sound/soc/codecs/lm49453.c b/sound/soc/codecs/lm49453.c
index 6e2e292d143bb..991555bec712a 100644
--- a/sound/soc/codecs/lm49453.c
+++ b/sound/soc/codecs/lm49453.c
@@ -1283,11 +1283,18 @@ static int lm49453_set_bias_level(struct snd_soc_component *component,
 #define LM49453_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE |\
 			 SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S32_LE)
 
+static const u64 lm49453_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B;
+
 static const struct snd_soc_dai_ops lm49453_headset_dai_ops = {
 	.hw_params	= lm49453_hw_params,
 	.set_sysclk	= lm49453_set_dai_sysclk,
 	.set_fmt	= lm49453_set_dai_fmt,
 	.mute_stream	= lm49453_hp_mute,
+	.auto_selectable_formats	= &lm49453_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 	.no_capture_mute = 1,
 };
 
@@ -1296,6 +1303,8 @@ static const struct snd_soc_dai_ops lm49453_speaker_dai_ops = {
 	.set_sysclk	= lm49453_set_dai_sysclk,
 	.set_fmt	= lm49453_set_dai_fmt,
 	.mute_stream	= lm49453_ls_mute,
+	.auto_selectable_formats	= &lm49453_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 	.no_capture_mute = 1,
 };
 
@@ -1304,6 +1313,8 @@ static const struct snd_soc_dai_ops lm49453_haptic_dai_ops = {
 	.set_sysclk	= lm49453_set_dai_sysclk,
 	.set_fmt	= lm49453_set_dai_fmt,
 	.mute_stream	= lm49453_ha_mute,
+	.auto_selectable_formats	= &lm49453_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 	.no_capture_mute = 1,
 };
 
@@ -1312,6 +1323,8 @@ static const struct snd_soc_dai_ops lm49453_ep_dai_ops = {
 	.set_sysclk	= lm49453_set_dai_sysclk,
 	.set_fmt	= lm49453_set_dai_fmt,
 	.mute_stream	= lm49453_ep_mute,
+	.auto_selectable_formats	= &lm49453_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 	.no_capture_mute = 1,
 };
 
@@ -1320,6 +1333,8 @@ static const struct snd_soc_dai_ops lm49453_lineout_dai_ops = {
 	.set_sysclk	= lm49453_set_dai_sysclk,
 	.set_fmt	= lm49453_set_dai_fmt,
 	.mute_stream	= lm49453_lo_mute,
+	.auto_selectable_formats	= &lm49453_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 	.no_capture_mute = 1,
 };
 
-- 
2.53.0

