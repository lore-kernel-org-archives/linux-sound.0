Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98E422F60CB
	for <linux-sound@vger.kernel.org>; Thu, 25 Sep 2025 10:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758797663; cv=fail; b=EOWZX5JzE0CWMZ8Nvvcp3rJnCnS1gAcEZZDMVPROMBWtK5tle6lF7uHuvaLXzf8qz9AuIPOyoNDsTipuuPkf/JgtGkd/IZS29DL2Pba1/iU15DpMgBCNYYISumdienuAetRtNkR424icbyObC1UYe/Xb+G97BwrhwlnoEhLu41k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758797663; c=relaxed/simple;
	bh=6jdgU5xxEuUvT+xpeb+5lzna/SRG/pbnkIvvh8OxqG8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Hvr8k34Wsd9/cagLKJ5avJblZr/oPsY3SvPehkK1r7jkseSdmVCZiCmphHyftL9U373da3pqjq8xiHVHnhLSBnMLutKoYLcgIPBHHPVUjIfBX3ymrsilOdkmPK5Ya8tDsvpBVP8mSdLYCSxeWLJaw+S7TX1dEXkGdYQhuh9cpn0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=BlDy3QtC; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=y/hDhRhd; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="BlDy3QtC";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="y/hDhRhd"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58P1vH5Y1785190;
	Thu, 25 Sep 2025 05:53:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=f16CQR+OlU86sr+X
	60PUig/PNcFq7L3blZCMMErfbps=; b=BlDy3QtCw306jwXMCIkfaNPtPpogvm10
	7mym1DUfS167jsRxGXcbNmcggTIgxdxQIrd2puiP1uECvrYpj+Miyx/HfQm47E/l
	6PdjwV7ac7UUgVAphShAkdq1Qn8mZcQhd4cNKaCECA6/33MPXtDHdoD1Aj402wf8
	t/FCBMd0DrvcoRe1sVUgUHOO20QP8oZie+inM5lPLsAhEN00SAJWyWQ3Y4o0G1pJ
	ziRsQhQ2z9y+lAKXloxEC1rrfeMk3ldL1ylOT3X9QcX0P/uOHuPtz9zE68AmsQQ8
	rmyzv3XnPYzDd7Ua3ACbmFTFCe7NnGL6bPInalER/gsLHWD+nvcXVA==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11021134.outbound.protection.outlook.com [52.101.52.134])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 49cvharf6a-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 25 Sep 2025 05:53:53 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S4iS25P8ntmHxk4bo5CDs647HaM94cQwcxCxgKUMaejDRrxT9J+v0sjkWntJtZz3nrbJ3IuwjdiqojCamq07fnK23PYEw73rr2kquE49g6vkcxk8sqX6fvnDcVz4oDEYmy5QYL8ZHdaEqCjVv1n73X1/zj1IcW2s5qGK+caoHs07RfGYFs0NXO2OpbxvhrBWE6UNcNHJ+QrJl4N+YEbXGqL9R8n5eSne8XMeHPb2KF3TLT0E8LmCVLCo7PLNomPUwGLMllSWwnNILc99aq0D78pIoniN8EULjdFd0UJ8h5L1oUY4YVUq+pG7E3gKVMSjRxTIbdclXlWl+e/mWB4ETA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f16CQR+OlU86sr+X60PUig/PNcFq7L3blZCMMErfbps=;
 b=Hao0tlBxZn05ecoRi8IO6zof4oNsxpn8J1Vhw1NQFNhhxvooauDSjJCtibrGA/KCRuTlmxhk3RT4UUn2lopiPzC+o+945euyXiGwTVxB1YuxweUda6LRjJ/kosDDrbAM63PgySLNfBBNj/iVoRTTeOHDvCs2jjglF3jXZAlEwZqa0gUW0jRurt/WhVl+rXOpPv2JFIP3vkrIpxQOW0wujynlQEAqMNJKX15iPYNesCCEWpU3vdvnskuQQ2H+H53zLztU9vpqFcl1Dfh+SFko6KhGBnlwJFhB3+7Qm55y3byEN/O/5/3/s52wz6/89D3olcbVHiZQXkCDo3cDv8ohig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f16CQR+OlU86sr+X60PUig/PNcFq7L3blZCMMErfbps=;
 b=y/hDhRhdE1ikcjCE8ksU3lBBMlPI8bUaT9knRPeAH/vi4pMBu+LEjSPCpdQsw5xnMILEhubxjJ5tEKBMnTUGXIDPRgIuhmkaU99QPDpFtkorwWWm75IlLRgigI3gPXsLvye2ht1vKVpfyAKDdWBRCdtNCKePVjXRiaLb2/2uoKU=
Received: from PH8PR22CA0001.namprd22.prod.outlook.com (2603:10b6:510:2d1::16)
 by CH3PR19MB7234.namprd19.prod.outlook.com (2603:10b6:610:147::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Thu, 25 Sep
 2025 10:53:48 +0000
Received: from SN1PEPF0002BA4D.namprd03.prod.outlook.com
 (2603:10b6:510:2d1:cafe::50) by PH8PR22CA0001.outlook.office365.com
 (2603:10b6:510:2d1::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.22 via Frontend Transport; Thu,
 25 Sep 2025 10:53:48 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SN1PEPF0002BA4D.mail.protection.outlook.com (10.167.242.70) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9160.9
 via Frontend Transport; Thu, 25 Sep 2025 10:53:47 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 008B440654B;
	Thu, 25 Sep 2025 10:53:46 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id D43A2820249;
	Thu, 25 Sep 2025 10:53:45 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: rafael@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        shumingf@realtek.com, lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v3 00/19] Add SDCA UMP/FDL support
Date: Thu, 25 Sep 2025 11:53:22 +0100
Message-ID: <20250925105341.194178-1-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4D:EE_|CH3PR19MB7234:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: c6f9bdc1-aad2-485d-93ef-08ddfc21cdec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|61400799027|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wp5V2uZPK9D6Ywxbr7totjfzT7E9b0HQJ01gKuphgMOAelNYGf4iJmZrcXZP?=
 =?us-ascii?Q?t1dKpGo1fftJCsxN2K+cOPlalKxiFb0E+7BXRUrv3fzopdMHaJa4vjDkQsth?=
 =?us-ascii?Q?qJxsdV/o+XrDV+Pr9IwiZujhYCksU0nEDBNKJqHEhbXTA8r7bMjWXEylutHi?=
 =?us-ascii?Q?FSaxcESXIZOqRJrTOVZELzsV0eAEWd+6tu+Mkt0lhKAXhWzp76/GVhKHnQkU?=
 =?us-ascii?Q?Rl0meSj3sBNslKGwHS5PJZrcffV7a8obf7GBpO1HxHCxs2lcl/6MamJ8xZru?=
 =?us-ascii?Q?oJgl90MZMHUBYby9yGQXbOeyY9AVFD5t9fcTMnnG0j8zpU1epVa1evuFL4IZ?=
 =?us-ascii?Q?geAL6nO06UJzDOfVeEvtJfX+KSM9MtW+fW1d9oYPyQTaUQZAIqDRff5Iju6q?=
 =?us-ascii?Q?DFlIQymPjCNeoZX9LTTM+nEjJu7f01glXaUpUtvFdserlXw4fOyd4e+YNMSZ?=
 =?us-ascii?Q?IwdZk/DcaCVr0c9l/S6uCUkpUF15QdH18y72PBTkvyIPIX8vST6glTjTInys?=
 =?us-ascii?Q?k67wVaqE8gRVxtSmBKPe0huDa1HKChQRZrjNgEXDFiCjobJ4Gj8BqkRxu3eR?=
 =?us-ascii?Q?QmY4Bozz/+xF7Ufb/KrcyKXL1hjpDny/pPfDlbELR8SRGdS7vI064pAH3f/O?=
 =?us-ascii?Q?Z6Qpfi2nEDe0AwEusTv/zSFUZsow6vmsixd3i31EPfKWmmljLG6ZR8WCBa3E?=
 =?us-ascii?Q?mbxiS4DsebYos8aEX+aHr6Bn+viHN+UTtvC9bShKBNid4kUEhmcHSuvvLMwu?=
 =?us-ascii?Q?SzCggqzeB1joFcSR/hLaXk3w9mR9XamaEIY04xFesm4fk4AsYyvFpvR4cMyu?=
 =?us-ascii?Q?cfXYTXQ190CG/VaH0jcU5Ng2jme99+H1eE/HtgWRKQL3pn0tvANKHSt0fBnq?=
 =?us-ascii?Q?NV7gcOkFPEz0tfoP9EueRfPBgB76RXsB2TxxdvWzcpVDyIraw/dgEGndj/DH?=
 =?us-ascii?Q?OJA3NCDIKQvj4C4D1u/FJ0nQtRTWzL69bnK91hgffJ6e39QTfbtFgZSXvf2j?=
 =?us-ascii?Q?UWZn9CggptdYyPQ/Sxf370JLQWwM9Iz+FPyu8iJeM8UqV5JYz3UIjEojIO6L?=
 =?us-ascii?Q?i1vvxYU28HkaznCpVqFkho53wBNVFc5y/Gr07pSWCPwXXgVL91Zrs7M0r6sF?=
 =?us-ascii?Q?ln8Op5gtwPMa8Nr7R23JK4ZhPBg/n+9Wlcitkr5RFGlx3yXYiEEXnYamq96C?=
 =?us-ascii?Q?vs+UZzDMTzDIKXa83dkUAUhG7q8LxKBrPej97XF/heknjvsKXzmpwTfogXDU?=
 =?us-ascii?Q?P5CKsX7gt2yqs4jv9Jd3xTrHCVJCxEqFqRZYnLB6vdfr2XX6nOdZOhfoktjV?=
 =?us-ascii?Q?uXDiVehHph73gH2oK/os8JgGgPcjjldw4b2ERbMiFyv2AmQLBG69WApbeM3n?=
 =?us-ascii?Q?uWu6WpB84ec43bIwk8etbR+eohujERfOQAIM22vIXNLnbU5SZDJXdHl1lKWN?=
 =?us-ascii?Q?XM4/l6r9fekQ1qAYvzNO+aGvYFxQZjPtN5G7PeO+zw3yPdQCL9M6x4DK+KU+?=
 =?us-ascii?Q?EQs/fKGvzh5D05zdwhwXFVabc4h3enCVm63l?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(61400799027)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2025 10:53:47.2553
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c6f9bdc1-aad2-485d-93ef-08ddfc21cdec
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SN1PEPF0002BA4D.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR19MB7234
X-Proofpoint-GUID: aU_RWxxyg0tgzv1CWU3hQ4kWPup6K9vK
X-Proofpoint-ORIG-GUID: aU_RWxxyg0tgzv1CWU3hQ4kWPup6K9vK
X-Authority-Analysis: v=2.4 cv=dL+mmPZb c=1 sm=1 tr=0 ts=68d51f41 cx=c_pps
 a=UUmGjFhUr3uPr7k6e03iKg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=yJojWOMRYYMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=VwQbUJbxAAAA:8
 a=NX2PRUKTKYJzq1xaoV8A:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDEwMiBTYWx0ZWRfXwV5Qf1119USi
 MMUwJ1VrElIN0DsDvsVWr5HyircQjMYBjipRCycU4UhzvMQTS4u9imyoxzwievOA932SAoH0Ca4
 79oocx3nvHgX6hKtnuqjQMTpMUuXqcpXte4un8q/JszZ9Wd7ZJEOLMKTmm/WoMSCS1pu6giLzY/
 VRyGa87b8xHT4ZRtfA8VI0nGV4yh2wR7ro3hI65KoTDqOqEHLoV09gMUM51mcb6bz7KEbXefxfp
 +1X4sAjmpqldzRHBClKkF7Tl3D1xaOqWRY/pPzsSIUcZ3zqwHPAkDv9AMh4Q8zfnCQWy+OBtjut
 A5etMJsXIkzQ0MCr9yrQQ0+bAOGf+XGT4EMlRgkDbW8j9vPV/RHqcINVkIpB+M=
X-Proofpoint-Spam-Reason: safe

Next installment of the SDCA changes, hopefully the next series after
this should be the full class driver. It is worth noting this series has
a build dependency on a patch working its way through the PM/ACPI tree:

commit ac46f5b6c661 ("ACPICA: Add SoundWire File Table (SWFT) signature")
git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git

But we can probably worry about that later, as normally there is a
reasonable amount of review on these SDCA series'.

This series broadly breaks down into 3 chunks, first there are several
changes to remove the assumption that the struct device used for SDCA
purposes represents the SoundWire slave. This is because the SDCA class
driver will be made of an auxiliary driver for each SDCA Function, thus
the SoundWire slave will be on the parent device for each individual
driver. Then there are patches to add support for UMP/FDL. And then 
finally since the rest of the HID support is there and UMP was the last
missing part required a small patch to add a function to allow reporting
of HID events from SDCA devices.

Thanks,
Charles

Changes since v2:
 - Add mutex to lock between UMP timeout work and IRQ handlers
 - Clean up UMP timeout work after FDL fails
 - Use IRQ number rather than a boolean to track used IRQs
 - Reduce FDL retries to 6
 - Check disk size of firmwares
 - Reset on more FDL failure paths
 - Reorder volatile control check by entity

Changes since v1:
 - Add timeout for UMP buffer transfers
 - Add function reset
 - Parse XU properties from DisCo
 - Rename entity_xu library to FDL
 - Add a limit to the number of times it will try the FDL process
 - Rename soundwire device pointers to sdev to distinguish from Function
   devices pointers


Charles Keepax (16):
  ASoC: SDCA: Rename SoundWire struct device variables
  regmap: sdw-mbq: Don't assume the regmap device is the SoundWire slave
  ASoC: SDCA: Add manual PM runtime gets to IRQ handlers
  ASoC: SDCA: Pass SoundWire slave to HID
  ASoC: SDCA: Pass device register map from IRQ alloc to handlers
  ASoC: SDCA: Update externally_requested flag to cover all requests
  ASoC: SDCA: Factor out a helper to find SDCA IRQ data
  ASoC: SDCA: Rely less on the ASoC component in IRQ handling
  ASoC: SDCA: Force some SDCA Controls to be volatile
  ASoC: SDCA: Parse XU Entity properties
  ASoC: SDCA: Parse Function Reset max delay
  ASoC: SDCA: Add UMP buffer helper functions
  ASoC: SDCA: Add completion for FDL start and stop
  ASoC: SDCA: Add UMP timeout handling for FDL
  ASoC: SDCA: Add early IRQ handling
  ASoC: SDCA: Add HID button IRQ

Maciej Strozek (3):
  ASoC: SDCA: Add SDCA FDL data parsing
  ASoC: SDCA: Add FDL library for XU entities
  ASoC: SDCA: Add FDL-specific IRQ processing

 drivers/base/regmap/regmap-sdw-mbq.c |  23 +-
 include/linux/regmap.h               |  21 +-
 include/sound/sdca.h                 |   5 +
 include/sound/sdca_fdl.h             |  75 ++++
 include/sound/sdca_function.h        | 119 ++++++-
 include/sound/sdca_hid.h             |  21 +-
 include/sound/sdca_interrupts.h      |  19 +-
 include/sound/sdca_ump.h             |  50 +++
 sound/soc/codecs/rt722-sdca-sdw.c    |   4 +-
 sound/soc/sdca/Kconfig               |   8 +
 sound/soc/sdca/Makefile              |   4 +-
 sound/soc/sdca/sdca_device.c         |  20 ++
 sound/soc/sdca/sdca_fdl.c            | 499 +++++++++++++++++++++++++++
 sound/soc/sdca/sdca_functions.c      | 212 +++++++++++-
 sound/soc/sdca/sdca_hid.c            |  58 +++-
 sound/soc/sdca/sdca_interrupts.c     | 271 ++++++++++++---
 sound/soc/sdca/sdca_regmap.c         |   9 +-
 sound/soc/sdca/sdca_ump.c            | 262 ++++++++++++++
 18 files changed, 1573 insertions(+), 107 deletions(-)
 create mode 100644 include/sound/sdca_fdl.h
 create mode 100644 include/sound/sdca_ump.h
 create mode 100644 sound/soc/sdca/sdca_fdl.c
 create mode 100644 sound/soc/sdca/sdca_ump.c

-- 
2.47.3

