Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C733836D9F5;
	Wed, 20 May 2026 16:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779295073; cv=fail; b=IPu+3ROXvUdpX5mVOUa32T4zjZvNTplQdaSGnvaxNZ3Et0pQ0R4JEb0UEX4AMx7ilLQzBHyAuaOGYv9zfO9zh/AcX4IU2hQYNvUmAGVSPnRqxtjjigwcAIEL8GG7N4A71laW8pZNqPO6DlroT52KdrJ93fnL7oSBDfwszwY5jhs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779295073; c=relaxed/simple;
	bh=iQaazIprB17dlP4Eqz9kfXgc/fHbjCk92DCyGSPrE9k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=U6XBR2UstYqZDZ8aVRodXUalmAkDQqzkeLOpf/9JqBs8cAnHaztCnzVBJVv+ZAaLXdWd2LAn+H4k//g4fXPsDBVUdDtCEebevFHRgNrzdh/EbSE409ojRRSueA9VTQGQq+v/5SVn9l6T9XIBk2V6Yd1UO8qWYG/Hj+Bbarf/jIc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=Eogliu4b; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=fS4VyTgY; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="Eogliu4b";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="fS4VyTgY"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64KCdDio1158784;
	Wed, 20 May 2026 11:36:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=ewo7Pruh1T+Xw+yBeJDm3rG97ydxgWBHy7XqrAXu/MY=; b=
	Eogliu4blX7TrUel5vaJejPJrlellJuSMiz0Nj5ej2JMoCpMcQ6YOxF1J86hNIjD
	8jxHVRMS5jg059rzIreUDSGt0RB5rKSgpzadPiLDjv/mCkiEGaG3x3/7kycT5hYr
	14lige35mcaIDBNdYU6cfpKKQw5VykBmgvB2LFMDO0n6ORolfwhiWgsO9m67lNDl
	3JD/zNMA3S5xQKjW08sZLXI8YAIDm9lR7wB91JAEcoOSQOHXJJJwwOsdeIJeKek1
	lMFlEqaVfFZmN8eNBQ3UQ+GtTuK+lQ8tQHflvnS2r9Nz3U9bMkh7aFLEpGdXEytv
	iCanB25YqXajYhZUJ9qGBw==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11020133.outbound.protection.outlook.com [52.101.61.133])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4e93g1h32n-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 20 May 2026 11:36:40 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xaYhN066CAKeOHacU5mbQpTxMfigFTZ1HQfqDrxNhJKQZ6Uf4YjAV79FkLEtplpBliPfKiIyBJKndGB1KMNBcs+3/mRo69mtY3ZE1iPO3uDFM+w0RquBaFoj9SUec0ZX7ZRN0Vz0AfuNWBElDtSiwyX+isaz7/VQVIdVcmIqDuRbVVe09G5ZCNrx3shUoGZOhAUlaAY7YV9kZ+2tDqXLwkZKer21lhDupyLxoRZK0nnXLQEoREPjt5JZReaxNGV1awli4xLN1no2vy4DsI1G93HZy+3bHHLbcH6Zpu+oJAgoknzfWRisF39i7EIzptVwURJ/3TffXaOLul7A2k+dvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ewo7Pruh1T+Xw+yBeJDm3rG97ydxgWBHy7XqrAXu/MY=;
 b=fkJF568yxTawPC1Yr7uqqVAF+UYkXpg+prliXbIt45wP8ovQog5ia+Euo6+bUH8gDIPD8f8EwSxz08bS7iwq0lBcePtkB06PkN0n5ukzZADSGaqgieTMSWBVHQR+sUFN/1M4HQiLrTF2XbPN9zBKLSx8F67xnIhjmu/SIbHkssjJ39sTIp2LkcudfgAAPliMzVy69GRD+FtTs3LPtdf3cpIKOep3pR/1fOM4Kb+JJbDLoz5ymp//rFwqp7A3zzpr9H7E/iUyLWD7fFg7KBMbuH0YVxEuiR2SiAnQ0IszMWyLvSRmarsA9XEXSlQFK6XBIKDEM6FDrbQcqSvFxEi6Rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ewo7Pruh1T+Xw+yBeJDm3rG97ydxgWBHy7XqrAXu/MY=;
 b=fS4VyTgY6yA7ITHXzAmsx47XWV3WlsWYEKLUbr8IWnBfzni+m1dmn/JtnA+mDmvnXjMKD2q+yXgrnnjdFOyI6b4SB67+rVFCflKsQ2SqbFurhc4+HnjOOJxlqZkUoM6VUUONbLcDxQL4ISjo4WFpVRfNg8R7sf9crLUVyZX6gI4=
Received: from SA9PR13CA0088.namprd13.prod.outlook.com (2603:10b6:806:23::33)
 by BL1PPF55934F95F.namprd19.prod.outlook.com (2603:10b6:20f:fc04::ea6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Wed, 20 May
 2026 16:36:37 +0000
Received: from SN1PEPF000397B4.namprd05.prod.outlook.com
 (2603:10b6:806:23:cafe::7b) by SA9PR13CA0088.outlook.office365.com
 (2603:10b6:806:23::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.16 via Frontend Transport; Wed, 20
 May 2026 16:36:37 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SN1PEPF000397B4.mail.protection.outlook.com (10.167.248.58) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.11
 via Frontend Transport; Wed, 20 May 2026 16:36:36 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 447CF406544;
	Wed, 20 May 2026 16:36:35 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 2AB6982026C;
	Wed, 20 May 2026 16:36:35 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org, vkoul@kernel.org
Cc: lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
        yung-chuan.liao@linux.intel.com, peter.ujfalusi@linux.intel.com,
        oder_chiou@realtek.com, jack.yu@realtek.com, shumingf@realtek.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 2/3] ASoC: Intel: soc-acpi-intel-ptl-match: Remove unnecessary cs42l43 match
Date: Wed, 20 May 2026 17:36:30 +0100
Message-ID: <20260520163631.3300102-3-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260520163631.3300102-1-ckeepax@opensource.cirrus.com>
References: <20260520163631.3300102-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B4:EE_|BL1PPF55934F95F:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 79973aa6-cc27-4cd0-ccdd-08deb68df63a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|61400799027|36860700016|82310400026|22082099003|56012099003|16102099003|18002099003|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info:
	FDs7hkw1XpErA8uy1vy/b/AuIdgUYZ5v64EYS0wisdz/0phogX/4rzYZz4/WHQlAyUEJNyOKQtglUQLuhSGvWUMn0SDpc9dQtZosPE+Y2WEFSgNn4NYOKQbJqV0P53D81eoCr0rSTMp99UxrHsh1sN7wOgh//DfrxR70kyYI7LZvkxHxWtBuVjH9GJRrfCBHNCeft0SUu83Sa2nw1HKj4TSUgnQkU8VuENaSoMk4yrUTeRMj2b+x543GrpGAUd9pW52Gu9OpMAlSC7FySN1cGZJLpGrcxMKr1mz9LQIFcxFvg7wCRqX4jjqse8Kv7cwxVcKtDUXraaRIQwzJCnYdOD7yUIrcW1adpCEVrDtOfuzn5cQG8/EX4M8MHCPPUQtEkcr0pHr3tqZHLuAgtgBpJ/GjKI/W/34ovQNm1JZzYpbU9V1g+plEOGT7ucM5N5JJoOygTl2b9qw4dAE+FNP0OWQRMqg0qExEspD2SXrUuEatljYWqFEDdrXWMviYzKUSW6KPxMBwYZ3BM+KMoZV8OSQlm4Z0ib350bbBjOuJIIi0GPdCzAYABJeKNrwE/pfYAhIKpSpRBjQE8s5cZIiPYeGY8xMmkpbXsGqaH7tEvhbDCKOxrnaEaHplgD+iOm7BZSMScQiptkRkpnfuDCh2XAirhIiVDLK/Vs1riPghGgnV+Fkg0mlmYA3pkIT1q5ln+dol++Zcr7tHb9j9O24/szyK/fVXDGXiF0V7PjIJ+EU=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(61400799027)(36860700016)(82310400026)(22082099003)(56012099003)(16102099003)(18002099003)(11063799006)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	1MLjf7aIq/RtTexQ/YtAImaagbv1pEHpurMugo1GYQs5QSAJbYROtW56Oh0WfuS/9Na0JWfD0mFuw2wKmTaCfyYvevBra3PWDLAmFqmvQe/yiTX3lejNxMTl6F80iVKGdwuKTIHB33jCobBjVO0v17CGEXrUh0/+Rl2p40e3xrq0yy4jY5XMGQjT1cEbzmvCZfkegE99Slna00RuCi6eR8CBPrEou1xguNUxiyKUxuvivAWmI6gUkBEazQZBHA2DkXpm8YdihDpRobfKC+HeMnua/wszAFUI6V4XZ0qkO4hU5E5LM5s3V8Rf4Arx+Z7GcWvgn2xWIzTEn/f/b+s+/O8vduXHn/NJoxfNbz7cm0yWeRVm0w6+l5dMBHhq64jABp4Quk4efv1f2r6w+o8W00rt/mbXlW/3POXsoZFTAaXobZoEb7pUdYNP2YNzGk9K
X-Exchange-RoutingPolicyChecked:
	ublSMwfH2X5m2OLNPUL8GI9knD7pw+MP4Ro9fxDyl9mPfWmqCfNlroPJsM5IrlrobxGxW/gIDsMlAa616JIj6OkaGIP1RKzSg3cwJ/YV44y607ZHACcepX7dY+SVuJMtoPDRLcK2wCF6jI6c+JppkOzRHJlxMhhZqoKonl8Ouky9M8C+RVC8Thr6zcj3/f+r9lNSAF8jdTvuTYj0yacaTYJfz+y0hKka3m36YzloM/boXUZ9Zi32Yc3q2m+P8i9a2j5QAFl44ZsZx3FIEJTHmiL32pCMFrtv6pJBMXrNXRD8Om/mre6U5lvO2VcsoryFBgJ6rCCAnWMzgMru+gWXzQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 16:36:36.8093
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 79973aa6-cc27-4cd0-ccdd-08deb68df63a
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SN1PEPF000397B4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PPF55934F95F
X-Proofpoint-ORIG-GUID: SIRgF8vOdcAXuYX0jsUa6W1XKwT9pehO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDE2MSBTYWx0ZWRfX+Ey/yervPg0K
 VBH5Onnm/gPQP1LE5sYKtL1f3mVjgLUee68kISxhPfquWDKD1GpdkNnyXyTJZGnWV1on4b1ZmWz
 199e41gPu/vAGRsU6giDYHmLnuzGM7ppCT1hICwxZLmtvHvx1mpr8c9a5lE4NyxVlV8dxFacNsG
 OqLzama/3Nn7VAbY/srS/5wRZbA2vHthfT3rXYX/3nHAe9gIFqXLy3Sn2nHTmZ2z7A72OIRS23E
 lgfGjn7tRauDI6kaOOytIR2hF17ZbUHjBSEXGdCAM01/LBIPaSI2osBWPWUoAhN9/Up5mrf4WM6
 n5G2BuhckTmLmDSiJGqkIrrENXSF57Adnpbaqm9B04m8HvkYBHWpQSnhB99LFtRFCadATmd7ldB
 0YU7OpTTYzL9xOzMzIjg/uk9ve7HR2din6nP4MIuguY7oh79W5M4L36C965cbS88UU2T3aZSkIG
 gsdeDZUiUv1UYcEo8QQ==
X-Authority-Analysis: v=2.4 cv=Wrcb99fv c=1 sm=1 tr=0 ts=6a0de319 cx=c_pps
 a=3l++41Tsbfu3Vy6U+n14cA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=NGcC8JguVDcA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=YSoufPJkrKXdQH4yDjUA:9
X-Proofpoint-GUID: SIRgF8vOdcAXuYX0jsUa6W1XKwT9pehO
X-Proofpoint-Spam-Reason: safe

For PTL onwards Cirrus are intending to rely on function topologies,
rather than using a match table for each system type. Remove this
unnecessary match table entry. Having the match entries can
mean that systems match when they should use function topologies
instead, resulting in incorrect audio configurations. Although,
admittedly this is not too likely with this 6x amp configuration
as those are quite rare, but best to follow best practice.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 .../intel/common/soc-acpi-intel-ptl-match.c   | 118 ------------------
 1 file changed, 118 deletions(-)

diff --git a/sound/soc/intel/common/soc-acpi-intel-ptl-match.c b/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
index c6bf70e393975..f7694b2a2b02e 100644
--- a/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
@@ -92,48 +92,6 @@ static const struct snd_soc_acpi_endpoint spk_r_endpoint = {
 	.group_id = 1,
 };
 
-static const struct snd_soc_acpi_endpoint spk_1_endpoint = {
-	.num = 0,
-	.aggregated = 1,
-	.group_position = 1,
-	.group_id = 1,
-};
-
-static const struct snd_soc_acpi_endpoint spk_2_endpoint = {
-	.num = 0,
-	.aggregated = 1,
-	.group_position = 2,
-	.group_id = 1,
-};
-
-static const struct snd_soc_acpi_endpoint spk_3_endpoint = {
-	.num = 0,
-	.aggregated = 1,
-	.group_position = 3,
-	.group_id = 1,
-};
-
-static const struct snd_soc_acpi_endpoint spk_4_endpoint = {
-	.num = 0,
-	.aggregated = 1,
-	.group_position = 4,
-	.group_id = 1,
-};
-
-static const struct snd_soc_acpi_endpoint spk_5_endpoint = {
-	.num = 0,
-	.aggregated = 1,
-	.group_position = 5,
-	.group_id = 1,
-};
-
-static const struct snd_soc_acpi_endpoint spk_6_endpoint = {
-	.num = 0,
-	.aggregated = 1,
-	.group_position = 6,
-	.group_id = 1,
-};
-
 static const struct snd_soc_acpi_endpoint jack_dmic_endpoints[] = {
 	/* Jack Endpoint */
 	{
@@ -202,15 +160,6 @@ static const struct snd_soc_acpi_endpoint cs42l43_amp_spkagg_endpoints[] = {
 	},
 };
 
-static const struct snd_soc_acpi_adr_device cs42l43_2_adr[] = {
-	{
-		.adr = 0x00023001fa424301ull,
-		.num_endpoints = ARRAY_SIZE(cs42l43_amp_spkagg_endpoints),
-		.endpoints = cs42l43_amp_spkagg_endpoints,
-		.name_prefix = "cs42l43"
-	}
-};
-
 static const struct snd_soc_acpi_adr_device cs42l43_3_agg_adr[] = {
 	{
 		.adr = 0x00033001FA424301ull,
@@ -235,48 +184,6 @@ static const struct snd_soc_acpi_adr_device cs35l56_2_lr_adr[] = {
 	}
 };
 
-static const struct snd_soc_acpi_adr_device cs35l56_1_3amp_adr[] = {
-	{
-		.adr = 0x00013001fa355601ull,
-		.num_endpoints = 1,
-		.endpoints = &spk_1_endpoint,
-		.name_prefix = "AMP1"
-	},
-	{
-		.adr = 0x00013101fa355601ull,
-		.num_endpoints = 1,
-		.endpoints = &spk_2_endpoint,
-		.name_prefix = "AMP2"
-	},
-	{
-		.adr = 0x00013201fa355601ull,
-		.num_endpoints = 1,
-		.endpoints = &spk_3_endpoint,
-		.name_prefix = "AMP3"
-	}
-};
-
-static const struct snd_soc_acpi_adr_device cs35l56_3_3amp_adr[] = {
-	{
-		.adr = 0x00033301fa355601ull,
-		.num_endpoints = 1,
-		.endpoints = &spk_4_endpoint,
-		.name_prefix = "AMP4"
-	},
-	{
-		.adr = 0x00033401fa355601ull,
-		.num_endpoints = 1,
-		.endpoints = &spk_5_endpoint,
-		.name_prefix = "AMP5"
-	},
-	{
-		.adr = 0x00033501fa355601ull,
-		.num_endpoints = 1,
-		.endpoints = &spk_6_endpoint,
-		.name_prefix = "AMP6"
-	}
-};
-
 static const struct snd_soc_acpi_adr_device rt711_sdca_0_adr[] = {
 	{
 		.adr = 0x000030025D071101ull,
@@ -408,25 +315,6 @@ static const struct snd_soc_acpi_link_adr ptl_cs42l43_agg_l3_cs35l56_l2[] = {
 	{}
 };
 
-static const struct snd_soc_acpi_link_adr ptl_cs42l43_l2_cs35l56x6_l13[] = {
-	{
-		.mask = BIT(2),
-		.num_adr = ARRAY_SIZE(cs42l43_2_adr),
-		.adr_d = cs42l43_2_adr,
-	},
-	{
-		.mask = BIT(1),
-		.num_adr = ARRAY_SIZE(cs35l56_1_3amp_adr),
-		.adr_d = cs35l56_1_3amp_adr,
-	},
-	{
-		.mask = BIT(3),
-		.num_adr = ARRAY_SIZE(cs35l56_3_3amp_adr),
-		.adr_d = cs35l56_3_3amp_adr,
-	},
-	{}
-};
-
 static const struct snd_soc_acpi_link_adr ptl_rt722_l0_rt1320_l23[] = {
 	{
 		.mask = BIT(0),
@@ -599,12 +487,6 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_ptl_sdw_machines[] = {
 		.sof_tplg_filename = "sof-ptl-rt713-l3-rt1320-l1.tplg",
 		.get_function_tplg_files = sof_sdw_get_tplg_files,
 	},
-	{
-		.link_mask = BIT(1) | BIT(2) | BIT(3),
-		.links = ptl_cs42l43_l2_cs35l56x6_l13,
-		.drv_name = "sof_sdw",
-		.sof_tplg_filename = "sof-ptl-cs42l43-l2-cs35l56x6-l13.tplg",
-	},
 	{
 		.link_mask = BIT(0) | BIT(2) | BIT(3),
 		.links = ptl_rt722_l0_rt1320_l23,
-- 
2.47.3

