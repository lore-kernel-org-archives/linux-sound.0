Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD5E92798E8
	for <linux-sound@vger.kernel.org>; Mon, 20 Oct 2025 15:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760975756; cv=fail; b=RWE8hMInUIAHon8dLb6xL9acuAoRoQ90gS7uulsRylqS4Vyr0p9DHaiZSysA+geLr/diAjUEOb8ZxOtL0L1eyVOQk7d4575SXid0RI/tvuNDD5nrYj8vTxhj3aYSN+0QGMbs9GrTH7myV4+kX+UiksKoEQaloRGaZkQxCmaJeyI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760975756; c=relaxed/simple;
	bh=u+aQx3Q6eYEXODKXZ8Dkqxbsi7ObceKw7h2sc7OQiv0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XZaH7airI5RKzyL4Gz9y6rHQ0bzkZmr+DY/UtXGpsF2zOjA3FvMAJTdfFCDCaow2KEe481c8JxtJzL6Jj7GDffsaD+V7L1wNuy5yvhCJ6pewPsmgA41BIMvBEzYle5Ubwz4f2WRrl/qOk7Dyc9cb7I+O10bGrmNrtpN8mKLyVnw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=OVzWmDoR; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=FrKgKqfx; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="OVzWmDoR";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="FrKgKqfx"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59KEAeTm941384;
	Mon, 20 Oct 2025 10:55:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=qa4I7/eCwbr+SWnVE5cuyOaddKDSntMa4a3pSPoTaMI=; b=
	OVzWmDoRuPNHft7tgVuXWSTSDcdU2tpCTiFgtLUgcECwpzxgFtL3SHigxMBrlk4L
	NZkOFnMalPA62JZXWc2q72ZbTtjR9jRl73eIbFiRr7QiJWZ4ayhJnHZWIHe6cMrR
	UPFu8i9cw1+OJ0agm2MPHZIj+bW1QeHkMMDhRHSy7087qI7Ik+8/4jKO2gun88cH
	Rwt64eFcjHURkhpgjSsRjACXCUd2yxhwPc6v50TiDb1lpVw+JGpoBBgpDN3HnigG
	1cYdF+DUa57bBbPZI+CbjAqRcm1Lpfv70Fz9Yn7DN/zRD9EnrIk+l4OoavuoRKCw
	SRvUAfLrVWsoDWldLFkVHQ==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11020086.outbound.protection.outlook.com [52.101.56.86])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 49v7aj2aej-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 20 Oct 2025 10:55:24 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D/K9CcS2OoSwsrTCopZ9XreilisDFpHfd0WJg9VsghlX+pTDmfDxOqI9i67zwX8+TNTagmZT0RwbEgLirELhJ/AyG9mYOXa/YYx74aXbKJbRubVHOj4KIJRasskcu854eLAoiNyF9AsbQUpm3MIo7yAqgNnHdvIf1Gtu9v1Wr74m7YdlfshtHU6fwps54a5gC2WHrxzx187zksIUFptD6rJ8AvC3NOAbWjKRwrDoOpSEDeiY75m7BHNKVu5gBS7rm+QN+A0rkkQx6AdBGB6S4FwIkOIGkhmgEMBfSdUZMsBNfeIYauGuFbktuvPk8XPZdGok5H/w9mBb+m0x4xzxqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qa4I7/eCwbr+SWnVE5cuyOaddKDSntMa4a3pSPoTaMI=;
 b=ybEMOOTIaUfbJf/YIam5lbCYeubH6mUlSHg1HnR6sx0Fk/1OcOIdnwlXNICA/lB9nMnV2adgORi62eIRTWd9VTe/tzLLnjwAE9i9DsiVhmpLlwh4ZuA97jMOYR770wWiw3o03FCtDXGu9tiJww5KpwaoOfsPbB7sy7VlOxto5Ovglu/tpo2fu1cMMFjsKEnbNpA64q48I84T2Mk/NdJK3yyWu4Hk1atF2a5SOKmNOE7HWOwq41v27Cn+1G+/hSNaSAECqq0qkRa7ABtGqHscYBYPTbamX/hrxgcKnzrHQUlceS4+6Ugdriqb41TJCensAAKQPasCuORliilrhz7izQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qa4I7/eCwbr+SWnVE5cuyOaddKDSntMa4a3pSPoTaMI=;
 b=FrKgKqfxRe6DRAP1ZlDem8heZEWtIktvwNYIUBEP8n7fq3VXSO3ojnhDrO3DuiQjCU+5GZR92L5rFnwjKo4U/Oq+8kjKT5XpxTafhlXEe4a5eqTBPIV2M6O3kiqnOZfiAo0K+pHmDg6Fksm0KussfEycgHfLJid5fzY2Weh49lo=
Received: from PH7P220CA0162.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:33b::31)
 by LV2PR19MB5766.namprd19.prod.outlook.com (2603:10b6:408:179::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.18; Mon, 20 Oct
 2025 15:55:22 +0000
Received: from SN1PEPF000397B5.namprd05.prod.outlook.com
 (2603:10b6:510:33b:cafe::1) by PH7P220CA0162.outlook.office365.com
 (2603:10b6:510:33b::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9228.16 via Frontend Transport; Mon,
 20 Oct 2025 15:55:22 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SN1PEPF000397B5.mail.protection.outlook.com (10.167.248.59) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.7
 via Frontend Transport; Mon, 20 Oct 2025 15:55:21 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 625F3406559;
	Mon, 20 Oct 2025 15:55:17 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 48409822540;
	Mon, 20 Oct 2025 15:55:17 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        peter.ujfalusi@linux.intel.com, shumingf@realtek.com,
        lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v3 RESEND 05/19] ASoC: SDCA: Pass device register map from IRQ alloc to handlers
Date: Mon, 20 Oct 2025 16:54:58 +0100
Message-ID: <20251020155512.353774-6-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B5:EE_|LV2PR19MB5766:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 5b55bd37-9c3a-4c14-96cb-08de0ff11322
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|61400799027|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?SJWtnj6YdgJaSgAWtw0esxsRlPoRDNjtSVUnwpvjHRGQHgA4rwX9vy56/nVI?=
 =?us-ascii?Q?GHR1QN/lEmiXKuYPURJndD8txpOb27dqhcLVrx5ab/QYEofcEK7M/Kh/D7FG?=
 =?us-ascii?Q?RDpWMlRfXo1Jl+GwDL3pa8rxX8CcOV1hIL8AmscDTFH8Qql6F8cRhzjYtaOA?=
 =?us-ascii?Q?01FKCGv+0ZL44BCe28ENlsm3fwFWDcK0qTXUVm4XXmOCGjaOZpotSgbDz8TJ?=
 =?us-ascii?Q?WI2cp8JpZh6TCRdPq7ZMcUUi5kbwYIkuuT1Y3X0uPC32SHgYGo02fnV57BM+?=
 =?us-ascii?Q?T7+0cGxtKGojx10I6evZiEeVaLTi6VkJqAS4iMEbxu6LqTthr7aI1H+/uAlu?=
 =?us-ascii?Q?bR+V+KIT5Oi9Y77x6Qrx9cgXFJY5ym2NJOOhYdK021owIBBcfRWVYLdjYPzW?=
 =?us-ascii?Q?DN7uF1f3seP5+RSyeS3zjrAPLVR93Ej0qOpIkdxFg8UyK6KedRmyoooT64mU?=
 =?us-ascii?Q?Okl14X5+UPa1QJ6qBrQbyZJlCFk8S5UU1pHy+e6mywrtmivgK4anVx5N/3nB?=
 =?us-ascii?Q?750hCWushNw6RIxHPmq3h05SZggmYemk4YK4ew7mm54s1uNhp8FCU74vM5Wd?=
 =?us-ascii?Q?cdR0sXbOJCh11WpO/OYo4rK+Qzsma7Zu80dUpE7RKSazj2Q3Ke3pdAkKXMGw?=
 =?us-ascii?Q?jj1uHNrkeA4iMqSZ9+hRIMq5/iDQlK4i8rVCqPuNL5adQB9G9vIBTXuFvvE1?=
 =?us-ascii?Q?eckuCyzM/viS9C7+Ikfm7CpRB/cXdVV9PAlMScr24U9HkN/Hg+s24dhuvZDP?=
 =?us-ascii?Q?2D8V0BDPAlS3PYUBdw5ZgbBSd3wVE2Situk7yAwE6ca754Rg1SEQ7JmR+B83?=
 =?us-ascii?Q?/KBW91T6InGdF63noH4BwACm4uiuBsS+rqkh0VeaLE9sOgWawJ3PiJxaXlxq?=
 =?us-ascii?Q?Ni6RJu06t8XoZjZ8xY3Zq+wAsExRWH1YnR3qWm2MYxqwJ0OZOJH8awxrY0Zj?=
 =?us-ascii?Q?yF/h+BoOBAG7nSi83zPstJI/zq4KpdwFPNFj3V5VTVbvyn6+dxxWGfklaiJT?=
 =?us-ascii?Q?sBTpMs5MNmH6cWkA1x4V32QkaQR0TdTQBw+NN5M0EnnWJFkSSS26FIG8M6hJ?=
 =?us-ascii?Q?Nunh3tFMtFgajHr9zDQ4yh4kONRHaP32jSC7UKSVHRrS7Z2mwt+COAUZviIA?=
 =?us-ascii?Q?jFvaFK6hfZevdkXbZmXrZMqqLfPElpWLs6+HLUn99WnB263dTAuKFcL/9sON?=
 =?us-ascii?Q?AGgbdU/MAzBMAbur0u1MHTpxyMJvK57l6PGxP9jIgo++i4gOUZIrKKrlE62Q?=
 =?us-ascii?Q?U87DRCbiaRaRSGX/E1cSGWW7uL7blt78+Ut2HHu0lmIH2FX3qSZ7cUiO+A6P?=
 =?us-ascii?Q?lOfszIgJ/WUd59DrRs938oklKLvd6/cq022Xu/vwuMTm+Dx9XRmxMIdR4e8k?=
 =?us-ascii?Q?e+WpqBFSFWwwhl6hnr2lgEDG4nAwLCgDpR3ZqqD9JODb5h3Z9/tq1O4Fh4Q2?=
 =?us-ascii?Q?p5re8wftBs9xEQFTdmOSn37ENQSNMdpcybdA+eVv6D1//7QrH+RI6DQbhaNg?=
 =?us-ascii?Q?g4wiHMqfFiILi1a8hwSd6ugr+aB4899LBdljBO4qr0c1YjtRYeG05rNprRrM?=
 =?us-ascii?Q?v7a93wo0qBog1jH4HIg=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(61400799027)(376014)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2025 15:55:21.2691
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b55bd37-9c3a-4c14-96cb-08de0ff11322
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SN1PEPF000397B5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR19MB5766
X-Proofpoint-ORIG-GUID: h7JE9aWQDPa6vNbwrx7jf07HbiAupdK3
X-Proofpoint-GUID: h7JE9aWQDPa6vNbwrx7jf07HbiAupdK3
X-Authority-Analysis: v=2.4 cv=bdNmkePB c=1 sm=1 tr=0 ts=68f65b6c cx=c_pps
 a=WS7M4Vp6MtIIvztawIUZGg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=x6icFKpwvdMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=QyXUC8HyAAAA:8 a=w1d2syhTAAAA:8
 a=38gYyO_Oba7BUjtA73QA:9 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIwMDEzMSBTYWx0ZWRfX/X2GnTU5xNGg
 Pbh+YEl+CHtiNpPq5wOGwz4HwBRKb4k8/x7vubCSawfPX3hhilPl39jBEV8hiU8o8aZFrHPpfCO
 rNPvIfh4HAarYHXqxNLZ0vNJFZiPqZLT7O77UyiG+NkVtu3h0bCqeq7UZ33xtt9Hv6d8msy+42x
 Jfz1LlQeChf+zp2B2OBKuDUdjsQHUvRlwzkQDMN0olbgYGl4ySvgf2iEzmH69nK7yN+rOP/Mi/M
 dcVWpVUZE9WVXZGWQ0RpjRng7uU4cqYaqGxAfCsRv5aOOqyp3ai1MMJDxtSt8uZCu8IaIc4B3Ss
 4Fr5ZUlVLuaMmZMFI0CryPUN3tYqsMYGZaWa4gidRqr3NDhnpmsy+isKauOfdIqaHzcKtp6xl2K
 2gN/jUmAftzP6R1Wb3wjmjzD6oSuVg==
X-Proofpoint-Spam-Reason: safe

Store a copy of the device register map in the structure for the IRQ
handlers. This will allow the individual IRQ handlers access to the
device level register map if required.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No changes since v2.

 include/sound/sdca_interrupts.h  | 2 ++
 sound/soc/sdca/sdca_interrupts.c | 5 ++++-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/include/sound/sdca_interrupts.h b/include/sound/sdca_interrupts.h
index bbbc3ab27ebae..d652c6e94ddcb 100644
--- a/include/sound/sdca_interrupts.h
+++ b/include/sound/sdca_interrupts.h
@@ -23,6 +23,7 @@ struct sdca_function_data;
 /**
  * struct sdca_interrupt - contains information about a single SDCA interrupt
  * @name: The name of the interrupt.
+ * @device_regmap: Pointer to the IRQ regmap.
  * @component: Pointer to the ASoC component owns the interrupt.
  * @function: Pointer to the Function that the interrupt is associated with.
  * @entity: Pointer to the Entity that the interrupt is associated with.
@@ -35,6 +36,7 @@ struct sdca_function_data;
 struct sdca_interrupt {
 	const char *name;
 
+	struct regmap *device_regmap;
 	struct snd_soc_component *component;
 	struct sdca_function_data *function;
 	struct sdca_entity *entity;
diff --git a/sound/soc/sdca/sdca_interrupts.c b/sound/soc/sdca/sdca_interrupts.c
index 9295d283be910..898069ceffe93 100644
--- a/sound/soc/sdca/sdca_interrupts.c
+++ b/sound/soc/sdca/sdca_interrupts.c
@@ -437,7 +437,7 @@ struct sdca_interrupt_info *sdca_irq_allocate(struct device *sdev,
 					      struct regmap *regmap, int irq)
 {
 	struct sdca_interrupt_info *info;
-	int ret;
+	int ret, i;
 
 	info = devm_kzalloc(sdev, sizeof(*info), GFP_KERNEL);
 	if (!info)
@@ -445,6 +445,9 @@ struct sdca_interrupt_info *sdca_irq_allocate(struct device *sdev,
 
 	info->irq_chip = sdca_irq_chip;
 
+	for (i = 0; i < ARRAY_SIZE(info->irqs); i++)
+		info->irqs[i].device_regmap = regmap;
+
 	ret = devm_mutex_init(sdev, &info->irq_lock);
 	if (ret)
 		return ERR_PTR(ret);
-- 
2.47.3

