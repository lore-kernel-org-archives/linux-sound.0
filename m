Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010019.outbound.protection.outlook.com [52.101.229.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6AD218F2CF
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 01:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740533614; cv=fail; b=cRhqFs2xprDOSWMYSvFEdzoCuoUVMUUwDuB+7OTQTqz8ewM80jtRlxRXkzxllXVYB9VaSntwO9m6jA0Tldn1APdXjEMlWeluJZHQnvY468PwHmJno59AtuOeMdk10OHDu3RVFE8NH0RLKyFcdwxRuDalfpG3hI2c6c9r80Y9RQE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740533614; c=relaxed/simple;
	bh=W7Dba8756xYGTZ5v9bXKCNOlQBTvDWm/TSHmL39tdyY=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=rVb8FPDgVXtFfyJ4iQSgedTauV3quKswg+ZuL1tXobrBwTV+xszezFrq9uL89TjFMCebrP9uOiMU7rllum7hZhxO7jeZsQaw+Wmk1n+MKQ9o4hnrs/TgwflZ+TS232XncZFQ/GIvl9Z10IPyW2nis/Vwsyo74GkKcR3Qw/e8lT4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=k+nMM+jB; arc=fail smtp.client-ip=52.101.229.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="k+nMM+jB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WkjhVMih0gAjEwWOBoAbrHZGGxdPbYZ6pSpebGDu1Wyok9Y4AhGqvUMOROnFwTmacqjwS+XP+trbv2yH/MtFwYllzDmOIfnoi5qk6nylNNxiorqdes2GWbVkOkHhYBp0bmnOj99yv+fXYNWcpSU2axzzOW+CDcqK2JxuRqLNWh9M1nGeBeTK7D4DRrfBpDIe3ghC2jGf5QrBAijXwv390SiB3LcBmPOSoxLQH08h7EMkS7OCDZ4dMyy1nqoAJKP//R6V/oMmJgsOHwKACXIwwTCOy4x3CdvYbOYeRocpmY0lRAQ1BFaRlVYjnlnFFmGbQMVXcCUhmhAU1lGFAikgOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2VWZB61ERc+X2EltM0/+qnvNDxkbEa7phjnkeYfQrj8=;
 b=CzH1BIoKfVQYP+TI3aFKyuLshGoRblXYkKKY1/CBIojkzOSivVVnySnYXOYt03DMKONfSen2ly6gjpc/4tPeMz//SGqBswxLTIMrKXRAhFEy6qUMWOhkfgDqIwQt4fh/NlaPrOq3vwWibz9pKGPUeOgthuyL6JgXzmd8vBB6lmL8JiKwaQLdb08hbk8idib49+vx4hQOxTK3jXHHFKYJ0/DpGc6o+GeC8Uq0oYrPifnHIbE99G1Su0+nlheBuaQuNOiET9uVM6Fs0bRy1/qYD2h0By05mNojyQSbW6upKPtxTXyF4CEVCp2quGeGWop1oBPvwR2Wd0U84diaQQjDZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2VWZB61ERc+X2EltM0/+qnvNDxkbEa7phjnkeYfQrj8=;
 b=k+nMM+jBY0mWwgWl//Ysw0VcTib5BvD/tzQIjwK0CnC95mGkCn8AqsRrQbb1ZEIydVW2ypiSehl4tilHFXw8/y/KRURpf35bLcVvYY9JorKCiHb/RmDHzfUPbOiyk5YXmDGCkGYyVaD6XbIp2QvKB9mL90hksRQbsYAtV0arZNg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB8745.jpnprd01.prod.outlook.com
 (2603:1096:604:151::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.23; Wed, 26 Feb
 2025 01:33:30 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 01:33:30 +0000
Message-ID: <87bjupebh1.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 053/157] ASoC: codec: rt5640: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
References: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 01:33:30 +0000
X-ClientProxiedBy: TYCPR01CA0176.jpnprd01.prod.outlook.com
 (2603:1096:400:2b2::18) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB8745:EE_
X-MS-Office365-Filtering-Correlation-Id: 436c57c5-8063-487b-cf7c-08dd56059387
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xnwFqNX+iCOwqptqPtt8AmZPw/+DwDfGcP5rGvQOeu5/K9ti1nzQ+fgnGNVy?=
 =?us-ascii?Q?V6rZzV4Gu9+94DA3sI0srTBuGUG2QbMtk7qEn7wWC09u7kqvrQzLMhdrlPSg?=
 =?us-ascii?Q?2gsyqPTIle+oKR4v2vHCBD6tNJtUoZlqKEgfS82wOpW2BuM02blkXhflpiG2?=
 =?us-ascii?Q?yjouSkdIAIjG+O2olnZjhzuXTCCWHDm/S2H+IEpo1tUsfZx2VSUViemgHfbG?=
 =?us-ascii?Q?wtykVAqJN2fGusGn0QtgmsmzNS1dCRcKCFbyFfMe9qiUnKacaDiP75WmMI38?=
 =?us-ascii?Q?gfA2QYjZAJRbcxubTOt4Rm89xMDytZbdbv2tKn49G0RgG/Zf4GszRnmjiwSE?=
 =?us-ascii?Q?EauqzpIqJTccm5pAUxyGtQnNnNtCY8codDuAwJyQPnLZAip14gzjVM5Rlmg5?=
 =?us-ascii?Q?VrvJM/kV2RW2kafhKCXkhSuUvgL73mvHT6bF29dMDy1FNk+XXugIhxgfvsfE?=
 =?us-ascii?Q?81q197SnhYNE9/36nVYH8SGZhhhHx1kQ0Lo/oZwzC4GzEVXmG3qHEjQz1g2V?=
 =?us-ascii?Q?DUAN3nK2iGEQnluLYNbtvRPGPuvXeynMYy8tqvt1swaUHpSuEKsxSDcCvvfh?=
 =?us-ascii?Q?aikZzezL8hqA2n1ZnAMSZrvzgrVUFHXvkrEJ7WTpz15te5ejFGrv8pXggHb0?=
 =?us-ascii?Q?g1xqpp6CBUXFZLVsUCHCvpY6GCwI1wUryMUJrMNlyRkXsLE9VINHoOMdqpbV?=
 =?us-ascii?Q?hv/H3YA/qXZ1wazR/Lo83LMOXTkGSuqXsXBvIA9CCctjUnAb5R5wiW+NSZdN?=
 =?us-ascii?Q?PnQxV1VHFNygP+i/F2+Dx9EHUjaY0OksHU1WTTDsUVZ1HC0HCwX2F4peCvaX?=
 =?us-ascii?Q?t9J7e6/9hfZT/2JUHPBEQCHyRVTl7XO6A8JkCrFt3VPQcUe+jlPshfWfb185?=
 =?us-ascii?Q?BLDruyEPu893hGyd/9w7SLogJ095hWztfOozuFmAc+nGGXYBKzP5Y9HMnv7v?=
 =?us-ascii?Q?14vYgWsvchFJxL7Or+7dxtYZFGYVS/1gKaahH6AppK84IccdMe7PulVetDrW?=
 =?us-ascii?Q?bg36B8Fd7h4UfEj0MWHJ9vSXhGcjtkrL8EH+qJ3f79r7sVnwJOFyQUns5qLz?=
 =?us-ascii?Q?ZWj/kOhVGC7XEEaYIxKSH0MX6j7Sqa8wBEvZeiDsiYJnTLFWm3ZKCy6oDGUp?=
 =?us-ascii?Q?0xSNTpzrJgTQT3LmaBbNkqrTVqvHxlvWqy/ApstUUpMKjg0F9IV6KBvoed/s?=
 =?us-ascii?Q?SK6Yw96zkM9IKXxGYeUmq5qvKp+6/mQyZxW1kloRbRABqOW1lfVY2Q5j+wlx?=
 =?us-ascii?Q?2BXKEEKiFpk5zj5ooSV6yqsIuBfPvQZJvc4TDseQS4VW3tEBKUCpsiZtO045?=
 =?us-ascii?Q?gcIC9fRSxV/ZX3ZnyXmylt0f3fzSx5StQDfLA8/xO8UkpDyNNBB0D/0rdliT?=
 =?us-ascii?Q?IHsQnQH4o0I6bhY00gdc+GcRCb5ZCVLif5rsFgiDmxtKL7CeZ9PXhQTDoOoB?=
 =?us-ascii?Q?baMTJL+r01ZbTINDlpEb6SOyWJFlleGe?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ronIJqTVFNLP/oW3CdW5OUhcVwVwwmZo83uZQ1mzsJzwU4wHG9W9dJA546DM?=
 =?us-ascii?Q?O1T2gADD3GqgzpEks6JeF/ec/l3cuyLdXrddYwvhFesxkA9RWVQ+ZIpKDNdR?=
 =?us-ascii?Q?89gnXGId85vnuIqtZPKNtMfi9U6dwqI5C0iqkQl+7vrgnv0O+E6fzR9WyfJ8?=
 =?us-ascii?Q?c/7SmEL9O18ZvYVpw/x1vgWO0UdgNkI35YuXvqEop9zlB+cIr4Sio3JWDRcQ?=
 =?us-ascii?Q?7XA60vQtkqpISW3lg8lniin5+/0a+/7Pw8Z75oVXdu5GTYcQN8cx2Estgi+A?=
 =?us-ascii?Q?/mqQjcjrnGOqBoNpNqxAqVdymAvXrrs0La1MaHuEOzRsqHkT2jgL0gbxyQHB?=
 =?us-ascii?Q?srr234xERTLjHlRyY3zlpWUMQhj1Ejv+lT1Iohf5zuTzCxbmDlqy7YxWoaxU?=
 =?us-ascii?Q?R0oqyIWO3QN7yp0GOdtEXXgQ0jFoac+Wj2VOWzMKN7GNkuLWSm64IZWZrV73?=
 =?us-ascii?Q?qVdSj1ODzQbTaon+BHneyId0Q86JcWGEYx1+EU040UaHLldOjoliTuIeG+WD?=
 =?us-ascii?Q?wcfXa+QHkKCCadv/qyQtkjQwzrFSDfh5YyD6dgTEC7CGOK0tdoKXZT+X0hRE?=
 =?us-ascii?Q?SXDpK+0qMclBAENnGzJTktP4de1yz7qwQ/t+GPQ9NjvIQpxRlKpQuJFR/UG4?=
 =?us-ascii?Q?ReeufBZjnPdZlgfkB8TW3X1F1J7Lj9GUyLwM0ge8NbHB67geAYOgBk1Sjsc3?=
 =?us-ascii?Q?8y3dr6KYT0dCY8DyK0TXv5Y9OgijBD+pPp1ucz0C/x2U3PM1QvMLHRNjTVGg?=
 =?us-ascii?Q?0glnIOH0BK9auLpUeo7HQZB+tgNkVev0SvYapA7/UMT/XMrkJrwgV9+Teq3d?=
 =?us-ascii?Q?uW9RHkhunLbEIO5+Wc/VFWdsnTq+pYkgaPQxExzYwrMjRkmqLyxB3LlAzsk/?=
 =?us-ascii?Q?99JPex5svAWhdLp0PyksNYOCbCElVLCTVtnpALLPnQl1pXVavN3K6YlHBMro?=
 =?us-ascii?Q?8WRLL3HZXsdEs//JOVOr7+Aa5rxmmEhbHLUX/0dyg+wSM2t2HNjShmXfsNUC?=
 =?us-ascii?Q?cMXuoF6OEF8YaOMH4c4paP+2L93ZIUiHWuxMAEsYFYB94cRWhXmuBrn1aCXN?=
 =?us-ascii?Q?oZFCcdy7uT9G2Dpcd61DHaXdeo21Ys/kLwsnyoTtJVyZu7n0Wb/5rjCiNsiw?=
 =?us-ascii?Q?KdWMqDedyddteAYNLMflUIuIoIM2GlEhPm6H4VG8OiFKIR4nO9XFDFitZhHJ?=
 =?us-ascii?Q?H28QKKv9UWZmVWLFI1qK1IMu1linOITj4g80yBWB7psaW0j023uWnS51wRiP?=
 =?us-ascii?Q?8nPIQto+UNv/tbWdfvvFR7BqQC0uyGsvOOKE6SQPlw59Jog2u+XO4tiHr30r?=
 =?us-ascii?Q?WPM/VYMArZI2Fvb2LTDsyydETnWjj6TAbBAa67PuRtqWHa/LuJWw4kNAgzqR?=
 =?us-ascii?Q?XCpB2hloZZaxWBqZYeKfSZIz261zQNgpmX43gXjNj8kPhc+ZT/1Yth8R3ZFv?=
 =?us-ascii?Q?mgsgCTNsDm6jbZwEc5v1VQJCLdCrGIYIBjDj3HD1tz/Go2KQ18BQVnT5L1kH?=
 =?us-ascii?Q?HsFtW51DbsPLnyGOt2uPQZ1nwVwxi1/H1F8vuNv1bpdHy0WXRKwqhpeObB8M?=
 =?us-ascii?Q?bdKnAmdBjWWCPaTsagHMWuviPheMBTszq9mIm0AghgmLdDVD8kUOy/pwd+e9?=
 =?us-ascii?Q?uWFB6U2a/iuVMvawnRC72nw=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 436c57c5-8063-487b-cf7c-08dd56059387
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 01:33:30.7759
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HxDoC3iesQC50NM1EBSj33WGOzolnxiJ5Wm54KeA1xKrNEIs2pDM6wYHELHMA7ABt1CTi8wvfFHEAORh4wJ/+ACkAlQCzxkrTM1FPeJGju45UP75W/+Ocn7m9LimLRLK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8745

In SND_SOC_DAIFMT_CBx_CFx, M/S are no longer used. use P/C.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/rt5640.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/rt5640.c b/sound/soc/codecs/rt5640.c
index 855139348edb..bf5dfcdd36d9 100644
--- a/sound/soc/codecs/rt5640.c
+++ b/sound/soc/codecs/rt5640.c
@@ -1773,10 +1773,10 @@ static int rt5640_set_dai_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	int dai_sel;
 
 	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBM_CFM:
+	case SND_SOC_DAIFMT_CBP_CFP:
 		rt5640->master[dai->id] = 1;
 		break;
-	case SND_SOC_DAIFMT_CBS_CFS:
+	case SND_SOC_DAIFMT_CBC_CFC:
 		reg_val |= RT5640_I2S_MS_S;
 		rt5640->master[dai->id] = 0;
 		break;
-- 
2.43.0

