Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24A7B339397;
	Wed, 22 Jul 2026 10:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784716535; cv=fail; b=AZV7uBLLoJ8Z3DzKtmsdaMs3k5QI5srnJkRu0TlMY8Wi6JVlsGSkMzFVfx1Wm/2ZxD4PY2JmRpUu2ySCGegLcFUJ0+0Kl8xYxMrwNCFpFTxeHKCc3d3QfO1azgrrioTbad9ktFsTap4xCF/eTuGjJmhZGgHAy8BnNJ9+GgaaXPY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784716535; c=relaxed/simple;
	bh=3CUi1WHU0jRVV2OSXfHU4WhdL9D6cg3SaJ/hqqCnUqA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sodgk3J05bTvfeoGI8byR9tzZRo9rjjklHyImK39ePXJftdorgj3Fr8YwzRH/aaYp4e333D0FNbJgiHpXrBjRm13NmAwfRVjTcIe2cLzIk+QVeveuCk9Kt+fliTRSr6M1zsrLh+jP8lDpQ6hRPnnB2gWpfgpFTd0Pkln7+FIoA4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=JupiCXa3; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=cjLYr1Sq; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="JupiCXa3";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="cjLYr1Sq"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M4f3PC2100112;
	Wed, 22 Jul 2026 05:35:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=TUkFXAtLDkyPUb2lQxNEjQvyCINDtZ2huaxy7MUVvh0=; b=
	JupiCXa37iOtP141cWMAYNcDhqjDAOWex4yOEx/GfCBMQRkT27hvQCXdyp/8Z9iG
	MIPXID3ZhYbTOj9gYNbZUB0eQsHhgLtP9xtDI26t+J5RyMbumIfk1EsBNBGUJ36n
	kF1oUcPyu4fosI2Ej3UhRSbkI8zDaix+ZJqe9oI7mY75H6avSnaOu22SOtj+dhmV
	sbNPTc8MexYxBHW9m4aYjVkGsdFawTv2f6UE0CNRWCaWClrvX+opOVUiysOwBQoj
	V17LjyeY7GvzRpo0C3aFnVMnym/yeL1wr1iUK72yzZaA+5x3OR4wK9MSv8XVYlKz
	Sk8gmieea61MQ/BtNDqBew==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11020074.outbound.protection.outlook.com [52.101.61.74])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4fg5wfdku7-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 22 Jul 2026 05:35:13 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sodrU6X40OGBJTV3FLPU2/BpOr4BOoxmqY7erkZ5Q15CO+7o028v3UL4h9SQkkOzKKxzXfepIDHbKtFTfutV0XP05mEB75np1hWJzsjsi9Ie3fFLyCSFdo+mw7n8CEso17eg3uGwxim5kZWKY7q9ErXqr5kui5cHMqOpFWTo7M8W4/VFeHDif2wJeJG+BLUnGb6KT5TnvSVm2YzpW1woRvXCuA878P0SnCOqf5ta8bAL582MhIyO9xGFDdjAnlVXsLLNiCzQumhZcscWxfR8y1hNfj1St78PgGcZ+SisVfD+x+faZJTd0irpecUD+AR04VGc0KEIQ0VXs0zykruKgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TUkFXAtLDkyPUb2lQxNEjQvyCINDtZ2huaxy7MUVvh0=;
 b=BjYq654IzREodkv/Wh3N0oT4vtrXRN3HEdFEdAs+cSdmbR1I9lDssED3P2Lh8+ZwhB0aYWVfUJyc0OHcAMJm7/6+ed0FuJBUR0QR18A6oq1BUUO7vtcZPFPaLYcDYYo2OD1W119ZsBXcS1SiBXntsh/MGiEiZ9+BQpbqwpb7KhDIaP2jAT2vFIdgb9ZDOj31MnTAVzkxBFfuHQ1GFmDVK8QXqclZIcwxovsPMj06j74XAK4BRlg/UZ2P2vZ1WeW1fF5Du81QM9hSReuv76tx6eNiTlt4JMK2Aa9bovLbXrrNLxTYuZdUzovGpEXUuCR4Syp0jMEu06+os8E6RozsDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TUkFXAtLDkyPUb2lQxNEjQvyCINDtZ2huaxy7MUVvh0=;
 b=cjLYr1SqtGPlYxUbaj6cS25JGUrjUr0AFoFN5Js3qyI2YbCMJzCix8b3MNpSsJfRG+aPWlfazyhEzLERz3NAV5a8o8HH3ZOA7I6AdJdVGN5zXdi43PzIcIDKKOKPL9oU6t3KSessRmOJNSuR+RA2rooAehVWpq3sXvg40z1ZzlU=
Received: from PH3PEPF000040A2.namprd05.prod.outlook.com (2603:10b6:518:1::56)
 by CO1PR19MB4904.namprd19.prod.outlook.com (2603:10b6:303:f0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 10:35:08 +0000
Received: from MW1PEPF00016160.namprd21.prod.outlook.com
 (2a01:111:f403:c903::2) by PH3PEPF000040A2.outlook.office365.com
 (2603:1036:903:49::3) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.5 via Frontend Transport; Wed, 22
 Jul 2026 10:35:08 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 MW1PEPF00016160.mail.protection.outlook.com (10.167.249.91) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.0
 via Frontend Transport; Wed, 22 Jul 2026 10:35:07 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 5B85A406554;
	Wed, 22 Jul 2026 10:35:04 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 325CD822545;
	Wed, 22 Jul 2026 10:35:04 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH 4/4] ASoC: SDCA: Ensure that Control Range is large enough for header
Date: Wed, 22 Jul 2026 11:35:00 +0100
Message-ID: <20260722103500.872714-5-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260722103500.872714-1-ckeepax@opensource.cirrus.com>
References: <20260722103500.872714-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW1PEPF00016160:EE_|CO1PR19MB4904:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: b4365aeb-de9f-4df8-fdc9-08dee7dce66e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|23010399003|61400799027|376014|16102099003|22082099003|18002099003|11063799006|10067099003|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info:
	+tGS6ZOr8tby0aLqZIRLJcX4u4uiLLTeXGIASDw+ERMOYICAeka9+OEqGjw8deeBftY29TN+UfdBfKWUvlUTCW7bKJvaTi/ugH/HPCu+DbJ/8JQ6PpumxyM0K06VMHPNIF2zhMyCdeejtE8ZFjKKnQbg0Js0A/KMle8oQGX3UbryGNPgFsWRArLRV0C+gjZBpJOLs6u5I4QAkueeEFGYcnG8jttDjRn99oYwVabENqOALROGq+ydyo1Zpnayg/yJaMu11oIVkSBBQNSbxHfp8pNkhuYSXkWUjsCqO5+IVUl8l6mEfAisV0U51tXEXHRbQQHDtos0JrKP9cF4qXRAZuIIUKwzcMZXFOQApM9nqluwX7GU9Rl39jX/bmIpcVbF3YF9nawhIIvyjVcqKRX4apKqI9Wbcp3S5c8vQ6wWGWmbxiNgwkMyYqC3FC/2YJEzX84h5z7tZbDRXyrxB2bDwQUAIU7tUWXPknhwkFGJHV6LBcTERj1cFMbk5za1XXgm0L5KNmtVsGWwtKYmSLgpv/VilKHyP16cv76abNI4iLZ7vvBM/V8t9JflFgRfscV4Ou7u+BZMcDcZQN997gTJ7eVUH2hpHxn27EXFD1Q0otg01qfflYcZHy1T/pdgwti2JPOjW6kxw+DyV2GnW/n3yuUiCbCEgz4VVbiUWdJ346o84cwMUOOs0h391G/wp6+jRKxNPzDF1HrcwtuTMUaVIw==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(23010399003)(61400799027)(376014)(16102099003)(22082099003)(18002099003)(11063799006)(10067099003)(56012099006)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	4a04AK2bRy1KJFr/ean031j/lywWQz5peU5g4Ux/h8Mjj1YIix3ZKjkSXFPEAuhL8hIEGD/m99zdd1Yj7QyXTsrLO8daptN3ErxrT3L374qjsiaWi2RBczbedQr0MsrR2eRWOKuTQZwXc08zgApRBt48LDhUuXnJ1/4+kPqPv9zvbGrAySLzB0tQMrxZhEXBNXtOcUxW0TU6tD8mzq7DZLtUCfmeKC1iGkDH60nscY+jyodBueKyrdgP6c+KYrn2hNVV3uiH1K1rlTzOdtW27cJmsm+L9JJL0qlW5KrGz3ZurZnolF1Q4MlS3aRVFw+nv1FNHyDWshmCeO2VNmsD3jZI6S+pS3WnpIrMYZydOGF0odZR6EepoYj8aZCs/QPibf1Np0NqMDyCUqq35xlVCN1N8EZq8aqIibmuNNjCtf7+naLebuX3bbhJOpce1Ppe
X-Exchange-RoutingPolicyChecked:
	davt7S4lqkYZFbXu45wJNZ4TD8KKu/N6XhQkkYKDvBVVkVSWCmv8HtfBrZ7k5LpHaj2lqAC5shOd7QooDnu9B4vuHPqwap7BOsNj2LvSkNUjGOAltPFeB2gmlQzLcEA0HBbFkeVZl/aizgpcEP9wMrZKBjaxWjqwQ4TkqWISqOoDe4/nmYDQQERqAmKSH5Kz7z4nRDXg3r32jMwAVowR1I8Urw+odgt0YS9vE64nx0ECk8dTimq7THL3ztTpyv/MHUJlVxHEcGV1ZfxWkJQ/nhkUMldhIOYi9Pp8JYp8JTNECCYofrnWc7ET08Rmx2p7yeRKNGVw4PotBZBlIjomQw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 10:35:07.4850
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b4365aeb-de9f-4df8-fdc9-08dee7dce66e
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-MW1PEPF00016160.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR19MB4904
X-Proofpoint-ORIG-GUID: qZ9D9fQvsAUAasqNMLg0Vzsg3JH42fiW
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDEwMiBTYWx0ZWRfX1FbctpHsoyPo
 xftkM+hacGy42TU1dilyw887G1wzBPbKbP4ckoWNKZob1SuklO5x8AN5qZ/K2BRnPfL+fYYjnc4
 +TXK7zNqfRbQZIOgskKpzRU4DUyCIjs=
X-Proofpoint-GUID: qZ9D9fQvsAUAasqNMLg0Vzsg3JH42fiW
X-Authority-Analysis: v=2.4 cv=BdjoFLt2 c=1 sm=1 tr=0 ts=6a609ce1 cx=c_pps
 a=yYy2G489n0tWBFeUj/OB0w==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=XlpbsVkl1wNVLzAopt4A:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDEwMiBTYWx0ZWRfXxxXTlg8cHBe8
 zKOePPlvjBcLYiHCnMQLrimnUBLiCDV5gUCvjyJdTmefXrLLLLL/YQEp8hTXmZqHGixoFfKpYIY
 bzrLPkTBoSOWf1J8XJ1KQ5IqJz02YBxdNyzms4TUPo+1Xxav97aCIw9utKxy4K5AtsRgBrxOXNp
 Ain/shMCG8s1gJK8DIIDskjeTjAvB/+1vGU6/m/vyX8C3527QvzBKrKQ4gVLerU00iDwb8T8RgH
 dFrQD0cTesb8PkJSpqm2Ygb2BcizT1oiRfe+EeaEs4XIiCs1gUFrtLY+Bx4LC5emOBoSCWAZ2ds
 N9JzfPVHyRvSmrokNOP+AIs/d8MwxybStxei5+f0GbteKaWC6AEPMEYhDBfPg/gIh8aYhfTKNFo
 5ZpAPwsyAmuXt9raIoB8XxqdR1mbWXHZHo3ju+/Lz7kb/Ar81vZoJksVYCpEaDgVDhM7Rbvo/SR
 0WSEkUDmFAnlqLgItqw==
X-Proofpoint-Spam-Reason: safe

When reading the Ranges structure from an SDCA Control, ensure that the
read data is large enough to encompass the required header before
accessing it.

Fixes: 64fb5af1d1bb ("ASoC: SDCA: Add parsing for Control range structures")
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/sdca/sdca_functions.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/sdca/sdca_functions.c b/sound/soc/sdca/sdca_functions.c
index 77940bd6b33c9..7a7a9f1a49389 100644
--- a/sound/soc/sdca/sdca_functions.c
+++ b/sound/soc/sdca/sdca_functions.c
@@ -855,6 +855,8 @@ static int find_sdca_control_range(struct device *dev,
 		return 0;
 	else if (num_range < 0)
 		return num_range;
+	else if (num_range < 2 * sizeof(*limits))
+		return -EINVAL;
 
 	range_list = devm_kcalloc(dev, num_range, sizeof(*range_list), GFP_KERNEL);
 	if (!range_list)
-- 
2.47.3

