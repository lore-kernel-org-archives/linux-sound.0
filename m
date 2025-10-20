Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 213CC2773F4
	for <linux-sound@vger.kernel.org>; Mon, 20 Oct 2025 15:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760975859; cv=fail; b=h4uvUoOEIDMfMuCU05J7XepHgYcGnz7RuVOBLM5qvch0dQb/Nb9iKEZZ48qhW8mDXHaSdPbp9hWjygildf9u9iuEzt+g88V1uL5qzcXBBriELanMANRSPBZ7YS9Y3BcznGlDNoQoU/r/avYF3CjqDZszcBE8zqvvkVkKZ8VyQgY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760975859; c=relaxed/simple;
	bh=x+LOlTZpno5OvC6APUAPhq8Z7aiDPXS5iLbooY1VVgk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ov+mVyXqFR4lh2emCfnBZcSuSO9wH2OvVRmjZEWI8RkLAumVpJOIGvRIeZHnFQZfY63fPqyKNXwcPI7f4YeIaMRZNDkkvcrI96LkZ5gLFQ2gPTzOzg6WF5Gc6yES0+8zEU2SQWiAgkhGiWDUYTy8QKihOfLvm2VY94EcIHF76nU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=O5mFtZvY; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=ncJ7r4nv; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="O5mFtZvY";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="ncJ7r4nv"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59KEAolm3745048;
	Mon, 20 Oct 2025 10:55:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=UIrXm2LmHtBbufMKTI2W8F+JR1VtYQPET+0iPEJaUmE=; b=
	O5mFtZvYcPFWT+TujBOVy/1bkvkG3MbqJfF/b190LMlgl5Nnj5vWbTYHkkTsQxm7
	t4oOWmoX7t9OUlhuwyZjY2Aw3HzTXf4FEJZTAyFpwEI30J8PKSKcD3jhnevZVppa
	KJhm0w5ZWgWY1eEmI8MoHmGFm9QpqW01RYZxIOIJcCh4JlLXia48A10VM8B1Fkky
	UlpFRscRWcl/MvNfHNb3REAFDus01+6dJhdYSZoUzicImgWeP8hHsZOECCkiMi46
	N4zu6FlKDGJG154UxKIZTGnolLgisWlq+MRavv3a7Uu36TuTVTh0UjilVl0OgJcy
	d1lBaCI8r2+q0GpnNKtLhg==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11020110.outbound.protection.outlook.com [52.101.56.110])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 49wnc4r8da-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 20 Oct 2025 10:55:24 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fPaE7sMNjdCWUhT+PCdi+WDPsl2FNvO0EuTHy++WNlFgF30Qpx3C74CiYurDuwIBpyOztShN6x2ROhhtewaGxbMn8ZayHqK4/hPn206aFjmxFwFxPze4hi7TmhYLa2DU9OAP1LZpZ3CfMumUEAgaWFr8t9c/DLEC1CnWKiBVsriWsWjazB7IxIrzzp0inhtwD1TcUra07TP5sNRAabGQfIh6RBapqjbA4qHGWzi4NuOGtMn+1tySZJN8+hBkEPGw9ylSy22hK8eNxcHrXd9t7Mnvbhyk5zfYHXwxEYMrAI3btipeAxfhWiZaN1GQjyCNFHnJyO2i+zIYroGG3xk0ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UIrXm2LmHtBbufMKTI2W8F+JR1VtYQPET+0iPEJaUmE=;
 b=JG1f4zum457+Nvtx5J3TK8w2F4i4GsVfZOhk9iQ1Opoos2P4dGsVukuHBHOWIwbGUQtTSR2SWBuK163NuCM5R0QPnVLL0Dcno15s8plMnbUuMkSULCOyRZaREoZCh8gGCap9Z7W4umK2C3SeIYqQw1PKYqc/8ax+8rCIN8buP1msy2MDi2FUpoDwC+8QF+XreNC1h97btmj/rMniNQ4Bl60onBtSlroVttuYK7P29xCCARX36GAVKJZkIkn163UVd7ksNmY6HuVv9GFGJnpkxlIjLZRJJ9je83gUe/pDhK895C7vbGMCkzrYQU5nZBlhtoAZ59zxDBn+ykKMJp2UtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UIrXm2LmHtBbufMKTI2W8F+JR1VtYQPET+0iPEJaUmE=;
 b=ncJ7r4nvGUDXnfRDSM/dyhbmzQ6tnp4JIE5+19fV2TWBFZDtYklxOYpWIbrHczT6ExWUe8tm1WM8jcYwEWoA3Jres/cJEozVbWCEmRAsgGNiwOxq19018DJSp1B9C402Y3E8dS8GG9bFye9/W7fcD5OSo6Va7EZ7aqbzINTDDks=
Received: from BYAPR06CA0020.namprd06.prod.outlook.com (2603:10b6:a03:d4::33)
 by SA1PR19MB5229.namprd19.prod.outlook.com (2603:10b6:806:184::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Mon, 20 Oct
 2025 15:55:21 +0000
Received: from MWH0EPF000971E4.namprd02.prod.outlook.com
 (2603:10b6:a03:d4:cafe::91) by BYAPR06CA0020.outlook.office365.com
 (2603:10b6:a03:d4::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9228.17 via Frontend Transport; Mon,
 20 Oct 2025 15:55:20 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 MWH0EPF000971E4.mail.protection.outlook.com (10.167.243.72) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.7
 via Frontend Transport; Mon, 20 Oct 2025 15:55:18 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 4B5CC406555;
	Mon, 20 Oct 2025 15:55:17 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 38991820244;
	Mon, 20 Oct 2025 15:55:17 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        peter.ujfalusi@linux.intel.com, shumingf@realtek.com,
        lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v3 RESEND 04/19] ASoC: SDCA: Pass SoundWire slave to HID
Date: Mon, 20 Oct 2025 16:54:57 +0100
Message-ID: <20251020155512.353774-5-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251020155512.353774-1-ckeepax@opensource.cirrus.com>
References: <20251020155512.353774-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E4:EE_|SA1PR19MB5229:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: eda8a54c-8b07-44bf-08ae-08de0ff11191
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|61400799027|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?WLeH1eHZCLJHme9iIJ/iTtUIfj4LiDrvcRZWMxoKWrxCU1k8b+yrpTXQk/ln?=
 =?us-ascii?Q?dxoVkDalVTsHdcXzPnu/cQyXmptlNYFhvTMHNguUbBq9QOBwhdf9nIX7SgVB?=
 =?us-ascii?Q?Hcvfq0YBBJ+rj65rFNtE2bsvBm3HM0cRutGzRgoI7agrxoFfCKs4jBxr/pjb?=
 =?us-ascii?Q?72dFuGrvqKnnuNSbKUq3lVDNN5suuX5oPjFhLkYw4ubiMSmL0ardxgK/gNBU?=
 =?us-ascii?Q?teIF61c03TyJ9W9fvGtp3IYAu7jrbc1aEd8liAi9Bg9SM0SMVDQcrH7mkJQX?=
 =?us-ascii?Q?+f+RLgtmHrnaR6X11z0iKmQ8zOkjdWqbmUMIP89G/CeBgbiGsyL2lyQb3b4w?=
 =?us-ascii?Q?Vp0Uo+0ZU9cl5EWKUBbju8qfiqMu1g6EdmSbSiLuzJLxcBMcfk2KfB3x9Dac?=
 =?us-ascii?Q?/gzeNdPnH2XdTtSATBbSasfkR7+A48PKBKkPf08YGumIhmgGla3LgnnWHort?=
 =?us-ascii?Q?xd6olfE6RgU2wDwe0mf3VqT0+gxb//0Dc/sRaersgIKEssnRJnKh87DkT+tq?=
 =?us-ascii?Q?ToBMZFl59UzAHpkjirsg3a29744fDo2XIp2ahO/uw8L49OGM68Tx2c8TMxWQ?=
 =?us-ascii?Q?4ppAdUHv1Md0m5WdmIawKhuIT6mYKU8Pcm7imCtoTsmniMjjHXumNsmX3nVc?=
 =?us-ascii?Q?WCgRKCYvwRL62oHGDwFGYbIAdks60dTWQY8WD0hLxrvbwFNNcwgxbu5gcOB+?=
 =?us-ascii?Q?hQB7dYj3oCdXtCTuY7qNLQ6YTupTFuy4bHKAC2cbJOXIc3lgW3f2afdCZTKW?=
 =?us-ascii?Q?YX8wP77l7MLJ0EycdLKyL9ees+o1e8dXkxgOTrLbtl8iiPQ7Lj6QxYoeGV6O?=
 =?us-ascii?Q?09r0Evh1olYB/5RsPP59M4tC+u3awBdLTgglMaw6f6WTWqVAzJkqPfvH/Rwz?=
 =?us-ascii?Q?y30u7JV928kRm9Q1g3zwyfi1vwWU3BP02OQw/u+DccoVGBM2nBZ264RFBJle?=
 =?us-ascii?Q?M0SdF7WEpotMpakK/GFR91Hrx24iyL3pOFKmbkxDgJvsKuJleUQobMZx3fuf?=
 =?us-ascii?Q?cCGiTzVJB9JV0uv5gIlas09Q4sIZ2X7Y8r8gJ61QBWqD21icBnvfvaWjT3HC?=
 =?us-ascii?Q?cE6yadwBd32VaIV96K5Tooj2aWhO2sF9Z4t003NAJ/BmJff0afPh8A1WsntF?=
 =?us-ascii?Q?gqMhxrSjcM5H/chyCm/1WRUfY7mPlwz3NwSsHg/gnzBFn+icdzjMf4qGHcS9?=
 =?us-ascii?Q?xjkfm38aH6WsQYX1RR1kimOKQ6mVfeiWrLJE336fMFxUGkhF0vhKoMtrtCcn?=
 =?us-ascii?Q?7UDmQgP0Rc8FvK5OyvyZAu7JMl4/U2LiOCiuDXs0ZA5N8MHRFPiXvJk+oKB4?=
 =?us-ascii?Q?b/oKAhJ+/ICYGom5iqlFbMLGCdW/KzwShD6jljpAc/EBYyuTyZsQkHQVFswm?=
 =?us-ascii?Q?hSRZ1feqTR99q2+BeOswOQoOFjOcHU9DffVS6qOKR7Hc0pDBn+r5wyYeu8rD?=
 =?us-ascii?Q?28uys+IYazHQUebhydNhG5WrYqvfoWZL2Wobf6Vh1+bvEhsyQ8DKx/vMJSny?=
 =?us-ascii?Q?QWFpyLJNEXPIlxzasEpDhfnyiVj520OwxJNBeDYpktAGnrVc9i5zXOZ6snhh?=
 =?us-ascii?Q?d85YfRnEM2Ed03v/Who=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(61400799027)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2025 15:55:18.6291
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eda8a54c-8b07-44bf-08ae-08de0ff11191
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-MWH0EPF000971E4.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR19MB5229
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIwMDEzMSBTYWx0ZWRfX0f491u8IntvC
 dazvP2DuMlej5OkWKnz8oWRo92oXJfMMLbr25EHuhWe3qzghpn0y/DICDsxdMSNO+USUZMJx+IQ
 ClECaMpuV6zi4nVX1BTFt7ABSwZBOQmcFFJ4gMRMHj8JllK6k/veyQ24xwgcq9zIO6YMJpsvke+
 UYD0urmO7i6vq4HTe2yfzjxC+xQuc95W1on7aI0IkAEjQy+CDHpp5yRmPhh2cV02rMQkhYp9rTm
 CM15Xj5Ujcc7ffqcrw2Q9PLvy36+gl315vWqtak3+SBnlpuNVaMPipY4fiLGAP1GxrscBsEiMzr
 7NobhzFseYyPDS19xb5x9bi+b3Rges5smUjIdVwX2KOQ3ZLysD1w2FAxCa4LR23FQRFuWlNBPqc
 m0ZF9ZhZ0CP79SgjpLuA3fuhnETWKg==
X-Proofpoint-GUID: l4Pd7BrqWiu31HRUGNpmuAcAQqYOiHNa
X-Proofpoint-ORIG-GUID: l4Pd7BrqWiu31HRUGNpmuAcAQqYOiHNa
X-Authority-Analysis: v=2.4 cv=bf1mkePB c=1 sm=1 tr=0 ts=68f65b6c cx=c_pps
 a=HmZmHFuEDL3wSU7VNlSPig==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=x6icFKpwvdMA:10 a=RWc_ulEos4gA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=QyXUC8HyAAAA:8 a=w1d2syhTAAAA:8 a=--uAHVF7q1budoVWL4UA:9
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Spam-Reason: safe

The SDCA HID code can't assume that the struct device it is passed is
the SoundWire slave device. HID is represented by a Function in SDCA and
will thus likely be implemented by a child driver. Update the code to
explicitly pass in the SoundWire slave device.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No changes since v2.

 include/sound/sdca_function.h   |  2 +-
 include/sound/sdca_hid.h        |  8 ++++++--
 sound/soc/sdca/sdca_functions.c | 20 ++++++++++++--------
 sound/soc/sdca/sdca_hid.c       | 12 +++++-------
 4 files changed, 24 insertions(+), 18 deletions(-)

diff --git a/include/sound/sdca_function.h b/include/sound/sdca_function.h
index ea68856e4c8c4..51e12fcfc53cd 100644
--- a/include/sound/sdca_function.h
+++ b/include/sound/sdca_function.h
@@ -1332,7 +1332,7 @@ static inline u32 sdca_range_search(struct sdca_control_range *range,
 	return 0;
 }
 
-int sdca_parse_function(struct device *dev,
+int sdca_parse_function(struct device *dev, struct sdw_slave *sdw,
 			struct sdca_function_desc *desc,
 			struct sdca_function_data *function);
 
diff --git a/include/sound/sdca_hid.h b/include/sound/sdca_hid.h
index 8ab3e498884ef..3a155835e035e 100644
--- a/include/sound/sdca_hid.h
+++ b/include/sound/sdca_hid.h
@@ -12,10 +12,14 @@
 #include <linux/hid.h>
 
 #if IS_ENABLED(CONFIG_SND_SOC_SDCA_HID)
-int sdca_add_hid_device(struct device *dev, struct sdca_entity *entity);
+
+int sdca_add_hid_device(struct device *dev, struct sdw_slave *sdw,
+			struct sdca_entity *entity);
 
 #else
-static inline int sdca_add_hid_device(struct device *dev, struct sdca_entity *entity)
+
+static inline int sdca_add_hid_device(struct device *dev, struct sdw_slave *sdw,
+				      struct sdca_entity *entity)
 {
 	return 0;
 }
diff --git a/sound/soc/sdca/sdca_functions.c b/sound/soc/sdca/sdca_functions.c
index 5f76ff4345ff5..2d5d20e23e3c4 100644
--- a/sound/soc/sdca/sdca_functions.c
+++ b/sound/soc/sdca/sdca_functions.c
@@ -1253,7 +1253,8 @@ static int find_sdca_entity_ge(struct device *dev,
 }
 
 static int
-find_sdca_entity_hide(struct device *dev, struct fwnode_handle *function_node,
+find_sdca_entity_hide(struct device *dev, struct sdw_slave *sdw,
+		      struct fwnode_handle *function_node,
 		      struct fwnode_handle *entity_node, struct sdca_entity *entity)
 {
 	struct sdca_entity_hide *hide = &entity->hide;
@@ -1328,7 +1329,7 @@ find_sdca_entity_hide(struct device *dev, struct fwnode_handle *function_node,
 						      report_desc, nval);
 
 			/* add HID device */
-			ret = sdca_add_hid_device(dev, entity);
+			ret = sdca_add_hid_device(dev, sdw, entity);
 			if (ret) {
 				dev_err(dev, "%pfwP: failed to add HID device: %d\n", entity_node, ret);
 				return ret;
@@ -1339,7 +1340,7 @@ find_sdca_entity_hide(struct device *dev, struct fwnode_handle *function_node,
 	return 0;
 }
 
-static int find_sdca_entity(struct device *dev,
+static int find_sdca_entity(struct device *dev, struct sdw_slave *sdw,
 			    struct fwnode_handle *function_node,
 			    struct fwnode_handle *entity_node,
 			    struct sdca_entity *entity)
@@ -1381,7 +1382,8 @@ static int find_sdca_entity(struct device *dev,
 		ret = find_sdca_entity_ge(dev, entity_node, entity);
 		break;
 	case SDCA_ENTITY_TYPE_HIDE:
-		ret = find_sdca_entity_hide(dev, function_node, entity_node, entity);
+		ret = find_sdca_entity_hide(dev, sdw, function_node,
+					    entity_node, entity);
 		break;
 	default:
 		break;
@@ -1396,7 +1398,7 @@ static int find_sdca_entity(struct device *dev,
 	return 0;
 }
 
-static int find_sdca_entities(struct device *dev,
+static int find_sdca_entities(struct device *dev, struct sdw_slave *sdw,
 			      struct fwnode_handle *function_node,
 			      struct sdca_function_data *function)
 {
@@ -1448,7 +1450,8 @@ static int find_sdca_entities(struct device *dev,
 			return -EINVAL;
 		}
 
-		ret = find_sdca_entity(dev, function_node, entity_node, &entities[i]);
+		ret = find_sdca_entity(dev, sdw, function_node,
+				       entity_node, &entities[i]);
 		fwnode_handle_put(entity_node);
 		if (ret)
 			return ret;
@@ -1927,12 +1930,13 @@ static int find_sdca_clusters(struct device *dev,
 /**
  * sdca_parse_function - parse ACPI DisCo for a Function
  * @dev: Pointer to device against which function data will be allocated.
+ * @sdw: SoundWire slave device to be processed.
  * @function_desc: Pointer to the Function short descriptor.
  * @function: Pointer to the Function information, to be populated.
  *
  * Return: Returns 0 for success.
  */
-int sdca_parse_function(struct device *dev,
+int sdca_parse_function(struct device *dev, struct sdw_slave *sdw,
 			struct sdca_function_desc *function_desc,
 			struct sdca_function_data *function)
 {
@@ -1953,7 +1957,7 @@ int sdca_parse_function(struct device *dev,
 	if (ret)
 		return ret;
 
-	ret = find_sdca_entities(dev, function_desc->node, function);
+	ret = find_sdca_entities(dev, sdw, function_desc->node, function);
 	if (ret)
 		return ret;
 
diff --git a/sound/soc/sdca/sdca_hid.c b/sound/soc/sdca/sdca_hid.c
index 967f7ec6fb79d..53dad1a524d4b 100644
--- a/sound/soc/sdca/sdca_hid.c
+++ b/sound/soc/sdca/sdca_hid.c
@@ -82,15 +82,13 @@ static const struct hid_ll_driver sdw_hid_driver = {
 	.raw_request = sdwhid_raw_request,
 };
 
-int sdca_add_hid_device(struct device *dev, struct sdca_entity *entity)
+int sdca_add_hid_device(struct device *dev, struct sdw_slave *sdw,
+			struct sdca_entity *entity)
 {
-	struct sdw_bus *bus;
+	struct sdw_bus *bus = sdw->bus;
 	struct hid_device *hid;
-	struct sdw_slave *slave = dev_to_sdw_dev(dev);
 	int ret;
 
-	bus = slave->bus;
-
 	hid = hid_allocate_device();
 	if (IS_ERR(hid))
 		return PTR_ERR(hid);
@@ -103,8 +101,8 @@ int sdca_add_hid_device(struct device *dev, struct sdca_entity *entity)
 
 	snprintf(hid->name, sizeof(hid->name),
 		 "HID sdw:%01x:%01x:%04x:%04x:%02x",
-		 bus->controller_id, bus->link_id, slave->id.mfg_id,
-		 slave->id.part_id, slave->id.class_id);
+		 bus->controller_id, bus->link_id, sdw->id.mfg_id,
+		 sdw->id.part_id, sdw->id.class_id);
 
 	snprintf(hid->phys, sizeof(hid->phys), "%s", dev->bus->name);
 
-- 
2.47.3

