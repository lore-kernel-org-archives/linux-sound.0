Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21438222571
	for <linux-sound@vger.kernel.org>; Tue, 24 Jun 2025 12:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750768163; cv=fail; b=om7tGebRtwMXQMfrWYZzgEh9k30s9+5mIX+LOW/rRQqV/lrAHP+uWidJf8+tOqs2JK20RaPFawCmZTSNhrs4R+5F+gY0M97gYVUAcnMKMYBsNN6RcGsq53JztDgzkcV6HHosCU+l+nXMJyYFcLjbwQzxldxy1cTtQpF6put4RDE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750768163; c=relaxed/simple;
	bh=Othy2K/ZSv+/nbqiVDfY+BMn+FjgReBsdn4loiG+epM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=sIGICpsxAnXyeHg3dwjC+XjzmU1+TW7lNam2pB5LDRTM4twHSFrABAPZq2VKwvVf6o0XuLlwccfqXXHJxi66TGM3zy3E2v/+xPPhV+VS2l+cCzrqZYH+JcTt7ZlxM3GCgg7ydU4vIl0d1QI7WD5emQwQdh0pNr0GOPBM+R6QMwg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=MeQ3CiXS; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=tAdyrB6S; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="MeQ3CiXS";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="tAdyrB6S"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55O5t6Jd010334;
	Tue, 24 Jun 2025 07:28:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=sRRFYOn7u3Y6tM0W
	qrQ/VvNb0JPCzA9iO2j84tSfdbg=; b=MeQ3CiXSuZFvMxv3OAZHuY8rmWYjILy0
	o7sXFuSMztBDQxLfePz67Pkhigd92oTMh6jFoHHmrzrA+c4v9VNv8EZ7QLnTv1dj
	A7MsfBki81lHl4F1bSR0jd6H5D8etuZF36Jg0fkP84YjucznSZxqh3Q6CNekeBo1
	C+OKWT/vQYTQmkwDFQ4yWsEHeyBtSZQJ3UPCO4P00VaKIQROz+JGGIsLHijWvWAY
	TCxCiqUrlvdJATrk3RL2hdE897ruyU4iqjA4QTcRDWi7XZsVMsIAyDiv1GQ6HHK8
	Lte3bSpRXi3wAEadvLBuW2T6CIoMQZPSPLdwNlKrFXmD4uvmHjEmIA==
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11on2103.outbound.protection.outlook.com [40.107.220.103])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 47e5tyu4jx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Jun 2025 07:28:55 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jOn56jAASQzZxQFZ1KXCQ14ip8CrM8zr4Os6NW9ZrBxLyW71ipnnYhRhzsehontlK+R8fjrZZbkx7OQspW+i7eCyfP6Vf+OdVm/kIUuWJSs2Ah3DYHKh8jRmSKo8HPrjKlaFSBS+QBV2Lpqs3FHvoy+KOZQAMA1Jq+V3YQcWk6OvlNQEX6a1I5y0ycz13JjpH+A4qIg989xRu46aMr0sVUnbSLhST/j5aS+Wts9FRTfGQ63A+ZRUAWtIshkKzBUBscroJg+PphxfvYrtErFpwEZ0tww5yO2NqkRGCieVC0ndNOX36nyxPWr50X4pSCOkBDaS4lrqjljUwt8EXO4T2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sRRFYOn7u3Y6tM0WqrQ/VvNb0JPCzA9iO2j84tSfdbg=;
 b=DnkxgtkQSmrjnzbn0ZdFLmNno0i7BnM19QvVpsdttCR6ZDhsU7ceQSRGq9jId+7WWkoHBekbilYlcDa55cfhUiG5DY0FJVQyEf21pPb/KhLyr2IwBPdnZF47OXOQmrQmTetwxuPeSPgVzEkmPN09UdjiaoRt/G4rZH+/yyZHBmeysaN/ue0JAeIjMcw+LiuTfn3XQwd6/2VtMWlF3FMgtqLMZbWKyYsZuZDjoGPKmEmY+9l4FkSUPJ627KGTxdCe1esBVRE84jqqVmTJZT1yFJFqnNGAtCQDnrPFzoaz8eE/x5QVOh+PvM+nKwQJFqc1iULIumyNayPkyu5FW4J8Gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sRRFYOn7u3Y6tM0WqrQ/VvNb0JPCzA9iO2j84tSfdbg=;
 b=tAdyrB6SlEe1qLtSBxkQ8XUsjUNqVyaJPUlkfAc+5yKWVT3o+mhG0ix6MIhGC4ALHIccUqljwMoEV2JZfm3yWUXhJZ33mez6zEuNkj2HN3CQ4FiFQaGvf9ddcJutYr+yc5MabGSPB335shU7Ig5T5TEfnXkOmJvkSeWtFAU39jY=
Received: from CH2PR14CA0050.namprd14.prod.outlook.com (2603:10b6:610:56::30)
 by MN2PR19MB4111.namprd19.prod.outlook.com (2603:10b6:208:1e6::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.17; Tue, 24 Jun
 2025 12:28:51 +0000
Received: from CH3PEPF00000018.namprd21.prod.outlook.com
 (2603:10b6:610:56:cafe::97) by CH2PR14CA0050.outlook.office365.com
 (2603:10b6:610:56::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8857.30 via Frontend Transport; Tue,
 24 Jun 2025 12:28:51 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH3PEPF00000018.mail.protection.outlook.com (10.167.244.123) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.1
 via Frontend Transport; Tue, 24 Jun 2025 12:28:49 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 8D444406540;
	Tue, 24 Jun 2025 12:28:48 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 7459682024A;
	Tue, 24 Jun 2025 12:28:48 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        patches@opensource.cirrus.com, linux-sound@vger.kernel.org
Subject: [PATCH v3 0/7] Add SDCA IRQ support and some misc fixups
Date: Tue, 24 Jun 2025 13:28:37 +0100
Message-Id: <20250624122844.2761627-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000018:EE_|MN2PR19MB4111:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 052af83c-bce5-4c32-3f6e-08ddb31aac63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?OM0o3x+XMfC/LDhAWHSm9lFe1AjFF4+BS5Arfxmw6pbEjC6lVUb6qShkWizn?=
 =?us-ascii?Q?RL20fouzeWq8w76aWfT44SJzP7fLUOfng//hviqtYxu96fq2PMejTl7MuoTB?=
 =?us-ascii?Q?fyL+W/TcCO5qSZf7ZMgyXBurcdMd75WVj83NjY8frvpJo3AfGZL+qSN9AzbS?=
 =?us-ascii?Q?xg9dngyDX3rbUPyKSG5uGa6VUxX7Ixv8xSWf8iV/L6nfJSvuSmi2B8W+DPqG?=
 =?us-ascii?Q?vc3YTGiuovnXm+4Y5ozFDcXIS/keTlqtcn/kWwLjTeJtGXvndyzy6B0D61fp?=
 =?us-ascii?Q?fnMDbTIWmd6eLeNAh1rT0T6/TMOMLV4vaNzgEGaZ9LKR72zR24QuLVoMbf4I?=
 =?us-ascii?Q?syhF6r3on5u6dtY9i9z5IFVzW3CmFLrv6sOSdfebqef69HeGuvOFeTNjVNsn?=
 =?us-ascii?Q?8ltw8kJ1vVKwKsMa7r1Qrgf+wkwLgxYlKG6OjTKxa4mS+gU2yHqNe6diCbPS?=
 =?us-ascii?Q?2gGCgHxL5JGwj0su4i3SnmlKa/R/KWyxQijWPhbF3Aw55j/Yr4t+YBsxOZTp?=
 =?us-ascii?Q?rmtJTpVv9AFUNheczOyJhAVxI5iv4F3fgmvrRvEk2zWTDknJStenthq+97c6?=
 =?us-ascii?Q?uUU6U5iL/q3KXgdrLgFa7sXiR9SUZ84006Xg5S0TQMYi1W0ohFKV5XxdopQL?=
 =?us-ascii?Q?nVMJ3e4NQ0L/gU9jY5cddpMObwRCkcy0gUS5EIYZpRvlqitYt0sdI0KFPUom?=
 =?us-ascii?Q?ICTX5Hq3W2e3WMD/Xp7CgZ9Id9+72V1MKLg6obWvtL50dmtUGUVifhcxVbEo?=
 =?us-ascii?Q?9wmeFNgeF33EPC0eXE0IqLfKruvsIkB7wYyhskpPi9vHjjRENRCPM26W9zw2?=
 =?us-ascii?Q?NRNvyP3dc5zrSFzwknDu5OWz87zOpuHLACr20sym2A9hpl0Z21R45pWwYcMY?=
 =?us-ascii?Q?vgWUvEj1RYnpK0jrI0zUAoZRe6B5JY28TWXPVhhW2pPNV9fS//8LWt5lcZM1?=
 =?us-ascii?Q?0DtHrZRXz5GAxMYdXmzrssXiB3XDS9SUurm5sKOmnMCsvjf+ggiRFMW/a4Bn?=
 =?us-ascii?Q?6CcFJFrg5BplzPLuj8lcxHJduEBNHoGxSJpVKCGBAiJJexsw46dI/znm/Bb7?=
 =?us-ascii?Q?tutnR6bVIQso2I+ecvgER3ZdJKingLrivH65vD6TLVMivSlsmG6Cam19A/Zy?=
 =?us-ascii?Q?aJClBJBhhkSoPWI3h8Xyw0QmXBu3GyePY8JkTrMuVQorDExz8Oe3Lhpq0vpc?=
 =?us-ascii?Q?+z2zP8XGy7q9ZOTBOAbtMGUXzrrUnV5lR/g1ZSfyRdZ7F2NvCpJ87ri1O81l?=
 =?us-ascii?Q?MzBsqASX+osS63W+lJNDko048owjXjImSHKK4lQ3MwaNNltPwb15nwJLLy4i?=
 =?us-ascii?Q?Rl7UawJvR/7LrW/kF0RTMvYBSGzjz9+3r8eZH/J8xraISwbB3Ctwr+a790IO?=
 =?us-ascii?Q?SNlKpbgdv8qEqcA8R2O5zcaHjw2CN+op588FhDHKd/NtLIxoq7vFq8WSNE90?=
 =?us-ascii?Q?ncJ4G0CKdn2JUacPz/DcQd++pXokM0yMKdoMZWj2SBc3U0fvfP7dG+eIjYKX?=
 =?us-ascii?Q?5CKPwkxr0jjviV2nbrHZzur4NpmE6E58VB24?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 12:28:49.6798
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 052af83c-bce5-4c32-3f6e-08ddb31aac63
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000018.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR19MB4111
X-Proofpoint-GUID: JquQtIIYhaLV-LiD9UOKRXi1FFqTyZt4
X-Proofpoint-ORIG-GUID: JquQtIIYhaLV-LiD9UOKRXi1FFqTyZt4
X-Authority-Analysis: v=2.4 cv=P9E6hjAu c=1 sm=1 tr=0 ts=685a9a07 cx=c_pps a=qkvVI0a6NpPKroYfssW1Yg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=6IFa9wvqVegA:10
 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=MoMhrUrNNs-eAUOLZUoA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDEwNSBTYWx0ZWRfX+UWUq5RGd76g 5e48gQQ8mS33ivWrvVi9yKHL/iat48qqHbJyRHhpIk4qnqUbZoUyOjP+tC7S3dPzxNCe9eeyiwF YlLTuuApogVOnSm8sQdHIEvpR6vTI/4iMUEF3AhGXtblzxzR+n+Ee1MVYiQc05jJ+6iTcHkx1Bo
 iXkvNMmH/H+Ukb7jafco4vhvhP7zSE2TQ2XWg7bhJgnDakCdXmEaosXuAjLp9x4hI8yMMil71KP 3/BjV2xCIoylhKrEPWLofU14FMh5hh6r+cuGNLei29Garu0i01t+AM5h2qshuZVp8/H2UvkjGal fudK9DyR4DBhHzbQfb/hpmF//A2LfQe44zWhiyyn7FjddHYVhrPzfjWG1k71FKREX7yeAfBvUUF
 iWZnI0qiKI91No+PaC1PDHVgNRPF6ifX3oyq7S0FVnfbBGPZiS7iz7WdASJM9aQ5LwDI/N3B
X-Proofpoint-Spam-Reason: safe

Add a maintainers entry for SDCA, do a couple of small fixups for
previous chains, and then adding the beginnings of the SDCA IRQ
handling. This is based around a regmap IRQ chip and a few helper
functions that can be called from the client drivers to setup the
IRQs.

Thanks,
Charles

Changes since v2:
 - Just a rebase to avoid a conflict with the recently merged SDCA HID
   stuff.

Charles Keepax (6):
  MAINTAINERS: Add SDCA maintainers entry
  ASoC: SDCA: Add missing default in switch in entity_pde_event()
  ASoC: SDCA: Fixup some kernel doc errors
  ASoC: SDCA: Minor selected/detected mode control fixups
  ASoC: SDCA: Add flag for unused IRQs
  ASoC: SDCA: Add some initial IRQ handlers

Maciej Strozek (1):
  ASoC: SDCA: Generic interrupt support

 MAINTAINERS                      |  11 +
 include/sound/sdca_function.h    |  11 +
 include/sound/sdca_interrupts.h  |  78 ++++++
 sound/soc/sdca/Kconfig           |   7 +
 sound/soc/sdca/Makefile          |   5 +-
 sound/soc/sdca/sdca_asoc.c       |  19 +-
 sound/soc/sdca/sdca_functions.c  |   2 +
 sound/soc/sdca/sdca_interrupts.c | 439 +++++++++++++++++++++++++++++++
 8 files changed, 564 insertions(+), 8 deletions(-)
 create mode 100644 include/sound/sdca_interrupts.h
 create mode 100644 sound/soc/sdca/sdca_interrupts.c

-- 
2.39.5

