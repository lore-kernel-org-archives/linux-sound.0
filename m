Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C4BD3161B4;
	Tue, 27 Jan 2026 17:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769535331; cv=fail; b=HgXWZDal5WvrSPfNaielFdXhdxnjiv/pZrCRxBNZ/d5u2ENxMy1Tvx0tMIvVqk6pGr4NtHLPp4ODTZT+J5owm7hPr+W/Gg3CChqTbhp2Vemm0GHKKhB+UKst8JboCwY+NypiUROkBnuET5jMVOPex8lmrsVyCRrq8dPhVw6OvLg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769535331; c=relaxed/simple;
	bh=U8bTdLAIDjCYZEDwIL/rQG2OMlBd2/FRVuT49YgEoP8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hzxquZIJze5OlgZ+yzBxZJ0XKZC7XkU6PHm/n8nTBEiVFQ2C5KRaSuX8RVy7gz8F3+3BJb2DP0ev0wkTBklHaGutRQ+bEWaa7Ocu3Ma4mWvAV3w2UK3b/5nl8gLbDolj9hewCqyedcb8jp8x+3bwHXxwDEiGXpqEcbFanqPIPKg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=TNsyakot; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=zhVzacds; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="TNsyakot";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="zhVzacds"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60R5mEtt1615650;
	Tue, 27 Jan 2026 11:35:16 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=sU7Lh/oJq/pWdjVbeDSCGCzJ/UhqwV3xE7wAZHsYyyY=; b=
	TNsyakotQmnJG3pia8zt5FIFZYtPXJ+yvyrS0lJgyNRM0xJBKq90mgbiZaMoUIcr
	eaH0nTXz09ac/jzCy66bUdAUb5/tQDXow41+/C65wkJYzhnwfhzFpimY878jJFJu
	LF2ghU3Y4ZkKOMx9qPbydoY/0VIllsk9hIS8QWyF94oCbOn7k1ynR45FvT0lqF8g
	naGZjgKJ+U0QSqRaAtUhoGgSNMJhXGIcmjMdTZtZL4DnKAiaSyLJ7QfBuTD74Kcq
	vQQCCHXrK9NBSdfb9XPCeds9txDrFRh0qbEkTivKQW55DtBzokXTN+ohVegYEDsh
	uGv0NceIWCpcsc2PQpSdmA==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11020119.outbound.protection.outlook.com [52.101.201.119])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4bvuckb8ph-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 27 Jan 2026 11:35:15 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HjXclgwx4v1USqjE/wd5O2klO1++dQFjF5zgPXzvDHuLv5P7x0Xjp4EfmGoRR38/4uDkfb35Voj0XDSBWU5OjGhm19m3DvWDVeDRqJlg6p2YG79tR8m6XAIup9ELuL2F65h+jXLPCa8npTC04iC5vt8DUHSgLukY5Ww3J6V5qzO3uXxsLgWA3kY/syf7d5BjvFbIMP6Vb7HQZavY/OZWWv3rInmopikrURQSYftypTjZihL0RvADwq4JEPduE0jBmDGydGujWIrEvpUX6qjntFJejFWN9i8QZXksRSyyL0R4q5IWnOz6LCi5/TLQtDgZIEvW31/FAA4mmNy6mz36bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sU7Lh/oJq/pWdjVbeDSCGCzJ/UhqwV3xE7wAZHsYyyY=;
 b=AkMtVY4VOhEZWRWyuwEk2D2DIh9Ftc7/QkaEZaohyYR1HjnGnB6VV5allhhvevxq13+aIVunrmh1JX560nFM04Cmg/9cSWo6uwn25ijKHP2cqAsu2RMlqKv2BY9Ze4xeczd7ATQ1ERnruMzeo/4fm4uvE6KDdCBVaNLI/pEx0FvUYbJIz4RGbclOr6FDwurWOJcuYUMYE14rwJthqwdw5t3bwm3OQMsv6Dw8rCdw1E7utUvkf1QfMqXtzlw78/HH6eHOSo9fDC8KujKFW1rApUPMjo4viL9Au9PO8530cT4l7Ej3aojYVpunKhGS/IMYVwzxirKHe34qTabyrpkjaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=amd.com smtp.mailfrom=opensource.cirrus.com;
 dmarc=fail (p=reject sp=reject pct=100) action=oreject
 header.from=opensource.cirrus.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sU7Lh/oJq/pWdjVbeDSCGCzJ/UhqwV3xE7wAZHsYyyY=;
 b=zhVzacdsWpDsuHWazyqvcZQRT8PSr6U37FNe96XMnW5UpBwx3V4CdX2THmQi/l2yR34y7RHCROODU8fjnSRmpCkF9yiqDeEMERuyLk805agMwYtfZGl1j3g9NoUzsZSTqpnsdevn0r0FxoBdJlu3PIXpDTK3M6VyT6DST9Et+vQ=
Received: from BLAPR03CA0050.namprd03.prod.outlook.com (2603:10b6:208:32d::25)
 by SA1PR19MB5499.namprd19.prod.outlook.com (2603:10b6:806:233::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.16; Tue, 27 Jan
 2026 17:35:12 +0000
Received: from BL02EPF0001A101.namprd05.prod.outlook.com
 (2603:10b6:208:32d:cafe::2f) by BLAPR03CA0050.outlook.office365.com
 (2603:10b6:208:32d::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.7 via Frontend Transport; Tue,
 27 Jan 2026 17:35:11 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BL02EPF0001A101.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.3
 via Frontend Transport; Tue, 27 Jan 2026 17:35:11 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 4DD35406541;
	Tue, 27 Jan 2026 17:35:10 +0000 (UTC)
Received: from lonswws01.ad.cirrus.com (lonswws01.ad.cirrus.com [198.90.188.26])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 1E131820249;
	Tue, 27 Jan 2026 17:35:10 +0000 (UTC)
From: Simon Trimmer <simont@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com, Vijendar.Mukunda@amd.com,
        syed.sabakareem@amd.com, Simon Trimmer <simont@opensource.cirrus.com>
Subject: [PATCH 2/4] ASoC: amd: acp: Rename Cirrus Logic component match entries to include link and uid
Date: Tue, 27 Jan 2026 17:34:47 +0000
Message-ID: <f8f7fab5131ea6080421812dcce3e9ffc5b936e0.1769534442.git.simont@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0001A101:EE_|SA1PR19MB5499:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 2d590e3f-4a59-4cf9-45e8-08de5dca6c2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|61400799027|36860700013|82310400026|54012099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?uzie0N4rIw+UQRYCsvQ8evYjqOYUjbdUb4dBneky5uGjJJlCglRm+VkY3Ssu?=
 =?us-ascii?Q?Zfpx5OvFDT+2MS1Sjh4ZA13BKQ6Pfkcm4Ch3U6KodNhEGtlld8i+LzAUHZJE?=
 =?us-ascii?Q?DtMX/60Uhi1EZHrMc51+2orAIxkKFKCdJwlYRXSvyJBAokRO1Ou++dSYFAT8?=
 =?us-ascii?Q?TyQMhsEXJFB4ZTGroRux++bgKYbW11fvpR+dG+RAel8vzQzN+Zn0LXoDbPQs?=
 =?us-ascii?Q?pcfKCBt2NzuqFHsy9AMzyQrM6/XNOnREI27scnH8YSR8FhgarGdalwKvAlbt?=
 =?us-ascii?Q?6W5im3YvxTGhHfku5LSoECoFRmkqNmHr+JHQOBLQG3i1OpRY+K1p2VYSa2Yb?=
 =?us-ascii?Q?9+lokdeCH11t911QH7b3u/rG4sQGBHcxPa21K5Zup/n9ewcsXu6n1W4p3xwh?=
 =?us-ascii?Q?3IaB6rigmaJdG06qgzO0OCn55kkswQaVEwAi7WBJvnW4IGIWcjMOYH8RtvCr?=
 =?us-ascii?Q?aApOuo7MYfNRsPhfboXafYmo6fTeDGH7p/o7MX4qBwEUc5beFPxFQibuTjvw?=
 =?us-ascii?Q?K15RiudvKJswI001oFgjGpLlttOnCe7hd44ZNYG0BSMGOfhgZtBPIXTNgSb3?=
 =?us-ascii?Q?3DK4VKm2/zF2aBNShgzFGn6+marmwvGX24xb6J+fmgH/rjOJUzXy1pGZKuR0?=
 =?us-ascii?Q?ySGe+lsqVT/USHgjFUhPZbq6pUgktLr3AACWinYIpIuCM+QcuWiLVCG8GtH1?=
 =?us-ascii?Q?zXH5iypflV+nLtDKa9HF8Sw/X5RbEB/JJPn32EJ24K2Pi9lThr32ZVoQa/ky?=
 =?us-ascii?Q?CEpTe7iXOcUlV7VtuqPdFGPNEJUSoKtAIWEYSgZJNJZ5VvrtPO7rQJxE/Itc?=
 =?us-ascii?Q?EE15aht/Gx4N5DdZ6vbssgLoCoBHr5YIIfPvFvcTX6TVuNSF504vaYvFXhpX?=
 =?us-ascii?Q?Webaqf6hHiVdpQhzL50ajMQeszqyxmmLEnUUzLlpU9vSHQuol4Z+txUAU0UA?=
 =?us-ascii?Q?6QvCsSbFQvL04g/ZliBfpxw44bXFZrOOTK+TArktDGXqpyVr2aDKU0nbiaYa?=
 =?us-ascii?Q?+zQBdfZij4HQ8iS/vijLp17xfcIR/GYLUpkBOf6JRJaQCFe46IaLxxWkn11j?=
 =?us-ascii?Q?h8L1nRSf4zIlO8itNWc+va3q6DzuSLvYdIljU/+dErFlgGXirXEDC4nsLzj3?=
 =?us-ascii?Q?LwUZ2Htuz2WTTL+DJ7+GcOIqOV8KA+y/o2oGAzvCOY9JNQOqOzCwLWVZM5dz?=
 =?us-ascii?Q?71DsCOLVTuWs5V7cKPC5IvZJx1RzMyiP+pRAAbc1rOorbjKXTW9yNB/AzoFJ?=
 =?us-ascii?Q?DknV/FNBG0InvMNDOFdVjpz3hX5vXgwisnu84NcLpvKKxyywFhwPqPuQRfSy?=
 =?us-ascii?Q?i7rU3Y/Ftd7ZG6NY5ufRd0TedkD/H4VSPX1w7FTDFsS6Ac+JgYhhhKWiu0sr?=
 =?us-ascii?Q?LNYAM24JesG7ErtFTyzad7bM3MTyWoFwzA8HoPZvu5eBE+uLBNPXnklm1VkK?=
 =?us-ascii?Q?4byge6/+Jchrl9k1RcBZDpQd+shAN8kW/Pyx4SUx5euk+LGR0zoB5Ww6il0X?=
 =?us-ascii?Q?/gb2FvzZ6qEjy/V71Em+8OD77EbKeU7R2+L83ma3k7WPNuAtFhKfb7OSJRX0?=
 =?us-ascii?Q?WrrsoQyObgygdWKGRr15XL/Hh/JUKIk5+2qTvRazp79i0Eqg6A5O7nNFiutd?=
 =?us-ascii?Q?eCCn9rJd6Ez93rlKMNmlkahR7zMHgjgRQHCnCiUf+zKC2ZVSJ3SDJctAnnRe?=
 =?us-ascii?Q?bMJtsg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(61400799027)(36860700013)(82310400026)(54012099003);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 17:35:11.0953
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d590e3f-4a59-4cf9-45e8-08de5dca6c2f
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BL02EPF0001A101.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR19MB5499
X-Proofpoint-ORIG-GUID: u9jagwzD1WYUJaSfYAsErq6dH6HQOC1F
X-Proofpoint-GUID: u9jagwzD1WYUJaSfYAsErq6dH6HQOC1F
X-Authority-Analysis: v=2.4 cv=Vb/6/Vp9 c=1 sm=1 tr=0 ts=6978f753 cx=c_pps
 a=j7k210cWVAfXhyiYu0S74w==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=w1d2syhTAAAA:8 a=5kxn1ZMerDWvsB6lJLkA:9
 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDE0MyBTYWx0ZWRfX/buDYNxzMV7+
 TLTqUEvXeSd4IfEdDkzW/ebe7+3THQyzhLGab0yisRksOnbPycCWIyarUJdUP8aU38dJUo+k1xB
 TyiKBd57bO+0JVveZyJ3+nNwDq0bgTZ/NL39+j8JRh2duYQ/pPrIf1Ft18nmx7ziWMtUZGLxz1T
 2ju0oGilmiw5P+wzfwcB2VsreM+qOmoE0+s9ZF1yh/2XDA/VcrTsWtGk/BBo7Rn76gVUQ0LEpLP
 9h51x1jX+GmH+45Jt0y07FvVY02LNFBy9tE+yF6izeOeSjOmDvYISNoZdi4O2sqkwJeU/gnAqjh
 RuMHicRkOfIGEYk38Uv3ZW7qqD1cwo6+RlqyoavoXmgMh9RRYB5NcjkNJi+meT7hOnBosUSCJVT
 6S3dDadyk8vYn9vRNaRdLFvD6xb3e9OdheTL8UEgyxEKnU8rSFx5+Cnp6Buul4Az8dIsQzF6G1S
 sFVu3T3mMxHVreLQ6pQ==
X-Proofpoint-Spam-Reason: safe

In preparation for having similar matches with multiple UIDs on the same
bus rename the match entries to include the bus link and device uid
numbers in their name using the lNuN convention.

Signed-off-by: Simon Trimmer <simont@opensource.cirrus.com>
---
 sound/soc/amd/acp/amd-acp70-acpi-match.c | 34 ++++++++++++------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/sound/soc/amd/acp/amd-acp70-acpi-match.c b/sound/soc/amd/acp/amd-acp70-acpi-match.c
index 93eb01a00a0c..44fab145aa59 100644
--- a/sound/soc/amd/acp/amd-acp70-acpi-match.c
+++ b/sound/soc/amd/acp/amd-acp70-acpi-match.c
@@ -187,7 +187,7 @@ static const struct snd_soc_acpi_endpoint cs42l43_endpoints[] = {
 	},
 };
 
-static const struct snd_soc_acpi_adr_device cs42l43_0_adr[] = {
+static const struct snd_soc_acpi_adr_device cs42l43_l0u0_adr[] = {
 	{
 		.adr = 0x00003001FA424301ull,
 		.num_endpoints = ARRAY_SIZE(cs42l43_endpoints),
@@ -196,7 +196,7 @@ static const struct snd_soc_acpi_adr_device cs42l43_0_adr[] = {
 	}
 };
 
-static const struct snd_soc_acpi_adr_device cs42l43_1_cs35l56x4_1_adr[] = {
+static const struct snd_soc_acpi_adr_device cs42l43_l1u0_cs35l56x4_l1u0123_adr[] = {
 	{
 		.adr = 0x00013001FA424301ull,
 		.num_endpoints = ARRAY_SIZE(cs42l43_endpoints),
@@ -229,7 +229,7 @@ static const struct snd_soc_acpi_adr_device cs42l43_1_cs35l56x4_1_adr[] = {
 	},
 };
 
-static const struct snd_soc_acpi_adr_device cs35l56x4_1_adr[] = {
+static const struct snd_soc_acpi_adr_device cs35l56x4_l1u3210_adr[] = {
 	{
 		.adr = 0x00013301FA355601ull,
 		.num_endpoints = 1,
@@ -256,34 +256,34 @@ static const struct snd_soc_acpi_adr_device cs35l56x4_1_adr[] = {
 	},
 };
 
-static const struct snd_soc_acpi_link_adr acp70_cs42l43_l1_cs35l56x4_l1[] = {
+static const struct snd_soc_acpi_link_adr acp70_cs42l43_l1u0_cs35l56x4_l1u0123[] = {
 	{
 		.mask = BIT(1),
-		.num_adr = ARRAY_SIZE(cs42l43_1_cs35l56x4_1_adr),
-		.adr_d = cs42l43_1_cs35l56x4_1_adr,
+		.num_adr = ARRAY_SIZE(cs42l43_l1u0_cs35l56x4_l1u0123_adr),
+		.adr_d = cs42l43_l1u0_cs35l56x4_l1u0123_adr,
 	},
 	{}
 };
 
-static const struct snd_soc_acpi_link_adr acp70_cs42l43_l0_cs35l56x4_l1[] = {
+static const struct snd_soc_acpi_link_adr acp70_cs42l43_l0u0_cs35l56x4_l1u3210[] = {
 	{
 		.mask = BIT(0),
-		.num_adr = ARRAY_SIZE(cs42l43_0_adr),
-		.adr_d = cs42l43_0_adr,
+		.num_adr = ARRAY_SIZE(cs42l43_l0u0_adr),
+		.adr_d = cs42l43_l0u0_adr,
 	},
 	{
 		.mask = BIT(1),
-		.num_adr = ARRAY_SIZE(cs35l56x4_1_adr),
-		.adr_d = cs35l56x4_1_adr,
+		.num_adr = ARRAY_SIZE(cs35l56x4_l1u3210_adr),
+		.adr_d = cs35l56x4_l1u3210_adr,
 	},
 	{}
 };
 
-static const struct snd_soc_acpi_link_adr acp70_cs35l56x4_l1[] = {
+static const struct snd_soc_acpi_link_adr acp70_cs35l56x4_l1u3210[] = {
 	{
 		.mask = BIT(1),
-		.num_adr = ARRAY_SIZE(cs35l56x4_1_adr),
-		.adr_d = cs35l56x4_1_adr,
+		.num_adr = ARRAY_SIZE(cs35l56x4_l1u3210_adr),
+		.adr_d = cs35l56x4_l1u3210_adr,
 	},
 	{}
 };
@@ -333,17 +333,17 @@ struct snd_soc_acpi_mach snd_soc_acpi_amd_acp70_sdw_machines[] = {
 	},
 	{
 		.link_mask = BIT(0) | BIT(1),
-		.links = acp70_cs42l43_l0_cs35l56x4_l1,
+		.links = acp70_cs42l43_l0u0_cs35l56x4_l1u3210,
 		.drv_name = "amd_sdw",
 	},
 	{
 		.link_mask = BIT(1),
-		.links = acp70_cs42l43_l1_cs35l56x4_l1,
+		.links = acp70_cs42l43_l1u0_cs35l56x4_l1u0123,
 		.drv_name = "amd_sdw",
 	},
 	{
 		.link_mask = BIT(1),
-		.links = acp70_cs35l56x4_l1,
+		.links = acp70_cs35l56x4_l1u3210,
 		.drv_name = "amd_sdw",
 	},
 	{
-- 
2.43.0

