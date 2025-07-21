Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE80B2BE04A
	for <linux-sound@vger.kernel.org>; Mon, 21 Jul 2025 14:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753107044; cv=fail; b=PMYZxgJkX9p8iZ1Qv9sRV5RxI7HzDsaRYgbgTDFs5dtxPXr+Zku46rrH+1ktzcPm6oMZZwQIaKG8btZTaPw0x1a5J53MBTGIHpvtxdUFjBN5prKXOt7o8UFryZg1zWke9DQa02yefPypmjkDXXPqjgR//Pizbf7qTUoVJGQR35A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753107044; c=relaxed/simple;
	bh=HGi0W9g33w0dhOO3az4QTlMGBjLckVMgB5vub8lw9oA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m64pi9k0HxbZIFR5ewKhBLg0uvTv36AXdHFo5Duqa3cQU3MQunZ4r2L2Ur0g8rJegBX/nOat8mauPZ8Bl49kUQJOS3THcYgFCzbXZY5OEDifmYEABAGfIkBt/Vjd/lujaNq+ZxNSoGnzqPMcZnm+hsm1UbBqi8/IHaBrEVFXTgo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=Ap564G9L; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=HenpAiA+; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="Ap564G9L";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="HenpAiA+"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56L5SQtu003621;
	Mon, 21 Jul 2025 09:10:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=KvQ9XDOPe0uNwjQvVD
	WzDR68nX0gOxFw9CyYWsd9O1Y=; b=Ap564G9LSVx4m62Xq6dyc+/AXjXdzmaw9g
	+niTR2QzZ3N0RrGZjqbhkPY6Bsz2b+MZAndiEF0PNOGS7UXE29014upLszE4ovwx
	p5hPzBsf5V73Hbc6wfTxALs3BDBiGa0ZIfeU45E4L0Vy2y+RovYX/7eFXQ1iSTsX
	s2+JJqD1iXiszphhk1UZQyYid/xe3L4iixYZrKE+xOpZizRFBvzp4Fm+A/l3XZQ8
	yRf/ah6uIdkunCjHHOS1DEFMscBknhYZOWJ79tCKN47rOrx5UVK3fVWWUliczDRu
	oXp/uRHcBpQ7iWQYjj7NGOAD7k6wOWOmQAvy1MMbrhpma2qBeIQw==
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10on2113.outbound.protection.outlook.com [40.107.92.113])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4807sg2259-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Jul 2025 09:10:23 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UzmfYjZo5tQ7YYaljVBlVcoGCrzJ0Hsiq9wgoeUMoyToSxp1cgx8zXS47pMeAoWsNkIyp6OnKSz7LavhDKXZBavZj6j0UxxluvqQKUEvlbQnlwQbijOwpOjaAPhrEmZaWlM8V1jDOqPDYcCJi3NHMDocvj7A865+pRr/8zoDYVADupLUWdV3W8XUmYX85kAAd+t4Oa9Zgc/RtGrqbH3B7GL/Ksbn0+6DE5y/mHgF2JaQzrydFdWmUktCxxO9EqvWNa5H6N9gfcm6f/drC6fFYClHVBXA9/I8W8vfiHMtUJM5lgNZr8mtrhArNe4bFZTDWzcB4sQ+u27pTi71UCOSUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KvQ9XDOPe0uNwjQvVDWzDR68nX0gOxFw9CyYWsd9O1Y=;
 b=QSqi+aYD7N5dmHmA/i1llCMJn8XEYtBcOXpLavidQaUDYPKH2v+e/v+MbjGLmU3pIxEhHIOpV25UuqsmEKn6WhEn+jMghKSZPs66uSK083L79gBh8hM0zqySwwR1bmmzB6AgzeYRC2s5SG8OsXWVsE96/yXHgPE1wEN5LW75DosRwrid2PAo7YFvaMS9oKmdeqAQ8e+dK4hPoW5AEuDS7lr1svlviLtTVPHtVpOKABnv6/fs+VG28hHxWs8k/Sj8Mt6dpoeeyYsmggZBpPObpvu4C5BNeYEFjlIKO1tw9n44OVVBzQDNfd2a8mLIktfUN+Sj9l5FE3LgpTDxTbrhOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=gmail.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KvQ9XDOPe0uNwjQvVDWzDR68nX0gOxFw9CyYWsd9O1Y=;
 b=HenpAiA+g8EI4CBk3LM/2IIds5OcX5nbrh59EfyL73xDZo98jfVALaTqMgTYOrn2KiEZRxzzNAOS7mO8ImGPWVkKIzH2iW62b0kYJXv8txIaXCpxxugVimnCkM/BdVefW4Lq8lY51FeeLWhbqFKvepvdIswbxktAncLg+TOAwv4=
Received: from PH8P221CA0056.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:349::11)
 by MW6PR19MB8083.namprd19.prod.outlook.com (2603:10b6:303:24a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Mon, 21 Jul
 2025 14:10:21 +0000
Received: from SN1PEPF0002529D.namprd05.prod.outlook.com
 (2603:10b6:510:349:cafe::84) by PH8P221CA0056.outlook.office365.com
 (2603:10b6:510:349::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.29 via Frontend Transport; Mon,
 21 Jul 2025 14:10:21 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SN1PEPF0002529D.mail.protection.outlook.com (10.167.242.4) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.20
 via Frontend Transport; Mon, 21 Jul 2025 14:10:20 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id E4AE0406541;
	Mon, 21 Jul 2025 14:10:18 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id C6D20820249;
	Mon, 21 Jul 2025 14:10:18 +0000 (UTC)
Date: Mon, 21 Jul 2025 15:10:17 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: shumingf@realtek.com
Cc: broonie@kernel.org, lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        lars@metafoo.de, flove@realtek.com, oder_chiou@realtek.com,
        jack.yu@realtek.com, derek.fang@realtek.com
Subject: Re: [PATCH 2/2] ASoC: SDCA: add route by the number of input pins in
 MU entity
Message-ID: <aH5KSfV6aV6k0bw+@opensource.cirrus.com>
References: <20250721112346.388542-1-shumingf@realtek.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250721112346.388542-1-shumingf@realtek.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002529D:EE_|MW6PR19MB8083:EE_
X-MS-Office365-Filtering-Correlation-Id: 899ea18e-17e0-49be-9cf0-08ddc86053bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|61400799027;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?UopuHq5Iwf6RvQCtqMaCB0ktma64ooY0ZRBjyGOtW8dKo7KEopuu1TFuyQ4L?=
 =?us-ascii?Q?X4yIIKXZBtejt751bwZLU+pLAck/1HMRUjgZlm6pWZV79gH9hImFRY3gT+Vh?=
 =?us-ascii?Q?Vv1q+VG36GwlgTFCrGpWVHJmFNtBVtWiYVMZBtlena1aGCk24RTRVn8uwNNS?=
 =?us-ascii?Q?QzVuAB+peu9JiMX6jpr0REH2oSH3mGBAi5u/+RoWGNiRx3ZZ1h+xO5Jiic9T?=
 =?us-ascii?Q?K1c9AlLORqQ05tBkopHjvRYRWN49EuaDZBil05NowjFmILZwOqtRZjCO4QzT?=
 =?us-ascii?Q?tENcq3dPO/fzumaa94pQ85IAfKDNSqtmE93WTwOxv1LjSu2yMaPasv3m9GWa?=
 =?us-ascii?Q?Av0iiyGyBswpYYQGqPK8t1vTbiz+5/gEZr0MDJiOOnykwwUsiaMw7nH2Xj9v?=
 =?us-ascii?Q?lJuESmWAtZn97I5FmxaJDBHI0J3zfKsSfUGH29wUqRzNxpO+nAepCYOFOWds?=
 =?us-ascii?Q?Y1/mTetnO8v35HzIDUR4igsTlKtfqpukanoCtvA0c2/NWoLo0rosXN2GyGBz?=
 =?us-ascii?Q?1RlEW94CXDwKGBl9+AOt/0JSQwmlv6E1+YbluVh0QjVy85sdcVfyYYccSKkX?=
 =?us-ascii?Q?RQrgMGRH4xnu6HAdUJHkEtScgzE1KmKjGfBhYGfWM55d8Xq8wYtRNgyUnOpL?=
 =?us-ascii?Q?L68lgnxsDbK7mFv6myZOJfawIIcLV16mkKf0hX9YPqXXIreEnFtRZy0mbC1j?=
 =?us-ascii?Q?/LujBM5xWFZyw0mEs1QE2NKLicI3wxuLSdUjYTTG7wIEclmA4zHI1tUg4sy4?=
 =?us-ascii?Q?kKsw3f9aksjLwkH/0R8G1F9nfkCpgX3xnZpNHq0FB9rCKo45k1J9jpme1+F4?=
 =?us-ascii?Q?Ecc3MLuo6BG3DAtziuNhYIRV6Q1n7WKaWPWb8BRAoyC6CS1GzqdYSqNd4oWM?=
 =?us-ascii?Q?PK7pgyKBCdxnuKdKXQksqXxFhmnQjw/XSkveIs01VGEkAKrEMTG0eNm0hZSs?=
 =?us-ascii?Q?j9/T+ZbHFwIXN26j2nDKRrcUITG9FB5cxLqOZ5OF1czA3HSBLcf+N2P54Wov?=
 =?us-ascii?Q?IHZDU6ebQjrdz71OpTnXeB3/ui/cBPiXOLL0zJJzeo2Me69zSvV1RE7wtOKj?=
 =?us-ascii?Q?jXp5uVjN13a5y7USgirA3xxiCN8NxElgP0Ahhf1V/E62RHPEUwQiTG21V9Ir?=
 =?us-ascii?Q?iCxmM3olv9dAyHICk47RxgWJ09qv6hpQ6B0kPX2Uu2MtV54VKrLEnhL0219t?=
 =?us-ascii?Q?9p1+Yu4obsjMsMiyC7g+bAiJXYR2rks9K4U8kj4Vl3AZw5U3ygSocKTykPYa?=
 =?us-ascii?Q?teSPEvT8dMGsyTguxkotekhp+RfBsw7jTQcMUtzpnb9dIUdXUww0okYy0lK4?=
 =?us-ascii?Q?8A+aGqixJ2xq5xesF2DJ6XMI0f88N4a7USS8dKsWAzO6nn61a2dsiHyBu9YU?=
 =?us-ascii?Q?M8PPYCESC3QGnlOHiRupoyDmqcs+X9cbVCnnjNTle+cHkWD+KejkPOCIwbEW?=
 =?us-ascii?Q?C3LRReCi6aKm8jMfpXj4wsJdsdfw5imMOsLJncugEw/XoLu9kVW2y8xRQOwD?=
 =?us-ascii?Q?OMSfCU5ux5MwrwqqBQ0mRi5AqDpdeXFXZsh+?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(61400799027);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2025 14:10:20.1117
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 899ea18e-17e0-49be-9cf0-08ddc86053bf
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002529D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR19MB8083
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE5MDA4MSBTYWx0ZWRfX6HD2BPDy3keU 71oMooOMXZnVVJCYci0lPFh3zUkJTR2mk+zRng1RSmsEl3JHufF/XEMZSP1YFf3URJwcyUcI6IY wF8PHKPfdWZMkmCnPGqa6snbZ8iM5CZzE1MuJD3pBpi2Ejma8zQ5S0X9d1/kxm0kQLJHuvaD6Kr
 a0B0Jr998OFWzTcMhueN0TNqQ9Na0/Rd1N4o+22BTVgqWBCqN/rCjx5ZOtWPblsUyqqT9Ysd/yT bn7UNdhFpAtcuChPqtNUjJ7sOxtiDUGISXo6J0YuRroVX6awHZw9cOpbZWqAk08AgYWkbd/SCom C67i42YyvBmBwIQ+9gy0sAVqvngk5rfeW3qjQ+/IKeDG8XqqBMuUdeDk3MGhgDDof+wcxY8uK9t 1A76wKqL
X-Proofpoint-GUID: VPn73qL5pR5l4CoJ4mQek4CygSYpoc9C
X-Authority-Analysis: v=2.4 cv=O/85vA9W c=1 sm=1 tr=0 ts=687e4a4f cx=c_pps a=6JPPvL0+Kp/bephKfSor1Q==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=n9Sqmae0AAAA:8 a=w1d2syhTAAAA:8 a=VeGpQIFiDVPxrKsQ0TkA:9 a=CjuIK1q_8ugA:10 a=UmAUUZEt6-oIqEbegvw9:22
X-Proofpoint-ORIG-GUID: VPn73qL5pR5l4CoJ4mQek4CygSYpoc9C
X-Proofpoint-Spam-Reason: safe

On Mon, Jul 21, 2025 at 07:23:46PM +0800, shumingf@realtek.com wrote:
> From: Shuming Fan <shumingf@realtek.com>
> 
> This patch removed the code where num_sources should be the same as cn_list.
> For better resilience, it would be preferable to explicitly add the route
> mapping the input pins to this MU entity.
> 
> Signed-off-by: Shuming Fan <shumingf@realtek.com>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
