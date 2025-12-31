Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 150FA2882C5;
	Wed, 31 Dec 2025 11:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767179813; cv=fail; b=NZ1P7PNqb0GzRZKaEX2tCwuGwJUqffvdQZlz22YhDEWF0SFobMm49KZkhtgUyxA0FhvFqrUkXJS8SHVt/euj4AqUrMNxoSFPMwlLbtTSLeQzSLLzTS/Q60fyQRIXo4JRExSHiz/sI3fQx4lWm4IVMmQjksoJ8Nw8/wbUmfqMGtg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767179813; c=relaxed/simple;
	bh=7TRFzBlXZ/HkuxDSn1F8ct9ojSpcKC/dyZU0tUE2m+Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=n2skSAUO268C2y1Ta2cUA0nQsHk0hlzTUy5OZItKs6Ra3FlXvgTPBcQIJZriADKBjLYPhQpHAXl9ko+XQpEk0pxFAE5QYHZSlGRaX0kVIC1PnuQEMxni6QzmFRPIJEc71k7oLNWH1FApe1OTy7kmsqcxE3OexJbcKiixMcd6VDs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=JjIqFAgU; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=kRoC9LHN; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="JjIqFAgU";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="kRoC9LHN"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BVAg2uZ3726978;
	Wed, 31 Dec 2025 04:50:13 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=giPPbCfc+mydGx2LN2Uf1vYqo04E27vDYmmqp7pdVb4=; b=
	JjIqFAgULZzQ1JHz7zjYqxiSpZQXoEZNWV4wtOYfOCfFm05ovbFIEfIGrC7IW8e+
	L371y4MQnIjOalYn4DNow5apAE2+TA/NBH1XjhVlB6dKh2YurRXPGRy0TBB5C7H5
	utz9TNiwQ7J+b6II1LxEhrZbWbEN1VF7nQOqywxOBdb9CoI/GIzFUjdSM2VmN3oX
	Y4e+dlTFJnISRVeWfxBIvakg0pT6U2dC30+3wg+J2QUmTI007pV+yIPi97+bJTuN
	SX9Mhkb1C2uNbfGTovF/NCdQ9HhJX+f9dX9I9CflGwEzlsREI+lIWh4rzcse75nl
	7S7tWHyzRPJUxBwFZQcMrg==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11020124.outbound.protection.outlook.com [52.101.85.124])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4bacrmv3yu-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 31 Dec 2025 04:50:13 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wTFV9/+ngUkF6vcazDD0B5YxLGnauPVe9BfZCPMXSNf4Jqq/6aiu3Gr8haiJKGEOXQi69XJu9aNTGq8xqLeAvps9MHf4yXlY/mEYqGyH8zeO2PhoEEgGCZddSLc0cM6gaMicj8warUEgPQHs1wSMxxmNTU/baP32syqBN8YB9AY2C17uGdB+niwVZohhja+HR6tPDHFPaY3j/uKKp6INbpPK5cQn5xlw0l5I5k+4R5SB9QTDptC28bzENSbkDQAgV98D8rklUMjRZ2ISgCJW5RxNvQPXUr5R+qLE0gvEhHQ/zLN0i9lAb80TnlDjaPdje1okZR7phnSDzEaNMEiy2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=giPPbCfc+mydGx2LN2Uf1vYqo04E27vDYmmqp7pdVb4=;
 b=lVTz7wwnoJxlUnsnmDQurJEXvJBup9Ov6xIA2f7e4F79XwXn74Kq0krrPaD7BxaLPW7rDh3Yyfz6Iyhnfzgbc/qD0EmAc6bkDjgaSBk7YHeRmE9wXEJTz03nKRLMTxRD50tWNmMn4QqP1Z0DSE7CU4A/Vz3l46Ko4zYRiCTUicQrIh4A1LtDKLQOGO7cmVsbQCnCJnlxKrNeNW/xae1CeZUj0rQ4g++BTL2db49ADhd/QJMdOsjPXedEQBj0lP8rYnnGEVdiMLYLZcDkNAOLwq+Nhh9K9SxJiMc5rYpxMVpe2lS/SkKiIgMPH4iD4pA+gEMEOGYlINeOlqpv5gDsPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=giPPbCfc+mydGx2LN2Uf1vYqo04E27vDYmmqp7pdVb4=;
 b=kRoC9LHNBbLIv2HwHuO8g+1cQNjb76w+HLzW3SDNJd0EHOFSHb7zeixLrKTDdgcRnBW2sDIUXoOGLF9kDyoQiPdDbehreOseY45KmxowwhtMJJVjwz7lYyu0I6TWNfwmX/qnihZE1jImosHpwQBovoUmKO8vaNDhYPFxd5dkRkI=
Received: from SA0PR12CA0030.namprd12.prod.outlook.com (2603:10b6:806:6f::35)
 by DM4PR19MB5713.namprd19.prod.outlook.com (2603:10b6:8:5c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Wed, 31 Dec
 2025 10:50:06 +0000
Received: from SA2PEPF00001506.namprd04.prod.outlook.com
 (2603:10b6:806:6f:cafe::88) by SA0PR12CA0030.outlook.office365.com
 (2603:10b6:806:6f::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4 via Frontend Transport; Wed,
 31 Dec 2025 10:50:05 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SA2PEPF00001506.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4
 via Frontend Transport; Wed, 31 Dec 2025 10:50:06 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id A9F9A40654A;
	Wed, 31 Dec 2025 10:50:04 +0000 (UTC)
Received: from EDIN4L06LR3.ad.cirrus.com (EDIN4L06LR3.ad.cirrus.com [198.61.69.19])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 995F9820249;
	Wed, 31 Dec 2025 10:50:03 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 3/8] firmware: cs_dsp: test_bin: Make patch function a test parameter
Date: Wed, 31 Dec 2025 10:49:51 +0000
Message-ID: <20251231104956.449696-4-rf@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF00001506:EE_|DM4PR19MB5713:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: e8c05aff-35fd-4bee-8049-08de485a5c31
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|61400799027;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?kFOQ7Q0DO3QAF7ehJgwJPbd3kGyrXCtKpDnHAYDLk0zUxz7DAdDEoJLlTuDQ?=
 =?us-ascii?Q?WueGxN9HaRnq4T+1fNwnDFM3MGAH88uINuCHTKT/sdiWv1FuNHWoR2L8KrMB?=
 =?us-ascii?Q?IsZGlf3klmJZr7idPCmPUYE0CpnduP9D0Q5cr9B788B4SKyEcofsAL4z8sws?=
 =?us-ascii?Q?gkijx2v9kKYJq4bjKncLUbK3oQJvuczT21G+KCOPv2Lc0CSswvfHImbEeuVi?=
 =?us-ascii?Q?E13P5/bZyOdE4aYycmUvivD32F2Qc8yjc/9D0UlqZfuIiKfeuyWo1SLG34TW?=
 =?us-ascii?Q?l9981ELEzMDw0qiluMu6bvX5XD3VHK0bLN7INrlU/hkbUwvjHWDWOSDhhnfc?=
 =?us-ascii?Q?ygrh6d4NmWbiwPbZfWBvgLiiREuGrCwBB5hSl7cVB7vRMGRcjlg3yDX692B9?=
 =?us-ascii?Q?893/Vn652srz1jYmBLzL9wDOKzrbbRcWrDTqZk0E2nno0GRqEpeBicjCteBR?=
 =?us-ascii?Q?RcsKrLVAgvUWedYsCASGU2t0fBuvkJqCwq+Nsf+GjSJYdpK06IYm1nxdZD2q?=
 =?us-ascii?Q?PODfNZdXg+yNCvmz5HoFkQigZwfz6EzTibRrxowIAtFDEKaoaJaPbNFZVVRA?=
 =?us-ascii?Q?rhQ3aCIRa/BeqaGU7XU3ttiRr9EhCulog/ZkXVVcLDrV2b1NHv/0g6JVIkhL?=
 =?us-ascii?Q?cd5WBBKHv0wTHpGQdPQg832Lc5WyNl8jQ11bfXePEs7SDIRRBVlSSv3liViw?=
 =?us-ascii?Q?wAWpcglEZ5aBgndyGMZ4XJtnWz3x52m4V3xTqfuK0IaJOCBXi9QaQ9qPCbN9?=
 =?us-ascii?Q?Dd83GxAagrguRO1zDtBariG1OCBCXn6ukW96/Ajhyp8XZEP+IMqtICMqICEC?=
 =?us-ascii?Q?lqLgBFefxaiObsrYm9KRnqLQhCTzd5sWCmKPSo3PjO7VO4Y/cjucsXFTNnoK?=
 =?us-ascii?Q?tGLgDX60tb0Ti0FfCicOVpvFgFK+aQQ5fZgLL8dgLhmXuu9ZQTSk1nnkqAC8?=
 =?us-ascii?Q?/Nl361Do6iZmtob0S442aucV7Vckm2HC133USKLdX9B2ZgZDRRel6x0jMnox?=
 =?us-ascii?Q?nPq/vXxR8O0YyY35gzXsc9LT8+cKHt9bSuLPszSEYmn0ravrPoKBycSanrjg?=
 =?us-ascii?Q?MEHRJSHLKpnF8U7oPRyOelrdiLw06P+JmvDFBXNvD4NZKRixhjOzGUPKCIOg?=
 =?us-ascii?Q?o6NlhDZlX5OOZz0jjGe3/EeKGCTk32Fo/fxQ4JBZ/e6tYJx867xISBhrmw78?=
 =?us-ascii?Q?qAsRvg56c3jBky1yjGkhewsgIw2zq9XfwCHuvSsm1ojr3VlzYe/r6MIviDrR?=
 =?us-ascii?Q?B93nQzYXS8NeoSEDMxR8En4Bm7LnJ6JSJgX5j1HNz0g9MGeokaQizrikLzCx?=
 =?us-ascii?Q?KqhbDBgxIvCQSUMNzURdGHExhwwoMNXZfum9pNJW1vAZIYgwhbLNArcWnOUC?=
 =?us-ascii?Q?WUURhqWu5YW6jZ0OGff5MdSiW0t7pDt3WLBw3Lys23t6umPjTnuIrKpdRi4X?=
 =?us-ascii?Q?DMRwXL8d3m6ifmwS6keEmJdVAr/WrQHuea49/yB2OzSXF7aKxKG0/R/aHT8Y?=
 =?us-ascii?Q?iaESysAm6IFVmhFVrx9AuEh7Ruk7CXB7AEOweiDaHSNNuGSOPz61Vp0/5iYg?=
 =?us-ascii?Q?5HNeFIEMye60UeXyvGk=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(61400799027);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Dec 2025 10:50:06.1340
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e8c05aff-35fd-4bee-8049-08de485a5c31
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SA2PEPF00001506.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR19MB5713
X-Proofpoint-GUID: A9S95uUmiZFQkOJYZF8r85wNFJgAlFc6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMxMDA5NSBTYWx0ZWRfX04N5f6vejzHu
 icbZ5lmNLzdZw1gwqz7zmXLxGC4z1bw5ixjpHCXxRH6JHuH8jbO+OQVwJZBk9zZZzyqY7a46a5E
 j5h9AS3ZKQKbCDCos32IaoA6TodqtgI3OvEZL8xuDLkZZ297SiYVFc6B8ChcW435ychDCpK9OV/
 +xQ9uSTFNefANqZGKESXAcE+AriRUFORY82w+9U6LtcEh9uwBdxY33TgeVFYmpl7b57i4iNiChJ
 uQLpmYbdaqSeMqqwR2VK116QnZXA54liIa/z2FScUKBrCpF6n+JAdsHbxjKik0i3pGs6jii7jeU
 B4QldKwfXvAXSPfi1taIHwIbHOI3Zf51ribJ6EeoVdGtOkDs4gAMmBZsSZ40EU+0C18n+yaS5RM
 rTEqdV0IWbxKZjtaeO0CSHOmEi+zSk+bVglQwEIS7NtIhSbHoKKIFYU7RvDBzDXlRztNxU4on6Y
 VFnnbOcj2BkApYrTX+w==
X-Authority-Analysis: v=2.4 cv=bJgb4f+Z c=1 sm=1 tr=0 ts=6954ffe5 cx=c_pps
 a=EXmEQszPLboQ/+r5oOSQfg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=wP3pNCr1ah4A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=w1d2syhTAAAA:8 a=5SG3a8Kso9AvpaViJGUA:9
X-Proofpoint-ORIG-GUID: A9S95uUmiZFQkOJYZF8r85wNFJgAlFc6
X-Proofpoint-Spam-Reason: safe

Make the call to cs_dsp_mock_bin_add_patch() a function pointer in
the test case parameters, instead of calling it directly.

This is to allow for future parameterization by which function to
call to add a patch.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 .../firmware/cirrus/test/cs_dsp_test_bin.c    | 708 +++++++++---------
 1 file changed, 357 insertions(+), 351 deletions(-)

diff --git a/drivers/firmware/cirrus/test/cs_dsp_test_bin.c b/drivers/firmware/cirrus/test/cs_dsp_test_bin.c
index 4532a7e9833a..7f53fa9964c4 100644
--- a/drivers/firmware/cirrus/test/cs_dsp_test_bin.c
+++ b/drivers/firmware/cirrus/test/cs_dsp_test_bin.c
@@ -69,6 +69,10 @@ struct bin_test_param {
 	int mem_type;
 	unsigned int offset_words;
 	int alg_idx;
+	void (*add_patch)(struct cs_dsp_mock_bin_builder *builder,
+			  unsigned int alg_id, unsigned int alg_ver,
+			  int mem_region, unsigned int reg_addr_offset,
+			  const void *payload_data, size_t payload_len_bytes);
 };
 
 static const struct cs_dsp_mock_alg_def bin_test_mock_algs[] = {
@@ -128,12 +132,12 @@ static void bin_patch_one_word(struct kunit *test)
 							bin_test_mock_algs[param->alg_idx].id,
 							param->mem_type);
 
-	cs_dsp_mock_bin_add_patch(priv->local->bin_builder,
-				  bin_test_mock_algs[param->alg_idx].id,
-				  bin_test_mock_algs[param->alg_idx].ver,
-				  param->mem_type,
-				  param->offset_words * reg_inc_per_word,
-				  &payload_data, sizeof(payload_data));
+	param->add_patch(priv->local->bin_builder,
+			 bin_test_mock_algs[param->alg_idx].id,
+			 bin_test_mock_algs[param->alg_idx].ver,
+			 param->mem_type,
+			 param->offset_words * reg_inc_per_word,
+			 &payload_data, sizeof(payload_data));
 
 	fw = cs_dsp_mock_bin_get_firmware(priv->local->bin_builder);
 	KUNIT_ASSERT_EQ(test,
@@ -177,12 +181,12 @@ static void bin_patch_one_multiword(struct kunit *test)
 							bin_test_mock_algs[param->alg_idx].id,
 							param->mem_type);
 
-	cs_dsp_mock_bin_add_patch(priv->local->bin_builder,
-				  bin_test_mock_algs[param->alg_idx].id,
-				  bin_test_mock_algs[param->alg_idx].ver,
-				  param->mem_type,
-				  param->offset_words * reg_inc_per_word,
-				  payload_data, sizeof(payload_data));
+	param->add_patch(priv->local->bin_builder,
+			 bin_test_mock_algs[param->alg_idx].id,
+			 bin_test_mock_algs[param->alg_idx].ver,
+			 param->mem_type,
+			 param->offset_words * reg_inc_per_word,
+			 payload_data, sizeof(payload_data));
 
 	fw = cs_dsp_mock_bin_get_firmware(priv->local->bin_builder);
 	KUNIT_ASSERT_EQ(test,
@@ -228,12 +232,12 @@ static void bin_patch_multi_oneword(struct kunit *test)
 
 	/* Add one payload per word */
 	for (i = 0; i < ARRAY_SIZE(payload_data); ++i) {
-		cs_dsp_mock_bin_add_patch(priv->local->bin_builder,
-					  bin_test_mock_algs[param->alg_idx].id,
-					  bin_test_mock_algs[param->alg_idx].ver,
-					  param->mem_type,
-					  (param->offset_words + i) * reg_inc_per_word,
-					  &payload_data[i], sizeof(payload_data[i]));
+		param->add_patch(priv->local->bin_builder,
+				 bin_test_mock_algs[param->alg_idx].id,
+				 bin_test_mock_algs[param->alg_idx].ver,
+				 param->mem_type,
+				 (param->offset_words + i) * reg_inc_per_word,
+				 &payload_data[i], sizeof(payload_data[i]));
 	}
 
 	fw = cs_dsp_mock_bin_get_firmware(priv->local->bin_builder);
@@ -285,13 +289,13 @@ static void bin_patch_multi_oneword_unordered(struct kunit *test)
 
 	/* Add one payload per word */
 	for (i = 0; i < ARRAY_SIZE(word_order); ++i) {
-		cs_dsp_mock_bin_add_patch(priv->local->bin_builder,
-					  bin_test_mock_algs[param->alg_idx].id,
-					  bin_test_mock_algs[param->alg_idx].ver,
-					  param->mem_type,
-					  (param->offset_words + word_order[i]) *
-					  reg_inc_per_word,
-					  &payload_data[word_order[i]], sizeof(payload_data[0]));
+		param->add_patch(priv->local->bin_builder,
+				 bin_test_mock_algs[param->alg_idx].id,
+				 bin_test_mock_algs[param->alg_idx].ver,
+				 param->mem_type,
+				 (param->offset_words + word_order[i]) *
+				 reg_inc_per_word,
+				 &payload_data[word_order[i]], sizeof(payload_data[0]));
 	}
 
 	fw = cs_dsp_mock_bin_get_firmware(priv->local->bin_builder);
@@ -346,12 +350,12 @@ static void bin_patch_multi_oneword_sparse_unordered(struct kunit *test)
 
 	/* Add one payload per word */
 	for (i = 0; i < ARRAY_SIZE(word_offsets); ++i) {
-		cs_dsp_mock_bin_add_patch(priv->local->bin_builder,
-					  bin_test_mock_algs[param->alg_idx].id,
-					  bin_test_mock_algs[param->alg_idx].ver,
-					  param->mem_type,
-					  word_offsets[i] * reg_inc_per_word,
-					  &payload_data[i], sizeof(payload_data[i]));
+		param->add_patch(priv->local->bin_builder,
+				 bin_test_mock_algs[param->alg_idx].id,
+				 bin_test_mock_algs[param->alg_idx].ver,
+				 param->mem_type,
+				 word_offsets[i] * reg_inc_per_word,
+				 &payload_data[i], sizeof(payload_data[i]));
 	}
 
 	fw = cs_dsp_mock_bin_get_firmware(priv->local->bin_builder);
@@ -413,27 +417,27 @@ static void bin_patch_one_word_multiple_mems(struct kunit *test)
 	}
 
 	/* Add words to XM, YM and ZM */
-	cs_dsp_mock_bin_add_patch(priv->local->bin_builder,
-				  bin_test_mock_algs[param->alg_idx].id,
-				  bin_test_mock_algs[param->alg_idx].ver,
-				  WMFW_ADSP2_XM,
-				  param->offset_words * reg_inc_per_word,
-				  &payload_data[0], sizeof(payload_data[0]));
+	param->add_patch(priv->local->bin_builder,
+			 bin_test_mock_algs[param->alg_idx].id,
+			 bin_test_mock_algs[param->alg_idx].ver,
+			 WMFW_ADSP2_XM,
+			 param->offset_words * reg_inc_per_word,
+			 &payload_data[0], sizeof(payload_data[0]));
 
-	cs_dsp_mock_bin_add_patch(priv->local->bin_builder,
-				  bin_test_mock_algs[param->alg_idx].id,
-				  bin_test_mock_algs[param->alg_idx].ver,
-				  WMFW_ADSP2_YM,
-				  param->offset_words * reg_inc_per_word,
-				  &payload_data[1], sizeof(payload_data[1]));
+	param->add_patch(priv->local->bin_builder,
+			 bin_test_mock_algs[param->alg_idx].id,
+			 bin_test_mock_algs[param->alg_idx].ver,
+			 WMFW_ADSP2_YM,
+			 param->offset_words * reg_inc_per_word,
+			 &payload_data[1], sizeof(payload_data[1]));
 
 	if (cs_dsp_mock_has_zm(priv)) {
-		cs_dsp_mock_bin_add_patch(priv->local->bin_builder,
-					  bin_test_mock_algs[param->alg_idx].id,
-					  bin_test_mock_algs[param->alg_idx].ver,
-					  WMFW_ADSP2_ZM,
-					  param->offset_words * reg_inc_per_word,
-					  &payload_data[2], sizeof(payload_data[2]));
+		param->add_patch(priv->local->bin_builder,
+				 bin_test_mock_algs[param->alg_idx].id,
+				 bin_test_mock_algs[param->alg_idx].ver,
+				 WMFW_ADSP2_ZM,
+				 param->offset_words * reg_inc_per_word,
+				 &payload_data[2], sizeof(payload_data[2]));
 	}
 
 	fw = cs_dsp_mock_bin_get_firmware(priv->local->bin_builder);
@@ -502,12 +506,12 @@ static void bin_patch_one_word_multiple_algs(struct kunit *test)
 	for (i = 0; i < ARRAY_SIZE(bin_test_mock_algs); ++i) {
 		reg_inc_per_word = cs_dsp_mock_reg_addr_inc_per_unpacked_word(priv);
 
-		cs_dsp_mock_bin_add_patch(priv->local->bin_builder,
-					  bin_test_mock_algs[i].id,
-					  bin_test_mock_algs[i].ver,
-					  param->mem_type,
-					  param->offset_words * reg_inc_per_word,
-					  &payload_data[i], sizeof(payload_data[i]));
+		param->add_patch(priv->local->bin_builder,
+				 bin_test_mock_algs[i].id,
+				 bin_test_mock_algs[i].ver,
+				 param->mem_type,
+				 param->offset_words * reg_inc_per_word,
+				 &payload_data[i], sizeof(payload_data[i]));
 	}
 
 	fw = cs_dsp_mock_bin_get_firmware(priv->local->bin_builder);
@@ -565,12 +569,12 @@ static void bin_patch_one_word_multiple_algs_unordered(struct kunit *test)
 		alg_idx = alg_order[i];
 		reg_inc_per_word = cs_dsp_mock_reg_addr_inc_per_unpacked_word(priv);
 
-		cs_dsp_mock_bin_add_patch(priv->local->bin_builder,
-					  bin_test_mock_algs[alg_idx].id,
-					  bin_test_mock_algs[alg_idx].ver,
-					  param->mem_type,
-					  param->offset_words * reg_inc_per_word,
-					  &payload_data[i], sizeof(payload_data[i]));
+		param->add_patch(priv->local->bin_builder,
+				 bin_test_mock_algs[alg_idx].id,
+				 bin_test_mock_algs[alg_idx].ver,
+				 param->mem_type,
+				 param->offset_words * reg_inc_per_word,
+				 &payload_data[i], sizeof(payload_data[i]));
 	}
 
 	fw = cs_dsp_mock_bin_get_firmware(priv->local->bin_builder);
@@ -628,12 +632,12 @@ static void bin_patch_1_packed(struct kunit *test)
 	patch_pos_words = round_up(alg_base_words + param->offset_words, 4);
 	patch_pos_in_packed_regs = _num_words_to_num_packed_regs(patch_pos_words);
 
-	cs_dsp_mock_bin_add_patch(priv->local->bin_builder,
-				  bin_test_mock_algs[param->alg_idx].id,
-				  bin_test_mock_algs[param->alg_idx].ver,
-				  param->mem_type,
-				  (patch_pos_in_packed_regs - alg_base_in_packed_regs) * 4,
-				  packed_payload, sizeof(packed_payload));
+	param->add_patch(priv->local->bin_builder,
+			 bin_test_mock_algs[param->alg_idx].id,
+			 bin_test_mock_algs[param->alg_idx].ver,
+			 param->mem_type,
+			 (patch_pos_in_packed_regs - alg_base_in_packed_regs) * 4,
+			 packed_payload, sizeof(packed_payload));
 
 	fw = cs_dsp_mock_bin_get_firmware(priv->local->bin_builder);
 	KUNIT_ASSERT_EQ(test,
@@ -688,20 +692,20 @@ static void bin_patch_1_packed_1_single_trailing(struct kunit *test)
 	patch_pos_in_packed_regs = _num_words_to_num_packed_regs(patch_pos_words);
 
 	/* Patch packed block */
-	cs_dsp_mock_bin_add_patch(priv->local->bin_builder,
-				  bin_test_mock_algs[param->alg_idx].id,
-				  bin_test_mock_algs[param->alg_idx].ver,
-				  param->mem_type,
-				  (patch_pos_in_packed_regs - alg_base_in_packed_regs) * 4,
-				  &packed_payload, sizeof(packed_payload));
+	param->add_patch(priv->local->bin_builder,
+			 bin_test_mock_algs[param->alg_idx].id,
+			 bin_test_mock_algs[param->alg_idx].ver,
+			 param->mem_type,
+			 (patch_pos_in_packed_regs - alg_base_in_packed_regs) * 4,
+			 &packed_payload, sizeof(packed_payload));
 
 	/* ... and the unpacked word following that */
-	cs_dsp_mock_bin_add_patch(priv->local->bin_builder,
-				  bin_test_mock_algs[param->alg_idx].id,
-				  bin_test_mock_algs[param->alg_idx].ver,
-				  unpacked_mem_type,
-				  ((patch_pos_words + 4) - alg_base_words) * 4,
-				  unpacked_payload, sizeof(unpacked_payload));
+	param->add_patch(priv->local->bin_builder,
+			 bin_test_mock_algs[param->alg_idx].id,
+			 bin_test_mock_algs[param->alg_idx].ver,
+			 unpacked_mem_type,
+			 ((patch_pos_words + 4) - alg_base_words) * 4,
+			 unpacked_payload, sizeof(unpacked_payload));
 
 	fw = cs_dsp_mock_bin_get_firmware(priv->local->bin_builder);
 	KUNIT_ASSERT_EQ(test,
@@ -768,27 +772,27 @@ static void bin_patch_1_packed_2_single_trailing(struct kunit *test)
 	patch_pos_in_packed_regs = _num_words_to_num_packed_regs(patch_pos_words);
 
 	/* Patch packed block */
-	cs_dsp_mock_bin_add_patch(priv->local->bin_builder,
-				  bin_test_mock_algs[param->alg_idx].id,
-				  bin_test_mock_algs[param->alg_idx].ver,
-				  param->mem_type,
-				  (patch_pos_in_packed_regs - alg_base_in_packed_regs) * 4,
-				  &packed_payload, sizeof(packed_payload));
+	param->add_patch(priv->local->bin_builder,
+			 bin_test_mock_algs[param->alg_idx].id,
+			 bin_test_mock_algs[param->alg_idx].ver,
+			 param->mem_type,
+			 (patch_pos_in_packed_regs - alg_base_in_packed_regs) * 4,
+			 &packed_payload, sizeof(packed_payload));
 
 	/* ... and the unpacked words following that */
-	cs_dsp_mock_bin_add_patch(priv->local->bin_builder,
-				  bin_test_mock_algs[param->alg_idx].id,
-				  bin_test_mock_algs[param->alg_idx].ver,
-				  unpacked_mem_type,
-				  ((patch_pos_words + 4) - alg_base_words) * 4,
-				  &unpacked_payloads[0], sizeof(unpacked_payloads[0]));
+	param->add_patch(priv->local->bin_builder,
+			 bin_test_mock_algs[param->alg_idx].id,
+			 bin_test_mock_algs[param->alg_idx].ver,
+			 unpacked_mem_type,
+			 ((patch_pos_words + 4) - alg_base_words) * 4,
+			 &unpacked_payloads[0], sizeof(unpacked_payloads[0]));
 
-	cs_dsp_mock_bin_add_patch(priv->local->bin_builder,
-				  bin_test_mock_algs[param->alg_idx].id,
-				  bin_test_mock_algs[param->alg_idx].ver,
-				  unpacked_mem_type,
-				  ((patch_pos_words + 5) - alg_base_words) * 4,
-				  &unpacked_payloads[1], sizeof(unpacked_payloads[1]));
+	param->add_patch(priv->local->bin_builder,
+			 bin_test_mock_algs[param->alg_idx].id,
+			 bin_test_mock_algs[param->alg_idx].ver,
+			 unpacked_mem_type,
+			 ((patch_pos_words + 5) - alg_base_words) * 4,
+			 &unpacked_payloads[1], sizeof(unpacked_payloads[1]));
 
 	fw = cs_dsp_mock_bin_get_firmware(priv->local->bin_builder);
 	KUNIT_ASSERT_EQ(test,
@@ -857,34 +861,34 @@ static void bin_patch_1_packed_3_single_trailing(struct kunit *test)
 	patch_pos_in_packed_regs = _num_words_to_num_packed_regs(patch_pos_words);
 
 	/* Patch packed block */
-	cs_dsp_mock_bin_add_patch(priv->local->bin_builder,
-				  bin_test_mock_algs[param->alg_idx].id,
-				  bin_test_mock_algs[param->alg_idx].ver,
-				  param->mem_type,
-				  (patch_pos_in_packed_regs - alg_base_in_packed_regs) * 4,
-				  &packed_payload, sizeof(packed_payload));
+	param->add_patch(priv->local->bin_builder,
+			 bin_test_mock_algs[param->alg_idx].id,
+			 bin_test_mock_algs[param->alg_idx].ver,
+			 param->mem_type,
+			 (patch_pos_in_packed_regs - alg_base_in_packed_regs) * 4,
+			 &packed_payload, sizeof(packed_payload));
 
 	/* ... and the unpacked words following that */
-	cs_dsp_mock_bin_add_patch(priv->local->bin_builder,
-				  bin_test_mock_algs[param->alg_idx].id,
-				  bin_test_mock_algs[param->alg_idx].ver,
-				  unpacked_mem_type,
-				  ((patch_pos_words + 4) - alg_base_words) * 4,
-				  &unpacked_payloads[0], sizeof(unpacked_payloads[0]));
+	param->add_patch(priv->local->bin_builder,
+			 bin_test_mock_algs[param->alg_idx].id,
+			 bin_test_mock_algs[param->alg_idx].ver,
+			 unpacked_mem_type,
+			 ((patch_pos_words + 4) - alg_base_words) * 4,
+			 &unpacked_payloads[0], sizeof(unpacked_payloads[0]));
 
-	cs_dsp_mock_bin_add_patch(priv->local->bin_builder,
-				  bin_test_mock_algs[param->alg_idx].id,
-				  bin_test_mock_algs[param->alg_idx].ver,
-				  unpacked_mem_type,
-				  ((patch_pos_words + 5) - alg_base_words) * 4,
-				  &unpacked_payloads[1], sizeof(unpacked_payloads[1]));
+	param->add_patch(priv->local->bin_builder,
+			 bin_test_mock_algs[param->alg_idx].id,
+			 bin_test_mock_algs[param->alg_idx].ver,
+			 unpacked_mem_type,
+			 ((patch_pos_words + 5) - alg_base_words) * 4,
+			 &unpacked_payloads[1], sizeof(unpacked_payloads[1]));
 
-	cs_dsp_mock_bin_add_patch(priv->local->bin_builder,
-				  bin_test_mock_algs[param->alg_idx].id,
-				  bin_test_mock_algs[param->alg_idx].ver,
-				  unpacked_mem_type,
-				  ((patch_pos_words + 6) - alg_base_words) * 4,
-				  &unpacked_payloads[2], sizeof(unpacked_payloads[2]));
+	param->add_patch(priv->local->bin_builder,
+			 bin_test_mock_algs[param->alg_idx].id,
+			 bin_test_mock_algs[param->alg_idx].ver,
+			 unpacked_mem_type,
+			 ((patch_pos_words + 6) - alg_base_words) * 4,
+			 &unpacked_payloads[2], sizeof(unpacked_payloads[2]));
 
 	fw = cs_dsp_mock_bin_get_firmware(priv->local->bin_builder);
 	KUNIT_ASSERT_EQ(test,
@@ -953,20 +957,20 @@ static void bin_patch_1_packed_2_trailing(struct kunit *test)
 	patch_pos_in_packed_regs = _num_words_to_num_packed_regs(patch_pos_words);
 
 	/* Patch packed block */
-	cs_dsp_mock_bin_add_patch(priv->local->bin_builder,
-				  bin_test_mock_algs[param->alg_idx].id,
-				  bin_test_mock_algs[param->alg_idx].ver,
-				  param->mem_type,
-				  (patch_pos_in_packed_regs - alg_base_in_packed_regs) * 4,
-				  &packed_payload, sizeof(packed_payload));
+	param->add_patch(priv->local->bin_builder,
+			 bin_test_mock_algs[param->alg_idx].id,
+			 bin_test_mock_algs[param->alg_idx].ver,
+			 param->mem_type,
+			 (patch_pos_in_packed_regs - alg_base_in_packed_regs) * 4,
+			 &packed_payload, sizeof(packed_payload));
 
 	/* ... and the unpacked words following that */
-	cs_dsp_mock_bin_add_patch(priv->local->bin_builder,
-				  bin_test_mock_algs[param->alg_idx].id,
-				  bin_test_mock_algs[param->alg_idx].ver,
-				  unpacked_mem_type,
-				  ((patch_pos_words + 4) - alg_base_words) * 4,
-				  unpacked_payload, sizeof(unpacked_payload));
+	param->add_patch(priv->local->bin_builder,
+			 bin_test_mock_algs[param->alg_idx].id,
+			 bin_test_mock_algs[param->alg_idx].ver,
+			 unpacked_mem_type,
+			 ((patch_pos_words + 4) - alg_base_words) * 4,
+			 unpacked_payload, sizeof(unpacked_payload));
 
 	fw = cs_dsp_mock_bin_get_firmware(priv->local->bin_builder);
 	KUNIT_ASSERT_EQ(test,
@@ -1035,20 +1039,20 @@ static void bin_patch_1_packed_3_trailing(struct kunit *test)
 	patch_pos_in_packed_regs = _num_words_to_num_packed_regs(patch_pos_words);
 
 	/* Patch packed block */
-	cs_dsp_mock_bin_add_patch(priv->local->bin_builder,
-				  bin_test_mock_algs[param->alg_idx].id,
-				  bin_test_mock_algs[param->alg_idx].ver,
-				  param->mem_type,
-				  (patch_pos_in_packed_regs - alg_base_in_packed_regs) * 4,
-				  &packed_payload, sizeof(packed_payload));
+	param->add_patch(priv->local->bin_builder,
+			 bin_test_mock_algs[param->alg_idx].id,
+			 bin_test_mock_algs[param->alg_idx].ver,
+			 param->mem_type,
+			 (patch_pos_in_packed_regs - alg_base_in_packed_regs) * 4,
+			 &packed_payload, sizeof(packed_payload));
 
 	/* ... and the unpacked words following that */
-	cs_dsp_mock_bin_add_patch(priv->local->bin_builder,
-				  bin_test_mock_algs[param->alg_idx].id,
-				  bin_test_mock_algs[param->alg_idx].ver,
-				  unpacked_mem_type,
-				  ((patch_pos_words + 4) - alg_base_words) * 4,
-				  unpacked_payload, sizeof(unpacked_payload));
+	param->add_patch(priv->local->bin_builder,
+			 bin_test_mock_algs[param->alg_idx].id,
+			 bin_test_mock_algs[param->alg_idx].ver,
+			 unpacked_mem_type,
+			 ((patch_pos_words + 4) - alg_base_words) * 4,
+			 unpacked_payload, sizeof(unpacked_payload));
 
 	fw = cs_dsp_mock_bin_get_firmware(priv->local->bin_builder);
 	KUNIT_ASSERT_EQ(test,
@@ -1117,20 +1121,20 @@ static void bin_patch_1_single_leading_1_packed(struct kunit *test)
 	packed_patch_pos_words = round_up(alg_base_words + param->offset_words, 4) + 4;
 
 	/* Patch the leading unpacked word */
-	cs_dsp_mock_bin_add_patch(priv->local->bin_builder,
-				  bin_test_mock_algs[param->alg_idx].id,
-				  bin_test_mock_algs[param->alg_idx].ver,
-				  unpacked_mem_type,
-				  ((packed_patch_pos_words - 1) - alg_base_words) * 4,
-				  unpacked_payload, sizeof(unpacked_payload));
+	param->add_patch(priv->local->bin_builder,
+			 bin_test_mock_algs[param->alg_idx].id,
+			 bin_test_mock_algs[param->alg_idx].ver,
+			 unpacked_mem_type,
+			 ((packed_patch_pos_words - 1) - alg_base_words) * 4,
+			 unpacked_payload, sizeof(unpacked_payload));
 	/* ... then the packed block */
 	patch_pos_in_packed_regs = _num_words_to_num_packed_regs(packed_patch_pos_words);
-	cs_dsp_mock_bin_add_patch(priv->local->bin_builder,
-				  bin_test_mock_algs[param->alg_idx].id,
-				  bin_test_mock_algs[param->alg_idx].ver,
-				  param->mem_type,
-				  (patch_pos_in_packed_regs - alg_base_in_packed_regs) * 4,
-				  &packed_payload, sizeof(packed_payload));
+	param->add_patch(priv->local->bin_builder,
+			 bin_test_mock_algs[param->alg_idx].id,
+			 bin_test_mock_algs[param->alg_idx].ver,
+			 param->mem_type,
+			 (patch_pos_in_packed_regs - alg_base_in_packed_regs) * 4,
+			 &packed_payload, sizeof(packed_payload));
 
 	fw = cs_dsp_mock_bin_get_firmware(priv->local->bin_builder);
 	KUNIT_ASSERT_EQ(test,
@@ -1196,26 +1200,26 @@ static void bin_patch_2_single_leading_1_packed(struct kunit *test)
 	packed_patch_pos_words = round_up(alg_base_words + param->offset_words, 4) + 4;
 
 	/* Patch the leading unpacked words */
-	cs_dsp_mock_bin_add_patch(priv->local->bin_builder,
-				  bin_test_mock_algs[param->alg_idx].id,
-				  bin_test_mock_algs[param->alg_idx].ver,
-				  unpacked_mem_type,
-				  ((packed_patch_pos_words - 2) - alg_base_words) * 4,
-				  &unpacked_payload[0], sizeof(unpacked_payload[0]));
-	cs_dsp_mock_bin_add_patch(priv->local->bin_builder,
-				  bin_test_mock_algs[param->alg_idx].id,
-				  bin_test_mock_algs[param->alg_idx].ver,
-				  unpacked_mem_type,
-				  ((packed_patch_pos_words - 1) - alg_base_words) * 4,
-				  &unpacked_payload[1], sizeof(unpacked_payload[1]));
+	param->add_patch(priv->local->bin_builder,
+			 bin_test_mock_algs[param->alg_idx].id,
+			 bin_test_mock_algs[param->alg_idx].ver,
+			 unpacked_mem_type,
+			 ((packed_patch_pos_words - 2) - alg_base_words) * 4,
+			 &unpacked_payload[0], sizeof(unpacked_payload[0]));
+	param->add_patch(priv->local->bin_builder,
+			 bin_test_mock_algs[param->alg_idx].id,
+			 bin_test_mock_algs[param->alg_idx].ver,
+			 unpacked_mem_type,
+			 ((packed_patch_pos_words - 1) - alg_base_words) * 4,
+			 &unpacked_payload[1], sizeof(unpacked_payload[1]));
 	/* ... then the packed block */
 	patch_pos_in_packed_regs = _num_words_to_num_packed_regs(packed_patch_pos_words);
-	cs_dsp_mock_bin_add_patch(priv->local->bin_builder,
-				  bin_test_mock_algs[param->alg_idx].id,
-				  bin_test_mock_algs[param->alg_idx].ver,
-				  param->mem_type,
-				  (patch_pos_in_packed_regs - alg_base_in_packed_regs) * 4,
-				  &packed_payload, sizeof(packed_payload));
+	param->add_patch(priv->local->bin_builder,
+			 bin_test_mock_algs[param->alg_idx].id,
+			 bin_test_mock_algs[param->alg_idx].ver,
+			 param->mem_type,
+			 (patch_pos_in_packed_regs - alg_base_in_packed_regs) * 4,
+			 &packed_payload, sizeof(packed_payload));
 
 	fw = cs_dsp_mock_bin_get_firmware(priv->local->bin_builder);
 	KUNIT_ASSERT_EQ(test,
@@ -1283,20 +1287,20 @@ static void bin_patch_2_leading_1_packed(struct kunit *test)
 	packed_patch_pos_words = round_up(alg_base_words + param->offset_words, 4) + 4;
 
 	/* Patch the leading unpacked words */
-	cs_dsp_mock_bin_add_patch(priv->local->bin_builder,
-				  bin_test_mock_algs[param->alg_idx].id,
-				  bin_test_mock_algs[param->alg_idx].ver,
-				  unpacked_mem_type,
-				  ((packed_patch_pos_words - 2) - alg_base_words) * 4,
-				  unpacked_payload, sizeof(unpacked_payload));
+	param->add_patch(priv->local->bin_builder,
+			 bin_test_mock_algs[param->alg_idx].id,
+			 bin_test_mock_algs[param->alg_idx].ver,
+			 unpacked_mem_type,
+			 ((packed_patch_pos_words - 2) - alg_base_words) * 4,
+			 unpacked_payload, sizeof(unpacked_payload));
 	/* ... then the packed block */
 	patch_pos_in_packed_regs = _num_words_to_num_packed_regs(packed_patch_pos_words);
-	cs_dsp_mock_bin_add_patch(priv->local->bin_builder,
-				  bin_test_mock_algs[param->alg_idx].id,
-				  bin_test_mock_algs[param->alg_idx].ver,
-				  param->mem_type,
-				  (patch_pos_in_packed_regs - alg_base_in_packed_regs) * 4,
-				  &packed_payload, sizeof(packed_payload));
+	param->add_patch(priv->local->bin_builder,
+			 bin_test_mock_algs[param->alg_idx].id,
+			 bin_test_mock_algs[param->alg_idx].ver,
+			 param->mem_type,
+			 (patch_pos_in_packed_regs - alg_base_in_packed_regs) * 4,
+			 &packed_payload, sizeof(packed_payload));
 
 	fw = cs_dsp_mock_bin_get_firmware(priv->local->bin_builder);
 	KUNIT_ASSERT_EQ(test,
@@ -1364,32 +1368,32 @@ static void bin_patch_3_single_leading_1_packed(struct kunit *test)
 	packed_patch_pos_words = round_up(alg_base_words + param->offset_words, 4) + 4;
 
 	/* Patch the leading unpacked words */
-	cs_dsp_mock_bin_add_patch(priv->local->bin_builder,
-				  bin_test_mock_algs[param->alg_idx].id,
-				  bin_test_mock_algs[param->alg_idx].ver,
-				  unpacked_mem_type,
-				  ((packed_patch_pos_words - 3) - alg_base_words) * 4,
-				  &unpacked_payload[0], sizeof(unpacked_payload[0]));
-	cs_dsp_mock_bin_add_patch(priv->local->bin_builder,
-				  bin_test_mock_algs[param->alg_idx].id,
-				  bin_test_mock_algs[param->alg_idx].ver,
-				  unpacked_mem_type,
-				  ((packed_patch_pos_words - 2) - alg_base_words) * 4,
-				  &unpacked_payload[1], sizeof(unpacked_payload[1]));
-	cs_dsp_mock_bin_add_patch(priv->local->bin_builder,
-				  bin_test_mock_algs[param->alg_idx].id,
-				  bin_test_mock_algs[param->alg_idx].ver,
-				  unpacked_mem_type,
-				  ((packed_patch_pos_words - 1) - alg_base_words) * 4,
-				  &unpacked_payload[2], sizeof(unpacked_payload[2]));
+	param->add_patch(priv->local->bin_builder,
+			 bin_test_mock_algs[param->alg_idx].id,
+			 bin_test_mock_algs[param->alg_idx].ver,
+			 unpacked_mem_type,
+			 ((packed_patch_pos_words - 3) - alg_base_words) * 4,
+			 &unpacked_payload[0], sizeof(unpacked_payload[0]));
+	param->add_patch(priv->local->bin_builder,
+			 bin_test_mock_algs[param->alg_idx].id,
+			 bin_test_mock_algs[param->alg_idx].ver,
+			 unpacked_mem_type,
+			 ((packed_patch_pos_words - 2) - alg_base_words) * 4,
+			 &unpacked_payload[1], sizeof(unpacked_payload[1]));
+	param->add_patch(priv->local->bin_builder,
+			 bin_test_mock_algs[param->alg_idx].id,
+			 bin_test_mock_algs[param->alg_idx].ver,
+			 unpacked_mem_type,
+			 ((packed_patch_pos_words - 1) - alg_base_words) * 4,
+			 &unpacked_payload[2], sizeof(unpacked_payload[2]));
 	/* ... then the packed block */
 	patch_pos_in_packed_regs = _num_words_to_num_packed_regs(packed_patch_pos_words);
-	cs_dsp_mock_bin_add_patch(priv->local->bin_builder,
-				  bin_test_mock_algs[param->alg_idx].id,
-				  bin_test_mock_algs[param->alg_idx].ver,
-				  param->mem_type,
-				  (patch_pos_in_packed_regs - alg_base_in_packed_regs) * 4,
-				  &packed_payload, sizeof(packed_payload));
+	param->add_patch(priv->local->bin_builder,
+			 bin_test_mock_algs[param->alg_idx].id,
+			 bin_test_mock_algs[param->alg_idx].ver,
+			 param->mem_type,
+			 (patch_pos_in_packed_regs - alg_base_in_packed_regs) * 4,
+			 &packed_payload, sizeof(packed_payload));
 
 	fw = cs_dsp_mock_bin_get_firmware(priv->local->bin_builder);
 	KUNIT_ASSERT_EQ(test,
@@ -1457,20 +1461,20 @@ static void bin_patch_3_leading_1_packed(struct kunit *test)
 	packed_patch_pos_words = round_up(alg_base_words + param->offset_words, 4) + 4;
 
 	/* Patch the leading unpacked words */
-	cs_dsp_mock_bin_add_patch(priv->local->bin_builder,
-				  bin_test_mock_algs[param->alg_idx].id,
-				  bin_test_mock_algs[param->alg_idx].ver,
-				  unpacked_mem_type,
-				  ((packed_patch_pos_words - 3) - alg_base_words) * 4,
-				  unpacked_payload, sizeof(unpacked_payload));
+	param->add_patch(priv->local->bin_builder,
+			 bin_test_mock_algs[param->alg_idx].id,
+			 bin_test_mock_algs[param->alg_idx].ver,
+			 unpacked_mem_type,
+			 ((packed_patch_pos_words - 3) - alg_base_words) * 4,
+			 unpacked_payload, sizeof(unpacked_payload));
 	/* ... then the packed block */
 	patch_pos_in_packed_regs = _num_words_to_num_packed_regs(packed_patch_pos_words);
-	cs_dsp_mock_bin_add_patch(priv->local->bin_builder,
-				  bin_test_mock_algs[param->alg_idx].id,
-				  bin_test_mock_algs[param->alg_idx].ver,
-				  param->mem_type,
-				  (patch_pos_in_packed_regs - alg_base_in_packed_regs) * 4,
-				  &packed_payload, sizeof(packed_payload));
+	param->add_patch(priv->local->bin_builder,
+			 bin_test_mock_algs[param->alg_idx].id,
+			 bin_test_mock_algs[param->alg_idx].ver,
+			 param->mem_type,
+			 (patch_pos_in_packed_regs - alg_base_in_packed_regs) * 4,
+			 &packed_payload, sizeof(packed_payload));
 
 	fw = cs_dsp_mock_bin_get_firmware(priv->local->bin_builder);
 	KUNIT_ASSERT_EQ(test,
@@ -1537,12 +1541,12 @@ static void bin_patch_multi_onepacked(struct kunit *test)
 	for (i = 0; i < ARRAY_SIZE(packed_payloads); ++i) {
 		patch_pos_in_packed_regs = _num_words_to_num_packed_regs(patch_pos_words + (i * 4));
 		payload_offset = (patch_pos_in_packed_regs - alg_base_in_packed_regs) * 4;
-		cs_dsp_mock_bin_add_patch(priv->local->bin_builder,
-					  bin_test_mock_algs[param->alg_idx].id,
-					  bin_test_mock_algs[param->alg_idx].ver,
-					  param->mem_type,
-					  payload_offset,
-					  &packed_payloads[i], sizeof(packed_payloads[i]));
+		param->add_patch(priv->local->bin_builder,
+				 bin_test_mock_algs[param->alg_idx].id,
+				 bin_test_mock_algs[param->alg_idx].ver,
+				 param->mem_type,
+				 payload_offset,
+				 &packed_payloads[i], sizeof(packed_payloads[i]));
 	}
 
 	fw = cs_dsp_mock_bin_get_firmware(priv->local->bin_builder);
@@ -1602,13 +1606,13 @@ static void bin_patch_multi_onepacked_unordered(struct kunit *test)
 		patch_pos_in_packed_regs =
 			_num_words_to_num_packed_regs(patch_pos_words + (payload_order[i] * 4));
 		payload_offset = (patch_pos_in_packed_regs - alg_base_in_packed_regs) * 4;
-		cs_dsp_mock_bin_add_patch(priv->local->bin_builder,
-					  bin_test_mock_algs[param->alg_idx].id,
-					  bin_test_mock_algs[param->alg_idx].ver,
-					  param->mem_type,
-					  payload_offset,
-					  &packed_payloads[payload_order[i]],
-					  sizeof(packed_payloads[0]));
+		param->add_patch(priv->local->bin_builder,
+				 bin_test_mock_algs[param->alg_idx].id,
+				 bin_test_mock_algs[param->alg_idx].ver,
+				 param->mem_type,
+				 payload_offset,
+				 &packed_payloads[payload_order[i]],
+				 sizeof(packed_payloads[0]));
 	}
 
 	fw = cs_dsp_mock_bin_get_firmware(priv->local->bin_builder);
@@ -1665,13 +1669,13 @@ static void bin_patch_multi_onepacked_sparse_unordered(struct kunit *test)
 		patch_pos_words = round_up(alg_base_words + word_offsets[i], 4);
 		patch_pos_in_packed_regs = _num_words_to_num_packed_regs(patch_pos_words);
 		payload_offset = (patch_pos_in_packed_regs - alg_base_in_packed_regs) * 4;
-		cs_dsp_mock_bin_add_patch(priv->local->bin_builder,
-					  bin_test_mock_algs[param->alg_idx].id,
-					  bin_test_mock_algs[param->alg_idx].ver,
-					  param->mem_type,
-					  payload_offset,
-					  &packed_payloads[i],
-					  sizeof(packed_payloads[0]));
+		param->add_patch(priv->local->bin_builder,
+				 bin_test_mock_algs[param->alg_idx].id,
+				 bin_test_mock_algs[param->alg_idx].ver,
+				 param->mem_type,
+				 payload_offset,
+				 &packed_payloads[i],
+				 sizeof(packed_payloads[0]));
 	}
 
 	fw = cs_dsp_mock_bin_get_firmware(priv->local->bin_builder);
@@ -1737,21 +1741,21 @@ static void bin_patch_1_packed_multiple_mems(struct kunit *test)
 	/* Add XM and YM patches */
 	alg_base_in_packed_regs = _num_words_to_num_packed_regs(alg_xm_base_words);
 	patch_pos_in_packed_regs = _num_words_to_num_packed_regs(xm_patch_pos_words);
-	cs_dsp_mock_bin_add_patch(priv->local->bin_builder,
-				  bin_test_mock_algs[param->alg_idx].id,
-				  bin_test_mock_algs[param->alg_idx].ver,
-				  WMFW_HALO_XM_PACKED,
-				  (patch_pos_in_packed_regs - alg_base_in_packed_regs) * 4,
-				  packed_xm_payload, sizeof(packed_xm_payload));
+	param->add_patch(priv->local->bin_builder,
+			 bin_test_mock_algs[param->alg_idx].id,
+			 bin_test_mock_algs[param->alg_idx].ver,
+			 WMFW_HALO_XM_PACKED,
+			 (patch_pos_in_packed_regs - alg_base_in_packed_regs) * 4,
+			 packed_xm_payload, sizeof(packed_xm_payload));
 
 	alg_base_in_packed_regs = _num_words_to_num_packed_regs(alg_ym_base_words);
 	patch_pos_in_packed_regs = _num_words_to_num_packed_regs(ym_patch_pos_words);
-	cs_dsp_mock_bin_add_patch(priv->local->bin_builder,
-				  bin_test_mock_algs[param->alg_idx].id,
-				  bin_test_mock_algs[param->alg_idx].ver,
-				  WMFW_HALO_YM_PACKED,
-				  (patch_pos_in_packed_regs - alg_base_in_packed_regs) * 4,
-				  packed_ym_payload, sizeof(packed_ym_payload));
+	param->add_patch(priv->local->bin_builder,
+			 bin_test_mock_algs[param->alg_idx].id,
+			 bin_test_mock_algs[param->alg_idx].ver,
+			 WMFW_HALO_YM_PACKED,
+			 (patch_pos_in_packed_regs - alg_base_in_packed_regs) * 4,
+			 packed_ym_payload, sizeof(packed_ym_payload));
 
 	fw = cs_dsp_mock_bin_get_firmware(priv->local->bin_builder);
 	KUNIT_ASSERT_EQ(test,
@@ -1821,12 +1825,12 @@ static void bin_patch_1_packed_multiple_algs(struct kunit *test)
 		patch_pos_in_packed_regs = _num_words_to_num_packed_regs(patch_pos_words);
 
 		payload_offset = (patch_pos_in_packed_regs - alg_base_in_packed_regs) * 4;
-		cs_dsp_mock_bin_add_patch(priv->local->bin_builder,
-					  bin_test_mock_algs[i].id,
-					  bin_test_mock_algs[i].ver,
-					  param->mem_type,
-					  payload_offset,
-					  packed_payload[i], sizeof(packed_payload[i]));
+		param->add_patch(priv->local->bin_builder,
+				 bin_test_mock_algs[i].id,
+				 bin_test_mock_algs[i].ver,
+				 param->mem_type,
+				 payload_offset,
+				 packed_payload[i], sizeof(packed_payload[i]));
 	}
 
 	fw = cs_dsp_mock_bin_get_firmware(priv->local->bin_builder);
@@ -1907,12 +1911,12 @@ static void bin_patch_1_packed_multiple_algs_unordered(struct kunit *test)
 		patch_pos_in_packed_regs = _num_words_to_num_packed_regs(patch_pos_words);
 
 		payload_offset = (patch_pos_in_packed_regs - alg_base_in_packed_regs) * 4;
-		cs_dsp_mock_bin_add_patch(priv->local->bin_builder,
-					  bin_test_mock_algs[alg_idx].id,
-					  bin_test_mock_algs[alg_idx].ver,
-					  param->mem_type,
-					  payload_offset,
-					  packed_payload[i], sizeof(packed_payload[i]));
+		param->add_patch(priv->local->bin_builder,
+				 bin_test_mock_algs[alg_idx].id,
+				 bin_test_mock_algs[alg_idx].ver,
+				 param->mem_type,
+				 payload_offset,
+				 packed_payload[i], sizeof(packed_payload[i]));
 	}
 
 	fw = cs_dsp_mock_bin_get_firmware(priv->local->bin_builder);
@@ -2004,22 +2008,22 @@ static void bin_patch_mixed_packed_unpacked_random(struct kunit *test)
 			alg_base_in_packed_regs = _num_words_to_num_packed_regs(alg_base_words);
 			patch_pos_in_packed_regs = _num_words_to_num_packed_regs(patch_pos_words);
 			payload_offset = (patch_pos_in_packed_regs - alg_base_in_packed_regs) * 4;
-			cs_dsp_mock_bin_add_patch(priv->local->bin_builder,
-						  bin_test_mock_algs[0].id,
-						  bin_test_mock_algs[0].ver,
-						  param->mem_type,
-						  payload_offset,
-						  payload->packed[i],
-						  sizeof(payload->packed[i]));
+			param->add_patch(priv->local->bin_builder,
+					 bin_test_mock_algs[0].id,
+					 bin_test_mock_algs[0].ver,
+					 param->mem_type,
+					 payload_offset,
+					 payload->packed[i],
+					 sizeof(payload->packed[i]));
 		} else {
 			payload_offset = offset_words[i] * 4;
-			cs_dsp_mock_bin_add_patch(priv->local->bin_builder,
-						  bin_test_mock_algs[0].id,
-						  bin_test_mock_algs[0].ver,
-						  unpacked_mem_type,
-						  payload_offset,
-						  &payload->unpacked[i],
-						  sizeof(payload->unpacked[i]));
+			param->add_patch(priv->local->bin_builder,
+					 bin_test_mock_algs[0].id,
+					 bin_test_mock_algs[0].ver,
+					 unpacked_mem_type,
+					 payload_offset,
+					 &payload->unpacked[i],
+					 sizeof(payload->unpacked[i]));
 		}
 	}
 
@@ -2295,53 +2299,55 @@ static int cs_dsp_bin_test_adsp2_16bit_init(struct kunit *test)
 	return cs_dsp_bin_test_common_init(test, dsp, 1);
 }
 
+#define WMDR_PATCH_SHORT .add_patch = cs_dsp_mock_bin_add_patch
+
 /* Parameterize on choice of XM or YM with a range of word offsets */
 static const struct bin_test_param x_or_y_and_offset_param_cases[] = {
-	{ .mem_type = WMFW_ADSP2_XM, .offset_words = 0 },
-	{ .mem_type = WMFW_ADSP2_XM, .offset_words = 1 },
-	{ .mem_type = WMFW_ADSP2_XM, .offset_words = 2 },
-	{ .mem_type = WMFW_ADSP2_XM, .offset_words = 3 },
-	{ .mem_type = WMFW_ADSP2_XM, .offset_words = 4 },
-	{ .mem_type = WMFW_ADSP2_XM, .offset_words = 23 },
-	{ .mem_type = WMFW_ADSP2_XM, .offset_words = 22 },
-	{ .mem_type = WMFW_ADSP2_XM, .offset_words = 21 },
-	{ .mem_type = WMFW_ADSP2_XM, .offset_words = 20 },
+	{ .mem_type = WMFW_ADSP2_XM, .offset_words = 0,  WMDR_PATCH_SHORT },
+	{ .mem_type = WMFW_ADSP2_XM, .offset_words = 1,  WMDR_PATCH_SHORT },
+	{ .mem_type = WMFW_ADSP2_XM, .offset_words = 2,  WMDR_PATCH_SHORT },
+	{ .mem_type = WMFW_ADSP2_XM, .offset_words = 3,  WMDR_PATCH_SHORT },
+	{ .mem_type = WMFW_ADSP2_XM, .offset_words = 4,  WMDR_PATCH_SHORT },
+	{ .mem_type = WMFW_ADSP2_XM, .offset_words = 23, WMDR_PATCH_SHORT },
+	{ .mem_type = WMFW_ADSP2_XM, .offset_words = 22, WMDR_PATCH_SHORT },
+	{ .mem_type = WMFW_ADSP2_XM, .offset_words = 21, WMDR_PATCH_SHORT },
+	{ .mem_type = WMFW_ADSP2_XM, .offset_words = 20, WMDR_PATCH_SHORT },
 
-	{ .mem_type = WMFW_ADSP2_YM, .offset_words = 0 },
-	{ .mem_type = WMFW_ADSP2_YM, .offset_words = 1 },
-	{ .mem_type = WMFW_ADSP2_YM, .offset_words = 2 },
-	{ .mem_type = WMFW_ADSP2_YM, .offset_words = 3 },
-	{ .mem_type = WMFW_ADSP2_YM, .offset_words = 4 },
-	{ .mem_type = WMFW_ADSP2_YM, .offset_words = 23 },
-	{ .mem_type = WMFW_ADSP2_YM, .offset_words = 22 },
-	{ .mem_type = WMFW_ADSP2_YM, .offset_words = 21 },
-	{ .mem_type = WMFW_ADSP2_YM, .offset_words = 20 },
+	{ .mem_type = WMFW_ADSP2_YM, .offset_words = 0,  WMDR_PATCH_SHORT },
+	{ .mem_type = WMFW_ADSP2_YM, .offset_words = 1,  WMDR_PATCH_SHORT },
+	{ .mem_type = WMFW_ADSP2_YM, .offset_words = 2,  WMDR_PATCH_SHORT },
+	{ .mem_type = WMFW_ADSP2_YM, .offset_words = 3,  WMDR_PATCH_SHORT },
+	{ .mem_type = WMFW_ADSP2_YM, .offset_words = 4,  WMDR_PATCH_SHORT },
+	{ .mem_type = WMFW_ADSP2_YM, .offset_words = 23, WMDR_PATCH_SHORT },
+	{ .mem_type = WMFW_ADSP2_YM, .offset_words = 22, WMDR_PATCH_SHORT },
+	{ .mem_type = WMFW_ADSP2_YM, .offset_words = 21, WMDR_PATCH_SHORT },
+	{ .mem_type = WMFW_ADSP2_YM, .offset_words = 20, WMDR_PATCH_SHORT },
 };
 
 /* Parameterize on ZM with a range of word offsets */
 static const struct bin_test_param z_and_offset_param_cases[] = {
-	{ .mem_type = WMFW_ADSP2_ZM, .offset_words = 0 },
-	{ .mem_type = WMFW_ADSP2_ZM, .offset_words = 1 },
-	{ .mem_type = WMFW_ADSP2_ZM, .offset_words = 2 },
-	{ .mem_type = WMFW_ADSP2_ZM, .offset_words = 3 },
-	{ .mem_type = WMFW_ADSP2_ZM, .offset_words = 4 },
-	{ .mem_type = WMFW_ADSP2_ZM, .offset_words = 23 },
-	{ .mem_type = WMFW_ADSP2_ZM, .offset_words = 22 },
-	{ .mem_type = WMFW_ADSP2_ZM, .offset_words = 21 },
-	{ .mem_type = WMFW_ADSP2_ZM, .offset_words = 20 },
+	{ .mem_type = WMFW_ADSP2_ZM, .offset_words = 0,  WMDR_PATCH_SHORT },
+	{ .mem_type = WMFW_ADSP2_ZM, .offset_words = 1,  WMDR_PATCH_SHORT },
+	{ .mem_type = WMFW_ADSP2_ZM, .offset_words = 2,  WMDR_PATCH_SHORT },
+	{ .mem_type = WMFW_ADSP2_ZM, .offset_words = 3,  WMDR_PATCH_SHORT },
+	{ .mem_type = WMFW_ADSP2_ZM, .offset_words = 4,  WMDR_PATCH_SHORT },
+	{ .mem_type = WMFW_ADSP2_ZM, .offset_words = 23, WMDR_PATCH_SHORT },
+	{ .mem_type = WMFW_ADSP2_ZM, .offset_words = 22, WMDR_PATCH_SHORT },
+	{ .mem_type = WMFW_ADSP2_ZM, .offset_words = 21, WMDR_PATCH_SHORT },
+	{ .mem_type = WMFW_ADSP2_ZM, .offset_words = 20, WMDR_PATCH_SHORT },
 };
 
 /* Parameterize on choice of packed XM or YM with a range of word offsets */
 static const struct bin_test_param packed_x_or_y_and_offset_param_cases[] = {
-	{ .mem_type = WMFW_HALO_XM_PACKED, .offset_words = 0 },
-	{ .mem_type = WMFW_HALO_XM_PACKED, .offset_words = 4 },
-	{ .mem_type = WMFW_HALO_XM_PACKED, .offset_words = 8 },
-	{ .mem_type = WMFW_HALO_XM_PACKED, .offset_words = 12 },
+	{ .mem_type = WMFW_HALO_XM_PACKED, .offset_words = 0,  WMDR_PATCH_SHORT },
+	{ .mem_type = WMFW_HALO_XM_PACKED, .offset_words = 4,  WMDR_PATCH_SHORT },
+	{ .mem_type = WMFW_HALO_XM_PACKED, .offset_words = 8,  WMDR_PATCH_SHORT },
+	{ .mem_type = WMFW_HALO_XM_PACKED, .offset_words = 12, WMDR_PATCH_SHORT },
 
-	{ .mem_type = WMFW_HALO_YM_PACKED, .offset_words = 0 },
-	{ .mem_type = WMFW_HALO_YM_PACKED, .offset_words = 4 },
-	{ .mem_type = WMFW_HALO_YM_PACKED, .offset_words = 8 },
-	{ .mem_type = WMFW_HALO_YM_PACKED, .offset_words = 12 },
+	{ .mem_type = WMFW_HALO_YM_PACKED, .offset_words = 0,  WMDR_PATCH_SHORT },
+	{ .mem_type = WMFW_HALO_YM_PACKED, .offset_words = 4,  WMDR_PATCH_SHORT },
+	{ .mem_type = WMFW_HALO_YM_PACKED, .offset_words = 8,  WMDR_PATCH_SHORT },
+	{ .mem_type = WMFW_HALO_YM_PACKED, .offset_words = 12, WMDR_PATCH_SHORT },
 };
 
 static void x_or_y_or_z_and_offset_param_desc(const struct bin_test_param *param,
@@ -2366,8 +2372,8 @@ KUNIT_ARRAY_PARAM(packed_x_or_y_and_offset,
 
 /* Parameterize on choice of packed XM or YM */
 static const struct bin_test_param packed_x_or_y_param_cases[] = {
-	{ .mem_type = WMFW_HALO_XM_PACKED, .offset_words = 0 },
-	{ .mem_type = WMFW_HALO_YM_PACKED, .offset_words = 0 },
+	{ .mem_type = WMFW_HALO_XM_PACKED, .offset_words = 0, WMDR_PATCH_SHORT },
+	{ .mem_type = WMFW_HALO_YM_PACKED, .offset_words = 0, WMDR_PATCH_SHORT },
 };
 
 static void x_or_y_or_z_param_desc(const struct bin_test_param *param,
@@ -2379,15 +2385,15 @@ static void x_or_y_or_z_param_desc(const struct bin_test_param *param,
 KUNIT_ARRAY_PARAM(packed_x_or_y, packed_x_or_y_param_cases, x_or_y_or_z_param_desc);
 
 static const struct bin_test_param offset_param_cases[] = {
-	{ .offset_words = 0 },
-	{ .offset_words = 1 },
-	{ .offset_words = 2 },
-	{ .offset_words = 3 },
-	{ .offset_words = 4 },
-	{ .offset_words = 23 },
-	{ .offset_words = 22 },
-	{ .offset_words = 21 },
-	{ .offset_words = 20 },
+	{ .offset_words = 0,  WMDR_PATCH_SHORT },
+	{ .offset_words = 1,  WMDR_PATCH_SHORT },
+	{ .offset_words = 2,  WMDR_PATCH_SHORT },
+	{ .offset_words = 3,  WMDR_PATCH_SHORT },
+	{ .offset_words = 4,  WMDR_PATCH_SHORT },
+	{ .offset_words = 23, WMDR_PATCH_SHORT },
+	{ .offset_words = 22, WMDR_PATCH_SHORT },
+	{ .offset_words = 21, WMDR_PATCH_SHORT },
+	{ .offset_words = 20, WMDR_PATCH_SHORT },
 };
 
 static void offset_param_desc(const struct bin_test_param *param, char *desc)
@@ -2398,10 +2404,10 @@ static void offset_param_desc(const struct bin_test_param *param, char *desc)
 KUNIT_ARRAY_PARAM(offset, offset_param_cases, offset_param_desc);
 
 static const struct bin_test_param alg_param_cases[] = {
-	{ .alg_idx = 0 },
-	{ .alg_idx = 1 },
-	{ .alg_idx = 2 },
-	{ .alg_idx = 3 },
+	{ .alg_idx = 0, WMDR_PATCH_SHORT },
+	{ .alg_idx = 1, WMDR_PATCH_SHORT },
+	{ .alg_idx = 2, WMDR_PATCH_SHORT },
+	{ .alg_idx = 3, WMDR_PATCH_SHORT },
 };
 
 static void alg_param_desc(const struct bin_test_param *param, char *desc)
@@ -2415,15 +2421,15 @@ static void alg_param_desc(const struct bin_test_param *param, char *desc)
 KUNIT_ARRAY_PARAM(alg, alg_param_cases, alg_param_desc);
 
 static const struct bin_test_param x_or_y_and_alg_param_cases[] = {
-	{ .mem_type = WMFW_ADSP2_XM, .alg_idx = 0 },
-	{ .mem_type = WMFW_ADSP2_XM, .alg_idx = 1 },
-	{ .mem_type = WMFW_ADSP2_XM, .alg_idx = 2 },
-	{ .mem_type = WMFW_ADSP2_XM, .alg_idx = 3 },
+	{ .mem_type = WMFW_ADSP2_XM, .alg_idx = 0, WMDR_PATCH_SHORT },
+	{ .mem_type = WMFW_ADSP2_XM, .alg_idx = 1, WMDR_PATCH_SHORT },
+	{ .mem_type = WMFW_ADSP2_XM, .alg_idx = 2, WMDR_PATCH_SHORT },
+	{ .mem_type = WMFW_ADSP2_XM, .alg_idx = 3, WMDR_PATCH_SHORT },
 
-	{ .mem_type = WMFW_ADSP2_YM, .alg_idx = 0 },
-	{ .mem_type = WMFW_ADSP2_YM, .alg_idx = 1 },
-	{ .mem_type = WMFW_ADSP2_YM, .alg_idx = 2 },
-	{ .mem_type = WMFW_ADSP2_YM, .alg_idx = 3 },
+	{ .mem_type = WMFW_ADSP2_YM, .alg_idx = 0, WMDR_PATCH_SHORT },
+	{ .mem_type = WMFW_ADSP2_YM, .alg_idx = 1, WMDR_PATCH_SHORT },
+	{ .mem_type = WMFW_ADSP2_YM, .alg_idx = 2, WMDR_PATCH_SHORT },
+	{ .mem_type = WMFW_ADSP2_YM, .alg_idx = 3, WMDR_PATCH_SHORT },
 };
 
 static void x_or_y_or_z_and_alg_param_desc(const struct bin_test_param *param, char *desc)
@@ -2438,24 +2444,24 @@ static void x_or_y_or_z_and_alg_param_desc(const struct bin_test_param *param, c
 KUNIT_ARRAY_PARAM(x_or_y_and_alg, x_or_y_and_alg_param_cases, x_or_y_or_z_and_alg_param_desc);
 
 static const struct bin_test_param z_and_alg_param_cases[] = {
-	{ .mem_type = WMFW_ADSP2_ZM, .alg_idx = 0 },
-	{ .mem_type = WMFW_ADSP2_ZM, .alg_idx = 1 },
-	{ .mem_type = WMFW_ADSP2_ZM, .alg_idx = 2 },
-	{ .mem_type = WMFW_ADSP2_ZM, .alg_idx = 3 },
+	{ .mem_type = WMFW_ADSP2_ZM, .alg_idx = 0, WMDR_PATCH_SHORT },
+	{ .mem_type = WMFW_ADSP2_ZM, .alg_idx = 1, WMDR_PATCH_SHORT },
+	{ .mem_type = WMFW_ADSP2_ZM, .alg_idx = 2, WMDR_PATCH_SHORT },
+	{ .mem_type = WMFW_ADSP2_ZM, .alg_idx = 3, WMDR_PATCH_SHORT },
 };
 
 KUNIT_ARRAY_PARAM(z_and_alg, z_and_alg_param_cases, x_or_y_or_z_and_alg_param_desc);
 
 static const struct bin_test_param packed_x_or_y_and_alg_param_cases[] = {
-	{ .mem_type = WMFW_HALO_XM_PACKED, .alg_idx = 0 },
-	{ .mem_type = WMFW_HALO_XM_PACKED, .alg_idx = 1 },
-	{ .mem_type = WMFW_HALO_XM_PACKED, .alg_idx = 2 },
-	{ .mem_type = WMFW_HALO_XM_PACKED, .alg_idx = 3 },
+	{ .mem_type = WMFW_HALO_XM_PACKED, .alg_idx = 0, WMDR_PATCH_SHORT },
+	{ .mem_type = WMFW_HALO_XM_PACKED, .alg_idx = 1, WMDR_PATCH_SHORT },
+	{ .mem_type = WMFW_HALO_XM_PACKED, .alg_idx = 2, WMDR_PATCH_SHORT },
+	{ .mem_type = WMFW_HALO_XM_PACKED, .alg_idx = 3, WMDR_PATCH_SHORT },
 
-	{ .mem_type = WMFW_HALO_YM_PACKED, .alg_idx = 0 },
-	{ .mem_type = WMFW_HALO_YM_PACKED, .alg_idx = 1 },
-	{ .mem_type = WMFW_HALO_YM_PACKED, .alg_idx = 2 },
-	{ .mem_type = WMFW_HALO_YM_PACKED, .alg_idx = 3 },
+	{ .mem_type = WMFW_HALO_YM_PACKED, .alg_idx = 0, WMDR_PATCH_SHORT },
+	{ .mem_type = WMFW_HALO_YM_PACKED, .alg_idx = 1, WMDR_PATCH_SHORT },
+	{ .mem_type = WMFW_HALO_YM_PACKED, .alg_idx = 2, WMDR_PATCH_SHORT },
+	{ .mem_type = WMFW_HALO_YM_PACKED, .alg_idx = 3, WMDR_PATCH_SHORT },
 };
 
 KUNIT_ARRAY_PARAM(packed_x_or_y_and_alg, packed_x_or_y_and_alg_param_cases,
-- 
2.43.0

