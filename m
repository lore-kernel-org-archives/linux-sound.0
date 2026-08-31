Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010014.outbound.protection.outlook.com [52.101.229.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67FB12DF128
	for <linux-sound@vger.kernel.org>; Mon, 31 Aug 2026 05:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788152848; cv=fail; b=NFXhF2bO2pq+fDZS22l+cKKYnSA8FN+tkVyqTlrokgQ9+96ByYWD+FQ2zFuk/VD0ErzYTEqeStuujBA7eZptzVXJCB4w+004NKJRUjyKrG1mvYpJMrbC4cPWfV/I6B1qbnFg/7oKG20OjlF24xgMM9qytdg+oJ40i+Dh1yl+ECY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788152848; c=relaxed/simple;
	bh=N8moVPAkZyffDcrze5gTWd5CSlb9afZAbpoZBqmWgSo=;
	h=Message-ID:To:Cc:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=jCCgczb09fR3VfCct6jbaJSKfU7VCGJ1ItK6lXyRcBSy0jy0knlCgsbOI8w9CfiFIV1WuwIPHorNeSqU9sJ2hqCvIFxvWJp0bwHu4UFhdPFXqUmAbQNoIW9O2RJSIeLj8Jl8DxJCPtWztwOQIgpY41rTn/mIQHrYX3fpyH8MuQY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Gbuox/0t; arc=fail smtp.client-ip=52.101.229.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Gbuox/0t"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=joj7KnBUKMPkfqVfGKqRXr99cEndMTLeFUN7CFxacs88ohJnqyVQ67uF+4zLmP+hNPAcfSXHxhmAYqUtIWY4EOhndNxbAlhaPm6IDkhDngyIrEh0U+kHj0wZEz2mzPZyJn26qsZAlhoNEHoEmTDZCVpgSD8TYjSuMe2UMXFVHnqHStaIKQ0/vR4/AENpf5LACs8EkinsnWQpGTimHBZh7DYZn5WpEJCaB2mvD4z3sqcq/xfXspIyqbcONRlMoHxyb48EbHEqc3xiA2b73PPIDsWemNdC7opMaejonPD4qbXMj+TdXjcyDIOB76wEcwdpze/RK5c/lVzIkDlP7lIg/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ddHLq6OUrfOFIjb3li4YbIN3vn7nUDViRFCWhSxd8A0=;
 b=oPJcKv+KKJdFyMWYrpzR3csgJocrKSGROdrSJurUgsuCviYp0kfwpoCQqJcYynYOwJ34geAQ+acuYwnQyWYmbcjH9iI/3SAjQwCs95tBPkmqFsu4+n+7ZmQY5L6orwv9ZpEGwkRU7/L2UiZShITZdAXn3WJC4Oq8DmW+Nddfy4wjyKxWqZbweVFkY5cMLTX/1RMYrAsn9ndNYQAVErhAr0J7/vQBmEVTCu7wYoScrHjL45eHoctQ59gEt818uHA9WM/vf0ntHu1NBD0ggiiNnxRrl0RYoEIE/Ic8RLVagpWccLkfVDLt0seDRLG6KFCIKa8BsEYieWDMwFl4CszS6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ddHLq6OUrfOFIjb3li4YbIN3vn7nUDViRFCWhSxd8A0=;
 b=Gbuox/0tkGhdyX0Z8qkksNyijzJq5uYu1PNiViEHgoaHUW+OFnRSqVpPdHptwaGEi9rmqNEKfJ+TXIzNEUlx4M0+b12LXtyiEW5OuPwyKB1956T9jYtrsHheQmRygyBnUSvvLJ5iaQd37YtiSa8ODA9PIRa6KTz/22lS2e/l+uA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYRPR01MB16474.jpnprd01.prod.outlook.com
 (2603:1096:405:2ee::10) by TYRPR01MB13019.jpnprd01.prod.outlook.com
 (2603:1096:405:1c7::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 05:07:25 +0000
Received: from TYRPR01MB16474.jpnprd01.prod.outlook.com
 ([fe80::2a39:9988:dbe9:894b]) by TYRPR01MB16474.jpnprd01.prod.outlook.com
 ([fe80::2a39:9988:dbe9:894b%6]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 05:07:25 +0000
Message-ID: <87bjaivpwz.wl-kuninori.morimoto.gx@renesas.com>
To: David Rhodes <david.rhodes@cirrus.com>, Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Richard Fitzgerald <rf@opensource.cirrus.com>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 09/39] ASoC: codecs: cs35l*: use .auto_selectable_formats
In-Reply-To: <87o6eivpyd.wl-kuninori.morimoto.gx@renesas.com>
References: <87o6eivpyd.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 31 Aug 2026 05:07:24 +0000
X-ClientProxiedBy: TYWPR01CA0013.jpnprd01.prod.outlook.com
 (2603:1096:400:a9::18) To TYRPR01MB16474.jpnprd01.prod.outlook.com
 (2603:1096:405:2ee::10)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB16474:EE_|TYRPR01MB13019:EE_
X-MS-Office365-Filtering-Correlation-Id: 59827d50-51a9-41bb-2911-08df071dbeb9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|366016|1800799024|376014|23010399003|18002099003|22082099003|56012099006|11063799006|10067099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	yTXCGm5oUu9DyYeKXqfY2xS5uP6GLldVuks4t9ADAz4fP1EFDgrHcrBzt2hb10VPe0stILRKjdNf4GvA/jQ79CU49MfsxA6j43TARkkp1L1YGq4Fxs4iMS4HQewROdGe8lTR85PooQK1pka38a2G6fY/nn1GCm4Mqtk3eDCh21midDKBf9BtXtyVjeqFJCT+JhHyLiM1rt3drH0fM5QxSrI23kUTzRaCI7FMTaZ4WJjiQlAtXYoKpF81PmyMwcJLlbr4PgpZoe4M1Y01ffousmMtOL+/Ih4DCQJACRG6kOTJGxqkcK6ahm39ZRhsbsO4AwqIjp3IoeGBXVvCL8/k1NtkUvT5NuIg4fqZC+qOUcpDr0hN+0V+2fvWNtt1OQh8m/sQARdPTvs7Qj/XX85DQfdhhrv3Oj2NGwGHAkxxg69NSxwBVFdL8P8B11946LTzJIGh7TB4z5m5MizZ9bP35CK6G/0PSiOFEm6Z3kBQjw4i7f3cScHEjUmFmfqyz58TtF3OPEt43Tvxet73ACleFFx6Ts3RsmsrCGrCIqcbzR3o98wRxzwvvto57mXp7uIeA9/EGlhA4rpOksebgRoq4/QI4tIhDnRhdhpP1BbZVnFbx6QhMDlwnSncxIo1J6d8zCAkShsr3h+tVgb6MHEQtyoFYk4jrKA6dELMr2KJq/iIBWG0iYJnASOh2gNxsjrExL18I4Ic4a/whD/j4jkAMfaFsJB/LW/5feE/TJ6oBPA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB16474.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(1800799024)(376014)(23010399003)(18002099003)(22082099003)(56012099006)(11063799006)(10067099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3Hb+tPBHMd+ZHjF4B0CEa7/e0FNnnEc72pc0k2XCNBuJIVlcujHjaBASydjg?=
 =?us-ascii?Q?1NcvyRd4JZs4v1Lo4PKq6zqgEX0F5cWpyEDrBVLfGvKjQEhvdyJAJqJetbVT?=
 =?us-ascii?Q?nRt2ltxWI3nWhXJwsbzwQ8m3LfAfWPXaNt54evjGEJZeNF2sl5SDp0f/9njw?=
 =?us-ascii?Q?RLeZnp7cIViW92jt2h3mWPSC3ifx+0P1aXxwRxyXpJzW0dbG5EiTHI+n6W4J?=
 =?us-ascii?Q?Kd5MksGlGluXHQLbhBboBuhi8WMr/mVhXVLD2tFUdYbc3VfIFfKH9jHyQj9U?=
 =?us-ascii?Q?ccFZ2/9m/rYz0k51NN2Z/1RyKJ7u+FHVEcJ+ZhsJj5kXVqSfNKJZxnWkwAi/?=
 =?us-ascii?Q?P1aZNBWAj2vK4XoLzvF+U7msj5RejOW1mSWgKguc13aohHDYqrZqLv5QsjTD?=
 =?us-ascii?Q?r2gmk7F3CI+rUvLJR4mEqEPxdV6hTYJQX3w+JYvH2ReeUKwo+Ie3Vu9r5gFv?=
 =?us-ascii?Q?+/oOSElR1Jz5JxH9en+Ldcm8G58NZorOIsXT2KOg9vlNIeisCrfRhlRr6T5T?=
 =?us-ascii?Q?PleoShOMXh+nsjfqHltQYtZnfu2XTZnkxerBurdizVj1iNkQBSVJh44jgyww?=
 =?us-ascii?Q?xLCBPcKoZE+Ma4x7JE7owO6B6oMNhk/OGYby7Iz4KBwWxMMipmjg3oqRdXOT?=
 =?us-ascii?Q?y6DS4DAnH9kTH3Mq9c2kyWspeQQgy8Ehnb8n3+GfEEFE69XIsx5RJGwp4YdI?=
 =?us-ascii?Q?1O6UoIhmWFK62OZVFXbygDb+IJIl86IhJchzO5/VemWO5b3ENKavdbNUhpKb?=
 =?us-ascii?Q?60Le6WBOrsccRXD6Lh97AlqsDGZQ53vnOSTlS6AFLbfei4FtyV3iq9LsQm8A?=
 =?us-ascii?Q?iQMlbg2h7MkeDjrXi1J4QmaEZctAL4qBZits5l2cwm6R0rOexQ/LulThVvI5?=
 =?us-ascii?Q?VHNiExxOXd4M/pc0DBlxHx5COflBTX8685KlGg7hnMdu5NWx5yFXhtyO67px?=
 =?us-ascii?Q?KgsdJ9Zhp8oOhBbaE59fdEO4NqixSWKD6+yRlvhwNvi8A9fjoQvdoKX0Yqif?=
 =?us-ascii?Q?czazKDj9vr70vRTyyfOUSxjoGQf8p93yqTpk9wOecaIEG7UaIj8WUaB9wu4T?=
 =?us-ascii?Q?FubgPIW/nAzSTaiPK5Ub0HdAuiwuVbUdnYF69o6NjkH8MAg71Eqbd37FTEjN?=
 =?us-ascii?Q?OTgiRLvxtOohW2SXcjzNu8BCkLajj2d0AYg13uOAn78+/vFg1U0ndlbmOgAO?=
 =?us-ascii?Q?wMuHrCK5opErOUEV2fMz2vq5I7lX3BXYIsJW82vyKLogtl22+jWBCQa/psLZ?=
 =?us-ascii?Q?YpNWU/uzexY9/jW13Wgkb+cVHZuU2HcakA2QhQShsGMIKaPKSmDVY4QTqfQy?=
 =?us-ascii?Q?TFsm24jChMnu0QHSK1UZMsWZ8AtXHhx9FAtepew9M01ZCFxZ7T5ovgQotBbn?=
 =?us-ascii?Q?LiBijhCetVMf9fNe6t+/ctIBq9BWnGsB+5o5cmZr4vMC8dc29l1BPjfXreti?=
 =?us-ascii?Q?UOhtgA4EJQt9LkIOVzI0Em8XVP02PM1E7u2gitEGWp6T1P1Orfe/LxgPxAW1?=
 =?us-ascii?Q?uFjFOnYJG3AWJx+pY96qppTZsXArNYJoE5b2C7GTCASIc9sX3323O5vu0HQK?=
 =?us-ascii?Q?rMGL6hrW8ntKItu5YxxjYt7J4WCZO95Qc3ER5ucx6L2HjcoPsRRcyRKDxK69?=
 =?us-ascii?Q?DZ3AJ0r9kGhqJvprsZvMiduOIu9BJ7Y+1moC5IluP5JE4yxC7l/UU5Tyhbpg?=
 =?us-ascii?Q?tqP89gJgT8t3jiHU8Acu8Bj/xI3JY2hByDhyLPGTN51qMshOblKLePmXQX0e?=
 =?us-ascii?Q?bUwrjzCc+PAcSVLy4qXmINRmFJpog0KN/RABavIQ6sDo0IgDxtOP?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59827d50-51a9-41bb-2911-08df071dbeb9
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB16474.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 05:07:24.9232
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ATpkPd04FA6NmsmKccmAGcHoCC3GbjKM0219TyOm9AlZAp5hvZ1krU7bDnbZWroV9pkxHLJ+X6zWDS7M0PI1GiyzoNydWOpXnr/SoSmP+STh4mrx15teGHOaM7LhRADc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB13019

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/cs35l33.c |  6 ++++++
 sound/soc/codecs/cs35l35.c |  7 +++++++
 sound/soc/codecs/cs35l36.c | 12 ++++++++++++
 sound/soc/codecs/cs35l41.c | 10 ++++++++++
 sound/soc/codecs/cs35l45.c | 10 ++++++++++
 sound/soc/codecs/cs35l56.c | 10 ++++++++++
 6 files changed, 55 insertions(+)

diff --git a/sound/soc/codecs/cs35l33.c b/sound/soc/codecs/cs35l33.c
index e217da124549a..d0f9231f5e442 100644
--- a/sound/soc/codecs/cs35l33.c
+++ b/sound/soc/codecs/cs35l33.c
@@ -663,12 +663,18 @@ static int cs35l33_component_set_sysclk(struct snd_soc_component *component,
 	return 0;
 }
 
+static const u64 cs35l33_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A;
+
 static const struct snd_soc_dai_ops cs35l33_ops = {
 	.startup = cs35l33_pcm_startup,
 	.set_tristate = cs35l33_set_tristate,
 	.set_fmt = cs35l33_set_dai_fmt,
 	.hw_params = cs35l33_pcm_hw_params,
 	.set_tdm_slot = cs35l33_set_tdm_slot,
+	.auto_selectable_formats = &cs35l33_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static struct snd_soc_dai_driver cs35l33_dai = {
diff --git a/sound/soc/codecs/cs35l35.c b/sound/soc/codecs/cs35l35.c
index b2439ec3c19fb..302d838f4c440 100644
--- a/sound/soc/codecs/cs35l35.c
+++ b/sound/soc/codecs/cs35l35.c
@@ -657,17 +657,24 @@ static int cs35l35_dai_set_sysclk(struct snd_soc_dai *dai,
 	return 0;
 }
 
+static const u64 cs35l35_selectable_formats_i2s = SND_SOC_POSSIBLE_DAIFMT_I2S;
+static const u64 cs35l35_selectable_formats_pdm = SND_SOC_POSSIBLE_DAIFMT_PDM;
+
 static const struct snd_soc_dai_ops cs35l35_ops = {
 	.startup = cs35l35_pcm_startup,
 	.set_fmt = cs35l35_set_dai_fmt,
 	.hw_params = cs35l35_hw_params,
 	.set_sysclk = cs35l35_dai_set_sysclk,
+	.auto_selectable_formats = &cs35l35_selectable_formats_i2s,
+	.num_auto_selectable_formats = 1,
 };
 
 static const struct snd_soc_dai_ops cs35l35_pdm_ops = {
 	.startup = cs35l35_pdm_startup,
 	.set_fmt = cs35l35_set_dai_fmt,
 	.hw_params = cs35l35_hw_params,
+	.auto_selectable_formats	= &cs35l35_selectable_formats_pdm,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver cs35l35_dai[] = {
diff --git a/sound/soc/codecs/cs35l36.c b/sound/soc/codecs/cs35l36.c
index 89645327945f1..170588be4dbe3 100644
--- a/sound/soc/codecs/cs35l36.c
+++ b/sound/soc/codecs/cs35l36.c
@@ -947,10 +947,22 @@ static const struct cs35l36_pll_config *cs35l36_get_clk_config(
 	return NULL;
 }
 
+static const u64 cs35l36_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_GATED	|
+	SND_SOC_POSSIBLE_DAIFMT_CONT	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops cs35l36_ops = {
 	.set_fmt = cs35l36_set_dai_fmt,
 	.hw_params = cs35l36_pcm_hw_params,
 	.set_sysclk = cs35l36_dai_set_sysclk,
+	.auto_selectable_formats = &cs35l36_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 #define CS35L36_RATES (		    \
diff --git a/sound/soc/codecs/cs35l41.c b/sound/soc/codecs/cs35l41.c
index b2a076706c796..d286025183f46 100644
--- a/sound/soc/codecs/cs35l41.c
+++ b/sound/soc/codecs/cs35l41.c
@@ -953,11 +953,21 @@ static void cs35l41_component_remove(struct snd_soc_component *component)
 	wm_adsp2_component_remove(&cs35l41->dsp, component);
 }
 
+static const u64 cs35l41_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops cs35l41_ops = {
 	.set_fmt = cs35l41_set_dai_fmt,
 	.hw_params = cs35l41_pcm_hw_params,
 	.set_sysclk = cs35l41_dai_set_sysclk,
 	.set_channel_map = cs35l41_set_channel_map,
+	.auto_selectable_formats = &cs35l41_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 #define CS35L41_RATES (		    \
diff --git a/sound/soc/codecs/cs35l45.c b/sound/soc/codecs/cs35l45.c
index a032bb23b4ac7..25a9eb916fa39 100644
--- a/sound/soc/codecs/cs35l45.c
+++ b/sound/soc/codecs/cs35l45.c
@@ -846,12 +846,22 @@ static int cs35l45_mute_stream(struct snd_soc_dai *dai, int mute, int stream)
 	return 0;
 }
 
+static const u64 cs35l45_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops cs35l45_asp_dai_ops = {
 	.set_fmt = cs35l45_asp_set_fmt,
 	.hw_params = cs35l45_asp_hw_params,
 	.set_tdm_slot = cs35l45_asp_set_tdm_slot,
 	.set_sysclk = cs35l45_asp_set_sysclk,
 	.mute_stream = cs35l45_mute_stream,
+	.auto_selectable_formats	= &cs35l45_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver cs35l45_dai[] = {
diff --git a/sound/soc/codecs/cs35l56.c b/sound/soc/codecs/cs35l56.c
index b9118ad8fab54..62ffb6fb493d0 100644
--- a/sound/soc/codecs/cs35l56.c
+++ b/sound/soc/codecs/cs35l56.c
@@ -604,12 +604,22 @@ static int cs35l56_asp_dai_set_sysclk(struct snd_soc_dai *dai,
 	return 0;
 }
 
+static const u64 cs35l56_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops cs35l56_ops = {
 	.probe = cs35l56_asp_dai_probe,
 	.set_fmt = cs35l56_asp_dai_set_fmt,
 	.set_tdm_slot = cs35l56_asp_dai_set_tdm_slot,
 	.hw_params = cs35l56_asp_dai_hw_params,
 	.set_sysclk = cs35l56_asp_dai_set_sysclk,
+	.auto_selectable_formats = &cs35l56_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static void cs35l56_sdw_dai_shutdown(struct snd_pcm_substream *substream,
-- 
2.53.0

