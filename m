Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96C37316900
	for <linux-sound@vger.kernel.org>; Mon,  3 Nov 2025 15:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762182555; cv=fail; b=lkbyONsiCGE0tVf35YcR7wvQ+xn5rCvdrzbsYgfuLZRqXhsU+OJ9nX4klMsBj7FCIK/jqBeZqNdmBjg83ms2OgPLQaVM9kFaBj374oZ7/OLvyFi4FcIGnlMdW1JhSpbDzIY8hNcYNFVbJzWd/Znmbwe5+jHrP8iNNJ4EXXEgXrs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762182555; c=relaxed/simple;
	bh=B1WaCAuql4vBzWkla9YCtL3+/ronD5s0x4zfT4u8L9w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KIxrkQPf7e7NliRSxC/MwH+1dQJ7ulsMox+FQ1HC3avlBqvOIeROtChHIZBcV+VQa8a/nRaI4Kwn1JMho8qMSwmQEu6oU90GRVbZg4jvD2Intz1WncDfpEe9Nhb7C+dQaeS5nmKfIj7epo49DDMgRCrj0pxlju7xc865DCm5stQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=dhN+llV8; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=CQAPCSw8; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="dhN+llV8";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="CQAPCSw8"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A34R0aJ2395635;
	Mon, 3 Nov 2025 09:08:22 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=g4RAgm6Whu4qUYu8fDlwXssDk50kKs48sLklEUTlNe8=; b=
	dhN+llV8RDrpDB5n9mKlX6lIQgpYUG+JseT6hYz53UuI48uXjX4MsYrd9VHoLCNn
	wEJh0QneNM3fr19epT61K1CNE8PPw9J3+9OupiAuavAM6vyBsZW/I8DwVds3YL0Z
	BSd9oEKCC5xLB2hTFqgEHEeHZDik1LSoiBU6y7jqxym/Mmk1Od+sXD/kYjEWKAo9
	k3iI8HDm5QlNXa2ZgV+Wh4evmyqprKWJsr9szuNUeZ1GVOVY3qD9ThSO3RYlHPvO
	iBt/bYenQLc1hnowqyL4A6js4JWXF7830Su0PG9iBUOhPmxUOLvhT3iNRzemBq8i
	xTaVyfAMZiqGogqdY4v+nQ==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11022092.outbound.protection.outlook.com [40.93.195.92])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4a5fkwt69p-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 03 Nov 2025 09:08:22 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AhVOQ93DXF9wXXUmo8lN/ZnyaqRFqt/3yVo7lz1cH5RmFGPYh4KSzBZjSk0DYIiXAReE4B9zS5TUj76hBNKHMVX8XKwxd29p3LVFPXZgyp3cEQxxkGaH1oXKUqV2mTzIZMpn5wH6M8EHZpnSD/476Ry2hmHk0zeG4QGRsZMSabnJFQL0hrZVnHSjlIOiONrY2vyd88gFIuNECbzEPdvfAQ9ruCO79GY6z5R9ZUSXL2aqKKU4s7H71ptLWSKsQRsKxyPUEiMjb+QZS2JXXM0/q8A1fDK7gOWy/eR8THnkoWMoeZBp5tNM5R/BhdWbC6o4TNMpFSOrYjEemaAedkpz4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g4RAgm6Whu4qUYu8fDlwXssDk50kKs48sLklEUTlNe8=;
 b=rIdRy8VKbciL+DQyvqySTMc84TGld0jhgU4MEsOieJbJ7RUi+wSyBfROEnPayLlnuPranIObB3qHR2SffR711fr8nZ2OK4BsHRAQF8mRUf9wbRqr0KulSbTYiCVXrfMXvY96hMQhPe3RhpHmK8ndUXaV0PXNxIlYylWBNSV7y2VZSE3GCHL6gJ2e9JI/eU3zW5IAhCHH6Tu+y4lpeymL0HXkk2EiCm7w3CSZNB2pN5JbRICEV+msUOvBMP9u99N/7JkzbyvGUo+DW32KxupdPrg+Zz+bb3ryMczHDUxTX2ofdafkxuYfYLrneMpbHXtiXMdtt0xtl6U7fuKXGzpFpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g4RAgm6Whu4qUYu8fDlwXssDk50kKs48sLklEUTlNe8=;
 b=CQAPCSw8IZS7rSqD3lssCsb2WpYSvvHKjIl3t4I3WnHwogyVEqg3q9v3x8tjivd2Ukjw0+lthjI1B9h4Rwv8mTcVFkcaz6HG/iUWb9GPbPP2OK0+8eYr54WD27rs8uNQTV3FIp76aIDUuI7rR6vLb5nO/A/hQXRyWDAKqUuq5T4=
Received: from SJ0PR05CA0043.namprd05.prod.outlook.com (2603:10b6:a03:33f::18)
 by CO6PR19MB4769.namprd19.prod.outlook.com (2603:10b6:5:34d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Mon, 3 Nov
 2025 15:08:19 +0000
Received: from SJ1PEPF00001CDD.namprd05.prod.outlook.com
 (2603:10b6:a03:33f:cafe::71) by SJ0PR05CA0043.outlook.office365.com
 (2603:10b6:a03:33f::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.7 via Frontend Transport; Mon, 3
 Nov 2025 15:08:16 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF00001CDD.mail.protection.outlook.com (10.167.242.5) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.6
 via Frontend Transport; Mon, 3 Nov 2025 15:08:18 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 2D1C1406559;
	Mon,  3 Nov 2025 15:08:16 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 81C34822542;
	Mon,  3 Nov 2025 15:08:12 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: vkoul@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        shumingf@realtek.com, lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v2 03/13] ASoC: SDCA: Add missing forward declaration in header
Date: Mon,  3 Nov 2025 15:07:58 +0000
Message-ID: <20251103150808.4015208-4-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251103150808.4015208-1-ckeepax@opensource.cirrus.com>
References: <20251103150808.4015208-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CDD:EE_|CO6PR19MB4769:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 0dc89271-e026-439c-a150-08de1aead289
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|61400799027|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?LVihiaqvzDF5qwV1Q+R1zW/6PaiPOS2+LlFeMXe/0efvNy6QzBmw6hsVmN3H?=
 =?us-ascii?Q?cc/Obc+CNeBhuXcEwb6j8sJkZiGpQtdl3b/VkXPcLZCMFtnWc+SYswnaXKvw?=
 =?us-ascii?Q?NjOJzzrWSxbwG8R02nbHQ9s6GKxfNpchzlDHKwikDzicv8BCNwtAuLsx/gTV?=
 =?us-ascii?Q?qlhSDIB6I8kyHycxInokSfG7zQmjk3b6f9T7JOVtHmngjIofw0KMDTzNz+nw?=
 =?us-ascii?Q?89bfE0sQ5MINKvxyiB8X7+lmm0CF3ESub3GxlpJXXjzGoZQK+uK+O/gFT/40?=
 =?us-ascii?Q?1C/Mo1QLF986mVdAjU/1pOptwq9eswOO8wnjjn2m+JjpmvXsVwQRs3/rfo7l?=
 =?us-ascii?Q?sNzs8u2XCJGPLfL/xWPMT0kvhSIq2mjZK/1ovoTxZf2eVJ6kI9RKSOuAKyP9?=
 =?us-ascii?Q?E5YPBD6NBn+F6ZVTxeLEQG5cdZBPSob9XMPF65inwtD7+SPla11knZO7e81d?=
 =?us-ascii?Q?KekQDbuV4YpDR+ThyHd43me6qSjCeXzwRp19fRW13wMlqNah//XmbL5Mdqyr?=
 =?us-ascii?Q?H7Z1C4cm9/WXbRD2xDGmi8RvXNlRJbfXILfwfjfLJ916gecep2BlLYsa1LCS?=
 =?us-ascii?Q?iZzxWQEl7Cyb1Jc+C6chVVBxdPP5C8/5+AL1LhDM2O1kt2xe1C1JylpPMjA4?=
 =?us-ascii?Q?w59fgKqc/fdAXdfm+UjVPpq8RAj27JB+LS4Enp78Y463inqodVOMNTO/k5as?=
 =?us-ascii?Q?7lJCRPTMPgId0cEbFDJXvVMUj2/gzFYqmXnKLf8y0veINgxaWGjzwn8CI3mp?=
 =?us-ascii?Q?8/Va6ggqF/US5ZL4VX+VCRBJAfJupEeEgtFwkM+ale6pHqSmIYpQgjZX8P/u?=
 =?us-ascii?Q?xKg3rsITbq19PzO2CNbMJDXOfhZqRJMESSxkp3HfpKu0GIiDGQ58YyPJ6W/O?=
 =?us-ascii?Q?A6bDEil7HPBN3BpFSnjfk6aQlnuNJajUlByzclwTgzJ3utkzHgkgrE07wt12?=
 =?us-ascii?Q?U9UNWFoUXYUjmKaJUZl3D0OrUPD5m0KdCMwUx92vS4/L05ScFwsFMO2CjAuw?=
 =?us-ascii?Q?BR9jl/p724OTui/BOAYzeL0dpqtbPkxrj9Xl6vcjEFpnDP2Ni7M2gY2Etkl+?=
 =?us-ascii?Q?1qudGa8FUbLAthRVGoy7T7lcgJmUI6srIyyawOH7jEPTffXKw3idEKccUT1+?=
 =?us-ascii?Q?bVjUhhGR9g3Ycpxz4BQeDAhpyu/j0WNH98koknvLi0EunPpBGkyZGvOjYM1W?=
 =?us-ascii?Q?AbjJSPVLgACX57WUEU1qQ4IfepHlThfjG6R9mS8gdz1xy4k1j87cNsGVfJpY?=
 =?us-ascii?Q?mYgZCXoxmVZ/WyunxFCkihH/4TU0pHrYxCyyr+X7lA+CO6BJ/Q9U1xcMIa/o?=
 =?us-ascii?Q?4qnXlax0GB7nINVh86sXhUlEKuFbjwOqIta3HT8uIy9CylXZ/uSzWpGtymAE?=
 =?us-ascii?Q?uLDVT0CKzXlsil3jJPoLPTP5OOlsxMvVw2IygV4/YLc5YybXn4uun+jKrPJe?=
 =?us-ascii?Q?eAnjnc6ae+eEl923GxKQy5/pk+iwVIL5oP4gf/A9RudrS3mXBTx5638IoUqJ?=
 =?us-ascii?Q?VM1rnEp4xnY7IWYRZ+oQ+ZL1x9UkGRvZj7qwpm4AdhJrzfmCoeKThdQB28Lu?=
 =?us-ascii?Q?LRhCBMr3yESBfyNojCE=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(61400799027)(36860700013)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 15:08:18.6737
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0dc89271-e026-439c-a150-08de1aead289
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ1PEPF00001CDD.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR19MB4769
X-Authority-Analysis: v=2.4 cv=donWylg4 c=1 sm=1 tr=0 ts=6908c566 cx=c_pps
 a=Ac3+gfpr/4H3rlTWwaJ/+g==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=6UeiqGixMTsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=w1d2syhTAAAA:8 a=xw1g2quPM-hktvGfwDkA:9
 a=zZCYzV9kfG8A:10 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: 0s-luaCXdDjlxrZ2RZf9CtZ03F_K9BGw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAzMDEzNyBTYWx0ZWRfX6vHnYqe71imf
 WCeU/B2Scw9GeOlJRLTOfYmjSEe1061+HiZjI0K6wQHVxX4R05zje2b0xldy5JL56aUj9uB8+6A
 A91+uYfMKcs45LrkRGBpk2VUieRyYBexruB/zLIDMUAD57g9U77Ds+LA5+FeUohOuEo0V/bGgsF
 GV3GpLxPHOSpdzD6EFZYyQJf9owxp57pxcmsvbx+uNDbRNa5qWpu8QQ0mdMtbq8ENVbYaLm9jYi
 EY84H5bq/tufwUjMuOmiXeBws3omAnxfNxxQtX4ETL3s9lgXlG/9GbBh/3dw5u18Qpce/u1EUy9
 V7gYjcSTUvTzL84M1OG1HRKroxR4RSw3S0rwGxMXghHnd/SvrtiIvnAB0tIQ21V2D7hu7a0Apf8
 z4vbXJ+t9kGV+Av0j4fqqWP40VzBjA==
X-Proofpoint-GUID: 0s-luaCXdDjlxrZ2RZf9CtZ03F_K9BGw
X-Proofpoint-Spam-Reason: safe

The structure sdca_function_desc contains a fwnode_handle which is
undefined if the user doesn't pull in an appropriate header. Add a
forward declaration to avoid this.

Fixes: 996bf834d0b6 ("ASoC: SDCA: Add code to parse Function information")
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

New since v1.

 include/sound/sdca.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/sound/sdca.h b/include/sound/sdca.h
index d38cdbfeb35f5..d58d602212771 100644
--- a/include/sound/sdca.h
+++ b/include/sound/sdca.h
@@ -13,6 +13,7 @@
 #include <linux/kconfig.h>
 
 struct acpi_table_swft;
+struct fwnode_handle;
 struct sdw_slave;
 
 #define SDCA_MAX_FUNCTION_COUNT 8
-- 
2.47.3

