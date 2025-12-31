Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 018DC225417;
	Wed, 31 Dec 2025 10:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767178227; cv=fail; b=p+XFa01QdoepJWrELs6wb/sKblpWSzzYL8uFZjtyTQ5RSUaQ6L/FJBGAaVAsbqM1HX7JC/1eqY1mjn0/KTr4g39psOOnpEiHf/+sX+gcI06O1EzhVMjzCMP9FUWHm7ZQiIP5zhT7LP+fjWkZQ5Ze3vKvQfcbKr5QFg190eRMV4Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767178227; c=relaxed/simple;
	bh=o9yp705JiQLm1hCystUnpyy2e+1Xs8iBnqrq60v26Gs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Vv/66eqNHyZstA0WrMB379BiI/q/nsRglz+o6Y+k78ejDK0csNW59Bz74XUZB3hox55SPEcNV0sBYppRmDBvQGUIihhtZpBhgaXgNYumCAYTGmqnLlpxnxaTCWHzFAPXsjM2avUn9GeHpUBFy/csceZ+ckLvnU/GOVHPIlUP/w4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=GQ96/iXX; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=LWMMBd2+; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="GQ96/iXX";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="LWMMBd2+"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BVAmWYB351340;
	Wed, 31 Dec 2025 04:50:11 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=f+dJijoTw4ZONB3PNj+BKtmZoNK+/YK4zYfutmfpBEo=; b=
	GQ96/iXX5pB4XsoNt52UVncLDsyRatGCRCoIdE+vwYaXd74w/JJfo23hg2tCVEkk
	Q2kSwihoPbmdwlhz6kM9TpS//A8efSQ1ZbanMEBMcsQ5iOD2xe7uqlZgduuNWGof
	iXxfTOZkJyxgNHJkmn3C5XUfzvBkiIsMvFG81H9vAvUHAvXm0GY+Fl1T6dlJcYPl
	jN1s1QjTRkD7IGfdtVxZNrLN9I7a94bf/9Z8aVJsYXYsyiD5n8Ah6OimgaLp/lrY
	jXFosSLUlPj8S9Ii31gV8W6urOqviMAy1onQ84lQqg19VkB1BhUBAY0WGk/QI3Ek
	38coqpAu8cR4Vdg8F6AVdA==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11021134.outbound.protection.outlook.com [40.93.194.134])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4badr3c1q6-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 31 Dec 2025 04:50:10 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vHwONtLPkdZPxEhKG+jWJcA2jxokadGKzfG15CaOr72UhnN9mS5A9erCXoeIjBYa0FKmbSC5eZKt5fDVp8XkKAVUSzBrHoGkeBjJyUiVlhb+j/IcmhVBb96rycjxOT6SXVao0JWOvaBQVlWeKdByGF+wUe7qOE8vYo4KqABKwlTSYTCh5f/GyBEx/HmRH8gHmJO+rZDnIBPy5xdz+08jqxspjrjSBbuEizKlQcakI89bf8QtayuUzX6MefUW8rat1mxUKzY3fdoldX/AdvwCuZjbCTqw+sl9y8oPXOFJryiUsoW7ckjymNml2HkaAzURsb7saxONdI4S6lhqvZ75kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f+dJijoTw4ZONB3PNj+BKtmZoNK+/YK4zYfutmfpBEo=;
 b=XV7BTtU90gOINccYGvdX6ZYPPNxSWrbQgdOanaqnXtj4Aayo0MbXdSz4zzX2p0wEdlq3OoHl4zs3qAM460HUzF0Eg07D1tGY9csjPuTB17hRVNa6S/rCItztgsS0edNN5RTGZGQkjEXNVvjq7FtApuBLRW82z11/VdXDwIIDAIHKePt2QmqAcn/3fxGJTPScpoEu7dGw3A9r7jEwi0lFIjZfUYwEmhkt5VCf5tr+vrN2XKnHjkCoyMHrtKWvWcpO7Sihkr6QPUyaTCLbxx3Raoy/G39mvzozzrQ2Wjff1gVehx1KN8YxtES9AuJhkAxTlIY8ga/xmM451YJkJNEv2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f+dJijoTw4ZONB3PNj+BKtmZoNK+/YK4zYfutmfpBEo=;
 b=LWMMBd2+C/Rw1XE7ingYXub+EulZdtLDQsDuzOyOhd3TYwx20WAEsLV9qfii9CFFoHxVorXulEROhg8tXsYSxZNJHPTMQN15SfO68OxaHAec7LldF2E/5qc3RmdndkVr/C3p7l9uqj58JyMqckin+O+G9jFRhf3cYyPoN3fVcTk=
Received: from SJ0PR05CA0124.namprd05.prod.outlook.com (2603:10b6:a03:33d::9)
 by EA3PR19MB9445.namprd19.prod.outlook.com (2603:10b6:303:2b1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Wed, 31 Dec
 2025 10:50:08 +0000
Received: from MWH0EPF000A6735.namprd04.prod.outlook.com
 (2603:10b6:a03:33d:cafe::e7) by SJ0PR05CA0124.outlook.office365.com
 (2603:10b6:a03:33d::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4 via Frontend Transport; Wed,
 31 Dec 2025 10:50:07 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 MWH0EPF000A6735.mail.protection.outlook.com (10.167.249.27) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4
 via Frontend Transport; Wed, 31 Dec 2025 10:50:07 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id CAD1F406541;
	Wed, 31 Dec 2025 10:50:05 +0000 (UTC)
Received: from EDIN4L06LR3.ad.cirrus.com (EDIN4L06LR3.ad.cirrus.com [198.61.69.19])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 80367820249;
	Wed, 31 Dec 2025 10:50:05 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 6/8] firmware: cs_dsp: test: Increase size of XM and YM on Halo Core
Date: Wed, 31 Dec 2025 10:49:54 +0000
Message-ID: <20251231104956.449696-7-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251231104956.449696-1-rf@opensource.cirrus.com>
References: <20251231104956.449696-1-rf@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6735:EE_|EA3PR19MB9445:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 8f681514-efb7-4278-8fdf-08de485a5ccd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|61400799027;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6oKfsDhIJTE7jdUkF2kyZQKFwbCFH4OtwWZttOa4Atlt3ssNXYqkuk6ZsJqJ?=
 =?us-ascii?Q?sy1ffJUoitW9BXej7UQNfJLfue1tMvuyNDv5hgD4ntnGJlh+4UgE2YcgqiOm?=
 =?us-ascii?Q?r2htAmAts1pm88fRBq4Jkyr5gx3VoFNeBHBTNRJ8j5z+uW9GB0in+CGXZaE+?=
 =?us-ascii?Q?K+kgmqRFuCdRVQJNWfPQlcol7bGXF/CYGxl3ijgH8A3kHfEdjcBs+7LDFljX?=
 =?us-ascii?Q?WTZSa4Hvpe+Ia1rVmYCUqliw4R23ny/12oBUR6NrkYcuiblREA248heggsDz?=
 =?us-ascii?Q?WwmDRV1NmAOh9e1PPjb2P7kr/wGbwaSYiGpi8uQii2vAq1pSW5vjOQ1PaYpn?=
 =?us-ascii?Q?XRyi35I3qA5sNtm+8DdOJMat0/XN+MXKlEYSimsAEXiToWqhSKbj4FtGsPoZ?=
 =?us-ascii?Q?2zFyLd5Wn7bALdQMUN1bciiugp3SiFZ8Ss7ZqVqViJwOVfu5FiS+di/qwZMu?=
 =?us-ascii?Q?BCR37ccimm5EWz+DaL5dHqIkwn2fTc3TyrVLM9c5fASahiBSPmRc5BS5Feue?=
 =?us-ascii?Q?emlBitZJcT9IsHTJr8xBPf6G2LjMfN9EzDm8m6eHKrMrRSOV8erdESpn6w2V?=
 =?us-ascii?Q?6kTGaW4PdxDn+/T7ITSo1gGFSYAZ4VWXDfDXI9YJPM4bTxeuOctJkD/PW2EZ?=
 =?us-ascii?Q?hcEq/q8bU+HuErnxJ8b/wvK4q7jU15QXGcOABW4AbCNcCFDnN4OkX4OTCcAy?=
 =?us-ascii?Q?/UaNbOyzucWtLhowsPQQ4mm7+AkX+OgnwC4zkt7fV5vHaRW2WvExFInUVFqA?=
 =?us-ascii?Q?ZO+YxfZ7xn5X4RqQqsz9AXf8KVWo09dr/RGvk8LNCYDUv0cmigkyr+64BtX/?=
 =?us-ascii?Q?TZkTituRmro0MpnKfEqa9jbqfbOiQHnsETVKYiaK7ybL3R2mudTAHpMnUdVL?=
 =?us-ascii?Q?I0bgUO1oZe/321T/4huVdzXZ+TThgwq81yN9A8XBNVQ/bKvsLu4meFAFGJ1/?=
 =?us-ascii?Q?rUkKqDWihaF7Ru+vZmubOLZe+hL4FD4HNzhvEAZYMSYehmH1gYbWZheZgvoy?=
 =?us-ascii?Q?IWI6rfW6gi9f5uPETIq0xgSv88G241b7IbXFe2ZE6cL5d5e6S4x87behxVfi?=
 =?us-ascii?Q?tGRV89znbIVgjuXHulv+WTlZx9cagR169dSwqyBF7yXI8cZX2Z2wf/4idpzf?=
 =?us-ascii?Q?jaFKrv6kHsQXHuidu0Q23aFmQ+1lSoBH1wPdu0ZaTlv1HZ/4Rg9IuKjF/z9c?=
 =?us-ascii?Q?0UePxlmJgWXEsZgszi7gFi2YdAfTsm9P831iNKu2bg6Fy41oWB15tp2zSnzg?=
 =?us-ascii?Q?eIg5QycMv0aVPg7cH8G71eLpj2I4EHTf7IveCrWZ+2CofsJLa4b3dwyAfJQu?=
 =?us-ascii?Q?ScWZixpqFx4atF45XTffIFMAfuMqJyIT+VrWgBekzGjAdjMgkSbpMOUgvXi0?=
 =?us-ascii?Q?peU4vptmw+Ela/Rz554fhYjJgf1a5m6Mb3jCMd+tAdBk46cNR2kEdiKOW9ww?=
 =?us-ascii?Q?BLRa+8NC4S9iCcOAYKK4zGySZXPhWH0oxujx3Z2gKomuXBDQQoAZgwYOnndQ?=
 =?us-ascii?Q?d/fp5j1vJkj/sM65E44BNxbXUtmam/2jcow6w2zYH+gV7KiT9ra+Kfti2lbK?=
 =?us-ascii?Q?rnPA/hEn+9G59Wp06+M=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(61400799027);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Dec 2025 10:50:07.1263
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f681514-efb7-4278-8fdf-08de485a5ccd
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-MWH0EPF000A6735.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: EA3PR19MB9445
X-Proofpoint-GUID: 83_ooPpE6eMsFyYAP-4CU_NoKlWETN5P
X-Authority-Analysis: v=2.4 cv=Z8Hh3XRA c=1 sm=1 tr=0 ts=6954ffe2 cx=c_pps
 a=IdGK5G2lCojo2e2ercq28Q==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=wP3pNCr1ah4A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=w1d2syhTAAAA:8 a=QJCE3FmpgMk_I34YA98A:9
X-Proofpoint-ORIG-GUID: 83_ooPpE6eMsFyYAP-4CU_NoKlWETN5P
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMxMDA5NSBTYWx0ZWRfX2slNkXMbIgVK
 y0YG9Z5tkoOemtD2fsBheS15azb257C1DLaoGwpcecuwFbKJDC1WLV4ENgpL3xpGwyeAzv+lF4P
 RZNhsr4ESDQK6GQES9TzeZ76RFxntJVJDzHdPuYoMO4Zs4enJ3LN6OFABTx3siZISRCTqrJihLn
 11cRhcqkMvih0FUBAi+pH8XXdx7TSAxPlxG9kRVY8+sNwDd8FHIZhhiKCgMTpCEagukAsJVKzY8
 0aMF4Ioe1U5QiX8r6Sz3FDpvnziWe1vYRm2xpIrkDbUzzuyJQO4ZWJ7UOeVTEST7TiqZDuDJVGn
 8ovmvSAO0i09XLS5GJODZJkF9HbArhxXLbUVMQZaKxwFylb1FIds17g59QqBnGLmi0rg+vXwRTk
 D3wOru+371UQs8zjamnJsPuaVgjT1Euv1aEIa63TlDDfCQYYEEROYNhzPCK5AC4BVPXewhR6t/e
 Ye5tItyRmXsJ5EKxT2w==
X-Proofpoint-Spam-Reason: safe

Increase the size of the XM and YM regions in the mock Halo Core
register map for testing patch blocks with 32-bit offsets.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 .../firmware/cirrus/test/cs_dsp_mock_mem_maps.c  |  8 ++++----
 .../firmware/cirrus/test/cs_dsp_mock_regmap.c    | 16 ++++++++--------
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/firmware/cirrus/test/cs_dsp_mock_mem_maps.c b/drivers/firmware/cirrus/test/cs_dsp_mock_mem_maps.c
index 95946fac5563..7fb404425fd6 100644
--- a/drivers/firmware/cirrus/test/cs_dsp_mock_mem_maps.c
+++ b/drivers/firmware/cirrus/test/cs_dsp_mock_mem_maps.c
@@ -23,10 +23,10 @@ EXPORT_SYMBOL_NS_GPL(cs_dsp_mock_halo_dsp1_regions, "FW_CS_DSP_KUNIT_TEST_UTILS"
 /*  List of sizes in bytes, for each entry above */
 const unsigned int cs_dsp_mock_halo_dsp1_region_sizes[] = {
 	0x5000,		/* PM_PACKED */
-	0x6000,		/* XM_PACKED */
-	0x47F4,		/* YM_PACKED */
-	0x8000,		/* XM_UNPACKED_24 */
-	0x5FF8,		/* YM_UNPACKED_24 */
+	0x8fff4,	/* XM_PACKED */
+	0x8fff4,	/* YM_PACKED */
+	0xbfff8,	/* XM_UNPACKED_24 */
+	0xbfff8,	/* YM_UNPACKED_24 */
 
 	0		/* terminator */
 };
diff --git a/drivers/firmware/cirrus/test/cs_dsp_mock_regmap.c b/drivers/firmware/cirrus/test/cs_dsp_mock_regmap.c
index fb8e4a5d189a..5167305521cd 100644
--- a/drivers/firmware/cirrus/test/cs_dsp_mock_regmap.c
+++ b/drivers/firmware/cirrus/test/cs_dsp_mock_regmap.c
@@ -157,22 +157,22 @@ static const struct reg_default halo_register_defaults[] = {
 };
 
 static const struct regmap_range halo_readable_registers[] = {
-	regmap_reg_range(0x2000000, 0x2005fff), /* XM_PACKED */
+	regmap_reg_range(0x2000000, 0x208fff0), /* XM_PACKED */
 	regmap_reg_range(0x25e0000, 0x25e004f), /* SYSINFO */
 	regmap_reg_range(0x25e2000, 0x25e2047), /* SYSINFO */
-	regmap_reg_range(0x2800000, 0x2807fff), /* XM */
+	regmap_reg_range(0x2800000, 0x28bfff4), /* XM */
 	regmap_reg_range(0x2b80000, 0x2bc700b), /* CORE CTRL */
-	regmap_reg_range(0x2c00000, 0x2c047f3), /* YM_PACKED */
-	regmap_reg_range(0x3400000, 0x3405ff7), /* YM */
+	regmap_reg_range(0x2c00000, 0x2c8fff0), /* YM_PACKED */
+	regmap_reg_range(0x3400000, 0x34bfff4), /* YM */
 	regmap_reg_range(0x3800000, 0x3804fff), /* PM_PACKED */
 };
 
 static const struct regmap_range halo_writeable_registers[] = {
-	regmap_reg_range(0x2000000, 0x2005fff), /* XM_PACKED */
-	regmap_reg_range(0x2800000, 0x2807fff), /* XM */
+	regmap_reg_range(0x2000000, 0x208fff0), /* XM_PACKED */
+	regmap_reg_range(0x2800000, 0x28bfff4), /* XM */
 	regmap_reg_range(0x2b80000, 0x2bc700b), /* CORE CTRL */
-	regmap_reg_range(0x2c00000, 0x2c047f3), /* YM_PACKED */
-	regmap_reg_range(0x3400000, 0x3405ff7), /* YM */
+	regmap_reg_range(0x2c00000, 0x2c8fff0), /* YM_PACKED */
+	regmap_reg_range(0x3400000, 0x34bfff4), /* YM */
 	regmap_reg_range(0x3800000, 0x3804fff), /* PM_PACKED */
 };
 
-- 
2.43.0

