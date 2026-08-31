Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010006.outbound.protection.outlook.com [52.101.228.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60A863C4555
	for <linux-sound@vger.kernel.org>; Mon, 31 Aug 2026 05:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788152908; cv=fail; b=scpbEc9+YK0K9HnCKKNmlTSrD4IFEOmpcLwI9BsGdGQvv4QoldL/zsIZYWhvTMsVAdf3UC54ENAsodw5tkkUm8QULD+ARL+8PU3qoO3eUSUBU9veGraCFqdBA5guSDv/+gIGgXeFPq7LGWN7Osxfn0+IAz4fpH8d3grrTUPS08Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788152908; c=relaxed/simple;
	bh=V3i1IFBnDRufSNFFZn0m7JcchwbQGAo8X4fxxFlhMR4=;
	h=Message-ID:To:Cc:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Cl6OuLfjL6azTXm3Xr+nJQLOE4+YIEBXdF7FWA4Tv71Zc+LYqZTor/zZgmVDdG9KnyzyKf0Od9oTLbVieqAhSFm2/xRuyMzMa9tUkoBkXyRBxyw3xWdotTHfo0rGSAhVhT4DTi8SRHMhIZipqX8ZElFinoyWghudY2nCLGdIfxI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=L84/zGSp; arc=fail smtp.client-ip=52.101.228.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="L84/zGSp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A15zRcqtBEH/G2iEgbTvv7FnWoDUctra7CiHiBVwBABrCL5jtZXCwsC9fh0t+UZONP4LPt3T8gR1bIpTLTcHnS+YjYGbZ2J/Vc5t5uw7LBBI/d0/CVnue99dRcwkrG3h+SXZGE2IGHd5dGufRcwpe+KYvGLfawp19xfOp2fl0vZM4IqsOQ6RceiJ+4hKQttZaCCI5EG6M0dtpgLfeuTpm6h3/mRo9A0RuJ/O7ggEohQi6LrIgqr1VSzIBffXb/vzBEoLjlW/H4yGPcSiSzXGcjFJeiBlx/I45JTRo8YljeQYfebg1hdKCXpdpf3CarQLRz1TwACh+xj4ctbgFxK3RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uKIdWIpVKi9oLn+9cjgJ1IjPA7d0MXGIcRDQA25sOWY=;
 b=ZvMCuW5meXyu8MT8B5iiqtKDszBrtHjzOCNfQbww5frzAAkfe3Ilx0ULr1o9V7E5hiH8ulWehOpRCR1tVqfn2OMyc0b5lvq4YFFucgEyVDsgj7lJsVx5W/+Hx26vwNf64vowNKqlcqfU36pBEagj6gtljo9ivM8ddcWEVQsufBXlxutp1NKFGd5Va+qsIrDaIPggPhsUBhYkKyg2vWDT+P70FigEGlLlO9JsVEILKscWxHSIbQ2PTWK+9NTMGmHJIhHaNCqVB5jSTSPwVpFRv1DbV1kOtjPHbmDfi45cHJ9MXKZXAG1WH0uQp5IKN74N5L2NLwPUe5x5y2PwIK7W3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uKIdWIpVKi9oLn+9cjgJ1IjPA7d0MXGIcRDQA25sOWY=;
 b=L84/zGSpVCkLDaC6EWPxYmL8c9mdObnB6scohkpkUQ7qzrwPNmsS8+HLhzlKJbAwJnmpEciSZIXmwJDz6YftRHz44PZspvuneVsvWrb94ojbAw3t9jthplTq5+Md7FGvut0YJlaAT/8Yzcpqjd2FR6GnNFMw9f94CTlokWwqOsQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYRPR01MB16474.jpnprd01.prod.outlook.com
 (2603:1096:405:2ee::10) by TY5PR01MB18382.jpnprd01.prod.outlook.com
 (2603:1096:405:3e5::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 05:08:24 +0000
Received: from TYRPR01MB16474.jpnprd01.prod.outlook.com
 ([fe80::2a39:9988:dbe9:894b]) by TYRPR01MB16474.jpnprd01.prod.outlook.com
 ([fe80::2a39:9988:dbe9:894b%6]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 05:08:24 +0000
Message-ID: <87tsoaubaw.wl-kuninori.morimoto.gx@renesas.com>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, Jaroslav Kysela
 <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
 <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>, =?ISO-8859-1?Q?=22Uw?=
 =?ISO-8859-1?Q?e_Kleine-K=F6nig_=28The_Capable_Hub=29=22?=
 <u.kleine-koenig@baylibre.com>
Cc: linux-sound@vger.kernel.org,
 "Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= (The Capable Hub)" <u.kleine-koenig@baylibre.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 21/39] ASoC: codecs: nau*: use .auto_selectable_formats
In-Reply-To: <87o6eivpyd.wl-kuninori.morimoto.gx@renesas.com>
References: <87o6eivpyd.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 31 Aug 2026 05:08:24 +0000
X-ClientProxiedBy: TY6PR01CA0033.jpnprd01.prod.outlook.com
 (2603:1096:405:3bd::14) To TYRPR01MB16474.jpnprd01.prod.outlook.com
 (2603:1096:405:2ee::10)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB16474:EE_|TY5PR01MB18382:EE_
X-MS-Office365-Filtering-Correlation-Id: a7bfd5b7-f45e-479d-bf77-08df071de243
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|52116014|1800799024|366016|376014|22082099003|18002099003|56012099006|6133799003|11063799006|10067099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	dqYrg4w2APzO/FFz+30SD0yNF5/sr3MPJh7OeIoXF2+xU2+CkTaDNdHnH77R4v3mZZERW1gSVXPs4FLIhtpe6ia9OwBy0JKbCkDYzpjxWCBKQigDa9nLpjY/mibefE7qyaL5lXeTkUR5/vi74ZvBmi3cr/jBWW5AYBkUZaXqWEK7bDMIJeycC2ZaqjyFAbMNzm7mb7dpwrcMlHSsZgtU8LAByDJ8ufOkmvhmHmxBae+mDXICj5BsaM8kW1TgTFE4Nj96B5A9XUf2tUCGj8ga5HcPwtMyIRGaeLFV/ibEzNKML8MLZqLyl3rRz/K/ETQvdx4G8/HnDQm6eMRPpD7sQVDXszhmqLyfgibJpI0DeuTRNscA71pxThs6GfRYGcmlR6D3kqe15V/TpJPI65gW13RJtjOpjLiASUVVPe7jp34u8wTtcWxDydwuAoSHVZuqcTv4QiiZzmaxl1AlPthUNWKG8svAyp6Gq6KXzhhd8Vvl6qSm3VOvfYDv+uxAGVgsk/PY1+raTKCMZcTkzPL993kEz0tgKeUhuw1p9epyDpFO2hguhNBG2iOS61CCj/T5G+cjRxdeuFmJRMY8MfNgFPTooxAwNEMFpxPCMC7NCFp+oHXndC5pJzpF8YwTEV1wQPRmuDmGLWgI71qxsBdZ5xUr6V0lN735RfOxT5omg9W+REMGv9I/ywU/B+uIDzHn0uHA5qHzu85T8tWC0Zd1e0dvROQJTF1ZhMdUe5IdD+0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB16474.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(52116014)(1800799024)(366016)(376014)(22082099003)(18002099003)(56012099006)(6133799003)(11063799006)(10067099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MdmoMiPtCHIXeL1FDFjUj30dr5/2Bc5xMOzOsnTMcZs607fTe90OBR9/DusH?=
 =?us-ascii?Q?rZmoUjMrN/AOlUptPLBADt7lOB/2PcNYxYMJYo3Flb03nCIGxaQAqIbTDAcA?=
 =?us-ascii?Q?emf0c3f3nhbUCS6+NRwY2TAbua8qhUbFZLEcJfUnljUBd5d8eUYUEZCU0q5V?=
 =?us-ascii?Q?6SVlvLuXBGpL9XOto0d9ACA55GxUIuOUwbQeae5OTzbcgFvU/iwyd7tRtcNp?=
 =?us-ascii?Q?oGLqEIfpP6YVwmzDpaH8bPdWF1p6DY6HHn2Oon0aIybK6BgtXbT9OCnkV99J?=
 =?us-ascii?Q?L/Vw8A8uH9O608eR3q6Zi5OVft0iHyNCA/hTXSB6tc7GWIkyCmUZqj5UKv3w?=
 =?us-ascii?Q?luBrYpb+3T6oClWmeUBmmF79m3NPrfvnE6HhPgGWcTTh/l0x8A5/oEiFCJvD?=
 =?us-ascii?Q?EyvWCrCvu8WkCRJqChV99MJLueHh1JdyLctN8MIQYLRMXmmysSszLnauyG5E?=
 =?us-ascii?Q?2lLrI9mv4KmwXwPSwzSVU8cKz5U0oLJrcZaIYbJwdfwGXxZJlQg6ztlCvM9c?=
 =?us-ascii?Q?7ds3+p3Tpgo8p9JJc9v9L5NUU81/iLNt/yp8JfDkwRw1V9963OkSaV0mcW+B?=
 =?us-ascii?Q?miUVTnH2ix5krnCrfEZy5OTE0pvSlfb8Pwh5Trz5hyVrtE6kRmGBQRJLmd9h?=
 =?us-ascii?Q?HFSvhMcuJvsdZbeJgNE8yUBH7JGPv8q+5f/Ra/Uh1luzfppyoN3zJc/5lG6y?=
 =?us-ascii?Q?sKuulAmf9qaTMw2b85/rL4CElgp7OLuGCBm7S2Pxy7LlbGWt3uGE7b8HJ09B?=
 =?us-ascii?Q?DwoVc8/3F0DAshAppmQuS4FFD2wf6gFta8xsGt2vtWbD6W4r6s1TYsslyHsD?=
 =?us-ascii?Q?l8kCdLnBgtNs5UcFP6XTAGujy1/YAw6jfhv4u5mu4bHuGsNEQ5Q8f1CAVWDl?=
 =?us-ascii?Q?U4KtUQodOzgD21GCxhXDU3/8N4jrWcGu9uQke51zdetIqPLKA79N2EAxTU3L?=
 =?us-ascii?Q?UKFRYt2F9a9BdFxSJiMtoWKaCGdMj3iMj3rt5CPv5ebIf4K/ILhSE1+1S68T?=
 =?us-ascii?Q?swgGP3ztXrB55M4wu8JFNssnx6OwioiEVwLlFvol1kmCL167gh6VoTFe9RGY?=
 =?us-ascii?Q?+gzacmjs5Aer+L+I6Y0i8MwL4a5PEAM6t7g/id8N+osbUnC7LqCGHK/cqLXa?=
 =?us-ascii?Q?6NdL4zLodI5Ms0NEUWkaiK3NqBYl5kdd3vZuijwYchfGJbSbk1tHYiwuXXK5?=
 =?us-ascii?Q?m8nsMfqwSTpPhL+NA1x8PPkpvh+GGh7tOfttPwi2VScTwcXWDkFciY8aqXsl?=
 =?us-ascii?Q?4EsPPnlLdfAgt3P03zQmChdx+sjJ/DoBBrB89/adWggeEjvDKTfNodPhpuL5?=
 =?us-ascii?Q?aFj4A0b0dlsY3QsCUjYcoy91NLn4n07z033M6jEbmR87PEHNj2/X+1WliSyU?=
 =?us-ascii?Q?qy9lbvB7cC3YIxrEIk93JdJbfYMNhTAtQwH1BgG3ljVwaAZVnoijdY/uys7k?=
 =?us-ascii?Q?szP8Y6NkFZ8sBk4FKWkjqnvG5EYFTmKgaqYn7SZft/sui3vLvsPp+lpn2o2z?=
 =?us-ascii?Q?yNxf7t/oJDzynDkpeQHJ5yT/K7UOTgW5VH8WNkD0xqTHl9HUm1ZFbDa0c1hc?=
 =?us-ascii?Q?nciUBXCSAae/tHXhSdAcfZM02GUwhZ+Eo/z4pQCv4SYwJxoOtveYymIcfwuY?=
 =?us-ascii?Q?qYZk6dkgruDi63Gf0GNr/7OQYdoS71/RkAXAc9+GdescQpv+imwN8gh3qv7Z?=
 =?us-ascii?Q?P8D2HgT9ECB9gVJoMVhjZz89YqpBoNRy3E68JvLjXMl5ZO7E3SqLJ0ftGVW7?=
 =?us-ascii?Q?yAOr7JUrku3Gc+17K1C7bVpQ98yWhGmxEoBzzXRcbfWass/vJJps?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7bfd5b7-f45e-479d-bf77-08df071de243
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB16474.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 05:08:24.2845
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2WCxHoiWdia0PrpPVwl6M7mPbgsX4O4QIMrynyFiKyE4MX3hZgIQl9lxHDhHpOfVsxiTi7QwWsxL5C6Bed0Tfroki9xohyupslCgC/R09O42D3GM6KxryITXD+po2WeE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY5PR01MB18382

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/nau8325.c | 11 +++++++++++
 sound/soc/codecs/nau8540.c | 11 +++++++++++
 sound/soc/codecs/nau8810.c | 12 ++++++++++++
 sound/soc/codecs/nau8821.c | 11 +++++++++++
 sound/soc/codecs/nau8822.c | 12 ++++++++++++
 sound/soc/codecs/nau8824.c | 11 +++++++++++
 sound/soc/codecs/nau8825.c | 11 +++++++++++
 7 files changed, 79 insertions(+)

diff --git a/sound/soc/codecs/nau8325.c b/sound/soc/codecs/nau8325.c
index 236d94c29c249..2c95ed00a681f 100644
--- a/sound/soc/codecs/nau8325.c
+++ b/sound/soc/codecs/nau8325.c
@@ -628,10 +628,21 @@ static const struct snd_soc_component_driver nau8325_component_driver = {
 	.num_dapm_routes = ARRAY_SIZE(nau8325_dapm_routes),
 };
 
+static const u64 nau8325_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF;
+
 static const struct snd_soc_dai_ops nau8325_dai_ops = {
 	.startup = nau8325_dai_startup,
 	.hw_params = nau8325_hw_params,
 	.set_fmt = nau8325_set_fmt,
+	.auto_selectable_formats = &nau8325_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 #define NAU8325_RATES SNDRV_PCM_RATE_8000_96000
diff --git a/sound/soc/codecs/nau8540.c b/sound/soc/codecs/nau8540.c
index fefbd5722c004..a939f4b7bb250 100644
--- a/sound/soc/codecs/nau8540.c
+++ b/sound/soc/codecs/nau8540.c
@@ -623,12 +623,23 @@ static int nau8540_dai_trigger(struct snd_pcm_substream *substream,
 	return ret;
 }
 
+static const u64 nau8540_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF;
+
 static const struct snd_soc_dai_ops nau8540_dai_ops = {
 	.startup = nau8540_dai_startup,
 	.hw_params = nau8540_hw_params,
 	.set_fmt = nau8540_set_fmt,
 	.set_tdm_slot = nau8540_set_tdm_slot,
 	.trigger = nau8540_dai_trigger,
+	.auto_selectable_formats = &nau8540_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 #define NAU8540_RATES SNDRV_PCM_RATE_8000_48000
diff --git a/sound/soc/codecs/nau8810.c b/sound/soc/codecs/nau8810.c
index a050387dd485f..eb3e93380678c 100644
--- a/sound/soc/codecs/nau8810.c
+++ b/sound/soc/codecs/nau8810.c
@@ -817,11 +817,23 @@ static int nau8810_set_bias_level(struct snd_soc_component *component,
 #define NAU8810_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE | \
 	SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S32_LE)
 
+static const u64 nau8810_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops nau8810_ops = {
 	.hw_params = nau8810_pcm_hw_params,
 	.set_fmt = nau8810_set_dai_fmt,
 	.set_sysclk = nau8810_set_sysclk,
 	.set_pll = nau8810_set_pll,
+	.auto_selectable_formats = &nau8810_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static struct snd_soc_dai_driver nau8810_dai = {
diff --git a/sound/soc/codecs/nau8821.c b/sound/soc/codecs/nau8821.c
index c45c5b864ea4b..ecadbaee10379 100644
--- a/sound/soc/codecs/nau8821.c
+++ b/sound/soc/codecs/nau8821.c
@@ -981,11 +981,22 @@ static int nau8821_digital_mute(struct snd_soc_dai *dai, int mute,
 		NAU8821_R31_MUTE_CTRL, NAU8821_DAC_SOFT_MUTE, val);
 }
 
+static const u64 nau8821_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF;
+
 static const struct snd_soc_dai_ops nau8821_dai_ops = {
 	.startup = nau8821_dai_startup,
 	.hw_params = nau8821_hw_params,
 	.set_fmt = nau8821_set_dai_fmt,
 	.mute_stream = nau8821_digital_mute,
+	.auto_selectable_formats = &nau8821_selectable_formats,
+	.num_auto_selectable_formats = 1,
 	.no_capture_mute = 1,
 };
 
diff --git a/sound/soc/codecs/nau8822.c b/sound/soc/codecs/nau8822.c
index 830164e991a79..20913d9f7be97 100644
--- a/sound/soc/codecs/nau8822.c
+++ b/sound/soc/codecs/nau8822.c
@@ -1026,12 +1026,24 @@ static int nau8822_set_bias_level(struct snd_soc_component *component,
 #define NAU8822_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE | \
 	SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S32_LE)
 
+static const u64 nau8822_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops nau8822_dai_ops = {
 	.hw_params	= nau8822_hw_params,
 	.mute_stream	= nau8822_mute,
 	.set_fmt	= nau8822_set_dai_fmt,
 	.set_sysclk	= nau8822_set_dai_sysclk,
 	.set_pll	= nau8822_set_pll,
+	.auto_selectable_formats	= &nau8822_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 	.no_capture_mute = 1,
 };
 
diff --git a/sound/soc/codecs/nau8824.c b/sound/soc/codecs/nau8824.c
index 426a488ff2a34..853eb9472af92 100644
--- a/sound/soc/codecs/nau8824.c
+++ b/sound/soc/codecs/nau8824.c
@@ -1580,11 +1580,22 @@ static const struct snd_soc_component_driver nau8824_component_driver = {
 	.endianness		= 1,
 };
 
+static const u64 nau8824_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF;
+
 static const struct snd_soc_dai_ops nau8824_dai_ops = {
 	.startup = nau8824_dai_startup,
 	.hw_params = nau8824_hw_params,
 	.set_fmt = nau8824_set_fmt,
 	.set_tdm_slot = nau8824_set_tdm_slot,
+	.auto_selectable_formats = &nau8824_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 #define NAU8824_RATES SNDRV_PCM_RATE_8000_192000
diff --git a/sound/soc/codecs/nau8825.c b/sound/soc/codecs/nau8825.c
index ae83b778bf935..5165aeba4b675 100644
--- a/sound/soc/codecs/nau8825.c
+++ b/sound/soc/codecs/nau8825.c
@@ -1507,11 +1507,22 @@ static int nau8825_set_tdm_slot(struct snd_soc_dai *dai, unsigned int tx_mask,
 	return 0;
 }
 
+static const u64 nau8825_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF;
+
 static const struct snd_soc_dai_ops nau8825_dai_ops = {
 	.startup	= nau8825_dai_startup,
 	.hw_params	= nau8825_hw_params,
 	.set_fmt	= nau8825_set_dai_fmt,
 	.set_tdm_slot	= nau8825_set_tdm_slot,
+	.auto_selectable_formats	= &nau8825_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 #define NAU8825_RATES	SNDRV_PCM_RATE_8000_192000
-- 
2.53.0

