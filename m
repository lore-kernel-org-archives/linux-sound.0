Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F91436CDF0
	for <linux-sound@vger.kernel.org>; Thu, 20 Nov 2025 15:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763652652; cv=fail; b=A9otrWd+ChnTktVrhe5c9JlWbpXG8jqqNRvmVobFVXdXXp3W9HrR15IbRtGskdDyLU59MEGSQC4DrcsUS0hvZdfgRPDP6ImOLQ6oXftDBkaZ567Ri6DEJs7sj/O3wHS0ucy/NPArhkRMpiO5jDuC7A2GaPxCytL7YUJhxfQ3FoU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763652652; c=relaxed/simple;
	bh=qFaaQFmfJq3SmXzZ84GtztNXSO7sgsQYTAhh1KaGUlk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=czPyj8JEJZ4d643l3L/CVzCFj3rhvIxjop8KKDHIWcvktwKWdRHxv0t2f8zknAqWXie4xivOF3wmOlrXHejMcJdEUhFJBreA2W58msfPYqLorn52cQ8vj+3W+1wuY8G+/y3R8wY1BrqFNM7nhAOPD9qa1NkxUjWPhN6evUNtfJA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=iwFWgCNh; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=p5Yo2iBx; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="iwFWgCNh";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="p5Yo2iBx"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AK4kG0T255784;
	Thu, 20 Nov 2025 09:30:34 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=k2Wlt6nqb8tyQDXOO68GI4DsipNfkCPbUZoBD9T+1R4=; b=
	iwFWgCNhiAQdZVrE5E9osF2Km5BrTEyZK5sOnxlr4oTDPoS69zPh5cNGoMwrgsWh
	MVIOgESgptx+oKtBlJB0NWsiwvqJU2vq1EnRIKX5DifQPAjK34aXcHZj4sCrSoVi
	Tjaavo9kaFl7OXKl07mYuLmT7txURjfMJIFdYRiJ3ud+GMsWRir0QBtNogRzw4vQ
	gz/6lFct1NqtS7nA2EvoyuhHWyD3bCEkHgzhGTs/0U9uEnHokDVB+e/JIhgeiW3g
	eR8E1G2zC5FoB6MDMnkZxUYN4dR1Z8bkNQEG2Zp/SR8knkwjTtMZhVXMd5dOgJOc
	quysSwd4Zu4+88mXrH+m0Q==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11023122.outbound.protection.outlook.com [40.107.201.122])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4ah1bmamgd-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 20 Nov 2025 09:30:34 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vEKC6ys5vXcDzwDmIphLitJ9fuD0jGElpkbx5WLFWPDctWFwJk2GOJeZNq+ZNrXma60GgR342kQc3TZX5qpogzxefNjrx2H0F+Xok1rFx3hj3VurJKh2RAlXi2wFnhvidRopkOJHXKB3errpXtbmlDwFC0WymzzlGi3S/ml0WlI230DWS7Hut58yF6NGVJ5G1F8In8B4G8YMDKUuAqb1JpEfLYrtfyfiUKTXUsGOUh9rd/5cH2W9pmL7bR8dk6hr61jtqAN2Ope/QtJ+pZ0z0pU5Shuw8ilIDmKzQ5RBAYgikopLY73KYvXyQ+PbNi83392OIAX6IlOupt3Yiy52RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k2Wlt6nqb8tyQDXOO68GI4DsipNfkCPbUZoBD9T+1R4=;
 b=lrgF6VgcbzaCiEz3ZzE5gRc5ZjYc0OrkBkCuKXV9Je2SLe5hvw2y2pzy2RfuuNxuo1CbZXHD+7c0DcGRnGIEpbaqk+yQrWrOcAYOV+AY1mQxykjSEmlWek3pr7DBSdESYV3gRQL7JnawfyqGgLo3N1orlbVruPDrLgpB8QhL0dM3XfwmIL7SQD3LmoGoEZFZfmx5d4INqN4AtwWVLCZOldcXppU9jkHdrLPD7mFIUXZ53JGDn9/8/cDlXswGkjBqUzaat5ZtBKZCCKFf/fEfhtMwDPCquOGZLQcn1kDDMQBM99Ollm0vstjQCWsWI0CDNwY7gVF++V5cYQTCIfZQNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k2Wlt6nqb8tyQDXOO68GI4DsipNfkCPbUZoBD9T+1R4=;
 b=p5Yo2iBxCg6UrER0nCswzuMgGhaQRMVE0+ltTc8YIhlrSb+SnrOd5x2eLNax8adjG16ibaWCJ5c7vQ5inlwidiqbWnss/pkx3W8eV1SY4HeBbJkqhK9xDQ6e4tNNETtpCW/B+Ykwn4zedfaTWKE4h3j8YFKE7IsQZNdZPh+77aA=
Received: from MW4PR03CA0149.namprd03.prod.outlook.com (2603:10b6:303:8c::34)
 by PH0PR19MB5622.namprd19.prod.outlook.com (2603:10b6:510:14d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.19; Thu, 20 Nov
 2025 15:30:31 +0000
Received: from MWH0EPF000971E4.namprd02.prod.outlook.com
 (2603:10b6:303:8c:cafe::39) by MW4PR03CA0149.outlook.office365.com
 (2603:10b6:303:8c::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.22 via Frontend Transport; Thu,
 20 Nov 2025 15:30:31 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 MWH0EPF000971E4.mail.protection.outlook.com (10.167.243.72) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.9
 via Frontend Transport; Thu, 20 Nov 2025 15:30:31 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id CD187406556;
	Thu, 20 Nov 2025 15:30:27 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id A316E820273;
	Thu, 20 Nov 2025 15:30:27 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: vkoul@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        shumingf@realtek.com, lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v4 05/13] ASoC: SDCA: Add comment for function reset polling
Date: Thu, 20 Nov 2025 15:30:14 +0000
Message-ID: <20251120153023.2105663-6-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251120153023.2105663-1-ckeepax@opensource.cirrus.com>
References: <20251120153023.2105663-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E4:EE_|PH0PR19MB5622:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: edd0b5ea-f6f9-4def-3196-08de2849bdda
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|61400799027;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Es07wdSFS5IiJoIVqqIJZ1i8tMeY6K5B5YgWbq9spHYc8pmA+DHA/is5Y7eu?=
 =?us-ascii?Q?49RBikrHTlnfp9aUFKB53RTNeOIMr82VfGraNpbaiuYt3agZ5zQoUbz6VdAO?=
 =?us-ascii?Q?6dXE0dqFLz1qZxz9haG8NTXbKVpEVQcFJFY/0Qd2mWoCfEaYhJY/6+2hOXuE?=
 =?us-ascii?Q?eyTIS471xRlbkAq9+3tOMmVIXoGD3Q5SZF8755Sve4h6zt3quH1dd/1yGxoB?=
 =?us-ascii?Q?A/EwT4XzdLUX6a9P9DSj6aLW3SihReZ1a48ns2mUcuuqrrpm4A9yvdOJSlVf?=
 =?us-ascii?Q?4GI6L1EI9RbyGOA9zAwmf/qNsZUsffPP+wygnSOh7yhBrMsuOEbypOwWQd3d?=
 =?us-ascii?Q?/U2ex1UVPnTXSwAtapcBSJBVR/VTPzlSbxpUsPGnzW8CKlihbmrmwyWNfwu6?=
 =?us-ascii?Q?M4WohND1mF+J5DIEM2+nTVWgUZPlZ5AiWNe5M0CfTvQzbqXCAQtowwhzC6GD?=
 =?us-ascii?Q?xfl1bQ5SS71zNSQX32uJlVaa+W4kdp819kcDbIzTFZW4xESEfD3rE2FWhdz/?=
 =?us-ascii?Q?vdYdHvxqMGD2gFAOHMZVvu9eP0Tc460z+sSNKMl5DxAmw1A9Rztim+buW6Ts?=
 =?us-ascii?Q?vcJ65xtZY4XOLn+vUfSj58N0zieVtJwSVlOSUrOgGItYSDb2uBDZJs1K/5k6?=
 =?us-ascii?Q?YFhHwwvSWWO+lAnnyhQxNsCvyAW05yBj5aIqqhpgtuN4VgVHtyVuo3lp+xnE?=
 =?us-ascii?Q?xQFdshOgUle7YeSkb6n6Jzxl35mCD1DTqtaBQOuh7UWohnYqITcd3kghoPpr?=
 =?us-ascii?Q?YPDQuDAxR4+gx4ND0p7+nn4MQfdDNQyd9yopErxIYgrQub9+3xbHvLTmT7xg?=
 =?us-ascii?Q?HwGBxAW+L+PYQnR1nxlJdb0bongRqbDnKc05oaTgv/EhWtDZQ6i20oDsHCaR?=
 =?us-ascii?Q?cRoguXfhlXFAEW4LJ9P4yNTivlU3qgIS9rVvL2G9OMSLexj7+osr4Glwea2h?=
 =?us-ascii?Q?9RE/d6w3H/JVvRHzuca0xm1n8foE7gbqbnsUnfPJCtCO0zm6cST0+ve8YDpr?=
 =?us-ascii?Q?7tw9e8CG5NZA8EjUVDbv0uwWVhKiAvKlJ18cfCrJzxEGA9T2Vq/ySg/tJKec?=
 =?us-ascii?Q?8Mfez5CnDbWVENmEMU6gaWtuxaUm5LFkB92c2bFECTqkp5NKYP+vQCAPlmdC?=
 =?us-ascii?Q?Z6TeLSL70lY18ZPR+t5p+mh+SjqWaI8QYDRWzx55Dqw499Kg1zEOPgoNHe/0?=
 =?us-ascii?Q?u9C4QwSnXGJaHP4163v/+RI9bJKfpbNaWDOaauAhaQA4qIHoJoQJTdQSYxbS?=
 =?us-ascii?Q?DjKKHxwxmqQBYNyswPNSwEKqC8JUL5yl31Ccy5mrtXV/4tDYA71M86NAv2jE?=
 =?us-ascii?Q?HQUNJJn7fcYy40TES2JFrk0V+tBRQHJqPv1+PCy21d8Vb9z+mlUENHPnzvdd?=
 =?us-ascii?Q?bG67m0/YT+iWY03s5Wl2jYGp61eCne+1U2ITW/uhbMqo47KV23c5EGp0EReV?=
 =?us-ascii?Q?H+7D6R2S6A/XnL0m7qcnnQdDMK4pvPneREp20gC4wKiwm/Nt40QkqNR+1yba?=
 =?us-ascii?Q?lgGpSx0+tixZk3nThKqTKOR1RRY7cfBqfF1qhWO+SPatU+iwXWVzuL6Sq5V+?=
 =?us-ascii?Q?E9lzAl2+NWGyocFc/mA=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(61400799027);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 15:30:31.2883
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: edd0b5ea-f6f9-4def-3196-08de2849bdda
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-MWH0EPF000971E4.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR19MB5622
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIwMDEwMiBTYWx0ZWRfX/0L+AJv3UJ1d
 Aa3tWyajm541rmO3N3rjJ3z+AYvH+8JgcuzzZ3jUQcTY3kAUoWFZ7GldlnSgHuqTCCWZROztg4m
 0ps4eMsr4qQH0mo0MMc14mNO+VcivsHQrMUXCS8Hgwa6N3RH1ScL1jl1nJqoV2oeUZTRPJJTHzn
 UKxKF6qoMxywg+kzWK2DI52xyYCr3VGeX9nQ5pKDcIQx56d5h4Lah0p2x2qRHWlDwL0HbB1dtI8
 k2aCK9CmyCT369OKiCqBdoc5yUgubc299IQFGFlw5gRKI1fYii5SHYG6m8o3lcBPJ2P22HzHfXb
 W20ewtFHpmkTMeFQIakgXHRrjvAhLlkS4lO6IoLq/M+orN5GTTfxSoGRTyrYP202g0xHdTX8vJ0
 45EqSLZgB0zMSWkhk0xlFhFlMraI3Q==
X-Authority-Analysis: v=2.4 cv=XcmEDY55 c=1 sm=1 tr=0 ts=691f341a cx=c_pps
 a=1IaZlVIhgsmdv03QAtF1KQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=6UeiqGixMTsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=QyXUC8HyAAAA:8 a=w1d2syhTAAAA:8
 a=Lh6zoiIVFdfm2JYYOeEA:9
X-Proofpoint-GUID: AwdKRLXEcFwlecuPUiQk8sn5LdxC6Te4
X-Proofpoint-ORIG-GUID: AwdKRLXEcFwlecuPUiQk8sn5LdxC6Te4
X-Proofpoint-Spam-Reason: safe

Add a comment to better explain the function reset polling rate.

Tested-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Maciej Strozek <mstrozek@opensource.cirrus.com>
Reviewed-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Tested-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No changes since v3.

 sound/soc/sdca/sdca_fdl.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/sdca/sdca_fdl.c b/sound/soc/sdca/sdca_fdl.c
index 6568afacdf1a1..3180ebd07c400 100644
--- a/sound/soc/sdca/sdca_fdl.c
+++ b/sound/soc/sdca/sdca_fdl.c
@@ -51,6 +51,10 @@ int sdca_reset_function(struct device *dev, struct sdca_function_data *function,
 		return -EINVAL;
 	}
 
+	/*
+	 * Poll up to 16 times but no more than once per ms, these are just
+	 * arbitrarily selected values, so may be fine tuned in future.
+	 */
 	poll_us = umin(function->reset_max_delay >> 4, 1000);
 
 	ret = regmap_read_poll_timeout(regmap, reg, val, !val, poll_us,
-- 
2.47.3

