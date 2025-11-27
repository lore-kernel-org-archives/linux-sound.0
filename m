Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26E1A1CEAA3;
	Thu, 27 Nov 2025 11:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764243169; cv=fail; b=Sd+a5vcV+ATm4LDmq3szGOTvUhc5757fdGtKnu9O3C9kjKG+yYchWZ2yMFSm0J8luk9Nf+YbIi85G8+3oZbtLfWdrPPpbwih0D2TEYp6MRKNhBYcbzGZP0yWNEapuL364P//IxTF/YQyerFEcCZ5yQswZAG6c8ByCc8DpzcKXFo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764243169; c=relaxed/simple;
	bh=1HB5PWye0WSvFI8mHId2aSWUUCnFH0W4q6OlHbn8zLo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=UqgSQb8jb+0RTOy5gcaUOhBUKXN2KPNdpL2c1P0pHbrNQyOAOt3O1XE8djBaQaCqA7BZEf+tMPuFtquFwaXI1Qc8MWzB01eukfbDPXGSPazRaxYZc6nQsHJCphLKw87cZvS35XeaRIBxRVBM3b0xQE7x9N0ZRqACF5QxXiorO7c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=j8/2PV5x; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=Sp7xLilK; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="j8/2PV5x";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="Sp7xLilK"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AR5NNKH624890;
	Thu, 27 Nov 2025 05:32:44 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=The3dKcLDrLa2SSQ
	+LDkxRIBevULaRKZOIkbAdixXPM=; b=j8/2PV5xec/YE98TEiiNbB91tISxxVdk
	/D81XmLvEXq/ml/1LP+VGKw33ruSMoNvMDcCLQyEl9CzZqNoWbD4I0IdiaEdUrSj
	deDjGR307HSW6b26buNN9NNP9rnbyib0mVQTzpEOHoRragucWvKYoIe6UQh5uU4T
	vSUAaTGMeG9e7lgCwVs3WvSh7IjdIWqZ/MEVM7etEqN7ahTYZYLYC93fARpQo4Z3
	nia9bAzdjqq3o6NKDMgfj/+ZLLagnI9DRvhfSvweZX6fxNgZCl0qJ/PG2fj69QGy
	B1MwzatSAEaULtR4YOxtet7sSTj5yZzZOiMq3NV7YbDpAg6kPEIJ3w==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11023083.outbound.protection.outlook.com [40.93.201.83])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4anjvwt316-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 27 Nov 2025 05:32:44 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SJzT9d227/xMdThjjYj3can99BW8QoaFauHBDG7lNxua4s4XSKLJQF9pey9v7nadXdsXYum3pEOMLcSmc1QVXnojNa/vHucWqAoGz0a8CmaF+Xm5gXASTNJDyQvyq5zLKsovu8U6z2ijoDSTjmW4ILywEEpUIFTG/KewjXzhw2/FJQmZiwYp5bfdjSBwHO5jgwNN1YF93w+qZDA3741ymUMkU/dQmMJjNnA316yoVZTk1QpS6xe75tKqmL78wk762UFU2eVFNe8rgAmh3pAZwfBwiUsu78yyeQPXCUQRTaUP9iS8nILNbBM2zR6T09YO1cDgvYeMz/RAdIDH9dXhgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=The3dKcLDrLa2SSQ+LDkxRIBevULaRKZOIkbAdixXPM=;
 b=Mkk6R6wvrWDAD4+pE99201HvB3KYB9G3VgZO34RYp9d5DWwmN0i5RvqBGV4iSWTe8lj3GF5rc9QGcSF4EpJVvUzO2P3a+iSC8isWVv3ujThKYFqldtowtER4NZ9Ke6A5/VX1Xo2ND+mRCgRy9Tgv9cSX153F2Tey3cVrrzkIXnJ+bnApV7EBEW4AL23ZJ4eN8bL97bdUyKxB74Cuh2op93QhzPT/1TwedrWArAn05b5nuYJ0SGWyzzLNC9p5rIuE+i3/eNf3QpdmkVLD4BP0p19e2NGurB07xOCKo5TbbN6C53gdSoXfgfbxNnscaKIzm1d8rrmffyl+qld0lJKguw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=The3dKcLDrLa2SSQ+LDkxRIBevULaRKZOIkbAdixXPM=;
 b=Sp7xLilKBghvvhoJYmmM4Sj4HdF9kSYWekfrFGLttVrIevMD56FWA7fVmfq3d7DWd8RMVviX5fYnsQkzly9JYHPatogUrf9ztabaxMjRph9mlomu+G9r69XfpjqhF4+LYaVTlNOAirw/ILn+DNlZVUiV3G7sRVM0MwA11jrHgVQ=
Received: from BL0PR02CA0090.namprd02.prod.outlook.com (2603:10b6:208:51::31)
 by CO1PR19MB5093.namprd19.prod.outlook.com (2603:10b6:303:d5::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.11; Thu, 27 Nov
 2025 11:32:41 +0000
Received: from BL6PEPF00020E65.namprd04.prod.outlook.com
 (2603:10b6:208:51:cafe::b1) by BL0PR02CA0090.outlook.office365.com
 (2603:10b6:208:51::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.14 via Frontend Transport; Thu,
 27 Nov 2025 11:32:42 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BL6PEPF00020E65.mail.protection.outlook.com (10.167.249.26) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.7
 via Frontend Transport; Thu, 27 Nov 2025 11:32:40 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 2D3F3406541;
	Thu, 27 Nov 2025 11:32:39 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.24])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 0B76F82026C;
	Thu, 27 Nov 2025 11:32:39 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH] firmware: cs_dsp: Take pwr_lock around reading controls debugfs
Date: Thu, 27 Nov 2025 11:32:38 +0000
Message-ID: <20251127113238.1251352-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E65:EE_|CO1PR19MB5093:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: c10e0b54-3868-43ba-7ce1-08de2da8ac9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|61400799027;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?05mIPOoLuYdqziotjTuvYFr4AlGhWxJNromI08BHjPcezsl0BFHnvIAA0qX8?=
 =?us-ascii?Q?rggru1HgIgCYZ15s0NCRAc60kPRxkg9z2CAaQ7X8/ObLa3kSgnUoV0I9uNAh?=
 =?us-ascii?Q?4/EgXp+yTS6D+QfMaGOnxzAgzElmcSZBn8OnvJL23Y4gnAxH7kATKZYV1eAe?=
 =?us-ascii?Q?wg7u0pMr71FrcBDmcWmTYTbjvkCM7FVkIWiQsYsc3LgtwnsrDSKhMhxD+SC7?=
 =?us-ascii?Q?1U55obUg9AITNyhEicUv++KuIwJBEWjFodCenaCE2KaDMNV//v8tmYrpgugz?=
 =?us-ascii?Q?giPNG3JWlqGjazEg6XymRTnu79sjD6R9s5HpSqvMW0RQ10K0koxu9zkeC4RJ?=
 =?us-ascii?Q?uePk2ENY4S+9n1hANHCwKFNfTMB72hFhMIsLbXQxCgiuYjsW1uxZGr4RZqdG?=
 =?us-ascii?Q?GxedxrMstDobjETipwHJALpyIzWus73MUGI8OsIGb3CAZD32J6OynuEN3B2I?=
 =?us-ascii?Q?zTxFc8riXC9/uQlDvnIlUs16hfwma7MHxhxWiCSuHCA6MrlfrFm3Gg5FHkE4?=
 =?us-ascii?Q?9edwFe3BpMrmTeWhSyICRr8TMZUUrkpIbMEJW8oMnu2LxyaBgNqHB0+UQReJ?=
 =?us-ascii?Q?pPkA/iq6/Nt2FYqa1Tu4UZ6QqVK6lCPyS6Jk0TrOm/e/TclYAU/6DLYkb/0y?=
 =?us-ascii?Q?YGP8ybpJvtiliQZRrDml+E6cpngwJbQkjEtVhHbSgWoQXYsp3fiGUjq0QgPQ?=
 =?us-ascii?Q?4pqhZzzPZjlBpYRDMp7/uMoxLjVgHh3JOFgUHow/xlBr7yJaS0qPLwl/v87O?=
 =?us-ascii?Q?46o2JU3bhewzfCyqR5KdN51su3HptsSkUS6S8g6WA5/4ISzB7Rp5ZxE3YWyy?=
 =?us-ascii?Q?kDXgkw33VtaYkImrrFpFJBOLwaMfGc7f8le1Ji4YYeevDKVp9Ot4iDI1un6M?=
 =?us-ascii?Q?hOur9i5SFMhYGhoH1hrFVwpmC9ddtd3Z+U9z1rY+YpPJ3Vec7c3I0TrXsB4o?=
 =?us-ascii?Q?BVIm7fpUGFMa9JFyRQ0CvM3uaD6mhoBlNS6i4W+AZVKCbdjjuTWWbMbeXX4n?=
 =?us-ascii?Q?CXrfAvOmwKl+0ZArk5MchJIoaWg7Cbinge7KU5Ql5IrFRFleQfd17M44ZC2D?=
 =?us-ascii?Q?FSo+v3POOyxjJ2TonWcpM+CgxERTPe3sd65xS/klYht22snyMHzqNd00pmZ+?=
 =?us-ascii?Q?Szv4Q3hJw3gT0mmZUVUYlVzslDhU64q1h/Zrhz/69FkBEaIZueAyVCLFQYdJ?=
 =?us-ascii?Q?3OWzMYyKWxt3Td7B076T/zX5odKHFNhMrr9TLLhV0DDbPmrKwmvLZgA9d4mL?=
 =?us-ascii?Q?KtmzVVUKz/9gi1R08F3SU+r7Y0WmajfyO/ag71ZouCbxqCOoaVYrwFopZToN?=
 =?us-ascii?Q?jDzE/t71/c8UhGCswEZXBQvOcwbq9U797UJ67FdO6qqpV4b5/VSw9S4U5vF5?=
 =?us-ascii?Q?Uf5/vQv0RHWc0cnWWF411s8RIMwA1lA4GL/opi8hi0joPg9xrSuNJ5tV8tWA?=
 =?us-ascii?Q?8vsSAUWtF3D0uCLiRrBrt50vPgKRF8j0uHiad8dycDSBUY8Qdw6kdLsU7Sd3?=
 =?us-ascii?Q?0k4m2wfP7d4xQW7JD74pbm4FEI/vX/wPZy9j3cOOi5AWHl0ArRQ7qgBY1IsK?=
 =?us-ascii?Q?SKJohVngHz+R9zTZPNE=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(61400799027);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2025 11:32:40.4608
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c10e0b54-3868-43ba-7ce1-08de2da8ac9c
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BL6PEPF00020E65.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR19MB5093
X-Proofpoint-ORIG-GUID: scTqrXpXHwcG5-xG4zyKnEV7cySgigCA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI3MDA4NCBTYWx0ZWRfX4kIpZkVVUiAC
 8/SmM0/prubI7OgAwAYgcQX7hOYmi+UQtmqBHoRqxSWJ9rI1uJTq1RR9wGkexrCDvYxtzreWaYW
 LjqoSy09p8K7ORJ9D9AOuzyr0TS6jSQBNkm9Idjs+0Hac7dLLp4pKlPiNUnVIx+txxhuoYFtz5k
 Bf8QJrHOiwhuS8wbYGjCoHnXXzKqBLtH8iPmjs7q45c/fzA5PE954z7S83xMQZPSB/pTZvxz+Wc
 Btzo7R+ItAPIcLnjYFxOCDqCL1YjkSsl3eL82AzLCVZif/ARmCk6fxhf6qlnjmvIXBM5ntfYTZf
 0NbJapindXbhs0KBad4P8fBe9ragJfzvG8gVobhKfvQAbbKTiqiUFnXDJe1lYTY6+UvrMh/LC7Q
 vgaM63besa5ay36tYaDLFZoJZ0boIQ==
X-Authority-Analysis: v=2.4 cv=Vvouwu2n c=1 sm=1 tr=0 ts=692836dc cx=c_pps
 a=Kl5DSHqeMBbv3ZYbUOuQHw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=6UeiqGixMTsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=w1d2syhTAAAA:8 a=yZ6Zaq0YVcDfNhcyRqkA:9
X-Proofpoint-GUID: scTqrXpXHwcG5-xG4zyKnEV7cySgigCA
X-Proofpoint-Spam-Reason: safe

In cs_dsp_debugfs_read_controls_show() take the pwr_lock mutex
around the list walk. This protects against debugfs returning
a partial set of new controls if those controls are being added
to the list while it is being walked.

Controls are never deleted from this list, and are only added to
the end of the list. So there was never a danger of following a
stale pointer to garbage.

The worst case was that the printed list is truncated if it saw an
entry that was the list end just before a new entry was appended to
the list.

With the original code, the truncated list from the debugfs could
show only _some_ of the new entries. This could be confusing because
it appears that some new entries are missing.

Adding the mutex means that the debugfs read provides an atomic view.
Either it shows the old content before any of the new controls were
added; or it shows the new content after all the new controls are
added.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 drivers/firmware/cirrus/cs_dsp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/firmware/cirrus/cs_dsp.c b/drivers/firmware/cirrus/cs_dsp.c
index dfac821bb5fb..60a2061c444c 100644
--- a/drivers/firmware/cirrus/cs_dsp.c
+++ b/drivers/firmware/cirrus/cs_dsp.c
@@ -438,6 +438,8 @@ static int cs_dsp_debugfs_read_controls_show(struct seq_file *s, void *ignored)
 	struct cs_dsp_coeff_ctl *ctl;
 	unsigned int reg;
 
+	guard(mutex)(&dsp->pwr_lock);
+
 	list_for_each_entry(ctl, &dsp->ctl_list, list) {
 		cs_dsp_coeff_base_reg(ctl, &reg, 0);
 		seq_printf(s, "%22.*s: %#8x %s:%08x %#8x %s %#8x %#4x %c%c%c%c %s %s\n",
-- 
2.47.3

