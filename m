Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4308431771B
	for <linux-sound@vger.kernel.org>; Thu, 18 Dec 2025 11:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766057751; cv=fail; b=LQG2l8oDndIBoR8VmIIjkdrqUrXYpI2Lz2oEvx3rzlZPTwxzmqHbpFXqN8dGgKg+qGASEsSh1dLAOIO3nQSNfIQy2WPTuefopdImaPOj2+LwTawRzlFJ6fNkDtVTSdST1t5Ya4J23RZe9PNB09YmXJ2x9FQKWKGfOsHgrHxAawQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766057751; c=relaxed/simple;
	bh=IrCNxb4vu4br6f0n/9mDRdjU3JlW8xdrwwttzmCvtAU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KRkKgsCzNIbBYxqGm3hK9nF/kVpZqHSMeEGPwQPlfxi7AWaDy1M2uKtpSv42ZBLCquSGiZm4B0BDgNViW+rzJuch5bXpl2AzH0VllfFfXBYlgcMwJ85gvBG2gviXwj9s2mWfi65CMApbZ1ityHQtl3luOLLOIZ+0snOqGUNJddo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=PJjEbw3r; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=NWFi4ttP; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="PJjEbw3r";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="NWFi4ttP"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BI4lHFq3231277;
	Thu, 18 Dec 2025 05:35:29 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=0XQjbhADEDkHTgqP0oilmBkHsixiZItm394qxgahJ7c=; b=
	PJjEbw3rnM4mzJ6HKW1xRpcyEAc2pGLO0zbt7lJj4qRi21ytH9BZWLRhyBZ5eBzc
	b+kMgOA632rMdU/Qp8J+tL0X1SW6/2N0VICUdVNOthzdigLNHI/8GXRzNEPyvakA
	d6p8oxCIbjFIV0h49E1IqKKY1HiDC50YdX6mUKdkacO4UQatAyBo0Upua13jNFc5
	t3qnd0w9sCe2JizmQ5kp/LgTq7U4HslRjq+8VmfLbYzLQABu9/jALSNMhA+gLhDl
	Ec/a2AHbQTq5HCl+yhagcQvy0FhbnrrYnO0waan/78qHzZfi/d1IB3IBnk5hinwZ
	HsLTgkUQLOsNjyl+g5JraA==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11022115.outbound.protection.outlook.com [40.93.195.115])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4b16e1wwsm-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 18 Dec 2025 05:35:29 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k4iV0Y/v6HYTpHbmP5Bsq2N4nwdBA1zVLiAvO0UWEypiJOfFVNBsSiFwqVJgRzmV02zLUPAqqQW7Y0de5Wyz/DT+2aJsC+iq4hs70KeZCcstcUX3q2YOyyQnq9oIPdlHaIk3AA+badDpUTaO5cy6KFGeHf/FGKtvZJTP2IhEDh9Oo9zFTfn55+tInZ2vIakXaU/eUUPQ+zhBViiUkq8xGlN1897Btg0kOV/uasudiDdohnlxUpiCMF1VB7v0wCNm8e9e3WzMHHZCHQuhxiadBsDYuvsa0HsRCtUyUB0oz0YEFZh4gXkvN27NmWakBGXj994uJdUee0KPY1qgUXl1fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0XQjbhADEDkHTgqP0oilmBkHsixiZItm394qxgahJ7c=;
 b=s2RPs8YQzdpU1AnfxI+8Z4qN94fk1waMIxESwgtf5jAeC6s6BDtzTabcUKmr+SeDpbMtOws2iMYcDpuIJ6aBglWvFadT2p7X86GtRA4ueZy4kh5mAQ1mjWdBZu9QRtGFIZ4UNcZx3y/3hhlLPxiqtvbGg9+3UbGR/H3Yxcsj6nom7kLxL1+fsbChGzmpBsXnpCk5slxFXm8wgJJAcfWoLOkm1oODq3/3eQAjEzUX1Ot5lJNPYFW/Uo1vPWxK9foziCF0ayIOTot4EUmXyGksG9qXlbS34NYOfLntZyU8k8/6i924H/m81co3Va7eIWZngvXkazm5lGKL6byWWRmYNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0XQjbhADEDkHTgqP0oilmBkHsixiZItm394qxgahJ7c=;
 b=NWFi4ttPiz+A3gbzN4Ey4B1LGrba2Iq7zK+oA7yGKUKmb64uzIZLlBgBt1WqkjMZpHVojqvPeyW2Z+jse45cHwqandYAwire242tdxZjCiIguEjfkAF8sg9bgKsnq/rvDnHCGIyjYkAMPQQ0G7l+9AGjWuq2Z31GfQgTpelB788=
Received: from CH2PR14CA0040.namprd14.prod.outlook.com (2603:10b6:610:56::20)
 by EA3PR19MB9230.namprd19.prod.outlook.com (2603:10b6:303:2af::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.8; Thu, 18 Dec
 2025 11:35:25 +0000
Received: from CH3PEPF0000000A.namprd04.prod.outlook.com
 (2603:10b6:610:56:cafe::b4) by CH2PR14CA0040.outlook.office365.com
 (2603:10b6:610:56::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.8 via Frontend Transport; Thu,
 18 Dec 2025 11:35:23 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH3PEPF0000000A.mail.protection.outlook.com (10.167.244.37) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.6
 via Frontend Transport; Thu, 18 Dec 2025 11:35:25 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 32E37406545;
	Thu, 18 Dec 2025 11:35:24 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 0C49A820258;
	Thu, 18 Dec 2025 11:35:24 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, vkoul@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        shumingf@realtek.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v2 1/4] ASoC: SDCA: Add SDCA IRQ enable/disable helpers
Date: Thu, 18 Dec 2025 11:35:17 +0000
Message-ID: <20251218113520.1287693-2-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251218113520.1287693-1-ckeepax@opensource.cirrus.com>
References: <20251218113520.1287693-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000A:EE_|EA3PR19MB9230:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: cb33103d-29a2-40fd-cbd9-08de3e29896a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|61400799027|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?LmDyauQIjMCN2DjUcCXgV6rn33mq5QJmte8a0f8GToMTLviZfChyM7VAyd4c?=
 =?us-ascii?Q?F+h4jagc5n5VJlRSxyTfqwy8PqDx5je4ikybLOUt8KeafXdsj/ax1lmdP79h?=
 =?us-ascii?Q?z2EvKUusFuVHYfMr8Xb11LeRjsEgLOdnTwuv60hru4qFZdsdPtLWcBfzErLG?=
 =?us-ascii?Q?0eZsoe7U2NYTDxBUlyc8bMwSx9MQy/MO4PCcVMXRDSUPqdaQBfZmjWTV4HRB?=
 =?us-ascii?Q?f8CHD3CUJFXE16CAtgGatgZSYzjuURsxKve+7Z7wqTA9OoLLTJ6M0TRxCmu6?=
 =?us-ascii?Q?mYEcKiCRWxNMqlGeHjamjSf4BGT8CfQXQieLVCS5O6v1u6BQIpKJcAtsumRR?=
 =?us-ascii?Q?IQ8vpULE7d4S+ME6gNNEx3edthnY+7I6fsyq41RsGk+PZY5W/fUBrHZrFPoC?=
 =?us-ascii?Q?SyWj/T2Bu4vCe/46JLJLqRS28QZEfVrphuQNyb8y8tgp7QRRqyYrmgrIuihP?=
 =?us-ascii?Q?npbDWLzSlouXbdnc3cLB3SIRASOoLZM5sJHpf/UdtQnkwfTsRpeUQ6sFrjxX?=
 =?us-ascii?Q?XFfHHq7SbEdk01e9vGj7xMYg22i5k90N9GhIqcIWb/6mfEmNKRB6o3b4uxZ6?=
 =?us-ascii?Q?JCedJikiiDU2PxHq5XG6fyQ/GMaWhefkCYH2LhPYTcFpNJOdj7kDkb+/M9+l?=
 =?us-ascii?Q?qIS72P/C7JV7yXjavF1am6AFxYnJhX0K2KB8S2VoWvHUQeVFIStOzEecsdO1?=
 =?us-ascii?Q?x3z/k2grSlmwF3Xfi+Yk8vh8frqls11oS9ew7Dd9YwpIOWoHLDqOG7GGmIBZ?=
 =?us-ascii?Q?eXMW02QST1HRuPeePAtMjQdn4yVkIYGg6tweqw1ERrNbUVC7lxfPLmuDKQkb?=
 =?us-ascii?Q?ne6cLlQJ9KONwd1N9XZsXBWkphskMQXEjh55ayRYPz7xyo0C74Y3emzhdQJZ?=
 =?us-ascii?Q?fAmxmeD1rv4jYtGaNkucqXJuwHwItXfRwLSFcVv2S6aiD0uRz1q+oFRcygke?=
 =?us-ascii?Q?lpgqQAtptpsJT6Ya5xSMNT9YKeGDsgk+ITm70trA8X8ud8upMfTAYWBhShwP?=
 =?us-ascii?Q?EDZGlQ7MoqXsSyNlbTcVMxkfc+RH6gmIdGqMIKwoufYw0UOzdzDsphhhLCv4?=
 =?us-ascii?Q?BcV5TQq9UAgIAyWVTBCaei2LMGtCWSwae++cX8SUJABHFRQlJsd9Wf5XH+6P?=
 =?us-ascii?Q?dJjMQBSX3gzoyhOMeGxIg9CWUjK37BDeexYFXxSEFRE2UFJ2x26JSvPMz9wv?=
 =?us-ascii?Q?tBM5LI+LGUg+DC+lmHUo4UrNYg+ZpuCjf0iHrp30zMAoIo+JrlXq0EMDviuz?=
 =?us-ascii?Q?PF6ZEhbwoZvMovOl0agg7EJSpk0Vq5GKJ8nj0N2Utix0LRNORPYV08Q8y5+n?=
 =?us-ascii?Q?Os00sX56QOypoaksRZeapmJOWnswcszoZCww0Wq75seLXLcKi5r0ZNxd2Fs0?=
 =?us-ascii?Q?slvkJCFBn6g62Alm6xbmHOnnbfePlWCiGlpyyfFtmiwtd9RQvxRv+9HUtWC2?=
 =?us-ascii?Q?3MU93ZWA1prQyuPc04Hc+zVootcek/k3LN34K8hxnQNp/lDWasaElACLSpR4?=
 =?us-ascii?Q?kqe6WP4+IaWxE0a+mCKiSJeQ6E35A7vTphhaOW2hhvuMlHTeVL1/kftoOtXI?=
 =?us-ascii?Q?DE/t2foMjjlMytm3Oek=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(61400799027)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 11:35:25.0863
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cb33103d-29a2-40fd-cbd9-08de3e29896a
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH3PEPF0000000A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: EA3PR19MB9230
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDA5NSBTYWx0ZWRfXxj7L4+qcRXqM
 NXuZEsnYbn8xRZ8Oy4WZdvu1ZTDUGfXkJTAzSZlkB7bk7mYYsaREvLFqCPOWSUrUxT3fprBVLxp
 gLACXGi9X32WBn+qJY5wndemb1HbL6aHAxy+bh78agG37K9CctLAfYKGYF+HG3+jsnrwbp2EY0F
 8DiJ9MYx2S5f2lZqpiazJBOqJvbaEIZMMTpSuA2ncHruUqnhv3sTwaL+cLb0K9D1qMJg4gN3iP0
 MTiPv4gFKRH3zJK1YgGlXnBkyMwoPkMWVuKQ2jcggm+XC1ZZ4/mTHiCwhbGsAlAXULcDvpqLWUd
 RKhvfRCYLOypbXIjWt5a6dvgc/2JD9R84jc2EMwzBOkpVJlYSynQfQ9rg6S4KAY3GmXUofV+SpY
 K8mljBGLoA5giOqT+GOVpXVaU638pA==
X-Proofpoint-ORIG-GUID: yI3rkny_vp9ElEtGbRF00_YwZdBPSiRc
X-Authority-Analysis: v=2.4 cv=Qdprf8bv c=1 sm=1 tr=0 ts=6943e701 cx=c_pps
 a=fbsF6a/R01XTAtGG6181zg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=wP3pNCr1ah4A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=w1d2syhTAAAA:8 a=ZOx6yu-7YdwscOYep6IA:9
X-Proofpoint-GUID: yI3rkny_vp9ElEtGbRF00_YwZdBPSiRc
X-Proofpoint-Spam-Reason: safe

Add helpers to enable and disable the SDCA IRQs by Function. These are
useful to sequence the powering down and up around system suspend.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

Changes since v1:
 - Rather than flagging the early IRQs with a boolean flag provide a
   helper with a different function name. This makes it clearer what the
   calling code is doing.

 include/sound/sdca_interrupts.h  |  7 ++++
 sound/soc/sdca/sdca_interrupts.c | 72 ++++++++++++++++++++++++++++++++
 2 files changed, 79 insertions(+)

diff --git a/include/sound/sdca_interrupts.h b/include/sound/sdca_interrupts.h
index 8f13417d129ab..9bcb5d8fd592b 100644
--- a/include/sound/sdca_interrupts.h
+++ b/include/sound/sdca_interrupts.h
@@ -84,4 +84,11 @@ int sdca_irq_populate(struct sdca_function_data *function,
 struct sdca_interrupt_info *sdca_irq_allocate(struct device *dev,
 					      struct regmap *regmap, int irq);
 
+void sdca_irq_enable_early(struct sdca_function_data *function,
+			   struct sdca_interrupt_info *info);
+void sdca_irq_enable(struct sdca_function_data *function,
+		     struct sdca_interrupt_info *info);
+void sdca_irq_disable(struct sdca_function_data *function,
+		      struct sdca_interrupt_info *info);
+
 #endif
diff --git a/sound/soc/sdca/sdca_interrupts.c b/sound/soc/sdca/sdca_interrupts.c
index 8f6a2adfb6fbe..928355f5b1003 100644
--- a/sound/soc/sdca/sdca_interrupts.c
+++ b/sound/soc/sdca/sdca_interrupts.c
@@ -610,3 +610,75 @@ struct sdca_interrupt_info *sdca_irq_allocate(struct device *sdev,
 	return info;
 }
 EXPORT_SYMBOL_NS_GPL(sdca_irq_allocate, "SND_SOC_SDCA");
+
+static void irq_enable_flags(struct sdca_function_data *function,
+			     struct sdca_interrupt_info *info, bool early)
+{
+	struct sdca_interrupt *interrupt;
+	int i;
+
+	for (i = 0; i < SDCA_MAX_INTERRUPTS; i++) {
+		interrupt = &info->irqs[i];
+
+		if (!interrupt || interrupt->function != function)
+			continue;
+
+		switch (SDCA_CTL_TYPE(interrupt->entity->type,
+				      interrupt->control->sel)) {
+		case SDCA_CTL_TYPE_S(XU, FDL_CURRENTOWNER):
+			if (early)
+				enable_irq(interrupt->irq);
+			break;
+		default:
+			if (!early)
+				enable_irq(interrupt->irq);
+			break;
+		}
+	}
+}
+
+/**
+ * sdca_irq_enable_early - Re-enable early SDCA IRQs for a given function
+ * @function: Pointer to the SDCA Function.
+ * @info: Pointer to the SDCA interrupt info for this device.
+ */
+void sdca_irq_enable_early(struct sdca_function_data *function,
+			   struct sdca_interrupt_info *info)
+{
+	irq_enable_flags(function, info, true);
+}
+EXPORT_SYMBOL_NS_GPL(sdca_irq_enable_early, "SND_SOC_SDCA");
+
+/**
+ * sdca_irq_enable_early - Re-enable SDCA IRQs for a given function
+ * @function: Pointer to the SDCA Function.
+ * @info: Pointer to the SDCA interrupt info for this device.
+ */
+void sdca_irq_enable(struct sdca_function_data *function,
+		     struct sdca_interrupt_info *info)
+{
+	irq_enable_flags(function, info, false);
+}
+EXPORT_SYMBOL_NS_GPL(sdca_irq_enable, "SND_SOC_SDCA");
+
+/**
+ * sdca_irq_disable - Disable SDCA IRQs for a given function
+ * @function: Pointer to the SDCA Function.
+ * @info: Pointer to the SDCA interrupt info for this device.
+ */
+void sdca_irq_disable(struct sdca_function_data *function,
+		      struct sdca_interrupt_info *info)
+{
+	struct sdca_interrupt *interrupt;
+	int i;
+
+	for (i = 0; i < SDCA_MAX_INTERRUPTS; i++) {
+		interrupt = &info->irqs[i];
+
+		if (!interrupt || interrupt->function != function)
+			continue;
+
+		disable_irq(interrupt->irq);
+	}
+}
+EXPORT_SYMBOL_NS_GPL(sdca_irq_disable, "SND_SOC_SDCA");
-- 
2.47.3

