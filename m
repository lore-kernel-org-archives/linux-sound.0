Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AF91369965
	for <linux-sound@vger.kernel.org>; Thu, 20 Nov 2025 15:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763652663; cv=fail; b=E+S3JcN5lj6mdXuis2kczOsyesVP0Z8rNGS0DAWEWpeztXWtvYF5oBc+JIi3mE04+oZ7WfRtY2CI14MdkcVzjJa4vGd6Z/m1PBygTO04zqTtagO3tJcgW/zxFopvR2FYD4KGad2jJmiAFn6qRzYuVaU6xrd0DKhPs0RHpnMGMSo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763652663; c=relaxed/simple;
	bh=7VC/l5jKJ6sy/A2rzP+I4TQEodCIqiXr3fP1dRfmxGQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VMWbtkSv2mVmCyYUfEFf+ajZlNgn7KX3i/nR2m4DiI4Mh1x8wKiMvCKEwf2HqJStwljULaAN7mzuwd0bpBEWpkP03VoIE9+/wQeSmLQ4r2ZhCDOTksr1G7JQGC6JN8Rdcn6oQB/5LDNavk3u5MSetDqlx3k/IqPJW2Enwya24ow=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=h3puk60O; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=MlOAbhTo; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="h3puk60O";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="MlOAbhTo"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AKCpaYJ1058789;
	Thu, 20 Nov 2025 09:30:35 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=mSYBG/4fK+KK+u7uBx9FEAPnRT2QM/ZH4Z7SYk/Yq1s=; b=
	h3puk60OGJ5Od1BiBJ8VJDOVwcw04jgmbmGt33lcd85CgBQ+k2L9dqm5rh4SReJn
	3AfpY2PPX7bR78iqKh/m4OM4D6MjwyyQxcEXW7DKv9/Hu6QusY1z1EXRoOB6nClp
	UuA7up0RDUTJErxcv0q0dfeRvoaI9FioDq+ETzsRvjTbftWfYQAKIuo1gfgMtdLi
	kI5S6/WX4vmTfnD8ZjHpKRoXeo6hWaOE5jcU/3i0rK4keLLgAA1f3UEoSm/MhDny
	hP2ZcihgYVWHkrEQAnH19AIzl+0RIfWMpcphhSKthOGOmbCOsiRfYRwyYjhaMkHX
	/nwspr4UoSisYkZCXNVUVA==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11021099.outbound.protection.outlook.com [40.93.194.99])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4ah1bmamge-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 20 Nov 2025 09:30:35 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KUJQ2NGAsrr85xeIFbE6iD9F6bWVqy/UGMP8yk/KDbhyPDgtaihue5eFeuPHbxX83fbQwiDwD8b4fBOWdnmmUAuZSNV4qp8/v5HaWYMOUPYpALzRrngrskSfhjubfGZ4wVORjAQb2wzV4hmUuYgfebyg4c60RIM4JEcnYWNTnNA1eC+Fkq8boYCpDgHaoY/ehVlwN1s+5Y3hpXIVrVYhuxWp306XwjcXSEN7FblNHp9F9vH36j3iBkKPnj75Ocoq2Kzz7LpoVXU47RPOOLvPivxKQ7boJdCPq4lmBnWAT4xi21ayx4FWB++8ZDtt49q6FstdOOEj6LWv0er02ENbLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mSYBG/4fK+KK+u7uBx9FEAPnRT2QM/ZH4Z7SYk/Yq1s=;
 b=BUQtM5oqGwxWsZgdC+i+n+Wx/93gnfpfvVqebv6L+MifOjaWY8esu1jN6Q7dZVQjPQSh5/PuIJm0I7UBFyiIDNz7JrpAxxPjHBgO/GC1fFxZHvVqATgWogU4D77C+S+mq5s7oWLy8LeBcPscV5MIvBwEKQkKlLRy/N9ygbiUO4LqkfrP2VQpvh9umKL2JDit4wBoQRIdFrUmC7J3pYtYDQCUdphmpbvAQ5tOh9bZ7OVDv78Ls4B1IMWjMQETdqhnbQziLI5ZSULqkhrtD5dEF/cCQIdjsGp/9gwArdZ4Ql5kQ+jVvEbk3PnYkBKyShbSN9yQNcJbj5sNP4QvQvkKkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mSYBG/4fK+KK+u7uBx9FEAPnRT2QM/ZH4Z7SYk/Yq1s=;
 b=MlOAbhTo674sZgA+wnlepKma7TvGXCjbkB4wI8QFlBm+stLI2oWY52RmmUUnS6trxAJa00Io+m+X6XFTQR0xBUygJPRlMSn7C+y2faMZBs7+GHVDqaTdEjV17sYbizjBZvFYAdNa3u0JgJfEoewX6sGoLqk+s6pAtUTqZ2BwPbI=
Received: from SJ0PR13CA0104.namprd13.prod.outlook.com (2603:10b6:a03:2c5::19)
 by SN7PR19MB7091.namprd19.prod.outlook.com (2603:10b6:806:2ae::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Thu, 20 Nov
 2025 15:30:30 +0000
Received: from MWH0EPF000971E9.namprd02.prod.outlook.com
 (2603:10b6:a03:2c5:cafe::6e) by SJ0PR13CA0104.outlook.office365.com
 (2603:10b6:a03:2c5::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.10 via Frontend Transport; Thu,
 20 Nov 2025 15:30:29 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 MWH0EPF000971E9.mail.protection.outlook.com (10.167.243.71) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.9
 via Frontend Transport; Thu, 20 Nov 2025 15:30:28 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id A5FF740654B;
	Thu, 20 Nov 2025 15:30:27 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 88B1382025A;
	Thu, 20 Nov 2025 15:30:27 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: vkoul@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        shumingf@realtek.com, lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v4 01/13] ASoC: SDCA: Remove duplicated module macros
Date: Thu, 20 Nov 2025 15:30:10 +0000
Message-ID: <20251120153023.2105663-2-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E9:EE_|SN7PR19MB7091:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: b353e88a-b506-4a08-20dc-08de2849bc73
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?dsueABj/oRIrqMQMAtLqIkuUkkrl16eXZhTBcUwZPXKzMyMfkxxp+M5Rv3xd?=
 =?us-ascii?Q?zj2pVsrrSS2oOx9B1naWQA0UpiOblgKFy92kT10OK4i1TqKnQi9QN0vDol2p?=
 =?us-ascii?Q?iDxnv0xpVT4HuSj9VIcUi9iI8mL2n8dZNfuDRWyficcgorYj4rEllrELlINQ?=
 =?us-ascii?Q?cruvAn9+p9RY9JpDke59K4YAUVpFUA4RHt4ULfZniNCAeNoS0buzqP0v2K8b?=
 =?us-ascii?Q?gcyuhjnE7wyYTYFZTqOZENzv7BUhWT1yN+xIGbQuavPeHL9Se2H0TrEBPr80?=
 =?us-ascii?Q?7d/fpppDEXlCoeTfXCXgxWitwzGe3m2zdg+LeEV4HCgRMtqGAQry9+HGjYNw?=
 =?us-ascii?Q?jb0IZtst1BRP7xSP9e2ZLi93Mxlc+AURURZ+ggkd8vUE08lLryNMvoT6Tekz?=
 =?us-ascii?Q?8QIB1DxHi4srpuFI6LV0YU3/AtTMUFvZTFbzWt98okYSuwtEwxWLz+Jqc2ex?=
 =?us-ascii?Q?cmT3iF733WR8FxZwnwCWuFy8NPWIBWKY1lyx1lv3N7/iKlUrwBtqeyYFN9bg?=
 =?us-ascii?Q?vjCJc2yNK6jO97Y30nOyBwXLCSjCqQVKUPmDBVCF92ipGGCspmPATrNBGciO?=
 =?us-ascii?Q?WlVxrOIIcFiXXtZDnxKGZET2GKg6HmfcSXnY9tKwSR3CXXaRL4LN1I5fKbtX?=
 =?us-ascii?Q?EC3C1JVnlAtsEK6veibLYQBRtF8+C2wOyz21NoyTZ9J7APQ9u9qnTtcVcNF7?=
 =?us-ascii?Q?RIeXdFx3dE7lYNYxm9omRWzS5D23TvCkE2RWYpiIrfKu98euCk62cEGBiebk?=
 =?us-ascii?Q?IGE0XGHXLVkSfeTKbH2JqUF1fxtlBPHTmQgishLson6269Jft4t1s4Mn/lyD?=
 =?us-ascii?Q?Lc9YDQEk+o/a5f/DA0eUVyqzxuxOI5TVKmZQxR07W5A9v1lLz7RJ1qO2Tcbi?=
 =?us-ascii?Q?atUoSYY0mim9eOsqNQcCy3+2vdU3cjX0gDLtUObDvVr0kEmblGDc2n4RXB4O?=
 =?us-ascii?Q?qfIXF2hKy0cNAyps7+UQumBAlJCnRmL6ucc7R2ZBMPG6AnuO11jVP88AcxIK?=
 =?us-ascii?Q?V+DGgVb5h3Sa3Q1QSgHW0xZVcC+vzoM+DuhmFruXI7L399VBYn95wcwyZaXj?=
 =?us-ascii?Q?xJnL6T5PeqOEUxcvYOoYT4C3R/1+KYjHrhKAaUFTIKvi+PsHpN9yoGJ1gHZz?=
 =?us-ascii?Q?8e3bxS7nSolqR2GYkhJk6/EZ656KlO+kQz56C1iXA601lYUT11VP5vOqb87x?=
 =?us-ascii?Q?SPY8A50nlAdUrPy3OdOYsn4vQDdSQhFRUFnfsyd9eL03S7+3pt/Ga69taEoz?=
 =?us-ascii?Q?6m05pwJ1fpj29WA5XIDgI69aFMO383Mha3zT5tpCdBfLvMAVuTfTc7dQQqzp?=
 =?us-ascii?Q?cicmQpYqRRMFIG3mw3O7yctJVMQpMRphffLnnq6iT558fE0c2D71s/B2c6Vt?=
 =?us-ascii?Q?WFfqjg1ZZSIis11vo8hjoieMi8z0qAv3e3b6dEr0DE/E30s+l/MUwpwPSfjp?=
 =?us-ascii?Q?JiQ/aqV72s+sqegMOnx+2lq1VqV7ujTsfKyegjTKMxQfwOY7m1u/kDvQMPSY?=
 =?us-ascii?Q?lrasABVn/32A7b4u48mGvnqsgCp1M7FKNQETCXaWAbwMEts5BIBCtFuVEX90?=
 =?us-ascii?Q?T+OHH9/YmMwO/q3zjwo=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 15:30:28.9348
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b353e88a-b506-4a08-20dc-08de2849bc73
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-MWH0EPF000971E9.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR19MB7091
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIwMDEwMiBTYWx0ZWRfX2BXPqKEFBep/
 Cvhf6eWpNrrgNmDSJjvQlntqyneUEE+lS5qb+uCPVGUuJpeeiIth0pcDzB1D2fVaTNhwFJMfLad
 G64y8e77RICuuspJWu6JtoaPepkS4LuhiI6tjbTkdFxzVoS0FmLXfZ6yYoJKqnCHls3JLGqk5G7
 WNehhHNYrkhl9MaCJLLUuXLfT6ytWFklQrQCLLEC2gpcq64NXsBBaMzcPeg2QaQXNnNb/6fkfWa
 TveYbNuGclZLOv3yOBJ3wCctASJUtHk1z+eldZg8No306mLwxV4ehS+hbJAbV1Ts9Io+DNvlcy2
 88XHbz/gyvS2a8/9bb8NJ3QjYR/y9R5CsGc3JhAxp/1r8O+xersqM6Ld1zIXbJVXawli6Oa49uY
 C0dn9aF575wpDo3yKHBpBjcoH2VV8Q==
X-Authority-Analysis: v=2.4 cv=XcmEDY55 c=1 sm=1 tr=0 ts=691f341b cx=c_pps
 a=MAB4nyKqAzWELJb2TLvteg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=6UeiqGixMTsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=QyXUC8HyAAAA:8 a=w1d2syhTAAAA:8
 a=1sz-E215ex2bfD2ZWG0A:9
X-Proofpoint-GUID: eqGckUCKo9ueqeSUujt9rRiMMoeCwJ-i
X-Proofpoint-ORIG-GUID: eqGckUCKo9ueqeSUujt9rRiMMoeCwJ-i
X-Proofpoint-Spam-Reason: safe

Both HID and the IRQ are now build into the wider SDCA kernel module, so
their module macros are redundant, remove them.

Fixes: 5030abcb0aa3 ("ASoC: SDCA: Pull HID and IRQ into the primary SDCA module")
Tested-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Maciej Strozek <mstrozek@opensource.cirrus.com>
Reviewed-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Tested-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No changes since v3.

 sound/soc/sdca/sdca_hid.c        | 3 ---
 sound/soc/sdca/sdca_interrupts.c | 3 ---
 2 files changed, 6 deletions(-)

diff --git a/sound/soc/sdca/sdca_hid.c b/sound/soc/sdca/sdca_hid.c
index ad53207b0d62b..abbd56a3d2971 100644
--- a/sound/soc/sdca/sdca_hid.c
+++ b/sound/soc/sdca/sdca_hid.c
@@ -166,6 +166,3 @@ int sdca_hid_process_report(struct sdca_interrupt *interrupt)
 	return 0;
 }
 EXPORT_SYMBOL_NS(sdca_hid_process_report, "SND_SOC_SDCA");
-
-MODULE_LICENSE("Dual BSD/GPL");
-MODULE_DESCRIPTION("SDCA HID library");
diff --git a/sound/soc/sdca/sdca_interrupts.c b/sound/soc/sdca/sdca_interrupts.c
index 5176460416bbe..a18ec9dd3398b 100644
--- a/sound/soc/sdca/sdca_interrupts.c
+++ b/sound/soc/sdca/sdca_interrupts.c
@@ -618,6 +618,3 @@ struct sdca_interrupt_info *sdca_irq_allocate(struct device *sdev,
 	return info;
 }
 EXPORT_SYMBOL_NS_GPL(sdca_irq_allocate, "SND_SOC_SDCA");
-
-MODULE_LICENSE("GPL");
-MODULE_DESCRIPTION("SDCA IRQ library");
-- 
2.47.3

