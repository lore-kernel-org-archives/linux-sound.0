Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8FCF313532;
	Mon, 15 Jun 2026 09:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781514068; cv=fail; b=s8DD6XrwaqP5PYy/oRkGdU85PnmnUHnduRgHdXvJAiO5JLjXXxdm73Dkd6K45jpXKpsyJvzU6uHlcvrPeL2w68xsuYdt0fMo9vKsJrT4hhOdMXS6M9PLkklcH/+NXcU/x6OeovXKLiwfyeTgjszOtRdXMuES9QZq6lQiLP4SrpU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781514068; c=relaxed/simple;
	bh=lWKFYPcKdVkf+aOP2iRX+vK1S2ndYqKtosBgwvRsdy4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H915KDVK1LwsxnOwtVitC65AZKIiL1NBfT3AznXOdM5Matm3gMIkLqGplZNYAtROwlEob2bieg0MaNI/dV2sGRW4j1G2f28uE/OTwaqELW4zrNO+WvZJ2KS5g8ywNxyC2cuft0XksF9doRWB3d87Gl0pjyIDX7GoCUpmwTaLpgQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=ROdQHyJ+; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=CZDWlqgU; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="ROdQHyJ+";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="CZDWlqgU"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F2wkDQ3508178;
	Mon, 15 Jun 2026 03:59:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=GTYM16FFrqNpn2gCG6
	gscvoAhk5vQ1fUsCwHz1lUCRo=; b=ROdQHyJ+QUqbm+XNFH2dBprF0aMmXPTQCK
	aFLd5x+e8/XeWW6g1ra6BbagNGG+v4S2WSoGXdlA6l/oG25NtVDFG2K3WsseD+e5
	SX0zY2oV7nIOw8yiVhDDMtGuwFtScsEpRqZVOyEvaf7fC9PfXxXVNwXWObqcDsMe
	2aSC375OajrEK0888iyJUAtB8MNo6nVyEgJBKMiFKbhoD0se0T8+H1J604I4gdsO
	bIxQCHoexrAxQcc5qwI7g/ToDgknVuffO6zZIF7JAbKb4YsUMSnlAU7BvJ5ECtzb
	ZestYtUTvKeEid56hYJ//6+zgevfEFwmfyelIINlz1JK8lZoxiyA==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11022121.outbound.protection.outlook.com [52.101.48.121])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4es4kvsvqs-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 15 Jun 2026 03:59:47 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qEW/Qhr0PPdKR32Tc8RIixHPEaahXy4+7kvbJO821mLH9iBrr0MczPVbBC+K3Es8qzaS/IVuJeEUYhZou/lX33nR9Z33ec+hh3dk3gUtNcnp2Dzwb29MwNryUAHGGPyhw+JpLC5Qe8HpwVIxb4ZvYY0Nwe8ZlUZ7Yru++oswe0k0CEAsWbJwm1e9aQOTo4WJtN19+DgPzH0ArE1QamSO73xCuAR5P+N0LjIgMrtf0MtK3Afc0HdeJjDZ2YhAXcCrlIFmP6gOTvC8ZGG6JYC34yJbs/+gCSD3TCWRaOmlhDMLTp0hronp6HD93Iu6H1HIsMxKVlWIPVr+gEW2pPZh4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GTYM16FFrqNpn2gCG6gscvoAhk5vQ1fUsCwHz1lUCRo=;
 b=ttFuJ37hfOG0A+AY0TX+Ol9gn7oh6UYFGPfWyGLgLa7JjEtoFhuW2NXQ9v78UT79AZ5y8MRhpXUZWmd+MciyFD4Zwe034ivi3sxxFvKlnjCrzzTsxq3hynPq0pXx4MRrAmB/1goGMusZ6BkFnoo5NmAsiYM9Ub8NPkX4wrr3EFQwxPGSsA2qUXnVeS8rqpbAD9aCgmMCGC2AFmuFOyKNVnLcpHbmhPdh54wvI/khFOfuV2ibt9HrMhoFKrMT21UQks9IlhLxWVlCVfYxT7PneUtTIWg3uzKvnWrQ6ZGjbJdfH3De91y+QwfFX8SLPpUyDy6uoyniDpnxa+ybAdQo6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=canonical.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GTYM16FFrqNpn2gCG6gscvoAhk5vQ1fUsCwHz1lUCRo=;
 b=CZDWlqgUjv95f7SwkLMpxuWfTA5E9fTntYsNj0uOSjdGzoZhJ0Xu3L8eMUC8YanPUhe3mMZcPgzdiHfVUk2ZZU5XJTtG34LL/APHkG3GDHYFxK1724CgB0OxSe1t/Hu5fAQubsUn/lQEMNzK6CwN6/LQCE4Z0hCGtxblM7ixoKo=
Received: from BN9P222CA0024.NAMP222.PROD.OUTLOOK.COM (2603:10b6:408:10c::29)
 by BY5PR19MB4050.namprd19.prod.outlook.com (2603:10b6:a03:22c::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Mon, 15 Jun
 2026 08:59:42 +0000
Received: from BN2PEPF000055DB.namprd21.prod.outlook.com
 (2603:10b6:408:10c:cafe::99) by BN9P222CA0024.outlook.office365.com
 (2603:10b6:408:10c::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.18 via Frontend Transport; Mon,
 15 Jun 2026 08:59:42 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN2PEPF000055DB.mail.protection.outlook.com (10.167.245.5) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.0
 via Frontend Transport; Mon, 15 Jun 2026 08:59:42 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 9D3ED406544;
	Mon, 15 Jun 2026 08:59:40 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 8568D82024A;
	Mon, 15 Jun 2026 08:59:40 +0000 (UTC)
Date: Mon, 15 Jun 2026 09:59:39 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: acelan.kao@canonical.com
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
        Shuming Fan <shumingf@realtek.com>, Niranjan H Y <niranjan.hy@ti.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Mac Chiang <mac.chiang@intel.corp-partner.google.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Miaoqian Lin <linmq006@gmail.com>, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, broonie@kernel.org
Subject: Re: [PATCH] ASoC: sdw_utils: fix missing component_name for cs42l43
 part_id 0x2A3B
Message-ID: <ai+++2m8HWB7F6eM@opensource.cirrus.com>
References: <20260610041753.1151088-1-acelan.kao@canonical.com>
 <178127688584.48375.17454457885369484858.b4-ty@b4>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178127688584.48375.17454457885369484858.b4-ty@b4>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DB:EE_|BY5PR19MB4050:EE_
X-MS-Office365-Filtering-Correlation-Id: 95b39280-bdaa-4ed1-67b8-08decabc7076
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|82310400026|7416014|376014|23010399003|36860700016|13003099007|16102099003|18002099003|22082099003|56012099006|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info:
	yv3IzGlrxd+kY82nBAOUHRHS6/QDc8TkvyVxE91c0g/hGu4Fi7ASvrnU42GtKt+LzYEl5BXUThGJ/bmx0t/u+SBGFpUUgke4jLkSomlm/Nl4csZr8SFgzyIOm8VdIraaTh8Ifojq3KY8KBdOqDhavWUSs9WCe0mCvzfjK6PwWaXS8ebIHpN/0iufv/K+WLxLKIala6q4z0gKqKqyn/At14LmFMA48Q8wB1HC8jaczFMoe2udW/md6/7o8kOUqiwa/C+0vTwdwfmEUQaTs0g1SrVQjx/0Ydy+RrfepuG2gCzAHreDMTapIHRQICN0PW+ZXPS0X75VxO2aZgAV8XHU3Xm2GCM5x7S2lsJLnbNhiuSv9CaXrKjCu00683mS3Jmi+9F5QN4E5ZiliVDEtCSfzLRvxyIfA4Ldjg7aZUgFjSELKl3RFlkQhYPAwAzDhwaZP1pXqU4bNDnuD0YUPSFegUS5OIOM6mrMvyp6e+ugUFW171u847rbfQDenmQj4cvgf2eLaD3Xi5R8tdhF5T0DZrJKByem1NEb4qVdaM8dQi0gybNnb2Z5ekP6nbtFm/5a8PfRKd7vCQ/YdiMzskWzSuh5E4LWFY8Jw3xdlUYGwq2dD0QFn46kpcI6MpQHxBMzIdqLXPBNFJ46436CYvIkxugngZVQBXxqJK8kxKzvTQ5f66rkPMAohkf25w9NyNTFHK2tDCf8o7NrU2AM343Yz/fCUY5xzPpxsl9ziV+rYG4=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(82310400026)(7416014)(376014)(23010399003)(36860700016)(13003099007)(16102099003)(18002099003)(22082099003)(56012099006)(4143699003)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	B/wR0BUMM6BJTv8PVjKuVaEXYdGXxGVsKORPKsHFCOaJpl33VGPCjHWvC2M0yinRulyq/SBhdYa6PwNX0ZiPsnr1mBLH4n2LETGJDcW464vKnfK3LXAxlB3YbkuFzuZE0R0mYtsGLIYcG08AD6vdRrQgBZH3pFtFUqOf/N23Jw2+C9wieFf00rE89Shh64aqmOg3lQ7vEaPszI5AN7YRiwIqpT8Gexuiru4aNJNHsjfHGNPnNAfnymlpFvJ8YyNswvAFkcWgTh4XRjsdvId2Vttpv+6C4XLGUZLwCLFow9RparqeS0Q+2UP6pOIGnY04ehRjMBj3N//KT1ozeM2JKfvtwIByP48zX6D423pVfEKpbHd4zjrsMS/kTo6mqKiA+swU5+zxUirTc+jvlcxgNQxU5lQS/skg9MKzpV8EMTwVLvvBTMa8aFzlHQTjknUh
X-Exchange-RoutingPolicyChecked:
	KHVL9/9EeGM938wXO7fnz6FMCT2F+Bjtp4Vq9Wmqe4BDPiMvJWppn5UssSM4MWVixtSkZQ6A3n1SwK00tXyds8UmihFHCejfc0csIyg4tcQL1zmXljWaWfAXn4+ea/5b6KvlVso8WMW4pXvnrlkuVBINOCMUVkdKEzQKHa4W/z4Ad9RD8WOgyO5+behk36fIxF+1B8sO1mqWVUF1bOc0QcZi+mAORl2UXyVVBQjvKxAUzuOhszQeRsHks4eWogv1XAhldpUs/zExOBNWHCiC7bGi32mwF8xKvvvQxcbe8W9Nt2bLPjz3B6xyjUIsrbrtr5mIlSbtLtnIzRfYE3xdrA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2026 08:59:42.0531
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 95b39280-bdaa-4ed1-67b8-08decabc7076
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN2PEPF000055DB.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR19MB4050
X-Proofpoint-ORIG-GUID: 6bzXfDGLiz566IPPqS_He3ODWkB9uYW4
X-Proofpoint-GUID: 6bzXfDGLiz566IPPqS_He3ODWkB9uYW4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDA5NCBTYWx0ZWRfX57JxDCbv4VmR
 2mrD0qldRtZYkxG7i+DB6pRI6hX6Hn5qqk//WEQDfRnvVwY1Q7JdGvMuuisxwOvu/2wXcdC/bZ6
 Ow/2FHhgB91dNUoJ4c21pA1Bo/1LlCz8x+mhdvT/awcUhLJamTo6FQTYG8mvOziQPeevxq4aiox
 55TiUZ9sRTEklqv7KXVeuHmUpvgk6mgECQplXy2x1QYoWh2jmLjGmsl6lci+Uwb0igEFgmdX1tp
 f0lxFokp4xo2X3Q4c9bfxOqBnnNo/Jky6WG1Gc4KsKH6WRR7oMoxS7Bt6zVQhSuJuOKSclZRSUJ
 sArGBzkk7iYP32+sNa2bIGhJR+rqXgDrzMHfPqaCx0Em1+frHxr5IVlSywcJCHPjOlGKLOgE32S
 TtMeDYVHc4xI/tTA4IS3gkhsXgDoTeuS0IdPxQ0pJkMmnDTh9gNr7etLCGg0StmZvjfFzVPZVC8
 86v8A5I1fTVi/G+5D/A==
X-Authority-Analysis: v=2.4 cv=JcSMa0KV c=1 sm=1 tr=0 ts=6a2fbf03 cx=c_pps
 a=jtibSCz00SxEcFhpBRTXcg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=VwQbUJbxAAAA:8 a=QNpa0yy-2sBhmuAS79EA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDA5NCBTYWx0ZWRfXyzunWbQk+Wrr
 eyp8R9y+nY2AUZq4N3/87/keq8z2VO2CO8aghtHnl3fXzHPj3tC/FO7G7Z2WP1p0VCo74expyXd
 omLleH7CsKCDdznFSWYpx4so7GmcppE=
X-Proofpoint-Spam-Reason: safe

On Fri, Jun 12, 2026 at 04:08:05PM +0100, Mark Brown wrote:
> On Wed, 10 Jun 2026 12:17:53 +0800, Chia-Lin Kao (AceLan) wrote:
> > ASoC: sdw_utils: fix missing component_name for cs42l43 part_id 0x2A3B
> 
> Applied to
> 
>    https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2
> 
> Thanks!
> 
> [1/1] ASoC: sdw_utils: fix missing component_name for cs42l43 part_id 0x2A3B
>       https://git.kernel.org/broonie/sound/c/c429fbea6174

Hi Chia-Lin Kao,

Did you get a bounce email for this patch from the Cirrus folks
and if so can I get a copy of that?

It seems we are all on it but none of us received the email. I am
assuming something went wrong in our email stack but if there was
a bounce would be excellent to have something to point our IT
people at.

Thanks,
Charles
