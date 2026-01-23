Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64AB7340290;
	Fri, 23 Jan 2026 11:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769166851; cv=fail; b=WYtAuEnMkzq3wqUtlj9b5YiYprCFRu8bAnZn1XSTJi6suNNNztGhJauiAtWVmj+iUQB9kIIe3GiFkbFe57uSKMKiizZ+Z+dA8pkdr1xa+foOYrAj56qaCC56OTMuOrUrOjCENMgVbJ6GJg8qKdZrZlCspE56btMz0XjexRl1P5Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769166851; c=relaxed/simple;
	bh=zk1E3mMQRSI3pzUYAJ25SgfuVr8QgwUb42ip1ObN/Qw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=kp1QIYmu1Y8kOCGQ5hxFJbxnIIVmIZtXqEPeYeG4o4AVeZ+SmEEUNQxIBjgk15rGsM49Dw1eyX5z9zbJlF8ehZQDiSEMK/ewcH4qTJ5MwSs0FwnNhg6ug8nM3YyhtN8I0d4fCMidJBnsf71FnTw+PFjMakVW0q3sdyvU5qXmqa8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=TDQR4N30; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=n2snZt8C; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="TDQR4N30";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="n2snZt8C"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60N4v1cf378280;
	Fri, 23 Jan 2026 05:14:00 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=gDDH0rAIBeYa5zAI
	yzjflOd9oA2UiFPe6jEDM+2xLG8=; b=TDQR4N30KI+EzYCFy/cq4eUR9xWfLXMb
	FdPAjzdi8JFAqOQrTDP8HmyphToPewEuDaoNiDIuCgTJ5ls7XQh3jBHP3N09yS3Y
	QnTJ7ouQRKIM1xExsnc6zBcjyWy8zMMmCx92qSNzi1bDAxN/ZkrmIlypC8qU5Psi
	7alupZb0VdJFANOGEEVVK2blUOkKtJfx3HsGgv+UjNaTxRhZT0dG2QcBxG76trcp
	UZUqH7/byeDytTX14w2H/e3aIiZYdjRZmzTzNsDJjLpSeB31uKSafxdStCfnlFFv
	RZLAmTo0CZrxgqAG2Iuzp80PLxCfEvTFql+ylf0IuPBzp6BDI3KPkw==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11022133.outbound.protection.outlook.com [40.107.209.133])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4br7qjymvc-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 23 Jan 2026 05:13:59 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O4NZlnF7ONDoeFihFH11NaPY0UKyt3rgc66WWD2XsOKpaWj7i4kJaXVHcmwJmgu040aVYtzvRyeou8iGWxkQorI7xF6uqHg4xZAsc6j3jPPnWyCoXIf+n52d8I9lZHGPtDIujpigXTLTc3s6KTC3iW0hS6pHE3mm8KVSOIjfZqBTGxH1x3TAA7ibKgv+CJzXAh8R5gt5t4hON7xBiaq4v9typbKYp+KzvXmi9Xv9qs/wNbcdfySy62rfdvIl7zTQen3fdB3Fofh8P5a8BP3427NGa5gw4+8dSlHytNmOPbtZ61XFC59hfRjHyANyTHNDNIHL9uZW0yBBm7EYrssFew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gDDH0rAIBeYa5zAIyzjflOd9oA2UiFPe6jEDM+2xLG8=;
 b=Z88U+TXgg95OgJOyGP/c/U7PA+fUxUJWw2hFXMNR9PKFO5WmVIs5V5bTJJAnS47DkE/5m0lyX/5NCKMv9A6HNdyS4L7zCngTTOuvwy06a8gqUfTFeSnFRjOmSVubA9cimxISHfrKdiNomQ6/mu9lcv/bdsDk5nUteK7luc6lrNamKt6RjHgeoA7PEs0NcP8VpJVZ3JpIMGK+7TQTVkGUwdU/N1JaJYD1INvjZAiLOfteuSGk5JSvI8z/yn9wXbNVOM/5VmMRGY39o0rHh2JEhHkCphOQ8qE4kElbfc+c8Z0LuBIy9PD041V/vo7TFdKeYDN/2Tz7WI6FuFDtTXTIEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gDDH0rAIBeYa5zAIyzjflOd9oA2UiFPe6jEDM+2xLG8=;
 b=n2snZt8Cfd7o6l2fy+RZ8Zoho+fG8qk/je8YHZfLMhNAcFzEQA/J04ebSVIsrp9mSzO53nQGwDghtSAGy+K5jSocnx/13TKwfCIT2YYBJpZHSwKrG4/4wWh2aezBbgIp7T7skSgKK+JSMKXDu+Ck4wpCpCqmIhLAhK5VL1N2H2Y=
Received: from BL0PR02CA0139.namprd02.prod.outlook.com (2603:10b6:208:35::44)
 by SJ4PPF551E93D4F.namprd19.prod.outlook.com (2603:10b6:a0f:fc02::a23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 11:13:56 +0000
Received: from MN1PEPF0000F0E0.namprd04.prod.outlook.com
 (2603:10b6:208:35:cafe::ae) by BL0PR02CA0139.outlook.office365.com
 (2603:10b6:208:35::44) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.11 via Frontend Transport; Fri,
 23 Jan 2026 11:13:56 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 MN1PEPF0000F0E0.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.3
 via Frontend Transport; Fri, 23 Jan 2026 11:13:55 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id EB258406540;
	Fri, 23 Jan 2026 11:13:54 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.24])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id D20B4820249;
	Fri, 23 Jan 2026 11:13:54 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH] ASoC: cs35l56-test: Fix missing module namespace import
Date: Fri, 23 Jan 2026 11:13:54 +0000
Message-ID: <20260123111354.1931986-1-rf@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E0:EE_|SJ4PPF551E93D4F:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 7accb981-fc08-4c21-a533-08de5a707fcd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|61400799027|376014|54012099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?nqzqOxKLAR3ZutlG2iXXvvsyHBpsKyf1bUEHkLKFK/uALXLyVcnU+pzPfJgu?=
 =?us-ascii?Q?G90JROA9wA/RuyrykWpYFwV4GyxaXNmL2AiYekIWkyOaP+MzNq7//zOPH6WT?=
 =?us-ascii?Q?hkCkjvVIW+Z3eDx+vDxasK7E6Emjmvp2XwIR0pEkf8oHAI7fNhNY8OBV5rXW?=
 =?us-ascii?Q?5HTx+zcOUsVYzxi1vk8z+MAHw2b8UpPSXzRMicYzsT39jS4Z4vpGlIuztHl/?=
 =?us-ascii?Q?CiwRmVS9n2gEOANHVv07sWi15aNWqJoMklO5x/U0I7CFFP+ooxYL9NEXP+Xr?=
 =?us-ascii?Q?u4+Q5ZhdY3KrJlBuk6WhilbGeMN2HOPgGgWGprlrGjF9sQCnQxMTIajGu+3y?=
 =?us-ascii?Q?ieORCTK3cizs+tDS6StAqG6rGZNSsJ95UYaYfR0MhWCLVXGM+mBEh9NfZaYz?=
 =?us-ascii?Q?ikZBxOdLBiYQ0tDNOzBnDXD7O1jRshKYOtDTISkex+TwjKzXratP3FF2uyIz?=
 =?us-ascii?Q?cQOAi07S0FbPPKCRrmN8OV0Din5MoSUXRuhW3EPhkOmP9ye6OPfl4D19bI5F?=
 =?us-ascii?Q?kIfn2+biKLC2FhisTYVmSTS+JmenY/MwducDJooEGxsuuvIujurRt6Bfzz7t?=
 =?us-ascii?Q?wuaHjTdW4JxInkQ7xe729+84rvEIjFYJHGXRPgpPiwgmwAb5CJbTjGEK0C6h?=
 =?us-ascii?Q?2MPmt0iOjHrp5R0noWViKZ3YAjILHrocA2HhykMzYIp5tSqceUJCmO4aVbeF?=
 =?us-ascii?Q?436SlB6FaNrP7G+bPv2KYB2dGb4pLiHHUFFYKEjFvXjPHSNUc1/YxkbV+vTR?=
 =?us-ascii?Q?oxp6M+TPokdPvV3WONUaqSLP9QGfj3sEZTdy425eeoMzvNGkY97BR8dIcDFH?=
 =?us-ascii?Q?NRBjZDi5FFmp6mQunj8StP2aFWppwN5H3n081EJv64vKl8zfrc4/gZwDNHgR?=
 =?us-ascii?Q?7njoFaYE7PSxJcTOg9v+CFY5InxWZFctc009BwuUzkZY+89cwlyEUcISD7e3?=
 =?us-ascii?Q?UdalXFg7GgHedFDCUPGoa3c/15E5dqWlMWmFmG+wYzqCHekCHj/5niQBIRIo?=
 =?us-ascii?Q?HyVundyR8bXm6gN2rk8NJsXJ8/80Ykn9kc7g3JchsAIplDoJsNYiz7pi+ssQ?=
 =?us-ascii?Q?2VS9z5hSgS5ix1xqA189BGSLqtPV5rN9h62yB4f0tYeCdKNWebKF/24+jvjL?=
 =?us-ascii?Q?MUZ/NfYc301HtW8+xlJsM0MCn5GYEq8jQoZPfEFOY0ziS6BqGzRcmfE91Eap?=
 =?us-ascii?Q?a+kG43ytCcRcbGpAzJu/KIedr9BxDhwFTXKYPlXwoKTWZqnTFZleQkKRsvcC?=
 =?us-ascii?Q?39fFNvXiaQb+/lro+l67kCehjCkqsxvwlg7MHU/FBfa5QHBvlsrJrwRN7hhR?=
 =?us-ascii?Q?XrwOcUNmIWjKo34fw6tTZYdUCA0/uLafius7Jngk1TSxqHDFW2ePLij37LGv?=
 =?us-ascii?Q?rVo73KyO5y/4dlp8d/rE+vaJ+wemKypmo4w/bI85Y/InMhkPktlykT8D18B0?=
 =?us-ascii?Q?aBy4yAdqOJVXx0JUtvsKHWdrKQSKHQTANmNjfQTyM+r4MBivNnDWb6xxgVbx?=
 =?us-ascii?Q?3rEuezLSQAtNYArHspW81kUxf2+WapOlWav7EO4ildcoUGR1NRUmrtZnfezQ?=
 =?us-ascii?Q?VR4/yRFTPMv8ewlF5AEynsMPZ/XyT7vQOwhr0KQowFr0YRqKq9MQtpyB0bK7?=
 =?us-ascii?Q?x6auoG4ABOfplZCGcuFdhPdvbrPpf8q+vuUDsQgNhuh6Om+jMgIFF8gVBlRA?=
 =?us-ascii?Q?Puf7hg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(61400799027)(376014)(54012099003);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 11:13:55.8150
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7accb981-fc08-4c21-a533-08de5a707fcd
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-MN1PEPF0000F0E0.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ4PPF551E93D4F
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIzMDA5MSBTYWx0ZWRfX38AEQgMXWdCV
 LT4KLmZpANz70tFkvn8pl7pqYb55HHCCS+ex9iD6wSriIpZNHDFB5JnvOmdxpHxFjdjoOSpTv4t
 QodJlZYaUpb3k8AuFFVTsKCutzRc6oAsMcl2IV34fksUonRxU/8QCDTKx6B+3zq2lTtY/aJlduY
 OQTibDO1Oe9qpQ2cBQ+r5p8bKrTB+lUhlC/BPunW3ym3FRWBkPNKqSLJTTbUE0JDn9TP+hkF9Bu
 bz7QNEy66dPzvZhx528w5iKyfeMJc8391DRSjaHtumX1R/rnvTFQPLfgdSDXn2kA6JwrwNorI/H
 3bS/XVqaCv30Zu3JbCIh8Pd0Ec9pbxVAJv60V3glE2R23kM1fczOnwOc9mTS0jnYUg+e/3Qxqws
 C0d0Q3rm/yHyOLb5UrXSVYbal3E5q0O2BKfLl16W3nePyrOFW5Mu3CqE72Fs+yHjPmZwjUNh46y
 YgL7+1a8NaW74utBnFQ==
X-Proofpoint-GUID: _2seIssDXBRMrdgYN_PZXWtoiISSXvdG
X-Authority-Analysis: v=2.4 cv=GrRPO01C c=1 sm=1 tr=0 ts=697357f8 cx=c_pps
 a=o+9IzLN2JPavfcgUIASn6g==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=w1d2syhTAAAA:8
 a=Eup4lPlaATTROkgdByIA:9
X-Proofpoint-ORIG-GUID: _2seIssDXBRMrdgYN_PZXWtoiISSXvdG
X-Proofpoint-Spam-Reason: safe

The test must import namespace "EXPORTED_FOR_KUNIT_TESTING".

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Fixes: d0ab89951197 ("ASoC: cs35l56: Add KUnit testing of cs35l56_set_fw_suffix()")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202601221843.kS9IMZ0E-lkp@intel.com/
---
 sound/soc/codecs/cs35l56-test.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/cs35l56-test.c b/sound/soc/codecs/cs35l56-test.c
index 66d772d7b982..a7b21660c402 100644
--- a/sound/soc/codecs/cs35l56-test.c
+++ b/sound/soc/codecs/cs35l56-test.c
@@ -360,6 +360,7 @@ kunit_test_suites(
 );
 
 MODULE_IMPORT_NS("SND_SOC_CS_AMP_LIB");
+MODULE_IMPORT_NS("EXPORTED_FOR_KUNIT_TESTING");
 MODULE_DESCRIPTION("KUnit test for Cirrus Logic cs35l56 codec driver");
 MODULE_AUTHOR("Richard Fitzgerald <rf@opensource.cirrus.com>");
 MODULE_LICENSE("GPL");
-- 
2.47.3

