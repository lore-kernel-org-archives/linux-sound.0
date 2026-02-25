Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAFDF3921F2;
	Wed, 25 Feb 2026 12:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772024219; cv=fail; b=q0Smb7dZgn4Ojb28+yM0NDA4OcSuHexOYqRok0gIld5GwjKOb/9YQC4DKUOcUf78NsEdDjIdRMvqxzo1uyGQdoDw0ii9MQYt1g9xNPCi1WvKA7vPZWB7DKpKigfNYJG4/fMWuzMWUkySjPUJpzgCHBrPuj3zJX3fiRK575mDN6c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772024219; c=relaxed/simple;
	bh=KIorfTbAoQu5P++ECY8eCxOyNPxuQC/I1ohskwFtx0I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Jx3NS4NUr5rnIObD0wwSNtJXve0SC3+BVBhp9QiSncr4TfRLdYg/1TKGmgCCACdXOiP9QrKg21+RNmEmTcP6VMMngs2DRMYzQbXn7G1Mdgv0jY127NNYNXkZRROH0DGrV1jZFUdGSFTP1K9PoemYM/PyMkXRAwXblgjx7e2yMag=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=pFCf005N; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=FK5VcWz8; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="pFCf005N";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="FK5VcWz8"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61P4TnxH2226559;
	Wed, 25 Feb 2026 06:56:54 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=OLwZHYQVvdetsnZ0
	5kFwMuuFWZFvdtpSelXaPATa8XM=; b=pFCf005NrjVOBF3VwWiqq0ibHDsEqTCT
	JkthrsT7meflOKqZ0FubrYQ+nkNCh4BO/30O/bj0WUnc7H/nsrib2dmHwZY/Ismx
	cN6RZap2+QPyY5D+4m+6Ims6rN1E7XAsw2bin+fVqRK7A6fSLes4S4gZY4YoBz3J
	bzrCPNIQX8qTzzqQOtWKbzWbPv36E0kaVNs9U0W8sbuOQAKG/dlbh+rVlWymVlIC
	bx4iMWEM/s1bIgqWTBldRTK/2SFmVofGb4zBt7INudlWwEd477sioLe/UDiqPCcW
	W2A6pPRMK1l5zyT6HpxzqCGuH7F+vi2kSB8e8LLoa8+RV9q8nU9uew==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11022141.outbound.protection.outlook.com [52.101.43.141])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4cfa0j4c1h-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 25 Feb 2026 06:56:53 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fiS2bb9PFUiCS3JOUKU+V9zz2wPvfCJJ1WDQQvUiAqPM9TqUDepdL2LnRDlugr6Tq3PN2xa60IOgAxxC+FJWyDxlygm4YUH5irOJV+/27W269Ic5jW96J9BOQz+EXnF6IVhIrlqCeYoU0WdmzyJDNgPAZUDCjLKn+VQV7K8YaZSpSw/kjCNeBZM9CX3jE3LeOInEt4ggiV4Ncjo8POZbtI8ox/N5PIKa2IJaNkBPcD823JbUdoEOkqp+DKycvqQnKVbmf9QhceFdgL2uGKau4ZjF6YJQaBX+gp94YES7PeEHn0rG6clwFc575xB/VQg4wb4ZAbr+GBU2vq6LfwMHNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OLwZHYQVvdetsnZ05kFwMuuFWZFvdtpSelXaPATa8XM=;
 b=vrvevJjB2i819Ezgrw7E5Jq1krLBw+0UJbmIJMS/2C3q+dDA6y6tRqD+KHaVewRVKUcHtYKoY6fzlVirodD6De3VDCsblonD3kd4sTQXvRSLYQMmcJ4UtVi09LdP8sDpG8Lyuq1Gk3DlE8IOSdzUbfT/BItUG5YCt0xaZsns9Y9tZlQYzoFubuacI3Px29vEyufeoEAn0YIF7yD2g1iy6h00jsSLC5ZXMeA0/Vj/XD5xsTG1dW6ROTzwPghwNLf0uWeO7xxosaVnZQWAWwPjhMu9DsOyHDvULwZSLHw7UJ/8OHiQAfV/eZaNddCOfB1fSB/3GLDyT5z/77gs4waNUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OLwZHYQVvdetsnZ05kFwMuuFWZFvdtpSelXaPATa8XM=;
 b=FK5VcWz8MW4qtcZv0Y+gGenUnplSYTgyWbwHE3BcjMx4nflmEvNeiCqfxLA2Zq0bWcCgfF0KEUJK1delv6TPyQo5qSaw4W5kfVYud0ReKyuGkyHXiLF+IiD9ABewiwME9PFRP+UztULfUWnadAveAlWidxLdalnIC6lNYsw0pwQ=
Received: from SJ0PR05CA0194.namprd05.prod.outlook.com (2603:10b6:a03:330::19)
 by BN5PR19MB8814.namprd19.prod.outlook.com (2603:10b6:408:2a9::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.11; Wed, 25 Feb
 2026 12:56:48 +0000
Received: from SJ1PEPF000023CD.namprd02.prod.outlook.com
 (2603:10b6:a03:330:cafe::ce) by SJ0PR05CA0194.outlook.office365.com
 (2603:10b6:a03:330::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.23 via Frontend Transport; Wed,
 25 Feb 2026 12:56:40 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF000023CD.mail.protection.outlook.com (10.167.244.8) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.12
 via Frontend Transport; Wed, 25 Feb 2026 12:56:47 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 4B7D6406540;
	Wed, 25 Feb 2026 12:56:45 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.24])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 25F0682024B;
	Wed, 25 Feb 2026 12:56:45 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH] firmware: cs_dsp: Mark KUnit test suites KUNIT_SPEED_SLOW
Date: Wed, 25 Feb 2026 12:56:44 +0000
Message-ID: <20260225125644.1248826-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CD:EE_|BN5PR19MB8814:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 836a48e7-ee88-4896-6d7f-08de746d55e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|61400799027|54012099003;
X-Microsoft-Antispam-Message-Info:
	91sX+uWS/gt5Jr55vIY4PlQEzd/r6o/k6uCDZBJkbebz+Sg2s7efSzrfRl7EUus5GUeI5owC7kfgnc/rKzr5dRcp8D1wYU0R+S7RPYsXG/mTwmpKRB5rmcd1bhhAL+NC2ppT0w/k1VX5ZsWLLHIYk/UW7Y2w/U+WAke0hv3Q1crXr3aQcz+mLrJaIUYD6kthwgEaxmcCZ3HIzwBZyRwHokfVj81ZCOX2KHxh52iHtCRGM/Ab9tr8ED5sQ9GqoX6p3y9khlDirM2e7U2OADpuwHmNeLgfBWQOy6ugRd6TapCykMe+PBZ25PnTainU4L515VLx4RppK0hqgUrLD+VW9Tm5gpIS6wm6U/JztpTCXZSkQw/RzAwjvRCZGR6ybRPJXo//Io9eSBwQ4R8DQEP6MQKqf43xZKVpkkZcTwXyWPWBqSIbgHedw6R4ehN2tfRHZxyKS/wM7FTMasu4Agjk+sYMk2JB1PVXG+rTw4DFzQcmdgfJjeEIkbnGSahQXLTeYhwegXgmtbWP5LxV74cSFRcSlTZqCxu0uQE/aoEwHnGoLtopQOcd8SMWPolgfGJJknvK2cfI990gl7JaQ/R6l3NQX86gSpu1gMlX9ASgxmEQRl0Rlhg++Ql7vZgxfXDB4aI04pNt7GWpNpzMJbm97vmFU3UX9C3zkqDkWqnwYDbhln8uzBokajPJtwSFf5MAxmsYvB+fms8RTD0cXrjfz+fma5yarYR+jrNxD4PI+/HV8m5jZs5g7DPEjlXzDN480vbPAhum5fC7dvQOnT6+QROJiLQuEFfVLoWi/XbyGSCx63DAGYKb5Q616uyGLAq4iHmY230sLyIJTyk3xuqMXg==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(61400799027)(54012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	WpqAfRnxNKpwK9ctCj8/slvLrd7YueiPCMHxKYukNbbAM08CaB2rJmZ8G6o7aIRI78dotmTzpPtpE8NeyWuND96EXuy6F8szXyJCKBat+twfN8ZaApC/BuY+QNzhOzWFRPFNIGoMo+N5cCIC99UZnDZG0JXTVh1br25ydWHfLinWfK8VXD/5c7lrKHfsByM0XDiUI+blPp+NPb2/Me6tn6toK11rnF7D3zVMd7biTkUWpoT2ZI8hDLaIk2VXK0qlEIxY1jDECmKC+DsV1BnS2BR9ZHIySkOzrq3ZT5DuUq0MJTbR/OOrq4GztjuJ3/EhSM12ZtsrnthjPOEhnANbehnTd3ngtg8bQfN2Ir7jG0MB92lESMdi6W6BLN1fUihT7QOWS+zKmrMfZVlg9JweADIrnxgK+t02n1aHU5oRZRJWAS0EAKoAHa0RAsXjIWH+
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 12:56:47.1187
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 836a48e7-ee88-4896-6d7f-08de746d55e5
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ1PEPF000023CD.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN5PR19MB8814
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDEyNSBTYWx0ZWRfX2EMy8FUzlBRv
 90aB5iq1t5cTUjbZ/HXlxZoZOGiUl1QMow+bPEBTyP6rxqQ0ONhe9uvzPuCE+uO6rp/5a6ZIfIN
 PXm3BiBUHxvcqTN2bUAQ4IBpyJ5+t5wk7ySc7Hqf0uqoZcfdoF/CCX1GeQBnxTxL8taYmp9cKJQ
 SsWIyqA1Ql0q7bbAwXNHl3BmHL9xXWmUjMoxKzKxtoyar2DI7ynh/ZidfPqYG9VFKwL4WeoeO6w
 4PD9YKYHB9ZDZvm2l8R5oR7R/5p2BKTMyuwhuYPnkulx2V1pIpgZ2oRhtGmALqCVQtXEXrgRjKU
 S6xmAMU6Qq3PojfgcAg8sf4+8poIrMKJ0yRxpFAKUbGIsUJql30hPHCJNExRkEjTmHPEwVuS2d8
 9ZKXezu1MUWsgokD5ji2JBm0EH6zmHDel/j5ws8lLb74cIBqohzWqyH7IJ46mt3riCndSHOclVe
 TP3QxOp+L0AIhTwzegQ==
X-Authority-Analysis: v=2.4 cv=Q/7fIo2a c=1 sm=1 tr=0 ts=699ef196 cx=c_pps
 a=fy38adKFcSgT6GDlyky2Fw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=HzLeVaNsDn8A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=gXw2AA1SPYOftjtDbbgA:9
X-Proofpoint-GUID: foOhADTU9oZHu9bdSqz5fmHreht4yYCX
X-Proofpoint-ORIG-GUID: foOhADTU9oZHu9bdSqz5fmHreht4yYCX
X-Proofpoint-Spam-Reason: safe

Most of the test suites perform a large number of test cases, so
mark the suites as KUNIT_SPEED_SLOW for anyone who finds that useful.

The callback test suites haven't been marked because they don't
perform many test cases, and the tests are quick.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 drivers/firmware/cirrus/test/cs_dsp_test_bin.c           | 4 ++++
 drivers/firmware/cirrus/test/cs_dsp_test_bin_error.c     | 3 +++
 drivers/firmware/cirrus/test/cs_dsp_test_control_cache.c | 5 +++++
 drivers/firmware/cirrus/test/cs_dsp_test_control_parse.c | 5 +++++
 drivers/firmware/cirrus/test/cs_dsp_test_control_rw.c    | 5 +++++
 drivers/firmware/cirrus/test/cs_dsp_test_wmfw.c          | 7 +++++++
 drivers/firmware/cirrus/test/cs_dsp_test_wmfw_error.c    | 7 +++++++
 7 files changed, 36 insertions(+)

diff --git a/drivers/firmware/cirrus/test/cs_dsp_test_bin.c b/drivers/firmware/cirrus/test/cs_dsp_test_bin.c
index 66140caeebb5e..61078da574625 100644
--- a/drivers/firmware/cirrus/test/cs_dsp_test_bin.c
+++ b/drivers/firmware/cirrus/test/cs_dsp_test_bin.c
@@ -2835,12 +2835,14 @@ static struct kunit_suite cs_dsp_bin_test_halo = {
 	.init = cs_dsp_bin_test_halo_init,
 	.exit = cs_dsp_bin_test_exit,
 	.test_cases = cs_dsp_bin_test_cases_halo,
+	.attr.speed = KUNIT_SPEED_SLOW,
 };
 
 static struct kunit_suite cs_dsp_bin_test_halo_wmdr3 = {
 	.name = "cs_dsp_bin_halo_wmdr_v3",
 	.init = cs_dsp_bin_test_halo_wmdr3_init,
 	.test_cases = cs_dsp_bin_test_cases_halo_wmdr3,
+	.attr.speed = KUNIT_SPEED_SLOW,
 };
 
 static struct kunit_suite cs_dsp_bin_test_adsp2_32bit = {
@@ -2848,6 +2850,7 @@ static struct kunit_suite cs_dsp_bin_test_adsp2_32bit = {
 	.init = cs_dsp_bin_test_adsp2_32bit_init,
 	.exit = cs_dsp_bin_test_exit,
 	.test_cases = cs_dsp_bin_test_cases_adsp2,
+	.attr.speed = KUNIT_SPEED_SLOW,
 };
 
 static struct kunit_suite cs_dsp_bin_test_adsp2_16bit = {
@@ -2855,6 +2858,7 @@ static struct kunit_suite cs_dsp_bin_test_adsp2_16bit = {
 	.init = cs_dsp_bin_test_adsp2_16bit_init,
 	.exit = cs_dsp_bin_test_exit,
 	.test_cases = cs_dsp_bin_test_cases_adsp2,
+	.attr.speed = KUNIT_SPEED_SLOW,
 };
 
 kunit_test_suites(&cs_dsp_bin_test_halo,
diff --git a/drivers/firmware/cirrus/test/cs_dsp_test_bin_error.c b/drivers/firmware/cirrus/test/cs_dsp_test_bin_error.c
index 9b2763b369702..888e277a265cb 100644
--- a/drivers/firmware/cirrus/test/cs_dsp_test_bin_error.c
+++ b/drivers/firmware/cirrus/test/cs_dsp_test_bin_error.c
@@ -586,6 +586,7 @@ static struct kunit_suite cs_dsp_bin_err_test_halo = {
 	.init = cs_dsp_bin_err_test_halo_init,
 	.exit = cs_dsp_bin_err_test_exit,
 	.test_cases = cs_dsp_bin_err_test_cases,
+	.attr.speed = KUNIT_SPEED_SLOW,
 };
 
 static struct kunit_suite cs_dsp_bin_err_test_adsp2_32bit = {
@@ -593,6 +594,7 @@ static struct kunit_suite cs_dsp_bin_err_test_adsp2_32bit = {
 	.init = cs_dsp_bin_err_test_adsp2_32bit_init,
 	.exit = cs_dsp_bin_err_test_exit,
 	.test_cases = cs_dsp_bin_err_test_cases,
+	.attr.speed = KUNIT_SPEED_SLOW,
 };
 
 static struct kunit_suite cs_dsp_bin_err_test_adsp2_16bit = {
@@ -600,6 +602,7 @@ static struct kunit_suite cs_dsp_bin_err_test_adsp2_16bit = {
 	.init = cs_dsp_bin_err_test_adsp2_16bit_init,
 	.exit = cs_dsp_bin_err_test_exit,
 	.test_cases = cs_dsp_bin_err_test_cases,
+	.attr.speed = KUNIT_SPEED_SLOW,
 };
 
 kunit_test_suites(&cs_dsp_bin_err_test_halo,
diff --git a/drivers/firmware/cirrus/test/cs_dsp_test_control_cache.c b/drivers/firmware/cirrus/test/cs_dsp_test_control_cache.c
index ebca3a4ab0f1a..b03cd7c37f6e4 100644
--- a/drivers/firmware/cirrus/test/cs_dsp_test_control_cache.c
+++ b/drivers/firmware/cirrus/test/cs_dsp_test_control_cache.c
@@ -3248,30 +3248,35 @@ static struct kunit_suite cs_dsp_ctl_cache_test_halo = {
 	.name = "cs_dsp_ctl_cache_wmfwV3_halo",
 	.init = cs_dsp_ctl_cache_test_halo_init,
 	.test_cases = cs_dsp_ctl_cache_test_cases_v3,
+	.attr.speed = KUNIT_SPEED_SLOW,
 };
 
 static struct kunit_suite cs_dsp_ctl_cache_test_adsp2_32bit_wmfw1 = {
 	.name = "cs_dsp_ctl_cache_wmfwV1_adsp2_32bit",
 	.init = cs_dsp_ctl_cache_test_adsp2_32bit_wmfw1_init,
 	.test_cases = cs_dsp_ctl_cache_test_cases_v1,
+	.attr.speed = KUNIT_SPEED_SLOW,
 };
 
 static struct kunit_suite cs_dsp_ctl_cache_test_adsp2_32bit_wmfw2 = {
 	.name = "cs_dsp_ctl_cache_wmfwV2_adsp2_32bit",
 	.init = cs_dsp_ctl_cache_test_adsp2_32bit_wmfw2_init,
 	.test_cases = cs_dsp_ctl_cache_test_cases_v2,
+	.attr.speed = KUNIT_SPEED_SLOW,
 };
 
 static struct kunit_suite cs_dsp_ctl_cache_test_adsp2_16bit_wmfw1 = {
 	.name = "cs_dsp_ctl_cache_wmfwV1_adsp2_16bit",
 	.init = cs_dsp_ctl_cache_test_adsp2_16bit_wmfw1_init,
 	.test_cases = cs_dsp_ctl_cache_test_cases_v1,
+	.attr.speed = KUNIT_SPEED_SLOW,
 };
 
 static struct kunit_suite cs_dsp_ctl_cache_test_adsp2_16bit_wmfw2 = {
 	.name = "cs_dsp_ctl_cache_wmfwV2_adsp2_16bit",
 	.init = cs_dsp_ctl_cache_test_adsp2_16bit_wmfw2_init,
 	.test_cases = cs_dsp_ctl_cache_test_cases_v2,
+	.attr.speed = KUNIT_SPEED_SLOW,
 };
 
 kunit_test_suites(&cs_dsp_ctl_cache_test_halo,
diff --git a/drivers/firmware/cirrus/test/cs_dsp_test_control_parse.c b/drivers/firmware/cirrus/test/cs_dsp_test_control_parse.c
index 942ba1af5e7c1..368703767644a 100644
--- a/drivers/firmware/cirrus/test/cs_dsp_test_control_parse.c
+++ b/drivers/firmware/cirrus/test/cs_dsp_test_control_parse.c
@@ -1805,30 +1805,35 @@ static struct kunit_suite cs_dsp_ctl_parse_test_halo = {
 	.name = "cs_dsp_ctl_parse_wmfwV3_halo",
 	.init = cs_dsp_ctl_parse_test_halo_init,
 	.test_cases = cs_dsp_ctl_parse_test_cases_v2_v3,
+	.attr.speed = KUNIT_SPEED_SLOW,
 };
 
 static struct kunit_suite cs_dsp_ctl_parse_test_adsp2_32bit_wmfw1 = {
 	.name = "cs_dsp_ctl_parse_wmfwV1_adsp2_32bit",
 	.init = cs_dsp_ctl_parse_test_adsp2_32bit_wmfw1_init,
 	.test_cases = cs_dsp_ctl_parse_test_cases_v1,
+	.attr.speed = KUNIT_SPEED_SLOW,
 };
 
 static struct kunit_suite cs_dsp_ctl_parse_test_adsp2_32bit_wmfw2 = {
 	.name = "cs_dsp_ctl_parse_wmfwV2_adsp2_32bit",
 	.init = cs_dsp_ctl_parse_test_adsp2_32bit_wmfw2_init,
 	.test_cases = cs_dsp_ctl_parse_test_cases_v2_v3,
+	.attr.speed = KUNIT_SPEED_SLOW,
 };
 
 static struct kunit_suite cs_dsp_ctl_parse_test_adsp2_16bit_wmfw1 = {
 	.name = "cs_dsp_ctl_parse_wmfwV1_adsp2_16bit",
 	.init = cs_dsp_ctl_parse_test_adsp2_16bit_wmfw1_init,
 	.test_cases = cs_dsp_ctl_parse_test_cases_v1,
+	.attr.speed = KUNIT_SPEED_SLOW,
 };
 
 static struct kunit_suite cs_dsp_ctl_parse_test_adsp2_16bit_wmfw2 = {
 	.name = "cs_dsp_ctl_parse_wmfwV2_adsp2_16bit",
 	.init = cs_dsp_ctl_parse_test_adsp2_16bit_wmfw2_init,
 	.test_cases = cs_dsp_ctl_parse_test_cases_v2_v3,
+	.attr.speed = KUNIT_SPEED_SLOW,
 };
 
 kunit_test_suites(&cs_dsp_ctl_parse_test_halo,
diff --git a/drivers/firmware/cirrus/test/cs_dsp_test_control_rw.c b/drivers/firmware/cirrus/test/cs_dsp_test_control_rw.c
index bda00a95d4f9f..d800f163b099e 100644
--- a/drivers/firmware/cirrus/test/cs_dsp_test_control_rw.c
+++ b/drivers/firmware/cirrus/test/cs_dsp_test_control_rw.c
@@ -2636,30 +2636,35 @@ static struct kunit_suite cs_dsp_ctl_rw_test_halo = {
 	.name = "cs_dsp_ctl_rw_wmfwV3_halo",
 	.init = cs_dsp_ctl_rw_test_halo_init,
 	.test_cases = cs_dsp_ctl_rw_test_cases_halo,
+	.attr.speed = KUNIT_SPEED_SLOW,
 };
 
 static struct kunit_suite cs_dsp_ctl_rw_test_adsp2_32bit_wmfw1 = {
 	.name = "cs_dsp_ctl_rw_wmfwV1_adsp2_32bit",
 	.init = cs_dsp_ctl_rw_test_adsp2_32bit_wmfw1_init,
 	.test_cases = cs_dsp_ctl_rw_test_cases_adsp,
+	.attr.speed = KUNIT_SPEED_SLOW,
 };
 
 static struct kunit_suite cs_dsp_ctl_rw_test_adsp2_32bit_wmfw2 = {
 	.name = "cs_dsp_ctl_rw_wmfwV2_adsp2_32bit",
 	.init = cs_dsp_ctl_rw_test_adsp2_32bit_wmfw2_init,
 	.test_cases = cs_dsp_ctl_rw_test_cases_adsp,
+	.attr.speed = KUNIT_SPEED_SLOW,
 };
 
 static struct kunit_suite cs_dsp_ctl_rw_test_adsp2_16bit_wmfw1 = {
 	.name = "cs_dsp_ctl_rw_wmfwV1_adsp2_16bit",
 	.init = cs_dsp_ctl_rw_test_adsp2_16bit_wmfw1_init,
 	.test_cases = cs_dsp_ctl_rw_test_cases_adsp,
+	.attr.speed = KUNIT_SPEED_SLOW,
 };
 
 static struct kunit_suite cs_dsp_ctl_rw_test_adsp2_16bit_wmfw2 = {
 	.name = "cs_dsp_ctl_rw_wmfwV2_adsp2_16bit",
 	.init = cs_dsp_ctl_rw_test_adsp2_16bit_wmfw2_init,
 	.test_cases = cs_dsp_ctl_rw_test_cases_adsp,
+	.attr.speed = KUNIT_SPEED_SLOW,
 };
 
 kunit_test_suites(&cs_dsp_ctl_rw_test_halo,
diff --git a/drivers/firmware/cirrus/test/cs_dsp_test_wmfw.c b/drivers/firmware/cirrus/test/cs_dsp_test_wmfw.c
index f02cb6cf76386..788458d5a2876 100644
--- a/drivers/firmware/cirrus/test/cs_dsp_test_wmfw.c
+++ b/drivers/firmware/cirrus/test/cs_dsp_test_wmfw.c
@@ -2182,6 +2182,7 @@ static struct kunit_suite cs_dsp_wmfw_test_halo = {
 	.init = cs_dsp_wmfw_test_halo_init,
 	.exit = cs_dsp_wmfw_test_exit,
 	.test_cases = cs_dsp_wmfw_test_cases_halo,
+	.attr.speed = KUNIT_SPEED_SLOW,
 };
 
 static struct kunit_suite cs_dsp_wmfw_test_adsp2_32bit_wmfw0 = {
@@ -2189,6 +2190,7 @@ static struct kunit_suite cs_dsp_wmfw_test_adsp2_32bit_wmfw0 = {
 	.init = cs_dsp_wmfw_test_adsp2_32bit_wmfw0_init,
 	.exit = cs_dsp_wmfw_test_exit,
 	.test_cases = cs_dsp_wmfw_test_cases_adsp2,
+	.attr.speed = KUNIT_SPEED_SLOW,
 };
 
 static struct kunit_suite cs_dsp_wmfw_test_adsp2_32bit_wmfw1 = {
@@ -2196,6 +2198,7 @@ static struct kunit_suite cs_dsp_wmfw_test_adsp2_32bit_wmfw1 = {
 	.init = cs_dsp_wmfw_test_adsp2_32bit_wmfw1_init,
 	.exit = cs_dsp_wmfw_test_exit,
 	.test_cases = cs_dsp_wmfw_test_cases_adsp2,
+	.attr.speed = KUNIT_SPEED_SLOW,
 };
 
 static struct kunit_suite cs_dsp_wmfw_test_adsp2_32bit_wmfw2 = {
@@ -2203,6 +2206,7 @@ static struct kunit_suite cs_dsp_wmfw_test_adsp2_32bit_wmfw2 = {
 	.init = cs_dsp_wmfw_test_adsp2_32bit_wmfw2_init,
 	.exit = cs_dsp_wmfw_test_exit,
 	.test_cases = cs_dsp_wmfw_test_cases_adsp2,
+	.attr.speed = KUNIT_SPEED_SLOW,
 };
 
 static struct kunit_suite cs_dsp_wmfw_test_adsp2_16bit_wmfw0 = {
@@ -2210,6 +2214,7 @@ static struct kunit_suite cs_dsp_wmfw_test_adsp2_16bit_wmfw0 = {
 	.init = cs_dsp_wmfw_test_adsp2_16bit_wmfw0_init,
 	.exit = cs_dsp_wmfw_test_exit,
 	.test_cases = cs_dsp_wmfw_test_cases_adsp2,
+	.attr.speed = KUNIT_SPEED_SLOW,
 };
 
 static struct kunit_suite cs_dsp_wmfw_test_adsp2_16bit_wmfw1 = {
@@ -2217,6 +2222,7 @@ static struct kunit_suite cs_dsp_wmfw_test_adsp2_16bit_wmfw1 = {
 	.init = cs_dsp_wmfw_test_adsp2_16bit_wmfw1_init,
 	.exit = cs_dsp_wmfw_test_exit,
 	.test_cases = cs_dsp_wmfw_test_cases_adsp2,
+	.attr.speed = KUNIT_SPEED_SLOW,
 };
 
 static struct kunit_suite cs_dsp_wmfw_test_adsp2_16bit_wmfw2 = {
@@ -2224,6 +2230,7 @@ static struct kunit_suite cs_dsp_wmfw_test_adsp2_16bit_wmfw2 = {
 	.init = cs_dsp_wmfw_test_adsp2_16bit_wmfw2_init,
 	.exit = cs_dsp_wmfw_test_exit,
 	.test_cases = cs_dsp_wmfw_test_cases_adsp2,
+	.attr.speed = KUNIT_SPEED_SLOW,
 };
 
 kunit_test_suites(&cs_dsp_wmfw_test_halo,
diff --git a/drivers/firmware/cirrus/test/cs_dsp_test_wmfw_error.c b/drivers/firmware/cirrus/test/cs_dsp_test_wmfw_error.c
index 37162d12e2fa7..79eee89a7fd54 100644
--- a/drivers/firmware/cirrus/test/cs_dsp_test_wmfw_error.c
+++ b/drivers/firmware/cirrus/test/cs_dsp_test_wmfw_error.c
@@ -1306,6 +1306,7 @@ static struct kunit_suite cs_dsp_wmfw_err_test_halo = {
 	.init = cs_dsp_wmfw_err_test_halo_init,
 	.exit = cs_dsp_wmfw_err_test_exit,
 	.test_cases = cs_dsp_wmfw_err_test_cases_v3,
+	.attr.speed = KUNIT_SPEED_SLOW,
 };
 
 static struct kunit_suite cs_dsp_wmfw_err_test_adsp2_32bit_wmfw0 = {
@@ -1313,6 +1314,7 @@ static struct kunit_suite cs_dsp_wmfw_err_test_adsp2_32bit_wmfw0 = {
 	.init = cs_dsp_wmfw_err_test_adsp2_32bit_wmfw0_init,
 	.exit = cs_dsp_wmfw_err_test_exit,
 	.test_cases = cs_dsp_wmfw_err_test_cases_v0,
+	.attr.speed = KUNIT_SPEED_SLOW,
 };
 
 static struct kunit_suite cs_dsp_wmfw_err_test_adsp2_32bit_wmfw1 = {
@@ -1320,6 +1322,7 @@ static struct kunit_suite cs_dsp_wmfw_err_test_adsp2_32bit_wmfw1 = {
 	.init = cs_dsp_wmfw_err_test_adsp2_32bit_wmfw1_init,
 	.exit = cs_dsp_wmfw_err_test_exit,
 	.test_cases = cs_dsp_wmfw_err_test_cases_v1,
+	.attr.speed = KUNIT_SPEED_SLOW,
 };
 
 static struct kunit_suite cs_dsp_wmfw_err_test_adsp2_32bit_wmfw2 = {
@@ -1327,6 +1330,7 @@ static struct kunit_suite cs_dsp_wmfw_err_test_adsp2_32bit_wmfw2 = {
 	.init = cs_dsp_wmfw_err_test_adsp2_32bit_wmfw2_init,
 	.exit = cs_dsp_wmfw_err_test_exit,
 	.test_cases = cs_dsp_wmfw_err_test_cases_v2,
+	.attr.speed = KUNIT_SPEED_SLOW,
 };
 
 static struct kunit_suite cs_dsp_wmfw_err_test_adsp2_16bit_wmfw0 = {
@@ -1334,6 +1338,7 @@ static struct kunit_suite cs_dsp_wmfw_err_test_adsp2_16bit_wmfw0 = {
 	.init = cs_dsp_wmfw_err_test_adsp2_16bit_wmfw0_init,
 	.exit = cs_dsp_wmfw_err_test_exit,
 	.test_cases = cs_dsp_wmfw_err_test_cases_v0,
+	.attr.speed = KUNIT_SPEED_SLOW,
 };
 
 static struct kunit_suite cs_dsp_wmfw_err_test_adsp2_16bit_wmfw1 = {
@@ -1341,6 +1346,7 @@ static struct kunit_suite cs_dsp_wmfw_err_test_adsp2_16bit_wmfw1 = {
 	.init = cs_dsp_wmfw_err_test_adsp2_16bit_wmfw1_init,
 	.exit = cs_dsp_wmfw_err_test_exit,
 	.test_cases = cs_dsp_wmfw_err_test_cases_v1,
+	.attr.speed = KUNIT_SPEED_SLOW,
 };
 
 static struct kunit_suite cs_dsp_wmfw_err_test_adsp2_16bit_wmfw2 = {
@@ -1348,6 +1354,7 @@ static struct kunit_suite cs_dsp_wmfw_err_test_adsp2_16bit_wmfw2 = {
 	.init = cs_dsp_wmfw_err_test_adsp2_16bit_wmfw2_init,
 	.exit = cs_dsp_wmfw_err_test_exit,
 	.test_cases = cs_dsp_wmfw_err_test_cases_v2,
+	.attr.speed = KUNIT_SPEED_SLOW,
 };
 
 kunit_test_suites(&cs_dsp_wmfw_err_test_halo,
-- 
2.47.3

