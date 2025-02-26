Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010050.outbound.protection.outlook.com [52.101.229.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1D1C2AD18
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 01:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740533426; cv=fail; b=uZh0YYCum7LrIALJT5/NSP2t57QV3Hzm5GD4rHrStOXwQ+YPKyVEC7cwY/fkjJXTKGUbx0vT3RmASDMlS7Svp34pA2cmBTAJb3u37+/AwKPmb+Gpj4YX+9i/VIqZTopWIyI/w3oJ5Z8QlV43zjT5dA0g/Bir0ybotL9Tl5//DWw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740533426; c=relaxed/simple;
	bh=f33gdxDHR+psqBoOA6sr/uCA78cVJB5YP1xofp5aSIE=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=fgYdzUQ96cknvGI0eJ6rd5goYgfxJLW6TEdIq5+OKgLEhpWndkqu+hUqu7u4dY8oq767qXqAG03mtWnGelXrp1WchyZ2V/+rpgPrPQovQABflqvHoYcDANv4TMxDXpnBdRP6lCl5yFsFfDxU4793an9+RHDapSE5vQHLTqkL8wM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=bimb/9it; arc=fail smtp.client-ip=52.101.229.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="bimb/9it"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ipaRxWZ0tJf2hORtpAeaKUJKkmyg9z5yOl39YNOu3mhlQJSO/2a6z5yTk1T3m6WgaAVt0nZIBuhV0RgF5NUqDfj0t4gwG7N7U2CSH7FEY/mVuHBCjFRwkPV3jbCti9QhKKC91ldEnzVPgarsBKwvMez0kaVo14XpC3OPClnM+dYuTxn9B9DpaUDg/gbaaADwnx7gxiOXuCMWCOPqBSIEiVBY+wRQQ1bRqm16VnBOPmMIxDrOaBXQ6RepUKIfNgZhrFHlXiutvKyOSYOzk9c3LbBQjBIupMWVtJOE47XnkxrrgvJQClh5xiHMQlrPTmYp66QNEqxt0n/aw57p5ZzlsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KRq/S7hZxVFTeuagnRjfrEXPXUIfRv8Q7xYjUbA/rVg=;
 b=AH7sRQ+GBRVQ/FXjztne2EhKRwUAUASgjMbB4NJJ9JFz5LxPp3H33D8ucczNhN9PWJNG+fDtrVXgY44Zq/1NizcrpOA2nuKWes6iL8ghjRJdJgykmRv8kSIwW5a5WwISnabeBDEzojeVIGYcpSQ/3W9TzNifentuJSO6b4JW7KbBlkg3loyAiPPs0bcKW9AMPgTCtywXCiI5oDn5a/jNLoe/hltKKTnvYmpMipvkib+XcV5g3JU5joBhw2oaJviXUac45yYcKKJAqTtXJtY9QXsOJ4IoHVl/IytuDCPap9nAWTT3vL4yZ+z/jVo7so4FXmAM238JMa8VYtCMbAt80w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KRq/S7hZxVFTeuagnRjfrEXPXUIfRv8Q7xYjUbA/rVg=;
 b=bimb/9itWYVrWCT9HwSs5bhupXQfCFJiRSlctqIHtQLPtjuG5vbZT+EGFIkU7odAVXA9ub2V/JTRbEcrgEbdLBj8kN6GLlFarGtEn14cVO7LbXxRlpR7u3E2U6l3ZqeZrmqau5m1KeBWlkz2iJoGt+fybursrejbdOBuUbihDTY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY7PR01MB14457.jpnprd01.prod.outlook.com
 (2603:1096:405:240::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.19; Wed, 26 Feb
 2025 01:30:23 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 01:30:23 +0000
Message-ID: <874j0hh4r5.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 008/157] ASoC: ti: omap3pandora: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
References: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 01:30:22 +0000
X-ClientProxiedBy: TYAPR01CA0093.jpnprd01.prod.outlook.com
 (2603:1096:404:2c::33) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY7PR01MB14457:EE_
X-MS-Office365-Filtering-Correlation-Id: 0cb90bfa-d24c-4db7-f0c0-08dd56052391
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6afmRUSJF5hKdhXSvJaBMo/gVpPz7nxUHrcK/I9M8qonj5xS63VDYm8YORJ+?=
 =?us-ascii?Q?3XpIMNpyThNu23OgypXKrkSLrr7CCXcetzYjfLJjBxKVJl/c5/RN7gG7emsI?=
 =?us-ascii?Q?TV7iywJz6MmLemNMiWvKWAWSAllLhb67aBpvXCXOroe55UqdX2e2egRHgBIf?=
 =?us-ascii?Q?khLxXACGXo2mSqVDikGyjQmHetQxcsfJKrPblOvtpyArvovDYssZrvIwLRDH?=
 =?us-ascii?Q?H+afWYzmQXpmztVtVo00O1xvwS/TKr3x75oWdorKYtyqv7f2uQgTCZ1EY/Np?=
 =?us-ascii?Q?gxEuSgmbYrUjh6WdnXR7cWfz5Ag9z61/Fk8g5g8bqJnthmANG4kZD63S81MI?=
 =?us-ascii?Q?9FdJCH6ssIxq7jQfuOCc1le06xqzVz2Nuael23B6uBRmvjwNPMbF5TOfYszD?=
 =?us-ascii?Q?TgIMP95lYvyzRLt4vtTNhDcTPQmFyJkpuKk00jb3ni3Aed5DiU1g0qS7rDVj?=
 =?us-ascii?Q?Cqcrfbr11VEKCLChbjoJrHbRl2cHoRlPNc/sZfqHNNVkzwxLTk8902spa8ZM?=
 =?us-ascii?Q?cq05Fj5T1+ZbeNOv+6XtI2SwUZ646dWRn5D5zi+1QKlLNEC9fcy4AFftQqtK?=
 =?us-ascii?Q?aSIgtm9LGr/QG6/PhHnpKUcWrshkmB+OgDc3p2+gpMEkXGIRZuGSJsHSo12Y?=
 =?us-ascii?Q?ahhexz/tD3eWngM/o89Qj45CQBfe9dhJO7tzN/rxXgwWT9ZCpdo2NP8afGxh?=
 =?us-ascii?Q?Ow5dxSLCDwG7iIF2tMGg/ZDY6RJzSuMF3ExlFJzVl0pjQ0IZQE/GVLqaOOFs?=
 =?us-ascii?Q?yn8Jpicl8e5uYySzp0MhMBqF/oRCSl840ajnxKyensP0kDvIuvKkzk50MCaa?=
 =?us-ascii?Q?hB2YCOkmnBTHQPgBBLmxxfX6/oPDd0Rc1XWKYZcIhYBO96kXgRrmuU2KkuOl?=
 =?us-ascii?Q?I+/KZyI+0Wx+cKf6iW55GFtcSfuzPG+t5s5SJKIPoHZCB31V32qcVhvLp/XQ?=
 =?us-ascii?Q?csIGE5Opw9xlrL2yPSFufc/mgBplbEgKBWB/0Qn2aJNckB6oSll0nKnXPIPI?=
 =?us-ascii?Q?+h0wrNJ9+VplIqz0k2o9Vw17v5ZN8SJ+gHU8luzMT1QAiFEA7sHf1YJRZEfM?=
 =?us-ascii?Q?iowUlbq55Mssc+zC/GEAV2z5v3Mo4DOz0KDotYm3WVre2yY61MiMfoZL+G5E?=
 =?us-ascii?Q?7rnttbE8Ak/+fGorkVMcI/vXqk7DN7plkcgT9f7pwLtmbG3cwPAeBRg0O9sF?=
 =?us-ascii?Q?6ra8XswJkVc5lSjvictNO/IGZTcRJy9gzD753GYHeEhs3kkZ6VyuhyrogNVR?=
 =?us-ascii?Q?KlfKrtFZ+z4SzURaU4QWoNBNIGzZoA3j8AlINy03YM7FI5jQldh9UmMzsa7O?=
 =?us-ascii?Q?AwBYCMN9IXEBwSEjzUkXCFFsoz1bdjn6ayCZgESQu5vry/JfXkTTelVBKl0i?=
 =?us-ascii?Q?WdPWkHZQYc4KOWaByxt5jd4gdeD1sBCMJfRxhH6SQk8cob99874hkCjFvBMt?=
 =?us-ascii?Q?oZ4wZRiKeo9nu4GoNrN7myeStiKiZOrY?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1/ZA7FpH/yXWJXytCxHeozmaG1ugONiM3rWC4jiED7APgxB2Am44vJzG78ug?=
 =?us-ascii?Q?MuOLapk0SK7/VHyIm8oMJKS7LtB65cHJ73mOMwf32Ud2H2SsF63rcbbdkKGL?=
 =?us-ascii?Q?YJPh2gs+xyWL1uqvU+OE0V1VmYYZZTJFvGhU/wPUAoVlwGIv1KSbXkUR6w1B?=
 =?us-ascii?Q?Z353/lE/l5YbL1HdGoP3xRpVp1Om40lPu3/9/itK89gKG3B27woufkpY1C6K?=
 =?us-ascii?Q?ubRJ27orMHB+1r0LNLTNZlShlwqqwpz67+jfTCfkQu4HGDbkpO2ZzRjHhdTp?=
 =?us-ascii?Q?zrwsjs/P1A9uVHjHhz3hGHDN1PWhivuyWmXAHWxssdAmDecqR7ZUrM69vJ43?=
 =?us-ascii?Q?dCIr1c0E1VCi962H7tancNZsEaitXhPsGI8yT++GckFWVbBscLHZEoYTUMRy?=
 =?us-ascii?Q?1UVSmeBLwF4uXD3E7mo6RaiPIJ0sVgbH6e0+7zkquMqtwtCfm37Va3+nGIK5?=
 =?us-ascii?Q?SlguRafZfyTyF0E4zZxQMLx8fh/fwx4B/WRqAJ6V2kMTPCQejR5k6k6ZZ6Qf?=
 =?us-ascii?Q?ZLilkmV84AXAumGum+gsxoUELXHf5d+JG7aR6QIXDPsWXXGPP+Nm+NtGh+Jq?=
 =?us-ascii?Q?kZXtg7hCxq9lWeDEe1zJIfG5XMaV1eLUeRp9E7+IwXrKdj+/NKSyVo9l6S4F?=
 =?us-ascii?Q?b0Tm/Lr0/6KGECrfzjkNzRao1NnmatQphHaeln3gRDw6rf1vEiLSA99sZJRG?=
 =?us-ascii?Q?jIvO2vWVMVlIdqJLcJiUkOFQi0u07isHMyP2vosmEFwxthX1S0oV6I0s8IES?=
 =?us-ascii?Q?a5LhO6RMo4s+AVKQ46NZL0KuCubRcVi6FXkHxk540NEmtKl847pHY2/t2srD?=
 =?us-ascii?Q?tJKgSaqJ0rTvGaPV1C8pHix/WZouMZxhkedDSYaRBsnHOrkxURB1uu7bayKK?=
 =?us-ascii?Q?1IwioXquhWnc3AtxGTidNW3yAOXN4ZwLx9GcGEEvlTzvR5+MzJdcPG6+3ThZ?=
 =?us-ascii?Q?/TzzX0UrTXIvDGbFp1bmAhtlgRj8DGPV+oN0e5jaK6Sl8pty+XONL1M0Pf4M?=
 =?us-ascii?Q?sN76gZBFWixHkHWiQ8CAHXcFD4njuRAna+cIVEn4ObBTsFVr8K9o1ou/27Pv?=
 =?us-ascii?Q?tDIbDPObb2SD91YfHbzcW0IpJComHnSJg0OnaZcgg2UDjDhZ+x3eSq/scPPE?=
 =?us-ascii?Q?9ZciHRDNeBMXMh1DyT3QQ+a4eKp+e0sSAf25jrhs913YpGXTTLQL6RC9GuEZ?=
 =?us-ascii?Q?nBVerO+Hk0w+INPSLSQwky6VLcz9CdRrqoBDYI8fWZDw+zKysmW+EesQGEw8?=
 =?us-ascii?Q?WN4I6uHpPnCkAWlf3sDeAMi8u6fU7QGK6jKoeuMH++DfInIW2167PpPXzZuV?=
 =?us-ascii?Q?sQnAGusRWF96P4Yc6hPnIb/nFkMlnfWaZSE8NA3dAp6VFSGugwI/E8HgXxRE?=
 =?us-ascii?Q?rZ7EGEHFU9lTWhXvq8FKujVCGuwnPVW/Ws/IQTPBgKIMV31zR3pnYNMG7OJr?=
 =?us-ascii?Q?3OpVB92Fnt7hCPXYTuOqxxZreatKaGlpt+OMACTnjTzE09+Ep4KXrQussk8c?=
 =?us-ascii?Q?H2MD2LFcT2os6PXyvbbz1tzakRm0RxWPICjzTPwuhPt5rTHWR2/c/noxy3Np?=
 =?us-ascii?Q?xabSINCMYG54xlHbR4zz0G5ljaReTQ7Lw7E59X41RO7TirRoS+keAMYSavVw?=
 =?us-ascii?Q?C45oZNRlcCOpFOtNZL6L+hQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cb90bfa-d24c-4db7-f0c0-08dd56052391
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 01:30:22.9792
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p7ql0QiXOIg7FdlklJ7Kkp7BH507MYytSBqQTuKeZ2OEbrFHivqFovCbef4ZRlKpJWONCiWpcre6QrnpRV3SPLgWv/onmvUk511qFZuj4e/72+zl9QhbtQWGTgyLl6yA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB14457

In SND_SOC_DAIFMT_CBx_CFx, M/S are no longer used. use P/C.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/ti/omap3pandora.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/ti/omap3pandora.c b/sound/soc/ti/omap3pandora.c
index be69476e59d6..808fb6765c05 100644
--- a/sound/soc/ti/omap3pandora.c
+++ b/sound/soc/ti/omap3pandora.c
@@ -189,7 +189,7 @@ static struct snd_soc_dai_link omap3pandora_dai[] = {
 		.name = "PCM1773",
 		.stream_name = "HiFi Out",
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
-			   SND_SOC_DAIFMT_CBS_CFS,
+			   SND_SOC_DAIFMT_CBC_CFC,
 		.ops = &omap3pandora_ops,
 		.init = omap3pandora_out_init,
 		SND_SOC_DAILINK_REG(out),
@@ -197,7 +197,7 @@ static struct snd_soc_dai_link omap3pandora_dai[] = {
 		.name = "TWL4030",
 		.stream_name = "Line/Mic In",
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
-			   SND_SOC_DAIFMT_CBS_CFS,
+			   SND_SOC_DAIFMT_CBC_CFC,
 		.ops = &omap3pandora_ops,
 		.init = omap3pandora_in_init,
 		SND_SOC_DAILINK_REG(in),
-- 
2.43.0

