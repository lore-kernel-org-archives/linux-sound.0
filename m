Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D80DB28FFE2
	for <linux-sound@vger.kernel.org>; Mon,  7 Jul 2025 12:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751892154; cv=fail; b=GOJb2CMXgCLyRkRoMheC6FZ/Wzo9VmmOnjuLEae1gJPXU11LnrozaWy7JxYBszUeLAkwK5JEJsWCZgx8DA5MCH0amnqvClqD2LjNls91AptEPXbrjXWM0dev3B0BSK/u9eD/9T+QTsfeRbjxhtYUv9/iExyY9Sq7o2CA7qbwAgE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751892154; c=relaxed/simple;
	bh=lbTv0DJUa80KOQNa2Hw9e0j0bqsEgwAdCYhEFCSWdRk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KC9bEn573NdpWMa0Ogb7iyn6g+cwJFg2AJuq6PEaSBt0Oh6dtJLI0gLZD976e3FKy8oWPf7mUsnImuScy+O4V1CxaHSpTRWqhEbuuT1EDx5Ll2acX5wPWwhhXcoe9tLq6wnboa5dzJDgPD8xnlNHRR/GSQqod+Ya6Ok0F6O6XEE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=o2umXtz7; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=E9xPHuMY; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="o2umXtz7";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="E9xPHuMY"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5674p081022947;
	Mon, 7 Jul 2025 07:42:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=Y2TbtTvshs7zUaM9ixcr8IXksJdNXcVkFS5EL5F3DqI=; b=
	o2umXtz7kjMcUbVO8Hlrh6JMCBJ4tTAVZhbWGjPKvZJtfxyoj7fe1XCWOXF1GEAr
	LmMMhLBEvTDMrgllM9LHQiyVhFU7g87UGrnJSkdFZ5gGoWW0eggPhGi4rDyYpAMZ
	WEujBsVXp1RqpawDPEQHMHhfcfbUF66ZEorZu3UY3Pis47cnZUexw2Z/EQmf5Kfv
	LCNLeV3g1FobbXx/3FHna9GrtdZnqpz6XCuIuD1gmzTeIcoRy7vC6UJjDmg8UgNt
	W1NSFgDttF16JM4EkFp8074SHL1NuuDc5JPfenQ9CxCmw7D8A9p1x3ApRmMZXKoD
	4Zc26qO94X1uS2b3xR70YQ==
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10on2114.outbound.protection.outlook.com [40.107.92.114])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 47r0pjrrx6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Jul 2025 07:42:07 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hmmhl8Ww9duHXoVAl3HnMr9plEY0BigWNMx2qbHjbaQE77uaN7kE9MKwJSBfk8aOx4VqCvDT3dP26Jag9g1Mp5MMO/z500AcgPn0aUJ6UIpUY5oDlL6wKp4EE3uKNit3CVZf+a7NoXtPJDMhhHlve6R+GFxrEFkiQqo3HOAMmLIwlblYidXUx8sMlP9XNr3pGHsbRhW43JMfby39XrvNwYqvSdl0IEfjaW1rPHYJC9+1Y6SU5QPnOtPu7z0oKTXZKqqY5mF5eCiTSQEMRbxxA67C8X83o3UY9zvOcItul2BV6SgosRE7K67t1IEFsK0KoJIDNDkYX1e9tEnghwig8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y2TbtTvshs7zUaM9ixcr8IXksJdNXcVkFS5EL5F3DqI=;
 b=ew7bN3tRQHurFETZnygmzuC2givuJOBqXlMUwxflK1YhNz4y0YcWiRJlh+3UXqVBX9KDZI7dTkZ49IXvB1SDW75bQRyevkT0C9rIghoz53JuPyvcjNvApnRaZ8WGM0/+l9susAFx2KJOt1f/mKfZpnD/qujCvXuLthSP8PpFw86wtmOPt4CiT8eI0tCA6V1fm95RbJSK/x1Zub/1eCoq/rgQGUlxzIyfE3+obu17sT+4gXTbvvTkfWgu2Cq8cmW7TjO6NKJAEzX8UazswOog4rypAKIcg3DCxrq/E5y2s53SAtpRECfEeksPEetztwtzAq2/Kt+Q9CS0P0+ed4uytg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y2TbtTvshs7zUaM9ixcr8IXksJdNXcVkFS5EL5F3DqI=;
 b=E9xPHuMYbIT5FmBcTaETb7ACw7z7pw8hPynjgOYRIRzmZ21q88sirKmUOSHngG5oBl2EDczWdTh+AYCFsxlnObc9qSvtdvf7txk1Jrlhk2lCdPFaa0/uM1i6yb1gRGxrcsAsUKo8J4jUwH7Uk6gacvXrVem5EdsExo+k2vO5ld4=
Received: from BN8PR07CA0028.namprd07.prod.outlook.com (2603:10b6:408:ac::41)
 by IA1PR19MB7877.namprd19.prod.outlook.com (2603:10b6:208:446::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Mon, 7 Jul
 2025 12:42:03 +0000
Received: from BN3PEPF0000B06E.namprd21.prod.outlook.com
 (2603:10b6:408:ac:cafe::70) by BN8PR07CA0028.outlook.office365.com
 (2603:10b6:408:ac::41) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.26 via Frontend Transport; Mon,
 7 Jul 2025 12:42:02 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN3PEPF0000B06E.mail.protection.outlook.com (10.167.243.73) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.1
 via Frontend Transport; Mon, 7 Jul 2025 12:42:00 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 84364406542;
	Mon,  7 Jul 2025 12:41:59 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 68DAF82024D;
	Mon,  7 Jul 2025 12:41:59 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        patches@opensource.cirrus.com, linux-sound@vger.kernel.org
Subject: [PATCH 1/7] ASoC: SDCA: Allow read-only controls to be deferrable
Date: Mon,  7 Jul 2025 13:41:49 +0100
Message-Id: <20250707124155.2596744-2-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06E:EE_|IA1PR19MB7877:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: db7355fe-eff2-498c-094a-08ddbd53ab5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|61400799027|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?IwViWKFt705Hkp+fN1iWfpZZue7i66Mi/SPR0I/+8fXZIl2DDr3aRJAl35n2?=
 =?us-ascii?Q?VINy+5jRTSfLhHqBsr+1piNrZRTKgIBew+NpBg/VA8wbKLsGvPff4OCS58lv?=
 =?us-ascii?Q?GOlF3mJh6t9E4j1cWpGrkH48VYy+oRvyJQJV6sdQc3jjP19QPlSvBBUwDrvR?=
 =?us-ascii?Q?bvZHiU/Y/BUUGJK+1LYd/YL1tenG5L+O3EADM0aLSVjROJyC2BN/Exzvd5hI?=
 =?us-ascii?Q?10QvXN3n0JJUP3zM5jYDiuhHZbGRZU/u7uBucYmIPt4P0PToiPtqP+5eCIRk?=
 =?us-ascii?Q?vCh7fAOcAg7zWmG5PQOw2v+hdVL2+e4FhqE9QRcPOKn51zXhh2V2LqyE4p/y?=
 =?us-ascii?Q?woUW1YTBCT3/hk3wlqSiO06Z+X6AX6cV4g6bH8ZDutbA563HahAZJ1Sh0sL2?=
 =?us-ascii?Q?iEaT8xg/5/+agCmdq3paWnpY0tSDgRAI+6BRv6QDGmrXonmhUtKVU5QH6pt0?=
 =?us-ascii?Q?wWc9PnwIQOttZbDK7lwDxTKpmB3kTOOno53/Rydch0RuRJfMKDR55WsF6/G9?=
 =?us-ascii?Q?yq/b07rIVVmen98kvWFNH1uKy6KY70LJqbE1BGnNT0RuHTl5/Q8Lo6SkIyd9?=
 =?us-ascii?Q?P8J5NnFwdIQ53SW0lA8YcbiLc/4Vz6GRw1IDHYihX44wjIRXURTmblKPrgKi?=
 =?us-ascii?Q?yWWgL1NSQMxoQJEVLPRT6IN/SI3bBjQBP6FBqqHLyWSlT6EzcjqO/3kLreZn?=
 =?us-ascii?Q?Ubn6QNZvKmQh4PGY897MR3MDeTS74t2EzxZwv6QA7US7Yt37ohAH/lu1xDTp?=
 =?us-ascii?Q?mWO4XDszWNWb75HOnL43NxlYs13jPvcYu/rcKDW75Rl+oMO2ChbkbltbYlWK?=
 =?us-ascii?Q?Lyby+0+l4suIDUBirNKBi5CWPj6l7U6Fltp96t/fMnbDIkVw3Z8+7k85mEo4?=
 =?us-ascii?Q?ki7Lnwg69cc68HGCN5/EXss4Xx4YYn7kBpJkAV3VeRhllULbHOua35t47G0K?=
 =?us-ascii?Q?v3M3OXO7HjmzKiPuKs83DbblvQLtlo49sHNK6fXF2oak8s9PLnE+jfanDo4u?=
 =?us-ascii?Q?AgBxUYHdPAVtJdIq0OUAiDq0ZiZvP3zAx24o+YqxBejOyeJ5KcxbRxCilIIy?=
 =?us-ascii?Q?1HlvCWcZouFG3cAS3IWsR5TQc/fH9uCSIkXXhUvXfR8Dl1WLembKFFdYA7Ir?=
 =?us-ascii?Q?8uDGHMhUgUXyEb/M17AoTQfMc70a4ydMvuhZ9pWY0omqOmY6+h41sBIm8wRG?=
 =?us-ascii?Q?0kh65FvmY+jr9g5fbdy9nokRrE14S9DZvf+sbzkf2QZA0WyFHX++05xs2byM?=
 =?us-ascii?Q?ZnRVb+Hbxpttv82qNSgvebFk8tSlcopXIMSLdKxBzyE/YVpztSsnAZwLeVan?=
 =?us-ascii?Q?j2eFiZEmCny4C/mhwOrz5f9jASVxmakKpEZjuKbXWXPWmZSf/iM/WAqlSqkg?=
 =?us-ascii?Q?lrVwpLA2jbsf8hHdWtwlczUwCGwwaer8C9f6xCoAPr6hOmVKrjNMN0Z5R54p?=
 =?us-ascii?Q?Pwvnq4U2bg29ODO0lueawr2eJu8wit0m0NVj0jBLgHJadrJnZZPiSzsXJPly?=
 =?us-ascii?Q?V60mB9olRZLzOx5c+blyEecKVcTvVGMm/L3j?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(61400799027)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2025 12:42:00.9351
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: db7355fe-eff2-498c-094a-08ddbd53ab5f
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B06E.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR19MB7877
X-Proofpoint-ORIG-GUID: TEUVIqt2o12pk3j1RL9mw9ZAvW1yad7S
X-Authority-Analysis: v=2.4 cv=dtDbC0g4 c=1 sm=1 tr=0 ts=686bc09f cx=c_pps a=1agHWDAk2Ff3ek/eqE8klw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=Wb1JkmetP80A:10
 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=w1d2syhTAAAA:8 a=Tvb5laxKVx1xcNVSzZEA:9
X-Proofpoint-GUID: TEUVIqt2o12pk3j1RL9mw9ZAvW1yad7S
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA3MDA3NCBTYWx0ZWRfX1SWrolVv8MdM LQCRmuxteyOifM0Ww1OnUL+YD0jU3DzFw4VKRuIAiTvTdOsA5NTB/v4GKEp9VU4sfMQfHDRT8sk lSK2zaj7Y1FKqyfZ07v6+VgvooBWMd+zkP3lf4o89lLzWYabiicg43qbzO77N6pG3B5N5+2WH/L
 HwiV413r9om8GCE4a8sge9O7+EmGu2z+H7EC4k4ATYH3m2IRygS6dJxZe+4LqaxINS59B5k5iwi nFJZjP4LlAfMf6PoRsvVa/47Qim5pRlf5SISrwZnXPN172u3kG1WtY9fMWl/eWIV+ZKwDZt6jB+ rmJyBefrOq2pcF3yKCQwGe1zOtT46cDwn4dROBSmfqgpeEZtF4YjdPNovDB9GGNWyfmj3OQGunr
 sW3F502gqPEJ7JRheKxWHT4rTjQ89kC9EdagrDZUeYxrbfIy5vRq/aGTm3DIJZa4IXU8+0p3
X-Proofpoint-Spam-Reason: safe

The current SDCA Control parsing only checks the deferrable flag for
Read/Write and Dual Ranked controls. However, reads can defer as well as
writes so Read Only controls should also check for the deferrable flag.
Add the handling for this into find_sdca_entity_control().

Fixes: 42b144cb6a2d ("ASoC: SDCA: Add SDCA Control parsing")
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/sdca/sdca_functions.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sdca/sdca_functions.c b/sound/soc/sdca/sdca_functions.c
index c34f3bf62983..164dc0e16a31 100644
--- a/sound/soc/sdca/sdca_functions.c
+++ b/sound/soc/sdca/sdca_functions.c
@@ -881,7 +881,8 @@ static int find_sdca_entity_control(struct device *dev, struct sdca_entity *enti
 			control->value = tmp;
 			control->has_fixed = true;
 		}
-
+		fallthrough;
+	case SDCA_ACCESS_MODE_RO:
 		control->deferrable = fwnode_property_read_bool(control_node,
 								"mipi-sdca-control-deferrable");
 		break;
-- 
2.39.5

