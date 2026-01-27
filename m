Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2A4D298CB7;
	Tue, 27 Jan 2026 17:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769535324; cv=fail; b=M2OBwHSCGtrCT4+Zg5+YAztnGwBRyM9RCDLnneghdVtJjSsh6/dRG2D6DFLsexbi8+Gr/oqpEIVG5Kn0XIXoPiX1uq/EKfvYJE7F3k7d0924oLU8ecdVZXjlMhKTMbwm+JFx0FCBGMFLEyMVgH7BNXHpDxGeZCdRv1Su6Ex/8Xk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769535324; c=relaxed/simple;
	bh=CNXWogO3lCEj65fF3oxNpmP+2igCtuE89jK6D3UaZbE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZbZijE47G8Ku0EA296SMvlkDiFDhnHMZakQfloQFet1/EyhXwTDW+t8ec3iN0C/eo53bSlWuP1S4ZCryDiMceBzl7DGQhYoK/FVoJj9ai+3A31jZ9Xd+Uzk43Aw4C/fZHHWCdZ26jEe/eXSKS/qAaUkkbNdJNChT/fpMxl9g2Ck=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=ZdtfaM8S; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=mdJRbXl7; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="ZdtfaM8S";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="mdJRbXl7"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60R5wLqd002930;
	Tue, 27 Jan 2026 11:35:17 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=3fvAPJJODqA0kTDQrLEXFuwsEIzWoyzsb9+eolu5doc=; b=
	ZdtfaM8SqQKQbQfqSrevPYeUbDwm1F6B8ke1FnxhLxTZEeHJpFqMOPjSl8RHVFkb
	FvyyrQ8GE3AWPHqa32RGLaLT+8WERP32UCoWW4GZHqtuuHg8sXbCyiH/bBSiPoja
	6X75H6fAqNzkVgsqWR/356TsJjdhdopTv+KBqmGXgDFexXTr4Vw4mxbdymoD/wYi
	ejbtXbN2WA6V3z1A8MKWQeM0bAPuiaWCn1nuX6AI3XtWJnNMLcJ1Bhhtzk8LWbiZ
	ddTe0aci9SkhAtvOT5ZymfsytJe3Tnmto7UDyLRU1MjZ4KhD0xGjweEGsk85nJbZ
	dVL32UVAKCvZMzNPkif/Qg==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11021110.outbound.protection.outlook.com [52.101.52.110])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4bvvc037cr-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 27 Jan 2026 11:35:17 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BC1y8pJPGbjJBK9+EdmCKgNswPMLGzvWNB9U0sgPt1JX3MPeLXF1qKHUOtl2zI27YIkWGq9KhgYsKeNqD0CYn5+L4UUBReGX7wmeZTrjKfIVMHNN7k/PQ8efyiA/UNFC0DS/TDKcMPXls9Hqv7WVYo8oMkHDeZ5y8KHWZ5laBBPSwIL5RB9J3S/llNuNkJDd1vkNRdjhBrs09FLDLu5r7DAgJegYhPrqY0us2LN7PU34Z9+3+46Kv2kgFqxBUgGyxqcerfwFsKoVXWRCMSawVM+HILy6kwqcZybKMo9W83HzgGp3xBKnJpnqLSyxFeHgyTz9h8jOaOvw7ZiU7sT0MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3fvAPJJODqA0kTDQrLEXFuwsEIzWoyzsb9+eolu5doc=;
 b=KSHbIDP5CZ1JrFcg6fBK45Gdz4Jr2NmmNJyKCmCBSmLxe3074zIUvXUFrcF3M+3FzFWUSwuslgIdp4mNFgdYVGBbmVAytZu8HZApzjXcrzqf7NSMnB789CZdcizMT+Luhl/bhSo2BBQZe/sp+PGgE6kvasaWGlBzcyk48nc+CyBLR6fP7vn2dBMB8vrpan64DNbIZnvQo+VHAHaXg47T3Ow8zAY+K+TdJd4WLbHPty3Tg7/oOuLId185HJBm73g2zrQRoNl00LVZKvA6UpGAWp1iRJFNq+bxlSERNcCrJh5UysngHlaiibru+r4i/v21Be4mopp7R4wGrUXLtkpZOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=amd.com smtp.mailfrom=opensource.cirrus.com;
 dmarc=fail (p=reject sp=reject pct=100) action=oreject
 header.from=opensource.cirrus.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3fvAPJJODqA0kTDQrLEXFuwsEIzWoyzsb9+eolu5doc=;
 b=mdJRbXl74cqsG6fvRe9hOT0d2f4OZooYo0vwpZwVQMqJGP4FKmCMD4Xp0PSujlXf3lDwDEHKPDUnn1W1ql1UOr+0zxtSFFGt2X4OHOxAvIBNNA/T9O0y2iAQ3wfQoynnaApa04ku0rY9VvvIA9qduSCnJc3CDApFEBcaaimoEeA=
Received: from BYAPR05CA0027.namprd05.prod.outlook.com (2603:10b6:a03:c0::40)
 by LV2PR19MB6008.namprd19.prod.outlook.com (2603:10b6:408:14e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Tue, 27 Jan
 2026 17:35:14 +0000
Received: from SJ1PEPF00002322.namprd03.prod.outlook.com
 (2603:10b6:a03:c0:cafe::96) by BYAPR05CA0027.outlook.office365.com
 (2603:10b6:a03:c0::40) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.7 via Frontend Transport; Tue,
 27 Jan 2026 17:35:12 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF00002322.mail.protection.outlook.com (10.167.242.84) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.3
 via Frontend Transport; Tue, 27 Jan 2026 17:35:12 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 7C4DC406542;
	Tue, 27 Jan 2026 17:35:11 +0000 (UTC)
Received: from lonswws01.ad.cirrus.com (lonswws01.ad.cirrus.com [198.90.188.26])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 4C741820249;
	Tue, 27 Jan 2026 17:35:11 +0000 (UTC)
From: Simon Trimmer <simont@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com, Vijendar.Mukunda@amd.com,
        syed.sabakareem@amd.com, Simon Trimmer <simont@opensource.cirrus.com>
Subject: [PATCH 3/4] ASoC: amd: acp: Sort Cirrus Logic match entries
Date: Tue, 27 Jan 2026 17:34:48 +0000
Message-ID: <0a756390dfb7e928246d0f35c611f175e1311e55.1769534442.git.simont@opensource.cirrus.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1769534442.git.simont@opensource.cirrus.com>
References: <cover.1769534442.git.simont@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002322:EE_|LV2PR19MB6008:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 232166a9-f12f-4da9-cd39-08de5dca6d4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|61400799027|54012099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?JGb5+fjNiJRKbSHRe+aQDaUZC+5u0oSawP2DxePvU9qqDFPZQjfZUgqECH+A?=
 =?us-ascii?Q?j51U+3J9pa2Kh9AGR1JdPS1jSSvO86IP+Fzr1T9bRXSopkGa+calrEX/LOou?=
 =?us-ascii?Q?y/FVUq5uPYK9/R5WcFoP1nZIvQGqz6He/Q+5FQdYemE9ybl0PCLd2/DR3P/5?=
 =?us-ascii?Q?myt+7HH1lf3MEBXFl6s36LSZmhW3+mJRGFGNUXWQkrW+GbDBm/QQOs/eFvvn?=
 =?us-ascii?Q?3DcT17+tobUtExaluz68d9X2IcU4t98eQoLjcTw9UWvESfi7+uzl9Zifsx9r?=
 =?us-ascii?Q?4LgAEACdePrbCl7x4JQLiBQsv0x0EKwLmqkdk1+sqeiw44SLSNyXcTPmIPc6?=
 =?us-ascii?Q?ZdbA7QyI0Emt8eB2j07rzgo2rBDy7T0se1NEmcN9zfpbY3hWo/smgQr1IvM4?=
 =?us-ascii?Q?laemRYqB+VFpKQn9s1ReuComztP5EEmb3CpNR5S5n2dEmexnccHrXdzK5OEf?=
 =?us-ascii?Q?g+FHzUTb//vIfOcnlQuKhWwPddJRqa/ZeTJY17HBpLwMVB2KDYuuOdBLD7FQ?=
 =?us-ascii?Q?blMjfKJ6HPi64uKEazFrAK883SC2kiKJNz6fUKysjg0CNg6+eLCEu1dUkZsn?=
 =?us-ascii?Q?/w521tvITP7v9lscGKvje9KXqsKWoKsVoFY/yPuV5tja3cSpX9fWoejh05bT?=
 =?us-ascii?Q?qISBAt90U/zQ8REsLv+sQibNqx7juZZFOG4k52zFZnWsCNDJF1SuJuw6eKvT?=
 =?us-ascii?Q?KInSlWRedTudFc9ngTaMvjhokLX6TlpY2WmSbfCJeMfQDmj5W6KEctrwu65w?=
 =?us-ascii?Q?4Q615hLlwVodHH2XZxj4RMcQt1qgScbzkRnjsvgVpNc2Ft+v08YR1n/SuEyP?=
 =?us-ascii?Q?rvBgcF7YPMbLdHUBaYnwtRWS1HNOTBaAxKcELGtwwmWkmhAI4qPALmLfwwR1?=
 =?us-ascii?Q?JlgLWoNKlZGIk2/okYdnkPIBDYJQ4IdhqoPFalf+Fk4F20AoppDZpglpA7xv?=
 =?us-ascii?Q?dmCQ3HoEeHVAMTnurTUqGlw+bpibqR9dvLyEX54kTxlofwDKEGBvtrl54NEi?=
 =?us-ascii?Q?tOoYbXnddm4p2Lk/E7GgnzJdMca5Y+tVH8vNb1y6hN6qePKCfkyXpJ6NXVtO?=
 =?us-ascii?Q?6T2Xa/TzvvMsrySTbuvNsRTJCSrES42zsaaSncmqO35tJZFejk9YCEhZQK7U?=
 =?us-ascii?Q?qDIAQniHxJ6CBMFO5ILwtPHHNYCvRL8EQTvWfLnr4VD+6+lkM7gxGpXJtcEw?=
 =?us-ascii?Q?3wz9kIuW6MDDYdHd44PAfP/8ZepqvkuIhyhOYm+G6DgZOjqCrbiFNZvW9NoJ?=
 =?us-ascii?Q?tABTnFwAmiOJyoctNe4T+sPsupFFkbIDuYmndKHgH/LU6epwZLpfdBAdUZe5?=
 =?us-ascii?Q?qlXVgATtKY7ThPiE3VIbJlapeQvWCW1qa/WpL/1cqR33VO0TvKlzGnG2cc9x?=
 =?us-ascii?Q?XrD0HsEcHITJXsTra/97adLtjQ1zb8XD3PEbqNtvKQH6f/nBK8FwvVFO8lkZ?=
 =?us-ascii?Q?86z/x5NKt4Q/d4sViP2EPcvTDEYDDH1qSNH9kH1RlU4USIjJ5cZXNYn9Do3H?=
 =?us-ascii?Q?DEctRTVhecn8ARFTGWH2ZlafbmL4/TyMkfhex7a7CRCwWPfnTb4wbB6J/K/S?=
 =?us-ascii?Q?aTqGpFVojrkQGpMke5mVA/lSUBn7AU+Adom+P8kEv7UwqDPuLnSVxFdo7T2m?=
 =?us-ascii?Q?NR+WWjJGcj87u8GqoZ0I/i0PO7NnOPuNoObMUGcFcaqg7mY8Nn2pwvszwDa3?=
 =?us-ascii?Q?zWXD/A=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(61400799027)(54012099003);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 17:35:12.8365
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 232166a9-f12f-4da9-cd39-08de5dca6d4c
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ1PEPF00002322.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR19MB6008
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDE0MyBTYWx0ZWRfX6BHZ0ARUtEYB
 Wy56sOytcFJ3riMUb8RNQ4On0sP0Xml9nmMlUahCMfn79giuFBTgsEzsRODTrHlc+bKAbqwzqeU
 OTeZmhEsHAW/N/20CagD0EfML9yNT+45/mU0p7ttTtTXI1zTffXI7Ln32bAZ79YY7SBsnC+sPoN
 Fil5mojUSQpkaX+Go9phONVqeNGrS34629wuYM+3846CyEtSWI9lgpZpR7/hgGxus3NPnHBphbt
 JS26V3EjJCcBoOBaIOWibzmeK1chx6+blD/xKiNhDj75qPVWi0hojw19057clcAs/aeMnamfpBL
 WeO74nkwfnfU9/QdiB0usFoj1Va9Goxbb7B0RVg4ON5oxxqvTGuQobzFN4VB7Yh4TlIbxk1YvNF
 bROOIqSQqNg+sH/8VRqpWXGEWJmZuE0hpja7Zhh+sg8z6Vn+gh53qZzUylXH/M1Y3u3an40W9/k
 jkcxhE07igDiSSvRZXA==
X-Proofpoint-GUID: uHZbkTLzZR1ZRJtTBIQ8ehi6sppI0LCQ
X-Authority-Analysis: v=2.4 cv=KvBAGGWN c=1 sm=1 tr=0 ts=6978f755 cx=c_pps
 a=Fop6EJdm3JO4gNsOK7pFUA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=w1d2syhTAAAA:8 a=EAmnLV0rfriLcecEFJcA:9
X-Proofpoint-ORIG-GUID: uHZbkTLzZR1ZRJtTBIQ8ehi6sppI0LCQ
X-Proofpoint-Spam-Reason: safe

In preparation for adding more match entries sort the ones that are
present.

Signed-off-by: Simon Trimmer <simont@opensource.cirrus.com>
---
 sound/soc/amd/acp/amd-acp70-acpi-match.c | 62 ++++++++++++------------
 1 file changed, 31 insertions(+), 31 deletions(-)

diff --git a/sound/soc/amd/acp/amd-acp70-acpi-match.c b/sound/soc/amd/acp/amd-acp70-acpi-match.c
index 44fab145aa59..de8f5a2a8e9d 100644
--- a/sound/soc/amd/acp/amd-acp70-acpi-match.c
+++ b/sound/soc/amd/acp/amd-acp70-acpi-match.c
@@ -187,80 +187,80 @@ static const struct snd_soc_acpi_endpoint cs42l43_endpoints[] = {
 	},
 };
 
-static const struct snd_soc_acpi_adr_device cs42l43_l0u0_adr[] = {
-	{
-		.adr = 0x00003001FA424301ull,
-		.num_endpoints = ARRAY_SIZE(cs42l43_endpoints),
-		.endpoints = cs42l43_endpoints,
-		.name_prefix = "cs42l43"
-	}
-};
-
-static const struct snd_soc_acpi_adr_device cs42l43_l1u0_cs35l56x4_l1u0123_adr[] = {
-	{
-		.adr = 0x00013001FA424301ull,
-		.num_endpoints = ARRAY_SIZE(cs42l43_endpoints),
-		.endpoints = cs42l43_endpoints,
-		.name_prefix = "cs42l43"
-	},
+static const struct snd_soc_acpi_adr_device cs35l56x4_l1u3210_adr[] = {
 	{
-		.adr = 0x00013001FA355601ull,
+		.adr = 0x00013301FA355601ull,
 		.num_endpoints = 1,
 		.endpoints = &spk_l_endpoint,
 		.name_prefix = "AMP1"
 	},
 	{
-		.adr = 0x00013101FA355601ull,
+		.adr = 0x00013201FA355601ull,
 		.num_endpoints = 1,
 		.endpoints = &spk_r_endpoint,
 		.name_prefix = "AMP2"
 	},
 	{
-		.adr = 0x00013201FA355601ull,
+		.adr = 0x00013101FA355601ull,
 		.num_endpoints = 1,
 		.endpoints = &spk_2_endpoint,
 		.name_prefix = "AMP3"
 	},
 	{
-		.adr = 0x00013301FA355601ull,
+		.adr = 0x00013001FA355601ull,
 		.num_endpoints = 1,
 		.endpoints = &spk_3_endpoint,
 		.name_prefix = "AMP4"
 	},
 };
 
-static const struct snd_soc_acpi_adr_device cs35l56x4_l1u3210_adr[] = {
+static const struct snd_soc_acpi_adr_device cs42l43_l0u0_adr[] = {
 	{
-		.adr = 0x00013301FA355601ull,
+		.adr = 0x00003001FA424301ull,
+		.num_endpoints = ARRAY_SIZE(cs42l43_endpoints),
+		.endpoints = cs42l43_endpoints,
+		.name_prefix = "cs42l43"
+	}
+};
+
+static const struct snd_soc_acpi_adr_device cs42l43_l1u0_cs35l56x4_l1u0123_adr[] = {
+	{
+		.adr = 0x00013001FA424301ull,
+		.num_endpoints = ARRAY_SIZE(cs42l43_endpoints),
+		.endpoints = cs42l43_endpoints,
+		.name_prefix = "cs42l43"
+	},
+	{
+		.adr = 0x00013001FA355601ull,
 		.num_endpoints = 1,
 		.endpoints = &spk_l_endpoint,
 		.name_prefix = "AMP1"
 	},
 	{
-		.adr = 0x00013201FA355601ull,
+		.adr = 0x00013101FA355601ull,
 		.num_endpoints = 1,
 		.endpoints = &spk_r_endpoint,
 		.name_prefix = "AMP2"
 	},
 	{
-		.adr = 0x00013101FA355601ull,
+		.adr = 0x00013201FA355601ull,
 		.num_endpoints = 1,
 		.endpoints = &spk_2_endpoint,
 		.name_prefix = "AMP3"
 	},
 	{
-		.adr = 0x00013001FA355601ull,
+		.adr = 0x00013301FA355601ull,
 		.num_endpoints = 1,
 		.endpoints = &spk_3_endpoint,
 		.name_prefix = "AMP4"
 	},
 };
 
-static const struct snd_soc_acpi_link_adr acp70_cs42l43_l1u0_cs35l56x4_l1u0123[] = {
+static const struct snd_soc_acpi_link_adr acp70_cs35l56x4_l1u3210[] = {
 	{
 		.mask = BIT(1),
-		.num_adr = ARRAY_SIZE(cs42l43_l1u0_cs35l56x4_l1u0123_adr),
-		.adr_d = cs42l43_l1u0_cs35l56x4_l1u0123_adr,
+		.num_adr = ARRAY_SIZE(cs35l56x4_l1u3210_adr),
+		.adr_d = cs35l56x4_l1u3210_adr,
 	},
 	{}
 };
@@ -279,11 +279,11 @@ static const struct snd_soc_acpi_link_adr acp70_cs42l43_l0u0_cs35l56x4_l1u3210[]
 	{}
 };
 
-static const struct snd_soc_acpi_link_adr acp70_cs35l56x4_l1u3210[] = {
+static const struct snd_soc_acpi_link_adr acp70_cs42l43_l1u0_cs35l56x4_l1u0123[] = {
 	{
 		.mask = BIT(1),
-		.num_adr = ARRAY_SIZE(cs35l56x4_l1u3210_adr),
-		.adr_d = cs35l56x4_l1u3210_adr,
+		.num_adr = ARRAY_SIZE(cs42l43_l1u0_cs35l56x4_l1u0123_adr),
+		.adr_d = cs42l43_l1u0_cs35l56x4_l1u0123_adr,
 	},
 	{}
 };
-- 
2.43.0

