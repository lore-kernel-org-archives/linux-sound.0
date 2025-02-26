Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011058.outbound.protection.outlook.com [40.107.74.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07F39199E9A
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 01:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740533949; cv=fail; b=mpsBu37iLOz7xXfUjeuhWy3oxBIAl5A74lZv+MN0Vboc9WnndXU8QnIm/hbuiDHklpAhdQOlw2OKJOXca2qsfJ5pK64N+FkZfRAyjpF3474an28z5l+SNSiWFjGMKC3DfRrU0vYarOv6oQswqyB+6FhcmK5DnjRt1SrbjJUQftM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740533949; c=relaxed/simple;
	bh=0KSQQlGwugMw6dX7Izv4hqnC0Tf5QcotzI2/D0BjIRc=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=pWiCSFNjmM0TbfNjJffKXNqwjMOltIqz+zZcEwpEfLB4UCjClQ9a9s4CG5OIHtCErTtTeH8LXG7UZbVzWG+hVSus76et1uN8/N+miGYXU0R1lGRkxRdL+BVhFWLxRK4wzNmcq5YSWwK0Y8J2Y7lKSmFArY9f2aU2JSSYHHNJ+Fg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=ZVUlZB7g; arc=fail smtp.client-ip=40.107.74.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="ZVUlZB7g"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pokI5FWoWdMcakmeUbvEklKYcHYyDEENMgRyfS2TB22ucbZBEwxj3VCHdMe1Dm349L3vB1KTFYIRErqmriSPDVs2lS9UREtsuWWLidue9jVXpilP+C1WgQC4aX5/8iU8kOFeQrnzYCrU42/EEfVVpbKuJmwFs6SY9xg0YNrOL9Qi34FW/bn6WAoYg964zufPvu6spoUTYCrRsp8EXXkpmsdSH2CujUPPyOahAXfUDsCT0qKY4MUet8XLYsj+mpJ5dN84tR64SVODR9/TUrFAovUIA4hBkv3xPSoaENl+KDgDuR5DuFMY5AzQWNpu97t+tN9wBLqm1Wkg2zBFri4ATg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=47BtX//hAXhF5jJO6Av9w9rdmm9+c6Nytg5UzPZo9s0=;
 b=exV9Z76Gv8nbHvkfFdoyoUFu7OHdLuNSyacRao0EH6xPswZQ3h05dV4Ndl+zmOzWdIUnwF3dVbPzWcGS7sLICvKYqFjTr30EM9/VNNpqU0sjua+V5Qm3uaGtdFlW/MuweTzkagq1sXVcTlAZupLXOmVvnvoZAYfKpoUmPyqMJLENhTGPZHCGugp8DXiyUltNJUyyOyZUfNCBaw2IkagltZHWivQAJZhRWKDFPvGjZwXiYqkR4wRVrrfiIBamjpNphYHY6ZEBUEo3AuVTBY1+eYRLxTb70lq7PQsn8JLxr0N8FFlqNu24d1xM8/2uXZMLly/naIKRSuNn6tiPa+xwSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=47BtX//hAXhF5jJO6Av9w9rdmm9+c6Nytg5UzPZo9s0=;
 b=ZVUlZB7gX054qZjK71a5PyC319R+fdEhlVE/6nN2V2DQ5HxblCsxJ1nVNnLLlZ+jWRQPsJFGP2NxS15pkyYSGjAieTDlQqbKYzKcbWkqjOksABq5mT29ArDbRbCzqYspNTPpI7++uVd/iVq99xMfvA+qJJhndLQBUCCDZHwqpME=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSZPR01MB8140.jpnprd01.prod.outlook.com
 (2603:1096:604:1a5::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.19; Wed, 26 Feb
 2025 01:39:05 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 01:39:05 +0000
Message-ID: <87o6yp8oxy.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 144/157] ASoC: mediatek: mt8173-rt5650-rt5514: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
References: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 01:39:05 +0000
X-ClientProxiedBy: TYCPR01CA0151.jpnprd01.prod.outlook.com
 (2603:1096:400:2b1::7) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSZPR01MB8140:EE_
X-MS-Office365-Filtering-Correlation-Id: 87eb7fcd-2750-4098-94d6-08dd56065b05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?yVCMcZr8tMk8p1l++TpNOsN2e03AY+tb/NC/68Krt3P+uqYfdAxNQAyq/qs4?=
 =?us-ascii?Q?C0GRmaoeQ/XiYGI4/oFlbTNpB+osBscMzuYjnuBwV4wQ8mJvtzQ+S79oJ7XW?=
 =?us-ascii?Q?67XLAdGlizH1iJQm6GIy3BMtG+V3tm/Br3icIMucFYEPG+P/Wtl+aBcDzqRV?=
 =?us-ascii?Q?PIPYSG5JZH6UY023UiNLJ7CRJ/znn7BTA0ccQTbh5JYYWLxef8qBoICCeBCh?=
 =?us-ascii?Q?Rjlvf8HY//QP0d5yo9Wpq/QPsXFMZEQ0vtr4RooBzCKzQYbNxSbShzN9qtT/?=
 =?us-ascii?Q?J2DG66a/2B6XeBKsdQ0aJBJqYMCSm9MeMYEgDw1WyYNpghjygdRcjKByHzFl?=
 =?us-ascii?Q?/QZRJHGiNO7CUFzEE2Wl62YzbXYDiuGDvYsuVhGz7/tuC5G2CLC59dt6K3ma?=
 =?us-ascii?Q?Iwlt90AZetvKN9J7wuNBO8jjA/pCeheezEMU944yq4BCI47JAhldh6LrrRxj?=
 =?us-ascii?Q?g7bVok/vbGRZ/wgOV7sopTRPi+s8nbWhPSSfKzglms0z9oi73/L+mhHFoURu?=
 =?us-ascii?Q?gjpMpeAEERVmGDyl4rKjkOiva7Il7E+EFOyOwZPLns92dS1HBhCL9AuU/NMx?=
 =?us-ascii?Q?xHh82V67DbAu7BBuWq7dy24js7vJ/9HjaSU7ODabSTDcln2w2f7e/TGiyFmS?=
 =?us-ascii?Q?FvmrLZlXoz+HokyDDiKJ41UfD/k18xQ7xVGaYW8b8aTDzOa/5O0fzUOTwAuV?=
 =?us-ascii?Q?p8pN9L81VppVxJwNEA8yBUU5jQcZryaRbdJrQ7uvq4o5K7mEO2XmyiqWrNJ4?=
 =?us-ascii?Q?Ktz+Au7HYEbVyYhH2fsrS99tBaHad+G5hm35dVjqNrprq8SufdmQOlDILRCs?=
 =?us-ascii?Q?WAij45x8NnzO4vU8i+e01cVGLMpuRrFlN2wyDux6Qxn4LaM0Qx+hhIpCDQLw?=
 =?us-ascii?Q?hS41aQV2wVra5badDeVQ4vvmCv7muiiuQhJ/vURyW2bX18DjPOdZpRH+zYLk?=
 =?us-ascii?Q?TUtPg8+zk8feGjzUbd/8V2YzPNEA5j/NurIEkmI/6JOGHyBlsoQiHKEald32?=
 =?us-ascii?Q?D4xz5ApYFq1twU/Rq3puOiAJ02S2DaQKJOa7t3/AR1UEcYCdk/YgWDmd9Zz0?=
 =?us-ascii?Q?qs8mQzaPD4mcSHamOI2H9z/NzTLXGT4e8jFEhuyCl2VFCQJYIQ/JeYd6PTCp?=
 =?us-ascii?Q?LzMvq09zKFvC6vGFIUh1E35AmJJjY+ymeGsdRzldGKcrPTUF+peOeDe4W+fD?=
 =?us-ascii?Q?XXMUFubpMJ3/PEYOOxC/ZW8v8PQMVSzjAbW9T9KsWkg8L9TT+j6To8H3u8BU?=
 =?us-ascii?Q?P30RUyAxsygAt6G7BNpT43kTN+1D9y82oT6YeGEY9DQJPKBpHxqJ2AXEgMo7?=
 =?us-ascii?Q?Dvq2XNA3S3S5V6knULqYieI2wga7Oe/0zdKLj0fbDcIFUXbloSqA54LU66MR?=
 =?us-ascii?Q?xoCDN+mu0pU1IzHS0OFxSfcK1Y+2qaVq82ZGGjCf1h4kV/n0tiHoB8ByW0PF?=
 =?us-ascii?Q?kd0VwVd2Jb8b7kKKf5BeGTeLuhn9kPng?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LOGr4UqOeSaut8yYWamQHO94WGY1SjplmcrisCquYQe8zpxjZakHZiGHOwim?=
 =?us-ascii?Q?4tetrflbsisnBAv5yuka4n3SPjcHqW+N834pKITgNmoa/SYAYjhjlNy63Zq5?=
 =?us-ascii?Q?SPipOJBouZxJZXLU2VWrJJbnKVAmNaggj7XKmaozdNR/ciEahnPtfKafuoHN?=
 =?us-ascii?Q?H5ax/lwEK/c2tc4dnYltAOQRhx53OWvNBwU9/Tntz9rOMdwv/tbjH1/RAePS?=
 =?us-ascii?Q?PUEoEydJqOP4/EBxwXI/Ghv8gdXwMbTPTZFO75ajAesRxYZnxkiDdLRzl0ti?=
 =?us-ascii?Q?iPRUxR6s6N4wgLRkmQKXRhCeQo56NLI6pKRGzKiC7C+FDsQyXXjQ3KAP/xcb?=
 =?us-ascii?Q?/CPraGdIU4vF/nOGW1RPiXsQ4XA16AC2fy3SusTdtJDPURwFFN36Tm/Ts4Os?=
 =?us-ascii?Q?sjb0kQ+h8GZxoEhcm+db7FsPW/761y4R3EKM8o9XTTbiyXcgoDWM/CS1S3Uy?=
 =?us-ascii?Q?oDAFtG3hFcaGxFhFM4LBnq7LekrenUKRlORCuk7U8Ve8VU7tWYihtUczAspn?=
 =?us-ascii?Q?gXG7vgurOVbzn9uSHxkzgf6II0KcN8VJOtUJv94rN4dtWWr9kEJZLgkAmwpz?=
 =?us-ascii?Q?7r+UZk8JPpQMMTgajsCg0o0LiQcDcUF5pvKBdvfZlZO6e7NV+oLPPR94O0sz?=
 =?us-ascii?Q?A1cNZrT8vrhEcNuClpSlQ2Le3ssVUE9Wxvbms4Y6j7qUXMZR5sNq2+MyNcB+?=
 =?us-ascii?Q?ukBhcShsVz7pAyORIY6V/2GMBL3CrgmEQ4ghUKmYMgonCJ2dUohKQmMKDhkf?=
 =?us-ascii?Q?qtH8FwTxQl+5I9FbK96mKklbXcboPqgBz5njwcHMo/Dq/iSW2dOb0BBLk9ts?=
 =?us-ascii?Q?TOtmBIT8FMrQtIIGShHib9BkMY1BfRQ2jaNzSb5l5gPrpxBF8Fz+eBM//DbA?=
 =?us-ascii?Q?Imp/z1bNOUrlAi7P5ADGEZ5onaUZoZ5SqAW33+FQDWitK9+JKjZXEGg+2S8a?=
 =?us-ascii?Q?fuqjD+ztL7lrDc+fCwvMbX7WiVKGUOQgpmeuhpQ3Zlijr0e1hp8UdXJobVZ/?=
 =?us-ascii?Q?QXcKMMt2BEoN4xVzgZzb5wFO9cHrM1/7A/wPKS0QbR7lPP9T6c8C1/kaLnYd?=
 =?us-ascii?Q?vNM0992FzhVAUSt5cx6xb8b+HO0zY0yDL2ewszgSRUhAS1nruIBr+737JC6B?=
 =?us-ascii?Q?TMD7GB8SGaZ2rt+T81t3ntZdcnlqloGWm37WbtSZ91EcwEVyuFS87FlOlQ6O?=
 =?us-ascii?Q?Kigb8Q6VEYrfKqfdWy0djO1tpIydrK7Qg4sxnbrSW6EP3Y0DYoMl0bdUAISI?=
 =?us-ascii?Q?E9ReNnRXlwcOLDAiyGBPeFmcB3Eei1AMR9jqfaEKgJ0ur75mN3TkH8mD0Sle?=
 =?us-ascii?Q?fIFB3jEBsr3251TG0g0WSXsxMrXIY8aL8HFwD5OOpaMcfybrDIy8URrryZS+?=
 =?us-ascii?Q?QN0JcquY5R5ZSdxejz73uW1bYglMyke6/xA5DV4bO/Wf97YeqaN2dhzVGeXf?=
 =?us-ascii?Q?eZNATHfgsR0f59lZYEs3IEk5vTyoHpxYSuJj1q0woMGhvAf9sP42G+J3swPV?=
 =?us-ascii?Q?UoGS1Q6QvHjIn4eTp8TpLT6y4NB1PIJQ+m/g3MMiV7PskPJuzgC1EZ/lvWGd?=
 =?us-ascii?Q?Pv4oh6NHkZSWj9oSo1UB8HpTpCsEcDkyXcm3Fr0j7NURvsTKb1iwoH4zRo6w?=
 =?us-ascii?Q?tfQsLxMTM5MbA6vVaY7snNE=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87eb7fcd-2750-4098-94d6-08dd56065b05
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 01:39:05.4637
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +iipleJctZiwarmncVE1kmCWJtpN97jD6q+MAaXSp1yHut76CgPZ3H4xeeZ7TAQlwHulllXvlgI3pqAnqgeSSSHMXGJNww4mCF7ANgB8S2brC6bIxzI82/G5UJl9P6Gk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8140

In SND_SOC_DAIFMT_CBx_CFx, M/S are no longer used. use P/C.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/mediatek/mt8173/mt8173-rt5650-rt5514.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8173/mt8173-rt5650-rt5514.c b/sound/soc/mediatek/mt8173/mt8173-rt5650-rt5514.c
index d8e4e70d834c..dc063d85e62f 100644
--- a/sound/soc/mediatek/mt8173/mt8173-rt5650-rt5514.c
+++ b/sound/soc/mediatek/mt8173/mt8173-rt5650-rt5514.c
@@ -156,7 +156,7 @@ static struct snd_soc_dai_link mt8173_rt5650_rt5514_dais[] = {
 		.no_pcm = 1,
 		.init = mt8173_rt5650_rt5514_init,
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
-			   SND_SOC_DAIFMT_CBS_CFS,
+			   SND_SOC_DAIFMT_CBC_CFC,
 		.ops = &mt8173_rt5650_rt5514_ops,
 		.ignore_pmdown_time = 1,
 		SND_SOC_DAILINK_REG(codec),
-- 
2.43.0

