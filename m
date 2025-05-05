Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C062319A
	for <linux-sound@vger.kernel.org>; Mon,  5 May 2025 14:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746454472; cv=fail; b=SLheTYXfxJCqChUqci8Vg11lTPOOzqOED4I14aWPeQgdtYKT+yMZTm41V1+T4sfCCB5pOvlKgsD5Ih2l2YCHp8Qlama67Zgy5ZICTvqnadUdmUztOHdlMoosS6CzAeSAyf+6HYvGBFVNQO5JF0hUwCr4UofS6qYU2ePXH/R/1/4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746454472; c=relaxed/simple;
	bh=Nqo5n/8gFEf6R623FtLn9PZaw9np7pwYm8V2wLLfkRM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=Z1kNe3UNQuLBmJuoLD2QHErBjlwtyvSzEaqUTo6ZiiUURbEZr7lhIUJA+PufAFQLwiSRKxyDJSivPi9WRX3vKezed31CJrYq/6zNSraCfeD3nmSPArIUyqi4OL29i4fR7yP1d8b7KWoCHI0gkDWnFymWXXVW/4Tj5aFrSs8TQYo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=lO9nM4iP; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=SXEmVwIS; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="lO9nM4iP";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="SXEmVwIS"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 545DddfD019739;
	Mon, 5 May 2025 09:14:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=/D69jg5yGdf+Sp/X
	ryUzFSFO/PJRGfialbBc2LlH0wQ=; b=lO9nM4iPmw0FHS52UprdMfwqfCvGiPfH
	XXKXxpEnrFehiFLcs5qXx8mhv/jQuaPVJ3y+67QB2WyCSQ2uoF8nIuHlZBcRV8K+
	CgBExONcmOKPhPVgTy0kpA/xCFS36ahZsclZSTWPwCkQMqyvynGSIGr/fvVUwXpR
	vZS17nhz1DW0w6doB0AEVu04Q7yivv5jN4k4Qa/FvonoCW8dsyurKnk2+FMMwvp3
	d0ir0E0SvXJIeKKrGzGIC0rzSQ1Wv1q/zlyWLyQ7V4iZWTKRS6jzGl++acFZRwqs
	h5DhYHnisxNFomVOH/sYRnW6kKwN3iIpoMi+Es6QcKWwSv1kRKDMfQ==
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2042.outbound.protection.outlook.com [104.47.74.42])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 46dfjg29mc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 May 2025 09:14:19 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Og+PNhYsu7Bxj5XBhHqmhoXXwBOc12hzw3BwgsVLZV13fU/6/eU4NOndD8sAsOr8nN/xhJDB3ZvrWiWwrH8W2rJNP8ja7CSnOC/n0EVztpZBW6Z618fC2h6g5xmwhOMMv+6VSZgCY87HXa+RdJa16M9BhcTQKm7rMIVci2GtXAECSyYYLZWErACQT7keRyHxiptP0KTvZBiGs95Y+TB1cUiUnXYN3+GNvgXytAm7Ix5s6yKXzNIoTDbPEgbs75h7sMvLsyak2wTKnDGRdO2cKBnv3zBHFmABHLW2NVJBWuX5jCt7Du1q1iafrOnebOcMLnFglvmY/DJdnMDcFS9JWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/D69jg5yGdf+Sp/XryUzFSFO/PJRGfialbBc2LlH0wQ=;
 b=fimxtV1DeZVaGqRC8YPhTieyIvajRNBqH1HdcYXukT5PgQHllmheVE0DvMWeHzbAqy6aU/dNIv11AMnspFZld7uoICpkVh6JQIO7w8knAKIoee5GDvvMBnzJZQiYNE0um59yoT9/L7aIlp9mmtfeyf1b4CvT27jxhI2oGiNrJlhLTsp/INCqf9InPHagi+WghqHHBMs7JltnMdX/lshqz5D832wHybpv9UXCLVnOJZjpH0qPRHhkesootgudODR9GlVH+XIrr/ix2HBd8wYiWNVdiqPJb6M3B+N0ob9sQUEpfXrlAsRseCAH4MJzT3AceRwRmepYBvA1ku86xJAVng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=amd.com smtp.mailfrom=opensource.cirrus.com;
 dmarc=fail (p=reject sp=reject pct=100) action=oreject
 header.from=opensource.cirrus.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/D69jg5yGdf+Sp/XryUzFSFO/PJRGfialbBc2LlH0wQ=;
 b=SXEmVwISSeMwICCDgmlHKzLS+IqYFGTeLSvEviTVs5Wz7jMg9SIyy89N28FjNSLOjJ0o+QwH3dnm/LpnxXc5SLtE5UXZ14+Pk2U3hnOImJsiRD6LLRl9HLRsMz/qTQcSqVjTWFzG0xFXHtyWpLhd4+SnSJODSacVb4bBaWGz+g4=
Received: from BY5PR17CA0061.namprd17.prod.outlook.com (2603:10b6:a03:167::38)
 by SA1PR19MB6871.namprd19.prod.outlook.com (2603:10b6:806:24f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.21; Mon, 5 May
 2025 14:14:12 +0000
Received: from CY4PEPF0000E9D3.namprd03.prod.outlook.com
 (2603:10b6:a03:167:cafe::df) by BY5PR17CA0061.outlook.office365.com
 (2603:10b6:a03:167::38) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.33 via Frontend Transport; Mon,
 5 May 2025 14:14:12 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CY4PEPF0000E9D3.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.18
 via Frontend Transport; Mon, 5 May 2025 14:14:11 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 1D3C6406545;
	Mon,  5 May 2025 14:14:10 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id DA169820244;
	Mon,  5 May 2025 14:14:09 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        peter.ujfalusi@linux.intel.com, ranjani.sridharan@linux.intel.com,
        kai.vehmanen@linux.intel.com, pierre-louis.bossart@linux.dev,
        Vijendar.Mukunda@amd.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v2 0/2] Minor bug fix and tidy up for sof_sdw
Date: Mon,  5 May 2025 15:14:07 +0100
Message-Id: <20250505141409.2614010-1-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D3:EE_|SA1PR19MB6871:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 626b4f13-8145-4dbb-3a0a-08dd8bdf1be9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|61400799027;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/irHP3IZCvGxOR/Zd+9gaUqzc6DBGyFy9Zin2smg9PFEVFT0U3RNtjk1g0JK?=
 =?us-ascii?Q?gt3gkTfe4PtCITeq3EjTa7OZOnKg4uoS95Ry9rt2TZqgO3VbkAfI8e4CjjNT?=
 =?us-ascii?Q?pWFtg5lcM9tviUl07NXIMCCj3M9pSKI5t06gzde4EesgaozoKCLzzSsPs6bO?=
 =?us-ascii?Q?3+cphQgjZI7kiDCkYwSrumDnldSxCefKMy90RWY+V67FOiWFy75YhX0ZQZFN?=
 =?us-ascii?Q?M0BP0FFjeWmkSmCpelCjloJSnt14G90jgcAoduepTDu7N2LqT7pdRJFfED7C?=
 =?us-ascii?Q?zsc96MLC2/n5CitBnuzzF0SO+h8xI3DMrNPBhpL97Ll+Ab4tHavpB0SfcIq9?=
 =?us-ascii?Q?9vK14lo+kam9NP+Qnhj8s6QsWw/VRxeCZ8GoXOyOuvgxqF/HX6cMq/1Av5il?=
 =?us-ascii?Q?hzQw7QOsPrp5G6gvAi4cUBpNH5h7UBItavbQeyZcu68PPTRJxMGwLU4SntI0?=
 =?us-ascii?Q?iHAkneHvEH/uKTYmUpplDqj15DF4tm0ObOTxQRyjKdqQsWSR5LflweMtJTaj?=
 =?us-ascii?Q?HkEwnY8ZaDQ62STsrw+oJeNBEOcqO9VlNdmDV5d7d+2iPqC8mXNis4BFZG/X?=
 =?us-ascii?Q?+78yi2Ae97/co/SQSgmw8FrQyDoy0aedXsw1AJEEp6PvrSbX3wxtb6ZRGjmE?=
 =?us-ascii?Q?HfVqWSw/EAokYGywg67yRg6C6/W9AWQAiHbj+h5PecCQQTUe0aPnMqU7chom?=
 =?us-ascii?Q?W2jC2vajfQG42rRgjcEyNhffrurPuIyu54lioqZOOGGKpaRYBGUX7L/tyRIW?=
 =?us-ascii?Q?4TJXCZ99vWY/17NrkghrSl+6QfP6Lyv2Zn8k4IU7RBHuHVFZRVtRl8bHXOCn?=
 =?us-ascii?Q?aQv9R2B0uuw0/gRgm/N5XIZ984XabjOIEdFqDjAm6PJJJZ7eEzC78J4IxjV6?=
 =?us-ascii?Q?p92aW6/6sCLYKoGY3Uz35Im35+Om3knLElgjRefLR1eJU80Uj3Jc3ieaViQ8?=
 =?us-ascii?Q?mSgxsOXGe5Z1KNSVkWuLCZ0Aw/TGyvxiviyyloKYiDAzo9RGP0b32mRrUlC7?=
 =?us-ascii?Q?uJy5DTvRPxbWPlEnRfB8c2lB6yaRoallzSQQrh5nSzdbwXnSnRTPb9eDB4Xs?=
 =?us-ascii?Q?dfFkkqUNxVDRym38WXbxYPShi2QaQKGbgFDrn4A2FrZV5ZC9dkXpjUx2TD8V?=
 =?us-ascii?Q?GfMohGnLiNvPIiBwsburiaX64IRsaGzduuGTOkIVqS3wsqMWNzJ2ztpAi2EZ?=
 =?us-ascii?Q?oGMXzHEcpc0EUWQgiQTNwZ7XfbMZ0wCfsPZi6mZ/ati6RMA7BZqyHBHvAbab?=
 =?us-ascii?Q?lrptTWzVY95E84j03K23Ewo799aCi01J9SkVG82utFXogDr/uhm/xP+R2J2u?=
 =?us-ascii?Q?oYAZVliclsAEEeudJ5oKeNmapDDReMaBbXz7cOceXA+Bu4c7DtPZwyjL+0G4?=
 =?us-ascii?Q?z7ukjPQpcmYyhgIaq6YYVtPq6Nblskf5SyHRNjnHm40/mX5p1VPdNI8BnA0O?=
 =?us-ascii?Q?fZytZxJGjsVZB6WQ6i5eMR7bhgTZIZ54S984DNeTTk8+Q3lK2FOdscfCrWlP?=
 =?us-ascii?Q?TxnP3OhJVG7nRYZb+F1U5ttHlWXfhjbe2uzO?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(61400799027);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2025 14:14:11.5771
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 626b4f13-8145-4dbb-3a0a-08dd8bdf1be9
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D3.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR19MB6871
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA1MDEzNiBTYWx0ZWRfX2k7SQmR2moJY B5HVuVihdQlSZ4tjQuhXTxQoBb3Zg7C+Xrs/ggymlEdM6OwrshtU0wbhc4U46kErRFhLgmd7/Fl cTcPsu5zWbhcVvQbE+SKW6GV16D38EuY9UlB9GGNHstFi9rAqyTHfZyDYmJ5lLOXtv87YT2Dk42
 U6sk9e+ytSzboFJNwULNxKen7ZjlVmMFS4DkmRkShhjqCzuTlK1A737PPOfRmejQzW9mQHUusqo Wk3Eg0t94N0OOk7Ci1UZBdFmXD5cbgkMv4Im+C/OlZCMuii+V+/OH0vCG9uyR30tHOwgpiwJ653 MbEKJANYDScYCgBH8EyS4F7r2nP1R4HelMFKBW3nkV4XxCM1MYMvUh3nBoKiUQgc0Co9Wu8O6Lq
 3Gl598lWxKH3pWvrUkeZRmVnBf2bSfy7NNLq4v8NFkEcEo4VIMWkj1vlKoI+Rtji92tDaEQe
X-Proofpoint-ORIG-GUID: YbnlpLT6n8oMekIR_I3Mi6x0uIyeDw0b
X-Authority-Analysis: v=2.4 cv=at2yCTZV c=1 sm=1 tr=0 ts=6818c7bb cx=c_pps a=CZyBIZNk7+VlD+/eRBofeA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=dt9VzEwgFbYA:10 a=s63m1ICgrNkA:10
 a=RWc_ulEos4gA:10 a=BZqchDOP1E1L8KA0fuwA:9 a=zZCYzV9kfG8A:10 a=BGLuxUZjE2igh1l4FkT-:22
X-Proofpoint-GUID: YbnlpLT6n8oMekIR_I3Mi6x0uIyeDw0b
X-Proofpoint-Spam-Reason: safe

Fix a small bug that can cause the sof_sdw machine driver to fail probe
after the first time it has probed. Also do some minor tidy up on the
handling of the platform_component of the dai links.

Thanks,
Charles

Changes since v1:
 - Update commit messages
 - Removed fixes tag from the first patch since it is more of a clean
   up.

Charles Keepax (2):
  ASoC: sdw_utils: Remove num_platforms from simple DAI helper
  ASoC: Intel: sof_sdw: Avoid NULL check fail when re-probing

 include/sound/soc_sdw_utils.h           |  5 ++---
 sound/soc/amd/acp/acp-sdw-legacy-mach.c |  2 +-
 sound/soc/amd/acp/acp-sdw-sof-mach.c    |  1 -
 sound/soc/intel/boards/sof_sdw.c        | 30 +++++++++----------------
 sound/soc/sdw_utils/soc_sdw_utils.c     |  9 ++++----
 5 files changed, 18 insertions(+), 29 deletions(-)

-- 
2.39.5

