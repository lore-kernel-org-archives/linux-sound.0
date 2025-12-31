Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F02827C84B;
	Wed, 31 Dec 2025 10:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767178229; cv=fail; b=mf8nutVpqDRf666xJzf58RldcLE5Jv+xNW6y+Y+Iu6vPZOvYRhVSLJA7PcNnf4U21HvVkI1vHyqtk7lVBwC61kvrnWJih5+RLrcVMacxFsSFbAQE7mGucoTvDlO/q/ArQnNCCSjJV3/fUI+wt8aiLk2amEgdos642GaiVixpXoM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767178229; c=relaxed/simple;
	bh=Sk0IVL7YTOV+aFe8nJ4fDZZOdUh9b7FHlBi24nqQEDk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IQcyLIu4axD1oWvMbGhi5kJpOmKAGGKSBlRNXNZcB2rfR+U7Rp1xHHgdtOG9nFFt5KhhXzoInrgmc7o+z2D5G8NOGXtXT1A/TpbQYlopNRdGbZKGfi1wuV1WBvqyBCQAoTr4W/+xPUgUkCxWp2bHj+3/hNGWGK6yGDJoYrz0cn0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=Ca4CZCFb; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=roquAU7H; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="Ca4CZCFb";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="roquAU7H"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BVAZRCY331591;
	Wed, 31 Dec 2025 04:50:13 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=cUe8mewnpduuCKinyhqYqaosRJAPkt6+zy4Y70FHxn0=; b=
	Ca4CZCFbiE6gJe8S4LYlag02/CeC/UN8nuJ8GmaORlj346pK9UiiQ4USab777eYZ
	JZ8agapV37nDQYOGbDZaAhDJeJgbO0JejjskMNLI06ya+ISEvlOf+9X2IIFe96qn
	KOSqE7aLGhiofNv4XWx74JaCN6V/4W9b/1Rp0VC8YjrsAVugs10+hvNdI1WJ/064
	Fwak2lvhrTn0rMjfw1H5vSI+i9PN8B4tE3LchkuxEbJlc3VfZ2h77mNlgXErUoLv
	rXBaM1QekWWmkHVXk9RMWTjemgY4gpRkgFcJqBAXe8cHcJNseR8FJF4UzgMthLG/
	LskXV9tqBDPHj4+iDZYiSQ==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11020089.outbound.protection.outlook.com [52.101.201.89])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4badr3c1q9-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 31 Dec 2025 04:50:13 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xcywzu0kcb/PysrCcFjuhaqPCWq+zUlAE/8Nc1e8kdfDjawuBEMbqDxHOXjFmifZzD0BCjRaZcjq8SQJxaEYSgIcWSsTiu5lRzMC9R2fSMg9O5pyNenRpQB3fLbKozIY7wuH/jKqvTWNa7y2dji2bgZpQLUzIytsndTJBhSA5CfGwIcZM+cQ27JKZCibHvY/GP8kYucgJJ8kESxCNHP/UATrVwHWw0ETv3AeIwrYiqHB5AUY76nleVTnFXmHK3zDzz8+hR5GNo48HpF9UrS1VCF+90bMpzo4709TsiOxcvVEUtFeM4J+6Yu0lZywt6Juox7CPQxnvSfSlsEUmJhuQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cUe8mewnpduuCKinyhqYqaosRJAPkt6+zy4Y70FHxn0=;
 b=Vl/m5qb2nlN6a2PB8KndZcKtRTc9rMS5Y0jLywhDgep9J0C8s4QCrzRRCo5xHDm/2y0Mei13+B6Vk6+KcE2q7am1zPQi/+h1cq+qDXIVJI8pwc4ayqd6yeAjYP25MpBoOlM4a8m30BP/vJX+UvPwsa+QegXy+4od2mjZRV0zpp+QLjzCn8oNxfG7Jk0J6WqjVpHmlHp/IJAQlXKdqPYt4i23wHQOXHOF/f4sES1BvSQkm/V8wY/qngQMnz+lONMZwRf8uuhKlgZrHgkMIU39G8awSZHqkujpodhdveXBfv0SZdOmrIsRS5sAssHjEBjBg4X0zcmtpcvHAkh8Kw5/Lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cUe8mewnpduuCKinyhqYqaosRJAPkt6+zy4Y70FHxn0=;
 b=roquAU7Huqj1bDrzZuyfsHKj1AfKQHcFOnmhdVcYVrDv7sC8Q/SQSTlixOkqcZnA5WxBE6lOYVeew0zYIHGnaLOSrCPWUnZap5Ljwms2FRfI9TvIPPvwosmNZK3gAVVp7HwoCKw4Wlk15e/B3nFPfoBKBRGmFEQL0ZQxR803vnk=
Received: from CY8P220CA0023.NAMP220.PROD.OUTLOOK.COM (2603:10b6:930:46::13)
 by PH8PR19MB7070.namprd19.prod.outlook.com (2603:10b6:510:222::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Wed, 31 Dec
 2025 10:50:08 +0000
Received: from CY4PEPF0000EE39.namprd03.prod.outlook.com
 (2603:10b6:930:46:cafe::93) by CY8P220CA0023.outlook.office365.com
 (2603:10b6:930:46::13) with Microsoft SMTP Server (version=TLS1_3,
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
 CY4PEPF0000EE39.mail.protection.outlook.com (10.167.242.11) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4
 via Frontend Transport; Wed, 31 Dec 2025 10:50:07 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 6919F406543;
	Wed, 31 Dec 2025 10:50:06 +0000 (UTC)
Received: from EDIN4L06LR3.ad.cirrus.com (EDIN4L06LR3.ad.cirrus.com [198.61.69.19])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id DA933820249;
	Wed, 31 Dec 2025 10:50:05 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 7/8] firmware: cs_dsp: test_bin: Run test cases on long-offset blocks
Date: Wed, 31 Dec 2025 10:49:55 +0000
Message-ID: <20251231104956.449696-8-rf@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE39:EE_|PH8PR19MB7070:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: ee3c7068-5535-4943-17e6-08de485a5d0b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|61400799027|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?NsGFLJ/+saI0K03sERw0ab47CMZMiQzGr6mGdtC6JmOr76PmN598Xm/wzQeE?=
 =?us-ascii?Q?d4V1I09ecYLSAPUNbf2Uu/WeR8b4HhatKRglouLb4d2WUNCwePO4+fSquvt+?=
 =?us-ascii?Q?S4g7dUsVFC2quPb4H3dIDU04m6UL7jlHhS4WnuEi7ddm5H2U8trQiyei7epw?=
 =?us-ascii?Q?rW4IYTPySEaqc8qnv7Hv8hwfB6mzN5gzVrb26w6pHIRZ0AM8d3sIHFkqJAy9?=
 =?us-ascii?Q?rdJ9EMRWO9UyR8MC7P8E/1MGUxfUE9sU3+AH8dVun35WLWRZKSbcs7AyL4O2?=
 =?us-ascii?Q?RdMagK+ggg3+ll+oh6kjTYKebexjzrQKcvHNZMUmda/mWQxcDCyN2EjgRkg6?=
 =?us-ascii?Q?34JHomJfZxAgPysQwK+r3PPFljsgvzTbYjc1KfTVYbtBVTpDgfRZgzgfpFJS?=
 =?us-ascii?Q?ucf7qilcE7F5dEbjqtATgTRfLQQnp9ndVT4af/Clz4TLQdJOhKmgULKZV72a?=
 =?us-ascii?Q?W2vg8g9od/a/8UHTsVSeLbh0oCQv6/cRO6eItwBAZFzbNKDwTdACtOUJFmjf?=
 =?us-ascii?Q?9NTRR36QyZE8ZNuBpeeNxygC/ZwI2zKcRvzOrkI2vISppepnfco0mWE2yhcA?=
 =?us-ascii?Q?NNdUcKmNXKNGxC6OlYbsNQrUTywwrIlDL3XofdDLvDgGCR1/xZufqUYrLrQu?=
 =?us-ascii?Q?djff/WI/leszwUmJoEqvkIAw6tSw8oc93UwPW5jGELVZ2hrH2MINkyR8MAjk?=
 =?us-ascii?Q?WdbLVVTVYwzy0rH1Hx8DZiYGNxa4hsUjXCAFzvgvGNMPdqTnuNnhBa4BCMot?=
 =?us-ascii?Q?Kp0kstelKSeEi/aQCDxkbS8gy0LJ7m0F/GnWz/rCRkbY5KPXDVcPJXPeyTyL?=
 =?us-ascii?Q?xHambOHDPdoFGOBKh0n7GwiNwQ1trgA8liYD3DkXyqHoOmDtcAMRHMb648ms?=
 =?us-ascii?Q?O+W7Qj3D/kpm10YEcEe1ks2xmGcKHIU3OB9YmZwwx4GK/wiMBtSdDqy20Pjt?=
 =?us-ascii?Q?F0IL34jdRd1yT/9M2bPrYQznUCNDwHiMoBw3lcIZSBnfh51zyewNppCKEnm5?=
 =?us-ascii?Q?kL56i5IAMNN/1h1QCNI+f7VEY4Qj7SrHsoG3HBO2l2lDez3qXQ4eQDqE/J7P?=
 =?us-ascii?Q?z9y/xcc38duGFkNyo93kPM3rGtPctU3YaJssLqpMhUKym99NAjpmq9OVIngi?=
 =?us-ascii?Q?NA8JDLeYozECMVklG3chHDec/kjYJ0RCs3pq03N/gib5p0epzUhrHAlSn8UI?=
 =?us-ascii?Q?e0e11PcZeZgNQb3bmlkBMi5P233SNZhTuDpMgViLvTOwavNv2BbtgOOtv5yv?=
 =?us-ascii?Q?YORnqGPyt7QXbrLpG3gInVxT+ciW0ljwTAvrvy2XO6HDaZHiHUZy5xxftjTC?=
 =?us-ascii?Q?zJ3bzL6MBJIq/CsuLSxQzJeI3DA1LRv0bjQZpcWTB4HDs5mubYfoFjvtWfhk?=
 =?us-ascii?Q?Eq1091Eu6ifCf/zOh1jcZcfY/deXHdHK94Ln4O9mHw3VU0q5kup6G+clTYPZ?=
 =?us-ascii?Q?OgBSls2f7vRLjikfraS5PFZu+XuQjBBgbActbxmqQhoRxUdUxS45vff8s7J2?=
 =?us-ascii?Q?0r7M2TvB39+hT0O8jiIXWQwpeQP3lGKJ6laxwmM9Q+UEoS+7Cn8BmhcZ+1Yh?=
 =?us-ascii?Q?plHnDP0RvUwUQMfBMGc=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(61400799027)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Dec 2025 10:50:07.5604
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ee3c7068-5535-4943-17e6-08de485a5d0b
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CY4PEPF0000EE39.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR19MB7070
X-Proofpoint-GUID: 8BncOmPZfMIWb7LuqunOR-nu17zkoqFb
X-Authority-Analysis: v=2.4 cv=Z8Hh3XRA c=1 sm=1 tr=0 ts=6954ffe5 cx=c_pps
 a=ztQKeGOog0QVs0B1QXIMEA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=wP3pNCr1ah4A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=w1d2syhTAAAA:8 a=9aw_-pf0KlnW5EXjf9MA:9
X-Proofpoint-ORIG-GUID: 8BncOmPZfMIWb7LuqunOR-nu17zkoqFb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMxMDA5NSBTYWx0ZWRfX5RBhrfG3V3E8
 O1R0WoPglw8u+jdgGJPV8vhMR7imTE+JN0RJe6PT5hlugLvR1SnL+hjPA7aaP2FcYgM0JQ8f6kB
 9+jECEx1RFzk8dBSKDR7YaCmCq7zIW1XpI2lFAvL/g+mwcI29yixcek6R7YOqmlpA9ckykUAaHJ
 0aMQNfXp58duejm3hSH3IVvUVHl/rw4dOncQFw5NwJpT278BbKJ5SYudW4wBHTiI6uXH4ziCmom
 1m0V8daKWmoICwd1ygzigIMhJZUPwNcaW6SNOwTlNw8lzbdlldU+kNOwcgEMJzESq1FD8ijM4lC
 L7tmqy+4mXKfxV5nkiEZBgzu+8JmYhvIQAop/K04rB6WpVuexQw0NyWJCATgTSXyl9UWUbNrMNC
 4UN/m9wQfW5KLlcRs6glGjKXPs1AvFGeB1v00M16Do3+S7h3uZs+xEBxp6NzhEnP/egbv6R29bH
 I3URP6VRZ10IzCgpLLQ==
X-Proofpoint-Spam-Reason: safe

Run the patch block test cases using the new long-offset block type.

This adds a new set of parameterization that uses
cs_dsp_mock_bin_add_patch_off32() to create the patch blocks in the
test bin file.

The test cases for Halo Core with V3 file format include another
run of the tests with the new parameterization, so that the tests
are run on the standard blocks and the long-offset blocks.

This commit does not add any new cases for offsets > 0xffff.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 .../firmware/cirrus/test/cs_dsp_test_bin.c    | 229 +++++++++++++++++-
 1 file changed, 220 insertions(+), 9 deletions(-)

diff --git a/drivers/firmware/cirrus/test/cs_dsp_test_bin.c b/drivers/firmware/cirrus/test/cs_dsp_test_bin.c
index 7f53fa9964c4..67af7da4f8c1 100644
--- a/drivers/firmware/cirrus/test/cs_dsp_test_bin.c
+++ b/drivers/firmware/cirrus/test/cs_dsp_test_bin.c
@@ -2300,6 +2300,7 @@ static int cs_dsp_bin_test_adsp2_16bit_init(struct kunit *test)
 }
 
 #define WMDR_PATCH_SHORT .add_patch = cs_dsp_mock_bin_add_patch
+#define WMDR_PATCH_LONG .add_patch = cs_dsp_mock_bin_add_patch_off32
 
 /* Parameterize on choice of XM or YM with a range of word offsets */
 static const struct bin_test_param x_or_y_and_offset_param_cases[] = {
@@ -2324,6 +2325,28 @@ static const struct bin_test_param x_or_y_and_offset_param_cases[] = {
 	{ .mem_type = WMFW_ADSP2_YM, .offset_words = 20, WMDR_PATCH_SHORT },
 };
 
+static const struct bin_test_param x_or_y_and_long_offset_param_cases[] = {
+	{ .mem_type = WMFW_ADSP2_XM, .offset_words = 0,  WMDR_PATCH_LONG },
+	{ .mem_type = WMFW_ADSP2_XM, .offset_words = 1,  WMDR_PATCH_LONG },
+	{ .mem_type = WMFW_ADSP2_XM, .offset_words = 2,  WMDR_PATCH_LONG },
+	{ .mem_type = WMFW_ADSP2_XM, .offset_words = 3,  WMDR_PATCH_LONG },
+	{ .mem_type = WMFW_ADSP2_XM, .offset_words = 4,  WMDR_PATCH_LONG },
+	{ .mem_type = WMFW_ADSP2_XM, .offset_words = 23, WMDR_PATCH_LONG },
+	{ .mem_type = WMFW_ADSP2_XM, .offset_words = 22, WMDR_PATCH_LONG },
+	{ .mem_type = WMFW_ADSP2_XM, .offset_words = 21, WMDR_PATCH_LONG },
+	{ .mem_type = WMFW_ADSP2_XM, .offset_words = 20, WMDR_PATCH_LONG },
+
+	{ .mem_type = WMFW_ADSP2_YM, .offset_words = 0,  WMDR_PATCH_LONG },
+	{ .mem_type = WMFW_ADSP2_YM, .offset_words = 1,  WMDR_PATCH_LONG },
+	{ .mem_type = WMFW_ADSP2_YM, .offset_words = 2,  WMDR_PATCH_LONG },
+	{ .mem_type = WMFW_ADSP2_YM, .offset_words = 3,  WMDR_PATCH_LONG },
+	{ .mem_type = WMFW_ADSP2_YM, .offset_words = 4,  WMDR_PATCH_LONG },
+	{ .mem_type = WMFW_ADSP2_YM, .offset_words = 23, WMDR_PATCH_LONG },
+	{ .mem_type = WMFW_ADSP2_YM, .offset_words = 22, WMDR_PATCH_LONG },
+	{ .mem_type = WMFW_ADSP2_YM, .offset_words = 21, WMDR_PATCH_LONG },
+	{ .mem_type = WMFW_ADSP2_YM, .offset_words = 20, WMDR_PATCH_LONG },
+};
+
 /* Parameterize on ZM with a range of word offsets */
 static const struct bin_test_param z_and_offset_param_cases[] = {
 	{ .mem_type = WMFW_ADSP2_ZM, .offset_words = 0,  WMDR_PATCH_SHORT },
@@ -2350,18 +2373,35 @@ static const struct bin_test_param packed_x_or_y_and_offset_param_cases[] = {
 	{ .mem_type = WMFW_HALO_YM_PACKED, .offset_words = 12, WMDR_PATCH_SHORT },
 };
 
+static const struct bin_test_param packed_x_or_y_and_long_offset_param_cases[] = {
+	{ .mem_type = WMFW_HALO_XM_PACKED, .offset_words = 0,  WMDR_PATCH_LONG },
+	{ .mem_type = WMFW_HALO_XM_PACKED, .offset_words = 4,  WMDR_PATCH_LONG },
+	{ .mem_type = WMFW_HALO_XM_PACKED, .offset_words = 8,  WMDR_PATCH_LONG },
+	{ .mem_type = WMFW_HALO_XM_PACKED, .offset_words = 12, WMDR_PATCH_LONG },
+
+	{ .mem_type = WMFW_HALO_YM_PACKED, .offset_words = 0,  WMDR_PATCH_LONG },
+	{ .mem_type = WMFW_HALO_YM_PACKED, .offset_words = 4,  WMDR_PATCH_LONG },
+	{ .mem_type = WMFW_HALO_YM_PACKED, .offset_words = 8,  WMDR_PATCH_LONG },
+	{ .mem_type = WMFW_HALO_YM_PACKED, .offset_words = 12, WMDR_PATCH_LONG },
+};
+
 static void x_or_y_or_z_and_offset_param_desc(const struct bin_test_param *param,
 					   char *desc)
 {
-	snprintf(desc, KUNIT_PARAM_DESC_SIZE, "%s@%u",
+	snprintf(desc, KUNIT_PARAM_DESC_SIZE, "%s@%u %s",
 		 cs_dsp_mem_region_name(param->mem_type),
-		 param->offset_words);
+		 param->offset_words,
+		 (param->add_patch == cs_dsp_mock_bin_add_patch_off32) ? "offs32" : "");
 }
 
 KUNIT_ARRAY_PARAM(x_or_y_and_offset,
 		  x_or_y_and_offset_param_cases,
 		  x_or_y_or_z_and_offset_param_desc);
 
+KUNIT_ARRAY_PARAM(x_or_y_and_long_offset,
+		  x_or_y_and_long_offset_param_cases,
+		  x_or_y_or_z_and_offset_param_desc);
+
 KUNIT_ARRAY_PARAM(z_and_offset,
 		  z_and_offset_param_cases,
 		  x_or_y_or_z_and_offset_param_desc);
@@ -2370,19 +2410,31 @@ KUNIT_ARRAY_PARAM(packed_x_or_y_and_offset,
 		  packed_x_or_y_and_offset_param_cases,
 		  x_or_y_or_z_and_offset_param_desc);
 
+KUNIT_ARRAY_PARAM(packed_x_or_y_and_long_offset,
+		  packed_x_or_y_and_long_offset_param_cases,
+		  x_or_y_or_z_and_offset_param_desc);
+
 /* Parameterize on choice of packed XM or YM */
 static const struct bin_test_param packed_x_or_y_param_cases[] = {
 	{ .mem_type = WMFW_HALO_XM_PACKED, .offset_words = 0, WMDR_PATCH_SHORT },
 	{ .mem_type = WMFW_HALO_YM_PACKED, .offset_words = 0, WMDR_PATCH_SHORT },
 };
 
+static const struct bin_test_param packed_x_or_y_long_param_cases[] = {
+	{ .mem_type = WMFW_HALO_XM_PACKED, .offset_words = 0, WMDR_PATCH_LONG },
+	{ .mem_type = WMFW_HALO_YM_PACKED, .offset_words = 0, WMDR_PATCH_LONG },
+};
+
 static void x_or_y_or_z_param_desc(const struct bin_test_param *param,
 					   char *desc)
 {
-	snprintf(desc, KUNIT_PARAM_DESC_SIZE, "%s", cs_dsp_mem_region_name(param->mem_type));
+	snprintf(desc, KUNIT_PARAM_DESC_SIZE, "%s %s",
+		 cs_dsp_mem_region_name(param->mem_type),
+		 (param->add_patch == cs_dsp_mock_bin_add_patch_off32) ? "offs32" : "");
 }
 
 KUNIT_ARRAY_PARAM(packed_x_or_y, packed_x_or_y_param_cases, x_or_y_or_z_param_desc);
+KUNIT_ARRAY_PARAM(packed_x_or_y_long, packed_x_or_y_long_param_cases, x_or_y_or_z_param_desc);
 
 static const struct bin_test_param offset_param_cases[] = {
 	{ .offset_words = 0,  WMDR_PATCH_SHORT },
@@ -2396,12 +2448,27 @@ static const struct bin_test_param offset_param_cases[] = {
 	{ .offset_words = 20, WMDR_PATCH_SHORT },
 };
 
+static const struct bin_test_param long_offset_param_cases[] = {
+	{ .offset_words = 0,  WMDR_PATCH_LONG },
+	{ .offset_words = 1,  WMDR_PATCH_LONG },
+	{ .offset_words = 2,  WMDR_PATCH_LONG },
+	{ .offset_words = 3,  WMDR_PATCH_LONG },
+	{ .offset_words = 4,  WMDR_PATCH_LONG },
+	{ .offset_words = 23, WMDR_PATCH_LONG },
+	{ .offset_words = 22, WMDR_PATCH_LONG },
+	{ .offset_words = 21, WMDR_PATCH_LONG },
+	{ .offset_words = 20, WMDR_PATCH_LONG },
+};
+
 static void offset_param_desc(const struct bin_test_param *param, char *desc)
 {
-	snprintf(desc, KUNIT_PARAM_DESC_SIZE, "@%u", param->offset_words);
+	snprintf(desc, KUNIT_PARAM_DESC_SIZE, "@%u %s",
+		 param->offset_words,
+		 (param->add_patch == cs_dsp_mock_bin_add_patch_off32) ? "offs32" : "");
 }
 
 KUNIT_ARRAY_PARAM(offset, offset_param_cases, offset_param_desc);
+KUNIT_ARRAY_PARAM(long_offset, long_offset_param_cases, offset_param_desc);
 
 static const struct bin_test_param alg_param_cases[] = {
 	{ .alg_idx = 0, WMDR_PATCH_SHORT },
@@ -2410,15 +2477,24 @@ static const struct bin_test_param alg_param_cases[] = {
 	{ .alg_idx = 3, WMDR_PATCH_SHORT },
 };
 
+static const struct bin_test_param alg_long_param_cases[] = {
+	{ .alg_idx = 0, WMDR_PATCH_LONG },
+	{ .alg_idx = 1, WMDR_PATCH_LONG },
+	{ .alg_idx = 2, WMDR_PATCH_LONG },
+	{ .alg_idx = 3, WMDR_PATCH_LONG },
+};
+
 static void alg_param_desc(const struct bin_test_param *param, char *desc)
 {
 	WARN_ON(param->alg_idx >= ARRAY_SIZE(bin_test_mock_algs));
 
-	snprintf(desc, KUNIT_PARAM_DESC_SIZE, "alg[%u] (%#x)",
-		 param->alg_idx, bin_test_mock_algs[param->alg_idx].id);
+	snprintf(desc, KUNIT_PARAM_DESC_SIZE, "alg[%u] (%#x) %s",
+		 param->alg_idx, bin_test_mock_algs[param->alg_idx].id,
+		(param->add_patch == cs_dsp_mock_bin_add_patch_off32) ? "offs32" : "");
 }
 
 KUNIT_ARRAY_PARAM(alg, alg_param_cases, alg_param_desc);
+KUNIT_ARRAY_PARAM(alg_long, alg_long_param_cases, alg_param_desc);
 
 static const struct bin_test_param x_or_y_and_alg_param_cases[] = {
 	{ .mem_type = WMFW_ADSP2_XM, .alg_idx = 0, WMDR_PATCH_SHORT },
@@ -2432,16 +2508,31 @@ static const struct bin_test_param x_or_y_and_alg_param_cases[] = {
 	{ .mem_type = WMFW_ADSP2_YM, .alg_idx = 3, WMDR_PATCH_SHORT },
 };
 
+static const struct bin_test_param x_or_y_and_alg_long_param_cases[] = {
+	{ .mem_type = WMFW_ADSP2_XM, .alg_idx = 0, WMDR_PATCH_LONG },
+	{ .mem_type = WMFW_ADSP2_XM, .alg_idx = 1, WMDR_PATCH_LONG },
+	{ .mem_type = WMFW_ADSP2_XM, .alg_idx = 2, WMDR_PATCH_LONG },
+	{ .mem_type = WMFW_ADSP2_XM, .alg_idx = 3, WMDR_PATCH_LONG },
+
+	{ .mem_type = WMFW_ADSP2_YM, .alg_idx = 0, WMDR_PATCH_LONG },
+	{ .mem_type = WMFW_ADSP2_YM, .alg_idx = 1, WMDR_PATCH_LONG },
+	{ .mem_type = WMFW_ADSP2_YM, .alg_idx = 2, WMDR_PATCH_LONG },
+	{ .mem_type = WMFW_ADSP2_YM, .alg_idx = 3, WMDR_PATCH_LONG },
+};
+
 static void x_or_y_or_z_and_alg_param_desc(const struct bin_test_param *param, char *desc)
 {
 	WARN_ON(param->alg_idx >= ARRAY_SIZE(bin_test_mock_algs));
 
-	snprintf(desc, KUNIT_PARAM_DESC_SIZE, "%s alg[%u] (%#x)",
+	snprintf(desc, KUNIT_PARAM_DESC_SIZE, "%s alg[%u] (%#x) %s",
 		 cs_dsp_mem_region_name(param->mem_type),
-		 param->alg_idx, bin_test_mock_algs[param->alg_idx].id);
+		 param->alg_idx, bin_test_mock_algs[param->alg_idx].id,
+		 (param->add_patch == cs_dsp_mock_bin_add_patch_off32) ? "offs32" : "");
 }
 
 KUNIT_ARRAY_PARAM(x_or_y_and_alg, x_or_y_and_alg_param_cases, x_or_y_or_z_and_alg_param_desc);
+KUNIT_ARRAY_PARAM(x_or_y_and_alg_long, x_or_y_and_alg_long_param_cases,
+		  x_or_y_or_z_and_alg_param_desc);
 
 static const struct bin_test_param z_and_alg_param_cases[] = {
 	{ .mem_type = WMFW_ADSP2_ZM, .alg_idx = 0, WMDR_PATCH_SHORT },
@@ -2464,9 +2555,24 @@ static const struct bin_test_param packed_x_or_y_and_alg_param_cases[] = {
 	{ .mem_type = WMFW_HALO_YM_PACKED, .alg_idx = 3, WMDR_PATCH_SHORT },
 };
 
+static const struct bin_test_param packed_x_or_y_and_alg_long_param_cases[] = {
+	{ .mem_type = WMFW_HALO_XM_PACKED, .alg_idx = 0, WMDR_PATCH_LONG },
+	{ .mem_type = WMFW_HALO_XM_PACKED, .alg_idx = 1, WMDR_PATCH_LONG },
+	{ .mem_type = WMFW_HALO_XM_PACKED, .alg_idx = 2, WMDR_PATCH_LONG },
+	{ .mem_type = WMFW_HALO_XM_PACKED, .alg_idx = 3, WMDR_PATCH_LONG },
+
+	{ .mem_type = WMFW_HALO_YM_PACKED, .alg_idx = 0, WMDR_PATCH_LONG },
+	{ .mem_type = WMFW_HALO_YM_PACKED, .alg_idx = 1, WMDR_PATCH_LONG },
+	{ .mem_type = WMFW_HALO_YM_PACKED, .alg_idx = 2, WMDR_PATCH_LONG },
+	{ .mem_type = WMFW_HALO_YM_PACKED, .alg_idx = 3, WMDR_PATCH_LONG },
+};
+
 KUNIT_ARRAY_PARAM(packed_x_or_y_and_alg, packed_x_or_y_and_alg_param_cases,
 		  x_or_y_or_z_and_alg_param_desc);
 
+KUNIT_ARRAY_PARAM(packed_x_or_y_and_alg_long, packed_x_or_y_and_alg_long_param_cases,
+		  x_or_y_or_z_and_alg_param_desc);
+
 static struct kunit_case cs_dsp_bin_test_cases_halo[] = {
 	/* Unpacked memory */
 	KUNIT_CASE_PARAM(bin_patch_one_word, x_or_y_and_offset_gen_params),
@@ -2522,6 +2628,111 @@ static struct kunit_case cs_dsp_bin_test_cases_halo[] = {
 	{ } /* terminator */
 };
 
+static struct kunit_case cs_dsp_bin_test_cases_halo_wmdr3[] = {
+	/* Unpacked memory */
+	KUNIT_CASE_PARAM(bin_patch_one_word, x_or_y_and_offset_gen_params),
+	KUNIT_CASE_PARAM(bin_patch_one_multiword, x_or_y_and_offset_gen_params),
+	KUNIT_CASE_PARAM(bin_patch_multi_oneword, x_or_y_and_offset_gen_params),
+	KUNIT_CASE_PARAM(bin_patch_multi_oneword_unordered, x_or_y_and_offset_gen_params),
+	KUNIT_CASE_PARAM(bin_patch_one_word_multiple_mems, offset_gen_params),
+	KUNIT_CASE_PARAM(bin_patch_one_word_multiple_mems, alg_gen_params),
+	KUNIT_CASE_PARAM(bin_patch_multi_oneword_sparse_unordered, x_or_y_and_alg_gen_params),
+	KUNIT_CASE_PARAM(bin_patch_one_word_multiple_algs, x_or_y_and_offset_gen_params),
+	KUNIT_CASE_PARAM(bin_patch_one_word_multiple_algs_unordered, x_or_y_and_offset_gen_params),
+
+	/* Packed memory tests */
+	KUNIT_CASE_PARAM(bin_patch_1_packed,
+			 packed_x_or_y_and_offset_gen_params),
+	KUNIT_CASE_PARAM(bin_patch_1_packed_1_single_trailing,
+			 packed_x_or_y_and_offset_gen_params),
+	KUNIT_CASE_PARAM(bin_patch_1_packed_2_single_trailing,
+			 packed_x_or_y_and_offset_gen_params),
+	KUNIT_CASE_PARAM(bin_patch_1_packed_3_single_trailing,
+			 packed_x_or_y_and_offset_gen_params),
+	KUNIT_CASE_PARAM(bin_patch_1_packed_2_trailing,
+			 packed_x_or_y_and_offset_gen_params),
+	KUNIT_CASE_PARAM(bin_patch_1_packed_3_trailing,
+			 packed_x_or_y_and_offset_gen_params),
+	KUNIT_CASE_PARAM(bin_patch_1_single_leading_1_packed,
+			 packed_x_or_y_and_offset_gen_params),
+	KUNIT_CASE_PARAM(bin_patch_2_single_leading_1_packed,
+			 packed_x_or_y_and_offset_gen_params),
+	KUNIT_CASE_PARAM(bin_patch_2_leading_1_packed,
+			 packed_x_or_y_and_offset_gen_params),
+	KUNIT_CASE_PARAM(bin_patch_3_single_leading_1_packed,
+			 packed_x_or_y_and_offset_gen_params),
+	KUNIT_CASE_PARAM(bin_patch_3_leading_1_packed,
+			 packed_x_or_y_and_offset_gen_params),
+	KUNIT_CASE_PARAM(bin_patch_multi_onepacked,
+			 packed_x_or_y_and_offset_gen_params),
+	KUNIT_CASE_PARAM(bin_patch_multi_onepacked_unordered,
+			 packed_x_or_y_and_offset_gen_params),
+	KUNIT_CASE_PARAM(bin_patch_1_packed_multiple_mems, offset_gen_params),
+	KUNIT_CASE_PARAM(bin_patch_1_packed_multiple_mems, alg_gen_params),
+	KUNIT_CASE_PARAM(bin_patch_multi_onepacked_sparse_unordered,
+			 packed_x_or_y_and_alg_gen_params),
+	KUNIT_CASE_PARAM(bin_patch_1_packed_multiple_algs,
+			 packed_x_or_y_and_offset_gen_params),
+	KUNIT_CASE_PARAM(bin_patch_1_packed_multiple_algs_unordered,
+			 packed_x_or_y_and_offset_gen_params),
+	KUNIT_CASE_PARAM(bin_patch_mixed_packed_unpacked_random,
+			 packed_x_or_y_gen_params),
+
+	/* Unpacked memory with long-offset blocks */
+	KUNIT_CASE_PARAM(bin_patch_one_word, x_or_y_and_long_offset_gen_params),
+	KUNIT_CASE_PARAM(bin_patch_one_multiword, x_or_y_and_long_offset_gen_params),
+	KUNIT_CASE_PARAM(bin_patch_multi_oneword, x_or_y_and_long_offset_gen_params),
+	KUNIT_CASE_PARAM(bin_patch_multi_oneword_unordered, x_or_y_and_long_offset_gen_params),
+	KUNIT_CASE_PARAM(bin_patch_one_word_multiple_mems, long_offset_gen_params),
+	KUNIT_CASE_PARAM(bin_patch_one_word_multiple_mems, alg_long_gen_params),
+	KUNIT_CASE_PARAM(bin_patch_multi_oneword_sparse_unordered, x_or_y_and_alg_long_gen_params),
+	KUNIT_CASE_PARAM(bin_patch_one_word_multiple_algs, x_or_y_and_long_offset_gen_params),
+	KUNIT_CASE_PARAM(bin_patch_one_word_multiple_algs_unordered,
+			   x_or_y_and_long_offset_gen_params),
+
+	/* Packed memory tests with long offset blocks */
+	KUNIT_CASE_PARAM(bin_patch_1_packed,
+			 packed_x_or_y_and_long_offset_gen_params),
+	KUNIT_CASE_PARAM(bin_patch_1_packed_1_single_trailing,
+			 packed_x_or_y_and_long_offset_gen_params),
+	KUNIT_CASE_PARAM(bin_patch_1_packed_2_single_trailing,
+			 packed_x_or_y_and_long_offset_gen_params),
+	KUNIT_CASE_PARAM(bin_patch_1_packed_3_single_trailing,
+			 packed_x_or_y_and_long_offset_gen_params),
+	KUNIT_CASE_PARAM(bin_patch_1_packed_2_trailing,
+			 packed_x_or_y_and_long_offset_gen_params),
+	KUNIT_CASE_PARAM(bin_patch_1_packed_3_trailing,
+			 packed_x_or_y_and_long_offset_gen_params),
+	KUNIT_CASE_PARAM(bin_patch_1_single_leading_1_packed,
+			 packed_x_or_y_and_long_offset_gen_params),
+	KUNIT_CASE_PARAM(bin_patch_2_single_leading_1_packed,
+			 packed_x_or_y_and_long_offset_gen_params),
+	KUNIT_CASE_PARAM(bin_patch_2_leading_1_packed,
+			 packed_x_or_y_and_long_offset_gen_params),
+	KUNIT_CASE_PARAM(bin_patch_3_single_leading_1_packed,
+			 packed_x_or_y_and_long_offset_gen_params),
+	KUNIT_CASE_PARAM(bin_patch_3_leading_1_packed,
+			 packed_x_or_y_and_long_offset_gen_params),
+	KUNIT_CASE_PARAM(bin_patch_multi_onepacked,
+			 packed_x_or_y_and_long_offset_gen_params),
+	KUNIT_CASE_PARAM(bin_patch_multi_onepacked_unordered,
+			 packed_x_or_y_and_long_offset_gen_params),
+	KUNIT_CASE_PARAM(bin_patch_1_packed_multiple_mems, long_offset_gen_params),
+	KUNIT_CASE_PARAM(bin_patch_1_packed_multiple_mems, alg_long_gen_params),
+	KUNIT_CASE_PARAM(bin_patch_multi_onepacked_sparse_unordered,
+			 packed_x_or_y_and_alg_long_gen_params),
+	KUNIT_CASE_PARAM(bin_patch_1_packed_multiple_algs,
+			 packed_x_or_y_and_long_offset_gen_params),
+	KUNIT_CASE_PARAM(bin_patch_1_packed_multiple_algs_unordered,
+			 packed_x_or_y_and_long_offset_gen_params),
+	KUNIT_CASE_PARAM(bin_patch_mixed_packed_unpacked_random,
+			 packed_x_or_y_long_gen_params),
+
+	KUNIT_CASE(bin_patch_name_and_info),
+
+	{ } /* terminator */
+};
+
 static struct kunit_case cs_dsp_bin_test_cases_adsp2[] = {
 	/* XM and YM */
 	KUNIT_CASE_PARAM(bin_patch_one_word, x_or_y_and_offset_gen_params),
@@ -2559,7 +2770,7 @@ static struct kunit_suite cs_dsp_bin_test_halo = {
 static struct kunit_suite cs_dsp_bin_test_halo_wmdr3 = {
 	.name = "cs_dsp_bin_halo_wmdr_v3",
 	.init = cs_dsp_bin_test_halo_wmdr3_init,
-	.test_cases = cs_dsp_bin_test_cases_halo,
+	.test_cases = cs_dsp_bin_test_cases_halo_wmdr3,
 };
 
 static struct kunit_suite cs_dsp_bin_test_adsp2_32bit = {
-- 
2.43.0

