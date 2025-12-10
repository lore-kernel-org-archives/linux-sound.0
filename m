Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05D30326D4A
	for <linux-sound@vger.kernel.org>; Wed, 10 Dec 2025 16:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765385351; cv=fail; b=hnBX/9IDSAwPXa6TofaA13iOt3OwACWww5bZDtJ7+2fb9pDAmtTWeK6doCNRkuKZVvwfjIBHKtbGuu63l9DZG10v03SPLcmgH7WVmTcIUEd1/CAhCqFsAOE4qWKwR+GLjW5bPePsTtGm+olfxgHmoku3lxsa3CEwKRLEq0SyMPI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765385351; c=relaxed/simple;
	bh=utSFN0rSrqnvxpSzBmG4qa7ge9RS6oyYtijPY1XVZuE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TTE1knyWuIK93g3AulgFP9kTCRfqJDivs8VpDrDaX2KRo800vlpkcB8h6yrM8Qq/a0o1+7GL5ycxfe8BOR07c9ZYRNB6EC5DgtsbmTarLBRR6vyvfE6K2tSeOJfQ99HTpJ/lUQRRI3acLOyQkR201rR1CyawbJNCaIAvB2OtXQk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=d4wPPae4; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=Y1E9xvK+; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="d4wPPae4";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="Y1E9xvK+"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BA6k7sk1490095;
	Wed, 10 Dec 2025 10:48:45 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=6WZEc7Y3IQjRyqcrmK
	d19+iUts/hvXujuTYezbmcB10=; b=d4wPPae4tocfRpldJ8WUAIX6cbfDIAJqUr
	hfJX3z21wEN2b7zmn/Ua5j5U3L66R2L/4dBdQSrsEFxc/mAvGzeYMExogZEbHqWA
	UxRFvcJJKDkWYEvT3AC7ZjneKuAIxSNB4v2J2ia1SjZlJw2p8W5LiPo8RTh9LHjs
	v+a50qfZc7fxZg99qKxEx5ev4GsRfVo8hG9LBncNuPrVRlIY8NKE1TF6ueSueBUL
	OMkY13ymnB00D5zuY7TD4RYP8hXJcnpv9UNozPCW2nmkJ4voiB5XPFmEjmt2cDx8
	miIC21hL8rzcAUbEZ5hOu8r2TuesYLMMqR2H9cayZQUGGUsC7o3w==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11022105.outbound.protection.outlook.com [52.101.53.105])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4avjs2h52n-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 10 Dec 2025 10:48:45 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JbwYWE4Mb3GMhP92yTzjcJKjuIC+adz56nhVchpJ4v0x2hstgJS0lTZ7Ou2TlIuW+ABTa3o4zIowKfwDDBQ0SQrVEjZD05gYUNUeKiFiDxbNJYN/YwdDh9zbQsH/rkWrTWgqYytVe5amWIGk2O9MFHmpkRI+iUwUagDCvYsT2dG1RQadgehel4NT9xcAo9coscP9skYW8mZi8AmBiwKKNfJfZ3pG+tiDQ7bIVcX7jNN6ER9i19upERw5IPrn/mfWS6oC6LiKe+DCyW5BYnDK4I7TkkEDb42YqfXn3P8i/MNeaAvxHyq0k3AdmkV5lfi82mtoI11QyPT0NPNBT0QSmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6WZEc7Y3IQjRyqcrmKd19+iUts/hvXujuTYezbmcB10=;
 b=QJXduyDy12pDuAZckUdlJEh2wUBJwh2ZRfHirmExIpNLmzFxZnaBEHPjoTGBzgOHS5GGZVTUpbjxxJ2BOsv/dDDX4ezw5xe5Lo/34p2uePDeAcSApET1HLPJM1JhKiVCBgxx2sROmVoV/SvhNQU3DZlRW6gD+wGlKJmTZliMoZbLO2C5Bj81l+DzgGj7yGkI7wMDSDHRfCIAhj8PahEhPRwyt+T+gEKbuFGGTvkGYXcmrX+c7HzBRaBtK/0zoevRX999aaTAmtPNoeZ8Ncm65PtinMM1sa3Y4AZJcW7OdcCvIWAHDhDuCnLs1lGxNq7wOQjcmkomMDphemi9zOzgKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6WZEc7Y3IQjRyqcrmKd19+iUts/hvXujuTYezbmcB10=;
 b=Y1E9xvK+QaW2cz8CFGUiPoQnr8cuhZuGg1VjBBZjsIa3i04nPsFvYccXH9mFAkXMldxCFipTCSURQNMz7q1zwOYoO9qQjNDQYMfI64g+/rznU0ch9y3p3krGOq8n1NHuHVjMfFRm61/C3CuUXvclhZDtBPcC61Tp953wnAIT2L4=
Received: from DS7PR03CA0273.namprd03.prod.outlook.com (2603:10b6:5:3ad::8) by
 DM4PR19MB7956.namprd19.prod.outlook.com (2603:10b6:8:17d::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.7; Wed, 10 Dec 2025 16:48:41 +0000
Received: from DS2PEPF0000343C.namprd02.prod.outlook.com
 (2603:10b6:5:3ad:cafe::68) by DS7PR03CA0273.outlook.office365.com
 (2603:10b6:5:3ad::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.15 via Frontend Transport; Wed,
 10 Dec 2025 16:48:08 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DS2PEPF0000343C.mail.protection.outlook.com (10.167.18.39) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.4
 via Frontend Transport; Wed, 10 Dec 2025 16:48:39 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 117C0406540;
	Wed, 10 Dec 2025 16:48:38 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id E4DDB82024D;
	Wed, 10 Dec 2025 16:48:37 +0000 (UTC)
Date: Wed, 10 Dec 2025 16:48:36 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: broonie@kernel.org, yung-chuan.liao@linux.intel.com, vkoul@kernel.org,
        lgirdwood@gmail.com, peter.ujfalusi@linux.intel.com,
        shumingf@realtek.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: Re: [PATCH 5/7] ASoC: SDCA: Add basic system suspend support
Message-ID: <aTmkZNWdN3NWkf0r@opensource.cirrus.com>
References: <20251125152128.274808-1-ckeepax@opensource.cirrus.com>
 <20251125152128.274808-6-ckeepax@opensource.cirrus.com>
 <02bc8d1b-ae25-4398-acc5-e5779c245a3c@linux.dev>
 <aTmHBbS22GyoH+RB@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aTmHBbS22GyoH+RB@opensource.cirrus.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343C:EE_|DM4PR19MB7956:EE_
X-MS-Office365-Filtering-Correlation-Id: fbb70791-7b5e-45ac-d372-08de380bf840
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|61400799027|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?mx/UnRliYp1XdRYgoPNlhpEgSiqtjlMm/rN0oRwSJJ2jqEEHCzPD1YOVAM6j?=
 =?us-ascii?Q?cA1MP4ju8D69A11Yy4VMs4PM9jSlOAbyolSVpuu4o+53dutPzEfNO0vdP/fj?=
 =?us-ascii?Q?dbNIyJYviVfz4N2FPTF4YSmtmaoK5r0xuC42FhrcW600OdzKZTWWrD/LaTHi?=
 =?us-ascii?Q?hI3/StVFwgjGDuVrY0mkJ3Ff2V1ea1XDS0TjJKOVmUObVy9KKlkpJxOzPGTL?=
 =?us-ascii?Q?Nxl3ADbiLp+b26nRdSJJ2xqf0VfN0RchPmXZtFESFzsfc0s9gGGXtHBXuxR0?=
 =?us-ascii?Q?04zuj0AwsL9i7NRBp1JvhmaSXCQ+DnUPd4gY7pK8NMlqy/4hPhxGKEMjyjMn?=
 =?us-ascii?Q?iUNqEQzDB08vbQaudXbeJojTM41SBG7MN31COS93d7A3XGqE3WpchHZM99hc?=
 =?us-ascii?Q?RoK4ZQZr81uObIcn06ZQ8qvmb1axlc4Z5yBF2jEOChhxlUa2wTZUEdan0VVP?=
 =?us-ascii?Q?E+QlEgR7siPsPyb6ej4xW4+hsganGgTh4sIqAUfykmRpqSCjQQp9PpXzSJ67?=
 =?us-ascii?Q?JDaeZTJUcMxDtstwxfA/2eVtjy33ENXgRRUbqvGbu1UwE7BON6ai/gO+JMWf?=
 =?us-ascii?Q?w+g3Mf7O1/HGQ7RDTnAO/1GSfZ+2Zp6WI3PF4x/1424xqQeWwjhNOuEMxrh2?=
 =?us-ascii?Q?ayxz/5DjPFNyYvCVFi3EillWE7DD/yo7JTXglzyVG+jfdKagJZEoEuMEdvsE?=
 =?us-ascii?Q?q+VH2rarXYCrKhkv5/L4KncOmLlZk2mJVMID/s2ZX8HVP/WdHsUF8NOYzobL?=
 =?us-ascii?Q?RJI16mbcl5YgCoRnZnbxVA4kk7wqSIs78asGfLDIqkVwvK/VhamTgUQ3vFan?=
 =?us-ascii?Q?oUTz9lafMO05GHlMY1HEoZPcU5F8YbkU18GTx3xit2hAhZqUvUGD8Pq2Z6ZK?=
 =?us-ascii?Q?JP3y7zVdWjdfCNMOZC0f2ilGOFrIGBC3epFZygVMyCj5T+Cz8MJQulSAUMgQ?=
 =?us-ascii?Q?P3OvewixdeNSvi3UiOg0S3W1etUVs/H5McKEdQFaU4t3/0vpWcJnzlRsRtwk?=
 =?us-ascii?Q?2dqsnP4QxddUplmuRxtjHgz3iqXNCqMDgGn/dAKiC3z1uLRXQs1HvH3dxPCQ?=
 =?us-ascii?Q?kFi2kkR39l3Owz/MzrOBdxMvHnkX+7xl7gh1Xl00+qe92F3FQoDoB3vXlTL6?=
 =?us-ascii?Q?z59hGzjTsEcIlQIg/s4yNCUp+/CuUjng5jkMLR7hnJJETrrfPwy8hf3X/bz1?=
 =?us-ascii?Q?39yY/ltKVemUoOo8qS/eUqzWniOMP2kebCA3VdfgRlceWotXCuuQ142G6OCP?=
 =?us-ascii?Q?mB3V47s53yR82dKXaPhSjKIUFTC4NRBtPsbEzuImVZ456vAhWN0M8i1RPh/2?=
 =?us-ascii?Q?sQf9TSNrsr7c1BqiBUexYnHmKhQDCOZUeXkMS73BqghNrlyKPH+WBwa6h1MF?=
 =?us-ascii?Q?ZUnlT7ZOgfga0SKY1n30z0WjsWICrR1oYUq3nrTypzOjXHAzSZX2n74xSVue?=
 =?us-ascii?Q?jqM7iAWe19ub4dtVIVkZNn1ikkiZl1ho9PvnBXOe3rZIjVSVO30DuZ23BdJz?=
 =?us-ascii?Q?+pOKxIfhZBaMLBlPx13ndVttI2wqtyuak4vuaIMCsFugXHfFaa8ztS2qoNVo?=
 =?us-ascii?Q?wrreg+jLXpHBiWcqnyA=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(61400799027)(376014)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2025 16:48:39.1344
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fbb70791-7b5e-45ac-d372-08de380bf840
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DS2PEPF0000343C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR19MB7956
X-Authority-Analysis: v=2.4 cv=dZONHHXe c=1 sm=1 tr=0 ts=6939a46d cx=c_pps
 a=+zE/vu+0lv1VjxPw05mSug==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=wP3pNCr1ah4A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=RD1HFNP8_rMxXpq16LQA:9 a=CjuIK1q_8ugA:10
 a=ZXulRonScM0A:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEwMDEzNiBTYWx0ZWRfXzxAcj+yRJuMe
 iYHPvVcW0zkgP5x5kb0y4htGolxyjSsC4QZHWEWIFxG/FHeATEqzMlHzmzLnrcIU95WlrbjgTPw
 K4qKW0e7ZZer8/Rw3Glto3Mkln3q/sKYvUvGQm1QxLQvagP6KEcg1bCGYjbYtcDUSFFld+sM6W4
 4vFCWbgpvxo1a56xyidAgx6yZDIreG6PCkbvNYRyPl+AafxwOxL3uoKiboCnxJsMISy46xLXYuI
 cEiVK7Ee+mof5o5JemYltnDylmFJqH+Y7QEFwqH6QNTkE/s8UdkXzgGJbTwUZQg0E75Jjkvc//9
 DP+hsI0qhW5jvyJN26veNqqF8tlixc0j0reTsy2iY3gGWEkclOoTaJIq7vZnHLiS8nZ1H6Aa+YX
 Ye6vmdr9qZl1S5VMPX/XeCGz4g22NQ==
X-Proofpoint-GUID: xr314YusCwgXSSu-7wMi_pMvx2d82x2u
X-Proofpoint-ORIG-GUID: xr314YusCwgXSSu-7wMi_pMvx2d82x2u
X-Proofpoint-Spam-Reason: safe

On Wed, Dec 10, 2025 at 02:43:17PM +0000, Charles Keepax wrote:
> On Tue, Dec 09, 2025 at 12:11:27PM +0000, Pierre-Louis Bossart wrote:
> > On 11/25/25 15:21, Charles Keepax wrote:
> > > +	if (drv->suspended) {
> > > +		sdca_irq_enable(drv->function, drv->core->irq_info, true);
> > > +		sdca_irq_enable(drv->function, drv->core->irq_info, false);
> > 
> > and a comment here wouldn't hurt, not sure about the side/racy
> > effects of turning the interrupt on before turning it off?
> 
> This is perhaps a little misleading the last parameter here is an
> early flag not an enable/disable. I could perhaps replace that
> with some defines rather than a bool to keep the calls more
> self-documenting.

Look at this again I think best would just be to add an _early
version of the function that is what we did for the populate
functions so it would keep the API more consistent. I will update
for a v2 once the merge window closes.

Thanks,
Charles
