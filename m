Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011068.outbound.protection.outlook.com [52.101.125.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 342862153FB
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762821176; cv=fail; b=Sy3cL7FG5yFOpM4KxWzwI6GPacb6+G9kIYBqOTuCJHX0MYdvSOGyqMtFhEU6lyjHRO51+YwkODpOSctmVj5+V+JEuaMi2trKqRwLShPks0VS0MO5Oi/abdv2Qn8aouMMYNy3Z1XT3wuC5djNFvhYlpNpDdvLMo36xTQBrwl/jI8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762821176; c=relaxed/simple;
	bh=m2yNHgJNJR2+vuqj/wMaBsJpdWC5V3OvH5g7CFnQlYo=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Sh49cXokgOc7gRRP0KKLTSz5FdGv+pXB0Ck6nP2R5yd/1FtRzRqi4C5ENjmEYHFuyJrlWVBBvdmfBEIGH6K7aOfcB1Azo8luhT8z4ArfQ73cipb3redDnrmn9W/opw1B4yE79ks5K1dAqvu+RwUktOBsK9VKIg7edp52kIJ/8jY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=daCNCw89; arc=fail smtp.client-ip=52.101.125.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="daCNCw89"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M3kCPmRUq3rbmrotmZvJ9D0QxqaZs1LR5VoeM/0Q5dCq6w1dWPWnXhOPv+oZdr0VVHTqofNggZ1GXWJrvEmsbMDfazS9kKfX8Co1mIBkMis07qIvyMrnxBhoZAsHXOs+5aA18ZzBXJ8k51a5npvA+mgrMjrxbGM2/4BrjpPexIhoFnqEKauUayFPA4KxNrClDiI/b/tjhnUv15P2uSWq6ASsKizlDT5Q+rDjKaYBNp73Q6kM6qwi+gvE3aTFcVFvOdsdjKR33FpKnKpZDs7mpkcpLBeO0pqyN7Xj+llDW70EOj+14hTWVHFZqiURH1Fvx+irgZnQMUaDNbpqCQfLqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kvD7yoyx3VMXdCYqLSmkv5Q1o1Sel0TmDD4qNPW+u68=;
 b=OFXzny6t0T7GFiud1ThR3xHVX0uZf6nMr3eV7s20KIc44xUzrpvLbFaDEDbXJeQPobJUTY0eB2J6QiC3w4UlL3E8oRz25el/HqA5I6qqcRgiGaHVoQ9bUnk1OcID3BJMBQi9shYT5CY7RSgNJ7B3+jACYnBpUZd2+AgWsER9QCK3OUKDg3JCydRJ0BzApGpMz51IAl9WPW0kGDx52wZz80yF7LEs9gwLvgTuqFiDkdlurgG/wkyWUgQAZx/hZEwuZz1o7ouTNseDrVjm+T/M/sbnlqFzyMlQmKH0GrNPz99emAJ3rVVy7FALF/pE1ho8yhthNf8q7A1UIrGk4nWjhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kvD7yoyx3VMXdCYqLSmkv5Q1o1Sel0TmDD4qNPW+u68=;
 b=daCNCw89b8rwqos5a3l/ZZP3oIANz/CJblfPz3u4Xzjp8JkBFVGnwlE1qW3XZwu96gOIfUYpDARyG9HfpB/epKFci2M6lfMHO5t3yZJn13DJT4eg+qOFcDjqJPKEpiLl/w1hsWz5nDUz3j7GNzQ2oDM27YEIpf1iGagudcQyyrQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSZPR01MB7149.jpnprd01.prod.outlook.com
 (2603:1096:604:137::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:32:53 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:32:53 +0000
Message-ID: <87ldkdwgqy.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 218/292] ASoC: intel: boards: sof_da7219: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:32:53 +0000
X-ClientProxiedBy: TYCP286CA0314.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38b::18) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSZPR01MB7149:EE_
X-MS-Office365-Filtering-Correlation-Id: bdeb6b6c-06ca-433c-a3ce-08de20b9da2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?dj2h3fa8WcBeCVQZ67IRZ0Gfo5ZjNIzvteflTpO+2xgp0IQ3GwIpD3jMDoli?=
 =?us-ascii?Q?d9DZm3++uzIh5j+5L2sVBDP0scYJJGknHie+TM8lIvQoYmTNLHfFFOmnBD8l?=
 =?us-ascii?Q?cDLtT8Ok3SjQ4MqgTkO/0aGbTxnUYpkiYgSzVVmu1yGKwi1uHfUvAg+MdzHI?=
 =?us-ascii?Q?qo95/gBZTgx4nUPHSzfORsNnqjSoDpBabe9GPjGuQ9cLUBpNfrzNcyCBiCry?=
 =?us-ascii?Q?JPZoq1DoBGqR2fu2/0niqasgA4xsSKx6wDUntZbCxArmJ093mALn8fgmlhnw?=
 =?us-ascii?Q?qIfaXkT/I7SKjr8NFc6WLTNcIvChqjMCK9isXZwVRvbNccSjxLvKNi+CCEUl?=
 =?us-ascii?Q?OfyqUP1fc1nXQHapQE0bKfPfMdTiWRP/jiRJUnz0NNPHVGo4qI9TQkiYCTxh?=
 =?us-ascii?Q?to3Cle+RhcYUC98HZYtFSDnfo3ZPBLjhJxFRpE6cnOf8WyBRQMNRUvzpnAQ8?=
 =?us-ascii?Q?SUNRAkg2esRbe+bRA+JvNlqTM7h6jgVKCuRr4FXPINsjV+UaF2nqKC2BPGOg?=
 =?us-ascii?Q?utcMHhfxpL16QazXQ5xDvZ70LLgzr69dxLqsLBhpdggcgUEM7UX8Q9aFBnkb?=
 =?us-ascii?Q?Il6ChcrOyDLjkavz7EKeNe3m2CNLZyj1pMDnoX0cTxdDnl2EkamLk705c+wh?=
 =?us-ascii?Q?MNHjx4hIDRU/Vfj6STSivQ0Io4es0w8Eb5C5NGv5/UTusekaLMwRp/f8DIQF?=
 =?us-ascii?Q?GOcgkl1N4MY7Zy6h4adpUZ45j84buK/uwpgbpS5DKPUo9N1gMjkVKMosRGbd?=
 =?us-ascii?Q?91ITuQDTe9z6tz1e0HcRLxTB+FtOBEAaFbrR0Iy77DiF91X95esBh+Ew1rrH?=
 =?us-ascii?Q?zuMOo+U6NI9jhX4Nq21gPgq2GwCYE4c11jo0/kFLB3efQi4Qh8z5yw34kGBn?=
 =?us-ascii?Q?9E1kjgb6Wro7+oEAaR2mcX+AqejpEZFfgX14kbJJ6uqsIKCk2Ik/KXXeTssb?=
 =?us-ascii?Q?UBkgPpkdGOIWvMt37VFHsnba8vzkCAVFL0mUtHROV4WpuE4+sMHpMiUuqvJg?=
 =?us-ascii?Q?peuQgFjY9n1XE7mpz5+YWPx6/ITnlr4BuvWD0e4Qn5RbdGHA+kXwXnVu7ea6?=
 =?us-ascii?Q?wA504lR98eyVPwtAPUk4ltkUytEqUpUSgmTjmifloMuuGyxcjtUMmxhvt8qo?=
 =?us-ascii?Q?vTtESfsAcoptgKgHfnmHstadyoX5ypoMHabx9S2+8nDyiCkhQGlHH9NCHAiX?=
 =?us-ascii?Q?GH6cXupuBmeQjFp+nKVUBE7UZeJTVTzCWmJTEYluPLAJ1oH+cLlD23DPzrkH?=
 =?us-ascii?Q?e8nQUc5gDT809t8X/5to3ZOlum6/pHDVBE7sy7EZsIpS/Fcld11B0yB6/dMR?=
 =?us-ascii?Q?+1WIK448s38H5WI3GkA/j1xWaE033zl8XCacKJ54kHZ6jHE22qZ4pQuam1Ai?=
 =?us-ascii?Q?U1T6+hBoz55l0romULWH6rbtMRPdkC2Rflc9UX6zecvBe/9816DivtfWovI+?=
 =?us-ascii?Q?lPGnXVCFJ1jwF07/q4RSNZrqBtrYFV39PFk7zHDGA6yvJ8jdMAwSEBwm3Yof?=
 =?us-ascii?Q?0aBvItOpP4IVb30KjyFMSZwGLcenOGARNaWY?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?TkioxabJROe3aRqIsnRrU0ryToYotnw6F5KfQnCbSbBarwoXePYK7MXpBX7p?=
 =?us-ascii?Q?bo5qkGmnM1Ij0uCmnXtfH7Wq+yNQvA01YHTTjfTjrYyN5n2XKJoix5J0L8pJ?=
 =?us-ascii?Q?SPlNsk4gidzweq6q0rKeZO4VnHDbU716TRfAXiYvLXOB6o0PUi0n1vhlvoax?=
 =?us-ascii?Q?DbPtdfRAmJWEVsnuYCrEjvDJCzX8PSVbFiocLL5vpiteqD55FHxWFC/xBPbg?=
 =?us-ascii?Q?3ytiv04x9dxOeR3cZvxbRQbTf3Dzqu3NEHN6dSHJ7dLrP7Dp4EQcQmNRr4oc?=
 =?us-ascii?Q?mtKJiTGvfVTbL0GENOEjc6a4G9RXaczTsurE1hubiqxgFZHunzHBYrYk9akj?=
 =?us-ascii?Q?U66vSHyHW3iPnq2aJJ117SJwC7/sQs28G3IIo7dBnORNZmk3pccr3b85M5WK?=
 =?us-ascii?Q?XzVFdsFEnuFlFZsEjzQey7wV5CCu8So0ZYoUxnO3neBH4buAclnhfAVUAP34?=
 =?us-ascii?Q?3ImGMX/2nAMrOP/oAaO9HFTKN42AfX8RDC9B0TOy1qlmlMU8/iXc/QrRz1dI?=
 =?us-ascii?Q?MSzh48GsimBtNfgFIF0EGtsNeJBlppzqUy/5KU0Q83gwRbD3XdBo7DInwqPy?=
 =?us-ascii?Q?XIO3qojdEzwtfeeG1IujZJpNAaEc8JqEK1XWqgUwzAXPg4Y9/d9Tc86Clla+?=
 =?us-ascii?Q?D2izKfqj7assXfO4U9/Ab1YL1WeHB4cQ98KRaS3cXQczCqMVt75U3hHZ1CQA?=
 =?us-ascii?Q?2JixMxioPf9sleTkmvyn285eaGjT4rAEWBEcCWZ+ndyWo28J8cpzGn7S4zN6?=
 =?us-ascii?Q?ZSCEOsrJ27P7vymJiR3R3dp6lDV1pmmdWNZ1PTWnffKIcot5fY21T5R6RlHA?=
 =?us-ascii?Q?jaO+T/cHxY+YkAP4w7+pivsq8P94YBLHuZL/H6cnJG4dAAjWCiSfMTCoOzUI?=
 =?us-ascii?Q?A01FumouPELwnSlq03PxCAhjicTLlzY5H72BVsK8iZbk/J5F+3r56Idvx5w7?=
 =?us-ascii?Q?1BSD1nXuFrwL3b85AkMKwuQDk+HfKaZltsx6B4PS0vyh1mA3WlqXEU5i6cUN?=
 =?us-ascii?Q?+ym2oJhIg/DUE0pVYFJF4C24pMW4Mxz6b05HHjJo1wxSWoOszbVoyjqm+uec?=
 =?us-ascii?Q?iONjSc/swgCqsTlkdrIlNkl/2TGZgzeju3O0g9QxmzkJLwJ8FDuay71cy9KZ?=
 =?us-ascii?Q?TnOc0BuV+k8ISRqjG6hYtR+lNOyf6SBT0wGJS4+Aca2wtoRpfBhmPcxHQj1P?=
 =?us-ascii?Q?8fAgbjyT8Nr67qfLLI7Dpuz+ENsLDb7EdbmhA9fd61oBLzcWJGAIRNn6qHIR?=
 =?us-ascii?Q?sBo7R3OsJdRq81BJ5rZJ2tnF1X6rd7gf7cGukPiOc5FAeJd9SRKqQzLuW9pJ?=
 =?us-ascii?Q?+Ze55R4LNFKdQLa+JY6+IK+nDf4tpsvzgpljobJwaoHPNBSmLgyswKiaDb0b?=
 =?us-ascii?Q?iEF+2EpNcq8fVfbhAFR3t/kNoW7sW0xbvt2wxCajDywpr5dr/SiRhdcegpTE?=
 =?us-ascii?Q?EfVHwmwoJt0PXfVXSHYW2R+PR3Hs0kHMTLaAco8e/ANpnyAgHnQXr5nix93d?=
 =?us-ascii?Q?qL81hBJieW901J/StDKjIq+8NuIUF3jvaRd8bGwLgv7poKxC2jxSXncwLLyI?=
 =?us-ascii?Q?kgbeqS2TbeT6jF0f4po7scxSksR7KkDC2VUffTN1VDjw8aWf91xiWVxUyoSG?=
 =?us-ascii?Q?d1ACMa8syfUsphctVrkAGPo=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bdeb6b6c-06ca-433c-a3ce-08de20b9da2f
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:32:53.5900
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gsoZUgJt9DKmLKSSbNFMiXZWqWx6xZaPKQBWQqPHicQGn0eADH2nA7hCISCrwJ3LlQNGC+ag/lpHUZYbvRJi+tRJP+YDUCLWLYKHNiFdrS/s/Opx6bfPaglERF5V5+ME
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB7149

This patch converts below functions.

dapm->dev					-> snd_soc_dapm_to_dev()
dapm->card					-> snd_soc_dapm_to_card()
dapm->component					-> snd_soc_dapm_to_component()

dapm_kcontrol_get_value()			-> snd_soc_dapm_kcontrol_get_value()

snd_soc_component_enable_pin()			-> snd_soc_dapm_enable_pin()
snd_soc_component_enable_pin_unlocked()		-> snd_soc_dapm_enable_pin_unlocked()
snd_soc_component_disable_pin()			-> snd_soc_dapm_disable_pin()
snd_soc_component_disable_pin_unlocked()	-> snd_soc_dapm_disable_pin_unlocked()
snd_soc_component_nc_pin()			-> snd_soc_dapm_nc_pin()
snd_soc_component_nc_pin_unlocked()		-> snd_soc_dapm_nc_pin_unlocked()
snd_soc_component_get_pin_status()		-> snd_soc_dapm_get_pin_status()
snd_soc_component_force_enable_pin()		-> snd_soc_dapm_force_enable_pin()
snd_soc_component_force_enable_pin_unlocked()	-> snd_soc_dapm_force_enable_pin_unlocked()
snd_soc_component_force_bias_level()		-> snd_soc_dapm_force_bias_level()
snd_soc_component_get_bias_level()		-> snd_soc_dapm_get_bias_level()
snd_soc_component_init_bias_level()		-> snd_soc_dapm_init_bias_level()
snd_soc_component_get_dapm()			-> snd_soc_component_to_dapm()

snd_soc_dapm_kcontrol_component()		-> snd_soc_dapm_kcontrol_to_component()
snd_soc_dapm_kcontrol_widget()			-> snd_soc_dapm_kcontrol_to_widget()
snd_soc_dapm_kcontrol_dapm()			-> snd_soc_dapm_kcontrol_to_dapm()
snd_soc_dapm_np_pin()				-> snd_soc_dapm_disable_pin()

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/intel/boards/sof_da7219.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/sound/soc/intel/boards/sof_da7219.c b/sound/soc/intel/boards/sof_da7219.c
index 9b7082b239c16..ad845d32f6425 100644
--- a/sound/soc/intel/boards/sof_da7219.c
+++ b/sound/soc/intel/boards/sof_da7219.c
@@ -29,8 +29,7 @@
 static int platform_clock_control(struct snd_soc_dapm_widget *w,
 				  struct snd_kcontrol *k, int  event)
 {
-	struct snd_soc_dapm_context *dapm = w->dapm;
-	struct snd_soc_card *card = dapm->card;
+	struct snd_soc_card *card = snd_soc_dapm_to_card(w->dapm);
 	struct sof_card_private *ctx = snd_soc_card_get_drvdata(card);
 	struct snd_soc_dai *codec_dai;
 	int ret = 0;
@@ -181,7 +180,7 @@ static void da7219_codec_exit(struct snd_soc_pcm_runtime *rtd)
 static int card_late_probe(struct snd_soc_card *card)
 {
 	struct sof_card_private *ctx = snd_soc_card_get_drvdata(card);
-	struct snd_soc_dapm_context *dapm = &card->dapm;
+	struct snd_soc_dapm_context *dapm = snd_soc_card_to_dapm(card);
 	int err;
 
 	if (ctx->amp_type == CODEC_MAX98373) {
-- 
2.43.0

