Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0464E2DC77F;
	Thu,  4 Dec 2025 11:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764848890; cv=fail; b=XCs8e7sQ2BWShgj+uT35UkdK3QHAtczIqjppjyBqWyVyJsL2XmYGbVVXIuwyHNeESykMSBrNuWPqP5plNFoarXF9QMdh0p9QsHW+Jl+BsuIMWp5cfcRbt/I912SgTx8szM3hBxt3iMTi/gF0dr1UPyy+Snr7SD6QMxdMwtobFuY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764848890; c=relaxed/simple;
	bh=pOpFuIcOVFhUS7t6wf3jE2bSYwgHOZiHYO/Hr8N+AIE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N3sxmd6ohirFnsJPjQSbsGiVB2ypPreRhrCkwzGp54nkGwPQQbfjljKPoqy4q3mZdYjSQqrtT7AJ+dsRYYWgrY9M/4LmEWFupBB+7VPdO6j1m9qnP7AOTuNSI54IEyjSnKUagiZ7ITwD85kw+x75C9iGH6woZbRXc+37DBQx0hQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=BN12DR9Y; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=sokORM1i; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="BN12DR9Y";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="sokORM1i"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B46vMVT1061970;
	Thu, 4 Dec 2025 05:26:27 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=RJbLpf4UnYGOOzpTGy
	xhjKN7iTMBrEiFgV6759DV/PI=; b=BN12DR9YlM0RRGBc7oz2LmxyoVAqraMO1G
	ZltSN2HtKoaqcDCMPJGrfhzBWE6DlviKHRmvqX/jl2tTezb7REocUPArYrW/Ev+8
	2N0Fq/rEjWGcUV7aj/UcnBcR7bKTOAnQNRUAzASOZ4KNr9K41+ouyjoTSolyGneU
	GCnef9Iwz8vOmJBeyyokOejr3KIwrcrmrsx9BcFH617QISWCcBQzSxFaIZu5Id97
	PhTnWxPeTeOga6weDxO935Kj512QhuQJr3PYu1pv43yG4AEjtGBp4YUyhhQ+JQsk
	+QzwEZ7cwU02nuqQZzdPbWLQZ8ZPOqRLS8QGWLvjkuZ3r99ITBcA==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11023125.outbound.protection.outlook.com [40.93.201.125])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4aqx4kp95n-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 04 Dec 2025 05:26:27 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dr1kIymdKaUjClUWU0J69RLNiHibad8wZ0gz1raj2tpzpPs2Hw+uwrIEdhFmSPVW0IPCDihiIYIwzXAsExKH3cfuDwTvdd5sJ4Xh1TmRID8A+vh+C//HKjD5HNUxXOsJYIykZXt6/HioPFfq+IQ4Lq2iPBwgsaWEZeh99V8QTSXnsauxZjHTTr8tXWGEdT0enan31TtqXadJqCNoTAIoxi4vX7NWPK/NhXlR3rKf7HnvLoG4170VGbsrNTBv7k3jYj0dDT7PbNgPk1UIFSmrRP4mtmPNt1w3wMiARhZkrjrk5YOLsakkVXE66CxM2Lqbb2DLT6E18lC00qnGf0jCrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RJbLpf4UnYGOOzpTGyxhjKN7iTMBrEiFgV6759DV/PI=;
 b=u53Yke9Q5SRjjx2T3MwImkFqbWPhooS4Sq3sujtiz5UGkPsxyUUQnPoePI5L/ou5qfxYqbuyciJYPVuP80tHQZr/C1dB0u3jPwKmyJNa5/AJehlxYq3Md5VJDlmQCo2wji2XeYs9XSEjJg4JhYorlcxkYP79a9Bcn1DlQaxpsYsgmHgud5ZoZE/WJJinHjPb5FIZlUIrppHIEX5JbLB08Ouf2fhqAgu84ghhLI/vbs4QPJWm4i9Hgoo7dSkeNNrnShNOmswK1kYTg3BHFiTqATMwNjcK90YwWoMmN2YMN2gtM6MkTFq6AtmrLcPm7ZQt0Ce9Ikyh9VjfOjqPNUJQ3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RJbLpf4UnYGOOzpTGyxhjKN7iTMBrEiFgV6759DV/PI=;
 b=sokORM1iDwQJjsLPAf6PNXXwT+px2FspxI97MDVZk/njQEwx70OKotaGSpl541RkxN0VmNqy5xdM84o58O9wVvuO1kw85xJ2BaisWK6A217isu5SUAzChhfiVJYTb3pXoN3DVc5ZIcWPKOCQODYdgK3eVrlkcgiiQkIkUnkVjiQ=
Received: from BLAPR03CA0033.namprd03.prod.outlook.com (2603:10b6:208:32d::8)
 by SJ1PR19MB6212.namprd19.prod.outlook.com (2603:10b6:a03:45d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Thu, 4 Dec
 2025 11:26:23 +0000
Received: from BL6PEPF0001AB73.namprd02.prod.outlook.com
 (2603:10b6:208:32d:cafe::22) by BLAPR03CA0033.outlook.office365.com
 (2603:10b6:208:32d::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.9 via Frontend Transport; Thu, 4
 Dec 2025 11:26:22 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BL6PEPF0001AB73.mail.protection.outlook.com (10.167.242.166) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.8
 via Frontend Transport; Thu, 4 Dec 2025 11:26:22 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 37F36406541;
	Thu,  4 Dec 2025 11:26:21 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 149CE82254A;
	Thu,  4 Dec 2025 11:26:21 +0000 (UTC)
Date: Thu, 4 Dec 2025 11:26:19 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: Re: [PATCH 3/3] ASoC: SDCA: functions: Fix confusing cleanup.h syntax
Message-ID: <aTFv2zyDC13VXg2R@opensource.cirrus.com>
References: <20251203-asoc-wrong-cleanup-h-continued-v1-0-5142be4874fb@oss.qualcomm.com>
 <20251203-asoc-wrong-cleanup-h-continued-v1-3-5142be4874fb@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251203-asoc-wrong-cleanup-h-continued-v1-3-5142be4874fb@oss.qualcomm.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB73:EE_|SJ1PR19MB6212:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a080e56-2b94-428b-68ee-08de3327f3f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|61400799027;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?oQ27FVhqks0WIcfqH6cGz3lhsWxFBzwECc54mNAyBaWGTUO+ExD2VG3RJJ3z?=
 =?us-ascii?Q?INe6SUH6Jqo3esQiw1hHtQsxhUsqWZAlBuLBJUBrxucCdBcUThhWitsOLsD4?=
 =?us-ascii?Q?FO1J0mKQ0zhiSPv60ltySzyUAvZKLCHPAmuwsIOfcjqLJJumJqiW2s+qOvF4?=
 =?us-ascii?Q?FkdrQ6xKgLnf9dUHIWkmE+Q0leUkuimGY3UGg1wLmNN2IKVIYxi8/FbtaHZl?=
 =?us-ascii?Q?D7To710WOy0c+VLiKztk1rngYgsSfCj468wIJi+VuHeC//1E8sYv9MFPkKe1?=
 =?us-ascii?Q?o8UQuCtgS80icZHwQP0boIEY/+lKSDaO/7Dc3VesvKvty5X2VxHbFYg4aJFG?=
 =?us-ascii?Q?EJHYbN8lW9KDYJR0X7+pcpdh46QAQHO0/C4qDU5CAWxL7LUHyIRwW+VkupL8?=
 =?us-ascii?Q?+UNHV8CRum5Wl4ZaRUpmQW3BVJMzvL6Sieh3Xxy/8b9ujdmjmMmx7nRgAxVl?=
 =?us-ascii?Q?C7i0c6kVn8omjyL5GFYy7FkX9+N5B59GHOplmIiAJhQJo8GqBwGbtaS3lLmj?=
 =?us-ascii?Q?gDu+MyxdWqJ5zxjWfyxq8INQzfMB02vd0xE/jY3enUZ4VMujO+3eLbKjXhFY?=
 =?us-ascii?Q?PuMV4QOh9it6+49LwfGfWH27Beom3fvLpSyp0yZWIXCS3QHwDHjBP7T/fLNH?=
 =?us-ascii?Q?kAYO5CmQoeT4UKbhKaCEUqmJiW7v1KsJJmbooufHiMWha9Ptze4qpboCz/qN?=
 =?us-ascii?Q?47uqjZ+S6efOYvqyvuxorXrAddZRr+fTxUfV3rDKH8VXZhQxyMDVZHVJSRqy?=
 =?us-ascii?Q?DCy+fR6YVFQ3V/HufUIsEmfXxVhGy9NStyCha/SLGWtCj6cbndsKXpWT8e9m?=
 =?us-ascii?Q?3O/k7eddZQDtfo+zEXnrfpAwrJQoygO+KenIu6EpG3PkA9WmVYWvKWYCVLuH?=
 =?us-ascii?Q?eBbzCVGEmqPwZTsvjfUDROHlJXWgN7eJRq/L5xKScpse0zMzx1WHhJ6fZqS+?=
 =?us-ascii?Q?5hZ4rKBoTEFk/JJPB1xcH3qKIfSNhL2BMCE7GOm/xzGqq2nonPrlbXDtxQiG?=
 =?us-ascii?Q?rGgA24NSkTqO7vALWx87dcBibEDMYPZ2eTgTu7caFaBo16IplzBad7RgPL7+?=
 =?us-ascii?Q?6tlzGgRJi11Ywsm+IvSjebiv2yUGhudur5ABMsTUu9a4IR6g2CbyR8PJRUbm?=
 =?us-ascii?Q?VRHosw+hVYm3nGVYHPEgG4Ulc/VsO7hqE+rBxtmnU5/4xOu4BfyJAboDQfY5?=
 =?us-ascii?Q?t0i56Ygcaqw883ADT07UyHY357qKMdbNQO1VSqFv1Gh7bnyAIVJvyOLljSKE?=
 =?us-ascii?Q?5egjsOrcQY2dExJGUDxWO2aE5Q0a60hlk6H9X6W8+6bwzRr7hZyW9yk9Ggnh?=
 =?us-ascii?Q?qz+GcGELCSNfUeA16HNAP5TeMW7Tl5aiLhobASe5Sf9LJC8fYtnb55Y+/pTF?=
 =?us-ascii?Q?dEMjAYtPt4NWk9xLD3iapG+XJgk/5NwtM0neKJrZl+5bHS3xhysNIdEXVjQ7?=
 =?us-ascii?Q?gFnGNkjcU1XPiT9OnnorXdFzRhQ7Ny3p2qLp8+dXIBJOgQy2+yq8zfwHip5l?=
 =?us-ascii?Q?tYX6AWaS/JRtIglSdmckUkWfM6y87F6DYy7aHumufnG8CPXM1jHOiVItgYlU?=
 =?us-ascii?Q?c02krEwO8WtHTNkV2qE=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(61400799027);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 11:26:22.0618
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a080e56-2b94-428b-68ee-08de3327f3f3
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BL6PEPF0001AB73.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR19MB6212
X-Authority-Analysis: v=2.4 cv=FJAWBuos c=1 sm=1 tr=0 ts=69316fe3 cx=c_pps
 a=wNUz95N+lX1OGTQbYu/32w==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=wP3pNCr1ah4A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=w1d2syhTAAAA:8
 a=Sn7HZQbar6qehZZtClUA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: zb_KSrcuvmEHotPGpcSUetwYq8wx_D9J
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA0MDA5MyBTYWx0ZWRfX//6IGxLDM598
 DdWP//ceKRFBd0EhMHzffbQxOeZZMIRbd5+tdH8jx76qAEHmuj5N8RM67WPkiZ3mcjwjR01lGPL
 W0Al0i1NPm2866Y6VY8PcDVgAA93u7QhVihAijRvZGdKHlamTKW/43/Pahb78YawKWfPNd3jNCr
 29jVU9WbNiXz1FamGI88SC/PMCQK1FC/p3k8HrEkW+B3cLfs1GNLSZ/Y2ILCYPstqTlyQTuvDos
 p4Pp2iaKiW6+MJoNW0tW6sGSLAHcH5gvf5JUIoDygQq5MSUHiIF/+nCsgo6PBMLnAf88tcIWCpn
 htC1A8iXk18MHFBdVGOS6aTdWaqoYHWyreR2f2Pq8GMNJyiLgcC6NuqitVytRZAhm6ySV8KKwLJ
 aMAyhb0j6g6Tlewh42V2/S35E1HEXg==
X-Proofpoint-GUID: zb_KSrcuvmEHotPGpcSUetwYq8wx_D9J
X-Proofpoint-Spam-Reason: safe

On Wed, Dec 03, 2025 at 05:12:40PM +0100, Krzysztof Kozlowski wrote:
> Initializing automatic __free variables to NULL without need (e.g.
> branches with different allocations), followed by actual allocation is
> in contrary to explicit coding rules guiding cleanup.h:
> 
> "Given that the "__free(...) = NULL" pattern for variables defined at
> the top of the function poses this potential interdependency problem the
> recommendation is to always define and assign variables in one statement
> and not group variable definitions at the top of the function when
> __free() is used."
> 
> Code does not have a bug, but is less readable and uses discouraged
> coding practice, so fix that by moving declaration to the place of
> assignment.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Hmm... yeah a fair point. Can't say I love the inline
declarations but I guess I will get used to it.

I wonder if for consistency we should do something about
the __free in find_sdca_init_table as well. One could move
the alloc to before the error checks, does risk doing an
unecessary alloc but its on the error path so I don't feel like
performance matters. Or rather than sizeof(*raw) we could just
do sizeof(struct raw_init_write)?

But if you would rather leave as is I don't mind either so:

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
