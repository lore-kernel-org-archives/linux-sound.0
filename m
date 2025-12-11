Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EAB42FDC4D;
	Thu, 11 Dec 2025 10:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765447375; cv=fail; b=hodgk8oVprB1Del1tFk5+pe3rUBNq2YcixkcFIEveC50HAR6MGYM+gvyEYmpy/15begLRH1SOQVNoUjUBubSOpO1TbGF9qzJuqXhE+fid9oZieLFvM9dk42nShAe3ovcU+jqwS/JNISnD17BfrWHddsZpZKWDweNZCmIlX1qmtE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765447375; c=relaxed/simple;
	bh=rXQw3bx0j3J52UXpaiAmmGaHXuj3QjsRG1t36atsOf0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cJpGcSLzEiJ5xit2aiG7rfryFWjRmphg9LJ5/xgwhckP4LOGHItoeeLjMsSCT3vJ3a6YpW3mlvynBHVDQkNrxc8ssYLmjYRySTvCXpDmB6YvVVmOQCGnm0+iAUgKFNabSajw8ZWPVUx1+sCQoXCjeB/BsyHRf8kOUNRew0MG8B0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=UP+GbHkO; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=w6u6IaAE; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="UP+GbHkO";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="w6u6IaAE"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BB5uh5i3709436;
	Thu, 11 Dec 2025 04:02:29 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=FPmJFq3Gug35CXft+n
	rO6emsTV3m0ce9nFPqv6/WLBY=; b=UP+GbHkOLhlLWpnfxHyQxhsD9vqEtgrVm0
	tDMMX3abaTKGDCQoYsARQVxgvB1E0ybGDb3+F80NUIY/i43cDcmQvPQB0shzap8q
	aMmyUeM8kWQvl79Wy0NksSlWPviwAQ0Kx4svwWAwanMAcabjTU4eBb7TtFw4kLzs
	N422l1C4lpR63pCCpIUqV0U+3BkxMvO/2HDbmY3mF47XCC8GpBTjnHEvJqFIV9J2
	hG889Bn0jnwbqioL01LSBK1SZwXqkMgO3wMCk5S+xKomyKpFJwRHd+L5R5NsRqu3
	Yk9SDFFDylr3vn//qtggM0RJXNqP4+k8RFnN3nbrwZi3FfSPlNKw==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11020136.outbound.protection.outlook.com [40.93.198.136])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4ayp6p08hn-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 11 Dec 2025 04:02:29 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rxvcJkdQCH7SgxqdoXJF3PodsJx+N8C5bqUCShRL4fP7eG1YhlH/BbU9e5NJjiCRHeGpByrzO2aTkbWRvKJ3HhIH5SxKNhbMS0OTbsIQAlrR4Tgf+pZUoq1jZ+6FxIAsi2KGhTIr8aNqsOQ7S6eIYmFOM4fhN6iQfqCG61bjPqNRaucaS1Vcr+/l/GVsBcwIXHzcRnaDLkLa1c/5T0vgKFdStAu8FlulkNs//SnfoH3TofMk26mD43insfBFwbPRmYC996/lbXV0HAs2fwpHwXnPZqh2SmNA7h7ZQba+6X3hQThU+cJLmcjifsqedoMXhGl5ONoicn/g98CfdaKmtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FPmJFq3Gug35CXft+nrO6emsTV3m0ce9nFPqv6/WLBY=;
 b=TBDkIJ7OP1i0OlMN+0/tbuP5tkulCxP2EDjbSCD9eH3znnFqaytF/7YxCwyO1sLI/wm0PgRw3ToybhUQOqNddj2OduEWRg8DAiaEChqkNxQ/OrF1aNQ1dEuM0CE5oe79zc4lmyw+RvbmWErqWx71tEUr4DhLN1Ft1tWW7bheUUonmNaP6Zgj4m52tvUU5GEpHGKR5yGiI9/cPhK+mglPkBAA1B1PhP0LIOH+zvD25BF/YhofLOGe0y0VNp1Hmd/0a3wp5g7KIqXWD1SfTe7lE98Jj59yGcNhYNlPYwMCwdvMiXbLgIFt4ksDpEZzi1XLTnIKTVPQ96TQW+MYZRwV+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=bradkelley.org
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FPmJFq3Gug35CXft+nrO6emsTV3m0ce9nFPqv6/WLBY=;
 b=w6u6IaAEYZ9dwUTAIgZBQhWpT704soAsNuu+ExI9+bNDX9apkELboFSHkCaXMUEkW9L0xz3rHovqnUH7LWLvw8jHpNnQLvNvB1PtSQtWlJCO8RcmGmM3bwGwaRkMZnYDqv1hWrlr7IXWfPfzmy7AgI7satFjfpNmD45WR9pxsgk=
Received: from BYAPR06CA0040.namprd06.prod.outlook.com (2603:10b6:a03:14b::17)
 by SJ4PPFCDF0C5BAF.namprd19.prod.outlook.com (2603:10b6:a0f:fc02::a52) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.9; Thu, 11 Dec
 2025 10:02:26 +0000
Received: from SJ1PEPF000023D7.namprd21.prod.outlook.com
 (2603:10b6:a03:14b:cafe::8d) by BYAPR06CA0040.outlook.office365.com
 (2603:10b6:a03:14b::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.7 via Frontend Transport; Thu,
 11 Dec 2025 10:02:25 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF000023D7.mail.protection.outlook.com (10.167.244.72) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.0
 via Frontend Transport; Thu, 11 Dec 2025 10:02:25 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id D092C406540;
	Thu, 11 Dec 2025 10:02:23 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id B7951820247;
	Thu, 11 Dec 2025 10:02:23 +0000 (UTC)
Date: Thu, 11 Dec 2025 10:02:22 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Brad Kelley <spambake@bradkelley.org>
Cc: david.rhodes@cirrus.com, rf@opensource.cirrus.com, lgirdwood@gmail.com,
        broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
        linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Correct a typo which inverted the reset GPIO pin
 sequence.
Message-ID: <aTqWrhjVbySDTtQ6@opensource.cirrus.com>
References: <20251211051628.391435-1-spambake@bradkelley.org>
 <aTqRXbdAaV++jdHZ@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aTqRXbdAaV++jdHZ@opensource.cirrus.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D7:EE_|SJ4PPFCDF0C5BAF:EE_
X-MS-Office365-Filtering-Correlation-Id: 8360fbdf-112a-43ab-299a-08de389c62ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?lQEcjR23875lIdvl35LctNkgTBPKjsP+mGQe8cZDr5Ls51rpXE4Akmv4Zd9X?=
 =?us-ascii?Q?OlrdWJfGO/wo+IMCqAkweet9oxzJp7iX4wJbZfuSaiMINk8RO7tsV0TS4xBc?=
 =?us-ascii?Q?F21iO5DSYTUa51sWTQ6srmFhMBJLTNxiPAwtEGFdPsKV5/GkX/kT4KzwkCQh?=
 =?us-ascii?Q?QXTzKe5ZVZ6U8IitDSncyVQyA63aKyxkXVdNeARrGbgzK3Iw2O2peU8ddbEA?=
 =?us-ascii?Q?ZHwNck4h4P58w60wcuWXFXccl2Fa4Z4NamRbviwJ46JimO1e/XjXJfRZb3iL?=
 =?us-ascii?Q?W3WG6DxNuvdHOk5Hm5n2JbIeJvkWBWevWWgB8mAOJELODOaZh/6s6nI7LbF5?=
 =?us-ascii?Q?E73HyOL8kUDr1EsEhmagyGKF4U4k0pPomiBC0zvTsL4LCg4zlRvwK9MzDXHW?=
 =?us-ascii?Q?M4YU6QvBFWuKmFRRbxWLWSr5s4QfjnShbYQY8HU0KbIFushcXT44bq3k7Icj?=
 =?us-ascii?Q?DkAnCRtGpq+gfJc3TfEUhtpwnlP7qVimiiB8UQ4YgeNKGPLG3lyQ6wmLfCpw?=
 =?us-ascii?Q?kVE00/ZBWMGqM5hw930BJgeW7S/XoMIXG/NbLOHAceAGhM8kZV7F4cHUHjnb?=
 =?us-ascii?Q?wJlpjxdOywrzNTrHtMqM29XaJZgTA0vewfK5v6SqLRW2GzOCmP8aCZ/OkoGV?=
 =?us-ascii?Q?Y/VyLyoH0pbrsZQlwfTdGJBKluwhVjHGbCM5dTmEY/Sa9OPQDvRVKrNtnOSs?=
 =?us-ascii?Q?pGZb0r44MoyG6wx6JGw/Lw22JpSZbrL6G633w020PLvCGujw96cYaITAeULr?=
 =?us-ascii?Q?BYrnVW5o05Nz4+89pYf8M+M5kSUQlaBWD9W15hALelTPmTxOA4ZGOwIQAmgc?=
 =?us-ascii?Q?SQHUoivQ5xk85JgSlwzxO3EY60P2wwU6fW5zMG8+AKLylW5hCw3/afSVxEMo?=
 =?us-ascii?Q?5psGofzOzwwyT3I0/tUHP8DbGl/B9Y5iFbXZBsjUrFOTcZw1JNTaolQx5wwF?=
 =?us-ascii?Q?P7UV9fK+C5kSiz7nuH/CgP+oWsTCwXWHsRWzH6aU4CzIyQ+vJNnIMp0Q+adk?=
 =?us-ascii?Q?LxXwJLz66UTDQyj1jtKGf2rULyKgcJ4CMUPGVbybKyiCMRIfnB639jY89Ok0?=
 =?us-ascii?Q?TTFnrVXtxvgH4rD1S8+/s+MWjbuA/kLAuwYkLBeMIriYj/Rp+pI0gz0wZN2n?=
 =?us-ascii?Q?muxeeRpftGQz1piLAiZFYND+2NSfEAdvIXsxKSAuGHaMtlHsWgU7p3XGBmyd?=
 =?us-ascii?Q?Ir6554cDGjZAbUi6G7WAUE27u5B/f3CK8Cj9p8CiDuAe0q+z8fp2oKOXuku1?=
 =?us-ascii?Q?tef5tHXRHI6vH0nmXHhLqe1QMH1v4PMgaHCnM0hK/5VME//ByzlzYsg2I2ak?=
 =?us-ascii?Q?Bi+PQt2GnxN2237ht4LxP6i4xI4hleRxG69zAiqod3HZYpkkKisg4j4NCHed?=
 =?us-ascii?Q?WQvF6HbwCaeQv/kvl3jLQ7PBhbqO1MC2Ogmr1apUAl0z8X9Z4lyOHxRlkYaE?=
 =?us-ascii?Q?wic6fzqdxo91OosU0Unb4gBDehUBT/PxnA6iTs6BZrhtRy86WS2g8YNYHhim?=
 =?us-ascii?Q?15zHI7vCbPat/B20yHUZKdkXAhNwxU3XdXWAJZ14x2qB/nMie/mclHlYUcax?=
 =?us-ascii?Q?QUOpFSwOOyu6Qi4WcJA=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2025 10:02:25.5569
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8360fbdf-112a-43ab-299a-08de389c62ec
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ1PEPF000023D7.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ4PPFCDF0C5BAF
X-Proofpoint-ORIG-GUID: DD7CPXfTPPOACxXa_VLl1_p5MSjD0evN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjExMDA3NiBTYWx0ZWRfXxHpV7MksED5O
 hZ19pVIC0tImkI+bHnu18+JS6mJZVEt54bDNWA6Cf1XTl82de+qh2URoSIw2wEPyX7KSMwLbphU
 z3IPs4UUIx1cfwXk+pSp/XaTmOaOUqksKMpSGX1WfkrF59SLsCnafBMGUYOnBqhANVRuUxb/1nB
 d3l+r09tvW/kfUVd71UXGkur5LoUmxB8OjLV/BJcHGlqcp7kylYn4GalT9CR/sH3UjjVwuhhAmx
 8d4JPJwORz8tIek2zlT2lyD8C/Fww0rjaIUwTBbaTrjhmrsDP4vH0ECYwH2uzEg2345qE2mc+yN
 KeKdsqgZG9vcSTJOoBeR/BKvYmPEjhpOvuujQZGyzEM+4Nwq4cSo+u17XuSHcCFQj4uuPf8tzqh
 Cb0wmLbf8xsCh4zHk9jxf39KekMjdQ==
X-Proofpoint-GUID: DD7CPXfTPPOACxXa_VLl1_p5MSjD0evN
X-Authority-Analysis: v=2.4 cv=OYWVzxTY c=1 sm=1 tr=0 ts=693a96b5 cx=c_pps
 a=N0p9dsNkTmNcAxi3Eyz8Mw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=wP3pNCr1ah4A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=e8Gt9DsHvHxrfWqLiokA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Reason: safe

On Thu, Dec 11, 2025 at 09:39:41AM +0000, Charles Keepax wrote:
> On Wed, Dec 10, 2025 at 09:16:28PM -0800, Brad Kelley wrote:
> > -	gpiod_direction_output(cs4271->reset, 1);
> > +	gpiod_direction_output(cs4271->reset, 0);
> 
> This does look like a bug however, the GPIO should clearly still be
> an output. So keep this bit. Also could you change that commit in
> the commit message to a Fixes tag:
> 
> Fixes: 42d1178d223b ("ASoC: cs4271: Convert to GPIO descriptors")
> 

Apologies must still need my morning coffee this is the initial
output value, not the direction. So should also be covered by the
GPIO_ACTIVE_LOW flag.

Thanks,
Charles
