Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5ECA2EAB82
	for <linux-sound@vger.kernel.org>; Fri, 12 Sep 2025 10:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757673333; cv=fail; b=oOGDoTcmzKgSbl7unHIVayH1+WY6TTKORDis7Ae62/+FO8Xnb7fv2nsjQZIghMZ+A9s7C2ACH4RPP4pSJF/OoQ48JPZGuw2wHoponf2LuCBl88ORClsSnwIfqzixJbmLeYCsqup8yy2pWmQVV6oPwU8wlqTRqlbQw5arYPnRJMc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757673333; c=relaxed/simple;
	bh=Gw+WobGOVJks5mtjRAIe9QHF1hlobNhAnispBO3VxuM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EnSH5jInzIhCArSthPg9msl1ADUSRbzkF0U8/ogxUGTgy+CXg70LA5iOdAh+HjZAuzfkhGRH/q4bnDvv4+xa3USqExK4m4zGOPLaNjxRzA5Ut3qHT+8UiQbXpLv035/CljyJIa1w+dtldpm54rMw9TK5M6OokSYW1tjP3Ip/M8c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=hJ6C/cc2; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=IwcnCxPm; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="hJ6C/cc2";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="IwcnCxPm"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58C7QEbj3763904;
	Fri, 12 Sep 2025 05:35:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=PM4tSWRPBfpwfM+8mhVrGeJVp0AlOtx0xP6IWQ2MraM=; b=
	hJ6C/cc236KshaUvuVDzc+DhQbwX92zrYRDtI+H657v/CIIS3w5gfmvCeYlhDOOm
	YXK9sXiGtdqZvoqRa3vBUSKkMVDioA5BUn1ipSAOo3TUg4ldF7PAC5KMsfMV/9tc
	9T0MBo3HpDq7Es0hmDhXIYqSARNoONGfBzWeLftqtP5SS3cfGqX46fLouETTBsQu
	d1yBWul+2kYY1PavMmESmxsBR0X1ohohVxeMDokSLTYBxNsuyUPbbeTXjPUEhfWc
	Dv/LuFmtGMbfvmQHBrqOJG2K/bCQpsl0MOhjyCcmGfWqzIC+6bv8PiX3iJANth2o
	j7IbfXt7aGUAMOF7iTVy2A==
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10on2126.outbound.protection.outlook.com [40.107.93.126])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 494due08yj-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 12 Sep 2025 05:35:19 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cje2ng9DlsL+zK/BvNidPIq+4Igh4o5+d4x9RxTjuA2zt1v84o3JRVi5jWLDBQ4tVZbAnzCsMI+0EZe4smP8/pwqU0HQptimlQyK8kaDoLirQ2LbgaRZ+77+fAnd9XalGv9RpBn8oiFAr/cnJc+olywMNKn2a9R5ftm2jvttJKx91clDL/egfjnAKZJYZX9Rs+NFVRY8beAgZ7JNtgZAFMeinPq28orYw10+FnP41jqqKbgbn0o0d+16wo6BUZounyZ8tQf3DPjTrjNNQaBY08dwp0FYlZVMm6SEL4GjZkN2LHf+cghLERmmDQDwwDCMMKaB4OtYIvlIpLmhR4P0Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PM4tSWRPBfpwfM+8mhVrGeJVp0AlOtx0xP6IWQ2MraM=;
 b=xgLX+FSaGe/peRvAZfElWWW6rYDGs9xciKOsc2awY+m25ubhf48DOAUj6dwguVVMclK+2wythyA/BsiilfRa/vUskITArOSIkpVp0K/HPkVEWJAwjZQs6Yq9dYk5G3zU9PSNfVElSaJD7O6wl5i7yUvo7WKLt2HLsWVqmP3+dXYspYP4H6HGvwUH8aKA4T477nvOKAVBZeArkQz5joU9O/WqiZwoXX3sigizMDMtXrMeLvLzaZwP0TgsPOKZ+f/aMvvP1qbO+ehBDSI5V2HnzwATi1lEGJBHu4FwBvc2gikhcgF1nad7AzCEcybhXhMymYUi1lFluRnQlrs0UGC72w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PM4tSWRPBfpwfM+8mhVrGeJVp0AlOtx0xP6IWQ2MraM=;
 b=IwcnCxPmVZ5t5DwflrxtGcuIIPw+2qwCAiJDhZffRW9RikwwqkQkOxYmJxozNd8sLK+bqqABK0frDMlBaizDIt+ZaCj53hJMGt1Yt2wD08V5FV+KYu5ZwD+cZziM3SBCeXEejoj2rdkUcRiVQ32uJzs+AmA9TJfGshf+C0wwjps=
Received: from DM6PR21CA0007.namprd21.prod.outlook.com (2603:10b6:5:174::17)
 by CH2PR19MB3895.namprd19.prod.outlook.com (2603:10b6:610:92::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Fri, 12 Sep
 2025 10:35:13 +0000
Received: from CY4PEPF0000E9D1.namprd03.prod.outlook.com
 (2603:10b6:5:174:cafe::26) by DM6PR21CA0007.outlook.office365.com
 (2603:10b6:5:174::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.7 via Frontend Transport; Fri,
 12 Sep 2025 10:35:06 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CY4PEPF0000E9D1.mail.protection.outlook.com (10.167.241.136) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.13
 via Frontend Transport; Fri, 12 Sep 2025 10:35:13 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 4338C406564;
	Fri, 12 Sep 2025 10:35:08 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 2CA3982254A;
	Fri, 12 Sep 2025 10:35:08 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: rafael@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        shumingf@realtek.com, lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v2 13/19] ASoC: SDCA: Add SDCA FDL data parsing
Date: Fri, 12 Sep 2025 11:34:58 +0100
Message-ID: <20250912103504.2679226-14-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250912103504.2679226-1-ckeepax@opensource.cirrus.com>
References: <20250912103504.2679226-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D1:EE_|CH2PR19MB3895:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 8c992118-f34d-44bb-c6fd-08ddf1e80e8c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|61400799027;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?iMxdFEjzRlOgB0+JRCb6xbmj6ttCrToi2Qn/lS/uN4RccQx+0OYQsdYk3nBD?=
 =?us-ascii?Q?UXo5/IgTnidgUkQBHYVuSabSkuc1Bhhp+m8ztCj2iifdiBMLw/B10ucqpa4V?=
 =?us-ascii?Q?75wNtJTXs349+wYly8QuRMp9kxPtV+/7X4iZEEVWGfExZzWtHUzXmfFGh+EW?=
 =?us-ascii?Q?dsDOS+hsmx84M1v5CFNfRpEYgLH++RJ/be4JyzeFlQSH+7at8r7VToelNkxw?=
 =?us-ascii?Q?AaPdZk07BFVn5STKQxUDRe8ID+9uUDhrUfx6t60f4L0P59oNnoDQkoU9UYsA?=
 =?us-ascii?Q?Yxusw/nFGoGo09+UIvcs5NJoU0lgJZSzl+y1LGxr4XKEOtQU1sd/4YW/TP/b?=
 =?us-ascii?Q?vboVu8PkqV8BFI39Ku3HXmxjhlUnDc65fE5r/UrriI+bbKxtNCPj3S7AaV7y?=
 =?us-ascii?Q?J1T+RF17Uf/gRHuJa5KMiMJkP/nywvPne3VtVjS5Dc73mSNhpD7BclGlsAXW?=
 =?us-ascii?Q?Xy+zCs8FYywlkfGMYAKQ52chD1KLQ+pNn2idgOZ2Vpa25t+okwFGFB2lZvyp?=
 =?us-ascii?Q?ZIe7gL7dswiG4AKf7ZBmvD0Gldgy6viLN9vJgZdiX875DTah9fKyhVh8VtzK?=
 =?us-ascii?Q?pKNd2fvMt5AWFXEJLfBPV5jwCsmtfzTTFhPGDoBvwePnebn1gxL2FT3yMe+0?=
 =?us-ascii?Q?oN2zlW98escNh5CZYPWOSZFIepeotiooN56rrEbTnYpGexjV2n7YOazMeCHt?=
 =?us-ascii?Q?U34SiPG8kXh/cRg5PkBMn/BbY4USySM87Flk8BWL3w50UJVXlTA0CHezqYiV?=
 =?us-ascii?Q?8E2KqhS0RSq9s6i/66KjpjBx1NzXNO7OcR0u42oR2vuzzpNLyBHjf0Hkw6V0?=
 =?us-ascii?Q?lLi9fkn4MA6TCh60EHnxlrWcXA0uwfO0P6bnHMAmheImb0Xt1epJIVo7pAGC?=
 =?us-ascii?Q?PGQS54q160MzN9HRLtWTCPCH7AnNzeTXpcXA057dCxW99eU1WyEIOCzDBeOI?=
 =?us-ascii?Q?wBhf+7x/6IR6xZ9wKwHffjoa6XSQI5yi7uT9cxSPoQ5XYt05rW0nCLBG2XXL?=
 =?us-ascii?Q?uCNeiS9lR4BqHK3R+pSg7pW0YLHjIGMrMCUbh/Zxh5seogdhPGFY9YQMT3wv?=
 =?us-ascii?Q?kAjH8ohF7nzSayeC5z1E6yhI2UGgbRcAauLrtZ+pKZYfotKy02VyCfNDWcd9?=
 =?us-ascii?Q?KCzg2+TEeSdkn1+0lzWj39MxyX4B5tZJVo8sUOQrDaGWjhJiIg2EE8d6oe5p?=
 =?us-ascii?Q?8O8/Y+lGMLCr37rK3U3jTRYl35IdGPdMJap07jxLT8AsQFPfl0/yZoNRuGR7?=
 =?us-ascii?Q?FgENwRKg4ORi8XCcf0z7YhATByV0fJwXCQ11TJOV6gIKO9ba3AJMvZgq8YaG?=
 =?us-ascii?Q?w7Fujg9iIM7XxHvS6pU3i1TNDTpjYPJ4GamBEhWD/RvsTM70DOvFZplx/LyC?=
 =?us-ascii?Q?+XrOAgQZokw4fqCexg/J/UzBajuCmhVBHLxde8AiNVNogZGSNAnr+Q4gf88O?=
 =?us-ascii?Q?iS4LPylRK+uFHIFPPWnasq6QUfgxq05ampQbMVr/pBgE2bIw8k7NzZD9plEd?=
 =?us-ascii?Q?LE9srMa+bZM82tv9IcvGo6kHRD4IHvBQweIt?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(61400799027);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2025 10:35:13.2416
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c992118-f34d-44bb-c6fd-08ddf1e80e8c
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CY4PEPF0000E9D1.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR19MB3895
X-Proofpoint-ORIG-GUID: LyP_WZ8ZiEyIQw4G6b2nwIuIWeCO4rQc
X-Authority-Analysis: v=2.4 cv=F9NXdrhN c=1 sm=1 tr=0 ts=68c3f767 cx=c_pps
 a=dxS29g6ekbaI5K5MEW66qQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=yJojWOMRYYMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=w1d2syhTAAAA:8
 a=gdKTTE99PY5FDwdXciEA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEyMDA5OSBTYWx0ZWRfXzgFOx1U5E4or
 XOtrsAgvzn5UDrv0pxewqXuDpwjOJeEf1SdU+pQVFQLSnxE6Qk23KqvPS8FLAq3ciAU8brBYeQa
 OVlVvOswkK/fEYieauDtxSNC/mwz2f/xY69bilEVnyA2g2Ut2A7iyaDQkBK6Wu/w35LoKpUSlgC
 vOcPPGkyqEMWJaahz6iIT2KT+7CipfVR5hymbd/MFyv3zDOnpTeH0JVI5tkBWba/d2Cvk5wIj42
 +71BZDalXexywlUmR5EW/YHmmc6W0EE7pY43P0MmQT0uOHqv4FQ179LXqn87tYmPRW3AHcye4W6
 oIeQz4B0QaVvAOWxJQLeHnx+ktDq4Acapxq1Kin3uH2T807q9O21SGHPCkpUaM=
X-Proofpoint-GUID: LyP_WZ8ZiEyIQw4G6b2nwIuIWeCO4rQc
X-Proofpoint-Spam-Reason: safe

From: Maciej Strozek <mstrozek@opensource.cirrus.com>

Add parsing of ACPI DisCo information specific to FDL (File DownLoad).
DisCo contains a list of File Sets which can be requested by the device
and within each of those a list of individual files to be downloaded to
the device. Optionally the contents of the files may also be present in
a special ACPI table, called SWFT (SoundWire File Table).

Signed-off-by: Maciej Strozek <mstrozek@opensource.cirrus.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

Changes since v1:
 - Moved find_sdca_filesets to be in a slightly more consistent place
   in the file.

 include/sound/sdca.h            |  5 ++
 include/sound/sdca_function.h   | 40 ++++++++++++++
 sound/soc/sdca/sdca_device.c    | 20 +++++++
 sound/soc/sdca/sdca_functions.c | 93 +++++++++++++++++++++++++++++++++
 4 files changed, 158 insertions(+)

diff --git a/include/sound/sdca.h b/include/sound/sdca.h
index 9c6a351c9d47..d38cdbfeb35f 100644
--- a/include/sound/sdca.h
+++ b/include/sound/sdca.h
@@ -12,6 +12,7 @@
 #include <linux/types.h>
 #include <linux/kconfig.h>
 
+struct acpi_table_swft;
 struct sdw_slave;
 
 #define SDCA_MAX_FUNCTION_COUNT 8
@@ -37,11 +38,13 @@ struct sdca_function_desc {
  * @num_functions: Total number of supported SDCA functions. Invalid/unsupported
  * functions will be skipped.
  * @function: Array of function descriptors.
+ * @swft: Pointer to the SWFT table, if available.
  */
 struct sdca_device_data {
 	u32 interface_revision;
 	int num_functions;
 	struct sdca_function_desc function[SDCA_MAX_FUNCTION_COUNT];
+	struct acpi_table_swft *swft;
 };
 
 enum sdca_quirk {
@@ -52,12 +55,14 @@ enum sdca_quirk {
 #if IS_ENABLED(CONFIG_ACPI) && IS_ENABLED(CONFIG_SND_SOC_SDCA)
 
 void sdca_lookup_functions(struct sdw_slave *slave);
+void sdca_lookup_swft(struct sdw_slave *slave);
 void sdca_lookup_interface_revision(struct sdw_slave *slave);
 bool sdca_device_quirk_match(struct sdw_slave *slave, enum sdca_quirk quirk);
 
 #else
 
 static inline void sdca_lookup_functions(struct sdw_slave *slave) {}
+static inline void sdca_lookup_swft(struct sdw_slave *slave) {}
 static inline void sdca_lookup_interface_revision(struct sdw_slave *slave) {}
 static inline bool sdca_device_quirk_match(struct sdw_slave *slave, enum sdca_quirk quirk)
 {
diff --git a/include/sound/sdca_function.h b/include/sound/sdca_function.h
index 6dd44a7a8a35..f557206cec83 100644
--- a/include/sound/sdca_function.h
+++ b/include/sound/sdca_function.h
@@ -13,6 +13,7 @@
 #include <linux/types.h>
 #include <linux/hid.h>
 
+struct acpi_table_swft;
 struct device;
 struct sdca_entity;
 struct sdca_function_desc;
@@ -1338,6 +1339,42 @@ enum sdca_cluster_range {
 	SDCA_CLUSTER_NCOLS				= 2,
 };
 
+/**
+ * struct sdca_fdl_file - information about a file from a fileset used in FDL
+ * @vendor_id: Vendor ID of the file.
+ * @file_id: File ID of the file.
+ * @fdl_offset: Offset information for FDL.
+ */
+struct sdca_fdl_file {
+	u16 vendor_id;
+	u32 file_id;
+	u32 fdl_offset;
+};
+
+/**
+ * struct sdca_fdl_set - information about a set of files used in FDL
+ * @files: Array of files in this FDL set.
+ * @num_files: Number of files in this FDL set.
+ * @id: ID of the FDL set.
+ */
+struct sdca_fdl_set {
+	struct sdca_fdl_file *files;
+	int num_files;
+	u32 id;
+};
+
+/**
+ * struct sdca_fdl_data - information about a function's FDL data
+ * @swft: Pointer to the SoundWire File Table.
+ * @sets: Array of FDL sets used by this function.
+ * @num_sets: Number of FDL sets used by this function.
+ */
+struct sdca_fdl_data {
+	struct acpi_table_swft *swft;
+	struct sdca_fdl_set *sets;
+	int num_sets;
+};
+
 /**
  * struct sdca_function_data - top-level information for one SDCA function
  * @desc: Pointer to short descriptor from initial parsing.
@@ -1351,6 +1388,7 @@ enum sdca_cluster_range {
  * error should be reported.
  * @reset_max_delay: Maximum Function reset delay in microseconds, before an
  * error should be reported.
+ * @fdl_data: FDL data for this Function, if available.
  */
 struct sdca_function_data {
 	struct sdca_function_desc *desc;
@@ -1364,6 +1402,8 @@ struct sdca_function_data {
 
 	unsigned int busy_max_delay;
 	unsigned int reset_max_delay;
+
+	struct sdca_fdl_data fdl_data;
 };
 
 static inline u32 sdca_range(struct sdca_control_range *range,
diff --git a/sound/soc/sdca/sdca_device.c b/sound/soc/sdca/sdca_device.c
index 4798ce2c8f0b..405e80b979de 100644
--- a/sound/soc/sdca/sdca_device.c
+++ b/sound/soc/sdca/sdca_device.c
@@ -7,6 +7,7 @@
  */
 
 #include <linux/acpi.h>
+#include <linux/device.h>
 #include <linux/dmi.h>
 #include <linux/module.h>
 #include <linux/property.h>
@@ -27,6 +28,25 @@ void sdca_lookup_interface_revision(struct sdw_slave *slave)
 }
 EXPORT_SYMBOL_NS(sdca_lookup_interface_revision, "SND_SOC_SDCA");
 
+static void devm_acpi_table_put(void *ptr)
+{
+	acpi_put_table((struct acpi_table_header *)ptr);
+}
+
+void sdca_lookup_swft(struct sdw_slave *slave)
+{
+	acpi_status status;
+
+	status = acpi_get_table(ACPI_SIG_SWFT, 0,
+				(struct acpi_table_header **)&slave->sdca_data.swft);
+	if (ACPI_FAILURE(status))
+		dev_info(&slave->dev, "SWFT not available\n");
+	else
+		devm_add_action_or_reset(&slave->dev, devm_acpi_table_put,
+					 &slave->sdca_data.swft);
+}
+EXPORT_SYMBOL_NS(sdca_lookup_swft, "SND_SOC_SDCA");
+
 static bool sdca_device_quirk_rt712_vb(struct sdw_slave *slave)
 {
 	struct sdw_slave_id *id = &slave->id;
diff --git a/sound/soc/sdca/sdca_functions.c b/sound/soc/sdca/sdca_functions.c
index 18dc50b23b73..3adf156a4ad3 100644
--- a/sound/soc/sdca/sdca_functions.c
+++ b/sound/soc/sdca/sdca_functions.c
@@ -2010,6 +2010,95 @@ static int find_sdca_clusters(struct device *dev,
 	return 0;
 }
 
+static int find_sdca_filesets(struct device *dev, struct sdw_slave *sdw,
+			      struct fwnode_handle *function_node,
+			      struct sdca_function_data *function)
+{
+	static const int mult_fileset = 3;
+	char fileset_name[SDCA_PROPERTY_LENGTH];
+	u32 *filesets_list __free(kfree) = NULL;
+	struct sdca_fdl_set *sets;
+	int num_sets;
+	int i, j;
+
+	num_sets = fwnode_property_count_u32(function_node,
+					     "mipi-sdca-file-set-id-list");
+	if (num_sets == 0 || num_sets == -EINVAL) {
+		return 0;
+	} else if (num_sets < 0) {
+		dev_err(dev, "%pfwP: failed to read file set list: %d\n",
+			function_node, num_sets);
+		return num_sets;
+	}
+
+	filesets_list = kcalloc(num_sets, sizeof(u32), GFP_KERNEL);
+	if (!filesets_list)
+		return -ENOMEM;
+
+	fwnode_property_read_u32_array(function_node, "mipi-sdca-file-set-id-list",
+				       filesets_list, num_sets);
+
+	sets = devm_kcalloc(dev, num_sets, sizeof(struct sdca_fdl_set), GFP_KERNEL);
+	if (!sets)
+		return -ENOMEM;
+
+	for (i = 0; i < num_sets; i++) {
+		u32 *fileset_entries __free(kfree) = NULL;
+		struct sdca_fdl_set *set = &sets[i];
+		struct sdca_fdl_file *files;
+		int num_files, num_entries;
+
+		snprintf(fileset_name, sizeof(fileset_name),
+			 "mipi-sdca-file-set-id-0x%X", filesets_list[i]);
+
+		num_entries = fwnode_property_count_u32(function_node, fileset_name);
+		if (num_entries <= 0) {
+			dev_err(dev, "%pfwP: file set %d missing entries: %d\n",
+				function_node, filesets_list[i], num_entries);
+			return -EINVAL;
+		} else if (num_entries % mult_fileset != 0) {
+			dev_err(dev, "%pfwP: file set %d files not multiple of %d\n",
+				function_node, filesets_list[i], mult_fileset);
+			return -EINVAL;
+		}
+
+		dev_info(dev, "fileset: %#x\n", filesets_list[i]);
+
+		files = devm_kcalloc(dev, num_entries / mult_fileset,
+				     sizeof(struct sdca_fdl_file), GFP_KERNEL);
+		if (!files)
+			return -ENOMEM;
+
+		fileset_entries = kcalloc(num_entries, sizeof(u32), GFP_KERNEL);
+		if (!fileset_entries)
+			return -ENOMEM;
+
+		fwnode_property_read_u32_array(function_node, fileset_name,
+					       fileset_entries, num_entries);
+
+		for (j = 0, num_files = 0; j < num_entries; num_files++) {
+			struct sdca_fdl_file *file = &files[num_files];
+
+			file->vendor_id = fileset_entries[j++];
+			file->file_id = fileset_entries[j++];
+			file->fdl_offset = fileset_entries[j++];
+
+			dev_info(dev, "file: %#x, vendor: %#x, offset: %#x\n",
+				 file->file_id, file->vendor_id, file->fdl_offset);
+		}
+
+		set->id = filesets_list[i];
+		set->num_files = num_files;
+		set->files = files;
+	}
+
+	function->fdl_data.swft = sdw->sdca_data.swft;
+	function->fdl_data.num_sets = num_sets;
+	function->fdl_data.sets = sets;
+
+	return 0;
+}
+
 /**
  * sdca_parse_function - parse ACPI DisCo for a Function
  * @dev: Pointer to device against which function data will be allocated.
@@ -2058,6 +2147,10 @@ int sdca_parse_function(struct device *dev, struct sdw_slave *sdw,
 	if (ret < 0)
 		return ret;
 
+	ret = find_sdca_filesets(dev, sdw, function_desc->node, function);
+	if (ret)
+		return ret;
+
 	return 0;
 }
 EXPORT_SYMBOL_NS(sdca_parse_function, "SND_SOC_SDCA");
-- 
2.47.3

