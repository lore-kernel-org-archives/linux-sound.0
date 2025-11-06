Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4786730FF34
	for <linux-sound@vger.kernel.org>; Thu,  6 Nov 2025 11:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762429499; cv=fail; b=RxByTljTAVtRI3erlxoCbHzZTaRMVXu1h4dllDLZCar8TNduG4d5FNK7oB/2Ofjk27duiY2blg27YJ8kOP2a35o5Dn34ZPKgHTKI1qyaC1cwXWGTfq2KP0RvOICwVJEbtjwiQtFMh9slpkN+4p1eurgphWHeEdJ+ER2ubCBLHC0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762429499; c=relaxed/simple;
	bh=JqL27+Ak6NLfW4uxV6ccgG9yS8OX+eD3IDd4O0vEetU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DVFvp+CMVhm/lSpfNgXa/gaKl60lhmN1L4tQUWgezfOT2QLzmbSXi1DlbioPqBPpc3qnqpXbLYe3vGo6jlENC8RqCgVhWa8n8cAmp5UvjPK42LebnIB7xWi5Fpqg/WK3o5d33vZAV/Z3+3Qmu07IytVQEzuJ/C6jt7R80wkmZ6U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=NT+cqJV8; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=EBZ+tUsC; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="NT+cqJV8";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="EBZ+tUsC"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A65oYv91489066;
	Thu, 6 Nov 2025 05:44:34 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=d5ZnJI3vP8EI0PFFLecCkjRQUKR/jVopgPq1NDGo6QM=; b=
	NT+cqJV8o++/Y4zQtA1pLx5wP5H2ZtwRZWYTyLZ+MldhhnPQkF5ji/2OY0fW8lUs
	fuHn0p7Lc9iVD8K91ylzEn7PglaZAn5rqOKXt9ZF+0Q/pgDr1FmMJqFeVyG1TqpU
	Qr0hxNIwK4MTkRyC+ltc7W2hroks565wqCEykZO32WCdZmv5Ud5ojKWG+EuzEMgI
	fidAHS7T0jPKmzW6sEb4nvTdbmctnfZI7x1H1+tMiB5zjgzhkhpRTF3OUUwIDcbw
	8hEiKRAQkveuAEyrX3DDFXQsEPsR5R24XmCZ6EN4LZiidUfMt4LMShu+/8n1LONS
	0YlCvQbDQC4yD+XB54sJ6w==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11022074.outbound.protection.outlook.com [52.101.43.74])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4a783wun4n-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 06 Nov 2025 05:44:34 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gveoGyPwGxt6+i5JRjtMJaFrs46iPtWbBjfU4qZoKKdQDsWz4/BhcmXQoY6K6LnqY53HsCRxAah9Lt5rD+PjFtS2/eIT8rePaTaMxHUHtATc1F//oajLMQUYt0jfmFVjANZshgek/gcmKZD+KNjAFafBqwduRQRHo98IqZ+hnpD09n+kTnSS8QPIKOPSpbj9M+cd7y6ep0ADvdVzNnvYGkH0j3L6VIio+HvkyU5KB+NkveWBEaOf+VdWIzCoid5kP/r4BrD2QMPY6IE8PqT/HRAEhG+IjPD1hvHRoP8f3C+uc/wY8X3qWvS+gN6I938PYGl5qkRjgswpkGF7hFjnzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d5ZnJI3vP8EI0PFFLecCkjRQUKR/jVopgPq1NDGo6QM=;
 b=GRClxHa5hYMUEn8dPUta6HYjN6SMGuqhfhI+pZU9dv+JzNx7Zdu0CugsFL+7mnwHvE/48KPgQutgZ91m5ajnsbpcFtpJov3PLaIIduu4DDuadm+vdAVei2zhQKHTglmdjXMXZUvbDg/NDtF00VY7ERJS8R7X9RKTyXdxwTkhERm5xpX/9wBiHKAojxq2+va6TRahclfjbszuLGDz9fVpaXyR0ykaop50ObTJ7xTrY8Qemi0VF+ch8BbcaoiKfc8fohI1GJ9ZIrIkVDLZalTrKTwskT5FBlATYl/vyHZlyC015I2MIaL9NisMtMLWGvLfsf7Et3GWk1lWbRlzX3jAMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d5ZnJI3vP8EI0PFFLecCkjRQUKR/jVopgPq1NDGo6QM=;
 b=EBZ+tUsC5GdizVASDdvEh+4JhD6YK3CrYeGsNvrIVp22K6c/iKD7vIpF4d7WbuKRQmBH2mHMFxZKKbCZCS3giGzwWYn6wlU0qoyMLNWRcciBqpPZRxXWTWrKOLY7w99zpQ00rIx0p308WwxDHtc4+gE6RRpejeEq5jGs8FabOV4=
Received: from BYAPR02CA0030.namprd02.prod.outlook.com (2603:10b6:a02:ee::43)
 by DM4PR19MB7881.namprd19.prod.outlook.com (2603:10b6:8:17e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Thu, 6 Nov
 2025 11:44:31 +0000
Received: from SJ1PEPF00002323.namprd03.prod.outlook.com
 (2603:10b6:a02:ee:cafe::a7) by BYAPR02CA0030.outlook.office365.com
 (2603:10b6:a02:ee::43) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.12 via Frontend Transport; Thu,
 6 Nov 2025 11:44:30 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF00002323.mail.protection.outlook.com (10.167.242.85) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.6
 via Frontend Transport; Thu, 6 Nov 2025 11:44:29 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 0B31A406558;
	Thu,  6 Nov 2025 11:44:26 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id D1643822549;
	Thu,  6 Nov 2025 11:44:25 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: vkoul@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        shumingf@realtek.com, lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v3 07/13] ASoC: SDCA: Use helper macros for control identification
Date: Thu,  6 Nov 2025 11:44:16 +0000
Message-ID: <20251106114422.906370-8-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251106114422.906370-1-ckeepax@opensource.cirrus.com>
References: <20251106114422.906370-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002323:EE_|DM4PR19MB7881:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: fe9ea0e8-0ce1-4b97-19a7-08de1d29d8da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|61400799027|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?iRPzDv+XdMP5lIdy8CInMvddBi36v5rj6wsgPYH8qk3u9fCX/7Ok7NjjE0ck?=
 =?us-ascii?Q?N4Bakw9IPeAihHBK1AurL6MbBIX3ZEwBa2SRzLSITYXjy4lMhBJfxo9nK+qa?=
 =?us-ascii?Q?t0pUiiX6A5rpaxVxqJdTBm47qYH1XixnIdXBL69LiWFJ6ypp9fdIu5UVQQty?=
 =?us-ascii?Q?+CQGgvPXRqofx4DPwjiNtxyl7M7Qw3W6xGQAOoRRXDnKkh6e8aLaMNUPdldq?=
 =?us-ascii?Q?4FkG/KY2I1SWV9eBooQRzNxoRwWisP8mRb5xgeBQbJUoAoaAyzZXCnyxp8KM?=
 =?us-ascii?Q?Hb/mIk3Y67sJauM1t5vAl+q/Q5kO3YNXL3bUoNzfIADNTY/UHhdjvqsmBRzX?=
 =?us-ascii?Q?JB4VWHiIEzqsVA7i8nbZ6JJv6eX/yvfGg2VTzDCh4cRrwRzk+RdDZGTY+btJ?=
 =?us-ascii?Q?3HBB2K/0nR99ejbAnDpnHg4YO8K5fsk9i+DZ1TRnGwTZ/Ta8MHkeHbK3kg+c?=
 =?us-ascii?Q?NqlK/Zcrj2bBtGkbI5Nt43sRBqBzJp51lNuy5oiOc4lz2h8w3PbRyOC/WYsX?=
 =?us-ascii?Q?S/y1Rxm1XyJTMc6G0Eqg65hPrdb1Mpt57uz7KdTVsjpM7F8qjWMNMb5DfFmC?=
 =?us-ascii?Q?6U2mhMa9HwFLPK+DL3B8hYelw4W9uGTz8vAKkkDy6OzOFM5qSNfIli4aMxf7?=
 =?us-ascii?Q?EdB5F5Sh3xLjyumeyhViv8h+fzTka+R5TyaWYLrqoO4daxex+nwk0aYIWOgv?=
 =?us-ascii?Q?kOtpDKHelD7UaGXSXxwpWlUBQMah7K5az7lnKXlC8iTBKwXWqFpxUaqhXMJe?=
 =?us-ascii?Q?jz3FXkiw29MYPNEfEa+WrjTmvY0Snq5Z7Gb6Wq2mfC/VQU2XzD5xZncz8a9W?=
 =?us-ascii?Q?G5crPM6x6/IU65+2uspc3+aTpJdtqX2ZO5y8AxB1R9OLZlc61KpF/YAUyTVn?=
 =?us-ascii?Q?ORf06AUsfxtkVOWO16p/LlXtkMyfP7Ec02g5YzRWG6J4mOF8OK5I8vlWZSpp?=
 =?us-ascii?Q?HaCg8ICD1cvM7DMLIihBvOySOefT/sRiBU6DixjjzOPygXcgYJbLi1x0vRRy?=
 =?us-ascii?Q?h8WC93Jh9jXzU1M7D+/68WYtBcuVvULd7TcOOJg20L/GHEwCqohhdEnhAsbc?=
 =?us-ascii?Q?Wg8f3VLHCQLoZxfXiGMmZ8+tfymaPpa9tgXV6XeF+dZN30/6H/sw2VDsMgYf?=
 =?us-ascii?Q?ovVkhUBubB3+NvSQtQ2Q5RCTUpoi0ocaEc+prp3UmM4hYXMX/9Ep3eUBC5Vp?=
 =?us-ascii?Q?yRNjSo0TDBsS9MG5IK91QnvQstPPRqU7Ax2B3g2kA6pYdKKr8SjSFzjSIh65?=
 =?us-ascii?Q?9IjAYKl0zcJfrUrQN8yz+n9V0F6yuDaH0j9gcbuZgbhZZn1OruCG6ZEqXak1?=
 =?us-ascii?Q?lW0bg/7B+POO7bdwXQ/MgmNcXlzjc4mHrPzTJzgdlyBfLMKLEyGm3r+6sPu6?=
 =?us-ascii?Q?Y9zk/MMDACBRN7WtxmKEm98xKFTKzSw/vjeteVrffUhpqOmCRaPPBhy00mI2?=
 =?us-ascii?Q?ORr0NVgm/3iDP7/0L2rfsr7tE4eHgHDA4QoPgOUicVPqTXbgP99fenrClsgy?=
 =?us-ascii?Q?xDlxYXRy+fuCcM/Wtvx4F55hXTFCFpt/kO8TRu0+ZKogl3Yw2nL+P5Vna9j3?=
 =?us-ascii?Q?PXGzJW4kIL4bna3S7nk=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(61400799027)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 11:44:29.8821
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fe9ea0e8-0ce1-4b97-19a7-08de1d29d8da
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ1PEPF00002323.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR19MB7881
X-Proofpoint-GUID: 9yZNNvh2MbZ_sdwErLbWcAx4UmWqE7Hx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA2MDA5MiBTYWx0ZWRfX2Cr/aIdcKS4w
 8rKXoc+77vGSdA7WoAQ6pJltmuSU6gk4i47wFYTpZW1nVPEZCGd6e9MlJqDT64idBsp3Ek8/Raf
 Xf4ObkhiUm9o3yRXeBC+AQJIlNwboqanbtTL2llgvZ9ciudPtzfgP3s8aoEs7rCUbXvvjRW2pgh
 RSan34QFVYOZD+su6TzAkjhsyGi43EpZ5bMepo2cPtspKhfJVuI9iR15j+Mmgh4tT4sdmtoPbzu
 cvovQhyD16XxsTmYv6mOD9m1CPCNI4hJhEihTfAQGk9Lwn8q5QIGC0joOpY+o2OngClg/Ng2LQg
 N+EDr1G2xosrFUFGAach1OdeAvbljLb9+KlgpCddOqysWX20sp9ZrMo/fsBo0CZ+G/I07Pb+CTY
 ry4q5xHGiIxMUvtopwUpTH1V1xTOHg==
X-Proofpoint-ORIG-GUID: 9yZNNvh2MbZ_sdwErLbWcAx4UmWqE7Hx
X-Authority-Analysis: v=2.4 cv=b9G/I9Gx c=1 sm=1 tr=0 ts=690c8a22 cx=c_pps
 a=EjCBFqPm7gL+SGkxwm0cEw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=6UeiqGixMTsA:10 a=RWc_ulEos4gA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=w1d2syhTAAAA:8 a=nQC4CdCC1Wy_cx0jZ8cA:9 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Spam-Reason: safe

We have the SDCA_CTL_TYPE helper macros, we should use them when
identifying specific controls to simplify the code a little.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No changes since v2.

 sound/soc/sdca/sdca_interrupts.c | 36 +++++++++++++-------------------
 1 file changed, 14 insertions(+), 22 deletions(-)

diff --git a/sound/soc/sdca/sdca_interrupts.c b/sound/soc/sdca/sdca_interrupts.c
index a18ec9dd3398b..8f6a2adfb6fbe 100644
--- a/sound/soc/sdca/sdca_interrupts.c
+++ b/sound/soc/sdca/sdca_interrupts.c
@@ -456,11 +456,8 @@ int sdca_irq_populate_early(struct device *dev, struct regmap *regmap,
 			else if (!interrupt)
 				continue;
 
-			switch (entity->type) {
-			case SDCA_ENTITY_TYPE_XU:
-				if (control->sel != SDCA_CTL_XU_FDL_CURRENTOWNER)
-					break;
-
+			switch (SDCA_CTL_TYPE(entity->type, control->sel)) {
+			case SDCA_CTL_TYPE_S(XU, FDL_CURRENTOWNER):
 				ret = sdca_irq_data_populate(dev, regmap, NULL,
 							     function, entity,
 							     control, interrupt);
@@ -534,27 +531,22 @@ int sdca_irq_populate(struct sdca_function_data *function,
 
 			handler = base_handler;
 
-			switch (entity->type) {
-			case SDCA_ENTITY_TYPE_ENTITY_0:
-				if (control->sel == SDCA_CTL_ENTITY_0_FUNCTION_STATUS)
-					handler = function_status_handler;
+			switch (SDCA_CTL_TYPE(entity->type, control->sel)) {
+			case SDCA_CTL_TYPE_S(ENTITY_0, FUNCTION_STATUS):
+				handler = function_status_handler;
 				break;
-			case SDCA_ENTITY_TYPE_GE:
-				if (control->sel == SDCA_CTL_GE_DETECTED_MODE)
-					handler = detected_mode_handler;
+			case SDCA_CTL_TYPE_S(GE, DETECTED_MODE):
+				handler = detected_mode_handler;
 				break;
-			case SDCA_ENTITY_TYPE_XU:
-				if (control->sel == SDCA_CTL_XU_FDL_CURRENTOWNER) {
-					ret = sdca_fdl_alloc_state(interrupt);
-					if (ret)
-						return ret;
+			case SDCA_CTL_TYPE_S(XU, FDL_CURRENTOWNER):
+				ret = sdca_fdl_alloc_state(interrupt);
+				if (ret)
+					return ret;
 
-					handler = fdl_owner_handler;
-				}
+				handler = fdl_owner_handler;
 				break;
-			case SDCA_ENTITY_TYPE_HIDE:
-				if (control->sel == SDCA_CTL_HIDE_HIDTX_CURRENTOWNER)
-					handler = hid_handler;
+			case SDCA_CTL_TYPE_S(HIDE, HIDTX_CURRENTOWNER):
+				handler = hid_handler;
 				break;
 			default:
 				break;
-- 
2.47.3

