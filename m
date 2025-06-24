Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70C8C291C12
	for <linux-sound@vger.kernel.org>; Tue, 24 Jun 2025 12:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750768157; cv=fail; b=JBaWW4twAAF4/eGF9FV12pKVDtI2t5bQCnayEnZfMcwXI6PHA3iVWKUzePy2nxeHdEO0IYAzbtATjbg5zQ4S9LpTRhlda8BjfF8PVRl4CD4CzSfjQc76DftAT+syDFF6TXjwPOpzQ8pK4wHbtIVyIFmVblQvGKVwH0ldhFlgRSM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750768157; c=relaxed/simple;
	bh=1aECCMhmvec6T5w+259WMypPxW9pHmsy76gxOyWlQ8g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KaU3s9r0+6WaqJwCcQS0qakOsXsoSXnwIAXx+aCA86pjgoDfGMsRcUM0GqCCIBW8mbo6TCLa2EdWlEvNaEOg1+NIfGkILhWGa/929OdZ7J6n3ZYC3ZKNxUO1ogbUn83OKjx5w7bd0QtVzee59YX9Kqlmlg2MiY+AHRt/4w7wNAs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=Xt9kC/ke; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=hArqIm3X; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="Xt9kC/ke";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="hArqIm3X"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55O6gKQ4006784;
	Tue, 24 Jun 2025 07:28:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=PLW+CnvR5paVD8MSdNQFj4AYgJTtJdqO87qeBFHH+fI=; b=
	Xt9kC/keajc5v5xQ5p/+cFHucZ2gkUg7GNRnMelkeBqxCzUogtGQHIlEOaS6VKpc
	zsr2O0cAhbOI4qUngxbziTAjzpyrXYAp85Zw/rj4SPyjltH43PanEUOsPqtr2WKV
	CXX7wnWlIAobmD1Z1XKRP4t4f0n3yJVjKgr89HjH8liTgDK207bOo8hLsl3EoJ4P
	By2utuiRiclsuVnDt7C/H+LXbY3FZrmNBg+1tQjt+C37/ge36V17YMHu79iZbg1q
	UIYPLGg3Oe07zbFETQnOVI1rTsf4IdAw7lJ6j87efUZ7fCPH24WtDAlC+ZS35iPG
	yvaKfPh9K52xY6IHcjluEg==
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02on2120.outbound.protection.outlook.com [40.107.96.120])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 47enk9jppe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Jun 2025 07:28:55 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zxs/KpmFM4xsdtMadxZCbuvsJumbdXplHx/HEAuera6od8UCQgHm/1ioyBJEC9/c1RQoWUCoTJaFT+ifRxm7QkMnk6GumLIFTFpM186vMC1bURWJlbwlPv+SBmOnMR702Lp62+W6KaMi70INKhapfyooF3slqi/zdwsYClzJsThhPEToEh6vv9yVrkHPYHCW8mhFFqeuJG32pyFWo1AJHoA5L9BS40t+gQandhtufbca4CjxeX4C+6R1NoTjkVS57GttSP6qS9IoBN2wgp/ZnMmldaUlcQBn0fYFGiJW9i+OdkKmLT3Mf+oq+3f2txO9wfAjvT+RzeI6/HqveR9jFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PLW+CnvR5paVD8MSdNQFj4AYgJTtJdqO87qeBFHH+fI=;
 b=X4McKazNYC9ZHCxHwJpVVhBeKPRRkyF9YYW9VfvZQMQ+PP9fU+wBv+3mOMvOWQTR+/f4SDTqLNfVZv6BFsyAibGYe0bVmauce6vCbDLtSgEAf63atY22tqPjAiGewCuZb3w9MFR+Mja0odlPoyr8gcnZBKiMEJL1unBED8eixNgmnsx+zDYqq01Otus9ZftXquwynsEM5RnJWwqc6ziHA54L8ZBzx6ZmfSvr1bOnvDNx7YzLezHAnXxcL57n6sS7Nx/QNQVvqTQXv6ogRq0DUNrUXrX+71pyTcZqyDmXBBfhoOhmmSl5ziU/Hbf8exNzDD4k2DFv2n+SB4nRFUM2dA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PLW+CnvR5paVD8MSdNQFj4AYgJTtJdqO87qeBFHH+fI=;
 b=hArqIm3XLUUJSg6vl0wPIq/PKpkruvHuJ6zYw2PznXJ/tOtOi3MFArzFonmpNLldtUzPC08donnCXw5OvTRvEsEpoK6abImP8p5YOfrVj8//cKstn9req0/de01d2uVYhkSSeqD/AleuGxUmgOfFAnk3qp54Z+otSxP7QvuPTNw=
Received: from SA1P222CA0099.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:35e::13)
 by DM6PR19MB4108.namprd19.prod.outlook.com (2603:10b6:5:24d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.23; Tue, 24 Jun
 2025 12:28:50 +0000
Received: from SA2PEPF000015CB.namprd03.prod.outlook.com
 (2603:10b6:806:35e:cafe::23) by SA1P222CA0099.outlook.office365.com
 (2603:10b6:806:35e::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.17 via Frontend Transport; Tue,
 24 Jun 2025 12:28:50 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SA2PEPF000015CB.mail.protection.outlook.com (10.167.241.201) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.14
 via Frontend Transport; Tue, 24 Jun 2025 12:28:49 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 9A4F540654E;
	Tue, 24 Jun 2025 12:28:48 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 790D9820258;
	Tue, 24 Jun 2025 12:28:48 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        patches@opensource.cirrus.com, linux-sound@vger.kernel.org
Subject: [PATCH v3 1/7] MAINTAINERS: Add SDCA maintainers entry
Date: Tue, 24 Jun 2025 13:28:38 +0100
Message-Id: <20250624122844.2761627-2-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250624122844.2761627-1-ckeepax@opensource.cirrus.com>
References: <20250624122844.2761627-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CB:EE_|DM6PR19MB4108:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 3ef7ee35-5da9-4fcd-7fda-08ddb31aac6f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?bxTjU65KmYj2ZVlMZGVrQ4AaeywFAbRRUR2fl+mErWpU7APQj6ZCBGmPKVqw?=
 =?us-ascii?Q?RF/SGVg18ag5i3UEAuRtwUMbnh13OgXxXjQ+mXkrgnck0fr2TB5h5jb+FV5o?=
 =?us-ascii?Q?oZfv3Vcfp6MbCMlT59o0XrXngqYWP9+fOltp1L2MCETIwUO7C9f+nb4Sb6AD?=
 =?us-ascii?Q?urrbfTbBNtNN8priL4TAXbTtYbyJcT/uxisYK67Pou1y0SQXOMhCYnueS51c?=
 =?us-ascii?Q?nvnWKPBAHtBcr45C2mY3K2WBzauSw5wCH9GWKGDtOf2O/mbpMN+lsqBwTrSD?=
 =?us-ascii?Q?zQEIop4DGAnMOyOO14oZFVRh+s1p5Rzkq1rYDrSb7UDUWT5agQKkVTWJLhBx?=
 =?us-ascii?Q?xT7b6pj6RwzU2qPAH1xYBsWeXQ9UnPDn1Ig1UrHDDZeeD9W4dbDDAMLl/T13?=
 =?us-ascii?Q?uoZIjG4eWc2PYcgogamoza0rTfM7uYMmvvXlmyG+9JJ0YNbxYIZm8x1csW38?=
 =?us-ascii?Q?A+h5EZkkrEPuyacqT/seqqVuP9uZlM4BbwPHia6fpXXM6ppqZ7cUgVMxpNiX?=
 =?us-ascii?Q?gkdzXcA2p1eSsfftM+1erH3t+jB6mJn1qF7JU5/BTcTqCM2q1M9Y5FnUNr7M?=
 =?us-ascii?Q?J8D+AE39SYZR5zhaWlcfv3jmbmSHPMuR69RGgCWCbR8a0myPucJKesZj9kF1?=
 =?us-ascii?Q?rAKry/PbxFLYOeu9U6pc5kbj2z+bFa1BV0PX/2hekS1Iw1gvqjx4olYM11q1?=
 =?us-ascii?Q?7N05hbQJb2BJYXDkfANIMgji+ob5B1UE18S/lq7rDo30v5ZzEOXvHMD2f5rU?=
 =?us-ascii?Q?iMU0coNHEpq+1R5yo4iiaHfosHOJNGDbbU7t5p8uk2PKGiQgHtP4+2BKGJwl?=
 =?us-ascii?Q?O0vHRW8iN/rqHs/Axl19TsDpjY19+dNi0QVJQ1vgyHKeDNfqCLEOhgooeUMM?=
 =?us-ascii?Q?H66ihNJMStoG/PGLxMnUnlIyZ9iy6JTjiSpa3KOC2XlimvOECr+gJCPtHq1W?=
 =?us-ascii?Q?Qjcs+qnvBCKWET4xq/Hv7SQP75rSsYuGs7h7XpFrggFuqe/nvF0WaBIRTB2S?=
 =?us-ascii?Q?9KBOGTrOsANsYiRmCy+ICqT87f/SMZYpDSiH0WhOnP2DbUn/Ep+cSEE48Aqn?=
 =?us-ascii?Q?TVK4cnzLh/iHbMowoDVmk06Z1j8sx+PNHcbDfDcuahQk89iNuNlOoQie8k4f?=
 =?us-ascii?Q?8CIApdUDpIziRNef3n6zZMvJLhFL3AHTNco+GB9Z69tV9dO4l17qDrZqM2+L?=
 =?us-ascii?Q?SVYWYwIowQKtTopPJujrpmTQXZ3k755sJbDCY/tRKPBXv45y25oJrt3T6yBm?=
 =?us-ascii?Q?MnW3K7INwc18MKya8fYrfNA2D1fYZbUCsRFhRbIMRHVNGhzFOUqEnqjaSYuE?=
 =?us-ascii?Q?6t2Nc211MR+GrQ2RAMbGX9zN27UR94Mf1l6fiBJzACwJuQwejPKD8yJJgSar?=
 =?us-ascii?Q?f8JFvGhsmFLJh/pYf2N7IpIEl/A+DlPYcm19fKvgXlG8OWmThUhQotCElvyJ?=
 =?us-ascii?Q?UDwf7n4t6yM1xCVrgsrJVxrj8MI8TPXdIFqKQKN/oFMVQn7vXC27ia09e8ww?=
 =?us-ascii?Q?TcNdc6Muub8AeRG8d8pho4tuNmBmMdhDD9b5?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 12:28:49.7234
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ef7ee35-5da9-4fcd-7fda-08ddb31aac6f
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015CB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR19MB4108
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDEwNSBTYWx0ZWRfX6Oa+HbeWVeVF 88ZyeBWNbC1QuK0SvyBS//7wD+8oSmODk6VVKM+gMuG+jPbFwbkde+4rxSeXm3n3bqSp16XrpCX pudzoQ0SNermAbp55tZlptOurTBAIaMS8L1MofoZ4+lbRTwApUckpxFTuuJd0ZsaCM2NBmu0dP4
 oLV4nSkEVJ/GUnDzrFB+FRE2JkWN4LvRFuGP6sYNlvuw3W6GJ9zibJA008RZEFuhOpYY8xqvE0H oGfCMOSJ3Spg/0h+rvMhnuv8vau8y/VtaBbHBOioPdvOVrpAi3pibOkLPBXlLZHYCtH48KSmXCq SpvKXbyznMCxrMLcYl0sz8TQAgH0V10hL4wY6Q9Ta3XF3y7B8D1qsK2IykJwA+bShQLFVusX0AB
 SjoI7Le/1VYSA1a9qvFuc5O4eCv9T7zbHCmwhroc8Kt4IfvvoL0C7UAVyDBRRhw20hLOqypD
X-Authority-Analysis: v=2.4 cv=da+A3WXe c=1 sm=1 tr=0 ts=685a9a07 cx=c_pps a=jsUvzWLdiFp5pG0k3HodTA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=6IFa9wvqVegA:10
 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=QyXUC8HyAAAA:8 a=w1d2syhTAAAA:8 a=pGLkceISAAAA:8 a=VwQbUJbxAAAA:8 a=FP58Ms26AAAA:8 a=FfjWbaYm47BBfKnykuMA:9
X-Proofpoint-ORIG-GUID: _1cD8hx2RHYWnQE8z7h2DsUIos6RKOTh
X-Proofpoint-GUID: _1cD8hx2RHYWnQE8z7h2DsUIos6RKOTh
X-Proofpoint-Spam-Reason: safe

Add a maintainers entry for the new SDCA support code.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No change since v2.

 MAINTAINERS | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index c3f7fbd0d67af..669b28f696915 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22298,6 +22298,17 @@ M:	Jim Cromie <jim.cromie@gmail.com>
 S:	Maintained
 F:	drivers/clocksource/scx200_hrt.c
 
+SDCA LIBRARY AND CLASS DRIVER
+M:	Charles Keepax <ckeepax@opensource.cirrus.com>
+M:	Maciej Strozek <mstrozek@opensource.cirrus.com>
+R:	Bard Liao <yung-chuan.liao@linux.intel.com>
+R:	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
+L:	linux-sound@vger.kernel.org
+L:	patches@opensource.cirrus.com
+S:	Maintained
+F:	include/sound/sdca*
+F:	sound/soc/sdca/*
+
 SDRICOH_CS MMC/SD HOST CONTROLLER INTERFACE DRIVER
 M:	Sascha Sommer <saschasommer@freenet.de>
 L:	sdricohcs-devel@lists.sourceforge.net (subscribers-only)
-- 
2.39.5

