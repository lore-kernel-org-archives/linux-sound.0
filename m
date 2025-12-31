Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1520F2C0298;
	Wed, 31 Dec 2025 11:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767179812; cv=fail; b=q+SUImRZDZEq7STnYSMxqBX8uWTCOqe3H1TCeSQVXn0QQJASBOZymENUki7ftUKdqcPCdGKgtYo2yoLo+d5grRC0RZwmOk6X66dVKKxanXqweGfy0JnslTfFxYXCeBOsnGI7dOjSRqcRZ8e/TgkMKbedKgmFRIosIKxTdAPS7IU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767179812; c=relaxed/simple;
	bh=dDRakJLoLzbjI+Gzcvab0QgkrbbD5QC2SsFvnukedmY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Hs1A5uNEOIFgpfOHaJ5aaAqpEHnyzyTQ3ofMldEXaU6Y3yzeHI5bJJz46FdX3+QgRnp8tEtu/hP8I6v+CBg1Mu/fxOwnYSQNTrK0H4TmzT9HfIW6wdO6DfF75ChBP/5ojkgqBU5yoWluxEmKsrTMHeZMcj2HQdzT5aNQZkD7b2c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=fmzUlDxb; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=U9CMCFr8; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="fmzUlDxb";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="U9CMCFr8"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BVAg2uY3726978;
	Wed, 31 Dec 2025 04:50:09 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=zEhXrm9f/Zwepm4UfVhCwfjHwSEf/AwgI2g1GE01bHA=; b=
	fmzUlDxbEB+2dr4N08oAzntv+1XoC7V41tQXESQhmbWFjxBseX2v58EB5MguPvTa
	JLoHklFVy699Jy4w5YlK5HGgytwhG7eVdydG8mick/pp42F32m4AAFMebXY+u1m1
	IRCOxTh3nQCldgeqbj8YSFT80xVNh9y2xYoJzLQtYcdqkNNJqU7nyUSaV7SbQa6a
	RWf1bznEe15Rw6o3LpyFLOvu+4YII8B89XQ2RXKcuL8x3tvvU8vhGRkq/Mcoma4y
	X1MB3UogREPjfgLZUabccW1keOWHCx1qM3mg+uIWUZSEv5CcKX4Xk4b89TQEm1ns
	RuSdbfvckgXj03nP8d8gzg==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11022100.outbound.protection.outlook.com [40.93.195.100])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4bacrmv3yq-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 31 Dec 2025 04:50:08 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wsFAvm6zYZpfm+3Whu8NmzkVxEyhy5Ql7F3MPjxJ6cwG57H8P3l+FQkNNqekLBFwPhx7s0y1z7wun3GQIfs8ZLcpt8jqvuMPfzlpFtoES9gUhoZBTwBhiFoBPXcKKDrIoRandrOSK9h9smQMw2yt5GfvAteJ+zn2XF52nci21ejd3AZVREUv2cTKJ5vRkx/LaqTHQytQH9ZVFrcZffkYvUYIeYcFEwN9+NtnA3uTFUTH2hWlqfBM+PMXPVE6idtoPrto/jXNZ44Z5stevLQ0mJsa4DGq6vxj8nE8ThDFh7bir0D6ZLjN+NFIelJaLHd2a8QliqGCW+pJTIdRR7mymQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zEhXrm9f/Zwepm4UfVhCwfjHwSEf/AwgI2g1GE01bHA=;
 b=YA87QVyWKZOkap8jbbjSwiMlb45+DL3qMXgv6rLT0VGeqFM0KaGRhc9IyEn/2Txci/pUYcs3xzc4Id3uafNCrNAyY4hMYP6V8gybHCIgUkxIl8H4oxqWSeRbQWN0pmc5nNJ1ntBRjvg+uJAsEgqk6JOK7wsqSFUypPRObAFWENhKiwBgsneifVVIU9XmAmNJ3z4tXTv0iT4rVLZyMdpW38ZNO7JY/KamTyd+peZ/zPr60PfeWbwkeyVmcCwZqctR07+S4jbkZ731zSjsoAQcRp1tmhZvDK8cOI1RCBy8BpcZb3GGLhxBZpLgo5O4bWUctHGQYUPzRAZOsQhvmv7Rqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zEhXrm9f/Zwepm4UfVhCwfjHwSEf/AwgI2g1GE01bHA=;
 b=U9CMCFr8SjrnO5mQGvDud1KLGmjq+in4aGK8blTFCarE77v2ovgD9QyKnzK9zgWHC95SEq8OXlL+hjgm0ZPbckW2Duy/JC7FUw5TOhhenhMyBsFnpVoAC74pNNp8PhSrguMMiIb8+C6o4X/TYFj7qIjWYR9EiOi5aeW5bEit78o=
Received: from CY8P220CA0016.NAMP220.PROD.OUTLOOK.COM (2603:10b6:930:46::20)
 by SN7PR19MB4831.namprd19.prod.outlook.com (2603:10b6:806:10c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Wed, 31 Dec
 2025 10:50:05 +0000
Received: from CY4PEPF0000EE39.namprd03.prod.outlook.com
 (2603:10b6:930:46:cafe::b2) by CY8P220CA0016.outlook.office365.com
 (2603:10b6:930:46::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9456.14 via Frontend Transport; Wed,
 31 Dec 2025 10:50:10 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CY4PEPF0000EE39.mail.protection.outlook.com (10.167.242.11) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4
 via Frontend Transport; Wed, 31 Dec 2025 10:50:04 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 33F24406543;
	Wed, 31 Dec 2025 10:50:03 +0000 (UTC)
Received: from EDIN4L06LR3.ad.cirrus.com (EDIN4L06LR3.ad.cirrus.com [198.61.69.19])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id DC2A3820249;
	Wed, 31 Dec 2025 10:50:02 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 1/8] firmware: cs_dsp: Handle long-offset data blocks
Date: Wed, 31 Dec 2025 10:49:49 +0000
Message-ID: <20251231104956.449696-2-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251231104956.449696-1-rf@opensource.cirrus.com>
References: <20251231104956.449696-1-rf@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE39:EE_|SN7PR19MB4831:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 7978a754-5bd0-445b-511b-08de485a5b4b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|61400799027;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?XCYnCVnbAh2STlO1WJbmW6j2dlhflrlpjoxSD5yeiq92RA6vboUKwTdIe6uX?=
 =?us-ascii?Q?thHx0fpYQZP3IR33C5njhNJxRY1fO56og6TzhbduEQBpPydJvRTG7XtR9LCn?=
 =?us-ascii?Q?onMJDwAFVqUR4omP/cMV8IGN3tNetxDeRsMudMN6WeF5cf7O8Ky08iLbE2Jj?=
 =?us-ascii?Q?xXCMnhjX0pRLGmzgzeYxE7EPleRY/EBmc1/4syj4H/ke3ImcOJjX7dDOSsvn?=
 =?us-ascii?Q?E3MLudQgfLSLPd4K8f4CZZIU90WQvvbx8vcK/zMFrRtvFfialsU7cWWXkdxI?=
 =?us-ascii?Q?ZXsKDyz30ZOX6aVT0wR5XBw3WXGjKH3gBQJ7vlnmzGqeHHaMdsOAfWfYu4Bf?=
 =?us-ascii?Q?NNnsaZruHX6GAKF1a5715Cd1KG7VQwr1quzct7av3P+t/aD1dPbizk2FTtRY?=
 =?us-ascii?Q?M1gXetYItyHW84B7c4xemWHOOKEaFM+esjPYsubZDixuT9/6vF+26Ka1H12G?=
 =?us-ascii?Q?a82Dg6mhZOIXWizvK2O7Y8CLQ8WIMi+H/2q05QmwNKRTqSymMMSMDRgizqZU?=
 =?us-ascii?Q?FOwl9YHQFo6/qmi2IVqVJb1NTPlJNjY0f6yLrbBOBFve1cuwe8nSYFJndPNJ?=
 =?us-ascii?Q?9fR+VKX+ChhMb6cwEJa0nyEm67Pv90E/dDqxi4ZJW3pDfSlERPNbNivVTUty?=
 =?us-ascii?Q?Z3fCMjwshvNjqTg2zrZPBuajCfr9eE3HsCJmnKuL/UY9UE8wuMC2M5bnWbRR?=
 =?us-ascii?Q?lpeAGpjq63iGApBq7p5b6efdAxjlU0+LZRaTm0/MlcsMomufaDHNRSosdA0n?=
 =?us-ascii?Q?Y34spjGqX2JBDv3465gjANI10HnUU6lGShlWf8oH+HUW8PQZD+pUH+eipptu?=
 =?us-ascii?Q?1R56WE+z6jm/lulST3N/jG5sWQcys8jOVPZp/6SmotkgttCA7Hk/ivL/I1zp?=
 =?us-ascii?Q?4BJYRTMewGYEIn8FOIpiVr4xQlM7cIYt8Bhbu4a9+BrqdcgqRVVFzawnKFqU?=
 =?us-ascii?Q?Z+/HfSrr0WfaC5ubQ8EKsmGOfsf4R8GdBDX3h50Y8SMJRRM/VacMuL7z3Q5Y?=
 =?us-ascii?Q?+5LMfmlEOLkDLaUfblNyxA6WgGc5uyTiwMUkey4MGwLzhif+kM2k80Qz54NX?=
 =?us-ascii?Q?i6ca/COGsghMwSWK9gT8S5uLGckccBBujOQUvAvV+PWw82hcr5zHop6NU/b+?=
 =?us-ascii?Q?SRPVysrGuhbDEekkf31v6xriW/Nui3Ywtc+wxKdvdl5b8BVTNmpHoBEUjFPY?=
 =?us-ascii?Q?f7337sP0XfSDRVlwaPY3ew3R6YZZ0hSXbzjoQGWMi2QaNYpQHooJvFakrT6j?=
 =?us-ascii?Q?JwKotqLSaulLh0n74yP+kUfucQE4XsQmIO1f4HRmWsMZVhj0+borDpdapCic?=
 =?us-ascii?Q?H6u4PnWuRxUCyB7pPe+J9nX2wyLjHzkf5CEkjSShvD3uhx0Y6ifApt+jj1m+?=
 =?us-ascii?Q?tJQYsCEkHsskMZe9Aw7upJZN/y1dI08dVTl/a2DfO/Y66EI6jBKolEbdvBKa?=
 =?us-ascii?Q?87iQiU+3kgFPSBPiCnS56oWIqBnp9j77P4G3dITB1B1Vc8pM6xpyTQxCzhrq?=
 =?us-ascii?Q?d9eZfKRcfTwESmih/T+R06n1oVDYW2aRukXVjys5V825SnWd9f9yUlxr+K9v?=
 =?us-ascii?Q?OLp9rYAxSxVf4FFBjDk=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(61400799027);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Dec 2025 10:50:04.6146
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7978a754-5bd0-445b-511b-08de485a5b4b
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CY4PEPF0000EE39.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR19MB4831
X-Proofpoint-GUID: V3GZuBvGXn-KHqoFHlwCb_GhbdEGkoHP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMxMDA5NSBTYWx0ZWRfX/2t3z/rHbBgi
 bZ+jz2UWdZoPyqiwHsIlxZEVm5P1JsJntdbgUkzonzvpmsSpwRMx0isWhcaEWvSaDkyz9gHAVBL
 Qdb12z16gxdmpZeDp7BT7kUGmZoTd09qhZs+Blc9E+8Rbv2ZkFffQDBCvqdpjbQ6YMYNgqbFCyK
 pBle/QUfph49jP6rC70irOyG/L6Qq+A/46zwPH3ozNnAqfmmRv9VxgIXNfs+QHfe+ILARhWmw59
 Vz4OyDbviVPOZ0ongX/ZkhqFq//yIEGSNZx3ZNPsm/8VDb6P9s3wDlhKndq8LWzZy0SdblKDFBR
 xYwBTXkiDtvYOEZBd5u/1SLY+0bzxRTd50Un0/zjdeHbvejX2JIKNKrEXuosR/ulWlawlppzA62
 6AOUgzcAX36r9RSICV+Z9qeYF1151XwTbNktUBwuVfoc3FCxFjPTf+NGnKFOD/CsHk9uKvGTcbS
 VxbQqwUxzLW+PPhx/Vg==
X-Authority-Analysis: v=2.4 cv=bJgb4f+Z c=1 sm=1 tr=0 ts=6954ffe0 cx=c_pps
 a=NdJUlaw63gEkhoowhPQriw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=wP3pNCr1ah4A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=w1d2syhTAAAA:8 a=zNSSUrpu5HfUGby_qDoA:9
X-Proofpoint-ORIG-GUID: V3GZuBvGXn-KHqoFHlwCb_GhbdEGkoHP
X-Proofpoint-Spam-Reason: safe

Handle a new type of data block that has a 32-bit offset. These are
identical to the normal blocks except that the offset is now in the
32-bit field that was previously 'sr'.

A new file version of 3 indicates that it is mandatory to process
the long-offset blocks, so that older code without that support will
reject the file.

The original 'sr' field was never used by the driver so it has been
renamed offset32.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 drivers/firmware/cirrus/cs_dsp.c     | 19 +++++++++++++++----
 include/linux/firmware/cirrus/wmfw.h |  7 ++++++-
 2 files changed, 21 insertions(+), 5 deletions(-)

diff --git a/drivers/firmware/cirrus/cs_dsp.c b/drivers/firmware/cirrus/cs_dsp.c
index d35d0f5ccaf7..aa6e740f9cd7 100644
--- a/drivers/firmware/cirrus/cs_dsp.c
+++ b/drivers/firmware/cirrus/cs_dsp.c
@@ -2138,7 +2138,8 @@ static int cs_dsp_load_coeff(struct cs_dsp *dsp, const struct firmware *firmware
 	const struct cs_dsp_region *mem;
 	struct cs_dsp_alg_region *alg_region;
 	const char *region_name;
-	int ret, pos, blocks, type, offset, reg, version;
+	int ret, pos, blocks, type, version;
+	unsigned int offset, reg;
 	u8 *buf = NULL;
 	size_t buf_len = 0;
 	size_t region_len;
@@ -2163,6 +2164,7 @@ static int cs_dsp_load_coeff(struct cs_dsp *dsp, const struct firmware *firmware
 	switch (be32_to_cpu(hdr->rev) & 0xff) {
 	case 1:
 	case 2:
+	case 3:
 		break;
 	default:
 		cs_dsp_err(dsp, "%s: Unsupported coefficient file format %d\n",
@@ -2171,7 +2173,8 @@ static int cs_dsp_load_coeff(struct cs_dsp *dsp, const struct firmware *firmware
 		goto out_fw;
 	}
 
-	cs_dsp_info(dsp, "%s: v%d.%d.%d\n", file,
+	cs_dsp_info(dsp, "%s (v%d): v%d.%d.%d\n", file,
+		    be32_to_cpu(hdr->rev) & 0xff,
 		    (le32_to_cpu(hdr->ver) >> 16) & 0xff,
 		    (le32_to_cpu(hdr->ver) >>  8) & 0xff,
 		    le32_to_cpu(hdr->ver) & 0xff);
@@ -2202,8 +2205,9 @@ static int cs_dsp_load_coeff(struct cs_dsp *dsp, const struct firmware *firmware
 			   (le32_to_cpu(blk->ver) >> 16) & 0xff,
 			   (le32_to_cpu(blk->ver) >>  8) & 0xff,
 			   le32_to_cpu(blk->ver) & 0xff);
-		cs_dsp_dbg(dsp, "%s.%d: %d bytes at 0x%x in %x\n",
-			   file, blocks, le32_to_cpu(blk->len), offset, type);
+		cs_dsp_dbg(dsp, "%s.%d: %d bytes off:%#x off32:%#x in %#x\n",
+			   file, blocks, le32_to_cpu(blk->len), offset,
+			   le32_to_cpu(blk->offset32), type);
 
 		reg = 0;
 		region_name = "Unknown";
@@ -2236,6 +2240,13 @@ static int cs_dsp_load_coeff(struct cs_dsp *dsp, const struct firmware *firmware
 			}
 			break;
 
+		case WMFW_ADSP2_XM_LONG:
+		case WMFW_ADSP2_YM_LONG:
+		case WMFW_HALO_XM_PACKED_LONG:
+		case WMFW_HALO_YM_PACKED_LONG:
+			offset = le32_to_cpu(blk->offset32);
+			type &= 0xff; /* strip extended block type flags */
+			fallthrough;
 		case WMFW_ADSP1_DM:
 		case WMFW_ADSP1_ZM:
 		case WMFW_ADSP2_XM:
diff --git a/include/linux/firmware/cirrus/wmfw.h b/include/linux/firmware/cirrus/wmfw.h
index 74e5a4f6c13a..eae24dde9e41 100644
--- a/include/linux/firmware/cirrus/wmfw.h
+++ b/include/linux/firmware/cirrus/wmfw.h
@@ -172,7 +172,7 @@ struct wmfw_coeff_item {
 	__le16 type;
 	__le32 id;
 	__le32 ver;
-	__le32 sr;
+	__le32 offset32;
 	__le32 len;
 	u8 data[];
 } __packed;
@@ -200,4 +200,9 @@ struct wmfw_coeff_item {
 #define WMFW_HALO_XM_PACKED 0x11
 #define WMFW_HALO_YM_PACKED 0x12
 
+#define WMFW_ADSP2_XM_LONG	 0xf405
+#define WMFW_ADSP2_YM_LONG	 0xf406
+#define WMFW_HALO_XM_PACKED_LONG 0xf411
+#define WMFW_HALO_YM_PACKED_LONG 0xf412
+
 #endif
-- 
2.43.0

