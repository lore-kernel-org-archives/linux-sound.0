Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 151AC2BE646;
	Wed, 31 Dec 2025 11:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767179812; cv=fail; b=LyhI9Dq2bvuZzTVGnGmABm9Mhp0sDMX1ib+eoft9qVNt3eIor5kRF8t7yXhLu/dFWj4GFSZ9oF4lrlewASRNAq6jaDaiiKZweO80J5OkFqJGa+V2qKi4yi7vx9gvVbFSacg3eFXGtHTKT8eC5C8doKwHe/uidiXU0s1qTxX0zG4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767179812; c=relaxed/simple;
	bh=/teI4ceD9KkexaTFQtObmeNft0krtwnHRv0eQh0KtF0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LrUsUoeH5W5VnxU7d62+VUkq4fvGxaYcTLp8RypVZ1qw1XEa3D4DmdFhwKCTPfwKg0zO15LJbBRWlp1K4/wZhTL2Wib+qGFLg1px5FvDq6MwdFP036iIH8J4ZxAatUhWT3KOXhfVHwfP2qPDUv15EEOoEGBaAuLlLik2ru75MKs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=nVxmU/Cv; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=RwGiMY/p; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="nVxmU/Cv";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="RwGiMY/p"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BVAhApu3728370;
	Wed, 31 Dec 2025 04:50:09 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=SXtzgS6gkk/eAPpyJE8++5OZSVnkZAns86cgQ2gpJnU=; b=
	nVxmU/CvV6j5aH+25FFwSkBQMsNORNlx8BEFbzR+i1EeGwIJ/1SL6mo1ruvedvkC
	7HWZvaJs1Ox3vaoFTeXllUFREDWtsfYjqqQDF1DXJtL82B1HiwgSIxWzmEjg70JI
	LSZTk54wY28wRdRmpZemLoJ+R87C9J6bCvwgpgDsVSN7mlBk/kpfpzw0Y6/YER7W
	62WZ9GDcYQwf+NBjF2afpitY/6dHeJbj3T1bhi7rXXYEyYXWnGK1NU5IAxdCgb05
	3DnB9jnpDqob8JeBZpVMl8nO7Vk6cgMuxyxyJEP0CHsA8y80sKbFcOJ61GH1ujEX
	qqK0cIsLtba7gnUzyzkHWg==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11020087.outbound.protection.outlook.com [52.101.61.87])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4bacrmv3yp-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 31 Dec 2025 04:50:09 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aNKeVszPowwbnz2csvviJ9xCAIa7COBi6M9t0+SVNJas3ZqAS8cUFF2unltBYEkstEoiTWuVs97zoOT1VN1AP6C39/ogyPpJT1kAVWIpG6LNec2QpYF/TYu8mA6hjycf1hobTH2hBF1BMnUXRddGd1hHDVsvG3X18xnhRlrIlMyAZcBR0w/VkElJE9UmC7p/DscRd+83E6y6+FB+dWCb00uh6wASyXgg03FYWFvNfEksZLpHXo+SLKW7WMs9QuRSA4u64+K+SfkeKujD+36o09MWkdsz2rBd8wvFubuzjXa2UciwOksQDR1IAEguvFkNP83v7qOiLVGzK3nFJaG3EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SXtzgS6gkk/eAPpyJE8++5OZSVnkZAns86cgQ2gpJnU=;
 b=FT//KP4473i+JSWN2RsBWcoUud9WLgvsZxcd9wrZRZCYRs/gS3Kxp/13Rn7VACAo/u5JicXmmFpkA/dIKjDmE8HcFAzb8GVPJEeMk1RfyC2/Pmid5fgLKV10h46CbcSo09WLdlJyLtQ0L4XWhXfqLV4+5JHDFjiloOEKCYogThYcN4Ric5gZBfGszPu+dMqIUobEqdkNZ6QP3Lm54EN4JfdJq6DU+XYmhhuAbZFV7lqJkkCH3AzROowp+2EfsoBM3Dh3E/DD7fxftloCXBz3IkTq5WT22xbL+simlxGpNOlWWybHQASCw3mGz1OjDkSulMuBKNhHi0FoTUCJrjdwLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SXtzgS6gkk/eAPpyJE8++5OZSVnkZAns86cgQ2gpJnU=;
 b=RwGiMY/pjMXwa7PGW3DSs5t8COjaUo9jL24wwhYkYnIs2xguiFHFJQTSpDOnnWkOcLhOl/eoJ54vqKMcyDVy5HsIhQOfKSEObI4xp3VOBBHLYK9LwwMZPpzx3o9M8oxdkcbXrpjYOWTiFH0YkGEuweaIq2/9S6oDEmmDdG+3chM=
Received: from DS7PR06CA0052.namprd06.prod.outlook.com (2603:10b6:8:54::30) by
 PH0PR19MB5194.namprd19.prod.outlook.com (2603:10b6:510:97::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9478.4; Wed, 31 Dec 2025 10:50:05 +0000
Received: from CY4PEPF0000FCC0.namprd03.prod.outlook.com
 (2603:10b6:8:54:cafe::91) by DS7PR06CA0052.outlook.office365.com
 (2603:10b6:8:54::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4 via Frontend Transport; Wed,
 31 Dec 2025 10:50:00 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CY4PEPF0000FCC0.mail.protection.outlook.com (10.167.242.102) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4
 via Frontend Transport; Wed, 31 Dec 2025 10:50:04 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 96C53406544;
	Wed, 31 Dec 2025 10:50:03 +0000 (UTC)
Received: from EDIN4L06LR3.ad.cirrus.com (EDIN4L06LR3.ad.cirrus.com [198.61.69.19])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 40EAA820249;
	Wed, 31 Dec 2025 10:50:03 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 2/8] firmware: cs_dsp: test_bin: Run test cases with v3 file format
Date: Wed, 31 Dec 2025 10:49:50 +0000
Message-ID: <20251231104956.449696-3-rf@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC0:EE_|PH0PR19MB5194:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: e34f667f-54d4-4dcf-ec94-08de485a5b6b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|61400799027;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?XfVNTbUZg8zMJWfjlmm3T+CfcOYGug6pHvvnkauMgZYfLvzELd/Cx/bu7VBd?=
 =?us-ascii?Q?7U6UwXTk3skyARbA6Htt+ncpjMk78Jljs1SJct2QzcwsfOe5aOqkyQwBoCou?=
 =?us-ascii?Q?/ZNvGwa0u63Dvp3+BZERzyYLe14SPRAoq13pYpDk3OiRAMEhNVr4Ba9C2gq/?=
 =?us-ascii?Q?KxI2+0YBePwLLYTEWdvQO0APTtTy5Ey5BBxjwFGzP3w+EEFdwS2z/lpD0lTJ?=
 =?us-ascii?Q?uIwyqftgIOBBfCNzhFRtsRkF/FHXJNB7sfoNAKhQPZMXaTbRk+0q1EGdnmmI?=
 =?us-ascii?Q?1/SezyC0s6PQScYfmGpkfydHQKT91QlLVVKGNcGgnr0OUqPCwdmjdQgrHxFd?=
 =?us-ascii?Q?YKPa2dDZLkG/YfZO344pP5rIVY34yuoBUg2nJtgg/W2R/EwCnI7ky5EBr3JP?=
 =?us-ascii?Q?fRZ/RwQdBtFC1fWbMNwpn82s5pq0C2MpWFLdVpccav1EL4G157kVzuu74tM0?=
 =?us-ascii?Q?EY8+lV0BwhQThcul2yzrOkRP/pUc1CLpn+oaDTxQb2ERBr2VHGjCM1ienlLN?=
 =?us-ascii?Q?P+2j8euUvOnX5DDlTqHclpNIXq21K+cP2S6jBZ7052gRO6nciLMAwnoJkjEs?=
 =?us-ascii?Q?i5V5Y/HzBgCKH0t7P71ZlkTqu9rm5u50Dc5+ENbzeKX7PeMMlaHo002UyY/C?=
 =?us-ascii?Q?rtHc7JZwkkrJIrbbJLtiWEFAvhLBMQYqUZrZVImsYqhJuuKT2YRBecLi3b1W?=
 =?us-ascii?Q?l3LEG356kx5LG5IyYijvGtaM6eG7uQe+IAuMg0n3d1uY0RAyE5RHl92Ax0P3?=
 =?us-ascii?Q?i6cNnDGRbFGS8wEGZvYHV3SGf7AJNQC4EclBMMT0oMZxGeXiuTywD2cl2Tze?=
 =?us-ascii?Q?Y53FyArV/6T1eQ9/Koz8/oW5FsGHeyu3/DSpAtXNZ3sUrk1kGmZj6KvPCNKr?=
 =?us-ascii?Q?m6ZVUQK3zDqhB4wJYtpCocT8Z/IPGvgFx3yvlGDL3gAZpAGhzuAcrvlu0w8o?=
 =?us-ascii?Q?xbmrYzx98qXo8xnf8ls9jrgsc95TLbJeYiy5vtn5zVekrvSN7l7kGJFl31iM?=
 =?us-ascii?Q?0EJ9Pv/87RrwYS8xR8TM0buWz61CeJFaJzOo+ClMkGe2+8KwItAm8dBFlgJv?=
 =?us-ascii?Q?R8ea8hczo7ifxohxZBgZYHNQDexvFmlLrs1L/wqx2zJ0Pxdw2avnTzm2cd1B?=
 =?us-ascii?Q?eGreB/m8h5H6gxTji6yq5u1JDJEnboWKkfgJO1NwZIBZh5HoG5tTJk2SMc10?=
 =?us-ascii?Q?4AbHJhHtySSXX3FiTVBuTWT4IYZMEXZsue8Uesn5lDOUoyNRltKaa7NSIeFs?=
 =?us-ascii?Q?dl0MLIhTtmGpYupUm68pMmWjGKy081x+us8HYUtXnng4Sm4130oGLjNPerDd?=
 =?us-ascii?Q?1Ki2cpNUj7Ek/Awz3Xhs6oYPeJ+iu+4Bm8wnZY3v+A+VJV/Gfvw5Hjl8/AAa?=
 =?us-ascii?Q?5YZh81iP9Dzl5bKwO3l210ezPU34675DShZAmNBgprhXMguj9FmVg4bWkTO2?=
 =?us-ascii?Q?Kh2MaqDmNvmCsypxDghErXP1Ij6Cet5qQTzXAxwn6Pocc9yDlqwchJiFMDHx?=
 =?us-ascii?Q?lNsBntlosTOy8q6bYLRkGoYCEOH6Y7j906oWvcy7zCDbDzSTzjMMD3Oy2kUb?=
 =?us-ascii?Q?Ol+K0W1NOVUgJW9eHLk=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(61400799027);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Dec 2025 10:50:04.8300
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e34f667f-54d4-4dcf-ec94-08de485a5b6b
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CY4PEPF0000FCC0.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR19MB5194
X-Proofpoint-GUID: eCyXmd2LPuvTMOFH_GHNag2LoVgYpGjb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMxMDA5NSBTYWx0ZWRfX3ghr9SGe+/f/
 tvTISClN/xfR9NLKgFlFD70FP6bjbToPdvbMCaB/UZshqaRTUh3t8qYDvmVkouTPIG+DRGPtiIk
 P1UyD44F/4cOIms0h2BeuGJkkJcYI6svXiGr9mF2Q01BvcarDGNgQ4+QkzFkbB+8OxnQtN73GOT
 mw1UHZM+anZrzp5cddNMLtxpHQnJIRmgcWF6OnesgHJIe81pINljXfUoKY4Wbt3OcJuyYXWfw8x
 PnP0mNGcTf/DomGP0Hs+vKLIdfZVR8PVpQlESZ5RevKPjVAfMz8Gt6BDabruD4wwIrW8NxBbGr4
 5BKAH12rKQTuLTECoDnh0OnCCSAm661nFmXcJB4bDAFMZjybKTqxhHXcYbUO5HpAArpDIgO1cjm
 kbpeHW4wxijlR9RtGkETzP2acpe91YH/fUw3BZncWbeC60I3cWIGRK+XkmpPtHH6d8xd3CGJ0wj
 oz9F5Ciut3fVspMrLOA==
X-Authority-Analysis: v=2.4 cv=bJgb4f+Z c=1 sm=1 tr=0 ts=6954ffe1 cx=c_pps
 a=uUOONCeAppmmVOxUvBiRog==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=wP3pNCr1ah4A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=w1d2syhTAAAA:8 a=513esOqV-sMWdUY0qnAA:9
 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19
X-Proofpoint-ORIG-GUID: eCyXmd2LPuvTMOFH_GHNag2LoVgYpGjb
X-Proofpoint-Spam-Reason: safe

The new v3 file format has all the same functionality as the earlier
formats, so run all the existing test cases with a file type of 3.
This is only done for Halo Core because v3 files are not used with the
older ADSP cores.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 .../firmware/cirrus/test/cs_dsp_test_bin.c    | 30 +++++++++++++++----
 1 file changed, 24 insertions(+), 6 deletions(-)

diff --git a/drivers/firmware/cirrus/test/cs_dsp_test_bin.c b/drivers/firmware/cirrus/test/cs_dsp_test_bin.c
index 163b7faecff4..4532a7e9833a 100644
--- a/drivers/firmware/cirrus/test/cs_dsp_test_bin.c
+++ b/drivers/firmware/cirrus/test/cs_dsp_test_bin.c
@@ -2149,7 +2149,8 @@ static void bin_patch_name_and_info(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, reg_val, payload_data);
 }
 
-static int cs_dsp_bin_test_common_init(struct kunit *test, struct cs_dsp *dsp)
+static int cs_dsp_bin_test_common_init(struct kunit *test, struct cs_dsp *dsp,
+					int wmdr_ver)
 {
 	struct cs_dsp_test *priv;
 	struct cs_dsp_mock_xm_header *xm_hdr;
@@ -2197,7 +2198,7 @@ static int cs_dsp_bin_test_common_init(struct kunit *test, struct cs_dsp *dsp)
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
 	priv->local->bin_builder =
-		cs_dsp_mock_bin_init(priv, 1,
+		cs_dsp_mock_bin_init(priv, wmdr_ver,
 				     cs_dsp_mock_xm_header_get_fw_version(xm_hdr));
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv->local->bin_builder);
 
@@ -2227,7 +2228,7 @@ static int cs_dsp_bin_test_common_init(struct kunit *test, struct cs_dsp *dsp)
 	return kunit_add_action_or_reset(priv->test, _cs_dsp_remove_wrapper, dsp);
 }
 
-static int cs_dsp_bin_test_halo_init(struct kunit *test)
+static int cs_dsp_bin_test_halo_init_common(struct kunit *test, int wmdr_ver)
 {
 	struct cs_dsp *dsp;
 
@@ -2243,7 +2244,17 @@ static int cs_dsp_bin_test_halo_init(struct kunit *test)
 	dsp->base = cs_dsp_mock_halo_core_base;
 	dsp->base_sysinfo = cs_dsp_mock_halo_sysinfo_base;
 
-	return cs_dsp_bin_test_common_init(test, dsp);
+	return cs_dsp_bin_test_common_init(test, dsp, wmdr_ver);
+}
+
+static int cs_dsp_bin_test_halo_init(struct kunit *test)
+{
+	return cs_dsp_bin_test_halo_init_common(test, 1);
+}
+
+static int cs_dsp_bin_test_halo_wmdr3_init(struct kunit *test)
+{
+	return cs_dsp_bin_test_halo_init_common(test, 3);
 }
 
 static int cs_dsp_bin_test_adsp2_32bit_init(struct kunit *test)
@@ -2262,7 +2273,7 @@ static int cs_dsp_bin_test_adsp2_32bit_init(struct kunit *test)
 	dsp->num_mems = cs_dsp_mock_count_regions(cs_dsp_mock_adsp2_32bit_dsp1_region_sizes);
 	dsp->base = cs_dsp_mock_adsp2_32bit_sysbase;
 
-	return cs_dsp_bin_test_common_init(test, dsp);
+	return cs_dsp_bin_test_common_init(test, dsp, 1);
 }
 
 static int cs_dsp_bin_test_adsp2_16bit_init(struct kunit *test)
@@ -2281,7 +2292,7 @@ static int cs_dsp_bin_test_adsp2_16bit_init(struct kunit *test)
 	dsp->num_mems = cs_dsp_mock_count_regions(cs_dsp_mock_adsp2_16bit_dsp1_region_sizes);
 	dsp->base = cs_dsp_mock_adsp2_16bit_sysbase;
 
-	return cs_dsp_bin_test_common_init(test, dsp);
+	return cs_dsp_bin_test_common_init(test, dsp, 1);
 }
 
 /* Parameterize on choice of XM or YM with a range of word offsets */
@@ -2539,6 +2550,12 @@ static struct kunit_suite cs_dsp_bin_test_halo = {
 	.test_cases = cs_dsp_bin_test_cases_halo,
 };
 
+static struct kunit_suite cs_dsp_bin_test_halo_wmdr3 = {
+	.name = "cs_dsp_bin_halo_wmdr_v3",
+	.init = cs_dsp_bin_test_halo_wmdr3_init,
+	.test_cases = cs_dsp_bin_test_cases_halo,
+};
+
 static struct kunit_suite cs_dsp_bin_test_adsp2_32bit = {
 	.name = "cs_dsp_bin_adsp2_32bit",
 	.init = cs_dsp_bin_test_adsp2_32bit_init,
@@ -2552,5 +2569,6 @@ static struct kunit_suite cs_dsp_bin_test_adsp2_16bit = {
 };
 
 kunit_test_suites(&cs_dsp_bin_test_halo,
+		  &cs_dsp_bin_test_halo_wmdr3,
 		  &cs_dsp_bin_test_adsp2_32bit,
 		  &cs_dsp_bin_test_adsp2_16bit);
-- 
2.43.0

