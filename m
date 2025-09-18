Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD20B2EA49F
	for <linux-sound@vger.kernel.org>; Thu, 18 Sep 2025 12:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758198179; cv=fail; b=PEwBOXx2I8t08QJaMyqSxvjx5d9SOwhAcqHxVOZXY1L0rv1jpteWpsT45Wmq9LaydYMRifM99+r0Nj5B4/TR5nasL4JWda05eLMQBzZZtLF2E+e4xKDi72bIF1b7EXgHCGyv7ekcq/d/ZRLgg320tob1Y1Gb+PAXc+NEZE5FiF0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758198179; c=relaxed/simple;
	bh=fo+BOzL1weN5XhFNPUwLKDG4IYs+eWQ/yvj5qGQK3Ck=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AaqcJAIc7EaQHU7mDmX1LduN2YFG+7+hnfFFw7zAY3B2hIJ7oym2K7uDGe/muZIihdVAbB0OwfqTzT0g5+YPCn0uWlJS6rST3zcwbK24tfK3S2zbl78l+NpIw3Wyyx9gPSQIM8Ug9wBwSWs+jZUdJoFklV9eTU9oirvRqMtoYqI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=ODlsKOCl; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=xmQ4mJQc; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="ODlsKOCl";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="xmQ4mJQc"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58I9x4Yw1775648;
	Thu, 18 Sep 2025 07:22:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=1sr2vjD2IdCJZuVYmz
	sr+KHfYb04LAfK+HvvqstyQRc=; b=ODlsKOCl13AVModGVMNCKr0A6bzGRnzDwG
	R57wA9qDfaYWwJkc0Kz5caP1dyLN+WtR/4Eym/NbFOhikefMXGZfCYXVPqU0G277
	YTJpDtIoICv/zb9PkGtjPJ+I+n4DjK+02TBTNYIg7wvIOrpaMw4tlpl6vbz+du77
	cL2G4DqwvXIlKsm5/fPXBGvJrAKX9it7CfGDNmAt+NLYshu59NMYIeaQrx92ri7w
	Lg7S7X5te5sSQEdY1rKIm8xfjP9KUfIn/zs+WtLXL3ckJ+/AK7Y0E8SYBjGOijsy
	CRajN29AIf30mDdd4xRyxK7uAz53NYSwg61+45Ea2jM+t4R1LvMQ==
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11on2102.outbound.protection.outlook.com [40.107.223.102])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4980h698eb-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 18 Sep 2025 07:22:42 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FP2O8ILk0n/egh2I85poQlTFqUap1fZqx/2pwAI4ihbJXwe7tfkc3way5LVLKMOU6XqGPuLibOfPeZLjSdXifbaZZotc8jdkPCa0MrwOVRw2HgYuWqLcZ4uHHfS0ex0zZ1lBUBZMP7K+8WBLScCaNrY2nuho0OhCWKK5lpZoyhuj+ZhOUJiQ3X5nKBhY43fiN355yDrDP/ZZY8XMwoOPC5z+PMLrvktxWtLTUoqvsmYJtFswP0mjUdRj+n3vPRwMRNrF69+h+COiQO32f2RliIcYjElAsnAChXmef6mVES+Qlp3xpPj7Vl4Ux97YIkpuBfHQmaEbA2n6uxehW1qNxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1sr2vjD2IdCJZuVYmzsr+KHfYb04LAfK+HvvqstyQRc=;
 b=UMsNFQoMnUyHeKrhlohyVUbK5ijtdU2qednau2bClkPH2Xmyku3RcDI41FsBVmWZqxtwbxLjjpcSmPbfWKaOdPfRfWGEwUVWps+WtC44RDH3TsxWxO9JLnbek/obOfxcxAajynBJSW9BC828BDBRjeduLi78hEJEXrA5A2U5D7t4cHMcuDolfm3Y4eIiocxpIdr+Fe7d6K4Weomq60f5T6mVkC2887MDzYZw8zhnlnb1DVDo228e/i88rniFYYBBFZhbsH7nbR2qWac/xzo0gfx28XnhJOE+hCv+IBuq2x87CfXv+5zivCMlaO9bHC1haJ49/cqV0oTgnGLUeepYkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1sr2vjD2IdCJZuVYmzsr+KHfYb04LAfK+HvvqstyQRc=;
 b=xmQ4mJQcdTHE2GLSxi4SklkSYgp+pi3t7lCosWfOaDihBT0oNX26cQQ1qVT5jaGCGJ6qNRd6K56l4WikplfloM9fz90Q0d5gALS34des7OzHeuU5m3ZmMoUiD+GH6skhwwP6HBzSu7YS3tnlGiKsJMJ8VuBx0//XqZ7z5jXBrYg=
Received: from SJ0PR03CA0218.namprd03.prod.outlook.com (2603:10b6:a03:39f::13)
 by LV0PR19MB9240.namprd19.prod.outlook.com (2603:10b6:408:328::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Thu, 18 Sep
 2025 12:22:39 +0000
Received: from SJ5PEPF000001CF.namprd05.prod.outlook.com
 (2603:10b6:a03:39f:cafe::b) by SJ0PR03CA0218.outlook.office365.com
 (2603:10b6:a03:39f::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.14 via Frontend Transport; Thu,
 18 Sep 2025 12:22:38 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ5PEPF000001CF.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.12
 via Frontend Transport; Thu, 18 Sep 2025 12:22:37 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 39E83406547;
	Thu, 18 Sep 2025 12:22:36 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 213C5820247;
	Thu, 18 Sep 2025 12:22:36 +0000 (UTC)
Date: Thu, 18 Sep 2025 13:22:34 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: broonie@kernel.org, rafael@kernel.org, yung-chuan.liao@linux.intel.com,
        peter.ujfalusi@linux.intel.com, shumingf@realtek.com,
        lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: Re: [PATCH v2 12/19] ASoC: SDCA: Add UMP buffer helper functions
Message-ID: <aMv5io0wl5/S4Ow4@opensource.cirrus.com>
References: <20250912103504.2679226-1-ckeepax@opensource.cirrus.com>
 <20250912103504.2679226-13-ckeepax@opensource.cirrus.com>
 <b1d1d507-1a34-42b2-b154-5c4ba100cc83@linux.dev>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b1d1d507-1a34-42b2-b154-5c4ba100cc83@linux.dev>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CF:EE_|LV0PR19MB9240:EE_
X-MS-Office365-Filtering-Correlation-Id: f7912458-af20-4b10-47aa-08ddf6ae0e40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|61400799027|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?b/W4DJA1QljEHh2yXK5eGkFTrJYdWjC9B4KmEfSCyCveuAIJ3Lm08tsvgW76?=
 =?us-ascii?Q?EyIZxU+y8uZxLSnnwo7XFBks/OX7ylnxUmeXyovO6W5hFiRsFOd8C5CD+BmE?=
 =?us-ascii?Q?RNlcTBNvbyrcCm1WhT0Hf7MaI4aF6dX+BrcuIYyj1dEfF6sIDVD410gqlWs3?=
 =?us-ascii?Q?kA8LMw+ZQg4WM7E1n+0BXBgOsoTFkoo+bnyxN0C8NyPnoULBbnS6g8gJXs5+?=
 =?us-ascii?Q?ywTaHITTq/bKRDQ9OcEA4eApTWi3gTYUrmOUcRSD5b0/oitUYSPjj2Jl+tv3?=
 =?us-ascii?Q?Keh/xF9umvnTX9Y2tqwiHax9Iny6KzImFvj+vBf//CNeQlX1V61EUpBSAp9S?=
 =?us-ascii?Q?jfFbnKQF5zsQ5TNKRtZnXnjjSe8o0RXqjNfJnChrYZKibA/X7VZqU4l1PkIX?=
 =?us-ascii?Q?11gM99HQOXjYsPymMFUA5w1r/Bk03GUwp5M7ke5uKbk2dZI54eHhOMDC8ssJ?=
 =?us-ascii?Q?1wR+tPrQNVuzNUdoobygo6OPT4t3297vIkafjfrdbIrmMZb+mjvbiBo9iGBX?=
 =?us-ascii?Q?k2DteepQJviNLaBHjihnTZ4QYg6dTVVAdAVbf8+evFvz96zb7ItIrmOo+3Ys?=
 =?us-ascii?Q?smPciZlFjByrU72yp9+Wty1KToEi2pADnvB+BRFBaJpvbnaBYLCRmxOYpNC3?=
 =?us-ascii?Q?HHJAQxZYIyzS6lY44ZSyqB88o5xadQ4YWaykFps6zrnQphdB8TRuZHcmvXUX?=
 =?us-ascii?Q?qGluYXB7v+sG+9vOW5KQbM8ME5IH43rojabm9w/iwJbENOvyCivDdwB0qSQ4?=
 =?us-ascii?Q?CO1eZCawz1ePSrPk0+FIaJDJi2upg5UsfkFolg9awKNEQ+CtHhJ3+BVXdQuD?=
 =?us-ascii?Q?aSyrSvfjq4/JtuD1zNHJ4bqu0lwOc2Gym4A9YyHvpArgzNJnv2saMzxtP+9B?=
 =?us-ascii?Q?SuZxtomvShQYnabyZLWeB1luBEwICvcgxZYfHAQAH5hhzA/KPHZhDUTMSM4k?=
 =?us-ascii?Q?YZIFacKkSoLUOwU8B94YD2Y9AG67LmI1o4Ea2Xax8tEIn/sDDWu4ddsubVTY?=
 =?us-ascii?Q?n9nvHGAGpyuKQaFd6jJ44st6n5YE+tqzrAostQKa+Jv2hmw3GPZDeKmABRUu?=
 =?us-ascii?Q?JksB/2gZZThG0aKFkjp05S3Jb4FHzOW5z6pD39U+7Tk4YVicEqKOv9kzQz67?=
 =?us-ascii?Q?8dOtbVLrE6Ev6185v3gScaJjGGmi56ehZ4zJpWC2Sz8Lz6rqptiaHCIq2yXq?=
 =?us-ascii?Q?F9mGVrnKKVnYcASyb+KBIgWq7zABmUX9p/s4DUdYMZ6ZCI/Dhbrl055nuPmF?=
 =?us-ascii?Q?fCpO6uUXLQH69n6Jucs+gbqdpDpfQEOh7QKO6wa/N14pWb3yQe1jEhnglLOv?=
 =?us-ascii?Q?rOggQ7fxyzKYlg+xcrIooZH0+TGGArYIZ4gBaeZleTvG4TTYkL+ies8ndHBL?=
 =?us-ascii?Q?8Rq3D6jh8Kyf6IX3jmdAqxBZzl3m+0gpTxMxg6pnzuTSiC6UE4vxYxvOOkMd?=
 =?us-ascii?Q?9S7yuSt4afgK92p9xZAUgziOfQLKcG8jU17K+aAMfQmPaS8h1WGaeiyvG6+d?=
 =?us-ascii?Q?ZydK453IQRmiBeGXWlGw7nVqqeF4L2DmyIjz?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(61400799027)(36860700013)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2025 12:22:37.6956
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f7912458-af20-4b10-47aa-08ddf6ae0e40
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ5PEPF000001CF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR19MB9240
X-Proofpoint-GUID: _fHwEU2U1qx5u3w3PbjPHl4VY2B7_Jeu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE4MDExNSBTYWx0ZWRfXz4VOvYDkSUkT
 +YkYt4KW1p+YcozMzkQMWYpymN0nMrFsyNg7CHvHx8WKq5bFUqFoeTYbNMmf8A2EQGcJ4xkIp11
 f8y01NMwUo6UlwztKckCQCTyueVTUdyHZiNBjz4nZGMN41wlBXv+QYTxWKALphZ7J2a4MTjGrAI
 4kZ8WwM2I7TZCiiev+a9HoWn1pIvuzQTG4Qopu4cqxxTKWzkaOenvJWgOHVuW6boL2ADhqhhyHs
 hZ/jZTJSoqyplACOJgMjAHeHjlhKGRIcxaGc01ycuCB888q9xebb3cMFTd+r/SGhNJhiv/5t6t2
 bArH895ssSQWRpuZPNKRWjQd3eqW5h9beiuzuFrdborJdhaW9I/M9YeG+KGR3Y=
X-Authority-Analysis: v=2.4 cv=M4lNKzws c=1 sm=1 tr=0 ts=68cbf992 cx=c_pps
 a=mEzR6i2+MZAQiuWfcobVjw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=kj9zAlcOel0A:10 a=yJojWOMRYYMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=HoioSgxbveDUvxiZf0AA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: _fHwEU2U1qx5u3w3PbjPHl4VY2B7_Jeu
X-Proofpoint-Spam-Reason: safe

On Wed, Sep 17, 2025 at 09:49:29PM +0200, Pierre-Louis Bossart wrote:
> I am still missing the big picture on when/where the timeouts
> read from DisCo properties are used.
> I looked at patch 14 and I don't see any timeouts used except
> for the reset.

Apologies I should have called out in the cover-letter patch 17
adds the timeouts.

> > + * The caller should first call sdca_ump_get_owner_host() to ensure the host
> > + * currently owns the UMP buffer, and then this function can be used to
> > + * retrieve a message. It is the callers responsibility to free the
> > + * message once it is finished with it. Finally sdca_ump_set_owner_device()
> > + * should be called to return the buffer to the device.
> 
> Maybe I misunderstood something in the UMP spec, but I could
> see a different flow where the host does a set_owner_device()
> and later reads the buffer updated by the device once the
> ownership is given back to the host.
> 
> I think you're assuming that a read is always initiated
> by the device, but what if the host wants to read something
> (volume/acoustic levels, etc) without getting any notification?
> 
> IOW, will a read only happen when the device throws an
> interrupt on its own? The spec doesn't seem very clear on
> this...

Assuming the host is currently holding ownership of the buffer,
then your example would look like:

1) host calls set_owner_device()
1.1) host optionally calls schedule_timeout() if it wants
2) the device then fills the buffer
3) device passes the ownership back to the host
4) host receives an IRQ on the buffer
4.1) host calls cancel_timeout() since ownership returned
5) host calls read_message() to get the data

The device should still throw an IRQ when it passes the buffer
back which the host responds to. IMHO there is no real difference
between the two use-cases you are talking about here.

A read can happen any time the host has ownership of the buffer
but the UMP helpers don't make assumptions here, if someone
implements code that calls read_message() not in response to an
IRQ that is fine. As long as they ensured they have ownership
first.

We do make slightly more assumptions in the current FDL code,
primarily that the FDL buffer has an ownership IRQ. There
is the slight corner case of a device that wanted to do FDL
but not support IRQs. But I think its fine not to support
everything especially kinda esoteric stuff in the first version
of the code.

Thanks,
Charles
