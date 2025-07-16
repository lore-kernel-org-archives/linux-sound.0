Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8E3D2EAB63
	for <linux-sound@vger.kernel.org>; Wed, 16 Jul 2025 08:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752654509; cv=fail; b=BoLEt9bnGL7Ezp2+kt425YM5S97CupK8Dmi8nreb082qmsZ30RyOB15M2Me3BHstQ5bCaJg7pUGWJzmx0lcDnvL75QR6r5zVz9gMVB6VhdP0K/JlPPyBrZyDql8Izls+cL6OyzgXY9gFCVwsQsJEPsb20Eu8eNj6c5jZWR3c/ow=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752654509; c=relaxed/simple;
	bh=EbNlz6OddnpUlYJZHNI87/t0r8QlR42aGnYc8kZuOvA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TiLXOLf6Sr0otP4HzwgxRTEZdlgWY58TMOPh1cCJmDmsjAJuwBZQdOktJeho/IVTPiu33/EpJm2YNLwUftdT1Z7rl5P9UVxIAJsFp+PI0GoItMvwdrNc3YOS54nVclxESQe+F3WXX2zFYYtoyhA9bJ/gSSLz8/hTGUhFCwUQJYw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=h/Ac2gYF; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=TjiIKaqh; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="h/Ac2gYF";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="TjiIKaqh"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56G7bPEe028264;
	Wed, 16 Jul 2025 03:28:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=pBRGB64sQsQ32M3noD
	/oEJVnhYLNXs8F9YOHS6SSLPM=; b=h/Ac2gYFSWoGR1QO/WcC3wBjdrOQsoTPe2
	q9rnIuN1/uAAl+jc251BHhdp6fqUI+nD3dfi8rJAQSc2NI38no4jFHbmsog9kA+c
	7x5i+AWQYHUfVsvSCBtUbjafRtmUnp/pOd1PQqAumAtcgFyjrR89UQjngvWBn2sN
	Thp4mJYvQGZk28WSgXlAbz/4r0E+QSSfwArOQh0qbauLlsn6CNVoi/CEj4T4TaR8
	NDPXxjhssvmWhJhO5opsqtnTHJ1H7h28obu2a5gf8kSS0r34IkkVyI3e3g2GUIv+
	ybCsnihFzi+opVCZgBnP97MF+e6d4uC/Jv6lDWOIDaxwsPWd0NFQ==
Received: from outbound.mail.protection.outlook.com (mail-bn8nam12on2125.outbound.protection.outlook.com [40.107.237.125])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 47x7uur22k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Jul 2025 03:28:20 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bR/1qkIvwPu1RNtKboR13LcFDj7ySmCozDbe02eEo2oAYtUhfKB0NbNlpBRZVbYlsya9jOn2rItpCWtT1YfWj/dDCKlH0J8pDnOZfh+GccyVNA5hDuGEYsowUri8GFLkGGotHr19uf+u7WipdZYymesNLj/p3EcUl1X1a4PU2V7lVRhrEp8BG+7pvBRIqr6DkI4feBZqDHpLcClZn/o3CgMYF2gGSmtHpN7IATb2QIwVhYkmUnLkw/8/Tzi+va3quGVIoliTc+Q3hXBV+VlthLAktfmVZxHSFfCOXOdJTd/pgznzfSIrqZQ0kSEAm7U9decQ22dDzTLNe9w9Ks/FLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pBRGB64sQsQ32M3noD/oEJVnhYLNXs8F9YOHS6SSLPM=;
 b=WQvSjHIjvoDd3k+gDX7QH0tvURChAbiePNXTaQ4Fum8zILRH5tW/V5xYqbtkCxtesDcIxLvKiaUVo0SYOpLj4x285DrY4l2mY5sKiFhR7ZQQwxsB7/qWwXD1mdQJdmgWJNpdQVXDCFKgrmrYcopKjELwakOCkcSv6U/p2cVsf3DxSDc0NPxXDD2JDwWjbJhBtvhZ/yYtCLXbNY9lGxVMz58X1Bon+sItHqnuLR3ry73u4FokC2DplOklUlelsCRdGCNlaeC4Q/0gc7wWzYVVrl9Jwn02ExO+M7a7bkVEIIWKMsTqiTTJvCAu1B3uF5K9zFm1OccjbfnQhPoEvCak9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pBRGB64sQsQ32M3noD/oEJVnhYLNXs8F9YOHS6SSLPM=;
 b=TjiIKaqhHe4kVNdhNmcElnrc9raFIeDzGw4IPuNHUVenHglUWzlySLBX2ZhMpCfTrHkGzDLU+Oi+KHd1+xxGurB12JjZdc3m20IOHISFMvJlIJqrGVwIKM3BBYhJr2uOM0/8vHrqzeJkjTEs8wmh7i6dRPTmd1lX5bajQuj0h08=
Received: from CH2PR02CA0012.namprd02.prod.outlook.com (2603:10b6:610:4e::22)
 by DM6PR19MB4295.namprd19.prod.outlook.com (2603:10b6:5:2bf::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.32; Wed, 16 Jul
 2025 08:28:16 +0000
Received: from CH1PEPF0000AD83.namprd04.prod.outlook.com
 (2603:10b6:610:4e:cafe::db) by CH2PR02CA0012.outlook.office365.com
 (2603:10b6:610:4e::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.17 via Frontend Transport; Wed,
 16 Jul 2025 08:28:16 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH1PEPF0000AD83.mail.protection.outlook.com (10.167.244.85) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.22
 via Frontend Transport; Wed, 16 Jul 2025 08:28:15 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id F2A1B406540;
	Wed, 16 Jul 2025 08:28:13 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id DA840820257;
	Wed, 16 Jul 2025 08:28:13 +0000 (UTC)
Date: Wed, 16 Jul 2025 09:28:12 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: broonie@kernel.org, lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        peter.ujfalusi@linux.intel.com, patches@opensource.cirrus.com,
        linux-sound@vger.kernel.org
Subject: Re: [PATCH 0/7] Add SDCA DAI ops helpers
Message-ID: <aHdinBnBvSsfx/nA@opensource.cirrus.com>
References: <20250707124155.2596744-1-ckeepax@opensource.cirrus.com>
 <4336e9c1-e05c-46d6-939a-53fefb8f9a14@linux.dev>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4336e9c1-e05c-46d6-939a-53fefb8f9a14@linux.dev>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD83:EE_|DM6PR19MB4295:EE_
X-MS-Office365-Filtering-Correlation-Id: 98a09386-0ec1-47f7-ea23-08ddc442b5df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?aBqDK5LrBAepUnWlwPRV+Q4uWED6fvv24+dYUNmo8HY9tYZdCLiBgJC9HOC8?=
 =?us-ascii?Q?5x7rsf+vQwAo3VSy0c6cRoFz35e3mlUUkzxGe/1ut4KMprb3XdF0LnATTN96?=
 =?us-ascii?Q?seCrZ/+cQH1iIuD934iuO+mMbjHZxaZhBlbc6M1jdmHCzjzuNcf7EBJJWY9c?=
 =?us-ascii?Q?EWuE/HgaTmNGE5Km/g95ZA6h3ABMfUar6qPFjjISOGz3OEGtyJlaH1nm8HRg?=
 =?us-ascii?Q?F55dECneLR/HADG6A/KH0wI3hFYwkoWHjhAkC6OLExcj7DjTKUYrtf+6lIDv?=
 =?us-ascii?Q?SktlJ+pzdfK+N2amMWO2Glr4gc0veZO8KiOAc7CdNYO6YF2mos0JObMEjbbL?=
 =?us-ascii?Q?3dYEIAfIvNv43zlV9Gfk2/onqLrj52whxRfTfWNjSeF6RK4RipAx/qkkZjaL?=
 =?us-ascii?Q?Uy9yHqu4G2QgYWVgJi2h0yr3oae+uxT+FXPA/NbaUWLN+gZlI4pfrLHNDkI6?=
 =?us-ascii?Q?sBRZA2iL1HHRxQF1RESWLSaG4oetHLyTyuSiTckFj1w6+xO7dk+zYfw+LdS7?=
 =?us-ascii?Q?0uQTnUoaEUylbtXc2YOUiCrJCKnk5OOSnJej6esCRWPKorLt0c7rW2NDy1Ek?=
 =?us-ascii?Q?fPZdwshFUhPK0velIFALme3wRSbwXoaYJDJyCeazssLIWvuIPfB+cEdF1FfU?=
 =?us-ascii?Q?4J0UB1DMtsmCYLU1dqTcFeOSNK2oxL2ax5aUVPSueBhXE3WTtsX8z0pRHnlJ?=
 =?us-ascii?Q?SZb8cVW33wCREBbcPiJNMut2iJ/7e82Io5jmYmIjzaxCFfVxIdd2SjuA2irg?=
 =?us-ascii?Q?UdcpnjoZqP+JdpTJg0Ld88zsLT79BaPCU2MSwL4s0G1blaQROJxn4CB3H9p0?=
 =?us-ascii?Q?QB7Wsd2bv6sBdgs2pN0zWrOJTIrvjKL4Gqp4zVVfvWIhH6BRYDH1Zz1iI2+E?=
 =?us-ascii?Q?NVttfPctgmqxHRDwPf2jmyjHlgOrXdqmtFb5eb/NuiUftONX4tVAcj4QVGEO?=
 =?us-ascii?Q?iJE89AFvACeawAeWRfqAvVTH/TELEt7V6+6HDXfmiG4n5fl0JH4XgZ/mvMtv?=
 =?us-ascii?Q?SB39Zd061FWjSnp8LPoPQqDBevD3dmRjl3rc/I2JurjejU+RVMWoyi9l5wel?=
 =?us-ascii?Q?z0cIhrfJ4RWVXvJZRP13jDyLDIZqokZ2Hf4D91gmPSjCSYqZheZ3MFlLrhej?=
 =?us-ascii?Q?FetXRv5OAY1H1K0PwmikExKUHuDSTztq9AtoGO34oYyjO8i4IJcoFJOZ6goq?=
 =?us-ascii?Q?QX3YTkA/jd2KmBCnDtbfVvcdtu3NW2YInbMdKy/8MgYVHECrxBEFvKtA8Asy?=
 =?us-ascii?Q?a0SKksOGx2uwIkfeVahQPriYBOsq0ErlHFcnqLwzWR3iSw40JRwFNbGHT5Kx?=
 =?us-ascii?Q?gokTVQ4tmSOOWlbxgHVhIZfPOl98iNTNltsbzjTXBxvNlFnNaxIXyZCG3NQJ?=
 =?us-ascii?Q?ldJ/CngZ2BJWsqEtW8HUbChj74FOnT8a/UNf+NGo6Kdwc7/oT9KAergY9Mhk?=
 =?us-ascii?Q?AXQ/r6Y0Bq9adWOsY3FBxLW960kYwIrkclllw7BBiq+f0b92jCdbd06RvVQX?=
 =?us-ascii?Q?QqIYpIGImyjr43izQXRnO1pn2REUC64dzqmb?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2025 08:28:15.2345
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 98a09386-0ec1-47f7-ea23-08ddc442b5df
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD83.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR19MB4295
X-Proofpoint-ORIG-GUID: PoGiSGM0RKX2_JnrfuhhsqFw2qMX4p4U
X-Proofpoint-GUID: PoGiSGM0RKX2_JnrfuhhsqFw2qMX4p4U
X-Authority-Analysis: v=2.4 cv=IIwCChvG c=1 sm=1 tr=0 ts=687762a4 cx=c_pps a=azKGx87FDiaoMypZd7Lp/w==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=8_ve84FZosz4XKmX5poA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE2MDA2NyBTYWx0ZWRfXzgn0LZhIQ4WU kfwweSOrNNMfIbC4lIDAHklihKdieK4QH/hoPOT5aK7aQ9qG3q1g+yP06glSNnvK6+POieYuVZ7 6875n96OPfHeVkWAnne/odnb8YpedwgiLbR1GZOogMFvaCwH5OATOo8YeFrSypIYLiqKymVq91U
 lKO7wChv1vnzx3+RGOjGaMex8ecBYHnGVm/xsqsCKJUqMsGDfKyZVc2ZErVVl6N70cwhv7Te2TM mXaN3rR/+8lKqK/L1blXD/vWqOlPBfkQ92YAtUi035QTmIAiuBv88ZxqSB5P25ma5EcraDoa1RI rUPra7K6l0yzgzQFfsqkut+77u+C/DFIL0/nDgUDIkcLet6cmkqLQHCO3iYTGSrx9HUET2ZmX6x TN/GLuoq
X-Proofpoint-Spam-Reason: safe

On Tue, Jul 15, 2025 at 07:58:32PM +0200, Pierre-Louis Bossart wrote:
> On 7/7/25 14:41, Charles Keepax wrote:
> > First, a couple of minor code fixups to already submitted code. Then
> > some patches to add new DAI ops helpers for the SDCA stuff, these allow
> > configuring things like the sample rate and finding out which SoundWire
> > port should be used for a specific SDCA streaming input/output terminal.
> > Still a few bits of outstanding work here (propogation of Cluster
> > information particularly) but his should be good enough to get some
> > basic use-cases working.
> 
> For the patchset:
> 
> Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
> 
> > Hopefully we are getting fairly close to completing a first version of
> > the SDCA work now. Should be one more series to add FDL (firmware
> > downloading), then we should be able to send a first version of the
> > actual SDCA class driver itself.
> 
> FDL is a very desirable feature, but shouldn't there be an UMP
> (Universal Message Passing) layer first? HID and FDL rely on UMP.
> I would have expected the ownership changes to be handled in
> a shared UMP library or set of helpers, no?

Yeah we are still working through the last iterations internally
on the FDL stuff. I think it probably does make sense to pull
out some UMP helpers (indeed I was have a look at it yesterday)
although they should be pretty simple so I imagine we will just
send them as part of the FDL set (subject to change as we work
through it).

Thanks,
Charles
