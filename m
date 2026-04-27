Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CFC130DECC
	for <linux-sound@vger.kernel.org>; Mon, 27 Apr 2026 11:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777291193; cv=fail; b=u2tLQW3E9nfLBKt6fWNmzSXBTbiRqGWfcuUTs1GlCM5viQZIDHP+6RCbwFiIFsCb2FV0Snbng+/LJCtscozYYPhBWX9G1wcO5rQQbP8mdk7zHjCtZVVVBJbHP7awJCz0vacJK4+JP75G2IvCQAnxAZZqoXgJsCw09b0TH2U1gbw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777291193; c=relaxed/simple;
	bh=U2gyuCeNbnB1ar4ekYf+YZo1OCWjzIUpVrGH+RptSHQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=c1x6HJNvUkfAsPZBpaP835RcKc5Gr1YjW6+Ss8ICl9XV7HCy2EjGm2H60BoBGXSe579ZmsxqREvcMyh97Ys3xgzZNYkIQDV2OyZ0dgGC1UzLzJlrX/kyr1Jk9feGkH/N7H1vyr0lulhaowrnwH09zFIRLUhUzHEAdwwz3rX6CYs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=Zs4uEpl7; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=by2ME+qg; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="Zs4uEpl7";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="by2ME+qg"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R2UXYB1672842;
	Mon, 27 Apr 2026 06:59:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=JBPI0hcGvhFlC+jK
	55NVcjRlTYXqO07jZjpPf2Hr43Y=; b=Zs4uEpl7aAM+EUrzyQmuMKUEFzT7Wxkm
	c19u3saeZK3KLDAIjsNhz2LfwSDWM2rj6Jze/k7E5d1U6IGMrt7Lglw9jEL9iK8i
	3cg85idsRo4zbRKOEAXWhu/zGP//WAMi3X8uxx3IVOqgNzhp6b2ZGTnUPvUxa+/f
	/Mpe5+3jx2n6wuaXFXwjEUtsswcBM0Ff+zolbVGkEhXSVeZPQ4NKTbPIqy2svkbW
	yFqRqKaraswmHzjq196V6qSH1OOQa3SVTV5Hrfeay/cMf92kT5dcHJHGimd8fkQO
	AwpbifGyMlgoSOMDNL6RTJOh53FSxxVVA6icnNIFG3mmNForpMbqdA==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11022081.outbound.protection.outlook.com [40.107.200.81])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4drt1jjc0f-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 27 Apr 2026 06:59:37 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V0iAn2Nt6ka9SfE+NXoXN5fQXqDBJ2IBV7ghuq7moHeiSrK+RyaQ5WCzdeL7SzlDPtQ+E+Q3Vc9UMPCOum+wIFRJU553TKbwem79wfy/mV6kjOdWQ81cSc3QAM7B8MX3687ocmMuHLsAOJBHjMdJIPteayHqP/CpDvEXZamQNsNDqqJaP46P6IllJGgdZ0qQ7co2q0IBTyVL9+Jvowv5FK0nbPRQ/8QQ/GmSOimHIzdLvPJQDYtZkxnvMzB8FP+7ykCrVi4mmNjUfrSxIDdOfl6mYbQvFk9TDnjrhniKjSml0exPG/2HeM9STF3BTeO+HQbrfPK3n7mVrKhM4HRDeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JBPI0hcGvhFlC+jK55NVcjRlTYXqO07jZjpPf2Hr43Y=;
 b=X70s9ZbNoZybDh31bogDm285i+4Mfo5i3q/a1gmo+KHb2O7f21vdzGYLNiPHUUKb2TuFYm1/9H1IrszKmRsYaD2KlOVunICFCldC5RT57IRoHRSPMijXkPUbTWx/M+aFpLonua9lwjOrrsfxfe9pbXSClWWP2qW+MMiGyVkjmY5so/2l6oP4PaoJFOwkmUQunTRLiXZr638mKu0IAjFXjWG4Xh9pGJsjgZE0WUMCVJYoN3jgVXvaYmU5ihD8FtZdrmEKhjpinpm/sHIz84ndDmkNOJ5I8zaS5eYdBEoMmhCGvjHCxxg/5ZP8TP803cncJm0ukCgkjN7rb1tnqMhGiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JBPI0hcGvhFlC+jK55NVcjRlTYXqO07jZjpPf2Hr43Y=;
 b=by2ME+qgWTh0J/VfuQ7o+PgD7jaz8VQ4nxkFqhsMd/SGM3FMpMxDS5DI8tk2G0GREhQQfFIb5xDsp07XMWPTpOsK0agUzdUjkL+jMW3mMjBtmefEFUSLb0i94JkBNrwCw6U3nScnl7mhMgCunh0vn1LQOQIfTieDNzY715M2drc=
Received: from PH7P221CA0055.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:33c::27)
 by MN6PR19MB7965.namprd19.prod.outlook.com (2603:10b6:208:47d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Mon, 27 Apr
 2026 11:59:31 +0000
Received: from SN1PEPF000252A4.namprd05.prod.outlook.com
 (2603:10b6:510:33c:cafe::10) by PH7P221CA0055.outlook.office365.com
 (2603:10b6:510:33c::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.26 via Frontend Transport; Mon,
 27 Apr 2026 11:59:31 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SN1PEPF000252A4.mail.protection.outlook.com (10.167.242.11) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.18
 via Frontend Transport; Mon, 27 Apr 2026 11:59:30 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 8749B406540;
	Mon, 27 Apr 2026 11:59:29 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 79CE1820247;
	Mon, 27 Apr 2026 11:59:29 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        linux-sound@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH 0/3] Improve SDCA support for duplicated features
Date: Mon, 27 Apr 2026 12:59:22 +0100
Message-ID: <20260427115925.3801099-1-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A4:EE_|MN6PR19MB7965:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 003cccac-c361-402a-bedd-08dea45470e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|36860700016|82310400026|376014|56012099003|16102099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	STXnEev9w7uacKbgQcl4CwGwXJ8RzNia3r0iC1Lrs/I2fEh5w64jncvI79TKSWsqmzNIfquPpwcJZ0J86iPZ3mP8rAXJsy80iaQDuk9B+WhnRt5huPLUPhsMMKHhN6hRAxTkjwbU0nrjKkMScmARwfSENWGL46AZcr/hS8B8qtgnd2NuEoF1uRwSvK6Sa2IQxbWTPrQhR038cGFaaFFEdG9yo7NuIkMDp+5uZ3DEGnv/M9wBTLw294oOTTbz0vuAVFnKNKbqDLDqtzmS1BDth6UgXKO9fT450nvG6Tp4fdRni9RUwF6mvcb3x+ega9aCc5QYLefbleqFzU2Ancjpe54OuKFiRhSv69FOSp2ZvihoR3sPYy1r2xSoHzjSfQfUnZLY9kKIWyWFaW5age4RRKkyWHbuwB9bn2embXdN4f/FCh/chvh0xA5114ruS1lrr6UKE9N7d6dukSyF7Iqm1XnXcdCHm1eldEY7StVOgRjbIeLX1IOEIlwicAGiHOJkJ+VXt7SUWtUw/xXDVcH6q473pEywc4t69QtRX/3FDSTynqowX+o0GU3ogS4KDl+CM2AzIBQMPQRP2DZDR5XKJepT96KMJegLuHMJu64IWQW0mO5Zp+jbrO5SOeKfC7KGy/Z5gQEMAe4NtXJyNuPQOetR4L3vs5b37E4jF+/agp6LBjUuTNF2qP0OEBkFTvawNZO5MQ03rvwoiOjoCsiHW4/tnSb4wtuwBwhrY9qGiIN0WHDTeTGyVs1ftlk4FSWQlsXXDtzsNl+oi3/3kHyGig==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(36860700016)(82310400026)(376014)(56012099003)(16102099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	0QWY3UxYAPxQ6VYnevNV7xRJmTmNGeVHvBHWwBAvHrGDm7bZIdmRtdIS38lXwMXMRGv+8/AimCEfwA/1QjyEpA0v5wzl2qu6VEENOIsVr7Haq4ZHf0xpydMtnzqDz/tr7VJSS93lmuVtBDjZoP5zn8vg088CJ8SQ5onnfkyj+yHbtML3tRG84kGCGAf++zD90/A/WqhXS8ZzOG5vZRMLso9iWWJn4qpDzaCPNsP0hC2cFMNuGsZ7W0dOKxextMx7e2+KhyqAr+0rNJwOjwkWJEY7sbYBZ4wS5F3hnZAYso4hWUeX3IIeLaQzdk9+5cvEbkwifE2k8LNI1QTuCdBWgkC6LsanEiF5J339FzCGeODGhRo11krMY5zxnUMWXeJ6jKX8Z4dIWXPVoyGSWbo1k9Bq/4VvYxhxCRsMRIfJQdJbsRXDJajgz3h/WNNFrQOT
X-Exchange-RoutingPolicyChecked:
	AZuAfM2w396FaP1qDO5ysYM4zE4+4FsHhp+LrfaU8v5jGFrpcCyU3MzkPo1n8Lp7vj/WYIOuUWhKjeomR941WBM98oHPfnoMfI3NoUbtT9tGCzbA5ihVoCZ6iqxB6kirztltzkOR3K2gneEYXCpoOLTASdHHuPbAY485ImWV8jalwQQlDOSq7OQqC3rGI0/aluNqZOMVU1aJOKyEKbhfrYbV6OGXHMLMSUYFTHHo9kSvqfioE/L3Nj6GDXI5Nz6BaJA5A6xVAMz+c5R9BaMlrUtwWYdrxbzgoQKS3GZ43+usYBRkYvh+HgJS+FZms+5xK3x73aGx7p0laP8RvzPK8g==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2026 11:59:30.8646
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 003cccac-c361-402a-bedd-08dea45470e5
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SN1PEPF000252A4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR19MB7965
X-Authority-Analysis: v=2.4 cv=fbudDUQF c=1 sm=1 tr=0 ts=69ef4fa9 cx=c_pps
 a=W2lJqvwlxpc/IP2FXjrMFw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=A5OVakUREuEA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=tq3VnGD4GgujheajYW8A:9
X-Proofpoint-GUID: r9EhrJ0u5cQ-0VhCmAtyoPW11U1C8k_c
X-Proofpoint-ORIG-GUID: r9EhrJ0u5cQ-0VhCmAtyoPW11U1C8k_c
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDEyNyBTYWx0ZWRfX6KIe29FIu/Bw
 lVQOyOgQByfNIgh7caKp825X7TrQPkBtmNkF7wiwHEjx4spRWr8Ee4cGfL7qmEyc+bYcN2/MgFT
 kitlBFgglcd0KcuuuuRhywop/+epMM+WPlnGcuGgWazhMcyZgdeO+0ci+5OfoQLSdGgTaZXoC3z
 1nukZ0UvkNmLxfB1WqmR6cceErsxFle/ZyO3Ufw1TxAgt7drqETA2Pt1Lh1SChDI2QXZEpkR5sg
 WpEzQ/ux2wRVGQj98y1WvctfOGngAKw77azvGPH1SCzFAfW/J1eDppp1WqlwahOp1eDLbuEWibI
 uyW7y0JOoT55r+sgW5+/cD5H5oOAbNJzwOzkTXi9rxIIgBdronAz1EOBDFd/z73OFDT7ppInPDI
 espfmhcGpqY+FGoT70EcuYHLT2drixbImI3jsMS3PUlm+FRjsYRpUOY0kqWlRU8jQ9fGnHpLGx7
 GVBBgiPIzvHQNSrmF7w==
X-Proofpoint-Spam-Reason: safe

There are some short comings of the current SDCA class driver with
respect to duplicated functions and jacks. Fix some issues in the
reporting of jacks when there are multiple jacks represented in the SDCA
topology. When a single device contains multiple instances of the same
type of SDCA function the current class driver will create duplicate
controls, update the code to fix this. Finally whilst working through
this also tidy up the handling of the sdca_function_desc pointers as it
turns out some duplication has crept into the code on that front.

Thanks,
Charles

Charles Keepax (3):
  ASoC: SDCA: Add correct masks whilst reporting SDCA jack status
  ASoC: SDCA: Remove sdca_function_data duplication
  ASoC: SDCA: Support devices with multiple functions of identical type

 include/sound/sdca.h                 |  3 ++
 include/sound/sdca_function.h        |  1 -
 include/sound/sdca_jack.h            |  3 ++
 sound/soc/sdca/sdca_class.c          |  7 ---
 sound/soc/sdca/sdca_class.h          |  1 -
 sound/soc/sdca/sdca_class_function.c | 23 ++-------
 sound/soc/sdca/sdca_functions.c      | 51 ++++++++++++-------
 sound/soc/sdca/sdca_interrupts.c     |  3 +-
 sound/soc/sdca/sdca_jack.c           | 75 ++++++++++++++++------------
 9 files changed, 90 insertions(+), 77 deletions(-)

-- 
2.47.3

