Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9674293B5C
	for <linux-sound@vger.kernel.org>; Mon, 12 May 2025 12:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747053793; cv=fail; b=fanAY5rRiXLPEVg49cy/Xd5lTu6NjHb/nTmVwLQ0U2rPGa/I7/azGLtzROFxrMgZVgLaG0cw3TV62pVK6TmvHc/fYEDIDEBqNQPo7pvlAwu40NtKKYajEiv/HCl26v7H8mGh7F0BbK+3UJigDqlxtZ+CpwWc3/0mvm0RkXfTpP0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747053793; c=relaxed/simple;
	bh=gu7lIMgvgO1cM0WBNjHNFvpkjCnCilVtV4WHuhnHDgM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NA4QG+6vMiO0AJFNxhMNqa+qObAzPyUnt/a/vFE2AqBxzzhwfhbzsB/yF66QjR1yMqmhUfm8//01D5Q7DKuO1/0f2yOVoH0qGefdp9gA1w30KXiJhURcn+oUFWXei1Wr85SEtGhgKMkXdpauY1UnpkUVQco76W6YMQPg5AY0wLE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=U+SbHCIn; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=MDygmPE7; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="U+SbHCIn";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="MDygmPE7"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54C6H5TT014403;
	Mon, 12 May 2025 07:42:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=aq7674oqJybKnGdhEQLchQJOOazid/fGClzVTBkZwXo=; b=
	U+SbHCIncXtjVacGIH/3JIZGB6Aqq2wTChRHBR06UfodfqA5+ElZnuRaBG7yxBhu
	CMhJyciOo2KjW/X5BwASS6vjfrGsDwQdt88xWuRy1/g7x+1sJQ4gof5NDz3OqVR+
	dIPuJDuvyYjpUXSbqoiQR18hnVNqdKKntHbC3mBMnu7Ozm6x2RnMle7JBFX20VTF
	jF1Jmf9B/WlIm7JXQDjU4zvqlp29EQyBecTsSk0wpL+4H4HOCdDTy4wCvHV8khoD
	BaLkZQS3h/LSwoJkAHcaFWk5+HvrwpityR5HUhAsGRumBTGY/0LnEB+FZQD8e3YB
	OJZ0QcjZwvyPBQ/WWyWQDg==
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2173.outbound.protection.outlook.com [104.47.56.173])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 46j37ga8n4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 May 2025 07:42:47 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zw1P8Mp33/Sc33z58j2e8k2ifq7UPx2yrOMfnCHdlFDwnm1hBCCR0ijSet18QPK36y+fmVYph/xaUkfM5dedGoJSB3TeMVOLvC9uSl26EJ4CoJORMof+qOr6HKSfa0xqqxsTVjg9wz29Cs9LcRlggf2KSNPWgsSEf1FSV3sMyDZ/htou8qr5fjwS8vc9Gc/UnLoa7eT5M1GHgGmxpsAS0CLFHKrEtsD1YfTa+AkyE8hFactMhq2ftv5gtGcwTzsDnRRJRBq0M6O32e8tNRUYptl5LSsWaWW0J3DKEKRO9bGA9wZZeeT9DGbp0PXssTDULKqrdJOGz3tu/C8ROEze1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aq7674oqJybKnGdhEQLchQJOOazid/fGClzVTBkZwXo=;
 b=icIwoXCDAYBak4ZZuzUHp2AQHQlJe4VcyfwOZ1TsFsog8J3Mp4GRJBMbLEYJTaXZPiRMSPWN+lMrnDkPRi1EvIJbQyxMqVx07cadMceXYAHReooZK7aUWXMpr6NLEXjzC5VU1DekKv5ALetLhjAnFv++/D1yPeCOX6xjZNZUje7CRqDHLiYGU6XNR1GcbgBUgxaTKX/IlvzCz0nsxUoOeOXvwdUeLz5lGTYrAZjfX48w1OnCCqpFEINC7rMZnXvN5D3eNFsobgN1hV2ABNVeims1mhv2+cBhz9YGLpkrj0EYX1PF8nKoFFbcc9HQlltTGuSMS4OXsFAFI5rhi5IxFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aq7674oqJybKnGdhEQLchQJOOazid/fGClzVTBkZwXo=;
 b=MDygmPE7afhJdvcygp25nyf8P/HNgDXP4guCu+puvFvmCna/GGPq6BvJW8+01NGbk02A58mSAohKSf8SzHD7R8OEjda9NmLrTF3ch8LzZISV15kg4gPO+7TI1udmKwYzLMg229HZ+mSjkRMvTMUffLI625AWcOBBq0+AKP9GNZY=
Received: from MW2PR16CA0030.namprd16.prod.outlook.com (2603:10b6:907::43) by
 SA0PR19MB4256.namprd19.prod.outlook.com (2603:10b6:806:87::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.29; Mon, 12 May 2025 12:42:45 +0000
Received: from CY4PEPF0000E9D4.namprd03.prod.outlook.com
 (2603:10b6:907:0:cafe::39) by MW2PR16CA0030.outlook.office365.com
 (2603:10b6:907::43) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.20 via Frontend Transport; Mon,
 12 May 2025 12:42:44 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CY4PEPF0000E9D4.mail.protection.outlook.com (10.167.241.139) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.18
 via Frontend Transport; Mon, 12 May 2025 12:42:43 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 21EC3406552;
	Mon, 12 May 2025 12:42:41 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 0C445820270;
	Mon, 12 May 2025 12:42:41 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        peter.ujfalusi@linux.intel.com, pierre-louis.bossart@linux.dev,
        linux-sound@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH v5 6/6] ASoC: SDCA: Create DAI drivers from DisCo
Date: Mon, 12 May 2025 13:42:40 +0100
Message-Id: <20250512124240.799509-7-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250512124240.799509-1-ckeepax@opensource.cirrus.com>
References: <20250512124240.799509-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D4:EE_|SA0PR19MB4256:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: b18a87c5-ef23-43c3-8ed0-08dd91527ddf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|61400799027|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ls2KQQUonkh/na8w4QNOj2u8FCrwJ5LmU7Y15FLWpeC932shAJeKDuCvQaAo?=
 =?us-ascii?Q?Y3cI0MAffvkAbZWgYGYAZgxoRlphYn0l6xEO5yXCaFhI3vAsdavrulcnorb0?=
 =?us-ascii?Q?KJ1htOJ3ymS+axSYAVRXOWh1UXT/5uFBN8oMvGh6Cw32gxOnj3ED+6FQqkJ6?=
 =?us-ascii?Q?ThL0VRsFTryaQmM/OxrpVoeIy3Av+1fzzq2E+APFnID1c23w+388K5eyzQub?=
 =?us-ascii?Q?0JiKBoEwlxyOnrPNqLWX+pDONv6c2h/OOfWu2rFLiBdWbIEqPeMALjlgqeBP?=
 =?us-ascii?Q?/KWU/AV6uM1nGuRQLB4dANcedppml7SFfAPXionmoyLZ7tFsqvnbzV92GKLM?=
 =?us-ascii?Q?iBV+i606kBSY/l4oIvO+6lZI6kuUdwrJYPUVvUbGux1RhjKiOnFpD/rhkjp1?=
 =?us-ascii?Q?JEYIbdryyiB89LgHmkTxEjBlBE6GuT0YW5ivcEx0hFGWdTPmHag1sMF3yKPI?=
 =?us-ascii?Q?IweDxNKqpR6DncECdnrV7mp7YIPWw6TEiwuItCU9idP850Xz6F43FnWmbUaF?=
 =?us-ascii?Q?683s+d+Wje44QOAogK0lZwsfhvXN8uzX6j9Rry/PhghqAmYipYUU8ZyuO12J?=
 =?us-ascii?Q?u0wykyOJljGBm5Sg4saMubaq4+RE2BlrwfTgRcg3vaOkOdLjD6Zv2l0Qt8Ln?=
 =?us-ascii?Q?xakHUJjLuiN/sf4evpKN22wKvIHj+oj50Bc5ZkkSl81+I8QIvMzj6mmnEu0s?=
 =?us-ascii?Q?CaEoE7IGCAFKH9b2veGXg2XpwJStNrjg/AOEQUkW4FL1ZvuNkVqLWFjhh6W3?=
 =?us-ascii?Q?pMcVx34/fgWue3vedYWKzJ8oriTICdKy49WsQNUbrKGf6ySXgKnHhfi/d8jH?=
 =?us-ascii?Q?houZiM/9EJTCrdB/50dHczpV05ucwlpn/6ueoyhykUm8DhiNI49IRBfw1pmP?=
 =?us-ascii?Q?J0QO4JeFkoL7QoByq+wK+Ut6kWxE0I8wwA2TTD/0vdL/U3hv7cYS/X0KcnHX?=
 =?us-ascii?Q?Sotgi2cQkg8OoQtIa1sSCz4zz4QSwYVajLPCKr3/AEg8WhzruwF0MAIMiBfc?=
 =?us-ascii?Q?jzK++s+v1VPoEtrIVGBP86OW5O6YF9Ohl4+fIQBihtsjviLcCfP6mAazKpbT?=
 =?us-ascii?Q?R84EJtjFaNjLoZOsgeH29XEBuzHk+yJujdCf1RgVYU2MOSdpcUZJrpjEq9Iu?=
 =?us-ascii?Q?ARRMbPdmFwT53+hj7aSQjXsOW1gZlY3OoF9LpzMnftjY8JH+5lcSnje1JW4h?=
 =?us-ascii?Q?Plhr+mCHaxolVXoApnk7G5tnYngxfSyjYR7h3Z727Ql6ox4RiLC69G7Af4YD?=
 =?us-ascii?Q?E62J6lfv6Qa58q4INT+xoMYaipEtO0Xkx5W6Y5up7YM1kH9MzL5SJy2fgxvt?=
 =?us-ascii?Q?i1iLLlcr0UcuUPvQnJmX9bJk2UCRZW5cYeDXXdOaILpeBK4qDk4d3MgGf25N?=
 =?us-ascii?Q?H81U/cvdz6J+F8OWUECx2j+zNUWTCIvrqUZcedum+HopDHlp/+rdruGHUk83?=
 =?us-ascii?Q?DB4Po/wqbNPLRC2j0r7EJlUOZ3GJhXa95jJCnZ00quWx72Wslypnlm41lJNb?=
 =?us-ascii?Q?7d/KbH5KS8+rikD/9EfWdzP6uaUpGlM79phU?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(61400799027)(376014)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2025 12:42:43.8685
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b18a87c5-ef23-43c3-8ed0-08dd91527ddf
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR19MB4256
X-Proofpoint-GUID: F8s2TZ4ahR5NY72rhqYkP_l1w5nEz3Ek
X-Authority-Analysis: v=2.4 cv=BOazrEQG c=1 sm=1 tr=0 ts=6821ecc8 cx=c_pps a=5b96o3JgDboJA9an2DnXiA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=dt9VzEwgFbYA:10 a=s63m1ICgrNkA:10
 a=RWc_ulEos4gA:10 a=w1d2syhTAAAA:8 a=TKdQKM3kYW3HcpqIAtQA:9 a=BGLuxUZjE2igh1l4FkT-:22
X-Proofpoint-ORIG-GUID: F8s2TZ4ahR5NY72rhqYkP_l1w5nEz3Ek
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEyMDEzMiBTYWx0ZWRfX/yGi9+WOnz5V nPdztMniT2RHiNmgBjWhLIEfZqlf3yjEI9hOv7cKx+WNv6LUCS8qpsHoRxsGMrYlLc0Rr6csEfy lhxNEsXsXp16U45c6ondshXHaM3uUEMDMfP8m7HF+AgFf/wue29hR/3Snc45oLU8YYyWYVCXATT
 yMIiiGasKjs+to1rDlP/YtBDQpXKzaGGr6LFZLTSqRr5oyQ6hbj+MNKnEHX1HdWKnupc3jn14qc Q0KwaNOHAvdOWj+7sX0WQsxUny9h5lqcA+Nyo9soVHgFIUvdDd/GYArN2ze6LHK1I+9owdBgO04 qT5GfDA1XmBo2R0LWSdTSWe/x2YtdPC3pONsA0AJZ/3t8RfC1kDTn3qcpfw9D6OtW9O0D9d7PDi
 fk8n85QYsVjVm6L1Mm2zP2bVArE7/a48eYU48p3hAOIBdMreBSgkbMhJ16nuoC8daA1luvmb
X-Proofpoint-Spam-Reason: safe

Use the previously parsed DisCo information from ACPI to create the DAI
drivers required to connect an SDCA Function into an ASoC soundcard.

Create DAI driver structures and populate the supported sample rates
and sample widths into them based on the Input/Output Terminal and any
attach Clock Source entities. More complex relationships with channels
etc. will be added later as constraints as part of the DAI startup.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

Changes since v4:
 - Add include of soc-dai.h, this should be included directly.

 include/sound/sdca_asoc.h     |  12 +-
 include/sound/sdca_function.h |  23 ++++
 sound/soc/sdca/sdca_asoc.c    | 227 +++++++++++++++++++++++++++++++++-
 3 files changed, 256 insertions(+), 6 deletions(-)

diff --git a/include/sound/sdca_asoc.h b/include/sound/sdca_asoc.h
index d19e7e969283a..9121531f08260 100644
--- a/include/sound/sdca_asoc.h
+++ b/include/sound/sdca_asoc.h
@@ -14,11 +14,14 @@ struct device;
 struct sdca_function_data;
 struct snd_kcontrol_new;
 struct snd_soc_component_driver;
+struct snd_soc_dai_driver;
+struct snd_soc_dai_ops;
 struct snd_soc_dapm_route;
 struct snd_soc_dapm_widget;
 
 int sdca_asoc_count_component(struct device *dev, struct sdca_function_data *function,
-			      int *num_widgets, int *num_routes, int *num_controls);
+			      int *num_widgets, int *num_routes, int *num_controls,
+			      int *num_dais);
 
 int sdca_asoc_populate_dapm(struct device *dev, struct sdca_function_data *function,
 			    struct snd_soc_dapm_widget *widgets,
@@ -26,9 +29,14 @@ int sdca_asoc_populate_dapm(struct device *dev, struct sdca_function_data *funct
 int sdca_asoc_populate_controls(struct device *dev,
 				struct sdca_function_data *function,
 				struct snd_kcontrol_new *kctl);
+int sdca_asoc_populate_dais(struct device *dev, struct sdca_function_data *function,
+			    struct snd_soc_dai_driver *dais,
+			    const struct snd_soc_dai_ops *ops);
 
 int sdca_asoc_populate_component(struct device *dev,
 				 struct sdca_function_data *function,
-				 struct snd_soc_component_driver *component_drv);
+				 struct snd_soc_component_driver *component_drv,
+				 struct snd_soc_dai_driver **dai_drv, int *num_dai_drv,
+				 const struct snd_soc_dai_ops *ops);
 
 #endif // __SDCA_ASOC_H__
diff --git a/include/sound/sdca_function.h b/include/sound/sdca_function.h
index 77ffb1f4e1ca9..be7e4a88cbed0 100644
--- a/include/sound/sdca_function.h
+++ b/include/sound/sdca_function.h
@@ -168,6 +168,20 @@ enum sdca_ot_controls {
 	SDCA_CTL_OT_NDAI_PACKETTYPE			= 0x17,
 };
 
+/**
+ * enum sdca_usage_range - Column definitions for Usage
+ */
+enum sdca_usage_range {
+	SDCA_USAGE_NUMBER				= 0,
+	SDCA_USAGE_CBN					= 1,
+	SDCA_USAGE_SAMPLE_RATE				= 2,
+	SDCA_USAGE_SAMPLE_WIDTH				= 3,
+	SDCA_USAGE_FULL_SCALE				= 4,
+	SDCA_USAGE_NOISE_FLOOR				= 5,
+	SDCA_USAGE_TAG					= 6,
+	SDCA_USAGE_NCOLS				= 7,
+};
+
 /**
  * enum sdca_mu_controls - SDCA Controls for Mixer Unit
  *
@@ -246,6 +260,15 @@ enum sdca_cs_controls {
 	SDCA_CTL_CS_SAMPLERATEINDEX			= 0x10,
 };
 
+/**
+ * enum sdca_samplerateindex_range - Column definitions for SampleRateIndex
+ */
+enum sdca_samplerateindex_range {
+	SDCA_SAMPLERATEINDEX_INDEX			= 0,
+	SDCA_SAMPLERATEINDEX_RATE			= 1,
+	SDCA_SAMPLERATEINDEX_NCOLS			= 2,
+};
+
 /**
  * enum sdca_cx_controls - SDCA Controls for Clock Selector
  *
diff --git a/sound/soc/sdca/sdca_asoc.c b/sound/soc/sdca/sdca_asoc.c
index e3debfe55eb04..c7db8c2750d75 100644
--- a/sound/soc/sdca/sdca_asoc.c
+++ b/sound/soc/sdca/sdca_asoc.c
@@ -20,6 +20,7 @@
 #include <sound/sdca_function.h>
 #include <sound/soc.h>
 #include <sound/soc-component.h>
+#include <sound/soc-dai.h>
 #include <sound/soc-dapm.h>
 #include <sound/tlv.h>
 
@@ -89,6 +90,8 @@ static bool exported_control(struct sdca_control *control)
  * required number of DAPM routes for the Function.
  * @num_controls: Output integer pointer, will be filled with the
  * required number of ALSA controls for the Function.
+ * @num_dais: Output integer pointer, will be filled with the
+ * required number of ASoC DAIs for the Function.
  *
  * This function counts various things within the SDCA Function such
  * that the calling driver can allocate appropriate space before
@@ -97,13 +100,15 @@ static bool exported_control(struct sdca_control *control)
  * Return: Returns zero on success, and a negative error code on failure.
  */
 int sdca_asoc_count_component(struct device *dev, struct sdca_function_data *function,
-			      int *num_widgets, int *num_routes, int *num_controls)
+			      int *num_widgets, int *num_routes, int *num_controls,
+			      int *num_dais)
 {
 	int i, j;
 
 	*num_widgets = function->num_entities - 1;
 	*num_routes = 0;
 	*num_controls = 0;
+	*num_dais = 0;
 
 	for (i = 0; i < function->num_entities - 1; i++) {
 		struct sdca_entity *entity = &function->entities[i];
@@ -114,6 +119,7 @@ int sdca_asoc_count_component(struct device *dev, struct sdca_function_data *fun
 			*num_routes += !!entity->iot.clock;
 			*num_routes += !!entity->iot.is_dataport;
 			*num_controls += !entity->iot.is_dataport;
+			*num_dais += !!entity->iot.is_dataport;
 			break;
 		case SDCA_ENTITY_TYPE_PDE:
 			*num_routes += entity->pde.num_managed;
@@ -1013,6 +1019,205 @@ int sdca_asoc_populate_controls(struct device *dev,
 }
 EXPORT_SYMBOL_NS(sdca_asoc_populate_controls, "SND_SOC_SDCA");
 
+static unsigned int rate_find_mask(unsigned int rate)
+{
+	switch (rate) {
+	case 0:
+		return SNDRV_PCM_RATE_8000_768000;
+	case 5512:
+		return SNDRV_PCM_RATE_5512;
+	case 8000:
+		return SNDRV_PCM_RATE_8000;
+	case 11025:
+		return SNDRV_PCM_RATE_11025;
+	case 16000:
+		return SNDRV_PCM_RATE_16000;
+	case 22050:
+		return SNDRV_PCM_RATE_22050;
+	case 32000:
+		return SNDRV_PCM_RATE_32000;
+	case 44100:
+		return SNDRV_PCM_RATE_44100;
+	case 48000:
+		return SNDRV_PCM_RATE_48000;
+	case 64000:
+		return SNDRV_PCM_RATE_64000;
+	case 88200:
+		return SNDRV_PCM_RATE_88200;
+	case 96000:
+		return SNDRV_PCM_RATE_96000;
+	case 176400:
+		return SNDRV_PCM_RATE_176400;
+	case 192000:
+		return SNDRV_PCM_RATE_192000;
+	case 352800:
+		return SNDRV_PCM_RATE_352800;
+	case 384000:
+		return SNDRV_PCM_RATE_384000;
+	case 705600:
+		return SNDRV_PCM_RATE_705600;
+	case 768000:
+		return SNDRV_PCM_RATE_768000;
+	case 12000:
+		return SNDRV_PCM_RATE_12000;
+	case 24000:
+		return SNDRV_PCM_RATE_24000;
+	case 128000:
+		return SNDRV_PCM_RATE_128000;
+	default:
+		return 0;
+	}
+}
+
+static u64 width_find_mask(unsigned int bits)
+{
+	switch (bits) {
+	case 0:
+		return SNDRV_PCM_FMTBIT_S8 | SNDRV_PCM_FMTBIT_S16_LE |
+		       SNDRV_PCM_FMTBIT_S20_LE | SNDRV_PCM_FMTBIT_S24_LE |
+		       SNDRV_PCM_FMTBIT_S32_LE;
+	case 8:
+		return SNDRV_PCM_FMTBIT_S8;
+	case 16:
+		return SNDRV_PCM_FMTBIT_S16_LE;
+	case 20:
+		return SNDRV_PCM_FMTBIT_S20_LE;
+	case 24:
+		return SNDRV_PCM_FMTBIT_S24_LE;
+	case 32:
+		return SNDRV_PCM_FMTBIT_S32_LE;
+	default:
+		return 0;
+	}
+}
+
+static int populate_rate_format(struct device *dev,
+				struct sdca_function_data *function,
+				struct sdca_entity *entity,
+				struct snd_soc_pcm_stream *stream)
+{
+	struct sdca_control_range *range;
+	unsigned int sample_rate, sample_width;
+	unsigned int clock_rates = 0;
+	unsigned int rates = 0;
+	u64 formats = 0;
+	int sel, i;
+
+	switch (entity->type) {
+	case SDCA_ENTITY_TYPE_IT:
+		sel = SDCA_CTL_IT_USAGE;
+		break;
+	case SDCA_ENTITY_TYPE_OT:
+		sel = SDCA_CTL_OT_USAGE;
+		break;
+	default:
+		dev_err(dev, "%s: entity type has no usage control\n",
+			entity->label);
+		return -EINVAL;
+	}
+
+	if (entity->iot.clock) {
+		range = selector_find_range(dev, entity->iot.clock,
+					    SDCA_CTL_CS_SAMPLERATEINDEX,
+					    SDCA_SAMPLERATEINDEX_NCOLS, 0);
+		if (!range)
+			return -EINVAL;
+
+		for (i = 0; i < range->rows; i++) {
+			sample_rate = sdca_range(range, SDCA_SAMPLERATEINDEX_RATE, i);
+			clock_rates |= rate_find_mask(sample_rate);
+		}
+	} else {
+		clock_rates = UINT_MAX;
+	}
+
+	range = selector_find_range(dev, entity, sel, SDCA_USAGE_NCOLS, 0);
+	if (!range)
+		return -EINVAL;
+
+	for (i = 0; i < range->rows; i++) {
+		sample_rate = sdca_range(range, SDCA_USAGE_SAMPLE_RATE, i);
+		sample_rate = rate_find_mask(sample_rate);
+
+		if (sample_rate & clock_rates) {
+			rates |= sample_rate;
+
+			sample_width = sdca_range(range, SDCA_USAGE_SAMPLE_WIDTH, i);
+			formats |= width_find_mask(sample_width);
+		}
+	}
+
+	stream->formats = formats;
+	stream->rates = rates;
+
+	return 0;
+}
+
+/**
+ * sdca_asoc_populate_dais - fill in an array of DAI drivers for a Function
+ * @dev: Pointer to the device against which allocations will be done.
+ * @function: Pointer to the Function information.
+ * @dais: Array of DAI drivers to be populated.
+ * @ops: DAI ops to be attached to each of the created DAI drivers.
+ *
+ * This function populates an array of ASoC DAI drivers from the DisCo
+ * information for a particular SDCA Function. Typically,
+ * snd_soc_asoc_count_component will be used to allocate an
+ * appropriately sized array before calling this function.
+ *
+ * Return: Returns zero on success, and a negative error code on failure.
+ */
+
+int sdca_asoc_populate_dais(struct device *dev, struct sdca_function_data *function,
+			    struct snd_soc_dai_driver *dais,
+			    const struct snd_soc_dai_ops *ops)
+{
+	int i, j;
+	int ret;
+
+	for (i = 0, j = 0; i < function->num_entities - 1; i++) {
+		struct sdca_entity *entity = &function->entities[i];
+		struct snd_soc_pcm_stream *stream;
+		const char *stream_suffix;
+
+		switch (entity->type) {
+		case SDCA_ENTITY_TYPE_IT:
+			stream = &dais[j].playback;
+			stream_suffix = "Playback";
+			break;
+		case SDCA_ENTITY_TYPE_OT:
+			stream = &dais[j].capture;
+			stream_suffix = "Capture";
+			break;
+		default:
+			continue;
+		}
+
+		if (!entity->iot.is_dataport)
+			continue;
+
+		stream->stream_name = devm_kasprintf(dev, GFP_KERNEL, "%s %s",
+						     entity->label, stream_suffix);
+		if (!stream->stream_name)
+			return -ENOMEM;
+		/* Channels will be further limited by constraints */
+		stream->channels_min = 1;
+		stream->channels_max = SDCA_MAX_CHANNEL_COUNT;
+
+		ret = populate_rate_format(dev, function, entity, stream);
+		if (ret)
+			return ret;
+
+		dais[j].id = i;
+		dais[j].name = entity->label;
+		dais[j].ops = ops;
+		j++;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_NS(sdca_asoc_populate_dais, "SND_SOC_SDCA");
+
 /**
  * sdca_asoc_populate_component - fill in a component driver for a Function
  * @dev: Pointer to the device against which allocations will be done.
@@ -1027,16 +1232,19 @@ EXPORT_SYMBOL_NS(sdca_asoc_populate_controls, "SND_SOC_SDCA");
  */
 int sdca_asoc_populate_component(struct device *dev,
 				 struct sdca_function_data *function,
-				 struct snd_soc_component_driver *component_drv)
+				 struct snd_soc_component_driver *component_drv,
+				 struct snd_soc_dai_driver **dai_drv, int *num_dai_drv,
+				 const struct snd_soc_dai_ops *ops)
 {
 	struct snd_soc_dapm_widget *widgets;
 	struct snd_soc_dapm_route *routes;
 	struct snd_kcontrol_new *controls;
-	int num_widgets, num_routes, num_controls;
+	struct snd_soc_dai_driver *dais;
+	int num_widgets, num_routes, num_controls, num_dais;
 	int ret;
 
 	ret = sdca_asoc_count_component(dev, function, &num_widgets, &num_routes,
-					&num_controls);
+					&num_controls, &num_dais);
 	if (ret)
 		return ret;
 
@@ -1052,6 +1260,10 @@ int sdca_asoc_populate_component(struct device *dev,
 	if (!controls)
 		return -ENOMEM;
 
+	dais = devm_kcalloc(dev, num_dais, sizeof(*dais), GFP_KERNEL);
+	if (!dais)
+		return -ENOMEM;
+
 	ret = sdca_asoc_populate_dapm(dev, function, widgets, routes);
 	if (ret)
 		return ret;
@@ -1060,6 +1272,10 @@ int sdca_asoc_populate_component(struct device *dev,
 	if (ret)
 		return ret;
 
+	ret = sdca_asoc_populate_dais(dev, function, dais, ops);
+	if (ret)
+		return ret;
+
 	component_drv->dapm_widgets = widgets;
 	component_drv->num_dapm_widgets = num_widgets;
 	component_drv->dapm_routes = routes;
@@ -1067,6 +1283,9 @@ int sdca_asoc_populate_component(struct device *dev,
 	component_drv->controls = controls;
 	component_drv->num_controls = num_controls;
 
+	*dai_drv = dais;
+	*num_dai_drv = num_dais;
+
 	return 0;
 }
 EXPORT_SYMBOL_NS(sdca_asoc_populate_component, "SND_SOC_SDCA");
-- 
2.39.5

