Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFB711D61AA
	for <linux-sound@vger.kernel.org>; Mon,  7 Jul 2025 12:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751892144; cv=fail; b=TiNlPfJc8S5JIc3EKJV/ZtsHxwlpNkgeOIkDRA/WX3UWecxmqA24PftDrQ4wiB/JSXDK1ocbMpxJAyOJiN82eiFqOxChuWO8V5C5wQe9NUL0gQOfx/Y72+TtMzXP6W0y5Yu6NO4+9HjytzGYP4guIwMPS1b12k0vtW3dKD729NU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751892144; c=relaxed/simple;
	bh=wyIvmR3BMBQdISx2NHkzvqr0enSCA+4+oam3WP9C12c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IcDBP+189yhAntrfpyehfyDuJxwuzVonFSUwILMljfpMnANcUkOLOwDz8Ukm8qwm55IUSoDqihupNe16UkhcY4+egRz0R7btlWNYMGLP5Wi5bgkJXmo8zd295yNPTW+Q4A7Dwk7+VklM63tA+S5rZIhE0eCUT6Iu7KsC0WQRo9s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=QOJfFHaS; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=oCX7W2t5; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="QOJfFHaS";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="oCX7W2t5"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5675NIVd006550;
	Mon, 7 Jul 2025 07:42:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=GwG3AffBwKH7uiYLMfbZkC7Bcd/2CT7aPEDqBt/pIBM=; b=
	QOJfFHaS0+XKdSvHmwWftfmxlCdnlT3Mxi0xON7XedzwWtxhSpvff40ozrIVGMM8
	vYEFgvrUE/4nQVnEQgmcsIDQVCtcrvzM8V+vC9yiEn7kkGrY5jWdSap7zHGSOxrc
	EI7P8+TeehjQFkR9KzPAKH0Rcu4CNvsMDdS0qXBInZeBq5LnFhVzoUnoBf8HRU1e
	aklK8j9olwdcc2IHRcnvOia61f0h+KiahQ0fRziPfEm/fvf7H+9Oze89GtDSc29K
	VIf2uBOEzxQPSRIr1YiLyci/GYPn4N23J5h2sRmOoV4wJaxWNrbEpz7JlnirYRW7
	8iTHQD9AML8x4BmHviPsOw==
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10on2138.outbound.protection.outlook.com [40.107.93.138])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 47q1f3j6ua-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Jul 2025 07:42:07 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kNSTC8VTXWSvtZD+eFQUjZ7LAIQfAuEc9EksHOmWuC5VdS50SSSWKBwEe+c9HBwUSTrnyWad/pfggUgKs5k3QpE0Xfz/QFc7wHAdESw9SG1fnTKi4fESOeop/+vsKo8pU+LJVWMH2KKeowrBQv8fyzMWvL5slqAtPumY/SngzW4ZPDzd5qid9paNvxO6HApbtN/jjzdTpObKkF+h7dvMhC7nI0tK+avF3R/5KbkoM01037B+b/9gsII/WReOENkQxtzGFtx2gpvappbpxh/bnprjLcDw9752VyA298M746zxD2zg2B0fZYXpTtuh7xQQdm59JVTt09gEMWi2zLkFDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GwG3AffBwKH7uiYLMfbZkC7Bcd/2CT7aPEDqBt/pIBM=;
 b=r4FE+AAbNWz7YiCAEPfhFz86aSacs2tTR+JxN7oCjQqPfg8HHlOuh66EqMVfMuK5lYIX2OBvJRVDcPelalqLp22mt6LSXrUp1zXZH4m36K5SMA1/Z76aNhLb0LhPKV850yjXxBLK8qALWjg5WzJ/S6O3QBF8rNUKr1N1TeYgay0xJkUqIdRUO7Ug+m5ZaPC4cTkox5+UqFFx99isk5vmbviZ0sJpv7Z46uHd2XMFkPsFBPQmtxmtFc2dpmuz1HW7UeRX05dFA81xC4VkoiZ0SGyATxcMi5biHLHnghZCv1Tla02WNj3MAkPpKhDzYCFU43e3uElTbe1h7AbSdrCOKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GwG3AffBwKH7uiYLMfbZkC7Bcd/2CT7aPEDqBt/pIBM=;
 b=oCX7W2t5ifTQxObw/IRo56JsNcKGjSQZxIZdqXqNVlLBtU1SG3UOiUJy7cdyFTcF2E+ETXmBFGBoodDjKvzBdIApdXnW4nBnBkGL9JuGQm1FJvw2hOT5bl5J+uvNs0JTc7G2+cr71dHLye0URwy4qR8WjwwMk54AdwSqk/K1Y/k=
Received: from MN2PR08CA0017.namprd08.prod.outlook.com (2603:10b6:208:239::22)
 by CH2PR19MB4729.namprd19.prod.outlook.com (2603:10b6:610:64::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Mon, 7 Jul
 2025 12:42:01 +0000
Received: from BL02EPF00029928.namprd02.prod.outlook.com
 (2603:10b6:208:239:cafe::d) by MN2PR08CA0017.outlook.office365.com
 (2603:10b6:208:239::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.27 via Frontend Transport; Mon,
 7 Jul 2025 12:42:01 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BL02EPF00029928.mail.protection.outlook.com (10.167.249.53) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.15
 via Frontend Transport; Mon, 7 Jul 2025 12:42:01 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 8AD35406545;
	Mon,  7 Jul 2025 12:41:59 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 6CCED820257;
	Mon,  7 Jul 2025 12:41:59 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        patches@opensource.cirrus.com, linux-sound@vger.kernel.org
Subject: [PATCH 2/7] ASoC: SDCA: Remove overly chatty input pin list warning
Date: Mon,  7 Jul 2025 13:41:50 +0100
Message-Id: <20250707124155.2596744-3-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250707124155.2596744-1-ckeepax@opensource.cirrus.com>
References: <20250707124155.2596744-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00029928:EE_|CH2PR19MB4729:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 5b65be30-c862-4e13-149a-08ddbd53ab82
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|61400799027|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8hARtbgGIvm3mx9KX19r4tT/ppS+ISRkKxmMMVyE+MPBuXahvQJBULaIl3EG?=
 =?us-ascii?Q?JQY9SeB0ofVRNm+yJ1+J94gJcozfjn4C17/wgs0fhOguYpNR1zHsYEJpnCQW?=
 =?us-ascii?Q?tNuU1kZ+Iaqtx4jcx/20AKaD/5csBzOqqTvchSAHLKaJRT64Ylfn2mkuXhhV?=
 =?us-ascii?Q?Fl8upi2QABof1pShfaYRGX7qYVdiI9XhIT8XxXqKY/2yJUKVdXZDu1WI7teb?=
 =?us-ascii?Q?u/YPNNsOZo8c2D+b+Nv7qgV9lWcXgFiyFsCwOZTG1C/Cz7wIErTkshzAYt5z?=
 =?us-ascii?Q?Gda7l8J2u6YzevLMt/Bvxyf9MR2NI1H0rcjVHyEl4lHnzeBwIO/lsQ5iajLx?=
 =?us-ascii?Q?GpzXwwjKsP29Rm3MQGieEGM+P+2TOsGQRVuM7YhRH7PVCmI//5ITFGNSN289?=
 =?us-ascii?Q?kMGTOI9B4GOvXPimoTYn+Th1wOm9VtYnbaVSn/q7/umBQur5WwdNh9O0FvdR?=
 =?us-ascii?Q?lHuYvntcYmUkqP5L730V7bxtiCEOJSJEJbN1ErVHX+pHpi+T9WDDdrcPrcSm?=
 =?us-ascii?Q?3uYwJ2XcD6X6mnoLLwEFewVsRteILdcvkMroX+LbCeORVhvyOHu3j8NwYqAk?=
 =?us-ascii?Q?bhdJnmrB62y/G7kFAI+9CJHOIwq3Dz85Hw1eteFMmRqYwi6l5plYxSZwkZ+q?=
 =?us-ascii?Q?MNuQXXyZGApViCG6FphHAyw1hWl4C3nnxmXznoD2cuQjYxEK8cfsuOICanZ4?=
 =?us-ascii?Q?ujdHbUaAfSji0uSU2co16kb54qvp90354ClHgwG8yJM1Rr9fGTGBIfdwV7F4?=
 =?us-ascii?Q?Sn/o4n2NGm8jRXcfSB7QOZBfvYaLsMNyGgg88U4vUZPD49RY8p+bzCKjtuIo?=
 =?us-ascii?Q?rhd+Hb6V2LGc8s8DeQ/xyRbI+ztaNsv8LuC0Q0P9LwErfBwo6vsDQmQV9Yld?=
 =?us-ascii?Q?1N9f2Ru0R9oXbLGTuw/MVH8ARL9NRlxC45aw0YIYKbZ45AAen5UjcPwOefJU?=
 =?us-ascii?Q?EwCWZIN0CwIn9q+gFl+u1JkF2akE4MyOWiWMLLgVtq0K1g9HXgR5SD6CpOm8?=
 =?us-ascii?Q?9iu720Ekg3PopSYIuv+OBlFPMF0Zgen0RT/rPIJAkQiN2as8nsC2YKA9FjD4?=
 =?us-ascii?Q?GdXxoGU+rYidlpZj7brVwHXE+LjmKis7jlAbbHiQnnTQvSVjTQi6pCQe1QUQ?=
 =?us-ascii?Q?YB5Mg7gZve/4MV9odTOdTdIn6wUPownBnWKcdVo+yMAlexUCWP+nNz7l+7uO?=
 =?us-ascii?Q?Mu7uwKPqBnpzj/pr2/H/IOu/FqurTJXvicubyQDd9Dy1wKIpS4dlE/1W0djo?=
 =?us-ascii?Q?RyCUufZWxEySG4JGBcTZjJeCzDmSTA9cD95vxF6KgLNW8zZbSrs0zya0vjKR?=
 =?us-ascii?Q?hjTwiTnwYxKjI0PTDes5hZRcwOsNxuS9CBZxuy+RDB2PnWpYkSh4nYZhhtY6?=
 =?us-ascii?Q?0AYy465FBBr8Vnh1PBerw4tlUwY/9FhESTyJAaETSFjdYPC7G/bny6yiZorg?=
 =?us-ascii?Q?eT788nkZRBatreEF4odpBPUp8mE1IxBcS95dk54TI/AFnCCRo9Cgt8zlgWot?=
 =?us-ascii?Q?TkemfnrQK06oVbZml89dAz5YPqpNF4r5TIgB?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(61400799027)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2025 12:42:01.1706
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b65be30-c862-4e13-149a-08ddbd53ab82
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00029928.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR19MB4729
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA3MDA3NCBTYWx0ZWRfXzSdflypleNui NNxKNaLOUc4fSsKpg35pesGTKCVGUYtHkYej8UhPPnMMLPRWYV9qN89jhAk4/s9S9Vchq7UmqrJ QtuDkGD223zZra4SIpIPN+jFJ/TzSNrtlv0SmzPOJUcZmyP49RCJUPwtrMeJ72uKsjtyz5NcyLa
 C+vk9oIYme+dSoJ4hQncPzYczJF4TeCUDx+jgg9ZknJ3fhXOQTEeqD9e4YaCRK40UxaLnzZu7by IRKh+A71fTZiWNci8AiVnWVDRclDLIPk6X7nP+4U+QniBmMVYtYYnQe4uszlEGu+sDEK8iTsKWQ DrYvE+0haTZF3WKpp7kMwEw169+2XvqCZTjrPRovQ8GcQfVWRzl+tW8f34tHGOc9cAsfNRPO3AU
 y8VZRjn5H9ex32dicaO2l9VhTTO4BYnCMackPVEuEHxAHL6d47CfUM2+tz6HpH0FO4t8w6Xd
X-Proofpoint-GUID: M0S-ZW-CwP1YRQoRrTrSPbi12GBazSUi
X-Proofpoint-ORIG-GUID: M0S-ZW-CwP1YRQoRrTrSPbi12GBazSUi
X-Authority-Analysis: v=2.4 cv=YNafyQGx c=1 sm=1 tr=0 ts=686bc09f cx=c_pps a=jKI1xF7KBL6Pubb8ieCg8Q==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=Wb1JkmetP80A:10
 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=w1d2syhTAAAA:8 a=6YxccQUXYspaTy1DYT8A:9
X-Proofpoint-Spam-Reason: safe

An input pin list is not generally required, so a warning on the
absence of one is a little extreme, remove this warning message.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/sdca/sdca_functions.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/sdca/sdca_functions.c b/sound/soc/sdca/sdca_functions.c
index 164dc0e16a31..1113f8d91b3a 100644
--- a/sound/soc/sdca/sdca_functions.c
+++ b/sound/soc/sdca/sdca_functions.c
@@ -1635,7 +1635,6 @@ static int find_sdca_entity_connection(struct device *dev,
 	ret = fwnode_property_read_u64(entity_node, "mipi-sdca-input-pin-list", &pin_list);
 	if (ret == -EINVAL) {
 		/* Allow missing pin lists, assume no pins. */
-		dev_warn(dev, "%s: missing pin list\n", entity->label);
 		return 0;
 	} else if (ret) {
 		dev_err(dev, "%s: failed to read pin list: %d\n", entity->label, ret);
-- 
2.39.5

