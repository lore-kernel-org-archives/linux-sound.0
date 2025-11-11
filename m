Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010069.outbound.protection.outlook.com [52.101.228.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0788223ABBF
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762821374; cv=fail; b=kdpLFS8JdZmt5ymFJS6vu6H1B2Suc/JVEM8pA4/xc21//dIsKc1TqMbXs2uJPAQVCwEJSG+Q6LdQkDXxmmOd4BFiZDA8mrGU8A6t7UGDueX94euSM93/5KCT6vNvCPDRxGwXW0oOlTuvnvoFo9g7H7w6ChpEX97qLeLnWk1qb3w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762821374; c=relaxed/simple;
	bh=+dwDzcQyL5obGNo1FwCOP2jlovWPIUGwPQJBl7/+99A=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=GxlKY/2tyiFz1BpnPvckZbvKe2HVHllsBoYUKNcNLBoJX7RZZ/vMUuk3O3l0ObHXmxO6OsVqeHLNPMiuCAXJL0GgqO5J+vCBW8ksb+bdLqbTSCn1sw6YZO936VCd4ia97EKculQ3yo/CI4SdJIor59RgBomK8HfhDafuZMk1hAM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=ig5FbHV0; arc=fail smtp.client-ip=52.101.228.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="ig5FbHV0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JpaOiLTKv8X3lcWbEuR3Dh66Fxd06Sg40p2pwI7YRqVEXlbjUNmHeLo2GGZDtxk44oW1EDRJXrAh4EuwR2kQa5+N3e15ohjfDmszQIbA3V/YaU1Kn+OVl2o+h2ZP9j8ReGQGKAc/o9pQV98mHGp85t2t7+bhQLIYPb/HesM+z+nTypD1BnzN3q6ZQ04DysXPU4MNpJOxEXmV5d9ijZkr7r3IbUvHyQFEb6C9NR4zdQaIprWD0Oa/QC5GWVGIU+Az+hfVBMmam0QITutkS9kjXT+kXhL+qjsuwRlQFw0Km61kZH2vkXmXWL5CbuVhpbQyeAmcl9aoZ9QDpmJLn5gERw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mUpI+KRVPfFHQKRvTacJHXq3XxJtN2i1TdVJqD+GAuE=;
 b=e3MPWqXzALqOJpBHSElON2JiV6eA3CxgO6dTTo1/CRUcfy7c/FWesdx64uEXD3rlKI0KN5RD/bz5taIyhG5rO3sDZAUFB9UYodrqoDKA1FZ+oy1FDSj7O8qHYze3mcpnzHVQUKNS5r2mbpQZ/w9/HQTd20FnHUsyoMuBdpnpAaI8HykmifdAPmSOHmwvip6+BTB/ecrE+W6fj98B8ATeRzPHYzLBJX1tfM3oB9QY3lyXKPp/KlKetqOYnm+GsaW0atNd8pftr7WnjDGjJRzl7RkVSxgc7JCS/4KVmqh3z81wdVx6vOOKZpFwaz9hPoMy4dGhQoTsEWtciMOE/D8SPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mUpI+KRVPfFHQKRvTacJHXq3XxJtN2i1TdVJqD+GAuE=;
 b=ig5FbHV0wLBgWm4QaqXtxplerggzAqzMCo1prZ+nLTPcbAohRwMBeI00T6WoeiYSRuc2kM++qzwYkf02lBNORLj2rXEuqMH9rPL02jZEd80jgAt2gcxAaWbBXeD/gJT51sCnfjWuleX8LEGXt9plVWG/QsFjbpay5AZ5OFH+5+o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYRPR01MB15789.jpnprd01.prod.outlook.com
 (2603:1096:405:2c6::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:36:10 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:36:09 +0000
Message-ID: <87h5v1tngm.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 271/292] ASoC: soc-core: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:36:09 +0000
X-ClientProxiedBy: TYXPR01CA0058.jpnprd01.prod.outlook.com
 (2603:1096:403:a::28) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYRPR01MB15789:EE_
X-MS-Office365-Filtering-Correlation-Id: 07ace2e2-e011-4334-14e5-08de20ba4f38
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?rRqYxkhBwX4GOzmerR3+DOpco+Reo9ctizJ0B+CQTapfuytDPlMgK5/cmMiE?=
 =?us-ascii?Q?dmIUmdkTdAlMFKMD0yb9PSSFtO2gacK2GamhPjIWgp/KaD8Sk4yShV88DwzS?=
 =?us-ascii?Q?sxROO/w6nneXpDsaPeSToVlR/P/jaUqZ33HMyrlFHY8jPdmlP6KybgwTbS+6?=
 =?us-ascii?Q?srLynEHtJc9ayHvv/mqbiOqyr44hicLkbdGqqyW1bstjTf1HOGhIYV8uRDdo?=
 =?us-ascii?Q?IeGDH7R/+aGGnimvH/RNvIjbOE9/L4mIoPTfZ8dUKTu0laBU4LHnOzNZNIgm?=
 =?us-ascii?Q?hMxeqgb5/6qwFoE0+cSrwP9QP09g/mPxfT/SSaGuoeek4cMf7I94+dAKI2nR?=
 =?us-ascii?Q?FaFKpWt4d6VUbyCgrXIvlshWUmj6zf8ZpAgcg+KtDm5WgDW7XH5YtrkzopKw?=
 =?us-ascii?Q?bt2BvVPLg0ziqmAKqunVcfgp9IbcJNVBxBn5dV8t5HHvKewCiSG8rS4GcZiR?=
 =?us-ascii?Q?hdGQX4nS6qe7hTbmuHzQgnGy34Kb4O0ku4eQElncTJvWwJMboQudFVvqh+Ta?=
 =?us-ascii?Q?GRqxnY+jaA3hM55q9+f5fg8o7euKtCdSfvH822zEZDRDiUCdAIRpyz3igfzC?=
 =?us-ascii?Q?nWfMbd7s+K8cMTNWtt+BuMF2VYKaKqhnEJghE+gyH+FqqzcMu+30z9B/UoLo?=
 =?us-ascii?Q?6iBUDW0fpufPUPiLc6U0os1MGSnMzvH/0qsFrRCThf/AnUpEG0sW8ahqrLWy?=
 =?us-ascii?Q?/ztd+99FPY/pP127t6Ho5zOffqTQYGc00tsE4yO+pkFDZUnO6HsPPquaFY/Y?=
 =?us-ascii?Q?h6UoWV2YweotYZO2m7UXYOfJLLxf5ac3ayWFvFAEr4NAWmFZL7QsDYHXMVQ7?=
 =?us-ascii?Q?LKIJZnDX9j9Qm/0zHI9icyDjnAMnY4L+P5llWjMwlgsGGRcbDoDWqxSNmGXX?=
 =?us-ascii?Q?tBOjlFHAAWglqi3H3V+nNjXYEu9KG8v+GKY51bdIYBioA8FuWlPT+1+0wsCs?=
 =?us-ascii?Q?y3cax//rL+y46rq+9umPpZ4j/V0VbD3p0Xker3vMxt+icq4qk8mqNnw4H1rT?=
 =?us-ascii?Q?gJr1FUEL/6mHe2LZpU2WusKjPK8aDCRv6j7tqhZSmZfRZIS69i98CdsND7GQ?=
 =?us-ascii?Q?2K5uH3CW1Zvc6rDsdhukh0f5AdekiMoYuGAqeKpy8XlWTCC4PsbhE0K0RoSa?=
 =?us-ascii?Q?wDZJp7gJfLYDe3PXQ/zT+EhiG2Hhgk0heJGz2kjrfin18lo5DKVfoeAghj7b?=
 =?us-ascii?Q?U5oC6VNwpdrEkWLw+8lzT+ie4xWXQ80PDoTuvvFPobOJFMa8eV+PwAqyhlbw?=
 =?us-ascii?Q?Y7178HEKrSrRkRD1odUu1NP3cq8nbuUBvvPD/gZknaBV+fJ7cAjQEX8FUwGg?=
 =?us-ascii?Q?N0g3HSXqbLzIM13vnwHcpM2t7uizD3fiOYfOY4Udhw03c5BOMbWNU5lqr5Sp?=
 =?us-ascii?Q?VX2IJJfN8ssFtNGtIqDevQurswNeZRAvp3bLvSHkoEhgwQYXvR0Kl0X2H/en?=
 =?us-ascii?Q?fGIY/4FpMGwWQrRMHftSypt9z2vIR6zbo0SUitt+lzoDtO6Uv2Gx5LvCg4kl?=
 =?us-ascii?Q?c9pU82Lp2qatlKJGe0bpVJB9AFcKUQ8EyzKC?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?j4HBZ0ii9wfR4TDhTidTEZi1iz5izTXZ527xZXZnPtv5tLJhhKSjGmu0XR1n?=
 =?us-ascii?Q?wjW8LRRIvHlr4gvJPo5z2Zt6wMPlVYXL3NdUewmXyv1quasA/Yv+rwJc2iwN?=
 =?us-ascii?Q?StykmjhV8IpeUKnmyCB5MoUK2d8FVzubwDWycM2l/btU/k4IpGRCLKs0jF68?=
 =?us-ascii?Q?j8LMH23o25c/i+4s/x302uP2LWw5GSFEC/ELhjUPBZHIkTh5JDQAinU4PFqW?=
 =?us-ascii?Q?47q7zJnTL/oiiSbsrA09ERz8NnBh8N+PQsUPyxBJeMGfvgJBuNOO4PnJdpT3?=
 =?us-ascii?Q?Y0RCWxZornm+qecqYDj+nIpVAdyNn1XDCNncVSdHrn8g4x5vZLAEZrfe7xqC?=
 =?us-ascii?Q?5IXp5ylfnP5mDYBOCb6hXPUZPghNOnRAnpSu3Ughy8WpoJmzRyTSDXrU+sPs?=
 =?us-ascii?Q?rVVMOHIXnVF28bRg1+cca8L6WTljCQ61Vx+/novd3ZjgsY3ULLzZtUzRHmTU?=
 =?us-ascii?Q?Ryl7UD3+8l87MflFSCDDCY6ViheDPLi65KsS8AHEukit0tDLzjBtkUCnUtea?=
 =?us-ascii?Q?K9fIUhq0aSXjRYzmHl1OWbj5jYpJ3K3GuQV7k00FmVvooetvEKJx/n9Zqfob?=
 =?us-ascii?Q?w+a31CyLYOqnd+dCxYA47ZsXFlMbjfSLZVA73mCDsGvPDWFp8kfECkri01NL?=
 =?us-ascii?Q?yXmRuGJxbbcuzBN9Wts9dii15daOhHsJx0YtJVu1pJKCL+UDGQQU2VMORJl9?=
 =?us-ascii?Q?NZvoncEnbbXTdi7kjnOZnNb38farCgJpW+LUZtdNU0mxfZjCi1le057AJJpl?=
 =?us-ascii?Q?llmc+zwtvQWATfMCDHKF18behEfkHOP73IC1r32O8lbbhb7OPGs5KtMpa8OK?=
 =?us-ascii?Q?kjOpIp1IjiDdc+0VDtGmMt2fIn6+ERzY3wJ2F0hfKzZ9Da3plmhEVKuqwaRR?=
 =?us-ascii?Q?fiOLhd6E4Eto2Jr3ijgosAREPnt+QoTvWcu4gQc1EdGE9MTsJ6lPfqhRml0W?=
 =?us-ascii?Q?bsqEiZWDwxCEcXiuLIW4YwcgPOfwsbPSe+4SSVhq6vgoZjmIvyiSubKtL+gU?=
 =?us-ascii?Q?R/rahLSqJ9u0YwMS+zx6S5+XVzIR1y2fniNDcYUtI2rK32xuGJpSPGxHVd8K?=
 =?us-ascii?Q?E/2O02Z8i31HcSeyCOOC2vwBi/W1/8+iMt//JYIXknBDc1WKAt2Rk6gvxH7x?=
 =?us-ascii?Q?/7m4IVVc3QG0KJLVQG3sEYysIeFvAZdtGt4zFVxvkwLVXNbEOLDiprJjF9gn?=
 =?us-ascii?Q?oIfX31VpgIDBPBvchjytE0cwSYKgo2ydnGQWiX+RKUn2a9B1GI1JwTHPWH3l?=
 =?us-ascii?Q?VfhCeZ8DwlEXcTN8EC4AaKTfsEZrhwSteBvPepwXcwiL9SQ8B517EJ202/aO?=
 =?us-ascii?Q?6i4PHAGnkrpolgacLJUjtvpRYl3MsrjBy5ElEGohJYvLJYSVcIhtoH1ffSxS?=
 =?us-ascii?Q?jCAELsZWnTn8ikAj/42UXawjsyC4PSvXp4rvwVQHpurB8BLaFVfo14kNWgJ4?=
 =?us-ascii?Q?NGqMK/uyNogMf1krF0oNfcTQuhZxh7/v7APtzHk3UJ9awKhSVL1BwUlBDgYr?=
 =?us-ascii?Q?PRw7LBHIjTbbLoIqY4Yho25SVZbGcv2bbsndGpkfC/JEyyk2oZAAbNTfFd2a?=
 =?us-ascii?Q?PhWw0WkuwrDYgiZ4hZhCGLfF71dQ0WwcPN/pHiUzmJlDHvBCUlJ/c8zjnNMO?=
 =?us-ascii?Q?GWN+LlGHz78e5QfF47Yf9lY=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07ace2e2-e011-4334-14e5-08de20ba4f38
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:36:09.9299
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HJ5YDq2DdMO8Fyq0Qe2Ik13tah4L2YNGLW2vT5Lljmbu4r0A0qExzaRGf/CCGBi5TrMgIKFOVh1p/rLfk7UC3o1HBexWkQxgCGgVdjWOqubDsabEZEuigwhLOFdtdY5t
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB15789

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
 sound/soc/soc-core.c | 37 ++++++++++++++++++-------------------
 1 file changed, 18 insertions(+), 19 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 9dd84d73046be..4297cc27005c1 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -151,7 +151,7 @@ static void soc_init_component_debugfs(struct snd_soc_component *component)
 				component->card->debugfs_card_root);
 	}
 
-	snd_soc_dapm_debugfs_init(snd_soc_component_get_dapm(component),
+	snd_soc_dapm_debugfs_init(snd_soc_component_to_dapm(component),
 		component->debugfs_root);
 }
 
@@ -203,7 +203,7 @@ static void soc_init_card_debugfs(struct snd_soc_card *card)
 	debugfs_create_u32("dapm_pop_time", 0644, card->debugfs_card_root,
 			   &card->pop_time);
 
-	snd_soc_dapm_debugfs_init(&card->dapm, card->debugfs_card_root);
+	snd_soc_dapm_debugfs_init(snd_soc_card_to_dapm(card), card->debugfs_card_root);
 }
 
 static void soc_cleanup_card_debugfs(struct snd_soc_card *card)
@@ -687,7 +687,7 @@ int snd_soc_suspend(struct device *dev)
 
 	/* Recheck all endpoints too, their state is affected by suspend */
 	snd_soc_dapm_mark_endpoints_dirty(card);
-	snd_soc_dapm_sync(&card->dapm);
+	snd_soc_dapm_sync(snd_soc_card_to_dapm(card));
 
 	/* suspend all COMPONENTs */
 	for_each_card_rtds(card, rtd) {
@@ -696,8 +696,7 @@ int snd_soc_suspend(struct device *dev)
 			continue;
 
 		for_each_rtd_components(rtd, i, component) {
-			struct snd_soc_dapm_context *dapm =
-				snd_soc_component_get_dapm(component);
+			struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 
 			/*
 			 * ignore if component was already suspended
@@ -717,7 +716,7 @@ int snd_soc_suspend(struct device *dev)
 				 * means it's doing something,
 				 * otherwise fall through.
 				 */
-				if (!dapm->idle_bias) {
+				if (!snd_soc_dapm_get_idle_bias(dapm)) {
 					dev_dbg(component->dev,
 						"ASoC: idle_bias_off CODEC on over suspend\n");
 					break;
@@ -784,7 +783,7 @@ static void soc_resume_deferred(struct work_struct *work)
 
 	/* Recheck all endpoints too, their state is affected by suspend */
 	snd_soc_dapm_mark_endpoints_dirty(card);
-	snd_soc_dapm_sync(&card->dapm);
+	snd_soc_dapm_sync(snd_soc_card_to_dapm(card));
 
 	/* userspace can access us now we are back as we were before */
 	snd_power_change_state(card->snd_card, SNDRV_CTL_POWER_D0);
@@ -1590,7 +1589,7 @@ static void soc_remove_component(struct snd_soc_component *component,
 		snd_soc_component_remove(component);
 
 	list_del_init(&component->card_list);
-	snd_soc_dapm_free(snd_soc_component_get_dapm(component));
+	snd_soc_dapm_free(snd_soc_component_to_dapm(component));
 	soc_cleanup_component_debugfs(component);
 	component->card = NULL;
 	snd_soc_component_module_put_when_remove(component);
@@ -1599,8 +1598,7 @@ static void soc_remove_component(struct snd_soc_component *component,
 static int soc_probe_component(struct snd_soc_card *card,
 			       struct snd_soc_component *component)
 {
-	struct snd_soc_dapm_context *dapm =
-		snd_soc_component_get_dapm(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	struct snd_soc_dai *dai;
 	int probed = 0;
 	int ret;
@@ -1652,8 +1650,8 @@ static int soc_probe_component(struct snd_soc_card *card,
 	if (ret < 0)
 		goto err_probe;
 
-	WARN(!dapm->idle_bias &&
-	     dapm->bias_level != SND_SOC_BIAS_OFF,
+	WARN(!snd_soc_dapm_get_idle_bias(dapm) &&
+	     snd_soc_dapm_get_bias_level(dapm) != SND_SOC_BIAS_OFF,
 	     "codec %s can not start from non-off bias with idle_bias_off==1\n",
 	     component->name);
 	probed = 1;
@@ -2130,7 +2128,7 @@ static void soc_cleanup_card_resources(struct snd_soc_card *card)
 	soc_remove_aux_devices(card);
 	soc_unbind_aux_dev(card);
 
-	snd_soc_dapm_free(&card->dapm);
+	snd_soc_dapm_free(snd_soc_card_to_dapm(card));
 	soc_cleanup_card_debugfs(card);
 
 	/* remove the card */
@@ -2156,12 +2154,13 @@ static int snd_soc_bind_card(struct snd_soc_card *card)
 {
 	struct snd_soc_pcm_runtime *rtd;
 	struct snd_soc_component *component;
+	struct snd_soc_dapm_context *dapm = snd_soc_card_to_dapm(card);
 	int ret;
 
 	snd_soc_card_mutex_lock_root(card);
 	snd_soc_fill_dummy_dai(card);
 
-	snd_soc_dapm_init(&card->dapm, card, NULL);
+	snd_soc_dapm_init(dapm, card, NULL);
 
 	/* check whether any platform is ignore machine FE and using topology */
 	soc_check_tplg_fes(card);
@@ -2191,12 +2190,12 @@ static int snd_soc_bind_card(struct snd_soc_card *card)
 
 	soc_resume_init(card);
 
-	ret = snd_soc_dapm_new_controls(&card->dapm, card->dapm_widgets,
+	ret = snd_soc_dapm_new_controls(dapm, card->dapm_widgets,
 					card->num_dapm_widgets);
 	if (ret < 0)
 		goto probe_end;
 
-	ret = snd_soc_dapm_new_controls(&card->dapm, card->of_dapm_widgets,
+	ret = snd_soc_dapm_new_controls(dapm, card->of_dapm_widgets,
 					card->num_of_dapm_widgets);
 	if (ret < 0)
 		goto probe_end;
@@ -2246,12 +2245,12 @@ static int snd_soc_bind_card(struct snd_soc_card *card)
 	if (ret < 0)
 		goto probe_end;
 
-	ret = snd_soc_dapm_add_routes(&card->dapm, card->dapm_routes,
+	ret = snd_soc_dapm_add_routes(dapm, card->dapm_routes,
 				      card->num_dapm_routes);
 	if (ret < 0)
 		goto probe_end;
 
-	ret = snd_soc_dapm_add_routes(&card->dapm, card->of_dapm_routes,
+	ret = snd_soc_dapm_add_routes(dapm, card->of_dapm_routes,
 				      card->num_of_dapm_routes);
 	if (ret < 0)
 		goto probe_end;
@@ -2295,7 +2294,7 @@ static int snd_soc_bind_card(struct snd_soc_card *card)
 
 	card->instantiated = 1;
 	snd_soc_dapm_mark_endpoints_dirty(card);
-	snd_soc_dapm_sync(&card->dapm);
+	snd_soc_dapm_sync(dapm);
 
 	/* deactivate pins to sleep state */
 	for_each_card_components(card, component)
-- 
2.43.0

