Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DA332D2398;
	Wed, 17 Dec 2025 16:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765989162; cv=fail; b=kotcAoGXQpWu67ygqZuvlzkT7oQ3QmyshhMAfPO/Z7Mm+BxnlFIaY9m4+GL27oP0PFfLtydYHNkoBNGRnAbgHOJO9g3GDvZc6OtwLDQwQ+k3HRR2LwoUOChZ8KVSmHu2KgXT04UVLe+OC7N8wVa/secFHSZfxc8mlpapy6MlmLQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765989162; c=relaxed/simple;
	bh=6DdTOj/45D8jZWVjsB+/ONli0/VZ76iorIaG+U+lPbA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=i5FjIrK6KuuvfExHC+SU+N5e2Wl31NxW97b7hfiuPdlTHJncYPmRBRZTyPwkF6PddaDzPnXi+xUcUmUfQ12+cjgz+2JrjQhopxv60dA2XQ2UrqATPkMzNeN1Mqh5YYZE6Zgwgis7CZkQo4tZbx0k4S6S8O7lV0vQ+jea5LKGS1k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=dlBvQimW; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=C5FZEIlV; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="dlBvQimW";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="C5FZEIlV"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BH4c5wW3097896;
	Wed, 17 Dec 2025 10:32:36 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=5bY8LxRbuEDNdfnt
	87Nr1JQ07sullSCbzngKCHZqLx4=; b=dlBvQimWwF+EtpBfECYv4Sts0LaSwoBL
	GMM80w3zmelQOwJcFwYtZ+e78/fqo7MKSWHZKnUj1yblHSBHMJ4adbhRagXDr2m6
	Nb5kT4MGJYJbc2TVtU7X/ou6G/u6xdaJ9GiJLzOSuLD3B9mKHIuDlUQXd5z9D+M6
	okRFArI9ImthhUH4ubcoWIowD3/DRZtAbo8izDJUuywV8S0JRryD41ZxuQJeiPGk
	ao2fiYaH0T3xIBGCYbmuNDfJh1vZggfS2Hazd/JeoSuE2shcIKLrKblllHzGEQM1
	GKvRc64b6lxzCLitJn0iOLAWyijGSXmDCdSB5o++CSSn/j5aDGDWiA==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11021094.outbound.protection.outlook.com [40.107.208.94])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4b15ejd3kd-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 17 Dec 2025 10:32:35 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s0Vu0Hiv+ibIsA5srBjeh5uP1sAeIPOZ433im+DtUjL96e/+w/pGQhA6xIiKHv1DDd9jXlklRTFV2LsspfcHx8EACOrj8lvVHFVI7rfRB7VDX0qDeB6pWUDOTVJ/UkcOl4tJ7r6CzHuh7zHXlnfvX5BkBDchVNwkQTNrQGXMiWxtyEwjEwFKGNfJ0+6epBbJoSHN4y/r/TzPYGIz0FXTiJttKF+8xd5W4THH23Ro0LGhuDKKQaNQcC44p+2x+ofZ3SaFY2UsXDpq3R12CzQnwLehCkpCMKhSFTKa0olWDq1Y+qiQ2CaV4a4c4XrdfE89+evrhZR3uFCNdk4mnssKzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5bY8LxRbuEDNdfnt87Nr1JQ07sullSCbzngKCHZqLx4=;
 b=P/JdwtmWzBReH2UT7PRfIjJJOYaTqRohdKDChefRiXqrLkhWDb18aQXQrRtYa+UIjgOYkf9z5DKEJ+FV5K2GVtTThkNVYZG6OYz+Bn2aicltlJKqr0hbIykR/hEhlpDHp+6zAQhK4rc2/+oHT3Aien3rjSCOk3eMhK9wFrwA4Hsl2asx8Mt6eGgeMUfKLIQG52hkJqbpgp0bvmrecuQ0b1SMLs20pGA6XbVX3pD1D1ZhIrYbnNOejjkuaVTrd4/d4P6WJrBLGrK7UMc8pa7pQTLNtBehC0elc4r7OK6C6jBuly2Ies8DTNBkhRUiuFHE8odRzBPs17B06F3VFEi28Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5bY8LxRbuEDNdfnt87Nr1JQ07sullSCbzngKCHZqLx4=;
 b=C5FZEIlViz2peISILuoz4lD0IQk/HmQ4mtlgCdbg/391cjER9QXDdDv7wL88uYrZXrIW8QV7b69DTVDieSmnC5ui9JTQIKJVBPXmhkosspLY6BAzyL1TdVkbP806Eoyy6JKCb4CKzmcUSajqXOHY6hYyH7BVGQlsGRe24iTaBlg=
Received: from MN0P222CA0023.NAMP222.PROD.OUTLOOK.COM (2603:10b6:208:531::27)
 by MW4PR19MB5656.namprd19.prod.outlook.com (2603:10b6:303:18c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Wed, 17 Dec
 2025 16:32:30 +0000
Received: from BL6PEPF0001AB56.namprd02.prod.outlook.com
 (2603:10b6:208:531:cafe::4d) by MN0P222CA0023.outlook.office365.com
 (2603:10b6:208:531::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.7 via Frontend Transport; Wed,
 17 Dec 2025 16:32:26 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BL6PEPF0001AB56.mail.protection.outlook.com (10.167.241.8) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.6
 via Frontend Transport; Wed, 17 Dec 2025 16:32:28 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 0345D406542;
	Wed, 17 Dec 2025 16:32:28 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.24])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id DF93F820247;
	Wed, 17 Dec 2025 16:32:27 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org, yung-chuan.liao@linux.intel.com
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 0/2] ASoC: Intel: mtl-match: Add 6-amp matches for CS35L56 and CS35L63
Date: Wed, 17 Dec 2025 16:32:25 +0000
Message-ID: <20251217163227.1186373-1-rf@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB56:EE_|MW4PR19MB5656:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 1fc8743b-607d-4fcf-7607-08de3d89ded6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|61400799027;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ydwdkC5tSAPjFh/bxbc+jla8AT3Lu6GdRAoxYPlgnPxuhad0NetR7DNvsCFj?=
 =?us-ascii?Q?LiU1JxhZwb5bdsvw9jSYpQFLbtlclH99ZNiGBTex90OfzExmQfqZIFRlVge3?=
 =?us-ascii?Q?7j4RviKehl74lb/kUgb25jc8HJUjX06hKE1CQPCej7HDWfC7UBwtqkFc0jwI?=
 =?us-ascii?Q?OISIlxbpNn/tZhEdKlaiooxwp1M1LDyCld9MdfTwOCmo9FAV6cX/rAhP/1su?=
 =?us-ascii?Q?1F1CVEtrOyV0SXfCCKphQ5bKAbXP9zZzcU4YIMJvC51LBRxqeqhbfyNvNq3C?=
 =?us-ascii?Q?1zYyjmhACzYOifuDQ/Lp7FJffXmqIpNCjxjM8J4gRUX3b6O+Gv2PmQ8w/Mt6?=
 =?us-ascii?Q?8PLC8gMGv+J+TpJSknelnKxeMzyOZhWIevhBbmgz0QkorhXxRz3nyH81yp3d?=
 =?us-ascii?Q?lkkIs57v9gKOJh6F9nI2AxFrlmjyOE+aelT5TIBl0YjCUTLQSo5rLOnt0JZv?=
 =?us-ascii?Q?akP8CdoT2aXSWdmEsPbPSD8rJTlawLPG1HzwSpu70kfkRHDQz8bdfdvG5sS/?=
 =?us-ascii?Q?fxPzsBFSQHRZDGg4qRxspGkuCKHcj2raoOXBNfxACTKpmN3/fnkyjHDaarRa?=
 =?us-ascii?Q?X3K2/BKE69hObmgBR9fAiYK/KKDBMvjQjrHxy1iQgUbbblNNjlZzXigf3X3N?=
 =?us-ascii?Q?/GsW5lWK+F+av5W6f/Oy90/mWIyl0dyKg8i5szJLudhTZt7Vi3aO4tq0FMuG?=
 =?us-ascii?Q?nsZXHbBHOJN9HU9gizjdLrjUbcAXLnReSTW7esb5obhAfYpRE6yT1MtSKU8z?=
 =?us-ascii?Q?bimNnTxg27lffRxET9nTqnXJUDcyox9BF9KCmlUiTNbGmlJ/QpsbZhqxcFXF?=
 =?us-ascii?Q?rgPNVe/f/zY/Vo3GJAul86ggRUVIHOkcSWdC/0F+qffqilLwukdFlMnFI+Oe?=
 =?us-ascii?Q?Mr8wqPPec5GdhgmOJyd8VJiZZs6tnBywrIi1LEg2AuQsJUsd8LBPF3lO8hVw?=
 =?us-ascii?Q?N1Ls7f0v6ugCHzyHuni7iE1t45t1eGK9RTk+GtjfjIA5OkoF1fPylCzMzYpd?=
 =?us-ascii?Q?5FeCBXRdbsnRZbxTwPAjdRliCx2oocrc2m9RaJ63Z60NUO0Nnm2GeHEz/AvD?=
 =?us-ascii?Q?5Z8xwGIiO2lS0BUKoIDioOQAy9NDQy+EbWO6rDMg+BIyoL1RHy8wPPPMo4GX?=
 =?us-ascii?Q?xTIV0PZR+RPvZ1Tol7Vufq4HAJCgO3xmFK7HRR7eN+97aIFrxwBjOqrz5SXM?=
 =?us-ascii?Q?5Rl3c71axzHwxyFaJ2hjepKg1BxDlhGQkjRuz8Jiv1KFTCj93zPWV/dX4kXZ?=
 =?us-ascii?Q?ZsZaLlXW3rbqn7tgUZCR/sHtCk1HMDSwwjYA2R6RZpxU8w8az9xQGU0eBd9Y?=
 =?us-ascii?Q?ClSp0053bfQqbxV0BCjhICj0YOsJC5UL2kz3hsl/XkRZLttFE/PkBsx3Y5pC?=
 =?us-ascii?Q?7ialYEjskUHk+1GqpkO+SwensBJtAg2NnCnjClhR96v5WjCbaJ55QSBpH/41?=
 =?us-ascii?Q?6A/xHH0g1tijz8CDM+uqjyS5HCO7gRZ5guZh4Ycfpb/WfUebsEq4+BfLoiKt?=
 =?us-ascii?Q?hS2Au/7ghRm8VYdaDkvxUWnslyQvTZGFqpcYnetixLL2j+VhbG9+ZwIDz4eg?=
 =?us-ascii?Q?cjyZoEj0RJmjPYnMZXk=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(61400799027);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2025 16:32:28.9488
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fc8743b-607d-4fcf-7607-08de3d89ded6
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BL6PEPF0001AB56.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR19MB5656
X-Authority-Analysis: v=2.4 cv=ZZUQ98VA c=1 sm=1 tr=0 ts=6942db23 cx=c_pps
 a=Dy1/g0x6RHl9kMZQX3cATQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=wP3pNCr1ah4A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=fqWIFGBSdIRwiLxeh9YA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDEzMCBTYWx0ZWRfX3eC4PTCrzs77
 EXAZjQ+JDh8v+6k7hmoxFCezmgFyE2VG0g5MDfMYhYPP5j+8kJyZdjMUHyxlYQti4DcJQ+IIi6I
 FMgJIIP1wOA9hfoEOSsiyhJGckcBJGr8dBTdqkil2pS5WV5YTPOPR3vCclLDyqP8FwNWegq0UzT
 2DiIr4W9TuaUzJDia90kj+KGI58sVk03Qu5El9+S/NRp1QvsXCIkf1oSEtM2aP7OQTONhq3Omfq
 zDCtM3pJDW/MFp97TraR6ph2xqymTeOqNy4e1+8TPsVjC4jb92hud46MmK0Qqk3PV8gTw79kCbC
 uoHngfbIc0XI6SX2Xvf9kcuxP0gPRs2z3SCyni2cjEVkXn8iATkeIx8FuMSe0yzOMuqvK1Qlyxk
 JgXstx2Be4/YDy+Bjno8X0qyJVqENA==
X-Proofpoint-ORIG-GUID: ALQUXMJu165oBNWpNagWT-UHVDHXd_J8
X-Proofpoint-GUID: ALQUXMJu165oBNWpNagWT-UHVDHXd_J8
X-Proofpoint-Spam-Reason: safe

These two commits add support for 6 amps with feedback, primarily for
the CDB35L56-EIGHT-C and CDB35L63-CB8 and similar hardware.

Stefan Binding (2):
  ASoC: Intel: soc-acpi-intel-mtl-match: Add 6 amp CS35L56 with feedback
  ASoC: Intel: soc-acpi-intel-mtl-match: Add 6 amp CS35L63 with feedback

 .../intel/common/soc-acpi-intel-mtl-match.c   | 104 ++++++++++++++++++
 1 file changed, 104 insertions(+)

-- 
2.47.3

