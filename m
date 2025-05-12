Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2359293B6A
	for <linux-sound@vger.kernel.org>; Mon, 12 May 2025 12:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747053796; cv=fail; b=dZC34LYVJsic+6OcmmSppBcHtpijfysLdzo6E96AZzYj5QW4+VAwB4M2RebRTP27PCKGx8aPA1pQlYJZwObzSXUDsoaFKfLiY3B2qiY2VDRzxu1l7kdJu+yuiFeLoBiMWVrbVvpMipNvrvDWOT3xESWNzx+we0QSgu9QAeOQKPk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747053796; c=relaxed/simple;
	bh=TBVYj+NHiqT7KAhU3lH0e048miLU5dTLPgq1oSlOApA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HGIc1QNOkfDMtDPPHy9CJmiD7Cx8y4GFqqr+HzXPEnropOpRY+V5Ni8zROQnabYLWlbgbEXmkdV2WKYY1V4J7D+GaLHmn7aYeb0hIPczVaQrTyoiqBUdcZO2euWn1TcyURVQLIp8ZZ+uyFhPsB1GFvPfGnr5IU3kG1LtWI2f778=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=HFLXGA28; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=bG0tDZto; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="HFLXGA28";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="bG0tDZto"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54C6905G001866;
	Mon, 12 May 2025 07:42:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=dVJGw1GniGQ7nQCaKZXyhT4tMqL5NY0oA5duRyPoTlU=; b=
	HFLXGA285UmY15HdcPR2jxY2pHQR37gwd80rSxuMOrjoZaaJYPB4Xhg2B30kt3lt
	sFAZQctoYC5ePnEAaK6/lsQ7EDDt5GhlUJN9/C1sFJbqdK8pAKXwxuU99jEA8OEZ
	Fvr+U+P2EdWXZVVlXnk7mQlkEX32cH04jNld3lZWDtyD3RJMhe6Ims+BP8MLdAi8
	/FPYFko8Fz1IZLT10DXaVbjFmGqKQQ7PaWgcy3d1b48nP/nt1bKusVh1HWawOAHZ
	1P4RkbIOtVygY6X00KqWH4e9bhVgxysiF656jSN1hLe2cxk+ZKnidd+wdgw9Dvnc
	R21kjtf3uAXWmHLx9mPfLg==
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2040.outbound.protection.outlook.com [104.47.73.40])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 46j37ga8n6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 May 2025 07:42:49 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o2tCqzxfyIMffcSRpXrTEakSuwSWYXWiWxGky31quenxOWc2LqWNVrr+WVcQ7KPyrFYbIJCUCIoq80GDiY5r/Xt0D27XLVCmjA0GTEjWwvY0nDbWenqS6vCeRDasWFjxJqzRDXbJqKrRGnAYaeNVK1jKa2HMpne5hFISsyorDeBfUfZUujOugDh4sAZKwqLEgq8gAvsqFlfP0lKKibq22jwl0XvYr1MAif+BrnKF+jH2yFXuYx92KEtSAtak/sfAxkxzUIAiWL/9KGRCRH3apNh31ajWrjDU91hk6uvJaX/VI5a8dW6GhIBYk/xxDg+TxIj1CKTDu2yQxOaZbYlURA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dVJGw1GniGQ7nQCaKZXyhT4tMqL5NY0oA5duRyPoTlU=;
 b=BrbmU67GeKrqbibxex4suy59TF9B6mE15rtYnLtrInbkm8HhpFzhlnHt1hfnEddJ+urVAUVRS3MJmnnRQLl5JPQXvt1swJOSHcKSZCnQdloIk5NnI74KRAQ/5+e2u7HoXn/o8J9yVMvd+UA6SGhZl8iEDpcFK/wAP11UrtcJmpJXdQgGTXndZ8sieAYIAInO3ZdUQ3SxZM+kl5QQsTWIyYRuizOrbgrNgvj/MuBI4KkkKCVgnDNCtE186yk967KVv/RAse0EoCSxBV4vUyODOh/7ya4oDlxRXRFQK2VEK2oUs0gfSrRBApJsK+ytwomhOONeDxI9RgZ3USF7ne+jLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dVJGw1GniGQ7nQCaKZXyhT4tMqL5NY0oA5duRyPoTlU=;
 b=bG0tDZtoTjicgTGdMKOQj1MgSI4fdl6yD7pPL87huFYTVxraJ9aWbMzy07WVCFtwbyzhk7xcQoJlCdyw3q9esZuH91Iee4REsdKDW5B1Dc8/bh0mHgwbZw+k151zo+qa/etO5xLyCurtyCwxk2braSJK3fV49sfuIo8HkMS7POg=
Received: from CY5PR15CA0197.namprd15.prod.outlook.com (2603:10b6:930:82::24)
 by BY5PR19MB3906.namprd19.prod.outlook.com (2603:10b6:a03:224::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Mon, 12 May
 2025 12:42:43 +0000
Received: from CY4PEPF0000E9D1.namprd03.prod.outlook.com
 (2603:10b6:930:82:cafe::ca) by CY5PR15CA0197.outlook.office365.com
 (2603:10b6:930:82::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.29 via Frontend Transport; Mon,
 12 May 2025 12:42:43 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CY4PEPF0000E9D1.mail.protection.outlook.com (10.167.241.136) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.18
 via Frontend Transport; Mon, 12 May 2025 12:42:42 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id EB957406547;
	Mon, 12 May 2025 12:42:40 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id CE52382026C;
	Mon, 12 May 2025 12:42:40 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        peter.ujfalusi@linux.intel.com, pierre-louis.bossart@linux.dev,
        linux-sound@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH v5 1/6] ASoC: SDCA: Remove regmap module macros
Date: Mon, 12 May 2025 13:42:35 +0100
Message-Id: <20250512124240.799509-2-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250512124240.799509-1-ckeepax@opensource.cirrus.com>
References: <20250512124240.799509-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D1:EE_|BY5PR19MB3906:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: f3d843c6-638d-4d43-7af2-08dd91527cdf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?zEfdhxJC+LDyn1zHHVD8myLqcaFi2MiRhNIl28pIh4M3kgjHk0LK6bRDEjZF?=
 =?us-ascii?Q?kmDgkA41oXQo8jIivq3bcKQ4Jb/SjVYdybM+KKYcky0Q6b9jVddiNOZgAnRs?=
 =?us-ascii?Q?ecyKu5tLgUIB/DtVPLFgPeJYtD5tQLUKhJ3EX2FaKeI4R6hv5F25oZGLV/vR?=
 =?us-ascii?Q?LkDfh43n6+LPdJzLsmI+fwn7ITvZj1bU3I8S0XBQBkImTS9FQmmcRkHwcxbw?=
 =?us-ascii?Q?qnciSJuazQUUS4Ky3V38L/JB9XSAeB5h2HvVI3MphUxsVXb0wLN0ObrnIdrs?=
 =?us-ascii?Q?fLkWRfNl8Ioamo9ZBnwwG5k1j4YozUFb/oNWz7phYohlCjfh8eE3qgzlWp51?=
 =?us-ascii?Q?Hh16aTAUhYecp7T/MtT2exc4kHiWVpAPyQyAhN+XZ9uSgiZrqRsjBjhqkJKp?=
 =?us-ascii?Q?j1aW5GvP8W6wLkWSbVZ5xdlL8VK6d/zvusldaBSYt0cT/YiCT7tIGn9C8fIu?=
 =?us-ascii?Q?4DdkAZv2KLSxl8AuNwMF13ZYj7LvJBzBUkwM5Ith8KyILOVgkNNMwNW3Admv?=
 =?us-ascii?Q?pz89ft5mIrnCDlZHl08G0Szg1NQlJF3skJsU3ZE86va4eUkpEPqpLbitIFde?=
 =?us-ascii?Q?GD+Wmoss2GNlJDeBqJyhNulcdPcrB7q04v42RQLPE/9zxavX6WOG3ez1DHga?=
 =?us-ascii?Q?MAccxT9brACBTLa6najAHqsxutB8g892ewJy4+MlcaYLrmxH/YJBsmrog9Rz?=
 =?us-ascii?Q?uvtHerXkn4Dh+8c8g4zHa4Foy9E/aaF7AyPakqX48pdUGyU14WLVozan4Yel?=
 =?us-ascii?Q?7LaHnfQ7TQ5MRw7vq5NsgV7hQze7LuZz0/rvfWa9n+AH+E1uWflcTeRhMvuf?=
 =?us-ascii?Q?rDk+JPDlGZAZsuMUoSYtpFPy1GvgHfw8rboRwF7KtaVjJsw8kqmR4uDk1Rqe?=
 =?us-ascii?Q?LyH5uaMsDq2i0wHYUQ+80fWuP3+M4V0onBO9bzy8NQbbrUZR31+L+DihS7RX?=
 =?us-ascii?Q?0KL9gdyTtYxvP9I/6XB3hXKRBX4VOSWc+uuJP46hoNZP2wJGrxCRc7RgH82g?=
 =?us-ascii?Q?LLKGaEzUX2LM4EmJod7w+nbWqrrDoQfuQZII4+wam9UH1hrHgEU/4ptuoPhi?=
 =?us-ascii?Q?sxRwRzwiIHmBpsMNKQbuszDGsprBd4Yv8N0YoESbcETmvIVt8PTfjfUN4R8i?=
 =?us-ascii?Q?D+7zME4oLZbP+t1RWQQNVd9ulwXLTfD73IUtoU5Zdm1kL4rLyr7q+1JpjALR?=
 =?us-ascii?Q?IzK0TViuF2mJcAUSJlr5UzfCM9Il7tnIy+4jhwvSWgtfl/mrodCZZey6JJ1a?=
 =?us-ascii?Q?w0wI8XuNEtBqy53aZko6kUMvhDjxU0c8CdRQnXHrWfUNqNLV7Ee/i4xl2ty9?=
 =?us-ascii?Q?GqCC92QD0H3x4A/CZHuaKtgp4vQDg5otae4wtI/nImhOgr7W7xBqhzq/Yzit?=
 =?us-ascii?Q?XGSOaMMslWbfnUiy+Ca1bg2TLMo5ri5Ux78xuh/cNyG6JAx7QdtZJcI8iOt5?=
 =?us-ascii?Q?z7rM5+aMcyoqoTPxY0HdWmZqWQycVmvdiZTeaZceq37iMpcjZOT237ft25KJ?=
 =?us-ascii?Q?GV7dPplN/xnkz79GPTQcymOsHGuKesIxRRK3?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2025 12:42:42.1901
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f3d843c6-638d-4d43-7af2-08dd91527cdf
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D1.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR19MB3906
X-Proofpoint-GUID: g3mDu-WO-9NIaeVVHspNwwx1vz9j3_kG
X-Authority-Analysis: v=2.4 cv=BOazrEQG c=1 sm=1 tr=0 ts=6821ecc9 cx=c_pps a=CmjB6Nkc3E8pi8fe8piFzA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=dt9VzEwgFbYA:10 a=s63m1ICgrNkA:10
 a=RWc_ulEos4gA:10 a=w1d2syhTAAAA:8 a=r-_3kUPhiOb40eG2B_AA:9 a=0lgtpPvCYYIA:10 a=BGLuxUZjE2igh1l4FkT-:22
X-Proofpoint-ORIG-GUID: g3mDu-WO-9NIaeVVHspNwwx1vz9j3_kG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEyMDEzMiBTYWx0ZWRfX98E2il5PRRx9 GY49O7IIIyoS4Dh/plt+QN5c5qVqvu2/WgZxmQu+cRD6cbNwYrXDjicHn+LNW4if7tqQudUzqS/ O/AU3T3/7/vaCzMPb5JwiIwBM7NExFETopl9KY2Fw2+7s6M5dzfetAdvK/bP0MDfXlUg5IVPKqC
 q73M9waQZAVQXCktB/XuP7jjkxwSTRYr1sb2VizAu7ntdENWgS0NfXY+nSsYj6BCpRx9AHGAcN1 xfQP8LOEtvmLrizeAMBRHFYMwd7LDde0UvRJTKdkTXob1hh86eyudQBaq6M+0AYaI7vqAd6BwTQ KEUFvZ6whBjIRjCbThbst1ZnW9/b7IpBbEinITB4C6MpcDWZMCEkpyZnEoCvzfgX8QRuZuTbNKQ
 4FZs4Fnc2GDf3VMBBWpGZXFUptDarYz9HiTdqFkEalMCCe8YhGKd49jGwq2Kp5T1uxcPnR2x
X-Proofpoint-Spam-Reason: safe

There is no need to include MODULE_LICENSE() and MODULE_DESCRIPTION() in
sdca_regmap.c as this file is part of a larger module that already
defines these.

Fixes: e3f7caf74b79 ("ASoC: SDCA: Add generic regmap SDCA helpers")
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

New since v4.

 sound/soc/sdca/sdca_regmap.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/sound/soc/sdca/sdca_regmap.c b/sound/soc/sdca/sdca_regmap.c
index 4b78188cfcebd..66e7eee7d7f49 100644
--- a/sound/soc/sdca/sdca_regmap.c
+++ b/sound/soc/sdca/sdca_regmap.c
@@ -316,6 +316,3 @@ int sdca_regmap_write_defaults(struct device *dev, struct regmap *regmap,
 	return 0;
 }
 EXPORT_SYMBOL_NS(sdca_regmap_write_defaults, "SND_SOC_SDCA");
-
-MODULE_LICENSE("GPL");
-MODULE_DESCRIPTION("SDCA library");
-- 
2.39.5

