Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F30352EB852
	for <linux-sound@vger.kernel.org>; Fri, 12 Sep 2025 10:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757673335; cv=fail; b=sVsJcejv3K3E3VdRRBAQDwdxc8p/tj8UZBrf5E2a2SueSKE3JKwF+Eb8hklMovSMVFiMG2bS7WztbBcLEcccxtYy0iY5tAYSGez14atzytGiZ6fmB5kkqH7YUPK9CmTNm0d5AGj7d6IEMj/JSeau3KB2RhrLQJrTp7iLkesjVFo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757673335; c=relaxed/simple;
	bh=qvjXEaiUUlATYlXkLioD0ruoqMhX/s+dG1wraZTCHds=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HVsrYQOLHx2SDUAOhxORH6AJCLuTfxAKGeR7vlTE0JqQgo7PpLo4DRrUfZ+8prPgKHH4RlCx1ypiLwMFKW5UBUEQBI9vVlXLEiqaz22RD+oeOBvUAjY0JkH7M3llUBM0FU6f/iFTwoqz7UhCi4wm9xxPzw8RfeMRYzw376YgkF8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=XdKI6tl6; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=LC1q50J2; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="XdKI6tl6";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="LC1q50J2"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58C5wngh3620853;
	Fri, 12 Sep 2025 05:35:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=YDLSkt5mcUGQIXwaUsL4lTX0nhXHG/+1gK2QT+SXXkI=; b=
	XdKI6tl6h3p9A6p3oWiWndiiT5T+RwPejSsG0WQE5xQUOHHPdF0VQt+GS4hzrmia
	XT9v/RiSGE6goKtVslp0i8l3a98cFlEb7lslQvEfWqfeqxnSmY7z5UbEZGbCEK3B
	QfXaH419t3MY8gMZm0TsfoDnDgWO6jzW4gqiWi46QINcFxE5TnpnwBX5WLVdMdbc
	FAv1BOGAxp87MiEIKk2AB3YDOivVV8RGoyQF7MZzwJCe5vbp9aFOq48JRxyjnbOD
	jfa9866sDEHDKSSKRTMySn0UkcXbzKqqMLr4BjTkxo4CRz0+cp2cuJBC5Ntm2fNK
	mWB0CZ5MTVUTcHZKs/k+8Q==
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12on2118.outbound.protection.outlook.com [40.107.244.118])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 494due08y9-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 12 Sep 2025 05:35:16 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S/lnNZ/riA5ySEZso9kskQ0GhHMjQroc9RvyI2f4YIxZH1wzGj33iD3y7XUs+AnBBzrhvn24+IMbvC9q4HIvfd9AuTxukHY+iZ0xTUW1pOiW0xYP0ekAPvaUa9bLpE6U5rDqJ/nEtSlkw85xT479uGC4uEJLakqI1vT/pJyqKqk0sxOPH139xh/NFwFOKG3xX2q424k4O0DmrNg9r4DAn7gfuJ0JhQkgcawJTWNTaQ3Kb0OJw8NeedqCI+ybdcfHgrgaHeGwAHD82EppJ0Ng4XCSYVBAuQx45I4+i/RbMBinnZhB+F6iK1rtQw1Kp6VZa8u/KWDfNycCpvZYTi36tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YDLSkt5mcUGQIXwaUsL4lTX0nhXHG/+1gK2QT+SXXkI=;
 b=L1JCw0oIGpfIR5hF5Rurk3PDkHbfW8j+q9XNv4vIkxQBshSQgiIklDHmQaWEtKQYsphy0AKHhJ7iRtBthlGnd+qgVd8VBUtuT7ZwJREqiTDHOJua89dDNbZtwam+u0+BJL2wtoMmC1VBQ7Tl6yt4cR4lcNNEIoiO+6FQC0/3h505QvCoWDfOltUed6uUXcyyNCr9m2ZhQ2m53M1V8b6+KCG0nhe2ncEDJKzV4DiZzu8F0R+S9ly3kCKbiAOtzNxFHiSjHTraGkZcEKlJBGwJavDM24XSSfBUaW3gIcx4fQqbv4+6lNptFP+f86EtguB1LvyzHm7vIidtmJ4cBwom8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YDLSkt5mcUGQIXwaUsL4lTX0nhXHG/+1gK2QT+SXXkI=;
 b=LC1q50J24Lh0h3o73QKKDbf+90Oq2cwWeRsH0gdxccxEX+g5WyWtmuaM0PAzoS+oKkJiSpF4k5c1V4fqzuSUeqOcwVSxEmRVH3rjA+ddr2g3PcXmclrhAOp6ZqnB2Qb6yKFX+F9e8ddx79PsEN38rLycovJWe8tJZdaEzGNzX8M=
Received: from BY3PR05CA0004.namprd05.prod.outlook.com (2603:10b6:a03:254::9)
 by LV3PR19MB8557.namprd19.prod.outlook.com (2603:10b6:408:279::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Fri, 12 Sep
 2025 10:35:13 +0000
Received: from CY4PEPF0000E9D3.namprd03.prod.outlook.com
 (2603:10b6:a03:254:cafe::a2) by BY3PR05CA0004.outlook.office365.com
 (2603:10b6:a03:254::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.7 via Frontend Transport; Fri,
 12 Sep 2025 10:35:13 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CY4PEPF0000E9D3.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.13
 via Frontend Transport; Fri, 12 Sep 2025 10:35:12 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 3DFB7406562;
	Fri, 12 Sep 2025 10:35:08 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 1E86C82254E;
	Fri, 12 Sep 2025 10:35:08 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: rafael@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        shumingf@realtek.com, lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v2 11/19] ASoC: SDCA: Parse Function Reset max delay
Date: Fri, 12 Sep 2025 11:34:56 +0100
Message-ID: <20250912103504.2679226-12-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D3:EE_|LV3PR19MB8557:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 61bd3c32-3f07-4d34-960d-08ddf1e80e0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6XijcHEfp7RDTqEEocSmbjbNpKNf/mTt/iW1XPMHCheJbJj2Gp1+rN0URpxZ?=
 =?us-ascii?Q?J6AFM593a5cZs5r7yMDmOhmKmTh06qotE9XUx86cw6v3Jss/BS8ENpsQqA4O?=
 =?us-ascii?Q?iQCBiIDDodCbOTlHaeYA2UoSYYum82zu9emeSLHFShcG24ma4zguTFd8UbWL?=
 =?us-ascii?Q?48q4g8yjSLfXm6JLh0A/KO/pmYiACKTctcF0D/6KL1ODtI6B+Lt+lFkQQmBU?=
 =?us-ascii?Q?KdKH46Trkw/OcON4RizOhVMVok5tb4sRjguWuwJmJPk0/Vw///ISiOgq90ev?=
 =?us-ascii?Q?PX9joPSJDz1CJdhtuxJW5g6br5gjg/HxXhnUTXADw6Pflo/W7e6XIlj86KUW?=
 =?us-ascii?Q?bAiluJugiK9N+Nws1b8r23bwQJPbi+NedjV9MgPjogXMpeaou3/URpvTeNmF?=
 =?us-ascii?Q?Jt2DXacZtyoB41o+tO8sIMg3/FZJyJYw423ctYDNocerk4K6Uyo3ejIRvyEk?=
 =?us-ascii?Q?f4HRjLQKxaZ18afv5M98b6DmkaYlH0EA99NTaICmdidOEGF7OqpNW8qcK2pY?=
 =?us-ascii?Q?gaI7YpFeuVpPcV3kNZzUiPRPIx2hQYc29QNOsrhW4hpxUq4WLcBxq4HmKXi0?=
 =?us-ascii?Q?9OfRXCzn6fwW05Ft+FVETwt0xR13bOmNv5VkVHuvYj5Qh9vZ4HkTa0120neU?=
 =?us-ascii?Q?ZZA9AQjAu6lxatahy8JueOLnJgEsduWqJ1NU+PiTTOVMtqAXPvnq+FXZkzDl?=
 =?us-ascii?Q?PMqDO0NgIIAuHB1WNHUV3MVJS260SNmS/GfjcizHBIBOS0G0iUOsaRGF6tT6?=
 =?us-ascii?Q?Uu2dPaBW3ct2tQIM4cFyQ98z1oVsDNFzGMg5jZRdFD9ahpmwRVPi9B3aW0fV?=
 =?us-ascii?Q?WHVgUjJEMoynWH9DJjasWrwdUx1I86GCBT0cuEsd86bWcUewSGnMLGwpoit5?=
 =?us-ascii?Q?PuEbT+DtKKkFK4J9Hnsug6kN+FdX7m/A9r0Vwv8IpjI2eojDAd7P3gjnxfl7?=
 =?us-ascii?Q?0yWdKfLDS4bTUYUYs1L/tLHlBBHwvZD9OS305pc+XlR1YAykIPqllyIFpaqW?=
 =?us-ascii?Q?VYlrqJM/kbZ8rpky+SuFYrKtDEaquFRu75Pk1d7CnDLnyf87CZPLkEq5aY5e?=
 =?us-ascii?Q?cMp4gIl4WfOS7BYYvD1NdhK4zwN15K7eT4DbklF1C1COMrdFzYDrHRJzeAuT?=
 =?us-ascii?Q?TgfoQYN8ez9NV3rl2GH4iwDLicjr7azR9SLpk02apMk3ZVAjl2GtDp0WQ3QX?=
 =?us-ascii?Q?6VrYNDK6aoq7T4QcYY3cfE2Jf6ybvG6jWpWx86t85JTMkHqaSjt/gTMgmfSG?=
 =?us-ascii?Q?SfR/gDN/9orEgG0v0HLdtjA+Y/fz5lkFHbAae/R+pghJuys/lZKvLacQBTcq?=
 =?us-ascii?Q?C83ZVgZjVeY7iGv/rd2N5KKbKVgGSzuMI5D1yUud1ySmS9lUllPxQ5T1uuTJ?=
 =?us-ascii?Q?8KlaxGIyxzmcN5bIn+J4Kh3Ga44b9xW5PuB5KRZbR4vHzqFSz8Tw0lbJBwCx?=
 =?us-ascii?Q?0+fXizfBehXMEFADhZjBpbmt7WrmJkY+IrHHWy0mS1kl/wxBSaJ7KZHJMYaH?=
 =?us-ascii?Q?Kj7rRAjsH9imQr7PttnlAsPFpqpGS1VjF6qE?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2025 10:35:12.4054
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 61bd3c32-3f07-4d34-960d-08ddf1e80e0e
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CY4PEPF0000E9D3.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR19MB8557
X-Proofpoint-ORIG-GUID: rf6sidkpbkK8adc3wzR_O9M5OD2L0jc9
X-Authority-Analysis: v=2.4 cv=F9NXdrhN c=1 sm=1 tr=0 ts=68c3f764 cx=c_pps
 a=kYxjtQCH8jYJXwz0hAM5nw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=yJojWOMRYYMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=w1d2syhTAAAA:8
 a=9c0ZDFkCl_Fi-kAU5fEA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEyMDA5OSBTYWx0ZWRfX/duxCZxHfvN/
 sucCDgM/RRj3Ge23dfHbcc/1QzGjjJPq6thk2lRoTopFj+GgbBXnGbKDW9i0SlkVK8zdw1dDoYw
 ctf0y/PMgezH5dpBOFCzxOTvPtqPXtZ0e0R7raMXa1GTg7bkBnnELwFAAMFQyfiwpLM8TkQ1uYZ
 3INFI4hXx/itm1t0dX186i9K9LfA72kjRxl5rCXIUtc3TS0cUzpYZEtMYkucXBzCZVZ5zte/6AY
 vKHIEIwLXwiosyj0Aq9f7KQ4rD70OB2xDp3hMmoFqF7UF1FkQxFNaODkJVJRapjB2bxH1tUGtKd
 AVZDyTHviovtOgvz+FG2wh6LlA6ILcNx7tu2XWmqpNoOwmWnA8OUg7ho4oSs5A=
X-Proofpoint-GUID: rf6sidkpbkK8adc3wzR_O9M5OD2L0jc9
X-Proofpoint-Spam-Reason: safe

Parse the DisCo property to get the timeout for a Function Reset.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

New since v1.

 include/sound/sdca_function.h   |  3 +++
 sound/soc/sdca/sdca_functions.c | 10 ++++++++--
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/include/sound/sdca_function.h b/include/sound/sdca_function.h
index f2ce13162151..2e988a30481c 100644
--- a/include/sound/sdca_function.h
+++ b/include/sound/sdca_function.h
@@ -1323,6 +1323,8 @@ enum sdca_cluster_range {
  * @num_clusters: Number of Channel Clusters reported in this Function.
  * @busy_max_delay: Maximum Function busy delay in microseconds, before an
  * error should be reported.
+ * @reset_max_delay: Maximum Function reset delay in microseconds, before an
+ * error should be reported.
  */
 struct sdca_function_data {
 	struct sdca_function_desc *desc;
@@ -1335,6 +1337,7 @@ struct sdca_function_data {
 	int num_clusters;
 
 	unsigned int busy_max_delay;
+	unsigned int reset_max_delay;
 };
 
 static inline u32 sdca_range(struct sdca_control_range *range,
diff --git a/sound/soc/sdca/sdca_functions.c b/sound/soc/sdca/sdca_functions.c
index 76ef661a76f9..18dc50b23b73 100644
--- a/sound/soc/sdca/sdca_functions.c
+++ b/sound/soc/sdca/sdca_functions.c
@@ -2033,8 +2033,14 @@ int sdca_parse_function(struct device *dev, struct sdw_slave *sdw,
 	if (!ret)
 		function->busy_max_delay = tmp;
 
-	dev_info(dev, "%pfwP: name %s delay %dus\n", function->desc->node,
-		 function->desc->name, function->busy_max_delay);
+	ret = fwnode_property_read_u32(function_desc->node,
+				       "mipi-sdca-function-reset-max-delay", &tmp);
+	if (!ret)
+		function->reset_max_delay = tmp;
+
+	dev_info(dev, "%pfwP: name %s busy delay %dus reset delay %dus\n",
+		 function->desc->node, function->desc->name,
+		 function->busy_max_delay, function->reset_max_delay);
 
 	ret = find_sdca_init_table(dev, function_desc->node, function);
 	if (ret)
-- 
2.47.3

