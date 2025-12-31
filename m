Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01939263F2D;
	Wed, 31 Dec 2025 10:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767178227; cv=fail; b=VapWa+be+GXFZY5j+XfLMNikjhs+UzvKoOU/xdAcl3TxyOeW8wwOMkKNc9wburj92rxVwOKelvUEdBa0ZY0PhMfxaGlS66dEwy+en5bzfcEmqPXvlIOdZVXlhy2tnpLt32flOuqYu1KWtx+6YRZlxX11Wt2sR4yP4rbLYTnYQr8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767178227; c=relaxed/simple;
	bh=TTQ+DLYSrY/R762xG2T4paia/jTgWAmAxlfZ7El3sCU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dlpM6wUV6d/Fbxew7J5WAIf19v+8Epk5kjUKu61BDd+WU7x6NEcL93I+Z7saw9cTWx9nHbWyc06udCiPFwmaOpDEcL9Ita8Kzrf4UIMNgPIc7s16nvKrNIrUFlaBpxxot59P4/Kub2JO46EHSAX/SoUNxCYsV/q97KpY44Wvjlg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=qQ7gFwUg; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=WZUV5L8B; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="qQ7gFwUg";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="WZUV5L8B"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BVAlwbd350718;
	Wed, 31 Dec 2025 04:50:12 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=Cvt1g6EAYL7EVIkfT8FeY1dt5X3Ee8JH9PlMFYsHn9w=; b=
	qQ7gFwUgYhOSj2/744OixgHfFDKAGBtPvtJfFGnxpd6GXbSD10ADeSAVXNWNGRaI
	ejSNtJQoVw6OA+ZcIJFFm6xQzf202ZHd1YiTcZKtJmxkZhymx2ett0TXCQcpeABT
	6+yrlYtMvXf1xauGIgodcYoXv2NbnjwjvMrAaFJY2yL9yXIhzC9COd3OJCZ17ikf
	myGNfXHzX/p/GgAA2Z+N1akH+unf/zQuDkmgqZo+IjWo27LU3IgFIpKLxMsvSL0S
	gklpCc5sCxFwSKjymeiHlmP08p4W5ug8Y/hQAoxQmxR7lNvbpMY3ekwZhuoP/tPa
	9MATA+ljCqw382PVVEIr6g==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11023111.outbound.protection.outlook.com [40.93.201.111])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4badr3c1q8-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 31 Dec 2025 04:50:12 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E8l06inhnc6y5I+XVYWmlgJUD4+lfHk0DUIpdicVtWnliZKUElfbGcPt1Y7t40iiE2ZzSYYcVEgn16PZRli29FFvNSgNYIF09YD+7PjNwejW6gVwkBUkgcjNN//PhBpQnTYRZRqTHHFGk0wa4N8QMK7T3+/5sbp12fRF0MhVVFvn5FtV83ZvOfg0xmB3bABpZoA9M1c4hKne0ffcc4wPnjXNqeZxgq72nLoYn7XRkQfZf9ajfR43GVDHZ2Wysj1okX8CF9gckmkVPJGJe4sIArStbhI6Ne0snY88I6nuaGxuiDtDGaA8aU4IIcyXl4a8UtsJsM1tc1qGD2dt92FJSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cvt1g6EAYL7EVIkfT8FeY1dt5X3Ee8JH9PlMFYsHn9w=;
 b=ZVYvyA0rOm9ZXlFFAvk9isQllXcujUF8QKjWjrDKcdwoIaf/GmkXgaEI5u0H0NvHrS2dYahet16PGoE9PWwQmFNHGoT/BeGiUwNZ7+/NWg6UGJ4Yg7MYlk3rQihfI0fWnzusO3QewJjg8KECdRoOkNj3un5h8uJfQygwBCYo888VdO54bkjANO66ZyAaZtl6pBWL0IOH2urzxX+SQyZNJHaAHc/+XMF2liUutVnAGTQ6gWU+peEif2AB9fSJBE0qhzwOx9WOEH0xKJcZTdaBIMLwRhPJGnSKmyIknifQtE4iXm4VEo4UJqhueWEzqKF5Ytbc7Lbmfelc+IHh42Ph0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cvt1g6EAYL7EVIkfT8FeY1dt5X3Ee8JH9PlMFYsHn9w=;
 b=WZUV5L8B0p18mSDJhtvNF6HFy3fOeSbTTl0wV3afWOF4Yx51YE0kkmAk4zJrjhYrmsT+rQ1dbCAtCtggzaB/MJUMvss3vmAk1WlWAsHdczjm962dj/hKDQdJMzAYwHp0Jz0nLLOFcDV9z6dgpbZd3SDE+N0PNEyAXmNknl1KSq8=
Received: from SN6PR01CA0009.prod.exchangelabs.com (2603:10b6:805:b6::22) by
 EA3PR19MB9566.namprd19.prod.outlook.com (2603:10b6:303:2af::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9478.4; Wed, 31 Dec 2025 10:50:08 +0000
Received: from SA2PEPF00001504.namprd04.prod.outlook.com
 (2603:10b6:805:b6:cafe::88) by SN6PR01CA0009.outlook.office365.com
 (2603:10b6:805:b6::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4 via Frontend Transport; Wed,
 31 Dec 2025 10:50:11 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SA2PEPF00001504.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4
 via Frontend Transport; Wed, 31 Dec 2025 10:50:06 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 19BA2406550;
	Wed, 31 Dec 2025 10:50:05 +0000 (UTC)
Received: from EDIN4L06LR3.ad.cirrus.com (EDIN4L06LR3.ad.cirrus.com [198.61.69.19])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id B98B6820249;
	Wed, 31 Dec 2025 10:50:04 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 4/8] firmware: cs_dsp: mock_bin: Pass offset32 to cs_dsp_mock_bin_add_raw_block()
Date: Wed, 31 Dec 2025 10:49:52 +0000
Message-ID: <20251231104956.449696-5-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251231104956.449696-1-rf@opensource.cirrus.com>
References: <20251231104956.449696-1-rf@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001504:EE_|EA3PR19MB9566:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 05d0d4e9-9489-429d-ef11-08de485a5c3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|61400799027;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Jj9vvd/lDFyZmtENDKqP40jvPYTGZVtb9uJ6NnF/UwsBFw7LDR4thifIULOE?=
 =?us-ascii?Q?8l/3kHGd0NPYHNLwUi6B70fm3fQFGRpjQ+DGFu03R1hHOG41YOy/+6o/HLx0?=
 =?us-ascii?Q?OKHdqipccC9hNW8dhCV931wdUeeNSfZApJvkusiV3QYYKM5PUglzYS6qFhuG?=
 =?us-ascii?Q?lTAt2Ylv1dZn4SElap4ZeQwQFfEfSX6XndpuhGuZHzjUDM7yTNqioasNvNvx?=
 =?us-ascii?Q?qx3ALGn7eojWFvazjZHiBM+4ZTW2Z0KMkDXApPymr1GXMS9lMNhfaDHhB1TU?=
 =?us-ascii?Q?n4hhJ0yNeuCpgP3h689aXOl4IQqvSdjCEuJWzKT/TZ66gDFW8Oj0RA+d6FCu?=
 =?us-ascii?Q?B+QsN8USSATckdTXsNxcl5e1SipUYbH1h3sjKaIeUh3vzhg/FX+OtXj2ZRdD?=
 =?us-ascii?Q?+TeFVAe8f/PNkB1LrElz3pMhdqN2djdbwr2caCNJaapMhn5Lp5osnUJER6WP?=
 =?us-ascii?Q?CVAPZqOQCoyHGV3QC9oJTozc/Fs8FofM+Ea2t+N0MGob5TtW5ph6cpOQzD+u?=
 =?us-ascii?Q?+Ej6Tmg/CkqjDAmgkdWArq6Q7zMFzZWinTf+Js7vj5Q0fi8pNl03KdRkMtrl?=
 =?us-ascii?Q?CbgiXiz0SHWuorAzomyJNlnsX4Bdn3P4kGx0rC3qZJ7S06ciY3ORQJH/gBwo?=
 =?us-ascii?Q?Yf2tyqC/rptG9kU8GO2WC68TBH211JARq6WAqS5CuhTgL1VKW6EHJ5TJ8SKs?=
 =?us-ascii?Q?U2AhNc0mMFwiOjKW8cnq0aNuTUDZeNWy+G1++T2yfiVjJI87mnw4K9DwidrK?=
 =?us-ascii?Q?m9/420PVpp231XWViHdqqxB8HzdfA+cfWzZxMzLeFMt1TSoUNu1GbWFcwfnr?=
 =?us-ascii?Q?3TCN4dT7iLDdHOdi2Kn9QfSSqCnrqLloJRylcqaMUzrTOgp45RFz7/sx1Mwn?=
 =?us-ascii?Q?xTZY7Kc+l3B3i/LMAC6kcfah00oy/ZiKYCPA1/YJ0I9QtTRaUjLhbjzvQRLX?=
 =?us-ascii?Q?myx3dwBG7aiMIaQsbe3CzWQYinp0qFAq+7v7idi0ctj/aIhDDGO41DF8Gg5K?=
 =?us-ascii?Q?WFQ9XMQjejlXhbP7FDsh7axR1nhWDIqZgwfqegcb9GsY2rG0D2eK1RP5sYap?=
 =?us-ascii?Q?WCG6yI+J58y1JwNQLQ4ykFK1aFxeRrUknT2b9yVMikmRvv2G+0VcZ6jMvC63?=
 =?us-ascii?Q?v5jS1NXhxUkrWC+L4BTO9xK6W9sARFRglZU52OxcygwgrKaAsY1K99BmYFLj?=
 =?us-ascii?Q?qzunYVfsSSUsz2X0GiSj+qhFC/u9jMrXHzprbG543n11kgrQx2zDnJIPF3vw?=
 =?us-ascii?Q?qabeghfKaFcGwGFvijE2MmDiUQiDmkWhi/tyvZDNGEwuliiFZBOzI/FYojCF?=
 =?us-ascii?Q?RlPHRf8DP+wrpyVU+1ljcetP3Ax3aodL/SONAshPvwOzZkjXBbKSuYqYXpI4?=
 =?us-ascii?Q?k2yWW7IwwQ7kYF6eVUJgP89GcfTB2LN4+uPbvxoIPBNYyq2JsR+BakvbkAP1?=
 =?us-ascii?Q?2xIFS4rjZo6pdpe0/3DnKDCK6rZ/VPoTGc9HHVmI9N82vgXNkOtGLd6E0AUE?=
 =?us-ascii?Q?qtN3Rf0iGBTHVCNxyi2wmQXz6x1hEvNY/RoifRHbNrrluxrLrPCKlTPPnyqA?=
 =?us-ascii?Q?/xktzU6rioSKW9RDPjE=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(61400799027);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Dec 2025 10:50:06.2353
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 05d0d4e9-9489-429d-ef11-08de485a5c3e
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SA2PEPF00001504.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: EA3PR19MB9566
X-Proofpoint-GUID: nx6VaR1CctSv0oL1PeQGnEA1aD3XieLz
X-Authority-Analysis: v=2.4 cv=Z8Hh3XRA c=1 sm=1 tr=0 ts=6954ffe4 cx=c_pps
 a=f+i8kFYBc78eCJt0xtd1Rg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=wP3pNCr1ah4A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=w1d2syhTAAAA:8 a=Ac3_NjksB7D9Vqi9SkkA:9
X-Proofpoint-ORIG-GUID: nx6VaR1CctSv0oL1PeQGnEA1aD3XieLz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMxMDA5NSBTYWx0ZWRfX1Vm09aIZicqA
 wU5TO3GkCIOWH6G/YASej1LocIKSGBoEGdZjG79lf6cCRqaQWXhG6cSc0g+XuHhjbZNx8Qo6h6N
 lljLYKLbmFl7yV93Y3wY5cZJo+yo8m44QBGJoePD0dkvwVRq0jujMUVduhHa9BAD6Q5ipy9yd+W
 sKmyCuefHQVeAMyh+U0Uld8VyIB2ifVo0Pt3/8G616zzzfSZkEg/o7PHKxLEDn8/Qj56Xk3FEy9
 ooiourEEiIem24Tq60Co2kt8C82FDuyNnEU+QvUzApw1BnM+yMjNGT35M+5DczI2ABOwBhzDEQf
 Ui+L1DRrWeNbQIIOVGfrJOzSzy+nyD/r97tCFO8P2IVMLl8l8bb1xd+CafyGo6lnrTUL7B8KxYZ
 VMy1tVbaYbi8EHhKO94G0WaJ4YF3bkGwZystsIlEqukr/w9tINZ3TxpwUSERYMPRIZ2yowLQgrD
 WPoOyD2L0em+TlhnLLw==
X-Proofpoint-Spam-Reason: safe

Add an argument to cs_dsp_mock_bin_add_raw_block() to pass a 32-bit
offset, and change the type of the existing offset argument to u16.

The cs_dsp_test_bin_error.c test uses cs_dsp_mock_bin_add_raw_block()
so it needs corresponding updates to pass 0 as the 32-bit offset.

Version 1 and 2 of the bin file format had a 16-bit offset on blocks
and the sample rate field of the blocks was not used. Version 3 adds
new block types that change the old sample rate field to be a 32-bit
offset with the old offset currently unused.

cs_dsp_mock_bin_add_raw_block() doesn't attempt to do any magic - its
purpose is to create a raw block exactly as specified by the calling
test code. So the test case can pass a value for both offset fields.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 drivers/firmware/cirrus/test/cs_dsp_mock_bin.c     | 10 ++++++----
 .../firmware/cirrus/test/cs_dsp_test_bin_error.c   | 14 +++++++-------
 include/linux/firmware/cirrus/cs_dsp_test_utils.h  |  2 +-
 3 files changed, 14 insertions(+), 12 deletions(-)

diff --git a/drivers/firmware/cirrus/test/cs_dsp_mock_bin.c b/drivers/firmware/cirrus/test/cs_dsp_mock_bin.c
index 3f8777ee4dc0..bc6b8651259c 100644
--- a/drivers/firmware/cirrus/test/cs_dsp_mock_bin.c
+++ b/drivers/firmware/cirrus/test/cs_dsp_mock_bin.c
@@ -56,13 +56,14 @@ EXPORT_SYMBOL_NS_GPL(cs_dsp_mock_bin_get_firmware, "FW_CS_DSP_KUNIT_TEST_UTILS")
  * @alg_id:		Algorithm ID.
  * @alg_ver:		Algorithm version.
  * @type:		Type of the block.
- * @offset:		Offset.
+ * @offset:		16-bit offset.
+ * @offset32:		32-bit offset (sample rate on V1 and V2 file formats).
  * @payload_data:	Pointer to buffer containing the payload data.
  * @payload_len_bytes:	Length of payload data in bytes.
  */
 void cs_dsp_mock_bin_add_raw_block(struct cs_dsp_mock_bin_builder *builder,
 				   unsigned int alg_id, unsigned int alg_ver,
-				   int type, unsigned int offset,
+				   int type, u16 offset, u32 offset32,
 				   const void *payload_data, size_t payload_len_bytes)
 {
 	struct wmfw_coeff_item *item;
@@ -75,6 +76,7 @@ void cs_dsp_mock_bin_add_raw_block(struct cs_dsp_mock_bin_builder *builder,
 	item = builder->write_p;
 
 	item->offset = cpu_to_le16(offset);
+	item->offset32 = cpu_to_le32(offset32);
 	item->type = cpu_to_le16(type);
 	item->id = cpu_to_le32(alg_id);
 	item->ver = cpu_to_le32(alg_ver << 8);
@@ -104,7 +106,7 @@ static void cs_dsp_mock_bin_add_name_or_info(struct cs_dsp_mock_bin_builder *bui
 		info = tmp;
 	}
 
-	cs_dsp_mock_bin_add_raw_block(builder, 0, 0, WMFW_INFO_TEXT, 0, info, info_len);
+	cs_dsp_mock_bin_add_raw_block(builder, 0, 0, WMFW_INFO_TEXT, 0, 0, info, info_len);
 	kunit_kfree(builder->test_priv->test, tmp);
 }
 
@@ -156,7 +158,7 @@ void cs_dsp_mock_bin_add_patch(struct cs_dsp_mock_bin_builder *builder,
 	KUNIT_ASSERT_EQ(builder->test_priv->test, payload_len_bytes % 4, 0);
 
 	cs_dsp_mock_bin_add_raw_block(builder, alg_id, alg_ver,
-				      mem_region, reg_addr_offset,
+				      mem_region, (u16)reg_addr_offset, 0,
 				      payload_data, payload_len_bytes);
 }
 EXPORT_SYMBOL_NS_GPL(cs_dsp_mock_bin_add_patch, "FW_CS_DSP_KUNIT_TEST_UTILS");
diff --git a/drivers/firmware/cirrus/test/cs_dsp_test_bin_error.c b/drivers/firmware/cirrus/test/cs_dsp_test_bin_error.c
index a7ec956d2724..fe0112dc3077 100644
--- a/drivers/firmware/cirrus/test/cs_dsp_test_bin_error.c
+++ b/drivers/firmware/cirrus/test/cs_dsp_test_bin_error.c
@@ -66,24 +66,24 @@ static void bin_load_with_unknown_blocks(struct kunit *test)
 	cs_dsp_mock_bin_add_raw_block(local->bin_builder,
 				      cs_dsp_bin_err_test_mock_algs[0].id,
 				      cs_dsp_bin_err_test_mock_algs[0].ver,
-				      0xf5, 0,
+				      0xf5, 0, 0,
 				      random_data, sizeof(random_data));
 	cs_dsp_mock_bin_add_raw_block(local->bin_builder,
 				      cs_dsp_bin_err_test_mock_algs[0].id,
 				      cs_dsp_bin_err_test_mock_algs[0].ver,
-				      0xf500, 0,
+				      0xf500, 0, 0,
 				      random_data, sizeof(random_data));
 	cs_dsp_mock_bin_add_raw_block(local->bin_builder,
 				      cs_dsp_bin_err_test_mock_algs[0].id,
 				      cs_dsp_bin_err_test_mock_algs[0].ver,
-				      0xc300, 0,
+				      0xc300, 0, 0,
 				      random_data, sizeof(random_data));
 
 	/* Add a single payload to be written to DSP memory */
 	cs_dsp_mock_bin_add_raw_block(local->bin_builder,
 				      cs_dsp_bin_err_test_mock_algs[0].id,
 				      cs_dsp_bin_err_test_mock_algs[0].ver,
-				      WMFW_ADSP2_YM, 0,
+				      WMFW_ADSP2_YM, 0, 0,
 				      payload_data, payload_size_bytes);
 
 	bin = cs_dsp_mock_bin_get_firmware(local->bin_builder);
@@ -277,7 +277,7 @@ static void bin_too_short_for_block_header(struct kunit *test)
 	cs_dsp_mock_bin_add_raw_block(local->bin_builder,
 				      cs_dsp_bin_err_test_mock_algs[0].id,
 				      cs_dsp_bin_err_test_mock_algs[0].ver,
-				      param->block_type, 0,
+				      param->block_type, 0, 0,
 				      NULL, 0);
 
 	bin = cs_dsp_mock_bin_get_firmware(local->bin_builder);
@@ -309,7 +309,7 @@ static void bin_too_short_for_block_payload(struct kunit *test)
 	cs_dsp_mock_bin_add_raw_block(local->bin_builder,
 				      cs_dsp_bin_err_test_mock_algs[0].id,
 				      cs_dsp_bin_err_test_mock_algs[0].ver,
-				      param->block_type, 0,
+				      param->block_type, 0, 0,
 				      payload, sizeof(payload));
 
 	bin = cs_dsp_mock_bin_get_firmware(local->bin_builder);
@@ -341,7 +341,7 @@ static void bin_block_payload_len_garbage(struct kunit *test)
 	cs_dsp_mock_bin_add_raw_block(local->bin_builder,
 				      cs_dsp_bin_err_test_mock_algs[0].id,
 				      cs_dsp_bin_err_test_mock_algs[0].ver,
-				      param->block_type, 0,
+				      param->block_type, 0, 0,
 				      &payload, sizeof(payload));
 
 	bin = cs_dsp_mock_bin_get_firmware(local->bin_builder);
diff --git a/include/linux/firmware/cirrus/cs_dsp_test_utils.h b/include/linux/firmware/cirrus/cs_dsp_test_utils.h
index 1f97764fdfd7..877fa4a496dd 100644
--- a/include/linux/firmware/cirrus/cs_dsp_test_utils.h
+++ b/include/linux/firmware/cirrus/cs_dsp_test_utils.h
@@ -126,7 +126,7 @@ struct cs_dsp_mock_bin_builder *cs_dsp_mock_bin_init(struct cs_dsp_test *priv,
 						     unsigned int fw_version);
 void cs_dsp_mock_bin_add_raw_block(struct cs_dsp_mock_bin_builder *builder,
 				   unsigned int alg_id, unsigned int alg_ver,
-				   int type, unsigned int offset,
+				   int type, u16 offset, u32 offset32,
 				   const void *payload_data, size_t payload_len_bytes);
 void cs_dsp_mock_bin_add_info(struct cs_dsp_mock_bin_builder *builder,
 			      const char *info);
-- 
2.43.0

