Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47A2F3ED130
	for <linux-sound@vger.kernel.org>; Wed,  4 Feb 2026 13:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770210006; cv=fail; b=GRwEWjA2wgI5Cli7jdLKM7NBNg2WD3bs7TcwnBoxPQLb/6U4ZehIvmLkZEo0vnt7BykufvIhh7NOOnwhRFN6SO783RtitsMQQWUKhn9SZIVAxJ8bajHPpHOT6IjfjQ/oDepkGtdRduZbsEmwLF9pKU3VVFHUIVMU25N3s1n+soI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770210006; c=relaxed/simple;
	bh=LqxH7cbC3FI+1Jqan5K75SU0heYB7LeYgA3e+65CwpQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QcWqKqBs0mI2VnmuKPYNvwjNi1flCBczWB4zLQpCe9IXWyURdf/hKoXnpjn7492RT5TEr/VFrKESzCDY+CFHpkvvj/sm6GFV5n6ReHodzmkDVkSMllPVr1DD29COqQ5Xi/UspXeENTJvvyCNyp5//59Zti+W2UdGFr9zYuJMZ3A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=aumr8wUg; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=dluA979w; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="aumr8wUg";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="dluA979w"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 613IC9i41230356;
	Wed, 4 Feb 2026 06:59:53 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=WzoDpflC1ZrspdAcg1M9JRV9P4i8yeAfjYL57ZwHoEc=; b=
	aumr8wUgzFGR8OuWRiwebWut9PjB/Z7f0EZDozii7S4j4BLRRUOyFIAjJ/7BokLS
	BD0XRwQpE1yxTfJlyl6wf+S87+xS2Y4HOnKw1En2KXfB6oFEe1uBNt4mk80a/oOY
	Y89eHk5qbj7M4NcKvSRml9p5GsHzsNzX6p6SziNWg12t0z0w2c7YArnKG+qHYEHV
	Jh62b9SVw28XuewFhUwPrO4ovPK/shV1AxAUtmc4/DrMseHkpV1pfgSAHNTntZKa
	n/NOd6AU+9aMb8bDNuohCUsKXIq8zNFok84lsDX0M4EPW+2QZ8/9KzuJWrcJTGBD
	yHA2zF0ICLz22qzlfPhR5w==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11020107.outbound.protection.outlook.com [40.93.198.107])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4c1g12vh3c-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 04 Feb 2026 06:59:53 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f2BlTE8Z4d/7a2k+qf9Hmb+t5RXHLvlWyCAJyfb0P+SuT8HMyeUtGcP1jBik435oERMVt4e+b6ccfBf6umSj30PF7icKPLUvTePNrvDb7BO/6ATji1gFqiLcD7Fxgyb9+/ey3QPVdePOgCKDS6YEk2FLe4m7BT1gSKC9yoAreWOJLPTF+NdSkC905zCtOS9jlEVcw+dGEw801n0WjCuzvDVyenvoIuYEhmH6Jt5Z8DrTyjHzAs7nvevFOHCXIQN8rS+XZKbn/T2ns0X47JqMLt6Uprq8xtz1gCIACaQWyLeTyzTeW823pE/xW4UHAlU+9pU9m37+lJP5mfSEADa8CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WzoDpflC1ZrspdAcg1M9JRV9P4i8yeAfjYL57ZwHoEc=;
 b=PXkB+EFtE+7vB5QqE3blIg5HBiwMqikqJFhNrpJU603GCo3xVjyfPTRwmLxwhq74y/7pYh7r6SxUxpskyyjjPNqZ1tap7eKeiv/lKnjxNF4QYfm9H4fN8ff0uhFUFuKjJoD8FVV13GI8uFZ7I+V0mDSGt5IIL0aha0+GV5EUbsQai2Whc26cXKb2F7DDPJcmiyv8euFtmZSxr5oPIyF9sDwijo6QqTLvVTtC16WZmFvlkPqV4Wp5GUShND2Vv3aVisEvNS06/rS2fHQY6SdcbZyutiQoYq7MUF3aqVfuJo+ukRMNR+telUts50bzqUgNejRoqKMBqAwvOFQhP7qVpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WzoDpflC1ZrspdAcg1M9JRV9P4i8yeAfjYL57ZwHoEc=;
 b=dluA979wH1eySeik0SSXUYGuHKM1LLyemPs4Rr8/gJuGcd5oVbBjdgIcvaTguCSOEjZejZaCHwy8UPmTHf1MzpSbEMNAexYgp90is1RUuZVnOJepyZGmUexGGOWIwC+n/7rdvbNCzAZ+xoY9mSq9ekDW1830jZhN7QkeKeKdQXU=
Received: from BN1PR10CA0002.namprd10.prod.outlook.com (2603:10b6:408:e0::7)
 by CO6PR19MB4785.namprd19.prod.outlook.com (2603:10b6:5:34c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.13; Wed, 4 Feb
 2026 12:59:50 +0000
Received: from BN1PEPF00004680.namprd03.prod.outlook.com
 (2603:10b6:408:e0:cafe::fd) by BN1PR10CA0002.outlook.office365.com
 (2603:10b6:408:e0::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.13 via Frontend Transport; Wed,
 4 Feb 2026 12:59:48 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN1PEPF00004680.mail.protection.outlook.com (10.167.243.85) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.10
 via Frontend Transport; Wed, 4 Feb 2026 12:59:49 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 19FC040654F;
	Wed,  4 Feb 2026 12:59:48 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id EBD39822546;
	Wed,  4 Feb 2026 12:59:47 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 1/6] ASoC: SDCA: Remove outdated todo comment
Date: Wed,  4 Feb 2026 12:59:38 +0000
Message-ID: <20260204125944.1134011-2-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260204125944.1134011-1-ckeepax@opensource.cirrus.com>
References: <20260204125944.1134011-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004680:EE_|CO6PR19MB4785:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 22e0cb7d-a5d7-4c4a-bfa7-08de63ed47d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|376014|36860700013|82310400026|54012099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?zlWk5qSIWo3jY8oSGoqwFkIzGL5pIna6wIRKcwuhAbjn+DLXvR7KB0Tkc6JR?=
 =?us-ascii?Q?NeTiEWVlBZ+wcTOgj6EqVpwf4ZjQ6OCthVudlbEnkriwAQ3ZOdt4cpkh3wQ3?=
 =?us-ascii?Q?lysh2zTr6h9AA+EaWtG0hZG5P38pEiXdecZ2VIZEmPmyss6ZY/uaBdigf2PB?=
 =?us-ascii?Q?HOwmxMW+Ua7+udO0qnvXw5Onq9m8DnNkIu6Mp93dWsjQWrNPLj3hCkIadK21?=
 =?us-ascii?Q?sucF8SIw9uWl345UOTSkhyIj2AHoCr38zjtDJUeStoEYcqpLDAgsv8l/IapM?=
 =?us-ascii?Q?6N9UbASCHOboSRyQqKBhAc+knH+lYxS/8Rl9php+r+rELY6g8bznKmhGaTQZ?=
 =?us-ascii?Q?ua1eblEqC+DhVdoVI7fMJ/y3wOok8JcWet5GnZrIyuDB7b0MubCB+8RYhjzv?=
 =?us-ascii?Q?ROYz5eXo+W5EW7USI8VbWI4wZEQyWZyLvfysk0t8L/604G/iPiUXeTZ0cTvg?=
 =?us-ascii?Q?0gGdVkvBvOkJMcoBej6jhV3fri50pFUccJgo+kuvXXTu29kpBhyqonxJOXNs?=
 =?us-ascii?Q?059aFW85NA3UviKrSe7TYXo9LyB6rm3NcH5/gw/wKoOJVblJQwTW/9fs2vOq?=
 =?us-ascii?Q?5EbgVIaZeiihH3xMuW6wJX48d7izZ7TB8P6f+d/WspqlUrNwNvn/vkViyi5t?=
 =?us-ascii?Q?spqWlIPBXzGmyiXPGewck8By8qYNL1fkUaw4vXZTGc60CPDa7VDBBYfiKCV/?=
 =?us-ascii?Q?lxrovNS/O3OR6s3W/gfbpLYu4qW+oonbqlYS6UA0toCIJ8DIrDD0c/UI0fzP?=
 =?us-ascii?Q?FM4ry9tO6tHVylIOfFDT8p0wjsWq4xLahCP3qywpogJ8KETfoftQ5xk4RCf0?=
 =?us-ascii?Q?gKXVC1dBMpiwtk/CEkzxpqc7l7hGrcQhwnYlvDbxC5hdmHxFWcJekBw9hnOh?=
 =?us-ascii?Q?Mumdl9gkxF5bt+oOXZJ2zfazPDoyBng0vmlXpDdsPBQemdQO/0x+Zdx2Y0Ho?=
 =?us-ascii?Q?1H1ibh/2Y9quI/ymzgmMV/od/L5JieDGc+mJ1s8jpCn3c0KKP+FFMuszaM6/?=
 =?us-ascii?Q?0XxwfufazSvF6AXwHQX1gCtj534WqF7dFYD8TfmpnD3zaOpUiCKAPltTCUR4?=
 =?us-ascii?Q?unVaWtOwdiDPycI2ItZSiK4lK9yrPTAazH+qwBm8W3vQfp1wopSlhy4h4XgC?=
 =?us-ascii?Q?0Vaq+/RNUV9o0gJR+3Lyk3+JDkPrw36nAgRgm35SSt3dmC4R03hIfKEexmYv?=
 =?us-ascii?Q?JLRk+Iagzgy3FWbKKdK5RPz2JhxEJ97PVCrS17pugoxXuNxCcarfhsY5kmg1?=
 =?us-ascii?Q?rxFrCdnmVJ3ASEywNvnMKQqetud1FbAYI2O6QF6QVZk1TbeQCisPqa+w7xIT?=
 =?us-ascii?Q?XHD8eS85YR/lG77DIvwKlgRCK0i5M5xMpPvkMX5w1GEbTtcyDXtZwagBV2LR?=
 =?us-ascii?Q?QYL+rjof3ft7maaJ3kqvyRdFQmAbNPObGNs8Tvdl0hjoZRCOObi+p9hWINuF?=
 =?us-ascii?Q?4q9dXjS+4R9m9/P0V5UTmAS+Kfn86QU26KUaGTacWPuiCvXNa+F7/V33N/b+?=
 =?us-ascii?Q?kIBEhdtm25v/LmCOa5rH3Mh1O4vyioKSReMwC8G9lTtOn+DTLV5vLF2Zv+Mm?=
 =?us-ascii?Q?B+sNQRVoa1rODV27oJoEY4qP8KePAnt94C6cA8nsZOYzT6LxSAPVrE2/vS/b?=
 =?us-ascii?Q?MuXOAKywaweVpvgufXiOBgq6jrRz554Obw+czdF0JQJkQa/PF8OIwUFK4ojO?=
 =?us-ascii?Q?cq05Rg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(376014)(36860700013)(82310400026)(54012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	qiOYU2NdP0X9grBDlR88TrAFlVXpIpP5WrywJ5efbQFN8BQOQq0BwCkYJTT+HX4r6b05st5cfJmfP6pwrDbw2DPcvYEdZlbKgBoAFm1mboTQpMwvdXFHi6vElKB/wIA7ubiO8GALr0TJc2kb2ExluSp7eqFLxXNYnibuBnyIeIu55GtTtWHkIrqsIoIyB8gUZ361koJ60RM02/WYJn2K+Ki/1Ht5bZLY4QiKU39jl1JXIGwkDZv0qcjBi+3vGQvEmpukN765uU9ZRqK8OWr9xgSy6Il/9e6gVF9clZD4322Fa++C7oX+qrea169gc5MugLSvyP6LDc5TXluZcxD4WzmYcKc3++tDu9dp+NRdv62zySkx2eyCrApk3ii3DGrDyOYrO3DAL85fBMHVO+Oj+chrAD8P3oCjbuuhPFL9KegLCkGmpyIE/DIsWw+x8+8U
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 12:59:49.4651
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 22e0cb7d-a5d7-4c4a-bfa7-08de63ed47d5
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN1PEPF00004680.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR19MB4785
X-Proofpoint-GUID: sk070VbSv76Fsu9pWvKXeQk0pWZcHx6W
X-Authority-Analysis: v=2.4 cv=Mdthep/f c=1 sm=1 tr=0 ts=698342c9 cx=c_pps
 a=lpCYFv1dv4XKb4XztGS+VA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=HzLeVaNsDn8A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=w1d2syhTAAAA:8 a=lJJuKfGUIHh2T_JhiOoA:9
X-Proofpoint-ORIG-GUID: sk070VbSv76Fsu9pWvKXeQk0pWZcHx6W
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA0MDA5OCBTYWx0ZWRfXzgGGl27Pp4l/
 BdTgatRBZAi7TmyTz0u+P23VtW36+p3qfqJ5ee1G+QbtRe0KzbIklCzjGTehH9us6JhxG6m3u3m
 MdSwqkL2vUGBYJl8WTRAoePFeBRFa4tKGZGvergklTjPhfZgnk2S3XJXYDuC+afUnhL2aAgOeMt
 c4JB1qVWmJFna/f07uyFMFecitViuLZK5LO5vAHDSNNkHdOYaN0g5Hh8y1ezCvfym0zv97uv26j
 T0Y2Ws0uKv7dM6EPMbwJzt4kOYNv4e23eDNcjYa+MVSfQ2euJavv4Oyv6+GSDykVidhxOw4JUJy
 1PD9ApjYrP79OCZzbwl/6xlMijxJTwraVGaZka7CSr9UQt2aNRPyy3//KPRXlPhMx8yGhdyHaaR
 1xwhwIhZgS/h64FsuUMmefVk5+nLgJsrkAAIWMp55Vx35YVtFDwglt8HW+2zzevoupqOl2WhFG0
 mt7xZQoEfmlK2DTUw9g==
X-Proofpoint-Spam-Reason: safe

Support for -cn- properties has already been added, however the TODO
comment noting this feature was required was not removed. Remove the
now redundant comment.

Fixes: 50a479527ef01 ("ASoC: SDCA: Add support for -cn- value properties")
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/sdca/sdca_functions.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/sound/soc/sdca/sdca_functions.c b/sound/soc/sdca/sdca_functions.c
index 80c71116e6d4c..f97dde912d590 100644
--- a/sound/soc/sdca/sdca_functions.c
+++ b/sound/soc/sdca/sdca_functions.c
@@ -911,10 +911,6 @@ static int find_sdca_control_value(struct device *dev, struct sdca_entity *entit
 	return 0;
 }
 
-/*
- * TODO: Add support for -cn- properties, allowing different channels to have
- * different defaults etc.
- */
 static int find_sdca_entity_control(struct device *dev, struct sdca_entity *entity,
 				    struct fwnode_handle *control_node,
 				    struct sdca_control *control)
-- 
2.47.3

