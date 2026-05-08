Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABFA7377EDD
	for <linux-sound@vger.kernel.org>; Fri,  8 May 2026 15:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778255831; cv=fail; b=ixTNBSarCxY2YTQfwtoJO8UVscPWVsaiUjB9D7eaAv+K0bfDG+3rR79EV2CUeFcOw8H2tZlYZjVKa20oY+SAOdO5J79niJb3Mvp8l3goJdEQ3cw0gdhcUp+lv/yGLzQCHCQHxl0eLrF+1YBMSsJ1Ivdif7ff3XbdJw6CsdzdoTk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778255831; c=relaxed/simple;
	bh=YhpZvV1cStmcpYSG6tDa7lXf018mQ1iuV+K1d/x2sBM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kn5CjAS3vRW23dsiXOgphkr/gVcCfKbW70fHTcWLb7sDwAQCJUhl4Fo3ofRc/o3809ouYuUUiyoPICCJ0L1Sz+uCtD7IDPvZ9cAseBNqnSHto8iHmkmmHquPcACwChYGYi2bPK5SMcgOW8OHf1wz1j3DSAcU9NcpKz5BlaqqtkM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=FUkCI6fE; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=uRrCX2az; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="FUkCI6fE";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="uRrCX2az"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6484qXfW685223;
	Fri, 8 May 2026 10:56:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=yvCPXV6BbxIhGCw3Ev
	4Cu5TZZ0X4iJha5+ld16h1b18=; b=FUkCI6fEi3Fk/TJwLWtrLJI0r4vCyOTUIS
	1s0s4kOiSlCp2JjGChbN2Eo8RfZJBg5HZ2l1/cU6ZWMzgSxbiHXbE4xf53Axgdqv
	KKKRzll2MOND46XpGhCGcIfHfQzixR7lc28+I1P/2iMCCARLmOcBJhOfTveYnwsg
	0yLEQv2Ya0n0aY8tejbEqEvDABnDgOq/w6rweGdJAeC2J2g0QaaKQod5o8WlUwfA
	Pi+2dO7MMPgr05FUfNe5E0caz5XPbG2fdz/vmW1YtBZqp+HKEoFm396wv4MAOnz7
	p9WZA7cvLeMl/i0m7WYTJGXR7kR0R9fsyU+Ldf0Jn4neYpH7YHDg==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11020078.outbound.protection.outlook.com [40.93.198.78])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4e0upb9xg3-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 08 May 2026 10:56:57 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fVURqRRFc8wDZdb3xkA8Lwps7OjeuUBltr4bHtcQdGatCZwHufqkojgsXuwVexXLoszh3OGQJXgv4lgjMy9mvbYdgPj9shBjtFlU8Mf2x6rcb/Phv5gGPHXGah3bJXidMGaMQxJ7fwwztuHWzDFG+ayH4pMlUCQmg/kwRXEmEBnQJXfjiauApd4hpQVcHDyfDMpvEfj15NCk+ydaWYGg/i2PUqKdVIrYt1Gu6PPYyWNnJ0TONTAcLxTsfoiXJ6zOtlovJH8Ot9JOKX6KcEHI1yBxENIPsI38ozpQsv3grV0cHZtETMF94Z0SPE3zKwtfL+oZ7Jb/69M9121Whu/iTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yvCPXV6BbxIhGCw3Ev4Cu5TZZ0X4iJha5+ld16h1b18=;
 b=x2rrf1E5kMoaF8zrp1tx9MkzdLCyu9G3dZpB2gI6ZwhwrDJS3MOacDmLqu2KkffvRb4mP21qd9kPeLGe2Q2LV0TGaV6BlTJKTj47FLmpkGiRNu7nUg07KpRjkO7ZgVVf/5gVWUD8FZRcV9SmyyQr03wkZ8KwlTP70z7yigDwfq1y89+4beFAsglXYEVV4jDy9lqh0JRpgSHanKXKqDmxXR6a/iEKB6CRCNYZOsBqbt8nHE96uYj2uB06Thhis3PeatzqxYmwXLjkwXZJuOP4TaZ636aomdV00pDGPW/p6v3zVwn33nTOMyLcYN8XQvYj3zGluZHXWLMEffEpWVQK6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yvCPXV6BbxIhGCw3Ev4Cu5TZZ0X4iJha5+ld16h1b18=;
 b=uRrCX2azAptnfhp4bi8x+od1Ym/LKg6Qpn+7CTrrPLPejjWLxMvsZC5hU/lfliC/IVUt9RueYYbFCFcs8x0ijXMIsWDs9Wmbd82WqGewwdnp5tqYBmgHeOqs7zyyVwEuzh8K/g1q7s6cES5yl+sNenF16BJ+l//FR9d/me5wtPE=
Received: from LV3P220CA0019.NAMP220.PROD.OUTLOOK.COM (2603:10b6:408:234::11)
 by CY8PR19MB7689.namprd19.prod.outlook.com (2603:10b6:930:7d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Fri, 8 May
 2026 15:56:52 +0000
Received: from BN2PEPF0000449D.namprd02.prod.outlook.com
 (2603:10b6:408:234:cafe::3) by LV3P220CA0019.outlook.office365.com
 (2603:10b6:408:234::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.19 via Frontend Transport; Fri,
 8 May 2026 15:56:51 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN2PEPF0000449D.mail.protection.outlook.com (10.167.243.148) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.9
 via Frontend Transport; Fri, 8 May 2026 15:56:51 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 52DC040654F;
	Fri,  8 May 2026 15:56:50 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 3C08D82024A;
	Fri,  8 May 2026 15:56:50 +0000 (UTC)
Date: Fri, 8 May 2026 16:56:49 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Tobias Bachmann <tobac@mailbox.org>
Cc: linux-sound@vger.kernel.org, Richard Fitzgerald <rf@opensource.cirrus.com>,
        David Rhodes <david.rhodes@cirrus.com>, patches@opensource.cirrus.com,
        Mark Brown <broonie@kernel.org>
Subject: Re: ASoC: cs42l43: SDCA reattach timeout on Dell XPS 14 Panther
 Lake; chip stuck across distros and kernels; worked initially; still working
 at hardware level
Message-ID: <af4HwRd7ePL/Ildc@opensource.cirrus.com>
References: <cLVwl4lrR76pLtv8VxMSaA@mailbox.org>
 <af3+Q1jx7z5tL+Yn@opensource.cirrus.com>
 <af3/iDwepJuCaJNm@opensource.cirrus.com>
 <77iVa-LES8uCgAj99Tw0vA@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <77iVa-LES8uCgAj99Tw0vA@mailbox.org>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000449D:EE_|CY8PR19MB7689:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e685852-b41e-4b29-1554-08dead1a6b4b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|36860700016|376014|82310400026|56012099003|18002099003|22082099003|16102099003;
X-Microsoft-Antispam-Message-Info:
	5Wa2A9iy0ULSnqGSX09spQWSe7LmKiIrynNTHSVmaS8GvOHnXbbeSWQNYcmC93Pf3D3PnfaLL8iip0LZGr7GX9RplBIfarjlLGfIakNOyay24JG8NpPr9/mjdmSHFNYxNfE4Tzid57ssgriLumBgqPql379gMos9YZ155qOdL2hhfXxcoMbdK4TlemGdIJZVHELdVUDnU06I9oo5A0T0rgdnoZ57MUHRu4IqUdZwX2Pr+YQNvIaqENxMCPWXqq46Xz+l8lSsJTVxqPNcg6jDGLwyr/zcRtEW8SOM49TxIZY7a1CzC37QQzNE4271G/OIXiQupxyHesz7/1u0HLeR3bQHwnM2uM5EMie/AhT+2fehomP/wXTGHwf5ffawlxGFwwF3VZxRJWP7ITsmYFf5pVXRVeDAWoYHa3wmiTcdbc8gxUdz4JRtMqBXnAirW1OPQCTYlfP4E39PEyCzRhIg877AmTVVZhdp6kaw3g9lxrDcDvqn/Y4oUiIjYynUFhgIUv6BCFlmv1iZGwhycmfZJR3L9gvDGa3hZ21FhHqYYCO1CfNGBCIgzXQXaKjqqLTPOhm93E3J0Hq6kRIln1pIiM7D3I8XPl5j2MbvoTDxxXkDXcCSNyws1P/0zc7A0zY4s6inuD3kk1qohysrVrWsVNoSPKT4oSv5IjW9ZMOM/sNuJAoVlhDgXSPeGZAdiEJ71bdvxtwQS0yygRK9PPvOZdn7b4Wy1H0hEblQLNeDT7c=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(36860700016)(376014)(82310400026)(56012099003)(18002099003)(22082099003)(16102099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	svcb+FH5PaI3jPqDqISPBqcFmDarP1ddT5k239he37X4LJxiD802IGiMbPfwuj6Rom1coQ1SFjvUNGoqDegwhGHqEoLZNfrPM8Jx3AHmOSD4jaFa4tS9+VIG+t9WWj1h9U1Ouevyqnl+sViUfFxNaqfBUE5mYDALNL9t0NgU6vbo8O1cfSOlRXvaUN+Npl7b0NuJys5G517XSDwGXIrmowc9sKHb10ioR9P356b+6PgQQWueEfFUmSSmebM5FRAAyEmZvq6uD2dxZMs0H/bPCT6MTB2nxhjPtRNNSMSy/FrYwR60vgyK8tgssCfKNhipnFd20LWV7XYEiXc+wSvuUfBnE4ugWUn9mqtwY4YUmKvGDUsC/tlhQ+wqLb4YDyU0pnmRbd5CyrRCAiXrAtMY62p054wt928M7X8Cp5sxrhLe6NorI585ck+s6kY1jS6G
X-Exchange-RoutingPolicyChecked:
	a2Es+vL1SIBMGPzwiUN5vXA+BbmUz2sIVzg2/XtoF7dEPFgerDyf04QQ1ipR/fShWcRsx8xWswdORX4ljC/Cs90UdWamPX/09l0y0l56EfPo/INnP/XSMsFoT2702Wb/x+Dxlmi/0yNm6FyLRqpbLZ/nv8GebIbUWOfworts9D3oJkJnx4jjzBVY1CErBvkdRjCvDVzI0kpLh86F0I8Alp4MQEoSTMWTYHdfJe6s8jNaAxG3F9NsElLHgpMJ8uEJ3BcUKvNpAJZ3Q9nZ/TE04SeCpCmn3I6hr3136cpW1j3ZvkqovmDP+TkSY0+bkINaAX3FUqmYWSN+cmhcZcXknA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2026 15:56:51.1888
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e685852-b41e-4b29-1554-08dead1a6b4b
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN2PEPF0000449D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR19MB7689
X-Authority-Analysis: v=2.4 cv=L9otheT8 c=1 sm=1 tr=0 ts=69fe07c9 cx=c_pps
 a=r5kpy6O4d1nOJ9DEYQWzwg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=Vhukwj5_wFhgS1kCWZUA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDE1OSBTYWx0ZWRfXyYHo7TiKPoTc
 G04Mjd+/XVwyJqXorsHnofCH5LAClYt29khQTebOjo0He/mCobYaW64lHJt5vVvKhhEIeowfYFo
 wXLVyn1fFE4LR0F6LbCkl1JdRlch+NrkHq5u8VhnlL1lo1DcpLFQ0SdCeCQeYWJVkgHT+jz7F8t
 84t+tPtwdtIiGdtNGkAnRwybE+S0yrBHhGl/lwhFcCHhxP/HKxpexWLOAjnA/TWhL2vN6OT4o5f
 Kh56ROh1V0qEawKkLn/pcdLmSQsBWPOCuDi0SVZ3cqAr26kAxyvqDlGKbePmrCnaRDfDQnFZXUz
 BksDCGMmRJAwl5BZWjXJI4jZpfB7Gphk1FdM4kt+nlvrb3ENL3W8y1cZY3MttNXtp4PD3x1duLK
 0ZEMJzws/MVlOLHoKdBcZBz12vW0AKbVQWPaRMlzHQFkUdp29B1lqxzp/SuXB84a6LKyLME+Lw7
 R0DnaTr95uLtDUZlnQQ==
X-Proofpoint-GUID: axfpaZYfxw0ypj489EHIjil9jw-MulJU
X-Proofpoint-ORIG-GUID: axfpaZYfxw0ypj489EHIjil9jw-MulJU
X-Proofpoint-Spam-Reason: safe

On Fri, May 08, 2026 at 05:45:19PM +0200, Tobias Bachmann wrote:
> On Fri, May 08, 2026 at 5:21:44PM CEST, Charles Keepax wrote:
> > On Fri, May 08, 2026 at 04:16:19PM +0100, Charles Keepax wrote:
> > > On Fri, May 08, 2026 at 04:56:03PM +0200, Tobias Bachmann wrote:
> > > > On Fri, May 08, 2026 at 10:41:10AM CEST, Charles Keepax wrote:
> > Although I am little worried more might be required looking
> > more closely. But let me know if you can test how it gets on
> > otherwise I will add it to my list to poke. I think last time I
> > tested that it was for a device that didn't also have a bunch of
> > SDCA stuff and some of that runs through a different path so
> > little nervous that might need a gate too.
> 
> Fortunately not. Tested on 7.1.0-rc2 and the speakers work fine. Lovely 
> stuff :)

Awesome sauce. Always nice when things go slightly better than
expected.

> This is probably a very unique solution to a unique problem. But I'd be 
> happy to test patches etc if you can use this information to foolproof 
> the architecture, which might help others.

Thanks, that is very generous of you. Full disclosure, most of
this SDCA stuff is still fairly new to the kernel so the basics
are keeping me/us pretty busy at the moment. Unlikely I am
going to get time to look at this in a lot of detail in the short
term. But it would be nice if we can do something here in the
future.

I think the biggest hurdle really is that a lot of this soundcard
stuff is decided before the devices themselves actually bind to
drivers. So it's easy to make it conditional off the contents of
the ACPI but hard to make it conditional off the dynamic state
of the system.

Thanks,
Charles
