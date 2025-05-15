Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB10B34CF9
	for <linux-sound@vger.kernel.org>; Thu, 15 May 2025 14:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747320640; cv=fail; b=Pp/wnmqeMoWPP9FQT19/24M8cR6bb8PbGm2x95XmzvOhqQVi0pBmR8d/+qrtSauK9/aZYaKceVEEJ65O8IEtRggzQw7JhURDvZJSHuIp9CTgvRbsP8GCuXRV+BakJx4VzOsxew+RHm4DcLmT9o3mUO7nfcex2cJsghA877DFqF0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747320640; c=relaxed/simple;
	bh=GESQP+Z/Gyun2b8HaYOcnXtxtfYBlIaczxVi4w+Bylc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oQ7nJyeKKJ0aIl0uwTsLSN6SJBX93AUCj7qOS3Mxlo2gZFPh7eIFNyZ8eGXfWiG3EtPnE1X9cnPjhYOQNCKzPXBLwgTEUh4of7xyTQ/IZjvutMvIAWB2MTrGfhlC1XAvEQoeoWb1a2rNkZHs/WrgXsIkbCLfbln3BxTfF/0o20w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=orGZKOgV; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=0MHXyWgp; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="orGZKOgV";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="0MHXyWgp"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54F4xdih002933;
	Thu, 15 May 2025 09:50:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=GAGlOpZjjzLgCg8dEn
	MNazshvq8b0ayqyF9zHYNfkNM=; b=orGZKOgVUuFx2usU+Drq1wU0+C+Y9mLW4R
	cMzQYh3sJ/Qpqiy5ngUe6/qiKvQ1E4hCx7WQhhhCxWR8OiTYLuWDdb63BymKe8E5
	PMLNef1SpjlSzcI5dz4nPROEtCv1GnRFInPJoQ6u3hjJrnrTWwWK4D6CffKppagB
	6yVMZKrvS5qs8L1ELwyXqUpM1VLwJikwssOHvTAX0NH1ua83GUnADKr2tZqs0Pa/
	VvaU4xEH4dXLK1FyujrkX0zT41rK8FK40fnN5rT7DupavWDsLBOb262mWSj5h6as
	+R9pyVogQPWIny74EnHf9uO0yyMI3/Tel8XhOt+xRv45AEs1/faQ==
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2171.outbound.protection.outlook.com [104.47.56.171])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 46mbdrb1ns-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 May 2025 09:50:16 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G3bqSpLBxTW15+acEovH86MGwRbjE+C+Hb+fpPifVrsXq6vIHUwfTbFGtpXwB9TVhjU4NTwFtgYuE4WrYr4XPr259dU6VGdRZi2p5leZcT0In6Ge8rZBxVCY2TfQLRbP8smN7OGAPkt4XQo9jN/sSNxLOP4i9ZYZNY4X5p5OXJ38Ond5pHYS/k+vY8KodqgUEk8QZBOxrNK8xsF6Ss0doWHiAq+ZF3EuhE7ow4GuLa11M5M/nrkSAhk0wa0ytQXs0ou2ioeoGrtQgQ0suFvJxTBOKy1rHajstB8eYJMCVPyZLXcmmep8on++H1P5NuX3MBsFQ+hyxlWEuF+yvL6IUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GAGlOpZjjzLgCg8dEnMNazshvq8b0ayqyF9zHYNfkNM=;
 b=lrSx0wnWcsRFELPiNu9vv9iobrPEj+o0M+fFVFa+kNBmnO7Nae4L3nKiObEjF1fayaY445SqC+alTdl/RKmrQtjzug3g3z1VxyKOL2NrXRGzXHcWpY1JiScfCGzxlZSH3RRDs15VvGwE8AKvZnt2eYRPpkEByOV598fp3PgMR76v1mfoSdAHzcOIsPWSZSDvbYkKDhjH9CJtrNGvDB2z8VNCLmND24bo6ewPozuwRG/h85/ctiR9FRBv1Pw5wCYAahVX5pWLPBMofJ5jfwncnOnKfy+lzzq7ZPGzJ/dj9+FPI5Yj3o59O36bjLcOFx0xKRmXoHx+Lobddk+/JxLO9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GAGlOpZjjzLgCg8dEnMNazshvq8b0ayqyF9zHYNfkNM=;
 b=0MHXyWgpvSO8+4RSAIfhhSGXN5PZwvZDGxYwugSBfcUPiXu27n+uJ4if4i4wUTNjYcx4m1eo7GxmH1g6tQPSGMohwX69CoRP7DYXMdDOyX/nH4CAkKWdrA1R6b860cbsPcE4kb5K8EHNBRDsbTxwjMEwjmo/KjUdHxNzTv0Plag=
Received: from BN0PR04CA0158.namprd04.prod.outlook.com (2603:10b6:408:eb::13)
 by BL1PR19MB5772.namprd19.prod.outlook.com (2603:10b6:208:394::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.32; Thu, 15 May
 2025 14:50:12 +0000
Received: from BL02EPF0001A0F9.namprd03.prod.outlook.com
 (2603:10b6:408:eb:cafe::95) by BN0PR04CA0158.outlook.office365.com
 (2603:10b6:408:eb::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.42 via Frontend Transport; Thu,
 15 May 2025 14:50:12 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BL02EPF0001A0F9.mail.protection.outlook.com (10.167.242.100) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.18
 via Frontend Transport; Thu, 15 May 2025 14:50:10 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 72197406545;
	Thu, 15 May 2025 14:50:09 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPS id 57EEC82026C;
	Thu, 15 May 2025 14:50:09 +0000 (UTC)
Date: Thu, 15 May 2025 15:50:08 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: broonie@kernel.org, lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        peter.ujfalusi@linux.intel.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: Re: [PATCH v5 4/6] ASoC: SDCA: Create DAPM widgets and routes from
 DisCo
Message-ID: <aCX/IOoDucKs7SNH@opensource.cirrus.com>
References: <20250512124240.799509-1-ckeepax@opensource.cirrus.com>
 <20250512124240.799509-5-ckeepax@opensource.cirrus.com>
 <470de11c-82b1-4d1f-aa52-e0849ea261e1@linux.dev>
 <aCIrKasDhXrI9SLq@opensource.cirrus.com>
 <01e25477-5475-457a-8c33-4b6c9fdbdd3e@linux.dev>
 <aCSa2AuuQrZlEPi7@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aCSa2AuuQrZlEPi7@opensource.cirrus.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0F9:EE_|BL1PR19MB5772:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fdf146d-af1e-4d77-cc40-08dd93bfcab3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|61400799027|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?uGgufb5sgiz/Td1WftEIdTA058Ob+zSoAEzzUvoXniRPZBpuuuuPOU2WwIHc?=
 =?us-ascii?Q?PJpYFNiUzwfAUqaBSI9NnIF6NK5XmCRFOpb2b4J4qsoSxkjHTE3qne7AyMVI?=
 =?us-ascii?Q?0g4XPHR+xgiQtBBSgWLlBsbcHa4M2pLb/KpeRPU3iG2JdigwCIfeQgBHg23v?=
 =?us-ascii?Q?vMML0kK5MMZg9VOH9yc7G+WkzsOTInFA36tzatKa3uxjLq8W5uCy9Hi+VAy8?=
 =?us-ascii?Q?ZghsnuogPxHFIUs0ZNyoM/bVeXyLtvxmzoItR44NHnr7KxC8cO2krJXZYUPT?=
 =?us-ascii?Q?a0fGFnkeEgiUwdu2eiiqkx0nlp4ylRYbn2BJ1xfp2RwlOSWCaQuHPHGRZdCr?=
 =?us-ascii?Q?wKOQoVJig8hJtdio6SJIKaLTqNTPaOJz8gix4cvoJf3L5If7FAJV348yf+w6?=
 =?us-ascii?Q?p4vClcusQ2ChvTyjXF0e/+k2OOaX2lSD/+M8bh/u/2axUt+jg+y6oBYWULQM?=
 =?us-ascii?Q?6u5/CcQeg0h6ClP20EW9nsoJcWFmJb+ZrqbZNctrRxJ1W8PsjOYq3aX2nbY5?=
 =?us-ascii?Q?N5GqWtfMyuYMXxdlG/t5uMxpK3sR03DlwCWCHKjem1To7PsN0xzWftEF6bFE?=
 =?us-ascii?Q?ZK9sx2IoeoKOhhJf6r0qs4m9uQBEPYV26pcd+UEYQ3iUtQEswoOx3MNP/Ro1?=
 =?us-ascii?Q?rAT4PU17edHG8zEJl3jTPslwxU37K0Sk7WWQ6Ih3fx1KfBn1ONse2sdMgaKm?=
 =?us-ascii?Q?tHjaGeBb/SUJL1hvHyIUCK3v1AL2gC5mFaZ0wiIRVp/KkaLpOOFGyJzTAwAY?=
 =?us-ascii?Q?x0vsNENMgIpOp9JBafLO0qaiQvBAMEDDGoBazSdQShs6Jl0Qnq4MGnqM1Lai?=
 =?us-ascii?Q?qOI/3CaI2Ylgzhl4IVuy+BdcdVbXGQfMNkBu8qBBrBQYR5EIdquP9XJrthmQ?=
 =?us-ascii?Q?LOzpkPKFzoeaa3LlOplIu0SWbWtfC8p3n8TPho8YEWquwQQqvdO2xnU9uvXH?=
 =?us-ascii?Q?4NzM9DY+hAuAP+MyveMVI0NVMNHZ31SQi8kNvneS/458JOl/wDbMvMNVUudO?=
 =?us-ascii?Q?aczR+kF2R0gAFaAMohd6QwNOTARhpQaKN3T329OsKJDCI6P+8HRPlh/W4/oQ?=
 =?us-ascii?Q?GcWGX3f5Nb4J9YpGTvOWOdi8kSxsYDRz9lm6mzLg/+1wUjgJQONclD/zBkAV?=
 =?us-ascii?Q?Mo3iLF+2n+AzlUcMGjiE8FVgt4+x8gr5RBFHzeqnIA7fAFbmFjfYz59LDcSf?=
 =?us-ascii?Q?Qaalewdp8cml4JEVKGoO+areVyOSCuGxJ65KaiBq1JVpPHpjJKzCVPvQTpd3?=
 =?us-ascii?Q?H1MDBlevRHhtfh9U3v0VMwM2mQ02qqI4WFtEbtMwRqWCCWxMpoU+YqJimQH6?=
 =?us-ascii?Q?rvT/ZDdsHZO0B3zKj2iX0vNeIFNR70PRRrlbpmtHbjvuPK1QzqaYi9aH8ZNF?=
 =?us-ascii?Q?6c2KjsEbdajJwkzk3TgaUY3nBeHAhIGrq93fZc+0G86dTckSSQcjLoj0Q6la?=
 =?us-ascii?Q?J1yahRUIDkNL39M8Vvr1By8RoidTKPv1UHgwS4+EeFDWmc63baBShbtZK34g?=
 =?us-ascii?Q?Oz7LnVm5vsi2t2vyraY008hjSxd8kBD+MUKK?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(376014)(61400799027)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2025 14:50:10.3226
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fdf146d-af1e-4d77-cc40-08dd93bfcab3
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A0F9.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR19MB5772
X-Proofpoint-ORIG-GUID: 6QKzXFa5E8GE-FuYlAXjv_HrC9M0NVmM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE1MDE0NiBTYWx0ZWRfX7DrB1aRGb5ap 4kAeGqEoLpjrWr6YBgfPwOZjqrz/cWHWEqusUrcBcIKwGWQqEY2LQzYdDROZLlPvQV29wn5dXQU ZjO53zThj407yt9GvQ53NMFdGHfT05jz0vlQ6rJDdReeELeiKk8LoRc201BjzVjYPUBytH5qw3h
 2FnsK4nUq+ngcn9CP8rgERLd8GJ0NGQpOxlIaVKO0brByuf5W+sgJsGdZoVdyaInsJftOAIGvVZ M5ZFtryWCaxCwDVqRxW7VfN/vzjyEj6xlEjFiH0Fky9LRid7RRMDjDGR01URzk5dMHczYbQ+x72 E65YUZcdlfyPC0A69WKLPYBUwjR64V0O3RRmaDgr70E4Zak16wxbrWVbgwGHtocFUkuAPJYDS/F
 w8Lv7CmXDD8zQlUCuxArRPH0uNmg49YBpNe0m7c04D/XEcWux56wMdk6lXpI8euuDkQbuOhv
X-Proofpoint-GUID: 6QKzXFa5E8GE-FuYlAXjv_HrC9M0NVmM
X-Authority-Analysis: v=2.4 cv=abNhnQot c=1 sm=1 tr=0 ts=6825ff28 cx=c_pps a=vIBLTX18KUGM0ea88UIWow==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10
 a=RWc_ulEos4gA:10 a=oCx1n8f9wJIte6UMvigA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Reason: safe

On Wed, May 14, 2025 at 02:30:00PM +0100, Charles Keepax wrote:
> On Wed, May 14, 2025 at 02:15:01PM +0200, Pierre-Louis Bossart wrote:
> > Humm, that one doesn't seem right. There could be cases
> > where the DETECTED_MODE is inconclusive, or that additional
> > vendor-specific steps are needed to decide which SELECTED_MODE
> > makes sense. I don't think we should assume everything is
> > handled internally, or we have to define what 'internally'
> > means. This cannot be generic SDCA stuff, it has to be
> > configurable for specific implementations/vendors.
> 
> Ok yeah I see, the current code reads the DETECTED_MODE in
> the IRQ handler and then updates the selected mode. I guess
> currently what is missing is the handling for the JACK_UNKNOWN
> case, which could probably require user-space. I think it would
> be pretty easy to export the DETECTED_MODE as well I will have a
> look.

Should hopefully be able to send a new spin tomorrow. I have
managed to include all the comments I think.

I started being a little more unsure on this DETECTED_MODE again,
but I am going to go with forcing the export of DETECTED_MODE
for now and we can revise later if we have a better plan.

My concerns really are most custom handling will actually
want to live in the kernel, except the case where the system
wants to present a dialog to the user to select the jack device
manually. In that manual case I also can't see any reason why
just setting the selected mode to unknown would not make the
most sense, but the spec does not say the device should do that.

Thanks,
Charles
