Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3C532BD012;
	Wed, 31 Dec 2025 17:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767202050; cv=fail; b=FOhm+S6Uo8ATeVSDr/8/Qk3sw00n4HyBfQUSyLrDPEUex57LzI/Y/AKVLvhqM4be6AIuSpOUZ7RQQiuWFhVFiC0oqawUQn73gLITbv2nDGpD1QM93Yr/bqoovnswkyo4Bdl2WUix7TR1mAJKRpqtoUwWY0T3ZKkNeeEZ32AleRQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767202050; c=relaxed/simple;
	bh=G9vJtFydobvDbJxp1AP4NFrKYeVPZS4DwiZ8F99A+Rg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fPnoDVOEGcevsBWbm7Dy7pKi66MTwLr3sp5BYevlqrkjQwBTbT8OARxaT3KC0dLq9HlrvjZ9Cs9drOetbw1KzLfjCiH6brvzbsXAN2+S0a+J3pG5ck6naY2R0Ng/RfI5QqxYsgZRcD6OByyRm7t2ec4w5bw5J1SbNo7021v1EM8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=hP50Tbpr; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=yH2zW40a; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="hP50Tbpr";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="yH2zW40a"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BVGglin115042;
	Wed, 31 Dec 2025 11:27:26 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=yVtwo/EPXRo6c4VMLUIRAcdcpqn4SUPRLkgcMNzAUK8=; b=
	hP50TbprniH6OTaDELAy+t2CYr3LCFwHJNggQNcUMyS4xQ1ogQ14xliSOSb+FQpf
	6O3lqW1XJTm4gYEdNGAXi/Io1FehQ9wxK+rLKZwyU8+u7NFoJwo0j1tRNWD2Gth5
	4a/woPPVPnHXaHT+0hU8dfHKHgX3gccTz+3fXnKtH/UP9ULmIFf7DPb1BKcRn358
	2VOXOo+JYe3OVBeDEhoS6PzJT2zKpXFM3xsR3FRWwHuBcJT3RuRQHN7OIHbQczyv
	3LB4NVKTJNBenkyvQBaGHHCd4iKEg4qFDAmzUY4dPGI6fWVN/F7ANsnlHsdtPsuu
	SobTANW8lCP9PpbC6pruaA==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11023091.outbound.protection.outlook.com [40.93.201.91])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4bacrmvcsn-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 31 Dec 2025 11:27:25 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r6xXO5M9qmA1j0/bN8xNxHc+804l+bO2vGIhaOStBLKF3tD70l1vINCkMMvoxrf5rZ+iJRtUAuFAivAXJBKXdoJYscEQjON40O2DvABWo6T0lt17a4IHh54cPQZ1yFLS4KD3qqzxxQ6tQnc0Ofki56vqzE10F/KeQ7sdLF4tf/YTr9tlvBMrFDmQg8R5Kv9nkpwOJbokp8PK/DfTjxeU0i4W4KyibCkSIddIZfALYzRK6OPKm0avDekBEWBuQM4n02NcMdER1Xwv7LD2PtIjyDmPo5gUqlns+jr7i/83QZW7REVS+nWTffsLpL7PHEBHu4/NbJzguBf6024aKfNWjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yVtwo/EPXRo6c4VMLUIRAcdcpqn4SUPRLkgcMNzAUK8=;
 b=sfGgxS38QY6pvw0uhW+6byhU+tLxqxQaE9q5YsUiN0V/UcAjjmoYzCiAE0Ul2DfHCICojjVNkGnYjNe00h47BGgrUuuLS4ngd6oH/Lt3EXYLRnQXvpe+AM6E0oZOHI7K7cpUPtsVuNQAsXQ1nQ5cdQm2N/gW6N1KQE/SpH+FU8hrBQD59wd3t8hcABxHeYXwkmobyeycZ7qjiUmcZQjamhvrvDxLIB1txWU8djxpGwNMGzEtQ5HeT5t/p8uHSE3LB3HuICuV+mcYdDiNhWvATndqKFNXbbjE+yywhPEJXKtQcFAZxPc1W+GokX0M9TdkfJPjAHq79HmQDl0KeOUrfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yVtwo/EPXRo6c4VMLUIRAcdcpqn4SUPRLkgcMNzAUK8=;
 b=yH2zW40awpgXNg9bNVf0WYYfHq86dBrWmfwmEIvE/Rn7GCQDq5u++PfhsgmW8jxqRyoGW6kvfWxg9QfGGMeTBSfJZvaW7mnSBFYC9bwosds7GBdek+6GhyYRQ3deJbGsLj0lgU1CZM65r/ok9RdTjcsRfzho5KcPzdcD9VDu3ds=
Received: from SN7PR04CA0203.namprd04.prod.outlook.com (2603:10b6:806:126::28)
 by IA1PR19MB7253.namprd19.prod.outlook.com (2603:10b6:208:42b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Wed, 31 Dec
 2025 17:27:21 +0000
Received: from SA2PEPF00001504.namprd04.prod.outlook.com
 (2603:10b6:806:126:cafe::27) by SN7PR04CA0203.outlook.office365.com
 (2603:10b6:806:126::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4 via Frontend Transport; Wed,
 31 Dec 2025 17:27:19 +0000
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
 via Frontend Transport; Wed, 31 Dec 2025 17:27:20 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 2DAC6406544;
	Wed, 31 Dec 2025 17:27:19 +0000 (UTC)
Received: from EDIN4L06LR3.ad.cirrus.com (EDIN4L06LR3.ad.cirrus.com [198.61.69.19])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id CC5C5820249;
	Wed, 31 Dec 2025 17:27:18 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v2 2/8] firmware: cs_dsp: test_bin: Run test cases with v3 file format
Date: Wed, 31 Dec 2025 17:27:05 +0000
Message-ID: <20251231172711.450024-3-rf@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF00001504:EE_|IA1PR19MB7253:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: b6ba2434-a8d3-4025-9ccf-08de4891da94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|61400799027;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?TNhtrs9kXXWWnj8v7a+lXB5dtVgTtXThZ/ATWzCTPwAI0579/vxN+K1zTcHc?=
 =?us-ascii?Q?lc8pjtzKsYg9pmy/iou8Bm4mzVB9TmsDJZON0UuUeknpxemorTpCsZ3M3jYg?=
 =?us-ascii?Q?p5KSP+ViAHYZMFeLeMboGkcP2+QgE5lEjLJM0kEPh5oYp1YPN3I4Y7f/nccc?=
 =?us-ascii?Q?I9NJ6a1VS3M71ep/UEOlkgT0u6ceVm+OcM4yfYqAie8BUq9D6ADwbdFfJNZy?=
 =?us-ascii?Q?WskTHs82t+JCpn6y0ulPGtNoH+7VR4pFcXqNK/M95tRjwo5vjCV4/Cvi4zRa?=
 =?us-ascii?Q?9r8ty2PYb1UpavG9luQEj+ScHXR28Wc5gPVuXSjmzfXIzAOo9VdOFYS2n8yu?=
 =?us-ascii?Q?xPc6ey/i0wO6fmEccPCaGWFlw4g2Hu+DL19bA2IPdB/cUGd8TkMyCtBxtttM?=
 =?us-ascii?Q?NJZ5HSud2ZnmvTweadb9pCztvUsDujrtTujf2mDQyv2U/PLpWW/C9bUDKWmm?=
 =?us-ascii?Q?wfoUGrXvzEcX3781ZNPw+ihEN90MtmTenLFFcAD86pU97rPcpQHrNh9lOFKm?=
 =?us-ascii?Q?Xv8TvopkgLcl6CCJqdmddsUxbAeTMDG5YCYiYqKD2+XhB9gGzBzhyXzzDysI?=
 =?us-ascii?Q?QQ60hKY+pxyR80zCgQwwIIpMURbs50vNGioAofd4VKHZfljxsFpTBbLT3A7v?=
 =?us-ascii?Q?f59pqnY52E2yOmWfRfdyyi2KEg3PFcU5JoPjlhAox1nzPqOBxrM+OpDHNj7b?=
 =?us-ascii?Q?DLufu0r2g9SBBw+BI50PCtaTtQMj0WSCEnfm6AqfPxlMlQ573jaqDQCw/Sg3?=
 =?us-ascii?Q?k6yLCLsKMY5SEyf6j9muVQoCXTn6Uzs77b5S7Jx7qGGt3xJJ7RS+Cvoy30qM?=
 =?us-ascii?Q?GRDE6HHMQZufX8AUulcOit5QonkKvpD2112dIaWuZmJq7Towzf8Pp/8CvlH4?=
 =?us-ascii?Q?d8dZvhFZWsPl4lbY4Q23+BTJ1lvSRDk6RAtynvTesdl9K3KUVF+Md8W9Y6st?=
 =?us-ascii?Q?1JXuZi4xazuvaEf3an26Cf6UZ1FuDrI8SjxR0ki8ke7EysIm5j156xiDlY7y?=
 =?us-ascii?Q?vFKlt5Qfyr+R+7Rtomr6isPcxigxI41LykAStri6uWL9VqBXUMRrm7tUlblc?=
 =?us-ascii?Q?2IN6rw5mB89iq0xpH2K9W8HE7uvvEWa4R8NFya9GNuUbHoubPwD2qe1cg7KE?=
 =?us-ascii?Q?5JLcq+AKYV3d+t1f6t32fzLRuMVB/EodBo9cnGIsaZC1eR3NqKEDkcqBb9Cq?=
 =?us-ascii?Q?19obVaR1nVcHLtgrRPSfKDnbGPCROL73XocYTMh/+QtK5+gXXcyYxzCfgLMl?=
 =?us-ascii?Q?XNtImUnqbtsA0Yoi9/cu0t8/ZyADPUIpFyU7CMgXr5m68LW0IqXU2j1T2xBr?=
 =?us-ascii?Q?TPw/pPkLBED2JwxQ+jP/QaFoV8EEBv0khAhuSyiXczU1R1lpeQkJoKdGH92/?=
 =?us-ascii?Q?0xdftFUE0htRSDTCB6C8ZBNDV87LY7x1Ja9Otaj2ATq58RZGa3u2oZ4CxlCU?=
 =?us-ascii?Q?Lkwj50KM3XKUcl/K7pejYYvCHZGKaae+tzzZW/qznGG8s6Bh+PCm0bfULoaK?=
 =?us-ascii?Q?sZeRNVFW20BjeatPDBqCQQITrZx0TpnlNCayjQQZhP8aA/fVOtdoVoKcrunq?=
 =?us-ascii?Q?wk3fBKypQqgCf9pLX+A=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(61400799027);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Dec 2025 17:27:20.5051
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b6ba2434-a8d3-4025-9ccf-08de4891da94
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SA2PEPF00001504.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR19MB7253
X-Proofpoint-GUID: jbqB8UNB-SoVBy9im5qNPOENWXEtPSsR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMxMDE1MyBTYWx0ZWRfX3+wAZ1sLjIQD
 jORtB6ItSQuB4fGcqn9lzPwLM6z8FyvDlmoyLAgRJRyTIdn5sNUAoXnBo9RxM2n/yYE9q37ihkz
 OEyh2GuUkiIP8FNR2WTcb35PvgHimf0LLDMjIpwFruBOT1qeVN+JaHAzRVlj3/oIMBu8QJJV/FJ
 cbLPYCHezJKY0Xmr4ppv8sSPTjL23FW9xJaRtWhMS6hNlrKEtv9LwXecv+N2ImU+OebaiOAbI3e
 ulrOS+6EFsQKlh2UsjXCzcb7TI5LxOAG+1iJoc6bFG1LYddu6Xk+IHDnKFRNyIvI5138lGg8uDA
 zdmUqy+pocZz4sZFK2y/IGgl1dE5zyG1NvhsRUEhNDv/1/9Y6zNrmniJu3jNf/2GKv6pGxEAvg1
 2qioM7p3pYVS35aAMAdAUPuQwSeqoqRkqhw+/PdId3FNJpN46cbYMEH2ryB0wHKpAhcLeA72GbL
 aSrdSykfvbSzbDAsDnQ==
X-Authority-Analysis: v=2.4 cv=bJgb4f+Z c=1 sm=1 tr=0 ts=69555cfd cx=c_pps
 a=ASZrmc5qRKQ8mersbOLYOw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=wP3pNCr1ah4A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=w1d2syhTAAAA:8 a=513esOqV-sMWdUY0qnAA:9
 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19
X-Proofpoint-ORIG-GUID: jbqB8UNB-SoVBy9im5qNPOENWXEtPSsR
X-Proofpoint-Spam-Reason: safe

The new v3 file format has all the same functionality as the earlier
formats, so run all the existing test cases with a file type of 3.
This is only done for Halo Core because v3 files are not used with the
older ADSP cores.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
No changes since V1.

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

