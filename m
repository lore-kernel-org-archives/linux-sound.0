Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D30B327785
	for <linux-sound@vger.kernel.org>; Wed, 20 Aug 2025 16:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755707877; cv=fail; b=GdGIOWTPAUVFzNryqDh7/jzKsP3NSRnd+V7jn3AxD3LeNENMEOqXfAAx5IcHs8cKVYi3VgE+nUw6thKH78euFQ3LGhMfdw429cxqc9vLJ7MQ0g8kDDENc5Gk2L+x4RltTl06mmSNnfkXkbVUtPX9aj9EvF607GbQGyQRXPcJA2I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755707877; c=relaxed/simple;
	bh=YeaCgDP1fNlR5mBR603iqqPP+DSGT8F0otA8U6+7F44=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rOh9ApjaKCu8wZBvy5ofIvObf7AY6tvGSsUd+wUvCw0PKKEZ7460Yf0z4We7YITMWri6Km5vazG10l3zlfSyWU+HU5/kMc8p9qr+6PMN3GpZUXXyuXeeT2+1qQ2iV1NuDiVbv33ADph3f7zfV6ZO+gCXGVfz7J3/7v/hCOWjxhc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=m7rKBpw3; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=V02UEmlT; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="m7rKBpw3";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="V02UEmlT"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 57KEFCGt368906;
	Wed, 20 Aug 2025 11:37:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=TVxuEPqTfMk+/Mkyav/aUBMKYOExqBGg2z3zHpCTA40=; b=
	m7rKBpw3qt7/A0p6Zol3CdR6zGMJ12SQZi/vGPgnyHUxnxhCivrCD54RYySIiGwV
	xoZHS7OWi2xgD/VWklFuOJfd7hsr196Km5g/50rfe74azATrj+B6Tr2LMSb9y1qO
	BF7ozlDOicHgXN596tgHbNY6TMq1xX3gASPwz7xKCrh7MxDvGuhevlNRksoEGKBw
	7jOFCwelIee7asI84V6xlNxDWzVIP3jTY7PQk3EIJLsCqBHYoYEK5xtf0iXmDpEl
	2TFXHSf+NBqX2pPNKbGVK+qvmmRCfYDsr/Mo9Ef/H/ISyzXtQZ+jesu0j9cmz0Yq
	v1+qoAGkpD4Lrb2gH2cqBQ==
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02on2124.outbound.protection.outlook.com [40.107.96.124])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 48myd99j2f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Aug 2025 11:37:29 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WzkJtXqPtjvEiBkNs1NhSA5yHP/aH4qSbnsi2zzsFEeL61l747M0UUMQ46CMAKti/KvX40Tgpqr06YHVzw6K7amF04QMsTHoarZedW61XHQyhZ8MHZLwE6UtDrKd0vGagIOtGAfW/R97Vx7a6cntpVLt0vxHgmeYsNdpjJiJRGKKYDQiKGzXIx1dHOal6R7E8q0nczl7a7xR9aEjuSU2SOAPZAfwGj5RWR2xsyKM72Ox5aPPYBN6CHlHjhhlQCS0zLsSOv8jA8Wm7UuhQzo6xBeCsveiVB/FIXgrdyROq0YJYzSa2iXgSAUfLmdNKYqWJSVDIFErOFD4hFWRpUFtUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TVxuEPqTfMk+/Mkyav/aUBMKYOExqBGg2z3zHpCTA40=;
 b=hhcpWkABWdp79nx1vGbchfUio+gGmNuMVsGrx5eZRR6x+BM8prJ2xWkefCO/0VoEObCOjoNTlbFzglZtOhfBjMT+rkhFbcZdzxfpiHem6OiJMXkvPyrtQ3/RjGK2r+LwmiQSUnPa8/PYGxW8gslOxgZBXQqsYbTo8j2aHnpKo81NArpO2DnUJf//QWzsZdWNiMN272Nzgu3GaawAfSqyzyRXynVTtn0tTEb6qCy8Uy1Hsk0bwQZUwWSLOptXvBWZDTo7NxvOwWQabkUei3+aCI2BdvJ8dYQKFSWi2YFYFz4Ycn3XSuuEzWYp/0+lrsmVxBOkp9mCiI8P+YrK2y6v9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TVxuEPqTfMk+/Mkyav/aUBMKYOExqBGg2z3zHpCTA40=;
 b=V02UEmlTB77nPSmhGcz2tH7IC/JdWehPbrCu+rpFLORjpYBsC0L0g69c/I6sao/qoTiVMCOVxjUMRbEyutfAAJ5sqgS182wE5aGfPA/lv7Pur1PWSijRi9CP2xc1dC3bCGSNWFfNL9gsI80Uetf5ocskklc/SHBKJLuFkiGv/2s=
Received: from BYAPR08CA0008.namprd08.prod.outlook.com (2603:10b6:a03:100::21)
 by DS0PR19MB7928.namprd19.prod.outlook.com (2603:10b6:8:162::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Wed, 20 Aug
 2025 16:37:25 +0000
Received: from CY4PEPF0000EE30.namprd05.prod.outlook.com
 (2603:10b6:a03:100:cafe::56) by BYAPR08CA0008.outlook.office365.com
 (2603:10b6:a03:100::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.14 via Frontend Transport; Wed,
 20 Aug 2025 16:37:24 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CY4PEPF0000EE30.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.8
 via Frontend Transport; Wed, 20 Aug 2025 16:37:22 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 61795406552;
	Wed, 20 Aug 2025 16:37:21 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 4E4DF82024D;
	Wed, 20 Aug 2025 16:37:21 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 2/3] ASoC: SDCA: Fix return value in detected_mode_handler()
Date: Wed, 20 Aug 2025 17:37:16 +0100
Message-ID: <20250820163717.1095846-3-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250820163717.1095846-1-ckeepax@opensource.cirrus.com>
References: <20250820163717.1095846-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE30:EE_|DS0PR19MB7928:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 90765d99-9832-4bcd-7b6c-08dde007d6cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Q7g1X/CRLJKC6qBVMcFX5dmy9mibPjfv/y8hFrDa4GXYctnJ177b7wEEBRVL?=
 =?us-ascii?Q?K2RHZ50uFZvmNIdQ+v0r1of1iye+mSLhWfDMahcptx362RznZuTFLfQCXP/x?=
 =?us-ascii?Q?qxrZfvfUiYFhH7Do0K62wkWWPEj1lMIQvApQ7ERGNhNpLIIBGMNQWx9/v0Nc?=
 =?us-ascii?Q?/8rMtIQ9HFIltIsmLWaFC4ovTfkCNC0ren5AF4LqWrTfAi3xXNWbm+RzU8rh?=
 =?us-ascii?Q?JsvoEx/9yeHu0+H4Yyi51xtHhebj08Pp6YMm35Xfvt34EvlJjRSpEJ+WUDCg?=
 =?us-ascii?Q?sTCHmpTXBxrU4gh6NJoBYDhGoUieM/D0IDyrIq3WfeBfF5tpQ89kRF4nwFUS?=
 =?us-ascii?Q?G6vgIH/tBPcZXBIz+Gna962I3o8Bvd32VT0cCAEP472YjbJSqFqn69EGJop5?=
 =?us-ascii?Q?D49YSEdPhM+cHgekx2k7eNwk1pdWz8SaMuirz4OZb47mea6uT/xovxLDkz55?=
 =?us-ascii?Q?VriYOA6dc76xi0EtYGK8IoX8BlxNbHDcqy8R4eeYvnVfzL+yMI4DcJPPdZ0C?=
 =?us-ascii?Q?S0hjWtenjgVu76DC3Hu0Ii2m2uv/VX3Mq7r4uQqCU1d0iZo6Ye4Am99KtwEv?=
 =?us-ascii?Q?waWiVHxUZElFblTM5LFAAak7Wj8oK6EOOMLjJRuEXK+8VPp9PQeGo2odARWq?=
 =?us-ascii?Q?UeIHSvFM+dEPTs7Gob6qvRkiWTd2R6FKcbj8lF2QH8KandH6xVqfqE2W4Mbt?=
 =?us-ascii?Q?BNxF4UFzEvRnrQAk6PzHJeE5kiuEOayVWqU7hlDtiUSUkcuoOBjKC/hqLh5O?=
 =?us-ascii?Q?PXc30ZsbVxUbaKiRmqRiGl9x7pGIuUKI0ukB5Y2WFYjogAzMCmM8Jjrv3ilh?=
 =?us-ascii?Q?Oc1zEMU0wtgDnd4cbDW24/vsfwENeYWIJeI8tuW/LaY0S+xqHXrN9uesdqAL?=
 =?us-ascii?Q?xteoz6KGb/41n8wzbUJnFVeLMdpiMNSdOTLwhWKdGKeUMzxar4Q515ETvcAj?=
 =?us-ascii?Q?bJ5qwel7rMkgENDZgBC9ZLm59pzs1fTO13qJRoNHgdTZuAXcW9AFS5JVw988?=
 =?us-ascii?Q?DnCd+6aS33PfiyNBv+HbQpGODEh3ItsmtCLUjDODftYeeRCtekkFelJcMWpG?=
 =?us-ascii?Q?nwCK3/qhVtKzO3NSZi0LUpp7XHx4WNmZnrVdo3wlXy/F3g3wx246phYWv+QU?=
 =?us-ascii?Q?gbsIFbPfKHLV5WARHutzepCbVWQlXUyo9cLLmAjAbIH1b/JPwKang2ZS4JVf?=
 =?us-ascii?Q?MUJE102hNMLx+tJXUx2GmSBUpAArCXcEK4PakRax+Ch8gVm+Pgn0PqmK6i8V?=
 =?us-ascii?Q?16zkfvlLZNI7GpEduNSIQ3qrXpCv/i9aQ9ubSbdag6LhjnZoetrDj5sR9fh0?=
 =?us-ascii?Q?mw4CPHrHJ/fzW1Po5I2lGChJQWwC6V/8KlexaEKLgnwP5t65fBVCB96F9XwN?=
 =?us-ascii?Q?0b64WwKGAjb6usqx3jlnDlytDWKEwEP+J+idEbVdKUQ6mWWSQKWAaiyC9/eg?=
 =?us-ascii?Q?Nl6aFHkW02GXLwUzfxk/yMm597Am4Kbsnv6sC6NX4EYrwXL1JWKOhmdsKcCe?=
 =?us-ascii?Q?jk4g69Q4i4N8lwgLHhBI9+bTUJnoex91YpQe?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2025 16:37:22.6693
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 90765d99-9832-4bcd-7b6c-08dde007d6cd
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE30.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR19MB7928
X-Proofpoint-ORIG-GUID: 4aV7zoUkRR6ehMI-IJQ1JWJ37-NSdOYY
X-Proofpoint-GUID: 4aV7zoUkRR6ehMI-IJQ1JWJ37-NSdOYY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDE0NyBTYWx0ZWRfX9eF6v6sdOfOd
 kIKWjVFugVDbeQ5DuxbOY11m1GG/zTW/pJNE1KT/8PIFTY34K3zMbYOt7EIVjTJnDPRhmhm3S1p
 A/yCCZiDK+KzAhWSyF3pDEFA5Qbj6L9t9IdXi2OQE7UzV6PK/NK1CpEEa9DgjSJEFNDdQ+KquKz
 A/JU+bX55RA8FVM7nICsz3VjKFn5yn96VWzn4v2kYINokJztfmkeo5Ebq64Dtl5WL0qYTjhZr+L
 80MsO1ycBB9fABv5u3SA6OP+eIIOpa5W+t35wVHHppj44ZQQ44mdzUkRCSb+t+LYTLdtocGonVf
 xFF9UKCoAYyzxw3gegojRrV9hA8IZzR9wrndmuKc/Y7HZC7WlsSrBP0MckoYh1jfnojIF/cL/XN
 U250ue7MdSGi4fWc+orDmql1dXG2tQ==
X-Authority-Analysis: v=2.4 cv=WIwmnnsR c=1 sm=1 tr=0 ts=68a5f9c9 cx=c_pps
 a=dqqFBAKPSoH2E6FhFffxVw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=2OwXVqhp2XgA:10 a=s63m1ICgrNkA:10
 a=RWc_ulEos4gA:10 a=w1d2syhTAAAA:8 a=wZevihWaFSrWVPNy0cUA:9
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Spam-Reason: safe

The detected mode IRQ handler should return an irqreturn_t not a regular
error code. Correct the return value in detected_mode_handler().

Fixes: b9ab3b618241 ("ASoC: SDCA: Add some initial IRQ handlers")
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/sdca/sdca_interrupts.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sdca/sdca_interrupts.c b/sound/soc/sdca/sdca_interrupts.c
index 8018773ee426..79bf3042f57d 100644
--- a/sound/soc/sdca/sdca_interrupts.c
+++ b/sound/soc/sdca/sdca_interrupts.c
@@ -155,7 +155,7 @@ static irqreturn_t detected_mode_handler(int irq, void *data)
 							   SDCA_CTL_SELECTED_MODE_NAME);
 
 		if (!name)
-			return -ENOMEM;
+			return IRQ_NONE;
 
 		kctl = snd_soc_component_get_kcontrol(component, name);
 		if (!kctl) {
-- 
2.47.2

