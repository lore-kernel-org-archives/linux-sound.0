Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B34F340F8ED;
	Wed, 21 Jan 2026 13:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769001777; cv=fail; b=TL7JbMN+OzXJSFVt5v6jZZKqQJaxMfBTy9jekz8g7E4zJ8F/TLKRIGTRqFQYAIzg+NEfcs+8e7SEEVJVd24e2ERHkn1HK+ta5o1wP3yojaryPdO/xlwlhaDCtOW8HwXqhZHISia8bMgo9TOfVd1jeHwrue4ZEIv6wTqehhQodpc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769001777; c=relaxed/simple;
	bh=TTi/eJhhqRM9O/DBZpS6w9IoidxswVqP22Uaes22YWY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TrROe8tvNyWu/9Zyb61ehv04ah1iOaFgmTaaaT1bC8a8UFQK9ZT/BuF5N6R/ZE44p+dQWyo4Xfc74bVvRU4A8Ka+RsPFjCxQEEMuCfvRtPiGhdLTC9lD73ji834YbZfo1gu7r0EBzVWsdGQW6SoJbkFDfQy9Ov9fOeuB7OEGX08=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=Xnb0Ny1q; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=OmkKcMv0; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="Xnb0Ny1q";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="OmkKcMv0"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60L6X8544091091;
	Wed, 21 Jan 2026 07:22:51 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=crlZEpQAwe+o3S2RvbiP0CEoiAwwal0Co53ChPAmDhM=; b=
	Xnb0Ny1qQE+3pJ0AmS8XuZ+8P6z4L9NB61Sf2SoHx5m+ynHyAQatEyc10GdbsGhW
	cmGLWGfXrryzV87XQa+WGHTrB0k7god6P/KhmRZAWRo7aOvUGth9MNsmrE1X7l86
	7SO/JbSWpLPJ40EgEWBtDiWwtIDoK9kXf4w8VRI3KPJwssRkiCcIvFLdPltOcued
	KNH/g5fQYwl9/uQjcBg+t00NkLH4HjM8Wwzo/YboRisqkcIAYKfL2HtmPpGM+t2z
	CCHJ5CbzFrwQL3/3iw95R2ojs1fV1z53N1ppBlNvLqX/OG5L6uROcX9d9q8gGBQc
	8kZVW85xOqBAOpCErQ3JHw==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11022079.outbound.protection.outlook.com [40.107.209.79])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4br7qjvta8-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 21 Jan 2026 07:22:51 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RELlR027nlm4paIl/VSkJIV1YcUs42PpXkR3/h8kNhemUrai9sjwk9CyjrWUJQJuj61+kbNuzXbpFAbZyzwyoNdSRS7V8urYIOktdukJdTrs6bq6/cGItfikniPoRHNB32PkoGk9rS/neXnuEDwKntjCvLJCOmXijLIkyx/43fbte8KsNW5CJlqyhiCN2ceunyQ8mRyFKzqr1xH/hUbx70FcoSYtf1biPsT4S46xpeEKCOxaMOH4Pz8+TYXnwEqqhwjrdoFzjiB216qoYDBc1594MRiNKrCk288Dc4Atnz+ao34mFIxE1I8KLUmBhu48XwjpvDht53+y+aOgW+Q9Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=crlZEpQAwe+o3S2RvbiP0CEoiAwwal0Co53ChPAmDhM=;
 b=vyHxvAKRDF4a3xW39oqvxV7f/NhOYKmTme+9lR1ak6VPAyEFYFwC5FhMrTVR8vtdTW+0t4hbjmzJXepRfyZ0H/AejkGN+ru5tkcMaT7H8tyCqHz04W1YqAyAwxGXm8scOZJ7dXQSRDG7fSQqScgahzaz/gMhLnkSNJT4TE8CStIZiZnENvRQt74zhb4dRkriYQCYJEJZ4lsQf9NqSLNhvFCuuvPOfDKZtB3FT5QUaudOYUXI9CH9uN7h3vyiJKcVI13rQtsax2mAkWKhmeStUJ/YIVGcxoSrSXC7syxVPTVdqL/XRW+fmIEPJK5XLXZNIs5bpK3wr9zvWvWgsOz+4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=crlZEpQAwe+o3S2RvbiP0CEoiAwwal0Co53ChPAmDhM=;
 b=OmkKcMv03m7JK5TV2TNzo6YeASW828p1v0pxz1Mw/dXEXZbOlQY0RjbV2p6Y/fHQ6/RgreiJyx2AlGC+lDzhR+osFph4C6QbtKkzECodEmrMsBQqr5zFI9XTleGOI7XH43poECszMD3MFIs6PV3DeQrDBj/LkuVnS3ex8/nzSaw=
Received: from BL0PR01CA0016.prod.exchangelabs.com (2603:10b6:208:71::29) by
 CH4PR19MB8657.namprd19.prod.outlook.com (2603:10b6:610:22a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 13:22:45 +0000
Received: from BL6PEPF0001AB71.namprd02.prod.outlook.com
 (2603:10b6:208:71:cafe::7b) by BL0PR01CA0016.outlook.office365.com
 (2603:10b6:208:71::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.10 via Frontend Transport; Wed,
 21 Jan 2026 13:20:55 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BL6PEPF0001AB71.mail.protection.outlook.com (10.167.242.164) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.4
 via Frontend Transport; Wed, 21 Jan 2026 13:22:45 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id E7791406543;
	Wed, 21 Jan 2026 13:22:43 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.24])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id D3C7382024A;
	Wed, 21 Jan 2026 13:22:43 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 3/5] ASoC: cs-amp-lib-test: Tests for reading SSIDExV2
Date: Wed, 21 Jan 2026 13:22:41 +0000
Message-ID: <20260121132243.1256019-4-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260121132243.1256019-1-rf@opensource.cirrus.com>
References: <20260121132243.1256019-1-rf@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB71:EE_|CH4PR19MB8657:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 43de1776-48ff-47c5-c658-08de58f02a16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|61400799027|36860700013|54012099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Jy1r5a6ODgHGl0DqgC83mUdzZWtvdBiAOIEOTGlPq3tXVsS7mI0jmyqUlG4p?=
 =?us-ascii?Q?kxXct+VGnlrb0SqMnG5+XXZjCIZwgN6Jv+wiKKjAxNS73FXFfNXoKsBg16EQ?=
 =?us-ascii?Q?nfvWFzXcdfisGh5uu6LCC6PIVrvxODfY8+UsfMPOLYMs3PkYiHE1CMcmUFV1?=
 =?us-ascii?Q?roCDI1jQAj07BYjq5SRZQ1AqMS6Pyv4ySLAv3uvwFLwxdc7FtUYWwYkk0emm?=
 =?us-ascii?Q?HLIZxUI9t9IpxJzoAOHT2I0zPAJPm25VVtyXQ/pvvLo7FiJXVK98FBwOJU92?=
 =?us-ascii?Q?G42jbDKiSXM9OWsnbP+pyvDTJOSM3aU4/Kw549tWEttYuY0tFr0/L7j2LUAp?=
 =?us-ascii?Q?n2WYE6lIRg5r18UL9ZjPPAy/u4sJIqvWzR9mUGEpAJx/NzWEnaJzwyRDYPFA?=
 =?us-ascii?Q?+mzFgIO2zPDouhlrRC3GR2ezXlgPhLD5bSSEchPktwVfQk6XdQixuFy8teem?=
 =?us-ascii?Q?zfhj7zN2cVqhXQFa/HnuTaykODUaC318V/sJTVv1AjWraFZ2Mr6tJwKSNFa2?=
 =?us-ascii?Q?tCZwybluRXj0ydn+wgQ1iUUvGXRoex+8eQ9bN7ppnpw7HYQtK4t4QdgIjSjT?=
 =?us-ascii?Q?kqLDyK5dv6DpgHgU2zxGv7q1AEfpvMGrf9I/macdG2x+GZYMuW4+4ss3CcBo?=
 =?us-ascii?Q?jGfq78xpN1BnUFmzy3/XErxpBom7pfxnXa/ghxxYEtGRo+l207D/oxbMcvRw?=
 =?us-ascii?Q?z1D+BNJqgqo9orwXVsQMHnZNti9YaEVjxnrWYR/QyyTLr7OazJJpMKfcYA6p?=
 =?us-ascii?Q?p9+/5mqNkAirwqdu9HmSu2aXLw0Kzuz7EeRKbxImDBDItvIzYmoJTRy6hehO?=
 =?us-ascii?Q?p2RlzPIaFWaE8cxTv8EXr59DM/V4s8A5WGN9RMS+XkASIagfPPFsiUpr7GQ5?=
 =?us-ascii?Q?sdANFb7QEd97DLzOO7RGy8aDM1askvc27enVa4KGKYWDdlQjBUKS9fQteTyK?=
 =?us-ascii?Q?1rXybxhB7ePywkcztFFR2q5C8T8kkBh8UZYoZoqPlP76lu2EVoJASuX0ymir?=
 =?us-ascii?Q?ShPFXolWNvzXi4LpiAstv9lQ6RO1ibppuHN2XkziJdB7Iw/qncZSTwY8JPSm?=
 =?us-ascii?Q?3rNZhcka5kxyNj0+I96bxzOi9yUV87NSt/B+By76pMFC6ZORyXIVd06PMObb?=
 =?us-ascii?Q?TYqLT7k9noJuVciMz0oNvzLEWEYXXkQxzVdYC8ubkkSevY8TJmmyhvuWExeS?=
 =?us-ascii?Q?mRMTET73xyE7Z2igevVYnyqEfQJzK7MCBv9MC+CYMZ9/dhfpiHaa8IC+RbdF?=
 =?us-ascii?Q?ebEq1raTgLnxXgd+kEkvQaBpCyGXqH27nWBMAyKkvNIz5jGf5umu6pOrJlO7?=
 =?us-ascii?Q?LweyUFo0aBc2jXMFzb+r3kQUF0mOilYqfC0KGChTlLgC/xPQWksEnW96VCho?=
 =?us-ascii?Q?umfPgIfFXIM4VMJnrm1INJ1NoI92NlCmV7Igimj+yZgzB4XuX4BBcz/+Yofn?=
 =?us-ascii?Q?enV29hKp/Ua0ePFPx3sYQt+KnTNxX7cKVLqQKDWUgCUVjXwO2w4nSlppNb0K?=
 =?us-ascii?Q?yASHtvZY+mQty+/A+ijv41oO1hbT7exrKnakmBJwX/iTj5x8DDOHl+ZBkt7N?=
 =?us-ascii?Q?DOVoeZoeg/TIg6UbMJM5cMC/Gb/VqjD9GOursx1l8CvlO1h5zDxeHLUa/XH+?=
 =?us-ascii?Q?ZjwmwIHyWxUOBUvKcKI+bee/fAa8yX9AuYNUlKxGTR6ubz8XYCnDH7T86Dkf?=
 =?us-ascii?Q?lttteg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(61400799027)(36860700013)(54012099003);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 13:22:45.2573
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 43de1776-48ff-47c5-c658-08de58f02a16
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BL6PEPF0001AB71.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH4PR19MB8657
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIxMDExMiBTYWx0ZWRfX3qQlQUr0f7EE
 Yoimeeyvexf5JdgRLFhgKi3uYhXKWAu9BR5PTpa+tMfnnGAsLsoUYQq53gjbhcMyNvft8I6Vw/t
 +J5k9+RFQNA57/9NKtPGmhRzjbeMheNsruqy818+qpvHWMSj22PG8+MNYyQZ//DPEpeATYxtjyt
 KyXWhcAOjiYFkiVRX1wgL28rFbRyU5dR3sp4CBOZmy2sO9H1oI2IxU/rUuiFyRgSaGRggqWe5uL
 kAIu2Cip0EWQjyoYoDAUBWjzjEMrLjf6fB0qIVVMuoD2YMeV28XWywvd+J2ITphcBYn7ElkcaK3
 ahsdUMwpro8Q6vG8sFh6ilah6cEgKLkZ7+LFuqhja+srxSJCOo1fHqmrBat5DepycwoQ7QwAuMt
 uY8Fgu8ygjx5aOW+J9e4lVtQWm3X6T+3JIeooylrUF5lFSejJMExBAcosv4cDLNogCP9GpfwVxF
 C8aGGbXfy63w5fzOVnQ==
X-Proofpoint-GUID: eOR-r79QE2ywuoUGrAoZoTGfpbJtDPSl
X-Authority-Analysis: v=2.4 cv=GrRPO01C c=1 sm=1 tr=0 ts=6970d32b cx=c_pps
 a=/ox7Nx15/I3RpRoI+9JZHw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=w1d2syhTAAAA:8 a=2FL-I1ABYs5uegM3JscA:9
X-Proofpoint-ORIG-GUID: eOR-r79QE2ywuoUGrAoZoTGfpbJtDPSl
X-Proofpoint-Spam-Reason: safe

Adds test cases for getting a Dell SSIDExV2 string by calling
cs_amp_devm_get_vendor_specific_variant_id().

This is a fairly simple test harness, the redirected call to
cs_amp_get_efi_variable() returns a test string to simulate
reading a string from UEFI. The returned string should be
the second field in the SSIDExV2 string (if valid).

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/cs-amp-lib-test.c | 169 +++++++++++++++++++++++++++++
 1 file changed, 169 insertions(+)

diff --git a/sound/soc/codecs/cs-amp-lib-test.c b/sound/soc/codecs/cs-amp-lib-test.c
index 923f1857e45b..2b1529343f11 100644
--- a/sound/soc/codecs/cs-amp-lib-test.c
+++ b/sound/soc/codecs/cs-amp-lib-test.c
@@ -16,6 +16,7 @@
 #include <linux/list.h>
 #include <linux/module.h>
 #include <linux/overflow.h>
+#include <linux/pci_ids.h>
 #include <linux/platform_device.h>
 #include <linux/random.h>
 #include <sound/cs-amp-lib.h>
@@ -56,6 +57,8 @@ struct cs_amp_lib_test_ctl_write_entry {
 struct cs_amp_lib_test_param {
 	int num_amps;
 	int amp_index;
+	char *vendor_sysid;
+	char *expected_sysid;
 };
 
 static struct cirrus_amp_efi_data *cs_amp_lib_test_cal_blob_dup(struct kunit *test)
@@ -2305,6 +2308,98 @@ static void cs_amp_lib_test_spkid_hp_31(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, 1, cs_amp_get_vendor_spkid(dev));
 }
 
+static efi_status_t cs_amp_lib_test_get_efi_vendor_sysid(efi_char16_t *name,
+							 efi_guid_t *guid,
+							 u32 *returned_attr,
+							 unsigned long *size,
+							 void *buf)
+{
+	struct kunit *test = kunit_get_current_test();
+	const struct cs_amp_lib_test_param *param = test->param_value;
+	unsigned int len;
+
+	KUNIT_ASSERT_NOT_NULL(test, param->vendor_sysid);
+	len = strlen(param->vendor_sysid);
+
+	if (*size < len) {
+		*size = len;
+		return EFI_BUFFER_TOO_SMALL;
+	}
+
+	KUNIT_ASSERT_NOT_NULL(test, buf);
+	memcpy(buf, param->vendor_sysid, len);
+
+	return EFI_SUCCESS;
+}
+
+/* Fetch SSIDExV2 string from UEFI */
+static void cs_amp_lib_test_ssidexv2_fetch(struct kunit *test)
+{
+	const struct cs_amp_lib_test_param *param = test->param_value;
+	struct cs_amp_lib_test_priv *priv = test->priv;
+	struct device *dev = &priv->amp_dev->dev;
+	const char *got;
+
+	kunit_activate_static_stub(test,
+				   cs_amp_test_hooks->get_efi_variable,
+				   cs_amp_lib_test_get_efi_vendor_sysid);
+
+	got = cs_amp_devm_get_vendor_specific_variant_id(dev, PCI_VENDOR_ID_DELL, 0xabcd);
+	KUNIT_EXPECT_NOT_ERR_OR_NULL(test, got);
+	KUNIT_EXPECT_STREQ(test, got, param->expected_sysid);
+}
+
+/* Invalid SSIDExV2 string should be ignored */
+static void cs_amp_lib_test_ssidexv2_fetch_invalid(struct kunit *test)
+{
+	struct cs_amp_lib_test_priv *priv = test->priv;
+	struct device *dev = &priv->amp_dev->dev;
+	const char *got;
+
+	kunit_activate_static_stub(test,
+				   cs_amp_test_hooks->get_efi_variable,
+				   cs_amp_lib_test_get_efi_vendor_sysid);
+
+	got = cs_amp_devm_get_vendor_specific_variant_id(dev, PCI_VENDOR_ID_DELL, 0xabcd);
+	KUNIT_EXPECT_NOT_NULL(test, got);
+	KUNIT_EXPECT_EQ(test, PTR_ERR_OR_ZERO(got), -ENOENT);
+}
+
+static void cs_amp_lib_test_ssidexv2_not_dell(struct kunit *test)
+{
+	struct cs_amp_lib_test_priv *priv = test->priv;
+	struct device *dev = &priv->amp_dev->dev;
+	const char *got;
+
+	kunit_activate_static_stub(test,
+				   cs_amp_test_hooks->get_efi_variable,
+				   cs_amp_lib_test_get_efi_vendor_sysid);
+
+	/* Not returned if SSID vendor is not Dell */
+	got = cs_amp_devm_get_vendor_specific_variant_id(dev, PCI_VENDOR_ID_CIRRUS, 0xabcd);
+	KUNIT_EXPECT_NOT_NULL(test, got);
+	KUNIT_EXPECT_EQ(test, PTR_ERR_OR_ZERO(got), -ENOENT);
+}
+
+static void cs_amp_lib_test_vendor_variant_id_not_found(struct kunit *test)
+{
+	struct cs_amp_lib_test_priv *priv = test->priv;
+	struct device *dev = &priv->amp_dev->dev;
+	const char *got;
+
+	kunit_activate_static_stub(test,
+				   cs_amp_test_hooks->get_efi_variable,
+				   cs_amp_lib_test_get_efi_variable_none);
+
+	got = cs_amp_devm_get_vendor_specific_variant_id(dev, PCI_VENDOR_ID_DELL, 0xabcd);
+	KUNIT_EXPECT_NOT_NULL(test, got);
+	KUNIT_EXPECT_EQ(test, PTR_ERR_OR_ZERO(got), -ENOENT);
+
+	got = cs_amp_devm_get_vendor_specific_variant_id(dev, -1, -1);
+	KUNIT_EXPECT_NOT_NULL(test, got);
+	KUNIT_EXPECT_EQ(test, PTR_ERR_OR_ZERO(got), -ENOENT);
+}
+
 static int cs_amp_lib_test_case_init(struct kunit *test)
 {
 	struct cs_amp_lib_test_priv *priv;
@@ -2375,6 +2470,71 @@ static void cs_amp_lib_test_get_cal_param_desc(const struct cs_amp_lib_test_para
 KUNIT_ARRAY_PARAM(cs_amp_lib_test_get_cal, cs_amp_lib_test_get_cal_param_cases,
 		  cs_amp_lib_test_get_cal_param_desc);
 
+static const struct cs_amp_lib_test_param cs_amp_lib_test_ssidexv2_param_cases[] = {
+	{ .vendor_sysid = "abcd_00",		.expected_sysid = "00" },
+	{ .vendor_sysid = "abcd_01",		.expected_sysid = "01" },
+	{ .vendor_sysid = "abcd_XY",		.expected_sysid = "XY" },
+
+	{ .vendor_sysid = "1028abcd_00",	.expected_sysid = "00" },
+	{ .vendor_sysid = "1028abcd_01",	.expected_sysid = "01" },
+	{ .vendor_sysid = "1028abcd_XY",	.expected_sysid = "XY" },
+
+	{ .vendor_sysid = "abcd_00_WF",		.expected_sysid = "00" },
+	{ .vendor_sysid = "abcd_01_WF",		.expected_sysid = "01" },
+	{ .vendor_sysid = "abcd_XY_WF",		.expected_sysid = "XY" },
+
+	{ .vendor_sysid = "1028abcd_00_WF",	.expected_sysid = "00" },
+	{ .vendor_sysid = "1028abcd_01_WF",	.expected_sysid = "01" },
+	{ .vendor_sysid = "1028abcd_XY_WF",	.expected_sysid = "XY" },
+
+	{ .vendor_sysid = "abcd_00_AA_BB",	.expected_sysid = "00" },
+	{ .vendor_sysid = "abcd_01_AA_BB",	.expected_sysid = "01" },
+	{ .vendor_sysid = "abcd_XY_AA_BB",	.expected_sysid = "XY" },
+
+	{ .vendor_sysid = "1028abcd_00_AA_BB",	.expected_sysid = "00" },
+	{ .vendor_sysid = "1028abcd_01_AA_BB",	.expected_sysid = "01" },
+	{ .vendor_sysid = "1028abcd_XY_A_BB",	.expected_sysid = "XY" },
+};
+
+static void cs_amp_lib_test_ssidexv2_param_desc(const struct cs_amp_lib_test_param *param,
+						char *desc)
+{
+	snprintf(desc, KUNIT_PARAM_DESC_SIZE, "vendor_sysid:'%s' expected_sysid:'%s'",
+		 param->vendor_sysid, param->expected_sysid);
+}
+
+KUNIT_ARRAY_PARAM(cs_amp_lib_test_ssidexv2, cs_amp_lib_test_ssidexv2_param_cases,
+		  cs_amp_lib_test_ssidexv2_param_desc);
+
+static const struct cs_amp_lib_test_param cs_amp_lib_test_ssidexv2_invalid_param_cases[] = {
+	{ .vendor_sysid = "abcd" },
+	{ .vendor_sysid = "abcd_0" },
+	{ .vendor_sysid = "abcd_1" },
+	{ .vendor_sysid = "abcd_0_1" },
+	{ .vendor_sysid = "abcd_1_1" },
+	{ .vendor_sysid = "abcd_1_X" },
+	{ .vendor_sysid = "abcd_1_X" },
+	{ .vendor_sysid = "abcd_000" },
+	{ .vendor_sysid = "abcd_010" },
+	{ .vendor_sysid = "abcd_000_01" },
+	{ .vendor_sysid = "abcd_000_01" },
+
+	{ .vendor_sysid = "1234abcd" },
+	{ .vendor_sysid = "1234abcd_0" },
+	{ .vendor_sysid = "1234abcd_1" },
+	{ .vendor_sysid = "1234abcd_0_1" },
+	{ .vendor_sysid = "1234abcd_1_1" },
+	{ .vendor_sysid = "1234abcd_1_X" },
+	{ .vendor_sysid = "1234abcd_1_X" },
+	{ .vendor_sysid = "1234abcd_000" },
+	{ .vendor_sysid = "1234abcd_010" },
+	{ .vendor_sysid = "1234abcd_000_01" },
+	{ .vendor_sysid = "1234abcd_000_01" },
+};
+
+KUNIT_ARRAY_PARAM(cs_amp_lib_test_ssidexv2_invalid, cs_amp_lib_test_ssidexv2_invalid_param_cases,
+		  cs_amp_lib_test_ssidexv2_param_desc);
+
 static struct kunit_case cs_amp_lib_test_cases[] = {
 	/* Tests for getting calibration data from EFI */
 	KUNIT_CASE(cs_amp_lib_test_cal_data_too_short_test),
@@ -2434,6 +2594,15 @@ static struct kunit_case cs_amp_lib_test_cases[] = {
 	KUNIT_CASE(cs_amp_lib_test_spkid_hp_30),
 	KUNIT_CASE(cs_amp_lib_test_spkid_hp_31),
 
+	/* Test cases for SSIDExV2 */
+	KUNIT_CASE_PARAM(cs_amp_lib_test_ssidexv2_fetch,
+			 cs_amp_lib_test_ssidexv2_gen_params),
+	KUNIT_CASE_PARAM(cs_amp_lib_test_ssidexv2_fetch_invalid,
+			 cs_amp_lib_test_ssidexv2_invalid_gen_params),
+	KUNIT_CASE_PARAM(cs_amp_lib_test_ssidexv2_not_dell,
+			 cs_amp_lib_test_ssidexv2_gen_params),
+	KUNIT_CASE(cs_amp_lib_test_vendor_variant_id_not_found),
+
 	{ } /* terminator */
 };
 
-- 
2.47.3

