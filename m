Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010008.outbound.protection.outlook.com [52.101.228.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2C1818FC8C
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 01:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740533654; cv=fail; b=W9rskb1OUwypvJMT97J/DHkNDff5hB3EYpLB6+zB7gxYmdyLqDYw9626b7iqAFBSEvbIGDMMelV1ggIPB10nG6j/dA+yDrlRI60bMt/bJPd/t8TjiLt+BlVQdWCFtNs19FMMf0VAuwliafxwKTAwTzhQuvcYDhH44U9qniiY0ig=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740533654; c=relaxed/simple;
	bh=dbOJRHEVTN4oZr6NJ4E+XiDMitVH4YYjuTEZOOwtMxg=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=VMZnI9nSmMKR7PS/SIPuh6gIqVTTtKtk1hwhu4FdsyCo+l83TOp8XH704tGn0n9BZEIVE43Dzl5psEZAqCfnGIJJxuSRgBA/lz8a7j3StiKPWz7VmvPqTx5eJfEFrRtAgyhJh4sBOR1hbgy5itbc3X1MYqm2P+o8ncf5fL17L0Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=iApDtOSN; arc=fail smtp.client-ip=52.101.228.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="iApDtOSN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i0GXE15SLs7Qjp62fGe9rDhmgBLvBQY0/dHQBMtgqvmKXP/Kr3qLzt3kU2GQTqlwc00sJmusuzZ4XCtpQ3Hiq0oFmtpSkMDICXbvQcPaMTQIg9Zaxp679vnCooXg4HAEDVaDSRU/c8jloseFbujgU4Nkem4kZQoMvJVs7Q6MB4+InsZGs4ngtMtHDAqbTPR3iZIuvMofTb44ST24CcZK87ZCd50f1GzHXzsnYKhKLHJydiQwdmUiqn/EIMglawjZjZcOoRCmQpFuoHEC5SzH6YoR2DCqmZ5mK5MH4B3YFB2Cyx9B81HVgsJNIzp5+O2KU36NeJKdoH77CNBalGIf2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bx/DvyRGcVao8WAEw9p/aL7rW46+GcURdcDelOt/z2E=;
 b=K1iAjIKOBdkwKnOyITosFOkfs8he67T+yUkCV8Ed1EBGwhaDqehAzpVdW+OVbJtkb1pyBqN0vFuteoYuQn8tfLPJSbgDxx3eiX9mSIjyrKhBV9ngkkxTdbihpcPVhskNPCplpCauiAOT26TCT5SnsRV6kQM4Ch1Mwp+31/cRDak9aR78Mun8Bb9Htz97+aVMSoUGMIlw5SK3IQSZ8i0Blp6SLdmhiL0HMPhnK0x+C2TR2fxPM8jkS44tMe/vAeQCYvgU5OgIfLZOpYtUtKgpenPd2aiaO1pHGbZ/LSt4RxJGigX6mRKJQ7PSfu1nCna0pu/Wx7WUW8Ly1CXVte+uxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bx/DvyRGcVao8WAEw9p/aL7rW46+GcURdcDelOt/z2E=;
 b=iApDtOSNjA9EyTxrM9HGCEwPhifn/zWkq/MiSn5R9v3OpQwplVHGtFGlSQypinldZOR60XqqiKaVavBIFWv/sDsSyPIYtqZEOPZBRx2IAxaKiSBdn64K8mD5aplv8g+4I9ZPKGuGUO4tQJccNZ8dReCZRWHzpO7B6QWgPB0n7Ak=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB10414.jpnprd01.prod.outlook.com
 (2603:1096:400:246::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Wed, 26 Feb
 2025 01:34:11 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 01:34:11 +0000
Message-ID: <87v7sxcwvh.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 064/157] ASoC: codec: rt5682s: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
References: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 01:34:10 +0000
X-ClientProxiedBy: TYCP286CA0316.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3b7::9) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB10414:EE_
X-MS-Office365-Filtering-Correlation-Id: 55860742-df0f-4e64-4f50-08dd5605ab54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xujU2WAkkqj1L6uTawoKqpgCua91I7Oci0MFQvRfMlja2TC0T4Rackr4g34B?=
 =?us-ascii?Q?eD0+O8/wiXoAKcMLnUe3XzMT4IJuGRFqPg2rIVQ6Y+EKwNeWIkBWhKnBRPL/?=
 =?us-ascii?Q?ucwfWn4Smde4FIiHtj3HW/qSsX181gixMzPJkqprf3QWwmIF9zOFnSSOQLmJ?=
 =?us-ascii?Q?BWsaGZHHC/oJ3esXIU3J1gURBFG0+1sH2uGgTptfAHtAA3QIC16JJruwgH3n?=
 =?us-ascii?Q?mWA+q3BoVYWTBA+k6W+u1zy40qXyrvhpu/fygXzZc4qn5Bp9+cVm9yve6yL+?=
 =?us-ascii?Q?2EExCYswOsHfqoMkalzGNqFUiVIk4Hi7uperKjyXMjWq2odTN3uPiFNIEv/U?=
 =?us-ascii?Q?FPxcqxZYI6RVddX87Ka8+H5CvNsIHuCRChgMCUG02zKcR0FkOZfip6n0nly0?=
 =?us-ascii?Q?UkpHMeqN8XxQecq33PElsGlpEXQyHGajJcbRuoyOdpXl1Jt7UiNd7JhFZlxw?=
 =?us-ascii?Q?t0XdKyEFl1iPPXfIPPWFzriL6SVsP8YfA03xyUmqO1Ncj/YgUVYBJEq+8kA0?=
 =?us-ascii?Q?1yKPVQ6dccibZ5U0rKV0bEMBMA4/XMmAblJcK2ZCeutrhXl54LN/vtcA+0hW?=
 =?us-ascii?Q?ZZeJOJM2K7AH9pSf9xK82tLDu87JS4K8pdOHHvsDol9zKOVQNp+ZoyO4CRUd?=
 =?us-ascii?Q?uaMZ0F8Or4Xp5RwoaewHY0oaezQo7TyEcCaxmpxTWRB5JJcjNLFlWkA+k2sB?=
 =?us-ascii?Q?2sgwxZU9MlexhnjJB9H7zJyEHqkiozYIOUh8oilf2Wbn7a21xza0huRUVTOp?=
 =?us-ascii?Q?XxAs7K3ttNWgWr04w1fe5xAmSmmX7QJDPodA2sXDcbeyykV8/u2hFPtMgXAD?=
 =?us-ascii?Q?4MwH9fBfB7x7S5l2KrQoSR57yxDCu4MF+PPj9oiIBhWjIYEuyjCw+bVIr/Lp?=
 =?us-ascii?Q?qhRYvLFn+ZpwxZB+D+3R2FiMPwd7ha+uuz8n3X12hobunlU/Py1zpwh1phCb?=
 =?us-ascii?Q?Qv4zaZ/j18UoRdvO2aQmBybg7omvYcQBPkVP/jDmp91/2Tspx13Q7FLx/wcj?=
 =?us-ascii?Q?acPPxcA9zbrxL20kSG/08SlyJ+eTK4X+d5xnvB8boRz8C9DHziDuzReeSJof?=
 =?us-ascii?Q?Boef9Ho1sKIEl7JD65kuFweGL4GrUcVqrHAa52RldxAboQU4SFv93Jg1IDPi?=
 =?us-ascii?Q?JpP1r56zh1puEHMFIaREHHKHFWgh6f5/qyAD+BQBTIeujMIr2QkMLNOULJMh?=
 =?us-ascii?Q?wYClnlUFy3cPrEiZy7B3icymYYu6WA/FG80Dyvbtfi97YkCUaoyFKotuzPwv?=
 =?us-ascii?Q?IPQDwUGO3vR9fJ6VN87gd7r3tMeIDXVFyMLO+K5ScAGZMDjXQjuJ78B4oGEA?=
 =?us-ascii?Q?bC1sChCXzbbT3JA/+4Q/KQu8jWJ8rS5P4QB284Ajmt5Yy+RPWqDi1EfRA5cC?=
 =?us-ascii?Q?SHcFiLLawgI2icy0OYbE2bs2b+t8R8DOOh7MkMTcEBI+7TPMGB9B/ahb4Qgt?=
 =?us-ascii?Q?QUEyOQi7W9Y+hOXc3OErlt+jDCwWxbRh?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3gv5+9shVGjqw9OvzK419hyromBOB7VidYve6f0nDd0YwD9qTlKMFmy2NfXB?=
 =?us-ascii?Q?Sk/qPi2lFYtaJkNXvsv2VNj67bRVFELHSlzW63o+L06TViTvoPRHAXflbcDC?=
 =?us-ascii?Q?Hks/5CjSWc0UEB5HoCtDr3xh9XMgRgVmRCkM+rH2KG2PiXkLOqI0UkoFIVSI?=
 =?us-ascii?Q?qw+Oat27zEkWpwPS7OVyvx96ORvF0N4mbF/FOzowflazwnTQKl79cCq7AJTj?=
 =?us-ascii?Q?ldVIVpcrY8tjfqiHg7J3mTf5fosLytKUE+JiqfWti7wbZe491IhmW1+ndmya?=
 =?us-ascii?Q?1CJhx4MwsaL7RekKDDV6B02rzGZmqv5WSu0Mz/p2qc5AIuJkPkqE9QsX5woD?=
 =?us-ascii?Q?QUjKZpT6z24CBtQpfiOFojJNoht+WrXpG0PTnUMZiMcZcE0N6TNB4gzgxORC?=
 =?us-ascii?Q?szchlkdYIO4t8V/dP+4e9+1xF2P2Ew9G5ZQy5Ov+nHdur+vk3Mcyqui1TWKM?=
 =?us-ascii?Q?vR0+omBGRaILH2XVOpXAyzVHE2h6UxhDktDLaJA8PigM9YNN2fs3TPe22Krf?=
 =?us-ascii?Q?WvsHb9eDgkQbmzBxUH+3SVonuLzVJ0yIelRhyUlbjblaxtZ8tw8+6neBR8wZ?=
 =?us-ascii?Q?xfiXPQDApt9ZaleaA9KmuycXUnei/S3olFIH0wqhlhFIg1pSmH3VOFScFnnN?=
 =?us-ascii?Q?C76KHqaUHOmp/XmPj1yclU6DkUU8UtLZ5vhhKd031FQMZ1y7MbuWqy3b6HMX?=
 =?us-ascii?Q?BpAtP68LSDi/b60HPCNskm7wyHV1RE11H0ovioasDb0K2HBrNrJ+XVbVi1Pf?=
 =?us-ascii?Q?PvNlGjOxuJUgb5ROoGXJQn0pL6B8bc9yxnD+dncqVJf/E+d0Kgz24M9FiE4f?=
 =?us-ascii?Q?q2RZUXAunv4T6ut55kDdolwOJpjuipv0Js7sU7OjQgDMGLb7cazI1LFOS2rb?=
 =?us-ascii?Q?Wi40TjG4hUxqBZRHzG9uBQBAuTSgAUfDSvMxF6FfvsCCq29lDcahQuUol7l/?=
 =?us-ascii?Q?jEHgkXQqEStZnKC6Z4B3BlT8qPyuVvOjzLx9CRs5goYHE3s1Ay4SVxPn2ne4?=
 =?us-ascii?Q?rAaOqMsuqcMsW3zQRAg9JHpb5EJ35Nhmuik9QRy22tllgxcZRqu6j4YgJ5yJ?=
 =?us-ascii?Q?9v1V6V4zj24Jtr2oA+FM2W63YuTfQl8sw0i+1RB8QANqqzibSoVBS3n1WO+r?=
 =?us-ascii?Q?abVb3o/5c6C0fIlukDVx4G/d3Gz8eFTgNtFqmLlXZJ8pycs8NL5hf0EeixWN?=
 =?us-ascii?Q?MEPJvo2zwFtTCV1pOXE2J9eE2ZbY2O/1l5qZ0K/EwBXcJUPOf96/s455GAYa?=
 =?us-ascii?Q?cl8+zf7ML/yLLGymJYqYCN2Gg7C07Yi87EfJg1f9+wjAA6GxSbCXRjBlsMM5?=
 =?us-ascii?Q?01pCu5kunGvAQQbWAOuFc7vnjhxFm3YncGpp6sjnSvFdfYzbsfICjytsgyYa?=
 =?us-ascii?Q?mI96nWBiYe6zRenHM2soQcVes7OuUkoL6W4cPrVyI9jg7HqmKCKX6HJzdzfk?=
 =?us-ascii?Q?bynNUDytBj9fYYldyxfCOyuZW+FHyXCRy1A7lPpZ95Uf9G94/TMaERBQHM1m?=
 =?us-ascii?Q?fEVdbw39r2xyvvMCAe9xo/ukpsq82seUkzd2vwEmSx0KnpkZaJpN5x2idvrv?=
 =?us-ascii?Q?4TZ9FVuEN2QlcdTj/QOWKky5vAGgzkNVAlXjlcevkvaOJaIao+0Vjuw1khzn?=
 =?us-ascii?Q?qJgAE9rf1zoNv5ma9SX66ws=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55860742-df0f-4e64-4f50-08dd5605ab54
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 01:34:10.6758
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pvq4xiJoNAWmVerp73FaqvMvHcG268uHU1wUfkc8RjosZQS+gQPyBFAtv7bvRI6AJlxQ/bFNZBy9h7H8fbaI7aXW5fmrNvW54Ej2Yxb0Ws/Zaknrby3ibeJVIspMSra3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10414

In SND_SOC_DAIFMT_CBx_CFx, M/S are no longer used. use P/C.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/rt5682s.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/rt5682s.c b/sound/soc/codecs/rt5682s.c
index ce2e88e066f3..73c4b3c31f8c 100644
--- a/sound/soc/codecs/rt5682s.c
+++ b/sound/soc/codecs/rt5682s.c
@@ -2132,10 +2132,10 @@ static int rt5682s_set_dai_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	unsigned int reg_val = 0, tdm_ctrl = 0;
 
 	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBM_CFM:
+	case SND_SOC_DAIFMT_CBP_CFP:
 		rt5682s->master[dai->id] = 1;
 		break;
-	case SND_SOC_DAIFMT_CBS_CFS:
+	case SND_SOC_DAIFMT_CBC_CFC:
 		rt5682s->master[dai->id] = 0;
 		break;
 	default:
-- 
2.43.0

