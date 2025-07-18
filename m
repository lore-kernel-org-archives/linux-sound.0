Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAEF82BDC1D
	for <linux-sound@vger.kernel.org>; Fri, 18 Jul 2025 13:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752846905; cv=fail; b=GfU16LpFoxPb5zkEs23iMB695A7OU6gHF4hv+ieoMKKaXq96XtYxFrsvn/fnXgVfs3JM6fpjIfCENm99XAVlicJhVS4VYft2lc8ymcbrrQr4/nyzhVoV9SpVNknp0UKAsVIqDJS6pyEtsKUT16kr5Wx/ovXPLzyNk7mX6qj6bYw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752846905; c=relaxed/simple;
	bh=4SEgCq9Rh+sIb/y654JNUpENPGTXWht7kMhHZTvgCoA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=M0qeNOOtyrJ4xZov/DXFIXpPBM/GVy6QlK5dAdD6btqotxuxiXenwMUXpN/ugXaJpD3GvNirIW73JJ7lhlQ/RGbsr6/oQJba7UIgKsUIkquWdbTsvQ189zTUjoRmB7lQ0XRhI8c3a9fZ5IgMyzTMmzNGjQ2krqEvo8WT31ZkBSw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=MebzCNUG; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=h3l71E81; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="MebzCNUG";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="h3l71E81"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56IBSRvt002772;
	Fri, 18 Jul 2025 08:54:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=xBV2q4cNZsT62LGXwp/Q2j1jvbwgRYbKhw2WyDOJPAM=; b=
	MebzCNUGgWoYAI/1RxgAGUUCYggFQ7X1PWIr0blZg+f7E2LuR5D+gKCwt3hhwAdE
	QTKRB8hb+zDZKTjPNOexM1nmNoyF5p4IhjkzwAivQU2WdyF0MntvKW0FouddAykd
	Wd6ERN+DmTgFR5PmUEHhs9OQ4gvowkssqhBTB41ceadSzOPg7iunTniti+ktNXrA
	dHbsU3CNamo2Dc7C/46Jf+b9BIKSVu8PvDurEAsbmEXYfOvEkjznO4C/iQ7I89E4
	UHoblJl1d7JVtCJUScQYwSMR8903hJSaY66oGqvm8/75EQcuvNH1k6uojXHCTr5R
	7lY8HxPYIc6R4B5PD+RSXA==
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04on2136.outbound.protection.outlook.com [40.107.101.136])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 47xqstte70-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Jul 2025 08:54:43 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CuIgenoxCLFWymNn95GsNV4haDPoZNPHXHwESIyJbYVvRah0tMXiXCM/Vsgukgz/fiML5oo1BE4OvgcgNBzilW+gRIhUWGWL9UnkSRZpyod7+/vk0kUGBYrlNOyAWIlEyot4CHErsS4AQiOaxQOGqB/DxpCm2b13oyve3EHsrwhByeeoisN9IgEkwszgyHC07nWQgBAfOllvvJXQo1b+FvSLmHcZWG29oYmIpZVcxbQWW7z7olF6yWv8EtHCqYKMB7GJU6i6vv6KT+Gsd8NXC7n8SBU/t3SnvcME2SRBdCRl6A8pAmKjOj6OwXIY5w8ftpyUiQV9yyFuGlCUv5Ve+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xBV2q4cNZsT62LGXwp/Q2j1jvbwgRYbKhw2WyDOJPAM=;
 b=qlvoY8+8MU8oDupz573PGpsEHu3l1uZy8LzJ0q96DMsTiwgmwh9rds9G++WziuVDS36/JlT0clTR0dsKgOe03jCmukk0RYarpQQvVsVOXe9NmLHOaOUbuShQntBvCZNbozskJRAuuoNTHXXFh81Mvp+QjpjQb0eTDNg78sZuthg28sx/77ddhiWDzo+ueEUZP/FBUcDTb43hHwMT1F7VSxXLaUVrvbSyPp/9pTJj6615elwpMQr+6UP5xZH/FIhLTpnsbXXzo0eORU6ygpgp/tLTyNnmm8C2tyYik18AgEUZaTalOSyrrWb+SnFTZly7qWCJFvsMGYfQL0sD7FACUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xBV2q4cNZsT62LGXwp/Q2j1jvbwgRYbKhw2WyDOJPAM=;
 b=h3l71E815LYHEUJ4etv2EpKtgRYeVP7/FN2V+iTS7bvm8awnOFTVHlY3bXF1GuG7mbGoA/CmNHzCAbK07zN2EBdNdz1h6vaqDhj5by9XkIeOEIKOeo373mi7pn5lL2z40UL0MZVpd0TApxHWCMOQKJ7cWcU17qSfL2NJ/wGcBdo=
Received: from DM6PR07CA0132.namprd07.prod.outlook.com (2603:10b6:5:330::25)
 by MN0PR19MB6312.namprd19.prod.outlook.com (2603:10b6:208:3c0::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.15; Fri, 18 Jul
 2025 13:54:39 +0000
Received: from DS1PEPF0001709C.namprd05.prod.outlook.com
 (2603:10b6:5:330:cafe::fa) by DM6PR07CA0132.outlook.office365.com
 (2603:10b6:5:330::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.23 via Frontend Transport; Fri,
 18 Jul 2025 13:54:39 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DS1PEPF0001709C.mail.protection.outlook.com (10.167.18.106) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.21
 via Frontend Transport; Fri, 18 Jul 2025 13:54:38 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 382C6406542;
	Fri, 18 Jul 2025 13:54:37 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 253F182024D;
	Fri, 18 Jul 2025 13:54:37 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        shumingf@realtek.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 1/2] ASoC: SDCA: Fix some holes in the regmap readable/writeable helpers
Date: Fri, 18 Jul 2025 14:54:31 +0100
Message-Id: <20250718135432.1048566-2-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250718135432.1048566-1-ckeepax@opensource.cirrus.com>
References: <20250718135432.1048566-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001709C:EE_|MN0PR19MB6312:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 8f63d4f1-f80b-4381-4fb8-08ddc602a340
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|61400799027;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?jats5YtB1tjNJTkQJuzzcNR9wWckPYH0o/DjKkEQ7cSvjQ5QCRgjkIzRogrX?=
 =?us-ascii?Q?l4X0PeKMoIPE/MqqC4+yx3tve9X2R/Lyz1GthivRyFgtSbjdi0QwQgu2YqDA?=
 =?us-ascii?Q?v6lpzD9zO/UO5jw2e8zyCK+avi3RNE4/FdMSTv+xwuivirsAzFnSg3elFW9Y?=
 =?us-ascii?Q?57hyopW+NVjUpnoIUDY0P5CC5JsfUXOa7t9JOqcBlMkhVo6KlDeo39H91MpT?=
 =?us-ascii?Q?P5JW+vxbotGkVdEseBsG/lq5Y2dcgxrslJS9dwt/pyDw0TK8Zhnhac2zfBNL?=
 =?us-ascii?Q?OGZAeQCeAPKlRV/0eqYophUBSv35JfnKgLR8tEQM3q9LoVNnUz8qTxsvfHjK?=
 =?us-ascii?Q?/xQd6cCTdEZaUTVUU2Y9nnUqXrRlSiObtizNjBm4MOnpSQf68t38jhmPZGDX?=
 =?us-ascii?Q?v9yJ1ZX9MTB94ZV9Soevd5nNolkl0PB9+1LJrEdJIGEViAONtjuyDqcR5xTM?=
 =?us-ascii?Q?INRPQjvDbem8RyxrlWQPiJOzqljE1SyCHxpz0z2YFnVXRxw5i8S6DWA9AjMV?=
 =?us-ascii?Q?1jihcuEWy0DQkNKvHOrboLOf40/W2kpIuRzVBc2fC7b8xGRCrOr35MPKj5nb?=
 =?us-ascii?Q?HwHnQYdo92URruyHhe6iLPUEJhak06wv6PYDTXquumM7uP6wIs3Tztn1r0WZ?=
 =?us-ascii?Q?w1MkmW9EI8ekPPhkkOya5/wsVUmgjDyXldbyjgJIW5nsooNb1JTIwheYIcMX?=
 =?us-ascii?Q?7UB9uG8+QNJ/VNmBSoGYCC5GfWoQFrWK+crccjFFSxodpzS7ZV3EoUzZQ6aK?=
 =?us-ascii?Q?KcMftiUW9NtrRydmLMxi//S5VPb5ez9W58XkPmPps6j5/bXBxkQq13Xdl54A?=
 =?us-ascii?Q?7VaGkZyCEwBIA6BXqjz3TJyAPDNhr9xkdpUIzwVQzy7b2j3hHaG2Iw7XQAZc?=
 =?us-ascii?Q?Pmh9rzlWXAxS5qiW+KtFb0cDyi0o20rGZU/kaHV3vbhtT+tRX/NXc1cOveS9?=
 =?us-ascii?Q?1ECY/AMEQrZbSOXxq/Jy5rjSMEJfGtf1Rwzn3vSu9PwULC6x48uiSepib3qB?=
 =?us-ascii?Q?F0S9AOYgv+01DqaV/8PjCPmU5K09izRAVAo/7x0/k+wY9IA2Zsmt21nrlGhr?=
 =?us-ascii?Q?lYwW5tvsHFTENpxOTG8hZsPbhOgU0DCiVIaZ1DRYZ72BVTP4LDAqTIEQelwi?=
 =?us-ascii?Q?5KyVv4j0Mm41EBURH/X2DMpm3gslsdS7mYIAFHMXGX9jhhRVNRzH2fPG/6d7?=
 =?us-ascii?Q?fvhPiJwZyNA5G+gk+huO0WvPaA/ZLPZ7KtA7tKy1keOb89+cBMoonE0P/VGU?=
 =?us-ascii?Q?XwQqeQHq1RZOI0TkMCCS2/zBYxAOTmHNz1GCuaCW1PaellV/KMNhjqhlpRhe?=
 =?us-ascii?Q?5yt5aaTTBLli61CcqKMR+lYKETFTGv8gSzicrqre06EO5m3112obwov2jwvv?=
 =?us-ascii?Q?0LRFvl5jDU3lVbYN/a28m9HM1kL6xtw2fzFyKYWDC6rYzVOiIVFY5zTWIJAU?=
 =?us-ascii?Q?ZB3OlsN5+M/CqulAYaIWrnTfVvlDfy+C8wbuJ5+yyoruwyeC2ZM+vdmCtm/C?=
 =?us-ascii?Q?j7c8H9uWaDUtzT1Zs0QV4J91r3lj/9hdOq0m?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(61400799027);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2025 13:54:38.4807
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f63d4f1-f80b-4381-4fb8-08ddc602a340
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0001709C.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR19MB6312
X-Proofpoint-GUID: Gat_-xH8hXv8hp22AFnxBuYzm8XQVdPu
X-Proofpoint-ORIG-GUID: Gat_-xH8hXv8hp22AFnxBuYzm8XQVdPu
X-Authority-Analysis: v=2.4 cv=C5vpyRP+ c=1 sm=1 tr=0 ts=687a5223 cx=c_pps a=oYGmh6cZ/6As6e2vMHQKLA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=Wb1JkmetP80A:10
 a=RWc_ulEos4gA:10 a=w1d2syhTAAAA:8 a=bp1g5Iz1D7c7guLF1_8A:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE3MDAxNCBTYWx0ZWRfX6lxxoZsw99om 8S1Wvn4OOeSLHItT5t9DkAbjoJfmEymWPW+u3+C3aJwAF7maV0fFoQHhBgOgH86ksil5b5rW0gA qeYmuLEh8d6fqolO0N/cIeQpT0keD7UsC7cVxJ7Tp73iS3EYslCZFTw4RJKIfYcC+uO/oKa4UGm
 xF9mx1Vikv81tn9UBNJGCy5SgePt4sxIVLZ8C9jb0/dJ4fIBDVm/FyYMl1IB1ZSmW1Yn+4epsQq YQ23qTg1xx56BAbZWlfi5t9fYy2d6NRO+WBCxFxttwnxH/LEjd3fMq8rg8fz8f2BRDBbLIFIi3A tJQ10YVVFDtPkymZWGVQoJpIl+8kiquKFaIG0S7WZ7DeSFlZV15ML2nJVRiRlawihWWkyGfuIk1 gdTM6iC3
X-Proofpoint-Spam-Reason: safe

The current regmap readable/writeable helper functions always
allow the Next flag and allows any Control Number. Mask the Next
flag based on SDCA_ACCESS_MODE_DUAL which is the only Mode that
supports it. Also check that the Control Number is valid for
the given control.

Fixes: e3f7caf74b79 ("ASoC: SDCA: Add generic regmap SDCA helpers")
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/sdca/sdca_regmap.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sdca/sdca_regmap.c b/sound/soc/sdca/sdca_regmap.c
index 66e7eee7d7f49..c41c67c2204a4 100644
--- a/sound/soc/sdca/sdca_regmap.c
+++ b/sound/soc/sdca/sdca_regmap.c
@@ -72,12 +72,18 @@ bool sdca_regmap_readable(struct sdca_function_data *function, unsigned int reg)
 	if (!control)
 		return false;
 
+	if (!(BIT(SDW_SDCA_CTL_CNUM(reg)) & control->cn_list))
+		return false;
+
 	switch (control->mode) {
 	case SDCA_ACCESS_MODE_RW:
 	case SDCA_ACCESS_MODE_RO:
-	case SDCA_ACCESS_MODE_DUAL:
 	case SDCA_ACCESS_MODE_RW1S:
 	case SDCA_ACCESS_MODE_RW1C:
+		if (SDW_SDCA_NEXT_CTL(0) & reg)
+			return false;
+		fallthrough;
+	case SDCA_ACCESS_MODE_DUAL:
 		/* No access to registers marked solely for device use */
 		return control->layers & ~SDCA_ACCESS_LAYER_DEVICE;
 	default:
@@ -104,11 +110,17 @@ bool sdca_regmap_writeable(struct sdca_function_data *function, unsigned int reg
 	if (!control)
 		return false;
 
+	if (!(BIT(SDW_SDCA_CTL_CNUM(reg)) & control->cn_list))
+		return false;
+
 	switch (control->mode) {
 	case SDCA_ACCESS_MODE_RW:
-	case SDCA_ACCESS_MODE_DUAL:
 	case SDCA_ACCESS_MODE_RW1S:
 	case SDCA_ACCESS_MODE_RW1C:
+		if (SDW_SDCA_NEXT_CTL(0) & reg)
+			return false;
+		fallthrough;
+	case SDCA_ACCESS_MODE_DUAL:
 		/* No access to registers marked solely for device use */
 		return control->layers & ~SDCA_ACCESS_LAYER_DEVICE;
 	default:
-- 
2.39.5

