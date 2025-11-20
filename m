Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A914E344050;
	Thu, 20 Nov 2025 13:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763646295; cv=fail; b=oWXS6ui5Lg2qOg4+hMsICOV+8hOMtyLQUVBLLrtses40/u6JaSlbRQoD/lSbtiBCa4JniITwxZ7hH1Y/eYoyuXx7JPqkmYFO7jhb74IHzdYuIzCjLcEyF/NVo5xQATauLG4Mj0SxR7EPG+OoTwStGcmfybJzai/QSVrf+WMH3oU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763646295; c=relaxed/simple;
	bh=Rc+/s6CFxw9Wjn6J0Wyxi834tMhhByNJ2JxV102kjy8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=A1N9sHrkm448/zNB04ftmNQ8m+8Js2LTmt4IO+P8rpYuFRQI5SgInjDO67OyUkwlp8sgB2fXk19Wdk6X5hyK36Dq0bSC1xs/saF6k6P6a3VG1Bq/UdnBqq19SwwOXeTNHBVE1nki2z/dyQ3r7ARvDtiInJ5U7wnLvqNhanKEYR4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=fB7IXoR2; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=yFxWhksc; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="fB7IXoR2";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="yFxWhksc"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AK4kGsR255784;
	Thu, 20 Nov 2025 07:44:50 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=AaJLJdKJfHJOO4MP61aLWPJJW+5zJVTBW+9qks8+3rg=; b=
	fB7IXoR291LKwzNpXD2apQYoIR3zhXR1p/oONv8AA2rH8geGJzDSzuMMSBBpoxKW
	G4sU4Ihyvt3eBH3OPU/YevBAFiZsgdWmtArTeqgr5Mpj1GuBJNzwWT+Dzvgx12bd
	mjOhuY0OGpk3nb0ZhVWK2L1ros/6vZr7y0dPGPAgu6iKJxvvoNJxhLa4eQ5uoUPD
	sGuhZsv2LCgCaU1P2yprY543Nn9ZwXGL9PmNQ57wyQwvoLoN9zAADbUAJ7bBYUDb
	wr9PIwjQoQ8CKXpp+MJMgCLckv19rm3pCUtRgaMQs2K6fL3q32pdIURtzBJWr8D1
	FzBHA17+hzO+VSsI63twVg==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11022121.outbound.protection.outlook.com [52.101.48.121])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4ah1bmaf4c-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 20 Nov 2025 07:44:50 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LcnLkHT/GvzYjrvnKXZjGH61XD1ynx88kg5DkMfWha9Pr2R/m3xxjoPEQNLBKt5BGDJIIzP7H2nYTRBmBCL17GI4J5cai1fDiTBXqFK4t6+7xkHkTiluBvhM7drXPIkgQcy31nzI4flhqUuSd1Gb2vIu1W8UpBntkm5y0utjecnWT6h2pWDAhnA4HF9gyFcPKP+u007ka3bSxgaSIajI4t75hYtC3oVzr/KjV9VbfWTvC9MzPnE40Lk0kApe9npK/GYilXscmSaWE/cHIr93pJPoiHE+5TZsguaIaC6j2LKfWl8pXmSLvzirr+3vvTfX7+3kd9nhMm8abzIkCaJqGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AaJLJdKJfHJOO4MP61aLWPJJW+5zJVTBW+9qks8+3rg=;
 b=l+udwV3hfbQbFXs6VJVERrqIjeH4rMbhgICrlOX0CGtekQ1lZcVcMpU02JBSwxoomaMXgYDMzdHxMs7JuL8hl3G6VKzbYpujVSyp9x0YWdHQbxTbagFTAX/nnBayGu/EhI7/9Ng5J64uee35lsZPojpt6JGfZ9wsLc9BY3AYaY5yh+3WJS6cTbckk+uuq1OLLuXETkVZDbi21sWwColZKxXLv+08EAjFjtQnlyDeaSsEH3O8rrTLpUeQJlrk6Pb9mzq58A1UIoeYK6rI0v5gTTlo5JNFosN/fuj3dIxJKLXrbDmK31Mun5VJHtNMdP1lexIsk2kKTkFeIJLFJPRZTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AaJLJdKJfHJOO4MP61aLWPJJW+5zJVTBW+9qks8+3rg=;
 b=yFxWhksc3Jw8VO5gUyqs7ha96jA7dQa/AKKqxlv6BZL+FM5blzis6X55zIv2S4xOmPXbZGnpWrTke1m4fn5ju9AZ6d6354ie21vPXtvZQbQSR3vsSqZF7vm1B7iMIeHYVCFk/VulNAbLCUjnX2cUUyERmR6oE5i7V8TxBzmiIIA=
Received: from SJ0PR03CA0164.namprd03.prod.outlook.com (2603:10b6:a03:338::19)
 by MN0PR19MB6142.namprd19.prod.outlook.com (2603:10b6:208:3ce::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Thu, 20 Nov
 2025 13:44:41 +0000
Received: from MWH0EPF000971E2.namprd02.prod.outlook.com
 (2603:10b6:a03:338:cafe::27) by SJ0PR03CA0164.outlook.office365.com
 (2603:10b6:a03:338::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.10 via Frontend Transport; Thu,
 20 Nov 2025 13:44:38 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 MWH0EPF000971E2.mail.protection.outlook.com (10.167.243.69) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.9
 via Frontend Transport; Thu, 20 Nov 2025 13:44:39 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 8E34640654B;
	Thu, 20 Nov 2025 13:44:37 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.24])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 7D6B782025A;
	Thu, 20 Nov 2025 13:44:37 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 1/4] ASoC: soc.h: Add SOC_ENUM_EXT_ACC() to allow setting access flags
Date: Thu, 20 Nov 2025 13:44:34 +0000
Message-ID: <20251120134437.1179191-2-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251120134437.1179191-1-rf@opensource.cirrus.com>
References: <20251120134437.1179191-1-rf@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E2:EE_|MN0PR19MB6142:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 24740472-f881-4e9c-7230-08de283af3bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|61400799027|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8Taw4d8+KZZq/HNNP82WZOW5QuloRoRLIARZvgIkECL6KumW51CZaRZZuiNe?=
 =?us-ascii?Q?wyw4PGSgnQfUetSOOXb2J2r/prsr3j/PHE72Fr3XyoZ9HmS53zs3bC4z4Ohe?=
 =?us-ascii?Q?l5rj7yawQyc4REU9ghaD61bslg2iEu0STeg6Hxd8n9I/YENDjQIaezEcZ3Zs?=
 =?us-ascii?Q?6Ik/q6E2Zoo6doD7nB3zHAhZ7/NDw004HCJ44c96wsIAE0+GEc+aqiEOvDX5?=
 =?us-ascii?Q?h2diHcyi5eHC3XUkbWrZV0GLiIdIQpp4ssc0tbncRnIuCyxXhSm2Wx6T6zDP?=
 =?us-ascii?Q?Mxp/Bgpnqrq6cyF2DhQcd/FH9EEZS4SI8YoyiOzXw4t/yrLx5OOnauGwLW2Q?=
 =?us-ascii?Q?+7dCIueu2Fj5IB0OzFzaUtWZ81OPJriyhkYR0/9vQUTvAQnSCWevAULc48xW?=
 =?us-ascii?Q?0YgYuixSZ9Vkzbvrrg2y8cIW5jZIMZGGx783Qv+7jc7hOSnvl4Pqbjn2RxpU?=
 =?us-ascii?Q?DILbTGgN8Sahd5S6gVGx1byifExlZJFPCHlj5XDyXSC1mEswQinoVxU9TNsd?=
 =?us-ascii?Q?FocJpKdvjZgSrUonv3nxg5FgVgKbmrGTOZsJCeyOfFDJi4guUUTB4evJ5Ojc?=
 =?us-ascii?Q?m+zP/wCzUILRCg/Sx+vmSiMz2NE3FWQSpRIV4awAlkOhXf+lGzXkbvnqFi6+?=
 =?us-ascii?Q?6TsnjFUbsakuFJQq4lUmM+RfzwZ/vzK4+2a6mKXkGCV44oHdQzn/F9V+/ZRH?=
 =?us-ascii?Q?OzL4hJxC8wzCna+wETB3sHSNa6+OmedY92HslakRWfXCTIiiZj7q84mVS689?=
 =?us-ascii?Q?+GtTXjNLot1VoAuAontaksZfA8GPszc3ngE1A/lGGT0k6ZRT4e2bebadXeRv?=
 =?us-ascii?Q?fmIhr3NPZvxR/+4udqzomQvPbrGaaQha7enI+PJghDobfqSvEdiXdAsSppsL?=
 =?us-ascii?Q?O1jQwlB8lhumqXCDzhi5xUZw8JqlEdEgLjN9qqVV/BZon+J5kSQtkP2m3LNi?=
 =?us-ascii?Q?ikQ/cIWv6CTQskHSxq3uDDBCZSbfVr7JoR0q/bz4r4f4BFqMhjXSi76QXVst?=
 =?us-ascii?Q?158zxs/3F9nreOXsWHthkSEeUzzzycxNENFVrgsHAkwZB5R3W7FUT8aqEsyA?=
 =?us-ascii?Q?5U6KWffRVUT9ZR1Gj0E2zZVbXUzZ8Ry8GvZSl68crU9WIY23ccZb0JKls1d9?=
 =?us-ascii?Q?i5liRJDhS/dchx+IuyYKp1yHJkCGqZBJFl8Vo3lC9a+I+qRtdVYi1UTP+jCM?=
 =?us-ascii?Q?oEgSrRPgGvveKoeqgCN5BAHlN+ZOhQBW2Fx7NEVInLHSVLEDxu665P5eYW61?=
 =?us-ascii?Q?pQWk8AUQTP5K8s4SnzoFftvxkCuJOw0FOhZozHdy5NMw+WoseY1cXeOTCxCC?=
 =?us-ascii?Q?sJQZ8yeD0QteXeSo8cLMqJYF2mafwMl+vM/reOUDMQZurjWsNGjjdhkhKp3i?=
 =?us-ascii?Q?n5fVh24ycRJQSU0ubBJpcvRS/Wvv8YY3+Xh+GtIzh0eNonDGZPLqsKz6Hvvp?=
 =?us-ascii?Q?1q8Q638pHqd4I+J1YMWD2QmhBqbsSz3iv5h1ePHkcgnsPTeHGE9kCOt30cVw?=
 =?us-ascii?Q?Gxovf8STqRp2xrGV3V2H6uP39352F9YRk6Jv51vdvBFXZYUPh143wkeSHYk5?=
 =?us-ascii?Q?6rVq1UzohPhitNeQuY0=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(61400799027)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 13:44:39.2274
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 24740472-f881-4e9c-7230-08de283af3bc
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-MWH0EPF000971E2.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR19MB6142
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIwMDA4OSBTYWx0ZWRfX5/rl6TWBogWP
 Ak22EZNq34b3K5GkwkWQKrpAwAc1Hv9rcemaAmnowgshQiRXI9afuPcwq3fczAh0nGzTjfm/WsF
 4dMmgmJvNmmxbRKm47QaPmDgF09TVwB/JEHHyLhXY1Ikn5bBFT9f5k794d1Rv4MN8rJiMq906VC
 //KKDQQpYr03/UmLoZy5e58FT5Qk/FJ+h9QY/KI9BL1N033NAazqnfDg3JuPobNneMCnlVl9NOF
 Mu+0EhU5mfDTH9oq/ggA5bdzVo7IjG7z+4DI59EEkzLO//32qcQVbm4Gd4vlmG5idEO6JqFjeLk
 YPQqhd/N3jPXsOESDfzQvkYlaBw1UGvw0xQKeHqJ0IDlVkBF7GwMLNcCnOAxnqaXpHfcXqIyS/w
 CQh6TJ+BV7hMTCnzKJRuzf+ZAZEchQ==
X-Authority-Analysis: v=2.4 cv=XcmEDY55 c=1 sm=1 tr=0 ts=691f1b52 cx=c_pps
 a=jtibSCz00SxEcFhpBRTXcg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=6UeiqGixMTsA:10 a=RWc_ulEos4gA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=w1d2syhTAAAA:8 a=1CAcU0HOnAuBGusv8tIA:9
X-Proofpoint-GUID: 0i_V7-KIwiM_mRjDpnQDO8eEG9Q_v2SO
X-Proofpoint-ORIG-GUID: 0i_V7-KIwiM_mRjDpnQDO8eEG9Q_v2SO
X-Proofpoint-Spam-Reason: safe

Add a macro SOC_ENUM_EXT_ACC() to allow the access permission flags
to be set. This is the same as SOC_ENUM_EXT() but with an extra
argument for the access flags.

This will be used by the cs35l56.c driver to create a read-only
volatile enum. It's preferable to avoid custom control macros in codec
drivers. Code maintenance is easier if all control macros are defined
together in soc.h.

This commit only creates this one macro that is actually going to be used.
There's no point cluttering soc.h with unused macros - that just adds a
maintenance burden. People can add equivalents for the other macros if
they need them.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 include/sound/soc.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 37dc6f6fc63f..b1b6b6a497da 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -319,6 +319,13 @@ struct platform_device;
 #define SOC_VALUE_ENUM_EXT(xname, xenum, xhandler_get, xhandler_put) \
 	SOC_ENUM_EXT(xname, xenum, xhandler_get, xhandler_put)
 
+#define SOC_ENUM_EXT_ACC(xname, xenum, xhandler_get, xhandler_put, xaccess) \
+{	.iface = SNDRV_CTL_ELEM_IFACE_MIXER, .name = xname, \
+	.access = xaccess, \
+	.info = snd_soc_info_enum_double, \
+	.get = xhandler_get, .put = xhandler_put, \
+	.private_value = (unsigned long)&xenum }
+
 #define SND_SOC_BYTES(xname, xbase, xregs)		      \
 {	.iface = SNDRV_CTL_ELEM_IFACE_MIXER, .name = xname,   \
 	.info = snd_soc_bytes_info, .get = snd_soc_bytes_get, \
-- 
2.47.3

