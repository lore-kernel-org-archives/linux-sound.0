Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A35E3570BE
	for <linux-sound@vger.kernel.org>; Fri,  5 Sep 2025 14:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757082723; cv=fail; b=hTA5DyPwdKr+a96S+0NbZu0xREleozoa9QP9G/Y7NQr1396Z/qESvdWQaBPNT9KfMxsx4oU4ipXetVtiuSmH5cM6Q4C5fK18o6CRARybcjnVdXgBnJbHUAWGiV3FI4enWPM8WIkxSCTlDU7jC46nG5/XaE/57slzqWvLCEVHUQg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757082723; c=relaxed/simple;
	bh=odoVXXousIw4dcQrT0E0HUK7mdVRa+y8D3rUHv2rqlc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NmGrdMokqsS2rq5UDKDDuaMnRpA8/dMED1damk+79EnKh5+LevBSA25MX85bht+xX1wTxGDXiVTZBMGlKe5O7SI/ff2Y1pbcdjzWOisIx3a+aaIg/zCy1KXdGKbgakhlTRaYR96WLXMj2IHHzSpABwM1yGzGbbs5lkNV3z/ttR4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=S3cvdRPg; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=I+3CH2L/; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="S3cvdRPg";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="I+3CH2L/"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 584IFjbv293708;
	Fri, 5 Sep 2025 09:31:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=Z3LWbvNjMrg1bsOZTKNtL2OpfhBUIna273GR8aF7tXI=; b=
	S3cvdRPgU9TQDekGOuiacL7BDCuwc72lnGdMNZCbB4GnUlrWA54L/Gg8gw4TKG8w
	OYt6/rG1B3fjRwBhw/Kys9lFj3cNBQiWxDse+CmI3uMUxbyQ5dB6ImQvaEyH1zzo
	+4w9fJMarntEBesyVVnefDkoJYe+8pnRlOUt81c7NMyFj2VK1XfIkacLaMYf6eMM
	1Jjn6exMI+d+g7kCJwG/n29NPiR2ey4/VHOQxM9Wm0U8eD3WVnoI9y1rW4qkABHV
	TAr8a/n74hGK/6P3/uRsbTVFFO7dxwK2Fg12dhWUaW7s/5zc8PoLGUMruQxkn+6E
	qPzFF4Yck/TIFghf/F3UOA==
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11hn2223.outbound.protection.outlook.com [52.100.173.223])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 48vensfsv9-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 05 Sep 2025 09:31:32 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xmQVNOvwVkERNK/azcisrTbMsNglgEANVbCDhmJhSCUUX0dSBHOYHaJgDA8pTObegYX3FePtcPAmjl2XX0Q6Ef3jf6AQlrkiH5C8Wcd7ZEAq6KhW3iY8RX2e//8zU7Ehe5aPcUmXJvz2IyvwWlsb6SCV7gNwVk4mGQvBpyf46AtMQTCqTDtCeBVlRHzQofmIqJB801U3W6eA/9KsrMwyZvtR6wTI0BhKWCNV+Ew5SjnrovFN6efA240Kjv4fOV/OZrNcdTKT895YPd3OR1LCxlUIJ0JE9Iw8uWIlaM/xUR5xm8A17LafYnliY+kDV4Px47B4IIHTF3b6+RTD4AP1Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z3LWbvNjMrg1bsOZTKNtL2OpfhBUIna273GR8aF7tXI=;
 b=AStko0KW9MDkudmuacZBpiCOJ5DErWsMoBGaYkq+O8tF37BG7OTKp3SUuRj43TOkdJYwqLEQ8n6sxv3tJFYft05qzpHcDX69heariFCXKCdykz8NI0K/MUQjBiegKr5hGqqAWxYtBW5GQ28pT9Y/iPZYwE0L5/ebD3PHwyn4D80QInYl/3qIyC1RGZRYqZ7L4PqGfGPEwiHgidPsclPy7I7m6utRQl6NdLSCpwExj7jse3Ufjpdl1DKneZmwzxtxoaftGiHH72aVLP5ini+Sgtncu2bv3KsijGW0WXocMWwOT9inMq9jXwq61d1g5H6TNO7rdPF+x8Np0LJOH4dBEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z3LWbvNjMrg1bsOZTKNtL2OpfhBUIna273GR8aF7tXI=;
 b=I+3CH2L/ROP8flq/v1ZSldUsW8ABI7eY7iwla5RtAPBEqrfhwUROgsvWfAlMEkHXRuCpEEuNGdlBj356u55LRhjw22CbiijOha/B6muhnuBG2dAq8GnB27if2cDBCM02NQQkBKYloS569MmYWYPtypdktf0ppMIhGaG+T3BKkDw=
Received: from SA1P222CA0158.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:3c3::18)
 by DS3PR19MB9366.namprd19.prod.outlook.com (2603:10b6:8:2da::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.17; Fri, 5 Sep
 2025 14:31:30 +0000
Received: from SA2PEPF00003AEA.namprd02.prod.outlook.com
 (2603:10b6:806:3c3:cafe::e4) by SA1P222CA0158.outlook.office365.com
 (2603:10b6:806:3c3::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.20 via Frontend Transport; Fri,
 5 Sep 2025 14:31:29 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SA2PEPF00003AEA.mail.protection.outlook.com (10.167.248.10) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.14
 via Frontend Transport; Fri, 5 Sep 2025 14:31:28 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id C19F5406545;
	Fri,  5 Sep 2025 14:31:27 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 9F1F282026C;
	Fri,  5 Sep 2025 14:31:27 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: rafael@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        shumingf@realtek.com, lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 03/15] ASoC: SDCA: Pass SoundWire slave to HID
Date: Fri,  5 Sep 2025 15:31:11 +0100
Message-ID: <20250905143123.3038716-4-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250905143123.3038716-1-ckeepax@opensource.cirrus.com>
References: <20250905143123.3038716-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AEA:EE_|DS3PR19MB9366:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: e33b4e9a-23ff-4dc7-3f85-08ddec88e705
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|34020700016|61400799027|12100799063;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?23E91Is0CMmDnjbbe0c/3VugMQCLwGD58YX0UrVRqhnPPlR6n89teCPpftbI?=
 =?us-ascii?Q?AIHQePNH0kNRXzcB7D3Lap+e4hS3C+Mx1fG4Om/3UwuMMUSleMaNJx5QIVBa?=
 =?us-ascii?Q?dsYH5G5/B45SSGxmj0c/SPziZBe48YWCAPpvNXCkUcXdvKZa/LEVDda4pt7c?=
 =?us-ascii?Q?em0SSyo3IgZM6W41GFQ2dSeyqydAK5JHG1TGc/4aklxDlTFHDWwiorP2j4wz?=
 =?us-ascii?Q?4HPaA/h9Ey7ffJVG3gqRz82mBzfnMtTLo7wv+wgV+mB65hYk+t4fSqtG4ap2?=
 =?us-ascii?Q?ibgQu1qPFM2xQictKUuqD77W1pewB/728WrO/yLqr/GU8TGkEFLXy5oB/UEA?=
 =?us-ascii?Q?I71sLWEqwPVpQYsyQdFel0ERLA/x4w2ZsZbTNYUp6m/Uco2kFh7FOBfrhF70?=
 =?us-ascii?Q?BPaMNBsLLzdLyUkzDXLcBNxARWg2XmZmdG4d9Mhuf2AKFkCj/+WomazYEsp3?=
 =?us-ascii?Q?Q76lCIip1ER27PNjJPAWNjuzv+1k54MY4a1P1nIbaxOMpL7v5Mug0uubw2SD?=
 =?us-ascii?Q?mFHzhL49C69qiG9uHhUX69ivtGQAOvQqsnyTOOm3GMQRkxQaKDZ22QUBR3dq?=
 =?us-ascii?Q?wGtOeqoqcd2A2NgwxnL2Cj2K3CWZxxc/Ao7nJ6+ajnW6gkWt9xjIRbpFRNhv?=
 =?us-ascii?Q?uCCFiHgZ5o4j5ZtdTcJeGMtEpbTH3blfmVapwR9pv1LSXaGBcW3a7x25PruS?=
 =?us-ascii?Q?lxxqScdP1BCXIH2ymo1SM01Q8hM1/GIDY05mIo0Hjh7agJtwVaPj0ZD5EABn?=
 =?us-ascii?Q?5QOhpNlrXyEc5gmLgW+CkZLv1VxR0w6ZEGLvA514vHiFt5Sw/EY9SI47P/yY?=
 =?us-ascii?Q?4ZZHE1AIRh1ayRxZtWX9H7flkwvyeISCZ9ts1JqesP2zTP0er8n8Va8DNjAD?=
 =?us-ascii?Q?rdWna2Qxa1SnFIWNkf0htjbh2m7V2pRUwhgUl5oV3cvvV1JV+XJBM1L3cnJM?=
 =?us-ascii?Q?NfJ7ApSKFxBzILdJNLki9EKmFP4ucwFQb5OseSiC4OnGZQ/oPHyDqL8OuUNB?=
 =?us-ascii?Q?jg/LWYiC7BMv4TNz4TDQBnYmMP35H9mhjqMhANU1+FIc22nQ1BAWfitVl9bY?=
 =?us-ascii?Q?AN7kjmujsrzGJ+GwZWmEQqzYOgwQ21tOAH7bdVPw7Dvzclcdtp2v9NWBEtSP?=
 =?us-ascii?Q?kuSKMlf9YLgNFeS7li7P8lkuPhCMGVonxVP1xWCaX39xjsiCjAe7/cTEfslT?=
 =?us-ascii?Q?VIRoo7n/wIyeLpbelcqPRv0rha95eyAy4bt2iMMO2ipRJIzR9EbwfCPD03mT?=
 =?us-ascii?Q?N2HO/tZrLyESP4mpokQePza4Oc2NjMCxWgNdspkJ/lUlLktDAcvlhggtVMej?=
 =?us-ascii?Q?Q4IRZR83UBNjSJ6ioXpWmyFgXaqbKgSTARO/f9HbKhsgMV+k4s2Yx/lmM/Ls?=
 =?us-ascii?Q?opEV2udrfE6V2899qXgv/X8+GnVh3X+LEFh+RZ+JL0cJ8iFfmjdgNw3iMM2l?=
 =?us-ascii?Q?U60UtgqfTIYEVrHwCAW0mt1h9CqlkryY+xiv6Ge6OT+QGsAjCoIHUD+0sBku?=
 =?us-ascii?Q?8o6n9zN3zQ4SuLOlFhQXUgWvzXTTDEfrtRyB?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(34020700016)(61400799027)(12100799063);DIR:OUT;SFP:1501;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2025 14:31:28.9311
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e33b4e9a-23ff-4dc7-3f85-08ddec88e705
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SA2PEPF00003AEA.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS3PR19MB9366
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA1MDE0MiBTYWx0ZWRfX0vLDAT3P0lP9
 Z+tcMSsxkI0oG3lHldk0BuS5YV2bxAZEgEwxNpWjUS/+z7NZwsFFN0E0/v+iClsUSb1b60Bhjut
 aJW9ld6vmZOAdmCMg8UzXNiBAxuQY5AjF8Ibt4Qw4fIE0Y3/t5ryGCrMSwvB3E3Gcv4vvaF7Aro
 OZeWLrl2PFGmdfzj9f+FXthspOsvRtbmnfpKW7nEtg0uLYl6ihFxdh9pRUq6505XJX33JGEH67C
 jhu9hhfw6ACuco+JFYSpbPmX7HY5C0X/IRzEZOVadzaxsmva1IpvkS+BjlNr3c8w3xTR96/lXy9
 aEYApNqh6QuHSpGPvj56Rl5Dw3Ly6Tk+Yy68+oSsuR+6q8+5iRJ+CMxIojS7JI=
X-Authority-Analysis: v=2.4 cv=BY/Y0qt2 c=1 sm=1 tr=0 ts=68baf444 cx=c_pps
 a=6sg/H9X2hAOIoUO5KNDVHw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=yJojWOMRYYMA:10 a=RWc_ulEos4gA:10 a=w1d2syhTAAAA:8 a=vYTRraX0v2f4IFetpCgA:9
 a=jZz-an6Pvt0H8_Yc_ROU:22
X-Proofpoint-GUID: p95bYFqXvsy71Nvr0wjjSaXnW4zcLN-X
X-Proofpoint-ORIG-GUID: p95bYFqXvsy71Nvr0wjjSaXnW4zcLN-X
X-Proofpoint-Spam-Reason: safe

The SDCA HID code can't assume that the struct device it is passed is
the SoundWire slave device. HID is represented by a Function in SDCA and
will thus likely be implemented by a child driver. Update the code to
explicitly pass in the SoundWire slave device.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
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
index 13f68f7b6dd6a..7d08e6fc93b83 100644
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
2.47.2

