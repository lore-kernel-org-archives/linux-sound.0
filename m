Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03D0629E0F7;
	Wed, 31 Dec 2025 17:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767202054; cv=fail; b=FLZ3XpiCSknE/xdDjUZCWzutyiCLnP6To+I+eDwevt6s/sU5Egyg+5477aYQLapkiVqHwVToRltyX53Aia4Iz89ajhTVVpWMACabwGEHOtLnPg2wTAwSW9cXhgnnHlv4goMci6luqzwmy6Fb/XLv0ytqVR60ueJKA+QdHBUa8M8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767202054; c=relaxed/simple;
	bh=t/+Og23eRh3txD0FL+oGCfUMVzFHx8rW9IggHe5/d1w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uzexDFGSGmCb+2jTQ01DCgFUUdlqH5u8vkkhuy9XjSrHG9vHLQXXkggZSjzNhaKeT9sq1DxpKsgr5nlaST9inVyOy3r44uQcTlvO1BIJELaLyHLTMBGaIugDyMCSezfITQ9V1pC6KKHzI29KvKpdFwWXoo5WqAOo80/0U7gXCwU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=loP43S6T; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=yNxPZYlZ; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="loP43S6T";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="yNxPZYlZ"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BVHChvP948448;
	Wed, 31 Dec 2025 11:27:27 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=bHbJRu5siMnhVfsDNENVU4fxFuT2av8Ff8qZedsyv8A=; b=
	loP43S6Twj6JxSifwt8I0vQoIyeYRm8alRnJ/p25Pl17DdXYCXt2Hfxq/A/Z8/iy
	7pn2MtvO6T29fk0qeSi4ICxJcpEH6pWoqtEWaU+NbNkYZeyStZ/khoMnz8laLJD6
	NZO3iON22wBBrPRmJzz/GNsNq6Sa/QBcNmddi9xt/XK5Lg68HN/IwmsPuGZpSlIg
	9ProLt+Hsu4Q5N7rVOjDt0RjkM1lSBRnXm7jC9K9u9zs3T53Iybke2jp5kqg5YrM
	p2yQ2OSGIg06LU6Sgr/x6PeHD+X/DS6kfW1nCT+XceDsisaMOjr1iTA4+ecNF0qj
	ThMfI0VcUZnbxMmNK1fDRA==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11023092.outbound.protection.outlook.com [40.93.201.92])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4badr3caku-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 31 Dec 2025 11:27:26 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NUfMalpxVlkEtegrqCLL/I2rNn63GTZSVrNXRRGU3B69j9Ick2ZMD6WcUNBFbtjzavD+tBLRDYtlM0XdmpozY3g9X9DurySUzMIGUHC3k2o+UEOmubxfDeSzyci7c9rGx++j91bzT7d9N7+qNH42xLRqaMvZ247kepAJyXlyt6gXnx89QO4L0+/E3yMg9uhLfSwcWKAJ1R1zwVGpp1QbwQwHwSN/4MQFmN3zCE8E8AZfHIcMPic9Bj8/UnEFQMAniKE6wsqFoqMKKMCuhkcuBvPC0W2OWUxo3L6V3XmZbAuYg6aS2h5M+j9AzDUhmyWdhesuTmjYUoUdnricx7szTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bHbJRu5siMnhVfsDNENVU4fxFuT2av8Ff8qZedsyv8A=;
 b=OVzcN/yFHD106dQWfOGn+6HUuMXvzh4G281YOJynXMFtV3HQXBPKCDNOTy5tRnAntorCukuWJii2bATPnaKS+oJtERnHDq7h90HFSBFu8E++giWTPi4CVhm7fdQ7T74dN861RoYDcV8htRdgGFgnydNmXqjIdPj3XGOlhu6maVQLzyNI8AIJsRvltQuLmA/8aOVH5uWTRSzo9bGHNu9TfgHIamX0UNvyCjZia72J+baR0tVtj2+sKC0rbsjtU8iU3WcdMlxrmDt4W715dSvEgmZmU2BB107kBtOAJAjzGmDQlIhi69oa8vc9WsNzarX6KJkn8kBhsuQzPLIjXNAJVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bHbJRu5siMnhVfsDNENVU4fxFuT2av8Ff8qZedsyv8A=;
 b=yNxPZYlZkDC2MXI7H0kFDVB0qPkEQbitn7dGOAyCxUHg0dio2O/3croPdnCaGXWCXMTZy8BAg8vbhRkNUKcBeDNu/9vl/MCfZIB2tgp5P8/koqmsQYBZOz9BqaMHYCgLAIzD2iT1eMGuNhaYRknohjGMz3WTmIbo9ldYO4KgodM=
Received: from SN7PR04CA0182.namprd04.prod.outlook.com (2603:10b6:806:126::7)
 by DM6PR19MB3979.namprd19.prod.outlook.com (2603:10b6:5:242::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Wed, 31 Dec
 2025 17:27:21 +0000
Received: from SA2PEPF00001504.namprd04.prod.outlook.com
 (2603:10b6:806:126:cafe::87) by SN7PR04CA0182.outlook.office365.com
 (2603:10b6:806:126::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4 via Frontend Transport; Wed,
 31 Dec 2025 17:27:17 +0000
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
 via Frontend Transport; Wed, 31 Dec 2025 17:27:21 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 44FD840654A;
	Wed, 31 Dec 2025 17:27:20 +0000 (UTC)
Received: from EDIN4L06LR3.ad.cirrus.com (EDIN4L06LR3.ad.cirrus.com [198.61.69.19])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 3506E820249;
	Wed, 31 Dec 2025 17:27:19 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v2 3/8] firmware: cs_dsp: test_bin: Make patch function a test parameter
Date: Wed, 31 Dec 2025 17:27:06 +0000
Message-ID: <20251231172711.450024-4-rf@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF00001504:EE_|DM6PR19MB3979:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: d60cebbf-25d5-46fc-1306-08de4891db15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|61400799027;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?OjkVd1K/OyVfPiE3v9R06uGTWI6EmrXVRTKsZsF2Ha5AYisJgEz0fZls9dWT?=
 =?us-ascii?Q?oEuVoRe4P71wf7NF8rxW3df8zExZJMJkX99rKxn5q927sJMsatV4+lwp45ym?=
 =?us-ascii?Q?JtTtLx+A6wQwkQJ3gms8+HYwTcg92Emx2LRsydxeQGLVqVAg1RQQBwxxMOhd?=
 =?us-ascii?Q?R09cYPqZMXnOz957FGvo77YtnlHGmApVVI0vJuE/6I+dmY+6qt/gLUWCRxAe?=
 =?us-ascii?Q?ohd2XwaAHo/z6Jf0vplAJbhzp/KBKRaUg4Q6+yFUXvdZfpUvN4P1mqKojbO1?=
 =?us-ascii?Q?yAeK5yzyctYoWkcYcPxfP8c0z7q158Hmc3FE52BCQSiq9wDKA7Se1LUoVtW3?=
 =?us-ascii?Q?RYunvUh2wPhQvqFPJEClM7LDhLbvTzixwqD1xQ/GmZqZiq8EIl5le3RficwO?=
 =?us-ascii?Q?PURJpNcT2vw52QcIOCPloIF4W1IP1h/hX5sJngLFWDL4SKSyW6YrLRkckdo2?=
 =?us-ascii?Q?lHssPi5OxNUn/P7Xzid8XD1IcQtdkSpgSF3Hp8UtG+IE47DzK6ivgOmokW5h?=
 =?us-ascii?Q?cdt12RtfzNhcnAbmns7DuOUIQJyZKhDh+oEig2DwIB7Ene9IszaQoDl+ox4E?=
 =?us-ascii?Q?NHazxlSsqqdVss1JltQ7fYYlt7h5UhNF67mB21P/HlJKwNF2/v+QwobZEOZl?=
 =?us-ascii?Q?Yf+WV4mS7k3IzEcqq4iT1scCg6LLQXnQW7YezIGp51L8iURoc8e+1PrYWKKg?=
 =?us-ascii?Q?oq2vg8hHmTmWuSt40TVegDy8XQ90rUPztmxCyzMj+paMx7mnVey6IyVLTiPe?=
 =?us-ascii?Q?hzw9zYYZqEAKMggQV/RV6rONpLdzfmsH7DM200458vSQNLJmDUtoJ3TaYgAS?=
 =?us-ascii?Q?YUXzSFNdqNRUUKEyZSX/f03f/DDH9MUcQS4mRGzuD86ua3J9lL5RLN1n2rhj?=
 =?us-ascii?Q?6FVYWjCfnC9HgdmLUSGOTE75+rQzfAdqv0bW3xaUofBuffvfArFybnLazczG?=
 =?us-ascii?Q?PYcGbutnqV998z5JA8wlfMA8Yi6s1T78sw7Rxj8zjjY7oOqWz/thhJQ9WAgS?=
 =?us-ascii?Q?yxi/kK+lS0S7gGK9cSZ8StI+QRNahDXR9CmjeE/fIyrtCd4xJ6nEodemoebS?=
 =?us-ascii?Q?UA5GKb2d5NeVu9kVh/v200dVqeT2CYkUVHFZRP57TysWNiaQ+Crdjx/k+faM?=
 =?us-ascii?Q?1Exgq8MNU/QjflpUVbbyBSPi5JDXdeXW/qXhcrvzTH9hbQmhkqFO6/NOFbhU?=
 =?us-ascii?Q?/5w9i/2XmE35z9dFqIbQg2LcOOCfIyq6GM+ziuBaPU+iS9WL/uH6BB8DM0wY?=
 =?us-ascii?Q?k0lkznpPhpykWyWOcQz8hy0+PW9AMhzdSaOZhh+EMnALkM3LZ8eKzGRlcEIw?=
 =?us-ascii?Q?jfKBmoVQkEs0qy0uYoJj4z14yBaLgSaAd4Zj1ox5xEnGoplmBxObV4Wa11Df?=
 =?us-ascii?Q?KybEp/BUXTgRJmKM9ew+YCH1q8Ju+CwR3jjIGl5riXhtUIGpcWJRnfSursGI?=
 =?us-ascii?Q?PGsRO3y50A2IlaKaNw1dxGgv/d2XmMcjwoQ9EXX7ncBieYSq+hhiZvLVXtPM?=
 =?us-ascii?Q?iQvUSrLD+TN5zkQiBi11uQEuyKnQ1tVX+8i0DU3uwI6lLR0nUoKFsGmx/By7?=
 =?us-ascii?Q?Wrn1T5WFAw5n0qasSlw=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(61400799027);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Dec 2025 17:27:21.3459
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d60cebbf-25d5-46fc-1306-08de4891db15
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SA2PEPF00001504.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR19MB3979
X-Proofpoint-GUID: IEUopd-9a86QsB8wWt8y4JrrLMn8n98F
X-Authority-Analysis: v=2.4 cv=Z8Hh3XRA c=1 sm=1 tr=0 ts=69555cfe cx=c_pps
 a=Ta0D7379KrHwLEZKU6rhjg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=wP3pNCr1ah4A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=w1d2syhTAAAA:8 a=5SG3a8Kso9AvpaViJGUA:9
X-Proofpoint-ORIG-GUID: IEUopd-9a86QsB8wWt8y4JrrLMn8n98F
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMxMDE1MyBTYWx0ZWRfXwPFIJLkYdguE
 alYsWRXUZig1/VD3bJs0Z2OYpp+nvTQnSLamSiAuoZYxeIrAIKCUW5h8VROK9c0rKdfQfxoQWkX
 Q1moyNaVsrcYJNdztwAtke3WjsBVs1thhK9bDWonh1QCE0w1AX6ysQEEZBtl8JjdUGrco8fc6/L
 pTdFVi2GMpNh/+rfhxFHxu7npnYN7ackyqn77g9OtrAZogBTtn22T8dAyhkjwW1Z1q3LU3Rn8Gq
 FvuiM/aJdjMo+5gNWfwguS2FK8L7yhIuul967/v1H0HwGqklUPCH8sVATLaEIak+2lxNSOjexyY
 vYjyjoYmylqqGKw5dnV80weO8YRUH48xNJ+3VPMBCHBEe+PhsIXfR9IWKjS7O5UxWh547dTjzqI
 pZUg2p3DsC4gfSD+5cyPpSb0501v/qRnIunMTym+jKs0wATbf0r+WhzITLlHcZpgUDUu7t03sS5
 M4rLz7LJHV08I6WWWrA==
X-Proofpoint-Spam-Reason: safe

Make the call to cs_dsp_mock_bin_add_patch() a function pointer in
the test case parameters, instead of calling it directly.

This is to allow for future parameterization by which function to
call to add a patch.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
No changes since V1.

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

