Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47B492BD5A8;
	Wed, 31 Dec 2025 17:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767202050; cv=fail; b=jbg2SmxvRQsJ8m6gweaBaBr4Wc2Lp60lFvavNJzaq1LtqfhjKsrjU34KJiYgD00+u/FKGBjgpO4zB9XmZUXjYvcZzE04LLsfGakuwq3MavIriOQ53kTlIwF5iY5JSZ1ypwm4pnBE21LQdWjpZjvSBezKL+w8GZWgNWjMzMOkGLY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767202050; c=relaxed/simple;
	bh=mmQWW2/Zt6gTkvMjDfhQJJIclsFvxB3a443lYWHcnKw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Qknb6iRuYmBeZI/cFNi0WsYYkJh88Haw9x485MUElv2HmCVp4DB5KdB2MVWih9adGK/mhT/Tj3omGSrbq7i3LxoZfjracYLIBPM7vCUsEewjq0LANsCsiFiHPEgvDbKFlg+UL2e3ul9iiHjINUvqn9ETwMvhrm+PnzXmcpUB2g0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=WGvlLIYG; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=PN1chWhG; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="WGvlLIYG";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="PN1chWhG"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BVGfx6O901218;
	Wed, 31 Dec 2025 11:27:26 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=4dzoCW/vrQP8M3Jew7qP95vlV55pQUYmFH0d2ssQdL8=; b=
	WGvlLIYGVD2BbNSjyNpZ9bSsHKMnentHoxnu374yZiD5KaxBCyPGV9LzMvojkghH
	kVhU+05VCYu1tCOq3nShlC5fpPM0qRv3dPis04dxd9BBeo5vucO73vRL2tyja1wb
	Ln6TrYeEr2wyRfVLlX1rH0FXpc2/IIWwnGm4Jj8W9GSM4Fgug4BML4UgBrfPiduN
	thO9A68wMlOeoEoj2dHNzoI7xts1AvVvYvmyZHxzMSq3rXoHRT3pi6hkWdZ+PwVW
	z0aDqXPPcX1SYNm0/yi7YvORxGaTpfR4switAfpG2JYKy3w3soGCLNOIdk7y9/My
	FtV6jrmcuvyK5aDM+9JgSw==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11021141.outbound.protection.outlook.com [40.107.208.141])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4badr3cakt-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 31 Dec 2025 11:27:26 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YhDwmxA4D9KWp4xBhcvwOjivrqosXgELnTor1/t3AATx6CDyUcb09MJ70xUyjXNFJV1p+VrMTMxmMtDQi60IZrNApOMBv2Ij/GaTV5V5SZw1LseKKcUgMYb1bG96BgFD5AVbHcgB8ZohrKYcdXagWWJn1gAjFYDhAFf8/bPtc7hs4ionoQCDWz44yjKVKJkWsVHDDEMadoji6PGmyDWSOXglA2z+K1/Muxg7DoL2h3F4PAOJvJtKBNoOLxDilupohZEqQOddRQyPs5+JTyw3Wdx76ft4z0CvSdnmGUbDqn14PQetm6AJdYP6PgvdkAOmia3H2TWgQOnxoqs5wE6dyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4dzoCW/vrQP8M3Jew7qP95vlV55pQUYmFH0d2ssQdL8=;
 b=ozClgGHXpKulIDpw+BoAXfrTzDtF30mQj0to+twzauxfZu14gS1iRp42Wgd3RqrkjV+vextvyjpqxueHQSVO485qoMPgMMy3L1/pFNl30AlYNRZhDDagxMa2k2VvXGaQwsTcLUr/TIJKKBPbzh+FzfD3potpQpgKtfdLop7SmlQoGG0nanKnZra4aBz8XIDpeiVl4+F6uODXEwaNK2RbKtL/eZUC0go5ih3xNEvr1VeUyuH3OX/1xQiv9RE4Pd1UgoGXKHfaG8y2LbXD12G9qsp99NHUSdXm6oJWyRgxGmMypmNN11xrzatG+SJKAFakUCFkCgUyEfgIHulph6fAVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4dzoCW/vrQP8M3Jew7qP95vlV55pQUYmFH0d2ssQdL8=;
 b=PN1chWhGcDOddM9ubYaAdGLN8m4bsFWdckje9Aau0D5BHG0JeI0f8X9z3Rja8XelZkNN3NMTy+H483SbKxwRmYhl2VUTNO/eMzmhDxuf5/u3AlT6vOz4VRjhOUUUf5SifDPJvSo0mTtjHPs2ll52+3tWNZysR2gocjGIEGKrkzU=
Received: from MN0PR03CA0012.namprd03.prod.outlook.com (2603:10b6:208:52f::25)
 by LV5PR19MB9082.namprd19.prod.outlook.com (2603:10b6:408:307::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Wed, 31 Dec
 2025 17:27:23 +0000
Received: from BN3PEPF0000B076.namprd04.prod.outlook.com
 (2603:10b6:208:52f:cafe::ac) by MN0PR03CA0012.outlook.office365.com
 (2603:10b6:208:52f::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4 via Frontend Transport; Wed,
 31 Dec 2025 17:27:20 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN3PEPF0000B076.mail.protection.outlook.com (10.167.243.121) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4
 via Frontend Transport; Wed, 31 Dec 2025 17:27:22 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 1BD4D406541;
	Wed, 31 Dec 2025 17:27:21 +0000 (UTC)
Received: from EDIN4L06LR3.ad.cirrus.com (EDIN4L06LR3.ad.cirrus.com [198.61.69.19])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id C99E9820249;
	Wed, 31 Dec 2025 17:27:20 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v2 5/8] firmware: cs_dsp: mock_bin: Add function to create long-offset patches
Date: Wed, 31 Dec 2025 17:27:08 +0000
Message-ID: <20251231172711.450024-6-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251231172711.450024-1-rf@opensource.cirrus.com>
References: <20251231172711.450024-1-rf@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B076:EE_|LV5PR19MB9082:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: f1234bd5-45e9-44b1-2906-08de4891dbb8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?nIf4FWJTWQrxItiRe09k6+QGWkmB49fH+PETAMq4aew+V5pvk6DVJBJ4w6Ez?=
 =?us-ascii?Q?NP8mADxdXfZt1mK1hMC8QqrfTR/IlK1L205MiZhGv8+xSMhU5TRrw/W2CDIw?=
 =?us-ascii?Q?8h3U/Zs0/n6/djaDsk9iEYxDVz+C8Xny+vl7pHgZ9OgusJxU2Bcs+CM+mjPI?=
 =?us-ascii?Q?sWezH41SYNGMXYUbhccQsm7fMkeBxvfWFPfknD2mmAch3vW3P11qSnYg8s+z?=
 =?us-ascii?Q?O+w+S4vLmeu4UuHPq7r5Iy/iD8gqoqWDS8bGdQzAyqOkvAvnSwPqK6H2yp+Y?=
 =?us-ascii?Q?WXkWHKAo/s4hrh2NSr7FFB6h+MuaO2SouID4W/NCLL6oOcqMYpxE6FsLPKo3?=
 =?us-ascii?Q?otzueKTwt1+Ry/mg1ZpLBoTHupynQBP9hJq13ZdbcSwzXSrXsuxkIDTcci9H?=
 =?us-ascii?Q?psoFs4ZVUQOoGt9bWnRENa4YOGzfE55WEizdJoRdpX7iXRg0VBtLmhIVetiu?=
 =?us-ascii?Q?zUrOoIBFnyVtwMtRGbiUF69HGg5MEgViXULGqg1VlCBZlKtxG0ivb9z6wp50?=
 =?us-ascii?Q?SsE3WsVhm8zHETlwYSIpo7BimyHU2ketHdfeklDN7PnRROEgQ/ps0pFLeDMy?=
 =?us-ascii?Q?viZCHT8Czd0VPWyRF4Nod6cU8EYqTqYSLiChJx6my3QpLQ8EkoaK6qlumFsu?=
 =?us-ascii?Q?/5lLW3D71S0Zd6apffUtKASsFUpF9XRt6yEFNezARyx4tEhcA3dSSUaMhiQA?=
 =?us-ascii?Q?NDquCWkkToaK17JUijr046E98r/P3am4E99HfUZJKs5OxI+ILVDvI5lJB3IB?=
 =?us-ascii?Q?NkBoj1F1fdMHOvzd8RpjUijzLq+cvoSYMN8ONKY8DlF2pDCQQaYn08setsXs?=
 =?us-ascii?Q?PN95s2dY6RglAdPZ8AiP3ifkn1oy4skxNYcDdZbSWbE6CGD69ToHUtlXw/uR?=
 =?us-ascii?Q?eNQQm/u4HU0zvSkkJ5221pr3M+/4SvZ8D5TkcPAJyXuFS1wOr3JyOOjbJzx5?=
 =?us-ascii?Q?ZqkBZ3YCXH+SLwwWgi12QTDo40yKrEdANy/7U+c5iGpk/ODpHiVyJ4NFkeKV?=
 =?us-ascii?Q?dSmLTxgpchhnj6koJJ95KEB2zjUrXoZ7/0I/H9tHD0mOlzk5oiriPw3gQFDW?=
 =?us-ascii?Q?7+asO58uYRm09nkLgJ+g/vC6S4B7nzwJq9NaFli4IQU3NHUtELD3grrD0URN?=
 =?us-ascii?Q?RAJKG7NvEicYbH3093XilHoFuvol+0SgLWGXooj1Npfio6Aka2jEVsQOMW/r?=
 =?us-ascii?Q?iLZKM2kxkfnLS0HhKa6qlVQ2JUtHEcLA/UcYlAB5mjsMngz3J9pu/f1McN95?=
 =?us-ascii?Q?qKuusdRIBKIheZPIeEHH5nScZB8UJSecf/+F3L9dcgQ6W6SgH0TmxIZE2Iq0?=
 =?us-ascii?Q?rtMFmdAdWdgLiknIewkttpnTbq8u7Yy1fDmwoerSrv54WZMM2owzAmiY4tZH?=
 =?us-ascii?Q?6xeIxM6p+gmT3GGNP+Ou8rmbrYtQ0/RKj3DATZ8eHZQSCakvHg+di26yUWAw?=
 =?us-ascii?Q?2e8VLyRAwq46uV22SzKCsbRrEPu+kz51jtak/6dW6cwQNnLXLTqItypaEEaP?=
 =?us-ascii?Q?vWFlx2fCiK7wO01EI+DmaAWuFscclPDthRXLqulPFiKcaVk9MAWaRmwWqE5E?=
 =?us-ascii?Q?2C4/NujwPzD4ZCytJ7c=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Dec 2025 17:27:22.4797
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f1234bd5-45e9-44b1-2906-08de4891dbb8
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN3PEPF0000B076.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV5PR19MB9082
X-Proofpoint-GUID: vT60nyhjBLxDH91Wzm_LaRXfflq02i8U
X-Authority-Analysis: v=2.4 cv=Z8Hh3XRA c=1 sm=1 tr=0 ts=69555cfe cx=c_pps
 a=azlkv/KBQR0ub+Yip4pvTg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=wP3pNCr1ah4A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=w1d2syhTAAAA:8 a=E_BJAL8Xh-jSrSI2yN4A:9
X-Proofpoint-ORIG-GUID: vT60nyhjBLxDH91Wzm_LaRXfflq02i8U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMxMDE1MyBTYWx0ZWRfX9DgMSCgSMTVF
 zsWWE2Vbi3MtHCa5ReWtuoL632Ts7S6k3g3QZgiLoRDI+cDZ56MfnOnMc2pF055cqQEN3oidPy0
 nAV7G9eUmLc4mr1P2FGmi2NOBgExKE8+6ymZ3lvsL7VU6jC7nZFwb7HKWsunk/w3yKE+iH+nlkJ
 dnNjW+UnB2zPq2m4Ot4bWGLGukI6c/fHIjeSUy6FzElerhCac7EznGz4YPjxJr5oLXDfrX0+27H
 FvLBfj/9oGO9AUCIDdRQT/UJCiwErt5ITbcb8Q891dkyGPwoJ5+GcoYOsUpqIE99c+j/JVpBcEp
 kMZgI3/9WYbYRXgQkrKtxlfTbyIJq1u3M2AIKx4g9h1S2LTwbtRm2xWwPs3f9ME1SiZyMASozPK
 zMJaXyeu4Zfw+aTG33jCNpaNnzzzDyB2mjti6fubhj7FQHDtikIuF2EHUh9QMSMjGeARaHcuuIQ
 ciaoaCp26kJMuD+mLWw==
X-Proofpoint-Spam-Reason: safe

Add cs_dsp_mock_bin_add_patch_off32(). This is the same as
cs_dsp_mock_bin_add_patch() except that it puts the offset in the
new 32-bit offset field and modifies the block type to indicate
that it uses the long offset.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
No changes since V1.

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

