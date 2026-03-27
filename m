Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 528851EB5FD
	for <linux-sound@vger.kernel.org>; Fri, 27 Mar 2026 16:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774628885; cv=fail; b=HdmI34raC7r3vbXfwZR6W5MKIbYvuA2Mt7O6GgHSoaPmeo6jj4tR/U06vxNqG6beiFXvwdUJZo/tNVa8Gw4Ic6rRvTNStldxIBhJ6dNirnzN2CsRypdnBpoPOSNH0DqNZz1rVkD6QDjaPWSEjHeRgj9M47F/JcjCZizR6J1drR0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774628885; c=relaxed/simple;
	bh=v9iY9OKcObAiaP8udWkU/3MhwAO3Alx1a5MeX8qij0c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=nAmQyLbhbtk0tharDuB8f1yLMTat6CGp4y1s8sSvTwL4/GP85WadbNYe73kSOyeNDog1ul6ZmZCQ7ZxIyR4d73/wyYwQWO76/naD4etl+2sZWhUJdMU3BX6fSCzqwIflr072DGJQul8rvRYwrMwEd8dKHON8GTaWCjM0ZLn80Ac=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=ds9ex7fI; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=r3J+sD5y; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="ds9ex7fI";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="r3J+sD5y"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62R5rFwP1668478;
	Fri, 27 Mar 2026 11:27:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=/1k9hWq29h3DfVGk
	NxtA8/Tz9ITpWEi3vS86l029Qm8=; b=ds9ex7fIJNxDYMunFtC650zcrBNR1nc1
	cWL6rlEkjpLh1WnrbTdgNZaI7xTcnaU3GNS1rtYrIsnaMm8qH9YnxQs+1/X3x3lg
	65OrXvq/Thj61u85iRxyJPFCajTuK5lsRQlYEi68MrNFr6DTcFlZkhFzcrzhHBNN
	NpxhrBNM1AOruDbBxsjo2BojyxZvocbEWupT8OYuD6dK8EPij2H/J3aJ7aSwd/Oq
	25qQVtVOQPGsfmQZILDdXLntQOFJCApHSvf78kRuLOkEnBptBRXq/uhY8YOc4iqZ
	Y8WrCFmx9/WFeAxR+PjPDoILitDCR8ZZtsvKMn/70MxD3kRVAociFQ==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11021079.outbound.protection.outlook.com [52.101.57.79])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4d560qhyc9-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 27 Mar 2026 11:27:47 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LV7AZ6RJV8b5cHolW9y3Gb9YuZVyLEDlCK066ztFyYMsy+wg9otoU8t8T0SWZHznzmkJMQhCgBYaTBJrsajTXtRoECNPOx3Y1OB8jI6KW908eRGcDiYGmQNKAkKL5298FUPbMteFUZ6z5x7otnLfRzBoP7YeScrucSdjlv/crvfkDoWhJjkJvJdx57arthEzQT9EixdEvrBlg+2OYffF8/tM/0YEOTKb96RwD4XzYkFL01ofXVheS6Qbj3hUPDYQSadhywkbVgfX2Ih1C3TJDmssrcuHny+3orazzPycCUG/d7D8pmBNx9SzysKS7qmZovsrvg84wKMsvZVpbZF/xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/1k9hWq29h3DfVGkNxtA8/Tz9ITpWEi3vS86l029Qm8=;
 b=B/6/TpjYDuug9WkrrECbAeKVmpE/F70r8CltuSsGJWziE2frtlmMknY9FocMuSnV6vWnbZhezfBpWXCdrNUPrA5dU5MMwC/iMusHTKZVV8TDt8TMpcrAnT/I0TyEDhJGTPHLBw6pRgCDBTfIQcYRNpn8ST+5Ovqt11Vox1LAOgNSVa2zSfbO4FrL9kV+/mbjQNanGmoI1FJZP6VgMi/laDz+1eJ8jVEyBzs0ofCgYejjsrfgjGDqFiXOJj/qKZyHkVxAoXJCVXP2EDpvqzEqbpahxt6iC0Jxow0dMF8uTErxA+WgLVF1Ba6M9WmcNgf6EsPKL0ZXzG2LscJvYYiyIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/1k9hWq29h3DfVGkNxtA8/Tz9ITpWEi3vS86l029Qm8=;
 b=r3J+sD5yT2Cgjr/MnRJntJs2xIwqoU8tIMH1pWuiGDDYMCjiuSxfxQIGdPGmjwvYtfHlhe6epiARYDHZYIB3QR6+C3XYiRiFr27MDxae6sCmrLGl4nFcmwjPF971m2y3B2FZwkobxwxTh90UfdTZuw47s8ToHgP0rD8J1z+jEe0=
Received: from SJ0PR03CA0155.namprd03.prod.outlook.com (2603:10b6:a03:338::10)
 by MW5PR19MB5651.namprd19.prod.outlook.com (2603:10b6:303:199::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.23; Fri, 27 Mar
 2026 16:27:43 +0000
Received: from MWH0EPF000C618F.namprd02.prod.outlook.com
 (2603:10b6:a03:338:cafe::df) by SJ0PR03CA0155.outlook.office365.com
 (2603:10b6:a03:338::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.32 via Frontend Transport; Fri,
 27 Mar 2026 16:27:31 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 MWH0EPF000C618F.mail.protection.outlook.com (10.167.249.103) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.21
 via Frontend Transport; Fri, 27 Mar 2026 16:27:42 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 850F840654A;
	Fri, 27 Mar 2026 16:27:40 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 6C306820247;
	Fri, 27 Mar 2026 16:27:40 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
        yung-chuan.liao@linux.intel.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH] ASoC: SDCA: Add RJ support to class driver
Date: Fri, 27 Mar 2026 16:27:32 +0000
Message-ID: <20260327162732.877257-1-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000C618F:EE_|MW5PR19MB5651:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: b1300d41-99a7-4055-4bf8-08de8c1dc537
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|61400799027|36860700016|16102099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	CSrGei1pIasa0V3+fQDOfnZa5Hf8M1af5LMstGsp4xwqs1VTPaZKV6MJHTOhU0uMcAyrLVOC+vuUhyT0B4fsdwHzBbGZ4+uPy58YUEaXzIKMuDaxusLu+3CReUMl3kxgEP9Y3jDPFFRq1GBjwkmXarl84bFXOcxBeV4Da39DD5+29SHC8Ytd/PJPVtd3hXWF88uB7EFMTj5RdWFHOUZ10rHd9miprm3oksdvPvl6HzvABVfmGxNYphx9xMbmWkuT+MrtBpxHveb0mJe3RYhnRKDZGBFCGBou4vMpgQUcXLJxU9FoWNuqvI3UWGt31WpH3A2KDZ9ZRgkrXcb9vwcbxkcCPfpyXCslKfWa/pYKGym5UeydvToq6wV48IRu1rQkgc+eGdqe7H4AiMmgzjdhJjo7FObGL5OrfrZMav09/fils2mN30rl5rONzj3DrCpYpyWIdhrM+LGsedBq35HctgYdGkpTZJ/ROxcp9P0TY0XKTRHoGxnzD40pTPl14JJVPcev1eIsUXu9EfnF40GzEABdpABZlripOgkAmuDDCavAS2Rno3Uc6H5pGtM16hNDXjWhcaEBzj1QxowaJK1fQM6vsIoqPNf9lkWXtHV9ImAZOrRno1NUCsM772wQ+BovfVtLVKcaZcYa4u/bJv0mc5BwNda1sY/gL3yVhUe9IqohyWnbPwwclA7o3HCJX1LsX9LPT2mIikoX/o2V2CEDDgZ21gkl5y++Bu3JEsrP9n6jtC5UKQ2yo4ZUXn1YVOeYJeo4i+sGav8+jyEyHJjaCw==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(61400799027)(36860700016)(16102099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	MgCtowpx7yyX4nQcEZHrde9KUMhcfgcS7ntwqo+ngjYGVHHG5D7zc7/n7expWHF7oVxMXjLuXEuFfUaDbmnfCP1g+9yaxd0oBCk3ES2AjSlkegp7Q3S3L+lJ5xcKbJNhXoZATyNkALNBfvc3ZJ3i87M7TisxQK/xknRfFyhOGzWHqWOvGOGq7x/tdDoBXWmbToOiAAXiOMzhx+CXnuVfwHA14X7E5f/WqSISpmAeJb3hqlTNLSEvOTcddbeJ6JYIqmfRfbH2BcgxY4RV4iWyNYglki+7q6VzWu5vY1JEE+2bj4RPpEtNo8MzPgbW9TgY/A2x2GuSyn49Jmky/zP1YNRF3DRbgr/WFWpSe4RNFqEWFIJ9wnHR0th4vZP6ORZHnMuKGCeaFF+Ht6mGvXRdAbkP8uFEKN76wEMSLJxaYd1NVAsBINm6QcRsj6wvr4Ix
X-Exchange-RoutingPolicyChecked:
	oI2zp+BfYfr+tWsp73ouS5dePCGMJn6Ieha1z2inJfbe83f2hrFNxRBYgp3i826pYYYmaPb4Hs0ELSswjQw4HeVS09XeH3A9Tw+x730ApV/UQbexiRC6D3q3Id3Cxs0oerwm5e85M75S+bwr5ay6v37SXzqOjGeCSN4rX66FJeSoOVGqKG5+9oJ1Mfs7IO9eMdGyNzZcpdnRQ0ukZU7abu7g3rZhYaNAYzy9jznT5tFJIvhvyry1OrnYoUdyXTEffHv3EfxULzMprHVm0jPuOGuVtWxEkuihkkwjoMnwsYVgEyFZrUzXFU/m5h5qERdqp8zpRS9JkOrBhztMM45pYA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2026 16:27:42.0589
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b1300d41-99a7-4055-4bf8-08de8c1dc537
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-MWH0EPF000C618F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR19MB5651
X-Authority-Analysis: v=2.4 cv=VKnQXtPX c=1 sm=1 tr=0 ts=69c6b003 cx=c_pps
 a=5qYghnwh11e9fEKeXxcNZw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=Yq5XynenixoA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=YzWcvuQMjQxWuX-EqYYA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDExNCBTYWx0ZWRfXx5o/oY1jWUeu
 sSkgWT6z4Lpi8Hn8PeJ0HjgNU56FvGVfE2TICW5RrqLgyFo22jcRBuvWLc8btkTr7TGT1ydX/0Q
 KqzuK42SsQOt0UzXnrWDTY+Cqt52KWw9yQd5yEjk1gBMYe2bJEmh9FeVV1qENZGSArVDQBkF8YJ
 ZRFkIix6nAKdkTNjzSfUbGl/aGhO8+aKY5vDbye93PshPZGS5MgyIbI/H25erUoiscMMtDTY8Md
 RSoqu+kF3XMtML+YuWXo8VjJGCQG/hWApstXas+h76F0pTsp3MqaDP+4RDkW4v7Ky4pSXYGVQxC
 maAqkE0usvJcF8HBzzDPXWU4ecqPmIUZp/+wMFe+yV8N+J0q8hSg3BPnVVJpuok3bBNOxaw9QWh
 skQdsoXKe4o2TrY2cgEPxkd2qEFCDugeemd657OyQyFKFP36RyDllN+ybHR7V8A5mXRgHdFb0tF
 rKNL3zNY1O4Bot+t2HA==
X-Proofpoint-GUID: 1WY7b206hL6-nUwAYJlBx7MV0QmUv41J
X-Proofpoint-ORIG-GUID: 1WY7b206hL6-nUwAYJlBx7MV0QmUv41J
X-Proofpoint-Spam-Reason: safe

Add the retaskable jack Function to the list of Functions supported by
the class driver, it shouldn't require anything that isn't already
supported.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/sdca/sdca_class_function.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sdca/sdca_class_function.c b/sound/soc/sdca/sdca_class_function.c
index 98fd3fd1052b4..c3eb3c23a7db9 100644
--- a/sound/soc/sdca/sdca_class_function.c
+++ b/sound/soc/sdca/sdca_class_function.c
@@ -368,8 +368,14 @@ static int class_function_probe(struct auxiliary_device *auxdev,
 		return dev_err_probe(dev, PTR_ERR(drv->regmap),
 				     "failed to create regmap");
 
-	if (desc->type == SDCA_FUNCTION_TYPE_UAJ)
+	switch (desc->type) {
+	case SDCA_FUNCTION_TYPE_UAJ:
+	case SDCA_FUNCTION_TYPE_RJ:
 		cmp_drv->set_jack = class_function_set_jack;
+		break;
+	default:
+		break;
+	}
 
 	ret = sdca_asoc_populate_component(dev, drv->function, cmp_drv,
 					   &dais, &num_dais,
@@ -539,6 +545,10 @@ static const struct auxiliary_device_id class_function_id_table[] = {
 		.name = "snd_soc_sdca." SDCA_FUNCTION_TYPE_HID_NAME,
 		.driver_data = SDCA_FUNCTION_TYPE_HID,
 	},
+	{
+		.name = "snd_soc_sdca." SDCA_FUNCTION_TYPE_RJ_NAME,
+		.driver_data = SDCA_FUNCTION_TYPE_RJ,
+	},
 	{},
 };
 MODULE_DEVICE_TABLE(auxiliary, class_function_id_table);
-- 
2.47.3

