Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5E32295DAB
	for <linux-sound@vger.kernel.org>; Mon, 12 May 2025 17:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747070193; cv=fail; b=SZBBui9yCz5DqT1oigJHVIdq2VO7tRENH5tfFo3CQ8Lgj8Ao4U9U+lu93z0f4yCbhPpbS6697/37IcVZ1lnJSdXA9L13jN00eD/YGMmPcIfaEYNw9dSpSAmev8GvShLTB7MLefunZes3n7h5onQbUazCo9g2wK6JAOL/Cm7p3Gk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747070193; c=relaxed/simple;
	bh=kSlGSwTdsuQWS2i4kOLgZMj5i77saGOXSSxcxbHY6VM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sXUX4+nX1keOxw8ecf+7kec3CG4RinxXU+HP4bR5+DBjpqwhqZVrgDa1kJs9Of4g1ua90e/1vbFiyK9GPriIlNr27y/rQsvgmwtMKjx7CozIr+lFefnezy2fSyXFul8spk2Iy9FL4HXh4S5gY7FlG9WVATNfJHBXR5X60hh1keQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=OAphDZlh; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=T7uT8d3t; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="OAphDZlh";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="T7uT8d3t"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54CEeHNQ030585;
	Mon, 12 May 2025 12:16:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=SkRqoC74v24LWiEPLZ
	AyTPwQf7k1t/Gqe6T3lEdFYNQ=; b=OAphDZlh+5ALNIXyAq9c8sfBqtqaXOSpVh
	mCPvMv9tLbNvHNza9ZCPdRONgzcNPRav+1PXw+g4GPPPR6adDchOTYg5e5QKRqYC
	QhDLzj/2S/msPB0+rNAu5xqWxyu+IcIoKfH504MbGwYHCoklxhUQslO4nNN3AyKw
	dfQhsd2L0tT2VJ69Gjg+y6VZRX3Fn+9C94yhPRxGdOXzm4PW5uZmjEn1uFkboccj
	K2xXgQYFXOq8lTgApdOLpZrlqSqWNjBGxzEHdZeLT5yv2L9yR5XDoUQIFKkljWrh
	Mg+Q4Tsv2VQ66aXmeRQpjKVMmSV9lbKcGWfbdc74ekUCbPInbqIg==
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2169.outbound.protection.outlook.com [104.47.55.169])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 46kjy0r6x0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 May 2025 12:16:24 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Je26fMBoGJHqm8ro0CdmgCDXUsgK/t5gjE/hcPnCdcPxSc/llCWh4UOSxnBsYk1FSwoz77MVSfQJGXsTLcla/Iy+VZwiVN65z6AhFAiC5drtDJg8F921kJIrd7Ljg2mRprckRMjT4+curgGRIiIJEh/pq3gZEKnsLqmHAEjrXGZdwtcrmz73MdSayx/pwArYw1SAbBZ9K4Z/OXUWOwGH3jKkNkPeUvrWbFnnKrq0kj7U9aXzcj86DrNa3jq+hvzAN8N/baFAJhRLG3EZJA7WBx6TJSrrjJgOWyk3JGb38nduRn4wkW7BOplm1I19nxi6vUr/RIdZLPLwgxIimQIHjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SkRqoC74v24LWiEPLZAyTPwQf7k1t/Gqe6T3lEdFYNQ=;
 b=FXFfwwS/TOepFZ0eJRmL/mnQRXDV0iXgCMyp03meDr4rGIYHWdQ8WAaCd3y8KlZ22NUDKdGJMjYuw575P5lAyILzUV9XhQ0dyuWYhUTHiLt3aYvsTxfuVjFwNAI/UqhDquaz3wkfVrcziB9WF+qM/UtTVDT++qFE3Fd3J6b2QttH+IfgEnIbgPx/TlKn5rodiBEIBELxgLkqJ1mYBWCddY9VE0KNWhQ/AUHOnQzlfvQ68nKaJmvS81PNI8kWprF2ofdFTJ/5lrzPdZ1+3P/lWu+4D/OTqXjWuULJdU5EcjmEYFPnQt8ceszXQ+/3d9Ck/LIbAayfZEx2gFczAPJSew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SkRqoC74v24LWiEPLZAyTPwQf7k1t/Gqe6T3lEdFYNQ=;
 b=T7uT8d3tn38vMnzjXQStfF2GvkbkQUzrQyxCS1MHpynlzLfVobkPiUFLAs22zz9bFWlR0EAseNnhjDzEN1bFXAhGt1D4pkH7s5RiDi3cb+9rrSiMMKPs69N/u5eORth0myAfsJmayq8s3ncSAiwZiCA/two7cq9kaA/C8EBuTtU=
Received: from SA9P223CA0010.NAMP223.PROD.OUTLOOK.COM (2603:10b6:806:26::15)
 by SJ0PR19MB6727.namprd19.prod.outlook.com (2603:10b6:a03:47d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Mon, 12 May
 2025 17:16:19 +0000
Received: from SA2PEPF00003F63.namprd04.prod.outlook.com
 (2603:10b6:806:26:cafe::40) by SA9P223CA0010.outlook.office365.com
 (2603:10b6:806:26::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.33 via Frontend Transport; Mon,
 12 May 2025 17:16:18 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SA2PEPF00003F63.mail.protection.outlook.com (10.167.248.38) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.18
 via Frontend Transport; Mon, 12 May 2025 17:16:17 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 6943C406545;
	Mon, 12 May 2025 17:16:16 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPS id 44843820248;
	Mon, 12 May 2025 17:16:16 +0000 (UTC)
Date: Mon, 12 May 2025 18:16:15 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: broonie@kernel.org, lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        peter.ujfalusi@linux.intel.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: Re: [PATCH v5 6/6] ASoC: SDCA: Create DAI drivers from DisCo
Message-ID: <aCIs30Zr0uXRt6cs@opensource.cirrus.com>
References: <20250512124240.799509-1-ckeepax@opensource.cirrus.com>
 <20250512124240.799509-7-ckeepax@opensource.cirrus.com>
 <8f94874e-0a4c-4c52-af12-c3e67e45cd18@linux.dev>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8f94874e-0a4c-4c52-af12-c3e67e45cd18@linux.dev>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F63:EE_|SJ0PR19MB6727:EE_
X-MS-Office365-Filtering-Correlation-Id: b6db1c41-c108-42a5-7190-08dd9178b52a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|61400799027|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?cXsnL4jhBX5VWstbZjur8tP6JMSseLjzJFjkRnXcoY1/gASPiIMUf4p0xA0o?=
 =?us-ascii?Q?2g9dvZIl+8p728wfXmo5206N+Aw5eB/h/vPCmW7neduC3OPfOBI1V6e/NjXL?=
 =?us-ascii?Q?vZ2CxB4Bq9wnyB1ABinHZiU3WoVoepzqxdxvroHiUUj/AhqL2FTb1nnt2u3b?=
 =?us-ascii?Q?hMkSx/SgdNrq30kx3OQBMTaVj3fPBA0LYFifWernaN7O9XJcmySz9xBmAqfG?=
 =?us-ascii?Q?gY9wVlrsXOmccDAyFe0jYy38Z1Coxy7u+e8PynrTN8+5ks73gIhJNKNR5/ds?=
 =?us-ascii?Q?1ko26NOYR6wELJyYWpkaLwfUWEG3Pp1K7nsc+3WzmCy01+0Ants7Xn8toeC1?=
 =?us-ascii?Q?DGsW0qpTUV/2G4AQ+wq6sSz7tCGtutNh2ICldFokkwgPz/+uecfn/bI0IILw?=
 =?us-ascii?Q?1HRer+BNLtZag19HBSggLKLBCrIpDW7GncjiQUZ5KBFMWAbjbNLkSApERxw+?=
 =?us-ascii?Q?g47unDsjg2P843p/kkJFLSY9yOZUItjrdVbvkAzuivw8B7IhvNs5T0aE3yd+?=
 =?us-ascii?Q?/vCL40oiTqKgrrBkQ9H5dLLdLT+EttTZQT7EHVJ/G77i525GcnSGMkgtECSw?=
 =?us-ascii?Q?xMUQILbCB/zAW6Zx9AXuNXu9LcfzG/O2veoEtJA0PHG3fX+Q6u4rTdaHxbv8?=
 =?us-ascii?Q?EeeNs738uqxwY6J6+jxfbfWMl1M+sGG82iOcrhYOzBeqMCIzPqrOmWh5Utkp?=
 =?us-ascii?Q?BOUL+jHLy2lggQ4I58sjcXOxXnNdIHIHVpDStjr6u1egnB9K3+40sKZ4XXV2?=
 =?us-ascii?Q?ufiFdCweiv7KswaNTEnDLgtfA6uJyIG2x7sOBxEUVm8yjEevHXeWSVtXF0oI?=
 =?us-ascii?Q?gWruDphQTLK2HA86w78VPXzSTPWqCLh51/rQDCExSbMTIxIOE0ezPQh2EZ8x?=
 =?us-ascii?Q?WP2cRfun+fmV9Qh/mJg5CoHZs99nkpuGXBh1m3gEz3UnsR12sfpvwW8QTqQx?=
 =?us-ascii?Q?2KwjOzpE4dzSYFik3EuJzwZVOX/xf0bgG/ECJy701EWPz8HIjmyyA8AZsQKN?=
 =?us-ascii?Q?2KjGXgQUv1sXeihbeq8ewcG3iWvm5bql30ncKhyC4x2DkTwLKoBJENPMDmh+?=
 =?us-ascii?Q?MzDkC9p6YWvZnb/neGiIAH9oRdWcYYpU5DGV/TFJ/SanCi2m7s5FPg+5nacc?=
 =?us-ascii?Q?tl0Wx32cPxJNwln5Q3kWpmeKRVrl5g9etYCi5ptUcdUu8mEePNQ+aPlR7a05?=
 =?us-ascii?Q?S8/ErtFVSN9srZu68//0QEqpv0CLe/+8EPh3evjPWTGDDdaAXWjj+c9Foxv1?=
 =?us-ascii?Q?A6k5CX6Pk20ROrY5i4nAnzombixHep54KbW8+anPOzWF6PklB4dS0lMB0qfU?=
 =?us-ascii?Q?gZsos1hjz/MH5dzMArzJ0tIK0qJQ0fWzbaGGVnqDcs+WGNTRnq9flN71l3XM?=
 =?us-ascii?Q?KqWEiCt+lkHdVgTv1/+n+W45U5Rqq4aHxZS8tfsKiahL67Gq398krOg2azYZ?=
 =?us-ascii?Q?EHMtbO+nIPVOkpZlhnN7+3hnW/dCGOuxYN/Mn9a7FdVQRmllhTBpLSQaolrY?=
 =?us-ascii?Q?vChBxzWGEflglTziNbES2026JG1CZpO82V0k?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(61400799027)(82310400026)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2025 17:16:17.5299
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b6db1c41-c108-42a5-7190-08dd9178b52a
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003F63.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR19MB6727
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEyMDE3OCBTYWx0ZWRfX2zQizKR5Uwxc 44CGzkVeU3ZQuH/0IZvYXnwCuXMi/LY7qn182foeBk9cSmeIErZ4D5WdGbTbLqB76xwTO/UaUEc m+wB77X+4v1fbeZE2jqdp4IDPrRpbgUN0jqwI3sWe11NV9JXP9RW4vvoKPz1geMOHOFtaL0ITrp
 6xyfwToQ3gaRPbIn/tlp9zNaanMLDuN3tlWRnDV6HYN9I7dq6ggf55gIlz1tGZaTteZDo4RtE+W ODSxFVdIYabPfp11ls3Rb5D4X5YsszFKSmat7gYCzWnZpxKOuSv/ch/LNbeLiRrodRMgHtGCrQ4 htA0Uh2GTPQcLJ6trDW8yVhq0DY1r8j+1t6KlwRqWQgHw4JX8H8vgCibtwMczfTxYYQxFmB4dGC
 WVZSaPRmPI1HtUuIqpckjTtCaasPPyS4Q9/+2iEM9+POTz4fYIo4NNY7UZ0Af1mwuWEgi+lq
X-Authority-Analysis: v=2.4 cv=Lcc86ifi c=1 sm=1 tr=0 ts=68222ce8 cx=c_pps a=LxkDbUgDkQmSfly3BTNqMw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10
 a=RWc_ulEos4gA:10 a=InPZ5WNpl71SliggAIsA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10 a=BGLuxUZjE2igh1l4FkT-:22
X-Proofpoint-GUID: WHE0DfTiO84vTg0dz3k2UuPUvVC6uo1h
X-Proofpoint-ORIG-GUID: WHE0DfTiO84vTg0dz3k2UuPUvVC6uo1h
X-Proofpoint-Spam-Reason: safe

On Mon, May 12, 2025 at 04:00:18PM +0200, Pierre-Louis Bossart wrote:
> > +		switch (entity->type) {
> > +		case SDCA_ENTITY_TYPE_IT:
> > +			stream = &dais[j].playback;
> > +			stream_suffix = "Playback";
> > +			break;
> > +		case SDCA_ENTITY_TYPE_OT:
> > +			stream = &dais[j].capture;
> > +			stream_suffix = "Capture";
> > +			break;
> > +		default:
> > +			continue;
> > +		}
> > +
> > +		if (!entity->iot.is_dataport)
> > +			continue;
> 
> should this be moved as the first test in the for() loop? The switch
> cases for IT/OT only makes sense for streaming/dataport terminals, no?

Can't be first in the loop since the entities can be different
types and the iot is part of a union so it is only safe to access
is_dataport once you know it is a terminal entity.

Thanks,
Charles
