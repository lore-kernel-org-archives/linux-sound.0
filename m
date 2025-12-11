Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CA3A2D374F;
	Thu, 11 Dec 2025 09:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765446008; cv=fail; b=htlcni+6XYeY1JY1304WgibRdeckI4RnjgkqzoZ1YKl/yg2Se5xitxYdDHuEjfg57o8OIQNHbGEV3AhyKRNRZytg0yImcFEyIvzV4f6LyIDOS75wfDNhw/6Y6j9FtFxOAlo1cQsDWbkPDa6lgN3p/wdc0yx+t/RpjrWkIyAJ02A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765446008; c=relaxed/simple;
	bh=zcwYmmih/1N9Hso6QL8RhTd+cVrwZ08xawXUj8hg9bs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M33I1bDVZoH61O8A5mRmCSucpJdN1E55XDDWHn/Iw45LBBxqjkJXW2kKAfpM0sWKz83GCxrfcfImmy1oTV33FAjfFJR6+wbPa5tN4qIYm3MwL0VRLo2DdXgejQPKkCFZLS4t8kBi1glITbWkbKrizzDavfXOHno6E2yApBnpRpo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=AKhwtKR/; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=0JEW9s7B; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="AKhwtKR/";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="0JEW9s7B"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BB6dvxH1234689;
	Thu, 11 Dec 2025 03:39:51 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=xEG28uGooOEA5PWTSB
	Bw0bGArGsuUfNemck/MbDz1rY=; b=AKhwtKR/+exJ24mSWK7n6MPbQt+Jt8qViz
	ugfOj9ufH3BZXj3mAh0UH+/Y0NHKayODcGHrnL3bJuDUCCjf6isEwQzXev+CH5/o
	arTFrLPrT2EZSuO0OC1B/aP9fS6/euQZqHqSbFg6TSrrSuYVrY0NenlaSSvCFUZ+
	dkPj6TC3v0RHgZle3wdlwnNP59VVQMMNuY8zvTRW/SDy2DHlLxjARnXAuQdOo8Q3
	5g5aB2O3UNjQNyE0bIIPofXx0KE3Nz8NcC0cPMPnSLKEBCuXmjrYWpBis4KZoqrS
	iwC+RpcEAeVr+Ao2a05t5QkLVwYyexdoknM5IS2Su/gkM8TwA7wQ==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11020112.outbound.protection.outlook.com [52.101.56.112])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4avhskubcb-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 11 Dec 2025 03:39:50 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rhAYYE4kHc+8DbXkXOrTbIcu0DuZqvEBUD8Dk8K8kxgM0TCpBubYqC5H74L8Tw8MySJketXYorMW1hEocuLqXRRd02H8fjHZrV1QiQJHH7fByFf5RuoyLw9qlNAwh5B88wh4pQurvvwn+aQrL3gaN75UjQnKZE4M23uifGayOm/eH5aAc6m3dw4YG3P+cGjau+MKDYbmRLH+EicpwMLJ3/+0EYI0pRZBnQJbUDhmeuO+HN0dpYbzf4fTzp6Gx8Rd7gMeEK/250TVSifXdHsWOjNz7b3zdlzmRpuRkqn3CBGgHA2B8r/V7kElT4dF5ashjI3ztzIAB5HvAT1W/szXmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xEG28uGooOEA5PWTSBBw0bGArGsuUfNemck/MbDz1rY=;
 b=II9hPSnHnqYfzQWoOiTbEyAsR3ZdxL+ByA+BdfRWJ2WCAmcV1fKl/tqaZczVVPrdPc8s/Q/Cpo27FoQpzVKoKi5t01N7YbfG04JqZu+kS+lbumH4qsdfnXSg+IJRIq/iqp1wcHeo37XW3GJKw8tHZ0/EN7HO/kWrt0xf3mv8LOXL+CM0R1zuTSdEMFHaJBxfZvjivEEPgR28fPaEGH+zIYIz18IuN63lX5++m3Jo6uBhd6ES7lev/kqvi+UqpoIPD4dn/54HlATfeHAYd8W1FKJaQ7FLNDC5KqRfReBXCl2WC6ei6ucgmF9CKIifWmAGnDXFAxAe7EEDXandJ45cCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=bradkelley.org
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xEG28uGooOEA5PWTSBBw0bGArGsuUfNemck/MbDz1rY=;
 b=0JEW9s7BDrQ1znPG6nlDHZ2U9DDzT8zwnhItP/wOs/1TyKMEZTrSUrWzolpo6TJN/BJXnS4eNK7bwd8uSBoxlOKZ7xtFIBNzP64zJ4pQl3ZwzFZKrQ6X9xTPaZ/pGTFia1RTozYyszkBl1pJQLrK76bWPwteWy4Ln4HlEZ+pGLo=
Received: from BN9PR03CA0123.namprd03.prod.outlook.com (2603:10b6:408:fe::8)
 by CYYPR19MB8078.namprd19.prod.outlook.com (2603:10b6:930:ba::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.9; Thu, 11 Dec
 2025 09:39:45 +0000
Received: from BN3PEPF0000B06C.namprd21.prod.outlook.com
 (2603:10b6:408:fe:cafe::1) by BN9PR03CA0123.outlook.office365.com
 (2603:10b6:408:fe::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.15 via Frontend Transport; Thu,
 11 Dec 2025 09:39:43 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN3PEPF0000B06C.mail.protection.outlook.com (10.167.243.71) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.0
 via Frontend Transport; Thu, 11 Dec 2025 09:39:43 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 9378D406540;
	Thu, 11 Dec 2025 09:39:42 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 77EE8820247;
	Thu, 11 Dec 2025 09:39:42 +0000 (UTC)
Date: Thu, 11 Dec 2025 09:39:41 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Brad Kelley <spambake@bradkelley.org>
Cc: david.rhodes@cirrus.com, rf@opensource.cirrus.com, lgirdwood@gmail.com,
        broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
        linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Correct a typo which inverted the reset GPIO pin
 sequence.
Message-ID: <aTqRXbdAaV++jdHZ@opensource.cirrus.com>
References: <20251211051628.391435-1-spambake@bradkelley.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251211051628.391435-1-spambake@bradkelley.org>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06C:EE_|CYYPR19MB8078:EE_
X-MS-Office365-Filtering-Correlation-Id: 18bf01f4-dd6a-4570-f895-08de38993745
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|61400799027|36860700013|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?61wr9m6kqfsi9Tva/ltQLzK0GBT4920hZWOViOjpK6GeUMRtt5FZUCYmZ3I/?=
 =?us-ascii?Q?ceHJnrOWDs97cl9RpHIrQmdjv9Gi6SpvBGpk6vuNHMwmuhehFr8ftaR4XyGO?=
 =?us-ascii?Q?tjUBGaNVpjxOlmE4yHTQwtOi2wlqJHF9qPkH+0Qgp91NKw9Sf1IZk+av/Q2j?=
 =?us-ascii?Q?RS5bq7yYHUzyuvX39QQLsTwtgXmEyig8cj/quH3FvV4FwhppH7bXNgHqEjuj?=
 =?us-ascii?Q?gdkvOcIHuHY86iGqIaKP6sPQ8EYMtSI15QcK3wXjvRIDToIjXXaYimPLHa2r?=
 =?us-ascii?Q?c7en2uNdUdktYc0vXiwG/ORHCJYoYTLyjPc9brT5IaCsnOVPur5gJSqOiGOh?=
 =?us-ascii?Q?xiRNZDuiz4k27K6Nqgnny3IQ7/+HMKHJbkVR/FkztF0HWX2VKCc+JYx727Rt?=
 =?us-ascii?Q?SpXrsphFlGPQm0Ei767/XONNMGyX/w/9Sdns0osGIZ80XCfNAEzyQw1avI5n?=
 =?us-ascii?Q?ArRsAIZVjF1fCUQKl1EytTOqseSLZ0GsRRcHYfbF/4GN4WHj9EtGdsQ7NkJB?=
 =?us-ascii?Q?a2NDAULUnn31qByD/U0CHgPq1787xJAcaR1knhYN35bxUtpPzMnVRse4gThC?=
 =?us-ascii?Q?Ic5pccpfslooVvsYeoRBxXV2aMLCxH7aV2o88DvAAPko6twtLev+uhWooudp?=
 =?us-ascii?Q?12XOYDdoJF3+85VskFfRRcAwawqmwUZOCKLHZdRGOOuVpeMuVzKjqKS1NMxI?=
 =?us-ascii?Q?ITxPmX7hC/X8+MlgOvyUieoSLlIghRJc1GRJtxNL2ZQxbmpaotsydXXMXAxc?=
 =?us-ascii?Q?gDVMMMjhyF49IKnopI5PTGlfnQ2qCOYybgb4WJmbbkI9x5D2ks7tvqH+VIvY?=
 =?us-ascii?Q?MpTVS/48cRV5c0oy/OZuLEupEESakvv8VUgQO7+LAhiUT1d0l5P89WZsMcHH?=
 =?us-ascii?Q?BvtKy3n+KtaNraKjaTGbXXwQsUaNWS9Hbp0cPEVfNZUPclMCJigd/z6Qmk6a?=
 =?us-ascii?Q?zurcsAsrDwbUvlXfLfGuWDPatNms2dY1wV56v4HtLjp3SR/mne/Pdvs1DvTx?=
 =?us-ascii?Q?QuNNzDLCN05Qx2Yd/i6Qmf7u4ZRirWh8CwOYLHeReLVOHzlC66z9XAx6mVh4?=
 =?us-ascii?Q?FAXnYOz9FjPt0khUBKQ6HyblPf679GpUWU3zsHvE//pTQYEtSjLU0Wqi9des?=
 =?us-ascii?Q?bDCCdia84cS4hgFIpQf0tOXtlqQV86JoHQ0vKGOebYKbkUWr252qnl+7Y4wc?=
 =?us-ascii?Q?dspxC310obfXRGayHG7y17mLMQbAdgOBsyNxgLFQF3h+AxIjcPor0EdqCC28?=
 =?us-ascii?Q?TpbCbV+hfYGr2uO7fs0BKwevmyOphQBiITPl5gf+AUu01HC+RiPsGoN3Hcrg?=
 =?us-ascii?Q?6uloDmH7WRx3pPCvScIoPSdezBrb6gY2nURlL8HYSf6ABcSdSJRfnN6w6pmU?=
 =?us-ascii?Q?h3wZ/yBjATO8WvqnYiUDcHb3f+RkVgfOa0wuGuVBmBxzo2EbbKkWBxrCNDiG?=
 =?us-ascii?Q?SEiau+1ETSxA4MgGScvzkTUcO0LNqK/87+JcmesErR0cUNLPkI/6cZN8O4y6?=
 =?us-ascii?Q?Uzv1amjJd3uB5BP9xU81k8AcmQj4RI6/eaAcrUzhVGjJQ2ouvNsMrKe+eUSb?=
 =?us-ascii?Q?T6MTVcwIIF/gTwI88Ic=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(61400799027)(36860700013)(376014)(7053199007);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2025 09:39:43.9483
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 18bf01f4-dd6a-4570-f895-08de38993745
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN3PEPF0000B06C.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR19MB8078
X-Proofpoint-ORIG-GUID: ql1avd617R8lFoqehwyWOFmbvWy6panL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjExMDA3MyBTYWx0ZWRfX1+7PGo2uHd/K
 r7X76Tf+qC+jYZgO7xaoXeXSK1E8fEjxbBYn+VdfdNz4kn7ne8qbZ+N/pCAyfKSJmc/HQyw+qT5
 z8MJIKUK5gbm5G0lMP05hG7mgIz1xDlGXL5+2MvKMpivr3+Ye5hvI/Onx0gK89Q6L3gjiJAQj60
 7mCbWoOtQPBXfclLqOZTvtD5D4g4q7IEsRxKdsUYp+k86OOTolYDQd31vFFx7wu+Iz/EIA9tKcp
 QCS2JV8NfHWyZKKY1wtK6Ltxssc0lHGfIr2CUv3JOouhQhDpHeouoA9wf3BqMPsBKyy5oIwCB3o
 4cdI8n57yVYLd9hOyEc+TUjQONRznomArS4PFE6BOpJxCJoTcWv4RG0RBl/H8aqrf41A6XQv/8X
 lt1YHsPoCBzgtc4Z/YsewxFlegCXnQ==
X-Authority-Analysis: v=2.4 cv=DJ6CIiNb c=1 sm=1 tr=0 ts=693a9166 cx=c_pps
 a=w4tK16CD8Bui2tbXJMLE9w==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=wP3pNCr1ah4A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=fBn5eNUOAAAA:8 a=6Q5ojXoaEmZHiIQi_Y4A:9
 a=CjuIK1q_8ugA:10 a=pIcoXCkIC5y34Y1b8dC4:22
X-Proofpoint-GUID: ql1avd617R8lFoqehwyWOFmbvWy6panL
X-Proofpoint-Spam-Reason: safe

On Wed, Dec 10, 2025 at 09:16:28PM -0800, Brad Kelley wrote:
> commit that had typo: 42d1178d223ba9498c1ed40a5fc243a43d35ec97 ASoC: cs4271: Convert to GPIO descriptors
> 

This commit adds a GPIO_ACTIVE_LOW flag onto the GPIO lookups
which should cause the GPIO core to invert the sense of the
gpiod_set_value calls. Is your use-case using one of the in
kernel lookups or your own one? If it is your own one do you need
to add a GPIO_ACTIVE_LOW to that?

> The original commit changed a 1 to a 0 and a 0 to a 1. This inverted the reset sequence
> resulting in the IC powering down and not initializing.  Correcting that allows the board to initialized.
> 
> Signed-off-by: Brad Kelley <spambake@bradkelley.org>
> ---
>  sound/soc/codecs/cs4271.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/codecs/cs4271.c b/sound/soc/codecs/cs4271.c
> index 77dfc83a3c01..348f15c36d10 100644
> --- a/sound/soc/codecs/cs4271.c
> +++ b/sound/soc/codecs/cs4271.c
> @@ -486,9 +486,9 @@ static int cs4271_reset(struct snd_soc_component *component)
>  {
>  	struct cs4271_private *cs4271 = snd_soc_component_get_drvdata(component);
>  
> -	gpiod_direction_output(cs4271->reset, 1);
> +	gpiod_direction_output(cs4271->reset, 0);

This does look like a bug however, the GPIO should clearly still be
an output. So keep this bit. Also could you change that commit in
the commit message to a Fixes tag:

Fixes: 42d1178d223b ("ASoC: cs4271: Convert to GPIO descriptors")

>  	mdelay(1);
> -	gpiod_set_value(cs4271->reset, 0);
> +	gpiod_set_value(cs4271->reset, 1);
>  	mdelay(1);
>  
>  	return 0;
> -- 
> 2.43.0
> 

Thanks,
Charles
