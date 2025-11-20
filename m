Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9422B2FCC0F
	for <linux-sound@vger.kernel.org>; Thu, 20 Nov 2025 15:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763652715; cv=fail; b=rLhkCVSXzbUHzz0aGFS/QnSKOb1vKExnTh3vN+RB8wSrV/KKbPtgZG4o+NrXvJX57vQQP4elHrz4ZSv/0Yw0npcbpC1TXy5/tnJcM+CDb4nw4O/7H5AmGfAxAMwExalnXNZdkaeWCcNJwyyvBftyd7+e9kKI7n2SiH3+gyrsGv4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763652715; c=relaxed/simple;
	bh=ZrovAKXlyhYnUAM2e7EFqdbkBPlbengUMnfrgyp9OYg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lE2bSJmMHxvhV0VrNSCpOoKkA/mDPVshaFx3T9Dp+k6kTjK9pXiBAcKh5R499AcTLFuJPw7Y7dzc+FRjzCLtXcWI7zZViO76V6fb+fu3+3nFewY5v2AMLd39iz7mMXYUm4+GAIeN0RTbdd90grYuCmc1lmI32oNzAtfZX7ekPII=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=S1znZyG1; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=djt3ft4r; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="S1znZyG1";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="djt3ft4r"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AKCpaYK1058789;
	Thu, 20 Nov 2025 09:30:38 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=GjgDiAMk+xY+Vr0zLwOOm3wzxPWUgfP8t0b5uDy7gvk=; b=
	S1znZyG1H4I5FnSsmDHRHbIzOpmzD0xM4RX30TwXrTx2HqOxhnbOLcK7HTm/OhIa
	x/e/dYIbNRlSxHx5U2rOl0dV2ivkdccZr2bgubpZ3PkzDWWvFodTyjjHlfY5+nV8
	3RYZLp/hjNphZiAXXrzrb/U+ObNfni48BxVUUjRuDFCECt+f9uDm6VKA0wC1gVi9
	xwbruXrPND7Oqf8a9f75Zw+Mn5NqO9dLnuzsc1ajrcnILSlw7Tq8hG6syul7DPpy
	6ITwBoOi1JrDIRGnX/FUuf/9qfl1j5jnD/RNlqNIzizzQtKk5Q1LtGQQEn3Chav8
	wUMMoIMN9jyP0ap0axzOpQ==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11022080.outbound.protection.outlook.com [52.101.43.80])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4ah1bmamgg-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 20 Nov 2025 09:30:37 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IBrFwYsc7mWnYtGX5R5lY6JXybXyBHP3STck8XTst68T1NAZho7+rG0SZ+OLGHyDkRVmvBmLGfT9qUbpAonAcrbyvbJxB1iRX8jJbI1R2IYm8pSiwGO95Lv5hZb05rsPqXmKRNNz3HOYghZO7HMtt1PbXX/eEe6pYbxrgh8k2CQ3ZBbEgIS0RXuU2YrKTSXOKow6Iqhr6CWU1jNGtD2f2b685UHESOFyOfdE81WAV4OMQn2GiwQkH5AY1+om7cvypRDJr+sB0rxOK8TGDkVJsSYKygJSg7AqDl7EENmdzvM2gOG9pcVbobs6IqhljfynCW4v+yHdOmHDE4v3RL8QlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GjgDiAMk+xY+Vr0zLwOOm3wzxPWUgfP8t0b5uDy7gvk=;
 b=G7xEnqW2ifcLfwkhumzTzuewLsPmAczTMZHEkyT44PfLZWLGDjNj5dudoOkITHpDZT8coo9vaPlBgB1qEYjT9Nmseaj+1ztHImTFl+lVtGdrR1Ja6eCF2bqMbGJdm9US/ODEklV+cvD5vz08c7dCVqF3HgfScjvaPNeDNBHJPSc0wi8JId3YMfXLrk6cNyX++BloORkJ1bnJ04G4cUAEpuQAL94Ot/+2BfqbSxOiPOKnDKtJEZgfhA4YlCCrmVkSXZZBAn40GSZM9nukkJ0DA5esmFMuauFx1KhIgYO17t/qxcc5RGyaco/vV8jm4+75D9+jKqtU5LW+ZMBeelk4gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GjgDiAMk+xY+Vr0zLwOOm3wzxPWUgfP8t0b5uDy7gvk=;
 b=djt3ft4rcYDgDLRHLNQ25mw9MBwNZhUl55IPuzt8OqtSz4UqE1uP42kGDPwaYKn6Hnk6K4hWurdrjVh+Ct5lrRF+q0XQdZNiP5lHda+0MxUjIFoi65djLZ5EXFp7IcElW3O8yBcIaM0AoTBD0wLZ8Mch4EJ51Cbn8O8Lg/9iHhw=
Received: from BY3PR04CA0025.namprd04.prod.outlook.com (2603:10b6:a03:217::30)
 by DS0PR19MB7839.namprd19.prod.outlook.com (2603:10b6:8:12c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Thu, 20 Nov
 2025 15:30:33 +0000
Received: from MWH0EPF000971E6.namprd02.prod.outlook.com
 (2603:10b6:a03:217:cafe::46) by BY3PR04CA0025.outlook.office365.com
 (2603:10b6:a03:217::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.11 via Frontend Transport; Thu,
 20 Nov 2025 15:30:24 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 MWH0EPF000971E6.mail.protection.outlook.com (10.167.243.74) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.9
 via Frontend Transport; Thu, 20 Nov 2025 15:30:31 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id D6A0540655A;
	Thu, 20 Nov 2025 15:30:27 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id ACC2D822549;
	Thu, 20 Nov 2025 15:30:27 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: vkoul@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        shumingf@realtek.com, lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v4 08/13] ASoC: SDCA: Factor out helper to process Control defaults
Date: Thu, 20 Nov 2025 15:30:17 +0000
Message-ID: <20251120153023.2105663-9-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251120153023.2105663-1-ckeepax@opensource.cirrus.com>
References: <20251120153023.2105663-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E6:EE_|DS0PR19MB7839:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: adce26c1-7652-4f5b-cc6f-08de2849be18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|61400799027;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?eXIirOEWT1dNk03M6vEbM8wIdtXDlRxdbGOw7MqIk1hRtNVewaMNjNdNUn9z?=
 =?us-ascii?Q?Yl5Pu+kytxESrwFST2emRZrMOkIFJOayXD79GptVu7aA9wmOXW0IFLHwvM1F?=
 =?us-ascii?Q?dAG9xJbCvY9LsbvOHXVpd1FRdkFHn6Fgf+dgvHIp6tu3lK0Od+lNtDGkaRb5?=
 =?us-ascii?Q?AQEGuXB0rMOjn90DfAs1dmtSNt1n7l1k2P+/nL0lVQ3LfjvY1QQynlr/lxvr?=
 =?us-ascii?Q?odgUvsqbqgnM/y1fy5tDds7hRKMDyFzIKCX3+tQ0NTYReeAYCvhxrXH+wsB7?=
 =?us-ascii?Q?zZNzbdDSfVo4INCjkPakrRZRbsOrC9EuuQZz/pfzdt88ujnTJOShehRRPYi+?=
 =?us-ascii?Q?TxppPb8Kif4/4tUlJ9WUhf8moZ5Ytk0nUf2D0jUSUo2rIDssTBW+BqGATL1w?=
 =?us-ascii?Q?4aVh/AH/2HRoV9Fbg+DcsKtNzlKX1ZUiTklS34U5TnRB6ERDSZwuCZCULEs8?=
 =?us-ascii?Q?9duJ9tU8xgjo7P8DeQ7Irr+YpAxvqRvYHS/jxpAA7RwZiNz0zygIFRbFg1O6?=
 =?us-ascii?Q?gA65p9y/Snw5t0RVJ/pajAgVmg6AcKbbFntovCzCffZGBjvSpbe6/OeJVbFI?=
 =?us-ascii?Q?yFdJKEsaor08JJMr4XRNnTk+Ktm7X5xooap3PJFvZF3VVKqEBHJd2fLVMZoZ?=
 =?us-ascii?Q?ynOJBjkCgt5p3WnvprFSUXosc5YOKOCMDzla8+qVTTeHBvcZJPn52ZsEaOzs?=
 =?us-ascii?Q?R7Krvl9CHc/Jk2lvGE2dWX1w1SAuWus0MmIxiHig2YJJ0mtU8qPYLK8xMUX6?=
 =?us-ascii?Q?5WZDob86rhPlkzN4P+qBikk04cr++97hiqFJU6yJMyDSHVDdEfcvaky89sQ2?=
 =?us-ascii?Q?oMvEGkvOoztA0bnXU6CN1MVXBOAsKt73xQOFrxljZtY9s0WArbZdru5HwUC/?=
 =?us-ascii?Q?kB7yyy/33qSwykpcKjnKKJVB3y1Bp7x4ZkS5eb9wjMIwTsWIiKxZsyR7TIu2?=
 =?us-ascii?Q?2RGEP+JOf2IyPe2PWFeUgfKdMqHzoHPdkB9IgFlJpp3Li/vxPnjKMqcTEg1J?=
 =?us-ascii?Q?FcNcKuAV6L3povbhYy5dW2f8jaB5dHFC5L8WZvVnzXzOOVbR0dThn5wKH4A4?=
 =?us-ascii?Q?c32ywGFqiwxo0oVvpXpuG30Kslxv3Kgc7oknd4y/+oetHx7Si90DSXgJDitI?=
 =?us-ascii?Q?rgT88jCTzo660bVlw6oXBBMr3S/X8cgYYWqac57/Zgq/7YYGE6foLH6OyZMG?=
 =?us-ascii?Q?86sXJP4Hpy4atBeofGYD0VKqWZ7f9usfMOPi3SNgdQmLTPJZI3HtT3MjmL52?=
 =?us-ascii?Q?2nAsU7qWiL8FA95YDUUeriSuAOZK25FDPcgNpVy1KpnDRf3CJenVs9E01mP/?=
 =?us-ascii?Q?+ifQ0KM2vgpZL3Ndsp2uum4/B8a7r2PBCqx9IlSdAH3geuunNqPtYLpgoNvT?=
 =?us-ascii?Q?CSozMNzA6TqaOGkx4wJK5dUtEAfSY6TSGPiX/qdnJPeGxV8hBqodNyChHFF2?=
 =?us-ascii?Q?oDP1QdLoo4KOTvrpfmYgN0EnxBT2l7i7lifa6izkODMwdGFfsbRnfFCD2x2O?=
 =?us-ascii?Q?OZlqrNnWI8JmGpe2RUUiBqXdNAKPZ0d6jOlxs9UvhbPeuS/itYTmZTY5iNau?=
 =?us-ascii?Q?FZ1rOjMpTKpdWmRpe/k=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(61400799027);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 15:30:31.6979
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: adce26c1-7652-4f5b-cc6f-08de2849be18
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-MWH0EPF000971E6.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR19MB7839
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIwMDEwMiBTYWx0ZWRfX7xL3sGUnpiUy
 YBrzwr1wBC2L5ywgqbbVMm+GBmybm3Z/CexvzhMwX8nWXMsRKjxWL8SBmTvpBxSqEifImqft/91
 b6kPs1SF9Beo/laXl5RfdIqlUJ7bTgMuXWujFepgyFcdyCLS/GTGa1m8GkKCJgTewlpMl1UQlR5
 LPsr+KYMKTVFUY+HpEtZWfxlGQ0KUmRVFsp5JQQUGCTUfual2jLRhgmHXKGz7uSqOmm8KlDO/Oh
 6RcleASzRpNAt2JTzb5wml0nTkXHFDXpienWnbMeXlwuA3k/yH2efgmEFTeKPY21a240rWqBMk8
 orqfDvF2/j0YO9Gm3NaEuPCO4I/y6wQima2TIGH84rMlZLT0IkkTqlncRdIS4jColMhK139Ob0p
 s8UU0jSHM8yejPyTYJTQm3XKLij0Sw==
X-Authority-Analysis: v=2.4 cv=XcmEDY55 c=1 sm=1 tr=0 ts=691f341d cx=c_pps
 a=hSYwUsMu3dPAZ0NekjkltQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=6UeiqGixMTsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=QyXUC8HyAAAA:8 a=w1d2syhTAAAA:8
 a=IUiMwORI4Q0lmyDNHjMA:9
X-Proofpoint-GUID: G0he30IdbPHGlkMKu3DtDXJqk511C7jK
X-Proofpoint-ORIG-GUID: G0he30IdbPHGlkMKu3DtDXJqk511C7jK
X-Proofpoint-Spam-Reason: safe

The indentation of the loop processing writing out SDCA Control default
values is getting a bit large. Reduce indentation and make adding more
functionality easier by factoring out the Control handling into a helper
function.

Tested-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Maciej Strozek <mstrozek@opensource.cirrus.com>
Reviewed-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Tested-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No changes since v3.

 sound/soc/sdca/sdca_regmap.c | 61 +++++++++++++++++++++++-------------
 1 file changed, 39 insertions(+), 22 deletions(-)

diff --git a/sound/soc/sdca/sdca_regmap.c b/sound/soc/sdca/sdca_regmap.c
index 8fa138fca00ff..5104ae99df33a 100644
--- a/sound/soc/sdca/sdca_regmap.c
+++ b/sound/soc/sdca/sdca_regmap.c
@@ -275,6 +275,40 @@ int sdca_regmap_populate_constants(struct device *dev,
 }
 EXPORT_SYMBOL_NS(sdca_regmap_populate_constants, "SND_SOC_SDCA");
 
+static int populate_control_defaults(struct device *dev, struct regmap *regmap,
+				     struct sdca_function_data *function,
+				     struct sdca_entity *entity,
+				     struct sdca_control *control)
+{
+	int i, ret;
+	int cn;
+
+	if (control->mode == SDCA_ACCESS_MODE_DC)
+		return 0;
+
+	if (!control->has_default && !control->has_fixed)
+		return 0;
+
+	i = 0;
+	for_each_set_bit(cn, (unsigned long *)&control->cn_list,
+			 BITS_PER_TYPE(control->cn_list)) {
+		unsigned int reg;
+
+		reg = SDW_SDCA_CTL(function->desc->adr, entity->id, control->sel, cn);
+
+		ret = regmap_write(regmap, reg, control->values[i]);
+		if (ret) {
+			dev_err(dev, "Failed to write default %#x: %d\n",
+				reg, ret);
+			return ret;
+		}
+
+		i++;
+	}
+
+	return 0;
+}
+
 /**
  * sdca_regmap_write_defaults - write out DisCo defaults to device
  * @dev: Pointer to the device.
@@ -290,7 +324,7 @@ EXPORT_SYMBOL_NS(sdca_regmap_populate_constants, "SND_SOC_SDCA");
 int sdca_regmap_write_defaults(struct device *dev, struct regmap *regmap,
 			       struct sdca_function_data *function)
 {
-	int i, j, k;
+	int i, j;
 	int ret;
 
 	for (i = 0; i < function->num_entities; i++) {
@@ -298,28 +332,11 @@ int sdca_regmap_write_defaults(struct device *dev, struct regmap *regmap,
 
 		for (j = 0; j < entity->num_controls; j++) {
 			struct sdca_control *control = &entity->controls[j];
-			int cn;
-
-			if (control->mode == SDCA_ACCESS_MODE_DC)
-				continue;
 
-			if (!control->has_default && !control->has_fixed)
-				continue;
-
-			k = 0;
-			for_each_set_bit(cn, (unsigned long *)&control->cn_list,
-					 BITS_PER_TYPE(control->cn_list)) {
-				unsigned int reg;
-
-				reg = SDW_SDCA_CTL(function->desc->adr, entity->id,
-						   control->sel, cn);
-
-				ret = regmap_write(regmap, reg, control->values[k]);
-				if (ret)
-					return ret;
-
-				k++;
-			}
+			ret = populate_control_defaults(dev, regmap, function,
+							entity, control);
+			if (ret)
+				return ret;
 		}
 	}
 
-- 
2.47.3

