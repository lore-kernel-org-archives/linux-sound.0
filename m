Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 267B4290D8F
	for <linux-sound@vger.kernel.org>; Tue, 24 Jun 2025 12:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750768156; cv=fail; b=TYde9/W9+q1IFp4+7fOsr86boiFWV/Zi7SLM5BV81jueTjmwMvuZhhmKsERfqC3VGL6oIW06UuspuhVuSCw3relZe9XHKHQSqZ0pGEVBrpKKgC5N/7zifqyv8EhqSgXWj4jkppyqahx2MZCBmDhpJZ4niD09ErbwA+C+2Ve8UHA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750768156; c=relaxed/simple;
	bh=dTKO456itCzEBj8RDFXDnz5Jl9HrBYgNuQCO01aMHJs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EIc9p30GqJn92nAydso7jP90Ya+MhcjSW2hrC91grpvBKi0nUnM23AhBYNiiFkIpaaytulHwqCja7Oys2EqkxQ6yY++GPNuEnrDdxYOqXscqD1kS1uVQJPcqsqpt4beVW9SJBYjyq8M/YtonhudaaV+OpRqz9te3IJBlQjBZy5w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=iswcRTCc; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=yZC5V5Ag; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="iswcRTCc";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="yZC5V5Ag"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55O7O1mL001319;
	Tue, 24 Jun 2025 07:28:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=SkXjvRTCBsUUm/xneLHcZuti9TDRelUZ9OCryzifmOc=; b=
	iswcRTCcK2t5kCeN9bZQY+rkGDOdhC+WaQcxK/8BPh31oewU6YIjIpcCnrMG/YHO
	dx9dYLZmt4en0+xnmqET9fxtEjsGhTBzp7PBzbS707bfsOORckfsmD3SDfQ3LpM+
	rNWmeWoY2n9s2AdRFYZ4WRNQ1tJKUZa8PjySDjotOLKQY4hfbzo+9zT1Qh2fsL+B
	6zkXmDfkxrSXz+u8h52F6g1XIMw3OEzlZUOvjNuAVxITlbF+AePPGMFkS6lSQ8az
	yoo30iPLN3m5CqpyDP4NWEnNL+pj0An/G4x6+qRpU4zBnyBB+eBPfHvC2IgB+oB2
	3m3pza9NHYnxR4E1fVCOuQ==
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12on2118.outbound.protection.outlook.com [40.107.244.118])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 47enk9jppf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Jun 2025 07:28:56 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nt/kMBEcm7y2gWZPQS9nZPUCYl/cMd1qmTv+G4ZLhG+qkoTn8Il3IOiNxr41qjk/hb5gbNSBJ/74n+JIViSJB1IJyjALYW6xAhl9mrJV182XasS/525u47EP9fb8dve2IHsVkUXJtshiZtj9NHkcZa4bxUH+UX0oB20EJVX9KhIiV2Yns03dQfwH2CDJVFhMfKdnQU8DyiUpRXDBdUhQytfjKhxlyqsVAMrCtcC09+SKM1iEHoU41wxrOGrBqPSrTo8qrcoOIwtJ+aFDtRIKsQsG9dDR8bIOMz37G2WyiDe1ErJtrbdM5dKAY8Dy7S0lmLzVJnYevLinUroZwj/kew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SkXjvRTCBsUUm/xneLHcZuti9TDRelUZ9OCryzifmOc=;
 b=nK2cDcAc5oXSVscTVq9DG0xpFl75xxogXfU4GdEjJDKExmYoy5ti7ZLBYnsnQWwxTfAQ2gH8eq+d8JtqCQFSY9QFMxgexsToMLCEXPXUc3ExUJJbkE4bYaBJ/TX29H8auNE8cNRLmtnnGxpUMVneVOG9IFjxjdRZ5Arw6XskdLGuy2iTzxP3n85ar7JRAKsepWENldBBcYCC7L9I8XHBaSmDYcjK+/x/yP6dygFvH284lXejQYOZp6O3ze1YPBqwitITzYuVDKSEDTALPLiz5VLiic5VJTAfH3p66gmN2uCZbFwdo7AeoUnZdWK8/StVSID1V23cryahuGQDiD+UTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SkXjvRTCBsUUm/xneLHcZuti9TDRelUZ9OCryzifmOc=;
 b=yZC5V5AgKu9ARi1QbUP6Jm/a6trXvt65a2UZzstHExB73ecaTeLjDkPYSEkvYOtdhtihNkQQPqWRkkR1lGZzaF91Bu/F29Uy7i4R41XTKMTLfvD7pnGZspSG7T+iObkDt5uoWQ9Cr1OLVG8ZD07gzdCN4LuVIk3WvHjd8u65I9w=
Received: from BYAPR05CA0009.namprd05.prod.outlook.com (2603:10b6:a03:c0::22)
 by SA0PR19MB4460.namprd19.prod.outlook.com (2603:10b6:806:c0::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.13; Tue, 24 Jun
 2025 12:28:51 +0000
Received: from MWH0EPF000A6734.namprd04.prod.outlook.com
 (2603:10b6:a03:c0:cafe::ed) by BYAPR05CA0009.outlook.office365.com
 (2603:10b6:a03:c0::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.17 via Frontend Transport; Tue,
 24 Jun 2025 12:28:50 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 MWH0EPF000A6734.mail.protection.outlook.com (10.167.249.26) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.14
 via Frontend Transport; Tue, 24 Jun 2025 12:28:50 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 9AC3F40654F;
	Tue, 24 Jun 2025 12:28:48 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 7C1AA820259;
	Tue, 24 Jun 2025 12:28:48 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        patches@opensource.cirrus.com, linux-sound@vger.kernel.org
Subject: [PATCH v3 2/7] ASoC: SDCA: Add missing default in switch in entity_pde_event()
Date: Tue, 24 Jun 2025 13:28:39 +0100
Message-Id: <20250624122844.2761627-3-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250624122844.2761627-1-ckeepax@opensource.cirrus.com>
References: <20250624122844.2761627-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6734:EE_|SA0PR19MB4460:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 4984c2b8-102c-4389-54c8-08ddb31aacb4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7I8ojjIY4xb1B0kHH3Dd07Hqf5nEuBcoX2cRlt6undXqsoXZ+gjQhp4uZhRq?=
 =?us-ascii?Q?DwuVFWlZQPZNn3wx6tWI8FwVlGvDY80Hi5Ksz/i/2wSUOofuLdd5IjsxIpSI?=
 =?us-ascii?Q?EUFWmE0PwXKHSNKFvlThSPwd1duYiq63vII5V9Vg3QCBunUU2Vw2F9oudKVd?=
 =?us-ascii?Q?1NXHLaFRzmDpQd5AH6tpD9J4XkclwMkSOXyANvCsi/PoS1cAjvnewgfVAST3?=
 =?us-ascii?Q?yCT2dGfZbjMbH/iQ2YjdRHrsvsQKoQCVWT91IwqllOi9eH+Yw2/mEFU8pnIK?=
 =?us-ascii?Q?6ZSwF+VMTs+fmvPoByLrPXkxl4GKSM03MrrJK9hCyuODszx/64C7t4wQYkYa?=
 =?us-ascii?Q?k4g97YDJMmka/0xB8RBQ6ZKnMVtw5aMGr1l1+ZgfMtciOtIAb3NP9freGHH4?=
 =?us-ascii?Q?W6NCxFGktPV81mXoxrrtqBUrmSFjyLVxp4gG0x7v7XajZd1k8xjAx6H23oC0?=
 =?us-ascii?Q?gnDGow+H4u1toQNnLNyaDENNyIEAdtx4NUzaFI+WFKz1vC2V90WcNWXkL0fV?=
 =?us-ascii?Q?yGc9/vlOiRE/E7RREvnU/59cNnBGkmDNoWddvtCtVTIMcZqYYI+o/JJcRlUD?=
 =?us-ascii?Q?HPWk/Swe9ziGqPdcShT8wE97iVVS3oGlBCsnk2d35lNBnsdVlhe8d3tzmE0j?=
 =?us-ascii?Q?QblaX3G8s2kUuiTV0hRS9yZDQlYgILIUlgPVLsuEGb0g3pc5J6L4Mw05Ke2+?=
 =?us-ascii?Q?wjAxOv0HQbMmOC9sgdXnkft0ZF2hObu5AHs4YKf0RPttkVHLUAjPR5rnnKXz?=
 =?us-ascii?Q?6kgKnOQUwNRd9in/zEeLqw8BPUa4aqd3Z1hJpsxQfuurLMFLh6BJjs9HrXZQ?=
 =?us-ascii?Q?duMEpulJNanp2Y4HSQosaEGvglEjjD2CbQNURhEOYu3GlGAj6fPvuAu00pvl?=
 =?us-ascii?Q?7SbxdLRuXSPPnHKOKr1HOlFEn1jITqXiY1YNYrNHsyS8sFzr6XEbNROj2eJf?=
 =?us-ascii?Q?gGp2daCt7GU6WaE8CpSKaph3pg/ru/A5NX3nmkpz5B3uwzJkFQgmA6Up2f1u?=
 =?us-ascii?Q?IX7EHpAl60vQNf+tuTyoGsrPjZMclYtOp4XOPgPlFsJ7Mt53jw4SAd1Ac8uI?=
 =?us-ascii?Q?g2G2yFPuPPt9bY+kbttoHCdLcRRRWkicQU7slMFdOUvaVYKWX5tcAo66pvhF?=
 =?us-ascii?Q?Taozd1OON7SmNgdYniLlOYcjnX8fV/L+7YCLIJStc+02VhrGjeizWESP57Mm?=
 =?us-ascii?Q?BATYx0D/51y1f5pe9ejtcY80U9BqaPt/MAzEjbqazgqJUOCjKrSA0FApu8rG?=
 =?us-ascii?Q?MjASE2ejpet+rd83vPJJ/GP7ZsoC2VD0z3n1t5sbCoaGiQleMZPXyv2O6hEc?=
 =?us-ascii?Q?THPZXgFr4kJ6gnagE367wYGvyA8ql+fUg5tJMtpUHx1BOQR+g+2RgkFfyCyt?=
 =?us-ascii?Q?5rzY6SCdF0San7veoFDkW8vCnRVmOrNCb7WeX1Iaq0l3iD7HnwXU29R5N9hC?=
 =?us-ascii?Q?3B8m5hjHJezlMLAFS4qy7MHvSE28/kHSUaCPjGE4M8rgiRqvrkZyF2/JGpbC?=
 =?us-ascii?Q?HT9XcchmKDfqcE8YoFffZr/DxnTYyWybiXSf?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 12:28:50.1147
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4984c2b8-102c-4389-54c8-08ddb31aacb4
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000A6734.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR19MB4460
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDEwNSBTYWx0ZWRfX1faLZkOX3shN G46/UNW8M8W4Mn0fSNxddZ3CeYT3aHVbxu9mG+PzaK368tQM53wEwRQJY5f2mEvjh4cJwEtyZ7S nSVh6lPOI6li4aaEb0gAHtpkUqpxWgRZvRqrZS3l4uYo+HgHP6Rr5HMVu5MuqABn6U2HCymp5EH
 5HAxIPunXAnN0n+wQWjDmb8Mnzzgjb4keuVHp1ziJoAefD44lNB9lOIMA8rlb/wtXzbqBkLslYK r4P3kczAQcZqK9csa3XzoxrwsP+PhIYAB4uibk/lhQ4CD6W3nkE+7fKmnmDSHAe0xGUvB/1RGqB p0Fhzo16iEPAeov4uCP18TswnAbHuM2PsYCDY4EX1BEwe5CMz/gvVF2VizJhTWSwp3ZXySZ/wQs
 yRjfxlzUnzwRcdOf5cu4D1JOiG+F8uNaH6lBnlXs2EGNjljtv6hy9QPMIYcOMwqL8XpMx48e
X-Authority-Analysis: v=2.4 cv=da+A3WXe c=1 sm=1 tr=0 ts=685a9a08 cx=c_pps a=kYxjtQCH8jYJXwz0hAM5nw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=6IFa9wvqVegA:10
 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=KKAkSRfTAAAA:8 a=QyXUC8HyAAAA:8 a=w1d2syhTAAAA:8 a=U4EWVuXIc95UegUTx60A:9 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: WPifUf5xI7Hw_MJ-Qa-7uXc_3Yg5mz-a
X-Proofpoint-GUID: WPifUf5xI7Hw_MJ-Qa-7uXc_3Yg5mz-a
X-Proofpoint-Spam-Reason: safe

The current code should be safe as the PDE widget only registers for the
two events handled in the switch statement. However, it is causing a
smatch warning and also is a little fragile to future code changes, add
a default case to avoid the warning and make the code more robust.

Fixes: 2c8b3a8e6aa8 ("ASoC: SDCA: Create DAPM widgets and routes from DisCo")
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No change since v2.

 sound/soc/sdca/sdca_asoc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/sdca/sdca_asoc.c b/sound/soc/sdca/sdca_asoc.c
index 7bc8f6069f3d4..e96e696cb1079 100644
--- a/sound/soc/sdca/sdca_asoc.c
+++ b/sound/soc/sdca/sdca_asoc.c
@@ -397,6 +397,8 @@ static int entity_pde_event(struct snd_soc_dapm_widget *widget,
 		from = widget->off_val;
 		to = widget->on_val;
 		break;
+	default:
+		return 0;
 	}
 
 	for (i = 0; i < entity->pde.num_max_delay; i++) {
-- 
2.39.5

