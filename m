Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 152B52C08C8;
	Wed, 31 Dec 2025 11:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767179812; cv=fail; b=T/RabgBc7j34zmjoTvD2ODN4oAjtiOBbd74wTqPZ7FTCwwAAuc+oMen8clKozXj/n3S82OBs21JAw19L2fcbbhtcN2HHNA9nobwrNtFpFhRLqGfmGdrQQcUfCbEnBQpL/b1bTeyDQkxC8ZRb8fzFKgCwi9D/SuQlGvsEi3no9ts=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767179812; c=relaxed/simple;
	bh=ivNdr+jV4E4JQlUQVPMZd7u5FCmxm6BcWzIFc279s+c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AAQnclX0sdSpc8QB0eAIa5FkU5OWecgxG3hVyAJoGpdc2fkSEU4q63TP3lH+IG9eQseGD/MYeGzMO3tvbL6jZISAun9aRjGIMc5WuBsJioEind3rk/1iDS+R07sFb82j+R63+CIm99NU+6tcPm4/cZYIfHZggnjOr+L4uDz6ldk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=TPtFVsle; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=D2AeHzyF; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="TPtFVsle";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="D2AeHzyF"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BVAgjAQ3727987;
	Wed, 31 Dec 2025 04:50:11 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=gX01iseBx49STV7moKCtl5F/nDGXX/djmSYecWuLork=; b=
	TPtFVslesOQs6C10O+SzcTRUUT5/sG4GS3M7bSXiK8d2VNMBXZYlMQmC4Ltv0yGm
	IcreWOobLDAB2RAEnPPyfSNzfjbrLuUlUdDt/I06aM735hnV67CVexw7/iZCfI0p
	3TXCVnryb3d8kOfdQjdhslc9yoRF74YK5N5svimhFH3Yks2+my2Na1DjQY8K9HZr
	0mgtdREps4EAeEyrkCvT8jenTfvVvPFh7i37NfhpSxgxBTRNsxIAgAWlV3VyW1ST
	cRn+LeLgTiE7Ob1jc7MQRMRC2v32CuVy8RD8vHbxbjTqVS2JI2PgFhOx+mgQsQN8
	rQUi+CtzSCRJq5jojo9ahQ==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11022104.outbound.protection.outlook.com [52.101.43.104])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4bacrmv3ys-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 31 Dec 2025 04:50:11 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=takfP/bKYXR1uvTmXYzSyfuJL/RFnTuTL2SIEQcw17IBIuhkfzG8l0dml+NL+6igIY6IPidJDhXfEcmuzADtmFDSx1BDLrVAXavIwiTVmU77ejyhc2dNVycRKDqODrJNTbZcu4uVV64uEB8RKq0r+uYHkbk4Aj5XJ6a8SePDbGVDXefCV7XKLn+1/HtWd4l8/VLax7EUzSKVJ/pC8WKNj8x5JC0uN2mYHr07wpXqhpXuw3El9vZp8wQt1xj7js89GI1JmH14xokw+19dCZP8Gp6NMChobQKzujMr+PCTz1gikBvOVkEY0gdoDHw/C5Bwo8vF6tSuDKpsX99M3U5lXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gX01iseBx49STV7moKCtl5F/nDGXX/djmSYecWuLork=;
 b=NYvKCyC/KB71UcaZzXDY4axo0qMbUmC1M7fTkp+kur6WED0KJyz+MFwAlvVesRm+hA+kBrBRClaT5R0PbSE8sOKydQFn9EaR6BDQfew+bze6RyEfoSA7c2yYhKm0ruLNjXFtC5+pdCv+b/jxnQRAmvCVCymPorje8ZdDV05oxSgaFttkGG7+2M1RckN+xYEt/oqEItTVeMqWRgSMTqvJwQy75wX+ejJpostX92zuifh0kdwVhl7lxS+EiQuQJlXiGazYBEoAHbcOGgBRxTkBspHYLd1Njy9+ng3omgCsqjeKLLJzqWfqS8Z0uTelxhhb9KjmJUeKS9MJRIqzWy4zXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gX01iseBx49STV7moKCtl5F/nDGXX/djmSYecWuLork=;
 b=D2AeHzyFD7kjexr+8dU85Xn3KT8tQjBBCLQRtKE3tGc088q5EqHhIXwSMv2ErlUswwLGy7SYqW3UoaWoLkPU9YPbXoI4NJRTgJI8zeWrdANLnuFdL1TUyUiLmaKFiZZJtMRY6ZfnfjUUK+ROH9Q4N3V9hBebOhQNFM64E2vagLc=
Received: from PH7P220CA0039.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:32b::26)
 by SA3PR19MB7370.namprd19.prod.outlook.com (2603:10b6:806:317::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Wed, 31 Dec
 2025 10:50:07 +0000
Received: from CY4PEPF0000EE3C.namprd03.prod.outlook.com
 (2603:10b6:510:32b:cafe::70) by PH7P220CA0039.outlook.office365.com
 (2603:10b6:510:32b::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4 via Frontend Transport; Wed,
 31 Dec 2025 10:50:07 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CY4PEPF0000EE3C.mail.protection.outlook.com (10.167.242.13) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4
 via Frontend Transport; Wed, 31 Dec 2025 10:50:06 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 6FC27406554;
	Wed, 31 Dec 2025 10:50:05 +0000 (UTC)
Received: from EDIN4L06LR3.ad.cirrus.com (EDIN4L06LR3.ad.cirrus.com [198.61.69.19])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 282ED820249;
	Wed, 31 Dec 2025 10:50:05 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 5/8] firmware: cs_dsp: mock_bin: Add function to create long-offset patches
Date: Wed, 31 Dec 2025 10:49:53 +0000
Message-ID: <20251231104956.449696-6-rf@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3C:EE_|SA3PR19MB7370:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 9b31bc84-f817-4d6a-af1c-08de485a5c7a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|61400799027;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?dQrw/soFBCusjVAWb6pXHe3XQ7iYN29PK3Ou5nal6Uxbj1SCjvgBiYXYkQD8?=
 =?us-ascii?Q?qBhkgJB/3wHaiOSZsjYo9XhR5HlDnX60z6Sky0lcyhZ3K64KBCdA2RWaKkcs?=
 =?us-ascii?Q?CSKqc4WD0Gaz0aeOkc+xAKo6BR9q5HQsc8sXpyP5IyWtHtmQ3kNATHt9yb7x?=
 =?us-ascii?Q?cChCwu4fm6zeSiC4WLKdChzzBvn99T7zHySUgvWf9n8OmY5iam5llaR/P+jK?=
 =?us-ascii?Q?g1p86uND48Rwa1sd2urCr2/s+dNXJtTcfCKOHMu16fxMb1XT2zoy2KztqGQc?=
 =?us-ascii?Q?2OyYARZV7nstSSguGriP0+RlrAgTD+uPeZ8zQm5Sqdnld9d5tIxUgmobXyCl?=
 =?us-ascii?Q?gXzipuWkLhPStzZGgAtEuhOBMjxsMZqogW9wsOtcBXq3d0taGfox2ae7bB98?=
 =?us-ascii?Q?CCuAofuDI2PxHLK9euGaz8FCBoU5jSf6JQrSQVsuWr48PtKzJHUK8sfhZHL8?=
 =?us-ascii?Q?tKekpDIBIojpFUCM/j4iMb7aDx50OqwMfLztI9RZ94aOtkl52MM/a1ct34k0?=
 =?us-ascii?Q?gRzIJbbAGYsghUXCqvUrSMxzn2SjOCa1bxc4O5xsFEBelw0KbdmuQpsgBae6?=
 =?us-ascii?Q?wqxGs9VI2fuF8VhgFyC45wZvYnQKeFILikXDsqEhLJy/fsg0Qsdk/UihC9aM?=
 =?us-ascii?Q?uG0WJ03viicBBB28iZe+ChwFNvd8T9SARf+i6XlSzuYUDDOax20nbRqfwzGQ?=
 =?us-ascii?Q?zDaozvo98e3dcL2YihiVTuONA0d65cGvpi0LuZx4dt7Kw5Ui2cPMjr0cOMZJ?=
 =?us-ascii?Q?8guF4L1Erfx5/NVrEQSN52QjOEPXTA0UcCcgrVBNXQGHY2fHJm1Q4hVoNbjo?=
 =?us-ascii?Q?35uPCUZqdRiJut1MQ5q8JkotZFzinCNxzMxD5W3S1+cOwWrJ8wqP52ePHQLy?=
 =?us-ascii?Q?XvD7OPYDtqsRKEPww5U6lDVYEgS9UQuvezgEW8JkGNbZX6O6/vQE3QIjHwlf?=
 =?us-ascii?Q?fLaIM0XuHzO8eRv6fSCI8zWD2VcE+yLLWg/PGhP70Yb5OhXvnJKnCZWzvLgk?=
 =?us-ascii?Q?sVR7uGE/OnDYURvLEjPb1SxbgQZG5vMt9BAnxiqFUIlCF3xnDXXogMQa3Gmf?=
 =?us-ascii?Q?BANpQ5Y/Z9u2EovVBvlQMGQUfrAFUdo3FNvLmDbk75wagYlPiHkeM9bk6g0R?=
 =?us-ascii?Q?GQ4hDcSyYG9c7+UjglbCsjk+qNJqvuLTQKic7V2IT2e0I5Xc90sXkkkT+Cuo?=
 =?us-ascii?Q?D4+8bfi6jjLfOgbr0gn4oehpq1+KBylXenW/DWCsKUc2AM0vz8as9q0ut+bD?=
 =?us-ascii?Q?p43XsAbQIiMtl8g6aK4P5EYyjz0dJdidFWhOiNg3Ih7OsB49jKIJEvAVwEjO?=
 =?us-ascii?Q?/PaoiKAiqzv5Je9z+7gYpAl/SKQitXakczoJ6BvTaz6BG4JkrGjVY1VZksFM?=
 =?us-ascii?Q?6Rsg6Vm/jYzlRMKkLqQOE4RWkm924n6BWVeUugnuEeyZTLQNpUH+yI0C/uVA?=
 =?us-ascii?Q?0Vo6vrPOVgUGb759z0aTl7kTdN3PRHQapSJqv2mDCNjEJgMy6luHcWt8pt4w?=
 =?us-ascii?Q?00MqmVxFlLj0lrDarUXyBOIBvk7NhlmgdfTsBfc/Y4aCIooVzI0pY4Pw1f+T?=
 =?us-ascii?Q?9nKhCE+efiNxBQhSa9Q=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(61400799027);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Dec 2025 10:50:06.6145
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b31bc84-f817-4d6a-af1c-08de485a5c7a
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CY4PEPF0000EE3C.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR19MB7370
X-Proofpoint-GUID: bz7qe2x1xfNEI9-MK6Hbb0XIsJq9F8nw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMxMDA5NSBTYWx0ZWRfXxYR1iEWOAVid
 cyHEXYQdpwnvhHxIOey3Blm5EXDXNfKsvtvYRVjalU4CZ53WHuJ/nMIj8u1y0W+tN3wI7GLRzWL
 MdCp0b/t8ctaP11cQ4/zGDTFYFx1qKlmSG+EvKC5wbTPcyHFV6fuJYnJwaN+aYND1aG/ZRUdg2V
 sCuOlq9k1QUXQAGoXdtjlTYPwNbKrz1q7XNn78psSjf4uPlHu+tN/orN2uORnZxyo7Wrg25YfX1
 VuO98+KB6IsWP4SAb4IaRR1mOlPgwXOWQhfMO3T1ypMDmP06K2A0Zne1uYIADrX4jcur9w58hU+
 5jv7eKK9pGT8/20YDRH4lSd9l6yTQKn11nL2AIcZV3lMaZBCnYk39ijluB/WD9YYtrP+Ngj1Hz2
 a3w5vnUb5AI8b2LPtpY2awNuOI0lf9a+9t+v3zibVv2PyHG4zJviQV4wzxgdnPWYtMsIwSXAcSz
 gYsOQ8ku0IHdECGmtpw==
X-Authority-Analysis: v=2.4 cv=bJgb4f+Z c=1 sm=1 tr=0 ts=6954ffe3 cx=c_pps
 a=W8/GDLVCOU0NCGD9sQwzBg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=wP3pNCr1ah4A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=w1d2syhTAAAA:8 a=E_BJAL8Xh-jSrSI2yN4A:9
X-Proofpoint-ORIG-GUID: bz7qe2x1xfNEI9-MK6Hbb0XIsJq9F8nw
X-Proofpoint-Spam-Reason: safe

Add cs_dsp_mock_bin_add_patch_off32(). This is the same as
cs_dsp_mock_bin_add_patch() except that it puts the offset in the
new 32-bit offset field and modifies the block type to indicate
that it uses the long offset.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 .../firmware/cirrus/test/cs_dsp_mock_bin.c    | 28 +++++++++++++++++++
 .../linux/firmware/cirrus/cs_dsp_test_utils.h |  4 +++
 2 files changed, 32 insertions(+)

diff --git a/drivers/firmware/cirrus/test/cs_dsp_mock_bin.c b/drivers/firmware/cirrus/test/cs_dsp_mock_bin.c
index bc6b8651259c..635e917e0516 100644
--- a/drivers/firmware/cirrus/test/cs_dsp_mock_bin.c
+++ b/drivers/firmware/cirrus/test/cs_dsp_mock_bin.c
@@ -163,6 +163,34 @@ void cs_dsp_mock_bin_add_patch(struct cs_dsp_mock_bin_builder *builder,
 }
 EXPORT_SYMBOL_NS_GPL(cs_dsp_mock_bin_add_patch, "FW_CS_DSP_KUNIT_TEST_UTILS");
 
+/**
+ * cs_dsp_mock_bin_add_patch_off32() - Add a patch data block with 32-bit offset.
+ *
+ * @builder:		Pointer to struct cs_dsp_mock_bin_builder.
+ * @alg_id:		Algorithm ID for the patch.
+ * @alg_ver:		Algorithm version for the patch.
+ * @mem_region:		Memory region for the patch.
+ * @reg_addr_offset:	Offset to start of data in register addresses.
+ * @payload_data:	Pointer to buffer containing the payload data.
+ * @payload_len_bytes:	Length of payload data in bytes.
+ */
+void cs_dsp_mock_bin_add_patch_off32(struct cs_dsp_mock_bin_builder *builder,
+				     unsigned int alg_id, unsigned int alg_ver,
+				     int mem_region, unsigned int reg_addr_offset,
+				     const void *payload_data, size_t payload_len_bytes)
+{
+	/* Payload length must be a multiple of 4 */
+	KUNIT_ASSERT_EQ(builder->test_priv->test, payload_len_bytes % 4, 0);
+
+	/* Mark the block as using the 32-bit offset */
+	mem_region |= 0xf400;
+
+	cs_dsp_mock_bin_add_raw_block(builder, alg_id, alg_ver,
+				      mem_region, 0, reg_addr_offset,
+				      payload_data, payload_len_bytes);
+}
+EXPORT_SYMBOL_NS_GPL(cs_dsp_mock_bin_add_patch_off32, "FW_CS_DSP_KUNIT_TEST_UTILS");
+
 /**
  * cs_dsp_mock_bin_init() - Initialize a struct cs_dsp_mock_bin_builder.
  *
diff --git a/include/linux/firmware/cirrus/cs_dsp_test_utils.h b/include/linux/firmware/cirrus/cs_dsp_test_utils.h
index 877fa4a496dd..51e99f47e90e 100644
--- a/include/linux/firmware/cirrus/cs_dsp_test_utils.h
+++ b/include/linux/firmware/cirrus/cs_dsp_test_utils.h
@@ -136,6 +136,10 @@ void cs_dsp_mock_bin_add_patch(struct cs_dsp_mock_bin_builder *builder,
 			       unsigned int alg_id, unsigned int alg_ver,
 			       int mem_region, unsigned int reg_addr_offset,
 			       const void *payload_data, size_t payload_len_bytes);
+void cs_dsp_mock_bin_add_patch_off32(struct cs_dsp_mock_bin_builder *builder,
+				     unsigned int alg_id, unsigned int alg_ver,
+				     int mem_region, unsigned int reg_addr_offset,
+				     const void *payload_data, size_t payload_len_bytes);
 struct firmware *cs_dsp_mock_bin_get_firmware(struct cs_dsp_mock_bin_builder *builder);
 
 struct cs_dsp_mock_wmfw_builder *cs_dsp_mock_wmfw_init(struct cs_dsp_test *priv,
-- 
2.43.0

