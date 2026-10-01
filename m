Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 288C33A5E98
	for <linux-sound@vger.kernel.org>; Thu,  1 Oct 2026 02:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790822526; cv=fail; b=pykn3B4uudeGIW3iektDUBO3Z410NKxmNtOd4JLhDm80HGsSgwhe2AxjgXs7HhqrTHZjfSuyUXDOU6b4gpBTApyRf4/T6KNCSfhoNp9ggK3rmgacYzvK0GG0mvRr7qn1/To8wXZKMF4o1exB5e6KFZGCUmC9v0P8xHUnVCbBbEg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790822526; c=relaxed/simple;
	bh=iJIkk2DJYg8SSSXefViVGVwnLYjTSS4YSbS3ZtNxM9g=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=elXrfOQseGPIXo6qQawe/Bq0Oe3U3lLQNHGi1sb1QzxFvXbRCM5EKoGe0/X/Xe6kLtxmndBFJbWpTPRgwSji3g3cq9w5NvTUcQtcN2nJtYeO58XP2cssnMdfc9XUpcZc7irofxQU4Vk1o9YhzJ+2LERNIzwMEr436da0cE4wL20=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=lhSNOu6k; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=TyBreNCN; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="lhSNOu6k";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="TyBreNCN"
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6911MiZS942775;
	Wed, 30 Sep 2026 21:41:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=6Z/K/1cquz5Ku9UCAwqyMcqAOxKrE0k4IwYNdwOIy
	Jo=; b=lhSNOu6kKGEZepAoKIO2Vcxi0MMY94cMYeYkRddQULf9IvfZEMDP1fqxN
	f3Zvks3Zt/iXabDtA6qR1SWOsuIvXtD3fHiLmlHjAo5OcqDuVV7wy7L9yYjuT0eF
	5FHe8xJgXrKKHkV3B9L9PLk58ICdBG5zhUIgoZ1DNYO83KU+SIuWN5Alxzo4U35B
	1QeVpIGRkGwM64ckP/hEiSPmBre3+3WF2UoShIeXf6IRPbdkr7+HW8jeFXUPfC79
	pbg5MgSQ3IdkDe7VkEXv3Dq8sMwEwYA4qAClHm8QP2/VQMMkFDXlpIIpjBQT8KgC
	FuJwHzlAIAWHdji7QAya0G4MemjsQ==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010025.outbound.protection.outlook.com [52.101.56.25])
	by m0384305.ppops.net (PPS) with ESMTPS id 4h10s251qq-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 30 Sep 2026 21:41:43 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fHjwDzfPUYtBh4Vb/p3gIqxhqonivGnJ6TKi1NnrxoHi9uEAGmBb1Lg/YqrxlJpxGyjzwxjqCP8O/RsWfOkBN8rIQznyooE+trFnm2mvxfk838eTBGtLVvLhw+tsVvf5zO+HxkVBeqXz790hxtLIvUH3TaccJ1S+3kS90zVwKZ2FSHfd8fW2SfcoxMsEWqr72T/0+oL3d9O08Z9wbgS07hR3yHv/Zk4aSJv/CBVtwQLhuaRdiVy3nPpsxTYdKBtTvxEBmTEp6jdLa/CcDYBCvY67/8XZ+JQ+bBnly4LLdRgMf0edRRarA9sjDdsSdwLRHkwWIqUDb4AshvkGzG+i6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Z/K/1cquz5Ku9UCAwqyMcqAOxKrE0k4IwYNdwOIyJo=;
 b=Onz9sEHte5aoefoIyLy8fn7CTzu+f9WVoj4ivzDZ/QRpaujIRyGLiFEjftK5d4WQTV+3FlmKm6FJQweQKw23zouBpHoFZL6ohCULWy2Hwe/lnA9v71nsOktYjL3dCxrIxKV/MkD4eKLWC/f9CxKeYcePTDT4uek1m08BqMhN7ItGmD1K0/8EwbXyRVri6yR/cQCjW6XWy1od2/jB8cd0WQl5DPUyI5Vq0RmJ59Fh6xhg7/18GLqAXk+NMUWIfCRbV70EWejh4vGL1tB7Fdu1QkJptQNUOwvA49azBy63kFeqAt93FMmq+Ga4p8mxcWxAFcZNv4Kaq38w0PTbHSJo0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Z/K/1cquz5Ku9UCAwqyMcqAOxKrE0k4IwYNdwOIyJo=;
 b=TyBreNCNUA519eXQ5pPhxaTklLNFejlTRybYS2m0uBFHsmytNUqw/RgnU9ZvxPNlGC44NZVBJDVJUsEeidi9qmNJjPAeKNdiArzjg5evD+Zb4QCq50srsPZmYiQFdcBmOK0lQNyAiXhxwrtTb+rqZleunJIeOqVvmpz3xuWHqy8=
Received: from MW4P220CA0003.NAMP220.PROD.OUTLOOK.COM (2603:10b6:303:115::8)
 by CH0PR10MB4857.namprd10.prod.outlook.com (2603:10b6:610:c2::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.9; Thu, 1 Oct 2026
 02:41:40 +0000
Received: from SJ1PEPF000037A3.namprd04.prod.outlook.com
 (2603:10b6:303:115:cafe::84) by MW4P220CA0003.outlook.office365.com
 (2603:10b6:303:115::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.15 via Frontend Transport; Thu, 1
 Oct 2026 02:41:39 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ1PEPF000037A3.mail.protection.outlook.com (10.167.244.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Thu, 1 Oct 2026 02:41:38 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 21:41:05 -0500
Received: from DFLE211.ent.ti.com (10.64.6.69) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 21:41:05 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 30 Sep 2026 21:41:05 -0500
Received: from LT5CG31242FY.dhcp.ti.com ([10.250.163.101])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6912esJc109828;
	Wed, 30 Sep 2026 21:41:02 -0500
From: Shenghao Ding <shenghao-ding@ti.com>
To: <broonie@kernel.org>
CC: <tiwai@suse.de>, <13916275206@139.com>, <perex@perex.cz>,
        <lgirdwood@gmail.com>, <linux-sound@vger.kernel.org>,
        <baojun.xu@ti.com>, <k-lu@ti.com>,
        Shenghao Ding <shenghao-ding@ti.com>
Subject: [PATCH v1] ASoC: tas2781: Refactor register error log with unified macro
Date: Thu, 1 Oct 2026 10:40:49 +0800
Message-ID: <20261001024049.93-2-shenghao-ding@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
In-Reply-To: <20261001024049.93-1-shenghao-ding@ti.com>
References: <20261001024049.93-1-shenghao-ding@ti.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000037A3:EE_|CH0PR10MB4857:EE_
X-MS-Office365-Filtering-Correlation-Id: 8acc3cb3-ad7b-4e31-9c2b-08df1f658463
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|1800799024|376014|82310400026|22082099003|18002099003|6133799003|10067099003|260925022911599003|260925021911599003|260925021311599003|56012099006;
X-Microsoft-Antispam-Message-Info:
	grrY3v6m1KcyxnvsM0CUFctfbsEwDAo8OkbBHeJ062z56K/jZBhwyWM3VZXN7xavZyPzalZ7lwHVaabyjAaaDQ5Ve+iusycEpg1Y6hMNunBwuacz02JLPES5IaCUmymDwivpG/S9z6cUnoBolHT/ComRwr9zkAZrRYg4TQ7J4koQXoYBk7k1ONg4qTBtyxVI9k9qGWyXtUeOCntU1B3pyWPmWFn/nSy61eTKlI7lkNDaC3OXe7QCixXNsUbM7GF3nGnp09salmRoq+ubjF3pdN5ivr/nbdXu5xzs3kGU2ZAGUJ5na03UZlLzRevLYddfxXU8QOPPPicexVWzOYo/pnEJVXySfhwvWk51Z/qkSotTp7I1Tmpauf0HMMd8lwpr6Vz7w2lSwn32lCE7kyBnSB2+uzE3tAvQxS645Q5cwjx9YlFRglcHYtkZO7J597y70lYF+dHf6eVNsQHKzBfpA/ur+cNFUDVfYyvdXEClNVJzspHo3urWUn8xQcmLr2Flr9x2rKxdMm3suqte84JUnBaTolF8TQZP+TyLAtvv08uq9z0ccyXcmMoe+BIaNgJabmDFNqKuTPCLrIOnPF9tTDCFBSF9dqgNyHIc4FxP4jjWEN3xmGzCsajtrFnnX8VtOLgqaHoTyRco8YpSdwP7ePgYuPOzpZDR3IidS7TBnE5Az0HbASMxizz6fMhmslXxzCvc5hovKAD+ggiFOTRHdQ==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(1800799024)(376014)(82310400026)(22082099003)(18002099003)(6133799003)(10067099003)(260925022911599003)(260925021911599003)(260925021311599003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	43qI81bcX2hjAD7FslEvs9xwEKbuQQG2H5hu1FWqkOhKUn9nPYbwvLIWa6fjKmw/3qGfnDlBpmQji9G4vtyvFbzmJZtxrWheO+r5RoT44EiU1eN9jZUcTW7qW1n9JlcXME6SkBeUZFXloZnHVHeCnZ7leCvGplVMTK0um62fpzBnakrOcVaPafOkQOVxEa1XrUEO0VTIU03FvAO8xNyFlWzL4GL3ObNYZmVSNBs8xrtgGskhuTOEB1TWcQct3L5NFYq5ESvUOD4EG4cktd2JpBcMZsdmeK193Pge1LUN4gerwr3sB1zodZmzuwjzWwuK18t/dPJV/YSS+wT9NiWs77x9TyrdhIvyQuMH25n2EgLjCXzvCGZI6YSOnbM3DLe32aUrTGR12QMyVZoDiXpbNrp0gPatk9sSVvoNNPFKd9slsovS4pnOLcibImZSvyrk
X-Exchange-RoutingPolicyChecked:
	MxlIa2J0uSakyJb9gjo4U2syi8x9p905R3pU4icfhSJu6ywC1U36w7JKAnQZeYggZdNveN70ahbC4NJyWjt9SsDxDHn4VIfO/KyWkyveQVL8zFhh8ovPIMCUr4Bo+Dv0N+VIi9FQWfX3arwuk8S5xl0t5zkkNKLhxdzl1NSKnE5vlRqooKtG/nX2TVI4cloeYtAjC0/v9KxihUwrTqBclu/9mqALWM6hgD+GUJgsuXeLqWAqJJMobGHn6f1GZto49JLstgli11m7rKeEk3hCIBGSJDBgBx815YDbkfzBCKj6lwn01cvYFHKDINkUKJeAm8lXsi+0Tl9PKdDm202l3w==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 02:41:38.1889
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8acc3cb3-ad7b-4e31-9c2b-08df1f658463
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000037A3.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB4857
X-Proofpoint-GUID: RrSV76A70xO-yTRu6Sqc47ZHhq3HJI69
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAxMCBTYWx0ZWRfXzDOWPBTz2EgX
 pFrocJzAUuHtylgG+KIHqhMgcYLN2ds6WI9/abwve4XMzEHUGD4HvPdBU2cOqHGJDAax0mCXQhs
 lZrORJAKY6XYWeUg56MHuE4Qfz0DKiv6CHRxfPZYJ+L0Uvfmp5hAS5ybQxKjeNHEB+TJQ9RTBsR
 Wq7zHoXBXzBhnDwkZyBU2RqKbvivBIq5bYGddQ1dZ7/fzK0bBi6afjpB20sA8TObG8Nq7BVZzJ5
 4Bt1PadBZ4Zd012LtmoAjGOmW+fPPEk/Q0Z/gLCmxmZmceFjll/nAi8MtvTcDnkMCoSLh47+3le
 eQD3yTaVM+PIIe+tTVOGTBZ+C9bC5kTlPRKYt3eZiL1bZaJqY4fB47sA/NhkPUJJDhFh5yAoOA2
 VUxI5Za6IVnA4xTWwwvFVvMTAoDmmSY3kvY3UNdxdQ1No+xn0JuYEP1chegeTZQHvcdhWN9T4Gs
 uz06QGDkPaUWkh3yG0w==
X-Proofpoint-ORIG-GUID: RrSV76A70xO-yTRu6Sqc47ZHhq3HJI69
X-Authority-Analysis: v=2.4 cv=G6aJgNk5 c=1 sm=1 tr=0 ts=6abdc867 cx=c_pps
 a=I+0PaAUBL5uRonxG4DgGUw==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=AlMIdn_sM9wA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22
 a=sozttTNsAAAA:8 a=tVIhMUhEnUZ9XWfNHXUA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAxMCBTYWx0ZWRfX+RBMJhlhcWsS
 icgBjQvAydzGhV/8iAg4jzkzWOplfopGCRYfBYhI09ikrmgw7rDOadcTn7cHw+8gk9RQCeFKlz1
 jNm+RyTrrdVBuu0Uf3Y67O9dzb5YRME=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010010

Add reusable TAS_REG_ERR_LOG macro in tas2781 header, replace all
duplicated error logging code in register read/write/bulk ops and
update_bits functions. Add channel ID to error log for better debuggability.

Signed-off-by: Shenghao Ding <shenghao-ding@ti.com>
---
 include/sound/tas2781.h               |  7 +++++++
 sound/soc/codecs/tas2781-comlib-i2c.c |  5 +----
 sound/soc/codecs/tas2781-comlib.c     | 20 ++++----------------
 3 files changed, 12 insertions(+), 20 deletions(-)

diff --git a/include/sound/tas2781.h b/include/sound/tas2781.h
index 7367c76959aa..f4275226366d 100644
--- a/include/sound/tas2781.h
+++ b/include/sound/tas2781.h
@@ -49,6 +49,13 @@
 #define TASDEVICE_REG(book, page, reg)	(((book * 256 * 128) + \
 					(page * 128)) + reg)
 
+#define TAS_REG_ERR_LOG(dev, chn, reg, ret) \
+	dev_err((dev), "%s, C%uBx%02xPx%02xRx%02x E=%d\n", \
+		__func__, chn, TASDEVICE_BOOK_ID(reg), \
+		TASDEVICE_PAGE_ID(reg), \
+		TASDEVICE_PAGE_REG(reg), \
+		(ret))
+
 /* Software Reset, compatble with new device (TAS5825). */
 #define TASDEVICE_REG_SWRESET		TASDEVICE_REG(0x0, 0x0, 0x01)
 #define TASDEVICE_REG_SWRESET_RESET	BIT(0)
diff --git a/sound/soc/codecs/tas2781-comlib-i2c.c b/sound/soc/codecs/tas2781-comlib-i2c.c
index dd86fc90a7d0..46777be765ef 100644
--- a/sound/soc/codecs/tas2781-comlib-i2c.c
+++ b/sound/soc/codecs/tas2781-comlib-i2c.c
@@ -131,10 +131,7 @@ int tasdevice_dev_update_bits(
 		ret = regmap_update_bits(map, TASDEVICE_PGRG(reg),
 			mask, value);
 		if (ret < 0)
-			dev_err(tas_priv->dev, "%s, Bx%02xPx%02xRx%02x E=%d\n",
-				__func__, TASDEVICE_BOOK_ID(reg),
-				TASDEVICE_PAGE_ID(reg),
-				TASDEVICE_PAGE_REG(reg), ret);
+			TAS_REG_ERR_LOG(tas_priv->dev, chn, reg, ret);
 	} else {
 		dev_err(tas_priv->dev, "%s, no such channel(%d)\n", __func__,
 			chn);
diff --git a/sound/soc/codecs/tas2781-comlib.c b/sound/soc/codecs/tas2781-comlib.c
index e4c8a04a9187..58e19d6d1f75 100644
--- a/sound/soc/codecs/tas2781-comlib.c
+++ b/sound/soc/codecs/tas2781-comlib.c
@@ -34,10 +34,7 @@ int tasdevice_dev_read(struct tasdevice_priv *tas_priv,
 
 		ret = regmap_read(map, TASDEVICE_PGRG(reg), val);
 		if (ret < 0)
-			dev_err(tas_priv->dev, "%s, Bx%02xPx%02xRx%02x E=%d\n",
-				__func__, TASDEVICE_BOOK_ID(reg),
-				TASDEVICE_PAGE_ID(reg),
-				TASDEVICE_PAGE_REG(reg), ret);
+			TAS_REG_ERR_LOG(tas_priv->dev, chn, reg, ret);
 	} else {
 		ret = -EINVAL;
 		dev_err(tas_priv->dev, "%s, no such channel(%d)\n", __func__,
@@ -65,10 +62,7 @@ int tasdevice_dev_bulk_read(struct tasdevice_priv *tas_priv,
 
 		ret = regmap_bulk_read(map, TASDEVICE_PGRG(reg), data, len);
 		if (ret < 0)
-			dev_err(tas_priv->dev, "%s, Bx%02xPx%02xRx%02x E=%d\n",
-				__func__, TASDEVICE_BOOK_ID(reg),
-				TASDEVICE_PAGE_ID(reg),
-				TASDEVICE_PAGE_REG(reg), ret);
+			TAS_REG_ERR_LOG(tas_priv->dev, chn, reg, ret);
 	} else
 		dev_err(tas_priv->dev, "%s, no such channel(%d)\n", __func__,
 			chn);
@@ -94,10 +88,7 @@ int tasdevice_dev_write(struct tasdevice_priv *tas_priv,
 		ret = regmap_write(map, TASDEVICE_PGRG(reg),
 			value);
 		if (ret < 0)
-			dev_err(tas_priv->dev, "%s, Bx%02xPx%02xRx%02x E=%d\n",
-				__func__, TASDEVICE_BOOK_ID(reg),
-				TASDEVICE_PAGE_ID(reg),
-				TASDEVICE_PAGE_REG(reg), ret);
+			TAS_REG_ERR_LOG(tas_priv->dev, chn, reg, ret);
 	} else {
 		ret = -EINVAL;
 		dev_err(tas_priv->dev, "%s, no such channel(%d)\n", __func__,
@@ -127,10 +118,7 @@ int tasdevice_dev_bulk_write(
 		ret = regmap_bulk_write(map, TASDEVICE_PGRG(reg),
 			data, len);
 		if (ret < 0)
-			dev_err(tas_priv->dev, "%s, Bx%02xPx%02xRx%02x E=%d\n",
-				__func__, TASDEVICE_BOOK_ID(reg),
-				TASDEVICE_PAGE_ID(reg),
-				TASDEVICE_PAGE_REG(reg), ret);
+			TAS_REG_ERR_LOG(tas_priv->dev, chn, reg, ret);
 	} else {
 		ret = -EINVAL;
 		dev_err(tas_priv->dev, "%s, no such channel(%d)\n", __func__,
-- 
2.43.0

