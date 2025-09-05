Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A3E135E4F4
	for <linux-sound@vger.kernel.org>; Fri,  5 Sep 2025 14:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757082722; cv=fail; b=qHRtyBy/LHWoRR/4xMzVZa+hpRdwxdPc3Hk88rJI9mb8Wydqh2tF5Mvx+SCeoaaeTnmgoSfF3ORCIdH4L/cPscchyeycwMffprsbRk1vNWpwGBeUZ2JB0IZtJVZJLwAWtDzq3I+0wf40yv57oUbgHEu/m8OkPuTTLp+yk6b6SVA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757082722; c=relaxed/simple;
	bh=R8Ii/pcMHwzlAmFy9bqe9mAWvStqZXxlAHbl+zD81rE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nzHAGYQ38Ple0YnU+WGqlBeCOoZg3XPN81N4+iEw7ZOp2kFCLbh59w8YBfpQa6HasSGtzCguom5bOgFPkd/wZNxB9B3odC00rQXwFFLoUix5Ga2T3Ux6gPqt+MrKZIq/uCMW8YwpCrhIUuTUBrAegK201YnnCQx6BGIDW+Vjpcg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=P91/oAsF; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=xTKvR2+W; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="P91/oAsF";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="xTKvR2+W"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 584IFjc0293708;
	Fri, 5 Sep 2025 09:31:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=knq9vrgmP/+Y6TFEba0qyLWaub6wUmJIrla3oaSWUQ8=; b=
	P91/oAsFC7hj4bocFY+uxMsq82C8S1PDfGrDUDV/WbwY47DscTRIgKl9OTJciBFy
	8lSCZoaX/ZPT3urGAMSEndK0H0mD94iQO7SeUcbAlEhtWfhAq1E37dqrdKtVeET8
	lqv7sRUqrYsHq9t2DBQIIn7roWxK84K0wB1YuzcpzV2cdxFaTUlrIlPWq0zAW40a
	G78CrtMeW6619N+89IRZUPt9YoJ3f7n0vHshUXQbq2t19/nacfUjgAF1C9k8aYxx
	8IoJd2e4820DDUMdbbkGxKLym6gLNKxYtKIpwQIsW7l0Hq+BWX4Sym+jVh3RoWly
	ubCNV6fIlEPSbg35FxCwrA==
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11hn2224.outbound.protection.outlook.com [52.100.172.224])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 48vensfsvv-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 05 Sep 2025 09:31:41 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cx5z0U3ZN73wBUcKOYscMQ5NrJali/KyycIlqn6sjwTHzo24vdBm4PV5rwNwZ3+wkyy3Z11+eozu0wpLl5X+7GJ7sfTkoccRdSh1M0+nfCUGlgZXek2hwFvnchPFt0vY25/0AbyvYcwD5lw8gHS278IfDJqrUH1JDRGwhDjdjIwY880gALs1Lym7uaG+Lis6J5pUJmEU6pV661lnPKT9N/2v50OmjbKPL8wIQ/Djvi1tFm2eDP498x9R4wfGVFFhEubWT1EFc8rd2ogc/yPow6XykFB+mLPLF3J2Ci88BsKHEkPlCBA7sUQWVh1OSlElRRD/Zmy+DErKI4l4K6/P0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=knq9vrgmP/+Y6TFEba0qyLWaub6wUmJIrla3oaSWUQ8=;
 b=VbYt+1nJ/BnhNmln1Yn6FDnRvZG8HVRWvRa4AgJG9afSlI76bv+i1oR9Nw16qTkF9cCwMkzPm3BnR8KUF2d05zfX8X953H03msjc3Z2B3fKTQkbdLA3/r6hacu5xqTRwGqn50huHLPaBuCvOfFbYnVhDtoh5EthIGSkgfNkLVRs0NUblxjwtJM2bqHhujraq+rAkHc5tFNtogCQFl8YTpoD9HsQLNdRe1QEIUpcQcW8CpZcFqOZFCIx5ep7SRd7Z3k4aM1c1PBPzOjTeo9ujGgtC/XVHu12YKxf8sCv5MEBnC0wLQcyw5YOR218ASphp4Cbbo8WuOkwjcpmzdVWnCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=knq9vrgmP/+Y6TFEba0qyLWaub6wUmJIrla3oaSWUQ8=;
 b=xTKvR2+W/p5qSOfX6YpzHwTJvhKE3SDFlhu0kyGUjwcYNNgOGqUbpqT22nVUnvKkcEynViDKJXxDdAl+OE1LbF/6FJSJDa+PP8VTBBNELKmO5QLvddmk66VV/TtXY0v071hURkIlyYA10jPl0iYfQV+72dv54p0sDd0tOr0dF0M=
Received: from SN1PR12CA0095.namprd12.prod.outlook.com (2603:10b6:802:21::30)
 by BY5PR19MB4083.namprd19.prod.outlook.com (2603:10b6:a03:218::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.19; Fri, 5 Sep
 2025 14:31:34 +0000
Received: from SA2PEPF00003AE6.namprd02.prod.outlook.com
 (2603:10b6:802:21:cafe::77) by SN1PR12CA0095.outlook.office365.com
 (2603:10b6:802:21::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.18 via Frontend Transport; Fri,
 5 Sep 2025 14:31:34 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SA2PEPF00003AE6.mail.protection.outlook.com (10.167.248.6) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.14
 via Frontend Transport; Fri, 5 Sep 2025 14:31:32 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id D8DE440655E;
	Fri,  5 Sep 2025 14:31:27 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id C9C65820247;
	Fri,  5 Sep 2025 14:31:27 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: rafael@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        shumingf@realtek.com, lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 10/15] ASoC: SDCA: Add SDCA FDL data parsing
Date: Fri,  5 Sep 2025 15:31:18 +0100
Message-ID: <20250905143123.3038716-11-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250905143123.3038716-1-ckeepax@opensource.cirrus.com>
References: <20250905143123.3038716-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE6:EE_|BY5PR19MB4083:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 7f036427-a2ae-4ca0-7b4c-08ddec88e929
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|34020700016|36860700013|376014|61400799027|82310400026|12100799063;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hpIC149aNvJi88QIE+hPU7wK2bIFIsTsJ5/IDfesRXInbUi7i+mbKc0uA/y2?=
 =?us-ascii?Q?eDAbdJFPXg5LwE2vabFybjSMDs15nx7isK/oewl8n1AdOcegiRSnKeTduK9j?=
 =?us-ascii?Q?/iQfHot4p7Dr+fM0YkrwMD+OIym1oY7FfKxDD7SrcE62HeROb0yl6RSOxovr?=
 =?us-ascii?Q?h+kV/4+xAaK7tLGssZ2u8WnwPpClQQWXtEKyKDB7XBK3Mnj6sZcWte8nh+5Z?=
 =?us-ascii?Q?yDHCCU+KHAkMGF3AHlvvhro146GkcuaJOiiBQeobcvaSBR8j2bXOrcHz0AvQ?=
 =?us-ascii?Q?7O2dONN9FyNpj/8394Pkk3hGlZ4rv1VrRGsl76LZzQMR9mTJ53QsDRfWQa/X?=
 =?us-ascii?Q?sljThD0zXIQLgY7B0c3UWlJOUlaZxyJhQeACLGmASk1By7w+VMjSJH0q48pe?=
 =?us-ascii?Q?OgFA/cMPade/P5XEVTRo8pZJRU0vP750EkbhzafXZtgw04lkmRMk90S/QHGE?=
 =?us-ascii?Q?3+Hwx1oONFId3GT9UTa4RxVF3eK6cZbyUAaIodSQqQGATmnbFJgTQCgw3FoS?=
 =?us-ascii?Q?l6j36p54XxyAWOlO0FvVMMBcUEnUl7G2DNx2slqCuEwryd/TdAFLyvMFA1W5?=
 =?us-ascii?Q?tIB7AKZvFXp2k5tYiscxxOStwyVBQapzaZDKf/xjXEVMCv8y5eGSPlH4lZkb?=
 =?us-ascii?Q?cOmiXLlPNubKRnt72SjIKjbeo0eQn/q9mPHLvGMRHp/5gsi4TSnKgwpIeSoZ?=
 =?us-ascii?Q?bPLH2oS9WQV4saSIyBRcg3yPYX4x5t4cX0ZuReL0x/4xU5RDm8qrRi54ULnU?=
 =?us-ascii?Q?ZjUBdtjMBXoISWBu9xI9saJQrLZkyPgj9JLH0NDPphMQz9T3F7eQuxlQQDyG?=
 =?us-ascii?Q?81TolQUU7qTlZaKR21FDV1UzjvEAUcni4twMcd92HdUVY1ALrvA9orboAf7T?=
 =?us-ascii?Q?kVauyk5Ok9hjTeGF4Il3zE2oYEt3IDvy4u4uIUi0pxTFo2/T38PuUpaakm+1?=
 =?us-ascii?Q?wRpZtloZSWtsVx5HW+KHpVKo22hDOK63+tqC4ctvyotEJZSDRNk/IBHb4WEo?=
 =?us-ascii?Q?1bHKH1+7Usqa9lEhSTKgq58SEc5YLoaIMuHiti5vq0t0W9fseuWZoYzpoMiZ?=
 =?us-ascii?Q?NJ1IyArF2KdOpYQBZ6C0iRKEDLSskojaFQIMiQ5dn3zxIg1AZr+Qt6sWLufW?=
 =?us-ascii?Q?u/E3CcwuP2jSNzY0xVbcfBN8UmwiHOk2D/MWDl962vVYp58ZY1KDA5ZE3s71?=
 =?us-ascii?Q?399cbXMXVEHZ+4TiQGNG3ZxgOWP206e81YIMfCPSaH3ltRyT0C6VPzNqeNMR?=
 =?us-ascii?Q?xXAo/9P+65cwfVu598vmgF1RJvp9CK0cdjnTmmSkC/K7if6XqxV3iuwQMPXB?=
 =?us-ascii?Q?XvAu9OYYi2cB+P1pbw0+037CbSRRmB9seY8H0k5+9Sz70CNaznI4arnzPf5c?=
 =?us-ascii?Q?s30hFVjld907qzq8atZ9cZiVQHfrH5NEZhjkYVFRfeID2GzUkhBCpFVlWcuq?=
 =?us-ascii?Q?Xx03430aF2f/gxXmy1hRvc7jm3ACtsQ+r8+fZdvfaLawiZnJ4L8tP8MwFgWr?=
 =?us-ascii?Q?8OTwm2Xo7FTF62VzrnamKPP2fMf+sBNM5WvM?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(34020700016)(36860700013)(376014)(61400799027)(82310400026)(12100799063);DIR:OUT;SFP:1501;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2025 14:31:32.4909
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f036427-a2ae-4ca0-7b4c-08ddec88e929
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SA2PEPF00003AE6.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR19MB4083
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA1MDE0MiBTYWx0ZWRfXzcj5uoi3yYVn
 PCQpp0fBd8b68ZSW2iV20shqg34/OdQzyECWecm2RLfPFPvyaRxPLriNOsugIxHZyjevYdw83xB
 hzp2BbdBcjjzeUmepQDvOn2A9qbMzN4TVtRZHI7FLL6tEnUNca6c69YfOZcXmSk5pIXzm3v3T9k
 T/ve8xa3op1+mURnK3QPtl9KQVroTn9GpZqx+gQ1hcCXZ10cvyh9QwPL0tK7mqK6oyVIH0jYJoe
 VjbycNhPL2QFeAsiuBKy+be886TZb2t1apu0wCtAWWUwRFtW3EtJaDc6JMt7CXvdoTSHZjHxzzS
 WRcIrwEjEzEW8YduzPbcof47Nkuz/WmAvK1A/JETXHsmiF8Sp0C16fEweaMKUU=
X-Authority-Analysis: v=2.4 cv=BY/Y0qt2 c=1 sm=1 tr=0 ts=68baf44d cx=c_pps
 a=JSpjuUdINHSaH2H1+uW9rA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=yJojWOMRYYMA:10 a=RWc_ulEos4gA:10 a=w1d2syhTAAAA:8 a=gdKTTE99PY5FDwdXciEA:9
 a=jZz-an6Pvt0H8_Yc_ROU:22
X-Proofpoint-GUID: FKIQieTke0h89eVCqfTNQoY-E9Hl3OKd
X-Proofpoint-ORIG-GUID: FKIQieTke0h89eVCqfTNQoY-E9Hl3OKd
X-Proofpoint-Spam-Reason: safe

From: Maciej Strozek <mstrozek@opensource.cirrus.com>

Add parsing of ACPI DisCo information specific to FDL (File DownLoad).
DisCo contains a list of File Sets which can be requested by the device
and within each of those a list of individual files to be downloaded to
the device. Optionally the contents of the files may also be present in
a special ACPI table, called SWFT (SoundWire File Table).

Signed-off-by: Maciej Strozek <mstrozek@opensource.cirrus.com>
---
 include/sound/sdca.h            |  5 ++
 include/sound/sdca_function.h   | 40 ++++++++++++++
 sound/soc/sdca/sdca_device.c    | 20 +++++++
 sound/soc/sdca/sdca_functions.c | 93 +++++++++++++++++++++++++++++++++
 4 files changed, 158 insertions(+)

diff --git a/include/sound/sdca.h b/include/sound/sdca.h
index 9c6a351c9d474..d38cdbfeb35f5 100644
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
index 341912d896679..7ee2f6666958b 100644
--- a/include/sound/sdca_function.h
+++ b/include/sound/sdca_function.h
@@ -13,6 +13,7 @@
 #include <linux/types.h>
 #include <linux/hid.h>
 
+struct acpi_table_swft;
 struct device;
 struct sdca_entity;
 struct sdca_function_desc;
@@ -1315,6 +1316,42 @@ enum sdca_cluster_range {
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
@@ -1326,6 +1363,7 @@ enum sdca_cluster_range {
  * @num_clusters: Number of Channel Clusters reported in this Function.
  * @busy_max_delay: Maximum Function busy delay in microseconds, before an
  * error should be reported.
+ * @fdl_data: FDL data for this Function, if available.
  */
 struct sdca_function_data {
 	struct sdca_function_desc *desc;
@@ -1338,6 +1376,8 @@ struct sdca_function_data {
 	int num_clusters;
 
 	unsigned int busy_max_delay;
+
+	struct sdca_fdl_data fdl_data;
 };
 
 static inline u32 sdca_range(struct sdca_control_range *range,
diff --git a/sound/soc/sdca/sdca_device.c b/sound/soc/sdca/sdca_device.c
index 4798ce2c8f0b4..405e80b979de8 100644
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
index e12a2a90e34e1..e1e1ab23e0841 100644
--- a/sound/soc/sdca/sdca_functions.c
+++ b/sound/soc/sdca/sdca_functions.c
@@ -1398,6 +1398,95 @@ find_sdca_entity_hide(struct device *dev, struct sdw_slave *sdw,
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
 static int find_sdca_entity(struct device *dev, struct sdw_slave *sdw,
 			    struct fwnode_handle *function_node,
 			    struct fwnode_handle *entity_node,
@@ -2027,6 +2116,10 @@ int sdca_parse_function(struct device *dev, struct sdw_slave *sdw,
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
2.47.2

