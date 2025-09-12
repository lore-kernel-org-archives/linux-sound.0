Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7ADC2EB5B0
	for <linux-sound@vger.kernel.org>; Fri, 12 Sep 2025 10:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757673335; cv=fail; b=qsKRNk7CSvaUYpwOj1NFiSWNcPod2WnfOOBbSlcVmZAEh2TZxF5/APhxeoN0kRtdxe6eMabzHtW/InFPK7GOJXro3tn5nXFYa/Oyddy2//GDoEsvazMGD2ZzYUCY6o9H0Y8sLT2IHmjpb3LiUDXSCNv1JQczi1NSpPwUUAcGYzQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757673335; c=relaxed/simple;
	bh=wEVaE5r6kh6w4wh8Q/PB2xpMfwqj1B4piG7Zoet9CUI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PEdp97p5CaYb9k9QRSOneb7YbfEuSRPkMgGCHS+FecbB/dfD2IHlzvAqFWZd3qzsnpq/xelPaz+p6c+pezOtFIa9f9Kg+HnztENbOobZUyYyj4pfih2O7ol1OZWX/543Vb7gkAM3gN+G8bJRSIRvj8NzLOwRiVW1JGxZpFDM2VQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=UKTDe6BU; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=knen/5jo; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="UKTDe6BU";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="knen/5jo"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58C7NqXg1382687;
	Fri, 12 Sep 2025 05:35:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=T1Zq82a+dBuQzM9XhCGQV3yQiOibjM1t862BigHKYCo=; b=
	UKTDe6BUG6T5+jLXCXil3aiB6xJ7w5cy/u7Wci3soi0x/zLUFV6FwHBXlC8eC82X
	S6BUduHI9Mh82B1BlHEQ2ks16Fe3QQJB75PytZf/qNxepJ3nju5Ordd8d6ZwuZMx
	SnJ/SbNRPwx7fmpSCb4YtXERLHK0GFT8xHtnKbk3Grf2XlYlcPSHiL4SZ+N1xbgB
	2plLp7J0ylqUXWynaem/xIZAt2dDx9JEsksFj4nz39cafDUDGtTi0zTVp67W5P/D
	LuW2h7Hjf0J87RKH24r2vsRXhcPcSLZY7blWEWsy+wnU6ewJywwCcMUPxa5dGypX
	+WyiXzdI/3yVRcYvS2tINw==
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11on2134.outbound.protection.outlook.com [40.107.236.134])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 492q6tcphf-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 12 Sep 2025 05:35:20 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pCvTFf6Jr3Fw004rfN9VZH/dtjjykzO6O10ssrEo0fIifhjD7o+rExFCH9MDHzTdYNoXllTSnuDYDGmR/NGBBqlHhc7CMv6NxWiW3VJR50IuWA61CNZ9LzyhV3WWQ+lxvkoqvVXQ3eKTwzENCiJeEZW8B5/UY/51k0Brt2gd3WvPEiyg+fX2v71Qe5flMP0ryQNxpuPDBQYwK2rY35vI7f9rXyriJY3zt+kk2VB8Hrd2fqH63HuJ1uih0bBJ+lgivxCKH3Biz17bNmLLAd6z9Vba/6T51G+dO5VsiOukrqzaO82IE6T2IGInHaV+Q3ZfcQ97t2K9Q8ZF/3OGt/LlCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T1Zq82a+dBuQzM9XhCGQV3yQiOibjM1t862BigHKYCo=;
 b=nGU6iiaF1aptQ1fXzGNxhuVcaRso9IyLdCVghWbWZQ/Beg1743kOPHLFn/513A0mWEcg69doDBgizGxQJsnCWC5li9x+R35lZ3l5diJIr/QZd4H2JQuxVZbnftmwjySvIuxS1wDn7JlHj2LA7k9OpcbkHKeyf+9jG4/K1Zdnns8lr/rAg+NozwPcFy8qEsJH/wVWtavR0I0KmylSQGqlJFzdQdLFgkUZihjXIngTVC7BrQMGvwKg//mzNk3MsRBOKmDhCJ4QgpZjc7Bw6VeedPf3LBp9EhNwC3bZMSkC6K3Mz7JHoz1qTxLjVqgBcPoBR24r6lxSP8jto5q4p989kQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T1Zq82a+dBuQzM9XhCGQV3yQiOibjM1t862BigHKYCo=;
 b=knen/5jonMF+M9D3OWQthMWAcaztPJ7IvPzz2HoLWWOFkYTIhv3ive8hAQvCLr8bpdP9meaU735E5RjNRPvaLC5bzQbNC18HL/fmUOS3QLlxzsamJszZh1951kXONPBb0PfIiw+w80NMhH5rYgpSTKraXB63KJzmqK49ncgPLcY=
Received: from MW4PR04CA0383.namprd04.prod.outlook.com (2603:10b6:303:81::28)
 by CO6PR19MB4755.namprd19.prod.outlook.com (2603:10b6:5:341::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Fri, 12 Sep
 2025 10:35:16 +0000
Received: from SJ5PEPF00000208.namprd05.prod.outlook.com
 (2603:10b6:303:81:cafe::94) by MW4PR04CA0383.outlook.office365.com
 (2603:10b6:303:81::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.17 via Frontend Transport; Fri,
 12 Sep 2025 10:35:16 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ5PEPF00000208.mail.protection.outlook.com (10.167.244.41) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.13
 via Frontend Transport; Fri, 12 Sep 2025 10:35:14 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 5DE8A40656A;
	Fri, 12 Sep 2025 10:35:08 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 4A11082024A;
	Fri, 12 Sep 2025 10:35:08 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: rafael@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        shumingf@realtek.com, lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v2 17/19] ASoC: SDCA: Add UMP timeout handling for FDL
Date: Fri, 12 Sep 2025 11:35:02 +0100
Message-ID: <20250912103504.2679226-18-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000208:EE_|CO6PR19MB4755:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 4d1bde3d-a5c3-47c8-ef31-08ddf1e80f7a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9DPApqBN5nLhoi3KfZd1ELJpKejPjZXiKNfzi/PakIjvehnffYMtWwTG+Fxm?=
 =?us-ascii?Q?DnGnbYk+gc40Eyfh+VoI0WrPPEU8I8W/KQBl03NUnUwGoIX2qT2gB3rmTp6m?=
 =?us-ascii?Q?ivPUT35fP3gDV/k/FoEcozX+st92ZpnN8f2Cw74bFnT3ivWcTo7eH6H4Z9/W?=
 =?us-ascii?Q?i5BzI8gCSR+YVaxg9SOzjqU7HMusv83Z5BuJDU8O+XNtvpc1obSpOJP0Z5gk?=
 =?us-ascii?Q?2oZYeCQQyoCVABe12gHEt/5Qt8FSDyksw8WjW3RK9tfKTWtLF0DHDWQl/pb6?=
 =?us-ascii?Q?m6xH5yKEAnWMkoLuBnM4eLKpiAHkzwVrQNQvQfe3KNRmtUhEcHcmmy79LB3c?=
 =?us-ascii?Q?0T/W2k7RE81mvMPhPyyNWL2epKMhXlcpU0oDaHOH3I0HwmnP/81v9X8GXHs1?=
 =?us-ascii?Q?wUDViKlZJyZDRvM89F7jT2Sbbek3ilPqZMKw8e5i9NB9YkZIu0hke0jk00xl?=
 =?us-ascii?Q?uIeZ7Q87zGv3Rklmcmibhnvtv2+ME6XYJ9n6rVmInwVleNxh7smACAHZALTx?=
 =?us-ascii?Q?yPDNQBpDsM1nSzLIrBt+jB6xZm+ur5Z2dpmU+CVwnSwg+KaRbiM5jCe2kph2?=
 =?us-ascii?Q?v90bNXHM0LVcXrQPsjmZqp5JLdOk41zs2HyMvfimK+u+oust4uPjWjq3E0VC?=
 =?us-ascii?Q?u5fO+GnjnV8MYeLTnhUbUowY10VRMUvIuoryCS+godxaXvmzWY8U/Ea3yGpl?=
 =?us-ascii?Q?OAzSDPq5NIe4GVTvqM5AzrdCA5NFbRRzhuGmWrfZWbGELxWFIyg3Rf++hFv9?=
 =?us-ascii?Q?ZB8lT5vgnHAnRx9C4NOsQ2f5ucaqXp8FeEqoGB0yJp3QGsZ1oCWA46WazacW?=
 =?us-ascii?Q?WV05SP7IdBwaczcbPD44FXdpJ6ZjCqNOCsn5aMuZ4lPfX56eDadZiBAFwP+y?=
 =?us-ascii?Q?VI+wUmUNf1k8R/1xYAn/qRl75Upfeoql0Gjx/E87AbEq5QRwncQm4/dhTq1r?=
 =?us-ascii?Q?UYCsrlxATi64cdwupWqsU4FpuL+VYlLcjIkaE2EDD/v1kt+KKBuSmRQW/lAS?=
 =?us-ascii?Q?CWoJhZsP0qkJeY5JNq4W+ILSn+iitdAXv9Yy0hOesJ9RT0C86Z4ebiXOblx6?=
 =?us-ascii?Q?/WCbf0ptmkRrowVQdXNGg/HVwQG4GbhWqRkdcwVtKhJC2WHeGV+n0xREF5OH?=
 =?us-ascii?Q?JxKxFytWhah3L5Ff3Y9gMNbatpftbx/jfSCcBWRHAywLwg5ZhwzVHOmwyDY6?=
 =?us-ascii?Q?NsuGn03rppk70scu2PkWVE1wseQ0HcNk1MaxNrFrh0NQtgiOpqf0OJsAxe1E?=
 =?us-ascii?Q?+wx1Y4peYace0N/jVUqcDz45oQer8x5r5NSJwE0SzHglYSD87oplw2r4PrMb?=
 =?us-ascii?Q?enuvfylO0tvE24mL3Lb0lxD9VbsfMtrknZaz9pUkkOXTwId8aJvKTuopjZdP?=
 =?us-ascii?Q?F47s6qj7r9YUEEjIpghFaLFwXH/BFlphARgxUrEOWyik5CucbZMPcUvRg+Fm?=
 =?us-ascii?Q?bBomgtmy78hT3p96vaaU7miBkPMyp2zZDYtGX/8u2/jmijMCVcWdGHEfRhDE?=
 =?us-ascii?Q?KWW5RN/v7NW8NBK9Ll43QhPyiLksTFuNsimW?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2025 10:35:14.7485
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d1bde3d-a5c3-47c8-ef31-08ddf1e80f7a
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ5PEPF00000208.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR19MB4755
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEyMDA5OSBTYWx0ZWRfX3/Ev5NBUmzRM
 NG5202Th8D61TSXz9C5T4J3pMeS5jRXteVc34XXisWYLXlTBbV1mUpYAnjmZ8cpv3ZcnJd3uiDf
 P22Nwqzat+w+xwf2dJDY8jt7sb9Nm5He+fMwVLF8kFPP9FtCLBG8an9xbPi1L3TleXwpiHfCSSk
 n1/1764y9DwLn31tSDkVUyuN4e7SOnfcmRkElgoeraYhbW80gkxLq3oDfflWZGTTYyHsyHIe420
 fiAa20TpwrQEg1G77Y9H6H75F53yuzyQVAwtWTWYCi0mxrmE5cI48/FHGgb1yKP89FToHSsK7uI
 J2uVF2F01V/zgAjuCItWbQnRWAgOhNOh2Sq/w47EmqfandsIznq5gDNlhV2404=
X-Proofpoint-GUID: Gy0O_Rc9p4qxKUXpH_tocU4m6G4PN4Op
X-Authority-Analysis: v=2.4 cv=X71SKHTe c=1 sm=1 tr=0 ts=68c3f768 cx=c_pps
 a=9as0x59oiNjQ6UJFME4EAg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=yJojWOMRYYMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=w1d2syhTAAAA:8
 a=ueLElEdq9i2Dc4XbyEcA:9
X-Proofpoint-ORIG-GUID: Gy0O_Rc9p4qxKUXpH_tocU4m6G4PN4Op
X-Proofpoint-Spam-Reason: safe

Several of the UMP transactions in the FDL process should timeout if the
device does not respond within a certain time, add handling into the UMP
helpers and the FDL code to handle this.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

New since v1.

 include/sound/sdca_fdl.h  |  5 +++++
 include/sound/sdca_ump.h  |  5 +++++
 sound/soc/sdca/sdca_fdl.c | 24 ++++++++++++++++++++++++
 sound/soc/sdca/sdca_ump.c | 15 +++++++++++++++
 4 files changed, 49 insertions(+)

diff --git a/include/sound/sdca_fdl.h b/include/sound/sdca_fdl.h
index 4ea000d6acef..1618f7defbdb 100644
--- a/include/sound/sdca_fdl.h
+++ b/include/sound/sdca_fdl.h
@@ -11,6 +11,7 @@
 #define __SDCA_FDL_H__
 
 #include <linux/completion.h>
+#include <linux/workqueue.h>
 
 struct device;
 struct regmap;
@@ -23,13 +24,17 @@ struct sdca_interrupt_info;
  * struct fdl_state - FDL state structure to keep data between interrupts
  * @begin: Completion indicating the start of an FDL download cycle.
  * @done: Completion indicating the end of an FDL download cycle.
+ * @timeout: Delayed work used for timing out UMP transactions.
+ * @interrupt: Pointer to the interrupt struct to which this FDL is attached.
  * @set: Pointer to the FDL set currently being downloaded.
  * @file_index: Index of the current file being processed.
  */
 struct fdl_state {
 	struct completion begin;
 	struct completion done;
+	struct delayed_work timeout;
 
+	struct sdca_interrupt *interrupt;
 	struct sdca_fdl_set *set;
 	int file_index;
 };
diff --git a/include/sound/sdca_ump.h b/include/sound/sdca_ump.h
index b2363199d19a..f54f9d48c64c 100644
--- a/include/sound/sdca_ump.h
+++ b/include/sound/sdca_ump.h
@@ -15,6 +15,7 @@ struct sdca_control;
 struct sdca_entity;
 struct sdca_function_data;
 struct snd_soc_component;
+struct delayed_work;
 
 int sdca_ump_get_owner_host(struct device *dev,
 			    struct regmap *function_regmap,
@@ -42,4 +43,8 @@ int sdca_ump_write_message(struct device *dev,
 			   unsigned int length_sel,
 			   void *msg, int msg_len);
 
+void sdca_ump_cancel_timeout(struct delayed_work *work);
+void sdca_ump_schedule_timeout(struct delayed_work *work,
+			       unsigned int timeout_us);
+
 #endif // __SDCA_UMP_H__
diff --git a/sound/soc/sdca/sdca_fdl.c b/sound/soc/sdca/sdca_fdl.c
index f63ac4631e28..4d3d94f8d19b 100644
--- a/sound/soc/sdca/sdca_fdl.c
+++ b/sound/soc/sdca/sdca_fdl.c
@@ -297,6 +297,19 @@ static void fdl_end(struct sdca_interrupt *interrupt)
 	dev_dbg(interrupt->dev, "completed FDL process\n");
 }
 
+static void sdca_fdl_timeout_work(struct work_struct *work)
+{
+	struct fdl_state *fdl_state = container_of(work, struct fdl_state,
+						   timeout.work);
+	struct sdca_interrupt *interrupt = fdl_state->interrupt;
+	struct device *dev = interrupt->dev;
+
+	dev_err(dev, "FDL transaction timed out\n");
+
+	fdl_end(interrupt);
+	sdca_reset_function(dev, interrupt->function, interrupt->function_regmap);
+}
+
 static unsigned int fdl_status_process(struct sdca_interrupt *interrupt,
 				       unsigned int status)
 {
@@ -360,6 +373,7 @@ int sdca_fdl_process(struct sdca_interrupt *interrupt)
 {
 	struct device *dev = interrupt->dev;
 	struct sdca_entity_xu *xu = &interrupt->entity->xu;
+	struct fdl_state *fdl_state = interrupt->priv;
 	unsigned int reg, status, response;
 	int ret;
 
@@ -369,6 +383,8 @@ int sdca_fdl_process(struct sdca_interrupt *interrupt)
 	if (ret)
 		return ret;
 
+	sdca_ump_cancel_timeout(&fdl_state->timeout);
+
 	reg = SDW_SDCA_CTL(interrupt->function->desc->adr, interrupt->entity->id,
 			   SDCA_CTL_XU_FDL_STATUS, 0);
 	ret = regmap_read(interrupt->function_regmap, reg, &status);
@@ -414,7 +430,13 @@ int sdca_fdl_process(struct sdca_interrupt *interrupt)
 
 			return 0;
 		}
+	case SDCA_CTL_XU_FDLH_COMPLETE:
+		if (status & SDCA_CTL_XU_FDLD_REQ_ABORT ||
+		    status == SDCA_CTL_XU_FDLD_COMPLETE)
+			return 0;
+		fallthrough;
 	default:
+		sdca_ump_schedule_timeout(&fdl_state->timeout, xu->max_delay);
 		return 0;
 	}
 }
@@ -435,8 +457,10 @@ int sdca_fdl_alloc_state(struct sdca_interrupt *interrupt)
 	if (!fdl_state)
 		return -ENOMEM;
 
+	INIT_DELAYED_WORK(&fdl_state->timeout, sdca_fdl_timeout_work);
 	init_completion(&fdl_state->begin);
 	init_completion(&fdl_state->done);
+	fdl_state->interrupt = interrupt;
 
 	interrupt->priv = fdl_state;
 
diff --git a/sound/soc/sdca/sdca_ump.c b/sound/soc/sdca/sdca_ump.c
index 5dcad2f7ea05..8aba3ff16872 100644
--- a/sound/soc/sdca/sdca_ump.c
+++ b/sound/soc/sdca/sdca_ump.c
@@ -245,3 +245,18 @@ int sdca_ump_write_message(struct device *dev,
 	return 0;
 }
 EXPORT_SYMBOL_NS_GPL(sdca_ump_write_message, "SND_SOC_SDCA");
+
+void sdca_ump_cancel_timeout(struct delayed_work *work)
+{
+	cancel_delayed_work_sync(work);
+}
+EXPORT_SYMBOL_NS_GPL(sdca_ump_cancel_timeout, "SND_SOC_SDCA");
+
+void sdca_ump_schedule_timeout(struct delayed_work *work, unsigned int timeout_us)
+{
+	if (!timeout_us)
+		return;
+
+	queue_delayed_work(system_wq, work, usecs_to_jiffies(timeout_us));
+}
+EXPORT_SYMBOL_NS_GPL(sdca_ump_schedule_timeout, "SND_SOC_SDCA");
-- 
2.47.3

