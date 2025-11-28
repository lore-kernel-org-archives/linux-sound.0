Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D189517BA6;
	Fri, 28 Nov 2025 11:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764329144; cv=fail; b=AV+ucSxxs2dxDGK7dLZWGvKoplY0JIr47L6vWR6cAM2zB2jqS9sv/79UNV/bkLIIt9cxqqnwj1CRcMNKxTvEShB0HeOBqBgPeqNhol2sAU+zUBsxVFZ2ZVSIeRZhQu0urPp+IWOLzGR4fqd892bcAab4W2a2xFt+hqx7zXYiOM0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764329144; c=relaxed/simple;
	bh=2kvS6ldB3QBjO5Mq/9Q2RwoxzR0VPYrN83OubkZrI1k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=AdhC0ZVKtj97l892uCNda392jjFZgW5UwbG1k5Tmgqmokdp92SmqbXeFLTsvpSvVm+QwGY+vBIR/TPi/M5n3wQhQoUmLKQv94aaOYLqB1+vVarNpxE0noGB3g2rrrfEqy4VPKp32Mu6tjXdZkDpinF296s3j08I97z3IhGGtKtk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=dDNw8stb; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=Uhnl7t2o; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="dDNw8stb";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="Uhnl7t2o"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AS91e4O2747797;
	Fri, 28 Nov 2025 05:25:33 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=oWDpVVcor94C7CtN
	KWxDDpGrAf/PQpI0suYOVOT3uww=; b=dDNw8stbZpn9Uou7wvKiFk4pqaLTENSi
	ekfKf9dahJw3Dog4QffeKbTjK37fiUnEZp7xqVH2/bKRVcgXCAQ8NKgXy2Fm/v/i
	unu5tA77VKbzvaSndGxT7wj25H7EEDQU/RszlU1Rz/RglI6PKc474s/7YbUwJmI2
	wlvN2ebazuUuKS60nXYVv1HOF2rggmhHRmfyf2QR0QTWBS8RnHRXcf2vbVHT+F5J
	xIsN481TJGT4fY1uVSApmLIBEk+bivh014pbJBDTTRB6j0L5/wPWTEcZ3jRq5YMF
	IYbxJj8FS1rvnlbeMbU/fujXgp8oPzrGq0vR+5p6GDJHBZa7oVrH9g==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11023087.outbound.protection.outlook.com [40.93.201.87])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4anjw5kf3g-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 28 Nov 2025 05:25:32 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MK21o8OTEFV+OSrr+6/3v8/3uYNyGRTm7Bk5gXXIP5dSrH08s48xgvQsZ01JV2e19EUQZMrJro+ivS5VCnUZgSzQadofUM7MHnjAZWK3wuRRHP0W/09ObbO0+MOCS6yqPuqyveRdQthxg+2ScRr0MzGKZ8VpQ1LicyyJL8ek8C+RX3k4fJoW0F2iJO23pZg8S9a9PTBZ9kOJUdXS1OFj01nDLv3UUbkagoUx9b9+u0WjFrPRN9A4b+qvR0z4i7cfcoQSEafLdsn0+c+8TZoM/9KpG4777bWwL7c1xeBdvmK0XaY8Vi2BayWMHtI/QdbCfvGFFjtErv4/RVVNfwOJbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oWDpVVcor94C7CtNKWxDDpGrAf/PQpI0suYOVOT3uww=;
 b=iUmHOTQzb7MpOQ/m0MIvJ18TMRBcrkpOjcDdqwGib8oOjyJv9RXRPES1aTvDk8Z694DyooasKLqUZhVIN8yjGYck0BfEqJ3EOm0bc5lXVKhXQ4tnPCXj8qu5/WgVyvgIqAMpTB2HJQxA4bLaSUBRmPeXSQLto5YugIVmXJFf58Ng0H1+laDiYs0G+wKDZlHG6CDd0nmQcG9vOwCeyt9/hBe9O0vhRVwkdpzxDyJi7wSOkIqUV57rFbsrFibl/YX0BUOACmA8Am5ADi0Hphphbu3CGwWnxRi/u1lIJlE/BiHvDXz4V+juOBGRQaf7UgHhG6CfX1P5owUx6i7XeH67YA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oWDpVVcor94C7CtNKWxDDpGrAf/PQpI0suYOVOT3uww=;
 b=Uhnl7t2ooFGBwwgjxnixxo/gB0qVrqo1/OH5yN6rrxRmOS8aDMYxVIgOd3+2/3LIMzVYNSl5iEaS4+arbWBTF8d9PFMIrpO0UZecXTfClfGYlEh0J9MhfZuK9gg3Aq7Wx4TbNfUD+vmrjM/Grj2ofDJ0XNewBUXes7t5gw/tlgw=
Received: from BL1P223CA0036.NAMP223.PROD.OUTLOOK.COM (2603:10b6:208:5b6::18)
 by SA0PR19MB4381.namprd19.prod.outlook.com (2603:10b6:806:8c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.11; Fri, 28 Nov
 2025 11:25:29 +0000
Received: from BL6PEPF0001AB75.namprd02.prod.outlook.com
 (2603:10b6:208:5b6:cafe::f5) by BL1P223CA0036.outlook.office365.com
 (2603:10b6:208:5b6::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.17 via Frontend Transport; Fri,
 28 Nov 2025 11:25:43 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BL6PEPF0001AB75.mail.protection.outlook.com (10.167.242.168) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.7
 via Frontend Transport; Fri, 28 Nov 2025 11:25:27 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id E217F406541;
	Fri, 28 Nov 2025 11:25:26 +0000 (UTC)
Received: from EDIN4L06LR3.ad.cirrus.com (EDIN4L06LR3.ad.cirrus.com [198.90.251.29])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id CA1B182024D;
	Fri, 28 Nov 2025 11:25:26 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH] ASoC: cs35l56: Log a message if firmware is missing
Date: Fri, 28 Nov 2025 11:25:20 +0000
Message-ID: <20251128112520.40067-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB75:EE_|SA0PR19MB4381:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 9e41f264-649a-4745-2dec-08de2e70d516
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2mjfg4LdS8FUZPkVtYko2Wldne8OIq1SE5fG6N8tSop79P5sYTYlKK375jaF?=
 =?us-ascii?Q?lqE7g3uM95PSoENX9LWSVDTtqVEVS2c6ger0KlnDA3o+59Shjjxzf73j/hiD?=
 =?us-ascii?Q?3RGw+9WHA+wIJpD+RuMmeFpxu/MofDf2GH9BtgsPio1eMjbEQUaGRgVeELwm?=
 =?us-ascii?Q?We90/eieW87flhrxGNmidcP/dsXeDzZk3m3NjeXO51T+EqXQOIH8RjRaPKnQ?=
 =?us-ascii?Q?8smYPAQgEfFNsr+PFdV/GlAxjeZq0wnl4KJQLooL7xovn0mU5/UBZ6scPSg6?=
 =?us-ascii?Q?SMfr49V4oAp3EBVa6xPYOZsj87uc7lgaJQpbi9exeU1e9ut7RJ734xJpXRry?=
 =?us-ascii?Q?+En5TriLHGhfyNL3IJ8JzM3pIwFvEQWZnWwLQHuZqgrvhAGRKvsECWOwhVh6?=
 =?us-ascii?Q?IfTO/cILSaj84K0N4RPUQYJfrIs9EEe7Cgv6SBWFwTOIJsAdS9anaZYiJHLP?=
 =?us-ascii?Q?jsgU1CIdTKbppZkaKNJcUKZIZKL7T4y5iKIQYtAIWUw5v7n0Yw2pNxQcJcXI?=
 =?us-ascii?Q?MvxtdavQr/Z8OFbmPcbzt0+QYDgUkp6/lODv2dhZGXos9gkIup/9vfo52gWv?=
 =?us-ascii?Q?L4kXdaZzRRxQigipBAwyboSjcYy56NmFVTavw7dsqvkCBOWJ9RwtgsCMlIdp?=
 =?us-ascii?Q?6yFzrBHHCx3oeoMpdVoT/L9PYKVw/Yn7BlmI1YQK2FqeAdLidIoGgFZP2Wke?=
 =?us-ascii?Q?tb+411wqmzZTD3rRq9CnQneXUfPFvw0OORm6hF/gRNUJTES2JHvbVjOqMdTV?=
 =?us-ascii?Q?gFd5Nz3PEIcPmw/BNLtCf+T2MVTiAF93GdSw20FCVJb/7qOe4v4rw3Hb4RPL?=
 =?us-ascii?Q?7DFM4Fwfp2PWt/QAYK4CTC4HLa+ZMhhn95DgX/wLDYPUigEsVEhWb7r9+46d?=
 =?us-ascii?Q?7XFNWWvrLdO5Unbxb5ekhZuj8IvjBZZzrpwYkGRfnIZWRaodslxdXD5oIc68?=
 =?us-ascii?Q?0I/rGBaYotRjKKZFQznxIvOt5og8HdNsWxTbcgvmjm+JrehgcLpdCfbk0stA?=
 =?us-ascii?Q?ITZtznAHfcCOXauQeljrhXR3ArERuvfG80ZYVyVn7zLxwmWpQJl53elqwIlO?=
 =?us-ascii?Q?VW5fyBmE+FxmhTfcNJVvwjrGbxIjp3oTKCBOBkEFspL8dRplDsHcumocs2sb?=
 =?us-ascii?Q?SCNV42AWU+cJTNlaT7G2st7iXHmcXdMHqbTEsjdLW0ITX9sLI2632sTeIOwR?=
 =?us-ascii?Q?HA8789rGgritBPdZktDswb5PVLujxvyh10BPqL34b2bvzLsgIhN96+II5HHg?=
 =?us-ascii?Q?FgikD51qZ5y/ll/hZ4EowNj+s1RrI7CzsKQYaPrj1FIaX7WST6gKgkj9qVqI?=
 =?us-ascii?Q?dGN6bMWHT1ZE87jbu/6MTZr6m2MgOZGavb9mECjhOPcW45FBddlZtDVamhWI?=
 =?us-ascii?Q?4T9j4VfXbdySYnicbzcX3roPc/PJDvFhN72itYUgSn28VGPH1vn77khAc010?=
 =?us-ascii?Q?5Fib1DCXWGZJYHvqc27/MV7YjVVL2vJG14d671r40LH9Z7337bbRUIfnA4di?=
 =?us-ascii?Q?SBcbuGWyG74DEIbupVyNhDJJXSXmElAsFbtrF0cLq/AWqtTgSkpqa1/nCNdA?=
 =?us-ascii?Q?+aK6v4lvp+dgIPhCDs8=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2025 11:25:27.7291
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e41f264-649a-4745-2dec-08de2e70d516
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BL6PEPF0001AB75.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR19MB4381
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI4MDA4MyBTYWx0ZWRfX9K0x4x8PiOLG
 huqW/FLiTI6xhLDjw1I3AtdkZjfsxyjE9GixIwz9ircm/eSFZWoqx4ckOPfGBcNKmgLh6xHbutJ
 P6+Ag1q5fE3Lp2CMZtouSuRhgp4f33luru0B4sWyeqZ5CsGDN3Y5Oqhj9oHoqrS7fg765rxH3p3
 jKCGZiPjU2rgCAzXWUBtPFFy01Gpnaktr9zfeEPkPGiqdNSfdM229e5qDExmstpcHftVDNcZFeL
 BK6Hso/Bpzmg0eXN5lWIO3RIAwyGufCb060T30vGSNjF2oZ/zryHjVyG4I07qH67D8h3RQIBZl6
 v+D3XP4tF7Yxrd70Vw+q3ZIxNVux0aqF3X1w4hJD6hQ+kNrCLmN+TMJTK2boYf8NVn+mDt7NN0g
 4wKtsBaOzV0Aoz4uFSph8sMa7ZCozg==
X-Proofpoint-GUID: 1its9FbEashsnV_upcNnorWjc7-iM3yn
X-Proofpoint-ORIG-GUID: 1its9FbEashsnV_upcNnorWjc7-iM3yn
X-Authority-Analysis: v=2.4 cv=V4JwEOni c=1 sm=1 tr=0 ts=692986ac cx=c_pps
 a=HuVJw3QhhfiwkO6XV87yIQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=6UeiqGixMTsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=w1d2syhTAAAA:8 a=vWIXKYv_inF08t3sf9IA:9
X-Proofpoint-Spam-Reason: safe

If the amp is still reporting FIRMWARE_MISSING after cs35l56_patch()
has completed it is helpful to log a warning.

After a complete firmware download the FIRMWARE_MISSING flag will be
clear. If this isn't the case, the driver should log a message to
report this.

The amp can produce basic audio output without firmware, as a fallback,
so this wasn't originally logged as a warning condition because the amp
is still in an operational state - just not with full functionality.
However, it was not at all obvious to an end user that anything is
unusual.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 include/sound/cs35l56.h           |  1 +
 sound/soc/codecs/cs35l56-shared.c | 17 +++++++++++++++++
 sound/soc/codecs/cs35l56.c        |  3 +++
 3 files changed, 21 insertions(+)

diff --git a/include/sound/cs35l56.h b/include/sound/cs35l56.h
index 883f6a7e50aa..5928af539c46 100644
--- a/include/sound/cs35l56.h
+++ b/include/sound/cs35l56.h
@@ -409,6 +409,7 @@ int cs35l56_cal_set_status_get(struct cs35l56_base *cs35l56_base,
 			       struct snd_ctl_elem_value *uvalue);
 int cs35l56_read_prot_status(struct cs35l56_base *cs35l56_base,
 			     bool *fw_missing, unsigned int *fw_version);
+void cs35l56_warn_if_firmware_missing(struct cs35l56_base *cs35l56_base);
 void cs35l56_log_tuning(struct cs35l56_base *cs35l56_base, struct cs_dsp *cs_dsp);
 int cs35l56_hw_init(struct cs35l56_base *cs35l56_base);
 int cs35l56_get_speaker_id(struct cs35l56_base *cs35l56_base);
diff --git a/sound/soc/codecs/cs35l56-shared.c b/sound/soc/codecs/cs35l56-shared.c
index 7424e1353062..60100c8f8c95 100644
--- a/sound/soc/codecs/cs35l56-shared.c
+++ b/sound/soc/codecs/cs35l56-shared.c
@@ -1337,6 +1337,23 @@ int cs35l56_read_prot_status(struct cs35l56_base *cs35l56_base,
 }
 EXPORT_SYMBOL_NS_GPL(cs35l56_read_prot_status, "SND_SOC_CS35L56_SHARED");
 
+void cs35l56_warn_if_firmware_missing(struct cs35l56_base *cs35l56_base)
+{
+	unsigned int firmware_version;
+	bool firmware_missing;
+	int ret;
+
+	ret = cs35l56_read_prot_status(cs35l56_base, &firmware_missing, &firmware_version);
+	if (ret)
+		return;
+
+	if (!firmware_missing)
+		return;
+
+	dev_warn(cs35l56_base->dev, "FIRMWARE_MISSING\n");
+}
+EXPORT_SYMBOL_NS_GPL(cs35l56_warn_if_firmware_missing, "SND_SOC_CS35L56_SHARED");
+
 void cs35l56_log_tuning(struct cs35l56_base *cs35l56_base, struct cs_dsp *cs_dsp)
 {
 	__be32 pid, sid, tid;
diff --git a/sound/soc/codecs/cs35l56.c b/sound/soc/codecs/cs35l56.c
index d8a3babce0f6..55b4d0d55712 100644
--- a/sound/soc/codecs/cs35l56.c
+++ b/sound/soc/codecs/cs35l56.c
@@ -823,6 +823,9 @@ static void cs35l56_patch(struct cs35l56_private *cs35l56, bool firmware_missing
 		goto err_unlock;
 	}
 
+	/* Check if the firmware is still reported missing */
+	cs35l56_warn_if_firmware_missing(&cs35l56->base);
+
 	regmap_clear_bits(cs35l56->base.regmap,
 			  cs35l56->base.fw_reg->prot_sts,
 			  CS35L56_FIRMWARE_MISSING);
-- 
2.43.0

