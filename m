Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BCB334251A;
	Wed, 17 Dec 2025 16:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765989164; cv=fail; b=cNgQpiNoJTyUpTUsjYh9GOmgn8Wnd3l0ouhg5yobKIURBrZqgwMn+q0UQUBW0ikW5MD7GHV6uA4ekHNAWiFInkyHbQgYqA3uJA751+0EuqvTO5FZ85znqmtv5OGlJPLS/Ll5rWMpZe6JRALrClu+xTD7BU9gzgEqL6HDT9mOclw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765989164; c=relaxed/simple;
	bh=f/9nL/MIU3JPMjWRyZdWYZOlwaTK+VODyS3R02RwnQo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pq3TVtlzu//SelFDbfjNuRUFEqZ8x4wdH1bXP73AV2uM589LxX16Jis33hQqHQxLTrZnSuDnpD+wE17q3KrBnirK2fvuO1c/D51Cq/BIE7HpDIZ/pHWxwjr1GXXuosI5gYAVjkVEJwxKVEY/PPJvkzQO3v24YI+jt9Z2lfHiUtM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=FmWVWvc/; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=kt8Lff67; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="FmWVWvc/";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="kt8Lff67"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BH4XhRC933664;
	Wed, 17 Dec 2025 10:32:39 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=FMNtDEFEJyyZayJT96relwmjh6eE6rHFfgRsYE6gqeM=; b=
	FmWVWvc/JcTuYfbu6Lo+tv6D99TF136+1aw9V5PcpBN8gWEbM2xUD46To1R7TKf7
	czAx2WNg7M69kLctYGpFs7w4/J+D6fWHL2jRe0U2tMWTlev/EB0WQywxtKiysvjm
	O9N3CQohGoUCP3PXmPBebNnaF5hsN2NqVEfnRVgyUemnPlcrBYKknKbfTojpC2sV
	E7BYvwoF9VdmIRYtjokonPaE207AF9+K7AET+Cy5LC0UyVqXB6Ux/NLouXPNEBKa
	o4b6eryrbns+UIeN2Ee4BvLK2F18vux5oPxUKpt13kfgYvGH+jv3piBOUt+Ji7cH
	xWlGQHshMpp6imcgleP+NQ==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11020088.outbound.protection.outlook.com [52.101.46.88])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4b16e1w06g-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 17 Dec 2025 10:32:39 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DMb88FO87QE8BZU7GcEeC/q7NZrU2CCe6zeIDpfogQwLTglFOrlZo1de9zkIqN8R41fnIwEPNi2fr+wwDMBkYT7QELMqsLqJ6k/GhXI3i51kQrlvP4MZKSyAYJeV9HMyQxk7YJXdZruQin3kiPCurzImd5Q9g/J/pv5SxzyziOB192VBkZQ5ER5g3gBGLNanN0dcr2WXNsuEiH1HTbX8vknQcw002qBDxh4Fpyhe7T/Mh8JT602+2PBMN4+MOz5QbwCXqd8axYO9SPzV8/Q/a9B0i5C7hJg2JXhPy/33xEcYSMZe52wj/FiT73sxGxF0ync3A9w0vtTEO/ZCK6rg0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FMNtDEFEJyyZayJT96relwmjh6eE6rHFfgRsYE6gqeM=;
 b=J55JAsjIgPxFkwrqyoU+qwBfvZYYr7ENQK0kv3M9lP3PCM/EoPqIsEJvFGrtzF+ODtk5+nqnpNvQQ6Pb6ECh0bN/YvmNAQQRJhf2bN/7FLoIvTz3YGZzQ4eMvUkfLx4EnYuGfpowlbX9kIF9TfzPBASxgVKKUaDZKAPGqz1PYLZIQcedSjPTKb0rRlAmYfxzhVcXozcAeiSxM0KWypBTK/Fqe6d4vJR6tWLK54Mj4P4Zzi1l/2eJ18ADcRL4/gZAklOOw8fOZpB3iXGYYaOadV3MuqOHk9dOmyBBJfyAmbzg+37uJwuVeOny6W5B1ZDHJs08ONQdUpxOOh2i6kRFjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FMNtDEFEJyyZayJT96relwmjh6eE6rHFfgRsYE6gqeM=;
 b=kt8Lff67CluqftYrlcoDVc6uL7D5muy75Ty6bK2ztUfBui5ef51l4To43l1+mlcb2O5CYs/UFjEvzd/RJSJ8Uxj/JesEHAh+wbQujp7ymps+nw8AaCcb5UuMt2DPP9YE1OmQSR6+ob/+JZ1RAKbQK8YPeqhVcHZHTWfY9XJNIus=
Received: from PH5P220CA0002.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:34a::17)
 by CO1PR19MB4888.namprd19.prod.outlook.com (2603:10b6:303:f7::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Wed, 17 Dec
 2025 16:32:32 +0000
Received: from CY4PEPF0000E9DA.namprd05.prod.outlook.com
 (2603:10b6:510:34a:cafe::51) by PH5P220CA0002.outlook.office365.com
 (2603:10b6:510:34a::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.7 via Frontend Transport; Wed,
 17 Dec 2025 16:32:36 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CY4PEPF0000E9DA.mail.protection.outlook.com (10.167.241.73) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.6
 via Frontend Transport; Wed, 17 Dec 2025 16:32:29 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 16A7E40654E;
	Wed, 17 Dec 2025 16:32:28 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.24])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 06019820247;
	Wed, 17 Dec 2025 16:32:28 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org, yung-chuan.liao@linux.intel.com
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 2/2] ASoC: Intel: soc-acpi-intel-mtl-match: Add 6 amp CS35L63 with feedback
Date: Wed, 17 Dec 2025 16:32:27 +0000
Message-ID: <20251217163227.1186373-3-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251217163227.1186373-1-rf@opensource.cirrus.com>
References: <20251217163227.1186373-1-rf@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9DA:EE_|CO1PR19MB4888:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 16bf33f8-db7f-4803-395e-08de3d89df14
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?jmdRvcTSomCCIN7+cmmn3l6ZRxiPRoucNwrPJnMB+3FL2ddaVhrlt0/B7bZQ?=
 =?us-ascii?Q?wYEavT37GSytiy9mV6+iGymsUqLBqZC2x82P1hXPZPjVN7ZPVItYdBc2BJ6E?=
 =?us-ascii?Q?CUU97mctW92TweeWhs5YaaDuRUjsluokDbSSn4RJlxna0sCl2husPCnrbWPn?=
 =?us-ascii?Q?BwkLZkdFcNqMLRY5pjLa1lB5r48X+ysL3oSXHj4vPCpAftWV+yvbULnSWwFG?=
 =?us-ascii?Q?3Ou0wlhhwiLMED6G8D9347gsNZNUdpdk/Ne4bJ7JcXFTbASas68/ok+C7/aa?=
 =?us-ascii?Q?ka8ijL71I8mAPg6DScyijzlCGJmPR8eWzo/LjFSpnY6KBSLjJ23sjdX634iW?=
 =?us-ascii?Q?ObNa9WUZjkiXWw09vNc+s5l9p8Jj+xwuv4vBl33wgxPO/l1nmb38iXClnDny?=
 =?us-ascii?Q?yabwHWdryfjKC7QIdUC+paNdikKx2ytkKvpEp2ZVQbDQvXJ5HfgYOU6+nPrc?=
 =?us-ascii?Q?4b4pBEboQ+MEUMBjnB2aunka3W2hZLGKVAD5ZndUG9FXcJvtuENoRrxBxXA6?=
 =?us-ascii?Q?smyEIaZc/ypDHZA9wgt0L06j7C8whW4Y35LlrNGDlfRnpjS4o8IpPlF3hCiY?=
 =?us-ascii?Q?Kj4a4AYPZHi7jvwOth1HIK6nbE6c/wt14rsdrHt+dpdaPgucdsAY2zlUo43j?=
 =?us-ascii?Q?tPd6IOqevEjSlSTz+/8vOGATJXJAswF9cJSk0YzwE+budX561Hk/rcspTkf8?=
 =?us-ascii?Q?/CDmDOStKdzOpJetUkZWN9YRGDJBMdGCYHtnbIbjdkTxKeW/SUirX8taSi4z?=
 =?us-ascii?Q?nYH3+91raqnGLF3RSKxqnwPka4dFnmR0GKuGUyUOjyxzTCXUZLNL5SW4C6Mw?=
 =?us-ascii?Q?/QB+R+xpk7ZO8vYg4Ad0R1Zgbg2dvRNjfPauc8KaSRwUyjwgZupStUFRYWr5?=
 =?us-ascii?Q?w2PhfyxxvsKcqSNGEzR+RnyicgISYQK6NJ3LddP9ZVZ3FWH3ykgA25ZOQMxJ?=
 =?us-ascii?Q?vSAncuAk3zV7Wdzfu/xlAIOZPjYOdg7JDShWBV0R30dRw8DgcXlDqFyt4frx?=
 =?us-ascii?Q?PlK621l+DzF0r44nLFwkrLwGob1jx/zlCcmG06pnnXbs9HsVC5eOlJgl7EQt?=
 =?us-ascii?Q?t5iRjmjkvWB9ZKgp5v7rfAc4akSqngSRRkzWbNNpKqlGx3geic5VmQCJhGrr?=
 =?us-ascii?Q?2TemiL7tcTMhRxF+VP6QxX88xPxycfTbWWyiK6mpCMvycrSxj6bj8riLynbf?=
 =?us-ascii?Q?EaRAy/psVRz0c1zBJBHxCfKS0c+v7KGkDRCXNLivLxFt4fHzrA5hFMthy17a?=
 =?us-ascii?Q?ihIUUrYGm7VV2Ac4zCCxmIo0tFlg2JPAvRxRCC5ZrIHt0RHfM8nsWq1bhGNr?=
 =?us-ascii?Q?6T3lSuHoOnnkmZpIZK/KK7h06tUFf5tr/6Az9KyOEIriPJkqou77BD6v/c23?=
 =?us-ascii?Q?dmEdncjqqLzJ8eHi6+hI99WnaLtOCGwo+pdgeMV93M/lBhRJmM1Uu0rakrWh?=
 =?us-ascii?Q?uB6eKZ2B7l7jtDW0aR5E/x+idMQr8thBDYAcf4lXYE+WucMbiCrqijiNOH2n?=
 =?us-ascii?Q?oq7CQImK5BEF5ArfBGUo2hbmMtoaE9p1AM0ip9wURQS/vG+uoxfoUCcMCGsc?=
 =?us-ascii?Q?Aj3C39u9khd2VHBd+8E=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2025 16:32:29.2731
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 16bf33f8-db7f-4803-395e-08de3d89df14
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CY4PEPF0000E9DA.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR19MB4888
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDEzMCBTYWx0ZWRfXx1OQIuRJMvBB
 tti9evUfCGg+SeOfRspsdklrAGB0n3gfq9m1062wJv1qHC6vfWz8NF5HQbBgDUhbpn7xS8hJduF
 Cq/T30PD/EcNtGsIX/NubLAMYDl5Y/7b4gvC3LvH04V4QyydaCSG13kphXK9fin2aXj2/gxj9UV
 OxsJnBFt0x+wEGn+YNnKiqwGA3vcsiR8dXIKOTnXh8z4gnKX8OeVZU58K/E+W967cmyro4zXBIV
 VJMFPKfsNkagQp8ZVl73FqlyGAa7rts9A0Pb0QgQJi7HPvc68kvCakZLjdsv5c9Q0xYaeHSLRee
 lBrtIUgzSXfH00UDDRS42xoM/WTzEXBddfkXiOsyDvvPZPTXvVmqT9BkcKXCv9jBPYklZOhJtw0
 vF60eiOVjqBpfaRuWNmc5N2QG5xDiQ==
X-Proofpoint-ORIG-GUID: xsYdjDo36rpCxuLD3w6cKYT8govhxTQ3
X-Authority-Analysis: v=2.4 cv=Qdprf8bv c=1 sm=1 tr=0 ts=6942db27 cx=c_pps
 a=XrAAyJxZ/W28UfFUt0AM7g==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=wP3pNCr1ah4A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=w1d2syhTAAAA:8 a=CS8Eogi1afw5dBgI5FMA:9
X-Proofpoint-GUID: xsYdjDo36rpCxuLD3w6cKYT8govhxTQ3
X-Proofpoint-Spam-Reason: safe

From: Stefan Binding <sbinding@opensource.cirrus.com>

Add match for 6x CS35L63, 3x on link 2 and 3x on link 3.

This is to support 6 amps on the CDB35L63-CB8 board.

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 .../intel/common/soc-acpi-intel-mtl-match.c   | 62 +++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/sound/soc/intel/common/soc-acpi-intel-mtl-match.c b/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
index f0cf956ffb82..1270ee21ee72 100644
--- a/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
@@ -720,6 +720,48 @@ static const struct snd_soc_acpi_adr_device cs35l56_6amp_1_fb_adr[] = {
 	},
 };
 
+static const struct snd_soc_acpi_adr_device cs35l63_6amp_3_fb_adr[] = {
+	{
+		.adr = 0x00033001FA356301ull,
+		.num_endpoints = ARRAY_SIZE(cs35l56_l_fb_endpoints),
+		.endpoints = cs35l56_l_fb_endpoints,
+		.name_prefix = "AMP1"
+	},
+	{
+		.adr = 0x00033201FA356301ull,
+		.num_endpoints = ARRAY_SIZE(cs35l56_2_fb_endpoints),
+		.endpoints = cs35l56_2_fb_endpoints,
+		.name_prefix = "AMP3"
+	},
+	{
+		.adr = 0x00033401FA356301ull,
+		.num_endpoints = ARRAY_SIZE(cs35l56_4_fb_endpoints),
+		.endpoints = cs35l56_4_fb_endpoints,
+		.name_prefix = "AMP5"
+	},
+};
+
+static const struct snd_soc_acpi_adr_device cs35l63_6amp_2_fb_adr[] = {
+	{
+		.adr = 0x00023101FA356301ull,
+		.num_endpoints = ARRAY_SIZE(cs35l56_r_fb_endpoints),
+		.endpoints = cs35l56_r_fb_endpoints,
+		.name_prefix = "AMP2"
+	},
+	{
+		.adr = 0x00023301FA356301ull,
+		.num_endpoints = ARRAY_SIZE(cs35l56_3_fb_endpoints),
+		.endpoints = cs35l56_3_fb_endpoints,
+		.name_prefix = "AMP4"
+	},
+	{
+		.adr = 0x00023501FA356301ull,
+		.num_endpoints = ARRAY_SIZE(cs35l56_5_fb_endpoints),
+		.endpoints = cs35l56_5_fb_endpoints,
+		.name_prefix = "AMP6"
+	},
+};
+
 static const struct snd_soc_acpi_adr_device cs35l56_2_r_adr[] = {
 	{
 		.adr = 0x00023201FA355601ull,
@@ -1105,6 +1147,20 @@ static const struct snd_soc_acpi_link_adr mtl_cs35l56_x6_link0_link1_fb[] = {
 	{}
 };
 
+static const struct snd_soc_acpi_link_adr mtl_cs35l63_x6_link2_link3_fb[] = {
+	{
+		.mask = BIT(3),
+		.num_adr = ARRAY_SIZE(cs35l63_6amp_3_fb_adr),
+		.adr_d = cs35l63_6amp_3_fb_adr,
+	},
+	{
+		.mask = BIT(2),
+		.num_adr = ARRAY_SIZE(cs35l63_6amp_2_fb_adr),
+		.adr_d = cs35l63_6amp_2_fb_adr,
+	},
+	{}
+};
+
 static const struct snd_soc_acpi_link_adr mtl_cs35l63_x2_link1_link3_fb[] = {
 	{
 		.mask = BIT(3),
@@ -1244,6 +1300,12 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_mtl_sdw_machines[] = {
 		.drv_name = "sof_sdw",
 		.sof_tplg_filename = "sof-mtl-cs35l56-l01-fb8.tplg",
 	},
+	{
+		.link_mask = BIT(2) | BIT(3),
+		.links = mtl_cs35l63_x6_link2_link3_fb,
+		.drv_name = "sof_sdw",
+		.sof_tplg_filename = "sof-mtl-cs35l56-l01-fb6.tplg",
+	},
 	{
 		.link_mask = GENMASK(3, 0),
 		.links = mtl_3_in_1_sdca,
-- 
2.47.3

