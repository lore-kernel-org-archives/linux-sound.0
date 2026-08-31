Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011061.outbound.protection.outlook.com [40.107.74.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60C8C3C4555
	for <linux-sound@vger.kernel.org>; Mon, 31 Aug 2026 05:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788152965; cv=fail; b=Pu0cwfoewJVBFypgoQIJduu3o4UG1ouys9SeB9lBazBQVdP7ofjT62nLBbPVOBsxzOpP5pQzc/wSrMLZ32qzS+uv4/9ryIdG6KjsusgNYbu0HR1EfK/5Vf/HAALauECQXZdbRPdECOgOakyUpFN3iHCX2INYMFZsA0DTiaYQR1M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788152965; c=relaxed/simple;
	bh=xwUki7q0CJMRhbukk2QarkGoiooFlp7jO9Log8x7qZY=;
	h=Message-ID:To:Cc:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=XxCaHfSXKDP0crrWJMd0QBy4ISn4OMf+aSZkZJOudLxKy834KMlAAcDyIU/zUBSob1oa3ljUX89VFIG9CfkKaZPdp9nSrz7soA2T2RJCXl3NMqmzYb9khRgC+x+G85WbQY7kwtKKfSbvqhwrPeIOvi0ZQ/5Nr7WTrtsrcv1ySB8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Q7X75B7S; arc=fail smtp.client-ip=40.107.74.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Q7X75B7S"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZZLJsAObyjWUHVSyX0n64nIVv934C+YKAKdYANlnHshM+sMz8w1LuQwImq5KFXH1PUybwoNB/EiogodcVOYaW3ZtBvO1JnYrg4X65e8GTCpWzBHJe1tvqo0BgSxrem00Cs3pj8Henw/+WzfgSp/fGckyrQlZnWP9MCU/y4lo5lDr2B8J9CbrOU+dLbpNHhDf7BwtFqEiVRe0lzK8wkQQ7w70K09L/kc3NgCb2bMYW6fNuSBzW/CIf9nsP1GWuoQFL9YXIFjwp7TxxxY0kpa6h+zTPGFbnUqS8qnXotO22jl678le1yHc8aPjSRowkx7PlKsNVuUMOOrDeBHq1hxp2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SypYu/CYd9ozTpWLISOOV8ylhFrMbqx/eVAp0ol8418=;
 b=MtP/KcIVrjz6FoUlZD4VrflPlt/Y/QcYiCYZ6txtBkqf6LOgkfK2WszNKlTyc5s/ZOKVJOjqWSIO7Agw3VADFKHEJJg5gUTX18qIhS8xghtZWvsYCU2sok17By7AD1qveMBDcSN8oLqn4L7x+6BUfJon7jQm4U6N1ph7zLSZc+oS9Ag3kFK9PGgRvMXtbnMUT4Eio5k7kLRlYnPLm34Azwtap6RMP684Gd2HK7eWkyJi4raFYQWQ+ZcIcsIq0qEcGdBDXARTd/enRdrhuP5OiCnL0SSbyUhY4J9XAIIzaQQb/mPwJgIOPALPfdnWgguC2vOtUHy68FXW/yc8FLyjYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SypYu/CYd9ozTpWLISOOV8ylhFrMbqx/eVAp0ol8418=;
 b=Q7X75B7S9ZolqDi3AyjtICjM/FFJJ2tX7tpDLp07DsJ/zq1LuMyO+Oar5ET4Sqx9bLiwuYtqQC010eQrHF/UpBMTKVSDUAnbwoTHTnXmSAfp2gS2kqFhKs8TdyjWpDd0V0yEAgrLMvKIh/+iH8CzHZxIGpXMDgz5ZXsDLkbbpcs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYRPR01MB16474.jpnprd01.prod.outlook.com
 (2603:1096:405:2ee::10) by TYYPR01MB12794.jpnprd01.prod.outlook.com
 (2603:1096:405:15c::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 05:09:21 +0000
Received: from TYRPR01MB16474.jpnprd01.prod.outlook.com
 ([fe80::2a39:9988:dbe9:894b]) by TYRPR01MB16474.jpnprd01.prod.outlook.com
 ([fe80::2a39:9988:dbe9:894b%6]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 05:09:21 +0000
Message-ID: <87a4q2ub9b.wl-kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Steven Eckhoff <steven.eckhoff.opensource@gmail.com>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 35/39] ASoC: codecs: tscs454: use .auto_selectable_formats
In-Reply-To: <87o6eivpyd.wl-kuninori.morimoto.gx@renesas.com>
References: <87o6eivpyd.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 31 Aug 2026 05:09:20 +0000
X-ClientProxiedBy: TY4P286CA0103.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:380::13) To TYRPR01MB16474.jpnprd01.prod.outlook.com
 (2603:1096:405:2ee::10)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB16474:EE_|TYYPR01MB12794:EE_
X-MS-Office365-Filtering-Correlation-Id: 8674a8a0-fb08-4e41-9d92-08df071e0429
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|52116014|376014|10067099003|22082099003|56012099006|11063799006|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	fAQ/27FP4O7IEHXDgV+pa+8DxARjzfol7ndnxkKGM1A5F/S+II78r6+h3p9ln22iMvJ5a/WlNZ2KY6jGGsi8pbvTxSEIK9zAG2Sbzn15VyMeF/5spQdY57JtgoXraSFzyd51uaXKM6xgr/PBe/ESzaSxsi1DHJuwlRy4OSOmJ/QU8zkr5jW5CBydI2g49TchDFNDEf/56R1Ip/ioTDYalX2rwB3+qvdJeIbnil69Ze7IunuZIIyikT2TiNI3JJ1IJvAT93eEUeU960qmxdbSQ3e4IYzbeOihLWyMAp6DZFDZjyvAAhFpLkL2OOfpiC7cUGC5HJh0Iz+sLBsC13aojAhNjkPtjoZ9H1U1BITOwfZwECh3aQiGp6zRjv1FTu0a8TgkeKH1oYmpe2qmjTprNq9wdh/a4tCN5EOWa7kUOw0P3frTA48AUAPTWviLm0k9yfl6a7bR07im31xZ1MIV3us0lLM9KzqUYAl249x/Tg3L7+tmP6YOcxmbVkPkWel4msUbXxQ6rq59xBuLjgfMf7He8OWJ+PzCInjSaVoFGRK1k51kDgPMYDQkpzt1smUuaENtka7hV0X+QwyIa97w9pYjoSfB+1EEXqoO+DBO8r4MLIoFbHCwzRCzyA/4Gz5KQEOw+h4mDNHDkrJXDSh3t7RuQKdYUPb83U03tkqzQ92vWhA17o0/e+mTZh6jX7IF7HLkwfSf9zSRyiQatqD3IAc1RpwNsPYVaNmzrpGo054=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB16474.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(52116014)(376014)(10067099003)(22082099003)(56012099006)(11063799006)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Y4DWXp7V0LVU0ZI4Kcm71Sx44klVq71WoR1v4aKJ0XTdY5RR6fdrHzJ5A7Ai?=
 =?us-ascii?Q?loA524ZizFz350gS6pxLIhTvX4uXlFa3pzds+hVUmAAVqKxawx1y56zg8X5J?=
 =?us-ascii?Q?+3vIVjDxHMoonxgeBipZSO3n9rpuV6F1QDTpqkvh/tXPTX4X/S5y+ULE2j+Y?=
 =?us-ascii?Q?OHhuH6MLfN5Uf7Y+wQDEmIqqML1txfVoYNmt236qv+KDIPd7idpZI7GX2N15?=
 =?us-ascii?Q?/BgbVgOhIixoH0ifY1ScSS66KjWdzkfzo6G61JJK8KTVF4Ee1ihxFEdp4cME?=
 =?us-ascii?Q?zDjZLP4SMAzoDq+zrSndIxT3sK/ebilh2JE95GQQqklueVTGX3cQxCj1dYPo?=
 =?us-ascii?Q?UqgN3ePa7kwKhUV89Xr+8nzPjMloD6JmBJEePdPQz7PoE4KPoXZMNnULL3FN?=
 =?us-ascii?Q?W5QsBcYfPO6yrkuSPnS7HwrxKrBOhq56ksJ8AAo3FEOPuyfMeh1j4B7DlHy1?=
 =?us-ascii?Q?/EKEvIt2wswyNHsf7F85/unTVl7Fed1dqCt5t41fgpkjM6LkEyezSqxKMvnS?=
 =?us-ascii?Q?UfmUjpo8WeZDCvt7WnqACUH912uO+b7CHsTgA4eSHmDBfLfVL8jt8dXq7FLY?=
 =?us-ascii?Q?ZTW9mSIEdqqdVjLeLwiRyKllFiiguyCd/7dJOv+fPvRkniUBFKEE4yQl6OWV?=
 =?us-ascii?Q?llVFLv00CdVKsOW5WQOgb3uqHVxnrEtrlReaeKmbOougc8t7Qkb7iY+bHPVI?=
 =?us-ascii?Q?ekb6okpZLN6jC+3wRGBEpraS8aMcai3AABv3KTzZMxyEAHFmUxG5boX7YPxG?=
 =?us-ascii?Q?7Utm4mAjYMcNkybF4fE7XFZyPNrvtIAWLQ/pZpdZeWLA8IB9xPJQYrXyA50E?=
 =?us-ascii?Q?aEgrQc/lRODVsp1QlgPw3r/+9O3s1Pwu8aGHOOB9ofqm2hOQOPnH12fxnUi6?=
 =?us-ascii?Q?NMmmwkLMJN1TIYnVAfQRj5/lrW3N8gQqdjaloPsqfSvFqjJpyA1BPUVY0LtI?=
 =?us-ascii?Q?Ja4PxW/XlQ2bv01v0KIpl1I/Jz+9937MtCmoz5PxPd1p+nGQxCUiGpeMfyWW?=
 =?us-ascii?Q?pOnzzw18cTy/DI/pdDPDziNBP+Pm8wspAasiMbsI7OrM9QvEznd2fin+Fg+w?=
 =?us-ascii?Q?pNKALHudZrLQsdnpOt6+b3pD/J4JzP27EJZNQB9v7BP2GMKH/JUpW2ANl1vV?=
 =?us-ascii?Q?ustdcuwe0jaJFG/kSHi+PtHzCO6EtIy57JbQH1BHWIq1hCvBok+tU2q8TbGK?=
 =?us-ascii?Q?jpmEUItqrcL5MZGtwUWcxA/jvEKuMYqVAzZWLGPnqMdHTzz5YNdfZ1fqX0d1?=
 =?us-ascii?Q?NjM0ZALOMxICaknUZ72yZ9A1i9tYgupek04PejsNV36uQDRaPReuS+kt+abv?=
 =?us-ascii?Q?QL8D3ydpI2wUvaMXdA1mspZbBT3V8tkDZXeUVxFWy+ei1n0Q0Arth77C+jdF?=
 =?us-ascii?Q?M8xKbmL6visfBxXgn/k/hly2Y5yDTwjatvpCJhZDo34TM0R8HL2ZZZKjhQP+?=
 =?us-ascii?Q?iw7qAdOL2vQUOMh/RU6SV9ydvkcT8SJBhnqNJBKd+gF8oS8sASwydgg6ddM7?=
 =?us-ascii?Q?Gq4HIrGZ3FWmuXrftv0uYDcWFUkyXPFSqxm9SC64K3l/OuVr6znBhxQSv4ey?=
 =?us-ascii?Q?WEfyR2PptHoCq65+aewQv2roAmRPeRe6c7uDVaqNhecVPWkPbo5lScxavA0E?=
 =?us-ascii?Q?SVCAWPfeXiy7ZbLcdv5dbMSM59v25mKnGP+TGNQis3aB3mpwMq1oCpisdPaQ?=
 =?us-ascii?Q?hhB1j7sDpD9EMafTWwECI/uD1ARL+pyAzE3ybW+ZqzO2Bm0qNZq86E4aWOWl?=
 =?us-ascii?Q?gEBUBGXTWjQQnVGq/V+m0MQUXkwkg1jifHFs00dTEYSqcO23Ep7Y?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8674a8a0-fb08-4e41-9d92-08df071e0429
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB16474.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 05:09:21.1740
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N4VJI47ECNpYuNKF0ojhfBOsFvfUduEptLePtRFaXD0SaNKKwLVyVPqUsXwm/2BD3gix1sAtKgRpseEQe9PNzdiHVS4jO5+7FQDXh9KkpUobdg/xMjmPEkzKg3/gn4D2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB12794

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/tscs454.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/sound/soc/codecs/tscs454.c b/sound/soc/codecs/tscs454.c
index b70c9d931e1eb..e772dd39a849c 100644
--- a/sound/soc/codecs/tscs454.c
+++ b/sound/soc/codecs/tscs454.c
@@ -3233,6 +3233,17 @@ static int tscs454_prepare(struct snd_pcm_substream *substream,
 	return 0;
 }
 
+static const u64 tscs454_selectable_formats =
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
 static struct snd_soc_dai_ops const tscs454_dai1_ops = {
 	.set_sysclk	= tscs454_set_sysclk,
 	.set_bclk_ratio = tscs454_set_bclk_ratio,
@@ -3241,6 +3252,8 @@ static struct snd_soc_dai_ops const tscs454_dai1_ops = {
 	.hw_params	= tscs454_hw_params,
 	.hw_free	= tscs454_hw_free,
 	.prepare	= tscs454_prepare,
+	.auto_selectable_formats	= &tscs454_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_ops const tscs454_dai23_ops = {
@@ -3251,6 +3264,8 @@ static struct snd_soc_dai_ops const tscs454_dai23_ops = {
 	.hw_params	= tscs454_hw_params,
 	.hw_free	= tscs454_hw_free,
 	.prepare	= tscs454_prepare,
+	.auto_selectable_formats	= &tscs454_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static int tscs454_probe(struct snd_soc_component *component)
-- 
2.53.0

