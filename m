Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 664C12EB5A3
	for <linux-sound@vger.kernel.org>; Thu, 21 Aug 2025 08:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755764819; cv=fail; b=WI8r9RAYWH4Rhym6ocN3TyDnHn63dx4djwoin8ntdXqAAZoWq6Tl0pN23J3Iji8eT5YeNyG21W4j02uX/kypnVGE5kCEhGMgho+9NzvrDKk1+mZWaVq62VlDxxlIFgoABjWXVnhNSITgp9KV2wQPY4rEJi4wUdVP2dt4Pgk+JDg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755764819; c=relaxed/simple;
	bh=gwgkToIdB7nc0lff02DLjRi3yWRcZiHrH4ea2r8HLCE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=cvxd7p32px96AdAQgGpGMemq4N28KMTlDBBbVnMdtBUW6SBcAHnuGU/J4PpRcYBBcbVRlG4MqsMes2a9JzaHjNkekj7mX0+EcGdG9Jv/0FnR9K3FHRw9XV7OM6TshVoQOmF5ASJ328st1ZhTpUngvlUFvSNKxsXDUpaflQtE7q4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=dIB7wj/n; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=HkhsRjHv; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="dIB7wj/n";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="HkhsRjHv"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 57KEvFjF732044;
	Thu, 21 Aug 2025 03:26:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=nyVUA85YHCERjrFf
	gLzi+13dtmUEs6dgAygdBeGiVUo=; b=dIB7wj/ny12uqUdp7iUlZQ0pV18gg+MI
	qinq7KRojKDT7UKILedrIiqjHXdzoWCVNZEkNQCp+yuZEqEinJAC6ynNl7I0+qiP
	WBKY+kNvOXQexP3WMi7CNNmVTIFiw9GetYszyc97hkWHU5MyRtGF1sKlDRGpBho7
	jgYMA7t/Tk1XUdv1jxMaXygccnIwPJlH+1oze7FsvK5i+lCD2UICJdy7lyUmR+Mu
	Tnmi16NuWvXe95mQ1dWfXVSaL6HCzTHSgs82To1kThZ3x2RRjA5pRH6pmrMcYnBP
	kbfbWhflQn32xOmmDrt+X65R+bnD1idFddldmeo1XXNYWX2bC9EPqw==
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11on2091.outbound.protection.outlook.com [40.107.236.91])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 48myd5akfu-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 21 Aug 2025 03:26:50 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qgN6VgO1Em1+Oi1rU6Kxsr1kYvTAEJ2zOBCfb3DM+I56u94/DgDzI0Thmzd5SarPopq9PDb/iPQqhDFJiodPDdGT+qjOxok/1V764DWYNkgFuyeD7HbdHrohZ8mwJ6Wvub8PT03V3/naxobhUYFnhPKUlIJEWJIdgrmIHygSYzn+LtigZLo+/z/TU/YjtL0Pckw8ZUw/im3WsYliPueFPjagpPGEbUjnNWzzC4aAn0json/MLyEx6zYHj1S1TIosaDYJVoNjK9Mv2ozVzDZ29YJxZFcUyokJvXp4QhlQYfsnmmtTQWH+IG4sW03fpLp7hiIXm3cNvhKdOsvuMZe3Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nyVUA85YHCERjrFfgLzi+13dtmUEs6dgAygdBeGiVUo=;
 b=V5C6zSPoGgfr/pFU2qSr2Kixs+R3yR/UF/SMuNpZ6ZyNKp4x9NDn2rhC7q9Yoy5hjPDwGCDF27o1esBtKf3G4NQmyWad3EN80ORHyNI5/5m2ru9yrfEqFuN4mef8WtHe+zuq0/pL0ccNzq1LiyUf/am7H71tFt2bBpx5xCbX9t0dHNP+eGu/N6lFgK+xzxyaYJcIsBwdk+b41cgCEq5soeLSEVDNM3ikrvTrQT5jrUA0Jxp6E0IMHKbj5UAsu12EvCpf9waeA7hLqkRWTZ4CyMU0k6sPor/CSVr92o/fxU3E/MxV3m+ivDXMxLDYWbZcRjvGDPN8F/ySUX6SaQzBDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nyVUA85YHCERjrFfgLzi+13dtmUEs6dgAygdBeGiVUo=;
 b=HkhsRjHvFUpz8SxsQOANVlH1xJrkCL7UuenzGY1zWpPV7dI9GOABxsliq9qiLT3SI7781Vg1kuqWwNZYgkWpaPi2ek85pSOuziaZ8N2k4KRY5tu+f2vF9QRmNVca7oRV3tlr0x2+lamBcN2CR4bI9Qe0n2omyziZJcNyudtt5Kc=
Received: from DS7PR03CA0053.namprd03.prod.outlook.com (2603:10b6:5:3b5::28)
 by CO1PR19MB5030.namprd19.prod.outlook.com (2603:10b6:303:d8::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.14; Thu, 21 Aug
 2025 08:26:45 +0000
Received: from DS3PEPF000099D9.namprd04.prod.outlook.com
 (2603:10b6:5:3b5:cafe::c3) by DS7PR03CA0053.outlook.office365.com
 (2603:10b6:5:3b5::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.14 via Frontend Transport; Thu,
 21 Aug 2025 08:26:45 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DS3PEPF000099D9.mail.protection.outlook.com (10.167.17.10) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.8
 via Frontend Transport; Thu, 21 Aug 2025 08:26:44 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 6E1F3406547;
	Thu, 21 Aug 2025 08:26:43 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 543A582024A;
	Thu, 21 Aug 2025 08:26:43 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, lukma@denx.de, mans@mansr.com,
        ankur.tyagi85@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v2 0/3] Minor bug fixes for some older Wolfson devices
Date: Thu, 21 Aug 2025 09:26:36 +0100
Message-ID: <20250821082639.1301453-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D9:EE_|CO1PR19MB5030:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 746a80c5-5c5f-4cd0-a300-08dde08c76d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?jMklUFCZ2T7dFaEgNu6dbgdlR6EuG6cTmcJum3Xtx+6uhXB4ft2nAMz/gJvC?=
 =?us-ascii?Q?PWx+JHmAc+11elb3I1aEEgmVEBaSZgS1cWu3ROgrwPxVuxvOsr70FubQrtJM?=
 =?us-ascii?Q?O1R6eYemQkflD6mAfyWCQYHOYNR7aLTjHdnGl2VV1tLzi/mTlE3LrUveBRA3?=
 =?us-ascii?Q?E1w+S/5WAjwJ+u9RBlKIYvoiI2XZimIrR06aFZKOxSrGwW1wfC0gRn0I/AzT?=
 =?us-ascii?Q?vQoIeeI/Pk04JSY/VBr0Dedc/hU0etAkB+BZtou+ojgGZ3wpqAprgZu5Q0mW?=
 =?us-ascii?Q?k2ozm+264f2BfYjApRMY/RUvAEo/9OFUxLSs5IEfrj40zgfIw3ZJAQEVqV08?=
 =?us-ascii?Q?sOoyIsFx0TTwKhzK1Lnkvx0ZPyiwAiNV72K4hFfLDYhRVWyfYDxR6lI+O2/5?=
 =?us-ascii?Q?SVNtdyYlZFLzUh8q0FfAJhkmniRHdtD9Mq5E3XgLSakqfcapL2HNyDQfrBJ7?=
 =?us-ascii?Q?cdrzzjUw89lkleqyp/Gt9SqPJ40Rr7k6RsOIgjl39fKdc8Zuq9hDff9eBdV1?=
 =?us-ascii?Q?XzcXg4d4L0v8TXTr304C/St0D1qV3DCyJoEvBAvL2UoEk+aw8//+uOvMvaWU?=
 =?us-ascii?Q?iWD5UEaPJEWfhmqxShSLBk/iXRiDEnMKrtNEvFqyQnIlrPtO2+nbPSHqoM/r?=
 =?us-ascii?Q?SLE9GoWmIYHsg+81JHKclvvr4t80rFpx+JxVhIm6i7TJcpb7OmliqhFZP/ZD?=
 =?us-ascii?Q?xNxY8P5h5kdhqWEiHWYFs+So4t3FszWie0c29RfIRVw3GWU8GiuKHnVerXDb?=
 =?us-ascii?Q?rVmK3JEJ9IkKkj18GZw2BbmUpGNbSTKUFuYWjpVjsmStkFuLer6igGhtRuRV?=
 =?us-ascii?Q?PT+mn41skFGRSw0FiwQwcK/4tqBj96c2NEo3DqEroNy3E/DiFF4T5earXPn/?=
 =?us-ascii?Q?pxxoAF21UTdLyS0v+sjB1Ucd0sVhBYzEqMHmU9J8uzHmhJgFc3YDeXvR+She?=
 =?us-ascii?Q?KmHjRqvXGbeXmjbzjDHCPXeE94K0iTg4/9p0eFZHI8mc5iMWDcGcycAHja5s?=
 =?us-ascii?Q?6kZ8L8AH+Uw+gJ1Pnu7O+T/Su60tS5wSJpf9EQpLumdoiImgt+z8i9lPYcOh?=
 =?us-ascii?Q?qDwyAP98qqd0pdvMbyTLDWYh84ICW92/ysrGZBqJRH+CosX2695y4XUNcHdN?=
 =?us-ascii?Q?xRIrVBrPId2A+DCA/ApEXsHRCpO/7n8hpG8437bexs8mb8RRkesbbqhuq/rJ?=
 =?us-ascii?Q?AYwK+ghtBYfx+5dxKEZCiK+cJzJ37bAzp9zfSTXejU4aFlt6PHZKs+2k1PQT?=
 =?us-ascii?Q?VJQfPU2Esd0s8Z0n70DJ0IxvVKJtm/9PpGU87C8igrPBN/oaGIXG+mYUhSeH?=
 =?us-ascii?Q?D3lMNqnaAxDFyusSMDVjuCDQQBKnTcx0TKBL5FdCNADt0u+VciwehO3bqOLq?=
 =?us-ascii?Q?Psk1/ntpFsVUdcWBIVGrCAVDAt0gN/p9d+YuqWbyiWGGGvsMeeFbuee92T+d?=
 =?us-ascii?Q?mv2UzNVoDiju2e6gzVqJGy8c0xMSLLfbh/d7Kug8mida75uwCZKSHL9QTcIy?=
 =?us-ascii?Q?ALLpjkuxNdoz8L/QCB6Vcvc0/cuoaUam7UJF?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2025 08:26:44.7845
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 746a80c5-5c5f-4cd0-a300-08dde08c76d7
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099D9.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR19MB5030
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIxMDA2NSBTYWx0ZWRfX7yso8jC3aIYz
 947X0hUowmjnIdRJ1DoaaqccL4gQ/xNDYpIPdDHPfYkwQElCdjg4rJ8NktOlaPjSE1lt2lMQiiv
 dhdy3uTqwWLsEjzkpKcdu5Fz8Ek3QHwhagdGh/+cHNDcH16zsHtxt4P82pOzgEbai2u4qqcqtB0
 dTHjkDlLYa+5Dp5ujM5kKsLyOmUq8RJGv9Q0/u9EYF93/0Ub5RJ4eL1NjXpMgxsdYReRq+qjZ2u
 jmG4XSoCd84CsBlOc+vdSwsASBoIg7Bcv7Zj8xWUHYBwxEBf5q6CPLLoqS1sL0Uh57tFZnrl0Cq
 uUqAz4+E9ciENIAN0Tn4zLnUFDJLEXEIRyy2Hvmxffpy+ZeCRQemtHks33zj5hhmRx+9m/2H2FX
 VIkhSRAeO4v2CdzFkjzUQyheM2/M9Q==
X-Proofpoint-ORIG-GUID: RFvcF-06gZ8giGYaF96vyGgS7GA3L9xl
X-Authority-Analysis: v=2.4 cv=EpWLbScA c=1 sm=1 tr=0 ts=68a6d84a cx=c_pps
 a=vI7cwuzHBtkooc9oao+6fQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=2OwXVqhp2XgA:10 a=s63m1ICgrNkA:10
 a=RWc_ulEos4gA:10 a=-8dSnDlTCbIuCDlLowwA:9 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-GUID: RFvcF-06gZ8giGYaF96vyGgS7GA3L9xl
X-Proofpoint-Spam-Reason: safe

Minor bug fixes for a couple of older devices reported by some users.
Mostly this centers around the automatic PLL configuration getting the
wrong values due to rounding.

Thanks,
Charles

Changes from v1:
 - Adding the original reporter I forgot to CC, apologies.

Charles Keepax (3):
  ASoC: wm8940: Correct PLL rate rounding
  ASoC: wm8940: Correct typo in control name
  ASoC: wm8974: Correct PLL rate rounding

 sound/soc/codecs/wm8940.c | 9 +++++++--
 sound/soc/codecs/wm8974.c | 8 ++++++--
 2 files changed, 13 insertions(+), 4 deletions(-)

-- 
2.47.2

