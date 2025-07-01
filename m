Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010059.outbound.protection.outlook.com [52.101.228.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C11B7494
	for <linux-sound@vger.kernel.org>; Tue,  1 Jul 2025 00:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751328631; cv=fail; b=AYOoXuiITts7N4QMEWyfRyNFID8l7PdPTkYAfbWmVbxFD4a2P2fGrEGLbXBML4M5xXIfQzodO2lgwoKIf2Pr2bt6z8JVu4nJ4pR/amKLhjYNPeCSbmLkkqe1J7viV+cgf7LflRwI4TgEJhaaecFOMI2FasmFCevafvCDYcP+Djk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751328631; c=relaxed/simple;
	bh=MWGZZhvr3ojjqC5r2znzCZMcKIHe8245zStaVIAStro=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=upqd5+wHtI1EnWX+29kCn2Rry1YoQo+sazZE9VI4B00ekVXtR2sOPCL6E0M/EWoDec89ovcjrzTuClWRMmyBPl4v7EMdjl1297v9q/gb653Q5pKVJqva0pfGArwMg/uH7jVGA3E5UTEybylpcS8UQeisZOzxrD0FlE3F4x2fF5c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=XahxQrUi; arc=fail smtp.client-ip=52.101.228.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="XahxQrUi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I9WVxDCoEgYxlra8nOFCtha4fDj5BXhWNN+Prv1PWdmM3pupST8iir2/opQtipRMtHytau/DKYCFYzkm5c3zwAixjcrZbg6mZ7h3vDW/djwTIUizujy4ZgT7Dd7DU9wtQqASbfJcuRuIlxhEsnmHfMJx9WUwyluOH8r1sZpIeICvx33lPfQUuPjfclRlYR8bDxMSZhwzbSX5XTdmAJ+22Nc///fKvDcmUTHKTmEOTs3NSELbwPWG445hRiN0u0wBoaobsFTKzRfh6DLxoo/4f4IL93e6oFXVjJMBiFGVCV9rU4gdCAb1EcTxF/DXyRniJf3oOxmlDPQ0ydclMiZnIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DPuIzc/+xsA8+xW5cm4ZuQMbDhv/sTejWgMz7EoDxNo=;
 b=I+OlEyc18MT52/zsEZVvdZS6kizCD/IHYrv22PC6quoczP+OJiTqUid6od+eVUsBeVGWmjnrPzNQjLSrml1p711DB2Z27dIDrH5Yph4LpX/9AsSG/0hlxN6pHdf5NumudMVayFaukRgu5vmOInSvDjQdBDy5GMwJu9KtGJv6zQ26CVX6HhsgVXCIqY483UCbbH35Oi0P1jqrX/FH612+PqooCl4ip83ZecnxfdEMVkz5Ua0SSdyL/dB7FGVtNTxecHHIhIFr/CJ/KB4Ff9ioCqnKp78HHHIbxv6DKtWY+vmmlOZDwfnd4A+qRXEB4pgehMP79M+k2EC1bAW9bmmWPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DPuIzc/+xsA8+xW5cm4ZuQMbDhv/sTejWgMz7EoDxNo=;
 b=XahxQrUi1ammXv51zt4E9V/3bIdUhnxap/ahgpwKJ1m99Z5x1TW2uj+1xo951x9LQOEnRGI2pQ8zZivaAyBWnR2xX0sAfON2osn+5fi/oCT0G+mrkQfZhlVVR50KjAhQNhNuWaKo2P3ZOz1Vz2XU/ME3rQp6W9ekwfC4hFjptjA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS9PR01MB12421.jpnprd01.prod.outlook.com
 (2603:1096:604:2e2::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.32; Tue, 1 Jul
 2025 00:10:27 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8880.021; Tue, 1 Jul 2025
 00:10:27 +0000
Message-ID: <87v7ochitp.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 02/11] ASoC: soc-dapm: remove EXPORT_SYMBOL_GPL() for snd_soc_dapm_free()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87y0t8hiue.wl-kuninori.morimoto.gx@renesas.com>
References: <87y0t8hiue.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 1 Jul 2025 00:10:27 +0000
X-ClientProxiedBy: TYAPR01CA0077.jpnprd01.prod.outlook.com
 (2603:1096:404:2c::17) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS9PR01MB12421:EE_
X-MS-Office365-Filtering-Correlation-Id: 1abbf934-2164-42ba-cf4f-08ddb833aed4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?E++qU97Kb/NUwJeoGGX4YwWzJpCf66Fjxk9ACQyV6Qvz2pHPJpKXIM3XuJGX?=
 =?us-ascii?Q?khbICMCvCAvQ1JXoILufAAOq7toyEFY+3EFh4C3/s7wkfY5S7gmIQNEwwOr/?=
 =?us-ascii?Q?HmsPzZDAGTVB8TL5Pq01cqIt6c/CkTJ/Nfh/pG8pKDYE+hK0JkqPsS7VjTFR?=
 =?us-ascii?Q?mSboEtQvmaM8Xl0gAmbzjdsyo4VD6PCXAfgKErRUggMnAYFHoqvqkrQsdD35?=
 =?us-ascii?Q?jOzk5QKbWFvIXBxr05sEf7KNA1fcBNosrJ9oqdCphENCjyh8n83PKsPLRR+m?=
 =?us-ascii?Q?33l5NtN/uV3uu+R/Rxcs5qVhlz99II1qtCyP+bvzessXm5pzreGDN6Offnfx?=
 =?us-ascii?Q?ScvIl0D/Rf3hmwm3LkwP2ar30tAySulD0m4Tl8zF1WmnmTVAANw8c2mkFCVX?=
 =?us-ascii?Q?GJUCXIynbJxnUVjBlnf53IlrRPL6qkRopyS5aq1bQFHp8l1W6AqyHOu8xH1e?=
 =?us-ascii?Q?7pL2KZ8mGi9dLY7yF+gJaf5NcEFplkdoCJhoWLt3EwN4JMXT73/dGfxG5nGi?=
 =?us-ascii?Q?h1y7ySqyi41djXrj4fYFt5tX+Kv7H4PUYhUpgXKsDp3GouBAmuXK3ZL21UxD?=
 =?us-ascii?Q?JaP5pAyiv7JRKUUWcBxxJnDQoU5XqvfcZP/RqVdUGhDRQmuZ/OmEmzEwg8P8?=
 =?us-ascii?Q?w50MvYbOWWhgLg66Cj8/WI/5BBnoO3Sc/eWfpV/Op5g2ZsPmlw/PQDNCVVFb?=
 =?us-ascii?Q?1S0obIpfxJG88mX/BhPJp8JW8TIDwgDcZbW35Zjk++dCbXUnKVdvlTkkxmsW?=
 =?us-ascii?Q?SbvHNyadDDSMD7g7tS9f9PtvLRY7MW72MthDtTAH4bjUbQ+dBm59QZfR0x1N?=
 =?us-ascii?Q?WEymEnXLmZqjKHCxXTKQNd1+jW0bJqsJHvKQPq7DVHAdZCvTBqKQYsR08xdo?=
 =?us-ascii?Q?4wtANBrNWJs77Mxt8mv9EpR2fKQpmeyhss3EBjU4INKFs9I9xcW++iSFiWVW?=
 =?us-ascii?Q?rwbnCmKkV+RhORi0WCgCRw402jAQpgqZhQw5C72yronNYcdy10+ORpBOz7ch?=
 =?us-ascii?Q?eOZJpmZdzlHMXtvRAHPoCdQfLVANX8HQciWEc4E9ISKHm/GeLZfV9jNGBXC3?=
 =?us-ascii?Q?e00Sy3xNAEooPK2EWzHvKTAc5ZB1Q3S1DeFF/pMIup5bySDLSoDwNvhxoV2C?=
 =?us-ascii?Q?c9EPa5yPPd0CqNnRLqcvMSnLXNuNHeiqTtvoKdthmsZEtc8/Yon8MtVI88/H?=
 =?us-ascii?Q?UNkGOd1m4GRazs4PwVREs006vgIx18FHbdfWGEY/X85HSDqJ1NKezev3a3qV?=
 =?us-ascii?Q?Nf/H9rIFy7FW2iSXX18RO0rjta3ZhbPq7OYxLPABnXOKZl1xSkHcPidOiC04?=
 =?us-ascii?Q?Frlr+XxHKotnJRt2MQdMRhcEsXEfohSaDMZ92+1rR5UMYRSIGTmBN7FnDVAU?=
 =?us-ascii?Q?b23y0SVSAounqwvlqIkr3OoCy1y7WrzRA9s3pIKlhGeutVC25jwQEZ/1I4C8?=
 =?us-ascii?Q?dMfjb8drTYjR67S/q1v327hJvrTwhp9G4OAa4zCOFaxHwQIdTb81Mw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?u0riq30ROa2k9CJ2tXWGbT2hEqE6z26YAD5xknlzgyo33hu2q/dhO4hBkJo1?=
 =?us-ascii?Q?eAEJ9PtD9XQ2nkJ8n/bs8VPTz0CfPLppmsXOyyPtZZB0TDNjfB2hlJgq+LO5?=
 =?us-ascii?Q?6vnEUX+7yIs3lS+C8mBEFR2qcBbAMtvl+9zTr88DsMZNrY5pqRHR1z6aN5KX?=
 =?us-ascii?Q?hknXcIMGDlgLbEarMeYud3eI35h1iqaPFAFZ/jK0G+6SYCcqhwLAUBKaJI3V?=
 =?us-ascii?Q?gdyX4RTEUZlY9gdkabJRkE9dwTMaoas+fm1jrxtjIHnwGU3wB10XOFC8vObM?=
 =?us-ascii?Q?k82s6207/Mnnxao9khl7C5AN+1F9tM4qK6s6neP2vBUraqh5Nlkagzirn3I4?=
 =?us-ascii?Q?d8/NPurMUf0YjeQF/er1ipeRGG1u6ZSN9h5td0MwEXsXol1jdcNKOpwgChBo?=
 =?us-ascii?Q?bunNmno0fH27XseS5JgDkWhcwjbuvUVvdoP7rkZbeNWLPrOlA4qJne3M3Atg?=
 =?us-ascii?Q?fm3s0WJ4DOvmceCgXlLFJabycLKoUOxHl/mmG16w8AoEmdNmTRBM013e3Pst?=
 =?us-ascii?Q?lo5vhX8SKxl1YfXoyKrc79HmbnpopFHQBdeOK+Vrf7vUQjEj7XOANIQM0F2c?=
 =?us-ascii?Q?ruIOVbOnKSNU2Ck8ftNyMfzg6So6SnCXD3TzVIVk6+1DJaADtQ5PxgdWJwWt?=
 =?us-ascii?Q?9s9G1KiSiC5mVfRdatS6rH4fsmaDSUrxw9tnMJbYHEK6EGMTWQp5eYjKzbbq?=
 =?us-ascii?Q?vpWEZFpHcevuGHOdBT8+JSanZM/lnx882HyAoS7pwurzoL4/NmgKFWUjyS8H?=
 =?us-ascii?Q?zpI/H4e7WoJY4xgYFz4/91XfeYM5jO45K4ZBOsZBGRa+dWdptMbFoLZRGTT2?=
 =?us-ascii?Q?kaQM0/YjniyEaRCN0m09eg7M9VrbE6jLOpvTsI5/TuRZ6XnJ4eWEeXHI5udH?=
 =?us-ascii?Q?y4/9++ZCSUILPVztk3yaq+5kooFg+bqh0Kje4nJmOxcP5cI1gWbUBFJ0mknZ?=
 =?us-ascii?Q?F12ikhenXuigAKQqnz7R6XJTet2tMavdZqRBlBjL1/F6WARcBwXF1o1a+FG6?=
 =?us-ascii?Q?kJBlHWuBBiustRcDT5zLpLLtWPYZ9iWHEnfHXMjezELyWdZ5L+K6Z4odOP8n?=
 =?us-ascii?Q?TDy+PhXzVsRwP6r46oYWCdqhQ0BKlHYe5t2BaLpF2oY8LiEn635rjxUrmqZW?=
 =?us-ascii?Q?dMNPI1ySk4pAwdocdkc6H4F3yqHg05ZHRKh5VVW6DDRb8cspmqPvFxIX526N?=
 =?us-ascii?Q?Fa4bgItnxYkh5IREfBFT9Ns8nNNGwG2NBf0no6CgmFSRlBI3bOzkYFoF+QI4?=
 =?us-ascii?Q?RbMNe9yZ7ORzoZCz5JnElMgD+PX0mz+Y54YoT7BlgsRK8pXV+SplvqC0Eq5h?=
 =?us-ascii?Q?phm1M0rSxBb3qbjJi9mYwxDbV3JAcjEdUwsPyWSE9K0pYVajAQmmbKFKhfJh?=
 =?us-ascii?Q?AXo780QJoET4k2c1JybSJiRIDMcdxGgKMLU1HixxN4r02YTg18GFUShPP46D?=
 =?us-ascii?Q?yU3c5sjR4CA66DzruIi+Px0XvNmlpvX+2AuDt7O5jioANPqrbd9peNsDgEg+?=
 =?us-ascii?Q?SPTttN3R4TRgWsQn0pMf4hU9Hv+Q3/JEY1UuchP8YAQ/z/uzxvGy9wcUKStB?=
 =?us-ascii?Q?bpznt1YS094P+UNz2nnOsk+7mUmqT8PNJyDJ2nQgKK4cjcr5xJ660rzmbhhS?=
 =?us-ascii?Q?7RaZLqfBbijXflbvfJrhby8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1abbf934-2164-42ba-cf4f-08ddb833aed4
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 00:10:27.4856
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: azXNDptl79pl44cA0/jYtdJ3rwgmdipKCxdIWaEyhjR03hAesHj+s6lDrmqIRsNPHdsIZpF+dlKtKqcc5pJmr1vtXKRh+LqzwnMu9vdiJOCHyhsx0B0wHtp6FoyIWFV4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB12421

snd_soc_dapm_free() is called from soc-dapm.c / soc-core.c only. All these
are compiled by snd-soc-core-y. So EXPORT_SYMBOL_GPL() is not needed. Remove it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-dapm.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index 091ab31ae42d..98b35600904d 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -4883,7 +4883,6 @@ void snd_soc_dapm_free(struct snd_soc_dapm_context *dapm)
 	dapm_free_widgets(dapm);
 	list_del(&dapm->list);
 }
-EXPORT_SYMBOL_GPL(snd_soc_dapm_free);
 
 void snd_soc_dapm_init(struct snd_soc_dapm_context *dapm,
 		       struct snd_soc_card *card,
-- 
2.43.0

