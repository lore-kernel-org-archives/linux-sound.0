Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010011.outbound.protection.outlook.com [52.101.228.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C7D737F8C8
	for <linux-sound@vger.kernel.org>; Wed,  4 Mar 2026 06:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772605402; cv=fail; b=DuXlXFgsWZ9OOOpP95nSA/7ukXNDWH5rZC2d73ABU+H6gC6IAiJXFbcPF1Y7Cnoak/daLqe2gxr45nv2NZZE3dYUWx3rcVtsLwLCfw+rTpmEdWeo7wxeyRPalJlj7AKZfJRwijZJs5MjjckI4L0kil5GY/+IPrQ9/BzM+I2lFUo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772605402; c=relaxed/simple;
	bh=Gs9fVHvSidmsi2nZWfSaFUpic2WXvzQAdYJCpM6VTHo=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=LjV+ZrubyIyhrLSAvp+GjfeU3P2d/zARs7z1ZXNjGcdVZLsYOrhc8X/Jz8vlNWKrURmXJ3eP7x0H9GIYRddUg1XZUwd7ajwOgGbEzbU3/B/vSqV0ZQeLvza+ZUUVN6ONpykkLwbqytU1tjgblqF50khM1P2TgsJNLkCKFhWJYIo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=FDQ9WAQP; arc=fail smtp.client-ip=52.101.228.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="FDQ9WAQP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ko+NsfwRjFv2+syEQIu2ab0fJM1yUPa+3fq8mwWoHeQYyhTMSdJ7Z2rwk6Ab43XocU1GKLgJ/uRU0C0i345OqY+0PzQoefxPTO4l5e1B8zqGohJn4/cgexrPclnN0MU8b7Yok+qAqubTeDaO0oB5+ohg6huAH/w5x4YeL8MUzzkuAUBRVuDjxGlO/brqmJtyj/3d6YL/OzB18LBboyvQMQHYO9xzwkLg8WMFGoWVQN5bXZJiRuKdGlw6sCMvPri0erbSUAGtAyFeGVldZmdLl+RE/Yb7QBGYNacQ4uEX4nGND9k/bTG1RcKTMxsB0NMUMICzc0/ZnZs4YwqIknxz7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1segrHEqqSGJWuMh2likouTuq4non1CVAxS7WtXtJ5E=;
 b=BEXv9cHkqwdVVtTBH74LLXpmcYyS/BTe2mFyAemdT78oZ3eIjhvCCK4eY4PgnTUwhyryR0/Ya+4HoW+rVZgY/n6ZYArxF/Hv5NKU2MyyJ/7p9bCsWmSiIS5qSpaKJD2z3SWapFK5vN/rIrfBOVMVyTtvPqkvwkGt9zlJ4dbnQ3+ywGwDRzCORg7dwX5cZ99h/MLEWkTcBimgAKVjBNJPk9kX83PE5HueIMjvSTdB4UPMKIJ3cO2suQ/73qs3xDfu/+NCUHgsOPWHgIV6BHorudEj22l02LzR7e6y1tddGsaDb+f6WwUnsUCAohltLLNZoEIb9OtkR0aZupiDQEArlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1segrHEqqSGJWuMh2likouTuq4non1CVAxS7WtXtJ5E=;
 b=FDQ9WAQPZvqYznncO0vmEmhETspfEPc2asoAe1SXFaqqyxZVckXjCYterhNzTI7DJZvH+KdG2ZCU2Ty79U1obgzpBSYWk14LAHRQ4qreUzgXF3rp82Y1F2OjWgTtSf5nKuTy/b1hA4yoxuM/K58RBmx77tvcVTixBXc8z31hMvU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com (2603:1096:400:ff::13)
 by OS3PR01MB9755.jpnprd01.prod.outlook.com (2603:1096:604:1ed::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Wed, 4 Mar
 2026 06:23:16 +0000
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9]) by TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9%7]) with mapi id 15.20.9654.022; Wed, 4 Mar 2026
 06:23:16 +0000
Message-ID: <87fr6gp0z0.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 11/29] ASoC: generic: name back to pcm_new()/pcm_free()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7fcp10x.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7fcp10x.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 4 Mar 2026 06:23:15 +0000
X-ClientProxiedBy: OS7PR01CA0126.jpnprd01.prod.outlook.com
 (2603:1096:604:24e::15) To TYYPR01MB7976.jpnprd01.prod.outlook.com
 (2603:1096:400:ff::13)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB7976:EE_|OS3PR01MB9755:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e0bd7e0-5afe-4e22-6750-08de79b68543
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	LsDHNtr5m30XRpyE7rhegmsxOmM/UFdf33tyFmUaJBiqxaBpj4I26lgulm+G3mNkMbVw2Ai+D7dPYl6hL9eXbbN7NBZgjmNGXyBbBVxmMMfAOa5Hz+sW0qFVaZF088lc99FYSKf2AcFxuXpZR16YfhaJZVGSYGNI8BFX2GHqfHIoWWtwO54OThnAWdOInBV0YT8m6TeI6t33tpw85+yJOOTP9ghjL5JDZiuAuo/2XcjMx6It0DrwJB5m+ipXpV5KzZ3UT/25ksmjAyyDDTYO5bJhofgu+HSME8jfW3Lqm9jOkPSMTGdDRO0oXHxxIgjHvpuuyyk6ENGhAu4/m5ZQw02tk9YvdIRy203/yobwUKtUTyBCvbjAXpkM1Q0z9jTs3ygdeq3XXtgCzTF25hRwRPayDb8PNmrOe9fCfJTNYmBywHUcyEEXACRsRReXRrtdT1R1+0kmXrV1W9vNgIZYt2dDcVSc/KXSDettfQW/h6vEuCUqLgvSuPB8ZAjq87bQiLBzyE0n35ZyQawVSiUV7PlNZiZyrZZP/b0tMZGRhd3CQg331PlEXSw54YqywyLiXNQwhpImvPCqxUakmgFKGl14jnAF7043a0+d/wkY1z9xB9VOt9hqvGwrL+X4ejQ+lSDPorz2gBLa4OrttDF07/hdQhmj94muSXN67ouL/3SQrEy1M6VZDW0ornNzSUsV9F81nuZpFf2Y/MBX6FciEwecLzCPvF5/REwFVLjAPrEEH58x7g7HRffULSMaPJXr5tvd4WfQqG2sXK1nbL1PzTtWPsIze/HJrXIEPaPNiFY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB7976.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YoHxNqgIUofBiDi3VKWLNzOXeZ+9BErFSpIsKdYH7ln7L5hqOkkg/uGiRUtn?=
 =?us-ascii?Q?Lk4dQM/svzL1Y2QA2U9uilQ6Ifo86bGSxQZFq9eY8CmBGTDSd5+PZO0JWUP/?=
 =?us-ascii?Q?7eQjVmhYGjOib3r1rzuiZGPp+J6V51T3Y7FQCWByVGbQOiyEKCmAXJmOnwif?=
 =?us-ascii?Q?gPyze3cvBPz3eIwLcs8JI1QoP9QNMg2EsplkIRO6wAobjOGmwnA4xJ9meM65?=
 =?us-ascii?Q?1YI+qnacmQmyTMkgY6MA1RWfu197u/cIgOLlTtb22HxcRF4unrMbAiWXcBc8?=
 =?us-ascii?Q?qIZk6b9gKa8Vz7/ED7AnrVi3fLdb0UTBUeDmT59ofld320pXEVcMo9f63BNK?=
 =?us-ascii?Q?D1E19gyd8FzNHqZMnATyMXTxzMvLGpxQj4F37XIAnuZSjkeVFaf131Oypype?=
 =?us-ascii?Q?0wz/e8DwyZ4Wfkn5X9ulUHFotoNGjPqMz5y82nJPCvECxjVzTzSuS/hGkIX4?=
 =?us-ascii?Q?+jrfKkuVAul1FQzrzRhIaMOLh1lKiOnynGG7QLxrqQB9LmOV/flVa9lhYWFI?=
 =?us-ascii?Q?ar1r1nZ8Ug9hzc2KDV1hxf+seqm4K/YcaKLonVU5ZLTLhHKqZQmAMOkroLAs?=
 =?us-ascii?Q?74+qmGDP24ZpzDqdZ6O4iMvNaRVaAYGf2MBD29ckqgk9vJJS0682xzx3ieNU?=
 =?us-ascii?Q?Jx68Dz/R7zV8EgGUnpYvzKI+zRepv3C2/iICyePtHzyGkaxw3QR9UQ08WPiW?=
 =?us-ascii?Q?Vo803uZur82ADLZRwT21+Dflj1NAn+xuqSdOInXMJihKb1Rh/JeUCRR8VYLp?=
 =?us-ascii?Q?aG/mln57Y0vRmVBv1FsN1NEnb+o2PxkFxSUON13Vgjq7SWdglNPk3Vxg4e75?=
 =?us-ascii?Q?JHcgyW7rcMY9wxAmmRTPhRpCZXyf5L3nqDutIjUDzQhGEqiid/qnJHWZ6K3O?=
 =?us-ascii?Q?tKQLKv54IvQXBC3voo2wnmj7PdSqMMgrdN2cbAyX+kfK+L/A58cZGFOJzzF3?=
 =?us-ascii?Q?BHT2nPkIHwMTQI0tRvM8mNaL+d8db1pbf74cSdr2jQRFFzkhrqCSo364quEC?=
 =?us-ascii?Q?p87AgHlLaPHjUZcozIjo4U2Dcg0RC3A00FJnegPbrLBMqWBX8ON1cwXuWp2O?=
 =?us-ascii?Q?fGwvv6LN9gbasvZAhipMc130264qgGtyWxH2UTOagRPFrtUPgjDB0pj5upr5?=
 =?us-ascii?Q?Ax3HqCyc9m9ZbvMap4T44CSgr/yAoaTel60wsVzzeb2aHGiQLg4Z2w1wRhfL?=
 =?us-ascii?Q?rkAi4Sq7WZtZtwZUHZ6gN2gtuMIAlt6mPZdbGOrmmXdkdefZioRHApp5RVS6?=
 =?us-ascii?Q?FxJPKgjSTD5zkZC0ZRZkjZcekBY+2KLv/GgA9fOQLah5SSpei8ByQcMzk+Zy?=
 =?us-ascii?Q?89fUxuomdVmnItUKSynrurloJ6sxzmvkbAAhERZZFyCH7f+WL2r1Qm7BsGnx?=
 =?us-ascii?Q?H/RxtinDVZoQ6o8ddYHOAMoy/c4gV9bS4X6lUojf+5oOzmkkwEvygpmRllOu?=
 =?us-ascii?Q?u5tedhjacPbfUlHWwtpeoW/CjpS/SdRnlxnorFLC/Z0tolyzttwG3zweNUxo?=
 =?us-ascii?Q?olXVIXvnBaNzvXOOWjDzVtxOZlzBvRVGYGb4zz2VDk4uTXEb1AsFrI8E7K+T?=
 =?us-ascii?Q?IMVtlMgfAAfDRuua4l+NnIcVeyGuwV0vED4cc9G3JaWSGZy+mqtSpB6p04LY?=
 =?us-ascii?Q?mgj0pWfeygkp357JtOfp31BCTPQtSIsApLutoDorPaVTEtIRkJ7qOw7d3FGn?=
 =?us-ascii?Q?s9XXAjx8pTSlIlCxJmN3ieOhteNEfXaFISD1SXKhdGnVlAxYmCRB1bAcgCs3?=
 =?us-ascii?Q?z69kr/mdGot2h9TpmmdC7uEzU/zBORWa/WRZthSLRtVHn9uMrN/4?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e0bd7e0-5afe-4e22-6750-08de79b68543
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB7976.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 06:23:16.1159
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w5uNuvBkoEdOl1zVHdgY9/KfyEPIDGDWTClNXbZGCuE8e49Y1lBCdEw+VtZt5QSyRl7ukqH84EZtbZMtZc1IPfqVkmaBDxj6zmbB0OYYK0+ecYl6cfDS1KAl8Vjqy2WU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9755

We have been used pcm_new()/pcm_free(), but switched to
pcm_construct()/pcm_destruct() to use extra parameters [1].

pcm_new()/free() had been removed [2], but each drivers are still
using such function naming. Let's name back to pcm_new()/pcm_free()
again.

[1] commit c64bfc906600 ("ASoC: soc-core: add new pcm_construct/pcmdestruct")
[2] commit e9067bb50278 ("ASoC: soc-component: remove snd_pcm_ops from component driver")

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/generic/test-component.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/soc/generic/test-component.c b/sound/soc/generic/test-component.c
index 2e49066dedd41..fc40d024152e6 100644
--- a/sound/soc/generic/test-component.c
+++ b/sound/soc/generic/test-component.c
@@ -273,8 +273,8 @@ static int test_component_resume(struct snd_soc_component *component)
 }
 
 #define PREALLOC_BUFFER		(32 * 1024)
-static int test_component_pcm_construct(struct snd_soc_component *component,
-					struct snd_soc_pcm_runtime *rtd)
+static int test_component_pcm_new(struct snd_soc_component *component,
+				  struct snd_soc_pcm_runtime *rtd)
 {
 	mile_stone(component);
 
@@ -287,8 +287,8 @@ static int test_component_pcm_construct(struct snd_soc_component *component,
 	return 0;
 }
 
-static void test_component_pcm_destruct(struct snd_soc_component *component,
-					struct snd_pcm *pcm)
+static void test_component_pcm_free(struct snd_soc_component *component,
+				    struct snd_pcm *pcm)
 {
 	mile_stone(component);
 }
@@ -562,7 +562,7 @@ static int test_driver_probe(struct platform_device *pdev)
 
 	if (adata->is_cpu) {
 		cdriv->name			= "test_cpu";
-		cdriv->pcm_construct		= test_component_pcm_construct;
+		cdriv->pcm_new			= test_component_pcm_new;
 		cdriv->pointer			= test_component_pointer;
 		cdriv->trigger			= test_component_trigger;
 		cdriv->legacy_dai_naming	= 1;
@@ -597,7 +597,7 @@ static int test_driver_probe(struct platform_device *pdev)
 		cdriv->be_hw_params_fixup	= test_component_be_hw_params_fixup;
 
 		if (adata->is_cpu)
-			cdriv->pcm_destruct	= test_component_pcm_destruct;
+			cdriv->pcm_free	= test_component_pcm_free;
 	}
 
 	i = 0;
-- 
2.43.0

