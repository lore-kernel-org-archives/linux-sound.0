Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011045.outbound.protection.outlook.com [40.107.74.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81D3517A2FA
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820825; cv=fail; b=kV4OG/b8ml7wzcG6MCB73W50kS27LdfhZfjKu4e97mwZB6O+7XIsI12SuvPMtst864bwk4ux9k6yIxq4kIO9Ixq/UZyrozOJbWUVxDr1CH2AoyEobHiFOqyJziSKFhJ1g0fLD6UQVISuBYRwb8+y3uctd8ZlE+3HiycyEn61+10=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820825; c=relaxed/simple;
	bh=FsaHCnQCMv0O9+gLhNfY60YrDOn5q4r+Q8TZfIUZI3A=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=fmeGi3xtuM30h3mlvMQ2xUjkiq9y90djbaSCGGf9A4AQtQa8jLVrLlStYxOJVAcPwFwewJLQeCGpvCEIeTNcaTmRQ3E8s+IS+WXG1l5ltSMAfJxWMWtta+wCKgpDFAst5gOg0d6ZG3OH8EJMvywJanaxZ5o8NCoE3j6JdiIEKSU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=huQcDTXO; arc=fail smtp.client-ip=40.107.74.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="huQcDTXO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aQ03Pn3n31l2+OokOm/T30QQDevjgDvca1drHc/KxGRhHpcYvQn+ILRYrZts5YSelL3KtJ7eCoX//AnrzAthpsE36vrbr0TaugkEgM1CjTl898vG5Rt5un+6p3Y7+qQSuNZQu02lPO330u+xStQkjDcpnjF0JP1PtXHZHl92o4fHCLsCbf2N5nKoAVJYKWE07EyxWAUCsTKNEb9m3DNOgv7/M1tnZKUKEvAx3I4Am+6gW8JY8Yir805hTQWPVUaxu0oUbiHJfmUkVwqTp1cqmO4sjS5wRvgUzmy4ISP+8bqrChGqtG5tHwcmTsfGbUEYK12853W+4GRmhZOGn8McwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WB9QSHB3Acprcvjt/9+T1hMSqsh4E+K+7W73YJRufA8=;
 b=NKqZ71FvPs1C4T6Lo8lmryBEwJG1H4CUAnRcxG477zY4KFbXz/Rh7TvMmkuP59c5grLfpUIxgAgLYQPyh1wNUbkQnELoZSBjTV2V3h2y+kuWyxp0PFZhGRidxFhL6IzuZygrASsBEWn5+fqbBJPY8e3DL/3pQ3subKTTPS/fuIN3ibOfpQUb1WmsqusFwBv0E47dJ1vqeK03Z+osl/DAXZ/c08lvs55BK0TnwzsmUY5NQ+XqIHCYZkFToByAwLpMPYoQTXRDXKPD4AN1TANWIMqt6aw+lgTJnGnJA7DRq7Xdj7Ix+pbh3Q4Pt9Zn8eUpOoR5dZGOFnWPR1+LSAFJpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WB9QSHB3Acprcvjt/9+T1hMSqsh4E+K+7W73YJRufA8=;
 b=huQcDTXOkcUmWBuknfbvlzcQDCfrJJRoGlXpr/teyQqESlcqj62BeaAE3BIy+0aUMaDhaiDyKsoRmPrBpdHWoWJH4swvL3Jjxdlks151Zg5NAIk4dW1tbBtQlvOoBHOSvjFVLpdYiJdCu9wvWTgfcaLzO9eVHQ+VDf6UOfyfIyY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY4PR01MB13460.jpnprd01.prod.outlook.com
 (2603:1096:405:1d7::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:26:57 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:26:57 +0000
Message-ID: <87qzu51kj2.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 139/292] ASoC: codecs: tlv320aic31xx: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:26:57 +0000
X-ClientProxiedBy: TYCP286CA0203.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:385::16) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY4PR01MB13460:EE_
X-MS-Office365-Filtering-Correlation-Id: d169acf5-714d-40f2-5ed9-08de20b9061a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5DKEwjqjEj9nfKoLVrRj4qSPQ8UbqkCVEOSq2RvQR5ELtgbsyBp6TrvwcrLo?=
 =?us-ascii?Q?Pb9vPcy5mZSpo75n/CpFWuvH/OD4/GMe5P1wMSwpt/mcL5iOUXr/oMvdl2Wa?=
 =?us-ascii?Q?8xBZepSE9uu68g0Rx6Kot/BGi4dMR1/CROREskOZv5n9dI/CX0n4ZIBSJjfi?=
 =?us-ascii?Q?Vnp/tfMjW5f1Oxt9RoEMsqxsW+DMpRRE4XDGD5SHnzgf8zhCp67gUoca0G6o?=
 =?us-ascii?Q?NZ0eFy52qBzPq2mPtQeKufeiP3dzCr+WLcPTgDBkr73wWmHi3jTy1mMk7vRA?=
 =?us-ascii?Q?ViXy96Zux0dGRf6TCyOl8zmEAKaPaLOrBpjJW0O10kI8xF8Rp9ghfyB85nhK?=
 =?us-ascii?Q?zvpatPWr1zCB9chjyi0Votg1OspaiJNd3CPFQB9qLx9VeKqj+8tKqYr5XVoD?=
 =?us-ascii?Q?FMtR6armeq9FlOrwKJJYrAnaSQ7f6Si4ou4+D9KRArf9SeE94K+/05c5XyGh?=
 =?us-ascii?Q?Bd2/FhMVvaKMar1Uduko/h0AVL3CuHElUE8CJBC+vvAtOGE2xVjXgE26kWVw?=
 =?us-ascii?Q?NVSz91h5Xi8xW9+InIg465rsD6zJz7vlfBKJz8UHQRM3QN5Z3WmUcvlkjU31?=
 =?us-ascii?Q?ROoqQA8aim7B4F3rC3+r4/MIP1mN0IQSAkJtb2OuAS0FFMCP2xtf8C6efRZq?=
 =?us-ascii?Q?beUsl3b2/2lBdv9JmcSddnbyYCGoisTd85yJjQ/mcLHTKNtII2mBo8t8No6U?=
 =?us-ascii?Q?5UiRd8DpYDTUXyca7BjTXApsokZvjNigUWOm3skuGaE3Mqskp+VR7JNbY/6Z?=
 =?us-ascii?Q?TK/FGtdl3/5c0oucOREaUkjV6WAZosQb2QhrQtQ9OoYX4OqawchCIe41vKPA?=
 =?us-ascii?Q?uj9cAcXPSsGT8jcPxqcW3em+fUXqZCokWpauFA4KgCW7vd9jFYFcQp1hNIMc?=
 =?us-ascii?Q?WurLPLc9EeZvP0p8v/c1RfKdBftQhZVPU9ykwlq/W79s/PN/yXzEQvsfpmI5?=
 =?us-ascii?Q?f3hDtXbS20YjAGGA6pGc3/ky9Y4gztTjniAx8sr1YswAac12+M81kDqsii0I?=
 =?us-ascii?Q?rjPaZKdc5Aj+oc3uyu0R5fP5xAvFsKMmGnrpXS+kxiSaADSHXuFx6m1vMroi?=
 =?us-ascii?Q?HPL4tfIKlavh6vdu/emS71Ur/hM9B7V1BM5eAkMpv49YVRQvi0CnYsW50MVU?=
 =?us-ascii?Q?mcjkF91l7dM6ox4Xp54s+6II67YqwNUBsF/u9flvNBpT0R8SGA+/AL6u2u7T?=
 =?us-ascii?Q?gWZEHGlUrgK93oFlneOU4BebMVHCHzcHwTLOa9wwHFqECtYoZ46zOldbkQEd?=
 =?us-ascii?Q?qdeilPYUNZ/FXsZQ4E4cO45iFwv3pCpC1RdXn6H+QuSOyc60nP8Q5d9U0mdm?=
 =?us-ascii?Q?eqvQHpwslE07M/2m9eiWfrwQcFvVPU+Q8v99Oo83DuMpKdkFohMOJoGCyKho?=
 =?us-ascii?Q?7s7+wFVEQkVby0ek4PzDGa6OBgeMk8i45m0EvvD8SFxGj2pHgP9V/oaqubnM?=
 =?us-ascii?Q?NR6OyVut+tnFJjMDVJGzXx83Tt9y8lsJlBlnKiuvH8LzA87fayx9htbtOIdi?=
 =?us-ascii?Q?+LN/8E72s3gPQklTN9pwkcl2D7TO0fpuRB+k?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?RfDP6/QKFD729Z0ADxous6BWvYkgGdzs7btgCuYFtimlNxrnSjfaw7QZE2jv?=
 =?us-ascii?Q?UBwHj1FqI+mgDRBHwXCsNeT+mCCP7+gz3zksgUuA4W5keT9rC9h4aa7C+fFB?=
 =?us-ascii?Q?L5cXnmB346qA7CLjLMc1a9UVuwIOK68POTrVmqSCyWSZm1rVm2jC/9DPsmsp?=
 =?us-ascii?Q?sGamJIZurH88wJqOfXdm1+MLimud/3YIWPZDb79viZQHqGeyEwKZDdBtjZUz?=
 =?us-ascii?Q?Qr6ByQP7EO3hbzpDehJAMwFW4o5vwoE6KSCGtx3UcH/9NIAaVpKkGnTN7N27?=
 =?us-ascii?Q?grf4+IwyIuVvlYY9rHqJsr2DHcw1NFx8BmvX5wi/j3CulbL5yMxI2/q/73Y/?=
 =?us-ascii?Q?kdrYKRQn+f0RJaDoEYrCL04cHk3Su/zH/VaX6bYBmFDLN867IL7vAsyW3fhU?=
 =?us-ascii?Q?ad8sOvpObbpxLZVOhKi+OMVDlTWlPLA2/e/EdG7xqzl0m8qvzuC2AnkV6Gh7?=
 =?us-ascii?Q?G3b+k2mTcRVWIjPTfCU1pEpMTOf3cB/W5i2WBJmM6hNvJs/y5mkYzXe8YVO5?=
 =?us-ascii?Q?jYrDx5/g6bQi9tsOHkv+k/2EfzI2mdjOX6s3unEIQLgxwyiN8LW00k7ZAi82?=
 =?us-ascii?Q?SKA0Ngc9RcAfU1mf2ayBsZWtzDMKB8nSTRcjVDqWMYFM5fPL0rbeqiCuG4si?=
 =?us-ascii?Q?hgowMSh1A74gnZP3AGTKpixTLCEzcwx/vaX3J1qvOea2Pscmy1WcKpNYqbzy?=
 =?us-ascii?Q?7rLk4OLXlOuvoVJeg6c5PGyCObyjjfzJRuucdOOFxcVLazjj/tK2VPC7lrKU?=
 =?us-ascii?Q?u6N5yMBzDY8yYxMsDZEKnD/ypEDVlm+Y/wFror7PDZffKMUrzemlHt8ooU4y?=
 =?us-ascii?Q?RlRzu/AUz3KjdzaAyBr00P9Omj3SrVeTC/W+f3MmfDshG6rTAQjfB8/cRiZf?=
 =?us-ascii?Q?Lu64HDKDIWR0iVl+HKirlVZ+qs0hVoij0MEo+xiAPa/tvxmloql3NeNr5blo?=
 =?us-ascii?Q?Z6DFVXZ3nFMNUiHm5SFjYEfUFbURbh6OlMyxCQQaIb1Qxl94a1Wj/60SjgUw?=
 =?us-ascii?Q?KLbtTXE436RnB5uSdiUl32NZ4Ir25j81WWAqzV2TslfvsH/7JgXHvmPMQfsA?=
 =?us-ascii?Q?Irk22OlKN8U9K6oY26EcrHqYweBshbivHUBC1PcNAh3aqzkao+I1ehhZjG2x?=
 =?us-ascii?Q?q0l7Nh0M5LiZA3tygOyohO0h36/huK0KIdrs5APAzL3GkJYdmgnUHkEW+SbW?=
 =?us-ascii?Q?Fi5BqGTvlHb+Sk04fCgGWl73rHaAMYIdLKq1Xa/PgKvN+XdnWd2dpItrmMo2?=
 =?us-ascii?Q?h08vKRIW0xB64eZvNjfh67fCuOqx6McgbSM1sBEOXOtwCNnR5O0aWDIZUvyz?=
 =?us-ascii?Q?gxShUYdXrmPkFEGeT1imG0A6uVgY7RytPmVZc3aw77G0tuieebqgnqPBVJ4R?=
 =?us-ascii?Q?LSCTbO3ht9nDlLR/cT9zk/4yLDUNPK47yGza06vws+yW4tbHSOtIR1CrXAq4?=
 =?us-ascii?Q?XXcBMjMwCbZvbgolZZ/AlRlhEyBIcf0MZA1vVkNqThx1MrGM3lF4RUgCiRx5?=
 =?us-ascii?Q?bDiEgpbIC51DQIWU7Voww/ehWLAQijxa8PKfcYFVDqLtJeJM1b/NYijFZKY0?=
 =?us-ascii?Q?CXobwBEsp76OyRTubxUuAjPONW0hDXJ7h3Pnp7MxhDVumBDDTD5wmm23Fmr6?=
 =?us-ascii?Q?G26fEkv0cnZxrl4dzcLe2NI=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d169acf5-714d-40f2-5ed9-08de20b9061a
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:26:57.7654
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9kXgKLnofsx2QW2zfrJUTBMyp0PWhbvAvdUPJqCMMFwfnKggk5TzFNT5H7pFeh205izuDZG08JCpRgZBNBRvTWgggFq5D/39Av1DIWEpjyL0xqiB/+AfDdy83TOreWL+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB13460

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
 sound/soc/codecs/tlv320aic31xx.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/tlv320aic31xx.c b/sound/soc/codecs/tlv320aic31xx.c
index 4b3f9128ec37e..4362c2c06ce8d 100644
--- a/sound/soc/codecs/tlv320aic31xx.c
+++ b/sound/soc/codecs/tlv320aic31xx.c
@@ -799,7 +799,7 @@ static int aic31xx_add_controls(struct snd_soc_component *component)
 
 static int aic31xx_add_widgets(struct snd_soc_component *component)
 {
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	struct aic31xx_priv *aic31xx = snd_soc_component_get_drvdata(component);
 	int ret = 0;
 
@@ -1030,7 +1030,7 @@ static int aic31xx_dac_mute(struct snd_soc_dai *codec_dai, int mute,
 static int aic31xx_clock_master_routes(struct snd_soc_component *component,
 				       unsigned int fmt)
 {
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	struct aic31xx_priv *aic31xx = snd_soc_component_get_drvdata(component);
 	int ret;
 
@@ -1316,18 +1316,20 @@ static void aic31xx_power_off(struct snd_soc_component *component)
 static int aic31xx_set_bias_level(struct snd_soc_component *component,
 				  enum snd_soc_bias_level level)
 {
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
+
 	dev_dbg(component->dev, "## %s: %d -> %d\n", __func__,
-		snd_soc_component_get_bias_level(component), level);
+		snd_soc_dapm_get_bias_level(dapm), level);
 
 	switch (level) {
 	case SND_SOC_BIAS_ON:
 		break;
 	case SND_SOC_BIAS_PREPARE:
-		if (snd_soc_component_get_bias_level(component) == SND_SOC_BIAS_STANDBY)
+		if (snd_soc_dapm_get_bias_level(dapm) == SND_SOC_BIAS_STANDBY)
 			aic31xx_clk_on(component);
 		break;
 	case SND_SOC_BIAS_STANDBY:
-		switch (snd_soc_component_get_bias_level(component)) {
+		switch (snd_soc_dapm_get_bias_level(dapm)) {
 		case SND_SOC_BIAS_OFF:
 			aic31xx_power_on(component);
 			break;
@@ -1339,7 +1341,7 @@ static int aic31xx_set_bias_level(struct snd_soc_component *component,
 		}
 		break;
 	case SND_SOC_BIAS_OFF:
-		if (snd_soc_component_get_bias_level(component) == SND_SOC_BIAS_STANDBY)
+		if (snd_soc_dapm_get_bias_level(dapm) == SND_SOC_BIAS_STANDBY)
 			aic31xx_power_off(component);
 		break;
 	}
-- 
2.43.0

