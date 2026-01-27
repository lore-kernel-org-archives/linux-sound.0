Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E64D13115B1;
	Tue, 27 Jan 2026 17:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769535331; cv=fail; b=A2o8aShj0HJofWlqnsh/YphSr+j7ZWXVopyLr8c2Z+VWDEV3CrdVxft8KSfZrArLfgT5j5YJ3xzeqO5cv31xjWAZU5/YmM3z86GDY1fdC8cszB0ZJFHEFOag9QAjmXGinXuDL8b6QUsvOXrxt4Y1i7MKGPvHq0fGHWR0vH1QQHc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769535331; c=relaxed/simple;
	bh=TLIS5M0PrF4M0mZRQO27Cxw2TR3LikmiGBIyLrpU+tk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HQfCYC869fG7AWL06HAidgdcjLEYfAiA3CCAH/hqYrngSvs7IfEKVtA+LPpjx1V6dLe/Tl0i+vmKU375QjkoPAxYEqu8XlauPhthTHM3I2qIRAtosdnJkuUq2nDac+j5DGbgZd0vNYE2B6+Cj5kwwQrH9Ocs7LwkAjuFcrjN8v0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=q8QbWnlY; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=SxrUeQV7; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="q8QbWnlY";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="SxrUeQV7"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60R76d9s112464;
	Tue, 27 Jan 2026 11:35:20 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=7yRcI0aIWYxt1AKxTAA9r4DRnyuryJWpmKCVNT81VQM=; b=
	q8QbWnlYNJxnPfrUsj3YJtM1NN3mGhN38hnRNwQ3pXRtWqG1X536M4Zaa3QInTTb
	pqNt99/fmkKV81Yk59pgMUAFyzk9u1OqXboyrbtksVqSInM8r+LrVtfo51TJMXTK
	8z2W7nuq/zeikwHr3ulm0ryS2BxgmETUFQssczsy0Kw9N/eVWizV1vS7fbMGzlaU
	zf9oGcnQD8FcmhVHcphA6fVk/1NhFvt1gdSg/rYxKNunjCr2PV0g7osRpONRRl9T
	zm5zywyEypB12kl1Avp8OqdEzHwV2NPRLbMYaX+eOVUlPIpIdiskUtKWZCpha1on
	+pxmFqqzDIIi7n+N0XKKNQ==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11022127.outbound.protection.outlook.com [52.101.48.127])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4bvvc037cs-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 27 Jan 2026 11:35:20 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZETll1MGiRYn/tT7bfm88fp4p4fPiOyuGwVwONwYOPnl7aSJyENorpMo9imubMjI5VZR1z4OZw8yAeLwFpoWSoJCIGeEEiNEH/9alE4hbA0jrpjstEkZTg1NFh+d0Clzo8z/Kce4W8z23NGJbiDta3K0eAwIXtkz18MdMsuvJZJm+GSaXoeaGB9oIGPJbqVG/IehH9ExDU2sgG7fPqkLd364ZRveAp75bEcl6mIePhV8+/9seF/i3rhWJJCHBZvhxZRHmnAAKU+RaMsyV72/xYJUgUVzzxsOBntRzkzROJ+EyjS51T7GUsYL57E1Ji3HxhF2+oSBTE/2iv2i/lAvTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7yRcI0aIWYxt1AKxTAA9r4DRnyuryJWpmKCVNT81VQM=;
 b=SMUM3MgRZArdknlmhVpcXAwjOmxEUK+x6go6fADpwnOV07YkqUITb2OpTbSymXDZoNNmwmzmzXZKjP/m7uI/prAn/HDp5zy3w3mTN4GFLi9u0ES42jcIJHbtrMEtfiVbxMu1zehgP4U+9+cCxZzjQ2HaKZKrZVA4VVNow0y9+2bhqz3OaDuxf8IyHkes9nZMtVGZD81Z75DI8NEMqb1G9FMmIAkDuIKBlrQRkPcWh24pRWZejKwbpGf2Nt10rQzxVRJOTmE0A0Zq8bABrCOmRkhsHrm4D0YFY5/6X5V5hBWASjMKIDyvcmJDypNG60Tpc76zK1ZBhJIU4iiAo30BQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=amd.com smtp.mailfrom=opensource.cirrus.com;
 dmarc=fail (p=reject sp=reject pct=100) action=oreject
 header.from=opensource.cirrus.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7yRcI0aIWYxt1AKxTAA9r4DRnyuryJWpmKCVNT81VQM=;
 b=SxrUeQV7xusDyKuKAbgTSmQuvYQvKMXevBw91hMp8YH2sKWgoLRr9Nyz5yQby/7skTczndotyQK3kQCvY1PAGjoYWNCHIftJndyVw4DwwF3AninLaolg4QKfcawu6VivsZvoB70oMmhKlFngCHe+kWKlG4TOcMiqEIW1PQcirNw=
Received: from DM6PR06CA0097.namprd06.prod.outlook.com (2603:10b6:5:336::30)
 by IA1PR19MB6417.namprd19.prod.outlook.com (2603:10b6:208:3e7::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Tue, 27 Jan
 2026 17:35:14 +0000
Received: from DS1PEPF0001709C.namprd05.prod.outlook.com
 (2603:10b6:5:336:cafe::d) by DM6PR06CA0097.outlook.office365.com
 (2603:10b6:5:336::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.16 via Frontend Transport; Tue,
 27 Jan 2026 17:35:17 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DS1PEPF0001709C.mail.protection.outlook.com (10.167.18.106) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.3
 via Frontend Transport; Tue, 27 Jan 2026 17:35:14 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id DCF63406541;
	Tue, 27 Jan 2026 17:35:12 +0000 (UTC)
Received: from lonswws01.ad.cirrus.com (lonswws01.ad.cirrus.com [198.90.188.26])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id A7D95820249;
	Tue, 27 Jan 2026 17:35:12 +0000 (UTC)
From: Simon Trimmer <simont@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com, Vijendar.Mukunda@amd.com,
        syed.sabakareem@amd.com, Simon Trimmer <simont@opensource.cirrus.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>
Subject: [PATCH 4/4] ASoC: amd: acp: Add ACP7.0 match entries for Cirrus Logic parts
Date: Tue, 27 Jan 2026 17:34:49 +0000
Message-ID: <6cac5670fd5bc14201d925584251d75e59307431.1769534442.git.simont@opensource.cirrus.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1769534442.git.simont@opensource.cirrus.com>
References: <cover.1769534442.git.simont@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001709C:EE_|IA1PR19MB6417:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 4930d0b0-6fbb-411e-af9c-08de5dca6dfe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|61400799027|36860700013|82310400026|54012099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?t5mQ59DRuMlxB12ej29jgXpjjTnu3P9Qfsm6XbV64Xj3x0IQ0NpzQcm53gx2?=
 =?us-ascii?Q?q/APoVGU7JZoDvUFGKVIO0UivqkhLAKb7ALMx/6G+9nU0LI2QWneXK8+u/OH?=
 =?us-ascii?Q?gnEvkxdmvG+WfNfUxm0U7ElL0/bVasXXLGMkxLOU4wzkGLzINLhrCANZkzQM?=
 =?us-ascii?Q?qBPorIQuzrfNGTDLBp1/ce38tJc30HIS7n4iYsGD4TYjuORsMxuLFh0VXNPW?=
 =?us-ascii?Q?f+N8IbA3QZM8GRNKR9UZ99r4Km16y2Efq/VO3DgZasVPq7hcLE32sTkbfB8K?=
 =?us-ascii?Q?h/IO9K3u26gQUWiJ53fNxeGcQh4Ya8N47AV6GkkQcvsWbLGdyvuYGRr5N31e?=
 =?us-ascii?Q?3LRAR6sbPglXEOa5GOwfoJ+bK+hMoi9kbnCNMx8ZH7GozosnOTR7bK0dV/zy?=
 =?us-ascii?Q?iusLXxAiFu9w74OPJUIo2Yd8yjQyA/lD3lH1/HKZuGrVDdDeHpTXhwZ7/BNR?=
 =?us-ascii?Q?yLNVi600dmrzu1BzzGnXh9BO4sGcD7SyniEML1Hzg6ivjAyN40giVE0Lnnj0?=
 =?us-ascii?Q?HQjYAoIL0T2WbhiWQzUdM5VaTd8UsbOxBV50xIhLrJEy9nXIs4JXEQZWthM6?=
 =?us-ascii?Q?iMmWwTFOL5iiwtPSLEmkI4VHBJXL5doLeEIdOtgacYIYQnLSO9KMp2FexQW/?=
 =?us-ascii?Q?BVmRSP6UJHGx+iXO9Sa+LO68aHuaPqqzAFrEH8KToN1UPyEK/MVIPSCr4SYE?=
 =?us-ascii?Q?zJKF9JTwrRQnN28tpw+aD85Bq9/npP0b4fMYr6Pf4+S+9VOGykRhO4M4EjOA?=
 =?us-ascii?Q?e2T9i0MGnnGiDzsJwREUGmuzFB+j0C/M4ztQ9VeFth5uOnSRcFYI6wUqbYtb?=
 =?us-ascii?Q?l4HhWkQVSBWkxKzWqNKFQNFfN1sKKKhdfnhtvcsP629PJ9mPc/DYQBz2qzi9?=
 =?us-ascii?Q?qDyYRHj6QOyEc30DTY6UVx9Ld6zkzAuSzMYcoW14yg8J9G8u9W6u9yhHOvJB?=
 =?us-ascii?Q?LNaq0wVd7VDtiM8HWzxanzzSDLmhD7g6t8kJyODFiQqa8T9g5PB8rqihpOvd?=
 =?us-ascii?Q?rJ5AIoMZvGoB00ZZSLan3pFGZw5N8aOOo3RH/uedqkeygTuM2KfUFqFMFW2k?=
 =?us-ascii?Q?m2sFMiaD9VJalunqyOw5/8W/dzXA8vfLL2wza6mmZtVQPI71rtT8RzYFAZWB?=
 =?us-ascii?Q?WSc9OWgdRRo/sI6uOqfrX7nMtXo+a4QbMoEA92Mnvh10GK+xw3XNqakA70qk?=
 =?us-ascii?Q?PG8mOnKrnu1+M28kvO8YS8Au74UFoqxaY328dcqZrFSISKdGmCsDSVw+ML4E?=
 =?us-ascii?Q?VAIol+Rm9ttftgs/eNPwq8Ob8WBczPKFtAos3T63SW6RB3pxSLXbKi5qyrUQ?=
 =?us-ascii?Q?BWKeNmPIZmGpZ5TjbUHrZiS/fclHmx1WKlNbV0nJUHbK4w5Ke8oWYDCO18N9?=
 =?us-ascii?Q?Y8f4g9cjH163btqMhNLOInlMyKNiukgUDCTfGkhdcpnJDiihXFbGG8ud+Ian?=
 =?us-ascii?Q?y6D8/q4KEBIFiirV+GnKPAeChJbLpE68wVCr4CPiFcLYWP+x5F8X+WFXcX2h?=
 =?us-ascii?Q?NE8wTyb439z6Jh1Q+IIteybiY473LSRgRfrNg/0+r5eQxjJwxyjyCGU650tu?=
 =?us-ascii?Q?BcZHwCQpn/dUmU8lTCyH5mgC6JsX/dzgUnfYU7vcI35xhWtAhdzaeaUbYG7M?=
 =?us-ascii?Q?JwV8ZitWDFvN07xsekcItdFfmW+JH55KB5VK5aJzTcgcgzFSUdBv+fxIqDYW?=
 =?us-ascii?Q?0TdU/A=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(61400799027)(36860700013)(82310400026)(54012099003);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 17:35:14.0640
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4930d0b0-6fbb-411e-af9c-08de5dca6dfe
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DS1PEPF0001709C.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR19MB6417
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDE0MyBTYWx0ZWRfX3/zqX1DSdt4S
 pq8EhiQP4UQV696Mai3+WU/dI+YW9epQBaE3MHU/vWhmFSXLH+XuEYPzR1kjxBoNZYpYkWuhrPd
 /uzRaNQndg1C9ELHhFEgIAQu6J439Am7QLal8ht+QmUx9SGMklhHNbuwYWBPV+yUv3snBDemA71
 sPoebQRFkB99/TFE6Ui/YKOTRKi0I3EToNdoqbm7v0A5d5M9YBdsD09NkCkG1n0lI/H5PyZPgeb
 bolnfk6GRgsX1D5CXFmfaPbLmv+RNRekjoCz7ntk+Lqm79dX9JlPoIXeYmuTxaaSNbf4OLMyGMo
 FxLrfCzSjZemHWBB2o589ZNrBwS7hXjdZKjwikSPxfHgNG5sQkq4XAcbmkA6G50r3VS8bJ7ZzvP
 B4bIv/euNthVdxxn56CBcrwyvfsE50MRgrQA3ys4qHDXxJCZSQ08wfuo1FsW6Y6be13H5cquPkN
 jggsCM89UOXTSfJkwTA==
X-Proofpoint-GUID: NMg5all5eX1kkYXHeVny7xXSH9ooKHr2
X-Authority-Analysis: v=2.4 cv=KvBAGGWN c=1 sm=1 tr=0 ts=6978f758 cx=c_pps
 a=1WsizuO/r3fBCnyzjpuYlw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=w1d2syhTAAAA:8 a=PbTEBv9fd1OlC3OAmMIA:9
X-Proofpoint-ORIG-GUID: NMg5all5eX1kkYXHeVny7xXSH9ooKHr2
X-Proofpoint-Spam-Reason: safe

This adds some match entries for a few system configurations:

cs42l45 link 1 UID 0
cs35l63 link 0 UID 0
cs35l63 link 0 UID 2
cs35l63 link 0 UID 4
cs35l63 link 0 UID 6

cs42l45 link 0 UID 0
cs35l63 link 1 UID 0
cs35l63 link 1 UID 1

cs42l45 link 0 UID 0
cs35l63 link 1 UID 1
cs35l63 link 1 UID 3

cs42l45 link 1 UID 0
cs35l63 link 0 UID 0
cs35l63 link 0 UID 1

cs35l63 link 0 UID 0
cs35l63 link 0 UID 2
cs35l63 link 0 UID 4
cs35l63 link 0 UID 6

cs42l43 link 0 UID 1

cs42l43b link 0 UID 1

cs42l45 link 0 UID 0

cs42l45 link 1 UID 0

Signed-off-by: Simon Trimmer <simont@opensource.cirrus.com>
Reviewed-by: Maciej Strozek <mstrozek@opensource.cirrus.com>
---
 sound/soc/amd/acp/amd-acp70-acpi-match.c | 256 +++++++++++++++++++++++
 1 file changed, 256 insertions(+)

diff --git a/sound/soc/amd/acp/amd-acp70-acpi-match.c b/sound/soc/amd/acp/amd-acp70-acpi-match.c
index de8f5a2a8e9d..dd2b010efdaa 100644
--- a/sound/soc/amd/acp/amd-acp70-acpi-match.c
+++ b/sound/soc/amd/acp/amd-acp70-acpi-match.c
@@ -214,6 +214,78 @@ static const struct snd_soc_acpi_adr_device cs35l56x4_l1u3210_adr[] = {
 	},
 };
 
+static const struct snd_soc_acpi_adr_device cs35l63x2_l0u01_adr[] = {
+	{
+		.adr = 0x00003001FA356301ull,
+		.num_endpoints = 1,
+		.endpoints = &spk_l_endpoint,
+		.name_prefix = "AMP1"
+	},
+	{
+		.adr = 0x00003101FA356301ull,
+		.num_endpoints = 1,
+		.endpoints = &spk_r_endpoint,
+		.name_prefix = "AMP2"
+	},
+};
+
+static const struct snd_soc_acpi_adr_device cs35l63x2_l1u01_adr[] = {
+	{
+		.adr = 0x00013001FA356301ull,
+		.num_endpoints = 1,
+		.endpoints = &spk_l_endpoint,
+		.name_prefix = "AMP1"
+	},
+	{
+		.adr = 0x00013101FA356301ull,
+		.num_endpoints = 1,
+		.endpoints = &spk_r_endpoint,
+		.name_prefix = "AMP2"
+	},
+};
+
+static const struct snd_soc_acpi_adr_device cs35l63x2_l1u13_adr[] = {
+	{
+		.adr = 0x00013101FA356301ull,
+		.num_endpoints = 1,
+		.endpoints = &spk_l_endpoint,
+		.name_prefix = "AMP1"
+	},
+	{
+		.adr = 0x00013301FA356301ull,
+		.num_endpoints = 1,
+		.endpoints = &spk_r_endpoint,
+		.name_prefix = "AMP2"
+	},
+};
+
+static const struct snd_soc_acpi_adr_device cs35l63x4_l0u0246_adr[] = {
+	{
+		.adr = 0x00003001FA356301ull,
+		.num_endpoints = 1,
+		.endpoints = &spk_l_endpoint,
+		.name_prefix = "AMP1"
+	},
+	{
+		.adr = 0x00003201FA356301ull,
+		.num_endpoints = 1,
+		.endpoints = &spk_r_endpoint,
+		.name_prefix = "AMP2"
+	},
+	{
+		.adr = 0x00003401FA356301ull,
+		.num_endpoints = 1,
+		.endpoints = &spk_2_endpoint,
+		.name_prefix = "AMP3"
+	},
+	{
+		.adr = 0x00003601FA356301ull,
+		.num_endpoints = 1,
+		.endpoints = &spk_3_endpoint,
+		.name_prefix = "AMP4"
+	},
+};
+
 static const struct snd_soc_acpi_adr_device cs42l43_l0u0_adr[] = {
 	{
 		.adr = 0x00003001FA424301ull,
@@ -223,6 +295,24 @@ static const struct snd_soc_acpi_adr_device cs42l43_l0u0_adr[] = {
 	}
 };
 
+static const struct snd_soc_acpi_adr_device cs42l43_l0u1_adr[] = {
+	{
+		.adr = 0x00003101FA424301ull,
+		.num_endpoints = ARRAY_SIZE(cs42l43_endpoints),
+		.endpoints = cs42l43_endpoints,
+		.name_prefix = "cs42l43"
+	}
+};
+
+static const struct snd_soc_acpi_adr_device cs42l43b_l0u1_adr[] = {
+	{
+		.adr = 0x00003101FA2A3B01ull,
+		.num_endpoints = ARRAY_SIZE(cs42l43_endpoints),
+		.endpoints = cs42l43_endpoints,
+		.name_prefix = "cs42l43"
+	}
+};
+
 static const struct snd_soc_acpi_adr_device cs42l43_l1u0_cs35l56x4_l1u0123_adr[] = {
 	{
 		.adr = 0x00013001FA424301ull,
@@ -256,6 +346,26 @@ static const struct snd_soc_acpi_adr_device cs42l43_l1u0_cs35l56x4_l1u0123_adr[]
 	},
 };
 
+static const struct snd_soc_acpi_adr_device cs42l45_l0u0_adr[] = {
+	{
+		.adr = 0x00003001FA424501ull,
+		/* Re-use endpoints, but cs42l45 has no speaker */
+		.num_endpoints = ARRAY_SIZE(cs42l43_endpoints) - 1,
+		.endpoints = cs42l43_endpoints,
+		.name_prefix = "cs42l45"
+	}
+};
+
+static const struct snd_soc_acpi_adr_device cs42l45_l1u0_adr[] = {
+	{
+		.adr = 0x00013001FA424501ull,
+		/* Re-use endpoints, but cs42l45 has no speaker */
+		.num_endpoints = ARRAY_SIZE(cs42l43_endpoints) - 1,
+		.endpoints = cs42l43_endpoints,
+		.name_prefix = "cs42l45"
+	}
+};
+
 static const struct snd_soc_acpi_link_adr acp70_cs35l56x4_l1u3210[] = {
 	{
 		.mask = BIT(1),
@@ -265,6 +375,33 @@ static const struct snd_soc_acpi_link_adr acp70_cs35l56x4_l1u3210[] = {
 	{}
 };
 
+static const struct snd_soc_acpi_link_adr acp70_cs35l63x4_l0u0246[] = {
+	{
+		.mask = BIT(0),
+		.num_adr = ARRAY_SIZE(cs35l63x4_l0u0246_adr),
+		.adr_d = cs35l63x4_l0u0246_adr,
+	},
+	{}
+};
+
+static const struct snd_soc_acpi_link_adr acp70_cs42l43_l0u1[] = {
+	{
+		.mask = BIT(0),
+		.num_adr = ARRAY_SIZE(cs42l43_l0u1_adr),
+		.adr_d = cs42l43_l0u1_adr,
+	},
+	{}
+};
+
+static const struct snd_soc_acpi_link_adr acp70_cs42l43b_l0u1[] = {
+	{
+		.mask = BIT(0),
+		.num_adr = ARRAY_SIZE(cs42l43b_l0u1_adr),
+		.adr_d = cs42l43b_l0u1_adr,
+	},
+	{}
+};
+
 static const struct snd_soc_acpi_link_adr acp70_cs42l43_l0u0_cs35l56x4_l1u3210[] = {
 	{
 		.mask = BIT(0),
@@ -288,6 +425,80 @@ static const struct snd_soc_acpi_link_adr acp70_cs42l43_l1u0_cs35l56x4_l1u0123[]
 	{}
 };
 
+static const struct snd_soc_acpi_link_adr acp70_cs42l45_l0u0[] = {
+	{
+		.mask = BIT(0),
+		.num_adr = ARRAY_SIZE(cs42l45_l0u0_adr),
+		.adr_d = cs42l45_l0u0_adr,
+	},
+	{}
+};
+
+static const struct snd_soc_acpi_link_adr acp70_cs42l45_l0u0_cs35l63x2_l1u01[] = {
+	{
+		.mask = BIT(0),
+		.num_adr = ARRAY_SIZE(cs42l45_l0u0_adr),
+		.adr_d = cs42l45_l0u0_adr,
+	},
+	{
+		.mask = BIT(1),
+		.num_adr = ARRAY_SIZE(cs35l63x2_l1u01_adr),
+		.adr_d = cs35l63x2_l1u01_adr,
+	},
+	{}
+};
+
+static const struct snd_soc_acpi_link_adr acp70_cs42l45_l0u0_cs35l63x2_l1u13[] = {
+	{
+		.mask = BIT(0),
+		.num_adr = ARRAY_SIZE(cs42l45_l0u0_adr),
+		.adr_d = cs42l45_l0u0_adr,
+	},
+	{
+		.mask = BIT(1),
+		.num_adr = ARRAY_SIZE(cs35l63x2_l1u13_adr),
+		.adr_d = cs35l63x2_l1u13_adr,
+	},
+	{}
+};
+
+static const struct snd_soc_acpi_link_adr acp70_cs42l45_l1u0[] = {
+	{
+		.mask = BIT(1),
+		.num_adr = ARRAY_SIZE(cs42l45_l1u0_adr),
+		.adr_d = cs42l45_l1u0_adr,
+	},
+	{}
+};
+
+static const struct snd_soc_acpi_link_adr acp70_cs42l45_l1u0_cs35l63x2_l0u01[] = {
+	{
+		.mask = BIT(1),
+		.num_adr = ARRAY_SIZE(cs42l45_l1u0_adr),
+		.adr_d = cs42l45_l1u0_adr,
+	},
+	{
+		.mask = BIT(0),
+		.num_adr = ARRAY_SIZE(cs35l63x2_l0u01_adr),
+		.adr_d = cs35l63x2_l0u01_adr,
+	},
+	{}
+};
+
+static const struct snd_soc_acpi_link_adr acp70_cs42l45_l1u0_cs35l63x4_l0u0246[] = {
+	{
+		.mask = BIT(1),
+		.num_adr = ARRAY_SIZE(cs42l45_l1u0_adr),
+		.adr_d = cs42l45_l1u0_adr,
+	},
+	{
+		.mask = BIT(0),
+		.num_adr = ARRAY_SIZE(cs35l63x4_l0u0246_adr),
+		.adr_d = cs35l63x4_l0u0246_adr,
+	},
+	{}
+};
+
 static const struct snd_soc_acpi_link_adr acp70_alc712_vb_l1[] = {
 	{
 		.mask = BIT(1),
@@ -336,6 +547,26 @@ struct snd_soc_acpi_mach snd_soc_acpi_amd_acp70_sdw_machines[] = {
 		.links = acp70_cs42l43_l0u0_cs35l56x4_l1u3210,
 		.drv_name = "amd_sdw",
 	},
+	{
+		.link_mask = BIT(0) | BIT(1),
+		.links = acp70_cs42l45_l1u0_cs35l63x4_l0u0246,
+		.drv_name = "amd_sdw",
+	},
+	{
+		.link_mask = BIT(0) | BIT(1),
+		.links = acp70_cs42l45_l0u0_cs35l63x2_l1u01,
+		.drv_name = "amd_sdw",
+	},
+	{
+		.link_mask = BIT(0) | BIT(1),
+		.links = acp70_cs42l45_l0u0_cs35l63x2_l1u13,
+		.drv_name = "amd_sdw",
+	},
+	{
+		.link_mask = BIT(0) | BIT(1),
+		.links = acp70_cs42l45_l1u0_cs35l63x2_l0u01,
+		.drv_name = "amd_sdw",
+	},
 	{
 		.link_mask = BIT(1),
 		.links = acp70_cs42l43_l1u0_cs35l56x4_l1u0123,
@@ -346,11 +577,36 @@ struct snd_soc_acpi_mach snd_soc_acpi_amd_acp70_sdw_machines[] = {
 		.links = acp70_cs35l56x4_l1u3210,
 		.drv_name = "amd_sdw",
 	},
+	{
+		.link_mask = BIT(0),
+		.links = acp70_cs35l63x4_l0u0246,
+		.drv_name = "amd_sdw",
+	},
 	{
 		.link_mask = BIT(0),
 		.links = acp70_rt722_only,
 		.drv_name = "amd_sdw",
 	},
+	{
+		.link_mask = BIT(0),
+		.links = acp70_cs42l43_l0u1,
+		.drv_name = "amd_sdw",
+	},
+	{
+		.link_mask = BIT(0),
+		.links = acp70_cs42l43b_l0u1,
+		.drv_name = "amd_sdw",
+	},
+	{
+		.link_mask = BIT(0),
+		.links = acp70_cs42l45_l0u0,
+		.drv_name = "amd_sdw",
+	},
+	{
+		.link_mask = BIT(1),
+		.links = acp70_cs42l45_l1u0,
+		.drv_name = "amd_sdw",
+	},
 	{
 		.link_mask = BIT(1),
 		.links = acp70_alc712_vb_l1,
-- 
2.43.0

