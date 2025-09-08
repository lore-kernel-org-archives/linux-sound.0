Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8608D3594A
	for <linux-sound@vger.kernel.org>; Mon,  8 Sep 2025 13:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757337337; cv=fail; b=mLojx5PkHMD/T8VjCNKnH4wkIBchbEgaSBWNtWyuCC7T46cTOaLnK0K2YMuLld6aeqlax6Rq35y5BO1Lv/P43zlm3S+UR4RpG6g3w2o0zSNQegPrRbNkGfEzrO7SzdATuCIXzAFrLQN/I4IQTTNsk7eMcPk0PZu/JDiiQP6sI/M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757337337; c=relaxed/simple;
	bh=ioc126Qu4FIirFQmLLe/L5zZX4n4zsPZwSVJ56on5w8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o2ylEHDxBLI0i4pWs+v7OHt+pQuHZ2B5ocJ/yj8K9co7OoZ60b5jjKKxl4HLbujrToGEJpZvKV6D8Yky9OTJ8oSJQLd21q8hLLc8Z1EM94FVtnYQrm/C11VAvPNYjxbFeqygeY2DkPoB1Ara2d0/rXLyZO1RM4qv58Yo22/PBoA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=Oa2yIS83; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=AoSMuke/; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="Oa2yIS83";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="AoSMuke/"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5888UNDp2151861;
	Mon, 8 Sep 2025 08:15:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=vIGilvRapJgiFYv4Dm
	6RExuKTmXoEYyMgoGMT/RH+5M=; b=Oa2yIS83N1P4jmvQapNB7Ce9ZjxbSEhRa4
	Kd9dXhFwP8YVHjJ5pGHWxwyFknSrdZ+azTtS6R9wb5BO9tKULkVzM0+sGbVXHtqa
	dIBSeapHheVeEc0H63XVsxObZu/buYjwAfefi8hWZ0xapC4MlKNPUKT4LyOuIPo2
	3hBNidGAZUtfZBWe3OAP6OFlOkGs+NMa2LWhhmo85J1NaDuX1DIhTHNu6xq3Vr/o
	Nm7Um81/BMvdTRkEHHLIIidk0NW3sDheMR+bok1DdPmZjeNGbqFNFMfkN7mzbDvp
	guZn9N6c8NxpkJYzujfh3YyrAgofq9RTv5lFYKn1v9mXNRcmsnOw==
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12on2131.outbound.protection.outlook.com [40.107.237.131])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 491upq897x-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 08 Sep 2025 08:15:18 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ir6qxlnUTQMY/id8psox5Fat8KSxHtuYCPdyLUO5+qbGn/TSU1OHf/FbfBU/uiuc1fAh7IZ10RsXdB0jEt0Hh7ac/QMbX5BJOGnRNxvqvgVrgOJ1sxcpkKwVnWFPn2zsXsSQdmO6e/usBsUdSK2ZQWdcrW89PWgCekreQaO06H6qeW17BJ/Zo6fwidB5Rkz5b/SkRvJKALi+RPJq73jX33d1VQSDLIHc1/HyqXQso83rvNq+30Jp3sdH+deAtwiiPIjLDPSASwrgyKHl5ZHlZuEdJCXXMCH2Ku8JdSDPDLASdJyXX2eEwAOqaQHa/1zb/zXowTJtVJoVsmFw/sx0zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vIGilvRapJgiFYv4Dm6RExuKTmXoEYyMgoGMT/RH+5M=;
 b=giTTEA5fwRYSYpTa+BMTpvCTHPcz+uDoYUUWFcVL02YtOCgiJq6LJ81HNZiZJQXyv+A/qSXThZYbwSO2tnxT+tykRyspF9g6JC7QC56YpX4XNONRb7NC1x4AWeyJExxubKWkfvJqftnaPp29kM6GVgM8pA/kpuQD+0wsiiBCv4Z1kHgbcmZg+1l1bXSWp6xufpW7qco09k2ikJJ94a8iXC2CoMwUmYB5Taof58SX1d0aAT1Lii/Jmj20ppzfCK58hkmVdSFCV+o8Uo7Ne1LhV8l0wTsp+U15HQ0l7k5JRX8X0AaNSVdc78ruX6ydYcjSiR7iip0fNVv9weAAnf/qXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vIGilvRapJgiFYv4Dm6RExuKTmXoEYyMgoGMT/RH+5M=;
 b=AoSMuke/pdjCTQKN9VixnjP+kIhLKi6/YdbfY3p2d5Ef9MkBHGj3ebym0l92bqWDmXpfIv3OG27x8KenkmN9nqq9HfMx374uYzY9gmxiaasZCzaKQGRxwy00GUttzZuQjC3/RXT8wY4mrhIgfZ0Ds+/kWEQjJvCeRP5Om+MBfks=
Received: from MN2PR04CA0003.namprd04.prod.outlook.com (2603:10b6:208:d4::16)
 by DM3PPF59D2DD56F.namprd19.prod.outlook.com (2603:10b6:f:fc00::728) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.19; Mon, 8 Sep
 2025 13:15:15 +0000
Received: from BN2PEPF000055DB.namprd21.prod.outlook.com
 (2603:10b6:208:d4:cafe::87) by MN2PR04CA0003.outlook.office365.com
 (2603:10b6:208:d4::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.17 via Frontend Transport; Mon,
 8 Sep 2025 13:15:14 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN2PEPF000055DB.mail.protection.outlook.com (10.167.245.5) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.0
 via Frontend Transport; Mon, 8 Sep 2025 13:15:12 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 34E97406540;
	Mon,  8 Sep 2025 13:15:11 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 1E6A4820247;
	Mon,  8 Sep 2025 13:15:11 +0000 (UTC)
Date: Mon, 8 Sep 2025 14:15:10 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: broonie@kernel.org, rafael@kernel.org, yung-chuan.liao@linux.intel.com,
        peter.ujfalusi@linux.intel.com, shumingf@realtek.com,
        lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: Re: [PATCH 09/15] ASoC: SDCA: Add UMP buffer helper functions
Message-ID: <aL7W3iS1YxGfk/AP@opensource.cirrus.com>
References: <20250905143123.3038716-1-ckeepax@opensource.cirrus.com>
 <20250905143123.3038716-10-ckeepax@opensource.cirrus.com>
 <e85fa12d-727c-402b-a7c1-493d2224f228@linux.dev>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e85fa12d-727c-402b-a7c1-493d2224f228@linux.dev>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DB:EE_|DM3PPF59D2DD56F:EE_
X-MS-Office365-Filtering-Correlation-Id: a4da4392-e7da-47e0-3798-08ddeed9be86
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|61400799027|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?g+Vu9xNi7Knx5GSwu+PJalfTDkXWjqyU/9s5wtsKrmxJDCeBtz5v+dP0B3gY?=
 =?us-ascii?Q?OdISJNHWJnGlSmBN/GrmC2Q/gHOfYoRyuojr9ju1YRj8IRGcbT8YL81SSTL3?=
 =?us-ascii?Q?HGKbqhSckamw7NAO0F1+Kdb6iaQnhINijnk4Kda9JYcWrcfHHimdThh0U7nf?=
 =?us-ascii?Q?J5ujqACM7fNJDxRWA/Z3jjbe1YyrVSjebBYq/4v3UV8w1IWU9umq1em7GOu2?=
 =?us-ascii?Q?fxOA/AHMOXm8ynbBbjnCPcRh+NXaUkQUrv9Y4ki9Lcz61ZqO8tPb67A8o8OB?=
 =?us-ascii?Q?Vapu9TgbBbEPfncbD7sgnVt2JUNnT3YGcP7qXwbpDyhpk/UuzeEsa33Lg2V+?=
 =?us-ascii?Q?f5d5hLk8xXA0R0wsh5Y9GJj2FNMhC/qWMkJTT04yc5fOZQKp/dBZU+QOS5Fc?=
 =?us-ascii?Q?wIaaRlboAsH+1prJ2SlI+L15JoljR+YwwszDliROEuMMu9GM2q+xlLw3lf7l?=
 =?us-ascii?Q?pkGEPtbdB36AevT34BNj2zjB9QGJtORRR3ewoq+i2ciUTT4hfmV+5/yOH9h9?=
 =?us-ascii?Q?rQybbIhPhPmwyM5Jni9fWSgxNCNxE58UXELWIaVxJZvBvH6T1LMlyNBQMCsx?=
 =?us-ascii?Q?btATYmddDTfBCM6zQQECo5WG0zGpPKk/NO7As4cXhQDieabh3kM8T1pfAqvX?=
 =?us-ascii?Q?e8vizlTZMCbw0LdVs/vaJrmCClA86OahbjRdXAa7BgD1D0OwAO99d3xVrVDy?=
 =?us-ascii?Q?W4Ig8rIG0IsXvOx+3Mo2cYh0M2JfTUtx3usZk+oDl8Id1b6Pf44kNGbupMTZ?=
 =?us-ascii?Q?0bYunJ8jGXHTNzsIFFtVJ62FhRtxNs1qoy9I7TYgtS57mAkhUB67pIjthe/Y?=
 =?us-ascii?Q?nqi/GmfPZkgxpHNsW5B3olngG2xyLEnH7cPSJz6BfnBKpwlmwqWxNJqcRFDR?=
 =?us-ascii?Q?r6yJq7Xi7Fx1p2tuDEabBGHR8f2O93QIJ1YQ53YoXytQcDkuVJ+e453gPjLS?=
 =?us-ascii?Q?iax8BV/GTUxSX6TD8y/4mAynvzh2eqfndHS4yA2HFk4fGqoRHQf/x7UWuGmH?=
 =?us-ascii?Q?htg5PepxkN8aKJ90N4tc3JCJlG4BL7e7v4UcWqdpWev91/dG8HOjda8oBO9G?=
 =?us-ascii?Q?kWiOeraZwqoqDJgBtXPpaf9KR32LUqRv4XV3FsfdWjJcxlmPhP48fw3npwCU?=
 =?us-ascii?Q?q5+AcyMGuAhRG66O5KtBGnCDcry/yg9OAgnDqR+cSV5uVyCzPE81+QDWfkX9?=
 =?us-ascii?Q?qu31VokXrup90sjjamVBNsSawf4ZbYKluYwMhmnISL9+Tq3eCngAR/o4Y7Ak?=
 =?us-ascii?Q?oOrPiNsdoyt2VSO521HnTLc/QeAUEgjXWmGDEBoXYL0w3cwkFJEQLPKWsXAX?=
 =?us-ascii?Q?BIKkH76MbNcqXmDE6Gvrqo5ExTROt/PuaAFSGsSioRyxWwWes77NV00f+n10?=
 =?us-ascii?Q?hUC0v09NL73thjHxezmOfSseA/dqUS9M7Bm4g6H2WPKMRDV31uW1rhubu7cD?=
 =?us-ascii?Q?NS/xzwjgG1U1GbBVzsKK8YDWhIiwN/sXozW9IKk+x3cRjpEqHCwK+zqB3ayg?=
 =?us-ascii?Q?9Sn/A4LbS6hLpJLKdOeLoDbbSc9ITtGOxdg1?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(61400799027)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2025 13:15:12.6111
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a4da4392-e7da-47e0-3798-08ddeed9be86
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN2PEPF000055DB.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF59D2DD56F
X-Authority-Analysis: v=2.4 cv=DMuP4zNb c=1 sm=1 tr=0 ts=68bed6e6 cx=c_pps
 a=fcxaBkvc0RdMyUcE3d7x9w==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=kj9zAlcOel0A:10 a=yJojWOMRYYMA:10 a=RWc_ulEos4gA:10
 a=YviSMFNB1ML3Ts1k4U8A:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: z5UfqlQPXcb7uFHNjJJy6yQW0B6IJgcX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDEzMiBTYWx0ZWRfX9v9RQJinwPzM
 iGc3M+5yvg9SsapDH0f4TKQ+BSzjY4fJ3vsmm4UGrryzoj5Sh/xxz2LjvcC4WbZbzyco46UmYKM
 C44rrjJlQ7C4PwTdWOfGWNnkn76FshcM0DCTVGsUsO1Y4QlJ/scjofMisNM0QRaokE71pgEDVrC
 Q+bWk7yeh8b3sHIDTgWVMHlurfTz9+nzV5uj9HVrIHz6YwOyYVet1gFBneZMmDqtx8X4ODoV1x9
 yOhbsg4oLU/eMwXLelTu531HbTvjq4Z5T1UOgVn/7Y1kVIljRgy4RRSR/HnfK0F+RTkGkQ3HJq7
 iUIekdr+nNVN4KnAZI2r9t/QdrCl1mIENu8KFCqcA3KYXr8X1qWbox9r6v7QBk=
X-Proofpoint-ORIG-GUID: z5UfqlQPXcb7uFHNjJJy6yQW0B6IJgcX
X-Proofpoint-Spam-Reason: safe

On Mon, Sep 08, 2025 at 02:02:09PM +0200, Pierre-Louis Bossart wrote:
> On 9/5/25 16:31, Charles Keepax wrote:
> > Add helper functions for handling Universal Message Passing (UMP)
> > buffers on SDCA devices. These are generic mechanisms to pass blocks of
> > binary data between the host and the device, in both directions. They
> > are used for things like passing HID descriptors and the File Download
> > process.
> 
> Humm, these helpers are very host-centric and don't seem to cover the basic
> UMP message passing, e.g. for host to device:
> 
> 1. host puts information in a buffer.

by calling sdca_ump_write_message

> 2. host sets ownership to device and waits for ownership to be returned.

by calling sdca_ump_set_owner_device

> 3. device does a bunch of things and returns the ownership to the host.
> 4. host detects ownership change or times out with a failed transfer error message.

by receiving an IRQ on the owner control.

> What am I missing?

You might need to elaborate a little more on what you think is
missing. The four functions implement the four operations that
power a UMP buffer, checking you have ownership, passing
ownership back to the device, reading data, and writing data.

One could combine more of the functionality into a single helper,
but then you start to hit problems where you need to do extra
bits.

For example HID, very simple just: check you own the buffer,
read the message, and pass the buffer back.

FDL, has extra steps: check you own the buffer, check the FDL
status, then write the buffer, then write the FDL response,
and only then pass the buffer back.

Thanks,
Charles
