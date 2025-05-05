Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDD511F236B
	for <linux-sound@vger.kernel.org>; Mon,  5 May 2025 08:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746433428; cv=fail; b=s2K5hNjKJK7Ve9U+EXhbpQ9srwlFhKDsn8VdcBfz6q8zWus+pzhwslCAoZ0B0Ctp50c3dC0E4zjP0XSBnHqmHxe1rkb/noNk+uCCETOottwW9DmQBIzhrl52yGKfRxT9+WkyJhgHndYTJBOwLV3X9uzvjdJFNff57Fh6/feLlrU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746433428; c=relaxed/simple;
	bh=NFdE8/MAIhDGNXorEDMkAmXjYbybuOmmdxwjDBB9Ixc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QuE/v+cKPUmy1r3vPqwVqXcYvL9jJsYlkXWoF8HSdOT8oU5GK5JCVx08SjxpYo+yFRwvaSpSy3lmPV7CFcr1nrz+O/VaoMalP2cpDUwwcLZpjf3hjoiEx2wPJpOENr/czzfdUmwZdKt+m2+re8nNAbtD4OrCPvCazyxllNeIWd0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=dZ7Td8ym; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=EkoH0Kwx; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="dZ7Td8ym";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="EkoH0Kwx"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5456jLme008946;
	Mon, 5 May 2025 03:23:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=yE31oyatQrtlO1Blnx
	EOE9iMJKWny0t0kfNJjOVIrSE=; b=dZ7Td8ymTL+0VH68ZFlaWlrNzbPI9t9hOL
	Oaik6NNeAY8PzhJefZ1A/SJg23otn5ezTWwck37lAhBQRwOZRHdGrMI6IFB6wCaw
	y+6bGJNd8D8na6/Zvb0r0XZeRdaBXVWhKnZkjFBuCNeuFMb7De0HzSnnL6PsJ4Cg
	KvcAcM+we5MsMiCdFMuelvyPMx/MprKlWag5yBRdTDt57MaUBLY3AV2/fCR8SKuv
	MRsbM7sbx/nR31CMp4KezT/JHhsWNb6frU+Jd1sZM9MT58j52hZMHijbRQ/8WCtV
	u1VHfhMyIdKN84rxepkI9fjAVPf+FljkDHTXl549TeL4c7rVrkWw==
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2173.outbound.protection.outlook.com [104.47.59.173])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 46dfjg1xyv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 May 2025 03:23:23 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q6YLkylK5SWziT2DfdaeYDKq8zJB9jjYjzvrYPihLUmhrkLiRW2RaQ+mkpdYMDueE7OrEybpuIQSiWVosQE0r7nBEegAgX0VYBzTDiOeCuLFeH+xWjBYmj2UcqNvGQKGHWbACVCaFTvC8zL6P+9n6PhINWpamvIFrT52u8j90uwZNQajosuuxiqoj6bEpiRiS/U8I4znW/KXo8RXf2CdiA9uhgMzI4iHjaJ1Ry2YRovQ786BGK4TCGasm4JPVNLXk/4AV3ytvdq2YJMbU45e01bIFcyxYhJgg58tFK7Ap+2ewfuKJqNi8T2r4CXwe01PZn5atFB9+vqRu0m0DqHfvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yE31oyatQrtlO1BlnxEOE9iMJKWny0t0kfNJjOVIrSE=;
 b=iryMMikK6xWELkIrNd9BFJwKVeUe/j6ui5IulAuamJNtAM6CL0Jk00+ykwKq3gmKPiSbakHVSErvMeHKg2JIVjP4OPwEl7H4mcnRSWyEk8QloWN5JtixiEsk0es2jqK9XdNCVtNxAx1XZUUOP17YgW2WXKFqCxgZ/VdJLdstkXbnC8kzx+PMwqGWblnRNtQsf4qM6/UpWrNJcIHC62VsW3h73RC3P63VeyTUIG0DYOHTqf4JyB24QxTeeCvR0o/pMt/wFxq9wxuNhtWUwxw3CJkmFzTTQ77Z4eBdK5QzeApFkqpfMUoXs276xyZ20Kebb6xh0Vk7eRHZy7w6s1W7tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=amd.com smtp.mailfrom=opensource.cirrus.com;
 dmarc=fail (p=reject sp=reject pct=100) action=oreject
 header.from=opensource.cirrus.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yE31oyatQrtlO1BlnxEOE9iMJKWny0t0kfNJjOVIrSE=;
 b=EkoH0KwxgMgqsnFDJVFdqgJdeSyXnrcWSJrfR9iks1J+lpg2/x07f7lnvGIFSyZRz1FenZAVbki7zWkP8n9smszt9gAzf+L9FCnwIiBp7tL8bfjTDsG8ttG1v14q05CTjO+Lw3tCqlJDoFLOU/jH81Qq3UepBUX97p/KeGbx0C4=
Received: from MW4PR03CA0276.namprd03.prod.outlook.com (2603:10b6:303:b5::11)
 by CH3PR19MB8509.namprd19.prod.outlook.com (2603:10b6:610:1aa::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.22; Mon, 5 May
 2025 08:23:16 +0000
Received: from SJ1PEPF000026C9.namprd04.prod.outlook.com
 (2603:10b6:303:b5:cafe::59) by MW4PR03CA0276.outlook.office365.com
 (2603:10b6:303:b5::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.31 via Frontend Transport; Mon,
 5 May 2025 08:23:15 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF000026C9.mail.protection.outlook.com (10.167.244.106) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.18
 via Frontend Transport; Mon, 5 May 2025 08:23:14 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 0E995406545;
	Mon,  5 May 2025 08:23:13 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPS id D9F81820244;
	Mon,  5 May 2025 08:23:12 +0000 (UTC)
Date: Mon, 5 May 2025 09:23:11 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        peter.ujfalusi@linux.intel.com, ranjani.sridharan@linux.intel.com,
        kai.vehmanen@linux.intel.com, pierre-louis.bossart@linux.dev,
        Vijendar.Mukunda@amd.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: Re: [PATCH 1/2] ASoC: sdw_utils: Remove num_platforms from simple
 DAI helper
Message-ID: <aBh1b1AvNImHEnHI@opensource.cirrus.com>
References: <20250429093931.343725-1-ckeepax@opensource.cirrus.com>
 <aBav5YeU5-TNHoEQ@finisterre.sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBav5YeU5-TNHoEQ@finisterre.sirena.org.uk>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C9:EE_|CH3PR19MB8509:EE_
X-MS-Office365-Filtering-Correlation-Id: d09ba197-a5ad-4c19-2962-08dd8bae1515
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?KYNGi1lJ6JFymkULamZrKpDXMDvBJkPNyZu2MuuoTPAnhI2njXH9KEZgpq9j?=
 =?us-ascii?Q?NKE8Ws9oTXshYPr8zUZGu5X6aEcbQAJl6EsbM8ZKJ4vl5DngI6vRadUeHzPE?=
 =?us-ascii?Q?2enkYujNJdUKTYL1XF8HyvUUOaqEk+KqmVXmCogFCe/0MX/OrtHMqVKOK5pV?=
 =?us-ascii?Q?NDFOeiJD9kWOrFUERZkeTWcSf1MJx50nkQIZkMwWaXUKLVE0JwAuG4BkN3K9?=
 =?us-ascii?Q?KbTKgixBpRK8nGsL6KEaSjItrZaYu/QVI3leOT3v6g8ZNvzm+od2cMZ344dw?=
 =?us-ascii?Q?3Ft7eOdbZ1m3vxARUsheiv7xLLm3teDPADLezKCME3CnVZIFjYIwdICZTuzD?=
 =?us-ascii?Q?gxbOb8/mHtSuV5Dy5mTlHFNs+12sbOkN2pyPEAXWI7xiN99LAHo6W5tK9lxw?=
 =?us-ascii?Q?FwZvz2eZS+rue7SZZcSe7DO1pedhHRrKgh2i5UgWqbB4T4ZGfKpuf0OrevVx?=
 =?us-ascii?Q?Nn2N8k7iSVBUgrCd9vf6grWAx49Q1gCm6jANf5PLlPUQpcE1dRYUWrFxcrsa?=
 =?us-ascii?Q?wPO0GtmbD9esLhaUSDGZRMIRf68oW5erdCeodQaP2zlr6grNGwwYg76MRAK0?=
 =?us-ascii?Q?VmS7enrJC+E4yMXF52hPFe13w8VP7XuEXG4xbgGBuHWCQwuWIPESXJGX7T3r?=
 =?us-ascii?Q?C6fgfZfBJAG5vFjO7vn0nRENOe00Lb957tNu47Ky+yaaVhQyYmSBYleoEysz?=
 =?us-ascii?Q?PbRz6SY8UQM6H2dKiuHFYt8gOjJVGAhPxCPsaIdoXSreRhdi4ncW3c9Jxd1A?=
 =?us-ascii?Q?dtYCV/9W8KWEseFKYBO6aDDyVsDvYpuUqCymR1GrpwntgHXPKvdE60KRkDTS?=
 =?us-ascii?Q?u3uJEabdpi9PaGok8xA4lkqmBQ+ku+xswX6H2/TOE3QE/XfQBcqeds9KuUyj?=
 =?us-ascii?Q?vlvXLFQN89k7W9p4WLWRdeTQQnnxty+XTquJ0hBadJ3eG0yShfdM9pszH+EZ?=
 =?us-ascii?Q?JGtziAVd66XmQSY2SYOWW8cKy2BHOiUQZR0d1xX0GwRecMs9oGYlv1Nvc5if?=
 =?us-ascii?Q?fNaR4iI8pwXYLnr84jEX5CZ1eieBB78I8R6it/fGl8YnmT0wiRNhbzrEAZfD?=
 =?us-ascii?Q?5xBeN64Q8LI33B76wFOIuhUG8roK/rctXM3c+7rCAPZqcjaQpFCPXUsx80Mk?=
 =?us-ascii?Q?w9vIwdJh7uC5n91nvOhYxLi98VQahxQOB5GyD54GfHc9rgGEEtROY48GWjHH?=
 =?us-ascii?Q?PfA55UKvPtYCzk+5vyKRslA9gl6aju2f5okVcVlfJhMJPjWP+BB/VflvvCiG?=
 =?us-ascii?Q?KkSOr5C6y6BLPmLQ03AifgyIg4ikWlSHqHQaxKAeh3lCU64RpLRWiptwJQAP?=
 =?us-ascii?Q?z2gd0gn9Uu0rLdCeSAsitRQ9nFOEYV1TlI7L0fbxBSwiDaoZhta4PcKXsr5N?=
 =?us-ascii?Q?ePp3taynaofLDcKKyVo9zHt68JbA5htjEOynEZzGnQTWdyszK1enkUQDpdr/?=
 =?us-ascii?Q?6GAXJtpoV97LFuukJU1cZlmc3Jc/rKMs/x7Rscl9D751sczJ88cTLm84bZvf?=
 =?us-ascii?Q?T/W0MuuB0ArzKcyYWgQTcDRQa2n+dzxx0X5+?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(61400799027)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2025 08:23:14.7346
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d09ba197-a5ad-4c19-2962-08dd8bae1515
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000026C9.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR19MB8509
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA1MDA3OCBTYWx0ZWRfX6hAlS0Ru1LR9 b/8S0tr/mIa56HnoQcjkJEMFNA0bazHR8ko3dFKLy2ZVQ7hEotb+IF2RMhrfL1QdhyKcZNrX6l4 YeZAmbWd/Bj2K0LBzLhdvlige7zjCDWEhnIiMecpkqlOs/Lc+/fSaflk/ZHcJRljM/iLHUvHpcn
 gRVTuxUFGFracutFnZLcHh7pWEKgkBAa9J6eTVOGsgW3H0eLBKBDWc2DL2Pfb/cjxI3M0e0Us45 dAVucUx1iqWErWSuo4QGYAXsJ+URt8JhN4iFdYhGA67TgdHczw3k0RoZnTVI6lIJfqck4hvGQvL 4LXeHucsxpbcsUpV0ndNAY1D+mqnrJyIm+mmpYZgIjdjM+bcBMTKUvwNqCpxCnry8Lf1Zap6m7a
 CTZsw9H4ay/updaiN2Fja6hM1eTKJrQuhTVPFQxtxg/m7Xg3pzmCi1A/P97+2wPyJ19GdEDN
X-Proofpoint-ORIG-GUID: W4EMrCs4iBHGXfggE6JvegHfKt0gtYqB
X-Authority-Analysis: v=2.4 cv=at2yCTZV c=1 sm=1 tr=0 ts=6818757b cx=c_pps a=H8RDR50mQ1szzU+C1Tr1+Q==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10
 a=RWc_ulEos4gA:10 a=lQL-USYGG1dPjLqx2G8A:9 a=CjuIK1q_8ugA:10 a=BGLuxUZjE2igh1l4FkT-:22
X-Proofpoint-GUID: W4EMrCs4iBHGXfggE6JvegHfKt0gtYqB
X-Proofpoint-Spam-Reason: safe

On Sun, May 04, 2025 at 09:08:05AM +0900, Mark Brown wrote:
> On Tue, Apr 29, 2025 at 10:39:30AM +0100, Charles Keepax wrote:
> > There is no point in passing num_platforms into
> > asoc_sdw_init_simple_dai_link(). Firstly, as a single pointer for the
> > component name is passed in only a single string can be passed and
> > secondly if it is a complex DAI with multiple platforms it would make
> > more sense to use asoc_sdw_init_dai_link().
> 
> > Fixes: 59f8b622d52e ("ASoC: intel/sdw_utils: refactor init_dai_link() and init_simple_dai_link()")
> 
> The changelog doesn't seem to describe a bug here...

Yeah that is fair this probably is more of a clean up, I will
resend and drop the fixes.

Thanks,
Charles
